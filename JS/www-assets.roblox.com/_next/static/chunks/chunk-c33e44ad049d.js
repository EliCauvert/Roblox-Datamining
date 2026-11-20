;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e584d96e-f171-214d-a6d5-217f455d93c3")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 407175, e => {
    e.q("https://www-assets.roblox.com/_next/static/media/privacyChoices.107knwhsvo2xp.webp")
}, 559659, e => {
    "use strict";
    var t = e.i(160963),
        r = e.i(214147);
    let a = [],
        n = !1,
        i = !1;

    function o() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        for (let t of a) t(e)
    }
    e.s(["createFireTelemetryHistogram", 0, function(e, s) {
        let l, u = s.flushIntervalMs ?? 5e3;

        function d(e, t) {
            s.onError ? s.onError(e, t) : console.error(e, t)
        }
        if (!(0, r.isValidIdentifier)(e)) return d(`@rbx/web-telemetry: invalid featureName "${e}"`, {
            name: e
        }), () => {};
        let c = new Map;

        function f() {
            let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
            if (0 === c.size) return;
            let r = c;
            c = new Map;
            let a = BigInt(Date.now()),
                n = Array.from(r.values(), e => {
                    let {
                        bucketIndices: t,
                        countsInBuckets: r
                    } = function(e) {
                        let t = [],
                            r = [];
                        for (let [a, n] of e) n > 0 && (t.push(a), r.push(BigInt(n)));
                        return {
                            bucketIndices: t,
                            countsInBuckets: r
                        }
                    }(e.bucketCounts);
                    return {
                        name: e.name,
                        sum: e.sum,
                        count: BigInt(e.count),
                        bucketIndices: t,
                        countsInBuckets: r,
                        timestampMs: a,
                        attributes: e.attributes
                    }
                }),
                o = BigInt(1),
                s = "u" > typeof crypto && "function" == typeof crypto.randomUUID ? crypto.randomUUID() : `web-telemetry-${Date.now()}-${Math.random().toString(16).slice(2)}`;
            e || i || "u" > typeof document && "hidden" === document.visibilityState ? (0, t.sendHistogramBatchSync)(n, a, o, s) : (0, t.sendHistogramBatch)(n, a, o, s)
        }
        return a.push(f), n || ("u" > typeof document && document.addEventListener("visibilitychange", () => {
                "hidden" === document.visibilityState && o()
            }), window.addEventListener("beforeunload", () => {
                i = !0, o()
            }), n = !0),
            function(t, a, n) {
                let i = `${e}_${t}`;
                if (! function(e, t) {
                        if (!(0, r.isValidIdentifier)(e)) return !1;
                        if (t) {
                            for (let e of Object.keys(t))
                                if (!(0, r.isValidIdentifier)(e)) return !1
                        }
                        return !0
                    }(i, a)) return void d("@rbx/web-telemetry: invalid event name or attribute key", {
                    name: t
                });
                let o = n ?? 0;
                if (!Number.isFinite(o)) return void d("@rbx/web-telemetry: value must be a finite number", {
                    name: t
                });
                let s = a && Object.keys(a).length > 0 ? a : void 0,
                    m = function(e, t) {
                        if (!t || 0 === Object.keys(t).length) return e;
                        let r = Object.keys(t).sort().map(e => `${e}=${t[e]}`).join("&");
                        return `${e}|${r}`
                    }(i, s),
                    p = c.get(m);
                p || (p = {
                    name: i,
                    attributes: s,
                    sum: 0,
                    count: 0,
                    bucketCounts: new Map
                }, c.set(m, p)), p.sum += o, p.count += 1;
                let h = function(e) {
                    if (e <= 0) return -1;
                    if (e < 1e-4) return 1;
                    if (e > 1e11) return 272;
                    let t = Math.log10(e),
                        r = Math.floor((t - -4) * 18);
                    return 1e-9 > Math.abs((t - -4) * 18 - r) && r > 0 && (r -= 1), r + 2
                }(o);
                p.bucketCounts.set(h, (p.bucketCounts.get(h) ?? 0) + 1),
                    function e() {
                        void 0 === l && (l = setTimeout(() => {
                            l = void 0, f(), c.size > 0 && e()
                        }, u))
                    }()
            }
    }, "flushTelemetryHistograms", 0, function() {
        o(!0)
    }])
}, 887524, e => {
    "use strict";
    var t = e.i(491965),
        r = e.i(982249),
        a = e.i(964433),
        n = e.i(7284),
        i = e.i(371847);
    let o = (0, i.forwardRef)((e, o) => {
        let {
            title: s,
            icon: l,
            actionLabel: u,
            onAction: d,
            actions: c,
            onClose: f,
            closeIconAriaLabel: m = "Dismiss snackbar",
            shouldAutoDismiss: p,
            autoDismissDurationMs: h,
            className: g,
            ...v
        } = e, [b, y] = (0, i.useState)("enter"), w = (0, i.useRef)(void 0), x = (0, i.useRef)(void 0), E = (0, i.useRef)(void 0), S = (0, i.useRef)(null), P = c ?? (u && d && i.default.createElement(r.Button, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: d,
            ref: S
        }, u)), C = !!P, _ = s.length > 80, R = p ?? !0, O = 4e3;
        C && (O = _ ? 1e4 : 7e3);
        let j = h ?? O,
            M = (0, i.useCallback)(() => {
                "exit" !== b && (y("exit"), void 0 !== x.current && (window.clearTimeout(x.current), x.current = void 0), E.current = window.setTimeout(() => {
                    f?.()
                }, 150))
            }, [f, b]);
        (0, i.useEffect)(() => (w.current = window.requestAnimationFrame(() => {
            y("idle")
        }), () => {
            void 0 !== w.current && window.cancelAnimationFrame(w.current)
        }), []), (0, i.useEffect)(() => {
            void 0 !== x.current && (window.clearTimeout(x.current), x.current = void 0), R && "exit" !== b && (x.current = window.setTimeout(() => {
                M()
            }, j))
        }, [j, R, b, M]), (0, i.useEffect)(() => {
            C && S.current?.focus()
        }, [C]), (0, i.useEffect)(() => () => {
            void 0 !== x.current && window.clearTimeout(x.current), void 0 !== E.current && window.clearTimeout(E.current), void 0 !== w.current && window.cancelAnimationFrame(w.current)
        }, []);
        let N = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: `translate(-50%, ${"idle"===b?"0":"120%"})`,
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            D = v.style ? {
                ...N,
                ...v.style
            } : N;
        return i.default.createElement("div", {
            ref: o,
            role: "status",
            "aria-live": "polite",
            className: (0, n.default)("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === b ? "ease-standard-in" : "ease-standard-out", g),
            style: {
                ...D,
                transitionDuration: `${"exit"===b?150:200}ms`,
                transitionProperty: "transform"
            },
            ...v
        }, i.default.createElement("div", {
            className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
        }, l && i.default.createElement(t.Icon, {
            name: l,
            size: "Small",
            className: "shrink-0 content-inverse-emphasis"
        }), i.default.createElement("div", {
            className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
        }, s)), i.default.createElement("div", {
            className: "flex items-center justify-end gap-small shrink-0"
        }, P, f && i.default.createElement(a.CloseAffordance, {
            variant: "Utility",
            size: "Small",
            isCircular: !0,
            className: "content-inverse-emphasis",
            "aria-label": m,
            onClick: M
        })))
    });
    e.s(["Snackbar", 0, o])
}, 713639, e => {
    "use strict";
    var t = e.i(745911);

    function r(e, t) {
        return function() {
            for (var e = arguments.length, r = Array(e), a = 0; a < e; a++) r[a] = arguments[a];
            try {
                return t(...r)
            } catch {
                throw Error(void 0)
            }
        }
    }
    let a = r(0, t.useTranslations),
        n = r(0, t.useFormatter);
    e.s(["useFormatter", 0, n, "useTranslations", 0, a])
}, 801827, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(713639),
        a = e.i(682877),
        n = e.i(61907);
    e.s(["useTranslations", 0, e => {
        let i = (0, r.useTranslations)((0, n.fromPeriodToColonDelimited)(e));
        return (0, t.useMemo)(() => (0, a.adaptTranslator)(i, e), [i, e])
    }, "useTranslationsInternal", 0, () => (0, r.useTranslations)()])
}, 959491, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(371847);
    let a = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        n = r.default.forwardRef((e, n) => {
            let {
                name: i,
                size: o = "Medium",
                className: s,
                children: l,
                ...u
            } = e;
            return r.default.createElement("span", {
                ref: n,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon", i, a[o], s),
                ...u
            })
        });
    n.displayName = "Icon", e.s(["Icon", 0, n])
}, 808558, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(371847);
    e.s(["StateLayer", 0, e => {
        let {
            className: a
        } = e;
        return r.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, t.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", a)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 493739, 922353, e => {
    "use strict";
    let t, r, a;
    var n = e.i(371847);

    function i(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function o() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return e => {
            let r = !1,
                a = t.map(t => {
                    let a = i(t, e);
                    return r || "function" != typeof a || (r = !0), a
                });
            if (r) return () => {
                for (let e = 0; e < a.length; e++) {
                    let r = a[e];
                    "function" == typeof r ? r() : i(t[e], null)
                }
            }
        }
    }
    e.s(["composeRefs", 0, o, "useComposedRefs", 0, function() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return n.useCallback(o(...t), t)
    }], 922353);
    var s = e.i(809804),
        l = Symbol.for("react.lazy"),
        u = n[" use ".trim().toString()];

    function d(e) {
        var t;
        return null != e && "object" == typeof e && "$$typeof" in e && e.$$typeof === l && "_payload" in e && "object" == typeof(t = e._payload) && null !== t && "then" in t
    }
    var c = ((a = n.forwardRef((e, t) => {
            let {
                children: r,
                ...a
            } = e;
            if (d(r) && "function" == typeof u && (r = u(r._payload)), n.isValidElement(r)) {
                var i;
                let e, s, l = (i = r, (s = (e = Object.getOwnPropertyDescriptor(i.props, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? i.ref : (s = (e = Object.getOwnPropertyDescriptor(i, "ref")?.get) && "isReactWarning" in e && e.isReactWarning) ? i.props.ref : i.props.ref || i.ref),
                    u = function(e, t) {
                        let r = {
                            ...t
                        };
                        for (let a in t) {
                            let n = e[a],
                                i = t[a];
                            /^on[A-Z]/.test(a) ? n && i ? r[a] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                let a = i(...t);
                                return n(...t), a
                            } : n && (r[a] = n) : "style" === a ? r[a] = {
                                ...n,
                                ...i
                            } : "className" === a && (r[a] = [n, i].filter(Boolean).join(" "))
                        }
                        return {
                            ...e,
                            ...r
                        }
                    }(a, r.props);
                return r.type !== n.Fragment && (u.ref = t ? o(t, l) : l), n.cloneElement(r, u)
            }
            return n.Children.count(r) > 1 ? n.Children.only(null) : null
        })).displayName = "Slot.SlotClone", t = a, (r = n.forwardRef((e, r) => {
            let {
                children: a,
                ...i
            } = e;
            d(a) && "function" == typeof u && (a = u(a._payload));
            let o = n.Children.toArray(a),
                l = o.find(m);
            if (l) {
                let e = l.props.children,
                    a = o.map(t => t !== l ? t : n.Children.count(e) > 1 ? n.Children.only(null) : n.isValidElement(e) ? e.props.children : null);
                return (0, s.jsx)(t, {
                    ...i,
                    ref: r,
                    children: n.isValidElement(e) ? n.cloneElement(e, void 0, a) : null
                })
            }
            return (0, s.jsx)(t, {
                ...i,
                ref: r,
                children: a
            })
        })).displayName = "Slot.Slot", r),
        f = Symbol("radix.slottable");

    function m(e) {
        return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === f
    }
    e.s(["Slot", 0, c], 493739)
}, 7312, e => {
    "use strict";
    e.s(["disabledOpacity", 0, "opacity-[0.5]"])
}, 69134, e => {
    "use strict";
    var t = e.i(808558),
        r = e.i(7312),
        a = e.i(371847);
    let n = e => {
        let {
            width: t,
            height: r
        } = e;
        return a.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: t,
            height: r,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, a.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    };
    var i = e.i(959491),
        o = e.i(7284),
        s = e.i(493739);
    let l = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        u = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        d = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        c = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        f = (0, a.forwardRef)((e, f) => {
            let {
                children: m,
                className: p,
                style: h,
                isDisabled: g = !1,
                isLoading: v = !1,
                icon: b,
                size: y = "Large",
                variant: w = "Emphasis",
                asChild: x,
                ...E
            } = e, S = (0, o.default)("foundation-web-button", g ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", u[y], g ? c[w] : d[w], p), P = {
                textDecoration: "none",
                ...h
            }, C = e => a.default.createElement(a.default.Fragment, null, a.default.createElement(t.StateLayer, null), v && a.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, a.default.createElement(n, {
                width: l[y],
                height: l[y]
            })), a.default.createElement("span", {
                className: (0, o.default)("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", v && "invisible")
            }, b && a.default.createElement(i.Icon, {
                name: b,
                size: y
            }), a.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (x) {
                let {
                    as: e,
                    ...t
                } = E, r = a.default.Children.only(m);
                return a.default.createElement(s.Slot, {
                    ref: f,
                    ...t,
                    className: S,
                    style: P,
                    "aria-disabled": g || void 0
                }, a.default.cloneElement(r, {}, C(r.props.children)))
            }
            if ("a" === E.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = E;
                return a.default.createElement("a", {
                    ref: f,
                    ...r,
                    "aria-disabled": g,
                    href: g ? void 0 : t,
                    className: S,
                    style: P
                }, C(m))
            }
            let {
                as: _,
                ...R
            } = E;
            return a.default.createElement("button", {
                ref: f,
                type: "button",
                ...R,
                disabled: g,
                className: S,
                style: P
            }, C(m))
        });
    e.s(["Button", 0, f], 69134)
}, 389784, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(922353),
        a = e.i(18731),
        n = e => {
            var n;
            let o, s, {
                    present: l,
                    children: u
                } = e,
                d = function(e) {
                    var r, n;
                    let [o, s] = t.useState(), l = t.useRef({}), u = t.useRef(e), d = t.useRef("none"), [c, f] = (r = e ? "mounted" : "unmounted", n = {
                        mounted: {
                            UNMOUNT: "unmounted",
                            ANIMATION_OUT: "unmountSuspended"
                        },
                        unmountSuspended: {
                            MOUNT: "mounted",
                            ANIMATION_END: "unmounted"
                        },
                        unmounted: {
                            MOUNT: "mounted"
                        }
                    }, t.useReducer((e, t) => n[e][t] ?? e, r));
                    return t.useEffect(() => {
                        let e = i(l.current);
                        d.current = "mounted" === c ? e : "none"
                    }, [c]), (0, a.useLayoutEffect)(() => {
                        let t = l.current,
                            r = u.current;
                        if (r !== e) {
                            let a = d.current,
                                n = i(t);
                            e ? f("MOUNT") : "none" === n || t?.display === "none" ? f("UNMOUNT") : r && a !== n ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = e
                        }
                    }, [e, f]), (0, a.useLayoutEffect)(() => {
                        if (o) {
                            let e, t = o.ownerDocument.defaultView ?? window,
                                r = r => {
                                    let a = i(l.current).includes(r.animationName);
                                    if (r.target === o && a && (f("ANIMATION_END"), !u.current)) {
                                        let r = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", e = t.setTimeout(() => {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = r)
                                        })
                                    }
                                },
                                a = e => {
                                    e.target === o && (d.current = i(l.current))
                                };
                            return o.addEventListener("animationstart", a), o.addEventListener("animationcancel", r), o.addEventListener("animationend", r), () => {
                                t.clearTimeout(e), o.removeEventListener("animationstart", a), o.removeEventListener("animationcancel", r), o.removeEventListener("animationend", r)
                            }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            e && (l.current = getComputedStyle(e)), s(e)
                        }, [])
                    }
                }(l),
                c = "function" == typeof u ? u({
                    present: d.isPresent
                }) : t.Children.only(u),
                f = (0, r.useComposedRefs)(d.ref, (n = c, (s = (o = Object.getOwnPropertyDescriptor(n.props, "ref")?.get) && "isReactWarning" in o && o.isReactWarning) ? n.ref : (s = (o = Object.getOwnPropertyDescriptor(n, "ref")?.get) && "isReactWarning" in o && o.isReactWarning) ? n.props.ref : n.props.ref || n.ref));
            return "function" == typeof u || d.isPresent ? t.cloneElement(c, {
                ref: f
            }) : null
        };

    function i(e) {
        return e?.animationName || "none"
    }
    n.displayName = "Presence", e.s(["Presence", 0, n])
}, 386650, 217061, e => {
    "use strict";
    var t = e.i(808558),
        r = e.i(959491),
        a = e.i(7284),
        n = e.i(371847);
    let i = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        o = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        },
        s = e => {
            let {
                variant: s,
                size: l,
                isCircular: u,
                className: d,
                ...c
            } = e;
            return n.default.createElement("button", {
                type: "button",
                className: (0, a.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", t.interactable, o[s], i[l], u && "radius-circle", d),
                ...c
            }, n.default.createElement(t.StateLayer, null), n.default.createElement(r.Icon, {
                name: "icon-regular-x",
                size: l
            }))
        };
    e.s(["CloseAffordance", 0, s], 217061);
    var l = e.i(775453),
        u = e.i(922353),
        d = e.i(9413),
        c = e.i(411207),
        f = e.i(584537),
        m = e.i(783660),
        p = e.i(721988),
        h = e.i(199794),
        g = e.i(389784),
        v = e.i(158051),
        b = e.i(634918),
        y = e.i(700312),
        w = e.i(73772),
        x = e.i(178511),
        E = e.i(809804),
        S = "Dialog",
        [P, C] = (0, d.createContextScope)(S),
        [_, R] = P(S),
        O = e => {
            let {
                __scopeDialog: t,
                children: r,
                open: a,
                defaultOpen: i,
                onOpenChange: o,
                modal: s = !0
            } = e, l = n.useRef(null), u = n.useRef(null), [d = !1, m] = (0, f.useControllableState)({
                prop: a,
                defaultProp: i,
                onChange: o
            });
            return (0, E.jsx)(_, {
                scope: t,
                triggerRef: l,
                contentRef: u,
                contentId: (0, c.useId)(),
                titleId: (0, c.useId)(),
                descriptionId: (0, c.useId)(),
                open: d,
                onOpenChange: m,
                onOpenToggle: n.useCallback(() => m(e => !e), [m]),
                modal: s,
                children: r
            })
        };
    O.displayName = S;
    var j = "DialogTrigger";
    n.forwardRef((e, t) => {
        let {
            __scopeDialog: r,
            ...a
        } = e, n = R(j, r), i = (0, u.useComposedRefs)(t, n.triggerRef);
        return (0, E.jsx)(v.Primitive.button, {
            type: "button",
            "aria-haspopup": "dialog",
            "aria-expanded": n.open,
            "aria-controls": n.contentId,
            "data-state": V(n.open),
            ...a,
            ref: i,
            onClick: (0, l.composeEventHandlers)(e.onClick, n.onOpenToggle)
        })
    }).displayName = j;
    var M = "DialogPortal",
        [N, D] = P(M, {
            forceMount: void 0
        }),
        I = e => {
            let {
                __scopeDialog: t,
                forceMount: r,
                children: a,
                container: i
            } = e, o = R(M, t);
            return (0, E.jsx)(N, {
                scope: t,
                forceMount: r,
                children: n.Children.map(a, e => (0, E.jsx)(g.Presence, {
                    present: r || o.open,
                    children: (0, E.jsx)(h.Portal, {
                        asChild: !0,
                        container: i,
                        children: e
                    })
                }))
            })
        };
    I.displayName = M;
    var k = "DialogOverlay",
        A = n.forwardRef((e, t) => {
            let r = D(k, e.__scopeDialog),
                {
                    forceMount: a = r.forceMount,
                    ...n
                } = e,
                i = R(k, e.__scopeDialog);
            return i.modal ? (0, E.jsx)(g.Presence, {
                present: a || i.open,
                children: (0, E.jsx)(U, {
                    ...n,
                    ref: t
                })
            }) : null
        });
    A.displayName = k;
    var L = (0, x.createSlot)("DialogOverlay.RemoveScroll"),
        U = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...a
            } = e, n = R(k, r);
            return (0, E.jsx)(y.RemoveScroll, {
                as: L,
                allowPinchZoom: !0,
                shards: [n.contentRef],
                children: (0, E.jsx)(v.Primitive.div, {
                    "data-state": V(n.open),
                    ...a,
                    ref: t,
                    style: {
                        pointerEvents: "auto",
                        ...a.style
                    }
                })
            })
        }),
        T = "DialogContent",
        z = n.forwardRef((e, t) => {
            let r = D(T, e.__scopeDialog),
                {
                    forceMount: a = r.forceMount,
                    ...n
                } = e,
                i = R(T, e.__scopeDialog);
            return (0, E.jsx)(g.Presence, {
                present: a || i.open,
                children: i.modal ? (0, E.jsx)(F, {
                    ...n,
                    ref: t
                }) : (0, E.jsx)($, {
                    ...n,
                    ref: t
                })
            })
        });
    z.displayName = T;
    var F = n.forwardRef((e, t) => {
            let r = R(T, e.__scopeDialog),
                a = n.useRef(null),
                i = (0, u.useComposedRefs)(t, r.contentRef, a);
            return n.useEffect(() => {
                let e = a.current;
                if (e) return (0, w.hideOthers)(e)
            }, []), (0, E.jsx)(B, {
                ...e,
                ref: i,
                trapFocus: r.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: (0, l.composeEventHandlers)(e.onCloseAutoFocus, e => {
                    e.preventDefault(), r.triggerRef.current?.focus()
                }),
                onPointerDownOutside: (0, l.composeEventHandlers)(e.onPointerDownOutside, e => {
                    let t = e.detail.originalEvent,
                        r = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || r) && e.preventDefault()
                }),
                onFocusOutside: (0, l.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault())
            })
        }),
        $ = n.forwardRef((e, t) => {
            let r = R(T, e.__scopeDialog),
                a = n.useRef(!1),
                i = n.useRef(!1);
            return (0, E.jsx)(B, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    e.onCloseAutoFocus?.(t), t.defaultPrevented || (a.current || r.triggerRef.current?.focus(), t.preventDefault()), a.current = !1, i.current = !1
                },
                onInteractOutside: t => {
                    e.onInteractOutside?.(t), t.defaultPrevented || (a.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                    let n = t.target;
                    r.triggerRef.current?.contains(n) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                }
            })
        }),
        B = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                trapFocus: a,
                onOpenAutoFocus: i,
                onCloseAutoFocus: o,
                ...s
            } = e, l = R(T, r), d = n.useRef(null), c = (0, u.useComposedRefs)(t, d);
            return (0, b.useFocusGuards)(), (0, E.jsxs)(E.Fragment, {
                children: [(0, E.jsx)(p.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: a,
                    onMountAutoFocus: i,
                    onUnmountAutoFocus: o,
                    children: (0, E.jsx)(m.DismissableLayer, {
                        role: "dialog",
                        id: l.contentId,
                        "aria-describedby": l.descriptionId,
                        "aria-labelledby": l.titleId,
                        "data-state": V(l.open),
                        ...s,
                        ref: c,
                        onDismiss: () => l.onOpenChange(!1)
                    })
                }), (0, E.jsxs)(E.Fragment, {
                    children: [(0, E.jsx)(J, {
                        titleId: l.titleId
                    }), (0, E.jsx)(Z, {
                        contentRef: d,
                        descriptionId: l.descriptionId
                    })]
                })]
            })
        }),
        W = "DialogTitle",
        H = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...a
            } = e, n = R(W, r);
            return (0, E.jsx)(v.Primitive.h2, {
                id: n.titleId,
                ...a,
                ref: t
            })
        });
    H.displayName = W;
    var q = "DialogDescription";
    n.forwardRef((e, t) => {
        let {
            __scopeDialog: r,
            ...a
        } = e, n = R(q, r);
        return (0, E.jsx)(v.Primitive.p, {
            id: n.descriptionId,
            ...a,
            ref: t
        })
    }).displayName = q;
    var G = "DialogClose",
        Q = n.forwardRef((e, t) => {
            let {
                __scopeDialog: r,
                ...a
            } = e, n = R(G, r);
            return (0, E.jsx)(v.Primitive.button, {
                type: "button",
                ...a,
                ref: t,
                onClick: (0, l.composeEventHandlers)(e.onClick, () => n.onOpenChange(!1))
            })
        });

    function V(e) {
        return e ? "open" : "closed"
    }
    Q.displayName = G;
    var X = "DialogTitleWarning",
        [K, Y] = (0, d.createContext)(X, {
            contentName: T,
            titleName: W,
            docsSlug: "dialog"
        }),
        J = e => {
            let {
                titleId: t
            } = e, r = Y(X), a = `\`${r.contentName}\` requires a \`${r.titleName}\` for the component to be accessible for screen reader users.

If you want to hide the \`${r.titleName}\`, you can wrap it with our VisuallyHidden component.

For more information, see https://radix-ui.com/primitives/docs/components/${r.docsSlug}`;
            return n.useEffect(() => {
                t && (document.getElementById(t) || console.error(a))
            }, [a, t]), null
        },
        Z = e => {
            let {
                contentRef: t,
                descriptionId: r
            } = e, a = Y("DialogDescriptionWarning"), i = `Warning: Missing \`Description\` or \`aria-describedby={undefined}\` for {${a.contentName}}.`;
            return n.useEffect(() => {
                let e = t.current?.getAttribute("aria-describedby");
                r && e && (document.getElementById(r) || console.warn(i))
            }, [i, t, r]), null
        },
        ee = e.i(285565),
        et = Object.freeze({
            position: "absolute",
            border: 0,
            width: 1,
            height: 1,
            padding: 0,
            margin: -1,
            overflow: "hidden",
            clip: "rect(0, 0, 0, 0)",
            whiteSpace: "nowrap",
            wordWrap: "normal"
        }),
        er = n.forwardRef((e, t) => (0, E.jsx)(ee.Primitive.span, {
            ...e,
            ref: t,
            style: {
                ...et,
                ...e.style
            }
        }));
    er.displayName = "VisuallyHidden";
    let ea = (0, n.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        en = () => {
            let e = (0, n.useContext)(ea);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        ei = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        eo = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        es = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        el = e => {
            let {
                open: t,
                onOpenChange: r,
                children: a,
                size: i,
                type: o = "Default",
                isModal: s,
                hasCloseAffordance: l,
                closeLabel: u,
                hasMarginTop: d = !0,
                hasMarginBottom: c = !0,
                hasDescription: f = !1,
                experimentalDisablePointerEventsStylingOnBody: m = !1
            } = e, p = (0, n.useMemo)(() => ({
                size: i,
                isModal: s,
                type: o,
                hasCloseAffordance: l,
                closeLabel: u,
                hasMarginTop: d,
                hasMarginBottom: c,
                hasDescription: f
            }), [i, s, o, l, u, d, c, f]);
            return (0, n.useEffect)(() => {
                m && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [m, t]), n.default.createElement(ea.Provider, {
                value: p
            }, n.default.createElement(O, {
                open: t,
                onOpenChange: r
            }, a))
        };
    el.displayName = "Dialog";
    let eu = e => {
        let {
            children: t,
            className: r,
            style: i,
            overlayClassName: o,
            overlayStyle: l,
            onOpenAutoFocus: u,
            ...d
        } = e, {
            size: c,
            isModal: f,
            hasCloseAffordance: m,
            closeLabel: p,
            hasDescription: h
        } = en(), g = (0, a.default)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", f && "bg-common-backdrop", o), v = (0, a.default)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
        return n.default.createElement(I, null, n.default.createElement(A, {
            className: g,
            style: l
        }, n.default.createElement(z, {
            className: v,
            "data-size": c,
            style: i,
            onOpenAutoFocus: u,
            ...!h && {
                "aria-describedby": void 0
            },
            ...d
        }, m && n.default.createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, n.default.createElement(Q, {
            asChild: !0
        }, n.default.createElement(s, {
            variant: "OverMedia",
            size: c,
            isCircular: !0,
            "aria-label": p
        }))), t)))
    };
    eu.displayName = "DialogContent";
    let ed = e => {
        let {
            children: t,
            className: r,
            ...i
        } = e;
        return n.default.createElement("div", {
            className: (0, a.default)("foundation-web-dialog-hero-media", r),
            ...i
        }, t)
    };
    ed.displayName = "DialogHeroMedia";
    let ec = e => {
        let {
            children: t,
            className: r,
            ...i
        } = e, {
            size: o,
            hasMarginTop: s,
            hasMarginBottom: l
        } = en(), u = (0, a.default)(ei[o], s && eo[o], l && es[o], r);
        return n.default.createElement("div", {
            className: u,
            ...i
        }, t)
    };
    ec.displayName = "DialogBody";
    let ef = e => {
        let {
            children: t,
            className: r,
            hidden: a,
            ...i
        } = e, o = n.default.createElement(H, {
            className: r,
            ...i
        }, t);
        return a ? n.default.createElement(er, null, o) : o
    };
    ef.displayName = "DialogTitle";
    let em = e => {
        let {
            children: t,
            className: r,
            ...i
        } = e, {
            size: o
        } = en(), s = (0, a.default)(ei[o], es[o], r);
        return n.default.createElement("div", {
            className: s,
            ...i
        }, t)
    };
    em.displayName = "DialogFooter", e.s(["Dialog", 0, el, "DialogBody", 0, ec, "DialogContent", 0, eu, "DialogFooter", 0, em, "DialogHeroMedia", 0, ed, "DialogTitle", 0, ef], 386650)
}, 536982, e => {
    "use strict";
    var t = e.i(26853),
        r = e.i(815079);
    e.s(["usePageBaseUrls", 0, () => (0, r.baseUrlsForDomain)((0, t.usePageDomain)())])
}, 686790, e => {
    "use strict";
    var t = e.i(545819),
        r = e.i(126392),
        a = e.i(519003);
    let n = () => (0, a.getPageBaseUrls)().rootDomain;
    e.s(["isAnalyticsCookieAccepted", 0, () => !!t.get("RBXcb")?.value.split("&").find(e => "true" === e.split("=")[1]), "setTrackingRestriction", 0, e => {
        null != e && (0, r.getCurrentUser)()?.id != null && t.set("RBXcp", e ? "restricted" : "standard", {
            domain: n(),
            maxAge: 15552e3,
            sameSite: "lax"
        })
    }, "setUserConsent", 0, (e, r) => {
        let a = [];
        for (let i of r) e.includes(i) ? a.push(`${i}=true`) : (a.push(`${i}=false`), t.delete(i, {
            domain: n()
        }));
        t.set("RBXcb", a.join("&"), {
            domain: n(),
            maxAge: 15552e3
        })
    }])
}, 690255, e => {
    "use strict";
    var t = e.i(809804),
        r = e.i(371847),
        a = e.i(587541),
        n = e.i(851460),
        i = e.i(813537);
    let o = (0, r.forwardRef)((e, r) => {
        let o, {
            href: s,
            prefetch: l = "none",
            ...u
        } = e;
        return "string" == typeof s ? o = s : s instanceof a.Url ? {
            href: o
        } = s : o = {
            pathname: s.path,
            query: null == s.searchParams ? void 0 : n.UrlSearchParams.new(s.searchParams).toString(),
            hash: s.fragment
        }, (0, t.jsx)(i.Nav.Link, {
            ref: r,
            href: o,
            prefetch: "full" === l || "none" !== l && "auto",
            ...u
        })
    });
    e.s(["Link", 0, o], 690255)
}, 798047, (e, t, r) => {
    "use strict";

    function a(e) {
        let {
            widthInt: t,
            heightInt: r,
            blurWidth: a,
            blurHeight: n,
            blurDataURL: i,
            objectFit: o
        } = e, s = a ? 40 * a : t, l = n ? 40 * n : r, u = s && l ? `viewBox='0 0 ${s} ${l}'` : "";
        return `%3Csvg xmlns='http://www.w3.org/2000/svg' ${u}%3E%3Cfilter id='b' color-interpolation-filters='sRGB'%3E%3CfeGaussianBlur stdDeviation='20'/%3E%3CfeColorMatrix values='1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 100 -1' result='s'/%3E%3CfeFlood x='0' y='0' width='100%25' height='100%25'/%3E%3CfeComposite operator='out' in='s'/%3E%3CfeComposite in2='SourceGraphic'/%3E%3CfeGaussianBlur stdDeviation='20'/%3E%3C/filter%3E%3Cimage width='100%25' height='100%25' x='0' y='0' preserveAspectRatio='${u?"none":"contain"===o?"xMidYMid":"cover"===o?"xMidYMid slice":"none"}' style='filter: url(%23b);' href='${i}'/%3E%3C/svg%3E`
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "getImageBlurSvg", {
        enumerable: !0,
        get: function() {
            return a
        }
    })
}, 811526, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        VALID_LOADERS: function() {
            return i
        },
        imageConfigDefault: function() {
            return o
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = ["default", "imgix", "cloudinary", "akamai", "custom"],
        o = {
            deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
            imageSizes: [32, 48, 64, 96, 128, 256, 384],
            path: "/_next/image",
            loader: "default",
            loaderFile: "",
            domains: [],
            disableStaticImages: !1,
            minimumCacheTTL: 14400,
            formats: ["image/webp"],
            maximumDiskCacheSize: void 0,
            maximumRedirects: 3,
            maximumResponseBody: 5e7,
            dangerouslyAllowLocalIP: !1,
            dangerouslyAllowSVG: !1,
            contentSecurityPolicy: "script-src 'none'; frame-src 'none'; sandbox;",
            contentDispositionType: "attachment",
            localPatterns: void 0,
            remotePatterns: [],
            qualities: [75],
            unoptimized: !1,
            customCacheHandler: !1
        }
}, 761805, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "getImgProps", {
        enumerable: !0,
        get: function() {
            return u
        }
    }), e.r(324668);
    let a = e.r(61509),
        n = e.r(798047),
        i = e.r(811526),
        o = ["-moz-initial", "fill", "none", "scale-down", void 0];

    function s(e) {
        return void 0 !== e.default
    }

    function l(e) {
        return void 0 === e ? e : "number" == typeof e ? Number.isFinite(e) ? e : NaN : "string" == typeof e && /^[0-9]+$/.test(e) ? parseInt(e, 10) : NaN
    }

    function u(e, t) {
        var r;
        let u, d, c, {
                src: f,
                sizes: m,
                unoptimized: p = !1,
                priority: h = !1,
                preload: g = !1,
                loading: v,
                className: b,
                quality: y,
                width: w,
                height: x,
                fill: E = !1,
                style: S,
                overrideSrc: P,
                onLoad: C,
                onLoadingComplete: _,
                placeholder: R = "empty",
                blurDataURL: O,
                fetchPriority: j,
                decoding: M = "async",
                layout: N,
                objectFit: D,
                objectPosition: I,
                lazyBoundary: k,
                lazyRoot: A,
                ...L
            } = e,
            {
                imgConf: U,
                showAltText: T,
                blurComplete: z,
                defaultLoader: F
            } = t,
            $ = U || i.imageConfigDefault;
        if ("allSizes" in $) u = $;
        else {
            let e = [...$.deviceSizes, ...$.imageSizes].sort((e, t) => e - t),
                t = $.deviceSizes.sort((e, t) => e - t),
                r = $.qualities?.sort((e, t) => e - t);
            u = {
                ...$,
                allSizes: e,
                deviceSizes: t,
                qualities: r
            }
        }
        if (void 0 === F) throw Object.defineProperty(Error("images.loaderFile detected but the file is missing default export.\nRead more: https://nextjs.org/docs/messages/invalid-images-config"), "__NEXT_ERROR_CODE", {
            value: "E163",
            enumerable: !1,
            configurable: !0
        });
        let B = L.loader || F;
        delete L.loader, delete L.srcSet;
        let W = "__next_img_default" in B;
        if (W) {
            if ("custom" === u.loader) throw Object.defineProperty(Error(`Image with src "${f}" is missing "loader" prop.
Read more: https://nextjs.org/docs/messages/next-image-missing-loader`), "__NEXT_ERROR_CODE", {
                value: "E252",
                enumerable: !1,
                configurable: !0
            })
        } else {
            let e = B;
            B = t => {
                let {
                    config: r,
                    ...a
                } = t;
                return e(a)
            }
        }
        if (N) {
            "fill" === N && (E = !0);
            let e = {
                intrinsic: {
                    maxWidth: "100%",
                    height: "auto"
                },
                responsive: {
                    width: "100%",
                    height: "auto"
                }
            } [N];
            e && (S = {
                ...S,
                ...e
            });
            let t = {
                responsive: "100vw",
                fill: "100vw"
            } [N];
            t && !m && (m = t)
        }
        let H = "",
            q = l(w),
            G = l(x);
        if ((r = f) && "object" == typeof r && (s(r) || void 0 !== r.src)) {
            let e = s(f) ? f.default : f;
            if (!e.src) throw Object.defineProperty(Error(`An object should only be passed to the image component src parameter if it comes from a static image import. It must include src. Received ${JSON.stringify(e)}`), "__NEXT_ERROR_CODE", {
                value: "E460",
                enumerable: !1,
                configurable: !0
            });
            if (!e.height || !e.width) throw Object.defineProperty(Error(`An object should only be passed to the image component src parameter if it comes from a static image import. It must include height and width. Received ${JSON.stringify(e)}`), "__NEXT_ERROR_CODE", {
                value: "E48",
                enumerable: !1,
                configurable: !0
            });
            if (d = e.blurWidth, c = e.blurHeight, O = O || e.blurDataURL, H = e.src, !E)
                if (q || G) {
                    if (q && !G) {
                        let t = q / e.width;
                        G = Math.round(e.height * t)
                    } else if (!q && G) {
                        let t = G / e.height;
                        q = Math.round(e.width * t)
                    }
                } else q = e.width, G = e.height
        }
        let Q = !h && !g && ("lazy" === v || void 0 === v);
        (!(f = "string" == typeof f ? f : H) || f.startsWith("data:") || f.startsWith("blob:")) && (p = !0, Q = !1), u.unoptimized && (p = !0), W && !u.dangerouslyAllowSVG && f.split("?", 1)[0].endsWith(".svg") && (p = !0);
        let V = l(y),
            X = Object.assign(E ? {
                position: "absolute",
                height: "100%",
                width: "100%",
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                objectFit: D,
                objectPosition: I
            } : {}, T ? {} : {
                color: "transparent"
            }, S),
            K = z || "empty" === R ? null : "blur" === R ? `url("data:image/svg+xml;charset=utf-8,${(0,n.getImageBlurSvg)({widthInt:q,heightInt:G,blurWidth:d,blurHeight:c,blurDataURL:O||"",objectFit:X.objectFit})}")` : `url("${R}")`,
            Y = o.includes(X.objectFit) ? "fill" === X.objectFit ? "100% 100%" : "cover" : X.objectFit,
            J = K ? {
                backgroundSize: Y,
                backgroundPosition: X.objectPosition || "50% 50%",
                backgroundRepeat: "no-repeat",
                backgroundImage: K
            } : {},
            Z = function(e) {
                let {
                    config: t,
                    src: r,
                    unoptimized: n,
                    width: i,
                    quality: o,
                    sizes: s,
                    loader: l
                } = e;
                if (n) {
                    if (r.startsWith("/") && !r.startsWith("//")) {
                        let e = (0, a.getDeploymentId)();
                        if (e) {
                            let t = r.indexOf("?");
                            if (-1 !== t) {
                                let a = new URLSearchParams(r.slice(t + 1));
                                a.get("dpl") || (a.append("dpl", e), r = r.slice(0, t) + "?" + a.toString())
                            } else r += `?dpl=${e}`
                        }
                    }
                    return {
                        src: r,
                        srcSet: void 0,
                        sizes: void 0
                    }
                }
                let {
                    widths: u,
                    kind: d
                } = function(e, t, r) {
                    let {
                        deviceSizes: a,
                        allSizes: n
                    } = e;
                    if (r) {
                        let e = /(^|\s)(1?\d?\d)vw/g,
                            t = [];
                        for (let a; a = e.exec(r);) t.push(parseInt(a[2]));
                        if (t.length) {
                            let e = .01 * Math.min(...t);
                            return {
                                widths: n.filter(t => t >= a[0] * e),
                                kind: "w"
                            }
                        }
                        return {
                            widths: n,
                            kind: "w"
                        }
                    }
                    return "number" != typeof t ? {
                        widths: a,
                        kind: "w"
                    } : {
                        widths: [...new Set([t, 2 * t].map(e => n.find(t => t >= e) || n[n.length - 1]))],
                        kind: "x"
                    }
                }(t, i, s), c = u.length - 1;
                return {
                    sizes: s || "w" !== d ? s : "100vw",
                    srcSet: u.map((e, a) => `${l({config:t,src:r,quality:o,width:e})} ${"w"===d?e:a+1}${d}`).join(", "),
                    src: l({
                        config: t,
                        src: r,
                        quality: o,
                        width: u[c]
                    })
                }
            }({
                config: u,
                src: f,
                unoptimized: p,
                width: q,
                quality: V,
                sizes: m,
                loader: B
            }),
            ee = Q ? "lazy" : v;
        return {
            props: {
                ...L,
                loading: ee,
                fetchPriority: j,
                width: q,
                height: G,
                decoding: M,
                className: b,
                style: {
                    ...X,
                    ...J
                },
                sizes: Z.sizes,
                srcSet: Z.srcSet,
                src: P || Z.src
            },
            meta: {
                unoptimized: p,
                preload: g || h,
                placeholder: R,
                fill: E
            }
        }
    }
}, 396611, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return s
        }
    });
    let a = e.r(371847),
        n = "u" < typeof window,
        i = n ? () => {} : a.useLayoutEffect,
        o = n ? () => {} : a.useEffect;

    function s(e) {
        let {
            headManager: t,
            reduceComponentsToState: r
        } = e;

        function s() {
            if (t && t.mountedInstances) {
                let e = a.Children.toArray(Array.from(t.mountedInstances).filter(Boolean));
                t.updateHead(r(e))
            }
        }
        return n && (t?.mountedInstances?.add(e.children), s()), i(() => (t?.mountedInstances?.add(e.children), () => {
            t?.mountedInstances?.delete(e.children)
        })), i(() => (t && (t._pendingUpdate = s), () => {
            t && (t._pendingUpdate = s)
        })), o(() => (t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null), () => {
            t && t._pendingUpdate && (t._pendingUpdate(), t._pendingUpdate = null)
        })), null
    }
}, 631710, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        default: function() {
            return h
        },
        defaultHead: function() {
            return c
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(481258),
        o = e.r(744066),
        s = e.r(809804),
        l = o._(e.r(371847)),
        u = i._(e.r(396611)),
        d = e.r(530272);

    function c() {
        return [(0, s.jsx)("meta", {
            charSet: "utf-8"
        }, "charset"), (0, s.jsx)("meta", {
            name: "viewport",
            content: "width=device-width"
        }, "viewport")]
    }

    function f(e, t) {
        return "string" == typeof t || "number" == typeof t ? e : t.type === l.default.Fragment ? e.concat(l.default.Children.toArray(t.props.children).reduce((e, t) => "string" == typeof t || "number" == typeof t ? e : e.concat(t), [])) : e.concat(t)
    }
    e.r(324668);
    let m = ["name", "httpEquiv", "charSet", "itemProp"];

    function p(e) {
        let t, r, a, n;
        return e.reduce(f, []).reverse().concat(c().reverse()).filter((t = new Set, r = new Set, a = new Set, n = {}, e => {
            let i = !0,
                o = !1;
            if (e.key && "number" != typeof e.key && e.key.indexOf("$") > 0) {
                o = !0;
                let r = e.key.slice(e.key.indexOf("$") + 1);
                t.has(r) ? i = !1 : t.add(r)
            }
            switch (e.type) {
                case "title":
                case "base":
                    r.has(e.type) ? i = !1 : r.add(e.type);
                    break;
                case "meta":
                    for (let t = 0, r = m.length; t < r; t++) {
                        let r = m[t];
                        if (e.props.hasOwnProperty(r))
                            if ("charSet" === r) a.has(r) ? i = !1 : a.add(r);
                            else {
                                let t = e.props[r],
                                    a = n[r] || new Set;
                                ("name" !== r || !o) && a.has(t) ? i = !1 : (a.add(t), n[r] = a)
                            }
                    }
            }
            return i
        })).reverse().map((e, t) => {
            let r = e.key || t;
            return l.default.cloneElement(e, {
                key: r
            })
        })
    }
    let h = function(e) {
        let {
            children: t
        } = e, r = (0, l.useContext)(d.HeadManagerContext);
        return (0, s.jsx)(u.default, {
            reduceComponentsToState: p,
            headManager: r,
            children: t
        })
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 106489, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "ImageConfigContext", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let a = e.r(481258)._(e.r(371847)),
        n = e.r(811526),
        i = a.default.createContext(n.imageConfigDefault)
}, 728415, (e, t, r) => {
    "use strict";

    function a(e, t) {
        let r = e || 75;
        return t?.qualities?.length ? t.qualities.reduce((e, t) => Math.abs(t - r) < Math.abs(e - r) ? t : e, t.qualities[0]) : r
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "findClosestQuality", {
        enumerable: !0,
        get: function() {
            return a
        }
    })
}, 307724, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let a = e.r(728415),
        n = e.r(61509);

    function i(e) {
        let {
            config: t,
            src: r,
            width: i,
            quality: o
        } = e, s = (0, n.getDeploymentId)();
        if (r.startsWith("/") && !r.startsWith("//")) {
            let e = r.indexOf("?");
            if (-1 !== e) {
                let t = new URLSearchParams(r.slice(e + 1)),
                    a = t.get("dpl");
                if (a) {
                    s = a, t.delete("dpl");
                    let n = t.toString();
                    r = r.slice(0, e) + (n ? "?" + n : "")
                }
            }
        }
        if (r.startsWith("/") && r.includes("?") && t.localPatterns?.length === 1 && "**" === t.localPatterns[0].pathname && "" === t.localPatterns[0].search) throw Object.defineProperty(Error(`Image with src "${r}" is using a query string which is not configured in images.localPatterns.
Read more: https://nextjs.org/docs/messages/next-image-unconfigured-localpatterns`), "__NEXT_ERROR_CODE", {
            value: "E871",
            enumerable: !1,
            configurable: !0
        });
        let l = (0, a.findClosestQuality)(o, t);
        return `${t.path}?url=${encodeURIComponent(r)}&w=${i}&q=${l}${r.startsWith("/")&&s?`&dpl=${s}`:""}`
    }
    i.__next_img_default = !0;
    let o = i
}, 699248, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "Image", {
        enumerable: !0,
        get: function() {
            return w
        }
    });
    let a = e.r(481258),
        n = e.r(744066),
        i = e.r(809804),
        o = n._(e.r(371847)),
        s = a._(e.r(652447)),
        l = a._(e.r(631710)),
        u = e.r(761805),
        d = e.r(811526),
        c = e.r(106489);
    e.r(324668);
    let f = e.r(409720),
        m = a._(e.r(307724)),
        p = e.r(763426),
        h = {
            deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
            imageSizes: [32, 48, 64, 96, 128, 256, 384],
            qualities: [75],
            path: "/_next/image",
            loader: "default",
            dangerouslyAllowSVG: !1,
            unoptimized: !0
        };

    function g(e, t, r, a, n, i, o) {
        let s = e?.src;
        e && e["data-loaded-src"] !== s && (e["data-loaded-src"] = s, ("decode" in e ? e.decode() : Promise.resolve()).catch(() => {}).then(() => {
            if (e.parentElement && e.isConnected) {
                if ("empty" !== t && n(!0), r?.current) {
                    let t = new Event("load");
                    Object.defineProperty(t, "target", {
                        writable: !1,
                        value: e
                    });
                    let a = !1,
                        n = !1;
                    r.current({
                        ...t,
                        nativeEvent: t,
                        currentTarget: e,
                        target: e,
                        isDefaultPrevented: () => a,
                        isPropagationStopped: () => n,
                        persist: () => {},
                        preventDefault: () => {
                            a = !0, t.preventDefault()
                        },
                        stopPropagation: () => {
                            n = !0, t.stopPropagation()
                        }
                    })
                }
                a?.current && a.current(e)
            }
        }))
    }

    function v(e) {
        return o.use ? {
            fetchPriority: e
        } : {
            fetchpriority: e
        }
    }
    "u" < typeof window && (globalThis.__NEXT_IMAGE_IMPORTED = !0);
    let b = (0, o.forwardRef)((e, t) => {
        let {
            src: r,
            srcSet: a,
            sizes: n,
            height: s,
            width: l,
            decoding: u,
            className: d,
            style: c,
            fetchPriority: f,
            placeholder: m,
            loading: h,
            unoptimized: b,
            fill: y,
            onLoadRef: w,
            onLoadingCompleteRef: x,
            setBlurComplete: E,
            setShowAltText: S,
            sizesInput: P,
            onLoad: C,
            onError: _,
            ...R
        } = e, O = (0, o.useCallback)(e => {
            e && (_ && (e.src = e.src), e.complete && g(e, m, w, x, E, b, P))
        }, [r, m, w, x, E, _, b, P]), j = (0, p.useMergedRef)(t, O);
        return (0, i.jsx)("img", {
            ...R,
            ...v(f),
            loading: h,
            width: l,
            height: s,
            decoding: u,
            "data-nimg": y ? "fill" : "1",
            className: d,
            style: c,
            sizes: n,
            srcSet: a,
            src: r,
            ref: j,
            onLoad: e => {
                g(e.currentTarget, m, w, x, E, b, P)
            },
            onError: e => {
                S(!0), "empty" !== m && E(!0), _ && _(e)
            }
        })
    });

    function y(e) {
        let {
            isAppRouter: t,
            imgAttributes: r
        } = e, a = {
            as: "image",
            imageSrcSet: r.srcSet,
            imageSizes: r.sizes,
            crossOrigin: r.crossOrigin,
            referrerPolicy: r.referrerPolicy,
            ...v(r.fetchPriority)
        };
        return t && s.default.preload ? (s.default.preload(r.src, a), null) : (0, i.jsx)(l.default, {
            children: (0, i.jsx)("link", {
                rel: "preload",
                href: r.srcSet ? void 0 : r.src,
                ...a
            }, "__nimg-" + r.src + r.srcSet + r.sizes)
        })
    }
    let w = (0, o.forwardRef)((e, t) => {
        let r = (0, o.useContext)(f.RouterContext),
            a = (0, o.useContext)(c.ImageConfigContext),
            n = (0, o.useMemo)(() => {
                let e = h || a || d.imageConfigDefault,
                    t = [...e.deviceSizes, ...e.imageSizes].sort((e, t) => e - t),
                    r = e.deviceSizes.sort((e, t) => e - t),
                    n = e.qualities?.sort((e, t) => e - t);
                return {
                    ...e,
                    allSizes: t,
                    deviceSizes: r,
                    qualities: n,
                    localPatterns: "u" < typeof window ? a?.localPatterns : e.localPatterns
                }
            }, [a]),
            {
                onLoad: s,
                onLoadingComplete: l
            } = e,
            p = (0, o.useRef)(s);
        (0, o.useEffect)(() => {
            p.current = s
        }, [s]);
        let g = (0, o.useRef)(l);
        (0, o.useEffect)(() => {
            g.current = l
        }, [l]);
        let [v, w] = (0, o.useState)(!1), [x, E] = (0, o.useState)(!1), {
            props: S,
            meta: P
        } = (0, u.getImgProps)(e, {
            defaultLoader: m.default,
            imgConf: n,
            blurComplete: v,
            showAltText: x
        });
        return (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(b, {
                ...S,
                unoptimized: P.unoptimized,
                placeholder: P.placeholder,
                fill: P.fill,
                onLoadRef: p,
                onLoadingCompleteRef: g,
                setBlurComplete: w,
                setShowAltText: E,
                sizesInput: e.sizes,
                ref: t
            }), P.preload ? (0, i.jsx)(y, {
                isAppRouter: !r,
                imgAttributes: S
            }) : null]
        })
    });
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 496801, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a = {
        default: function() {
            return d
        },
        getImageProps: function() {
            return u
        }
    };
    for (var n in a) Object.defineProperty(r, n, {
        enumerable: !0,
        get: a[n]
    });
    let i = e.r(481258),
        o = e.r(761805),
        s = e.r(699248),
        l = i._(e.r(307724));

    function u(e) {
        let {
            props: t
        } = (0, o.getImgProps)(e, {
            defaultLoader: l.default,
            imgConf: {
                deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
                imageSizes: [32, 48, 64, 96, 128, 256, 384],
                qualities: [75],
                path: "/_next/image",
                loader: "default",
                dangerouslyAllowSVG: !1,
                unoptimized: !0
            }
        });
        for (let [e, r] of Object.entries(t)) void 0 === r && delete t[e];
        return {
            props: t
        }
    }
    let d = s.Image
}, 931243, (e, t, r) => {
    t.exports = e.r(496801)
}, 175067, e => {
    "use strict";
    let t = null;
    e.s(["getGameLauncher", 0, () => t, "setGameLauncher", 0, e => {
        t = e
    }])
}, 266712, 567950, e => {
    "use strict";
    let t = (e, t, r) => new Promise(a => {
        let n = new CustomEvent(e, {
            cancelable: !0,
            detail: t(a)
        });
        window.dispatchEvent(n) && a(r)
    });
    e.s(["requestFromContainer", 0, t], 567950), e.s(["startAccessManagementUpsell", 0, e => {
        let {
            featureName: r,
            redirectLink: a,
            ampFeatureCheckData: n = [],
            isAsyncCall: i = !0,
            usePrologue: o = !1,
            ampRecourseData: s = null,
            featureSpecificData: l,
            namespace: u,
            wizardIntent: d
        } = e;
        return t("StartAccessManagementUpsell", e => ({
            featureName: r,
            redirectLink: a ?? null,
            ampFeatureCheckData: n,
            isAsyncCall: i,
            usePrologue: o,
            ampRecourseData: s,
            featureSpecificData: l ?? null,
            namespace: u ?? null,
            wizardIntent: d ?? null,
            closeCallback: t => {
                e("Granted" === t)
            }
        }), !1)
    }], 266712)
}, 888104, e => {
    "use strict";
    var t, r, a, n, i, o, s, l, u, d, c, f, m, p, h, g = e.i(371847);
    e.i(912035);
    var v = e.i(376054),
        b = e.i(136927),
        y = e.i(550475),
        w = e.i(42297),
        x = e.i(474754),
        E = e.i(259864),
        S = e.i(414822),
        P = e.i(578889),
        C = e.i(766271);

    function _(e, t) {
        let r = new Set(t);
        return e.filter(e => !r.has(e))
    }
    var R = (t = new WeakMap, r = new WeakMap, a = new WeakMap, n = new WeakMap, i = new WeakMap, o = new WeakMap, s = new WeakMap, l = new WeakMap, u = new WeakMap, d = new WeakMap, c = new WeakSet, f = new WeakSet, m = new WeakSet, p = new WeakSet, h = new WeakSet, class extends P.Subscribable {
        onSubscribe() {
            1 === this.listeners.size && (0, v._)(this, i).forEach(e => {
                e.subscribe(t => {
                    (0, w._)(this, p, N).call(this, e, t)
                })
            })
        }
        onUnsubscribe() {
            this.listeners.size || this.destroy()
        }
        destroy() {
            this.listeners = new Set, (0, v._)(this, i).forEach(e => {
                e.destroy()
            })
        }
        setQueries(e, t) {
            (0, y._)(this, a, e), (0, y._)(this, n, t), E.notifyManager.batch(() => {
                let e = (0, v._)(this, i),
                    t = (0, w._)(this, m, M).call(this, (0, v._)(this, a));
                t.forEach(e => e.observer.setOptions(e.defaultedQueryOptions));
                let n = t.map(e => e.observer),
                    o = n.map(e => e.getCurrentResult()),
                    s = e.length !== n.length,
                    l = n.some((t, r) => t !== e[r]),
                    u = s || l,
                    c = !!u || o.some((e, t) => {
                        let a = (0, v._)(this, r)[t];
                        return !a || !(0, C.shallowEqualObjects)(e, a)
                    });
                (u || c) && (u && ((0, y._)(this, d, t), (0, y._)(this, i, n)), (0, y._)(this, r, o), this.hasListeners() && (u && (_(e, n).forEach(e => {
                    e.destroy()
                }), _(n, e).forEach(e => {
                    e.subscribe(t => {
                        (0, w._)(this, p, N).call(this, e, t)
                    })
                })), (0, w._)(this, h, D).call(this)))
            })
        }
        getCurrentResult() {
            return (0, v._)(this, r)
        }
        getQueries() {
            return (0, v._)(this, i).map(e => e.getCurrentQuery())
        }
        getObservers() {
            return (0, v._)(this, i)
        }
        getOptimisticResult(e, t) {
            let r = (0, w._)(this, m, M).call(this, e),
                a = r.map(e => e.observer.getOptimisticResult(e.defaultedQueryOptions)),
                n = r.map(e => e.defaultedQueryOptions.queryHash);
            return [a, e => (0, w._)(this, f, j).call(this, e ?? a, t, n), () => (0, w._)(this, c, O).call(this, a, r)]
        }
        constructor(e, g, v) {
            super(), (0, x._)(this, c), (0, x._)(this, f), (0, x._)(this, m), (0, x._)(this, p), (0, x._)(this, h), (0, b._)(this, t, {
                writable: !0,
                value: void 0
            }), (0, b._)(this, r, {
                writable: !0,
                value: void 0
            }), (0, b._)(this, a, {
                writable: !0,
                value: void 0
            }), (0, b._)(this, n, {
                writable: !0,
                value: void 0
            }), (0, b._)(this, i, {
                writable: !0,
                value: void 0
            }), (0, b._)(this, o, {
                writable: !0,
                value: void 0
            }), (0, b._)(this, s, {
                writable: !0,
                value: void 0
            }), (0, b._)(this, l, {
                writable: !0,
                value: void 0
            }), (0, b._)(this, u, {
                writable: !0,
                value: void 0
            }), (0, b._)(this, d, {
                writable: !0,
                value: []
            }), (0, y._)(this, t, e), (0, y._)(this, n, v), (0, y._)(this, a, []), (0, y._)(this, i, []), (0, y._)(this, r, []), this.setQueries(g)
        }
    });

    function O(e, t) {
        return t.map((r, a) => {
            let n = e[a];
            return r.defaultedQueryOptions.notifyOnChangeProps ? n : r.observer.trackResult(n, e => {
                t.forEach(t => {
                    t.observer.trackProp(e)
                })
            })
        })
    }

    function j(e, t, a) {
        if (t) {
            let n = (0, v._)(this, u),
                i = void 0 !== a && void 0 !== n && (n.length !== a.length || a.some((e, t) => e !== n[t]));
            return (!(0, v._)(this, o) || (0, v._)(this, r) !== (0, v._)(this, l) || i || t !== (0, v._)(this, s)) && ((0, y._)(this, s, t), (0, y._)(this, l, (0, v._)(this, r)), void 0 !== a && (0, y._)(this, u, a), (0, y._)(this, o, (0, C.replaceEqualDeep)((0, v._)(this, o), t(e)))), (0, v._)(this, o)
        }
        return e
    }

    function M(e) {
        let r = new Map;
        (0, v._)(this, i).forEach(e => {
            let t = e.options.queryHash;
            if (!t) return;
            let a = r.get(t);
            a ? a.push(e) : r.set(t, [e])
        });
        let a = [];
        return e.forEach(e => {
            let n = (0, v._)(this, t).defaultQueryOptions(e),
                i = r.get(n.queryHash)?.shift() ?? new S.QueryObserver((0, v._)(this, t), n);
            a.push({
                defaultedQueryOptions: n,
                observer: i
            })
        }), a
    }

    function N(e, t) {
        let a = (0, v._)(this, i).indexOf(e);
        if (-1 !== a) {
            var n;
            let e;
            (0, y._)(this, r, (n = (0, v._)(this, r), (e = n.slice(0))[a] = t, e)), (0, w._)(this, h, D).call(this)
        }
    }

    function D() {
        if (this.hasListeners()) {
            let e = (0, v._)(this, o),
                t = (0, w._)(this, c, O).call(this, (0, v._)(this, r), (0, v._)(this, d));
            e !== (0, w._)(this, f, j).call(this, t, (0, v._)(this, n)?.combine) && E.notifyManager.batch(() => {
                this.listeners.forEach(e => {
                    e((0, v._)(this, r))
                })
            })
        }
    }
    var I = e.i(391855),
        k = e.i(373201),
        A = e.i(653350),
        L = e.i(997962),
        U = e.i(322910);
    e.s(["useQueries", 0, function(e, t) {
        let {
            queries: r,
            ...a
        } = e, n = (0, I.useQueryClient)(t), i = (0, k.useIsRestoring)(), o = (0, A.useQueryErrorResetBoundary)(), s = g.useMemo(() => r.map(e => {
            let t = n.defaultQueryOptions(e);
            return t._optimisticResults = i ? "isRestoring" : "optimistic", t
        }), [r, n, i]);
        s.forEach(e => {
            (0, U.ensureSuspenseTimers)(e);
            let t = n.getQueryCache().get(e.queryHash);
            (0, L.ensurePreventErrorBoundaryRetry)(e, o, t)
        }), (0, L.useClearResetErrorBoundary)(o);
        let [l] = g.useState(() => new R(n, s, a)), [u, d, c] = l.getOptimisticResult(s, a.combine), f = !i && !1 !== a.subscribed;
        g.useSyncExternalStore(g.useCallback(e => f ? l.subscribe(E.notifyManager.batchCalls(e)) : C.noop, [l, f]), () => l.getCurrentResult(), () => l.getCurrentResult()), g.useEffect(() => {
            l.setQueries(s, a)
        }, [s, a, l]);
        let m = u.some((e, t) => (0, U.shouldSuspend)(s[t], e)) ? u.flatMap((e, t) => {
            let r = s[t];
            if (r && (0, U.shouldSuspend)(r, e)) {
                let e = new S.QueryObserver(n, r);
                return (0, U.fetchOptimistic)(r, e, o)
            }
            return []
        }) : [];
        if (m.length > 0) throw Promise.all(m);
        let p = u.find((e, t) => {
            let r = s[t];
            return r && (0, L.getHasError)({
                result: e,
                errorResetBoundary: o,
                throwOnError: r.throwOnError,
                query: n.getQueryCache().get(r.queryHash),
                suspense: r.suspense
            })
        });
        if (null == p ? void 0 : p.error) throw p.error;
        return d(c())
    }], 888104)
}, 100266, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(888104),
        a = e.i(734899);
    e.i(350223);
    var n = e.i(874296),
        i = e.i(245837),
        o = e.i(646424),
        s = e.i(587541);
    let l = n.nullish(n.string()),
        u = n.looseObject({
            userId: n.number(),
            names: n.nullish(n.looseObject({
                combinedName: l,
                username: l,
                displayName: l,
                alias: l,
                contactName: l,
                platformName: l,
                inExperienceName: l
            }))
        }),
        d = n.object({
            profileDetails: n.nullish(n.array(u))
        }),
        c = async (e, t) => {
            let r = s.Url.parse(i.default.apiGatewayUrl).getOrThrow().withPath("/user-profile-api/v1/user/profiles/get-profiles");
            return (await o.post(r, {
                userIds: [...e],
                fields: [...t]
            }, d, {
                credentials: "include",
                headers: {
                    Accept: "application/json"
                },
                retry: o.defaultBrowserRetryDelay
            })).getOrThrow().profileDetails ?? []
        }, f = async (e, t) => {
            let r = [...new Set(e)],
                a = [];
            for (let e = 0; e < r.length; e += 200) a.push(r.slice(e, e + 200));
            let n = await Promise.all(a.map(e => c(e, t))),
                i = {};
            for (let e of n.flat()) i[e.userId] = e;
            return i
        }, m = e => [...new Set(e)].sort(), p = {
            all: () => ["userProfiles"],
            fields: e => [...p.all(), m(e).join(",")],
            user: (e, t) => [...p.fields(e), t]
        }, h = new Map;
    e.s(["useUserProfiles", 0, function(e, n) {
        let {
            enabled: i = !0,
            staleTime: o = 3e5
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, s = (0, t.useMemo)(() => [...new Set(e)], [e]), l = (0, r.useQueries)({
            queries: s.map(e => ({
                queryKey: p.user(n, e),
                queryFn: () => {
                    let t, r, i;
                    return r = (t = m(n)).join(","), null == (i = h.get(r)) && (i = (0, a.batchQuery)({
                        delay: 10,
                        maxSize: 200
                    }, e => f(e, t), (e, t) => e[t] ?? {
                        userId: t
                    }), h.set(r, i)), i(e)
                },
                enabled: i,
                staleTime: o
            }))
        }), u = l.map(e => e.data), d = (0, t.useRef)(null);
        if (d.current?.profiles.length !== u.length || d.current.profiles.some((e, t) => e !== u[t])) {
            let e = {};
            u.forEach(t => {
                null != t && (e[t.userId] = t)
            }), d.current = {
                profiles: u,
                data: e
            }
        }
        let c = i && l.some(e => void 0 === e.data && "error" !== e.status);
        return {
            data: d.current.data,
            isLoading: c
        }
    }, "userProfilesQueryKeys", 0, p], 100266)
}, 341950, e => {
    "use strict";
    var t = e.i(808558),
        r = e.i(7312),
        a = e.i(7284),
        n = e.i(371847),
        i = e.i(493739);
    let o = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        s = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        l = {
            Large: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Medium: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Small: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            XSmall: {
                circular: "radius-circle",
                square: "radius-small"
            }
        },
        u = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        d = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        c = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        f = {
            Default: {
                Emphasis: "content-action-emphasis",
                Standard: "content-action-standard",
                Alert: "content-action-alert",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-emphasis",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-alert",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        m = {
            Default: {
                Emphasis: "content-action-standard",
                Standard: "content-action-standard",
                Alert: "content-action-standard",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-standard",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-standard",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        p = (0, n.forwardRef)((e, p) => {
            let h, {
                className: g,
                icon: v,
                ariaLabel: b,
                isDisabled: y = !1,
                isCircular: w = !1,
                isSelected: x = !1,
                size: E = "Large",
                variant: S = "Emphasis",
                iconColor: P = "Default",
                asChild: C,
                children: _,
                ...R
            } = e;
            h = y ? d[S] : x ? c[S] : u[S];
            let O = (0, a.default)("foundation-web-icon-button", y ? r.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", o[E], l[E][w ? "circular" : "square"], h, g),
                j = n.default.createElement(n.default.Fragment, null, n.default.createElement(t.StateLayer, null), n.default.createElement("span", {
                    className: (0, a.default)("icon", v, s[E], y ? m[P][S] : f[P][S])
                }));
            if (C) {
                let {
                    as: e,
                    ...t
                } = R, r = n.default.Children.only(_);
                return n.default.createElement(i.Slot, {
                    ref: p,
                    ...t,
                    className: O,
                    "aria-label": b,
                    "aria-disabled": y || void 0
                }, n.default.cloneElement(r, {}, j))
            }
            if ("a" === R.as) {
                let {
                    as: e,
                    href: t,
                    ...r
                } = R;
                return n.default.createElement("a", {
                    ref: p,
                    ...r,
                    "aria-label": b,
                    "aria-disabled": y,
                    href: y ? void 0 : t,
                    className: O
                }, j)
            }
            let {
                as: M,
                ...N
            } = R;
            return n.default.createElement("button", {
                ref: p,
                type: "button",
                ...N,
                "aria-label": b,
                disabled: y,
                className: O
            }, j)
        });
    e.s(["IconButton", 0, p])
}, 219617, e => {
    "use strict";
    var t = e.i(7284),
        r = e.i(371847),
        a = e.i(775453),
        n = e.i(922353),
        i = e.i(9413),
        o = e.i(783660),
        s = e.i(634918),
        l = e.i(721988),
        u = e.i(411207),
        d = e.i(555876),
        c = e.i(199794),
        f = e.i(389784),
        m = e.i(158051),
        p = e.i(178511),
        h = e.i(584537),
        g = e.i(73772),
        v = e.i(700312),
        b = e.i(809804),
        y = "Popover",
        [w, x] = (0, i.createContextScope)(y, [d.createPopperScope]),
        E = (0, d.createPopperScope)(),
        [S, P] = w(y),
        C = e => {
            let {
                __scopePopover: t,
                children: a,
                open: n,
                defaultOpen: i,
                onOpenChange: o,
                modal: s = !1
            } = e, l = E(t), c = r.useRef(null), [f, m] = r.useState(!1), [p = !1, g] = (0, h.useControllableState)({
                prop: n,
                defaultProp: i,
                onChange: o
            });
            return (0, b.jsx)(d.Root, {
                ...l,
                children: (0, b.jsx)(S, {
                    scope: t,
                    contentId: (0, u.useId)(),
                    triggerRef: c,
                    open: p,
                    onOpenChange: g,
                    onOpenToggle: r.useCallback(() => g(e => !e), [g]),
                    hasCustomAnchor: f,
                    onCustomAnchorAdd: r.useCallback(() => m(!0), []),
                    onCustomAnchorRemove: r.useCallback(() => m(!1), []),
                    modal: s,
                    children: a
                })
            })
        };
    C.displayName = y;
    var _ = "PopoverAnchor";
    r.forwardRef((e, t) => {
        let {
            __scopePopover: a,
            ...n
        } = e, i = P(_, a), o = E(a), {
            onCustomAnchorAdd: s,
            onCustomAnchorRemove: l
        } = i;
        return r.useEffect(() => (s(), () => l()), [s, l]), (0, b.jsx)(d.Anchor, {
            ...o,
            ...n,
            ref: t
        })
    }).displayName = _;
    var R = "PopoverTrigger",
        O = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...i
            } = e, o = P(R, r), s = E(r), l = (0, n.useComposedRefs)(t, o.triggerRef), u = (0, b.jsx)(m.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": o.open,
                "aria-controls": o.contentId,
                "data-state": $(o.open),
                ...i,
                ref: l,
                onClick: (0, a.composeEventHandlers)(e.onClick, o.onOpenToggle)
            });
            return o.hasCustomAnchor ? u : (0, b.jsx)(d.Anchor, {
                asChild: !0,
                ...s,
                children: u
            })
        });
    O.displayName = R;
    var j = "PopoverPortal",
        [M, N] = w(j, {
            forceMount: void 0
        }),
        D = e => {
            let {
                __scopePopover: t,
                forceMount: r,
                children: a,
                container: n
            } = e, i = P(j, t);
            return (0, b.jsx)(M, {
                scope: t,
                forceMount: r,
                children: (0, b.jsx)(f.Presence, {
                    present: r || i.open,
                    children: (0, b.jsx)(c.Portal, {
                        asChild: !0,
                        container: n,
                        children: a
                    })
                })
            })
        };
    D.displayName = j;
    var I = "PopoverContent",
        k = r.forwardRef((e, t) => {
            let r = N(I, e.__scopePopover),
                {
                    forceMount: a = r.forceMount,
                    ...n
                } = e,
                i = P(I, e.__scopePopover);
            return (0, b.jsx)(f.Presence, {
                present: a || i.open,
                children: i.modal ? (0, b.jsx)(L, {
                    ...n,
                    ref: t
                }) : (0, b.jsx)(U, {
                    ...n,
                    ref: t
                })
            })
        });
    k.displayName = I;
    var A = (0, p.createSlot)("PopoverContent.RemoveScroll"),
        L = r.forwardRef((e, t) => {
            let i = P(I, e.__scopePopover),
                o = r.useRef(null),
                s = (0, n.useComposedRefs)(t, o),
                l = r.useRef(!1);
            return r.useEffect(() => {
                let e = o.current;
                if (e) return (0, g.hideOthers)(e)
            }, []), (0, b.jsx)(v.RemoveScroll, {
                as: A,
                allowPinchZoom: !0,
                children: (0, b.jsx)(T, {
                    ...e,
                    ref: s,
                    trapFocus: i.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, a.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        e.preventDefault(), l.current || i.triggerRef.current?.focus()
                    }),
                    onPointerDownOutside: (0, a.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            r = 0 === t.button && !0 === t.ctrlKey;
                        l.current = 2 === t.button || r
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, a.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        U = r.forwardRef((e, t) => {
            let a = P(I, e.__scopePopover),
                n = r.useRef(!1),
                i = r.useRef(!1);
            return (0, b.jsx)(T, {
                ...e,
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    e.onCloseAutoFocus?.(t), t.defaultPrevented || (n.current || a.triggerRef.current?.focus(), t.preventDefault()), n.current = !1, i.current = !1
                },
                onInteractOutside: t => {
                    e.onInteractOutside?.(t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                    let r = t.target;
                    a.triggerRef.current?.contains(r) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                }
            })
        }),
        T = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                trapFocus: a,
                onOpenAutoFocus: n,
                onCloseAutoFocus: i,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: c,
                onPointerDownOutside: f,
                onFocusOutside: m,
                onInteractOutside: p,
                ...h
            } = e, g = P(I, r), v = E(r);
            return (0, s.useFocusGuards)(), (0, b.jsx)(l.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: a,
                onMountAutoFocus: n,
                onUnmountAutoFocus: i,
                children: (0, b.jsx)(o.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: u,
                    onInteractOutside: p,
                    onEscapeKeyDown: c,
                    onPointerDownOutside: f,
                    onFocusOutside: m,
                    onDismiss: () => g.onOpenChange(!1),
                    children: (0, b.jsx)(d.Content, {
                        "data-state": $(g.open),
                        role: "dialog",
                        id: g.contentId,
                        ...v,
                        ...h,
                        ref: t,
                        style: {
                            ...h.style,
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
        z = "PopoverClose",
        F = r.forwardRef((e, t) => {
            let {
                __scopePopover: r,
                ...n
            } = e, i = P(z, r);
            return (0, b.jsx)(m.Primitive.button, {
                type: "button",
                ...n,
                ref: t,
                onClick: (0, a.composeEventHandlers)(e.onClick, () => i.onOpenChange(!1))
            })
        });

    function $(e) {
        return e ? "open" : "closed"
    }
    F.displayName = z, r.forwardRef((e, t) => {
        let {
            __scopePopover: r,
            ...a
        } = e, n = E(r);
        return (0, b.jsx)(d.Arrow, {
            ...n,
            ...a,
            ref: t
        })
    }).displayName = "PopoverArrow";
    let B = e => {
        let t = window.matchMedia?.("(pointer: coarse)")?.matches ?? !1,
            r = document.activeElement?.matches(":focus-visible");
        if (t && !r) return void e.preventDefault();
        let a = e.currentTarget?.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        a && (e.preventDefault(), a.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: a,
            onOpenChange: n,
            children: i
        } = e;
        return r.createElement(C, {
            open: t,
            defaultOpen: a,
            onOpenChange: n
        }, i)
    }, "PopoverClose", 0, function(e) {
        let {
            children: t,
            ...a
        } = e;
        return r.createElement(F, a, t)
    }, "PopoverContent", 0, function(e) {
        let {
            side: a = "bottom",
            align: n = "center",
            sideOffset: i = 4,
            className: o,
            children: s,
            ariaLabel: l,
            onOpenAutoFocus: u,
            ...d
        } = e;
        return r.createElement(D, null, r.createElement(k, {
            side: a,
            align: n,
            sideOffset: i,
            ...d,
            "aria-label": l ?? d["aria-label"],
            onOpenAutoFocus: u ?? B,
            className: (0, t.default)("foundation-web-portal-zindex", o)
        }, s))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: a,
            className: n,
            children: i
        } = e;
        return r.createElement(O, {
            asChild: t,
            disabled: a,
            className: n
        }, i)
    }], 219617)
}, 813537, e => {
    "use strict";
    var t = e.i(744420),
        r = e.i(371847),
        a = e.i(745911),
        n = r["use".trim()],
        i = e.i(254351),
        o = e.i(730828),
        s = e.i(484912),
        l = e.i(809804),
        u = e.i(674123),
        d = e.i(880983);
    let c = function(e) {
        let {
            Link: d,
            config: c,
            getPathname: f,
            ...m
        } = function(e, a) {
            var u, d, c;
            let f = {
                    ...u = a || {},
                    localePrefix: "object" == typeof(c = u.localePrefix) ? c : {
                        mode: c || "always"
                    },
                    localeCookie: !!((d = u.localeCookie) ?? 1) && {
                        name: "NEXT_LOCALE",
                        sameSite: "lax",
                        ..."object" == typeof d && d
                    },
                    localeDetection: u.localeDetection ?? !0,
                    alternateLinks: u.alternateLinks ?? !0
                },
                m = f.pathnames,
                p = (0, r.forwardRef)(function(t, r) {
                    let a, s, {
                        href: u,
                        locale: d,
                        ...c
                    } = t;
                    "object" == typeof u ? (a = u.pathname, s = u.params) : a = u;
                    let p = (0, i.isLocalizableHref)(u),
                        g = e(),
                        v = (0, i.isPromise)(g) ? n(g) : g,
                        b = p ? h({
                            locale: d || v,
                            href: null == m ? a : {
                                pathname: a,
                                params: s
                            },
                            forcePrefix: null != d || void 0
                        }) : a;
                    return (0, l.jsx)(o.default, {
                        ref: r,
                        href: "object" == typeof u ? {
                            ...u,
                            pathname: b
                        } : b,
                        locale: d,
                        localeCookie: f.localeCookie,
                        ...c
                    })
                });

            function h(e) {
                let t, {
                    forcePrefix: r,
                    href: a,
                    locale: n
                } = e;
                return null == m ? "object" == typeof a ? (t = a.pathname, a.query && (t += (0, s.serializeSearchParams)(a.query))) : t = a : t = (0, s.compileLocalizedPathname)({
                    locale: n,
                    ...(0, s.normalizeNameOrNameWithParams)(a),
                    pathnames: f.pathnames
                }), (0, s.applyPathnamePrefix)(t, n, f, r)
            }

            function g(e) {
                return function(t) {
                    for (var r = arguments.length, a = Array(r > 1 ? r - 1 : 0), n = 1; n < r; n++) a[n - 1] = arguments[n];
                    return e(h(t), ...a)
                }
            }
            return {
                config: f,
                Link: p,
                redirect: g(t.redirect),
                permanentRedirect: g(t.permanentRedirect),
                getPathname: h
            }
        }(a.useLocale, e);
        return {
            ...m,
            Link: d,
            usePathname: function() {
                let e, n, o = (e = (0, t.usePathname)(), n = (0, a.useLocale)(), (0, r.useMemo)(() => {
                        if (!e) return e;
                        let t = e,
                            r = (0, i.getLocalePrefix)(n, c.localePrefix);
                        if ((0, i.hasPathnamePrefixed)(r, e)) t = (0, i.unprefixPathname)(e, r);
                        else if ("never" !== c.localePrefix.mode && c.localePrefix.prefixes) {
                            let r = (0, i.getLocaleAsPrefix)(n);
                            (0, i.hasPathnamePrefixed)(r, e) && (t = (0, i.unprefixPathname)(e, r))
                        }
                        return t
                    }, [c.localePrefix, n, e])),
                    l = (0, a.useLocale)();
                return (0, r.useMemo)(() => o && c.pathnames ? (0, s.getRoute)(l, o, c.pathnames) : o, [l, o])
            },
            useRouter: function() {
                let e = (0, t.useRouter)(),
                    n = (0, a.useLocale)(),
                    i = (0, t.usePathname)();
                return (0, r.useMemo)(() => {
                    function t(e) {
                        return function(t, r) {
                            let {
                                locale: a,
                                ...o
                            } = r || {}, s = [f({
                                href: t,
                                locale: a || n,
                                forcePrefix: null != a || void 0
                            })];
                            Object.keys(o).length > 0 && s.push(o), (0, u.default)(c.localeCookie, i, n, a), e(...s)
                        }
                    }
                    return {
                        ...e,
                        push: t(e.push),
                        replace: t(e.replace),
                        prefetch: t(e.prefetch)
                    }
                }, [n, i, e])
            },
            getPathname: f
        }
    }({
        locales: d.locales,
        defaultLocale: d.defaultLocale,
        localePrefix: {
            mode: "as-needed",
            prefixes: Object.fromEntries([...d.locales.map(e => [e, " "]), [d.defaultLocale, `/${d.defaultLanguage}`], ...Object.entries(d.urlLocalePrefixToLanguage).map(e => {
                let [t, r] = e;
                return [t, `/${r}`]
            })])
        },
        localeDetection: !1,
        localeCookie: !1,
        alternateLinks: !1
    });
    e.s(["Nav", 0, c], 813537)
}, 326602, e => {
    "use strict";
    var t = e.i(587541),
        r = e.i(851460);
    e.s(["intoUrl", 0, e => {
        if (e instanceof t.Url) return e.href;
        if ("string" == typeof e) return e;
        let {
            path: a,
            searchParams: n,
            fragment: i
        } = e, o = null == n ? "" : r.UrlSearchParams.new(n).toString(), s = "" === o ? "" : `?${o}`, l = i ? i.startsWith("#") ? i : `#${i}` : "";
        return `${a}${s}${l}`
    }])
}, 784859, e => {
    "use strict";
    let t = void 0 === globalThis.window,
        r = void 0 !== globalThis.window;
    e.s(["isClient", 0, r, "isServer", 0, t])
}, 931070, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(744420),
        a = e.i(851460),
        n = e.i(326602),
        i = e.i(813537),
        o = e.i(784859);
    let s = () => o.isServer ? "" : window.location.hash;
    e.s(["useFragment", 0, () => {
        let [e, r] = (0, t.useState)(s());
        return (0, t.useEffect)(() => {
            let e = () => {
                r(s())
            };
            return window.addEventListener("hashchange", e), window.addEventListener("popstate", e), () => {
                window.removeEventListener("hashchange", e), window.removeEventListener("popstate", e)
            }
        }), e
    }, "usePath", 0, () => i.Nav.usePathname(), "useRouter", 0, () => {
        let e = i.Nav.useRouter();
        return (0, t.useMemo)(() => ({
            back: () => {
                e.back()
            },
            forward: () => {
                e.forward()
            },
            refresh: () => {
                e.refresh()
            },
            push: (t, r) => {
                e.push((0, n.intoUrl)(t), r)
            },
            replace: (t, r) => {
                e.replace((0, n.intoUrl)(t), r)
            },
            prefetch: (t, r) => {
                e.prefetch((0, n.intoUrl)(t), r)
            }
        }), [e])
    }, "useSearchParams", 0, () => a.UrlSearchParams.fromURLSearchParams((0, r.useSearchParams)()), "useUnsanitizedSearchParams", 0, () => a.UrlSearchParams.fromURLSearchParams((0, r.useSearchParams)(), !1)], 931070)
}, 424333, e => {
    "use strict";
    var t = e.i(371847);
    let r = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            a = (0, t.useRef)();
        return a.current || (r += 1, a.current = `${e}${r}`), a.current
    }])
}, 570391, e => {
    "use strict";
    var t = e.i(371847),
        r = e.i(18731);
    e.s(["useSize", 0, function(e) {
        let [a, n] = t.useState(void 0);
        return (0, r.useLayoutEffect)(() => {
            if (e) {
                n({
                    width: e.offsetWidth,
                    height: e.offsetHeight
                });
                let t = new ResizeObserver(t => {
                    let r, a;
                    if (!Array.isArray(t) || !t.length) return;
                    let i = t[0];
                    if ("borderBoxSize" in i) {
                        let e = i.borderBoxSize,
                            t = Array.isArray(e) ? e[0] : e;
                        r = t.inlineSize, a = t.blockSize
                    } else r = e.offsetWidth, a = e.offsetHeight;
                    n({
                        width: r,
                        height: a
                    })
                });
                return t.observe(e, {
                    box: "border-box"
                }), () => t.unobserve(e)
            }
            n(void 0)
        }, [e]), a
    }])
}, 655010, 468396, e => {
    "use strict";
    var t = e.i(959491),
        r = e.i(654902),
        a = e.i(371847);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: n,
            description: i,
            position: o = "top-center"
        } = e;
        return a.default.createElement(r.Tooltip, {
            position: o,
            title: n,
            description: i
        }, a.default.createElement(r.TooltipTrigger, {
            asChild: !0
        }, a.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": n,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, a.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }], 655010), e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]], 468396)
}, 418568, e => {
    "use strict";
    var t = e.i(646424),
        r = e.i(519003);
    e.i(350223);
    var a = e.i(874296);
    let n = a.object({
        gpcVersion: a.number(),
        cooldownPeriodInMs: a.number(),
        cooldownPeriodFuzzyInMs: a.number()
    });
    e.s(["getGlobalPrivacyControlPolicy", 0, () => t.get((0, r.getPageBaseUrls)().apiGateway.withPath("/guac-v2/v1/bundles/user-settings-global-privacy-control-policy"), n), "postGlobalPrivacyControl", 0, () => t.postUntyped((0, r.getPageBaseUrls)().apiGateway.withPath("/user-settings-api/v1/user-settings/gpc"), "", {
        credentials: "include"
    })], 418568)
}, 233971, e => {
    "use strict";
    var t = e.i(360702),
        r = e.i(646424),
        a = e.i(519003),
        n = e.i(418568);
    e.s(["getIsYourPrivacyChoicesModalEnabled", 0, () => r.getUntyped((0, a.getPageBaseUrls)().apiGateway.withPath("/guac-v2/v1/bundles/footer-ui"), {
        credentials: "include"
    }).map(e => null != e && "object" == typeof e && !Array.isArray(e) && !0 === e.IsPrivacyChoiceModalEnabled), "getModalData", 0, e => {
        let i = !0 === window.navigator.globalPrivacyControl;
        return null == e ? (0, t.okAsync)({
            isGpcEnabled: i,
            canUserManageAdsSettings: !1,
            isAdsSellShareDataEnabled: !1
        }) : (0, n.postGlobalPrivacyControl)().andThen(() => {
            let e;
            return t.AsyncResult.all([r.getUntyped((0, a.getPageBaseUrls)().apiGateway.withPath("/user-settings-api/v1/user-settings"), {
                credentials: "include"
            }).map(e => null != e && "object" == typeof e && !Array.isArray(e) && "Enabled" === e.allowSellShareData), (e = (0, a.getPageBaseUrls)().apiGateway.withPath("/access-management/v1/upsell-feature-access").withSearchParams({
                namespace: "account_management/UserSettingsPolicy",
                featureName: "ShouldShowAdsSettings"
            }), r.getUntyped(e, {
                credentials: "include"
            }).map(e => null != e && "object" == typeof e && !Array.isArray(e) && "Granted" === e.access))]).map(e => {
                let [t, r] = e;
                return {
                    isGpcEnabled: i,
                    canUserManageAdsSettings: r,
                    isAdsSellShareDataEnabled: t
                }
            })
        })
    }])
}, 736536, 119300, e => {
    "use strict";
    let t = {
        MountSearchLanding: "MountSearchLanding",
        ShowSearchLanding: "ShowSearchLanding",
        UpdateSearchSessionInfo: "UpdateSearchSessionInfo",
        SetSearchLandingHasContent: "SetSearchLandingHasContent"
    };
    e.s(["ModalEvent", 0, t], 119300), e.s(["default", 0, {
        ModalEvent: t,
        mountSearchLanding: function() {
            return new Promise(() => {
                let e = new CustomEvent(t.MountSearchLanding, {
                    detail: {}
                });
                window.dispatchEvent(e)
            })
        },
        showSearchLanding: function(e) {
            return new Promise(() => {
                let r = new CustomEvent(t.ShowSearchLanding, {
                    detail: {
                        sessionInfo: e
                    }
                });
                window.dispatchEvent(r)
            })
        },
        updateSessionInfo: function(e) {
            return new Promise(() => {
                let r = new CustomEvent(t.UpdateSearchSessionInfo, {
                    detail: {
                        sessionInfo: e
                    }
                });
                window.dispatchEvent(r)
            })
        },
        setSearchLandingHasContent: function() {
            return new Promise(() => {
                let e = new CustomEvent(t.SetSearchLandingHasContent, {});
                window.dispatchEvent(e)
            })
        }
    }], 736536)
}, 868970, e => {
    "use strict";
    var t = e.i(809804),
        r = e.i(371847),
        a = e.i(723941),
        n = e.i(126392),
        i = e.i(744420);
    let o = (e => {
        let t, {
                userId: r,
                defaultDark: a
            } = e,
            n = ["color-mode-light", "color-mode-dark", "color-mode-system"],
            i = "color-mode-light",
            {
                classList: o
            } = document.documentElement;
        if (n.some(e => o.contains(e))) return;
        try {
            let e = localStorage.getItem("theme");
            t = null == e ? null : JSON.parse(e)
        } catch {
            t = null
        }
        if (null != t && 0 !== t.version) return void o.add(i);
        let s = t?.data ?? [],
            l = s.find(e => {
                let [t] = e;
                return t.toString() === r.toString()
            }),
            u = l?.[2] ?? 0;
        if (a && (1 & u) == 0) {
            o.add("color-mode-dark");
            let e = s.filter(e => {
                    let [t] = e;
                    return t.toString() !== r.toString()
                }),
                t = e.slice(+(e.length >= 100));
            t.push([r, 1, 1 | u]);
            try {
                localStorage.setItem("theme", JSON.stringify({
                    version: 0,
                    data: t
                }))
            } catch {}
            return
        }
        let d = l?.[1],
            c = (null == d ? null : n[d]) ?? i;
        o.add(c)
    }).toString();
    e.s(["default", 0, function(e) {
        let {
            userId: s,
            defaultDark: l = !1,
            nonce: u
        } = e, d = (0, r.useRef)(!1);
        return (0, i.useServerInsertedHTML)(() => {
            if (!d.current) return d.current = !0, (0, t.jsx)("script", {
                blocking: "render",
                nonce: u,
                children: `(${o})(${a.serialize({userId:(0,n.userIdToNumber)(s),defaultDark:l}).value})`
            }, "color-mode")
        }), null
    }], 868970)
}]);

//# debugId=e584d96e-f171-214d-a6d5-217f455d93c3
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0i.0ho--hl~jj.js.map