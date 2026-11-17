;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "15c70e32-c619-f89c-1ec4-ab3e7c6f4cf3")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 603134, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(750341),
        a = e.i(432464),
        r = e.i(910030),
        i = e.i(391855),
        l = e.i(981498);
    let o = (0, n.default)(() => e.A(599449).then(e => ((0, l.trackAppShellCounter)("ChatLoad", {
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
        s = new r.QueryClient({
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
        return (0, t.jsx)(a.ErrorBoundary, {
            onError: () => {
                (0, l.trackAppShellCounter)("ChatLoad", {
                    outcome: "crashed"
                })
            },
            children: (0, t.jsx)(i.QueryClientProvider, {
                client: s,
                children: (0, t.jsx)(o, {
                    showPlayButton: n
                })
            })
        })
    }])
}, 275318, e => {
    "use strict";
    var t = e.i(420482);
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
        n = e.i(815079),
        a = e.i(686790);
    e.i(350223);
    var r = e.i(874296);
    let i = r.object({
            cookieName: r.string(),
            description: r.catch(r.literal([null, "Description.RBXIDCHECK", "Description.ROBLOSECURITY", "Description.GuestData", "Description.RBXEventTrackerV2", "Description.RBXImageCache", "Description.RBXcp", "Description._cfduid", "Description.HelpCenterSession", "Description.IclVisitorLangJs", "Description.HasGmid", "Description.RbxIp2", "Description.WpmlBrowserRedirectTest", "Description.CookieT", "Description.RBXViralAcquisition", "Description.RBXSource"]), null)
        }),
        l = r.object({
            ShouldDisplayCookieBannerV3: r.boolean(),
            NonEssentialCookieList: r.array(r.string()),
            EssentialCookieList: r.array(i),
            RestrictNonEssentialTrackingConsent: r.catch(r.optional(r.boolean()), void 0)
        });
    e.s(["getCookiePolicy", 0, () => t.get(n.apiGateway.withPath("/guac-v2/v1/bundles/cookie-policy"), l, {
        credentials: "include"
    }).inspect(e => {
        (0, a.setTrackingRestriction)(e.RestrictNonEssentialTrackingConsent)
    })], 336716)
}, 809094, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(420482),
        a = e.i(708923),
        r = e.i(545819),
        i = e.i(784859),
        l = e.i(336716),
        o = e.i(686790),
        s = e.i(750341),
        c = e.i(523131),
        u = e.i(801827),
        d = e.i(815079),
        m = e.i(690255);
    let p = (0, s.default)(() => e.A(31611), {
            loadableGenerated: {
                modules: [358424]
            }
        }),
        g = "{privacyPolicyLink}";

    function h(e) {
        let {
            cookiePolicy: a,
            onClose: r
        } = e, [i, l] = (0, n.useState)(!1), s = (0, u.useTranslations)("Feature.Tracking"), h = (0, u.useTranslations)("CommonUI.Controls"), f = s("Description.CookieBannerContent", {
            privacyPolicyLink: g
        }), b = f.indexOf(g), v = e => {
            (0, o.setUserConsent)(e, a.NonEssentialCookieList), r()
        };
        return (0, t.jsxs)("div", {
            className: "sticky bottom-[0] [z-index:1] bg-surface-100",
            children: [(0, t.jsxs)("div", {
                className: "flex flex-col gap-small padding-large",
                children: [(0, t.jsxs)("p", {
                    className: "text-body-medium content-default",
                    children: [f.substring(0, b), (0, t.jsx)(m.Link, {
                        href: d.wwwRoblox.withPath("/info/privacy"),
                        target: "_blank",
                        rel: "noreferrer",
                        className: "content-link",
                        children: s("Description.PrivacyPolicy")
                    }), f.substring(b + g.length)]
                }), (0, t.jsxs)("div", {
                    className: "flex justify-between",
                    children: [(0, t.jsx)(c.Button, {
                        variant: "Link",
                        onClick: () => {
                            l(!0)
                        },
                        children: s("Action.SetCookieOptions")
                    }), (0, t.jsxs)("div", {
                        className: "flex gap-large",
                        children: [(0, t.jsx)(c.Button, {
                            variant: "Standard",
                            onClick: () => {
                                v([])
                            },
                            children: h("Action.DeclineAll")
                        }), (0, t.jsx)(c.Button, {
                            variant: "Emphasis",
                            onClick: () => {
                                v(a.NonEssentialCookieList)
                            },
                            children: h("Action.AcceptAll")
                        })]
                    })]
                })]
            }), i ? (0, t.jsx)(p, {
                cookiePolicy: a,
                onSubmit: () => {
                    r()
                },
                onClose: () => {
                    l(!1)
                }
            }) : null]
        })
    }
    e.s(["default", 0, function() {
        let e = (0, n.useRef)(() => i.isClient ? r.get("RBXcb") : null),
            s = !!e.current()?.value,
            {
                data: c,
                isLoading: u
            } = (0, a.useQuery)({
                queryKey: ["cookie-policy"],
                queryFn: () => (0, l.getCookiePolicy)().getOrThrow(),
                enabled: !s,
                staleTime: 1 / 0
            }),
            [d, m] = (0, n.useState)(!1),
            p = c?.ShouldDisplayCookieBannerV3 && c.EssentialCookieList.length > 0,
            g = !s && !u && !p;
        return (0, n.useEffect)(() => {
            g && null != c && (0, o.setUserConsent)(c.NonEssentialCookieList, c.NonEssentialCookieList)
        }, [g, c]), s || !p || d ? null : (0, t.jsx)(h, {
            cookiePolicy: c,
            onClose: () => {
                m(!0)
            }
        })
    }], 809094)
}, 963157, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(420482),
        a = e.i(523131),
        r = e.i(31315),
        i = e.i(900915),
        l = e.i(258259),
        o = e.i(747769),
        s = e.i(28729),
        c = e.i(454801),
        u = e.i(959016),
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
        h = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        f = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        b = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        v = (0, n.forwardRef)((e, t) => {
            let {
                label: a,
                labelTooltip: r,
                leadingIconName: i,
                trailingIconName: v,
                leadingIconNode: A,
                trailingIconNode: y,
                hasError: I,
                error: E,
                helperText: C,
                size: w,
                variant: S = "Standard",
                isRequired: N,
                isDisabled: x,
                className: V,
                style: T,
                inputContainerClassName: Z,
                inputContainerClassStyle: R,
                id: L,
                ...P
            } = e, F = (0, s.default)(), k = L || F, X = `${k}-description`, _ = w ?? "Large", G = I || !!E, D = E || C, B = (0, n.useMemo)(() => i ? n.default.createElement(o.Icon, {
                name: i,
                size: _,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : A, [i, A, _]), W = (0, n.useMemo)(() => v ? n.default.createElement(o.Icon, {
                name: v,
                size: _,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : y, [_, v, y]), j = a ? n.default.createElement("label", {
                htmlFor: k,
                className: (0, d.default)(f[_], "content-emphasis")
            }, a, N && n.default.createElement(n.default.Fragment, null, " ", n.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return n.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, d.default)(`flex width-full flex-col gap-small ${V}`, {
                    [l.disabledOpacity]: x
                }),
                style: T
            }, j && (r ? n.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, j, n.default.createElement(c.LabelTooltip, r)) : j), n.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, d.default)("foundation-web-input flex items-center width-full", u.INPUT_STROKE_BY_VARIANT[S], u.INPUT_BACKGROUND_BY_VARIANT[S], Z, g[_], h[_], m[_], p[_], G ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: R
            }, B, n.default.createElement("input", {
                type: "text",
                id: k,
                ref: t,
                className: (0, d.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", b[_]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": G,
                "aria-describedby": D ? X : void 0,
                required: N,
                ...P,
                disabled: x
            }), W), D && n.default.createElement("span", {
                id: X,
                className: (0, d.default)("text-caption-small", {
                    "content-system-alert": G,
                    "content-default": !G
                })
            }, D))
        });
    v.displayName = "TextInput";
    let A = "configurewebapps:overrideschanged",
        y = e => {
            let {
                fields: l
            } = e, o = (0, n.useCallback)(() => l.map(e => e.read()), [l]), [s, c] = (0, n.useState)(o), [u, d] = (0, n.useState)(s), [m, p] = (0, n.useState)(!1), g = s.some(e => "" !== e), h = (0, n.useRef)(s);
            h.current = s;
            let f = (0, n.useCallback)(() => {
                let e = o(),
                    t = h.current;
                e.every((e, n) => e === t[n]) || (d(n => n.map((n, a) => n === t[a] ? e[a] ?? "" : n)), c(e), p(!0))
            }, [o]);
            (0, n.useEffect)(() => (window.addEventListener(A, f), () => {
                window.removeEventListener(A, f)
            }), [f]);
            let b = (e, t) => {
                    let n = l[e];
                    if (null == n) return;
                    n.write(t), p(!0);
                    let a = n.read(),
                        r = t => t.map((t, n) => n === e ? a : t);
                    c(r), d(r)
                },
                y = l.map((e, t) => m || !s[t] ? null : e.warning?.(s[t]) ?? null),
                I = l.map((e, t) => s[t] ? `${e.summaryLabel}: ${s[t]}${y[t]?" (not served)":""}` : "").filter(Boolean).join(" · ");
            return (0, t.jsx)("div", {
                className: "env-overrides-overlay flex bg-surface-100 radius-medium",
                children: (0, t.jsxs)(i.Popover, {
                    onOpenChange: e => {
                        e && f()
                    },
                    children: [(0, t.jsx)(i.PopoverTrigger, {
                        asChild: !0,
                        children: (0, t.jsx)(a.Button, {
                            size: "Small",
                            variant: g ? "Alert" : "Standard",
                            icon: g ? "icon-filled-triangle-exclamation" : "icon-regular-gear",
                            children: g ? I : "env"
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
                                children: (0, t.jsx)(r.IconButton, {
                                    icon: "icon-regular-x",
                                    ariaLabel: "Close",
                                    size: "Small",
                                    variant: "Utility"
                                })
                            })]
                        }), l.map((e, n) => (0, t.jsxs)("div", {
                            className: "flex flex-col gap-xsmall",
                            children: [(0, t.jsx)(v, {
                                label: e.label,
                                helperText: `current: ${""===s[n]?e.emptyText:s[n]??""}`,
                                size: "Small",
                                placeholder: e.placeholder,
                                value: u[n] ?? "",
                                onChange: e => {
                                    let {
                                        value: t
                                    } = e.target;
                                    d(e => e.map((e, a) => a === n ? t : e))
                                }
                            }), y[n] && (0, t.jsx)("span", {
                                role: "alert",
                                className: "text-caption-medium content-system-alert",
                                children: y[n]
                            }), (0, t.jsxs)("div", {
                                className: "flex gap-small",
                                children: [(0, t.jsx)(a.Button, {
                                    size: "Small",
                                    variant: "Emphasis",
                                    onClick: () => {
                                        b(n, u[n] ?? "")
                                    },
                                    children: "Set"
                                }), (0, t.jsx)(a.Button, {
                                    size: "Small",
                                    variant: "Standard",
                                    onClick: () => {
                                        b(n, "")
                                    },
                                    children: "Clear"
                                })]
                            })]
                        }, e.label)), m && (0, t.jsx)(a.Button, {
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
    var I = e.i(357355),
        E = e.i(586588),
        C = e.i(940311);
    let w = "mrrouter-env",
        S = /^(\d+)-/,
        N = /@(\d+)-/,
        x = {
            label: "MrRouter env",
            summaryLabel: "env",
            placeholder: "e.g. 19563-website-ne",
            emptyText: "default routing",
            read: C.getMrRouterEnvName,
            write: e => {
                (0, C.setMrRouterEnvName)(e), window.dispatchEvent(new Event(A))
            },
            warning: e => {
                let t = S.exec(e)?.[1],
                    n = I.document?.getElementById("rbx-sentry-config")?.dataset.release;
                return null == t || null == n || "" === n || N.exec(n)?.[1] === t ? null : `This page came from ${n}, not ${e}. The env may be missing, expired, or still deploying.`
            }
        },
        V = [x];
    e.s(["default", 0, function() {
        let [e, a] = (0, n.useState)(!1);
        return (0, n.useEffect)(() => {
            var e;
            let t, n, r;
            (null == (r = null == I.window ? null : (e = I.window.location.href, t = E.AnyUrl.parse(e).getOrNull(), n = t?.searchParams.get(w), null == t || null == n ? null : ((0, C.setMrRouterEnvName)(n.trim()), t.withSearchParams(t.searchParams.copyAndDelete(w)).toString()))) || (I.window?.location.replace(r), 0)) && (window.MrRouter = {
                getEnvName: C.getMrRouterEnvName,
                setEnvName: e => {
                    x.write(e ?? "")
                }
            }, a(!("Cypress" in window)))
        }, []), e ? (0, t.jsx)(y, {
            fields: V
        }) : null
    }], 963157)
}, 310119, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(708923),
        a = e.i(420482);
    let r = (0, e.i(750341).default)(() => e.A(389897), {
        loadableGenerated: {
            modules: [63400]
        }
    });

    function i(e) {
        let {
            userId: n,
            children: i
        } = e, [l, o] = (0, a.useState)(!1);
        return (0, t.jsxs)(t.Fragment, {
            children: [(0, t.jsx)("button", {
                type: "button",
                className: "flex items-center gap-xsmall hover:content-emphasis",
                onClick: () => {
                    o(!0)
                },
                children: i
            }), l && (0, t.jsx)(r, {
                userId: n,
                onClose: () => {
                    o(!1)
                }
            })]
        })
    }
    var l = e.i(815079),
        o = e.i(690255),
        s = e.i(97333),
        c = e.i(801827);
    let u = {
        src: e.i(407175).default,
        width: 60,
        height: 29,
        blurWidth: 8,
        blurHeight: 4,
        blurDataURL: "data:image/webp;base64,UklGRg4BAABXRUJQVlA4TAEBAAAvB8AAEM1VICICHgiwCQAAAIANAFQAAAIACgcAAAAAAAAAAABAAAAAAAAAAQEQkIBAhEgAqAMAAPBAgE0AAAAAzv8VckQCFAoAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAqAACsUcoPJAAEgAAAAAzr89A0OYwYC3AWADAAAAGAAAAAAAAAAAAAAAAGAAhgwAZrYB8HsgBCcAAAAA538PAKABAAAAAAAAAAAAAAAqAABiAAAAAAAAAAAAAAAADQBAplquJLrWnfUvV1rWZwQN//F8EmmH0srZFcM7alhirvGhF8Uc0s866EDBFzY00sN3gSB5hZ6wAyW17l1BdSRju1E/GgA="
    };

    function d() {
        let e = (0, c.useTranslations)("CommonUI.Features");
        return (0, t.jsxs)(t.Fragment, {
            children: [e("Label.YourPrivacyChoices"), (0, t.jsx)(s.default, {
                src: u,
                alt: "",
                className: "width-800"
            })]
        })
    }

    function m() {
        return (0, t.jsx)(o.Link, {
            href: l.wwwRoblox.withPath("/my/account").withFragment("!/privacy"),
            target: "_blank",
            rel: "noreferrer",
            className: "flex items-center gap-xsmall hover:content-emphasis",
            children: (0, t.jsx)(d, {})
        })
    }
    var p = e.i(233971);
    e.s(["default", 0, function(e) {
        let {
            userId: a
        } = e, {
            data: r
        } = (0, n.useQuery)({
            queryKey: ["isYourPrivacyChoicesModalEnabled"],
            queryFn: () => (0, p.getIsYourPrivacyChoicesModalEnabled)().getOrThrow(),
            placeholderData: !1,
            staleTime: 1 / 0
        });
        return r ? (0, t.jsx)(i, {
            userId: a,
            children: (0, t.jsx)(d, {})
        }) : (0, t.jsx)(m, {})
    }], 310119)
}, 268957, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(420482),
        a = e.i(750341),
        r = e.i(708923),
        i = e.i(801827),
        l = e.i(336716);
    let o = (0, a.default)(() => e.A(31611), {
        loadableGenerated: {
            modules: [358424]
        }
    });
    e.s(["default", 0, function() {
        let e = (0, i.useTranslations)("Feature.Tracking"),
            {
                data: a
            } = (0, r.useQuery)({
                queryKey: ["cookie-policy"],
                queryFn: () => (0, l.getCookiePolicy)().getOrThrow(),
                staleTime: 1 / 0
            }),
            [s, c] = (0, n.useState)(!1),
            u = () => {
                c(!1)
            };
        return null != a && a.EssentialCookieList.length > 0 ? (0, t.jsxs)(t.Fragment, {
            children: [(0, t.jsx)("button", {
                type: "button",
                onClick: () => {
                    c(!0)
                },
                className: "hover:content-emphasis",
                children: e("Heading.CookieSettings")
            }), s ? (0, t.jsx)(o, {
                cookiePolicy: a,
                onSubmit: u,
                onClose: u
            }) : null]
        }) : null
    }])
}, 547434, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(750341),
        a = e.i(931070);
    let r = e => e.toLowerCase().replace(/\/+$/u, "") || "/",
        i = new Set(["/", "/createaccount"]),
        l = new Set(["/", "/createaccount", "/giftcards"]),
        o = (0, n.default)(() => e.A(339834), {
            loadableGenerated: {
                modules: [105584]
            }
        });
    e.s(["default", 0, function(e) {
        let {
            userId: n,
            variant: s
        } = e, c = (0, a.usePath)();
        return null != n || l.has(r(c)) ? (0, t.jsx)(o, {
            userId: n,
            isSignUpOrLandingPage: i.has(r(c)),
            variant: s
        }) : null
    }], 547434)
}, 115718, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(750341),
        a = e.i(420482),
        r = e.i(301775),
        i = e.i(736536),
        l = e.i(145420);
    let o = (0, n.default)(() => e.A(802269), {
            loadableGenerated: {
                modules: [412516]
            },
            ssr: !1
        }),
        {
            ModalEvent: s
        } = i.default,
        c = e => {
            e()
        },
        u = !1,
        d = {
            mount: () => {
                u = !0, c(() => i.default.mountSearchLanding())
            },
            show: e => {
                c(() => i.default.showSearchLanding(e))
            },
            updateSessionInfo: e => {
                c(() => i.default.updateSessionInfo(e))
            }
        };
    e.s(["default", 0, function() {
        let [e, n] = (0, a.useState)(null), i = (0, a.useRef)(!1), c = (0, a.useRef)(null);
        (0, a.useEffect)(() => {
            let e = () => {
                    let e = document.getElementById("search-landing-root");
                    null === e ? (0, l.fireEvent)("SearchLandingPageMountError") : n(e)
                },
                t = e => {
                    i.current || (c.current = (e => {
                        if (!(e instanceof CustomEvent)) return null;
                        let t = e.detail;
                        return "object" == typeof t && null !== t && "sessionInfo" in t ? String(t.sessionInfo) : null
                    })(e))
                };
            return window.addEventListener(s.MountSearchLanding, e), window.addEventListener(s.ShowSearchLanding, t), u && e(), () => {
                window.removeEventListener(s.MountSearchLanding, e), window.removeEventListener(s.ShowSearchLanding, t)
            }
        }, []);
        let m = (0, a.useCallback)(() => {
            if (i.current = !0, null !== c.current) {
                let e = c.current;
                c.current = null, d.show(e)
            }
        }, []);
        return e ? (0, r.createPortal)((0, t.jsx)(o, {
            onReady: m
        }), e) : null
    }, "resetMountRequestForTests", 0, () => {
        u = !1
    }, "searchLandingCapability", 0, d])
}, 776771, e => {
    "use strict";
    let t, n;
    var a, r, i, l, o, s, c, u, d, m, p, g, h, f, b, v, A, y, I, E = e.i(19836),
        C = e.i(750341),
        w = e.i(420482),
        S = e.i(285586),
        N = e.i(708923);
    e.i(350223);
    var x = e.i(874296),
        V = e.i(646424),
        T = e.i(552566),
        Z = e.i(587541),
        R = e.i(599965),
        L = e.i(815079),
        P = e.i(380952),
        F = e.i(217827),
        k = e.i(360702),
        X = e.i(645020),
        _ = e.i(932598),
        G = e.i(55001),
        D = e.i(251734),
        B = e.i(778935),
        W = e.i(392435),
        j = e.i(431545);
    let Y = (e, t) => ["trustedFriendAction", e, t?.join(",") ?? void 0],
        U = "RemoveTrustedConnection",
        J = "AddTrustedConnectionViaLink",
        M = "AddTrustedFriendDoubleOptin",
        O = "AddTrustedFriendWithVpc",
        z = "AcceptTrustedFriendViaLinkWithVpcRecipient",
        H = "AcceptTrustedFriendWithVpcRecipient",
        Q = "AcceptTrustedFriendViaLink",
        $ = "AcceptTrustedFriend",
        K = "PendingTrustedConnection",
        q = "PendingIncomingTrustedConnection",
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
        ea = "TrustedFriends",
        er = "NotFriends",
        ei = {
            [U]: ea,
            [J]: er,
            [M]: et,
            [O]: et,
            [K]: et,
            [z]: en,
            [H]: en,
            [Q]: en,
            [$]: en,
            [q]: en
        },
        el = "trustedFriendsOk",
        eo = "sendTrustedFriendRequest",
        es = "acceptTrustedFriend",
        ec = "acceptTrustedFriendViaLink",
        eu = "vpcUpsell",
        ed = "vpcLinkRecipientUpsell",
        em = "noop",
        ep = "addViaLinkEmpty",
        eg = {
            [U]: {
                primary: {
                    textKey: "Action.OK"
                },
                handler: el
            },
            [J]: {
                primary: {
                    textKey: "Button.AddViaLink"
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: ep
            },
            [M]: {
                primary: {
                    textKey: "Action.Add"
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: eo
            },
            [O]: {
                primary: {
                    textKey: "Action.Add",
                    showVpcIcon: !0
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: eu
            },
            [H]: {
                primary: {
                    textKey: "Action.Accept",
                    showVpcIcon: !0
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: eu
            },
            [Q]: {
                primary: {
                    textKey: "Action.Accept"
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: ec
            },
            [$]: {
                primary: {
                    textKey: "Action.Accept"
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: es
            },
            [z]: {
                primary: {
                    textKey: "Action.Accept",
                    showVpcIcon: !0
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: ed
            },
            [K]: {
                primary: {
                    textKey: "Action.Add",
                    isDisabled: !0
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: em
            },
            [q]: {
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
        eh = {
            [et]: {
                title: "TrustedFriend.Label.AddTrustedFriend",
                description: "Description.DoMoreWithTrustedFriends"
            },
            [er]: {
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
            [ea]: {
                title: "TrustedFriend.Info.Modal.Header",
                description: "Description.YouCanDoMoreWithTrustedFriends"
            }
        };
    var ef = e.i(391855);
    let eb = (0, w.createContext)(null),
        ev = () => {
            let e = (0, w.useContext)(eb);
            if (null == e) throw Error("TrustedFriendsModal needs a TrustedFriendsModalHostContext provider");
            return e
        };
    var eA = e.i(245837),
        ey = e.i(10224);
    let eI = () => `${eA.default.friendsApi}/v1`,
        eE = () => ({
            retryable: !0,
            withCredentials: !0
        });
    async function eC(e) {
        let t = {
                url: `${eI()}/users/${e}/accept-trusted-friend-request`,
                ...eE()
            },
            {
                data: n
            } = await ey.post(t, {});
        return n
    }
    async function ew(e, t) {
        let n = t ? `?source=${encodeURIComponent(t)}` : "",
            a = {
                url: `${eI()}/users/${e}/send-trusted-friend-request${n}`,
                ...eE()
            },
            {
                data: r
            } = await ey.post(a, {});
        return r
    }
    async function eS(e, t) {
        let n = {
                url: `${eI()}/users/${e}/validate-trusted-friend-link`,
                ...eE()
            },
            {
                data: a
            } = await ey.post(n, {
                Tokens: t
            });
        return a
    }
    async function eN(e, t) {
        let n = {
                url: `${eI()}/users/${e}/add-trusted-friend-from-link`,
                ...eE()
            },
            {
                data: a
            } = await ey.post(n, {
                Tokens: t
            });
        return a
    }
    async function ex(e) {
        let t = {
                url: `${eI()}/users/${e}/create-trusted-friend-link`,
                ...eE()
            },
            {
                data: n
            } = await ey.post(t, {});
        return n
    }
    async function eV(e, t) {
        let n = t?.friendRequestToken && Array.isArray(t.friendRequestToken) ? t.friendRequestToken.join(",") : void 0,
            a = {
                url: `${eA.default.apiGatewayUrl}/profile-platform-api/v1/profiles/get`,
                ...eE()
            },
            {
                data: r
            } = await ey.post(a, {
                profileType: "User",
                profileId: e,
                components: [{
                    component: "TrustedFriendActions",
                    context: n
                }]
            });
        return r.components?.TrustedFriendActions?.action
    }
    async function eT(e) {
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
    async function eZ(e, t) {
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
    var eR = ((a = {})[a.Invalid = 0] = "Invalid", a[a.PlayerSearch = 1] = "PlayerSearch", a[a.InGame = 2] = "InGame", a[a.UserProfile = 3] = "UserProfile", a[a.QqContactImporter = 4] = "QqContactImporter", a[a.WeChatContactImporter = 5] = "WeChatContactImporter", a[a.QrCode = 6] = "QrCode", a[a.ProfileShare = 7] = "ProfileShare", a[a.PhoneContactImporter = 8] = "PhoneContactImporter", a[a.OffNetworkFriendLink = 9] = "OffNetworkFriendLink", a[a.FriendRecommendations = 10] = "FriendRecommendations", a),
        eL = e.i(735697);
    let eP = {
            [eR.QrCode]: {
                iconName: "icon-filled-squares-grid-qr",
                translationKey: ee.friendRequestOriginQrCode
            },
            [eR.PhoneContactImporter]: {
                iconName: "icon-filled-smartphone-portrait",
                translationKey: ee.friendRequestOriginPhoneContactImporter
            },
            [eR.PlayerSearch]: {
                iconName: "icon-filled-magnifying-glass",
                translationKey: ee.friendRequestOriginPlayerSearch
            }
        },
        eF = {
            mutualFriendCount: 0
        };

    function ek(e) {
        if ("string" == typeof e) {
            let t = Date.parse(e);
            return Number.isFinite(t) ? Math.floor(t / 1e3) : void 0
        }
        if ("object" == typeof e && null !== e && "seconds" in e) {
            let t = e.seconds;
            return "number" == typeof t && t > 0 ? t : void 0
        }
    }
    let eX = e => {
            let {
                userId: t
            } = e, {
                translate: n
            } = (0, j.useTranslation)(), {
                AvatarHeadshot: a,
                useUserNames: r
            } = ev(), {
                data: i,
                isSuccess: l,
                isFetching: o
            } = (0, N.useQuery)({
                queryKey: ["multiProfileInsights", t],
                queryFn: () => (0, eL.fetchMultiProfileInsights)(t),
                refetchOnMount: !1,
                refetchOnWindowFocus: !1,
                refetchOnReconnect: !1
            }), [s, c] = (0, w.useState)(eF);
            (0, w.useEffect)(() => {
                if (!l) return void c(eF);
                let e = i.userInsights?.find(e => e.targetUser === t || String(e.targetUser) === String(t)),
                    n = e?.profileInsights;
                c(function(e) {
                    let t, n, a, r;
                    if (0 === e.length) return {
                        mutualFriendCount: 0
                    };
                    let i = 0;
                    for (let l of e) {
                        l.userAgeVerifiedBracket && (a = l.userAgeVerifiedBracket);
                        let e = l.mutualFriendInsight?.mutualFriends;
                        e && (i = Object.keys(e).length);
                        let o = l.friendshipAgeInsight,
                            s = ek(o?.friendsSinceDateTime);
                        s && (t = s);
                        let c = l.accountCreationDateInsight,
                            u = ek(c?.accountCreatedDateTime);
                        u && (n = new Date(1e3 * u).getFullYear());
                        let d = l.friendRequestOriginInsight;
                        d?.friendRequestOriginSource && (r = eP[d.friendRequestOriginSource])
                    }
                    return {
                        mutualFriendCount: i,
                        friendshipStartUnixSeconds: t,
                        accountCreationYear: n,
                        userAgeVerifiedBracketCatalogKey: a,
                        friendRequestOriginDisplay: r
                    }
                }(Array.isArray(n) ? n : []))
            }, [i, l, t]);
            let {
                mutualFriendCount: u,
                friendshipStartUnixSeconds: d,
                accountCreationYear: m,
                userAgeVerifiedBracketCatalogKey: p,
                friendRequestOriginDisplay: g
            } = s, h = r(t), f = (0, w.useMemo)(() => (function(e, t, n) {
                if (null == e || e <= 0) return "";
                let a = Math.floor(Math.max(0, ((void 0) ?? Math.floor(Date.now() / 1e3)) - e) / 60 / 60 / 24);
                if (a >= 365) {
                    let e = Math.floor(a / 365);
                    return 1 === e ? t(n.connectedOneYear) : t(n.connectedNumYears, {
                        num: e
                    })
                }
                if (a >= 30) {
                    let e = Math.floor(a / 30);
                    return 1 === e ? t(n.connectedOneMonth) : t(n.connectedNumMonths, {
                        num: e
                    })
                }
                return 1 === a ? t(n.connectedOneDay) : a > 1 ? t(n.connectedNumDays, {
                    num: a
                }) : t(n.newFriend)
            })(d, n, ee), [d, n]), b = p ?? "", v = b ? n(b) : "", A = v ? `${n(ee.ageGroupLabel)} ${v}` : "", y = (0, w.useMemo)(() => [{
                id: "age-group",
                iconName: "icon-filled-shield-check",
                label: A
            }, f ? {
                id: "friendship-duration",
                iconName: "icon-filled-calendar",
                label: f
            } : {
                id: "not-a-friend",
                iconName: "icon-filled-triangle-exclamation",
                label: n(ee.notAFriend)
            }, u > 0 ? {
                id: "mutual-friends",
                iconName: "icon-filled-two-people",
                label: n(ee.mutualFriends, {
                    numConnections: u
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
            }), [m, A, f, g, u, n]);
            return (0, E.jsxs)("div", {
                className: "radius-large bg-shift-100 padding-large flex flex-col gap-large",
                children: [(0, E.jsxs)("div", {
                    className: "flex flex-row items-center gap-medium",
                    children: [(0, E.jsxs)("div", {
                        className: "trusted-friend-social-avatar-circle bg-shift-200",
                        children: [(0, E.jsx)(a, {
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
                            children: h?.combinedName ?? ""
                        }), (0, E.jsx)("p", {
                            className: "text-body-medium content-default text-overflow-ellipsis margin-none",
                            children: h?.username ?? ""
                        })]
                    })]
                }), y.length && !o ? (0, E.jsx)("ul", {
                    className: "flex flex-row flex-wrap gap-medium justify-start items-center list-none margin-none padding-none",
                    children: y.map(e => {
                        let {
                            id: t,
                            iconName: n,
                            label: a
                        } = e;
                        return (0, E.jsxs)("li", {
                            className: "inline-flex max-width-full flex-row items-center gap-xsmall",
                            children: [(0, E.jsx)(B.Icon, {
                                name: n,
                                size: "XSmall",
                                className: "content-default shrink-0"
                            }), (0, E.jsx)("span", {
                                className: "text-body-medium content-default min-width-0",
                                children: a
                            })]
                        }, t)
                    })
                }) : null]
            })
        },
        e_ = e => {
            let {
                open: t,
                onClose: n,
                userId: a,
                linkTokens: r,
                onComplete: i,
                modalVariant: l,
                trustedFriendAction: o,
                setToastMessage: s
            } = e, {
                translate: c
            } = (0, j.useTranslation)(), {
                buttonConfig: u,
                performPrimaryAction: d
            } = function(e) {
                let {
                    userId: t,
                    linkTokens: n,
                    trustedFriendAction: a,
                    onClose: r,
                    setToastMessage: i,
                    onComplete: l
                } = e, {
                    translate: o
                } = (0, j.useTranslation)(), s = (0, ef.useQueryClient)(), {
                    startAccessManagementUpsell: c,
                    useUserNames: u
                } = ev(), d = u(t), m = (0, w.useMemo)(() => (function(e) {
                    if (!e || !(e in ei)) return;
                    let t = eg[e];
                    return {
                        primary: t.primary,
                        secondary: t.secondary,
                        handler: t.handler
                    }
                })(a), [a]), p = (0, w.useCallback)(async () => {
                    if (!m) return;
                    let {
                        handler: e
                    } = m, a = d?.username ?? "", u = async () => {
                        await s.invalidateQueries({
                            queryKey: ["trustedFriendStatus", t]
                        }), await s.invalidateQueries({
                            queryKey: Y(t, n)
                        })
                    }, p = async () => {
                        if (!n?.length) throw Error("useGetTrustedFriendsModalButtons: linkTokens required for link accept flow");
                        await eS(t, n), await eN(t, n)
                    }, g = async () => {
                        await eT(ex(t).then(e => {
                            let {
                                link: t
                            } = e;
                            return t
                        })), i(o(ee.trustedFriendLinkCopied)), await u(), await l?.(), r(!0)
                    }, h = async () => {
                        i(o(ee.trustedFriendRequestSent)), await u(), await l?.(), r(!0)
                    }, f = async () => {
                        i(o(ee.acceptedTrustedFriend, {
                            username: a
                        })), await u(), await l?.(), r(!0)
                    }, b = async e => {
                        switch (e) {
                            case el:
                                await l?.(), r(!0);
                                break;
                            case eo:
                                await ew(t), await h();
                                break;
                            case es:
                                await eC(t), await f();
                                break;
                            case ec:
                                await p(), await f();
                                break;
                            case eu:
                                r(!1), await eZ(c, t), await l?.();
                                break;
                            case ed:
                                r(!1), await p(), await eZ(c, t), await l?.();
                                break;
                            case ep:
                                await g()
                        }
                    };
                    try {
                        i(null), await b(e)
                    } catch {
                        i(o(ee.genericError))
                    }
                }, [t, n, o, r, d, i, s, l, m, c]);
                return {
                    buttonConfig: m,
                    performPrimaryAction: p
                }
            }({
                userId: a,
                linkTokens: r,
                trustedFriendAction: o,
                onClose: n,
                setToastMessage: s,
                onComplete: i
            }), m = (0, w.useCallback)(e => {
                e || n(!1)
            }, [n]), p = (0, w.useMemo)(() => eh[l], [l]), g = (0, w.useCallback)(() => {
                u?.primary.isDisabled || d().catch(() => void 0)
            }, [u, d]);
            return (0, E.jsx)(D.Dialog, {
                open: t,
                onOpenChange: m,
                size: "Medium",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: "Close",
                children: (0, E.jsxs)(D.DialogContent, {
                    children: [(0, E.jsxs)(D.DialogBody, {
                        className: "flex flex-col gap-medium",
                        children: [(0, E.jsx)(D.DialogTitle, {
                            className: "text-heading-small margin-none",
                            children: c(p.title)
                        }), (0, E.jsxs)("div", {
                            className: "text-body-medium content-default flex flex-col gap-xsmall",
                            children: [c(p.description), (0, E.jsx)("a", {
                                href: "https://help.roblox.com/hc/articles/37725513985812",
                                target: "_blank",
                                rel: "noreferrer",
                                className: "trusted-friends-modal-learn-more-link text-body-medium content-default",
                                children: c(ee.learnMore)
                            })]
                        }), (0, E.jsx)(eX, {
                            userId: a
                        })]
                    }), (0, E.jsx)(D.DialogFooter, {
                        className: "flex flex-col gap-small",
                        children: (0, E.jsxs)("div", {
                            className: "flex width-full min-width-0 flex-row gap-small items-center",
                            children: [(0, E.jsx)(G.Button, {
                                variant: "Emphasis",
                                size: "Medium",
                                className: "fill min-width-0 flex-1 basis-0",
                                isDisabled: u?.primary.isDisabled === !0,
                                onClick: g,
                                children: (0, E.jsxs)("span", {
                                    className: "flex width-full min-width-0 flex-row items-center justify-center gap-small",
                                    children: [u?.primary.showVpcIcon ? (0, E.jsx)(B.Icon, {
                                        name: "icon-regular-lock-closed",
                                        size: "Medium",
                                        className: "flex shrink-0 items-center justify-center",
                                        "aria-hidden": !0
                                    }) : null, (0, E.jsx)("span", {
                                        className: "min-width-0",
                                        children: c(u?.primary.textKey ?? "")
                                    })]
                                })
                            }), u?.secondary ? (0, E.jsx)(G.Button, {
                                variant: "Standard",
                                size: "Medium",
                                className: "fill min-width-0 flex-1 basis-0",
                                onClick: () => {
                                    n(!1)
                                },
                                children: c(u.secondary.textKey)
                            }) : null]
                        })
                    })]
                })
            })
        },
        eG = e => {
            let {
                open: t,
                onClose: n,
                userId: a,
                linkTokens: r,
                onComplete: i
            } = e, {
                translate: l
            } = (0, j.useTranslation)(), {
                startAccessManagementUpsell: o
            } = ev(), {
                data: s,
                isFetched: c,
                refetch: u
            } = (0, N.useQuery)({
                queryKey: Y(a, r),
                queryFn: () => eV(a, {
                    friendRequestToken: r
                }),
                enabled: t,
                refetchOnMount: !1,
                refetchOnWindowFocus: !1,
                refetchOnReconnect: !1
            }), [d, m] = (0, w.useState)(null), p = (0, w.useCallback)(() => {
                m(null)
            }, []), g = (0, w.useMemo)(() => t && c ? s && s in ei ? ei[s] : "invalid" : "pending", [t, c, s]), h = (0, w.useCallback)(async () => {
                try {
                    await o({
                        featureName: "TriggerAgeCheckUpsellIncludingVPC",
                        namespace: "core_content/CoreContent",
                        isAsyncCall: !1,
                        usePrologue: !0,
                        featureSpecificData: {
                            context: "trusted-friends-modal"
                        }
                    }) ? u().catch(() => void 0) : n(!1)
                } catch {
                    n(!1)
                }
            }, [n, u, o]);
            (0, w.useEffect)(() => {
                if ("pending" !== g) {
                    if ("UnlockTrustedFriendByFAE" === s) return void h().catch(() => void 0);
                    "invalid" === g && (m(l(ee.genericError)), n(!1))
                }
            }, [g, s, l, n, h]);
            let f = !(!t || "pending" === g || "invalid" === g);
            return (0, E.jsxs)(w.default.Fragment, {
                children: [d ? (0, E.jsx)(W.Snackbar, {
                    title: d,
                    onClose: p,
                    shouldAutoDismiss: !0
                }) : null, f && (0, E.jsx)(e_, {
                    open: t,
                    onClose: n,
                    userId: a,
                    linkTokens: r,
                    onComplete: i,
                    modalVariant: g,
                    trustedFriendAction: s,
                    setToastMessage: m
                })]
            })
        };
    var eD = e.i(266712),
        eB = e.i(44170),
        eW = e.i(145420),
        ej = e.i(175067),
        eY = e.i(460987),
        eU = e.i(100266),
        eJ = e.i(723941),
        eM = e.i(476752),
        eO = e.i(851460),
        ez = ((r = {}).GameDetails = "game_details", r.Profile = "profile", r.Home = "home", r.Games = "games", r.Avatar = "avatar", r.Catalog = "catalog", r.Friends = "friends", r.ItemDetails = "item_details", r.Navigation = "navigation", r.PlaceId = "placeId", r.UserId = "userId", r.ShareLinks = "share_links", r.Chat = "chat", r.GiftCards = "gift_cards", r.NotificationSettings = "notification_settings", r.AccountInfo = "account_info", r.PrivacySettings = "privacy_settings", r.AppPermissionsSettings = "app_permissions_settings", r.ScreentimeSubsettings = "screentime_subsettings", r.BlockedExperiencesSubsettings = "blocked_experiences_subsettings", r.BlockedUsersSubsettings = "blocked_users_subsettings", r.ExperienceChatSubsettings = "experience_chat_subsettings", r.PartySubsettings = "party_subsettings", r.VoiceSubsettings = "voice_subsettings", r.CommunicationSettings = "communication_settings", r.CommunicationSubsettings = "communication_subsettings", r.TradingInventorySubsettings = "trading_inventory_subsettings", r.PrivateServerSubsettings = "private_server_subsettings", r.FriendsContactsSubsettings = "friends_contacts_subsettings", r.VisibilitySubsettings = "visibility_subsettings", r.ParentalControls = "parental_controls", r.SpendingSettings = "spending_settings", r.RobuxSettings = "robux_settings", r.Group = "group", r.ExternalWebUrl = "external_web_link", r.SecurityAlert = "security_alert", r.Fae = "fae", r.Messages = "messages", r.BuyRobux = "buy_robux", r.CurrencyTransfer = "currency_transfer", r.ProfileCard = "profile_card", r.AmpWizard = "amp_wizard", r.SupportCenter = "support_center", r.PlusUpsell = "plus_upsell", r.PlusReferralDashboard = "plus_referral_dashboard", r.PlusSubscribe = "plus_subscribe", r.PlusWebview = "plus_webview", r.AcceptGift = "accept_gift", r.Moments = "moments", r);
    (i = {}).Asset = "Asset", i.Bundle = "Bundle", i.Look = "Look";
    let eH = {
            Asset: "/catalog",
            Bundle: "/bundles",
            Look: "/looks"
        },
        eQ = {
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
        e$ = {
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
        eK = (e, t, n) => ({
            type: "linkResolved",
            context: "deepLink",
            params: {
                linkType: n,
                linkStatus: e,
                linkId: t
            }
        }),
        eq = "DeeplinkParserExperienceDetailsResolutionFailed",
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
    var e2 = ((l = e2 || {}).PROFILE_SHARE = "ProfileShare", l.QR_CODE = "QrCode", l),
        e1 = ((o = e1 || {}).AVATAR_ITEM_DETAILS = "AvatarItemDetails", o.AVATAR_ITEM_AFFILIATE = "AvatarItemAffiliate", o.CONTENT_POST = "ContentPost", o.EXPERIENCE_INVITE = "ExperienceInvite", o.EXPERIENCE_AFFILIATE = "ExperienceAffiliate", o.FRIEND_INVITE = "FriendInvite", o.NOTIFICATION_EXPERIENCE_INVITE = "NotificationExperienceInvite", o.PROFILE = "Profile", o.SCREENSHOT_INVITE = "ScreenshotInvite", o.SERVER = "Server", o.EXPERIENCE_DETAILS = "ExperienceDetails", o.EXPERIENCE_EVENT = "ExperienceEvent", o),
        e5 = ((s = e5 || {}).EXPERIENCE_V2 = "ExperienceV2", s.USER_TRUSTED_CONNECTION = "UserTrustedConnection", s.STUDIO_TRUSTED_CONNECTION = "StudioTrustedConnection", s.MOMENTS = "Moments", s.SCHOOL_INVITE = "SchoolInvite", s.REFERRAL = "Referral", s),
        e3 = ((c = e3 || {}).VALID = "Valid", c.EXPIRED = "Expired", c.INVITER_NOT_IN_EXPERIENCE = "InviterNotInExperience", c),
        e9 = ((u = e9 || {}).VALID = "Valid", u.EXPIRED = "Expired", u.CONSUMED = "Consumed", u.SENDER_BLOCKED_RECIPIENT = "SenderBlockedRecipient", u.INVALID = "Invalid", u),
        e4 = ((d = e4 || {}).VALID = "Valid", d.SENDER_BLOCKED_RECIPIENT = "SenderBlockedRecipient", d.INVALID = "Invalid", d),
        e8 = ((m = e8 || {}).VALID = "Valid", m.EXPIRED = "Expired", m.INVITER_NOT_IN_EXPERIENCE = "InviterNotInExperience", m),
        e7 = ((p = e7 || {}).INVALID = "Invalid", p.VALID = "Valid", p.EXPIRED = "Expired", p),
        e6 = ((g = e6 || {}).INVALID = "Invalid", g.EXPIRED = "Expired", g.VALID = "Valid", g),
        te = ((h = te || {}).Zendesk = "zendesk", h),
        tt = ((f = tt || {}).INVALID = "Invalid", f.EXPIRED = "Expired", f.VALID = "Valid", f),
        tn = ((b = tn || {}).INVALID = "Invalid", b.VALID = "Valid", b),
        ta = ((v = ta || {}).INVALID = "Invalid", v.EXPIRED = "Expired", v.VALID = "Valid", v),
        tr = ((A = tr || {}).INVALID = "Invalid", A.VALID = "Valid", A),
        ti = ((y = ti || {})[y.INVALID = 0] = "INVALID", y[y.PROFILE = 1] = "PROFILE", y[y.HOME = 2] = "HOME", y);
    let tl = (e, t, n, a, r, i, l) => ({
            rootPlaceId: e,
            placeId: t,
            gameInstanceId: n,
            playerId: a,
            privateServerLinkCode: r,
            referredByPlayerId: i,
            joinData: l
        }),
        to = (e, t) => {
            let [n, a] = e.split("?"), r = new URLSearchParams(a);
            return t && (t.launchData && "" !== t.launchData && r.append("launchData", t.launchData), t.experienceEventId && "" !== t.experienceEventId && r.append("eventId", t.experienceEventId)), `${n}?${r.toString()}`
        },
        ts = async e => {
            let t;
            try {
                await Promise.race([e(), new Promise(e => {
                    t = setTimeout(e, 5e3)
                })])
            } catch {} finally {
                clearTimeout(t)
            }
        }, tc = /\/(\w+)/g, tu = /(\w+)=([^&=]+)/g, td = e => {
            let t = [],
                n = {},
                a = tc.exec(e);
            for (; null != a;) t.push(a[1]), a = tc.exec(e);
            let r = tu.exec(e);
            for (; null != r;) {
                let [, t, a] = r;
                n[t] = a, r = tu.exec(e)
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
        th = e.i(82927),
        tf = e.i(126392);
    let tb = {
            subscribe: (e, t, n) => {
                let a, r = !0;
                return (0, F.getRealtimeClient)().then(i => {
                    if (r) {
                        if (null == i) return void n?.(Error("The realtime client did not load"));
                        i.Subscribe(e, t), a = () => {
                            i.Unsubscribe(e, t)
                        }
                    }
                }), () => {
                    r = !1, a?.()
                }
            },
            subscribeToConnectionEvents: (e, t, n, a) => (0, F.getRealtimeClient)().then(r => {
                if (null == r) return Promise.reject(Error("The realtime client did not load"));
                r.SubscribeToConnectionEvents(e, t, n, a)
            })
        },
        tv = {
            avatarHeadshot: "AvatarHeadShot",
            gameIcon: "GameIcon",
            groupIcon: "GroupIcon",
            assetThumbnail: "Asset",
            bundleThumbnail: "BundleThumbnail",
            gamePassIcon: "GamePass"
        },
        tA = ["names.combinedName", "names.username"],
        ty = {
            startAccessManagementUpsell: e => (0, eD.startAccessManagementUpsell)(e),
            AvatarHeadshot: e => {
                let {
                    userId: t,
                    className: n
                } = e;
                return (0, E.jsx)(R.Thumbnail2d, {
                    type: "AvatarHeadShot",
                    size: "48x48",
                    format: "webp",
                    targetId: t,
                    containerClassName: n,
                    includeProfileFrame: !0
                })
            },
            useUserNames: e => (0, eU.useUserProfiles)([e], tA).data[e]?.names ?? void 0
        },
        tI = (e, t) => V.postUntyped(Z.Url.parse(e).getOrThrow(), t, {
            credentials: "include"
        }).getOrThrow().then(e => ({
            data: e
        })),
        tE = (e, t) => V.get(Z.Url.parse(`${eA.default.gamesApi}${e}`).getOrThrow(), t, {
            credentials: "include"
        }),
        tC = e => {
            let t = (0, ej.getGameLauncher)();
            return null != t && (t.joinMultiplayerGame((0, eY.withJoinAttemptId)({
                placeId: e,
                isPlayTogetherGame: !1
            })), !0)
        },
        {
            navigateToDeepLink: tw
        } = (I = {
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
                (0, eW.fireEvent)(e)
            },
            resolveShareLinks: (e, t) => tI(`${eA.default.shareLinksApi}/v1/resolve-link`, {
                linkId: e,
                linkType: t
            }),
            resolveShareLinksV2: e => tI(`${eA.default.shareLinksApiV2}/v2/resolve`, {
                linkId: e
            }),
            getPlaceIdFromUniverseId: e => tE(`/v1/games?universeIds[]=${e}`, x.object({
                data: x.array(x.object({
                    rootPlaceId: x.optional(x.number())
                }))
            })).andThen(t => {
                let {
                    data: n
                } = t, a = n[0]?.rootPlaceId;
                return a ? (0, k.ok)(a) : (0, k.err)(Error(`Root place ID not found for universe ID: ${e}`))
            }).getOrThrow(),
            getUniverseIdFromPlaceId: e => tE(`/v1/games/multiget-place-details?placeIds=${String((0,X.parseInt)(e))}`, x.array(x.object({
                universeId: x.optional(x.number())
            }))).andThen(t => {
                let n = t[0]?.universeId;
                return n ? (0, k.ok)(n) : (0, k.err)(Error(`Universe ID not found for place ID: ${e}`))
            }).getOrThrow(),
            launchGame: function() {
                let e;
                for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
                let [r, i] = n, l = (0, ej.getGameLauncher)();
                if (null == l) return;
                let o = (0, _.generateRandomUuid)(),
                    s = i.gamePlayIntentEventCtx,
                    c = {
                        ...i.properties,
                        joinAttemptId: o
                    },
                    {
                        rootPlaceId: u,
                        placeId: d,
                        gameInstanceId: m,
                        playerId: p,
                        joinData: g,
                        privateServerLinkCode: h,
                        referredByPlayerId: f
                    } = r;
                if (null == d) return;
                let b = (e, t) => {
                    (0, tp.sendEventWithTarget)(i.eventName, i.ctx, {
                        ...c,
                        ...e
                    }), (0, tp.sendGamePlayEvent)(s, t, void 0, o)
                };
                return d === u && m ? (b({
                    gameInstanceId: m
                }, u), e = l.joinGameInstance((0, eY.withJoinAttemptId)({
                    placeId: d,
                    gameId: m,
                    isPlayTogetherGame: !0,
                    referredByPlayerId: f
                }, o, s))) : u && p ? (b({
                    playerId: p
                }, u), e = l.followPlayerIntoGame((0, eY.withJoinAttemptId)({
                    userId: p
                }, o, s))) : h ? (b({}, d), e = l.joinPrivateGame((0, eY.withJoinAttemptId)({
                    placeId: d,
                    accessCode: null,
                    linkCode: h
                }, o, s))) : (b({}, d), e = l.joinMultiplayerGame((0, eY.withJoinAttemptId)({
                    placeId: d,
                    launchData: g?.launchData,
                    eventId: g?.eventId,
                    isPlayTogetherGame: !1,
                    referredByPlayerId: f
                }, o, s))), e
            },
            joinMultiplayerGame: tC,
            startGameWithDeepLinkUrl: (e, t) => {
                let n = (0, ej.getGameLauncher)();
                return null != n && (n.startGameWithDeepLinkUrl(e, t), !0)
            },
            startDeepLinkFlow: e => {
                let t = (0, ej.getGameLauncher)();
                return null != t && (t.startDeepLinkFlow(e), !0)
            },
            openStudio: e => {
                let {
                    placeId: t,
                    universeId: n,
                    startTeamTest: a,
                    instanceId: r,
                    annotationId: i
                } = e, l = (0, ej.getGameLauncher)();
                return !!t && !!n && null != l && (l.editGameInStudio({
                    placeId: t,
                    universeId: n,
                    startTeamTest: a,
                    instanceId: r,
                    annotationId: i
                }), !0)
            },
            startAccessManagementUpsell: e => (0, eD.startAccessManagementUpsell)(e),
            startChat: e => {
                (0, tm.getDeviceMeta)().isInApp ? window.location.href = `roblox://navigation/chat?userId=${e}&entryPoint=AppShellWebView` : document.dispatchEvent(new CustomEvent("Roblox.Chat.StartChat", {
                    detail: {
                        userId: (0, X.parseInt)(e)
                    }
                })), (0, tp.sendEventWithTarget)("startChatByUser", "click", {
                    userId: e
                })
            },
            getQueryParam: e => (0, th.getQueryParam)(e),
            getHelpDeskUrl: (e, t) => (0, tg.getHelpDeskUrl)(e, t)
        }, n = {
            [ez.Navigation]: e => ((e, t) => {
                let n, {
                        path: a,
                        params: r
                    } = t,
                    i = a[1];
                if (eQ[i])
                    for (let [e, t] of(n = eQ[i], Object.entries(r))) n = n.replace(`{${e}}`, t);
                else if (i === ez.ItemDetails.valueOf() && r.itemType && r.itemId) n = `${eH[r.itemType]}/${r.itemId}`;
                else if (i === ez.GameDetails && r.gameId) return e.getPlaceIdFromUniverseId(r.gameId).then(e => !!e && (window.location.href = `${e$.Games}/${e}`, !0)).catch(() => !1);
                else if (i === ez.Profile || i === ez.ProfileCard) r.userId ? n = `${e$.Users}/${r.userId}${e$.Profile}` : r.groupId && (n = `${e$.Groups}/${r.groupId}`);
                else if (i === ez.GiftCards) n = e$.GiftCards;
                else if (i === ez.ShareLinks) {
                    if ("v2" === r.v && void 0 !== r.code) {
                        let n = r.code || "";
                        return e.resolveShareLinksV2(r.code).then(async a => {
                            if ("Referral" === a.data.linkType) {
                                let t = a.data.status,
                                    r = eK(t, n, e5.REFERRAL);
                                e.sendEvent(r.type, r.context, r.params), "Valid" !== t && e.fireCounter("DeeplinkParserRobloxPlusReferralResolutionFailed");
                                let i = a.data.targetId ? `&referrerId=${a.data.targetId}` : "",
                                    l = "Valid" === t ? `referralCode=${n}${i}` : `referralStatus=${t}`;
                                return window.location.href = `${e$.Plus}?ctx=plus_referral&${l}`, !0
                            }
                            if ("Invalid" === a.data.status) return !1;
                            let i = eK(a.data.status, n, e5.EXPERIENCE_V2);
                            if (e.sendEvent(i.type, i.context, i.params), "Experience" === a.data.linkType && a.data.targetId) {
                                let t = a.data.customData || "{}";
                                await ts(() => e.launchGame(tl(a.data.targetId, a.data.targetId, void 0, void 0, void 0, void 0, {
                                    launchData: t
                                }), e0(a.data.targetId, n, a.data.status))), window.location.href = `${e$.Games}/${a.data.targetId}`
                            } else if (("StudioEdit" === a.data.linkType || "StudioTeamTest" === a.data.linkType) && a.data.targetId) return e.getUniverseIdFromPlaceId(a.data.targetId).then(t => {
                                let n = t.toString();
                                if (!n) return !1;
                                let i = "StudioTeamTest" === a.data.linkType,
                                    l = {};
                                return "StudioEdit" === a.data.linkType && (r.instanceId && (l.instanceId = r.instanceId), r.annotationId && (l.annotationId = r.annotationId)), !1 !== e.openStudio({
                                    placeId: a.data.targetId,
                                    universeId: n,
                                    startTeamTest: i,
                                    instanceId: l.instanceId,
                                    annotationId: l.annotationId
                                })
                            }).catch(() => !1);
                            else if (("UserTrustedConnection" === a.data.linkType || "StudioTrustedConnection" === a.data.linkType) && a.data.targetId) {
                                if (!(0, X.parseInt)(a.data.targetId)) return !1;
                                let r = "UserTrustedConnection" === a.data.linkType ? e5.USER_TRUSTED_CONNECTION : e5.STUDIO_TRUSTED_CONNECTION,
                                    i = eK(a.data.status, n, r);
                                e.sendEvent(i.type, i.context, i.params), r === e5.USER_TRUSTED_CONNECTION && (window.location.href = t.url), window.location.href = `${e$.Users}/${a.data.targetId}${e$.Profile}?trustedFriendLinkCode=${n}`
                            } else if ("Moments" === a.data.linkType && a.data.targetId) {
                                let r = eK(a.data.status, n, e5.MOMENTS);
                                e.sendEvent(r.type, r.context, r.params), window.location.href = t.url, window.location.href = "roblox://navigation/moments"
                            } else if ("SchoolInvite" === a.data.linkType) {
                                let r = eK(a.data.status, n, e5.SCHOOL_INVITE);
                                if (e.sendEvent(r.type, r.context, r.params), "Valid" !== a.data.status) return e.fireCounter("DeeplinkParserSchoolInviteResolutionFailed"), !1;
                                e.startDeepLinkFlow(t.url) || (window.location.href = t.url)
                            }
                            return !0
                        }).catch(() => !1)
                    }
                    switch (r.type) {
                        case e1.EXPERIENCE_INVITE:
                            if (null != r.code) {
                                let {
                                    code: t
                                } = r;
                                return e.resolveShareLinks(r.code, e1.EXPERIENCE_INVITE).then(async n => {
                                    let a = n?.data?.experienceInviteData;
                                    if (a?.placeId == null) return !1;
                                    let i = eK(a.status, t, e1.EXPERIENCE_INVITE);
                                    return (e.sendEvent(i.type, i.context, i.params), a.status === e3.VALID && a.instanceId) ? (await ts(() => e.launchGame(tl(a.placeId, a.placeId, a.instanceId, void 0, void 0, a.inviterId), e0(a.placeId.toString(), t, a.status))), window.location.href = `${e$.Games}/${a.placeId}`, !0) : (a.status === e3.EXPIRED || a.status === e3.INVITER_NOT_IN_EXPERIENCE) && (window.localStorage.setItem("ref_info", (0, eM.stringToBase64)(eJ.serialize({
                                        [a.placeId.toString()]: a.inviterId.toString()
                                    }).value)), window.location.href = `${e$.Games}/${a.placeId}?experienceInviteLinkId=${r.code}&experienceInviteStatus=${a.status}`, !0)
                                }).catch(() => (e.fireCounter("DeeplinkParserInviteResolutionFailed"), !1))
                            }
                            break;
                        case e1.NOTIFICATION_EXPERIENCE_INVITE:
                            if (r.code) return e.resolveShareLinks(r.code, e1.NOTIFICATION_EXPERIENCE_INVITE).then(t => {
                                let n = t?.data?.notificationExperienceInviteData;
                                if (n?.placeId) {
                                    let t = n.instanceId && n.status === e3.VALID,
                                        a = `${e$.ExperienceLauncher}placeId=${n.placeId}${n.launchData?`&launchData=${encodeURIComponent(encodeURIComponent(n.launchData))}`:""}${t?`&gameInstanceId=${n.instanceId}`:""}${n.inviterId?`&referredByPlayerId=${n.inviterId}`:""}`;
                                    return !1 !== e.startGameWithDeepLinkUrl(a, n.placeId)
                                }
                                return !1
                            }).catch(() => (e.fireCounter("DeeplinkParserNotificationInviteResolutionFailed"), !1));
                            break;
                        case e1.FRIEND_INVITE:
                            if (r.code) {
                                let {
                                    code: t
                                } = r;
                                return e.resolveShareLinks(r.code, e1.FRIEND_INVITE).then(n => {
                                    let a = n?.data?.friendInviteData;
                                    if (a?.senderUserId == null) return !1;
                                    let r = eK(a.status, t, e1.FRIEND_INVITE);
                                    return e.sendEvent(r.type, r.context, r.params), (a.status === e9.VALID || a.status === e9.CONSUMED || a.status === e9.EXPIRED) && (window.location.href = `${e$.Users}/${a.senderUserId}${e$.Profile}`, !0)
                                }).catch(() => (e.fireCounter("DeeplinkParserFriendRequestResolutionFailed"), !1))
                            }
                            break;
                        case e1.PROFILE:
                            if (r.code) {
                                let {
                                    code: t
                                } = r;
                                return e.resolveShareLinks(r.code, e1.PROFILE).then(n => {
                                    let a = n?.data?.profileLinkResolutionResponseData;
                                    if (a?.userId == null) return !1;
                                    let r = eK(a.status, t, e1.PROFILE);
                                    if (e.sendEvent(r.type, r.context, r.params), a.status === e4.VALID) {
                                        let t = (e => {
                                            switch (e?.toLowerCase()) {
                                                case e2.PROFILE_SHARE.toLowerCase():
                                                    return e2.PROFILE_SHARE;
                                                case e2.QR_CODE.toLowerCase():
                                                default:
                                                    return e2.QR_CODE
                                            }
                                        })(e.getQueryParam("source"));
                                        return window.location.href = `${e$.Users}/${a.userId}${e$.Profile}?friendshipSourceType=${t}`, !0
                                    }
                                    return !1
                                }).catch(() => (e.fireCounter("DeeplinkParserProfileShareResolutionFailed"), !1))
                            }
                            break;
                        case e1.SCREENSHOT_INVITE:
                            if (r.code) {
                                let {
                                    code: t
                                } = r;
                                return e.resolveShareLinks(r.code, e1.SCREENSHOT_INVITE).then(n => {
                                    let a = n?.data?.screenshotInviteData;
                                    if (a?.placeId == null || ![e8.EXPIRED, e8.INVITER_NOT_IN_EXPERIENCE, e8.VALID].includes(a.status)) return !1;
                                    let i = eK(a.status, t, e1.SCREENSHOT_INVITE);
                                    if (e.sendEvent(i.type, i.context, i.params), a.status === e8.EXPIRED || a.status === e8.INVITER_NOT_IN_EXPERIENCE) return window.location.href = `${e$.Games}/${a.placeId}?experienceInviteLinkId=${r.code}&experienceInviteStatus=${a.status}`, !0;
                                    let l = `${e$.ExperienceLauncher}placeId=${a.placeId}`;
                                    return a.launchData && (l += `&launchData=${encodeURIComponent(encodeURIComponent(a.launchData))}`), a.instanceId && (l += `&gameInstanceId=${a.instanceId}`), !1 !== e.startGameWithDeepLinkUrl(l, a.placeId)
                                }).catch(() => (e.fireCounter("DeeplinkParserScreenshotInviteShareResolutionFailed"), !1))
                            }
                            break;
                        case e1.SERVER:
                            if (r.code) {
                                let {
                                    code: t
                                } = r;
                                return e.resolveShareLinks(r.code, e1.SERVER).then(n => {
                                    let a = n?.data?.privateServerInviteData;
                                    return a?.universeId != null && !![e7.VALID, e7.EXPIRED].includes(a.status) && (e.getPlaceIdFromUniverseId(a.universeId.toString()).then(n => {
                                        if (!n) return !1;
                                        let r = eK(a.status, t, e1.SERVER);
                                        return e.sendEvent(r.type, r.context, r.params), window.location.href = `${e$.Games}/${n}?privateServerLinkCode=${a.linkCode}`, !0
                                    }).catch(() => !1), !0)
                                }).catch(() => (e.fireCounter("DeeplinkParserPrivateServerLinkResolutionFailed"), !1))
                            }
                            break;
                        case e1.EXPERIENCE_AFFILIATE: {
                            if (!r.code) break;
                            let {
                                code: t
                            } = r;
                            return e.resolveShareLinks(r.code, e1.EXPERIENCE_AFFILIATE).then(n => {
                                let a = n?.data?.experienceAffiliateData;
                                if (a?.status !== tn.VALID) return !1;
                                if (a?.universeId == null) {
                                    let n = eK(a.status, t, e1.EXPERIENCE_AFFILIATE);
                                    if (e.sendEvent(n.type, n.context, n.params), a.fallbackType === ti.PROFILE && a.fallbackId) window.location.href = `${e$.Users}/${a.fallbackId}${e$.Profile}`;
                                    else {
                                        let e = `${window.location.protocol}/${window.location.hostname}${window.location.pathname}?type=${e1.EXPERIENCE_AFFILIATE}&code=${r.code}`;
                                        window.location.href = `/?referralUrl=${encodeURIComponent(e)}`
                                    }
                                    return !0
                                }
                                return e.getPlaceIdFromUniverseId(a.universeId.toString()).then(n => {
                                    if (!n) return !1;
                                    let i = eK(a.status, t, e1.EXPERIENCE_AFFILIATE);
                                    e.sendEvent(i.type, i.context, i.params);
                                    let l = `${window.location.protocol}//${window.location.hostname}${window.location.pathname}?type=${e1.EXPERIENCE_AFFILIATE}&code=${r.code}`,
                                        o = `${e$.Games}/${n}?shareLinkSourceType=${e1.EXPERIENCE_AFFILIATE}&referralUrl=${encodeURIComponent(l)}`;
                                    return o = to(o, a.joinData), window.location.href = o, !0
                                }).catch(() => !1)
                            }).catch(() => (e.fireCounter(eq), !1))
                        }
                        case e1.EXPERIENCE_DETAILS: {
                            if (!r.code) break;
                            let {
                                code: t
                            } = r;
                            return e.resolveShareLinks(r.code, e1.EXPERIENCE_DETAILS).then(n => {
                                let a = n?.data?.experienceDetailsInviteData;
                                return a?.universeId != null && a.status === e6.VALID && e.getPlaceIdFromUniverseId(a.universeId.toString()).then(n => {
                                    if (!n) return !1;
                                    let r = eK(a.status, t, e1.EXPERIENCE_DETAILS);
                                    return e.sendEvent(r.type, r.context, r.params), window.location.href = `${e$.Games}/${n}?shareLinkSourceType=${e1.EXPERIENCE_DETAILS}`, !0
                                }).catch(() => !1)
                            }).catch(() => (e.fireCounter(eq), !1))
                        }
                        case e1.AVATAR_ITEM_DETAILS:
                        case e1.AVATAR_ITEM_AFFILIATE: {
                            if (!r.code) break;
                            let {
                                code: t
                            } = r, n = r.type === e1.AVATAR_ITEM_AFFILIATE ? e1.AVATAR_ITEM_AFFILIATE : e1.AVATAR_ITEM_DETAILS;
                            return e.resolveShareLinks(r.code, n).then(a => {
                                let i = a?.data?.avatarItemDetailsData;
                                if (i?.itemId == null || "" === i.itemId || "0" === i.itemId || !(i.itemType in e$) || i.status !== tt.VALID) return !1;
                                let l = i.itemType,
                                    o = eK(i.status, t, n);
                                return e.sendEvent(o.type, o.context, o.params), window.location.href = `${e$[l]}/${i.itemId}?pid=share&is_retargeting=false&deep_link_value=${r.code}`, !0
                            }).catch(() => (e.fireCounter(n === e1.AVATAR_ITEM_AFFILIATE ? "DeeplinkParserAvatarItemAffiliateResolutionFailed" : "DeeplinkParserAvatarItemDetailsResolutionFailed"), !1))
                        }
                        case e1.CONTENT_POST: {
                            if (!r.code) break;
                            let {
                                code: t
                            } = r;
                            return e.resolveShareLinks(r.code, e1.CONTENT_POST).then(n => {
                                let a = n?.data?.contentPostData;
                                if (!a || a.status !== ta.VALID) return !1;
                                let r = eK(a.status, t, e1.CONTENT_POST);
                                return e.sendEvent(r.type, r.context, r.params), window.location.href = `${e$.AppLauncher}${e$.ContentPost}?userId=${a.postCreatorId}&postId=${a.postId}`, window.location.href = `${e$.Users}/${a.postCreatorId}${e$.Profile}`, !0
                            }).catch(() => (e.fireCounter("DeeplinkParserContentPostResolutionFailed"), !1))
                        }
                        case e1.EXPERIENCE_EVENT: {
                            if (!r.code) break;
                            let {
                                code: t
                            } = r;
                            return e.resolveShareLinks(r.code, e1.EXPERIENCE_EVENT).then(n => {
                                let a = n?.data?.experienceEventData;
                                if (a?.universeId == null || !a.placeId || a.status !== tr.VALID) return !1;
                                let r = eK(a.status, t, e1.EXPERIENCE_EVENT);
                                e.sendEvent(r.type, r.context, r.params);
                                let i = `${e$.ExperienceLauncher}placeId=${a.placeId}`;
                                return i = to(i, a.joinData), !1 !== e.startGameWithDeepLinkUrl(i, a.placeId)
                            }).catch(() => (e.fireCounter("DeeplinkParserExperienceEventResolutionFailed"), !1))
                        }
                    }
                } else if (i === ez.Chat && r.userId) return e.startChat(r.userId), Promise.resolve(!0);
                else if (i === ez.ExternalWebUrl) {
                    let t;
                    if (r.domain === te.Zendesk) {
                        let {
                            articleId: n,
                            locale: a
                        } = r;
                        (t = e.getHelpDeskUrl(a, n)) && window.open(t, "_blank")
                    }
                    return Promise.resolve(!!t)
                } else if (i === ez.Avatar) n = Object.keys(r).length ? t.url : e$.Avatar;
                else if (i === ez.Group) r.groupId && (n = r.forumCategoryId && r.forumPostId && r.forumCommentId ? `${e$.Groups}/${r.groupId}#!/forums/category-${r.forumCategoryId}/post/post-${r.forumPostId}/comment/${r.forumCommentId}` : `${e$.Groups}/${r.groupId}`);
                else if (i === ez.SupportCenter) n = r.universeId && r.ticketId ? `${e$.SupportCenter}#!/tickets/${r.universeId}/${r.ticketId}` : e$.SupportCenter;
                else if (i === ez.SecurityAlert) n = r.payload && r.username ? `${e$.SecurityAlert}?payload=${r.payload}&username=${r.username}` : `${e$.SecurityAlert}?payload=null&username=`;
                else if (i === ez.Fae) {
                    let t = e.startAccessManagementUpsell({
                        featureName: "TriggerAgeVerifyRecourse",
                        namespace: "social/Upsells"
                    });
                    return t ? t.then(() => !0).catch(() => !1) : Promise.resolve(!1)
                } else if (i === ez.CurrencyTransfer) {
                    let a = r.transferrequestid ?? r.transferRequestId ?? r.transferrequestId,
                        i = (r.direction ?? r.Direction)?.toLowerCase(),
                        l = r.userid ?? r.userId,
                        o = r.transferorigination ?? r.transferOrigination;
                    if (a || "send" === i && l && o) {
                        let a = e.getDeviceMeta();
                        if (a?.isDesktop && e.startDeepLinkFlow(t.url)) return Promise.resolve(!0);
                        n = t.url
                    }
                } else if (i === ez.AcceptGift) {
                    if (r.giftId) {
                        let a = e.getDeviceMeta();
                        if (a?.isDesktop && e.startDeepLinkFlow(t.url)) return Promise.resolve(!0);
                        n = t.url
                    }
                } else if (i === ez.Moments) {
                    let a = e.getDeviceMeta();
                    if (a?.isDesktop && e.startDeepLinkFlow(t.url)) return Promise.resolve(!0);
                    n = t.url
                } else if (i === ez.AmpWizard) n = t.url;
                else if (i === ez.PlusUpsell) n = t.url;
                else if (i === ez.PlusReferralDashboard) n = t.url;
                else if (i === ez.PlusSubscribe) {
                    let e = eO.UrlSearchParams.new([..."PlusReferralLandingSheet" === r.surface ? [
                        ["ctx", "plus_referral"]
                    ] : [], ...r.referrer_id ? [
                        ["referrerId", r.referrer_id]
                    ] : []]).toString();
                    n = e ? `${e$.Plus}?${e}` : e$.Plus
                }
                return n ? window.location.href = n : e.fireCounter("DeeplinkParserNavigationFailed"), Promise.resolve(!!n)
            })(I, e),
            [ez.PlaceId]: e => ((e, t) => {
                let {
                    params: n
                } = t;
                if (!n.placeId) return Promise.resolve(!1);
                if (n.linkCode) return window.location.href = `${e$.Games}/${n.placeId}?privateServerLinkCode=${n.linkCode}`, Promise.resolve(!0);
                if (n.accessCode) return window.location.href = `${e$.GameStart}?placeId=${n.placeId}&accessCode=${n.accessCode}`, Promise.resolve(!0);
                if (n.launchData) {
                    let t = `${e$.ExperienceLauncher}placeId=${n.placeId}${n.launchData?`&launchData=${n.launchData}`:""}`,
                        a = Number(n.placeId);
                    return Promise.resolve(!1 !== e.startGameWithDeepLinkUrl(t, a))
                }
                return Promise.resolve(!1 !== e.joinMultiplayerGame((0, X.parseFloat)(n.placeId) ?? NaN))
            })(I, e),
            [ez.UserId]: e => {
                let {
                    userId: t
                } = e.params;
                return t && (window.location.href = `/games/start?userId=${t}`), Promise.resolve(!!t)
            },
            [ez.Group]: e => {
                let {
                    groupId: t
                } = e.params;
                return t && (window.location.href = `/groups/${t}`), Promise.resolve(!!t)
            }
        }, {
            navigateToDeepLink: e => {
                if (I.getDeviceMeta()?.isIosApp && I.navigateToHybridFeature) return I.navigateToHybridFeature({
                    feature: "DeepLink",
                    deepLinkUrlPath: e
                }), Promise.resolve(!0);
                if (I.getDeviceMeta()?.isInApp) return window.location.href = e, Promise.resolve(!0);
                let t = td(e),
                    a = n[t.path[0]];
                return a ? a(t) : Promise.resolve(!1)
            }
        }),
        tS = e => V.getUntyped(L.apiGateway.withPath(`/guac-v2/v1/bundles/${e}`), {
            credentials: "include"
        }).getOrThrow(),
        tN = {
            Thumbnail: e => {
                let {
                    type: t,
                    targetId: n,
                    containerClass: a,
                    includeProfileFrame: r
                } = e;
                return (0, E.jsx)(R.Thumbnail2d, {
                    type: tv[t],
                    size: "150x150",
                    format: "webp",
                    targetId: n,
                    containerClassName: a,
                    includeProfileFrame: r
                })
            },
            getLocale: () => (0, P.getLocale)(),
            formatFullDate: e => {
                let t = (0, P.getLocale)(),
                    n = new Intl.DateTimeFormat(t, {
                        year: "numeric",
                        month: "short",
                        day: "numeric"
                    }),
                    a = new Intl.DateTimeFormat(t, {
                        hour: "numeric",
                        minute: "numeric"
                    });
                return `${n.format(e)} | ${a.format(e)}`
            },
            get joinMultiplayerGame() {
                return null == (0, ej.getGameLauncher)() ? null : tC
            },
            parseDeepLink: e => td(e),
            navigateToDeepLink: e => tw(e),
            getReportAbuseConfig: () => tS("report-abuse-ui"),
            callGuacBehaviour: tS,
            getDeviceMeta: () => (0, tm.getDeviceMeta)(),
            getCurrentUserId: () => String((0, tf.getCurrentUser)()?.id ?? null ?? ""),
            hashStringWithSha256: e => (0, eB.hashStringWithSha256)(e),
            TrustedFriendsModal: e => {
                let {
                    userId: t,
                    linkTokens: n,
                    onClose: a
                } = e;
                return (0, E.jsx)(eb.Provider, {
                    value: ty,
                    children: (0, E.jsx)(eG, {
                        open: !0,
                        userId: t,
                        linkTokens: n,
                        onClose: a
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
    var tx = e.i(981498),
        tV = e.i(423517),
        tT = e.i(257771),
        tZ = e.i(270784),
        tR = e.i(889375);
    let tL = "Website.Navigation",
        tP = x.looseObject({
            layers: x.record(x.string(), x.looseObject({
                experimentName: x.optional(x.string())
            }))
        }),
        tF = !1,
        tk = async () => {
            if (!tF) {
                tF = !0;
                try {
                    let e = await V.post(L.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                        layers: {
                            [tL]: {}
                        }
                    }, tP, {
                        credentials: "include"
                    }).getOrThrow();
                    if (!e.layers[tL]?.experimentName) return;
                    let t = (0, tf.getCurrentUser)()?.id;
                    (0, tR.sendEvent)(tV.EXPOSED_EVENT_NAME, tV.EXPERIMENTATION_TARGET_NAME, (0, tT.buildLayerExposureEvent)(e, tL, null == t ? 0 : (0, tf.userIdToNumber)(t), (0, tZ.getBrowserTrackerId)() || "0"))
                } catch {
                    tF = !1
                }
            }
        }, tX = "Website.DownloadFunnel", t_ = x.looseObject({
            layers: x.record(x.string(), x.looseObject({
                experimentName: x.optional(x.string())
            }))
        }), tG = !1, tD = async () => {
            if (tG) return;
            tG = !0;
            let e = await V.post(L.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                layers: {
                    [tX]: {}
                }
            }, t_, {
                credentials: "include"
            });
            if (e.isErr()) {
                tG = !1;
                return
            }
            if (!e.value.layers[tX]?.experimentName) return;
            let t = (0, tf.getCurrentUser)()?.id;
            (0, tR.sendEvent)(tV.EXPOSED_EVENT_NAME, tV.EXPERIMENTATION_TARGET_NAME, (0, tT.buildLayerExposureEvent)(e.value, tX, null == t ? 0 : (0, tf.userIdToNumber)(t), (0, tZ.getBrowserTrackerId)() || "0"))
        }, tB = "Website.TopSearchResultsPage.Exposure", tW = x.looseObject({
            layers: x.record(x.string(), x.looseObject({
                parameters: x.nullish(x.record(x.string(), x.unknown()))
            }))
        }), tj = !1, tY = async () => {
            if (tj) return;
            tj = !0;
            let e = await V.post(L.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                layers: {
                    [tB]: {}
                }
            }, tW, {
                credentials: "include"
            });
            if (e.isErr()) {
                tj = !1;
                return
            }
            let t = e.value.layers[tB]?.parameters;
            if (null == t || !("shouldShowTopResults" in t)) return;
            let n = (0, tf.getCurrentUser)()?.id;
            (0, tR.sendEvent)(tV.EXPOSED_EVENT_NAME, tV.EXPERIMENTATION_TARGET_NAME, (0, tT.buildLayerExposureEvent)(e.value, tB, null == n ? 0 : (0, tf.userIdToNumber)(n), (0, tZ.getBrowserTrackerId)() || "0"))
        }, tU = x.object({
            plusIdentityBadgeEnabled: x.optional(x.boolean())
        }), tJ = {
            queryKey: ["guac/web-plus-identity-badge"],
            queryFn: () => V.get(L.apiGateway.withPath("/guac-v2/v1/bundles/web-plus-identity-badge"), tU, {
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
    var tM = e.i(115718);
    let tO = (0, C.default)(() => e.A(957562).then(e => ((0, tx.trackAppShellCounter)("NavLoad", {
            outcome: "loaded"
        }), e), e => {
            throw (0, tx.trackAppShellCounter)("NavLoad", {
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
        tz = x.object({
            isVNGComplianceEnabled: x.optional(x.boolean())
        }),
        tH = () => V.get(L.apiGateway.withPath("/guac-v2/v1/bundles/intl-auth-compliance"), tz, {
            credentials: "include"
        }).getOrThrow(),
        tQ = x.object({
            notificationsCanAccessStream: x.optional(x.boolean())
        }),
        t$ = () => V.get(L.apiGateway.withPath("/guac-v2/v1/bundles/navigation-header-ui"), tQ, {
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
        tK = x.object({
            count: x.number()
        }),
        tq = (e, t) => V.get(Z.Url.parse(`https://${e}.${L.rootDomain}`).getOrThrow().withPath(t), tK, {
            credentials: "include"
        }).map(e => {
            let {
                count: t
            } = e;
            return t
        }).getOrThrow(),
        t0 = () => tq("friends", "/v1/user/friend-requests/count"),
        t2 = () => tq("privatemessages", "/v1/messages/unread/count"),
        t1 = () => tq("trades", "/v1/trades/inbound/count"),
        t5 = e => V.get(Z.Url.parse(`https://economy.${L.rootDomain}`).getOrThrow().withPath(`/v1/users/${String(e)}/currency`), x.object({
            robux: x.number()
        }), {
            credentials: "include"
        }).getOrThrow(),
        t3 = ["control", "hideCreditAndRobux", "showCreditAndRobux"],
        t9 = x.object({
            creditDisplayConfig: x.nullable(x.string()),
            creditBalance: x.nullable(x.number()),
            currencyCode: x.nullable(x.string())
        }),
        t4 = () => V.get(L.apiGateway.withPath("/credit-balance/v1/get-credit-balance-for-navigation"), t9, {
            credentials: "include"
        }).map(e => {
            let {
                creditDisplayConfig: t,
                ...n
            } = e;
            return {
                ...n,
                creditDisplayConfig: t3.find(e => e === t) ?? null
            }
        }).getOrThrow(),
        t8 = () => V.get(L.apiGateway.withPath("/robuxbadge/v1/robuxbadge"), x.object({
            is_virtual_item_available: x.boolean(),
            active_virtual_item_start_time_seconds_utc: x.number()
        }), {
            credentials: "include"
        }).getOrThrow(),
        t7 = () => V.postUntyped(L.authApi.withPath("/v2/logout"), {}, {
            credentials: "include"
        }).map(() => void 0).getOrThrow(),
        t6 = "Accounts.AccountSwitcher",
        ne = "Website.LogoutUpsell",
        nt = x.object({
            layers: x.object({
                [t6]: x.object({
                    parameters: x.object({
                        isAccountSwitcherEnabled: x.optional(x.unknown())
                    })
                })
            })
        }),
        nn = x.object({
            layers: x.object({
                [ne]: x.object({
                    parameters: x.object({
                        IsPromptsServiceEnabled: x.optional(x.unknown())
                    })
                })
            })
        }),
        na = () => t ??= V.post(L.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
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
        nr = () => V.post(L.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
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
        ni = x.object({
            IsEmailUpsellAtLogoutEnabled: x.optional(x.boolean())
        }),
        nl = x.object({
            emailAddress: x.optional(x.nullable(x.string()))
        }),
        no = Z.Url.parse(`https://accountsettings.${L.rootDomain}`).getOrThrow(),
        ns = async () => {
            let e = await V.get(L.authApi.withPath("/v2/metadata"), ni, {
                credentials: "include"
            }).getOrNull();
            if (e?.IsEmailUpsellAtLogoutEnabled !== !0) return !1;
            let t = await V.get(no.withPath("/v1/email"), nl, {
                credentials: "include"
            }).getOrNull();
            return null != t && !t.emailAddress
        }, nc = e => Z.Url.parse(`https://notifications.${L.rootDomain}`).getOrThrow().withPath(e), nu = () => V.get(nc("/v2/stream-notifications/unread-count"), x.object({
            unreadNotifications: x.number()
        }), {
            credentials: "include"
        }).map(e => {
            let {
                unreadNotifications: t
            } = e;
            return t
        }).getOrThrow(), nd = () => V.postUntyped(nc("/v2/stream-notifications/clear-unread"), {}, {
            credentials: "include"
        }).map(() => void 0).getOrThrow(), nm = (e, t) => {
            let n, a = !0,
                r = () => {
                    t()
                };
            return (0, F.getRealtimeClient)().then(t => {
                a && null != t && (t.Subscribe(e, r), n = () => {
                    t.Unsubscribe(e, r)
                })
            }), () => {
                a = !1, n?.()
            }
        }, np = x.object({
            displayName: x.string(),
            hasVerifiedBadge: x.boolean()
        }), ng = e => (0, N.useQuery)({
            queryKey: ["navigation-user", e],
            queryFn: () => V.get(Z.Url.parse(`https://users.${L.rootDomain}`).getOrThrow().withPath(`/v1/users/${String(e)}`), np, {
                credentials: "include"
            }).getOrThrow(),
            enabled: null != e,
            staleTime: 1 / 0
        }).data, nh = e => ng(e.id)?.displayName ?? e.displayName ?? "", nf = e => ng(e.id)?.hasVerifiedBadge ?? e.hasVerifiedBadge, nb = x.object({
            access: x.string()
        }), nv = x.object({
            eligibility: x.union([x.string(), x.number()])
        }), nA = new Map([
            ["Invalid", "Invalid"],
            ["Eligible", "Eligible"],
            ["Ineligible", "Ineligible"],
            [0, "Invalid"],
            [1, "Eligible"],
            [2, "Ineligible"]
        ]), ny = x.object({
            referrals: x.array(x.object({
                senderUserId: x.union([x.number(), x.string()])
            }))
        }), nI = x.object({
            prefix: x.string(),
            algorithmName: x.string(),
            entries: x.array(x.object({
                type: x.union([x.literal(0), x.literal(1), x.literal(2)]),
                score: x.number(),
                universeId: x.number(),
                canonicalTitle: x.nullable(x.string()),
                thumbnailUrl: x.nullable(x.string()),
                searchQuery: x.string(),
                trendingSearchStartDateTime: x.nullable(x.string())
            }))
        }), nE = x.object({
            Args: x.object({
                Prefix: x.string(),
                Limit: x.number(),
                Algo: x.nullable(x.string())
            }),
            Data: x.array(x.object({
                Query: x.string(),
                Score: x.number()
            }))
        }), nC = new AbortController, nw = () => (nC.abort(), (nC = new AbortController).signal), nS = e => V.get(L.apiGateway.withPath(`/games-autocomplete/v1/get-suggestion/${encodeURIComponent(e.toLowerCase())}`), nI, {
            credentials: "include",
            signal: nw()
        }).getOrThrow(), nN = (e, t, n, a, r) => {
            var i;
            let l, o;
            return V.get((r ? L.apiGateway : L.apiGatewayCdn).withPath("/autocomplete-avatar/v2/suggest").withSearchParams({
                prefix: e.toLowerCase(),
                limit: String(n),
                lang: t,
                q: a
            }), nE, {
                credentials: "include",
                signal: (i = nw(), l = new AbortController, o = setTimeout(() => {
                    l.abort(new DOMException("The request timed out.", "TimeoutError"))
                }, 5e3), i.addEventListener("abort", () => {
                    clearTimeout(o), l.abort(i.reason)
                }, {
                    once: !0
                }), l.signal)
            }).getOrThrow()
        }, nx = e => e instanceof T.AbortError && "Abort" === e.cause.code, nV = e => {
            let {
                universeId: t,
                onLoad: n
            } = e;
            return (0, E.jsx)(R.Thumbnail2d, {
                targetId: t,
                type: "GameIcon",
                size: "150x150",
                format: "jpeg",
                containerClassName: "thumbnail-icon",
                onLoad: n
            })
        }, nT = e => {
            let {
                userId: t,
                altName: n,
                containerClass: a
            } = e;
            return (0, E.jsx)(R.Thumbnail2d, {
                targetId: t,
                type: "AvatarHeadShot",
                altName: n,
                containerClassName: a,
                includeProfileFrame: !0
            })
        }, nZ = () => {
            let {
                data: e = !1
            } = (0, N.useQuery)(tJ);
            return e
        };
    e.s(["default", 0, function(e) {
        let {
            user: t,
            location: n,
            isPlusMember: a,
            ageBadgeControl: r,
            showUncheckedBadge: i,
            pageName: l,
            isReferralRolloutEnabled: o,
            isTopNavDownloadEnabled: s,
            isTopSearchResultsEnabled: c,
            serverHints: u
        } = e;
        return (0, E.jsx)(tO, {
            user: t,
            location: n,
            serverHints: u,
            ageBadgeControl: r,
            showUncheckedBadge: i,
            getIntAuthCompliancePolicy: tH,
            getNavigationHeaderBehavior: t$,
            getFriendRequestCount: t0,
            getMessageUnreadCount: t2,
            logLeftNavExposure: tk,
            logTopNavDownloadExposure: tD,
            getTradeInboundCount: t1,
            getUserCurrency: t5,
            getCreditBalanceForNavigation: t4,
            getRobuxBadge: t8,
            isTopNavDownloadEnabled: () => s,
            getIsTopSearchResultsEnabled: () => c,
            logTopSearchResultsExposure: tY,
            logout: t7,
            getAccountSwitcherEnabled: na,
            getLogoutPromptsServiceEnabled: nr,
            shouldShowLegacyEmailUpsell: ns,
            getNotificationUnreadCount: nu,
            clearNotificationUnread: nd,
            subscribeRealTime: nm,
            AvatarHeadshot: nT,
            useLiveUserNameForDisplay: nh,
            useHasVerifiedBadge: nf,
            useStreamedValue: w.use,
            useIsPlusBadgeEnabled: nZ,
            isReferralRolloutEnabled: o,
            usePlusStatus: e => ((e, t, n, a) => {
                let r = e && !t,
                    {
                        data: i,
                        isPending: l
                    } = (0, N.useQuery)({
                        queryKey: ["plus-referrals", "viewer-subscription"],
                        enabled: r,
                        queryFn: () => V.get(L.apiGateway.withPath("/access-management/v1/upsell-feature-access").withSearchParams({
                            featureName: "IsRobloxPlusSubscribed",
                            namespace: "subscriptions/PlusSubscription"
                        }), nb, {
                            credentials: "include"
                        }).map(e => {
                            let {
                                access: t
                            } = e;
                            return "Granted" === t
                        }).getOrThrow(),
                        staleTime: 1 / 0
                    }),
                    o = t || !0 === i,
                    s = r && l,
                    {
                        data: c
                    } = (0, N.useQuery)({
                        queryKey: ["plus-referrals", "sender-eligibility"],
                        enabled: n && o,
                        queryFn: async () => {
                            let e = await a;
                            return null != e ? nA.get(e) : V.get(L.apiGateway.withPath("/subscriptions/v2/referral-eligibility"), nv, {
                                credentials: "include"
                            }).map(e => {
                                let {
                                    eligibility: t
                                } = e;
                                return nA.get(t)
                            }).getOrThrow()
                        },
                        staleTime: 1 / 0
                    }),
                    {
                        data: u
                    } = (0, N.useQuery)({
                        queryKey: ["plus-referrals", "pending-referrer"],
                        enabled: n && e && !s && !o,
                        queryFn: () => V.get(L.apiGateway.withPath("/subscriptions/v2/referrals").withSearchParams({
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
                    isPlusSubscriber: o,
                    isPlusStatusLoading: s,
                    senderEligibility: c,
                    pendingReferrerId: u ?? void 0
                }
            })(null != t, a, e, u.plusReferralEligibilityStream),
            getGamesAutocompleteSuggestions: nS,
            getAvatarAutocompleteSuggestions: nN,
            isSearchRequestCancelled: nx,
            getInternalPageName: () => l,
            getLocale: P.getLocale,
            GameIconThumbnail: nV,
            notificationStreamTransport: tb,
            notificationStreamHost: tN,
            captureNotificationStreamError: (e, t) => {
                (0, S.captureException)(e, t)
            },
            searchLanding: tM.searchLandingCapability
        })
    }], 776771)
}, 767970, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(360702),
        a = e.i(883355),
        r = e.i(418568);
    let i = n.AsyncResult.fn(async e => {
        if (!0 !== navigator.globalPrivacyControl) return (0, n.ok)(null);
        let {
            gpcVersion: t,
            cooldownPeriodInMs: i,
            cooldownPeriodFuzzyInMs: l
        } = await (0, r.getGlobalPrivacyControlPolicy)().getOrDefault({
            gpcVersion: 0,
            cooldownPeriodInMs: 864e5,
            cooldownPeriodFuzzyInMs: 864e5
        }), o = a.getItem("globalPrivacyControl");
        if (o?.version === 0)
            if (o.data.gpcVersion === t) {
                let t = o.data.nextSync[e];
                if (null != t && Date.now() < t) return (0, n.ok)(null)
            } else o.data.nextSync = {};
        return (0, r.postGlobalPrivacyControl)().andThen(() => {
            if (null != o && 0 !== o.version) return (0, n.err)(new a.LocalStorageWriteError({
                code: "PageRefreshNeeded"
            }));
            let r = Date.now(),
                s = o?.data.nextSync ?? {};
            s[e] = r + i + Math.floor(Math.random() * l);
            let c = Object.entries(s).filter(e => {
                let [, t] = e;
                return r < t
            });
            c.length > 100 && (c = c.sort((e, t) => e[1] - t[1]).slice(-100));
            let u = {
                gpcVersion: t,
                nextSync: Object.fromEntries(c)
            };
            return a.setItem("globalPrivacyControl", {
                version: 0,
                data: u
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
    var t = e.i(19836);
    let n = (0, e.i(750341).default)(() => e.A(705367), {
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
    var t = e.i(19836),
        n = e.i(750341),
        a = e.i(432464);
    let r = (0, n.default)(() => e.A(123968), {
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
        return (0, t.jsx)(a.ErrorBoundary, {
            children: (0, t.jsx)(r, {
                username: n,
                isUserUnder13: i
            })
        })
    }])
}, 696717, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(750341),
        a = e.i(432464);
    let r = (0, n.default)(() => e.A(780837), {
        loadableGenerated: {
            modules: [815582]
        },
        ssr: !1,
        loading: () => null
    });
    e.s(["default", 0, function() {
        return (0, t.jsx)(a.ErrorBoundary, {
            children: (0, t.jsx)(r, {})
        })
    }])
}, 879809, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(420482),
        a = e.i(750341),
        r = e.i(165188),
        i = e.i(357355),
        l = e.i(270784),
        o = e.i(460987),
        s = e.i(200643),
        c = e.i(175067),
        u = e.i(815079),
        d = e.i(981498),
        m = e.i(57099);
    let p = e => {
        let t, n = (t = i.window, t?.Roblox?.Hybrid?.Game),
            a = n?.launchGame;
        return null == a ? null : new Promise(t => {
            a.call(n, e, () => {
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
    let h = e => null == e || "LIVE" === e.toUpperCase() ? "" : e,
        f = (0, a.default)(() => e.A(593401), {
            loadableGenerated: {
                modules: [518661]
            },
            ssr: !1
        }),
        b = (0, a.default)(() => e.A(715216), {
            loadableGenerated: {
                modules: [142742]
            },
            ssr: !1
        }),
        v = (0, a.default)(() => e.A(932954), {
            loadableGenerated: {
                modules: [233080]
            },
            ssr: !1
        }),
        A = u.wwwRoblox.withPath("/Game/PlaceLauncher.ashx").toString(),
        y = u.wwwRoblox.withPath("/download/client").toString(),
        I = u.wwwRoblox.withPath("/download/studio").toString();
    e.s(["default", 0, function(e) {
        let {
            settings: a,
            userId: u,
            isWindowsOrMac: g,
            osName: E,
            isInApp: C
        } = e, [w, S] = (0, n.useState)(null), [N, x] = (0, n.useState)(!1), [V, T] = (0, n.useState)(!1), Z = (0, n.useRef)(null), R = (0, n.useRef)(null);
        (0, n.useEffect)(() => {
            let e = {
                    placeLauncherUrl: A,
                    robloxLocale: a.RobloxLocale ?? "",
                    gameLocale: a.GameLocale ?? "",
                    playerChannel: h(a.PlayerChannelName),
                    studioChannel: h(a.StudioChannelName),
                    isDuarAutoOptInEnabled: a.IsDuarAutoOptInEnabled,
                    isDuarOptOutDisabled: a.IsDuarOptOutDisabled,
                    isOmitPlayerChannelForWinAndMacEnabled: a.IsOmitPlayerChannelForWinAndMacEnabled
                },
                t = (0, o.createGameLauncher)({
                    getConfig: () => e,
                    getBrowserTrackerId: l.getBrowserTrackerId,
                    isAuthenticated: () => null != u,
                    getUserId: () => u,
                    isWindowsOrMac: () => g,
                    onEvent: (e, t) => {
                        "startClientAttempted" === e && (0, d.trackAppShellCounter)("GameLaunch", {
                            outcome: "attempted"
                        }), (0, m.logGameLaunchEvent)(E, e, t)
                    },
                    onLaunchStarted: (e, t) => {
                        S({
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
                        }), console.error(e), x(!0)
                    },
                    onGuestLaunch: () => {
                        T(!0)
                    },
                    ...C ? {
                        launchInApp: p
                    } : {}
                });
            return Z.current = t, (0, c.setGameLauncher)(t), () => {
                Z.current = null, (0, c.setGameLauncher)(null)
            }
        }, [a, u, g, E, C]);
        let L = async e => {
            null != e.placeId && i.window?.localStorage.removeItem("ref_info"), Z.current?.beginInstall(e);
            let t = R.current;
            if (null == t || null == i.window) return;
            if ("launchMode" in e && (0, s.isStudioLaunchMode)(e.launchMode)) {
                t.src = I, S(null);
                return
            }
            t.referrerPolicy = "no-referrer";
            let n = i.window.location.href;
            t.src = `${y}${await (0,r.getInstallerDeeplinkQueryParams)(n)}`
        };
        return (0, t.jsxs)(t.Fragment, {
            children: [(0, t.jsx)("iframe", {
                ref: R,
                hidden: !0,
                title: "Roblox installer"
            }), null == w ? null : (0, t.jsx)(f, {
                download: () => L(w.params),
                launchGame: w.launch,
                unmount: () => {
                    S(null)
                }
            }), N ? (0, t.jsx)(b, {
                unmount: () => {
                    x(!1)
                }
            }) : null, V ? (0, t.jsx)(v, {
                unmount: () => {
                    T(!1)
                }
            }) : null]
        })
    }], 879809)
}, 778764, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(420482),
        a = e.i(698947);
    e.s(["default", 0, function(e) {
        let {
            script: r,
            nonce: i
        } = e, l = (0, n.useRef)(!1);
        return (0, a.useServerInsertedHTML)(() => {
            if (!l.current) return l.current = !0, (0, t.jsx)("script", {
                nonce: i,
                children: r
            }, "roblox-hybrid")
        }), null
    }])
}, 218963, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(357355);
    let a = {
            "Roblox.Friendship.FriendRequestSent": "friendRequestSent",
            "Roblox.Messages.MessageSent": "privateMessageSent",
            "Roblox.Settings.PushEnabledOnDevice": "enableAuthorizationForUser"
        },
        r = e => {
            let t, a = (t = n.window, t?.Roblox?.Hybrid?.Push),
                {
                    supports: r,
                    pushPermissionTrigger: i
                } = a ?? {};
            if (null != r && null != i) try {
                r.call(a, "pushPermissionTrigger", t => {
                    t && i.call(a, e)
                })
            } catch {}
        };
    e.s(["default", 0, function() {
        return (0, t.useEffect)(() => {
            let e = n.document;
            if (null == e) return;
            let t = Object.entries(a).map(t => {
                let [n, a] = t, i = () => {
                    r(a)
                };
                return e.addEventListener(n, i), [n, i]
            });
            return () => {
                t.forEach(t => {
                    let [n, a] = t;
                    e.removeEventListener(n, a)
                })
            }
        }, []), null
    }, "pushPermissionActions", 0, a, "sendPushPermissionTrigger", 0, r])
}, 594841, e => {
    "use strict";
    var t = e.i(19836);
    let n = (0, e.i(750341).default)(() => e.A(373322), {
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
    var t = e.i(19836),
        n = e.i(420482),
        a = e.i(285586);
    e.s(["default", 0, function(e) {
        let {
            pageName: r
        } = e;
        return (0, n.useEffect)(() => {
            null != r && (0, a.setTag)("internal-page-name", r)
        }, [r]), null == r ? null : (0, t.jsx)("meta", {
            name: "page-meta",
            "data-internal-page-name": r
        })
    }])
}, 214795, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(763170),
        a = e.i(889375),
        r = e.i(981498);
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
                for (let [e, o] of i.entries()) {
                    if (await (0, n.abortableTimeout)(o, t), t.aborted) break;
                    {
                        let t = `heartbeat${e+1}`;
                        (0, a.sendEvent)("pageHeartbeat", t), (0, r.trackAppShellCounter)("PageHeartbeat", {
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
}, 401412, (e, t, n) => {
    ! function() {
        "use strict";
        var e = {};
        e.d = function(t, n) {
            for (var a in n) e.o(n, a) && !e.o(t, a) && Object.defineProperty(t, a, {
                enumerable: !0,
                get: n[a]
            })
        }, e.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, e.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, void 0 !== e && (e.ab = "/ROOT/node_modules/.pnpm/next@16.2.6_patch_hash=2889283f843aeb9b88db5fd798b6e589c78c4b38fab3ccd115a3f784da4f1be8_89e6c892149a8359ec70e3fe909630cf/node_modules/next/dist/compiled/web-vitals/");
        var n = {};
        e.r(n), e.d(n, {
            CLSThresholds: function() {
                return x
            },
            FCPThresholds: function() {
                return S
            },
            FIDThresholds: function() {
                return ee
            },
            INPThresholds: function() {
                return B
            },
            LCPThresholds: function() {
                return j
            },
            TTFBThresholds: function() {
                return J
            },
            onCLS: function() {
                return V
            },
            onFCP: function() {
                return N
            },
            onFID: function() {
                return et
            },
            onINP: function() {
                return W
            },
            onLCP: function() {
                return U
            },
            onTTFB: function() {
                return O
            }
        });
        var a, r, i, l, o, s = -1,
            c = function(e) {
                addEventListener("pageshow", function(t) {
                    t.persisted && (s = t.timeStamp, e(t))
                }, !0)
            },
            u = function() {
                var e = self.performance && performance.getEntriesByType && performance.getEntriesByType("navigation")[0];
                if (e && e.responseStart > 0 && e.responseStart < performance.now()) return e
            },
            d = function() {
                var e = u();
                return e && e.activationStart || 0
            },
            m = function(e, t) {
                var n = u(),
                    a = "navigate";
                return s >= 0 ? a = "back-forward-cache" : n && (document.prerendering || d() > 0 ? a = "prerender" : document.wasDiscarded ? a = "restore" : n.type && (a = n.type.replace(/_/g, "-"))), {
                    name: e,
                    value: void 0 === t ? -1 : t,
                    rating: "good",
                    delta: 0,
                    entries: [],
                    id: "v4-".concat(Date.now(), "-").concat(Math.floor(0x82f79cd8fff * Math.random()) + 1e12),
                    navigationType: a
                }
            },
            p = function(e, t, n) {
                try {
                    if (PerformanceObserver.supportedEntryTypes.includes(e)) {
                        var a = new PerformanceObserver(function(e) {
                            Promise.resolve().then(function() {
                                t(e.getEntries())
                            })
                        });
                        return a.observe(Object.assign({
                            type: e,
                            buffered: !0
                        }, n || {})), a
                    }
                } catch (e) {}
            },
            g = function(e, t, n, a) {
                var r, i;
                return function(l) {
                    var o;
                    t.value >= 0 && (l || a) && ((i = t.value - (r || 0)) || void 0 === r) && (r = t.value, t.delta = i, o = t.value, t.rating = o > n[1] ? "poor" : o > n[0] ? "needs-improvement" : "good", e(t))
                }
            },
            h = function(e) {
                requestAnimationFrame(function() {
                    return requestAnimationFrame(function() {
                        return e()
                    })
                })
            },
            f = function(e) {
                document.addEventListener("visibilitychange", function() {
                    "hidden" === document.visibilityState && e()
                })
            },
            b = function(e) {
                var t = !1;
                return function() {
                    t || (e(), t = !0)
                }
            },
            v = -1,
            A = function() {
                return "hidden" !== document.visibilityState || document.prerendering ? 1 / 0 : 0
            },
            y = function(e) {
                "hidden" === document.visibilityState && v > -1 && (v = "visibilitychange" === e.type ? e.timeStamp : 0, E())
            },
            I = function() {
                addEventListener("visibilitychange", y, !0), addEventListener("prerenderingchange", y, !0)
            },
            E = function() {
                removeEventListener("visibilitychange", y, !0), removeEventListener("prerenderingchange", y, !0)
            },
            C = function() {
                return v < 0 && (v = A(), I(), c(function() {
                    setTimeout(function() {
                        v = A(), I()
                    }, 0)
                })), {
                    get firstHiddenTime() {
                        return v
                    }
                }
            },
            w = function(e) {
                document.prerendering ? addEventListener("prerenderingchange", function() {
                    return e()
                }, !0) : e()
            },
            S = [1800, 3e3],
            N = function(e, t) {
                t = t || {}, w(function() {
                    var n, a = C(),
                        r = m("FCP"),
                        i = p("paint", function(e) {
                            e.forEach(function(e) {
                                "first-contentful-paint" === e.name && (i.disconnect(), e.startTime < a.firstHiddenTime && (r.value = Math.max(e.startTime - d(), 0), r.entries.push(e), n(!0)))
                            })
                        });
                    i && (n = g(e, r, S, t.reportAllChanges), c(function(a) {
                        n = g(e, r = m("FCP"), S, t.reportAllChanges), h(function() {
                            r.value = performance.now() - a.timeStamp, n(!0)
                        })
                    }))
                })
            },
            x = [.1, .25],
            V = function(e, t) {
                t = t || {}, N(b(function() {
                    var n, a = m("CLS", 0),
                        r = 0,
                        i = [],
                        l = function(e) {
                            e.forEach(function(e) {
                                if (!e.hadRecentInput) {
                                    var t = i[0],
                                        n = i[i.length - 1];
                                    r && e.startTime - n.startTime < 1e3 && e.startTime - t.startTime < 5e3 ? (r += e.value, i.push(e)) : (r = e.value, i = [e])
                                }
                            }), r > a.value && (a.value = r, a.entries = i, n())
                        },
                        o = p("layout-shift", l);
                    o && (n = g(e, a, x, t.reportAllChanges), f(function() {
                        l(o.takeRecords()), n(!0)
                    }), c(function() {
                        r = 0, n = g(e, a = m("CLS", 0), x, t.reportAllChanges), h(function() {
                            return n()
                        })
                    }), setTimeout(n, 0))
                }))
            },
            T = 0,
            Z = 1 / 0,
            R = 0,
            L = function(e) {
                e.forEach(function(e) {
                    e.interactionId && (Z = Math.min(Z, e.interactionId), T = (R = Math.max(R, e.interactionId)) ? (R - Z) / 7 + 1 : 0)
                })
            },
            P = function() {
                "interactionCount" in performance || a || (a = p("event", L, {
                    type: "event",
                    buffered: !0,
                    durationThreshold: 0
                }))
            },
            F = [],
            k = new Map,
            X = 0,
            _ = [],
            G = function(e) {
                if (_.forEach(function(t) {
                        return t(e)
                    }), e.interactionId || "first-input" === e.entryType) {
                    var t = F[F.length - 1],
                        n = k.get(e.interactionId);
                    if (n || F.length < 10 || e.duration > t.latency) {
                        if (n) e.duration > n.latency ? (n.entries = [e], n.latency = e.duration) : e.duration === n.latency && e.startTime === n.entries[0].startTime && n.entries.push(e);
                        else {
                            var a = {
                                id: e.interactionId,
                                latency: e.duration,
                                entries: [e]
                            };
                            k.set(a.id, a), F.push(a)
                        }
                        F.sort(function(e, t) {
                            return t.latency - e.latency
                        }), F.length > 10 && F.splice(10).forEach(function(e) {
                            return k.delete(e.id)
                        })
                    }
                }
            },
            D = function(e) {
                var t = self.requestIdleCallback || self.setTimeout,
                    n = -1;
                return e = b(e), "hidden" === document.visibilityState ? e() : (n = t(e), f(e)), n
            },
            B = [200, 500],
            W = function(e, t) {
                "PerformanceEventTiming" in self && "interactionId" in PerformanceEventTiming.prototype && (t = t || {}, w(function() {
                    P();
                    var n, r, i = m("INP"),
                        l = function(e) {
                            D(function() {
                                e.forEach(G);
                                var t, n = (t = Math.min(F.length - 1, Math.floor(((a ? T : performance.interactionCount || 0) - X) / 50)), F[t]);
                                n && n.latency !== i.value && (i.value = n.latency, i.entries = n.entries, r())
                            })
                        },
                        o = p("event", l, {
                            durationThreshold: null != (n = t.durationThreshold) ? n : 40
                        });
                    r = g(e, i, B, t.reportAllChanges), o && (o.observe({
                        type: "first-input",
                        buffered: !0
                    }), f(function() {
                        l(o.takeRecords()), r(!0)
                    }), c(function() {
                        X = 0, F.length = 0, k.clear(), r = g(e, i = m("INP"), B, t.reportAllChanges)
                    }))
                }))
            },
            j = [2500, 4e3],
            Y = {},
            U = function(e, t) {
                t = t || {}, w(function() {
                    var n, a = C(),
                        r = m("LCP"),
                        i = function(e) {
                            t.reportAllChanges || (e = e.slice(-1)), e.forEach(function(e) {
                                e.startTime < a.firstHiddenTime && (r.value = Math.max(e.startTime - d(), 0), r.entries = [e], n())
                            })
                        },
                        l = p("largest-contentful-paint", i);
                    if (l) {
                        n = g(e, r, j, t.reportAllChanges);
                        var o = b(function() {
                            Y[r.id] || (i(l.takeRecords()), l.disconnect(), Y[r.id] = !0, n(!0))
                        });
                        ["keydown", "click"].forEach(function(e) {
                            addEventListener(e, function() {
                                return D(o)
                            }, !0)
                        }), f(o), c(function(a) {
                            n = g(e, r = m("LCP"), j, t.reportAllChanges), h(function() {
                                r.value = performance.now() - a.timeStamp, Y[r.id] = !0, n(!0)
                            })
                        })
                    }
                })
            },
            J = [800, 1800],
            M = function e(t) {
                document.prerendering ? w(function() {
                    return e(t)
                }) : "complete" !== document.readyState ? addEventListener("load", function() {
                    return e(t)
                }, !0) : setTimeout(t, 0)
            },
            O = function(e, t) {
                t = t || {};
                var n = m("TTFB"),
                    a = g(e, n, J, t.reportAllChanges);
                M(function() {
                    var r = u();
                    r && (n.value = Math.max(r.responseStart - d(), 0), n.entries = [r], a(!0), c(function() {
                        (a = g(e, n = m("TTFB", 0), J, t.reportAllChanges))(!0)
                    }))
                })
            },
            z = {
                passive: !0,
                capture: !0
            },
            H = new Date,
            Q = function(e, t) {
                r || (r = t, i = e, l = new Date, q(removeEventListener), $())
            },
            $ = function() {
                if (i >= 0 && i < l - H) {
                    var e = {
                        entryType: "first-input",
                        name: r.type,
                        target: r.target,
                        cancelable: r.cancelable,
                        startTime: r.timeStamp,
                        processingStart: r.timeStamp + i
                    };
                    o.forEach(function(t) {
                        t(e)
                    }), o = []
                }
            },
            K = function(e) {
                if (e.cancelable) {
                    var t, n, a, r = (e.timeStamp > 1e12 ? new Date : performance.now()) - e.timeStamp;
                    "pointerdown" == e.type ? (t = function() {
                        Q(r, e), a()
                    }, n = function() {
                        a()
                    }, a = function() {
                        removeEventListener("pointerup", t, z), removeEventListener("pointercancel", n, z)
                    }, addEventListener("pointerup", t, z), addEventListener("pointercancel", n, z)) : Q(r, e)
                }
            },
            q = function(e) {
                ["mousedown", "keydown", "touchstart", "pointerdown"].forEach(function(t) {
                    return e(t, K, z)
                })
            },
            ee = [100, 300],
            et = function(e, t) {
                t = t || {}, w(function() {
                    var n, a = C(),
                        l = m("FID"),
                        s = function(e) {
                            e.startTime < a.firstHiddenTime && (l.value = e.processingStart - e.startTime, l.entries.push(e), n(!0))
                        },
                        u = function(e) {
                            e.forEach(s)
                        },
                        d = p("first-input", u);
                    n = g(e, l, ee, t.reportAllChanges), d && (f(b(function() {
                        u(d.takeRecords()), d.disconnect()
                    })), c(function() {
                        n = g(e, l = m("FID"), ee, t.reportAllChanges), o = [], i = -1, r = null, q(addEventListener), o.push(s), $()
                    }))
                })
            };
        t.exports = n
    }()
}, 34100, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "useReportWebVitals", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let a = e.r(420482),
        r = e.r(401412);

    function i(e) {
        (0, a.useEffect)(() => {
            (0, r.onCLS)(e), (0, r.onFID)(e), (0, r.onLCP)(e), (0, r.onINP)(e), (0, r.onFCP)(e), (0, r.onTTFB)(e)
        }, [e])
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 796348, (e, t, n) => {
    t.exports = e.r(34100)
}, 8888, e => {
    "use strict";
    let t, n;
    var a = e.i(420482),
        r = e.i(796348),
        i = e.i(126392),
        l = e.i(683740),
        o = e.i(860430),
        s = e.i(84523),
        c = e.i(288014);
    let u = (0, o.fileDesc)("ChtldmVudC91c2VyX2V2ZW50X2Jhc2UucHJvdG8SBWV2ZW50It4HCg1Vc2VyRXZlbnRCYXNlEiUKB3VzZXJfaWQYASABKANCD5K+kgED4D4Bmr6SAQIIAUgAiAEBEiYKCHVzZXJfa2V5GAIgASgJQg+SvpIBA6g/AZq+kgECGAFIAYgBARIgCgljbGllbnRfaXAYAyABKAlCCJK+kgED6D4BSAKIAQESIQoKdXNlcl9hZ2VudBgEIAEoCUIIkr6SAQOgPwFIA4gBARInChBwbGF0Zm9ybV90eXBlX2lkGAUgASgDQgiSvpIBA+A/AUgEiAEBEikKEmJyb3dzZXJfdHJhY2tlcl9pZBgGIAEoA0IIkr6SAQPQPgFIBYgBARIoChFpc190cnVzdGVkX3NvdXJjZRgHIAEoCEIIkr6SAQOwPwFIBogBARIiCgt1c2VyX29yaWdpbhgIIAEoCUIIkr6SAQPYPwFIB4gBARIdCgZ0YXJnZXQYCSABKAlCCJK+kgEDiH0BSAiIAQESIQoKZXZlbnRfdHlwZRgKIAEoCUIIkr6SAQOQfQFICYgBARIfCghhcHBfbmFtZRgLIAEoCUIIkr6SAQO4PwFICogBARIxChtpbmdlc3Rpb25fdGltZV9taWxsaXNlY29uZHMYDCABKANCB4q+kgECCAFIC4gBARJEChFldmVudF9zdHJlYW1fdGFncxgNIAMoCzIpLmV2ZW50LlVzZXJFdmVudEJhc2UuRXZlbnRTdHJlYW1UYWdzRW50cnkSJgoPYXV0aF9zZXNzaW9uX2lkGA4gASgJQgiSvpIBA8A/AUgMiAEBEicKEGh0dHBfZmluZ2VycHJpbnQYDyABKAlCCJK+kgEDyD8BSA2IAQESJgoPdGxzX2ZpbmdlcnByaW50GBAgASgJQgiSvpIBA9A/AUgOiAEBGjYKFEV2ZW50U3RyZWFtVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCToCOAFCCgoIX3VzZXJfaWRCCwoJX3VzZXJfa2V5QgwKCl9jbGllbnRfaXBCDQoLX3VzZXJfYWdlbnRCEwoRX3BsYXRmb3JtX3R5cGVfaWRCFQoTX2Jyb3dzZXJfdHJhY2tlcl9pZEIUChJfaXNfdHJ1c3RlZF9zb3VyY2VCDgoMX3VzZXJfb3JpZ2luQgkKB190YXJnZXRCDQoLX2V2ZW50X3R5cGVCCwoJX2FwcF9uYW1lQh4KHF9pbmdlc3Rpb25fdGltZV9taWxsaXNlY29uZHNCEgoQX2F1dGhfc2Vzc2lvbl9pZEITChFfaHR0cF9maW5nZXJwcmludEISChBfdGxzX2ZpbmdlcnByaW50QjBaLmdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRiBnByb3RvMw", [c.file_event_event_field_options]);
    var d = e.i(861856);
    let m = (0, o.fileDesc)("CiBldmVudHN0cmVhbS93ZWIvd2ViX3ZpdGFscy5wcm90bxIXZXZlbnRzdHJlYW0uZXZlbnRpbmdlc3QitQUKCVdlYlZpdGFscxInCg9sb2NhbF90aW1lc3RhbXAYASABKAlCCaK+kgEECgJsdEgAiAEBEi0KD3VzZXJfZXZlbnRfYmFzZRgCIAEoCzIULmV2ZW50LlVzZXJFdmVudEJhc2USHgoEcGFnZRgDIAEoCUILor6SAQYKBHBhZ2VIAYgBARIcCgN1cmwYBCABKAlCCqK+kgEFCgN1cmxIAogBARIfCgZsY3BfbXMYBSABKAFCCqK+kgEFCgNsY3BIA4gBARIfCgZmY3BfbXMYBiABKAFCCqK+kgEFCgNmY3BIBIgBARIhCgd0dGZiX21zGAcgASgBQguivpIBBgoEdHRmYkgFiAEBEhwKA2NscxgIIAEoAUIKor6SAQUKA2Nsc0gGiAEBEh8KBmlucF9tcxgJIAEoAUIKor6SAQUKA2lucEgHiAEBEjMKD3JlbmRlcl9wbGF0Zm9ybRgKIAEoCUIVor6SARAKDnJlbmRlclBsYXRmb3JtSAiIAQE6ygHK/JIBIwoMaW5nZXN0X3Byb3RvEgp3ZWJfdml0YWxzIgdkcyxob3Vy2vySAQYIiCcQgATi/JIBUCIDd3d3OjMKBFVzZXISDUNvbnN1bWVyIEFwcHMaGVBsYXRmb3JtcyAtIFdlYiAmIEJhY2tlbmQguRNCCyNjcC1iYWNrZW5kSgdQSDNQS01Y6vySATYKIGV2ZW50c3RyZWFtL3dlYi93ZWJfdml0YWxzLnByb3RvEhAKA3d3dxIJd2ViVml0YWxzGAf6/JIBAggBQhIKEF9sb2NhbF90aW1lc3RhbXBCBwoFX3BhZ2VCBgoEX3VybEIJCgdfbGNwX21zQgkKB19mY3BfbXNCCgoIX3R0ZmJfbXNCBgoEX2Nsc0IJCgdfaW5wX21zQhIKEF9yZW5kZXJfcGxhdGZvcm1COlo4Z2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS93ZWJiBnByb3RvMw", [c.file_event_event_field_options, u, d.file_eventstream_core_hive_table_message_options]),
        p = (0, s.messageDesc)(m, 0);
    var g = e.i(868275),
        h = e.i(400661),
        f = e.i(343549),
        b = e.i(950814);
    e.i(508484), e.i(787386), e.i(778365);
    let v = (0, o.fileDesc)("ChVnb29nbGUvYXBpL2h0dHAucHJvdG8SCmdvb2dsZS5hcGkiVAoESHR0cBIjCgVydWxlcxgBIAMoCzIULmdvb2dsZS5hcGkuSHR0cFJ1bGUSJwofZnVsbHlfZGVjb2RlX3Jlc2VydmVkX2V4cGFuc2lvbhgCIAEoCCKBAgoISHR0cFJ1bGUSEAoIc2VsZWN0b3IYASABKAkSDQoDZ2V0GAIgASgJSAASDQoDcHV0GAMgASgJSAASDgoEcG9zdBgEIAEoCUgAEhAKBmRlbGV0ZRgFIAEoCUgAEg8KBXBhdGNoGAYgASgJSAASLwoGY3VzdG9tGAggASgLMh0uZ29vZ2xlLmFwaS5DdXN0b21IdHRwUGF0dGVybkgAEgwKBGJvZHkYByABKAkSFQoNcmVzcG9uc2VfYm9keRgMIAEoCRIxChNhZGRpdGlvbmFsX2JpbmRpbmdzGAsgAygLMhQuZ29vZ2xlLmFwaS5IdHRwUnVsZUIJCgdwYXR0ZXJuIi8KEUN1c3RvbUh0dHBQYXR0ZXJuEgwKBGtpbmQYASABKAkSDAoEcGF0aBgCIAEoCUJqCg5jb20uZ29vZ2xlLmFwaUIJSHR0cFByb3RvUAFaQWdvb2dsZS5nb2xhbmcub3JnL2dlbnByb3RvL2dvb2dsZWFwaXMvYXBpL2Fubm90YXRpb25zO2Fubm90YXRpb25z+AEBogIER0FQSWIGcHJvdG8z");
    var A = e.i(675618);
    let y = (0, o.fileDesc)("Chxnb29nbGUvYXBpL2Fubm90YXRpb25zLnByb3RvEgpnb29nbGUuYXBpOksKBGh0dHASHi5nb29nbGUucHJvdG9idWYuTWV0aG9kT3B0aW9ucxiwyrwiIAEoCzIULmdvb2dsZS5hcGkuSHR0cFJ1bGVSBGh0dHBCbgoOY29tLmdvb2dsZS5hcGlCEEFubm90YXRpb25zUHJvdG9QAVpBZ29vZ2xlLmdvbGFuZy5vcmcvZ2VucHJvdG8vZ29vZ2xlYXBpcy9hcGkvYW5ub3RhdGlvbnM7YW5ub3RhdGlvbnOiAgRHQVBJYgZwcm90bzM", [v, A.file_google_protobuf_descriptor]),
        I = (0, o.fileDesc)("Cllyb2Jsb3gvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvdjEvZXhwZXJpZW5jZV9zaWduYWxzX2luZ2VzdC5wcm90bxI5cm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxIoIBCgVFdmVudBIOCgZzb3VyY2UYASABKAkSDwoHcGF5bG9hZBgCIAEoDBJYCgpyb2Jsb3hfY3R4GAMgASgLMkQucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlJvYmxveEN0eCKfAQoJUm9ibG94Q3R4EmIKB2hlYWRlcnMYASADKAsyUS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4LkhlYWRlcnNFbnRyeRouCgxIZWFkZXJzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgJOgI4ASJLCgZTb3VyY2USDAoEbmFtZRgBIAEoCRITCgtrYWZrYV90b3BpYxgCIAEoCRIPCgdibG9ja2VkGAMgASgIEg0KBW5vdGVzGAQgASgJIl0KB1NvdXJjZXMSUgoHc291cmNlcxgBIAMoCzJBLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5Tb3VyY2UiGwoIUmVzcG9uc2USDwoHbWVzc2FnZRgCIAEoCULPAQo9Y29tLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MUIcRXhwZXJpZW5jZVNpZ25hbHNJbmdlc3RQcm90b1ABWjJleHBlcmllbmNlc2lnbmFsc2luZ2VzdC9leHBlcmllbmNlc2lnbmFsc2luZ2VzdC92MaoCOVJvYmxveC5FeHBlcmllbmNlU2lnbmFsc0luZ2VzdC5FeHBlcmllbmNlU2lnbmFsc0luZ2VzdC5WMWIGcHJvdG8z"),
        E = (0, o.fileDesc)("Ch1yb2Jsb3gvcHJvdG9idWYvb3B0aW9ucy5wcm90bxIPcm9ibG94LnByb3RvYnVmIoQBChZTZXJ2aWNlQ29udHJhY3RPcHRpb25zEg8KB3B1Ymxpc2gYASABKAgSIwobY3NoYXJwX2dlbmVyYXRlX3NlcnZlcl9zdHViGAIgASgIEjQKLGludDY0X2lkX3dyYXBwZXJfZW50aXR5X2lkX2NzaGFycF9jb252ZXJzaW9uGAMgASgJOnQKEXNlcnZpY2VfY29udHJhY3RzEhwuZ29vZ2xlLnByb3RvYnVmLkZpbGVPcHRpb25zGNCGAyABKAsyJy5yb2Jsb3gucHJvdG9idWYuU2VydmljZUNvbnRyYWN0T3B0aW9uc1IQc2VydmljZUNvbnRyYWN0czo9CglzZW5zaXRpdmUSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGNGGAyABKAhSCXNlbnNpdGl2ZTpACglzcWxfdmFsdWUSIS5nb29nbGUucHJvdG9idWYuRW51bVZhbHVlT3B0aW9ucxji1AMgASgJUghzcWxWYWx1ZUIRWg9yb2Jsb3gvcHJvdG9idWZiBnByb3RvMw", [A.file_google_protobuf_descriptor]),
        C = (0, o.fileDesc)("Cl1yb2Jsb3gvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvdjEvZXhwZXJpZW5jZV9zaWduYWxzX2luZ2VzdF9hcGkucHJvdG8SOXJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MSJkChBTZW5kQmF0Y2hSZXF1ZXN0ElAKBmV2ZW50cxgBIAMoCzJALnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5FdmVudCITChFTZW5kQmF0Y2hSZXNwb25zZSKZAgoZU2VuZE9wdGltaXplZEJhdGNoUmVxdWVzdBJyCgtzdWJfYmF0Y2hlcxgBIAMoCzJdLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5TZW5kT3B0aW1pemVkQmF0Y2hSZXF1ZXN0LlN1YkJhdGNoGocBCghTdWJCYXRjaBIOCgZzb3VyY2UYASABKAkSEAoIcGF5bG9hZHMYAiADKAwSWQoLcm9ibG94X2N0eHMYAyADKAsyRC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4IhwKGlNlbmRPcHRpbWl6ZWRCYXRjaFJlc3BvbnNlIpYBChdTZW5kVW5pZm9ybUJhdGNoUmVxdWVzdBIOCgZzb3VyY2UYASABKAkSEAoIcGF5bG9hZHMYAiADKAwSWQoLcm9ibG94X2N0eHMYAyADKAsyRC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4IhoKGFNlbmRVbmlmb3JtQmF0Y2hSZXNwb25zZSJjChBTZW5kRXZlbnRSZXF1ZXN0Ek8KBWV2ZW50GAEgASgLMkAucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkV2ZW50IhMKEVNlbmRFdmVudFJlc3BvbnNlIhQKEkxpc3RTb3VyY2VzUmVxdWVzdCJpChNMaXN0U291cmNlc1Jlc3BvbnNlElIKB3NvdXJjZXMYASADKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlIiAKEEdldFNvdXJjZVJlcXVlc3QSDAoEbmFtZRgBIAEoCSJmChFHZXRTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlImgKE0NyZWF0ZVNvdXJjZVJlcXVlc3QSUQoGc291cmNlGAEgASgLMkEucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNvdXJjZSJpChRDcmVhdGVTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlIo0BChNVcGRhdGVTb3VyY2VSZXF1ZXN0EgwKBG5hbWUYASABKAkSGAoLa2Fma2FfdG9waWMYAiABKAlIAIgBARIUCgdibG9ja2VkGAMgASgISAGIAQESEgoFbm90ZXMYBCABKAlIAogBAUIOCgxfa2Fma2FfdG9waWNCCgoIX2Jsb2NrZWRCCAoGX25vdGVzImkKFFVwZGF0ZVNvdXJjZVJlc3BvbnNlElEKBnNvdXJjZRgBIAEoCzJBLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5Tb3VyY2UiIwoTRGVsZXRlU291cmNlUmVxdWVzdBIMCgRuYW1lGAEgASgJIicKFERlbGV0ZVNvdXJjZVJlc3BvbnNlEg8KB2RlbGV0ZWQYASABKAgiIgoSVG91Y2hTb3VyY2VSZXF1ZXN0EgwKBG5hbWUYASABKAkiaAoTVG91Y2hTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlMqgQChpFeHBlcmllbmNlU2lnbmFsc0luZ2VzdEFQSRK9AQoJU2VuZEJhdGNoEksucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRCYXRjaFJlcXVlc3QaTC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZEJhdGNoUmVzcG9uc2UiFYLT5JMCDyIKL3YxL2V2ZW50czoBKhLiAQoSU2VuZE9wdGltaXplZEJhdGNoElQucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRPcHRpbWl6ZWRCYXRjaFJlcXVlc3QaVS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZE9wdGltaXplZEJhdGNoUmVzcG9uc2UiH4LT5JMCGSIUL3YxL2V2ZW50cy9vcHRpbWl6ZWQ6ASoS2gEKEFNlbmRVbmlmb3JtQmF0Y2gSUi5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZFVuaWZvcm1CYXRjaFJlcXVlc3QaUy5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZFVuaWZvcm1CYXRjaFJlc3BvbnNlIh2C0+STAhciEi92MS9ldmVudHMvdW5pZm9ybToBKhLEAQoJU2VuZEV2ZW50Eksucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRFdmVudFJlcXVlc3QaTC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZEV2ZW50UmVzcG9uc2UiHILT5JMCFiIRL3YxL2V2ZW50cy9zaW5nbGU6ASoSwQEKC0xpc3RTb3VyY2VzEk0ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkxpc3RTb3VyY2VzUmVxdWVzdBpOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5MaXN0U291cmNlc1Jlc3BvbnNlIhOC0+STAg0SCy92MS9zb3VyY2VzEsIBCglHZXRTb3VyY2USSy5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuR2V0U291cmNlUmVxdWVzdBpMLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5HZXRTb3VyY2VSZXNwb25zZSIagtPkkwIUEhIvdjEvc291cmNlcy97bmFtZX0SxwEKDENyZWF0ZVNvdXJjZRJOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5DcmVhdGVTb3VyY2VSZXF1ZXN0Gk8ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkNyZWF0ZVNvdXJjZVJlc3BvbnNlIhaC0+STAhAiCy92MS9zb3VyY2VzOgEqEs4BCgxVcGRhdGVTb3VyY2USTi5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuVXBkYXRlU291cmNlUmVxdWVzdBpPLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5VcGRhdGVTb3VyY2VSZXNwb25zZSIdgtPkkwIXMhIvdjEvc291cmNlcy97bmFtZX06ASoSywEKDERlbGV0ZVNvdXJjZRJOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5EZWxldGVTb3VyY2VSZXF1ZXN0Gk8ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkRlbGV0ZVNvdXJjZVJlc3BvbnNlIhqC0+STAhQqEi92MS9zb3VyY2VzL3tuYW1lfRLOAQoLVG91Y2hTb3VyY2USTS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuVG91Y2hTb3VyY2VSZXF1ZXN0Gk4ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlRvdWNoU291cmNlUmVzcG9uc2UiIILT5JMCGiIYL3YxL3NvdXJjZXMve25hbWV9L3RvdWNoQtgBCj1jb20ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxQh9FeHBlcmllbmNlU2lnbmFsc0luZ2VzdEFwaVByb3RvUAFaMmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0L2V4cGVyaWVuY2VzaWduYWxzaW5nZXN0L3YxqgI5Um9ibG94LkV4cGVyaWVuY2VTaWduYWxzSW5nZXN0LkV4cGVyaWVuY2VTaWduYWxzSW5nZXN0LlYxgrUYAggBYgZwcm90bzM", [y, I, E]),
        w = (0, s.messageDesc)(C, 2),
        S = (0, s.messageDesc)(C, 2, 0),
        N = (0, s.messageDesc)(C, 6);
    var x = class {
            async sendEvent(e, t) {
                try {
                    let n = (0, h.toBinary)(e, (0, f.create)(e, t), {
                            writeUnknownFields: !1
                        }),
                        a = (0, f.create)(N, {
                            event: {
                                source: e.typeName,
                                payload: n
                            }
                        }),
                        r = await fetch(`${this.baseUrl}/v1/events/single`, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-protobuf",
                                "Content-Encoding": "gzip"
                            },
                            body: (0, b.gzipSync)((0, h.toBinary)(N, a, {
                                writeUnknownFields: !1
                            })),
                            credentials: "include",
                            keepalive: !0
                        });
                    if (!r.ok) throw Error(`status ${r.status}`)
                } catch (e) {
                    console.error("EventStream failed to send event:", e)
                }
            }
            async sendBatch(e) {
                try {
                    let t = new Map;
                    for (let n of e) {
                        let e = n.schema.typeName;
                        t.has(e) || t.set(e, []), t.get(e).push(n)
                    }
                    let n = Array.from(t.entries()).map(e => {
                            let [t, n] = e, a = n.map(e => {
                                let {
                                    schema: t,
                                    msg: n
                                } = e;
                                return (0, h.toBinary)(t, (0, f.create)(t, n), {
                                    writeUnknownFields: !1
                                })
                            });
                            return (0, f.create)(S, {
                                source: t,
                                payloads: a
                            })
                        }),
                        a = (0, f.create)(w, {
                            subBatches: n
                        }),
                        r = await fetch(`${this.baseUrl}/v1/events/optimized`, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-protobuf",
                                "Content-Encoding": "gzip"
                            },
                            body: (0, b.gzipSync)((0, h.toBinary)(w, a, {
                                writeUnknownFields: !1
                            })),
                            credentials: "include",
                            keepalive: !0
                        });
                    if (!r.ok) throw Error(`status ${r.status}`)
                } catch (e) {
                    console.error("EventStream failed to send batch events:", e)
                }
            }
            constructor({
                baseUrl: e = "https://apis.roblox.com"
            } = {}) {
                (0, g._)(this, "baseUrl", void 0), this.baseUrl = e.replace(/\/$/, "") + "/experience-signals-ingest/public"
            }
        },
        V = e.i(559659),
        T = e.i(358239);
    let Z = (0, V.createFireTelemetryHistogram)("WWW_PageTelemetry", {}),
        R = {
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
        L = /[^A-Za-z0-9_]/g,
        P = {
            ttfb: "TTFB",
            fcp: "FCP",
            lcp: "LCP",
            inp: "INP",
            cls: "CLS"
        };
    var F = e.i(245837);
    let k = {
            LCP: "lcp",
            FCP: "fcp",
            TTFB: "ttfb",
            CLS: "cls",
            INP: "inp"
        },
        X = () => ({
            pageNameSet: !1,
            pageName: void 0,
            sent: !1
        }),
        _ = X();
    e.s(["default", 0, function(e) {
        let {
            pageName: o
        } = e, s = (0, a.useRef)({});
        return (0, r.useReportWebVitals)(e => {
            let t = k[e.name];
            t && (s.current[t] = {
                value: e.value
            })
        }), (0, a.useEffect)(() => {
            _.pageNameSet || (_.pageNameSet = !0, _.pageName = o)
        }, []), (0, a.useEffect)(() => {
            let e = () => {
                    if (_.sent) return;
                    _.sent = !0;
                    let e = function(e) {
                        if (null != e.ttfb || 0 === Object.keys(e).length || "u" < typeof performance) return;
                        let [t] = performance.getEntriesByType("navigation");
                        if (t && t.responseStart > 0) {
                            let e = t.activationStart ?? 0;
                            return {
                                value: Math.max(t.responseStart - e, 0)
                            }
                        }
                    }(s.current);
                    e && (s.current.ttfb = e),
                        function(e, a, r, i, o, s) {
                            if (!a) return;
                            let c = a.lcp?.value,
                                u = a.fcp?.value,
                                d = a.ttfb?.value,
                                m = a.cls?.value,
                                g = a.inp?.value;
                            if ([c, u, d, m, g].some(e => "number" == typeof e)) try {
                                ((null == t || n !== e) && (t = new x({
                                    baseUrl: e
                                }), n = e), t).sendEvent(p, {
                                        localTimestamp: new Date().toISOString(),
                                        userEventBase: {
                                            userId: function(e) {
                                                if (null != e) return "bigint" == typeof e ? e : ("number" == typeof e ? (0, l.bigIntFromNumber)(e) : (0, l.parseBigInt)(e)) ?? void 0
                                            }(r)
                                        },
                                        page: i,
                                        url: window.location.href,
                                        lcpMs: c,
                                        fcpMs: u,
                                        ttfbMs: d,
                                        cls: m,
                                        inpMs: g,
                                        renderPlatform: s
                                    }).catch(() => {}),
                                    function(e, t, n) {
                                        if (!e) return;
                                        let a = (void 0 === t || "" === t ? "Unknown" : t).replace(L, "_");
                                        if (Math.random() >= (R[a] ?? .05)) return;
                                        let {
                                            appType: r,
                                            browser: i
                                        } = (0, T.getDeviceClient)(), l = {
                                            appType: r,
                                            browser: i,
                                            host: n
                                        }, o = !1;
                                        for (let [t, n] of Object.entries(P)) {
                                            let r = e[t]?.value;
                                            "number" == typeof r && (Z(`PagePerf_${n}_${a}`, l, r), o = !0)
                                        }
                                        o && (0, V.flushTelemetryHistograms)()
                                    }(a, o, s)
                            } catch (e) {
                                console.error("[PERF] Failed to send web vitals:", e)
                            }
                        }(F.default.apiGatewayUrl, s.current, (0, i.getCurrentUser)()?.id, o, _.pageName, "nextjs")
                },
                a = () => {
                    "hidden" === document.visibilityState && e()
                };
            return document.addEventListener("visibilitychange", a), window.addEventListener("pagehide", e), () => {
                document.removeEventListener("visibilitychange", a), window.removeEventListener("pagehide", e)
            }
        }, [o]), null
    }, "resetDocumentLoadForTests", 0, () => {
        _ = X()
    }], 8888)
}, 967069, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(526005),
        a = e.i(708923),
        r = e.i(523131),
        i = e.i(878727),
        l = e.i(587541),
        o = e.i(690255),
        s = e.i(801827),
        c = e.i(360702),
        u = e.i(883355),
        d = e.i(646424),
        m = e.i(815079);
    e.i(350223);
    var p = e.i(874296);
    let g = p.object({
            cooldownPeriodInMs: p.number()
        }),
        h = p.object({
            id: p.string(),
            agreementType: p.string(),
            clientType: p.literal(["Web"]),
            regulationType: p.string(),
            displayUrl: p.string(),
            agreementBodyText: p.nullish(p.string()),
            action: p.optional(p.string())
        }),
        f = p.array(h),
        b = c.AsyncResult.fn(async e => {
            let t = u.getItem("userAgreements");
            if (t?.version === 0) {
                let n = t.data[e];
                if (null != n) {
                    let {
                        cooldownPeriodInMs: e
                    } = await d.get(m.apiGateway.withPath("/guac-v2/v1/bundles/user-agreements-policy"), g, {
                        credentials: "include"
                    }).getOrDefault({
                        cooldownPeriodInMs: 864e5
                    });
                    if (Date.now() < n + e) return (0, c.ok)([])
                }
            }
            return d.get(m.apiGateway.withPath("/user-agreements/v1/agreements-resolution/web"), f, {
                credentials: "include"
            }).inspect(n => {
                if (0 === n.length && (null == t || 0 === t.version)) {
                    let n = t?.data ?? {};
                    n[e] = Date.now();
                    let a = Object.entries(n);
                    a.length > 100 && (a = a.sort((e, t) => e[1] - t[1]).slice(-100)), u.setItem("userAgreements", {
                        version: 0,
                        data: Object.fromEntries(a)
                    })
                }
            })
        }),
        v = {
            TermsOfService: "Modal.Agreement.TermsOfService",
            PrivacyPolicy: "Modal.Agreement.PrivacyPolicy",
            RiderTerms: "Modal.Agreement.RiderTerms",
            ChildrenPrivacyPolicy: "Modal.Agreement.ChildrenPrivacyPolicy"
        };
    e.s(["default", 0, function(e) {
        let {
            userId: c
        } = e, u = (0, s.useTranslations)("CommonUI.UserAgreements"), {
            data: p
        } = (0, a.useQuery)({
            queryKey: ["outstanding-user-agreements", c],
            queryFn: () => b(c).getOrThrow(),
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
                }, d.postUntyped(m.apiGateway.withPath("/user-agreements/v1/acceptances"), t, {
                    credentials: "include"
                })).getOrThrow()
            }
        }), h = p?.find(e => null != e.agreementBodyText)?.agreementBodyText;
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
                        children: u("Modal.Title")
                    }), (0, t.jsx)("p", {
                        className: "text-body-large content-default",
                        children: h ?? u("Modal.Body")
                    }), (0, t.jsx)("ul", {
                        className: "flex flex-col gap-medium",
                        children: p.map(e => {
                            let {
                                id: n,
                                agreementType: a,
                                displayUrl: r
                            } = e;
                            return l.Url.parse(r).map(e => (0, t.jsx)("li", {
                                children: (0, t.jsx)(o.Link, {
                                    href: e,
                                    target: "_blank",
                                    rel: "noreferrer",
                                    className: "text-body-large content-link",
                                    children: Object.hasOwn(v, a) ? u(v[a]) : r
                                })
                            }, n)).getOrNull()
                        })
                    })]
                }), (0, t.jsx)(i.DialogFooter, {
                    className: "flex",
                    children: (0, t.jsx)(r.Button, {
                        variant: "Emphasis",
                        size: "Medium",
                        className: "fill basis-0",
                        isDisabled: g.isPending,
                        onClick: () => {
                            g.isPending || g.mutate(p)
                        },
                        children: u("Modal.Agree")
                    })
                })]
            })
        })
    }], 967069)
}, 795883, e => {
    "use strict";
    let t, n, a, r, i;
    var l = e.i(420482),
        o = e.i(357355),
        s = e.i(217827);
    e.i(350223);
    var c = e.i(874296),
        u = e.i(646424),
        d = e.i(815079);
    let m = c.object({
            accountTheme: c.object({
                currentValue: c.string()
            })
        }),
        p = ["theme-classic", "theme-circuit-rush", "theme-cosmic-dust", "theme-electric-lime", "theme-hyper-plum", "theme-inferno-blast", "theme-kinetic-energy", "theme-lava-glow", "theme-nebula-drift", "theme-nitro-frost", "theme-pixel-pop", "theme-polar-freeze", "theme-quantum-pulse", "theme-star-burst", "theme-super-charge"],
        g = (n = new Set, a = null, r = 0, i = e => {
            void 0 !== t && t !== e && n.add(t), n.delete(e), t = e
        }, {
            startChange: e => (n.add(e), void 0 !== t && n.add(t), r += 1, a = r),
            finishChange: (e, t) => {
                if (e === a) return a = null, i(t), t
            },
            observeServer: e => {
                if (n.has(e)) return t;
                n.size > 0 && (a = null, i(e))
            }
        }),
        h = e => {
            if (null == o.document) return;
            let {
                classList: t
            } = o.document.body;
            t.remove(...p.filter(t => t !== e)), null != e && t.add(e)
        };
    e.s(["default", 0, function(e) {
        let {
            serverThemeClass: t
        } = e, n = (0, l.useRef)(t);
        return (0, l.useLayoutEffect)(() => {
            n.current = t;
            let e = g.observeServer(t);
            void 0 !== e && h(e)
        }), (0, s.useRealtimeNamespace)("UserSettingsChanged", e => {
            if (!("object" == typeof e && null != e && "SettingsChanged" in e && Array.isArray(e.SettingsChanged) && e.SettingsChanged.includes("AccountTheme"))) return;
            let t = g.startChange(n.current);
            u.get(d.apiGateway.withPath("/user-settings-api/v2/user-settings/settings-and-options-subset").withSearchParams({
                requestedUserSettings: "accountTheme"
            }), m, {
                credentials: "include"
            }).map(e => e.accountTheme.currentValue).inspect(e => {
                let n, a = g.finishChange(t, (n = `theme-${e.replaceAll(/([a-z])([A-Z])/g,"$1-$2").toLowerCase()}`, p.find(e => e === n) ?? null));
                void 0 !== a && h(a)
            })
        }), null
    }], 795883)
}, 721955, e => {
    "use strict";
    var t = e.i(420482),
        n = e.i(708923);
    e.i(350223);
    var a = e.i(874296),
        r = e.i(646424),
        i = e.i(883355),
        l = e.i(815079);
    let o = "classic-theme-variant",
        s = "classic-theme-variant-1",
        c = "PlayerApp.R20.AccessEnrollment",
        u = a.object({
            layers: a.object({
                [c]: a.object({
                    parameters: a.object({
                        FFlagAppClassicThemeGreenButtonColors: a.optional(a.unknown())
                    })
                })
            })
        }),
        d = () => {
            let e = i.getItem(o) ?? {
                version: 0,
                data: []
            };
            return 0 === e.version ? e.data : null
        };
    e.s(["default", 0, function(e) {
        let {
            userId: a
        } = e, [m, p] = (0, t.useState)(!1), {
            data: g
        } = (0, n.useQuery)({
            queryKey: ["ixp", c],
            queryFn: () => r.post(l.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                layers: {
                    [c]: {}
                }
            }, u, {
                credentials: "include"
            }).map(e => {
                let {
                    layers: t
                } = e;
                return !0 === t[c].parameters.FFlagAppClassicThemeGreenButtonColors
            }).getOrThrow(),
            enabled: m,
            staleTime: 1 / 0
        });
        return (0, t.useEffect)(() => {
            let e = d();
            null != e && (e.includes(a) && document.body.classList.add(s), p(!0))
        }, [a]), (0, t.useEffect)(() => {
            if (null == g) return;
            document.body.classList.toggle(s, g);
            let e = d();
            if (null == e) return;
            let t = e.includes(a);
            g && !t ? i.setItem(o, {
                version: 0,
                data: [...e, a]
            }) : !g && t && i.setItem(o, {
                version: 0,
                data: e.filter(e => e !== a)
            })
        }, [g, a]), null
    }])
}, 931637, e => {
    "use strict";
    let t;
    var n = e.i(19836),
        a = e.i(910030),
        r = e.i(391855),
        i = e.i(784859);
    let l = () => new a.QueryClient({
        defaultOptions: {
            queries: {
                retry: !1
            }
        }
    });
    e.s(["default", 0, function(e) {
        let {
            children: a
        } = e;
        return (0, n.jsx)(r.QueryClientProvider, {
            client: i.isServer ? l() : t ??= l(),
            children: a
        })
    }])
}]);

//# debugId=15c70e32-c619-f89c-1ec4-ab3e7c6f4cf3
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0h0i8n..h_1el.js.map