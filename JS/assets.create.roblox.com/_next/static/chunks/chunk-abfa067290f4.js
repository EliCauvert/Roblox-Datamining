;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "fe295204-c0a3-f8b6-a8b0-3584777a599d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 174528, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(260241),
        r = e.i(721281);
    e.i(643992), e.i(278862);
    var s = e.i(157310),
        i = e.i(87159),
        o = e.i(677753),
        c = e.i(897547);
    let l = new Map,
        u = async (e, t, a) => {
            let n, r, s = (n = "".concat(e, "/access-management"), (r = l.get(n)) || (r = new i.AccessManagementAPIApi(new o.Configuration({
                basePath: n,
                credentials: "include",
                enableMrRouter: !0
            })), l.set(n, r)), r);
            try {
                let e = await s.accessManagementAPIGetUpsellFeatureAccessRaw({
                    featureName: t,
                    namespace: a
                });
                return await e.raw.json()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to check feature access: ".concat(e), {
                    cause: t
                })
            }
        }, d = new Map, p = e => {
            let t = d.get(e);
            return t || (t = new c.UserSettingsApiApi(new o.Configuration({
                basePath: e,
                credentials: "include",
                enableMrRouter: !0
            })), d.set(e, t)), t
        }, h = async e => {
            let t = p(e);
            try {
                await t.userSettingsApiSetGlobalPrivacyControl()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to set Global Privacy Control: ".concat(e), {
                    cause: t
                })
            }
        }, f = async e => {
            let t = p(e);
            try {
                return await t.userSettingsApiGet({
                    requestedUserSettings: "allowSellShareData"
                })
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to get user settings: ".concat(e), {
                    cause: t
                })
            }
        }, g = () => !("u" < typeof navigator) && !!navigator.globalPrivacyControl, m = async e => {
            var t, a;
            if (e && (null == (a = window.evidon) || null == (t = a.notice) ? void 0 : t.showOptions)) try {
                window.evidon.notice.showOptions()
            } catch (e) {
                console.error("Failed to call Evidon API:", e)
            }
        };
    class v {
        updateCookiePreferences(e) {
            this.currentCookiePreferences = {
                ...e
            }
        }
        hasCookiePreferencesChanged() {
            return Array.from(new Set([...Object.keys(this.currentCookiePreferences), ...Object.keys(this.initialCookiePreferences)])).some(e => this.currentCookiePreferences[e] !== this.initialCookiePreferences[e])
        }
        getGpcState() {
            let e = g(),
                t = this.hasCookiePreferencesChanged();
            return {
                isGpcDetected: e,
                initialGpcState: this.initialGpcState,
                hasUserMadeCookieChanges: t,
                scenario: e ? t ? "signal-with-changes" : "signal-honored" : "no-signal"
            }
        }
        initializeEvidon(e) {
            var t;
            let a;
            e && (m(e).catch(e => {
                console.error("Failed to call Evidon API:", e)
            }), this.evidonCleanup = (t = () => {}, a = () => {
                try {
                    var e, a;
                    (null == (a = window.evidon) || null == (e = a.notice) ? void 0 : e.userGpcEnabled) !== void 0 && t(window.evidon.notice.userGpcEnabled)
                } catch (e) {
                    console.error("Failed to extract GPC signal from Evidon event:", e)
                }
            }, window.addEventListener("evidon-consent-change", a), () => {
                window.removeEventListener("evidon-consent-change", a)
            }))
        }
        cleanup() {
            this.evidonCleanup && (this.evidonCleanup(), this.evidonCleanup = null)
        }
        constructor(e = {}) {
            (0, r._)(this, "initialGpcState", void 0), (0, r._)(this, "evidonCleanup", null), (0, r._)(this, "initialCookiePreferences", void 0), (0, r._)(this, "currentCookiePreferences", void 0), this.initialGpcState = g(), this.initialCookiePreferences = {
                ...e
            }, this.currentCookiePreferences = {
                ...e
            }
        }
    }
    var y = e.i(968892),
        b = e.i(973047),
        w = e.i(79187),
        P = e.i(253738),
        x = e.i(611043),
        C = e.i(537683),
        A = e.i(695763),
        I = e.i(814975);
    let G = (0, A.makeStyles)()(() => ({
            container: {
                textAlign: "center",
                paddingTop: "20px",
                paddingBottom: "20px",
                width: "100%",
                marginTop: "0",
                marginBottom: "0"
            },
            link: {
                textDecoration: "none",
                display: "inline-flex",
                alignItems: "center",
                cursor: "pointer",
                "&:hover": {
                    textDecoration: "underline"
                },
                "&:visited": {
                    color: "inherit"
                }
            },
            icon: {
                marginLeft: "8px",
                verticalAlign: "middle",
                height: "16px",
                width: "auto"
            }
        })),
        k = "Title.GpcDetected",
        E = "Body.GpcDetectedSettingDisabledIneligible",
        S = "Body.GpcDetectedSettingDisabledEligible",
        M = "Body.GpcDetectedSettingEnabledIneligible",
        D = "Body.GpcMissingSettingIneligible",
        R = (0, A.makeStyles)()(() => ({
            modalLink: {
                color: "inherit",
                textDecoration: "none",
                "&:hover": {
                    textDecoration: "underline"
                },
                "&:focus": {
                    textDecoration: "underline"
                }
            },
            inlineLink: {
                display: "inline-flex",
                alignItems: "center"
            },
            inlineIcon: {
                marginLeft: "8px",
                height: "16px",
                width: "auto",
                verticalAlign: "middle"
            }
        })),
        U = e => {
            var n, r;
            let {
                gpcState: s,
                modalData: i,
                translate: o,
                translateHTML: c,
                handleClose: l,
                privacyPreferencesUrl: u,
                modalLinkClass: d
            } = e, {
                user: p
            } = (0, I.useAuthentication)(), h = !!p, f = null != (n = null == i ? void 0 : i.isAdsSellShareDataEnabled) && n, g = null != (r = null == i ? void 0 : i.canUserManageAdsSettings) && r, m = (0, a.useCallback)(e => {
                window.location.pathname.includes("/my/account") && (e.preventDefault(), window.location.href = u)
            }, [u]), v = (0, a.useCallback)(e => (0, t.jsx)(P.Link, {
                href: "https://en.help.roblox.com/hc/articles/28943243301780",
                target: "_blank",
                rel: "noreferrer",
                className: d,
                children: e
            }), [d]), w = (0, a.useCallback)(e => (0, t.jsx)(P.Link, {
                href: u,
                className: d,
                onClick: m,
                children: e
            }), [u, d, m]), x = (0, a.useMemo)(() => (0, t.jsx)("br", {}), []), C = (0, a.useCallback)((e, n) => {
                let r = (o(e, {
                        link: "",
                        hrefEnd: ""
                    }) || "").replaceAll(/{link}/g, "").replaceAll(/{hrefEnd}/g, ""),
                    s = r.split(/{aTagWithHref}|{aTagEnd}/),
                    i = e => {
                        let n = e.split(/{lineBreak}/);
                        return 1 === n.length ? e : (0, t.jsx)(t.Fragment, {
                            children: n.map((e, r) => {
                                let s = "linebreak-".concat(r, "-").concat(e.substring(0, 10));
                                return (0, t.jsxs)(a.Fragment, {
                                    children: [e, r < n.length - 1 && x]
                                }, s)
                            })
                        })
                    };
                return 3 === s.length ? (0, t.jsxs)(t.Fragment, {
                    children: [i(s[0]), n(s[1]), i(s[2])]
                }) : i(r)
            }, [o, x]);
            return (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(b.DialogBody, {
                    children: [(0, t.jsx)(b.DialogTitle, {
                        className: "text-heading-small",
                        children: s.isGpcDetected ? o(k) || "" : o("Title.NoGpcDetected") || ""
                    }), (0, t.jsx)("div", {
                        className: "text-body-medium",
                        children: (() => {
                            if (!h) {
                                let e = [{
                                        opening: "aTagStart",
                                        closing: "aTagEnd",
                                        content: v
                                    }],
                                    t = {
                                        lineBreak: x
                                    };
                                return s.isGpcDetected ? f ? c(M, e, t) : c(E, e, t) : c(D, e, t)
                            }
                            if (!s.isGpcDetected) return g ? C("Body.GpcMissingSettingEligible", w) : c(D, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: x
                            });
                            if (f) return g ? C("Body.GpcDetectedSettingEnabledEligible", w) : c(M, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: x
                            });
                            let e = g ? {
                                tags: [{
                                    opening: "aTagWithHref",
                                    closing: "aTagEnd",
                                    content: w
                                }],
                                args: {
                                    lineBreak: x
                                }
                            } : {
                                tags: [{
                                    opening: "aTagStart",
                                    closing: "aTagEnd",
                                    content: v
                                }],
                                args: {
                                    lineBreak: x
                                }
                            };
                            if ("signal-with-changes" === s.scenario) return g ? C(S, w) : c(E, e.tags, e.args);
                            let t = g ? S : E;
                            return g ? C(t, w) : c(t, e.tags, e.args)
                        })()
                    })]
                }), (0, t.jsx)(b.DialogFooter, {
                    className: "width-full",
                    children: (0, t.jsx)(y.Button, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: l,
                        children: o("Action.Ok") || ""
                    })
                })]
            })
        },
        T = e => {
            let {
                inline: r = !1
            } = e, {
                translate: i,
                translateHTML: o
            } = (0, w.useTranslation)(), c = (0, w.useLocalization)(), l = (0, n.useCookieConsentContext)().preferences, d = (0, a.useRef)(null), p = (0, a.useRef)(!1), [g, m] = (0, a.useState)(!1), {
                classes: {
                    container: y
                }
            } = G(), {
                classes: P
            } = R(), A = (0, a.useCallback)(() => {
                if ("u" < typeof document) return {};
                let e = document.cookie.split("; ").find(e => e.startsWith("RBXcb="));
                if (!e) return {};
                let t = e.substring(6),
                    a = t;
                try {
                    a = decodeURIComponent(t)
                } catch (e) {}
                let n = {};
                return a.split("&").forEach(e => {
                    let [t, a] = e.split("=");
                    t && (n[t] = "true" === a)
                }), n
            }, []), [E, S] = (0, a.useState)({
                isGpcDetected: !1,
                initialGpcState: !1,
                hasUserMadeCookieChanges: !1,
                scenario: "no-signal"
            });
            (0, a.useEffect)(() => () => {
                d.current && d.current.cleanup()
            }, []), (0, a.useEffect)(() => {
                if (g && !p.current) {
                    let e = A();
                    d.current = new v(Object.keys(e).length > 0 ? e : l), p.current = !0, S(d.current.getGpcState())
                }
            }, [g, l, A]), (0, a.useEffect)(() => {
                if (d.current) {
                    let e = A(),
                        t = Object.keys(e).length > 0 ? e : l;
                    d.current.updateCookiePreferences(t);
                    let a = d.current.getGpcState();
                    S(e => e.scenario !== a.scenario || e.isGpcDetected !== a.isGpcDetected || e.hasUserMadeCookieChanges !== a.hasUserMadeCookieChanges ? a : e)
                }
            }, [l, A]), (0, a.useEffect)(() => {
                if (!d.current) return;
                let e = setInterval(() => {
                    if (d.current) {
                        let e = A(),
                            t = Object.keys(e).length > 0 ? e : l;
                        d.current.updateCookiePreferences(t);
                        let a = d.current.getGpcState();
                        S(e => e.scenario !== a.scenario || e.isGpcDetected !== a.isGpcDetected || e.hasUserMadeCookieChanges !== a.hasUserMadeCookieChanges ? a : e)
                    }
                }, 2e3);
                return () => clearInterval(e)
            }, [l, A]);
            let {
                user: M
            } = (0, I.useAuthentication)(), D = !!M, {
                data: T,
                isLoading: F
            } = (e => {
                let {
                    showModal: t,
                    gpcTrackerRef: a,
                    userSettingsApiBaseUrl: n,
                    apiGatewayBaseUrl: r,
                    isAuthenticated: i
                } = e;
                return (0, s.useQuery)({
                    queryKey: ["yourPrivacyChoicesModal", t],
                    queryFn: async () => {
                        var e, t, s;
                        let o = null != (e = null == i ? void 0 : i()) && e,
                            c = null != (t = null == (s = a.current) ? void 0 : s.getGpcState()) ? t : {
                                isGpcDetected: !1,
                                scenario: "no-signal"
                            },
                            {
                                isGpcDetected: l
                            } = c;
                        o && l && await h(n);
                        let d = !1;
                        if (o) try {
                            let {
                                access: e
                            } = await u(r, "ShouldShowAdsSettings", "account_management/UserSettingsPolicy");
                            d = "Granted" === e
                        } catch (e) {
                            console.error("Failed to check feature access:", e)
                        }
                        let p = !1;
                        if (o) try {
                            let e = await f(n);
                            p = "Enabled" === e.allowSellShareData
                        } catch (e) {
                            console.error("Failed to get user settings:", e)
                        } else if ("u" > typeof document) {
                            let e = document.cookie.split("; ").find(e => e.trim().startsWith("RBXcb="));
                            if (e) {
                                let t = e.substring(6),
                                    a = t;
                                try {
                                    a = decodeURIComponent(t)
                                } catch (e) {}
                                let n = a.split("&"),
                                    r = n.some(e => {
                                        let [t, a] = e.split("=");
                                        return "GoogleAnalytics" === t && "true" === a
                                    }),
                                    s = n.some(e => {
                                        let [t, a] = e.split("=");
                                        return "RBXSource" === t && "true" === a
                                    });
                                (r || s) && (p = !0)
                            }
                        } return {
                            isGpcDetected: l,
                            canUserManageAdsSettings: d,
                            isAdsSellShareDataEnabled: p,
                            scenario: c.scenario
                        }
                    },
                    enabled: t,
                    gcTime: 0
                })
            })({
                showModal: g,
                gpcTrackerRef: d,
                userSettingsApiBaseUrl: (0, a.useMemo)(() => "".concat("https://apis.roblox.com", "/user-settings-api"), []),
                apiGatewayBaseUrl: (0, a.useMemo)(() => "https://apis.roblox.com", []),
                isAuthenticated: () => D
            }), j = (0, a.useMemo)(() => c.locale ? (0, w.toRobloxLocale)(c.locale) : "en_us", [c.locale]), N = (0, a.useMemo)(() => {
                let e = "/my/account#!/privacy/AdPreferences?locale=".concat(j);
                return "https://www.roblox.com".concat(e)
            }, [j]), B = (0, a.useCallback)(e => {
                e.preventDefault(), m(!0)
            }, []), O = (0, a.useCallback)(() => {
                m(!1)
            }, []), q = i("Label.YourPrivacyChoices") || "", L = (0, t.jsx)("button", {
                type: "button",
                onClick: B,
                style: {
                    display: "inline-flex",
                    alignItems: "center",
                    background: "none",
                    border: "none",
                    padding: 0,
                    cursor: "pointer",
                    color: "inherit"
                },
                children: (0, t.jsxs)(x.Typography, {
                    variant: "footer",
                    color: "secondary",
                    component: "span",
                    children: [q, (0, t.jsx)("img", {
                        src: "".concat("https://assets.create.roblox.com/693c51491c6d9e57aaf41dc3340c19dd2f0c145a/assets", "/navigation/privacy_icon.png"),
                        alt: "",
                        style: {
                            marginLeft: "8px",
                            height: "16px",
                            width: "auto",
                            verticalAlign: "middle"
                        }
                    })]
                })
            });
            return (0, t.jsxs)(t.Fragment, {
                children: [r ? L : (0, t.jsx)(C.Grid, {
                    classes: {
                        root: y
                    },
                    container: !0,
                    justifyContent: "center",
                    item: !0,
                    children: L
                }), (0, t.jsx)(b.Dialog, {
                    open: g,
                    onOpenChange: O,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: i("Action.Close"),
                    children: (0, t.jsx)(b.DialogContent, {
                        children: F ? (0, t.jsxs)(b.DialogBody, {
                            children: [(0, t.jsx)(b.DialogTitle, {
                                className: "text-heading-small",
                                children: i(k) || ""
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium",
                                children: i("Description.Loading") || ""
                            })]
                        }) : (0, t.jsx)(U, {
                            gpcState: E,
                            modalData: T,
                            translate: i,
                            translateHTML: o,
                            handleClose: O,
                            privacyPreferencesUrl: N,
                            modalLinkClass: P.modalLink
                        })
                    })
                })]
            })
        };
    e.s(["default", 0, e => {
        let {
            inline: a = !1
        } = e;
        try {
            return (0, t.jsx)(T, {
                inline: a
            })
        } catch (e) {
            return console.error("Error rendering PrivacyChoicesFooterLink:", e), null
        }
    }], 174528)
}, 87159, e => {
    "use strict";
    var t = e.i(677753),
        a = function(e, t) {
            return (a = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function n(e, t, a, n) {
        return new(a || (a = Promise))(function(r, s) {
            function i(e) {
                try {
                    c(n.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
                try {
                    c(n.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function c(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(i, o)
            }
            c((n = n.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var a, n, r, s = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = o(0), i.throw = o(1), i.return = o(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function o(o) {
            return function(c) {
                var l = [o, c];
                if (a) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, l[0] && (s = 0)), s;) try {
                    if (a = 1, n && (r = 2 & l[0] ? n.return : l[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, l[1])).done) return r;
                    switch (n = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return s.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            s.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = s.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                s.label = l[1];
                                break
                            }
                            if (6 === l[0] && s.label < r[1]) {
                                s.label = r[1], r = l;
                                break
                            }
                            if (r && s.label < r[2]) {
                                s.label = r[2], s.ops.push(l);
                                break
                            }
                            r[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    l = t.call(e, s)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    a = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function s(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            featureName: e.featureName,
            namespace: e.namespace
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var i = function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            a(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(i, e), i.prototype.accessManagementAPIGetFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, s, i;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.featureNames && (n.featureNames = e.featureNames), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), s = {}, [4, this.request({
                                path: "/v1/feature-access",
                                schemaPath: "/v1/feature-access",
                                method: "GET",
                                headers: s,
                                query: n
                            }, a)];
                        case 1:
                            return i = r.sent(), [2, new t.VoidApiResponse(i)]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetPairwiseFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, s, i;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.featureName && (n.featureName = e.featureName), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.targetUserId && (n.targetUserId = e.targetUserId), e.otherUserIds && (n.otherUserIds = e.otherUserIds), s = {}, [4, this.request({
                                path: "/v1/pairwise-feature-access",
                                schemaPath: "/v1/pairwise-feature-access",
                                method: "GET",
                                headers: s,
                                query: n
                            }, a)];
                        case 1:
                            return i = r.sent(), [2, new t.VoidApiResponse(i)]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetPairwiseFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetPairwiseFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetRCCOwnerFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, s, i;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.featureNames && (n.featureNames = e.featureNames), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), s = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (s["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                path: "/v1/rcc-owner-feature-access",
                                schemaPath: "/v1/rcc-owner-feature-access",
                                method: "GET",
                                headers: s,
                                query: n
                            }, a)];
                        case 1:
                            return i = r.sent(), [2, new t.VoidApiResponse(i)]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetRCCOwnerFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCOwnerFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetRCCUserFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, s, i;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.featureNames && (n.featureNames = e.featureNames), void 0 !== e.userId && (n.userId = e.userId), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), s = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (s["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (s["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/rcc-user-feature-access",
                                schemaPath: "/v1/rcc-user-feature-access",
                                method: "GET",
                                headers: s,
                                query: n
                            }, a)];
                        case 1:
                            return i = r.sent(), [2, new t.VoidApiResponse(i)]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetRCCUserFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCUserFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetRCCUserFeatureEvaluationRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, (i = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (i["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/rcc-user-feature-evaluation",
                                schemaPath: "/v1/rcc-user-feature-evaluation",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(s)
                                    }
                                }(e.accessManagementAPIGetRCCUserFeatureEvaluationRequest)
                            }, a)];
                        case 1:
                            return o = r.sent(), [2, new t.VoidApiResponse(o)]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetRCCUserFeatureEvaluation = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCUserFeatureEvaluationRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetUpsellFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, s, i;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.featureName && (n.featureName = e.featureName), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), void 0 !== e.successfulActions && (n.successfulActions = e.successfulActions), s = {}, [4, this.request({
                                path: "/v1/upsell-feature-access",
                                schemaPath: "/v1/upsell-feature-access",
                                method: "GET",
                                headers: s,
                                query: n
                            }, a)];
                        case 1:
                            return i = r.sent(), [2, new t.VoidApiResponse(i)]
                    }
                })
            })
        }, i.prototype.accessManagementAPIGetUpsellFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetUpsellFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, i.prototype.accessManagementAPIPostPairwiseFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, s, i;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/pairwise-feature-access",
                                schemaPath: "/v1/pairwise-feature-access",
                                method: "POST",
                                headers: s,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        featureName: e.featureName,
                                        namespace: e.namespace,
                                        targetUserId: e.targetUserId,
                                        otherUserIds: e.otherUserIds
                                    }
                                }(e.accessManagementAPIPostPairwiseFeatureAccessRequest)
                            }, a)];
                        case 1:
                            return i = r.sent(), [2, new t.VoidApiResponse(i)]
                    }
                })
            })
        }, i.prototype.accessManagementAPIPostPairwiseFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIPostPairwiseFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, i
    }(t.BaseAPI);
    e.s(["AccessManagementAPIApi", 0, i])
}, 643992, e => {
    "use strict";
    var t = e.i(805476),
        a = e.i(197649),
        n = e.i(416340),
        r = e.i(425353),
        s = e.i(199512);
    let i = (0, n.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        o = () => {
            let e = (0, n.useContext)(i);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        c = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        l = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        u = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        d = e => {
            let {
                open: t,
                onOpenChange: a,
                children: s,
                size: o,
                type: c = "Default",
                isModal: l,
                hasCloseAffordance: u,
                closeLabel: d,
                hasMarginTop: p = !0,
                hasMarginBottom: h = !0,
                hasDescription: f = !1,
                experimentalDisablePointerEventsStylingOnBody: g = !1
            } = e, m = (0, n.useMemo)(() => ({
                size: o,
                isModal: l,
                type: c,
                hasCloseAffordance: u,
                closeLabel: d,
                hasMarginTop: p,
                hasMarginBottom: h,
                hasDescription: f
            }), [o, l, c, u, d, p, h, f]);
            return (0, n.useEffect)(() => {
                g && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [g, t]), n.default.createElement(i.Provider, {
                value: m
            }, n.default.createElement(r.Root, {
                open: t,
                onOpenChange: a
            }, s))
        };
    d.displayName = "Dialog";
    let p = e => {
        let {
            children: s,
            className: i,
            style: c,
            overlayClassName: l,
            overlayStyle: u,
            onOpenAutoFocus: d,
            ...p
        } = e, {
            size: h,
            isModal: f,
            hasCloseAffordance: g,
            closeLabel: m,
            hasDescription: v
        } = o(), y = (0, a.default)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", f && "bg-common-backdrop", l), b = (0, a.default)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", i);
        return n.default.createElement(r.Portal, null, n.default.createElement(r.Overlay, {
            className: y,
            style: u
        }, n.default.createElement(r.Content, {
            className: b,
            "data-size": h,
            style: c,
            onOpenAutoFocus: d,
            ...!v && {
                "aria-describedby": void 0
            },
            ...p
        }, g && n.default.createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, n.default.createElement(r.Close, {
            asChild: !0
        }, n.default.createElement(t.CloseAffordance, {
            variant: "OverMedia",
            size: h,
            isCircular: !0,
            "aria-label": m
        }))), s)))
    };
    p.displayName = "DialogContent";
    let h = e => {
        let {
            children: t,
            className: r,
            ...s
        } = e, {
            size: i,
            hasMarginTop: d,
            hasMarginBottom: p
        } = o(), h = (0, a.default)(c[i], d && l[i], p && u[i], r);
        return n.default.createElement("div", {
            className: h,
            ...s
        }, t)
    };
    h.displayName = "DialogBody";
    let f = e => {
        let {
            children: t,
            className: a,
            hidden: i,
            ...o
        } = e, c = n.default.createElement(r.Title, {
            className: a,
            ...o
        }, t);
        return i ? n.default.createElement(s.VisuallyHidden, null, c) : c
    };
    f.displayName = "DialogTitle";
    let g = e => {
        let {
            children: t,
            className: r,
            ...s
        } = e, {
            size: i
        } = o(), l = (0, a.default)(c[i], u[i], r);
        return n.default.createElement("div", {
            className: l,
            ...s
        }, t)
    };
    g.displayName = "DialogFooter", e.s(["Dialog", 0, d, "DialogBody", 0, h, "DialogContent", 0, p, "DialogFooter", 0, g, "DialogTitle", 0, f])
}]);

//# debugId=fe295204-c0a3-f8b6-a8b0-3584777a599d
//# sourceMappingURL=3xdgoa-asfr-4.js.map