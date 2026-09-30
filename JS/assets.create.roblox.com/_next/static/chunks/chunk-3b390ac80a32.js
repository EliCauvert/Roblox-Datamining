;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "ec77a196-5571-d3b2-5eb6-7769d2342587")
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
        s = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableBulkMakeupTokenCreation",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "showTaxonomyOnAvatarItemAnalyticsTab",
            defaultValue: !1
        });
    e.s(["enableAvatarCreationTokenCategories", 0, r, "enableBulkMakeupTokenCreation", 0, s, "enableCreatorShowcases", 0, n, "enableTaxonomyBasedCreatorDashboard", 0, a, "isAutoPublishPreferencesEnabled", 0, i, "showTaxonomyOnAvatarItemAnalyticsTab", 0, l])
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
        s = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
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
    e.s(["isAssetAccessRequestsEnabled", 0, n, "isAssetDependenciesViewerEnabled", 0, s, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, i, "isModelCustomThumbnailUploadEnabled", 0, r, "isPricingEligibilityV2Enabled", 0, l, "isPublishBeforeExposeEnabled", 0, o])
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
        s = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isTextDocumentEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
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
            name: "isMomentsPostCreationEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, l, "isMomentsPostCreationEnabled", 0, o, "isMomentsSitetestUrlParsingEnabled", 0, r, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, i, "isTextDocumentEnabled", 0, s])
}, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(540459),
        r = e.i(79187),
        s = e.i(814975),
        i = e.i(156071),
        l = e.i(881670),
        o = e.i(745873),
        u = e.i(361975);
    let d = (0, a.createContext)({
        isAffiliateProgramLoading: !1,
        requiresActionToJoinProgram: void 0,
        compliantWithAllUserRequirements: void 0,
        creatorMetadata: void 0,
        isCurrentUserGroupOwner: void 0,
        isGroupEligible: void 0
    });
    d.displayName = "AffiliateProgram";
    let c = (0, r.withTranslation)(e => {
        let {
            children: r
        } = e, {
            user: l
        } = (0, s.useAuthentication)(), c = (0, o.useCurrentGroup)(), [m, p] = (0, a.useState)(void 0), [h, f] = (0, a.useState)(), [y, v] = (0, a.useState)(), [g, A] = (0, a.useState)(), [b, T] = (0, a.useState)(), I = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == c ? void 0 : c.id) ? e : 0) !== 0
        }, [c]), [E, S] = (0, a.useState)(void 0), x = void 0 === m || void 0 === h || void 0 === y && I, C = (0, a.useCallback)(async () => {
            try {
                if (I && (null == c ? void 0 : c.id)) {
                    let e = await (0, u.getGroupCreatorMetadata)(c.id);
                    p(e);
                    return
                }
                if (!I && (null == l ? void 0 : l.id)) {
                    let e = await (0, u.getUserCreatorMetadata)();
                    p(e);
                    return
                }
            } catch (e) {
                return
            }
            p(null)
        }, [null == c ? void 0 : c.id, I, null == l ? void 0 : l.id]), w = (0, a.useCallback)(async () => {
            if (I && E || !I) try {
                let e = await (0, u.getRequirements)();
                f(e.requirements);
                return
            } catch (e) {
                return
            }
            f(null)
        }, [E, I]), k = (0, a.useCallback)(async () => {
            if (I && (null == c ? void 0 : c.id)) try {
                let e = await (0, u.getGroupEligibility)(c.id);
                v(e.isEligible)
            } catch (e) {
                v(!1)
            }
        }, [c, I]);
        (0, a.useEffect)(() => {
            x ? T(void 0) : I && !E ? T(!1) : T(!1 === g)
        }, [I, E, g, x]), (0, a.useEffect)(() => {
            (async () => {
                if (I && (null == c ? void 0 : c.id)) {
                    var e;
                    return null == (e = (await i.default.getGroupInfo(c.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && S(e === l.id)
            })
        }, [null == c ? void 0 : c.id, I, l]), (0, a.useEffect)(() => {
            x || !h || I && !E ? A(void 0) : A((null == h ? void 0 : h.length) === 0 || (null == h ? void 0 : h.length) === 1 && h[0] === n.Requirements.Payable)
        }, [E, I, x, h]), (0, a.useEffect)(() => {
            C()
        }, [C]), (0, a.useEffect)(() => {
            w()
        }, [w]), (0, a.useEffect)(() => {
            k()
        }, [k]);
        let D = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: x,
            requiresActionToJoinProgram: b,
            compliantWithAllUserRequirements: g,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != h ? h : void 0,
            isCurrentUserGroupOwner: E,
            isGroupEligible: null != y ? y : void 0
        }), [x, b, g, m, h, E, y]);
        return (0, t.jsx)(d.Provider, {
            value: D,
            children: r
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, c, "useAffiliateProgram", 0, function() {
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
            if (!a.ok && 500 === r && t < 2) return await new Promise(e => setTimeout(e, 2 ** (t + 1) * 500)), n(e, t + 1);
            if (500 === r && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let s = await a.json();
            if (!("access" in s)) throw Error('"access" not found in response');
            return s.access
        }, r = async () => await n("".concat(t, "/v1/upsell-feature-access?nameSpace=").concat(a, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted";
    e.s(["getAgeVerificationUpsellFeatureAccess", 0, r])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        n = e.i(416340),
        r = e.i(79187),
        s = e.i(335681),
        i = e.i(367808),
        l = e.i(686762),
        o = e.i(623983),
        u = e.i(748893),
        d = e.i(649114),
        c = e.i(15645),
        m = e.i(358763),
        p = e.i(889311),
        h = e.i(823062),
        f = e.i(881670),
        y = e.i(904969),
        v = e.i(906791);
    let g = (0, e.i(697973).makeStyles)()(e => ({
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
    var A = ((t = {}).Home = "home", t.Creations = "creations", t);
    let b = (0, r.withTranslation)(e => {
        let t, f, A, b, {
                trackingPage: T,
                alertRedesignVariant: I
            } = e,
            {
                isBannerVisible: E,
                isHighPriority: S,
                variant: x,
                dismissBanner: C
            } = (0, v.useAgeVerificationUpsellContext)(),
            {
                classes: w
            } = g(),
            k = (0, n.useRef)(null),
            {
                unifiedLogger: D
            } = (0, h.useUnifiedLoggerProvider)(),
            {
                translate: N
            } = (0, r.useTranslation)(),
            M = (0, n.useCallback)(() => {
                E && D.logImpressionEvent({
                    eventName: p.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: T,
                        variant: x,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [D, T, x, I, E]);
        (0, m.default)(k, M);
        let P = (0, n.useCallback)(() => {
                D.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "viewDetails",
                        variant: x,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [D, T, x, I]),
            L = (0, n.useCallback)(() => {
                D.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "callToAction",
                        variant: x,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [D, T, x, I]),
            F = (0, n.useCallback)(() => {
                D.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "dismiss",
                        variant: x,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                }), C()
            }, [D, C, T, x, I]);
        return ("establishTrust" === x ? (t = "Title.EstablishTrustBanner", f = "Label.EstablishTrustBanner2", A = y.ESTABLISH_TRUST_UPSELL_GET_STARTED_URL, b = y.ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL) : (t = "Title.AgeVerificationBanner", f = "Label.AgeVerificationBanner", A = y.AGE_VERIFICATION_UPSELL_GET_STARTED_URL, b = y.AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL), E) ? (0, a.jsx)("div", {
            ref: k,
            children: (0, a.jsxs)(s.Alert, {
                className: w.alertContainer,
                severity: "ageVerification" === x && S ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(u.Button, {
                    href: A,
                    onClick: L,
                    className: w.getStarted,
                    color: "inherit",
                    size: "small",
                    children: N("Label.AgeVerificationBannerGetStarted")
                }, "getStarted"), (0, a.jsx)(d.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: F,
                    children: (0, a.jsx)(c.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(i.AlertTitle, {
                    children: N(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: N(f)
                }), " ", (0, a.jsx)(l.Link, {
                    className: w.viewDetails,
                    href: b,
                    target: "_blank",
                    color: "inherit",
                    onClick: P,
                    children: N("Label.AgeVerificationBannerViewDetails")
                })]
            })
        }) : null
    }, [f.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, b, "AgeVerificationUpsellPage", () => A], 714039)
}, 904969, e => {
    "use strict";
    e.s(["AGE_VERIFICATION_UPSELL_BANNER_END_DATE", 0, "2030-01-01T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE", 0, "2026-01-21T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_START_DATE", 0, "2025-12-03T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693", "ESTABLISH_TRUST_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693"])
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(458451),
        r = e.i(889311),
        s = e.i(823062),
        i = e.i(814984),
        l = e.i(904969);
    let o = "CreatorHub.AgeVerificationBannerSettings",
        u = async () => {
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
                return u(), !1
            }
            let a = new Date;
            return e.getFullYear() === a.getFullYear() && e.getMonth() === a.getMonth() && e.getDate() === a.getDate()
        }, c = async () => {
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
        }, h = async () => await (0, i.getAgeVerificationUpsellFeatureAccess)() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: i
        } = e, [o, u] = (0, a.useState)(!0), [f, y] = (0, a.useState)("doNotShow"), {
            isFetched: v,
            user: g
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: A
        } = (0, s.useUnifiedLoggerProvider)(), {
            isHighPriority: b,
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
            await c(), u(!0)
        }, [u]);
        (0, a.useEffect)(() => {
            T && v && (null == g ? void 0 : g.id) && (async () => {
                let e = !1;
                try {
                    e = await d()
                } catch (e) {
                    A.logErrorEvent({
                        eventName: r.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                u(e);
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
        }, [T, v, g, A]);
        let E = (0, a.useMemo)(() => {
            let e = T && "doNotShow" !== f;
            return {
                isBannerVisible: e && !o,
                isBannerEligible: e,
                isHighPriority: b,
                variant: "doNotShow" !== f ? f : "ageVerification",
                dismissBanner: I
            }
        }, [T, f, o, b, I]);
        return (0, t.jsx)(m.Provider, {
            value: E,
            children: i
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
        } = e, [s, i] = (0, a.useState)(), l = e => {
            i(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: s,
            updateDroppedFile: l
        }), [s]);
        return (0, t.jsx)(n.default.Provider, {
            value: o,
            children: r
        })
    }])
}, 799972, e => {
    "use strict";
    var t = e.i(376618),
        a = e.i(671376);
    let {
        docs: n
    } = e.i(829425).creatorHub, r = {
        [a.Asset.Decal]: t.AssetType.Decal,
        [a.Asset.Audio]: t.AssetType.Audio,
        [a.Asset.Video]: t.AssetType.Video,
        [a.Asset.TShirt]: t.AssetType.Tshirt,
        [a.Asset.Shirt]: t.AssetType.Shirt,
        [a.Asset.Pants]: t.AssetType.Pants,
        [a.Asset.AvatarBackground]: t.AssetType.AvatarBackground
    }, s = {
        [a.Asset.Decal]: "Message.DecalResolutionLimits",
        [a.Asset.Audio]: "Message.AudioLimits",
        [a.Asset.AvatarBackground]: "Message.AvatarBackgroundUploadRequirements"
    }, i = [a.Asset.Shirt, a.Asset.Pants, a.Asset.Video, a.Asset.TShirt, a.Asset.AvatarBackground], l = [a.Asset.Audio, a.Asset.Video];
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
            default:
                return []
        }
    }, "assetTypeInfoTextMessage", 0, s, "dashboardAssetTypeToOpenCloudAssetType", 0, r, "getInfoUrl", 0, e => {
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
    }, "isCreateAssetAvailable", 0, e => {
        switch (e) {
            case a.Asset.Audio:
            case a.Asset.Decal:
            case a.Asset.Video:
            case a.Asset.TShirt:
            case a.Asset.Shirt:
            case a.Asset.Pants:
            case a.Asset.AvatarBackground:
                return !0;
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
                return 20;
            case a.Asset.Video:
                return 30;
            default:
                return 0
        }
    }, "maxResolution", 0, e => e === a.Asset.Video ? "4096x2160" : null, "purchasableAssetTypes", 0, i, "quotaEnabledAssetTypes", 0, l])
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
        s = e.i(41466),
        i = e.i(197649),
        l = e.i(79187),
        o = e.i(345886),
        u = e.i(29929),
        d = e.i(889311),
        c = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        h = e.i(114209),
        f = e.i(373736),
        y = e.i(917852),
        v = e.i(576069),
        g = e.i(663563);
    let A = "".concat("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/assets", "/home/publish_eligibility_banner.webp"),
        b = (0, l.withTranslation)(e => {
            var b;
            let {
                universeId: T,
                showCallToAction: I = !0
            } = e, E = (0, n.useRouter)(), {
                translateWithNamespace: S
            } = (0, l.useTranslation)(), {
                params: x,
                isFetched: C
            } = (0, m.useIXPParameters)(u.IXPLayers.CreatorHubCreationsPermission), w = x[u.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: k
            } = (0, h.useCurrentGame)(), D = null == k ? void 0 : k.id, N = null != T ? T : D && D > 0 ? D : void 0, {
                data: M,
                isLoading: P,
                isFetching: L
            } = (0, v.useCreatorEligibility)(), F = (0, a.useRef)(!1), [U, _] = (0, a.useState)(!1), V = (null == M ? void 0 : M.ageBracket) === r.AgeBracketEnum.Over18, B = (null == M ? void 0 : M.ageBracket) === r.AgeBracketEnum.Between13And18, R = null != (b = null == M ? void 0 : M.creatorEligibility.includes(r.CreatorEligibilityEnum.IdVerified)) && b, O = V || B, j = C && w && !(P || L) && !!M && !R;
            (0, a.useEffect)(() => {
                j && !F.current && (F.current = !0, c.default.logImpressionEvent({
                    eventName: d.default.AudienceReachGrowthOpportunitiesBannerImpression,
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
                (c.default.logClickEvent({
                    eventName: d.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...N ? {
                            universeId: String(N)
                        } : {}
                    }
                }), B) ? _(!0): O || E.push("/settings/eligibility/publishing-permissions")
            }, [j, B, E, O, N]);
            return j ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, i.clsx)(g.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
                    children: [(0, t.jsx)("img", {
                        src: A,
                        alt: "",
                        "aria-hidden": !0,
                        className: (0, i.clsx)("block absolute width-full height-full"),
                        style: {
                            top: 0,
                            left: 0
                        },
                        onError: e => {
                            e.currentTarget.style.display = "none"
                        }
                    }), (0, t.jsxs)("div", {
                        className: (0, i.clsx)(g.default.heroTextContent, "dark-theme relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [S(p.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: S(p.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, i.clsx)(g.default.buttonRow, "flex gap-small"),
                            children: I ? V ? (0, t.jsx)(s.Button, {
                                as: "a",
                                href: y.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: S(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(s.Button, {
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: S(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), B ? (0, t.jsx)(f.default, {
                    open: U,
                    onOpenChange: _,
                    onContinueWithId: () => {
                        window.open(y.idVerificationActionUrl, "_blank", "noopener,noreferrer"), _(!1)
                    },
                    onAddParent: () => {
                        window.open(y.parentLinkActionUrl, "_blank", "noopener,noreferrer"), _(!1)
                    }
                }) : null]
            }) : null
        }, [p.TranslationNamespace.AudienceReach, p.TranslationNamespace.PublicPublish]);
    e.s(["default", 0, b])
}, 899441, e => {
    "use strict";
    var t, a, n = e.i(102211),
        r = e.i(272593),
        s = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.TextDocument = "TextDocument", t.Video = "Video", t),
        i = ((a = {}).Group = "groups", a.User = "users", a);
    let l = new n.CreatorInventoryApi((0, r.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => s, "CreatorInventoryScopeType", () => i, "default", 0, l])
}, 445550, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(309999),
        n = e.i(307529),
        r = e.i(272593);
    let s = {
            [n.default.Model]: a.CategoryType.Model,
            [n.default.Plugin]: a.CategoryType.Plugin
        },
        i = {
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
            async getCreations(e, t, a, n, r, i, l) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: s[t],
                    limit: n,
                    cursor: r,
                    separateModelsAndPackages: i,
                    includeSharedAssets: l
                }) : this.toolboxApi.toolboxGetUserCreationAssets({
                    userId: e,
                    assetType: s[t],
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
    e.s(["assetTypeIdToAssetType", 0, i, "default", 0, l, "toolboxServiceItemDetailsLimit", 0, 30])
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
        s = new a.UsersApi((0, n.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: s
    }, "default", 0, r])
}, 131385, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(780880),
        n = e.i(339544),
        r = e.i(643093),
        s = e.i(130778),
        i = e.i(157310),
        l = e.i(913893),
        o = e.i(198015),
        u = e.i(671376),
        d = e.i(117236);
    let c = function() {
        let e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
            a = (0, i.useQuery)({
                queryKey: ["getTaxonomyCategories", o.CategoryDomain.NUMBER_3],
                queryFn: () => l.default.getItemCategories(o.CategoryDomain.NUMBER_3),
                enabled: e,
                staleTime: 3e5
            }),
            n = (0, i.useQuery)({
                queryKey: ["getAvatarItemsEntryPointAssetTypes"],
                queryFn: d.getAvatarItemsEntryPointAssetTypes,
                enabled: e,
                staleTime: 3e5
            }),
            s = n.data,
            c = (0, t.useMemo)(() => {
                var e, t;
                return {
                    enableMakeupAssets: null != (e = null == s ? void 0 : s.has(u.Asset.EyeMakeup)) && e,
                    enableAvatarBackgrounds: null != (t = null == s ? void 0 : s.has(u.Asset.AvatarBackground)) && t
                }
            }, [s]),
            m = (0, t.useMemo)(() => (0, r.transformCreatorDashboardTree)(a.data, c), [a.data, c]),
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
        var i, l, o;
        let [{
            activeTab: u,
            filterIndex: d
        }] = (0, a.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: m,
            categories: p,
            isLoading: h
        } = c(e), f = (0, s.isAllAssetTypesActiveTab)(u) || (0, s.isRecentsActiveTab)(u) || (0, s.isAvatarLooksActiveTab)(u) ? void 0 : null != (i = (0, s.parseTaxonomyActiveTab)(u)) ? i : null == (o = m[0]) ? void 0 : o.taxonomyKey, y = (0, t.useMemo)(() => (0, r.findL1Category)(p, f), [p, f]), v = (0, t.useMemo)(() => (0, r.buildTaxonomyL2Options)(y), [y]), g = parseInt(null != (l = null == d ? void 0 : d.toString()) ? l : "", 10), A = (0, n.isValidIndex)(g, v) ? g : 0, b = (0, t.useMemo)(() => {
            if (y) return v.length > 0 ? v[A] : y.webStableId ? (0, r.categoryToDropdown)(y) : void 0
        }, [y, v, A]);
        return {
            l1Options: m,
            activeL1Key: f,
            activeL1Node: y,
            l2Options: v,
            filterIndex: A,
            selection: b,
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
        }] = (0, t.useQueryParams)(["activeTab"]), s = (0, a.default)(), i = s && (0, n.isTaxonomyActiveTab)(r), l = s && (0, n.isAvatarLooksActiveTab)(r);
        return {
            canUseTaxonomy: s && (i || (0, n.isTaxonomyEligibleAssetTab)(e)),
            isTaxonomyMode: i,
            isTaxonomyView: i && !(0, n.isAllAssetTypesActiveTab)(r) && !(0, n.isRecentsActiveTab)(r) && !(0, n.isAvatarLooksActiveTab)(r),
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
    let s = new Set([2, 11, 12]),
        i = new Set([76, 77, 88, 89, 90]),
        l = new Set([92]),
        o = new Set([4]);

    function u(e, t) {
        var a;
        return (null != (a = e.assetTypeIds) ? a : []).some(e => t.has(e))
    }

    function d(e) {
        var t;
        return !0 === e.isPublishable || !!u(e, l) || (null != (t = e.bundleTypeIds) ? t : []).some(e => o.has(e))
    }

    function c(e) {
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
        let a = (null != (t = null == e ? void 0 : e.children) ? t : []).filter(e => e.webStableId).map(c);
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
            var a, n, c;
            let m = null != (a = e.children) ? a : [];
            if (0 === m.length) {
                if (!d(e) || u(e, l) && !t.enableAvatarBackgrounds || !e.webStableId) return;
                o.push({
                    key: e.webStableId,
                    name: null != (c = e.name) ? c : "",
                    webStableId: e.webStableId,
                    assetTypeIds: e.assetTypeIds,
                    children: []
                });
                return
            }
            let p = [],
                h = !1;
            m.forEach(e => {
                if (u(e, i)) {
                    t.enableMakeupAssets && (h = !0, p.push(e));
                    return
                }
                if (d(e)) {
                    if (u(e, s)) return void r.push(e);
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
        s = e.i(692587),
        i = e.i(117236);
    let l = "AvatarItems",
        o = "".concat(l, "-"),
        u = r.Asset.HairAccessory;

    function d(e) {
        let t = (0, s.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let c = "looks",
        m = new Set(null != (t = null == (n = i.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = n.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

    function p(e) {
        return m.has(e)
    }
    e.s(["ALL_ASSET_TYPES_L1_KEY", 0, "all", "AVATAR_ITEMS_ACTIVE_TAB", 0, l, "AVATAR_LOOKS_L1_KEY", 0, c, "TAXONOMY_HOST_ASSET", 0, u, "buildTaxonomyActiveTab", 0, function(e) {
        return e ? "".concat(o).concat(e) : l
    }, "isAllAssetTypesActiveTab", 0, function(e) {
        return "all" === d(e)
    }, "isAvatarLooksActiveTab", 0, function(e) {
        return d(e) === c
    }, "isRecentsActiveTab", 0, function(e) {
        return "Recents" === (0, s.readQueryValue)(e) || "recents" === d(e)
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, s.readQueryValue)(e);
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
        s = e.i(671376);
    let i = {
            [s.Asset.Place]: a.SearchSortParameter.LastUpdated,
            [s.Asset.UpcomingEvent]: n.EventSortBy.StartUtc,
            [s.Asset.PastEvent]: n.EventSortBy.StartUtc,
            [s.Asset.DraftEvent]: n.EventSortBy.StartUtc
        },
        l = {
            sort: i,
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
    o.displayName = "Filters", e.s(["default", 0, o, "defaultAssetsSort", 0, i])
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
    var t, a = e.i(102211),
        n = e.i(899441),
        r = e.i(361738),
        s = e.i(671376),
        i = ((t = {}).All = "All", t);
    let l = [n.CreatorInventoryAssetType.Model, n.CreatorInventoryAssetType.Plugin, n.CreatorInventoryAssetType.Audio, n.CreatorInventoryAssetType.Decal, n.CreatorInventoryAssetType.Image, n.CreatorInventoryAssetType.Video, n.CreatorInventoryAssetType.Mesh, n.CreatorInventoryAssetType.MeshPart, n.CreatorInventoryAssetType.Animation],
        o = [...l, n.CreatorInventoryAssetType.TextDocument],
        u = new Set([n.CreatorInventoryAssetType.Audio, n.CreatorInventoryAssetType.Decal, n.CreatorInventoryAssetType.MeshPart, n.CreatorInventoryAssetType.TextDocument, n.CreatorInventoryAssetType.Video]),
        d = new Set([...u, n.CreatorInventoryAssetType.Image]),
        c = new Set(o),
        m = new Set([n.CreatorInventoryAssetType.TextDocument]),
        p = new Set(["All", r.CreatorInventorySourceType.Created, r.CreatorInventorySourceType.Purchased, r.CreatorInventorySourceType.Shared]),
        h = new Set([s.Asset.Animation, s.Asset.Audio, s.Asset.Decal, s.Asset.Image, s.Asset.Mesh, s.Asset.MeshPart, s.Asset.Model, s.Asset.Plugin, s.Asset.Video]),
        f = {
            [n.CreatorInventoryAssetType.Animation]: s.Asset.Animation,
            [n.CreatorInventoryAssetType.Audio]: s.Asset.Audio,
            [n.CreatorInventoryAssetType.Decal]: s.Asset.Decal,
            [n.CreatorInventoryAssetType.Image]: s.Asset.Image,
            [n.CreatorInventoryAssetType.Mesh]: s.Asset.Mesh,
            [n.CreatorInventoryAssetType.MeshPart]: s.Asset.MeshPart,
            [n.CreatorInventoryAssetType.Model]: s.Asset.Model,
            [n.CreatorInventoryAssetType.Plugin]: s.Asset.Plugin,
            [n.CreatorInventoryAssetType.TextDocument]: s.Asset.TextDocument,
            [n.CreatorInventoryAssetType.Video]: s.Asset.Video
        },
        y = {
            [n.CreatorInventoryAssetType.Animation]: a.AssetType.Animation,
            [n.CreatorInventoryAssetType.Audio]: a.AssetType.Audio,
            [n.CreatorInventoryAssetType.Decal]: a.AssetType.Decal,
            [n.CreatorInventoryAssetType.Image]: a.AssetType.Image,
            [n.CreatorInventoryAssetType.Mesh]: a.AssetType.Mesh,
            [n.CreatorInventoryAssetType.MeshPart]: a.AssetType.MeshPart,
            [n.CreatorInventoryAssetType.Model]: a.AssetType.Model,
            [n.CreatorInventoryAssetType.Plugin]: a.AssetType.Plugin,
            [n.CreatorInventoryAssetType.TextDocument]: a.AssetType.TextDocument,
            [n.CreatorInventoryAssetType.Video]: a.AssetType.Video
        },
        v = {
            3: n.CreatorInventoryAssetType.Audio,
            10: n.CreatorInventoryAssetType.Model,
            13: n.CreatorInventoryAssetType.Decal,
            24: n.CreatorInventoryAssetType.Animation,
            38: n.CreatorInventoryAssetType.Plugin,
            40: n.CreatorInventoryAssetType.MeshPart,
            62: n.CreatorInventoryAssetType.Video,
            93: n.CreatorInventoryAssetType.TextDocument,
            ANIMATION: n.CreatorInventoryAssetType.Animation,
            ASSET_TYPE_ANIMATION: n.CreatorInventoryAssetType.Animation,
            ASSET_TYPE_AUDIO: n.CreatorInventoryAssetType.Audio,
            ASSET_TYPE_DECAL: n.CreatorInventoryAssetType.Decal,
            ASSET_TYPE_IMAGE: n.CreatorInventoryAssetType.Image,
            ASSET_TYPE_MESH: n.CreatorInventoryAssetType.Mesh,
            ASSET_TYPE_MESH_PART: n.CreatorInventoryAssetType.MeshPart,
            ASSET_TYPE_MODEL: n.CreatorInventoryAssetType.Model,
            ASSET_TYPE_PLUGIN: n.CreatorInventoryAssetType.Plugin,
            ASSET_TYPE_TEXT_DOCUMENT: n.CreatorInventoryAssetType.TextDocument,
            ASSET_TYPE_VIDEO: n.CreatorInventoryAssetType.Video,
            AUDIO: n.CreatorInventoryAssetType.Audio,
            DECAL: n.CreatorInventoryAssetType.Decal,
            IMAGE: n.CreatorInventoryAssetType.Image,
            MESH: n.CreatorInventoryAssetType.Mesh,
            MESHPART: n.CreatorInventoryAssetType.MeshPart,
            MODEL: n.CreatorInventoryAssetType.Model,
            PLUGIN: n.CreatorInventoryAssetType.Plugin,
            TEXTDOCUMENT: n.CreatorInventoryAssetType.TextDocument,
            VIDEO: n.CreatorInventoryAssetType.Video
        },
        g = {
            createdDetails: r.CreatorInventorySourceType.Created,
            purchasedDetails: r.CreatorInventorySourceType.Purchased,
            sharedDetails: r.CreatorInventorySourceType.Shared
        },
        A = {
            [a.State.Active]: "Active",
            [a.State.Archived]: "Archived"
        },
        b = e => !0 === e ? o : l,
        T = e => {
            if (null == e) return;
            let t = e instanceof Date ? e : new Date(e);
            return Number.isNaN(t.getTime()) ? void 0 : t
        };
    e.s(["DevelopmentItemsSourceFilter", () => i, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: n.CreatorInventoryScopeType.Group,
        id: t
    } : null != e ? {
        type: n.CreatorInventoryScopeType.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        assetTypes: [y[t]],
        ...e.type === n.CreatorInventoryScopeType.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(r.CreatorInventorySourceType.Created), "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getDevelopmentItemsAssetTypes", 0, b, "getDevelopmentItemsSearchAssetTypes", 0, (e, t) => [e, ...b(t).filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => f[e], "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: n
        } = e;
        return t.trim().length > 0 || a || n !== r.CreatorInventorySourceType.Created
    }, "hasDevelopmentItemCreatorStorePage", 0, e => e !== n.CreatorInventoryAssetType.TextDocument, "hasDevelopmentItemThumbnail", 0, e => e !== n.CreatorInventoryAssetType.TextDocument, "isDevelopmentItemArchivedViewAvailable", 0, e => null != e && d.has(e), "isDevelopmentItemAsset", 0, (e, t) => e === s.Asset.TextDocument ? !0 === t : h.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && u.has(e), "isDevelopmentItemsAssetTypeSelection", 0, (e, t) => null != e && !!c.has(e) && (!m.has(e) || !0 === t), "isDevelopmentItemsSourceSelection", 0, e => null != e && p.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, n, r, s, i, l;
        let o, u = null == (n = e.assetItem) ? void 0 : n.asset;
        if (null == u) return;
        let d = "number" == typeof u.assetId ? u.assetId : Number.parseInt(null != (t = u.assetId) ? t : "", 10);
        if (Number.isNaN(d)) return;
        let c = null == (r = u.displayName) ? void 0 : r.trim();
        return {
            id: null != (a = e.path) ? a : d.toString(),
            assetId: d,
            assetType: (e => {
                if (null != e) return v[e.toString().toUpperCase()]
            })(u.assetType),
            created: T(u.createTime),
            isPackage: (null == (s = e.assetItem) ? void 0 : s.isPackage) === !0,
            name: null == c || 0 === c.length ? d.toString() : c,
            sources: (l = null == (i = e.assetItem) ? void 0 : i.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let n = g[t];
                    null != n && o.add(n)
                })
            }), [...o]),
            state: null == u.state ? void 0 : A[u.state],
            updated: T(u.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let n = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => e.assetType === a && !n.has(e.assetId))]
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
}, 427149, e => {
    "use strict";
    var t = e.i(799972),
        a = e.i(671376),
        n = e.i(759283),
        r = e.i(475360),
        s = e.i(949599),
        i = e.i(117236);
    let l = i.default.reduce((e, t) => {
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
            menuItem: i.default[0]
        },
        u = a.Asset.EyeMakeup,
        d = a.Asset.AvatarLooks,
        c = a.Asset.AvatarBackground,
        m = a.Asset.Showcase;
    e.s(["default", 0, {
        isMenuItemEnabled(e, n, s, i, l, o, p, h) {
            var f, y;
            return ((null == e ? void 0 : e.type) !== a.Asset.TextDocument || !!h) && ((null == e ? void 0 : e.type) === a.Asset.AllCatalogAsset || ((null == e ? void 0 : e.type) === a.Asset.SharedExperiences ? null == s : (null == e ? void 0 : e.type) === a.Asset.Moments ? null != o && o : (null == e ? void 0 : e.itemType) === r.Item.Bundle || (null == e ? void 0 : e.type) === d || ((null == e ? void 0 : e.type) === c ? null != (f = null == l ? void 0 : l.has(e.type)) && f : (null == e ? void 0 : e.type) === m ? null != p && p : (null == e ? void 0 : e.type) === u ? null != (y = null == l ? void 0 : l.has(null == e ? void 0 : e.type)) && y : (null == e ? void 0 : e.type) === void 0 || !!(0, t.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === i || null != i && i)))
        },
        getValidMenuState(e, t, a, n, r, s, i, l, o) {
            var d, m, p, h, f, y;
            let v, g, A = (null == (d = t.submenuItem) ? void 0 : d.type) !== u && (null == (m = t.submenuItem) ? void 0 : m.type) !== c || void 0 !== s;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, n, r, s, i, l, o)) {
                if (void 0 !== t.submenuItem && A && !this.isMenuItemEnabled(t.submenuItem, a, n, r, s, i, l, o))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            u = 0;
                        for (; u < (null == (h = t.menuItem.submenuItems) ? void 0 : h.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[u], a, n, r, s, i, l, o)) {
                                e = u;
                                break
                            }
                            u += 1
                        }
                        v = t.menuItem, g = null == (f = t.menuItem.submenuItems) ? void 0 : f[e]
                    } else v = t.menuItem, g = null == (y = t.menuItem.submenuItems) ? void 0 : y[0]
            } else [v] = e, g = null == (p = e[0].submenuItems) ? void 0 : p[0];
            return v ? {
                menuItem: v,
                submenuItem: g
            } : t
        },
        isAssetTypeDirectlyArchivable: e => i.allowedAssetTypesForDirectArchiving.has(e),
        isAssetTypeArchivable(e, t) {
            if (void 0 !== t && s.AvatarMenuMap[e]) {
                let a = s.AvatarMenuMap[e][t],
                    n = null == a ? void 0 : a.assetType;
                return (null == a ? void 0 : a.bundleType) !== void 0 || void 0 !== n && i.allowedAssetTypesForArchiving.has(n)
            }
            return i.allowedAssetTypesForArchiving.has(e)
        },
        isAssetTypeSortable: e => i.allowedAssetTypesForSorting.has(e),
        isItemTypeUploadable: e => i.allowedItemTypesForUploading.has(e),
        getAssetFullNameKey: e => n.assetFullNameKeys[e],
        getItemFullNameKey: e => n.itemFullNameKeys[e],
        getAssetType: e => e.submenuItem ? e.submenuItem.type : e.menuItem.type,
        getItemType(e) {
            return e.submenuItem && e.submenuItem.itemType ? e.submenuItem.itemType : e.menuItem.itemType ? e.menuItem.itemType : n.assetTypeToItemType[this.getAssetType(e)]
        },
        getMenuState(e, t) {
            var a;
            return e && t.includes(e) ? o : e && null != (a = l.get(e)) ? a : o
        }
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
        s = e.i(79187);
    let i = {
        info: "Info",
        warning: "Warning",
        error: "Error"
    };
    e.s(["default", 0, e => {
        let {
            alertTitle: a,
            alertDescription: l,
            severity: o,
            externalLink: u,
            linkLabel: d,
            allowCloseDialog: c,
            onDismiss: m
        } = e, {
            translate: p
        } = (0, s.useTranslation)(), [h, f] = (0, t.useState)(!0);
        if (!h) return null;
        let y = c ? {
            closeLabel: p("Action.Close"),
            onDismiss: () => {
                null == m || m(), f(!1)
            }
        } : {
            hasCloseAffordance: !1
        };
        return (0, n.jsx)(r.Alert, {
            severity: i[o],
            variant: "Feedback",
            className: "width-full",
            primaryActionLabel: d,
            primaryActionHref: u,
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
            onDragActiveHandler: s,
            onDragLeaveHandler: i,
            size: l,
            multiple: o,
            children: u,
            accept: d,
            ...c
        } = e, m = (0, a.useRef)(null), p = () => {
            m.current && m.current.click()
        }, h = e => {
            ((e instanceof Event ? e instanceof KeyboardEvent : e.nativeEvent && e.nativeEvent instanceof KeyboardEvent) ? ["Spacebar", " ", "Enter"].includes(e.key) : (console.info("The event passed in is not a keyboard event, are you using the handler in the wrong place?"), !1)) && (e.preventDefault(), p())
        }, f = u ? u(p, h, e => {
            e.preventDefault();
            let {
                dataTransfer: {
                    files: t
                }
            } = e;
            r && r(t)
        }, e => {
            e.preventDefault(), s && s()
        }, e => {
            e.preventDefault(), i && i()
        }) : null;
        return (0, t.jsxs)("div", {
            className: n,
            children: [f, (0, t.jsx)("input", {
                ...c,
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
        r = e.i(751846),
        s = e.i(623983),
        i = e.i(345886),
        l = e.i(697973),
        o = e.i(361965),
        u = e.i(686762),
        d = e.i(589418),
        c = e.i(699848),
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
        v = {
            compact: 32,
            medium: 48,
            large: 64
        },
        g = {
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
                    borderRadius: v[a]
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
                targetType: v,
                displayNameOverride: g,
                adornment: b,
                label: T,
                disabled: I,
                variant: E = "medium",
                disableLink: S = !1,
                obfuscate: x = !1,
                hideThumbnail: C = !1,
                hideSecondaryLabel: w = !1,
                textVariant: k = "primary",
                labelTooltip: D,
                secondaryLabelClassName: N
            } = e,
            {
                classes: {
                    container: M,
                    avatarContainer: P,
                    thumbnailItemContainer: L,
                    thumbnailBackground: F,
                    userBorderRadius: U,
                    nonUserBorderRadius: _,
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
            H = (0, a.useMemo)(() => v === p.default.User ? r.ThumbnailTypes.avatarHeadshot : v === p.default.Group ? r.ThumbnailTypes.groupIcon : "Ugc" === v ? r.ThumbnailTypes.assetThumbnail : r.ThumbnailTypes.universeThumbnail, [v]),
            K = (0, a.useMemo)(() => {
                if (!S && y.id && !x) {
                    if (v === p.default.User) return h.www.getUserUrl(y.id);
                    if (v === p.default.Group) return h.www.getGroupUrl(y.id);
                    if ("Experience" === v) {
                        let e = "rootPlaceId" in y ? y.rootPlaceId : void 0;
                        return e ? h.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === v) return h.www.getCatalogUrl(y.id)
                }
            }, [S, y, x, v]);
        g ? l = g : v === p.default.User ? l = "displayName" in y ? y.displayName : void 0 : "Ugc" !== v && (l = "name" in y ? y.name : void 0);
        let q = !g && (v === p.default.User && !("displayName" in y && y.displayName) || "Ugc" === v),
            z = (0, a.useMemo)(() => {
                let e;
                return (0, t.jsxs)(i.Grid, {
                    container: !0,
                    direction: "row",
                    alignItems: "center",
                    wrap: "wrap",
                    children: [q ? (0, t.jsx)(d.Skeleton, {
                        animate: !0,
                        variant: "text",
                        width: 192,
                        height: 22
                    }) : (0, t.jsxs)(i.Grid, {
                        container: !0,
                        direction: "row",
                        alignItems: "center",
                        wrap: "wrap",
                        columnGap: 1,
                        children: [(0, t.jsx)(s.Typography, {
                            className: O,
                            variant: "secondary" === k ? "body1" : "compact" === E ? "captionHeader" : "large" === E ? "h2" : "h5",
                            color: I ? "disabled" : "inherit",
                            children: x ? G("Label.Other") : l
                        }), T && T.length > 0 && (0, t.jsx)(m.Tooltip, {
                            arrow: !0,
                            title: D,
                            placement: "right",
                            enterTouchDelay: 0,
                            leaveTouchDelay: 3e3,
                            children: (0, t.jsx)(c.Chip, {
                                color: "secondary",
                                label: T,
                                size: "small",
                                variant: "filled"
                            })
                        })]
                    }), !w && (0, t.jsxs)(t.Fragment, {
                        children: [v === p.default.User && (0, t.jsx)(t.Fragment, {
                            children: "name" in y && !y.name ? (0, t.jsx)(d.Skeleton, {
                                animate: !0,
                                variant: "text",
                                width: 192,
                                height: 20
                            }) : (0, t.jsx)(s.Typography, {
                                variant: "secondary" === k ? "body2" : "captionBody",
                                className: j(O, {
                                    [B]: void 0 === N && ("secondary" === k || "compact" === E)
                                }),
                                color: I ? "disabled" : "inherit",
                                children: (e = x ? G("Label.Other") : "@".concat("name" in y ? y.name : ""), N ? (0, t.jsx)("span", {
                                    className: N,
                                    children: e
                                }) : e)
                            })
                        }), (v === p.default.Group || "Experience" === v) && (0, t.jsx)(s.Typography, {
                            variant: "captionBody",
                            className: j(O, {
                                [B]: void 0 === N && ("secondary" === k || "compact" === E)
                            }),
                            color: I ? "disabled" : "inherit",
                            children: N ? (0, t.jsx)("span", {
                                className: N,
                                children: x ? G("Label.Other") : y.id
                            }) : x ? G("Label.Other") : y.id
                        })]
                    })]
                })
            }, [q, l, v, y, O, I, x, G, T, w, j, B, k, E, D, N]);
        return (0, t.jsx)(i.Grid, {
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
                height: f[E]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(i.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!C && (0, t.jsx)(i.Grid, {
                        item: !0,
                        className: L,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: j(P, {
                                [U]: v === p.default.User,
                                [_]: v !== p.default.User,
                                [R]: I
                            }),
                            children: (0, t.jsx)(r.Thumbnail2d, {
                                targetId: y.id,
                                type: H,
                                imgClassName: F,
                                alt: "thumbnail",
                                returnPolicy: r.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(i.Grid, {
                        container: !0,
                        direction: "column",
                        className: M,
                        children: (0, t.jsx)(i.Grid, {
                            item: !0,
                            children: S || x ? z : (0, t.jsx)(u.Link, {
                                href: K,
                                className: V,
                                color: "inherit",
                                children: z
                            })
                        })
                    })]
                }), b]
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
    e.s(["default", 0, function(e, s) {
        var i;
        let l = null != (i = null == s ? void 0 : s.cacheOnly) && i,
            [o, u] = (0, t.useState)(() => l ? {
                params: n(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == s ? void 0 : s.restoreInitialValueFromCache) ? n(e) : {},
                status: "initial",
                isFetched: !1
            });
        return (0, t.useEffect)(() => {
            l || (async () => {
                let t = {};
                try {
                    u(e => ({
                        ...e,
                        status: "loading"
                    })), t = await (0, a.fetchIXPParametersForCurrentUser)(e), u({
                        params: t,
                        isFetched: !0,
                        status: "success"
                    }), r(e, t)
                } catch (e) {
                    u(e => ({
                        ...e,
                        isFetched: !0,
                        status: "error"
                    }))
                }
            })()
        }, []), o
    }, "getValueFromStorage", 0, n, "writeValueToStorage", 0, r])
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
        let s = null != e ? e : {};
        return {
            mode: "content",
            size: null != (t = s.size) ? t : "Medium",
            isModal: null == (a = s.isModal) || a,
            hasCloseAffordance: void 0 !== s.closeLabel,
            closeLabel: s.closeLabel,
            hasMarginTop: s.hasMarginTop,
            hasMarginBottom: s.hasMarginBottom,
            hasDescription: s.hasDescription,
            shouldUnmountOnClose: null == (n = s.shouldUnmountOnClose) || n
        }
    }
    let r = n(),
        s = {
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
    e.s(["DEFAULT_RESOLVED_CONTENT_OPTIONS", 0, r, "dialogStore", 0, s])
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
                let s = n.getSnapshot().current;
                null == s || null == (t = (r = s.props).onClose) || t.call(r), a += 1, n.setState({
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
            hasNextPage: s,
            fetchNextPage: i,
            fetchLimit: l = r
        } = a, o = (0, t.useMemo)(() => {
            let t = n * r;
            return e.slice(t, t + r)
        }, [e, n, r]), u = (n + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            u && s && (null == i || i())
        }, [u, s, i]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: n = 50,
            resetKey: r
        } = e, [s, i] = (0, t.useState)(0), [l, o] = (0, t.useState)(n), [u, d] = (0, t.useState)(r);
        r !== u && (d(r), i(0));
        let c = Math.max(0, Math.ceil(a / l) - 1),
            m = Math.min(s, c);
        return {
            page: m,
            rowsPerPage: l,
            onPageChange: (0, t.useCallback)((e, t) => {
                i(Math.max(0, Math.min(t, c)))
            }, [c]),
            onRowsPerPageChange: (0, t.useCallback)(e => {
                o("number" == typeof e ? e : parseInt(e.target.value, 10)), i(0)
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
            intervalMs: s = 1e3
        } = e, i = (0, t.useRef)(n);
        i.current = n, (0, t.useEffect)(() => {
            if (!a || r) return;
            i.current();
            let e = setInterval(() => {
                i.current()
            }, s);
            return () => clearInterval(e)
        }, [a, r, s])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(602635),
        n = e.i(79187),
        r = e.i(623983),
        s = e.i(345886),
        i = e.i(697973),
        l = e.i(260782);
    let o = (0, i.makeStyles)()(e => ({
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
            header: i,
            items: u,
            icon: d,
            activeKey: c,
            defaultExpanded: m,
            headerAction: p
        } = e, {
            classes: h
        } = o(), {
            ready: f
        } = (0, n.useTranslation)();
        return f ? (0, t.jsxs)(s.Grid, {
            classes: {
                root: h.container
            },
            children: [i && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(s.Grid, {
                    classes: {
                        root: h.headerContainer
                    },
                    children: [d && (0, t.jsx)(s.Grid, {
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
                            children: i
                        })
                    }), p && (0, t.jsx)(s.Grid, {
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
            }), u.length > 0 && (0, t.jsx)(a.NavigationTree, {
                selected: c,
                defaultExpanded: m,
                children: u.map(e => {
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
        s = e.i(623983);
    e.s(["default", 0, e => {
        let {
            open: i,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: u
        } = e, {
            translate: d
        } = (0, r.useTranslation)();
        return (0, t.jsx)(n.Dialog, {
            open: i,
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
                    }), (0, t.jsx)(s.Typography, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(s.Typography, {
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
                        onClick: u,
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
    e.s(["useCreatorEligibility", 0, function() {
        let {
            overrideUserId: e,
            isReady: r = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: s
        } = (0, a.useAuthentication)(), i = null == s ? void 0 : s.id, l = null != e ? e : i;
        return (0, t.useQuery)({
            queryKey: ["creatorEligibility", null != l ? l : null],
            queryFn: async () => n.default.coreContentGetCreatorEligibility({
                userId: l
            }),
            enabled: r && !!l
        })
    }])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(221628),
        n = e.i(416340),
        r = e.i(445550),
        s = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t);
    let i = Object.values(s),
        l = (e => {
            let t = {};
            for (let a of i) t[a] = e(a);
            if (!i.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["DEFAULT_FRONTEND_FLAGS", 0, l, "FRONTEND_FLAG_NAMES", 0, i, "FrontendFlagName", () => s], 448005);
    let o = (0, n.createContext)(null);
    e.s(["default", 0, e => {
        let {
            children: t
        } = e, [s, u] = (0, n.useState)(l), [d, c] = (0, n.useState)(!1), m = (0, n.useCallback)(async e => {
            try {
                let t = await r.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...i.map(e => {
                        var a, n;
                        return {
                            [e]: null != (a = null == t || null == (n = t.data) ? void 0 : n[e]) && a
                        }
                    }));
                u(a)
            } catch (e) {}
        }, []);
        (0, n.useEffect)(() => {
            let e = !0,
                t = {
                    flags: [...i]
                };
            return c(!0), (async () => {
                await m(t), e && c(!1)
            })(), () => {
                e = !1
            }
        }, [m]);
        let p = (0, n.useMemo)(() => ({
            frontendFlags: s,
            getFrontendFlags: m,
            loadingFrontendFlags: d
        }), [s, m, d]);
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
                groups: s,
                isFetched: i,
                currentGroup: l,
                setCurrentGroup: o
            } = (0, n.useGroups)(),
            u = (0, t.useRef)(!1),
            d = (0, t.useRef)(!1),
            c = (0, t.useMemo)(() => {
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
            m = (null == c ? void 0 : c.kind) === "group" && (null != s ? s : []).some(e => {
                let {
                    id: t
                } = e;
                return t === c.id
            });
        (0, t.useEffect)(() => {
            !u.current && null !== c && i && (u.current = !0, "user" === c.kind ? null !== l && o(null) : m && (null == l ? void 0 : l.id) !== c.id && o(c.id))
        }, [c, i, m, l, o]);
        let p = !e.isReady;
        return p || null === c || (p = "group" === c.kind ? !i || m && (null == l ? void 0 : l.id) !== c.id : !i || null !== l), (0, t.useEffect)(() => {
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
}, 198015, e => {
    "use strict";
    var t = e.i(697435);
    e.s(["CategoryDomain", () => t.V1ItemsCategoriesGetCategoryDomainEnum])
}, 842051, e => {
    "use strict";
    var t = e.i(75584),
        a = e.i(41466),
        n = e.i(408832),
        r = e.i(607895),
        s = e.i(225032),
        i = e.i(197649),
        l = e.i(416340);
    let o = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        u = {
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
        c = {
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
                onAction: s,
                variant: i
            } = e;
            return r ? l.default.createElement(a.Button, {
                asChild: !0,
                size: "Small",
                variant: i,
                onClick: s
            }, l.default.cloneElement(r, {}, t)) : n ? l.default.createElement(a.Button, {
                as: "a",
                href: n,
                size: "Small",
                variant: i,
                onClick: s
            }, t) : l.default.createElement(a.Button, {
                size: "Small",
                variant: i,
                onClick: s
            }, t)
        },
        p = e => {
            let {
                label: t,
                href: a,
                linkTarget: n,
                onAction: s
            } = e;
            return n ? l.default.createElement(r.Link, {
                asChild: !0,
                onClick: s,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, l.default.cloneElement(n, {}, t)) : a ? l.default.createElement(r.Link, {
                href: a,
                onClick: s,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t) : l.default.createElement(r.Link, {
                as: "button",
                onClick: s,
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
                primaryActionHref: v,
                primaryActionLinkTarget: g,
                onPrimaryAction: A,
                secondaryActionLabel: b,
                secondaryActionHref: T,
                secondaryActionLinkTarget: I,
                onSecondaryAction: E,
                hasCloseAffordance: S = !0,
                closeLabel: x = "Dismiss alert",
                onDismiss: C,
                className: w,
                style: k,
                ...D
            } = e, N = (0, n.default)("foundation-web-alert-message-"), M = !!y, P = !!b, L = !!(S && C), F = "Feedback" === h && (M || P || L), U = "Warning" === f || "Error" === f ? "alert" : "status", _ = null;
            M && (_ = P ? l.default.createElement(m, {
                label: y || "",
                href: v,
                linkTarget: g,
                onAction: A,
                variant: "Standard"
            }) : l.default.createElement(p, {
                label: y || "",
                href: v,
                linkTarget: g,
                onAction: A
            }));
            let V = P ? l.default.createElement(m, {
                label: b || "",
                href: T,
                linkTarget: I,
                onAction: E,
                variant: "Utility"
            }) : null;
            return l.default.createElement("div", {
                ref: a,
                role: F ? "region" : U,
                "aria-labelledby": F ? N : void 0,
                className: (0, i.default)("foundation-web-alert relative width-full stroke-standard", "System" === h ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", d[f], w),
                ...D
            }, l.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, i.default)("absolute inset-[0] pointer-events-none", "Feedback" === h && "radius-medium"),
                style: {
                    backgroundColor: c[f]
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
                    color: u[f]
                }
            }))), l.default.createElement("div", {
                className: (0, i.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", P ? "flex-col" : "wrap")
            }, l.default.createElement("div", {
                id: F ? N : void 0,
                role: F ? U : void 0,
                className: (0, i.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", P ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, r), (_ || V) && l.default.createElement("div", {
                className: (0, i.default)("flex items-center gap-small wrap shrink-0", !P && "padding-y-[var(--size-150)]")
            }, _, V)), L && l.default.createElement(s.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": x,
                onClick: C
            })))
        });
    e.s(["Alert", 0, h])
}, 607895, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        n = e.i(23342);
    let r = new Set(["_self", "_parent", "_top"]),
        s = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        i = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        l = (0, a.forwardRef)((e, l) => {
            var o, u, d;
            let {
                children: c,
                className: m,
                size: p,
                color: h = "Emphasis",
                variant: f = "Standalone",
                underline: y = "hover",
                isExternal: v,
                asChild: g,
                ...A
            } = e, b = (u = null != (o = A.as) ? o : "a", d = "button" === A.as ? void 0 : A.target, void 0 !== v ? v : "button" !== u && void 0 !== d && !r.has(d)), T = (0, t.default)("foundation-web-link", "button" === A.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === f || b) && "inline-flex items-center gap-xsmall", void 0 !== p && s[p], i[h], "always" === y ? "underline" : "no-underline", "hover" === y && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), I = b ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (g) {
                let {
                    as: e,
                    ...t
                } = A, r = a.default.Children.only(c);
                return a.default.isValidElement(r) ? a.default.createElement(n.Slot, {
                    ref: l,
                    ...t,
                    className: T
                }, a.default.cloneElement(r, {}, a.default.createElement(a.default.Fragment, null, r.props.children, I))) : null
            }
            if ("button" === A.as) {
                let {
                    as: e,
                    type: t,
                    ...n
                } = A;
                return a.default.createElement("button", {
                    ref: l,
                    type: null != t ? t : "button",
                    ...n,
                    className: T
                }, c, I)
            }
            let {
                as: E,
                ...S
            } = A;
            return a.default.createElement("a", {
                ref: l,
                ...S,
                className: T
            }, c, I)
        });
    l.displayName = "Link", e.s(["Link", 0, l])
}, 517359, e => {
    "use strict";
    var t = e.i(659332),
        a = e.i(306607),
        n = e.i(197649),
        r = e.i(416340),
        s = e.i(425353);
    let i = e => {
            let {
                type: t,
                sideSheetSide: a = "right",
                isSideSheetFlush: i = !1,
                centerSheetSize: l = "Medium",
                children: o,
                overlayClassName: u,
                contentClassName: d,
                onOpenAutoFocus: c,
                onCloseAutoFocus: m,
                onPointerDownOutside: p,
                onEscapeKeyDown: h,
                onInteractOutside: f
            } = e;
            return r.default.createElement(s.Portal, null, r.default.createElement(s.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? i : void 0,
                "data-size": "centerSheet" === t ? l : void 0,
                className: (0, n.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", u)
            }, r.default.createElement(s.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, n.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", d),
                onOpenAutoFocus: c,
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
                var s;
                e.preventDefault();
                let t = document.activeElement === r.element;
                r.element.focus(), !t && (s = r.element) instanceof HTMLInputElement && "function" == typeof s.select && s.select()
            }
        };
    var o = e.i(167878),
        u = e.i(199512);
    let d = (0, r.createContext)(null),
        c = () => {
            let e = (0, r.useContext)(d);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        m = "padding-x-xlarge",
        p = (0, r.forwardRef)((e, t) => {
            let {
                children: a,
                className: s,
                hasPaddingX: i = !0,
                ...l
            } = e, {
                type: o
            } = c();
            return r.default.createElement("div", {
                ref: t,
                className: (0, n.default)("scroll-y", i && m, "sideSheet" === o ? "grow-1" : "", s),
                ...l
            }, a)
        });
    p.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        let {
            children: t,
            className: s,
            ...i
        } = e;
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(a.Divider, null), r.default.createElement("div", {
            className: (0, n.default)(m, "margin-y-small shrink-0", s),
            ...i
        }, t))
    }, "SheetBody", 0, p, "SheetContent", 0, e => {
        let t, {
                children: a,
                centerSheetSize: s = "Medium",
                largeScreenVariant: u = "center",
                closeLabel: c,
                className: m,
                mobilePortraitClassName: p,
                mobileLandscapeClassName: h,
                largeScreenClassName: f,
                onOpenAutoFocus: y,
                onCloseAutoFocus: v,
                onPointerDownOutside: g,
                onEscapeKeyDown: A,
                onInteractOutside: b
            } = e,
            T = (0, o.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
            I = (0, o.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
        t = T ? "bottomSheet" : I || "side" === u ? "sideSheet" : "centerSheet";
        let E = (0, r.useMemo)(() => ({
                centerSheetSize: s,
                largeScreenVariant: u,
                closeLabel: c,
                isPortraitMobile: T,
                isLandscapeMobile: I,
                type: t
            }), [s, u, c, T, I, t]),
            S = (0, n.default)(m, T && p, I && h, !T && !I && f);
        return r.default.createElement(d.Provider, {
            value: E
        }, r.default.createElement(i, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: I,
            centerSheetSize: s,
            contentClassName: S,
            onOpenAutoFocus: null != y ? y : l,
            onCloseAutoFocus: v,
            onPointerDownOutside: g,
            onEscapeKeyDown: A,
            onInteractOutside: b
        }, a))
    }, "SheetDescription", 0, e => r.default.createElement(s.Description, {
        asChild: !0,
        ...e
    }), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: n,
            children: i
        } = e;
        return r.default.createElement(s.Root, {
            open: t,
            onOpenChange: a,
            defaultOpen: n,
            modal: !0
        }, i)
    }, "SheetTitle", 0, e => {
        let {
            className: a,
            children: i,
            navigation: l,
            utilities: o,
            visuallyHideTitleText: d
        } = e, {
            closeLabel: m
        } = c(), p = r.default.createElement(s.Title, {
            className: "text-heading-small margin-none"
        }, i);
        return r.default.createElement("div", {
            className: (0, n.default)(a, l ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, r.default.createElement("div", {
            className: (0, n.default)("flex items-center", l && "gap-xsmall")
        }, l, d ? r.default.createElement(u.VisuallyHidden, null, p) : p), r.default.createElement("div", {
            className: (0, n.default)("flex items-center", o && "gap-xxsmall")
        }, o, r.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, r.default.createElement(s.Close, {
            asChild: !0
        }, r.default.createElement(t.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: m || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "SheetTrigger", 0, e => r.default.createElement(s.Trigger, {
        asChild: !0,
        ...e
    })], 517359)
}, 986939, e => {
    "use strict";
    var t = e.i(603955),
        a = e.i(408832),
        n = e.i(750615),
        r = e.i(197649),
        s = e.i(416340);
    let i = {
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
        u = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        d = s.default.forwardRef((e, d) => {
            let {
                size: c,
                variant: m = "Standard",
                label: p,
                value: h,
                defaultValue: f,
                isDisabled: y,
                hasError: v,
                helperText: g,
                className: A,
                style: b,
                textareaClassName: T,
                textareaStyle: I,
                id: E,
                ...S
            } = e, x = (0, a.default)(), C = E || x, w = "".concat(C, "-description"), k = null != c ? c : "Large";
            return s.default.createElement("div", {
                className: (0, r.default)("flex fill flex-col width-full gap-small", {
                    [t.disabledOpacity]: y
                }, A),
                style: b
            }, p && s.default.createElement("label", {
                htmlFor: C,
                className: (0, r.default)(o[k], "content-emphasis")
            }, p), s.default.createElement("textarea", {
                ref: d,
                id: C,
                "data-testid": "text-area-container",
                style: I,
                className: (0, r.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", n.INPUT_BACKGROUND_BY_VARIANT[m], n.INPUT_STROKE_BY_VARIANT[m], v ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", u[k], i[k], l[k], T),
                value: h,
                defaultValue: null == h ? f : void 0,
                disabled: y,
                "aria-describedby": g ? w : void 0,
                ...S
            }), g && s.default.createElement("span", {
                id: w,
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": v,
                    "content-default": !v
                })
            }, g))
        });
    d.displayName = "TextArea", e.s(["TextArea", 0, d])
}]);

//# debugId=ec77a196-5571-d3b2-5eb6-7769d2342587
//# sourceMappingURL=27idye5wi4iob.js.map