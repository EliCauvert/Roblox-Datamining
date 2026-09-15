;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e6dce12e-8478-7e08-b827-4ae598c64a9b")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 134731, e => {
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
        });
    e.s(["isAssetAccessRequestsEnabled", 0, n, "isAssetDependenciesViewerEnabled", 0, s, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, i, "isModelCustomThumbnailUploadEnabled", 0, r, "isPricingEligibilityV2Enabled", 0, l])
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
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, l, "isMomentsSitetestUrlParsingEnabled", 0, r, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, i, "isTextDocumentEnabled", 0, s])
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
    let c = (0, r.withTranslation)(e => {
        let {
            children: r
        } = e, {
            user: l
        } = (0, s.useAuthentication)(), c = (0, o.useCurrentGroup)(), [m, p] = (0, a.useState)(void 0), [f, g] = (0, a.useState)(), [v, h] = (0, a.useState)(), [y, b] = (0, a.useState)(), [A, T] = (0, a.useState)(), x = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == c ? void 0 : c.id) ? e : 0) !== 0
        }, [c]), [w, I] = (0, a.useState)(void 0), S = void 0 === m || void 0 === f || void 0 === v && x, E = (0, a.useCallback)(async () => {
            try {
                if (x && (null == c ? void 0 : c.id)) {
                    let e = await (0, d.getGroupCreatorMetadata)(c.id);
                    p(e);
                    return
                }
                if (!x && (null == l ? void 0 : l.id)) {
                    let e = await (0, d.getUserCreatorMetadata)();
                    p(e);
                    return
                }
            } catch (e) {
                return
            }
            p(null)
        }, [null == c ? void 0 : c.id, x, null == l ? void 0 : l.id]), C = (0, a.useCallback)(async () => {
            if (x && w || !x) try {
                let e = await (0, d.getRequirements)();
                g(e.requirements);
                return
            } catch (e) {
                return
            }
            g(null)
        }, [w, x]), k = (0, a.useCallback)(async () => {
            if (x && (null == c ? void 0 : c.id)) try {
                let e = await (0, d.getGroupEligibility)(c.id);
                h(e.isEligible)
            } catch (e) {
                h(!1)
            }
        }, [c, x]);
        (0, a.useEffect)(() => {
            S ? T(void 0) : x && !w ? T(!1) : T(!1 === y)
        }, [x, w, y, S]), (0, a.useEffect)(() => {
            (async () => {
                if (x && (null == c ? void 0 : c.id)) {
                    var e;
                    return null == (e = (await i.default.getGroupInfo(c.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && I(e === l.id)
            })
        }, [null == c ? void 0 : c.id, x, l]), (0, a.useEffect)(() => {
            S || !f || x && !w ? b(void 0) : b((null == f ? void 0 : f.length) === 0 || (null == f ? void 0 : f.length) === 1 && f[0] === n.Requirements.Payable)
        }, [w, x, S, f]), (0, a.useEffect)(() => {
            E()
        }, [E]), (0, a.useEffect)(() => {
            C()
        }, [C]), (0, a.useEffect)(() => {
            k()
        }, [k]);
        let N = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: S,
            requiresActionToJoinProgram: A,
            compliantWithAllUserRequirements: y,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != f ? f : void 0,
            isCurrentUserGroupOwner: w,
            isGroupEligible: null != v ? v : void 0
        }), [S, A, y, m, f, w, v]);
        return (0, t.jsx)(u.Provider, {
            value: N,
            children: r
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, c, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(u)
    }])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        n = e.i(416340),
        r = e.i(79187),
        s = e.i(423107),
        i = e.i(514455),
        l = e.i(982234),
        o = e.i(199834),
        d = e.i(872204),
        u = e.i(988012),
        c = e.i(447055),
        m = e.i(358763),
        p = e.i(889311),
        f = e.i(823062),
        g = e.i(881670),
        v = e.i(486736),
        h = e.i(906791);
    let y = (0, e.i(706442).makeStyles)()(e => ({
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
    e.s(["default", 0, y], 540082);
    var b = ((t = {}).Home = "home", t.Creations = "creations", t);
    let A = (0, r.withTranslation)(e => {
        let t, g, b, A, {
                trackingPage: T,
                alertRedesignVariant: x
            } = e,
            {
                settings: {
                    ageVerificationUpsellGetStartedUrl: w,
                    ageVerificationUpsellViewDetailsUrl: I,
                    establishTrustUpsellGetStartedUrl: S,
                    establishTrustUpsellViewDetailsUrl: E
                }
            } = (0, v.useSettings)(),
            {
                isBannerVisible: C,
                isHighPriority: k,
                variant: N,
                dismissBanner: M
            } = (0, h.useAgeVerificationUpsellContext)(),
            {
                classes: D
            } = y(),
            P = (0, n.useRef)(null),
            {
                unifiedLogger: F
            } = (0, f.useUnifiedLoggerProvider)(),
            {
                translate: L
            } = (0, r.useTranslation)(),
            U = (0, n.useCallback)(() => {
                C && F.logImpressionEvent({
                    eventName: p.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: T,
                        variant: N,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [F, T, N, x, C]);
        (0, m.default)(P, U);
        let B = (0, n.useCallback)(() => {
                F.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "viewDetails",
                        variant: N,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [F, T, N, x]),
            V = (0, n.useCallback)(() => {
                F.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "callToAction",
                        variant: N,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [F, T, N, x]),
            j = (0, n.useCallback)(() => {
                F.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "dismiss",
                        variant: N,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                }), M()
            }, [F, M, T, N, x]);
        return ("establishTrust" === N ? (t = "Title.EstablishTrustBanner", g = "Label.EstablishTrustBanner2", b = S, A = E) : (t = "Title.AgeVerificationBanner", g = "Label.AgeVerificationBanner", b = w, A = I), C) ? (0, a.jsx)("div", {
            ref: P,
            children: (0, a.jsxs)(s.Alert, {
                className: D.alertContainer,
                severity: "ageVerification" === N && k ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(d.Button, {
                    href: b,
                    onClick: V,
                    className: D.getStarted,
                    color: "inherit",
                    size: "small",
                    children: L("Label.AgeVerificationBannerGetStarted") || "Get started"
                }, "getStarted"), (0, a.jsx)(u.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: j,
                    children: (0, a.jsx)(c.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(i.AlertTitle, {
                    children: L(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: L(g)
                }), " ", (0, a.jsx)(l.Link, {
                    className: D.viewDetails,
                    href: A,
                    target: "_blank",
                    color: "inherit",
                    onClick: B,
                    children: L("Label.AgeVerificationBannerViewDetails") || "View details"
                })]
            })
        }) : null
    }, [g.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, A, "AgeVerificationUpsellPage", () => b], 714039)
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(458451),
        r = e.i(889311),
        s = e.i(823062),
        i = e.i(486736);
    let l = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        o = encodeURIComponent("studio/CollaborationSettings"),
        d = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                n = a.status % 100 * 100;
            if (!a.ok && 500 === n && t < 2) return await new Promise(e => setTimeout(e, 2 ** (t + 1) * 500)), d(e, t + 1);
            if (500 === n && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let r = await a.json();
            if (!("access" in r)) throw Error('"access" not found in response');
            return r.access
        }, u = async () => await d("".concat(l, "/v1/upsell-feature-access?nameSpace=").concat(o, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted", c = "CreatorHub.AgeVerificationBannerSettings", m = async () => {
            localStorage.removeItem(c)
        }, p = async () => {
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
        }, f = async () => {
            localStorage.setItem(c, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, g = (0, a.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), v = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, h = async () => await u() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: l
        } = e, {
            settings: {
                ageVerificationUpsellBannerStartDate: o,
                ageVerificationUpsellBannerEndDate: d,
                ageVerificationUpsellBannerHighPriorityDate: u
            }
        } = (0, i.useSettings)(), [c, m] = (0, a.useState)(!0), [y, b] = (0, a.useState)("doNotShow"), {
            isFetched: A,
            user: T
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: x
        } = (0, s.useUnifiedLoggerProvider)(), {
            isHighPriority: w,
            isEnabled: I
        } = (0, a.useMemo)(() => {
            let e = v(o),
                t = v(d),
                a = v(u),
                n = new Date;
            return {
                isHighPriority: a <= n,
                isEnabled: e <= n && n < t
            }
        }, [d, o, u]), S = (0, a.useCallback)(async () => {
            await f(), m(!0)
        }, [m]);
        (0, a.useEffect)(() => {
            I && A && (null == T ? void 0 : T.id) && (async () => {
                let e = !1;
                try {
                    e = await p()
                } catch (e) {
                    x.logErrorEvent({
                        eventName: r.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                m(e);
                let t = "doNotShow";
                try {
                    t = await h()
                } catch (e) {
                    x.logErrorEvent({
                        eventName: r.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                b(t)
            })().catch(e => {
                x.logErrorEvent({
                    eventName: r.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [I, A, T, x]);
        let E = (0, a.useMemo)(() => {
            let e = I && "doNotShow" !== y;
            return {
                isBannerVisible: e && !c,
                isBannerEligible: e,
                isHighPriority: w,
                variant: "doNotShow" !== y ? y : "ageVerification",
                dismissBanner: S
            }
        }, [I, y, c, w, S]);
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
    var t = e.i(284856),
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
        n = e.i(237401),
        r = e.i(495662),
        s = e.i(52746),
        i = e.i(197649),
        l = e.i(79187),
        o = e.i(169722),
        d = e.i(29929),
        u = e.i(889311),
        c = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        f = e.i(114209),
        g = e.i(373736),
        v = e.i(917852),
        h = e.i(576069),
        y = e.i(663563);
    let b = "".concat("https://assets.create.roblox.com/dca8b671c04a8c6f33b3f061f6761f3cd35a97ba/assets", "/home/publish_eligibility_banner.webp"),
        A = (0, l.withTranslation)(e => {
            var A;
            let {
                universeId: T,
                showCallToAction: x = !0
            } = e, w = (0, n.useRouter)(), {
                translateWithNamespace: I
            } = (0, l.useTranslation)(), {
                params: S,
                isFetched: E
            } = (0, m.useIXPParameters)(d.IXPLayers.CreatorHubCreationsPermission), C = S[d.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: k
            } = (0, f.useCurrentGame)(), N = null == k ? void 0 : k.id, M = null != T ? T : N && N > 0 ? N : void 0, {
                data: D,
                isLoading: P,
                isFetching: F
            } = (0, h.useCreatorEligibility)(), L = (0, a.useRef)(!1), [U, B] = (0, a.useState)(!1), V = (null == D ? void 0 : D.ageBracket) === r.AgeBracketEnum.Over18, j = (null == D ? void 0 : D.ageBracket) === r.AgeBracketEnum.Between13And18, R = null != (A = null == D ? void 0 : D.creatorEligibility.includes(r.CreatorEligibilityEnum.IdVerified)) && A, O = V || j, _ = E && C && !(P || F) && !!D && !R;
            (0, a.useEffect)(() => {
                _ && !L.current && (L.current = !0, c.default.logImpressionEvent({
                    eventName: u.default.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: O ? "start" : "viewDetails",
                        ctaHidden: String(!x),
                        ...M ? {
                            universeId: String(M)
                        } : {}
                    }
                }))
            }, [_, x, O, M]);
            let G = (0, a.useCallback)(() => {
                if (!_) return;
                let e = O ? "start" : "viewDetails";
                (c.default.logClickEvent({
                    eventName: u.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...M ? {
                            universeId: String(M)
                        } : {}
                    }
                }), j) ? B(!0): O || w.push("/settings/eligibility/publishing-permissions")
            }, [_, j, w, O, M]);
            return _ ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, i.clsx)(y.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
                    children: [(0, t.jsx)("img", {
                        src: b,
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
                        className: (0, i.clsx)(y.default.heroTextContent, "dark-theme relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [I(p.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: I(p.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, i.clsx)(y.default.buttonRow, "flex gap-small"),
                            children: x ? V ? (0, t.jsx)(s.Button, {
                                as: "a",
                                href: v.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: I(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(s.Button, {
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: I(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), j ? (0, t.jsx)(g.default, {
                    open: U,
                    onOpenChange: B,
                    onContinueWithId: () => {
                        window.open(v.idVerificationActionUrl, "_blank", "noopener,noreferrer"), B(!1)
                    },
                    onAddParent: () => {
                        window.open(v.parentLinkActionUrl, "_blank", "noopener,noreferrer"), B(!1)
                    }
                }) : null]
            }) : null
        }, [p.TranslationNamespace.AudienceReach, p.TranslationNamespace.PublicPublish]);
    e.s(["default", 0, A])
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
        d = e.i(671376),
        u = e.i(486736),
        c = e.i(117236);
    let m = function() {
        let e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
            {
                settings: a
            } = (0, u.useSettings)(),
            n = (0, i.useQuery)({
                queryKey: ["getTaxonomyCategories", o.CategoryDomain.NUMBER_3],
                queryFn: () => l.default.getItemCategories(o.CategoryDomain.NUMBER_3),
                enabled: e,
                staleTime: 3e5
            }),
            s = (0, i.useQuery)({
                queryKey: ["getAvatarItemsEntryPointAssetTypes"],
                queryFn: c.getAvatarItemsEntryPointAssetTypes,
                enabled: e,
                staleTime: 3e5
            }),
            m = s.data,
            p = (0, t.useMemo)(() => {
                var e, t;
                return {
                    enableMakeupAssets: a.enableMakeupAssets && null != (e = null == m ? void 0 : m.has(d.Asset.EyeMakeup)) && e,
                    enableAvatarBackgrounds: a.enableAvatarBackgrounds && null != (t = null == m ? void 0 : m.has(d.Asset.AvatarBackground)) && t
                }
            }, [a.enableMakeupAssets, a.enableAvatarBackgrounds, m]),
            f = (0, t.useMemo)(() => (0, r.transformCreatorDashboardTree)(n.data, p), [n.data, p]),
            g = (0, t.useMemo)(() => (0, r.buildTaxonomyL1Options)(f), [f]);
        return {
            response: n.data,
            categories: f,
            l1Options: g,
            isLoading: n.isLoading || s.isLoading,
            isError: n.isError
        }
    };
    e.s(["default", 0, e => {
        var i, l, o;
        let [{
            activeTab: d,
            filterIndex: u
        }] = (0, a.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: c,
            categories: p,
            isLoading: f
        } = m(e), g = (0, s.isAllAssetTypesActiveTab)(d) || (0, s.isRecentsActiveTab)(d) || (0, s.isAvatarLooksActiveTab)(d) ? void 0 : null != (i = (0, s.parseTaxonomyActiveTab)(d)) ? i : null == (o = c[0]) ? void 0 : o.taxonomyKey, v = (0, t.useMemo)(() => (0, r.findL1Category)(p, g), [p, g]), h = (0, t.useMemo)(() => (0, r.buildTaxonomyL2Options)(v), [v]), y = parseInt(null != (l = null == u ? void 0 : u.toString()) ? l : "", 10), b = (0, n.isValidIndex)(y, h) ? y : 0, A = (0, t.useMemo)(() => {
            if (v) return h.length > 0 ? h[b] : v.webStableId ? (0, r.categoryToDropdown)(v) : void 0
        }, [v, h, b]);
        return {
            l1Options: c,
            activeL1Key: g,
            activeL1Node: v,
            l2Options: h,
            filterIndex: b,
            selection: A,
            isLoading: f
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
            let p = [],
                f = !1;
            m.forEach(e => {
                if (d(e, i)) {
                    t.enableMakeupAssets && (f = !0, p.push(e));
                    return
                }
                if (u(e)) {
                    if (d(e, s)) return void r.push(e);
                    p.push(e)
                }
            }), 0 !== p.length && e.webStableId && o.push({
                key: e.webStableId,
                name: null != (n = e.name) ? n : "",
                webStableId: e.webStableId,
                assetTypeIds: e.assetTypeIds,
                isMakeup: f,
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
        d = r.Asset.HairAccessory;

    function u(e) {
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
    e.s(["ALL_ASSET_TYPES_L1_KEY", 0, "all", "AVATAR_ITEMS_ACTIVE_TAB", 0, l, "AVATAR_LOOKS_L1_KEY", 0, c, "TAXONOMY_HOST_ASSET", 0, d, "buildTaxonomyActiveTab", 0, function(e) {
        return e ? "".concat(o).concat(e) : l
    }, "isAllAssetTypesActiveTab", 0, function(e) {
        return "all" === u(e)
    }, "isAvatarLooksActiveTab", 0, function(e) {
        return u(e) === c
    }, "isRecentsActiveTab", 0, function(e) {
        return "Recents" === (0, s.readQueryValue)(e) || "recents" === u(e)
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, s.readQueryValue)(e);
        return a === l || null != (t = null == a ? void 0 : a.startsWith(o)) && t
    }, "isTaxonomyEligibleAssetTab", 0, p, "parseTaxonomyActiveTab", 0, u, "shouldOpenTaxonomyView", 0, function(e) {
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
        a = e.i(959222),
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
        d = new Set([n.CreatorInventoryAssetType.Audio, n.CreatorInventoryAssetType.Decal, n.CreatorInventoryAssetType.MeshPart, n.CreatorInventoryAssetType.TextDocument, n.CreatorInventoryAssetType.Video]),
        u = new Set([...d, n.CreatorInventoryAssetType.Image]),
        c = new Set(o),
        m = new Set([n.CreatorInventoryAssetType.TextDocument]),
        p = new Set(["All", r.CreatorInventorySourceType.Created, r.CreatorInventorySourceType.Purchased, r.CreatorInventorySourceType.Shared]),
        f = new Set([s.Asset.Animation, s.Asset.Audio, s.Asset.Decal, s.Asset.Image, s.Asset.Mesh, s.Asset.MeshPart, s.Asset.Model, s.Asset.Plugin, s.Asset.Video]),
        g = {
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
        v = {
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
        h = {
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
        y = {
            createdDetails: r.CreatorInventorySourceType.Created,
            purchasedDetails: r.CreatorInventorySourceType.Purchased,
            sharedDetails: r.CreatorInventorySourceType.Shared
        },
        b = {
            [a.State.Active]: "Active",
            [a.State.Archived]: "Archived"
        },
        A = e => !0 === e ? o : l,
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
        assetTypes: [v[t]],
        ...e.type === n.CreatorInventoryScopeType.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(r.CreatorInventorySourceType.Created), "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getDevelopmentItemsAssetTypes", 0, A, "getDevelopmentItemsSearchAssetTypes", 0, (e, t) => [e, ...A(t).filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => g[e], "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: n
        } = e;
        return t.trim().length > 0 || a || n !== r.CreatorInventorySourceType.Created
    }, "hasDevelopmentItemCreatorStorePage", 0, e => e !== n.CreatorInventoryAssetType.TextDocument, "hasDevelopmentItemThumbnail", 0, e => e !== n.CreatorInventoryAssetType.TextDocument, "isDevelopmentItemArchivedViewAvailable", 0, e => null != e && u.has(e), "isDevelopmentItemAsset", 0, (e, t) => e === s.Asset.TextDocument ? !0 === t : f.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && d.has(e), "isDevelopmentItemsAssetTypeSelection", 0, (e, t) => null != e && !!c.has(e) && (!m.has(e) || !0 === t), "isDevelopmentItemsSourceSelection", 0, e => null != e && p.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, n, r, s, i, l;
        let o, d = null == (n = e.assetItem) ? void 0 : n.asset;
        if (null == d) return;
        let u = "number" == typeof d.assetId ? d.assetId : Number.parseInt(null != (t = d.assetId) ? t : "", 10);
        if (Number.isNaN(u)) return;
        let c = null == (r = d.displayName) ? void 0 : r.trim();
        return {
            id: null != (a = e.path) ? a : u.toString(),
            assetId: u,
            assetType: (e => {
                if (null != e) return h[e.toString().toUpperCase()]
            })(d.assetType),
            created: T(d.createTime),
            isPackage: (null == (s = e.assetItem) ? void 0 : s.isPackage) === !0,
            name: null == c || 0 === c.length ? u.toString() : c,
            sources: (l = null == (i = e.assetItem) ? void 0 : i.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let n = y[t];
                    null != n && o.add(n)
                })
            }), [...o]),
            state: null == d.state ? void 0 : b[d.state],
            updated: T(d.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let n = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => e.assetType === a && !n.has(e.assetId))]
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
            data: n,
            isFetched: r
        } = (0, a.default)(t.default);
        if (r) return null != (e = null == n ? void 0 : n.showAvatarLooksInCreations) && e
    }])
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
        d = a.Asset.EyeMakeup,
        u = a.Asset.AvatarLooks,
        c = a.Asset.AvatarBackground,
        m = a.Asset.Showcase;
    e.s(["default", 0, {
        isMenuItemEnabled(e, n, s, i, l, o, p, f, g, v) {
            var h, y;
            return ((null == e ? void 0 : e.type) !== a.Asset.TextDocument || !!v) && ((null == e ? void 0 : e.type) === a.Asset.AllCatalogAsset ? null != p && p : (null == e ? void 0 : e.type) === a.Asset.SharedExperiences ? null == s : (null == e ? void 0 : e.type) === a.Asset.Moments ? null != o && o : (null == e ? void 0 : e.itemType) === r.Item.Bundle || ((null == e ? void 0 : e.type) === u ? null != f && f : (null == e ? void 0 : e.type) === c ? n.enableAvatarBackgrounds && null != (h = null == l ? void 0 : l.has(e.type)) && h : (null == e ? void 0 : e.type) === m ? null != g && g : (null == e ? void 0 : e.type) === d ? n.enableMakeupAssets && null != (y = null == l ? void 0 : l.has(e.type)) && y : (null == e ? void 0 : e.type) === void 0 || !!(0, t.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === i || null != i && i))
        },
        getValidMenuState(e, t, a, n, r, s, i, l, o, u, m) {
            var p, f, g, v, h, y;
            let b, A, T = (null == (p = t.submenuItem) ? void 0 : p.type) !== d && (null == (f = t.submenuItem) ? void 0 : f.type) !== c || void 0 !== s;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, n, r, s, i, l, o, u, m)) {
                if (void 0 !== t.submenuItem && T && !this.isMenuItemEnabled(t.submenuItem, a, n, r, s, i, l, o, u, m))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            d = 0;
                        for (; d < (null == (v = t.menuItem.submenuItems) ? void 0 : v.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[d], a, n, r, s, i, l, o, u, m)) {
                                e = d;
                                break
                            }
                            d += 1
                        }
                        b = t.menuItem, A = null == (h = t.menuItem.submenuItems) ? void 0 : h[e]
                    } else b = t.menuItem, A = null == (y = t.menuItem.submenuItems) ? void 0 : y[0]
            } else [b] = e, A = null == (g = e[0].submenuItems) ? void 0 : g[0];
            return b ? {
                menuItem: b,
                submenuItem: A
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
        r = e.i(192052),
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
            externalLink: d,
            linkLabel: u,
            allowCloseDialog: c,
            onDismiss: m
        } = e, {
            translate: p
        } = (0, s.useTranslation)(), [f, g] = (0, t.useState)(!0);
        if (!f) return null;
        let v = c ? {
            closeLabel: p("Action.Close"),
            onDismiss: () => {
                null == m || m(), g(!1)
            }
        } : {
            hasCloseAffordance: !1
        };
        return (0, n.jsx)(r.Alert, {
            severity: i[o],
            variant: "Feedback",
            className: "width-full",
            primaryActionLabel: u,
            primaryActionHref: d,
            ...v,
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
            children: d,
            accept: u,
            ...c
        } = e, m = (0, a.useRef)(null), p = () => {
            m.current && m.current.click()
        }, f = e => {
            ((e instanceof Event ? e instanceof KeyboardEvent : e.nativeEvent && e.nativeEvent instanceof KeyboardEvent) ? ["Spacebar", " ", "Enter"].includes(e.key) : (console.info("The event passed in is not a keyboard event, are you using the handler in the wrong place?"), !1)) && (e.preventDefault(), p())
        }, g = d ? d(p, f, e => {
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
            children: [g, (0, t.jsx)("input", {
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
        r = e.i(540513),
        s = e.i(199834),
        i = e.i(169722),
        l = e.i(706442),
        o = e.i(590108),
        d = e.i(982234),
        u = e.i(559956),
        c = e.i(770009),
        m = e.i(904090),
        p = e.i(17829),
        f = e.i(426546);
    let g = {
            compact: 32,
            medium: 48,
            large: 64
        },
        v = {
            compact: 12,
            medium: 16,
            large: 20
        },
        h = {
            compact: 32,
            medium: 48,
            large: 64
        },
        y = {
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
                    width: g[a],
                    height: g[a],
                    marginRight: v[a]
                },
                userBorderRadius: {
                    borderRadius: h[a]
                },
                nonUserBorderRadius: {
                    borderRadius: y[a]
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
                targetType: h,
                displayNameOverride: y,
                adornment: A,
                label: T,
                disabled: x,
                variant: w = "medium",
                disableLink: I = !1,
                obfuscate: S = !1,
                hideThumbnail: E = !1,
                hideSecondaryLabel: C = !1,
                textVariant: k = "primary",
                labelTooltip: N
            } = e,
            {
                classes: {
                    container: M,
                    avatarContainer: D,
                    thumbnailItemContainer: P,
                    thumbnailBackground: F,
                    userBorderRadius: L,
                    nonUserBorderRadius: U,
                    itemText: B,
                    mutedText: V,
                    disabledThumbnail: j,
                    textContainer: R
                },
                cx: O
            } = b({
                variant: w
            }),
            {
                translate: _
            } = (0, n.useTranslation)(),
            G = (0, a.useMemo)(() => h === p.default.User ? r.ThumbnailTypes.avatarHeadshot : h === p.default.Group ? r.ThumbnailTypes.groupIcon : "Ugc" === h ? r.ThumbnailTypes.assetThumbnail : r.ThumbnailTypes.universeThumbnail, [h]),
            z = (0, a.useMemo)(() => {
                if (!I && v.id && !S) {
                    if (h === p.default.User) return f.www.getUserUrl(v.id);
                    if (h === p.default.Group) return f.www.getGroupUrl(v.id);
                    if ("Experience" === h) {
                        let e = "rootPlaceId" in v ? v.rootPlaceId : void 0;
                        return e ? f.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === h) return f.www.getCatalogUrl(v.id)
                }
            }, [I, v, S, h]);
        y ? l = y : h === p.default.User ? l = "displayName" in v ? v.displayName : void 0 : "Ugc" !== h && (l = "name" in v ? v.name : void 0);
        let K = !y && (h === p.default.User && !("displayName" in v && v.displayName) || "Ugc" === h),
            H = (0, a.useMemo)(() => (0, t.jsxs)(i.Grid, {
                container: !0,
                direction: "row",
                alignItems: "center",
                wrap: "wrap",
                children: [K ? (0, t.jsx)(u.Skeleton, {
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
                        className: R,
                        variant: "secondary" === k ? "body1" : "compact" === w ? "captionHeader" : "large" === w ? "h2" : "h5",
                        color: x ? "disabled" : "inherit",
                        children: S ? _("Label.Other") : l
                    }), T && T.length > 0 && (0, t.jsx)(m.Tooltip, {
                        arrow: !0,
                        title: N,
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
                }), !C && (0, t.jsxs)(t.Fragment, {
                    children: [h === p.default.User && (0, t.jsx)(t.Fragment, {
                        children: "name" in v && !v.name ? (0, t.jsx)(u.Skeleton, {
                            animate: !0,
                            variant: "text",
                            width: 192,
                            height: 20
                        }) : (0, t.jsx)(s.Typography, {
                            variant: "secondary" === k ? "body2" : "captionBody",
                            className: O(R, {
                                [V]: "secondary" === k || "compact" === w
                            }),
                            color: x ? "disabled" : "inherit",
                            children: S ? _("Label.Other") : "@".concat("name" in v ? v.name : "")
                        })
                    }), (h === p.default.Group || "Experience" === h) && (0, t.jsx)(s.Typography, {
                        variant: "captionBody",
                        className: O(R, {
                            [V]: "secondary" === k || "compact" === w
                        }),
                        color: x ? "disabled" : "inherit",
                        children: S ? _("Label.Other") : v.id
                    })]
                })]
            }), [K, l, h, v, R, x, S, _, T, C, O, V, k, w, N]);
        return (0, t.jsx)(i.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: M,
            children: (null == v ? void 0 : v.id) === void 0 ? (0, t.jsx)(u.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: g[w]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(i.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!E && (0, t.jsx)(i.Grid, {
                        item: !0,
                        className: P,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: O(D, {
                                [L]: h === p.default.User,
                                [U]: h !== p.default.User,
                                [j]: x
                            }),
                            children: (0, t.jsx)(r.Thumbnail2d, {
                                targetId: v.id,
                                type: G,
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
                            children: I || S ? H : (0, t.jsx)(d.Link, {
                                href: z,
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
            [o, d] = (0, t.useState)(() => l ? {
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
        }, [e, n, r]), d = (n + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            d && s && (null == i || i())
        }, [d, s, i]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: n = 50,
            resetKey: r
        } = e, [s, i] = (0, t.useState)(0), [l, o] = (0, t.useState)(n), [d, u] = (0, t.useState)(r);
        r !== d && (u(r), i(0));
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
        r = e.i(199834),
        s = e.i(169722),
        i = e.i(706442),
        l = e.i(39128);
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
            header: i,
            items: d,
            icon: u,
            activeKey: c,
            defaultExpanded: m
        } = e, {
            classes: p
        } = o(), {
            ready: f
        } = (0, n.useTranslation)();
        return f ? (0, t.jsxs)(s.Grid, {
            classes: {
                root: p.container
            },
            children: [i && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(s.Grid, {
                    classes: {
                        root: p.headerContainer
                    },
                    children: [u && (0, t.jsx)(s.Grid, {
                        classes: {
                            root: p.icon
                        },
                        children: u
                    }), (0, t.jsx)(r.Typography, {
                        variant: "largeLabel2",
                        classes: {
                            root: p.header
                        },
                        children: i
                    })]
                }), (0, t.jsx)(l.Divider, {
                    classes: {
                        root: p.divider
                    }
                })]
            }), d.length > 0 && (0, t.jsx)(a.NavigationTree, {
                selected: c,
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
        a = e.i(52746),
        n = e.i(459891),
        r = e.i(79187),
        s = e.i(199834);
    e.s(["default", 0, e => {
        let {
            open: i,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: d
        } = e, {
            translate: u
        } = (0, r.useTranslation)();
        return (0, t.jsx)(n.Dialog, {
            open: i,
            onOpenChange: l,
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: u("Action.Close"),
            children: (0, t.jsxs)(n.DialogContent, {
                children: [(0, t.jsxs)(n.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, t.jsx)(n.DialogTitle, {
                        className: "text-heading-medium margin-y-none",
                        children: u("Label.IdVerification")
                    }), (0, t.jsx)(s.Typography, {
                        className: "text-body-medium",
                        children: u("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(s.Typography, {
                        className: "text-body-medium",
                        children: u("Description.IdVerifiedDialogReverify")
                    })]
                }), (0, t.jsxs)(n.DialogFooter, {
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
        } = e, [s, d] = (0, n.useState)(l), [u, c] = (0, n.useState)(!1), m = (0, n.useCallback)(async e => {
            try {
                let t = await r.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...i.map(e => {
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
            loadingFrontendFlags: u
        }), [s, m, u]);
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
        a = e.i(237401),
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
            d = (0, t.useRef)(!1),
            u = (0, t.useRef)(!1),
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
            !d.current && null !== c && i && (d.current = !0, "user" === c.kind ? null !== l && o(null) : m && (null == l ? void 0 : l.id) !== c.id && o(c.id))
        }, [c, i, m, l, o]);
        let p = !e.isReady;
        return p || null === c || (p = "group" === c.kind ? !i || m && (null == l ? void 0 : l.id) !== c.id : !i || null !== l), (0, t.useEffect)(() => {
            if (u.current || !e.isReady || p || void 0 === e.query.groupId && void 0 === e.query.userId) return;
            u.current = !0;
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
}, 192052, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(52746),
        n = e.i(39210),
        r = e.i(808048),
        s = e.i(962192),
        i = e.i(197649),
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
        u = {
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
        f = (0, l.forwardRef)((e, a) => {
            let {
                children: r,
                variant: f = "System",
                severity: g = "Info",
                primaryActionLabel: v,
                primaryActionHref: h,
                primaryActionLinkTarget: y,
                onPrimaryAction: b,
                secondaryActionLabel: A,
                secondaryActionHref: T,
                secondaryActionLinkTarget: x,
                onSecondaryAction: w,
                hasCloseAffordance: I = !0,
                closeLabel: S = "Dismiss alert",
                onDismiss: E,
                className: C,
                style: k,
                ...N
            } = e, M = (0, n.default)("foundation-web-alert-message-"), D = !!v, P = !!A, F = !!(I && E), L = "Feedback" === f && (D || P || F), U = "Warning" === g || "Error" === g ? "alert" : "status", B = null;
            D && (B = P ? l.default.createElement(m, {
                label: v || "",
                href: h,
                linkTarget: y,
                onAction: b,
                variant: "Standard"
            }) : l.default.createElement(p, {
                label: v || "",
                href: h,
                linkTarget: y,
                onAction: b
            }));
            let V = P ? l.default.createElement(m, {
                label: A || "",
                href: T,
                linkTarget: x,
                onAction: w,
                variant: "Utility"
            }) : null;
            return l.default.createElement("div", {
                ref: a,
                role: L ? "region" : U,
                "aria-labelledby": L ? M : void 0,
                className: (0, i.default)("foundation-web-alert relative width-full stroke-standard", "System" === f ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", u[g], C),
                ...N
            }, l.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, i.default)("absolute inset-[0] pointer-events-none", "Feedback" === f && "radius-medium"),
                style: {
                    backgroundColor: c[g]
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
                    color: d[g]
                }
            }))), l.default.createElement("div", {
                className: (0, i.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", P ? "flex-col" : "wrap")
            }, l.default.createElement("div", {
                id: L ? M : void 0,
                role: L ? U : void 0,
                className: (0, i.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", P ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, r), (B || V) && l.default.createElement("div", {
                className: (0, i.default)("flex items-center gap-small wrap shrink-0", !P && "padding-y-[var(--size-150)]")
            }, B, V)), F && l.default.createElement(s.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": S,
                onClick: E
            })))
        });
    e.s(["Alert", 0, f])
}, 46938, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(52746),
        n = e.i(962192),
        r = e.i(197649),
        s = e.i(416340);
    let i = {
            Info: "rgb(from var(--color-system-emphasis) r g b / ".concat(.05, ")"),
            Warning: "rgb(from var(--color-system-warning) r g b / ".concat(.05, ")"),
            Success: "rgb(from var(--color-system-success) r g b / ".concat(.05, ")"),
            Error: "rgb(from var(--color-system-alert) r g b / ".concat(.05, ")")
        },
        l = {
            Info: "stroke-system-emphasis",
            Warning: "stroke-system-warning",
            Success: "stroke-system-success",
            Error: "stroke-system-alert"
        },
        o = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        d = {
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
        c = (0, s.forwardRef)((e, c) => {
            let {
                title: m,
                description: p,
                linkLabel: f,
                linkHref: g,
                onLinkClick: v,
                showIcon: h = !0,
                infoIconOverride: y,
                layout: b = "Inline",
                variant: A = "Standard",
                severity: T = "Info",
                primaryActionLabel: x,
                onPrimaryAction: w,
                secondaryActionLabel: I,
                onSecondaryAction: S,
                actions: E,
                onDismiss: C,
                dismissIconAriaLabel: k = "Dismiss banner",
                className: N,
                style: M,
                ...D
            } = e, P = i[T], F = "Emphasis" === A ? u[T] : "", L = "Info" === T && y ? y : o[T], U = "Stacked" === b, B = !!E || !!(x && w) || !!(I && S), V = f && s.default.createElement("a", {
                className: "text-body-medium underline content-default text-wrap [overflow-wrap:anywhere]",
                href: g,
                onClick: v
            }, f), j = V && s.default.createElement("span", {
                className: "min-width-0 max-width-full"
            }, U || !p ? " · " : " · ", V), R = null != E ? E : x && w || I && S ? s.default.createElement("div", {
                className: "flex items-center gap-small wrap"
            }, x && w && s.default.createElement(a.Button, {
                size: "Small",
                variant: "Standard",
                onClick: w,
                className: (0, r.default)("content-emphasis label-small", F)
            }, x), I && S && s.default.createElement(a.Button, {
                size: "Small",
                variant: "Utility",
                onClick: S,
                className: (0, r.default)("content-emphasis label-small")
            }, I)) : null, O = C && s.default.createElement(n.CloseAffordance, {
                variant: "Utility",
                size: "Small",
                isCircular: !0,
                className: "content-emphasis",
                "aria-label": k,
                onClick: C
            });
            return s.default.createElement("div", {
                ref: c,
                role: "Warning" === T || "Error" === T ? "alert" : "status",
                className: (0, r.default)("foundation-web-feedback-banner flex flex-col gap-small radius-medium padding-large stroke-standard", "Standard" === A ? "bg-shift-100" : void 0, "Standard" === A ? "stroke-default" : l[T], N),
                style: {
                    backgroundColor: "Emphasis" === A ? P : void 0,
                    ...M
                },
                ...D
            }, s.default.createElement("div", {
                className: (0, r.default)("flex width-full gap-medium", U ? "items-start" : "items-center wrap")
            }, s.default.createElement("div", {
                className: (0, r.default)("flex grow-1", U ? "flex-col gap-medium basis-0 min-width-0" : "items-center gap-xsmall wrap basis-0 min-width-[min(200px,100%)]")
            }, s.default.createElement("div", {
                className: (0, r.default)("flex min-width-0", U ? "gap-medium flex-col grow-1 basis-0" : "gap-xsmall items-center wrap width-full")
            }, s.default.createElement("div", {
                className: "flex items-center gap-xsmall wrap"
            }, s.default.createElement("div", {
                className: (0, r.default)("flex items-center gap-medium", U ? "min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, h && L && s.default.createElement(t.Icon, {
                name: L,
                size: "Large",
                className: "shrink-0",
                style: {
                    color: d[T]
                }
            }), s.default.createElement("span", {
                className: (0, r.default)("text-label-medium text-wrap content-emphasis [overflow-wrap:anywhere]", U ? "" : "block padding-y-xsmall min-width-0 grow-1 basis-0")
            }, m)), U && j), p && (U ? s.default.createElement("div", {
                className: (0, r.default)("text-body-medium text-wrap content-default width-full [overflow-wrap:anywhere]")
            }, p) : s.default.createElement("span", {
                className: "text-body-medium text-wrap content-default block min-width-0 max-width-full [overflow-wrap:anywhere]"
            }, p, j)), !U && !p && j), U && B && R), !U && (B || C) && s.default.createElement("div", {
                className: "flex items-center justify-end gap-small wrap shrink-0 max-width-full margin-left-auto"
            }, B && R, O), U && O && s.default.createElement("div", {
                className: "shrink-0"
            }, O)))
        });
    e.s(["FeedbackBanner", 0, c])
}, 808048, e => {
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
            var o, d, u;
            let {
                children: c,
                className: m,
                size: p,
                color: f = "Emphasis",
                variant: g = "Standalone",
                underline: v = "hover",
                isExternal: h,
                asChild: y,
                ...b
            } = e, A = (d = null != (o = b.as) ? o : "a", u = "button" === b.as ? void 0 : b.target, void 0 !== h ? h : "button" !== d && void 0 !== u && !r.has(u)), T = (0, t.default)("foundation-web-link", "button" === b.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || A) && "inline-flex items-center gap-xsmall", void 0 !== p && s[p], i[f], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), x = A ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (y) {
                let {
                    as: e,
                    ...t
                } = b, r = a.default.Children.only(c);
                return a.default.isValidElement(r) ? a.default.createElement(n.Slot, {
                    ref: l,
                    ...t,
                    className: T
                }, a.default.cloneElement(r, {}, a.default.createElement(a.default.Fragment, null, r.props.children, x))) : null
            }
            if ("button" === b.as) {
                let {
                    as: e,
                    type: t,
                    ...n
                } = b;
                return a.default.createElement("button", {
                    ref: l,
                    type: null != t ? t : "button",
                    ...n,
                    className: T
                }, c, x)
            }
            let {
                as: w,
                ...I
            } = b;
            return a.default.createElement("a", {
                ref: l,
                ...I,
                className: T
            }, c, x)
        });
    l.displayName = "Link", e.s(["Link", 0, l])
}, 339338, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        n = e.i(734463);
    let r = e => {
        var t, a, n, r, s, i;
        let l = null != (t = null == (n = (r = window).matchMedia) || null == (a = n.call(r, "(pointer: coarse)")) ? void 0 : a.matches) && t,
            o = null == (s = document.activeElement) ? void 0 : s.matches(":focus-visible");
        if (l && !o) return void e.preventDefault();
        let d = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        d && (e.preventDefault(), d.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: r,
            onOpenChange: s,
            children: i
        } = e;
        return a.createElement(n.Root, {
            open: t,
            defaultOpen: r,
            onOpenChange: s
        }, i)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: r,
            children: s
        } = e;
        return a.createElement(n.Anchor, {
            asChild: t,
            className: r
        }, s)
    }, "PopoverContent", 0, function(e) {
        let {
            side: s = "bottom",
            align: i = "center",
            sideOffset: l = 4,
            className: o,
            children: d,
            ariaLabel: u,
            onOpenAutoFocus: c,
            ...m
        } = e;
        return a.createElement(n.Portal, null, a.createElement(n.Content, {
            side: s,
            align: i,
            sideOffset: l,
            ...m,
            "aria-label": null != u ? u : m["aria-label"],
            onOpenAutoFocus: null != c ? c : r,
            className: (0, t.default)("foundation-web-portal-zindex", o)
        }, d))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: r,
            className: s,
            children: i
        } = e;
        return a.createElement(n.Trigger, {
            asChild: t,
            disabled: r,
            className: s
        }, i)
    }])
}, 176148, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = {
            Small: {
                dimension: 16,
                strokeWidth: 2,
                textClass: "text-caption-small"
            },
            Medium: {
                dimension: 32,
                strokeWidth: 3,
                textClass: "text-caption-small",
                valueContainerSize: 36
            },
            Large: {
                dimension: 48,
                strokeWidth: 4,
                textClass: "text-caption-medium",
                valueContainerSize: 52
            }
        },
        r = a.default.forwardRef((e, r) => {
            let {
                className: s,
                size: i = "Large",
                variant: l = "Determinate",
                value: o = 0,
                showValue: d = !1,
                ariaLabel: u,
                ...c
            } = e, {
                dimension: m,
                strokeWidth: p,
                textClass: f,
                valueContainerSize: g
            } = n[i], v = (m - p) / 2, h = 2 * Math.PI * v, y = m / 2, b = Math.min(100, Math.max(0, o)), A = d && void 0 !== g ? g : m, T = "Determinate" === l;
            return a.default.createElement("div", {
                ref: r,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", s),
                role: "progressbar",
                "aria-label": u,
                "aria-valuemin": T ? 0 : void 0,
                "aria-valuemax": T ? 100 : void 0,
                "aria-valuenow": T ? b : void 0,
                style: {
                    width: A,
                    height: A
                },
                ...c
            }, a.default.createElement("svg", {
                width: m,
                height: m,
                viewBox: "0 0 ".concat(m, " ").concat(m),
                className: "relative"
            }, a.default.createElement("circle", {
                cx: y,
                cy: y,
                r: v,
                fill: "none",
                strokeWidth: p,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), a.default.createElement("circle", {
                cx: y,
                cy: y,
                r: v,
                fill: "none",
                strokeWidth: p,
                strokeDasharray: T ? h : "".concat(.75 * h, " ").concat(.25 * h),
                strokeDashoffset: T ? h * (1 - b / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.default)(!T && "foundation-web-progress-circle-indeterminate"),
                style: T ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), T && d && "Large" === i && a.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", f),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(b)), a.default.createElement("span", null, "%")))
        });
    r.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, r])
}, 951336, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(631719),
        n = e.i(197649),
        r = e.i(416340);
    let s = (0, r.createContext)(null),
        i = e => {
            let t = (0, r.useContext)(s);
            if (!t) throw Error("".concat(e, " must be used within a <Table>"));
            return t
        },
        l = {
            XSmall: "height-800",
            Small: "height-1200",
            Medium: "height-1500"
        },
        o = {
            XSmall: "padding-x-medium",
            Small: "padding-x-large",
            Medium: "padding-x-xlarge"
        },
        d = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        u = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        c = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        m = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        p = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        f = (0, r.forwardRef)((e, t) => {
            let {
                children: a,
                size: i = "Medium",
                variant: l = "Divided",
                className: o,
                ...d
            } = e, u = (0, r.useMemo)(() => ({
                size: i,
                variant: l
            }), [i, l]), c = "Framed" === l;
            return r.default.createElement(s.Provider, {
                value: u
            }, r.default.createElement("div", {
                className: (0, n.default)("width-full bg-surface-100", c && "radius-medium clip stroke-standard stroke-default")
            }, r.default.createElement("table", {
                ref: t,
                className: (0, n.default)("foundation-web-table width-full content-default", o),
                ...d
            }, a)))
        });
    f.displayName = "Table";
    let g = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: s,
            ...l
        } = e;
        return i("TableHeader"), r.default.createElement("thead", {
            ref: t,
            className: (0, n.default)("foundation-web-table-header", s),
            ...l
        }, a)
    });
    g.displayName = "TableHeader";
    let v = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: s,
            ...l
        } = e;
        return i("TableBody"), r.default.createElement("tbody", {
            ref: t,
            className: (0, n.default)("foundation-web-table-body", s),
            ...l
        }, a)
    });
    v.displayName = "TableBody";
    let h = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: s,
            isInteractive: l = !1,
            isHoverable: o = !1,
            isSelected: d = !1,
            isDisabled: u = !1,
            onClick: c,
            onKeyDown: m,
            tabIndex: p,
            role: f,
            ...g
        } = e;
        i("TableRow");
        let v = l ? {
            role: null != f ? f : "row",
            tabIndex: null != p ? p : 0,
            onClick: u ? void 0 : c,
            onKeyDown: e => {
                u || (null == m || m(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == c || c(e)))
            }
        } : {
            role: f,
            tabIndex: p,
            onClick: c,
            onKeyDown: m
        };
        return r.default.createElement("tr", {
            ref: t,
            "aria-selected": l ? d : void 0,
            "aria-disabled": !!l && !!u || void 0,
            "data-selected": d || void 0,
            className: (0, n.default)("foundation-web-table-row", (l || o) && "hover:bg-shift-100", l && !u && "cursor-pointer", l && u && "opacity-disabled pointer-events-none", d && "bg-shift-200", s),
            ...v,
            ...g
        }, a)
    });
    h.displayName = "TableRow";
    let y = (0, r.forwardRef)((e, a) => {
        let {
            children: s,
            className: l,
            sortDirection: c,
            onSort: f,
            align: g = "start",
            sortLabel: v,
            scope: h,
            ...y
        } = e, {
            size: b
        } = i("TableHeaderCell"), A = !!f, T = null != c ? c : "none", x = A && "none" !== T && r.default.createElement(t.Icon, {
            name: "ascending" === T ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), w = r.default.createElement("div", {
            className: (0, n.default)("flex items-center gap-xsmall", u[b], "content-muted", p[g])
        }, "end" === g && x, r.default.createElement("span", {
            className: "text-truncate-end"
        }, s), "end" !== g && x), I = "string" == typeof s ? "Sort by ".concat(s) : void 0;
        return r.default.createElement("th", {
            ref: a,
            scope: null != h ? h : "col",
            "aria-sort": A ? T : void 0,
            className: (0, n.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", d[b], o[b], m[g], "content-muted", l),
            ...y
        }, A ? r.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: f,
            "aria-label": null != v ? v : I
        }, w) : w)
    });
    y.displayName = "TableHeaderCell";
    let b = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: s,
            align: d = "start",
            ...u
        } = e, {
            size: p
        } = i("TableCell");
        return r.default.createElement("td", {
            ref: t,
            className: (0, n.default)("foundation-web-table-cell foundation-web-table-row-divider", l[p], o[p], c[p], m[d], "content-default", s),
            ...u
        }, a)
    });
    b.displayName = "TableCell";
    let A = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        T = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        x = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        w = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        I = {
            XSmall: "gap-xsmall",
            Small: "gap-xsmall",
            Medium: "gap-small"
        },
        S = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "Small"
        },
        E = (0, r.forwardRef)((e, t) => {
            let {
                size: s = "Medium",
                page: i,
                rowsPerPage: l,
                totalRows: o,
                rowsPerPageOptions: d = [10, 25, 50],
                onPageChange: u,
                onRowsPerPageChange: c,
                rowsPerPageLabel: m = "Rows per page",
                firstPageLabel: p = "First page",
                previousPageLabel: f = "Previous page",
                nextPageLabel: g = "Next page",
                lastPageLabel: v = "Last page",
                rangeLabel: h,
                className: y,
                ...b
            } = e, E = Math.max(1, Math.ceil(o / l)), C = 0 === i, k = i >= E - 1, N = 0 === o ? 0 : i * l + 1, M = Math.min((i + 1) * l, o), D = (0, r.useCallback)(e => {
                let t = Number(e.target.value);
                null == c || c(t), u(0)
            }, [c, u]), P = S[s];
            return r.default.createElement("div", {
                ref: t,
                className: (0, n.default)("flex items-center justify-end", A[s], T[s], y),
                ...b
            }, r.default.createElement("div", {
                className: "flex items-center gap-large"
            }, r.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, c && r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: (0, n.default)(x[s], "content-default")
            }, m), r.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, r.default.createElement("select", {
                className: (0, n.default)("foundation-web-table-pagination-select", x[s], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === s ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: l,
                onChange: D,
                "aria-label": m
            }, d.map(e => r.default.createElement("option", {
                key: e,
                value: e
            }, e))))), r.default.createElement("span", {
                className: (0, n.default)(w[s], "content-default")
            }, h ? h(N, M, o) : "".concat(N, "-").concat(M, " of ").concat(o))), r.default.createElement("div", {
                className: (0, n.default)("flex items-center", I[s])
            }, r.default.createElement(a.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: p,
                size: P,
                variant: "Utility",
                isDisabled: C,
                onClick: () => u(0)
            }), r.default.createElement(a.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: f,
                size: P,
                variant: "Utility",
                isDisabled: C,
                onClick: () => u(i - 1)
            }), r.default.createElement(a.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: g,
                size: P,
                variant: "Utility",
                isDisabled: k,
                onClick: () => u(i + 1)
            }), r.default.createElement(a.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: v,
                size: P,
                variant: "Utility",
                isDisabled: k,
                onClick: () => u(E - 1)
            }))))
        });
    E.displayName = "TablePagination", e.s(["Table", 0, f, "TableBody", 0, v, "TableCell", 0, b, "TableHeader", 0, g, "TableHeaderCell", 0, y, "TablePagination", 0, E, "TableRow", 0, h])
}, 67252, e => {
    "use strict";
    var t = e.i(823981),
        a = e.i(39210),
        n = e.i(908202),
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
        d = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        u = s.default.forwardRef((e, u) => {
            let {
                size: c,
                variant: m = "Standard",
                label: p,
                value: f,
                defaultValue: g,
                isDisabled: v,
                hasError: h,
                helperText: y,
                className: b,
                style: A,
                textareaClassName: T,
                textareaStyle: x,
                id: w,
                ...I
            } = e, S = (0, a.default)(), E = w || S, C = "".concat(E, "-description"), k = null != c ? c : "Large";
            return s.default.createElement("div", {
                className: (0, r.default)("flex fill flex-col width-full gap-small", {
                    [t.disabledOpacity]: v
                }, b),
                style: A
            }, p && s.default.createElement("label", {
                htmlFor: E,
                className: (0, r.default)(o[k], "content-emphasis")
            }, p), s.default.createElement("textarea", {
                ref: u,
                id: E,
                "data-testid": "text-area-container",
                style: x,
                className: (0, r.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", n.INPUT_BACKGROUND_BY_VARIANT[m], n.INPUT_STROKE_BY_VARIANT[m], h ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", d[k], i[k], l[k], T),
                value: f,
                defaultValue: null == f ? g : void 0,
                disabled: v,
                "aria-describedby": y ? C : void 0,
                ...I
            }), y && s.default.createElement("span", {
                id: C,
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": h,
                    "content-default": !h
                })
            }, y))
        });
    u.displayName = "TextArea", e.s(["TextArea", 0, u])
}]);

//# debugId=e6dce12e-8478-7e08-b827-4ae598c64a9b
//# sourceMappingURL=012k27znx_1a1.js.map