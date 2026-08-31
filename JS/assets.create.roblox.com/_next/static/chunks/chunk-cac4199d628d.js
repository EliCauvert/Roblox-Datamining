;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2b959eda-3ab3-e059-d969-bf2caa0d5847")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 991707, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function o(e, t, a, n) {
        return new(a || (a = Promise))(function(o, i) {
            function r(e) {
                try {
                    s(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                try {
                    s(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(r, l)
            }
            s((n = n.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var a, n, o, i = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
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
                    if (a = 1, n && (o = 2 & d[0] ? n.return : d[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, d[1])).done) return o;
                    switch (n = 0, o && (d = [2 & d[0], o.value]), d[0]) {
                        case 0:
                        case 1:
                            o = d;
                            break;
                        case 4:
                            return i.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = d[1], d = [0];
                            continue;
                        case 7:
                            d = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === d[0] && (!o || d[1] > o[0] && d[1] < o[3])) {
                                i.label = d[1];
                                break
                            }
                            if (6 === d[0] && i.label < o[1]) {
                                i.label = o[1], o = d;
                                break
                            }
                            if (o && i.label < o[2]) {
                                i.label = o[2], i.ops.push(d);
                                break
                            }
                            o[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    d = t.call(e, i)
                } catch (e) {
                    d = [6, e], n = 0
                } finally {
                    a = o = 0
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
                n(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
            }(t, e), t.prototype.v1PlacesAssetIdSafetyStatusGetRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var n, o, r;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new a.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1PlacesAssetIdSafetyStatusGet.");
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/places/{assetId}/safety-status".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/places/{assetId}/safety-status",
                                    method: "GET",
                                    headers: o,
                                    query: n
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
                return o(this, void 0, void 0, function() {
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
        n = e.i(889311),
        o = ((t = o || {}).LeftNavigation = "LeftNavigation", t.Landing = "Landing", t.LanguageTabSelectedRequest = "LanguageTabSelectedRequest", t.LocalizationAddSupportedLanguage = "LocalizationAddSupportedLanguage", t.LocalizationAutomaticQuotas = "LocalizationAutomaticQuotas", t.LocalizationAutoTranslationInfo = "LocalizationAutoTranslationInfo", t.LocalizationAutoTranslationStrings = "LocalizationAutoTranslationStrings", t.LocalizationAutoTranslationImage = "LocalizationAutoTranslationImage", t.LocalizationContributionReport = "LocalizationContributionReport", t.LocalizationSettingsTab = "LocalizationSettingsTab", t.LocalizationTranslatorTab = "LocalizationTranslatorTab", t.DevStats = "DevStats", t.DevStatsExportTab = "DevStats-Export", t.DocumentationLanguageSetting = "DocumentationLanguageSetting", t.AnalyticsOverview = "AnalyticsOverview", t.TranslationInformationTab = "TranslationInformationTab", t.TranslationProductsTab = "TranslationProductsTab", t.TranslationStringsTab = "TranslationStringsTab", t.NotificationContentOverview = "NotificationContentOverview", t.NotificationContentForm = "NotificationContentForm", t.NotificationAnalyticsOverview = "NotificationAnalyticsOverview", t);
    e.s(["default", 0, o], 441182);
    let i = {
            eventType: n.default.ViewComputeTab,
            context: a.default.Click
        },
        r = {
            eventType: n.default.SelectInviteTranslators,
            context: a.default.Click,
            additionalProperties: {
                Source: o.LocalizationTranslatorTab
            }
        };
    e.s(["addEntryEventModel", 0, (e, t, i, r, l, s) => ({
        eventType: n.default.AddTranslationEntry,
        context: a.default.Click,
        additionalProperties: {
            Source: o.TranslationStringsTab,
            UserResponse: s,
            OriginalString: null != e ? e : "",
            Key: null != t ? t : "",
            Context: null != i ? i : "",
            Example: null != r ? r : "",
            UniverseId: null != l ? l : ""
        }
    }), "clearAutoCapturedTableEventModel", 0, (e, t, i) => ({
        eventType: n.default.ClearAutoCapturedTable,
        context: a.default.Click,
        additionalProperties: {
            Source: o.LocalizationSettingsTab,
            SelectedTimeFrame: null != e ? e : "",
            UniverseId: t,
            StatusCode: i
        }
    }), "downloadContributorReportEventModel", 0, (e, t, i, r, l, s) => ({
        eventType: n.default.DownloadContributorReport,
        context: a.default.Click,
        additionalProperties: {
            Source: o.LocalizationContributionReport,
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
            eventType: n.default.DownloadStudio,
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
            eventType: n.default.DownloadStudio,
            context: a.default.Click,
            additionalProperties: {
                logic: "openOrDownload",
                referralUrl: document.referrer,
                downloadCode: e
            }
        }
    }, "filterProductListEventModel", 0, (e, t) => ({
        eventType: n.default.FilterTranslationProductList,
        context: a.default.Click,
        additionalProperties: {
            Source: o.TranslationProductsTab,
            ProductType: t,
            UniverseId: null != e ? e : ""
        }
    }), "inviteTranslatorEventModel", 0, (e, t, i, r) => ({
        eventType: n.default.InviteTranslatorsModel,
        context: a.default.Click,
        additionalProperties: {
            Source: o.LocalizationTranslatorTab,
            AssigneeId: null != e ? e : "",
            TranslatorType: null != i ? i : "",
            InviteOptions: r,
            UserResponse: t
        }
    }), "languageTabSelectedRequestEventModel", 0, (e, t, i) => ({
        eventType: n.default.PageTabSelected,
        context: a.default.Click,
        additionalProperties: {
            Source: o.LanguageTabSelectedRequest,
            UniverseId: null != e ? e : "",
            CurrentTab: null != t ? t : "",
            SelectedTab: null != i ? i : ""
        }
    }), "loadNotificationCategoryEventModel", 0, e => ({
        eventType: n.default.NotificationsSettingsCategoryLoad,
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
    }), "localizationSettingsToggledEventModel", 0, (e, t, n, i) => ({
        eventType: e,
        context: a.default.Click,
        additionalProperties: {
            Source: o.LocalizationSettingsTab,
            UniverseId: t,
            UserResponse: n,
            StatusCode: i
        }
    }), "manageSupportedLanguageEventModel", 0, (e, t, i, r) => ({
        eventType: n.default.ManageSupportedLanguage,
        context: a.default.Click,
        additionalProperties: {
            Source: o.LocalizationAddSupportedLanguage,
            LanguageCodes: e.toString(),
            UniverseId: t,
            UserResponse: i,
            IsAddLanguage: r ? "true" : "false"
        }
    }), "notificationSettingsLeftNavEventModel", 0, (e, t) => ({
        eventType: n.default.NotificationsSettingsLeftNavClick,
        context: a.default.Click,
        additionalProperties: {
            from: e,
            to: t
        }
    }), "notificationsSettingsCategoryCancelEventModel", 0, e => ({
        eventType: n.default.NotificationsSettingsCategoryCancelClick,
        context: a.default.Click,
        additionalProperties: {
            category: e
        }
    }), "selectInviteTranslatorsEventModel", 0, r, "studioStartAttemptEventModel", 0, e => ({
        eventType: n.default.StudioStartAttempt,
        context: a.default.Click,
        additionalProperties: {
            task: e.toLowerCase(),
            referralUrl: document.referrer
        }
    }), "studioStartSuccessEventModel", 0, e => ({
        eventType: n.default.StudioStartSuccess,
        context: a.default.Click,
        additionalProperties: {
            task: e.toLowerCase(),
            referralUrl: document.referrer
        }
    }), "switchOffAutomaticTranslationEventModel", 0, (e, t, o, i) => ({
        eventType: n.default.SwitchOffAutomaticTranslation,
        context: a.default.Click,
        additionalProperties: {
            Source: e,
            LanguageCode: o,
            UniverseId: null != t ? t : "",
            UserResponse: i
        }
    }), "switchOnAutomaticTranslationEventModel", 0, (e, t, o) => ({
        eventType: n.default.SwitchOnAutomaticTranslation,
        context: a.default.Click,
        additionalProperties: {
            Source: e,
            LanguageCode: o,
            UniverseId: null != t ? t : ""
        }
    }), "updateGameProductIconEventModel", 0, (e, t, i, r) => ({
        eventType: n.default.UpdateGameProductIcon,
        context: a.default.Click,
        additionalProperties: {
            Source: o.TranslationProductsTab,
            ProductType: e,
            ProductId: t,
            UserResponse: i,
            LanguageCode: r
        }
    }), "updateGameProductTranslationEventModel", 0, (e, t, i, r, l) => ({
        eventType: n.default.UpdateGameProductTranslation,
        context: a.default.Click,
        additionalProperties: {
            Source: o.TranslationProductsTab,
            ProductType: e,
            ProductId: t,
            FieldType: i,
            Translation: null != r ? r : "",
            LanguageCode: l
        }
    }), "updateUniverseIconAndThumbnailEventModel", 0, (e, t, i, r, l) => ({
        eventType: n.default.UpdateUniverseIconAndThumbnail,
        context: a.default.Click,
        additionalProperties: {
            Source: o.TranslationInformationTab,
            UniverseId: null != e ? e : "",
            Field: t,
            LanguageCode: null != i ? i : "",
            UserResponse: r,
            StatusCode: l
        }
    }), "updateUniverseInformationEventModel", 0, (e, t, i, r, l) => ({
        eventType: n.default.UpdateUniverseInformation,
        context: a.default.Click,
        additionalProperties: {
            Source: o.TranslationInformationTab,
            Field: e,
            OriginalString: t,
            Translation: i,
            LanguageCode: l,
            UniverseId: null != r ? r : ""
        }
    }), "viewComputeTab", 0, i, "viewNotificationsEventMode", 0, (e, t) => ({
        eventType: n.default.ViewNotifications,
        context: a.default.Click,
        additionalProperties: {
            Source: o.LeftNavigation,
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
        y = e.i(447055),
        b = e.i(706442);
    let x = "https://www.".concat("roblox.com", "/info/terms"),
        C = (0, b.makeStyles)()(() => ({
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
            translate: n,
            translateHTML: o
        } = (0, s.useTranslation)(), {
            classes: i
        } = C();
        return (0, l.jsxs)(d.Dialog, {
            open: t,
            onClose: a,
            maxWidth: "Medium",
            children: [(0, l.jsxs)(c.DialogTitle, {
                className: i.titleWrapper,
                children: [(0, l.jsx)(S.IconButton, {
                    className: i.closeIcon,
                    color: "secondary",
                    "aria-label": n("Action.Close"),
                    onClick: a,
                    size: "large",
                    children: (0, l.jsx)(y.CloseIcon, {})
                }), (0, l.jsxs)(v.Grid, {
                    container: !0,
                    alignItems: "center",
                    gap: 2,
                    children: [(0, l.jsx)(h.WarningIcon, {
                        color: "warning",
                        fontSize: "large"
                    }), (0, l.jsx)(m.Typography, {
                        variant: "h4",
                        children: n("Heading.ExperienceLocked")
                    })]
                })]
            }), (0, l.jsx)(u.DialogContent, {
                children: (0, l.jsx)(m.Typography, {
                    variant: "body1",
                    component: "div",
                    children: o("Description.ExperienceLockedTermsOfUse", [{
                        opening: "linkStart",
                        closing: "linkEnd",
                        content: e => (0, l.jsx)(g.Link, {
                            href: x,
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
                    children: n("Action.OK")
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
    let n = (0, a.createContext)(null);
    e.s(["EventTrackerProvider", 0, e => {
        let {
            children: o,
            trackerClient: i
        } = e, r = (0, a.useMemo)(() => ({
            trackerClient: i
        }), [i]);
        return (0, t.jsx)(n.Provider, {
            value: r,
            children: o
        })
    }, "useEventTrackerProvider", 0, function() {
        let e = (0, a.useContext)(n);
        if (null === e) throw Error("useEventTrackerProvider must be used within a EventTrackerProvider");
        return e
    }])
}, 893949, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(80768),
        n = e.i(416340),
        o = e.i(79187),
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
        let n = Number(e),
            o = Number(t);
        if (!Number.isFinite(n) || !Number.isFinite(o)) return !1;
        let i = null == (a = (await v.default.getDetails([n])).data) ? void 0 : a[0],
            r = null == i ? void 0 : i.rootPlaceId;
        if (null == r) return !1;
        let l = new Set([o, r]);
        return (await Promise.all([...l].map(async e => {
            var t;
            return (null == (t = (await g.default.getPlaceSafetyStatusById(e)).placeSafetyStatus) ? void 0 : t.userPlayabilityRestrictions) !== "RestrictedForAll"
        }))).every(Boolean)
    }
    var h = e.i(252842);
    let {
        getCurrentPlatform: S
    } = h.device, y = {
        light: "https://cdn.foundation.".concat("roblox.com", "/current/StudioLogo-Light.svg"),
        dark: "https://cdn.foundation.".concat("roblox.com", "/current/StudioLogo-Dark.svg")
    };
    e.s(["ThemeAwareStudioResourcesProvider", 0, function(e) {
        let {
            children: o
        } = e, {
            themeMode: l
        } = (0, i.useThemeMode)(), d = (0, n.useMemo)(() => (0, r.createStudioResources)({
            logoSrc: y[l],
            target: "global",
            environment: "production",
            fetchers: {
                userChannel: async () => (await s.channelClient.getUserChannel(S() === h.Platform.macOS ? s.EClientBinaryType.MacStudio : s.EClientBinaryType.WindowsStudio)).channelName
            },
            errorHandler: e => (0, a.captureException)(e)
        }), [l]);
        return (0, t.jsx)(r.StudioResourcesProvider, {
            resources: d,
            children: o
        })
    }, "default", 0, e => {
        let {
            user: a
        } = (0, l.useAuthentication)(), {
            locale: i
        } = (0, o.useLocalization)(), {
            translate: s
        } = (0, o.useTranslation)(), {
            settings: v
        } = (0, p.useSettings)(), {
            trackerClient: g
        } = (0, c.useEventTrackerProvider)(), h = {
            "Action.DownloadStudio": s("Action.DownloadStudio"),
            "Message.CheckingStudio": s("Message.CheckingStudio"),
            "Message.OpenStudioError": s("Message.OpenStudioError"),
            "Message.StartYourCreation": s("Message.StartYourCreation")
        }, {
            isCompatible: y,
            open: b,
            dialog: x,
            getStudioDownloadUrlAsync: C
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
        }), [T, w] = (0, n.useState)(!1), k = (0, n.useCallback)(() => w(!1), []), E = (0, n.useCallback)((e, t) => b(e, t), [b]);
        return {
            isCompatible: y,
            open: (0, n.useCallback)(e => {
                let t = {
                    userId: null == a ? void 0 : a.id,
                    locale: i || o.Locale.English,
                    protocolScheme: (S(), "roblox-studio"),
                    distributorType: "Global"
                };
                (async () => {
                    if (e.task === r.EStudioTaskType.EditPlace && v[u.FeatureFlagName.enablePlaceModerationCheckBeforeStudioOpen]) try {
                        if (!await m(e.universeId, e.placeId)) return void w(!0)
                    } catch (e) {}
                    E(e, t)
                })().catch(() => {})
            }, [null == a ? void 0 : a.id, i, E, v]),
            dialog: (0, t.jsxs)(t.Fragment, {
                children: [x, (0, t.jsx)(f.default, {
                    open: T,
                    onClose: k
                })]
            }),
            getStudioDownloadUrlAsync: C
        }
    }], 893949)
}, 23342, 78892, e => {
    "use strict";
    var t = e.i(416340);

    function a(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function n() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return e => {
            let n = !1,
                o = t.map(t => {
                    let o = a(t, e);
                    return n || "function" != typeof o || (n = !0), o
                });
            if (n) return () => {
                for (let e = 0; e < o.length; e++) {
                    let n = o[e];
                    "function" == typeof n ? n() : a(t[e], null)
                }
            }
        }
    }
    e.s(["composeRefs", 0, n, "useComposedRefs", 0, function() {
        for (var e = arguments.length, a = Array(e), o = 0; o < e; o++) a[o] = arguments[o];
        return t.useCallback(n(...a), a)
    }], 78892);
    var o = e.i(221628),
        i = Symbol.for("react.lazy"),
        r = t[" use ".trim().toString()];

    function l(e) {
        var t;
        return null != e && "object" == typeof e && "$$typeof" in e && e.$$typeof === i && "_payload" in e && "object" == typeof(t = e._payload) && null !== t && "then" in t
    }

    function s(e) {
        var a;
        let i, s = (a = e, (i = t.forwardRef((e, a) => {
                let {
                    children: o,
                    ...i
                } = e;
                if (l(o) && "function" == typeof r && (o = r(o._payload)), t.isValidElement(o)) {
                    var s, d, c;
                    let e, r, l = (r = (e = null == (d = Object.getOwnPropertyDescriptor((s = o).props, "ref")) ? void 0 : d.get) && "isReactWarning" in e && e.isReactWarning) ? s.ref : (r = (e = null == (c = Object.getOwnPropertyDescriptor(s, "ref")) ? void 0 : c.get) && "isReactWarning" in e && e.isReactWarning) ? s.props.ref : s.props.ref || s.ref,
                        u = function(e, t) {
                            let a = {
                                ...t
                            };
                            for (let n in t) {
                                let o = e[n],
                                    i = t[n];
                                /^on[A-Z]/.test(n) ? o && i ? a[n] = function() {
                                    for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
                                    let n = i(...t);
                                    return o(...t), n
                                } : o && (a[n] = o) : "style" === n ? a[n] = {
                                    ...o,
                                    ...i
                                } : "className" === n && (a[n] = [o, i].filter(Boolean).join(" "))
                            }
                            return {
                                ...e,
                                ...a
                            }
                        }(i, o.props);
                    return o.type !== t.Fragment && (u.ref = a ? n(a, l) : l), t.cloneElement(o, u)
                }
                return t.Children.count(o) > 1 ? t.Children.only(null) : null
            })).displayName = "".concat(a, ".SlotClone"), i),
            d = t.forwardRef((e, a) => {
                let {
                    children: n,
                    ...i
                } = e;
                l(n) && "function" == typeof r && (n = r(n._payload));
                let d = t.Children.toArray(n),
                    c = d.find(u);
                if (c) {
                    let e = c.props.children,
                        n = d.map(a => a !== c ? a : t.Children.count(e) > 1 ? t.Children.only(null) : t.isValidElement(e) ? e.props.children : null);
                    return (0, o.jsx)(s, {
                        ...i,
                        ref: a,
                        children: t.isValidElement(e) ? t.cloneElement(e, void 0, n) : null
                    })
                }
                return (0, o.jsx)(s, {
                    ...i,
                    ref: a,
                    children: n
                })
            });
        return d.displayName = "".concat(e, ".Slot"), d
    }
    var d = s("Slot"),
        c = Symbol("radix.slottable");

    function u(e) {
        return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === c
    }
    e.s(["Slot", 0, d, "createSlot", 0, s], 23342)
}, 608972, e => {
    "use strict";
    var t = e.i(253923),
        a = e.i(106077),
        n = e.i(409653),
        o = e.i(605836),
        i = e.i(197649),
        r = e.i(416340),
        l = e.i(23342);
    let s = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        d = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        c = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        u = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        p = (0, r.forwardRef)((e, p) => {
            let {
                children: f,
                className: v,
                style: g,
                isDisabled: m = !1,
                isLoading: h = !1,
                icon: S,
                size: y = "Large",
                variant: b = "Emphasis",
                asChild: x,
                ...C
            } = e, T = (0, i.default)("foundation-web-button", m ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", d[y], m ? u[b] : c[b], v), w = {
                textDecoration: "none",
                ...g
            }, k = e => r.default.createElement(r.default.Fragment, null, r.default.createElement(t.StateLayer, null), h && r.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, r.default.createElement(n.LoadingSpinner, {
                width: s[y],
                height: s[y]
            })), r.default.createElement("span", {
                className: (0, i.default)("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", h && "invisible")
            }, S && r.default.createElement(o.Icon, {
                name: S,
                size: y
            }), r.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (x) {
                let {
                    as: e,
                    ...t
                } = C, a = r.default.Children.only(f);
                return r.default.createElement(l.Slot, {
                    ref: p,
                    ...t,
                    className: T,
                    style: w,
                    "aria-disabled": m || void 0
                }, r.default.cloneElement(a, {}, k(a.props.children)))
            }
            if ("a" === C.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = C;
                return r.default.createElement("a", {
                    ref: p,
                    ...a,
                    "aria-disabled": m,
                    href: m ? void 0 : t,
                    className: T,
                    style: w
                }, k(f))
            }
            let {
                as: E,
                ...P
            } = C;
            return r.default.createElement("button", {
                ref: p,
                type: "button",
                ...P,
                disabled: m,
                className: T,
                style: w
            }, k(f))
        });
    e.s(["Button", 0, p])
}, 605836, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        o = a.default.forwardRef((e, o) => {
            let {
                name: i,
                size: r = "Medium",
                className: l,
                children: s,
                ...d
            } = e;
            return a.default.createElement("span", {
                ref: o,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon", i, n[r], l),
                ...d
            })
        });
    o.displayName = "Icon", e.s(["Icon", 0, o])
}, 409653, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["LoadingSpinner", 0, e => {
        let {
            width: a,
            height: n
        } = e;
        return t.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: a,
            height: n,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, t.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    }])
}, 253923, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    e.s(["StateLayer", 0, e => {
        let {
            className: n
        } = e;
        return a.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, t.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", n)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 106077, e => {
    "use strict";
    e.s(["disabledOpacity", 0, "opacity-[0.5]"])
}, 286837, e => {
    "use strict";
    var t = e.i(273589),
        a = e.i(962560),
        n = e.i(416340),
        o = e.i(42569),
        i = e.i(696180),
        r = e.i(221628),
        l = e.i(963320);

    function s(e) {
        return (0, t.g)("MuiDialogActions", e)
    }(0, i.g)("MuiDialogActions", ["root", "spacing"]);
    let d = ["className", "disableSpacing"],
        c = (0, o.s)("div", {
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
        u = n.forwardRef(function(e, n) {
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
                    return (0, o.a)({
                        root: ["root", !a && "spacing"]
                    }, s, t)
                })(v);
            return (0, r.jsx)(c, (0, a._)({
                className: (0, o.c)(g.root, u),
                ownerState: v,
                ref: n
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
        n = e.i(614515),
        o = e.i(993807),
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
    var y = (0, s.g)("MuiDialog", ["root", "scrollPaper", "scrollBody", "container", "paper", "paperScrollPaper", "paperScrollBody", "paperWidthFalse", "paperWidthXs", "paperWidthSm", "paperWidthMd", "paperWidthLg", "paperWidthXl", "paperFullWidth", "paperFullScreen"]);
    let b = ["aria-describedby", "aria-labelledby", "BackdropComponent", "BackdropProps", "children", "className", "disableEscapeKeyDown", "fullScreen", "fullWidth", "maxWidth", "onBackdropClick", "onClick", "onClose", "open", "PaperComponent", "PaperProps", "scroll", "TransitionComponent", "transitionDuration", "TransitionProps"],
        x = (0, l.s)(p.M, {
            name: "MuiDialog",
            slot: "Backdrop",
            overrides: (e, t) => t.backdrop
        })({
            zIndex: -1
        }),
        C = (0, l.s)(f.M, {
            name: "MuiDialog",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({
            "@media print": {
                position: "absolute !important"
            }
        }),
        T = (0, l.s)("div", {
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
                ["&.".concat(y.paperScrollBody)]: {
                    [t.breakpoints.down(Math.max(t.breakpoints.values.xs, 444) + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, a.maxWidth && "xs" !== a.maxWidth && {
                maxWidth: "".concat(t.breakpoints.values[a.maxWidth]).concat(t.breakpoints.unit),
                ["&.".concat(y.paperScrollBody)]: {
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
                ["&.".concat(y.paperScrollBody)]: {
                    margin: 0,
                    maxWidth: "100%"
                }
            })
        }),
        k = a.forwardRef(function(e, t) {
            let n = (0, g.u)({
                    props: e,
                    name: "MuiDialog"
                }),
                o = (0, c.u)(),
                s = {
                    enter: o.transitions.duration.enteringScreen,
                    exit: o.transitions.duration.leavingScreen
                },
                {
                    "aria-describedby": p,
                    "aria-labelledby": f,
                    BackdropComponent: y,
                    BackdropProps: k,
                    children: E,
                    className: P,
                    disableEscapeKeyDown: M = !1,
                    fullScreen: L = !1,
                    fullWidth: A = !1,
                    maxWidth: I = "sm",
                    onBackdropClick: D,
                    onClick: R,
                    onClose: N,
                    open: O,
                    PaperComponent: W = v.M,
                    PaperProps: _ = {},
                    scroll: j = "paper",
                    TransitionComponent: z = h.F,
                    transitionDuration: U = s,
                    TransitionProps: B
                } = n,
                F = (0, i._)(n, b),
                G = (0, r._)({}, n, {
                    disableEscapeKeyDown: M,
                    fullScreen: L,
                    fullWidth: A,
                    maxWidth: I,
                    scroll: j
                }),
                K = (e => {
                    let {
                        classes: t,
                        scroll: a,
                        maxWidth: n,
                        fullWidth: o,
                        fullScreen: r
                    } = e, s = {
                        root: ["root"],
                        container: ["container", "scroll".concat((0, i.a)(a))],
                        paper: ["paper", "paperScroll".concat((0, i.a)(a)), "paperWidth".concat((0, i.a)(String(n))), o && "paperFullWidth", r && "paperFullScreen"]
                    };
                    return (0, l.a)(s, S, t)
                })(G),
                X = a.useRef(),
                q = (0, m.u)(f),
                V = a.useMemo(() => ({
                    titleId: q
                }), [q]);
            return (0, u.jsx)(C, (0, r._)({
                className: (0, l.c)(K.root, P),
                closeAfterTransition: !0,
                components: {
                    Backdrop: x
                },
                componentsProps: {
                    backdrop: (0, r._)({
                        transitionDuration: U,
                        as: y
                    }, k)
                },
                disableEscapeKeyDown: M,
                onClose: N,
                open: O,
                ref: t,
                onClick: e => {
                    R && R(e), X.current && (X.current = null, D && D(e), N && N(e, "backdropClick"))
                },
                ownerState: G
            }, F, {
                children: (0, u.jsx)(z, (0, r._)({
                    appear: !0,
                    in: O,
                    timeout: U,
                    role: "presentation"
                }, B, {
                    children: (0, u.jsx)(T, {
                        className: (0, l.c)(K.container),
                        onMouseDown: e => {
                            X.current = e.target === e.currentTarget
                        },
                        ownerState: G,
                        children: (0, u.jsx)(w, (0, r._)({
                            as: W,
                            elevation: 24,
                            role: "dialog",
                            "aria-describedby": p,
                            "aria-labelledby": q
                        }, _, {
                            className: (0, l.c)(K.paper, _.className),
                            ownerState: G,
                            children: (0, u.jsx)(d.D.Provider, {
                                value: V,
                                children: E
                            })
                        }))
                    })
                }))
            }))
        });
    e.s(["M", 0, k, "d", 0, y], 568750), e.i(149285);
    var E = (0, n.default)({
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
        P = (0, a.forwardRef)(function(e, n) {
            var i = e.classes,
                r = e.children;
            e.fullScreen;
            var l = e.className,
                s = e.maxWidth,
                d = (0, t.a)(e, ["classes", "children", "fullScreen", "className", "maxWidth"]),
                c = E(void 0, {
                    props: {
                        classes: (0, o.default)(i, l)
                    }
                });
            return a.default.createElement(k, (0, t._)({}, d, {
                fullScreen: !1,
                classes: c.classes,
                maxWidth: "XSmall" === s ? "Small" : s,
                ref: n
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
        n = e.i(614515),
        o = e.i(993807),
        i = e.i(286837);
    e.i(221628);
    var r = (0, n.default)({
            name: "DialogActions"
        })({
            root: {
                justifyContent: "flex-end",
                padding: 20
            }
        }),
        l = (0, a.forwardRef)(function(e, n) {
            var l = e.classes,
                s = e.children,
                d = e.className,
                c = (0, t.a)(e, ["classes", "children", "className"]),
                u = r(void 0, {
                    props: {
                        classes: (0, o.default)(l, d)
                    }
                });
            return a.default.createElement(i.D, (0, t._)({}, c, {
                classes: u.classes,
                ref: n
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
        n = e.i(614515),
        o = e.i(993807),
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
                    className: n,
                    dividers: o = !1
                } = a,
                s = (0, i._)(a, v),
                d = (0, r._)({}, a, {
                    dividers: o
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
                className: (0, l.c)(f.root, n),
                ownerState: d,
                ref: t
            }, s))
        });
    e.s(["D", 0, m, "d", 0, f], 12839);
    var h = (0, n.default)({
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
        S = (0, a.forwardRef)(function(e, n) {
            var i = e.classes,
                r = e.children,
                l = e.className,
                s = (0, t.a)(e, ["classes", "children", "className"]),
                d = h(void 0, {
                    props: {
                        classes: (0, o.default)(i, l)
                    }
                });
            return a.default.createElement(m, (0, t._)({}, s, {
                classes: d.classes,
                ref: n
            }), r)
        });
    e.s(["default", 0, S], 341782), e.s(["DialogContent", 0, S], 777004)
}, 682671, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        n = e.i(614515),
        o = e.i(993807),
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
            let n = (0, p.u)({
                    props: e,
                    name: "MuiDialogTitle"
                }),
                {
                    className: o,
                    id: u
                } = n,
                g = (0, r._)(n, f),
                m = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, l.a)({
                        root: ["root"]
                    }, s.g, t)
                })(n),
                {
                    titleId: h = u
                } = a.useContext(d.D);
            return (0, c.jsx)(v, (0, i._)({
                component: "h2",
                className: (0, l.c)(m.root, o),
                ownerState: n,
                ref: t,
                variant: "h6",
                id: null != u ? u : h
            }, g))
        });
    var m = (0, n.default)({
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
        h = (0, a.forwardRef)(function(e, n) {
            var i = e.classes,
                r = e.children,
                l = e.className,
                s = (0, t.a)(e, ["classes", "children", "className"]),
                d = m(void 0, {
                    props: {
                        classes: (0, o.default)(i, l)
                    }
                });
            return a.default.createElement(g, (0, t._)({}, s, {
                classes: d.classes,
                ref: n
            }), r)
        });
    e.s(["default", 0, h])
}, 899819, e => {
    "use strict";
    var t = e.i(682671);
    e.s(["DialogTitle", () => t.default])
}, 620068, 221180, e => {
    "use strict";
    var t = e.i(371927);
    e.i(416340);
    var a = t.u;
    e.s(["default", 0, a], 221180), e.s(["useMediaQuery", 0, a], 620068)
}, 197649, e => {
    "use strict";

    function t() {
        for (var e, t, a = 0, n = "", o = arguments.length; a < o; a++)(e = arguments[a]) && (t = function e(t) {
            var a, n, o = "";
            if ("string" == typeof t || "number" == typeof t) o += t;
            else if ("object" == typeof t)
                if (Array.isArray(t)) {
                    var i = t.length;
                    for (a = 0; a < i; a++) t[a] && (n = e(t[a])) && (o && (o += " "), o += n)
                } else
                    for (n in t) t[n] && (o && (o += " "), o += n);
            return o
        }(e)) && (n && (n += " "), n += t);
        return n
    }
    e.s(["clsx", 0, t, "default", 0, t])
}]);

//# debugId=2b959eda-3ab3-e059-d969-bf2caa0d5847
//# sourceMappingURL=3qazy61iwu3vn.js.map