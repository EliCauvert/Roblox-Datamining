;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4dda8660-7f92-a262-1e11-b09d971b25ca")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 665869, 729904, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "groups",
            name: "enableGroupGameEarlyTesters",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "groups",
            name: "enableGroupModerationPage",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "groups",
            name: "enableGroupDeactivation",
            defaultValue: !1
        });
    e.s(["enableGroupDeactivation", 0, n, "enableGroupGameEarlyTesters", 0, a, "enableGroupModerationPage", 0, o], 665869), e.s(["default", 0, function() {
        return "production"
    }], 729904)
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
        o = e.i(230505);
    e.i(734994), e.s(["N", 0, function(e) {
        let {
            children: n,
            defer: r = !1,
            fallback: l = null
        } = e, [i, c] = t.useState(!1);
        return (0, o.u)(() => {
            r || c(!0)
        }, [r]), t.useEffect(() => {
            r && c(!0)
        }, [r]), (0, a.jsx)(t.Fragment, {
            children: i ? n : l
        })
    }])
}, 844333, e => {
    "use strict";
    var t = e.i(546995);
    e.s(["NoSSR", () => t.N])
}, 610873, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340);

    function o(e) {
        return "small" === e ? 16 : 20
    }

    function n(e) {
        return "small" === e ? 18 : 24
    }
    var r = e.i(863605),
        l = e.i(154502),
        i = e.i(787802),
        c = e.i(690569),
        s = e.i(817717),
        d = e.i(945146),
        u = e.i(251635),
        p = e.i(51928),
        m = e.i(221628),
        h = e.i(121880);

    function f(e) {
        return (0, c.g)("MuiSwitch", e)
    }
    e.i(465957);
    var y = (0, i.g)("MuiSwitch", ["root", "edgeStart", "edgeEnd", "switchBase", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium", "checked", "disabled", "input", "thumb", "track"]);
    let g = ["className", "color", "edge", "size", "sx"],
        b = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, a.edge && t["edge".concat((0, c.a)(a.edge))], t["size".concat((0, c.a)(a.size))]]
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
                    ["& .".concat(y.thumb)]: {
                        width: 16,
                        height: 16
                    },
                    ["& .".concat(y.switchBase)]: {
                        padding: 4,
                        ["&.".concat(y.checked)]: {
                            transform: "translateX(16px)"
                        }
                    }
                }
            }]
        }),
        k = (0, u.s)(p.S, {
            name: "MuiSwitch",
            slot: "SwitchBase",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.switchBase, {
                    ["& .".concat(y.input)]: t.input
                }, "default" !== a.color && t["color".concat((0, c.a)(a.color))]]
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
                ["&.".concat(y.checked)]: {
                    transform: "translateX(20px)"
                },
                ["&.".concat(y.disabled)]: {
                    color: t.vars ? t.vars.palette.Switch.defaultDisabledColor : "".concat("light" === t.palette.mode ? t.palette.grey[100] : t.palette.grey[600])
                },
                ["&.".concat(y.checked, " + .").concat(y.track)]: {
                    opacity: .5
                },
                ["&.".concat(y.disabled, " + .").concat(y.track)]: {
                    opacity: t.vars ? t.vars.opacity.switchTrackDisabled : "" + ("light" === t.palette.mode ? .12 : .2)
                },
                ["& .".concat(y.input)]: {
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
                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.action.activeChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, c.b)(t.palette.action.active, t.palette.action.hoverOpacity),
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
                            ["&.".concat(y.checked)]: {
                                color: (t.vars || t).palette[a].main,
                                "&:hover": {
                                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette[a].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, c.b)(t.palette[a].main, t.palette.action.hoverOpacity),
                                    "@media (hover: none)": {
                                        backgroundColor: "transparent"
                                    }
                                },
                                ["&.".concat(y.disabled)]: {
                                    color: t.vars ? t.vars.palette.Switch["".concat(a, "DisabledColor")] : "".concat("light" === t.palette.mode ? (0, c.l)(t.palette[a].main, .62) : (0, c.j)(t.palette[a].main, .55))
                                }
                            },
                            ["&.".concat(y.checked, " + .").concat(y.track)]: {
                                backgroundColor: (t.vars || t).palette[a].main
                            }
                        }
                    }
                })]
            }
        }),
        C = (0, u.s)("span", {
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
        w = a.forwardRef(function(e, t) {
            let a = (0, h.u)({
                    props: e,
                    name: "MuiSwitch"
                }),
                {
                    className: o,
                    color: n = "primary",
                    edge: r = !1,
                    size: l = "medium",
                    sx: i
                } = a,
                s = (0, c._)(a, g),
                p = (0, d._)({}, a, {
                    color: n,
                    edge: r,
                    size: l
                }),
                y = (e => {
                    let {
                        classes: t,
                        edge: a,
                        size: o,
                        color: n,
                        checked: r,
                        disabled: l
                    } = e, i = {
                        root: ["root", a && "edge".concat((0, c.a)(a)), "size".concat((0, c.a)(o))],
                        switchBase: ["switchBase", "color".concat((0, c.a)(n)), r && "checked", l && "disabled"],
                        thumb: ["thumb"],
                        track: ["track"],
                        input: ["input"]
                    }, s = (0, u.a)(i, f, t);
                    return (0, d._)({}, t, s)
                })(p),
                w = (0, m.jsx)(v, {
                    className: y.thumb,
                    ownerState: p
                });
            return (0, m.jsxs)(b, {
                className: (0, u.c)(y.root, o),
                sx: i,
                ownerState: p,
                children: [(0, m.jsx)(k, (0, d._)({
                    type: "checkbox",
                    icon: w,
                    checkedIcon: w,
                    ref: t,
                    ownerState: p
                }, s, {
                    classes: (0, d._)({}, y, {
                        root: y.switchBase
                    })
                })), (0, m.jsx)(C, {
                    className: y.track,
                    ownerState: p
                })]
            })
        });
    var S = (0, r.default)({
            name: "Switch"
        })(function(e, t, a) {
            var r, l, i, c, d = t.size;
            return {
                root: ((r = {})["&:has(> .".concat(y.colorPrimary, ".").concat(y.disabled, ".").concat(y.checked, ")")] = {
                    opacity: .5
                }, r["&:has(> .".concat(y.colorSecondary, ".").concat(y.disabled, ")")] = {
                    opacity: .5
                }, r),
                switchBase: ((l = {
                    color: e.palette.actionV2.primary.fill
                })["&.".concat(y.checked, " + .").concat(y.track, ".").concat(a.track)] = {
                    opacity: .38
                }, l["&.".concat(y.disabled, " + .").concat(y.track, ".").concat(a.track)] = {
                    opacity: .38
                }, l),
                thumb: {
                    position: "relative",
                    pointerEvents: "none",
                    width: o(d),
                    height: o(d),
                    borderRadius: "50%",
                    boxShadow: e.elevation.subtle
                },
                track: {
                    opacity: .38
                },
                progress: {
                    color: e.palette.actionV2.primaryBrand.fill,
                    position: "absolute",
                    top: (o(d) - n(d)) / 2,
                    left: (o(d) - n(d)) / 2,
                    zIndex: 1
                },
                colorPrimary: ((i = {})["& .".concat(y.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, i["& .".concat(y.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, i["&.".concat(y.checked, " .").concat(y.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, i["&.".concat(y.checked, " .").concat(y.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill,
                    opacity: .38
                }, i["&.".concat(y.checked, " .").concat(s.c.root)] = {
                    color: e.palette.actionV2.primary.fill
                }, i["&.".concat(y.disabled, " .").concat(y.thumb)] = {
                    background: e.palette.components.switch.disabledKnob
                }, i["&.".concat(y.disabled, " .").concat(y.track)] = {
                    background: e.palette.components.switch.slideFill
                }, i["&.".concat(y.disabled, ".").concat(y.checked, " .").concat(y.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, i["&.".concat(y.disabled, ".").concat(y.checked, " .").concat(y.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, i["&.".concat(y.disabled, " .").concat(s.c.root)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, i),
                colorSecondary: ((c = {})["& .".concat(y.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, c["& .".concat(y.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, c)
            }
        }),
        E = (0, a.forwardRef)(function(e, r) {
            var i, c = e.classes,
                d = e.color,
                u = e.loading,
                p = e.size,
                m = e.checkedIcon,
                h = e.icon,
                f = e["aria-label"],
                g = e.inputProps,
                b = e.className,
                k = (0, t.a)(e, ["classes", "color", "loading", "size", "checkedIcon", "icon", "aria-label", "inputProps", "className"]),
                C = S((0, t._)((0, t._)({}, k), {
                    loading: u,
                    size: p,
                    checkedIcon: m,
                    icon: h,
                    "aria-label": f
                }), {
                    props: {
                        classes: (0, l.default)(c, b)
                    }
                }).classes,
                v = C.thumb,
                E = C.progress,
                A = (0, t.a)(C, ["thumb", "progress"]),
                D = a.default.createElement("div", {
                    className: "".concat(y.thumb, " ").concat(v)
                }, u && a.default.createElement(s.C, {
                    thickness: ((i = n(p)) - o(p)) * 44 / (2 * i),
                    size: n(p),
                    classes: {
                        root: E
                    }
                }));
            return a.default.createElement(w, (0, t._)({}, k, {
                checkedIcon: null != m ? m : D,
                classes: A,
                color: void 0 === d ? "primary" : d,
                icon: null != h ? h : D,
                ref: r,
                size: p,
                inputProps: (0, t._)((0, t._)({}, g), {
                    "aria-label": f
                })
            }))
        });
    e.s(["Switch", 0, E], 610873)
}, 87660, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "LoadableContext", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let o = e.r(2879)._(e.r(416340)).default.createContext(null)
}, 777553, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "default", {
        enumerable: !0,
        get: function() {
            return p
        }
    });
    let o = e.r(2879)._(e.r(416340)),
        n = e.r(87660),
        r = [],
        l = [],
        i = !1;

    function c(e) {
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
    class s {
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
            let c = Object.assign({
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
                    let e = new s(t, c);
                    d = {
                        getCurrentValue: e.getCurrentValue.bind(e),
                        subscribe: e.subscribe.bind(e),
                        retry: e.retry.bind(e),
                        promise: e.promise.bind(e)
                    }
                }
                return d.promise()
            }
            if ("u" < typeof window && r.push(u), !i && "u" > typeof window) {
                let t = c.webpack && "function" == typeof e.t.resolveWeak ? c.webpack() : c.modules;
                t && l.push(e => {
                    for (let a of t)
                        if (e.includes(a)) return u()
                })
            }

            function p(e, t) {
                let a;
                u(), (a = o.default.useContext(n.LoadableContext)) && Array.isArray(c.modules) && c.modules.forEach(e => {
                    a(e)
                });
                let r = o.default.useSyncExternalStore(d.subscribe, d.getCurrentValue, d.getCurrentValue);
                return o.default.useImperativeHandle(t, () => ({
                    retry: d.retry
                }), []), o.default.useMemo(() => {
                    var t;
                    return r.loading || r.error ? o.default.createElement(c.loading, {
                        isLoading: r.loading,
                        pastDelay: r.pastDelay,
                        timedOut: r.timedOut,
                        error: r.error,
                        retry: d.retry
                    }) : r.loaded ? o.default.createElement((t = r.loaded) && t.default ? t.default : t, e) : null
                }, [e, r])
            }
            return p.preload = () => u(), p.displayName = "LoadableComponent", o.default.forwardRef(p)
        }(c, t)
    }

    function u(e, t) {
        let a = [];
        for (; e.length;) {
            let o = e.pop();
            a.push(o(t))
        }
        return Promise.all(a).then(() => {
            if (e.length) return u(e, t)
        })
    }
    d.preloadAll = () => new Promise((e, t) => {
        u(r).then(e, t)
    }), d.preloadReady = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
        return new Promise(t => {
            let a = () => (i = !0, t());
            u(l, e).then(a, a)
        })
    }, "u" > typeof window && (window.__NEXT_PRELOADREADY = d.preloadReady);
    let p = d
}, 201897, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    });
    var o = {
        default: function() {
            return u
        },
        noSSR: function() {
            return d
        }
    };
    for (var n in o) Object.defineProperty(a, n, {
        enumerable: !0,
        get: o[n]
    });
    let r = e.r(2879),
        l = e.r(221628);
    e.r(416340);
    let i = r._(e.r(777553)),
        c = "u" < typeof window;

    function s(e) {
        return {
            default: (null == e ? void 0 : e.default) || e
        }
    }

    function d(e, t) {
        if (delete t.webpack, delete t.modules, !c) return e(t);
        let a = t.loading;
        return () => (0, l.jsx)(a, {
            error: null,
            isLoading: !0,
            pastDelay: !1,
            timedOut: !1
        })
    }

    function u(e, t) {
        let a = i.default,
            o = {
                loading: e => {
                    let {
                        error: t,
                        isLoading: a,
                        pastDelay: o
                    } = e;
                    return null
                }
            };
        e instanceof Promise ? o.loader = () => e : "function" == typeof e ? o.loader = e : "object" == typeof e && (o = {
            ...o,
            ...e
        });
        let n = (o = {
            ...o,
            ...t
        }).loader;
        return (o.loadableGenerated && (o = {
            ...o,
            ...o.loadableGenerated
        }, delete o.loadableGenerated), "boolean" != typeof o.ssr || o.ssr) ? a({
            ...o,
            loader: () => null != n ? n().then(s) : Promise.resolve(s(() => null))
        }) : (delete o.webpack, delete o.modules, d(a, o))
    }("function" == typeof a.default || "object" == typeof a.default && null !== a.default) && void 0 === a.default.__esModule && (Object.defineProperty(a.default, "__esModule", {
        value: !0
    }), Object.assign(a.default, a), t.exports = a.default)
}, 507742, (e, t, a) => {
    t.exports = e.r(201897)
}, 260241, e => {
    "use strict";
    var t = e.i(79187),
        a = e.i(416340),
        o = e.i(697973),
        n = e.i(532045),
        r = e.i(83265),
        l = e.i(686762),
        i = e.i(16397),
        c = e.i(345886),
        s = e.i(623983),
        d = e.i(748893),
        u = e.i(387660),
        p = e.i(145842),
        m = e.i(943402),
        h = e.i(40262),
        f = e.i(49152),
        y = e.i(11473),
        g = e.i(610873),
        b = e.i(378645),
        b = b,
        k = e.i(226519),
        C = e.i(102725),
        v = e.i(668539),
        w = e.i(976457),
        S = e.i(252842);
    let E = "https://www.roblox.com/info/privacy",
        A = "{privacyPolicyLink}",
        D = "{googleAnalyticsLink}",
        B = [{
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
    var x, _, R = ((x = R || {}).BannerTitle = "Heading.CookieBanner", x.CookieBannerContent = "Description.CookieBannerContent", x.CookieBannerButton = "Action.CookieBanner", x.PrivacyPolicy = "Description.PrivacyPolicy", x.ConsentToolModalTitle = "Heading.CookieSettings", x.SaveBtn = "Action.SavePreferences", x.CancelBtn = "Action.Cancel", x.InfoCollectionHeader = "Heading.InformationCollection", x.InfoCollectionContent = "Description.InformationCollection", x.InfoCollectionHeader2 = "Heading.InformationCollection2", x.InfoCollectionContent2 = "Description.InformationCollection2", x.InfoPartnerCollectionHeader = "Heading.InformationPartnerCollection", x.InfoPartnerCollectionContent = "Description.InformationPartnerCollection", x.RBXViralAcquisition = "RBXViralAcquisition", x.RBXViralAcquisitionDescription = "Description.RBXViralAcquisition", x.RBXSource = "RBXSource", x.RBXSourceDescription = "Description.RBXSource", x.GoogleAnalytics = "Heading.GoogleAnalytics", x.OwnedBy = "Label.OwnedBy", x.GoogleInc = "Google Inc.", x.Website = "Label.Website", x.GoogleAnalyticsPurposeHeader = "Heading.GoogleAnalyticsPurpose", x.GoogleAnalyticsPurposeDescription = "Description.GoogleAnalyticsPurpose", x.CompanyCollectionHeader = "Heading.CompanyCollection", x.DataCollected = "Label.DataCollected", x.DataCollectedContent = "Description.DataCollected", x.DataSharing = "Label.DataSharing", x.DataSharingContent = "Description.DataSharing", x.DataRetention = "Label.DataRetention", x.DataRetentionContent = "Description.DataRetention", x.DataUse = "Label.DataUse", x.DataUseContent = "Description.DataUse", x.DataStorage = "Label.DataStorage", x.DataStorageContent = "Description.Undisclosed", x.RequestData = "Action.RequestData", x.SetCookieOptions = "Action.SetCookieOptions", x.DeclineAll = "Action.DeclineAll", x.AcceptAll = "Action.AcceptAll", x.EssentialCookie = "Heading.EssentialCookies", x.AnalyticsCookie = "Heading.AnalyticsCookies", x.GAReadMore = "Description.GAReadMore", x.GAReadMoreUrl = "{googleAnalyticsLink}", x);
    let P = (0, o.makeStyles)()(e => ({
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
        T = e => {
            let {
                onAcceptAll: o,
                onDeclineAll: u,
                onLearnMore: p,
                isOpen: m
            } = e, {
                translate: h
            } = (0, t.useTranslation)(), {
                classes: f
            } = P(), y = (0, r.useMediaQuery)((0, n.useTheme)().breakpoints.down("Medium")), g = (0, a.useMemo)(() => a.default.createElement(l.Link, {
                href: E,
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, h(R.PrivacyPolicy)), [h]), b = (0, a.useMemo)(() => {
                let e = h(R.CookieBannerContent);
                if (!e.includes(A)) return e;
                let t = e.split(A);
                return a.default.createElement(a.default.Fragment, null, t[0], g, t[1] || "")
            }, [h, g]);
            return a.default.createElement(i.Drawer, {
                open: m,
                onClose: u,
                anchor: "bottom",
                variant: "temporary",
                ModalProps: {
                    BackdropProps: {
                        classes: {
                            root: f.backdrop
                        }
                    }
                }
            }, a.default.createElement(c.Grid, {
                className: f.root
            }, a.default.createElement(c.Grid, {
                className: f.content
            }, a.default.createElement(s.Typography, {
                variant: "body2"
            }, b)), a.default.createElement(c.Grid, {
                className: f.actions
            }, a.default.createElement(d.Button, {
                variant: "text",
                onClick: p,
                color: "secondary"
            }, h(R.SetCookieOptions)), a.default.createElement(c.Grid, {
                className: f.buttons
            }, a.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: u,
                fullWidth: y
            }, h(R.DeclineAll)), a.default.createElement(d.Button, {
                color: "secondary",
                variant: "contained",
                onClick: o,
                fullWidth: y
            }, h(R.AcceptAll))))))
        },
        I = "RBXcb",
        M = {
            RBXViralAcquisition: !0,
            RBXSource: !0,
            GoogleAnalytics: !0
        },
        N = (0, a.createContext)(null),
        L = () => {
            let e = (0, a.useContext)(N);
            if (!e) throw Error("useCookieConsentContext must be used within a CookieConsentProvider");
            return e
        },
        O = e => {
            let t, a = Object.entries(e).map(e => {
                let [t, a] = e;
                return "".concat(t, "=").concat(a)
            }).join("&");
            Object.entries(e).forEach(e => {
                let [t, a] = e;
                a || (0, S.deleteCookie)(t)
            });
            let o = new Date;
            o.setDate(o.getDate() + 180), document.cookie = "".concat(I, "=").concat(a, "; expires=").concat(o.toUTCString(), "; path=/; domain=").concat((t = window.location.hostname.split(".")).length <= 2 ? window.location.hostname : ".".concat(t.slice(1).join(".")))
        },
        G = e => {
            let {
                cookieName: t,
                description: o
            } = e;
            return a.default.createElement("div", null, a.default.createElement(s.Typography, {
                variant: "codeDense"
            }, t), a.default.createElement(s.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, o))
        },
        V = (0, o.makeStyles)()(() => ({
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
                translate: o
            } = (0, t.useTranslation)(), {
                cookiePolicy: n
            } = L(), {
                classes: r
            } = V();
            return n && (null == (e = n.EssentialCookieList) ? void 0 : e.length) ? a.default.createElement(p.Accordion, {
                className: r.accordion
            }, a.default.createElement(m.AccordionSummary, {
                className: r.accordionSummary
            }, a.default.createElement(s.Typography, {
                variant: "h6"
            }, o(R.EssentialCookie))), a.default.createElement(h.AccordionDetails, null, n.EssentialCookieList.map(e => a.default.createElement(G, {
                key: e.cookieName,
                cookieName: e.cookieName,
                description: o(e.description)
            })))) : null
        };
    var X = ((_ = {}).RBXViralAcquisition = "RBXViralAcquisition", _.RBXSource = "RBXSource", _.GoogleAnalytics = "GoogleAnalytics", _);
    let z = e => {
            let {
                title: t,
                content: o,
                secondary: n = !1
            } = e;
            return a.default.createElement("div", null, a.default.createElement(s.Typography, {
                variant: "body2",
                color: n ? "secondary" : "primary"
            }, t), a.default.createElement(s.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, o))
        },
        H = () => {
            let {
                translate: e
            } = (0, t.useTranslation)(), o = e(R.GAReadMore);
            if (!o.includes(D)) return a.default.createElement(a.default.Fragment, null, o);
            let [n, r] = o.split(D);
            return a.default.createElement(s.Typography, {
                variant: "body2"
            }, n, a.default.createElement(l.Link, {
                href: "https://support.google.com/analytics/answer/11397207",
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, e(R.GoogleAnalytics)), r)
        },
        F = (0, o.makeStyles)()(() => ({
            button: {
                paddingLeft: 5,
                ["&.".concat(f.buttonClasses.root)]: {
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
                text: o
            } = e, {
                classes: n
            } = F();
            return a.default.createElement("div", null, a.default.createElement(d.Button, {
                className: n.button,
                variant: "text",
                component: "a",
                color: "primary",
                href: t,
                rel: "noreferrer",
                endIcon: a.default.createElement(y.OpenInNewIcon, null),
                size: "small",
                target: "_blank",
                disableRipple: !0
            }, o))
        },
        q = e => {
            let {
                isAnalyticsCookieAccepted: o,
                setIsAnalyticsCookieAccepted: n
            } = e, {
                classes: r
            } = V(), {
                translate: l
            } = (0, t.useTranslation)();
            return a.default.createElement(p.Accordion, {
                className: r.accordion
            }, a.default.createElement(m.AccordionSummary, {
                className: r.accordionSummary
            }, a.default.createElement(s.Typography, {
                variant: "h6"
            }, l(R.AnalyticsCookie)), a.default.createElement(g.Switch, {
                checked: o,
                onChange: (e, t) => {
                    n(t)
                },
                "aria-label": l(R.AnalyticsCookie),
                size: "small"
            })), a.default.createElement(h.AccordionDetails, null, a.default.createElement(G, {
                key: X.RBXViralAcquisition,
                cookieName: X.RBXViralAcquisition,
                description: l(R.RBXViralAcquisitionDescription)
            }), a.default.createElement(G, {
                key: X.RBXSource,
                cookieName: X.RBXSource,
                description: l(R.RBXSourceDescription)
            }), a.default.createElement(U, {
                href: "https://marketingplatform.google.com/about/analytics/",
                text: l(R.GoogleAnalytics)
            }), a.default.createElement(s.Typography, {
                variant: "body2",
                paragraph: !0
            }, l(R.OwnedBy), " ", "Google Inc."), a.default.createElement(z, {
                title: l(R.GoogleAnalyticsPurposeHeader),
                content: l(R.GoogleAnalyticsPurposeDescription)
            }), a.default.createElement(s.Typography, {
                variant: "body2"
            }, l(R.CompanyCollectionHeader)), B.map(e => a.default.createElement(z, {
                key: e.label,
                title: l(e.label),
                content: l(e.content),
                secondary: !0
            })), a.default.createElement(H, null)))
        },
        W = (0, o.makeStyles)()(e => ({
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
                ["&.".concat(b.d.root)]: {
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
            var o;
            let {
                open: n,
                onClose: r,
                onSave: l,
                isAnalyticsCookieAccepted: i,
                setIsAnalyticsCookieAccepted: c
            } = e, {
                translate: u
            } = (0, t.useTranslation)(), {
                classes: p
            } = W(), {
                cookiePolicy: m
            } = L();
            return m ? a.default.createElement(k.Dialog, {
                open: n,
                onClose: r
            }, a.default.createElement(C.DialogTitle, null, u(R.ConsentToolModalTitle)), a.default.createElement(v.DialogContent, {
                className: p.dialogContent
            }, a.default.createElement(s.Typography, {
                variant: "h6"
            }, u(R.InfoCollectionHeader)), a.default.createElement(s.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(R.InfoCollectionContent)), a.default.createElement(s.Typography, {
                variant: "h6"
            }, u(R.InfoCollectionHeader2)), a.default.createElement(s.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(R.InfoCollectionContent2)), a.default.createElement(s.Typography, {
                variant: "h6"
            }, u(R.InfoPartnerCollectionHeader)), a.default.createElement(s.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(R.InfoPartnerCollectionContent)), a.default.createElement(U, {
                href: "https://www.roblox.com/support",
                text: u(R.RequestData)
            }), a.default.createElement(U, {
                href: E,
                text: u(R.PrivacyPolicy)
            }), a.default.createElement("div", {
                className: p.accordionSection
            }, (null == (o = m.EssentialCookieList) ? void 0 : o.length) > 0 && a.default.createElement("div", {
                className: p.accordionContainer
            }, a.default.createElement(j, null)), a.default.createElement("div", {
                className: p.accordionContainer
            }, a.default.createElement(q, {
                isAnalyticsCookieAccepted: i,
                setIsAnalyticsCookieAccepted: c
            })))), a.default.createElement(w.DialogActions, null, a.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: r
            }, u(R.CancelBtn)), a.default.createElement(d.Button, {
                color: "primaryBrand",
                variant: "contained",
                onClick: l
            }, u(R.SaveBtn)))) : null
        },
        Q = e => {
            let {
                isOpen: t,
                onClose: o,
                onSave: n
            } = e, {
                cookiePolicy: r,
                acceptAll: l,
                declineAll: i,
                hasAcceptedAnalyticsCookie: c
            } = L(), [s, d] = (0, a.useState)(c), u = (0, a.useCallback)(() => {
                s ? l() : i(), n()
            }, [l, i, s, n]);
            return r ? a.default.createElement(K, {
                open: t,
                onClose: o,
                isAnalyticsCookieAccepted: s,
                setIsAnalyticsCookieAccepted: d,
                onSave: u
            }) : null
        },
        Y = (0, t.withTranslation)(() => {
            let {
                acceptAll: e,
                declineAll: t,
                shouldShowBanner: o
            } = L(), [n, r] = (0, a.useState)(!1), [l, i] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                o && i(!0)
            }, [o]);
            let c = (0, a.useCallback)(() => {
                    e(), i(!1)
                }, [e]),
                s = (0, a.useCallback)(() => {
                    t(), i(!1)
                }, [t]),
                d = (0, a.useCallback)(() => {
                    r(!0), i(!1)
                }, []),
                u = (0, a.useCallback)(() => {
                    r(!1), i(!0)
                }, []),
                p = (0, a.useCallback)(() => {
                    r(!1), i(!1)
                }, []);
            return a.default.createElement(a.default.Fragment, null, a.default.createElement(T, {
                isOpen: l,
                onAcceptAll: c,
                onDeclineAll: s,
                onLearnMore: d
            }), a.default.createElement(Q, {
                isOpen: n,
                onClose: u,
                onSave: p
            }))
        }, ["Feature.Tracking", "CommonUI.Controls"]);
    e.s(["CookieConsentBanner", 0, Y, "CookieConsentProvider", 0, e => {
        let {
            children: t,
            robloxSiteDomain: o,
            initialCookiePolicy: n,
            initialPreferences: r,
            forceShowBanner: l = !1
        } = e, [i, c] = (0, a.useState)(n || null), [s, d] = (0, a.useState)(r || (() => {
            if ("u" < typeof document) return M;
            let e = document.cookie.split("; ").find(e => e.startsWith("".concat(I, "=")));
            return e ? e.substring(I.length + 1).split("&").reduce((e, t) => {
                let [a, o] = t.split("=");
                return e[a] = "true" === o, e
            }, {}) : M
        })()), [u, p] = (0, a.useState)(!n), [m, h] = (0, a.useState)(null), f = (0, a.useMemo)(() => !!l || !!(null == i ? void 0 : i.ShouldDisplayCookieBannerV3) && !(!("u" < typeof document) && document.cookie.split("; ").some(e => e.startsWith("".concat(I, "=")))), [null == i ? void 0 : i.ShouldDisplayCookieBannerV3, l]);
        (0, a.useEffect)(() => {
            n || (async () => {
                try {
                    var e, t, a;
                    let n = await fetch("https://apis.".concat(o, "/guac-v2/v1/bundles/cookie-policy"));
                    if (!n.ok) throw Error("Failed to fetch cookie policy");
                    let r = await n.json();
                    c({
                        ShouldDisplayCookieBannerV3: null != (e = r.ShouldDisplayCookieBannerV3) && e,
                        NonEssentialCookieList: null != (t = r.NonEssentialCookieList) ? t : [],
                        EssentialCookieList: null != (a = r.EssentialCookieList) ? a : []
                    }), p(!1)
                } catch (e) {
                    h(e instanceof Error ? e : Error("Unknown error")), p(!1)
                }
            })()
        }, [o, n]);
        let y = (0, a.useCallback)((e, t) => {
                d(a => {
                    let o = {
                        ...a,
                        [e]: t
                    };
                    return O(o), o
                })
            }, []),
            g = (0, a.useCallback)(() => {
                if (!i) return;
                let e = i.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !0
                }), M);
                O(e), d(e)
            }, [i]),
            b = (0, a.useCallback)(() => {
                if (!i) return;
                let e = i.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !1
                }), M);
                O(e), d(e)
            }, [i]),
            k = (0, a.useMemo)(() => Object.values(s).some(e => !0 === e), [s]),
            C = (0, a.useMemo)(() => ({
                cookiePolicy: i,
                preferences: s,
                updatePreference: y,
                acceptAll: g,
                declineAll: b,
                isLoading: u,
                error: m,
                hasAcceptedAnalyticsCookie: k,
                shouldShowBanner: f
            }), [i, s, u, m, g, b, y, k, f]);
        return a.default.createElement(N.Provider, {
            value: C
        }, t)
    }, "useCookieConsentContext", 0, L], 260241)
}]);

//# debugId=4dda8660-7f92-a262-1e11-b09d971b25ca
//# sourceMappingURL=1ns4nmapussbl.js.map