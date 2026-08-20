;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3452728b-e5cd-cb3a-ec42-083ec6eea80d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 991707, e => {
    "use strict";
    var t = e.i(721281),
        i = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i])
            })(e, t)
        };

    function o(e, t, i, n) {
        return new(i || (i = Promise))(function(o, r) {
            function a(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(a, s)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var i, n, o, r = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(l) {
                var c = [s, l];
                if (i) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (r = 0)), r;) try {
                    if (i = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                        case 0:
                        case 1:
                            o = c;
                            break;
                        case 4:
                            return r.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = r.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                r.label = c[1];
                                break
                            }
                            if (6 === c[0] && r.label < o[1]) {
                                r.label = o[1], o = c;
                                break
                            }
                            if (o && r.label < o[2]) {
                                r.label = o[2], r.ops.push(c);
                                break
                            }
                            o[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    c = t.call(e, r)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    i = o = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var a = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function i() {
                    this.constructor = e
                }
                n(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
            }(t, e), t.prototype.v1PlacesAssetIdSafetyStatusGetRaw = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var n, o, a;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new i.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1PlacesAssetIdSafetyStatusGet.");
                                return n = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/places/{assetId}/safety-status".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/places/{assetId}/safety-status",
                                    method: "GET",
                                    headers: o,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new i.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        placeSafetyStatus: (0, i.exists)(e, "placeSafetyStatus") ? e.placeSafetyStatus : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesAssetIdSafetyStatusGet = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return r(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1PlacesAssetIdSafetyStatusGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(i.BaseAPI),
        s = e.i(272593);
    let l = new class {
        getPlaceSafetyStatusById(e) {
            return this.placeSafetyStatusApi.v1PlacesAssetIdSafetyStatusGet({
                assetId: e
            })
        }
        constructor() {
            (0, t._)(this, "placeSafetyStatusApi", void 0);
            const e = (0, s.createClientConfiguration)("content-safety", "bedev2");
            this.placeSafetyStatusApi = new a(e)
        }
    };
    e.s(["default", 0, l], 991707)
}, 413019, e => {
    "use strict";
    var t = e.i(521811),
        i = e.i(889311),
        n = e.i(441182);
    let o = {
            eventType: i.default.ViewComputeTab,
            context: t.default.Click
        },
        r = {
            eventType: i.default.SelectInviteTranslators,
            context: t.default.Click,
            additionalProperties: {
                Source: n.default.LocalizationTranslatorTab
            }
        };
    e.s(["addEntryEventModel", 0, (e, o, r, a, s, l) => ({
        eventType: i.default.AddTranslationEntry,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.TranslationStringsTab,
            UserResponse: l,
            OriginalString: null != e ? e : "",
            Key: null != o ? o : "",
            Context: null != r ? r : "",
            Example: null != a ? a : "",
            UniverseId: null != s ? s : ""
        }
    }), "clearAutoCapturedTableEventModel", 0, (e, o, r) => ({
        eventType: i.default.ClearAutoCapturedTable,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.LocalizationSettingsTab,
            SelectedTimeFrame: null != e ? e : "",
            UniverseId: o,
            StatusCode: r
        }
    }), "downloadContributorReportEventModel", 0, (e, o, r, a, s, l) => ({
        eventType: i.default.DownloadContributorReport,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.LocalizationContributionReport,
            UniverseId: e,
            StartDate: o.toISOString(),
            EndDate: r.toISOString(),
            ReportType: a,
            ReportTargetId: s,
            StatusCode: l
        }
    }), "downloadStudioDirectDownloadEventModel", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "";
        return {
            eventType: i.default.DownloadStudio,
            context: t.default.Click,
            additionalProperties: {
                logic: "directDownload",
                referralUrl: document.referrer,
                downloadCode: e
            }
        }
    }, "downloadStudioOpenOrDownloadEventModel", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "";
        return {
            eventType: i.default.DownloadStudio,
            context: t.default.Click,
            additionalProperties: {
                logic: "openOrDownload",
                referralUrl: document.referrer,
                downloadCode: e
            }
        }
    }, "filterProductListEventModel", 0, (e, o) => ({
        eventType: i.default.FilterTranslationProductList,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.TranslationProductsTab,
            ProductType: o,
            UniverseId: null != e ? e : ""
        }
    }), "inviteTranslatorEventModel", 0, (e, o, r, a) => ({
        eventType: i.default.InviteTranslatorsModel,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.LocalizationTranslatorTab,
            AssigneeId: null != e ? e : "",
            TranslatorType: null != r ? r : "",
            InviteOptions: a,
            UserResponse: o
        }
    }), "languageTabSelectedRequestEventModel", 0, (e, o, r) => ({
        eventType: i.default.PageTabSelected,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.LanguageTabSelectedRequest,
            UniverseId: null != e ? e : "",
            CurrentTab: null != o ? o : "",
            SelectedTab: null != r ? r : ""
        }
    }), "loadNotificationCategoryEventModel", 0, e => ({
        eventType: i.default.NotificationsSettingsCategoryLoad,
        context: t.default.Load,
        additionalProperties: {
            category: e
        }
    }), "loadPageEventModel", 0, () => ({
        eventType: "loadPage",
        context: t.default.Load,
        additionalProperties: {
            referralUrl: document.referrer
        }
    }), "localizationSettingsToggledEventModel", 0, (e, i, o, r) => ({
        eventType: e,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.LocalizationSettingsTab,
            UniverseId: i,
            UserResponse: o,
            StatusCode: r
        }
    }), "manageSupportedLanguageEventModel", 0, (e, o, r, a) => ({
        eventType: i.default.ManageSupportedLanguage,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.LocalizationAddSupportedLanguage,
            LanguageCodes: e.toString(),
            UniverseId: o,
            UserResponse: r,
            IsAddLanguage: a ? "true" : "false"
        }
    }), "notificationSettingsLeftNavEventModel", 0, (e, n) => ({
        eventType: i.default.NotificationsSettingsLeftNavClick,
        context: t.default.Click,
        additionalProperties: {
            from: e,
            to: n
        }
    }), "notificationsSettingsCategoryCancelEventModel", 0, e => ({
        eventType: i.default.NotificationsSettingsCategoryCancelClick,
        context: t.default.Click,
        additionalProperties: {
            category: e
        }
    }), "selectInviteTranslatorsEventModel", 0, r, "studioStartAttemptEventModel", 0, e => ({
        eventType: i.default.StudioStartAttempt,
        context: t.default.Click,
        additionalProperties: {
            task: e.toLowerCase(),
            referralUrl: document.referrer
        }
    }), "studioStartSuccessEventModel", 0, e => ({
        eventType: i.default.StudioStartSuccess,
        context: t.default.Click,
        additionalProperties: {
            task: e.toLowerCase(),
            referralUrl: document.referrer
        }
    }), "switchOffAutomaticTranslationEventModel", 0, (e, n, o, r) => ({
        eventType: i.default.SwitchOffAutomaticTranslation,
        context: t.default.Click,
        additionalProperties: {
            Source: e,
            LanguageCode: o,
            UniverseId: null != n ? n : "",
            UserResponse: r
        }
    }), "switchOnAutomaticTranslationEventModel", 0, (e, n, o) => ({
        eventType: i.default.SwitchOnAutomaticTranslation,
        context: t.default.Click,
        additionalProperties: {
            Source: e,
            LanguageCode: o,
            UniverseId: null != n ? n : ""
        }
    }), "updateGameProductIconEventModel", 0, (e, o, r, a) => ({
        eventType: i.default.UpdateGameProductIcon,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.TranslationProductsTab,
            ProductType: e,
            ProductId: o,
            UserResponse: r,
            LanguageCode: a
        }
    }), "updateGameProductTranslationEventModel", 0, (e, o, r, a, s) => ({
        eventType: i.default.UpdateGameProductTranslation,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.TranslationProductsTab,
            ProductType: e,
            ProductId: o,
            FieldType: r,
            Translation: null != a ? a : "",
            LanguageCode: s
        }
    }), "updateUniverseIconAndThumbnailEventModel", 0, (e, o, r, a, s) => ({
        eventType: i.default.UpdateUniverseIconAndThumbnail,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.TranslationInformationTab,
            UniverseId: null != e ? e : "",
            Field: o,
            LanguageCode: null != r ? r : "",
            UserResponse: a,
            StatusCode: s
        }
    }), "updateUniverseInformationEventModel", 0, (e, o, r, a, s) => ({
        eventType: i.default.UpdateUniverseInformation,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.TranslationInformationTab,
            Field: e,
            OriginalString: o,
            Translation: r,
            LanguageCode: s,
            UniverseId: null != a ? a : ""
        }
    }), "viewComputeTab", 0, o, "viewNotificationsEventMode", 0, (e, o) => ({
        eventType: i.default.ViewNotifications,
        context: t.default.Click,
        additionalProperties: {
            Source: n.default.LeftNavigation,
            userId: e ? "".concat(e) : "unknown",
            universeId: o ? "".concat(o) : "unknown"
        }
    })])
}, 521811, e => {
    "use strict";
    var t, i = ((t = i || {}).Click = "click", t.Hover = "hover", t.Load = "load", t);
    e.s(["default", 0, i])
}, 441182, e => {
    "use strict";
    var t, i = ((t = i || {}).LeftNavigation = "LeftNavigation", t.Landing = "Landing", t.LanguageTabSelectedRequest = "LanguageTabSelectedRequest", t.LocalizationAddSupportedLanguage = "LocalizationAddSupportedLanguage", t.LocalizationAutomaticQuotas = "LocalizationAutomaticQuotas", t.LocalizationAutoTranslationInfo = "LocalizationAutoTranslationInfo", t.LocalizationAutoTranslationStrings = "LocalizationAutoTranslationStrings", t.LocalizationAutoTranslationImage = "LocalizationAutoTranslationImage", t.LocalizationContributionReport = "LocalizationContributionReport", t.LocalizationSettingsTab = "LocalizationSettingsTab", t.LocalizationTranslatorTab = "LocalizationTranslatorTab", t.DevStats = "DevStats", t.DevStatsExportTab = "DevStats-Export", t.DocumentationLanguageSetting = "DocumentationLanguageSetting", t.AnalyticsOverview = "AnalyticsOverview", t.TranslationInformationTab = "TranslationInformationTab", t.TranslationProductsTab = "TranslationProductsTab", t.TranslationStringsTab = "TranslationStringsTab", t.NotificationContentOverview = "NotificationContentOverview", t.NotificationContentForm = "NotificationContentForm", t.NotificationAnalyticsOverview = "NotificationAnalyticsOverview", t);
    e.s(["default", 0, i])
}, 709337, e => {
    "use strict";
    var t = e.i(221628),
        i = e.i(416340);
    let n = (0, i.createContext)(null);
    e.s(["EventTrackerProvider", 0, e => {
        let {
            children: o,
            trackerClient: r
        } = e, a = (0, i.useMemo)(() => ({
            trackerClient: r
        }), [r]);
        return (0, t.jsx)(n.Provider, {
            value: a,
            children: o
        })
    }, "useEventTrackerProvider", 0, function() {
        let e = (0, i.useContext)(n);
        if (null === e) throw Error("useEventTrackerProvider must be used within a EventTrackerProvider");
        return e
    }])
}, 877051, e => {
    "use strict";
    var t = e.i(221628),
        i = e.i(79187),
        n = e.i(291037),
        o = e.i(899819),
        r = e.i(777004),
        a = e.i(35298),
        s = e.i(872204),
        l = e.i(169722),
        c = e.i(982234),
        u = e.i(199834),
        p = e.i(354246),
        d = e.i(988012),
        h = e.i(447055),
        v = e.i(706442);
    let f = "https://www.".concat("roblox.com", "/info/terms"),
        m = (0, v.makeStyles)()(() => ({
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
            open: v,
            onClose: y
        } = e, {
            translate: g,
            translateHTML: w
        } = (0, i.useTranslation)(), {
            classes: A
        } = m();
        return (0, t.jsxs)(n.Dialog, {
            open: v,
            onClose: y,
            maxWidth: "Medium",
            children: [(0, t.jsxs)(o.DialogTitle, {
                className: A.titleWrapper,
                children: [(0, t.jsx)(d.IconButton, {
                    className: A.closeIcon,
                    color: "secondary",
                    "aria-label": g("Action.Close"),
                    onClick: y,
                    size: "large",
                    children: (0, t.jsx)(h.CloseIcon, {})
                }), (0, t.jsxs)(l.Grid, {
                    container: !0,
                    alignItems: "center",
                    gap: 2,
                    children: [(0, t.jsx)(p.WarningIcon, {
                        color: "warning",
                        fontSize: "large"
                    }), (0, t.jsx)(u.Typography, {
                        variant: "h4",
                        children: g("Heading.ExperienceLocked")
                    })]
                })]
            }), (0, t.jsx)(r.DialogContent, {
                children: (0, t.jsx)(u.Typography, {
                    variant: "body1",
                    component: "div",
                    children: w("Description.ExperienceLockedTermsOfUse", [{
                        opening: "linkStart",
                        closing: "linkEnd",
                        content: e => (0, t.jsx)(c.Link, {
                            href: f,
                            target: "_blank",
                            rel: "noopener noreferrer",
                            children: e
                        })
                    }])
                })
            }), (0, t.jsx)(a.DialogActions, {
                children: (0, t.jsx)(s.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    size: "large",
                    onClick: y,
                    children: g("Action.OK")
                })
            })]
        })
    }])
}, 893949, e => {
    "use strict";
    var t = e.i(221628),
        i = e.i(80768),
        n = e.i(416340),
        o = e.i(79187),
        r = e.i(921394),
        a = e.i(581577),
        s = e.i(814975),
        l = e.i(639102),
        c = e.i(413019),
        u = e.i(709337),
        p = e.i(429246),
        d = e.i(486736),
        h = e.i(877051),
        v = e.i(392782),
        f = e.i(991707);
    async function m(e, t) {
        var i;
        let n = Number(e),
            o = Number(t);
        if (!Number.isFinite(n) || !Number.isFinite(o)) return !1;
        let r = null == (i = (await v.default.getDetails([n])).data) ? void 0 : i[0],
            a = null == r ? void 0 : r.rootPlaceId;
        if (null == a) return !1;
        let s = new Set([o, a]);
        return (await Promise.all([...s].map(async e => {
            var t;
            return (null == (t = (await f.default.getPlaceSafetyStatusById(e)).placeSafetyStatus) ? void 0 : t.userPlayabilityRestrictions) !== "RestrictedForAll"
        }))).every(Boolean)
    }
    var y = e.i(252842);
    let {
        getCurrentPlatform: g
    } = y.device, w = {
        light: "https://cdn.foundation.".concat("roblox.com", "/current/StudioLogo-Light.svg"),
        dark: "https://cdn.foundation.".concat("roblox.com", "/current/StudioLogo-Dark.svg")
    };
    e.s(["ThemeAwareStudioResourcesProvider", 0, function(e) {
        let {
            children: o
        } = e, {
            themeMode: s
        } = (0, r.useThemeMode)(), c = (0, n.useMemo)(() => (0, a.createStudioResources)({
            logoSrc: w[s],
            target: "global",
            environment: "production",
            fetchers: {
                userChannel: async () => (await l.channelClient.getUserChannel(g() === y.Platform.macOS ? l.EClientBinaryType.MacStudio : l.EClientBinaryType.WindowsStudio)).channelName
            },
            errorHandler: e => (0, i.captureException)(e)
        }), [s]);
        return (0, t.jsx)(a.StudioResourcesProvider, {
            resources: c,
            children: o
        })
    }, "default", 0, e => {
        let {
            user: i
        } = (0, s.useAuthentication)(), {
            locale: r
        } = (0, o.useLocalization)(), {
            translate: l
        } = (0, o.useTranslation)(), {
            settings: v
        } = (0, d.useSettings)(), {
            trackerClient: f
        } = (0, u.useEventTrackerProvider)(), y = {
            "Action.DownloadStudio": l("Action.DownloadStudio"),
            "Message.CheckingStudio": l("Message.CheckingStudio"),
            "Message.OpenStudioError": l("Message.OpenStudioError"),
            "Message.StartYourCreation": l("Message.StartYourCreation")
        }, {
            isCompatible: w,
            open: A,
            dialog: b,
            getStudioDownloadUrlAsync: x
        } = (0, a.useStudio)(null != e ? e : y, {
            startAttempt: e => f.sendEvent((0, c.studioStartAttemptEventModel)(e.task)),
            startSuccess: e => f.sendEvent((0, c.studioStartSuccessEventModel)(e.task)),
            download: (e, t) => {
                (null == t ? void 0 : t.getDownloadCode) ? t.getDownloadCode().then(e => {
                    void 0 !== e ? f.sendEvent((0, c.downloadStudioOpenOrDownloadEventModel)(e)) : f.sendEvent((0, c.downloadStudioOpenOrDownloadEventModel)())
                }).catch(() => {
                    f.sendEvent((0, c.downloadStudioOpenOrDownloadEventModel)())
                }): f.sendEvent((0, c.downloadStudioOpenOrDownloadEventModel)())
            }
        }), [S, R] = (0, n.useState)(!1), I = (0, n.useCallback)(() => R(!1), []), T = (0, n.useCallback)((e, t) => A(e, t), [A]);
        return {
            isCompatible: w,
            open: (0, n.useCallback)(e => {
                let t = {
                    userId: null == i ? void 0 : i.id,
                    locale: r || o.Locale.English,
                    protocolScheme: (g(), "roblox-studio"),
                    distributorType: "Global"
                };
                (async () => {
                    if (e.task === a.EStudioTaskType.EditPlace && v[p.FeatureFlagName.enablePlaceModerationCheckBeforeStudioOpen]) try {
                        if (!await m(e.universeId, e.placeId)) return void R(!0)
                    } catch (e) {}
                    T(e, t)
                })().catch(() => {})
            }, [null == i ? void 0 : i.id, r, T, v]),
            dialog: (0, t.jsxs)(t.Fragment, {
                children: [b, (0, t.jsx)(h.default, {
                    open: S,
                    onClose: I
                })]
            }),
            getStudioDownloadUrlAsync: x
        }
    }], 893949)
}, 286837, e => {
    "use strict";
    var t = e.i(273589),
        i = e.i(962560),
        n = e.i(416340),
        o = e.i(42569),
        r = e.i(696180),
        a = e.i(221628),
        s = e.i(963320);

    function l(e) {
        return (0, t.g)("MuiDialogActions", e)
    }(0, r.g)("MuiDialogActions", ["root", "spacing"]);
    let c = ["className", "disableSpacing"],
        u = (0, o.s)("div", {
            name: "MuiDialogActions",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [t.root, !i.disableSpacing && t.spacing]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, i._)({
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
        p = n.forwardRef(function(e, n) {
            let r = (0, s.u)({
                    props: e,
                    name: "MuiDialogActions"
                }),
                {
                    className: p,
                    disableSpacing: d = !1
                } = r,
                h = (0, t._)(r, c),
                v = (0, i._)({}, r, {
                    disableSpacing: d
                }),
                f = (e => {
                    let {
                        classes: t,
                        disableSpacing: i
                    } = e;
                    return (0, o.a)({
                        root: ["root", !i && "spacing"]
                    }, l, t)
                })(v);
            return (0, a.jsx)(u, (0, i._)({
                className: (0, o.c)(f.root, p),
                ownerState: v,
                ref: n
            }, h))
        });
    e.s(["D", 0, p])
}, 701569, e => {
    "use strict";
    let t = e.i(416340).createContext({});
    e.s(["D", 0, t])
}, 430686, 568750, e => {
    "use strict";
    var t = e.i(865800),
        i = e.i(416340),
        n = e.i(614515),
        o = e.i(993807),
        r = e.i(273589),
        a = e.i(962560),
        s = e.i(42569),
        l = e.i(696180),
        c = e.i(701569),
        u = e.i(652199),
        p = e.i(221628),
        d = e.i(450096),
        h = e.i(489710),
        v = e.i(719409),
        f = e.i(963320),
        m = e.i(154447),
        y = e.i(694258);

    function g(e) {
        return (0, r.g)("MuiDialog", e)
    }
    var w = (0, l.g)("MuiDialog", ["root", "scrollPaper", "scrollBody", "container", "paper", "paperScrollPaper", "paperScrollBody", "paperWidthFalse", "paperWidthXs", "paperWidthSm", "paperWidthMd", "paperWidthLg", "paperWidthXl", "paperFullWidth", "paperFullScreen"]);
    let A = ["aria-describedby", "aria-labelledby", "BackdropComponent", "BackdropProps", "children", "className", "disableEscapeKeyDown", "fullScreen", "fullWidth", "maxWidth", "onBackdropClick", "onClick", "onClose", "open", "PaperComponent", "PaperProps", "scroll", "TransitionComponent", "transitionDuration", "TransitionProps"],
        b = (0, s.s)(d.M, {
            name: "MuiDialog",
            slot: "Backdrop",
            overrides: (e, t) => t.backdrop
        })({
            zIndex: -1
        }),
        x = (0, s.s)(h.M, {
            name: "MuiDialog",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({
            "@media print": {
                position: "absolute !important"
            }
        }),
        S = (0, s.s)("div", {
            name: "MuiDialog",
            slot: "Container",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [t.container, t["scroll".concat((0, r.a)(i.scroll))]]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, a._)({
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
        R = (0, s.s)(v.M, {
            name: "MuiDialog",
            slot: "Paper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [t.paper, t["scrollPaper".concat((0, r.a)(i.scroll))], t["paperWidth".concat((0, r.a)(String(i.maxWidth)))], i.fullWidth && t.paperFullWidth, i.fullScreen && t.paperFullScreen]
            }
        })(e => {
            let {
                theme: t,
                ownerState: i
            } = e;
            return (0, a._)({
                margin: 32,
                position: "relative",
                overflowY: "auto",
                "@media print": {
                    overflowY: "visible",
                    boxShadow: "none"
                }
            }, "paper" === i.scroll && {
                display: "flex",
                flexDirection: "column",
                maxHeight: "calc(100% - 64px)"
            }, "body" === i.scroll && {
                display: "inline-block",
                verticalAlign: "middle",
                textAlign: "left"
            }, !i.maxWidth && {
                maxWidth: "calc(100% - 64px)"
            }, "xs" === i.maxWidth && {
                maxWidth: "px" === t.breakpoints.unit ? Math.max(t.breakpoints.values.xs, 444) : "max(".concat(t.breakpoints.values.xs).concat(t.breakpoints.unit, ", 444px)"),
                ["&.".concat(w.paperScrollBody)]: {
                    [t.breakpoints.down(Math.max(t.breakpoints.values.xs, 444) + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, i.maxWidth && "xs" !== i.maxWidth && {
                maxWidth: "".concat(t.breakpoints.values[i.maxWidth]).concat(t.breakpoints.unit),
                ["&.".concat(w.paperScrollBody)]: {
                    [t.breakpoints.down(t.breakpoints.values[i.maxWidth] + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, i.fullWidth && {
                width: "calc(100% - 64px)"
            }, i.fullScreen && {
                margin: 0,
                width: "100%",
                maxWidth: "100%",
                height: "100%",
                maxHeight: "none",
                borderRadius: 0,
                ["&.".concat(w.paperScrollBody)]: {
                    margin: 0,
                    maxWidth: "100%"
                }
            })
        }),
        I = i.forwardRef(function(e, t) {
            let n = (0, f.u)({
                    props: e,
                    name: "MuiDialog"
                }),
                o = (0, u.u)(),
                l = {
                    enter: o.transitions.duration.enteringScreen,
                    exit: o.transitions.duration.leavingScreen
                },
                {
                    "aria-describedby": d,
                    "aria-labelledby": h,
                    BackdropComponent: w,
                    BackdropProps: I,
                    children: T,
                    className: P,
                    disableEscapeKeyDown: C = !1,
                    fullScreen: q = !1,
                    fullWidth: k = !1,
                    maxWidth: U = "sm",
                    onBackdropClick: E,
                    onClick: K,
                    onClose: z,
                    open: L,
                    PaperComponent: M = v.M,
                    PaperProps: D = {},
                    scroll: G = "paper",
                    TransitionComponent: O = y.F,
                    transitionDuration: _ = l,
                    TransitionProps: N
                } = n,
                F = (0, r._)(n, A),
                V = (0, a._)({}, n, {
                    disableEscapeKeyDown: C,
                    fullScreen: q,
                    fullWidth: k,
                    maxWidth: U,
                    scroll: G
                }),
                j = (e => {
                    let {
                        classes: t,
                        scroll: i,
                        maxWidth: n,
                        fullWidth: o,
                        fullScreen: a
                    } = e, l = {
                        root: ["root"],
                        container: ["container", "scroll".concat((0, r.a)(i))],
                        paper: ["paper", "paperScroll".concat((0, r.a)(i)), "paperWidth".concat((0, r.a)(String(n))), o && "paperFullWidth", a && "paperFullScreen"]
                    };
                    return (0, s.a)(l, g, t)
                })(V),
                B = i.useRef(),
                W = (0, m.u)(h),
                J = i.useMemo(() => ({
                    titleId: W
                }), [W]);
            return (0, p.jsx)(x, (0, a._)({
                className: (0, s.c)(j.root, P),
                closeAfterTransition: !0,
                components: {
                    Backdrop: b
                },
                componentsProps: {
                    backdrop: (0, a._)({
                        transitionDuration: _,
                        as: w
                    }, I)
                },
                disableEscapeKeyDown: C,
                onClose: z,
                open: L,
                ref: t,
                onClick: e => {
                    K && K(e), B.current && (B.current = null, E && E(e), z && z(e, "backdropClick"))
                },
                ownerState: V
            }, F, {
                children: (0, p.jsx)(O, (0, a._)({
                    appear: !0,
                    in: L,
                    timeout: _,
                    role: "presentation"
                }, N, {
                    children: (0, p.jsx)(S, {
                        className: (0, s.c)(j.container),
                        onMouseDown: e => {
                            B.current = e.target === e.currentTarget
                        },
                        ownerState: V,
                        children: (0, p.jsx)(R, (0, a._)({
                            as: M,
                            elevation: 24,
                            role: "dialog",
                            "aria-describedby": d,
                            "aria-labelledby": W
                        }, D, {
                            className: (0, s.c)(j.paper, D.className),
                            ownerState: V,
                            children: (0, p.jsx)(c.D.Provider, {
                                value: J,
                                children: T
                            })
                        }))
                    })
                }))
            }))
        });
    e.s(["M", 0, I, "d", 0, w], 568750), e.i(149285);
    var T = (0, n.default)({
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
        P = (0, i.forwardRef)(function(e, n) {
            var r = e.classes,
                a = e.children;
            e.fullScreen;
            var s = e.className,
                l = e.maxWidth,
                c = (0, t.a)(e, ["classes", "children", "fullScreen", "className", "maxWidth"]),
                u = T(void 0, {
                    props: {
                        classes: (0, o.default)(r, s)
                    }
                });
            return i.default.createElement(I, (0, t._)({}, c, {
                fullScreen: !1,
                classes: u.classes,
                maxWidth: "XSmall" === l ? "Small" : l,
                ref: n
            }), a)
        });
    e.s(["default", 0, P], 430686)
}, 291037, e => {
    "use strict";
    var t = e.i(430686);
    e.s(["Dialog", () => t.default])
}, 711489, e => {
    "use strict";
    var t = e.i(865800),
        i = e.i(416340),
        n = e.i(614515),
        o = e.i(993807),
        r = e.i(286837);
    e.i(221628);
    var a = (0, n.default)({
            name: "DialogActions"
        })({
            root: {
                justifyContent: "flex-end",
                padding: 20
            }
        }),
        s = (0, i.forwardRef)(function(e, n) {
            var s = e.classes,
                l = e.children,
                c = e.className,
                u = (0, t.a)(e, ["classes", "children", "className"]),
                p = a(void 0, {
                    props: {
                        classes: (0, o.default)(s, c)
                    }
                });
            return i.default.createElement(r.D, (0, t._)({}, u, {
                classes: p.classes,
                ref: n
            }), l)
        });
    e.s(["default", 0, s])
}, 35298, e => {
    "use strict";
    var t = e.i(711489);
    e.s(["DialogActions", () => t.default])
}, 777004, 820932, 12839, 341782, e => {
    "use strict";
    var t = e.i(865800),
        i = e.i(416340),
        n = e.i(614515),
        o = e.i(993807),
        r = e.i(273589),
        a = e.i(962560),
        s = e.i(42569),
        l = e.i(696180),
        c = (0, l.g)("MuiDialogTitle", ["root"]);
    e.s(["d", 0, c, "g", 0, function(e) {
        return (0, r.g)("MuiDialogTitle", e)
    }], 820932);
    var u = e.i(221628),
        p = e.i(963320);

    function d(e) {
        return (0, r.g)("MuiDialogContent", e)
    }
    var h = (0, l.g)("MuiDialogContent", ["root", "dividers"]);
    let v = ["className", "dividers"],
        f = (0, s.s)("div", {
            name: "MuiDialogContent",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [t.root, i.dividers && t.dividers]
            }
        })(e => {
            let {
                theme: t,
                ownerState: i
            } = e;
            return (0, a._)({
                flex: "1 1 auto",
                WebkitOverflowScrolling: "touch",
                overflowY: "auto",
                padding: "20px 24px"
            }, i.dividers ? {
                padding: "16px 24px",
                borderTop: "1px solid ".concat((t.vars || t).palette.divider),
                borderBottom: "1px solid ".concat((t.vars || t).palette.divider)
            } : {
                [".".concat(c.root, " + &")]: {
                    paddingTop: 0
                }
            })
        }),
        m = i.forwardRef(function(e, t) {
            let i = (0, p.u)({
                    props: e,
                    name: "MuiDialogContent"
                }),
                {
                    className: n,
                    dividers: o = !1
                } = i,
                l = (0, r._)(i, v),
                c = (0, a._)({}, i, {
                    dividers: o
                }),
                h = (e => {
                    let {
                        classes: t,
                        dividers: i
                    } = e;
                    return (0, s.a)({
                        root: ["root", i && "dividers"]
                    }, d, t)
                })(c);
            return (0, u.jsx)(f, (0, a._)({
                className: (0, s.c)(h.root, n),
                ownerState: c,
                ref: t
            }, l))
        });
    e.s(["D", 0, m, "d", 0, h], 12839);
    var y = (0, n.default)({
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
        g = (0, i.forwardRef)(function(e, n) {
            var r = e.classes,
                a = e.children,
                s = e.className,
                l = (0, t.a)(e, ["classes", "children", "className"]),
                c = y(void 0, {
                    props: {
                        classes: (0, o.default)(r, s)
                    }
                });
            return i.default.createElement(m, (0, t._)({}, l, {
                classes: c.classes,
                ref: n
            }), a)
        });
    e.s(["default", 0, g], 341782), e.s(["DialogContent", 0, g], 777004)
}, 682671, e => {
    "use strict";
    var t = e.i(865800),
        i = e.i(416340),
        n = e.i(614515),
        o = e.i(993807),
        r = e.i(962560),
        a = e.i(273589),
        s = e.i(42569),
        l = e.i(820932),
        c = e.i(701569),
        u = e.i(221628),
        p = e.i(972455),
        d = e.i(963320);
    let h = ["className", "id"],
        v = (0, s.s)(p.T, {
            name: "MuiDialogTitle",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({
            padding: "16px 24px",
            flex: "0 0 auto"
        }),
        f = i.forwardRef(function(e, t) {
            let n = (0, d.u)({
                    props: e,
                    name: "MuiDialogTitle"
                }),
                {
                    className: o,
                    id: p
                } = n,
                f = (0, a._)(n, h),
                m = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, s.a)({
                        root: ["root"]
                    }, l.g, t)
                })(n),
                {
                    titleId: y = p
                } = i.useContext(c.D);
            return (0, u.jsx)(v, (0, r._)({
                component: "h2",
                className: (0, s.c)(m.root, o),
                ownerState: n,
                ref: t,
                variant: "h6",
                id: null != p ? p : y
            }, f))
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
        y = (0, i.forwardRef)(function(e, n) {
            var r = e.classes,
                a = e.children,
                s = e.className,
                l = (0, t.a)(e, ["classes", "children", "className"]),
                c = m(void 0, {
                    props: {
                        classes: (0, o.default)(r, s)
                    }
                });
            return i.default.createElement(f, (0, t._)({}, l, {
                classes: c.classes,
                ref: n
            }), a)
        });
    e.s(["default", 0, y])
}, 899819, e => {
    "use strict";
    var t = e.i(682671);
    e.s(["DialogTitle", () => t.default])
}, 119636, e => {
    "use strict";
    var t = e.i(865800),
        i = e.i(416340),
        n = e.i(614515),
        o = e.i(993807),
        r = e.i(963343);
    e.i(221628);
    var a = (0, n.default)({
            name: "LinearProgress"
        })(function(e) {
            var t = e.palette.components.divider;
            return {
                colorSecondary: {
                    backgroundColor: t
                },
                buffer: {
                    backgroundColor: "transparent"
                },
                dashedColorSecondary: {
                    backgroundImage: "linear-gradient(to right, ".concat(t, ", ").concat(t, " 50%, transparent 50%, transparent 100%)")
                },
                dashedColorPrimary: {
                    backgroundImage: "linear-gradient(to right, ".concat(e.palette.actionV2.primaryBrand.fill, ", ").concat(e.palette.actionV2.primaryBrand.fill, " 50%, transparent 50%, transparent 100%)")
                },
                colorPrimary: {
                    backgroundColor: e.palette.components.linearProgress.backgroundSecondary
                }
            }
        }),
        s = (0, i.forwardRef)(function(e, n) {
            var s = e.classes,
                l = e.className,
                c = (0, t.a)(e, ["classes", "className"]),
                u = a(void 0, {
                    props: {
                        classes: (0, o.default)(s, l)
                    }
                });
            return i.default.createElement(r.M, (0, t._)({}, c, {
                classes: u.classes,
                ref: n
            }))
        });
    e.s(["LinearProgress", 0, s], 119636)
}, 581577, 703440, e => {
    "use strict";
    let t;
    var i = e.i(416340),
        n = e.i(252842),
        o = e.i(706442),
        r = e.i(169722),
        a = e.i(199834),
        s = e.i(119636),
        l = e.i(988012),
        c = e.i(447055),
        u = e.i(872204),
        p = e.i(291037),
        d = e.i(677753),
        h = function(e, t) {
            return (h = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i])
            })(e, t)
        };

    function v(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        h(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }

    function f(e, t, i, n) {
        return new(i || (i = Promise))(function(o, r) {
            function a(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(a, s)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function m(e, t) {
        var i, n, o, r = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(l) {
                var c = [s, l];
                if (i) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (r = 0)), r;) try {
                    if (i = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                        case 0:
                        case 1:
                            o = c;
                            break;
                        case 4:
                            return r.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = r.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                r.label = c[1];
                                break
                            }
                            if (6 === c[0] && r.label < o[1]) {
                                r.label = o[1], o = c;
                                break
                            }
                            if (o && r.label < o[2]) {
                                r.label = o[2], r.ops.push(c);
                                break
                            }
                            o[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    c = t.call(e, r)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    i = o = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function y(e, t) {
        return null == e ? e : {
            id: e.id,
            type: e.type
        }
    }

    function g(e) {
        var t;
        return null == (t = e) ? t : {
            ids: t.ids
        }
    }

    function w(e) {
        if (void 0 !== e) return null === e ? null : {
            ids: e.ids
        }
    }

    function A(e) {
        var t;
        return null == (t = e) ? t : {
            owner: y(t.owner),
            resources: (0, d.mapValues)(t.resources, g)
        }
    }

    function b(e) {
        if (void 0 !== e) return null === e ? null : {
            owner: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    id: e.id,
                    type: e.type
                }
            }(e.owner),
            resources: (0, d.mapValues)(e.resources, w)
        }
    }

    function x(e) {
        return e
    }

    function S(e) {
        return e
    }

    function R(e) {
        return e
    }

    function I(e) {
        return e
    }

    function T(e) {
        var t;
        return null == (t = e) ? t : {
            scopeType: t.scopeType,
            operations: t.operations
        }
    }

    function P(e) {
        if (void 0 !== e) return null === e ? null : {
            scopeType: e.scopeType,
            operations: e.operations
        }
    }

    function C(e, t) {
        return null == e ? e : {
            lastApprovedVersionNumber: (0, d.exists)(e, "lastApprovedVersionNumber") ? e.lastApprovedVersionNumber : void 0,
            versionNumber: e.versionNumber,
            isInReview: e.isInReview
        }
    }

    function q(e) {
        var t;
        return null == (t = e) ? t : {
            redirectUris: t.redirectUris,
            allowedScopes: t.allowedScopes.map(T),
            versionInfo: C(t.versionInfo),
            isBanned: t.isBanned,
            createdUtc: new Date(t.createdUtc),
            updatedUtc: new Date(t.updatedUtc),
            applicationId: t.applicationId,
            owner: y(t.owner),
            name: t.name,
            summary: t.summary,
            tosUri: (0, d.exists)(t, "tosUri") ? t.tosUri : void 0,
            privacyUri: (0, d.exists)(t, "privacyUri") ? t.privacyUri : void 0,
            entryPointUri: (0, d.exists)(t, "entryPointUri") ? t.entryPointUri : void 0,
            imageAssetId: (0, d.exists)(t, "imageAssetId") ? t.imageAssetId : void 0,
            isFirstParty: (0, d.exists)(t, "isFirstParty") ? t.isFirstParty : void 0
        }
    }

    function k(e, t) {
        return null == e ? e : {
            applications: e.applications.map(q),
            nextPageCursor: (0, d.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
        }
    }

    function U(e) {
        var t, i;
        return null == (t = e) ? t : {
            authorizationId: t.authorizationId,
            application: null == (i = t.application) ? i : {
                applicationId: i.applicationId,
                owner: y(i.owner),
                name: i.name,
                summary: i.summary,
                tosUri: (0, d.exists)(i, "tosUri") ? i.tosUri : void 0,
                privacyUri: (0, d.exists)(i, "privacyUri") ? i.privacyUri : void 0,
                entryPointUri: (0, d.exists)(i, "entryPointUri") ? i.entryPointUri : void 0,
                imageAssetId: (0, d.exists)(i, "imageAssetId") ? i.imageAssetId : void 0,
                isFirstParty: (0, d.exists)(i, "isFirstParty") ? i.isFirstParty : void 0
            },
            scopes: t.scopes.map(T),
            resourceInfo: t.resourceInfo.map(A),
            createdUtc: new Date(t.createdUtc),
            refreshedUtc: new Date(t.refreshedUtc)
        }
    }

    function E(e, t) {
        return null == e ? e : {
            applicationSecret: e.applicationSecret,
            redirectUris: e.redirectUris,
            allowedScopes: e.allowedScopes.map(T),
            versionInfo: C(e.versionInfo),
            isBanned: e.isBanned,
            createdUtc: new Date(e.createdUtc),
            updatedUtc: new Date(e.updatedUtc),
            applicationId: e.applicationId,
            owner: y(e.owner),
            name: e.name,
            summary: e.summary,
            tosUri: (0, d.exists)(e, "tosUri") ? e.tosUri : void 0,
            privacyUri: (0, d.exists)(e, "privacyUri") ? e.privacyUri : void 0,
            entryPointUri: (0, d.exists)(e, "entryPointUri") ? e.entryPointUri : void 0,
            imageAssetId: (0, d.exists)(e, "imageAssetId") ? e.imageAssetId : void 0,
            isFirstParty: (0, d.exists)(e, "isFirstParty") ? e.isFirstParty : void 0
        }
    }

    function K(e, t) {
        return null == e ? e : {
            resourceInfos: e.resource_infos.map(A)
        }
    }

    function z(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function L(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function M(e) {
        var t;
        return null == (t = e) ? t : {
            scopeType: t.scopeType,
            operation: t.operation,
            targetType: (0, d.exists)(t, "targetType") ? t.targetType : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            riskLevel: (0, d.exists)(t, "riskLevel") ? t.riskLevel : void 0,
            groupAllowed: (0, d.exists)(t, "groupAllowed") ? t.groupAllowed : void 0,
            firstPartyOAuthOnly: (0, d.exists)(t, "firstPartyOAuthOnly") ? t.firstPartyOAuthOnly : void 0,
            categories: (0, d.exists)(t, "categories") ? t.categories : void 0
        }
    }

    function D(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function G(e) {
        return e
    }

    function O(e) {
        return e
    }

    function _(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            descriptionTranslationKey: (0, d.exists)(t, "descriptionTranslationKey") ? t.descriptionTranslationKey : void 0,
            riskLevel: (0, d.exists)(t, "riskLevel") ? t.riskLevel : void 0
        }
    }

    function N(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            environments: (0, d.exists)(t, "environments") ? null === t.environments ? null : t.environments.map(O) : void 0,
            targetType: (0, d.exists)(t, "targetType") ? t.targetType : void 0,
            operations: t.operations,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.exists)(t, "product") ? t.product : void 0,
            operationOverrides: t.operationOverrides.map(_),
            authenticationSystems: t.authenticationSystems.map(G),
            groupAllowedOperations: (0, d.exists)(t, "groupAllowedOperations") ? t.groupAllowedOperations : void 0
        }
    }

    function F(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            type: t.type,
            constraints: t.constraints,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function V(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: t.requiredParts,
            optionalParts: t.optionalParts,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function j(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.exists)(t, "product") ? t.product : void 0
        }
    }

    function B(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            type: (0, d.exists)(t, "type") ? t.type : void 0,
            constraints: (0, d.exists)(t, "constraints") ? t.constraints : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function W(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: (0, d.exists)(t, "requiredParts") ? t.requiredParts : void 0,
            optionalParts: (0, d.exists)(t, "optionalParts") ? t.optionalParts : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function J(e) {
        var t;
        return null == (t = e) ? t : {
            id: t.id,
            agreementType: t.agreementType,
            clientType: t.clientType,
            regulationType: t.regulationType,
            displayUrl: t.displayUrl
        }
    }

    function H(e) {
        if (void 0 !== e) return null === e ? null : {
            name: e.name,
            summary: e.summary,
            redirectUris: e.redirectUris,
            allowedScopes: void 0 === e.allowedScopes ? void 0 : null === e.allowedScopes ? null : e.allowedScopes.map(P),
            tosUri: e.tosUri,
            privacyUri: e.privacyUri,
            entryPointUri: e.entryPointUri
        }
    }

    function X(e) {
        var t;
        return null == (t = e) ? t : {
            alg: t.alg,
            enc: (0, d.exists)(t, "enc") ? t.enc : void 0,
            kty: t.kty,
            kid: t.kid,
            use: t.use,
            n: (0, d.exists)(t, "n") ? t.n : void 0,
            e: (0, d.exists)(t, "e") ? t.e : void 0,
            d: (0, d.exists)(t, "d") ? t.d : void 0,
            p: (0, d.exists)(t, "p") ? t.p : void 0,
            q: (0, d.exists)(t, "q") ? t.q : void 0,
            dp: (0, d.exists)(t, "dp") ? t.dp : void 0,
            dq: (0, d.exists)(t, "dq") ? t.dq : void 0,
            qi: (0, d.exists)(t, "qi") ? t.qi : void 0,
            crv: (0, d.exists)(t, "crv") ? t.crv : void 0,
            x: (0, d.exists)(t, "x") ? t.x : void 0,
            y: (0, d.exists)(t, "y") ? t.y : void 0,
            k: (0, d.exists)(t, "k") ? t.k : void 0
        }
    }

    function Y(e, t) {
        return null == e ? e : {
            keys: e.keys.map(X)
        }
    }
    var Q = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.applicationCreateApplicationForGroupRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationCreateApplicationForGroup.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.RequiredError("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForGroup.");
                                return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "POST",
                                    headers: n,
                                    query: i,
                                    body: H(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForGroup = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationCreateApplicationForGroupRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForUserRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationCreateApplicationForUser.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.RequiredError("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForUser.");
                                return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "POST",
                                    headers: n,
                                    query: i,
                                    body: H(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationCreateApplicationForUser = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationCreateApplicationForUserRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.applicationDeleteApplicationRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationDeleteApplication.");
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationDeleteApplication = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationDeleteApplicationRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationGetApplication.");
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return q(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationGetApplication = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationGetApplicationRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationManagementMetadataRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/metadata",
                                    schemaPath: "/v1/applications/metadata",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        isCreateUserApplicationsAllowed: e.isCreateUserApplicationsAllowed,
                                        isViewUserApplicationsAllowed: e.isViewUserApplicationsAllowed,
                                        isUpdateUserApplicationsAllowed: e.isUpdateUserApplicationsAllowed,
                                        isDeleteUserApplicationsAllowed: e.isDeleteUserApplicationsAllowed,
                                        actions: e.actions.map(x),
                                        minNameLength: e.minNameLength,
                                        maxNameLength: e.maxNameLength,
                                        maxSummaryLength: e.maxSummaryLength,
                                        maxRedirectUriCount: e.maxRedirectUriCount,
                                        maxRedirectUriLength: e.maxRedirectUriLength,
                                        maxActiveApplications: e.maxActiveApplications
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationGetApplicationManagementMetadata = function() {
                return f(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationGetApplicationManagementMetadataRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForGroupRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationListApplicationsForGroup.");
                                return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.cursor && (i.cursor = e.cursor), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return k(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForGroup = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationListApplicationsForGroupRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForUserRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationListApplicationsForUser.");
                                return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.cursor && (i.cursor = e.cursor), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return k(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationListApplicationsForUser = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationListApplicationsForUserRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.applicationPrivatizeApplicationRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationPrivatizeApplication.");
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/privatize".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/privatize",
                                    method: "PATCH",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationPrivatizeApplication = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationPrivatizeApplicationRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationPublishApplicationRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationPublishApplication.");
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/publish".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/publish",
                                    method: "PATCH",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationPublishApplication = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationPublishApplicationRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationRegenerateApplicationSecretRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationRegenerateApplicationSecret.");
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}/secret".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/secret",
                                    method: "POST",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        applicationSecret: e.applicationSecret
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationRegenerateApplicationSecret = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationRegenerateApplicationSecretRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.applicationUpdateApplicationRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUpdateApplication.");
                                if (null === e.applicationUpdateApplicationRequest || void 0 === e.applicationUpdateApplicationRequest) throw new d.RequiredError("applicationUpdateApplicationRequest", "Required parameter requestParameters.applicationUpdateApplicationRequest was null or undefined when calling applicationUpdateApplication.");
                                return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/{applicationId}".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}",
                                    method: "PATCH",
                                    headers: n,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            summary: e.summary,
                                            redirectUris: e.redirectUris,
                                            allowedScopes: void 0 === e.allowedScopes ? void 0 : null === e.allowedScopes ? null : e.allowedScopes.map(P),
                                            tosUri: e.tosUri,
                                            privacyUri: e.privacyUri,
                                            entryPointUri: e.entryPointUri
                                        }
                                    }(e.applicationUpdateApplicationRequest)
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return q(e)
                                })]
                        }
                    })
                })
            }, t.prototype.applicationUpdateApplication = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationUpdateApplicationRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.applicationUploadApplicationImageRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o, r;
                    return m(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUploadApplicationImage.");
                                if (null === e.imageFile || void 0 === e.imageFile) throw new d.RequiredError("imageFile", "Required parameter requestParameters.imageFile was null or undefined when calling applicationUploadApplicationImage.");
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), o = (0, d.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.imageFile && o.append("imageFile", e.imageFile), [4, this.request({
                                    path: "/v1/applications/{applicationId}/image".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/image",
                                    method: "POST",
                                    headers: n,
                                    query: i,
                                    body: o
                                }, t)];
                            case 1:
                                return r = a.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        imageAssetId: (0, d.exists)(e, "imageAssetId") ? e.imageAssetId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.applicationUploadApplicationImage = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationUploadApplicationImageRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationNameRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.name || void 0 === e.name) throw new d.RequiredError("name", "Required parameter requestParameters.name was null or undefined when calling applicationValidateApplicationName.");
                                return i = {}, void 0 !== e.name && (i.name = e.name), void 0 !== e.applicationId && (i.applicationId = e.applicationId), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/names/validate",
                                    schemaPath: "/v1/applications/names/validate",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationName = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationValidateApplicationNameRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationSummaryRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.summary || void 0 === e.summary) throw new d.RequiredError("summary", "Required parameter requestParameters.summary was null or undefined when calling applicationValidateApplicationSummary.");
                                return i = {}, void 0 !== e.summary && (i.summary = e.summary), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/summary/validate",
                                    schemaPath: "/v1/applications/summary/validate",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.applicationValidateApplicationSummary = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.applicationValidateApplicationSummaryRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t
        }(d.BaseAPI),
        $ = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.authorizationDeleteAuthorizationRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.authorizationId || void 0 === e.authorizationId) throw new d.RequiredError("authorizationId", "Required parameter requestParameters.authorizationId was null or undefined when calling authorizationDeleteAuthorization.");
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/{authorizationId}".replace("{".concat("authorizationId", "}"), encodeURIComponent(String(e.authorizationId))),
                                    schemaPath: "/v1/authorizations/{authorizationId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.authorizationDeleteAuthorization = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.authorizationDeleteAuthorizationRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.authorizationId || void 0 === e.authorizationId) throw new d.RequiredError("authorizationId", "Required parameter requestParameters.authorizationId was null or undefined when calling authorizationGetAuthorization.");
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/{authorizationId}".replace("{".concat("authorizationId", "}"), encodeURIComponent(String(e.authorizationId))),
                                    schemaPath: "/v1/authorizations/{authorizationId}",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorization = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.authorizationGetAuthorizationRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationResourcesRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling authorizationGetAuthorizationResources.");
                                if (null === e.partialScopes || void 0 === e.partialScopes) throw new d.RequiredError("partialScopes", "Required parameter requestParameters.partialScopes was null or undefined when calling authorizationGetAuthorizationResources.");
                                return i = {}, void 0 !== e.applicationId && (i.applicationId = e.applicationId), void 0 !== e.partialScopes && (i.partialScopes = e.partialScopes), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/resources",
                                    schemaPath: "/v1/authorizations/resources",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return K(e)
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationGetAuthorizationResources = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.authorizationGetAuthorizationResourcesRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.authorizationListAuthorizationsRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.cursor && (i.cursor = e.cursor), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        authorizations: e.authorizations.map(U),
                                        nextPageCursor: (0, d.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.authorizationListAuthorizations = function() {
                return f(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.authorizationListAuthorizationsRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI),
        Z = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            v(t, e), t.prototype.certificateGetAccessTokenCertificatesRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/access-tokens",
                                    schemaPath: "/v1/certificates/access-tokens",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetAccessTokenCertificates = function() {
                return f(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.certificateGetAccessTokenCertificatesRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.certificateGetDefaultCertificatesRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certs",
                                    schemaPath: "/v1/certs",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetDefaultCertificates = function() {
                return f(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.certificateGetDefaultCertificatesRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.certificateGetIdentityTokenCertificatesRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/identity-tokens",
                                    schemaPath: "/v1/certificates/identity-tokens",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return Y(e)
                                })]
                        }
                    })
                })
            }, t.prototype.certificateGetIdentityTokenCertificates = function() {
                return f(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.certificateGetIdentityTokenCertificatesRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }
        }(d.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.discoveryGetDiscoveryConfigurationRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/.well-known/openid-configuration",
                                    schemaPath: "/.well-known/openid-configuration",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        issuer: e.issuer,
                                        authorizationEndpoint: e.authorization_endpoint,
                                        tokenEndpoint: e.token_endpoint,
                                        introspectionEndpoint: e.introspection_endpoint,
                                        revocationEndpoint: e.revocation_endpoint,
                                        resourcesEndpoint: e.resources_endpoint,
                                        userinfoEndpoint: e.userinfo_endpoint,
                                        jwksUri: e.jwks_uri,
                                        registrationEndpoint: e.registration_endpoint,
                                        serviceDocumentation: e.service_documentation,
                                        scopesSupported: e.scopes_supported,
                                        responseTypesSupported: e.response_types_supported,
                                        subjectTypesSupported: e.subject_types_supported,
                                        idTokenSigningAlgValuesSupported: e.id_token_signing_alg_values_supported,
                                        claimsSupported: e.claims_supported,
                                        tokenEndpointAuthMethodsSupported: e.token_endpoint_auth_methods_supported
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.discoveryGetDiscoveryConfiguration = function() {
                return f(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.discoveryGetDiscoveryConfigurationRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI)),
        ee = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            v(t, e), t.prototype.externalVerificationSetExternalVerificationTypesRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.externalVerificationSetExternalVerificationTypesRequest || void 0 === e.externalVerificationSetExternalVerificationTypesRequest) throw new d.RequiredError("externalVerificationSetExternalVerificationTypesRequest", "Required parameter requestParameters.externalVerificationSetExternalVerificationTypesRequest was null or undefined when calling externalVerificationSetExternalVerificationTypes.");
                                return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/verification-types",
                                    schemaPath: "/v1/verification-types",
                                    method: "POST",
                                    headers: n,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            token: e.token
                                        }
                                    }(e.externalVerificationSetExternalVerificationTypesRequest)
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.externalVerificationSetExternalVerificationTypes = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.externalVerificationSetExternalVerificationTypesRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }
        }(d.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.permissionRequestCreateAuthorizationGrantRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.permissionRequestCreateAuthorizationGrantRequest || void 0 === e.permissionRequestCreateAuthorizationGrantRequest) throw new d.RequiredError("permissionRequestCreateAuthorizationGrantRequest", "Required parameter requestParameters.permissionRequestCreateAuthorizationGrantRequest was null or undefined when calling permissionRequestCreateAuthorizationGrant.");
                                return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "POST",
                                    headers: n,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            clientId: e.clientId,
                                            responseTypes: e.responseTypes.map(I),
                                            redirectUri: e.redirectUri,
                                            scopes: e.scopes.map(P),
                                            state: e.state,
                                            nonce: e.nonce,
                                            codeChallenge: e.codeChallenge,
                                            codeChallengeMethod: e.codeChallengeMethod,
                                            resourceInfos: void 0 === e.resourceInfos ? void 0 : null === e.resourceInfos ? null : e.resourceInfos.map(b)
                                        }
                                    }(e.permissionRequestCreateAuthorizationGrantRequest)
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        location: e.location
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateAuthorizationGrant = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.permissionRequestCreateAuthorizationGrantRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateMagicAuthorizationGrantRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.permissionRequestCreateMagicAuthorizationGrantRequest || void 0 === e.permissionRequestCreateMagicAuthorizationGrantRequest) throw new d.RequiredError("permissionRequestCreateMagicAuthorizationGrantRequest", "Required parameter requestParameters.permissionRequestCreateMagicAuthorizationGrantRequest was null or undefined when calling permissionRequestCreateMagicAuthorizationGrant.");
                                return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations/magic",
                                    schemaPath: "/v1/authorizations/magic",
                                    method: "POST",
                                    headers: n,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            clientId: e.clientId,
                                            scopes: e.scopes.map(P),
                                            nonce: e.nonce
                                        }
                                    }(e.permissionRequestCreateMagicAuthorizationGrantRequest)
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        code: e.code
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestCreateMagicAuthorizationGrant = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.permissionRequestCreateMagicAuthorizationGrantRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.permissionRequestGetAuthorizationEndpointRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, void 0 !== e.clientId && (i.client_id = e.clientId), void 0 !== e.responseType && (i.response_type = e.responseType), void 0 !== e.redirectUri && (i.redirect_uri = e.redirectUri), void 0 !== e.scope && (i.scope = e.scope), void 0 !== e.state && (i.state = e.state), void 0 !== e.nonce && (i.nonce = e.nonce), void 0 !== e.prompt && (i.prompt = e.prompt), void 0 !== e.codeChallenge && (i.code_challenge = e.codeChallenge), void 0 !== e.codeChallengeMethod && (i.code_challenge_method = e.codeChallengeMethod), void 0 !== e.rlt && (i.rlt = e.rlt), void 0 !== e.studioTraceId && (i.studio_trace_id = e.studioTraceId), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorize",
                                    schemaPath: "/v1/authorize",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.VoidApiResponse(o)]
                        }
                    })
                })
            }, t.prototype.permissionRequestGetAuthorizationEndpoint = function() {
                return f(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.permissionRequestGetAuthorizationEndpointRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.permissionRequestValidatePermissionRequestRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.clientId || void 0 === e.clientId) throw new d.RequiredError("clientId", "Required parameter requestParameters.clientId was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.redirectUri || void 0 === e.redirectUri) throw new d.RequiredError("redirectUri", "Required parameter requestParameters.redirectUri was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.scopes || void 0 === e.scopes) throw new d.RequiredError("scopes", "Required parameter requestParameters.scopes was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                if (null === e.responseTypes || void 0 === e.responseTypes) throw new d.RequiredError("responseTypes", "Required parameter requestParameters.responseTypes was null or undefined when calling permissionRequestValidatePermissionRequest.");
                                return i = {}, void 0 !== e.clientId && (i.clientId = e.clientId), void 0 !== e.redirectUri && (i.redirectUri = e.redirectUri), void 0 !== e.scopes && (i.scopes = e.scopes), void 0 !== e.responseTypes && (i.responseTypes = e.responseTypes), void 0 !== e.prompts && (i.prompts = e.prompts), void 0 !== e.rlt && (i.rlt = e.rlt), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/permission-request",
                                    schemaPath: "/v1/permission-request",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(T),
                                        responseTypes: e.responseTypes.map(R),
                                        promptTypes: e.promptTypes.map(S),
                                        userAgreements: e.userAgreements.map(J),
                                        applicationId: e.applicationId,
                                        owner: y(e.owner),
                                        name: e.name,
                                        summary: e.summary,
                                        tosUri: (0, d.exists)(e, "tosUri") ? e.tosUri : void 0,
                                        privacyUri: (0, d.exists)(e, "privacyUri") ? e.privacyUri : void 0,
                                        entryPointUri: (0, d.exists)(e, "entryPointUri") ? e.entryPointUri : void 0,
                                        imageAssetId: (0, d.exists)(e, "imageAssetId") ? e.imageAssetId : void 0,
                                        isFirstParty: (0, d.exists)(e, "isFirstParty") ? e.isFirstParty : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.permissionRequestValidatePermissionRequest = function(e, t) {
                return f(this, void 0, void 0, function() {
                    return m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.permissionRequestValidatePermissionRequestRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI)),
        et = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.scopeGetScopeConfigurationRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, void 0 !== e.returnBetaScopes && (i.returnBetaScopes = e.returnBetaScopes), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scope-configuration",
                                    schemaPath: "/v1/scope-configuration",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopeTypes: e.scopeTypes.map(N),
                                        targetTypes: e.targetTypes.map(V),
                                        targetParts: e.targetParts.map(F),
                                        products: e.products.map(D),
                                        oidcScopes: e.oidcScopes
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.scopeGetScopeConfiguration = function() {
                return f(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.scopeGetScopeConfigurationRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.scopeGetScopesRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, o;
                    return m(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scopes",
                                    schemaPath: "/v1/scopes",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(M),
                                        scopeTypes: e.scopeTypes.map(j),
                                        targetTypes: e.targetTypes.map(W),
                                        targetParts: e.targetParts.map(B),
                                        products: e.products.map(L),
                                        operations: e.operations.map(z),
                                        oidcScopes: e.oidcScopes
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.scopeGetScopes = function() {
                return f(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), m(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.scopeGetScopesRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(d.BaseAPI);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        v(t, e), t.prototype.tokenGetTokenAuthorizationResourcesRaw = function(e, t) {
            return f(this, void 0, void 0, function() {
                var i, n, o, r;
                return m(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenGetTokenAuthorizationResources.");
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/resources",
                                schemaPath: "/v1/token/resources",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: o
                            }, t)];
                        case 1:
                            return r = a.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                return K(e)
                            })]
                    }
                })
            })
        }, t.prototype.tokenGetTokenAuthorizationResources = function(e, t) {
            return f(this, void 0, void 0, function() {
                return m(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.tokenGetTokenAuthorizationResourcesRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, t.prototype.tokenIntrospectTokenRaw = function(e, t) {
            return f(this, void 0, void 0, function() {
                var i, n, o, r;
                return m(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenIntrospectToken.");
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/introspect",
                                schemaPath: "/v1/token/introspect",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: o
                            }, t)];
                        case 1:
                            return r = a.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    active: e.active,
                                    jti: (0, d.exists)(e, "jti") ? e.jti : void 0,
                                    iss: (0, d.exists)(e, "iss") ? e.iss : void 0,
                                    tokenType: (0, d.exists)(e, "token_type") ? e.token_type : void 0,
                                    clientId: (0, d.exists)(e, "client_id") ? e.client_id : void 0,
                                    aud: (0, d.exists)(e, "aud") ? e.aud : void 0,
                                    sub: (0, d.exists)(e, "sub") ? e.sub : void 0,
                                    scope: (0, d.exists)(e, "scope") ? e.scope : void 0,
                                    exp: (0, d.exists)(e, "exp") ? e.exp : void 0,
                                    iat: (0, d.exists)(e, "iat") ? e.iat : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.tokenIntrospectToken = function(e, t) {
            return f(this, void 0, void 0, function() {
                return m(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.tokenIntrospectTokenRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, t.prototype.tokenRevokeTokenRaw = function(e, t) {
            return f(this, void 0, void 0, function() {
                var i, n, o, r;
                return m(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenRevokeToken.");
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.token && o.append("token", e.token), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/revoke",
                                schemaPath: "/v1/token/revoke",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: o
                            }, t)];
                        case 1:
                            return r = a.sent(), [2, new d.VoidApiResponse(r)]
                    }
                })
            })
        }, t.prototype.tokenRevokeToken = function(e, t) {
            return f(this, void 0, void 0, function() {
                return m(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.tokenRevokeTokenRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }, t.prototype.tokenUseAuthorizationGrantRaw = function(e, t) {
            return f(this, void 0, void 0, function() {
                var i, n, o, r;
                return m(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.grantType || void 0 === e.grantType) throw new d.RequiredError("grantType", "Required parameter requestParameters.grantType was null or undefined when calling tokenUseAuthorizationGrant.");
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), o = new URLSearchParams, void 0 !== e.grantType && o.append("grant_type", e.grantType), void 0 !== e.code && o.append("code", e.code), void 0 !== e.codeVerifier && o.append("code_verifier", e.codeVerifier), void 0 !== e.refreshToken && o.append("refresh_token", e.refreshToken), void 0 !== e.clientId && o.append("client_id", e.clientId), void 0 !== e.clientSecret && o.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token",
                                schemaPath: "/v1/token",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: o
                            }, t)];
                        case 1:
                            return r = a.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    accessToken: e.access_token,
                                    refreshToken: (0, d.exists)(e, "refresh_token") ? e.refresh_token : void 0,
                                    tokenType: e.token_type,
                                    expiresIn: e.expires_in,
                                    idToken: (0, d.exists)(e, "id_token") ? e.id_token : void 0,
                                    scope: (0, d.exists)(e, "scope") ? e.scope : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.tokenUseAuthorizationGrant = function(e, t) {
            return f(this, void 0, void 0, function() {
                return m(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.tokenUseAuthorizationGrantRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }
    })(d.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        v(t, e), t.prototype.userInfoGetUserInfoRaw = function(e, t) {
            return f(this, void 0, void 0, function() {
                var i, n, o;
                return m(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/userinfo",
                                schemaPath: "/v1/userinfo",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return o = r.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    sub: e.sub,
                                    name: (0, d.exists)(e, "name") ? e.name : void 0,
                                    nickname: (0, d.exists)(e, "nickname") ? e.nickname : void 0,
                                    preferredUsername: (0, d.exists)(e, "preferred_username") ? e.preferred_username : void 0,
                                    createdAt: (0, d.exists)(e, "created_at") ? e.created_at : void 0,
                                    profile: (0, d.exists)(e, "profile") ? e.profile : void 0,
                                    picture: (0, d.exists)(e, "picture") ? e.picture : void 0,
                                    email: (0, d.exists)(e, "email") ? e.email : void 0,
                                    emailVerified: (0, d.exists)(e, "email_verified") ? e.email_verified : void 0,
                                    verified: (0, d.exists)(e, "verified") ? e.verified : void 0,
                                    ageChecked: (0, d.exists)(e, "age_checked") ? e.age_checked : void 0,
                                    ageBracket: (0, d.exists)(e, "age_bracket") ? e.age_bracket : void 0,
                                    premium: (0, d.exists)(e, "premium") ? e.premium : void 0,
                                    roles: (0, d.exists)(e, "roles") ? e.roles : void 0,
                                    internalUser: (0, d.exists)(e, "internal_user") ? e.internal_user : void 0,
                                    attributes: (0, d.exists)(e, "attributes") ? e.attributes : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.userInfoGetUserInfo = function() {
            return f(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), m(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.userInfoGetUserInfoRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }
    }(d.BaseAPI), e.s(["ApplicationApi", 0, Q, "ApplicationAuthorizationsApiModelsEnumErrorCode", 0, {
        InternalError: "InternalError",
        NotAuthenticated: "NotAuthenticated",
        MissingArgument: "MissingArgument",
        DuplicateValuesArgument: "DuplicateValuesArgument",
        InvalidArgument: "InvalidArgument",
        InvalidRequest: "InvalidRequest",
        ArgumentExceedsLimit: "ArgumentExceedsLimit",
        AuthorizationUnauthorizedAccess: "AuthorizationUnauthorizedAccess",
        AuthorizationNotFound: "AuthorizationNotFound",
        ApplicationUnauthorizedAccess: "ApplicationUnauthorizedAccess",
        ApplicationNotFound: "ApplicationNotFound",
        TargetUnauthorizedAccess: "TargetUnauthorizedAccess",
        TargetNotFound: "TargetNotFound",
        ApplicationNameTaken: "ApplicationNameTaken",
        TextInappropriate: "TextInappropriate",
        InvalidScope: "InvalidScope",
        MalformedRedirectUri: "MalformedRedirectUri",
        IllegalSchemeRedirectUri: "IllegalSchemeRedirectUri",
        RedirectUriMismatch: "RedirectUriMismatch",
        ScopeMismatch: "ScopeMismatch",
        AccessDenied: "AccessDenied",
        SettingsChangeRequired: "SettingsChangeRequired",
        LuobuCreatorMobileBindingMissing: "LuobuCreatorMobileBindingMissing",
        AgeCheckRequired: "AgeCheckRequired",
        EmailVerificationRequired: "EmailVerificationRequired",
        InvalidPromptValue: "InvalidPromptValue",
        InvalidResponseTypeValue: "InvalidResponseTypeValue",
        IllegalPrompt: "IllegalPrompt",
        InteractionRequired: "InteractionRequired",
        LoginRequired: "LoginRequired",
        AccountSelectionRequired: "AccountSelectionRequired",
        ConsentRequired: "ConsentRequired",
        GroupNotFound: "GroupNotFound",
        Conflict: "Conflict",
        UnauthorizedAccess: "UnauthorizedAccess",
        ActiveApplicationLimitExceeded: "ActiveApplicationLimitExceeded",
        AuthorizationLimitExceeded: "AuthorizationLimitExceeded",
        InvalidImageFile: "InvalidImageFile",
        ApplicationStatusConflict: "ApplicationStatusConflict",
        InvalidOrigin: "InvalidOrigin",
        InvalidVerificationToken: "InvalidVerificationToken",
        PublishLimitExceeded: "PublishLimitExceeded",
        ApplicationModerated: "ApplicationModerated"
    }, "AuthorizationApi", 0, $, "DiscoveryApi", 0, Z, "PermissionRequestApi", 0, ee, "RobloxOpenCloudScopeManagementModelsAuthenticationSystem", 0, {
        CloudAuthentication: "CloudAuthentication",
        OAuth2: "OAuth2",
        ExperienceAuth: "ExperienceAuth"
    }, "ScopeApi", 0, et], 703440);
    let ei = (0, i.createContext)(null);
    ei.displayName = "StudioResources";
    let en = (0, o.makeStyles)()(() => ({
        closeIcon: {
            position: "absolute",
            right: 8,
            top: 8
        },
        studioIcon: {
            width: 80
        },
        dialogText: {
            marginTop: 20,
            marginBottom: 20,
            textAlign: "center"
        }
    }));
    var eo, er = e => {
            let {
                logoSrc: t,
                translations: n
            } = e, {
                classes: {
                    studioIcon: o,
                    dialogText: l
                }
            } = en();
            return i.default.createElement(i.default.Fragment, null, i.default.createElement(r.Grid, {
                container: !0,
                "data-testid": "studio-dialog-loading",
                direction: "column",
                alignItems: "center"
            }, i.default.createElement("img", {
                width: 64,
                className: o,
                src: t,
                alt: "studio logo"
            }), i.default.createElement(a.Typography, {
                classes: {
                    root: l
                },
                variant: "body1",
                color: "secondary"
            }, n["Message.CheckingStudio"])), i.default.createElement(s.LinearProgress, {
                title: "progress bar"
            }))
        },
        ea = e => {
            let {
                logoSrc: t,
                translations: n,
                onClose: o
            } = e, {
                classes: {
                    closeIcon: s,
                    studioIcon: u,
                    dialogText: p
                }
            } = en();
            return i.default.createElement(r.Grid, {
                container: !0,
                "data-testid": "studio-dialog-error",
                direction: "column",
                alignItems: "center"
            }, i.default.createElement(l.IconButton, {
                className: s,
                color: "secondary",
                "aria-label": "close",
                onClick: o,
                size: "large"
            }, i.default.createElement(c.CloseIcon, null)), i.default.createElement("img", {
                width: 64,
                className: u,
                src: t,
                alt: "studio logo"
            }), i.default.createElement(a.Typography, {
                classes: {
                    root: p
                },
                variant: "body1",
                color: "secondary"
            }, n["Message.OpenStudioError"]))
        },
        es = e => {
            let {
                downloadUrl: t,
                logoSrc: n,
                translations: o,
                onClose: s,
                onDownload: p
            } = e, {
                classes: {
                    closeIcon: d,
                    studioIcon: h,
                    dialogText: v
                }
            } = en();
            return i.default.createElement(r.Grid, {
                container: !0,
                "data-testid": "studio-dialog-download",
                direction: "column",
                alignItems: "center"
            }, i.default.createElement(l.IconButton, {
                className: d,
                color: "secondary",
                "aria-label": "close",
                onClick: s,
                size: "large"
            }, i.default.createElement(c.CloseIcon, null)), i.default.createElement("img", {
                width: 64,
                className: h,
                src: n,
                alt: "studio logo"
            }), i.default.createElement(a.Typography, {
                classes: {
                    root: v
                },
                variant: "body1",
                color: "secondary"
            }, o["Message.StartYourCreation"]), i.default.createElement(u.Button, {
                "data-testid": "cancel-studio-dialog-button",
                variant: "contained",
                onClick: () => {
                    p(), window.open(t, "_blank")
                },
                "aria-label": o["Action.DownloadStudio"]
            }, o["Action.DownloadStudio"]))
        };
    let el = "sitetest1",
        ec = "sitetest2",
        eu = "sitetest3",
        ep = "production",
        ed = "luobu";
    var eh = ((eo = {}).Default = "Default", eo.ReturnFromLogin = "ReturnFromLogin", eo.EditPlace = "EditPlace", eo.ViewAsset = "ViewAsset", eo);
    let ev = async (e, t, i) => {
        let n = "".concat(e, "/product-experimentation-platform/v1/projects/1/layers/").concat(t, "/values?parameters=").concat(i);
        return (await fetch(n, {
            headers: {
                "Content-Type": "application/json"
            },
            credentials: "include"
        })).json()
    }, ef = async e => {
        var t, i, o, r, a;
        let s = (0, n.getCurrentPlatform)();
        if (s === n.Platform.macOS) {
            let n = await ev(e, "CreatorHubStudioInMac", "enablePersonalizedInstallerInMac,enablePersonalizedStudioLaunchInMac");
            return {
                enablePersonalizedInstaller: !1,
                enableDummyCodeInInstaller: !1,
                enablePersonalizedInstallerInMac: null != (t = n.enablePersonalizedInstallerInMac) && t,
                enablePersonalizedStudioLaunch: !1,
                enablePersonalizedStudioLaunchInMac: null != (i = n.enablePersonalizedStudioLaunchInMac) && i
            }
        }
        if (s === n.Platform.Windows) {
            let t = await ev(e, "CreatorHubStudio", "enableDummyCodeInInstaller,enablePersonalizedInstaller,enablePersonalizedStudioLaunch");
            return {
                enablePersonalizedInstaller: null != (o = t.enablePersonalizedInstaller) && o,
                enableDummyCodeInInstaller: null != (r = t.enableDummyCodeInInstaller) && r,
                enablePersonalizedInstallerInMac: !1,
                enablePersonalizedStudioLaunch: null != (a = t.enablePersonalizedStudioLaunch) && a,
                enablePersonalizedStudioLaunchInMac: !1
            }
        }
        return {
            enablePersonalizedInstaller: !1,
            enableDummyCodeInInstaller: !1,
            enablePersonalizedInstallerInMac: !1,
            enablePersonalizedStudioLaunch: !1,
            enablePersonalizedStudioLaunchInMac: !1
        }
    }, em = async e => null != t ? t : t = ef(e), ey = [{
        scopeType: "openid",
        operations: ["read"]
    }, {
        scopeType: "credentials",
        operations: ["read"]
    }, {
        scopeType: "profile",
        operations: ["read"]
    }, {
        scopeType: "age",
        operations: ["read"]
    }, {
        scopeType: "roles",
        operations: ["read"]
    }, {
        scopeType: "premium",
        operations: ["read"]
    }, {
        scopeType: "verification",
        operations: ["read"]
    }];

    function eg(e) {
        let t = new Uint8Array(e);
        globalThis.crypto.getRandomValues(t);
        let i = "";
        return t.forEach(e => {
            i += String.fromCharCode(e)
        }), btoa(i)
    }
    let ew = async e => {
        let {
            clientId: t,
            bedev2BasePath: i
        } = e, n = new ee(new d.Configuration({
            basePath: "".concat(i, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), o = eg(64);
        try {
            let e = await em(i);
            if (null == e ? void 0 : e.enableDummyCodeInInstaller) return eg(33).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/, "");
            if (!e || !e.enablePersonalizedInstaller && !e.enablePersonalizedInstallerInMac || "function" != typeof n.permissionRequestCreateMagicAuthorizationGrant) return;
            return (await n.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: t,
                    scopes: ey,
                    nonce: o
                }
            })).code
        } catch (e) {
            return
        }
    }, eA = [{
        scopeType: "openid",
        operations: ["read"]
    }, {
        scopeType: "credentials",
        operations: ["read"]
    }, {
        scopeType: "profile",
        operations: ["read"]
    }, {
        scopeType: "age",
        operations: ["read"]
    }, {
        scopeType: "roles",
        operations: ["read"]
    }, {
        scopeType: "premium",
        operations: ["read"]
    }, {
        scopeType: "verification",
        operations: ["read"]
    }], eb = async e => {
        let {
            clientId: t,
            bedev2BasePath: i
        } = e, n, o, r = new ee(new d.Configuration({
            basePath: "".concat(i, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), a = (n = new Uint8Array(64), globalThis.crypto.getRandomValues(n), o = "", n.forEach(e => {
            o += String.fromCharCode(e)
        }), btoa(o));
        try {
            let e = await em(i);
            if (!e || !e.enablePersonalizedStudioLaunch && !e.enablePersonalizedStudioLaunchInMac || !("permissionRequestCreateMagicAuthorizationGrant" in r) || "function" != typeof r.permissionRequestCreateMagicAuthorizationGrant) return;
            return (await r.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: t,
                    scopes: eA,
                    nonce: a
                }
            })).code
        } catch (e) {
            return
        }
    }, ex = e => {
        let t = ["".concat(e.protocolScheme, ":1"), "launchtime:".concat(Date.now()), "avatar", "browsertrackerid:".concat((() => {
            let e = (0, n.getCookieValueByKey)("RBXEventTrackerV2") || (0, n.getCookieValueByKey)("RBXEventTracker");
            if (e) {
                let t = e.match(/browserid=([^&]*)/i);
                if (t) return t[1] || ""
            }
            return ""
        })()), "robloxLocale:".concat(e.locale), "gameLocale:".concat(e.locale), "channel:".concat(e.channel), "browser:".concat(n.device.getCurrentBrowser()), "userId:".concat(e.userId), "distributorType:".concat(e.distributorType)];
        return void 0 !== e.authCode && "" !== e.authCode && t.push("authCode:".concat(e.authCode), "authCodeType:magic"), void 0 !== e.baseUrl && t.push("baseUrl:".concat(encodeURIComponent(e.baseUrl))), e.task === eh.ViewAsset ? (t.push("launchmode:asset"), t.push("assetid:".concat(e.assetId))) : (t.push("launchmode:edit"), e.task === eh.EditPlace && t.push("task:".concat(e.task), "placeId:".concat(e.placeId), "universeId:".concat(e.universeId)), (e.task === eh.Default || e.task === eh.ReturnFromLogin) && t.push("task:".concat(e.task))), t.join("+")
    }, eS = (0, o.makeStyles)()(e => ({
        dialog: {
            backgroundColor: e.palette.background.media,
            padding: "40px 20px 30px 20px",
            minWidth: 400
        }
    }));
    async function eR(e) {
        return Array.from(new Uint8Array(await crypto.subtle.digest("SHA-1", new TextEncoder().encode(e)))).map(e => e.toString(16).padStart(2, "0")).join("")
    }
    let eI = {
            [el]: "5248896133416875863",
            [ec]: "3992715735343249042",
            [eu]: "5462362171564719537",
            [ep]: "7968549422692352298"
        },
        eT = {
            [el]: "6593031293946509533",
            [ec]: "6280195288255344888",
            [eu]: "5437780827214302073",
            [ep]: "6154550030602747221"
        },
        eP = "https://setup.c.robloxdev.cn",
        eC = "".concat(eP, "/cjv/RobloxStudioInstallerCJV.exe"),
        eq = "".concat(eP, "/mac/cjv/RobloxStudioCJV.dmg");
    e.s(["EStudioTaskType", 0, eh, "StudioResourcesProvider", 0, e => {
        let {
            resources: t,
            children: n
        } = e;
        return i.default.createElement(ei.Provider, {
            value: t
        }, n)
    }, "createStudioResources", 0, function(e) {
        let {
            logoSrc: t,
            environment: i,
            target: o,
            fetchers: r,
            errorHandler: a
        } = e, s, l = o === ed ? eT[i] : eI[i];
        return {
            logoSrc: t,
            downloadURL: (s = (0, n.getCurrentPlatform)(), o === ed ? s === n.Platform.macOS ? eq : eC : i === ep ? "https://www.roblox.com/download/studio" : "https://www.".concat(i, ".robloxlabs.com/download/studio")),
            bedev2BasePath: i === ep ? "https://apis.roblox.com" : "https://apis.".concat(i, ".robloxlabs.com"),
            clientId: l,
            async fetchUserChannel() {
                let e = await r.userChannel();
                return void 0 === e || "LIVE" === e.toUpperCase() ? "" : e
            },
            onError(e, t) {
                null == a || a(e, t)
            }
        }
    }, "useStudio", 0, (e, t) => {
        let o = (0, n.getCurrentPlatform)(),
            r = function() {
                let e = (0, i.useContext)(ei);
                if (null === e) throw Error("Cannot load required studio resources, please make sure the provider has been properly set up");
                return e
            }(),
            {
                classes: {
                    dialog: a
                }
            } = eS(),
            [s, l] = (0, i.useState)(),
            [c, u] = (0, i.useState)(),
            d = (0, i.useRef)(s),
            h = (0, i.useRef)(void 0),
            v = (0, i.useCallback)(async () => {
                let e = await ew(r);
                return void 0 === e ? r.downloadURL : "".concat(r.downloadURL, "?code=").concat(e)
            }, [r]),
            f = (0, i.useCallback)(async () => void 0 === c ? void 0 : eR(c), [c]),
            m = (0, i.useCallback)(e => {
                h.current = e
            }, []),
            y = (0, i.useCallback)(e => {
                d.current = e, l(e)
            }, []),
            g = (0, i.useCallback)(() => {
                "Download" === d.current && (m(void 0), y(void 0))
            }, [m, y]);
        (0, i.useEffect)(() => (window.addEventListener("blur", g), () => {
            window.removeEventListener("blur", g)
        }), [g]);
        let w = (0, i.useCallback)(async (e, i) => {
                let {
                    userId: n,
                    locale: o,
                    protocolScheme: a,
                    distributorType: s,
                    baseUrl: l
                } = i;
                try {
                    var c, p, d, h;
                    let i, v;
                    m(e), y("Loading"), null == t || null == (p = t.startAttempt) || p.call(t, e);
                    let [f, g, w] = await Promise.all([r.fetchUserChannel(), ew(r), eb(r)]);
                    u(g);
                    let A = {
                            userId: null != (c = null == n ? void 0 : n.toString()) ? c : "",
                            locale: o,
                            protocolScheme: a,
                            distributorType: s,
                            baseUrl: l,
                            channel: f,
                            authCode: w
                        },
                        b = "";
                    switch (e.task) {
                        case eh.EditPlace:
                            b = ex({
                                ...A,
                                task: e.task,
                                universeId: e.universeId,
                                placeId: e.placeId
                            });
                            break;
                        case eh.ViewAsset:
                            b = ex({
                                ...A,
                                task: e.task,
                                assetId: e.assetId
                            });
                            break;
                        case eh.Default:
                        case eh.ReturnFromLogin:
                            b = ex({
                                ...A,
                                task: e.task
                            })
                    }
                    h = b, (i = document.querySelector('[data-testid="studio-protocol-iframe"]')) && i.remove(), (v = document.createElement("iframe")).style.display = "none", v.src = h, v.setAttribute("data-testid", "studio-protocol-iframe"), document.body.appendChild(v), null == t || null == (d = t.startSuccess) || d.call(t, e), await new Promise(e => {
                        setTimeout(e, 3e3)
                    }), y("Download")
                } catch (t) {
                    y("Error"), r.onError(t instanceof Error ? t : Error(String(t)), e)
                }
            }, [t, m, y, r]),
            A = void 0 === c ? r.downloadURL : "".concat(r.downloadURL, "?code=").concat(c);
        return {
            open: w,
            dialog: (0, i.useMemo)(() => i.default.createElement(p.Dialog, {
                classes: {
                    paper: a
                },
                maxWidth: "XSmall",
                open: void 0 !== s
            }, "Loading" === s && i.default.createElement(er, {
                logoSrc: r.logoSrc,
                translations: e
            }), "Error" === s && i.default.createElement(ea, {
                onClose: () => {
                    m(void 0), y(void 0)
                },
                logoSrc: r.logoSrc,
                translations: e
            }), "Download" === s && i.default.createElement(es, {
                onClose: () => {
                    m(void 0), y(void 0)
                },
                onDownload: () => {
                    var e;
                    void 0 !== h.current && (null == t || null == (e = t.download) || e.call(t, h.current, {
                        getDownloadCode: f
                    }))
                },
                downloadUrl: A,
                logoSrc: r.logoSrc,
                translations: e
            })), [a, s, f, A, t, m, y, r.logoSrc, e]),
            isCompatible: o === n.Platform.Windows || o === n.Platform.macOS,
            getStudioDownloadUrlAsync: v
        }
    }], 581577)
}]);

//# debugId=3452728b-e5cd-cb3a-ec42-083ec6eea80d
//# sourceMappingURL=2bk96sd-7zk3m.js.map