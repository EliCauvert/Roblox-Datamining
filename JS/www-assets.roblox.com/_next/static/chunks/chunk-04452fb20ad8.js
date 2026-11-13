;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "cc06a7b1-f470-1865-638a-b33ee3e1324e")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 739473, 83311, e => {
    "use strict";
    var t = e.i(868275),
        r = e.i(420482);
    e.s(["createObsErrorBoundary", 0, function(e, n) {
        let {
            publish: i,
            captureException: o,
            featureName: a
        } = n ?? e;
        return class extends r.Component {
            static getDerivedStateFromError(e) {
                return {
                    error: e
                }
            }
            componentDidCatch(e, t) {
                let r = this.props.name ?? "ReactCrash";
                i(r, {
                    severity: "critical",
                    errorType: e.name || "Error"
                });
                let n = a ? `${a}_${r}` : r;
                o?.(e, {
                    error_counter: n,
                    ...t.componentStack ? {
                        componentStack: t.componentStack
                    } : {}
                })
            }
            render() {
                let {
                    error: e
                } = this.state;
                if (e) {
                    let {
                        fallback: t
                    } = this.props;
                    return "function" == typeof t ? t(e) : void 0 !== t ? t : null
                }
                return this.props.children
            }
            constructor(...e) {
                super(...e), (0, t._)(this, "state", {
                    error: null
                })
            }
        }
    }], 739473);
    var n = e.i(10224);

    function i(e) {
        return "object" == typeof e && "config" in e
    }
    e.s(["createWithApiMetrics", 0, function(e) {
        return async t => {
            let {
                call: r
            } = t.eventCounterProps, o = `${r}_API`;
            e(o, {
                statusCode: "Throughput"
            });
            try {
                let {
                    data: r
                } = await ("GET" === t.method ? (0, n.get)({
                    url: t.url,
                    fullError: !0,
                    ...t.config
                }, t.config?.params) : (0, n.post)({
                    url: t.url,
                    fullError: !0,
                    ...t.config
                }, t.data));
                return e(o, {
                    statusCode: "200"
                }), r
            } catch (r) {
                let t;
                i(r) ? t = r.code ?? r?.response?.status.toString() ?? "UnknownAxiosError" : (t = "UnknownError", console.error(r)), e(o, {
                    statusCode: t
                });
                return
            }
        }
    }, "createWithApiMetricsV2", 0, function(e, t) {
        return async r => {
            let {
                call: o
            } = r.eventCounterProps, a = `${o}_API`;
            e(a, {
                statusCode: "Throughput"
            });
            try {
                let t = {
                        url: r.url,
                        fullError: !0,
                        ...r.config
                    },
                    {
                        data: i,
                        headers: o
                    } = "GET" === r.method ? await (0, n.get)(t, r.config?.params) : "POST" === r.method ? await (0, n.post)(t, r.data) : await (0, n.delete)(t, r.data);
                return e(a, {
                    statusCode: "200"
                }), {
                    data: i,
                    headers: o
                }
            } catch (n) {
                let r = i(n) ? n.code ?? n?.response?.status.toString() ?? "UnknownAxiosError" : "UnknownError";
                throw e(a, {
                        statusCode: r
                    }),
                    function(e) {
                        if (!i(e)) return !0;
                        let t = e.response?.status;
                        return void 0 === t || t >= 500
                    }(n) && t(n, {
                        call: o,
                        statusCode: r
                    }), n
            }
        }
    }], 83311)
}, 855790, e => {
    "use strict";
    var t = e.i(420482);
    e.i(351853);
    var r = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        n = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: i = !1,
            initializeWithValue: o = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, a = e => n ? i : window.matchMedia(e).matches, [s, u] = (0, t.useState)(() => o ? a(e) : i);

        function c() {
            u(a(e))
        }
        return r(() => {
            let t = window.matchMedia(e);
            return c(), t.addListener ? t.addListener(c) : t.addEventListener("change", c), () => {
                t.removeListener ? t.removeListener(c) : t.removeEventListener("change", c)
            }
        }, [e]), s
    }])
}, 453893, e => {
    "use strict";
    var t = e.i(420482),
        r = e.i(775453),
        n = e.i(539181),
        i = e.i(734988),
        o = e.i(430781),
        a = e.i(653279),
        s = e.i(5872),
        u = e.i(481010),
        c = e.i(215941),
        l = e.i(337537),
        d = e.i(396012),
        p = e.i(434205),
        h = e.i(354981),
        f = e.i(494334),
        b = e.i(73772),
        m = e.i(641501),
        v = e.i(19836),
        y = "Popover",
        [P, g] = (0, i.createContextScope)(y, [c.createPopperScope]),
        w = (0, c.createPopperScope)(),
        [T, S] = P(y),
        I = e => {
            let {
                __scopePopover: r,
                children: n,
                open: i,
                defaultOpen: o,
                onOpenChange: a,
                modal: s = !1
            } = e, l = w(r), d = t.useRef(null), [p, h] = t.useState(!1), [b = !1, m] = (0, f.useControllableState)({
                prop: i,
                defaultProp: o,
                onChange: a
            });
            return (0, v.jsx)(c.Root, {
                ...l,
                children: (0, v.jsx)(T, {
                    scope: r,
                    contentId: (0, u.useId)(),
                    triggerRef: d,
                    open: b,
                    onOpenChange: m,
                    onOpenToggle: t.useCallback(() => m(e => !e), [m]),
                    hasCustomAnchor: p,
                    onCustomAnchorAdd: t.useCallback(() => h(!0), []),
                    onCustomAnchorRemove: t.useCallback(() => h(!1), []),
                    modal: s,
                    children: n
                })
            })
        };
    I.displayName = y;
    var C = "PopoverAnchor",
        R = t.forwardRef((e, r) => {
            let {
                __scopePopover: n,
                ...i
            } = e, o = S(C, n), a = w(n), {
                onCustomAnchorAdd: s,
                onCustomAnchorRemove: u
            } = o;
            return t.useEffect(() => (s(), () => u()), [s, u]), (0, v.jsx)(c.Anchor, {
                ...a,
                ...i,
                ref: r
            })
        });
    R.displayName = C;
    var E = "PopoverTrigger",
        x = t.forwardRef((e, t) => {
            let {
                __scopePopover: i,
                ...o
            } = e, a = S(E, i), s = w(i), u = (0, n.useComposedRefs)(t, a.triggerRef), l = (0, v.jsx)(p.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": a.open,
                "aria-controls": a.contentId,
                "data-state": B(a.open),
                ...o,
                ref: u,
                onClick: (0, r.composeEventHandlers)(e.onClick, a.onOpenToggle)
            });
            return a.hasCustomAnchor ? l : (0, v.jsx)(c.Anchor, {
                asChild: !0,
                ...s,
                children: l
            })
        });
    x.displayName = E;
    var A = "PopoverPortal",
        [k, O] = P(A, {
            forceMount: void 0
        }),
        D = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: n,
                container: i
            } = e, o = S(A, t);
            return (0, v.jsx)(k, {
                scope: t,
                forceMount: r,
                children: (0, v.jsx)(d.Presence, {
                    present: r || o.open,
                    children: (0, v.jsx)(l.Portal, {
                        asChild: !0,
                        container: i,
                        children: n
                    })
                })
            })
        };
    D.displayName = A;
    var M = "PopoverContent",
        q = t.forwardRef((e, t) => {
            let r = O(M, e.__scopePopover),
                {
                    forceMount: n = r.forceMount,
                    ...i
                } = e,
                o = S(M, e.__scopePopover);
            return (0, v.jsx)(d.Presence, {
                present: n || o.open,
                children: o.modal ? (0, v.jsx)(V, {
                    ...i,
                    ref: t
                }) : (0, v.jsx)(N, {
                    ...i,
                    ref: t
                })
            })
        });
    q.displayName = M;
    var U = (0, h.createSlot)("PopoverContent.RemoveScroll"),
        V = t.forwardRef((e, i) => {
            let o = S(M, e.__scopePopover),
                a = t.useRef(null),
                s = (0, n.useComposedRefs)(i, a),
                u = t.useRef(!1);
            return t.useEffect(() => {
                let e = a.current;
                if (e) return (0, b.hideOthers)(e)
            }, []), (0, v.jsx)(m.RemoveScroll, {
                as: U,
                allowPinchZoom: !0,
                children: (0, v.jsx)(j, {
                    ...e,
                    ref: s,
                    trapFocus: o.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, r.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        e.preventDefault(), u.current || o.triggerRef.current?.focus()
                    }),
                    onPointerDownOutside: (0, r.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        u.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, r.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        N = t.forwardRef((e, r) => {
            let n = S(M, e.__scopePopover),
                i = t.useRef(!1),
                o = t.useRef(!1);
            return (0, v.jsx)(j, {
                ...e,
                ref: r,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    e.onCloseAutoFocus?.(t), t.defaultPrevented || (i.current || n.triggerRef.current?.focus(), t.preventDefault()), i.current = !1, o.current = !1
                },
                onInteractOutside: t => {
                    e.onInteractOutside?.(t), t.defaultPrevented || (i.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                    let r = t.target;
                    n.triggerRef.current?.contains(r) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                }
            })
        }),
        j = t.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: n,
                onOpenAutoFocus: i,
                onCloseAutoFocus: u,
                disableOutsidePointerEvents: l,
                onEscapeKeyDown: d,
                onPointerDownOutside: p,
                onFocusOutside: h,
                onInteractOutside: f,
                ...b
            } = e, m = S(M, r), y = w(r);
            return (0, a.useFocusGuards)(), (0, v.jsx)(s.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: n,
                onMountAutoFocus: i,
                onUnmountAutoFocus: u,
                children: (0, v.jsx)(o.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: l,
                    onInteractOutside: f,
                    onEscapeKeyDown: d,
                    onPointerDownOutside: p,
                    onFocusOutside: h,
                    onDismiss: () => m.onOpenChange(!1),
                    children: (0, v.jsx)(c.Content, {
                        "data-state": B(m.open),
                        role: "dialog",
                        id: m.contentId,
                        ...y,
                        ...b,
                        ref: t,
                        style: {
                            ...b.style,
                            "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                            "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                            "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                            "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                            "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                        }
                    })
                })
            })
        }),
        L = "PopoverClose",
        _ = t.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...i
            } = e, o = S(L, n);
            return (0, v.jsx)(p.Primitive.button, {
                type: "button",
                ...i,
                ref: t,
                onClick: (0, r.composeEventHandlers)(e.onClick, () => o.onOpenChange(!1))
            })
        });
    _.displayName = L;
    var F = t.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...n
        } = e, i = w(r);
        return (0, v.jsx)(c.Arrow, {
            ...i,
            ...n,
            ref: t
        })
    });

    function B(e) {
        return e ? "open" : "closed"
    }
    F.displayName = "PopoverArrow", e.s(["Anchor", 0, R, "Arrow", 0, F, "Close", 0, _, "Content", 0, q, "Portal", 0, D, "Root", 0, I, "Trigger", 0, x])
}, 598887, e => {
    "use strict";
    var t = e.i(518250),
        r = e.i(739473),
        n = e.i(248951),
        i = e.i(83311),
        o = e.i(333982);
    let a = {
            featureName: "PaymentsPackage",
            team: "Economy > Payments & Fraud",
            features: {
                PriceTag: {
                    counters: [{
                        name: "PriceTag_ArabicLocaleTriggered"
                    }],
                    criticalErrors: [{
                        name: "PriceTag_NumberFormatLocaleException",
                        dimensions: ["currencyCode", "internalPageName"]
                    }, {
                        name: "PriceTag_DataNotValid",
                        dimensions: ["currencyCode"]
                    }]
                },
                RobuxBalance: {
                    counters: [{
                        name: "RobuxBalance_UpdatedOnRefetch"
                    }],
                    apiCalls: ["GetRobuxBalance"]
                },
                PaymentSession: {
                    apiCalls: ["CreatePaymentSession", "GetPaymentSession", "GetPaymentSessionByCheckoutSessionId"]
                },
                Metadata: {
                    apiCalls: ["GetMetadata"]
                },
                PersonalizedBonusItem: {
                    apiCalls: ["CreateOrGetBonusSessionByPaymentSessionId", "GetDisplayableBonusForProduct", "GetBonusSessionByCheckoutSessionId", "GetThumbnails", "HandleGameJoinEvent"]
                },
                CreditConversion: {
                    errors: [{
                        name: "Error_CreditConversion_ApiFailed",
                        dimensions: ["call", "statusCode"]
                    }]
                },
                CreditBalancePayment: {
                    errors: [{
                        name: "Error_CreditBalancePayment_UpdateAddressFailed",
                        dimensions: ["statusCode"]
                    }]
                }
            }
        },
        s = (0, o.createFireTelemetryCounter)(a.featureName),
        {
            trackCounter: u,
            trackError: c,
            trackCriticalError: l
        } = (0, t.createTrackers)(a, {
            publish: s,
            captureException: n.captureException
        }),
        d = (0, i.createWithApiMetricsV2)(s, n.captureException);
    (0, r.createObsErrorBoundary)(a, {
        publish: s,
        captureException: n.captureException,
        featureName: a.featureName
    }), e.s(["trackCounter", 0, u, "trackCriticalError", 0, l, "withApiEventsV2", 0, d])
}, 309380, 764925, e => {
    "use strict";
    e.i(737344);
    var t, r = function(e, t) {
        return (r = Object.setPrototypeOf || ({
            __proto__: []
        }) instanceof Array && function(e, t) {
            e.__proto__ = t
        } || function(e, t) {
            for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
        })(e, t)
    };

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }
    var i = function() {
        return (i = Object.assign || function(e) {
            for (var t, r = 1, n = arguments.length; r < n; r++)
                for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
            return e
        }).apply(this, arguments)
    };

    function o(e, t, r, n) {
        return new(r || (r = Promise))(function(i, o) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(a, s)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var r, n, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(u) {
                var c = [s, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                    if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                    switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return o.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            o.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                o.label = c[1];
                                break
                            }
                            if (6 === c[0] && o.label < i[1]) {
                                o.label = i[1], i = c;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(c);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    c = t.call(e, o)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function s(e, t, r) {
        if (r || 2 == arguments.length)
            for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
        return e.concat(n || Array.prototype.slice.call(t))
    }
    "function" == typeof SuppressedError && SuppressedError;
    var u, c = {
            envName: ""
        },
        l = !1,
        d = function() {
            try {
                if ("u" < typeof window) return i({}, c);
                var e = localStorage.getItem("Roblox.MrRouterConfig");
                if (null == e) return i({}, c);
                var t = JSON.parse(e);
                if ("object" != typeof t || null === t) return i({}, c);
                var r = i(i({}, c), "envName" in t && "string" == typeof t.envName && {
                    envName: t.envName
                });
                return r.envName && !l && (l = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
            } catch (e) {
                return i({}, c)
            }
        },
        p = "mrrouter-env",
        h = "tracestate",
        f = "traceparent",
        b = function(e) {
            var t = e.indexOf("=");
            return (-1 === t ? e : e.slice(0, t)).trim()
        },
        m = function(e, t) {
            var r = "".concat(p, "=").concat(encodeURIComponent(t)),
                n = null == e ? void 0 : e.trim(),
                i = n ? n.split(",") : [],
                o = i.findIndex(function(e) {
                    return b(e) === p
                });
            if (-1 === o) return s(s([], i.map(function(e) {
                return e.trim()
            }), !0), [r], !1).join(",");
            var a = i.filter(function(e) {
                return b(e) !== p
            }).map(function(e) {
                return e.trim()
            });
            return a.splice(o, 0, r), a.join(",")
        },
        v = function(e) {
            var t = new Uint8Array(e);
            return crypto.getRandomValues(t), Array.from(t, function(e) {
                return e.toString(16).padStart(2, "0")
            }).join("")
        },
        y = "u" > typeof crypto && "function" == typeof crypto.randomUUID,
        P = function() {
            return y ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : v(16)
        },
        g = function() {
            return y ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : v(8)
        },
        w = function(e) {
            var t = d().envName;
            if (t.length > 0 && (e[h] = m(e[h], t), !e[f])) {
                var r = P(),
                    n = g();
                e[f] = "00-".concat(r, "-").concat(n, "-01")
            }
        },
        T = function(e) {
            return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
        },
        S = function(e, t) {
            return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                tags: {
                    apiUrl: T(t.url),
                    apiStatus: null == t ? void 0 : t.status,
                    cors: !1
                }
            }), t
        },
        I = function(e, t) {
            e(Error("Network error"), {
                tags: {
                    apiUrl: T(t),
                    cors: !0
                }
            })
        },
        C = function() {
            function e(e) {
                this.captureException = e
            }
            return e.prototype.post = function(e) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(t) {
                        return [2, S(this.captureException, e.response)]
                    })
                })
            }, e.prototype.onError = function(e) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(t) {
                        return I(this.captureException, e.url), [2]
                    })
                })
            }, e
        }(),
        R = function(e) {
            if (document) {
                var t, r, n = document.getElementById("hba-frame");
                return null === n && ((t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), r = t, n = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), n
            }
            return null
        },
        E = function() {
            var e = window.location.hostname.split(".").slice(0, -2).join(".");
            return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
        },
        x = function(e, t) {
            try {
                fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                    method: "POST",
                    body: JSON.stringify({
                        name: "load_time_hba_frame",
                        value: t,
                        labelValues: {
                            origin_site: E()
                        }
                    })
                })
            } catch (e) {}
        },
        A = function(e, t) {
            try {
                fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                    method: "POST",
                    body: JSON.stringify({
                        name: "response_time_hba_frame",
                        value: t,
                        labelValues: {
                            origin_site: E()
                        }
                    })
                })
            } catch (e) {}
        },
        k = function(e, t, r) {
            return void 0 === r && (r = 1500), new Promise(function(n, i) {
                var o, a, s = performance.now(),
                    u = window.setTimeout(function() {
                        x(e, performance.now() - s),
                            function(e) {
                                try {
                                    fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                        method: "POST",
                                        body: JSON.stringify({
                                            name: "event_hba_frame",
                                            value: 1,
                                            labelValues: {
                                                event_type: "FrameLoadTimedOut",
                                                origin_site: E()
                                            }
                                        })
                                    })
                                } catch (e) {}
                            }(e), i(Error("Promise timed out after ".concat(r, " ms")))
                    }, r),
                    c = o = function(t) {
                        var r = t.data;
                        t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", o, !1), window.clearTimeout(u), x(e, performance.now() - s), n())
                    };
                window.addEventListener("message", c, !1), null == (a = t.contentWindow) || a.postMessage({
                    msg: "checkLoadedRequest"
                }, "https://www.".concat(e))
            })
        },
        O = function(e, t, r, n, o, a, s) {
            var u;
            if (void 0 === s && (s = 100), window) {
                var c, l = performance.now(),
                    d = window.setTimeout(function() {
                        A(r, performance.now() - l),
                            function(e) {
                                try {
                                    fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                        method: "POST",
                                        body: JSON.stringify({
                                            name: "event_hba_frame",
                                            value: 1,
                                            labelValues: {
                                                event_type: "FrameResponseTimedOut",
                                                origin_site: E()
                                            }
                                        })
                                    })
                                } catch (e) {}
                            }(r), e({
                                url: o.url,
                                init: o.init
                            })
                    }, s),
                    p = c = function(t) {
                        var n = t.data,
                            s = o.url,
                            u = o.init;
                        if (t.origin === "https://www.".concat(r) && "dataFromHbaFrame" === n.msg && "batHeader" === n.data.type && (!n.data.identifier || n.data.identifier === a))
                            if (!n.data.isError && n.data.batHeader) {
                                window.clearTimeout(d), window.removeEventListener("message", c, !1), A(r, performance.now() - l);
                                var p = n.data.batHeader;
                                e({
                                    url: s,
                                    init: i(i({}, u), {
                                        headers: i(i({}, u.headers), {
                                            "x-bound-auth-token": p["x-bound-auth-token"]
                                        })
                                    })
                                })
                            } else window.clearTimeout(d), window.removeEventListener("message", c, !1), A(r, performance.now() - l), e({
                                url: s,
                                init: u
                            })
                    };
                window.addEventListener("message", p, !1), null == (u = n.contentWindow) || u.postMessage({
                    msg: "signSubdomainRequest",
                    identifier: a,
                    serializedSubdomainRequestData: JSON.stringify({
                        url: o.url,
                        requestInit: o.init
                    })
                }, "https://www.".concat(r))
            }
        },
        D = function() {
            return crypto.randomUUID()
        },
        M = function() {
            function e(e, t, r) {
                void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
            }
            return e.prototype.getOrCreateHbaFrame = function() {
                return R(this.robloxSiteDomain)
            }, e.prototype.pre = function(e) {
                var t = this;
                return new Promise(function(r, n) {
                    var i = e.url,
                        o = e.init;
                    if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                        var a = D();
                        t.hbaFrameAlreadyLoaded ? O(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                            url: i,
                            init: o
                        }) : k(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                            t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, O(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut)) : r({
                                url: i,
                                init: o
                            })
                        }).catch(function() {
                            t.hbaFrameLoadFailed = !0, r({
                                url: i,
                                init: o
                            })
                        })
                    } else r({
                        url: i,
                        init: o
                    })
                })
            }, e
        }();
    (t = u || (u = {})).UNKNOWN = "unknown", t.INVALIDATED = "invalidated", t.ABANDONED = "abandoned", t.LOADFAILED = "loadfailed";
    var q = function(e) {
            function t(t) {
                var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                return r.parameters = t, r
            }
            return n(t, e), t.prototype.match = function(e) {
                return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
            }, t.prototype.matchAbandoned = function(e) {
                return this.match(e) && e.parameters.kind === u.ABANDONED
            }, t
        }(Error),
        U = "rblx-challenge-id",
        V = "rblx-challenge-type",
        N = "rblx-challenge-metadata",
        j = function(e, t) {
            return 403 === e.status && e.headers.has(U) && e.headers.has(V) && e.headers.has(N) && "iframe" === t
        },
        L = function(e) {
            var t, r, n, o, a, s, c, l, d, p = e.url,
                h = e.request,
                f = e.response,
                b = e.robloxSiteDomain,
                m = (a = new URLSearchParams([
                    ["challenge-type", "generic"],
                    ["dark-mode", "true"],
                    ["barista-mode", "true"],
                    ["generic-challenge-type", null != (t = f.headers.get(V)) ? t : ""],
                    ["generic-challenge-id", null != (r = f.headers.get(U)) ? r : ""],
                    ["challenge-metadata-json", null != (n = f.headers.get(N)) ? n : ""],
                    ["origin", null != (o = window.location.hostname.split(".").slice(0, -2).join(".")) ? o : ""]
                ]), s = new URL("https://www.".concat(b, "/challenge/cdn/hybrid?").concat(a.toString())), (c = document.createElement("iframe")).id = "challenge-frame", c.allowFullscreen = !0, c.setAttribute("allowtransparency", "true"), c.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), c.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", c.src = s.toString(), c.onload = function() {
                    c.style.visibility = "visible"
                }, l = c, document && document.body ? document.body.appendChild(l) : null);
            return new Promise(function(e, t) {
                window && m && (d = function(r) {
                    var n, o, a, s, c, l, d, b, m, v, y;
                    if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                        case "challengeAbandoned":
                            t(new q({
                                kind: u.ABANDONED,
                                data: {
                                    challengeType: null != (n = f.headers.get(V)) ? n : ""
                                }
                            }));
                            break;
                        case "challengeDisplayed":
                            break;
                        case "challengeCompleted":
                            (d = r.data.genericChallengeResponse.data).challengeType && d.metadata ? e((b = d.metadata, fetch(p, i(i({}, h), {
                                headers: i(i({}, h.headers), ((m = {})[U] = null != (v = f.headers.get(U)) ? v : "", m[N] = btoa(JSON.stringify(b)), m[V] = null != (y = f.headers.get(V)) ? y : "", m))
                            })))) : t(new q({
                                kind: u.UNKNOWN,
                                data: {
                                    challengeType: null != (o = f.headers.get(V)) ? o : ""
                                }
                            }));
                            break;
                        case "challengeInvalidated":
                            t((d = r.data.genericChallengeResponse.data) && d.challengeType && d.metadata ? new q({
                                kind: u.INVALIDATED,
                                data: d
                            }) : new q({
                                kind: u.INVALIDATED,
                                data: {
                                    challengeType: null != (a = f.headers.get(V)) ? a : ""
                                }
                            }));
                            break;
                        case "challengeParsed":
                            !1 === (d = r.data.genericChallengeResponse.data).parsed && t(new q({
                                kind: u.UNKNOWN,
                                data: {
                                    challengeType: null != (s = f.headers.get(V)) ? s : ""
                                }
                            }));
                            break;
                        case "challengeInitialized":
                            !1 === (d = r.data.genericChallengeResponse.data).initialized && t(new q({
                                kind: u.UNKNOWN,
                                data: {
                                    challengeType: null != (c = f.headers.get(V)) ? c : ""
                                }
                            }));
                            break;
                        case "challengePageLoaded":
                            !1 === (d = r.data.genericChallengeResponse.data).pageLoaded && t(new q({
                                kind: u.LOADFAILED,
                                data: {
                                    challengeType: null != (l = f.headers.get(V)) ? l : ""
                                }
                            }))
                    }
                }, window.addEventListener("message", d, !1))
            }).finally(function() {
                null == m || m.remove(), d && window.removeEventListener("message", d, !1)
            })
        },
        _ = function() {
            function e(e, t) {
                void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t
            }
            return e.prototype.post = function(e) {
                var t = e.url,
                    r = e.init,
                    n = e.response;
                return j(n, this.genericChallengeMiddlewareType) ? L({
                    url: t,
                    request: r,
                    response: n,
                    robloxSiteDomain: this.robloxSiteDomain
                }) : Promise.resolve(n)
            }, e
        }(),
        F = "x-csrf-token",
        B = ["POST", "PATCH", "DELETE", "PUT"],
        G = function(e) {
            return 403 === e.status && null !== e.headers.get(F)
        },
        z = function() {
            var e, t = "";
            try {
                "u" > typeof window && (t = null != (e = localStorage.getItem(F)) ? e : "")
            } catch (e) {
                console.warn("Error reading localStorage key “".concat(F, "”:"), e)
            }
            return t
        },
        K = z(),
        J = function(e) {
            try {
                K = e, "u" > typeof window && localStorage.setItem(F, e)
            } catch (e) {
                console.warn("Error setting localStorage key “".concat(F, "”:"), e)
            }
        },
        H = function(e) {
            var t = e.elapsedTime,
                r = e.url,
                n = e.status,
                o = e.schemaPath,
                a = e.baseUrl;
            return {
                eventName: "apiVitals",
                parameters: i({
                    elapsedTime: String(t),
                    apiUrl: r,
                    statusCode: String(n)
                }, void 0 === o ? {} : {
                    schemaPath: a ? "".concat(a.replace(/\/+$/, ""), "/").concat(o.replace(/^\/+/, "")) : o
                })
            }
        },
        W = function() {
            function e(e, t) {
                this.unifiedLogger = e, this.baseUrl = t
            }
            return e.prototype.post = function(e) {
                return G(e.response) || this.unifiedLogger.logApiVitalsEvent(H({
                    elapsedTime: e.elapsedTime,
                    url: e.url,
                    status: e.response.status,
                    schemaPath: e.schemaPath,
                    baseUrl: this.baseUrl
                })), Promise.resolve(e.response)
            }, e
        }(),
        $ = function() {
            function e() {
                this.currentToken = z()
            }
            return e.prototype.pre = function(e) {
                var t = e.url,
                    r = e.init,
                    n = this.currentToken;
                return r.headers && "object" == typeof r.headers && F in r.headers && (n = r.headers[F]) && (this.currentToken = n, J(n)), r.method && B.includes(r.method) ? Promise.resolve({
                    url: t,
                    init: this.prepareRequestInit(r)
                }) : Promise.resolve({
                    url: t,
                    init: r
                })
            }, e.prototype.post = function(e) {
                var t = e.fetch,
                    r = e.url,
                    n = e.init,
                    i = e.response;
                if (G(i)) {
                    var o = i.headers.get(F);
                    return this.currentToken = o, J(o), t(r, this.prepareRequestInit(n))
                }
                return Promise.resolve(i)
            }, e.prototype.prepareRequestInit = function(e) {
                var t;
                return i(i({}, e), {
                    headers: i(i({}, e.headers), ((t = {})[F] = this.currentToken, t))
                })
            }, e
        }(),
        Y = [],
        Q = function(e) {
            Y = Y.filter(function(t) {
                return t !== e
            })
        },
        Z = function(e) {
            var t = e.url;
            503 === e.status && Y.forEach(function(e) {
                return e(t)
            })
        },
        X = function() {
            function e() {}
            return e.prototype.subscribe = function(e) {
                return Y.push(e),
                    function() {
                        return Q(e)
                    }
            }, e.prototype.unsubscribe = function(e) {
                return Q(e)
            }, e.prototype.post = function(e) {
                var t = e.response;
                return Z(t), Promise.resolve(t)
            }, e
        }(),
        ee = function() {
            function e() {}
            return e.prototype.pre = function(e) {
                var t = e.url,
                    r = e.init;
                if (!d().envName) return Promise.resolve({
                    url: t,
                    init: r
                });
                var n = i({}, r.headers);
                return w(n), Promise.resolve({
                    url: t,
                    init: i(i({}, r), {
                        headers: n
                    })
                })
            }, e
        }(),
        et = new $,
        er = new X,
        en = [function(e) {
            return e.captureException ? new C(e.captureException) : void 0
        }, function(e) {
            return e.robloxSiteDomain && e.enableBoundAuthToken ? new M(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
        }, function(e) {
            return e.robloxSiteDomain ? new _(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
        }, function(e) {
            return e.unifiedLogger ? new W(e.unifiedLogger, e.basePath) : void 0
        }, function() {
            return et
        }, function() {
            return er
        }, function(e) {
            return e.enableMrRouter ? new ee : void 0
        }],
        ei = function() {
            function e(e) {
                void 0 === e && (e = {}), this.configuration = e
            }
            return Object.defineProperty(e.prototype, "config", {
                set: function(e) {
                    this.configuration = e
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "basePath", {
                get: function() {
                    return this.configuration.basePath
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "fetchApi", {
                get: function() {
                    return this.configuration.fetchApi || window.fetch.bind(window)
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "middleware", {
                get: function() {
                    return this.configuration.middleware || []
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "queryParamsStringify", {
                get: function() {
                    return this.configuration.queryParamsStringify || function e(t, r) {
                        return void 0 === r && (r = ""), Object.keys(t).map(function(n) {
                            return function t(r, n, i) {
                                void 0 === i && (i = "");
                                var o = i + (i.length ? "[".concat(r, "]") : r);
                                if (n instanceof Array) {
                                    var a = n.map(function(e) {
                                        return encodeURIComponent(String(e))
                                    }).join("&".concat(encodeURIComponent(o), "="));
                                    return "".concat(encodeURIComponent(o), "=").concat(a)
                                }
                                return n instanceof Set ? t(r, Array.from(n), i) : n instanceof Date ? "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(n.toISOString())) : n instanceof Object ? e(n, o) : "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(String(n)))
                            }(n, t[n], r)
                        }).filter(function(e) {
                            return e.length > 0
                        }).join("&")
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "username", {
                get: function() {
                    return this.configuration.username
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "password", {
                get: function() {
                    return this.configuration.password
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "apiKey", {
                get: function() {
                    var e = this.configuration.apiKey;
                    if (e) return "function" == typeof e ? e : function() {
                        return e
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "accessToken", {
                get: function() {
                    var e = this,
                        t = this.configuration.accessToken;
                    if (t) return "function" == typeof t ? t : function() {
                        return o(e, void 0, void 0, function() {
                            return a(this, function(e) {
                                return [2, t]
                            })
                        })
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "headers", {
                get: function() {
                    return this.configuration.headers
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "credentials", {
                get: function() {
                    return this.configuration.credentials
                },
                enumerable: !1,
                configurable: !0
            }), e
        }(),
        eo = new ei,
        ea = function() {
            function e(e) {
                void 0 === e && (e = eo);
                var t = this;
                this.configuration = e, this.fetchApi = function(e, r, n) {
                    return o(t, void 0, void 0, function() {
                        var t, o, s, u, c, l, d, p, h, f, b, m, v, y = this;
                        return a(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    t = function(e, t) {
                                        return y.fetchApi(e, t, n)
                                    }, o = {
                                        url: e,
                                        init: r
                                    }, s = 0, u = this.middleware, a.label = 1;
                                case 1:
                                    return s < u.length ? (v = u[s]).pre ? [4, v.pre(i({
                                        fetch: t
                                    }, o))] : [3, 3] : [3, 4];
                                case 2:
                                    o = a.sent() || o, a.label = 3;
                                case 3:
                                    return s++, [3, 1];
                                case 4:
                                    c = void 0, l = performance.now(), a.label = 5;
                                case 5:
                                    return a.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(o.url, o.init)];
                                case 6:
                                    return c = a.sent(), d = performance.now(), [3, 12];
                                case 7:
                                    p = a.sent(), d = performance.now(), h = 0, f = this.middleware, a.label = 8;
                                case 8:
                                    return h < f.length ? (v = f[h]).onError ? [4, v.onError({
                                        fetch: t,
                                        url: o.url,
                                        init: o.init,
                                        error: p,
                                        response: c ? c.clone() : void 0
                                    })] : [3, 10] : [3, 11];
                                case 9:
                                    c = a.sent() || c, a.label = 10;
                                case 10:
                                    return h++, [3, 8];
                                case 11:
                                    if (void 0 === c) throw p instanceof Error ? new eu(p, "The request failed and the interceptors did not return an alternative response") : p;
                                    return [3, 12];
                                case 12:
                                    b = 0, m = this.middleware, a.label = 13;
                                case 13:
                                    return b < m.length ? (v = m[b]).post ? [4, v.post({
                                        fetch: t,
                                        url: o.url,
                                        init: o.init,
                                        response: c.clone(),
                                        elapsedTime: d - l,
                                        schemaPath: n
                                    })] : [3, 15] : [3, 16];
                                case 14:
                                    c = a.sent() || c, a.label = 15;
                                case 15:
                                    return b++, [3, 13];
                                case 16:
                                    return [2, c]
                            }
                        })
                    })
                }, this.middleware = e.middleware
            }
            return e.prototype.withMiddleware = function() {
                for (var e, t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
                var n = this.clone();
                return n.middleware = (e = n.middleware).concat.apply(e, t), n
            }, e.prototype.withPreMiddleware = function() {
                for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                var r = e.map(function(e) {
                    return {
                        pre: e
                    }
                });
                return this.withMiddleware.apply(this, r)
            }, e.prototype.withPostMiddleware = function() {
                for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                var r = e.map(function(e) {
                    return {
                        post: e
                    }
                });
                return this.withMiddleware.apply(this, r)
            }, e.prototype.isJsonMime = function(t) {
                return !!t && e.jsonRegex.test(t)
            }, e.prototype.request = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var r, n, i, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.createFetchParams(e, t)];
                            case 1:
                                return n = (r = a.sent()).url, i = r.init, [4, this.fetchApi(n, i, e.schemaPath)];
                            case 2:
                                if ((o = a.sent()) && o.status >= 200 && o.status < 300) return [2, o];
                                throw new es(o, "Response from ".concat(o.url, " returned an error code ").concat(o.status))
                        }
                    })
                })
            }, e.prototype.createFetchParams = function(e, t) {
                return o(this, void 0, void 0, function() {
                    var r, n, s, u, c, l, d, p = this;
                    return a(this, function(h) {
                        var f, b;
                        switch (h.label) {
                            case 0:
                                return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                    return void 0 === n[e] ? delete n[e] : {}
                                }), s = "function" == typeof t ? t : function() {
                                    return o(p, void 0, void 0, function() {
                                        return a(this, function(e) {
                                            return [2, t]
                                        })
                                    })
                                }, u = {
                                    method: e.method,
                                    headers: n,
                                    body: e.body,
                                    credentials: this.configuration.credentials
                                }, l = [i({}, u)], [4, s({
                                    init: u,
                                    context: e
                                })];
                            case 1:
                                return c = i.apply(void 0, l.concat([h.sent()])), d = i(i({}, c), {
                                    body: (f = c.body, "u" > typeof FormData && f instanceof FormData || c.body instanceof URLSearchParams || (b = c.body, "u" > typeof Blob && b instanceof Blob) ? c.body : JSON.stringify(c.body))
                                }), [2, {
                                    url: r,
                                    init: d
                                }]
                        }
                    })
                })
            }, e.prototype.clone = function() {
                var e = new(0, this.constructor)(this.configuration);
                return e.middleware = this.middleware.slice(), e
            }, e.jsonRegex = RegExp("^(:?application/json|[^;/ 	]+/[^;/ 	]+[+]json)[ 	]*(:?;.*)?$", "i"), e
        }(),
        es = function(e) {
            function t(t, r) {
                var n = e.call(this, r) || this;
                return n.response = t, n.name = "ResponseError", n
            }
            return n(t, e), t
        }(Error),
        eu = function(e) {
            function t(t, r) {
                var n = e.call(this, r) || this;
                return n.cause = t, n.name = "FetchError", n
            }
            return n(t, e), t
        }(Error),
        ec = function(e) {
            function t(t, r) {
                var n = e.call(this, r) || this;
                return n.field = t, n.name = "RequiredError", n
            }
            return n(t, e), t
        }(Error);

    function el(e, t) {
        return null != e[t]
    }
    var ed = function() {
            function e(e, t) {
                void 0 === t && (t = function(e) {
                    return e
                }), this.raw = e, this.transformer = t
            }
            return e.prototype.value = function() {
                return o(this, void 0, void 0, function() {
                    var e;
                    return a(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return e = this.transformer, [4, this.raw.json()];
                            case 1:
                                return [2, e.apply(this, [t.sent()])]
                        }
                    })
                })
            }, e
        }(),
        ep = function() {
            function e(e) {
                this.raw = e
            }
            return e.prototype.value = function() {
                return o(this, void 0, void 0, function() {
                    return a(this, function(e) {
                        return [2, void 0]
                    })
                })
            }, e
        }(),
        eh = ((function(e) {
            this.raw = e
        }).prototype.value = function() {
            return o(this, void 0, void 0, function() {
                return a(this, function(e) {
                    switch (e.label) {
                        case 0:
                            return [4, this.raw.blob()];
                        case 1:
                            return [2, e.sent()]
                    }
                })
            })
        }, (function(e) {
            this.raw = e
        }).prototype.value = function() {
            return o(this, void 0, void 0, function() {
                return a(this, function(e) {
                    switch (e.label) {
                        case 0:
                            return [4, this.raw.text()];
                        case 1:
                            return [2, e.sent()]
                    }
                })
            })
        }, function(e) {
            function t(t) {
                void 0 === t && (t = {});
                var r, n = i({}, t),
                    o = n.middleware || [];
                return o.unshift.apply(o, (r = t, en.map(function(e) {
                    return e(r)
                }).filter(function(e) {
                    return e
                }))), n.middleware = o, e.call(this, n) || this
            }
            return n(t, e), t
        }(ei));
    e.s(["BaseAPI", 0, ea, "Configuration", 0, eh, "JSONApiResponse", 0, ed, "RequiredError", 0, ec, "VoidApiResponse", 0, ep, "exists", 0, el], 764925);
    var ef = function(e, t) {
        return (ef = Object.setPrototypeOf || ({
            __proto__: []
        }) instanceof Array && function(e, t) {
            e.__proto__ = t
        } || function(e, t) {
            for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
        })(e, t)
    };

    function eb(e, t, r, n) {
        return new(r || (r = Promise))(function(i, o) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(a, s)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function em(e, t) {
        var r, n, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function s(s) {
            return function(u) {
                var c = [s, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (o = 0)), o;) try {
                    if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                    switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return o.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            o.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                o.label = c[1];
                                break
                            }
                            if (6 === c[0] && o.label < i[1]) {
                                o.label = i[1], i = c;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(c);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    c = t.call(e, o)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function ev(e) {
        return e
    }
    "function" == typeof SuppressedError && SuppressedError;

    function ey(e, t) {
        return null == e ? e : {
            currencyCode: e.currencyCode,
            units: e.units,
            nanos: e.nanos
        }
    }

    function eP(e) {
        return e
    }

    function eg(e) {
        var t, r;
        return null == (t = e) ? t : {
            offerType: el(t, "offerType") ? t.offerType : void 0,
            freeTrialOffer: el(t, "freeTrialOffer") ? null == (r = t.freeTrialOffer) ? r : {
                periodType: r.periodType,
                duration: r.duration,
                estimatedTrialEndDate: el(r, "estimatedTrialEndDate") ? null === r.estimatedTrialEndDate ? null : new Date(r.estimatedTrialEndDate) : void 0
            } : void 0
        }
    }

    function ew(e) {
        var t;
        return null == (t = e) ? t : {
            type: t.type,
            id: t.id
        }
    }

    function eT(e) {
        var t;
        return null == (t = e) ? t : {
            tierId: t.tierId,
            periodIndex: t.periodIndex,
            discountPercent: t.discountPercent
        }
    }

    function eS(e) {
        var t, r, n, i, o, a, s, u, c;
        return null == (t = e) ? t : {
            productKey: ew(t.productKey),
            periodType: t.periodType,
            periodCount: t.periodCount,
            localizedPrice: ey(t.localizedPrice),
            localizedPriceDisplayString: t.localizedPriceDisplayString,
            localizedStrikethroughPrice: ey(t.localizedStrikethroughPrice),
            localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
            productTypeDetails: null == (r = t.productTypeDetails) ? r : {
                currencySubscriptionProductDetails: el(r, "currencySubscriptionProductDetails") ? null == (n = r.currencySubscriptionProductDetails) ? n : {
                    currencyType: n.currencyType,
                    entitledAmountMicros: n.entitledAmountMicros
                } : void 0,
                developerSubscriptionProductDetails: el(r, "developerSubscriptionProductDetails") ? null == (i = r.developerSubscriptionProductDetails) ? i : {
                    universeId: i.universeId,
                    imageAssetId: i.imageAssetId,
                    localizedName: i.localizedName,
                    localizedDescription: i.localizedDescription
                } : void 0,
                robloxSubscriptionProductDetails: el(r, "robloxSubscriptionProductDetails") ? null == (o = r.robloxSubscriptionProductDetails) ? o : {
                    featureConfig: null == (a = o.featureConfig) ? a : {
                        virtualTransactionDiscounts: null === a.virtualTransactionDiscounts ? null : a.virtualTransactionDiscounts.map(eT),
                        isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                        isTradingEnabled: a.isTradingEnabled,
                        isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                        privateServerDiscounts: null === a.privateServerDiscounts ? null : a.privateServerDiscounts.map(eT),
                        currencySubscriptionConfig: null == (s = a.currencySubscriptionConfig) ? s : {
                            currencyType: s.currencyType,
                            entitledAmountMicros: s.entitledAmountMicros
                        },
                        coreContentPublishingConfig: null == (u = a.coreContentPublishingConfig) ? u : {
                            minimumPeriodIndex: u.minimumPeriodIndex
                        },
                        isAppThemesEnabled: a.isAppThemesEnabled,
                        isProfileFrameEnabled: a.isProfileFrameEnabled,
                        isAiBackgroundEnabled: a.isAiBackgroundEnabled,
                        robuxTransferConfig: null == (c = a.robuxTransferConfig) ? c : {
                            isElevatedLimitEnabled: c.isElevatedLimitEnabled
                        },
                        referralConfig: a.referralConfig
                    }
                } : void 0
            },
            eligibleOffers: t.eligibleOffers.map(eg)
        }
    }

    function eI(e) {
        var t;
        return null == (t = e) ? t : {
            planChangeId: t.planChangeId,
            currentSubscriptionProductKey: ew(t.currentSubscriptionProductKey),
            targetSubscriptionProductKey: ew(t.targetSubscriptionProductKey),
            status: t.status,
            scheduledTimestampMs: t.scheduledTimestampMs,
            createdTimestampMs: t.createdTimestampMs,
            updatedTimestampMs: t.updatedTimestampMs
        }
    }

    function eC(e) {
        var t;
        return null == (t = e) ? t : {
            referralId: t.referralId,
            senderUserId: t.senderUserId,
            status: t.status,
            createdTimestampMs: t.createdTimestampMs
        }
    }

    function eR(e) {
        var t, r, n, i, o, a, s;
        return null == (t = e) ? t : {
            subscriptionId: t.subscriptionId,
            productKey: ew(t.productKey),
            periodType: t.periodType,
            displayPrice: ey(t.displayPrice),
            recurringDisplayPrice: el(t, "recurringDisplayPrice") ? ey(t.recurringDisplayPrice) : void 0,
            activationTimestampMs: t.activationTimestampMs,
            paidTenureStartTimestampMs: el(t, "paidTenureStartTimestampMs") ? t.paidTenureStartTimestampMs : void 0,
            expirationTimestampMs: t.expirationTimestampMs,
            nextRenewalTimestampMs: t.nextRenewalTimestampMs,
            paymentProvider: eP(t.paymentProvider),
            purchasePlatform: t.purchasePlatform,
            paymentProfile: null == (r = t.paymentProfile) ? r : {
                id: r.id,
                cardInfo: null == (n = r.cardInfo) ? n : {
                    cardNetwork: n.cardNetwork,
                    lastFourDigits: n.lastFourDigits,
                    expirationMonth: n.expirationMonth,
                    expirationYear: n.expirationYear
                }
            },
            activeOffers: t.activeOffers.map(eg),
            productTypeMembershipDetails: null == (i = t.productTypeMembershipDetails) ? i : {
                robloxSubscriptionMembershipDetails: el(i, "robloxSubscriptionMembershipDetails") ? null == (o = i.robloxSubscriptionMembershipDetails) ? o : {
                    features: null == (a = o.features) ? a : {
                        productType: a.productType,
                        virtualTransactionDiscountTierId: a.virtualTransactionDiscountTierId,
                        isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                        isTradingEnabled: a.isTradingEnabled,
                        isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                        privateServerDiscountTierId: a.privateServerDiscountTierId,
                        isCoreContentPublishingEnabled: a.isCoreContentPublishingEnabled,
                        isAppThemesEnabled: a.isAppThemesEnabled,
                        isProfileFrameEnabled: a.isProfileFrameEnabled,
                        isAiBackgroundEnabled: a.isAiBackgroundEnabled,
                        isRobuxTransferElevatedLimitEnabled: a.isRobuxTransferElevatedLimitEnabled
                    },
                    currencySubscriptionBenefit: null == (s = o.currencySubscriptionBenefit) ? s : {
                        currencyType: s.currencyType,
                        entitledAmountMicrosPerGrantingPeriod: s.entitledAmountMicrosPerGrantingPeriod,
                        grantingPeriodType: s.grantingPeriodType
                    }
                } : void 0
            },
            productInfo: eS(t.productInfo)
        }
    }
    var eE = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function r() {
                this.constructor = e
            }
            ef(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(t, e), t.prototype.subscriptionsV2CancelSubscriptionPlanChangeRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.subscriptionId || void 0 === e.subscriptionId) throw new ec("subscriptionId", "Required parameter requestParameters.subscriptionId was null or undefined when calling subscriptionsV2CancelSubscriptionPlanChange.");
                            return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v2/subscriptions/{subscriptionId}/cancel-plan-change".replace("{".concat("subscriptionId", "}"), encodeURIComponent(String(e.subscriptionId))),
                                schemaPath: "/v2/subscriptions/{subscriptionId}/cancel-plan-change",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        planChangeId: e.planChangeId
                                    }
                                }(e.cancelSubscriptionPlanChangeRequest)
                            }, t)];
                        case 1:
                            return [2, new ep(i.sent())]
                    }
                })
            })
        }, t.prototype.subscriptionsV2CancelSubscriptionPlanChange = function(e, t) {
            return eb(this, void 0, void 0, function() {
                return em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2CancelSubscriptionPlanChangeRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t.prototype.subscriptionsV2CheckSubscriptionReferralEligibilityRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.referrerId && (r.referrerId = e.referrerId), n = {}, [4, this.request({
                                path: "/v2/referral-eligibility",
                                schemaPath: "/v2/referral-eligibility",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                return null == e ? e : {
                                    eligibility: e.eligibility,
                                    ineligibilityReason: el(e, "ineligibilityReason") ? e.ineligibilityReason : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2CheckSubscriptionReferralEligibility = function() {
            return eb(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2CheckSubscriptionReferralEligibilityRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ClaimSubscriptionProductRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new ec("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new ec("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                            return r = {}, void 0 !== e.grantType && (r.grantType = e.grantType), n = {}, [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim",
                                method: "POST",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent())]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ClaimSubscriptionProduct = function(e, t) {
            return eb(this, void 0, void 0, function() {
                return em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2ClaimSubscriptionProductRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2CreateSubscriptionReferralRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.referrerId && (r.referrerId = e.referrerId), n = {}, [4, this.request({
                                path: "/v2/referrals",
                                schemaPath: "/v2/referrals",
                                method: "POST",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                return null == e ? e : {
                                    referralId: e.referralId
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2CreateSubscriptionReferral = function() {
            return eb(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2CreateSubscriptionReferralRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2CreateSubscriptionReferralLinkRaw = function(e) {
            return eb(this, void 0, void 0, function() {
                var t, r;
                return em(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return t = {}, r = {}, [4, this.request({
                                path: "/v2/referral-links",
                                schemaPath: "/v2/referral-links",
                                method: "POST",
                                headers: r,
                                query: t
                            }, e)];
                        case 1:
                            return [2, new ed(n.sent(), function(e) {
                                return null == e ? e : {
                                    deepLinkUrl: e.deepLinkUrl
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2CreateSubscriptionReferralLink = function(e) {
            return eb(this, void 0, void 0, function() {
                return em(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.subscriptionsV2CreateSubscriptionReferralLinkRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetProductDisplayPriceRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new ec("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new ec("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                            return r = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                return null == e ? e : {
                                    displayPrice: ey(e.displayPrice)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
            return eb(this, void 0, void 0, function() {
                return em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2GetProductDisplayPriceRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetProductPaymentMetadataRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new ec("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new ec("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                            return r = {}, n = {}, [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                return null == e ? e : {
                                    paymentMethods: e.paymentMethods.map(ev),
                                    paymentProviders: e.paymentProviders.map(eP)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
            return eb(this, void 0, void 0, function() {
                return em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2GetProductPaymentMetadataRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetSubscriptionProductInfoRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new ec("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new ec("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                            return r = {}, void 0 !== e.referrerId && (r.referrerId = e.referrerId), n = {}, [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                return null == e ? e : {
                                    subscriptionProductInfo: eS(e.subscriptionProductInfo)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
            return eb(this, void 0, void 0, function() {
                return em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2GetSubscriptionProductInfoRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListAvailableSubscriptionProductsRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.includePurchased && (r.IncludePurchased = e.includePurchased), void 0 !== e.includeBundles && (r.IncludeBundles = e.includeBundles), void 0 !== e.purchasePlatform && (r.PurchasePlatform = e.purchasePlatform), void 0 !== e.skipEligibilityCheck && (r.SkipEligibilityCheck = e.skipEligibilityCheck), void 0 !== e.grantType && (r.GrantType = e.grantType), void 0 !== e.paymentProvider && (r.PaymentProvider = e.paymentProvider), void 0 !== e.includeExtendedTermProducts && (r.IncludeExtendedTermProducts = e.includeExtendedTermProducts), void 0 !== e.referrerId && (r.ReferrerId = e.referrerId), void 0 !== e.includePlanChanges && (r.IncludePlanChanges = e.includePlanChanges), n = {}, [4, this.request({
                                path: "/v2/products",
                                schemaPath: "/v2/products",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                return null == e ? e : {
                                    productKeys: e.productKeys.map(ew),
                                    products: e.products.map(eS)
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
            return eb(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2ListAvailableSubscriptionProductsRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListSubscriptionPlanChangesRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.subscriptionId || void 0 === e.subscriptionId) throw new ec("subscriptionId", "Required parameter requestParameters.subscriptionId was null or undefined when calling subscriptionsV2ListSubscriptionPlanChanges.");
                            return r = {}, void 0 !== e.status && (r.status = e.status), void 0 !== e.pageSize && (r.pageSize = e.pageSize), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, [4, this.request({
                                path: "/v2/subscriptions/{subscriptionId}/plan-changes".replace("{".concat("subscriptionId", "}"), encodeURIComponent(String(e.subscriptionId))),
                                schemaPath: "/v2/subscriptions/{subscriptionId}/plan-changes",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                return null == e ? e : {
                                    planChanges: e.planChanges.map(eI),
                                    nextCursor: e.nextCursor,
                                    hasMore: e.hasMore
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListSubscriptionPlanChanges = function(e, t) {
            return eb(this, void 0, void 0, function() {
                return em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2ListSubscriptionPlanChangesRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListSubscriptionReferralsRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.status && (r.Status = e.status), void 0 !== e.earliestCreatedTimestampMs && (r.EarliestCreatedTimestampMs = e.earliestCreatedTimestampMs), void 0 !== e.pageSize && (r.PageSize = e.pageSize), void 0 !== e.cursor && (r.Cursor = e.cursor), n = {}, [4, this.request({
                                path: "/v2/referrals",
                                schemaPath: "/v2/referrals",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                return null == e ? e : {
                                    referrals: e.referrals.map(eC),
                                    nextCursor: e.nextCursor,
                                    hasMore: e.hasMore
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListSubscriptionReferrals = function() {
            return eb(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2ListSubscriptionReferralsRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListSubscriptionsRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.expirationTimestampMsStart && (r.ExpirationTimestampMsStart = e.expirationTimestampMsStart), void 0 !== e.expirationTimestampMsEnd && (r.ExpirationTimestampMsEnd = e.expirationTimestampMsEnd), void 0 !== e.cursor && (r.Cursor = e.cursor), void 0 !== e.resultsPerPage && (r.ResultsPerPage = e.resultsPerPage), n = {}, [4, this.request({
                                path: "/v2/user/subscriptions",
                                schemaPath: "/v2/user/subscriptions",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                return null == e ? e : {
                                    subscriptions: e.subscriptions.map(eR),
                                    hasMore: e.hasMore,
                                    cursor: e.cursor
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ListSubscriptions = function() {
            return eb(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2ListSubscriptionsRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2PreparePurchaseV2Raw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new ec("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                            if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new ec("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                            return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxUniverseId && null !== e.robloxUniverseId && (n["Roblox-Universe-Id"] = String(e.robloxUniverseId)), [4, this.request({
                                path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        paymentProvider: e.paymentProvider,
                                        universeId: e.universeId,
                                        paymentProviderPurchaseOptions: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                stripePurchaseOptions: function(e) {
                                                    if (void 0 !== e) return null === e ? null : {
                                                        cancelUrlPathName: e.cancelUrlPathName,
                                                        successUrlPathName: e.successUrlPathName,
                                                        uiMode: e.uiMode,
                                                        returnUrlPathName: e.returnUrlPathName
                                                    }
                                                }(e.stripePurchaseOptions),
                                                appleAppStorePurchaseOptions: function(e) {
                                                    if (void 0 !== e) return null === e ? null : {
                                                        providerCountryCode: e.providerCountryCode
                                                    }
                                                }(e.appleAppStorePurchaseOptions),
                                                braintreePurchaseOptions: function(e) {
                                                    if (void 0 !== e) return null === e ? null : {
                                                        paymentMethod: e.paymentMethod
                                                    }
                                                }(e.braintreePurchaseOptions)
                                            }
                                        }(e.paymentProviderPurchaseOptions),
                                        paymentSessionId: e.paymentSessionId,
                                        referrerId: e.referrerId
                                    }
                                }(e.preparePurchaseV2Request)
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                var t, r, n, i, o, a;
                                return null == e ? e : {
                                    paymentProvider: eP(e.paymentProvider),
                                    providerPurchasePayload: null == (t = e.providerPurchasePayload) ? t : {
                                        stripePurchasePayload: el(t, "stripePurchasePayload") ? null == (r = t.stripePurchasePayload) ? r : {
                                            checkoutUrl: el(r, "checkoutUrl") ? r.checkoutUrl : void 0,
                                            clientSecret: el(r, "clientSecret") ? r.clientSecret : void 0,
                                            allowSavePaymentMethod: el(r, "allowSavePaymentMethod") ? r.allowSavePaymentMethod : void 0
                                        } : void 0,
                                        appleAppStorePurchasePayload: el(t, "appleAppStorePurchasePayload") ? null == (n = t.appleAppStorePurchasePayload) ? n : {
                                            appAccountToken: n.appAccountToken,
                                            partnerBillingJwtToken: n.partnerBillingJwtToken,
                                            partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                        } : void 0,
                                        googlePlayStorePurchasePayload: el(t, "googlePlayStorePurchasePayload") ? null == (i = t.googlePlayStorePurchasePayload) ? i : {
                                            providerProductId: i.providerProductId,
                                            providerProductType: i.providerProductType,
                                            chargeRequestId: i.chargeRequestId,
                                            offerId: el(i, "offerId") ? i.offerId : void 0
                                        } : void 0,
                                        creditBalancePurchasePayload: el(t, "creditBalancePurchasePayload") ? null == (o = t.creditBalancePurchasePayload) ? o : {
                                            checkoutUrl: o.checkoutUrl,
                                            checkoutToken: el(o, "checkoutToken") ? o.checkoutToken : void 0,
                                            robloxManagedTax: el(o, "robloxManagedTax") ? o.robloxManagedTax : void 0,
                                            requiresBillingAddress: el(o, "requiresBillingAddress") ? o.requiresBillingAddress : void 0,
                                            chargeRequestId: el(o, "chargeRequestId") ? o.chargeRequestId : void 0,
                                            baseAmount: el(o, "baseAmount") ? o.baseAmount : void 0,
                                            taxAmount: el(o, "taxAmount") ? o.taxAmount : void 0,
                                            totalAmount: el(o, "totalAmount") ? o.totalAmount : void 0,
                                            currencyCode: el(o, "currencyCode") ? o.currencyCode : void 0
                                        } : void 0,
                                        braintreePurchasePayload: el(t, "braintreePurchasePayload") ? null == (a = t.braintreePurchasePayload) ? a : {
                                            productToken: a.productToken,
                                            price: a.price,
                                            currencyCode: a.currencyCode,
                                            clientAuthorizationToken: a.clientAuthorizationToken
                                        } : void 0
                                    },
                                    nativeProviderPurchasePayloadString: e.nativeProviderPurchasePayloadString
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2PreparePurchaseV2 = function(e, t) {
            return eb(this, void 0, void 0, function() {
                return em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2PreparePurchaseV2Raw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2PrepareSubscriptionPlanChangeRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.subscriptionId || void 0 === e.subscriptionId) throw new ec("subscriptionId", "Required parameter requestParameters.subscriptionId was null or undefined when calling subscriptionsV2PrepareSubscriptionPlanChange.");
                            return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v2/subscriptions/{subscriptionId}/prepare-plan-change".replace("{".concat("subscriptionId", "}"), encodeURIComponent(String(e.subscriptionId))),
                                schemaPath: "/v2/subscriptions/{subscriptionId}/prepare-plan-change",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        targetSubscriptionProductKey: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                type: e.type,
                                                id: e.id
                                            }
                                        }(e.targetSubscriptionProductKey)
                                    }
                                }(e.prepareSubscriptionPlanChangeRequest)
                            }, t)];
                        case 1:
                            return [2, new ed(i.sent(), function(e) {
                                return null == e ? e : {
                                    planChangeId: e.planChangeId
                                }
                            })]
                    }
                })
            })
        }, t.prototype.subscriptionsV2PrepareSubscriptionPlanChange = function(e, t) {
            return eb(this, void 0, void 0, function() {
                return em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2PrepareSubscriptionPlanChangeRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ReserveSubscriptionPlanChangeRaw = function(e, t) {
            return eb(this, void 0, void 0, function() {
                var r, n;
                return em(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.subscriptionId || void 0 === e.subscriptionId) throw new ec("subscriptionId", "Required parameter requestParameters.subscriptionId was null or undefined when calling subscriptionsV2ReserveSubscriptionPlanChange.");
                            return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v2/subscriptions/{subscriptionId}/reserve-plan-change".replace("{".concat("subscriptionId", "}"), encodeURIComponent(String(e.subscriptionId))),
                                schemaPath: "/v2/subscriptions/{subscriptionId}/reserve-plan-change",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        planChangeId: e.planChangeId
                                    }
                                }(e.reserveSubscriptionPlanChangeRequest)
                            }, t)];
                        case 1:
                            return [2, new ep(i.sent())]
                    }
                })
            })
        }, t.prototype.subscriptionsV2ReserveSubscriptionPlanChange = function(e, t) {
            return eb(this, void 0, void 0, function() {
                return em(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.subscriptionsV2ReserveSubscriptionPlanChangeRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, t
    }(ea);
    e.s(["PaymentMethod", 0, {
        CreditAndDebitCard: "CreditAndDebitCard",
        Paypal: "Paypal",
        Venmo: "Venmo",
        RobloxCredit: "RobloxCredit"
    }, "PaymentProvider", 0, {
        AppleAppStore: "AppleAppStore",
        Braintree: "Braintree",
        CreditBalance: "CreditBalance",
        GooglePlayStore: "GooglePlayStore",
        Stripe: "Stripe"
    }, "PeriodType", 0, {
        Week: "Week",
        Month: "Month",
        Year: "Year"
    }, "ProductType", 0, {
        DeveloperSubscription: "DeveloperSubscription",
        CurrencySubscription: "CurrencySubscription",
        Blackbird: "Blackbird",
        RobuxSubscription: "RobuxSubscription"
    }, "SubscriptionReferralEligibility", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "SubscriptionReferralStatus", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "SubscriptionsV2Api", 0, eE], 309380)
}]);

//# debugId=cc06a7b1-f470-1865-638a-b33ee3e1324e
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0v7aezevhdrb..js.map