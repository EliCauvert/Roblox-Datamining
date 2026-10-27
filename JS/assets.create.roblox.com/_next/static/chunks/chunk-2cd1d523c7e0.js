;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "31f6c30d-6735-180f-9540-2684ceb8b3d0")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 787159, e => {
    "use strict";
    var t = e.i(30941),
        n = e.i(416340),
        i = e.i(936993),
        r = e.i(169336),
        a = e.i(477763),
        o = e.i(249707),
        s = e.i(564349),
        l = e.i(548601),
        c = e.i(928277),
        u = e.i(221628),
        d = e.i(226319),
        h = e.i(442632),
        m = e.i(745984),
        p = e.i(747310),
        f = e.i(823079),
        g = e.i(329102),
        y = e.i(882638);
    e.i(596779), e.i(41392);
    var v = e.i(487047),
        b = e.i(819139);

    function _(e) {
        return e.substring(2).toLowerCase()
    }

    function w(e) {
        let {
            children: t,
            disableReactTree: i = !1,
            mouseEvent: r = "onClick",
            onClickAway: a,
            touchEvent: o = "onTouchEnd"
        } = e, l = n.useRef(!1), c = n.useRef(null), d = n.useRef(!1), h = n.useRef(!1);
        n.useEffect(() => (setTimeout(() => {
            d.current = !0
        }, 0), () => {
            d.current = !1
        }), []);
        let m = (0, f.u)((0, g.g)(t), c),
            p = (0, s.u)(e => {
                let t = h.current;
                h.current = !1;
                let n = (0, y.o)(c.current);
                if (!(!d.current || !c.current || "clientX" in e && (n.documentElement.clientWidth < e.clientX || n.documentElement.clientHeight < e.clientY))) {
                    if (l.current) return void(l.current = !1);
                    (e.composedPath ? e.composedPath().indexOf(c.current) > -1 : !n.documentElement.contains(e.target) || c.current.contains(e.target)) || !i && t || a(e)
                }
            }),
            v = e => n => {
                h.current = !0;
                let i = t.props[e];
                i && i(n)
            },
            b = {
                ref: m
            };
        return !1 !== o && (b[o] = v(o)), n.useEffect(() => {
            if (!1 !== o) {
                let e = _(o),
                    t = (0, y.o)(c.current),
                    n = () => {
                        l.current = !0
                    };
                return t.addEventListener(e, p), t.addEventListener("touchmove", n), () => {
                    t.removeEventListener(e, p), t.removeEventListener("touchmove", n)
                }
            }
        }, [p, o]), !1 !== r && (b[r] = v(r)), n.useEffect(() => {
            if (!1 !== r) {
                let e = _(r),
                    t = (0, y.o)(c.current);
                return t.addEventListener(e, p), () => {
                    t.removeEventListener(e, p)
                }
            }
        }, [p, r]), (0, u.jsx)(n.Fragment, {
            children: n.cloneElement(t, b)
        })
    }

    function S(e) {
        return (0, r.g)("MuiSnackbarContent", e)
    }(0, c.g)("MuiSnackbarContent", ["root", "message", "action"]);
    let k = ["action", "className", "message", "role"],
        E = (0, d.s)(v.M, {
            name: "MuiSnackbarContent",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(e => {
            let {
                theme: t
            } = e, n = "light" === t.palette.mode ? .8 : .98, i = (0, r.n)(t.palette.background.default, n);
            return (0, a._)({}, t.typography.body2, {
                color: t.vars ? t.vars.palette.SnackbarContent.color : t.palette.getContrastText(i),
                backgroundColor: t.vars ? t.vars.palette.SnackbarContent.bg : i,
                display: "flex",
                alignItems: "center",
                flexWrap: "wrap",
                padding: "6px 16px",
                borderRadius: (t.vars || t).shape.borderRadius,
                flexGrow: 1,
                [t.breakpoints.up("sm")]: {
                    flexGrow: "initial",
                    minWidth: 288
                }
            })
        }),
        T = (0, d.s)("div", {
            name: "MuiSnackbarContent",
            slot: "Message",
            overridesResolver: (e, t) => t.message
        })({
            padding: "8px 0"
        }),
        x = (0, d.s)("div", {
            name: "MuiSnackbarContent",
            slot: "Action",
            overridesResolver: (e, t) => t.action
        })({
            display: "flex",
            alignItems: "center",
            marginLeft: "auto",
            paddingLeft: 16,
            marginRight: -8
        }),
        C = n.forwardRef(function(e, t) {
            let n = (0, h.u)({
                    props: e,
                    name: "MuiSnackbarContent"
                }),
                {
                    action: i,
                    className: o,
                    message: s,
                    role: l = "alert"
                } = n,
                c = (0, r._)(n, k),
                m = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, d.a)({
                        root: ["root"],
                        action: ["action"],
                        message: ["message"]
                    }, S, t)
                })(n);
            return (0, u.jsxs)(E, (0, a._)({
                role: l,
                square: !0,
                elevation: 6,
                className: (0, d.c)(m.root, o),
                ownerState: n,
                ref: t
            }, c, {
                children: [(0, u.jsx)(T, {
                    className: m.message,
                    ownerState: n,
                    children: s
                }), i ? (0, u.jsx)(x, {
                    className: m.action,
                    ownerState: n,
                    children: i
                }) : null]
            }))
        });

    function O(e) {
        return (0, r.g)("MuiSnackbar", e)
    }(0, c.g)("MuiSnackbar", ["root", "anchorOriginTopCenter", "anchorOriginBottomCenter", "anchorOriginTopRight", "anchorOriginBottomRight", "anchorOriginTopLeft", "anchorOriginBottomLeft"]);
    let M = ["onEnter", "onExited"],
        A = ["action", "anchorOrigin", "autoHideDuration", "children", "className", "ClickAwayListenerProps", "ContentProps", "disableWindowBlurListener", "message", "onBlur", "onClose", "onFocus", "onMouseEnter", "onMouseLeave", "open", "resumeHideDuration", "TransitionComponent", "transitionDuration", "TransitionProps"],
        P = (0, d.s)("div", {
            name: "MuiSnackbar",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.root, t["anchorOrigin".concat((0, r.a)(n.anchorOrigin.vertical)).concat((0, r.a)(n.anchorOrigin.horizontal))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
            } = e;
            return (0, a._)({
                zIndex: (t.vars || t).zIndex.snackbar,
                position: "fixed",
                display: "flex",
                left: 8,
                right: 8,
                justifyContent: "center",
                alignItems: "center"
            }, "top" === n.anchorOrigin.vertical ? {
                top: 8
            } : {
                bottom: 8
            }, "left" === n.anchorOrigin.horizontal && {
                justifyContent: "flex-start"
            }, "right" === n.anchorOrigin.horizontal && {
                justifyContent: "flex-end"
            }, {
                [t.breakpoints.up("sm")]: (0, a._)({}, "top" === n.anchorOrigin.vertical ? {
                    top: 24
                } : {
                    bottom: 24
                }, "center" === n.anchorOrigin.horizontal && {
                    left: "50%",
                    right: "auto",
                    transform: "translateX(-50%)"
                }, "left" === n.anchorOrigin.horizontal && {
                    left: 24,
                    right: "auto"
                }, "right" === n.anchorOrigin.horizontal && {
                    right: 24,
                    left: "auto"
                })
            })
        }),
        z = n.forwardRef(function(e, t) {
            let i = (0, h.u)({
                    props: e,
                    name: "MuiSnackbar"
                }),
                c = (0, m.u)(),
                f = {
                    enter: c.transitions.duration.enteringScreen,
                    exit: c.transitions.duration.leavingScreen
                },
                {
                    action: g,
                    anchorOrigin: {
                        vertical: y,
                        horizontal: v
                    } = {
                        vertical: "bottom",
                        horizontal: "left"
                    },
                    autoHideDuration: _ = null,
                    children: S,
                    className: k,
                    ClickAwayListenerProps: E,
                    ContentProps: T,
                    disableWindowBlurListener: x = !1,
                    message: z,
                    open: I,
                    TransitionComponent: R = b.G,
                    transitionDuration: L = f,
                    TransitionProps: {
                        onEnter: j,
                        onExited: N
                    } = {}
                } = i,
                U = (0, r._)(i.TransitionProps, M),
                D = (0, r._)(i, A),
                H = (0, a._)({}, i, {
                    anchorOrigin: {
                        vertical: y,
                        horizontal: v
                    },
                    autoHideDuration: _,
                    disableWindowBlurListener: x,
                    TransitionComponent: R,
                    transitionDuration: L
                }),
                K = (e => {
                    let {
                        classes: t,
                        anchorOrigin: n
                    } = e, i = {
                        root: ["root", "anchorOrigin".concat((0, r.a)(n.vertical)).concat((0, r.a)(n.horizontal))]
                    };
                    return (0, d.a)(i, O, t)
                })(H),
                {
                    getRootProps: F,
                    onClickAway: B
                } = function() {
                    let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        {
                            autoHideDuration: t = null,
                            disableWindowBlurListener: i = !1,
                            onClose: r,
                            open: c,
                            resumeHideDuration: u
                        } = e,
                        d = (0, o.u)();
                    n.useEffect(() => {
                        if (c) return document.addEventListener("keydown", e), () => {
                            document.removeEventListener("keydown", e)
                        };

                        function e(e) {
                            e.defaultPrevented || "Escape" !== e.key && "Esc" !== e.key || null == r || r(e, "escapeKeyDown")
                        }
                    }, [c, r]);
                    let h = (0, s.u)((e, t) => {
                            null == r || r(e, t)
                        }),
                        m = (0, s.u)(e => {
                            r && null != e && d.start(e, () => {
                                h(null, "timeout")
                            })
                        });
                    n.useEffect(() => (c && m(t), d.clear), [c, t, m, d]);
                    let p = d.clear,
                        f = n.useCallback(() => {
                            null != t && m(null != u ? u : .5 * t)
                        }, [t, u, m]);
                    return n.useEffect(() => {
                        if (!i && c) return window.addEventListener("focus", f), window.addEventListener("blur", p), () => {
                            window.removeEventListener("focus", f), window.removeEventListener("blur", p)
                        }
                    }, [i, c, f, p]), {
                        getRootProps: function() {
                            let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                                n = (0, a._)({}, (0, l.e)(e), (0, l.e)(t));
                            return (0, a._)({
                                role: "presentation"
                            }, t, n, {
                                onBlur: e => {
                                    let t = n.onBlur;
                                    null == t || t(e), f()
                                },
                                onFocus: e => {
                                    let t = n.onFocus;
                                    null == t || t(e), p()
                                },
                                onMouseEnter: e => {
                                    let t = n.onMouseEnter;
                                    null == t || t(e), p()
                                },
                                onMouseLeave: e => {
                                    let t = n.onMouseLeave;
                                    null == t || t(e), f()
                                }
                            })
                        },
                        onClickAway: e => {
                            null == r || r(e, "clickaway")
                        }
                    }
                }((0, a._)({}, H)),
                [W, V] = n.useState(!0),
                q = (0, p.u)({
                    elementType: P,
                    getSlotProps: F,
                    externalForwardedProps: D,
                    ownerState: H,
                    additionalProps: {
                        ref: t
                    },
                    className: [K.root, k]
                });
            return !I && W ? null : (0, u.jsx)(w, (0, a._)({
                onClickAway: B
            }, E, {
                children: (0, u.jsx)(P, (0, a._)({}, q, {
                    children: (0, u.jsx)(R, (0, a._)({
                        appear: !0,
                        in: I,
                        timeout: L,
                        direction: "top" === y ? "down" : "up",
                        onEnter: (e, t) => {
                            V(!1), j && j(e, t)
                        },
                        onExited: e => {
                            V(!0), N && N(e)
                        }
                    }, U, {
                        children: S || (0, u.jsx)(C, (0, a._)({
                            message: z,
                            action: g
                        }, T))
                    }))
                }))
            }))
        });
    var I = (0, i.default)({
            name: "Snackbar"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({
                    boxShadow: e.elevation.overlay
                }, e.border.radius.medium), {
                    backgroundColor: e.palette.background.snackbar,
                    color: e.palette.content.standard
                })
            }
        }),
        R = (0, n.forwardRef)(function(e, i) {
            var r = e.ContentProps,
                a = e.autoHide,
                o = e.anchorOrigin,
                s = e.className,
                l = e.classes,
                c = (0, t.a)(e, ["ContentProps", "autoHide", "anchorOrigin", "className", "classes"]),
                u = I(void 0, {
                    props: {
                        classes: null == r ? void 0 : r.classes
                    }
                });
            return n.default.createElement(z, (0, t._)({}, c, {
                classes: (0, t._)((0, t._)({}, l), {
                    root: u.cx(null == l ? void 0 : l.root, s)
                }),
                ref: i,
                anchorOrigin: (0, t._)({
                    vertical: "bottom",
                    horizontal: "left"
                }, o),
                autoHideDuration: void 0 !== a && a ? 4e3 : null,
                ContentProps: {
                    classes: u.classes
                }
            }))
        });
    e.s(["S", 0, R])
}, 182012, 436175, e => {
    "use strict";
    var t, n, i, r, a, o, s, l, c, u, d, h = e.i(416340),
        m = e.i(711300),
        p = e.i(634203),
        f = e.i(35877),
        g = e.i(422898),
        y = e.i(630844),
        v = e.i(665564),
        b = e.i(199189),
        _ = e.i(919122),
        w = (t = new WeakMap, n = new WeakMap, i = new WeakMap, r = new WeakMap, a = new WeakSet, class extends b.Removable {
            setOptions(e) {
                this.options = e, this.updateGcTime(this.options.gcTime)
            }
            get meta() {
                return this.options.meta
            }
            addObserver(e) {
                (0, m._)(this, n).includes(e) || ((0, m._)(this, n).push(e), this.clearGcTimeout(), (0, m._)(this, i).notify({
                    type: "observerAdded",
                    mutation: this,
                    observer: e
                }))
            }
            removeObserver(e) {
                (0, f._)(this, n, (0, m._)(this, n).filter(t => t !== e)), this.scheduleGc(), (0, m._)(this, i).notify({
                    type: "observerRemoved",
                    mutation: this,
                    observer: e
                })
            }
            optionalRemove() {
                (0, m._)(this, n).length || ("pending" === this.state.status ? this.scheduleGc() : (0, m._)(this, i).remove(this))
            }
            continue () {
                var e, t;
                return null != (e = null == (t = (0, m._)(this, r)) ? void 0 : t.continue()) ? e : this.execute(this.state.variables)
            }
            async execute(e) {
                var n, o, s, l, c, u, d, h, p, y, v, b, w, S, E, T, x, C, O, M, A;
                let P = () => {
                        (0, g._)(this, a, k).call(this, {
                            type: "continue"
                        })
                    },
                    z = {
                        client: (0, m._)(this, t),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                (0, f._)(this, r, (0, _.createRetryer)({
                    fn: () => this.options.mutationFn ? this.options.mutationFn(e, z) : Promise.reject(Error("No mutationFn found")),
                    onFail: (e, t) => {
                        (0, g._)(this, a, k).call(this, {
                            type: "failed",
                            failureCount: e,
                            error: t
                        })
                    },
                    onPause: () => {
                        (0, g._)(this, a, k).call(this, {
                            type: "pause"
                        })
                    },
                    onContinue: P,
                    retry: null != (n = this.options.retry) ? n : 0,
                    retryDelay: this.options.retryDelay,
                    networkMode: this.options.networkMode,
                    canRun: () => (0, m._)(this, i).canRun(this)
                }));
                let I = "pending" === this.state.status,
                    R = !(0, m._)(this, r).canStart();
                try {
                    if (I) P();
                    else {
                        (0, g._)(this, a, k).call(this, {
                            type: "pending",
                            variables: e,
                            isPaused: R
                        }), await (null == (y = (v = (0, m._)(this, i).config).onMutate) ? void 0 : y.call(v, e, this, z));
                        let t = await (null == (b = (w = this.options).onMutate) ? void 0 : b.call(w, e, z));
                        t !== this.state.context && (0, g._)(this, a, k).call(this, {
                            type: "pending",
                            context: t,
                            variables: e,
                            isPaused: R
                        })
                    }
                    let t = await (0, m._)(this, r).start();
                    return await (null == (o = (s = (0, m._)(this, i).config).onSuccess) ? void 0 : o.call(s, t, e, this.state.context, this, z)), await (null == (l = (c = this.options).onSuccess) ? void 0 : l.call(c, t, e, this.state.context, z)), await (null == (u = (d = (0, m._)(this, i).config).onSettled) ? void 0 : u.call(d, t, null, this.state.variables, this.state.context, this, z)), await (null == (h = (p = this.options).onSettled) ? void 0 : h.call(p, t, null, e, this.state.context, z)), (0, g._)(this, a, k).call(this, {
                        type: "success",
                        data: t
                    }), t
                } catch (t) {
                    try {
                        throw await (null == (S = (E = (0, m._)(this, i).config).onError) ? void 0 : S.call(E, t, e, this.state.context, this, z)), await (null == (T = (x = this.options).onError) ? void 0 : T.call(x, t, e, this.state.context, z)), await (null == (C = (O = (0, m._)(this, i).config).onSettled) ? void 0 : C.call(O, void 0, t, this.state.variables, this.state.context, this, z)), await (null == (M = (A = this.options).onSettled) ? void 0 : M.call(A, void 0, t, e, this.state.context, z)), t
                    } finally {
                        (0, g._)(this, a, k).call(this, {
                            type: "error",
                            error: t
                        })
                    }
                } finally {
                    (0, m._)(this, i).runNext(this)
                }
            }
            constructor(e) {
                super(), (0, y._)(this, a), (0, p._)(this, t, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, i, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, t, e.client), this.mutationId = e.mutationId, (0, f._)(this, i, e.mutationCache), (0, f._)(this, n, []), this.state = e.state || S(), this.setOptions(e.options), this.scheduleGc()
            }
        });

    function S() {
        return {
            context: void 0,
            data: void 0,
            error: null,
            failureCount: 0,
            failureReason: null,
            isPaused: !1,
            status: "idle",
            variables: void 0,
            submittedAt: 0
        }
    }

    function k(e) {
        this.state = (t => {
            switch (e.type) {
                case "failed":
                    return {
                        ...t, failureCount: e.failureCount, failureReason: e.error
                    };
                case "pause":
                    return {
                        ...t, isPaused: !0
                    };
                case "continue":
                    return {
                        ...t, isPaused: !1
                    };
                case "pending":
                    return {
                        ...t, context: e.context, data: void 0, failureCount: 0, failureReason: null, error: null, isPaused: e.isPaused, status: "pending", variables: e.variables, submittedAt: Date.now()
                    };
                case "success":
                    return {
                        ...t, data: e.data, failureCount: 0, failureReason: null, error: null, status: "success", isPaused: !1
                    };
                case "error":
                    return {
                        ...t, data: void 0, error: e.error, failureCount: t.failureCount + 1, failureReason: e.error, isPaused: !1, status: "error"
                    }
            }
        })(this.state), v.notifyManager.batch(() => {
            (0, m._)(this, n).forEach(t => {
                t.onMutationUpdate(e)
            }), (0, m._)(this, i).notify({
                mutation: this,
                type: "updated",
                action: e
            })
        })
    }
    e.s(["Mutation", 0, w, "getDefaultState", 0, S], 436175);
    var E = e.i(211089),
        T = e.i(711367),
        x = (o = new WeakMap, s = new WeakMap, l = new WeakMap, c = new WeakMap, u = new WeakSet, d = new WeakSet, class extends E.Subscribable {
            bindMethods() {
                this.mutate = this.mutate.bind(this), this.reset = this.reset.bind(this)
            }
            setOptions(e) {
                var t;
                let n = this.options;
                this.options = (0, m._)(this, o).defaultMutationOptions(e), (0, T.shallowEqualObjects)(this.options, n) || (0, m._)(this, o).getMutationCache().notify({
                    type: "observerOptionsUpdated",
                    mutation: (0, m._)(this, l),
                    observer: this
                }), (null == n ? void 0 : n.mutationKey) && this.options.mutationKey && (0, T.hashKey)(n.mutationKey) !== (0, T.hashKey)(this.options.mutationKey) ? this.reset() : (null == (t = (0, m._)(this, l)) ? void 0 : t.state.status) === "pending" && (0, m._)(this, l).setOptions(this.options)
            }
            onUnsubscribe() {
                if (!this.hasListeners()) {
                    var e;
                    null == (e = (0, m._)(this, l)) || e.removeObserver(this)
                }
            }
            onMutationUpdate(e) {
                (0, g._)(this, u, C).call(this), (0, g._)(this, d, O).call(this, e)
            }
            getCurrentResult() {
                return (0, m._)(this, s)
            }
            reset() {
                var e;
                null == (e = (0, m._)(this, l)) || e.removeObserver(this), (0, f._)(this, l, void 0), (0, g._)(this, u, C).call(this), (0, g._)(this, d, O).call(this)
            }
            mutate(e, t) {
                var n;
                return (0, f._)(this, c, t), null == (n = (0, m._)(this, l)) || n.removeObserver(this), (0, f._)(this, l, (0, m._)(this, o).getMutationCache().build((0, m._)(this, o), this.options)), (0, m._)(this, l).addObserver(this), (0, m._)(this, l).execute(e)
            }
            constructor(e, t) {
                super(), (0, y._)(this, u), (0, y._)(this, d), (0, p._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, p._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, o, e), this.setOptions(t), this.bindMethods(), (0, g._)(this, u, C).call(this)
            }
        });

    function C() {
        var e, t;
        let n = null != (e = null == (t = (0, m._)(this, l)) ? void 0 : t.state) ? e : S();
        (0, f._)(this, s, {
            ...n,
            isPending: "pending" === n.status,
            isSuccess: "success" === n.status,
            isError: "error" === n.status,
            isIdle: "idle" === n.status,
            mutate: this.mutate,
            reset: this.reset
        })
    }

    function O(e) {
        v.notifyManager.batch(() => {
            if ((0, m._)(this, c) && this.hasListeners()) {
                var t, n, i, r, a, l, u, d;
                let h = (0, m._)(this, s).variables,
                    p = (0, m._)(this, s).context,
                    f = {
                        client: (0, m._)(this, o),
                        meta: this.options.meta,
                        mutationKey: this.options.mutationKey
                    };
                (null == e ? void 0 : e.type) === "success" ? (null == (t = (n = (0, m._)(this, c)).onSuccess) || t.call(n, e.data, h, p, f), null == (i = (r = (0, m._)(this, c)).onSettled) || i.call(r, e.data, null, h, p, f)) : (null == e ? void 0 : e.type) === "error" && (null == (a = (l = (0, m._)(this, c)).onError) || a.call(l, e.error, h, p, f), null == (u = (d = (0, m._)(this, c)).onSettled) || u.call(d, void 0, e.error, h, p, f))
            }
            this.listeners.forEach(e => {
                e((0, m._)(this, s))
            })
        })
    }
    var M = e.i(795621);
    e.s(["useMutation", 0, function(e, t) {
        let n = (0, M.useQueryClient)(t),
            [i] = h.useState(() => new x(n, e));
        h.useEffect(() => {
            i.setOptions(e)
        }, [i, e]);
        let r = h.useSyncExternalStore(h.useCallback(e => i.subscribe(v.notifyManager.batchCalls(e)), [i]), () => i.getCurrentResult(), () => i.getCurrentResult()),
            a = h.useCallback((e, t) => {
                i.mutate(e, t).catch(T.noop)
            }, [i]);
        if (r.error && (0, T.shouldThrowError)(i.options.throwOnError, [r.error])) throw r.error;
        return {
            ...r,
            mutate: a,
            mutateAsync: r.mutate
        }
    }], 182012)
}, 2437, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var i = {
        default: function() {
            return f
        },
        defaultHead: function() {
            return d
        }
    };
    for (var r in i) Object.defineProperty(n, r, {
        enumerable: !0,
        get: i[r]
    });
    let a = e.r(2879),
        o = e.r(887602),
        s = e.r(221628),
        l = o._(e.r(416340)),
        c = a._(e.r(757265)),
        u = e.r(898602);

    function d() {
        return [(0, s.jsx)("meta", {
            charSet: "utf-8"
        }, "charset"), (0, s.jsx)("meta", {
            name: "viewport",
            content: "width=device-width"
        }, "viewport")]
    }

    function h(e, t) {
        return "string" == typeof t || "number" == typeof t ? e : t.type === l.default.Fragment ? e.concat(l.default.Children.toArray(t.props.children).reduce((e, t) => "string" == typeof t || "number" == typeof t ? e : e.concat(t), [])) : e.concat(t)
    }
    let m = ["name", "httpEquiv", "charSet", "itemProp"];

    function p(e) {
        let t, n, i, r;
        return e.reduce(h, []).reverse().concat(d().reverse()).filter((t = new Set, n = new Set, i = new Set, r = {}, e => {
            let a = !0,
                o = !1;
            if (e.key && "number" != typeof e.key && e.key.indexOf("$") > 0) {
                o = !0;
                let n = e.key.slice(e.key.indexOf("$") + 1);
                t.has(n) ? a = !1 : t.add(n)
            }
            switch (e.type) {
                case "title":
                case "base":
                    n.has(e.type) ? a = !1 : n.add(e.type);
                    break;
                case "meta":
                    for (let t = 0, n = m.length; t < n; t++) {
                        let n = m[t];
                        if (e.props.hasOwnProperty(n))
                            if ("charSet" === n) i.has(n) ? a = !1 : i.add(n);
                            else {
                                let t = e.props[n],
                                    i = r[n] || new Set;
                                ("name" !== n || !o) && i.has(t) ? a = !1 : (i.add(t), r[n] = i)
                            }
                    }
            }
            return a
        })).reverse().map((e, t) => {
            let n = e.key || t;
            return l.default.cloneElement(e, {
                key: n
            })
        })
    }
    let f = function(e) {
        let {
            children: t
        } = e, n = (0, l.useContext)(u.HeadManagerContext);
        return (0, s.jsx)(c.default, {
            reduceComponentsToState: p,
            headManager: n,
            children: t
        })
    };
    ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 757265, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "default", {
        enumerable: !0,
        get: function() {
            return s
        }
    });
    let i = e.r(416340),
        r = "u" < typeof window,
        a = r ? () => {} : i.useLayoutEffect,
        o = r ? () => {} : i.useEffect;

    function s(e) {
        let {
            headManager: t,
            reduceComponentsToState: n
        } = e;

        function s() {
            if (t && t.mountedInstances) {
                let e = i.Children.toArray(Array.from(t.mountedInstances).filter(Boolean));
                t.updateHead(n(e))
            }
        }
        if (r) {
            var l;
            null == t || null == (l = t.mountedInstances) || l.add(e.children), s()
        }
        return a(() => {
            var n;
            return null == t || null == (n = t.mountedInstances) || n.add(e.children), () => {
                var n;
                null == t || null == (n = t.mountedInstances) || n.delete(e.children)
            }
        }), a(() => (t && (t._pendingUpdate = s), () => {
            t && (t._pendingUpdate = s)
        })), o(() => (t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null), () => {
            t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null)
        })), null
    }
}, 301438, (e, t, n) => {
    t.exports = e.r(2437)
}, 37819, e => {
    "use strict";
    var t = e.i(721281),
        n = e.i(438641),
        i = e.i(589624),
        r = e.i(416340),
        a = e.i(301438);
    let o = {
            maxItems: 10,
            maxStoredItems: 100,
            maxDaysAgo: 140,
            queryParamsToKeep: ["activeTab", "tab"],
            pathsToSkip: [/^\/api(\/.*)?\/?$/, /^\/_next(\/.*)?\/?$/, /^\/404$/, /^\/500$/]
        },
        s = "Creator.RecentlyVisited";

    function l(e) {
        return e ? "".concat(s, ".").concat(e) : s
    }
    let c = ["CreatorDocumentation.RecentlyVisited"],
        u = "hub:";
    var d, h = ((d = {}).CreatorHub = "Creator Hub", d.Store = "Store", d.TalentHub = "Talent Hub", d.Learn = "Learn", d);
    let m = n.z.union([n.z.string(), n.z.object({
            translationKey: n.z.string(),
            translationKeyParams: n.z.record(n.z.string(), n.z.string()).optional(),
            defaultLabel: n.z.string().optional()
        })]),
        p = n.z.object({
            id: n.z.union([n.z.string(), n.z.number()]).optional(),
            name: n.z.string().optional(),
            displayName: n.z.string().optional(),
            hasVerifiedBadge: n.z.boolean().optional()
        }).passthrough(),
        f = n.z.object({
            title: n.z.string(),
            path: n.z.string(),
            description: n.z.string().optional(),
            siteName: n.z.string().optional(),
            contentType: n.z.string().optional(),
            authorName: n.z.string().optional(),
            entityName: n.z.string().optional(),
            breadcrumb: n.z.string().optional(),
            entityId: n.z.string().optional(),
            userId: n.z.string().optional(),
            keywords: n.z.string().optional(),
            className: n.z.string().optional(),
            ariaLabel: n.z.string().optional(),
            translatedCategoryDisplayText: n.z.string().optional(),
            documentationContentType: n.z.string().nullable().optional(),
            documentationSubType: n.z.string().nullable().optional(),
            documentationThirdType: n.z.string().nullable().optional(),
            createdAtUtc: n.z.string().optional(),
            updatedAtUtc: n.z.string().optional(),
            author: p.optional(),
            type: n.z.string().optional(),
            isTitleCode: n.z.boolean().optional(),
            label: m.optional(),
            ignoreHash: n.z.boolean().optional()
        }).passthrough(),
        g = n.z.object({
            id: n.z.string(),
            accessedAt: n.z.number(),
            metadata: f
        });
    n.z.array(g);
    let y = {
        getItem(e) {
            try {
                return window.localStorage.getItem(e)
            } catch (e) {
                return null
            }
        },
        setItem(e, t) {
            try {
                window.localStorage.setItem(e, t)
            } catch (e) {}
        },
        removeItem(e) {
            try {
                window.localStorage.removeItem(e)
            } catch (e) {}
        }
    };

    function v(e) {
        try {
            let t = y.getItem(e);
            if (!t) return [];
            let n = JSON.parse(t);
            if (!Array.isArray(n)) return [];
            return n.reduce((e, t) => {
                let n = g.safeParse(t);
                if (n.success) return e.push(n.data), e;
                let i = function(e) {
                    var t;
                    if (!e || "object" != typeof e || e.metadata) return null;
                    let {
                        title: n
                    } = e, i = null != (t = e.path) ? t : e.id;
                    if ("string" != typeof n || !n || "string" != typeof i || !i) return null;
                    let r = "string" == typeof e.id && e.id ? e.id : i,
                        a = Date.now();
                    "number" == typeof e.accessedAt ? a = e.accessedAt : "string" == typeof e.accessedAt && (a = new Date(e.accessedAt).getTime() || Date.now());
                    let {
                        id: o,
                        accessedAt: s,
                        ...l
                    } = e;
                    return {
                        id: r,
                        accessedAt: a,
                        metadata: {
                            title: n,
                            path: i,
                            ...l
                        }
                    }
                }(t);
                if (i) {
                    let t = g.safeParse(i);
                    t.success && e.push(t.data)
                }
                return e
            }, [])
        } catch (e) {
            return []
        }
    }
    let b = new class {
        setActiveUser(e) {
            let t = l(e);
            if (t === this.storageKey) return;
            let n = !this.currentUserId;
            this.currentUserId = e, this.storageKey = t, this.hasMigrated = !1, n && e && this.migrateAnonymousToUser()
        }
        migrateAnonymousToUser() {
            let e = l(),
                t = v(e);
            if (0 === t.length) return;
            let n = v(this.storageKey),
                i = new Map;
            t.forEach(e => i.set(e.id, e)), n.forEach(e => {
                let t = i.get(e.id);
                (!t || e.accessedAt > t.accessedAt) && i.set(e.id, e)
            });
            let r = Array.from(i.values()).sort((e, t) => t.accessedAt - e.accessedAt).slice(0, this.config.maxStoredItems);
            y.setItem(this.storageKey, JSON.stringify(r)), y.removeItem(e)
        }
        migrateIfNeeded() {
            if (this.hasMigrated || (this.hasMigrated = !0, v(this.storageKey).length > 0)) return;
            let e = [];
            if (c.forEach(t => {
                    e.push(...v(t))
                }), 0 === e.length) return;
            let t = new Map;
            e.forEach(e => {
                let n = t.get(e.id);
                (!n || e.accessedAt > n.accessedAt) && t.set(e.id, e)
            });
            let n = Array.from(t.values()).sort((e, t) => t.accessedAt - e.accessedAt).slice(0, this.config.maxStoredItems);
            y.setItem(this.storageKey, JSON.stringify(n)), c.forEach(e => {
                y.removeItem(e)
            })
        }
        getAllFilteredItems() {
            return this.migrateIfNeeded(), v(this.storageKey).filter(e => e.accessedAt && e.accessedAt >= this.maxDaysAgoTimestamp)
        }
        async getRecentlyVisited(e) {
            try {
                return this.getAllFilteredItems().slice(0, null != e ? e : this.config.maxItems)
            } catch (e) {
                return []
            }
        }
        async addToRecentlyVisited(e) {
            var t, n;
            if ((null == (t = e.metadata) ? void 0 : t.path) && (null == (n = e.metadata) ? void 0 : n.title)) try {
                let t = this.getAllFilteredItems(),
                    n = e.id.split("?")[0],
                    i = e.id.includes("?"),
                    r = t.filter(t => t.id !== e.id && (t.id.split("?")[0] !== n || t.metadata.title !== e.metadata.title || !!t.id.includes("?") && !!i)),
                    a = [e, ...r].slice(0, this.config.maxStoredItems);
                y.setItem(this.storageKey, JSON.stringify(a))
            } catch (e) {}
        }
        async removeFromRecentlyVisited(e) {
            try {
                let t = this.getAllFilteredItems().filter(t => t.id !== e);
                return y.setItem(this.storageKey, JSON.stringify(t)), t.slice(0, this.config.maxItems)
            } catch (e) {
                return []
            }
        }
        async clearHistory() {
            try {
                y.removeItem(this.storageKey)
            } catch (e) {}
        }
        constructor(e = {}) {
            (0, t._)(this, "config", void 0), (0, t._)(this, "storageKey", s), (0, t._)(this, "currentUserId", void 0), (0, t._)(this, "maxDaysAgoTimestamp", void 0), (0, t._)(this, "hasMigrated", !1), this.config = {
                ...o,
                ...e
            }, this.maxDaysAgoTimestamp = Date.now() - 24 * this.config.maxDaysAgo * 36e5
        }
    };

    function _() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let i = t.filter(Boolean);
        return i.length > 0 ? i.join(" / ") : void 0
    }

    function w(e) {
        let {
            origin: t,
            pathname: n,
            search: i
        } = e, r = "".concat(t).concat(n).concat(i), a = new URLSearchParams(i);
        Array.from(a.keys()).filter(e => !o.queryParamsToKeep.includes(e)).forEach(e => a.delete(e)), a.sort();
        let s = a.toString(),
            l = "".concat(n).concat(s ? "?".concat(s) : ""),
            c = "".concat(t).concat(l);
        return {
            id: l,
            cleanedUrl: c,
            originalUrl: r
        }
    }

    function S(e) {
        var t;
        let n = null != (t = document.querySelector('meta[property="'.concat(e, '"]'))) ? t : document.querySelector('meta[name="'.concat(e, '"]'));
        return (null == n ? void 0 : n.content) || void 0
    }

    function k(e) {
        return S("".concat(u).concat(e))
    }

    function E(e, t) {
        return k(e) || S(t) || void 0
    }

    function T() {
        let e = {
                title: k("title") || document.title || S("og:title") || ""
            },
            t = E("description", "og:description") || S("description");
        t && (e.description = t);
        let n = E("site_name", "og:site_name");
        n && (e.siteName = n);
        let i = E("type", "og:type");
        i && (e.contentType = i);
        let r = E("author", "article:author");
        r && (e.authorName = r);
        let a = k("entity-name");
        a && (e.entityName = a);
        let o = k("entity-id");
        o && (e.entityId = o);
        let s = k("user-id");
        s && (e.userId = s);
        let l = S("keywords");
        l && (e.keywords = l);
        let c = k("breadcrumb");
        c && (e.breadcrumb = c);
        let u = k("label");
        if (u) try {
            e.label = JSON.parse(u)
        } catch (t) {
            e.label = u
        }
        return "true" === k("is-title-code") && (e.isTitleCode = !0), e
    }
    class x {
        collect() {
            return this.collectFn()
        }
        constructor() {
            (0, t._)(this, "collectFn", T)
        }
    }
    class C {
        detect(e, t) {
            var n;
            this.cleanup();
            let i = () => {
                this.cleanupPrimary();
                let n = e.collect();
                t(n), this.watchForLateUpdates(e, n.title, t)
            };
            this.maxTimer = setTimeout(i, 3e3);
            let r = () => {
                this.debounceTimer && clearTimeout(this.debounceTimer), this.debounceTimer = setTimeout(i, 300)
            };
            this.observer = new MutationObserver(() => {
                r()
            });
            let a = null != (n = document.head) ? n : document.querySelector("head");
            a && this.observer.observe(a, {
                childList: !0,
                subtree: !0,
                characterData: !0,
                attributes: !0
            }), r()
        }
        watchForLateUpdates(e, t, n) {
            var i;
            let r = null != (i = document.head) ? i : document.querySelector("head");
            if (!r) return;
            this.postSettleTimer = setTimeout(() => {
                this.cleanupPostSettle()
            }, 5e3);
            let a = 'meta[name="'.concat(u, 'title"]');
            this.postSettleObserver = new MutationObserver(() => {
                let i = document.querySelector(a),
                    r = null == i ? void 0 : i.content;
                r && r !== t && (this.cleanupPostSettle(), n(e.collect()))
            }), this.postSettleObserver.observe(r, {
                childList: !0,
                subtree: !0,
                attributes: !0
            })
        }
        cleanupPrimary() {
            this.observer && (this.observer.disconnect(), this.observer = null), this.debounceTimer && (clearTimeout(this.debounceTimer), this.debounceTimer = null), this.maxTimer && (clearTimeout(this.maxTimer), this.maxTimer = null)
        }
        cleanupPostSettle() {
            this.postSettleObserver && (this.postSettleObserver.disconnect(), this.postSettleObserver = null), this.postSettleTimer && (clearTimeout(this.postSettleTimer), this.postSettleTimer = null)
        }
        cleanup() {
            this.cleanupPrimary(), this.cleanupPostSettle()
        }
        constructor() {
            (0, t._)(this, "observer", null), (0, t._)(this, "debounceTimer", null), (0, t._)(this, "maxTimer", null), (0, t._)(this, "postSettleObserver", null), (0, t._)(this, "postSettleTimer", null)
        }
    }
    let O = (0, r.createContext)({
        trackPageVisit: async () => {
            throw Error("trackPageVisit is not implemented")
        },
        getRecentlyVisited: async () => {
            throw Error("getRecentlyVisited is not implemented")
        },
        removeFromHistory: async () => {
            throw Error("removeFromHistory is not implemented")
        },
        clearHistory: async () => {
            throw Error("clearHistory is not implemented")
        },
        eventLogger: void 0
    });

    function M() {
        return w(window.location)
    }
    let A = r.default.memo(e => {
        var t, n;
        let {
            hubOnly: i = !1,
            title: o,
            seoTitle: s,
            ogTitle: l,
            description: c,
            seoDescription: d,
            ogDescription: m,
            author: p,
            seoAuthor: f,
            siteName: g = h.CreatorHub,
            keywords: y,
            robots: v,
            ogImage: b,
            ogUrl: w,
            ogType: S,
            canonical: k,
            type: E,
            entityName: T,
            entityId: x,
            userId: C,
            label: O,
            breadcrumb: M,
            breadcrumbItems: A,
            isTitleCode: P,
            children: z
        } = e, I = e => i ? void 0 : e, R = I(null != s ? s : o), L = I(null != (t = null != l ? l : s) ? t : o), j = I(null != d ? d : c), N = I(null != (n = null != m ? m : d) ? n : c), U = I(null != f ? f : p), D = null != M ? M : A && A.length > 0 ? _(...A.map(e => e.name)) : void 0;
        return r.default.createElement(a.default, null, R && r.default.createElement("title", null, R), L && r.default.createElement("meta", {
            property: "og:title",
            content: L,
            key: "og:title"
        }), o && r.default.createElement("meta", {
            name: "".concat(u, "title"),
            content: o,
            key: "".concat(u, "title")
        }), N && r.default.createElement("meta", {
            property: "og:description",
            content: N,
            key: "og:description"
        }), j && r.default.createElement("meta", {
            name: "description",
            content: j,
            key: "description"
        }), c && r.default.createElement("meta", {
            name: "".concat(u, "description"),
            content: c,
            key: "".concat(u, "description")
        }), U && r.default.createElement("meta", {
            property: "article:author",
            content: U,
            key: "article:author"
        }), p && r.default.createElement("meta", {
            name: "".concat(u, "author"),
            content: p,
            key: "".concat(u, "author")
        }), !i && r.default.createElement("meta", {
            property: "og:site_name",
            content: g,
            key: "og:site_name"
        }), r.default.createElement("meta", {
            name: "".concat(u, "site_name"),
            content: g,
            key: "".concat(u, "site_name")
        }), !i && y && r.default.createElement("meta", {
            name: "keywords",
            content: y,
            key: "keywords"
        }), !i && v && r.default.createElement("meta", {
            name: "robots",
            content: v,
            key: "robots"
        }), !i && b && r.default.createElement("meta", {
            property: "og:image",
            content: b,
            key: "og:image"
        }), !i && w && r.default.createElement("meta", {
            property: "og:url",
            content: w,
            key: "og:url"
        }), !i && S && r.default.createElement("meta", {
            property: "og:type",
            content: S,
            key: "og:type"
        }), !i && k && r.default.createElement("link", {
            rel: "canonical",
            href: k
        }), E && r.default.createElement("meta", {
            name: "".concat(u, "type"),
            content: E,
            key: "".concat(u, "type")
        }), T && r.default.createElement("meta", {
            name: "".concat(u, "entity-name"),
            content: T,
            key: "".concat(u, "entity-name")
        }), x && r.default.createElement("meta", {
            name: "".concat(u, "entity-id"),
            content: x,
            key: "".concat(u, "entity-id")
        }), C && r.default.createElement("meta", {
            name: "".concat(u, "user-id"),
            content: C,
            key: "".concat(u, "user-id")
        }), O && r.default.createElement("meta", {
            name: "".concat(u, "label"),
            content: O,
            key: "".concat(u, "label")
        }), D && r.default.createElement("meta", {
            name: "".concat(u, "breadcrumb"),
            content: D,
            key: "".concat(u, "breadcrumb")
        }), P && r.default.createElement("meta", {
            name: "".concat(u, "is-title-code"),
            content: "true",
            key: "".concat(u, "is-title-code")
        }), !i && A && A.length > 0 && r.default.createElement("script", {
            type: "application/ld+json",
            key: "breadcrumb-jsonld",
            dangerouslySetInnerHTML: {
                __html: JSON.stringify({
                    "@context": "https://schema.org",
                    "@type": "BreadcrumbList",
                    itemListElement: A.map((e, t) => ({
                        "@type": "ListItem",
                        position: t + 1,
                        name: e.name,
                        item: e.url
                    }))
                })
            }
        }), z)
    });
    A.displayName = "HubMeta", e.s(["HistoryProvider", 0, e => {
        let {
            children: t,
            userId: n,
            getMetadataForPath: a,
            eventLogger: s
        } = e, l = (0, i.useRouter)(), c = (0, r.useRef)(new x), u = (0, r.useRef)(new C);
        (0, r.useEffect)(() => {
            b.setActiveUser(n)
        }, [n]);
        let d = (0, r.useCallback)(e => {
                let {
                    id: t,
                    originalUrl: n
                } = M();
                if (o.pathsToSkip.some(e => e.test(t)) || !e.title) return;
                let {
                    title: i,
                    ...r
                } = e, a = {
                    title: i,
                    path: n,
                    ...r
                };
                b.addToRecentlyVisited({
                    id: t,
                    metadata: a,
                    accessedAt: Date.now()
                })
            }, []),
            h = (0, r.useCallback)(async (e, t) => {
                let {
                    id: n,
                    originalUrl: i
                } = M();
                if (!o.pathsToSkip.some(e => e.test(n))) try {
                    var r;
                    let e = {
                        title: t || (null == (r = document) ? void 0 : r.title) || n,
                        path: i
                    };
                    if (a) {
                        let t = a(n);
                        t && (e = {
                            ...e,
                            ...t
                        })
                    }
                    if (!e.title) return;
                    await b.addToRecentlyVisited({
                        id: n,
                        metadata: e,
                        accessedAt: Date.now()
                    })
                } catch (e) {}
            }, [a]),
            m = (0, r.useCallback)(async e => b.getRecentlyVisited(e), []),
            p = (0, r.useCallback)(async e => b.removeFromRecentlyVisited(e), []),
            f = (0, r.useCallback)(async () => b.clearHistory(), []);
        (0, r.useEffect)(() => {
            let e = u.current,
                t = c.current,
                n = () => {
                    e.detect(t, e => {
                        d(e)
                    })
                };
            n();
            let i = () => {
                n()
            };
            return l.events.on("routeChangeComplete", i), () => {
                l.events.off("routeChangeComplete", i), e.cleanup()
            }
        }, [l.events, d]);
        let g = (0, r.useMemo)(() => ({
            trackPageVisit: h,
            getRecentlyVisited: m,
            removeFromHistory: p,
            clearHistory: f,
            eventLogger: s
        }), [h, m, p, f, s]);
        return r.default.createElement(O.Provider, {
            value: g
        }, t)
    }, "HubMeta", 0, A, "SiteName", 0, h, "TITLE_SEPARATOR", 0, " / ", "buildBreadcrumb", 0, _, "buildTitle", 0, function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return t.filter(Boolean).join(" / ")
    }, "cleanUrl", 0, w, "historyClient", 0, b])
}]);

//# debugId=31f6c30d-6735-180f-9540-2684ceb8b3d0
//# sourceMappingURL=0grfgrtyz6k75.js.map