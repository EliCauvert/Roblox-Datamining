;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "39117745-2f0f-daa9-89e4-52c6e47a868d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 603134, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(865581),
        r = e.i(432464),
        a = e.i(910030),
        i = e.i(391855),
        l = e.i(981498);
    let s = (0, n.default)(() => e.A(599449).then(e => ((0, l.trackAppShellCounter)("ChatLoad", {
            outcome: "loaded"
        }), e), e => {
            throw (0, l.trackAppShellCounter)("ChatLoad", {
                outcome: "failed"
            }), e
        }), {
            loadableGenerated: {
                modules: [427118]
            },
            ssr: !1,
            loading: () => null
        }),
        o = new a.QueryClient({
            defaultOptions: {
                queries: {
                    retry: !1,
                    refetchOnMount: !1,
                    refetchOnWindowFocus: !1,
                    refetchOnReconnect: !1
                }
            }
        });
    e.s(["default", 0, function(e) {
        let {
            showPlayButton: n
        } = e;
        return (0, t.jsx)(r.ErrorBoundary, {
            onError: () => {
                (0, l.trackAppShellCounter)("ChatLoad", {
                    outcome: "crashed"
                })
            },
            children: (0, t.jsx)(i.QueryClientProvider, {
                client: o,
                children: (0, t.jsx)(s, {
                    showPlayButton: n
                })
            })
        })
    }])
}, 275318, e => {
    "use strict";
    var t = e.i(371847);
    e.s(["default", 0, function() {
        return (0, t.useEffect)(() => {
            console.log(`
      _______      _________      _____       ______     _
     / _____ \\    |____ ____|    / ___ \\     | ____ \\   | |
    / /     \\_\\       | |       / /   \\ \\    | |   \\ \\  | |
    | |               | |      / /     \\ \\   | |   | |  | |
    \\ \\______         | |      | |     | |   | |___/ /  | |
     \\______ \\        | |      | |     | |   |  ____/   | |
            \\ \\       | |      | |     | |   | |        | |
     _      | |       | |      \\ \\     / /   | |        |_|
    \\ \\_____/ /       | |       \\ \\___/ /    | |         _
     \\_______/        |_|        \\_____/     |_|        |_|

     Keep your account safe! Do not send any information from
     here to anyone or paste any text here.

     If someone is asking you to copy or paste text here then
     you're giving someone access to your account, your gear,
     and your Robux.

     To learn more about keeping your account safe you can go to

     https://www.roblox.com/info/account-safety
    `)
        }, []), null
    }])
}, 336716, e => {
    "use strict";
    var t = e.i(646424),
        n = e.i(519003),
        r = e.i(686790);
    e.i(350223);
    var a = e.i(874296);
    let i = a.object({
            cookieName: a.string(),
            description: a.catch(a.literal([null, "Description.RBXIDCHECK", "Description.ROBLOSECURITY", "Description.GuestData", "Description.RBXEventTrackerV2", "Description.RBXImageCache", "Description.RBXcp", "Description._cfduid", "Description.HelpCenterSession", "Description.IclVisitorLangJs", "Description.HasGmid", "Description.RbxIp2", "Description.WpmlBrowserRedirectTest", "Description.CookieT", "Description.RBXViralAcquisition", "Description.RBXSource"]), null)
        }),
        l = a.object({
            ShouldDisplayCookieBannerV3: a.boolean(),
            NonEssentialCookieList: a.array(a.string()),
            EssentialCookieList: a.array(i),
            RestrictNonEssentialTrackingConsent: a.catch(a.optional(a.boolean()), void 0)
        });
    e.s(["getCookiePolicy", 0, () => t.get((0, n.getPageBaseUrls)().apiGateway.withPath("/guac-v2/v1/bundles/cookie-policy"), l, {
        credentials: "include"
    }).inspect(e => {
        (0, r.setTrackingRestriction)(e.RestrictNonEssentialTrackingConsent)
    })], 336716)
}, 809094, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(371847),
        r = e.i(708923),
        a = e.i(545819),
        i = e.i(784859),
        l = e.i(336716),
        s = e.i(686790),
        o = e.i(865581),
        u = e.i(69134),
        c = e.i(801827),
        d = e.i(536982),
        m = e.i(690255);
    let p = (0, o.default)(() => e.A(31611), {
            loadableGenerated: {
                modules: [358424]
            }
        }),
        g = "{privacyPolicyLink}";

    function f(e) {
        let {
            cookiePolicy: r,
            onClose: a
        } = e, [i, l] = (0, n.useState)(!1), {
            wwwRoblox: o
        } = (0, d.usePageBaseUrls)(), f = (0, c.useTranslations)("Feature.Tracking"), h = (0, c.useTranslations)("CommonUI.Controls"), v = f("Description.CookieBannerContent", {
            privacyPolicyLink: g
        }), I = v.indexOf(g), y = e => {
            (0, s.setUserConsent)(e, r.NonEssentialCookieList), a()
        };
        return (0, t.jsxs)("div", {
            className: "sticky bottom-[0] [z-index:1] bg-surface-100",
            children: [(0, t.jsxs)("div", {
                className: "flex flex-col gap-small padding-large",
                children: [(0, t.jsxs)("p", {
                    className: "text-body-medium content-default",
                    children: [v.substring(0, I), (0, t.jsx)(m.Link, {
                        href: o.withPath("/info/privacy"),
                        target: "_blank",
                        rel: "noreferrer",
                        className: "content-link",
                        children: f("Description.PrivacyPolicy")
                    }), v.substring(I + g.length)]
                }), (0, t.jsxs)("div", {
                    className: "flex justify-between",
                    children: [(0, t.jsx)(u.Button, {
                        variant: "Link",
                        onClick: () => {
                            l(!0)
                        },
                        children: f("Action.SetCookieOptions")
                    }), (0, t.jsxs)("div", {
                        className: "flex gap-large",
                        children: [(0, t.jsx)(u.Button, {
                            variant: "Standard",
                            onClick: () => {
                                y([])
                            },
                            children: h("Action.DeclineAll")
                        }), (0, t.jsx)(u.Button, {
                            variant: "Emphasis",
                            onClick: () => {
                                y(r.NonEssentialCookieList)
                            },
                            children: h("Action.AcceptAll")
                        })]
                    })]
                })]
            }), i ? (0, t.jsx)(p, {
                cookiePolicy: r,
                onSubmit: () => {
                    a()
                },
                onClose: () => {
                    l(!1)
                }
            }) : null]
        })
    }
    e.s(["default", 0, function() {
        let e = (0, n.useRef)(() => i.isClient ? a.get("RBXcb") : null),
            o = !!e.current()?.value,
            {
                data: u,
                isLoading: c
            } = (0, r.useQuery)({
                queryKey: ["cookie-policy"],
                queryFn: () => (0, l.getCookiePolicy)().getOrThrow(),
                enabled: !o,
                staleTime: 1 / 0
            }),
            [d, m] = (0, n.useState)(!1),
            p = u?.ShouldDisplayCookieBannerV3 && u.EssentialCookieList.length > 0,
            g = !o && !c && !p;
        return (0, n.useEffect)(() => {
            g && null != u && (0, s.setUserConsent)(u.NonEssentialCookieList, u.NonEssentialCookieList)
        }, [g, u]), o || !p || d ? null : (0, t.jsx)(f, {
            cookiePolicy: u,
            onClose: () => {
                m(!0)
            }
        })
    }], 809094)
}, 963157, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(371847),
        r = e.i(69134),
        a = e.i(341950),
        i = e.i(219617),
        l = e.i(7312),
        s = e.i(959491),
        o = e.i(424333),
        u = e.i(655010),
        c = e.i(468396),
        d = e.i(7284);
    let m = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        p = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        g = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        f = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        h = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        v = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        I = (0, n.forwardRef)((e, t) => {
            let {
                label: r,
                labelTooltip: a,
                leadingIconName: i,
                trailingIconName: I,
                leadingIconNode: y,
                trailingIconNode: b,
                hasError: A,
                error: E,
                helperText: C,
                size: w,
                variant: T = "Standard",
                isRequired: S,
                isDisabled: P,
                className: x,
                style: _,
                inputContainerClassName: N,
                inputContainerClassStyle: L,
                id: R,
                ...D
            } = e, k = (0, o.default)(), F = R || k, B = `${F}-description`, j = w ?? "Large", O = A || !!E, U = E || C, V = (0, n.useMemo)(() => i ? n.default.createElement(s.Icon, {
                name: i,
                size: j,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : y, [i, y, j]), G = (0, n.useMemo)(() => I ? n.default.createElement(s.Icon, {
                name: I,
                size: j,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : b, [j, I, b]), M = r ? n.default.createElement("label", {
                htmlFor: F,
                className: (0, d.default)(h[j], "content-emphasis")
            }, r, S && n.default.createElement(n.default.Fragment, null, " ", n.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return n.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, d.default)(`flex width-full flex-col gap-small ${x}`, {
                    [l.disabledOpacity]: P
                }),
                style: _
            }, M && (a ? n.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, M, n.default.createElement(u.LabelTooltip, a)) : M), n.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, d.default)("foundation-web-input flex items-center width-full", c.INPUT_STROKE_BY_VARIANT[T], c.INPUT_BACKGROUND_BY_VARIANT[T], N, g[j], f[j], m[j], p[j], O ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: L
            }, V, n.default.createElement("input", {
                type: "text",
                id: F,
                ref: t,
                className: (0, d.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", v[j]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": O,
                "aria-describedby": U ? B : void 0,
                required: S,
                ...D,
                disabled: P
            }), G), U && n.default.createElement("span", {
                id: B,
                className: (0, d.default)("text-caption-small", {
                    "content-system-alert": O,
                    "content-default": !O
                })
            }, U))
        });
    I.displayName = "TextInput";
    let y = "configurewebapps:overrideschanged",
        b = e => {
            let {
                fields: l
            } = e, s = (0, n.useCallback)(() => l.map(e => e.read()), [l]), [o, u] = (0, n.useState)(s), [c, d] = (0, n.useState)(o), [m, p] = (0, n.useState)(!1), g = o.some(e => "" !== e), f = (0, n.useRef)(o);
            f.current = o;
            let h = (0, n.useCallback)(() => {
                let e = s(),
                    t = f.current;
                e.every((e, n) => e === t[n]) || (d(n => n.map((n, r) => n === t[r] ? e[r] ?? "" : n)), u(e), p(!0))
            }, [s]);
            (0, n.useEffect)(() => (window.addEventListener(y, h), () => {
                window.removeEventListener(y, h)
            }), [h]);
            let v = (e, t) => {
                    let n = l[e];
                    if (null == n) return;
                    n.write(t), p(!0);
                    let r = n.read(),
                        a = t => t.map((t, n) => n === e ? r : t);
                    u(a), d(a)
                },
                b = l.map((e, t) => m || !o[t] ? null : e.warning?.(o[t]) ?? null),
                A = l.map((e, t) => o[t] ? `${e.summaryLabel}: ${o[t]}${b[t]?" (not served)":""}` : "").filter(Boolean).join(" · ");
            return (0, t.jsx)("div", {
                className: "env-overrides-overlay flex bg-surface-100 radius-medium",
                children: (0, t.jsxs)(i.Popover, {
                    onOpenChange: e => {
                        e && h()
                    },
                    children: [(0, t.jsx)(i.PopoverTrigger, {
                        asChild: !0,
                        children: (0, t.jsx)(r.Button, {
                            size: "Small",
                            variant: g ? "Alert" : "Standard",
                            icon: g ? "icon-filled-triangle-exclamation" : "icon-regular-gear",
                            children: g ? A : "env"
                        })
                    }), (0, t.jsxs)(i.PopoverContent, {
                        side: "top",
                        align: "start",
                        ariaLabel: "Environment overrides",
                        className: "env-overrides-overlay-panel bg-surface-100 stroke-standard stroke-default radius-medium padding-medium shadow-transient-high flex flex-col gap-medium",
                        children: [(0, t.jsxs)("div", {
                            className: "flex items-center justify-between gap-medium",
                            children: [(0, t.jsx)("span", {
                                className: "text-title-small",
                                children: "Environment overrides"
                            }), (0, t.jsx)(i.PopoverClose, {
                                asChild: !0,
                                children: (0, t.jsx)(a.IconButton, {
                                    icon: "icon-regular-x",
                                    ariaLabel: "Close",
                                    size: "Small",
                                    variant: "Utility"
                                })
                            })]
                        }), l.map((e, n) => (0, t.jsxs)("div", {
                            className: "flex flex-col gap-xsmall",
                            children: [(0, t.jsx)(I, {
                                label: e.label,
                                helperText: `current: ${""===o[n]?e.emptyText:o[n]??""}`,
                                size: "Small",
                                placeholder: e.placeholder,
                                value: c[n] ?? "",
                                onChange: e => {
                                    let {
                                        value: t
                                    } = e.target;
                                    d(e => e.map((e, r) => r === n ? t : e))
                                }
                            }), b[n] && (0, t.jsx)("span", {
                                role: "alert",
                                className: "text-caption-medium content-system-alert",
                                children: b[n]
                            }), (0, t.jsxs)("div", {
                                className: "flex gap-small",
                                children: [(0, t.jsx)(r.Button, {
                                    size: "Small",
                                    variant: "Emphasis",
                                    onClick: () => {
                                        v(n, c[n] ?? "")
                                    },
                                    children: "Set"
                                }), (0, t.jsx)(r.Button, {
                                    size: "Small",
                                    variant: "Standard",
                                    onClick: () => {
                                        v(n, "")
                                    },
                                    children: "Clear"
                                })]
                            })]
                        }, e.label)), m && (0, t.jsx)(r.Button, {
                            className: "width-full",
                            size: "Small",
                            variant: "Alert",
                            onClick: () => {
                                window.location.reload()
                            },
                            children: "Reload to apply"
                        })]
                    })]
                })
            })
        };
    var A = e.i(357355),
        E = e.i(586588),
        C = e.i(940311);
    let w = "mrrouter-env",
        T = /^(\d+)-/,
        S = /@(\d+)-/,
        P = {
            label: "MrRouter env",
            summaryLabel: "env",
            placeholder: "e.g. 19563-website-ne",
            emptyText: "default routing",
            read: C.getMrRouterEnvName,
            write: e => {
                (0, C.setMrRouterEnvName)(e), window.dispatchEvent(new Event(y))
            },
            warning: e => {
                let t = T.exec(e)?.[1],
                    n = A.document?.getElementById("rbx-sentry-config")?.dataset.release;
                return null == t || null == n || "" === n || S.exec(n)?.[1] === t ? null : `This page came from ${n}, not ${e}. The env may be missing, expired, or still deploying.`
            }
        },
        x = [P];
    e.s(["default", 0, function() {
        let [e, r] = (0, n.useState)(!1);
        return (0, n.useEffect)(() => {
            var e;
            let t, n, a;
            (null == (a = null == A.window ? null : (e = A.window.location.href, t = E.AnyUrl.parse(e).getOrNull(), n = t?.searchParams.get(w), null == t || null == n ? null : ((0, C.setMrRouterEnvName)(n.trim()), t.withSearchParams(t.searchParams.copyAndDelete(w)).toString()))) || (A.window?.location.replace(a), 0)) && (window.MrRouter = {
                getEnvName: C.getMrRouterEnvName,
                setEnvName: e => {
                    P.write(e ?? "")
                }
            }, r(!("Cypress" in window)))
        }, []), e ? (0, t.jsx)(b, {
            fields: x
        }) : null
    }], 963157)
}, 310119, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(708923),
        r = e.i(371847);
    let a = (0, e.i(865581).default)(() => e.A(389897), {
        loadableGenerated: {
            modules: [63400]
        }
    });

    function i(e) {
        let {
            userId: n,
            children: i
        } = e, [l, s] = (0, r.useState)(!1);
        return (0, t.jsxs)(t.Fragment, {
            children: [(0, t.jsx)("button", {
                type: "button",
                className: "flex items-center gap-xsmall hover:content-emphasis",
                onClick: () => {
                    s(!0)
                },
                children: i
            }), l && (0, t.jsx)(a, {
                userId: n,
                onClose: () => {
                    s(!1)
                }
            })]
        })
    }
    var l = e.i(536982),
        s = e.i(690255),
        o = e.i(931243),
        u = e.i(801827);
    let c = {
        src: e.i(407175).default,
        width: 60,
        height: 29,
        blurWidth: 8,
        blurHeight: 4,
        blurDataURL: "data:image/webp;base64,UklGRg4BAABXRUJQVlA4TAEBAAAvB8AAEM1VICICHgiwCQAAAIANAFQAAAIACgcAAAAAAAAAAABAAAAAAAAAAQEQkIBAhEgAqAMAAPBAgE0AAAAAzv8VckQCFAoAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAqAACsUcoPJAAEgAAAAAzr89A0OYwYC3AWADAAAAGAAAAAAAAAAAAAAAAGAAhgwAZrYB8HsgBCcAAAAA538PAKABAAAAAAAAAAAAAAAqAABiAAAAAAAAAAAAAAAADQBAplquJLrWnfUvV1rWZwQN//F8EmmH0srZFcM7alhirvGhF8Uc0s866EDBFzY00sN3gSB5hZ6wAyW17l1BdSRju1E/GgA="
    };

    function d() {
        let e = (0, u.useTranslations)("CommonUI.Features");
        return (0, t.jsxs)(t.Fragment, {
            children: [e("Label.YourPrivacyChoices"), (0, t.jsx)(o.default, {
                src: c,
                alt: "",
                className: "width-800"
            })]
        })
    }

    function m() {
        let {
            wwwRoblox: e
        } = (0, l.usePageBaseUrls)();
        return (0, t.jsx)(s.Link, {
            href: e.withPath("/my/account").withFragment("!/privacy"),
            target: "_blank",
            rel: "noreferrer",
            className: "flex items-center gap-xsmall hover:content-emphasis",
            children: (0, t.jsx)(d, {})
        })
    }
    var p = e.i(233971);
    e.s(["default", 0, function(e) {
        let {
            userId: r
        } = e, {
            data: a
        } = (0, n.useQuery)({
            queryKey: ["isYourPrivacyChoicesModalEnabled"],
            queryFn: () => (0, p.getIsYourPrivacyChoicesModalEnabled)().getOrThrow(),
            placeholderData: !1,
            staleTime: 1 / 0
        });
        return a ? (0, t.jsx)(i, {
            userId: r,
            children: (0, t.jsx)(d, {})
        }) : (0, t.jsx)(m, {})
    }], 310119)
}, 268957, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(371847),
        r = e.i(865581),
        a = e.i(708923),
        i = e.i(801827),
        l = e.i(336716);
    let s = (0, r.default)(() => e.A(31611), {
        loadableGenerated: {
            modules: [358424]
        }
    });
    e.s(["default", 0, function() {
        let e = (0, i.useTranslations)("Feature.Tracking"),
            {
                data: r
            } = (0, a.useQuery)({
                queryKey: ["cookie-policy"],
                queryFn: () => (0, l.getCookiePolicy)().getOrThrow(),
                staleTime: 1 / 0
            }),
            [o, u] = (0, n.useState)(!1),
            c = () => {
                u(!1)
            };
        return null != r && r.EssentialCookieList.length > 0 ? (0, t.jsxs)(t.Fragment, {
            children: [(0, t.jsx)("button", {
                type: "button",
                onClick: () => {
                    u(!0)
                },
                className: "hover:content-emphasis",
                children: e("Heading.CookieSettings")
            }), o ? (0, t.jsx)(s, {
                cookiePolicy: r,
                onSubmit: c,
                onClose: c
            }) : null]
        }) : null
    }])
}, 547434, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(865581),
        r = e.i(931070);
    let a = e => e.toLowerCase().replace(/\/+$/u, "") || "/",
        i = new Set(["/", "/createaccount"]),
        l = new Set(["/", "/createaccount", "/giftcards"]),
        s = (0, n.default)(() => e.A(339834), {
            loadableGenerated: {
                modules: [105584]
            }
        });
    e.s(["default", 0, function(e) {
        let {
            userId: n,
            variant: o
        } = e, u = (0, r.usePath)();
        return null != n || l.has(a(u)) ? (0, t.jsx)(s, {
            userId: n,
            isSignUpOrLandingPage: i.has(a(u)),
            variant: o
        }) : null
    }], 547434)
}, 115718, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(865581),
        r = e.i(371847),
        a = e.i(652447),
        i = e.i(736536),
        l = e.i(145420);
    let s = (0, n.default)(() => e.A(802269), {
            loadableGenerated: {
                modules: [412516]
            },
            ssr: !1
        }),
        {
            ModalEvent: o
        } = i.default,
        u = e => {
            e()
        },
        c = !1,
        d = {
            mount: () => {
                c = !0, u(() => i.default.mountSearchLanding())
            },
            show: e => {
                u(() => i.default.showSearchLanding(e))
            },
            updateSessionInfo: e => {
                u(() => i.default.updateSessionInfo(e))
            }
        };
    e.s(["default", 0, function() {
        let [e, n] = (0, r.useState)(null), i = (0, r.useRef)(!1), u = (0, r.useRef)(null);
        (0, r.useEffect)(() => {
            let e = () => {
                    let e = document.getElementById("search-landing-root");
                    null === e ? (0, l.fireEvent)("SearchLandingPageMountError") : n(e)
                },
                t = e => {
                    i.current || (u.current = (e => {
                        if (!(e instanceof CustomEvent)) return null;
                        let t = e.detail;
                        return "object" == typeof t && null !== t && "sessionInfo" in t ? String(t.sessionInfo) : null
                    })(e))
                };
            return window.addEventListener(o.MountSearchLanding, e), window.addEventListener(o.ShowSearchLanding, t), c && e(), () => {
                window.removeEventListener(o.MountSearchLanding, e), window.removeEventListener(o.ShowSearchLanding, t)
            }
        }, []);
        let m = (0, r.useCallback)(() => {
            if (i.current = !0, null !== u.current) {
                let e = u.current;
                u.current = null, d.show(e)
            }
        }, []);
        return e ? (0, a.createPortal)((0, t.jsx)(s, {
            onReady: m
        }), e) : null
    }, "resetMountRequestForTests", 0, () => {
        c = !1
    }, "searchLandingCapability", 0, d])
}, 776771, e => {
    "use strict";
    let t, n;
    var r, a, i, l, s, o, u, c, d, m, p, g, f, h, v, I, y, b, A, E = e.i(809804),
        C = e.i(865581),
        w = e.i(371847),
        T = e.i(285586),
        S = e.i(708923);
    e.i(350223);
    var P = e.i(874296),
        x = e.i(646424),
        _ = e.i(552566),
        N = e.i(587541),
        L = e.i(599965),
        R = e.i(519003),
        D = e.i(380952),
        k = e.i(217827),
        F = e.i(360702),
        B = e.i(645020),
        j = e.i(932598),
        O = e.i(982249),
        U = e.i(332210),
        V = e.i(491965),
        G = e.i(887524),
        M = e.i(431545);
    let $ = (e, t) => ["trustedFriendAction", e, t?.join(",") ?? void 0],
        X = "RemoveTrustedConnection",
        K = "AddTrustedConnectionViaLink",
        W = "AddTrustedFriendDoubleOptin",
        Q = "AddTrustedFriendWithVpc",
        Z = "AcceptTrustedFriendViaLinkWithVpcRecipient",
        H = "AcceptTrustedFriendWithVpcRecipient",
        q = "AcceptTrustedFriendViaLink",
        Y = "AcceptTrustedFriend",
        J = "PendingTrustedConnection",
        z = "PendingIncomingTrustedConnection",
        ee = {
            connectedOneYear: "Label.ConnectedOneYear",
            connectedNumYears: "Label.ConnectedNumYears",
            connectedOneMonth: "Label.ConnectedOneMonth",
            connectedNumMonths: "Label.ConnectedNumMonths",
            connectedOneDay: "Label.ConnectedOneDay",
            connectedNumDays: "Label.ConnectedNumDays",
            newFriend: "Label.NewFriend",
            ageGroupLabel: "Label.AgeGroupV2",
            mutualFriends: "Label.MutualFriendsTitle",
            joinedInYear: "Label.JoinedInYear",
            notAFriend: "Description.NotAFriend",
            noMutualFriends: "Description.NoMutualFriends",
            friendRequestOriginPlayerSearch: "Label.FromSearch",
            friendRequestOriginQrCode: "Description.FromQrCode",
            friendRequestOriginPhoneContactImporter: "Description.FromContacts",
            learnMore: "LinkText.LearnMore",
            genericError: "Message.SomethingWentWrong",
            acceptedTrustedFriend: "Label.NowTrusted",
            trustedFriendRequestSent: "TrustedFriend.Toast.TrustedFriendRequestSent",
            trustedFriendLinkCopied: "TrustedFriend.Toast.LinkCopied"
        },
        et = "Friends",
        en = "RequestReceived",
        er = "TrustedFriends",
        ea = "NotFriends",
        ei = {
            [X]: er,
            [K]: ea,
            [W]: et,
            [Q]: et,
            [J]: et,
            [Z]: en,
            [H]: en,
            [q]: en,
            [Y]: en,
            [z]: en
        },
        el = "trustedFriendsOk",
        es = "sendTrustedFriendRequest",
        eo = "acceptTrustedFriend",
        eu = "acceptTrustedFriendViaLink",
        ec = "vpcUpsell",
        ed = "vpcLinkRecipientUpsell",
        em = "noop",
        ep = "addViaLinkEmpty",
        eg = {
            [X]: {
                primary: {
                    textKey: "Action.OK"
                },
                handler: el
            },
            [K]: {
                primary: {
                    textKey: "Button.AddViaLink"
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: ep
            },
            [W]: {
                primary: {
                    textKey: "Action.Add"
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: es
            },
            [Q]: {
                primary: {
                    textKey: "Action.Add",
                    showVpcIcon: !0
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: ec
            },
            [H]: {
                primary: {
                    textKey: "Action.Accept",
                    showVpcIcon: !0
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: ec
            },
            [q]: {
                primary: {
                    textKey: "Action.Accept"
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: eu
            },
            [Y]: {
                primary: {
                    textKey: "Action.Accept"
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: eo
            },
            [Z]: {
                primary: {
                    textKey: "Action.Accept",
                    showVpcIcon: !0
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: ed
            },
            [J]: {
                primary: {
                    textKey: "Action.Add",
                    isDisabled: !0
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: em
            },
            [z]: {
                primary: {
                    textKey: "Action.Accept",
                    isDisabled: !0
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: em
            }
        },
        ef = {
            [et]: {
                title: "TrustedFriend.Label.AddTrustedFriend",
                description: "Description.DoMoreWithTrustedFriends"
            },
            [ea]: {
                title: "TrustedFriend.Label.AddTrustedFriend",
                description: "Description.DoMoreWithTrustedFriends"
            },
            [en]: {
                title: "TrustedFriend.AddBack.Header",
                description: "TrustedFriends.InfoLabel.FriendsRename"
            },
            ShareLinkReceiver: {
                title: "TrustedFriend.AddBack.Header",
                description: "TrustedFriends.InfoLabel.FriendsRename"
            },
            [er]: {
                title: "TrustedFriend.Info.Modal.Header",
                description: "Description.YouCanDoMoreWithTrustedFriends"
            }
        };
    var eh = e.i(391855);
    let ev = (0, w.createContext)(null),
        eI = () => {
            let e = (0, w.useContext)(ev);
            if (null == e) throw Error("TrustedFriendsModal needs a TrustedFriendsModalHostContext provider");
            return e
        };
    var ey = e.i(245837),
        eb = e.i(10224);
    let eA = () => `${ey.default.friendsApi}/v1`,
        eE = () => ({
            retryable: !0,
            withCredentials: !0
        });
    async function eC(e) {
        let t = {
                url: `${eA()}/users/${e}/accept-trusted-friend-request`,
                ...eE()
            },
            {
                data: n
            } = await eb.post(t, {});
        return n
    }
    async function ew(e, t) {
        let n = t ? `?source=${encodeURIComponent(t)}` : "",
            r = {
                url: `${eA()}/users/${e}/send-trusted-friend-request${n}`,
                ...eE()
            },
            {
                data: a
            } = await eb.post(r, {});
        return a
    }
    async function eT(e, t) {
        let n = {
                url: `${eA()}/users/${e}/validate-trusted-friend-link`,
                ...eE()
            },
            {
                data: r
            } = await eb.post(n, {
                Tokens: t
            });
        return r
    }
    async function eS(e, t) {
        let n = {
                url: `${eA()}/users/${e}/add-trusted-friend-from-link`,
                ...eE()
            },
            {
                data: r
            } = await eb.post(n, {
                Tokens: t
            });
        return r
    }
    async function eP(e) {
        let t = {
                url: `${eA()}/users/${e}/create-trusted-friend-link`,
                ...eE()
            },
            {
                data: n
            } = await eb.post(t, {});
        return n
    }
    async function ex(e, t) {
        let n = t?.friendRequestToken && Array.isArray(t.friendRequestToken) ? t.friendRequestToken.join(",") : void 0,
            r = {
                url: `${ey.default.apiGatewayUrl}/profile-platform-api/v1/profiles/get`,
                ...eE()
            },
            {
                data: a
            } = await eb.post(r, {
                profileType: "User",
                profileId: e,
                components: [{
                    component: "TrustedFriendActions",
                    context: n
                }]
            });
        return a.components?.TrustedFriendActions?.action
    }
    async function e_(e) {
        if ("u" > typeof ClipboardItem && "function" == typeof navigator.clipboard.write) {
            let t = e.then(e => new Blob([e], {
                    type: "text/plain"
                })),
                n = new ClipboardItem({
                    "text/plain": t
                });
            await Promise.all([navigator.clipboard.write([n]), t]);
            return
        }
        await navigator.clipboard.writeText(await e)
    }
    async function eN(e, t) {
        try {
            await e({
                featureName: "TriggerTrustedFriendVPCRecourse",
                ampFeatureCheckData: [{
                    name: "targetUser",
                    type: "UserId",
                    value: String(t)
                }],
                isAsyncCall: !1,
                usePrologue: !0,
                namespace: "connection_graph_core/ConnectionGraphCore",
                ampRecourseData: {
                    targetUserId: t
                }
            })
        } catch {
            throw Error("Failed to start trusted friend VPC upsell")
        }
    }
    var eL = ((r = {})[r.Invalid = 0] = "Invalid", r[r.PlayerSearch = 1] = "PlayerSearch", r[r.InGame = 2] = "InGame", r[r.UserProfile = 3] = "UserProfile", r[r.QqContactImporter = 4] = "QqContactImporter", r[r.WeChatContactImporter = 5] = "WeChatContactImporter", r[r.QrCode = 6] = "QrCode", r[r.ProfileShare = 7] = "ProfileShare", r[r.PhoneContactImporter = 8] = "PhoneContactImporter", r[r.OffNetworkFriendLink = 9] = "OffNetworkFriendLink", r[r.FriendRecommendations = 10] = "FriendRecommendations", r),
        eR = e.i(735697);
    let eD = {
            [eL.QrCode]: {
                iconName: "icon-filled-squares-grid-qr",
                translationKey: ee.friendRequestOriginQrCode
            },
            [eL.PhoneContactImporter]: {
                iconName: "icon-filled-smartphone-portrait",
                translationKey: ee.friendRequestOriginPhoneContactImporter
            },
            [eL.PlayerSearch]: {
                iconName: "icon-filled-magnifying-glass",
                translationKey: ee.friendRequestOriginPlayerSearch
            }
        },
        ek = {
            mutualFriendCount: 0
        };

    function eF(e) {
        if ("string" == typeof e) {
            let t = Date.parse(e);
            return Number.isFinite(t) ? Math.floor(t / 1e3) : void 0
        }
        if ("object" == typeof e && null !== e && "seconds" in e) {
            let t = e.seconds;
            return "number" == typeof t && t > 0 ? t : void 0
        }
    }
    let eB = e => {
            let {
                userId: t
            } = e, {
                translate: n
            } = (0, M.useTranslation)(), {
                AvatarHeadshot: r,
                useUserNames: a
            } = eI(), {
                data: i,
                isSuccess: l,
                isFetching: s
            } = (0, S.useQuery)({
                queryKey: ["multiProfileInsights", t],
                queryFn: () => (0, eR.fetchMultiProfileInsights)(t),
                refetchOnMount: !1,
                refetchOnWindowFocus: !1,
                refetchOnReconnect: !1
            }), [o, u] = (0, w.useState)(ek);
            (0, w.useEffect)(() => {
                if (!l) return void u(ek);
                let e = i.userInsights?.find(e => e.targetUser === t || String(e.targetUser) === String(t)),
                    n = e?.profileInsights;
                u(function(e) {
                    let t, n, r, a;
                    if (0 === e.length) return {
                        mutualFriendCount: 0
                    };
                    let i = 0;
                    for (let l of e) {
                        l.userAgeVerifiedBracket && (r = l.userAgeVerifiedBracket);
                        let e = l.mutualFriendInsight?.mutualFriends;
                        e && (i = Object.keys(e).length);
                        let s = l.friendshipAgeInsight,
                            o = eF(s?.friendsSinceDateTime);
                        o && (t = o);
                        let u = l.accountCreationDateInsight,
                            c = eF(u?.accountCreatedDateTime);
                        c && (n = new Date(1e3 * c).getFullYear());
                        let d = l.friendRequestOriginInsight;
                        d?.friendRequestOriginSource && (a = eD[d.friendRequestOriginSource])
                    }
                    return {
                        mutualFriendCount: i,
                        friendshipStartUnixSeconds: t,
                        accountCreationYear: n,
                        userAgeVerifiedBracketCatalogKey: r,
                        friendRequestOriginDisplay: a
                    }
                }(Array.isArray(n) ? n : []))
            }, [i, l, t]);
            let {
                mutualFriendCount: c,
                friendshipStartUnixSeconds: d,
                accountCreationYear: m,
                userAgeVerifiedBracketCatalogKey: p,
                friendRequestOriginDisplay: g
            } = o, f = a(t), h = (0, w.useMemo)(() => (function(e, t, n) {
                if (null == e || e <= 0) return "";
                let r = Math.floor(Math.max(0, ((void 0) ?? Math.floor(Date.now() / 1e3)) - e) / 60 / 60 / 24);
                if (r >= 365) {
                    let e = Math.floor(r / 365);
                    return 1 === e ? t(n.connectedOneYear) : t(n.connectedNumYears, {
                        num: e
                    })
                }
                if (r >= 30) {
                    let e = Math.floor(r / 30);
                    return 1 === e ? t(n.connectedOneMonth) : t(n.connectedNumMonths, {
                        num: e
                    })
                }
                return 1 === r ? t(n.connectedOneDay) : r > 1 ? t(n.connectedNumDays, {
                    num: r
                }) : t(n.newFriend)
            })(d, n, ee), [d, n]), v = p ?? "", I = v ? n(v) : "", y = I ? `${n(ee.ageGroupLabel)} ${I}` : "", b = (0, w.useMemo)(() => [{
                id: "age-group",
                iconName: "icon-filled-shield-check",
                label: y
            }, h ? {
                id: "friendship-duration",
                iconName: "icon-filled-calendar",
                label: h
            } : {
                id: "not-a-friend",
                iconName: "icon-filled-triangle-exclamation",
                label: n(ee.notAFriend)
            }, c > 0 ? {
                id: "mutual-friends",
                iconName: "icon-filled-two-people",
                label: n(ee.mutualFriends, {
                    numConnections: c
                })
            } : {
                id: "no-mutual-friends",
                iconName: "icon-filled-triangle-exclamation",
                label: n(ee.noMutualFriends)
            }, ...g ? [{
                id: "friend-request-origin",
                iconName: g.iconName,
                label: n(g.translationKey)
            }] : [], {
                id: "joined-year",
                iconName: "icon-filled-circle-i",
                label: n(ee.joinedInYear, {
                    year: m ?? ""
                })
            }].filter(e => {
                var t;
                return !!(t = e.label) && ("string" != typeof t || t.length > 0)
            }), [m, y, h, g, c, n]);
            return (0, E.jsxs)("div", {
                className: "radius-large bg-shift-100 padding-large flex flex-col gap-large",
                children: [(0, E.jsxs)("div", {
                    className: "flex flex-row items-center gap-medium",
                    children: [(0, E.jsxs)("div", {
                        className: "trusted-friend-social-avatar-circle bg-shift-200",
                        children: [(0, E.jsx)(r, {
                            userId: t,
                            className: "trusted-friend-social-avatar-thumb radius-circle"
                        }), (0, E.jsx)("div", {
                            className: "trusted-friend-social-avatar-loading-overlay",
                            "aria-hidden": !0
                        })]
                    }), (0, E.jsxs)("div", {
                        className: "flex flex-col gap-xxsmall min-width-0",
                        children: [(0, E.jsx)("p", {
                            className: "text-heading-small text-overflow-ellipsis margin-none",
                            children: f?.combinedName ?? ""
                        }), (0, E.jsx)("p", {
                            className: "text-body-medium content-default text-overflow-ellipsis margin-none",
                            children: f?.username ?? ""
                        })]
                    })]
                }), b.length && !s ? (0, E.jsx)("ul", {
                    className: "flex flex-row flex-wrap gap-medium justify-start items-center list-none margin-none padding-none",
                    children: b.map(e => {
                        let {
                            id: t,
                            iconName: n,
                            label: r
                        } = e;
                        return (0, E.jsxs)("li", {
                            className: "inline-flex max-width-full flex-row items-center gap-xsmall",
                            children: [(0, E.jsx)(V.Icon, {
                                name: n,
                                size: "XSmall",
                                className: "content-default shrink-0"
                            }), (0, E.jsx)("span", {
                                className: "text-body-medium content-default min-width-0",
                                children: r
                            })]
                        }, t)
                    })
                }) : null]
            })
        },
        ej = e => {
            let {
                open: t,
                onClose: n,
                userId: r,
                linkTokens: a,
                onComplete: i,
                modalVariant: l,
                trustedFriendAction: s,
                setToastMessage: o
            } = e, {
                translate: u
            } = (0, M.useTranslation)(), {
                buttonConfig: c,
                performPrimaryAction: d
            } = function(e) {
                let {
                    userId: t,
                    linkTokens: n,
                    trustedFriendAction: r,
                    onClose: a,
                    setToastMessage: i,
                    onComplete: l
                } = e, {
                    translate: s
                } = (0, M.useTranslation)(), o = (0, eh.useQueryClient)(), {
                    startAccessManagementUpsell: u,
                    useUserNames: c
                } = eI(), d = c(t), m = (0, w.useMemo)(() => (function(e) {
                    if (!e || !(e in ei)) return;
                    let t = eg[e];
                    return {
                        primary: t.primary,
                        secondary: t.secondary,
                        handler: t.handler
                    }
                })(r), [r]), p = (0, w.useCallback)(async () => {
                    if (!m) return;
                    let {
                        handler: e
                    } = m, r = d?.username ?? "", c = async () => {
                        await o.invalidateQueries({
                            queryKey: ["trustedFriendStatus", t]
                        }), await o.invalidateQueries({
                            queryKey: $(t, n)
                        })
                    }, p = async () => {
                        if (!n?.length) throw Error("useGetTrustedFriendsModalButtons: linkTokens required for link accept flow");
                        await eT(t, n), await eS(t, n)
                    }, g = async () => {
                        await e_(eP(t).then(e => {
                            let {
                                link: t
                            } = e;
                            return t
                        })), i(s(ee.trustedFriendLinkCopied)), await c(), await l?.(), a(!0)
                    }, f = async () => {
                        i(s(ee.trustedFriendRequestSent)), await c(), await l?.(), a(!0)
                    }, h = async () => {
                        i(s(ee.acceptedTrustedFriend, {
                            username: r
                        })), await c(), await l?.(), a(!0)
                    }, v = async e => {
                        switch (e) {
                            case el:
                                await l?.(), a(!0);
                                break;
                            case es:
                                await ew(t), await f();
                                break;
                            case eo:
                                await eC(t), await h();
                                break;
                            case eu:
                                await p(), await h();
                                break;
                            case ec:
                                a(!1), await eN(u, t), await l?.();
                                break;
                            case ed:
                                a(!1), await p(), await eN(u, t), await l?.();
                                break;
                            case ep:
                                await g()
                        }
                    };
                    try {
                        i(null), await v(e)
                    } catch {
                        i(s(ee.genericError))
                    }
                }, [t, n, s, a, d, i, o, l, m, u]);
                return {
                    buttonConfig: m,
                    performPrimaryAction: p
                }
            }({
                userId: r,
                linkTokens: a,
                trustedFriendAction: s,
                onClose: n,
                setToastMessage: o,
                onComplete: i
            }), m = (0, w.useCallback)(e => {
                e || n(!1)
            }, [n]), p = (0, w.useMemo)(() => ef[l], [l]), g = (0, w.useCallback)(() => {
                c?.primary.isDisabled || d().catch(() => void 0)
            }, [c, d]);
            return (0, E.jsx)(U.Dialog, {
                open: t,
                onOpenChange: m,
                size: "Medium",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: "Close",
                children: (0, E.jsxs)(U.DialogContent, {
                    children: [(0, E.jsxs)(U.DialogBody, {
                        className: "flex flex-col gap-medium",
                        children: [(0, E.jsx)(U.DialogTitle, {
                            className: "text-heading-small margin-none",
                            children: u(p.title)
                        }), (0, E.jsxs)("div", {
                            className: "text-body-medium content-default flex flex-col gap-xsmall",
                            children: [u(p.description), (0, E.jsx)("a", {
                                href: "https://help.roblox.com/hc/articles/37725513985812",
                                target: "_blank",
                                rel: "noreferrer",
                                className: "trusted-friends-modal-learn-more-link text-body-medium content-default",
                                children: u(ee.learnMore)
                            })]
                        }), (0, E.jsx)(eB, {
                            userId: r
                        })]
                    }), (0, E.jsx)(U.DialogFooter, {
                        className: "flex flex-col gap-small",
                        children: (0, E.jsxs)("div", {
                            className: "flex width-full min-width-0 flex-row gap-small items-center",
                            children: [(0, E.jsx)(O.Button, {
                                variant: "Emphasis",
                                size: "Medium",
                                className: "fill min-width-0 flex-1 basis-0",
                                isDisabled: c?.primary.isDisabled === !0,
                                onClick: g,
                                children: (0, E.jsxs)("span", {
                                    className: "flex width-full min-width-0 flex-row items-center justify-center gap-small",
                                    children: [c?.primary.showVpcIcon ? (0, E.jsx)(V.Icon, {
                                        name: "icon-regular-lock-closed",
                                        size: "Medium",
                                        className: "flex shrink-0 items-center justify-center",
                                        "aria-hidden": !0
                                    }) : null, (0, E.jsx)("span", {
                                        className: "min-width-0",
                                        children: u(c?.primary.textKey ?? "")
                                    })]
                                })
                            }), c?.secondary ? (0, E.jsx)(O.Button, {
                                variant: "Standard",
                                size: "Medium",
                                className: "fill min-width-0 flex-1 basis-0",
                                onClick: () => {
                                    n(!1)
                                },
                                children: u(c.secondary.textKey)
                            }) : null]
                        })
                    })]
                })
            })
        },
        eO = e => {
            let {
                open: t,
                onClose: n,
                userId: r,
                linkTokens: a,
                onComplete: i
            } = e, {
                translate: l
            } = (0, M.useTranslation)(), {
                startAccessManagementUpsell: s
            } = eI(), {
                data: o,
                isFetched: u,
                refetch: c
            } = (0, S.useQuery)({
                queryKey: $(r, a),
                queryFn: () => ex(r, {
                    friendRequestToken: a
                }),
                enabled: t,
                refetchOnMount: !1,
                refetchOnWindowFocus: !1,
                refetchOnReconnect: !1
            }), [d, m] = (0, w.useState)(null), p = (0, w.useCallback)(() => {
                m(null)
            }, []), g = (0, w.useMemo)(() => t && u ? o && o in ei ? ei[o] : "invalid" : "pending", [t, u, o]), f = (0, w.useCallback)(async () => {
                try {
                    await s({
                        featureName: "TriggerAgeCheckUpsellIncludingVPC",
                        namespace: "core_content/CoreContent",
                        isAsyncCall: !1,
                        usePrologue: !0,
                        featureSpecificData: {
                            context: "trusted-friends-modal"
                        }
                    }) ? c().catch(() => void 0) : n(!1)
                } catch {
                    n(!1)
                }
            }, [n, c, s]);
            (0, w.useEffect)(() => {
                if ("pending" !== g) {
                    if ("UnlockTrustedFriendByFAE" === o) return void f().catch(() => void 0);
                    "invalid" === g && (m(l(ee.genericError)), n(!1))
                }
            }, [g, o, l, n, f]);
            let h = !(!t || "pending" === g || "invalid" === g);
            return (0, E.jsxs)(w.default.Fragment, {
                children: [d ? (0, E.jsx)(G.Snackbar, {
                    title: d,
                    onClose: p,
                    shouldAutoDismiss: !0
                }) : null, h && (0, E.jsx)(ej, {
                    open: t,
                    onClose: n,
                    userId: r,
                    linkTokens: a,
                    onComplete: i,
                    modalVariant: g,
                    trustedFriendAction: o,
                    setToastMessage: m
                })]
            })
        };
    var eU = e.i(266712),
        eV = e.i(44170),
        eG = e.i(145420),
        eM = e.i(175067),
        e$ = e.i(460987),
        eX = e.i(100266),
        eK = e.i(723941),
        eW = e.i(476752),
        eQ = e.i(851460),
        eZ = ((a = {}).GameDetails = "game_details", a.Profile = "profile", a.Home = "home", a.Games = "games", a.Avatar = "avatar", a.Catalog = "catalog", a.Friends = "friends", a.ItemDetails = "item_details", a.Navigation = "navigation", a.PlaceId = "placeId", a.UserId = "userId", a.ShareLinks = "share_links", a.Chat = "chat", a.GiftCards = "gift_cards", a.NotificationSettings = "notification_settings", a.AccountInfo = "account_info", a.PrivacySettings = "privacy_settings", a.AppPermissionsSettings = "app_permissions_settings", a.ScreentimeSubsettings = "screentime_subsettings", a.BlockedExperiencesSubsettings = "blocked_experiences_subsettings", a.BlockedUsersSubsettings = "blocked_users_subsettings", a.ExperienceChatSubsettings = "experience_chat_subsettings", a.PartySubsettings = "party_subsettings", a.VoiceSubsettings = "voice_subsettings", a.CommunicationSettings = "communication_settings", a.CommunicationSubsettings = "communication_subsettings", a.TradingInventorySubsettings = "trading_inventory_subsettings", a.PrivateServerSubsettings = "private_server_subsettings", a.FriendsContactsSubsettings = "friends_contacts_subsettings", a.VisibilitySubsettings = "visibility_subsettings", a.ParentalControls = "parental_controls", a.SpendingSettings = "spending_settings", a.RobuxSettings = "robux_settings", a.Group = "group", a.ExternalWebUrl = "external_web_link", a.SecurityAlert = "security_alert", a.Fae = "fae", a.Messages = "messages", a.BuyRobux = "buy_robux", a.CurrencyTransfer = "currency_transfer", a.ProfileCard = "profile_card", a.AmpWizard = "amp_wizard", a.SupportCenter = "support_center", a.PlusUpsell = "plus_upsell", a.PlusReferralDashboard = "plus_referral_dashboard", a.PlusSubscribe = "plus_subscribe", a.PlusWebview = "plus_webview", a.AcceptGift = "accept_gift", a.Moments = "moments", a);
    (i = {}).Asset = "Asset", i.Bundle = "Bundle", i.Look = "Look";
    let eH = {
            Asset: "/catalog",
            Bundle: "/bundles",
            Look: "/looks"
        },
        eq = {
            home: "/home",
            games: "/games",
            catalog: "/catalog",
            friends: "/users/friends",
            gift_cards: "/giftcards",
            notification_settings: "/my/account#!/notifications",
            account_info: "/my/account#!/info",
            privacy_settings: "/my/account#!/privacy",
            parental_controls: "/my/account#!/parental-controls",
            spending_settings: "/my/account#!/billing",
            robux_settings: "/my/account#!/robux",
            app_permissions_settings: "/my/account#!/app-permissions",
            screentime_subsettings: "/my/account#!/privacy/Screentime",
            blocked_experiences_subsettings: "/my/account#!/privacy/ContentRestrictions/BlockedExperiences",
            blocked_users_subsettings: "/my/account#!/privacy/BlockedUsers",
            experience_chat_subsettings: "/my/account#!/privacy/Communication/ExperienceChat",
            party_subsettings: "/my/account#!/privacy/Communication/Party",
            voice_subsettings: "/my/account#!/privacy/Communication/Voice",
            communication_settings: "/my/account#!/privacy/Communication",
            communication_subsettings: "/my/account#!/privacy/Communication",
            trading_inventory_subsettings: "/my/account#!/privacy/TradingAndInventory",
            friends_contacts_subsettings: "/my/account#!/privacy/FriendsAndContacts",
            private_server_subsettings: "/my/account#!/privacy/VisibilityAndPrivateServers/PrivateServerPrivacy",
            visibility_subsettings: "/my/account#!/privacy/VisibilityAndPrivateServers/Visibility",
            messages: "/my/messages/#!/inbox",
            buy_robux: "/upgrades/robux",
            plus_webview: "/plus"
        },
        eY = {
            Home: "/home",
            Games: "/games",
            Users: "/users",
            Groups: "/groups",
            Profile: "/profile",
            GameStart: "/games/start",
            GiftCards: "/giftcards",
            ExperienceLauncher: "roblox://experiences/start?",
            Asset: "/catalog",
            Bundle: "/bundles",
            Look: "/looks",
            AppLauncher: "roblox://navigation",
            ContentPost: "/content_posts",
            Avatar: "/my/avatar",
            SecurityAlert: "/security-feedback",
            SupportCenter: "/support-center",
            Plus: "/plus"
        },
        eJ = (e, t, n) => ({
            type: "linkResolved",
            context: "deepLink",
            params: {
                linkType: n,
                linkStatus: e,
                linkId: t
            }
        }),
        ez = "DeeplinkParserExperienceDetailsResolutionFailed",
        e0 = (e, t, n) => ({
            eventName: "joinGameFromInviteLink",
            ctx: "shareLinks",
            gamePlayIntentEventCtx: "shareLinks",
            properties: {
                linkStatus: n,
                linkType: "ExperienceInvite",
                placeId: e,
                linkId: t
            }
        });
    var e1 = ((l = e1 || {}).PROFILE_SHARE = "ProfileShare", l.QR_CODE = "QrCode", l),
        e8 = ((s = e8 || {}).AVATAR_ITEM_DETAILS = "AvatarItemDetails", s.AVATAR_ITEM_AFFILIATE = "AvatarItemAffiliate", s.CONTENT_POST = "ContentPost", s.EXPERIENCE_INVITE = "ExperienceInvite", s.EXPERIENCE_AFFILIATE = "ExperienceAffiliate", s.FRIEND_INVITE = "FriendInvite", s.NOTIFICATION_EXPERIENCE_INVITE = "NotificationExperienceInvite", s.PROFILE = "Profile", s.SCREENSHOT_INVITE = "ScreenshotInvite", s.SERVER = "Server", s.EXPERIENCE_DETAILS = "ExperienceDetails", s.EXPERIENCE_EVENT = "ExperienceEvent", s),
        e3 = ((o = e3 || {}).EXPERIENCE_V2 = "ExperienceV2", o.USER_TRUSTED_CONNECTION = "UserTrustedConnection", o.STUDIO_TRUSTED_CONNECTION = "StudioTrustedConnection", o.MOMENTS = "Moments", o.SCHOOL_INVITE = "SchoolInvite", o.REFERRAL = "Referral", o),
        e2 = ((u = e2 || {}).VALID = "Valid", u.EXPIRED = "Expired", u.INVITER_NOT_IN_EXPERIENCE = "InviterNotInExperience", u),
        e5 = ((c = e5 || {}).VALID = "Valid", c.EXPIRED = "Expired", c.CONSUMED = "Consumed", c.SENDER_BLOCKED_RECIPIENT = "SenderBlockedRecipient", c.INVALID = "Invalid", c),
        e9 = ((d = e9 || {}).VALID = "Valid", d.SENDER_BLOCKED_RECIPIENT = "SenderBlockedRecipient", d.INVALID = "Invalid", d),
        e4 = ((m = e4 || {}).VALID = "Valid", m.EXPIRED = "Expired", m.INVITER_NOT_IN_EXPERIENCE = "InviterNotInExperience", m),
        e7 = ((p = e7 || {}).INVALID = "Invalid", p.VALID = "Valid", p.EXPIRED = "Expired", p),
        e6 = ((g = e6 || {}).INVALID = "Invalid", g.EXPIRED = "Expired", g.VALID = "Valid", g),
        te = ((f = te || {}).Zendesk = "zendesk", f),
        tt = ((h = tt || {}).INVALID = "Invalid", h.EXPIRED = "Expired", h.VALID = "Valid", h),
        tn = ((v = tn || {}).INVALID = "Invalid", v.VALID = "Valid", v),
        tr = ((I = tr || {}).INVALID = "Invalid", I.EXPIRED = "Expired", I.VALID = "Valid", I),
        ta = ((y = ta || {}).INVALID = "Invalid", y.VALID = "Valid", y),
        ti = ((b = ti || {})[b.INVALID = 0] = "INVALID", b[b.PROFILE = 1] = "PROFILE", b[b.HOME = 2] = "HOME", b);
    let tl = (e, t, n, r, a, i, l) => ({
            rootPlaceId: e,
            placeId: t,
            gameInstanceId: n,
            playerId: r,
            privateServerLinkCode: a,
            referredByPlayerId: i,
            joinData: l
        }),
        ts = (e, t) => {
            let [n, r] = e.split("?"), a = new URLSearchParams(r);
            return t && (t.launchData && "" !== t.launchData && a.append("launchData", t.launchData), t.experienceEventId && "" !== t.experienceEventId && a.append("eventId", t.experienceEventId)), `${n}?${a.toString()}`
        },
        to = async e => {
            let t;
            try {
                await Promise.race([e(), new Promise(e => {
                    t = setTimeout(e, 5e3)
                })])
            } catch {} finally {
                clearTimeout(t)
            }
        }, tu = /\/(\w+)/g, tc = /(\w+)=([^&=]+)/g, td = e => {
            let t = [],
                n = {},
                r = tu.exec(e);
            for (; null != r;) t.push(r[1]), r = tu.exec(e);
            let a = tc.exec(e);
            for (; null != a;) {
                let [, t, r] = a;
                n[t] = r, a = tc.exec(e)
            }
            return {
                path: t,
                params: n,
                url: e
            }
        };
    var tm = e.i(341332),
        tp = e.i(778579),
        tg = e.i(817396),
        tf = e.i(82927),
        th = e.i(126392);
    let tv = {
            subscribe: (e, t, n) => {
                let r, a = !0;
                return (0, k.getRealtimeClient)().then(i => {
                    if (a) {
                        if (null == i) return void n?.(Error("The realtime client did not load"));
                        i.Subscribe(e, t), r = () => {
                            i.Unsubscribe(e, t)
                        }
                    }
                }), () => {
                    a = !1, r?.()
                }
            },
            subscribeToConnectionEvents: (e, t, n, r) => (0, k.getRealtimeClient)().then(a => {
                if (null == a) return Promise.reject(Error("The realtime client did not load"));
                a.SubscribeToConnectionEvents(e, t, n, r)
            })
        },
        tI = {
            avatarHeadshot: "AvatarHeadShot",
            gameIcon: "GameIcon",
            groupIcon: "GroupIcon",
            assetThumbnail: "Asset",
            bundleThumbnail: "BundleThumbnail",
            gamePassIcon: "GamePass"
        },
        ty = ["names.combinedName", "names.username"],
        tb = {
            startAccessManagementUpsell: e => (0, eU.startAccessManagementUpsell)(e),
            AvatarHeadshot: e => {
                let {
                    userId: t,
                    className: n
                } = e;
                return (0, E.jsx)(L.Thumbnail2d, {
                    type: "AvatarHeadShot",
                    size: "48x48",
                    format: "webp",
                    targetId: t,
                    containerClassName: n,
                    includeProfileFrame: !0
                })
            },
            useUserNames: e => (0, eX.useUserProfiles)([e], ty).data[e]?.names ?? void 0
        },
        tA = (e, t) => x.postUntyped(N.Url.parse(e).getOrThrow(), t, {
            credentials: "include"
        }).getOrThrow().then(e => ({
            data: e
        })),
        tE = (e, t) => x.get(N.Url.parse(`${ey.default.gamesApi}${e}`).getOrThrow(), t, {
            credentials: "include"
        }),
        tC = e => {
            let t = (0, eM.getGameLauncher)();
            return null != t && (t.joinMultiplayerGame((0, e$.withJoinAttemptId)({
                placeId: e,
                isPlayTogetherGame: !1
            })), !0)
        },
        {
            navigateToDeepLink: tw
        } = (A = {
            getDeviceMeta: () => (0, tm.getDeviceMeta)(),
            get navigateToHybridFeature() {
                let e = window.Roblox?.Hybrid?.Navigation;
                return e ? t => {
                    e.navigateToFeature(t, () => !0)
                } : void 0
            },
            sendEvent: (e, t, n) => {
                (0, tp.sendEventWithTarget)(e, t, n)
            },
            fireCounter: e => {
                (0, eG.fireEvent)(e)
            },
            resolveShareLinks: (e, t) => tA(`${ey.default.shareLinksApi}/v1/resolve-link`, {
                linkId: e,
                linkType: t
            }),
            resolveShareLinksV2: e => tA(`${ey.default.shareLinksApiV2}/v2/resolve`, {
                linkId: e
            }),
            getPlaceIdFromUniverseId: e => tE(`/v1/games?universeIds[]=${e}`, P.object({
                data: P.array(P.object({
                    rootPlaceId: P.optional(P.number())
                }))
            })).andThen(t => {
                let {
                    data: n
                } = t, r = n[0]?.rootPlaceId;
                return r ? (0, F.ok)(r) : (0, F.err)(Error(`Root place ID not found for universe ID: ${e}`))
            }).getOrThrow(),
            getUniverseIdFromPlaceId: e => tE(`/v1/games/multiget-place-details?placeIds=${String((0,B.parseInt)(e))}`, P.array(P.object({
                universeId: P.optional(P.number())
            }))).andThen(t => {
                let n = t[0]?.universeId;
                return n ? (0, F.ok)(n) : (0, F.err)(Error(`Universe ID not found for place ID: ${e}`))
            }).getOrThrow(),
            launchGame: function() {
                let e;
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                let [a, i] = n, l = (0, eM.getGameLauncher)();
                if (null == l) return;
                let s = (0, j.generateRandomUuid)(),
                    o = i.gamePlayIntentEventCtx,
                    u = {
                        ...i.properties,
                        joinAttemptId: s
                    },
                    {
                        rootPlaceId: c,
                        placeId: d,
                        gameInstanceId: m,
                        playerId: p,
                        joinData: g,
                        privateServerLinkCode: f,
                        referredByPlayerId: h
                    } = a;
                if (null == d) return;
                let v = (e, t) => {
                    (0, tp.sendEventWithTarget)(i.eventName, i.ctx, {
                        ...u,
                        ...e
                    }), (0, tp.sendGamePlayEvent)(o, t, void 0, s)
                };
                return d === c && m ? (v({
                    gameInstanceId: m
                }, c), e = l.joinGameInstance((0, e$.withJoinAttemptId)({
                    placeId: d,
                    gameId: m,
                    isPlayTogetherGame: !0,
                    referredByPlayerId: h
                }, s, o))) : c && p ? (v({
                    playerId: p
                }, c), e = l.followPlayerIntoGame((0, e$.withJoinAttemptId)({
                    userId: p
                }, s, o))) : f ? (v({}, d), e = l.joinPrivateGame((0, e$.withJoinAttemptId)({
                    placeId: d,
                    accessCode: null,
                    linkCode: f
                }, s, o))) : (v({}, d), e = l.joinMultiplayerGame((0, e$.withJoinAttemptId)({
                    placeId: d,
                    launchData: g?.launchData,
                    eventId: g?.eventId,
                    isPlayTogetherGame: !1,
                    referredByPlayerId: h
                }, s, o))), e
            },
            joinMultiplayerGame: tC,
            startGameWithDeepLinkUrl: (e, t) => {
                let n = (0, eM.getGameLauncher)();
                return null != n && (n.startGameWithDeepLinkUrl(e, t), !0)
            },
            startDeepLinkFlow: e => {
                let t = (0, eM.getGameLauncher)();
                return null != t && (t.startDeepLinkFlow(e), !0)
            },
            openStudio: e => {
                let {
                    placeId: t,
                    universeId: n,
                    startTeamTest: r,
                    instanceId: a,
                    annotationId: i
                } = e, l = (0, eM.getGameLauncher)();
                return !!t && !!n && null != l && (l.editGameInStudio({
                    placeId: t,
                    universeId: n,
                    startTeamTest: r,
                    instanceId: a,
                    annotationId: i
                }), !0)
            },
            startAccessManagementUpsell: e => (0, eU.startAccessManagementUpsell)(e),
            startChat: e => {
                (0, tm.getDeviceMeta)().isInApp ? window.location.href = `roblox://navigation/chat?userId=${e}&entryPoint=AppShellWebView` : document.dispatchEvent(new CustomEvent("Roblox.Chat.StartChat", {
                    detail: {
                        userId: (0, B.parseInt)(e)
                    }
                })), (0, tp.sendEventWithTarget)("startChatByUser", "click", {
                    userId: e
                })
            },
            getQueryParam: e => (0, tf.getQueryParam)(e),
            getHelpDeskUrl: (e, t) => (0, tg.getHelpDeskUrl)(e, t)
        }, n = {
            [eZ.Navigation]: e => ((e, t) => {
                let n, {
                        path: r,
                        params: a
                    } = t,
                    i = r[1];
                if (eq[i])
                    for (let [e, t] of(n = eq[i], Object.entries(a))) n = n.replace(`{${e}}`, t);
                else if (i === eZ.ItemDetails.valueOf() && a.itemType && a.itemId) n = `${eH[a.itemType]}/${a.itemId}`;
                else if (i === eZ.GameDetails && a.gameId) return e.getPlaceIdFromUniverseId(a.gameId).then(e => !!e && (window.location.href = `${eY.Games}/${e}`, !0)).catch(() => !1);
                else if (i === eZ.Profile || i === eZ.ProfileCard) a.userId ? n = `${eY.Users}/${a.userId}${eY.Profile}` : a.groupId && (n = `${eY.Groups}/${a.groupId}`);
                else if (i === eZ.GiftCards) n = eY.GiftCards;
                else if (i === eZ.ShareLinks) {
                    if ("v2" === a.v && void 0 !== a.code) {
                        let n = a.code || "";
                        return e.resolveShareLinksV2(a.code).then(async r => {
                            if ("Referral" === r.data.linkType) {
                                let t = r.data.status,
                                    a = eJ(t, n, e3.REFERRAL);
                                e.sendEvent(a.type, a.context, a.params), "Valid" !== t && e.fireCounter("DeeplinkParserRobloxPlusReferralResolutionFailed");
                                let i = r.data.targetId ? `&referrerId=${r.data.targetId}` : "",
                                    l = "Valid" === t ? `referralCode=${n}${i}` : `referralStatus=${t}`;
                                return window.location.href = `${eY.Plus}?ctx=plus_referral&${l}`, !0
                            }
                            if ("Invalid" === r.data.status) return !1;
                            let i = eJ(r.data.status, n, e3.EXPERIENCE_V2);
                            if (e.sendEvent(i.type, i.context, i.params), "Experience" === r.data.linkType && r.data.targetId) {
                                let t = r.data.customData || "{}";
                                await to(() => e.launchGame(tl(r.data.targetId, r.data.targetId, void 0, void 0, void 0, void 0, {
                                    launchData: t
                                }), e0(r.data.targetId, n, r.data.status))), window.location.href = `${eY.Games}/${r.data.targetId}`
                            } else if (("StudioEdit" === r.data.linkType || "StudioTeamTest" === r.data.linkType) && r.data.targetId) return e.getUniverseIdFromPlaceId(r.data.targetId).then(t => {
                                let n = t.toString();
                                if (!n) return !1;
                                let i = "StudioTeamTest" === r.data.linkType,
                                    l = {};
                                return "StudioEdit" === r.data.linkType && (a.instanceId && (l.instanceId = a.instanceId), a.annotationId && (l.annotationId = a.annotationId)), !1 !== e.openStudio({
                                    placeId: r.data.targetId,
                                    universeId: n,
                                    startTeamTest: i,
                                    instanceId: l.instanceId,
                                    annotationId: l.annotationId
                                })
                            }).catch(() => !1);
                            else if (("UserTrustedConnection" === r.data.linkType || "StudioTrustedConnection" === r.data.linkType) && r.data.targetId) {
                                if (!(0, B.parseInt)(r.data.targetId)) return !1;
                                let a = "UserTrustedConnection" === r.data.linkType ? e3.USER_TRUSTED_CONNECTION : e3.STUDIO_TRUSTED_CONNECTION,
                                    i = eJ(r.data.status, n, a);
                                e.sendEvent(i.type, i.context, i.params), a === e3.USER_TRUSTED_CONNECTION && (window.location.href = t.url), window.location.href = `${eY.Users}/${r.data.targetId}${eY.Profile}?trustedFriendLinkCode=${n}`
                            } else if ("Moments" === r.data.linkType && r.data.targetId) {
                                let a = eJ(r.data.status, n, e3.MOMENTS);
                                e.sendEvent(a.type, a.context, a.params), window.location.href = t.url, window.location.href = "roblox://navigation/moments"
                            } else if ("SchoolInvite" === r.data.linkType) {
                                let a = eJ(r.data.status, n, e3.SCHOOL_INVITE);
                                if (e.sendEvent(a.type, a.context, a.params), "Valid" !== r.data.status) return e.fireCounter("DeeplinkParserSchoolInviteResolutionFailed"), !1;
                                e.startDeepLinkFlow(t.url) || (window.location.href = t.url)
                            }
                            return !0
                        }).catch(() => !1)
                    }
                    switch (a.type) {
                        case e8.EXPERIENCE_INVITE:
                            if (null != a.code) {
                                let {
                                    code: t
                                } = a;
                                return e.resolveShareLinks(a.code, e8.EXPERIENCE_INVITE).then(async n => {
                                    let r = n?.data?.experienceInviteData;
                                    if (r?.placeId == null) return !1;
                                    let i = eJ(r.status, t, e8.EXPERIENCE_INVITE);
                                    return (e.sendEvent(i.type, i.context, i.params), r.status === e2.VALID && r.instanceId) ? (await to(() => e.launchGame(tl(r.placeId, r.placeId, r.instanceId, void 0, void 0, r.inviterId), e0(r.placeId.toString(), t, r.status))), window.location.href = `${eY.Games}/${r.placeId}`, !0) : (r.status === e2.EXPIRED || r.status === e2.INVITER_NOT_IN_EXPERIENCE) && (window.localStorage.setItem("ref_info", (0, eW.stringToBase64)(eK.serialize({
                                        [r.placeId.toString()]: r.inviterId.toString()
                                    }).value)), window.location.href = `${eY.Games}/${r.placeId}?experienceInviteLinkId=${a.code}&experienceInviteStatus=${r.status}`, !0)
                                }).catch(() => (e.fireCounter("DeeplinkParserInviteResolutionFailed"), !1))
                            }
                            break;
                        case e8.NOTIFICATION_EXPERIENCE_INVITE:
                            if (a.code) return e.resolveShareLinks(a.code, e8.NOTIFICATION_EXPERIENCE_INVITE).then(t => {
                                let n = t?.data?.notificationExperienceInviteData;
                                if (n?.placeId) {
                                    let t = n.instanceId && n.status === e2.VALID,
                                        r = `${eY.ExperienceLauncher}placeId=${n.placeId}${n.launchData?`&launchData=${encodeURIComponent(encodeURIComponent(n.launchData))}`:""}${t?`&gameInstanceId=${n.instanceId}`:""}${n.inviterId?`&referredByPlayerId=${n.inviterId}`:""}`;
                                    return !1 !== e.startGameWithDeepLinkUrl(r, n.placeId)
                                }
                                return !1
                            }).catch(() => (e.fireCounter("DeeplinkParserNotificationInviteResolutionFailed"), !1));
                            break;
                        case e8.FRIEND_INVITE:
                            if (a.code) {
                                let {
                                    code: t
                                } = a;
                                return e.resolveShareLinks(a.code, e8.FRIEND_INVITE).then(n => {
                                    let r = n?.data?.friendInviteData;
                                    if (r?.senderUserId == null) return !1;
                                    let a = eJ(r.status, t, e8.FRIEND_INVITE);
                                    return e.sendEvent(a.type, a.context, a.params), (r.status === e5.VALID || r.status === e5.CONSUMED || r.status === e5.EXPIRED) && (window.location.href = `${eY.Users}/${r.senderUserId}${eY.Profile}`, !0)
                                }).catch(() => (e.fireCounter("DeeplinkParserFriendRequestResolutionFailed"), !1))
                            }
                            break;
                        case e8.PROFILE:
                            if (a.code) {
                                let {
                                    code: t
                                } = a;
                                return e.resolveShareLinks(a.code, e8.PROFILE).then(n => {
                                    let r = n?.data?.profileLinkResolutionResponseData;
                                    if (r?.userId == null) return !1;
                                    let a = eJ(r.status, t, e8.PROFILE);
                                    if (e.sendEvent(a.type, a.context, a.params), r.status === e9.VALID) {
                                        let t = (e => {
                                            switch (e?.toLowerCase()) {
                                                case e1.PROFILE_SHARE.toLowerCase():
                                                    return e1.PROFILE_SHARE;
                                                case e1.QR_CODE.toLowerCase():
                                                default:
                                                    return e1.QR_CODE
                                            }
                                        })(e.getQueryParam("source"));
                                        return window.location.href = `${eY.Users}/${r.userId}${eY.Profile}?friendshipSourceType=${t}`, !0
                                    }
                                    return !1
                                }).catch(() => (e.fireCounter("DeeplinkParserProfileShareResolutionFailed"), !1))
                            }
                            break;
                        case e8.SCREENSHOT_INVITE:
                            if (a.code) {
                                let {
                                    code: t
                                } = a;
                                return e.resolveShareLinks(a.code, e8.SCREENSHOT_INVITE).then(n => {
                                    let r = n?.data?.screenshotInviteData;
                                    if (r?.placeId == null || ![e4.EXPIRED, e4.INVITER_NOT_IN_EXPERIENCE, e4.VALID].includes(r.status)) return !1;
                                    let i = eJ(r.status, t, e8.SCREENSHOT_INVITE);
                                    if (e.sendEvent(i.type, i.context, i.params), r.status === e4.EXPIRED || r.status === e4.INVITER_NOT_IN_EXPERIENCE) return window.location.href = `${eY.Games}/${r.placeId}?experienceInviteLinkId=${a.code}&experienceInviteStatus=${r.status}`, !0;
                                    let l = `${eY.ExperienceLauncher}placeId=${r.placeId}`;
                                    return r.launchData && (l += `&launchData=${encodeURIComponent(encodeURIComponent(r.launchData))}`), r.instanceId && (l += `&gameInstanceId=${r.instanceId}`), !1 !== e.startGameWithDeepLinkUrl(l, r.placeId)
                                }).catch(() => (e.fireCounter("DeeplinkParserScreenshotInviteShareResolutionFailed"), !1))
                            }
                            break;
                        case e8.SERVER:
                            if (a.code) {
                                let {
                                    code: t
                                } = a;
                                return e.resolveShareLinks(a.code, e8.SERVER).then(n => {
                                    let r = n?.data?.privateServerInviteData;
                                    return r?.universeId != null && !![e7.VALID, e7.EXPIRED].includes(r.status) && (e.getPlaceIdFromUniverseId(r.universeId.toString()).then(n => {
                                        if (!n) return !1;
                                        let a = eJ(r.status, t, e8.SERVER);
                                        return e.sendEvent(a.type, a.context, a.params), window.location.href = `${eY.Games}/${n}?privateServerLinkCode=${r.linkCode}`, !0
                                    }).catch(() => !1), !0)
                                }).catch(() => (e.fireCounter("DeeplinkParserPrivateServerLinkResolutionFailed"), !1))
                            }
                            break;
                        case e8.EXPERIENCE_AFFILIATE: {
                            if (!a.code) break;
                            let {
                                code: t
                            } = a;
                            return e.resolveShareLinks(a.code, e8.EXPERIENCE_AFFILIATE).then(n => {
                                let r = n?.data?.experienceAffiliateData;
                                if (r?.status !== tn.VALID) return !1;
                                if (r?.universeId == null) {
                                    let n = eJ(r.status, t, e8.EXPERIENCE_AFFILIATE);
                                    if (e.sendEvent(n.type, n.context, n.params), r.fallbackType === ti.PROFILE && r.fallbackId) window.location.href = `${eY.Users}/${r.fallbackId}${eY.Profile}`;
                                    else {
                                        let e = `${window.location.protocol}/${window.location.hostname}${window.location.pathname}?type=${e8.EXPERIENCE_AFFILIATE}&code=${a.code}`;
                                        window.location.href = `/?referralUrl=${encodeURIComponent(e)}`
                                    }
                                    return !0
                                }
                                return e.getPlaceIdFromUniverseId(r.universeId.toString()).then(n => {
                                    if (!n) return !1;
                                    let i = eJ(r.status, t, e8.EXPERIENCE_AFFILIATE);
                                    e.sendEvent(i.type, i.context, i.params);
                                    let l = `${window.location.protocol}//${window.location.hostname}${window.location.pathname}?type=${e8.EXPERIENCE_AFFILIATE}&code=${a.code}`,
                                        s = `${eY.Games}/${n}?shareLinkSourceType=${e8.EXPERIENCE_AFFILIATE}&referralUrl=${encodeURIComponent(l)}`;
                                    return s = ts(s, r.joinData), window.location.href = s, !0
                                }).catch(() => !1)
                            }).catch(() => (e.fireCounter(ez), !1))
                        }
                        case e8.EXPERIENCE_DETAILS: {
                            if (!a.code) break;
                            let {
                                code: t
                            } = a;
                            return e.resolveShareLinks(a.code, e8.EXPERIENCE_DETAILS).then(n => {
                                let r = n?.data?.experienceDetailsInviteData;
                                return r?.universeId != null && r.status === e6.VALID && e.getPlaceIdFromUniverseId(r.universeId.toString()).then(n => {
                                    if (!n) return !1;
                                    let a = eJ(r.status, t, e8.EXPERIENCE_DETAILS);
                                    return e.sendEvent(a.type, a.context, a.params), window.location.href = `${eY.Games}/${n}?shareLinkSourceType=${e8.EXPERIENCE_DETAILS}`, !0
                                }).catch(() => !1)
                            }).catch(() => (e.fireCounter(ez), !1))
                        }
                        case e8.AVATAR_ITEM_DETAILS:
                        case e8.AVATAR_ITEM_AFFILIATE: {
                            if (!a.code) break;
                            let {
                                code: t
                            } = a, n = a.type === e8.AVATAR_ITEM_AFFILIATE ? e8.AVATAR_ITEM_AFFILIATE : e8.AVATAR_ITEM_DETAILS;
                            return e.resolveShareLinks(a.code, n).then(r => {
                                let i = r?.data?.avatarItemDetailsData;
                                if (i?.itemId == null || "" === i.itemId || "0" === i.itemId || !(i.itemType in eY) || i.status !== tt.VALID) return !1;
                                let l = i.itemType,
                                    s = eJ(i.status, t, n);
                                return e.sendEvent(s.type, s.context, s.params), window.location.href = `${eY[l]}/${i.itemId}?pid=share&is_retargeting=false&deep_link_value=${a.code}`, !0
                            }).catch(() => (e.fireCounter(n === e8.AVATAR_ITEM_AFFILIATE ? "DeeplinkParserAvatarItemAffiliateResolutionFailed" : "DeeplinkParserAvatarItemDetailsResolutionFailed"), !1))
                        }
                        case e8.CONTENT_POST: {
                            if (!a.code) break;
                            let {
                                code: t
                            } = a;
                            return e.resolveShareLinks(a.code, e8.CONTENT_POST).then(n => {
                                let r = n?.data?.contentPostData;
                                if (!r || r.status !== tr.VALID) return !1;
                                let a = eJ(r.status, t, e8.CONTENT_POST);
                                return e.sendEvent(a.type, a.context, a.params), window.location.href = `${eY.AppLauncher}${eY.ContentPost}?userId=${r.postCreatorId}&postId=${r.postId}`, window.location.href = `${eY.Users}/${r.postCreatorId}${eY.Profile}`, !0
                            }).catch(() => (e.fireCounter("DeeplinkParserContentPostResolutionFailed"), !1))
                        }
                        case e8.EXPERIENCE_EVENT: {
                            if (!a.code) break;
                            let {
                                code: t
                            } = a;
                            return e.resolveShareLinks(a.code, e8.EXPERIENCE_EVENT).then(n => {
                                let r = n?.data?.experienceEventData;
                                if (r?.universeId == null || !r.placeId || r.status !== ta.VALID) return !1;
                                let a = eJ(r.status, t, e8.EXPERIENCE_EVENT);
                                e.sendEvent(a.type, a.context, a.params);
                                let i = `${eY.ExperienceLauncher}placeId=${r.placeId}`;
                                return i = ts(i, r.joinData), !1 !== e.startGameWithDeepLinkUrl(i, r.placeId)
                            }).catch(() => (e.fireCounter("DeeplinkParserExperienceEventResolutionFailed"), !1))
                        }
                    }
                } else if (i === eZ.Chat && a.userId) return e.startChat(a.userId), Promise.resolve(!0);
                else if (i === eZ.ExternalWebUrl) {
                    let t;
                    if (a.domain === te.Zendesk) {
                        let {
                            articleId: n,
                            locale: r
                        } = a;
                        (t = e.getHelpDeskUrl(r, n)) && window.open(t, "_blank")
                    }
                    return Promise.resolve(!!t)
                } else if (i === eZ.Avatar) n = Object.keys(a).length ? t.url : eY.Avatar;
                else if (i === eZ.Group) a.groupId && (n = a.forumCategoryId && a.forumPostId && a.forumCommentId ? `${eY.Groups}/${a.groupId}#!/forums/category-${a.forumCategoryId}/post/post-${a.forumPostId}/comment/${a.forumCommentId}` : `${eY.Groups}/${a.groupId}`);
                else if (i === eZ.SupportCenter) n = a.universeId && a.ticketId ? `${eY.SupportCenter}#!/tickets/${a.universeId}/${a.ticketId}` : eY.SupportCenter;
                else if (i === eZ.SecurityAlert) n = a.payload && a.username ? `${eY.SecurityAlert}?payload=${a.payload}&username=${a.username}` : `${eY.SecurityAlert}?payload=null&username=`;
                else if (i === eZ.Fae) {
                    let t = e.startAccessManagementUpsell({
                        featureName: "TriggerAgeVerifyRecourse",
                        namespace: "social/Upsells"
                    });
                    return t ? t.then(() => !0).catch(() => !1) : Promise.resolve(!1)
                } else if (i === eZ.CurrencyTransfer) {
                    let r = a.transferrequestid ?? a.transferRequestId ?? a.transferrequestId,
                        i = (a.direction ?? a.Direction)?.toLowerCase(),
                        l = a.userid ?? a.userId,
                        s = a.transferorigination ?? a.transferOrigination;
                    if (r || "send" === i && l && s) {
                        let r = e.getDeviceMeta();
                        if (r?.isDesktop && e.startDeepLinkFlow(t.url)) return Promise.resolve(!0);
                        n = t.url
                    }
                } else if (i === eZ.AcceptGift) {
                    if (a.giftId) {
                        let r = e.getDeviceMeta();
                        if (r?.isDesktop && e.startDeepLinkFlow(t.url)) return Promise.resolve(!0);
                        n = t.url
                    }
                } else if (i === eZ.Moments) {
                    let r = e.getDeviceMeta();
                    if (r?.isDesktop && e.startDeepLinkFlow(t.url)) return Promise.resolve(!0);
                    n = t.url
                } else if (i === eZ.AmpWizard) n = t.url;
                else if (i === eZ.PlusUpsell) n = t.url;
                else if (i === eZ.PlusReferralDashboard) n = t.url;
                else if (i === eZ.PlusSubscribe) {
                    let e = eQ.UrlSearchParams.new([..."PlusReferralLandingSheet" === a.surface ? [
                        ["ctx", "plus_referral"]
                    ] : [], ...a.referrer_id ? [
                        ["referrerId", a.referrer_id]
                    ] : []]).toString();
                    n = e ? `${eY.Plus}?${e}` : eY.Plus
                }
                return n ? window.location.href = n : e.fireCounter("DeeplinkParserNavigationFailed"), Promise.resolve(!!n)
            })(A, e),
            [eZ.PlaceId]: e => ((e, t) => {
                let {
                    params: n
                } = t;
                if (!n.placeId) return Promise.resolve(!1);
                if (n.linkCode) return window.location.href = `${eY.Games}/${n.placeId}?privateServerLinkCode=${n.linkCode}`, Promise.resolve(!0);
                if (n.accessCode) return window.location.href = `${eY.GameStart}?placeId=${n.placeId}&accessCode=${n.accessCode}`, Promise.resolve(!0);
                if (n.launchData) {
                    let t = `${eY.ExperienceLauncher}placeId=${n.placeId}${n.launchData?`&launchData=${n.launchData}`:""}`,
                        r = Number(n.placeId);
                    return Promise.resolve(!1 !== e.startGameWithDeepLinkUrl(t, r))
                }
                return Promise.resolve(!1 !== e.joinMultiplayerGame((0, B.parseFloat)(n.placeId) ?? NaN))
            })(A, e),
            [eZ.UserId]: e => {
                let {
                    userId: t
                } = e.params;
                return t && (window.location.href = `/games/start?userId=${t}`), Promise.resolve(!!t)
            },
            [eZ.Group]: e => {
                let {
                    groupId: t
                } = e.params;
                return t && (window.location.href = `/groups/${t}`), Promise.resolve(!!t)
            }
        }, {
            navigateToDeepLink: e => {
                if (A.getDeviceMeta()?.isIosApp && A.navigateToHybridFeature) return A.navigateToHybridFeature({
                    feature: "DeepLink",
                    deepLinkUrlPath: e
                }), Promise.resolve(!0);
                if (A.getDeviceMeta()?.isInApp) return window.location.href = e, Promise.resolve(!0);
                let t = td(e),
                    r = n[t.path[0]];
                return r ? r(t) : Promise.resolve(!1)
            }
        }),
        tT = e => x.getUntyped((0, R.getPageBaseUrls)().apiGateway.withPath(`/guac-v2/v1/bundles/${e}`), {
            credentials: "include"
        }).getOrThrow(),
        tS = {
            Thumbnail: e => {
                let {
                    type: t,
                    targetId: n,
                    containerClass: r,
                    includeProfileFrame: a
                } = e;
                return (0, E.jsx)(L.Thumbnail2d, {
                    type: tI[t],
                    size: "150x150",
                    format: "webp",
                    targetId: n,
                    containerClassName: r,
                    includeProfileFrame: a
                })
            },
            getLocale: () => (0, D.getLocale)(),
            formatFullDate: e => {
                let t = (0, D.getLocale)(),
                    n = new Intl.DateTimeFormat(t, {
                        year: "numeric",
                        month: "short",
                        day: "numeric"
                    }),
                    r = new Intl.DateTimeFormat(t, {
                        hour: "numeric",
                        minute: "numeric"
                    });
                return `${n.format(e)} | ${r.format(e)}`
            },
            get joinMultiplayerGame() {
                return null == (0, eM.getGameLauncher)() ? null : tC
            },
            parseDeepLink: e => td(e),
            navigateToDeepLink: e => tw(e),
            getReportAbuseConfig: () => tT("report-abuse-ui"),
            callGuacBehaviour: tT,
            getDeviceMeta: () => (0, tm.getDeviceMeta)(),
            getCurrentUserId: () => String((0, th.getCurrentUser)()?.id ?? null ?? ""),
            hashStringWithSha256: e => (0, eV.hashStringWithSha256)(e),
            TrustedFriendsModal: e => {
                let {
                    userId: t,
                    linkTokens: n,
                    onClose: r
                } = e;
                return (0, E.jsx)(ev.Provider, {
                    value: tb,
                    children: (0, E.jsx)(eO, {
                        open: !0,
                        userId: t,
                        linkTokens: n,
                        onClose: r
                    })
                })
            },
            TranslationBoundary: e => {
                let {
                    children: t
                } = e;
                return t
            },
            LegacyNotificationTemplate: null
        };
    var tP = e.i(981498),
        tx = e.i(423517),
        t_ = e.i(257771),
        tN = e.i(270784),
        tL = e.i(889375);
    let tR = "Website.Navigation",
        tD = P.looseObject({
            layers: P.record(P.string(), P.looseObject({
                experimentName: P.optional(P.string())
            }))
        }),
        tk = !1,
        tF = async () => {
            if (!tk) {
                tk = !0;
                try {
                    let e = await x.post((0, R.getPageBaseUrls)().apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                        layers: {
                            [tR]: {}
                        }
                    }, tD, {
                        credentials: "include"
                    }).getOrThrow();
                    if (!e.layers[tR]?.experimentName) return;
                    let t = (0, th.getCurrentUser)()?.id;
                    (0, tL.sendEvent)(tx.EXPOSED_EVENT_NAME, tx.EXPERIMENTATION_TARGET_NAME, (0, t_.buildLayerExposureEvent)(e, tR, null == t ? 0 : (0, th.userIdToNumber)(t), (0, tN.getBrowserTrackerId)() || "0"))
                } catch {
                    tk = !1
                }
            }
        }, tB = "Website.DownloadFunnel", tj = P.looseObject({
            layers: P.record(P.string(), P.looseObject({
                experimentName: P.optional(P.string())
            }))
        }), tO = !1, tU = async () => {
            if (tO) return;
            tO = !0;
            let e = await x.post((0, R.getPageBaseUrls)().apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                layers: {
                    [tB]: {}
                }
            }, tj, {
                credentials: "include"
            });
            if (e.isErr()) {
                tO = !1;
                return
            }
            if (!e.value.layers[tB]?.experimentName) return;
            let t = (0, th.getCurrentUser)()?.id;
            (0, tL.sendEvent)(tx.EXPOSED_EVENT_NAME, tx.EXPERIMENTATION_TARGET_NAME, (0, t_.buildLayerExposureEvent)(e.value, tB, null == t ? 0 : (0, th.userIdToNumber)(t), (0, tN.getBrowserTrackerId)() || "0"))
        }, tV = "Website.TopSearchResultsPage.Exposure", tG = P.looseObject({
            layers: P.record(P.string(), P.looseObject({
                parameters: P.nullish(P.record(P.string(), P.unknown()))
            }))
        }), tM = !1, t$ = async () => {
            if (tM) return;
            tM = !0;
            let e = await x.post((0, R.getPageBaseUrls)().apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                layers: {
                    [tV]: {}
                }
            }, tG, {
                credentials: "include"
            });
            if (e.isErr()) {
                tM = !1;
                return
            }
            let t = e.value.layers[tV]?.parameters;
            if (null == t || !("shouldShowTopResults" in t)) return;
            let n = (0, th.getCurrentUser)()?.id;
            (0, tL.sendEvent)(tx.EXPOSED_EVENT_NAME, tx.EXPERIMENTATION_TARGET_NAME, (0, t_.buildLayerExposureEvent)(e.value, tV, null == n ? 0 : (0, th.userIdToNumber)(n), (0, tN.getBrowserTrackerId)() || "0"))
        }, tX = P.object({
            plusIdentityBadgeEnabled: P.optional(P.boolean())
        }), tK = {
            queryKey: ["guac/web-plus-identity-badge"],
            queryFn: () => x.get((0, R.getPageBaseUrls)().apiGateway.withPath("/guac-v2/v1/bundles/web-plus-identity-badge"), tX, {
                credentials: "include"
            }).getOrThrow(),
            select: e => {
                let {
                    plusIdentityBadgeEnabled: t
                } = e;
                return !0 === t
            },
            staleTime: 1 / 0
        };
    var tW = e.i(115718);
    let tQ = (0, C.default)(() => e.A(957562).then(e => ((0, tP.trackAppShellCounter)("NavLoad", {
            outcome: "loaded"
        }), e), e => {
            throw (0, tP.trackAppShellCounter)("NavLoad", {
                outcome: "failed"
            }), e
        }), {
            loadableGenerated: {
                modules: [379068]
            },
            loading: () => (0, E.jsx)("div", {
                className: "nav-header-offset",
                "aria-hidden": "true"
            })
        }),
        tZ = P.object({
            isVNGComplianceEnabled: P.optional(P.boolean())
        }),
        tH = () => x.get((0, R.getPageBaseUrls)().apiGateway.withPath("/guac-v2/v1/bundles/intl-auth-compliance"), tZ, {
            credentials: "include"
        }).getOrThrow(),
        tq = P.object({
            notificationsCanAccessStream: P.optional(P.boolean())
        }),
        tY = () => x.get((0, R.getPageBaseUrls)().apiGateway.withPath("/guac-v2/v1/bundles/navigation-header-ui"), tq, {
            credentials: "include"
        }).map(e => {
            let {
                notificationsCanAccessStream: t
            } = e;
            return {
                shouldShowVng: !1,
                notificationsCanAccessStream: t ?? !1
            }
        }).getOrThrow(),
        tJ = P.object({
            count: P.number()
        }),
        tz = (e, t) => x.get(N.Url.parse(`https://${e}.${(0,R.getPageBaseUrls)().rootDomain}`).getOrThrow().withPath(t), tJ, {
            credentials: "include"
        }).map(e => {
            let {
                count: t
            } = e;
            return t
        }).getOrThrow(),
        t0 = () => tz("friends", "/v1/user/friend-requests/count"),
        t1 = () => tz("privatemessages", "/v1/messages/unread/count"),
        t8 = () => tz("trades", "/v1/trades/inbound/count"),
        t3 = e => x.get(N.Url.parse(`https://economy.${(0,R.getPageBaseUrls)().rootDomain}`).getOrThrow().withPath(`/v1/users/${String(e)}/currency`), P.object({
            robux: P.number()
        }), {
            credentials: "include"
        }).getOrThrow(),
        t2 = ["control", "hideCreditAndRobux", "showCreditAndRobux"],
        t5 = P.object({
            creditDisplayConfig: P.nullable(P.string()),
            creditBalance: P.nullable(P.number()),
            currencyCode: P.nullable(P.string())
        }),
        t9 = () => x.get((0, R.getPageBaseUrls)().apiGateway.withPath("/credit-balance/v1/get-credit-balance-for-navigation"), t5, {
            credentials: "include"
        }).map(e => {
            let {
                creditDisplayConfig: t,
                ...n
            } = e;
            return {
                ...n,
                creditDisplayConfig: t2.find(e => e === t) ?? null
            }
        }).getOrThrow(),
        t4 = () => x.get((0, R.getPageBaseUrls)().apiGateway.withPath("/robuxbadge/v1/robuxbadge"), P.object({
            is_virtual_item_available: P.boolean(),
            active_virtual_item_start_time_seconds_utc: P.number()
        }), {
            credentials: "include"
        }).getOrThrow(),
        t7 = () => x.postUntyped((0, R.getPageBaseUrls)().authApi.withPath("/v2/logout"), {}, {
            credentials: "include"
        }).map(() => void 0).getOrThrow(),
        t6 = "Accounts.AccountSwitcher",
        ne = "Website.LogoutUpsell",
        nt = P.object({
            layers: P.object({
                [t6]: P.object({
                    parameters: P.object({
                        isAccountSwitcherEnabled: P.optional(P.unknown())
                    })
                })
            })
        }),
        nn = P.object({
            layers: P.object({
                [ne]: P.object({
                    parameters: P.object({
                        IsPromptsServiceEnabled: P.optional(P.unknown())
                    })
                })
            })
        }),
        nr = () => t ??= x.post((0, R.getPageBaseUrls)().apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
            layers: {
                [t6]: {}
            }
        }, nt, {
            credentials: "include"
        }).map(e => {
            let {
                layers: t
            } = e;
            return !0 === t[t6].parameters.isAccountSwitcherEnabled
        }).getOrDefault(!1),
        na = () => x.post((0, R.getPageBaseUrls)().apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
            layers: {
                [ne]: {}
            }
        }, nn, {
            credentials: "include"
        }).map(e => {
            let {
                layers: t
            } = e;
            return !0 === t[ne].parameters.IsPromptsServiceEnabled
        }).getOrDefault(!1),
        ni = P.object({
            IsEmailUpsellAtLogoutEnabled: P.optional(P.boolean())
        }),
        nl = P.object({
            emailAddress: P.optional(P.nullable(P.string()))
        }),
        ns = async () => {
            let e = await x.get((0, R.getPageBaseUrls)().authApi.withPath("/v2/metadata"), ni, {
                credentials: "include"
            }).getOrNull();
            if (e?.IsEmailUpsellAtLogoutEnabled !== !0) return !1;
            let t = await x.get(N.Url.parse(`https://accountsettings.${(0,R.getPageBaseUrls)().rootDomain}`).getOrThrow().withPath("/v1/email"), nl, {
                credentials: "include"
            }).getOrNull();
            return null != t && !t.emailAddress
        }, no = e => N.Url.parse(`https://notifications.${(0,R.getPageBaseUrls)().rootDomain}`).getOrThrow().withPath(e), nu = () => x.get(no("/v2/stream-notifications/unread-count"), P.object({
            unreadNotifications: P.number()
        }), {
            credentials: "include"
        }).map(e => {
            let {
                unreadNotifications: t
            } = e;
            return t
        }).getOrThrow(), nc = () => x.postUntyped(no("/v2/stream-notifications/clear-unread"), {}, {
            credentials: "include"
        }).map(() => void 0).getOrThrow(), nd = (e, t) => {
            let n, r = !0,
                a = () => {
                    t()
                };
            return (0, k.getRealtimeClient)().then(t => {
                r && null != t && (t.Subscribe(e, a), n = () => {
                    t.Unsubscribe(e, a)
                })
            }), () => {
                r = !1, n?.()
            }
        }, nm = P.object({
            displayName: P.string(),
            hasVerifiedBadge: P.boolean()
        }), np = e => (0, S.useQuery)({
            queryKey: ["navigation-user", e],
            queryFn: () => x.get(N.Url.parse(`https://users.${(0,R.getPageBaseUrls)().rootDomain}`).getOrThrow().withPath(`/v1/users/${String(e)}`), nm, {
                credentials: "include"
            }).getOrThrow(),
            enabled: null != e,
            staleTime: 1 / 0
        }).data, ng = e => np(e.id)?.displayName ?? e.displayName ?? "", nf = e => np(e.id)?.hasVerifiedBadge ?? e.hasVerifiedBadge, nh = P.object({
            access: P.string()
        }), nv = P.object({
            eligibility: P.union([P.string(), P.number()])
        }), nI = new Map([
            ["Invalid", "Invalid"],
            ["Eligible", "Eligible"],
            ["Ineligible", "Ineligible"],
            [0, "Invalid"],
            [1, "Eligible"],
            [2, "Ineligible"]
        ]), ny = P.object({
            referrals: P.array(P.object({
                senderUserId: P.union([P.number(), P.string()])
            }))
        }), nb = P.object({
            prefix: P.string(),
            algorithmName: P.string(),
            entries: P.array(P.object({
                type: P.union([P.literal(0), P.literal(1), P.literal(2)]),
                score: P.number(),
                universeId: P.number(),
                canonicalTitle: P.nullable(P.string()),
                thumbnailUrl: P.nullable(P.string()),
                searchQuery: P.string(),
                trendingSearchStartDateTime: P.nullable(P.string())
            }))
        }), nA = P.object({
            Args: P.object({
                Prefix: P.string(),
                Limit: P.number(),
                Algo: P.nullable(P.string())
            }),
            Data: P.array(P.object({
                Query: P.string(),
                Score: P.number()
            }))
        }), nE = new AbortController, nC = () => (nE.abort(), (nE = new AbortController).signal), nw = e => x.get((0, R.getPageBaseUrls)().apiGateway.withPath(`/games-autocomplete/v1/get-suggestion/${encodeURIComponent(e.toLowerCase())}`), nb, {
            credentials: "include",
            signal: nC()
        }).getOrThrow(), nT = (e, t, n, r, a) => {
            var i;
            let l, s;
            return x.get((a ? (0, R.getPageBaseUrls)().apiGateway : (0, R.getPageBaseUrls)().apiGatewayCdn).withPath("/autocomplete-avatar/v2/suggest").withSearchParams({
                prefix: e.toLowerCase(),
                limit: String(n),
                lang: t,
                q: r
            }), nA, {
                credentials: "include",
                signal: (i = nC(), l = new AbortController, s = setTimeout(() => {
                    l.abort(new DOMException("The request timed out.", "TimeoutError"))
                }, 5e3), i.addEventListener("abort", () => {
                    clearTimeout(s), l.abort(i.reason)
                }, {
                    once: !0
                }), l.signal)
            }).getOrThrow()
        }, nS = e => e instanceof _.AbortError && "Abort" === e.cause.code, nP = e => {
            let {
                universeId: t,
                onLoad: n
            } = e;
            return (0, E.jsx)(L.Thumbnail2d, {
                targetId: t,
                type: "GameIcon",
                size: "150x150",
                format: "jpeg",
                containerClassName: "thumbnail-icon",
                onLoad: n
            })
        }, nx = e => {
            let {
                userId: t,
                altName: n,
                containerClass: r
            } = e;
            return (0, E.jsx)(L.Thumbnail2d, {
                targetId: t,
                type: "AvatarHeadShot",
                altName: n,
                containerClassName: r,
                includeProfileFrame: !0
            })
        }, n_ = () => {
            let {
                data: e = !1
            } = (0, S.useQuery)(tK);
            return e
        };
    e.s(["default", 0, function(e) {
        let {
            user: t,
            location: n,
            isPlusMember: r,
            ageBadgeControl: a,
            showUncheckedBadge: i,
            pageName: l,
            isReferralRolloutEnabled: s,
            isTopNavDownloadEnabled: o,
            isTopSearchResultsEnabled: u,
            serverHints: c
        } = e;
        return (0, E.jsx)(tQ, {
            user: t,
            location: n,
            serverHints: c,
            ageBadgeControl: a,
            showUncheckedBadge: i,
            getIntAuthCompliancePolicy: tH,
            getNavigationHeaderBehavior: tY,
            getFriendRequestCount: t0,
            getMessageUnreadCount: t1,
            logLeftNavExposure: tF,
            logTopNavDownloadExposure: tU,
            getTradeInboundCount: t8,
            getUserCurrency: t3,
            getCreditBalanceForNavigation: t9,
            getRobuxBadge: t4,
            isTopNavDownloadEnabled: () => o,
            getIsTopSearchResultsEnabled: () => u,
            logTopSearchResultsExposure: t$,
            logout: t7,
            getAccountSwitcherEnabled: nr,
            getLogoutPromptsServiceEnabled: na,
            shouldShowLegacyEmailUpsell: ns,
            getNotificationUnreadCount: nu,
            clearNotificationUnread: nc,
            subscribeRealTime: nd,
            AvatarHeadshot: nx,
            useLiveUserNameForDisplay: ng,
            useHasVerifiedBadge: nf,
            useStreamedValue: w.use,
            useIsPlusBadgeEnabled: n_,
            isReferralRolloutEnabled: s,
            usePlusStatus: e => ((e, t, n, r) => {
                let a = e && !t,
                    {
                        data: i,
                        isPending: l
                    } = (0, S.useQuery)({
                        queryKey: ["plus-referrals", "viewer-subscription"],
                        enabled: a,
                        queryFn: () => x.get((0, R.getPageBaseUrls)().apiGateway.withPath("/access-management/v1/upsell-feature-access").withSearchParams({
                            featureName: "IsRobloxPlusSubscribed",
                            namespace: "subscriptions/PlusSubscription"
                        }), nh, {
                            credentials: "include"
                        }).map(e => {
                            let {
                                access: t
                            } = e;
                            return "Granted" === t
                        }).getOrThrow(),
                        staleTime: 1 / 0
                    }),
                    s = t || !0 === i,
                    o = a && l,
                    {
                        data: u
                    } = (0, S.useQuery)({
                        queryKey: ["plus-referrals", "sender-eligibility"],
                        enabled: n && s,
                        queryFn: async () => {
                            let e = await r;
                            return null != e ? nI.get(e) : x.get((0, R.getPageBaseUrls)().apiGateway.withPath("/subscriptions/v2/referral-eligibility"), nv, {
                                credentials: "include"
                            }).map(e => {
                                let {
                                    eligibility: t
                                } = e;
                                return nI.get(t)
                            }).getOrThrow()
                        },
                        staleTime: 1 / 0
                    }),
                    {
                        data: c
                    } = (0, S.useQuery)({
                        queryKey: ["plus-referrals", "pending-referrer"],
                        enabled: n && e && !o && !s,
                        queryFn: () => x.get((0, R.getPageBaseUrls)().apiGateway.withPath("/subscriptions/v2/referrals").withSearchParams({
                            Status: "1",
                            PageSize: "5"
                        }), ny, {
                            credentials: "include"
                        }).map(e => {
                            let {
                                referrals: t
                            } = e, n = t.at(0);
                            return void 0 === n ? null : String(n.senderUserId)
                        }).getOrNull(),
                        staleTime: 1 / 0
                    });
                return {
                    isPlusSubscriber: s,
                    isPlusStatusLoading: o,
                    senderEligibility: u,
                    pendingReferrerId: c ?? void 0
                }
            })(null != t, r, e, c.plusReferralEligibilityStream),
            getGamesAutocompleteSuggestions: nw,
            getAvatarAutocompleteSuggestions: nT,
            isSearchRequestCancelled: nS,
            getInternalPageName: () => l,
            getLocale: D.getLocale,
            GameIconThumbnail: nP,
            notificationStreamTransport: tv,
            notificationStreamHost: tS,
            captureNotificationStreamError: (e, t) => {
                (0, T.captureException)(e, t)
            },
            searchLanding: tW.searchLandingCapability
        })
    }], 776771)
}, 767970, e => {
    "use strict";
    var t = e.i(371847),
        n = e.i(360702),
        r = e.i(883355),
        a = e.i(418568);
    let i = n.AsyncResult.fn(async e => {
        if (!0 !== navigator.globalPrivacyControl) return (0, n.ok)(null);
        let {
            gpcVersion: t,
            cooldownPeriodInMs: i,
            cooldownPeriodFuzzyInMs: l
        } = await (0, a.getGlobalPrivacyControlPolicy)().getOrDefault({
            gpcVersion: 0,
            cooldownPeriodInMs: 864e5,
            cooldownPeriodFuzzyInMs: 864e5
        }), s = r.getItem("globalPrivacyControl");
        if (s?.version === 0)
            if (s.data.gpcVersion === t) {
                let t = s.data.nextSync[e];
                if (null != t && Date.now() < t) return (0, n.ok)(null)
            } else s.data.nextSync = {};
        return (0, a.postGlobalPrivacyControl)().andThen(() => {
            if (null != s && 0 !== s.version) return (0, n.err)(new r.LocalStorageWriteError({
                code: "PageRefreshNeeded"
            }));
            let a = Date.now(),
                o = s?.data.nextSync ?? {};
            o[e] = a + i + Math.floor(Math.random() * l);
            let u = Object.entries(o).filter(e => {
                let [, t] = e;
                return a < t
            });
            u.length > 100 && (u = u.sort((e, t) => e[1] - t[1]).slice(-100));
            let c = {
                gpcVersion: t,
                nextSync: Object.fromEntries(u)
            };
            return r.setItem("globalPrivacyControl", {
                version: 0,
                data: c
            })
        })
    });
    e.s(["default", 0, function(e) {
        let {
            userId: n
        } = e;
        return (0, t.useEffect)(() => {
            i(n)
        }, [n]), null
    }], 767970)
}, 916089, e => {
    "use strict";
    var t = e.i(809804);
    let n = (0, e.i(865581).default)(() => e.A(705367), {
        loadableGenerated: {
            modules: [618391]
        },
        ssr: !1,
        loading: () => null
    });
    e.s(["default", 0, function() {
        return (0, t.jsx)(n, {})
    }])
}, 207963, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(865581),
        r = e.i(432464);
    let a = (0, n.default)(() => e.A(123968), {
        loadableGenerated: {
            modules: [83371]
        },
        ssr: !1,
        loading: () => null
    });
    e.s(["default", 0, function(e) {
        let {
            username: n,
            isUserUnder13: i
        } = e;
        return (0, t.jsx)(r.ErrorBoundary, {
            children: (0, t.jsx)(a, {
                username: n,
                isUserUnder13: i
            })
        })
    }])
}, 696717, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(865581),
        r = e.i(432464);
    let a = (0, n.default)(() => e.A(780837), {
        loadableGenerated: {
            modules: [815582]
        },
        ssr: !1,
        loading: () => null
    });
    e.s(["default", 0, function() {
        return (0, t.jsx)(r.ErrorBoundary, {
            children: (0, t.jsx)(a, {})
        })
    }])
}, 879809, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(371847),
        r = e.i(865581),
        a = e.i(165188),
        i = e.i(357355),
        l = e.i(270784),
        s = e.i(460987),
        o = e.i(200643),
        u = e.i(175067),
        c = e.i(519003),
        d = e.i(981498),
        m = e.i(57099);
    let p = e => {
        let t, n = (t = i.window, t?.Roblox?.Hybrid?.Game),
            r = n?.launchGame;
        return null == r ? null : new Promise(t => {
            r.call(n, e, () => {
                t()
            })
        })
    };
    e.i(350223);
    var g = e.i(874296);
    e.i(723941), g.object({
        RobloxLocale: g.nullable(g.string()),
        GameLocale: g.nullable(g.string()),
        PlayerChannelName: g.nullable(g.string()),
        ChannelName: g.nullable(g.string()),
        StudioChannelName: g.nullable(g.string()),
        IsDuarAutoOptInEnabled: g.boolean(),
        IsDuarOptOutDisabled: g.boolean(),
        IsOmitPlayerChannelForWinAndMacEnabled: g.boolean()
    });
    let f = e => null == e || "LIVE" === e.toUpperCase() ? "" : e,
        h = (0, r.default)(() => e.A(593401), {
            loadableGenerated: {
                modules: [518661]
            },
            ssr: !1
        }),
        v = (0, r.default)(() => e.A(715216), {
            loadableGenerated: {
                modules: [142742]
            },
            ssr: !1
        }),
        I = (0, r.default)(() => e.A(932954), {
            loadableGenerated: {
                modules: [233080]
            },
            ssr: !1
        }),
        y = e => (0, c.getPageBaseUrls)().wwwRoblox.withPath(e).toString();
    e.s(["default", 0, function(e) {
        let {
            settings: r,
            userId: c,
            isWindowsOrMac: g,
            osName: b,
            isInApp: A
        } = e, [E, C] = (0, n.useState)(null), [w, T] = (0, n.useState)(!1), [S, P] = (0, n.useState)(!1), x = (0, n.useRef)(null), _ = (0, n.useRef)(null);
        (0, n.useEffect)(() => {
            let e = {
                    placeLauncherUrl: y("/Game/PlaceLauncher.ashx"),
                    robloxLocale: r.RobloxLocale ?? "",
                    gameLocale: r.GameLocale ?? "",
                    playerChannel: f(r.PlayerChannelName),
                    studioChannel: f(r.StudioChannelName),
                    isDuarAutoOptInEnabled: r.IsDuarAutoOptInEnabled,
                    isDuarOptOutDisabled: r.IsDuarOptOutDisabled,
                    isOmitPlayerChannelForWinAndMacEnabled: r.IsOmitPlayerChannelForWinAndMacEnabled
                },
                t = (0, s.createGameLauncher)({
                    getConfig: () => e,
                    getBrowserTrackerId: l.getBrowserTrackerId,
                    isAuthenticated: () => null != c,
                    getUserId: () => c,
                    isWindowsOrMac: () => g,
                    onEvent: (e, t) => {
                        "startClientAttempted" === e && (0, d.trackAppShellCounter)("GameLaunch", {
                            outcome: "attempted"
                        }), (0, m.logGameLaunchEvent)(b, e, t)
                    },
                    onLaunchStarted: (e, t) => {
                        C({
                            params: e,
                            launch: t
                        })
                    },
                    onLaunchSucceeded: () => {
                        (0, d.trackAppShellCounter)("GameLaunch", {
                            outcome: "succeeded"
                        })
                    },
                    onLaunchFailed: e => {
                        (0, d.trackAppShellCounter)("GameLaunch", {
                            outcome: "failed"
                        }), console.error(e), T(!0)
                    },
                    onGuestLaunch: () => {
                        P(!0)
                    },
                    ...A ? {
                        launchInApp: p
                    } : {}
                });
            return x.current = t, (0, u.setGameLauncher)(t), () => {
                x.current = null, (0, u.setGameLauncher)(null)
            }
        }, [r, c, g, b, A]);
        let N = async e => {
            null != e.placeId && i.window?.localStorage.removeItem("ref_info"), x.current?.beginInstall(e);
            let t = _.current;
            if (null == t || null == i.window) return;
            if ("launchMode" in e && (0, o.isStudioLaunchMode)(e.launchMode)) {
                t.src = y("/download/studio"), C(null);
                return
            }
            t.referrerPolicy = "no-referrer";
            let n = i.window.location.href;
            t.src = `${y("/download/client")}${await (0,a.getInstallerDeeplinkQueryParams)(n)}`
        };
        return (0, t.jsxs)(t.Fragment, {
            children: [(0, t.jsx)("iframe", {
                ref: _,
                hidden: !0,
                title: "Roblox installer"
            }), null == E ? null : (0, t.jsx)(h, {
                download: () => N(E.params),
                launchGame: E.launch,
                unmount: () => {
                    C(null)
                }
            }), w ? (0, t.jsx)(v, {
                unmount: () => {
                    T(!1)
                }
            }) : null, S ? (0, t.jsx)(I, {
                unmount: () => {
                    P(!1)
                }
            }) : null]
        })
    }], 879809)
}, 778764, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(371847),
        r = e.i(744420);
    e.s(["default", 0, function(e) {
        let {
            script: a,
            nonce: i
        } = e, l = (0, n.useRef)(!1);
        return (0, r.useServerInsertedHTML)(() => {
            if (!l.current) return l.current = !0, (0, t.jsx)("script", {
                nonce: i,
                children: a
            }, "roblox-hybrid")
        }), null
    }])
}, 218963, e => {
    "use strict";
    var t = e.i(371847),
        n = e.i(357355);
    let r = {
            "Roblox.Friendship.FriendRequestSent": "friendRequestSent",
            "Roblox.Messages.MessageSent": "privateMessageSent",
            "Roblox.Settings.PushEnabledOnDevice": "enableAuthorizationForUser"
        },
        a = e => {
            let t, r = (t = n.window, t?.Roblox?.Hybrid?.Push),
                {
                    supports: a,
                    pushPermissionTrigger: i
                } = r ?? {};
            if (null != a && null != i) try {
                a.call(r, "pushPermissionTrigger", t => {
                    t && i.call(r, e)
                })
            } catch {}
        };
    e.s(["default", 0, function() {
        return (0, t.useEffect)(() => {
            let e = n.document;
            if (null == e) return;
            let t = Object.entries(r).map(t => {
                let [n, r] = t, i = () => {
                    a(r)
                };
                return e.addEventListener(n, i), [n, i]
            });
            return () => {
                t.forEach(t => {
                    let [n, r] = t;
                    e.removeEventListener(n, r)
                })
            }
        }, []), null
    }, "pushPermissionActions", 0, r, "sendPushPermissionTrigger", 0, a])
}, 594841, e => {
    "use strict";
    var t = e.i(809804);
    let n = (0, e.i(865581).default)(() => e.A(373322), {
        loadableGenerated: {
            modules: [775300]
        },
        ssr: !1,
        loading: () => null
    });
    e.s(["default", 0, function() {
        return (0, t.jsx)(n, {})
    }])
}, 930, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(371847),
        r = e.i(285586);
    e.s(["default", 0, function(e) {
        let {
            pageName: a
        } = e;
        return (0, n.useEffect)(() => {
            null != a && (0, r.setTag)("internal-page-name", a)
        }, [a]), null == a ? null : (0, t.jsx)("meta", {
            name: "page-meta",
            "data-internal-page-name": a
        })
    }])
}, 214795, e => {
    "use strict";
    var t = e.i(371847),
        n = e.i(763170),
        r = e.i(889375),
        a = e.i(981498);
    let i = [2e3, 8e3, 2e4, 6e4];
    e.s(["default", 0, function(e) {
        let {
            pageName: l
        } = e;
        return (0, t.useEffect)(() => {
            let e = new AbortController,
                {
                    signal: t
                } = e;
            return (async () => {
                for (let [e, s] of i.entries()) {
                    if (await (0, n.abortableTimeout)(s, t), t.aborted) break;
                    {
                        let t = `heartbeat${e+1}`;
                        (0, r.sendEvent)("pageHeartbeat", t), (0, a.trackAppShellCounter)("PageHeartbeat", {
                            page: l ?? "unknown",
                            beat: t
                        })
                    }
                }
            })(), () => {
                e.abort()
            }
        }, [l]), null
    }])
}, 692130, (e, t, n) => {
    ! function() {
        "use strict";
        var e = {};
        e.d = function(t, n) {
            for (var r in n) e.o(n, r) && !e.o(t, r) && Object.defineProperty(t, r, {
                enumerable: !0,
                get: n[r]
            })
        }, e.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, e.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, void 0 !== e && (e.ab = "/ROOT/node_modules/.pnpm/next@16.2.6_patch_hash=2889283f843aeb9b88db5fd798b6e589c78c4b38fab3ccd115a3f784da4f1be8_5143821f351443e644013a4d37024e4a/node_modules/next/dist/compiled/web-vitals/");
        var n = {};
        e.r(n), e.d(n, {
            CLSThresholds: function() {
                return P
            },
            FCPThresholds: function() {
                return T
            },
            FIDThresholds: function() {
                return ee
            },
            INPThresholds: function() {
                return V
            },
            LCPThresholds: function() {
                return M
            },
            TTFBThresholds: function() {
                return K
            },
            onCLS: function() {
                return x
            },
            onFCP: function() {
                return S
            },
            onFID: function() {
                return et
            },
            onINP: function() {
                return G
            },
            onLCP: function() {
                return X
            },
            onTTFB: function() {
                return Q
            }
        });
        var r, a, i, l, s, o = -1,
            u = function(e) {
                addEventListener("pageshow", function(t) {
                    t.persisted && (o = t.timeStamp, e(t))
                }, !0)
            },
            c = function() {
                var e = self.performance && performance.getEntriesByType && performance.getEntriesByType("navigation")[0];
                if (e && e.responseStart > 0 && e.responseStart < performance.now()) return e
            },
            d = function() {
                var e = c();
                return e && e.activationStart || 0
            },
            m = function(e, t) {
                var n = c(),
                    r = "navigate";
                return o >= 0 ? r = "back-forward-cache" : n && (document.prerendering || d() > 0 ? r = "prerender" : document.wasDiscarded ? r = "restore" : n.type && (r = n.type.replace(/_/g, "-"))), {
                    name: e,
                    value: void 0 === t ? -1 : t,
                    rating: "good",
                    delta: 0,
                    entries: [],
                    id: "v4-".concat(Date.now(), "-").concat(Math.floor(0x82f79cd8fff * Math.random()) + 1e12),
                    navigationType: r
                }
            },
            p = function(e, t, n) {
                try {
                    if (PerformanceObserver.supportedEntryTypes.includes(e)) {
                        var r = new PerformanceObserver(function(e) {
                            Promise.resolve().then(function() {
                                t(e.getEntries())
                            })
                        });
                        return r.observe(Object.assign({
                            type: e,
                            buffered: !0
                        }, n || {})), r
                    }
                } catch (e) {}
            },
            g = function(e, t, n, r) {
                var a, i;
                return function(l) {
                    var s;
                    t.value >= 0 && (l || r) && ((i = t.value - (a || 0)) || void 0 === a) && (a = t.value, t.delta = i, s = t.value, t.rating = s > n[1] ? "poor" : s > n[0] ? "needs-improvement" : "good", e(t))
                }
            },
            f = function(e) {
                requestAnimationFrame(function() {
                    return requestAnimationFrame(function() {
                        return e()
                    })
                })
            },
            h = function(e) {
                document.addEventListener("visibilitychange", function() {
                    "hidden" === document.visibilityState && e()
                })
            },
            v = function(e) {
                var t = !1;
                return function() {
                    t || (e(), t = !0)
                }
            },
            I = -1,
            y = function() {
                return "hidden" !== document.visibilityState || document.prerendering ? 1 / 0 : 0
            },
            b = function(e) {
                "hidden" === document.visibilityState && I > -1 && (I = "visibilitychange" === e.type ? e.timeStamp : 0, E())
            },
            A = function() {
                addEventListener("visibilitychange", b, !0), addEventListener("prerenderingchange", b, !0)
            },
            E = function() {
                removeEventListener("visibilitychange", b, !0), removeEventListener("prerenderingchange", b, !0)
            },
            C = function() {
                return I < 0 && (I = y(), A(), u(function() {
                    setTimeout(function() {
                        I = y(), A()
                    }, 0)
                })), {
                    get firstHiddenTime() {
                        return I
                    }
                }
            },
            w = function(e) {
                document.prerendering ? addEventListener("prerenderingchange", function() {
                    return e()
                }, !0) : e()
            },
            T = [1800, 3e3],
            S = function(e, t) {
                t = t || {}, w(function() {
                    var n, r = C(),
                        a = m("FCP"),
                        i = p("paint", function(e) {
                            e.forEach(function(e) {
                                "first-contentful-paint" === e.name && (i.disconnect(), e.startTime < r.firstHiddenTime && (a.value = Math.max(e.startTime - d(), 0), a.entries.push(e), n(!0)))
                            })
                        });
                    i && (n = g(e, a, T, t.reportAllChanges), u(function(r) {
                        n = g(e, a = m("FCP"), T, t.reportAllChanges), f(function() {
                            a.value = performance.now() - r.timeStamp, n(!0)
                        })
                    }))
                })
            },
            P = [.1, .25],
            x = function(e, t) {
                t = t || {}, S(v(function() {
                    var n, r = m("CLS", 0),
                        a = 0,
                        i = [],
                        l = function(e) {
                            e.forEach(function(e) {
                                if (!e.hadRecentInput) {
                                    var t = i[0],
                                        n = i[i.length - 1];
                                    a && e.startTime - n.startTime < 1e3 && e.startTime - t.startTime < 5e3 ? (a += e.value, i.push(e)) : (a = e.value, i = [e])
                                }
                            }), a > r.value && (r.value = a, r.entries = i, n())
                        },
                        s = p("layout-shift", l);
                    s && (n = g(e, r, P, t.reportAllChanges), h(function() {
                        l(s.takeRecords()), n(!0)
                    }), u(function() {
                        a = 0, n = g(e, r = m("CLS", 0), P, t.reportAllChanges), f(function() {
                            return n()
                        })
                    }), setTimeout(n, 0))
                }))
            },
            _ = 0,
            N = 1 / 0,
            L = 0,
            R = function(e) {
                e.forEach(function(e) {
                    e.interactionId && (N = Math.min(N, e.interactionId), _ = (L = Math.max(L, e.interactionId)) ? (L - N) / 7 + 1 : 0)
                })
            },
            D = function() {
                "interactionCount" in performance || r || (r = p("event", R, {
                    type: "event",
                    buffered: !0,
                    durationThreshold: 0
                }))
            },
            k = [],
            F = new Map,
            B = 0,
            j = [],
            O = function(e) {
                if (j.forEach(function(t) {
                        return t(e)
                    }), e.interactionId || "first-input" === e.entryType) {
                    var t = k[k.length - 1],
                        n = F.get(e.interactionId);
                    if (n || k.length < 10 || e.duration > t.latency) {
                        if (n) e.duration > n.latency ? (n.entries = [e], n.latency = e.duration) : e.duration === n.latency && e.startTime === n.entries[0].startTime && n.entries.push(e);
                        else {
                            var r = {
                                id: e.interactionId,
                                latency: e.duration,
                                entries: [e]
                            };
                            F.set(r.id, r), k.push(r)
                        }
                        k.sort(function(e, t) {
                            return t.latency - e.latency
                        }), k.length > 10 && k.splice(10).forEach(function(e) {
                            return F.delete(e.id)
                        })
                    }
                }
            },
            U = function(e) {
                var t = self.requestIdleCallback || self.setTimeout,
                    n = -1;
                return e = v(e), "hidden" === document.visibilityState ? e() : (n = t(e), h(e)), n
            },
            V = [200, 500],
            G = function(e, t) {
                "PerformanceEventTiming" in self && "interactionId" in PerformanceEventTiming.prototype && (t = t || {}, w(function() {
                    D();
                    var n, a, i = m("INP"),
                        l = function(e) {
                            U(function() {
                                e.forEach(O);
                                var t, n = (t = Math.min(k.length - 1, Math.floor(((r ? _ : performance.interactionCount || 0) - B) / 50)), k[t]);
                                n && n.latency !== i.value && (i.value = n.latency, i.entries = n.entries, a())
                            })
                        },
                        s = p("event", l, {
                            durationThreshold: null != (n = t.durationThreshold) ? n : 40
                        });
                    a = g(e, i, V, t.reportAllChanges), s && (s.observe({
                        type: "first-input",
                        buffered: !0
                    }), h(function() {
                        l(s.takeRecords()), a(!0)
                    }), u(function() {
                        B = 0, k.length = 0, F.clear(), a = g(e, i = m("INP"), V, t.reportAllChanges)
                    }))
                }))
            },
            M = [2500, 4e3],
            $ = {},
            X = function(e, t) {
                t = t || {}, w(function() {
                    var n, r = C(),
                        a = m("LCP"),
                        i = function(e) {
                            t.reportAllChanges || (e = e.slice(-1)), e.forEach(function(e) {
                                e.startTime < r.firstHiddenTime && (a.value = Math.max(e.startTime - d(), 0), a.entries = [e], n())
                            })
                        },
                        l = p("largest-contentful-paint", i);
                    if (l) {
                        n = g(e, a, M, t.reportAllChanges);
                        var s = v(function() {
                            $[a.id] || (i(l.takeRecords()), l.disconnect(), $[a.id] = !0, n(!0))
                        });
                        ["keydown", "click"].forEach(function(e) {
                            addEventListener(e, function() {
                                return U(s)
                            }, !0)
                        }), h(s), u(function(r) {
                            n = g(e, a = m("LCP"), M, t.reportAllChanges), f(function() {
                                a.value = performance.now() - r.timeStamp, $[a.id] = !0, n(!0)
                            })
                        })
                    }
                })
            },
            K = [800, 1800],
            W = function e(t) {
                document.prerendering ? w(function() {
                    return e(t)
                }) : "complete" !== document.readyState ? addEventListener("load", function() {
                    return e(t)
                }, !0) : setTimeout(t, 0)
            },
            Q = function(e, t) {
                t = t || {};
                var n = m("TTFB"),
                    r = g(e, n, K, t.reportAllChanges);
                W(function() {
                    var a = c();
                    a && (n.value = Math.max(a.responseStart - d(), 0), n.entries = [a], r(!0), u(function() {
                        (r = g(e, n = m("TTFB", 0), K, t.reportAllChanges))(!0)
                    }))
                })
            },
            Z = {
                passive: !0,
                capture: !0
            },
            H = new Date,
            q = function(e, t) {
                a || (a = t, i = e, l = new Date, z(removeEventListener), Y())
            },
            Y = function() {
                if (i >= 0 && i < l - H) {
                    var e = {
                        entryType: "first-input",
                        name: a.type,
                        target: a.target,
                        cancelable: a.cancelable,
                        startTime: a.timeStamp,
                        processingStart: a.timeStamp + i
                    };
                    s.forEach(function(t) {
                        t(e)
                    }), s = []
                }
            },
            J = function(e) {
                if (e.cancelable) {
                    var t, n, r, a = (e.timeStamp > 1e12 ? new Date : performance.now()) - e.timeStamp;
                    "pointerdown" == e.type ? (t = function() {
                        q(a, e), r()
                    }, n = function() {
                        r()
                    }, r = function() {
                        removeEventListener("pointerup", t, Z), removeEventListener("pointercancel", n, Z)
                    }, addEventListener("pointerup", t, Z), addEventListener("pointercancel", n, Z)) : q(a, e)
                }
            },
            z = function(e) {
                ["mousedown", "keydown", "touchstart", "pointerdown"].forEach(function(t) {
                    return e(t, J, Z)
                })
            },
            ee = [100, 300],
            et = function(e, t) {
                t = t || {}, w(function() {
                    var n, r = C(),
                        l = m("FID"),
                        o = function(e) {
                            e.startTime < r.firstHiddenTime && (l.value = e.processingStart - e.startTime, l.entries.push(e), n(!0))
                        },
                        c = function(e) {
                            e.forEach(o)
                        },
                        d = p("first-input", c);
                    n = g(e, l, ee, t.reportAllChanges), d && (h(v(function() {
                        c(d.takeRecords()), d.disconnect()
                    })), u(function() {
                        n = g(e, l = m("FID"), ee, t.reportAllChanges), s = [], i = -1, a = null, z(addEventListener), s.push(o), Y()
                    }))
                })
            };
        t.exports = n
    }()
}, 849703, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "useReportWebVitals", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let r = e.r(371847),
        a = e.r(692130);

    function i(e) {
        (0, r.useEffect)(() => {
            (0, a.onCLS)(e), (0, a.onFID)(e), (0, a.onLCP)(e), (0, a.onINP)(e), (0, a.onFCP)(e), (0, a.onTTFB)(e)
        }, [e])
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 255831, (e, t, n) => {
    t.exports = e.r(849703)
}, 8888, e => {
    "use strict";
    let t, n;
    var r = e.i(371847),
        a = e.i(255831),
        i = e.i(126392),
        l = e.i(683740),
        s = e.i(860430),
        o = e.i(84523),
        u = e.i(288014);
    let c = (0, s.fileDesc)("ChtldmVudC91c2VyX2V2ZW50X2Jhc2UucHJvdG8SBWV2ZW50It4HCg1Vc2VyRXZlbnRCYXNlEiUKB3VzZXJfaWQYASABKANCD5K+kgED4D4Bmr6SAQIIAUgAiAEBEiYKCHVzZXJfa2V5GAIgASgJQg+SvpIBA6g/AZq+kgECGAFIAYgBARIgCgljbGllbnRfaXAYAyABKAlCCJK+kgED6D4BSAKIAQESIQoKdXNlcl9hZ2VudBgEIAEoCUIIkr6SAQOgPwFIA4gBARInChBwbGF0Zm9ybV90eXBlX2lkGAUgASgDQgiSvpIBA+A/AUgEiAEBEikKEmJyb3dzZXJfdHJhY2tlcl9pZBgGIAEoA0IIkr6SAQPQPgFIBYgBARIoChFpc190cnVzdGVkX3NvdXJjZRgHIAEoCEIIkr6SAQOwPwFIBogBARIiCgt1c2VyX29yaWdpbhgIIAEoCUIIkr6SAQPYPwFIB4gBARIdCgZ0YXJnZXQYCSABKAlCCJK+kgEDiH0BSAiIAQESIQoKZXZlbnRfdHlwZRgKIAEoCUIIkr6SAQOQfQFICYgBARIfCghhcHBfbmFtZRgLIAEoCUIIkr6SAQO4PwFICogBARIxChtpbmdlc3Rpb25fdGltZV9taWxsaXNlY29uZHMYDCABKANCB4q+kgECCAFIC4gBARJEChFldmVudF9zdHJlYW1fdGFncxgNIAMoCzIpLmV2ZW50LlVzZXJFdmVudEJhc2UuRXZlbnRTdHJlYW1UYWdzRW50cnkSJgoPYXV0aF9zZXNzaW9uX2lkGA4gASgJQgiSvpIBA8A/AUgMiAEBEicKEGh0dHBfZmluZ2VycHJpbnQYDyABKAlCCJK+kgEDyD8BSA2IAQESJgoPdGxzX2ZpbmdlcnByaW50GBAgASgJQgiSvpIBA9A/AUgOiAEBGjYKFEV2ZW50U3RyZWFtVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCToCOAFCCgoIX3VzZXJfaWRCCwoJX3VzZXJfa2V5QgwKCl9jbGllbnRfaXBCDQoLX3VzZXJfYWdlbnRCEwoRX3BsYXRmb3JtX3R5cGVfaWRCFQoTX2Jyb3dzZXJfdHJhY2tlcl9pZEIUChJfaXNfdHJ1c3RlZF9zb3VyY2VCDgoMX3VzZXJfb3JpZ2luQgkKB190YXJnZXRCDQoLX2V2ZW50X3R5cGVCCwoJX2FwcF9uYW1lQh4KHF9pbmdlc3Rpb25fdGltZV9taWxsaXNlY29uZHNCEgoQX2F1dGhfc2Vzc2lvbl9pZEITChFfaHR0cF9maW5nZXJwcmludEISChBfdGxzX2ZpbmdlcnByaW50QjBaLmdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRiBnByb3RvMw", [u.file_event_event_field_options]);
    var d = e.i(861856);
    let m = (0, s.fileDesc)("CiBldmVudHN0cmVhbS93ZWIvd2ViX3ZpdGFscy5wcm90bxIXZXZlbnRzdHJlYW0uZXZlbnRpbmdlc3QitQUKCVdlYlZpdGFscxInCg9sb2NhbF90aW1lc3RhbXAYASABKAlCCaK+kgEECgJsdEgAiAEBEi0KD3VzZXJfZXZlbnRfYmFzZRgCIAEoCzIULmV2ZW50LlVzZXJFdmVudEJhc2USHgoEcGFnZRgDIAEoCUILor6SAQYKBHBhZ2VIAYgBARIcCgN1cmwYBCABKAlCCqK+kgEFCgN1cmxIAogBARIfCgZsY3BfbXMYBSABKAFCCqK+kgEFCgNsY3BIA4gBARIfCgZmY3BfbXMYBiABKAFCCqK+kgEFCgNmY3BIBIgBARIhCgd0dGZiX21zGAcgASgBQguivpIBBgoEdHRmYkgFiAEBEhwKA2NscxgIIAEoAUIKor6SAQUKA2Nsc0gGiAEBEh8KBmlucF9tcxgJIAEoAUIKor6SAQUKA2lucEgHiAEBEjMKD3JlbmRlcl9wbGF0Zm9ybRgKIAEoCUIVor6SARAKDnJlbmRlclBsYXRmb3JtSAiIAQE6ygHK/JIBIwoMaW5nZXN0X3Byb3RvEgp3ZWJfdml0YWxzIgdkcyxob3Vy2vySAQYIiCcQgATi/JIBUCIDd3d3OjMKBFVzZXISDUNvbnN1bWVyIEFwcHMaGVBsYXRmb3JtcyAtIFdlYiAmIEJhY2tlbmQguRNCCyNjcC1iYWNrZW5kSgdQSDNQS01Y6vySATYKIGV2ZW50c3RyZWFtL3dlYi93ZWJfdml0YWxzLnByb3RvEhAKA3d3dxIJd2ViVml0YWxzGAf6/JIBAggBQhIKEF9sb2NhbF90aW1lc3RhbXBCBwoFX3BhZ2VCBgoEX3VybEIJCgdfbGNwX21zQgkKB19mY3BfbXNCCgoIX3R0ZmJfbXNCBgoEX2Nsc0IJCgdfaW5wX21zQhIKEF9yZW5kZXJfcGxhdGZvcm1COlo4Z2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS93ZWJiBnByb3RvMw", [u.file_event_event_field_options, c, d.file_eventstream_core_hive_table_message_options]),
        p = (0, o.messageDesc)(m, 0);
    var g = e.i(674094),
        f = e.i(559659),
        h = e.i(358239);
    let v = (0, f.createFireTelemetryHistogram)("WWW_PageTelemetry", {}),
        I = {
            ServerList: .001,
            Home: .003,
            Profile: .003,
            GameDetail: .004,
            Friends: .004,
            Settings: .006,
            Login: .015,
            GroupDetails: .015,
            LeanerRobuxRedesignModel: .02,
            robuxRedesign: .025,
            ConfigurePrivateServer: .025,
            Avatar: .025,
            Support: .1,
            GroupSearch: .1,
            VerifyEmail: .1,
            NotApproved: .1,
            PostPurchase: .1,
            CrossDeviceLoginConfirmCode: .15,
            PreAuthLanding_NonAPAC: .15,
            RefundAgreementPage: .15,
            MobileAppCreateAccount: .15,
            PaymentMethods: .15,
            ShopGiftCards: .2,
            VirtualEventDetails: .2,
            BundleDetail: .25,
            SecurityFeedback: .25,
            Redeem: .25,
            giftCardsLanding: .5,
            PreAuthLanding_Three_Sorts: .5,
            Create_Community: .5,
            SafetySupportPage: .5,
            CreditCardVerificationPage: .5,
            ModerationPortalPage: 1,
            Abuse_Report_Platform: 1,
            AccountSwitcherIframe: 1,
            AvatarUpsell: 1,
            BraintreePayment: 1,
            GiftingProducts: 1,
            LoginRedirect: 1,
            LookDetail: 1,
            NativeAdsList: 1,
            NuveiPayment: 1,
            PreAuthLanding: 1,
            PreAuthLanding_APAC: 1,
            ResetPassword: 1,
            SecurityNotification: 1,
            Sitemap: 1,
            SongDetails: 1,
            SupportCenter: 1,
            SupportedBrowsers: 1,
            XsollaPayment: 1,
            SduiLandingPage_action: 1,
            SduiLandingPage_adventure: 1,
            SduiLandingPage_education: 1,
            SduiLandingPage_first_person_shooters: 1,
            SduiLandingPage_horror: 1,
            SduiLandingPage_party_casual: 1,
            SduiLandingPage_puzzle: 1,
            SduiLandingPage_roleplaying_games: 1,
            SduiLandingPage_shooter: 1,
            SduiLandingPage_simulation: 1,
            SduiLandingPage_social: 1,
            SduiLandingPage_sports: 1,
            SduiLandingPage_strategy: 1,
            SduiLandingPage_survival: 1,
            SduiLandingPage_the_hunt_roblox_20: 1
        },
        y = /[^A-Za-z0-9_]/g,
        b = {
            ttfb: "TTFB",
            fcp: "FCP",
            lcp: "LCP",
            inp: "INP",
            cls: "CLS"
        };
    var A = e.i(245837);
    let E = {
            LCP: "lcp",
            FCP: "fcp",
            TTFB: "ttfb",
            CLS: "cls",
            INP: "inp"
        },
        C = () => ({
            pageNameSet: !1,
            pageName: void 0,
            sent: !1
        }),
        w = C();
    e.s(["default", 0, function(e) {
        let {
            pageName: s
        } = e, o = (0, r.useRef)({});
        return (0, a.useReportWebVitals)(e => {
            let t = E[e.name];
            t && (o.current[t] = {
                value: e.value
            })
        }), (0, r.useEffect)(() => {
            w.pageNameSet || (w.pageNameSet = !0, w.pageName = s)
        }, []), (0, r.useEffect)(() => {
            let e = () => {
                    if (w.sent) return;
                    w.sent = !0;
                    let e = function(e) {
                        if (null != e.ttfb || 0 === Object.keys(e).length || "u" < typeof performance) return;
                        let [t] = performance.getEntriesByType("navigation");
                        if (t && t.responseStart > 0) {
                            let e = t.activationStart ?? 0;
                            return {
                                value: Math.max(t.responseStart - e, 0)
                            }
                        }
                    }(o.current);
                    e && (o.current.ttfb = e),
                        function(e, r, a, i, s, o) {
                            if (!r) return;
                            let u = r.lcp?.value,
                                c = r.fcp?.value,
                                d = r.ttfb?.value,
                                m = r.cls?.value,
                                A = r.inp?.value;
                            if ([u, c, d, m, A].some(e => "number" == typeof e)) try {
                                ((null == t || n !== e) && (t = new g.EventStreamClient({
                                    baseUrl: e
                                }), n = e), t).sendEvent(p, {
                                        localTimestamp: new Date().toISOString(),
                                        userEventBase: {
                                            userId: function(e) {
                                                if (null != e) return "bigint" == typeof e ? e : ("number" == typeof e ? (0, l.bigIntFromNumber)(e) : (0, l.parseBigInt)(e)) ?? void 0
                                            }(a)
                                        },
                                        page: i,
                                        url: window.location.href,
                                        lcpMs: u,
                                        fcpMs: c,
                                        ttfbMs: d,
                                        cls: m,
                                        inpMs: A,
                                        renderPlatform: o
                                    }).catch(() => {}),
                                    function(e, t, n) {
                                        if (!e) return;
                                        let r = (void 0 === t || "" === t ? "Unknown" : t).replace(y, "_");
                                        if (Math.random() >= (I[r] ?? .05)) return;
                                        let {
                                            appType: a,
                                            browser: i
                                        } = (0, h.getDeviceClient)(), l = {
                                            appType: a,
                                            browser: i,
                                            host: n
                                        }, s = !1;
                                        for (let [t, n] of Object.entries(b)) {
                                            let a = e[t]?.value;
                                            "number" == typeof a && (v(`PagePerf_${n}_${r}`, l, a), s = !0)
                                        }
                                        s && (0, f.flushTelemetryHistograms)()
                                    }(r, s, o)
                            } catch (e) {
                                console.error("[PERF] Failed to send web vitals:", e)
                            }
                        }(A.default.apiGatewayUrl, o.current, (0, i.getCurrentUser)()?.id, s, w.pageName, "nextjs")
                },
                r = () => {
                    "hidden" === document.visibilityState && e()
                };
            return document.addEventListener("visibilitychange", r), window.addEventListener("pagehide", e), () => {
                document.removeEventListener("visibilitychange", r), window.removeEventListener("pagehide", e)
            }
        }, [s]), null
    }, "resetDocumentLoadForTests", 0, () => {
        w = C()
    }], 8888)
}, 967069, e => {
    "use strict";
    var t = e.i(809804),
        n = e.i(526005),
        r = e.i(708923),
        a = e.i(69134),
        i = e.i(386650),
        l = e.i(587541),
        s = e.i(690255),
        o = e.i(801827),
        u = e.i(360702),
        c = e.i(883355),
        d = e.i(646424),
        m = e.i(519003);
    e.i(350223);
    var p = e.i(874296);
    let g = p.object({
            cooldownPeriodInMs: p.number()
        }),
        f = p.object({
            id: p.string(),
            agreementType: p.string(),
            clientType: p.literal(["Web"]),
            regulationType: p.string(),
            displayUrl: p.string(),
            agreementBodyText: p.nullish(p.string()),
            action: p.optional(p.string())
        }),
        h = p.array(f),
        v = u.AsyncResult.fn(async e => {
            let t = c.getItem("userAgreements");
            if (t?.version === 0) {
                let n = t.data[e];
                if (null != n) {
                    let {
                        cooldownPeriodInMs: e
                    } = await d.get((0, m.getPageBaseUrls)().apiGateway.withPath("/guac-v2/v1/bundles/user-agreements-policy"), g, {
                        credentials: "include"
                    }).getOrDefault({
                        cooldownPeriodInMs: 864e5
                    });
                    if (Date.now() < n + e) return (0, u.ok)([])
                }
            }
            return d.get((0, m.getPageBaseUrls)().apiGateway.withPath("/user-agreements/v1/agreements-resolution/web"), h, {
                credentials: "include"
            }).inspect(n => {
                if (0 === n.length && (null == t || 0 === t.version)) {
                    let n = t?.data ?? {};
                    n[e] = Date.now();
                    let r = Object.entries(n);
                    r.length > 100 && (r = r.sort((e, t) => e[1] - t[1]).slice(-100)), c.setItem("userAgreements", {
                        version: 0,
                        data: Object.fromEntries(r)
                    })
                }
            })
        }),
        I = {
            TermsOfService: "Modal.Agreement.TermsOfService",
            PrivacyPolicy: "Modal.Agreement.PrivacyPolicy",
            RiderTerms: "Modal.Agreement.RiderTerms",
            ChildrenPrivacyPolicy: "Modal.Agreement.ChildrenPrivacyPolicy"
        };
    e.s(["default", 0, function(e) {
        let {
            userId: u
        } = e, c = (0, o.useTranslations)("CommonUI.UserAgreements"), {
            data: p
        } = (0, r.useQuery)({
            queryKey: ["outstanding-user-agreements", u],
            queryFn: () => v(u).getOrThrow(),
            staleTime: 1 / 0
        }), g = (0, n.useMutation)({
            mutationFn: e => {
                let t;
                return (t = {
                    acceptances: e.map(e => {
                        let {
                            id: t
                        } = e;
                        return t
                    }).map(e => ({
                        agreementId: e
                    }))
                }, d.postUntyped((0, m.getPageBaseUrls)().apiGateway.withPath("/user-agreements/v1/acceptances"), t, {
                    credentials: "include"
                })).getOrThrow()
            }
        }), f = p?.find(e => null != e.agreementBodyText)?.agreementBodyText;
        return null == p || 0 === p.length || g.isSuccess ? null : (0, t.jsx)(i.Dialog, {
            open: !0,
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            children: (0, t.jsxs)(i.DialogContent, {
                children: [(0, t.jsxs)(i.DialogBody, {
                    className: "flex flex-col items-start gap-medium",
                    children: [(0, t.jsx)(i.DialogTitle, {
                        className: "text-heading-large content-emphasis",
                        children: c("Modal.Title")
                    }), (0, t.jsx)("p", {
                        className: "text-body-large content-default",
                        children: f ?? c("Modal.Body")
                    }), (0, t.jsx)("ul", {
                        className: "flex flex-col gap-medium",
                        children: p.map(e => {
                            let {
                                id: n,
                                agreementType: r,
                                displayUrl: a
                            } = e;
                            return l.Url.parse(a).map(e => (0, t.jsx)("li", {
                                children: (0, t.jsx)(s.Link, {
                                    href: e,
                                    target: "_blank",
                                    rel: "noreferrer",
                                    className: "text-body-large content-link",
                                    children: Object.hasOwn(I, r) ? c(I[r]) : a
                                })
                            }, n)).getOrNull()
                        })
                    })]
                }), (0, t.jsx)(i.DialogFooter, {
                    className: "flex",
                    children: (0, t.jsx)(a.Button, {
                        variant: "Emphasis",
                        size: "Medium",
                        className: "fill basis-0",
                        isDisabled: g.isPending,
                        onClick: () => {
                            g.isPending || g.mutate(p)
                        },
                        children: c("Modal.Agree")
                    })
                })]
            })
        })
    }], 967069)
}, 795883, e => {
    "use strict";
    let t, n, r, a, i;
    var l = e.i(371847),
        s = e.i(357355),
        o = e.i(217827);
    e.i(350223);
    var u = e.i(874296),
        c = e.i(646424),
        d = e.i(519003);
    let m = u.object({
            accountTheme: u.object({
                currentValue: u.string()
            })
        }),
        p = ["theme-classic", "theme-circuit-rush", "theme-cosmic-dust", "theme-electric-lime", "theme-hyper-plum", "theme-inferno-blast", "theme-kinetic-energy", "theme-lava-glow", "theme-nebula-drift", "theme-nitro-frost", "theme-pixel-pop", "theme-polar-freeze", "theme-quantum-pulse", "theme-star-burst", "theme-super-charge"],
        g = (n = new Set, r = null, a = 0, i = e => {
            void 0 !== t && t !== e && n.add(t), n.delete(e), t = e
        }, {
            startChange: e => (n.add(e), void 0 !== t && n.add(t), a += 1, r = a),
            finishChange: (e, t) => {
                if (e === r) return r = null, i(t), t
            },
            observeServer: e => {
                if (n.has(e)) return t;
                n.size > 0 && (r = null, i(e))
            }
        }),
        f = e => {
            if (null == s.document) return;
            let {
                classList: t
            } = s.document.body;
            t.remove(...p.filter(t => t !== e)), null != e && t.add(e)
        };
    e.s(["default", 0, function(e) {
        let {
            serverThemeClass: t
        } = e, n = (0, l.useRef)(t);
        return (0, l.useLayoutEffect)(() => {
            n.current = t;
            let e = g.observeServer(t);
            void 0 !== e && f(e)
        }), (0, o.useRealtimeNamespace)("UserSettingsChanged", e => {
            if (!("object" == typeof e && null != e && "SettingsChanged" in e && Array.isArray(e.SettingsChanged) && e.SettingsChanged.includes("AccountTheme"))) return;
            let t = g.startChange(n.current);
            c.get((0, d.getPageBaseUrls)().apiGateway.withPath("/user-settings-api/v2/user-settings/settings-and-options-subset").withSearchParams({
                requestedUserSettings: "accountTheme"
            }), m, {
                credentials: "include"
            }).map(e => e.accountTheme.currentValue).inspect(e => {
                let n, r = g.finishChange(t, (n = `theme-${e.replaceAll(/([a-z])([A-Z])/g,"$1-$2").toLowerCase()}`, p.find(e => e === n) ?? null));
                void 0 !== r && f(r)
            })
        }), null
    }], 795883)
}, 721955, e => {
    "use strict";
    var t = e.i(371847),
        n = e.i(708923);
    e.i(350223);
    var r = e.i(874296),
        a = e.i(646424),
        i = e.i(883355),
        l = e.i(519003);
    let s = "classic-theme-variant",
        o = "classic-theme-variant-1",
        u = "PlayerApp.R20.AccessEnrollment",
        c = r.object({
            layers: r.object({
                [u]: r.object({
                    parameters: r.object({
                        FFlagAppClassicThemeGreenButtonColors: r.optional(r.unknown())
                    })
                })
            })
        }),
        d = () => {
            let e = i.getItem(s) ?? {
                version: 0,
                data: []
            };
            return 0 === e.version ? e.data : null
        };
    e.s(["default", 0, function(e) {
        let {
            userId: r
        } = e, [m, p] = (0, t.useState)(!1), {
            data: g
        } = (0, n.useQuery)({
            queryKey: ["ixp", u],
            queryFn: () => a.post((0, l.getPageBaseUrls)().apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                layers: {
                    [u]: {}
                }
            }, c, {
                credentials: "include"
            }).map(e => {
                let {
                    layers: t
                } = e;
                return !0 === t[u].parameters.FFlagAppClassicThemeGreenButtonColors
            }).getOrThrow(),
            enabled: m,
            staleTime: 1 / 0
        });
        return (0, t.useEffect)(() => {
            let e = d();
            null != e && (e.includes(r) && document.body.classList.add(o), p(!0))
        }, [r]), (0, t.useEffect)(() => {
            if (null == g) return;
            document.body.classList.toggle(o, g);
            let e = d();
            if (null == e) return;
            let t = e.includes(r);
            g && !t ? i.setItem(s, {
                version: 0,
                data: [...e, r]
            }) : !g && t && i.setItem(s, {
                version: 0,
                data: e.filter(e => e !== r)
            })
        }, [g, r]), null
    }])
}, 931637, e => {
    "use strict";
    let t;
    var n = e.i(809804),
        r = e.i(910030),
        a = e.i(391855),
        i = e.i(784859);
    let l = () => new r.QueryClient({
        defaultOptions: {
            queries: {
                retry: !1
            }
        }
    });
    e.s(["default", 0, function(e) {
        let {
            children: r
        } = e;
        return (0, n.jsx)(a.QueryClientProvider, {
            client: i.isServer ? l() : t ??= l(),
            children: r
        })
    }])
}, 180158, e => {
    "use strict";
    var t = e.i(809804);
    let n = (0, e.i(371847).createContext)(null);
    e.s(["default", 0, function(e) {
        let {
            appMode: r,
            children: a
        } = e;
        return (0, t.jsx)(n.Provider, {
            value: r,
            children: a
        })
    }], 180158)
}]);

//# debugId=39117745-2f0f-daa9-89e4-52c6e47a868d
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0vn30k-53mgv0.js.map