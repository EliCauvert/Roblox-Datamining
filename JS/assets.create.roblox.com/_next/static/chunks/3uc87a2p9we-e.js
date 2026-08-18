;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f5b5859a-e096-bfdb-7c5f-503a8c8e85c9")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 239328, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "freeAvatarModuleStorePageLink",
            defaultValue: "#"
        }),
        i = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "freeAvatarModuleDocsPageLink",
            defaultValue: "#"
        }),
        n = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableUGCFolders",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        });
    e.s(["enableCreatorShowcases", 0, s, "enableTaxonomyBasedCreatorDashboard", 0, r, "enableUgcFolders", 0, n, "freeAvatarModuleDocsPageLink", 0, i, "freeAvatarModuleStorePageLink", 0, a, "isAutoPublishPreferencesEnabled", 0, l])
}, 134731, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
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
        });
    e.s(["isAssetAccessRequestsEnabled", 0, i, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, s, "isModelCustomThumbnailUploadEnabled", 0, n, "isPricingEligibilityV2Enabled", 0, l])
}, 9436, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, s, "isMomentsSitetestUrlParsingEnabled", 0, n, "isMomentsUploadEnabled", 0, i, "isMomentsUploadLanguageSelectEnabled", 0, r])
}, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        i = e.i(540459),
        n = e.i(79187),
        r = e.i(814975),
        s = e.i(156071),
        l = e.i(881670),
        o = e.i(745873),
        d = e.i(361975);
    let u = (0, a.createContext)({
        isAffiliateProgramLoading: !1,
        requiresActionToJoinProgram: void 0,
        compliantWithAllUserRequirements: void 0,
        creatorMetadata: void 0,
        isCurrentUserGroupOwner: void 0,
        isGroupEligible: void 0
    });
    u.displayName = "AffiliateProgram";
    let c = (0, n.withTranslation)(e => {
        let {
            children: n
        } = e, {
            user: l
        } = (0, r.useAuthentication)(), c = (0, o.useCurrentGroup)(), [m, f] = (0, a.useState)(void 0), [p, h] = (0, a.useState)(), [g, v] = (0, a.useState)(), [b, y] = (0, a.useState)(), [A, S] = (0, a.useState)(), T = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == c ? void 0 : c.id) ? e : 0) !== 0
        }, [c]), [E, x] = (0, a.useState)(void 0), I = void 0 === m || void 0 === p || void 0 === g && T, w = (0, a.useCallback)(async () => {
            try {
                if (T && (null == c ? void 0 : c.id)) {
                    let e = await (0, d.getGroupCreatorMetadata)(c.id);
                    f(e);
                    return
                }
                if (!T && (null == l ? void 0 : l.id)) {
                    let e = await (0, d.getUserCreatorMetadata)();
                    f(e);
                    return
                }
            } catch (e) {
                return
            }
            f(null)
        }, [null == c ? void 0 : c.id, T, null == l ? void 0 : l.id]), P = (0, a.useCallback)(async () => {
            if (T && E || !T) try {
                let e = await (0, d.getRequirements)();
                h(e.requirements);
                return
            } catch (e) {
                return
            }
            h(null)
        }, [E, T]), C = (0, a.useCallback)(async () => {
            if (T && (null == c ? void 0 : c.id)) try {
                let e = await (0, d.getGroupEligibility)(c.id);
                v(e.isEligible)
            } catch (e) {
                v(!1)
            }
        }, [c, T]);
        (0, a.useEffect)(() => {
            I ? S(void 0) : T && !E ? S(!1) : S(!1 === b)
        }, [T, E, b, I]), (0, a.useEffect)(() => {
            (async () => {
                if (T && (null == c ? void 0 : c.id)) {
                    var e;
                    return null == (e = (await s.default.getGroupInfo(c.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && x(e === l.id)
            })
        }, [null == c ? void 0 : c.id, T, l]), (0, a.useEffect)(() => {
            I || !p || T && !E ? y(void 0) : y((null == p ? void 0 : p.length) === 0 || (null == p ? void 0 : p.length) === 1 && p[0] === i.Requirements.Payable)
        }, [E, T, I, p]), (0, a.useEffect)(() => {
            w()
        }, [w]), (0, a.useEffect)(() => {
            P()
        }, [P]), (0, a.useEffect)(() => {
            C()
        }, [C]);
        let _ = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: I,
            requiresActionToJoinProgram: A,
            compliantWithAllUserRequirements: b,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != p ? p : void 0,
            isCurrentUserGroupOwner: E,
            isGroupEligible: null != g ? g : void 0
        }), [I, A, b, m, p, E, g]);
        return (0, t.jsx)(u.Provider, {
            value: _,
            children: n
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, c, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(u)
    }])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        i = e.i(416340),
        n = e.i(79187),
        r = e.i(423107),
        s = e.i(514455),
        l = e.i(982234),
        o = e.i(199834),
        d = e.i(872204),
        u = e.i(988012),
        c = e.i(447055),
        m = e.i(358763),
        f = e.i(889311),
        p = e.i(823062),
        h = e.i(881670),
        g = e.i(486736),
        v = e.i(906791);
    let b = (0, e.i(706442).makeStyles)()(e => ({
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
    let A = (0, n.withTranslation)(e => {
        let t, h, y, A, {
                trackingPage: S,
                alertRedesignVariant: T
            } = e,
            {
                settings: {
                    ageVerificationUpsellGetStartedUrl: E,
                    ageVerificationUpsellViewDetailsUrl: x,
                    establishTrustUpsellGetStartedUrl: I,
                    establishTrustUpsellViewDetailsUrl: w
                }
            } = (0, g.useSettings)(),
            {
                isBannerVisible: P,
                isHighPriority: C,
                variant: _,
                dismissBanner: N
            } = (0, v.useAgeVerificationUpsellContext)(),
            {
                classes: k
            } = b(),
            M = (0, i.useRef)(null),
            {
                unifiedLogger: D
            } = (0, p.useUnifiedLoggerProvider)(),
            {
                translate: L
            } = (0, n.useTranslation)(),
            O = (0, i.useCallback)(() => {
                P && D.logImpressionEvent({
                    eventName: f.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: S,
                        variant: _,
                        ...T && {
                            alertRedesignVariant: T
                        }
                    }
                })
            }, [D, S, _, T, P]);
        (0, m.default)(M, O);
        let F = (0, i.useCallback)(() => {
                D.logClickEvent({
                    eventName: f.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: S,
                        action: "viewDetails",
                        variant: _,
                        ...T && {
                            alertRedesignVariant: T
                        }
                    }
                })
            }, [D, S, _, T]),
            R = (0, i.useCallback)(() => {
                D.logClickEvent({
                    eventName: f.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: S,
                        action: "callToAction",
                        variant: _,
                        ...T && {
                            alertRedesignVariant: T
                        }
                    }
                })
            }, [D, S, _, T]),
            U = (0, i.useCallback)(() => {
                D.logClickEvent({
                    eventName: f.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: S,
                        action: "dismiss",
                        variant: _,
                        ...T && {
                            alertRedesignVariant: T
                        }
                    }
                }), N()
            }, [D, N, S, _, T]);
        return ("establishTrust" === _ ? (t = "Title.EstablishTrustBanner", h = "Label.EstablishTrustBanner2", y = I, A = w) : (t = "Title.AgeVerificationBanner", h = "Label.AgeVerificationBanner", y = E, A = x), P) ? (0, a.jsx)("div", {
            ref: M,
            children: (0, a.jsxs)(r.Alert, {
                className: k.alertContainer,
                severity: "ageVerification" === _ && C ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(d.Button, {
                    href: y,
                    onClick: R,
                    className: k.getStarted,
                    color: "inherit",
                    size: "small",
                    children: L("Label.AgeVerificationBannerGetStarted") || "Get started"
                }, "getStarted"), (0, a.jsx)(u.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: U,
                    children: (0, a.jsx)(c.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(s.AlertTitle, {
                    children: L(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: L(h)
                }), " ", (0, a.jsx)(l.Link, {
                    className: k.viewDetails,
                    href: A,
                    target: "_blank",
                    color: "inherit",
                    onClick: F,
                    children: L("Label.AgeVerificationBannerViewDetails") || "View details"
                })]
            })
        }) : null
    }, [h.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, A, "AgeVerificationUpsellPage", () => y], 714039)
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        i = e.i(458451),
        n = e.i(889311),
        r = e.i(823062),
        s = e.i(486736);
    let l = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        o = encodeURIComponent("studio/CollaborationSettings"),
        d = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                i = a.status % 100 * 100;
            if (!a.ok && 500 === i && t < 2) return await new Promise(e => setTimeout(e, 2 ** (t + 1) * 500)), d(e, t + 1);
            if (500 === i && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let n = await a.json();
            if (!("access" in n)) throw Error('"access" not found in response');
            return n.access
        }, u = async () => await d("".concat(l, "/v1/upsell-feature-access?nameSpace=").concat(o, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted", c = "CreatorHub.AgeVerificationBannerSettings", m = async () => {
            localStorage.removeItem(c)
        }, f = async () => {
            let e, t = localStorage.getItem(c);
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
                return m(), !1
            }
            let a = new Date;
            return e.getFullYear() === a.getFullYear() && e.getMonth() === a.getMonth() && e.getDate() === a.getDate()
        }, p = async () => {
            localStorage.setItem(c, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, h = (0, a.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), g = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, v = async () => await u() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: l
        } = e, {
            settings: {
                enableAgeVerificationUpsellBanner: o,
                ageVerificationUpsellBannerStartDate: d,
                ageVerificationUpsellBannerEndDate: u,
                ageVerificationUpsellBannerHighPriorityDate: c
            }
        } = (0, s.useSettings)(), [m, b] = (0, a.useState)(!0), [y, A] = (0, a.useState)("doNotShow"), {
            isFetched: S,
            user: T
        } = (0, i.useRobloxAuthentication)(), {
            unifiedLogger: E
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: x,
            isEnabled: I
        } = (0, a.useMemo)(() => {
            let e = g(d),
                t = g(u),
                a = g(c),
                i = new Date,
                n = o && e <= i && i < t;
            return {
                isHighPriority: a <= i,
                isEnabled: n
            }
        }, [o, u, d, c]), w = (0, a.useCallback)(async () => {
            await p(), b(!0)
        }, [b]);
        (0, a.useEffect)(() => {
            I && S && (null == T ? void 0 : T.id) && (async () => {
                let e = !1;
                try {
                    e = await f()
                } catch (e) {
                    E.logErrorEvent({
                        eventName: n.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                b(e);
                let t = "doNotShow";
                try {
                    t = await v()
                } catch (e) {
                    E.logErrorEvent({
                        eventName: n.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                A(t)
            })().catch(e => {
                E.logErrorEvent({
                    eventName: n.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [I, S, T, E]);
        let P = (0, a.useMemo)(() => {
            let e = I && "doNotShow" !== y;
            return {
                isBannerVisible: e && !m,
                isBannerEligible: e,
                isHighPriority: x,
                variant: "doNotShow" !== y ? y : "ageVerification",
                dismissBanner: w
            }
        }, [I, y, m, x, w]);
        return (0, t.jsx)(h.Provider, {
            value: P,
            children: l
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(h)], 906791)
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
        i = e.i(419652);
    e.s(["default", 0, e => {
        let {
            children: n
        } = e, [r, s] = (0, a.useState)(), l = e => {
            s(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: r,
            updateDroppedFile: l
        }), [r]);
        return (0, t.jsx)(i.default.Provider, {
            value: o,
            children: n
        })
    }])
}, 799972, e => {
    "use strict";
    var t = e.i(284856),
        a = e.i(671376);
    let {
        docs: i
    } = e.i(829425).creatorHub, n = {
        [a.Asset.Decal]: t.AssetType.Decal,
        [a.Asset.Audio]: t.AssetType.Audio,
        [a.Asset.Video]: t.AssetType.Video,
        [a.Asset.TShirt]: t.AssetType.Tshirt,
        [a.Asset.Shirt]: t.AssetType.Shirt,
        [a.Asset.Pants]: t.AssetType.Pants,
        [a.Asset.AvatarBackground]: t.AssetType.AvatarBackground
    }, r = {
        [a.Asset.Decal]: "Message.DecalResolutionLimits",
        [a.Asset.Audio]: "Message.AudioLimits",
        [a.Asset.AvatarBackground]: "Message.AvatarBackgroundUploadRequirements"
    }, s = [a.Asset.Shirt, a.Asset.Pants, a.Asset.Video, a.Asset.TShirt, a.Asset.AvatarBackground], l = [a.Asset.Audio, a.Asset.Video];
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
    }, "assetTypeInfoTextMessage", 0, r, "dashboardAssetTypeToOpenCloudAssetType", 0, n, "getInfoUrl", 0, e => {
        switch (e) {
            case a.Asset.Decal:
                return i.getDecalReferenceUrl();
            case a.Asset.TShirt:
            case a.Asset.Shirt:
            case a.Asset.Pants:
                return i.getClassicClothingUrl();
            case a.Asset.Audio:
                return i.getAudioAssetsUrl();
            case a.Asset.Video:
                return i.getAssetsUrl();
            case a.Asset.AvatarBackground:
                return i.getAvatarItemsUrl();
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
    }, "maxResolution", 0, e => e === a.Asset.Video ? "4096x2160" : null, "purchasableAssetTypes", 0, s, "quotaEnabledAssetTypes", 0, l])
}, 351111, e => {
    e.v({
        buttonRow: "AudienceReachGrowthOpportunitiesBanner-module__U8tNBq__buttonRow",
        heroBanner: "AudienceReachGrowthOpportunitiesBanner-module__U8tNBq__heroBanner",
        heroCoverImage: "AudienceReachGrowthOpportunitiesBanner-module__U8tNBq__heroCoverImage",
        heroTextContent: "AudienceReachGrowthOpportunitiesBanner-module__U8tNBq__heroTextContent"
    })
}, 686197, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        i = e.i(237401),
        n = e.i(513997),
        r = e.i(514961),
        s = e.i(197649),
        l = e.i(79187),
        o = e.i(169722),
        d = e.i(29929),
        u = e.i(889311),
        c = e.i(215955),
        m = e.i(227700),
        f = e.i(881670),
        p = e.i(114209),
        h = e.i(373736),
        g = e.i(917852),
        v = e.i(576069),
        b = e.i(351111);
    let y = "".concat("https://assets.create.roblox.com/a36b6e60a065c04cd204e789e53d6253325c62fb/assets", "/home/publish_eligibility_banner.webp"),
        A = (0, l.withTranslation)(e => {
            var A;
            let {
                universeId: S,
                showCallToAction: T = !0
            } = e, E = (0, i.useRouter)(), {
                translateWithNamespace: x
            } = (0, l.useTranslation)(), {
                params: I,
                isFetched: w
            } = (0, m.useIXPParameters)(d.IXPLayers.CreatorHubCreationsPermission), P = I[d.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: C
            } = (0, p.useCurrentGame)(), _ = null == C ? void 0 : C.id, N = null != S ? S : _ && _ > 0 ? _ : void 0, {
                data: k,
                isLoading: M,
                isFetching: D
            } = (0, v.useCreatorEligibility)(), L = (0, a.useRef)(!1), [O, F] = (0, a.useState)(!1), R = (null == k ? void 0 : k.ageBracket) === n.AgeBracketEnum.Over18, U = (null == k ? void 0 : k.ageBracket) === n.AgeBracketEnum.Between13And18, V = null != (A = null == k ? void 0 : k.creatorEligibility.includes(n.CreatorEligibilityEnum.IdVerified)) && A, B = R || U, j = w && P && !(M || D) && !!k && !V;
            (0, a.useEffect)(() => {
                j && !L.current && (L.current = !0, c.default.logImpressionEvent({
                    eventName: u.default.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: B ? "start" : "viewDetails",
                        ctaHidden: String(!T),
                        ...N ? {
                            universeId: String(N)
                        } : {}
                    }
                }))
            }, [j, T, B, N]);
            let Y = (0, a.useCallback)(() => {
                if (!j) return;
                let e = B ? "start" : "viewDetails";
                (c.default.logClickEvent({
                    eventName: u.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...N ? {
                            universeId: String(N)
                        } : {}
                    }
                }), U) ? F(!0): B || E.push("/settings/eligibility/publishing-permissions")
            }, [j, U, E, B, N]);
            return j ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, s.clsx)(b.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
                    children: [(0, t.jsx)("img", {
                        src: y,
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
                        className: (0, s.clsx)(b.default.heroTextContent, "dark-theme relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [x(f.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: x(f.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, s.clsx)(b.default.buttonRow, "flex gap-small"),
                            children: T ? R ? (0, t.jsx)(r.Button, {
                                as: "a",
                                href: g.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: Y,
                                children: (0, t.jsx)("span", {
                                    children: x(f.TranslationNamespace.AudienceReach, B ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(r.Button, {
                                onClick: Y,
                                children: (0, t.jsx)("span", {
                                    children: x(f.TranslationNamespace.AudienceReach, B ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), U ? (0, t.jsx)(h.default, {
                    open: O,
                    onOpenChange: F,
                    onContinueWithId: () => {
                        window.open(g.idVerificationActionUrl, "_blank", "noopener,noreferrer"), F(!1)
                    },
                    onAddParent: () => {
                        window.open(g.parentLinkActionUrl, "_blank", "noopener,noreferrer"), F(!1)
                    }
                }) : null]
            }) : null
        }, [f.TranslationNamespace.AudienceReach, f.TranslationNamespace.PublicPublish]);
    e.s(["default", 0, A])
}, 445550, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(309999),
        i = e.i(307529),
        n = e.i(272593);
    let r = {
            [i.default.Model]: a.CategoryType.Model,
            [i.default.Plugin]: a.CategoryType.Plugin
        },
        s = {
            3: i.default.Audio,
            10: i.default.Model,
            13: i.default.Decal,
            38: i.default.Plugin,
            40: i.default.MeshPart,
            62: i.default.Video
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
            async getCreations(e, t, a, i, n, s, l) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: r[t],
                    limit: i,
                    cursor: n,
                    separateModelsAndPackages: s,
                    includeSharedAssets: l
                }) : this.toolboxApi.toolboxGetUserCreationAssets({
                    userId: e,
                    assetType: r[t],
                    limit: i,
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
        a = e.i(176936),
        i = e.i(272593);
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
                const e = (0, i.createClientConfiguration)("users", "bedev1");
                this.displayNameApi = new a.DisplayNamesApi(e), this.usersApi = new a.UsersApi(e), this.userSearchApi = new a.UserSearchApi(e)
            }
        },
        r = new a.UsersApi((0, i.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: r
    }, "default", 0, n])
}, 131385, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(780880),
        i = e.i(339544),
        n = e.i(643093),
        r = e.i(130778),
        s = e.i(157310),
        l = e.i(913893),
        o = e.i(536306),
        o = o,
        d = e.i(671376),
        u = e.i(486736),
        c = e.i(117236);
    let m = function() {
        let e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
            {
                settings: a
            } = (0, u.useSettings)(),
            i = (0, s.useQuery)({
                queryKey: ["getTaxonomyCategories", o.V1ItemsCategoriesGetCategoryDomainEnum.NUMBER_3],
                queryFn: () => l.default.getItemCategories(o.V1ItemsCategoriesGetCategoryDomainEnum.NUMBER_3),
                enabled: e,
                staleTime: 3e5
            }),
            r = (0, s.useQuery)({
                queryKey: ["getAvatarItemsEntryPointAssetTypes"],
                queryFn: c.getAvatarItemsEntryPointAssetTypes,
                enabled: e,
                staleTime: 3e5
            }),
            m = r.data,
            f = (0, t.useMemo)(() => {
                var e, t;
                return {
                    enableMakeupAssets: a.enableMakeupAssets && null != (e = null == m ? void 0 : m.has(d.Asset.EyeMakeup)) && e,
                    enableAvatarBackgrounds: a.enableAvatarBackgrounds && null != (t = null == m ? void 0 : m.has(d.Asset.AvatarBackground)) && t
                }
            }, [a.enableMakeupAssets, a.enableAvatarBackgrounds, m]),
            p = (0, t.useMemo)(() => (0, n.transformCreatorDashboardTree)(i.data, f), [i.data, f]),
            h = (0, t.useMemo)(() => (0, n.buildTaxonomyL1Options)(p), [p]);
        return {
            response: i.data,
            categories: p,
            l1Options: h,
            isLoading: i.isLoading || r.isLoading,
            isError: i.isError
        }
    };
    e.s(["default", 0, e => {
        var s, l, o;
        let [{
            activeTab: d,
            filterIndex: u
        }] = (0, a.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: c,
            categories: f,
            isLoading: p
        } = m(e), h = (0, r.isAllAssetTypesActiveTab)(d) || (0, r.isRecentsActiveTab)(d) || (0, r.isAvatarLooksActiveTab)(d) ? void 0 : null != (s = (0, r.parseTaxonomyActiveTab)(d)) ? s : null == (o = c[0]) ? void 0 : o.taxonomyKey, g = (0, t.useMemo)(() => (0, n.findL1Category)(f, h), [f, h]), v = (0, t.useMemo)(() => (0, n.buildTaxonomyL2Options)(g), [g]), b = parseInt(null != (l = null == u ? void 0 : u.toString()) ? l : "", 10), y = (0, i.isValidIndex)(b, v) ? b : 0, A = (0, t.useMemo)(() => {
            if (g) return v.length > 0 ? v[y] : g.webStableId ? (0, n.categoryToDropdown)(g) : void 0
        }, [g, v, y]);
        return {
            l1Options: c,
            activeL1Key: h,
            activeL1Node: g,
            l2Options: v,
            filterIndex: y,
            selection: A,
            isLoading: p
        }
    }], 131385)
}, 638016, e => {
    "use strict";
    var t = e.i(780880),
        a = e.i(723538),
        i = e.i(130778);
    e.s(["default", 0, e => {
        let [{
            activeTab: n
        }] = (0, t.useQueryParams)(["activeTab"]), r = (0, a.default)(), s = r && (0, i.isTaxonomyActiveTab)(n), l = r && (0, i.isRecentsActiveTab)(n), o = r && (0, i.isAvatarLooksActiveTab)(n);
        return {
            canUseTaxonomy: r && (s || (0, i.isTaxonomyEligibleAssetTab)(e)),
            isTaxonomyMode: s,
            isTaxonomyView: s && !(0, i.isAllAssetTypesActiveTab)(n) && !(0, i.isRecentsActiveTab)(n) && !(0, i.isAvatarLooksActiveTab)(n),
            isRecentsView: l,
            isAvatarLooksView: o
        }
    }])
}, 339544, 643093, e => {
    "use strict";
    var t = e.i(671376);
    let a = (e, t) => "".concat(e, "_").concat(t);
    e.s(["invertAvatarMenuMap", 0, e => {
        let t = new Map;
        return Object.entries(e).forEach(e => {
            let [i, n] = e;
            n.forEach((e, n) => {
                t.set(a(i, e.nameKey), n)
            })
        }), t
    }, "isOnItemTab", 0, e => e === t.Asset.TShirt, "isValidIndex", 0, (e, t) => void 0 !== t && void 0 !== e && e > 0 && e < t.length, "serializeMenuMapKey", 0, a], 339544);
    var i = e.i(266213),
        n = e.i(418162);
    let r = new Set([2, 11, 12]),
        s = new Set([76, 77, 88, 89, 90]),
        l = new Set([92]),
        o = new Set([4]);

    function d(e, t) {
        var a;
        return (null != (a = e.assetTypeIds) ? a : []).some(e => t.has(e))
    }

    function u(e) {
        var t;
        return !0 === e.isPublishable || !!d(e, l) || (null != (t = e.bundleTypeIds) ? t : []).some(e => o.has(e))
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
            lookType: i.default.Makeup,
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
        let i = null != (a = null == e ? void 0 : e.categories) ? a : [],
            n = [],
            o = [];
        return i.forEach(e => {
            var a, i, c;
            let m = null != (a = e.children) ? a : [];
            if (0 === m.length) {
                if (!u(e) || d(e, l) && !t.enableAvatarBackgrounds || !e.webStableId) return;
                o.push({
                    key: e.webStableId,
                    name: null != (c = e.name) ? c : "",
                    webStableId: e.webStableId,
                    assetTypeIds: e.assetTypeIds,
                    children: []
                });
                return
            }
            let f = [],
                p = !1;
            m.forEach(e => {
                if (d(e, s)) {
                    t.enableMakeupAssets && (p = !0, f.push(e));
                    return
                }
                if (u(e)) {
                    if (d(e, r)) return void n.push(e);
                    f.push(e)
                }
            }), 0 !== f.length && e.webStableId && o.push({
                key: e.webStableId,
                name: null != (i = e.name) ? i : "",
                webStableId: e.webStableId,
                assetTypeIds: e.assetTypeIds,
                isMakeup: p,
                children: f
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
    var t, a, i, n = e.i(671376),
        r = e.i(692587),
        s = e.i(117236);
    let l = "AvatarItems",
        o = "".concat(l, "-"),
        d = n.Asset.HairAccessory;

    function u(e) {
        return e ? "".concat(o).concat(e) : l
    }

    function c(e) {
        let t = (0, r.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let m = "recents",
        f = "Recents",
        p = "looks",
        h = new Set(null != (t = null == (i = s.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = i.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

    function g(e) {
        return h.has(e)
    }
    e.s(["ALL_ASSET_TYPES_L1_KEY", 0, "all", "AVATAR_ITEMS_ACTIVE_TAB", 0, l, "AVATAR_LOOKS_L1_KEY", 0, p, "RECENTS_L1_KEY", 0, m, "TAXONOMY_HOST_ASSET", 0, d, "buildRecentsActiveTab", 0, function(e) {
        return e ? u(m) : f
    }, "buildTaxonomyActiveTab", 0, u, "isAllAssetTypesActiveTab", 0, function(e) {
        return "all" === c(e)
    }, "isAvatarLooksActiveTab", 0, function(e) {
        return c(e) === p
    }, "isRecentsActiveTab", 0, function(e) {
        return (0, r.readQueryValue)(e) === f || c(e) === m
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, r.readQueryValue)(e);
        return a === l || null != (t = null == a ? void 0 : a.startsWith(o)) && t
    }, "isTaxonomyEligibleAssetTab", 0, g, "parseTaxonomyActiveTab", 0, c, "shouldOpenTaxonomyView", 0, function(e) {
        let {
            isTaxonomyEnabled: t,
            isChangingSection: a,
            nextAssetType: i
        } = e;
        return t && a && g(i)
    }])
}, 456810, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(959222),
        i = e.i(54842),
        n = e.i(252842),
        r = e.i(671376);
    let s = {
            [r.Asset.Place]: a.SearchSortParameter.LastUpdated,
            [r.Asset.UpcomingEvent]: i.EventSortBy.StartUtc,
            [r.Asset.PastEvent]: i.EventSortBy.StartUtc,
            [r.Asset.DraftEvent]: i.EventSortBy.StartUtc
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
}, 704443, e => {
    "use strict";
    var t = e.i(671376);
    e.s(["getSortForAssetType", 0, function(e, a) {
        return e === t.Asset.UpcomingEvent || e === t.Asset.PastEvent || e === t.Asset.DraftEvent ? a[e] : a[t.Asset.Place]
    }])
}, 211461, 899441, 59937, e => {
    "use strict";
    var t, a, i, n = e.i(677753),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function s(e, t, a, i) {
        return new(a || (a = Promise))(function(n, r) {
            function s(e) {
                try {
                    o(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                try {
                    o(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(s, l)
            }
            o((i = i.apply(e, t || [])).next())
        })
    }

    function l(e, t) {
        var a, i, n, r = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function l(l) {
            return function(o) {
                var d = [l, o];
                if (a) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, d[0] && (r = 0)), r;) try {
                    if (a = 1, i && (n = 2 & d[0] ? i.return : d[0] ? i.throw || ((n = i.return) && n.call(i), 0) : i.next) && !(n = n.call(i, d[1])).done) return n;
                    switch (i = 0, n && (d = [2 & d[0], n.value]), d[0]) {
                        case 0:
                        case 1:
                            n = d;
                            break;
                        case 4:
                            return r.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = d[1], d = [0];
                            continue;
                        case 7:
                            d = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = r.trys).length > 0 && n[n.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === d[0] && (!n || d[1] > n[0] && d[1] < n[3])) {
                                r.label = d[1];
                                break
                            }
                            if (6 === d[0] && r.label < n[1]) {
                                r.label = n[1], n = d;
                                break
                            }
                            if (n && r.label < n[2]) {
                                r.label = n[2], r.ops.push(d);
                                break
                            }
                            n[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    d = t.call(e, r)
                } catch (e) {
                    d = [6, e], i = 0
                } finally {
                    a = n = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var o = {
        Invalid: "ASSET_TYPE_INVALID",
        Image: "ASSET_TYPE_IMAGE",
        Tshirt: "ASSET_TYPE_TSHIRT",
        Audio: "ASSET_TYPE_AUDIO",
        Mesh: "ASSET_TYPE_MESH",
        Lua: "ASSET_TYPE_LUA",
        Html: "ASSET_TYPE_HTML",
        Text: "ASSET_TYPE_TEXT",
        Hat: "ASSET_TYPE_HAT",
        Place: "ASSET_TYPE_PLACE",
        Model: "ASSET_TYPE_MODEL",
        Shirt: "ASSET_TYPE_SHIRT",
        Pants: "ASSET_TYPE_PANTS",
        Decal: "ASSET_TYPE_DECAL",
        Avatar: "ASSET_TYPE_AVATAR",
        Head: "ASSET_TYPE_HEAD",
        Face: "ASSET_TYPE_FACE",
        Gear: "ASSET_TYPE_GEAR",
        Badge: "ASSET_TYPE_BADGE",
        GroupEmblem: "ASSET_TYPE_GROUP_EMBLEM",
        Animation: "ASSET_TYPE_ANIMATION",
        Arms: "ASSET_TYPE_ARMS",
        Legs: "ASSET_TYPE_LEGS",
        Torso: "ASSET_TYPE_TORSO",
        RightArm: "ASSET_TYPE_RIGHT_ARM",
        LeftArm: "ASSET_TYPE_LEFT_ARM",
        LeftLeg: "ASSET_TYPE_LEFT_LEG",
        RightLeg: "ASSET_TYPE_RIGHT_LEG",
        Package: "ASSET_TYPE_PACKAGE",
        YoutubeVideo: "ASSET_TYPE_YOUTUBE_VIDEO",
        GamePass: "ASSET_TYPE_GAME_PASS",
        App: "ASSET_TYPE_APP",
        Code: "ASSET_TYPE_CODE",
        Plugin: "ASSET_TYPE_PLUGIN",
        SolidModel: "ASSET_TYPE_SOLID_MODEL",
        MeshPart: "ASSET_TYPE_MESH_PART",
        HairAccessory: "ASSET_TYPE_HAIR_ACCESSORY",
        FaceAccessory: "ASSET_TYPE_FACE_ACCESSORY",
        NeckAccessory: "ASSET_TYPE_NECK_ACCESSORY",
        ShoulderAccessory: "ASSET_TYPE_SHOULDER_ACCESSORY",
        FrontAccessory: "ASSET_TYPE_FRONT_ACCESSORY",
        BackAccessory: "ASSET_TYPE_BACK_ACCESSORY",
        WaistAccessory: "ASSET_TYPE_WAIST_ACCESSORY",
        ClimbAnimation: "ASSET_TYPE_CLIMB_ANIMATION",
        DeathAnimation: "ASSET_TYPE_DEATH_ANIMATION",
        FallAnimation: "ASSET_TYPE_FALL_ANIMATION",
        IdleAnimation: "ASSET_TYPE_IDLE_ANIMATION",
        JumpAnimation: "ASSET_TYPE_JUMP_ANIMATION",
        RunAnimation: "ASSET_TYPE_RUN_ANIMATION",
        SwimAnimation: "ASSET_TYPE_SWIM_ANIMATION",
        WalkAnimation: "ASSET_TYPE_WALK_ANIMATION",
        PoseAnimation: "ASSET_TYPE_POSE_ANIMATION",
        LocalizationTableManifest: "ASSET_TYPE_LOCALIZATION_TABLE_MANIFEST",
        LocalizationTableTranslation: "ASSET_TYPE_LOCALIZATION_TABLE_TRANSLATION",
        EmoteAnimation: "ASSET_TYPE_EMOTE_ANIMATION",
        Video: "ASSET_TYPE_VIDEO",
        TexturePack: "ASSET_TYPE_TEXTURE_PACK",
        TshirtAccessory: "ASSET_TYPE_TSHIRT_ACCESSORY",
        ShirtAccessory: "ASSET_TYPE_SHIRT_ACCESSORY",
        PantsAccessory: "ASSET_TYPE_PANTS_ACCESSORY",
        JacketAccessory: "ASSET_TYPE_JACKET_ACCESSORY",
        SweaterAccessory: "ASSET_TYPE_SWEATER_ACCESSORY",
        ShortsAccessory: "ASSET_TYPE_SHORTS_ACCESSORY",
        LeftShoeAccessory: "ASSET_TYPE_LEFT_SHOE_ACCESSORY",
        RightShoeAccessory: "ASSET_TYPE_RIGHT_SHOE_ACCESSORY",
        DressSkirtAccessory: "ASSET_TYPE_DRESS_SKIRT_ACCESSORY",
        FontFamily: "ASSET_TYPE_FONT_FAMILY",
        FontFace: "ASSET_TYPE_FONT_FACE",
        MeshHiddenSurfaceRemoval: "ASSET_TYPE_MESH_HIDDEN_SURFACE_REMOVAL",
        EyebrowAccessory: "ASSET_TYPE_EYEBROW_ACCESSORY",
        EyelashAccessory: "ASSET_TYPE_EYELASH_ACCESSORY",
        MoodAnimation: "ASSET_TYPE_MOOD_ANIMATION",
        DynamicHead: "ASSET_TYPE_DYNAMIC_HEAD",
        CodeSnippet: "ASSET_TYPE_CODE_SNIPPET",
        AdsVideo: "ASSET_TYPE_ADS_VIDEO"
    };

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            createdDetails: (0, n.exists)(t, "createdDetails") ? t.createdDetails : void 0,
            purchasedDetails: (0, n.exists)(t, "purchasedDetails") ? t.purchasedDetails : void 0,
            sharedDetails: (0, n.exists)(t, "sharedDetails") ? t.sharedDetails : void 0
        }
    }

    function u(e) {
        var t, a, i, r, s, l, o;
        return null == (t = e) ? t : {
            path: (0, n.exists)(t, "path") ? t.path : void 0,
            assetItem: (0, n.exists)(t, "assetItem") ? null == (a = t.assetItem) ? a : {
                asset: (0, n.exists)(a, "asset") ? null == (i = a.asset) ? i : {
                    createTime: (0, n.exists)(i, "createTime") ? new Date(i.createTime) : void 0,
                    updateTime: (0, n.exists)(i, "updateTime") ? new Date(i.updateTime) : void 0,
                    assetId: (0, n.exists)(i, "assetId") ? i.assetId : void 0,
                    displayName: (0, n.exists)(i, "displayName") ? i.displayName : void 0,
                    description: (0, n.exists)(i, "description") ? i.description : void 0,
                    assetType: (0, n.exists)(i, "assetType") ? i.assetType : void 0,
                    creationContext: (0, n.exists)(i, "creationContext") ? null == (r = i.creationContext) ? r : {
                        creator: (0, n.exists)(r, "creator") ? null == (s = r.creator) ? s : {
                            userId: (0, n.exists)(s, "userId") ? s.userId : void 0,
                            groupId: (0, n.exists)(s, "groupId") ? s.groupId : void 0,
                            name: (0, n.exists)(s, "name") ? s.name : void 0
                        } : void 0
                    } : void 0,
                    state: (0, n.exists)(i, "state") ? i.state : void 0,
                    assetSubType: (0, n.exists)(i, "assetSubType") ? i.assetSubType : void 0
                } : void 0,
                sources: (0, n.exists)(a, "sources") ? a.sources.map(d) : void 0,
                isPackage: (0, n.exists)(a, "isPackage") ? a.isPackage : void 0
            } : void 0,
            folderItem: (0, n.exists)(t, "folderItem") ? null == (l = t.folderItem) ? l : {
                folder: (0, n.exists)(l, "folder") ? null == (o = l.folder) ? o : {
                    folderId: (0, n.exists)(o, "folderId") ? o.folderId : void 0,
                    parentFolderId: (0, n.exists)(o, "parentFolderId") ? o.parentFolderId : void 0,
                    displayName: (0, n.exists)(o, "displayName") ? o.displayName : void 0,
                    createTime: (0, n.exists)(o, "createTime") ? new Date(o.createTime) : void 0,
                    updateTime: (0, n.exists)(o, "updateTime") ? new Date(o.updateTime) : void 0
                } : void 0
            } : void 0
        }
    }
    var c = {
            Invalid: "Invalid",
            Created: "Created",
            Purchased: "Purchased",
            Shared: "Shared"
        },
        m = ["assetTypes", "userIds", "groupIds", "universeIds", "includeFolders", "sources"],
        f = function(e) {
            return Object.fromEntries(Object.entries(e).map(function(e) {
                var t = e[0];
                return [e[1], t]
            }))
        },
        p = {
            assetTypes: f(o),
            sources: f(c)
        };

    function h(e, t) {
        var a, i = String(e);
        return t && null != (a = t[i]) ? a : i
    }
    var g = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function a() {
                    this.constructor = e
                }
                r(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
            }(t, e), t.prototype.creatorInventorySearchCreatorInventoryItemsRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var a, i, r;
                    return l(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.filter || void 0 === e.filter) throw new n.RequiredError("filter", "Required parameter requestParameters.filter was null or undefined when calling creatorInventorySearchCreatorInventoryItems.");
                                return a = {}, void 0 !== e.query && (a.query = e.query), void 0 !== e.filter && (a.filter = function(e) {
                                    for (var t = [], a = 0; a < m.length; a++) ! function(a) {
                                        var i = e[a];
                                        if (null != i) {
                                            var n = p[a];
                                            if (Array.isArray(i)) {
                                                if (0 === i.length) return;
                                                t.push("".concat(a, "=").concat(i.map(function(e) {
                                                    return h(e, n)
                                                }).join(",")))
                                            } else t.push("".concat(a, "=").concat(h(i, n)))
                                        }
                                    }(m[a]);
                                    return t.join(";")
                                }(e.filter)), void 0 !== e.maxPageSize && (a.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (a.pageToken = e.pageToken), i = {}, [4, this.request({
                                    path: "/v1/-/creator-inventory-items:search",
                                    schemaPath: "/v1/-/creator-inventory-items:search",
                                    method: "GET",
                                    headers: i,
                                    query: a
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        items: (0, n.exists)(e, "items") ? e.items.map(u) : void 0,
                                        nextPageToken: (0, n.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorInventorySearchCreatorInventoryItems = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return l(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorInventorySearchCreatorInventoryItemsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t
        }(n.BaseAPI),
        v = e.i(272593),
        b = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.Video = "Video", t),
        y = ((a = {}).Group = "groups", a.User = "users", a);
    let A = new g((0, v.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => b, "CreatorInventoryScopeType", () => y, "default", 0, A], 899441), e.s(["CreatorInventorySourceType", 0, c], 59937);
    var S = e.i(671376),
        T = ((i = {}).All = "All", i);
    let E = [b.Model, b.Plugin, b.Audio, b.Decal, b.Image, b.Video, b.Mesh, b.MeshPart, b.Animation],
        x = new Set([b.Audio, b.Decal, b.MeshPart, b.Video]),
        I = {
            [b.Animation]: S.Asset.Animation,
            [b.Audio]: S.Asset.Audio,
            [b.Decal]: S.Asset.Decal,
            [b.Image]: S.Asset.Image,
            [b.Mesh]: S.Asset.Mesh,
            [b.MeshPart]: S.Asset.MeshPart,
            [b.Model]: S.Asset.Model,
            [b.Plugin]: S.Asset.Plugin,
            [b.Video]: S.Asset.Video
        },
        w = new Set(E),
        P = new Set(["All", c.Created, c.Purchased, c.Shared]),
        C = new Set([S.Asset.Animation, S.Asset.Audio, S.Asset.Decal, S.Asset.Image, S.Asset.Mesh, S.Asset.MeshPart, S.Asset.Model, S.Asset.Plugin, S.Asset.Video]),
        _ = {
            [b.Animation]: o.Animation,
            [b.Audio]: o.Audio,
            [b.Decal]: o.Decal,
            [b.Image]: o.Image,
            [b.Mesh]: o.Mesh,
            [b.MeshPart]: o.MeshPart,
            [b.Model]: o.Model,
            [b.Plugin]: o.Plugin,
            [b.Video]: o.Video
        },
        N = {
            3: b.Audio,
            10: b.Model,
            13: b.Decal,
            24: b.Animation,
            38: b.Plugin,
            40: b.MeshPart,
            62: b.Video,
            ANIMATION: b.Animation,
            ASSET_TYPE_ANIMATION: b.Animation,
            ASSET_TYPE_AUDIO: b.Audio,
            ASSET_TYPE_DECAL: b.Decal,
            ASSET_TYPE_IMAGE: b.Image,
            ASSET_TYPE_MESH: b.Mesh,
            ASSET_TYPE_MESH_PART: b.MeshPart,
            ASSET_TYPE_MODEL: b.Model,
            ASSET_TYPE_PLUGIN: b.Plugin,
            ASSET_TYPE_VIDEO: b.Video,
            AUDIO: b.Audio,
            DECAL: b.Decal,
            IMAGE: b.Image,
            MESH: b.Mesh,
            MESHPART: b.MeshPart,
            MODEL: b.Model,
            PLUGIN: b.Plugin,
            VIDEO: b.Video
        },
        k = {
            createdDetails: c.Created,
            purchasedDetails: c.Purchased,
            sharedDetails: c.Shared
        },
        M = {
            STATE_ACTIVE: "Active",
            STATE_ARCHIVED: "Archived"
        },
        D = e => {
            if (null == e) return;
            let t = e instanceof Date ? e : new Date(e);
            return Number.isNaN(t.getTime()) ? void 0 : t
        };
    e.s(["DevelopmentItemsSourceFilter", () => T, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: y.Group,
        id: t
    } : null != e ? {
        type: y.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        assetTypes: [_[t]],
        ...e.type === y.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "developmentItemsAssetTypes", 0, E, "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getDevelopmentItemsSearchAssetTypes", 0, e => [e, ...E.filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => I[e], "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: i
        } = e;
        return t.trim().length > 0 || a || i !== c.Created
    }, "isDevelopmentItemAsset", 0, e => C.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && x.has(e), "isDevelopmentItemsAssetTypeSelection", 0, e => null != e && w.has(e), "isDevelopmentItemsSourceSelection", 0, e => null != e && P.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, i, n, r, s, l;
        let o, d = null == (i = e.assetItem) ? void 0 : i.asset;
        if (null == d) return;
        let u = "number" == typeof d.assetId ? d.assetId : Number.parseInt(null != (t = d.assetId) ? t : "", 10);
        if (Number.isNaN(u)) return;
        let c = null == (n = d.displayName) ? void 0 : n.trim();
        return {
            id: null != (a = e.path) ? a : u.toString(),
            assetId: u,
            assetType: (e => {
                if (null != e) return N[e.toString().toUpperCase()]
            })(d.assetType),
            created: D(d.createTime),
            isPackage: (null == (r = e.assetItem) ? void 0 : r.isPackage) === !0,
            name: null == c || 0 === c.length ? u.toString() : c,
            sources: (l = null == (s = e.assetItem) ? void 0 : s.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let i = k[t];
                    null != i && o.add(i)
                })
            }), [...o]),
            state: null == d.state ? void 0 : M[d.state],
            updated: D(d.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let i = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => e.assetType === a && !i.has(e.assetId))]
    }, "shouldOpenDevelopmentItemInCreatorStore", 0, e => !e.sources.includes(c.Created) && (e.sources.includes(c.Purchased) || e.sources.includes(c.Shared))], 211461)
}, 494601, e => {
    "use strict";
    let t = (0, e.i(706442).makeStyles)()({
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
}, 849087, e => {
    "use strict";
    var t = e.i(913893),
        a = e.i(812141);
    e.s(["default", 0, () => {
        var e;
        let {
            data: i,
            isFetched: n
        } = (0, a.default)(t.default);
        if (n) return null != (e = null == i ? void 0 : i.showAvatarLooksInCreations) && e
    }])
}, 723538, e => {
    "use strict";
    var t = e.i(614505),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: i
        } = (0, t.useFlag)(a.enableTaxonomyBasedCreatorDashboard);
        return e && null != i && i
    }])
}, 665357, e => {
    "use strict";
    var t = e.i(614505),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: i
        } = (0, t.useFlag)(a.enableUgcFolders);
        if (e) return i
    }])
}, 427149, e => {
    "use strict";
    var t = e.i(799972),
        a = e.i(671376),
        i = e.i(759283),
        n = e.i(475360),
        r = e.i(949599),
        s = e.i(117236);
    let l = s.default.reduce((e, t) => {
            var a;
            return t.submenuItems || e.set(t.type, {
                menuItem: t
            }), null == (a = t.submenuItems) || a.forEach(a => {
                if (a.submenuItems) {
                    var i;
                    null == (i = a.submenuItems) || i.forEach(i => {
                        e.set(i.type, {
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
            menuItem: s.default[0]
        },
        d = a.Asset.EyeMakeup,
        u = a.Asset.AvatarLooks,
        c = a.Asset.AvatarBackground;
    e.s(["default", 0, {
        isMenuItemEnabled(e, i, r, s, l, o, m, f) {
            var p, h;
            return (null == e ? void 0 : e.type) === a.Asset.AllCatalogAsset ? null != m && m : (null == e ? void 0 : e.type) === a.Asset.SharedExperiences ? null == r : (null == e ? void 0 : e.type) === a.Asset.Moments ? null != o && o : (null == e ? void 0 : e.itemType) === n.Item.Bundle || ((null == e ? void 0 : e.type) === u ? null != f && f : (null == e ? void 0 : e.type) === c ? i.enableAvatarBackgrounds && null != (p = null == l ? void 0 : l.has(e.type)) && p : (null == e ? void 0 : e.type) === d ? i.enableMakeupAssets && null != (h = null == l ? void 0 : l.has(null == e ? void 0 : e.type)) && h : (null == e ? void 0 : e.type) === void 0 || !!(0, t.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === s || null != s && s)
        },
        getValidMenuState(e, t, a, i, n, r, s, l, o) {
            var u, m, f, p, h, g;
            let v, b, y = (null == (u = t.submenuItem) ? void 0 : u.type) !== d && (null == (m = t.submenuItem) ? void 0 : m.type) !== c || void 0 !== r;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, i, n, r, s, l, o)) {
                if (void 0 !== t.submenuItem && y && !this.isMenuItemEnabled(t.submenuItem, a, i, n, r, s, l, o))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            d = 0;
                        for (; d < (null == (p = t.menuItem.submenuItems) ? void 0 : p.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[d], a, i, n, r, s, l, o)) {
                                e = d;
                                break
                            }
                            d += 1
                        }
                        v = t.menuItem, b = null == (h = t.menuItem.submenuItems) ? void 0 : h[e]
                    } else v = t.menuItem, b = null == (g = t.menuItem.submenuItems) ? void 0 : g[0]
            } else [v] = e, b = null == (f = e[0].submenuItems) ? void 0 : f[0];
            return v ? {
                menuItem: v,
                submenuItem: b
            } : t
        },
        isAssetTypeDirectlyArchivable: e => s.allowedAssetTypesForDirectArchiving.has(e),
        isAssetTypeArchivable(e, t) {
            if (void 0 !== t && r.AvatarMenuMap[e]) {
                let a = r.AvatarMenuMap[e][t],
                    i = null == a ? void 0 : a.assetType;
                return (null == a ? void 0 : a.bundleType) !== void 0 || void 0 !== i && s.allowedAssetTypesForArchiving.has(i)
            }
            return s.allowedAssetTypesForArchiving.has(e)
        },
        isAssetTypeSortable: e => s.allowedAssetTypesForSorting.has(e),
        isItemTypeUploadable: e => s.allowedItemTypesForUploading.has(e),
        getAssetFullNameKey: e => i.assetFullNameKeys[e],
        getItemFullNameKey: e => i.itemFullNameKeys[e],
        getAssetType: e => e.submenuItem ? e.submenuItem.type : e.menuItem.type,
        getItemType(e) {
            return e.submenuItem && e.submenuItem.itemType ? e.submenuItem.itemType : e.menuItem.itemType ? e.menuItem.itemType : i.assetTypeToItemType[this.getAssetType(e)]
        },
        getMenuState(e, t) {
            var a;
            return e && t.includes(e) ? o : e && null != (a = l.get(e)) ? a : o
        }
    }])
}, 418564, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        i = e.i(423107),
        n = e.i(514455),
        r = e.i(872204),
        s = e.i(447055),
        l = e.i(988012),
        o = e.i(391608);
    e.s(["default", 0, e => {
        let {
            alertTitle: d,
            alertDescription: u,
            severity: c,
            externalLink: m,
            linkLabel: f,
            allowCloseDialog: p,
            onDismiss: h
        } = e, {
            classes: {
                alertStyle: g
            }
        } = (0, o.default)(), [v, b] = (0, a.useState)(!0);
        return v ? (0, t.jsxs)(i.Alert, {
            severity: c,
            onClose: void 0,
            className: g,
            action: (0, t.jsxs)(t.Fragment, {
                children: [f && (0, t.jsx)(r.Button, {
                    color: "inherit",
                    size: "small",
                    href: m,
                    children: f
                }), p && (0, t.jsx)(l.IconButton, {
                    "aria-label": "Close",
                    color: "inherit",
                    size: "small",
                    onClick: () => {
                        null == h || h(), b(!1)
                    },
                    children: (0, t.jsx)(s.CloseIcon, {
                        fontSize: "small"
                    })
                })]
            }),
            children: [d && (0, t.jsx)(n.AlertTitle, {
                children: d
            }), u]
        }) : null
    }])
}, 668091, 391608, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(109543);
    e.s(["default", 0, function() {
        return (0, t.useContext)(a.default)
    }], 668091);
    let i = (0, e.i(706442).makeStyles)()(() => ({
        alertStyle: {
            width: "100%"
        }
    }));
    e.s(["default", 0, i], 391608)
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
        i = [t.Locale.Indonesian, t.Locale.German, t.Locale.English, t.Locale.Spanish, t.Locale.French, t.Locale.Italian, t.Locale.Polish, t.Locale.BrazilPortuguese, t.Locale.Vietnamese, t.Locale.Turkish, t.Locale.Arabic, t.Locale.Thai, t.Locale.SimplifiedChinese, t.Locale.TraditionalChinese, t.Locale.Japanese, t.Locale.Korean];
    e.s(["StringLocaleMap", 0, a, "availableDocsLocales", 0, i])
}, 321211, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340);
    e.s(["default", 0, e => {
        let {
            className: i,
            onChange: n,
            onDragActiveHandler: r,
            onDragLeaveHandler: s,
            size: l,
            multiple: o,
            children: d,
            accept: u,
            ...c
        } = e, m = (0, a.useRef)(null), f = () => {
            m.current && m.current.click()
        }, p = e => {
            ((e instanceof Event ? e instanceof KeyboardEvent : e.nativeEvent && e.nativeEvent instanceof KeyboardEvent) ? ["Spacebar", " ", "Enter"].includes(e.key) : (console.info("The event passed in is not a keyboard event, are you using the handler in the wrong place?"), !1)) && (e.preventDefault(), f())
        }, h = d ? d(f, p, e => {
            e.preventDefault();
            let {
                dataTransfer: {
                    files: t
                }
            } = e;
            n && n(t)
        }, e => {
            e.preventDefault(), r && r()
        }, e => {
            e.preventDefault(), s && s()
        }) : null;
        return (0, t.jsxs)("div", {
            className: i,
            children: [h, (0, t.jsx)("input", {
                ...c,
                accept: u,
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
        i = e.i(79187),
        n = e.i(540513),
        r = e.i(199834),
        s = e.i(169722),
        l = e.i(706442),
        o = e.i(590108),
        d = e.i(982234),
        u = e.i(559956),
        c = e.i(770009),
        m = e.i(904090),
        f = e.i(17829),
        p = e.i(426546);
    let h = {
            compact: 32,
            medium: 48,
            large: 64
        },
        g = {
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
                    width: h[a],
                    height: h[a],
                    marginRight: g[a]
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
                target: g,
                targetType: v,
                displayNameOverride: b,
                adornment: A,
                label: S,
                disabled: T,
                variant: E = "medium",
                disableLink: x = !1,
                obfuscate: I = !1,
                hideThumbnail: w = !1,
                hideSecondaryLabel: P = !1,
                textVariant: C = "primary",
                labelTooltip: _
            } = e,
            {
                classes: {
                    container: N,
                    avatarContainer: k,
                    thumbnailItemContainer: M,
                    thumbnailBackground: D,
                    userBorderRadius: L,
                    nonUserBorderRadius: O,
                    itemText: F,
                    mutedText: R,
                    disabledThumbnail: U,
                    textContainer: V
                },
                cx: B
            } = y({
                variant: E
            }),
            {
                translate: j
            } = (0, i.useTranslation)(),
            Y = (0, a.useMemo)(() => v === f.default.User ? n.ThumbnailTypes.avatarHeadshot : v === f.default.Group ? n.ThumbnailTypes.groupIcon : "Ugc" === v ? n.ThumbnailTypes.assetThumbnail : n.ThumbnailTypes.universeThumbnail, [v]),
            G = (0, a.useMemo)(() => {
                if (!x && g.id && !I) {
                    if (v === f.default.User) return p.www.getUserUrl(g.id);
                    if (v === f.default.Group) return p.www.getGroupUrl(g.id);
                    if ("Experience" === v) {
                        let e = "rootPlaceId" in g ? g.rootPlaceId : void 0;
                        return e ? p.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === v) return p.www.getCatalogUrl(g.id)
                }
            }, [x, g, I, v]);
        b ? l = b : v === f.default.User ? l = "displayName" in g ? g.displayName : void 0 : "Ugc" !== v && (l = "name" in g ? g.name : void 0);
        let q = !b && (v === f.default.User && !("displayName" in g && g.displayName) || "Ugc" === v),
            K = (0, a.useMemo)(() => (0, t.jsxs)(s.Grid, {
                container: !0,
                direction: "row",
                alignItems: "center",
                wrap: "wrap",
                children: [q ? (0, t.jsx)(u.Skeleton, {
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
                    children: [(0, t.jsx)(r.Typography, {
                        className: V,
                        variant: "secondary" === C ? "body1" : "compact" === E ? "captionHeader" : "large" === E ? "h2" : "h5",
                        color: T ? "disabled" : "inherit",
                        children: I ? j("Label.Other") : l
                    }), S && S.length > 0 && (0, t.jsx)(m.Tooltip, {
                        arrow: !0,
                        title: _,
                        placement: "right",
                        enterTouchDelay: 0,
                        leaveTouchDelay: 3e3,
                        children: (0, t.jsx)(c.Chip, {
                            color: "secondary",
                            label: S,
                            size: "small",
                            variant: "filled"
                        })
                    })]
                }), !P && (0, t.jsxs)(t.Fragment, {
                    children: [v === f.default.User && (0, t.jsx)(t.Fragment, {
                        children: "name" in g && !g.name ? (0, t.jsx)(u.Skeleton, {
                            animate: !0,
                            variant: "text",
                            width: 192,
                            height: 20
                        }) : (0, t.jsx)(r.Typography, {
                            variant: "secondary" === C ? "body2" : "captionBody",
                            className: B(V, {
                                [R]: "secondary" === C || "compact" === E
                            }),
                            color: T ? "disabled" : "inherit",
                            children: I ? j("Label.Other") : "@".concat("name" in g ? g.name : "")
                        })
                    }), (v === f.default.Group || "Experience" === v) && (0, t.jsx)(r.Typography, {
                        variant: "captionBody",
                        className: B(V, {
                            [R]: "secondary" === C || "compact" === E
                        }),
                        color: T ? "disabled" : "inherit",
                        children: I ? j("Label.Other") : g.id
                    })]
                })]
            }), [q, l, v, g, V, T, I, j, S, P, B, R, C, E, _]);
        return (0, t.jsx)(s.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: N,
            children: (null == g ? void 0 : g.id) === void 0 ? (0, t.jsx)(u.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: h[E]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(s.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!w && (0, t.jsx)(s.Grid, {
                        item: !0,
                        className: M,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: B(k, {
                                [L]: v === f.default.User,
                                [O]: v !== f.default.User,
                                [U]: T
                            }),
                            children: (0, t.jsx)(n.Thumbnail2d, {
                                targetId: g.id,
                                type: Y,
                                imgClassName: D,
                                alt: "thumbnail",
                                returnPolicy: n.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(s.Grid, {
                        container: !0,
                        direction: "column",
                        className: N,
                        children: (0, t.jsx)(s.Grid, {
                            item: !0,
                            children: x || I ? K : (0, t.jsx)(d.Link, {
                                href: G,
                                className: F,
                                color: "inherit",
                                children: K
                            })
                        })
                    })]
                }), A]
            })
        })
    }])
}, 60373, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(29929);
    let i = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            try {
                let a = window.localStorage.getItem(e);
                return a ? JSON.parse(a) : t
            } catch (e) {
                return t
            }
        },
        n = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            try {
                window.localStorage.setItem(e, JSON.stringify(t))
            } catch (e) {
                console.warn("Unable to write to local storage", e)
            }
        };
    e.s(["default", 0, function(e, r) {
        var s;
        let l = null != (s = null == r ? void 0 : r.cacheOnly) && s,
            [o, d] = (0, t.useState)(() => l ? {
                params: i(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == r ? void 0 : r.restoreInitialValueFromCache) ? i(e) : {},
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
                    }), n(e, t)
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

    function i(e) {
        var t, a, i, n;
        if ((null == e ? void 0 : e.mode) === "standalone") return {
            mode: "standalone",
            shouldUnmountOnClose: null == (n = e.shouldUnmountOnClose) || n
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
            shouldUnmountOnClose: null == (i = r.shouldUnmountOnClose) || i
        }
    }
    let n = i(),
        r = {
            ...t = (0, a.createStore)({
                render: null,
                options: null,
                isOpen: !1
            }),
            open: (e, a) => {
                t.setState({
                    render: e,
                    options: i(a),
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
    e.s(["DEFAULT_RESOLVED_CONTENT_OPTIONS", 0, n, "dialogStore", 0, r])
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
                let i = a;
                a = {
                    ...a,
                    ...e
                }, t.forEach(e => e(a, i))
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
        i = (0, t.createStore)({
            current: null
        }),
        n = {
            ...i,
            enqueue: function(e) {
                var t, n;
                let r = i.getSnapshot().current;
                null == r || null == (t = (n = r.props).onClose) || t.call(n), a += 1, i.setState({
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
                } = i.getSnapshot();
                a && (null == (e = (t = a.props).onClose) || e.call(t), i.setState({
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
            page: i,
            rowsPerPage: n,
            hasNextPage: r,
            fetchNextPage: s,
            fetchLimit: l = n
        } = a, o = (0, t.useMemo)(() => {
            let t = i * n;
            return e.slice(t, t + n)
        }, [e, i, n]), d = (i + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            d && r && (null == s || s())
        }, [d, r, s]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: i = 50,
            resetKey: n
        } = e, [r, s] = (0, t.useState)(0), [l, o] = (0, t.useState)(i), [d, u] = (0, t.useState)(n);
        n !== d && (u(n), s(0));
        let c = Math.max(0, Math.ceil(a / l) - 1),
            m = Math.min(r, c);
        return {
            page: m,
            rowsPerPage: l,
            onPageChange: (0, t.useCallback)((e, t) => {
                s(Math.max(0, Math.min(t, c)))
            }, [c]),
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
            fetchNextPage: i,
            disabled: n,
            intervalMs: r = 1e3
        } = e, s = (0, t.useRef)(i);
        s.current = i, (0, t.useEffect)(() => {
            if (!a || n) return;
            s.current();
            let e = setInterval(() => {
                s.current()
            }, r);
            return () => clearInterval(e)
        }, [a, n, r])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(602635),
        i = e.i(79187),
        n = e.i(199834),
        r = e.i(169722),
        s = e.i(706442),
        l = e.i(39128);
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
            icon: u,
            activeKey: c,
            defaultExpanded: m
        } = e, {
            classes: f
        } = o(), {
            ready: p
        } = (0, i.useTranslation)();
        return p ? (0, t.jsxs)(r.Grid, {
            classes: {
                root: f.container
            },
            children: [s && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(r.Grid, {
                    classes: {
                        root: f.headerContainer
                    },
                    children: [u && (0, t.jsx)(r.Grid, {
                        classes: {
                            root: f.icon
                        },
                        children: u
                    }), (0, t.jsx)(n.Typography, {
                        variant: "largeLabel2",
                        classes: {
                            root: f.header
                        },
                        children: s
                    })]
                }), (0, t.jsx)(l.Divider, {
                    classes: {
                        root: f.divider
                    }
                })]
            }), d.length > 0 && (0, t.jsx)(a.NavigationTree, {
                selected: c,
                defaultExpanded: m,
                children: d.map(e => {
                    var i;
                    return (0, t.jsx)(a.NavigationTreeItem, {
                        label: e.label,
                        nodeId: e.key,
                        href: e.href,
                        adornment: e.adornment,
                        variant: "smallLabel2",
                        onClick: e.onClick,
                        children: null == (i = e.subItems) ? void 0 : i.map(i => (0, t.jsx)(a.NavigationTreeItem, {
                            label: i.label,
                            nodeId: i.key,
                            onClick: i.onClick,
                            href: i.href,
                            adornment: i.adornment
                        }, "".concat(e.key, "-").concat(i.key)))
                    }, e.key)
                })
            })]
        }) : null
    }])
}, 373736, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(514961),
        i = e.i(427650),
        n = e.i(79187),
        r = e.i(199834);
    e.s(["default", 0, e => {
        let {
            open: s,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: d
        } = e, {
            translate: u
        } = (0, n.useTranslation)();
        return (0, t.jsx)(i.Dialog, {
            open: s,
            onOpenChange: l,
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: u("Action.Close"),
            children: (0, t.jsxs)(i.DialogContent, {
                children: [(0, t.jsxs)(i.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, t.jsx)(i.DialogTitle, {
                        className: "text-heading-medium margin-y-none",
                        children: u("Label.IdVerification")
                    }), (0, t.jsx)(r.Typography, {
                        className: "text-body-medium",
                        children: u("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(r.Typography, {
                        className: "text-body-medium",
                        children: u("Description.IdVerifiedDialogReverify")
                    })]
                }), (0, t.jsxs)(i.DialogFooter, {
                    className: "flex flex-col gap-xsmall",
                    children: [(0, t.jsx)(a.Button, {
                        variant: "Emphasis",
                        className: "fill",
                        onClick: o,
                        children: u("Action.ContinueWithId")
                    }), (0, t.jsx)(a.Button, {
                        variant: "Standard",
                        className: "fill",
                        onClick: d,
                        children: u("Action.AddAParent")
                    })]
                })]
            })
        })
    }])
}, 917852, 779091, e => {
    "use strict";
    var t, a = e.i(513997),
        i = ((t = {})[t.Done = 0] = "Done", t[t.Required = 1] = "Required", t[t.NotRequired = 2] = "NotRequired", t);
    e.s(["RequirementStatus", () => i], 779091);
    let n = [a.CreatorTierEnum.Private, a.CreatorTierEnum.Trusted, a.CreatorTierEnum.Everyone],
        r = {
            [a.CreatorTierEnum.Private]: "Label.TierStarter",
            [a.CreatorTierEnum.Trusted]: "Label.TierCommunity",
            [a.CreatorTierEnum.Everyone]: "Label.TierProfessional"
        },
        s = {
            [a.CreatorTierEnum.Private]: "Description.TierStarter",
            [a.CreatorTierEnum.Trusted]: "Description.TierCommunity",
            [a.CreatorTierEnum.Everyone]: "Description.TierProfessional"
        },
        l = "https://".concat("roblox.com", "/my/account?idVerification#!/info"),
        o = "https://".concat("roblox.com", "/my/account?addParent#!/parental-controls"),
        d = [{
            id: a.CreatorEligibilityEnum.ModerationStatusOk,
            labelKey: "Label.AccountInGoodStanding",
            descriptionKey: "Description.AccountInGoodStanding",
            tiers: {
                [a.CreatorTierEnum.Private]: i.Required,
                [a.CreatorTierEnum.Trusted]: i.Required,
                [a.CreatorTierEnum.Everyone]: i.Required
            }
        }, {
            id: a.CreatorEligibilityEnum.IdVerified,
            labelKey: "Label.IdVerification",
            descriptionKey: "Description.IdVerification",
            actionUrl: l,
            tiers: {
                [a.CreatorTierEnum.Private]: i.NotRequired,
                [a.CreatorTierEnum.Trusted]: i.NotRequired,
                [a.CreatorTierEnum.Everyone]: i.Required
            }
        }, {
            id: a.CreatorEligibilityEnum.AgeEstimationVerified,
            labelKey: "Label.AgeCheck",
            descriptionKey: "Description.AgeCheck",
            actionUrl: "https://".concat("roblox.com", "/my/account?ageVerification#!/info"),
            tiers: {
                [a.CreatorTierEnum.Private]: i.NotRequired,
                [a.CreatorTierEnum.Trusted]: i.Required,
                [a.CreatorTierEnum.Everyone]: i.Required
            }
        }, {
            id: a.CreatorEligibilityEnum.Has2SvEnabled,
            labelKey: "Label.TwoStepVerification",
            descriptionKey: "Description.TwoStepVerification",
            actionUrl: "https://".concat("roblox.com", "/my/account#!/security"),
            tiers: {
                [a.CreatorTierEnum.Private]: i.NotRequired,
                [a.CreatorTierEnum.Trusted]: i.NotRequired,
                [a.CreatorTierEnum.Everyone]: i.Required
            }
        }],
        u = {
            id: a.CreatorEligibilityEnum.IdVerified,
            labelKey: "Label.U13IdVerification",
            descriptionKey: "Description.U13IdVerification",
            actionUrl: o,
            tiers: {
                [a.CreatorTierEnum.Private]: i.NotRequired,
                [a.CreatorTierEnum.Trusted]: i.NotRequired,
                [a.CreatorTierEnum.Everyone]: i.Required
            }
        },
        c = {
            id: a.CreatorEligibilityEnum.IdVerified,
            labelKey: "Label.IdVerification",
            descriptionKey: "Description.B13To18IdVerification",
            tiers: {
                [a.CreatorTierEnum.Private]: i.NotRequired,
                [a.CreatorTierEnum.Trusted]: i.NotRequired,
                [a.CreatorTierEnum.Everyone]: i.Required
            }
        };
    e.s(["B13To18IdRequirement", 0, c, "U13IdRequirement", 0, u, "idVerificationActionUrl", 0, l, "parentLinkActionUrl", 0, o, "requirements", 0, d, "tierDescriptionKeys", 0, s, "tierLabelKeys", 0, r, "tierOrder", 0, n], 917852)
}, 576069, e => {
    "use strict";
    var t = e.i(157310),
        a = e.i(814975),
        i = e.i(605050);
    e.s(["useCreatorEligibility", 0, function() {
        let {
            overrideUserId: e,
            isReady: n = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: r
        } = (0, a.useAuthentication)(), s = null == r ? void 0 : r.id, l = null != e ? e : s;
        return (0, t.useQuery)({
            queryKey: ["creatorEligibility", null != l ? l : null],
            queryFn: async () => {
                if (null == l) throw Error("Creator eligibility userId is required");
                return await i.default.coreContentGetCreatorEligibility({
                    userId: l
                })
            },
            enabled: n && !!l
        })
    }])
}, 812141, e => {
    "use strict";
    var t = e.i(182012),
        a = e.i(157310);
    let i = {},
        n = e => ["folders", null != e ? e : null];
    e.s(["default", 0, function(e) {
        return (0, a.useQuery)({
            queryKey: ["metadata"],
            queryFn: async () => {
                try {
                    let t = await e.getCollectiblesMetadata();
                    return null != t ? t : i
                } catch (e) {
                    return i
                }
            }
        })
    }, "getFoldersQueryKey", 0, n, "useAddItemToFolderMutation", 0, function(e, a) {
        let {
            onSuccess: i,
            onError: n
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.addItemToFolder(t.itemId, t.itemType, t.folderId),
            onSuccess: i,
            onError: n
        })
    }, "useCreateFolderMutation", 0, function(e, a) {
        let {
            onSuccess: i,
            onError: n
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.createFolder(t.name, void 0, t.groupId),
            onSuccess: e => {
                var t;
                return i(null != (t = e.folderId) ? t : "")
            },
            onError: n
        })
    }, "useGetFolders", 0, function(e, t) {
        let i = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
        return (0, a.useQuery)({
            queryKey: n(t),
            queryFn: () => e.getFolders(t),
            enabled: i
        })
    }, "useUpdateFolderMutation", 0, function(e, a) {
        let {
            onSuccess: i,
            onError: n
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.updateFolder(t.folderId, t.name),
            onSuccess: i,
            onError: n
        })
    }])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(221628),
        i = e.i(416340),
        n = e.i(445550),
        r = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t.FrontendFlagEnableCreatorCollaborationLicensing = "PublicFrontendCCL", t.FrontendFlagEnableMarketplaceSalesLicensing = "PublicFrontendMSL", t);
    let s = Object.values(r),
        l = (e => {
            let t = {};
            for (let a of s) t[a] = e(a);
            if (!s.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["DEFAULT_FRONTEND_FLAGS", 0, l, "FRONTEND_FLAG_NAMES", 0, s, "FrontendFlagName", () => r], 448005);
    let o = (0, i.createContext)(null);
    e.s(["default", 0, e => {
        let {
            children: t
        } = e, [r, d] = (0, i.useState)(l), [u, c] = (0, i.useState)(!1), m = (0, i.useCallback)(async e => {
            try {
                let t = await n.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...s.map(e => {
                        var a, i;
                        return {
                            [e]: null != (a = null == t || null == (i = t.data) ? void 0 : i[e]) && a
                        }
                    }));
                d(a)
            } catch (e) {}
        }, []);
        (0, i.useEffect)(() => {
            let e = !0,
                t = {
                    flags: [...s]
                };
            return c(!0), (async () => {
                await m(t), e && c(!1)
            })(), () => {
                e = !1
            }
        }, [m]);
        let f = (0, i.useMemo)(() => ({
            frontendFlags: r,
            getFrontendFlags: m,
            loadingFrontendFlags: u
        }), [r, m, u]);
        return (0, a.jsx)(o.Provider, {
            value: f,
            children: t
        })
    }, "useToolboxServiceApiProvider", 0, function() {
        let e = (0, i.useContext)(o);
        if (null === e) throw Error("useToolboxServiceApiProvider must be used within a ToolboxServiceApiProvider");
        return e
    }], 845592)
}, 74706, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(416340),
        n = e.i(278705),
        r = e.i(514961),
        s = e.i(787244);
    e.i(221628), e.i(220847);
    let l = {
            Info: "rgb(from var(--color-system-emphasis) r g b / 0.05)",
            Warning: "rgb(from var(--color-system-warning) r g b / 0.05)",
            Success: "rgb(from var(--color-system-success) r g b / 0.05)",
            Error: "rgb(from var(--color-system-alert) r g b / 0.05)"
        },
        o = {
            Info: "stroke-system-emphasis",
            Warning: "stroke-system-warning",
            Success: "stroke-system-success",
            Error: "stroke-system-alert"
        },
        d = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        u = {
            Info: "var(--inverse-system-emphasis)",
            Warning: "var(--inverse-system-warning)",
            Success: "var(--inverse-system-success)",
            Error: "var(--inverse-system-alert)"
        },
        c = {
            Info: "bg-action-standard",
            Warning: "bg-inverse-action-standard",
            Success: "bg-inverse-action-standard",
            Error: "bg-action-standard"
        },
        m = (0, i.forwardRef)((e, m) => {
            var {
                title: f,
                description: p,
                linkLabel: h,
                linkHref: g,
                onLinkClick: v,
                showIcon: b = !0,
                infoIconOverride: y,
                layout: A = "Inline",
                variant: S = "Standard",
                severity: T = "Info",
                primaryActionLabel: E,
                onPrimaryAction: x,
                secondaryActionLabel: I,
                onSecondaryAction: w,
                actions: P,
                onDismiss: C,
                dismissIconAriaLabel: _ = "Dismiss banner",
                className: N,
                style: k
            } = e, M = (0, t._)(e, ["title", "description", "linkLabel", "linkHref", "onLinkClick", "showIcon", "infoIconOverride", "layout", "variant", "severity", "primaryActionLabel", "onPrimaryAction", "secondaryActionLabel", "onSecondaryAction", "actions", "onDismiss", "dismissIconAriaLabel", "className", "style"]);
            let D = l[T],
                L = "Emphasis" === S ? c[T] : "",
                O = "Info" === T && y ? y : d[T],
                F = "Stacked" === A,
                R = !!P || !!(E && x) || !!(I && w),
                U = h && i.default.createElement("span", {
                    className: (0, a.default)("text-body-medium underline content-default block text-no-wrap")
                }, h),
                V = U && i.default.createElement(i.default.Fragment, null, i.default.createElement("span", null, " · "), i.default.createElement("a", {
                    className: "shrink-0",
                    href: g,
                    onClick: v
                }, U)),
                B = null != P ? P : E && x || I && w ? i.default.createElement("div", {
                    className: "flex items-center gap-small"
                }, E && x && i.default.createElement(r.Button, {
                    size: "Small",
                    variant: "Standard",
                    onClick: x,
                    className: (0, a.default)("content-emphasis label-small", L)
                }, E), I && w && i.default.createElement(r.Button, {
                    size: "Small",
                    variant: "Utility",
                    onClick: w,
                    className: (0, a.default)("content-emphasis label-small")
                }, I)) : null,
                j = C && i.default.createElement(s.CloseAffordance, {
                    variant: "Utility",
                    size: "Small",
                    isCircular: !0,
                    className: "content-emphasis",
                    "aria-label": _,
                    onClick: C
                });
            return i.default.createElement("div", Object.assign({
                ref: m,
                role: "Warning" === T || "Error" === T ? "alert" : "status",
                className: (0, a.default)("foundation-web-feedback-banner flex flex-col gap-small radius-medium padding-large stroke-standard", "Standard" === S ? "bg-shift-100" : void 0, "Standard" === S ? "stroke-default" : o[T], N),
                style: Object.assign({
                    backgroundColor: "Emphasis" === S ? D : void 0
                }, k)
            }, M), i.default.createElement("div", {
                className: (0, a.default)("flex width-full gap-medium", F ? "items-start" : "items-center flex-wrap")
            }, i.default.createElement("div", {
                className: (0, a.default)("flex grow-1 min-width-0", F ? "flex-col gap-medium basis-0" : "items-center gap-xsmall")
            }, i.default.createElement("div", {
                className: (0, a.default)("flex min-width-0", F ? "gap-medium flex-col grow-1 basis-0" : "gap-xsmall items-center")
            }, i.default.createElement("div", {
                className: (0, a.default)("flex items-center gap-xsmall min-width-0")
            }, i.default.createElement("div", {
                className: (0, a.default)("flex items-center gap-medium min-width-0")
            }, b && O && i.default.createElement(n.Icon, {
                name: O,
                size: "Large",
                className: "shrink-0",
                style: {
                    color: u[T]
                }
            }), i.default.createElement("span", {
                className: (0, a.default)("text-label-medium content-emphasis", F ? "" : "block padding-y-xsmall text-truncate-end text-no-wrap min-width-0 grow-1 basis-0")
            }, f)), F && V), p && (F ? i.default.createElement("div", {
                className: (0, a.default)("text-body-medium text-truncate-split content-default width-full")
            }, p) : i.default.createElement(i.default.Fragment, null, i.default.createElement("span", {
                className: "text-body-medium text-truncate-end content-default block text-no-wrap min-width-0 fill"
            }, p), i.default.createElement("span", {
                className: "flex items-center gap-xsmall"
            }, V))), !F && !p && V && i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, V)), F && R && B), !F && (R || C) && i.default.createElement("div", {
                className: "flex items-center justify-end gap-small shrink-0"
            }, R && B, j), F && j && i.default.createElement("div", {
                className: "shrink-0"
            }, j)))
        });
    e.s(["FeedbackBanner", 0, m])
}, 947591, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(416340),
        n = e.i(353108);
    e.i(221628);
    let r = new Set(["_self", "_parent", "_top"]),
        s = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        l = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        o = (0, i.forwardRef)((e, o) => {
            var d, u, c, {
                    children: m,
                    className: f,
                    size: p,
                    color: h = "Emphasis",
                    variant: g = "Standalone",
                    underline: v = "hover",
                    isExternal: b,
                    asChild: y
                } = e,
                A = (0, t._)(e, ["children", "className", "size", "color", "variant", "underline", "isExternal", "asChild"]);
            let S = (d = null != (c = A.as) ? c : "a", u = "button" === A.as ? void 0 : A.target, void 0 !== b ? b : "button" !== d && void 0 !== u && !r.has(u)),
                T = (0, a.default)("foundation-web-link", "button" === A.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || S) && "inline-flex items-center gap-xsmall", void 0 !== p && s[p], l[h], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", f),
                E = S ? i.default.createElement("span", {
                    "aria-hidden": !0,
                    "data-testid": "foundation-web-icon",
                    className: (0, a.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
                }) : null;
            if (y) {
                let e = (0, t._)(A, ["as"]),
                    a = i.default.Children.only(m);
                return i.default.isValidElement(a) ? i.default.createElement(n.S, Object.assign({
                    ref: o
                }, e, {
                    className: T
                }), i.default.cloneElement(a, {}, i.default.createElement(i.default.Fragment, null, a.props.children, E))) : null
            }
            if ("button" === A.as) {
                let {
                    as: e,
                    type: a
                } = A, n = (0, t._)(A, ["as", "type"]);
                return i.default.createElement("button", Object.assign({
                    ref: o,
                    type: null != a ? a : "button"
                }, n, {
                    className: T
                }), m, E)
            }
            let x = (0, t._)(A, ["as"]);
            return i.default.createElement("a", Object.assign({
                ref: o
            }, x, {
                className: T
            }), m, E)
        });
    o.displayName = "Link", e.s(["Link", 0, o])
}, 270737, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(416340);
    (0, e.i(422711).s)(".foundation-web-media-image{height:100%;-o-object-fit:cover;object-fit:cover;-o-object-position:center;object-position:center;width:100%}");
    let n = {
            "1:1": "aspect-1-1",
            "5:4": "aspect-5-4",
            "4:5": "aspect-4-5",
            "4:3": "aspect-4-3",
            "16:9": "aspect-16-9",
            "2:1": "aspect-2-1"
        },
        r = (0, i.forwardRef)((e, r) => {
            var {
                className: s,
                aspectRatio: l = "1:1",
                alt: o,
                containerClassName: d
            } = e, u = (0, t._)(e, ["className", "aspectRatio", "alt", "containerClassName"]);
            return i.default.createElement("div", {
                className: (0, a.default)("foundation-web-media clip", n[l], d)
            }, i.default.createElement("img", Object.assign({
                ref: r,
                className: (0, a.default)("foundation-web-media-image", s),
                alt: o
            }, u)))
        });
    r.displayName = "Media", e.s(["Media", 0, r])
}, 187901, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(467892),
        n = e.i(66109),
        r = e.i(416340),
        s = e.i(749633);
    e.i(511952);
    var l = e.i(634851),
        o = e.i(532491),
        d = e.i(422711);
    e.i(221628), e.i(149285), (0, d.s)("@keyframes fui-base-sheet-overlay-fade-in{0%{background-color:transparent}to{background-color:var(--color-common-backdrop)}}@keyframes fui-base-sheet-overlay-fade-out{0%{background-color:var(--color-common-backdrop)}to{background-color:transparent}}@keyframes fui-base-sheet-slide-in-from-right{0%{transform:translateX(110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-right{0%{transform:translateX(0)}to{transform:translateX(110%)}}@keyframes fui-base-sheet-slide-in-from-left{0%{transform:translateX(-110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-left{0%{transform:translateX(0)}to{transform:translateX(-110%)}}@keyframes fui-base-sheet-fade-in{0%{opacity:0}to{opacity:1}}@keyframes fui-base-sheet-fade-out{0%{opacity:1}to{opacity:0}}@keyframes fui-base-sheet-slide-in-from-bottom{0%{transform:translateY(110%)}to{transform:translateY(0)}}@keyframes fui-base-sheet-slide-out-to-bottom{0%{transform:translateY(0)}to{transform:translateY(110%)}}.fui-base-sheet-overlay{background-color:var(--color-common-backdrop)}.fui-base-sheet-overlay[data-state=open]{animation:fui-base-sheet-overlay-fade-in var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-state=closed]{animation:fui-base-sheet-overlay-fade-out var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-type=bottomSheet]{align-items:flex-end;justify-content:center}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:env(safe-area-inset-left);margin-right:env(safe-area-inset-right);max-height:90vh;max-width:440px;padding-bottom:env(safe-area-inset-bottom);width:100%}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=open]{animation-duration:var(--time-300);animation-timing-function:var(--ease-standard-out)}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=closed]{animation-duration:var(--time-100);animation-timing-function:var(--ease-standard-in)}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-bottom}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-bottom}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right]{align-items:stretch;justify-content:flex-end}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left]{align-items:stretch;justify-content:flex-start}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true] .fui-base-sheet-content{max-height:100vh;padding-bottom:env(safe-area-inset-bottom);padding-top:env(safe-area-inset-top);width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=right] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-right:env(safe-area-inset-right)}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=left] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-left:env(safe-area-inset-left)}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-left}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-left}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false] .fui-base-sheet-content{border-radius:var(--radius-large);margin:var(--padding-medium);margin-bottom:max(env(safe-area-inset-bottom),var(--padding-medium));margin-top:max(env(safe-area-inset-top),var(--padding-medium));max-height:100vh;max-width:360px;width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=right] .fui-base-sheet-content{margin-right:max(env(safe-area-inset-right),var(--padding-medium))}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=left] .fui-base-sheet-content{margin-left:max(env(safe-area-inset-left),var(--padding-medium))}.fui-base-sheet-overlay[data-type=centerSheet]{align-items:center;justify-content:center;padding:var(--padding-medium)}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content{border-radius:var(--radius-large);max-height:90vh}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Medium] .fui-base-sheet-content{max-width:480px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Large] .fui-base-sheet-content{max-width:640px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-fade-in}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-fade-out}");
    let u = e => {
            let {
                type: t,
                sideSheetSide: n = "right",
                isSideSheetFlush: s = !1,
                centerSheetSize: l = "Medium",
                children: o,
                overlayClassName: d,
                contentClassName: u,
                onOpenAutoFocus: c,
                onCloseAutoFocus: m,
                onPointerDownOutside: f,
                onEscapeKeyDown: p,
                onInteractOutside: h
            } = e;
            return r.default.createElement(i.P, null, r.default.createElement(i.O, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? n : void 0,
                "data-flush": "sideSheet" === t ? s : void 0,
                "data-size": "centerSheet" === t ? l : void 0,
                className: (0, a.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", d)
            }, r.default.createElement(i.b, {
                "data-testid": "fui-base-sheet-content",
                className: (0, a.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", u),
                onOpenAutoFocus: c,
                onCloseAutoFocus: m,
                onPointerDownOutside: f,
                onEscapeKeyDown: p,
                onInteractOutside: h
            }, o)))
        },
        c = e => {
            var t;
            let a = e.currentTarget;
            if (!a) return;
            let i = a.querySelectorAll("[data-autofocus-priority]");
            if (0 === i.length) return;
            let n = [];
            i.forEach(e => {
                let t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                !Number.isNaN(t) && e instanceof HTMLElement && n.push({
                    element: e,
                    priority: t
                })
            }), n.sort((e, t) => e.priority - t.priority);
            let r = n.find(e => {
                var t;
                let a;
                return ("function" != typeof(a = t = e.element).checkVisibility || a.checkVisibility()) && !!(!("disabled" in t) || !t.disabled) && "true" !== t.getAttribute("aria-disabled")
            });
            if (r) {
                e.preventDefault();
                let a = document.activeElement === r.element;
                r.element.focus(), a || (t = r.element) instanceof HTMLInputElement && "function" == typeof t.select && t.select()
            }
        },
        m = (0, r.createContext)(null),
        f = () => {
            let e = (0, r.useContext)(m);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        p = "padding-x-xlarge",
        h = (0, r.forwardRef)((e, i) => {
            var {
                children: n,
                className: s,
                hasPaddingX: l = !0
            } = e, o = (0, t._)(e, ["children", "className", "hasPaddingX"]);
            let {
                type: d
            } = f();
            return r.default.createElement("div", Object.assign({
                ref: i,
                className: (0, a.default)("scroll-y", l && p, "sideSheet" === d ? "grow-1" : "", s)
            }, o), n)
        });
    h.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        var {
            children: i,
            className: n
        } = e, s = (0, t._)(e, ["children", "className"]);
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(o.Divider, null), r.default.createElement("div", Object.assign({
            className: (0, a.default)(p, "margin-y-small shrink-0", n)
        }, s), i))
    }, "SheetBody", 0, h, "SheetContent", 0, e => {
        let t, {
                children: i,
                centerSheetSize: n = "Medium",
                largeScreenVariant: l = "center",
                closeLabel: o,
                className: d,
                mobilePortraitClassName: f,
                mobileLandscapeClassName: p,
                largeScreenClassName: h,
                onOpenAutoFocus: g,
                onCloseAutoFocus: v,
                onPointerDownOutside: b,
                onEscapeKeyDown: y,
                onInteractOutside: A
            } = e,
            S = (0, s.u)("(orientation: portrait) and (max-width: 600px)"),
            T = (0, s.u)("(orientation: landscape) and (max-height: 600px)");
        t = S ? "bottomSheet" : T || "side" === l ? "sideSheet" : "centerSheet";
        let E = (0, r.useMemo)(() => ({
                centerSheetSize: n,
                largeScreenVariant: l,
                closeLabel: o,
                isPortraitMobile: S,
                isLandscapeMobile: T,
                type: t
            }), [n, l, o, S, T, t]),
            x = (0, a.default)(d, S && f, T && p, !S && !T && h);
        return r.default.createElement(m.Provider, {
            value: E
        }, r.default.createElement(u, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: T,
            centerSheetSize: n,
            contentClassName: x,
            onOpenAutoFocus: null != g ? g : c,
            onCloseAutoFocus: v,
            onPointerDownOutside: b,
            onEscapeKeyDown: y,
            onInteractOutside: A
        }, i))
    }, "SheetDescription", 0, e => r.default.createElement(i.D, Object.assign({
        asChild: !0
    }, e)), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: n,
            children: s
        } = e;
        return r.default.createElement(i.R, {
            open: t,
            onOpenChange: a,
            defaultOpen: n,
            modal: !0
        }, s)
    }, "SheetTitle", 0, e => {
        let {
            className: t,
            children: s,
            navigation: o,
            utilities: d,
            visuallyHideTitleText: u
        } = e, {
            closeLabel: c
        } = f(), m = r.default.createElement(i.T, {
            className: "text-heading-small margin-none"
        }, s);
        return r.default.createElement("div", {
            className: (0, a.default)(t, o ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, r.default.createElement("div", {
            className: (0, a.default)("flex items-center", o && "gap-xsmall")
        }, o, u ? r.default.createElement(n.V, null, m) : m), r.default.createElement("div", {
            className: (0, a.default)("flex items-center", d && "gap-xxsmall")
        }, d, r.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, r.default.createElement(i.C, {
            asChild: !0
        }, r.default.createElement(l.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: c || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "SheetTrigger", 0, e => r.default.createElement(i.a, Object.assign({
        asChild: !0
    }, e))], 187901)
}, 886493, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(416340),
        n = e.i(278705),
        r = e.i(634851),
        s = e.i(422711);
    e.i(221628), (0, s.s)(".foundation-web-table{border-collapse:collapse;border-spacing:0}.foundation-web-table-row-divider{border-bottom:1px solid var(--color-stroke-muted)}.foundation-web-table-body>tr:last-child>.foundation-web-table-row-divider{border-bottom:none}.foundation-web-table-header-cell-divider{border-bottom:1px solid var(--color-stroke-default)}.foundation-web-table-row:focus-visible{outline:var(--stroke-thick) solid var(--color-stroke-emphasis);outline-offset:calc(var(--stroke-thick)*-1)}.foundation-web-table-pagination-select{-webkit-appearance:none;-moz-appearance:none;appearance:none;border:none;font:inherit;outline:none}.foundation-web-table-pagination-select:focus-visible{outline:var(--stroke-thick) solid var(--color-stroke-emphasis);outline-offset:calc(var(--stroke-thick)*-1)}");
    let l = (0, i.createContext)(null),
        o = e => {
            let t = (0, i.useContext)(l);
            if (!t) throw Error("".concat(e, " must be used within a <Table>"));
            return t
        },
        d = {
            XSmall: "height-800",
            Small: "height-1200",
            Medium: "height-1500"
        },
        u = {
            XSmall: "padding-x-medium",
            Small: "padding-x-large",
            Medium: "padding-x-xlarge"
        },
        c = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        m = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        f = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        p = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        h = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        g = (0, i.forwardRef)((e, n) => {
            var {
                children: r,
                size: s = "Medium",
                variant: o = "Divided",
                className: d
            } = e, u = (0, t._)(e, ["children", "size", "variant", "className"]);
            let c = (0, i.useMemo)(() => ({
                    size: s,
                    variant: o
                }), [s, o]),
                m = "Framed" === o;
            return i.default.createElement(l.Provider, {
                value: c
            }, i.default.createElement("div", {
                className: (0, a.default)("width-full bg-surface-100", m && "radius-medium clip stroke-standard stroke-default")
            }, i.default.createElement("table", Object.assign({
                ref: n,
                className: (0, a.default)("foundation-web-table width-full content-default", d)
            }, u), r)))
        });
    g.displayName = "Table";
    let v = (0, i.forwardRef)((e, n) => {
        var {
            children: r,
            className: s
        } = e, l = (0, t._)(e, ["children", "className"]);
        return o("TableHeader"), i.default.createElement("thead", Object.assign({
            ref: n,
            className: (0, a.default)("foundation-web-table-header", s)
        }, l), r)
    });
    v.displayName = "TableHeader";
    let b = (0, i.forwardRef)((e, n) => {
        var {
            children: r,
            className: s
        } = e, l = (0, t._)(e, ["children", "className"]);
        return o("TableBody"), i.default.createElement("tbody", Object.assign({
            ref: n,
            className: (0, a.default)("foundation-web-table-body", s)
        }, l), r)
    });
    b.displayName = "TableBody";
    let y = (0, i.forwardRef)((e, n) => {
        var {
            children: r,
            className: s,
            isInteractive: l = !1,
            isHoverable: d = !1,
            isSelected: u = !1,
            isDisabled: c = !1,
            onClick: m,
            onKeyDown: f,
            tabIndex: p,
            role: h
        } = e, g = (0, t._)(e, ["children", "className", "isInteractive", "isHoverable", "isSelected", "isDisabled", "onClick", "onKeyDown", "tabIndex", "role"]);
        o("TableRow");
        let v = l ? {
            role: null != h ? h : "row",
            tabIndex: null != p ? p : 0,
            onClick: c ? void 0 : m,
            onKeyDown: e => {
                c || (null == f || f(e), e.defaultPrevented || "Enter" !== e.key && " " !== e.key || (e.preventDefault(), null == m || m(e)))
            }
        } : {
            role: h,
            tabIndex: p,
            onClick: m,
            onKeyDown: f
        };
        return i.default.createElement("tr", Object.assign({
            ref: n,
            "aria-selected": l ? u : void 0,
            "aria-disabled": !(!l || !c) || void 0,
            "data-selected": u || void 0,
            className: (0, a.default)("foundation-web-table-row", (l || d) && "hover:bg-shift-100", l && !c && "cursor-pointer", l && c && "opacity-disabled pointer-events-none", u && "bg-shift-200", s)
        }, v, g), r)
    });
    y.displayName = "TableRow";
    let A = (0, i.forwardRef)((e, r) => {
        var {
            children: s,
            className: l,
            sortDirection: d,
            onSort: f,
            align: g = "start",
            sortLabel: v,
            scope: b
        } = e, y = (0, t._)(e, ["children", "className", "sortDirection", "onSort", "align", "sortLabel", "scope"]);
        let {
            size: A
        } = o("TableHeaderCell"), S = !!f, T = null != d ? d : "none", E = S && "none" !== T && i.default.createElement(n.Icon, {
            name: "ascending" === T ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), x = i.default.createElement("div", {
            className: (0, a.default)("flex items-center gap-xsmall", m[A], "content-muted", h[g])
        }, "end" === g && E, i.default.createElement("span", {
            className: "text-truncate-end"
        }, s), "end" !== g && E), I = "string" == typeof s ? "Sort by ".concat(s) : void 0;
        return i.default.createElement("th", Object.assign({
            ref: r,
            scope: null != b ? b : "col",
            "aria-sort": S ? T : void 0,
            className: (0, a.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", c[A], u[A], p[g], "content-muted", l)
        }, y), S ? i.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: f,
            "aria-label": null != v ? v : I
        }, x) : x)
    });
    A.displayName = "TableHeaderCell";
    let S = (0, i.forwardRef)((e, n) => {
        var {
            children: r,
            className: s,
            align: l = "start"
        } = e, c = (0, t._)(e, ["children", "className", "align"]);
        let {
            size: m
        } = o("TableCell");
        return i.default.createElement("td", Object.assign({
            ref: n,
            className: (0, a.default)("foundation-web-table-cell foundation-web-table-row-divider", d[m], u[m], f[m], p[l], "content-default", s)
        }, c), r)
    });
    S.displayName = "TableCell";
    let T = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        E = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        x = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        I = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        w = {
            XSmall: "gap-xsmall",
            Small: "gap-xsmall",
            Medium: "gap-small"
        },
        P = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "Small"
        },
        C = (0, i.forwardRef)((e, n) => {
            var {
                size: s = "Medium",
                page: l,
                rowsPerPage: o,
                totalRows: d,
                rowsPerPageOptions: u = [10, 25, 50],
                onPageChange: c,
                onRowsPerPageChange: m,
                rowsPerPageLabel: f = "Rows per page",
                firstPageLabel: p = "First page",
                previousPageLabel: h = "Previous page",
                nextPageLabel: g = "Next page",
                lastPageLabel: v = "Last page",
                rangeLabel: b,
                className: y
            } = e, A = (0, t._)(e, ["size", "page", "rowsPerPage", "totalRows", "rowsPerPageOptions", "onPageChange", "onRowsPerPageChange", "rowsPerPageLabel", "firstPageLabel", "previousPageLabel", "nextPageLabel", "lastPageLabel", "rangeLabel", "className"]);
            let S = Math.max(1, Math.ceil(d / o)),
                C = 0 === l,
                _ = l >= S - 1,
                N = 0 === d ? 0 : l * o + 1,
                k = Math.min((l + 1) * o, d),
                M = (0, i.useCallback)(e => {
                    let t = Number(e.target.value);
                    null == m || m(t), c(0)
                }, [m, c]),
                D = P[s];
            return i.default.createElement("div", Object.assign({
                ref: n,
                className: (0, a.default)("flex items-center justify-end", T[s], E[s], y)
            }, A), i.default.createElement("div", {
                className: "flex items-center gap-large"
            }, i.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, m && i.default.createElement("div", {
                className: "flex items-center gap-small"
            }, i.default.createElement("span", {
                className: (0, a.default)(x[s], "content-default")
            }, f), i.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, i.default.createElement("select", {
                className: (0, a.default)("foundation-web-table-pagination-select", x[s], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === s ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: o,
                onChange: M,
                "aria-label": f
            }, u.map(e => i.default.createElement("option", {
                key: e,
                value: e
            }, e))))), i.default.createElement("span", {
                className: (0, a.default)(I[s], "content-default")
            }, b ? b(N, k, d) : "".concat(N, "-").concat(k, " of ").concat(d))), i.default.createElement("div", {
                className: (0, a.default)("flex items-center", w[s])
            }, i.default.createElement(r.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: p,
                size: D,
                variant: "Utility",
                isDisabled: C,
                onClick: () => c(0)
            }), i.default.createElement(r.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: h,
                size: D,
                variant: "Utility",
                isDisabled: C,
                onClick: () => c(l - 1)
            }), i.default.createElement(r.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: g,
                size: D,
                variant: "Utility",
                isDisabled: _,
                onClick: () => c(l + 1)
            }), i.default.createElement(r.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: v,
                size: D,
                variant: "Utility",
                isDisabled: _,
                onClick: () => c(S - 1)
            }))))
        });
    C.displayName = "TablePagination", e.s(["Table", 0, g, "TableBody", 0, b, "TableCell", 0, S, "TableHeader", 0, v, "TableHeaderCell", 0, A, "TablePagination", 0, C, "TableRow", 0, y])
}, 258858, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(416340),
        n = e.i(610160),
        r = e.i(183906);
    e.i(511952);
    var s = e.i(878382);
    let l = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        o = {
            XSmall: "padding-y-small",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-small"
        },
        d = {
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
        c = i.default.forwardRef((e, c) => {
            var {
                size: m,
                variant: f = "Standard",
                label: p,
                value: h,
                defaultValue: g,
                isDisabled: v,
                hasError: b,
                helperText: y,
                className: A,
                style: S,
                textareaClassName: T,
                textareaStyle: E,
                id: x
            } = e, I = (0, t._)(e, ["size", "variant", "label", "value", "defaultValue", "isDisabled", "hasError", "helperText", "className", "style", "textareaClassName", "textareaStyle", "id"]);
            let w = (0, n.default)(),
                P = x || w,
                C = "".concat(P, "-description"),
                _ = null != m ? m : "Large";
            return i.default.createElement("div", {
                className: (0, a.default)("flex fill flex-col width-full gap-small", {
                    [r.disabledOpacity]: v
                }, A),
                style: S
            }, p && i.default.createElement("label", {
                htmlFor: P,
                className: (0, a.default)(d[_], "content-emphasis")
            }, p), i.default.createElement("textarea", Object.assign({
                ref: c,
                id: P,
                "data-testid": "text-area-container",
                style: E,
                className: (0, a.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", s.INPUT_BACKGROUND_BY_VARIANT[f], s.INPUT_STROKE_BY_VARIANT[f], b ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", u[_], l[_], o[_], T),
                value: h,
                defaultValue: null == h ? g : void 0,
                disabled: v,
                "aria-describedby": y ? C : void 0
            }, I)), y && i.default.createElement("span", {
                id: C,
                className: (0, a.default)("text-caption-small", {
                    "content-system-alert": b,
                    "content-default": !b
                })
            }, y))
        });
    c.displayName = "TextArea", e.s(["TextArea", 0, c])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: i
        } = t, n = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[n], a, i[n], i) : void 0
    }

    function i(e, t) {
        var a;
        let {
            pages: i,
            pageParams: n
        } = t;
        return i.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, i[0], i, n[0], n) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != i(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (n, r) => {
                var s, l, o, d, u;
                let c = n.options,
                    m = null == (o = n.fetchOptions) || null == (l = o.meta) || null == (s = l.fetchMore) ? void 0 : s.direction,
                    f = (null == (d = n.state.data) ? void 0 : d.pages) || [],
                    p = (null == (u = n.state.data) ? void 0 : u.pageParams) || [],
                    h = {
                        pages: [],
                        pageParams: []
                    },
                    g = 0,
                    v = async () => {
                        let r = !1,
                            s = (0, t.ensureQueryFn)(n.options, n.fetchOptions),
                            l = async (e, a, i) => {
                                let l;
                                if (r) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(l = {
                                        client: n.client,
                                        queryKey: n.queryKey,
                                        pageParam: a,
                                        direction: i ? "backward" : "forward",
                                        meta: n.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (n.signal.aborted ? r = !0 : n.signal.addEventListener("abort", () => {
                                            r = !0
                                        }), n.signal)
                                    }), l),
                                    d = await s(o),
                                    {
                                        maxPages: u
                                    } = n.options,
                                    c = i ? t.addToStart : t.addToEnd;
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
                                n = (e ? i : a)(c, t);
                            h = await l(t, n, e)
                        } else {
                            let t = null != e ? e : f.length;
                            do {
                                var o;
                                let e = 0 === g ? null != (o = p[0]) ? o : c.initialPageParam : a(c, h);
                                if (g > 0 && null == e) break;
                                h = await l(h, e), g++
                            } while (g < t)
                        }
                        return h
                    };
                n.options.persister ? n.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = n.options).persister) ? void 0 : e.call(t, v, {
                        client: n.client,
                        queryKey: n.queryKey,
                        meta: n.options.meta,
                        signal: n.signal
                    }, r)
                } : n.fetchFn = v
            }
        }
    }])
}, 630986, e => {
    "use strict";
    var t = e.i(468612),
        a = e.i(117437),
        i = class extends t.QueryObserver {
            bindMethods() {
                super.bindMethods(), this.fetchNextPage = this.fetchNextPage.bind(this), this.fetchPreviousPage = this.fetchPreviousPage.bind(this)
            }
            setOptions(e) {
                super.setOptions({
                    ...e,
                    behavior: (0, a.infiniteQueryBehavior)()
                })
            }
            getOptimisticResult(e) {
                return e.behavior = (0, a.infiniteQueryBehavior)(), super.getOptimisticResult(e)
            }
            fetchNextPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "forward"
                        }
                    }
                })
            }
            fetchPreviousPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "backward"
                        }
                    }
                })
            }
            createResult(e, t) {
                var i, n;
                let {
                    state: r
                } = e, s = super.createResult(e, t), {
                    isFetching: l,
                    isRefetching: o,
                    isError: d,
                    isRefetchError: u
                } = s, c = null == (n = r.fetchMeta) || null == (i = n.fetchMore) ? void 0 : i.direction, m = d && "forward" === c, f = l && "forward" === c, p = d && "backward" === c, h = l && "backward" === c;
                return {
                    ...s,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.hasNextPage)(t, r.data),
                    hasPreviousPage: (0, a.hasPreviousPage)(t, r.data),
                    isFetchNextPageError: m,
                    isFetchingNextPage: f,
                    isFetchPreviousPageError: p,
                    isFetchingPreviousPage: h,
                    isRefetchError: u && !m && !p,
                    isRefetching: o && !f && !h
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        n = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, n.useBaseQuery)(e, i, t)
    }], 630986)
}]);

//# debugId=f5b5859a-e096-bfdb-7c5f-503a8c8e85c9
//# sourceMappingURL=1y1h9x_zxyixl.js.map