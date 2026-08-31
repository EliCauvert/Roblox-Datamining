;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "bbe2e81d-2bb9-b2eb-ed56-1613913ca6e1")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 447055, 469596, e => {
    "use strict";
    var t = e.i(221628),
        i = (0, e.i(751498).c)((0, t.jsx)("path", {
            d: "M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"
        }), "Close");
    e.s(["C", 0, i], 469596), e.s(["CloseIcon", 0, i], 447055)
}, 119636, 963343, e => {
    "use strict";
    let t, i, n, r, o, a;
    var s = e.i(865800),
        l = e.i(416340),
        u = e.i(614515),
        c = e.i(993807),
        p = e.i(569384),
        d = e.i(273589),
        h = e.i(962560),
        v = e.i(42569),
        f = e.i(270673),
        m = e.i(696180),
        y = e.i(221628),
        w = e.i(963320),
        b = e.i(571709);

    function A() {
        let e = (0, p._)(["\n  0% {\n    left: -35%;\n    right: 100%;\n  }\n\n  60% {\n    left: 100%;\n    right: -90%;\n  }\n\n  100% {\n    left: 100%;\n    right: -90%;\n  }\n"]);
        return A = function() {
            return e
        }, e
    }

    function g() {
        let e = (0, p._)(["\n  0% {\n    left: -200%;\n    right: 100%;\n  }\n\n  60% {\n    left: 107%;\n    right: -8%;\n  }\n\n  100% {\n    left: 107%;\n    right: -8%;\n  }\n"]);
        return g = function() {
            return e
        }, e
    }

    function R() {
        let e = (0, p._)(["\n  0% {\n    opacity: 1;\n    background-position: 0 -23px;\n  }\n\n  60% {\n    opacity: 0;\n    background-position: 0 -23px;\n  }\n\n  100% {\n    opacity: 1;\n    background-position: -200px -23px;\n  }\n"]);
        return R = function() {
            return e
        }, e
    }

    function x() {
        let e = (0, p._)(["\n    animation: ", " 3s infinite linear;\n  "]);
        return x = function() {
            return e
        }, e
    }

    function I() {
        let e = (0, p._)(["\n      width: auto;\n      animation: ", " 2.1s cubic-bezier(0.65, 0.815, 0.735, 0.395) infinite;\n    "]);
        return I = function() {
            return e
        }, e
    }

    function q() {
        let e = (0, p._)(["\n      width: auto;\n      animation: ", " 2.1s cubic-bezier(0.165, 0.84, 0.44, 1) 1.15s infinite;\n    "]);
        return q = function() {
            return e
        }, e
    }

    function S(e) {
        return (0, d.g)("MuiLinearProgress", e)
    }(0, m.g)("MuiLinearProgress", ["root", "colorPrimary", "colorSecondary", "determinate", "indeterminate", "buffer", "query", "dashed", "dashedColorPrimary", "dashedColorSecondary", "bar", "barColorPrimary", "barColorSecondary", "bar1Indeterminate", "bar1Determinate", "bar1Buffer", "bar2Indeterminate", "bar2Buffer"]);
    let P = ["className", "color", "value", "valueBuffer", "variant"],
        C = (0, b.keyframes)(t || (t = A())),
        U = (0, b.keyframes)(i || (i = g())),
        k = (0, b.keyframes)(n || (n = R())),
        T = (e, t) => "inherit" === t ? "currentColor" : e.vars ? e.vars.palette.LinearProgress["".concat(t, "Bg")] : "light" === e.palette.mode ? (0, d.l)(e.palette[t].main, .62) : (0, d.j)(e.palette[t].main, .5),
        K = (0, v.s)("span", {
            name: "MuiLinearProgress",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [t.root, t["color".concat((0, d.a)(i.color))], t[i.variant]]
            }
        })(e => {
            let {
                ownerState: t,
                theme: i
            } = e;
            return (0, h._)({
                position: "relative",
                overflow: "hidden",
                display: "block",
                height: 4,
                zIndex: 0,
                "@media print": {
                    colorAdjust: "exact"
                },
                backgroundColor: T(i, t.color)
            }, "inherit" === t.color && "buffer" !== t.variant && {
                backgroundColor: "none",
                "&::before": {
                    content: '""',
                    position: "absolute",
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    backgroundColor: "currentColor",
                    opacity: .3
                }
            }, "buffer" === t.variant && {
                backgroundColor: "transparent"
            }, "query" === t.variant && {
                transform: "rotate(180deg)"
            })
        }),
        z = (0, v.s)("span", {
            name: "MuiLinearProgress",
            slot: "Dashed",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [t.dashed, t["dashedColor".concat((0, d.a)(i.color))]]
            }
        })(e => {
            let {
                ownerState: t,
                theme: i
            } = e, n = T(i, t.color);
            return (0, h._)({
                position: "absolute",
                marginTop: 0,
                height: "100%",
                width: "100%"
            }, "inherit" === t.color && {
                opacity: .3
            }, {
                backgroundImage: "radial-gradient(".concat(n, " 0%, ").concat(n, " 16%, transparent 42%)"),
                backgroundSize: "10px 10px",
                backgroundPosition: "0 -23px"
            })
        }, (0, b.css)(r || (r = x()), k)),
        E = (0, v.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar1",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [t.bar, t["barColor".concat((0, d.a)(i.color))], ("indeterminate" === i.variant || "query" === i.variant) && t.bar1Indeterminate, "determinate" === i.variant && t.bar1Determinate, "buffer" === i.variant && t.bar1Buffer]
            }
        })(e => {
            let {
                ownerState: t,
                theme: i
            } = e;
            return (0, h._)({
                width: "100%",
                position: "absolute",
                left: 0,
                bottom: 0,
                top: 0,
                transition: "transform 0.2s linear",
                transformOrigin: "left",
                backgroundColor: "inherit" === t.color ? "currentColor" : (i.vars || i).palette[t.color].main
            }, "determinate" === t.variant && {
                transition: "transform .4s linear"
            }, "buffer" === t.variant && {
                zIndex: 1,
                transition: "transform .4s linear"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return ("indeterminate" === t.variant || "query" === t.variant) && (0, b.css)(o || (o = I()), C)
        }),
        G = (0, v.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar2",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [t.bar, t["barColor".concat((0, d.a)(i.color))], ("indeterminate" === i.variant || "query" === i.variant) && t.bar2Indeterminate, "buffer" === i.variant && t.bar2Buffer]
            }
        })(e => {
            let {
                ownerState: t,
                theme: i
            } = e;
            return (0, h._)({
                width: "100%",
                position: "absolute",
                left: 0,
                bottom: 0,
                top: 0,
                transition: "transform 0.2s linear",
                transformOrigin: "left"
            }, "buffer" !== t.variant && {
                backgroundColor: "inherit" === t.color ? "currentColor" : (i.vars || i).palette[t.color].main
            }, "inherit" === t.color && {
                opacity: .3
            }, "buffer" === t.variant && {
                backgroundColor: T(i, t.color),
                transition: "transform .4s linear"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return ("indeterminate" === t.variant || "query" === t.variant) && (0, b.css)(a || (a = q()), U)
        }),
        L = l.forwardRef(function(e, t) {
            let i = (0, w.u)({
                    props: e,
                    name: "MuiLinearProgress"
                }),
                {
                    className: n,
                    color: r = "primary",
                    value: o,
                    valueBuffer: a,
                    variant: s = "indeterminate"
                } = i,
                l = (0, d._)(i, P),
                u = (0, h._)({}, i, {
                    color: r,
                    variant: s
                }),
                c = (e => {
                    let {
                        classes: t,
                        variant: i,
                        color: n
                    } = e, r = {
                        root: ["root", "color".concat((0, d.a)(n)), i],
                        dashed: ["dashed", "dashedColor".concat((0, d.a)(n))],
                        bar1: ["bar", "barColor".concat((0, d.a)(n)), ("indeterminate" === i || "query" === i) && "bar1Indeterminate", "determinate" === i && "bar1Determinate", "buffer" === i && "bar1Buffer"],
                        bar2: ["bar", "buffer" !== i && "barColor".concat((0, d.a)(n)), "buffer" === i && "color".concat((0, d.a)(n)), ("indeterminate" === i || "query" === i) && "bar2Indeterminate", "buffer" === i && "bar2Buffer"]
                    };
                    return (0, v.a)(r, S, t)
                })(u),
                p = (0, f.u)(),
                m = {},
                b = {},
                A = {};
            if (("determinate" === s || "buffer" === s) && void 0 !== o) {
                m["aria-valuenow"] = Math.round(o), m["aria-valuemin"] = 0, m["aria-valuemax"] = 100;
                let e = o - 100;
                p && (e = -e), b.transform = "translateX(".concat(e, "%)")
            }
            if ("buffer" === s && void 0 !== a) {
                let e = (a || 0) - 100;
                p && (e = -e), A.transform = "translateX(".concat(e, "%)")
            }
            return (0, y.jsxs)(K, (0, h._)({
                className: (0, v.c)(c.root, n),
                ownerState: u,
                role: "progressbar"
            }, m, {
                ref: t
            }, l, {
                children: ["buffer" === s ? (0, y.jsx)(z, {
                    className: c.dashed,
                    ownerState: u
                }) : null, (0, y.jsx)(E, {
                    className: c.bar1,
                    ownerState: u,
                    style: b
                }), "determinate" === s ? null : (0, y.jsx)(G, {
                    className: c.bar2,
                    ownerState: u,
                    style: A
                })]
            }))
        });
    e.s(["M", 0, L], 963343);
    var _ = (0, u.default)({
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
        O = (0, l.forwardRef)(function(e, t) {
            var i = e.classes,
                n = e.className,
                r = (0, s.a)(e, ["classes", "className"]),
                o = _(void 0, {
                    props: {
                        classes: (0, c.default)(i, n)
                    }
                });
            return l.default.createElement(L, (0, s._)({}, r, {
                classes: o.classes,
                ref: t
            }))
        });
    e.s(["LinearProgress", 0, O], 119636)
}, 354246, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["WarningIcon", () => t.Warning])
}, 627464, e => {
    "use strict";
    var t = e.i(865800),
        i = e.i(416340),
        n = e.i(730187);
    e.i(221628), e.s(["StudioIcon", 0, function(e) {
        var r = e.ref,
            o = (0, t.a)(e, ["ref"]);
        return i.default.createElement(n.M, (0, t._)({}, o, {
            ref: r,
            viewBox: "0 0 33 33"
        }), i.default.createElement("path", {
            d: "M6.78817 0.975342L3.21606 14.3004L12.3069 16.7337L13.4424 12.4994L29.5881 16.8264L32.0247 7.73884L6.78817 0.975342Z"
        }), i.default.createElement("path", {
            d: "M18.6069 21.448L2.46124 17.1211L0.0246582 26.2119L25.2611 32.9754L28.8332 19.6504L19.7424 17.2138L18.6069 21.448Z"
        }))
    }], 627464)
}, 458451, e => {
    "use strict";
    var t = e.i(416340);
    let i = e => e;

    function n(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : i,
            r = t.default.useSyncExternalStore(e.subscribe, t.default.useCallback(() => n(e.getState()), [e, n]), t.default.useCallback(() => n(e.getInitialState()), [e, n]));
        return t.default.useDebugValue(r), r
    }
    let r = async e => {
        try {
            let t = await e.json();
            if (t.errors.length > 0) {
                let e = t.errors[0];
                if (e) return {
                    code: e.code,
                    message: e.message
                }
            }
            return null
        } catch (e) {
            return null
        }
    }, o = (0, t.createContext)({
        user: null,
        status: "initial",
        isFetched: !1,
        login: () => {
            throw Error("useRobloxAuthentication must be used within a RobloxAuthenticationProvider")
        },
        logout: () => {
            throw Error("useRobloxAuthentication must be used within a RobloxAuthenticationProvider")
        }
    });
    e.s(["RobloxAuthenticationProvider", 0, e => {
        let {
            clientId: i,
            authenticationClient: a,
            discoveryClient: s,
            usersClient: l,
            store: u,
            children: c
        } = e, [p, d] = (0, t.useState)(!1), [h, v] = (0, t.useState)("initial"), f = (0, t.useCallback)(async function() {
            let {
                redirectUri: e,
                ...t
            } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, n = "string" == typeof e ? e : window.location.href.replace(/#.*$/, ""), {
                authorizationEndpoint: r
            } = await s.discoveryGetDiscoveryConfiguration(), o = new URL(r);
            o.search = new URLSearchParams({
                client_id: i,
                redirect_uri: n,
                scope: "openid",
                response_type: "none",
                prompt: "none",
                ...t
            }).toString(), window.location.assign(o.href)
        }, [i, s]), {
            user: m,
            setUser: y
        } = {
            user: n(u, e => e.user),
            setUser: n(u, e => e.setUser)
        }, w = (0, t.useCallback)(async () => {
            await a.v1LogoutPost(), null !== m && (y(null), v("logged-out"))
        }, [a, m, y]);
        (0, t.useEffect)(() => {
            (async () => {
                try {
                    v("loading");
                    let {
                        id: e,
                        name: t,
                        displayName: i
                    } = await l.v1UsersAuthenticatedGet();
                    void 0 !== e && void 0 !== t ? (y({
                        id: e,
                        name: t,
                        displayName: i
                    }), v("success")) : v("error")
                } catch (i) {
                    let e = i.response,
                        t = e ? await r(e) : null;
                    (null == t ? void 0 : t.message) === "User is moderated" ? v("moderated"): (null == t ? void 0 : t.code) === 9002 || (null == e ? void 0 : e.status) === 401 ? v("unauthenticated") : v("error")
                } finally {
                    d(!0)
                }
            })()
        }, []);
        let b = (0, t.useMemo)(() => ({
            user: m,
            isFetched: p,
            status: h,
            login: f,
            logout: w
        }), [m, p, h, f, w]);
        return t.default.createElement(o.Provider, {
            value: b
        }, c)
    }, "initializeAuthStore", 0, function() {
        var e;
        let t, i, n, r, o;
        return e = e => ({
            user: null,
            setUser: t => e({
                user: t
            })
        }), i = new Set, r = {
            setState: n = (e, n) => {
                let r = "function" == typeof e ? e(t) : e;
                if (!Object.is(r, t)) {
                    let e = t;
                    t = (null != n ? n : "object" != typeof r || null === r) ? r : Object.assign({}, t, r), i.forEach(i => i(t, e))
                }
            },
            getState: () => t,
            getInitialState: () => o,
            subscribe: e => (i.add(e), () => i.delete(e))
        }, o = t = e(n), r
    }, "useRobloxAuthentication", 0, () => (0, t.useContext)(o)])
}, 814975, e => {
    "use strict";
    var t = e.i(458451);
    e.s(["useAuthentication", () => t.useRobloxAuthentication])
}, 581577, 703440, e => {
    "use strict";
    let t;
    var i = e.i(416340),
        n = e.i(252842),
        r = e.i(706442),
        o = e.i(169722),
        a = e.i(199834),
        s = e.i(119636),
        l = e.i(988012),
        u = e.i(447055),
        c = e.i(872204),
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
        return new(i || (i = Promise))(function(r, o) {
            function a(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(a, s)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function m(e, t) {
        var i, n, r, o = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
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
                var u = [s, l];
                if (i) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, u[0] && (o = 0)), o;) try {
                    if (i = 1, n && (r = 2 & u[0] ? n.return : u[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, u[1])).done) return r;
                    switch (n = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return o.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            o.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = o.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                o.label = u[1];
                                break
                            }
                            if (6 === u[0] && o.label < r[1]) {
                                o.label = r[1], r = u;
                                break
                            }
                            if (r && o.label < r[2]) {
                                o.label = r[2], o.ops.push(u);
                                break
                            }
                            r[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    u = t.call(e, o)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    i = r = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
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

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            ids: t.ids
        }
    }

    function b(e) {
        if (void 0 !== e) return null === e ? null : {
            ids: e.ids
        }
    }

    function A(e) {
        var t;
        return null == (t = e) ? t : {
            owner: y(t.owner),
            resources: (0, d.mapValues)(t.resources, w)
        }
    }

    function g(e) {
        if (void 0 !== e) return null === e ? null : {
            owner: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    id: e.id,
                    type: e.type
                }
            }(e.owner),
            resources: (0, d.mapValues)(e.resources, b)
        }
    }

    function R(e) {
        return e
    }

    function x(e) {
        return e
    }

    function I(e) {
        return e
    }

    function q(e) {
        return e
    }

    function S(e) {
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

    function U(e) {
        var t;
        return null == (t = e) ? t : {
            redirectUris: t.redirectUris,
            allowedScopes: t.allowedScopes.map(S),
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
            applications: e.applications.map(U),
            nextPageCursor: (0, d.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0
        }
    }

    function T(e) {
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
            scopes: t.scopes.map(S),
            resourceInfo: t.resourceInfo.map(A),
            createdUtc: new Date(t.createdUtc),
            refreshedUtc: new Date(t.refreshedUtc)
        }
    }

    function K(e, t) {
        return null == e ? e : {
            applicationSecret: e.applicationSecret,
            redirectUris: e.redirectUris,
            allowedScopes: e.allowedScopes.map(S),
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

    function z(e, t) {
        return null == e ? e : {
            resourceInfos: e.resource_infos.map(A)
        }
    }

    function E(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function G(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function L(e) {
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

    function _(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function O(e) {
        return e
    }

    function V(e) {
        return e
    }

    function M(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            descriptionTranslationKey: (0, d.exists)(t, "descriptionTranslationKey") ? t.descriptionTranslationKey : void 0,
            riskLevel: (0, d.exists)(t, "riskLevel") ? t.riskLevel : void 0
        }
    }

    function F(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            environments: (0, d.exists)(t, "environments") ? null === t.environments ? null : t.environments.map(V) : void 0,
            targetType: (0, d.exists)(t, "targetType") ? t.targetType : void 0,
            operations: t.operations,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.exists)(t, "product") ? t.product : void 0,
            operationOverrides: t.operationOverrides.map(M),
            authenticationSystems: t.authenticationSystems.map(O),
            groupAllowedOperations: (0, d.exists)(t, "groupAllowedOperations") ? t.groupAllowedOperations : void 0
        }
    }

    function N(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            type: t.type,
            constraints: t.constraints,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function D(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: t.requiredParts,
            optionalParts: t.optionalParts,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function B(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0,
            product: (0, d.exists)(t, "product") ? t.product : void 0
        }
    }

    function j(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            type: (0, d.exists)(t, "type") ? t.type : void 0,
            constraints: (0, d.exists)(t, "constraints") ? t.constraints : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function J(e) {
        var t;
        return null == (t = e) ? t : {
            name: t.name,
            requiredParts: (0, d.exists)(t, "requiredParts") ? t.requiredParts : void 0,
            optionalParts: (0, d.exists)(t, "optionalParts") ? t.optionalParts : void 0,
            translationKey: (0, d.exists)(t, "translationKey") ? t.translationKey : void 0
        }
    }

    function H(e) {
        var t;
        return null == (t = e) ? t : {
            id: t.id,
            agreementType: t.agreementType,
            clientType: t.clientType,
            regulationType: t.regulationType,
            displayUrl: t.displayUrl
        }
    }

    function W(e) {
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

    function Z(e, t) {
        return null == e ? e : {
            keys: e.keys.map(X)
        }
    }
    var $ = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.applicationCreateApplicationForGroupRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new d.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling applicationCreateApplicationForGroup.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.RequiredError("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForGroup.");
                                return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/groups/{groupId}/applications".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/applications",
                                    method: "POST",
                                    headers: n,
                                    query: i,
                                    body: W(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return K(e)
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new d.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling applicationCreateApplicationForUser.");
                                if (null === e.applicationCreateApplicationForUserRequest || void 0 === e.applicationCreateApplicationForUserRequest) throw new d.RequiredError("applicationCreateApplicationForUserRequest", "Required parameter requestParameters.applicationCreateApplicationForUserRequest was null or undefined when calling applicationCreateApplicationForUser.");
                                return i = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/users/{userId}/applications".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/users/{userId}/applications",
                                    method: "POST",
                                    headers: n,
                                    query: i,
                                    body: W(e.applicationCreateApplicationForUserRequest)
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return K(e)
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.VoidApiResponse(r)]
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return U(e)
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/applications/metadata",
                                    schemaPath: "/v1/applications/metadata",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        isCreateUserApplicationsAllowed: e.isCreateUserApplicationsAllowed,
                                        isViewUserApplicationsAllowed: e.isViewUserApplicationsAllowed,
                                        isUpdateUserApplicationsAllowed: e.isUpdateUserApplicationsAllowed,
                                        isDeleteUserApplicationsAllowed: e.isDeleteUserApplicationsAllowed,
                                        actions: e.actions.map(R),
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.VoidApiResponse(r)]
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.VoidApiResponse(r)]
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return U(e)
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
                    var i, n, r, o;
                    return m(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.applicationId || void 0 === e.applicationId) throw new d.RequiredError("applicationId", "Required parameter requestParameters.applicationId was null or undefined when calling applicationUploadApplicationImage.");
                                if (null === e.imageFile || void 0 === e.imageFile) throw new d.RequiredError("imageFile", "Required parameter requestParameters.imageFile was null or undefined when calling applicationUploadApplicationImage.");
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), r = (0, d.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.imageFile && r.append("imageFile", e.imageFile), [4, this.request({
                                    path: "/v1/applications/{applicationId}/image".replace("{".concat("applicationId", "}"), encodeURIComponent(String(e.applicationId))),
                                    schemaPath: "/v1/applications/{applicationId}/image",
                                    method: "POST",
                                    headers: n,
                                    query: i,
                                    body: r
                                }, t)];
                            case 1:
                                return o = a.sent(), [2, new d.JSONApiResponse(o, function(e) {
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.VoidApiResponse(r)]
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.VoidApiResponse(r)]
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
        Y = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.authorizationDeleteAuthorizationRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.VoidApiResponse(r)]
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return T(e)
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return z(e)
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.cursor && (i.cursor = e.cursor), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorizations",
                                    schemaPath: "/v1/authorizations",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        authorizations: e.authorizations.map(T),
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
        Q = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            v(t, e), t.prototype.certificateGetAccessTokenCertificatesRaw = function(e, t) {
                return f(this, void 0, void 0, function() {
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/access-tokens",
                                    schemaPath: "/v1/certificates/access-tokens",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return Z(e)
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certs",
                                    schemaPath: "/v1/certs",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return Z(e)
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/certificates/identity-tokens",
                                    schemaPath: "/v1/certificates/identity-tokens",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return Z(e)
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/.well-known/openid-configuration",
                                    schemaPath: "/.well-known/openid-configuration",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.VoidApiResponse(r)]
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                            responseTypes: e.responseTypes.map(q),
                                            redirectUri: e.redirectUri,
                                            scopes: e.scopes.map(P),
                                            state: e.state,
                                            nonce: e.nonce,
                                            codeChallenge: e.codeChallenge,
                                            codeChallengeMethod: e.codeChallengeMethod,
                                            resourceInfos: void 0 === e.resourceInfos ? void 0 : null === e.resourceInfos ? null : e.resourceInfos.map(g)
                                        }
                                    }(e.permissionRequestCreateAuthorizationGrantRequest)
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, void 0 !== e.clientId && (i.client_id = e.clientId), void 0 !== e.responseType && (i.response_type = e.responseType), void 0 !== e.redirectUri && (i.redirect_uri = e.redirectUri), void 0 !== e.scope && (i.scope = e.scope), void 0 !== e.state && (i.state = e.state), void 0 !== e.nonce && (i.nonce = e.nonce), void 0 !== e.prompt && (i.prompt = e.prompt), void 0 !== e.codeChallenge && (i.code_challenge = e.codeChallenge), void 0 !== e.codeChallengeMethod && (i.code_challenge_method = e.codeChallengeMethod), void 0 !== e.rlt && (i.rlt = e.rlt), void 0 !== e.studioTraceId && (i.studio_trace_id = e.studioTraceId), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/authorize",
                                    schemaPath: "/v1/authorize",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.VoidApiResponse(r)]
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
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
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(S),
                                        responseTypes: e.responseTypes.map(I),
                                        promptTypes: e.promptTypes.map(x),
                                        userAgreements: e.userAgreements.map(H),
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, void 0 !== e.returnBetaScopes && (i.returnBetaScopes = e.returnBetaScopes), n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scope-configuration",
                                    schemaPath: "/v1/scope-configuration",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        scopeTypes: e.scopeTypes.map(F),
                                        targetTypes: e.targetTypes.map(D),
                                        targetParts: e.targetParts.map(N),
                                        products: e.products.map(_),
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
                    var i, n, r;
                    return m(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/scopes",
                                    schemaPath: "/v1/scopes",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        scopes: e.scopes.map(L),
                                        scopeTypes: e.scopeTypes.map(B),
                                        targetTypes: e.targetTypes.map(J),
                                        targetParts: e.targetParts.map(j),
                                        products: e.products.map(G),
                                        operations: e.operations.map(E),
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
                var i, n, r, o;
                return m(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenGetTokenAuthorizationResources.");
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), r = new URLSearchParams, void 0 !== e.token && r.append("token", e.token), void 0 !== e.clientId && r.append("client_id", e.clientId), void 0 !== e.clientSecret && r.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/resources",
                                schemaPath: "/v1/token/resources",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: r
                            }, t)];
                        case 1:
                            return o = a.sent(), [2, new d.JSONApiResponse(o, function(e) {
                                return z(e)
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
                var i, n, r, o;
                return m(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenIntrospectToken.");
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), r = new URLSearchParams, void 0 !== e.token && r.append("token", e.token), void 0 !== e.clientId && r.append("client_id", e.clientId), void 0 !== e.clientSecret && r.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/introspect",
                                schemaPath: "/v1/token/introspect",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: r
                            }, t)];
                        case 1:
                            return o = a.sent(), [2, new d.JSONApiResponse(o, function(e) {
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
                var i, n, r, o;
                return m(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.token || void 0 === e.token) throw new d.RequiredError("token", "Required parameter requestParameters.token was null or undefined when calling tokenRevokeToken.");
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), r = new URLSearchParams, void 0 !== e.token && r.append("token", e.token), void 0 !== e.clientId && r.append("client_id", e.clientId), void 0 !== e.clientSecret && r.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token/revoke",
                                schemaPath: "/v1/token/revoke",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: r
                            }, t)];
                        case 1:
                            return o = a.sent(), [2, new d.VoidApiResponse(o)]
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
                var i, n, r, o;
                return m(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.grantType || void 0 === e.grantType) throw new d.RequiredError("grantType", "Required parameter requestParameters.grantType was null or undefined when calling tokenUseAuthorizationGrant.");
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), (0, d.canConsumeForm)([{
                                contentType: "application/x-www-form-urlencoded"
                            }]), r = new URLSearchParams, void 0 !== e.grantType && r.append("grant_type", e.grantType), void 0 !== e.code && r.append("code", e.code), void 0 !== e.codeVerifier && r.append("code_verifier", e.codeVerifier), void 0 !== e.refreshToken && r.append("refresh_token", e.refreshToken), void 0 !== e.clientId && r.append("client_id", e.clientId), void 0 !== e.clientSecret && r.append("client_secret", e.clientSecret), [4, this.request({
                                path: "/v1/token",
                                schemaPath: "/v1/token",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: r
                            }, t)];
                        case 1:
                            return o = a.sent(), [2, new d.JSONApiResponse(o, function(e) {
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
                var i, n, r;
                return m(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/userinfo",
                                schemaPath: "/v1/userinfo",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return r = o.sent(), [2, new d.JSONApiResponse(r, function(e) {
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
    }(d.BaseAPI), e.s(["ApplicationApi", 0, $, "ApplicationAuthorizationsApiModelsEnumErrorCode", 0, {
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
    }, "AuthorizationApi", 0, Y, "DiscoveryApi", 0, Q, "PermissionRequestApi", 0, ee, "RobloxOpenCloudScopeManagementModelsAuthenticationSystem", 0, {
        CloudAuthentication: "CloudAuthentication",
        OAuth2: "OAuth2",
        ExperienceAuth: "ExperienceAuth"
    }, "ScopeApi", 0, et], 703440);
    let ei = (0, i.createContext)(null);
    ei.displayName = "StudioResources";
    let en = (0, r.makeStyles)()(() => ({
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
    var er, eo = e => {
            let {
                logoSrc: t,
                translations: n
            } = e, {
                classes: {
                    studioIcon: r,
                    dialogText: l
                }
            } = en();
            return i.default.createElement(i.default.Fragment, null, i.default.createElement(o.Grid, {
                container: !0,
                "data-testid": "studio-dialog-loading",
                direction: "column",
                alignItems: "center"
            }, i.default.createElement("img", {
                width: 64,
                className: r,
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
                onClose: r
            } = e, {
                classes: {
                    closeIcon: s,
                    studioIcon: c,
                    dialogText: p
                }
            } = en();
            return i.default.createElement(o.Grid, {
                container: !0,
                "data-testid": "studio-dialog-error",
                direction: "column",
                alignItems: "center"
            }, i.default.createElement(l.IconButton, {
                className: s,
                color: "secondary",
                "aria-label": "close",
                onClick: r,
                size: "large"
            }, i.default.createElement(u.CloseIcon, null)), i.default.createElement("img", {
                width: 64,
                className: c,
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
                translations: r,
                onClose: s,
                onDownload: p
            } = e, {
                classes: {
                    closeIcon: d,
                    studioIcon: h,
                    dialogText: v
                }
            } = en();
            return i.default.createElement(o.Grid, {
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
            }, i.default.createElement(u.CloseIcon, null)), i.default.createElement("img", {
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
            }, r["Message.StartYourCreation"]), i.default.createElement(c.Button, {
                "data-testid": "cancel-studio-dialog-button",
                variant: "contained",
                onClick: () => {
                    p(), window.open(t, "_blank")
                },
                "aria-label": r["Action.DownloadStudio"]
            }, r["Action.DownloadStudio"]))
        };
    let el = "sitetest1",
        eu = "sitetest2",
        ec = "sitetest3",
        ep = "production",
        ed = "luobu";
    var eh = ((er = {}).Default = "Default", er.ReturnFromLogin = "ReturnFromLogin", er.EditPlace = "EditPlace", er.ViewAsset = "ViewAsset", er);
    let ev = async (e, t, i) => {
        let n = "".concat(e, "/product-experimentation-platform/v1/projects/1/layers/").concat(t, "/values?parameters=").concat(i);
        return (await fetch(n, {
            headers: {
                "Content-Type": "application/json"
            },
            credentials: "include"
        })).json()
    }, ef = async e => {
        var t, i, r, o, a;
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
                enablePersonalizedInstaller: null != (r = t.enablePersonalizedInstaller) && r,
                enableDummyCodeInInstaller: null != (o = t.enableDummyCodeInInstaller) && o,
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

    function ew(e) {
        let t = new Uint8Array(e);
        globalThis.crypto.getRandomValues(t);
        let i = "";
        return t.forEach(e => {
            i += String.fromCharCode(e)
        }), btoa(i)
    }
    let eb = async e => {
        let {
            clientId: t,
            bedev2BasePath: i
        } = e, n = new ee(new d.Configuration({
            basePath: "".concat(i, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), r = ew(64);
        try {
            let e = await em(i);
            if (null == e ? void 0 : e.enableDummyCodeInInstaller) return ew(33).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/, "");
            if (!e || !e.enablePersonalizedInstaller && !e.enablePersonalizedInstallerInMac || "function" != typeof n.permissionRequestCreateMagicAuthorizationGrant) return;
            return (await n.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: t,
                    scopes: ey,
                    nonce: r
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
    }], eg = async e => {
        let {
            clientId: t,
            bedev2BasePath: i
        } = e, n, r, o = new ee(new d.Configuration({
            basePath: "".concat(i, "/oauth"),
            credentials: "include",
            enableMrRouter: !0
        })), a = (n = new Uint8Array(64), globalThis.crypto.getRandomValues(n), r = "", n.forEach(e => {
            r += String.fromCharCode(e)
        }), btoa(r));
        try {
            let e = await em(i);
            if (!e || !e.enablePersonalizedStudioLaunch && !e.enablePersonalizedStudioLaunchInMac || !("permissionRequestCreateMagicAuthorizationGrant" in o) || "function" != typeof o.permissionRequestCreateMagicAuthorizationGrant) return;
            return (await o.permissionRequestCreateMagicAuthorizationGrant({
                permissionRequestCreateMagicAuthorizationGrantRequest: {
                    clientId: t,
                    scopes: eA,
                    nonce: a
                }
            })).code
        } catch (e) {
            return
        }
    }, eR = e => {
        let t = ["".concat(e.protocolScheme, ":1"), "launchtime:".concat(Date.now()), "avatar", "browsertrackerid:".concat((() => {
            let e = (0, n.getCookieValueByKey)("RBXEventTrackerV2") || (0, n.getCookieValueByKey)("RBXEventTracker");
            if (e) {
                let t = e.match(/browserid=([^&]*)/i);
                if (t) return t[1] || ""
            }
            return ""
        })()), "robloxLocale:".concat(e.locale), "gameLocale:".concat(e.locale), "channel:".concat(e.channel), "browser:".concat(n.device.getCurrentBrowser()), "userId:".concat(e.userId), "distributorType:".concat(e.distributorType)];
        return void 0 !== e.authCode && "" !== e.authCode && t.push("authCode:".concat(e.authCode), "authCodeType:magic"), void 0 !== e.baseUrl && t.push("baseUrl:".concat(encodeURIComponent(e.baseUrl))), e.task === eh.ViewAsset ? (t.push("launchmode:asset"), t.push("assetid:".concat(e.assetId))) : (t.push("launchmode:edit"), e.task === eh.EditPlace && t.push("task:".concat(e.task), "placeId:".concat(e.placeId), "universeId:".concat(e.universeId)), (e.task === eh.Default || e.task === eh.ReturnFromLogin) && t.push("task:".concat(e.task))), t.join("+")
    }, ex = (0, r.makeStyles)()(e => ({
        dialog: {
            backgroundColor: e.palette.background.media,
            padding: "40px 20px 30px 20px",
            minWidth: 400
        }
    }));
    async function eI(e) {
        return Array.from(new Uint8Array(await crypto.subtle.digest("SHA-1", new TextEncoder().encode(e)))).map(e => e.toString(16).padStart(2, "0")).join("")
    }
    let eq = {
            [el]: "5248896133416875863",
            [eu]: "3992715735343249042",
            [ec]: "5462362171564719537",
            [ep]: "7968549422692352298"
        },
        eS = {
            [el]: "6593031293946509533",
            [eu]: "6280195288255344888",
            [ec]: "5437780827214302073",
            [ep]: "6154550030602747221"
        },
        eP = "https://setup.c.robloxdev.cn",
        eC = "".concat(eP, "/cjv/RobloxStudioInstallerCJV.exe"),
        eU = "".concat(eP, "/mac/cjv/RobloxStudioCJV.dmg");
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
            target: r,
            fetchers: o,
            errorHandler: a
        } = e, s, l = r === ed ? eS[i] : eq[i];
        return {
            logoSrc: t,
            downloadURL: (s = (0, n.getCurrentPlatform)(), r === ed ? s === n.Platform.macOS ? eU : eC : i === ep ? "https://www.roblox.com/download/studio" : "https://www.".concat(i, ".robloxlabs.com/download/studio")),
            bedev2BasePath: i === ep ? "https://apis.roblox.com" : "https://apis.".concat(i, ".robloxlabs.com"),
            clientId: l,
            async fetchUserChannel() {
                let e = await o.userChannel();
                return void 0 === e || "LIVE" === e.toUpperCase() ? "" : e
            },
            onError(e, t) {
                null == a || a(e, t)
            }
        }
    }, "useStudio", 0, (e, t) => {
        let r = (0, n.getCurrentPlatform)(),
            o = function() {
                let e = (0, i.useContext)(ei);
                if (null === e) throw Error("Cannot load required studio resources, please make sure the provider has been properly set up");
                return e
            }(),
            {
                classes: {
                    dialog: a
                }
            } = ex(),
            [s, l] = (0, i.useState)(),
            [u, c] = (0, i.useState)(),
            d = (0, i.useRef)(s),
            h = (0, i.useRef)(void 0),
            v = (0, i.useCallback)(async () => {
                let e = await eb(o);
                return void 0 === e ? o.downloadURL : "".concat(o.downloadURL, "?code=").concat(e)
            }, [o]),
            f = (0, i.useCallback)(async () => void 0 === u ? void 0 : eI(u), [u]),
            m = (0, i.useCallback)(e => {
                h.current = e
            }, []),
            y = (0, i.useCallback)(e => {
                d.current = e, l(e)
            }, []),
            w = (0, i.useCallback)(() => {
                "Download" === d.current && (m(void 0), y(void 0))
            }, [m, y]);
        (0, i.useEffect)(() => (window.addEventListener("blur", w), () => {
            window.removeEventListener("blur", w)
        }), [w]);
        let b = (0, i.useCallback)(async (e, i) => {
                let {
                    userId: n,
                    locale: r,
                    protocolScheme: a,
                    distributorType: s,
                    baseUrl: l
                } = i;
                try {
                    var u, p, d, h;
                    let i, v;
                    m(e), y("Loading"), null == t || null == (p = t.startAttempt) || p.call(t, e);
                    let [f, w, b] = await Promise.all([o.fetchUserChannel(), eb(o), eg(o)]);
                    c(w);
                    let A = {
                            userId: null != (u = null == n ? void 0 : n.toString()) ? u : "",
                            locale: r,
                            protocolScheme: a,
                            distributorType: s,
                            baseUrl: l,
                            channel: f,
                            authCode: b
                        },
                        g = "";
                    switch (e.task) {
                        case eh.EditPlace:
                            g = eR({
                                ...A,
                                task: e.task,
                                universeId: e.universeId,
                                placeId: e.placeId
                            });
                            break;
                        case eh.ViewAsset:
                            g = eR({
                                ...A,
                                task: e.task,
                                assetId: e.assetId
                            });
                            break;
                        case eh.Default:
                        case eh.ReturnFromLogin:
                            g = eR({
                                ...A,
                                task: e.task
                            })
                    }
                    h = g, (i = document.querySelector('[data-testid="studio-protocol-iframe"]')) && i.remove(), (v = document.createElement("iframe")).style.display = "none", v.src = h, v.setAttribute("data-testid", "studio-protocol-iframe"), document.body.appendChild(v), null == t || null == (d = t.startSuccess) || d.call(t, e), await new Promise(e => {
                        setTimeout(e, 3e3)
                    }), y("Download")
                } catch (t) {
                    y("Error"), o.onError(t instanceof Error ? t : Error(String(t)), e)
                }
            }, [t, m, y, o]),
            A = void 0 === u ? o.downloadURL : "".concat(o.downloadURL, "?code=").concat(u);
        return {
            open: b,
            dialog: (0, i.useMemo)(() => i.default.createElement(p.Dialog, {
                classes: {
                    paper: a
                },
                maxWidth: "XSmall",
                open: void 0 !== s
            }, "Loading" === s && i.default.createElement(eo, {
                logoSrc: o.logoSrc,
                translations: e
            }), "Error" === s && i.default.createElement(ea, {
                onClose: () => {
                    m(void 0), y(void 0)
                },
                logoSrc: o.logoSrc,
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
                logoSrc: o.logoSrc,
                translations: e
            })), [a, s, f, A, t, m, y, o.logoSrc, e]),
            isCompatible: r === n.Platform.Windows || r === n.Platform.macOS,
            getStudioDownloadUrlAsync: v
        }
    }], 581577)
}]);

//# debugId=bbe2e81d-2bb9-b2eb-ed56-1613913ca6e1
//# sourceMappingURL=34-v-mnsaqm-l.js.map