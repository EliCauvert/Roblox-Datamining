;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f020a330-7cdd-716a-d580-aff3abb1c364")
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
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1
        });
    e.s(["isAssetAccessRequestsEnabled", 0, r, "isAssetDependenciesViewerEnabled", 0, i, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, s, "isModelCustomThumbnailUploadEnabled", 0, n, "isPricingEligibilityV2Enabled", 0, l])
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
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, l, "isMomentsSitetestUrlParsingEnabled", 0, n, "isMomentsUploadEnabled", 0, r, "isMomentsUploadLanguageSelectEnabled", 0, s, "isTextDocumentEnabled", 0, i])
}, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(540459),
        n = e.i(79187),
        i = e.i(814975),
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
        } = (0, i.useAuthentication)(), c = (0, o.useCurrentGroup)(), [m, p] = (0, a.useState)(void 0), [f, g] = (0, a.useState)(), [h, v] = (0, a.useState)(), [y, b] = (0, a.useState)(), [A, T] = (0, a.useState)(), x = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == c ? void 0 : c.id) ? e : 0) !== 0
        }, [c]), [w, S] = (0, a.useState)(void 0), E = void 0 === m || void 0 === f || void 0 === h && x, I = (0, a.useCallback)(async () => {
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
                v(e.isEligible)
            } catch (e) {
                v(!1)
            }
        }, [c, x]);
        (0, a.useEffect)(() => {
            E ? T(void 0) : x && !w ? T(!1) : T(!1 === y)
        }, [x, w, y, E]), (0, a.useEffect)(() => {
            (async () => {
                if (x && (null == c ? void 0 : c.id)) {
                    var e;
                    return null == (e = (await s.default.getGroupInfo(c.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && S(e === l.id)
            })
        }, [null == c ? void 0 : c.id, x, l]), (0, a.useEffect)(() => {
            E || !f || x && !w ? b(void 0) : b((null == f ? void 0 : f.length) === 0 || (null == f ? void 0 : f.length) === 1 && f[0] === r.Requirements.Payable)
        }, [w, x, E, f]), (0, a.useEffect)(() => {
            I()
        }, [I]), (0, a.useEffect)(() => {
            C()
        }, [C]), (0, a.useEffect)(() => {
            k()
        }, [k]);
        let M = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: E,
            requiresActionToJoinProgram: A,
            compliantWithAllUserRequirements: y,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != f ? f : void 0,
            isCurrentUserGroupOwner: w,
            isGroupEligible: null != h ? h : void 0
        }), [E, A, y, m, f, w, h]);
        return (0, t.jsx)(u.Provider, {
            value: M,
            children: n
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, c, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(u)
    }])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        r = e.i(416340),
        n = e.i(79187),
        i = e.i(423107),
        s = e.i(514455),
        l = e.i(982234),
        o = e.i(199834),
        d = e.i(872204),
        u = e.i(988012),
        c = e.i(447055),
        m = e.i(358763),
        p = e.i(889311),
        f = e.i(823062),
        g = e.i(881670),
        h = e.i(486736),
        v = e.i(906791);
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
                    ageVerificationUpsellGetStartedUrl: w,
                    ageVerificationUpsellViewDetailsUrl: S,
                    establishTrustUpsellGetStartedUrl: E,
                    establishTrustUpsellViewDetailsUrl: I
                }
            } = (0, h.useSettings)(),
            {
                isBannerVisible: C,
                isHighPriority: k,
                variant: M,
                dismissBanner: N
            } = (0, v.useAgeVerificationUpsellContext)(),
            {
                classes: P
            } = y(),
            D = (0, r.useRef)(null),
            {
                unifiedLogger: L
            } = (0, f.useUnifiedLoggerProvider)(),
            {
                translate: F
            } = (0, n.useTranslation)(),
            U = (0, r.useCallback)(() => {
                C && L.logImpressionEvent({
                    eventName: p.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: T,
                        variant: M,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [L, T, M, x, C]);
        (0, m.default)(D, U);
        let B = (0, r.useCallback)(() => {
                L.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "viewDetails",
                        variant: M,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [L, T, M, x]),
            V = (0, r.useCallback)(() => {
                L.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "callToAction",
                        variant: M,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                })
            }, [L, T, M, x]),
            O = (0, r.useCallback)(() => {
                L.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "dismiss",
                        variant: M,
                        ...x && {
                            alertRedesignVariant: x
                        }
                    }
                }), N()
            }, [L, N, T, M, x]);
        return ("establishTrust" === M ? (t = "Title.EstablishTrustBanner", g = "Label.EstablishTrustBanner2", b = E, A = I) : (t = "Title.AgeVerificationBanner", g = "Label.AgeVerificationBanner", b = w, A = S), C) ? (0, a.jsx)("div", {
            ref: D,
            children: (0, a.jsxs)(i.Alert, {
                className: P.alertContainer,
                severity: "ageVerification" === M && k ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(d.Button, {
                    href: b,
                    onClick: V,
                    className: P.getStarted,
                    color: "inherit",
                    size: "small",
                    children: F("Label.AgeVerificationBannerGetStarted") || "Get started"
                }, "getStarted"), (0, a.jsx)(u.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: O,
                    children: (0, a.jsx)(c.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(s.AlertTitle, {
                    children: F(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: F(g)
                }), " ", (0, a.jsx)(l.Link, {
                    className: P.viewDetails,
                    href: A,
                    target: "_blank",
                    color: "inherit",
                    onClick: B,
                    children: F("Label.AgeVerificationBannerViewDetails") || "View details"
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
        i = e.i(823062),
        s = e.i(486736);
    let l = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        o = encodeURIComponent("studio/CollaborationSettings"),
        d = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                r = a.status % 100 * 100;
            if (!a.ok && 500 === r && t < 2) return await new Promise(e => setTimeout(e, 2 ** (t + 1) * 500)), d(e, t + 1);
            if (500 === r && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let n = await a.json();
            if (!("access" in n)) throw Error('"access" not found in response');
            return n.access
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
        }), h = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, v = async () => await u() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: l
        } = e, {
            settings: {
                ageVerificationUpsellBannerStartDate: o,
                ageVerificationUpsellBannerEndDate: d,
                ageVerificationUpsellBannerHighPriorityDate: u
            }
        } = (0, s.useSettings)(), [c, m] = (0, a.useState)(!0), [y, b] = (0, a.useState)("doNotShow"), {
            isFetched: A,
            user: T
        } = (0, r.useRobloxAuthentication)(), {
            unifiedLogger: x
        } = (0, i.useUnifiedLoggerProvider)(), {
            isHighPriority: w,
            isEnabled: S
        } = (0, a.useMemo)(() => {
            let e = h(o),
                t = h(d),
                a = h(u),
                r = new Date;
            return {
                isHighPriority: a <= r,
                isEnabled: e <= r && r < t
            }
        }, [d, o, u]), E = (0, a.useCallback)(async () => {
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
                    t = await v()
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
        let I = (0, a.useMemo)(() => {
            let e = S && "doNotShow" !== y;
            return {
                isBannerVisible: e && !c,
                isBannerEligible: e,
                isHighPriority: w,
                variant: "doNotShow" !== y ? y : "ageVerification",
                dismissBanner: E
            }
        }, [S, y, c, w, E]);
        return (0, t.jsx)(g.Provider, {
            value: I,
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
    }, i = {
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
    }, "assetTypeInfoTextMessage", 0, i, "dashboardAssetTypeToOpenCloudAssetType", 0, n, "getInfoUrl", 0, e => {
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
    }, "maxResolution", 0, e => e === a.Asset.Video ? "4096x2160" : null, "purchasableAssetTypes", 0, s, "quotaEnabledAssetTypes", 0, l])
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
        r = e.i(237401),
        n = e.i(974729),
        i = e.i(52746),
        s = e.i(197649),
        l = e.i(79187),
        o = e.i(169722),
        d = e.i(29929),
        u = e.i(889311),
        c = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        f = e.i(114209),
        g = e.i(373736),
        h = e.i(917852),
        v = e.i(576069),
        y = e.i(663563);
    let b = "".concat("https://assets.create.roblox.com/fa0b0b331a3ae775dd9024c5f4e07bea605f8b12/assets", "/home/publish_eligibility_banner.webp"),
        A = (0, l.withTranslation)(e => {
            var A;
            let {
                universeId: T,
                showCallToAction: x = !0
            } = e, w = (0, r.useRouter)(), {
                translateWithNamespace: S
            } = (0, l.useTranslation)(), {
                params: E,
                isFetched: I
            } = (0, m.useIXPParameters)(d.IXPLayers.CreatorHubCreationsPermission), C = E[d.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: k
            } = (0, f.useCurrentGame)(), M = null == k ? void 0 : k.id, N = null != T ? T : M && M > 0 ? M : void 0, {
                data: P,
                isLoading: D,
                isFetching: L
            } = (0, v.useCreatorEligibility)(), F = (0, a.useRef)(!1), [U, B] = (0, a.useState)(!1), V = (null == P ? void 0 : P.ageBracket) === n.AgeBracketEnum.Over18, O = (null == P ? void 0 : P.ageBracket) === n.AgeBracketEnum.Between13And18, R = null != (A = null == P ? void 0 : P.creatorEligibility.includes(n.CreatorEligibilityEnum.IdVerified)) && A, j = V || O, _ = I && C && !(D || L) && !!P && !R;
            (0, a.useEffect)(() => {
                _ && !F.current && (F.current = !0, c.default.logImpressionEvent({
                    eventName: u.default.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: j ? "start" : "viewDetails",
                        ctaHidden: String(!x),
                        ...N ? {
                            universeId: String(N)
                        } : {}
                    }
                }))
            }, [_, x, j, N]);
            let G = (0, a.useCallback)(() => {
                if (!_) return;
                let e = j ? "start" : "viewDetails";
                (c.default.logClickEvent({
                    eventName: u.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...N ? {
                            universeId: String(N)
                        } : {}
                    }
                }), O) ? B(!0): j || w.push("/settings/eligibility/publishing-permissions")
            }, [_, O, w, j, N]);
            return _ ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, s.clsx)(y.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
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
                        className: (0, s.clsx)(y.default.heroTextContent, "dark-theme relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [S(p.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: S(p.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, s.clsx)(y.default.buttonRow, "flex gap-small"),
                            children: x ? V ? (0, t.jsx)(i.Button, {
                                as: "a",
                                href: h.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: S(p.TranslationNamespace.AudienceReach, j ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(i.Button, {
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: S(p.TranslationNamespace.AudienceReach, j ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), O ? (0, t.jsx)(g.default, {
                    open: U,
                    onOpenChange: B,
                    onContinueWithId: () => {
                        window.open(h.idVerificationActionUrl, "_blank", "noopener,noreferrer"), B(!1)
                    },
                    onAddParent: () => {
                        window.open(h.parentLinkActionUrl, "_blank", "noopener,noreferrer"), B(!1)
                    }
                }) : null]
            }) : null
        }, [p.TranslationNamespace.AudienceReach, p.TranslationNamespace.PublicPublish]);
    e.s(["default", 0, A])
}, 899441, e => {
    "use strict";
    var t, a, r = e.i(102211),
        n = e.i(272593),
        i = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.TextDocument = "TextDocument", t.Video = "Video", t),
        s = ((a = {}).Group = "groups", a.User = "users", a);
    let l = new r.CreatorInventoryApi((0, n.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => i, "CreatorInventoryScopeType", () => s, "default", 0, l])
}, 445550, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(309999),
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
        a = e.i(685009),
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
        o = e.i(198852),
        d = e.i(671376),
        u = e.i(486736),
        c = e.i(117236);
    let m = function() {
        let e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
            {
                settings: a
            } = (0, u.useSettings)(),
            r = (0, s.useQuery)({
                queryKey: ["getTaxonomyCategories", o.CategoryDomain.NUMBER_3],
                queryFn: () => l.default.getItemCategories(o.CategoryDomain.NUMBER_3),
                enabled: e,
                staleTime: 3e5
            }),
            i = (0, s.useQuery)({
                queryKey: ["getAvatarItemsEntryPointAssetTypes"],
                queryFn: c.getAvatarItemsEntryPointAssetTypes,
                enabled: e,
                staleTime: 3e5
            }),
            m = i.data,
            p = (0, t.useMemo)(() => {
                var e, t;
                return {
                    enableMakeupAssets: a.enableMakeupAssets && null != (e = null == m ? void 0 : m.has(d.Asset.EyeMakeup)) && e,
                    enableAvatarBackgrounds: a.enableAvatarBackgrounds && null != (t = null == m ? void 0 : m.has(d.Asset.AvatarBackground)) && t
                }
            }, [a.enableMakeupAssets, a.enableAvatarBackgrounds, m]),
            f = (0, t.useMemo)(() => (0, n.transformCreatorDashboardTree)(r.data, p), [r.data, p]),
            g = (0, t.useMemo)(() => (0, n.buildTaxonomyL1Options)(f), [f]);
        return {
            response: r.data,
            categories: f,
            l1Options: g,
            isLoading: r.isLoading || i.isLoading,
            isError: r.isError
        }
    };
    e.s(["default", 0, e => {
        var s, l, o;
        let [{
            activeTab: d,
            filterIndex: u
        }] = (0, a.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: c,
            categories: p,
            isLoading: f
        } = m(e), g = (0, i.isAllAssetTypesActiveTab)(d) || (0, i.isRecentsActiveTab)(d) || (0, i.isAvatarLooksActiveTab)(d) ? void 0 : null != (s = (0, i.parseTaxonomyActiveTab)(d)) ? s : null == (o = c[0]) ? void 0 : o.taxonomyKey, h = (0, t.useMemo)(() => (0, n.findL1Category)(p, g), [p, g]), v = (0, t.useMemo)(() => (0, n.buildTaxonomyL2Options)(h), [h]), y = parseInt(null != (l = null == u ? void 0 : u.toString()) ? l : "", 10), b = (0, r.isValidIndex)(y, v) ? y : 0, A = (0, t.useMemo)(() => {
            if (h) return v.length > 0 ? v[b] : h.webStableId ? (0, n.categoryToDropdown)(h) : void 0
        }, [h, v, b]);
        return {
            l1Options: c,
            activeL1Key: g,
            activeL1Node: h,
            l2Options: v,
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
                if (d(e, s)) {
                    t.enableMakeupAssets && (f = !0, p.push(e));
                    return
                }
                if (u(e)) {
                    if (d(e, i)) return void n.push(e);
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
        i = e.i(692587),
        s = e.i(117236);
    let l = "AvatarItems",
        o = "".concat(l, "-"),
        d = n.Asset.HairAccessory;

    function u(e) {
        let t = (0, i.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let c = "looks",
        m = new Set(null != (t = null == (r = s.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = r.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

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
        return "Recents" === (0, i.readQueryValue)(e) || "recents" === u(e)
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, i.readQueryValue)(e);
        return a === l || null != (t = null == a ? void 0 : a.startsWith(o)) && t
    }, "isTaxonomyEligibleAssetTab", 0, p, "parseTaxonomyActiveTab", 0, u, "shouldOpenTaxonomyView", 0, function(e) {
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
        i = e.i(671376),
        s = ((t = {}).All = "All", t);
    let l = [r.CreatorInventoryAssetType.Model, r.CreatorInventoryAssetType.Plugin, r.CreatorInventoryAssetType.Audio, r.CreatorInventoryAssetType.Decal, r.CreatorInventoryAssetType.Image, r.CreatorInventoryAssetType.Video, r.CreatorInventoryAssetType.Mesh, r.CreatorInventoryAssetType.MeshPart, r.CreatorInventoryAssetType.Animation],
        o = [...l, r.CreatorInventoryAssetType.TextDocument],
        d = new Set([r.CreatorInventoryAssetType.Audio, r.CreatorInventoryAssetType.Decal, r.CreatorInventoryAssetType.MeshPart, r.CreatorInventoryAssetType.TextDocument, r.CreatorInventoryAssetType.Video]),
        u = new Set([...d, r.CreatorInventoryAssetType.Image]),
        c = new Set(o),
        m = new Set([r.CreatorInventoryAssetType.TextDocument]),
        p = new Set(["All", n.CreatorInventorySourceType.Created, n.CreatorInventorySourceType.Purchased, n.CreatorInventorySourceType.Shared]),
        f = new Set([i.Asset.Animation, i.Asset.Audio, i.Asset.Decal, i.Asset.Image, i.Asset.Mesh, i.Asset.MeshPart, i.Asset.Model, i.Asset.Plugin, i.Asset.Video]),
        g = {
            [r.CreatorInventoryAssetType.Animation]: i.Asset.Animation,
            [r.CreatorInventoryAssetType.Audio]: i.Asset.Audio,
            [r.CreatorInventoryAssetType.Decal]: i.Asset.Decal,
            [r.CreatorInventoryAssetType.Image]: i.Asset.Image,
            [r.CreatorInventoryAssetType.Mesh]: i.Asset.Mesh,
            [r.CreatorInventoryAssetType.MeshPart]: i.Asset.MeshPart,
            [r.CreatorInventoryAssetType.Model]: i.Asset.Model,
            [r.CreatorInventoryAssetType.Plugin]: i.Asset.Plugin,
            [r.CreatorInventoryAssetType.TextDocument]: i.Asset.TextDocument,
            [r.CreatorInventoryAssetType.Video]: i.Asset.Video
        },
        h = {
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
        y = {
            createdDetails: n.CreatorInventorySourceType.Created,
            purchasedDetails: n.CreatorInventorySourceType.Purchased,
            sharedDetails: n.CreatorInventorySourceType.Shared
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
    e.s(["DevelopmentItemsSourceFilter", () => s, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: r.CreatorInventoryScopeType.Group,
        id: t
    } : null != e ? {
        type: r.CreatorInventoryScopeType.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        assetTypes: [h[t]],
        ...e.type === r.CreatorInventoryScopeType.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(n.CreatorInventorySourceType.Created), "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getDevelopmentItemsAssetTypes", 0, A, "getDevelopmentItemsSearchAssetTypes", 0, (e, t) => [e, ...A(t).filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => g[e], "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: r
        } = e;
        return t.trim().length > 0 || a || r !== n.CreatorInventorySourceType.Created
    }, "hasDevelopmentItemCreatorStorePage", 0, e => e !== r.CreatorInventoryAssetType.TextDocument, "hasDevelopmentItemThumbnail", 0, e => e !== r.CreatorInventoryAssetType.TextDocument, "isDevelopmentItemArchivedViewAvailable", 0, e => null != e && u.has(e), "isDevelopmentItemAsset", 0, (e, t) => e === i.Asset.TextDocument ? !0 === t : f.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && d.has(e), "isDevelopmentItemsAssetTypeSelection", 0, (e, t) => null != e && !!c.has(e) && (!m.has(e) || !0 === t), "isDevelopmentItemsSourceSelection", 0, e => null != e && p.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, r, n, i, s, l;
        let o, d = null == (r = e.assetItem) ? void 0 : r.asset;
        if (null == d) return;
        let u = "number" == typeof d.assetId ? d.assetId : Number.parseInt(null != (t = d.assetId) ? t : "", 10);
        if (Number.isNaN(u)) return;
        let c = null == (n = d.displayName) ? void 0 : n.trim();
        return {
            id: null != (a = e.path) ? a : u.toString(),
            assetId: u,
            assetType: (e => {
                if (null != e) return v[e.toString().toUpperCase()]
            })(d.assetType),
            created: T(d.createTime),
            isPackage: (null == (i = e.assetItem) ? void 0 : i.isPackage) === !0,
            name: null == c || 0 === c.length ? u.toString() : c,
            sources: (l = null == (s = e.assetItem) ? void 0 : s.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let r = y[t];
                    null != r && o.add(r)
                })
            }), [...o]),
            state: null == d.state ? void 0 : b[d.state],
            updated: T(d.updateTime)
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
}, 427149, e => {
    "use strict";
    var t = e.i(799972),
        a = e.i(671376),
        r = e.i(759283),
        n = e.i(475360),
        i = e.i(949599),
        s = e.i(117236);
    let l = s.default.reduce((e, t) => {
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
            menuItem: s.default[0]
        },
        d = a.Asset.EyeMakeup,
        u = a.Asset.AvatarLooks,
        c = a.Asset.AvatarBackground,
        m = a.Asset.Showcase;
    e.s(["default", 0, {
        isMenuItemEnabled(e, r, i, s, l, o, p, f, g, h) {
            var v, y;
            return ((null == e ? void 0 : e.type) !== a.Asset.TextDocument || !!h) && ((null == e ? void 0 : e.type) === a.Asset.AllCatalogAsset ? null != p && p : (null == e ? void 0 : e.type) === a.Asset.SharedExperiences ? null == i : (null == e ? void 0 : e.type) === a.Asset.Moments ? null != o && o : (null == e ? void 0 : e.itemType) === n.Item.Bundle || ((null == e ? void 0 : e.type) === u ? null != f && f : (null == e ? void 0 : e.type) === c ? r.enableAvatarBackgrounds && null != (v = null == l ? void 0 : l.has(e.type)) && v : (null == e ? void 0 : e.type) === m ? null != g && g : (null == e ? void 0 : e.type) === d ? r.enableMakeupAssets && null != (y = null == l ? void 0 : l.has(e.type)) && y : (null == e ? void 0 : e.type) === void 0 || !!(0, t.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === s || null != s && s))
        },
        getValidMenuState(e, t, a, r, n, i, s, l, o, u, m) {
            var p, f, g, h, v, y;
            let b, A, T = (null == (p = t.submenuItem) ? void 0 : p.type) !== d && (null == (f = t.submenuItem) ? void 0 : f.type) !== c || void 0 !== i;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, r, n, i, s, l, o, u, m)) {
                if (void 0 !== t.submenuItem && T && !this.isMenuItemEnabled(t.submenuItem, a, r, n, i, s, l, o, u, m))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            d = 0;
                        for (; d < (null == (h = t.menuItem.submenuItems) ? void 0 : h.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[d], a, r, n, i, s, l, o, u, m)) {
                                e = d;
                                break
                            }
                            d += 1
                        }
                        b = t.menuItem, A = null == (v = t.menuItem.submenuItems) ? void 0 : v[e]
                    } else b = t.menuItem, A = null == (y = t.menuItem.submenuItems) ? void 0 : y[0]
            } else [b] = e, A = null == (g = e[0].submenuItems) ? void 0 : g[0];
            return b ? {
                menuItem: b,
                submenuItem: A
            } : t
        },
        isAssetTypeDirectlyArchivable: e => s.allowedAssetTypesForDirectArchiving.has(e),
        isAssetTypeArchivable(e, t) {
            if (void 0 !== t && i.AvatarMenuMap[e]) {
                let a = i.AvatarMenuMap[e][t],
                    r = null == a ? void 0 : a.assetType;
                return (null == a ? void 0 : a.bundleType) !== void 0 || void 0 !== r && s.allowedAssetTypesForArchiving.has(r)
            }
            return s.allowedAssetTypesForArchiving.has(e)
        },
        isAssetTypeSortable: e => s.allowedAssetTypesForSorting.has(e),
        isItemTypeUploadable: e => s.allowedItemTypesForUploading.has(e),
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
        n = e.i(192052),
        i = e.i(79187);
    let s = {
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
        } = (0, i.useTranslation)(), [f, g] = (0, t.useState)(!0);
        if (!f) return null;
        let h = c ? {
            closeLabel: p("Action.Close"),
            onDismiss: () => {
                null == m || m(), g(!1)
            }
        } : {
            hasCloseAffordance: !1
        };
        return (0, r.jsx)(n.Alert, {
            severity: s[o],
            variant: "Feedback",
            className: "width-full",
            primaryActionLabel: u,
            primaryActionHref: d,
            ...h,
            children: (0, r.jsxs)("div", {
                className: "flex flex-col gap-xsmall",
                children: [a && (0, r.jsx)("span", {
                    className: "text-label-medium content-emphasis",
                    children: a
                }), (0, r.jsx)("span", {
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
            n && n(t)
        }, e => {
            e.preventDefault(), i && i()
        }, e => {
            e.preventDefault(), s && s()
        }) : null;
        return (0, t.jsxs)("div", {
            className: r,
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
        i = e.i(199834),
        s = e.i(169722),
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
                    marginRight: h[a]
                },
                userBorderRadius: {
                    borderRadius: v[a]
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
                target: h,
                targetType: v,
                displayNameOverride: y,
                adornment: A,
                label: T,
                disabled: x,
                variant: w = "medium",
                disableLink: S = !1,
                obfuscate: E = !1,
                hideThumbnail: I = !1,
                hideSecondaryLabel: C = !1,
                textVariant: k = "primary",
                labelTooltip: M
            } = e,
            {
                classes: {
                    container: N,
                    avatarContainer: P,
                    thumbnailItemContainer: D,
                    thumbnailBackground: L,
                    userBorderRadius: F,
                    nonUserBorderRadius: U,
                    itemText: B,
                    mutedText: V,
                    disabledThumbnail: O,
                    textContainer: R
                },
                cx: j
            } = b({
                variant: w
            }),
            {
                translate: _
            } = (0, r.useTranslation)(),
            G = (0, a.useMemo)(() => v === p.default.User ? n.ThumbnailTypes.avatarHeadshot : v === p.default.Group ? n.ThumbnailTypes.groupIcon : "Ugc" === v ? n.ThumbnailTypes.assetThumbnail : n.ThumbnailTypes.universeThumbnail, [v]),
            z = (0, a.useMemo)(() => {
                if (!S && h.id && !E) {
                    if (v === p.default.User) return f.www.getUserUrl(h.id);
                    if (v === p.default.Group) return f.www.getGroupUrl(h.id);
                    if ("Experience" === v) {
                        let e = "rootPlaceId" in h ? h.rootPlaceId : void 0;
                        return e ? f.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === v) return f.www.getCatalogUrl(h.id)
                }
            }, [S, h, E, v]);
        y ? l = y : v === p.default.User ? l = "displayName" in h ? h.displayName : void 0 : "Ugc" !== v && (l = "name" in h ? h.name : void 0);
        let q = !y && (v === p.default.User && !("displayName" in h && h.displayName) || "Ugc" === v),
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
                    children: [(0, t.jsx)(i.Typography, {
                        className: R,
                        variant: "secondary" === k ? "body1" : "compact" === w ? "captionHeader" : "large" === w ? "h2" : "h5",
                        color: x ? "disabled" : "inherit",
                        children: E ? _("Label.Other") : l
                    }), T && T.length > 0 && (0, t.jsx)(m.Tooltip, {
                        arrow: !0,
                        title: M,
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
                    children: [v === p.default.User && (0, t.jsx)(t.Fragment, {
                        children: "name" in h && !h.name ? (0, t.jsx)(u.Skeleton, {
                            animate: !0,
                            variant: "text",
                            width: 192,
                            height: 20
                        }) : (0, t.jsx)(i.Typography, {
                            variant: "secondary" === k ? "body2" : "captionBody",
                            className: j(R, {
                                [V]: "secondary" === k || "compact" === w
                            }),
                            color: x ? "disabled" : "inherit",
                            children: E ? _("Label.Other") : "@".concat("name" in h ? h.name : "")
                        })
                    }), (v === p.default.Group || "Experience" === v) && (0, t.jsx)(i.Typography, {
                        variant: "captionBody",
                        className: j(R, {
                            [V]: "secondary" === k || "compact" === w
                        }),
                        color: x ? "disabled" : "inherit",
                        children: E ? _("Label.Other") : h.id
                    })]
                })]
            }), [q, l, v, h, R, x, E, _, T, C, j, V, k, w, M]);
        return (0, t.jsx)(s.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: N,
            children: (null == h ? void 0 : h.id) === void 0 ? (0, t.jsx)(u.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: g[w]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(s.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!I && (0, t.jsx)(s.Grid, {
                        item: !0,
                        className: D,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: j(P, {
                                [F]: v === p.default.User,
                                [U]: v !== p.default.User,
                                [O]: x
                            }),
                            children: (0, t.jsx)(n.Thumbnail2d, {
                                targetId: h.id,
                                type: G,
                                imgClassName: L,
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
                            children: S || E ? K : (0, t.jsx)(d.Link, {
                                href: z,
                                className: B,
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
    e.s(["default", 0, function(e, i) {
        var s;
        let l = null != (s = null == i ? void 0 : i.cacheOnly) && s,
            [o, d] = (0, t.useState)(() => l ? {
                params: r(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == i ? void 0 : i.restoreInitialValueFromCache) ? r(e) : {},
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
        }, [e, r, n]), d = (r + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            d && i && (null == s || s())
        }, [d, i, s]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: r = 50,
            resetKey: n
        } = e, [i, s] = (0, t.useState)(0), [l, o] = (0, t.useState)(r), [d, u] = (0, t.useState)(n);
        n !== d && (u(n), s(0));
        let c = Math.max(0, Math.ceil(a / l) - 1),
            m = Math.min(i, c);
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
        n = e.i(199834),
        i = e.i(169722),
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
            classes: p
        } = o(), {
            ready: f
        } = (0, r.useTranslation)();
        return f ? (0, t.jsxs)(i.Grid, {
            classes: {
                root: p.container
            },
            children: [s && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(i.Grid, {
                    classes: {
                        root: p.headerContainer
                    },
                    children: [u && (0, t.jsx)(i.Grid, {
                        classes: {
                            root: p.icon
                        },
                        children: u
                    }), (0, t.jsx)(n.Typography, {
                        variant: "largeLabel2",
                        classes: {
                            root: p.header
                        },
                        children: s
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
        a = e.i(52746),
        r = e.i(459891),
        n = e.i(79187),
        i = e.i(199834);
    e.s(["default", 0, e => {
        let {
            open: s,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: d
        } = e, {
            translate: u
        } = (0, n.useTranslation)();
        return (0, t.jsx)(r.Dialog, {
            open: s,
            onOpenChange: l,
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: u("Action.Close"),
            children: (0, t.jsxs)(r.DialogContent, {
                children: [(0, t.jsxs)(r.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, t.jsx)(r.DialogTitle, {
                        className: "text-heading-medium margin-y-none",
                        children: u("Label.IdVerification")
                    }), (0, t.jsx)(i.Typography, {
                        className: "text-body-medium",
                        children: u("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(i.Typography, {
                        className: "text-body-medium",
                        children: u("Description.IdVerifiedDialogReverify")
                    })]
                }), (0, t.jsxs)(r.DialogFooter, {
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
        r = e.i(605050);
    e.s(["useCreatorEligibility", 0, function() {
        let {
            overrideUserId: e,
            isReady: n = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: i
        } = (0, a.useAuthentication)(), s = null == i ? void 0 : i.id, l = null != e ? e : s;
        return (0, t.useQuery)({
            queryKey: ["creatorEligibility", null != l ? l : null],
            queryFn: async () => r.default.coreContentGetCreatorEligibility({
                userId: l
            }),
            enabled: n && !!l
        })
    }])
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
        } = e, [i, d] = (0, r.useState)(l), [u, c] = (0, r.useState)(!1), m = (0, r.useCallback)(async e => {
            try {
                let t = await n.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...s.map(e => {
                        var a, r;
                        return {
                            [e]: null != (a = null == t || null == (r = t.data) ? void 0 : r[e]) && a
                        }
                    }));
                d(a)
            } catch (e) {}
        }, []);
        (0, r.useEffect)(() => {
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
        let p = (0, r.useMemo)(() => ({
            frontendFlags: i,
            getFrontendFlags: m,
            loadingFrontendFlags: u
        }), [i, m, u]);
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
                groups: i,
                isFetched: s,
                currentGroup: l,
                setCurrentGroup: o
            } = (0, r.useGroups)(),
            d = (0, t.useRef)(!1),
            u = (0, t.useRef)(!1),
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
            m = (null == c ? void 0 : c.kind) === "group" && (null != i ? i : []).some(e => {
                let {
                    id: t
                } = e;
                return t === c.id
            });
        (0, t.useEffect)(() => {
            !d.current && null !== c && s && (d.current = !0, "user" === c.kind ? null !== l && o(null) : m && (null == l ? void 0 : l.id) !== c.id && o(c.id))
        }, [c, s, m, l, o]);
        let p = !e.isReady;
        return p || null === c || (p = "group" === c.kind ? !s || m && (null == l ? void 0 : l.id) !== c.id : !s || null !== l), (0, t.useEffect)(() => {
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
}, 198852, e => {
    "use strict";
    var t = e.i(285929);
    e.s(["CategoryDomain", () => t.V1ItemsCategoriesGetCategoryDomainEnum])
}, 192052, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(52746),
        r = e.i(39210),
        n = e.i(808048),
        i = e.i(962192),
        s = e.i(197649),
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
        f = (0, l.forwardRef)((e, a) => {
            let {
                children: n,
                variant: f = "System",
                severity: g = "Info",
                primaryActionLabel: h,
                primaryActionHref: v,
                primaryActionLinkTarget: y,
                onPrimaryAction: b,
                secondaryActionLabel: A,
                secondaryActionHref: T,
                secondaryActionLinkTarget: x,
                onSecondaryAction: w,
                hasCloseAffordance: S = !0,
                closeLabel: E = "Dismiss alert",
                onDismiss: I,
                className: C,
                style: k,
                ...M
            } = e, N = (0, r.default)("foundation-web-alert-message-"), P = !!h, D = !!A, L = !!(S && I), F = "Feedback" === f && (P || D || L), U = "Warning" === g || "Error" === g ? "alert" : "status", B = null;
            P && (B = D ? l.default.createElement(m, {
                label: h || "",
                href: v,
                linkTarget: y,
                onAction: b,
                variant: "Standard"
            }) : l.default.createElement(p, {
                label: h || "",
                href: v,
                linkTarget: y,
                onAction: b
            }));
            let V = D ? l.default.createElement(m, {
                label: A || "",
                href: T,
                linkTarget: x,
                onAction: w,
                variant: "Utility"
            }) : null;
            return l.default.createElement("div", {
                ref: a,
                role: F ? "region" : U,
                "aria-labelledby": F ? N : void 0,
                className: (0, s.default)("foundation-web-alert relative width-full stroke-standard", "System" === f ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", u[g], C),
                ...M
            }, l.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, s.default)("absolute inset-[0] pointer-events-none", "Feedback" === f && "radius-medium"),
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
                className: (0, s.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", D ? "flex-col" : "wrap")
            }, l.default.createElement("div", {
                id: F ? N : void 0,
                role: F ? U : void 0,
                className: (0, s.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", D ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, n), (B || V) && l.default.createElement("div", {
                className: (0, s.default)("flex items-center gap-small wrap shrink-0", !D && "padding-y-[var(--size-150)]")
            }, B, V)), L && l.default.createElement(i.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": E,
                onClick: I
            })))
        });
    e.s(["Alert", 0, f])
}, 270092, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(823981),
        r = e.i(688702),
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
        d = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        u = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        c = {
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
        f = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        g = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        h = e => {
            let {
                iconName: t,
                node: a,
                size: l
            } = e;
            return null != t ? i.default.createElement(r.Icon, {
                name: t,
                size: s[l]
            }) : null != a ? i.default.createElement("span", {
                className: (0, n.default)("inline-flex items-center justify-center shrink-0", g[l])
            }, a) : null
        },
        v = (0, i.forwardRef)((e, r) => {
            let {
                className: s,
                style: g,
                text: v,
                isDisabled: y = !1,
                size: b = "Medium",
                variant: A = "Standard",
                leadingIconName: T,
                leadingIconNode: x,
                trailingIconName: w,
                trailingIconNode: S,
                ...E
            } = e, I = null != T || null != x, C = null != w || null != S, k = (0, n.default)(y ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", I ? d[b] : o[b], C ? c[b] : u[b], l[b], s), M = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement(h, {
                iconName: T,
                node: x,
                size: b
            }), i.default.createElement("span", {
                className: (0, n.default)("padding-y-xsmall text-no-wrap text-truncate-end", I && m[b], C && p[b])
            }, v), i.default.createElement(h, {
                iconName: w,
                node: S,
                size: b
            })), N = {
                textDecoration: "none",
                ...g
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
                    "aria-disabled": y,
                    href: y ? void 0 : t,
                    className: (0, n.default)(k, f[A], "content-action-utility"),
                    style: N
                }, M)
            }
            let {
                as: P,
                isChecked: D,
                onCheckedChange: L,
                ...F
            } = E;
            return i.default.createElement("button", {
                ref: r,
                type: "button",
                ...F,
                className: (0, n.default)(D ? "bg-inverse-surface-0" : f[A], D ? "content-inverse-emphasis" : "content-action-utility", k),
                style: N,
                "aria-pressed": D,
                disabled: y,
                onClick: null == L ? void 0 : () => L(!D)
            }, M)
        });
    e.s(["Chip", 0, v])
}, 942625, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let r = (0, a.forwardRef)((e, r) => {
        let {
            className: n,
            style: i,
            orientation: s = "horizontal",
            variant: l = "Standard",
            ...o
        } = e, d = "vertical" === s, u = {};
        return d || "Inset" !== l ? d || "InsetLeft" !== l ? d || "InsetRight" !== l || (u = {
            marginRight: "var(--padding-xlarge)"
        }) : u = {
            marginLeft: "var(--padding-xlarge)"
        } : u = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: r,
            ...o,
            role: "separator",
            "data-orientation": s,
            "aria-orientation": s,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...d ? {
                    height: "100%",
                    width: 0,
                    borderLeftWidth: "var(--stroke-standard)",
                    borderTopWidth: 0
                } : "Thick" === l ? {
                    height: "var(--size-250)",
                    borderTop: "var(--stroke-standard)",
                    borderLeftWidth: 0,
                    background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                } : {
                    height: 0,
                    borderTopWidth: "var(--stroke-standard)",
                    borderLeftWidth: 0
                },
                ...u,
                ...i
            },
            className: (0, t.default)("stroke-default self-stretch", n)
        })
    });
    r.displayName = "Divider", e.s(["Divider", 0, r])
}, 46938, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(52746),
        r = e.i(962192),
        n = e.i(197649),
        i = e.i(416340);
    let s = {
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
        c = (0, i.forwardRef)((e, c) => {
            let {
                title: m,
                description: p,
                linkLabel: f,
                linkHref: g,
                onLinkClick: h,
                showIcon: v = !0,
                infoIconOverride: y,
                layout: b = "Inline",
                variant: A = "Standard",
                severity: T = "Info",
                primaryActionLabel: x,
                onPrimaryAction: w,
                secondaryActionLabel: S,
                onSecondaryAction: E,
                actions: I,
                onDismiss: C,
                dismissIconAriaLabel: k = "Dismiss banner",
                className: M,
                style: N,
                ...P
            } = e, D = s[T], L = "Emphasis" === A ? u[T] : "", F = "Info" === T && y ? y : o[T], U = "Stacked" === b, B = !!I || !!(x && w) || !!(S && E), V = f && i.default.createElement("a", {
                className: "text-body-medium underline content-default text-wrap [overflow-wrap:anywhere]",
                href: g,
                onClick: h
            }, f), O = V && i.default.createElement("span", {
                className: "min-width-0 max-width-full"
            }, U || !p ? " · " : " · ", V), R = null != I ? I : x && w || S && E ? i.default.createElement("div", {
                className: "flex items-center gap-small wrap"
            }, x && w && i.default.createElement(a.Button, {
                size: "Small",
                variant: "Standard",
                onClick: w,
                className: (0, n.default)("content-emphasis label-small", L)
            }, x), S && E && i.default.createElement(a.Button, {
                size: "Small",
                variant: "Utility",
                onClick: E,
                className: (0, n.default)("content-emphasis label-small")
            }, S)) : null, j = C && i.default.createElement(r.CloseAffordance, {
                variant: "Utility",
                size: "Small",
                isCircular: !0,
                className: "content-emphasis",
                "aria-label": k,
                onClick: C
            });
            return i.default.createElement("div", {
                ref: c,
                role: "Warning" === T || "Error" === T ? "alert" : "status",
                className: (0, n.default)("foundation-web-feedback-banner flex flex-col gap-small radius-medium padding-large stroke-standard", "Standard" === A ? "bg-shift-100" : void 0, "Standard" === A ? "stroke-default" : l[T], M),
                style: {
                    backgroundColor: "Emphasis" === A ? D : void 0,
                    ...N
                },
                ...P
            }, i.default.createElement("div", {
                className: (0, n.default)("flex width-full gap-medium", U ? "items-start" : "items-center wrap")
            }, i.default.createElement("div", {
                className: (0, n.default)("flex grow-1", U ? "flex-col gap-medium basis-0 min-width-0" : "items-center gap-xsmall wrap basis-0 min-width-[min(200px,100%)]")
            }, i.default.createElement("div", {
                className: (0, n.default)("flex min-width-0", U ? "gap-medium flex-col grow-1 basis-0" : "gap-xsmall items-center wrap width-full")
            }, i.default.createElement("div", {
                className: "flex items-center gap-xsmall wrap"
            }, i.default.createElement("div", {
                className: (0, n.default)("flex items-center gap-medium", U ? "min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, v && F && i.default.createElement(t.Icon, {
                name: F,
                size: "Large",
                className: "shrink-0",
                style: {
                    color: d[T]
                }
            }), i.default.createElement("span", {
                className: (0, n.default)("text-label-medium text-wrap content-emphasis [overflow-wrap:anywhere]", U ? "" : "block padding-y-xsmall min-width-0 grow-1 basis-0")
            }, m)), U && O), p && (U ? i.default.createElement("div", {
                className: (0, n.default)("text-body-medium text-wrap content-default width-full [overflow-wrap:anywhere]")
            }, p) : i.default.createElement("span", {
                className: "text-body-medium text-wrap content-default block min-width-0 max-width-full [overflow-wrap:anywhere]"
            }, p, O)), !U && !p && O), U && B && R), !U && (B || C) && i.default.createElement("div", {
                className: "flex items-center justify-end gap-small wrap shrink-0 max-width-full margin-left-auto"
            }, B && R, j), U && j && i.default.createElement("div", {
                className: "shrink-0"
            }, j)))
        });
    e.s(["FeedbackBanner", 0, c])
}, 631719, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(823981),
        r = e.i(197649),
        n = e.i(416340),
        i = e.i(23342);
    let s = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        l = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        o = {
            Large: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Medium: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Small: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            XSmall: {
                circular: "radius-circle",
                square: "radius-small"
            }
        },
        d = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        u = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        c = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        m = {
            Default: {
                Emphasis: "content-action-emphasis",
                Standard: "content-action-standard",
                Alert: "content-action-alert",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-emphasis",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-alert",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        p = {
            Default: {
                Emphasis: "content-action-standard",
                Standard: "content-action-standard",
                Alert: "content-action-standard",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-standard",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-standard",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        f = (0, n.forwardRef)((e, f) => {
            let g, {
                className: h,
                icon: v,
                ariaLabel: y,
                isDisabled: b = !1,
                isCircular: A = !1,
                isSelected: T = !1,
                size: x = "Large",
                variant: w = "Emphasis",
                iconColor: S = "Default",
                asChild: E,
                children: I,
                ...C
            } = e;
            g = b ? u[w] : T ? c[w] : d[w];
            let k = (0, r.default)("foundation-web-icon-button", b ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", s[x], o[x][A ? "circular" : "square"], g, h),
                M = n.default.createElement(n.default.Fragment, null, n.default.createElement(t.StateLayer, null), n.default.createElement("span", {
                    className: (0, r.default)("icon", v, l[x], b ? p[S][w] : m[S][w])
                }));
            if (E) {
                let {
                    as: e,
                    ...t
                } = C, a = n.default.Children.only(I);
                return n.default.createElement(i.Slot, {
                    ref: f,
                    ...t,
                    className: k,
                    "aria-label": y,
                    "aria-disabled": b || void 0
                }, n.default.cloneElement(a, {}, M))
            }
            if ("a" === C.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = C;
                return n.default.createElement("a", {
                    ref: f,
                    ...a,
                    "aria-label": y,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: k
                }, M)
            }
            let {
                as: N,
                ...P
            } = C;
            return n.default.createElement("button", {
                ref: f,
                type: "button",
                ...P,
                "aria-label": y,
                disabled: b,
                className: k
            }, M)
        });
    e.s(["IconButton", 0, f])
}, 808048, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        r = e.i(23342);
    let n = new Set(["_self", "_parent", "_top"]),
        i = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        s = {
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
                underline: h = "hover",
                isExternal: v,
                asChild: y,
                ...b
            } = e, A = (d = null != (o = b.as) ? o : "a", u = "button" === b.as ? void 0 : b.target, void 0 !== v ? v : "button" !== d && void 0 !== u && !n.has(u)), T = (0, t.default)("foundation-web-link", "button" === b.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || A) && "inline-flex items-center gap-xsmall", void 0 !== p && i[p], s[f], "always" === h ? "underline" : "no-underline", "hover" === h && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", m), x = A ? a.default.createElement("span", {
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
                as: w,
                ...S
            } = b;
            return a.default.createElement("a", {
                ref: l,
                ...S,
                className: T
            }, c, x)
        });
    l.displayName = "Link", e.s(["Link", 0, l])
}, 339338, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        r = e.i(734463);
    let n = e => {
        var t, a, r, n, i, s;
        let l = null != (t = null == (r = (n = window).matchMedia) || null == (a = r.call(n, "(pointer: coarse)")) ? void 0 : a.matches) && t,
            o = null == (i = document.activeElement) ? void 0 : i.matches(":focus-visible");
        if (l && !o) return void e.preventDefault();
        let d = null == (s = e.currentTarget) ? void 0 : s.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        d && (e.preventDefault(), d.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: n,
            onOpenChange: i,
            children: s
        } = e;
        return a.createElement(r.Root, {
            open: t,
            defaultOpen: n,
            onOpenChange: i
        }, s)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: n,
            children: i
        } = e;
        return a.createElement(r.Anchor, {
            asChild: t,
            className: n
        }, i)
    }, "PopoverContent", 0, function(e) {
        let {
            side: i = "bottom",
            align: s = "center",
            sideOffset: l = 4,
            className: o,
            children: d,
            ariaLabel: u,
            onOpenAutoFocus: c,
            ...m
        } = e;
        return a.createElement(r.Portal, null, a.createElement(r.Content, {
            side: i,
            align: s,
            sideOffset: l,
            ...m,
            "aria-label": null != u ? u : m["aria-label"],
            onOpenAutoFocus: null != c ? c : n,
            className: (0, t.default)("foundation-web-portal-zindex", o)
        }, d))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: n,
            className: i,
            children: s
        } = e;
        return a.createElement(r.Trigger, {
            asChild: t,
            disabled: n,
            className: i
        }, s)
    }])
}, 176148, e => {
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
                className: i,
                size: s = "Large",
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
            } = r[s], h = (m - p) / 2, v = 2 * Math.PI * h, y = m / 2, b = Math.min(100, Math.max(0, o)), A = d && void 0 !== g ? g : m, T = "Determinate" === l;
            return a.default.createElement("div", {
                ref: n,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", i),
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
                r: h,
                fill: "none",
                strokeWidth: p,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), a.default.createElement("circle", {
                cx: y,
                cy: y,
                r: h,
                fill: "none",
                strokeWidth: p,
                strokeDasharray: T ? v : "".concat(.75 * v, " ").concat(.25 * v),
                strokeDashoffset: T ? v * (1 - b / 100) : 0,
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
            })), T && d && "Large" === s && a.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", f),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(b)), a.default.createElement("span", null, "%")))
        });
    n.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, n])
}, 951336, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(631719),
        r = e.i(197649),
        n = e.i(416340);
    let i = (0, n.createContext)(null),
        s = e => {
            let t = (0, n.useContext)(i);
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
        f = (0, n.forwardRef)((e, t) => {
            let {
                children: a,
                size: s = "Medium",
                variant: l = "Divided",
                className: o,
                ...d
            } = e, u = (0, n.useMemo)(() => ({
                size: s,
                variant: l
            }), [s, l]), c = "Framed" === l;
            return n.default.createElement(i.Provider, {
                value: u
            }, n.default.createElement("div", {
                className: (0, r.default)("width-full bg-surface-100", c && "radius-medium clip stroke-standard stroke-default")
            }, n.default.createElement("table", {
                ref: t,
                className: (0, r.default)("foundation-web-table width-full content-default", o),
                ...d
            }, a)))
        });
    f.displayName = "Table";
    let g = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: i,
            ...l
        } = e;
        return s("TableHeader"), n.default.createElement("thead", {
            ref: t,
            className: (0, r.default)("foundation-web-table-header", i),
            ...l
        }, a)
    });
    g.displayName = "TableHeader";
    let h = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: i,
            ...l
        } = e;
        return s("TableBody"), n.default.createElement("tbody", {
            ref: t,
            className: (0, r.default)("foundation-web-table-body", i),
            ...l
        }, a)
    });
    h.displayName = "TableBody";
    let v = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: i,
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
        s("TableRow");
        let h = l ? {
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
        return n.default.createElement("tr", {
            ref: t,
            "aria-selected": l ? d : void 0,
            "aria-disabled": !!l && !!u || void 0,
            "data-selected": d || void 0,
            className: (0, r.default)("foundation-web-table-row", (l || o) && "hover:bg-shift-100", l && !u && "cursor-pointer", l && u && "opacity-disabled pointer-events-none", d && "bg-shift-200", i),
            ...h,
            ...g
        }, a)
    });
    v.displayName = "TableRow";
    let y = (0, n.forwardRef)((e, a) => {
        let {
            children: i,
            className: l,
            sortDirection: c,
            onSort: f,
            align: g = "start",
            sortLabel: h,
            scope: v,
            ...y
        } = e, {
            size: b
        } = s("TableHeaderCell"), A = !!f, T = null != c ? c : "none", x = A && "none" !== T && n.default.createElement(t.Icon, {
            name: "ascending" === T ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), w = n.default.createElement("div", {
            className: (0, r.default)("flex items-center gap-xsmall", u[b], "content-muted", p[g])
        }, "end" === g && x, n.default.createElement("span", {
            className: "text-truncate-end"
        }, i), "end" !== g && x), S = "string" == typeof i ? "Sort by ".concat(i) : void 0;
        return n.default.createElement("th", {
            ref: a,
            scope: null != v ? v : "col",
            "aria-sort": A ? T : void 0,
            className: (0, r.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", d[b], o[b], m[g], "content-muted", l),
            ...y
        }, A ? n.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: f,
            "aria-label": null != h ? h : S
        }, w) : w)
    });
    y.displayName = "TableHeaderCell";
    let b = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: i,
            align: d = "start",
            ...u
        } = e, {
            size: p
        } = s("TableCell");
        return n.default.createElement("td", {
            ref: t,
            className: (0, r.default)("foundation-web-table-cell foundation-web-table-row-divider", l[p], o[p], c[p], m[d], "content-default", i),
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
        S = {
            XSmall: "gap-xsmall",
            Small: "gap-xsmall",
            Medium: "gap-small"
        },
        E = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "Small"
        },
        I = (0, n.forwardRef)((e, t) => {
            let {
                size: i = "Medium",
                page: s,
                rowsPerPage: l,
                totalRows: o,
                rowsPerPageOptions: d = [10, 25, 50],
                onPageChange: u,
                onRowsPerPageChange: c,
                rowsPerPageLabel: m = "Rows per page",
                firstPageLabel: p = "First page",
                previousPageLabel: f = "Previous page",
                nextPageLabel: g = "Next page",
                lastPageLabel: h = "Last page",
                rangeLabel: v,
                className: y,
                ...b
            } = e, I = Math.max(1, Math.ceil(o / l)), C = 0 === s, k = s >= I - 1, M = 0 === o ? 0 : s * l + 1, N = Math.min((s + 1) * l, o), P = (0, n.useCallback)(e => {
                let t = Number(e.target.value);
                null == c || c(t), u(0)
            }, [c, u]), D = E[i];
            return n.default.createElement("div", {
                ref: t,
                className: (0, r.default)("flex items-center justify-end", A[i], T[i], y),
                ...b
            }, n.default.createElement("div", {
                className: "flex items-center gap-large"
            }, n.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, c && n.default.createElement("div", {
                className: "flex items-center gap-small"
            }, n.default.createElement("span", {
                className: (0, r.default)(x[i], "content-default")
            }, m), n.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, n.default.createElement("select", {
                className: (0, r.default)("foundation-web-table-pagination-select", x[i], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === i ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: l,
                onChange: P,
                "aria-label": m
            }, d.map(e => n.default.createElement("option", {
                key: e,
                value: e
            }, e))))), n.default.createElement("span", {
                className: (0, r.default)(w[i], "content-default")
            }, v ? v(M, N, o) : "".concat(M, "-").concat(N, " of ").concat(o))), n.default.createElement("div", {
                className: (0, r.default)("flex items-center", S[i])
            }, n.default.createElement(a.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: p,
                size: D,
                variant: "Utility",
                isDisabled: C,
                onClick: () => u(0)
            }), n.default.createElement(a.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: f,
                size: D,
                variant: "Utility",
                isDisabled: C,
                onClick: () => u(s - 1)
            }), n.default.createElement(a.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: g,
                size: D,
                variant: "Utility",
                isDisabled: k,
                onClick: () => u(s + 1)
            }), n.default.createElement(a.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: h,
                size: D,
                variant: "Utility",
                isDisabled: k,
                onClick: () => u(I - 1)
            }))))
        });
    I.displayName = "TablePagination", e.s(["Table", 0, f, "TableBody", 0, h, "TableCell", 0, b, "TableHeader", 0, g, "TableHeaderCell", 0, y, "TablePagination", 0, I, "TableRow", 0, v])
}, 67252, e => {
    "use strict";
    var t = e.i(823981),
        a = e.i(39210),
        r = e.i(908202),
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
        d = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        u = i.default.forwardRef((e, u) => {
            let {
                size: c,
                variant: m = "Standard",
                label: p,
                value: f,
                defaultValue: g,
                isDisabled: h,
                hasError: v,
                helperText: y,
                className: b,
                style: A,
                textareaClassName: T,
                textareaStyle: x,
                id: w,
                ...S
            } = e, E = (0, a.default)(), I = w || E, C = "".concat(I, "-description"), k = null != c ? c : "Large";
            return i.default.createElement("div", {
                className: (0, n.default)("flex fill flex-col width-full gap-small", {
                    [t.disabledOpacity]: h
                }, b),
                style: A
            }, p && i.default.createElement("label", {
                htmlFor: I,
                className: (0, n.default)(o[k], "content-emphasis")
            }, p), i.default.createElement("textarea", {
                ref: u,
                id: I,
                "data-testid": "text-area-container",
                style: x,
                className: (0, n.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", r.INPUT_BACKGROUND_BY_VARIANT[m], r.INPUT_STROKE_BY_VARIANT[m], v ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", d[k], s[k], l[k], T),
                value: f,
                defaultValue: null == f ? g : void 0,
                disabled: h,
                "aria-describedby": y ? C : void 0,
                ...S
            }), y && i.default.createElement("span", {
                id: C,
                className: (0, n.default)("text-caption-small", {
                    "content-system-alert": v,
                    "content-default": !v
                })
            }, y))
        });
    u.displayName = "TextArea", e.s(["TextArea", 0, u])
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
            onFetch: (n, i) => {
                var s, l, o, d, u;
                let c = n.options,
                    m = null == (o = n.fetchOptions) || null == (l = o.meta) || null == (s = l.fetchMore) ? void 0 : s.direction,
                    p = (null == (d = n.state.data) ? void 0 : d.pages) || [],
                    f = (null == (u = n.state.data) ? void 0 : u.pageParams) || [],
                    g = {
                        pages: [],
                        pageParams: []
                    },
                    h = 0,
                    v = async () => {
                        let i = !1,
                            s = (0, t.ensureQueryFn)(n.options, n.fetchOptions),
                            l = async (e, a, r) => {
                                let l;
                                if (i) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(l = {
                                        client: n.client,
                                        queryKey: n.queryKey,
                                        pageParam: a,
                                        direction: r ? "backward" : "forward",
                                        meta: n.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (n.signal.aborted ? i = !0 : n.signal.addEventListener("abort", () => {
                                            i = !0
                                        }), n.signal)
                                    }), l),
                                    d = await s(o),
                                    {
                                        maxPages: u
                                    } = n.options,
                                    c = r ? t.addToStart : t.addToEnd;
                                return {
                                    pages: c(e.pages, d, u),
                                    pageParams: c(e.pageParams, a, u)
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
                                let e = 0 === h ? null != (o = f[0]) ? o : c.initialPageParam : a(c, g);
                                if (h > 0 && null == e) break;
                                g = await l(g, e), h++
                            } while (h < t)
                        }
                        return g
                    };
                n.options.persister ? n.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = n.options).persister) ? void 0 : e.call(t, v, {
                        client: n.client,
                        queryKey: n.queryKey,
                        meta: n.options.meta,
                        signal: n.signal
                    }, i)
                } : n.fetchFn = v
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
                    state: i
                } = e, s = super.createResult(e, t), {
                    isFetching: l,
                    isRefetching: o,
                    isError: d,
                    isRefetchError: u
                } = s, c = null == (n = i.fetchMeta) || null == (r = n.fetchMore) ? void 0 : r.direction, m = d && "forward" === c, p = l && "forward" === c, f = d && "backward" === c, g = l && "backward" === c;
                return {
                    ...s,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.hasNextPage)(t, i.data),
                    hasPreviousPage: (0, a.hasPreviousPage)(t, i.data),
                    isFetchNextPageError: m,
                    isFetchingNextPage: p,
                    isFetchPreviousPageError: f,
                    isFetchingPreviousPage: g,
                    isRefetchError: u && !m && !f,
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

//# debugId=f020a330-7cdd-716a-d580-aff3abb1c364
//# sourceMappingURL=2z8346kcdrbg3.js.map