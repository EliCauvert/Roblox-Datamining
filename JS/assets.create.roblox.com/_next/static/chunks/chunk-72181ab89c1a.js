;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9693ef89-0e13-78f7-0898-0743107398b3")
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
    e.s(["isAssetAccessRequestsEnabled", 0, r, "isAssetDependenciesViewerEnabled", 0, s, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, i, "isModelCustomThumbnailUploadEnabled", 0, n, "isPricingEligibilityV2Enabled", 0, l])
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
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, l, "isMomentsSitetestUrlParsingEnabled", 0, n, "isMomentsUploadEnabled", 0, r, "isMomentsUploadLanguageSelectEnabled", 0, i, "isTextDocumentEnabled", 0, s])
}, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(540459),
        n = e.i(79187),
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
    let c = (0, n.withTranslation)(e => {
        let {
            children: n
        } = e, {
            user: l
        } = (0, s.useAuthentication)(), c = (0, o.useCurrentGroup)(), [m, p] = (0, a.useState)(void 0), [f, g] = (0, a.useState)(), [v, h] = (0, a.useState)(), [y, b] = (0, a.useState)(), [A, T] = (0, a.useState)(), x = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == c ? void 0 : c.id) ? e : 0) !== 0
        }, [c]), [I, S] = (0, a.useState)(void 0), C = void 0 === m || void 0 === f || void 0 === v && x, w = (0, a.useCallback)(async () => {
            try {
                if (x && (null == c ? void 0 : c.id)) {
                    let e = await (0, u.getGroupCreatorMetadata)(c.id);
                    p(e);
                    return
                }
                if (!x && (null == l ? void 0 : l.id)) {
                    let e = await (0, u.getUserCreatorMetadata)();
                    p(e);
                    return
                }
            } catch (e) {
                return
            }
            p(null)
        }, [null == c ? void 0 : c.id, x, null == l ? void 0 : l.id]), E = (0, a.useCallback)(async () => {
            if (x && I || !x) try {
                let e = await (0, u.getRequirements)();
                g(e.requirements);
                return
            } catch (e) {
                return
            }
            g(null)
        }, [I, x]), P = (0, a.useCallback)(async () => {
            if (x && (null == c ? void 0 : c.id)) try {
                let e = await (0, u.getGroupEligibility)(c.id);
                h(e.isEligible)
            } catch (e) {
                h(!1)
            }
        }, [c, x]);
        (0, a.useEffect)(() => {
            C ? T(void 0) : x && !I ? T(!1) : T(!1 === y)
        }, [x, I, y, C]), (0, a.useEffect)(() => {
            (async () => {
                if (x && (null == c ? void 0 : c.id)) {
                    var e;
                    return null == (e = (await i.default.getGroupInfo(c.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && S(e === l.id)
            })
        }, [null == c ? void 0 : c.id, x, l]), (0, a.useEffect)(() => {
            C || !f || x && !I ? b(void 0) : b((null == f ? void 0 : f.length) === 0 || (null == f ? void 0 : f.length) === 1 && f[0] === r.Requirements.Payable)
        }, [I, x, C, f]), (0, a.useEffect)(() => {
            w()
        }, [w]), (0, a.useEffect)(() => {
            E()
        }, [E]), (0, a.useEffect)(() => {
            P()
        }, [P]);
        let k = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: C,
            requiresActionToJoinProgram: A,
            compliantWithAllUserRequirements: y,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != f ? f : void 0,
            isCurrentUserGroupOwner: I,
            isGroupEligible: null != v ? v : void 0
        }), [C, A, y, m, f, I, v]);
        return (0, t.jsx)(d.Provider, {
            value: k,
            children: n
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, c, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(d)
    }])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        r = e.i(416340),
        n = e.i(79187),
        s = e.i(423107),
        i = e.i(514455),
        l = e.i(982234),
        o = e.i(199834),
        u = e.i(872204),
        d = e.i(988012),
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
    let A = (0, n.withTranslation)(e => {
        let t, g, b, A, {
                trackingPage: T,
                alertRedesignVariant: x
            } = e,
            {
                settings: {
                    ageVerificationUpsellGetStartedUrl: I,
                    ageVerificationUpsellViewDetailsUrl: S,
                    establishTrustUpsellGetStartedUrl: C,
                    establishTrustUpsellViewDetailsUrl: w
                }
            } = (0, v.useSettings)(),
            {
                isBannerVisible: E,
                isHighPriority: P,
                variant: k,
                dismissBanner: N
            } = (0, h.useAgeVerificationUpsellContext)(),
            {
                classes: M
            } = y(),
            D = (0, r.useRef)(null),
            {
                unifiedLogger: F
            } = (0, f.useUnifiedLoggerProvider)(),
            {
                translate: U
            } = (0, n.useTranslation)(),
            L = (0, r.useCallback)(() => {
                E && F.logImpressionEvent({
                    eventName: p.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: T,
                        variant: k,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [F, T, k, x, E]);
        (0, m.default)(D, L);
        let B = (0, r.useCallback)(() => {
                F.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "viewDetails",
                        variant: k,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [F, T, k, x]),
            R = (0, r.useCallback)(() => {
                F.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "callToAction",
                        variant: k,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [F, T, k, x]),
            j = (0, r.useCallback)(() => {
                F.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "dismiss",
                        variant: k,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                }), N()
            }, [F, N, T, k, x]);
        return ("establishTrust" === k ? (t = "Title.EstablishTrustBanner", g = "Label.EstablishTrustBanner2", b = C, A = w) : (t = "Title.AgeVerificationBanner", g = "Label.AgeVerificationBanner", b = I, A = S), E) ? (0, a.jsx)("div", {
            ref: D,
            children: (0, a.jsxs)(s.Alert, {
                className: M.alertContainer,
                severity: "ageVerification" === k && P ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(u.Button, {
                    href: b,
                    onClick: R,
                    className: M.getStarted,
                    color: "inherit",
                    size: "small",
                    children: U("Label.AgeVerificationBannerGetStarted") || "Get started"
                }, "getStarted"), (0, a.jsx)(d.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: j,
                    children: (0, a.jsx)(c.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(i.AlertTitle, {
                    children: U(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: U(g)
                }), " ", (0, a.jsx)(l.Link, {
                    className: M.viewDetails,
                    href: A,
                    target: "_blank",
                    color: "inherit",
                    onClick: B,
                    children: U("Label.AgeVerificationBannerViewDetails") || "View details"
                })]
            })
        }) : null
    }, [g.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, A, "AgeVerificationUpsellPage", () => b], 714039)
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(458451),
        n = e.i(889311),
        s = e.i(823062),
        i = e.i(486736);
    let l = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        o = encodeURIComponent("studio/CollaborationSettings"),
        u = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                r = a.status % 100 * 100;
            if (!a.ok && 500 === r && t < 2) return await new Promise(e => setTimeout(e, 2 ** (t + 1) * 500)), u(e, t + 1);
            if (500 === r && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let n = await a.json();
            if (!("access" in n)) throw Error('"access" not found in response');
            return n.access
        }, d = async () => await u("".concat(l, "/v1/upsell-feature-access?nameSpace=").concat(o, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted", c = "CreatorHub.AgeVerificationBannerSettings", m = async () => {
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
        }, h = async () => await d() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: l
        } = e, {
            settings: {
                ageVerificationUpsellBannerStartDate: o,
                ageVerificationUpsellBannerEndDate: u,
                ageVerificationUpsellBannerHighPriorityDate: d
            }
        } = (0, i.useSettings)(), [c, m] = (0, a.useState)(!0), [y, b] = (0, a.useState)("doNotShow"), {
            isFetched: A,
            user: T
        } = (0, r.useRobloxAuthentication)(), {
            unifiedLogger: x
        } = (0, s.useUnifiedLoggerProvider)(), {
            isHighPriority: I,
            isEnabled: S
        } = (0, a.useMemo)(() => {
            let e = v(o),
                t = v(u),
                a = v(d),
                r = new Date;
            return {
                isHighPriority: a <= r,
                isEnabled: e <= r && r < t
            }
        }, [u, o, d]), C = (0, a.useCallback)(async () => {
            await f(), m(!0)
        }, [m]);
        (0, a.useEffect)(() => {
            S && A && (null == T ? void 0 : T.id) && (async () => {
                let e = !1;
                try {
                    e = await p()
                } catch (e) {
                    x.logErrorEvent({
                        eventName: n.default.AgeVerificationUpsellBannerError,
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
                        eventName: n.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                b(t)
            })().catch(e => {
                x.logErrorEvent({
                    eventName: n.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [S, A, T, x]);
        let w = (0, a.useMemo)(() => {
            let e = S && "doNotShow" !== y;
            return {
                isBannerVisible: e && !c,
                isBannerEligible: e,
                isHighPriority: I,
                variant: "doNotShow" !== y ? y : "ageVerification",
                dismissBanner: C
            }
        }, [S, y, c, I, C]);
        return (0, t.jsx)(g.Provider, {
            value: w,
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
        r = e.i(419652);
    e.s(["default", 0, e => {
        let {
            children: n
        } = e, [s, i] = (0, a.useState)(), l = e => {
            i(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: s,
            updateDroppedFile: l
        }), [s]);
        return (0, t.jsx)(r.default.Provider, {
            value: o,
            children: n
        })
    }])
}, 799972, e => {
    "use strict";
    var t = e.i(284856),
        a = e.i(671376);
    let {
        docs: r
    } = e.i(829425).creatorHub, n = {
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
    }, "assetTypeInfoTextMessage", 0, s, "dashboardAssetTypeToOpenCloudAssetType", 0, n, "getInfoUrl", 0, e => {
        switch (e) {
            case a.Asset.Decal:
                return r.getDecalReferenceUrl();
            case a.Asset.TShirt:
            case a.Asset.Shirt:
            case a.Asset.Pants:
                return r.getClassicClothingUrl();
            case a.Asset.Audio:
                return r.getAudioAssetsUrl();
            case a.Asset.Video:
                return r.getAssetsUrl();
            case a.Asset.AvatarBackground:
                return r.getAvatarItemsUrl();
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
        r = e.i(237401),
        n = e.i(450727),
        s = e.i(608972),
        i = e.i(197649),
        l = e.i(79187),
        o = e.i(169722),
        u = e.i(29929),
        d = e.i(889311),
        c = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        f = e.i(114209),
        g = e.i(373736),
        v = e.i(917852),
        h = e.i(576069),
        y = e.i(351111);
    let b = "".concat("https://assets.create.roblox.com/e8ff258305912c678ed7687007b3d9ecc0cfa8b6/assets", "/home/publish_eligibility_banner.webp"),
        A = (0, l.withTranslation)(e => {
            var A;
            let {
                universeId: T,
                showCallToAction: x = !0
            } = e, I = (0, r.useRouter)(), {
                translateWithNamespace: S
            } = (0, l.useTranslation)(), {
                params: C,
                isFetched: w
            } = (0, m.useIXPParameters)(u.IXPLayers.CreatorHubCreationsPermission), E = C[u.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: P
            } = (0, f.useCurrentGame)(), k = null == P ? void 0 : P.id, N = null != T ? T : k && k > 0 ? k : void 0, {
                data: M,
                isLoading: D,
                isFetching: F
            } = (0, h.useCreatorEligibility)(), U = (0, a.useRef)(!1), [L, B] = (0, a.useState)(!1), R = (null == M ? void 0 : M.ageBracket) === n.AgeBracketEnum.Over18, j = (null == M ? void 0 : M.ageBracket) === n.AgeBracketEnum.Between13And18, O = null != (A = null == M ? void 0 : M.creatorEligibility.includes(n.CreatorEligibilityEnum.IdVerified)) && A, V = R || j, _ = w && E && !(D || F) && !!M && !O;
            (0, a.useEffect)(() => {
                _ && !U.current && (U.current = !0, c.default.logImpressionEvent({
                    eventName: d.default.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: V ? "start" : "viewDetails",
                        ctaHidden: String(!x),
                        ...N ? {
                            universeId: String(N)
                        } : {}
                    }
                }))
            }, [_, x, V, N]);
            let G = (0, a.useCallback)(() => {
                if (!_) return;
                let e = V ? "start" : "viewDetails";
                (c.default.logClickEvent({
                    eventName: d.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...N ? {
                            universeId: String(N)
                        } : {}
                    }
                }), j) ? B(!0): V || I.push("/settings/eligibility/publishing-permissions")
            }, [_, j, I, V, N]);
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
                                children: [S(p.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: S(p.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, i.clsx)(y.default.buttonRow, "flex gap-small"),
                            children: x ? R ? (0, t.jsx)(s.Button, {
                                as: "a",
                                href: v.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: S(p.TranslationNamespace.AudienceReach, V ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(s.Button, {
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: S(p.TranslationNamespace.AudienceReach, V ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), j ? (0, t.jsx)(g.default, {
                    open: L,
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
    var t, a, r = e.i(102211),
        n = e.i(272593),
        s = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.TextDocument = "TextDocument", t.Video = "Video", t),
        i = ((a = {}).Group = "groups", a.User = "users", a);
    let l = new r.CreatorInventoryApi((0, n.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => s, "CreatorInventoryScopeType", () => i, "default", 0, l])
}, 445550, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(309999),
        r = e.i(307529),
        n = e.i(272593);
    let s = {
            [r.default.Model]: a.CategoryType.Model,
            [r.default.Plugin]: a.CategoryType.Plugin
        },
        i = {
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
            async getCreations(e, t, a, r, n, i, l) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: s[t],
                    limit: r,
                    cursor: n,
                    separateModelsAndPackages: i,
                    includeSharedAssets: l
                }) : this.toolboxApi.toolboxGetUserCreationAssets({
                    userId: e,
                    assetType: s[t],
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
    e.s(["assetTypeIdToAssetType", 0, i, "default", 0, l, "toolboxServiceItemDetailsLimit", 0, 30])
}, 790806, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(176936),
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
        s = new a.UsersApi((0, r.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: s
    }, "default", 0, n])
}, 131385, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(780880),
        r = e.i(339544),
        n = e.i(643093),
        s = e.i(130778),
        i = e.i(157310),
        l = e.i(913893),
        o = e.i(507766),
        o = o,
        u = e.i(671376),
        d = e.i(486736),
        c = e.i(117236);
    let m = function() {
        let e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
            {
                settings: a
            } = (0, d.useSettings)(),
            r = (0, i.useQuery)({
                queryKey: ["getTaxonomyCategories", o.V1ItemsCategoriesGetCategoryDomainEnum.NUMBER_3],
                queryFn: () => l.default.getItemCategories(o.V1ItemsCategoriesGetCategoryDomainEnum.NUMBER_3),
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
                    enableMakeupAssets: a.enableMakeupAssets && null != (e = null == m ? void 0 : m.has(u.Asset.EyeMakeup)) && e,
                    enableAvatarBackgrounds: a.enableAvatarBackgrounds && null != (t = null == m ? void 0 : m.has(u.Asset.AvatarBackground)) && t
                }
            }, [a.enableMakeupAssets, a.enableAvatarBackgrounds, m]),
            f = (0, t.useMemo)(() => (0, n.transformCreatorDashboardTree)(r.data, p), [r.data, p]),
            g = (0, t.useMemo)(() => (0, n.buildTaxonomyL1Options)(f), [f]);
        return {
            response: r.data,
            categories: f,
            l1Options: g,
            isLoading: r.isLoading || s.isLoading,
            isError: r.isError
        }
    };
    e.s(["default", 0, e => {
        var i, l, o;
        let [{
            activeTab: u,
            filterIndex: d
        }] = (0, a.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: c,
            categories: p,
            isLoading: f
        } = m(e), g = (0, s.isAllAssetTypesActiveTab)(u) || (0, s.isRecentsActiveTab)(u) || (0, s.isAvatarLooksActiveTab)(u) ? void 0 : null != (i = (0, s.parseTaxonomyActiveTab)(u)) ? i : null == (o = c[0]) ? void 0 : o.taxonomyKey, v = (0, t.useMemo)(() => (0, n.findL1Category)(p, g), [p, g]), h = (0, t.useMemo)(() => (0, n.buildTaxonomyL2Options)(v), [v]), y = parseInt(null != (l = null == d ? void 0 : d.toString()) ? l : "", 10), b = (0, r.isValidIndex)(y, h) ? y : 0, A = (0, t.useMemo)(() => {
            if (v) return h.length > 0 ? h[b] : v.webStableId ? (0, n.categoryToDropdown)(v) : void 0
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
        r = e.i(130778);
    e.s(["default", 0, e => {
        let [{
            activeTab: n
        }] = (0, t.useQueryParams)(["activeTab"]), s = (0, a.default)(), i = s && (0, r.isTaxonomyActiveTab)(n), l = s && (0, r.isAvatarLooksActiveTab)(n);
        return {
            canUseTaxonomy: s && (i || (0, r.isTaxonomyEligibleAssetTab)(e)),
            isTaxonomyMode: i,
            isTaxonomyView: i && !(0, r.isAllAssetTypesActiveTab)(n) && !(0, r.isRecentsActiveTab)(n) && !(0, r.isAvatarLooksActiveTab)(n),
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
            var a, r, c;
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
                f = !1;
            m.forEach(e => {
                if (u(e, i)) {
                    t.enableMakeupAssets && (f = !0, p.push(e));
                    return
                }
                if (d(e)) {
                    if (u(e, s)) return void n.push(e);
                    p.push(e)
                }
            }), 0 !== p.length && e.webStableId && o.push({
                key: e.webStableId,
                name: null != (r = e.name) ? r : "",
                webStableId: e.webStableId,
                assetTypeIds: e.assetTypeIds,
                isMakeup: f,
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
        s = e.i(692587),
        i = e.i(117236);
    let l = "AvatarItems",
        o = "".concat(l, "-"),
        u = n.Asset.HairAccessory;

    function d(e) {
        let t = (0, s.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let c = "looks",
        m = new Set(null != (t = null == (r = i.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = r.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

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
            nextAssetType: r
        } = e;
        return t && a && p(r)
    }])
}, 456810, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(959222),
        r = e.i(54842),
        n = e.i(252842),
        s = e.i(671376);
    let i = {
            [s.Asset.Place]: a.SearchSortParameter.LastUpdated,
            [s.Asset.UpcomingEvent]: r.EventSortBy.StartUtc,
            [s.Asset.PastEvent]: r.EventSortBy.StartUtc,
            [s.Asset.DraftEvent]: r.EventSortBy.StartUtc
        },
        l = {
            sort: i,
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
        r = e.i(899441),
        n = e.i(361738),
        s = e.i(671376),
        i = ((t = {}).All = "All", t);
    let l = [r.CreatorInventoryAssetType.Model, r.CreatorInventoryAssetType.Plugin, r.CreatorInventoryAssetType.Audio, r.CreatorInventoryAssetType.Decal, r.CreatorInventoryAssetType.Image, r.CreatorInventoryAssetType.Video, r.CreatorInventoryAssetType.Mesh, r.CreatorInventoryAssetType.MeshPart, r.CreatorInventoryAssetType.Animation],
        o = [...l, r.CreatorInventoryAssetType.TextDocument],
        u = new Set([r.CreatorInventoryAssetType.Audio, r.CreatorInventoryAssetType.Decal, r.CreatorInventoryAssetType.MeshPart, r.CreatorInventoryAssetType.TextDocument, r.CreatorInventoryAssetType.Video]),
        d = new Set(o),
        c = new Set([r.CreatorInventoryAssetType.TextDocument]),
        m = new Set(["All", n.CreatorInventorySourceType.Created, n.CreatorInventorySourceType.Purchased, n.CreatorInventorySourceType.Shared]),
        p = new Set([s.Asset.Animation, s.Asset.Audio, s.Asset.Decal, s.Asset.Image, s.Asset.Mesh, s.Asset.MeshPart, s.Asset.Model, s.Asset.Plugin, s.Asset.Video]),
        f = {
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
        g = {
            [r.CreatorInventoryAssetType.Animation]: a.AssetType.Animation,
            [r.CreatorInventoryAssetType.Audio]: a.AssetType.Audio,
            [r.CreatorInventoryAssetType.Decal]: a.AssetType.Decal,
            [r.CreatorInventoryAssetType.Image]: a.AssetType.Image,
            [r.CreatorInventoryAssetType.Mesh]: a.AssetType.Mesh,
            [r.CreatorInventoryAssetType.MeshPart]: a.AssetType.MeshPart,
            [r.CreatorInventoryAssetType.Model]: a.AssetType.Model,
            [r.CreatorInventoryAssetType.Plugin]: a.AssetType.Plugin,
            [r.CreatorInventoryAssetType.TextDocument]: a.AssetType.TextDocument,
            [r.CreatorInventoryAssetType.Video]: a.AssetType.Video
        },
        v = {
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
        h = {
            createdDetails: n.CreatorInventorySourceType.Created,
            purchasedDetails: n.CreatorInventorySourceType.Purchased,
            sharedDetails: n.CreatorInventorySourceType.Shared
        },
        y = {
            [a.State.Active]: "Active",
            [a.State.Archived]: "Archived"
        },
        b = e => !0 === e ? o : l,
        A = e => {
            if (null == e) return;
            let t = e instanceof Date ? e : new Date(e);
            return Number.isNaN(t.getTime()) ? void 0 : t
        };
    e.s(["DevelopmentItemsSourceFilter", () => i, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: r.CreatorInventoryScopeType.Group,
        id: t
    } : null != e ? {
        type: r.CreatorInventoryScopeType.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        assetTypes: [g[t]],
        ...e.type === r.CreatorInventoryScopeType.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(n.CreatorInventorySourceType.Created), "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getDevelopmentItemsAssetTypes", 0, b, "getDevelopmentItemsSearchAssetTypes", 0, (e, t) => [e, ...b(t).filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => f[e], "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: r
        } = e;
        return t.trim().length > 0 || a || r !== n.CreatorInventorySourceType.Created
    }, "hasDevelopmentItemCreatorStorePage", 0, e => e !== r.CreatorInventoryAssetType.TextDocument, "hasDevelopmentItemThumbnail", 0, e => e !== r.CreatorInventoryAssetType.TextDocument, "isDevelopmentItemAsset", 0, (e, t) => e === s.Asset.TextDocument ? !0 === t : p.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && u.has(e), "isDevelopmentItemsAssetTypeSelection", 0, (e, t) => null != e && !!d.has(e) && (!c.has(e) || !0 === t), "isDevelopmentItemsSourceSelection", 0, e => null != e && m.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, r, n, s, i, l;
        let o, u = null == (r = e.assetItem) ? void 0 : r.asset;
        if (null == u) return;
        let d = "number" == typeof u.assetId ? u.assetId : Number.parseInt(null != (t = u.assetId) ? t : "", 10);
        if (Number.isNaN(d)) return;
        let c = null == (n = u.displayName) ? void 0 : n.trim();
        return {
            id: null != (a = e.path) ? a : d.toString(),
            assetId: d,
            assetType: (e => {
                if (null != e) return v[e.toString().toUpperCase()]
            })(u.assetType),
            created: A(u.createTime),
            isPackage: (null == (s = e.assetItem) ? void 0 : s.isPackage) === !0,
            name: null == c || 0 === c.length ? d.toString() : c,
            sources: (l = null == (i = e.assetItem) ? void 0 : i.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let r = h[t];
                    null != r && o.add(r)
                })
            }), [...o]),
            state: null == u.state ? void 0 : y[u.state],
            updated: A(u.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let r = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => e.assetType === a && !r.has(e.assetId))]
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
            data: r,
            isFetched: n
        } = (0, a.default)(t.default);
        if (n) return null != (e = null == r ? void 0 : r.showAvatarLooksInCreations) && e
    }])
}, 723538, e => {
    "use strict";
    var t = e.i(692734),
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
    var t = e.i(692734),
        a = e.i(9436);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: r
        } = (0, t.useFlag)(a.isTextDocumentEnabled);
        if (e) return r
    }])
}, 665357, e => {
    "use strict";
    var t = e.i(692734),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: r
        } = (0, t.useFlag)(a.enableUgcFolders);
        if (e) return r
    }])
}, 427149, e => {
    "use strict";
    var t = e.i(799972),
        a = e.i(671376),
        r = e.i(759283),
        n = e.i(475360),
        s = e.i(949599),
        i = e.i(117236);
    let l = i.default.reduce((e, t) => {
            var a;
            return t.submenuItems || e.set(t.type, {
                menuItem: t
            }), null == (a = t.submenuItems) || a.forEach(a => {
                if (a.submenuItems) {
                    var r;
                    null == (r = a.submenuItems) || r.forEach(r => {
                        e.set(r.type, {
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
        isMenuItemEnabled(e, r, s, i, l, o, p, f, g, v) {
            var h, y;
            return ((null == e ? void 0 : e.type) !== a.Asset.TextDocument || !!v) && ((null == e ? void 0 : e.type) === a.Asset.AllCatalogAsset ? null != p && p : (null == e ? void 0 : e.type) === a.Asset.SharedExperiences ? null == s : (null == e ? void 0 : e.type) === a.Asset.Moments ? null != o && o : (null == e ? void 0 : e.itemType) === n.Item.Bundle || ((null == e ? void 0 : e.type) === d ? null != f && f : (null == e ? void 0 : e.type) === c ? r.enableAvatarBackgrounds && null != (h = null == l ? void 0 : l.has(e.type)) && h : (null == e ? void 0 : e.type) === m ? null != g && g : (null == e ? void 0 : e.type) === u ? r.enableMakeupAssets && null != (y = null == l ? void 0 : l.has(e.type)) && y : (null == e ? void 0 : e.type) === void 0 || !!(0, t.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === i || null != i && i))
        },
        getValidMenuState(e, t, a, r, n, s, i, l, o, d, m) {
            var p, f, g, v, h, y;
            let b, A, T = (null == (p = t.submenuItem) ? void 0 : p.type) !== u && (null == (f = t.submenuItem) ? void 0 : f.type) !== c || void 0 !== s;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, r, n, s, i, l, o, d, m)) {
                if (void 0 !== t.submenuItem && T && !this.isMenuItemEnabled(t.submenuItem, a, r, n, s, i, l, o, d, m))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            u = 0;
                        for (; u < (null == (v = t.menuItem.submenuItems) ? void 0 : v.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[u], a, r, n, s, i, l, o, d, m)) {
                                e = u;
                                break
                            }
                            u += 1
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
                    r = null == a ? void 0 : a.assetType;
                return (null == a ? void 0 : a.bundleType) !== void 0 || void 0 !== r && i.allowedAssetTypesForArchiving.has(r)
            }
            return i.allowedAssetTypesForArchiving.has(e)
        },
        isAssetTypeSortable: e => i.allowedAssetTypesForSorting.has(e),
        isItemTypeUploadable: e => i.allowedItemTypesForUploading.has(e),
        getAssetFullNameKey: e => r.assetFullNameKeys[e],
        getItemFullNameKey: e => r.itemFullNameKeys[e],
        getAssetType: e => e.submenuItem ? e.submenuItem.type : e.menuItem.type,
        getItemType(e) {
            return e.submenuItem && e.submenuItem.itemType ? e.submenuItem.itemType : e.menuItem.itemType ? e.menuItem.itemType : r.assetTypeToItemType[this.getAssetType(e)]
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
            value: r
        } = (0, t.useFlag)(a.enableCreatorShowcases);
        if (e) return r
    }])
}, 668091, 418564, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(109543);
    e.s(["default", 0, function() {
        return (0, t.useContext)(a.default)
    }], 668091);
    var r = e.i(221628),
        n = e.i(423107),
        s = e.i(514455),
        i = e.i(872204),
        l = e.i(447055),
        o = e.i(988012);
    let u = (0, e.i(706442).makeStyles)()(() => ({
        alertStyle: {
            width: "100%"
        }
    }));
    e.s(["default", 0, e => {
        let {
            alertTitle: a,
            alertDescription: d,
            severity: c,
            externalLink: m,
            linkLabel: p,
            allowCloseDialog: f,
            onDismiss: g
        } = e, {
            classes: {
                alertStyle: v
            }
        } = u(), [h, y] = (0, t.useState)(!0);
        return h ? (0, r.jsxs)(n.Alert, {
            severity: c,
            onClose: void 0,
            className: v,
            action: (0, r.jsxs)(r.Fragment, {
                children: [p && (0, r.jsx)(i.Button, {
                    color: "inherit",
                    size: "small",
                    href: m,
                    children: p
                }), f && (0, r.jsx)(o.IconButton, {
                    "aria-label": "Close",
                    color: "inherit",
                    size: "small",
                    onClick: () => {
                        null == g || g(), y(!1)
                    },
                    children: (0, r.jsx)(l.CloseIcon, {
                        fontSize: "small"
                    })
                })]
            }),
            children: [a && (0, r.jsx)(s.AlertTitle, {
                children: a
            }), d]
        }) : null
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
            onDragActiveHandler: s,
            onDragLeaveHandler: i,
            size: l,
            multiple: o,
            children: u,
            accept: d,
            ...c
        } = e, m = (0, a.useRef)(null), p = () => {
            m.current && m.current.click()
        }, f = e => {
            ((e instanceof Event ? e instanceof KeyboardEvent : e.nativeEvent && e.nativeEvent instanceof KeyboardEvent) ? ["Spacebar", " ", "Enter"].includes(e.key) : (console.info("The event passed in is not a keyboard event, are you using the handler in the wrong place?"), !1)) && (e.preventDefault(), p())
        }, g = u ? u(p, f, e => {
            e.preventDefault();
            let {
                dataTransfer: {
                    files: t
                }
            } = e;
            n && n(t)
        }, e => {
            e.preventDefault(), s && s()
        }, e => {
            e.preventDefault(), i && i()
        }) : null;
        return (0, t.jsxs)("div", {
            className: r,
            children: [g, (0, t.jsx)("input", {
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
        n = e.i(540513),
        s = e.i(199834),
        i = e.i(169722),
        l = e.i(706442),
        o = e.i(590108),
        u = e.i(982234),
        d = e.i(559956),
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
                variant: I = "medium",
                disableLink: S = !1,
                obfuscate: C = !1,
                hideThumbnail: w = !1,
                hideSecondaryLabel: E = !1,
                textVariant: P = "primary",
                labelTooltip: k
            } = e,
            {
                classes: {
                    container: N,
                    avatarContainer: M,
                    thumbnailItemContainer: D,
                    thumbnailBackground: F,
                    userBorderRadius: U,
                    nonUserBorderRadius: L,
                    itemText: B,
                    mutedText: R,
                    disabledThumbnail: j,
                    textContainer: O
                },
                cx: V
            } = b({
                variant: I
            }),
            {
                translate: _
            } = (0, r.useTranslation)(),
            G = (0, a.useMemo)(() => h === p.default.User ? n.ThumbnailTypes.avatarHeadshot : h === p.default.Group ? n.ThumbnailTypes.groupIcon : "Ugc" === h ? n.ThumbnailTypes.assetThumbnail : n.ThumbnailTypes.universeThumbnail, [h]),
            q = (0, a.useMemo)(() => {
                if (!S && v.id && !C) {
                    if (h === p.default.User) return f.www.getUserUrl(v.id);
                    if (h === p.default.Group) return f.www.getGroupUrl(v.id);
                    if ("Experience" === h) {
                        let e = "rootPlaceId" in v ? v.rootPlaceId : void 0;
                        return e ? f.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === h) return f.www.getCatalogUrl(v.id)
                }
            }, [S, v, C, h]);
        y ? l = y : h === p.default.User ? l = "displayName" in v ? v.displayName : void 0 : "Ugc" !== h && (l = "name" in v ? v.name : void 0);
        let K = !y && (h === p.default.User && !("displayName" in v && v.displayName) || "Ugc" === h),
            H = (0, a.useMemo)(() => (0, t.jsxs)(i.Grid, {
                container: !0,
                direction: "row",
                alignItems: "center",
                wrap: "wrap",
                children: [K ? (0, t.jsx)(d.Skeleton, {
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
                        variant: "secondary" === P ? "body1" : "compact" === I ? "captionHeader" : "large" === I ? "h2" : "h5",
                        color: x ? "disabled" : "inherit",
                        children: C ? _("Label.Other") : l
                    }), T && T.length > 0 && (0, t.jsx)(m.Tooltip, {
                        arrow: !0,
                        title: k,
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
                }), !E && (0, t.jsxs)(t.Fragment, {
                    children: [h === p.default.User && (0, t.jsx)(t.Fragment, {
                        children: "name" in v && !v.name ? (0, t.jsx)(d.Skeleton, {
                            animate: !0,
                            variant: "text",
                            width: 192,
                            height: 20
                        }) : (0, t.jsx)(s.Typography, {
                            variant: "secondary" === P ? "body2" : "captionBody",
                            className: V(O, {
                                [R]: "secondary" === P || "compact" === I
                            }),
                            color: x ? "disabled" : "inherit",
                            children: C ? _("Label.Other") : "@".concat("name" in v ? v.name : "")
                        })
                    }), (h === p.default.Group || "Experience" === h) && (0, t.jsx)(s.Typography, {
                        variant: "captionBody",
                        className: V(O, {
                            [R]: "secondary" === P || "compact" === I
                        }),
                        color: x ? "disabled" : "inherit",
                        children: C ? _("Label.Other") : v.id
                    })]
                })]
            }), [K, l, h, v, O, x, C, _, T, E, V, R, P, I, k]);
        return (0, t.jsx)(i.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: N,
            children: (null == v ? void 0 : v.id) === void 0 ? (0, t.jsx)(d.Skeleton, {
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
                        className: D,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: V(M, {
                                [U]: h === p.default.User,
                                [L]: h !== p.default.User,
                                [j]: x
                            }),
                            children: (0, t.jsx)(n.Thumbnail2d, {
                                targetId: v.id,
                                type: G,
                                imgClassName: F,
                                alt: "thumbnail",
                                returnPolicy: n.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(i.Grid, {
                        container: !0,
                        direction: "column",
                        className: N,
                        children: (0, t.jsx)(i.Grid, {
                            item: !0,
                            children: S || C ? H : (0, t.jsx)(u.Link, {
                                href: q,
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
    let r = function(e) {
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
    e.s(["default", 0, function(e, s) {
        var i;
        let l = null != (i = null == s ? void 0 : s.cacheOnly) && i,
            [o, u] = (0, t.useState)(() => l ? {
                params: r(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == s ? void 0 : s.restoreInitialValueFromCache) ? r(e) : {},
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
                    }), n(e, t)
                } catch (e) {
                    u(e => ({
                        ...e,
                        isFetched: !0,
                        status: "error"
                    }))
                }
            })()
        }, []), o
    }, "getValueFromStorage", 0, r, "writeValueToStorage", 0, n])
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

    function r(e) {
        var t, a, r, n;
        if ((null == e ? void 0 : e.mode) === "standalone") return {
            mode: "standalone",
            shouldUnmountOnClose: null == (n = e.shouldUnmountOnClose) || n
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
            shouldUnmountOnClose: null == (r = s.shouldUnmountOnClose) || r
        }
    }
    let n = r(),
        s = {
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
    e.s(["DEFAULT_RESOLVED_CONTENT_OPTIONS", 0, n, "dialogStore", 0, s])
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
                let s = r.getSnapshot().current;
                null == s || null == (t = (n = s.props).onClose) || t.call(n), a += 1, r.setState({
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
            hasNextPage: s,
            fetchNextPage: i,
            fetchLimit: l = n
        } = a, o = (0, t.useMemo)(() => {
            let t = r * n;
            return e.slice(t, t + n)
        }, [e, r, n]), u = (r + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            u && s && (null == i || i())
        }, [u, s, i]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: r = 50,
            resetKey: n
        } = e, [s, i] = (0, t.useState)(0), [l, o] = (0, t.useState)(r), [u, d] = (0, t.useState)(n);
        n !== u && (d(n), i(0));
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
            fetchNextPage: r,
            disabled: n,
            intervalMs: s = 1e3
        } = e, i = (0, t.useRef)(r);
        i.current = r, (0, t.useEffect)(() => {
            if (!a || n) return;
            i.current();
            let e = setInterval(() => {
                i.current()
            }, s);
            return () => clearInterval(e)
        }, [a, n, s])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(602635),
        r = e.i(79187),
        n = e.i(199834),
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
            items: u,
            icon: d,
            activeKey: c,
            defaultExpanded: m
        } = e, {
            classes: p
        } = o(), {
            ready: f
        } = (0, r.useTranslation)();
        return f ? (0, t.jsxs)(s.Grid, {
            classes: {
                root: p.container
            },
            children: [i && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(s.Grid, {
                    classes: {
                        root: p.headerContainer
                    },
                    children: [d && (0, t.jsx)(s.Grid, {
                        classes: {
                            root: p.icon
                        },
                        children: d
                    }), (0, t.jsx)(n.Typography, {
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
            }), u.length > 0 && (0, t.jsx)(a.NavigationTree, {
                selected: c,
                defaultExpanded: m,
                children: u.map(e => {
                    var r;
                    return (0, t.jsx)(a.NavigationTreeItem, {
                        label: e.label,
                        nodeId: e.key,
                        href: e.href,
                        adornment: e.adornment,
                        variant: "smallLabel2",
                        onClick: e.onClick,
                        children: null == (r = e.subItems) ? void 0 : r.map(r => (0, t.jsx)(a.NavigationTreeItem, {
                            label: r.label,
                            nodeId: r.key,
                            onClick: r.onClick,
                            href: r.href,
                            adornment: r.adornment
                        }, "".concat(e.key, "-").concat(r.key)))
                    }, e.key)
                })
            })]
        }) : null
    }])
}, 373736, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(608972),
        r = e.i(956728),
        n = e.i(79187),
        s = e.i(199834);
    e.s(["default", 0, e => {
        let {
            open: i,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: u
        } = e, {
            translate: d
        } = (0, n.useTranslation)();
        return (0, t.jsx)(r.Dialog, {
            open: i,
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
                    }), (0, t.jsx)(s.Typography, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(s.Typography, {
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
        r = e.i(605050);
    e.s(["useCreatorEligibility", 0, function() {
        let {
            overrideUserId: e,
            isReady: n = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: s
        } = (0, a.useAuthentication)(), i = null == s ? void 0 : s.id, l = null != e ? e : i;
        return (0, t.useQuery)({
            queryKey: ["creatorEligibility", null != l ? l : null],
            queryFn: async () => r.default.coreContentGetCreatorEligibility({
                userId: l
            }),
            enabled: n && !!l
        })
    }])
}, 812141, e => {
    "use strict";
    var t = e.i(182012),
        a = e.i(157310);
    let r = {},
        n = e => ["folders", null != e ? e : null];
    e.s(["default", 0, function(e) {
        return (0, a.useQuery)({
            queryKey: ["metadata"],
            queryFn: async () => {
                try {
                    let t = await e.getCollectiblesMetadata();
                    return null != t ? t : r
                } catch (e) {
                    return r
                }
            }
        })
    }, "getFoldersQueryKey", 0, n, "useAddItemToFolderMutation", 0, function(e, a) {
        let {
            onSuccess: r,
            onError: n
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.addItemToFolder(t.itemId, t.itemType, t.folderId),
            onSuccess: r,
            onError: n
        })
    }, "useCreateFolderMutation", 0, function(e, a) {
        let {
            onSuccess: r,
            onError: n
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.createFolder(t.name, void 0, t.groupId),
            onSuccess: e => {
                var t;
                return r(null != (t = e.folderId) ? t : "")
            },
            onError: n
        })
    }, "useGetFolders", 0, function(e, t) {
        let r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
        return (0, a.useQuery)({
            queryKey: n(t),
            queryFn: () => e.getFolders(t),
            enabled: r
        })
    }, "useUpdateFolderMutation", 0, function(e, a) {
        let {
            onSuccess: r,
            onError: n
        } = a;
        return (0, t.useMutation)({
            mutationFn: t => e.updateFolder(t.folderId, t.name),
            onSuccess: r,
            onError: n
        })
    }])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(221628),
        r = e.i(416340),
        n = e.i(445550),
        s = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t);
    let i = Object.values(s),
        l = (e => {
            let t = {};
            for (let a of i) t[a] = e(a);
            if (!i.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["DEFAULT_FRONTEND_FLAGS", 0, l, "FRONTEND_FLAG_NAMES", 0, i, "FrontendFlagName", () => s], 448005);
    let o = (0, r.createContext)(null);
    e.s(["default", 0, e => {
        let {
            children: t
        } = e, [s, u] = (0, r.useState)(l), [d, c] = (0, r.useState)(!1), m = (0, r.useCallback)(async e => {
            try {
                let t = await n.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...i.map(e => {
                        var a, r;
                        return {
                            [e]: null != (a = null == t || null == (r = t.data) ? void 0 : r[e]) && a
                        }
                    }));
                u(a)
            } catch (e) {}
        }, []);
        (0, r.useEffect)(() => {
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
        let p = (0, r.useMemo)(() => ({
            frontendFlags: s,
            getFrontendFlags: m,
            loadingFrontendFlags: d
        }), [s, m, d]);
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
        a = e.i(237401),
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
                groups: s,
                isFetched: i,
                currentGroup: l,
                setCurrentGroup: o
            } = (0, r.useGroups)(),
            u = (0, t.useRef)(!1),
            d = (0, t.useRef)(!1),
            c = (0, t.useMemo)(() => {
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
}, 734463, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(19655),
        r = e.i(78892),
        n = e.i(608652),
        s = e.i(598943),
        i = e.i(793808),
        l = e.i(44265),
        o = e.i(40266),
        u = e.i(524887),
        d = e.i(763960),
        c = e.i(226972),
        m = e.i(594278),
        p = e.i(699704),
        f = e.i(428156),
        g = e.i(3300),
        v = e.i(813593),
        h = e.i(221628),
        y = "Popover",
        [b, A] = (0, n.createContextScope)(y, [u.createPopperScope]),
        T = (0, u.createPopperScope)(),
        [x, I] = b(y),
        S = e => {
            let {
                __scopePopover: a,
                children: r,
                open: n,
                defaultOpen: s,
                onOpenChange: i,
                modal: l = !1
            } = e, d = T(a), c = t.useRef(null), [m, p] = t.useState(!1), [g = !1, v] = (0, f.useControllableState)({
                prop: n,
                defaultProp: s,
                onChange: i
            });
            return (0, h.jsx)(u.Root, {
                ...d,
                children: (0, h.jsx)(x, {
                    scope: a,
                    contentId: (0, o.useId)(),
                    triggerRef: c,
                    open: g,
                    onOpenChange: v,
                    onOpenToggle: t.useCallback(() => v(e => !e), [v]),
                    hasCustomAnchor: m,
                    onCustomAnchorAdd: t.useCallback(() => p(!0), []),
                    onCustomAnchorRemove: t.useCallback(() => p(!1), []),
                    modal: l,
                    children: r
                })
            })
        };
    S.displayName = y;
    var C = "PopoverAnchor",
        w = t.forwardRef((e, a) => {
            let {
                __scopePopover: r,
                ...n
            } = e, s = I(C, r), i = T(r), {
                onCustomAnchorAdd: l,
                onCustomAnchorRemove: o
            } = s;
            return t.useEffect(() => (l(), () => o()), [l, o]), (0, h.jsx)(u.Anchor, {
                ...i,
                ...n,
                ref: a
            })
        });
    w.displayName = C;
    var E = "PopoverTrigger",
        P = t.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...s
            } = e, i = I(E, n), l = T(n), o = (0, r.useComposedRefs)(t, i.triggerRef), d = (0, h.jsx)(m.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": i.open,
                "aria-controls": i.contentId,
                "data-state": G(i.open),
                ...s,
                ref: o,
                onClick: (0, a.composeEventHandlers)(e.onClick, i.onOpenToggle)
            });
            return i.hasCustomAnchor ? d : (0, h.jsx)(u.Anchor, {
                asChild: !0,
                ...l,
                children: d
            })
        });
    P.displayName = E;
    var k = "PopoverPortal",
        [N, M] = b(k, {
            forceMount: void 0
        }),
        D = e => {
            let {
                __scopePopover: t,
                forceMount: a,
                children: r,
                container: n
            } = e, s = I(k, t);
            return (0, h.jsx)(N, {
                scope: t,
                forceMount: a,
                children: (0, h.jsx)(c.Presence, {
                    present: a || s.open,
                    children: (0, h.jsx)(d.Portal, {
                        asChild: !0,
                        container: n,
                        children: r
                    })
                })
            })
        };
    D.displayName = k;
    var F = "PopoverContent",
        U = t.forwardRef((e, t) => {
            let a = M(F, e.__scopePopover),
                {
                    forceMount: r = a.forceMount,
                    ...n
                } = e,
                s = I(F, e.__scopePopover);
            return (0, h.jsx)(c.Presence, {
                present: r || s.open,
                children: s.modal ? (0, h.jsx)(B, {
                    ...n,
                    ref: t
                }) : (0, h.jsx)(R, {
                    ...n,
                    ref: t
                })
            })
        });
    U.displayName = F;
    var L = (0, p.createSlot)("PopoverContent.RemoveScroll"),
        B = t.forwardRef((e, n) => {
            let s = I(F, e.__scopePopover),
                i = t.useRef(null),
                l = (0, r.useComposedRefs)(n, i),
                o = t.useRef(!1);
            return t.useEffect(() => {
                let e = i.current;
                if (e) return (0, g.hideOthers)(e)
            }, []), (0, h.jsx)(v.RemoveScroll, {
                as: L,
                allowPinchZoom: !0,
                children: (0, h.jsx)(j, {
                    ...e,
                    ref: l,
                    trapFocus: s.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, a.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), o.current || null == (t = s.triggerRef.current) || t.focus()
                    }),
                    onPointerDownOutside: (0, a.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            a = 0 === t.button && !0 === t.ctrlKey;
                        o.current = 2 === t.button || a
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, a.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        R = t.forwardRef((e, a) => {
            let r = I(F, e.__scopePopover),
                n = t.useRef(!1),
                s = t.useRef(!1);
            return (0, h.jsx)(j, {
                ...e,
                ref: a,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var a, i;
                    null == (a = e.onCloseAutoFocus) || a.call(e, t), t.defaultPrevented || (n.current || null == (i = r.triggerRef.current) || i.focus(), t.preventDefault()), n.current = !1, s.current = !1
                },
                onInteractOutside: t => {
                    var a, i;
                    null == (a = e.onInteractOutside) || a.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (s.current = !0));
                    let l = t.target;
                    (null == (i = r.triggerRef.current) ? void 0 : i.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && s.current && t.preventDefault()
                }
            })
        }),
        j = t.forwardRef((e, t) => {
            let {
                __scopePopover: a,
                trapFocus: r,
                onOpenAutoFocus: n,
                onCloseAutoFocus: o,
                disableOutsidePointerEvents: d,
                onEscapeKeyDown: c,
                onPointerDownOutside: m,
                onFocusOutside: p,
                onInteractOutside: f,
                ...g
            } = e, v = I(F, a), y = T(a);
            return (0, i.useFocusGuards)(), (0, h.jsx)(l.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: r,
                onMountAutoFocus: n,
                onUnmountAutoFocus: o,
                children: (0, h.jsx)(s.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: d,
                    onInteractOutside: f,
                    onEscapeKeyDown: c,
                    onPointerDownOutside: m,
                    onFocusOutside: p,
                    onDismiss: () => v.onOpenChange(!1),
                    children: (0, h.jsx)(u.Content, {
                        "data-state": G(v.open),
                        role: "dialog",
                        id: v.contentId,
                        ...y,
                        ...g,
                        ref: t,
                        style: {
                            ...g.style,
                            "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                            "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                            "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                            "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                            "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                        }
                    })
                })
            })
        }),
        O = "PopoverClose",
        V = t.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...n
            } = e, s = I(O, r);
            return (0, h.jsx)(m.Primitive.button, {
                type: "button",
                ...n,
                ref: t,
                onClick: (0, a.composeEventHandlers)(e.onClick, () => s.onOpenChange(!1))
            })
        });
    V.displayName = O;
    var _ = t.forwardRef((e, t) => {
        let {
            __scopePopover: a,
            ...r
        } = e, n = T(a);
        return (0, h.jsx)(u.Arrow, {
            ...n,
            ...r,
            ref: t
        })
    });

    function G(e) {
        return e ? "open" : "closed"
    }
    _.displayName = "PopoverArrow", e.s(["Anchor", 0, w, "Arrow", 0, _, "Close", 0, V, "Content", 0, U, "Portal", 0, D, "Root", 0, S, "Trigger", 0, P])
}, 978989, e => {
    "use strict";
    var t = e.i(605836),
        a = e.i(608972),
        r = e.i(356407),
        n = e.i(197649),
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
        u = {
            Info: "var(--inverse-system-emphasis)",
            Warning: "var(--inverse-system-warning)",
            Success: "var(--inverse-system-success)",
            Error: "var(--inverse-system-alert)"
        },
        d = {
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
                onPrimaryAction: I,
                secondaryActionLabel: S,
                onSecondaryAction: C,
                actions: w,
                onDismiss: E,
                dismissIconAriaLabel: P = "Dismiss banner",
                className: k,
                style: N,
                ...M
            } = e, D = i[T], F = "Emphasis" === A ? d[T] : "", U = "Info" === T && y ? y : o[T], L = "Stacked" === b, B = !!w || !!(x && I) || !!(S && C), R = f && s.default.createElement("span", {
                className: (0, n.default)("text-body-medium underline content-default block text-no-wrap")
            }, f), j = R && s.default.createElement(s.default.Fragment, null, s.default.createElement("span", null, " · "), s.default.createElement("a", {
                className: "shrink-0",
                href: g,
                onClick: v
            }, R)), O = null != w ? w : x && I || S && C ? s.default.createElement("div", {
                className: "flex items-center gap-small"
            }, x && I && s.default.createElement(a.Button, {
                size: "Small",
                variant: "Standard",
                onClick: I,
                className: (0, n.default)("content-emphasis label-small", F)
            }, x), S && C && s.default.createElement(a.Button, {
                size: "Small",
                variant: "Utility",
                onClick: C,
                className: (0, n.default)("content-emphasis label-small")
            }, S)) : null, V = E && s.default.createElement(r.CloseAffordance, {
                variant: "Utility",
                size: "Small",
                isCircular: !0,
                className: "content-emphasis",
                "aria-label": P,
                onClick: E
            });
            return s.default.createElement("div", {
                ref: c,
                role: "Warning" === T || "Error" === T ? "alert" : "status",
                className: (0, n.default)("foundation-web-feedback-banner flex flex-col gap-small radius-medium padding-large stroke-standard", "Standard" === A ? "bg-shift-100" : void 0, "Standard" === A ? "stroke-default" : l[T], k),
                style: {
                    backgroundColor: "Emphasis" === A ? D : void 0,
                    ...N
                },
                ...M
            }, s.default.createElement("div", {
                className: (0, n.default)("flex width-full gap-medium", L ? "items-start" : "items-center flex-wrap")
            }, s.default.createElement("div", {
                className: (0, n.default)("flex grow-1 min-width-0", L ? "flex-col gap-medium basis-0" : "items-center gap-xsmall")
            }, s.default.createElement("div", {
                className: (0, n.default)("flex min-width-0", L ? "gap-medium flex-col grow-1 basis-0" : "gap-xsmall items-center")
            }, s.default.createElement("div", {
                className: (0, n.default)("flex items-center gap-xsmall min-width-0")
            }, s.default.createElement("div", {
                className: (0, n.default)("flex items-center gap-medium min-width-0")
            }, h && U && s.default.createElement(t.Icon, {
                name: U,
                size: "Large",
                className: "shrink-0",
                style: {
                    color: u[T]
                }
            }), s.default.createElement("span", {
                className: (0, n.default)("text-label-medium content-emphasis", L ? "" : "block padding-y-xsmall text-truncate-end text-no-wrap min-width-0 grow-1 basis-0")
            }, m)), L && j), p && (L ? s.default.createElement("div", {
                className: (0, n.default)("text-body-medium text-truncate-split content-default width-full")
            }, p) : s.default.createElement(s.default.Fragment, null, s.default.createElement("span", {
                className: "text-body-medium text-truncate-end content-default block text-no-wrap min-width-0 fill"
            }, p), s.default.createElement("span", {
                className: "flex items-center gap-xsmall"
            }, j))), !L && !p && j && s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, j)), L && B && O), !L && (B || E) && s.default.createElement("div", {
                className: "flex items-center justify-end gap-small shrink-0"
            }, B && O, V), L && V && s.default.createElement("div", {
                className: "shrink-0"
            }, V)))
        });
    e.s(["FeedbackBanner", 0, c])
}, 696490, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        r = e.i(23342);
    let n = new Set(["_self", "_parent", "_top"]),
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
                color: f = "Emphasis",
                variant: g = "Standalone",
                underline: v = "hover",
                isExternal: h,
                asChild: y,
                ...b
            } = e, A = (u = null != (o = b.as) ? o : "a", d = "button" === b.as ? void 0 : b.target, void 0 !== h ? h : "button" !== u && void 0 !== d && !n.has(d)), T = (0, t.default)("foundation-web-link", "button" === b.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || A) && "inline-flex items-center gap-xsmall", void 0 !== p && s[p], i[f], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), x = A ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (y) {
                let {
                    as: e,
                    ...t
                } = b, n = a.default.Children.only(c);
                return a.default.isValidElement(n) ? a.default.createElement(r.Slot, {
                    ref: l,
                    ...t,
                    className: T
                }, a.default.cloneElement(n, {}, a.default.createElement(a.default.Fragment, null, n.props.children, x))) : null
            }
            if ("button" === b.as) {
                let {
                    as: e,
                    type: t,
                    ...r
                } = b;
                return a.default.createElement("button", {
                    ref: l,
                    type: null != t ? t : "button",
                    ...r,
                    className: T
                }, c, x)
            }
            let {
                as: I,
                ...S
            } = b;
            return a.default.createElement("a", {
                ref: l,
                ...S,
                className: T
            }, c, x)
        });
    l.displayName = "Link", e.s(["Link", 0, l])
}, 252082, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        r = e.i(734463);
    let n = e => {
        var t, a, r, n, s, i;
        let l = null != (t = null == (r = (n = window).matchMedia) || null == (a = r.call(n, "(pointer: coarse)")) ? void 0 : a.matches) && t,
            o = null == (s = document.activeElement) ? void 0 : s.matches(":focus-visible");
        if (l && !o) return void e.preventDefault();
        let u = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        u && (e.preventDefault(), u.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: n,
            onOpenChange: s,
            children: i
        } = e;
        return a.createElement(r.Root, {
            open: t,
            defaultOpen: n,
            onOpenChange: s
        }, i)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: n,
            children: s
        } = e;
        return a.createElement(r.Anchor, {
            asChild: t,
            className: n
        }, s)
    }, "PopoverContent", 0, function(e) {
        let {
            side: s = "bottom",
            align: i = "center",
            sideOffset: l = 4,
            className: o,
            children: u,
            ariaLabel: d,
            onOpenAutoFocus: c,
            ...m
        } = e;
        return a.createElement(r.Portal, null, a.createElement(r.Content, {
            side: s,
            align: i,
            sideOffset: l,
            ...m,
            "aria-label": null != d ? d : m["aria-label"],
            onOpenAutoFocus: null != c ? c : n,
            className: (0, t.default)("foundation-web-portal-zindex", o)
        }, u))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: n,
            className: s,
            children: i
        } = e;
        return a.createElement(r.Trigger, {
            asChild: t,
            disabled: n,
            className: s
        }, i)
    }])
}, 377282, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let r = {
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
        n = a.default.forwardRef((e, n) => {
            let {
                className: s,
                size: i = "Large",
                variant: l = "Determinate",
                value: o = 0,
                showValue: u = !1,
                ariaLabel: d,
                ...c
            } = e, {
                dimension: m,
                strokeWidth: p,
                textClass: f,
                valueContainerSize: g
            } = r[i], v = (m - p) / 2, h = 2 * Math.PI * v, y = m / 2, b = Math.min(100, Math.max(0, o)), A = u && void 0 !== g ? g : m, T = "Determinate" === l;
            return a.default.createElement("div", {
                ref: n,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", s),
                role: "progressbar",
                "aria-label": d,
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
            })), T && u && "Large" === i && a.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", f),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(b)), a.default.createElement("span", null, "%")))
        });
    n.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, n])
}, 390398, e => {
    "use strict";
    var t = e.i(605836),
        a = e.i(708064),
        r = e.i(197649),
        n = e.i(416340);
    let s = (0, n.createContext)(null),
        i = e => {
            let t = (0, n.useContext)(s);
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
        u = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        d = {
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
        f = (0, n.forwardRef)((e, t) => {
            let {
                children: a,
                size: i = "Medium",
                variant: l = "Divided",
                className: o,
                ...u
            } = e, d = (0, n.useMemo)(() => ({
                size: i,
                variant: l
            }), [i, l]), c = "Framed" === l;
            return n.default.createElement(s.Provider, {
                value: d
            }, n.default.createElement("div", {
                className: (0, r.default)("width-full bg-surface-100", c && "radius-medium clip stroke-standard stroke-default")
            }, n.default.createElement("table", {
                ref: t,
                className: (0, r.default)("foundation-web-table width-full content-default", o),
                ...u
            }, a)))
        });
    f.displayName = "Table";
    let g = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: s,
            ...l
        } = e;
        return i("TableHeader"), n.default.createElement("thead", {
            ref: t,
            className: (0, r.default)("foundation-web-table-header", s),
            ...l
        }, a)
    });
    g.displayName = "TableHeader";
    let v = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: s,
            ...l
        } = e;
        return i("TableBody"), n.default.createElement("tbody", {
            ref: t,
            className: (0, r.default)("foundation-web-table-body", s),
            ...l
        }, a)
    });
    v.displayName = "TableBody";
    let h = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: s,
            isInteractive: l = !1,
            isHoverable: o = !1,
            isSelected: u = !1,
            isDisabled: d = !1,
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
            onClick: d ? void 0 : c,
            onKeyDown: e => {
                d || (null == m || m(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == c || c(e)))
            }
        } : {
            role: f,
            tabIndex: p,
            onClick: c,
            onKeyDown: m
        };
        return n.default.createElement("tr", {
            ref: t,
            "aria-selected": l ? u : void 0,
            "aria-disabled": !!l && !!d || void 0,
            "data-selected": u || void 0,
            className: (0, r.default)("foundation-web-table-row", (l || o) && "hover:bg-shift-100", l && !d && "cursor-pointer", l && d && "opacity-disabled pointer-events-none", u && "bg-shift-200", s),
            ...v,
            ...g
        }, a)
    });
    h.displayName = "TableRow";
    let y = (0, n.forwardRef)((e, a) => {
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
        } = i("TableHeaderCell"), A = !!f, T = null != c ? c : "none", x = A && "none" !== T && n.default.createElement(t.Icon, {
            name: "ascending" === T ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), I = n.default.createElement("div", {
            className: (0, r.default)("flex items-center gap-xsmall", d[b], "content-muted", p[g])
        }, "end" === g && x, n.default.createElement("span", {
            className: "text-truncate-end"
        }, s), "end" !== g && x), S = "string" == typeof s ? "Sort by ".concat(s) : void 0;
        return n.default.createElement("th", {
            ref: a,
            scope: null != h ? h : "col",
            "aria-sort": A ? T : void 0,
            className: (0, r.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", u[b], o[b], m[g], "content-muted", l),
            ...y
        }, A ? n.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: f,
            "aria-label": null != v ? v : S
        }, I) : I)
    });
    y.displayName = "TableHeaderCell";
    let b = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: s,
            align: u = "start",
            ...d
        } = e, {
            size: p
        } = i("TableCell");
        return n.default.createElement("td", {
            ref: t,
            className: (0, r.default)("foundation-web-table-cell foundation-web-table-row-divider", l[p], o[p], c[p], m[u], "content-default", s),
            ...d
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
        I = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        S = {
            XSmall: "gap-xsmall",
            Small: "gap-xsmall",
            Medium: "gap-small"
        },
        C = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "Small"
        },
        w = (0, n.forwardRef)((e, t) => {
            let {
                size: s = "Medium",
                page: i,
                rowsPerPage: l,
                totalRows: o,
                rowsPerPageOptions: u = [10, 25, 50],
                onPageChange: d,
                onRowsPerPageChange: c,
                rowsPerPageLabel: m = "Rows per page",
                firstPageLabel: p = "First page",
                previousPageLabel: f = "Previous page",
                nextPageLabel: g = "Next page",
                lastPageLabel: v = "Last page",
                rangeLabel: h,
                className: y,
                ...b
            } = e, w = Math.max(1, Math.ceil(o / l)), E = 0 === i, P = i >= w - 1, k = 0 === o ? 0 : i * l + 1, N = Math.min((i + 1) * l, o), M = (0, n.useCallback)(e => {
                let t = Number(e.target.value);
                null == c || c(t), d(0)
            }, [c, d]), D = C[s];
            return n.default.createElement("div", {
                ref: t,
                className: (0, r.default)("flex items-center justify-end", A[s], T[s], y),
                ...b
            }, n.default.createElement("div", {
                className: "flex items-center gap-large"
            }, n.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, c && n.default.createElement("div", {
                className: "flex items-center gap-small"
            }, n.default.createElement("span", {
                className: (0, r.default)(x[s], "content-default")
            }, m), n.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, n.default.createElement("select", {
                className: (0, r.default)("foundation-web-table-pagination-select", x[s], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === s ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: l,
                onChange: M,
                "aria-label": m
            }, u.map(e => n.default.createElement("option", {
                key: e,
                value: e
            }, e))))), n.default.createElement("span", {
                className: (0, r.default)(I[s], "content-default")
            }, h ? h(k, N, o) : "".concat(k, "-").concat(N, " of ").concat(o))), n.default.createElement("div", {
                className: (0, r.default)("flex items-center", S[s])
            }, n.default.createElement(a.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: p,
                size: D,
                variant: "Utility",
                isDisabled: E,
                onClick: () => d(0)
            }), n.default.createElement(a.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: f,
                size: D,
                variant: "Utility",
                isDisabled: E,
                onClick: () => d(i - 1)
            }), n.default.createElement(a.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: g,
                size: D,
                variant: "Utility",
                isDisabled: P,
                onClick: () => d(i + 1)
            }), n.default.createElement(a.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: v,
                size: D,
                variant: "Utility",
                isDisabled: P,
                onClick: () => d(w - 1)
            }))))
        });
    w.displayName = "TablePagination", e.s(["Table", 0, f, "TableBody", 0, v, "TableCell", 0, b, "TableHeader", 0, g, "TableHeaderCell", 0, y, "TablePagination", 0, w, "TableRow", 0, h])
}, 533030, e => {
    "use strict";
    var t = e.i(106077),
        a = e.i(454778),
        r = e.i(175064),
        n = e.i(197649),
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
                value: f,
                defaultValue: g,
                isDisabled: v,
                hasError: h,
                helperText: y,
                className: b,
                style: A,
                textareaClassName: T,
                textareaStyle: x,
                id: I,
                ...S
            } = e, C = (0, a.default)(), w = I || C, E = "".concat(w, "-description"), P = null != c ? c : "Large";
            return s.default.createElement("div", {
                className: (0, n.default)("flex fill flex-col width-full gap-small", {
                    [t.disabledOpacity]: v
                }, b),
                style: A
            }, p && s.default.createElement("label", {
                htmlFor: w,
                className: (0, n.default)(o[P], "content-emphasis")
            }, p), s.default.createElement("textarea", {
                ref: d,
                id: w,
                "data-testid": "text-area-container",
                style: x,
                className: (0, n.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", r.INPUT_BACKGROUND_BY_VARIANT[m], r.INPUT_STROKE_BY_VARIANT[m], h ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", u[P], i[P], l[P], T),
                value: f,
                defaultValue: null == f ? g : void 0,
                disabled: v,
                "aria-describedby": y ? E : void 0,
                ...S
            }), y && s.default.createElement("span", {
                id: E,
                className: (0, n.default)("text-caption-small", {
                    "content-system-alert": h,
                    "content-default": !h
                })
            }, y))
        });
    d.displayName = "TextArea", e.s(["TextArea", 0, d])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: r
        } = t, n = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[n], a, r[n], r) : void 0
    }

    function r(e, t) {
        var a;
        let {
            pages: r,
            pageParams: n
        } = t;
        return r.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, r[0], r, n[0], n) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != r(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (n, s) => {
                var i, l, o, u, d;
                let c = n.options,
                    m = null == (o = n.fetchOptions) || null == (l = o.meta) || null == (i = l.fetchMore) ? void 0 : i.direction,
                    p = (null == (u = n.state.data) ? void 0 : u.pages) || [],
                    f = (null == (d = n.state.data) ? void 0 : d.pageParams) || [],
                    g = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    h = async () => {
                        let s = !1,
                            i = (0, t.ensureQueryFn)(n.options, n.fetchOptions),
                            l = async (e, a, r) => {
                                let l;
                                if (s) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(l = {
                                        client: n.client,
                                        queryKey: n.queryKey,
                                        pageParam: a,
                                        direction: r ? "backward" : "forward",
                                        meta: n.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (n.signal.aborted ? s = !0 : n.signal.addEventListener("abort", () => {
                                            s = !0
                                        }), n.signal)
                                    }), l),
                                    u = await i(o),
                                    {
                                        maxPages: d
                                    } = n.options,
                                    c = r ? t.addToStart : t.addToEnd;
                                return {
                                    pages: c(e.pages, u, d),
                                    pageParams: c(e.pageParams, a, d)
                                }
                            };
                        if (m && p.length) {
                            let e = "backward" === m,
                                t = {
                                    pages: p,
                                    pageParams: f
                                },
                                n = (e ? r : a)(c, t);
                            g = await l(t, n, e)
                        } else {
                            let t = null != e ? e : p.length;
                            do {
                                var o;
                                let e = 0 === v ? null != (o = f[0]) ? o : c.initialPageParam : a(c, g);
                                if (v > 0 && null == e) break;
                                g = await l(g, e), v++
                            } while (v < t)
                        }
                        return g
                    };
                n.options.persister ? n.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = n.options).persister) ? void 0 : e.call(t, h, {
                        client: n.client,
                        queryKey: n.queryKey,
                        meta: n.options.meta,
                        signal: n.signal
                    }, s)
                } : n.fetchFn = h
            }
        }
    }])
}, 630986, e => {
    "use strict";
    var t = e.i(468612),
        a = e.i(117437),
        r = class extends t.QueryObserver {
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
                var r, n;
                let {
                    state: s
                } = e, i = super.createResult(e, t), {
                    isFetching: l,
                    isRefetching: o,
                    isError: u,
                    isRefetchError: d
                } = i, c = null == (n = s.fetchMeta) || null == (r = n.fetchMore) ? void 0 : r.direction, m = u && "forward" === c, p = l && "forward" === c, f = u && "backward" === c, g = l && "backward" === c;
                return {
                    ...i,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.hasNextPage)(t, s.data),
                    hasPreviousPage: (0, a.hasPreviousPage)(t, s.data),
                    isFetchNextPageError: m,
                    isFetchingNextPage: p,
                    isFetchPreviousPageError: f,
                    isFetchingPreviousPage: g,
                    isRefetchError: d && !m && !f,
                    isRefetching: o && !p && !g
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        n = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, n.useBaseQuery)(e, r, t)
    }], 630986)
}]);

//# debugId=9693ef89-0e13-78f7-0898-0743107398b3
//# sourceMappingURL=1dlorzig7n7r5.js.map