;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "0820dc28-1d76-e378-6f00-7590733b8cbd")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 991707, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(677753),
        o = function(e, t) {
            return (o = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function n(e, t, a, o) {
        return new(a || (a = Promise))(function(n, i) {
            function r(e) {
                try {
                    s(o.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                try {
                    s(o.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(r, l)
            }
            s((o = o.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var a, o, n, i = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            r = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return r.next = l(0), r.throw = l(1), r.return = l(2), "function" == typeof Symbol && (r[Symbol.iterator] = function() {
            return this
        }), r;

        function l(l) {
            return function(s) {
                var d = [l, s];
                if (a) throw TypeError("Generator is already executing.");
                for (; r && (r = 0, d[0] && (i = 0)), i;) try {
                    if (a = 1, o && (n = 2 & d[0] ? o.return : d[0] ? o.throw || ((n = o.return) && n.call(o), 0) : o.next) && !(n = n.call(o, d[1])).done) return n;
                    switch (o = 0, n && (d = [2 & d[0], n.value]), d[0]) {
                        case 0:
                        case 1:
                            n = d;
                            break;
                        case 4:
                            return i.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            i.label++, o = d[1], d = [0];
                            continue;
                        case 7:
                            d = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = i.trys).length > 0 && n[n.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === d[0] && (!n || d[1] > n[0] && d[1] < n[3])) {
                                i.label = d[1];
                                break
                            }
                            if (6 === d[0] && i.label < n[1]) {
                                i.label = n[1], n = d;
                                break
                            }
                            if (n && i.label < n[2]) {
                                i.label = n[2], i.ops.push(d);
                                break
                            }
                            n[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    d = t.call(e, i)
                } catch (e) {
                    d = [6, e], o = 0
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
    var r = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function a() {
                    this.constructor = e
                }
                o(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
            }(t, e), t.prototype.v1PlacesAssetIdSafetyStatusGetRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var o, n, r;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new a.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1PlacesAssetIdSafetyStatusGet.");
                                return o = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/places/{assetId}/safety-status".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/places/{assetId}/safety-status",
                                    method: "GET",
                                    headers: n,
                                    query: o
                                }, t)];
                            case 1:
                                return r = i.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        placeSafetyStatus: (0, a.exists)(e, "placeSafetyStatus") ? e.placeSafetyStatus : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesAssetIdSafetyStatusGet = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.v1PlacesAssetIdSafetyStatusGetRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t
        }(a.BaseAPI),
        l = e.i(272593);
    let s = new class {
        getPlaceSafetyStatusById(e) {
            return this.placeSafetyStatusApi.v1PlacesAssetIdSafetyStatusGet({
                assetId: e
            })
        }
        constructor() {
            (0, t._)(this, "placeSafetyStatusApi", void 0);
            const e = (0, l.createClientConfiguration)("content-safety", "bedev2");
            this.placeSafetyStatusApi = new r(e)
        }
    };
    e.s(["default", 0, s], 991707)
}, 413019, 441182, 877051, e => {
    "use strict";
    var t, a = e.i(521811),
        o = e.i(889311),
        n = ((t = n || {}).LeftNavigation = "LeftNavigation", t.Landing = "Landing", t.LanguageTabSelectedRequest = "LanguageTabSelectedRequest", t.LocalizationAddSupportedLanguage = "LocalizationAddSupportedLanguage", t.LocalizationAutomaticQuotas = "LocalizationAutomaticQuotas", t.LocalizationAutoTranslationInfo = "LocalizationAutoTranslationInfo", t.LocalizationAutoTranslationStrings = "LocalizationAutoTranslationStrings", t.LocalizationAutoTranslationImage = "LocalizationAutoTranslationImage", t.LocalizationContributionReport = "LocalizationContributionReport", t.LocalizationSettingsTab = "LocalizationSettingsTab", t.LocalizationTranslatorTab = "LocalizationTranslatorTab", t.DevStats = "DevStats", t.DevStatsExportTab = "DevStats-Export", t.DocumentationLanguageSetting = "DocumentationLanguageSetting", t.AnalyticsOverview = "AnalyticsOverview", t.TranslationInformationTab = "TranslationInformationTab", t.TranslationProductsTab = "TranslationProductsTab", t.TranslationStringsTab = "TranslationStringsTab", t.NotificationContentOverview = "NotificationContentOverview", t.NotificationContentForm = "NotificationContentForm", t.NotificationAnalyticsOverview = "NotificationAnalyticsOverview", t);
    e.s(["default", 0, n], 441182);
    let i = {
            eventType: o.default.ViewComputeTab,
            context: a.default.Click
        },
        r = {
            eventType: o.default.SelectInviteTranslators,
            context: a.default.Click,
            additionalProperties: {
                Source: n.LocalizationTranslatorTab
            }
        };
    e.s(["addEntryEventModel", 0, (e, t, i, r, l, s) => ({
        eventType: o.default.AddTranslationEntry,
        context: a.default.Click,
        additionalProperties: {
            Source: n.TranslationStringsTab,
            UserResponse: s,
            OriginalString: null != e ? e : "",
            Key: null != t ? t : "",
            Context: null != i ? i : "",
            Example: null != r ? r : "",
            UniverseId: null != l ? l : ""
        }
    }), "clearAutoCapturedTableEventModel", 0, (e, t, i) => ({
        eventType: o.default.ClearAutoCapturedTable,
        context: a.default.Click,
        additionalProperties: {
            Source: n.LocalizationSettingsTab,
            SelectedTimeFrame: null != e ? e : "",
            UniverseId: t,
            StatusCode: i
        }
    }), "downloadContributorReportEventModel", 0, (e, t, i, r, l, s) => ({
        eventType: o.default.DownloadContributorReport,
        context: a.default.Click,
        additionalProperties: {
            Source: n.LocalizationContributionReport,
            UniverseId: e,
            StartDate: t.toISOString(),
            EndDate: i.toISOString(),
            ReportType: r,
            ReportTargetId: l,
            StatusCode: s
        }
    }), "downloadStudioDirectDownloadEventModel", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "";
        return {
            eventType: o.default.DownloadStudio,
            context: a.default.Click,
            additionalProperties: {
                logic: "directDownload",
                referralUrl: document.referrer,
                downloadCode: e
            }
        }
    }, "downloadStudioOpenOrDownloadEventModel", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "";
        return {
            eventType: o.default.DownloadStudio,
            context: a.default.Click,
            additionalProperties: {
                logic: "openOrDownload",
                referralUrl: document.referrer,
                downloadCode: e
            }
        }
    }, "filterProductListEventModel", 0, (e, t) => ({
        eventType: o.default.FilterTranslationProductList,
        context: a.default.Click,
        additionalProperties: {
            Source: n.TranslationProductsTab,
            ProductType: t,
            UniverseId: null != e ? e : ""
        }
    }), "inviteTranslatorEventModel", 0, (e, t, i, r) => ({
        eventType: o.default.InviteTranslatorsModel,
        context: a.default.Click,
        additionalProperties: {
            Source: n.LocalizationTranslatorTab,
            AssigneeId: null != e ? e : "",
            TranslatorType: null != i ? i : "",
            InviteOptions: r,
            UserResponse: t
        }
    }), "languageTabSelectedRequestEventModel", 0, (e, t, i) => ({
        eventType: o.default.PageTabSelected,
        context: a.default.Click,
        additionalProperties: {
            Source: n.LanguageTabSelectedRequest,
            UniverseId: null != e ? e : "",
            CurrentTab: null != t ? t : "",
            SelectedTab: null != i ? i : ""
        }
    }), "loadNotificationCategoryEventModel", 0, e => ({
        eventType: o.default.NotificationsSettingsCategoryLoad,
        context: a.default.Load,
        additionalProperties: {
            category: e
        }
    }), "loadPageEventModel", 0, () => ({
        eventType: "loadPage",
        context: a.default.Load,
        additionalProperties: {
            referralUrl: document.referrer
        }
    }), "localizationSettingsToggledEventModel", 0, (e, t, o, i) => ({
        eventType: e,
        context: a.default.Click,
        additionalProperties: {
            Source: n.LocalizationSettingsTab,
            UniverseId: t,
            UserResponse: o,
            StatusCode: i
        }
    }), "manageSupportedLanguageEventModel", 0, (e, t, i, r) => ({
        eventType: o.default.ManageSupportedLanguage,
        context: a.default.Click,
        additionalProperties: {
            Source: n.LocalizationAddSupportedLanguage,
            LanguageCodes: e.toString(),
            UniverseId: t,
            UserResponse: i,
            IsAddLanguage: r ? "true" : "false"
        }
    }), "notificationSettingsLeftNavEventModel", 0, (e, t) => ({
        eventType: o.default.NotificationsSettingsLeftNavClick,
        context: a.default.Click,
        additionalProperties: {
            from: e,
            to: t
        }
    }), "notificationsSettingsCategoryCancelEventModel", 0, e => ({
        eventType: o.default.NotificationsSettingsCategoryCancelClick,
        context: a.default.Click,
        additionalProperties: {
            category: e
        }
    }), "selectInviteTranslatorsEventModel", 0, r, "studioStartAttemptEventModel", 0, e => ({
        eventType: o.default.StudioStartAttempt,
        context: a.default.Click,
        additionalProperties: {
            task: e.toLowerCase(),
            referralUrl: document.referrer
        }
    }), "studioStartSuccessEventModel", 0, e => ({
        eventType: o.default.StudioStartSuccess,
        context: a.default.Click,
        additionalProperties: {
            task: e.toLowerCase(),
            referralUrl: document.referrer
        }
    }), "switchOffAutomaticTranslationEventModel", 0, (e, t, n, i) => ({
        eventType: o.default.SwitchOffAutomaticTranslation,
        context: a.default.Click,
        additionalProperties: {
            Source: e,
            LanguageCode: n,
            UniverseId: null != t ? t : "",
            UserResponse: i
        }
    }), "switchOnAutomaticTranslationEventModel", 0, (e, t, n) => ({
        eventType: o.default.SwitchOnAutomaticTranslation,
        context: a.default.Click,
        additionalProperties: {
            Source: e,
            LanguageCode: n,
            UniverseId: null != t ? t : ""
        }
    }), "updateGameProductIconEventModel", 0, (e, t, i, r) => ({
        eventType: o.default.UpdateGameProductIcon,
        context: a.default.Click,
        additionalProperties: {
            Source: n.TranslationProductsTab,
            ProductType: e,
            ProductId: t,
            UserResponse: i,
            LanguageCode: r
        }
    }), "updateGameProductTranslationEventModel", 0, (e, t, i, r, l) => ({
        eventType: o.default.UpdateGameProductTranslation,
        context: a.default.Click,
        additionalProperties: {
            Source: n.TranslationProductsTab,
            ProductType: e,
            ProductId: t,
            FieldType: i,
            Translation: null != r ? r : "",
            LanguageCode: l
        }
    }), "updateUniverseIconAndThumbnailEventModel", 0, (e, t, i, r, l) => ({
        eventType: o.default.UpdateUniverseIconAndThumbnail,
        context: a.default.Click,
        additionalProperties: {
            Source: n.TranslationInformationTab,
            UniverseId: null != e ? e : "",
            Field: t,
            LanguageCode: null != i ? i : "",
            UserResponse: r,
            StatusCode: l
        }
    }), "updateUniverseInformationEventModel", 0, (e, t, i, r, l) => ({
        eventType: o.default.UpdateUniverseInformation,
        context: a.default.Click,
        additionalProperties: {
            Source: n.TranslationInformationTab,
            Field: e,
            OriginalString: t,
            Translation: i,
            LanguageCode: l,
            UniverseId: null != r ? r : ""
        }
    }), "viewComputeTab", 0, i, "viewNotificationsEventMode", 0, (e, t) => ({
        eventType: o.default.ViewNotifications,
        context: a.default.Click,
        additionalProperties: {
            Source: n.LeftNavigation,
            userId: e ? "".concat(e) : "unknown",
            universeId: t ? "".concat(t) : "unknown"
        }
    })], 413019);
    var l = e.i(221628),
        s = e.i(79187),
        d = e.i(291037),
        c = e.i(899819),
        u = e.i(777004),
        p = e.i(35298),
        f = e.i(872204),
        v = e.i(169722),
        g = e.i(982234),
        m = e.i(199834),
        h = e.i(354246),
        S = e.i(988012),
        b = e.i(447055),
        y = e.i(706442);
    let T = "https://www.".concat("roblox.com", "/info/terms"),
        x = (0, y.makeStyles)()(() => ({
            closeIcon: {
                position: "absolute",
                right: 8,
                top: 8
            },
            titleWrapper: {
                position: "relative"
            }
        }));
    e.s(["default", 0, e => {
        let {
            open: t,
            onClose: a
        } = e, {
            translate: o,
            translateHTML: n
        } = (0, s.useTranslation)(), {
            classes: i
        } = x();
        return (0, l.jsxs)(d.Dialog, {
            open: t,
            onClose: a,
            maxWidth: "Medium",
            children: [(0, l.jsxs)(c.DialogTitle, {
                className: i.titleWrapper,
                children: [(0, l.jsx)(S.IconButton, {
                    className: i.closeIcon,
                    color: "secondary",
                    "aria-label": o("Action.Close"),
                    onClick: a,
                    size: "large",
                    children: (0, l.jsx)(b.CloseIcon, {})
                }), (0, l.jsxs)(v.Grid, {
                    container: !0,
                    alignItems: "center",
                    gap: 2,
                    children: [(0, l.jsx)(h.WarningIcon, {
                        color: "warning",
                        fontSize: "large"
                    }), (0, l.jsx)(m.Typography, {
                        variant: "h4",
                        children: o("Heading.ExperienceLocked")
                    })]
                })]
            }), (0, l.jsx)(u.DialogContent, {
                children: (0, l.jsx)(m.Typography, {
                    variant: "body1",
                    component: "div",
                    children: n("Description.ExperienceLockedTermsOfUse", [{
                        opening: "linkStart",
                        closing: "linkEnd",
                        content: e => (0, l.jsx)(g.Link, {
                            href: T,
                            target: "_blank",
                            rel: "noopener noreferrer",
                            children: e
                        })
                    }])
                })
            }), (0, l.jsx)(p.DialogActions, {
                children: (0, l.jsx)(f.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    size: "large",
                    onClick: a,
                    children: o("Action.OK")
                })
            })]
        })
    }], 877051)
}, 521811, e => {
    "use strict";
    var t, a = ((t = a || {}).Click = "click", t.Hover = "hover", t.Load = "load", t);
    e.s(["default", 0, a])
}, 709337, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340);
    let o = (0, a.createContext)(null);
    e.s(["EventTrackerProvider", 0, e => {
        let {
            children: n,
            trackerClient: i
        } = e, r = (0, a.useMemo)(() => ({
            trackerClient: i
        }), [i]);
        return (0, t.jsx)(o.Provider, {
            value: r,
            children: n
        })
    }, "useEventTrackerProvider", 0, function() {
        let e = (0, a.useContext)(o);
        if (null === e) throw Error("useEventTrackerProvider must be used within a EventTrackerProvider");
        return e
    }])
}, 450639, 950473, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        o = e.i(79187),
        n = e.i(540513),
        i = e.i(808377),
        r = e.i(449934),
        l = e.i(169722),
        s = e.i(591403),
        d = e.i(833172);
    e.s(["NotInterestedIcon", () => d.NotInterested], 950473);
    var d = d,
        c = e.i(559956),
        u = e.i(199834),
        p = e.i(706442);
    let f = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        return (0, p.makeStyles)()(t => ({
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
            targetId: p,
            targetType: v,
            returnPolicy: g = n.ReturnPolicy.AutoGenerated,
            isStatusTextShown: m = !1,
            alt: h,
            fontColor: S = "light",
            bottomRightAdornment: b
        } = e, {
            classes: {
                imageStatusContainer: y,
                statusTextContainer: T,
                imageWrapper: x,
                imageContainer: C,
                image: w,
                bottomRightAdornmentContainer: k,
                skeleton: I
            }
        } = f("light" !== S)(), {
            translate: P
        } = (0, o.useTranslation)(), [E, M] = (0, a.useState)(!1), [D, A] = (0, a.useState)(), L = (0, a.useCallback)(async function(e, t, a) {
            let o = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (t && e) {
                M(!0);
                try {
                    let i = o ? n.ThumbnailClient.reloadThumbnailImage : n.ThumbnailClient.getThumbnailImage,
                        r = await i(e, t, a);
                    A(r)
                } catch (e) {
                    A({
                        state: i.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    M(!1)
                }
            }
        }, []), R = (0, a.useMemo)(() => {
            if (E) return (0, t.jsx)(c.Skeleton, {
                classes: {
                    root: I
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                a = null;
            switch (null == D ? void 0 : D.state) {
                case i.ThumbnailResponseState.InReview:
                    e = P("Label.InReview"), a = (0, t.jsx)(s.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === S ? void 0 : "secondary"
                    });
                    break;
                case i.ThumbnailResponseState.Blocked:
                    e = P("Label.Moderated"), a = (0, t.jsx)(d.NotInterested, {
                        fontSize: "large",
                        color: "dark" === S ? void 0 : "secondary"
                    });
                    break;
                case i.ThumbnailResponseState.Error:
                case i.ThumbnailResponseState.TemporarilyUnavailable:
                    e = P("Label.Unavailable"), a = (0, t.jsx)(r.BrokenImageOutlinedIcon, {
                        fontSize: "large",
                        color: "dark" === S ? void 0 : "secondary"
                    });
                    break;
                default:
                    return null
            }
            return (0, t.jsx)(l.Grid, {
                container: !0,
                classes: {
                    root: y
                },
                justifyContent: "center",
                alignItems: "center",
                children: m ? (0, t.jsxs)("div", {
                    children: [a, (0, t.jsx)(u.Typography, {
                        variant: "smallLabel1",
                        classes: {
                            root: T
                        },
                        children: e
                    })]
                }) : a
            })
        }, [E, null == D ? void 0 : D.state, y, m, T, I, P, S]);
        return (0, a.useEffect)(() => {
            L(v, p, g)
        }, [p, v, g, L]), {
            thumbnailImage: (0, t.jsx)(l.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, t.jsxs)("div", {
                    className: C,
                    children: [(null == D ? void 0 : D.state) === i.ThumbnailResponseState.Completed ? (0, t.jsx)("img", {
                        className: w,
                        src: null == D ? void 0 : D.imageUrl,
                        alt: h
                    }) : (0, t.jsx)("div", {
                        className: x,
                        children: R
                    }), b ? (0, t.jsx)("div", {
                        className: k,
                        children: b
                    }) : null]
                })
            }),
            thumbnailData: D,
            refreshThumbnail: (0, a.useCallback)(async () => L(v, p, g, !0), [L, v, p, g])
        }
    }], 450639)
}, 893949, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(80768),
        o = e.i(416340),
        n = e.i(79187),
        i = e.i(921394),
        r = e.i(581577),
        l = e.i(814975),
        s = e.i(639102),
        d = e.i(413019),
        c = e.i(709337),
        u = e.i(429246),
        p = e.i(486736),
        f = e.i(877051),
        v = e.i(392782),
        g = e.i(991707);
    async function m(e, t) {
        var a;
        let o = Number(e),
            n = Number(t);
        if (!Number.isFinite(o) || !Number.isFinite(n)) return !1;
        let i = null == (a = (await v.default.getDetails([o])).data) ? void 0 : a[0],
            r = null == i ? void 0 : i.rootPlaceId;
        if (null == r) return !1;
        let l = new Set([n, r]);
        return (await Promise.all([...l].map(async e => {
            var t;
            return (null == (t = (await g.default.getPlaceSafetyStatusById(e)).placeSafetyStatus) ? void 0 : t.userPlayabilityRestrictions) !== "RestrictedForAll"
        }))).every(Boolean)
    }
    var h = e.i(252842);
    let {
        getCurrentPlatform: S
    } = h.device, b = {
        light: "https://cdn.foundation.".concat("roblox.com", "/current/StudioLogo-Light.svg"),
        dark: "https://cdn.foundation.".concat("roblox.com", "/current/StudioLogo-Dark.svg")
    };
    e.s(["ThemeAwareStudioResourcesProvider", 0, function(e) {
        let {
            children: n
        } = e, {
            themeMode: l
        } = (0, i.useThemeMode)(), d = (0, o.useMemo)(() => (0, r.createStudioResources)({
            logoSrc: b[l],
            target: "global",
            environment: "production",
            fetchers: {
                userChannel: async () => (await s.channelClient.getUserChannel(S() === h.Platform.macOS ? s.EClientBinaryType.MacStudio : s.EClientBinaryType.WindowsStudio)).channelName
            },
            errorHandler: e => (0, a.captureException)(e)
        }), [l]);
        return (0, t.jsx)(r.StudioResourcesProvider, {
            resources: d,
            children: n
        })
    }, "default", 0, e => {
        let {
            user: a
        } = (0, l.useAuthentication)(), {
            locale: i
        } = (0, n.useLocalization)(), {
            translate: s
        } = (0, n.useTranslation)(), {
            settings: v
        } = (0, p.useSettings)(), {
            trackerClient: g
        } = (0, c.useEventTrackerProvider)(), h = {
            "Action.DownloadStudio": s("Action.DownloadStudio"),
            "Message.CheckingStudio": s("Message.CheckingStudio"),
            "Message.OpenStudioError": s("Message.OpenStudioError"),
            "Message.StartYourCreation": s("Message.StartYourCreation")
        }, {
            isCompatible: b,
            open: y,
            dialog: T,
            getStudioDownloadUrlAsync: x
        } = (0, r.useStudio)(null != e ? e : h, {
            startAttempt: e => g.sendEvent((0, d.studioStartAttemptEventModel)(e.task)),
            startSuccess: e => g.sendEvent((0, d.studioStartSuccessEventModel)(e.task)),
            download: (e, t) => {
                (null == t ? void 0 : t.getDownloadCode) ? t.getDownloadCode().then(e => {
                    void 0 !== e ? g.sendEvent((0, d.downloadStudioOpenOrDownloadEventModel)(e)) : g.sendEvent((0, d.downloadStudioOpenOrDownloadEventModel)())
                }).catch(() => {
                    g.sendEvent((0, d.downloadStudioOpenOrDownloadEventModel)())
                }): g.sendEvent((0, d.downloadStudioOpenOrDownloadEventModel)())
            }
        }), [C, w] = (0, o.useState)(!1), k = (0, o.useCallback)(() => w(!1), []), I = (0, o.useCallback)((e, t) => y(e, t), [y]);
        return {
            isCompatible: b,
            open: (0, o.useCallback)(e => {
                let t = {
                    userId: null == a ? void 0 : a.id,
                    locale: i || n.Locale.English,
                    protocolScheme: (S(), "roblox-studio"),
                    distributorType: "Global"
                };
                (async () => {
                    if (e.task === r.EStudioTaskType.EditPlace && v[u.FeatureFlagName.enablePlaceModerationCheckBeforeStudioOpen]) try {
                        if (!await m(e.universeId, e.placeId)) return void w(!0)
                    } catch (e) {}
                    I(e, t)
                })().catch(() => {})
            }, [null == a ? void 0 : a.id, i, I, v]),
            dialog: (0, t.jsxs)(t.Fragment, {
                children: [T, (0, t.jsx)(f.default, {
                    open: C,
                    onClose: k
                })]
            }),
            getStudioDownloadUrlAsync: x
        }
    }], 893949)
}, 808377, e => {
    "use strict";
    var t = e.i(620140);
    e.s(["ThumbnailResponseState", () => t.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum])
}, 286837, e => {
    "use strict";
    var t = e.i(273589),
        a = e.i(962560),
        o = e.i(416340),
        n = e.i(42569),
        i = e.i(696180),
        r = e.i(221628),
        l = e.i(963320);

    function s(e) {
        return (0, t.g)("MuiDialogActions", e)
    }(0, i.g)("MuiDialogActions", ["root", "spacing"]);
    let d = ["className", "disableSpacing"],
        c = (0, n.s)("div", {
            name: "MuiDialogActions",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, !a.disableSpacing && t.spacing]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, a._)({
                display: "flex",
                alignItems: "center",
                padding: 8,
                justifyContent: "flex-end",
                flex: "0 0 auto"
            }, !t.disableSpacing && {
                "& > :not(style) ~ :not(style)": {
                    marginLeft: 8
                }
            })
        }),
        u = o.forwardRef(function(e, o) {
            let i = (0, l.u)({
                    props: e,
                    name: "MuiDialogActions"
                }),
                {
                    className: u,
                    disableSpacing: p = !1
                } = i,
                f = (0, t._)(i, d),
                v = (0, a._)({}, i, {
                    disableSpacing: p
                }),
                g = (e => {
                    let {
                        classes: t,
                        disableSpacing: a
                    } = e;
                    return (0, n.a)({
                        root: ["root", !a && "spacing"]
                    }, s, t)
                })(v);
            return (0, r.jsx)(c, (0, a._)({
                className: (0, n.c)(g.root, u),
                ownerState: v,
                ref: o
            }, f))
        });
    e.s(["D", 0, u])
}, 701569, e => {
    "use strict";
    let t = e.i(416340).createContext({});
    e.s(["D", 0, t])
}, 430686, 568750, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        o = e.i(614515),
        n = e.i(993807),
        i = e.i(273589),
        r = e.i(962560),
        l = e.i(42569),
        s = e.i(696180),
        d = e.i(701569),
        c = e.i(652199),
        u = e.i(221628),
        p = e.i(450096),
        f = e.i(489710),
        v = e.i(719409),
        g = e.i(963320),
        m = e.i(154447),
        h = e.i(694258);

    function S(e) {
        return (0, i.g)("MuiDialog", e)
    }
    var b = (0, s.g)("MuiDialog", ["root", "scrollPaper", "scrollBody", "container", "paper", "paperScrollPaper", "paperScrollBody", "paperWidthFalse", "paperWidthXs", "paperWidthSm", "paperWidthMd", "paperWidthLg", "paperWidthXl", "paperFullWidth", "paperFullScreen"]);
    let y = ["aria-describedby", "aria-labelledby", "BackdropComponent", "BackdropProps", "children", "className", "disableEscapeKeyDown", "fullScreen", "fullWidth", "maxWidth", "onBackdropClick", "onClick", "onClose", "open", "PaperComponent", "PaperProps", "scroll", "TransitionComponent", "transitionDuration", "TransitionProps"],
        T = (0, l.s)(p.M, {
            name: "MuiDialog",
            slot: "Backdrop",
            overrides: (e, t) => t.backdrop
        })({
            zIndex: -1
        }),
        x = (0, l.s)(f.M, {
            name: "MuiDialog",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({
            "@media print": {
                position: "absolute !important"
            }
        }),
        C = (0, l.s)("div", {
            name: "MuiDialog",
            slot: "Container",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.container, t["scroll".concat((0, i.a)(a.scroll))]]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, r._)({
                height: "100%",
                "@media print": {
                    height: "auto"
                },
                outline: 0
            }, "paper" === t.scroll && {
                display: "flex",
                justifyContent: "center",
                alignItems: "center"
            }, "body" === t.scroll && {
                overflowY: "auto",
                overflowX: "hidden",
                textAlign: "center",
                "&::after": {
                    content: '""',
                    display: "inline-block",
                    verticalAlign: "middle",
                    height: "100%",
                    width: "0"
                }
            })
        }),
        w = (0, l.s)(v.M, {
            name: "MuiDialog",
            slot: "Paper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.paper, t["scrollPaper".concat((0, i.a)(a.scroll))], t["paperWidth".concat((0, i.a)(String(a.maxWidth)))], a.fullWidth && t.paperFullWidth, a.fullScreen && t.paperFullScreen]
            }
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, r._)({
                margin: 32,
                position: "relative",
                overflowY: "auto",
                "@media print": {
                    overflowY: "visible",
                    boxShadow: "none"
                }
            }, "paper" === a.scroll && {
                display: "flex",
                flexDirection: "column",
                maxHeight: "calc(100% - 64px)"
            }, "body" === a.scroll && {
                display: "inline-block",
                verticalAlign: "middle",
                textAlign: "left"
            }, !a.maxWidth && {
                maxWidth: "calc(100% - 64px)"
            }, "xs" === a.maxWidth && {
                maxWidth: "px" === t.breakpoints.unit ? Math.max(t.breakpoints.values.xs, 444) : "max(".concat(t.breakpoints.values.xs).concat(t.breakpoints.unit, ", 444px)"),
                ["&.".concat(b.paperScrollBody)]: {
                    [t.breakpoints.down(Math.max(t.breakpoints.values.xs, 444) + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, a.maxWidth && "xs" !== a.maxWidth && {
                maxWidth: "".concat(t.breakpoints.values[a.maxWidth]).concat(t.breakpoints.unit),
                ["&.".concat(b.paperScrollBody)]: {
                    [t.breakpoints.down(t.breakpoints.values[a.maxWidth] + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, a.fullWidth && {
                width: "calc(100% - 64px)"
            }, a.fullScreen && {
                margin: 0,
                width: "100%",
                maxWidth: "100%",
                height: "100%",
                maxHeight: "none",
                borderRadius: 0,
                ["&.".concat(b.paperScrollBody)]: {
                    margin: 0,
                    maxWidth: "100%"
                }
            })
        }),
        k = a.forwardRef(function(e, t) {
            let o = (0, g.u)({
                    props: e,
                    name: "MuiDialog"
                }),
                n = (0, c.u)(),
                s = {
                    enter: n.transitions.duration.enteringScreen,
                    exit: n.transitions.duration.leavingScreen
                },
                {
                    "aria-describedby": p,
                    "aria-labelledby": f,
                    BackdropComponent: b,
                    BackdropProps: k,
                    children: I,
                    className: P,
                    disableEscapeKeyDown: E = !1,
                    fullScreen: M = !1,
                    fullWidth: D = !1,
                    maxWidth: A = "sm",
                    onBackdropClick: L,
                    onClick: R,
                    onClose: N,
                    open: j,
                    PaperComponent: O = v.M,
                    PaperProps: W = {},
                    scroll: U = "paper",
                    TransitionComponent: _ = h.F,
                    transitionDuration: B = s,
                    TransitionProps: z
                } = o,
                F = (0, i._)(o, y),
                G = (0, r._)({}, o, {
                    disableEscapeKeyDown: E,
                    fullScreen: M,
                    fullWidth: D,
                    maxWidth: A,
                    scroll: U
                }),
                K = (e => {
                    let {
                        classes: t,
                        scroll: a,
                        maxWidth: o,
                        fullWidth: n,
                        fullScreen: r
                    } = e, s = {
                        root: ["root"],
                        container: ["container", "scroll".concat((0, i.a)(a))],
                        paper: ["paper", "paperScroll".concat((0, i.a)(a)), "paperWidth".concat((0, i.a)(String(o))), n && "paperFullWidth", r && "paperFullScreen"]
                    };
                    return (0, l.a)(s, S, t)
                })(G),
                q = a.useRef(),
                H = (0, m.u)(f),
                Y = a.useMemo(() => ({
                    titleId: H
                }), [H]);
            return (0, u.jsx)(x, (0, r._)({
                className: (0, l.c)(K.root, P),
                closeAfterTransition: !0,
                components: {
                    Backdrop: T
                },
                componentsProps: {
                    backdrop: (0, r._)({
                        transitionDuration: B,
                        as: b
                    }, k)
                },
                disableEscapeKeyDown: E,
                onClose: N,
                open: j,
                ref: t,
                onClick: e => {
                    R && R(e), q.current && (q.current = null, L && L(e), N && N(e, "backdropClick"))
                },
                ownerState: G
            }, F, {
                children: (0, u.jsx)(_, (0, r._)({
                    appear: !0,
                    in: j,
                    timeout: B,
                    role: "presentation"
                }, z, {
                    children: (0, u.jsx)(C, {
                        className: (0, l.c)(K.container),
                        onMouseDown: e => {
                            q.current = e.target === e.currentTarget
                        },
                        ownerState: G,
                        children: (0, u.jsx)(w, (0, r._)({
                            as: O,
                            elevation: 24,
                            role: "dialog",
                            "aria-describedby": p,
                            "aria-labelledby": H
                        }, W, {
                            className: (0, l.c)(K.paper, W.className),
                            ownerState: G,
                            children: (0, u.jsx)(d.D.Provider, {
                                value: Y,
                                children: I
                            })
                        }))
                    })
                }))
            }))
        });
    e.s(["M", 0, k, "d", 0, b], 568750), e.i(149285);
    var I = (0, o.default)({
            name: "Dialog"
        })(function(e) {
            return {
                paper: (0, t._)({
                    boxShadow: e.elevation.overlay,
                    backgroundColor: e.palette.surface[300]
                }, e.border.radius.large),
                xsmallBreakpointWidthOverride: {}
            }
        }),
        P = (0, a.forwardRef)(function(e, o) {
            var i = e.classes,
                r = e.children;
            e.fullScreen;
            var l = e.className,
                s = e.maxWidth,
                d = (0, t.a)(e, ["classes", "children", "fullScreen", "className", "maxWidth"]),
                c = I(void 0, {
                    props: {
                        classes: (0, n.default)(i, l)
                    }
                });
            return a.default.createElement(k, (0, t._)({}, d, {
                fullScreen: !1,
                classes: c.classes,
                maxWidth: "XSmall" === s ? "Small" : s,
                ref: o
            }), r)
        });
    e.s(["default", 0, P], 430686)
}, 291037, e => {
    "use strict";
    var t = e.i(430686);
    e.s(["Dialog", () => t.default])
}, 711489, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        o = e.i(614515),
        n = e.i(993807),
        i = e.i(286837);
    e.i(221628);
    var r = (0, o.default)({
            name: "DialogActions"
        })({
            root: {
                justifyContent: "flex-end",
                padding: 20
            }
        }),
        l = (0, a.forwardRef)(function(e, o) {
            var l = e.classes,
                s = e.children,
                d = e.className,
                c = (0, t.a)(e, ["classes", "children", "className"]),
                u = r(void 0, {
                    props: {
                        classes: (0, n.default)(l, d)
                    }
                });
            return a.default.createElement(i.D, (0, t._)({}, c, {
                classes: u.classes,
                ref: o
            }), s)
        });
    e.s(["default", 0, l])
}, 35298, e => {
    "use strict";
    var t = e.i(711489);
    e.s(["DialogActions", () => t.default])
}, 777004, 820932, 12839, 341782, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        o = e.i(614515),
        n = e.i(993807),
        i = e.i(273589),
        r = e.i(962560),
        l = e.i(42569),
        s = e.i(696180),
        d = (0, s.g)("MuiDialogTitle", ["root"]);
    e.s(["d", 0, d, "g", 0, function(e) {
        return (0, i.g)("MuiDialogTitle", e)
    }], 820932);
    var c = e.i(221628),
        u = e.i(963320);

    function p(e) {
        return (0, i.g)("MuiDialogContent", e)
    }
    var f = (0, s.g)("MuiDialogContent", ["root", "dividers"]);
    let v = ["className", "dividers"],
        g = (0, l.s)("div", {
            name: "MuiDialogContent",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, a.dividers && t.dividers]
            }
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, r._)({
                flex: "1 1 auto",
                WebkitOverflowScrolling: "touch",
                overflowY: "auto",
                padding: "20px 24px"
            }, a.dividers ? {
                padding: "16px 24px",
                borderTop: "1px solid ".concat((t.vars || t).palette.divider),
                borderBottom: "1px solid ".concat((t.vars || t).palette.divider)
            } : {
                [".".concat(d.root, " + &")]: {
                    paddingTop: 0
                }
            })
        }),
        m = a.forwardRef(function(e, t) {
            let a = (0, u.u)({
                    props: e,
                    name: "MuiDialogContent"
                }),
                {
                    className: o,
                    dividers: n = !1
                } = a,
                s = (0, i._)(a, v),
                d = (0, r._)({}, a, {
                    dividers: n
                }),
                f = (e => {
                    let {
                        classes: t,
                        dividers: a
                    } = e;
                    return (0, l.a)({
                        root: ["root", a && "dividers"]
                    }, p, t)
                })(d);
            return (0, c.jsx)(g, (0, r._)({
                className: (0, l.c)(f.root, o),
                ownerState: d,
                ref: t
            }, s))
        });
    e.s(["D", 0, m, "d", 0, f], 12839);
    var h = (0, o.default)({
            name: "DialogContent"
        })({
            root: {
                paddingLeft: 20,
                paddingRight: 20,
                paddingBottom: 12
            },
            dividers: {
                margin: "0 24px",
                padding: "16px 0"
            }
        }),
        S = (0, a.forwardRef)(function(e, o) {
            var i = e.classes,
                r = e.children,
                l = e.className,
                s = (0, t.a)(e, ["classes", "children", "className"]),
                d = h(void 0, {
                    props: {
                        classes: (0, n.default)(i, l)
                    }
                });
            return a.default.createElement(m, (0, t._)({}, s, {
                classes: d.classes,
                ref: o
            }), r)
        });
    e.s(["default", 0, S], 341782), e.s(["DialogContent", 0, S], 777004)
}, 682671, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        o = e.i(614515),
        n = e.i(993807),
        i = e.i(962560),
        r = e.i(273589),
        l = e.i(42569),
        s = e.i(820932),
        d = e.i(701569),
        c = e.i(221628),
        u = e.i(972455),
        p = e.i(963320);
    let f = ["className", "id"],
        v = (0, l.s)(u.T, {
            name: "MuiDialogTitle",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({
            padding: "16px 24px",
            flex: "0 0 auto"
        }),
        g = a.forwardRef(function(e, t) {
            let o = (0, p.u)({
                    props: e,
                    name: "MuiDialogTitle"
                }),
                {
                    className: n,
                    id: u
                } = o,
                g = (0, r._)(o, f),
                m = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, l.a)({
                        root: ["root"]
                    }, s.g, t)
                })(o),
                {
                    titleId: h = u
                } = a.useContext(d.D);
            return (0, c.jsx)(v, (0, i._)({
                component: "h2",
                className: (0, l.c)(m.root, n),
                ownerState: o,
                ref: t,
                variant: "h6",
                id: null != u ? u : h
            }, g))
        });
    var m = (0, o.default)({
            name: "DialogTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.h4), {
                    textAlign: "left",
                    padding: 20,
                    paddingBottom: 8
                })
            }
        }),
        h = (0, a.forwardRef)(function(e, o) {
            var i = e.classes,
                r = e.children,
                l = e.className,
                s = (0, t.a)(e, ["classes", "children", "className"]),
                d = m(void 0, {
                    props: {
                        classes: (0, n.default)(i, l)
                    }
                });
            return a.default.createElement(g, (0, t._)({}, s, {
                classes: d.classes,
                ref: o
            }), r)
        });
    e.s(["default", 0, h])
}, 899819, e => {
    "use strict";
    var t = e.i(682671);
    e.s(["DialogTitle", () => t.default])
}, 449934, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["BrokenImageOutlinedIcon", () => t.BrokenImageOutlined])
}, 591403, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["HourglassEmptyIcon", () => t.HourglassEmpty])
}]);

//# debugId=0820dc28-1d76-e378-6f00-7590733b8cbd
//# sourceMappingURL=0a-eov3yx4s2x.js.map