;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1da0b96d-e235-3514-d20e-e3de4ed91866")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 239328, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableUGCFolders",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        });
    e.s(["enableCreatorShowcases", 0, i, "enableTaxonomyBasedCreatorDashboard", 0, s, "enableUgcFolders", 0, a, "isAutoPublishPreferencesEnabled", 0, r])
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
        i = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1
        });
    e.s(["isAssetAccessRequestsEnabled", 0, s, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, n, "isModelCustomThumbnailUploadEnabled", 0, i, "isPricingEligibilityV2Enabled", 0, l])
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
        i = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, n, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, s, "isMomentsUploadLanguageSelectEnabled", 0, r])
}, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        s = e.i(540459),
        i = e.i(79187),
        r = e.i(814975),
        n = e.i(156071),
        l = e.i(881670),
        o = e.i(745873),
        d = e.i(361975);
    let c = (0, a.createContext)({
        isAffiliateProgramLoading: !1,
        requiresActionToJoinProgram: void 0,
        compliantWithAllUserRequirements: void 0,
        creatorMetadata: void 0,
        isCurrentUserGroupOwner: void 0,
        isGroupEligible: void 0
    });
    c.displayName = "AffiliateProgram";
    let u = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, {
            user: l
        } = (0, r.useAuthentication)(), u = (0, o.useCurrentGroup)(), [m, f] = (0, a.useState)(void 0), [p, g] = (0, a.useState)(), [h, v] = (0, a.useState)(), [b, y] = (0, a.useState)(), [x, A] = (0, a.useState)(), T = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == u ? void 0 : u.id) ? e : 0) !== 0
        }, [u]), [S, w] = (0, a.useState)(void 0), C = void 0 === m || void 0 === p || void 0 === h && T, E = (0, a.useCallback)(async () => {
            try {
                if (T && (null == u ? void 0 : u.id)) {
                    let e = await (0, d.getGroupCreatorMetadata)(u.id);
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
        }, [null == u ? void 0 : u.id, T, null == l ? void 0 : l.id]), I = (0, a.useCallback)(async () => {
            if (T && S || !T) try {
                let e = await (0, d.getRequirements)();
                g(e.requirements);
                return
            } catch (e) {
                return
            }
            g(null)
        }, [S, T]), k = (0, a.useCallback)(async () => {
            if (T && (null == u ? void 0 : u.id)) try {
                let e = await (0, d.getGroupEligibility)(u.id);
                v(e.isEligible)
            } catch (e) {
                v(!1)
            }
        }, [u, T]);
        (0, a.useEffect)(() => {
            C ? A(void 0) : T && !S ? A(!1) : A(!1 === b)
        }, [T, S, b, C]), (0, a.useEffect)(() => {
            (async () => {
                if (T && (null == u ? void 0 : u.id)) {
                    var e;
                    return null == (e = (await n.default.getGroupInfo(u.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && w(e === l.id)
            })
        }, [null == u ? void 0 : u.id, T, l]), (0, a.useEffect)(() => {
            C || !p || T && !S ? y(void 0) : y((null == p ? void 0 : p.length) === 0 || (null == p ? void 0 : p.length) === 1 && p[0] === s.Requirements.Payable)
        }, [S, T, C, p]), (0, a.useEffect)(() => {
            E()
        }, [E]), (0, a.useEffect)(() => {
            I()
        }, [I]), (0, a.useEffect)(() => {
            k()
        }, [k]);
        let N = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: C,
            requiresActionToJoinProgram: x,
            compliantWithAllUserRequirements: b,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != p ? p : void 0,
            isCurrentUserGroupOwner: S,
            isGroupEligible: null != h ? h : void 0
        }), [C, x, b, m, p, S, h]);
        return (0, t.jsx)(c.Provider, {
            value: N,
            children: i
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, u, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(c)
    }])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        s = e.i(416340),
        i = e.i(79187),
        r = e.i(423107),
        n = e.i(514455),
        l = e.i(982234),
        o = e.i(199834),
        d = e.i(872204),
        c = e.i(988012),
        u = e.i(447055),
        m = e.i(358763),
        f = e.i(889311),
        p = e.i(823062),
        g = e.i(881670),
        h = e.i(486736),
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
    let x = (0, i.withTranslation)(e => {
        let t, g, y, x, {
                trackingPage: A,
                alertRedesignVariant: T
            } = e,
            {
                settings: {
                    ageVerificationUpsellGetStartedUrl: S,
                    ageVerificationUpsellViewDetailsUrl: w,
                    establishTrustUpsellGetStartedUrl: C,
                    establishTrustUpsellViewDetailsUrl: E
                }
            } = (0, h.useSettings)(),
            {
                isBannerVisible: I,
                isHighPriority: k,
                variant: N,
                dismissBanner: _
            } = (0, v.useAgeVerificationUpsellContext)(),
            {
                classes: P
            } = b(),
            M = (0, s.useRef)(null),
            {
                unifiedLogger: D
            } = (0, p.useUnifiedLoggerProvider)(),
            {
                translate: L
            } = (0, i.useTranslation)(),
            F = (0, s.useCallback)(() => {
                I && D.logImpressionEvent({
                    eventName: f.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: A,
                        variant: N,
                        ...T && {
                            alertRedesignVariant: T
                        }
                    }
                })
            }, [D, A, N, T, I]);
        (0, m.default)(M, F);
        let j = (0, s.useCallback)(() => {
                D.logClickEvent({
                    eventName: f.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: A,
                        action: "viewDetails",
                        variant: N,
                        ...T && {
                            alertRedesignVariant: T
                        }
                    }
                })
            }, [D, A, N, T]),
            R = (0, s.useCallback)(() => {
                D.logClickEvent({
                    eventName: f.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: A,
                        action: "callToAction",
                        variant: N,
                        ...T && {
                            alertRedesignVariant: T
                        }
                    }
                })
            }, [D, A, N, T]),
            U = (0, s.useCallback)(() => {
                D.logClickEvent({
                    eventName: f.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: A,
                        action: "dismiss",
                        variant: N,
                        ...T && {
                            alertRedesignVariant: T
                        }
                    }
                }), _()
            }, [D, _, A, N, T]);
        return ("establishTrust" === N ? (t = "Title.EstablishTrustBanner", g = "Label.EstablishTrustBanner2", y = C, x = E) : (t = "Title.AgeVerificationBanner", g = "Label.AgeVerificationBanner", y = S, x = w), I) ? (0, a.jsx)("div", {
            ref: M,
            children: (0, a.jsxs)(r.Alert, {
                className: P.alertContainer,
                severity: "ageVerification" === N && k ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(d.Button, {
                    href: y,
                    onClick: R,
                    className: P.getStarted,
                    color: "inherit",
                    size: "small",
                    children: L("Label.AgeVerificationBannerGetStarted") || "Get started"
                }, "getStarted"), (0, a.jsx)(c.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: U,
                    children: (0, a.jsx)(u.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(n.AlertTitle, {
                    children: L(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: L(g)
                }), " ", (0, a.jsx)(l.Link, {
                    className: P.viewDetails,
                    href: x,
                    target: "_blank",
                    color: "inherit",
                    onClick: j,
                    children: L("Label.AgeVerificationBannerViewDetails") || "View details"
                })]
            })
        }) : null
    }, [g.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, x, "AgeVerificationUpsellPage", () => y], 714039)
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        s = e.i(458451),
        i = e.i(889311),
        r = e.i(823062),
        n = e.i(486736);
    let l = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        o = encodeURIComponent("studio/CollaborationSettings"),
        d = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                s = a.status % 100 * 100;
            if (!a.ok && 500 === s && t < 2) return await new Promise(e => setTimeout(e, 2 ** (t + 1) * 500)), d(e, t + 1);
            if (500 === s && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let i = await a.json();
            if (!("access" in i)) throw Error('"access" not found in response');
            return i.access
        }, c = async () => await d("".concat(l, "/v1/upsell-feature-access?nameSpace=").concat(o, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted", u = "CreatorHub.AgeVerificationBannerSettings", m = async () => {
            localStorage.removeItem(u)
        }, f = async () => {
            let e, t = localStorage.getItem(u);
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
            localStorage.setItem(u, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, g = (0, a.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), h = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, v = async () => await c() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: l
        } = e, {
            settings: {
                ageVerificationUpsellBannerStartDate: o,
                ageVerificationUpsellBannerEndDate: d,
                ageVerificationUpsellBannerHighPriorityDate: c
            }
        } = (0, n.useSettings)(), [u, m] = (0, a.useState)(!0), [b, y] = (0, a.useState)("doNotShow"), {
            isFetched: x,
            user: A
        } = (0, s.useRobloxAuthentication)(), {
            unifiedLogger: T
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: S,
            isEnabled: w
        } = (0, a.useMemo)(() => {
            let e = h(o),
                t = h(d),
                a = h(c),
                s = new Date;
            return {
                isHighPriority: a <= s,
                isEnabled: e <= s && s < t
            }
        }, [d, o, c]), C = (0, a.useCallback)(async () => {
            await p(), m(!0)
        }, [m]);
        (0, a.useEffect)(() => {
            w && x && (null == A ? void 0 : A.id) && (async () => {
                let e = !1;
                try {
                    e = await f()
                } catch (e) {
                    T.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                m(e);
                let t = "doNotShow";
                try {
                    t = await v()
                } catch (e) {
                    T.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                y(t)
            })().catch(e => {
                T.logErrorEvent({
                    eventName: i.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [w, x, A, T]);
        let E = (0, a.useMemo)(() => {
            let e = w && "doNotShow" !== b;
            return {
                isBannerVisible: e && !u,
                isBannerEligible: e,
                isHighPriority: S,
                variant: "doNotShow" !== b ? b : "ageVerification",
                dismissBanner: C
            }
        }, [w, b, u, S, C]);
        return (0, t.jsx)(g.Provider, {
            value: E,
            children: l
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(g)], 906791)
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
            children: i
        } = e, [r, n] = (0, a.useState)(), l = e => {
            n(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: r,
            updateDroppedFile: l
        }), [r]);
        return (0, t.jsx)(s.default.Provider, {
            value: o,
            children: i
        })
    }])
}, 799972, e => {
    "use strict";
    var t = e.i(284856),
        a = e.i(671376);
    let {
        docs: s
    } = e.i(829425).creatorHub, i = {
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
    }, n = [a.Asset.Shirt, a.Asset.Pants, a.Asset.Video, a.Asset.TShirt, a.Asset.AvatarBackground], l = [a.Asset.Audio, a.Asset.Video];
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
    }, "assetTypeInfoTextMessage", 0, r, "dashboardAssetTypeToOpenCloudAssetType", 0, i, "getInfoUrl", 0, e => {
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
    }, "maxResolution", 0, e => e === a.Asset.Video ? "4096x2160" : null, "purchasableAssetTypes", 0, n, "quotaEnabledAssetTypes", 0, l])
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
        s = e.i(237401),
        i = e.i(675454),
        r = e.i(237164),
        n = e.i(197649),
        l = e.i(79187),
        o = e.i(169722),
        d = e.i(29929),
        c = e.i(889311),
        u = e.i(215955),
        m = e.i(227700),
        f = e.i(881670),
        p = e.i(114209),
        g = e.i(373736),
        h = e.i(917852),
        v = e.i(576069),
        b = e.i(351111);
    let y = "".concat("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/assets", "/home/publish_eligibility_banner.webp"),
        x = (0, l.withTranslation)(e => {
            var x;
            let {
                universeId: A,
                showCallToAction: T = !0
            } = e, S = (0, s.useRouter)(), {
                translateWithNamespace: w
            } = (0, l.useTranslation)(), {
                params: C,
                isFetched: E
            } = (0, m.useIXPParameters)(d.IXPLayers.CreatorHubCreationsPermission), I = C[d.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: k
            } = (0, p.useCurrentGame)(), N = null == k ? void 0 : k.id, _ = null != A ? A : N && N > 0 ? N : void 0, {
                data: P,
                isLoading: M,
                isFetching: D
            } = (0, v.useCreatorEligibility)(), L = (0, a.useRef)(!1), [F, j] = (0, a.useState)(!1), R = (null == P ? void 0 : P.ageBracket) === i.AgeBracketEnum.Over18, U = (null == P ? void 0 : P.ageBracket) === i.AgeBracketEnum.Between13And18, O = null != (x = null == P ? void 0 : P.creatorEligibility.includes(i.CreatorEligibilityEnum.IdVerified)) && x, B = R || U, q = E && I && !(M || D) && !!P && !O;
            (0, a.useEffect)(() => {
                q && !L.current && (L.current = !0, u.default.logImpressionEvent({
                    eventName: c.default.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: B ? "start" : "viewDetails",
                        ctaHidden: String(!T),
                        ..._ ? {
                            universeId: String(_)
                        } : {}
                    }
                }))
            }, [q, T, B, _]);
            let V = (0, a.useCallback)(() => {
                if (!q) return;
                let e = B ? "start" : "viewDetails";
                (u.default.logClickEvent({
                    eventName: c.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ..._ ? {
                            universeId: String(_)
                        } : {}
                    }
                }), U) ? j(!0): B || S.push("/settings/eligibility/publishing-permissions")
            }, [q, U, S, B, _]);
            return q ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, n.clsx)(b.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
                    children: [(0, t.jsx)("img", {
                        src: y,
                        alt: "",
                        "aria-hidden": !0,
                        className: (0, n.clsx)("block absolute width-full height-full"),
                        style: {
                            top: 0,
                            left: 0
                        },
                        onError: e => {
                            e.currentTarget.style.display = "none"
                        }
                    }), (0, t.jsxs)("div", {
                        className: (0, n.clsx)(b.default.heroTextContent, "dark-theme relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [w(f.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: w(f.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, n.clsx)(b.default.buttonRow, "flex gap-small"),
                            children: T ? R ? (0, t.jsx)(r.Button, {
                                as: "a",
                                href: h.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: V,
                                children: (0, t.jsx)("span", {
                                    children: w(f.TranslationNamespace.AudienceReach, B ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(r.Button, {
                                onClick: V,
                                children: (0, t.jsx)("span", {
                                    children: w(f.TranslationNamespace.AudienceReach, B ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), U ? (0, t.jsx)(g.default, {
                    open: F,
                    onOpenChange: j,
                    onContinueWithId: () => {
                        window.open(h.idVerificationActionUrl, "_blank", "noopener,noreferrer"), j(!1)
                    },
                    onAddParent: () => {
                        window.open(h.parentLinkActionUrl, "_blank", "noopener,noreferrer"), j(!1)
                    }
                }) : null]
            }) : null
        }, [f.TranslationNamespace.AudienceReach, f.TranslationNamespace.PublicPublish]);
    e.s(["default", 0, x])
}, 358763, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(296380);
    let s = () => {};
    e.s(["default", 0, function(e, i) {
        let {
            debounceDelay: r,
            intersectionObserverThreshold: n,
            resetOncePer: l
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, o = (0, t.useRef)(!1), d = (0, t.useCallback)(e => {
            !e || o.current || (o.current = !0, i())
        }, [i]), [c] = (0, a.default)(d, null != r ? r : 250), u = (0, t.useCallback)(e => {
            let [t] = e;
            c(t.isIntersecting)
        }, [c]), m = null != l ? l : "instance";
        (0, t.useMemo)(() => {
            "callback" === m && (o.current = !1)
        }, [i]), (0, t.useEffect)(() => {
            if (!e.current) return s;
            let t = new IntersectionObserver(u, {
                threshold: null != n ? n : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, n, u])
    }])
}, 899441, e => {
    "use strict";
    var t, a, s = e.i(294818),
        i = e.i(272593),
        r = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.Video = "Video", t),
        n = ((a = {}).Group = "groups", a.User = "users", a);
    let l = new s.CreatorInventoryApi((0, i.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => r, "CreatorInventoryScopeType", () => n, "default", 0, l])
}, 445550, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(309999),
        s = e.i(307529),
        i = e.i(272593);
    let r = {
            [s.default.Model]: a.CategoryType.Model,
            [s.default.Plugin]: a.CategoryType.Plugin
        },
        n = {
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
            async getCreations(e, t, a, s, i, n, l) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: r[t],
                    limit: s,
                    cursor: i,
                    separateModelsAndPackages: n,
                    includeSharedAssets: l
                }) : this.toolboxApi.toolboxGetUserCreationAssets({
                    userId: e,
                    assetType: r[t],
                    limit: s,
                    cursor: i
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
                const e = (0, i.createClientConfiguration)("toolbox-service", "bedev2");
                this.frontendFlagsApi = new a.FrontendFlagsApi(e), this.toolboxApi = new a.ToolboxApi(e)
            }
        };
    e.s(["assetTypeIdToAssetType", 0, n, "default", 0, l, "toolboxServiceItemDetailsLimit", 0, 30])
}, 790806, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(176936),
        s = e.i(272593);
    let i = new class {
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
        r = new a.UsersApi((0, s.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: r
    }, "default", 0, i])
}, 131385, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(780880),
        s = e.i(339544),
        i = e.i(643093),
        r = e.i(130778),
        n = e.i(157310),
        l = e.i(913893),
        o = e.i(536306),
        o = o,
        d = e.i(671376),
        c = e.i(486736),
        u = e.i(117236);
    let m = function() {
        let e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
            {
                settings: a
            } = (0, c.useSettings)(),
            s = (0, n.useQuery)({
                queryKey: ["getTaxonomyCategories", o.V1ItemsCategoriesGetCategoryDomainEnum.NUMBER_3],
                queryFn: () => l.default.getItemCategories(o.V1ItemsCategoriesGetCategoryDomainEnum.NUMBER_3),
                enabled: e,
                staleTime: 3e5
            }),
            r = (0, n.useQuery)({
                queryKey: ["getAvatarItemsEntryPointAssetTypes"],
                queryFn: u.getAvatarItemsEntryPointAssetTypes,
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
            p = (0, t.useMemo)(() => (0, i.transformCreatorDashboardTree)(s.data, f), [s.data, f]),
            g = (0, t.useMemo)(() => (0, i.buildTaxonomyL1Options)(p), [p]);
        return {
            response: s.data,
            categories: p,
            l1Options: g,
            isLoading: s.isLoading || r.isLoading,
            isError: s.isError
        }
    };
    e.s(["default", 0, e => {
        var n, l, o;
        let [{
            activeTab: d,
            filterIndex: c
        }] = (0, a.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: u,
            categories: f,
            isLoading: p
        } = m(e), g = (0, r.isAllAssetTypesActiveTab)(d) || (0, r.isRecentsActiveTab)(d) || (0, r.isAvatarLooksActiveTab)(d) ? void 0 : null != (n = (0, r.parseTaxonomyActiveTab)(d)) ? n : null == (o = u[0]) ? void 0 : o.taxonomyKey, h = (0, t.useMemo)(() => (0, i.findL1Category)(f, g), [f, g]), v = (0, t.useMemo)(() => (0, i.buildTaxonomyL2Options)(h), [h]), b = parseInt(null != (l = null == c ? void 0 : c.toString()) ? l : "", 10), y = (0, s.isValidIndex)(b, v) ? b : 0, x = (0, t.useMemo)(() => {
            if (h) return v.length > 0 ? v[y] : h.webStableId ? (0, i.categoryToDropdown)(h) : void 0
        }, [h, v, y]);
        return {
            l1Options: u,
            activeL1Key: g,
            activeL1Node: h,
            l2Options: v,
            filterIndex: y,
            selection: x,
            isLoading: p
        }
    }], 131385)
}, 638016, e => {
    "use strict";
    var t = e.i(780880),
        a = e.i(723538),
        s = e.i(130778);
    e.s(["default", 0, e => {
        let [{
            activeTab: i
        }] = (0, t.useQueryParams)(["activeTab"]), r = (0, a.default)(), n = r && (0, s.isTaxonomyActiveTab)(i), l = r && (0, s.isRecentsActiveTab)(i), o = r && (0, s.isAvatarLooksActiveTab)(i);
        return {
            canUseTaxonomy: r && (n || (0, s.isTaxonomyEligibleAssetTab)(e)),
            isTaxonomyMode: n,
            isTaxonomyView: n && !(0, s.isAllAssetTypesActiveTab)(i) && !(0, s.isRecentsActiveTab)(i) && !(0, s.isAvatarLooksActiveTab)(i),
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
            let [s, i] = e;
            i.forEach((e, i) => {
                t.set(a(s, e.nameKey), i)
            })
        }), t
    }, "isOnItemTab", 0, e => e === t.Asset.TShirt, "isValidIndex", 0, (e, t) => void 0 !== t && void 0 !== e && e > 0 && e < t.length, "serializeMenuMapKey", 0, a], 339544);
    var s = e.i(266213),
        i = e.i(418162);
    let r = new Set([2, 11, 12]),
        n = new Set([76, 77, 88, 89, 90]),
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
            lookType: s.default.Makeup,
            nameKey: "Label.Looks"
        }), a
    }, "categoryToDropdown", 0, m, "findL1Category", 0, function(e, t) {
        if (t) return e.find(e => e.key === t)
    }, "taxonomyOptionLabel", 0, function(e, t) {
        var a;
        return e.skipTranslation ? (0, i.getTaxonomyDisplayName)(e.nameKey, t) : null != (a = t(e.nameKey)) ? a : e.nameKey
    }, "taxonomyOptionValue", 0, function(e) {
        return void 0 !== e.taxonomy ? e.taxonomy : void 0 !== e.lookType ? "look:".concat(e.lookType) : e.nameKey
    }, "transformCreatorDashboardTree", 0, function(e, t) {
        var a;
        let s = null != (a = null == e ? void 0 : e.categories) ? a : [],
            i = [],
            o = [];
        return s.forEach(e => {
            var a, s, u;
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
            let f = [],
                p = !1;
            m.forEach(e => {
                if (d(e, n)) {
                    t.enableMakeupAssets && (p = !0, f.push(e));
                    return
                }
                if (c(e)) {
                    if (d(e, r)) return void i.push(e);
                    f.push(e)
                }
            }), 0 !== f.length && e.webStableId && o.push({
                key: e.webStableId,
                name: null != (s = e.name) ? s : "",
                webStableId: e.webStableId,
                assetTypeIds: e.assetTypeIds,
                isMakeup: p,
                children: f
            })
        }), i.length > 0 && o.push({
            key: "classics",
            name: "Classics",
            webStableId: void 0,
            children: i
        }), o
    }], 643093)
}, 130778, e => {
    "use strict";
    var t, a, s, i = e.i(671376),
        r = e.i(692587),
        n = e.i(117236);
    let l = "AvatarItems",
        o = "".concat(l, "-"),
        d = i.Asset.HairAccessory;

    function c(e) {
        let t = (0, r.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let u = "looks",
        m = new Set(null != (t = null == (s = n.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = s.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

    function f(e) {
        return m.has(e)
    }
    e.s(["ALL_ASSET_TYPES_L1_KEY", 0, "all", "AVATAR_ITEMS_ACTIVE_TAB", 0, l, "AVATAR_LOOKS_L1_KEY", 0, u, "TAXONOMY_HOST_ASSET", 0, d, "buildTaxonomyActiveTab", 0, function(e) {
        return e ? "".concat(o).concat(e) : l
    }, "isAllAssetTypesActiveTab", 0, function(e) {
        return "all" === c(e)
    }, "isAvatarLooksActiveTab", 0, function(e) {
        return c(e) === u
    }, "isRecentsActiveTab", 0, function(e) {
        return "Recents" === (0, r.readQueryValue)(e) || "recents" === c(e)
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, r.readQueryValue)(e);
        return a === l || null != (t = null == a ? void 0 : a.startsWith(o)) && t
    }, "isTaxonomyEligibleAssetTab", 0, f, "parseTaxonomyActiveTab", 0, c, "shouldOpenTaxonomyView", 0, function(e) {
        let {
            isTaxonomyEnabled: t,
            isChangingSection: a,
            nextAssetType: s
        } = e;
        return t && a && f(s)
    }])
}, 456810, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(959222),
        s = e.i(54842),
        i = e.i(252842),
        r = e.i(671376);
    let n = {
            [r.Asset.Place]: a.SearchSortParameter.LastUpdated,
            [r.Asset.UpcomingEvent]: s.EventSortBy.StartUtc,
            [r.Asset.PastEvent]: s.EventSortBy.StartUtc,
            [r.Asset.DraftEvent]: s.EventSortBy.StartUtc
        },
        l = {
            sort: n,
            setSort: () => {
                throw Error("NotImplemented")
            },
            sortOrder: i.SortOrder.Desc,
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
    o.displayName = "Filters", e.s(["default", 0, o, "defaultAssetsSort", 0, n])
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
    var t, a = e.i(294818),
        s = e.i(899441),
        i = e.i(59937),
        r = e.i(671376),
        n = ((t = {}).All = "All", t);
    let l = [s.CreatorInventoryAssetType.Model, s.CreatorInventoryAssetType.Plugin, s.CreatorInventoryAssetType.Audio, s.CreatorInventoryAssetType.Decal, s.CreatorInventoryAssetType.Image, s.CreatorInventoryAssetType.Video, s.CreatorInventoryAssetType.Mesh, s.CreatorInventoryAssetType.MeshPart, s.CreatorInventoryAssetType.Animation],
        o = new Set([s.CreatorInventoryAssetType.Audio, s.CreatorInventoryAssetType.Decal, s.CreatorInventoryAssetType.MeshPart, s.CreatorInventoryAssetType.Video]),
        d = {
            [s.CreatorInventoryAssetType.Animation]: r.Asset.Animation,
            [s.CreatorInventoryAssetType.Audio]: r.Asset.Audio,
            [s.CreatorInventoryAssetType.Decal]: r.Asset.Decal,
            [s.CreatorInventoryAssetType.Image]: r.Asset.Image,
            [s.CreatorInventoryAssetType.Mesh]: r.Asset.Mesh,
            [s.CreatorInventoryAssetType.MeshPart]: r.Asset.MeshPart,
            [s.CreatorInventoryAssetType.Model]: r.Asset.Model,
            [s.CreatorInventoryAssetType.Plugin]: r.Asset.Plugin,
            [s.CreatorInventoryAssetType.Video]: r.Asset.Video
        },
        c = new Set(l),
        u = new Set(["All", i.CreatorInventorySourceType.Created, i.CreatorInventorySourceType.Purchased, i.CreatorInventorySourceType.Shared]),
        m = new Set([r.Asset.Animation, r.Asset.Audio, r.Asset.Decal, r.Asset.Image, r.Asset.Mesh, r.Asset.MeshPart, r.Asset.Model, r.Asset.Plugin, r.Asset.Video]),
        f = {
            [s.CreatorInventoryAssetType.Animation]: a.AssetType.Animation,
            [s.CreatorInventoryAssetType.Audio]: a.AssetType.Audio,
            [s.CreatorInventoryAssetType.Decal]: a.AssetType.Decal,
            [s.CreatorInventoryAssetType.Image]: a.AssetType.Image,
            [s.CreatorInventoryAssetType.Mesh]: a.AssetType.Mesh,
            [s.CreatorInventoryAssetType.MeshPart]: a.AssetType.MeshPart,
            [s.CreatorInventoryAssetType.Model]: a.AssetType.Model,
            [s.CreatorInventoryAssetType.Plugin]: a.AssetType.Plugin,
            [s.CreatorInventoryAssetType.Video]: a.AssetType.Video
        },
        p = {
            3: s.CreatorInventoryAssetType.Audio,
            10: s.CreatorInventoryAssetType.Model,
            13: s.CreatorInventoryAssetType.Decal,
            24: s.CreatorInventoryAssetType.Animation,
            38: s.CreatorInventoryAssetType.Plugin,
            40: s.CreatorInventoryAssetType.MeshPart,
            62: s.CreatorInventoryAssetType.Video,
            ANIMATION: s.CreatorInventoryAssetType.Animation,
            ASSET_TYPE_ANIMATION: s.CreatorInventoryAssetType.Animation,
            ASSET_TYPE_AUDIO: s.CreatorInventoryAssetType.Audio,
            ASSET_TYPE_DECAL: s.CreatorInventoryAssetType.Decal,
            ASSET_TYPE_IMAGE: s.CreatorInventoryAssetType.Image,
            ASSET_TYPE_MESH: s.CreatorInventoryAssetType.Mesh,
            ASSET_TYPE_MESH_PART: s.CreatorInventoryAssetType.MeshPart,
            ASSET_TYPE_MODEL: s.CreatorInventoryAssetType.Model,
            ASSET_TYPE_PLUGIN: s.CreatorInventoryAssetType.Plugin,
            ASSET_TYPE_VIDEO: s.CreatorInventoryAssetType.Video,
            AUDIO: s.CreatorInventoryAssetType.Audio,
            DECAL: s.CreatorInventoryAssetType.Decal,
            IMAGE: s.CreatorInventoryAssetType.Image,
            MESH: s.CreatorInventoryAssetType.Mesh,
            MESHPART: s.CreatorInventoryAssetType.MeshPart,
            MODEL: s.CreatorInventoryAssetType.Model,
            PLUGIN: s.CreatorInventoryAssetType.Plugin,
            VIDEO: s.CreatorInventoryAssetType.Video
        },
        g = {
            createdDetails: i.CreatorInventorySourceType.Created,
            purchasedDetails: i.CreatorInventorySourceType.Purchased,
            sharedDetails: i.CreatorInventorySourceType.Shared
        },
        h = {
            [a.State.Active]: "Active",
            [a.State.Archived]: "Archived"
        },
        v = e => {
            if (null == e) return;
            let t = e instanceof Date ? e : new Date(e);
            return Number.isNaN(t.getTime()) ? void 0 : t
        };
    e.s(["DevelopmentItemsSourceFilter", () => n, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: s.CreatorInventoryScopeType.Group,
        id: t
    } : null != e ? {
        type: s.CreatorInventoryScopeType.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        assetTypes: [f[t]],
        ...e.type === s.CreatorInventoryScopeType.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(i.CreatorInventorySourceType.Created), "developmentItemsAssetTypes", 0, l, "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getDevelopmentItemsSearchAssetTypes", 0, e => [e, ...l.filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => d[e], "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: s
        } = e;
        return t.trim().length > 0 || a || s !== i.CreatorInventorySourceType.Created
    }, "isDevelopmentItemAsset", 0, e => m.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && o.has(e), "isDevelopmentItemsAssetTypeSelection", 0, e => null != e && c.has(e), "isDevelopmentItemsSourceSelection", 0, e => null != e && u.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, s, i, r, n, l;
        let o, d = null == (s = e.assetItem) ? void 0 : s.asset;
        if (null == d) return;
        let c = "number" == typeof d.assetId ? d.assetId : Number.parseInt(null != (t = d.assetId) ? t : "", 10);
        if (Number.isNaN(c)) return;
        let u = null == (i = d.displayName) ? void 0 : i.trim();
        return {
            id: null != (a = e.path) ? a : c.toString(),
            assetId: c,
            assetType: (e => {
                if (null != e) return p[e.toString().toUpperCase()]
            })(d.assetType),
            created: v(d.createTime),
            isPackage: (null == (r = e.assetItem) ? void 0 : r.isPackage) === !0,
            name: null == u || 0 === u.length ? c.toString() : u,
            sources: (l = null == (n = e.assetItem) ? void 0 : n.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let s = g[t];
                    null != s && o.add(s)
                })
            }), [...o]),
            state: null == d.state ? void 0 : h[d.state],
            updated: v(d.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let s = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => e.assetType === a && !s.has(e.assetId))]
    }])
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
            data: s,
            isFetched: i
        } = (0, a.default)(t.default);
        if (i) return null != (e = null == s ? void 0 : s.showAvatarLooksInCreations) && e
    }])
}, 723538, e => {
    "use strict";
    var t = e.i(692734),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: s
        } = (0, t.useFlag)(a.enableTaxonomyBasedCreatorDashboard);
        return e && null != s && s
    }])
}, 665357, e => {
    "use strict";
    var t = e.i(692734),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: s
        } = (0, t.useFlag)(a.enableUgcFolders);
        if (e) return s
    }])
}, 427149, e => {
    "use strict";
    var t = e.i(799972),
        a = e.i(671376),
        s = e.i(759283),
        i = e.i(475360),
        r = e.i(949599),
        n = e.i(117236);
    let l = n.default.reduce((e, t) => {
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
            menuItem: n.default[0]
        },
        d = a.Asset.EyeMakeup,
        c = a.Asset.AvatarLooks,
        u = a.Asset.AvatarBackground,
        m = a.Asset.Showcase;
    e.s(["default", 0, {
        isMenuItemEnabled(e, s, r, n, l, o, f, p, g) {
            var h, v;
            return (null == e ? void 0 : e.type) === a.Asset.AllCatalogAsset ? null != f && f : (null == e ? void 0 : e.type) === a.Asset.SharedExperiences ? null == r : (null == e ? void 0 : e.type) === a.Asset.Moments ? null != o && o : (null == e ? void 0 : e.itemType) === i.Item.Bundle || ((null == e ? void 0 : e.type) === c ? null != p && p : (null == e ? void 0 : e.type) === u ? s.enableAvatarBackgrounds && null != (h = null == l ? void 0 : l.has(e.type)) && h : (null == e ? void 0 : e.type) === m ? null != g && g : (null == e ? void 0 : e.type) === d ? s.enableMakeupAssets && null != (v = null == l ? void 0 : l.has(e.type)) && v : (null == e ? void 0 : e.type) === void 0 || !!(0, t.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === n || null != n && n)
        },
        getValidMenuState(e, t, a, s, i, r, n, l, o, c) {
            var m, f, p, g, h, v;
            let b, y, x = (null == (m = t.submenuItem) ? void 0 : m.type) !== d && (null == (f = t.submenuItem) ? void 0 : f.type) !== u || void 0 !== r;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, s, i, r, n, l, o, c)) {
                if (void 0 !== t.submenuItem && x && !this.isMenuItemEnabled(t.submenuItem, a, s, i, r, n, l, o, c))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            d = 0;
                        for (; d < (null == (g = t.menuItem.submenuItems) ? void 0 : g.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[d], a, s, i, r, n, l, o, c)) {
                                e = d;
                                break
                            }
                            d += 1
                        }
                        b = t.menuItem, y = null == (h = t.menuItem.submenuItems) ? void 0 : h[e]
                    } else b = t.menuItem, y = null == (v = t.menuItem.submenuItems) ? void 0 : v[0]
            } else [b] = e, y = null == (p = e[0].submenuItems) ? void 0 : p[0];
            return b ? {
                menuItem: b,
                submenuItem: y
            } : t
        },
        isAssetTypeDirectlyArchivable: e => n.allowedAssetTypesForDirectArchiving.has(e),
        isAssetTypeArchivable(e, t) {
            if (void 0 !== t && r.AvatarMenuMap[e]) {
                let a = r.AvatarMenuMap[e][t],
                    s = null == a ? void 0 : a.assetType;
                return (null == a ? void 0 : a.bundleType) !== void 0 || void 0 !== s && n.allowedAssetTypesForArchiving.has(s)
            }
            return n.allowedAssetTypesForArchiving.has(e)
        },
        isAssetTypeSortable: e => n.allowedAssetTypesForSorting.has(e),
        isItemTypeUploadable: e => n.allowedItemTypesForUploading.has(e),
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
    var t = e.i(692734),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: s
        } = (0, t.useFlag)(a.enableCreatorShowcases);
        if (e) return s
    }])
}, 418564, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        s = e.i(423107),
        i = e.i(514455),
        r = e.i(872204),
        n = e.i(447055),
        l = e.i(988012),
        o = e.i(391608);
    e.s(["default", 0, e => {
        let {
            alertTitle: d,
            alertDescription: c,
            severity: u,
            externalLink: m,
            linkLabel: f,
            allowCloseDialog: p,
            onDismiss: g
        } = e, {
            classes: {
                alertStyle: h
            }
        } = (0, o.default)(), [v, b] = (0, a.useState)(!0);
        return v ? (0, t.jsxs)(s.Alert, {
            severity: u,
            onClose: void 0,
            className: h,
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
                        null == g || g(), b(!1)
                    },
                    children: (0, t.jsx)(n.CloseIcon, {
                        fontSize: "small"
                    })
                })]
            }),
            children: [d && (0, t.jsx)(i.AlertTitle, {
                children: d
            }), c]
        }) : null
    }])
}, 668091, 391608, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(109543);
    e.s(["default", 0, function() {
        return (0, t.useContext)(a.default)
    }], 668091);
    let s = (0, e.i(706442).makeStyles)()(() => ({
        alertStyle: {
            width: "100%"
        }
    }));
    e.s(["default", 0, s], 391608)
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
        a = e.i(199834),
        s = e.i(706442),
        i = e.i(776344),
        r = e.i(462863),
        n = e.i(210436),
        l = e.i(872378),
        o = e.i(909935),
        d = e.i(587608),
        c = e.i(648550),
        u = e.i(879556),
        m = e.i(156676),
        f = e.i(732097),
        p = e.i(149209),
        g = e.i(152382),
        h = e.i(323377),
        v = e.i(212940),
        b = e.i(581403),
        y = e.i(527781),
        x = e.i(977079),
        A = e.i(402440),
        T = e.i(620094),
        S = e.i(721267),
        w = e.i(788618),
        C = e.i(11730),
        E = e.i(334912),
        I = e.i(315072),
        k = e.i(319700),
        N = e.i(397367),
        _ = e.i(339295),
        P = e.i(26168),
        M = e.i(761562),
        D = e.i(174990),
        L = e.i(226572),
        F = e.i(41024),
        j = e.i(318682),
        R = e.i(902904),
        U = e.i(973248),
        O = e.i(699904),
        B = e.i(861406),
        q = e.i(659373),
        V = e.i(871908),
        z = e.i(712369),
        G = e.i(761170),
        K = e.i(69008),
        H = e.i(610419),
        X = e.i(6938),
        W = e.i(931008),
        Y = e.i(132917),
        Q = e.i(999544),
        J = e.i(370502),
        Z = e.i(779375),
        $ = e.i(179677),
        ee = e.i(761534),
        et = e.i(935295),
        ea = e.i(930283),
        es = e.i(892316),
        ei = e.i(667509),
        er = e.i(285253),
        en = e.i(987596),
        el = e.i(969915);
    let eo = {
        secrets: {
            light: D.default,
            dark: M.default
        },
        noPermissions: {
            light: D.default,
            dark: M.default
        },
        notifications: {
            light: K.default,
            dark: G.default
        },
        experiences: {
            light: en.default,
            dark: er.default
        },
        shareLinks: {
            light: $.default,
            dark: Z.default
        },
        eventsAndUpdates: {
            light: A.default,
            dark: x.default
        },
        avatarItem: {
            light: u.default,
            dark: c.default
        },
        models: {
            light: q.default,
            dark: B.default
        },
        plugins: {
            light: z.default,
            dark: V.default
        },
        audio: {
            light: d.default,
            dark: o.default
        },
        decals: {
            light: y.default,
            dark: b.default
        },
        images: {
            light: C.default,
            dark: w.default
        },
        videos: {
            light: el.default,
            dark: ei.default
        },
        meshes: {
            light: O.default,
            dark: U.default
        },
        animations: {
            light: J.default,
            dark: Q.default
        },
        noUsers: {
            light: v.default,
            dark: h.default
        },
        localization: {
            light: P.default,
            dark: _.default
        },
        rightsManager: {
            light: Y.default,
            dark: W.default
        },
        tokens: {
            light: es.default,
            dark: ea.default
        },
        chart: {
            light: N.default,
            dark: k.default
        },
        badge: {
            light: f.default,
            dark: m.default
        },
        apiKeys: {
            light: l.default,
            dark: n.default
        },
        signin: {
            light: et.default,
            dark: ee.default
        },
        oAuthApps: {
            light: X.default,
            dark: H.default
        },
        makeupLooks: {
            light: F.default,
            dark: L.default
        },
        barGraph: {
            light: g.default,
            dark: p.default
        },
        leaderboard: {
            light: I.default,
            dark: E.default
        },
        findPeople: {
            light: S.default,
            dark: T.default
        },
        managedPricing: {
            light: R.default,
            dark: j.default
        }
    };
    e.s(["default", 0, eo], 938429);
    let ed = "".concat("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/assets", "/spot_illustrations"),
        ec = {
            small: {
                analytics: "".concat(ed, "/small/analytics.svg"),
                animations: "".concat(ed, "/small/animations.svg"),
                audio: "".concat(ed, "/small/audio.svg"),
                audioLight: "".concat(ed, "/small/audio_light.svg"),
                audioDark: "".concat(ed, "/small/audio_dark.svg"),
                avatarItem: "".concat(ed, "/small/avatar_item.svg"),
                beginSearch: "".concat(ed, "/small/beginSearch.svg"),
                creatorStore: "".concat(ed, "/small/creator_store.svg"),
                decals: "".concat(ed, "/small/decals.svg"),
                events: "".concat(ed, "/small/events.svg"),
                experiences: "".concat(ed, "/small/experiences.svg"),
                images: "".concat(ed, "/small/images.svg"),
                meshes: "".concat(ed, "/small/meshes.svg"),
                models: "".concat(ed, "/small/models.svg"),
                plugins: "".concat(ed, "/small/plugins.svg"),
                script: "".concat(ed, "/small/script.svg"),
                song: "".concat(ed, "/small/song.svg"),
                musicNote: "".concat(ed, "/small/audio_music_note.svg"),
                noUsers: "".concat(ed, "/small/no_users.svg"),
                user: "".concat(ed, "/small/user.svg"),
                users: "".concat(ed, "/small/users.svg"),
                videos: "".concat(ed, "/small/videos.svg"),
                search: "".concat(ed, "/small/search.svg"),
                oof: "".concat(ed, "/small/oof.svg"),
                download: "".concat(ed, "/small/download.svg"),
                attributes: "".concat(ed, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(ed, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(ed, "/large/api_keys.svg"),
                localization: "".concat(ed, "/large/localization.svg"),
                noPermissions: "".concat(ed, "/large/no_permissions.svg"),
                oAuthApps: "".concat(ed, "/large/oauth_apps.svg"),
                rights: "".concat(ed, "/large/rights.svg"),
                secrets: "".concat(ed, "/large/secrets.svg"),
                shareLinks: "".concat(ed, "/large/share_links.svg"),
                configurations: "".concat(ed, "/large/configurations.svg"),
                experienceConfigs: "".concat(ed, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(ed, "/large/empty_experiments.svg")
            }
        };
    e.s(["default", 0, ec], 321623);
    let eu = (0, s.makeStyles)()(() => ({
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
        em = e => {
            let {
                illustration: a,
                size: s = "large"
            } = e, i = a && eo[a];
            if (i) return (0, t.jsx)(r.default, {
                lightSrc: i.light,
                darkSrc: i.dark,
                alt: a
            });
            let n = a ? ec[s][a] : null;
            return n && (0, t.jsx)("img", {
                height: "large" === s ? 240 : 96,
                width: "large" === s ? 320 : 96,
                src: n,
                alt: a
            })
        },
        ef = e => {
            let {
                children: s,
                title: r,
                description: n,
                size: l = "large",
                illustration: o
            } = e, {
                classes: {
                    smallContainer: d,
                    largeContainer: c,
                    smallText: u,
                    largeText: m
                },
                cx: f
            } = eu();
            return (0, t.jsxs)(i.default, {
                classes: {
                    root: f({
                        [d]: "small" === l,
                        [c]: "large" === l
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(em, {
                    illustration: o,
                    size: l
                }), (0, t.jsxs)(i.default, {
                    classes: {
                        root: f({
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
                        children: r
                    }), n && (0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: n
                    })]
                }), s]
            })
        };
    ef.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, em, "default", 0, ef], 493924)
}, 321211, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340);
    e.s(["default", 0, e => {
        let {
            className: s,
            onChange: i,
            onDragActiveHandler: r,
            onDragLeaveHandler: n,
            size: l,
            multiple: o,
            children: d,
            accept: c,
            ...u
        } = e, m = (0, a.useRef)(null), f = () => {
            m.current && m.current.click()
        }, p = e => {
            ((e instanceof Event ? e instanceof KeyboardEvent : e.nativeEvent && e.nativeEvent instanceof KeyboardEvent) ? ["Spacebar", " ", "Enter"].includes(e.key) : (console.info("The event passed in is not a keyboard event, are you using the handler in the wrong place?"), !1)) && (e.preventDefault(), f())
        }, g = d ? d(f, p, e => {
            e.preventDefault();
            let {
                dataTransfer: {
                    files: t
                }
            } = e;
            i && i(t)
        }, e => {
            e.preventDefault(), r && r()
        }, e => {
            e.preventDefault(), n && n()
        }) : null;
        return (0, t.jsxs)("div", {
            className: s,
            children: [g, (0, t.jsx)("input", {
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
                    i && i(t.files), m.current && (m.current.value = "")
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
        i = e.i(540513),
        r = e.i(199834),
        n = e.i(169722),
        l = e.i(706442),
        o = e.i(590108),
        d = e.i(982234),
        c = e.i(559956),
        u = e.i(770009),
        m = e.i(904090),
        f = e.i(17829),
        p = e.i(426546);
    let g = {
            compact: 32,
            medium: 48,
            large: 64
        },
        h = {
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
                    marginRight: h[a]
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
                target: h,
                targetType: v,
                displayNameOverride: b,
                adornment: x,
                label: A,
                disabled: T,
                variant: S = "medium",
                disableLink: w = !1,
                obfuscate: C = !1,
                hideThumbnail: E = !1,
                hideSecondaryLabel: I = !1,
                textVariant: k = "primary",
                labelTooltip: N
            } = e,
            {
                classes: {
                    container: _,
                    avatarContainer: P,
                    thumbnailItemContainer: M,
                    thumbnailBackground: D,
                    userBorderRadius: L,
                    nonUserBorderRadius: F,
                    itemText: j,
                    mutedText: R,
                    disabledThumbnail: U,
                    textContainer: O
                },
                cx: B
            } = y({
                variant: S
            }),
            {
                translate: q
            } = (0, s.useTranslation)(),
            V = (0, a.useMemo)(() => v === f.default.User ? i.ThumbnailTypes.avatarHeadshot : v === f.default.Group ? i.ThumbnailTypes.groupIcon : "Ugc" === v ? i.ThumbnailTypes.assetThumbnail : i.ThumbnailTypes.universeThumbnail, [v]),
            z = (0, a.useMemo)(() => {
                if (!w && h.id && !C) {
                    if (v === f.default.User) return p.www.getUserUrl(h.id);
                    if (v === f.default.Group) return p.www.getGroupUrl(h.id);
                    if ("Experience" === v) {
                        let e = "rootPlaceId" in h ? h.rootPlaceId : void 0;
                        return e ? p.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === v) return p.www.getCatalogUrl(h.id)
                }
            }, [w, h, C, v]);
        b ? l = b : v === f.default.User ? l = "displayName" in h ? h.displayName : void 0 : "Ugc" !== v && (l = "name" in h ? h.name : void 0);
        let G = !b && (v === f.default.User && !("displayName" in h && h.displayName) || "Ugc" === v),
            K = (0, a.useMemo)(() => (0, t.jsxs)(n.Grid, {
                container: !0,
                direction: "row",
                alignItems: "center",
                wrap: "wrap",
                children: [G ? (0, t.jsx)(c.Skeleton, {
                    animate: !0,
                    variant: "text",
                    width: 192,
                    height: 22
                }) : (0, t.jsxs)(n.Grid, {
                    container: !0,
                    direction: "row",
                    alignItems: "center",
                    wrap: "wrap",
                    columnGap: 1,
                    children: [(0, t.jsx)(r.Typography, {
                        className: O,
                        variant: "secondary" === k ? "body1" : "compact" === S ? "captionHeader" : "large" === S ? "h2" : "h5",
                        color: T ? "disabled" : "inherit",
                        children: C ? q("Label.Other") : l
                    }), A && A.length > 0 && (0, t.jsx)(m.Tooltip, {
                        arrow: !0,
                        title: N,
                        placement: "right",
                        enterTouchDelay: 0,
                        leaveTouchDelay: 3e3,
                        children: (0, t.jsx)(u.Chip, {
                            color: "secondary",
                            label: A,
                            size: "small",
                            variant: "filled"
                        })
                    })]
                }), !I && (0, t.jsxs)(t.Fragment, {
                    children: [v === f.default.User && (0, t.jsx)(t.Fragment, {
                        children: "name" in h && !h.name ? (0, t.jsx)(c.Skeleton, {
                            animate: !0,
                            variant: "text",
                            width: 192,
                            height: 20
                        }) : (0, t.jsx)(r.Typography, {
                            variant: "secondary" === k ? "body2" : "captionBody",
                            className: B(O, {
                                [R]: "secondary" === k || "compact" === S
                            }),
                            color: T ? "disabled" : "inherit",
                            children: C ? q("Label.Other") : "@".concat("name" in h ? h.name : "")
                        })
                    }), (v === f.default.Group || "Experience" === v) && (0, t.jsx)(r.Typography, {
                        variant: "captionBody",
                        className: B(O, {
                            [R]: "secondary" === k || "compact" === S
                        }),
                        color: T ? "disabled" : "inherit",
                        children: C ? q("Label.Other") : h.id
                    })]
                })]
            }), [G, l, v, h, O, T, C, q, A, I, B, R, k, S, N]);
        return (0, t.jsx)(n.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: _,
            children: (null == h ? void 0 : h.id) === void 0 ? (0, t.jsx)(c.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: g[S]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(n.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!E && (0, t.jsx)(n.Grid, {
                        item: !0,
                        className: M,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: B(P, {
                                [L]: v === f.default.User,
                                [F]: v !== f.default.User,
                                [U]: T
                            }),
                            children: (0, t.jsx)(i.Thumbnail2d, {
                                targetId: h.id,
                                type: V,
                                imgClassName: D,
                                alt: "thumbnail",
                                returnPolicy: i.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(n.Grid, {
                        container: !0,
                        direction: "column",
                        className: _,
                        children: (0, t.jsx)(n.Grid, {
                            item: !0,
                            children: w || C ? K : (0, t.jsx)(d.Link, {
                                href: z,
                                className: j,
                                color: "inherit",
                                children: K
                            })
                        })
                    })]
                }), x]
            })
        })
    }])
}, 296380, e => {
    "use strict";
    var t = e.i(416340);
    let a = (e, a) => {
        let s = (0, t.useRef)(null),
            i = (0, t.useCallback)(() => {
                null !== s.current && (clearTimeout(s.current), s.current = null)
            }, [s]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
            i(), s.current = window.setTimeout(() => {
                e(...r), s.current = null
            }, a)
        }, [e, a, i]), i, s]
    };
    e.s(["default", 0, a, "useDebouncedFunction", 0, a])
}, 60373, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(29929);
    let s = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            try {
                let a = window.localStorage.getItem(e);
                return a ? JSON.parse(a) : t
            } catch (e) {
                return t
            }
        },
        i = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            try {
                window.localStorage.setItem(e, JSON.stringify(t))
            } catch (e) {
                console.warn("Unable to write to local storage", e)
            }
        };
    e.s(["default", 0, function(e, r) {
        var n;
        let l = null != (n = null == r ? void 0 : r.cacheOnly) && n,
            [o, d] = (0, t.useState)(() => l ? {
                params: s(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == r ? void 0 : r.restoreInitialValueFromCache) ? s(e) : {},
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
                    }), i(e, t)
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

    function s(e) {
        var t, a, s, i;
        if ((null == e ? void 0 : e.mode) === "standalone") return {
            mode: "standalone",
            shouldUnmountOnClose: null == (i = e.shouldUnmountOnClose) || i
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
            shouldUnmountOnClose: null == (s = r.shouldUnmountOnClose) || s
        }
    }
    let i = s(),
        r = {
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
    e.s(["DEFAULT_RESOLVED_CONTENT_OPTIONS", 0, i, "dialogStore", 0, r])
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
        i = {
            ...s,
            enqueue: function(e) {
                var t, i;
                let r = s.getSnapshot().current;
                null == r || null == (t = (i = r.props).onClose) || t.call(i), a += 1, s.setState({
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
    e.s(["snackbarStore", 0, i])
}, 125677, 20227, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["useCurrentPage", 0, function(e, a) {
        let {
            page: s,
            rowsPerPage: i,
            hasNextPage: r,
            fetchNextPage: n,
            fetchLimit: l = i
        } = a, o = (0, t.useMemo)(() => {
            let t = s * i;
            return e.slice(t, t + i)
        }, [e, s, i]), d = (s + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            d && r && (null == n || n())
        }, [d, r, n]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: s = 50,
            resetKey: i
        } = e, [r, n] = (0, t.useState)(0), [l, o] = (0, t.useState)(s), [d, c] = (0, t.useState)(i);
        i !== d && (c(i), n(0));
        let u = Math.max(0, Math.ceil(a / l) - 1),
            m = Math.min(r, u);
        return {
            page: m,
            rowsPerPage: l,
            onPageChange: (0, t.useCallback)((e, t) => {
                n(Math.max(0, Math.min(t, u)))
            }, [u]),
            onRowsPerPageChange: (0, t.useCallback)(e => {
                o("number" == typeof e ? e : parseInt(e.target.value, 10)), n(0)
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
            disabled: i,
            intervalMs: r = 1e3
        } = e, n = (0, t.useRef)(s);
        n.current = s, (0, t.useEffect)(() => {
            if (!a || i) return;
            n.current();
            let e = setInterval(() => {
                n.current()
            }, r);
            return () => clearInterval(e)
        }, [a, i, r])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(602635),
        s = e.i(79187),
        i = e.i(199834),
        r = e.i(169722),
        n = e.i(706442),
        l = e.i(39128);
    let o = (0, n.makeStyles)()(e => ({
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
            header: n,
            items: d,
            icon: c,
            activeKey: u,
            defaultExpanded: m
        } = e, {
            classes: f
        } = o(), {
            ready: p
        } = (0, s.useTranslation)();
        return p ? (0, t.jsxs)(r.Grid, {
            classes: {
                root: f.container
            },
            children: [n && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(r.Grid, {
                    classes: {
                        root: f.headerContainer
                    },
                    children: [c && (0, t.jsx)(r.Grid, {
                        classes: {
                            root: f.icon
                        },
                        children: c
                    }), (0, t.jsx)(i.Typography, {
                        variant: "largeLabel2",
                        classes: {
                            root: f.header
                        },
                        children: n
                    })]
                }), (0, t.jsx)(l.Divider, {
                    classes: {
                        root: f.divider
                    }
                })]
            }), d.length > 0 && (0, t.jsx)(a.NavigationTree, {
                selected: u,
                defaultExpanded: m,
                children: d.map(e => {
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
        a = e.i(237164),
        s = e.i(909638),
        i = e.i(79187),
        r = e.i(199834);
    e.s(["default", 0, e => {
        let {
            open: n,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: d
        } = e, {
            translate: c
        } = (0, i.useTranslation)();
        return (0, t.jsx)(s.Dialog, {
            open: n,
            onOpenChange: l,
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: c("Action.Close"),
            children: (0, t.jsxs)(s.DialogContent, {
                children: [(0, t.jsxs)(s.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, t.jsx)(s.DialogTitle, {
                        className: "text-heading-medium margin-y-none",
                        children: c("Label.IdVerification")
                    }), (0, t.jsx)(r.Typography, {
                        className: "text-body-medium",
                        children: c("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(r.Typography, {
                        className: "text-body-medium",
                        children: c("Description.IdVerifiedDialogReverify")
                    })]
                }), (0, t.jsxs)(s.DialogFooter, {
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
}, 917852, 779091, e => {
    "use strict";
    var t, a = e.i(675454),
        s = ((t = {})[t.Done = 0] = "Done", t[t.Required = 1] = "Required", t[t.NotRequired = 2] = "NotRequired", t);
    e.s(["RequirementStatus", () => s], 779091);
    let i = [a.CreatorTierEnum.Private, a.CreatorTierEnum.Trusted, a.CreatorTierEnum.Everyone],
        r = {
            [a.CreatorTierEnum.Private]: "Label.TierStarter",
            [a.CreatorTierEnum.Trusted]: "Label.TierCommunity",
            [a.CreatorTierEnum.Everyone]: "Label.TierProfessional"
        },
        n = {
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
                [a.CreatorTierEnum.Private]: s.Required,
                [a.CreatorTierEnum.Trusted]: s.Required,
                [a.CreatorTierEnum.Everyone]: s.Required
            }
        }, {
            id: a.CreatorEligibilityEnum.IdVerified,
            labelKey: "Label.IdVerification",
            descriptionKey: "Description.IdVerification",
            actionUrl: l,
            tiers: {
                [a.CreatorTierEnum.Private]: s.NotRequired,
                [a.CreatorTierEnum.Trusted]: s.NotRequired,
                [a.CreatorTierEnum.Everyone]: s.Required
            }
        }, {
            id: a.CreatorEligibilityEnum.AgeEstimationVerified,
            labelKey: "Label.AgeCheck",
            descriptionKey: "Description.AgeCheck",
            actionUrl: "https://".concat("roblox.com", "/my/account?ageVerification#!/info"),
            tiers: {
                [a.CreatorTierEnum.Private]: s.NotRequired,
                [a.CreatorTierEnum.Trusted]: s.Required,
                [a.CreatorTierEnum.Everyone]: s.Required
            }
        }, {
            id: a.CreatorEligibilityEnum.Has2SvEnabled,
            labelKey: "Label.TwoStepVerification",
            descriptionKey: "Description.TwoStepVerification",
            actionUrl: "https://".concat("roblox.com", "/my/account#!/security"),
            tiers: {
                [a.CreatorTierEnum.Private]: s.NotRequired,
                [a.CreatorTierEnum.Trusted]: s.NotRequired,
                [a.CreatorTierEnum.Everyone]: s.Required
            }
        }],
        c = {
            id: a.CreatorEligibilityEnum.IdVerified,
            labelKey: "Label.U13IdVerification",
            descriptionKey: "Description.U13IdVerification",
            actionUrl: o,
            tiers: {
                [a.CreatorTierEnum.Private]: s.NotRequired,
                [a.CreatorTierEnum.Trusted]: s.NotRequired,
                [a.CreatorTierEnum.Everyone]: s.Required
            }
        },
        u = {
            id: a.CreatorEligibilityEnum.IdVerified,
            labelKey: "Label.IdVerification",
            descriptionKey: "Description.B13To18IdVerification",
            tiers: {
                [a.CreatorTierEnum.Private]: s.NotRequired,
                [a.CreatorTierEnum.Trusted]: s.NotRequired,
                [a.CreatorTierEnum.Everyone]: s.Required
            }
        };
    e.s(["B13To18IdRequirement", 0, u, "U13IdRequirement", 0, c, "idVerificationActionUrl", 0, l, "parentLinkActionUrl", 0, o, "requirements", 0, d, "tierDescriptionKeys", 0, n, "tierLabelKeys", 0, r, "tierOrder", 0, i], 917852)
}, 576069, e => {
    "use strict";
    var t = e.i(157310),
        a = e.i(814975),
        s = e.i(605050);
    e.s(["useCreatorEligibility", 0, function() {
        let {
            overrideUserId: e,
            isReady: i = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: r
        } = (0, a.useAuthentication)(), n = null == r ? void 0 : r.id, l = null != e ? e : n;
        return (0, t.useQuery)({
            queryKey: ["creatorEligibility", null != l ? l : null],
            queryFn: async () => {
                if (null == l) throw Error("Creator eligibility userId is required");
                return await s.default.coreContentGetCreatorEligibility({
                    userId: l
                })
            },
            enabled: i && !!l
        })
    }])
}, 812141, e => {
    "use strict";
    var t = e.i(182012),
        a = e.i(157310);
    let s = {},
        i = e => ["folders", null != e ? e : null];
    e.s(["default", 0, function(e) {
        return (0, a.useQuery)({
            queryKey: ["metadata"],
            queryFn: async () => {
                try {
                    let t = await e.getCollectiblesMetadata();
                    return null != t ? t : s
                } catch (e) {
                    return s
                }
            }
        })
    }, "getFoldersQueryKey", 0, i, "useAddItemToFolderMutation", 0, function(e, a) {
        let {
            onSuccess: s,
            onError: i
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.addItemToFolder(t.itemId, t.itemType, t.folderId),
            onSuccess: s,
            onError: i
        })
    }, "useCreateFolderMutation", 0, function(e, a) {
        let {
            onSuccess: s,
            onError: i
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.createFolder(t.name, void 0, t.groupId),
            onSuccess: e => {
                var t;
                return s(null != (t = e.folderId) ? t : "")
            },
            onError: i
        })
    }, "useGetFolders", 0, function(e, t) {
        let s = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
        return (0, a.useQuery)({
            queryKey: i(t),
            queryFn: () => e.getFolders(t),
            enabled: s
        })
    }, "useUpdateFolderMutation", 0, function(e, a) {
        let {
            onSuccess: s,
            onError: i
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.updateFolder(t.folderId, t.name),
            onSuccess: s,
            onError: i
        })
    }])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(221628),
        s = e.i(416340),
        i = e.i(445550),
        r = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t);
    let n = Object.values(r),
        l = (e => {
            let t = {};
            for (let a of n) t[a] = e(a);
            if (!n.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["DEFAULT_FRONTEND_FLAGS", 0, l, "FRONTEND_FLAG_NAMES", 0, n, "FrontendFlagName", () => r], 448005);
    let o = (0, s.createContext)(null);
    e.s(["default", 0, e => {
        let {
            children: t
        } = e, [r, d] = (0, s.useState)(l), [c, u] = (0, s.useState)(!1), m = (0, s.useCallback)(async e => {
            try {
                let t = await i.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...n.map(e => {
                        var a, s;
                        return {
                            [e]: null != (a = null == t || null == (s = t.data) ? void 0 : s[e]) && a
                        }
                    }));
                d(a)
            } catch (e) {}
        }, []);
        (0, s.useEffect)(() => {
            let e = !0,
                t = {
                    flags: [...n]
                };
            return u(!0), (async () => {
                await m(t), e && u(!1)
            })(), () => {
                e = !1
            }
        }, [m]);
        let f = (0, s.useMemo)(() => ({
            frontendFlags: r,
            getFrontendFlags: m,
            loadingFrontendFlags: c
        }), [r, m, c]);
        return (0, a.jsx)(o.Provider, {
            value: f,
            children: t
        })
    }, "useToolboxServiceApiProvider", 0, function() {
        let e = (0, s.useContext)(o);
        if (null === e) throw Error("useToolboxServiceApiProvider must be used within a ToolboxServiceApiProvider");
        return e
    }], 845592)
}, 666554, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 318974, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 210436, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 872378, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 909935, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 587608, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 648550, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 879556, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 156676, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 732097, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 149209, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 152382, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 323377, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 212940, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 581403, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 527781, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 977079, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 402440, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 620094, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 721267, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 788618, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 11730, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 334912, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 315072, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 319700, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 397367, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 339295, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 26168, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 761562, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 174990, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 226572, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 41024, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 318682, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 902904, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 973248, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 699904, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 861406, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 659373, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 871908, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 712369, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 761170, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 69008, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 610419, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 6938, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 931008, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 132917, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 999544, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 370502, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 779375, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 179677, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 761534, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 935295, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 930283, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 892316, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 667509, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 285253, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 987596, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 969915, e => {
    e.q("https://assets.create.roblox.com/6820ecf8901d6ac1cff9d78bdf0431f8706f04bd/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 875224, e => {
    "use strict";
    var t = e.i(592822),
        a = e.i(197649),
        s = e.i(416340),
        i = e.i(994530),
        r = e.i(446955),
        n = e.i(300765);
    let l = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        o = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        d = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        c = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        u = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        m = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        f = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        p = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        g = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        h = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        v = e => {
            let {
                iconName: t,
                node: i,
                size: n
            } = e;
            return null != t ? s.default.createElement(r.Icon, {
                name: t,
                size: l[n]
            }) : null != i ? s.default.createElement("span", {
                className: (0, a.default)("inline-flex items-center justify-center shrink-0", h[n])
            }, i) : null
        },
        b = (0, s.forwardRef)((e, r) => {
            var {
                className: l,
                style: h,
                text: b,
                isDisabled: y = !1,
                size: x = "Medium",
                variant: A = "Standard",
                leadingIconName: T,
                leadingIconNode: S,
                trailingIconName: w,
                trailingIconNode: C
            } = e, E = (0, t._)(e, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]);
            let I = null != T || null != S,
                k = null != w || null != C,
                N = (0, a.default)(y ? n.disabledOpacity : [i.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", I ? c[x] : d[x], k ? m[x] : u[x], o[x], l),
                _ = s.default.createElement(s.default.Fragment, null, s.default.createElement(i.StateLayer, null), s.default.createElement(v, {
                    iconName: T,
                    node: S,
                    size: x
                }), s.default.createElement("span", {
                    className: (0, a.default)("padding-y-xsmall text-no-wrap text-truncate-end", I && f[x], k && p[x])
                }, b), s.default.createElement(v, {
                    iconName: w,
                    node: C,
                    size: x
                })),
                P = Object.assign({
                    textDecoration: "none"
                }, h);
            if ("a" === E.as) {
                let {
                    as: e,
                    href: i
                } = E, n = (0, t._)(E, ["as", "href"]);
                return s.default.createElement("a", Object.assign({
                    ref: r
                }, n, {
                    "aria-disabled": y,
                    href: y ? void 0 : i,
                    className: (0, a.default)(N, g[A], "content-action-utility"),
                    style: P
                }), _)
            }
            let {
                as: M,
                isChecked: D,
                onCheckedChange: L
            } = E, F = (0, t._)(E, ["as", "isChecked", "onCheckedChange"]);
            return s.default.createElement("button", Object.assign({
                ref: r,
                type: "button"
            }, F, {
                className: (0, a.default)(D ? "bg-inverse-surface-0" : g[A], D ? "content-inverse-emphasis" : "content-action-utility", N),
                style: P,
                "aria-pressed": D,
                disabled: y,
                onClick: null == L ? void 0 : () => L(!D)
            }), _)
        });
    e.s(["Chip", 0, b])
}, 818733, e => {
    "use strict";
    var t = e.i(592822),
        a = e.i(197649),
        s = e.i(416340),
        i = e.i(446955),
        r = e.i(237164),
        n = e.i(895004);
    e.i(221628), e.i(895048);
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
        c = {
            Info: "var(--inverse-system-emphasis)",
            Warning: "var(--inverse-system-warning)",
            Success: "var(--inverse-system-success)",
            Error: "var(--inverse-system-alert)"
        },
        u = {
            Info: "bg-action-standard",
            Warning: "bg-inverse-action-standard",
            Success: "bg-inverse-action-standard",
            Error: "bg-action-standard"
        },
        m = (0, s.forwardRef)((e, m) => {
            var {
                title: f,
                description: p,
                linkLabel: g,
                linkHref: h,
                onLinkClick: v,
                showIcon: b = !0,
                infoIconOverride: y,
                layout: x = "Inline",
                variant: A = "Standard",
                severity: T = "Info",
                primaryActionLabel: S,
                onPrimaryAction: w,
                secondaryActionLabel: C,
                onSecondaryAction: E,
                actions: I,
                onDismiss: k,
                dismissIconAriaLabel: N = "Dismiss banner",
                className: _,
                style: P
            } = e, M = (0, t._)(e, ["title", "description", "linkLabel", "linkHref", "onLinkClick", "showIcon", "infoIconOverride", "layout", "variant", "severity", "primaryActionLabel", "onPrimaryAction", "secondaryActionLabel", "onSecondaryAction", "actions", "onDismiss", "dismissIconAriaLabel", "className", "style"]);
            let D = l[T],
                L = "Emphasis" === A ? u[T] : "",
                F = "Info" === T && y ? y : d[T],
                j = "Stacked" === x,
                R = !!I || !!(S && w) || !!(C && E),
                U = g && s.default.createElement("span", {
                    className: (0, a.default)("text-body-medium underline content-default block text-no-wrap")
                }, g),
                O = U && s.default.createElement(s.default.Fragment, null, s.default.createElement("span", null, " · "), s.default.createElement("a", {
                    className: "shrink-0",
                    href: h,
                    onClick: v
                }, U)),
                B = null != I ? I : S && w || C && E ? s.default.createElement("div", {
                    className: "flex items-center gap-small"
                }, S && w && s.default.createElement(r.Button, {
                    size: "Small",
                    variant: "Standard",
                    onClick: w,
                    className: (0, a.default)("content-emphasis label-small", L)
                }, S), C && E && s.default.createElement(r.Button, {
                    size: "Small",
                    variant: "Utility",
                    onClick: E,
                    className: (0, a.default)("content-emphasis label-small")
                }, C)) : null,
                q = k && s.default.createElement(n.CloseAffordance, {
                    variant: "Utility",
                    size: "Small",
                    isCircular: !0,
                    className: "content-emphasis",
                    "aria-label": N,
                    onClick: k
                });
            return s.default.createElement("div", Object.assign({
                ref: m,
                role: "Warning" === T || "Error" === T ? "alert" : "status",
                className: (0, a.default)("foundation-web-feedback-banner flex flex-col gap-small radius-medium padding-large stroke-standard", "Standard" === A ? "bg-shift-100" : void 0, "Standard" === A ? "stroke-default" : o[T], _),
                style: Object.assign({
                    backgroundColor: "Emphasis" === A ? D : void 0
                }, P)
            }, M), s.default.createElement("div", {
                className: (0, a.default)("flex width-full gap-medium", j ? "items-start" : "items-center flex-wrap")
            }, s.default.createElement("div", {
                className: (0, a.default)("flex grow-1 min-width-0", j ? "flex-col gap-medium basis-0" : "items-center gap-xsmall")
            }, s.default.createElement("div", {
                className: (0, a.default)("flex min-width-0", j ? "gap-medium flex-col grow-1 basis-0" : "gap-xsmall items-center")
            }, s.default.createElement("div", {
                className: (0, a.default)("flex items-center gap-xsmall min-width-0")
            }, s.default.createElement("div", {
                className: (0, a.default)("flex items-center gap-medium min-width-0")
            }, b && F && s.default.createElement(i.Icon, {
                name: F,
                size: "Large",
                className: "shrink-0",
                style: {
                    color: c[T]
                }
            }), s.default.createElement("span", {
                className: (0, a.default)("text-label-medium content-emphasis", j ? "" : "block padding-y-xsmall text-truncate-end text-no-wrap min-width-0 grow-1 basis-0")
            }, f)), j && O), p && (j ? s.default.createElement("div", {
                className: (0, a.default)("text-body-medium text-truncate-split content-default width-full")
            }, p) : s.default.createElement(s.default.Fragment, null, s.default.createElement("span", {
                className: "text-body-medium text-truncate-end content-default block text-no-wrap min-width-0 fill"
            }, p), s.default.createElement("span", {
                className: "flex items-center gap-xsmall"
            }, O))), !j && !p && O && s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, O)), j && R && B), !j && (R || k) && s.default.createElement("div", {
                className: "flex items-center justify-end gap-small shrink-0"
            }, R && B, q), j && q && s.default.createElement("div", {
                className: "shrink-0"
            }, q)))
        });
    e.s(["FeedbackBanner", 0, m])
}, 984722, e => {
    "use strict";
    var t = e.i(592822),
        a = e.i(197649),
        s = e.i(416340),
        i = e.i(439889);
    e.i(221628);
    let r = new Set(["_self", "_parent", "_top"]),
        n = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        l = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        o = (0, s.forwardRef)((e, o) => {
            var d, c, u, {
                    children: m,
                    className: f,
                    size: p,
                    color: g = "Emphasis",
                    variant: h = "Standalone",
                    underline: v = "hover",
                    isExternal: b,
                    asChild: y
                } = e,
                x = (0, t._)(e, ["children", "className", "size", "color", "variant", "underline", "isExternal", "asChild"]);
            let A = (d = null != (u = x.as) ? u : "a", c = "button" === x.as ? void 0 : x.target, void 0 !== b ? b : "button" !== d && void 0 !== c && !r.has(c)),
                T = (0, a.default)("foundation-web-link", "button" === x.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === h || A) && "inline-flex items-center gap-xsmall", void 0 !== p && n[p], l[g], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", f),
                S = A ? s.default.createElement("span", {
                    "aria-hidden": !0,
                    "data-testid": "foundation-web-icon",
                    className: (0, a.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
                }) : null;
            if (y) {
                let e = (0, t._)(x, ["as"]),
                    a = s.default.Children.only(m);
                return s.default.isValidElement(a) ? s.default.createElement(i.S, Object.assign({
                    ref: o
                }, e, {
                    className: T
                }), s.default.cloneElement(a, {}, s.default.createElement(s.default.Fragment, null, a.props.children, S))) : null
            }
            if ("button" === x.as) {
                let {
                    as: e,
                    type: a
                } = x, i = (0, t._)(x, ["as", "type"]);
                return s.default.createElement("button", Object.assign({
                    ref: o,
                    type: null != a ? a : "button"
                }, i, {
                    className: T
                }), m, S)
            }
            let w = (0, t._)(x, ["as"]);
            return s.default.createElement("a", Object.assign({
                ref: o
            }, w, {
                className: T
            }), m, S)
        });
    o.displayName = "Link", e.s(["Link", 0, o])
}, 816388, e => {
    "use strict";
    var t = e.i(592822),
        a = e.i(197649),
        s = e.i(416340);
    (0, e.i(791345).s)(".foundation-web-media-image{height:100%;-o-object-fit:cover;object-fit:cover;-o-object-position:center;object-position:center;width:100%}");
    let i = {
            "1:1": "aspect-1-1",
            "5:4": "aspect-5-4",
            "4:5": "aspect-4-5",
            "4:3": "aspect-4-3",
            "16:9": "aspect-16-9",
            "2:1": "aspect-2-1"
        },
        r = (0, s.forwardRef)((e, r) => {
            var {
                className: n,
                aspectRatio: l = "1:1",
                alt: o,
                containerClassName: d
            } = e, c = (0, t._)(e, ["className", "aspectRatio", "alt", "containerClassName"]);
            return s.default.createElement("div", {
                className: (0, a.default)("foundation-web-media clip", i[l], d)
            }, s.default.createElement("img", Object.assign({
                ref: r,
                className: (0, a.default)("foundation-web-media-image", n),
                alt: o
            }, c)))
        });
    r.displayName = "Media", e.s(["Media", 0, r])
}, 744806, e => {
    "use strict";
    var t = e.i(592822),
        a = e.i(197649),
        s = e.i(620088),
        i = e.i(978352),
        r = e.i(416340),
        n = e.i(636282);
    e.i(668314);
    var l = e.i(175793),
        o = e.i(349377),
        d = e.i(791345);
    e.i(221628), e.i(149285), (0, d.s)("@keyframes fui-base-sheet-overlay-fade-in{0%{background-color:transparent}to{background-color:var(--color-common-backdrop)}}@keyframes fui-base-sheet-overlay-fade-out{0%{background-color:var(--color-common-backdrop)}to{background-color:transparent}}@keyframes fui-base-sheet-slide-in-from-right{0%{transform:translateX(110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-right{0%{transform:translateX(0)}to{transform:translateX(110%)}}@keyframes fui-base-sheet-slide-in-from-left{0%{transform:translateX(-110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-left{0%{transform:translateX(0)}to{transform:translateX(-110%)}}@keyframes fui-base-sheet-fade-in{0%{opacity:0}to{opacity:1}}@keyframes fui-base-sheet-fade-out{0%{opacity:1}to{opacity:0}}@keyframes fui-base-sheet-slide-in-from-bottom{0%{transform:translateY(110%)}to{transform:translateY(0)}}@keyframes fui-base-sheet-slide-out-to-bottom{0%{transform:translateY(0)}to{transform:translateY(110%)}}.fui-base-sheet-overlay{background-color:var(--color-common-backdrop)}.fui-base-sheet-overlay[data-state=open]{animation:fui-base-sheet-overlay-fade-in var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-state=closed]{animation:fui-base-sheet-overlay-fade-out var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-type=bottomSheet]{align-items:flex-end;justify-content:center}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:env(safe-area-inset-left);margin-right:env(safe-area-inset-right);max-height:90vh;max-width:440px;padding-bottom:env(safe-area-inset-bottom);width:100%}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=open]{animation-duration:var(--time-300);animation-timing-function:var(--ease-standard-out)}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=closed]{animation-duration:var(--time-100);animation-timing-function:var(--ease-standard-in)}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-bottom}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-bottom}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right]{align-items:stretch;justify-content:flex-end}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left]{align-items:stretch;justify-content:flex-start}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true] .fui-base-sheet-content{max-height:100vh;padding-bottom:env(safe-area-inset-bottom);padding-top:env(safe-area-inset-top);width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=right] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-right:env(safe-area-inset-right)}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=left] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-left:env(safe-area-inset-left)}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-left}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-left}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false] .fui-base-sheet-content{border-radius:var(--radius-large);margin:var(--padding-medium);margin-bottom:max(env(safe-area-inset-bottom),var(--padding-medium));margin-top:max(env(safe-area-inset-top),var(--padding-medium));max-height:100vh;max-width:360px;width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=right] .fui-base-sheet-content{margin-right:max(env(safe-area-inset-right),var(--padding-medium))}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=left] .fui-base-sheet-content{margin-left:max(env(safe-area-inset-left),var(--padding-medium))}.fui-base-sheet-overlay[data-type=centerSheet]{align-items:center;justify-content:center;padding:var(--padding-medium)}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content{border-radius:var(--radius-large);max-height:90vh}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Medium] .fui-base-sheet-content{max-width:480px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Large] .fui-base-sheet-content{max-width:640px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-fade-in}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-fade-out}");
    let c = e => {
            let {
                type: t,
                sideSheetSide: i = "right",
                isSideSheetFlush: n = !1,
                centerSheetSize: l = "Medium",
                children: o,
                overlayClassName: d,
                contentClassName: c,
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: f,
                onEscapeKeyDown: p,
                onInteractOutside: g
            } = e;
            return r.default.createElement(s.P, null, r.default.createElement(s.O, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? i : void 0,
                "data-flush": "sideSheet" === t ? n : void 0,
                "data-size": "centerSheet" === t ? l : void 0,
                className: (0, a.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", d)
            }, r.default.createElement(s.b, {
                "data-testid": "fui-base-sheet-content",
                className: (0, a.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", c),
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: f,
                onEscapeKeyDown: p,
                onInteractOutside: g
            }, o)))
        },
        u = e => {
            var t;
            let a = e.currentTarget;
            if (!a) return;
            let s = a.querySelectorAll("[data-autofocus-priority]");
            if (0 === s.length) return;
            let i = [];
            s.forEach(e => {
                let t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                !Number.isNaN(t) && e instanceof HTMLElement && i.push({
                    element: e,
                    priority: t
                })
            }), i.sort((e, t) => e.priority - t.priority);
            let r = i.find(e => {
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
        g = (0, r.forwardRef)((e, s) => {
            var {
                children: i,
                className: n,
                hasPaddingX: l = !0
            } = e, o = (0, t._)(e, ["children", "className", "hasPaddingX"]);
            let {
                type: d
            } = f();
            return r.default.createElement("div", Object.assign({
                ref: s,
                className: (0, a.default)("scroll-y", l && p, "sideSheet" === d ? "grow-1" : "", n)
            }, o), i)
        });
    g.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        var {
            children: s,
            className: i
        } = e, n = (0, t._)(e, ["children", "className"]);
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(o.Divider, null), r.default.createElement("div", Object.assign({
            className: (0, a.default)(p, "margin-y-small shrink-0", i)
        }, n), s))
    }, "SheetBody", 0, g, "SheetContent", 0, e => {
        let t, {
                children: s,
                centerSheetSize: i = "Medium",
                largeScreenVariant: l = "center",
                closeLabel: o,
                className: d,
                mobilePortraitClassName: f,
                mobileLandscapeClassName: p,
                largeScreenClassName: g,
                onOpenAutoFocus: h,
                onCloseAutoFocus: v,
                onPointerDownOutside: b,
                onEscapeKeyDown: y,
                onInteractOutside: x
            } = e,
            A = (0, n.u)("(orientation: portrait) and (max-width: 600px)"),
            T = (0, n.u)("(orientation: landscape) and (max-height: 600px)");
        t = A ? "bottomSheet" : T || "side" === l ? "sideSheet" : "centerSheet";
        let S = (0, r.useMemo)(() => ({
                centerSheetSize: i,
                largeScreenVariant: l,
                closeLabel: o,
                isPortraitMobile: A,
                isLandscapeMobile: T,
                type: t
            }), [i, l, o, A, T, t]),
            w = (0, a.default)(d, A && f, T && p, !A && !T && g);
        return r.default.createElement(m.Provider, {
            value: S
        }, r.default.createElement(c, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: T,
            centerSheetSize: i,
            contentClassName: w,
            onOpenAutoFocus: null != h ? h : u,
            onCloseAutoFocus: v,
            onPointerDownOutside: b,
            onEscapeKeyDown: y,
            onInteractOutside: x
        }, s))
    }, "SheetDescription", 0, e => r.default.createElement(s.D, Object.assign({
        asChild: !0
    }, e)), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: i,
            children: n
        } = e;
        return r.default.createElement(s.R, {
            open: t,
            onOpenChange: a,
            defaultOpen: i,
            modal: !0
        }, n)
    }, "SheetTitle", 0, e => {
        let {
            className: t,
            children: n,
            navigation: o,
            utilities: d,
            visuallyHideTitleText: c
        } = e, {
            closeLabel: u
        } = f(), m = r.default.createElement(s.T, {
            className: "text-heading-small margin-none"
        }, n);
        return r.default.createElement("div", {
            className: (0, a.default)(t, o ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, r.default.createElement("div", {
            className: (0, a.default)("flex items-center", o && "gap-xsmall")
        }, o, c ? r.default.createElement(i.V, null, m) : m), r.default.createElement("div", {
            className: (0, a.default)("flex items-center", d && "gap-xxsmall")
        }, d, r.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, r.default.createElement(s.C, {
            asChild: !0
        }, r.default.createElement(l.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: u || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "SheetTrigger", 0, e => r.default.createElement(s.a, Object.assign({
        asChild: !0
    }, e))], 744806)
}, 812787, e => {
    "use strict";
    var t = e.i(592822),
        a = e.i(197649),
        s = e.i(416340),
        i = e.i(446955),
        r = e.i(175793),
        n = e.i(791345);
    e.i(221628), (0, n.s)(".foundation-web-table{border-collapse:collapse;border-spacing:0}.foundation-web-table-row-divider{border-bottom:1px solid var(--color-stroke-muted)}.foundation-web-table-body>tr:last-child>.foundation-web-table-row-divider{border-bottom:none}.foundation-web-table-header-cell-divider{border-bottom:1px solid var(--color-stroke-default)}.foundation-web-table-row:focus-visible{outline:var(--stroke-thick) solid var(--color-stroke-emphasis);outline-offset:calc(var(--stroke-thick)*-1)}.foundation-web-table-pagination-select{-webkit-appearance:none;-moz-appearance:none;appearance:none;border:none;font:inherit;outline:none}.foundation-web-table-pagination-select:focus-visible{outline:var(--stroke-thick) solid var(--color-stroke-emphasis);outline-offset:calc(var(--stroke-thick)*-1)}");
    let l = (0, s.createContext)(null),
        o = e => {
            let t = (0, s.useContext)(l);
            if (!t) throw Error("".concat(e, " must be used within a <Table>"));
            return t
        },
        d = {
            XSmall: "height-800",
            Small: "height-1200",
            Medium: "height-1500"
        },
        c = {
            XSmall: "padding-x-medium",
            Small: "padding-x-large",
            Medium: "padding-x-xlarge"
        },
        u = {
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
        g = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        h = (0, s.forwardRef)((e, i) => {
            var {
                children: r,
                size: n = "Medium",
                variant: o = "Divided",
                className: d
            } = e, c = (0, t._)(e, ["children", "size", "variant", "className"]);
            let u = (0, s.useMemo)(() => ({
                    size: n,
                    variant: o
                }), [n, o]),
                m = "Framed" === o;
            return s.default.createElement(l.Provider, {
                value: u
            }, s.default.createElement("div", {
                className: (0, a.default)("width-full bg-surface-100", m && "radius-medium clip stroke-standard stroke-default")
            }, s.default.createElement("table", Object.assign({
                ref: i,
                className: (0, a.default)("foundation-web-table width-full content-default", d)
            }, c), r)))
        });
    h.displayName = "Table";
    let v = (0, s.forwardRef)((e, i) => {
        var {
            children: r,
            className: n
        } = e, l = (0, t._)(e, ["children", "className"]);
        return o("TableHeader"), s.default.createElement("thead", Object.assign({
            ref: i,
            className: (0, a.default)("foundation-web-table-header", n)
        }, l), r)
    });
    v.displayName = "TableHeader";
    let b = (0, s.forwardRef)((e, i) => {
        var {
            children: r,
            className: n
        } = e, l = (0, t._)(e, ["children", "className"]);
        return o("TableBody"), s.default.createElement("tbody", Object.assign({
            ref: i,
            className: (0, a.default)("foundation-web-table-body", n)
        }, l), r)
    });
    b.displayName = "TableBody";
    let y = (0, s.forwardRef)((e, i) => {
        var {
            children: r,
            className: n,
            isInteractive: l = !1,
            isHoverable: d = !1,
            isSelected: c = !1,
            isDisabled: u = !1,
            onClick: m,
            onKeyDown: f,
            tabIndex: p,
            role: g
        } = e, h = (0, t._)(e, ["children", "className", "isInteractive", "isHoverable", "isSelected", "isDisabled", "onClick", "onKeyDown", "tabIndex", "role"]);
        o("TableRow");
        let v = l ? {
            role: null != g ? g : "row",
            tabIndex: null != p ? p : 0,
            onClick: u ? void 0 : m,
            onKeyDown: e => {
                u || (null == f || f(e), e.defaultPrevented || "Enter" !== e.key && " " !== e.key || (e.preventDefault(), null == m || m(e)))
            }
        } : {
            role: g,
            tabIndex: p,
            onClick: m,
            onKeyDown: f
        };
        return s.default.createElement("tr", Object.assign({
            ref: i,
            "aria-selected": l ? c : void 0,
            "aria-disabled": !(!l || !u) || void 0,
            "data-selected": c || void 0,
            className: (0, a.default)("foundation-web-table-row", (l || d) && "hover:bg-shift-100", l && !u && "cursor-pointer", l && u && "opacity-disabled pointer-events-none", c && "bg-shift-200", n)
        }, v, h), r)
    });
    y.displayName = "TableRow";
    let x = (0, s.forwardRef)((e, r) => {
        var {
            children: n,
            className: l,
            sortDirection: d,
            onSort: f,
            align: h = "start",
            sortLabel: v,
            scope: b
        } = e, y = (0, t._)(e, ["children", "className", "sortDirection", "onSort", "align", "sortLabel", "scope"]);
        let {
            size: x
        } = o("TableHeaderCell"), A = !!f, T = null != d ? d : "none", S = A && "none" !== T && s.default.createElement(i.Icon, {
            name: "ascending" === T ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), w = s.default.createElement("div", {
            className: (0, a.default)("flex items-center gap-xsmall", m[x], "content-muted", g[h])
        }, "end" === h && S, s.default.createElement("span", {
            className: "text-truncate-end"
        }, n), "end" !== h && S), C = "string" == typeof n ? "Sort by ".concat(n) : void 0;
        return s.default.createElement("th", Object.assign({
            ref: r,
            scope: null != b ? b : "col",
            "aria-sort": A ? T : void 0,
            className: (0, a.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", u[x], c[x], p[h], "content-muted", l)
        }, y), A ? s.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: f,
            "aria-label": null != v ? v : C
        }, w) : w)
    });
    x.displayName = "TableHeaderCell";
    let A = (0, s.forwardRef)((e, i) => {
        var {
            children: r,
            className: n,
            align: l = "start"
        } = e, u = (0, t._)(e, ["children", "className", "align"]);
        let {
            size: m
        } = o("TableCell");
        return s.default.createElement("td", Object.assign({
            ref: i,
            className: (0, a.default)("foundation-web-table-cell foundation-web-table-row-divider", d[m], c[m], f[m], p[l], "content-default", n)
        }, u), r)
    });
    A.displayName = "TableCell";
    let T = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        S = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        w = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        C = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        E = {
            XSmall: "gap-xsmall",
            Small: "gap-xsmall",
            Medium: "gap-small"
        },
        I = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "Small"
        },
        k = (0, s.forwardRef)((e, i) => {
            var {
                size: n = "Medium",
                page: l,
                rowsPerPage: o,
                totalRows: d,
                rowsPerPageOptions: c = [10, 25, 50],
                onPageChange: u,
                onRowsPerPageChange: m,
                rowsPerPageLabel: f = "Rows per page",
                firstPageLabel: p = "First page",
                previousPageLabel: g = "Previous page",
                nextPageLabel: h = "Next page",
                lastPageLabel: v = "Last page",
                rangeLabel: b,
                className: y
            } = e, x = (0, t._)(e, ["size", "page", "rowsPerPage", "totalRows", "rowsPerPageOptions", "onPageChange", "onRowsPerPageChange", "rowsPerPageLabel", "firstPageLabel", "previousPageLabel", "nextPageLabel", "lastPageLabel", "rangeLabel", "className"]);
            let A = Math.max(1, Math.ceil(d / o)),
                k = 0 === l,
                N = l >= A - 1,
                _ = 0 === d ? 0 : l * o + 1,
                P = Math.min((l + 1) * o, d),
                M = (0, s.useCallback)(e => {
                    let t = Number(e.target.value);
                    null == m || m(t), u(0)
                }, [m, u]),
                D = I[n];
            return s.default.createElement("div", Object.assign({
                ref: i,
                className: (0, a.default)("flex items-center justify-end", T[n], S[n], y)
            }, x), s.default.createElement("div", {
                className: "flex items-center gap-large"
            }, s.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, m && s.default.createElement("div", {
                className: "flex items-center gap-small"
            }, s.default.createElement("span", {
                className: (0, a.default)(w[n], "content-default")
            }, f), s.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, s.default.createElement("select", {
                className: (0, a.default)("foundation-web-table-pagination-select", w[n], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === n ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: o,
                onChange: M,
                "aria-label": f
            }, c.map(e => s.default.createElement("option", {
                key: e,
                value: e
            }, e))))), s.default.createElement("span", {
                className: (0, a.default)(C[n], "content-default")
            }, b ? b(_, P, d) : "".concat(_, "-").concat(P, " of ").concat(d))), s.default.createElement("div", {
                className: (0, a.default)("flex items-center", E[n])
            }, s.default.createElement(r.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: p,
                size: D,
                variant: "Utility",
                isDisabled: k,
                onClick: () => u(0)
            }), s.default.createElement(r.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: g,
                size: D,
                variant: "Utility",
                isDisabled: k,
                onClick: () => u(l - 1)
            }), s.default.createElement(r.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: h,
                size: D,
                variant: "Utility",
                isDisabled: N,
                onClick: () => u(l + 1)
            }), s.default.createElement(r.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: v,
                size: D,
                variant: "Utility",
                isDisabled: N,
                onClick: () => u(A - 1)
            }))))
        });
    k.displayName = "TablePagination", e.s(["Table", 0, h, "TableBody", 0, b, "TableCell", 0, A, "TableHeader", 0, v, "TableHeaderCell", 0, x, "TablePagination", 0, k, "TableRow", 0, y])
}, 406769, e => {
    "use strict";
    var t = e.i(592822),
        a = e.i(197649),
        s = e.i(416340),
        i = e.i(912056),
        r = e.i(300765);
    e.i(668314);
    var n = e.i(766335);
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
        c = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        u = s.default.forwardRef((e, u) => {
            var {
                size: m,
                variant: f = "Standard",
                label: p,
                value: g,
                defaultValue: h,
                isDisabled: v,
                hasError: b,
                helperText: y,
                className: x,
                style: A,
                textareaClassName: T,
                textareaStyle: S,
                id: w
            } = e, C = (0, t._)(e, ["size", "variant", "label", "value", "defaultValue", "isDisabled", "hasError", "helperText", "className", "style", "textareaClassName", "textareaStyle", "id"]);
            let E = (0, i.default)(),
                I = w || E,
                k = "".concat(I, "-description"),
                N = null != m ? m : "Large";
            return s.default.createElement("div", {
                className: (0, a.default)("flex fill flex-col width-full gap-small", {
                    [r.disabledOpacity]: v
                }, x),
                style: A
            }, p && s.default.createElement("label", {
                htmlFor: I,
                className: (0, a.default)(d[N], "content-emphasis")
            }, p), s.default.createElement("textarea", Object.assign({
                ref: u,
                id: I,
                "data-testid": "text-area-container",
                style: S,
                className: (0, a.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", n.INPUT_BACKGROUND_BY_VARIANT[f], n.INPUT_STROKE_BY_VARIANT[f], b ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", c[N], l[N], o[N], T),
                value: g,
                defaultValue: null == g ? h : void 0,
                disabled: v,
                "aria-describedby": y ? k : void 0
            }, C)), y && s.default.createElement("span", {
                id: k,
                className: (0, a.default)("text-caption-small", {
                    "content-system-alert": b,
                    "content-default": !b
                })
            }, y))
        });
    u.displayName = "TextArea", e.s(["TextArea", 0, u])
}, 514455, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        s = e.i(614515),
        i = e.i(993807),
        r = e.i(962560),
        n = e.i(273589),
        l = e.i(42569),
        o = e.i(696180),
        d = e.i(221628),
        c = e.i(972455),
        u = e.i(963320);

    function m(e) {
        return (0, n.g)("MuiAlertTitle", e)
    }(0, o.g)("MuiAlertTitle", ["root"]);
    let f = ["className"],
        p = (0, l.s)(c.T, {
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
                i = (0, n._)(a, f),
                o = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, l.a)({
                        root: ["root"]
                    }, m, t)
                })(a);
            return (0, d.jsx)(p, (0, r._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, l.c)(o.root, s)
            }, i))
        });
    var h = (0, s.default)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        v = (0, a.forwardRef)(function(e, s) {
            var r = e.classes,
                n = e.className,
                l = (0, t.a)(e, ["classes", "className"]),
                o = h(void 0, {
                    props: {
                        classes: (0, i.default)(r, n)
                    }
                });
            return a.default.createElement(g, (0, t._)({}, l, {
                classes: o.classes,
                ref: s
            }))
        });
    e.s(["AlertTitle", 0, v], 514455)
}, 27281, e => {
    "use strict";
    var t = e.i(437272);
    e.s(["NavigateNextIcon", () => t.N])
}, 854705, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        s = e.i(614515),
        i = e.i(993807),
        r = e.i(696180),
        n = e.i(273589),
        l = e.i(962560),
        o = e.i(42569),
        d = e.i(576881),
        c = e.i(751498),
        u = e.i(221628),
        m = e.i(219224),
        f = e.i(963320),
        p = e.i(275966);
    e.i(197094);
    var g = (0, c.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        h = (0, c.c)((0, u.jsx)("path", {
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
        y = (0, o.s)(h, {
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

    function x(e) {
        let {
            checked: t = !1,
            classes: a = {},
            fontSize: s
        } = e, i = (0, l._)({}, e, {
            checked: t
        });
        return (0, u.jsxs)(v, {
            className: a.root,
            ownerState: i,
            children: [(0, u.jsx)(b, {
                fontSize: s,
                className: a.background,
                ownerState: i
            }), (0, u.jsx)(y, {
                fontSize: s,
                className: a.dot,
                ownerState: i
            })]
        })
    }

    function A(e) {
        return (0, n.g)("MuiRadio", e)
    }
    var T = (0, r.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let S = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        w = (0, o.s)(d.S, {
            shouldForwardProp: e => (0, o.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, n.a)(a.size))], t["color".concat((0, n.a)(a.color))]]
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
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, n.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== a.color && {
                ["&.".concat(T.checked)]: {
                    color: (t.vars || t).palette[a.color].main
                }
            }, {
                ["&.".concat(T.disabled)]: {
                    color: (t.vars || t).palette.action.disabled
                }
            })
        }),
        C = (0, u.jsx)(x, {
            checked: !0
        }),
        E = (0, u.jsx)(x, {}),
        I = a.forwardRef(function(e, t) {
            var s, i, r, d;
            let c = (0, f.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: g,
                    checkedIcon: h = C,
                    color: v = "primary",
                    icon: b = E,
                    name: y,
                    onChange: x,
                    size: T = "medium",
                    className: I
                } = c,
                k = (0, n._)(c, S),
                N = (0, l._)({}, c, {
                    color: v,
                    size: T
                }),
                _ = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: s
                    } = e, i = {
                        root: ["root", "color".concat((0, n.a)(a)), "medium" !== s && "size".concat((0, n.a)(s))]
                    };
                    return (0, l._)({}, t, (0, o.a)(i, A, t))
                })(N),
                P = a.useContext(m.R),
                M = g,
                D = (0, p.c)(x, P && P.onChange),
                L = y;
            return P && (void 0 === M && (r = P.value, M = "object" == typeof(d = c.value) && null !== d ? r === d : String(r) === String(d)), void 0 === L && (L = P.name)), (0, u.jsx)(w, (0, l._)({
                type: "radio",
                icon: a.cloneElement(b, {
                    fontSize: null != (s = E.props.fontSize) ? s : T
                }),
                checkedIcon: a.cloneElement(h, {
                    fontSize: null != (i = C.props.fontSize) ? i : T
                }),
                ownerState: N,
                classes: _,
                name: L,
                checked: M,
                onChange: D,
                ref: t,
                className: (0, o.c)(_.root, I)
            }, k))
        });
    var k = (0, s.default)({
            name: "Radio"
        })(function(e) {
            var t, a;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((t = {
                    color: e.palette.content.muted
                })["&.".concat(T.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, t),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((a = {
                    color: e.palette.states.disabled
                })["&.".concat(T.colorPrimary, ".").concat(T.checked)] = {
                    color: e.palette.states.disabled
                }, a)
            }
        }),
        N = (0, a.forwardRef)(function(e, s) {
            var r = e.classes,
                n = e.color,
                l = e.inputProps,
                o = e["aria-label"],
                d = e.className,
                c = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = k(void 0, {
                    props: {
                        classes: (0, i.default)(r, d)
                    }
                });
            return a.default.createElement(I, (0, t._)({}, c, {
                classes: u.classes,
                color: void 0 === n ? "primary" : n,
                ref: s,
                inputProps: (0, t._)({
                    "aria-label": o
                }, l)
            }))
        });
    e.s(["Radio", 0, N], 854705)
}, 219224, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 774807, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["ArrowDownwardIcon", () => t.ArrowDownward])
}, 558826, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["ArrowUpwardIcon", () => t.ArrowUpward])
}, 93235, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["NavigateBeforeIcon", () => t.NavigateBefore])
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
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: s
        } = t, i = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[i], a, s[i], s) : void 0
    }

    function s(e, t) {
        var a;
        let {
            pages: s,
            pageParams: i
        } = t;
        return s.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, s[0], s, i[0], i) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != s(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (i, r) => {
                var n, l, o, d, c;
                let u = i.options,
                    m = null == (o = i.fetchOptions) || null == (l = o.meta) || null == (n = l.fetchMore) ? void 0 : n.direction,
                    f = (null == (d = i.state.data) ? void 0 : d.pages) || [],
                    p = (null == (c = i.state.data) ? void 0 : c.pageParams) || [],
                    g = {
                        pages: [],
                        pageParams: []
                    },
                    h = 0,
                    v = async () => {
                        let r = !1,
                            n = (0, t.ensureQueryFn)(i.options, i.fetchOptions),
                            l = async (e, a, s) => {
                                let l;
                                if (r) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(l = {
                                        client: i.client,
                                        queryKey: i.queryKey,
                                        pageParam: a,
                                        direction: s ? "backward" : "forward",
                                        meta: i.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (i.signal.aborted ? r = !0 : i.signal.addEventListener("abort", () => {
                                            r = !0
                                        }), i.signal)
                                    }), l),
                                    d = await n(o),
                                    {
                                        maxPages: c
                                    } = i.options,
                                    u = s ? t.addToStart : t.addToEnd;
                                return {
                                    pages: u(e.pages, d, c),
                                    pageParams: u(e.pageParams, a, c)
                                }
                            };
                        if (m && f.length) {
                            let e = "backward" === m,
                                t = {
                                    pages: f,
                                    pageParams: p
                                },
                                i = (e ? s : a)(u, t);
                            g = await l(t, i, e)
                        } else {
                            let t = null != e ? e : f.length;
                            do {
                                var o;
                                let e = 0 === h ? null != (o = p[0]) ? o : u.initialPageParam : a(u, g);
                                if (h > 0 && null == e) break;
                                g = await l(g, e), h++
                            } while (h < t)
                        }
                        return g
                    };
                i.options.persister ? i.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = i.options).persister) ? void 0 : e.call(t, v, {
                        client: i.client,
                        queryKey: i.queryKey,
                        meta: i.options.meta,
                        signal: i.signal
                    }, r)
                } : i.fetchFn = v
            }
        }
    }])
}, 630986, e => {
    "use strict";
    var t = e.i(468612),
        a = e.i(117437),
        s = class extends t.QueryObserver {
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
                var s, i;
                let {
                    state: r
                } = e, n = super.createResult(e, t), {
                    isFetching: l,
                    isRefetching: o,
                    isError: d,
                    isRefetchError: c
                } = n, u = null == (i = r.fetchMeta) || null == (s = i.fetchMore) ? void 0 : s.direction, m = d && "forward" === u, f = l && "forward" === u, p = d && "backward" === u, g = l && "backward" === u;
                return {
                    ...n,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.hasNextPage)(t, r.data),
                    hasPreviousPage: (0, a.hasPreviousPage)(t, r.data),
                    isFetchNextPageError: m,
                    isFetchingNextPage: f,
                    isFetchPreviousPageError: p,
                    isFetchingPreviousPage: g,
                    isRefetchError: c && !m && !p,
                    isRefetching: o && !f && !g
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        i = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, i.useBaseQuery)(e, s, t)
    }], 630986)
}]);

//# debugId=1da0b96d-e235-3514-d20e-e3de4ed91866
//# sourceMappingURL=0kr9ur-cfscoj.js.map