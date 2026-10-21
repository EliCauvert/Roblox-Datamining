;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "998969c6-43f6-1318-39ff-b5eac80e168d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 745873, 67262, t => {
    "use strict";
    var e = t.i(221628),
        r = t.i(416340),
        n = t.i(458451),
        i = t.i(533414),
        o = t.i(157310),
        u = t.i(279149),
        s = t.i(602635),
        f = t.i(814975);
    let a = (0, t.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        l = new u.UserScreenApi(a),
        h = new u.GroupsApi(a),
        p = {
            groupsApi: h,
            userScreenApi: l,
            creatorHomeContentApi: new u.CreatorHomeContentApi(a),
            signalsApi: new u.SignalsApi(a)
        };
    t.s(["CreatorHomeClient", 0, p], 67262);
    let c = function() {
        let {
            user: t
        } = (0, f.useAuthentication)();
        return (0, o.useQuery)({
            queryKey: s.getGroupsQueryKey,
            enabled: !!t,
            queryFn: () => {
                let t;
                return t = {
                    surface: u.GroupListSurface.CreatorHub
                }, p.groupsApi.groupsListGroups(t)
            }
        })
    };
    var y = t.i(809576);
    let g = (0, r.createContext)(null);
    t.s(["GroupsProvider", 0, t => {
        let {
            children: o
        } = t, {
            user: u
        } = (0, n.useRobloxAuthentication)(), s = (0, y.useGroupPermissionFetchers)(), {
            data: f,
            isLoading: a,
            refetch: l
        } = c(), [h, p] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == u ? void 0 : u.id), null), [d, v] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == u ? void 0 : u.id), null), [m, b] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == u ? void 0 : u.id), {}), w = (0, r.useCallback)(t => {
            v(t);
            let e = null != t ? t : "user";
            b(t => {
                let r = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (t[e]) {
                    let {
                        priority: n,
                        lastSelected: i
                    } = t[e];
                    "number" != typeof n || Number.isNaN(n) || "number" != typeof i || Number.isNaN(i) || (r.priority = n * (1 + Math.log10(1 + 10 / Math.max(Date.now() - i, 864e5))))
                }
                return {
                    ...t,
                    [e]: r
                }
            })
        }, [v, b]), E = (0, r.useMemo)(() => {
            if (null == f ? void 0 : f.groups) return null == f ? void 0 : f.groups;
            if (null === h) return [];
            try {
                let t = "string" == typeof h ? JSON.parse(h) : h;
                return Array.isArray(t) && t.every(t => "object" == typeof t && null !== t && "id" in t && "number" == typeof t.id && "name" in t && "string" == typeof t.name && "roleSetName" in t && "string" == typeof t.roleSetName) ? t : []
            } catch (t) {
                return []
            }
        }, [h, null == f ? void 0 : f.groups]), A = (0, r.useMemo)(() => {
            var t;
            return d && null != (t = E.find(t => {
                let {
                    id: e
                } = t;
                return e === d
            })) ? t : null
        }, [d, E]), B = null == A ? void 0 : A.id, C = null == u ? void 0 : u.id, {
            data: x,
            error: T,
            isPending: S,
            refetch: P
        } = (0, y.useGroupResolvedPermissionsQuery)(B, C), {
            data: I,
            isPending: U,
            refetch: R
        } = (0, y.useGroupOwnershipQuery)(B, C), L = (0, r.useCallback)(() => null == B || null == C ? Promise.resolve() : Promise.all([P(), R()]), [R, P, B, C]);
        (0, r.useEffect)(() => {
            (null == u ? void 0 : u.id) && (null == f ? void 0 : f.groups) && !a && p(null == f ? void 0 : f.groups)
        }, [null == f ? void 0 : f.groups, E, a, p, null == u ? void 0 : u.id]);
        let O = (0, r.useMemo)(() => {
            var t;
            return {
                groups: E,
                currentGroup: A,
                groupData: m,
                isFetched: !a && !!C,
                refreshGroups: l,
                setCurrentGroup: w,
                ...s,
                permissions: x,
                isOwner: null != C && (null == I || null == (t = I.owner) ? void 0 : t.userId) === C,
                isPermissionsLoading: null != A && (S || U),
                permissionsError: T,
                refreshPermissions: L
            }
        }, [A, m, E, a, U, S, I, s, x, T, l, L, w, C]);
        return (0, e.jsx)(g.Provider, {
            value: O,
            children: o
        })
    }, "useCurrentGroup", 0, () => {
        let t = (0, r.useContext)(g);
        if (null === t) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return t.currentGroup
    }, "useGroups", 0, () => {
        let t = (0, r.useContext)(g);
        if (null === t) throw Error("useGroups must be used within a GroupsProvider");
        return t
    }], 745873)
}, 809576, t => {
    "use strict";
    var e = t.i(416340),
        r = t.i(711367),
        n = t.i(157310),
        i = t.i(795621),
        o = t.i(458451),
        u = t.i(285666),
        s = t.i(272593);
    let f = new u.PermissionsV2Api((0, s.createClientConfiguration)("groups", "bedev1"));
    async function a(t, e, r) {
        var n;
        return null != (n = (await f.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: t,
            entityType: e,
            entityId: r
        })).permissions) ? n : {}
    }
    async function l(t) {
        return a(t, "groups", String(t))
    }
    async function h(t) {
        let e, r = [];
        do {
            var n, i;
            let o = await f.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: t,
                entityType: "roles",
                cursor: e
            });
            r.push(...null != (n = o.data) ? n : []), e = null != (i = o.nextPageCursor) ? i : void 0
        } while (e) return r
    }
    var p = t.i(156071);
    let c = new u.PermissionsV2Api((0, s.createClientConfiguration)("groups", "bedev1"));
    async function y(t) {
        var e;
        return null != (e = (await c.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(t)
        })).permissions) ? e : {}
    }
    var g = t.i(759283);
    let d = (t, e) => ["groups", t, e, "resolved-permissions"],
        v = (t, e) => ["groups", t, e, "roles", "resolved-permissions"],
        m = (t, e) => ["universe-resolved-permissions", e, void 0 === t ? t : String(t)];
    t.s(["useGroupOwnershipQuery", 0, function(t, e) {
        return (0, n.useQuery)({
            queryKey: ["groups", t, e, "owner"],
            queryFn: t && e ? () => p.default.getGroupInfo(t) : r.skipToken
        })
    }, "useGroupPermissionFetchers", 0, function() {
        let {
            user: t
        } = (0, o.useRobloxAuthentication)(), r = (0, i.useQueryClient)(), n = null == t ? void 0 : t.id, u = (0, e.useCallback)(t => r.fetchQuery({
            queryKey: m(t, n),
            queryFn: () => y(t),
            staleTime: 6e4
        }), [r, n]), s = (0, e.useCallback)(t => r.fetchQuery({
            queryKey: d(t, n),
            queryFn: () => l(t),
            staleTime: 6e4
        }), [r, n]), f = (0, e.useCallback)(t => r.fetchQuery({
            queryKey: v(t, n),
            queryFn: () => h(t),
            staleTime: 6e4
        }), [r, n]);
        return (0, e.useMemo)(() => ({
            fetchGroupPermissions: s,
            fetchRolePermissions: f,
            fetchUniversePermissions: u
        }), [s, f, u])
    }, "useGroupResolvedPermissionsQuery", 0, function(t, e) {
        return (0, n.useQuery)({
            queryKey: d(t, e),
            queryFn: t && e ? () => l(t) : r.skipToken,
            staleTime: 6e4
        })
    }, "useGroupRolesResolvedPermissions", 0, function(t) {
        let {
            user: e
        } = (0, o.useRobloxAuthentication)(), i = null == e ? void 0 : e.id;
        return (0, n.useQuery)({
            queryKey: v(t, i),
            queryFn: t && i ? () => h(t) : r.skipToken,
            staleTime: 6e4
        })
    }, "useUniversePermissions", 0, function(t) {
        let {
            user: e
        } = (0, o.useRobloxAuthentication)(), i = null == e ? void 0 : e.id;
        return (0, n.useQuery)({
            queryKey: m(t, i),
            queryFn: void 0 !== t && t !== g.uninitializedUniverseId ? () => y(t) : r.skipToken,
            staleTime: 6e4
        })
    }], 809576)
}, 486736, t => {
    "use strict";
    var e = t.i(221628),
        r = t.i(416340),
        n = t.i(639102);
    let i = {},
        o = {
            ...i
        },
        u = async () => {
            try {
                let {
                    applicationSettings: t = {}
                } = await n.settingsClient.getApplicationSettings(), e = {};
                return Object.entries(t).forEach(t => {
                    let [r, n] = t;
                    try {
                        let t = typeof i[r];
                        e[r] = "boolean" === t || "number" === t ? JSON.parse(n) : n
                    } catch (t) {
                        console.error(t)
                    }
                }), e
            } catch (t) {
                return i
            }
        }, s = (0, r.createContext)({
            settings: {
                ...o
            },
            status: "initial",
            isFetched: !1
        });
    t.s(["SettingsProvider", 0, t => {
        let {
            children: n
        } = t, [i, f] = (0, r.useState)(() => ({
            settings: {
                ...o
            },
            status: "initial",
            isFetched: !1
        }));
        return (0, r.useEffect)(() => {
            (async () => {
                let t = await Promise.allSettled([u()]);
                f({
                    settings: t.reduce((t, e) => ({
                        ...t,
                        ..."fulfilled" === e.status ? e.value : {}
                    }), o),
                    isFetched: !0,
                    status: t.find(t => "rejected" === t.status) ? "error" : "success"
                })
            })()
        }, []), (0, e.jsx)(s.Provider, {
            value: i,
            children: n
        })
    }, "useSettings", 0, () => {
        let {
            settings: t,
            status: e,
            isFetched: n
        } = (0, r.useContext)(s), i = (0, r.useRef)(t);
        return {
            settings: (0, r.useMemo)(() => {
                let e = i.current;
                return Object.keys(t).some(r => t[r] !== e[r]) && (i.current = t), i.current
            }, [t]),
            status: e,
            isFetched: n
        }
    }], 486736)
}, 836047, (t, e, r) => {
    var n = {
            872: function(t, e) {
                "use strict";
                e.byteLength = function(t) {
                    var e = f(t),
                        r = e[0],
                        n = e[1];
                    return (r + n) * 3 / 4 - n
                }, e.toByteArray = function(t) {
                    var e, r, o = f(t),
                        u = o[0],
                        s = o[1],
                        a = new i((u + s) * 3 / 4 - s),
                        l = 0,
                        h = s > 0 ? u - 4 : u;
                    for (r = 0; r < h; r += 4) e = n[t.charCodeAt(r)] << 18 | n[t.charCodeAt(r + 1)] << 12 | n[t.charCodeAt(r + 2)] << 6 | n[t.charCodeAt(r + 3)], a[l++] = e >> 16 & 255, a[l++] = e >> 8 & 255, a[l++] = 255 & e;
                    return 2 === s && (e = n[t.charCodeAt(r)] << 2 | n[t.charCodeAt(r + 1)] >> 4, a[l++] = 255 & e), 1 === s && (e = n[t.charCodeAt(r)] << 10 | n[t.charCodeAt(r + 1)] << 4 | n[t.charCodeAt(r + 2)] >> 2, a[l++] = e >> 8 & 255, a[l++] = 255 & e), a
                }, e.fromByteArray = function(t) {
                    for (var e, n = t.length, i = n % 3, o = [], u = 0, s = n - i; u < s; u += 16383) o.push(function(t, e, n) {
                        for (var i, o = [], u = e; u < n; u += 3) i = (t[u] << 16 & 0xff0000) + (t[u + 1] << 8 & 65280) + (255 & t[u + 2]), o.push(r[i >> 18 & 63] + r[i >> 12 & 63] + r[i >> 6 & 63] + r[63 & i]);
                        return o.join("")
                    }(t, u, u + 16383 > s ? s : u + 16383));
                    return 1 === i ? o.push(r[(e = t[n - 1]) >> 2] + r[e << 4 & 63] + "==") : 2 === i && o.push(r[(e = (t[n - 2] << 8) + t[n - 1]) >> 10] + r[e >> 4 & 63] + r[e << 2 & 63] + "="), o.join("")
                };
                for (var r = [], n = [], i = "u" > typeof Uint8Array ? Uint8Array : Array, o = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", u = 0, s = o.length; u < s; ++u) r[u] = o[u], n[o.charCodeAt(u)] = u;

                function f(t) {
                    var e = t.length;
                    if (e % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var r = t.indexOf("="); - 1 === r && (r = e);
                    var n = r === e ? 0 : 4 - r % 4;
                    return [r, n]
                }
                n[45] = 62, n[95] = 63
            },
            230: function(t, e, r) {
                "use strict";
                var n = r(872),
                    i = r(321),
                    o = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function u(t) {
                    if (t > 0x7fffffff) throw RangeError('The value "' + t + '" is invalid for option "size"');
                    var e = new Uint8Array(t);
                    return Object.setPrototypeOf(e, s.prototype), e
                }

                function s(t, e, r) {
                    if ("number" == typeof t) {
                        if ("string" == typeof e) throw TypeError('The "string" argument must be of type string. Received type number');
                        return l(t)
                    }
                    return f(t, e, r)
                }

                function f(t, e, r) {
                    if ("string" == typeof t) {
                        var n = t,
                            i = e;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !s.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var o = 0 | c(n, i),
                            f = u(o),
                            a = f.write(n, i);
                        return a !== o && (f = f.slice(0, a)), f
                    }
                    if (ArrayBuffer.isView(t)) return h(t);
                    if (null == t) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof t);
                    if (I(t, ArrayBuffer) || t && I(t.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (I(t, SharedArrayBuffer) || t && I(t.buffer, SharedArrayBuffer))) return function(t, e, r) {
                        var n;
                        if (e < 0 || t.byteLength < e) throw RangeError('"offset" is outside of buffer bounds');
                        if (t.byteLength < e + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                        return Object.setPrototypeOf(n = void 0 === e && void 0 === r ? new Uint8Array(t) : void 0 === r ? new Uint8Array(t, e) : new Uint8Array(t, e, r), s.prototype), n
                    }(t, e, r);
                    if ("number" == typeof t) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var l = t.valueOf && t.valueOf();
                    if (null != l && l !== t) return s.from(l, e, r);
                    var y = function(t) {
                        if (s.isBuffer(t)) {
                            var e = 0 | p(t.length),
                                r = u(e);
                            return 0 === r.length || t.copy(r, 0, 0, e), r
                        }
                        return void 0 !== t.length ? "number" != typeof t.length || function(t) {
                            return t != t
                        }(t.length) ? u(0) : h(t) : "Buffer" === t.type && Array.isArray(t.data) ? h(t.data) : void 0
                    }(t);
                    if (y) return y;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof t[Symbol.toPrimitive]) return s.from(t[Symbol.toPrimitive]("string"), e, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof t)
                }

                function a(t) {
                    if ("number" != typeof t) throw TypeError('"size" argument must be of type number');
                    if (t < 0) throw RangeError('The value "' + t + '" is invalid for option "size"')
                }

                function l(t) {
                    return a(t), u(t < 0 ? 0 : 0 | p(t))
                }

                function h(t) {
                    for (var e = t.length < 0 ? 0 : 0 | p(t.length), r = u(e), n = 0; n < e; n += 1) r[n] = 255 & t[n];
                    return r
                }
                e.Buffer = s, e.SlowBuffer = function(t) {
                    return +t != t && (t = 0), s.alloc(+t)
                }, e.INSPECT_MAX_BYTES = 50, e.kMaxLength = 0x7fffffff, s.TYPED_ARRAY_SUPPORT = function() {
                    try {
                        var t = new Uint8Array(1),
                            e = {
                                foo: function() {
                                    return 42
                                }
                            };
                        return Object.setPrototypeOf(e, Uint8Array.prototype), Object.setPrototypeOf(t, e), 42 === t.foo()
                    } catch (t) {
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
                }), s.poolSize = 8192, s.from = function(t, e, r) {
                    return f(t, e, r)
                }, Object.setPrototypeOf(s.prototype, Uint8Array.prototype), Object.setPrototypeOf(s, Uint8Array), s.alloc = function(t, e, r) {
                    return (a(t), t <= 0) ? u(t) : void 0 !== e ? "string" == typeof r ? u(t).fill(e, r) : u(t).fill(e) : u(t)
                }, s.allocUnsafe = function(t) {
                    return l(t)
                }, s.allocUnsafeSlow = function(t) {
                    return l(t)
                };

                function p(t) {
                    if (t >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | t
                }

                function c(t, e) {
                    if (s.isBuffer(t)) return t.length;
                    if (ArrayBuffer.isView(t) || I(t, ArrayBuffer)) return t.byteLength;
                    if ("string" != typeof t) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + typeof t);
                    var r = t.length,
                        n = arguments.length > 2 && !0 === arguments[2];
                    if (!n && 0 === r) return 0;
                    for (var i = !1;;) switch (e) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return r;
                        case "utf8":
                        case "utf-8":
                            return x(t).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return S(t).length;
                        default:
                            if (i) return n ? -1 : x(t).length;
                            e = ("" + e).toLowerCase(), i = !0
                    }
                }

                function y(t, e, r) {
                    var i, o, u, s = !1;
                    if ((void 0 === e || e < 0) && (e = 0), e > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (e >>>= 0))) return "";
                    for (t || (t = "utf8");;) switch (t) {
                        case "hex":
                            return function(t, e, r) {
                                var n = t.length;
                                (!e || e < 0) && (e = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var i = "", o = e; o < r; ++o) i += U[t[o]];
                                return i
                            }(this, e, r);
                        case "utf8":
                        case "utf-8":
                            return m(this, e, r);
                        case "ascii":
                            return function(t, e, r) {
                                var n = "";
                                r = Math.min(t.length, r);
                                for (var i = e; i < r; ++i) n += String.fromCharCode(127 & t[i]);
                                return n
                            }(this, e, r);
                        case "latin1":
                        case "binary":
                            return function(t, e, r) {
                                var n = "";
                                r = Math.min(t.length, r);
                                for (var i = e; i < r; ++i) n += String.fromCharCode(t[i]);
                                return n
                            }(this, e, r);
                        case "base64":
                            return i = this, o = e, u = r, 0 === o && u === i.length ? n.fromByteArray(i) : n.fromByteArray(i.slice(o, u));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(t, e, r) {
                                for (var n = t.slice(e, r), i = "", o = 0; o < n.length; o += 2) i += String.fromCharCode(n[o] + 256 * n[o + 1]);
                                return i
                            }(this, e, r);
                        default:
                            if (s) throw TypeError("Unknown encoding: " + t);
                            t = (t + "").toLowerCase(), s = !0
                    }
                }

                function g(t, e, r) {
                    var n = t[e];
                    t[e] = t[r], t[r] = n
                }

                function d(t, e, r, n, i) {
                    var o;
                    if (0 === t.length) return -1;
                    if ("string" == typeof r ? (n = r, r = 0) : r > 0x7fffffff ? r = 0x7fffffff : r < -0x80000000 && (r = -0x80000000), (o = r *= 1) != o && (r = i ? 0 : t.length - 1), r < 0 && (r = t.length + r), r >= t.length)
                        if (i) return -1;
                        else r = t.length - 1;
                    else if (r < 0)
                        if (!i) return -1;
                        else r = 0;
                    if ("string" == typeof e && (e = s.from(e, n)), s.isBuffer(e)) return 0 === e.length ? -1 : v(t, e, r, n, i);
                    if ("number" == typeof e) {
                        if (e &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (i) return Uint8Array.prototype.indexOf.call(t, e, r);
                            else return Uint8Array.prototype.lastIndexOf.call(t, e, r);
                        return v(t, [e], r, n, i)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function v(t, e, r, n, i) {
                    var o, u = 1,
                        s = t.length,
                        f = e.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (t.length < 2 || e.length < 2) return -1;
                        u = 2, s /= 2, f /= 2, r /= 2
                    }

                    function a(t, e) {
                        return 1 === u ? t[e] : t.readUInt16BE(e * u)
                    }
                    if (i) {
                        var l = -1;
                        for (o = r; o < s; o++)
                            if (a(t, o) === a(e, -1 === l ? 0 : o - l)) {
                                if (-1 === l && (l = o), o - l + 1 === f) return l * u
                            } else - 1 !== l && (o -= o - l), l = -1
                    } else
                        for (r + f > s && (r = s - f), o = r; o >= 0; o--) {
                            for (var h = !0, p = 0; p < f; p++)
                                if (a(t, o + p) !== a(e, p)) {
                                    h = !1;
                                    break
                                } if (h) return o
                        }
                    return -1
                }
                s.isBuffer = function(t) {
                    return null != t && !0 === t._isBuffer && t !== s.prototype
                }, s.compare = function(t, e) {
                    if (I(t, Uint8Array) && (t = s.from(t, t.offset, t.byteLength)), I(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), !s.isBuffer(t) || !s.isBuffer(e)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (t === e) return 0;
                    for (var r = t.length, n = e.length, i = 0, o = Math.min(r, n); i < o; ++i)
                        if (t[i] !== e[i]) {
                            r = t[i], n = e[i];
                            break
                        } return r < n ? -1 : +(n < r)
                }, s.isEncoding = function(t) {
                    switch (String(t).toLowerCase()) {
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
                }, s.concat = function(t, e) {
                    if (!Array.isArray(t)) throw TypeError('"list" argument must be an Array of Buffers');
                    if (0 === t.length) return s.alloc(0);
                    if (void 0 === e)
                        for (r = 0, e = 0; r < t.length; ++r) e += t[r].length;
                    var r, n = s.allocUnsafe(e),
                        i = 0;
                    for (r = 0; r < t.length; ++r) {
                        var o = t[r];
                        if (I(o, Uint8Array) && (o = s.from(o)), !s.isBuffer(o)) throw TypeError('"list" argument must be an Array of Buffers');
                        o.copy(n, i), i += o.length
                    }
                    return n
                }, s.byteLength = c, s.prototype._isBuffer = !0, s.prototype.swap16 = function() {
                    var t = this.length;
                    if (t % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var e = 0; e < t; e += 2) g(this, e, e + 1);
                    return this
                }, s.prototype.swap32 = function() {
                    var t = this.length;
                    if (t % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var e = 0; e < t; e += 4) g(this, e, e + 3), g(this, e + 1, e + 2);
                    return this
                }, s.prototype.swap64 = function() {
                    var t = this.length;
                    if (t % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var e = 0; e < t; e += 8) g(this, e, e + 7), g(this, e + 1, e + 6), g(this, e + 2, e + 5), g(this, e + 3, e + 4);
                    return this
                }, s.prototype.toString = function() {
                    var t = this.length;
                    return 0 === t ? "" : 0 == arguments.length ? m(this, 0, t) : y.apply(this, arguments)
                }, s.prototype.toLocaleString = s.prototype.toString, s.prototype.equals = function(t) {
                    if (!s.isBuffer(t)) throw TypeError("Argument must be a Buffer");
                    return this === t || 0 === s.compare(this, t)
                }, s.prototype.inspect = function() {
                    var t = "",
                        r = e.INSPECT_MAX_BYTES;
                    return t = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (t += " ... "), "<Buffer " + t + ">"
                }, o && (s.prototype[o] = s.prototype.inspect), s.prototype.compare = function(t, e, r, n, i) {
                    if (I(t, Uint8Array) && (t = s.from(t, t.offset, t.byteLength)), !s.isBuffer(t)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + typeof t);
                    if (void 0 === e && (e = 0), void 0 === r && (r = t ? t.length : 0), void 0 === n && (n = 0), void 0 === i && (i = this.length), e < 0 || r > t.length || n < 0 || i > this.length) throw RangeError("out of range index");
                    if (n >= i && e >= r) return 0;
                    if (n >= i) return -1;
                    if (e >= r) return 1;
                    if (e >>>= 0, r >>>= 0, n >>>= 0, i >>>= 0, this === t) return 0;
                    for (var o = i - n, u = r - e, f = Math.min(o, u), a = this.slice(n, i), l = t.slice(e, r), h = 0; h < f; ++h)
                        if (a[h] !== l[h]) {
                            o = a[h], u = l[h];
                            break
                        } return o < u ? -1 : +(u < o)
                }, s.prototype.includes = function(t, e, r) {
                    return -1 !== this.indexOf(t, e, r)
                }, s.prototype.indexOf = function(t, e, r) {
                    return d(this, t, e, r, !0)
                }, s.prototype.lastIndexOf = function(t, e, r) {
                    return d(this, t, e, r, !1)
                };

                function m(t, e, r) {
                    r = Math.min(t.length, r);
                    for (var n = [], i = e; i < r;) {
                        var o, u, s, f, a = t[i],
                            l = null,
                            h = a > 239 ? 4 : a > 223 ? 3 : a > 191 ? 2 : 1;
                        if (i + h <= r) switch (h) {
                            case 1:
                                a < 128 && (l = a);
                                break;
                            case 2:
                                (192 & (o = t[i + 1])) == 128 && (f = (31 & a) << 6 | 63 & o) > 127 && (l = f);
                                break;
                            case 3:
                                o = t[i + 1], u = t[i + 2], (192 & o) == 128 && (192 & u) == 128 && (f = (15 & a) << 12 | (63 & o) << 6 | 63 & u) > 2047 && (f < 55296 || f > 57343) && (l = f);
                                break;
                            case 4:
                                o = t[i + 1], u = t[i + 2], s = t[i + 3], (192 & o) == 128 && (192 & u) == 128 && (192 & s) == 128 && (f = (15 & a) << 18 | (63 & o) << 12 | (63 & u) << 6 | 63 & s) > 65535 && f < 1114112 && (l = f)
                        }
                        null === l ? (l = 65533, h = 1) : l > 65535 && (l -= 65536, n.push(l >>> 10 & 1023 | 55296), l = 56320 | 1023 & l), n.push(l), i += h
                    }
                    var p = n,
                        c = p.length;
                    if (c <= 4096) return String.fromCharCode.apply(String, p);
                    for (var y = "", g = 0; g < c;) y += String.fromCharCode.apply(String, p.slice(g, g += 4096));
                    return y
                }

                function b(t, e, r) {
                    if (t % 1 != 0 || t < 0) throw RangeError("offset is not uint");
                    if (t + e > r) throw RangeError("Trying to access beyond buffer length")
                }

                function w(t, e, r, n, i, o) {
                    if (!s.isBuffer(t)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (e > i || e < o) throw RangeError('"value" argument is out of bounds');
                    if (r + n > t.length) throw RangeError("Index out of range")
                }

                function E(t, e, r, n, i, o) {
                    if (r + n > t.length || r < 0) throw RangeError("Index out of range")
                }

                function A(t, e, r, n, o) {
                    return e *= 1, r >>>= 0, o || E(t, e, r, 4, 34028234663852886e22, -34028234663852886e22), i.write(t, e, r, n, 23, 4), r + 4
                }

                function B(t, e, r, n, o) {
                    return e *= 1, r >>>= 0, o || E(t, e, r, 8, 17976931348623157e292, -17976931348623157e292), i.write(t, e, r, n, 52, 8), r + 8
                }
                s.prototype.write = function(t, e, r, n) {
                    if (void 0 === e) n = "utf8", r = this.length, e = 0;
                    else if (void 0 === r && "string" == typeof e) n = e, r = this.length, e = 0;
                    else if (isFinite(e)) e >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var i, o, u, s, f, a, l, h, p = this.length - e;
                    if ((void 0 === r || r > p) && (r = p), t.length > 0 && (r < 0 || e < 0) || e > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var c = !1;;) switch (n) {
                        case "hex":
                            return function(t, e, r, n) {
                                r = Number(r) || 0;
                                var i = t.length - r;
                                n ? (n = Number(n)) > i && (n = i) : n = i;
                                var o = e.length;
                                n > o / 2 && (n = o / 2);
                                for (var u = 0; u < n; ++u) {
                                    var s, f = parseInt(e.substr(2 * u, 2), 16);
                                    if ((s = f) != s) break;
                                    t[r + u] = f
                                }
                                return u
                            }(this, t, e, r);
                        case "utf8":
                        case "utf-8":
                            return i = e, o = r, P(x(t, this.length - i), this, i, o);
                        case "ascii":
                            return u = e, s = r, P(T(t), this, u, s);
                        case "latin1":
                        case "binary":
                            return function(t, e, r, n) {
                                return P(T(e), t, r, n)
                            }(this, t, e, r);
                        case "base64":
                            return f = e, a = r, P(S(t), this, f, a);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return l = e, h = r, P(function(t, e) {
                                for (var r, n, i = [], o = 0; o < t.length && !((e -= 2) < 0); ++o) n = (r = t.charCodeAt(o)) >> 8, i.push(r % 256), i.push(n);
                                return i
                            }(t, this.length - l), this, l, h);
                        default:
                            if (c) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), c = !0
                    }
                }, s.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, s.prototype.slice = function(t, e) {
                    var r = this.length;
                    t = ~~t, e = void 0 === e ? r : ~~e, t < 0 ? (t += r) < 0 && (t = 0) : t > r && (t = r), e < 0 ? (e += r) < 0 && (e = 0) : e > r && (e = r), e < t && (e = t);
                    var n = this.subarray(t, e);
                    return Object.setPrototypeOf(n, s.prototype), n
                }, s.prototype.readUIntLE = function(t, e, r) {
                    t >>>= 0, e >>>= 0, r || b(t, e, this.length);
                    for (var n = this[t], i = 1, o = 0; ++o < e && (i *= 256);) n += this[t + o] * i;
                    return n
                }, s.prototype.readUIntBE = function(t, e, r) {
                    t >>>= 0, e >>>= 0, r || b(t, e, this.length);
                    for (var n = this[t + --e], i = 1; e > 0 && (i *= 256);) n += this[t + --e] * i;
                    return n
                }, s.prototype.readUInt8 = function(t, e) {
                    return t >>>= 0, e || b(t, 1, this.length), this[t]
                }, s.prototype.readUInt16LE = function(t, e) {
                    return t >>>= 0, e || b(t, 2, this.length), this[t] | this[t + 1] << 8
                }, s.prototype.readUInt16BE = function(t, e) {
                    return t >>>= 0, e || b(t, 2, this.length), this[t] << 8 | this[t + 1]
                }, s.prototype.readUInt32LE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), (this[t] | this[t + 1] << 8 | this[t + 2] << 16) + 0x1000000 * this[t + 3]
                }, s.prototype.readUInt32BE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), 0x1000000 * this[t] + (this[t + 1] << 16 | this[t + 2] << 8 | this[t + 3])
                }, s.prototype.readIntLE = function(t, e, r) {
                    t >>>= 0, e >>>= 0, r || b(t, e, this.length);
                    for (var n = this[t], i = 1, o = 0; ++o < e && (i *= 256);) n += this[t + o] * i;
                    return n >= (i *= 128) && (n -= Math.pow(2, 8 * e)), n
                }, s.prototype.readIntBE = function(t, e, r) {
                    t >>>= 0, e >>>= 0, r || b(t, e, this.length);
                    for (var n = e, i = 1, o = this[t + --n]; n > 0 && (i *= 256);) o += this[t + --n] * i;
                    return o >= (i *= 128) && (o -= Math.pow(2, 8 * e)), o
                }, s.prototype.readInt8 = function(t, e) {
                    return (t >>>= 0, e || b(t, 1, this.length), 128 & this[t]) ? -((255 - this[t] + 1) * 1) : this[t]
                }, s.prototype.readInt16LE = function(t, e) {
                    t >>>= 0, e || b(t, 2, this.length);
                    var r = this[t] | this[t + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, s.prototype.readInt16BE = function(t, e) {
                    t >>>= 0, e || b(t, 2, this.length);
                    var r = this[t + 1] | this[t] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, s.prototype.readInt32LE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), this[t] | this[t + 1] << 8 | this[t + 2] << 16 | this[t + 3] << 24
                }, s.prototype.readInt32BE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), this[t] << 24 | this[t + 1] << 16 | this[t + 2] << 8 | this[t + 3]
                }, s.prototype.readFloatLE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), i.read(this, t, !0, 23, 4)
                }, s.prototype.readFloatBE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), i.read(this, t, !1, 23, 4)
                }, s.prototype.readDoubleLE = function(t, e) {
                    return t >>>= 0, e || b(t, 8, this.length), i.read(this, t, !0, 52, 8)
                }, s.prototype.readDoubleBE = function(t, e) {
                    return t >>>= 0, e || b(t, 8, this.length), i.read(this, t, !1, 52, 8)
                }, s.prototype.writeUIntLE = function(t, e, r, n) {
                    if (t *= 1, e >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        w(this, t, e, r, i, 0)
                    }
                    var o = 1,
                        u = 0;
                    for (this[e] = 255 & t; ++u < r && (o *= 256);) this[e + u] = t / o & 255;
                    return e + r
                }, s.prototype.writeUIntBE = function(t, e, r, n) {
                    if (t *= 1, e >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        w(this, t, e, r, i, 0)
                    }
                    var o = r - 1,
                        u = 1;
                    for (this[e + o] = 255 & t; --o >= 0 && (u *= 256);) this[e + o] = t / u & 255;
                    return e + r
                }, s.prototype.writeUInt8 = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 1, 255, 0), this[e] = 255 & t, e + 1
                }, s.prototype.writeUInt16LE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 2, 65535, 0), this[e] = 255 & t, this[e + 1] = t >>> 8, e + 2
                }, s.prototype.writeUInt16BE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 2, 65535, 0), this[e] = t >>> 8, this[e + 1] = 255 & t, e + 2
                }, s.prototype.writeUInt32LE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 4, 0xffffffff, 0), this[e + 3] = t >>> 24, this[e + 2] = t >>> 16, this[e + 1] = t >>> 8, this[e] = 255 & t, e + 4
                }, s.prototype.writeUInt32BE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 4, 0xffffffff, 0), this[e] = t >>> 24, this[e + 1] = t >>> 16, this[e + 2] = t >>> 8, this[e + 3] = 255 & t, e + 4
                }, s.prototype.writeIntLE = function(t, e, r, n) {
                    if (t *= 1, e >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        w(this, t, e, r, i - 1, -i)
                    }
                    var o = 0,
                        u = 1,
                        s = 0;
                    for (this[e] = 255 & t; ++o < r && (u *= 256);) t < 0 && 0 === s && 0 !== this[e + o - 1] && (s = 1), this[e + o] = (t / u | 0) - s & 255;
                    return e + r
                }, s.prototype.writeIntBE = function(t, e, r, n) {
                    if (t *= 1, e >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        w(this, t, e, r, i - 1, -i)
                    }
                    var o = r - 1,
                        u = 1,
                        s = 0;
                    for (this[e + o] = 255 & t; --o >= 0 && (u *= 256);) t < 0 && 0 === s && 0 !== this[e + o + 1] && (s = 1), this[e + o] = (t / u | 0) - s & 255;
                    return e + r
                }, s.prototype.writeInt8 = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 1, 127, -128), t < 0 && (t = 255 + t + 1), this[e] = 255 & t, e + 1
                }, s.prototype.writeInt16LE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 2, 32767, -32768), this[e] = 255 & t, this[e + 1] = t >>> 8, e + 2
                }, s.prototype.writeInt16BE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 2, 32767, -32768), this[e] = t >>> 8, this[e + 1] = 255 & t, e + 2
                }, s.prototype.writeInt32LE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 4, 0x7fffffff, -0x80000000), this[e] = 255 & t, this[e + 1] = t >>> 8, this[e + 2] = t >>> 16, this[e + 3] = t >>> 24, e + 4
                }, s.prototype.writeInt32BE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 4, 0x7fffffff, -0x80000000), t < 0 && (t = 0xffffffff + t + 1), this[e] = t >>> 24, this[e + 1] = t >>> 16, this[e + 2] = t >>> 8, this[e + 3] = 255 & t, e + 4
                }, s.prototype.writeFloatLE = function(t, e, r) {
                    return A(this, t, e, !0, r)
                }, s.prototype.writeFloatBE = function(t, e, r) {
                    return A(this, t, e, !1, r)
                }, s.prototype.writeDoubleLE = function(t, e, r) {
                    return B(this, t, e, !0, r)
                }, s.prototype.writeDoubleBE = function(t, e, r) {
                    return B(this, t, e, !1, r)
                }, s.prototype.copy = function(t, e, r, n) {
                    if (!s.isBuffer(t)) throw TypeError("argument should be a Buffer");
                    if (r || (r = 0), n || 0 === n || (n = this.length), e >= t.length && (e = t.length), e || (e = 0), n > 0 && n < r && (n = r), n === r || 0 === t.length || 0 === this.length) return 0;
                    if (e < 0) throw RangeError("targetStart out of bounds");
                    if (r < 0 || r >= this.length) throw RangeError("Index out of range");
                    if (n < 0) throw RangeError("sourceEnd out of bounds");
                    n > this.length && (n = this.length), t.length - e < n - r && (n = t.length - e + r);
                    var i = n - r;
                    if (this === t && "function" == typeof Uint8Array.prototype.copyWithin) this.copyWithin(e, r, n);
                    else if (this === t && r < e && e < n)
                        for (var o = i - 1; o >= 0; --o) t[o + e] = this[o + r];
                    else Uint8Array.prototype.set.call(t, this.subarray(r, n), e);
                    return i
                }, s.prototype.fill = function(t, e, r, n) {
                    if ("string" == typeof t) {
                        if ("string" == typeof e ? (n = e, e = 0, r = this.length) : "string" == typeof r && (n = r, r = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !s.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
                        if (1 === t.length) {
                            var i, o = t.charCodeAt(0);
                            ("utf8" === n && o < 128 || "latin1" === n) && (t = o)
                        }
                    } else "number" == typeof t ? t &= 255 : "boolean" == typeof t && (t = Number(t));
                    if (e < 0 || this.length < e || this.length < r) throw RangeError("Out of range index");
                    if (r <= e) return this;
                    if (e >>>= 0, r = void 0 === r ? this.length : r >>> 0, t || (t = 0), "number" == typeof t)
                        for (i = e; i < r; ++i) this[i] = t;
                    else {
                        var u = s.isBuffer(t) ? t : s.from(t, n),
                            f = u.length;
                        if (0 === f) throw TypeError('The value "' + t + '" is invalid for argument "value"');
                        for (i = 0; i < r - e; ++i) this[i + e] = u[i % f]
                    }
                    return this
                };
                var C = /[^+/0-9A-Za-z-_]/g;

                function x(t, e) {
                    e = e || 1 / 0;
                    for (var r, n = t.length, i = null, o = [], u = 0; u < n; ++u) {
                        if ((r = t.charCodeAt(u)) > 55295 && r < 57344) {
                            if (!i) {
                                if (r > 56319 || u + 1 === n) {
                                    (e -= 3) > -1 && o.push(239, 191, 189);
                                    continue
                                }
                                i = r;
                                continue
                            }
                            if (r < 56320) {
                                (e -= 3) > -1 && o.push(239, 191, 189), i = r;
                                continue
                            }
                            r = (i - 55296 << 10 | r - 56320) + 65536
                        } else i && (e -= 3) > -1 && o.push(239, 191, 189);
                        if (i = null, r < 128) {
                            if ((e -= 1) < 0) break;
                            o.push(r)
                        } else if (r < 2048) {
                            if ((e -= 2) < 0) break;
                            o.push(r >> 6 | 192, 63 & r | 128)
                        } else if (r < 65536) {
                            if ((e -= 3) < 0) break;
                            o.push(r >> 12 | 224, r >> 6 & 63 | 128, 63 & r | 128)
                        } else if (r < 1114112) {
                            if ((e -= 4) < 0) break;
                            o.push(r >> 18 | 240, r >> 12 & 63 | 128, r >> 6 & 63 | 128, 63 & r | 128)
                        } else throw Error("Invalid code point")
                    }
                    return o
                }

                function T(t) {
                    for (var e = [], r = 0; r < t.length; ++r) e.push(255 & t.charCodeAt(r));
                    return e
                }

                function S(t) {
                    return n.toByteArray(function(t) {
                        if ((t = (t = t.split("=")[0]).trim().replace(C, "")).length < 2) return "";
                        for (; t.length % 4 != 0;) t += "=";
                        return t
                    }(t))
                }

                function P(t, e, r, n) {
                    for (var i = 0; i < n && !(i + r >= e.length) && !(i >= t.length); ++i) e[i + r] = t[i];
                    return i
                }

                function I(t, e) {
                    return t instanceof e || null != t && null != t.constructor && null != t.constructor.name && t.constructor.name === e.name
                }
                var U = function() {
                    for (var t = "0123456789abcdef", e = Array(256), r = 0; r < 16; ++r)
                        for (var n = 16 * r, i = 0; i < 16; ++i) e[n + i] = t[r] + t[i];
                    return e
                }()
            },
            321: function(t, e) {
                e.read = function(t, e, r, n, i) {
                    var o, u, s = 8 * i - n - 1,
                        f = (1 << s) - 1,
                        a = f >> 1,
                        l = -7,
                        h = r ? i - 1 : 0,
                        p = r ? -1 : 1,
                        c = t[e + h];
                    for (h += p, o = c & (1 << -l) - 1, c >>= -l, l += s; l > 0; o = 256 * o + t[e + h], h += p, l -= 8);
                    for (u = o & (1 << -l) - 1, o >>= -l, l += n; l > 0; u = 256 * u + t[e + h], h += p, l -= 8);
                    if (0 === o) o = 1 - a;
                    else {
                        if (o === f) return u ? NaN : 1 / 0 * (c ? -1 : 1);
                        u += Math.pow(2, n), o -= a
                    }
                    return (c ? -1 : 1) * u * Math.pow(2, o - n)
                }, e.write = function(t, e, r, n, i, o) {
                    var u, s, f, a = 8 * o - i - 1,
                        l = (1 << a) - 1,
                        h = l >> 1,
                        p = 5960464477539062e-23 * (23 === i),
                        c = n ? 0 : o - 1,
                        y = n ? 1 : -1,
                        g = +(e < 0 || 0 === e && 1 / e < 0);
                    for (isNaN(e = Math.abs(e)) || e === 1 / 0 ? (s = +!!isNaN(e), u = l) : (u = Math.floor(Math.log(e) / Math.LN2), e * (f = Math.pow(2, -u)) < 1 && (u--, f *= 2), u + h >= 1 ? e += p / f : e += p * Math.pow(2, 1 - h), e * f >= 2 && (u++, f /= 2), u + h >= l ? (s = 0, u = l) : u + h >= 1 ? (s = (e * f - 1) * Math.pow(2, i), u += h) : (s = e * Math.pow(2, h - 1) * Math.pow(2, i), u = 0)); i >= 8; t[r + c] = 255 & s, c += y, s /= 256, i -= 8);
                    for (u = u << i | s, a += i; a > 0; t[r + c] = 255 & u, c += y, u /= 256, a -= 8);
                    t[r + c - y] |= 128 * g
                }
            }
        },
        i = {};

    function o(t) {
        var e = i[t];
        if (void 0 !== e) return e.exports;
        var r = i[t] = {
                exports: {}
            },
            u = !0;
        try {
            n[t](r, r.exports, o), u = !1
        } finally {
            u && delete i[t]
        }
        return r.exports
    }
    o.ab = "/ROOT/node_modules/.pnpm/next@16.3.0_@babel+core@7.29.0_supports-color@8.1.1__@opentelemetry+api@1.9.1_@playwrig_2bf1aa2500abc393a8e8c0b283d26d6e/node_modules/next/dist/compiled/buffer/", e.exports = o(230)
}, 725924, t => {
    "use strict";
    let e, r;
    var n, i, o = t.i(416340);
    let u = "u" > typeof Intl,
        s = !u || void 0 === Intl.Locale,
        f = !u || void 0 === Intl.RelativeTimeFormat,
        a = !u || void 0 === Intl.PluralRules,
        l = !u || void 0 === Intl.DisplayNames,
        h = "function" != typeof window.ResizeObserver,
        p = (n = s || f || a || l || h, i = function() {
            return Promise.all([(s ? t.A(361318).then(function(t) {
                return t.p
            }) : Promise.resolve()).then(() => Promise.all([f ? t.A(950511).then(function(t) {
                return t.p
            }).then(() => t.A(874521)) : null, a ? t.A(684498).then(function(t) {
                return t.p
            }).then(() => t.A(104943)) : null, l ? t.A(951862).then(() => t.A(890267)) : null])), h ? t.A(956827) : null])
        }, e = !1, r = n ? i().catch(() => {}).then(() => {
            e = !0
        }) : null, function() {
            let [t, n] = (0, o.useState)(!r || e);
            return (0, o.useEffect)(() => {
                r && !t && r.then(() => n(!0))
            }, [t]), t
        });
    t.s(["usePolyfills", 0, p], 725924)
}, 823062, t => {
    "use strict";
    var e = t.i(416340);
    let r = (0, e.createContext)(null),
        n = [],
        i = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        o = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function u() {
        let t = (0, e.useContext)(r);
        if (null === t) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return t
    }
    let s = () => null;
    t.s(["UnifiedLoggerProvider", 0, t => {
        var u;
        let {
            children: s,
            unifiedLogger: f,
            pageLoggerConfig: a,
            path: l,
            url: h,
            isReady: p = !0
        } = t, c = null != (u = null == a ? void 0 : a.tags) ? u : n, y = null == a ? void 0 : a.rosId, g = (0, e.useMemo)(() => ({
            tags: c,
            rosId: y,
            path: l,
            url: h,
            isReady: p
        }), [c, y, l, h, p]), d = (0, e.useRef)(g), v = (0, e.useRef)(g);
        (0, e.useLayoutEffect)(() => {
            v.current = g, void 0 === d.current.path && void 0 !== g.path && (d.current = {
                ...d.current,
                path: g.path
            })
        }, [g]), (0, e.useLayoutEffect)(() => {
            let t = t => {
                var e;
                let r, n = (r = null == (e = t.parameters) ? void 0 : e.metricName, "webvitals" === t.eventType && void 0 !== r && o.has(r)) ? d.current : v.current;
                void 0 !== n.path && (t.parameters = {
                    ...t.parameters,
                    path: n.path
                }), n.tags.forEach(e => t.addTag(e)), void 0 !== n.rosId && t.addTag("owner: ".concat(n.rosId))
            };
            return i.forEach(e => {
                f.events.on(e, t)
            }), () => {
                i.forEach(e => {
                    f.events.off(e, t)
                })
            }
        }, [f]);
        let m = (0, e.useMemo)(() => ({
            unifiedLogger: f,
            pageContext: g
        }), [f, g]);
        return e.default.createElement(r.Provider, {
            value: m
        }, s)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, e.useContext)(r)
    }, "usePageSettled", 0, t => {
        let {
            unifiedLogger: r,
            pageContext: n
        } = u(), {
            path: i,
            url: o,
            isReady: f
        } = n, a = r.pageSettledTracker, l = (0, e.useSyncExternalStore)(a.subscribe, a.getSnapshot, s);
        (0, e.useEffect)(() => {
            if (!l || l.isNavigating || !f || !i || !o || !t || l.url.split(/[?#]/)[0] !== o.split(/[?#]/)[0]) return;
            let e = new URL(i, window.location.origin).pathname,
                n = requestAnimationFrame(() => {
                    n = requestAnimationFrame(() => {
                        r.logPageSettledEvent({
                            navigationId: l.id,
                            page: e,
                            outcome: t
                        })
                    })
                });
            return () => cancelAnimationFrame(n)
        }, [l, f, o, i, t, r])
    }, "useUnifiedLoggerProvider", 0, u])
}]);

//# debugId=998969c6-43f6-1318-39ff-b5eac80e168d
//# sourceMappingURL=1s74zpn3z348l.js.map