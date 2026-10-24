;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "aa076782-a193-e7de-4e73-7fd5cfc31eb8")
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
        s = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableAvatarCreationTokenCategories",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
    e.s(["enableAvatarCreationTokenCategories", 0, r, "enableBulkMakeupTokenCreation", 0, n, "enableCoreContentGatedBanner", 0, o, "enableCreatorShowcases", 0, s, "enableTaxonomyBasedCreatorDashboard", 0, a, "isAutoPublishPreferencesEnabled", 0, i, "showTaxonomyOnAvatarItemAnalyticsTab", 0, l])
}, 134731, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
    e.s(["isAssetAccessRequestsEnabled", 0, s, "isAssetDependenciesViewerEnabled", 0, n, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, i, "isModelCustomThumbnailUploadEnabled", 0, r, "isPricingEligibilityV2Enabled", 0, l, "isPublishBeforeExposeEnabled", 0, o])
}, 9436, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
        }),
        d = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsModeratedTabEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, l, "isMomentsModeratedTabEnabled", 0, d, "isMomentsPostCreationEnabled", 0, c, "isMomentsShareLinkEnabled", 0, o, "isMomentsSitetestUrlParsingEnabled", 0, r, "isMomentsUploadEnabled", 0, s, "isMomentsUploadLanguageSelectEnabled", 0, i, "isTextDocumentEnabled", 0, n])
}, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        s = e.i(540459),
        r = e.i(79187),
        n = e.i(814975),
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
    let u = (0, r.withTranslation)(e => {
        let {
            children: r
        } = e, {
            user: l
        } = (0, n.useAuthentication)(), u = (0, o.useCurrentGroup)(), [m, p] = (0, a.useState)(void 0), [h, g] = (0, a.useState)(), [f, v] = (0, a.useState)(), [b, y] = (0, a.useState)(), [A, T] = (0, a.useState)(), x = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == u ? void 0 : u.id) ? e : 0) !== 0
        }, [u]), [I, S] = (0, a.useState)(void 0), C = void 0 === m || void 0 === h || void 0 === f && x, w = (0, a.useCallback)(async () => {
            try {
                if (x && (null == u ? void 0 : u.id)) {
                    let e = await (0, c.getGroupCreatorMetadata)(u.id);
                    p(e);
                    return
                }
                if (!x && (null == l ? void 0 : l.id)) {
                    let e = await (0, c.getUserCreatorMetadata)();
                    p(e);
                    return
                }
            } catch (e) {
                return
            }
            p(null)
        }, [null == u ? void 0 : u.id, x, null == l ? void 0 : l.id]), E = (0, a.useCallback)(async () => {
            if (x && I || !x) try {
                let e = await (0, c.getRequirements)();
                g(e.requirements);
                return
            } catch (e) {
                return
            }
            g(null)
        }, [I, x]), _ = (0, a.useCallback)(async () => {
            if (x && (null == u ? void 0 : u.id)) try {
                let e = await (0, c.getGroupEligibility)(u.id);
                v(e.isEligible)
            } catch (e) {
                v(!1)
            }
        }, [u, x]);
        (0, a.useEffect)(() => {
            C ? T(void 0) : x && !I ? T(!1) : T(!1 === b)
        }, [x, I, b, C]), (0, a.useEffect)(() => {
            (async () => {
                if (x && (null == u ? void 0 : u.id)) {
                    var e;
                    return null == (e = (await i.default.getGroupInfo(u.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && S(e === l.id)
            })
        }, [null == u ? void 0 : u.id, x, l]), (0, a.useEffect)(() => {
            C || !h || x && !I ? y(void 0) : y((null == h ? void 0 : h.length) === 0 || (null == h ? void 0 : h.length) === 1 && h[0] === s.Requirements.Payable)
        }, [I, x, C, h]), (0, a.useEffect)(() => {
            w()
        }, [w]), (0, a.useEffect)(() => {
            E()
        }, [E]), (0, a.useEffect)(() => {
            _()
        }, [_]);
        let k = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: C,
            requiresActionToJoinProgram: A,
            compliantWithAllUserRequirements: b,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != h ? h : void 0,
            isCurrentUserGroupOwner: I,
            isGroupEligible: null != f ? f : void 0
        }), [C, A, b, m, h, I, f]);
        return (0, t.jsx)(d.Provider, {
            value: k,
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
        s = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                r = a.status % 100 * 100;
            if (!a.ok && 500 === r && t < 2) return await new Promise(e => {
                setTimeout(e, 2 ** (t + 1) * 500)
            }), s(e, t + 1);
            if (500 === r && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let n = await a.json();
            if ("object" != typeof n || null === n || !("access" in n)) throw Error('"access" not found in response');
            return n.access
        }, r = async () => await s("".concat(t, "/v1/upsell-feature-access?nameSpace=").concat(a, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted";
    e.s(["getAgeVerificationUpsellFeatureAccess", 0, r])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        s = e.i(416340),
        r = e.i(79187),
        n = e.i(335681),
        i = e.i(367808),
        l = e.i(686762),
        o = e.i(623983),
        c = e.i(748893),
        d = e.i(649114),
        u = e.i(15645),
        m = e.i(358763),
        p = e.i(889311),
        h = e.i(823062),
        g = e.i(881670),
        f = e.i(904969),
        v = e.i(906791);
    let b = (0, e.i(697973).makeStyles)()(e => ({
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
    e.s(["default", 0, b], 540082);
    var y = ((t = {}).Home = "home", t.Creations = "creations", t);
    let A = (0, r.withTranslation)(e => {
        let t, g, y, A, {
                trackingPage: T,
                alertRedesignVariant: x
            } = e,
            {
                isBannerVisible: I,
                isHighPriority: S,
                variant: C,
                dismissBanner: w
            } = (0, v.useAgeVerificationUpsellContext)(),
            {
                classes: E
            } = b(),
            _ = (0, s.useRef)(null),
            {
                unifiedLogger: k
            } = (0, h.useUnifiedLoggerProvider)(),
            {
                translate: D
            } = (0, r.useTranslation)(),
            N = (0, s.useCallback)(() => {
                I && k.logImpressionEvent({
                    eventName: p.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: T,
                        variant: C,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [k, T, C, x, I]);
        (0, m.default)(_, N);
        let L = (0, s.useCallback)(() => {
                k.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "viewDetails",
                        variant: C,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [k, T, C, x]),
            P = (0, s.useCallback)(() => {
                k.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "callToAction",
                        variant: C,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [k, T, C, x]),
            M = (0, s.useCallback)(() => {
                k.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "dismiss",
                        variant: C,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                }), w()
            }, [k, w, T, C, x]);
        return ("establishTrust" === C ? (t = "Title.EstablishTrustBanner", g = "Label.EstablishTrustBanner2", y = f.ESTABLISH_TRUST_UPSELL_GET_STARTED_URL, A = f.ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL) : (t = "Title.AgeVerificationBanner", g = "Label.AgeVerificationBanner", y = f.AGE_VERIFICATION_UPSELL_GET_STARTED_URL, A = f.AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL), I) ? (0, a.jsx)("div", {
            ref: _,
            children: (0, a.jsxs)(n.Alert, {
                className: E.alertContainer,
                severity: "ageVerification" === C && S ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(c.Button, {
                    href: y,
                    onClick: P,
                    className: E.getStarted,
                    color: "inherit",
                    size: "small",
                    children: D("Label.AgeVerificationBannerGetStarted")
                }, "getStarted"), (0, a.jsx)(d.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: M,
                    children: (0, a.jsx)(u.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(i.AlertTitle, {
                    children: D(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: D(g)
                }), " ", (0, a.jsx)(l.Link, {
                    className: E.viewDetails,
                    href: A,
                    target: "_blank",
                    color: "inherit",
                    onClick: L,
                    children: D("Label.AgeVerificationBannerViewDetails")
                })]
            })
        }) : null
    }, [g.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, A, "AgeVerificationUpsellPage", () => y], 714039)
}, 904969, e => {
    "use strict";
    e.s(["AGE_VERIFICATION_UPSELL_BANNER_END_DATE", 0, "2030-01-01T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE", 0, "2026-01-21T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_START_DATE", 0, "2025-12-03T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693", "ESTABLISH_TRUST_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693"])
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        s = e.i(458451),
        r = e.i(889311),
        n = e.i(823062),
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
        } = e, [o, c] = (0, a.useState)(!0), [g, f] = (0, a.useState)("doNotShow"), {
            isFetched: v,
            user: b
        } = (0, s.useRobloxAuthentication)(), {
            unifiedLogger: y
        } = (0, n.useUnifiedLoggerProvider)(), {
            isHighPriority: A,
            isEnabled: T
        } = (0, a.useMemo)(() => {
            let e = p(l.AGE_VERIFICATION_UPSELL_BANNER_START_DATE),
                t = p(l.AGE_VERIFICATION_UPSELL_BANNER_END_DATE),
                a = p(l.AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE),
                s = new Date;
            return {
                isHighPriority: a <= s,
                isEnabled: e <= s && s < t
            }
        }, []), x = (0, a.useCallback)(async () => {
            await u(), c(!0)
        }, [c]);
        (0, a.useEffect)(() => {
            T && v && (null == b ? void 0 : b.id) && (async () => {
                let e = !1;
                try {
                    e = await d()
                } catch (e) {
                    y.logErrorEvent({
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
                    y.logErrorEvent({
                        eventName: r.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                f(t)
            })().catch(e => {
                y.logErrorEvent({
                    eventName: r.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [T, v, b, y]);
        let I = (0, a.useMemo)(() => {
            let e = T && "doNotShow" !== g;
            return {
                isBannerVisible: e && !o,
                isBannerEligible: e,
                isHighPriority: A,
                variant: "doNotShow" !== g ? g : "ageVerification",
                dismissBanner: x
            }
        }, [T, g, o, A, x]);
        return (0, t.jsx)(m.Provider, {
            value: I,
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
        s = e.i(419652);
    e.s(["default", 0, e => {
        let {
            children: r
        } = e, [n, i] = (0, a.useState)(), l = e => {
            i(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: n,
            updateDroppedFile: l
        }), [n]);
        return (0, t.jsx)(s.default.Provider, {
            value: o,
            children: r
        })
    }])
}, 799972, e => {
    "use strict";
    var t = e.i(376618),
        a = e.i(671376);
    let {
        docs: s
    } = e.i(829425).creatorHub, r = {
        [a.Asset.Decal]: t.AssetType.Decal,
        [a.Asset.Audio]: t.AssetType.Audio,
        [a.Asset.Video]: t.AssetType.Video,
        [a.Asset.TShirt]: t.AssetType.Tshirt,
        [a.Asset.Shirt]: t.AssetType.Shirt,
        [a.Asset.Pants]: t.AssetType.Pants,
        [a.Asset.AvatarBackground]: t.AssetType.AvatarBackground,
        [a.Asset.TextDocument]: t.AssetType.TextDocument
    }, n = {
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
    }, "assetTypeInfoTextMessage", 0, n, "dashboardAssetTypeToOpenCloudAssetType", 0, r, "getInfoUrl", 0, e => {
        switch (e) {
            case a.Asset.Decal:
                return s.getDecalReferenceUrl();
            case a.Asset.TShirt:
            case a.Asset.Shirt:
            case a.Asset.Pants:
                return s.getClassicClothingUrl();
            case a.Asset.Audio:
                return s.getAudioAssetsUrl();
            case a.Asset.Video:
                return s.getAssetsUrl();
            case a.Asset.AvatarBackground:
                return s.getAvatarItemsUrl();
            case a.Asset.TextDocument:
                return s.getAssetsUrl();
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
        s = e.i(589624),
        r = e.i(812077),
        n = e.i(278862),
        i = e.i(197649),
        l = e.i(79187),
        o = e.i(345886),
        c = e.i(29929),
        d = e.i(889311),
        u = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        h = e.i(114209),
        g = e.i(373736),
        f = e.i(917852),
        v = e.i(576069),
        b = e.i(663563);
    let y = "".concat("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/assets", "/home/publish_eligibility_banner.webp"),
        A = (0, l.withTranslation)(e => {
            var A;
            let {
                universeId: T,
                showCallToAction: x = !0
            } = e, I = (0, s.useRouter)(), {
                translateWithNamespace: S
            } = (0, l.useTranslation)(), {
                params: C,
                isFetched: w
            } = (0, m.useIXPParameters)(c.IXPLayers.CreatorHubCreationsPermission), E = C[c.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: _
            } = (0, h.useCurrentGame)(), k = null == _ ? void 0 : _.id, D = null != T ? T : k && k > 0 ? k : void 0, {
                data: N,
                isLoading: L,
                isFetching: P
            } = (0, v.useCreatorEligibility)(), M = (0, a.useRef)(!1), [U, F] = (0, a.useState)(!1), B = (null == N ? void 0 : N.ageBracket) === r.AgeBracketEnum.Over18, R = (null == N ? void 0 : N.ageBracket) === r.AgeBracketEnum.Between13And18, V = null != (A = null == N ? void 0 : N.creatorEligibility.includes(r.CreatorEligibilityEnum.IdVerified)) && A, j = B || R, q = w && E && !(L || P) && !!N && !V;
            (0, a.useEffect)(() => {
                q && !M.current && (M.current = !0, u.default.logImpressionEvent({
                    eventName: d.default.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: j ? "start" : "viewDetails",
                        ctaHidden: String(!x),
                        ...D ? {
                            universeId: String(D)
                        } : {}
                    }
                }))
            }, [q, x, j, D]);
            let O = (0, a.useCallback)(() => {
                if (!q) return;
                let e = j ? "start" : "viewDetails";
                (u.default.logClickEvent({
                    eventName: d.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...D ? {
                            universeId: String(D)
                        } : {}
                    }
                }), R) ? F(!0): j || I.push("/settings/eligibility/publishing-permissions")
            }, [q, R, I, j, D]);
            return q ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, i.clsx)(b.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
                    children: [(0, t.jsx)("img", {
                        src: y,
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
                        className: (0, i.clsx)(b.default.heroTextContent, "color-mode-dark relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [S(p.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: S(p.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, i.clsx)(b.default.buttonRow, "flex gap-small"),
                            children: x ? B ? (0, t.jsx)(n.Button, {
                                as: "a",
                                href: f.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: O,
                                children: (0, t.jsx)("span", {
                                    children: S(p.TranslationNamespace.AudienceReach, j ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(n.Button, {
                                onClick: O,
                                children: (0, t.jsx)("span", {
                                    children: S(p.TranslationNamespace.AudienceReach, j ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), R ? (0, t.jsx)(g.default, {
                    open: U,
                    onOpenChange: F,
                    onContinueWithId: () => {
                        window.open(f.idVerificationActionUrl, "_blank", "noopener,noreferrer"), F(!1)
                    },
                    onAddParent: () => {
                        window.open(f.parentLinkActionUrl, "_blank", "noopener,noreferrer"), F(!1)
                    }
                }) : null]
            }) : null
        }, [p.TranslationNamespace.AudienceReach, p.TranslationNamespace.PublicPublish]);
    e.s(["default", 0, A])
}, 899441, e => {
    "use strict";
    var t, a, s = e.i(102211),
        r = e.i(272593),
        n = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.TextDocument = "TextDocument", t.Video = "Video", t),
        i = ((a = {}).Group = "groups", a.User = "users", a);
    let l = new s.CreatorInventoryApi((0, r.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => n, "CreatorInventoryScopeType", () => i, "searchCreatorInventoryItems", 0, (e, t, a) => (null == t.isArchived && null == t.orderBy ? l : l.withPreMiddleware(async e => {
        let {
            url: a,
            init: s
        } = e;
        return {
            url: ((e, t) => {
                let {
                    isArchived: a,
                    orderBy: s
                } = t;
                if (null == a && null == s) return e;
                let r = e.indexOf("?"),
                    n = -1 === r ? e : e.slice(0, r),
                    i = (-1 === r ? [] : e.slice(r + 1).split("&")).map(e => null != a && e.startsWith("filter=") ? "".concat(e).concat(encodeURIComponent(";isArchived=".concat(a))) : e);
                return null != s && i.push("orderBy=".concat(encodeURIComponent(s))), "".concat(n, "?").concat(i.join("&"))
            })(a, t),
            init: s
        }
    })).creatorInventorySearchCreatorInventoryItems(e, a)])
}, 445550, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(309999),
        s = e.i(307529),
        r = e.i(272593);
    let n = {
            [s.default.Model]: a.CategoryType.Model,
            [s.default.Plugin]: a.CategoryType.Plugin
        },
        i = {
            3: s.default.Audio,
            10: s.default.Model,
            13: s.default.Decal,
            38: s.default.Plugin,
            40: s.default.MeshPart,
            62: s.default.Video
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
            async getCreations(e, t, a, s, r, i, l) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: n[t],
                    limit: s,
                    cursor: r,
                    separateModelsAndPackages: i,
                    includeSharedAssets: l
                }) : this.toolboxApi.toolboxGetUserCreationAssets({
                    userId: e,
                    assetType: n[t],
                    limit: s,
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
        s = e.i(272593);
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
                const e = (0, s.createClientConfiguration)("users", "bedev1");
                this.displayNameApi = new a.DisplayNamesApi(e), this.usersApi = new a.UsersApi(e), this.userSearchApi = new a.UserSearchApi(e)
            }
        },
        n = new a.UsersApi((0, s.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: n
    }, "default", 0, r])
}, 131385, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(780880),
        s = e.i(339544),
        r = e.i(643093),
        n = e.i(130778),
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
            s = (0, i.useQuery)({
                queryKey: ["getAvatarItemsEntryPointAssetTypes"],
                queryFn: d.getAvatarItemsEntryPointAssetTypes,
                enabled: e,
                staleTime: 3e5
            }),
            n = s.data,
            u = (0, t.useMemo)(() => {
                var e, t;
                return {
                    enableMakeupAssets: null != (e = null == n ? void 0 : n.has(c.Asset.EyeMakeup)) && e,
                    enableAvatarBackgrounds: null != (t = null == n ? void 0 : n.has(c.Asset.AvatarBackground)) && t
                }
            }, [n]),
            m = (0, t.useMemo)(() => (0, r.transformCreatorDashboardTree)(a.data, u), [a.data, u]),
            p = (0, t.useMemo)(() => (0, r.buildTaxonomyL1Options)(m), [m]);
        return {
            response: a.data,
            categories: m,
            l1Options: p,
            isLoading: a.isLoading || s.isLoading,
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
        } = u(e), g = (0, n.isAllAssetTypesActiveTab)(c) || (0, n.isRecentsActiveTab)(c) || (0, n.isAvatarLooksActiveTab)(c) ? void 0 : null != (i = (0, n.parseTaxonomyActiveTab)(c)) ? i : null == (o = m[0]) ? void 0 : o.taxonomyKey, f = (0, t.useMemo)(() => (0, r.findL1Category)(p, g), [p, g]), v = (0, t.useMemo)(() => (0, r.buildTaxonomyL2Options)(f), [f]), b = parseInt(null != (l = null == d ? void 0 : d.toString()) ? l : "", 10), y = (0, s.isValidIndex)(b, v) ? b : 0, A = (0, t.useMemo)(() => {
            if (f) return v.length > 0 ? v[y] : f.webStableId ? (0, r.categoryToDropdown)(f) : void 0
        }, [f, v, y]);
        return {
            l1Options: m,
            activeL1Key: g,
            activeL1Node: f,
            l2Options: v,
            filterIndex: y,
            selection: A,
            isLoading: h
        }
    }], 131385)
}, 638016, e => {
    "use strict";
    var t = e.i(780880),
        a = e.i(723538),
        s = e.i(130778);
    e.s(["default", 0, e => {
        let [{
            activeTab: r
        }] = (0, t.useQueryParams)(["activeTab"]), n = (0, a.default)(), i = n && (0, s.isTaxonomyActiveTab)(r), l = n && (0, s.isAvatarLooksActiveTab)(r);
        return {
            canUseTaxonomy: n && (i || (0, s.isTaxonomyEligibleAssetTab)(e)),
            isTaxonomyMode: i,
            isTaxonomyView: i && !(0, s.isAllAssetTypesActiveTab)(r) && !(0, s.isRecentsActiveTab)(r) && !(0, s.isAvatarLooksActiveTab)(r),
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
            let [s, r] = e;
            r.forEach((e, r) => {
                t.set(a(s, e.nameKey), r)
            })
        }), t
    }, "isOnItemTab", 0, e => e === t.Asset.TShirt, "isValidIndex", 0, (e, t) => void 0 !== t && void 0 !== e && e > 0 && e < t.length, "serializeMenuMapKey", 0, a], 339544);
    var s = e.i(266213),
        r = e.i(418162);
    let n = new Set([2, 11, 12]),
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
            lookType: s.default.Makeup,
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
        let s = null != (a = null == e ? void 0 : e.categories) ? a : [],
            r = [],
            o = [];
        return s.forEach(e => {
            var a, s, u;
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
                    if (c(e, n)) return void r.push(e);
                    p.push(e)
                }
            }), 0 !== p.length && e.webStableId && o.push({
                key: e.webStableId,
                name: null != (s = e.name) ? s : "",
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
    var t, a, s, r = e.i(671376),
        n = e.i(692587),
        i = e.i(117236);
    let l = "AvatarItems",
        o = "".concat(l, "-"),
        c = r.Asset.HairAccessory;

    function d(e) {
        let t = (0, n.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let u = "looks",
        m = new Set(null != (t = null == (s = i.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = s.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

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
        return "Recents" === (0, n.readQueryValue)(e) || "recents" === d(e)
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, n.readQueryValue)(e);
        return a === l || null != (t = null == a ? void 0 : a.startsWith(o)) && t
    }, "isTaxonomyEligibleAssetTab", 0, p, "parseTaxonomyActiveTab", 0, d, "shouldOpenTaxonomyView", 0, function(e) {
        let {
            isTaxonomyEnabled: t,
            isChangingSection: a,
            nextAssetType: s
        } = e;
        return t && a && p(s)
    }])
}, 456810, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(9618),
        s = e.i(54842),
        r = e.i(252842),
        n = e.i(671376);
    let i = {
            [n.Asset.Place]: a.SearchSortParameter.LastUpdated,
            [n.Asset.UpcomingEvent]: s.EventSortBy.StartUtc,
            [n.Asset.PastEvent]: s.EventSortBy.StartUtc,
            [n.Asset.DraftEvent]: s.EventSortBy.StartUtc
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
}, 376204, e => {
    "use strict";
    var t = e.i(29929),
        a = e.i(227700);
    e.s(["default", 0, () => {
        let {
            isFetched: e,
            params: s
        } = (0, a.useIXPParameters)(t.IXPLayers.CreatorHubPublishing, {
            restoreInitialValueFromCache: !0
        }), r = s[t.CreatorHubPublishingParameters.EnableMultiAssetSearch];
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
    var t, a, s, r = e.i(102211),
        n = e.i(899441),
        i = e.i(361738),
        l = e.i(671376),
        o = ((t = {}).All = "All", t),
        c = ((a = {}).All = "All", a),
        d = ((s = {}).CreatedNewest = "created_desc", s.CreatedOldest = "created_asc", s.UpdatedNewest = "updated_desc", s.UpdatedOldest = "updated_asc", s);
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
        h = [n.CreatorInventoryAssetType.Model, n.CreatorInventoryAssetType.Plugin, n.CreatorInventoryAssetType.Audio, n.CreatorInventoryAssetType.Decal, n.CreatorInventoryAssetType.Image, n.CreatorInventoryAssetType.Video, n.CreatorInventoryAssetType.Mesh, n.CreatorInventoryAssetType.MeshPart, n.CreatorInventoryAssetType.Animation],
        g = [...h, n.CreatorInventoryAssetType.TextDocument],
        f = new Set([n.CreatorInventoryAssetType.Audio, n.CreatorInventoryAssetType.Decal, n.CreatorInventoryAssetType.MeshPart, n.CreatorInventoryAssetType.TextDocument, n.CreatorInventoryAssetType.Video]),
        v = new Set([...f, n.CreatorInventoryAssetType.Image]),
        b = new Set(g),
        y = new Set([n.CreatorInventoryAssetType.TextDocument]),
        A = new Set(["All", i.CreatorInventorySourceType.Created, i.CreatorInventorySourceType.Purchased, i.CreatorInventorySourceType.Shared]),
        T = new Set([l.Asset.Animation, l.Asset.Audio, l.Asset.Decal, l.Asset.Image, l.Asset.Mesh, l.Asset.MeshPart, l.Asset.Model, l.Asset.Plugin, l.Asset.Video]),
        x = {
            [n.CreatorInventoryAssetType.Animation]: l.Asset.Animation,
            [n.CreatorInventoryAssetType.Audio]: l.Asset.Audio,
            [n.CreatorInventoryAssetType.Decal]: l.Asset.Decal,
            [n.CreatorInventoryAssetType.Image]: l.Asset.Image,
            [n.CreatorInventoryAssetType.Mesh]: l.Asset.Mesh,
            [n.CreatorInventoryAssetType.MeshPart]: l.Asset.MeshPart,
            [n.CreatorInventoryAssetType.Model]: l.Asset.Model,
            [n.CreatorInventoryAssetType.Plugin]: l.Asset.Plugin,
            [n.CreatorInventoryAssetType.TextDocument]: l.Asset.TextDocument,
            [n.CreatorInventoryAssetType.Video]: l.Asset.Video
        },
        I = {
            [n.CreatorInventoryAssetType.Animation]: r.AssetType.Animation,
            [n.CreatorInventoryAssetType.Audio]: r.AssetType.Audio,
            [n.CreatorInventoryAssetType.Decal]: r.AssetType.Decal,
            [n.CreatorInventoryAssetType.Image]: r.AssetType.Image,
            [n.CreatorInventoryAssetType.Mesh]: r.AssetType.Mesh,
            [n.CreatorInventoryAssetType.MeshPart]: r.AssetType.MeshPart,
            [n.CreatorInventoryAssetType.Model]: r.AssetType.Model,
            [n.CreatorInventoryAssetType.Plugin]: r.AssetType.Plugin,
            [n.CreatorInventoryAssetType.TextDocument]: r.AssetType.TextDocument,
            [n.CreatorInventoryAssetType.Video]: r.AssetType.Video
        },
        S = {
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
        C = {
            createdDetails: i.CreatorInventorySourceType.Created,
            purchasedDetails: i.CreatorInventorySourceType.Purchased,
            sharedDetails: i.CreatorInventorySourceType.Shared
        },
        w = {
            [r.State.Active]: "Active",
            [r.State.Archived]: "Archived"
        },
        E = e => !0 === e ? g : h,
        _ = e => null != e && v.has(e),
        k = e => {
            if (null == e) return;
            let t = e instanceof Date ? e : new Date(e);
            return Number.isNaN(t.getTime()) ? void 0 : t
        };
    e.s(["DEFAULT_DEVELOPMENT_ITEMS_SORT", 0, "updated_desc", "DevelopmentItemsAssetTypeFilter", () => c, "DevelopmentItemsSort", () => d, "DevelopmentItemsSourceFilter", () => o, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: n.CreatorInventoryScopeType.Group,
        id: t
    } : null != e ? {
        type: n.CreatorInventoryScopeType.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        ...0 === t.length ? {} : {
            assetTypes: t.map(e => I[e])
        },
        ...e.type === n.CreatorInventoryScopeType.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(i.CreatorInventorySourceType.Created), "developmentItemsSortOptions", 0, u, "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getCreatorInventoryOrderBy", 0, (e, t) => t.trim().length > 0 ? void 0 : m[e], "getDevelopmentItemsAssetTypes", 0, E, "getDevelopmentItemsColumnSortDirection", 0, (e, t) => e === p[t].ascending ? "ascending" : e === p[t].descending ? "descending" : "none", "getDevelopmentItemsSearchAssetTypes", 0, (e, t) => [e, ...E(t).filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => x[e], "getNextDevelopmentItemsColumnSort", 0, (e, t) => e === p[t].descending ? p[t].ascending : p[t].descending, "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: s
        } = e;
        return t.trim().length > 0 || a || s !== i.CreatorInventorySourceType.Created
    }, "hasDevelopmentItemCreatorStorePage", 0, e => e !== n.CreatorInventoryAssetType.TextDocument, "hasDevelopmentItemThumbnail", 0, e => e !== n.CreatorInventoryAssetType.TextDocument, "isDevelopmentItemArchivedViewAvailable", 0, _, "isDevelopmentItemAsset", 0, (e, t) => e === l.Asset.TextDocument ? !0 === t : T.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && f.has(e), "isDevelopmentItemsAllAssetTypes", 0, e => "All" === e, "isDevelopmentItemsArchivedViewAvailable", 0, (e, t) => t || _(1 === e.length ? e[0] : void 0), "isDevelopmentItemsAssetType", 0, (e, t) => null != e && !!b.has(e) && (!y.has(e) || !0 === t), "isDevelopmentItemsSort", 0, e => u.some(t => t === e), "isDevelopmentItemsSourceSelection", 0, e => null != e && A.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, s, r, n, i, l;
        let o, c = null == (s = e.assetItem) ? void 0 : s.asset;
        if (null == c) return;
        let d = "number" == typeof c.assetId ? c.assetId : Number.parseInt(null != (t = c.assetId) ? t : "", 10);
        if (Number.isNaN(d)) return;
        let u = null == (r = c.displayName) ? void 0 : r.trim();
        return {
            id: null != (a = e.path) ? a : d.toString(),
            assetId: d,
            assetType: (e => {
                if (null != e) return S[e.toString().toUpperCase()]
            })(c.assetType),
            created: k(c.createTime),
            isPackage: (null == (n = e.assetItem) ? void 0 : n.isPackage) === !0,
            name: null == u || 0 === u.length ? d.toString() : u,
            sources: (l = null == (i = e.assetItem) ? void 0 : i.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let s = C[t];
                    null != s && o.add(s)
                })
            }), [...o]),
            state: null == c.state ? void 0 : w[c.state],
            updated: k(c.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let s = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => null != e.assetType && (0 === a.length || a.includes(e.assetType)) && !s.has(e.assetId))]
    }], 211461);
    var D = e.i(416340),
        N = e.i(79187),
        L = e.i(884213),
        P = e.i(401263),
        M = e.i(730530),
        U = e.i(881670);
    e.s(["default", 0, () => {
        let e = (0, N.useTranslation)(),
            {
                translate: t
            } = e,
            {
                tPendingTranslation: a
            } = (0, P.default)(e),
            s = (0, D.useCallback)((e, t, s, r) => {
                let n = a(e, t, s, r);
                return n.length > 0 ? n : (0, L.default)(e, r)
            }, [a]),
            r = (0, D.useCallback)(e => t("Label.AssetIDWithValue", {
                assetId: e.toString()
            }), [t]),
            n = (0, D.useCallback)(e => s("Clear {filterLabel}", "Accessible label for removing an active Development Items filter chip.", (0, M.translationKey)("Action.DevelopmentItems.ClearFilter", U.TranslationNamespace.Creations), {
                filterLabel: e
            }), [s]),
            i = (0, D.useCallback)(e => s("Source: {source}", "Active filter chip describing the selected Development Items source.", (0, M.translationKey)("Label.DevelopmentItems.InventorySourceFilter", U.TranslationNamespace.Creations), {
                source: e
            }), [s]),
            l = (0, D.useCallback)((e, t) => s("{assetTypes}, +{count} more", "Active filter chip listing the first selected Development Items asset types, then how many more are selected.", (0, M.translationKey)("Label.DevelopmentItems.AssetTypesWithMore", U.TranslationNamespace.Creations), {
                assetTypes: e,
                count: t.toString()
            }), [s]),
            o = (0, D.useCallback)(e => s("{count} types", "Asset type filter text when the creator selects more than one Development Items asset type.", (0, M.translationKey)("Label.DevelopmentItems.AssetTypeCount", U.TranslationNamespace.Creations), {
                count: e.toString()
            }), [s]),
            c = (0, D.useCallback)((e, t) => s("{query} in {assetType}", "Scoped-search suggestion that searches for a query within a Development Items asset type.", (0, M.translationKey)("Label.DevelopmentItems.SearchSuggestion", U.TranslationNamespace.Creations), {
                assetType: t,
                query: e
            }), [s]);
        return {
            actions: s("Actions", "Development Items table column and accessible label for item actions.", (0, M.translationKey)("Label.DevelopmentItems.Actions", U.TranslationNamespace.Creations)),
            acquiredFromStore: t("Label.CreatorStore"),
            allAssetTypes: s("All Types", "Asset type filter text when every Development Items asset type is included.", (0, M.translationKey)("Label.DevelopmentItems.AllAssetTypes", U.TranslationNamespace.Creations)),
            allSources: s("Any", "Source filter option that includes every Development Items source.", (0, M.translationKey)("Label.DevelopmentItems.AllSources", U.TranslationNamespace.Creations)),
            assetId: t("Label.AssetID"),
            assetIdWithValue: r,
            assetTypeCount: o,
            assetTypesWithMore: l,
            assetType: s("Asset type", "Accessible label for the Development Items asset type filter.", (0, M.translationKey)("Label.DevelopmentItems.AssetType", U.TranslationNamespace.Creations)),
            breadcrumbs: s("Breadcrumbs", "Accessible label for the page path shown above the Development Items page.", (0, M.translationKey)("Label.DevelopmentItems.Breadcrumbs", U.TranslationNamespace.Creations)),
            dateCreated: s("Date created", "Development Items table column showing when an asset was created.", (0, M.translationKey)("Label.DevelopmentItems.DateCreated", U.TranslationNamespace.Creations)),
            clearFilter: n,
            clearSearch: s("Clear search", "Accessible label and action for clearing the Development Items search query.", (0, M.translationKey)("Action.DevelopmentItems.ClearSearch", U.TranslationNamespace.Creations)),
            filterBy: t("Label.FilterBy"),
            firstPage: s("First page", "Accessible label for the Development Items pagination first-page button.", (0, M.translationKey)("Action.DevelopmentItems.FirstPage", U.TranslationNamespace.Creations)),
            grid: s("Grid", "Accessible label for the Development Items grid view.", (0, M.translationKey)("Label.DevelopmentItems.GridView", U.TranslationNamespace.Creations)),
            inventorySource: s("Source", "Label for the Development Items source filter and table column.", (0, M.translationKey)("Label.DevelopmentItems.InventorySource", U.TranslationNamespace.Creations)),
            inventorySourceFilter: i,
            lastPage: s("Last page", "Accessible label for the Development Items pagination last-page button.", (0, M.translationKey)("Action.DevelopmentItems.LastPage", U.TranslationNamespace.Creations)),
            lastUpdated: t("Label.LastUpdated"),
            list: s("List", "Accessible label for the Development Items list view.", (0, M.translationKey)("Label.DevelopmentItems.ListView", U.TranslationNamespace.Creations)),
            loading: t("Label.Loading"),
            name: t("Label.Name"),
            nextPage: s("Next page", "Accessible label for the Development Items pagination next-page button.", (0, M.translationKey)("Action.DevelopmentItems.NextPage", U.TranslationNamespace.Creations)),
            noArchivedItemsDescription: s("Items you archive will show up here.", "Guidance shown when the Development Items Archived folder is empty.", (0, M.translationKey)("Description.DevelopmentItems.NoArchivedItems", U.TranslationNamespace.Creations)),
            noArchivedItems: s("No archived items", "Heading shown when the Development Items Archived folder is empty.", (0, M.translationKey)("Heading.DevelopmentItems.NoArchivedItems", U.TranslationNamespace.Creations)),
            noDevelopmentItemsDescription: s("Upload assets to see them here.", "Guidance shown when the creator has no Development Items across all asset types.", (0, M.translationKey)("Description.DevelopmentItems.NoDevelopmentItems", U.TranslationNamespace.Creations)),
            noDevelopmentItems: s("No development items yet", "Heading shown when the creator has no Development Items across all asset types.", (0, M.translationKey)("Heading.DevelopmentItems.NoDevelopmentItems", U.TranslationNamespace.Creations)),
            noItemsDescription: s("Try another search or filter.", "Guidance shown when no Development Items match the current query and filters.", (0, M.translationKey)("Description.DevelopmentItems.NoItemsFound", U.TranslationNamespace.Creations)),
            noItems: s("No items found", "Heading shown when no Development Items match the current query and filters.", (0, M.translationKey)("Heading.DevelopmentItems.NoItemsFound", U.TranslationNamespace.Creations)),
            package: s("Package", "Accessible label for the package indicator on a Development Item thumbnail.", (0, M.translationKey)("Label.DevelopmentItems.Package", U.TranslationNamespace.Creations)),
            previousPage: s("Previous page", "Accessible label for the Development Items pagination previous-page button.", (0, M.translationKey)("Action.DevelopmentItems.PreviousPage", U.TranslationNamespace.Creations)),
            retry: t("Action.Retry"),
            rowsPerPage: t("Label.RowsPerPage"),
            search: t("Label.Search"),
            searchSuggestion: c,
            searchWithinAssetType: s("Search within asset type", "Accessible label for Development Items scoped-search suggestions.", (0, M.translationKey)("Label.DevelopmentItems.SearchWithinAssetType", U.TranslationNamespace.Creations)),
            sortBestMatch: s("Sort by: Best match", "Development Items sort shown while a search query ranks results by relevance.", (0, M.translationKey)("Label.DevelopmentItems.SortByBestMatch", U.TranslationNamespace.Creations)),
            sortBy: s("Sort by", "Accessible label for the Development Items sort selector.", (0, M.translationKey)("Label.DevelopmentItems.SortBy", U.TranslationNamespace.Creations)),
            sortDateAddedAsc: s("Sort by: Date added (Asc)", "Development Items sort option listing the earliest created assets first. Asc is short for ascending.", (0, M.translationKey)("Label.DevelopmentItems.SortByDateAddedAsc", U.TranslationNamespace.Creations)),
            sortDateAddedDesc: s("Sort by: Date added (Desc)", "Development Items sort option listing the most recently created assets first. Desc is short for descending.", (0, M.translationKey)("Label.DevelopmentItems.SortByDateAddedDesc", U.TranslationNamespace.Creations)),
            sortUpdatedAsc: s("Sort by: Updated (Asc)", "Development Items sort option listing the least recently updated assets first. Asc is short for ascending.", (0, M.translationKey)("Label.DevelopmentItems.SortByUpdatedAsc", U.TranslationNamespace.Creations)),
            sortUpdatedDesc: s("Sort by: Updated (Desc)", "Development Items sort option listing the most recently updated assets first. Desc is short for descending.", (0, M.translationKey)("Label.DevelopmentItems.SortByUpdatedDesc", U.TranslationNamespace.Creations)),
            sharedWithMe: s("Shared with me", "Source filter option for Development Items shared with the current creator.", (0, M.translationKey)("Label.DevelopmentItems.SharedWithMe", U.TranslationNamespace.Creations)),
            showHiddenBreadcrumbs: s("Show hidden pages", "Accessible label for the button that expands collapsed pages in the Development Items breadcrumbs.", (0, M.translationKey)("Action.DevelopmentItems.ShowHiddenBreadcrumbs", U.TranslationNamespace.Creations)),
            unavailableDescription: s("Try again in a moment.", "Guidance shown when the Development Items inventory cannot be loaded.", (0, M.translationKey)("Description.DevelopmentItems.InventoryUnavailable", U.TranslationNamespace.Creations)),
            unavailable: s("Inventory is unavailable", "Heading shown when the Development Items inventory cannot be loaded.", (0, M.translationKey)("Heading.DevelopmentItems.InventoryUnavailable", U.TranslationNamespace.Creations)),
            viewSelector: s("Choose grid or list view", "Accessible label for the Development Items view selector.", (0, M.translationKey)("Label.DevelopmentItems.ViewSelector", U.TranslationNamespace.Creations)),
            uploadedByMe: s("Uploaded", "Source filter option for Development Items uploaded by the current creator.", (0, M.translationKey)("Label.DevelopmentItems.UploadedByMe", U.TranslationNamespace.Creations))
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
    var t = e.i(629450),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: s
        } = (0, t.useFlag)(a.enableTaxonomyBasedCreatorDashboard);
        return e && null != s && s
    }])
}, 348558, e => {
    "use strict";
    var t = e.i(629450),
        a = e.i(9436);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: s
        } = (0, t.useFlag)(a.isTextDocumentEnabled);
        if (e) return s
    }])
}, 427149, e => {
    "use strict";
    var t = e.i(799972),
        a = e.i(671376),
        s = e.i(759283),
        r = e.i(475360),
        n = e.i(949599),
        i = e.i(117236);
    let l = i.default.reduce((e, t) => {
            var a;
            return t.submenuItems || e.set(t.type, {
                menuItem: t
            }), null == (a = t.submenuItems) || a.forEach(a => {
                if (a.submenuItems) {
                    var s;
                    null == (s = a.submenuItems) || s.forEach(s => {
                        e.set(s.type, {
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
        isMenuItemEnabled(e, s, n, i, l, o, p) {
            var h, g;
            return ((null == e ? void 0 : e.type) !== a.Asset.TextDocument || !!p) && ((null == e ? void 0 : e.type) === a.Asset.AllCatalogAsset || ((null == e ? void 0 : e.type) === a.Asset.SharedExperiences ? null == s : (null == e ? void 0 : e.type) === a.Asset.Moments ? null != l && l : (null == e ? void 0 : e.itemType) === r.Item.Bundle || (null == e ? void 0 : e.type) === d || ((null == e ? void 0 : e.type) === u ? null != (h = null == i ? void 0 : i.has(e.type)) && h : (null == e ? void 0 : e.type) === m ? null != o && o : (null == e ? void 0 : e.type) === c ? null != (g = null == i ? void 0 : i.has(null == e ? void 0 : e.type)) && g : (null == e ? void 0 : e.type) === void 0 || !!(0, t.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === n || null != n && n)))
        },
        getValidMenuState(e, t, a, s, r, n, i, l) {
            var o, d, m, p, h, g;
            let f, v, b = (null == (o = t.submenuItem) ? void 0 : o.type) !== c && (null == (d = t.submenuItem) ? void 0 : d.type) !== u || void 0 !== r;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, s, r, n, i, l)) {
                if (void 0 !== t.submenuItem && b && !this.isMenuItemEnabled(t.submenuItem, a, s, r, n, i, l))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            o = 0;
                        for (; o < (null == (p = t.menuItem.submenuItems) ? void 0 : p.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[o], a, s, r, n, i, l)) {
                                e = o;
                                break
                            }
                            o += 1
                        }
                        f = t.menuItem, v = null == (h = t.menuItem.submenuItems) ? void 0 : h[e]
                    } else f = t.menuItem, v = null == (g = t.menuItem.submenuItems) ? void 0 : g[0]
            } else [f] = e, v = null == (m = e[0].submenuItems) ? void 0 : m[0];
            return f ? {
                menuItem: f,
                submenuItem: v
            } : t
        },
        isAssetTypeDirectlyArchivable: e => i.allowedAssetTypesForDirectArchiving.has(e),
        isAssetTypeArchivable(e, t) {
            if (void 0 !== t && n.AvatarMenuMap[e]) {
                let a = n.AvatarMenuMap[e][t],
                    s = null == a ? void 0 : a.assetType;
                return (null == a ? void 0 : a.bundleType) !== void 0 || void 0 !== s && i.allowedAssetTypesForArchiving.has(s)
            }
            return i.allowedAssetTypesForArchiving.has(e)
        },
        isAssetTypeSortable: e => i.allowedAssetTypesForSorting.has(e),
        isItemTypeUploadable: e => i.allowedItemTypesForUploading.has(e),
        getAssetFullNameKey: e => s.assetFullNameKeys[e],
        getItemFullNameKey: e => s.itemFullNameKeys[e],
        getAssetType: e => e.submenuItem ? e.submenuItem.type : e.menuItem.type,
        getItemType(e) {
            return e.submenuItem && e.submenuItem.itemType ? e.submenuItem.itemType : e.menuItem.itemType ? e.menuItem.itemType : s.assetTypeToItemType[this.getAssetType(e)]
        },
        getMenuState(e, t) {
            var a;
            return e && t.includes(e) ? o : e && null != (a = l.get(e)) ? a : o
        }
    }])
}, 100226, e => {
    "use strict";
    var t = e.i(629450),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: s
        } = (0, t.useFlag)(a.enableCreatorShowcases);
        if (e) return s
    }])
}, 668091, 418564, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(109543);
    e.s(["default", 0, function() {
        return (0, t.useContext)(a.default)
    }], 668091);
    var s = e.i(221628),
        r = e.i(711950),
        n = e.i(79187);
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
        } = (0, n.useTranslation)(), [h, g] = (0, t.useState)(!0);
        if (!h) return null;
        let f = u ? {
            closeLabel: p("Action.Close"),
            onDismiss: () => {
                null == m || m(), g(!1)
            }
        } : {
            hasCloseAffordance: !1
        };
        return (0, s.jsx)(r.Alert, {
            severity: i[o],
            variant: "Feedback",
            className: "width-full",
            primaryActionLabel: d,
            primaryActionHref: c,
            ...f,
            children: (0, s.jsxs)("div", {
                className: "flex flex-col gap-xsmall",
                children: [a && (0, s.jsx)("span", {
                    className: "text-label-medium content-emphasis",
                    children: a
                }), (0, s.jsx)("span", {
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
        s = [t.Locale.Indonesian, t.Locale.German, t.Locale.English, t.Locale.Spanish, t.Locale.French, t.Locale.Italian, t.Locale.Polish, t.Locale.BrazilPortuguese, t.Locale.Vietnamese, t.Locale.Turkish, t.Locale.Arabic, t.Locale.Thai, t.Locale.SimplifiedChinese, t.Locale.TraditionalChinese, t.Locale.Japanese, t.Locale.Korean];
    e.s(["StringLocaleMap", 0, a, "availableDocsLocales", 0, s])
}, 493924, 938429, 321623, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(623983),
        s = e.i(697973),
        r = e.i(776344),
        n = e.i(462863),
        i = e.i(343885),
        l = e.i(609794),
        o = e.i(57561),
        c = e.i(509747),
        d = e.i(475555),
        u = e.i(538302),
        m = e.i(387707),
        p = e.i(262135),
        h = e.i(240731),
        g = e.i(956923),
        f = e.i(84362),
        v = e.i(214665),
        b = e.i(455506),
        y = e.i(918290),
        A = e.i(716933),
        T = e.i(347319),
        x = e.i(543657),
        I = e.i(850412),
        S = e.i(103329),
        C = e.i(692706),
        w = e.i(405654),
        E = e.i(891409),
        _ = e.i(758060),
        k = e.i(710005),
        D = e.i(495550),
        N = e.i(320429),
        L = e.i(106017),
        P = e.i(821978),
        M = e.i(766389),
        U = e.i(374717),
        F = e.i(756733),
        B = e.i(251697),
        R = e.i(411118),
        V = e.i(839596),
        j = e.i(729733),
        q = e.i(66217),
        O = e.i(148865),
        G = e.i(45512),
        K = e.i(706478),
        z = e.i(166181),
        H = e.i(37474),
        W = e.i(147189),
        Y = e.i(105897),
        X = e.i(123524),
        Q = e.i(752739),
        J = e.i(331105),
        Z = e.i(564908),
        $ = e.i(663412),
        ee = e.i(215887),
        et = e.i(962803),
        ea = e.i(914865),
        es = e.i(818392),
        er = e.i(173034),
        en = e.i(780078),
        ei = e.i(756885),
        el = e.i(260123),
        eo = e.i(507792),
        ec = e.i(850994);
    let ed = {
        secrets: {
            light: U.default,
            dark: M.default
        },
        noPermissions: {
            light: U.default,
            dark: M.default
        },
        notifications: {
            light: W.default,
            dark: H.default
        },
        experiences: {
            light: eo.default,
            dark: el.default
        },
        shareLinks: {
            light: et.default,
            dark: ee.default
        },
        eventsAndUpdates: {
            light: I.default,
            dark: x.default
        },
        avatarItem: {
            light: u.default,
            dark: d.default
        },
        models: {
            light: G.default,
            dark: O.default
        },
        plugins: {
            light: z.default,
            dark: K.default
        },
        audio: {
            light: c.default,
            dark: o.default
        },
        decals: {
            light: y.default,
            dark: b.default
        },
        images: {
            light: E.default,
            dark: w.default
        },
        videos: {
            light: ec.default,
            dark: ei.default
        },
        meshes: {
            light: q.default,
            dark: j.default
        },
        animations: {
            light: $.default,
            dark: Z.default
        },
        textDocuments: {
            light: T.default,
            dark: A.default
        },
        noUsers: {
            light: v.default,
            dark: f.default
        },
        localization: {
            light: P.default,
            dark: L.default
        },
        rightsManager: {
            light: J.default,
            dark: Q.default
        },
        tokens: {
            light: en.default,
            dark: er.default
        },
        chart: {
            light: N.default,
            dark: D.default
        },
        badge: {
            light: p.default,
            dark: m.default
        },
        apiKeys: {
            light: l.default,
            dark: i.default
        },
        signin: {
            light: es.default,
            dark: ea.default
        },
        oAuthApps: {
            light: X.default,
            dark: Y.default
        },
        makeupLooks: {
            light: B.default,
            dark: F.default
        },
        barGraph: {
            light: g.default,
            dark: h.default
        },
        leaderboard: {
            light: k.default,
            dark: _.default
        },
        findPeople: {
            light: C.default,
            dark: S.default
        },
        managedPricing: {
            light: V.default,
            dark: R.default
        }
    };
    e.s(["default", 0, ed], 938429);
    let eu = "".concat("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/assets", "/spot_illustrations"),
        em = {
            small: {
                analytics: "".concat(eu, "/small/analytics.svg"),
                animations: "".concat(eu, "/small/animations.svg"),
                audio: "".concat(eu, "/small/audio.svg"),
                audioLight: "".concat(eu, "/small/audio_light.svg"),
                audioDark: "".concat(eu, "/small/audio_dark.svg"),
                avatarItem: "".concat(eu, "/small/avatar_item.svg"),
                beginSearch: "".concat(eu, "/small/beginSearch.svg"),
                creatorStore: "".concat(eu, "/small/creator_store.svg"),
                decals: "".concat(eu, "/small/decals.svg"),
                events: "".concat(eu, "/small/events.svg"),
                experiences: "".concat(eu, "/small/experiences.svg"),
                images: "".concat(eu, "/small/images.svg"),
                meshes: "".concat(eu, "/small/meshes.svg"),
                models: "".concat(eu, "/small/models.svg"),
                plugins: "".concat(eu, "/small/plugins.svg"),
                script: "".concat(eu, "/small/script.svg"),
                song: "".concat(eu, "/small/song.svg"),
                musicNote: "".concat(eu, "/small/audio_music_note.svg"),
                noUsers: "".concat(eu, "/small/no_users.svg"),
                user: "".concat(eu, "/small/user.svg"),
                users: "".concat(eu, "/small/users.svg"),
                videos: "".concat(eu, "/small/videos.svg"),
                search: "".concat(eu, "/small/search.svg"),
                oof: "".concat(eu, "/small/oof.svg"),
                download: "".concat(eu, "/small/download.svg"),
                attributes: "".concat(eu, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(eu, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(eu, "/large/api_keys.svg"),
                localization: "".concat(eu, "/large/localization.svg"),
                noPermissions: "".concat(eu, "/large/no_permissions.svg"),
                oAuthApps: "".concat(eu, "/large/oauth_apps.svg"),
                rights: "".concat(eu, "/large/rights.svg"),
                secrets: "".concat(eu, "/large/secrets.svg"),
                shareLinks: "".concat(eu, "/large/share_links.svg"),
                configurations: "".concat(eu, "/large/configurations.svg"),
                experienceConfigs: "".concat(eu, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(eu, "/large/empty_experiments.svg")
            }
        };
    e.s(["default", 0, em], 321623);
    let ep = (0, s.makeStyles)()(() => ({
            smallContainer: {
                margin: "48px 0",
                padding: "0 24px",
                width: "100%"
            },
            largeContainer: {
                margin: "100px 0",
                width: "100%"
            },
            smallText: {
                gap: 6,
                maxWidth: 510,
                marginBottom: 16
            },
            largeText: {
                gap: 6,
                maxWidth: 480,
                marginBottom: 24
            }
        })),
        eh = e => {
            let {
                illustration: a,
                size: s = "large"
            } = e, r = a && ed[a];
            if (r) return (0, t.jsx)(n.default, {
                lightSrc: r.light,
                darkSrc: r.dark,
                alt: a
            });
            let i = a ? em[s][a] : null;
            return i && (0, t.jsx)("img", {
                height: "large" === s ? 240 : 96,
                width: "large" === s ? 320 : 96,
                src: i,
                alt: a
            })
        },
        eg = e => {
            let {
                children: s,
                title: n,
                description: i,
                size: l = "large",
                illustration: o
            } = e, {
                classes: {
                    smallContainer: c,
                    largeContainer: d,
                    smallText: u,
                    largeText: m
                },
                cx: p
            } = ep();
            return (0, t.jsxs)(r.default, {
                classes: {
                    root: p({
                        [c]: "small" === l,
                        [d]: "large" === l
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(eh, {
                    illustration: o,
                    size: l
                }), (0, t.jsxs)(r.default, {
                    classes: {
                        root: p({
                            [u]: "small" === l,
                            [m]: "large" === l
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: n
                    }), i && (0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: i
                    })]
                }), s]
            })
        };
    eg.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, eh, "default", 0, eg], 493924)
}, 321211, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340);
    e.s(["default", 0, e => {
        let {
            className: s,
            onChange: r,
            onDragActiveHandler: n,
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
        }, g = c ? c(p, h, e => {
            e.preventDefault();
            let {
                dataTransfer: {
                    files: t
                }
            } = e;
            r && r(t)
        }, e => {
            e.preventDefault(), n && n()
        }, e => {
            e.preventDefault(), i && i()
        }) : null;
        return (0, t.jsxs)("div", {
            className: s,
            children: [g, (0, t.jsx)("input", {
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
}, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["Flex", () => t.default])
}, 137785, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        s = e.i(79187),
        r = e.i(751846),
        n = e.i(623983),
        i = e.i(345886),
        l = e.i(697973),
        o = e.i(361965),
        c = e.i(686762),
        d = e.i(589418),
        u = e.i(699848),
        m = e.i(257256),
        p = e.i(17829),
        h = e.i(426546);
    let g = {
            compact: 32,
            medium: 48,
            large: 64
        },
        f = {
            compact: 12,
            medium: 16,
            large: 20
        },
        v = {
            compact: 32,
            medium: 48,
            large: 64
        },
        b = {
            compact: 4,
            medium: 6,
            large: 8
        },
        y = (0, l.makeStyles)()((e, t) => {
            let {
                variant: a
            } = t;
            return {
                container: {
                    minWidth: 0,
                    width: "fit-content"
                },
                avatarContainer: {
                    width: g[a],
                    height: g[a],
                    marginRight: f[a]
                },
                userBorderRadius: {
                    borderRadius: v[a]
                },
                nonUserBorderRadius: {
                    borderRadius: b[a]
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
                target: f,
                targetType: v,
                displayNameOverride: b,
                adornment: A,
                label: T,
                disabled: x,
                variant: I = "medium",
                disableLink: S = !1,
                obfuscate: C = !1,
                hideThumbnail: w = !1,
                hideSecondaryLabel: E = !1,
                textVariant: _ = "primary",
                labelTooltip: k,
                secondaryLabelClassName: D
            } = e,
            {
                classes: {
                    container: N,
                    avatarContainer: L,
                    thumbnailItemContainer: P,
                    thumbnailBackground: M,
                    userBorderRadius: U,
                    nonUserBorderRadius: F,
                    itemText: B,
                    mutedText: R,
                    disabledThumbnail: V,
                    textContainer: j
                },
                cx: q
            } = y({
                variant: I
            }),
            {
                translate: O
            } = (0, s.useTranslation)(),
            G = (0, a.useMemo)(() => v === p.default.User ? r.ThumbnailTypes.avatarHeadshot : v === p.default.Group ? r.ThumbnailTypes.groupIcon : "Ugc" === v ? r.ThumbnailTypes.assetThumbnail : r.ThumbnailTypes.universeThumbnail, [v]),
            K = (0, a.useMemo)(() => {
                if (!S && f.id && !C) {
                    if (v === p.default.User) return h.www.getUserUrl(f.id);
                    if (v === p.default.Group) return h.www.getGroupUrl(f.id);
                    if ("Experience" === v) {
                        let e = "rootPlaceId" in f ? f.rootPlaceId : void 0;
                        return e ? h.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === v) return h.www.getCatalogUrl(f.id)
                }
            }, [S, f, C, v]);
        b ? l = b : v === p.default.User ? l = "displayName" in f ? f.displayName : void 0 : "Ugc" !== v && (l = "name" in f ? f.name : void 0);
        let z = !b && (v === p.default.User && !("displayName" in f && f.displayName) || "Ugc" === v),
            H = (0, a.useMemo)(() => {
                let e;
                return (0, t.jsxs)(i.Grid, {
                    container: !0,
                    direction: "row",
                    alignItems: "center",
                    wrap: "wrap",
                    children: [z ? (0, t.jsx)(d.Skeleton, {
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
                        children: [(0, t.jsx)(n.Typography, {
                            className: j,
                            variant: "secondary" === _ ? "body1" : "compact" === I ? "captionHeader" : "large" === I ? "h2" : "h5",
                            color: x ? "disabled" : "inherit",
                            children: C ? O("Label.Other") : l
                        }), T && T.length > 0 && (0, t.jsx)(m.Tooltip, {
                            arrow: !0,
                            title: k,
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
                    }), !E && (0, t.jsxs)(t.Fragment, {
                        children: [v === p.default.User && (0, t.jsx)(t.Fragment, {
                            children: "name" in f && !f.name ? (0, t.jsx)(d.Skeleton, {
                                animate: !0,
                                variant: "text",
                                width: 192,
                                height: 20
                            }) : (0, t.jsx)(n.Typography, {
                                variant: "secondary" === _ ? "body2" : "captionBody",
                                className: q(j, {
                                    [R]: void 0 === D && ("secondary" === _ || "compact" === I)
                                }),
                                color: x ? "disabled" : "inherit",
                                children: (e = C ? O("Label.Other") : "@".concat("name" in f ? f.name : ""), D ? (0, t.jsx)("span", {
                                    className: D,
                                    children: e
                                }) : e)
                            })
                        }), (v === p.default.Group || "Experience" === v) && (0, t.jsx)(n.Typography, {
                            variant: "captionBody",
                            className: q(j, {
                                [R]: void 0 === D && ("secondary" === _ || "compact" === I)
                            }),
                            color: x ? "disabled" : "inherit",
                            children: D ? (0, t.jsx)("span", {
                                className: D,
                                children: C ? O("Label.Other") : f.id
                            }) : C ? O("Label.Other") : f.id
                        })]
                    })]
                })
            }, [z, l, v, f, j, x, C, O, T, E, q, R, _, I, k, D]);
        return (0, t.jsx)(i.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: N,
            children: (null == f ? void 0 : f.id) === void 0 ? (0, t.jsx)(d.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: g[I]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(i.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!w && (0, t.jsx)(i.Grid, {
                        item: !0,
                        className: P,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: q(L, {
                                [U]: v === p.default.User,
                                [F]: v !== p.default.User,
                                [V]: x
                            }),
                            children: (0, t.jsx)(r.Thumbnail2d, {
                                targetId: f.id,
                                type: G,
                                imgClassName: M,
                                alt: "thumbnail",
                                returnPolicy: r.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(i.Grid, {
                        container: !0,
                        direction: "column",
                        className: N,
                        children: (0, t.jsx)(i.Grid, {
                            item: !0,
                            children: S || C ? H : (0, t.jsx)(c.Link, {
                                href: K,
                                className: B,
                                color: "inherit",
                                children: H
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

    function s(e) {
        var t, a, s, r;
        if ((null == e ? void 0 : e.mode) === "standalone") return {
            mode: "standalone",
            shouldUnmountOnClose: null == (r = e.shouldUnmountOnClose) || r
        };
        let n = null != e ? e : {};
        return {
            mode: "content",
            size: null != (t = n.size) ? t : "Medium",
            isModal: null == (a = n.isModal) || a,
            hasCloseAffordance: void 0 !== n.closeLabel,
            closeLabel: n.closeLabel,
            hasMarginTop: n.hasMarginTop,
            hasMarginBottom: n.hasMarginBottom,
            hasDescription: n.hasDescription,
            shouldUnmountOnClose: null == (s = n.shouldUnmountOnClose) || s
        }
    }
    let r = s(),
        n = {
            ...t = (0, a.createStore)({
                render: null,
                options: null,
                isOpen: !1
            }),
            open: (e, a) => {
                t.setState({
                    render: e,
                    options: s(a),
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
    e.s(["DEFAULT_RESOLVED_CONTENT_OPTIONS", 0, r, "dialogStore", 0, n])
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
                let s = a;
                a = {
                    ...a,
                    ...e
                }, t.forEach(e => e(a, s))
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
        s = (0, t.createStore)({
            current: null
        }),
        r = {
            ...s,
            enqueue: function(e) {
                var t, r;
                let n = s.getSnapshot().current;
                null == n || null == (t = (r = n.props).onClose) || t.call(r), a += 1, s.setState({
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
                } = s.getSnapshot();
                a && (null == (e = (t = a.props).onClose) || e.call(t), s.setState({
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
            page: s,
            rowsPerPage: r,
            hasNextPage: n,
            fetchNextPage: i,
            fetchLimit: l = r
        } = a, o = (0, t.useMemo)(() => {
            let t = s * r;
            return e.slice(t, t + r)
        }, [e, s, r]), c = (s + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            c && n && (null == i || i())
        }, [c, n, i]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: s = 50,
            resetKey: r
        } = e, [n, i] = (0, t.useState)(0), [l, o] = (0, t.useState)(s), [c, d] = (0, t.useState)(r);
        r !== c && (d(r), i(0));
        let u = Math.max(0, Math.ceil(a / l) - 1),
            m = Math.min(n, u);
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
            fetchNextPage: s,
            disabled: r,
            intervalMs: n = 1e3
        } = e, i = (0, t.useRef)(s);
        i.current = s, (0, t.useEffect)(() => {
            if (!a || r) return;
            i.current();
            let e = setInterval(() => {
                i.current()
            }, n);
            return () => clearInterval(e)
        }, [a, r, n])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(602635),
        s = e.i(79187),
        r = e.i(623983),
        n = e.i(345886),
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
            ready: g
        } = (0, s.useTranslation)();
        return g ? (0, t.jsxs)(n.Grid, {
            classes: {
                root: h.container
            },
            children: [i && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(n.Grid, {
                    classes: {
                        root: h.headerContainer
                    },
                    children: [d && (0, t.jsx)(n.Grid, {
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
                    }), p && (0, t.jsx)(n.Grid, {
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
                    var s;
                    return (0, t.jsx)(a.NavigationTreeItem, {
                        label: e.label,
                        nodeId: e.key,
                        href: e.href,
                        adornment: e.adornment,
                        variant: "smallLabel2",
                        onClick: e.onClick,
                        children: null == (s = e.subItems) ? void 0 : s.map(s => (0, t.jsx)(a.NavigationTreeItem, {
                            label: s.label,
                            nodeId: s.key,
                            onClick: s.onClick,
                            href: s.href,
                            adornment: s.adornment
                        }, "".concat(e.key, "-").concat(s.key)))
                    }, e.key)
                })
            })]
        }) : null
    }])
}, 373736, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(278862),
        s = e.i(643992),
        r = e.i(79187),
        n = e.i(623983);
    e.s(["default", 0, e => {
        let {
            open: i,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: c
        } = e, {
            translate: d
        } = (0, r.useTranslation)();
        return (0, t.jsx)(s.Dialog, {
            open: i,
            onOpenChange: l,
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: d("Action.Close"),
            children: (0, t.jsxs)(s.DialogContent, {
                children: [(0, t.jsxs)(s.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, t.jsx)(s.DialogTitle, {
                        className: "text-heading-medium margin-y-none",
                        children: d("Label.IdVerification")
                    }), (0, t.jsx)(n.Typography, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(n.Typography, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialogReverify")
                    })]
                }), (0, t.jsxs)(s.DialogFooter, {
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
        s = e.i(605050);
    let r = ["creatorEligibility"];
    e.s(["creatorEligibilityQueryKeyPrefix", 0, r, "useCreatorEligibility", 0, function() {
        let {
            overrideUserId: e,
            isReady: n = !0,
            refetchInterval: i = !1
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: l
        } = (0, a.useAuthentication)(), o = null == l ? void 0 : l.id, c = null != e ? e : o;
        return (0, t.useQuery)({
            queryKey: [...r, null != c ? c : null],
            queryFn: async () => s.default.coreContentGetCreatorEligibility({
                userId: c
            }),
            enabled: n && !!c,
            refetchInterval: i,
            refetchIntervalInBackground: !0
        })
    }])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(221628),
        s = e.i(416340),
        r = e.i(445550),
        n = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t);
    let i = Object.values(n),
        l = (e => {
            let t = {};
            for (let a of i) t[a] = e(a);
            if (!i.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["DEFAULT_FRONTEND_FLAGS", 0, l, "FRONTEND_FLAG_NAMES", 0, i, "FrontendFlagName", () => n], 448005);
    let o = (0, s.createContext)(null);
    e.s(["default", 0, e => {
        let {
            children: t
        } = e, [n, c] = (0, s.useState)(l), [d, u] = (0, s.useState)(!1), m = (0, s.useCallback)(async e => {
            try {
                let t = await r.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...i.map(e => {
                        var a, s;
                        return {
                            [e]: null != (a = null == t || null == (s = t.data) ? void 0 : s[e]) && a
                        }
                    }));
                c(a)
            } catch (e) {}
        }, []);
        (0, s.useEffect)(() => {
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
        let p = (0, s.useMemo)(() => ({
            frontendFlags: n,
            getFrontendFlags: m,
            loadingFrontendFlags: d
        }), [n, m, d]);
        return (0, a.jsx)(o.Provider, {
            value: p,
            children: t
        })
    }, "useToolboxServiceApiProvider", 0, function() {
        let e = (0, s.useContext)(o);
        if (null === e) throw Error("useToolboxServiceApiProvider must be used within a ToolboxServiceApiProvider");
        return e
    }], 845592)
}, 796266, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(589624),
        s = e.i(745873);
    let r = e => {
        let t = Array.isArray(e) ? e[0] : e;
        if (!t) return null;
        let a = Number(t);
        return Number.isInteger(a) && a > 0 ? a : null
    };
    e.s(["default", 0, function() {
        let e = (0, a.useRouter)(),
            {
                groups: n,
                isFetched: i,
                currentGroup: l,
                setCurrentGroup: o
            } = (0, s.useGroups)(),
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
            m = (null == u ? void 0 : u.kind) === "group" && (null != n ? n : []).some(e => {
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
}, 127792, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 858517, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 343885, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 609794, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 57561, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 509747, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 475555, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 538302, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 387707, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 262135, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 240731, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 956923, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 84362, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 214665, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 455506, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 918290, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 716933, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 347319, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 543657, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 850412, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 103329, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 692706, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 405654, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 891409, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 758060, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 710005, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 495550, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 320429, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 106017, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 821978, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 766389, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 374717, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 756733, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 251697, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 411118, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 839596, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 729733, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 66217, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 148865, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 45512, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 706478, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 166181, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 37474, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 147189, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 105897, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 123524, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 752739, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 331105, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 564908, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 663412, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 215887, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 962803, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 914865, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 818392, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 173034, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 780078, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 756885, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 260123, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 507792, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 850994, e => {
    e.q("https://assets.create.roblox.com/9bdd3fab861fa4cb33220923767045e56edce031/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 711950, e => {
    "use strict";
    var t = e.i(562991),
        a = e.i(278862),
        s = e.i(641659),
        r = e.i(927072),
        n = e.i(805476),
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
                href: s,
                linkTarget: r,
                onAction: n,
                variant: i
            } = e;
            return r ? l.default.createElement(a.Button, {
                asChild: !0,
                size: "Small",
                variant: i,
                onClick: n
            }, l.default.cloneElement(r, {}, t)) : s ? l.default.createElement(a.Button, {
                as: "a",
                href: s,
                size: "Small",
                variant: i,
                onClick: n
            }, t) : l.default.createElement(a.Button, {
                size: "Small",
                variant: i,
                onClick: n
            }, t)
        },
        p = e => {
            let {
                label: t,
                href: a,
                linkTarget: s,
                onAction: n
            } = e;
            return s ? l.default.createElement(r.Link, {
                asChild: !0,
                onClick: n,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, l.default.cloneElement(s, {}, t)) : a ? l.default.createElement(r.Link, {
                href: a,
                onClick: n,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t) : l.default.createElement(r.Link, {
                as: "button",
                onClick: n,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t)
        },
        h = (0, l.forwardRef)((e, a) => {
            let {
                children: r,
                variant: h = "System",
                severity: g = "Info",
                primaryActionLabel: f,
                primaryActionHref: v,
                primaryActionLinkTarget: b,
                onPrimaryAction: y,
                secondaryActionLabel: A,
                secondaryActionHref: T,
                secondaryActionLinkTarget: x,
                onSecondaryAction: I,
                hasCloseAffordance: S = !0,
                closeLabel: C = "Dismiss alert",
                onDismiss: w,
                className: E,
                style: _,
                ...k
            } = e, D = (0, s.default)("foundation-web-alert-message-"), N = !!f, L = !!A, P = !!(S && w), M = "Feedback" === h && (N || L || P), U = "Warning" === g || "Error" === g ? "alert" : "status", F = null;
            N && (F = L ? l.default.createElement(m, {
                label: f || "",
                href: v,
                linkTarget: b,
                onAction: y,
                variant: "Standard"
            }) : l.default.createElement(p, {
                label: f || "",
                href: v,
                linkTarget: b,
                onAction: y
            }));
            let B = L ? l.default.createElement(m, {
                label: A || "",
                href: T,
                linkTarget: x,
                onAction: I,
                variant: "Utility"
            }) : null;
            return l.default.createElement("div", {
                ref: a,
                role: M ? "region" : U,
                "aria-labelledby": M ? D : void 0,
                className: (0, i.default)("foundation-web-alert relative width-full stroke-standard", "System" === h ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", d[g], E),
                ...k
            }, l.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, i.default)("absolute inset-[0] pointer-events-none", "Feedback" === h && "radius-medium"),
                style: {
                    backgroundColor: u[g]
                }
            }), l.default.createElement("div", {
                className: "relative flex items-start gap-x-medium padding-x-large padding-y-small min-width-0"
            }, l.default.createElement("div", {
                className: "flex items-start padding-y-xsmall self-stretch shrink-0"
            }, l.default.createElement("div", {
                className: "relative flex items-start padding-y-xxsmall"
            }, "Warning" !== g && l.default.createElement("span", {
                "aria-hidden": "true",
                className: "absolute width-[10px] height-[14px] top-[5px]",
                style: {
                    left: "50%",
                    transform: "translateX(-50%)",
                    backgroundColor: "var(--dark-mode-content-emphasis)"
                }
            }), l.default.createElement(t.Icon, {
                "aria-hidden": "true",
                name: o[g],
                size: "Medium",
                className: "relative",
                style: {
                    color: c[g]
                }
            }))), l.default.createElement("div", {
                className: (0, i.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", L ? "flex-col" : "wrap")
            }, l.default.createElement("div", {
                id: M ? D : void 0,
                role: M ? U : void 0,
                className: (0, i.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", L ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, r), (F || B) && l.default.createElement("div", {
                className: (0, i.default)("flex items-center gap-small wrap shrink-0", !L && "padding-y-[var(--size-150)]")
            }, F, B)), P && l.default.createElement(n.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": C,
                onClick: w
            })))
        });
    e.s(["Alert", 0, h])
}, 36482, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let s = {
            "1:1": "aspect-1-1",
            "5:4": "aspect-5-4",
            "4:5": "aspect-4-5",
            "4:3": "aspect-4-3",
            "16:9": "aspect-16-9",
            "2:1": "aspect-2-1"
        },
        r = (0, a.forwardRef)((e, r) => {
            let {
                className: n,
                aspectRatio: i = "1:1",
                alt: l,
                containerClassName: o,
                ...c
            } = e;
            return a.default.createElement("div", {
                className: (0, t.default)("foundation-web-media clip", s[i], o)
            }, a.default.createElement("img", {
                ref: r,
                className: (0, t.default)("foundation-web-media-image", n),
                alt: l,
                ...c
            }))
        });
    r.displayName = "Media", e.s(["Media", 0, r])
}, 130058, e => {
    "use strict";
    var t = e.i(489098),
        a = e.i(262069),
        s = e.i(197649),
        r = e.i(416340),
        n = e.i(425353);
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
                onInteractOutside: g
            } = e;
            return r.default.createElement(n.Portal, null, r.default.createElement(n.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? i : void 0,
                "data-size": "centerSheet" === t ? l : void 0,
                className: (0, s.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", c)
            }, r.default.createElement(n.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, s.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", d),
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: p,
                onEscapeKeyDown: h,
                onInteractOutside: g
            }, o)))
        },
        l = e => {
            let t = e.currentTarget;
            if (!t) return;
            let a = t.querySelectorAll("[data-autofocus-priority]");
            if (0 === a.length) return;
            let s = [];
            a.forEach(e => {
                let t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                !Number.isNaN(t) && e instanceof HTMLElement && s.push({
                    element: e,
                    priority: t
                })
            }), s.sort((e, t) => e.priority - t.priority);
            let r = s.find(e => {
                var t, a;
                return ("function" != typeof(a = t = e.element).checkVisibility || a.checkVisibility()) && !("disabled" in t && t.disabled || "true" === t.getAttribute("aria-disabled"))
            });
            if (r) {
                var n;
                e.preventDefault();
                let t = document.activeElement === r.element;
                r.element.focus(), !t && (n = r.element) instanceof HTMLInputElement && "function" == typeof n.select && n.select()
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
                className: n,
                hasPaddingX: i = !0,
                ...l
            } = e, {
                type: o
            } = u();
            return r.default.createElement("div", {
                ref: t,
                className: (0, s.default)("scroll-y", i && m, "sideSheet" === o ? "grow-1" : "", n),
                ...l
            }, a)
        });
    p.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        let {
            children: t,
            className: n,
            ...i
        } = e;
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(a.Divider, null), r.default.createElement("div", {
            className: (0, s.default)(m, "margin-y-small shrink-0", n),
            ...i
        }, t))
    }, "SheetBody", 0, p, "SheetContent", 0, e => {
        let t, {
                children: a,
                centerSheetSize: n = "Medium",
                largeScreenVariant: c = "center",
                closeLabel: u,
                className: m,
                mobilePortraitClassName: p,
                mobileLandscapeClassName: h,
                largeScreenClassName: g,
                onOpenAutoFocus: f,
                onCloseAutoFocus: v,
                onPointerDownOutside: b,
                onEscapeKeyDown: y,
                onInteractOutside: A
            } = e,
            T = (0, o.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
            x = (0, o.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
        t = T ? "bottomSheet" : x || "side" === c ? "sideSheet" : "centerSheet";
        let I = (0, r.useMemo)(() => ({
                centerSheetSize: n,
                largeScreenVariant: c,
                closeLabel: u,
                isPortraitMobile: T,
                isLandscapeMobile: x,
                type: t
            }), [n, c, u, T, x, t]),
            S = (0, s.default)(m, T && p, x && h, !T && !x && g);
        return r.default.createElement(d.Provider, {
            value: I
        }, r.default.createElement(i, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: x,
            centerSheetSize: n,
            contentClassName: S,
            onOpenAutoFocus: null != f ? f : l,
            onCloseAutoFocus: v,
            onPointerDownOutside: b,
            onEscapeKeyDown: y,
            onInteractOutside: A
        }, a))
    }, "SheetDescription", 0, e => r.default.createElement(n.Description, {
        asChild: !0,
        ...e
    }), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: s,
            children: i
        } = e;
        return r.default.createElement(n.Root, {
            open: t,
            onOpenChange: a,
            defaultOpen: s,
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
        } = u(), p = r.default.createElement(n.Title, {
            className: "text-heading-small margin-none"
        }, i);
        return r.default.createElement("div", {
            className: (0, s.default)(a, l ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, r.default.createElement("div", {
            className: (0, s.default)("flex items-center", l && "gap-xsmall")
        }, l, d ? r.default.createElement(c.VisuallyHidden, null, p) : p), r.default.createElement("div", {
            className: (0, s.default)("flex items-center", o && "gap-xxsmall")
        }, o, r.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, r.default.createElement(n.Close, {
            asChild: !0
        }, r.default.createElement(t.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: m || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "SheetTrigger", 0, e => r.default.createElement(n.Trigger, {
        asChild: !0,
        ...e
    })], 130058)
}, 921378, e => {
    "use strict";
    var t = e.i(640409),
        a = e.i(641659),
        s = e.i(753534),
        r = e.i(197649),
        n = e.i(416340);
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
        d = n.default.forwardRef((e, d) => {
            let {
                size: u,
                variant: m = "Standard",
                label: p,
                value: h,
                defaultValue: g,
                isDisabled: f,
                hasError: v,
                helperText: b,
                className: y,
                style: A,
                textareaClassName: T,
                textareaStyle: x,
                id: I,
                ...S
            } = e, C = (0, a.default)(), w = I || C, E = "".concat(w, "-description"), _ = null != u ? u : "Large";
            return n.default.createElement("div", {
                className: (0, r.default)("flex fill flex-col width-full gap-small", {
                    [t.disabledOpacity]: f
                }, y),
                style: A
            }, p && n.default.createElement("label", {
                htmlFor: w,
                className: (0, r.default)(o[_], "content-emphasis")
            }, p), n.default.createElement("textarea", {
                ref: d,
                id: w,
                "data-testid": "text-area-container",
                style: x,
                className: (0, r.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", s.INPUT_BACKGROUND_BY_VARIANT[m], s.INPUT_STROKE_BY_VARIANT[m], v ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", c[_], i[_], l[_], T),
                value: h,
                defaultValue: null == h ? g : void 0,
                disabled: f,
                "aria-describedby": b ? E : void 0,
                ...S
            }), b && n.default.createElement("span", {
                id: E,
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": v,
                    "content-default": !v
                })
            }, b))
        });
    d.displayName = "TextArea", e.s(["TextArea", 0, d])
}, 367808, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340),
        s = e.i(863605),
        r = e.i(154502),
        n = e.i(945146),
        i = e.i(690569),
        l = e.i(251635),
        o = e.i(787802),
        c = e.i(221628),
        d = e.i(396249),
        u = e.i(121880);

    function m(e) {
        return (0, i.g)("MuiAlertTitle", e)
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
        g = a.forwardRef(function(e, t) {
            let a = (0, u.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: s
                } = a,
                r = (0, i._)(a, p),
                o = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, l.a)({
                        root: ["root"]
                    }, m, t)
                })(a);
            return (0, c.jsx)(h, (0, n._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, l.c)(o.root, s)
            }, r))
        });
    var f = (0, s.default)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        v = (0, a.forwardRef)(function(e, s) {
            var n = e.classes,
                i = e.className,
                l = (0, t.a)(e, ["classes", "className"]),
                o = f(void 0, {
                    props: {
                        classes: (0, r.default)(n, i)
                    }
                });
            return a.default.createElement(g, (0, t._)({}, l, {
                classes: o.classes,
                ref: s
            }))
        });
    e.s(["AlertTitle", 0, v], 367808)
}, 16255, e => {
    "use strict";
    var t = e.i(788647);
    e.s(["NavigateNextIcon", () => t.N])
}, 957474, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340),
        s = e.i(863605),
        r = e.i(154502),
        n = e.i(787802),
        i = e.i(690569),
        l = e.i(945146),
        o = e.i(251635),
        c = e.i(51928),
        d = e.i(634034),
        u = e.i(221628),
        m = e.i(176595),
        p = e.i(121880),
        h = e.i(105006);
    e.i(465957);
    var g = (0, d.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        f = (0, d.c)((0, u.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let v = (0, o.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: o.r
        })({
            position: "relative",
            display: "flex"
        }),
        b = (0, o.s)(g, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        y = (0, o.s)(f, {
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
            fontSize: s
        } = e, r = (0, l._)({}, e, {
            checked: t
        });
        return (0, u.jsxs)(v, {
            className: a.root,
            ownerState: r,
            children: [(0, u.jsx)(b, {
                fontSize: s,
                className: a.background,
                ownerState: r
            }), (0, u.jsx)(y, {
                fontSize: s,
                className: a.dot,
                ownerState: r
            })]
        })
    }

    function T(e) {
        return (0, i.g)("MuiRadio", e)
    }
    var x = (0, n.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let I = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        S = (0, o.s)(c.S, {
            shouldForwardProp: e => (0, o.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, i.a)(a.size))], t["color".concat((0, i.a)(a.color))]]
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
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, i.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== a.color && {
                ["&.".concat(x.checked)]: {
                    color: (t.vars || t).palette[a.color].main
                }
            }, {
                ["&.".concat(x.disabled)]: {
                    color: (t.vars || t).palette.action.disabled
                }
            })
        }),
        C = (0, u.jsx)(A, {
            checked: !0
        }),
        w = (0, u.jsx)(A, {}),
        E = a.forwardRef(function(e, t) {
            var s, r, n, c;
            let d = (0, p.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: g,
                    checkedIcon: f = C,
                    color: v = "primary",
                    icon: b = w,
                    name: y,
                    onChange: A,
                    size: x = "medium",
                    className: E
                } = d,
                _ = (0, i._)(d, I),
                k = (0, l._)({}, d, {
                    color: v,
                    size: x
                }),
                D = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: s
                    } = e, r = {
                        root: ["root", "color".concat((0, i.a)(a)), "medium" !== s && "size".concat((0, i.a)(s))]
                    };
                    return (0, l._)({}, t, (0, o.a)(r, T, t))
                })(k),
                N = a.useContext(m.R),
                L = g,
                P = (0, h.c)(A, N && N.onChange),
                M = y;
            return N && (void 0 === L && (n = N.value, L = "object" == typeof(c = d.value) && null !== c ? n === c : String(n) === String(c)), void 0 === M && (M = N.name)), (0, u.jsx)(S, (0, l._)({
                type: "radio",
                icon: a.cloneElement(b, {
                    fontSize: null != (s = w.props.fontSize) ? s : x
                }),
                checkedIcon: a.cloneElement(f, {
                    fontSize: null != (r = C.props.fontSize) ? r : x
                }),
                ownerState: k,
                classes: D,
                name: M,
                checked: L,
                onChange: P,
                ref: t,
                className: (0, o.c)(D.root, E)
            }, _))
        });
    var _ = (0, s.default)({
            name: "Radio"
        })(function(e) {
            var t, a;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((t = {
                    color: e.palette.content.muted
                })["&.".concat(x.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, t),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((a = {
                    color: e.palette.states.disabled
                })["&.".concat(x.colorPrimary, ".").concat(x.checked)] = {
                    color: e.palette.states.disabled
                }, a)
            }
        }),
        k = (0, a.forwardRef)(function(e, s) {
            var n = e.classes,
                i = e.color,
                l = e.inputProps,
                o = e["aria-label"],
                c = e.className,
                d = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = _(void 0, {
                    props: {
                        classes: (0, r.default)(n, c)
                    }
                });
            return a.default.createElement(E, (0, t._)({}, d, {
                classes: u.classes,
                color: void 0 === i ? "primary" : i,
                ref: s,
                inputProps: (0, t._)({
                    "aria-label": o
                }, l)
            }))
        });
    e.s(["Radio", 0, k], 957474)
}, 176595, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 763833, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["ArrowDownwardIcon", () => t.ArrowDownward])
}, 650642, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["ArrowUpwardIcon", () => t.ArrowUpward])
}, 883302, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["NavigateBeforeIcon", () => t.NavigateBefore])
}, 722417, e => {
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

//# debugId=aa076782-a193-e7de-4e73-7fd5cfc31eb8
//# sourceMappingURL=1a3yu_je7m_mr.js.map