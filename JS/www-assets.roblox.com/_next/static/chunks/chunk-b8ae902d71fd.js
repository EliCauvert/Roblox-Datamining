;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4c350ce2-6c86-9487-9814-ac49f2282cc1")
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
        o = new r.QueryClient({
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
                client: o,
                children: (0, t.jsx)(s, {
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
        s = e.i(686790),
        o = e.i(750341),
        c = e.i(523131),
        u = e.i(801827),
        d = e.i(815079),
        m = e.i(690255);
    let p = (0, o.default)(() => e.A(31611), {
            loadableGenerated: {
                modules: [358424]
            }
        }),
        g = "{privacyPolicyLink}";

    function h(e) {
        let {
            cookiePolicy: a,
            onClose: r
        } = e, [i, l] = (0, n.useState)(!1), o = (0, u.useTranslations)("Feature.Tracking"), h = (0, u.useTranslations)("CommonUI.Controls"), f = o("Description.CookieBannerContent", {
            privacyPolicyLink: g
        }), b = f.indexOf(g), v = e => {
            (0, s.setUserConsent)(e, a.NonEssentialCookieList), r()
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
                        children: o("Description.PrivacyPolicy")
                    }), f.substring(b + g.length)]
                }), (0, t.jsxs)("div", {
                    className: "flex justify-between",
                    children: [(0, t.jsx)(c.Button, {
                        variant: "Link",
                        onClick: () => {
                            l(!0)
                        },
                        children: o("Action.SetCookieOptions")
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
            o = !!e.current()?.value,
            {
                data: c,
                isLoading: u
            } = (0, a.useQuery)({
                queryKey: ["cookie-policy"],
                queryFn: () => (0, l.getCookiePolicy)().getOrThrow(),
                enabled: !o,
                staleTime: 1 / 0
            }),
            [d, m] = (0, n.useState)(!1),
            p = c?.ShouldDisplayCookieBannerV3 && c.EssentialCookieList.length > 0,
            g = !o && !u && !p;
        return (0, n.useEffect)(() => {
            g && null != c && (0, s.setUserConsent)(c.NonEssentialCookieList, c.NonEssentialCookieList)
        }, [g, c]), o || !p || d ? null : (0, t.jsx)(h, {
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
        s = e.i(747769),
        o = e.i(28729),
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
                leadingIconNode: y,
                trailingIconNode: I,
                hasError: A,
                error: E,
                helperText: C,
                size: w,
                variant: N = "Standard",
                isRequired: S,
                isDisabled: x,
                className: V,
                style: T,
                inputContainerClassName: Z,
                inputContainerClassStyle: R,
                id: L,
                ...F
            } = e, k = (0, o.default)(), P = L || k, X = `${P}-description`, G = w ?? "Large", _ = A || !!E, B = E || C, D = (0, n.useMemo)(() => i ? n.default.createElement(s.Icon, {
                name: i,
                size: G,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : y, [i, y, G]), W = (0, n.useMemo)(() => v ? n.default.createElement(s.Icon, {
                name: v,
                size: G,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : I, [G, v, I]), j = a ? n.default.createElement("label", {
                htmlFor: P,
                className: (0, d.default)(f[G], "content-emphasis")
            }, a, S && n.default.createElement(n.default.Fragment, null, " ", n.default.createElement("span", {
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
                className: (0, d.default)("foundation-web-input flex items-center width-full", u.INPUT_STROKE_BY_VARIANT[N], u.INPUT_BACKGROUND_BY_VARIANT[N], Z, g[G], h[G], m[G], p[G], _ ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: R
            }, D, n.default.createElement("input", {
                type: "text",
                id: P,
                ref: t,
                className: (0, d.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", b[G]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": _,
                "aria-describedby": B ? X : void 0,
                required: S,
                ...F,
                disabled: x
            }), W), B && n.default.createElement("span", {
                id: X,
                className: (0, d.default)("text-caption-small", {
                    "content-system-alert": _,
                    "content-default": !_
                })
            }, B))
        });
    v.displayName = "TextInput";
    let y = "configurewebapps:overrideschanged",
        I = e => {
            let {
                fields: l
            } = e, s = (0, n.useCallback)(() => l.map(e => e.read()), [l]), [o, c] = (0, n.useState)(s), [u, d] = (0, n.useState)(o), [m, p] = (0, n.useState)(!1), g = o.some(e => "" !== e), h = (0, n.useRef)(o);
            h.current = o;
            let f = (0, n.useCallback)(() => {
                let e = s(),
                    t = h.current;
                e.every((e, n) => e === t[n]) || (d(n => n.map((n, a) => n === t[a] ? e[a] ?? "" : n)), c(e), p(!0))
            }, [s]);
            (0, n.useEffect)(() => (window.addEventListener(y, f), () => {
                window.removeEventListener(y, f)
            }), [f]);
            let b = (e, t) => {
                    let n = l[e];
                    if (null == n) return;
                    n.write(t), p(!0);
                    let a = n.read(),
                        r = t => t.map((t, n) => n === e ? a : t);
                    c(r), d(r)
                },
                I = l.map((e, t) => m || !o[t] ? null : e.warning?.(o[t]) ?? null),
                A = l.map((e, t) => o[t] ? `${e.summaryLabel}: ${o[t]}${I[t]?" (not served)":""}` : "").filter(Boolean).join(" · ");
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
                                helperText: `current: ${""===o[n]?e.emptyText:o[n]??""}`,
                                size: "Small",
                                placeholder: e.placeholder,
                                value: u[n] ?? "",
                                onChange: e => {
                                    let {
                                        value: t
                                    } = e.target;
                                    d(e => e.map((e, a) => a === n ? t : e))
                                }
                            }), I[n] && (0, t.jsx)("span", {
                                role: "alert",
                                className: "text-caption-medium content-system-alert",
                                children: I[n]
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
    var A = e.i(357355),
        E = e.i(586588),
        C = e.i(940311);
    let w = "mrrouter-env",
        N = /^(\d+)-/,
        S = /@(\d+)-/,
        x = {
            label: "MrRouter env",
            summaryLabel: "env",
            placeholder: "e.g. 19563-website-ne",
            emptyText: "default routing",
            read: C.getMrRouterEnvName,
            write: e => {
                (0, C.setMrRouterEnvName)(e), window.dispatchEvent(new Event(y))
            },
            warning: e => {
                let t = N.exec(e)?.[1],
                    n = A.document?.getElementById("rbx-sentry-config")?.dataset.release;
                return null == t || null == n || "" === n || S.exec(n)?.[1] === t ? null : `This page came from ${n}, not ${e}. The env may be missing, expired, or still deploying.`
            }
        },
        V = [x];
    e.s(["default", 0, function() {
        let [e, a] = (0, n.useState)(!1);
        return (0, n.useEffect)(() => {
            var e;
            let t, n, r;
            (null == (r = null == A.window ? null : (e = A.window.location.href, t = E.AnyUrl.parse(e).getOrNull(), n = t?.searchParams.get(w), null == t || null == n ? null : ((0, C.setMrRouterEnvName)(n.trim()), t.withSearchParams(t.searchParams.copyAndDelete(w)).toString()))) || (A.window?.location.replace(r), 0)) && (window.MrRouter = {
                getEnvName: C.getMrRouterEnvName,
                setEnvName: e => {
                    x.write(e ?? "")
                }
            }, a(!("Cypress" in window)))
        }, []), e ? (0, t.jsx)(I, {
            fields: V
        }) : null
    }], 963157)
}, 512294, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var a = {
        default: function() {
            return u
        },
        getImageProps: function() {
            return c
        }
    };
    for (var r in a) Object.defineProperty(n, r, {
        enumerable: !0,
        get: a[r]
    });
    let i = e.r(481258),
        l = e.r(476199),
        s = e.r(252696),
        o = i._(e.r(673033));

    function c(e) {
        let {
            props: t
        } = (0, l.getImgProps)(e, {
            defaultLoader: o.default,
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
        for (let [e, n] of Object.entries(t)) void 0 === n && delete t[e];
        return {
            props: t
        }
    }
    let u = s.Image
}, 97333, (e, t, n) => {
    t.exports = e.r(512294)
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
        } = e, [l, s] = (0, a.useState)(!1);
        return (0, t.jsxs)(t.Fragment, {
            children: [(0, t.jsx)("button", {
                type: "button",
                className: "flex items-center gap-xsmall hover:content-emphasis",
                onClick: () => {
                    s(!0)
                },
                children: i
            }), l && (0, t.jsx)(r, {
                userId: n,
                onClose: () => {
                    s(!1)
                }
            })]
        })
    }
    var l = e.i(815079),
        s = e.i(690255),
        o = e.i(97333),
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
            children: [e("Label.YourPrivacyChoices"), (0, t.jsx)(o.default, {
                src: u,
                alt: "",
                className: "width-800"
            })]
        })
    }

    function m() {
        return (0, t.jsx)(s.Link, {
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
    let s = (0, a.default)(() => e.A(31611), {
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
            [o, c] = (0, n.useState)(!1),
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
            }), o ? (0, t.jsx)(s, {
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
        s = (0, n.default)(() => e.A(339834), {
            loadableGenerated: {
                modules: [105584]
            }
        });
    e.s(["default", 0, function(e) {
        let {
            userId: n,
            variant: o
        } = e, c = (0, a.usePath)();
        return null != n || l.has(r(c)) ? (0, t.jsx)(s, {
            userId: n,
            isSignUpOrLandingPage: i.has(r(c)),
            variant: o
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
    let s = (0, n.default)(() => e.A(802269), {
            loadableGenerated: {
                modules: [412516]
            },
            ssr: !1
        }),
        {
            ModalEvent: o
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
            return window.addEventListener(o.MountSearchLanding, e), window.addEventListener(o.ShowSearchLanding, t), u && e(), () => {
                window.removeEventListener(o.MountSearchLanding, e), window.removeEventListener(o.ShowSearchLanding, t)
            }
        }, []);
        let m = (0, a.useCallback)(() => {
            if (i.current = !0, null !== c.current) {
                let e = c.current;
                c.current = null, d.show(e)
            }
        }, []);
        return e ? (0, r.createPortal)((0, t.jsx)(s, {
            onReady: m
        }), e) : null
    }, "resetMountRequestForTests", 0, () => {
        u = !1
    }, "searchLandingCapability", 0, d])
}, 776771, e => {
    "use strict";
    let t, n, a;
    var r, i, l, s, o, c, u, d, m, p, g, h, f, b, v, y, I, A, E, C = e.i(19836),
        w = e.i(750341),
        N = e.i(420482),
        S = e.i(285586),
        x = e.i(708923);
    e.i(350223);
    var V = e.i(874296),
        T = e.i(646424),
        Z = e.i(552566),
        R = e.i(587541),
        L = e.i(599965),
        F = e.i(815079),
        k = e.i(380952),
        P = e.i(217827),
        X = e.i(360702),
        G = e.i(645020),
        _ = e.i(932598),
        B = e.i(55001),
        D = e.i(251734),
        W = e.i(778935),
        j = e.i(392435),
        Y = e.i(431545);
    let U = (e, t) => ["trustedFriendAction", e, t?.join(",") ?? void 0],
        J = "RemoveTrustedConnection",
        O = "AddTrustedConnectionViaLink",
        z = "AddTrustedFriendDoubleOptin",
        M = "AddTrustedFriendWithVpc",
        H = "AcceptTrustedFriendViaLinkWithVpcRecipient",
        Q = "AcceptTrustedFriendWithVpcRecipient",
        $ = "AcceptTrustedFriendViaLink",
        K = "AcceptTrustedFriend",
        q = "PendingTrustedConnection",
        ee = "PendingIncomingTrustedConnection",
        et = {
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
        en = "Friends",
        ea = "RequestReceived",
        er = "TrustedFriends",
        ei = "NotFriends",
        el = {
            [J]: er,
            [O]: ei,
            [z]: en,
            [M]: en,
            [q]: en,
            [H]: ea,
            [Q]: ea,
            [$]: ea,
            [K]: ea,
            [ee]: ea
        },
        es = "trustedFriendsOk",
        eo = "sendTrustedFriendRequest",
        ec = "acceptTrustedFriend",
        eu = "acceptTrustedFriendViaLink",
        ed = "vpcUpsell",
        em = "vpcLinkRecipientUpsell",
        ep = "noop",
        eg = "addViaLinkEmpty",
        eh = {
            [J]: {
                primary: {
                    textKey: "Action.OK"
                },
                handler: es
            },
            [O]: {
                primary: {
                    textKey: "Button.AddViaLink"
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: eg
            },
            [z]: {
                primary: {
                    textKey: "Action.Add"
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: eo
            },
            [M]: {
                primary: {
                    textKey: "Action.Add",
                    showVpcIcon: !0
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: ed
            },
            [Q]: {
                primary: {
                    textKey: "Action.Accept",
                    showVpcIcon: !0
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: ed
            },
            [$]: {
                primary: {
                    textKey: "Action.Accept"
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: eu
            },
            [K]: {
                primary: {
                    textKey: "Action.Accept"
                },
                secondary: {
                    textKey: "Action.DontAccept"
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
                handler: em
            },
            [q]: {
                primary: {
                    textKey: "Action.Add",
                    isDisabled: !0
                },
                secondary: {
                    textKey: "Button.DontAdd"
                },
                handler: ep
            },
            [ee]: {
                primary: {
                    textKey: "Action.Accept",
                    isDisabled: !0
                },
                secondary: {
                    textKey: "Action.DontAccept"
                },
                handler: ep
            }
        },
        ef = {
            [en]: {
                title: "TrustedFriend.Label.AddTrustedFriend",
                description: "Description.DoMoreWithTrustedFriends"
            },
            [ei]: {
                title: "TrustedFriend.Label.AddTrustedFriend",
                description: "Description.DoMoreWithTrustedFriends"
            },
            [ea]: {
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
    var eb = e.i(391855);
    let ev = (0, N.createContext)(null),
        ey = () => {
            let e = (0, N.useContext)(ev);
            if (null == e) throw Error("TrustedFriendsModal needs a TrustedFriendsModalHostContext provider");
            return e
        };
    var eI = e.i(245837),
        eA = e.i(10224);
    let eE = () => `${eI.default.friendsApi}/v1`,
        eC = () => ({
            retryable: !0,
            withCredentials: !0
        });
    async function ew(e) {
        let t = {
                url: `${eE()}/users/${e}/accept-trusted-friend-request`,
                ...eC()
            },
            {
                data: n
            } = await eA.post(t, {});
        return n
    }
    async function eN(e, t) {
        let n = t ? `?source=${encodeURIComponent(t)}` : "",
            a = {
                url: `${eE()}/users/${e}/send-trusted-friend-request${n}`,
                ...eC()
            },
            {
                data: r
            } = await eA.post(a, {});
        return r
    }
    async function eS(e, t) {
        let n = {
                url: `${eE()}/users/${e}/validate-trusted-friend-link`,
                ...eC()
            },
            {
                data: a
            } = await eA.post(n, {
                Tokens: t
            });
        return a
    }
    async function ex(e, t) {
        let n = {
                url: `${eE()}/users/${e}/add-trusted-friend-from-link`,
                ...eC()
            },
            {
                data: a
            } = await eA.post(n, {
                Tokens: t
            });
        return a
    }
    async function eV(e) {
        let t = {
                url: `${eE()}/users/${e}/create-trusted-friend-link`,
                ...eC()
            },
            {
                data: n
            } = await eA.post(t, {});
        return n
    }
    async function eT(e, t) {
        let n = t?.friendRequestToken && Array.isArray(t.friendRequestToken) ? t.friendRequestToken.join(",") : void 0,
            a = {
                url: `${eI.default.apiGatewayUrl}/profile-platform-api/v1/profiles/get`,
                ...eC()
            },
            {
                data: r
            } = await eA.post(a, {
                profileType: "User",
                profileId: e,
                components: [{
                    component: "TrustedFriendActions",
                    context: n
                }]
            });
        return r.components?.TrustedFriendActions?.action
    }
    async function eZ(e) {
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
    async function eR(e, t) {
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
    var eL = ((r = {})[r.Invalid = 0] = "Invalid", r[r.PlayerSearch = 1] = "PlayerSearch", r[r.InGame = 2] = "InGame", r[r.UserProfile = 3] = "UserProfile", r[r.QqContactImporter = 4] = "QqContactImporter", r[r.WeChatContactImporter = 5] = "WeChatContactImporter", r[r.QrCode = 6] = "QrCode", r[r.ProfileShare = 7] = "ProfileShare", r[r.PhoneContactImporter = 8] = "PhoneContactImporter", r[r.OffNetworkFriendLink = 9] = "OffNetworkFriendLink", r[r.FriendRecommendations = 10] = "FriendRecommendations", r);
    async function eF(e) {
        let t = Array.isArray(e) ? e : [e];
        if (0 === t.length) return {
            userInsights: []
        };
        let n = {
                url: `${eI.default.apiGatewayUrl}/profile-insights-api/v1/multiProfileInsights`,
                retryable: !0,
                withCredentials: !0
            },
            {
                data: a
            } = await eA.post(n, {
                userIds: t,
                rankingStrategy: "tc_info_boost",
                count: 8
            });
        return a
    }
    let ek = {
            [eL.QrCode]: {
                iconName: "icon-filled-squares-grid-qr",
                translationKey: et.friendRequestOriginQrCode
            },
            [eL.PhoneContactImporter]: {
                iconName: "icon-filled-smartphone-portrait",
                translationKey: et.friendRequestOriginPhoneContactImporter
            },
            [eL.PlayerSearch]: {
                iconName: "icon-filled-magnifying-glass",
                translationKey: et.friendRequestOriginPlayerSearch
            }
        },
        eP = {
            mutualFriendCount: 0
        };

    function eX(e) {
        if ("string" == typeof e) {
            let t = Date.parse(e);
            return Number.isFinite(t) ? Math.floor(t / 1e3) : void 0
        }
        if ("object" == typeof e && null !== e && "seconds" in e) {
            let t = e.seconds;
            return "number" == typeof t && t > 0 ? t : void 0
        }
    }
    let eG = e => {
            let {
                userId: t
            } = e, {
                translate: n
            } = (0, Y.useTranslation)(), {
                AvatarHeadshot: a,
                useUserNames: r
            } = ey(), {
                data: i,
                isSuccess: l,
                isFetching: s
            } = (0, x.useQuery)({
                queryKey: ["multiProfileInsights", t],
                queryFn: () => eF(t),
                refetchOnMount: !1,
                refetchOnWindowFocus: !1,
                refetchOnReconnect: !1
            }), [o, c] = (0, N.useState)(eP);
            (0, N.useEffect)(() => {
                if (!l) return void c(eP);
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
                        let s = l.friendshipAgeInsight,
                            o = eX(s?.friendsSinceDateTime);
                        o && (t = o);
                        let c = l.accountCreationDateInsight,
                            u = eX(c?.accountCreatedDateTime);
                        u && (n = new Date(1e3 * u).getFullYear());
                        let d = l.friendRequestOriginInsight;
                        d?.friendRequestOriginSource && (r = ek[d.friendRequestOriginSource])
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
            } = o, h = r(t), f = (0, N.useMemo)(() => (function(e, t, n) {
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
            })(d, n, et), [d, n]), b = p ?? "", v = b ? n(b) : "", y = v ? `${n(et.ageGroupLabel)} ${v}` : "", I = (0, N.useMemo)(() => [{
                id: "age-group",
                iconName: "icon-filled-shield-check",
                label: y
            }, f ? {
                id: "friendship-duration",
                iconName: "icon-filled-calendar",
                label: f
            } : {
                id: "not-a-friend",
                iconName: "icon-filled-triangle-exclamation",
                label: n(et.notAFriend)
            }, u > 0 ? {
                id: "mutual-friends",
                iconName: "icon-filled-two-people",
                label: n(et.mutualFriends, {
                    numConnections: u
                })
            } : {
                id: "no-mutual-friends",
                iconName: "icon-filled-triangle-exclamation",
                label: n(et.noMutualFriends)
            }, ...g ? [{
                id: "friend-request-origin",
                iconName: g.iconName,
                label: n(g.translationKey)
            }] : [], {
                id: "joined-year",
                iconName: "icon-filled-circle-i",
                label: n(et.joinedInYear, {
                    year: m ?? ""
                })
            }].filter(e => {
                var t;
                return !!(t = e.label) && ("string" != typeof t || t.length > 0)
            }), [m, y, f, g, u, n]);
            return (0, C.jsxs)("div", {
                className: "radius-large bg-shift-100 padding-large flex flex-col gap-large",
                children: [(0, C.jsxs)("div", {
                    className: "flex flex-row items-center gap-medium",
                    children: [(0, C.jsxs)("div", {
                        className: "trusted-friend-social-avatar-circle bg-shift-200",
                        children: [(0, C.jsx)(a, {
                            userId: t,
                            className: "trusted-friend-social-avatar-thumb radius-circle"
                        }), (0, C.jsx)("div", {
                            className: "trusted-friend-social-avatar-loading-overlay",
                            "aria-hidden": !0
                        })]
                    }), (0, C.jsxs)("div", {
                        className: "flex flex-col gap-xxsmall min-width-0",
                        children: [(0, C.jsx)("p", {
                            className: "text-heading-small text-overflow-ellipsis margin-none",
                            children: h?.combinedName ?? ""
                        }), (0, C.jsx)("p", {
                            className: "text-body-medium content-default text-overflow-ellipsis margin-none",
                            children: h?.username ?? ""
                        })]
                    })]
                }), I.length && !s ? (0, C.jsx)("ul", {
                    className: "flex flex-row flex-wrap gap-medium justify-start items-center list-none margin-none padding-none",
                    children: I.map(e => {
                        let {
                            id: t,
                            iconName: n,
                            label: a
                        } = e;
                        return (0, C.jsxs)("li", {
                            className: "inline-flex max-width-full flex-row items-center gap-xsmall",
                            children: [(0, C.jsx)(W.Icon, {
                                name: n,
                                size: "XSmall",
                                className: "content-default shrink-0"
                            }), (0, C.jsx)("span", {
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
                trustedFriendAction: s,
                setToastMessage: o
            } = e, {
                translate: c
            } = (0, Y.useTranslation)(), {
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
                    translate: s
                } = (0, Y.useTranslation)(), o = (0, eb.useQueryClient)(), {
                    startAccessManagementUpsell: c,
                    useUserNames: u
                } = ey(), d = u(t), m = (0, N.useMemo)(() => (function(e) {
                    if (!e || !(e in el)) return;
                    let t = eh[e];
                    return {
                        primary: t.primary,
                        secondary: t.secondary,
                        handler: t.handler
                    }
                })(a), [a]), p = (0, N.useCallback)(async () => {
                    if (!m) return;
                    let {
                        handler: e
                    } = m, a = d?.username ?? "", u = async () => {
                        await o.invalidateQueries({
                            queryKey: ["trustedFriendStatus", t]
                        }), await o.invalidateQueries({
                            queryKey: U(t, n)
                        })
                    }, p = async () => {
                        if (!n?.length) throw Error("useGetTrustedFriendsModalButtons: linkTokens required for link accept flow");
                        await eS(t, n), await ex(t, n)
                    }, g = async () => {
                        await eZ(eV(t).then(e => {
                            let {
                                link: t
                            } = e;
                            return t
                        })), i(s(et.trustedFriendLinkCopied)), await u(), await l?.(), r(!0)
                    }, h = async () => {
                        i(s(et.trustedFriendRequestSent)), await u(), await l?.(), r(!0)
                    }, f = async () => {
                        i(s(et.acceptedTrustedFriend, {
                            username: a
                        })), await u(), await l?.(), r(!0)
                    }, b = async e => {
                        switch (e) {
                            case es:
                                await l?.(), r(!0);
                                break;
                            case eo:
                                await eN(t), await h();
                                break;
                            case ec:
                                await ew(t), await f();
                                break;
                            case eu:
                                await p(), await f();
                                break;
                            case ed:
                                r(!1), await eR(c, t), await l?.();
                                break;
                            case em:
                                r(!1), await p(), await eR(c, t), await l?.();
                                break;
                            case eg:
                                await g()
                        }
                    };
                    try {
                        i(null), await b(e)
                    } catch {
                        i(s(et.genericError))
                    }
                }, [t, n, s, r, d, i, o, l, m, c]);
                return {
                    buttonConfig: m,
                    performPrimaryAction: p
                }
            }({
                userId: a,
                linkTokens: r,
                trustedFriendAction: s,
                onClose: n,
                setToastMessage: o,
                onComplete: i
            }), m = (0, N.useCallback)(e => {
                e || n(!1)
            }, [n]), p = (0, N.useMemo)(() => ef[l], [l]), g = (0, N.useCallback)(() => {
                u?.primary.isDisabled || d().catch(() => void 0)
            }, [u, d]);
            return (0, C.jsx)(D.Dialog, {
                open: t,
                onOpenChange: m,
                size: "Medium",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: "Close",
                children: (0, C.jsxs)(D.DialogContent, {
                    children: [(0, C.jsxs)(D.DialogBody, {
                        className: "flex flex-col gap-medium",
                        children: [(0, C.jsx)(D.DialogTitle, {
                            className: "text-heading-small margin-none",
                            children: c(p.title)
                        }), (0, C.jsxs)("div", {
                            className: "text-body-medium content-default flex flex-col gap-xsmall",
                            children: [c(p.description), (0, C.jsx)("a", {
                                href: "https://help.roblox.com/hc/articles/37725513985812",
                                target: "_blank",
                                rel: "noreferrer",
                                className: "trusted-friends-modal-learn-more-link text-body-medium content-default",
                                children: c(et.learnMore)
                            })]
                        }), (0, C.jsx)(eG, {
                            userId: a
                        })]
                    }), (0, C.jsx)(D.DialogFooter, {
                        className: "flex flex-col gap-small",
                        children: (0, C.jsxs)("div", {
                            className: "flex width-full min-width-0 flex-row gap-small items-center",
                            children: [(0, C.jsx)(B.Button, {
                                variant: "Emphasis",
                                size: "Medium",
                                className: "fill min-width-0 flex-1 basis-0",
                                isDisabled: u?.primary.isDisabled === !0,
                                onClick: g,
                                children: (0, C.jsxs)("span", {
                                    className: "flex width-full min-width-0 flex-row items-center justify-center gap-small",
                                    children: [u?.primary.showVpcIcon ? (0, C.jsx)(W.Icon, {
                                        name: "icon-regular-lock-closed",
                                        size: "Medium",
                                        className: "flex shrink-0 items-center justify-center",
                                        "aria-hidden": !0
                                    }) : null, (0, C.jsx)("span", {
                                        className: "min-width-0",
                                        children: c(u?.primary.textKey ?? "")
                                    })]
                                })
                            }), u?.secondary ? (0, C.jsx)(B.Button, {
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
        eB = e => {
            let {
                open: t,
                onClose: n,
                userId: a,
                linkTokens: r,
                onComplete: i
            } = e, {
                translate: l
            } = (0, Y.useTranslation)(), {
                startAccessManagementUpsell: s
            } = ey(), {
                data: o,
                isFetched: c,
                refetch: u
            } = (0, x.useQuery)({
                queryKey: U(a, r),
                queryFn: () => eT(a, {
                    friendRequestToken: r
                }),
                enabled: t,
                refetchOnMount: !1,
                refetchOnWindowFocus: !1,
                refetchOnReconnect: !1
            }), [d, m] = (0, N.useState)(null), p = (0, N.useCallback)(() => {
                m(null)
            }, []), g = (0, N.useMemo)(() => t && c ? o && o in el ? el[o] : "invalid" : "pending", [t, c, o]), h = (0, N.useCallback)(async () => {
                try {
                    await s({
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
            }, [n, u, s]);
            (0, N.useEffect)(() => {
                if ("pending" !== g) {
                    if ("UnlockTrustedFriendByFAE" === o) return void h().catch(() => void 0);
                    "invalid" === g && (m(l(et.genericError)), n(!1))
                }
            }, [g, o, l, n, h]);
            let f = !(!t || "pending" === g || "invalid" === g);
            return (0, C.jsxs)(N.default.Fragment, {
                children: [d ? (0, C.jsx)(j.Snackbar, {
                    title: d,
                    onClose: p,
                    shouldAutoDismiss: !0
                }) : null, f && (0, C.jsx)(e_, {
                    open: t,
                    onClose: n,
                    userId: a,
                    linkTokens: r,
                    onComplete: i,
                    modalVariant: g,
                    trustedFriendAction: o,
                    setToastMessage: m
                })]
            })
        };
    var eD = e.i(266712),
        eW = e.i(44170),
        ej = e.i(145420),
        eY = e.i(175067),
        eU = e.i(460987),
        eJ = e.i(100266),
        eO = e.i(723941),
        ez = e.i(476752),
        eM = e.i(851460),
        eH = ((i = {}).GameDetails = "game_details", i.Profile = "profile", i.Home = "home", i.Games = "games", i.Avatar = "avatar", i.Catalog = "catalog", i.Friends = "friends", i.ItemDetails = "item_details", i.Navigation = "navigation", i.PlaceId = "placeId", i.UserId = "userId", i.ShareLinks = "share_links", i.Chat = "chat", i.GiftCards = "gift_cards", i.NotificationSettings = "notification_settings", i.AccountInfo = "account_info", i.PrivacySettings = "privacy_settings", i.AppPermissionsSettings = "app_permissions_settings", i.ScreentimeSubsettings = "screentime_subsettings", i.BlockedExperiencesSubsettings = "blocked_experiences_subsettings", i.BlockedUsersSubsettings = "blocked_users_subsettings", i.ExperienceChatSubsettings = "experience_chat_subsettings", i.PartySubsettings = "party_subsettings", i.VoiceSubsettings = "voice_subsettings", i.CommunicationSettings = "communication_settings", i.CommunicationSubsettings = "communication_subsettings", i.TradingInventorySubsettings = "trading_inventory_subsettings", i.PrivateServerSubsettings = "private_server_subsettings", i.FriendsContactsSubsettings = "friends_contacts_subsettings", i.VisibilitySubsettings = "visibility_subsettings", i.ParentalControls = "parental_controls", i.SpendingSettings = "spending_settings", i.RobuxSettings = "robux_settings", i.Group = "group", i.ExternalWebUrl = "external_web_link", i.SecurityAlert = "security_alert", i.Fae = "fae", i.Messages = "messages", i.BuyRobux = "buy_robux", i.CurrencyTransfer = "currency_transfer", i.ProfileCard = "profile_card", i.AmpWizard = "amp_wizard", i.SupportCenter = "support_center", i.PlusUpsell = "plus_upsell", i.PlusReferralDashboard = "plus_referral_dashboard", i.PlusSubscribe = "plus_subscribe", i.PlusWebview = "plus_webview", i.AcceptGift = "accept_gift", i.Moments = "moments", i);
    (l = {}).Asset = "Asset", l.Bundle = "Bundle", l.Look = "Look";
    let eQ = {
            Asset: "/catalog",
            Bundle: "/bundles",
            Look: "/looks"
        },
        e$ = {
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
        eK = {
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
        eq = (e, t, n) => ({
            type: "linkResolved",
            context: "deepLink",
            params: {
                linkType: n,
                linkStatus: e,
                linkId: t
            }
        }),
        e0 = "DeeplinkParserExperienceDetailsResolutionFailed",
        e2 = (e, t, n) => ({
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
    var e1 = ((s = e1 || {}).PROFILE_SHARE = "ProfileShare", s.QR_CODE = "QrCode", s),
        e5 = ((o = e5 || {}).AVATAR_ITEM_DETAILS = "AvatarItemDetails", o.AVATAR_ITEM_AFFILIATE = "AvatarItemAffiliate", o.CONTENT_POST = "ContentPost", o.EXPERIENCE_INVITE = "ExperienceInvite", o.EXPERIENCE_AFFILIATE = "ExperienceAffiliate", o.FRIEND_INVITE = "FriendInvite", o.NOTIFICATION_EXPERIENCE_INVITE = "NotificationExperienceInvite", o.PROFILE = "Profile", o.SCREENSHOT_INVITE = "ScreenshotInvite", o.SERVER = "Server", o.EXPERIENCE_DETAILS = "ExperienceDetails", o.EXPERIENCE_EVENT = "ExperienceEvent", o),
        e3 = ((c = e3 || {}).EXPERIENCE_V2 = "ExperienceV2", c.USER_TRUSTED_CONNECTION = "UserTrustedConnection", c.STUDIO_TRUSTED_CONNECTION = "StudioTrustedConnection", c.MOMENTS = "Moments", c.SCHOOL_INVITE = "SchoolInvite", c.REFERRAL = "Referral", c),
        e9 = ((u = e9 || {}).VALID = "Valid", u.EXPIRED = "Expired", u.INVITER_NOT_IN_EXPERIENCE = "InviterNotInExperience", u),
        e4 = ((d = e4 || {}).VALID = "Valid", d.EXPIRED = "Expired", d.CONSUMED = "Consumed", d.SENDER_BLOCKED_RECIPIENT = "SenderBlockedRecipient", d.INVALID = "Invalid", d),
        e8 = ((m = e8 || {}).VALID = "Valid", m.SENDER_BLOCKED_RECIPIENT = "SenderBlockedRecipient", m.INVALID = "Invalid", m),
        e7 = ((p = e7 || {}).VALID = "Valid", p.EXPIRED = "Expired", p.INVITER_NOT_IN_EXPERIENCE = "InviterNotInExperience", p),
        e6 = ((g = e6 || {}).INVALID = "Invalid", g.VALID = "Valid", g.EXPIRED = "Expired", g),
        te = ((h = te || {}).INVALID = "Invalid", h.EXPIRED = "Expired", h.VALID = "Valid", h),
        tt = ((f = tt || {}).Zendesk = "zendesk", f),
        tn = ((b = tn || {}).INVALID = "Invalid", b.EXPIRED = "Expired", b.VALID = "Valid", b),
        ta = ((v = ta || {}).INVALID = "Invalid", v.VALID = "Valid", v),
        tr = ((y = tr || {}).INVALID = "Invalid", y.EXPIRED = "Expired", y.VALID = "Valid", y),
        ti = ((I = ti || {}).INVALID = "Invalid", I.VALID = "Valid", I),
        tl = ((A = tl || {})[A.INVALID = 0] = "INVALID", A[A.PROFILE = 1] = "PROFILE", A[A.HOME = 2] = "HOME", A);
    let ts = (e, t, n, a, r, i, l) => ({
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
        tc = async e => {
            let t;
            try {
                await Promise.race([e(), new Promise(e => {
                    t = setTimeout(e, 5e3)
                })])
            } catch {} finally {
                clearTimeout(t)
            }
        }, tu = /\/(\w+)/g, td = /(\w+)=([^&=]+)/g, tm = e => {
            let t = [],
                n = {},
                a = tu.exec(e);
            for (; null != a;) t.push(a[1]), a = tu.exec(e);
            let r = td.exec(e);
            for (; null != r;) {
                let [, t, a] = r;
                n[t] = a, r = td.exec(e)
            }
            return {
                path: t,
                params: n,
                url: e
            }
        };
    var tp = e.i(341332),
        tg = e.i(778579),
        th = e.i(817396),
        tf = e.i(82927),
        tb = e.i(126392);
    let tv = {
            subscribe: (e, t, n) => {
                let a, r = !0;
                return (0, P.getRealtimeClient)().then(i => {
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
            subscribeToConnectionEvents: (e, t, n, a) => (0, P.getRealtimeClient)().then(r => {
                if (null == r) return Promise.reject(Error("The realtime client did not load"));
                r.SubscribeToConnectionEvents(e, t, n, a)
            })
        },
        ty = {
            avatarHeadshot: "AvatarHeadShot",
            gameIcon: "GameIcon",
            groupIcon: "GroupIcon",
            assetThumbnail: "Asset",
            bundleThumbnail: "BundleThumbnail",
            gamePassIcon: "GamePass"
        },
        tI = ["names.combinedName", "names.username"],
        tA = {
            startAccessManagementUpsell: e => (0, eD.startAccessManagementUpsell)(e),
            AvatarHeadshot: e => {
                let {
                    userId: t,
                    className: n
                } = e;
                return (0, C.jsx)(L.Thumbnail2d, {
                    type: "AvatarHeadShot",
                    size: "48x48",
                    format: "webp",
                    targetId: t,
                    containerClassName: n,
                    includeProfileFrame: !0
                })
            },
            useUserNames: e => (0, eJ.useUserProfiles)([e], tI).data[e]?.names ?? void 0
        },
        tE = (e, t) => T.postUntyped(R.Url.parse(e).getOrThrow(), t, {
            credentials: "include"
        }).getOrThrow().then(e => ({
            data: e
        })),
        tC = (e, t) => T.get(R.Url.parse(`${eI.default.gamesApi}${e}`).getOrThrow(), t, {
            credentials: "include"
        }),
        tw = e => {
            let t = (0, eY.getGameLauncher)();
            return null != t && (t.joinMultiplayerGame((0, eU.withJoinAttemptId)({
                placeId: e,
                isPlayTogetherGame: !1
            })), !0)
        },
        {
            navigateToDeepLink: tN
        } = (E = {
            getDeviceMeta: () => (0, tp.getDeviceMeta)(),
            get navigateToHybridFeature() {
                let e = window.Roblox?.Hybrid?.Navigation;
                return e ? t => {
                    e.navigateToFeature(t, () => !0)
                } : void 0
            },
            sendEvent: (e, t, n) => {
                (0, tg.sendEventWithTarget)(e, t, n)
            },
            fireCounter: e => {
                (0, ej.fireEvent)(e)
            },
            resolveShareLinks: (e, t) => tE(`${eI.default.shareLinksApi}/v1/resolve-link`, {
                linkId: e,
                linkType: t
            }),
            resolveShareLinksV2: e => tE(`${eI.default.shareLinksApiV2}/v2/resolve`, {
                linkId: e
            }),
            getPlaceIdFromUniverseId: e => tC(`/v1/games?universeIds[]=${e}`, V.object({
                data: V.array(V.object({
                    rootPlaceId: V.optional(V.number())
                }))
            })).andThen(t => {
                let {
                    data: n
                } = t, a = n[0]?.rootPlaceId;
                return a ? (0, X.ok)(a) : (0, X.err)(Error(`Root place ID not found for universe ID: ${e}`))
            }).getOrThrow(),
            getUniverseIdFromPlaceId: e => tC(`/v1/games/multiget-place-details?placeIds=${String((0,G.parseInt)(e))}`, V.array(V.object({
                universeId: V.optional(V.number())
            }))).andThen(t => {
                let n = t[0]?.universeId;
                return n ? (0, X.ok)(n) : (0, X.err)(Error(`Universe ID not found for place ID: ${e}`))
            }).getOrThrow(),
            launchGame: function() {
                let e;
                for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
                let [r, i] = n, l = (0, eY.getGameLauncher)();
                if (null == l) return;
                let s = (0, _.generateRandomUuid)(),
                    o = i.gamePlayIntentEventCtx,
                    c = {
                        ...i.properties,
                        joinAttemptId: s
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
                    (0, tg.sendEventWithTarget)(i.eventName, i.ctx, {
                        ...c,
                        ...e
                    }), (0, tg.sendGamePlayEvent)(o, t, void 0, s)
                };
                return d === u && m ? (b({
                    gameInstanceId: m
                }, u), e = l.joinGameInstance((0, eU.withJoinAttemptId)({
                    placeId: d,
                    gameId: m,
                    isPlayTogetherGame: !0,
                    referredByPlayerId: f
                }, s, o))) : u && p ? (b({
                    playerId: p
                }, u), e = l.followPlayerIntoGame((0, eU.withJoinAttemptId)({
                    userId: p
                }, s, o))) : h ? (b({}, d), e = l.joinPrivateGame((0, eU.withJoinAttemptId)({
                    placeId: d,
                    accessCode: null,
                    linkCode: h
                }, s, o))) : (b({}, d), e = l.joinMultiplayerGame((0, eU.withJoinAttemptId)({
                    placeId: d,
                    launchData: g?.launchData,
                    eventId: g?.eventId,
                    isPlayTogetherGame: !1,
                    referredByPlayerId: f
                }, s, o))), e
            },
            joinMultiplayerGame: tw,
            startGameWithDeepLinkUrl: (e, t) => {
                let n = (0, eY.getGameLauncher)();
                return null != n && (n.startGameWithDeepLinkUrl(e, t), !0)
            },
            startDeepLinkFlow: e => {
                let t = (0, eY.getGameLauncher)();
                return null != t && (t.startDeepLinkFlow(e), !0)
            },
            openStudio: e => {
                let {
                    placeId: t,
                    universeId: n,
                    startTeamTest: a,
                    instanceId: r,
                    annotationId: i
                } = e, l = (0, eY.getGameLauncher)();
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
                (0, tp.getDeviceMeta)().isInApp ? window.location.href = `roblox://navigation/chat?userId=${e}&entryPoint=AppShellWebView` : document.dispatchEvent(new CustomEvent("Roblox.Chat.StartChat", {
                    detail: {
                        userId: (0, G.parseInt)(e)
                    }
                })), (0, tg.sendEventWithTarget)("startChatByUser", "click", {
                    userId: e
                })
            },
            getQueryParam: e => (0, tf.getQueryParam)(e),
            getHelpDeskUrl: (e, t) => (0, th.getHelpDeskUrl)(e, t)
        }, a = {
            [eH.Navigation]: e => ((e, t) => {
                let n, {
                        path: a,
                        params: r
                    } = t,
                    i = a[1];
                if (e$[i])
                    for (let [e, t] of(n = e$[i], Object.entries(r))) n = n.replace(`{${e}}`, t);
                else if (i === eH.ItemDetails.valueOf() && r.itemType && r.itemId) n = `${eQ[r.itemType]}/${r.itemId}`;
                else if (i === eH.GameDetails && r.gameId) return e.getPlaceIdFromUniverseId(r.gameId).then(e => !!e && (window.location.href = `${eK.Games}/${e}`, !0)).catch(() => !1);
                else if (i === eH.Profile || i === eH.ProfileCard) r.userId ? n = `${eK.Users}/${r.userId}${eK.Profile}` : r.groupId && (n = `${eK.Groups}/${r.groupId}`);
                else if (i === eH.GiftCards) n = eK.GiftCards;
                else if (i === eH.ShareLinks) {
                    if ("v2" === r.v && void 0 !== r.code) {
                        let n = r.code || "";
                        return e.resolveShareLinksV2(r.code).then(async a => {
                            if ("Referral" === a.data.linkType) {
                                let t = a.data.status,
                                    r = eq(t, n, e3.REFERRAL);
                                e.sendEvent(r.type, r.context, r.params), "Valid" !== t && e.fireCounter("DeeplinkParserRobloxPlusReferralResolutionFailed");
                                let i = a.data.targetId ? `&referrerId=${a.data.targetId}` : "",
                                    l = "Valid" === t ? `referralCode=${n}${i}` : `referralStatus=${t}`;
                                return window.location.href = `${eK.Plus}?ctx=plus_referral&${l}`, !0
                            }
                            if ("Invalid" === a.data.status) return !1;
                            let i = eq(a.data.status, n, e3.EXPERIENCE_V2);
                            if (e.sendEvent(i.type, i.context, i.params), "Experience" === a.data.linkType && a.data.targetId) {
                                let t = a.data.customData || "{}";
                                await tc(() => e.launchGame(ts(a.data.targetId, a.data.targetId, void 0, void 0, void 0, void 0, {
                                    launchData: t
                                }), e2(a.data.targetId, n, a.data.status))), window.location.href = `${eK.Games}/${a.data.targetId}`
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
                                if (!(0, G.parseInt)(a.data.targetId)) return !1;
                                let r = "UserTrustedConnection" === a.data.linkType ? e3.USER_TRUSTED_CONNECTION : e3.STUDIO_TRUSTED_CONNECTION,
                                    i = eq(a.data.status, n, r);
                                e.sendEvent(i.type, i.context, i.params), r === e3.USER_TRUSTED_CONNECTION && (window.location.href = t.url), window.location.href = `${eK.Users}/${a.data.targetId}${eK.Profile}?trustedFriendLinkCode=${n}`
                            } else if ("Moments" === a.data.linkType && a.data.targetId) {
                                let r = eq(a.data.status, n, e3.MOMENTS);
                                e.sendEvent(r.type, r.context, r.params), window.location.href = t.url, window.location.href = "roblox://navigation/moments"
                            } else if ("SchoolInvite" === a.data.linkType) {
                                let r = eq(a.data.status, n, e3.SCHOOL_INVITE);
                                if (e.sendEvent(r.type, r.context, r.params), "Valid" !== a.data.status) return e.fireCounter("DeeplinkParserSchoolInviteResolutionFailed"), !1;
                                e.startDeepLinkFlow(t.url) || (window.location.href = t.url)
                            }
                            return !0
                        }).catch(() => !1)
                    }
                    switch (r.type) {
                        case e5.EXPERIENCE_INVITE:
                            if (null != r.code) {
                                let {
                                    code: t
                                } = r;
                                return e.resolveShareLinks(r.code, e5.EXPERIENCE_INVITE).then(async n => {
                                    let a = n?.data?.experienceInviteData;
                                    if (a?.placeId == null) return !1;
                                    let i = eq(a.status, t, e5.EXPERIENCE_INVITE);
                                    return (e.sendEvent(i.type, i.context, i.params), a.status === e9.VALID && a.instanceId) ? (await tc(() => e.launchGame(ts(a.placeId, a.placeId, a.instanceId, void 0, void 0, a.inviterId), e2(a.placeId.toString(), t, a.status))), window.location.href = `${eK.Games}/${a.placeId}`, !0) : (a.status === e9.EXPIRED || a.status === e9.INVITER_NOT_IN_EXPERIENCE) && (window.localStorage.setItem("ref_info", (0, ez.stringToBase64)(eO.serialize({
                                        [a.placeId.toString()]: a.inviterId.toString()
                                    }).value)), window.location.href = `${eK.Games}/${a.placeId}?experienceInviteLinkId=${r.code}&experienceInviteStatus=${a.status}`, !0)
                                }).catch(() => (e.fireCounter("DeeplinkParserInviteResolutionFailed"), !1))
                            }
                            break;
                        case e5.NOTIFICATION_EXPERIENCE_INVITE:
                            if (r.code) return e.resolveShareLinks(r.code, e5.NOTIFICATION_EXPERIENCE_INVITE).then(t => {
                                let n = t?.data?.notificationExperienceInviteData;
                                if (n?.placeId) {
                                    let t = n.instanceId && n.status === e9.VALID,
                                        a = `${eK.ExperienceLauncher}placeId=${n.placeId}${n.launchData?`&launchData=${encodeURIComponent(encodeURIComponent(n.launchData))}`:""}${t?`&gameInstanceId=${n.instanceId}`:""}${n.inviterId?`&referredByPlayerId=${n.inviterId}`:""}`;
                                    return !1 !== e.startGameWithDeepLinkUrl(a, n.placeId)
                                }
                                return !1
                            }).catch(() => (e.fireCounter("DeeplinkParserNotificationInviteResolutionFailed"), !1));
                            break;
                        case e5.FRIEND_INVITE:
                            if (r.code) {
                                let {
                                    code: t
                                } = r;
                                return e.resolveShareLinks(r.code, e5.FRIEND_INVITE).then(n => {
                                    let a = n?.data?.friendInviteData;
                                    if (a?.senderUserId == null) return !1;
                                    let r = eq(a.status, t, e5.FRIEND_INVITE);
                                    return e.sendEvent(r.type, r.context, r.params), (a.status === e4.VALID || a.status === e4.CONSUMED || a.status === e4.EXPIRED) && (window.location.href = `${eK.Users}/${a.senderUserId}${eK.Profile}`, !0)
                                }).catch(() => (e.fireCounter("DeeplinkParserFriendRequestResolutionFailed"), !1))
                            }
                            break;
                        case e5.PROFILE:
                            if (r.code) {
                                let {
                                    code: t
                                } = r;
                                return e.resolveShareLinks(r.code, e5.PROFILE).then(n => {
                                    let a = n?.data?.profileLinkResolutionResponseData;
                                    if (a?.userId == null) return !1;
                                    let r = eq(a.status, t, e5.PROFILE);
                                    if (e.sendEvent(r.type, r.context, r.params), a.status === e8.VALID) {
                                        let t = (e => {
                                            switch (e?.toLowerCase()) {
                                                case e1.PROFILE_SHARE.toLowerCase():
                                                    return e1.PROFILE_SHARE;
                                                case e1.QR_CODE.toLowerCase():
                                                default:
                                                    return e1.QR_CODE
                                            }
                                        })(e.getQueryParam("source"));
                                        return window.location.href = `${eK.Users}/${a.userId}${eK.Profile}?friendshipSourceType=${t}`, !0
                                    }
                                    return !1
                                }).catch(() => (e.fireCounter("DeeplinkParserProfileShareResolutionFailed"), !1))
                            }
                            break;
                        case e5.SCREENSHOT_INVITE:
                            if (r.code) {
                                let {
                                    code: t
                                } = r;
                                return e.resolveShareLinks(r.code, e5.SCREENSHOT_INVITE).then(n => {
                                    let a = n?.data?.screenshotInviteData;
                                    if (a?.placeId == null || ![e7.EXPIRED, e7.INVITER_NOT_IN_EXPERIENCE, e7.VALID].includes(a.status)) return !1;
                                    let i = eq(a.status, t, e5.SCREENSHOT_INVITE);
                                    if (e.sendEvent(i.type, i.context, i.params), a.status === e7.EXPIRED || a.status === e7.INVITER_NOT_IN_EXPERIENCE) return window.location.href = `${eK.Games}/${a.placeId}?experienceInviteLinkId=${r.code}&experienceInviteStatus=${a.status}`, !0;
                                    let l = `${eK.ExperienceLauncher}placeId=${a.placeId}`;
                                    return a.launchData && (l += `&launchData=${encodeURIComponent(encodeURIComponent(a.launchData))}`), a.instanceId && (l += `&gameInstanceId=${a.instanceId}`), !1 !== e.startGameWithDeepLinkUrl(l, a.placeId)
                                }).catch(() => (e.fireCounter("DeeplinkParserScreenshotInviteShareResolutionFailed"), !1))
                            }
                            break;
                        case e5.SERVER:
                            if (r.code) {
                                let {
                                    code: t
                                } = r;
                                return e.resolveShareLinks(r.code, e5.SERVER).then(n => {
                                    let a = n?.data?.privateServerInviteData;
                                    return a?.universeId != null && !![e6.VALID, e6.EXPIRED].includes(a.status) && (e.getPlaceIdFromUniverseId(a.universeId.toString()).then(n => {
                                        if (!n) return !1;
                                        let r = eq(a.status, t, e5.SERVER);
                                        return e.sendEvent(r.type, r.context, r.params), window.location.href = `${eK.Games}/${n}?privateServerLinkCode=${a.linkCode}`, !0
                                    }).catch(() => !1), !0)
                                }).catch(() => (e.fireCounter("DeeplinkParserPrivateServerLinkResolutionFailed"), !1))
                            }
                            break;
                        case e5.EXPERIENCE_AFFILIATE: {
                            if (!r.code) break;
                            let {
                                code: t
                            } = r;
                            return e.resolveShareLinks(r.code, e5.EXPERIENCE_AFFILIATE).then(n => {
                                let a = n?.data?.experienceAffiliateData;
                                if (a?.status !== ta.VALID) return !1;
                                if (a?.universeId == null) {
                                    let n = eq(a.status, t, e5.EXPERIENCE_AFFILIATE);
                                    if (e.sendEvent(n.type, n.context, n.params), a.fallbackType === tl.PROFILE && a.fallbackId) window.location.href = `${eK.Users}/${a.fallbackId}${eK.Profile}`;
                                    else {
                                        let e = `${window.location.protocol}/${window.location.hostname}${window.location.pathname}?type=${e5.EXPERIENCE_AFFILIATE}&code=${r.code}`;
                                        window.location.href = `/?referralUrl=${encodeURIComponent(e)}`
                                    }
                                    return !0
                                }
                                return e.getPlaceIdFromUniverseId(a.universeId.toString()).then(n => {
                                    if (!n) return !1;
                                    let i = eq(a.status, t, e5.EXPERIENCE_AFFILIATE);
                                    e.sendEvent(i.type, i.context, i.params);
                                    let l = `${window.location.protocol}//${window.location.hostname}${window.location.pathname}?type=${e5.EXPERIENCE_AFFILIATE}&code=${r.code}`,
                                        s = `${eK.Games}/${n}?shareLinkSourceType=${e5.EXPERIENCE_AFFILIATE}&referralUrl=${encodeURIComponent(l)}`;
                                    return s = to(s, a.joinData), window.location.href = s, !0
                                }).catch(() => !1)
                            }).catch(() => (e.fireCounter(e0), !1))
                        }
                        case e5.EXPERIENCE_DETAILS: {
                            if (!r.code) break;
                            let {
                                code: t
                            } = r;
                            return e.resolveShareLinks(r.code, e5.EXPERIENCE_DETAILS).then(n => {
                                let a = n?.data?.experienceDetailsInviteData;
                                return a?.universeId != null && a.status === te.VALID && e.getPlaceIdFromUniverseId(a.universeId.toString()).then(n => {
                                    if (!n) return !1;
                                    let r = eq(a.status, t, e5.EXPERIENCE_DETAILS);
                                    return e.sendEvent(r.type, r.context, r.params), window.location.href = `${eK.Games}/${n}?shareLinkSourceType=${e5.EXPERIENCE_DETAILS}`, !0
                                }).catch(() => !1)
                            }).catch(() => (e.fireCounter(e0), !1))
                        }
                        case e5.AVATAR_ITEM_DETAILS:
                        case e5.AVATAR_ITEM_AFFILIATE: {
                            if (!r.code) break;
                            let {
                                code: t
                            } = r, n = r.type === e5.AVATAR_ITEM_AFFILIATE ? e5.AVATAR_ITEM_AFFILIATE : e5.AVATAR_ITEM_DETAILS;
                            return e.resolveShareLinks(r.code, n).then(a => {
                                let i = a?.data?.avatarItemDetailsData;
                                if (i?.itemId == null || "" === i.itemId || "0" === i.itemId || !(i.itemType in eK) || i.status !== tn.VALID) return !1;
                                let l = i.itemType,
                                    s = eq(i.status, t, n);
                                return e.sendEvent(s.type, s.context, s.params), window.location.href = `${eK[l]}/${i.itemId}?pid=share&is_retargeting=false&deep_link_value=${r.code}`, !0
                            }).catch(() => (e.fireCounter(n === e5.AVATAR_ITEM_AFFILIATE ? "DeeplinkParserAvatarItemAffiliateResolutionFailed" : "DeeplinkParserAvatarItemDetailsResolutionFailed"), !1))
                        }
                        case e5.CONTENT_POST: {
                            if (!r.code) break;
                            let {
                                code: t
                            } = r;
                            return e.resolveShareLinks(r.code, e5.CONTENT_POST).then(n => {
                                let a = n?.data?.contentPostData;
                                if (!a || a.status !== tr.VALID) return !1;
                                let r = eq(a.status, t, e5.CONTENT_POST);
                                return e.sendEvent(r.type, r.context, r.params), window.location.href = `${eK.AppLauncher}${eK.ContentPost}?userId=${a.postCreatorId}&postId=${a.postId}`, window.location.href = `${eK.Users}/${a.postCreatorId}${eK.Profile}`, !0
                            }).catch(() => (e.fireCounter("DeeplinkParserContentPostResolutionFailed"), !1))
                        }
                        case e5.EXPERIENCE_EVENT: {
                            if (!r.code) break;
                            let {
                                code: t
                            } = r;
                            return e.resolveShareLinks(r.code, e5.EXPERIENCE_EVENT).then(n => {
                                let a = n?.data?.experienceEventData;
                                if (a?.universeId == null || !a.placeId || a.status !== ti.VALID) return !1;
                                let r = eq(a.status, t, e5.EXPERIENCE_EVENT);
                                e.sendEvent(r.type, r.context, r.params);
                                let i = `${eK.ExperienceLauncher}placeId=${a.placeId}`;
                                return i = to(i, a.joinData), !1 !== e.startGameWithDeepLinkUrl(i, a.placeId)
                            }).catch(() => (e.fireCounter("DeeplinkParserExperienceEventResolutionFailed"), !1))
                        }
                    }
                } else if (i === eH.Chat && r.userId) return e.startChat(r.userId), Promise.resolve(!0);
                else if (i === eH.ExternalWebUrl) {
                    let t;
                    if (r.domain === tt.Zendesk) {
                        let {
                            articleId: n,
                            locale: a
                        } = r;
                        (t = e.getHelpDeskUrl(a, n)) && window.open(t, "_blank")
                    }
                    return Promise.resolve(!!t)
                } else if (i === eH.Avatar) n = Object.keys(r).length ? t.url : eK.Avatar;
                else if (i === eH.Group) r.groupId && (n = r.forumCategoryId && r.forumPostId && r.forumCommentId ? `${eK.Groups}/${r.groupId}#!/forums/category-${r.forumCategoryId}/post/post-${r.forumPostId}/comment/${r.forumCommentId}` : `${eK.Groups}/${r.groupId}`);
                else if (i === eH.SupportCenter) n = r.universeId && r.ticketId ? `${eK.SupportCenter}#!/tickets/${r.universeId}/${r.ticketId}` : eK.SupportCenter;
                else if (i === eH.SecurityAlert) n = r.payload && r.username ? `${eK.SecurityAlert}?payload=${r.payload}&username=${r.username}` : `${eK.SecurityAlert}?payload=null&username=`;
                else if (i === eH.Fae) {
                    let t = e.startAccessManagementUpsell({
                        featureName: "TriggerAgeVerifyRecourse",
                        namespace: "social/Upsells"
                    });
                    return t ? t.then(() => !0).catch(() => !1) : Promise.resolve(!1)
                } else if (i === eH.CurrencyTransfer) {
                    let a = r.transferrequestid ?? r.transferRequestId ?? r.transferrequestId,
                        i = (r.direction ?? r.Direction)?.toLowerCase(),
                        l = r.userid ?? r.userId,
                        s = r.transferorigination ?? r.transferOrigination;
                    if (a || "send" === i && l && s) {
                        let a = e.getDeviceMeta();
                        if (a?.isDesktop && e.startDeepLinkFlow(t.url)) return Promise.resolve(!0);
                        n = t.url
                    }
                } else if (i === eH.AcceptGift) {
                    if (r.giftId) {
                        let a = e.getDeviceMeta();
                        if (a?.isDesktop && e.startDeepLinkFlow(t.url)) return Promise.resolve(!0);
                        n = t.url
                    }
                } else if (i === eH.Moments) {
                    let a = e.getDeviceMeta();
                    if (a?.isDesktop && e.startDeepLinkFlow(t.url)) return Promise.resolve(!0);
                    n = t.url
                } else if (i === eH.AmpWizard) n = t.url;
                else if (i === eH.PlusUpsell) n = t.url;
                else if (i === eH.PlusReferralDashboard) n = t.url;
                else if (i === eH.PlusSubscribe) {
                    let e = eM.UrlSearchParams.new([..."PlusReferralLandingSheet" === r.surface ? [
                        ["ctx", "plus_referral"]
                    ] : [], ...r.referrer_id ? [
                        ["referrerId", r.referrer_id]
                    ] : []]).toString();
                    n = e ? `${eK.Plus}?${e}` : eK.Plus
                }
                return n ? window.location.href = n : e.fireCounter("DeeplinkParserNavigationFailed"), Promise.resolve(!!n)
            })(E, e),
            [eH.PlaceId]: e => ((e, t) => {
                let {
                    params: n
                } = t;
                if (!n.placeId) return Promise.resolve(!1);
                if (n.linkCode) return window.location.href = `${eK.Games}/${n.placeId}?privateServerLinkCode=${n.linkCode}`, Promise.resolve(!0);
                if (n.accessCode) return window.location.href = `${eK.GameStart}?placeId=${n.placeId}&accessCode=${n.accessCode}`, Promise.resolve(!0);
                if (n.launchData) {
                    let t = `${eK.ExperienceLauncher}placeId=${n.placeId}${n.launchData?`&launchData=${n.launchData}`:""}`,
                        a = Number(n.placeId);
                    return Promise.resolve(!1 !== e.startGameWithDeepLinkUrl(t, a))
                }
                return Promise.resolve(!1 !== e.joinMultiplayerGame((0, G.parseFloat)(n.placeId) ?? NaN))
            })(E, e),
            [eH.UserId]: e => {
                let {
                    userId: t
                } = e.params;
                return t && (window.location.href = `/games/start?userId=${t}`), Promise.resolve(!!t)
            },
            [eH.Group]: e => {
                let {
                    groupId: t
                } = e.params;
                return t && (window.location.href = `/groups/${t}`), Promise.resolve(!!t)
            }
        }, {
            navigateToDeepLink: e => {
                if (E.getDeviceMeta()?.isIosApp && E.navigateToHybridFeature) return E.navigateToHybridFeature({
                    feature: "DeepLink",
                    deepLinkUrlPath: e
                }), Promise.resolve(!0);
                if (E.getDeviceMeta()?.isInApp) return window.location.href = e, Promise.resolve(!0);
                let t = tm(e),
                    n = a[t.path[0]];
                return n ? n(t) : Promise.resolve(!1)
            }
        }),
        tS = e => T.getUntyped(F.apiGateway.withPath(`/guac-v2/v1/bundles/${e}`), {
            credentials: "include"
        }).getOrThrow(),
        tx = {
            Thumbnail: e => {
                let {
                    type: t,
                    targetId: n,
                    containerClass: a,
                    includeProfileFrame: r
                } = e;
                return (0, C.jsx)(L.Thumbnail2d, {
                    type: ty[t],
                    size: "150x150",
                    format: "webp",
                    targetId: n,
                    containerClassName: a,
                    includeProfileFrame: r
                })
            },
            getLocale: () => (0, k.getLocale)(),
            formatFullDate: e => {
                let t = (0, k.getLocale)(),
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
                return null == (0, eY.getGameLauncher)() ? null : tw
            },
            parseDeepLink: e => tm(e),
            navigateToDeepLink: e => tN(e),
            getReportAbuseConfig: () => tS("report-abuse-ui"),
            callGuacBehaviour: tS,
            getDeviceMeta: () => (0, tp.getDeviceMeta)(),
            getCurrentUserId: () => String((0, tb.getCurrentUser)()?.id ?? null ?? ""),
            hashStringWithSha256: e => (0, eW.hashStringWithSha256)(e),
            TrustedFriendsModal: e => {
                let {
                    userId: t,
                    linkTokens: n,
                    onClose: a
                } = e;
                return (0, C.jsx)(ev.Provider, {
                    value: tA,
                    children: (0, C.jsx)(eB, {
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
    var tV = e.i(981498),
        tT = e.i(423517),
        tZ = e.i(257771),
        tR = e.i(270784),
        tL = e.i(889375);
    let tF = "Website.Navigation",
        tk = V.looseObject({
            layers: V.record(V.string(), V.looseObject({
                experimentName: V.optional(V.string())
            }))
        }),
        tP = !1,
        tX = async () => {
            if (!tP) {
                tP = !0;
                try {
                    let e = await T.post(F.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                        layers: {
                            [tF]: {}
                        }
                    }, tk, {
                        credentials: "include"
                    }).getOrThrow();
                    if (!e.layers[tF]?.experimentName) return;
                    let t = (0, tb.getCurrentUser)()?.id;
                    (0, tL.sendEvent)(tT.EXPOSED_EVENT_NAME, tT.EXPERIMENTATION_TARGET_NAME, (0, tZ.buildLayerExposureEvent)(e, tF, null == t ? 0 : (0, tb.userIdToNumber)(t), (0, tR.getBrowserTrackerId)() || "0"))
                } catch {
                    tP = !1
                }
            }
        }, tG = "Website.DownloadFunnel", t_ = V.looseObject({
            layers: V.record(V.string(), V.looseObject({
                experimentName: V.optional(V.string())
            }))
        }), tB = !1, tD = async () => {
            if (tB) return;
            tB = !0;
            let e = await T.post(F.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                layers: {
                    [tG]: {}
                }
            }, t_, {
                credentials: "include"
            });
            if (e.isErr()) {
                tB = !1;
                return
            }
            if (!e.value.layers[tG]?.experimentName) return;
            let t = (0, tb.getCurrentUser)()?.id;
            (0, tL.sendEvent)(tT.EXPOSED_EVENT_NAME, tT.EXPERIMENTATION_TARGET_NAME, (0, tZ.buildLayerExposureEvent)(e.value, tG, null == t ? 0 : (0, tb.userIdToNumber)(t), (0, tR.getBrowserTrackerId)() || "0"))
        }, tW = "Notifications.StreamNotificationUXExposure", tj = V.looseObject({
            layers: V.record(V.string(), V.looseObject({
                experimentName: V.nullish(V.string()),
                parameters: V.nullish(V.record(V.string(), V.unknown()))
            }))
        }), tY = async () => {
            let e = await (t ??= T.post(F.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                    layers: {
                        [tW]: {}
                    }
                }, tj, {
                    credentials: "include"
                }).getOrNull().then(e => (null == e && (t = void 0), e))),
                n = e?.layers[tW];
            if (!n?.experimentName || n.parameters?.FFlagWebReactNotificationStreamEnabled !== !0) return;
            let a = (0, tb.getCurrentUser)()?.id;
            (0, tL.sendEvent)(tT.EXPOSED_EVENT_NAME, tT.EXPERIMENTATION_TARGET_NAME, (0, tZ.buildLayerExposureEvent)(e, tW, null == a ? 0 : (0, tb.userIdToNumber)(a), (0, tR.getBrowserTrackerId)() || "0"))
        }, tU = () => tY().catch(e => {
            (0, S.captureException)(e)
        }), tJ = "Website.TopSearchResultsPage.Exposure", tO = V.looseObject({
            layers: V.record(V.string(), V.looseObject({
                parameters: V.nullish(V.record(V.string(), V.unknown()))
            }))
        }), tz = !1, tM = async () => {
            if (tz) return;
            tz = !0;
            let e = await T.post(F.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
                layers: {
                    [tJ]: {}
                }
            }, tO, {
                credentials: "include"
            });
            if (e.isErr()) {
                tz = !1;
                return
            }
            let t = e.value.layers[tJ]?.parameters;
            if (null == t || !("shouldShowTopResults" in t)) return;
            let n = (0, tb.getCurrentUser)()?.id;
            (0, tL.sendEvent)(tT.EXPOSED_EVENT_NAME, tT.EXPERIMENTATION_TARGET_NAME, (0, tZ.buildLayerExposureEvent)(e.value, tJ, null == n ? 0 : (0, tb.userIdToNumber)(n), (0, tR.getBrowserTrackerId)() || "0"))
        }, tH = V.object({
            plusIdentityBadgeEnabled: V.optional(V.boolean())
        }), tQ = {
            queryKey: ["guac/web-plus-identity-badge"],
            queryFn: () => T.get(F.apiGateway.withPath("/guac-v2/v1/bundles/web-plus-identity-badge"), tH, {
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
    var t$ = e.i(115718);
    let tK = (0, w.default)(() => e.A(957562).then(e => ((0, tV.trackAppShellCounter)("NavLoad", {
            outcome: "loaded"
        }), e), e => {
            throw (0, tV.trackAppShellCounter)("NavLoad", {
                outcome: "failed"
            }), e
        }), {
            loadableGenerated: {
                modules: [379068]
            },
            loading: () => (0, C.jsx)("div", {
                className: "nav-header-offset",
                "aria-hidden": "true"
            })
        }),
        tq = V.object({
            isVNGComplianceEnabled: V.optional(V.boolean())
        }),
        t0 = () => T.get(F.apiGateway.withPath("/guac-v2/v1/bundles/intl-auth-compliance"), tq, {
            credentials: "include"
        }).getOrThrow(),
        t2 = V.object({
            notificationsCanAccessStream: V.optional(V.boolean())
        }),
        t1 = () => T.get(F.apiGateway.withPath("/guac-v2/v1/bundles/navigation-header-ui"), t2, {
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
        t5 = V.object({
            count: V.number()
        }),
        t3 = (e, t) => T.get(R.Url.parse(`https://${e}.${F.rootDomain}`).getOrThrow().withPath(t), t5, {
            credentials: "include"
        }).map(e => {
            let {
                count: t
            } = e;
            return t
        }).getOrThrow(),
        t9 = () => t3("friends", "/v1/user/friend-requests/count"),
        t4 = () => t3("privatemessages", "/v1/messages/unread/count"),
        t8 = () => t3("trades", "/v1/trades/inbound/count"),
        t7 = e => T.get(R.Url.parse(`https://economy.${F.rootDomain}`).getOrThrow().withPath(`/v1/users/${String(e)}/currency`), V.object({
            robux: V.number()
        }), {
            credentials: "include"
        }).getOrThrow(),
        t6 = ["control", "hideCreditAndRobux", "showCreditAndRobux"],
        ne = V.object({
            creditDisplayConfig: V.nullable(V.string()),
            creditBalance: V.nullable(V.number()),
            currencyCode: V.nullable(V.string())
        }),
        nt = () => T.get(F.apiGateway.withPath("/credit-balance/v1/get-credit-balance-for-navigation"), ne, {
            credentials: "include"
        }).map(e => {
            let {
                creditDisplayConfig: t,
                ...n
            } = e;
            return {
                ...n,
                creditDisplayConfig: t6.find(e => e === t) ?? null
            }
        }).getOrThrow(),
        nn = () => T.get(F.apiGateway.withPath("/robuxbadge/v1/robuxbadge"), V.object({
            is_virtual_item_available: V.boolean(),
            active_virtual_item_start_time_seconds_utc: V.number()
        }), {
            credentials: "include"
        }).getOrThrow(),
        na = () => T.postUntyped(F.authApi.withPath("/v2/logout"), {}, {
            credentials: "include"
        }).map(() => void 0).getOrThrow(),
        nr = "Accounts.AccountSwitcher",
        ni = "Website.LogoutUpsell",
        nl = V.object({
            layers: V.object({
                [nr]: V.object({
                    parameters: V.object({
                        isAccountSwitcherEnabled: V.optional(V.unknown())
                    })
                })
            })
        }),
        ns = V.object({
            layers: V.object({
                [ni]: V.object({
                    parameters: V.object({
                        IsPromptsServiceEnabled: V.optional(V.unknown())
                    })
                })
            })
        }),
        no = () => n ??= T.post(F.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
            layers: {
                [nr]: {}
            }
        }, nl, {
            credentials: "include"
        }).map(e => {
            let {
                layers: t
            } = e;
            return !0 === t[nr].parameters.isAccountSwitcherEnabled
        }).getOrDefault(!1),
        nc = () => T.post(F.apiGateway.withPath("/product-experimentation-platform/v1/projects/1/values"), {
            layers: {
                [ni]: {}
            }
        }, ns, {
            credentials: "include"
        }).map(e => {
            let {
                layers: t
            } = e;
            return !0 === t[ni].parameters.IsPromptsServiceEnabled
        }).getOrDefault(!1),
        nu = V.object({
            IsEmailUpsellAtLogoutEnabled: V.optional(V.boolean())
        }),
        nd = V.object({
            emailAddress: V.optional(V.nullable(V.string()))
        }),
        nm = R.Url.parse(`https://accountsettings.${F.rootDomain}`).getOrThrow(),
        np = async () => {
            let e = await T.get(F.authApi.withPath("/v2/metadata"), nu, {
                credentials: "include"
            }).getOrNull();
            if (e?.IsEmailUpsellAtLogoutEnabled !== !0) return !1;
            let t = await T.get(nm.withPath("/v1/email"), nd, {
                credentials: "include"
            }).getOrNull();
            return null != t && !t.emailAddress
        }, ng = e => R.Url.parse(`https://notifications.${F.rootDomain}`).getOrThrow().withPath(e), nh = () => T.get(ng("/v2/stream-notifications/unread-count"), V.object({
            unreadNotifications: V.number()
        }), {
            credentials: "include"
        }).map(e => {
            let {
                unreadNotifications: t
            } = e;
            return t
        }).getOrThrow(), nf = () => T.postUntyped(ng("/v2/stream-notifications/clear-unread"), {}, {
            credentials: "include"
        }).map(() => void 0).getOrThrow(), nb = (e, t) => {
            let n, a = !0,
                r = () => {
                    t()
                };
            return (0, P.getRealtimeClient)().then(t => {
                a && null != t && (t.Subscribe(e, r), n = () => {
                    t.Unsubscribe(e, r)
                })
            }), () => {
                a = !1, n?.()
            }
        }, nv = V.object({
            displayName: V.string(),
            hasVerifiedBadge: V.boolean()
        }), ny = e => (0, x.useQuery)({
            queryKey: ["navigation-user", e],
            queryFn: () => T.get(R.Url.parse(`https://users.${F.rootDomain}`).getOrThrow().withPath(`/v1/users/${String(e)}`), nv, {
                credentials: "include"
            }).getOrThrow(),
            enabled: null != e,
            staleTime: 1 / 0
        }).data, nI = e => ny(e.id)?.displayName ?? e.displayName ?? "", nA = e => ny(e.id)?.hasVerifiedBadge ?? e.hasVerifiedBadge, nE = V.object({
            access: V.string()
        }), nC = V.object({
            eligibility: V.union([V.string(), V.number()])
        }), nw = new Map([
            ["Invalid", "Invalid"],
            ["Eligible", "Eligible"],
            ["Ineligible", "Ineligible"],
            [0, "Invalid"],
            [1, "Eligible"],
            [2, "Ineligible"]
        ]), nN = V.object({
            referrals: V.array(V.object({
                senderUserId: V.union([V.number(), V.string()])
            }))
        }), nS = V.object({
            prefix: V.string(),
            algorithmName: V.string(),
            entries: V.array(V.object({
                type: V.union([V.literal(0), V.literal(1), V.literal(2)]),
                score: V.number(),
                universeId: V.number(),
                canonicalTitle: V.nullable(V.string()),
                thumbnailUrl: V.nullable(V.string()),
                searchQuery: V.string(),
                trendingSearchStartDateTime: V.nullable(V.string())
            }))
        }), nx = V.object({
            Args: V.object({
                Prefix: V.string(),
                Limit: V.number(),
                Algo: V.nullable(V.string())
            }),
            Data: V.array(V.object({
                Query: V.string(),
                Score: V.number()
            }))
        }), nV = new AbortController, nT = () => (nV.abort(), (nV = new AbortController).signal), nZ = e => T.get(F.apiGateway.withPath(`/games-autocomplete/v1/get-suggestion/${encodeURIComponent(e.toLowerCase())}`), nS, {
            credentials: "include",
            signal: nT()
        }).getOrThrow(), nR = (e, t, n, a, r) => {
            var i;
            let l, s;
            return T.get((r ? F.apiGateway : F.apiGatewayCdn).withPath("/autocomplete-avatar/v2/suggest").withSearchParams({
                prefix: e.toLowerCase(),
                limit: String(n),
                lang: t,
                q: a
            }), nx, {
                credentials: "include",
                signal: (i = nT(), l = new AbortController, s = setTimeout(() => {
                    l.abort(new DOMException("The request timed out.", "TimeoutError"))
                }, 5e3), i.addEventListener("abort", () => {
                    clearTimeout(s), l.abort(i.reason)
                }, {
                    once: !0
                }), l.signal)
            }).getOrThrow()
        }, nL = e => e instanceof Z.AbortError && "Abort" === e.cause.code, nF = e => {
            let {
                universeId: t,
                onLoad: n
            } = e;
            return (0, C.jsx)(L.Thumbnail2d, {
                targetId: t,
                type: "GameIcon",
                size: "150x150",
                format: "jpeg",
                containerClassName: "thumbnail-icon",
                onLoad: n
            })
        }, nk = e => {
            let {
                userId: t,
                altName: n,
                containerClass: a
            } = e;
            return (0, C.jsx)(L.Thumbnail2d, {
                targetId: t,
                type: "AvatarHeadShot",
                altName: n,
                containerClassName: a,
                includeProfileFrame: !0
            })
        }, nP = () => {
            let {
                data: e = !1
            } = (0, x.useQuery)(tQ);
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
            isReferralRolloutEnabled: s,
            isTopNavDownloadEnabled: o,
            isTopSearchResultsEnabled: c,
            serverHints: u
        } = e;
        return (0, C.jsx)(tK, {
            user: t,
            location: n,
            serverHints: u,
            ageBadgeControl: r,
            showUncheckedBadge: i,
            getIntAuthCompliancePolicy: t0,
            getNavigationHeaderBehavior: t1,
            getFriendRequestCount: t9,
            getMessageUnreadCount: t4,
            logLeftNavExposure: tX,
            logTopNavDownloadExposure: tD,
            logNotificationStreamExposure: tU,
            getTradeInboundCount: t8,
            getUserCurrency: t7,
            getCreditBalanceForNavigation: nt,
            getRobuxBadge: nn,
            isTopNavDownloadEnabled: () => o,
            getIsTopSearchResultsEnabled: () => c,
            logTopSearchResultsExposure: tM,
            logout: na,
            getAccountSwitcherEnabled: no,
            getLogoutPromptsServiceEnabled: nc,
            shouldShowLegacyEmailUpsell: np,
            getNotificationUnreadCount: nh,
            clearNotificationUnread: nf,
            subscribeRealTime: nb,
            AvatarHeadshot: nk,
            useLiveUserNameForDisplay: nI,
            useHasVerifiedBadge: nA,
            useStreamedValue: N.use,
            useIsPlusBadgeEnabled: nP,
            isReferralRolloutEnabled: s,
            usePlusStatus: e => ((e, t, n, a) => {
                let r = e && !t,
                    {
                        data: i,
                        isPending: l
                    } = (0, x.useQuery)({
                        queryKey: ["plus-referrals", "viewer-subscription"],
                        enabled: r,
                        queryFn: () => T.get(F.apiGateway.withPath("/access-management/v1/upsell-feature-access").withSearchParams({
                            featureName: "IsRobloxPlusSubscribed",
                            namespace: "subscriptions/PlusSubscription"
                        }), nE, {
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
                    o = r && l,
                    {
                        data: c
                    } = (0, x.useQuery)({
                        queryKey: ["plus-referrals", "sender-eligibility"],
                        enabled: n && s,
                        queryFn: async () => {
                            let e = await a;
                            return null != e ? nw.get(e) : T.get(F.apiGateway.withPath("/subscriptions/v2/referral-eligibility"), nC, {
                                credentials: "include"
                            }).map(e => {
                                let {
                                    eligibility: t
                                } = e;
                                return nw.get(t)
                            }).getOrThrow()
                        },
                        staleTime: 1 / 0
                    }),
                    {
                        data: u
                    } = (0, x.useQuery)({
                        queryKey: ["plus-referrals", "pending-referrer"],
                        enabled: n && e && !o && !s,
                        queryFn: () => T.get(F.apiGateway.withPath("/subscriptions/v2/referrals").withSearchParams({
                            Status: "1",
                            PageSize: "5"
                        }), nN, {
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
                    senderEligibility: c,
                    pendingReferrerId: u ?? void 0
                }
            })(null != t, a, e, u.plusReferralEligibilityStream),
            getGamesAutocompleteSuggestions: nZ,
            getAvatarAutocompleteSuggestions: nR,
            isSearchRequestCancelled: nL,
            getInternalPageName: () => l,
            getLocale: k.getLocale,
            GameIconThumbnail: nF,
            notificationStreamTransport: tv,
            notificationStreamHost: tx,
            captureNotificationStreamError: (e, t) => {
                (0, S.captureException)(e, t)
            },
            searchLanding: t$.searchLandingCapability
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
        }), s = a.getItem("globalPrivacyControl");
        if (s?.version === 0)
            if (s.data.gpcVersion === t) {
                let t = s.data.nextSync[e];
                if (null != t && Date.now() < t) return (0, n.ok)(null)
            } else s.data.nextSync = {};
        return (0, r.postGlobalPrivacyControl)().andThen(() => {
            if (null != s && 0 !== s.version) return (0, n.err)(new a.LocalStorageWriteError({
                code: "PageRefreshNeeded"
            }));
            let r = Date.now(),
                o = s?.data.nextSync ?? {};
            o[e] = r + i + Math.floor(Math.random() * l);
            let c = Object.entries(o).filter(e => {
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
        s = e.i(460987),
        o = e.i(200643),
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
        y = u.wwwRoblox.withPath("/Game/PlaceLauncher.ashx").toString(),
        I = u.wwwRoblox.withPath("/download/client").toString(),
        A = u.wwwRoblox.withPath("/download/studio").toString();
    e.s(["default", 0, function(e) {
        let {
            settings: a,
            userId: u,
            isWindowsOrMac: g,
            osName: E,
            isInApp: C
        } = e, [w, N] = (0, n.useState)(null), [S, x] = (0, n.useState)(!1), [V, T] = (0, n.useState)(!1), Z = (0, n.useRef)(null), R = (0, n.useRef)(null);
        (0, n.useEffect)(() => {
            let e = {
                    placeLauncherUrl: y,
                    robloxLocale: a.RobloxLocale ?? "",
                    gameLocale: a.GameLocale ?? "",
                    playerChannel: h(a.PlayerChannelName),
                    studioChannel: h(a.StudioChannelName),
                    isDuarAutoOptInEnabled: a.IsDuarAutoOptInEnabled,
                    isDuarOptOutDisabled: a.IsDuarOptOutDisabled,
                    isOmitPlayerChannelForWinAndMacEnabled: a.IsOmitPlayerChannelForWinAndMacEnabled
                },
                t = (0, s.createGameLauncher)({
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
                        N({
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
            if ("launchMode" in e && (0, o.isStudioLaunchMode)(e.launchMode)) {
                t.src = A, N(null);
                return
            }
            t.referrerPolicy = "no-referrer";
            let n = i.window.location.href;
            t.src = `${I}${await (0,r.getInstallerDeeplinkQueryParams)(n)}`
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
                    N(null)
                }
            }), S ? (0, t.jsx)(b, {
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
                for (let [e, s] of i.entries()) {
                    if (await (0, n.abortableTimeout)(s, t), t.aborted) break;
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
                return N
            },
            FIDThresholds: function() {
                return ee
            },
            INPThresholds: function() {
                return D
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
                return S
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
                return z
            }
        });
        var a, r, i, l, s, o = -1,
            c = function(e) {
                addEventListener("pageshow", function(t) {
                    t.persisted && (o = t.timeStamp, e(t))
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
                return o >= 0 ? a = "back-forward-cache" : n && (document.prerendering || d() > 0 ? a = "prerender" : document.wasDiscarded ? a = "restore" : n.type && (a = n.type.replace(/_/g, "-"))), {
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
                    var s;
                    t.value >= 0 && (l || a) && ((i = t.value - (r || 0)) || void 0 === r) && (r = t.value, t.delta = i, s = t.value, t.rating = s > n[1] ? "poor" : s > n[0] ? "needs-improvement" : "good", e(t))
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
            y = function() {
                return "hidden" !== document.visibilityState || document.prerendering ? 1 / 0 : 0
            },
            I = function(e) {
                "hidden" === document.visibilityState && v > -1 && (v = "visibilitychange" === e.type ? e.timeStamp : 0, E())
            },
            A = function() {
                addEventListener("visibilitychange", I, !0), addEventListener("prerenderingchange", I, !0)
            },
            E = function() {
                removeEventListener("visibilitychange", I, !0), removeEventListener("prerenderingchange", I, !0)
            },
            C = function() {
                return v < 0 && (v = y(), A(), c(function() {
                    setTimeout(function() {
                        v = y(), A()
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
            N = [1800, 3e3],
            S = function(e, t) {
                t = t || {}, w(function() {
                    var n, a = C(),
                        r = m("FCP"),
                        i = p("paint", function(e) {
                            e.forEach(function(e) {
                                "first-contentful-paint" === e.name && (i.disconnect(), e.startTime < a.firstHiddenTime && (r.value = Math.max(e.startTime - d(), 0), r.entries.push(e), n(!0)))
                            })
                        });
                    i && (n = g(e, r, N, t.reportAllChanges), c(function(a) {
                        n = g(e, r = m("FCP"), N, t.reportAllChanges), h(function() {
                            r.value = performance.now() - a.timeStamp, n(!0)
                        })
                    }))
                })
            },
            x = [.1, .25],
            V = function(e, t) {
                t = t || {}, S(b(function() {
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
                        s = p("layout-shift", l);
                    s && (n = g(e, a, x, t.reportAllChanges), f(function() {
                        l(s.takeRecords()), n(!0)
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
            F = function() {
                "interactionCount" in performance || a || (a = p("event", L, {
                    type: "event",
                    buffered: !0,
                    durationThreshold: 0
                }))
            },
            k = [],
            P = new Map,
            X = 0,
            G = [],
            _ = function(e) {
                if (G.forEach(function(t) {
                        return t(e)
                    }), e.interactionId || "first-input" === e.entryType) {
                    var t = k[k.length - 1],
                        n = P.get(e.interactionId);
                    if (n || k.length < 10 || e.duration > t.latency) {
                        if (n) e.duration > n.latency ? (n.entries = [e], n.latency = e.duration) : e.duration === n.latency && e.startTime === n.entries[0].startTime && n.entries.push(e);
                        else {
                            var a = {
                                id: e.interactionId,
                                latency: e.duration,
                                entries: [e]
                            };
                            P.set(a.id, a), k.push(a)
                        }
                        k.sort(function(e, t) {
                            return t.latency - e.latency
                        }), k.length > 10 && k.splice(10).forEach(function(e) {
                            return P.delete(e.id)
                        })
                    }
                }
            },
            B = function(e) {
                var t = self.requestIdleCallback || self.setTimeout,
                    n = -1;
                return e = b(e), "hidden" === document.visibilityState ? e() : (n = t(e), f(e)), n
            },
            D = [200, 500],
            W = function(e, t) {
                "PerformanceEventTiming" in self && "interactionId" in PerformanceEventTiming.prototype && (t = t || {}, w(function() {
                    F();
                    var n, r, i = m("INP"),
                        l = function(e) {
                            B(function() {
                                e.forEach(_);
                                var t, n = (t = Math.min(k.length - 1, Math.floor(((a ? T : performance.interactionCount || 0) - X) / 50)), k[t]);
                                n && n.latency !== i.value && (i.value = n.latency, i.entries = n.entries, r())
                            })
                        },
                        s = p("event", l, {
                            durationThreshold: null != (n = t.durationThreshold) ? n : 40
                        });
                    r = g(e, i, D, t.reportAllChanges), s && (s.observe({
                        type: "first-input",
                        buffered: !0
                    }), f(function() {
                        l(s.takeRecords()), r(!0)
                    }), c(function() {
                        X = 0, k.length = 0, P.clear(), r = g(e, i = m("INP"), D, t.reportAllChanges)
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
                        var s = b(function() {
                            Y[r.id] || (i(l.takeRecords()), l.disconnect(), Y[r.id] = !0, n(!0))
                        });
                        ["keydown", "click"].forEach(function(e) {
                            addEventListener(e, function() {
                                return B(s)
                            }, !0)
                        }), f(s), c(function(a) {
                            n = g(e, r = m("LCP"), j, t.reportAllChanges), h(function() {
                                r.value = performance.now() - a.timeStamp, Y[r.id] = !0, n(!0)
                            })
                        })
                    }
                })
            },
            J = [800, 1800],
            O = function e(t) {
                document.prerendering ? w(function() {
                    return e(t)
                }) : "complete" !== document.readyState ? addEventListener("load", function() {
                    return e(t)
                }, !0) : setTimeout(t, 0)
            },
            z = function(e, t) {
                t = t || {};
                var n = m("TTFB"),
                    a = g(e, n, J, t.reportAllChanges);
                O(function() {
                    var r = u();
                    r && (n.value = Math.max(r.responseStart - d(), 0), n.entries = [r], a(!0), c(function() {
                        (a = g(e, n = m("TTFB", 0), J, t.reportAllChanges))(!0)
                    }))
                })
            },
            M = {
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
                    s.forEach(function(t) {
                        t(e)
                    }), s = []
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
                        removeEventListener("pointerup", t, M), removeEventListener("pointercancel", n, M)
                    }, addEventListener("pointerup", t, M), addEventListener("pointercancel", n, M)) : Q(r, e)
                }
            },
            q = function(e) {
                ["mousedown", "keydown", "touchstart", "pointerdown"].forEach(function(t) {
                    return e(t, K, M)
                })
            },
            ee = [100, 300],
            et = function(e, t) {
                t = t || {}, w(function() {
                    var n, a = C(),
                        l = m("FID"),
                        o = function(e) {
                            e.startTime < a.firstHiddenTime && (l.value = e.processingStart - e.startTime, l.entries.push(e), n(!0))
                        },
                        u = function(e) {
                            e.forEach(o)
                        },
                        d = p("first-input", u);
                    n = g(e, l, ee, t.reportAllChanges), d && (f(b(function() {
                        u(d.takeRecords()), d.disconnect()
                    })), c(function() {
                        n = g(e, l = m("FID"), ee, t.reportAllChanges), s = [], i = -1, r = null, q(addEventListener), s.push(o), $()
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
        s = e.i(860430),
        o = e.i(84523),
        c = e.i(949610);
    let u = (0, s.fileDesc)("ChtldmVudC91c2VyX2V2ZW50X2Jhc2UucHJvdG8SBWV2ZW50It4HCg1Vc2VyRXZlbnRCYXNlEiUKB3VzZXJfaWQYASABKANCD5K+kgED4D4Bmr6SAQIIAUgAiAEBEiYKCHVzZXJfa2V5GAIgASgJQg+SvpIBA6g/AZq+kgECGAFIAYgBARIgCgljbGllbnRfaXAYAyABKAlCCJK+kgED6D4BSAKIAQESIQoKdXNlcl9hZ2VudBgEIAEoCUIIkr6SAQOgPwFIA4gBARInChBwbGF0Zm9ybV90eXBlX2lkGAUgASgDQgiSvpIBA+A/AUgEiAEBEikKEmJyb3dzZXJfdHJhY2tlcl9pZBgGIAEoA0IIkr6SAQPQPgFIBYgBARIoChFpc190cnVzdGVkX3NvdXJjZRgHIAEoCEIIkr6SAQOwPwFIBogBARIiCgt1c2VyX29yaWdpbhgIIAEoCUIIkr6SAQPYPwFIB4gBARIdCgZ0YXJnZXQYCSABKAlCCJK+kgEDiH0BSAiIAQESIQoKZXZlbnRfdHlwZRgKIAEoCUIIkr6SAQOQfQFICYgBARIfCghhcHBfbmFtZRgLIAEoCUIIkr6SAQO4PwFICogBARIxChtpbmdlc3Rpb25fdGltZV9taWxsaXNlY29uZHMYDCABKANCB4q+kgECCAFIC4gBARJEChFldmVudF9zdHJlYW1fdGFncxgNIAMoCzIpLmV2ZW50LlVzZXJFdmVudEJhc2UuRXZlbnRTdHJlYW1UYWdzRW50cnkSJgoPYXV0aF9zZXNzaW9uX2lkGA4gASgJQgiSvpIBA8A/AUgMiAEBEicKEGh0dHBfZmluZ2VycHJpbnQYDyABKAlCCJK+kgEDyD8BSA2IAQESJgoPdGxzX2ZpbmdlcnByaW50GBAgASgJQgiSvpIBA9A/AUgOiAEBGjYKFEV2ZW50U3RyZWFtVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCToCOAFCCgoIX3VzZXJfaWRCCwoJX3VzZXJfa2V5QgwKCl9jbGllbnRfaXBCDQoLX3VzZXJfYWdlbnRCEwoRX3BsYXRmb3JtX3R5cGVfaWRCFQoTX2Jyb3dzZXJfdHJhY2tlcl9pZEIUChJfaXNfdHJ1c3RlZF9zb3VyY2VCDgoMX3VzZXJfb3JpZ2luQgkKB190YXJnZXRCDQoLX2V2ZW50X3R5cGVCCwoJX2FwcF9uYW1lQh4KHF9pbmdlc3Rpb25fdGltZV9taWxsaXNlY29uZHNCEgoQX2F1dGhfc2Vzc2lvbl9pZEITChFfaHR0cF9maW5nZXJwcmludEISChBfdGxzX2ZpbmdlcnByaW50QjBaLmdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRiBnByb3RvMw", [c.file_event_event_field_options]);
    var d = e.i(89716);
    let m = (0, s.fileDesc)("CiBldmVudHN0cmVhbS93ZWIvd2ViX3ZpdGFscy5wcm90bxIXZXZlbnRzdHJlYW0uZXZlbnRpbmdlc3Qi4gQKCVdlYlZpdGFscxInCg9sb2NhbF90aW1lc3RhbXAYASABKAlCCaK+kgEECgJsdEgAiAEBEi0KD3VzZXJfZXZlbnRfYmFzZRgCIAEoCzIULmV2ZW50LlVzZXJFdmVudEJhc2USHgoEcGFnZRgDIAEoCUILor6SAQYKBHBhZ2VIAYgBARIcCgN1cmwYBCABKAlCCqK+kgEFCgN1cmxIAogBARIfCgZsY3BfbXMYBSABKAFCCqK+kgEFCgNsY3BIA4gBARIfCgZmY3BfbXMYBiABKAFCCqK+kgEFCgNmY3BIBIgBARIhCgd0dGZiX21zGAcgASgBQguivpIBBgoEdHRmYkgFiAEBEhwKA2NscxgIIAEoAUIKor6SAQUKA2Nsc0gGiAEBEh8KBmlucF9tcxgJIAEoAUIKor6SAQUKA2lucEgHiAEBOsAByvySASMKDGluZ2VzdF9wcm90bxIKd2ViX3ZpdGFscyIHZHMsaG91ctr8kgEGCIgnEIAE4vySAUYiA3d3dzopCgRVc2VyEg1Db25zdW1lciBBcHBzGg9XZWIgYW5kIEJhY2tlbmQguRNCCyNjcC1iYWNrZW5kSgdQSDNQS01Y6vySATYKIGV2ZW50c3RyZWFtL3dlYi93ZWJfdml0YWxzLnByb3RvEhAKA3d3dxIJd2ViVml0YWxzGAf6/JIBAggBQhIKEF9sb2NhbF90aW1lc3RhbXBCBwoFX3BhZ2VCBgoEX3VybEIJCgdfbGNwX21zQgkKB19mY3BfbXNCCgoIX3R0ZmJfbXNCBgoEX2Nsc0IJCgdfaW5wX21zQjpaOGdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vd2ViYgZwcm90bzM", [c.file_event_event_field_options, u, d.file_eventstream_core_hive_table_message_options]),
        p = (0, o.messageDesc)(m, 0);
    var g = e.i(868275),
        h = e.i(400661),
        f = e.i(343549),
        b = e.i(950814);
    e.i(700781), e.i(787386), e.i(778365);
    let v = (0, s.fileDesc)("ChVnb29nbGUvYXBpL2h0dHAucHJvdG8SCmdvb2dsZS5hcGkiVAoESHR0cBIjCgVydWxlcxgBIAMoCzIULmdvb2dsZS5hcGkuSHR0cFJ1bGUSJwofZnVsbHlfZGVjb2RlX3Jlc2VydmVkX2V4cGFuc2lvbhgCIAEoCCKBAgoISHR0cFJ1bGUSEAoIc2VsZWN0b3IYASABKAkSDQoDZ2V0GAIgASgJSAASDQoDcHV0GAMgASgJSAASDgoEcG9zdBgEIAEoCUgAEhAKBmRlbGV0ZRgFIAEoCUgAEg8KBXBhdGNoGAYgASgJSAASLwoGY3VzdG9tGAggASgLMh0uZ29vZ2xlLmFwaS5DdXN0b21IdHRwUGF0dGVybkgAEgwKBGJvZHkYByABKAkSFQoNcmVzcG9uc2VfYm9keRgMIAEoCRIxChNhZGRpdGlvbmFsX2JpbmRpbmdzGAsgAygLMhQuZ29vZ2xlLmFwaS5IdHRwUnVsZUIJCgdwYXR0ZXJuIi8KEUN1c3RvbUh0dHBQYXR0ZXJuEgwKBGtpbmQYASABKAkSDAoEcGF0aBgCIAEoCUJqCg5jb20uZ29vZ2xlLmFwaUIJSHR0cFByb3RvUAFaQWdvb2dsZS5nb2xhbmcub3JnL2dlbnByb3RvL2dvb2dsZWFwaXMvYXBpL2Fubm90YXRpb25zO2Fubm90YXRpb25z+AEBogIER0FQSWIGcHJvdG8z");
    var y = e.i(675618);
    let I = (0, s.fileDesc)("Chxnb29nbGUvYXBpL2Fubm90YXRpb25zLnByb3RvEgpnb29nbGUuYXBpOksKBGh0dHASHi5nb29nbGUucHJvdG9idWYuTWV0aG9kT3B0aW9ucxiwyrwiIAEoCzIULmdvb2dsZS5hcGkuSHR0cFJ1bGVSBGh0dHBCbgoOY29tLmdvb2dsZS5hcGlCEEFubm90YXRpb25zUHJvdG9QAVpBZ29vZ2xlLmdvbGFuZy5vcmcvZ2VucHJvdG8vZ29vZ2xlYXBpcy9hcGkvYW5ub3RhdGlvbnM7YW5ub3RhdGlvbnOiAgRHQVBJYgZwcm90bzM", [v, y.file_google_protobuf_descriptor]),
        A = (0, s.fileDesc)("Cllyb2Jsb3gvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvdjEvZXhwZXJpZW5jZV9zaWduYWxzX2luZ2VzdC5wcm90bxI5cm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxIoIBCgVFdmVudBIOCgZzb3VyY2UYASABKAkSDwoHcGF5bG9hZBgCIAEoDBJYCgpyb2Jsb3hfY3R4GAMgASgLMkQucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlJvYmxveEN0eCKfAQoJUm9ibG94Q3R4EmIKB2hlYWRlcnMYASADKAsyUS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4LkhlYWRlcnNFbnRyeRouCgxIZWFkZXJzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgJOgI4ASJLCgZTb3VyY2USDAoEbmFtZRgBIAEoCRITCgtrYWZrYV90b3BpYxgCIAEoCRIPCgdibG9ja2VkGAMgASgIEg0KBW5vdGVzGAQgASgJIl0KB1NvdXJjZXMSUgoHc291cmNlcxgBIAMoCzJBLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5Tb3VyY2UiGwoIUmVzcG9uc2USDwoHbWVzc2FnZRgCIAEoCULPAQo9Y29tLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MUIcRXhwZXJpZW5jZVNpZ25hbHNJbmdlc3RQcm90b1ABWjJleHBlcmllbmNlc2lnbmFsc2luZ2VzdC9leHBlcmllbmNlc2lnbmFsc2luZ2VzdC92MaoCOVJvYmxveC5FeHBlcmllbmNlU2lnbmFsc0luZ2VzdC5FeHBlcmllbmNlU2lnbmFsc0luZ2VzdC5WMWIGcHJvdG8z"),
        E = (0, s.fileDesc)("Ch1yb2Jsb3gvcHJvdG9idWYvb3B0aW9ucy5wcm90bxIPcm9ibG94LnByb3RvYnVmIoQBChZTZXJ2aWNlQ29udHJhY3RPcHRpb25zEg8KB3B1Ymxpc2gYASABKAgSIwobY3NoYXJwX2dlbmVyYXRlX3NlcnZlcl9zdHViGAIgASgIEjQKLGludDY0X2lkX3dyYXBwZXJfZW50aXR5X2lkX2NzaGFycF9jb252ZXJzaW9uGAMgASgJOnQKEXNlcnZpY2VfY29udHJhY3RzEhwuZ29vZ2xlLnByb3RvYnVmLkZpbGVPcHRpb25zGNCGAyABKAsyJy5yb2Jsb3gucHJvdG9idWYuU2VydmljZUNvbnRyYWN0T3B0aW9uc1IQc2VydmljZUNvbnRyYWN0czo9CglzZW5zaXRpdmUSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGNGGAyABKAhSCXNlbnNpdGl2ZTpACglzcWxfdmFsdWUSIS5nb29nbGUucHJvdG9idWYuRW51bVZhbHVlT3B0aW9ucxji1AMgASgJUghzcWxWYWx1ZUIRWg9yb2Jsb3gvcHJvdG9idWZiBnByb3RvMw", [y.file_google_protobuf_descriptor]),
        C = (0, s.fileDesc)("Cl1yb2Jsb3gvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvdjEvZXhwZXJpZW5jZV9zaWduYWxzX2luZ2VzdF9hcGkucHJvdG8SOXJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MSJkChBTZW5kQmF0Y2hSZXF1ZXN0ElAKBmV2ZW50cxgBIAMoCzJALnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5FdmVudCITChFTZW5kQmF0Y2hSZXNwb25zZSKZAgoZU2VuZE9wdGltaXplZEJhdGNoUmVxdWVzdBJyCgtzdWJfYmF0Y2hlcxgBIAMoCzJdLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5TZW5kT3B0aW1pemVkQmF0Y2hSZXF1ZXN0LlN1YkJhdGNoGocBCghTdWJCYXRjaBIOCgZzb3VyY2UYASABKAkSEAoIcGF5bG9hZHMYAiADKAwSWQoLcm9ibG94X2N0eHMYAyADKAsyRC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4IhwKGlNlbmRPcHRpbWl6ZWRCYXRjaFJlc3BvbnNlIpYBChdTZW5kVW5pZm9ybUJhdGNoUmVxdWVzdBIOCgZzb3VyY2UYASABKAkSEAoIcGF5bG9hZHMYAiADKAwSWQoLcm9ibG94X2N0eHMYAyADKAsyRC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4IhoKGFNlbmRVbmlmb3JtQmF0Y2hSZXNwb25zZSJjChBTZW5kRXZlbnRSZXF1ZXN0Ek8KBWV2ZW50GAEgASgLMkAucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkV2ZW50IhMKEVNlbmRFdmVudFJlc3BvbnNlIhQKEkxpc3RTb3VyY2VzUmVxdWVzdCJpChNMaXN0U291cmNlc1Jlc3BvbnNlElIKB3NvdXJjZXMYASADKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlIiAKEEdldFNvdXJjZVJlcXVlc3QSDAoEbmFtZRgBIAEoCSJmChFHZXRTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlImgKE0NyZWF0ZVNvdXJjZVJlcXVlc3QSUQoGc291cmNlGAEgASgLMkEucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNvdXJjZSJpChRDcmVhdGVTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlIo0BChNVcGRhdGVTb3VyY2VSZXF1ZXN0EgwKBG5hbWUYASABKAkSGAoLa2Fma2FfdG9waWMYAiABKAlIAIgBARIUCgdibG9ja2VkGAMgASgISAGIAQESEgoFbm90ZXMYBCABKAlIAogBAUIOCgxfa2Fma2FfdG9waWNCCgoIX2Jsb2NrZWRCCAoGX25vdGVzImkKFFVwZGF0ZVNvdXJjZVJlc3BvbnNlElEKBnNvdXJjZRgBIAEoCzJBLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5Tb3VyY2UiIwoTRGVsZXRlU291cmNlUmVxdWVzdBIMCgRuYW1lGAEgASgJIicKFERlbGV0ZVNvdXJjZVJlc3BvbnNlEg8KB2RlbGV0ZWQYASABKAgiIgoSVG91Y2hTb3VyY2VSZXF1ZXN0EgwKBG5hbWUYASABKAkiaAoTVG91Y2hTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlMqgQChpFeHBlcmllbmNlU2lnbmFsc0luZ2VzdEFQSRK9AQoJU2VuZEJhdGNoEksucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRCYXRjaFJlcXVlc3QaTC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZEJhdGNoUmVzcG9uc2UiFYLT5JMCDyIKL3YxL2V2ZW50czoBKhLiAQoSU2VuZE9wdGltaXplZEJhdGNoElQucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRPcHRpbWl6ZWRCYXRjaFJlcXVlc3QaVS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZE9wdGltaXplZEJhdGNoUmVzcG9uc2UiH4LT5JMCGSIUL3YxL2V2ZW50cy9vcHRpbWl6ZWQ6ASoS2gEKEFNlbmRVbmlmb3JtQmF0Y2gSUi5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZFVuaWZvcm1CYXRjaFJlcXVlc3QaUy5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZFVuaWZvcm1CYXRjaFJlc3BvbnNlIh2C0+STAhciEi92MS9ldmVudHMvdW5pZm9ybToBKhLEAQoJU2VuZEV2ZW50Eksucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRFdmVudFJlcXVlc3QaTC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZEV2ZW50UmVzcG9uc2UiHILT5JMCFiIRL3YxL2V2ZW50cy9zaW5nbGU6ASoSwQEKC0xpc3RTb3VyY2VzEk0ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkxpc3RTb3VyY2VzUmVxdWVzdBpOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5MaXN0U291cmNlc1Jlc3BvbnNlIhOC0+STAg0SCy92MS9zb3VyY2VzEsIBCglHZXRTb3VyY2USSy5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuR2V0U291cmNlUmVxdWVzdBpMLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5HZXRTb3VyY2VSZXNwb25zZSIagtPkkwIUEhIvdjEvc291cmNlcy97bmFtZX0SxwEKDENyZWF0ZVNvdXJjZRJOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5DcmVhdGVTb3VyY2VSZXF1ZXN0Gk8ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkNyZWF0ZVNvdXJjZVJlc3BvbnNlIhaC0+STAhAiCy92MS9zb3VyY2VzOgEqEs4BCgxVcGRhdGVTb3VyY2USTi5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuVXBkYXRlU291cmNlUmVxdWVzdBpPLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5VcGRhdGVTb3VyY2VSZXNwb25zZSIdgtPkkwIXMhIvdjEvc291cmNlcy97bmFtZX06ASoSywEKDERlbGV0ZVNvdXJjZRJOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5EZWxldGVTb3VyY2VSZXF1ZXN0Gk8ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkRlbGV0ZVNvdXJjZVJlc3BvbnNlIhqC0+STAhQqEi92MS9zb3VyY2VzL3tuYW1lfRLOAQoLVG91Y2hTb3VyY2USTS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuVG91Y2hTb3VyY2VSZXF1ZXN0Gk4ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlRvdWNoU291cmNlUmVzcG9uc2UiIILT5JMCGiIYL3YxL3NvdXJjZXMve25hbWV9L3RvdWNoQtgBCj1jb20ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxQh9FeHBlcmllbmNlU2lnbmFsc0luZ2VzdEFwaVByb3RvUAFaMmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0L2V4cGVyaWVuY2VzaWduYWxzaW5nZXN0L3YxqgI5Um9ibG94LkV4cGVyaWVuY2VTaWduYWxzSW5nZXN0LkV4cGVyaWVuY2VTaWduYWxzSW5nZXN0LlYxgrUYAggBYgZwcm90bzM", [I, A, E]),
        w = (0, o.messageDesc)(C, 2),
        N = (0, o.messageDesc)(C, 2, 0),
        S = (0, o.messageDesc)(C, 6);
    var x = class {
            async sendEvent(e, t) {
                try {
                    let n = (0, h.toBinary)(e, (0, f.create)(e, t), {
                            writeUnknownFields: !1
                        }),
                        a = (0, f.create)(S, {
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
                            body: (0, b.gzipSync)((0, h.toBinary)(S, a, {
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
                            return (0, f.create)(N, {
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
        R = {},
        L = /[^A-Za-z0-9_]/g,
        F = {
            ttfb: "TTFB",
            fcp: "FCP",
            lcp: "LCP",
            inp: "INP",
            cls: "CLS"
        };
    var k = e.i(245837);
    let P = {
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
        G = X();
    e.s(["default", 0, function(e) {
        let {
            pageName: s
        } = e, o = (0, a.useRef)({});
        return (0, r.useReportWebVitals)(e => {
            let t = P[e.name];
            t && (o.current[t] = {
                value: e.value
            })
        }), (0, a.useEffect)(() => {
            G.pageNameSet || (G.pageNameSet = !0, G.pageName = s)
        }, []), (0, a.useEffect)(() => {
            let e = () => {
                    if (G.sent) return;
                    G.sent = !0;
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
                        function(e, a, r, i, s) {
                            if (!a) return;
                            let o = a.lcp?.value,
                                c = a.fcp?.value,
                                u = a.ttfb?.value,
                                d = a.cls?.value,
                                m = a.inp?.value;
                            if ([o, c, u, d, m].some(e => "number" == typeof e)) try {
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
                                        lcpMs: o,
                                        fcpMs: c,
                                        ttfbMs: u,
                                        cls: d,
                                        inpMs: m
                                    }).catch(() => {}),
                                    function(e, t) {
                                        if (!e) return;
                                        let n = void 0 === t || "" === t ? "Unknown" : t;
                                        if (Math.random() >= (R[n] ?? .05)) return;
                                        let a = n.replace(L, "_"),
                                            {
                                                appType: r,
                                                browser: i
                                            } = (0, T.getDeviceClient)(),
                                            l = {
                                                appType: r,
                                                browser: i
                                            },
                                            s = !1;
                                        for (let [t, n] of Object.entries(F)) {
                                            let r = e[t]?.value;
                                            "number" == typeof r && (Z(`PagePerf_${n}_${a}`, l, r), s = !0)
                                        }
                                        s && (0, V.flushTelemetryHistograms)()
                                    }(a, s)
                            } catch (e) {
                                console.error("[PERF] Failed to send web vitals:", e)
                            }
                        }(k.default.apiGatewayUrl, o.current, (0, i.getCurrentUser)()?.id, s, G.pageName)
                },
                a = () => {
                    "hidden" === document.visibilityState && e()
                };
            return document.addEventListener("visibilitychange", a), window.addEventListener("pagehide", e), () => {
                document.removeEventListener("visibilitychange", a), window.removeEventListener("pagehide", e)
            }
        }, [s]), null
    }, "resetDocumentLoadForTests", 0, () => {
        G = X()
    }], 8888)
}, 967069, e => {
    "use strict";
    var t = e.i(19836),
        n = e.i(526005),
        a = e.i(708923),
        r = e.i(523131),
        i = e.i(878727),
        l = e.i(587541),
        s = e.i(690255),
        o = e.i(801827),
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
        } = e, u = (0, o.useTranslations)("CommonUI.UserAgreements"), {
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
                                children: (0, t.jsx)(s.Link, {
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
        s = e.i(357355),
        o = e.i(217827);
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
            void 0 !== e && h(e)
        }), (0, o.useRealtimeNamespace)("UserSettingsChanged", e => {
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
    let s = "classic-theme-variant",
        o = "classic-theme-variant-1",
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
            let e = i.getItem(s) ?? {
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
            null != e && (e.includes(a) && document.body.classList.add(o), p(!0))
        }, [a]), (0, t.useEffect)(() => {
            if (null == g) return;
            document.body.classList.toggle(o, g);
            let e = d();
            if (null == e) return;
            let t = e.includes(a);
            g && !t ? i.setItem(s, {
                version: 0,
                data: [...e, a]
            }) : !g && t && i.setItem(s, {
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

//# debugId=4c350ce2-6c86-9487-9814-ac49f2282cc1
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0wsc6oio4-26b.js.map