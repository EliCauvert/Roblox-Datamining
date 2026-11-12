;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "31a84602-8dd9-0d61-fc4b-be4b63b17e29")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 74284, (l, e, Z) => {
    "use strict";
    Object.defineProperty(Z, "__esModule", {
        value: !0
    }), Object.defineProperty(Z, "useMergedRef", {
        enumerable: !0,
        get: function() {
            return b
        }
    });
    let V = l.r(420482);

    function b(l, e) {
        let Z = (0, V.useRef)(null),
            b = (0, V.useRef)(null);
        return (0, V.useCallback)(V => {
            if (null === V) {
                let l = Z.current;
                l && (Z.current = null, l());
                let e = b.current;
                e && (b.current = null, e())
            } else l && (Z.current = n(l, V)), e && (b.current = n(e, V))
        }, [l, e])
    }

    function n(l, e) {
        if ("function" != typeof l) return l.current = e, () => {
            l.current = null
        };
        {
            let Z = l(e);
            return "function" == typeof Z ? Z : () => l(null)
        }
    }("function" == typeof Z.default || "object" == typeof Z.default && null !== Z.default) && void 0 === Z.default.__esModule && (Object.defineProperty(Z.default, "__esModule", {
        value: !0
    }), Object.assign(Z.default, Z), e.exports = Z.default)
}, 512718, (l, e, Z) => {
    "use strict";
    Object.defineProperty(Z, "__esModule", {
        value: !0
    }), Object.defineProperty(Z, "errorOnce", {
        enumerable: !0,
        get: function() {
            return V
        }
    });
    let V = l => {}
}, 2097, (l, e, Z) => {
    "use strict";
    Object.defineProperty(Z, "__esModule", {
        value: !0
    });
    var V = {
        default: function() {
            return g
        },
        useLinkStatus: function() {
            return X
        }
    };
    for (var b in V) Object.defineProperty(Z, b, {
        enumerable: !0,
        get: V[b]
    });
    let n = l.r(744066),
        d = l.r(19836),
        t = n._(l.r(420482)),
        W = l.r(259234),
        R = l.r(466933),
        c = l.r(74284),
        u = l.r(7239),
        A = l.r(298419);
    l.r(239971);
    let a = l.r(708724),
        m = l.r(418776),
        G = l.r(697707),
        o = l.r(420587);

    function g(e) {
        var Z, V;
        let b, n, g, [X, r] = (0, t.useOptimistic)(m.IDLE_LINK_STATUS),
            h = (0, t.useRef)(null),
            {
                href: s,
                as: F,
                children: Y,
                prefetch: p = null,
                passHref: S,
                replace: I,
                shallow: B,
                scroll: y,
                onClick: E,
                onMouseEnter: C,
                onTouchStart: J,
                legacyBehavior: f = !1,
                onNavigate: v,
                transitionTypes: H,
                ref: N,
                unstable_dynamicOnHover: k,
                ...Q
            } = e;
        b = Y, f && ("string" == typeof b || "number" == typeof b) && (b = (0, d.jsx)("a", {
            children: b
        }));
        let K = t.default.useContext(R.AppRouterContext),
            x = !1 !== p,
            z = !1 !== p ? null === (V = p) || "auto" === V ? o.FetchStrategy.PPR : o.FetchStrategy.Full : o.FetchStrategy.PPR,
            U = "string" == typeof(Z = F || s) ? Z : (0, W.formatUrl)(Z);
        if (f) {
            if (b?.$$typeof === Symbol.for("react.lazy")) throw Object.defineProperty(Error("`<Link legacyBehavior>` received a direct child that is either a Server Component, or JSX that was loaded with React.lazy(). This is not supported. Either remove legacyBehavior, or make the direct child a Client Component that renders the Link's `<a>` tag."), "__NEXT_ERROR_CODE", {
                value: "E863",
                enumerable: !1,
                configurable: !0
            });
            n = t.default.Children.only(b)
        }
        let L = f ? n && "object" == typeof n && n.ref : N,
            M = t.default.useCallback(l => (null !== K && (h.current = (0, m.mountLinkInstance)(l, U, K, z, x, r)), () => {
                h.current && ((0, m.unmountLinkForCurrentNavigation)(h.current), h.current = null), (0, m.unmountPrefetchableInstance)(l)
            }), [x, U, K, z, r]),
            j = {
                ref: (0, c.useMergedRef)(M, L),
                onClick(e) {
                    f || "function" != typeof E || E(e), f && n.props && "function" == typeof n.props.onClick && n.props.onClick(e), !K || e.defaultPrevented || function(e, Z, V, b, n, d, W) {
                        if ("u" > typeof window) {
                            let R, {
                                nodeName: c
                            } = e.currentTarget;
                            if ("A" === c.toUpperCase() && ((R = e.currentTarget.getAttribute("target")) && "_self" !== R || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey || e.nativeEvent && 2 === e.nativeEvent.which) || e.currentTarget.hasAttribute("download")) return;
                            if (!(0, G.isLocalURL)(Z)) {
                                b && (e.preventDefault(), location.replace(Z));
                                return
                            }
                            if (e.preventDefault(), d) {
                                let l = !1;
                                if (d({
                                        preventDefault: () => {
                                            l = !0
                                        }
                                    }), l) return
                            }
                            let {
                                dispatchNavigateAction: u
                            } = l.r(511259);
                            t.default.startTransition(() => {
                                u(Z, b ? "replace" : "push", !1 === n ? a.ScrollBehavior.NoScroll : a.ScrollBehavior.Default, V.current, W)
                            })
                        }
                    }(e, U, h, I, y, v, H)
                },
                onMouseEnter(l) {
                    f || "function" != typeof C || C(l), f && n.props && "function" == typeof n.props.onMouseEnter && n.props.onMouseEnter(l), K && x && (0, m.onNavigationIntent)(l.currentTarget, !0 === k)
                },
                onTouchStart: function(l) {
                    f || "function" != typeof J || J(l), f && n.props && "function" == typeof n.props.onTouchStart && n.props.onTouchStart(l), K && x && (0, m.onNavigationIntent)(l.currentTarget, !0 === k)
                }
            };
        return (0, u.isAbsoluteUrl)(U) ? j.href = U : f && !S && ("a" !== n.type || "href" in n.props) || (j.href = (0, A.addBasePath)(U)), g = f ? t.default.cloneElement(n, j) : (0, d.jsx)("a", {
            ...Q,
            ...j,
            children: b
        }), (0, d.jsx)(i.Provider, {
            value: X,
            children: g
        })
    }
    l.r(512718);
    let i = (0, t.createContext)(m.IDLE_LINK_STATUS),
        X = () => (0, t.useContext)(i);
    ("function" == typeof Z.default || "object" == typeof Z.default && null !== Z.default) && void 0 === Z.default.__esModule && (Object.defineProperty(Z.default, "__esModule", {
        value: !0
    }), Object.assign(Z.default, Z), e.exports = Z.default)
}, 698947, (l, e, Z) => {
    e.exports = l.r(364354)
}, 244447, 817558, 840154, 180549, l => {
    "use strict";
    var e = l.i(2097),
        Z = l.i(698947),
        V = l.i(420482),
        b = l.i(745911),
        n = l.i(737344);

    function d(l) {
        let e;
        return ("object" == typeof l ? null == l.host && null == l.hostname : !/^[a-z]+:/i.test(l)) && (null == (e = "object" == typeof l ? l.pathname : l) || !!e.startsWith("/"))
    }

    function t(l, e) {
        let Z = l;
        return /^\/(\?.*)?$/.test(e) && (e = e.slice(1)), Z += e
    }

    function W(l, e, Z) {
        return "string" == typeof l ? l : l[e] || Z
    }

    function R(l) {
        let e = function() {
                try {
                    return "true" === n.default.env._next_intl_trailing_slash
                } catch {
                    return !1
                }
            }(),
            [Z, ...V] = l.split("#"),
            b = V.join("#"),
            d = Z;
        if ("/" !== d) {
            let l = d.endsWith("/");
            e && !l ? d += "/" : !e && l && (d = d.slice(0, -1))
        }
        return b && (d += "#" + b), d
    }

    function c(l, e) {
        let Z, V = R(l),
            b = R(e);
        return (Z = V.replace(/\/\[\[(\.\.\.[^\]]+)\]\]/g, "(?:/(.*))?").replace(/\[\[(\.\.\.[^\]]+)\]\]/g, "(?:/(.*))?").replace(/\[(\.\.\.[^\]]+)\]/g, "(.+)").replace(/\[([^\]]+)\]/g, "([^/]+)"), RegExp(`^${Z}$`)).test(b)
    }

    function u(l, e) {
        return "never" !== e.mode && e.prefixes?.[l] || A(l)
    }

    function A(l) {
        return "/" + l
    }

    function a(l) {
        return l.includes("[[...")
    }

    function m(l) {
        return l.includes("[...")
    }

    function G(l) {
        return l.includes("[")
    }

    function o(l, e) {
        let Z = l.split("/"),
            V = e.split("/"),
            b = Math.max(Z.length, V.length);
        for (let l = 0; l < b; l++) {
            let e = Z[l],
                b = V[l];
            if (!e && b) return -1;
            if (e && !b) return 1;
            if (e || b) {
                if (!G(e) && G(b)) return -1;
                if (G(e) && !G(b)) return 1;
                if (!m(e) && m(b)) return -1;
                if (m(e) && !m(b)) return 1;
                if (!a(e) && a(b)) return -1;
                if (a(e) && !a(b)) return 1
            }
        }
        return 0
    }

    function g(l) {
        return l.sort(o)
    }

    function i(l) {
        let e = new URLSearchParams;
        for (let [Z, V] of Object.entries(l)) Array.isArray(V) ? V.forEach(l => {
            e.append(Z, String(l))
        }) : e.set(Z, String(V));
        return "?" + e.toString()
    }

    function X(l) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : window.location.pathname;
        return "/" === l ? e : e.replace(l, "")
    }

    function r(l, e, Z, V) {
        if (!l || V === Z || null == V || !e) return;
        let b = X(e),
            {
                name: n,
                ...d
            } = l;
        d.path || (d.path = "" !== b ? b : "/");
        let t = `${n}=${V};`;
        for (let [l, e] of Object.entries(d)) t += `${"maxAge"===l?"max-age":l}`, "boolean" != typeof e && (t += "=" + e), t += ";";
        document.cookie = t
    }
    l.s(["getLocaleAsPrefix", 0, A, "getLocalePrefix", 0, u, "getLocalizedTemplate", 0, W, "getSortedPathnames", 0, g, "hasPathnamePrefixed", 0, function(l, e) {
        return e === l || e.startsWith(`${l}/`)
    }, "isLocalizableHref", 0, d, "isPromise", 0, function(l) {
        return "function" == typeof l.then
    }, "matchesPathname", 0, c, "normalizeTrailingSlash", 0, R, "prefixPathname", 0, t, "unprefixPathname", 0, function(l, e) {
        return l.replace(RegExp(`^${e}`), "") || "/"
    }], 817558), l.s(["applyPathnamePrefix", 0, function(l, e, Z, V) {
        let b, {
            mode: n
        } = Z.localePrefix;
        if (void 0 !== V) b = V;
        else if (d(l)) {
            let l = Z.domains?.find(l => l.locales.includes(e)),
                V = l?.localePrefix || n;
            "always" === V ? b = !0 : "as-needed" === V && (b = l ? e !== l.defaultLocale : e !== Z.defaultLocale)
        }
        return b ? t(u(e, Z.localePrefix), l) : l
    }, "compileLocalizedPathname", 0, function(l) {
        let {
            pathname: e,
            locale: Z,
            params: V,
            pathnames: b,
            query: n
        } = l;

        function d(l) {
            let e, d = b[l];
            return d ? (e = W(d, Z, l), V && Object.entries(V).forEach(l => {
                let Z, V, [b, n] = l;
                Array.isArray(n) ? (Z = `(\\[)?\\[...${b}\\](\\])?`, V = n.map(l => String(l)).join("/")) : (Z = `\\[${b}\\]`, V = String(n)), e = e.replace(RegExp(Z, "g"), V)
            }), e = new URL(e = e.replace(/\[\[\.\.\..+\]\]/g, ""), "http://l").pathname) : e = l, e = R(e), n && (e += i(n)), e
        }
        if ("string" == typeof e) return d(e);
        {
            let {
                pathname: l,
                ...Z
            } = e;
            return {
                ...Z,
                pathname: d(l)
            }
        }
    }, "getBasePath", 0, X, "getRoute", 0, function(l, e, Z) {
        let V = g(Object.keys(Z)),
            b = decodeURI(e);
        for (let e of V) {
            let V = Z[e];
            if ("string" == typeof V) {
                if (c(V, b)) return e
            } else if (c(W(V, l, e), b)) return e
        }
        return e
    }, "normalizeNameOrNameWithParams", 0, function(l) {
        return "string" == typeof l ? {
            pathname: l
        } : l
    }, "serializeSearchParams", 0, i], 840154), l.s(["default", 0, r], 180549);
    var h = l.i(19836),
        s = (0, V.forwardRef)(function(l, V) {
            let {
                href: n,
                locale: d,
                localeCookie: t,
                onClick: W,
                prefetch: R,
                ...c
            } = l, u = (0, b.useLocale)(), A = null != d && d !== u, a = (0, Z.usePathname)();
            return A && (R = !1), (0, h.jsx)(e.default, {
                ref: V,
                href: n,
                hrefLang: A ? d : void 0,
                onClick: function(l) {
                    r(t, a, u, d), W && W(l)
                },
                prefetch: R,
                ...c
            })
        });
    l.s(["default", 0, s], 244447)
}, 895832, l => {
    "use strict";
    var e = l.i(745911),
        Z = l.i(19836);
    l.s(["default", 0, function(l) {
        let {
            locale: V,
            ...b
        } = l;
        if (!V) throw Error(void 0);
        return (0, Z.jsx)(e.IntlProvider, {
            locale: V,
            ...b
        })
    }])
}, 949610, 89716, 700781, l => {
    "use strict";
    l.i(778365);
    var e = l.i(860430),
        Z = l.i(84523),
        V = l.i(675618);
    let b = (0, e.fileDesc)("Ch9ldmVudC9ldmVudF9maWVsZF9vcHRpb25zLnByb3RvEgVldmVudCIlCgtKc29uT3B0aW9ucxIWCg5wYXJhbWV0ZXJfbmFtZRgBIAEoCSI6CgxGcm9zdE9wdGlvbnMSFAoMaXNfdHRsX2ZpZWxkGAEgASgIEhQKDGlzX3RpbWVzdGFtcBgCIAEoCCIjCgtTaW5rT3B0aW9ucxIUCgxpc19rZXlfZmllbGQYASABKAgiKQoQRXZlbnRNZXRhT3B0aW9ucxIVCg1pc19ldmVudF90aW1lGAEgASgIIskFCg5BdWdtZW50T3B0aW9ucxIcChRkZXJpdmVfdXNlcl9rZXlfZnJvbRgBIAEoCRIhChhhZGRfYWNjb3VudF9jb3VudHJ5X2NvZGUY7wcgASgIEhgKD2FkZF9hZ2VfYnJhY2tldBjrByABKAgSIAoXYWRkX2FwcGxpY2FibGVfcG9saWNpZXMY8QcgASgIEh0KFGFkZF9hcHBsaWNhdGlvbl9uYW1lGPcHIAEoCBIcChNhZGRfYXV0aF9zZXNzaW9uX2lkGPgHIAEoCBIiChlhZGRfYXV0aGVudGljYXRlZF91c2VyX2lkGOwHIAEoCBIjChphZGRfYXV0aGVudGljYXRlZF91c2VyX2tleRj1ByABKAgSHwoWYWRkX2Jyb3dzZXJfdHJhY2tlcl9pZBjqByABKAgSJQocYWRkX2Vudmlyb25tZW50X2FiYnJldmlhdGlvbhjwByABKAgSGQoQYWRkX2V2ZW50X3RhcmdldBjRDyABKAgSFwoOYWRkX2V2ZW50X3R5cGUY0g8gASgIEh0KFGFkZF9odHRwX2ZpbmdlcnByaW50GPkHIAEoCBIaChFhZGRfcGxhdGZvcm1fdHlwZRjpByABKAgSHQoUYWRkX3BsYXRmb3JtX3R5cGVfaWQY/AcgASgIEhAKB2FkZF9yY2MY9gcgASgIEiEKGGFkZF9yZXF1ZXN0X2NvdW50cnlfY29kZRjuByABKAgSFwoOYWRkX3JlcXVlc3RfaXAY7QcgASgIEiEKGGFkZF90ZW5jZW50X2FjY2Vzc190b2tlbhjzByABKAgSHAoTYWRkX3RlbmNlbnRfb3Blbl9pZBjyByABKAgSHAoTYWRkX3Rsc19maW5nZXJwcmludBj6ByABKAgSFwoOYWRkX3VzZXJfYWdlbnQY9AcgASgIEhgKD2FkZF91c2VyX29yaWdpbhj7ByABKAgiSgoKUElJT3B0aW9ucxISCgppc191c2VyX2lkGAEgASgIEhMKC2lzX3VzZXJfa2V5GAMgASgIEhMKC3BvbGljeV90YWdzGAIgAygJIkYKFENvbXBhdGliaWxpdHlPcHRpb25zEhcKD2lzX2V2ZW50X3RhcmdldBgBIAEoCBIVCg1pc19ldmVudF90eXBlGAIgASgIIk4KGkZyb3N0RmVhdHVyZUxvZ2dpbmdPcHRpb25zEhcKD3JlZ2lzdGVyZWRfbmFtZRgBIAEoCRIXCg9mZWF0dXJlX3NlcnZpY2UYAiABKAkiSAoaRnJvc3RGZWF0dXJlU2VydmljZU9wdGlvbnMSFAoMZmVhdHVyZV92aWV3GAEgASgJEhQKDGZlYXR1cmVfbmFtZRgCIAEoCTpMCgRtZXRhEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjhpxIgASgLMhcuZXZlbnQuRXZlbnRNZXRhT3B0aW9uc1IEbWV0YTpQCgdhdWdtZW50Eh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjipxIgASgLMhUuZXZlbnQuQXVnbWVudE9wdGlvbnNSB2F1Z21lbnQ6RAoDcGlpEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjjpxIgASgLMhEuZXZlbnQuUElJT3B0aW9uc1IDcGlpOkcKBGpzb24SHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOSnEiABKAsyEi5ldmVudC5Kc29uT3B0aW9uc1IEanNvbjpHCgRzaW5rEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjlpxIgASgLMhIuZXZlbnQuU2lua09wdGlvbnNSBHNpbms6SgoFZnJvc3QSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOanEiABKAsyEy5ldmVudC5Gcm9zdE9wdGlvbnNSBWZyb3N0OmIKDWNvbXBhdGliaWxpdHkSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOenEiABKAsyGy5ldmVudC5Db21wYXRpYmlsaXR5T3B0aW9uc1INY29tcGF0aWJpbGl0eTp2ChVmcm9zdF9mZWF0dXJlX2xvZ2dpbmcSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOinEiABKAsyIS5ldmVudC5Gcm9zdEZlYXR1cmVMb2dnaW5nT3B0aW9uc1ITZnJvc3RGZWF0dXJlTG9nZ2luZzp2ChVmcm9zdF9mZWF0dXJlX3NlcnZpY2USHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOmnEiABKAsyIS5ldmVudC5Gcm9zdEZlYXR1cmVTZXJ2aWNlT3B0aW9uc1ITZnJvc3RGZWF0dXJlU2VydmljZUI9Wi5naXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50ogIKTk9UX0lOX1VTRWIGcHJvdG8z", [V.file_google_protobuf_descriptor]);
    l.s(["file_event_event_field_options", 0, b], 949610), l.i(649464);
    let n = (0, e.fileDesc)("CjFldmVudHN0cmVhbS9jb3JlL2hpdmVfdGFibGVfbWVzc2FnZV9vcHRpb25zLnByb3RvEhBldmVudHN0cmVhbS5jb3JlIuoBChBIaXZlVGFibGVPcHRpb25zEg4KBnNjaGVtYRgBIAEoCRIMCgRuYW1lGAIgASgJEjEKBHR5cGUYAyABKA4yHy5ldmVudHN0cmVhbS5jb3JlLkhpdmVUYWJsZVR5cGVCAhgBEhcKD3BhcnRpdGlvbl9vcmRlchgEIAEoCRIpCiFyZXRlbnRpb25fb2Zfd2FybV9zdG9yYWdlX2luX2RheXMYBSABKAMSKQohcmV0ZW50aW9uX29mX2NvbGRfc3RvcmFnZV9pbl9kYXlzGAYgASgDEhYKDmRhdGFfbGFrZV9uYW1lGAcgASgJIo4CCgxLYWZrYU9wdGlvbnMSFgoObnVtX3BhcnRpdGlvbnMYASABKAUSHgoWbnVtX3BhcnRpdGlvbnNfc3RhZ2luZxgCIAEoBRIcChRwYXJ0aXRpb25fa2V5X2ZpZWxkcxgDIAMoCRIfChdvbWl0X3NjaGVtYV9yZWdpc3RyeV9pZBgEIAEoCBIyCgtjb21wcmVzc2lvbhgFIAEoDjIdLmV2ZW50c3RyZWFtLmNvcmUuQ29tcHJlc3Npb24SFgoOcWFhc19uYW1lc3BhY2UYBiABKAkSHQoVYWxsb3dfdW5zYWZlX2RlbGl2ZXJ5GAcgASgIEhwKFGFsbG93ZWRfaW5fdHJheV9tb2RlGAggASgIInsKEURhdGFWb2x1bWVPcHRpb25zEiQKHGV4cGVjdGVkX3BlYWtfZXZlbnRzX3Blcl9zZWMYASABKAMSKwojZXhwZWN0ZWRfbWF4X3NpemVfb2ZfZXZlbnRfaW5fYnl0ZXMYAiABKAMSEwoLc2FtcGxlX3JhdGUYAyABKAIizAIKEERhdGFNb2RlbE9wdGlvbnMSLQoJZGF0YV90aWVyGAEgASgOMhouZXZlbnRzdHJlYW0uY29yZS5EYXRhVGllchISCgZvd25lcnMYAiADKAlCAhgBEhgKDG9uY2FsbF90ZWFtcxgDIAMoCUICGAESGgoScHJvZHVjZXJfYXBwX25hbWVzGAQgAygJEhoKEmNvbnN1bWVyX2FwcF9uYW1lcxgFIAMoCRIcChRhZ2dyZWdhdGVfZGltZW5zaW9ucxgGIAMoCRImCgVvd25lchgHIAEoCzIXLmV2ZW50c3RyZWFtLmNvcmUuT3duZXISFgoOc2xhY2tfY2hhbm5lbHMYCCADKAkSGgoScGFnZXJkdXR5X3NlcnZpY2VzGAkgAygJEg4KBmVtYWlscxgKIAMoCRIZChFwb2ludHNfb2ZfY29udGFjdBgLIAMoCSKvBAoLRXZlbnRTY2hlbWESEwoLc2NoZW1hX25hbWUYASABKAkSMAoLZXZlbnRfdHlwZXMYAiADKAsyGy5ldmVudHN0cmVhbS5jb3JlLkV2ZW50VHlwZRIzCg1lYWFzX2VudGl0aWVzGAcgAygLMhwuZXZlbnRzdHJlYW0uY29yZS5FYWFzRW50aXR5EjgKD2RhdGFiYXNlX3RhYmxlcxgIIAMoCzIfLmV2ZW50c3RyZWFtLmNvcmUuRGF0YWJhc2VUYWJsZRJHChBzaW5rX2Rlc3RpbmF0aW9uGAMgASgOMi0uZXZlbnRzdHJlYW0uY29yZS5FdmVudFNjaGVtYS5TaW5rRGVzdGluYXRpb24SMQoJZGF0YV90aWVyGAQgASgOMhouZXZlbnRzdHJlYW0uY29yZS5EYXRhVGllckICGAESEQoFb3duZXIYBSABKAlCAhgBEhMKC2thZmthX3RvcGljGAYgASgJIsUBCg9TaW5rRGVzdGluYXRpb24SCAoETk9ORRAAEhUKDUZJUkVIT1NFX09OTFkQARoCCAESEgoKS0FGS0FfT05MWRACGgIIARIaChJGSVJFSE9TRV9BTkRfS0FGS0EQAxoCCAESIwobRklSRUhPU0VfQU5EX0tBRktBX0FORF9RQUFTEAQaAggBEhYKDktBRktBX0FORF9RQUFTEAUaAggBEg0KCVFBQVNfT05MWRAGEhUKEUZJUkVIT1NFX0FORF9RQUFTEAcisQIKCUV2ZW50VHlwZRIOCgZ0YXJnZXQYASABKAkSDAoEbmFtZRgCIAEoCRJLChBmaWVsZFJlZ2V4RmlsdGVyGAMgAygLMjEuZXZlbnRzdHJlYW0uY29yZS5FdmVudFR5cGUuRmllbGRSZWdleEZpbHRlckVudHJ5EkAKDWNvbXBhdGliaWxpdHkYBCABKA4yKS5ldmVudHN0cmVhbS5jb3JlLkV2ZW50VHlwZS5Db21wYXRpYmlsaXR5GjcKFUZpZWxkUmVnZXhGaWx0ZXJFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAk6AjgBIj4KDUNvbXBhdGliaWxpdHkSCwoHREVGQVVMVBAAEiAKHERVQUxfV1JJVEVfVE9fRVZFTlRTX1BBUlFVRVQQASI8CgpFYWFzRW50aXR5EhgKEGZ1bGxfZW50aXR5X25hbWUYASABKAkSFAoMZW50aXR5X2dyb3VwGAIgASgJIlEKDURhdGFiYXNlVGFibGUSFQoNZGF0YWJhc2VfbmFtZRgBIAEoCRISCgp0YWJsZV9uYW1lGAIgASgJEhUKDWRhdGFiYXNlX3R5cGUYAyABKAkiXAoFT3duZXISCwoDb3JnGAEgASgJEgwKBHRlYW0YAiABKAkSEAoDcG9kGAMgASgJSACIAQESEwoGcm9zX2lkGAQgASgDSAGIAQFCBgoEX3BvZEIJCgdfcm9zX2lkIqQBCgtBdXRoT3B0aW9ucxI+CgxhdXRoX21ldGhvZHMYASADKA4yKC5ldmVudHN0cmVhbS5jb3JlLkF1dGhPcHRpb25zLkF1dGhNZXRob2QiVQoKQXV0aE1ldGhvZBILCgdOT19BVVRIEAASDAoISU5URVJOQUwQARIHCgNSQ0MQAhIWChJBVVRIRU5USUNBVEVEX1VTRVIQAxILCgdBUElfS0VZEAQinAIKC0dkcHJPcHRpb25zEjkKA3BpaRgBIAEoDjInLmV2ZW50c3RyZWFtLmNvcmUuR2Rwck9wdGlvbnMuUGlpTWV0aG9kSACIAQESIQoUY2RjX2FyY2hpdmVyX2VuYWJsZWQYAiABKAhIAYgBASKNAQoJUGlpTWV0aG9kEhEKDVNFVF9VU0VSX0tFWVMQABIQCgxTRVRfVVNFUl9JRFMQARI4CjRCUkVBS19HRFBSX0NPTVBMSUFOQ0VfQU5EX1NFVF9CT1RIX1VTRVJfSURTX0FORF9LRVlTEAISIQodU0VUX05FSVRIRVJfVVNFUl9LRVlTX05PUl9JRFMQA0IGCgRfcGlpQhcKFV9jZGNfYXJjaGl2ZXJfZW5hYmxlZCpACg1IaXZlVGFibGVUeXBlEgsKB1VOS05PV04QABIOCgpXV1dfTEVHQUNZEAESEgoORVZFTlRTVFJFQU1fVjEQAiojCgtDb21wcmVzc2lvbhIICgROT05FEAASCgoGU05BUFBZEAEqVwoIRGF0YVRpZXISEAoMVElFUl9ERUZBVUxUEAASDQoJVElFUl9aRVJPEAESDAoIVElFUl9PTkUQAhIMCghUSUVSX1RXTxADEg4KClRJRVJfVEhSRUUQBDpbCgV0YWJsZRIfLmdvb2dsZS5wcm90b2J1Zi5NZXNzYWdlT3B0aW9ucxjJrxIgASgLMiIuZXZlbnRzdHJlYW0uY29yZS5IaXZlVGFibGVPcHRpb25zUgV0YWJsZTpXCgVrYWZrYRIfLmdvb2dsZS5wcm90b2J1Zi5NZXNzYWdlT3B0aW9ucxjKrxIgASgLMh4uZXZlbnRzdHJlYW0uY29yZS5LYWZrYU9wdGlvbnNSBWthZmthOmcKC2RhdGFfdm9sdW1lEh8uZ29vZ2xlLnByb3RvYnVmLk1lc3NhZ2VPcHRpb25zGMuvEiABKAsyIy5ldmVudHN0cmVhbS5jb3JlLkRhdGFWb2x1bWVPcHRpb25zUgpkYXRhVm9sdW1lOmQKCmRhdGFfbW9kZWwSHy5nb29nbGUucHJvdG9idWYuTWVzc2FnZU9wdGlvbnMYzK8SIAEoCzIiLmV2ZW50c3RyZWFtLmNvcmUuRGF0YU1vZGVsT3B0aW9uc1IJZGF0YU1vZGVsOmcKDnNjaGVtYV9tYXBwaW5nEh8uZ29vZ2xlLnByb3RvYnVmLk1lc3NhZ2VPcHRpb25zGM2vEiABKAsyHS5ldmVudHN0cmVhbS5jb3JlLkV2ZW50U2NoZW1hUg1zY2hlbWFNYXBwaW5nOlQKBGF1dGgSHy5nb29nbGUucHJvdG9idWYuTWVzc2FnZU9wdGlvbnMYzq8SIAEoCzIdLmV2ZW50c3RyZWFtLmNvcmUuQXV0aE9wdGlvbnNSBGF1dGg6VAoEZ2RwchIfLmdvb2dsZS5wcm90b2J1Zi5NZXNzYWdlT3B0aW9ucxjPrxIgASgLMh0uZXZlbnRzdHJlYW0uY29yZS5HZHByT3B0aW9uc1IEZ2RwckI7WjlnaXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL2NvcmViBnByb3RvMw", [V.file_google_protobuf_descriptor]);
    l.s(["file_eventstream_core_hive_table_message_options", 0, n], 89716);
    let d = (0, e.fileDesc)("ChpldmVudC93ZWJfZXZlbnRfYmFzZS5wcm90bxIFZXZlbnQitQEKDFdlYkV2ZW50QmFzZRIeCgdwYWdlX2lkGAEgASgJQg2ivpIBCAoGcGFnZUlkEiMKDHJlZmVycmVyX3VybBgCIAEoCUINor6SAQgKBnJlZnVybBIeCgpzZXNzaW9uX2lkGAMgASgJQgqivpIBBQoDc2lkEhwKCGd1ZXN0X2lkGAQgASgDQgqivpIBBQoDZ2lkEiIKD2xvY2FsX3RpbWVzdGFtcBgFIAEoCUIJor6SAQQKAmx0QjBaLmdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRiBnByb3RvMw", [b]),
        t = (0, Z.messageDesc)(d, 0);
    l.s(["WebEventBaseSchema", 0, t], 700781)
}, 942060, l => {
    "use strict";
    var e = l.i(343549),
        Z = l.i(683740),
        V = l.i(734899),
        b = l.i(860430),
        n = l.i(84523),
        d = l.i(949610);
    let t = (0, b.fileDesc)("Cj1ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9hdHRyaWJ1dGVzLnByb3RvEhtldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnki4wsKGUVuZ2luZVRlbGVtZXRyeUF0dHJpYnV0ZXMSfQoQaW50MzJfYXR0cmlidXRlcxgBIAMoCzJLLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlBdHRyaWJ1dGVzLkludDMyQXR0cmlidXRlc0VudHJ5QhaivpIBEQoPaW50MzJBdHRyaWJ1dGVzEn0KEGludDY0X2F0dHJpYnV0ZXMYAiADKAsySy5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5QXR0cmlidXRlcy5JbnQ2NEF0dHJpYnV0ZXNFbnRyeUIWor6SAREKD2ludDY0QXR0cmlidXRlcxKAAQoRdWludDMyX2F0dHJpYnV0ZXMYAyADKAsyTC5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5QXR0cmlidXRlcy5VaW50MzJBdHRyaWJ1dGVzRW50cnlCF6K+kgESChB1aW50MzJBdHRyaWJ1dGVzEoABChF1aW50NjRfYXR0cmlidXRlcxgEIAMoCzJMLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlBdHRyaWJ1dGVzLlVpbnQ2NEF0dHJpYnV0ZXNFbnRyeUIXor6SARIKEHVpbnQ2NEF0dHJpYnV0ZXMSgAEKEXN0cmluZ19hdHRyaWJ1dGVzGAUgAygLMkwuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeUF0dHJpYnV0ZXMuU3RyaW5nQXR0cmlidXRlc0VudHJ5QheivpIBEgoQc3RyaW5nQXR0cmlidXRlcxJ6Cg9ib29sX2F0dHJpYnV0ZXMYBiADKAsySi5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5QXR0cmlidXRlcy5Cb29sQXR0cmlidXRlc0VudHJ5QhWivpIBEAoOYm9vbEF0dHJpYnV0ZXMSfQoQZmxvYXRfYXR0cmlidXRlcxgHIAMoCzJLLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlBdHRyaWJ1dGVzLkZsb2F0QXR0cmlidXRlc0VudHJ5QhaivpIBEQoPZmxvYXRBdHRyaWJ1dGVzEoABChFkb3VibGVfYXR0cmlidXRlcxgIIAMoCzJMLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlBdHRyaWJ1dGVzLkRvdWJsZUF0dHJpYnV0ZXNFbnRyeUIXor6SARIKEGRvdWJsZUF0dHJpYnV0ZXMaNgoUSW50MzJBdHRyaWJ1dGVzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgFOgI4ARo2ChRJbnQ2NEF0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAM6AjgBGjcKFVVpbnQzMkF0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKA06AjgBGjcKFVVpbnQ2NEF0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAQ6AjgBGjcKFVN0cmluZ0F0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAk6AjgBGjUKE0Jvb2xBdHRyaWJ1dGVzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgIOgI4ARo2ChRGbG9hdEF0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAI6AjgBGjcKFURvdWJsZUF0dHJpYnV0ZXNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAE6AjgBQkZaRGdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vZW5naW5ldGVsZW1ldHJ5YgZwcm90bzM", [d.file_event_event_field_options]),
        W = (0, n.messageDesc)(t, 0);
    var R = l.i(89716);
    let c = (0, b.fileDesc)("Ck5ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV9yZXBsYXlfaW5mb3JtYXRpb24ucHJvdG8SJGV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5tZXRhZGF0YSKcAQogRW5naW5lVGVsZW1ldHJ5UmVwbGF5SW5mb3JtYXRpb24SJwoJaXNfcmVwbGF5GAEgASgIQg+ivpIBCgoIaXNSZXBsYXlIAIgBARIvCg1wcm9kdWNlcl9uYW1lGAIgASgJQhOivpIBDgoMcHJvZHVjZXJOYW1lSAGIAQFCDAoKX2lzX3JlcGxheUIQCg5fcHJvZHVjZXJfbmFtZUJPWk1naXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL2VuZ2luZXRlbGVtZXRyeS9tZXRhZGF0YWIGcHJvdG8z", [d.file_event_event_field_options]),
        u = (0, b.fileDesc)("CkxldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV91c2VyX2luZm9ybWF0aW9uLnByb3RvEiRldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEi0AEKHkVuZ2luZVRlbGVtZXRyeVVzZXJJbmZvcm1hdGlvbhIvCgd1c2VyX2lkGAEgASgDQhmSvpIBA+A+AZq+kgECCAGivpIBBQoDdWlkSACIAQESJgoIdXNlcl9rZXkYAiABKAlCD5K+kgEDqD8Bmr6SAQIYAUgBiAEBEicKEHBsYXRmb3JtX3R5cGVfaWQYAyABKANCCJK+kgED4D8BSAKIAQFCCgoIX3VzZXJfaWRCCwoJX3VzZXJfa2V5QhMKEV9wbGF0Zm9ybV90eXBlX2lkQk9aTWdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vZW5naW5ldGVsZW1ldHJ5L21ldGFkYXRhYgZwcm90bzM", [d.file_event_event_field_options]),
        A = (0, b.fileDesc)("Ck9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV9yZWxlYXNlX2luZm9ybWF0aW9uLnByb3RvEiRldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEixwIKIUVuZ2luZVRlbGVtZXRyeVJlbGVhc2VJbmZvcm1hdGlvbhIcCg90YWdfYXBwbGljYXRpb24YASABKAlIAIgBARIYCgt0YWdfb3NfdHlwZRgCIAEoCUgBiAEBEhgKC3RhZ19vc19uYW1lGAMgASgJSAKIAQESHAoPdGFnX2FwcF92ZXJzaW9uGAQgASgJSAOIAQESGAoLdGFnX2NoYW5uZWwYBSABKAlIBIgBARIkChd0YWdfZGV2aWNlX21lbW9yeV9pbl9tYhgGIAEoA0gFiAEBQhIKEF90YWdfYXBwbGljYXRpb25CDgoMX3RhZ19vc190eXBlQg4KDF90YWdfb3NfbmFtZUISChBfdGFnX2FwcF92ZXJzaW9uQg4KDF90YWdfY2hhbm5lbEIaChhfdGFnX2RldmljZV9tZW1vcnlfaW5fbWJCT1pNZ2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGFiBnByb3RvMw"),
        a = (0, b.fileDesc)("ClVldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV9yb2xsb3V0X2ZsYWdzX2luZm9ybWF0aW9uLnByb3RvEiRldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEibAomRW5naW5lVGVsZW1ldHJ5Um9sbG91dEZsYWdzSW5mb3JtYXRpb24SIAoYcm9sbG91dF9mbGFnc19pbl92YXJpYW50GAEgAygJEiAKGHJvbGxvdXRfZmxhZ3NfaW5fY29udHJvbBgCIAMoCUJPWk1naXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL2VuZ2luZXRlbGVtZXRyeS9tZXRhZGF0YWIGcHJvdG8z"),
        m = (0, b.fileDesc)("CkpldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV9iYXRjaF9jaGVja3N1bS5wcm90bxIkZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhIl4KHEVuZ2luZVRlbGVtZXRyeUJhdGNoQ2hlY2tzdW0SFAoHdmVyc2lvbhgBIAEoA0gAiAEBEhIKBXZhbHVlGAIgASgESAGIAQFCCgoIX3ZlcnNpb25CCAoGX3ZhbHVlQk9aTWdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vZW5naW5ldGVsZW1ldHJ5L21ldGFkYXRhYgZwcm90bzM"),
        G = (0, b.fileDesc)("CkRldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvbWV0YWRhdGEvZW5naW5lX3RlbGVtZXRyeV9tZXRhZGF0YS5wcm90bxIkZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhIp4FChdFbmdpbmVUZWxlbWV0cnlNZXRhZGF0YRJnChJyZXBsYXlfaW5mb3JtYXRpb24YASABKAsyRi5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEuRW5naW5lVGVsZW1ldHJ5UmVwbGF5SW5mb3JtYXRpb25IAIgBARJjChB1c2VyX2luZm9ybWF0aW9uGAIgASgLMkQuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhLkVuZ2luZVRlbGVtZXRyeVVzZXJJbmZvcm1hdGlvbkgBiAEBEmkKE3JlbGVhc2VfaW5mb3JtYXRpb24YAyABKAsyRy5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEuRW5naW5lVGVsZW1ldHJ5UmVsZWFzZUluZm9ybWF0aW9uSAKIAQESdAoZcm9sbG91dF9mbGFnc19pbmZvcm1hdGlvbhgEIAEoCzJMLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5tZXRhZGF0YS5FbmdpbmVUZWxlbWV0cnlSb2xsb3V0RmxhZ3NJbmZvcm1hdGlvbkgDiAEBEl8KDmJhdGNoX2NoZWNrc3VtGAUgASgLMkIuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhLkVuZ2luZVRlbGVtZXRyeUJhdGNoQ2hlY2tzdW1IBIgBAUIVChNfcmVwbGF5X2luZm9ybWF0aW9uQhMKEV91c2VyX2luZm9ybWF0aW9uQhYKFF9yZWxlYXNlX2luZm9ybWF0aW9uQhwKGl9yb2xsb3V0X2ZsYWdzX2luZm9ybWF0aW9uQhEKD19iYXRjaF9jaGVja3N1bUJPWk1naXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL2VuZ2luZXRlbGVtZXRyeS9tZXRhZGF0YWIGcHJvdG8z", [d.file_event_event_field_options, c, u, A, a, m]),
        o = (0, b.fileDesc)("Cj1ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9wb2ludF90YWdzLnByb3RvEhtldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkilgoKGEVuZ2luZVRlbGVtZXRyeVBvaW50VGFncxJqCgppbnQzMl90YWdzGAEgAygLMkQuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50VGFncy5JbnQzMlRhZ3NFbnRyeUIQor6SAQsKCWludDMyVGFncxJqCgppbnQ2NF90YWdzGAIgAygLMkQuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50VGFncy5JbnQ2NFRhZ3NFbnRyeUIQor6SAQsKCWludDY0VGFncxJtCgt1aW50MzJfdGFncxgDIAMoCzJFLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlQb2ludFRhZ3MuVWludDMyVGFnc0VudHJ5QhGivpIBDAoKdWludDMyVGFncxJtCgt1aW50NjRfdGFncxgEIAMoCzJFLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlQb2ludFRhZ3MuVWludDY0VGFnc0VudHJ5QhGivpIBDAoKdWludDY0VGFncxJtCgtzdHJpbmdfdGFncxgFIAMoCzJFLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlQb2ludFRhZ3MuU3RyaW5nVGFnc0VudHJ5QhGivpIBDAoKc3RyaW5nVGFncxJnCglib29sX3RhZ3MYBiADKAsyQy5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5UG9pbnRUYWdzLkJvb2xUYWdzRW50cnlCD6K+kgEKCghib29sVGFncxJqCgpmbG9hdF90YWdzGAcgAygLMkQuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50VGFncy5GbG9hdFRhZ3NFbnRyeUIQor6SAQsKCWZsb2F0VGFncxJtCgtkb3VibGVfdGFncxgIIAMoCzJFLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlQb2ludFRhZ3MuRG91YmxlVGFnc0VudHJ5QhGivpIBDAoKZG91YmxlVGFncxowCg5JbnQzMlRhZ3NFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAU6AjgBGjAKDkludDY0VGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoAzoCOAEaMQoPVWludDMyVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoDToCOAEaMQoPVWludDY0VGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoBDoCOAEaMQoPU3RyaW5nVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCToCOAEaLwoNQm9vbFRhZ3NFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAg6AjgBGjAKDkZsb2F0VGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoAjoCOAEaMQoPRG91YmxlVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoAToCOAFCRlpEZ2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnliBnByb3RvMw", [d.file_event_event_field_options]),
        g = (0, b.fileDesc)("Cj9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9wb2ludF9maWVsZHMucHJvdG8SG2V2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeSLoCgoaRW5naW5lVGVsZW1ldHJ5UG9pbnRGaWVsZHMScgoMaW50MzJfZmllbGRzGAEgAygLMkguZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzLkludDMyRmllbGRzRW50cnlCEqK+kgENCgtpbnQzMkZpZWxkcxJyCgxpbnQ2NF9maWVsZHMYAiADKAsySC5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5UG9pbnRGaWVsZHMuSW50NjRGaWVsZHNFbnRyeUISor6SAQ0KC2ludDY0RmllbGRzEnUKDXVpbnQzMl9maWVsZHMYAyADKAsySS5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5UG9pbnRGaWVsZHMuVWludDMyRmllbGRzRW50cnlCE6K+kgEOCgx1aW50MzJGaWVsZHMSdQoNdWludDY0X2ZpZWxkcxgEIAMoCzJJLmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlQb2ludEZpZWxkcy5VaW50NjRGaWVsZHNFbnRyeUITor6SAQ4KDHVpbnQ2NEZpZWxkcxJ1Cg1zdHJpbmdfZmllbGRzGAUgAygLMkkuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzLlN0cmluZ0ZpZWxkc0VudHJ5QhOivpIBDgoMc3RyaW5nRmllbGRzEm8KC2Jvb2xfZmllbGRzGAYgAygLMkcuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzLkJvb2xGaWVsZHNFbnRyeUIRor6SAQwKCmJvb2xGaWVsZHMScgoMZmxvYXRfZmllbGRzGAcgAygLMkguZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzLkZsb2F0RmllbGRzRW50cnlCEqK+kgENCgtmbG9hdEZpZWxkcxJ1Cg1kb3VibGVfZmllbGRzGAggAygLMkkuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzLkRvdWJsZUZpZWxkc0VudHJ5QhOivpIBDgoMZG91YmxlRmllbGRzGjIKEEludDMyRmllbGRzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgFOgI4ARoyChBJbnQ2NEZpZWxkc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoAzoCOAEaMwoRVWludDMyRmllbGRzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgNOgI4ARozChFVaW50NjRGaWVsZHNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAQ6AjgBGjMKEVN0cmluZ0ZpZWxkc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCToCOAEaMQoPQm9vbEZpZWxkc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCDoCOAEaMgoQRmxvYXRGaWVsZHNFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAI6AjgBGjMKEURvdWJsZUZpZWxkc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoAToCOAFCRlpEZ2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnliBnByb3RvMw", [d.file_event_event_field_options]),
        i = (0, b.fileDesc)("Cj5ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9wb2ludF9ldmVudC5wcm90bxIbZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5IuAHChlFbmdpbmVUZWxlbWV0cnlQb2ludEV2ZW50Eh4KBG5hbWUYASABKAlCC6K+kgEGCgRuYW1lSACIAQESHgoEbXVsdBgCIAEoAUILor6SAQYKBG11bHRIAYgBARJKChtldmVudF90aW1lc3RhbXBfbWlsbGlzZWNvbmQYAyABKANCIKK+kgEbChlldmVudFRpbWVzdGFtcE1pbGxpc2Vjb25kSAKIAQESMwodaW5nZXN0X3RpbWVzdGFtcF9taWxsaXNlY29uZHMYBCABKANCB4q+kgECCAFIA4gBARJQCgR0YWdzGAUgASgLMjUuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50VGFnc0ILor6SAQYKBHRhZ3MSVgoGZmllbGRzGAYgASgLMjcuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RmllbGRzQg2ivpIBCAoGZmllbGRzEmAKCG1ldGFkYXRhGAcgASgLMj0uZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhLkVuZ2luZVRlbGVtZXRyeU1ldGFkYXRhQg+ivpIBCgoIbWV0YWRhdGE6oQPS/JIBFQj0AzIQZW5naW5lLXRlbGVtZXRyedr8kgEHCIgnENCGA+L8kgGFAQgDGhBlbmdpbmUtdGVsZW1ldHJ5IgtnYW1lLWVuZ2luZSogZW5naW5lLXRlbGVtZXRyeS1wb2ludC1wcm9jZXNzb3I6LQoGRW5naW5lEgxQcm9kdWN0aXZpdHkaElByb2R1Y3Rpdml0eSBUb29scyCfEEIRI2VuZ2luZS10ZWxlbWV0cnnq/JIB6gESLAoPZW5naW5ldGVsZW1ldHJ5EhlFbmdpbmVUZWxlbWV0cnlQb2ludEV2ZW50EiAKA1JDQxIZRW5naW5lVGVsZW1ldHJ5UG9pbnRFdmVudBIjCgZjbGllbnQSGUVuZ2luZVRlbGVtZXRyeVBvaW50RXZlbnQSIwoGc3R1ZGlvEhlFbmdpbmVUZWxlbWV0cnlQb2ludEV2ZW50EiIKBW90aGVyEhlFbmdpbmVUZWxlbWV0cnlQb2ludEV2ZW50GAYqKGVuZ2luZSA+IHN5c3RlbXMgPiBlbmdpbmUgaW5mcmFzdHJ1Y3R1cmVCBwoFX25hbWVCBwoFX211bHRCHgocX2V2ZW50X3RpbWVzdGFtcF9taWxsaXNlY29uZEIgCh5faW5nZXN0X3RpbWVzdGFtcF9taWxsaXNlY29uZHNCRlpEZ2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnliBnByb3RvMw", [d.file_event_event_field_options, R.file_eventstream_core_hive_table_message_options, o, g, G]),
        X = (0, b.fileDesc)("CkdldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9jb3VudGVyX21ldHJpY19ldmVudC5wcm90bxIbZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5IowICiFFbmdpbmVUZWxlbWV0cnlDb3VudGVyTWV0cmljRXZlbnQSHgoEbmFtZRgBIAEoCUILor6SAQYKBG5hbWVIAIgBARIgCgV2YWx1ZRgCIAEoAUIMor6SAQcKBXZhbHVlSAGIAQESSgobZXZlbnRfdGltZXN0YW1wX21pbGxpc2Vjb25kGAMgASgDQiCivpIBGwoZZXZlbnRUaW1lc3RhbXBNaWxsaXNlY29uZEgCiAEBEjMKHWluZ2VzdF90aW1lc3RhbXBfbWlsbGlzZWNvbmRzGAQgASgDQgeKvpIBAggBSAOIAQESXQoKYXR0cmlidXRlcxgFIAEoCzI2LmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlBdHRyaWJ1dGVzQhGivpIBDAoKYXR0cmlidXRlcxJgCghtZXRhZGF0YRgGIAEoCzI9LmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5tZXRhZGF0YS5FbmdpbmVUZWxlbWV0cnlNZXRhZGF0YUIPor6SAQoKCG1ldGFkYXRhEiwKC3NhbXBsZV9yYXRlGAcgASgBQhKivpIBDQoLc2FtcGxlX3JhdGVIBIgBATrPA9L8kgEXCPQDEAQyEGVuZ2luZS10ZWxlbWV0cnna/JIBBwjQhgMQ6Afi/JIBiQEIAxoQZW5naW5lLXRlbGVtZXRyeSILZ2FtZS1lbmdpbmUqJGVuZ2luZS10ZWxlbWV0cnktaGlzdG9ncmFtLXByb2Nlc3NvcjotCgZFbmdpbmUSDFByb2R1Y3Rpdml0eRoSUHJvZHVjdGl2aXR5IFRvb2xzIJ8QQhEjZW5naW5lLXRlbGVtZXRyeer8kgGSAhI0Cg9lbmdpbmV0ZWxlbWV0cnkSIUVuZ2luZVRlbGVtZXRyeUNvdW50ZXJNZXRyaWNFdmVudBIoCgNSQ0MSIUVuZ2luZVRlbGVtZXRyeUNvdW50ZXJNZXRyaWNFdmVudBIrCgZjbGllbnQSIUVuZ2luZVRlbGVtZXRyeUNvdW50ZXJNZXRyaWNFdmVudBIrCgZzdHVkaW8SIUVuZ2luZVRlbGVtZXRyeUNvdW50ZXJNZXRyaWNFdmVudBIqCgVvdGhlchIhRW5naW5lVGVsZW1ldHJ5Q291bnRlck1ldHJpY0V2ZW50GAYqKGVuZ2luZSA+IHN5c3RlbXMgPiBlbmdpbmUgaW5mcmFzdHJ1Y3R1cmVCBwoFX25hbWVCCAoGX3ZhbHVlQh4KHF9ldmVudF90aW1lc3RhbXBfbWlsbGlzZWNvbmRCIAoeX2luZ2VzdF90aW1lc3RhbXBfbWlsbGlzZWNvbmRzQg4KDF9zYW1wbGVfcmF0ZUJGWkRnaXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50c3RyZWFtL2VuZ2luZXRlbGVtZXRyeWIGcHJvdG8z", [d.file_event_event_field_options, R.file_eventstream_core_hive_table_message_options, t, G]),
        r = (0, n.messageDesc)(X, 0),
        h = (0, b.fileDesc)("CklldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9oaXN0b2dyYW1fbWV0cmljX2V2ZW50LnByb3RvEhtldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkinwkKI0VuZ2luZVRlbGVtZXRyeUhpc3RvZ3JhbU1ldHJpY0V2ZW50Eh4KBG5hbWUYASABKAlCC6K+kgEGCgRuYW1lSACIAQESHAoDc3VtGAIgASgBQgqivpIBBQoDc3VtSAGIAQESIAoFY291bnQYAyABKARCDKK+kgEHCgVjb3VudEgCiAEBEjEKEWNvdW50c19pbl9idWNrZXRzGAQgAygEQhaivpIBEQoPY291bnRzSW5CdWNrZXRzEiwKDmJ1Y2tldF9pbmRpY2VzGAUgAygFQhSivpIBDwoNYnVja2V0SW5kaWNlcxJKChtldmVudF90aW1lc3RhbXBfbWlsbGlzZWNvbmQYBiABKANCIKK+kgEbChlldmVudFRpbWVzdGFtcE1pbGxpc2Vjb25kSAOIAQESMwodaW5nZXN0X3RpbWVzdGFtcF9taWxsaXNlY29uZHMYByABKANCB4q+kgECCAFIBIgBARJdCgphdHRyaWJ1dGVzGAggASgLMjYuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeUF0dHJpYnV0ZXNCEaK+kgEMCgphdHRyaWJ1dGVzEmAKCG1ldGFkYXRhGAkgASgLMj0uZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5Lm1ldGFkYXRhLkVuZ2luZVRlbGVtZXRyeU1ldGFkYXRhQg+ivpIBCgoIbWV0YWRhdGESLAoLc2FtcGxlX3JhdGUYCiABKAFCEqK+kgENCgtzYW1wbGVfcmF0ZUgFiAEBOtkD0vySARcI4gkQBDIQZW5naW5lLXRlbGVtZXRyedr8kgEHCNCGAxDQD+L8kgGJAQgDGhBlbmdpbmUtdGVsZW1ldHJ5IgtnYW1lLWVuZ2luZSokZW5naW5lLXRlbGVtZXRyeS1oaXN0b2dyYW0tcHJvY2Vzc29yOi0KBkVuZ2luZRIMUHJvZHVjdGl2aXR5GhJQcm9kdWN0aXZpdHkgVG9vbHMgnxBCESNlbmdpbmUtdGVsZW1ldHJ56vySAZwCEjYKD2VuZ2luZXRlbGVtZXRyeRIjRW5naW5lVGVsZW1ldHJ5SGlzdG9ncmFtTWV0cmljRXZlbnQSKgoDUkNDEiNFbmdpbmVUZWxlbWV0cnlIaXN0b2dyYW1NZXRyaWNFdmVudBItCgZjbGllbnQSI0VuZ2luZVRlbGVtZXRyeUhpc3RvZ3JhbU1ldHJpY0V2ZW50Ei0KBnN0dWRpbxIjRW5naW5lVGVsZW1ldHJ5SGlzdG9ncmFtTWV0cmljRXZlbnQSLAoFb3RoZXISI0VuZ2luZVRlbGVtZXRyeUhpc3RvZ3JhbU1ldHJpY0V2ZW50GAYqKGVuZ2luZSA+IHN5c3RlbXMgPiBlbmdpbmUgaW5mcmFzdHJ1Y3R1cmVCBwoFX25hbWVCBgoEX3N1bUIICgZfY291bnRCHgocX2V2ZW50X3RpbWVzdGFtcF9taWxsaXNlY29uZEIgCh5faW5nZXN0X3RpbWVzdGFtcF9taWxsaXNlY29uZHNCDgoMX3NhbXBsZV9yYXRlQkZaRGdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRzdHJlYW0vZW5naW5ldGVsZW1ldHJ5YgZwcm90bzM", [d.file_event_event_field_options, R.file_eventstream_core_hive_table_message_options, t, G]),
        s = (0, b.fileDesc)("Cj5ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnkvZW5naW5lX3RlbGVtZXRyeV9iYXRjaF9ldmVudC5wcm90bxIbZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5IpUHChlFbmdpbmVUZWxlbWV0cnlCYXRjaEV2ZW50EhQKB3ZlcnNpb24YASABKANIAIgBARIRCgR1dWlkGAIgASgJSAGIAQESVAoIbWV0YWRhdGEYAyABKAsyPS5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkubWV0YWRhdGEuRW5naW5lVGVsZW1ldHJ5TWV0YWRhdGFIAogBARIpChxiYXRjaF90aW1lc3RhbXBfbWlsbGlzZWNvbmRzGAQgASgDSAOIAQESMwodaW5nZXN0X3RpbWVzdGFtcF9taWxsaXNlY29uZHMYBSABKANCB4q+kgECCAFIBIgBARJQCghjb3VudGVycxgGIAMoCzI+LmV2ZW50c3RyZWFtLmVuZ2luZXRlbGVtZXRyeS5FbmdpbmVUZWxlbWV0cnlDb3VudGVyTWV0cmljRXZlbnQSTwoFc3RhdHMYByADKAsyQC5ldmVudHN0cmVhbS5lbmdpbmV0ZWxlbWV0cnkuRW5naW5lVGVsZW1ldHJ5SGlzdG9ncmFtTWV0cmljRXZlbnQSRgoGcG9pbnRzGAggAygLMjYuZXZlbnRzdHJlYW0uZW5naW5ldGVsZW1ldHJ5LkVuZ2luZVRlbGVtZXRyeVBvaW50RXZlbnQSIQoKcmVxdWVzdF9pcBgJIAEoCUIIkr6SAQPoPgFIBYgBARIkCg1zb3VyY2VfaXNfcmNjGAogASgIQgiSvpIBA7A/AUgGiAEBOt4ByvySATUKDGluZ2VzdF9wcm90bxIcZW5naW5lX3RlbGVtZXRyeV9iYXRjaF9ldmVudCIHZHMsaG91ctL8kgEXCOIJEAQyEGVuZ2luZS10ZWxlbWV0cnni/JIBfAgDIgtnYW1lLWVuZ2luZSofZW5naW5lLXRlbGVtZXRyeS1iYXRjaC1jb25zdW1lcjovCgVJbmZyYRIYRW5naW5lZXJpbmcgQWNjZWxlcmF0aW9uGglUZWxlbWV0cnkgnxBCEGVuZ2luZS10ZWxlbWV0cnlKB1AyN0s5VlL6/JIBAggBQgoKCF92ZXJzaW9uQgcKBV91dWlkQgsKCV9tZXRhZGF0YUIfCh1fYmF0Y2hfdGltZXN0YW1wX21pbGxpc2Vjb25kc0IgCh5faW5nZXN0X3RpbWVzdGFtcF9taWxsaXNlY29uZHNCDQoLX3JlcXVlc3RfaXBCEAoOX3NvdXJjZV9pc19yY2NCRlpEZ2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9lbmdpbmV0ZWxlbWV0cnliBnByb3RvMw", [d.file_event_event_field_options, R.file_eventstream_core_hive_table_message_options, G, i, X, h]),
        F = (0, n.messageDesc)(s, 0);
    var Y = l.i(868275),
        p = l.i(400661),
        S = l.i(950814);
    l.i(700781);
    var I = l.i(798081),
        B = class {
            async sendEvent(l, Z) {
                try {
                    let V = (0, p.toBinary)(l, (0, e.create)(l, Z), {
                            writeUnknownFields: !1
                        }),
                        b = (0, e.create)(I.SendEventRequestSchema, {
                            event: {
                                source: l.typeName,
                                payload: V
                            }
                        }),
                        n = await fetch(`${this.baseUrl}/v1/events/single`, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-protobuf",
                                "Content-Encoding": "gzip"
                            },
                            body: (0, S.gzipSync)((0, p.toBinary)(I.SendEventRequestSchema, b, {
                                writeUnknownFields: !1
                            })),
                            credentials: "include",
                            keepalive: !0
                        });
                    if (!n.ok) throw Error(`status ${n.status}`)
                } catch (l) {
                    console.error("EventStream failed to send event:", l)
                }
            }
            async sendBatch(l) {
                try {
                    let Z = new Map;
                    for (let e of l) {
                        let l = e.schema.typeName;
                        Z.has(l) || Z.set(l, []), Z.get(l).push(e)
                    }
                    let V = Array.from(Z.entries()).map(l => {
                            let [Z, V] = l, b = V.map(l => {
                                let {
                                    schema: Z,
                                    msg: V
                                } = l;
                                return (0, p.toBinary)(Z, (0, e.create)(Z, V), {
                                    writeUnknownFields: !1
                                })
                            });
                            return (0, e.create)(I.SendOptimizedBatchRequest_SubBatchSchema, {
                                source: Z,
                                payloads: b
                            })
                        }),
                        b = (0, e.create)(I.SendOptimizedBatchRequestSchema, {
                            subBatches: V
                        }),
                        n = await fetch(`${this.baseUrl}/v1/events/optimized`, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-protobuf",
                                "Content-Encoding": "gzip"
                            },
                            body: (0, S.gzipSync)((0, p.toBinary)(I.SendOptimizedBatchRequestSchema, b, {
                                writeUnknownFields: !1
                            })),
                            credentials: "include",
                            keepalive: !0
                        });
                    if (!n.ok) throw Error(`status ${n.status}`)
                } catch (l) {
                    console.error("EventStream failed to send batch events:", l)
                }
            }
            constructor({
                baseUrl: l = "https://apis.roblox.com"
            } = {}) {
                (0, Y._)(this, "baseUrl", void 0), this.baseUrl = l.replace(/\/$/, "") + "/experience-signals-ingest/public"
            }
        },
        y = l.i(815079);
    let E = /^[a-zA-Z_][a-zA-Z0-9_]*$/,
        C = 0x80000000 - 1;

    function J(l) {
        return E.test(l)
    }
    l.s(["createNextJSFireTelemetryCounter", 0, function(l, b) {
        function n(l, e) {
            b?.onError ? b.onError(l, e) : console.error(l, e)
        }
        if (!J(l)) return n(`@rbx/www-nextjs/fire-telemetry: invalid featureName "${l}"`, {
            name: l
        }), () => {};
        let d = b?.batchSize ?? 10,
            t = b?.batchIntervalMs ?? 250,
            R = new B({
                baseUrl: y.apiGateway.href
            }),
            c = (0, V.batch)({
                delay: t,
                maxSize: d
            }, l => {
                let V = l.map(l => (0, e.create)(r, {
                    name: l.name,
                    value: l.value,
                    eventTimestampMillisecond: (0, Z.bigIntFromNumber)(l.timestampMs) ?? 0n,
                    attributes: l.attributes ? function(l) {
                        let V = {},
                            b = {},
                            n = {},
                            d = {},
                            t = {};
                        for (let [e, W] of Object.entries(l))
                            if ("string" == typeof W) V[e] = W;
                            else if ("boolean" == typeof W) b[e] = W;
                        else if ("bigint" == typeof W) d[e] = W;
                        else if ("number" == typeof W)
                            if (Number.isFinite(W))
                                if (Number.isInteger(W) && W >= -0x80000000 && W <= C) n[e] = W;
                                else if (Number.isInteger(W)) {
                            let l = (0, Z.bigIntFromNumber)(W);
                            null !== l && (d[e] = l)
                        } else t[e] = W;
                        else V[e] = String(W);
                        return (0, e.create)(W, {
                            stringAttributes: V,
                            boolAttributes: b,
                            int32Attributes: n,
                            int64Attributes: d,
                            doubleAttributes: t
                        })
                    }(l.attributes) : {}
                }));
                return R.sendEvent(F, {
                    counters: V,
                    batchTimestampMilliseconds: (0, Z.bigIntFromNumber)(Date.now()) ?? 0n
                })
            });
        return function(e, Z, V) {
            let b = `${l}_${e}`;
            if (! function(l, e) {
                    if (!J(l)) return !1;
                    if (e) {
                        for (let l of Object.keys(e))
                            if (!J(l)) return !1
                    }
                    return !0
                }(b, Z)) return void n("@rbx/www-nextjs/fire-telemetry: invalid event name or attribute key", {
                name: e,
                attributes: Z
            });
            let d = V ?? 1;
            Number.isFinite(d) ? c({
                name: b,
                attributes: Z && Object.keys(Z).length > 0 ? Z : void 0,
                value: d,
                timestampMs: Date.now()
            }).catch(l => {
                console.error("@rbx/www-nextjs/fire-telemetry: sendEvent failed", l)
            }) : n("@rbx/www-nextjs/fire-telemetry: value must be a finite number", {
                name: e,
                attributes: Z
            })
        }
    }], 942060)
}]);

//# debugId=31a84602-8dd9-0d61-fc4b-be4b63b17e29
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0x8r1sg_~msen.js.map