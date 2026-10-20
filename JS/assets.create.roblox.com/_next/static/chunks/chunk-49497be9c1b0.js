;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "940c050c-0670-4281-6f11-d7b0583460ca")
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
        i = (0, t.defineFlag)({
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
    e.s(["enableAvatarCreationTokenCategories", 0, s, "enableBulkMakeupTokenCreation", 0, r, "enableCoreContentGatedBanner", 0, o, "enableCreatorShowcases", 0, n, "enableTaxonomyBasedCreatorDashboard", 0, a, "isAutoPublishPreferencesEnabled", 0, i, "showTaxonomyOnAvatarItemAnalyticsTab", 0, l])
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
    e.s(["isAssetAccessRequestsEnabled", 0, n, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, i, "isModelCustomThumbnailUploadEnabled", 0, s, "isPricingEligibilityV2Enabled", 0, l, "isPublishBeforeExposeEnabled", 0, o])
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
            name: "isMomentsShareLinkEnabled",
            defaultValue: !1
        }),
        c = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsPostCreationEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, l, "isMomentsPostCreationEnabled", 0, c, "isMomentsShareLinkEnabled", 0, o, "isMomentsSitetestUrlParsingEnabled", 0, s, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, i, "isTextDocumentEnabled", 0, r])
}, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(540459),
        s = e.i(79187),
        r = e.i(814975),
        i = e.i(156071),
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
    let u = (0, s.withTranslation)(e => {
        let {
            children: s
        } = e, {
            user: l
        } = (0, r.useAuthentication)(), u = (0, o.useCurrentGroup)(), [m, p] = (0, a.useState)(void 0), [h, v] = (0, a.useState)(), [y, g] = (0, a.useState)(), [f, A] = (0, a.useState)(), [b, T] = (0, a.useState)(), I = (0, a.useMemo)(() => {
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
                g(e.isEligible)
            } catch (e) {
                g(!1)
            }
        }, [u, I]);
        (0, a.useEffect)(() => {
            E ? T(void 0) : I && !S ? T(!1) : T(!1 === f)
        }, [I, S, f, E]), (0, a.useEffect)(() => {
            (async () => {
                if (I && (null == u ? void 0 : u.id)) {
                    var e;
                    return null == (e = (await i.default.getGroupInfo(u.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && C(e === l.id)
            })
        }, [null == u ? void 0 : u.id, I, l]), (0, a.useEffect)(() => {
            E || !h || I && !S ? A(void 0) : A((null == h ? void 0 : h.length) === 0 || (null == h ? void 0 : h.length) === 1 && h[0] === n.Requirements.Payable)
        }, [S, I, E, h]), (0, a.useEffect)(() => {
            x()
        }, [x]), (0, a.useEffect)(() => {
            w()
        }, [w]), (0, a.useEffect)(() => {
            D()
        }, [D]);
        let N = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: E,
            requiresActionToJoinProgram: b,
            compliantWithAllUserRequirements: f,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != h ? h : void 0,
            isCurrentUserGroupOwner: S,
            isGroupEligible: null != y ? y : void 0
        }), [E, b, f, m, h, S, y]);
        return (0, t.jsx)(d.Provider, {
            value: N,
            children: s
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
        r = e.i(335681),
        i = e.i(367808),
        l = e.i(686762),
        o = e.i(623983),
        c = e.i(748893),
        d = e.i(649114),
        u = e.i(15645),
        m = e.i(358763),
        p = e.i(889311),
        h = e.i(823062),
        v = e.i(881670),
        y = e.i(904969),
        g = e.i(906791);
    let f = (0, e.i(697973).makeStyles)()(e => ({
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
    e.s(["default", 0, f], 540082);
    var A = ((t = {}).Home = "home", t.Creations = "creations", t);
    let b = (0, s.withTranslation)(e => {
        let t, v, A, b, {
                trackingPage: T,
                alertRedesignVariant: I
            } = e,
            {
                isBannerVisible: S,
                isHighPriority: C,
                variant: E,
                dismissBanner: x
            } = (0, g.useAgeVerificationUpsellContext)(),
            {
                classes: w
            } = f(),
            D = (0, n.useRef)(null),
            {
                unifiedLogger: N
            } = (0, h.useUnifiedLoggerProvider)(),
            {
                translate: L
            } = (0, s.useTranslation)(),
            k = (0, n.useCallback)(() => {
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
        (0, m.default)(D, k);
        let P = (0, n.useCallback)(() => {
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
            M = (0, n.useCallback)(() => {
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
            U = (0, n.useCallback)(() => {
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
        return ("establishTrust" === E ? (t = "Title.EstablishTrustBanner", v = "Label.EstablishTrustBanner2", A = y.ESTABLISH_TRUST_UPSELL_GET_STARTED_URL, b = y.ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL) : (t = "Title.AgeVerificationBanner", v = "Label.AgeVerificationBanner", A = y.AGE_VERIFICATION_UPSELL_GET_STARTED_URL, b = y.AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL), S) ? (0, a.jsx)("div", {
            ref: D,
            children: (0, a.jsxs)(r.Alert, {
                className: w.alertContainer,
                severity: "ageVerification" === E && C ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(c.Button, {
                    href: A,
                    onClick: M,
                    className: w.getStarted,
                    color: "inherit",
                    size: "small",
                    children: L("Label.AgeVerificationBannerGetStarted")
                }, "getStarted"), (0, a.jsx)(d.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: U,
                    children: (0, a.jsx)(u.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(i.AlertTitle, {
                    children: L(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: L(v)
                }), " ", (0, a.jsx)(l.Link, {
                    className: w.viewDetails,
                    href: b,
                    target: "_blank",
                    color: "inherit",
                    onClick: P,
                    children: L("Label.AgeVerificationBannerViewDetails")
                })]
            })
        }) : null
    }, [v.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, b, "AgeVerificationUpsellPage", () => A], 714039)
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
        i = e.i(814984),
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
        }, h = async () => await (0, i.getAgeVerificationUpsellFeatureAccess)() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: i
        } = e, [o, c] = (0, a.useState)(!0), [v, y] = (0, a.useState)("doNotShow"), {
            isFetched: g,
            user: f
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: A
        } = (0, r.useUnifiedLoggerProvider)(), {
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
            await u(), c(!0)
        }, [c]);
        (0, a.useEffect)(() => {
            T && g && (null == f ? void 0 : f.id) && (async () => {
                let e = !1;
                try {
                    e = await d()
                } catch (e) {
                    A.logErrorEvent({
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
                    A.logErrorEvent({
                        eventName: s.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                y(t)
            })().catch(e => {
                A.logErrorEvent({
                    eventName: s.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [T, g, f, A]);
        let S = (0, a.useMemo)(() => {
            let e = T && "doNotShow" !== v;
            return {
                isBannerVisible: e && !o,
                isBannerEligible: e,
                isHighPriority: b,
                variant: "doNotShow" !== v ? v : "ageVerification",
                dismissBanner: I
            }
        }, [T, v, o, b, I]);
        return (0, t.jsx)(m.Provider, {
            value: S,
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
            children: s
        } = e, [r, i] = (0, a.useState)(), l = e => {
            i(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: r,
            updateDroppedFile: l
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
        s = e.i(812077),
        r = e.i(41466),
        i = e.i(197649),
        l = e.i(79187),
        o = e.i(345886),
        c = e.i(29929),
        d = e.i(889311),
        u = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        h = e.i(114209),
        v = e.i(373736),
        y = e.i(917852),
        g = e.i(576069),
        f = e.i(663563);
    let A = "".concat("https://assets.create.roblox.com/754784cade2a5311993953beacdf6b4aa2509994/assets", "/home/publish_eligibility_banner.webp"),
        b = (0, l.withTranslation)(e => {
            var b;
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
                data: k,
                isLoading: P,
                isFetching: M
            } = (0, g.useCreatorEligibility)(), U = (0, a.useRef)(!1), [_, F] = (0, a.useState)(!1), B = (null == k ? void 0 : k.ageBracket) === s.AgeBracketEnum.Over18, V = (null == k ? void 0 : k.ageBracket) === s.AgeBracketEnum.Between13And18, R = null != (b = null == k ? void 0 : k.creatorEligibility.includes(s.CreatorEligibilityEnum.IdVerified)) && b, O = B || V, j = x && w && !(P || M) && !!k && !R;
            (0, a.useEffect)(() => {
                j && !U.current && (U.current = !0, u.default.logImpressionEvent({
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
                }), V) ? F(!0): O || S.push("/settings/eligibility/publishing-permissions")
            }, [j, V, S, O, L]);
            return j ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, i.clsx)(f.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
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
                        className: (0, i.clsx)(f.default.heroTextContent, "dark-theme relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [C(p.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: C(p.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, i.clsx)(f.default.buttonRow, "flex gap-small"),
                            children: I ? B ? (0, t.jsx)(r.Button, {
                                as: "a",
                                href: y.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: C(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(r.Button, {
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: C(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), V ? (0, t.jsx)(v.default, {
                    open: _,
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
    e.s(["default", 0, b])
}, 899441, e => {
    "use strict";
    var t, a, n = e.i(102211),
        s = e.i(272593),
        r = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.TextDocument = "TextDocument", t.Video = "Video", t),
        i = ((a = {}).Group = "groups", a.User = "users", a);
    let l = new n.CreatorInventoryApi((0, s.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => r, "CreatorInventoryScopeType", () => i, "searchCreatorInventoryItems", 0, (e, t, a) => (null == t.isArchived && null == t.orderBy ? l : l.withPreMiddleware(async e => {
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
                    i = (-1 === s ? [] : e.slice(s + 1).split("&")).map(e => null != a && e.startsWith("filter=") ? "".concat(e).concat(encodeURIComponent(";isArchived=".concat(a))) : e);
                return null != n && i.push("orderBy=".concat(encodeURIComponent(n))), "".concat(r, "?").concat(i.join("&"))
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
            async getCreations(e, t, a, n, s, i, l) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: r[t],
                    limit: n,
                    cursor: s,
                    separateModelsAndPackages: i,
                    includeSharedAssets: l
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
    e.s(["assetTypeIdToAssetType", 0, i, "default", 0, l, "toolboxServiceItemDetailsLimit", 0, 30])
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
        i = e.i(157310),
        l = e.i(913893),
        o = e.i(275574),
        c = e.i(671376),
        d = e.i(117236);
    let u = function() {
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
        var i, l, o;
        let [{
            activeTab: c,
            filterIndex: d
        }] = (0, a.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: m,
            categories: p,
            isLoading: h
        } = u(e), v = (0, r.isAllAssetTypesActiveTab)(c) || (0, r.isRecentsActiveTab)(c) || (0, r.isAvatarLooksActiveTab)(c) ? void 0 : null != (i = (0, r.parseTaxonomyActiveTab)(c)) ? i : null == (o = m[0]) ? void 0 : o.taxonomyKey, y = (0, t.useMemo)(() => (0, s.findL1Category)(p, v), [p, v]), g = (0, t.useMemo)(() => (0, s.buildTaxonomyL2Options)(y), [y]), f = parseInt(null != (l = null == d ? void 0 : d.toString()) ? l : "", 10), A = (0, n.isValidIndex)(f, g) ? f : 0, b = (0, t.useMemo)(() => {
            if (y) return g.length > 0 ? g[A] : y.webStableId ? (0, s.categoryToDropdown)(y) : void 0
        }, [y, g, A]);
        return {
            l1Options: m,
            activeL1Key: v,
            activeL1Node: y,
            l2Options: g,
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
            activeTab: s
        }] = (0, t.useQueryParams)(["activeTab"]), r = (0, a.default)(), i = r && (0, n.isTaxonomyActiveTab)(s), l = r && (0, n.isAvatarLooksActiveTab)(s);
        return {
            canUseTaxonomy: r && (i || (0, n.isTaxonomyEligibleAssetTab)(e)),
            isTaxonomyMode: i,
            isTaxonomyView: i && !(0, n.isAllAssetTypesActiveTab)(s) && !(0, n.isRecentsActiveTab)(s) && !(0, n.isAvatarLooksActiveTab)(s),
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
            let [n, s] = e;
            s.forEach((e, s) => {
                t.set(a(n, e.nameKey), s)
            })
        }), t
    }, "isOnItemTab", 0, e => e === t.Asset.TShirt, "isValidIndex", 0, (e, t) => void 0 !== t && void 0 !== e && e > 0 && e < t.length, "serializeMenuMapKey", 0, a], 339544);
    var n = e.i(266213),
        s = e.i(418162);
    let r = new Set([2, 11, 12]),
        i = new Set([76, 77, 88, 89, 90]),
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
                if (c(e, i)) {
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
        i = e.i(117236);
    let l = "AvatarItems",
        o = "".concat(l, "-"),
        c = s.Asset.HairAccessory;

    function d(e) {
        let t = (0, r.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let u = "looks",
        m = new Set(null != (t = null == (n = i.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = n.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

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
        return "Recents" === (0, r.readQueryValue)(e) || "recents" === d(e)
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, r.readQueryValue)(e);
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
        s = e.i(252842),
        r = e.i(671376);
    let i = {
            [r.Asset.Place]: a.SearchSortParameter.LastUpdated,
            [r.Asset.UpcomingEvent]: n.EventSortBy.StartUtc,
            [r.Asset.PastEvent]: n.EventSortBy.StartUtc,
            [r.Asset.DraftEvent]: n.EventSortBy.StartUtc
        },
        l = {
            sort: i,
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
        o = (0, t.createContext)(l);
    o.displayName = "Filters", e.s(["default", 0, o, "defaultAssetsSort", 0, i])
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
    var t, a, n, s = e.i(102211),
        r = e.i(899441),
        i = e.i(361738),
        l = e.i(671376),
        o = ((t = {}).All = "All", t),
        c = ((a = {}).All = "All", a),
        d = ((n = {}).CreatedNewest = "created_desc", n.CreatedOldest = "created_asc", n.UpdatedNewest = "updated_desc", n.UpdatedOldest = "updated_asc", n);
    let u = ["updated_desc", "updated_asc", "created_desc", "created_asc"],
        m = {
            created_desc: "createTime desc",
            created_asc: "createTime",
            updated_desc: "updateTime desc",
            updated_asc: "updateTime"
        },
        p = {
            created: {
                ascending: "created_asc",
                descending: "created_desc"
            },
            updated: {
                ascending: "updated_asc",
                descending: "updated_desc"
            }
        },
        h = [r.CreatorInventoryAssetType.Model, r.CreatorInventoryAssetType.Plugin, r.CreatorInventoryAssetType.Audio, r.CreatorInventoryAssetType.Decal, r.CreatorInventoryAssetType.Image, r.CreatorInventoryAssetType.Video, r.CreatorInventoryAssetType.Mesh, r.CreatorInventoryAssetType.MeshPart, r.CreatorInventoryAssetType.Animation],
        v = [...h, r.CreatorInventoryAssetType.TextDocument],
        y = new Set([r.CreatorInventoryAssetType.Audio, r.CreatorInventoryAssetType.Decal, r.CreatorInventoryAssetType.MeshPart, r.CreatorInventoryAssetType.TextDocument, r.CreatorInventoryAssetType.Video]),
        g = new Set([...y, r.CreatorInventoryAssetType.Image]),
        f = new Set(v),
        A = new Set([r.CreatorInventoryAssetType.TextDocument]),
        b = new Set(["All", i.CreatorInventorySourceType.Created, i.CreatorInventorySourceType.Purchased, i.CreatorInventorySourceType.Shared]),
        T = new Set([l.Asset.Animation, l.Asset.Audio, l.Asset.Decal, l.Asset.Image, l.Asset.Mesh, l.Asset.MeshPart, l.Asset.Model, l.Asset.Plugin, l.Asset.Video]),
        I = {
            [r.CreatorInventoryAssetType.Animation]: l.Asset.Animation,
            [r.CreatorInventoryAssetType.Audio]: l.Asset.Audio,
            [r.CreatorInventoryAssetType.Decal]: l.Asset.Decal,
            [r.CreatorInventoryAssetType.Image]: l.Asset.Image,
            [r.CreatorInventoryAssetType.Mesh]: l.Asset.Mesh,
            [r.CreatorInventoryAssetType.MeshPart]: l.Asset.MeshPart,
            [r.CreatorInventoryAssetType.Model]: l.Asset.Model,
            [r.CreatorInventoryAssetType.Plugin]: l.Asset.Plugin,
            [r.CreatorInventoryAssetType.TextDocument]: l.Asset.TextDocument,
            [r.CreatorInventoryAssetType.Video]: l.Asset.Video
        },
        S = {
            [r.CreatorInventoryAssetType.Animation]: s.AssetType.Animation,
            [r.CreatorInventoryAssetType.Audio]: s.AssetType.Audio,
            [r.CreatorInventoryAssetType.Decal]: s.AssetType.Decal,
            [r.CreatorInventoryAssetType.Image]: s.AssetType.Image,
            [r.CreatorInventoryAssetType.Mesh]: s.AssetType.Mesh,
            [r.CreatorInventoryAssetType.MeshPart]: s.AssetType.MeshPart,
            [r.CreatorInventoryAssetType.Model]: s.AssetType.Model,
            [r.CreatorInventoryAssetType.Plugin]: s.AssetType.Plugin,
            [r.CreatorInventoryAssetType.TextDocument]: s.AssetType.TextDocument,
            [r.CreatorInventoryAssetType.Video]: s.AssetType.Video
        },
        C = {
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
        E = {
            createdDetails: i.CreatorInventorySourceType.Created,
            purchasedDetails: i.CreatorInventorySourceType.Purchased,
            sharedDetails: i.CreatorInventorySourceType.Shared
        },
        x = {
            [s.State.Active]: "Active",
            [s.State.Archived]: "Archived"
        },
        w = e => !0 === e ? v : h,
        D = e => null != e && g.has(e),
        N = e => {
            if (null == e) return;
            let t = e instanceof Date ? e : new Date(e);
            return Number.isNaN(t.getTime()) ? void 0 : t
        };
    e.s(["DEFAULT_DEVELOPMENT_ITEMS_SORT", 0, "updated_desc", "DevelopmentItemsAssetTypeFilter", () => c, "DevelopmentItemsSort", () => d, "DevelopmentItemsSourceFilter", () => o, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: r.CreatorInventoryScopeType.Group,
        id: t
    } : null != e ? {
        type: r.CreatorInventoryScopeType.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        ...0 === t.length ? {} : {
            assetTypes: t.map(e => S[e])
        },
        ...e.type === r.CreatorInventoryScopeType.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(i.CreatorInventorySourceType.Created), "developmentItemsSortOptions", 0, u, "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getCreatorInventoryOrderBy", 0, (e, t) => t.trim().length > 0 ? void 0 : m[e], "getDevelopmentItemsAssetTypes", 0, w, "getDevelopmentItemsColumnSortDirection", 0, (e, t) => e === p[t].ascending ? "ascending" : e === p[t].descending ? "descending" : "none", "getDevelopmentItemsSearchAssetTypes", 0, (e, t) => [e, ...w(t).filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => I[e], "getNextDevelopmentItemsColumnSort", 0, (e, t) => e === p[t].descending ? p[t].ascending : p[t].descending, "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: n
        } = e;
        return t.trim().length > 0 || a || n !== i.CreatorInventorySourceType.Created
    }, "hasDevelopmentItemCreatorStorePage", 0, e => e !== r.CreatorInventoryAssetType.TextDocument, "hasDevelopmentItemThumbnail", 0, e => e !== r.CreatorInventoryAssetType.TextDocument, "isDevelopmentItemArchivedViewAvailable", 0, D, "isDevelopmentItemAsset", 0, (e, t) => e === l.Asset.TextDocument ? !0 === t : T.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && y.has(e), "isDevelopmentItemsAllAssetTypes", 0, e => "All" === e, "isDevelopmentItemsArchivedViewAvailable", 0, (e, t) => t || D(1 === e.length ? e[0] : void 0), "isDevelopmentItemsAssetType", 0, (e, t) => null != e && !!f.has(e) && (!A.has(e) || !0 === t), "isDevelopmentItemsSort", 0, e => u.some(t => t === e), "isDevelopmentItemsSourceSelection", 0, e => null != e && b.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, n, s, r, i, l;
        let o, c = null == (n = e.assetItem) ? void 0 : n.asset;
        if (null == c) return;
        let d = "number" == typeof c.assetId ? c.assetId : Number.parseInt(null != (t = c.assetId) ? t : "", 10);
        if (Number.isNaN(d)) return;
        let u = null == (s = c.displayName) ? void 0 : s.trim();
        return {
            id: null != (a = e.path) ? a : d.toString(),
            assetId: d,
            assetType: (e => {
                if (null != e) return C[e.toString().toUpperCase()]
            })(c.assetType),
            created: N(c.createTime),
            isPackage: (null == (r = e.assetItem) ? void 0 : r.isPackage) === !0,
            name: null == u || 0 === u.length ? d.toString() : u,
            sources: (l = null == (i = e.assetItem) ? void 0 : i.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let n = E[t];
                    null != n && o.add(n)
                })
            }), [...o]),
            state: null == c.state ? void 0 : x[c.state],
            updated: N(c.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let n = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => null != e.assetType && (0 === a.length || a.includes(e.assetType)) && !n.has(e.assetId))]
    }], 211461);
    var L = e.i(416340),
        k = e.i(79187),
        P = e.i(884213),
        M = e.i(401263),
        U = e.i(730530),
        _ = e.i(881670);
    e.s(["default", 0, () => {
        let e = (0, k.useTranslation)(),
            {
                translate: t
            } = e,
            {
                tPendingTranslation: a
            } = (0, M.default)(e),
            n = (0, L.useCallback)((e, t, n, s) => {
                let r = a(e, t, n, s);
                return r.length > 0 ? r : (0, P.default)(e, s)
            }, [a]),
            s = (0, L.useCallback)(e => t("Label.AssetIDWithValue", {
                assetId: e.toString()
            }), [t]),
            r = (0, L.useCallback)(e => n("Clear {filterLabel}", "Accessible label for removing an active Development Items filter chip.", (0, U.translationKey)("Action.DevelopmentItems.ClearFilter", _.TranslationNamespace.Creations), {
                filterLabel: e
            }), [n]),
            i = (0, L.useCallback)(e => n("Source: {source}", "Active filter chip describing the selected Development Items source.", (0, U.translationKey)("Label.DevelopmentItems.InventorySourceFilter", _.TranslationNamespace.Creations), {
                source: e
            }), [n]),
            l = (0, L.useCallback)((e, t) => n("{assetTypes}, +{count} more", "Active filter chip listing the first selected Development Items asset types, then how many more are selected.", (0, U.translationKey)("Label.DevelopmentItems.AssetTypesWithMore", _.TranslationNamespace.Creations), {
                assetTypes: e,
                count: t.toString()
            }), [n]),
            o = (0, L.useCallback)(e => n("{count} types", "Asset type filter text when the creator selects more than one Development Items asset type.", (0, U.translationKey)("Label.DevelopmentItems.AssetTypeCount", _.TranslationNamespace.Creations), {
                count: e.toString()
            }), [n]),
            c = (0, L.useCallback)((e, t) => n("{query} in {assetType}", "Scoped-search suggestion that searches for a query within a Development Items asset type.", (0, U.translationKey)("Label.DevelopmentItems.SearchSuggestion", _.TranslationNamespace.Creations), {
                assetType: t,
                query: e
            }), [n]);
        return {
            actions: n("Actions", "Development Items table column and accessible label for item actions.", (0, U.translationKey)("Label.DevelopmentItems.Actions", _.TranslationNamespace.Creations)),
            acquiredFromStore: t("Label.CreatorStore"),
            allAssetTypes: n("All Types", "Asset type filter text when every Development Items asset type is included.", (0, U.translationKey)("Label.DevelopmentItems.AllAssetTypes", _.TranslationNamespace.Creations)),
            allSources: n("Any", "Source filter option that includes every Development Items source.", (0, U.translationKey)("Label.DevelopmentItems.AllSources", _.TranslationNamespace.Creations)),
            assetId: t("Label.AssetID"),
            assetIdWithValue: s,
            assetTypeCount: o,
            assetTypesWithMore: l,
            assetType: n("Asset type", "Accessible label for the Development Items asset type filter.", (0, U.translationKey)("Label.DevelopmentItems.AssetType", _.TranslationNamespace.Creations)),
            breadcrumbs: n("Breadcrumbs", "Accessible label for the page path shown above the Development Items page.", (0, U.translationKey)("Label.DevelopmentItems.Breadcrumbs", _.TranslationNamespace.Creations)),
            dateCreated: n("Date created", "Development Items table column showing when an asset was created.", (0, U.translationKey)("Label.DevelopmentItems.DateCreated", _.TranslationNamespace.Creations)),
            clearFilter: r,
            clearSearch: n("Clear search", "Accessible label and action for clearing the Development Items search query.", (0, U.translationKey)("Action.DevelopmentItems.ClearSearch", _.TranslationNamespace.Creations)),
            filterBy: t("Label.FilterBy"),
            firstPage: n("First page", "Accessible label for the Development Items pagination first-page button.", (0, U.translationKey)("Action.DevelopmentItems.FirstPage", _.TranslationNamespace.Creations)),
            grid: n("Grid", "Accessible label for the Development Items grid view.", (0, U.translationKey)("Label.DevelopmentItems.GridView", _.TranslationNamespace.Creations)),
            inventorySource: n("Source", "Label for the Development Items source filter and table column.", (0, U.translationKey)("Label.DevelopmentItems.InventorySource", _.TranslationNamespace.Creations)),
            inventorySourceFilter: i,
            lastPage: n("Last page", "Accessible label for the Development Items pagination last-page button.", (0, U.translationKey)("Action.DevelopmentItems.LastPage", _.TranslationNamespace.Creations)),
            lastUpdated: t("Label.LastUpdated"),
            list: n("List", "Accessible label for the Development Items list view.", (0, U.translationKey)("Label.DevelopmentItems.ListView", _.TranslationNamespace.Creations)),
            loading: t("Label.Loading"),
            name: t("Label.Name"),
            nextPage: n("Next page", "Accessible label for the Development Items pagination next-page button.", (0, U.translationKey)("Action.DevelopmentItems.NextPage", _.TranslationNamespace.Creations)),
            noArchivedItemsDescription: n("Items you archive will show up here.", "Guidance shown when the Development Items Archived folder is empty.", (0, U.translationKey)("Description.DevelopmentItems.NoArchivedItems", _.TranslationNamespace.Creations)),
            noArchivedItems: n("No archived items", "Heading shown when the Development Items Archived folder is empty.", (0, U.translationKey)("Heading.DevelopmentItems.NoArchivedItems", _.TranslationNamespace.Creations)),
            noDevelopmentItemsDescription: n("Upload assets to see them here.", "Guidance shown when the creator has no Development Items across all asset types.", (0, U.translationKey)("Description.DevelopmentItems.NoDevelopmentItems", _.TranslationNamespace.Creations)),
            noDevelopmentItems: n("No development items yet", "Heading shown when the creator has no Development Items across all asset types.", (0, U.translationKey)("Heading.DevelopmentItems.NoDevelopmentItems", _.TranslationNamespace.Creations)),
            noItemsDescription: n("Try another search or filter.", "Guidance shown when no Development Items match the current query and filters.", (0, U.translationKey)("Description.DevelopmentItems.NoItemsFound", _.TranslationNamespace.Creations)),
            noItems: n("No items found", "Heading shown when no Development Items match the current query and filters.", (0, U.translationKey)("Heading.DevelopmentItems.NoItemsFound", _.TranslationNamespace.Creations)),
            package: n("Package", "Accessible label for the package indicator on a Development Item thumbnail.", (0, U.translationKey)("Label.DevelopmentItems.Package", _.TranslationNamespace.Creations)),
            previousPage: n("Previous page", "Accessible label for the Development Items pagination previous-page button.", (0, U.translationKey)("Action.DevelopmentItems.PreviousPage", _.TranslationNamespace.Creations)),
            retry: t("Action.Retry"),
            rowsPerPage: t("Label.RowsPerPage"),
            search: t("Label.Search"),
            searchSuggestion: c,
            searchWithinAssetType: n("Search within asset type", "Accessible label for Development Items scoped-search suggestions.", (0, U.translationKey)("Label.DevelopmentItems.SearchWithinAssetType", _.TranslationNamespace.Creations)),
            sortBestMatch: n("Sort by: Best match", "Development Items sort shown while a search query ranks results by relevance.", (0, U.translationKey)("Label.DevelopmentItems.SortByBestMatch", _.TranslationNamespace.Creations)),
            sortBy: n("Sort by", "Accessible label for the Development Items sort selector.", (0, U.translationKey)("Label.DevelopmentItems.SortBy", _.TranslationNamespace.Creations)),
            sortDateAddedAsc: n("Sort by: Date added (Asc)", "Development Items sort option listing the earliest created assets first. Asc is short for ascending.", (0, U.translationKey)("Label.DevelopmentItems.SortByDateAddedAsc", _.TranslationNamespace.Creations)),
            sortDateAddedDesc: n("Sort by: Date added (Desc)", "Development Items sort option listing the most recently created assets first. Desc is short for descending.", (0, U.translationKey)("Label.DevelopmentItems.SortByDateAddedDesc", _.TranslationNamespace.Creations)),
            sortUpdatedAsc: n("Sort by: Updated (Asc)", "Development Items sort option listing the least recently updated assets first. Asc is short for ascending.", (0, U.translationKey)("Label.DevelopmentItems.SortByUpdatedAsc", _.TranslationNamespace.Creations)),
            sortUpdatedDesc: n("Sort by: Updated (Desc)", "Development Items sort option listing the most recently updated assets first. Desc is short for descending.", (0, U.translationKey)("Label.DevelopmentItems.SortByUpdatedDesc", _.TranslationNamespace.Creations)),
            sharedWithMe: n("Shared with me", "Source filter option for Development Items shared with the current creator.", (0, U.translationKey)("Label.DevelopmentItems.SharedWithMe", _.TranslationNamespace.Creations)),
            showHiddenBreadcrumbs: n("Show hidden pages", "Accessible label for the button that expands collapsed pages in the Development Items breadcrumbs.", (0, U.translationKey)("Action.DevelopmentItems.ShowHiddenBreadcrumbs", _.TranslationNamespace.Creations)),
            unavailableDescription: n("Try again in a moment.", "Guidance shown when the Development Items inventory cannot be loaded.", (0, U.translationKey)("Description.DevelopmentItems.InventoryUnavailable", _.TranslationNamespace.Creations)),
            unavailable: n("Inventory is unavailable", "Heading shown when the Development Items inventory cannot be loaded.", (0, U.translationKey)("Heading.DevelopmentItems.InventoryUnavailable", _.TranslationNamespace.Creations)),
            viewSelector: n("Choose grid or list view", "Accessible label for the Development Items view selector.", (0, U.translationKey)("Label.DevelopmentItems.ViewSelector", _.TranslationNamespace.Creations)),
            uploadedByMe: n("Uploaded", "Source filter option for Development Items uploaded by the current creator.", (0, U.translationKey)("Label.DevelopmentItems.UploadedByMe", _.TranslationNamespace.Creations))
        }
    }], 725509)
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
        s = e.i(475360),
        r = e.i(949599),
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
        c = a.Asset.EyeMakeup,
        d = a.Asset.AvatarLooks,
        u = a.Asset.AvatarBackground,
        m = a.Asset.Showcase;
    e.s(["default", 0, {
        isMenuItemEnabled(e, n, r, i, l, o, p, h) {
            var v, y;
            return ((null == e ? void 0 : e.type) !== a.Asset.TextDocument || !!h) && ((null == e ? void 0 : e.type) === a.Asset.AllCatalogAsset || ((null == e ? void 0 : e.type) === a.Asset.SharedExperiences ? null == r : (null == e ? void 0 : e.type) === a.Asset.Moments ? null != o && o : (null == e ? void 0 : e.itemType) === s.Item.Bundle || (null == e ? void 0 : e.type) === d || ((null == e ? void 0 : e.type) === u ? null != (v = null == l ? void 0 : l.has(e.type)) && v : (null == e ? void 0 : e.type) === m ? null != p && p : (null == e ? void 0 : e.type) === c ? null != (y = null == l ? void 0 : l.has(null == e ? void 0 : e.type)) && y : (null == e ? void 0 : e.type) === void 0 || !!(0, t.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === i || null != i && i)))
        },
        getValidMenuState(e, t, a, n, s, r, i, l, o) {
            var d, m, p, h, v, y;
            let g, f, A = (null == (d = t.submenuItem) ? void 0 : d.type) !== c && (null == (m = t.submenuItem) ? void 0 : m.type) !== u || void 0 !== r;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, n, s, r, i, l, o)) {
                if (void 0 !== t.submenuItem && A && !this.isMenuItemEnabled(t.submenuItem, a, n, s, r, i, l, o))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            c = 0;
                        for (; c < (null == (h = t.menuItem.submenuItems) ? void 0 : h.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[c], a, n, s, r, i, l, o)) {
                                e = c;
                                break
                            }
                            c += 1
                        }
                        g = t.menuItem, f = null == (v = t.menuItem.submenuItems) ? void 0 : v[e]
                    } else g = t.menuItem, f = null == (y = t.menuItem.submenuItems) ? void 0 : y[0]
            } else [g] = e, f = null == (p = e[0].submenuItems) ? void 0 : p[0];
            return g ? {
                menuItem: g,
                submenuItem: f
            } : t
        },
        isAssetTypeDirectlyArchivable: e => i.allowedAssetTypesForDirectArchiving.has(e),
        isAssetTypeArchivable(e, t) {
            if (void 0 !== t && r.AvatarMenuMap[e]) {
                let a = r.AvatarMenuMap[e][t],
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
        s = e.i(842051),
        r = e.i(79187);
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
            externalLink: c,
            linkLabel: d,
            allowCloseDialog: u,
            onDismiss: m
        } = e, {
            translate: p
        } = (0, r.useTranslation)(), [h, v] = (0, t.useState)(!0);
        if (!h) return null;
        let y = u ? {
            closeLabel: p("Action.Close"),
            onDismiss: () => {
                null == m || m(), v(!1)
            }
        } : {
            hasCloseAffordance: !1
        };
        return (0, n.jsx)(s.Alert, {
            severity: i[o],
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
            onChange: s,
            onDragActiveHandler: r,
            onDragLeaveHandler: i,
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
            s && s(t)
        }, e => {
            e.preventDefault(), r && r()
        }, e => {
            e.preventDefault(), i && i()
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
        s = e.i(751846),
        r = e.i(623983),
        i = e.i(345886),
        l = e.i(697973),
        o = e.i(361965),
        c = e.i(686762),
        d = e.i(589418),
        u = e.i(699848),
        m = e.i(257256),
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
        g = {
            compact: 32,
            medium: 48,
            large: 64
        },
        f = {
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
                    width: v[a],
                    height: v[a],
                    marginRight: y[a]
                },
                userBorderRadius: {
                    borderRadius: g[a]
                },
                nonUserBorderRadius: {
                    borderRadius: f[a]
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
                displayNameOverride: f,
                adornment: b,
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
                    container: k,
                    avatarContainer: P,
                    thumbnailItemContainer: M,
                    thumbnailBackground: U,
                    userBorderRadius: _,
                    nonUserBorderRadius: F,
                    itemText: B,
                    mutedText: V,
                    disabledThumbnail: R,
                    textContainer: O
                },
                cx: j
            } = A({
                variant: S
            }),
            {
                translate: G
            } = (0, n.useTranslation)(),
            K = (0, a.useMemo)(() => g === p.default.User ? s.ThumbnailTypes.avatarHeadshot : g === p.default.Group ? s.ThumbnailTypes.groupIcon : "Ugc" === g ? s.ThumbnailTypes.assetThumbnail : s.ThumbnailTypes.universeThumbnail, [g]),
            H = (0, a.useMemo)(() => {
                if (!C && y.id && !E) {
                    if (g === p.default.User) return h.www.getUserUrl(y.id);
                    if (g === p.default.Group) return h.www.getGroupUrl(y.id);
                    if ("Experience" === g) {
                        let e = "rootPlaceId" in y ? y.rootPlaceId : void 0;
                        return e ? h.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === g) return h.www.getCatalogUrl(y.id)
                }
            }, [C, y, E, g]);
        f ? l = f : g === p.default.User ? l = "displayName" in y ? y.displayName : void 0 : "Ugc" !== g && (l = "name" in y ? y.name : void 0);
        let q = !f && (g === p.default.User && !("displayName" in y && y.displayName) || "Ugc" === g),
            W = (0, a.useMemo)(() => {
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
                        children: [(0, t.jsx)(r.Typography, {
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
                        children: [g === p.default.User && (0, t.jsx)(t.Fragment, {
                            children: "name" in y && !y.name ? (0, t.jsx)(d.Skeleton, {
                                animate: !0,
                                variant: "text",
                                width: 192,
                                height: 20
                            }) : (0, t.jsx)(r.Typography, {
                                variant: "secondary" === D ? "body2" : "captionBody",
                                className: j(O, {
                                    [V]: void 0 === L && ("secondary" === D || "compact" === S)
                                }),
                                color: I ? "disabled" : "inherit",
                                children: (e = E ? G("Label.Other") : "@".concat("name" in y ? y.name : ""), L ? (0, t.jsx)("span", {
                                    className: L,
                                    children: e
                                }) : e)
                            })
                        }), (g === p.default.Group || "Experience" === g) && (0, t.jsx)(r.Typography, {
                            variant: "captionBody",
                            className: j(O, {
                                [V]: void 0 === L && ("secondary" === D || "compact" === S)
                            }),
                            color: I ? "disabled" : "inherit",
                            children: L ? (0, t.jsx)("span", {
                                className: L,
                                children: E ? G("Label.Other") : y.id
                            }) : E ? G("Label.Other") : y.id
                        })]
                    })]
                })
            }, [q, l, g, y, O, I, E, G, T, w, j, V, D, S, N, L]);
        return (0, t.jsx)(i.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: k,
            children: (null == y ? void 0 : y.id) === void 0 ? (0, t.jsx)(d.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: v[S]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(i.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!x && (0, t.jsx)(i.Grid, {
                        item: !0,
                        className: M,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: j(P, {
                                [_]: g === p.default.User,
                                [F]: g !== p.default.User,
                                [R]: I
                            }),
                            children: (0, t.jsx)(s.Thumbnail2d, {
                                targetId: y.id,
                                type: K,
                                imgClassName: U,
                                alt: "thumbnail",
                                returnPolicy: s.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(i.Grid, {
                        container: !0,
                        direction: "column",
                        className: k,
                        children: (0, t.jsx)(i.Grid, {
                            item: !0,
                            children: C || E ? W : (0, t.jsx)(c.Link, {
                                href: H,
                                className: B,
                                color: "inherit",
                                children: W
                            })
                        })
                    })]
                }), b]
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
            fetchNextPage: i,
            fetchLimit: l = s
        } = a, o = (0, t.useMemo)(() => {
            let t = n * s;
            return e.slice(t, t + s)
        }, [e, n, s]), c = (n + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            c && r && (null == i || i())
        }, [c, r, i]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: n = 50,
            resetKey: s
        } = e, [r, i] = (0, t.useState)(0), [l, o] = (0, t.useState)(n), [c, d] = (0, t.useState)(s);
        s !== c && (d(s), i(0));
        let u = Math.max(0, Math.ceil(a / l) - 1),
            m = Math.min(r, u);
        return {
            page: m,
            rowsPerPage: l,
            onPageChange: (0, t.useCallback)((e, t) => {
                i(Math.max(0, Math.min(t, u)))
            }, [u]),
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
            disabled: s,
            intervalMs: r = 1e3
        } = e, i = (0, t.useRef)(n);
        i.current = n, (0, t.useEffect)(() => {
            if (!a || s) return;
            i.current();
            let e = setInterval(() => {
                i.current()
            }, r);
            return () => clearInterval(e)
        }, [a, s, r])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(602635),
        n = e.i(79187),
        s = e.i(623983),
        r = e.i(345886),
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
        return v ? (0, t.jsxs)(r.Grid, {
            classes: {
                root: h.container
            },
            children: [i && (0, t.jsxs)(t.Fragment, {
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
                            children: i
                        })
                    }), p && (0, t.jsx)(r.Grid, {
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
        a = e.i(41466),
        n = e.i(984656),
        s = e.i(79187),
        r = e.i(623983);
    e.s(["default", 0, e => {
        let {
            open: i,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: c
        } = e, {
            translate: d
        } = (0, s.useTranslation)();
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
            refetchInterval: i = !1
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: l
        } = (0, a.useAuthentication)(), o = null == l ? void 0 : l.id, c = null != e ? e : o;
        return (0, t.useQuery)({
            queryKey: [...s, null != c ? c : null],
            queryFn: async () => n.default.coreContentGetCreatorEligibility({
                userId: c
            }),
            enabled: r && !!c,
            refetchInterval: i,
            refetchIntervalInBackground: !0
        })
    }])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(221628),
        n = e.i(416340),
        s = e.i(445550),
        r = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t);
    let i = Object.values(r),
        l = (e => {
            let t = {};
            for (let a of i) t[a] = e(a);
            if (!i.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["DEFAULT_FRONTEND_FLAGS", 0, l, "FRONTEND_FLAG_NAMES", 0, i, "FrontendFlagName", () => r], 448005);
    let o = (0, n.createContext)(null);
    e.s(["default", 0, e => {
        let {
            children: t
        } = e, [r, c] = (0, n.useState)(l), [d, u] = (0, n.useState)(!1), m = (0, n.useCallback)(async e => {
            try {
                let t = await s.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...i.map(e => {
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
                    flags: [...i]
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
                isFetched: i,
                currentGroup: l,
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
            !c.current && null !== u && i && (c.current = !0, "user" === u.kind ? null !== l && o(null) : m && (null == l ? void 0 : l.id) !== u.id && o(u.id))
        }, [u, i, m, l, o]);
        let p = !e.isReady;
        return p || null === u || (p = "group" === u.kind ? !i || m && (null == l ? void 0 : l.id) !== u.id : !i || null !== l), (0, t.useEffect)(() => {
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
}, 842051, e => {
    "use strict";
    var t = e.i(75584),
        a = e.i(41466),
        n = e.i(408832),
        s = e.i(607895),
        r = e.i(225032),
        i = e.i(197649),
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
                linkTarget: s,
                onAction: r,
                variant: i
            } = e;
            return s ? l.default.createElement(a.Button, {
                asChild: !0,
                size: "Small",
                variant: i,
                onClick: r
            }, l.default.cloneElement(s, {}, t)) : n ? l.default.createElement(a.Button, {
                as: "a",
                href: n,
                size: "Small",
                variant: i,
                onClick: r
            }, t) : l.default.createElement(a.Button, {
                size: "Small",
                variant: i,
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
            return n ? l.default.createElement(s.Link, {
                asChild: !0,
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, l.default.cloneElement(n, {}, t)) : a ? l.default.createElement(s.Link, {
                href: a,
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t) : l.default.createElement(s.Link, {
                as: "button",
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t)
        },
        h = (0, l.forwardRef)((e, a) => {
            let {
                children: s,
                variant: h = "System",
                severity: v = "Info",
                primaryActionLabel: y,
                primaryActionHref: g,
                primaryActionLinkTarget: f,
                onPrimaryAction: A,
                secondaryActionLabel: b,
                secondaryActionHref: T,
                secondaryActionLinkTarget: I,
                onSecondaryAction: S,
                hasCloseAffordance: C = !0,
                closeLabel: E = "Dismiss alert",
                onDismiss: x,
                className: w,
                style: D,
                ...N
            } = e, L = (0, n.default)("foundation-web-alert-message-"), k = !!y, P = !!b, M = !!(C && x), U = "Feedback" === h && (k || P || M), _ = "Warning" === v || "Error" === v ? "alert" : "status", F = null;
            k && (F = P ? l.default.createElement(m, {
                label: y || "",
                href: g,
                linkTarget: f,
                onAction: A,
                variant: "Standard"
            }) : l.default.createElement(p, {
                label: y || "",
                href: g,
                linkTarget: f,
                onAction: A
            }));
            let B = P ? l.default.createElement(m, {
                label: b || "",
                href: T,
                linkTarget: I,
                onAction: S,
                variant: "Utility"
            }) : null;
            return l.default.createElement("div", {
                ref: a,
                role: U ? "region" : _,
                "aria-labelledby": U ? L : void 0,
                className: (0, i.default)("foundation-web-alert relative width-full stroke-standard", "System" === h ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", d[v], w),
                ...N
            }, l.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, i.default)("absolute inset-[0] pointer-events-none", "Feedback" === h && "radius-medium"),
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
                className: (0, i.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", P ? "flex-col" : "wrap")
            }, l.default.createElement("div", {
                id: U ? L : void 0,
                role: U ? _ : void 0,
                className: (0, i.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", P ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, s), (F || B) && l.default.createElement("div", {
                className: (0, i.default)("flex items-center gap-small wrap shrink-0", !P && "padding-y-[var(--size-150)]")
            }, F, B)), M && l.default.createElement(r.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": E,
                onClick: x
            })))
        });
    e.s(["Alert", 0, h])
}, 222643, e => {
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
                aspectRatio: i = "1:1",
                alt: l,
                containerClassName: o,
                ...c
            } = e;
            return a.default.createElement("div", {
                className: (0, t.default)("foundation-web-media clip", n[i], o)
            }, a.default.createElement("img", {
                ref: s,
                className: (0, t.default)("foundation-web-media-image", r),
                alt: l,
                ...c
            }))
        });
    s.displayName = "Media", e.s(["Media", 0, s])
}, 517359, e => {
    "use strict";
    var t = e.i(659332),
        a = e.i(306607),
        n = e.i(197649),
        s = e.i(416340),
        r = e.i(425353);
    let i = e => {
            let {
                type: t,
                sideSheetSide: a = "right",
                isSideSheetFlush: i = !1,
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
            return s.default.createElement(r.Portal, null, s.default.createElement(r.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? i : void 0,
                "data-size": "centerSheet" === t ? l : void 0,
                className: (0, n.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", c)
            }, s.default.createElement(r.Content, {
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
                hasPaddingX: i = !0,
                ...l
            } = e, {
                type: o
            } = u();
            return s.default.createElement("div", {
                ref: t,
                className: (0, n.default)("scroll-y", i && m, "sideSheet" === o ? "grow-1" : "", r),
                ...l
            }, a)
        });
    p.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        let {
            children: t,
            className: r,
            ...i
        } = e;
        return s.default.createElement(s.default.Fragment, null, s.default.createElement(a.Divider, null), s.default.createElement("div", {
            className: (0, n.default)(m, "margin-y-small shrink-0", r),
            ...i
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
                largeScreenClassName: v,
                onOpenAutoFocus: y,
                onCloseAutoFocus: g,
                onPointerDownOutside: f,
                onEscapeKeyDown: A,
                onInteractOutside: b
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
            C = (0, n.default)(m, T && p, I && h, !T && !I && v);
        return s.default.createElement(d.Provider, {
            value: S
        }, s.default.createElement(i, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: I,
            centerSheetSize: r,
            contentClassName: C,
            onOpenAutoFocus: null != y ? y : l,
            onCloseAutoFocus: g,
            onPointerDownOutside: f,
            onEscapeKeyDown: A,
            onInteractOutside: b
        }, a))
    }, "SheetDescription", 0, e => s.default.createElement(r.Description, {
        asChild: !0,
        ...e
    }), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: n,
            children: i
        } = e;
        return s.default.createElement(r.Root, {
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
        } = u(), p = s.default.createElement(r.Title, {
            className: "text-heading-small margin-none"
        }, i);
        return s.default.createElement("div", {
            className: (0, n.default)(a, l ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, s.default.createElement("div", {
            className: (0, n.default)("flex items-center", l && "gap-xsmall")
        }, l, d ? s.default.createElement(c.VisuallyHidden, null, p) : p), s.default.createElement("div", {
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
    })], 517359)
}, 986939, e => {
    "use strict";
    var t = e.i(603955),
        a = e.i(408832),
        n = e.i(750615),
        s = e.i(197649),
        r = e.i(416340);
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
                defaultValue: v,
                isDisabled: y,
                hasError: g,
                helperText: f,
                className: A,
                style: b,
                textareaClassName: T,
                textareaStyle: I,
                id: S,
                ...C
            } = e, E = (0, a.default)(), x = S || E, w = "".concat(x, "-description"), D = null != u ? u : "Large";
            return r.default.createElement("div", {
                className: (0, s.default)("flex fill flex-col width-full gap-small", {
                    [t.disabledOpacity]: y
                }, A),
                style: b
            }, p && r.default.createElement("label", {
                htmlFor: x,
                className: (0, s.default)(o[D], "content-emphasis")
            }, p), r.default.createElement("textarea", {
                ref: d,
                id: x,
                "data-testid": "text-area-container",
                style: I,
                className: (0, s.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", n.INPUT_BACKGROUND_BY_VARIANT[m], n.INPUT_STROKE_BY_VARIANT[m], g ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", c[D], i[D], l[D], T),
                value: h,
                defaultValue: null == h ? v : void 0,
                disabled: y,
                "aria-describedby": f ? w : void 0,
                ...C
            }), f && r.default.createElement("span", {
                id: w,
                className: (0, s.default)("text-caption-small", {
                    "content-system-alert": g,
                    "content-default": !g
                })
            }, f))
        });
    d.displayName = "TextArea", e.s(["TextArea", 0, d])
}, 763833, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["ArrowDownwardIcon", () => t.ArrowDownward])
}, 650642, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["ArrowUpwardIcon", () => t.ArrowUpward])
}]);

//# debugId=940c050c-0670-4281-6f11-d7b0583460ca
//# sourceMappingURL=1tk7gc78bso8m.js.map