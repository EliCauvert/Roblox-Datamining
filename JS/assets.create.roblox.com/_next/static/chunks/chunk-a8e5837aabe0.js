;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "67a0455f-4946-be0a-a07c-b8cfb32efae2")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 118413, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "analyticsChartLoadEventstreamEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "visibleAssetIdInPersonalizationEnabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentationTemplatesEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomMetricsBackendEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "acquisitionMigrationMetricsEnabled",
            defaultValue: !1
        }),
        c = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0
        }),
        d = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0
        }),
        u = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0
        }),
        m = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        p = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        f = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1
        }),
        h = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1
        }),
        g = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantStreamSilenceRecoveryEnabled",
            defaultValue: !1
        }),
        b = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1
        }),
        y = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1
        }),
        C = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1
        }),
        k = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1
        }),
        v = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1
        }),
        E = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1
        }),
        S = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1
        }),
        w = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1
        }),
        A = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1
        }),
        D = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !1
        }),
        x = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1
        }),
        R = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1
        }),
        B = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1
        }),
        T = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isMetricVariantChartStateEnabled",
            defaultValue: !1
        }),
        M = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isPeriodSummaryBridgeEnabled",
            defaultValue: !1
        }),
        I = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentSegmentationEnabled",
            defaultValue: !1
        }),
        V = (0, t.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientSessionDetailsV2Enabled",
            defaultValue: !1
        });
    e.s(["acquisitionMigrationMetricsEnabled", 0, s, "analyticsChartLoadEventstreamEnabled", 0, a, "isAnalyticsAssistantChatEnabled", 0, h, "isAnalyticsAssistantIssueBannerEnabled", 0, b, "isAnalyticsAssistantStreamSilenceRecoveryEnabled", 0, g, "isAnalyticsMetricAwareYAxisFormatterEnabled", 0, w, "isAssistantChartOverflowMenuEnabled", 0, S, "isClientSessionDetailsV2Enabled", 0, V, "isClientSessionsEnabled", 0, x, "isCustomDashboardsLocalStorageEnabled", 0, A, "isCustomMetricsBackendEnabled", 0, i, "isEhdResultsAlwaysFetched", 0, B, "isEhdResultsEnabled", 0, R, "isExperimentNullControlValueEnabled", 0, d, "isExperimentRolloutEnabled", 0, u, "isExperimentSegmentationEnabled", 0, I, "isExperimentTargetingEnabled", 0, r, "isExperimentationTemplatesEnabled", 0, l, "isGeneralBreakGlassBannerEnabled", 0, m, "isJourneyEventsEnabled", 0, D, "isLimitedAnalyticsAdminMonitoringNavigationEnabled", 0, n, "isMetricVariantChartStateEnabled", 0, T, "isMonetizationBreakGlassBannerEnabled", 0, p, "isPeriodSummaryBridgeEnabled", 0, M, "isPlayerFeedbackExampleCommentsEnabled", 0, f, "isRotraceMetricEnabled", 0, C, "isTargetingConfigsEnabled", 0, c, "isTelemetryMigrationEnabled", 0, k, "isTreemapColorBySiblingProportionEnabled", 0, E, "showCreatorRewardsReportingDisclaimer", 0, y, "showVideoServiceDashboard", 0, v, "visibleAssetIdInPersonalizationEnabled", 0, o])
}, 665869, 729904, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "groups",
            name: "enableGroupGameEarlyTesters",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "groups",
            name: "enableGroupModerationPage",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "groups",
            name: "enableGroupDeactivation",
            defaultValue: !1
        });
    e.s(["enableGroupDeactivation", 0, o, "enableGroupGameEarlyTesters", 0, a, "enableGroupModerationPage", 0, n], 665869), e.s(["default", 0, function() {
        return "production"
    }], 729904)
}, 533968, e => {
    "use strict";
    var t = e.i(185915);
    e.s(["getResponseFromError", () => t.default])
}, 105098, 995721, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)({
        isLoadingLook: !1,
        refreshLookDetails: () => {
            throw Error("function is not implemented")
        },
        lookSalesData: void 0,
        lookDetail: void 0
    });
    a.displayName = "LookDetails", e.s(["default", 0, a], 995721), e.s(["default", 0, function() {
        return (0, t.useContext)(a)
    }], 105098)
}, 17829, e => {
    "use strict";
    var t, a = ((t = a || {}).User = "User", t.Group = "Group", t);
    e.s(["default", 0, a])
}, 627636, e => {
    "use strict";
    var t = e.i(17829);
    e.s(["CreatorType", () => t.default])
}, 450639, 626448, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(79187),
        o = e.i(751846),
        l = e.i(808377),
        i = e.i(940042),
        r = e.i(345886),
        s = e.i(381221),
        c = e.i(29013);
    e.s(["NotInterestedIcon", () => c.NotInterested], 626448);
    var c = c,
        d = e.i(589418),
        u = e.i(623983),
        m = e.i(697973);
    let p = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        return (0, m.makeStyles)()(t => ({
            imageStatusContainer: {
                backgroundColor: e ? t.palette.surface.outline : t.palette.components.input.filled.enableFill,
                color: e ? t.palette.content.inverse : t.palette.content.muted,
                width: "100%",
                height: "100%"
            },
            statusTextContainer: {
                display: "block",
                textAlign: "center",
                whiteSpace: "nowrap",
                color: e ? t.palette.content.inverse : t.palette.content.muted
            },
            imageContainer: {
                width: "100%",
                height: 0,
                paddingTop: "100%",
                position: "relative",
                borderRadius: e ? 4 : 8,
                overflow: "hidden",
                backgroundColor: t.palette.components.input.filled.enableFill
            },
            imageWrapper: {
                position: "absolute",
                bottom: 0,
                left: 0,
                width: "100%",
                height: "100%",
                textAlign: "center"
            },
            image: {
                width: "100%",
                height: "100%",
                position: "absolute",
                left: "0",
                bottom: "0",
                objectFit: "contain"
            },
            bottomRightAdornmentContainer: {
                position: "absolute",
                bottom: 8,
                right: 8,
                padding: 4,
                borderRadius: 4,
                background: t.palette.surface[200],
                display: "flex"
            },
            skeleton: {
                height: "100%"
            }
        }))
    };
    e.s(["default", 0, e => {
        let {
            targetId: m,
            targetType: f,
            returnPolicy: h = o.ReturnPolicy.AutoGenerated,
            isStatusTextShown: g = !1,
            alt: b,
            fontColor: y = "light",
            bottomRightAdornment: C
        } = e, {
            classes: {
                imageStatusContainer: k,
                statusTextContainer: v,
                imageWrapper: E,
                imageContainer: S,
                image: w,
                bottomRightAdornmentContainer: A,
                skeleton: D
            }
        } = p("light" !== y)(), {
            translate: x
        } = (0, n.useTranslation)(), [R, B] = (0, a.useState)(!1), [T, M] = (0, a.useState)(), I = (0, a.useCallback)(async function(e, t, a) {
            let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (t && e) {
                B(!0);
                try {
                    let l = n ? o.ThumbnailClient.reloadThumbnailImage : o.ThumbnailClient.getThumbnailImage,
                        i = await l(e, t, a);
                    M(i)
                } catch (e) {
                    M({
                        state: l.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    B(!1)
                }
            }
        }, []), V = (0, a.useMemo)(() => {
            if (R) return (0, t.jsx)(d.Skeleton, {
                classes: {
                    root: D
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                a = null;
            switch (null == T ? void 0 : T.state) {
                case l.ThumbnailResponseState.InReview:
                    e = x("Label.InReview"), a = (0, t.jsx)(s.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === y ? void 0 : "secondary"
                    });
                    break;
                case l.ThumbnailResponseState.Blocked:
                    e = x("Label.Moderated"), a = (0, t.jsx)(c.NotInterested, {
                        fontSize: "large",
                        color: "dark" === y ? void 0 : "secondary"
                    });
                    break;
                case l.ThumbnailResponseState.Error:
                case l.ThumbnailResponseState.TemporarilyUnavailable:
                    e = x("Label.Unavailable"), a = (0, t.jsx)(i.BrokenImageOutlinedIcon, {
                        fontSize: "large",
                        color: "dark" === y ? void 0 : "secondary"
                    });
                    break;
                default:
                    return null
            }
            return (0, t.jsx)(r.Grid, {
                container: !0,
                classes: {
                    root: k
                },
                justifyContent: "center",
                alignItems: "center",
                children: g ? (0, t.jsxs)("div", {
                    children: [a, (0, t.jsx)(u.Typography, {
                        variant: "smallLabel1",
                        classes: {
                            root: v
                        },
                        children: e
                    })]
                }) : a
            })
        }, [R, null == T ? void 0 : T.state, k, g, v, D, x, y]);
        return (0, a.useEffect)(() => {
            I(f, m, h)
        }, [m, f, h, I]), {
            thumbnailImage: (0, t.jsx)(r.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, t.jsxs)("div", {
                    className: S,
                    children: [(null == T ? void 0 : T.state) === l.ThumbnailResponseState.Completed ? (0, t.jsx)("img", {
                        className: w,
                        src: null == T ? void 0 : T.imageUrl,
                        alt: b
                    }) : (0, t.jsx)("div", {
                        className: E,
                        children: V
                    }), C ? (0, t.jsx)("div", {
                        className: A,
                        children: C
                    }) : null]
                })
            }),
            thumbnailData: T,
            refreshThumbnail: (0, a.useCallback)(async () => I(f, m, h, !0), [I, f, m, h])
        }
    }], 450639)
}, 692587, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return Object.entries(e).reduce((e, t) => {
            let [a, n] = t;
            return Array.isArray(n) ? e[a] = n.at(0) : e[a] = n, e
        }, {})
    }, "readQueryValue", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 114209, 559227, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(589624),
        o = e.i(773057),
        l = e.i(392782);
    let i = (0, a.createContext)({
        isLoadingGame: !1,
        isErrorLoadingGame: !1,
        canConfigure: !1,
        gameDetails: null,
        refreshGameDetails: () => {
            throw Error("Not implemented")
        }
    });
    i.displayName = "Game", e.s(["default", 0, i], 559227);
    var r = e.i(721281),
        s = e.i(252842),
        c = e.i(533968);
    let d = new class {
        async getGameDetail(e, t) {
            var a, n, o;
            if (!t && this.gameDetailsMap.has(e)) return null != (a = this.gameDetailsMap.get(e)) ? a : null;
            try {
                let t = null != (n = null == (o = (await this.gamesClient.getDetails([e])).data) ? void 0 : o[0]) ? n : null;
                return t && this.gameDetailsMap.set(e, t), t
            } catch (a) {
                let t = (0, c.getResponseFromError)(a);
                if ((null == t ? void 0 : t.status) === s.StatusCodes.BAD_REQUEST) return null;
                throw console.log("Could not fetch game details for universeId ".concat(e)), a
            }
        }
        async getConfiguration(e, t) {
            if (!t && this.gameConfigurationMap.has(e)) {
                var a;
                return null != (a = this.gameConfigurationMap.get(e)) ? a : null
            }
            try {
                return await this.developClient.getUniverseConfiguration(e), this.gameConfigurationMap.set(e, !0), !0
            } catch (a) {
                let t = (0, c.getResponseFromError)(a);
                if ((null == t ? void 0 : t.status) === s.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(e, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(e)), null
            }
        }
        constructor(e, t) {
            (0, r._)(this, "gamesClient", void 0), (0, r._)(this, "developClient", void 0), (0, r._)(this, "gameDetailsMap", void 0), (0, r._)(this, "gameConfigurationMap", void 0), this.gamesClient = e, this.developClient = t, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(l.default, o.default);
    e.s(["default", 0, e => {
        let {
            requestedGameId: o,
            children: l
        } = e, r = (0, n.useRouter)(), [s, c] = (0, a.useState)(!0), [u, m] = (0, a.useState)(null), [p, f] = (0, a.useState)(null), [h, g] = (0, a.useState)(!1), b = (0, a.useRef)(0), y = (0, a.useCallback)(async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                a = b.current += 1,
                n = d.getConfiguration(e),
                o = d.getGameDetail(e, t),
                [l, i] = await Promise.allSettled([n, o]);
            a === b.current && ("fulfilled" === l.status ? m(l.value) : m(null), "fulfilled" === i.status ? (g(!1), f(i.value)) : ("rejected" === i.status ? g(!0) : g(!1), f(null)), c(!1))
        }, []), C = (0, a.useMemo)(() => {
            let {
                id: e
            } = r.query;
            return o || ("string" == typeof e ? parseInt(e, 10) : void 0)
        }, [o, r.query]), k = (0, a.useCallback)(() => C ? y(C, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [C, y]);
        (0, a.useEffect)(() => {
            try {
                if (void 0 !== C && !Number.isNaN(C) && C > 0) return void y(C);
                b.current += 1, m(null), f(null), g(!1), c(!1)
            } catch (e) {
                console.warn("Could not fetch game details for universeId ".concat(C))
            }
        }, [C, y]);
        let v = (0, a.useMemo)(() => ({
            isLoadingGame: s,
            canConfigure: u,
            gameDetails: p,
            isErrorLoadingGame: h,
            refreshGameDetails: k
        }), [s, u, p, h, k]);
        return (0, t.jsx)(i.Provider, {
            value: v,
            children: l
        })
    }, "useCurrentGame", 0, function() {
        let e = (0, a.useContext)(i);
        if (null === e) throw Error("useCurrentGame must be used within a GameProvider");
        return e
    }], 114209)
}, 808377, e => {
    "use strict";
    var t = e.i(620140);
    e.s(["ThumbnailResponseState", () => t.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum])
}, 387660, e => {
    "use strict";
    var t = e.i(275666);
    e.s(["accordionSummaryClasses", () => t.a])
}, 49152, e => {
    "use strict";
    var t = e.i(299656);
    e.s(["buttonClasses", () => t.b])
}, 546995, e => {
    "use strict";
    var t = e.i(416340);
    e.i(690569);
    var a = e.i(221628),
        n = e.i(230505);
    e.i(734994), e.s(["N", 0, function(e) {
        let {
            children: o,
            defer: l = !1,
            fallback: i = null
        } = e, [r, s] = t.useState(!1);
        return (0, n.u)(() => {
            l || s(!0)
        }, [l]), t.useEffect(() => {
            l && s(!0)
        }, [l]), (0, a.jsx)(t.Fragment, {
            children: r ? o : i
        })
    }])
}, 610873, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340);

    function n(e) {
        return "small" === e ? 16 : 20
    }

    function o(e) {
        return "small" === e ? 18 : 24
    }
    var l = e.i(863605),
        i = e.i(154502),
        r = e.i(787802),
        s = e.i(690569),
        c = e.i(817717),
        d = e.i(945146),
        u = e.i(251635),
        m = e.i(51928),
        p = e.i(221628),
        f = e.i(121880);

    function h(e) {
        return (0, s.g)("MuiSwitch", e)
    }
    e.i(465957);
    var g = (0, r.g)("MuiSwitch", ["root", "edgeStart", "edgeEnd", "switchBase", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium", "checked", "disabled", "input", "thumb", "track"]);
    let b = ["className", "color", "edge", "size", "sx"],
        y = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, a.edge && t["edge".concat((0, s.a)(a.edge))], t["size".concat((0, s.a)(a.size))]]
            }
        })({
            display: "inline-flex",
            width: 58,
            height: 38,
            overflow: "hidden",
            padding: 12,
            boxSizing: "border-box",
            position: "relative",
            flexShrink: 0,
            zIndex: 0,
            verticalAlign: "middle",
            "@media print": {
                colorAdjust: "exact"
            },
            variants: [{
                props: {
                    edge: "start"
                },
                style: {
                    marginLeft: -8
                }
            }, {
                props: {
                    edge: "end"
                },
                style: {
                    marginRight: -8
                }
            }, {
                props: {
                    size: "small"
                },
                style: {
                    width: 40,
                    height: 24,
                    padding: 7,
                    ["& .".concat(g.thumb)]: {
                        width: 16,
                        height: 16
                    },
                    ["& .".concat(g.switchBase)]: {
                        padding: 4,
                        ["&.".concat(g.checked)]: {
                            transform: "translateX(16px)"
                        }
                    }
                }
            }]
        }),
        C = (0, u.s)(m.S, {
            name: "MuiSwitch",
            slot: "SwitchBase",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.switchBase, {
                    ["& .".concat(g.input)]: t.input
                }, "default" !== a.color && t["color".concat((0, s.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t
            } = e;
            return {
                position: "absolute",
                top: 0,
                left: 0,
                zIndex: 1,
                color: t.vars ? t.vars.palette.Switch.defaultColor : "".concat("light" === t.palette.mode ? t.palette.common.white : t.palette.grey[300]),
                transition: t.transitions.create(["left", "transform"], {
                    duration: t.transitions.duration.shortest
                }),
                ["&.".concat(g.checked)]: {
                    transform: "translateX(20px)"
                },
                ["&.".concat(g.disabled)]: {
                    color: t.vars ? t.vars.palette.Switch.defaultDisabledColor : "".concat("light" === t.palette.mode ? t.palette.grey[100] : t.palette.grey[600])
                },
                ["&.".concat(g.checked, " + .").concat(g.track)]: {
                    opacity: .5
                },
                ["&.".concat(g.disabled, " + .").concat(g.track)]: {
                    opacity: t.vars ? t.vars.opacity.switchTrackDisabled : "" + ("light" === t.palette.mode ? .12 : .2)
                },
                ["& .".concat(g.input)]: {
                    left: "-100%",
                    width: "300%"
                }
            }
        }, e => {
            let {
                theme: t
            } = e;
            return {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.action.activeChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, s.b)(t.palette.action.active, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                },
                variants: [...Object.entries(t.palette).filter(e => {
                    let [, t] = e;
                    return t.main && t.light
                }).map(e => {
                    let [a] = e;
                    return {
                        props: {
                            color: a
                        },
                        style: {
                            ["&.".concat(g.checked)]: {
                                color: (t.vars || t).palette[a].main,
                                "&:hover": {
                                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette[a].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, s.b)(t.palette[a].main, t.palette.action.hoverOpacity),
                                    "@media (hover: none)": {
                                        backgroundColor: "transparent"
                                    }
                                },
                                ["&.".concat(g.disabled)]: {
                                    color: t.vars ? t.vars.palette.Switch["".concat(a, "DisabledColor")] : "".concat("light" === t.palette.mode ? (0, s.l)(t.palette[a].main, .62) : (0, s.j)(t.palette[a].main, .55))
                                }
                            },
                            ["&.".concat(g.checked, " + .").concat(g.track)]: {
                                backgroundColor: (t.vars || t).palette[a].main
                            }
                        }
                    }
                })]
            }
        }),
        k = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Track",
            overridesResolver: (e, t) => t.track
        })(e => {
            let {
                theme: t
            } = e;
            return {
                height: "100%",
                width: "100%",
                borderRadius: 7,
                zIndex: -1,
                transition: t.transitions.create(["opacity", "background-color"], {
                    duration: t.transitions.duration.shortest
                }),
                backgroundColor: t.vars ? t.vars.palette.common.onBackground : "".concat("light" === t.palette.mode ? t.palette.common.black : t.palette.common.white),
                opacity: t.vars ? t.vars.opacity.switchTrack : "" + ("light" === t.palette.mode ? .38 : .3)
            }
        }),
        v = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Thumb",
            overridesResolver: (e, t) => t.thumb
        })(e => {
            let {
                theme: t
            } = e;
            return {
                boxShadow: (t.vars || t).shadows[1],
                backgroundColor: "currentColor",
                width: 20,
                height: 20,
                borderRadius: "50%"
            }
        }),
        E = a.forwardRef(function(e, t) {
            let a = (0, f.u)({
                    props: e,
                    name: "MuiSwitch"
                }),
                {
                    className: n,
                    color: o = "primary",
                    edge: l = !1,
                    size: i = "medium",
                    sx: r
                } = a,
                c = (0, s._)(a, b),
                m = (0, d._)({}, a, {
                    color: o,
                    edge: l,
                    size: i
                }),
                g = (e => {
                    let {
                        classes: t,
                        edge: a,
                        size: n,
                        color: o,
                        checked: l,
                        disabled: i
                    } = e, r = {
                        root: ["root", a && "edge".concat((0, s.a)(a)), "size".concat((0, s.a)(n))],
                        switchBase: ["switchBase", "color".concat((0, s.a)(o)), l && "checked", i && "disabled"],
                        thumb: ["thumb"],
                        track: ["track"],
                        input: ["input"]
                    }, c = (0, u.a)(r, h, t);
                    return (0, d._)({}, t, c)
                })(m),
                E = (0, p.jsx)(v, {
                    className: g.thumb,
                    ownerState: m
                });
            return (0, p.jsxs)(y, {
                className: (0, u.c)(g.root, n),
                sx: r,
                ownerState: m,
                children: [(0, p.jsx)(C, (0, d._)({
                    type: "checkbox",
                    icon: E,
                    checkedIcon: E,
                    ref: t,
                    ownerState: m
                }, c, {
                    classes: (0, d._)({}, g, {
                        root: g.switchBase
                    })
                })), (0, p.jsx)(k, {
                    className: g.track,
                    ownerState: m
                })]
            })
        });
    var S = (0, l.default)({
            name: "Switch"
        })(function(e, t, a) {
            var l, i, r, s, d = t.size;
            return {
                root: ((l = {})["&:has(> .".concat(g.colorPrimary, ".").concat(g.disabled, ".").concat(g.checked, ")")] = {
                    opacity: .5
                }, l["&:has(> .".concat(g.colorSecondary, ".").concat(g.disabled, ")")] = {
                    opacity: .5
                }, l),
                switchBase: ((i = {
                    color: e.palette.actionV2.primary.fill
                })["&.".concat(g.checked, " + .").concat(g.track, ".").concat(a.track)] = {
                    opacity: .38
                }, i["&.".concat(g.disabled, " + .").concat(g.track, ".").concat(a.track)] = {
                    opacity: .38
                }, i),
                thumb: {
                    position: "relative",
                    pointerEvents: "none",
                    width: n(d),
                    height: n(d),
                    borderRadius: "50%",
                    boxShadow: e.elevation.subtle
                },
                track: {
                    opacity: .38
                },
                progress: {
                    color: e.palette.actionV2.primaryBrand.fill,
                    position: "absolute",
                    top: (n(d) - o(d)) / 2,
                    left: (n(d) - o(d)) / 2,
                    zIndex: 1
                },
                colorPrimary: ((r = {})["& .".concat(g.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, r["& .".concat(g.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, r["&.".concat(g.checked, " .").concat(g.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, r["&.".concat(g.checked, " .").concat(g.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill,
                    opacity: .38
                }, r["&.".concat(g.checked, " .").concat(c.c.root)] = {
                    color: e.palette.actionV2.primary.fill
                }, r["&.".concat(g.disabled, " .").concat(g.thumb)] = {
                    background: e.palette.components.switch.disabledKnob
                }, r["&.".concat(g.disabled, " .").concat(g.track)] = {
                    background: e.palette.components.switch.slideFill
                }, r["&.".concat(g.disabled, ".").concat(g.checked, " .").concat(g.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, r["&.".concat(g.disabled, ".").concat(g.checked, " .").concat(g.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, r["&.".concat(g.disabled, " .").concat(c.c.root)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, r),
                colorSecondary: ((s = {})["& .".concat(g.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, s["& .".concat(g.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, s)
            }
        }),
        w = (0, a.forwardRef)(function(e, l) {
            var r, s = e.classes,
                d = e.color,
                u = e.loading,
                m = e.size,
                p = e.checkedIcon,
                f = e.icon,
                h = e["aria-label"],
                b = e.inputProps,
                y = e.className,
                C = (0, t.a)(e, ["classes", "color", "loading", "size", "checkedIcon", "icon", "aria-label", "inputProps", "className"]),
                k = S((0, t._)((0, t._)({}, C), {
                    loading: u,
                    size: m,
                    checkedIcon: p,
                    icon: f,
                    "aria-label": h
                }), {
                    props: {
                        classes: (0, i.default)(s, y)
                    }
                }).classes,
                v = k.thumb,
                w = k.progress,
                A = (0, t.a)(k, ["thumb", "progress"]),
                D = a.default.createElement("div", {
                    className: "".concat(g.thumb, " ").concat(v)
                }, u && a.default.createElement(c.C, {
                    thickness: ((r = o(m)) - n(m)) * 44 / (2 * r),
                    size: o(m),
                    classes: {
                        root: w
                    }
                }));
            return a.default.createElement(E, (0, t._)({}, C, {
                checkedIcon: null != p ? p : D,
                classes: A,
                color: void 0 === d ? "primary" : d,
                icon: null != f ? f : D,
                ref: l,
                size: m,
                inputProps: (0, t._)((0, t._)({}, b), {
                    "aria-label": h
                })
            }))
        });
    e.s(["Switch", 0, w], 610873)
}, 940042, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["BrokenImageOutlinedIcon", () => t.BrokenImageOutlined])
}, 381221, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["HourglassEmptyIcon", () => t.HourglassEmpty])
}, 87660, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "LoadableContext", {
        enumerable: !0,
        get: function() {
            return n
        }
    });
    let n = e.r(2879)._(e.r(416340)).default.createContext(null)
}, 777553, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "default", {
        enumerable: !0,
        get: function() {
            return m
        }
    });
    let n = e.r(2879)._(e.r(416340)),
        o = e.r(87660),
        l = [],
        i = [],
        r = !1;

    function s(e) {
        let t = e(),
            a = {
                loading: !0,
                loaded: null,
                error: null
            };
        return a.promise = t.then(e => (a.loading = !1, a.loaded = e, e)).catch(e => {
            throw a.loading = !1, a.error = e, e
        }), a
    }
    class c {
        promise() {
            return this._res.promise
        }
        retry() {
            this._clearTimeouts(), this._res = this._loadFn(this._opts.loader), this._state = {
                pastDelay: !1,
                timedOut: !1
            };
            let {
                _res: e,
                _opts: t
            } = this;
            e.loading && ("number" == typeof t.delay && (0 === t.delay ? this._state.pastDelay = !0 : this._delay = setTimeout(() => {
                this._update({
                    pastDelay: !0
                })
            }, t.delay)), "number" == typeof t.timeout && (this._timeout = setTimeout(() => {
                this._update({
                    timedOut: !0
                })
            }, t.timeout))), this._res.promise.then(() => {
                this._update({}), this._clearTimeouts()
            }).catch(e => {
                this._update({}), this._clearTimeouts()
            }), this._update({})
        }
        _update(e) {
            this._state = {
                ...this._state,
                error: this._res.error,
                loaded: this._res.loaded,
                loading: this._res.loading,
                ...e
            }, this._callbacks.forEach(e => e())
        }
        _clearTimeouts() {
            clearTimeout(this._delay), clearTimeout(this._timeout)
        }
        getCurrentValue() {
            return this._state
        }
        subscribe(e) {
            return this._callbacks.add(e), () => {
                this._callbacks.delete(e)
            }
        }
        constructor(e, t) {
            this._loadFn = e, this._opts = t, this._callbacks = new Set, this._delay = null, this._timeout = null, this.retry()
        }
    }

    function d(t) {
        return function(t, a) {
            let s = Object.assign({
                    loader: null,
                    loading: null,
                    delay: 200,
                    timeout: null,
                    webpack: null,
                    modules: null
                }, a),
                d = null;

            function u() {
                if (!d) {
                    let e = new c(t, s);
                    d = {
                        getCurrentValue: e.getCurrentValue.bind(e),
                        subscribe: e.subscribe.bind(e),
                        retry: e.retry.bind(e),
                        promise: e.promise.bind(e)
                    }
                }
                return d.promise()
            }
            if ("u" < typeof window && l.push(u), !r && "u" > typeof window) {
                let t = s.webpack && "function" == typeof e.t.resolveWeak ? s.webpack() : s.modules;
                t && i.push(e => {
                    for (let a of t)
                        if (e.includes(a)) return u()
                })
            }

            function m(e, t) {
                let a;
                u(), (a = n.default.useContext(o.LoadableContext)) && Array.isArray(s.modules) && s.modules.forEach(e => {
                    a(e)
                });
                let l = n.default.useSyncExternalStore(d.subscribe, d.getCurrentValue, d.getCurrentValue);
                return n.default.useImperativeHandle(t, () => ({
                    retry: d.retry
                }), []), n.default.useMemo(() => {
                    var t;
                    return l.loading || l.error ? n.default.createElement(s.loading, {
                        isLoading: l.loading,
                        pastDelay: l.pastDelay,
                        timedOut: l.timedOut,
                        error: l.error,
                        retry: d.retry
                    }) : l.loaded ? n.default.createElement((t = l.loaded) && t.default ? t.default : t, e) : null
                }, [e, l])
            }
            return m.preload = () => u(), m.displayName = "LoadableComponent", n.default.forwardRef(m)
        }(s, t)
    }

    function u(e, t) {
        let a = [];
        for (; e.length;) {
            let n = e.pop();
            a.push(n(t))
        }
        return Promise.all(a).then(() => {
            if (e.length) return u(e, t)
        })
    }
    d.preloadAll = () => new Promise((e, t) => {
        u(l).then(e, t)
    }), d.preloadReady = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
        return new Promise(t => {
            let a = () => (r = !0, t());
            u(i, e).then(a, a)
        })
    }, "u" > typeof window && (window.__NEXT_PRELOADREADY = d.preloadReady);
    let m = d
}, 201897, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    });
    var n = {
        default: function() {
            return u
        },
        noSSR: function() {
            return d
        }
    };
    for (var o in n) Object.defineProperty(a, o, {
        enumerable: !0,
        get: n[o]
    });
    let l = e.r(2879),
        i = e.r(221628);
    e.r(416340);
    let r = l._(e.r(777553)),
        s = "u" < typeof window;

    function c(e) {
        return {
            default: (null == e ? void 0 : e.default) || e
        }
    }

    function d(e, t) {
        if (delete t.webpack, delete t.modules, !s) return e(t);
        let a = t.loading;
        return () => (0, i.jsx)(a, {
            error: null,
            isLoading: !0,
            pastDelay: !1,
            timedOut: !1
        })
    }

    function u(e, t) {
        let a = r.default,
            n = {
                loading: e => {
                    let {
                        error: t,
                        isLoading: a,
                        pastDelay: n
                    } = e;
                    return null
                }
            };
        e instanceof Promise ? n.loader = () => e : "function" == typeof e ? n.loader = e : "object" == typeof e && (n = {
            ...n,
            ...e
        });
        let o = (n = {
            ...n,
            ...t
        }).loader;
        return (n.loadableGenerated && (n = {
            ...n,
            ...n.loadableGenerated
        }, delete n.loadableGenerated), "boolean" != typeof n.ssr || n.ssr) ? a({
            ...n,
            loader: () => null != o ? o().then(c) : Promise.resolve(c(() => null))
        }) : (delete n.webpack, delete n.modules, d(a, n))
    }("function" == typeof a.default || "object" == typeof a.default && null !== a.default) && void 0 === a.default.__esModule && (Object.defineProperty(a.default, "__esModule", {
        value: !0
    }), Object.assign(a.default, a), t.exports = a.default)
}, 507742, (e, t, a) => {
    t.exports = e.r(201897)
}, 260241, e => {
    "use strict";
    var t = e.i(79187),
        a = e.i(416340),
        n = e.i(697973),
        o = e.i(532045),
        l = e.i(83265),
        i = e.i(686762),
        r = e.i(16397),
        s = e.i(345886),
        c = e.i(623983),
        d = e.i(748893),
        u = e.i(387660),
        m = e.i(145842),
        p = e.i(943402),
        f = e.i(40262),
        h = e.i(49152),
        g = e.i(11473),
        b = e.i(610873),
        y = e.i(378645),
        y = y,
        C = e.i(226519),
        k = e.i(102725),
        v = e.i(668539),
        E = e.i(976457),
        S = e.i(252842);
    let w = "https://www.roblox.com/info/privacy",
        A = "{privacyPolicyLink}",
        D = "{googleAnalyticsLink}",
        x = [{
            label: "Label.DataCollected",
            content: "Description.DataCollected"
        }, {
            label: "Label.DataSharing",
            content: "Description.DataSharing"
        }, {
            label: "Label.DataRetention",
            content: "Description.DataRetention"
        }, {
            label: "Label.DataUse",
            content: "Description.DataUse"
        }, {
            label: "Label.DataStorage",
            content: "Description.Undisclosed"
        }];
    var R, B, T = ((R = T || {}).BannerTitle = "Heading.CookieBanner", R.CookieBannerContent = "Description.CookieBannerContent", R.CookieBannerButton = "Action.CookieBanner", R.PrivacyPolicy = "Description.PrivacyPolicy", R.ConsentToolModalTitle = "Heading.CookieSettings", R.SaveBtn = "Action.SavePreferences", R.CancelBtn = "Action.Cancel", R.InfoCollectionHeader = "Heading.InformationCollection", R.InfoCollectionContent = "Description.InformationCollection", R.InfoCollectionHeader2 = "Heading.InformationCollection2", R.InfoCollectionContent2 = "Description.InformationCollection2", R.InfoPartnerCollectionHeader = "Heading.InformationPartnerCollection", R.InfoPartnerCollectionContent = "Description.InformationPartnerCollection", R.RBXViralAcquisition = "RBXViralAcquisition", R.RBXViralAcquisitionDescription = "Description.RBXViralAcquisition", R.RBXSource = "RBXSource", R.RBXSourceDescription = "Description.RBXSource", R.GoogleAnalytics = "Heading.GoogleAnalytics", R.OwnedBy = "Label.OwnedBy", R.GoogleInc = "Google Inc.", R.Website = "Label.Website", R.GoogleAnalyticsPurposeHeader = "Heading.GoogleAnalyticsPurpose", R.GoogleAnalyticsPurposeDescription = "Description.GoogleAnalyticsPurpose", R.CompanyCollectionHeader = "Heading.CompanyCollection", R.DataCollected = "Label.DataCollected", R.DataCollectedContent = "Description.DataCollected", R.DataSharing = "Label.DataSharing", R.DataSharingContent = "Description.DataSharing", R.DataRetention = "Label.DataRetention", R.DataRetentionContent = "Description.DataRetention", R.DataUse = "Label.DataUse", R.DataUseContent = "Description.DataUse", R.DataStorage = "Label.DataStorage", R.DataStorageContent = "Description.Undisclosed", R.RequestData = "Action.RequestData", R.SetCookieOptions = "Action.SetCookieOptions", R.DeclineAll = "Action.DeclineAll", R.AcceptAll = "Action.AcceptAll", R.EssentialCookie = "Heading.EssentialCookies", R.AnalyticsCookie = "Heading.AnalyticsCookies", R.GAReadMore = "Description.GAReadMore", R.GAReadMoreUrl = "{googleAnalyticsLink}", R);
    let M = (0, n.makeStyles)()(e => ({
            root: {
                padding: 24,
                maxWidth: 1250,
                margin: "0 auto"
            },
            content: {
                marginBottom: 16
            },
            actions: {
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                gap: 12,
                [e.breakpoints.down("Medium")]: {
                    flexDirection: "column",
                    alignItems: "flex-start"
                }
            },
            buttons: {
                display: "flex",
                gap: 12,
                [e.breakpoints.down("Medium")]: {
                    flexDirection: "column",
                    width: "100%"
                }
            },
            backdrop: {
                backgroundColor: "transparent"
            }
        })),
        I = e => {
            let {
                onAcceptAll: n,
                onDeclineAll: u,
                onLearnMore: m,
                isOpen: p
            } = e, {
                translate: f
            } = (0, t.useTranslation)(), {
                classes: h
            } = M(), g = (0, l.useMediaQuery)((0, o.useTheme)().breakpoints.down("Medium")), b = (0, a.useMemo)(() => a.default.createElement(i.Link, {
                href: w,
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, f(T.PrivacyPolicy)), [f]), y = (0, a.useMemo)(() => {
                let e = f(T.CookieBannerContent);
                if (!e.includes(A)) return e;
                let t = e.split(A);
                return a.default.createElement(a.default.Fragment, null, t[0], b, t[1] || "")
            }, [f, b]);
            return a.default.createElement(r.Drawer, {
                open: p,
                onClose: u,
                anchor: "bottom",
                variant: "temporary",
                ModalProps: {
                    BackdropProps: {
                        classes: {
                            root: h.backdrop
                        }
                    }
                }
            }, a.default.createElement(s.Grid, {
                className: h.root
            }, a.default.createElement(s.Grid, {
                className: h.content
            }, a.default.createElement(c.Typography, {
                variant: "body2"
            }, y)), a.default.createElement(s.Grid, {
                className: h.actions
            }, a.default.createElement(d.Button, {
                variant: "text",
                onClick: m,
                color: "secondary"
            }, f(T.SetCookieOptions)), a.default.createElement(s.Grid, {
                className: h.buttons
            }, a.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: u,
                fullWidth: g
            }, f(T.DeclineAll)), a.default.createElement(d.Button, {
                color: "secondary",
                variant: "contained",
                onClick: n,
                fullWidth: g
            }, f(T.AcceptAll))))))
        },
        V = "RBXcb",
        _ = {
            RBXViralAcquisition: !0,
            RBXSource: !0,
            GoogleAnalytics: !0
        },
        P = (0, a.createContext)(null),
        F = () => {
            let e = (0, a.useContext)(P);
            if (!e) throw Error("useCookieConsentContext must be used within a CookieConsentProvider");
            return e
        },
        N = e => {
            let t, a = Object.entries(e).map(e => {
                let [t, a] = e;
                return "".concat(t, "=").concat(a)
            }).join("&");
            Object.entries(e).forEach(e => {
                let [t, a] = e;
                a || (0, S.deleteCookie)(t)
            });
            let n = new Date;
            n.setDate(n.getDate() + 180), document.cookie = "".concat(V, "=").concat(a, "; expires=").concat(n.toUTCString(), "; path=/; domain=").concat((t = window.location.hostname.split(".")).length <= 2 ? window.location.hostname : ".".concat(t.slice(1).join(".")))
        },
        G = e => {
            let {
                cookieName: t,
                description: n
            } = e;
            return a.default.createElement("div", null, a.default.createElement(c.Typography, {
                variant: "codeDense"
            }, t), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, n))
        },
        L = (0, n.makeStyles)()(() => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(u.accordionSummaryClasses.content)]: {
                    margin: 0,
                    "&.Mui-expanded": {
                        margin: 0
                    }
                },
                "&.Mui-expanded": {
                    minHeight: "48px"
                }
            },
            accordion: {
                "&::before": {
                    height: 0
                },
                "&.Mui-expanded": {
                    margin: 0
                }
            }
        })),
        j = () => {
            var e;
            let {
                translate: n
            } = (0, t.useTranslation)(), {
                cookiePolicy: o
            } = F(), {
                classes: l
            } = L();
            return o && (null == (e = o.EssentialCookieList) ? void 0 : e.length) ? a.default.createElement(m.Accordion, {
                className: l.accordion
            }, a.default.createElement(p.AccordionSummary, {
                className: l.accordionSummary
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, n(T.EssentialCookie))), a.default.createElement(f.AccordionDetails, null, o.EssentialCookieList.map(e => a.default.createElement(G, {
                key: e.cookieName,
                cookieName: e.cookieName,
                description: n(e.description)
            })))) : null
        };
    var O = ((B = {}).RBXViralAcquisition = "RBXViralAcquisition", B.RBXSource = "RBXSource", B.GoogleAnalytics = "GoogleAnalytics", B);
    let z = e => {
            let {
                title: t,
                content: n,
                secondary: o = !1
            } = e;
            return a.default.createElement("div", null, a.default.createElement(c.Typography, {
                variant: "body2",
                color: o ? "secondary" : "primary"
            }, t), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, n))
        },
        H = () => {
            let {
                translate: e
            } = (0, t.useTranslation)(), n = e(T.GAReadMore);
            if (!n.includes(D)) return a.default.createElement(a.default.Fragment, null, n);
            let [o, l] = n.split(D);
            return a.default.createElement(c.Typography, {
                variant: "body2"
            }, o, a.default.createElement(i.Link, {
                href: "https://support.google.com/analytics/answer/11397207",
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, e(T.GoogleAnalytics)), l)
        },
        X = (0, n.makeStyles)()(() => ({
            button: {
                paddingLeft: 5,
                ["&.".concat(h.buttonClasses.root)]: {
                    backgroundColor: "transparent",
                    "&:hover": {
                        backgroundColor: "transparent"
                    },
                    "&:focus": {
                        backgroundColor: "transparent"
                    },
                    "&:active": {
                        backgroundColor: "transparent"
                    }
                }
            }
        })),
        U = e => {
            let {
                href: t,
                text: n
            } = e, {
                classes: o
            } = X();
            return a.default.createElement("div", null, a.default.createElement(d.Button, {
                className: o.button,
                variant: "text",
                component: "a",
                color: "primary",
                href: t,
                rel: "noreferrer",
                endIcon: a.default.createElement(g.OpenInNewIcon, null),
                size: "small",
                target: "_blank",
                disableRipple: !0
            }, n))
        },
        q = e => {
            let {
                isAnalyticsCookieAccepted: n,
                setIsAnalyticsCookieAccepted: o
            } = e, {
                classes: l
            } = L(), {
                translate: i
            } = (0, t.useTranslation)();
            return a.default.createElement(m.Accordion, {
                className: l.accordion
            }, a.default.createElement(p.AccordionSummary, {
                className: l.accordionSummary
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, i(T.AnalyticsCookie)), a.default.createElement(b.Switch, {
                checked: n,
                onChange: (e, t) => {
                    o(t)
                },
                "aria-label": i(T.AnalyticsCookie),
                size: "small"
            })), a.default.createElement(f.AccordionDetails, null, a.default.createElement(G, {
                key: O.RBXViralAcquisition,
                cookieName: O.RBXViralAcquisition,
                description: i(T.RBXViralAcquisitionDescription)
            }), a.default.createElement(G, {
                key: O.RBXSource,
                cookieName: O.RBXSource,
                description: i(T.RBXSourceDescription)
            }), a.default.createElement(U, {
                href: "https://marketingplatform.google.com/about/analytics/",
                text: i(T.GoogleAnalytics)
            }), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0
            }, i(T.OwnedBy), " ", "Google Inc."), a.default.createElement(z, {
                title: i(T.GoogleAnalyticsPurposeHeader),
                content: i(T.GoogleAnalyticsPurposeDescription)
            }), a.default.createElement(c.Typography, {
                variant: "body2"
            }, i(T.CompanyCollectionHeader)), x.map(e => a.default.createElement(z, {
                key: e.label,
                title: i(e.label),
                content: i(e.content),
                secondary: !0
            })), a.default.createElement(H, null)))
        },
        W = (0, n.makeStyles)()(e => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(u.accordionSummaryClasses.content)]: {
                    margin: 0,
                    "&.Mui-expanded": {
                        margin: 0
                    }
                },
                "&.Mui-expanded": {
                    minHeight: "48px"
                }
            },
            accordion: {
                "&::before": {
                    height: 0
                },
                "&.Mui-expanded": {
                    margin: 0
                }
            },
            paragraph: {
                marginBottom: "12px"
            },
            dialogContent: {
                ["&.".concat(y.d.root)]: {
                    paddingTop: "12px"
                },
                scrollbarColor: "grey transparent",
                scrollbarWidth: "thin",
                "&::-webkit-scrollbar": {
                    width: 6
                },
                "&::-webkit-scrollbar-thumb": {
                    background: "grey",
                    borderRadius: "10rem"
                },
                "&::-webkit-scrollbar-track": {
                    background: "transparent"
                }
            },
            accordionSection: {
                marginTop: "12px"
            },
            accordionContainer: {
                border: "1px solid ".concat(e.palette.components.divider),
                "&:first-of-type": {
                    borderTopLeftRadius: "12px",
                    borderTopRightRadius: "12px"
                },
                "&:last-of-type": {
                    borderTop: "none",
                    borderBottomLeftRadius: "12px",
                    borderBottomRightRadius: "12px"
                },
                "&:first-of-type:last-of-type": {
                    borderTop: "1px solid ".concat(e.palette.components.divider)
                }
            }
        })),
        K = e => {
            var n;
            let {
                open: o,
                onClose: l,
                onSave: i,
                isAnalyticsCookieAccepted: r,
                setIsAnalyticsCookieAccepted: s
            } = e, {
                translate: u
            } = (0, t.useTranslation)(), {
                classes: m
            } = W(), {
                cookiePolicy: p
            } = F();
            return p ? a.default.createElement(C.Dialog, {
                open: o,
                onClose: l
            }, a.default.createElement(k.DialogTitle, null, u(T.ConsentToolModalTitle)), a.default.createElement(v.DialogContent, {
                className: m.dialogContent
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(T.InfoCollectionHeader)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: m.paragraph,
                color: "secondary"
            }, u(T.InfoCollectionContent)), a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(T.InfoCollectionHeader2)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: m.paragraph,
                color: "secondary"
            }, u(T.InfoCollectionContent2)), a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(T.InfoPartnerCollectionHeader)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: m.paragraph,
                color: "secondary"
            }, u(T.InfoPartnerCollectionContent)), a.default.createElement(U, {
                href: "https://www.roblox.com/support",
                text: u(T.RequestData)
            }), a.default.createElement(U, {
                href: w,
                text: u(T.PrivacyPolicy)
            }), a.default.createElement("div", {
                className: m.accordionSection
            }, (null == (n = p.EssentialCookieList) ? void 0 : n.length) > 0 && a.default.createElement("div", {
                className: m.accordionContainer
            }, a.default.createElement(j, null)), a.default.createElement("div", {
                className: m.accordionContainer
            }, a.default.createElement(q, {
                isAnalyticsCookieAccepted: r,
                setIsAnalyticsCookieAccepted: s
            })))), a.default.createElement(E.DialogActions, null, a.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: l
            }, u(T.CancelBtn)), a.default.createElement(d.Button, {
                color: "primaryBrand",
                variant: "contained",
                onClick: i
            }, u(T.SaveBtn)))) : null
        },
        Q = e => {
            let {
                isOpen: t,
                onClose: n,
                onSave: o
            } = e, {
                cookiePolicy: l,
                acceptAll: i,
                declineAll: r,
                hasAcceptedAnalyticsCookie: s
            } = F(), [c, d] = (0, a.useState)(s), u = (0, a.useCallback)(() => {
                c ? i() : r(), o()
            }, [i, r, c, o]);
            return l ? a.default.createElement(K, {
                open: t,
                onClose: n,
                isAnalyticsCookieAccepted: c,
                setIsAnalyticsCookieAccepted: d,
                onSave: u
            }) : null
        },
        Y = (0, t.withTranslation)(() => {
            let {
                acceptAll: e,
                declineAll: t,
                shouldShowBanner: n
            } = F(), [o, l] = (0, a.useState)(!1), [i, r] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                n && r(!0)
            }, [n]);
            let s = (0, a.useCallback)(() => {
                    e(), r(!1)
                }, [e]),
                c = (0, a.useCallback)(() => {
                    t(), r(!1)
                }, [t]),
                d = (0, a.useCallback)(() => {
                    l(!0), r(!1)
                }, []),
                u = (0, a.useCallback)(() => {
                    l(!1), r(!0)
                }, []),
                m = (0, a.useCallback)(() => {
                    l(!1), r(!1)
                }, []);
            return a.default.createElement(a.default.Fragment, null, a.default.createElement(I, {
                isOpen: i,
                onAcceptAll: s,
                onDeclineAll: c,
                onLearnMore: d
            }), a.default.createElement(Q, {
                isOpen: o,
                onClose: u,
                onSave: m
            }))
        }, ["Feature.Tracking", "CommonUI.Controls"]);
    e.s(["CookieConsentBanner", 0, Y, "CookieConsentProvider", 0, e => {
        let {
            children: t,
            robloxSiteDomain: n,
            initialCookiePolicy: o,
            initialPreferences: l,
            forceShowBanner: i = !1
        } = e, [r, s] = (0, a.useState)(o || null), [c, d] = (0, a.useState)(l || (() => {
            if ("u" < typeof document) return _;
            let e = document.cookie.split("; ").find(e => e.startsWith("".concat(V, "=")));
            return e ? e.substring(V.length + 1).split("&").reduce((e, t) => {
                let [a, n] = t.split("=");
                return e[a] = "true" === n, e
            }, {}) : _
        })()), [u, m] = (0, a.useState)(!o), [p, f] = (0, a.useState)(null), h = (0, a.useMemo)(() => !!i || !!(null == r ? void 0 : r.ShouldDisplayCookieBannerV3) && !(!("u" < typeof document) && document.cookie.split("; ").some(e => e.startsWith("".concat(V, "=")))), [null == r ? void 0 : r.ShouldDisplayCookieBannerV3, i]);
        (0, a.useEffect)(() => {
            o || (async () => {
                try {
                    var e, t, a;
                    let o = await fetch("https://apis.".concat(n, "/guac-v2/v1/bundles/cookie-policy"));
                    if (!o.ok) throw Error("Failed to fetch cookie policy");
                    let l = await o.json();
                    s({
                        ShouldDisplayCookieBannerV3: null != (e = l.ShouldDisplayCookieBannerV3) && e,
                        NonEssentialCookieList: null != (t = l.NonEssentialCookieList) ? t : [],
                        EssentialCookieList: null != (a = l.EssentialCookieList) ? a : []
                    }), m(!1)
                } catch (e) {
                    f(e instanceof Error ? e : Error("Unknown error")), m(!1)
                }
            })()
        }, [n, o]);
        let g = (0, a.useCallback)((e, t) => {
                d(a => {
                    let n = {
                        ...a,
                        [e]: t
                    };
                    return N(n), n
                })
            }, []),
            b = (0, a.useCallback)(() => {
                if (!r) return;
                let e = r.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !0
                }), _);
                N(e), d(e)
            }, [r]),
            y = (0, a.useCallback)(() => {
                if (!r) return;
                let e = r.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !1
                }), _);
                N(e), d(e)
            }, [r]),
            C = (0, a.useMemo)(() => Object.values(c).some(e => !0 === e), [c]),
            k = (0, a.useMemo)(() => ({
                cookiePolicy: r,
                preferences: c,
                updatePreference: g,
                acceptAll: b,
                declineAll: y,
                isLoading: u,
                error: p,
                hasAcceptedAnalyticsCookie: C,
                shouldShowBanner: h
            }), [r, c, u, p, b, y, g, C, h]);
        return a.default.createElement(P.Provider, {
            value: k
        }, t)
    }, "useCookieConsentContext", 0, F], 260241)
}]);

//# debugId=67a0455f-4946-be0a-a07c-b8cfb32efae2
//# sourceMappingURL=1-tmflw4qtah7.js.map