;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f7f73a1f-6380-9dc2-c317-2c6b43002095")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 533968, e => {
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
}, 692587, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return Object.entries(e).reduce((e, t) => {
            let [a, o] = t;
            return Array.isArray(o) ? e[a] = o.at(0) : e[a] = o, e
        }, {})
    }, "readQueryValue", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 729904, e => {
    "use strict";
    e.s(["default", 0, function() {
        return "production"
    }])
}, 114209, 559227, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        o = e.i(237401),
        n = e.i(773057),
        r = e.i(392782);
    let l = (0, a.createContext)({
        isLoadingGame: !1,
        isErrorLoadingGame: !1,
        canConfigure: !1,
        gameDetails: null,
        refreshGameDetails: () => {
            throw Error("Not implemented")
        }
    });
    l.displayName = "Game", e.s(["default", 0, l], 559227);
    var i = e.i(721281),
        c = e.i(252842),
        s = e.i(533968);
    let u = new class {
        async getGameDetail(e, t) {
            var a, o, n;
            if (!t && this.gameDetailsMap.has(e)) return null != (a = this.gameDetailsMap.get(e)) ? a : null;
            try {
                let t = null != (o = null == (n = (await this.gamesClient.getDetails([e])).data) ? void 0 : n[0]) ? o : null;
                return t && this.gameDetailsMap.set(e, t), t
            } catch (a) {
                let t = (0, s.getResponseFromError)(a);
                if ((null == t ? void 0 : t.status) === c.StatusCodes.BAD_REQUEST) return null;
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
                let t = (0, s.getResponseFromError)(a);
                if ((null == t ? void 0 : t.status) === c.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(e, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(e)), null
            }
        }
        constructor(e, t) {
            (0, i._)(this, "gamesClient", void 0), (0, i._)(this, "developClient", void 0), (0, i._)(this, "gameDetailsMap", void 0), (0, i._)(this, "gameConfigurationMap", void 0), this.gamesClient = e, this.developClient = t, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(r.default, n.default);
    e.s(["default", 0, e => {
        let {
            requestedGameId: n,
            children: r
        } = e, i = (0, o.useRouter)(), [c, s] = (0, a.useState)(!0), [d, p] = (0, a.useState)(null), [m, h] = (0, a.useState)(null), [f, g] = (0, a.useState)(!1), y = (0, a.useRef)(0), b = (0, a.useCallback)(async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                a = y.current += 1,
                o = u.getConfiguration(e),
                n = u.getGameDetail(e, t),
                [r, l] = await Promise.allSettled([o, n]);
            a === y.current && ("fulfilled" === r.status ? p(r.value) : p(null), "fulfilled" === l.status ? (g(!1), h(l.value)) : ("rejected" === l.status ? g(!0) : g(!1), h(null)), s(!1))
        }, []), C = (0, a.useMemo)(() => {
            let {
                id: e
            } = i.query;
            return n || ("string" == typeof e ? parseInt(e, 10) : void 0)
        }, [n, i.query]), k = (0, a.useCallback)(() => C ? b(C, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [C, b]);
        (0, a.useEffect)(() => {
            try {
                if (void 0 !== C && !Number.isNaN(C) && C > 0) return void b(C);
                y.current += 1, p(null), h(null), g(!1), s(!1)
            } catch (e) {
                console.warn("Could not fetch game details for universeId ".concat(C))
            }
        }, [C, b]);
        let v = (0, a.useMemo)(() => ({
            isLoadingGame: c,
            canConfigure: d,
            gameDetails: m,
            isErrorLoadingGame: f,
            refreshGameDetails: k
        }), [c, d, m, f, k]);
        return (0, t.jsx)(l.Provider, {
            value: v,
            children: r
        })
    }, "useCurrentGame", 0, function() {
        let e = (0, a.useContext)(l);
        if (null === e) throw Error("useCurrentGame must be used within a GameProvider");
        return e
    }], 114209)
}, 627292, e => {
    "use strict";
    var t = e.i(485745);
    e.s(["accordionSummaryClasses", () => t.a])
}, 736186, e => {
    "use strict";
    var t = e.i(516367);
    e.s(["buttonClasses", () => t.b])
}, 438004, e => {
    "use strict";
    var t = e.i(416340);
    e.i(273589);
    var a = e.i(221628),
        o = e.i(969708);
    e.i(309742), e.s(["N", 0, function(e) {
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
}, 517379, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340);

    function o(e) {
        return "small" === e ? 16 : 20
    }

    function n(e) {
        return "small" === e ? 18 : 24
    }
    var r = e.i(614515),
        l = e.i(993807),
        i = e.i(696180),
        c = e.i(273589),
        s = e.i(549534),
        u = e.i(962560),
        d = e.i(42569),
        p = e.i(576881),
        m = e.i(221628),
        h = e.i(963320);

    function f(e) {
        return (0, c.g)("MuiSwitch", e)
    }
    e.i(197094);
    var g = (0, i.g)("MuiSwitch", ["root", "edgeStart", "edgeEnd", "switchBase", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium", "checked", "disabled", "input", "thumb", "track"]);
    let y = ["className", "color", "edge", "size", "sx"],
        b = (0, d.s)("span", {
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
        C = (0, d.s)(p.S, {
            name: "MuiSwitch",
            slot: "SwitchBase",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.switchBase, {
                    ["& .".concat(g.input)]: t.input
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
                            ["&.".concat(g.checked)]: {
                                color: (t.vars || t).palette[a].main,
                                "&:hover": {
                                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette[a].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, c.b)(t.palette[a].main, t.palette.action.hoverOpacity),
                                    "@media (hover: none)": {
                                        backgroundColor: "transparent"
                                    }
                                },
                                ["&.".concat(g.disabled)]: {
                                    color: t.vars ? t.vars.palette.Switch["".concat(a, "DisabledColor")] : "".concat("light" === t.palette.mode ? (0, c.l)(t.palette[a].main, .62) : (0, c.j)(t.palette[a].main, .55))
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
        k = (0, d.s)("span", {
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
        v = (0, d.s)("span", {
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
                s = (0, c._)(a, y),
                p = (0, u._)({}, a, {
                    color: n,
                    edge: r,
                    size: l
                }),
                g = (e => {
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
                    }, s = (0, d.a)(i, f, t);
                    return (0, u._)({}, t, s)
                })(p),
                w = (0, m.jsx)(v, {
                    className: g.thumb,
                    ownerState: p
                });
            return (0, m.jsxs)(b, {
                className: (0, d.c)(g.root, o),
                sx: i,
                ownerState: p,
                children: [(0, m.jsx)(C, (0, u._)({
                    type: "checkbox",
                    icon: w,
                    checkedIcon: w,
                    ref: t,
                    ownerState: p
                }, s, {
                    classes: (0, u._)({}, g, {
                        root: g.switchBase
                    })
                })), (0, m.jsx)(k, {
                    className: g.track,
                    ownerState: p
                })]
            })
        });
    var E = (0, r.default)({
            name: "Switch"
        })(function(e, t, a) {
            var r, l, i, c, u = t.size;
            return {
                root: ((r = {})["&:has(> .".concat(g.colorPrimary, ".").concat(g.disabled, ".").concat(g.checked, ")")] = {
                    opacity: .5
                }, r["&:has(> .".concat(g.colorSecondary, ".").concat(g.disabled, ")")] = {
                    opacity: .5
                }, r),
                switchBase: ((l = {
                    color: e.palette.actionV2.primary.fill
                })["&.".concat(g.checked, " + .").concat(g.track, ".").concat(a.track)] = {
                    opacity: .38
                }, l["&.".concat(g.disabled, " + .").concat(g.track, ".").concat(a.track)] = {
                    opacity: .38
                }, l),
                thumb: {
                    position: "relative",
                    pointerEvents: "none",
                    width: o(u),
                    height: o(u),
                    borderRadius: "50%",
                    boxShadow: e.elevation.subtle
                },
                track: {
                    opacity: .38
                },
                progress: {
                    color: e.palette.actionV2.primaryBrand.fill,
                    position: "absolute",
                    top: (o(u) - n(u)) / 2,
                    left: (o(u) - n(u)) / 2,
                    zIndex: 1
                },
                colorPrimary: ((i = {})["& .".concat(g.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, i["& .".concat(g.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, i["&.".concat(g.checked, " .").concat(g.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, i["&.".concat(g.checked, " .").concat(g.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill,
                    opacity: .38
                }, i["&.".concat(g.checked, " .").concat(s.c.root)] = {
                    color: e.palette.actionV2.primary.fill
                }, i["&.".concat(g.disabled, " .").concat(g.thumb)] = {
                    background: e.palette.components.switch.disabledKnob
                }, i["&.".concat(g.disabled, " .").concat(g.track)] = {
                    background: e.palette.components.switch.slideFill
                }, i["&.".concat(g.disabled, ".").concat(g.checked, " .").concat(g.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, i["&.".concat(g.disabled, ".").concat(g.checked, " .").concat(g.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, i["&.".concat(g.disabled, " .").concat(s.c.root)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, i),
                colorSecondary: ((c = {})["& .".concat(g.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, c["& .".concat(g.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, c)
            }
        }),
        D = (0, a.forwardRef)(function(e, r) {
            var i, c = e.classes,
                u = e.color,
                d = e.loading,
                p = e.size,
                m = e.checkedIcon,
                h = e.icon,
                f = e["aria-label"],
                y = e.inputProps,
                b = e.className,
                C = (0, t.a)(e, ["classes", "color", "loading", "size", "checkedIcon", "icon", "aria-label", "inputProps", "className"]),
                k = E((0, t._)((0, t._)({}, C), {
                    loading: d,
                    size: p,
                    checkedIcon: m,
                    icon: h,
                    "aria-label": f
                }), {
                    props: {
                        classes: (0, l.default)(c, b)
                    }
                }).classes,
                v = k.thumb,
                D = k.progress,
                S = (0, t.a)(k, ["thumb", "progress"]),
                A = a.default.createElement("div", {
                    className: "".concat(g.thumb, " ").concat(v)
                }, d && a.default.createElement(s.C, {
                    thickness: ((i = n(p)) - o(p)) * 44 / (2 * i),
                    size: n(p),
                    classes: {
                        root: D
                    }
                }));
            return a.default.createElement(w, (0, t._)({}, C, {
                checkedIcon: null != m ? m : A,
                classes: S,
                color: void 0 === u ? "primary" : u,
                icon: null != h ? h : A,
                ref: r,
                size: p,
                inputProps: (0, t._)((0, t._)({}, y), {
                    "aria-label": f
                })
            }))
        });
    e.s(["Switch", 0, D], 517379)
}, 283514, (e, t, a) => {
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
}, 568710, (e, t, a) => {
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
        n = e.r(283514),
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

    function u(t) {
        return function(t, a) {
            let c = Object.assign({
                    loader: null,
                    loading: null,
                    delay: 200,
                    timeout: null,
                    webpack: null,
                    modules: null
                }, a),
                u = null;

            function d() {
                if (!u) {
                    let e = new s(t, c);
                    u = {
                        getCurrentValue: e.getCurrentValue.bind(e),
                        subscribe: e.subscribe.bind(e),
                        retry: e.retry.bind(e),
                        promise: e.promise.bind(e)
                    }
                }
                return u.promise()
            }
            if ("u" < typeof window && r.push(d), !i && "u" > typeof window) {
                let t = c.webpack && "function" == typeof e.t.resolveWeak ? c.webpack() : c.modules;
                t && l.push(e => {
                    for (let a of t)
                        if (e.includes(a)) return d()
                })
            }

            function p(e, t) {
                let a;
                d(), (a = o.default.useContext(n.LoadableContext)) && Array.isArray(c.modules) && c.modules.forEach(e => {
                    a(e)
                });
                let r = o.default.useSyncExternalStore(u.subscribe, u.getCurrentValue, u.getCurrentValue);
                return o.default.useImperativeHandle(t, () => ({
                    retry: u.retry
                }), []), o.default.useMemo(() => {
                    var t;
                    return r.loading || r.error ? o.default.createElement(c.loading, {
                        isLoading: r.loading,
                        pastDelay: r.pastDelay,
                        timedOut: r.timedOut,
                        error: r.error,
                        retry: u.retry
                    }) : r.loaded ? o.default.createElement((t = r.loaded) && t.default ? t.default : t, e) : null
                }, [e, r])
            }
            return p.preload = () => d(), p.displayName = "LoadableComponent", o.default.forwardRef(p)
        }(c, t)
    }

    function d(e, t) {
        let a = [];
        for (; e.length;) {
            let o = e.pop();
            a.push(o(t))
        }
        return Promise.all(a).then(() => {
            if (e.length) return d(e, t)
        })
    }
    u.preloadAll = () => new Promise((e, t) => {
        d(r).then(e, t)
    }), u.preloadReady = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
        return new Promise(t => {
            let a = () => (i = !0, t());
            d(l, e).then(a, a)
        })
    }, "u" > typeof window && (window.__NEXT_PRELOADREADY = u.preloadReady);
    let p = u
}, 810637, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    });
    var o = {
        default: function() {
            return d
        },
        noSSR: function() {
            return u
        }
    };
    for (var n in o) Object.defineProperty(a, n, {
        enumerable: !0,
        get: o[n]
    });
    let r = e.r(2879),
        l = e.r(221628);
    e.r(416340);
    let i = r._(e.r(568710)),
        c = "u" < typeof window;

    function s(e) {
        return {
            default: (null == e ? void 0 : e.default) || e
        }
    }

    function u(e, t) {
        if (delete t.webpack, delete t.modules, !c) return e(t);
        let a = t.loading;
        return () => (0, l.jsx)(a, {
            error: null,
            isLoading: !0,
            pastDelay: !1,
            timedOut: !1
        })
    }

    function d(e, t) {
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
        }) : (delete o.webpack, delete o.modules, u(a, o))
    }("function" == typeof a.default || "object" == typeof a.default && null !== a.default) && void 0 === a.default.__esModule && (Object.defineProperty(a.default, "__esModule", {
        value: !0
    }), Object.assign(a.default, a), t.exports = a.default)
}, 109182, (e, t, a) => {
    t.exports = e.r(810637)
}, 260241, e => {
    "use strict";
    var t = e.i(79187),
        a = e.i(416340),
        o = e.i(706442),
        n = e.i(431346),
        r = e.i(620068),
        l = e.i(982234),
        i = e.i(418400),
        c = e.i(169722),
        s = e.i(199834),
        u = e.i(872204),
        d = e.i(627292),
        p = e.i(734306),
        m = e.i(731693),
        h = e.i(397810),
        f = e.i(736186),
        g = e.i(645909),
        y = e.i(517379),
        b = e.i(12839),
        b = b,
        C = e.i(291037),
        k = e.i(899819),
        v = e.i(777004),
        w = e.i(35298),
        E = e.i(252842);
    let D = "https://www.roblox.com/info/privacy",
        S = "{privacyPolicyLink}",
        A = "{googleAnalyticsLink}",
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
    var B, _, R = ((B = R || {}).BannerTitle = "Heading.CookieBanner", B.CookieBannerContent = "Description.CookieBannerContent", B.CookieBannerButton = "Action.CookieBanner", B.PrivacyPolicy = "Description.PrivacyPolicy", B.ConsentToolModalTitle = "Heading.CookieSettings", B.SaveBtn = "Action.SavePreferences", B.CancelBtn = "Action.Cancel", B.InfoCollectionHeader = "Heading.InformationCollection", B.InfoCollectionContent = "Description.InformationCollection", B.InfoCollectionHeader2 = "Heading.InformationCollection2", B.InfoCollectionContent2 = "Description.InformationCollection2", B.InfoPartnerCollectionHeader = "Heading.InformationPartnerCollection", B.InfoPartnerCollectionContent = "Description.InformationPartnerCollection", B.RBXViralAcquisition = "RBXViralAcquisition", B.RBXViralAcquisitionDescription = "Description.RBXViralAcquisition", B.RBXSource = "RBXSource", B.RBXSourceDescription = "Description.RBXSource", B.GoogleAnalytics = "Heading.GoogleAnalytics", B.OwnedBy = "Label.OwnedBy", B.GoogleInc = "Google Inc.", B.Website = "Label.Website", B.GoogleAnalyticsPurposeHeader = "Heading.GoogleAnalyticsPurpose", B.GoogleAnalyticsPurposeDescription = "Description.GoogleAnalyticsPurpose", B.CompanyCollectionHeader = "Heading.CompanyCollection", B.DataCollected = "Label.DataCollected", B.DataCollectedContent = "Description.DataCollected", B.DataSharing = "Label.DataSharing", B.DataSharingContent = "Description.DataSharing", B.DataRetention = "Label.DataRetention", B.DataRetentionContent = "Description.DataRetention", B.DataUse = "Label.DataUse", B.DataUseContent = "Description.DataUse", B.DataStorage = "Label.DataStorage", B.DataStorageContent = "Description.Undisclosed", B.RequestData = "Action.RequestData", B.SetCookieOptions = "Action.SetCookieOptions", B.DeclineAll = "Action.DeclineAll", B.AcceptAll = "Action.AcceptAll", B.EssentialCookie = "Heading.EssentialCookies", B.AnalyticsCookie = "Heading.AnalyticsCookies", B.GAReadMore = "Description.GAReadMore", B.GAReadMoreUrl = "{googleAnalyticsLink}", B);
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
                onDeclineAll: d,
                onLearnMore: p,
                isOpen: m
            } = e, {
                translate: h
            } = (0, t.useTranslation)(), {
                classes: f
            } = P(), g = (0, r.useMediaQuery)((0, n.useTheme)().breakpoints.down("Medium")), y = (0, a.useMemo)(() => a.default.createElement(l.Link, {
                href: D,
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, h(R.PrivacyPolicy)), [h]), b = (0, a.useMemo)(() => {
                let e = h(R.CookieBannerContent);
                if (!e.includes(S)) return e;
                let t = e.split(S);
                return a.default.createElement(a.default.Fragment, null, t[0], y, t[1] || "")
            }, [h, y]);
            return a.default.createElement(i.Drawer, {
                open: m,
                onClose: d,
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
            }, a.default.createElement(u.Button, {
                variant: "text",
                onClick: p,
                color: "secondary"
            }, h(R.SetCookieOptions)), a.default.createElement(c.Grid, {
                className: f.buttons
            }, a.default.createElement(u.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: d,
                fullWidth: g
            }, h(R.DeclineAll)), a.default.createElement(u.Button, {
                color: "secondary",
                variant: "contained",
                onClick: o,
                fullWidth: g
            }, h(R.AcceptAll))))))
        },
        M = "RBXcb",
        I = {
            RBXViralAcquisition: !0,
            RBXSource: !0,
            GoogleAnalytics: !0
        },
        L = (0, a.createContext)(null),
        N = () => {
            let e = (0, a.useContext)(L);
            if (!e) throw Error("useCookieConsentContext must be used within a CookieConsentProvider");
            return e
        },
        G = e => {
            let t, a = Object.entries(e).map(e => {
                let [t, a] = e;
                return "".concat(t, "=").concat(a)
            }).join("&");
            Object.entries(e).forEach(e => {
                let [t, a] = e;
                a || (0, E.deleteCookie)(t)
            });
            let o = new Date;
            o.setDate(o.getDate() + 180), document.cookie = "".concat(M, "=").concat(a, "; expires=").concat(o.toUTCString(), "; path=/; domain=").concat((t = window.location.hostname.split(".")).length <= 2 ? window.location.hostname : ".".concat(t.slice(1).join(".")))
        },
        O = e => {
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
        j = (0, o.makeStyles)()(() => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(d.accordionSummaryClasses.content)]: {
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
        V = () => {
            var e;
            let {
                translate: o
            } = (0, t.useTranslation)(), {
                cookiePolicy: n
            } = N(), {
                classes: r
            } = j();
            return n && (null == (e = n.EssentialCookieList) ? void 0 : e.length) ? a.default.createElement(p.Accordion, {
                className: r.accordion
            }, a.default.createElement(m.AccordionSummary, {
                className: r.accordionSummary
            }, a.default.createElement(s.Typography, {
                variant: "h6"
            }, o(R.EssentialCookie))), a.default.createElement(h.AccordionDetails, null, n.EssentialCookieList.map(e => a.default.createElement(O, {
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
            if (!o.includes(A)) return a.default.createElement(a.default.Fragment, null, o);
            let [n, r] = o.split(A);
            return a.default.createElement(s.Typography, {
                variant: "body2"
            }, n, a.default.createElement(l.Link, {
                href: "https://support.google.com/analytics/answer/11397207",
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, e(R.GoogleAnalytics)), r)
        },
        U = (0, o.makeStyles)()(() => ({
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
        F = e => {
            let {
                href: t,
                text: o
            } = e, {
                classes: n
            } = U();
            return a.default.createElement("div", null, a.default.createElement(u.Button, {
                className: n.button,
                variant: "text",
                component: "a",
                color: "primary",
                href: t,
                rel: "noreferrer",
                endIcon: a.default.createElement(g.OpenInNewIcon, null),
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
            } = j(), {
                translate: l
            } = (0, t.useTranslation)();
            return a.default.createElement(p.Accordion, {
                className: r.accordion
            }, a.default.createElement(m.AccordionSummary, {
                className: r.accordionSummary
            }, a.default.createElement(s.Typography, {
                variant: "h6"
            }, l(R.AnalyticsCookie)), a.default.createElement(y.Switch, {
                checked: o,
                onChange: (e, t) => {
                    n(t)
                },
                "aria-label": l(R.AnalyticsCookie),
                size: "small"
            })), a.default.createElement(h.AccordionDetails, null, a.default.createElement(O, {
                key: X.RBXViralAcquisition,
                cookieName: X.RBXViralAcquisition,
                description: l(R.RBXViralAcquisitionDescription)
            }), a.default.createElement(O, {
                key: X.RBXSource,
                cookieName: X.RBXSource,
                description: l(R.RBXSourceDescription)
            }), a.default.createElement(F, {
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
            }, l(R.CompanyCollectionHeader)), x.map(e => a.default.createElement(z, {
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
                ["& .".concat(d.accordionSummaryClasses.content)]: {
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
                translate: d
            } = (0, t.useTranslation)(), {
                classes: p
            } = W(), {
                cookiePolicy: m
            } = N();
            return m ? a.default.createElement(C.Dialog, {
                open: n,
                onClose: r
            }, a.default.createElement(k.DialogTitle, null, d(R.ConsentToolModalTitle)), a.default.createElement(v.DialogContent, {
                className: p.dialogContent
            }, a.default.createElement(s.Typography, {
                variant: "h6"
            }, d(R.InfoCollectionHeader)), a.default.createElement(s.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, d(R.InfoCollectionContent)), a.default.createElement(s.Typography, {
                variant: "h6"
            }, d(R.InfoCollectionHeader2)), a.default.createElement(s.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, d(R.InfoCollectionContent2)), a.default.createElement(s.Typography, {
                variant: "h6"
            }, d(R.InfoPartnerCollectionHeader)), a.default.createElement(s.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, d(R.InfoPartnerCollectionContent)), a.default.createElement(F, {
                href: "https://www.roblox.com/support",
                text: d(R.RequestData)
            }), a.default.createElement(F, {
                href: D,
                text: d(R.PrivacyPolicy)
            }), a.default.createElement("div", {
                className: p.accordionSection
            }, (null == (o = m.EssentialCookieList) ? void 0 : o.length) > 0 && a.default.createElement("div", {
                className: p.accordionContainer
            }, a.default.createElement(V, null)), a.default.createElement("div", {
                className: p.accordionContainer
            }, a.default.createElement(q, {
                isAnalyticsCookieAccepted: i,
                setIsAnalyticsCookieAccepted: c
            })))), a.default.createElement(w.DialogActions, null, a.default.createElement(u.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: r
            }, d(R.CancelBtn)), a.default.createElement(u.Button, {
                color: "primaryBrand",
                variant: "contained",
                onClick: l
            }, d(R.SaveBtn)))) : null
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
            } = N(), [s, u] = (0, a.useState)(c), d = (0, a.useCallback)(() => {
                s ? l() : i(), n()
            }, [l, i, s, n]);
            return r ? a.default.createElement(K, {
                open: t,
                onClose: o,
                isAnalyticsCookieAccepted: s,
                setIsAnalyticsCookieAccepted: u,
                onSave: d
            }) : null
        },
        Y = (0, t.withTranslation)(() => {
            let {
                acceptAll: e,
                declineAll: t,
                shouldShowBanner: o
            } = N(), [n, r] = (0, a.useState)(!1), [l, i] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                o && i(!0)
            }, [o]);
            let c = (0, a.useCallback)(() => {
                    e(), i(!1)
                }, [e]),
                s = (0, a.useCallback)(() => {
                    t(), i(!1)
                }, [t]),
                u = (0, a.useCallback)(() => {
                    r(!0), i(!1)
                }, []),
                d = (0, a.useCallback)(() => {
                    r(!1), i(!0)
                }, []),
                p = (0, a.useCallback)(() => {
                    r(!1), i(!1)
                }, []);
            return a.default.createElement(a.default.Fragment, null, a.default.createElement(T, {
                isOpen: l,
                onAcceptAll: c,
                onDeclineAll: s,
                onLearnMore: u
            }), a.default.createElement(Q, {
                isOpen: n,
                onClose: d,
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
        } = e, [i, c] = (0, a.useState)(n || null), [s, u] = (0, a.useState)(r || (() => {
            if ("u" < typeof document) return I;
            let e = document.cookie.split("; ").find(e => e.startsWith("".concat(M, "=")));
            return e ? e.substring(M.length + 1).split("&").reduce((e, t) => {
                let [a, o] = t.split("=");
                return e[a] = "true" === o, e
            }, {}) : I
        })()), [d, p] = (0, a.useState)(!n), [m, h] = (0, a.useState)(null), f = (0, a.useMemo)(() => !!l || !!(null == i ? void 0 : i.ShouldDisplayCookieBannerV3) && !(!("u" < typeof document) && document.cookie.split("; ").some(e => e.startsWith("".concat(M, "=")))), [null == i ? void 0 : i.ShouldDisplayCookieBannerV3, l]);
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
        let g = (0, a.useCallback)((e, t) => {
                u(a => {
                    let o = {
                        ...a,
                        [e]: t
                    };
                    return G(o), o
                })
            }, []),
            y = (0, a.useCallback)(() => {
                if (!i) return;
                let e = i.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !0
                }), I);
                G(e), u(e)
            }, [i]),
            b = (0, a.useCallback)(() => {
                if (!i) return;
                let e = i.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !1
                }), I);
                G(e), u(e)
            }, [i]),
            C = (0, a.useMemo)(() => Object.values(s).some(e => !0 === e), [s]),
            k = (0, a.useMemo)(() => ({
                cookiePolicy: i,
                preferences: s,
                updatePreference: g,
                acceptAll: y,
                declineAll: b,
                isLoading: d,
                error: m,
                hasAcceptedAnalyticsCookie: C,
                shouldShowBanner: f
            }), [i, s, d, m, y, b, g, C, f]);
        return a.default.createElement(L.Provider, {
            value: k
        }, t)
    }, "useCookieConsentContext", 0, N], 260241)
}]);

//# debugId=f7f73a1f-6380-9dc2-c317-2c6b43002095
//# sourceMappingURL=2gv64heb3aetr.js.map