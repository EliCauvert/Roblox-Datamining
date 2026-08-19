;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "26483741-da2a-5f27-eef3-eccddbebf6a2")
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
        s = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableUGCFolders",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        });
    e.s(["enableCreatorShowcases", 0, n, "enableTaxonomyBasedCreatorDashboard", 0, r, "enableUgcFolders", 0, s, "freeAvatarModuleDocsPageLink", 0, i, "freeAvatarModuleStorePageLink", 0, a, "isAutoPublishPreferencesEnabled", 0, l])
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
    e.s(["isAssetAccessRequestsEnabled", 0, i, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, n, "isModelCustomThumbnailUploadEnabled", 0, s, "isPricingEligibilityV2Enabled", 0, l])
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
        s = (0, t.defineFlag)({
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
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, n, "isMomentsSitetestUrlParsingEnabled", 0, s, "isMomentsUploadEnabled", 0, i, "isMomentsUploadLanguageSelectEnabled", 0, r])
}, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        i = e.i(540459),
        s = e.i(79187),
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
    let u = (0, s.withTranslation)(e => {
        let {
            children: s
        } = e, {
            user: l
        } = (0, r.useAuthentication)(), u = (0, o.useCurrentGroup)(), [m, f] = (0, a.useState)(void 0), [h, p] = (0, a.useState)(), [g, b] = (0, a.useState)(), [v, y] = (0, a.useState)(), [A, S] = (0, a.useState)(), x = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == u ? void 0 : u.id) ? e : 0) !== 0
        }, [u]), [E, T] = (0, a.useState)(void 0), _ = void 0 === m || void 0 === h || void 0 === g && x, w = (0, a.useCallback)(async () => {
            try {
                if (x && (null == u ? void 0 : u.id)) {
                    let e = await (0, d.getGroupCreatorMetadata)(u.id);
                    f(e);
                    return
                }
                if (!x && (null == l ? void 0 : l.id)) {
                    let e = await (0, d.getUserCreatorMetadata)();
                    f(e);
                    return
                }
            } catch (e) {
                return
            }
            f(null)
        }, [null == u ? void 0 : u.id, x, null == l ? void 0 : l.id]), I = (0, a.useCallback)(async () => {
            if (x && E || !x) try {
                let e = await (0, d.getRequirements)();
                p(e.requirements);
                return
            } catch (e) {
                return
            }
            p(null)
        }, [E, x]), k = (0, a.useCallback)(async () => {
            if (x && (null == u ? void 0 : u.id)) try {
                let e = await (0, d.getGroupEligibility)(u.id);
                b(e.isEligible)
            } catch (e) {
                b(!1)
            }
        }, [u, x]);
        (0, a.useEffect)(() => {
            _ ? S(void 0) : x && !E ? S(!1) : S(!1 === v)
        }, [x, E, v, _]), (0, a.useEffect)(() => {
            (async () => {
                if (x && (null == u ? void 0 : u.id)) {
                    var e;
                    return null == (e = (await n.default.getGroupInfo(u.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && T(e === l.id)
            })
        }, [null == u ? void 0 : u.id, x, l]), (0, a.useEffect)(() => {
            _ || !h || x && !E ? y(void 0) : y((null == h ? void 0 : h.length) === 0 || (null == h ? void 0 : h.length) === 1 && h[0] === i.Requirements.Payable)
        }, [E, x, _, h]), (0, a.useEffect)(() => {
            w()
        }, [w]), (0, a.useEffect)(() => {
            I()
        }, [I]), (0, a.useEffect)(() => {
            k()
        }, [k]);
        let C = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: _,
            requiresActionToJoinProgram: A,
            compliantWithAllUserRequirements: v,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != h ? h : void 0,
            isCurrentUserGroupOwner: E,
            isGroupEligible: null != g ? g : void 0
        }), [_, A, v, m, h, E, g]);
        return (0, t.jsx)(c.Provider, {
            value: C,
            children: s
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, u, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(c)
    }])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        i = e.i(416340),
        s = e.i(79187),
        r = e.i(423107),
        n = e.i(514455),
        l = e.i(982234),
        o = e.i(199834),
        d = e.i(872204),
        c = e.i(988012),
        u = e.i(447055),
        m = e.i(358763),
        f = e.i(889311),
        h = e.i(823062),
        p = e.i(881670),
        g = e.i(486736),
        b = e.i(906791);
    let v = (0, e.i(706442).makeStyles)()(e => ({
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
    var y = ((t = {}).Home = "home", t.Creations = "creations", t);
    let A = (0, s.withTranslation)(e => {
        let t, p, y, A, {
                trackingPage: S,
                alertRedesignVariant: x
            } = e,
            {
                settings: {
                    ageVerificationUpsellGetStartedUrl: E,
                    ageVerificationUpsellViewDetailsUrl: T,
                    establishTrustUpsellGetStartedUrl: _,
                    establishTrustUpsellViewDetailsUrl: w
                }
            } = (0, g.useSettings)(),
            {
                isBannerVisible: I,
                isHighPriority: k,
                variant: C,
                dismissBanner: P
            } = (0, b.useAgeVerificationUpsellContext)(),
            {
                classes: N
            } = v(),
            M = (0, i.useRef)(null),
            {
                unifiedLogger: D
            } = (0, h.useUnifiedLoggerProvider)(),
            {
                translate: L
            } = (0, s.useTranslation)(),
            O = (0, i.useCallback)(() => {
                I && D.logImpressionEvent({
                    eventName: f.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: S,
                        variant: C,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [D, S, C, x, I]);
        (0, m.default)(M, O);
        let F = (0, i.useCallback)(() => {
                D.logClickEvent({
                    eventName: f.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: S,
                        action: "viewDetails",
                        variant: C,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [D, S, C, x]),
            R = (0, i.useCallback)(() => {
                D.logClickEvent({
                    eventName: f.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: S,
                        action: "callToAction",
                        variant: C,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [D, S, C, x]),
            j = (0, i.useCallback)(() => {
                D.logClickEvent({
                    eventName: f.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: S,
                        action: "dismiss",
                        variant: C,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                }), P()
            }, [D, P, S, C, x]);
        return ("establishTrust" === C ? (t = "Title.EstablishTrustBanner", p = "Label.EstablishTrustBanner2", y = _, A = w) : (t = "Title.AgeVerificationBanner", p = "Label.AgeVerificationBanner", y = E, A = T), I) ? (0, a.jsx)("div", {
            ref: M,
            children: (0, a.jsxs)(r.Alert, {
                className: N.alertContainer,
                severity: "ageVerification" === C && k ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(d.Button, {
                    href: y,
                    onClick: R,
                    className: N.getStarted,
                    color: "inherit",
                    size: "small",
                    children: L("Label.AgeVerificationBannerGetStarted") || "Get started"
                }, "getStarted"), (0, a.jsx)(c.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: j,
                    children: (0, a.jsx)(u.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(n.AlertTitle, {
                    children: L(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: L(p)
                }), " ", (0, a.jsx)(l.Link, {
                    className: N.viewDetails,
                    href: A,
                    target: "_blank",
                    color: "inherit",
                    onClick: F,
                    children: L("Label.AgeVerificationBannerViewDetails") || "View details"
                })]
            })
        }) : null
    }, [p.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, A, "AgeVerificationUpsellPage", () => y], 714039)
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        i = e.i(458451),
        s = e.i(889311),
        r = e.i(823062),
        n = e.i(486736);
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
            let s = await a.json();
            if (!("access" in s)) throw Error('"access" not found in response');
            return s.access
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
        }, h = async () => {
            localStorage.setItem(u, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, p = (0, a.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), g = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, b = async () => await c() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: l
        } = e, {
            settings: {
                enableAgeVerificationUpsellBanner: o,
                ageVerificationUpsellBannerStartDate: d,
                ageVerificationUpsellBannerEndDate: c,
                ageVerificationUpsellBannerHighPriorityDate: u
            }
        } = (0, n.useSettings)(), [m, v] = (0, a.useState)(!0), [y, A] = (0, a.useState)("doNotShow"), {
            isFetched: S,
            user: x
        } = (0, i.useRobloxAuthentication)(), {
            unifiedLogger: E
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: T,
            isEnabled: _
        } = (0, a.useMemo)(() => {
            let e = g(d),
                t = g(c),
                a = g(u),
                i = new Date,
                s = o && e <= i && i < t;
            return {
                isHighPriority: a <= i,
                isEnabled: s
            }
        }, [o, c, d, u]), w = (0, a.useCallback)(async () => {
            await h(), v(!0)
        }, [v]);
        (0, a.useEffect)(() => {
            _ && S && (null == x ? void 0 : x.id) && (async () => {
                let e = !1;
                try {
                    e = await f()
                } catch (e) {
                    E.logErrorEvent({
                        eventName: s.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                v(e);
                let t = "doNotShow";
                try {
                    t = await b()
                } catch (e) {
                    E.logErrorEvent({
                        eventName: s.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                A(t)
            })().catch(e => {
                E.logErrorEvent({
                    eventName: s.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [_, S, x, E]);
        let I = (0, a.useMemo)(() => {
            let e = _ && "doNotShow" !== y;
            return {
                isBannerVisible: e && !m,
                isBannerEligible: e,
                isHighPriority: T,
                variant: "doNotShow" !== y ? y : "ageVerification",
                dismissBanner: w
            }
        }, [_, y, m, T, w]);
        return (0, t.jsx)(p.Provider, {
            value: I,
            children: l
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(p)], 906791)
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
            children: s
        } = e, [r, n] = (0, a.useState)(), l = e => {
            n(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: r,
            updateDroppedFile: l
        }), [r]);
        return (0, t.jsx)(i.default.Provider, {
            value: o,
            children: s
        })
    }])
}, 799972, e => {
    "use strict";
    var t = e.i(284856),
        a = e.i(671376);
    let {
        docs: i
    } = e.i(829425).creatorHub, s = {
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
    }, "assetTypeInfoTextMessage", 0, r, "dashboardAssetTypeToOpenCloudAssetType", 0, s, "getInfoUrl", 0, e => {
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
        i = e.i(237401),
        s = e.i(513997),
        r = e.i(514961),
        n = e.i(197649),
        l = e.i(79187),
        o = e.i(169722),
        d = e.i(29929),
        c = e.i(889311),
        u = e.i(215955),
        m = e.i(227700),
        f = e.i(881670),
        h = e.i(114209),
        p = e.i(373736),
        g = e.i(917852),
        b = e.i(576069),
        v = e.i(351111);
    let y = "".concat("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/assets", "/home/publish_eligibility_banner.webp"),
        A = (0, l.withTranslation)(e => {
            var A;
            let {
                universeId: S,
                showCallToAction: x = !0
            } = e, E = (0, i.useRouter)(), {
                translateWithNamespace: T
            } = (0, l.useTranslation)(), {
                params: _,
                isFetched: w
            } = (0, m.useIXPParameters)(d.IXPLayers.CreatorHubCreationsPermission), I = _[d.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: k
            } = (0, h.useCurrentGame)(), C = null == k ? void 0 : k.id, P = null != S ? S : C && C > 0 ? C : void 0, {
                data: N,
                isLoading: M,
                isFetching: D
            } = (0, b.useCreatorEligibility)(), L = (0, a.useRef)(!1), [O, F] = (0, a.useState)(!1), R = (null == N ? void 0 : N.ageBracket) === s.AgeBracketEnum.Over18, j = (null == N ? void 0 : N.ageBracket) === s.AgeBracketEnum.Between13And18, U = null != (A = null == N ? void 0 : N.creatorEligibility.includes(s.CreatorEligibilityEnum.IdVerified)) && A, B = R || j, q = w && I && !(M || D) && !!N && !U;
            (0, a.useEffect)(() => {
                q && !L.current && (L.current = !0, u.default.logImpressionEvent({
                    eventName: c.default.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: B ? "start" : "viewDetails",
                        ctaHidden: String(!x),
                        ...P ? {
                            universeId: String(P)
                        } : {}
                    }
                }))
            }, [q, x, B, P]);
            let V = (0, a.useCallback)(() => {
                if (!q) return;
                let e = B ? "start" : "viewDetails";
                (u.default.logClickEvent({
                    eventName: c.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...P ? {
                            universeId: String(P)
                        } : {}
                    }
                }), j) ? F(!0): B || E.push("/settings/eligibility/publishing-permissions")
            }, [q, j, E, B, P]);
            return q ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, n.clsx)(v.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
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
                        className: (0, n.clsx)(v.default.heroTextContent, "dark-theme relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [T(f.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: T(f.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, n.clsx)(v.default.buttonRow, "flex gap-small"),
                            children: x ? R ? (0, t.jsx)(r.Button, {
                                as: "a",
                                href: g.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: V,
                                children: (0, t.jsx)("span", {
                                    children: T(f.TranslationNamespace.AudienceReach, B ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(r.Button, {
                                onClick: V,
                                children: (0, t.jsx)("span", {
                                    children: T(f.TranslationNamespace.AudienceReach, B ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), j ? (0, t.jsx)(p.default, {
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
}, 358763, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(296380);
    let i = () => {};
    e.s(["default", 0, function(e, s) {
        let {
            debounceDelay: r,
            intersectionObserverThreshold: n,
            resetOncePer: l
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, o = (0, t.useRef)(!1), d = (0, t.useCallback)(e => {
            !e || o.current || (o.current = !0, s())
        }, [s]), [c] = (0, a.default)(d, null != r ? r : 250), u = (0, t.useCallback)(e => {
            let [t] = e;
            c(t.isIntersecting)
        }, [c]), m = null != l ? l : "instance";
        (0, t.useMemo)(() => {
            "callback" === m && (o.current = !1)
        }, [s]), (0, t.useEffect)(() => {
            if (!e.current) return i;
            let t = new IntersectionObserver(u, {
                threshold: null != n ? n : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, n, u])
    }])
}, 445550, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(309999),
        i = e.i(307529),
        s = e.i(272593);
    let r = {
            [i.default.Model]: a.CategoryType.Model,
            [i.default.Plugin]: a.CategoryType.Plugin
        },
        n = {
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
            async getCreations(e, t, a, i, s, n, l) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: r[t],
                    limit: i,
                    cursor: s,
                    separateModelsAndPackages: n,
                    includeSharedAssets: l
                }) : this.toolboxApi.toolboxGetUserCreationAssets({
                    userId: e,
                    assetType: r[t],
                    limit: i,
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
    e.s(["assetTypeIdToAssetType", 0, n, "default", 0, l, "toolboxServiceItemDetailsLimit", 0, 30])
}, 790806, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(176936),
        i = e.i(272593);
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
                const e = (0, i.createClientConfiguration)("users", "bedev1");
                this.displayNameApi = new a.DisplayNamesApi(e), this.usersApi = new a.UsersApi(e), this.userSearchApi = new a.UserSearchApi(e)
            }
        },
        r = new a.UsersApi((0, i.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: r
    }, "default", 0, s])
}, 131385, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(780880),
        i = e.i(339544),
        s = e.i(643093),
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
            i = (0, n.useQuery)({
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
            h = (0, t.useMemo)(() => (0, s.transformCreatorDashboardTree)(i.data, f), [i.data, f]),
            p = (0, t.useMemo)(() => (0, s.buildTaxonomyL1Options)(h), [h]);
        return {
            response: i.data,
            categories: h,
            l1Options: p,
            isLoading: i.isLoading || r.isLoading,
            isError: i.isError
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
            isLoading: h
        } = m(e), p = (0, r.isAllAssetTypesActiveTab)(d) || (0, r.isRecentsActiveTab)(d) || (0, r.isAvatarLooksActiveTab)(d) ? void 0 : null != (n = (0, r.parseTaxonomyActiveTab)(d)) ? n : null == (o = u[0]) ? void 0 : o.taxonomyKey, g = (0, t.useMemo)(() => (0, s.findL1Category)(f, p), [f, p]), b = (0, t.useMemo)(() => (0, s.buildTaxonomyL2Options)(g), [g]), v = parseInt(null != (l = null == c ? void 0 : c.toString()) ? l : "", 10), y = (0, i.isValidIndex)(v, b) ? v : 0, A = (0, t.useMemo)(() => {
            if (g) return b.length > 0 ? b[y] : g.webStableId ? (0, s.categoryToDropdown)(g) : void 0
        }, [g, b, y]);
        return {
            l1Options: u,
            activeL1Key: p,
            activeL1Node: g,
            l2Options: b,
            filterIndex: y,
            selection: A,
            isLoading: h
        }
    }], 131385)
}, 638016, e => {
    "use strict";
    var t = e.i(780880),
        a = e.i(723538),
        i = e.i(130778);
    e.s(["default", 0, e => {
        let [{
            activeTab: s
        }] = (0, t.useQueryParams)(["activeTab"]), r = (0, a.default)(), n = r && (0, i.isTaxonomyActiveTab)(s), l = r && (0, i.isRecentsActiveTab)(s), o = r && (0, i.isAvatarLooksActiveTab)(s);
        return {
            canUseTaxonomy: r && (n || (0, i.isTaxonomyEligibleAssetTab)(e)),
            isTaxonomyMode: n,
            isTaxonomyView: n && !(0, i.isAllAssetTypesActiveTab)(s) && !(0, i.isRecentsActiveTab)(s) && !(0, i.isAvatarLooksActiveTab)(s),
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
            let [i, s] = e;
            s.forEach((e, s) => {
                t.set(a(i, e.nameKey), s)
            })
        }), t
    }, "isOnItemTab", 0, e => e === t.Asset.TShirt, "isValidIndex", 0, (e, t) => void 0 !== t && void 0 !== e && e > 0 && e < t.length, "serializeMenuMapKey", 0, a], 339544);
    var i = e.i(266213),
        s = e.i(418162);
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
            lookType: i.default.Makeup,
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
        let i = null != (a = null == e ? void 0 : e.categories) ? a : [],
            s = [],
            o = [];
        return i.forEach(e => {
            var a, i, u;
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
                h = !1;
            m.forEach(e => {
                if (d(e, n)) {
                    t.enableMakeupAssets && (h = !0, f.push(e));
                    return
                }
                if (c(e)) {
                    if (d(e, r)) return void s.push(e);
                    f.push(e)
                }
            }), 0 !== f.length && e.webStableId && o.push({
                key: e.webStableId,
                name: null != (i = e.name) ? i : "",
                webStableId: e.webStableId,
                assetTypeIds: e.assetTypeIds,
                isMakeup: h,
                children: f
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
    var t, a, i, s = e.i(671376),
        r = e.i(692587),
        n = e.i(117236);
    let l = "AvatarItems",
        o = "".concat(l, "-"),
        d = s.Asset.HairAccessory;

    function c(e) {
        return e ? "".concat(o).concat(e) : l
    }

    function u(e) {
        let t = (0, r.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let m = "recents",
        f = "Recents",
        h = "looks",
        p = new Set(null != (t = null == (i = n.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = i.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

    function g(e) {
        return p.has(e)
    }
    e.s(["ALL_ASSET_TYPES_L1_KEY", 0, "all", "AVATAR_ITEMS_ACTIVE_TAB", 0, l, "AVATAR_LOOKS_L1_KEY", 0, h, "RECENTS_L1_KEY", 0, m, "TAXONOMY_HOST_ASSET", 0, d, "buildRecentsActiveTab", 0, function(e) {
        return e ? c(m) : f
    }, "buildTaxonomyActiveTab", 0, c, "isAllAssetTypesActiveTab", 0, function(e) {
        return "all" === u(e)
    }, "isAvatarLooksActiveTab", 0, function(e) {
        return u(e) === h
    }, "isRecentsActiveTab", 0, function(e) {
        return (0, r.readQueryValue)(e) === f || u(e) === m
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, r.readQueryValue)(e);
        return a === l || null != (t = null == a ? void 0 : a.startsWith(o)) && t
    }, "isTaxonomyEligibleAssetTab", 0, g, "parseTaxonomyActiveTab", 0, u, "shouldOpenTaxonomyView", 0, function(e) {
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
        s = e.i(252842),
        r = e.i(671376);
    let n = {
            [r.Asset.Place]: a.SearchSortParameter.LastUpdated,
            [r.Asset.UpcomingEvent]: i.EventSortBy.StartUtc,
            [r.Asset.PastEvent]: i.EventSortBy.StartUtc,
            [r.Asset.DraftEvent]: i.EventSortBy.StartUtc
        },
        l = {
            sort: n,
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
}, 211461, 899441, 59937, e => {
    "use strict";
    var t, a, i, s = e.i(677753),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function n(e, t, a, i) {
        return new(a || (a = Promise))(function(s, r) {
            function n(e) {
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
                e.done ? s(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(n, l)
            }
            o((i = i.apply(e, t || [])).next())
        })
    }

    function l(e, t) {
        var a, i, s, r = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            n = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return n.next = l(0), n.throw = l(1), n.return = l(2), "function" == typeof Symbol && (n[Symbol.iterator] = function() {
            return this
        }), n;

        function l(l) {
            return function(o) {
                var d = [l, o];
                if (a) throw TypeError("Generator is already executing.");
                for (; n && (n = 0, d[0] && (r = 0)), r;) try {
                    if (a = 1, i && (s = 2 & d[0] ? i.return : d[0] ? i.throw || ((s = i.return) && s.call(i), 0) : i.next) && !(s = s.call(i, d[1])).done) return s;
                    switch (i = 0, s && (d = [2 & d[0], s.value]), d[0]) {
                        case 0:
                        case 1:
                            s = d;
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
                            if (!(s = (s = r.trys).length > 0 && s[s.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === d[0] && (!s || d[1] > s[0] && d[1] < s[3])) {
                                r.label = d[1];
                                break
                            }
                            if (6 === d[0] && r.label < s[1]) {
                                r.label = s[1], s = d;
                                break
                            }
                            if (s && r.label < s[2]) {
                                r.label = s[2], r.ops.push(d);
                                break
                            }
                            s[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    d = t.call(e, r)
                } catch (e) {
                    d = [6, e], i = 0
                } finally {
                    a = s = 0
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
            createdDetails: (0, s.exists)(t, "createdDetails") ? t.createdDetails : void 0,
            purchasedDetails: (0, s.exists)(t, "purchasedDetails") ? t.purchasedDetails : void 0,
            sharedDetails: (0, s.exists)(t, "sharedDetails") ? t.sharedDetails : void 0
        }
    }

    function c(e) {
        var t, a, i, r, n, l, o;
        return null == (t = e) ? t : {
            path: (0, s.exists)(t, "path") ? t.path : void 0,
            assetItem: (0, s.exists)(t, "assetItem") ? null == (a = t.assetItem) ? a : {
                asset: (0, s.exists)(a, "asset") ? null == (i = a.asset) ? i : {
                    createTime: (0, s.exists)(i, "createTime") ? new Date(i.createTime) : void 0,
                    updateTime: (0, s.exists)(i, "updateTime") ? new Date(i.updateTime) : void 0,
                    assetId: (0, s.exists)(i, "assetId") ? i.assetId : void 0,
                    displayName: (0, s.exists)(i, "displayName") ? i.displayName : void 0,
                    description: (0, s.exists)(i, "description") ? i.description : void 0,
                    assetType: (0, s.exists)(i, "assetType") ? i.assetType : void 0,
                    creationContext: (0, s.exists)(i, "creationContext") ? null == (r = i.creationContext) ? r : {
                        creator: (0, s.exists)(r, "creator") ? null == (n = r.creator) ? n : {
                            userId: (0, s.exists)(n, "userId") ? n.userId : void 0,
                            groupId: (0, s.exists)(n, "groupId") ? n.groupId : void 0,
                            name: (0, s.exists)(n, "name") ? n.name : void 0
                        } : void 0
                    } : void 0,
                    state: (0, s.exists)(i, "state") ? i.state : void 0,
                    assetSubType: (0, s.exists)(i, "assetSubType") ? i.assetSubType : void 0
                } : void 0,
                sources: (0, s.exists)(a, "sources") ? a.sources.map(d) : void 0,
                isPackage: (0, s.exists)(a, "isPackage") ? a.isPackage : void 0
            } : void 0,
            folderItem: (0, s.exists)(t, "folderItem") ? null == (l = t.folderItem) ? l : {
                folder: (0, s.exists)(l, "folder") ? null == (o = l.folder) ? o : {
                    folderId: (0, s.exists)(o, "folderId") ? o.folderId : void 0,
                    parentFolderId: (0, s.exists)(o, "parentFolderId") ? o.parentFolderId : void 0,
                    displayName: (0, s.exists)(o, "displayName") ? o.displayName : void 0,
                    createTime: (0, s.exists)(o, "createTime") ? new Date(o.createTime) : void 0,
                    updateTime: (0, s.exists)(o, "updateTime") ? new Date(o.updateTime) : void 0
                } : void 0
            } : void 0
        }
    }
    var u = {
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
        h = {
            assetTypes: f(o),
            sources: f(u)
        };

    function p(e, t) {
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
                return n(this, void 0, void 0, function() {
                    var a, i, r;
                    return l(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.filter || void 0 === e.filter) throw new s.RequiredError("filter", "Required parameter requestParameters.filter was null or undefined when calling creatorInventorySearchCreatorInventoryItems.");
                                return a = {}, void 0 !== e.query && (a.query = e.query), void 0 !== e.filter && (a.filter = function(e) {
                                    for (var t = [], a = 0; a < m.length; a++) ! function(a) {
                                        var i = e[a];
                                        if (null != i) {
                                            var s = h[a];
                                            if (Array.isArray(i)) {
                                                if (0 === i.length) return;
                                                t.push("".concat(a, "=").concat(i.map(function(e) {
                                                    return p(e, s)
                                                }).join(",")))
                                            } else t.push("".concat(a, "=").concat(p(i, s)))
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
                                return r = n.sent(), [2, new s.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        items: (0, s.exists)(e, "items") ? e.items.map(c) : void 0,
                                        nextPageToken: (0, s.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorInventorySearchCreatorInventoryItems = function(e, t) {
                return n(this, void 0, void 0, function() {
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
        }(s.BaseAPI),
        b = e.i(272593),
        v = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.Video = "Video", t),
        y = ((a = {}).Group = "groups", a.User = "users", a);
    let A = new g((0, b.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => v, "CreatorInventoryScopeType", () => y, "default", 0, A], 899441), e.s(["CreatorInventorySourceType", 0, u], 59937);
    var S = e.i(671376),
        x = ((i = {}).All = "All", i);
    let E = [v.Model, v.Plugin, v.Audio, v.Decal, v.Image, v.Video, v.Mesh, v.MeshPart, v.Animation],
        T = new Set([v.Audio, v.Decal, v.MeshPart, v.Video]),
        _ = {
            [v.Animation]: S.Asset.Animation,
            [v.Audio]: S.Asset.Audio,
            [v.Decal]: S.Asset.Decal,
            [v.Image]: S.Asset.Image,
            [v.Mesh]: S.Asset.Mesh,
            [v.MeshPart]: S.Asset.MeshPart,
            [v.Model]: S.Asset.Model,
            [v.Plugin]: S.Asset.Plugin,
            [v.Video]: S.Asset.Video
        },
        w = new Set(E),
        I = new Set(["All", u.Created, u.Purchased, u.Shared]),
        k = new Set([S.Asset.Animation, S.Asset.Audio, S.Asset.Decal, S.Asset.Image, S.Asset.Mesh, S.Asset.MeshPart, S.Asset.Model, S.Asset.Plugin, S.Asset.Video]),
        C = {
            [v.Animation]: o.Animation,
            [v.Audio]: o.Audio,
            [v.Decal]: o.Decal,
            [v.Image]: o.Image,
            [v.Mesh]: o.Mesh,
            [v.MeshPart]: o.MeshPart,
            [v.Model]: o.Model,
            [v.Plugin]: o.Plugin,
            [v.Video]: o.Video
        },
        P = {
            3: v.Audio,
            10: v.Model,
            13: v.Decal,
            24: v.Animation,
            38: v.Plugin,
            40: v.MeshPart,
            62: v.Video,
            ANIMATION: v.Animation,
            ASSET_TYPE_ANIMATION: v.Animation,
            ASSET_TYPE_AUDIO: v.Audio,
            ASSET_TYPE_DECAL: v.Decal,
            ASSET_TYPE_IMAGE: v.Image,
            ASSET_TYPE_MESH: v.Mesh,
            ASSET_TYPE_MESH_PART: v.MeshPart,
            ASSET_TYPE_MODEL: v.Model,
            ASSET_TYPE_PLUGIN: v.Plugin,
            ASSET_TYPE_VIDEO: v.Video,
            AUDIO: v.Audio,
            DECAL: v.Decal,
            IMAGE: v.Image,
            MESH: v.Mesh,
            MESHPART: v.MeshPart,
            MODEL: v.Model,
            PLUGIN: v.Plugin,
            VIDEO: v.Video
        },
        N = {
            createdDetails: u.Created,
            purchasedDetails: u.Purchased,
            sharedDetails: u.Shared
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
    e.s(["DevelopmentItemsSourceFilter", () => x, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: y.Group,
        id: t
    } : null != e ? {
        type: y.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        assetTypes: [C[t]],
        ...e.type === y.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(u.Created), "developmentItemsAssetTypes", 0, E, "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getDevelopmentItemsSearchAssetTypes", 0, e => [e, ...E.filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => _[e], "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: i
        } = e;
        return t.trim().length > 0 || a || i !== u.Created
    }, "isDevelopmentItemAsset", 0, e => k.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && T.has(e), "isDevelopmentItemsAssetTypeSelection", 0, e => null != e && w.has(e), "isDevelopmentItemsSourceSelection", 0, e => null != e && I.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, i, s, r, n, l;
        let o, d = null == (i = e.assetItem) ? void 0 : i.asset;
        if (null == d) return;
        let c = "number" == typeof d.assetId ? d.assetId : Number.parseInt(null != (t = d.assetId) ? t : "", 10);
        if (Number.isNaN(c)) return;
        let u = null == (s = d.displayName) ? void 0 : s.trim();
        return {
            id: null != (a = e.path) ? a : c.toString(),
            assetId: c,
            assetType: (e => {
                if (null != e) return P[e.toString().toUpperCase()]
            })(d.assetType),
            created: D(d.createTime),
            isPackage: (null == (r = e.assetItem) ? void 0 : r.isPackage) === !0,
            name: null == u || 0 === u.length ? c.toString() : u,
            sources: (l = null == (n = e.assetItem) ? void 0 : n.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let i = N[t];
                    null != i && o.add(i)
                })
            }), [...o]),
            state: null == d.state ? void 0 : M[d.state],
            updated: D(d.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let i = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => e.assetType === a && !i.has(e.assetId))]
    }], 211461)
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
            isFetched: s
        } = (0, a.default)(t.default);
        if (s) return null != (e = null == i ? void 0 : i.showAvatarLooksInCreations) && e
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
        s = e.i(475360),
        r = e.i(949599),
        n = e.i(117236);
    let l = n.default.reduce((e, t) => {
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
            menuItem: n.default[0]
        },
        d = a.Asset.EyeMakeup,
        c = a.Asset.AvatarLooks,
        u = a.Asset.AvatarBackground,
        m = a.Asset.Showcase;
    e.s(["default", 0, {
        isMenuItemEnabled(e, i, r, n, l, o, f, h, p) {
            var g, b;
            return (null == e ? void 0 : e.type) === a.Asset.AllCatalogAsset ? null != f && f : (null == e ? void 0 : e.type) === a.Asset.SharedExperiences ? null == r : (null == e ? void 0 : e.type) === a.Asset.Moments ? null != o && o : (null == e ? void 0 : e.itemType) === s.Item.Bundle || ((null == e ? void 0 : e.type) === c ? null != h && h : (null == e ? void 0 : e.type) === u ? i.enableAvatarBackgrounds && null != (g = null == l ? void 0 : l.has(e.type)) && g : (null == e ? void 0 : e.type) === m ? null != p && p : (null == e ? void 0 : e.type) === d ? i.enableMakeupAssets && null != (b = null == l ? void 0 : l.has(e.type)) && b : (null == e ? void 0 : e.type) === void 0 || !!(0, t.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === n || null != n && n)
        },
        getValidMenuState(e, t, a, i, s, r, n, l, o, c) {
            var m, f, h, p, g, b;
            let v, y, A = (null == (m = t.submenuItem) ? void 0 : m.type) !== d && (null == (f = t.submenuItem) ? void 0 : f.type) !== u || void 0 !== r;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, i, s, r, n, l, o, c)) {
                if (void 0 !== t.submenuItem && A && !this.isMenuItemEnabled(t.submenuItem, a, i, s, r, n, l, o, c))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            d = 0;
                        for (; d < (null == (p = t.menuItem.submenuItems) ? void 0 : p.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[d], a, i, s, r, n, l, o, c)) {
                                e = d;
                                break
                            }
                            d += 1
                        }
                        v = t.menuItem, y = null == (g = t.menuItem.submenuItems) ? void 0 : g[e]
                    } else v = t.menuItem, y = null == (b = t.menuItem.submenuItems) ? void 0 : b[0]
            } else [v] = e, y = null == (h = e[0].submenuItems) ? void 0 : h[0];
            return v ? {
                menuItem: v,
                submenuItem: y
            } : t
        },
        isAssetTypeDirectlyArchivable: e => n.allowedAssetTypesForDirectArchiving.has(e),
        isAssetTypeArchivable(e, t) {
            if (void 0 !== t && r.AvatarMenuMap[e]) {
                let a = r.AvatarMenuMap[e][t],
                    i = null == a ? void 0 : a.assetType;
                return (null == a ? void 0 : a.bundleType) !== void 0 || void 0 !== i && n.allowedAssetTypesForArchiving.has(i)
            }
            return n.allowedAssetTypesForArchiving.has(e)
        },
        isAssetTypeSortable: e => n.allowedAssetTypesForSorting.has(e),
        isItemTypeUploadable: e => n.allowedItemTypesForUploading.has(e),
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
        s = e.i(514455),
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
            allowCloseDialog: h,
            onDismiss: p
        } = e, {
            classes: {
                alertStyle: g
            }
        } = (0, o.default)(), [b, v] = (0, a.useState)(!0);
        return b ? (0, t.jsxs)(i.Alert, {
            severity: u,
            onClose: void 0,
            className: g,
            action: (0, t.jsxs)(t.Fragment, {
                children: [f && (0, t.jsx)(r.Button, {
                    color: "inherit",
                    size: "small",
                    href: m,
                    children: f
                }), h && (0, t.jsx)(l.IconButton, {
                    "aria-label": "Close",
                    color: "inherit",
                    size: "small",
                    onClick: () => {
                        null == p || p(), v(!1)
                    },
                    children: (0, t.jsx)(n.CloseIcon, {
                        fontSize: "small"
                    })
                })]
            }),
            children: [d && (0, t.jsx)(s.AlertTitle, {
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
}, 493924, 938429, 321623, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(199834),
        i = e.i(706442),
        s = e.i(776344),
        r = e.i(462863),
        n = e.i(210436),
        l = e.i(872378),
        o = e.i(909935),
        d = e.i(587608),
        c = e.i(648550),
        u = e.i(879556),
        m = e.i(156676),
        f = e.i(732097),
        h = e.i(149209),
        p = e.i(152382),
        g = e.i(323377),
        b = e.i(212940),
        v = e.i(581403),
        y = e.i(527781),
        A = e.i(977079),
        S = e.i(402440),
        x = e.i(620094),
        E = e.i(721267),
        T = e.i(788618),
        _ = e.i(11730),
        w = e.i(334912),
        I = e.i(315072),
        k = e.i(319700),
        C = e.i(397367),
        P = e.i(339295),
        N = e.i(26168),
        M = e.i(761562),
        D = e.i(174990),
        L = e.i(226572),
        O = e.i(41024),
        F = e.i(318682),
        R = e.i(902904),
        j = e.i(973248),
        U = e.i(699904),
        B = e.i(861406),
        q = e.i(659373),
        V = e.i(871908),
        Y = e.i(712369),
        z = e.i(761170),
        G = e.i(69008),
        K = e.i(610419),
        H = e.i(6938),
        X = e.i(931008),
        W = e.i(132917),
        Q = e.i(999544),
        J = e.i(370502),
        Z = e.i(779375),
        $ = e.i(179677),
        ee = e.i(761534),
        et = e.i(935295),
        ea = e.i(930283),
        ei = e.i(892316),
        es = e.i(667509),
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
            light: G.default,
            dark: z.default
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
            light: S.default,
            dark: A.default
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
            light: Y.default,
            dark: V.default
        },
        audio: {
            light: d.default,
            dark: o.default
        },
        decals: {
            light: y.default,
            dark: v.default
        },
        images: {
            light: _.default,
            dark: T.default
        },
        videos: {
            light: el.default,
            dark: es.default
        },
        meshes: {
            light: U.default,
            dark: j.default
        },
        animations: {
            light: J.default,
            dark: Q.default
        },
        noUsers: {
            light: b.default,
            dark: g.default
        },
        localization: {
            light: N.default,
            dark: P.default
        },
        rightsManager: {
            light: W.default,
            dark: X.default
        },
        tokens: {
            light: ei.default,
            dark: ea.default
        },
        chart: {
            light: C.default,
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
            light: H.default,
            dark: K.default
        },
        makeupLooks: {
            light: O.default,
            dark: L.default
        },
        barGraph: {
            light: p.default,
            dark: h.default
        },
        leaderboard: {
            light: I.default,
            dark: w.default
        },
        findPeople: {
            light: E.default,
            dark: x.default
        },
        managedPricing: {
            light: R.default,
            dark: F.default
        }
    };
    e.s(["default", 0, eo], 938429);
    let ed = "".concat("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/assets", "/spot_illustrations"),
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
    let eu = (0, i.makeStyles)()(() => ({
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
                size: i = "large"
            } = e, s = a && eo[a];
            if (s) return (0, t.jsx)(r.default, {
                lightSrc: s.light,
                darkSrc: s.dark,
                alt: a
            });
            let n = a ? ec[i][a] : null;
            return n && (0, t.jsx)("img", {
                height: "large" === i ? 240 : 96,
                width: "large" === i ? 320 : 96,
                src: n,
                alt: a
            })
        },
        ef = e => {
            let {
                children: i,
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
            return (0, t.jsxs)(s.default, {
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
                }), (0, t.jsxs)(s.default, {
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
                }), i]
            })
        };
    ef.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, em, "default", 0, ef], 493924)
}, 321211, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340);
    e.s(["default", 0, e => {
        let {
            className: i,
            onChange: s,
            onDragActiveHandler: r,
            onDragLeaveHandler: n,
            size: l,
            multiple: o,
            children: d,
            accept: c,
            ...u
        } = e, m = (0, a.useRef)(null), f = () => {
            m.current && m.current.click()
        }, h = e => {
            ((e instanceof Event ? e instanceof KeyboardEvent : e.nativeEvent && e.nativeEvent instanceof KeyboardEvent) ? ["Spacebar", " ", "Enter"].includes(e.key) : (console.info("The event passed in is not a keyboard event, are you using the handler in the wrong place?"), !1)) && (e.preventDefault(), f())
        }, p = d ? d(f, h, e => {
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
            e.preventDefault(), n && n()
        }) : null;
        return (0, t.jsxs)("div", {
            className: i,
            children: [p, (0, t.jsx)("input", {
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
                    s && s(t.files), m.current && (m.current.value = "")
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
        i = e.i(79187),
        s = e.i(540513),
        r = e.i(199834),
        n = e.i(169722),
        l = e.i(706442),
        o = e.i(590108),
        d = e.i(982234),
        c = e.i(559956),
        u = e.i(770009),
        m = e.i(904090),
        f = e.i(17829),
        h = e.i(426546);
    let p = {
            compact: 32,
            medium: 48,
            large: 64
        },
        g = {
            compact: 12,
            medium: 16,
            large: 20
        },
        b = {
            compact: 32,
            medium: 48,
            large: 64
        },
        v = {
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
                    width: p[a],
                    height: p[a],
                    marginRight: g[a]
                },
                userBorderRadius: {
                    borderRadius: b[a]
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
                target: g,
                targetType: b,
                displayNameOverride: v,
                adornment: A,
                label: S,
                disabled: x,
                variant: E = "medium",
                disableLink: T = !1,
                obfuscate: _ = !1,
                hideThumbnail: w = !1,
                hideSecondaryLabel: I = !1,
                textVariant: k = "primary",
                labelTooltip: C
            } = e,
            {
                classes: {
                    container: P,
                    avatarContainer: N,
                    thumbnailItemContainer: M,
                    thumbnailBackground: D,
                    userBorderRadius: L,
                    nonUserBorderRadius: O,
                    itemText: F,
                    mutedText: R,
                    disabledThumbnail: j,
                    textContainer: U
                },
                cx: B
            } = y({
                variant: E
            }),
            {
                translate: q
            } = (0, i.useTranslation)(),
            V = (0, a.useMemo)(() => b === f.default.User ? s.ThumbnailTypes.avatarHeadshot : b === f.default.Group ? s.ThumbnailTypes.groupIcon : "Ugc" === b ? s.ThumbnailTypes.assetThumbnail : s.ThumbnailTypes.universeThumbnail, [b]),
            Y = (0, a.useMemo)(() => {
                if (!T && g.id && !_) {
                    if (b === f.default.User) return h.www.getUserUrl(g.id);
                    if (b === f.default.Group) return h.www.getGroupUrl(g.id);
                    if ("Experience" === b) {
                        let e = "rootPlaceId" in g ? g.rootPlaceId : void 0;
                        return e ? h.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === b) return h.www.getCatalogUrl(g.id)
                }
            }, [T, g, _, b]);
        v ? l = v : b === f.default.User ? l = "displayName" in g ? g.displayName : void 0 : "Ugc" !== b && (l = "name" in g ? g.name : void 0);
        let z = !v && (b === f.default.User && !("displayName" in g && g.displayName) || "Ugc" === b),
            G = (0, a.useMemo)(() => (0, t.jsxs)(n.Grid, {
                container: !0,
                direction: "row",
                alignItems: "center",
                wrap: "wrap",
                children: [z ? (0, t.jsx)(c.Skeleton, {
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
                        className: U,
                        variant: "secondary" === k ? "body1" : "compact" === E ? "captionHeader" : "large" === E ? "h2" : "h5",
                        color: x ? "disabled" : "inherit",
                        children: _ ? q("Label.Other") : l
                    }), S && S.length > 0 && (0, t.jsx)(m.Tooltip, {
                        arrow: !0,
                        title: C,
                        placement: "right",
                        enterTouchDelay: 0,
                        leaveTouchDelay: 3e3,
                        children: (0, t.jsx)(u.Chip, {
                            color: "secondary",
                            label: S,
                            size: "small",
                            variant: "filled"
                        })
                    })]
                }), !I && (0, t.jsxs)(t.Fragment, {
                    children: [b === f.default.User && (0, t.jsx)(t.Fragment, {
                        children: "name" in g && !g.name ? (0, t.jsx)(c.Skeleton, {
                            animate: !0,
                            variant: "text",
                            width: 192,
                            height: 20
                        }) : (0, t.jsx)(r.Typography, {
                            variant: "secondary" === k ? "body2" : "captionBody",
                            className: B(U, {
                                [R]: "secondary" === k || "compact" === E
                            }),
                            color: x ? "disabled" : "inherit",
                            children: _ ? q("Label.Other") : "@".concat("name" in g ? g.name : "")
                        })
                    }), (b === f.default.Group || "Experience" === b) && (0, t.jsx)(r.Typography, {
                        variant: "captionBody",
                        className: B(U, {
                            [R]: "secondary" === k || "compact" === E
                        }),
                        color: x ? "disabled" : "inherit",
                        children: _ ? q("Label.Other") : g.id
                    })]
                })]
            }), [z, l, b, g, U, x, _, q, S, I, B, R, k, E, C]);
        return (0, t.jsx)(n.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: P,
            children: (null == g ? void 0 : g.id) === void 0 ? (0, t.jsx)(c.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: p[E]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(n.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!w && (0, t.jsx)(n.Grid, {
                        item: !0,
                        className: M,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: B(N, {
                                [L]: b === f.default.User,
                                [O]: b !== f.default.User,
                                [j]: x
                            }),
                            children: (0, t.jsx)(s.Thumbnail2d, {
                                targetId: g.id,
                                type: V,
                                imgClassName: D,
                                alt: "thumbnail",
                                returnPolicy: s.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(n.Grid, {
                        container: !0,
                        direction: "column",
                        className: P,
                        children: (0, t.jsx)(n.Grid, {
                            item: !0,
                            children: T || _ ? G : (0, t.jsx)(d.Link, {
                                href: Y,
                                className: F,
                                color: "inherit",
                                children: G
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
        let i = (0, t.useRef)(null),
            s = (0, t.useCallback)(() => {
                null !== i.current && (clearTimeout(i.current), i.current = null)
            }, [i]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
            s(), i.current = window.setTimeout(() => {
                e(...r), i.current = null
            }, a)
        }, [e, a, s]), s, i]
    };
    e.s(["default", 0, a, "useDebouncedFunction", 0, a])
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
        s = function(e) {
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
                    }), s(e, t)
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

    function i(e) {
        var t, a, i, s;
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
            shouldUnmountOnClose: null == (i = r.shouldUnmountOnClose) || i
        }
    }
    let s = i(),
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
        s = {
            ...i,
            enqueue: function(e) {
                var t, s;
                let r = i.getSnapshot().current;
                null == r || null == (t = (s = r.props).onClose) || t.call(s), a += 1, i.setState({
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
    e.s(["snackbarStore", 0, s])
}, 125677, 20227, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["useCurrentPage", 0, function(e, a) {
        let {
            page: i,
            rowsPerPage: s,
            hasNextPage: r,
            fetchNextPage: n,
            fetchLimit: l = s
        } = a, o = (0, t.useMemo)(() => {
            let t = i * s;
            return e.slice(t, t + s)
        }, [e, i, s]), d = (i + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            d && r && (null == n || n())
        }, [d, r, n]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: i = 50,
            resetKey: s
        } = e, [r, n] = (0, t.useState)(0), [l, o] = (0, t.useState)(i), [d, c] = (0, t.useState)(s);
        s !== d && (c(s), n(0));
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
            fetchNextPage: i,
            disabled: s,
            intervalMs: r = 1e3
        } = e, n = (0, t.useRef)(i);
        n.current = i, (0, t.useEffect)(() => {
            if (!a || s) return;
            n.current();
            let e = setInterval(() => {
                n.current()
            }, r);
            return () => clearInterval(e)
        }, [a, s, r])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(602635),
        i = e.i(79187),
        s = e.i(199834),
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
            ready: h
        } = (0, i.useTranslation)();
        return h ? (0, t.jsxs)(r.Grid, {
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
                    }), (0, t.jsx)(s.Typography, {
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
        s = e.i(79187),
        r = e.i(199834);
    e.s(["default", 0, e => {
        let {
            open: n,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: d
        } = e, {
            translate: c
        } = (0, s.useTranslation)();
        return (0, t.jsx)(i.Dialog, {
            open: n,
            onOpenChange: l,
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: c("Action.Close"),
            children: (0, t.jsxs)(i.DialogContent, {
                children: [(0, t.jsxs)(i.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, t.jsx)(i.DialogTitle, {
                        className: "text-heading-medium margin-y-none",
                        children: c("Label.IdVerification")
                    }), (0, t.jsx)(r.Typography, {
                        className: "text-body-medium",
                        children: c("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(r.Typography, {
                        className: "text-body-medium",
                        children: c("Description.IdVerifiedDialogReverify")
                    })]
                }), (0, t.jsxs)(i.DialogFooter, {
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
    var t, a = e.i(513997),
        i = ((t = {})[t.Done = 0] = "Done", t[t.Required = 1] = "Required", t[t.NotRequired = 2] = "NotRequired", t);
    e.s(["RequirementStatus", () => i], 779091);
    let s = [a.CreatorTierEnum.Private, a.CreatorTierEnum.Trusted, a.CreatorTierEnum.Everyone],
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
        c = {
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
        u = {
            id: a.CreatorEligibilityEnum.IdVerified,
            labelKey: "Label.IdVerification",
            descriptionKey: "Description.B13To18IdVerification",
            tiers: {
                [a.CreatorTierEnum.Private]: i.NotRequired,
                [a.CreatorTierEnum.Trusted]: i.NotRequired,
                [a.CreatorTierEnum.Everyone]: i.Required
            }
        };
    e.s(["B13To18IdRequirement", 0, u, "U13IdRequirement", 0, c, "idVerificationActionUrl", 0, l, "parentLinkActionUrl", 0, o, "requirements", 0, d, "tierDescriptionKeys", 0, n, "tierLabelKeys", 0, r, "tierOrder", 0, s], 917852)
}, 576069, e => {
    "use strict";
    var t = e.i(157310),
        a = e.i(814975),
        i = e.i(605050);
    e.s(["useCreatorEligibility", 0, function() {
        let {
            overrideUserId: e,
            isReady: s = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: r
        } = (0, a.useAuthentication)(), n = null == r ? void 0 : r.id, l = null != e ? e : n;
        return (0, t.useQuery)({
            queryKey: ["creatorEligibility", null != l ? l : null],
            queryFn: async () => {
                if (null == l) throw Error("Creator eligibility userId is required");
                return await i.default.coreContentGetCreatorEligibility({
                    userId: l
                })
            },
            enabled: s && !!l
        })
    }])
}, 812141, e => {
    "use strict";
    var t = e.i(182012),
        a = e.i(157310);
    let i = {},
        s = e => ["folders", null != e ? e : null];
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
    }, "getFoldersQueryKey", 0, s, "useAddItemToFolderMutation", 0, function(e, a) {
        let {
            onSuccess: i,
            onError: s
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.addItemToFolder(t.itemId, t.itemType, t.folderId),
            onSuccess: i,
            onError: s
        })
    }, "useCreateFolderMutation", 0, function(e, a) {
        let {
            onSuccess: i,
            onError: s
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.createFolder(t.name, void 0, t.groupId),
            onSuccess: e => {
                var t;
                return i(null != (t = e.folderId) ? t : "")
            },
            onError: s
        })
    }, "useGetFolders", 0, function(e, t) {
        let i = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
        return (0, a.useQuery)({
            queryKey: s(t),
            queryFn: () => e.getFolders(t),
            enabled: i
        })
    }, "useUpdateFolderMutation", 0, function(e, a) {
        let {
            onSuccess: i,
            onError: s
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.updateFolder(t.folderId, t.name),
            onSuccess: i,
            onError: s
        })
    }])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(221628),
        i = e.i(416340),
        s = e.i(445550),
        r = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t.FrontendFlagEnableCreatorCollaborationLicensing = "PublicFrontendCCL", t.FrontendFlagEnableMarketplaceSalesLicensing = "PublicFrontendMSL", t);
    let n = Object.values(r),
        l = (e => {
            let t = {};
            for (let a of n) t[a] = e(a);
            if (!n.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["DEFAULT_FRONTEND_FLAGS", 0, l, "FRONTEND_FLAG_NAMES", 0, n, "FrontendFlagName", () => r], 448005);
    let o = (0, i.createContext)(null);
    e.s(["default", 0, e => {
        let {
            children: t
        } = e, [r, d] = (0, i.useState)(l), [c, u] = (0, i.useState)(!1), m = (0, i.useCallback)(async e => {
            try {
                let t = await s.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...n.map(e => {
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
                    flags: [...n]
                };
            return u(!0), (async () => {
                await m(t), e && u(!1)
            })(), () => {
                e = !1
            }
        }, [m]);
        let f = (0, i.useMemo)(() => ({
            frontendFlags: r,
            getFrontendFlags: m,
            loadingFrontendFlags: c
        }), [r, m, c]);
        return (0, a.jsx)(o.Provider, {
            value: f,
            children: t
        })
    }, "useToolboxServiceApiProvider", 0, function() {
        let e = (0, i.useContext)(o);
        if (null === e) throw Error("useToolboxServiceApiProvider must be used within a ToolboxServiceApiProvider");
        return e
    }], 845592)
}, 666554, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 318974, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 210436, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 872378, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 909935, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 587608, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 648550, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 879556, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 156676, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 732097, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 149209, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 152382, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 323377, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 212940, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 581403, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 527781, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 977079, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 402440, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 620094, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 721267, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 788618, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 11730, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 334912, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 315072, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 319700, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 397367, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 339295, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 26168, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 761562, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 174990, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 226572, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 41024, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 318682, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 902904, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 973248, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 699904, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 861406, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 659373, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 871908, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 712369, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 761170, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 69008, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 610419, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 6938, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 931008, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 132917, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 999544, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 370502, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 779375, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 179677, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 761534, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 935295, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 930283, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 892316, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 667509, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 285253, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 987596, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 969915, e => {
    e.q("https://assets.create.roblox.com/440db95d3e86a2ab53d0dd568a47996837e50b9f/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 523586, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(416340),
        s = e.i(46079),
        r = e.i(278705),
        n = e.i(183906);
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
        h = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        p = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        g = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        b = e => {
            let {
                iconName: t,
                node: s,
                size: n
            } = e;
            return null != t ? i.default.createElement(r.Icon, {
                name: t,
                size: l[n]
            }) : null != s ? i.default.createElement("span", {
                className: (0, a.default)("inline-flex items-center justify-center shrink-0", g[n])
            }, s) : null
        },
        v = (0, i.forwardRef)((e, r) => {
            var {
                className: l,
                style: g,
                text: v,
                isDisabled: y = !1,
                size: A = "Medium",
                variant: S = "Standard",
                leadingIconName: x,
                leadingIconNode: E,
                trailingIconName: T,
                trailingIconNode: _
            } = e, w = (0, t._)(e, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]);
            let I = null != x || null != E,
                k = null != T || null != _,
                C = (0, a.default)(y ? n.disabledOpacity : [s.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", I ? c[A] : d[A], k ? m[A] : u[A], o[A], l),
                P = i.default.createElement(i.default.Fragment, null, i.default.createElement(s.StateLayer, null), i.default.createElement(b, {
                    iconName: x,
                    node: E,
                    size: A
                }), i.default.createElement("span", {
                    className: (0, a.default)("padding-y-xsmall text-no-wrap text-truncate-end", I && f[A], k && h[A])
                }, v), i.default.createElement(b, {
                    iconName: T,
                    node: _,
                    size: A
                })),
                N = Object.assign({
                    textDecoration: "none"
                }, g);
            if ("a" === w.as) {
                let {
                    as: e,
                    href: s
                } = w, n = (0, t._)(w, ["as", "href"]);
                return i.default.createElement("a", Object.assign({
                    ref: r
                }, n, {
                    "aria-disabled": y,
                    href: y ? void 0 : s,
                    className: (0, a.default)(C, p[S], "content-action-utility"),
                    style: N
                }), P)
            }
            let {
                as: M,
                isChecked: D,
                onCheckedChange: L
            } = w, O = (0, t._)(w, ["as", "isChecked", "onCheckedChange"]);
            return i.default.createElement("button", Object.assign({
                ref: r,
                type: "button"
            }, O, {
                className: (0, a.default)(D ? "bg-inverse-surface-0" : p[S], D ? "content-inverse-emphasis" : "content-action-utility", C),
                style: N,
                "aria-pressed": D,
                disabled: y,
                onClick: null == L ? void 0 : () => L(!D)
            }), P)
        });
    e.s(["Chip", 0, v])
}, 74706, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(416340),
        s = e.i(278705),
        r = e.i(514961),
        n = e.i(787244);
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
        m = (0, i.forwardRef)((e, m) => {
            var {
                title: f,
                description: h,
                linkLabel: p,
                linkHref: g,
                onLinkClick: b,
                showIcon: v = !0,
                infoIconOverride: y,
                layout: A = "Inline",
                variant: S = "Standard",
                severity: x = "Info",
                primaryActionLabel: E,
                onPrimaryAction: T,
                secondaryActionLabel: _,
                onSecondaryAction: w,
                actions: I,
                onDismiss: k,
                dismissIconAriaLabel: C = "Dismiss banner",
                className: P,
                style: N
            } = e, M = (0, t._)(e, ["title", "description", "linkLabel", "linkHref", "onLinkClick", "showIcon", "infoIconOverride", "layout", "variant", "severity", "primaryActionLabel", "onPrimaryAction", "secondaryActionLabel", "onSecondaryAction", "actions", "onDismiss", "dismissIconAriaLabel", "className", "style"]);
            let D = l[x],
                L = "Emphasis" === S ? u[x] : "",
                O = "Info" === x && y ? y : d[x],
                F = "Stacked" === A,
                R = !!I || !!(E && T) || !!(_ && w),
                j = p && i.default.createElement("span", {
                    className: (0, a.default)("text-body-medium underline content-default block text-no-wrap")
                }, p),
                U = j && i.default.createElement(i.default.Fragment, null, i.default.createElement("span", null, " · "), i.default.createElement("a", {
                    className: "shrink-0",
                    href: g,
                    onClick: b
                }, j)),
                B = null != I ? I : E && T || _ && w ? i.default.createElement("div", {
                    className: "flex items-center gap-small"
                }, E && T && i.default.createElement(r.Button, {
                    size: "Small",
                    variant: "Standard",
                    onClick: T,
                    className: (0, a.default)("content-emphasis label-small", L)
                }, E), _ && w && i.default.createElement(r.Button, {
                    size: "Small",
                    variant: "Utility",
                    onClick: w,
                    className: (0, a.default)("content-emphasis label-small")
                }, _)) : null,
                q = k && i.default.createElement(n.CloseAffordance, {
                    variant: "Utility",
                    size: "Small",
                    isCircular: !0,
                    className: "content-emphasis",
                    "aria-label": C,
                    onClick: k
                });
            return i.default.createElement("div", Object.assign({
                ref: m,
                role: "Warning" === x || "Error" === x ? "alert" : "status",
                className: (0, a.default)("foundation-web-feedback-banner flex flex-col gap-small radius-medium padding-large stroke-standard", "Standard" === S ? "bg-shift-100" : void 0, "Standard" === S ? "stroke-default" : o[x], P),
                style: Object.assign({
                    backgroundColor: "Emphasis" === S ? D : void 0
                }, N)
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
            }, v && O && i.default.createElement(s.Icon, {
                name: O,
                size: "Large",
                className: "shrink-0",
                style: {
                    color: c[x]
                }
            }), i.default.createElement("span", {
                className: (0, a.default)("text-label-medium content-emphasis", F ? "" : "block padding-y-xsmall text-truncate-end text-no-wrap min-width-0 grow-1 basis-0")
            }, f)), F && U), h && (F ? i.default.createElement("div", {
                className: (0, a.default)("text-body-medium text-truncate-split content-default width-full")
            }, h) : i.default.createElement(i.default.Fragment, null, i.default.createElement("span", {
                className: "text-body-medium text-truncate-end content-default block text-no-wrap min-width-0 fill"
            }, h), i.default.createElement("span", {
                className: "flex items-center gap-xsmall"
            }, U))), !F && !h && U && i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, U)), F && R && B), !F && (R || k) && i.default.createElement("div", {
                className: "flex items-center justify-end gap-small shrink-0"
            }, R && B, q), F && q && i.default.createElement("div", {
                className: "shrink-0"
            }, q)))
        });
    e.s(["FeedbackBanner", 0, m])
}, 947591, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(416340),
        s = e.i(353108);
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
        o = (0, i.forwardRef)((e, o) => {
            var d, c, u, {
                    children: m,
                    className: f,
                    size: h,
                    color: p = "Emphasis",
                    variant: g = "Standalone",
                    underline: b = "hover",
                    isExternal: v,
                    asChild: y
                } = e,
                A = (0, t._)(e, ["children", "className", "size", "color", "variant", "underline", "isExternal", "asChild"]);
            let S = (d = null != (u = A.as) ? u : "a", c = "button" === A.as ? void 0 : A.target, void 0 !== v ? v : "button" !== d && void 0 !== c && !r.has(c)),
                x = (0, a.default)("foundation-web-link", "button" === A.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || S) && "inline-flex items-center gap-xsmall", void 0 !== h && n[h], l[p], "always" === b ? "underline" : "no-underline", "hover" === b && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", f),
                E = S ? i.default.createElement("span", {
                    "aria-hidden": !0,
                    "data-testid": "foundation-web-icon",
                    className: (0, a.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
                }) : null;
            if (y) {
                let e = (0, t._)(A, ["as"]),
                    a = i.default.Children.only(m);
                return i.default.isValidElement(a) ? i.default.createElement(s.S, Object.assign({
                    ref: o
                }, e, {
                    className: x
                }), i.default.cloneElement(a, {}, i.default.createElement(i.default.Fragment, null, a.props.children, E))) : null
            }
            if ("button" === A.as) {
                let {
                    as: e,
                    type: a
                } = A, s = (0, t._)(A, ["as", "type"]);
                return i.default.createElement("button", Object.assign({
                    ref: o,
                    type: null != a ? a : "button"
                }, s, {
                    className: x
                }), m, E)
            }
            let T = (0, t._)(A, ["as"]);
            return i.default.createElement("a", Object.assign({
                ref: o
            }, T, {
                className: x
            }), m, E)
        });
    o.displayName = "Link", e.s(["Link", 0, o])
}, 270737, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(416340);
    (0, e.i(422711).s)(".foundation-web-media-image{height:100%;-o-object-fit:cover;object-fit:cover;-o-object-position:center;object-position:center;width:100%}");
    let s = {
            "1:1": "aspect-1-1",
            "5:4": "aspect-5-4",
            "4:5": "aspect-4-5",
            "4:3": "aspect-4-3",
            "16:9": "aspect-16-9",
            "2:1": "aspect-2-1"
        },
        r = (0, i.forwardRef)((e, r) => {
            var {
                className: n,
                aspectRatio: l = "1:1",
                alt: o,
                containerClassName: d
            } = e, c = (0, t._)(e, ["className", "aspectRatio", "alt", "containerClassName"]);
            return i.default.createElement("div", {
                className: (0, a.default)("foundation-web-media clip", s[l], d)
            }, i.default.createElement("img", Object.assign({
                ref: r,
                className: (0, a.default)("foundation-web-media-image", n),
                alt: o
            }, c)))
        });
    r.displayName = "Media", e.s(["Media", 0, r])
}, 187901, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(467892),
        s = e.i(66109),
        r = e.i(416340),
        n = e.i(749633);
    e.i(511952);
    var l = e.i(634851),
        o = e.i(532491),
        d = e.i(422711);
    e.i(221628), e.i(149285), (0, d.s)("@keyframes fui-base-sheet-overlay-fade-in{0%{background-color:transparent}to{background-color:var(--color-common-backdrop)}}@keyframes fui-base-sheet-overlay-fade-out{0%{background-color:var(--color-common-backdrop)}to{background-color:transparent}}@keyframes fui-base-sheet-slide-in-from-right{0%{transform:translateX(110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-right{0%{transform:translateX(0)}to{transform:translateX(110%)}}@keyframes fui-base-sheet-slide-in-from-left{0%{transform:translateX(-110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-left{0%{transform:translateX(0)}to{transform:translateX(-110%)}}@keyframes fui-base-sheet-fade-in{0%{opacity:0}to{opacity:1}}@keyframes fui-base-sheet-fade-out{0%{opacity:1}to{opacity:0}}@keyframes fui-base-sheet-slide-in-from-bottom{0%{transform:translateY(110%)}to{transform:translateY(0)}}@keyframes fui-base-sheet-slide-out-to-bottom{0%{transform:translateY(0)}to{transform:translateY(110%)}}.fui-base-sheet-overlay{background-color:var(--color-common-backdrop)}.fui-base-sheet-overlay[data-state=open]{animation:fui-base-sheet-overlay-fade-in var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-state=closed]{animation:fui-base-sheet-overlay-fade-out var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-type=bottomSheet]{align-items:flex-end;justify-content:center}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:env(safe-area-inset-left);margin-right:env(safe-area-inset-right);max-height:90vh;max-width:440px;padding-bottom:env(safe-area-inset-bottom);width:100%}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=open]{animation-duration:var(--time-300);animation-timing-function:var(--ease-standard-out)}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=closed]{animation-duration:var(--time-100);animation-timing-function:var(--ease-standard-in)}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-bottom}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-bottom}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right]{align-items:stretch;justify-content:flex-end}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left]{align-items:stretch;justify-content:flex-start}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true] .fui-base-sheet-content{max-height:100vh;padding-bottom:env(safe-area-inset-bottom);padding-top:env(safe-area-inset-top);width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=right] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-right:env(safe-area-inset-right)}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=left] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-left:env(safe-area-inset-left)}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-left}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-left}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false] .fui-base-sheet-content{border-radius:var(--radius-large);margin:var(--padding-medium);margin-bottom:max(env(safe-area-inset-bottom),var(--padding-medium));margin-top:max(env(safe-area-inset-top),var(--padding-medium));max-height:100vh;max-width:360px;width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=right] .fui-base-sheet-content{margin-right:max(env(safe-area-inset-right),var(--padding-medium))}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=left] .fui-base-sheet-content{margin-left:max(env(safe-area-inset-left),var(--padding-medium))}.fui-base-sheet-overlay[data-type=centerSheet]{align-items:center;justify-content:center;padding:var(--padding-medium)}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content{border-radius:var(--radius-large);max-height:90vh}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Medium] .fui-base-sheet-content{max-width:480px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Large] .fui-base-sheet-content{max-width:640px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-fade-in}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-fade-out}");
    let c = e => {
            let {
                type: t,
                sideSheetSide: s = "right",
                isSideSheetFlush: n = !1,
                centerSheetSize: l = "Medium",
                children: o,
                overlayClassName: d,
                contentClassName: c,
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: f,
                onEscapeKeyDown: h,
                onInteractOutside: p
            } = e;
            return r.default.createElement(i.P, null, r.default.createElement(i.O, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? s : void 0,
                "data-flush": "sideSheet" === t ? n : void 0,
                "data-size": "centerSheet" === t ? l : void 0,
                className: (0, a.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", d)
            }, r.default.createElement(i.b, {
                "data-testid": "fui-base-sheet-content",
                className: (0, a.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", c),
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: f,
                onEscapeKeyDown: h,
                onInteractOutside: p
            }, o)))
        },
        u = e => {
            var t;
            let a = e.currentTarget;
            if (!a) return;
            let i = a.querySelectorAll("[data-autofocus-priority]");
            if (0 === i.length) return;
            let s = [];
            i.forEach(e => {
                let t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                !Number.isNaN(t) && e instanceof HTMLElement && s.push({
                    element: e,
                    priority: t
                })
            }), s.sort((e, t) => e.priority - t.priority);
            let r = s.find(e => {
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
        h = "padding-x-xlarge",
        p = (0, r.forwardRef)((e, i) => {
            var {
                children: s,
                className: n,
                hasPaddingX: l = !0
            } = e, o = (0, t._)(e, ["children", "className", "hasPaddingX"]);
            let {
                type: d
            } = f();
            return r.default.createElement("div", Object.assign({
                ref: i,
                className: (0, a.default)("scroll-y", l && h, "sideSheet" === d ? "grow-1" : "", n)
            }, o), s)
        });
    p.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        var {
            children: i,
            className: s
        } = e, n = (0, t._)(e, ["children", "className"]);
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(o.Divider, null), r.default.createElement("div", Object.assign({
            className: (0, a.default)(h, "margin-y-small shrink-0", s)
        }, n), i))
    }, "SheetBody", 0, p, "SheetContent", 0, e => {
        let t, {
                children: i,
                centerSheetSize: s = "Medium",
                largeScreenVariant: l = "center",
                closeLabel: o,
                className: d,
                mobilePortraitClassName: f,
                mobileLandscapeClassName: h,
                largeScreenClassName: p,
                onOpenAutoFocus: g,
                onCloseAutoFocus: b,
                onPointerDownOutside: v,
                onEscapeKeyDown: y,
                onInteractOutside: A
            } = e,
            S = (0, n.u)("(orientation: portrait) and (max-width: 600px)"),
            x = (0, n.u)("(orientation: landscape) and (max-height: 600px)");
        t = S ? "bottomSheet" : x || "side" === l ? "sideSheet" : "centerSheet";
        let E = (0, r.useMemo)(() => ({
                centerSheetSize: s,
                largeScreenVariant: l,
                closeLabel: o,
                isPortraitMobile: S,
                isLandscapeMobile: x,
                type: t
            }), [s, l, o, S, x, t]),
            T = (0, a.default)(d, S && f, x && h, !S && !x && p);
        return r.default.createElement(m.Provider, {
            value: E
        }, r.default.createElement(c, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: x,
            centerSheetSize: s,
            contentClassName: T,
            onOpenAutoFocus: null != g ? g : u,
            onCloseAutoFocus: b,
            onPointerDownOutside: v,
            onEscapeKeyDown: y,
            onInteractOutside: A
        }, i))
    }, "SheetDescription", 0, e => r.default.createElement(i.D, Object.assign({
        asChild: !0
    }, e)), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: s,
            children: n
        } = e;
        return r.default.createElement(i.R, {
            open: t,
            onOpenChange: a,
            defaultOpen: s,
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
        } = f(), m = r.default.createElement(i.T, {
            className: "text-heading-small margin-none"
        }, n);
        return r.default.createElement("div", {
            className: (0, a.default)(t, o ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, r.default.createElement("div", {
            className: (0, a.default)("flex items-center", o && "gap-xsmall")
        }, o, c ? r.default.createElement(s.V, null, m) : m), r.default.createElement("div", {
            className: (0, a.default)("flex items-center", d && "gap-xxsmall")
        }, d, r.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, r.default.createElement(i.C, {
            asChild: !0
        }, r.default.createElement(l.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: u || "",
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
        s = e.i(278705),
        r = e.i(634851),
        n = e.i(422711);
    e.i(221628), (0, n.s)(".foundation-web-table{border-collapse:collapse;border-spacing:0}.foundation-web-table-row-divider{border-bottom:1px solid var(--color-stroke-muted)}.foundation-web-table-body>tr:last-child>.foundation-web-table-row-divider{border-bottom:none}.foundation-web-table-header-cell-divider{border-bottom:1px solid var(--color-stroke-default)}.foundation-web-table-row:focus-visible{outline:var(--stroke-thick) solid var(--color-stroke-emphasis);outline-offset:calc(var(--stroke-thick)*-1)}.foundation-web-table-pagination-select{-webkit-appearance:none;-moz-appearance:none;appearance:none;border:none;font:inherit;outline:none}.foundation-web-table-pagination-select:focus-visible{outline:var(--stroke-thick) solid var(--color-stroke-emphasis);outline-offset:calc(var(--stroke-thick)*-1)}");
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
        h = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        p = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        g = (0, i.forwardRef)((e, s) => {
            var {
                children: r,
                size: n = "Medium",
                variant: o = "Divided",
                className: d
            } = e, c = (0, t._)(e, ["children", "size", "variant", "className"]);
            let u = (0, i.useMemo)(() => ({
                    size: n,
                    variant: o
                }), [n, o]),
                m = "Framed" === o;
            return i.default.createElement(l.Provider, {
                value: u
            }, i.default.createElement("div", {
                className: (0, a.default)("width-full bg-surface-100", m && "radius-medium clip stroke-standard stroke-default")
            }, i.default.createElement("table", Object.assign({
                ref: s,
                className: (0, a.default)("foundation-web-table width-full content-default", d)
            }, c), r)))
        });
    g.displayName = "Table";
    let b = (0, i.forwardRef)((e, s) => {
        var {
            children: r,
            className: n
        } = e, l = (0, t._)(e, ["children", "className"]);
        return o("TableHeader"), i.default.createElement("thead", Object.assign({
            ref: s,
            className: (0, a.default)("foundation-web-table-header", n)
        }, l), r)
    });
    b.displayName = "TableHeader";
    let v = (0, i.forwardRef)((e, s) => {
        var {
            children: r,
            className: n
        } = e, l = (0, t._)(e, ["children", "className"]);
        return o("TableBody"), i.default.createElement("tbody", Object.assign({
            ref: s,
            className: (0, a.default)("foundation-web-table-body", n)
        }, l), r)
    });
    v.displayName = "TableBody";
    let y = (0, i.forwardRef)((e, s) => {
        var {
            children: r,
            className: n,
            isInteractive: l = !1,
            isHoverable: d = !1,
            isSelected: c = !1,
            isDisabled: u = !1,
            onClick: m,
            onKeyDown: f,
            tabIndex: h,
            role: p
        } = e, g = (0, t._)(e, ["children", "className", "isInteractive", "isHoverable", "isSelected", "isDisabled", "onClick", "onKeyDown", "tabIndex", "role"]);
        o("TableRow");
        let b = l ? {
            role: null != p ? p : "row",
            tabIndex: null != h ? h : 0,
            onClick: u ? void 0 : m,
            onKeyDown: e => {
                u || (null == f || f(e), e.defaultPrevented || "Enter" !== e.key && " " !== e.key || (e.preventDefault(), null == m || m(e)))
            }
        } : {
            role: p,
            tabIndex: h,
            onClick: m,
            onKeyDown: f
        };
        return i.default.createElement("tr", Object.assign({
            ref: s,
            "aria-selected": l ? c : void 0,
            "aria-disabled": !(!l || !u) || void 0,
            "data-selected": c || void 0,
            className: (0, a.default)("foundation-web-table-row", (l || d) && "hover:bg-shift-100", l && !u && "cursor-pointer", l && u && "opacity-disabled pointer-events-none", c && "bg-shift-200", n)
        }, b, g), r)
    });
    y.displayName = "TableRow";
    let A = (0, i.forwardRef)((e, r) => {
        var {
            children: n,
            className: l,
            sortDirection: d,
            onSort: f,
            align: g = "start",
            sortLabel: b,
            scope: v
        } = e, y = (0, t._)(e, ["children", "className", "sortDirection", "onSort", "align", "sortLabel", "scope"]);
        let {
            size: A
        } = o("TableHeaderCell"), S = !!f, x = null != d ? d : "none", E = S && "none" !== x && i.default.createElement(s.Icon, {
            name: "ascending" === x ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), T = i.default.createElement("div", {
            className: (0, a.default)("flex items-center gap-xsmall", m[A], "content-muted", p[g])
        }, "end" === g && E, i.default.createElement("span", {
            className: "text-truncate-end"
        }, n), "end" !== g && E), _ = "string" == typeof n ? "Sort by ".concat(n) : void 0;
        return i.default.createElement("th", Object.assign({
            ref: r,
            scope: null != v ? v : "col",
            "aria-sort": S ? x : void 0,
            className: (0, a.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", u[A], c[A], h[g], "content-muted", l)
        }, y), S ? i.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: f,
            "aria-label": null != b ? b : _
        }, T) : T)
    });
    A.displayName = "TableHeaderCell";
    let S = (0, i.forwardRef)((e, s) => {
        var {
            children: r,
            className: n,
            align: l = "start"
        } = e, u = (0, t._)(e, ["children", "className", "align"]);
        let {
            size: m
        } = o("TableCell");
        return i.default.createElement("td", Object.assign({
            ref: s,
            className: (0, a.default)("foundation-web-table-cell foundation-web-table-row-divider", d[m], c[m], f[m], h[l], "content-default", n)
        }, u), r)
    });
    S.displayName = "TableCell";
    let x = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        E = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        T = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        _ = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        w = {
            XSmall: "gap-xsmall",
            Small: "gap-xsmall",
            Medium: "gap-small"
        },
        I = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "Small"
        },
        k = (0, i.forwardRef)((e, s) => {
            var {
                size: n = "Medium",
                page: l,
                rowsPerPage: o,
                totalRows: d,
                rowsPerPageOptions: c = [10, 25, 50],
                onPageChange: u,
                onRowsPerPageChange: m,
                rowsPerPageLabel: f = "Rows per page",
                firstPageLabel: h = "First page",
                previousPageLabel: p = "Previous page",
                nextPageLabel: g = "Next page",
                lastPageLabel: b = "Last page",
                rangeLabel: v,
                className: y
            } = e, A = (0, t._)(e, ["size", "page", "rowsPerPage", "totalRows", "rowsPerPageOptions", "onPageChange", "onRowsPerPageChange", "rowsPerPageLabel", "firstPageLabel", "previousPageLabel", "nextPageLabel", "lastPageLabel", "rangeLabel", "className"]);
            let S = Math.max(1, Math.ceil(d / o)),
                k = 0 === l,
                C = l >= S - 1,
                P = 0 === d ? 0 : l * o + 1,
                N = Math.min((l + 1) * o, d),
                M = (0, i.useCallback)(e => {
                    let t = Number(e.target.value);
                    null == m || m(t), u(0)
                }, [m, u]),
                D = I[n];
            return i.default.createElement("div", Object.assign({
                ref: s,
                className: (0, a.default)("flex items-center justify-end", x[n], E[n], y)
            }, A), i.default.createElement("div", {
                className: "flex items-center gap-large"
            }, i.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, m && i.default.createElement("div", {
                className: "flex items-center gap-small"
            }, i.default.createElement("span", {
                className: (0, a.default)(T[n], "content-default")
            }, f), i.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, i.default.createElement("select", {
                className: (0, a.default)("foundation-web-table-pagination-select", T[n], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === n ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: o,
                onChange: M,
                "aria-label": f
            }, c.map(e => i.default.createElement("option", {
                key: e,
                value: e
            }, e))))), i.default.createElement("span", {
                className: (0, a.default)(_[n], "content-default")
            }, v ? v(P, N, d) : "".concat(P, "-").concat(N, " of ").concat(d))), i.default.createElement("div", {
                className: (0, a.default)("flex items-center", w[n])
            }, i.default.createElement(r.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: h,
                size: D,
                variant: "Utility",
                isDisabled: k,
                onClick: () => u(0)
            }), i.default.createElement(r.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: p,
                size: D,
                variant: "Utility",
                isDisabled: k,
                onClick: () => u(l - 1)
            }), i.default.createElement(r.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: g,
                size: D,
                variant: "Utility",
                isDisabled: C,
                onClick: () => u(l + 1)
            }), i.default.createElement(r.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: b,
                size: D,
                variant: "Utility",
                isDisabled: C,
                onClick: () => u(S - 1)
            }))))
        });
    k.displayName = "TablePagination", e.s(["Table", 0, g, "TableBody", 0, v, "TableCell", 0, S, "TableHeader", 0, b, "TableHeaderCell", 0, A, "TablePagination", 0, k, "TableRow", 0, y])
}, 258858, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        i = e.i(416340),
        s = e.i(610160),
        r = e.i(183906);
    e.i(511952);
    var n = e.i(878382);
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
        u = i.default.forwardRef((e, u) => {
            var {
                size: m,
                variant: f = "Standard",
                label: h,
                value: p,
                defaultValue: g,
                isDisabled: b,
                hasError: v,
                helperText: y,
                className: A,
                style: S,
                textareaClassName: x,
                textareaStyle: E,
                id: T
            } = e, _ = (0, t._)(e, ["size", "variant", "label", "value", "defaultValue", "isDisabled", "hasError", "helperText", "className", "style", "textareaClassName", "textareaStyle", "id"]);
            let w = (0, s.default)(),
                I = T || w,
                k = "".concat(I, "-description"),
                C = null != m ? m : "Large";
            return i.default.createElement("div", {
                className: (0, a.default)("flex fill flex-col width-full gap-small", {
                    [r.disabledOpacity]: b
                }, A),
                style: S
            }, h && i.default.createElement("label", {
                htmlFor: I,
                className: (0, a.default)(d[C], "content-emphasis")
            }, h), i.default.createElement("textarea", Object.assign({
                ref: u,
                id: I,
                "data-testid": "text-area-container",
                style: E,
                className: (0, a.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", n.INPUT_BACKGROUND_BY_VARIANT[f], n.INPUT_STROKE_BY_VARIANT[f], v ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", c[C], l[C], o[C], x),
                value: p,
                defaultValue: null == p ? g : void 0,
                disabled: b,
                "aria-describedby": y ? k : void 0
            }, _)), y && i.default.createElement("span", {
                id: k,
                className: (0, a.default)("text-caption-small", {
                    "content-system-alert": v,
                    "content-default": !v
                })
            }, y))
        });
    u.displayName = "TextArea", e.s(["TextArea", 0, u])
}, 514455, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        i = e.i(614515),
        s = e.i(993807),
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
        h = (0, l.s)(c.T, {
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
        p = a.forwardRef(function(e, t) {
            let a = (0, u.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: i
                } = a,
                s = (0, n._)(a, f),
                o = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, l.a)({
                        root: ["root"]
                    }, m, t)
                })(a);
            return (0, d.jsx)(h, (0, r._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, l.c)(o.root, i)
            }, s))
        });
    var g = (0, i.default)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        b = (0, a.forwardRef)(function(e, i) {
            var r = e.classes,
                n = e.className,
                l = (0, t.a)(e, ["classes", "className"]),
                o = g(void 0, {
                    props: {
                        classes: (0, s.default)(r, n)
                    }
                });
            return a.default.createElement(p, (0, t._)({}, l, {
                classes: o.classes,
                ref: i
            }))
        });
    e.s(["AlertTitle", 0, b], 514455)
}, 27281, e => {
    "use strict";
    var t = e.i(437272);
    e.s(["NavigateNextIcon", () => t.N])
}, 854705, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        i = e.i(614515),
        s = e.i(993807),
        r = e.i(696180),
        n = e.i(273589),
        l = e.i(962560),
        o = e.i(42569),
        d = e.i(576881),
        c = e.i(751498),
        u = e.i(221628),
        m = e.i(219224),
        f = e.i(963320),
        h = e.i(275966);
    e.i(197094);
    var p = (0, c.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        g = (0, c.c)((0, u.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let b = (0, o.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: o.r
        })({
            position: "relative",
            display: "flex"
        }),
        v = (0, o.s)(p, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        y = (0, o.s)(g, {
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
            fontSize: i
        } = e, s = (0, l._)({}, e, {
            checked: t
        });
        return (0, u.jsxs)(b, {
            className: a.root,
            ownerState: s,
            children: [(0, u.jsx)(v, {
                fontSize: i,
                className: a.background,
                ownerState: s
            }), (0, u.jsx)(y, {
                fontSize: i,
                className: a.dot,
                ownerState: s
            })]
        })
    }

    function S(e) {
        return (0, n.g)("MuiRadio", e)
    }
    var x = (0, r.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let E = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        T = (0, o.s)(d.S, {
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
                ["&.".concat(x.checked)]: {
                    color: (t.vars || t).palette[a.color].main
                }
            }, {
                ["&.".concat(x.disabled)]: {
                    color: (t.vars || t).palette.action.disabled
                }
            })
        }),
        _ = (0, u.jsx)(A, {
            checked: !0
        }),
        w = (0, u.jsx)(A, {}),
        I = a.forwardRef(function(e, t) {
            var i, s, r, d;
            let c = (0, f.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: p,
                    checkedIcon: g = _,
                    color: b = "primary",
                    icon: v = w,
                    name: y,
                    onChange: A,
                    size: x = "medium",
                    className: I
                } = c,
                k = (0, n._)(c, E),
                C = (0, l._)({}, c, {
                    color: b,
                    size: x
                }),
                P = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: i
                    } = e, s = {
                        root: ["root", "color".concat((0, n.a)(a)), "medium" !== i && "size".concat((0, n.a)(i))]
                    };
                    return (0, l._)({}, t, (0, o.a)(s, S, t))
                })(C),
                N = a.useContext(m.R),
                M = p,
                D = (0, h.c)(A, N && N.onChange),
                L = y;
            return N && (void 0 === M && (r = N.value, M = "object" == typeof(d = c.value) && null !== d ? r === d : String(r) === String(d)), void 0 === L && (L = N.name)), (0, u.jsx)(T, (0, l._)({
                type: "radio",
                icon: a.cloneElement(v, {
                    fontSize: null != (i = w.props.fontSize) ? i : x
                }),
                checkedIcon: a.cloneElement(g, {
                    fontSize: null != (s = _.props.fontSize) ? s : x
                }),
                ownerState: C,
                classes: P,
                name: L,
                checked: M,
                onChange: D,
                ref: t,
                className: (0, o.c)(P.root, I)
            }, k))
        });
    var k = (0, i.default)({
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
        C = (0, a.forwardRef)(function(e, i) {
            var r = e.classes,
                n = e.color,
                l = e.inputProps,
                o = e["aria-label"],
                d = e.className,
                c = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = k(void 0, {
                    props: {
                        classes: (0, s.default)(r, d)
                    }
                });
            return a.default.createElement(I, (0, t._)({}, c, {
                classes: u.classes,
                color: void 0 === n ? "primary" : n,
                ref: i,
                inputProps: (0, t._)({
                    "aria-label": o
                }, l)
            }))
        });
    e.s(["Radio", 0, C], 854705)
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
            pageParams: i
        } = t, s = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[s], a, i[s], i) : void 0
    }

    function i(e, t) {
        var a;
        let {
            pages: i,
            pageParams: s
        } = t;
        return i.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, i[0], i, s[0], s) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != i(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (s, r) => {
                var n, l, o, d, c;
                let u = s.options,
                    m = null == (o = s.fetchOptions) || null == (l = o.meta) || null == (n = l.fetchMore) ? void 0 : n.direction,
                    f = (null == (d = s.state.data) ? void 0 : d.pages) || [],
                    h = (null == (c = s.state.data) ? void 0 : c.pageParams) || [],
                    p = {
                        pages: [],
                        pageParams: []
                    },
                    g = 0,
                    b = async () => {
                        let r = !1,
                            n = (0, t.ensureQueryFn)(s.options, s.fetchOptions),
                            l = async (e, a, i) => {
                                let l;
                                if (r) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(l = {
                                        client: s.client,
                                        queryKey: s.queryKey,
                                        pageParam: a,
                                        direction: i ? "backward" : "forward",
                                        meta: s.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (s.signal.aborted ? r = !0 : s.signal.addEventListener("abort", () => {
                                            r = !0
                                        }), s.signal)
                                    }), l),
                                    d = await n(o),
                                    {
                                        maxPages: c
                                    } = s.options,
                                    u = i ? t.addToStart : t.addToEnd;
                                return {
                                    pages: u(e.pages, d, c),
                                    pageParams: u(e.pageParams, a, c)
                                }
                            };
                        if (m && f.length) {
                            let e = "backward" === m,
                                t = {
                                    pages: f,
                                    pageParams: h
                                },
                                s = (e ? i : a)(u, t);
                            p = await l(t, s, e)
                        } else {
                            let t = null != e ? e : f.length;
                            do {
                                var o;
                                let e = 0 === g ? null != (o = h[0]) ? o : u.initialPageParam : a(u, p);
                                if (g > 0 && null == e) break;
                                p = await l(p, e), g++
                            } while (g < t)
                        }
                        return p
                    };
                s.options.persister ? s.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = s.options).persister) ? void 0 : e.call(t, b, {
                        client: s.client,
                        queryKey: s.queryKey,
                        meta: s.options.meta,
                        signal: s.signal
                    }, r)
                } : s.fetchFn = b
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
                var i, s;
                let {
                    state: r
                } = e, n = super.createResult(e, t), {
                    isFetching: l,
                    isRefetching: o,
                    isError: d,
                    isRefetchError: c
                } = n, u = null == (s = r.fetchMeta) || null == (i = s.fetchMore) ? void 0 : i.direction, m = d && "forward" === u, f = l && "forward" === u, h = d && "backward" === u, p = l && "backward" === u;
                return {
                    ...n,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.hasNextPage)(t, r.data),
                    hasPreviousPage: (0, a.hasPreviousPage)(t, r.data),
                    isFetchNextPageError: m,
                    isFetchingNextPage: f,
                    isFetchPreviousPageError: h,
                    isFetchingPreviousPage: p,
                    isRefetchError: c && !m && !h,
                    isRefetching: o && !f && !p
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        s = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, s.useBaseQuery)(e, i, t)
    }], 630986)
}]);

//# debugId=26483741-da2a-5f27-eef3-eccddbebf6a2
//# sourceMappingURL=434twudt_m65p.js.map