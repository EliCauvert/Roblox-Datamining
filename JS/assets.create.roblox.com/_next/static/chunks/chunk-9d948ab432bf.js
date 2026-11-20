;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2bb4bb1d-8964-9dac-063f-b883e46d955d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 398902, e => {
    "use strict";
    var t = e.i(902323),
        a = e.i(574487),
        n = e.i(328535),
        r = e.i(835315),
        i = e.i(813555),
        s = e.i(335020),
        l = e.i(643766);
    let o = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        u = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        c = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        d = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        m = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        g = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        h = (0, l.forwardRef)((e, h) => {
            let {
                label: b,
                labelTooltip: v,
                leadingIconName: p,
                trailingIconName: f,
                leadingIconNode: w,
                trailingIconNode: E,
                hasError: S,
                error: C,
                helperText: x,
                size: y,
                variant: I = "Standard",
                isRequired: M,
                isDisabled: T,
                className: L,
                style: k,
                inputContainerClassName: O,
                inputContainerClassStyle: N,
                id: A,
                ...H
            } = e, F = (0, n.f)(), _ = A || F, D = "".concat(_, "-description"), R = null != y ? y : "Large", P = S || !!C, U = C || x, V = (0, l.useMemo)(() => p ? l.default.createElement(a.f, {
                name: p,
                size: R,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : w, [p, w, R]), W = (0, l.useMemo)(() => f ? l.default.createElement(a.f, {
                name: f,
                size: R,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : E, [R, f, E]), B = b ? l.default.createElement("label", {
                htmlFor: _,
                className: (0, s.U)(m[R], "content-emphasis")
            }, b, M && l.default.createElement(l.default.Fragment, null, " ", l.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return l.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, s.U)("flex width-full flex-col gap-small ".concat(L), {
                    [t.f]: T
                }),
                style: k
            }, B && (v ? l.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, B, l.default.createElement(r.f, v)) : B), l.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, s.U)("foundation-web-input flex items-center width-full", i.U[I], i.L[I], O, c[R], d[R], o[R], u[R], P ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: N
            }, V, l.default.createElement("input", {
                type: "text",
                id: _,
                ref: h,
                className: (0, s.U)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", g[R]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": P,
                "aria-describedby": U ? D : void 0,
                required: M,
                ...H,
                disabled: T
            }), W), U && l.default.createElement("span", {
                id: D,
                className: (0, s.U)("text-caption-small", {
                    "content-system-alert": P,
                    "content-default": !P
                })
            }, U))
        });
    h.displayName = "TextInput", e.s(["f", 0, h])
}, 967677, e => {
    "use strict";
    var t = e.i(225226),
        a = e.i(643766),
        n = e.i(231543),
        r = e.i(130933),
        i = e.i(179183),
        s = e.i(433659),
        l = e.i(365434),
        o = e.i(677484),
        u = e.i(785517),
        c = e.i(422166),
        d = e.i(268953);

    function m(e) {
        return (0, s.g)("MuiAlertTitle", e)
    }(0, o.g)("MuiAlertTitle", ["root"]);
    let g = ["className"],
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
        b = a.forwardRef(function(e, t) {
            let a = (0, d.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: n
                } = a,
                r = (0, s._)(a, g),
                o = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, l.a)({
                        root: ["root"]
                    }, m, t)
                })(a);
            return (0, u.jsx)(h, (0, i._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, l.c)(o.root, n)
            }, r))
        });
    var v = (0, n.f)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        p = (0, a.forwardRef)(function(e, n) {
            var i = e.classes,
                s = e.className,
                l = (0, t.a)(e, ["classes", "className"]),
                o = v(void 0, {
                    props: {
                        classes: (0, r.f)(i, s)
                    }
                });
            return a.default.createElement(b, (0, t._)({}, l, {
                classes: o.classes,
                ref: n
            }))
        });
    e.s(["f", 0, p], 967677)
}, 138726, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(341260),
        r = e.i(209754),
        i = e.i(458451),
        s = e.i(725924),
        l = e.i(969687),
        o = e.i(676061),
        u = e.i(67243),
        c = e.i(71375),
        d = e.i(806001);
    let m = (0, u.f)()(e => ({
        loading: {
            width: "50%",
            maxWidth: 250,
            margin: "250px auto"
        },
        background: {
            ...(0, l.S)(),
            height: "100%",
            width: "100%",
            margin: "0"
        },
        content: {
            ".studio-webview &": {
                alignItems: "center",
                display: "flex",
                height: "100%"
            },
            maxWidth: 1500,
            width: "100%",
            margin: "auto",
            padding: 32,
            [e.breakpoints.down("XLarge")]: {
                padding: 24
            }
        }
    }));
    e.s(["f", 0, e => {
        let {
            children: l
        } = e, {
            classes: {
                loading: u,
                content: g,
                background: h
            }
        } = m(), {
            status: b,
            user: v,
            login: p
        } = (0, i.s)(), f = (0, s.f)(), [w, E] = (0, a.useState)(!1);
        (0, a.useEffect)(() => {
            "unauthenticated" === b && p().catch(e => {
                (0, r.y)(e), E(!0)
            }), "logged-out" === b && n.default.push(d.f.getUrl())
        }, [p, b]);
        let S = (0, t.jsx)("div", {
            className: h,
            children: (0, t.jsx)("div", {
                className: g,
                children: (0, t.jsx)(o.f, {
                    classes: {
                        root: u
                    },
                    title: "loading"
                })
            })
        });
        return "initial" !== b && "loading" !== b && f ? "error" === b || w ? (0, t.jsx)("div", {
            className: h,
            children: (0, t.jsx)("div", {
                className: g,
                children: (0, t.jsx)(c.f, {
                    onReload: () => {
                        n.default.reload()
                    }
                })
            })
        }) : "moderated" === b ? (0, t.jsx)(t.Fragment, {
            children: l
        }) : "success" !== b || null === v ? S : (0, t.jsx)(t.Fragment, {
            children: l
        }) : S
    }])
}, 358763, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(296380);
    let n = () => {};
    e.s(["f", 0, function(e, r) {
        let {
            debounceDelay: i,
            intersectionObserverThreshold: s,
            resetOncePer: l
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, o = (0, t.useRef)(!1), u = (0, t.useCallback)(e => {
            !e || o.current || (o.current = !0, r())
        }, [r]), [c, d] = (0, a.D)(u, null != i ? i : 250), m = (0, t.useCallback)(e => {
            let [t] = e;
            c(t.isIntersecting)
        }, [c]), g = null != l ? l : "instance";
        (0, t.useMemo)(() => {
            "callback" === g && (o.current = !1)
        }, [r]), (0, t.useEffect)(() => {
            if (!e.current) return n;
            let t = new IntersectionObserver(m, {
                threshold: null != s ? s : .5
            });
            return t.observe(e.current), () => {
                t.disconnect(), d()
            }
        }, [d, e, s, m])
    }])
}, 29929, e => {
    "use strict";
    var t, a, n, r, i, s, l, o, u, c, d, m, g, h, b, v, p, f = e.i(650502),
        w = e.i(864392),
        E = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        S = ((a = {}).EnableRightsManager = "enableRightsManager", a.EnableBulkFiling = "enableBulkFiling", a.EnableOnDemandSearch = "enableOnDemandSearch", a.EnableEditRegistration = "enableEditRegistration", a.EnableImageSearch = "enableImageSearch", a.EnableClaimsAgainstMe = "enableClaimsAgainstMe", a.EnableGenAiOptOut = "enableGenAiOptOut", a.EnableInExperienceIpReporting = "enableInExperienceIpReporting", a.EnableIpContentSearch = "enableIpContentSearch", a.EnableTrademark = "enableTrademark", a),
        C = ((n = {}).EnableIPRecommender = "enableIPRecommender", n.EnableContentBadges = "enableContentBadges", n),
        x = ((r = x || {}).EnableVideoOnboarding = "enableVideoOnboarding", r),
        y = ((i = y || {}).LicenseSwimlanePlacement = "licenseSwimlanePlacement", i),
        I = ((s = I || {}).EnableSignalLookup = "enableSignalLookup", s.AlwaysShow = "alwaysShow", s),
        M = M || {},
        T = ((l = T || {}).mobileVariant = "mobileVariant", l),
        L = L || {},
        k = ((o = {}).ShowEditInStudioButton = "showEditInStudioButton", o.EnableCreationsNavLayout = "enableCreationsIPNavLayout", o),
        O = ((u = {}).EnableMultiAssetSearch = "enableMultiAssetSearch", u),
        N = ((c = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", c.EnableAudienceControls = "enableAudienceControls", c.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", c.EnableAudiencesReplacement = "enableAudiencesReplacement", c),
        A = ((d = {}).EnableTalentHubV2 = "enableTalentHubV2", d.EnableTalentHubV2M2 = "enableTalentHubV2M2", d),
        H = ((m = H || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", m),
        F = ((g = F || {}).GameAppealsEnabled = "gameAppealsEnabled", g),
        _ = ((h = _ || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", h),
        D = ((b = {}).CreatorDashboard = "CreatorDashboard", b.CreatorHubHomePage = "CreatorHub.HomePage.UserId", b.CreatorHomeDiscovery = "CreatorHomeDiscovery", b.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", b.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", b.CreatorHubLandingPage = "CreatorHub.LandingPage", b.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", b.CreatorHubNavigation = "CreatorHub.Navigation", b.CreatorHubNavigationUser = "CreatorHub.Navigation.User", b.CreatorHubPublishing = "CreatorHub.Publishing.UserId", b.LicenseManager = "CreatorDashboard.LicenseManager", b.RightsManager = "CreatorDashboard.RightsManager", b.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", b.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", b.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", b.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", b.CreatorHubGameAppeals = "CreatorHub.GameAppeals.UserId", b.TalentHub = "CreatorHub.TalentHub.UserId", b),
        R = ((v = R || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", v.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", v.ShowSecrets = "showSecrets", v.ShowQualitySignalCards = "showQualitySignalCards", v);
    let P = {
        CreatorDashboard: E,
        "CreatorHub.HomePage.UserId": x,
        CreatorHomeDiscovery: y,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": I,
        "CreatorHub.LandingPage": M,
        "CreatorHub.LandingPage.UserId": T,
        "CreatorHub.Navigation": L,
        "CreatorHub.Navigation.User": k,
        "CreatorHub.Publishing.UserId": O,
        "CreatorDashboard.LicenseManager": C,
        "CreatorDashboard.RightsManager": S,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.Search.UserId": ((p = {}).SearchVersion = "searchVersion", p),
        "CreatorHub.Creations.Permission": N,
        "CreatorHub.ExperienceWebhooks.UserId": H,
        "CreatorHub.GameAppeals.UserId": F,
        "CreatorHub.HomePage.ExperienceTile.UserId": _,
        "CreatorHub.TalentHub.UserId": A
    };
    async function U(e) {
        let t = (0, f.l)("product-experimentation-platform"),
            a = Object.values(P[e]).join(","),
            n = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(n, {
            credentials: "include"
        })).json()
    }
    let V = (0, w.f)(U);
    e.s(["G", () => N, "q", () => O, "f", () => D, "H", () => C, "R", () => A, "B", 0, V])
}, 864392, e => {
    "use strict";
    e.s(["f", 0, function(e) {
        let t = new Map;
        return a => {
            if (t.has(a)) return t.get(a);
            let n = e(a);
            return t.set(a, n), n
        }
    }])
}, 296380, e => {
    "use strict";
    var t = e.i(643766);
    let a = (e, a) => {
        let n = (0, t.useRef)(null),
            r = (0, t.useCallback)(() => {
                null !== n.current && (clearTimeout(n.current), n.current = null)
            }, [n]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, i = Array(t), s = 0; s < t; s++) i[s] = arguments[s];
            r(), n.current = window.setTimeout(() => {
                e(...i), n.current = null
            }, a)
        }, [e, a, r]), r, n]
    };
    e.s(["U", 0, a, "D", 0, a])
}, 60373, e => {
    "use strict";
    var t = e.i(643766),
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
    e.s(["f", 0, function(e, i) {
        var s;
        let l = null != (s = null == i ? void 0 : i.cacheOnly) && s,
            [o, u] = (0, t.useState)(() => l ? {
                params: n(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == i ? void 0 : i.restoreInitialValueFromCache) ? n(e) : {},
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
                    })), t = await (0, a.B)(e), u({
                        params: t,
                        isFetched: !0,
                        status: "success"
                    }), r(e, t)
                } catch (e) {
                    u(e => ({
                        ...e,
                        isFetched: !0,
                        status: "error"
                    }))
                }
            })()
        }, []), o
    }])
}, 198528, e => {
    "use strict";
    var t = e.i(643766),
        a = e.i(341260);
    e.s(["U", 0, (e, n) => {
        let r = (0, a.useRouter)(),
            i = r.query;
        return [(0, t.useMemo)(() => {
            let t = null != i ? i : {},
                a = {};
            for (let n of e) a[n] = t[n];
            return a
        }, [e, i]), (0, t.useCallback)(function(t) {
            var a;
            let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    skipHistory: !1
                },
                s = null != (a = r.query) ? a : {},
                l = {
                    ...s
                };
            e.forEach(e => {
                if (!Object.hasOwn(t, e)) return;
                let a = t[e];
                null == a ? delete l[e] : Array.isArray(a) ? l[e] = a.map(e => e.toString()) : l[e] = a.toString()
            }), Array.from(new Set([...Object.keys(s), ...Object.keys(l)])).every(e => ((e, t) => {
                if (null == e && null == t) return !0;
                if (null == e || null == t) return !1;
                let a = Array.isArray(e) ? e : [e],
                    n = Array.isArray(t) ? t : [t];
                return a.length === n.length && a.every((e, t) => e === n[t])
            })(s[e], l[e])) || (i.skipHistory ? r.replace({
                pathname: r.pathname,
                query: l
            }) : r.push({
                pathname: r.pathname,
                query: l
            }, void 0, n))
        }, [r, e, n])]
    }, "j", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        return "" === t || null == t ? void 0 : t
    }])
}, 780880, e => {
    "use strict";
    var t = e.i(198528);
    e.s(["f", () => t.U])
}, 806001, e => {
    "use strict";
    var t = e.i(726474);
    e.s(["f", 0, t])
}, 829425, e => {
    "use strict";
    var t = e.i(726474);
    e.s(["f", 0, t])
}, 927868, e => {
    "use strict";
    e.s(["h", 0, (e, t) => {
        let a = Object.entries(e).find(e => {
            let [, a] = e;
            return a === t
        });
        return a ? a[0] : null
    }, "I", 0, (e, t) => e.includes(t), "s", 0, (e, t) => Object.values(e).includes(t)])
}, 969687, e => {
    "use strict";
    var t, a, n, r, i, s, l, o = e.i(163021),
        u = e.i(805290),
        c = e.i(252842),
        d = e.i(79187),
        m = e.i(643766),
        g = e.i(209754),
        h = e.i(533414),
        b = ((r = {}).TIMED_OUT = "TIMED_OUT", r.WEBVIEW_NOT_INITIALIZED = "WEBVIEW_NOT_INITIALIZED", r.WEBVIEW_NOT_FOUND = "WEBVIEW_NOT_FOUND", r.INVALID_MESSAGE = "INVALID_MESSAGE", r);
    class v extends Error {
        constructor(e, t, a) {
            let n = "MessageBusError, code: ".concat(e);
            t && (n += ", eventName: ".concat(t)), a && (n += ", type: ".concat(a)), super(n), (0, u._)(this, "code", void 0), (0, u._)(this, "eventName", void 0), (0, u._)(this, "eventType", void 0), this.code = e, this.eventName = t, this.eventType = a
        }
    }
    var p = ((i = p || {}).DarkFoundation = "darkFoundation", i.LightFoundation = "lightFoundation", i);
    let f = "darkFoundation";
    var w = ((s = {}).Fire = "fire", s.Response = "response", s.Request = "request", s);

    function E() {
        var e, t, a, n, r, i;
        let s = null == (t = window) || null == (e = t.navigator) ? void 0 : e.userAgent;
        return (null == (n = window) || null == (a = n.rbx) ? void 0 : a.studio.isPrewarm) !== !0 && (null == (i = window) || null == (r = i.rbx) ? void 0 : r.postMessage) !== void 0 && void 0 !== s && s.includes("RobloxStudio")
    }

    function S() {
        var e, t, a, n;
        return (null != (e = null == (n = window) || null == (a = n.rbx) || null == (t = a.studio) ? void 0 : t.osPlatform) ? e : "").toLowerCase().startsWith("win")
    }
    class C {
        enqueueMessage(e) {
            this.queue.push(e), this.debouncedFlush()
        }
        flush() {
            let e = "".concat(this.url, "?"),
                t = 0;
            for (let a of this.queue) {
                let n = e + "msg".concat(t, "=").concat(encodeURIComponent(a), "&");
                if (n.length > this.maxUrlLength) {
                    if (t > 0) {
                        this.queue = this.queue.slice(t), this.postFrameMessage(e), this.debouncedFlush();
                        return
                    }
                    console.warn("Message too large: (".concat(n.length, "), attempting to send anyway")), this.queue = this.queue.slice(1), this.postFrameMessage(n), this.queue.length > 0 && this.debouncedFlush();
                    return
                }
                e = n, t += 1
            }
            t > 0 && (this.queue = this.queue.slice(t), this.postFrameMessage(e))
        }
        postFrameMessage(e) {
            let t = document.createElement("iframe");
            t.style.display = "none", t.src = e, document.body.appendChild(t), setTimeout(() => {
                document.body.removeChild(t)
            }, this.frameRemoveDelay)
        }
        constructor(e, t = {}) {
            (0, u._)(this, "debouncedFlush", void 0), (0, u._)(this, "frameRemoveDelay", void 0), (0, u._)(this, "maxUrlLength", void 0), (0, u._)(this, "queue", []), (0, u._)(this, "url", void 0);
            let {
                flushInterval: a = 10,
                frameRemoveDelay: n = 10,
                maxUrlLength: r = 64e3
            } = t;
            this.url = e, this.frameRemoveDelay = n, this.maxUrlLength = r, [this.debouncedFlush] = (0, c.A)(() => this.flush(), a)
        }
    }
    let x = d.v.English;
    class y {
        getStudioConfiguration() {
            var e;
            if (!E() || !(null == (e = window.rbx) ? void 0 : e.messageBus)) throw new v(b.WEBVIEW_NOT_INITIALIZED);
            let t = window.rbx.studio;
            return Object.values(d.v).includes(t.locale) || (console.warn("Locale: ".concat(t.locale, " is not valid. Defaulting to ").concat(x, ".")), t.locale = x), Object.values(p).includes(t.theme) || (console.warn("Theme: ".concat(t.theme, " is not valid. Defaulting to ").concat(f, ".")), t.theme = f), t
        }
        getOrCreateEventListenersMap(e) {
            let t = e.events;
            if (t) return t;
            let a = new Map;
            return e.events = a, a
        }
        loadWebView() {
            var e, t, a, n;
            if (!E() || !(null == (e = window.rbx) ? void 0 : e.messageBus)) throw new v(b.WEBVIEW_NOT_INITIALIZED);
            if ((null == (t = window.rbx) ? void 0 : t.postMessageFrameUrl) && (null == (n = window.webkit) || null == (a = n.messageHandlers) ? void 0 : a.roblox)) {
                let e = new C(window.rbx.postMessageFrameUrl);
                window.webkit.messageHandlers.roblox.postMessage = t => {
                    e.enqueueMessage(t)
                }
            }
            let r = this.getOrCreateEventListenersMap(window.rbx.messageBus);
            window.rbx.messageBus = {
                dispatchEvent: (e, t, a) => {
                    let n = r.get(e),
                        i = null == n ? void 0 : n.uuidSpecificListeners,
                        s = null == n ? void 0 : n.generalListeners;
                    if (void 0 !== i) {
                        var l;
                        let e = i.get(null != (l = t.uuid) ? l : "");
                        e && e(a, t)
                    }
                    void 0 !== s && s.forEach(e => e(a, t))
                },
                events: r
            }
        }
        async initHandshake(e) {
            return this.call("internal:init", e, 0)
        }
        getFullEventName(e) {
            return String(e).includes("internal") ? e.toString() : "".concat(this.namespace, ":").concat(String(e))
        }
        postMessage(e, t, a) {
            var n;
            if (!E() || !(null == (n = window.rbx) ? void 0 : n.postMessage)) throw new v(b.WEBVIEW_NOT_FOUND, e, t.type);
            let r = JSON.stringify(t),
                i = JSON.stringify(a);
            if (r.includes("|")) throw new v(b.INVALID_MESSAGE, e, t.type);
            let s = "1|".concat(e, "|").concat(r, "|").concat(i);
            window.rbx.postMessage("messageBusEvent", s)
        }
        setListenerInternal(e, t, a) {
            var n;
            let r = null == (n = window.rbx) ? void 0 : n.messageBus;
            if (!E() || !r) throw new v(b.WEBVIEW_NOT_FOUND, String(e));
            let i = this.getFullEventName(e),
                s = this.getOrCreateEventListenersMap(r),
                l = new Map,
                o = s.get(i);
            o ? o.uuidSpecificListeners ? l = o.uuidSpecificListeners : o.uuidSpecificListeners = l : s.set(i, {
                uuidSpecificListeners: l,
                generalListeners: []
            }), l.set(a, t)
        }
        removeListenerInternal(e, t) {
            var a;
            let n = this.getFullEventName(e),
                r = null == (a = window.rbx) ? void 0 : a.messageBus.events;
            if (!r) return;
            let i = r.get(n),
                s = null == i ? void 0 : i.uuidSpecificListeners;
            void 0 !== s && s.has(t) && s.delete(t)
        }
        setListener(e, t) {
            var a;
            let n = null == (a = window.rbx) ? void 0 : a.messageBus;
            if (!E() || !n) throw new v(b.WEBVIEW_NOT_FOUND, String(e));
            let r = this.getFullEventName(e),
                i = (e, a) => {
                    var n;
                    let i = null != (n = t(e)) ? n : {};
                    a.type === w.Request && this.postMessage(r, {
                        type: w.Response,
                        uuid: a.uuid
                    }, i)
                },
                s = this.getOrCreateEventListenersMap(n),
                l = [],
                o = s.get(r);
            return o ? o.generalListeners ? l = o.generalListeners : o.generalListeners = l : s.set(r, {
                uuidSpecificListeners: new Map,
                generalListeners: l
            }), l.push(i), i
        }
        removeListener(e, t) {
            var a;
            let n = this.getFullEventName(e),
                r = null == (a = window.rbx) ? void 0 : a.messageBus.events;
            if (!r) return;
            let i = r.get(n),
                s = null == i ? void 0 : i.generalListeners;
            if (void 0 === s || 0 === s.length) return;
            let l = s.indexOf(t);
            l > -1 && s.splice(l, 1)
        }
        async call(e, t) {
            let a, n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 3e3;
            if (!E()) throw new v(b.WEBVIEW_NOT_FOUND, String(e), w.Request);
            let r = a => new Promise(n => {
                    let r = (t, r) => {
                        this.removeListenerInternal(e, a), n(t)
                    };
                    this.setListenerInternal(e, r, a), this.postMessage(this.getFullEventName(e), {
                        type: w.Request,
                        uuid: a
                    }, t)
                }),
                i = c.L.generateRandomUuid();
            return n <= 0 ? r(i) : Promise.race([new Promise((t, r) => {
                a = setTimeout(() => {
                    this.removeListenerInternal(e, i), r(new v(b.TIMED_OUT, String(e), w.Request))
                }, n)
            }), r(i).then(e => (a && clearTimeout(a), e))])
        }
        fire(e, t) {
            if (!E()) throw new v(b.WEBVIEW_NOT_FOUND, String(e), w.Fire);
            let a = c.L.generateRandomUuid();
            this.postMessage(this.getFullEventName(e), {
                type: w.Fire,
                uuid: a
            }, t)
        }
        constructor(e) {
            (0, u._)(this, "namespace", void 0), this.namespace = e.namespace
        }
    }
    var I = ((l = {}).changeTheme = "internal:changeTheme", l.changeVolume = "internal:changeVolume", l.hideSnackbar = "internal:hideSnackbar", l.init = "internal:init", l.showSnackbar = "internal:showSnackbar", l.deprecatedSendAnalyticsCounterEvent = "sendAnalyticsCounterEvent", l.deprecatedSendAnalyticsEvent = "sendAnalyticsEvent", l);

    function M(e, t) {
        let a = e.getElementsByTagName("video"),
            n = e.getElementsByTagName("audio");
        a.length > 0 && Array.from(a).forEach(e => {
            e.volume = t
        }), n.length > 0 && Array.from(n).forEach(e => {
            e.volume = t
        })
    }
    let T = !1,
        L = e => {
            var t;
            return null != (t = Object.values(d.v).find(t => t === e)) ? t : null
        },
        k = () => {
            var e, t, a;
            (null == (e = window.rbx) ? void 0 : e.postMessage) && !T && (T = !0, null == (a = window.rbx) || null == (t = a.postMessage) || t.call(a, "loadprogress", "afterInteractive"))
        },
        O = () => {
            "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", k, {
                once: !0
            }) : k()
        };
    (null == (t = window.rbx) ? void 0 : t.postMessage) && (null == (n = window.rbx) || null == (a = n.postMessage) || a.call(n, "loadprogress", "beforeInteractive"), S() || O());
    let N = [],
        A = !1;

    function H() {}
    let F = () => () => H;
    e.s(["R", 0, class extends y {
        async initHandshake(e) {
            let {
                capabilities: t
            } = e;
            return {
                capabilities: t
            }
        }
        async call() {
            return {}
        }
        getStudioConfiguration() {
            return this.studioConfiguration
        }
        constructor(e) {
            var t, a, n, r, i, s;
            super({
                namespace: e
            }), (0, u._)(this, "studioConfiguration", void 0), (0, u._)(this, "loadWebView", H), (0, u._)(this, "setListener", F), (0, u._)(this, "fire", H), this.studioConfiguration = {
                theme: p.DarkFoundation,
                locale: d.v.English,
                isPrewarm: !1
            }, window.rbx = {
                ...window.rbx,
                studio: null != (t = null == (r = window.rbx) ? void 0 : r.studio) ? t : this.studioConfiguration,
                messageBus: null != (a = null == (i = window.rbx) ? void 0 : i.messageBus) ? a : {
                    events: new Map,
                    dispatchEvent: H
                },
                postMessage: null != (n = null == (s = window.rbx) ? void 0 : s.postMessage) ? n : H
            }
        }
    }, "c", 0, p, "C", 0, function(e) {
        var t, a;
        let {
            children: n,
            useContextHook: r,
            capabilities: i = N,
            isReadyToInitialize: s
        } = e, {
            isWebView: l,
            getStudioConfiguration: o,
            setStudioThemeOverride: u,
            initHandshake: c,
            removeListener: d,
            setListener: h,
            loadWebView: b,
            studioVersion: v
        } = r(), p = (0, m.useRef)(l && null != (t = o().volume) ? t : 1), f = (0, m.useRef)(l ? (a = () => p.current, new MutationObserver(e => {
            e.forEach(e => {
                "childList" === e.type && e.addedNodes.forEach(e => {
                    e instanceof Element && (("AUDIO" === e.tagName || "VIDEO" === e.tagName) && (e.volume = a()), e.children.length > 0 && M(e, a()))
                })
            })
        })) : null), w = (0, m.useCallback)(e => {
            let {
                theme: t
            } = e;
            u(t)
        }, [u]), E = (0, m.useCallback)(e => {
            let {
                volume: t
            } = e;
            p.current = t, M(document.body, t)
        }, [p]);
        return (0, m.useEffect)(() => {
            var e;
            g.z("isWebView", l), l && (M(document.body, p.current), null == (e = f.current) || e.observe(document.body, {
                childList: !0,
                subtree: !0
            }), window.addEventListener("dragover", e => e.preventDefault(), !0), window.addEventListener("drop", e => e.preventDefault(), !0))
        }, [l]), (0, m.useEffect)(() => {
            l && v && g.z("studioVersion", v)
        }, [l, v]), (0, m.useEffect)(() => {
            if (l) {
                var e;
                void 0 === (null == (e = window.rbx) ? void 0 : e.messageBus.dispatchEvent) && b();
                let t = h(I.changeTheme, w),
                    a = h(I.changeVolume, E);
                return () => {
                    d(I.changeTheme, t), d(I.changeVolume, a)
                }
            }
            return () => {}
        }, [w, E, l, b, d, h]), (0, m.useEffect)(() => {
            !l || A || S() && !1 === s || (A = !0, O(), c({
                capabilities: i
            }))
        }, [l, c, i, s]), m.default.createElement(m.default.Fragment, null, n)
    }, "S", 0, function(e) {
        return {
            ".studio-webview &": {
                height: "100vh",
                position: "fixed",
                width: "100vw",
                backgroundColor: "light-dark(#FFFFFF, #191A1F)",
                color: null == e ? void 0 : "light-dark(".concat(e.lightColor, ", ").concat(e.darkColor, ")")
            }
        }
    }, "t", 0, E, "T", 0, e => {
        let {
            namespace: t,
            useSearchParams: a,
            MockMessageBus: n,
            defaultToMockWebView: r = !1
        } = e, i = (0, m.createContext)(null), s = new y({
            namespace: t
        }), l = (e => {
            let {
                context: t,
                bus: a,
                useSearchParams: n,
                MockMessageBus: r,
                defaultToMockWebView: i
            } = e;
            return function(e) {
                let {
                    children: s
                } = e, l = (0, m.useMemo)(() => E(), []), u = n(), [c, g] = (0, h._)("mock_web_view", null), b = (0, m.useRef)(null), v = !l && (!0 === c || i), w = l || v, S = (0, m.useMemo)(() => v ? (null != b.current || (b.current = new r), b.current) : a, [v]), C = (0, m.useCallback)((e, t, a) => S.call(e, t, a), [S]), x = (0, m.useCallback)((e, t) => {
                    S.fire(e, t)
                }, [S]), y = (0, m.useCallback)(() => S.getStudioConfiguration(), [S]), [I, M] = (0, m.useState)(null), T = (0, m.useCallback)(async e => {
                    let t = await S.initHandshake(e);
                    return M(t), t
                }, [S]), k = (0, m.useCallback)(() => {
                    S.loadWebView()
                }, [S]), O = (0, m.useMemo)(() => {
                    var e;
                    return !!(null == (e = window.rbx) ? void 0 : e.studio.isPrewarm)
                }, []), N = (0, m.useMemo)(() => {
                    var e, t;
                    let a;
                    return void 0 === (a = null == (t = window) || null == (e = t.navigator) ? void 0 : e.deviceMemory) || a >= 8
                }, []), A = (0, m.useMemo)(() => (function() {
                    var e, t;
                    let a = null == (t = window) || null == (e = t.navigator) ? void 0 : e.userAgent;
                    if (!a) return "";
                    let n = a.match(/RobloxApp\/([\d.]+)/);
                    return n && n.length > 1 ? n[1] : ""
                })(), []), H = (0, m.useCallback)((e, t) => S.setListener(e, t), [S]), F = (0, m.useCallback)((e, t) => {
                    S.removeListener(e, t)
                }, [S]), [_, D] = (0, h._)("web_view_theme_override", null), [R, P] = (0, h._)("web_view_locale_override", null), U = u.get("locale"), V = L(U);
                (0, m.useEffect)(() => {
                    let e = u.get("mockWebview"),
                        t = "true" === o.default.env.NEXT_PUBLIC_MOCK_WEB_VIEW || "true" === e;
                    if (l || (t ? g(!0) : "false" === e && g(!1)), v) {
                        let e = u.get("theme");
                        e && D(e.includes("light") ? p.LightFoundation : p.DarkFoundation), V ? P(V) : U && console.warn("Ignoring unsupported mocked Studio locale: ".concat(U))
                    }
                }, [l, u, g, U, V, P, D, v]);
                let W = (0, m.useMemo)(() => {
                        let e = w && 1 ? y().theme : f;
                        return null != _ ? _ : e
                    }, [y, w, _]),
                    B = (0, m.useMemo)(() => {
                        var e;
                        let t = w && 1 ? y().locale : d.v.English;
                        return v && null != (e = null != V ? V : L(R)) ? e : t
                    }, [y, v, w, V, R]),
                    q = (0, m.useMemo)(() => ({
                        call: C,
                        currentStudioLocale: B,
                        currentStudioTheme: W,
                        fire: x,
                        getStudioConfiguration: y,
                        initHandshake: T,
                        initHandshakeResponse: I,
                        isPrewarm: O,
                        isRecommendedSpecOrAbove: N,
                        isWebView: w,
                        isWebViewAvailable: w,
                        loadWebView: k,
                        removeListener: F,
                        setListener: H,
                        setStudioThemeOverride: D,
                        studioVersion: A
                    }), [C, B, x, y, T, I, O, N, w, k, F, H, D, W, A]);
                return m.default.createElement(t.Provider, {
                    value: q
                }, s)
            }
        })({
            bus: s,
            context: i,
            defaultToMockWebView: r,
            MockMessageBus: n,
            useSearchParams: a
        });
        return {
            bus: s,
            context: i,
            provider: l,
            useContextHook: () => {
                let e = (0, m.useContext)(i);
                if (!e) throw Error("StudioWebViewMessageBusProviderContext not found");
                return e
            }
        }
    }])
}]);

//# debugId=2bb4bb1d-8964-9dac-063f-b883e46d955d
//# sourceMappingURL=3ykv5hoy57hm5.js.map