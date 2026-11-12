;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c03cffee-2840-f45f-e51c-9ead9e939515")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 291659, (e, t, a) => {
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
    for (var l in n) Object.defineProperty(a, l, {
        enumerable: !0,
        get: n[l]
    });
    let o = e.r(85038),
        r = e.r(785517);
    e.r(643766);
    let i = o._(e.r(712088)),
        c = "u" < typeof window;

    function s(e) {
        return {
            default: (null == e ? void 0 : e.default) || e
        }
    }

    function d(e, t) {
        if (delete t.webpack, delete t.modules, !c) return e(t);
        let a = t.loading;
        return () => (0, r.jsx)(a, {
            error: null,
            isLoading: !0,
            pastDelay: !1,
            timedOut: !1
        })
    }

    function u(e, t) {
        let a = i.default,
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
        let l = (n = {
            ...n,
            ...t
        }).loader;
        return (n.loadableGenerated && (n = {
            ...n,
            ...n.loadableGenerated
        }, delete n.loadableGenerated), "boolean" != typeof n.ssr || n.ssr) ? a({
            ...n,
            loader: () => null != l ? l().then(s) : Promise.resolve(s(() => null))
        }) : (delete n.webpack, delete n.modules, d(a, n))
    }("function" == typeof a.default || "object" == typeof a.default && null !== a.default) && void 0 === a.default.__esModule && (Object.defineProperty(a.default, "__esModule", {
        value: !0
    }), Object.assign(a.default, a), t.exports = a.default)
}, 788447, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "LoadableContext", {
        enumerable: !0,
        get: function() {
            return n
        }
    });
    let n = (e.r(85038)._(e.r(643766))).default.createContext(null)
}, 712088, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "default", {
        enumerable: !0,
        get: function() {
            return m
        }
    });
    let n = e.r(85038)._(e.r(643766)),
        l = e.r(788447),
        o = [],
        r = [],
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
            if ("u" < typeof window && o.push(u), !i && "u" > typeof window) {
                let t = c.webpack && "function" == typeof e.t.resolveWeak ? c.webpack() : c.modules;
                t && r.push(e => {
                    for (let a of t)
                        if (e.includes(a)) return u()
                })
            }

            function m(e, t) {
                let a;
                u(), (a = n.default.useContext(l.LoadableContext)) && Array.isArray(c.modules) && c.modules.forEach(e => {
                    a(e)
                });
                let o = n.default.useSyncExternalStore(d.subscribe, d.getCurrentValue, d.getCurrentValue);
                return n.default.useImperativeHandle(t, () => ({
                    retry: d.retry
                }), []), n.default.useMemo(() => {
                    var t;
                    return o.loading || o.error ? n.default.createElement(c.loading, {
                        isLoading: o.loading,
                        pastDelay: o.pastDelay,
                        timedOut: o.timedOut,
                        error: o.error,
                        retry: d.retry
                    }) : o.loaded ? n.default.createElement((t = o.loaded) && t.default ? t.default : t, e) : null
                }, [e, o])
            }
            return m.preload = () => u(), m.displayName = "LoadableComponent", n.default.forwardRef(m)
        }(c, t)
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
        u(o).then(e, t)
    }), d.preloadReady = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
        return new Promise(t => {
            let a = () => (i = !0, t());
            u(r, e).then(a, a)
        })
    }, "u" > typeof window && (window.__NEXT_PRELOADREADY = d.preloadReady);
    let m = d
}, 458263, (e, t, a) => {
    t.exports = e.r(291659)
}, 505842, e => {
    "use strict";
    var t = e.i(293021);
    e.s(["f", () => t.i])
}, 270921, e => {
    "use strict";
    var t = e.i(497698),
        a = e.i(335020),
        n = e.i(643766),
        l = e.i(257872),
        o = e.i(225419);
    let r = (0, n.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        i = () => {
            let e = (0, n.useContext)(r);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        c = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        s = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        d = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        u = e => {
            let {
                open: t,
                onOpenChange: a,
                children: o,
                size: i,
                type: c = "Default",
                isModal: s,
                hasCloseAffordance: d,
                closeLabel: u,
                hasMarginTop: m = !0,
                hasMarginBottom: p = !0,
                hasDescription: f = !1,
                experimentalDisablePointerEventsStylingOnBody: h = !1
            } = e, g = (0, n.useMemo)(() => ({
                size: i,
                isModal: s,
                type: c,
                hasCloseAffordance: d,
                closeLabel: u,
                hasMarginTop: m,
                hasMarginBottom: p,
                hasDescription: f
            }), [i, s, c, d, u, m, p, f]);
            return (0, n.useEffect)(() => {
                h && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [h, t]), n.default.createElement(r.Provider, {
                value: g
            }, n.default.createElement(l.F, {
                open: t,
                onOpenChange: a
            }, o))
        };
    u.displayName = "Dialog";
    let m = e => {
        let {
            children: o,
            className: r,
            style: c,
            overlayClassName: s,
            overlayStyle: d,
            onOpenAutoFocus: u,
            ...m
        } = e, {
            size: p,
            isModal: f,
            hasCloseAffordance: h,
            closeLabel: g,
            hasDescription: b
        } = i(), y = (0, a.U)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", f && "bg-common-backdrop", s), v = (0, a.U)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
        return n.default.createElement(l.z, null, n.default.createElement(l.k, {
            className: y,
            style: d
        }, n.default.createElement(l.c, {
            className: v,
            "data-size": p,
            style: c,
            onOpenAutoFocus: u,
            ...!b && {
                "aria-describedby": void 0
            },
            ...m
        }, h && n.default.createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, n.default.createElement(l.K, {
            asChild: !0
        }, n.default.createElement(t.f, {
            variant: "OverMedia",
            size: p,
            isCircular: !0,
            "aria-label": g
        }))), o)))
    };
    m.displayName = "DialogContent";
    let p = e => {
        let {
            children: t,
            className: l,
            ...o
        } = e;
        return n.default.createElement("div", {
            className: (0, a.U)("foundation-web-dialog-hero-media", l),
            ...o
        }, t)
    };
    p.displayName = "DialogHeroMedia";
    let f = e => {
        let {
            children: t,
            className: l,
            ...o
        } = e, {
            size: r,
            hasMarginTop: u,
            hasMarginBottom: m
        } = i(), p = (0, a.U)(c[r], u && s[r], m && d[r], l);
        return n.default.createElement("div", {
            className: p,
            ...o
        }, t)
    };
    f.displayName = "DialogBody";
    let h = e => {
        let {
            children: t,
            className: a,
            hidden: r,
            ...i
        } = e, c = n.default.createElement(l.Z, {
            className: a,
            ...i
        }, t);
        return r ? n.default.createElement(o.f, null, c) : c
    };
    h.displayName = "DialogTitle";
    let g = e => {
        let {
            children: t,
            className: l,
            ...o
        } = e, {
            size: r
        } = i(), s = (0, a.U)(c[r], d[r], l);
        return n.default.createElement("div", {
            className: s,
            ...o
        }, t)
    };
    g.displayName = "DialogFooter", e.s(["N", 0, u, "K", 0, f, "d", 0, m, "c", 0, g, "p", 0, p, "F", 0, h])
}, 497698, e => {
    "use strict";
    var t = e.i(27213),
        a = e.i(154570),
        n = e.i(335020),
        l = e.i(643766);
    let o = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        r = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    e.s(["f", 0, e => {
        let {
            variant: i,
            size: c,
            isCircular: s,
            className: d,
            ...u
        } = e;
        return l.default.createElement("button", {
            type: "button",
            className: (0, n.U)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", t.Y, r[i], o[c], s && "radius-circle", d),
            ...u
        }, l.default.createElement(t.v, null), l.default.createElement(a.f, {
            name: "icon-regular-x",
            size: c
        }))
    }])
}, 355321, e => {
    "use strict";
    var t = e.i(412287);
    e.s(["f", () => t.a])
}, 4589, e => {
    "use strict";
    var t = e.i(580361);
    e.s(["f", () => t.b])
}, 277199, e => {
    "use strict";
    var t = e.i(643766);
    e.i(433659);
    var a = e.i(785517),
        n = e.i(621083);
    e.i(170418), e.s(["N", 0, function(e) {
        let {
            children: l,
            defer: o = !1,
            fallback: r = null
        } = e, [i, c] = t.useState(!1);
        return (0, n.u)(() => {
            o || c(!0)
        }, [o]), t.useEffect(() => {
            o && c(!0)
        }, [o]), (0, a.jsx)(t.Fragment, {
            children: i ? l : r
        })
    }])
}, 455158, e => {
    "use strict";
    var t = e.i(225226),
        a = e.i(643766);

    function n(e) {
        return "small" === e ? 16 : 20
    }

    function l(e) {
        return "small" === e ? 18 : 24
    }
    var o = e.i(231543),
        r = e.i(130933),
        i = e.i(677484),
        c = e.i(433659),
        s = e.i(237994),
        d = e.i(179183),
        u = e.i(365434),
        m = e.i(629156),
        p = e.i(785517),
        f = e.i(268953);

    function h(e) {
        return (0, c.g)("MuiSwitch", e)
    }
    e.i(475252);
    var g = (0, i.g)("MuiSwitch", ["root", "edgeStart", "edgeEnd", "switchBase", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium", "checked", "disabled", "input", "thumb", "track"]);
    let b = ["className", "color", "edge", "size", "sx"],
        y = (0, u.s)("span", {
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
        v = (0, u.s)(m.S, {
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
        k = (0, u.s)("span", {
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
                    color: l = "primary",
                    edge: o = !1,
                    size: r = "medium",
                    sx: i
                } = a,
                s = (0, c._)(a, b),
                m = (0, d._)({}, a, {
                    color: l,
                    edge: o,
                    size: r
                }),
                g = (e => {
                    let {
                        classes: t,
                        edge: a,
                        size: n,
                        color: l,
                        checked: o,
                        disabled: r
                    } = e, i = {
                        root: ["root", a && "edge".concat((0, c.a)(a)), "size".concat((0, c.a)(n))],
                        switchBase: ["switchBase", "color".concat((0, c.a)(l)), o && "checked", r && "disabled"],
                        thumb: ["thumb"],
                        track: ["track"],
                        input: ["input"]
                    }, s = (0, u.a)(i, h, t);
                    return (0, d._)({}, t, s)
                })(m),
                E = (0, p.jsx)(k, {
                    className: g.thumb,
                    ownerState: m
                });
            return (0, p.jsxs)(y, {
                className: (0, u.c)(g.root, n),
                sx: i,
                ownerState: m,
                children: [(0, p.jsx)(v, (0, d._)({
                    type: "checkbox",
                    icon: E,
                    checkedIcon: E,
                    ref: t,
                    ownerState: m
                }, s, {
                    classes: (0, d._)({}, g, {
                        root: g.switchBase
                    })
                })), (0, p.jsx)(C, {
                    className: g.track,
                    ownerState: m
                })]
            })
        });
    var w = (0, o.f)({
            name: "Switch"
        })(function(e, t, a) {
            var o, r, i, c, d = t.size;
            return {
                root: ((o = {})["&:has(> .".concat(g.colorPrimary, ".").concat(g.disabled, ".").concat(g.checked, ")")] = {
                    opacity: .5
                }, o["&:has(> .".concat(g.colorSecondary, ".").concat(g.disabled, ")")] = {
                    opacity: .5
                }, o),
                switchBase: ((r = {
                    color: e.palette.actionV2.primary.fill
                })["&.".concat(g.checked, " + .").concat(g.track, ".").concat(a.track)] = {
                    opacity: .38
                }, r["&.".concat(g.disabled, " + .").concat(g.track, ".").concat(a.track)] = {
                    opacity: .38
                }, r),
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
                    top: (n(d) - l(d)) / 2,
                    left: (n(d) - l(d)) / 2,
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
        A = (0, a.forwardRef)(function(e, o) {
            var i, c = e.classes,
                d = e.color,
                u = e.loading,
                m = e.size,
                p = e.checkedIcon,
                f = e.icon,
                h = e["aria-label"],
                b = e.inputProps,
                y = e.className,
                v = (0, t.a)(e, ["classes", "color", "loading", "size", "checkedIcon", "icon", "aria-label", "inputProps", "className"]),
                C = w((0, t._)((0, t._)({}, v), {
                    loading: u,
                    size: m,
                    checkedIcon: p,
                    icon: f,
                    "aria-label": h
                }), {
                    props: {
                        classes: (0, r.f)(c, y)
                    }
                }).classes,
                k = C.thumb,
                A = C.progress,
                S = (0, t.a)(C, ["thumb", "progress"]),
                D = a.default.createElement("div", {
                    className: "".concat(g.thumb, " ").concat(k)
                }, u && a.default.createElement(s.C, {
                    thickness: ((i = l(m)) - n(m)) * 44 / (2 * i),
                    size: l(m),
                    classes: {
                        root: A
                    }
                }));
            return a.default.createElement(E, (0, t._)({}, v, {
                checkedIcon: null != p ? p : D,
                classes: S,
                color: void 0 === d ? "primary" : d,
                icon: null != f ? f : D,
                ref: o,
                size: m,
                inputProps: (0, t._)((0, t._)({}, b), {
                    "aria-label": h
                })
            }))
        });
    e.s(["f", 0, A], 455158)
}, 721799, e => {
    "use strict";
    var t = e.i(869702);
    e.s(["f", () => t.eQ])
}, 927803, e => {
    "use strict";
    var t = e.i(869702);
    e.s(["f", () => t.Ym])
}, 118413, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "creator-analytics",
            name: "analyticsChartLoadEventstreamEnabled",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1
        }),
        l = (0, t.e)({
            namespace: "creator-analytics",
            name: "visibleAssetIdInPersonalizationEnabled",
            defaultValue: !1
        }),
        o = (0, t.e)({
            namespace: "creator-analytics",
            name: "isExperimentationTemplatesEnabled",
            defaultValue: !1
        }),
        r = (0, t.e)({
            namespace: "creator-analytics",
            name: "isCustomMetricsBackendEnabled",
            defaultValue: !1
        }),
        i = (0, t.e)({
            namespace: "creator-analytics",
            name: "isCustomMetricMdeEnabled",
            defaultValue: !1
        }),
        c = (0, t.e)({
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0
        }),
        s = (0, t.e)({
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0
        }),
        d = (0, t.e)({
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0
        }),
        u = (0, t.e)({
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0
        }),
        m = (0, t.e)({
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        p = (0, t.e)({
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        f = (0, t.e)({
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1
        }),
        h = (0, t.e)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatHistoryEnabled",
            defaultValue: !1
        }),
        g = (0, t.e)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1
        }),
        b = (0, t.e)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantStreamSilenceRecoveryEnabled",
            defaultValue: !1
        }),
        y = (0, t.e)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1
        }),
        v = (0, t.e)({
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1
        }),
        C = (0, t.e)({
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1
        }),
        k = (0, t.e)({
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1
        }),
        E = (0, t.e)({
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1
        }),
        w = (0, t.e)({
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1
        }),
        A = (0, t.e)({
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1
        }),
        S = (0, t.e)({
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1
        }),
        D = (0, t.e)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1
        }),
        x = (0, t.e)({
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !0
        }),
        R = (0, t.e)({
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1
        }),
        B = (0, t.e)({
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1
        }),
        M = (0, t.e)({
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1
        }),
        V = (0, t.e)({
            namespace: "creator-analytics",
            name: "isMetricVariantChartStateEnabled",
            defaultValue: !1
        }),
        _ = (0, t.e)({
            namespace: "creator-analytics",
            name: "isPeriodSummaryBridgeEnabled",
            defaultValue: !1
        }),
        N = (0, t.e)({
            namespace: "creator-analytics",
            name: "isExperimentSegmentationEnabled",
            defaultValue: !1
        }),
        P = (0, t.e)({
            namespace: "creator-analytics",
            name: "isExperimentSampleSizeEnabled",
            defaultValue: !1
        }),
        I = (0, t.e)({
            namespace: "creator-analytics",
            name: "isExperimentMetricsV2Enabled",
            defaultValue: !1
        }),
        L = (0, t.e)({
            namespace: "creator-analytics",
            name: "isExperimentLiftChartEnabled",
            defaultValue: !1
        }),
        j = (0, t.e)({
            namespace: "creator-analytics",
            name: "isExperimentSignificanceCaasEnabled",
            defaultValue: !1
        }),
        T = (0, t.e)({
            namespace: "creator-analytics",
            name: "isClientSessionDetailsV2Enabled",
            defaultValue: !1
        }),
        O = (0, t.e)({
            namespace: "creator-analytics",
            name: "isObservabilityDataCapturesEnabled",
            defaultValue: !1
        }),
        G = (0, t.e)({
            namespace: "creator-analytics",
            name: "isRaqiv2RequestQueryEnabled",
            defaultValue: !1
        });
    e.s(["G", 0, a, "a", 0, g, "o", 0, h, "D", 0, y, "J", 0, b, "b", 0, S, "w", 0, A, "z", 0, T, "r", 0, R, "y", 0, D, "q", 0, i, "m", 0, r, "k", 0, M, "i", 0, B, "C", 0, L, "R", 0, I, "U", 0, d, "S", 0, u, "d", 0, P, "E", 0, N, "u", 0, j, "j", 0, c, "H", 0, o, "p", 0, m, "x", 0, x, "s", 0, n, "l", 0, V, "e", 0, p, "P", 0, O, "Q", 0, _, "X", 0, f, "Y", 0, G, "L", 0, C, "f", 0, s, "V", 0, k, "W", 0, w, "T", 0, v, "c", 0, E, "n", 0, l])
}, 665869, 729904, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.e)({
            namespace: "groups",
            name: "enableGroupGameEarlyTesters",
            defaultValue: !1
        }),
        n = (0, t.e)({
            namespace: "groups",
            name: "enableGroupModerationPage",
            defaultValue: !1
        }),
        l = (0, t.e)({
            namespace: "groups",
            name: "enableGroupDeactivation",
            defaultValue: !1
        });
    e.s(["d", 0, l, "K", 0, a, "Y", 0, n], 665869), e.s(["f", 0, function() {
        return "production"
    }], 729904)
}, 533968, e => {
    "use strict";
    var t = e.i(185915);
    e.s(["f", () => t.f])
}, 105098, 995721, e => {
    "use strict";
    var t = e.i(643766);
    let a = (0, t.createContext)({
        isLoadingLook: !1,
        refreshLookDetails: () => {
            throw Error("function is not implemented")
        },
        lookSalesData: void 0,
        lookDetail: void 0
    });
    a.displayName = "LookDetails", e.s(["f", 0, a], 995721), e.s(["f", 0, function() {
        return (0, t.useContext)(a)
    }], 105098)
}, 17829, e => {
    "use strict";
    var t, a = ((t = a || {}).User = "User", t.Group = "Group", t);
    e.s(["f", 0, a])
}, 627636, e => {
    "use strict";
    var t = e.i(17829);
    e.s(["f", () => t.f])
}, 450639, 432556, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(79187),
        l = e.i(218701),
        o = e.i(505842),
        r = e.i(721799),
        i = e.i(870999),
        c = e.i(927803),
        s = e.i(869702);
    e.s(["f", () => s.E0], 432556);
    var s = s,
        d = e.i(646555),
        u = e.i(47277),
        m = e.i(67243);
    let p = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        return (0, m.f)()(t => ({
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
    e.s(["f", 0, e => {
        let {
            targetId: m,
            targetType: f,
            returnPolicy: h = l.X.AutoGenerated,
            size: g,
            isStatusTextShown: b = !1,
            alt: y,
            fontColor: v = "light",
            bottomRightAdornment: C
        } = e, {
            classes: {
                imageStatusContainer: k,
                statusTextContainer: E,
                imageWrapper: w,
                imageContainer: A,
                image: S,
                bottomRightAdornmentContainer: D,
                skeleton: x
            }
        } = p("light" !== v)(), {
            translate: R
        } = (0, n.A)(), [B, M] = (0, a.useState)(!1), [V, _] = (0, a.useState)(), N = (0, a.useCallback)(async function(e, t, a) {
            let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (t && e) {
                M(!0);
                try {
                    let o = n ? l.O.reloadThumbnailImage : l.O.getThumbnailImage,
                        r = void 0 === g ? await o(e, t, a) : await o(e, t, a, l.f.webp, g);
                    _(r)
                } catch (e) {
                    _({
                        state: o.f.TemporarilyUnavailable
                    })
                } finally {
                    M(!1)
                }
            }
        }, [g]), P = (0, a.useMemo)(() => {
            if (B) return (0, t.jsx)(d.f, {
                classes: {
                    root: x
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                a = null;
            switch (null == V ? void 0 : V.state) {
                case o.f.InReview:
                    e = R("Label.InReview"), a = (0, t.jsx)(c.f, {
                        fontSize: "large",
                        color: "dark" === v ? void 0 : "secondary"
                    });
                    break;
                case o.f.Blocked:
                    e = R("Label.Moderated"), a = (0, t.jsx)(s.E0, {
                        fontSize: "large",
                        color: "dark" === v ? void 0 : "secondary"
                    });
                    break;
                case o.f.Error:
                case o.f.TemporarilyUnavailable:
                    e = R("Label.Unavailable"), a = (0, t.jsx)(r.f, {
                        fontSize: "large",
                        color: "dark" === v ? void 0 : "secondary"
                    });
                    break;
                default:
                    return null
            }
            return (0, t.jsx)(i.f, {
                container: !0,
                classes: {
                    root: k
                },
                justifyContent: "center",
                alignItems: "center",
                children: b ? (0, t.jsxs)("div", {
                    children: [a, (0, t.jsx)(u.f, {
                        variant: "smallLabel1",
                        classes: {
                            root: E
                        },
                        children: e
                    })]
                }) : a
            })
        }, [B, null == V ? void 0 : V.state, k, b, E, x, R, v]);
        return (0, a.useEffect)(() => {
            N(f, m, h)
        }, [m, f, h, N]), {
            thumbnailImage: (0, t.jsx)(i.f, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, t.jsxs)("div", {
                    className: A,
                    children: [(null == V ? void 0 : V.state) === o.f.Completed ? (0, t.jsx)("img", {
                        className: S,
                        src: null == V ? void 0 : V.imageUrl,
                        alt: y
                    }) : (0, t.jsx)("div", {
                        className: w,
                        children: P
                    }), C ? (0, t.jsx)("div", {
                        className: D,
                        children: C
                    }) : null]
                })
            }),
            thumbnailData: V,
            refreshThumbnail: (0, a.useCallback)(async () => N(f, m, h, !0), [N, f, m, h])
        }
    }], 450639)
}, 692587, e => {
    "use strict";
    e.s(["U", 0, function(e) {
        return Object.entries(e).reduce((e, t) => {
            let [a, n] = t;
            return Array.isArray(n) ? e[a] = n.at(0) : e[a] = n, e
        }, {})
    }, "d", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 114209, 559227, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(341260),
        l = e.i(773057),
        o = e.i(392782);
    let r = (0, a.createContext)({
        isLoadingGame: !1,
        isErrorLoadingGame: !1,
        canConfigure: !1,
        gameDetails: null,
        refreshGameDetails: () => {
            throw Error("Not implemented")
        }
    });
    r.displayName = "Game", e.s(["f", 0, r], 559227);
    var i = e.i(805290),
        c = e.i(252842),
        s = e.i(533968);
    let d = new class {
        async getGameDetail(e, t) {
            var a, n, l;
            if (!t && this.gameDetailsMap.has(e)) return null != (a = this.gameDetailsMap.get(e)) ? a : null;
            try {
                let t = null != (n = null == (l = (await this.gamesClient.getDetails([e])).data) ? void 0 : l[0]) ? n : null;
                return t && this.gameDetailsMap.set(e, t), t
            } catch (a) {
                let t = (0, s.f)(a);
                if ((null == t ? void 0 : t.status) === c.R.BAD_REQUEST) return null;
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
                let t = (0, s.f)(a);
                if ((null == t ? void 0 : t.status) === c.R.FORBIDDEN) return this.gameConfigurationMap.set(e, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(e)), null
            }
        }
        constructor(e, t) {
            (0, i._)(this, "gamesClient", void 0), (0, i._)(this, "developClient", void 0), (0, i._)(this, "gameDetailsMap", void 0), (0, i._)(this, "gameConfigurationMap", void 0), this.gamesClient = e, this.developClient = t, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(o.f, l.f);
    e.s(["U", 0, e => {
        let {
            requestedGameId: l,
            children: o
        } = e, i = (0, n.useRouter)(), [c, s] = (0, a.useState)(!0), [u, m] = (0, a.useState)(null), [p, f] = (0, a.useState)(null), [h, g] = (0, a.useState)(!1), [b, y] = (0, a.useState)(), v = (0, a.useRef)(0), C = (0, a.useCallback)(async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                a = v.current += 1,
                n = d.getConfiguration(e),
                l = d.getGameDetail(e, t),
                [o, r] = await Promise.allSettled([n, l]);
            a === v.current && ("fulfilled" === o.status ? m(o.value) : m(null), "fulfilled" === r.status ? (g(!1), f(r.value)) : ("rejected" === r.status ? g(!0) : g(!1), f(null)), y(e), s(!1))
        }, []), k = (0, a.useMemo)(() => {
            let {
                id: e
            } = i.query;
            return l || ("string" == typeof e ? parseInt(e, 10) : void 0)
        }, [l, i.query]), E = (0, a.useCallback)(() => k ? C(k, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [k, C]);
        (0, a.useEffect)(() => {
            try {
                if (void 0 !== k && !Number.isNaN(k) && k > 0) return void C(k);
                v.current += 1, y(void 0), m(null), f(null), g(!1), s(!1)
            } catch (e) {
                console.warn("Could not fetch game details for universeId ".concat(k))
            }
        }, [k, C]);
        let w = c || void 0 !== k && !Number.isNaN(k) && k > 0 && b !== k,
            A = (0, a.useMemo)(() => ({
                isLoadingGame: w,
                canConfigure: u,
                gameDetails: p,
                isErrorLoadingGame: h,
                refreshGameDetails: E
            }), [w, u, p, h, E]);
        return (0, t.jsx)(r.Provider, {
            value: A,
            children: o
        })
    }, "i", 0, function() {
        let e = (0, a.useContext)(r);
        if (null === e) throw Error("useCurrentGame must be used within a GameProvider");
        return e
    }], 114209)
}, 260241, e => {
    "use strict";
    var t = e.i(79187),
        a = e.i(643766),
        n = e.i(67243),
        l = e.i(673386),
        o = e.i(350898),
        r = e.i(446475),
        i = e.i(161603),
        c = e.i(870999),
        s = e.i(47277),
        d = e.i(433285),
        u = e.i(355321),
        m = e.i(712920),
        p = e.i(7151),
        f = e.i(46378),
        h = e.i(4589),
        g = e.i(324726),
        b = e.i(455158),
        y = e.i(272164),
        y = y,
        v = e.i(148792),
        C = e.i(402976),
        k = e.i(8994),
        E = e.i(811314),
        w = e.i(252842);
    let A = "https://www.roblox.com/info/privacy",
        S = "{privacyPolicyLink}",
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
    var R, B, M = ((R = M || {}).BannerTitle = "Heading.CookieBanner", R.CookieBannerContent = "Description.CookieBannerContent", R.CookieBannerButton = "Action.CookieBanner", R.PrivacyPolicy = "Description.PrivacyPolicy", R.ConsentToolModalTitle = "Heading.CookieSettings", R.SaveBtn = "Action.SavePreferences", R.CancelBtn = "Action.Cancel", R.InfoCollectionHeader = "Heading.InformationCollection", R.InfoCollectionContent = "Description.InformationCollection", R.InfoCollectionHeader2 = "Heading.InformationCollection2", R.InfoCollectionContent2 = "Description.InformationCollection2", R.InfoPartnerCollectionHeader = "Heading.InformationPartnerCollection", R.InfoPartnerCollectionContent = "Description.InformationPartnerCollection", R.RBXViralAcquisition = "RBXViralAcquisition", R.RBXViralAcquisitionDescription = "Description.RBXViralAcquisition", R.RBXSource = "RBXSource", R.RBXSourceDescription = "Description.RBXSource", R.GoogleAnalytics = "Heading.GoogleAnalytics", R.OwnedBy = "Label.OwnedBy", R.GoogleInc = "Google Inc.", R.Website = "Label.Website", R.GoogleAnalyticsPurposeHeader = "Heading.GoogleAnalyticsPurpose", R.GoogleAnalyticsPurposeDescription = "Description.GoogleAnalyticsPurpose", R.CompanyCollectionHeader = "Heading.CompanyCollection", R.DataCollected = "Label.DataCollected", R.DataCollectedContent = "Description.DataCollected", R.DataSharing = "Label.DataSharing", R.DataSharingContent = "Description.DataSharing", R.DataRetention = "Label.DataRetention", R.DataRetentionContent = "Description.DataRetention", R.DataUse = "Label.DataUse", R.DataUseContent = "Description.DataUse", R.DataStorage = "Label.DataStorage", R.DataStorageContent = "Description.Undisclosed", R.RequestData = "Action.RequestData", R.SetCookieOptions = "Action.SetCookieOptions", R.DeclineAll = "Action.DeclineAll", R.AcceptAll = "Action.AcceptAll", R.EssentialCookie = "Heading.EssentialCookies", R.AnalyticsCookie = "Heading.AnalyticsCookies", R.GAReadMore = "Description.GAReadMore", R.GAReadMoreUrl = "{googleAnalyticsLink}", R);
    let V = (0, n.f)()(e => ({
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
        _ = e => {
            let {
                onAcceptAll: n,
                onDeclineAll: u,
                onLearnMore: m,
                isOpen: p
            } = e, {
                translate: f
            } = (0, t.A)(), {
                classes: h
            } = V(), g = (0, o.f)((0, l.i)().breakpoints.down("Medium")), b = (0, a.useMemo)(() => a.default.createElement(r.f, {
                href: A,
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, f(M.PrivacyPolicy)), [f]), y = (0, a.useMemo)(() => {
                let e = f(M.CookieBannerContent);
                if (!e.includes(S)) return e;
                let t = e.split(S);
                return a.default.createElement(a.default.Fragment, null, t[0], b, t[1] || "")
            }, [f, b]);
            return a.default.createElement(i.f, {
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
            }, a.default.createElement(c.f, {
                className: h.root
            }, a.default.createElement(c.f, {
                className: h.content
            }, a.default.createElement(s.f, {
                variant: "body2"
            }, y)), a.default.createElement(c.f, {
                className: h.actions
            }, a.default.createElement(d.f, {
                variant: "text",
                onClick: m,
                color: "secondary"
            }, f(M.SetCookieOptions)), a.default.createElement(c.f, {
                className: h.buttons
            }, a.default.createElement(d.f, {
                color: "secondary",
                variant: "outlined",
                onClick: u,
                fullWidth: g
            }, f(M.DeclineAll)), a.default.createElement(d.f, {
                color: "secondary",
                variant: "contained",
                onClick: n,
                fullWidth: g
            }, f(M.AcceptAll))))))
        },
        N = "RBXcb",
        P = {
            RBXViralAcquisition: !0,
            RBXSource: !0,
            GoogleAnalytics: !0
        },
        I = (0, a.createContext)(null),
        L = () => {
            let e = (0, a.useContext)(I);
            if (!e) throw Error("useCookieConsentContext must be used within a CookieConsentProvider");
            return e
        },
        j = e => {
            let t, a = Object.entries(e).map(e => {
                let [t, a] = e;
                return "".concat(t, "=").concat(a)
            }).join("&");
            Object.entries(e).forEach(e => {
                let [t, a] = e;
                a || (0, w.T)(t)
            });
            let n = new Date;
            n.setDate(n.getDate() + 180), document.cookie = "".concat(N, "=").concat(a, "; expires=").concat(n.toUTCString(), "; path=/; domain=").concat((t = window.location.hostname.split(".")).length <= 2 ? window.location.hostname : ".".concat(t.slice(1).join(".")))
        },
        T = e => {
            let {
                cookieName: t,
                description: n
            } = e;
            return a.default.createElement("div", null, a.default.createElement(s.f, {
                variant: "codeDense"
            }, t), a.default.createElement(s.f, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, n))
        },
        O = (0, n.f)()(() => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(u.f.content)]: {
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
        G = () => {
            var e;
            let {
                translate: n
            } = (0, t.A)(), {
                cookiePolicy: l
            } = L(), {
                classes: o
            } = O();
            return l && (null == (e = l.EssentialCookieList) ? void 0 : e.length) ? a.default.createElement(m.f, {
                className: o.accordion
            }, a.default.createElement(p.f, {
                className: o.accordionSummary
            }, a.default.createElement(s.f, {
                variant: "h6"
            }, n(M.EssentialCookie))), a.default.createElement(f.f, null, l.EssentialCookieList.map(e => a.default.createElement(T, {
                key: e.cookieName,
                cookieName: e.cookieName,
                description: n(e.description)
            })))) : null
        };
    var z = ((B = {}).RBXViralAcquisition = "RBXViralAcquisition", B.RBXSource = "RBXSource", B.GoogleAnalytics = "GoogleAnalytics", B);
    let U = e => {
            let {
                title: t,
                content: n,
                secondary: l = !1
            } = e;
            return a.default.createElement("div", null, a.default.createElement(s.f, {
                variant: "body2",
                color: l ? "secondary" : "primary"
            }, t), a.default.createElement(s.f, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, n))
        },
        X = () => {
            let {
                translate: e
            } = (0, t.A)(), n = e(M.GAReadMore);
            if (!n.includes(D)) return a.default.createElement(a.default.Fragment, null, n);
            let [l, o] = n.split(D);
            return a.default.createElement(s.f, {
                variant: "body2"
            }, l, a.default.createElement(r.f, {
                href: "https://support.google.com/analytics/answer/11397207",
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, e(M.GoogleAnalytics)), o)
        },
        H = (0, n.f)()(() => ({
            button: {
                paddingLeft: 5,
                ["&.".concat(h.f.root)]: {
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
                text: n
            } = e, {
                classes: l
            } = H();
            return a.default.createElement("div", null, a.default.createElement(d.f, {
                className: l.button,
                variant: "text",
                component: "a",
                color: "primary",
                href: t,
                rel: "noreferrer",
                endIcon: a.default.createElement(g.f, null),
                size: "small",
                target: "_blank",
                disableRipple: !0
            }, n))
        },
        q = e => {
            let {
                isAnalyticsCookieAccepted: n,
                setIsAnalyticsCookieAccepted: l
            } = e, {
                classes: o
            } = O(), {
                translate: r
            } = (0, t.A)();
            return a.default.createElement(m.f, {
                className: o.accordion
            }, a.default.createElement(p.f, {
                className: o.accordionSummary
            }, a.default.createElement(s.f, {
                variant: "h6"
            }, r(M.AnalyticsCookie)), a.default.createElement(b.f, {
                checked: n,
                onChange: (e, t) => {
                    l(t)
                },
                "aria-label": r(M.AnalyticsCookie),
                size: "small"
            })), a.default.createElement(f.f, null, a.default.createElement(T, {
                key: z.RBXViralAcquisition,
                cookieName: z.RBXViralAcquisition,
                description: r(M.RBXViralAcquisitionDescription)
            }), a.default.createElement(T, {
                key: z.RBXSource,
                cookieName: z.RBXSource,
                description: r(M.RBXSourceDescription)
            }), a.default.createElement(F, {
                href: "https://marketingplatform.google.com/about/analytics/",
                text: r(M.GoogleAnalytics)
            }), a.default.createElement(s.f, {
                variant: "body2",
                paragraph: !0
            }, r(M.OwnedBy), " ", "Google Inc."), a.default.createElement(U, {
                title: r(M.GoogleAnalyticsPurposeHeader),
                content: r(M.GoogleAnalyticsPurposeDescription)
            }), a.default.createElement(s.f, {
                variant: "body2"
            }, r(M.CompanyCollectionHeader)), x.map(e => a.default.createElement(U, {
                key: e.label,
                title: r(e.label),
                content: r(e.content),
                secondary: !0
            })), a.default.createElement(X, null)))
        },
        W = (0, n.f)()(e => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(u.f.content)]: {
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
                open: l,
                onClose: o,
                onSave: r,
                isAnalyticsCookieAccepted: i,
                setIsAnalyticsCookieAccepted: c
            } = e, {
                translate: u
            } = (0, t.A)(), {
                classes: m
            } = W(), {
                cookiePolicy: p
            } = L();
            return p ? a.default.createElement(v.f, {
                open: l,
                onClose: o
            }, a.default.createElement(C.f, null, u(M.ConsentToolModalTitle)), a.default.createElement(k.f, {
                className: m.dialogContent
            }, a.default.createElement(s.f, {
                variant: "h6"
            }, u(M.InfoCollectionHeader)), a.default.createElement(s.f, {
                variant: "body2",
                paragraph: !0,
                className: m.paragraph,
                color: "secondary"
            }, u(M.InfoCollectionContent)), a.default.createElement(s.f, {
                variant: "h6"
            }, u(M.InfoCollectionHeader2)), a.default.createElement(s.f, {
                variant: "body2",
                paragraph: !0,
                className: m.paragraph,
                color: "secondary"
            }, u(M.InfoCollectionContent2)), a.default.createElement(s.f, {
                variant: "h6"
            }, u(M.InfoPartnerCollectionHeader)), a.default.createElement(s.f, {
                variant: "body2",
                paragraph: !0,
                className: m.paragraph,
                color: "secondary"
            }, u(M.InfoPartnerCollectionContent)), a.default.createElement(F, {
                href: "https://www.roblox.com/support",
                text: u(M.RequestData)
            }), a.default.createElement(F, {
                href: A,
                text: u(M.PrivacyPolicy)
            }), a.default.createElement("div", {
                className: m.accordionSection
            }, (null == (n = p.EssentialCookieList) ? void 0 : n.length) > 0 && a.default.createElement("div", {
                className: m.accordionContainer
            }, a.default.createElement(G, null)), a.default.createElement("div", {
                className: m.accordionContainer
            }, a.default.createElement(q, {
                isAnalyticsCookieAccepted: i,
                setIsAnalyticsCookieAccepted: c
            })))), a.default.createElement(E.f, null, a.default.createElement(d.f, {
                color: "secondary",
                variant: "outlined",
                onClick: o
            }, u(M.CancelBtn)), a.default.createElement(d.f, {
                color: "primaryBrand",
                variant: "contained",
                onClick: r
            }, u(M.SaveBtn)))) : null
        },
        Y = e => {
            let {
                isOpen: t,
                onClose: n,
                onSave: l
            } = e, {
                cookiePolicy: o,
                acceptAll: r,
                declineAll: i,
                hasAcceptedAnalyticsCookie: c
            } = L(), [s, d] = (0, a.useState)(c), u = (0, a.useCallback)(() => {
                s ? r() : i(), l()
            }, [r, i, s, l]);
            return o ? a.default.createElement(K, {
                open: t,
                onClose: n,
                isAnalyticsCookieAccepted: s,
                setIsAnalyticsCookieAccepted: d,
                onSave: u
            }) : null
        },
        Q = (0, t.K)(() => {
            let {
                acceptAll: e,
                declineAll: t,
                shouldShowBanner: n
            } = L(), [l, o] = (0, a.useState)(!1), [r, i] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                n && i(!0)
            }, [n]);
            let c = (0, a.useCallback)(() => {
                    e(), i(!1)
                }, [e]),
                s = (0, a.useCallback)(() => {
                    t(), i(!1)
                }, [t]),
                d = (0, a.useCallback)(() => {
                    o(!0), i(!1)
                }, []),
                u = (0, a.useCallback)(() => {
                    o(!1), i(!0)
                }, []),
                m = (0, a.useCallback)(() => {
                    o(!1), i(!1)
                }, []);
            return a.default.createElement(a.default.Fragment, null, a.default.createElement(_, {
                isOpen: r,
                onAcceptAll: c,
                onDeclineAll: s,
                onLearnMore: d
            }), a.default.createElement(Y, {
                isOpen: l,
                onClose: u,
                onSave: m
            }))
        }, ["Feature.Tracking", "CommonUI.Controls"]);
    e.s(["n", 0, Q, "b", 0, e => {
        let {
            children: t,
            robloxSiteDomain: n,
            initialCookiePolicy: l,
            initialPreferences: o,
            forceShowBanner: r = !1
        } = e, [i, c] = (0, a.useState)(l || null), [s, d] = (0, a.useState)(o || (() => {
            if ("u" < typeof document) return P;
            let e = document.cookie.split("; ").find(e => e.startsWith("".concat(N, "=")));
            return e ? e.substring(N.length + 1).split("&").reduce((e, t) => {
                let [a, n] = t.split("=");
                return e[a] = "true" === n, e
            }, {}) : P
        })()), [u, m] = (0, a.useState)(!l), [p, f] = (0, a.useState)(null), h = (0, a.useMemo)(() => !!r || !!(null == i ? void 0 : i.ShouldDisplayCookieBannerV3) && !(!("u" < typeof document) && document.cookie.split("; ").some(e => e.startsWith("".concat(N, "=")))), [null == i ? void 0 : i.ShouldDisplayCookieBannerV3, r]);
        (0, a.useEffect)(() => {
            l || (async () => {
                try {
                    var e, t, a;
                    let l = await fetch("https://apis.".concat(n, "/guac-v2/v1/bundles/cookie-policy"));
                    if (!l.ok) throw Error("Failed to fetch cookie policy");
                    let o = await l.json();
                    c({
                        ShouldDisplayCookieBannerV3: null != (e = o.ShouldDisplayCookieBannerV3) && e,
                        NonEssentialCookieList: null != (t = o.NonEssentialCookieList) ? t : [],
                        EssentialCookieList: null != (a = o.EssentialCookieList) ? a : []
                    }), m(!1)
                } catch (e) {
                    f(e instanceof Error ? e : Error("Unknown error")), m(!1)
                }
            })()
        }, [n, l]);
        let g = (0, a.useCallback)((e, t) => {
                d(a => {
                    let n = {
                        ...a,
                        [e]: t
                    };
                    return j(n), n
                })
            }, []),
            b = (0, a.useCallback)(() => {
                if (!i) return;
                let e = i.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !0
                }), P);
                j(e), d(e)
            }, [i]),
            y = (0, a.useCallback)(() => {
                if (!i) return;
                let e = i.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !1
                }), P);
                j(e), d(e)
            }, [i]),
            v = (0, a.useMemo)(() => Object.values(s).some(e => !0 === e), [s]),
            C = (0, a.useMemo)(() => ({
                cookiePolicy: i,
                preferences: s,
                updatePreference: g,
                acceptAll: b,
                declineAll: y,
                isLoading: u,
                error: p,
                hasAcceptedAnalyticsCookie: v,
                shouldShowBanner: h
            }), [i, s, u, p, b, y, g, v, h]);
        return a.default.createElement(I.Provider, {
            value: C
        }, t)
    }, "a", 0, L], 260241)
}]);

//# debugId=c03cffee-2840-f45f-e51c-9ead9e939515
//# sourceMappingURL=1v-iggcd9xzh0.js.map