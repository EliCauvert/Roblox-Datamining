;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9a8cf79a-c1ba-dc69-fd8a-e6e880af6c0c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 401263, 884213, e => {
    "use strict";
    var t = e.i(416340);
    let r = /{(.+?)}/g,
        n = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(r, (e, r) => {
            var n;
            return null != (n = t[r]) ? n : "{".concat(r, "}")
        });
    e.s(["default", 0, n], 884213);
    let i = /{(.+?)}/,
        o = /({.+?})/g,
        u = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        s = /(?:^|\.)robloxlabs\.com$/,
        f = () => {
            let e, t = u.test(window.location.hostname),
                r = window.location.hostname.includes("localhost"),
                n = "string" == typeof(e = window.location.hostname) && s.test(e);
            return {
                isSSR: !1,
                isAllowed: t || r || n,
                isDangerous: t || n,
                preferLoadedTranslations: n
            }
        },
        a = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var l = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: r,
            translate: u,
            translateHTML: s,
            translateWithNamespace: h,
            translateWithNamespaceHTML: c
        } = e, p = (0, t.useMemo)(() => ({
            ready: r,
            translate: u,
            translateHTML: s,
            translateWithNamespace: h,
            translateWithNamespaceHTML: c
        }), [r, u, s, h, c]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: p.ready,
                translate: (0, l.translationFn)(p),
                translateHTML: (0, l.translateHTMLFn)(p),
                translateWithNamespace: p.translateWithNamespace,
                translateWithNamespaceHTML: p.translateWithNamespaceHTML
            };
            return {
                ...e,
                tPendingTranslation: (e => {
                    let {
                        ready: t,
                        translate: r
                    } = e;
                    return (e, i, o, u) => {
                        let s = f();
                        if (!s.isAllowed) return r(o, u);
                        if (s.preferLoadedTranslations && t) {
                            let e = r(o, u);
                            if (e.length > 0) return e
                        }
                        return n(s.preferLoadedTranslations && !t ? e : a(e, s), u)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: r,
                        translateHTML: u
                    } = e;
                    return (e, s, l, h, c) => {
                        let p = f();
                        if (!p.isAllowed) return u(l, h, c);
                        if (p.preferLoadedTranslations && r) {
                            let e = u(l, h, c);
                            if ("" !== e) return e
                        }
                        return ((e, r, u) => {
                            let s, f;
                            if (void 0 === r && void 0 === u) return e;
                            let {
                                stringArgs: a,
                                htmlArgs: l
                            } = (s = {}, f = {}, void 0 === u || Object.entries(u).forEach(e => {
                                let [t, r] = e;
                                "string" == typeof r ? s[t] = r : f[t] = r
                            }), {
                                stringArgs: s,
                                htmlArgs: f
                            }), h = n(e, a), c = h.split(o).filter(e => !!e);
                            if (1 === c.length) return h;
                            let p = [...c];
                            if (0 !== Object.keys(l).length) {
                                let e = c.reduce((e, t, r) => {
                                    let n = i.exec(t);
                                    if (n) {
                                        let t = n[1];
                                        if (Object.hasOwn(l, t)) {
                                            let n = e[t];
                                            if (!n) return Object.assign(e, {
                                                [t]: [r]
                                            });
                                            n.push(r)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(l).forEach(t => {
                                    let [r, n] = t, i = e[r];
                                    i && i.forEach(e => {
                                        p[e] = n
                                    })
                                })
                            }
                            if (!Array.isArray(r) || 0 === r.length) return (0, t.createElement)(t.Fragment, null, ...p);
                            let y = r.reduce((e, t) => {
                                    let {
                                        opening: r,
                                        closing: n,
                                        content: i
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(r, "}")]: {
                                            match: "{".concat(n, "}"),
                                            content: i
                                        }
                                    })
                                }, {}),
                                d = [],
                                g = [],
                                v = [];
                            for (let e = p.shift(); void 0 !== e; e = p.shift())
                                if ("string" == typeof e && i.test(e))
                                    if (Object.hasOwn(y, e)) g.push(e), v.push(e);
                                    else {
                                        let r = g.pop();
                                        if (void 0 !== r) {
                                            let {
                                                match: n,
                                                content: i
                                            } = y[r];
                                            if (e !== n) break;
                                            let o = [],
                                                u = !1;
                                            for (; v.length > 0 && !u;) {
                                                let e = v.pop();
                                                e === r ? u = !0 : o.unshift(e)
                                            }
                                            let s = i(o.every(e => "string" == typeof e) ? o : (0, t.createElement)(t.Fragment, null, ...o));
                                            0 === v.length ? d.push(s) : v.push(s)
                                        }
                                    }
                            else 0 === v.length ? d.push(e) : v.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...d)
                        })(p.preferLoadedTranslations && !r ? e : a(e, p), h, c)
                    }
                })(e)
            }
        }, [p])
    }], 401263)
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let r = Object.entries(e).find(e => {
            let [, r] = e;
            return r === t
        });
        return r ? r[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 745873, 67262, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        n = e.i(458451),
        i = e.i(533414),
        o = e.i(157310),
        u = e.i(279149),
        s = e.i(602635),
        f = e.i(814975);
    let a = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        l = new u.UserScreenApi(a),
        h = new u.GroupsApi(a),
        c = {
            groupsApi: h,
            userScreenApi: l,
            creatorHomeContentApi: new u.CreatorHomeContentApi(a),
            signalsApi: new u.SignalsApi(a)
        };
    e.s(["CreatorHomeClient", 0, c], 67262);
    let p = function() {
        let {
            user: e
        } = (0, f.useAuthentication)();
        return (0, o.useQuery)({
            queryKey: s.getGroupsQueryKey,
            enabled: !!e,
            queryFn: () => {
                let e;
                return e = {
                    surface: u.GroupListSurface.CreatorHub
                }, c.groupsApi.groupsListGroups(e)
            }
        })
    };
    var y = e.i(809576);
    let d = (0, r.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: o
        } = e, {
            user: u
        } = (0, n.useRobloxAuthentication)(), s = (0, y.useGroupPermissionFetchers)(), {
            data: f,
            isLoading: a,
            refetch: l
        } = p(), [h, c] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == u ? void 0 : u.id), null), [g, v] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == u ? void 0 : u.id), null), [m, b] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == u ? void 0 : u.id), {}), w = (0, r.useCallback)(e => {
            v(e);
            let t = null != e ? e : "user";
            b(e => {
                let r = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: n,
                        lastSelected: i
                    } = e[t];
                    "number" != typeof n || Number.isNaN(n) || "number" != typeof i || Number.isNaN(i) || (r.priority = n * (1 + Math.log10(1 + 10 / Math.max(Date.now() - i, 864e5))))
                }
                return {
                    ...e,
                    [t]: r
                }
            })
        }, [v, b]), E = (0, r.useMemo)(() => {
            if (null == f ? void 0 : f.groups) return null == f ? void 0 : f.groups;
            if (null === h) return [];
            try {
                let e = "string" == typeof h ? JSON.parse(h) : h;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [h, null == f ? void 0 : f.groups]), A = (0, r.useMemo)(() => {
            var e;
            return g && null != (e = E.find(e => {
                let {
                    id: t
                } = e;
                return t === g
            })) ? e : null
        }, [g, E]), T = null == A ? void 0 : A.id, B = null == u ? void 0 : u.id, {
            data: C,
            error: x,
            isPending: P,
            refetch: S
        } = (0, y.useGroupResolvedPermissionsQuery)(T, B), {
            data: L,
            isPending: I,
            refetch: U
        } = (0, y.useGroupOwnershipQuery)(T, B), R = (0, r.useCallback)(() => null == T || null == B ? Promise.resolve() : Promise.all([S(), U()]), [U, S, T, B]);
        (0, r.useEffect)(() => {
            (null == u ? void 0 : u.id) && (null == f ? void 0 : f.groups) && !a && c(null == f ? void 0 : f.groups)
        }, [null == f ? void 0 : f.groups, E, a, c, null == u ? void 0 : u.id]);
        let O = (0, r.useMemo)(() => {
            var e;
            return {
                groups: E,
                currentGroup: A,
                groupData: m,
                isFetched: !a && !!B,
                refreshGroups: l,
                setCurrentGroup: w,
                ...s,
                permissions: C,
                isOwner: null != B && (null == L || null == (e = L.owner) ? void 0 : e.userId) === B,
                isPermissionsLoading: null != A && (P || I),
                permissionsError: x,
                refreshPermissions: R
            }
        }, [A, m, E, a, I, P, L, s, C, x, l, R, w, B]);
        return (0, t.jsx)(d.Provider, {
            value: O,
            children: o
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, r.useContext)(d);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, r.useContext)(d);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 809576, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(711367),
        n = e.i(157310),
        i = e.i(795621),
        o = e.i(458451),
        u = e.i(285666),
        s = e.i(272593);
    let f = new u.PermissionsV2Api((0, s.createClientConfiguration)("groups", "bedev1"));
    async function a(e, t, r) {
        var n;
        return null != (n = (await f.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: e,
            entityType: t,
            entityId: r
        })).permissions) ? n : {}
    }
    async function l(e) {
        return a(e, "groups", String(e))
    }
    async function h(e) {
        let t, r = [];
        do {
            var n, i;
            let o = await f.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            r.push(...null != (n = o.data) ? n : []), t = null != (i = o.nextPageCursor) ? i : void 0
        } while (t) return r
    }
    var c = e.i(156071);
    let p = new u.PermissionsV2Api((0, s.createClientConfiguration)("groups", "bedev1"));
    async function y(e) {
        var t;
        return null != (t = (await p.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var d = e.i(759283);
    let g = (e, t) => ["groups", e, t, "resolved-permissions"],
        v = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        m = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["useGroupOwnershipQuery", 0, function(e, t) {
        return (0, n.useQuery)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => c.default.getGroupInfo(e) : r.skipToken
        })
    }, "useGroupPermissionFetchers", 0, function() {
        let {
            user: e
        } = (0, o.useRobloxAuthentication)(), r = (0, i.useQueryClient)(), n = null == e ? void 0 : e.id, u = (0, t.useCallback)(e => r.fetchQuery({
            queryKey: m(e, n),
            queryFn: () => y(e),
            staleTime: 6e4
        }), [r, n]), s = (0, t.useCallback)(e => r.fetchQuery({
            queryKey: g(e, n),
            queryFn: () => l(e),
            staleTime: 6e4
        }), [r, n]), f = (0, t.useCallback)(e => r.fetchQuery({
            queryKey: v(e, n),
            queryFn: () => h(e),
            staleTime: 6e4
        }), [r, n]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: s,
            fetchRolePermissions: f,
            fetchUniversePermissions: u
        }), [s, f, u])
    }, "useGroupResolvedPermissionsQuery", 0, function(e, t) {
        return (0, n.useQuery)({
            queryKey: g(e, t),
            queryFn: e && t ? () => l(e) : r.skipToken,
            staleTime: 6e4
        })
    }, "useGroupRolesResolvedPermissions", 0, function(e) {
        let {
            user: t
        } = (0, o.useRobloxAuthentication)(), i = null == t ? void 0 : t.id;
        return (0, n.useQuery)({
            queryKey: v(e, i),
            queryFn: e && i ? () => h(e) : r.skipToken,
            staleTime: 6e4
        })
    }, "useUniversePermissions", 0, function(e) {
        let {
            user: t
        } = (0, o.useRobloxAuthentication)(), i = null == t ? void 0 : t.id;
        return (0, n.useQuery)({
            queryKey: m(e, i),
            queryFn: void 0 !== e && e !== d.uninitializedUniverseId ? () => y(e) : r.skipToken,
            staleTime: 6e4
        })
    }], 809576)
}, 459703, e => {
    "use strict";
    var t = e.i(30941),
        r = e.i(416340),
        n = e.i(787159);
    e.i(221628), e.i(149285);
    var i = (0, r.createContext)({
        ref: {
            current: null
        },
        enqueue: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        },
        close: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        }
    });
    e.s(["default", 0, function(e) {
        var o, u, s, f, a = e.children,
            l = (0, t.a)(e, ["children"]),
            h = (0, r.useRef)(null),
            c = (0, r.useState)(!1),
            p = c[0],
            y = c[1],
            d = (0, r.useState)([]),
            g = d[0],
            v = d[1],
            m = (0, r.useCallback)(function(e, r) {
                void 0 === e && (e = {}), void 0 === r && (r = function() {
                    return !0
                }), v(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: r
                    }], !1)
                })
            }, [v]),
            b = (0, r.useCallback)(function() {
                y(!1)
            }, [y]);
        (0, r.useEffect)(function() {
            g.length > 0 && y(!0)
        }, [g.length]);
        var w = (0, r.useMemo)(function() {
            return {
                ref: h,
                enqueue: m,
                close: b
            }
        }, [b, m]);
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(i.Provider, {
            value: w
        }, a), r.default.createElement(n.S, (0, t._)({}, (null == (o = g[0]) ? void 0 : o.props) || {}, l, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (u = g[0]) ? void 0 : u.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var r, n, i, o;
                    v(function(e) {
                        var r = e.slice(1);
                        return (0, t.b)([], r, !0)
                    }), (null == (n = null == (r = g[0]) ? void 0 : r.props.TransitionProps) ? void 0 : n.onExited) && (null == (o = null == (i = g[0]) ? void 0 : i.props.TransitionProps) || o.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var r, n, i;
                (null == (r = g[0]) ? void 0 : r.shouldClose(t)) && y(!1), (null == (n = g[0]) ? void 0 : n.props.onClose) && (null == (i = g[0]) || i.props.onClose(e, t))
            },
            open: p
        }), null == (f = g[0]) ? void 0 : f.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, r.useContext)(i);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 836047, (e, t, r) => {
    var n = {
            872: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = f(e),
                        r = t[0],
                        n = t[1];
                    return (r + n) * 3 / 4 - n
                }, t.toByteArray = function(e) {
                    var t, r, o = f(e),
                        u = o[0],
                        s = o[1],
                        a = new i((u + s) * 3 / 4 - s),
                        l = 0,
                        h = s > 0 ? u - 4 : u;
                    for (r = 0; r < h; r += 4) t = n[e.charCodeAt(r)] << 18 | n[e.charCodeAt(r + 1)] << 12 | n[e.charCodeAt(r + 2)] << 6 | n[e.charCodeAt(r + 3)], a[l++] = t >> 16 & 255, a[l++] = t >> 8 & 255, a[l++] = 255 & t;
                    return 2 === s && (t = n[e.charCodeAt(r)] << 2 | n[e.charCodeAt(r + 1)] >> 4, a[l++] = 255 & t), 1 === s && (t = n[e.charCodeAt(r)] << 10 | n[e.charCodeAt(r + 1)] << 4 | n[e.charCodeAt(r + 2)] >> 2, a[l++] = t >> 8 & 255, a[l++] = 255 & t), a
                }, t.fromByteArray = function(e) {
                    for (var t, n = e.length, i = n % 3, o = [], u = 0, s = n - i; u < s; u += 16383) o.push(function(e, t, n) {
                        for (var i, o = [], u = t; u < n; u += 3) i = (e[u] << 16 & 0xff0000) + (e[u + 1] << 8 & 65280) + (255 & e[u + 2]), o.push(r[i >> 18 & 63] + r[i >> 12 & 63] + r[i >> 6 & 63] + r[63 & i]);
                        return o.join("")
                    }(e, u, u + 16383 > s ? s : u + 16383));
                    return 1 === i ? o.push(r[(t = e[n - 1]) >> 2] + r[t << 4 & 63] + "==") : 2 === i && o.push(r[(t = (e[n - 2] << 8) + e[n - 1]) >> 10] + r[t >> 4 & 63] + r[t << 2 & 63] + "="), o.join("")
                };
                for (var r = [], n = [], i = "u" > typeof Uint8Array ? Uint8Array : Array, o = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", u = 0, s = o.length; u < s; ++u) r[u] = o[u], n[o.charCodeAt(u)] = u;

                function f(e) {
                    var t = e.length;
                    if (t % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var r = e.indexOf("="); - 1 === r && (r = t);
                    var n = r === t ? 0 : 4 - r % 4;
                    return [r, n]
                }
                n[45] = 62, n[95] = 63
            },
            230: function(e, t, r) {
                "use strict";
                var n = r(872),
                    i = r(321),
                    o = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function u(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, s.prototype), t
                }

                function s(e, t, r) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return l(e)
                    }
                    return f(e, t, r)
                }

                function f(e, t, r) {
                    if ("string" == typeof e) {
                        var n = e,
                            i = t;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !s.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var o = 0 | p(n, i),
                            f = u(o),
                            a = f.write(n, i);
                        return a !== o && (f = f.slice(0, a)), f
                    }
                    if (ArrayBuffer.isView(e)) return h(e);
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e);
                    if (L(e, ArrayBuffer) || e && L(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (L(e, SharedArrayBuffer) || e && L(e.buffer, SharedArrayBuffer))) return function(e, t, r) {
                        var n;
                        if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                        if (e.byteLength < t + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                        return Object.setPrototypeOf(n = void 0 === t && void 0 === r ? new Uint8Array(e) : void 0 === r ? new Uint8Array(e, t) : new Uint8Array(e, t, r), s.prototype), n
                    }(e, t, r);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var l = e.valueOf && e.valueOf();
                    if (null != l && l !== e) return s.from(l, t, r);
                    var y = function(e) {
                        if (s.isBuffer(e)) {
                            var t = 0 | c(e.length),
                                r = u(t);
                            return 0 === r.length || e.copy(r, 0, 0, t), r
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? u(0) : h(e) : "Buffer" === e.type && Array.isArray(e.data) ? h(e.data) : void 0
                    }(e);
                    if (y) return y;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return s.from(e[Symbol.toPrimitive]("string"), t, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e)
                }

                function a(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function l(e) {
                    return a(e), u(e < 0 ? 0 : 0 | c(e))
                }

                function h(e) {
                    for (var t = e.length < 0 ? 0 : 0 | c(e.length), r = u(t), n = 0; n < t; n += 1) r[n] = 255 & e[n];
                    return r
                }
                t.Buffer = s, t.SlowBuffer = function(e) {
                    return +e != e && (e = 0), s.alloc(+e)
                }, t.INSPECT_MAX_BYTES = 50, t.kMaxLength = 0x7fffffff, s.TYPED_ARRAY_SUPPORT = function() {
                    try {
                        var e = new Uint8Array(1),
                            t = {
                                foo: function() {
                                    return 42
                                }
                            };
                        return Object.setPrototypeOf(t, Uint8Array.prototype), Object.setPrototypeOf(e, t), 42 === e.foo()
                    } catch (e) {
                        return !1
                    }
                }(), !s.TYPED_ARRAY_SUPPORT && "u" > typeof console && "function" == typeof console.error && console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support."), Object.defineProperty(s.prototype, "parent", {
                    enumerable: !0,
                    get: function() {
                        if (s.isBuffer(this)) return this.buffer
                    }
                }), Object.defineProperty(s.prototype, "offset", {
                    enumerable: !0,
                    get: function() {
                        if (s.isBuffer(this)) return this.byteOffset
                    }
                }), s.poolSize = 8192, s.from = function(e, t, r) {
                    return f(e, t, r)
                }, Object.setPrototypeOf(s.prototype, Uint8Array.prototype), Object.setPrototypeOf(s, Uint8Array), s.alloc = function(e, t, r) {
                    return (a(e), e <= 0) ? u(e) : void 0 !== t ? "string" == typeof r ? u(e).fill(t, r) : u(e).fill(t) : u(e)
                }, s.allocUnsafe = function(e) {
                    return l(e)
                }, s.allocUnsafeSlow = function(e) {
                    return l(e)
                };

                function c(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function p(e, t) {
                    if (s.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || L(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + typeof e);
                    var r = e.length,
                        n = arguments.length > 2 && !0 === arguments[2];
                    if (!n && 0 === r) return 0;
                    for (var i = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return r;
                        case "utf8":
                        case "utf-8":
                            return C(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return P(e).length;
                        default:
                            if (i) return n ? -1 : C(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function y(e, t, r) {
                    var i, o, u, s = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, r) {
                                var n = e.length;
                                (!t || t < 0) && (t = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var i = "", o = t; o < r; ++o) i += I[e[o]];
                                return i
                            }(this, t, r);
                        case "utf8":
                        case "utf-8":
                            return m(this, t, r);
                        case "ascii":
                            return function(e, t, r) {
                                var n = "";
                                r = Math.min(e.length, r);
                                for (var i = t; i < r; ++i) n += String.fromCharCode(127 & e[i]);
                                return n
                            }(this, t, r);
                        case "latin1":
                        case "binary":
                            return function(e, t, r) {
                                var n = "";
                                r = Math.min(e.length, r);
                                for (var i = t; i < r; ++i) n += String.fromCharCode(e[i]);
                                return n
                            }(this, t, r);
                        case "base64":
                            return i = this, o = t, u = r, 0 === o && u === i.length ? n.fromByteArray(i) : n.fromByteArray(i.slice(o, u));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, r) {
                                for (var n = e.slice(t, r), i = "", o = 0; o < n.length; o += 2) i += String.fromCharCode(n[o] + 256 * n[o + 1]);
                                return i
                            }(this, t, r);
                        default:
                            if (s) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), s = !0
                    }
                }

                function d(e, t, r) {
                    var n = e[t];
                    e[t] = e[r], e[r] = n
                }

                function g(e, t, r, n, i) {
                    var o;
                    if (0 === e.length) return -1;
                    if ("string" == typeof r ? (n = r, r = 0) : r > 0x7fffffff ? r = 0x7fffffff : r < -0x80000000 && (r = -0x80000000), (o = r *= 1) != o && (r = i ? 0 : e.length - 1), r < 0 && (r = e.length + r), r >= e.length)
                        if (i) return -1;
                        else r = e.length - 1;
                    else if (r < 0)
                        if (!i) return -1;
                        else r = 0;
                    if ("string" == typeof t && (t = s.from(t, n)), s.isBuffer(t)) return 0 === t.length ? -1 : v(e, t, r, n, i);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (i) return Uint8Array.prototype.indexOf.call(e, t, r);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, r);
                        return v(e, [t], r, n, i)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function v(e, t, r, n, i) {
                    var o, u = 1,
                        s = e.length,
                        f = t.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        u = 2, s /= 2, f /= 2, r /= 2
                    }

                    function a(e, t) {
                        return 1 === u ? e[t] : e.readUInt16BE(t * u)
                    }
                    if (i) {
                        var l = -1;
                        for (o = r; o < s; o++)
                            if (a(e, o) === a(t, -1 === l ? 0 : o - l)) {
                                if (-1 === l && (l = o), o - l + 1 === f) return l * u
                            } else - 1 !== l && (o -= o - l), l = -1
                    } else
                        for (r + f > s && (r = s - f), o = r; o >= 0; o--) {
                            for (var h = !0, c = 0; c < f; c++)
                                if (a(e, o + c) !== a(t, c)) {
                                    h = !1;
                                    break
                                } if (h) return o
                        }
                    return -1
                }
                s.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== s.prototype
                }, s.compare = function(e, t) {
                    if (L(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), L(t, Uint8Array) && (t = s.from(t, t.offset, t.byteLength)), !s.isBuffer(e) || !s.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var r = e.length, n = t.length, i = 0, o = Math.min(r, n); i < o; ++i)
                        if (e[i] !== t[i]) {
                            r = e[i], n = t[i];
                            break
                        } return r < n ? -1 : +(n < r)
                }, s.isEncoding = function(e) {
                    switch (String(e).toLowerCase()) {
                        case "hex":
                        case "utf8":
                        case "utf-8":
                        case "ascii":
                        case "latin1":
                        case "binary":
                        case "base64":
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return !0;
                        default:
                            return !1
                    }
                }, s.concat = function(e, t) {
                    if (!Array.isArray(e)) throw TypeError('"list" argument must be an Array of Buffers');
                    if (0 === e.length) return s.alloc(0);
                    if (void 0 === t)
                        for (r = 0, t = 0; r < e.length; ++r) t += e[r].length;
                    var r, n = s.allocUnsafe(t),
                        i = 0;
                    for (r = 0; r < e.length; ++r) {
                        var o = e[r];
                        if (L(o, Uint8Array) && (o = s.from(o)), !s.isBuffer(o)) throw TypeError('"list" argument must be an Array of Buffers');
                        o.copy(n, i), i += o.length
                    }
                    return n
                }, s.byteLength = p, s.prototype._isBuffer = !0, s.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) d(this, t, t + 1);
                    return this
                }, s.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) d(this, t, t + 3), d(this, t + 1, t + 2);
                    return this
                }, s.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) d(this, t, t + 7), d(this, t + 1, t + 6), d(this, t + 2, t + 5), d(this, t + 3, t + 4);
                    return this
                }, s.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? m(this, 0, e) : y.apply(this, arguments)
                }, s.prototype.toLocaleString = s.prototype.toString, s.prototype.equals = function(e) {
                    if (!s.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === s.compare(this, e)
                }, s.prototype.inspect = function() {
                    var e = "",
                        r = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (e += " ... "), "<Buffer " + e + ">"
                }, o && (s.prototype[o] = s.prototype.inspect), s.prototype.compare = function(e, t, r, n, i) {
                    if (L(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), !s.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + typeof e);
                    if (void 0 === t && (t = 0), void 0 === r && (r = e ? e.length : 0), void 0 === n && (n = 0), void 0 === i && (i = this.length), t < 0 || r > e.length || n < 0 || i > this.length) throw RangeError("out of range index");
                    if (n >= i && t >= r) return 0;
                    if (n >= i) return -1;
                    if (t >= r) return 1;
                    if (t >>>= 0, r >>>= 0, n >>>= 0, i >>>= 0, this === e) return 0;
                    for (var o = i - n, u = r - t, f = Math.min(o, u), a = this.slice(n, i), l = e.slice(t, r), h = 0; h < f; ++h)
                        if (a[h] !== l[h]) {
                            o = a[h], u = l[h];
                            break
                        } return o < u ? -1 : +(u < o)
                }, s.prototype.includes = function(e, t, r) {
                    return -1 !== this.indexOf(e, t, r)
                }, s.prototype.indexOf = function(e, t, r) {
                    return g(this, e, t, r, !0)
                }, s.prototype.lastIndexOf = function(e, t, r) {
                    return g(this, e, t, r, !1)
                };

                function m(e, t, r) {
                    r = Math.min(e.length, r);
                    for (var n = [], i = t; i < r;) {
                        var o, u, s, f, a = e[i],
                            l = null,
                            h = a > 239 ? 4 : a > 223 ? 3 : a > 191 ? 2 : 1;
                        if (i + h <= r) switch (h) {
                            case 1:
                                a < 128 && (l = a);
                                break;
                            case 2:
                                (192 & (o = e[i + 1])) == 128 && (f = (31 & a) << 6 | 63 & o) > 127 && (l = f);
                                break;
                            case 3:
                                o = e[i + 1], u = e[i + 2], (192 & o) == 128 && (192 & u) == 128 && (f = (15 & a) << 12 | (63 & o) << 6 | 63 & u) > 2047 && (f < 55296 || f > 57343) && (l = f);
                                break;
                            case 4:
                                o = e[i + 1], u = e[i + 2], s = e[i + 3], (192 & o) == 128 && (192 & u) == 128 && (192 & s) == 128 && (f = (15 & a) << 18 | (63 & o) << 12 | (63 & u) << 6 | 63 & s) > 65535 && f < 1114112 && (l = f)
                        }
                        null === l ? (l = 65533, h = 1) : l > 65535 && (l -= 65536, n.push(l >>> 10 & 1023 | 55296), l = 56320 | 1023 & l), n.push(l), i += h
                    }
                    var c = n,
                        p = c.length;
                    if (p <= 4096) return String.fromCharCode.apply(String, c);
                    for (var y = "", d = 0; d < p;) y += String.fromCharCode.apply(String, c.slice(d, d += 4096));
                    return y
                }

                function b(e, t, r) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > r) throw RangeError("Trying to access beyond buffer length")
                }

                function w(e, t, r, n, i, o) {
                    if (!s.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > i || t < o) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function E(e, t, r, n, i, o) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function A(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || E(e, t, r, 4, 34028234663852886e22, -34028234663852886e22), i.write(e, t, r, n, 23, 4), r + 4
                }

                function T(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || E(e, t, r, 8, 17976931348623157e292, -17976931348623157e292), i.write(e, t, r, n, 52, 8), r + 8
                }
                s.prototype.write = function(e, t, r, n) {
                    if (void 0 === t) n = "utf8", r = this.length, t = 0;
                    else if (void 0 === r && "string" == typeof t) n = t, r = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var i, o, u, s, f, a, l, h, c = this.length - t;
                    if ((void 0 === r || r > c) && (r = c), e.length > 0 && (r < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var p = !1;;) switch (n) {
                        case "hex":
                            return function(e, t, r, n) {
                                r = Number(r) || 0;
                                var i = e.length - r;
                                n ? (n = Number(n)) > i && (n = i) : n = i;
                                var o = t.length;
                                n > o / 2 && (n = o / 2);
                                for (var u = 0; u < n; ++u) {
                                    var s, f = parseInt(t.substr(2 * u, 2), 16);
                                    if ((s = f) != s) break;
                                    e[r + u] = f
                                }
                                return u
                            }(this, e, t, r);
                        case "utf8":
                        case "utf-8":
                            return i = t, o = r, S(C(e, this.length - i), this, i, o);
                        case "ascii":
                            return u = t, s = r, S(x(e), this, u, s);
                        case "latin1":
                        case "binary":
                            return function(e, t, r, n) {
                                return S(x(t), e, r, n)
                            }(this, e, t, r);
                        case "base64":
                            return f = t, a = r, S(P(e), this, f, a);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return l = t, h = r, S(function(e, t) {
                                for (var r, n, i = [], o = 0; o < e.length && !((t -= 2) < 0); ++o) n = (r = e.charCodeAt(o)) >> 8, i.push(r % 256), i.push(n);
                                return i
                            }(e, this.length - l), this, l, h);
                        default:
                            if (p) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), p = !0
                    }
                }, s.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, s.prototype.slice = function(e, t) {
                    var r = this.length;
                    e = ~~e, t = void 0 === t ? r : ~~t, e < 0 ? (e += r) < 0 && (e = 0) : e > r && (e = r), t < 0 ? (t += r) < 0 && (t = 0) : t > r && (t = r), t < e && (t = e);
                    var n = this.subarray(e, t);
                    return Object.setPrototypeOf(n, s.prototype), n
                }, s.prototype.readUIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || b(e, t, this.length);
                    for (var n = this[e], i = 1, o = 0; ++o < t && (i *= 256);) n += this[e + o] * i;
                    return n
                }, s.prototype.readUIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || b(e, t, this.length);
                    for (var n = this[e + --t], i = 1; t > 0 && (i *= 256);) n += this[e + --t] * i;
                    return n
                }, s.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || b(e, 1, this.length), this[e]
                }, s.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || b(e, 2, this.length), this[e] | this[e + 1] << 8
                }, s.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || b(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, s.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, s.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, s.prototype.readIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || b(e, t, this.length);
                    for (var n = this[e], i = 1, o = 0; ++o < t && (i *= 256);) n += this[e + o] * i;
                    return n >= (i *= 128) && (n -= Math.pow(2, 8 * t)), n
                }, s.prototype.readIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || b(e, t, this.length);
                    for (var n = t, i = 1, o = this[e + --n]; n > 0 && (i *= 256);) o += this[e + --n] * i;
                    return o >= (i *= 128) && (o -= Math.pow(2, 8 * t)), o
                }, s.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || b(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, s.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || b(e, 2, this.length);
                    var r = this[e] | this[e + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, s.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || b(e, 2, this.length);
                    var r = this[e + 1] | this[e] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, s.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, s.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, s.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), i.read(this, e, !0, 23, 4)
                }, s.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), i.read(this, e, !1, 23, 4)
                }, s.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || b(e, 8, this.length), i.read(this, e, !0, 52, 8)
                }, s.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || b(e, 8, this.length), i.read(this, e, !1, 52, 8)
                }, s.prototype.writeUIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        w(this, e, t, r, i, 0)
                    }
                    var o = 1,
                        u = 0;
                    for (this[t] = 255 & e; ++u < r && (o *= 256);) this[t + u] = e / o & 255;
                    return t + r
                }, s.prototype.writeUIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        w(this, e, t, r, i, 0)
                    }
                    var o = r - 1,
                        u = 1;
                    for (this[t + o] = 255 & e; --o >= 0 && (u *= 256);) this[t + o] = e / u & 255;
                    return t + r
                }, s.prototype.writeUInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || w(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, s.prototype.writeUInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || w(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeUInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || w(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeUInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || w(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, s.prototype.writeUInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || w(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        w(this, e, t, r, i - 1, -i)
                    }
                    var o = 0,
                        u = 1,
                        s = 0;
                    for (this[t] = 255 & e; ++o < r && (u *= 256);) e < 0 && 0 === s && 0 !== this[t + o - 1] && (s = 1), this[t + o] = (e / u | 0) - s & 255;
                    return t + r
                }, s.prototype.writeIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        w(this, e, t, r, i - 1, -i)
                    }
                    var o = r - 1,
                        u = 1,
                        s = 0;
                    for (this[t + o] = 255 & e; --o >= 0 && (u *= 256);) e < 0 && 0 === s && 0 !== this[t + o + 1] && (s = 1), this[t + o] = (e / u | 0) - s & 255;
                    return t + r
                }, s.prototype.writeInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || w(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, s.prototype.writeInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || w(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || w(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || w(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, s.prototype.writeInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || w(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeFloatLE = function(e, t, r) {
                    return A(this, e, t, !0, r)
                }, s.prototype.writeFloatBE = function(e, t, r) {
                    return A(this, e, t, !1, r)
                }, s.prototype.writeDoubleLE = function(e, t, r) {
                    return T(this, e, t, !0, r)
                }, s.prototype.writeDoubleBE = function(e, t, r) {
                    return T(this, e, t, !1, r)
                }, s.prototype.copy = function(e, t, r, n) {
                    if (!s.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (r || (r = 0), n || 0 === n || (n = this.length), t >= e.length && (t = e.length), t || (t = 0), n > 0 && n < r && (n = r), n === r || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (r < 0 || r >= this.length) throw RangeError("Index out of range");
                    if (n < 0) throw RangeError("sourceEnd out of bounds");
                    n > this.length && (n = this.length), e.length - t < n - r && (n = e.length - t + r);
                    var i = n - r;
                    if (this === e && "function" == typeof Uint8Array.prototype.copyWithin) this.copyWithin(t, r, n);
                    else if (this === e && r < t && t < n)
                        for (var o = i - 1; o >= 0; --o) e[o + t] = this[o + r];
                    else Uint8Array.prototype.set.call(e, this.subarray(r, n), t);
                    return i
                }, s.prototype.fill = function(e, t, r, n) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (n = t, t = 0, r = this.length) : "string" == typeof r && (n = r, r = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !s.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
                        if (1 === e.length) {
                            var i, o = e.charCodeAt(0);
                            ("utf8" === n && o < 128 || "latin1" === n) && (e = o)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < r) throw RangeError("Out of range index");
                    if (r <= t) return this;
                    if (t >>>= 0, r = void 0 === r ? this.length : r >>> 0, e || (e = 0), "number" == typeof e)
                        for (i = t; i < r; ++i) this[i] = e;
                    else {
                        var u = s.isBuffer(e) ? e : s.from(e, n),
                            f = u.length;
                        if (0 === f) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (i = 0; i < r - t; ++i) this[i + t] = u[i % f]
                    }
                    return this
                };
                var B = /[^+/0-9A-Za-z-_]/g;

                function C(e, t) {
                    t = t || 1 / 0;
                    for (var r, n = e.length, i = null, o = [], u = 0; u < n; ++u) {
                        if ((r = e.charCodeAt(u)) > 55295 && r < 57344) {
                            if (!i) {
                                if (r > 56319 || u + 1 === n) {
                                    (t -= 3) > -1 && o.push(239, 191, 189);
                                    continue
                                }
                                i = r;
                                continue
                            }
                            if (r < 56320) {
                                (t -= 3) > -1 && o.push(239, 191, 189), i = r;
                                continue
                            }
                            r = (i - 55296 << 10 | r - 56320) + 65536
                        } else i && (t -= 3) > -1 && o.push(239, 191, 189);
                        if (i = null, r < 128) {
                            if ((t -= 1) < 0) break;
                            o.push(r)
                        } else if (r < 2048) {
                            if ((t -= 2) < 0) break;
                            o.push(r >> 6 | 192, 63 & r | 128)
                        } else if (r < 65536) {
                            if ((t -= 3) < 0) break;
                            o.push(r >> 12 | 224, r >> 6 & 63 | 128, 63 & r | 128)
                        } else if (r < 1114112) {
                            if ((t -= 4) < 0) break;
                            o.push(r >> 18 | 240, r >> 12 & 63 | 128, r >> 6 & 63 | 128, 63 & r | 128)
                        } else throw Error("Invalid code point")
                    }
                    return o
                }

                function x(e) {
                    for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                    return t
                }

                function P(e) {
                    return n.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(B, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function S(e, t, r, n) {
                    for (var i = 0; i < n && !(i + r >= t.length) && !(i >= e.length); ++i) t[i + r] = e[i];
                    return i
                }

                function L(e, t) {
                    return e instanceof t || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var I = function() {
                    for (var e = "0123456789abcdef", t = Array(256), r = 0; r < 16; ++r)
                        for (var n = 16 * r, i = 0; i < 16; ++i) t[n + i] = e[r] + e[i];
                    return t
                }()
            },
            321: function(e, t) {
                t.read = function(e, t, r, n, i) {
                    var o, u, s = 8 * i - n - 1,
                        f = (1 << s) - 1,
                        a = f >> 1,
                        l = -7,
                        h = r ? i - 1 : 0,
                        c = r ? -1 : 1,
                        p = e[t + h];
                    for (h += c, o = p & (1 << -l) - 1, p >>= -l, l += s; l > 0; o = 256 * o + e[t + h], h += c, l -= 8);
                    for (u = o & (1 << -l) - 1, o >>= -l, l += n; l > 0; u = 256 * u + e[t + h], h += c, l -= 8);
                    if (0 === o) o = 1 - a;
                    else {
                        if (o === f) return u ? NaN : 1 / 0 * (p ? -1 : 1);
                        u += Math.pow(2, n), o -= a
                    }
                    return (p ? -1 : 1) * u * Math.pow(2, o - n)
                }, t.write = function(e, t, r, n, i, o) {
                    var u, s, f, a = 8 * o - i - 1,
                        l = (1 << a) - 1,
                        h = l >> 1,
                        c = 5960464477539062e-23 * (23 === i),
                        p = n ? 0 : o - 1,
                        y = n ? 1 : -1,
                        d = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (s = +!!isNaN(t), u = l) : (u = Math.floor(Math.log(t) / Math.LN2), t * (f = Math.pow(2, -u)) < 1 && (u--, f *= 2), u + h >= 1 ? t += c / f : t += c * Math.pow(2, 1 - h), t * f >= 2 && (u++, f /= 2), u + h >= l ? (s = 0, u = l) : u + h >= 1 ? (s = (t * f - 1) * Math.pow(2, i), u += h) : (s = t * Math.pow(2, h - 1) * Math.pow(2, i), u = 0)); i >= 8; e[r + p] = 255 & s, p += y, s /= 256, i -= 8);
                    for (u = u << i | s, a += i; a > 0; e[r + p] = 255 & u, p += y, u /= 256, a -= 8);
                    e[r + p - y] |= 128 * d
                }
            }
        },
        i = {};

    function o(e) {
        var t = i[e];
        if (void 0 !== t) return t.exports;
        var r = i[e] = {
                exports: {}
            },
            u = !0;
        try {
            n[e](r, r.exports, o), u = !1
        } finally {
            u && delete i[e]
        }
        return r.exports
    }
    o.ab = "/ROOT/node_modules/.pnpm/next@16.3.0_@babel+core@7.29.0_supports-color@8.1.1__@opentelemetry+api@1.9.1_@playwrig_2bf1aa2500abc393a8e8c0b283d26d6e/node_modules/next/dist/compiled/buffer/", t.exports = o(230)
}, 725924, e => {
    "use strict";
    let t, r;
    var n, i, o = e.i(416340);
    let u = "u" > typeof Intl,
        s = !u || void 0 === Intl.Locale,
        f = !u || void 0 === Intl.RelativeTimeFormat,
        a = !u || void 0 === Intl.PluralRules,
        l = !u || void 0 === Intl.DisplayNames,
        h = "function" != typeof window.ResizeObserver,
        c = (n = s || f || a || l || h, i = function() {
            return Promise.all([(s ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([f ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, a ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, l ? e.A(951862).then(() => e.A(890267)) : null])), h ? e.A(956827) : null])
        }, t = !1, r = n ? i().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, n] = (0, o.useState)(!r || t);
            return (0, o.useEffect)(() => {
                r && !e && r.then(() => n(!0))
            }, [e]), e
        });
    e.s(["usePolyfills", 0, c], 725924)
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let r = (0, t.createContext)(null),
        n = [],
        i = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        o = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function u() {
        let e = (0, t.useContext)(r);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }
    let s = () => null;
    e.s(["UnifiedLoggerProvider", 0, e => {
        var u;
        let {
            children: s,
            unifiedLogger: f,
            pageLoggerConfig: a,
            path: l,
            url: h,
            isReady: c = !0
        } = e, p = null != (u = null == a ? void 0 : a.tags) ? u : n, y = null == a ? void 0 : a.rosId, d = (0, t.useMemo)(() => ({
            tags: p,
            rosId: y,
            path: l,
            url: h,
            isReady: c
        }), [p, y, l, h, c]), g = (0, t.useRef)(d), v = (0, t.useRef)(d);
        (0, t.useLayoutEffect)(() => {
            v.current = d, void 0 === g.current.path && void 0 !== d.path && (g.current = {
                ...g.current,
                path: d.path
            })
        }, [d]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let r, n = (r = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== r && o.has(r)) ? g.current : v.current;
                void 0 !== n.path && (e.parameters = {
                    ...e.parameters,
                    path: n.path
                }), n.tags.forEach(t => e.addTag(t)), void 0 !== n.rosId && e.addTag("owner: ".concat(n.rosId))
            };
            return i.forEach(t => {
                f.events.on(t, e)
            }), () => {
                i.forEach(t => {
                    f.events.off(t, e)
                })
            }
        }, [f]);
        let m = (0, t.useMemo)(() => ({
            unifiedLogger: f,
            pageContext: d
        }), [f, d]);
        return t.default.createElement(r.Provider, {
            value: m
        }, s)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(r)
    }, "usePageSettled", 0, e => {
        let {
            unifiedLogger: r,
            pageContext: n
        } = u(), {
            path: i,
            url: o,
            isReady: f
        } = n, a = r.pageSettledTracker, l = (0, t.useSyncExternalStore)(a.subscribe, a.getSnapshot, s);
        (0, t.useEffect)(() => {
            if (!l || l.isNavigating || !f || !i || !o || !e || l.url.split(/[?#]/)[0] !== o.split(/[?#]/)[0]) return;
            let t = new URL(i, window.location.origin).pathname,
                n = requestAnimationFrame(() => {
                    n = requestAnimationFrame(() => {
                        r.logPageSettledEvent({
                            navigationId: l.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(n)
        }, [l, f, o, i, e, r])
    }, "useUnifiedLoggerProvider", 0, u])
}]);

//# debugId=9a8cf79a-c1ba-dc69-fd8a-e6e880af6c0c
//# sourceMappingURL=1gwazg28-hq6q.js.map