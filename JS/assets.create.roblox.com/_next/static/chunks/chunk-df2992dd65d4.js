;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e52fcdff-50fd-a2c2-688a-0aeece1ec91e")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 748348, (e, t, n) => {
    let i = "/dashboard/creations";
    (window.__NEXT_P = window.__NEXT_P || []).push([i, () => e.r(962059)]), t.hot && t.hot.dispose(function() {
        window.__NEXT_P.push([i])
    })
}, 962059, e => {
    "use strict";
    var t, n, i = e.i(785517),
        a = e.i(643766),
        r = e.i(203450),
        o = e.i(384621),
        s = e.i(138726),
        l = e.i(341260),
        u = e.i(500758),
        d = e.i(79187),
        c = e.i(134731),
        m = e.i(671376),
        p = e.i(927868),
        f = e.i(692587),
        h = e.i(85057),
        v = e.i(745873),
        g = e.i(130778),
        x = e.i(211461),
        y = e.i(723538),
        b = e.i(117236),
        I = e.i(427149),
        w = e.i(9436);
    let C = () => {
            let {
                ready: e,
                value: t
            } = (0, u.f)(w.t);
            if (e) return t
        },
        T = "creation-",
        j = {
            [m.f.Place]: "Label.Experiences",
            [m.f.ShareLink]: "Heading.ShareLinks",
            [m.f.TShirt]: "Label.AvatarItems",
            [m.f.Decal]: "Label.DevelopmentItems",
            [m.f.Moments]: "Label.Moments"
        },
        S = "".concat(T).concat(m.f.Decal);

    function M() {
        let e = (0, l.useRouter)(),
            {
                translate: t
            } = (0, d.A)(),
            n = (0, v.W)(),
            i = C(),
            {
                value: r
            } = (0, u.f)(c.E),
            o = (0, y.f)(),
            s = (0, a.useMemo)(() => (t, n, i) => {
                let a = new URLSearchParams,
                    r = (0, f.d)(e.query.groupId);
                r && a.set("groupId", r), t && a.set("activeTab", t), i && a.set("inventoryAssetTypes", i), void 0 !== n && a.set("filterIndex", String(n));
                let o = a.toString();
                return o ? "/dashboard/creations?".concat(o) : "/dashboard/creations"
            }, [e.query.groupId]),
            h = (0, a.useMemo)(() => b.U.filter(e => e.type !== m.f.AssetPermissionRequests || r).filter(e => I.f.isMenuItemEnabled(e, n, void 0, void 0, i)).map(e => {
                var n, i, a;
                let r = e.type === m.f.Decal,
                    l = null != (n = null == (a = e.submenuItems) || null == (i = a[0]) ? void 0 : i.type) ? n : e.type,
                    u = j[e.type],
                    d = e.type === m.f.TShirt,
                    c = o ? g.a : m.f.AvatarLooks;
                return {
                    key: "".concat(T).concat(e.type),
                    label: u ? t(u) : t(e.nameKey),
                    href: e.type === m.f.Place ? s() : s(d ? c : l, d ? 0 : void 0, r ? x.G.All : void 0)
                }
            }), [s, n, r, i, o, t]),
            w = (0, a.useMemo)(() => {
                var t;
                let n, i = (0, g.z)(e.query.activeTab) || (0, g.q)(e.query.activeTab),
                    a = I.f.getMenuState(i ? g.K : (t = e.query.activeTab, void 0 !== (n = (0, f.d)(t)) && (0, p.s)(m.f, n) ? n : void 0), []);
                return "".concat(T).concat(a.menuItem.type)
            }, [e.query.activeTab]);
        return {
            activeItem: (0, a.useMemo)(() => h.find(e => e.key === w), [w, h]),
            activeKey: w,
            homeHref: s(),
            isDevelopmentItemsActive: w === S,
            items: h
        }
    }
    let k = () => {
        let {
            translate: e
        } = (0, d.A)(), {
            activeKey: t,
            items: n
        } = M();
        return (0, i.jsx)(h.f, {
            header: e("Heading.Creations"),
            activeKey: t,
            items: n
        })
    };
    var E = e.i(746878),
        P = e.i(225885),
        A = e.i(695746),
        L = e.i(335020);
    let N = () => a.default.createElement("div", {
            className: "flex items-center justify-center shrink-0 width-600"
        }, a.default.createElement("span", {
            className: "text-body-medium content-default"
        }, "/")),
        R = e => {
            let {
                item: t,
                isActive: n
            } = e, {
                label: i,
                href: r,
                leadingIcon: o,
                mediaSrc: s,
                onClick: l
            } = t, u = a.default.createElement("div", {
                className: (0, L.U)("flex items-center gap-small shrink-0 height-600")
            }, o && a.default.createElement(E.f, {
                name: o,
                size: "XSmall",
                className: "content-emphasis"
            }), s && a.default.createElement("div", {
                className: "shrink-0 size-500"
            }, a.default.createElement(A.f, {
                src: s,
                alt: i,
                aspectRatio: "1:1",
                containerClassName: "radius-small clip"
            })), a.default.createElement("span", {
                className: (0, L.U)("text-no-wrap", {
                    "content-emphasis text-title-medium": n,
                    "content-default text-body-medium": !n
                })
            }, i));
            return r && !n ? a.default.createElement("a", {
                href: r,
                onClick: l,
                className: (0, L.U)("flex items-center shrink-0 focus-visible:outline-focus radius-small"),
                style: {
                    textDecoration: "none"
                }
            }, u) : l && !n ? a.default.createElement("button", {
                type: "button",
                onClick: l,
                className: (0, L.U)("flex items-center shrink-0 cursor-pointer padding-none bg-none focus-visible:outline-focus radius-small"),
                style: {
                    border: "none"
                }
            }, u) : a.default.createElement("div", {
                className: "flex items-center shrink-0",
                "aria-current": n ? "page" : void 0
            }, u)
        },
        U = e => {
            let {
                items: t,
                maxItems: n,
                ariaLabel: i,
                expansionAriaLabel: r,
                className: o,
                ...s
            } = e, [l, u] = (0, a.useState)(!1), d = null != n && t.length > n && !l, c = t, m = !1;
            d && (c = [t[0], t[t.length - 1]], m = !0);
            let p = () => {
                u(!0)
            };
            return a.default.createElement("nav", {
                "aria-label": i,
                className: (0, L.U)("flex items-center height-1000", o),
                ...s
            }, a.default.createElement("ol", {
                className: "flex items-center padding-none margin-none gap-none",
                style: {
                    listStyle: "none"
                }
            }, c.map((e, t) => {
                let n = t === c.length - 1;
                return a.default.createElement(a.default.Fragment, {
                    key: e.href || "".concat(e.label, "-").concat(t)
                }, m && 1 === t && a.default.createElement(a.default.Fragment, null, a.default.createElement("li", null, a.default.createElement(P.f, {
                    icon: "icon-filled-three-dots-horizontal",
                    ariaLabel: r,
                    size: "XSmall",
                    variant: "Standard",
                    onClick: p,
                    className: "size-600 min-height-600 max-height-600"
                })), a.default.createElement("li", null, a.default.createElement(N, null))), a.default.createElement("li", null, a.default.createElement(R, {
                    item: e,
                    isActive: n
                })), t < c.length - 1 && a.default.createElement("li", null, a.default.createElement(N, null)))
            })))
        };
    U.displayName = "Breadcrumbs";
    var O = e.i(725509);
    let D = e => {
        let {
            creationsHref: t,
            creationsLabel: n,
            currentLabel: r
        } = e, o = (0, l.useRouter)(), s = (0, O.f)(), u = (0, a.useMemo)(() => [{
            href: t,
            label: n,
            onClick: e => {
                e.altKey || e.ctrlKey || e.metaKey || e.shiftKey || (e.preventDefault(), o.push(t))
            }
        }, {
            label: r
        }], [t, n, r, o]);
        return (0, i.jsx)(U, {
            ariaLabel: s.breadcrumbs,
            className: "max-[600px]:[&_li:not(:first-child)]:[display:none]",
            expansionAriaLabel: s.showHiddenBreadcrumbs,
            items: u
        })
    };
    var _ = e.i(376204);
    let z = e => {
            let {
                fallback: t,
                ...n
            } = e, {
                isEnabled: a
            } = (0, _.f)();
            return a ? (0, i.jsx)(D, {
                ...n
            }) : t
        },
        q = () => {
            var e;
            let {
                translate: t
            } = (0, d.A)(), {
                activeItem: n,
                homeHref: a,
                isDevelopmentItemsActive: r
            } = M(), o = t("Heading.Creations"), s = (0, i.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: null != (e = null == n ? void 0 : n.label) ? e : o
            });
            return r && null != n ? (0, i.jsx)(z, {
                creationsHref: a,
                creationsLabel: o,
                currentLabel: n.label,
                fallback: s
            }) : s
        },
        V = (0, a.createContext)({
            isResolving: !1
        });
    var F = e.i(814975),
        B = e.i(252842),
        G = e.i(533414),
        H = e.i(456810);
    let K = {
            sort: H.K,
            sortOrder: B.f.Desc,
            isArchived: !1,
            isPublishOnly: !1,
            isOnMarketplace: !1
        },
        W = e => {
            let {
                children: t
            } = e, {
                user: n
            } = (0, F.f)(), [r, o] = (0, G.j)("creationSort.".concat(null == n ? void 0 : n.id), K.sort), s = (0, a.useRef)(r), l = (0, a.useMemo)(() => {
                let e = s.current;
                return Object.keys(r).some(t => r[t] !== e[t]) && (s.current = r), s.current
            }, [r]), [u, d] = (0, G.j)("creationSortOrder.".concat(null == n ? void 0 : n.id), K.sortOrder), [c, m] = (0, a.useState)(K.isArchived), [p, f] = (0, a.useState)(!1), [h, v] = (0, a.useState)(K.isPublishOnly), [g, x] = (0, a.useState)(K.isOnMarketplace), y = (0, a.useCallback)(() => {
                o(K.sort), d(K.sortOrder), m(K.isArchived), f(!1), v(K.isPublishOnly), x(K.isOnMarketplace)
            }, [o, d]), b = (0, a.useMemo)(() => ({
                isArchived: c,
                isAgeRestrictedCollaboration: p,
                isOnMarketplace: g,
                isPublicOnly: h,
                resetAllFilters: y,
                setIsArchived: m,
                setIsAgeRestrictedCollaboration: f,
                setIsOnMarketplace: x,
                setIsPublicOnly: v,
                setSort: o,
                setSortOrder: d,
                sort: l,
                sortOrder: u
            }), [c, p, g, h, y, m, f, x, v, o, d, l, u]);
            return (0, i.jsx)(H.U.Provider, {
                value: b,
                children: t
            })
        };
    var X = e.i(668091),
        Y = e.i(458263),
        J = e.i(593430),
        Q = e.i(37819),
        Z = e.i(69230),
        $ = e.i(870999),
        ee = e.i(714039),
        et = e.i(896852),
        en = e.i(780880),
        ei = e.i(881670),
        ea = e.i(57798),
        er = e.i(845592),
        eo = e.i(339544),
        es = e.i(475642),
        el = e.i(609305),
        eu = e.i(177610),
        ed = e.i(41242),
        ec = e.i(211388);
    let em = "CreatorHub.MomentsCreations.local",
        ep = e => "".concat(em, ".").concat(e),
        ef = "".concat(em, ".__inactive__"),
        eh = "active",
        ev = "pending",
        eg = "draft",
        ex = "moderated",
        ey = [eh, eg],
        eb = [eh, ex, eg],
        eI = e => new Date(e.modifiedAt).getTime(),
        ew = "momentMedia",
        eC = async e => {
            let t = URL.createObjectURL(e),
                n = document.createElement("video");
            try {
                await new Promise((e, i) => {
                    n.preload = "metadata", n.muted = !0, n.playsInline = !0, n.addEventListener("loadeddata", () => {
                        n.currentTime = .1
                    }), n.addEventListener("seeked", () => {
                        e()
                    }, {
                        once: !0
                    }), n.addEventListener("error", () => {
                        i(Error("Failed to load video for thumbnail generation"))
                    }, {
                        once: !0
                    }), n.src = t, n.load()
                });
                let e = document.createElement("canvas");
                e.width = n.videoWidth || 1, e.height = n.videoHeight || 1;
                let i = e.getContext("2d");
                if (!i) throw Error("Failed to create canvas context for thumbnail generation");
                return i.drawImage(n, 0, 0, e.width, e.height), await new Promise((t, n) => {
                    e.toBlob(e => {
                        e ? t(e) : n(Error("Failed to encode video thumbnail"))
                    }, "image/jpeg", .82)
                })
            } finally {
                URL.revokeObjectURL(t), n.removeAttribute("src"), n.load()
            }
        }, eT = new Map, ej = (e, t) => "".concat(e, ":").concat(t), eS = (e, t, n) => new Promise((t, n) => {
            if ("u" < typeof indexedDB) return void n(Error("IndexedDB is unavailable"));
            let i = indexedDB.open("".concat("CreatorHub.MomentsVideoMedia", ".").concat(e), 1);
            i.addEventListener("upgradeneeded", () => {
                let e = i.result;
                e.objectStoreNames.contains(ew) || e.createObjectStore(ew, {
                    keyPath: "momentId"
                })
            }), i.addEventListener("success", () => t(i.result)), i.addEventListener("error", () => {
                var e;
                return n(null != (e = i.error) ? e : Error("Failed to open IndexedDB"))
            })
        }).then(e => new Promise((i, a) => {
            let r = n(e.transaction(ew, t).objectStore(ew));
            r.addEventListener("success", () => i(r.result)), r.addEventListener("error", () => {
                var e;
                return a(null != (e = r.error) ? e : Error("IndexedDB request failed"))
            })
        })), eM = e => "object" == typeof e && null !== e && "momentId" in e && "string" == typeof e.momentId && "videoBlob" in e && e.videoBlob instanceof Blob && "thumbnailBlob" in e && e.thumbnailBlob instanceof Blob && "updatedAt" in e && "string" == typeof e.updatedAt, ek = (e, t) => {
            let n = ej(e, t),
                i = eT.get(n);
            i && (URL.revokeObjectURL(i.thumbnailUrl), URL.revokeObjectURL(i.videoUrl), eT.delete(n))
        }, eE = async (e, t, n) => {
            let i = await eC(n),
                a = {
                    momentId: t,
                    videoBlob: n,
                    thumbnailBlob: i,
                    fileName: n.name,
                    updatedAt: new Date().toISOString()
                };
            ek(e, t), await eS(e, "readwrite", e => e.put(a))
        }, eP = new Set(["QuotaExceededError", "NS_ERROR_DOM_QUOTA_REACHED"]), eA = e => !!(e instanceof DOMException && eP.has(e.name)) || e instanceof Error && e.message.toLowerCase().includes("quota"), eL = async (e, t, n, i) => {
            let a = [],
                r = async () => {
                    await eE(e, t, n)
                };
            try {
                return await r(), {
                    evictedMediaDraftIds: a
                }
            } catch (e) {
                if (!eA(e)) throw e
            }
            for (let n of [...i.filter(e => e.draftId !== t && !1 !== e.hasLocalVideo)].sort((e, t) => eI(e) - eI(t))) {
                await eU(e, [n.draftId]), a.includes(n.draftId) || a.push(n.draftId);
                try {
                    return await r(), {
                        evictedMediaDraftIds: a
                    }
                } catch (e) {
                    if (!eA(e)) throw e
                }
            }
            throw Error("Failed to store moment video locally")
        };
    async function eN(e, t) {
        var n, i;
        let a, r = await eS(e, "readonly", e => e.get(t));
        if (!eM(r)) return null;
        let {
            videoBlob: o
        } = r;
        return new File([o], (a = null == (i = (n = r).fileName) ? void 0 : i.trim()) ? a : n.videoBlob.type.includes("quicktime") ? "moment.mov" : "moment.mp4", {
            type: o.type || "video/mp4"
        })
    }
    let eR = async (e, t) => {
        let n = ej(e, t),
            i = eT.get(n);
        if (i) return i;
        let a = await eS(e, "readonly", e => e.get(t));
        if (!eM(a)) return null;
        let r = {
            thumbnailUrl: URL.createObjectURL(a.thumbnailBlob),
            videoUrl: URL.createObjectURL(a.videoBlob)
        };
        return eT.set(n, r), r
    }, eU = async (e, t) => {
        0 !== t.length && await Promise.all(t.map(async t => {
            ek(e, t), await eS(e, "readwrite", e => e.delete(t))
        }))
    }, eO = {
        version: "1",
        moments: []
    }, eD = e => "object" == typeof e && null !== e && !Array.isArray(e), e_ = e => eD(e) && "1" === e.version && Array.isArray(e.moments) ? e.moments : [], ez = e => "string" == typeof e ? e : void 0, eq = e => "number" == typeof e && Number.isFinite(e) ? e : void 0, eV = new Set(Object.values(d.v)), eF = e => e_(e).map(e => (e => {
        var t, n, i, a, r, o;
        let s;
        if (!eD(e)) return null;
        let l = null != (t = ez(e.draftId)) ? t : ez(e.id);
        return null == l || "" === l || e.status !== eg ? null : {
            draftId: l,
            status: eg,
            experienceId: null != (n = eq(e.experienceId)) ? n : 0,
            rootPlaceId: eq(e.rootPlaceId),
            experienceName: null != (i = ez(e.experienceName)) ? i : "",
            description: null != (a = ez(e.description)) ? a : "",
            modifiedAt: null != (r = ez(e.modifiedAt)) ? r : new Date(0).toISOString(),
            assetId: eq(e.assetId),
            thumbnailUrl: ez(e.thumbnailUrl),
            videoUrl: ez(e.videoUrl),
            universeId: eq(e.universeId),
            locale: "string" == typeof(s = o = e.locale) && eV.has(s) ? o : void 0,
            ..."boolean" == typeof e.hasLocalVideo ? {
                hasLocalVideo: e.hasLocalVideo
            } : {}
        }
    })(e)).filter(e => null != e), eB = e => {
        if (!e) return [];
        try {
            let t = JSON.parse(e);
            return eF(t)
        } catch (e) {
            return []
        }
    }, eG = e => ({
        version: "1",
        moments: e
    }), eH = () => {
        let {
            user: e
        } = (0, F.f)(), t = null == e ? void 0 : e.id, n = null != t, i = n ? ep(t) : ef, [r, o] = (0, G.j)(i, eO), s = (0, a.useMemo)(() => n ? eF(r) : [], [n, r]);
        (0, a.useEffect)(() => {
            if (!n || null == t) return;
            let e = e_(r).filter(e => eD(e) && e.status !== eg).map(e => {
                var t, n;
                return eD(e) && null != (t = null != (n = ez(e.draftId)) ? n : ez(e.id)) ? t : ""
            }).filter(e => "" !== e);
            0 !== e.length && (o(eG(s)), eU(t, e))
        }, [n, s, r, o, t]);
        let l = (0, a.useCallback)((e, a) => {
                var r, s, l;
                if (!n || null == t || 0 === e.length) return {
                    moments: [],
                    evictedMediaDraftIds: []
                };
                let {
                    moments: u,
                    evictedMediaDraftIds: d
                } = (l = eB(window.localStorage.getItem(i)), {
                    moments: [...e.map(e => {
                        var t;
                        return {
                            ...e,
                            status: eg,
                            hasLocalVideo: null == (t = e.hasLocalVideo) || t
                        }
                    }), ...l].sort((e, t) => eI(t) - eI(e)),
                    evictedMediaDraftIds: []
                }), c = ((e, t) => {
                    if (0 === t.length) return [...e];
                    let n = new Set(t);
                    return e.map(e => n.has(e.draftId) ? {
                        ...e,
                        hasLocalVideo: !1
                    } : e)
                })(u, null != (r = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? r : []), m = [...new Set([...null != (s = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? s : [], ...d])];
                return o(eG(c)), m.length > 0 && eU(t, m), {
                    moments: c,
                    evictedMediaDraftIds: m
                }
            }, [n, o, i, t]),
            u = (0, a.useCallback)((e, t) => l([e], t), [l]),
            d = (0, a.useCallback)((e, i) => {
                if (!n || null == t) return null;
                let a = ((e, t, n) => {
                    let i = e.findIndex(e => e.draftId === t);
                    if (-1 === i) return null;
                    let a = [...e];
                    return a[i] = {
                        ...a[i],
                        ...n,
                        modifiedAt: new Date().toISOString()
                    }, a
                })(s, e, i);
                return a ? (o(eG(a)), a) : null
            }, [n, s, o, t]),
            c = (0, a.useCallback)(e => {
                if (!n || null == t) return null;
                let i = -1 === s.findIndex(t => t.draftId === e) ? null : s.filter(t => t.draftId !== e);
                return i ? (o(eG(i)), eU(t, [e]), i) : null
            }, [n, s, o, t]),
            m = (0, a.useCallback)(e => {
                if (!n || null == t) return null;
                let i = ((e, t) => {
                    let n = new Set(t);
                    if (0 === n.size) return null;
                    let i = e.filter(e => !n.has(e.draftId));
                    return i.length === e.length ? null : i
                })(s, e);
                if (!i) return null;
                let a = new Set(e),
                    r = s.filter(e => a.has(e.draftId)).map(e => e.draftId);
                return o(eG(i)), eU(t, r), i
            }, [n, s, o, t]);
        return {
            moments: s,
            addMoment: u,
            addMoments: l,
            updateMoment: d,
            removeMoment: c,
            removeMoments: m
        }
    };
    var eK = e.i(228096),
        eW = e.i(463146),
        eX = e.i(900496),
        eY = e.i(60584),
        eJ = e.i(910272),
        eQ = e.i(415858),
        eZ = function(e, t) {
            return (eZ = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function e$(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        eZ(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function e0(e, t, n, i) {
        return new(n || (n = Promise))(function(a, r) {
            function o(e) {
                try {
                    l(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    l(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, s)
            }
            l((i = i.apply(e, t || [])).next())
        })
    }

    function e1(e, t) {
        var n, i, a, r = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(l) {
                var u = [s, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (r = 0)), r;) try {
                    if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                    switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < a[1]) {
                                r.label = a[1], a = u;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(u);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], i = 0
                } finally {
                    n = a = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function e2(e) {
        if (void 0 !== e) return null === e ? null : {
            chunkNum: e.chunkNum,
            eTag: e.eTag
        }
    }

    function e4(e) {
        if (void 0 !== e) return null === e ? null : {
            role: e.role,
            operationId: e.operationId,
            parts: void 0 === e.parts ? void 0 : null === e.parts ? null : e.parts.map(e2)
        }
    }

    function e5(e) {
        if (void 0 !== e) return null === e ? null : {
            encryptedCreationContext: e.encryptedCreationContext,
            file: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    contentType: e.contentType,
                    filesizeBytes: e.filesizeBytes,
                    md5Checksum: e.md5Checksum,
                    chunkPlan: e.chunkPlan
                }
            }(e.file),
            displayName: e.displayName,
            description: e.description
        }
    }

    function e8(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function e3(e) {
        if (void 0 !== e) return null === e ? null : {
            position: e.position,
            rotation: e.rotation,
            scale: e.scale,
            text: e.text,
            textOverlayStyle: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    font: e.font,
                    fontColor: e.fontColor,
                    fontSize: e.fontSize,
                    textXAlignment: e.textXAlignment
                }
            }(e.textOverlayStyle),
            zIndex: e.zIndex
        }
    }

    function e7(e) {
        if (void 0 !== e) return null === e ? null : {
            text: e.text,
            voiceId: e.voiceId,
            pitch: e.pitch,
            speed: e.speed,
            startTime: e.startTime
        }
    }

    function e6(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId,
            text: e.text,
            contentDescription: e.contentDescription,
            seekStartTimeSeconds: e.seekStartTimeSeconds,
            seekEndTimeSeconds: e.seekEndTimeSeconds,
            trimStartTimeSeconds: e.trimStartTimeSeconds,
            trimEndTimeSeconds: e.trimEndTimeSeconds
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function e9(e, t) {
        return null == e ? e : {
            assetId: (0, eQ.u)(e, "assetId") ? e.assetId : void 0,
            startTime: (0, eQ.u)(e, "startTime") ? e.startTime : void 0
        }
    }

    function te(e) {
        var t;
        return null == (t = e) ? t : {
            position: (0, eQ.u)(t, "position") ? t.position : void 0,
            rotation: (0, eQ.u)(t, "rotation") ? t.rotation : void 0,
            stickerSize: (0, eQ.u)(t, "stickerSize") ? t.stickerSize : void 0,
            scale: (0, eQ.u)(t, "scale") ? t.scale : void 0,
            stickerURI: (0, eQ.u)(t, "stickerURI") ? t.stickerURI : void 0,
            zIndex: (0, eQ.u)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function tt(e) {
        if (void 0 !== e) return null === e ? null : {
            position: e.position,
            rotation: e.rotation,
            stickerSize: e.stickerSize,
            scale: e.scale,
            stickerURI: e.stickerURI,
            zIndex: e.zIndex
        }
    }

    function tn(e) {
        var t, n;
        return null == (t = e) ? t : {
            position: (0, eQ.u)(t, "position") ? t.position : void 0,
            rotation: (0, eQ.u)(t, "rotation") ? t.rotation : void 0,
            scale: (0, eQ.u)(t, "scale") ? t.scale : void 0,
            text: (0, eQ.u)(t, "text") ? t.text : void 0,
            textOverlayStyle: (0, eQ.u)(t, "textOverlayStyle") ? null == (n = t.textOverlayStyle) ? n : {
                font: (0, eQ.u)(n, "font") ? n.font : void 0,
                fontColor: (0, eQ.u)(n, "fontColor") ? n.fontColor : void 0,
                fontSize: (0, eQ.u)(n, "fontSize") ? n.fontSize : void 0,
                textXAlignment: (0, eQ.u)(n, "textXAlignment") ? n.textXAlignment : void 0
            } : void 0,
            zIndex: (0, eQ.u)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function ti(e) {
        if (void 0 !== e) return null === e ? null : {
            position: e.position,
            rotation: e.rotation,
            scale: e.scale,
            text: e.text,
            textOverlayStyle: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    font: e.font,
                    fontColor: e.fontColor,
                    fontSize: e.fontSize,
                    textXAlignment: e.textXAlignment
                }
            }(e.textOverlayStyle),
            zIndex: e.zIndex
        }
    }

    function ta(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, eQ.u)(t, "assetId") ? t.assetId : void 0,
            startTime: (0, eQ.u)(t, "startTime") ? t.startTime : void 0,
            assetAccessContext: (0, eQ.u)(t, "assetAccessContext") ? t.assetAccessContext : void 0
        }
    }

    function tr(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId,
            startTime: e.startTime,
            assetAccessContext: e.assetAccessContext
        }
    }

    function to(e) {
        var t;
        return null == (t = e) ? t : {
            httpVerb: (0, eQ.u)(t, "httpVerb") ? t.httpVerb : void 0,
            url: (0, eQ.u)(t, "url") ? t.url : void 0,
            chunkNum: (0, eQ.u)(t, "chunkNum") ? t.chunkNum : void 0,
            contentStart: (0, eQ.u)(t, "contentStart") ? t.contentStart : void 0,
            contentLength: (0, eQ.u)(t, "contentLength") ? t.contentLength : void 0,
            expirationTimeMs: (0, eQ.u)(t, "expirationTimeMs") ? t.expirationTimeMs : void 0
        }
    }

    function ts(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eQ.u)(t, "role") ? t.role : void 0,
            operationId: (0, eQ.u)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eQ.u)(t, "operationPath") ? t.operationPath : void 0,
            uploadUrls: (0, eQ.u)(t, "uploadUrls") ? null === t.uploadUrls ? null : t.uploadUrls.map(to) : void 0
        }
    }

    function tl(e, t) {
        var n, i, a;
        return null == e ? e : {
            assetId: (0, eQ.u)(e, "assetId") ? e.assetId : void 0,
            assetAccessContext: (0, eQ.u)(e, "assetAccessContext") ? e.assetAccessContext : void 0,
            assetTotalDuration: (0, eQ.u)(e, "assetTotalDuration") ? e.assetTotalDuration : void 0,
            caption: (0, eQ.u)(e, "caption") ? e.caption : void 0,
            videoContentLanguage: (0, eQ.u)(e, "videoContentLanguage") ? e.videoContentLanguage : void 0,
            partnerUploadType: (0, eQ.u)(e, "partnerUploadType") ? e.partnerUploadType : void 0,
            captureType: (0, eQ.u)(e, "captureType") ? e.captureType : void 0,
            editsType: (0, eQ.u)(e, "editsType") ? e.editsType : void 0,
            videoCaptureEdits: (0, eQ.u)(e, "videoCaptureEdits") ? null == (n = e.videoCaptureEdits) ? n : {
                trim: (0, eQ.u)(n, "trim") ? null == (i = n.trim) ? i : {
                    startTime: (0, eQ.u)(i, "startTime") ? i.startTime : void 0,
                    endTime: (0, eQ.u)(i, "endTime") ? i.endTime : void 0
                } : void 0,
                music: (0, eQ.u)(n, "music") ? e9(n.music) : void 0,
                textOverlays: (0, eQ.u)(n, "textOverlays") ? null === n.textOverlays ? null : n.textOverlays.map(tn) : void 0,
                stickerOverlays: (0, eQ.u)(n, "stickerOverlays") ? null === n.stickerOverlays ? null : n.stickerOverlays.map(te) : void 0,
                ttsAudios: (0, eQ.u)(n, "ttsAudios") ? null === n.ttsAudios ? null : n.ttsAudios.map(ta) : void 0
            } : void 0,
            screenshotCaptureEdits: (0, eQ.u)(e, "screenshotCaptureEdits") ? null == (a = e.screenshotCaptureEdits) ? a : {
                music: (0, eQ.u)(a, "music") ? e9(a.music) : void 0,
                textOverlays: (0, eQ.u)(a, "textOverlays") ? null === a.textOverlays ? null : a.textOverlays.map(tn) : void 0,
                ttsAudios: (0, eQ.u)(a, "ttsAudios") ? null === a.ttsAudios ? null : a.ttsAudios.map(ta) : void 0
            } : void 0
        }
    }

    function tu(e, t) {
        var n;
        return null == e ? e : {
            status: (0, eQ.u)(e, "status") ? e.status : void 0,
            result: (0, eQ.u)(e, "result") ? null == (n = e.result) ? n : {
                assetId: (0, eQ.u)(n, "assetId") ? n.assetId : void 0,
                isApproved: (0, eQ.u)(n, "isApproved") ? n.isApproved : void 0,
                operationError: (0, eQ.u)(n, "operationError") ? n.operationError : void 0
            } : void 0
        }
    }

    function td(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eQ.u)(t, "role") ? t.role : void 0,
            operationId: (0, eQ.u)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eQ.u)(t, "operationPath") ? t.operationPath : void 0,
            done: (0, eQ.u)(t, "done") ? t.done : void 0
        }
    }

    function tc(e, t) {
        return null == e ? e : {
            generationToken: (0, eQ.u)(e, "generationToken") ? e.generationToken : void 0
        }
    }

    function tm(e, t) {
        return null == e ? e : {
            count: (0, eQ.u)(e, "count") ? e.count : void 0,
            countIsCapped: (0, eQ.u)(e, "countIsCapped") ? e.countIsCapped : void 0,
            creatorEnabled: (0, eQ.u)(e, "creatorEnabled") ? e.creatorEnabled : void 0,
            viewerCanRead: (0, eQ.u)(e, "viewerCanRead") ? e.viewerCanRead : void 0,
            viewerCanWrite: (0, eQ.u)(e, "viewerCanWrite") ? e.viewerCanWrite : void 0
        }
    }

    function tp(e, t) {
        return null == e ? e : {
            type: (0, eQ.u)(e, "type") ? e.type : void 0,
            id: (0, eQ.u)(e, "id") ? e.id : void 0
        }
    }

    function tf(e, t) {
        return null == e ? e : {
            counts: (0, eQ.u)(e, "counts") ? e.counts : void 0,
            userReaction: (0, eQ.u)(e, "userReaction") ? e.userReaction : void 0
        }
    }

    function th(e, t) {
        return null == e ? e : {
            shareCount: (0, eQ.u)(e, "shareCount") ? e.shareCount : void 0
        }
    }

    function tv(e, t) {
        var n;
        return null == e ? e : {
            type: (0, eQ.u)(e, "type") ? e.type : void 0,
            experienceCta: (0, eQ.u)(e, "experienceCta") ? null == (n = e.experienceCta) ? n : {
                experienceId: (0, eQ.u)(n, "experienceId") ? n.experienceId : void 0,
                placeId: (0, eQ.u)(n, "placeId") ? n.placeId : void 0
            } : void 0
        }
    }

    function tg(e) {
        var t;
        return null == (t = e) ? t : {
            feedSessionId: (0, eQ.u)(t, "feedSessionId") ? t.feedSessionId : void 0,
            entityId: (0, eQ.u)(t, "entityId") ? t.entityId : void 0,
            entityType: (0, eQ.u)(t, "entityType") ? t.entityType : void 0,
            id: (0, eQ.u)(t, "id") ? t.id : void 0,
            feedItemId: (0, eQ.u)(t, "feedItemId") ? t.feedItemId : void 0,
            channelId: (0, eQ.u)(t, "channelId") ? t.channelId : void 0,
            type: (0, eQ.u)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eQ.u)(t, "captionedAssetMoment") ? tl(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eQ.u)(t, "primaryCta") ? tv(t.primaryCta) : void 0,
            owner: (0, eQ.u)(t, "owner") ? tp(t.owner) : void 0,
            visibilityStatus: (0, eQ.u)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eQ.u)(t, "reactions") ? tf(t.reactions) : void 0,
            comments: (0, eQ.u)(t, "comments") ? tm(t.comments) : void 0,
            stats: (0, eQ.u)(t, "stats") ? th(t.stats) : void 0
        }
    }

    function tx(e, t) {
        return null == e ? e : {
            feedItems: (0, eQ.u)(e, "feedItems") ? e.feedItems : void 0,
            loaded: (0, eQ.u)(e, "loaded") ? e.loaded : void 0,
            failed: (0, eQ.u)(e, "failed") ? e.failed : void 0,
            moderated: (0, eQ.u)(e, "moderated") ? e.moderated : void 0
        }
    }

    function ty(e, t) {
        return null == e ? e : {
            items: (0, eQ.u)(e, "items") ? null === e.items ? null : e.items.map(tg) : void 0,
            paginationContext: (0, eQ.u)(e, "paginationContext") ? e.paginationContext : void 0,
            metadata: (0, eQ.u)(e, "metadata") ? tx(e.metadata) : void 0
        }
    }

    function tb(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, eQ.u)(t, "id") ? t.id : void 0,
            feedItemId: (0, eQ.u)(t, "feedItemId") ? t.feedItemId : void 0,
            channelId: (0, eQ.u)(t, "channelId") ? t.channelId : void 0,
            type: (0, eQ.u)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eQ.u)(t, "captionedAssetMoment") ? tl(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eQ.u)(t, "primaryCta") ? tv(t.primaryCta) : void 0,
            owner: (0, eQ.u)(t, "owner") ? tp(t.owner) : void 0,
            visibilityStatus: (0, eQ.u)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eQ.u)(t, "reactions") ? tf(t.reactions) : void 0,
            comments: (0, eQ.u)(t, "comments") ? tm(t.comments) : void 0,
            stats: (0, eQ.u)(t, "stats") ? th(t.stats) : void 0
        }
    }

    function tI(e) {
        var t;
        return null == (t = e) ? t : {
            startSeconds: (0, eQ.u)(t, "startSeconds") ? t.startSeconds : void 0,
            endSeconds: (0, eQ.u)(t, "endSeconds") ? t.endSeconds : void 0,
            text: (0, eQ.u)(t, "text") ? t.text : void 0
        }
    }

    function tw(e, t) {
        return null == e ? e : {
            signingAlgorithmVersion: (0, eQ.u)(e, "signingAlgorithmVersion") ? e.signingAlgorithmVersion : void 0,
            signature: (0, eQ.u)(e, "signature") ? e.signature : void 0
        }
    }
    var tC = eQ._;

    function tT() {
        return null !== tC && tC.apply(this, arguments) || this
    }
    e$(tT, tC), tT.prototype.backfillTriggerB1Raw = function(e, t) {
        return e0(this, void 0, void 0, function() {
            var n, i, a;
            return e1(this, function(r) {
                switch (r.label) {
                    case 0:
                        return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/internal/v1/backfill/trigger-b1",
                            schemaPath: "/internal/v1/backfill/trigger-b1",
                            method: "POST",
                            headers: i,
                            query: n,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    momentId: e.momentId,
                                    creatorId: e.creatorId
                                }
                            }(e.backfillTriggerB1Request)
                        }, t)];
                    case 1:
                        return a = r.sent(), [2, new eQ.V(a)]
                }
            })
        })
    }, tT.prototype.backfillTriggerB1 = function() {
        return e0(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e1(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.backfillTriggerB1Raw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var tj = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return e$(t, e), t.prototype.contentCapturesBatchCheckExperienceUploadabilityRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, void 0 !== e.contentType && (n.contentType = e.contentType), void 0 !== e.experienceIds && (n.experienceIds = e.experienceIds), void 0 !== e.allowExternalExperiences && (n.allowExternalExperiences = e.allowExternalExperiences), i = {}, [4, this.request({
                                    path: "/v1/batch-check-experience-uploadability",
                                    schemaPath: "/v1/batch-check-experience-uploadability",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.V(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesBatchCheckExperienceUploadability = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesBatchCheckExperienceUploadabilityRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibilityRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, void 0 !== e.experienceId && (n.experienceId = e.experienceId), void 0 !== e.contentType && (n.contentType = e.contentType), i = {}, [4, this.request({
                                    path: "/v1/check-moments-eligibility",
                                    schemaPath: "/v1/check-moments-eligibility",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return null == e ? e : {
                                        isEligible: (0, eQ.u)(e, "isEligible") ? e.isEligible : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibility = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesCheckMomentsEligibilityRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatusRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, void 0 !== e.token && (n.token = e.token), i = {}, [4, this.request({
                                    path: "/v1/check-upload-status",
                                    schemaPath: "/v1/check-upload-status",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return tu(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatus = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesCheckUploadStatusRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatusRccRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, void 0 !== e.token && (n.token = e.token), i = {}, [4, this.request({
                                    path: "/v1/check-upload-status-rcc",
                                    schemaPath: "/v1/check-upload-status-rcc",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return tu(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatusRcc = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesCheckUploadStatusRccRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.contentCapturesCreateInfluencerMomentFromVideoRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a, r;
                    return e1(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eQ.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, e.files && e.files.forEach(function(e) {
                                    a.append("files", e)
                                }), void 0 !== e.name && a.append("name", e.name), void 0 !== e.description && a.append("description", e.description), void 0 !== e.universeId && a.append("universeId", e.universeId), void 0 !== e.momentPublishData && a.append("momentPublishData", e.momentPublishData), void 0 !== e.videoContentLanguage && a.append("videoContentLanguage", e.videoContentLanguage), [4, this.request({
                                    path: "/v1/create-influencer-moment-from-video",
                                    schemaPath: "/v1/create-influencer-moment-from-video",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: a
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new eQ.H(r, function(e) {
                                    return null == e ? e : {
                                        operationId: (0, eQ.u)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCreateInfluencerMomentFromVideo = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesCreateInfluencerMomentFromVideoRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.contentCapturesGrantExperiencePermissionsRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/grant-experience-permissions",
                                    schemaPath: "/v1/grant-experience-permissions",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            assetId: e.assetId,
                                            universeId: e.universeId
                                        }
                                    }(e.contentCapturesGrantExperiencePermissionsRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.V(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesGrantExperiencePermissions = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesGrantExperiencePermissionsRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadataRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/sign-content-and-metadata",
                                    schemaPath: "/v1/sign-content-and-metadata",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            userId: e.userId,
                                            content: e.content,
                                            universeId: e.universeId,
                                            placeId: e.placeId,
                                            audioAssetIds: e.audioAssetIds
                                        }
                                    }(e.contentCapturesSignContentAndMetadataRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return tw(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadata = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesSignContentAndMetadataRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignFileAndMetadataInternalRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a, r;
                    return e1(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eQ.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, e.files && e.files.forEach(function(e) {
                                    a.append("files", e)
                                }), void 0 !== e.userId && a.append("userId", e.userId), void 0 !== e.universeId && a.append("universeId", e.universeId), void 0 !== e.placeId && a.append("placeId", e.placeId), void 0 !== e.audioAssetIds && a.append("audioAssetIds", e.audioAssetIds), [4, this.request({
                                    path: "/v1/sign-file-and-metadata-internal",
                                    schemaPath: "/v1/sign-file-and-metadata-internal",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: a
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new eQ.H(r, function(e) {
                                    return tw(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignFileAndMetadataInternal = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesSignFileAndMetadataInternalRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.contentCapturesUploadCaptureWithAssetRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/upload-capture-with-asset",
                                    schemaPath: "/v1/upload-capture-with-asset",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            assetId: e.assetId,
                                            operationId: e.operationId,
                                            momentPublishData: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    momentId: e.momentId,
                                                    metadata: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            assetTotalDuration: e.assetTotalDuration,
                                                            captureType: e.captureType,
                                                            description: e.description,
                                                            universeId: e.universeId,
                                                            placeId: e.placeId,
                                                            videoContentLanguage: e.videoContentLanguage,
                                                            edits: function(e) {
                                                                if (void 0 !== e) return null === e ? null : {
                                                                    music: function(e) {
                                                                        if (void 0 !== e) return null === e ? null : {
                                                                            assetId: e.assetId,
                                                                            startTime: e.startTime
                                                                        }
                                                                    }(e.music),
                                                                    trim: function(e) {
                                                                        if (void 0 !== e) return null === e ? null : {
                                                                            startTime: e.startTime,
                                                                            endTime: e.endTime
                                                                        }
                                                                    }(e.trim),
                                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(ti),
                                                                    stickerOverlays: void 0 === e.stickerOverlays ? void 0 : null === e.stickerOverlays ? null : e.stickerOverlays.map(tt),
                                                                    ttsAudios: void 0 === e.ttsAudios ? void 0 : null === e.ttsAudios ? null : e.ttsAudios.map(tr)
                                                                }
                                                            }(e.edits)
                                                        }
                                                    }(e.metadata),
                                                    feedRegistrationInfo: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            attributes: void 0 === e.attributes ? void 0 : null === e.attributes ? null : e.attributes.map(e6),
                                                            contentType: e.contentType,
                                                            customTags: e.customTags,
                                                            duration: e.duration
                                                        }
                                                    }(e.feedRegistrationInfo)
                                                }
                                            }(e.momentPublishData)
                                        }
                                    }(e.contentCapturesUploadCaptureWithAssetRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.V(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesUploadCaptureWithAsset = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesUploadCaptureWithAssetRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(eQ._),
        tS = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            e$(t, e), t.prototype.moderationApplyModerationDecisionRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/moderate/decision",
                                    schemaPath: "/v1/moderate/decision",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            decision_id: e.decisionId,
                                            content: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    id: e.id,
                                                    user_id: e.userId
                                                }
                                            }(e.content)
                                        }
                                    }(e.moderationApplyModerationDecisionRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.V(a)]
                        }
                    })
                })
            }, t.prototype.moderationApplyModerationDecision = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationApplyModerationDecisionRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.moderationReportMomentRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eQ.w("momentId", "Required parameter requestParameters.momentId was null or undefined when calling moderationReportMoment.");
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/moderate/report/{momentId}".replace("{".concat("momentId", "}"), encodeURIComponent(String(e.momentId))),
                                    schemaPath: "/v1/moderate/report/{momentId}",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            momentId: e.momentId,
                                            feedItemId: e.feedItemId,
                                            reportType: e.reportType
                                        }
                                    }(e.moderationReportMomentRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.V(a)]
                        }
                    })
                })
            }, t.prototype.moderationReportMoment = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    return e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationReportMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(eQ._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            e$(t, e), t.prototype.momentTextGenerationCreateMomentVideoUploadUrlRaw = function(e) {
                return e0(this, void 0, void 0, function() {
                    var t, n, i;
                    return e1(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/create-moment-video-upload-url",
                                    schemaPath: "/v1/create-moment-video-upload-url",
                                    method: "POST",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return i = a.sent(), [2, new eQ.H(i, function(e) {
                                    return null == e ? e : {
                                        uploadUrl: (0, eQ.u)(e, "uploadUrl") ? e.uploadUrl : void 0,
                                        videoObjectKey: (0, eQ.u)(e, "videoObjectKey") ? e.videoObjectKey : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationCreateMomentVideoUploadUrl = function(e) {
                return e0(this, void 0, void 0, function() {
                    return e1(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.momentTextGenerationCreateMomentVideoUploadUrlRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentTextRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/generate-moment-text",
                                    schemaPath: "/v1/generate-moment-text",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            operationId: e.operationId,
                                            assetId: e.assetId,
                                            universeId: e.universeId,
                                            placeId: e.placeId,
                                            videoObjectKey: e.videoObjectKey,
                                            tone: e.tone,
                                            generateSegments: e.generateSegments,
                                            testOverrideText: e.testOverrideText
                                        }
                                    }(e.momentTextGenerationGenerateMomentTextRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return tc(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentText = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentTextGenerationGenerateMomentTextRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentTextWithVideoRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, void 0 !== e.captureType && (n.captureType = e.captureType), i = {}, [4, this.request({
                                    path: "/v1/generate-moment-text-with-video",
                                    schemaPath: "/v1/generate-moment-text-with-video",
                                    method: "POST",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return tc(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentTextWithVideo = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentTextGenerationGenerateMomentTextWithVideoRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGetMomentTextGenerationStatusRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, void 0 !== e.token && (n.token = e.token), i = {}, [4, this.request({
                                    path: "/v1/moment-text-generation-status",
                                    schemaPath: "/v1/moment-text-generation-status",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        status: (0, eQ.u)(e, "status") ? e.status : void 0,
                                        result: (0, eQ.u)(e, "result") ? null == (t = e.result) ? t : {
                                            summary: (0, eQ.u)(t, "summary") ? t.summary : void 0,
                                            description: (0, eQ.u)(t, "description") ? t.description : void 0,
                                            error: (0, eQ.u)(t, "error") ? t.error : void 0,
                                            segments: (0, eQ.u)(t, "segments") ? null === t.segments ? null : t.segments.map(tI) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGetMomentTextGenerationStatus = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentTextGenerationGetMomentTextGenerationStatusRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationSubmitMomentGeneratedTextFeedbackRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/moment-generated-text-feedback",
                                    schemaPath: "/v1/moment-generated-text-feedback",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            generationToken: e.generationToken,
                                            reason: e.reason
                                        }
                                    }(e.momentTextGenerationSubmitMomentGeneratedTextFeedbackRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.V(a)]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationSubmitMomentGeneratedTextFeedback = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentTextGenerationSubmitMomentGeneratedTextFeedbackRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(eQ._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return e$(t, e), t.prototype.momentsCleanUserDataRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/moments/clean-user-data",
                                    schemaPath: "/v2/moments/clean-user-data",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            NotificationId: e.notificationId,
                                            EventType: e.eventType,
                                            EventTime: void 0 === e.eventTime ? void 0 : e.eventTime.toISOString(),
                                            EventPayload: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    UserId: e.userId,
                                                    GameIds: e.gameIds
                                                }
                                            }(e.eventPayload)
                                        }
                                    }(e.momentsCleanUserDataRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        notificationId: (0, eQ.u)(e, "NotificationId") ? e.NotificationId : void 0,
                                        eventType: (0, eQ.u)(e, "EventType") ? e.EventType : void 0,
                                        eventTime: (0, eQ.u)(e, "EventTime") ? new Date(e.EventTime) : void 0,
                                        eventPayload: (0, eQ.u)(e, "EventPayload") ? null == (t = e.EventPayload) ? t : {
                                            userId: (0, eQ.u)(t, "UserId") ? t.UserId : void 0,
                                            gameIds: (0, eQ.u)(t, "GameIds") ? t.GameIds : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsCleanUserData = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsCleanUserDataRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eQ.w("momentId", "Required parameter requestParameters.momentId was null or undefined when calling momentsDeleteMoment.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/{momentId}".replace("{".concat("momentId", "}"), encodeURIComponent(String(e.momentId))),
                                    schemaPath: "/v2/moments/{momentId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.V(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMoment = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    return e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItemRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.feedItemId || void 0 === e.feedItemId) throw new eQ.w("feedItemId", "Required parameter requestParameters.feedItemId was null or undefined when calling momentsDeleteMomentByFeedItem.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/by-feed-item/{feedItemId}".replace("{".concat("feedItemId", "}"), encodeURIComponent(String(e.feedItemId))),
                                    schemaPath: "/v2/moments/by-feed-item/{feedItemId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.V(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItem = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    return e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentByFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendationsRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, void 0 !== e.paginationContext && (n.PaginationContext = e.paginationContext), void 0 !== e.locationId && (n.LocationId = e.locationId), void 0 !== e.count && (n.Count = e.count), void 0 !== e.signals && (n.Signals = e.signals), i = {}, [4, this.request({
                                    path: "/v2/moments/get-moment-recommendations",
                                    schemaPath: "/v2/moments/get-moment-recommendations",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return ty(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendations = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsGetMomentRecommendationsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentsRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, e.ids && (n.Ids = e.ids), void 0 !== e.type && (n.type = e.type), i = {}, [4, this.request({
                                    path: "/v2/moments/get-moments",
                                    schemaPath: "/v2/moments/get-moments",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eQ.u)(e, "items") ? null === e.items ? null : e.items.map(tb) : void 0,
                                        failedMomentIds: (0, eQ.u)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eQ.u)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMoments = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsGetMomentsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.momentsGetUsersMomentsRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, void 0 !== e.targetUserId && (n.TargetUserId = e.targetUserId), void 0 !== e.paginationContext && (n.PaginationContext = e.paginationContext), void 0 !== e.count && (n.Count = e.count), e.filterBy && (n.FilterBy = e.filterBy), i = {}, [4, this.request({
                                    path: "/v2/moments/get-users-moments",
                                    schemaPath: "/v2/moments/get-users-moments",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eQ.u)(e, "items") ? null === e.items ? null : e.items.map(tb) : void 0,
                                        failedMomentIds: (0, eQ.u)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eQ.u)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0,
                                        paginationContext: (0, eQ.u)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, eQ.u)(e, "metadata") ? tx(e.metadata) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetUsersMoments = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsGetUsersMomentsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/moments/react-to-feed-item",
                                    schemaPath: "/v2/moments/react-to-feed-item",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            feedItemId: e.feedItemId,
                                            entityType: e.entityType,
                                            entityId: e.entityId,
                                            reactionType: e.reactionType,
                                            feedSessionId: e.feedSessionId
                                        }
                                    }(e.momentsReactToFeedItemRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.V(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItem = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2Raw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/moments/react-to-feed-item-v2",
                                    schemaPath: "/v2/moments/react-to-feed-item-v2",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            feedItemId: e.feedItemId,
                                            reactionType: e.reactionType,
                                            emoteId: e.emoteId,
                                            feedSessionId: e.feedSessionId
                                        }
                                    }(e.momentsReactToFeedItemV2Request)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.V(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2 = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemV2Raw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsSearchMomentsRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, void 0 !== e.q && (n.q = e.q), void 0 !== e.paginationContext && (n.paginationContext = e.paginationContext), void 0 !== e.locationId && (n.locationId = e.locationId), void 0 !== e.count && (n.count = e.count), i = {}, [4, this.request({
                                    path: "/v2/moments/search-moments",
                                    schemaPath: "/v2/moments/search-moments",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return ty(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentsSearchMoments = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsSearchMomentsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.momentsTestSuppressOwnedFeedItemsRaw = function(e) {
                return e0(this, void 0, void 0, function() {
                    var t, n, i;
                    return e1(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v2/moments/test/suppress-owned-feed-items",
                                    schemaPath: "/v2/moments/test/suppress-owned-feed-items",
                                    method: "POST",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return i = a.sent(), [2, new eQ.V(i)]
                        }
                    })
                })
            }, t.prototype.momentsTestSuppressOwnedFeedItems = function(e) {
                return e0(this, void 0, void 0, function() {
                    return e1(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.momentsTestSuppressOwnedFeedItemsRaw(e)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, t
        }(eQ._)),
        tM = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return e$(t, e), t.prototype.postsCompletePostRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/complete-post",
                                    schemaPath: "/v1/complete-post",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            uploads: void 0 === e.uploads ? void 0 : null === e.uploads ? null : e.uploads.map(e4)
                                        }
                                    }(e.postsCompletePostRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return null == e ? e : {
                                        uploads: (0, eQ.u)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(td) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsCompletePost = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.postsCompletePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.postsCreatePostRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/create-post",
                                    schemaPath: "/v1/create-post",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            common: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    commentsEnabled: e.commentsEnabled,
                                                    caption: e.caption,
                                                    primaryCta: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            experience: function(e) {
                                                                if (void 0 !== e) return null === e ? null : {
                                                                    universeId: e.universeId,
                                                                    placeId: e.placeId
                                                                }
                                                            }(e.experience)
                                                        }
                                                    }(e.primaryCta),
                                                    music: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            assetId: e.assetId,
                                                            startTime: e.startTime
                                                        }
                                                    }(e.music),
                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(e3),
                                                    textToSpeech: void 0 === e.textToSpeech ? void 0 : null === e.textToSpeech ? null : e.textToSpeech.map(e7),
                                                    contentLanguage: e.contentLanguage
                                                }
                                            }(e.common),
                                            videoPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    video: e5(e.video),
                                                    durationSeconds: e.durationSeconds,
                                                    trim: e8(e.trim)
                                                }
                                            }(e.videoPost),
                                            screenshotPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    screenshot: e5(e.screenshot),
                                                    widthPixels: e.widthPixels,
                                                    heightPixels: e.heightPixels
                                                }
                                            }(e.screenshotPost),
                                            influencerVideoPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    video: e5(e.video),
                                                    durationSeconds: e.durationSeconds,
                                                    trim: e8(e.trim)
                                                }
                                            }(e.influencerVideoPost)
                                        }
                                    }(e.postsCreatePostRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        post: (0, eQ.u)(e, "post") ? null == (t = e.post) ? t : {
                                            operationId: (0, eQ.u)(t, "operationId") ? t.operationId : void 0
                                        } : void 0,
                                        uploads: (0, eQ.u)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(ts) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsCreatePost = function() {
                return e0(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.postsCreatePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.postsGetPostOperationStatusRaw = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    var n, i, a;
                    return e1(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new eQ.w("operationId", "Required parameter requestParameters.operationId was null or undefined when calling postsGetPostOperationStatus.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new eQ.H(a, function(e) {
                                    return null == e ? e : {
                                        path: (0, eQ.u)(e, "path") ? e.path : void 0,
                                        done: (0, eQ.u)(e, "done") ? e.done : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsGetPostOperationStatus = function(e, t) {
                return e0(this, void 0, void 0, function() {
                    return e1(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.postsGetPostOperationStatusRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(eQ._),
        tk = eQ._;

    function tE() {
        return null !== tk && tk.apply(this, arguments) || this
    }
    e$(tE, tk), tE.prototype.testSeedCreatePostAssetRaw = function(e, t) {
        return e0(this, void 0, void 0, function() {
            var n, i, a;
            return e1(this, function(r) {
                switch (r.label) {
                    case 0:
                        return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/v2/moments/test/create-post-asset",
                            schemaPath: "/v2/moments/test/create-post-asset",
                            method: "POST",
                            headers: i,
                            query: n,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    videoAssetId: e.videoAssetId,
                                    imageAssetId: e.imageAssetId,
                                    musicAssetId: e.musicAssetId,
                                    caption: e.caption,
                                    origin: e.origin,
                                    durationSeconds: e.durationSeconds,
                                    creatorUserId: e.creatorUserId,
                                    experienceUniverseId: e.experienceUniverseId,
                                    experiencePlaceId: e.experiencePlaceId
                                }
                            }(e.testSeedCreatePostAssetRequest)
                        }, t)];
                    case 1:
                        return a = r.sent(), [2, new eQ.V(a)]
                }
            })
        })
    }, tE.prototype.testSeedCreatePostAsset = function() {
        return e0(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e1(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedCreatePostAssetRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tE.prototype.testSeedInspectPostRaw = function(e, t) {
        return e0(this, void 0, void 0, function() {
            var n, i, a;
            return e1(this, function(r) {
                switch (r.label) {
                    case 0:
                        return n = {}, void 0 !== e.id && (n.id = e.id), void 0 !== e.type && (n.type = e.type), i = {}, [4, this.request({
                            path: "/v2/moments/test/inspect-post",
                            schemaPath: "/v2/moments/test/inspect-post",
                            method: "GET",
                            headers: i,
                            query: n
                        }, t)];
                    case 1:
                        return a = r.sent(), [2, new eQ.V(a)]
                }
            })
        })
    }, tE.prototype.testSeedInspectPost = function() {
        return e0(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e1(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedInspectPostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tE.prototype.testSeedListUserMomentsRaw = function(e) {
        return e0(this, void 0, void 0, function() {
            var t, n, i;
            return e1(this, function(a) {
                switch (a.label) {
                    case 0:
                        return t = {}, n = {}, [4, this.request({
                            path: "/v2/moments/test/list-user-moments",
                            schemaPath: "/v2/moments/test/list-user-moments",
                            method: "GET",
                            headers: n,
                            query: t
                        }, e)];
                    case 1:
                        return i = a.sent(), [2, new eQ.V(i)]
                }
            })
        })
    }, tE.prototype.testSeedListUserMoments = function(e) {
        return e0(this, void 0, void 0, function() {
            return e1(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.testSeedListUserMomentsRaw(e)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    }, tE.prototype.testSeedMomentToPostRaw = function(e, t) {
        return e0(this, void 0, void 0, function() {
            var n, i, a;
            return e1(this, function(r) {
                switch (r.label) {
                    case 0:
                        return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/v2/moments/test/moment-to-post",
                            schemaPath: "/v2/moments/test/moment-to-post",
                            method: "POST",
                            headers: i,
                            query: n,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    type: e.type,
                                    id: e.id,
                                    targetUserId: e.targetUserId
                                }
                            }(e.testSeedMomentToPostRequest)
                        }, t)];
                    case 1:
                        return a = r.sent(), [2, new eQ.V(a)]
                }
            })
        })
    }, tE.prototype.testSeedMomentToPost = function() {
        return e0(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e1(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedMomentToPostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tE.prototype.testSeedSeedBatchRaw = function(e, t) {
        return e0(this, void 0, void 0, function() {
            var n, i, a;
            return e1(this, function(r) {
                switch (r.label) {
                    case 0:
                        return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/v2/moments/test/seed-batch",
                            schemaPath: "/v2/moments/test/seed-batch",
                            method: "POST",
                            headers: i,
                            query: n,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    count: e.count,
                                    captureType: e.captureType
                                }
                            }(e.testSeedSeedBatchRequest)
                        }, t)];
                    case 1:
                        return a = r.sent(), [2, new eQ.V(a)]
                }
            })
        })
    }, tE.prototype.testSeedSeedBatch = function() {
        return e0(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e1(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedSeedBatchRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tE.prototype.testSeedSeedMomentRaw = function(e, t) {
        return e0(this, void 0, void 0, function() {
            var n, i, a;
            return e1(this, function(r) {
                switch (r.label) {
                    case 0:
                        return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/v2/moments/test/seed",
                            schemaPath: "/v2/moments/test/seed",
                            method: "POST",
                            headers: i,
                            query: n,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    momentId: e.momentId,
                                    assetId: e.assetId,
                                    captureType: e.captureType
                                }
                            }(e.testSeedSeedMomentRequest)
                        }, t)];
                    case 1:
                        return a = r.sent(), [2, new eQ.V(a)]
                }
            })
        })
    }, tE.prototype.testSeedSeedMoment = function() {
        return e0(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e1(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedSeedMomentRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tE.prototype.testSeedWirePostRaw = function(e, t) {
        return e0(this, void 0, void 0, function() {
            var n, i, a;
            return e1(this, function(r) {
                switch (r.label) {
                    case 0:
                        return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/v2/moments/test/wire-post",
                            schemaPath: "/v2/moments/test/wire-post",
                            method: "POST",
                            headers: i,
                            query: n,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    postAssetId: e.postAssetId,
                                    creatorUserId: e.creatorUserId,
                                    captureType: e.captureType
                                }
                            }(e.testSeedWirePostRequest)
                        }, t)];
                    case 1:
                        return a = r.sent(), [2, new eQ.V(a)]
                }
            })
        })
    }, tE.prototype.testSeedWirePost = function() {
        return e0(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e1(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedWirePostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var tP = e.i(272593);
    let tA = (0, tP.f)("content-captures-api", "bedev2"),
        tL = new tj(tA),
        tN = new tS(tA),
        tR = new tM(tA),
        tU = Object.assign(tL, {
            momentsGetUsersMoments: e => tN.momentsGetUsersMoments(e),
            momentsDeleteMoment: e => tN.momentsDeleteMoment(e),
            momentsDeleteMomentByFeedItem: e => tN.momentsDeleteMomentByFeedItem(e),
            postsCreatePost: e => tR.postsCreatePost(e),
            postsCompletePost: e => tR.postsCompletePost(e)
        });
    var tO = e.i(773057),
        tD = e.i(227987),
        t_ = e.i(889311),
        tz = e.i(215955),
        tq = ((t = {}).ListMoments = "listMoments", t.FetchNextPage = "fetchNextPage", t.UploadVideo = "uploadVideo", t.ValidateVideo = "validateVideo", t.PersistLocalVideo = "persistLocalVideo", t.PublishMoment = "publishMoment", t.DeleteMoment = "deleteMoment", t.ResolveExperience = "resolveExperience", t.LoadLocalVideoMedia = "loadLocalVideoMedia", t.EnrichExperienceNames = "enrichExperienceNames", t.CopyShareLink = "copyShareLink", t.ListViolations = "listViolations", t);
    let tV = (e, t) => {
            let n;
            return null != t.momentId && (e.momentId = t.momentId), null != t.feedItemId && (e.feedItemId = t.feedItemId), null != t.draftId && (e.draftId = t.draftId), null != t.experienceId && (e.experienceId = String(t.experienceId)), null != t.placeId && (e.placeId = String(t.placeId)), null != t.fileCount && (e.fileCount = String(t.fileCount)), null != t.fileSize && (e.fileSize = String(t.fileSize)), null != t.fileType && t.fileType.length > 0 && (e.fileType = t.fileType), null != t.locale && t.locale.length > 0 && (e.locale = t.locale), null != t.inputValue && t.inputValue.length > 0 && (e.inputValue = (n = t.inputValue).length <= 200 ? n : n.slice(0, 200)), null != t.idType && (e.idType = t.idType), null != t.matchedId && (e.matchedId = String(t.matchedId)), null != t.userId && (e.userId = String(t.userId)), null != t.pageCount && (e.pageCount = String(t.pageCount)), null != t.momentCount && (e.momentCount = String(t.momentCount)), null != t.persistedVideoCount && (e.persistedVideoCount = String(t.persistedVideoCount)), null != t.isLocalMoment && (e.isLocalMoment = String(t.isLocalMoment)), null != t.universeIdCount && (e.universeIdCount = String(t.universeIdCount)), e
        },
        tF = async (e, t) => {
            var n;
            let i = await (0, tD.f)(e),
                a = e instanceof Error ? e.message : "string" == typeof e ? e : "Unknown error";
            return i ? {
                reason: null != (n = null != t ? t : i.message) ? n : a,
                httpStatus: i.status,
                errorCode: i.code
            } : {
                reason: null != t ? t : a
            }
        }, tB = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return {
                eventName: t_.f.MomentsCreationsError,
                parameters: tV({
                    operation: e,
                    reason: t.reason,
                    ...null != t.httpStatus ? {
                        httpStatus: String(t.httpStatus)
                    } : {},
                    ...null != t.errorCode ? {
                        errorCode: String(t.errorCode)
                    } : {}
                }, n)
            }
        }, tG = async function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tz.f,
                a = await tF(t, n.reason);
            i.logErrorEvent(tB(e, a, n))
        }, tH = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tz.f;
            tG(e, t, n, i)
        }, tK = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: t_.f.MomentsCreationsAttempt,
                parameters: tV({
                    operation: e
                }, t)
            }
        }, tW = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: t_.f.MomentsCreationsSuccess,
                parameters: tV({
                    operation: e
                }, t)
            }
        }, tX = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tz.f;
            n.logClickEvent(tK(e, t))
        }, tY = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tz.f;
            n.logImpressionEvent(tW(e, t))
        };
    var tJ = e.i(773595);
    let tQ = tJ.W,
        tZ = new Set(tQ),
        t$ = e => {
            let t = e === d.v.SimplifiedChineseJV ? d.v.SimplifiedChinese : e;
            return null != t && tZ.has(t) ? t : d.v.English
        },
        t0 = e => null != e ? (0, d.t)(e) : "-",
        t1 = {
            active: eh,
            captionedassetmoment: eh,
            live: eh,
            moderated: ex,
            pending: ev,
            published: eh
        },
        t2 = new Date(0).toISOString(),
        t4 = function(e) {
            var t, n, i, a, r, o, s;
            let l = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                u = null != (t = e.id) ? t : void 0,
                d = null != (n = e.feedItemId) ? n : void 0,
                c = l ? d : u;
            if (null == c || "" === c) return null;
            let m = null != (i = null == (r = e.type) ? void 0 : r.toLowerCase()) ? i : "";
            if ("draft" === m || m.includes("draft")) return null;
            let p = e.captionedAssetMoment,
                f = null == (s = e.primaryCta) || null == (o = s.experienceCta) ? void 0 : o.experienceId,
                h = (e => {
                    if (null != e && "" !== e) return tJ.D.get(e.toLowerCase())
                })(null == p ? void 0 : p.videoContentLanguage);
            return {
                momentId: u,
                feedItemId: d,
                assetId: null == p ? void 0 : p.assetId,
                description: null != (a = null == p ? void 0 : p.caption) ? a : "",
                experienceName: "",
                modifiedAt: t2,
                status: (e => {
                    if (!e) return eh;
                    let t = t1[e.toLowerCase()];
                    if (t) return t;
                    let n = e.toLowerCase();
                    return n.includes("pending") ? ev : (n.includes("active") || n.includes("publish") || n.includes("live"), eh)
                })(e.type),
                universeId: f,
                ...null != h ? {
                    locale: h
                } : {}
            }
        },
        t5 = function(e) {
            var t;
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return (null != (t = e.items) ? t : []).map(e => t4(e, n)).filter(e => null != e)
        },
        t8 = async (e, t) => tU.momentsGetUsersMoments({
            targetUserId: e,
            paginationContext: null == t ? void 0 : t.paginationContext,
            count: 25
        }), t3 = async e => {
            let t = [...new Set(e.map(e => e.universeId).filter(e => null != e && e > 0))];
            if (0 === t.length) return e;
            try {
                tX(tq.EnrichExperienceNames, {
                    universeIdCount: t.length
                });
                let {
                    data: n = []
                } = await tO.f.getUniversesDetails(t), i = new Map(n.filter(e => null != e.id && "string" == typeof e.name && e.name.length > 0).map(e => [e.id, e.name])), a = e.map(e => {
                    var t;
                    let n = null != e.universeId && null != (t = i.get(e.universeId)) ? t : "";
                    return n === e.experienceName ? e : {
                        ...e,
                        experienceName: n
                    }
                });
                return tY(tq.EnrichExperienceNames, {
                    universeIdCount: t.length
                }), a
            } catch (n) {
                return tH(tq.EnrichExperienceNames, n, {
                    universeIdCount: t.length
                }), e
            }
        }, t7 = async function(e, t) {
            var n, i;
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                r = (null == t ? void 0 : t.paginationContext) != null ? tq.FetchNextPage : tq.ListMoments;
            tX(r, {
                userId: e
            });
            let o = await t8(e, t),
                s = t5(o, a),
                l = await t3(s);
            return tY(r, {
                userId: e,
                pageCount: null != (n = null == t ? void 0 : t.pageNumber) ? n : 1,
                momentCount: l.length
            }), {
                moments: l,
                paginationContext: null != (i = o.paginationContext) ? i : void 0
            }
        }, t6 = async e => {
            let {
                experienceId: t,
                experienceName: n,
                rootPlaceId: i,
                locale: a,
                onProgress: r
            } = e;
            for (let e = 1; e <= 10; e += 1) await new Promise(e => {
                setTimeout(e, 100)
            }), null == r || r(e / 10);
            return {
                draftId: "u" > typeof crypto && "function" == typeof crypto.randomUUID ? crypto.randomUUID() : "moment-".concat(Date.now(), "-").concat(Math.random().toString(36).slice(2, 9)),
                experienceId: t,
                rootPlaceId: i,
                experienceName: n,
                description: "",
                modifiedAt: new Date().toISOString(),
                status: eg,
                ...null != a ? {
                    locale: a
                } : {}
            }
        };
    async function t9(e) {
        let {
            feedItemId: t,
            momentId: n,
            useFeedItemId: i = !1
        } = e;
        if (i) {
            if (null == t || "" === t) throw Error("Moment feed item id is required before deleting");
            await tU.momentsDeleteMomentByFeedItem({
                feedItemId: t
            });
            return
        }
        if (null == n || "" === n) throw Error("Moment id is required before deleting");
        await tU.momentsDeleteMoment({
            momentId: n
        })
    }
    var ne = e.i(805290),
        nt = function(e, t) {
            return (nt = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        },
        nn = function() {
            return (nn = Object.assign || function(e) {
                for (var t, n = 1, i = arguments.length; n < i; n++)
                    for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                return e
            }).apply(this, arguments)
        };

    function ni(e, t, n, i) {
        return new(n || (n = Promise))(function(a, r) {
            function o(e) {
                try {
                    l(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    l(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, s)
            }
            l((i = i.apply(e, t || [])).next())
        })
    }

    function na(e, t) {
        var n, i, a, r = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(l) {
                var u = [s, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (r = 0)), r;) try {
                    if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                    switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < a[1]) {
                                r.label = a[1], a = u;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(u);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], i = 0
                } finally {
                    n = a = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function nr(e) {
        return e
    }
    "function" == typeof SuppressedError && SuppressedError;

    function no(e) {
        var t;
        return null == (t = e) ? t : {
            uid: t.uid,
            create_time: new Date(t.create_time),
            update_time: new Date(t.update_time),
            name: t.name,
            state: t.state,
            abuse_type_keys: t.abuse_type_keys,
            decision_time: (0, eQ.u)(t, "decision_time") ? new Date(t.decision_time) : void 0,
            message: t.message
        }
    }

    function ns(e) {
        var t, n, i;
        return null == (t = e) ? t : {
            uid: t.uid,
            create_time: new Date(t.create_time),
            update_time: new Date(t.update_time),
            name: t.name,
            user: t.user,
            content: (0, eQ.u)(t, "content") ? function(e) {
                var t, n, i, a, r, o;
                if (null == e) return e;
                switch (e.content_type) {
                    case "CONTENT_TYPE_ASSET":
                        return nn(nn({}, null == (t = e) ? t : {
                            content_type: t.content_type,
                            asset_id: t.asset_id,
                            name: t.name,
                            display_name: (0, eQ.u)(t, "display_name") ? t.display_name : void 0,
                            description: (0, eQ.u)(t, "description") ? t.description : void 0,
                            asset_type: t.asset_type
                        }), {
                            content_type: "CONTENT_TYPE_ASSET"
                        });
                    case "CONTENT_TYPE_AVATAR":
                        return nn(nn({}, null == (n = e) ? n : {
                            content_type: n.content_type
                        }), {
                            content_type: "CONTENT_TYPE_AVATAR"
                        });
                    case "CONTENT_TYPE_BUNDLE":
                        return nn(nn({}, null == (i = e) ? i : {
                            content_type: i.content_type,
                            bundle_id: i.bundle_id,
                            name: i.name,
                            display_name: (0, eQ.u)(i, "display_name") ? i.display_name : void 0,
                            description: (0, eQ.u)(i, "description") ? i.description : void 0,
                            bundle_type: i.bundle_type
                        }), {
                            content_type: "CONTENT_TYPE_BUNDLE"
                        });
                    case "CONTENT_TYPE_CHAT":
                        return nn(nn({}, null == (a = e) ? a : {
                            content_type: a.content_type,
                            chatlines: a.chatlines,
                            review_time: a.review_time,
                            is_in_app_chat: a.is_in_app_chat,
                            experience_name: (0, eQ.u)(a, "experience_name") ? a.experience_name : void 0,
                            username: a.username
                        }), {
                            content_type: "CONTENT_TYPE_CHAT"
                        });
                    case "CONTENT_TYPE_LOOK":
                        return nn(nn({}, null == (r = e) ? r : {
                            content_type: r.content_type,
                            id: r.id,
                            name: (0, eQ.u)(r, "name") ? r.name : void 0,
                            description: (0, eQ.u)(r, "description") ? r.description : void 0
                        }), {
                            content_type: "CONTENT_TYPE_LOOK"
                        });
                    case "CONTENT_TYPE_USER_PROFILE":
                        return nn(nn({}, null == (o = e) ? o : {
                            content_type: o.content_type
                        }), {
                            content_type: "CONTENT_TYPE_USER_PROFILE"
                        });
                    default:
                        throw Error("No variant of Content exists with 'content_type=".concat(e.content_type, "'"))
                }
            }(t.content) : void 0,
            abuse_type_keys: t.abuse_type_keys,
            appeal_by_time: new Date(t.appeal_by_time),
            remaining_appeal_attempts: t.remaining_appeal_attempts,
            state: t.state,
            appeals: t.appeals.map(no),
            allowed_appeal_types: t.allowed_appeal_types.map(nr),
            evidence: (0, eQ.u)(t, "evidence") ? null == (n = t.evidence) ? n : {
                type: n.type,
                elements: (0, eQ.u)(n, "elements") ? n.elements : void 0,
                elementsObj: (0, eQ.u)(n, "elementsObj") ? n.elementsObj : void 0,
                display_meta: null == (i = n.display_meta) ? i : {
                    lowercase_key: (0, eQ.u)(i, "lowercase_key") ? i.lowercase_key : void 0,
                    capitalized_key: (0, eQ.u)(i, "capitalized_key") ? i.capitalized_key : void 0,
                    icon: (0, eQ.u)(i, "icon") ? i.icon : void 0
                }
            } : void 0,
            user_note: (0, eQ.u)(t, "user_note") ? t.user_note : void 0
        }
    }
    var nl = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            nt(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(t, e), t.prototype.listViolationsRaw = function(e, t) {
            return ni(this, void 0, void 0, function() {
                var n, i, a;
                return na(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new eQ.w("userId", "Required parameter requestParameters.userId was null or undefined when calling listViolations.");
                            return n = {}, void 0 !== e.pageSize && (n.page_size = e.pageSize), void 0 !== e.pageToken && (n.page_token = e.pageToken), i = {}, [4, this.request({
                                path: "/v1/users/{user_id}/violations".replace("{".concat("user_id", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{user_id}/violations",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = r.sent(), [2, new eQ.H(a, function(e) {
                                return null == e ? e : {
                                    violations: e.violations.map(ns),
                                    next_page_token: (0, eQ.u)(e, "next_page_token") ? e.next_page_token : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.listViolations = function(e, t) {
            return ni(this, void 0, void 0, function() {
                return na(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.listViolationsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t
    }(eQ._);
    let nu = new class {
            listViolationsRaw(e) {
                return this.violationsApi.listViolationsRaw(e)
            }
            constructor() {
                (0, ne._)(this, "violationsApi", void 0), this.violationsApi = new nl((0, tP.f)("moderation-appeal-service", "bedev2"))
            }
        },
        nd = e => "object" == typeof e && null !== e && !Array.isArray(e),
        nc = function(e) {
            for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), i = 1; i < t; i++) n[i - 1] = arguments[i];
            for (let t of n) {
                let n = e[t];
                if ("string" == typeof n && "" !== n) return n
            }
        },
        nm = function(e) {
            for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), i = 1; i < t; i++) n[i - 1] = arguments[i];
            for (let t of n) {
                let n = e[t];
                if (nd(n)) return n
            }
        },
        np = e => {
            var t;
            if (!nd(e)) return !1;
            let n = null != (t = nm(e, "evidence")) ? t : {},
                i = nm(n, "display_meta", "displayMeta");
            return null != i && ("Label.Type.Post" === nc(i, "capitalized_key", "capitalizedKey") || "Label.TypeLower.Post" === nc(i, "lowercase_key", "lowercaseKey"))
        },
        nf = e => {
            var t, n;
            if (!nd(e)) return null;
            let i = nc(e, "uid");
            if (null == i) return null;
            let a = null != (t = (e => {
                    let t = nc(e, "create_time", "createTime");
                    if (null == t) return;
                    let n = new Date(t).getTime();
                    return Number.isNaN(n) ? void 0 : new Date(n).toISOString()
                })(e)) ? t : (e => {
                    var t;
                    let n = null == (t = nm(e, "evidence")) ? void 0 : t.elements;
                    if (Array.isArray(n)) {
                        for (let e of n)
                            if (nd(e) && "Label.UploadTime" === e.labelKey && "number" == typeof e.unix && Number.isFinite(e.unix) && e.unix > 0) return new Date(1e3 * e.unix).toISOString()
                    }
                })(e),
                r = (e => {
                    var t, n, i;
                    let a = null == (t = nm(e, "evidence")) ? void 0 : t.elements;
                    if (Array.isArray(a)) {
                        for (let e of a)
                            if (nd(e) && "Label.MomentDescription" === e.labelKey) {
                                let t = null != (n = null == (i = nc(e, "text")) ? void 0 : i.trim()) ? n : "";
                                return t.length > 0 ? t : void 0
                            }
                    }
                })(e);
            return {
                uid: i,
                abuseTypeLabelKeys: Object.values(null != (n = nm(e, "abuse_type_keys", "abuseTypeKeys")) ? n : {}).filter(e => "string" == typeof e && "" !== e),
                ...null != a ? {
                    uploadedAt: a
                } : {},
                ...null != r ? {
                    description: r
                } : {}
            }
        },
        nh = async e => {
            let t, n = [];
            for (let i = 0; i < 20; i += 1) {
                let i = await nu.listViolationsRaw({
                        userId: String(e),
                        pageSize: 10,
                        pageToken: t
                    }),
                    a = await i.raw.json();
                if (!nd(a)) break;
                for (let e of Array.isArray(a.violations) ? a.violations : []) {
                    if (!np(e)) continue;
                    let t = nf(e);
                    null != t && n.push(t)
                }
                if (null == (t = nc(a, "next_page_token", "nextPageToken"))) break
            }
            return n
        };
    var nv = e.i(11682);
    async function ng(e) {
        let t = URL.createObjectURL(e),
            n = document.createElement("video");
        try {
            return await new Promise((e, i) => {
                n.preload = "metadata", n.muted = !0, n.playsInline = !0, n.addEventListener("loadedmetadata", () => {
                    let t = n.duration;
                    !Number.isFinite(t) || t <= 0 ? i(Error("Video duration is unavailable")) : e(t)
                }, {
                    once: !0
                }), n.addEventListener("error", () => {
                    i(Error("Failed to load video duration"))
                }, {
                    once: !0
                }), n.src = t
            })
        } finally {
            URL.revokeObjectURL(t), n.removeAttribute("src"), n.load()
        }
    }
    let nx = "influencerVideo";
    async function ny(e) {
        let t = nv.md5.create();
        for (let n = 0; n < e.size; n += 5242880) {
            let i = Math.min(n + 5242880, e.size);
            t.update(await e.slice(n, i).arrayBuffer())
        }
        return t.hex()
    }
    async function nb(e, t) {
        let n = [];
        for (let [r, o] of e.entries()) {
            var i, a;
            let e = null != (i = o.chunkNum) ? i : r + 1;
            if (!o.url) throw Error("Pre-signed upload URL is missing for video chunk ".concat(e));
            let s = Number(o.contentStart),
                l = Number(o.contentLength),
                u = t.slice(s, s + l);
            if (u.size !== l) throw Error("Video chunk ".concat(e, " size mismatch: expected ").concat(l, " bytes, got ").concat(u.size));
            let d = await fetch(o.url, {
                method: null != (a = o.httpVerb) ? a : "PUT",
                body: u
            });
            if (!d.ok) throw Error("Failed to upload video chunk ".concat(e, ": ").concat(d.status, " ").concat(d.statusText));
            let c = d.headers.get("ETag");
            if (!c) throw Error("Missing ETag for video chunk ".concat(e));
            n.push({
                chunkNum: e,
                eTag: c.replaceAll(/["']/g, "")
            })
        }
        return n
    }
    async function nI(e) {
        var t, n, i, a, r, o;
        let {
            moment: s,
            file: l,
            displayName: u,
            uiLocale: d,
            sendVideoContentLanguage: c = !0
        } = e, m = await ng(l), p = await ny(l), f = {
            caption: s.description,
            ...c ? {
                contentLanguage: (null != (o = s.locale) ? o : t$(d)).toLowerCase()
            } : {},
            primaryCta: {
                experience: {
                    universeId: s.experienceId,
                    placeId: s.rootPlaceId
                }
            }
        }, h = await tU.postsCreatePost({
            postsCreatePostRequest: {
                common: f,
                influencerVideoPost: {
                    video: {
                        encryptedCreationContext: "",
                        file: {
                            contentType: "" !== l.type ? l.type : l.name.toLowerCase().endsWith(".mov") ? "video/quicktime" : "video/mp4",
                            filesizeBytes: l.size,
                            md5Checksum: p,
                            chunkPlan: function(e) {
                                let t = [];
                                for (let n = 0; n < e; n += 5242880) t.push(Math.min(5242880, e - n));
                                return t
                            }(l.size)
                        },
                        displayName: u,
                        description: s.description
                    },
                    durationSeconds: m
                }
            }
        }), v = null == (i = h.post) ? void 0 : i.operationId;
        if (null == v || "" === v) throw Error("Publish operation id is missing from the response");
        let g = null != (t = null == (a = h.uploads) ? void 0 : a.find(e => e.role === nx)) ? t : null == (r = h.uploads) ? void 0 : r[0];
        if (!(null == g ? void 0 : g.operationId)) throw Error("Create post response is missing the video upload target");
        let x = null != (n = g.uploadUrls) ? n : [];
        if (0 === x.length) throw Error("Create post response did not return any upload URLs");
        let y = await nb(x, l);
        return await tU.postsCompletePost({
            postsCompletePostRequest: {
                uploads: [{
                    role: nx,
                    operationId: g.operationId,
                    parts: y
                }]
            }
        }), {
            operationId: v
        }
    }
    async function nw(e) {
        if (!e.moment.experienceId) throw Error("Moment experience is required before publishing");
        if (0 === e.file.size) throw Error("Moment video file must not be empty");
        return nI(e)
    }
    var nC = eQ;
    let nT = "/v2/get-or-create-static";
    class nj extends nC._ {
        async createStaticLink(e) {
            let t;
            if ("" === e.feedItemId) throw Error("Moment feed item id is required before creating a share link");
            let n = await this.request({
                    method: "POST",
                    path: nT,
                    schemaPath: nT,
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: {
                        linkType: 6,
                        targetId: e.feedItemId,
                        customData: JSON.stringify({
                            ...e.momentId ? {
                                momentId: e.momentId
                            } : {},
                            targetIdType: "feedItemId"
                        })
                    }
                }),
                i = await new nC.H(n).value();
            if ("string" != typeof i.link || 0 === i.link.length) throw Error("Moments share-link response did not contain a link");
            try {
                t = new URL(i.link)
            } catch (e) {
                throw Error("Moments share-link response contained an invalid URL")
            }
            if ("https:" !== t.protocol && "http:" !== t.protocol) throw Error("Moments share-link response contained an invalid URL");
            return i.link
        }
    }
    let nS = new nj((0, tP.f)("deeplinks", "bedev2")),
        nM = () => {
            let {
                ready: e,
                value: t
            } = (0, u.f)(w.h);
            return e && null != t && t
        },
        nk = () => {
            let {
                ready: e,
                value: t
            } = (0, u.f)(w.M);
            return e && null != t && t
        },
        nE = e => {
            var t, n;
            return e.status === eg ? e.draftId : null != (t = null != (n = e.feedItemId) ? n : e.momentId) ? t : ""
        },
        nP = e => ["momentsCreations", e],
        nA = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return [...nP(e), t]
        },
        nL = () => {
            let {
                ready: e,
                value: t
            } = (0, u.f)(w.q);
            return e && null != t && t
        },
        nN = () => {
            let e, t, [{
                    momentStatus: n
                }, i] = (0, en.f)(["momentStatus"]),
                r = (0, eK.d)(),
                {
                    user: o
                } = (0, F.f)(),
                s = nL() ? eb : ey;
            return {
                statusTab: (e = null == n ? void 0 : Array.isArray(n) ? n[0] : n, (t = s.find(t => t === e)) || eg),
                statusTabs: s,
                setStatusTab: (0, a.useCallback)(e => {
                    i({
                        momentStatus: e
                    }), e === eh && r.invalidateQueries({
                        queryKey: nP(null == o ? void 0 : o.id)
                    })
                }, [r, i, null == o ? void 0 : o.id])
            }
        },
        nR = async (e, t, n, i) => {
            let a = {
                draftId: t,
                fileSize: n.size,
                fileType: n.type
            };
            tX(tq.PersistLocalVideo, a);
            try {
                let r, o, {
                    evictedMediaDraftIds: s
                } = await eL(e, t, n, (r = eB(window.localStorage.getItem(ep(e))), o = new Set(i.map(e => e.draftId)), [...i, ...r.filter(e => !o.has(e.draftId))]));
                return tY(tq.PersistLocalVideo, a), {
                    hasLocalVideo: !0,
                    storageEvictedMediaDraftIds: s
                }
            } catch (e) {
                return tH(tq.PersistLocalVideo, e, {
                    draftId: t,
                    fileSize: n.size,
                    fileType: n.type
                }), {
                    hasLocalVideo: !1,
                    storageEvictedMediaDraftIds: []
                }
            }
        };
    var nU = e.i(137785);
    let nO = (0, d.K)(e => {
        let {
            experience: t,
            hideTitle: n = !1,
            onChangeExperience: a
        } = e, {
            translate: r
        } = (0, d.A)();
        return (0, i.jsxs)("div", {
            className: "flex flex-col gap-y-xsmall width-full",
            children: [n ? null : (0, i.jsxs)("div", {
                className: "flex flex-row items-center justify-between",
                children: [(0, i.jsx)("span", {
                    className: "text-body-small content-muted",
                    children: r("CreateMomentModal.Preview.Title")
                }), a && (0, i.jsx)(el.f, {
                    variant: "Link",
                    size: "Small",
                    onClick: a,
                    children: r("Action.EEChange")
                })]
            }), (0, i.jsx)("div", {
                className: "padding-medium radius-medium bg-surface-200 width-full",
                children: (0, i.jsx)(nU.f, {
                    disableLink: !0,
                    target: t,
                    targetType: "Experience",
                    variant: "medium"
                })
            })]
        })
    }, [ei.f.Creations]);
    var nD = e.i(884367),
        n_ = e.i(392782);
    let nz = "UniverseId",
        nq = "PlaceId",
        nV = /(?:https?:\/\/)?create\.roblox\.com\/dashboard\/creations\/experiences\/(\d+)/,
        nF = /(?:https?:\/\/)?(?:www\.)?roblox\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
        nB = /^\d+$/,
        nG = [{
            regex: /(?:https?:\/\/)?create\.sitetest\d\.robloxlabs\.com\/dashboard\/creations\/experiences\/(\d+)/,
            idType: nz
        }, {
            regex: /(?:https?:\/\/)?(?:www\.)?sitetest\d\.robloxlabs\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
            idType: nq
        }],
        nH = (0, d.K)(e => {
            let {
                onExperienceResolved: t,
                isDisabled: n = !1
            } = e, {
                translate: r
            } = (0, d.A)(), {
                ready: o,
                value: s
            } = (0, u.f)(w.G), [l, c] = (0, a.useState)(""), [m, p] = (0, a.useState)(!1), [f, h] = (0, a.useState)(), v = (0, a.useMemo)(() => [{
                regex: nV,
                idType: nz
            }, {
                regex: nF,
                idType: nq
            }, ...o && null != s && s ? nG : [], {
                regex: nB,
                idType: nz
            }], [s, o]), g = (0, a.useMemo)(() => l.trim().length > 0 && v.some(e => {
                let {
                    regex: t
                } = e;
                return t.test(l.trim())
            }), [v, l]), x = (0, a.useCallback)(async () => {
                var e, n, i, a, o, s;
                let u = l.trim(),
                    d = v.find(e => {
                        let {
                            regex: t
                        } = e;
                        return t.test(u)
                    });
                if (!d) return;
                let m = d.idType === nz && nB.test(u) ? Number(u) : Number(null == (e = d.regex.exec(u)) ? void 0 : e[1]);
                if (!m || !Number.isFinite(m)) return;
                let f = {
                    inputValue: u,
                    idType: d.idType,
                    matchedId: m
                };
                p(!0), h(void 0), tX(tq.ResolveExperience, f);
                try {
                    let e;
                    if (d.idType === nq) {
                        let t = null == (s = (await n_.f.multigetPlaceDetails([m]))[0]) ? void 0 : s.universeId;
                        if (!t) {
                            tH(tq.ResolveExperience, "Experience not found", {
                                ...f,
                                placeId: m,
                                reason: "ExperienceNotFound"
                            }), h(r("Error.ExperienceNotFound")), p(!1);
                            return
                        }
                        e = t
                    } else e = m;
                    let l = null == (o = (await n_.f.getDetails([e])).data) ? void 0 : o[0];
                    if (!(null == l ? void 0 : l.id)) {
                        tH(tq.ResolveExperience, "Experience not found", {
                            ...f,
                            experienceId: e,
                            reason: "ExperienceNotFound"
                        }), h(r("Error.ExperienceNotFound")), p(!1);
                        return
                    }
                    t({
                        id: l.id,
                        name: null != (n = l.name) ? n : void 0,
                        description: null != (i = l.description) ? i : void 0,
                        rootPlaceId: null != (a = l.rootPlaceId) ? a : void 0
                    }), tY(tq.ResolveExperience, {
                        ...f,
                        experienceId: l.id,
                        placeId: d.idType === nq ? m : void 0
                    }), c("")
                } catch (e) {
                    tH(tq.ResolveExperience, e, {
                        ...f,
                        placeId: d.idType === nq ? m : void 0,
                        experienceId: d.idType === nz ? m : void 0
                    }), h(r("Error.ExperienceNotFound"))
                } finally {
                    p(!1)
                }
            }, [t, v, r, l]), y = (0, a.useCallback)(e => {
                "Enter" === e.key && g && (x(), e.preventDefault())
            }, [g, x]);
            return (0, i.jsxs)("div", {
                className: "flex flex-row gap-x-medium items-end width-full",
                children: [(0, i.jsx)("div", {
                    className: "grow-1 min-width-0",
                    children: (0, i.jsx)(nD.f, {
                        label: r("CreateMomentModal.ExperienceInput.Label"),
                        placeholder: r("CreateMomentModal.ExperienceInput.Placeholder"),
                        value: l,
                        onChange: e => {
                            c(e.target.value), h(void 0)
                        },
                        onKeyDown: y,
                        hasError: null != f,
                        error: f,
                        isDisabled: n || m,
                        size: "Medium"
                    })
                }), (0, i.jsx)(el.f, {
                    variant: "Emphasis",
                    size: "Medium",
                    className: f ? "margin-bottom-[22px]" : void 0,
                    isDisabled: !g || m,
                    isLoading: m,
                    onClick: () => {
                        x()
                    },
                    children: r("Action.Add")
                })]
            })
        }, [ei.f.Creations, ei.f.Controls]);
    var nK = e.i(748595),
        nW = e.i(879224);
    let nX = (0, d.K)(e => {
        let {
            value: t,
            onChange: n,
            isDisabled: r = !1
        } = e, {
            translate: o
        } = (0, d.A)(), s = o("CreateMomentModal.LanguageInput.Label"), l = o("CreateMomentModal.LanguageInput.Placeholder"), u = (0, a.useCallback)(e => {
            tZ.has(e) && n(e)
        }, [n]);
        return (0, i.jsx)("div", {
            className: "width-full",
            "data-testid": "moments-language-select",
            children: (0, i.jsx)(nK.x, {
                className: "width-full [&_.content-system-alert]:text-caption-medium",
                size: "Medium",
                label: s,
                ariaLabel: s,
                placeholder: l,
                value: t,
                isDisabled: r,
                onValueChange: u,
                children: (0, i.jsx)(nW.k, {
                    children: (0, i.jsx)(nW.T, {
                        children: tQ.map(e => (0, i.jsx)(nW.d, {
                            value: e,
                            title: (0, d.t)(e),
                            trailing: t === e && (0, i.jsx)(E.f, {
                                name: "icon-filled-check",
                                size: "Medium"
                            })
                        }, e))
                    })
                })
            })
        })
    }, [ei.f.Creations]);
    var nY = e.i(321211);
    let nJ = ["mp4", "mov"],
        nQ = ["video/mp4", "video/quicktime"];
    var nZ = ((n = {}).FileTooBig = "FileTooBig", n.FileWrongType = "FileWrongType", n.DurationExceeded = "DurationExceeded", n.ResolutionExceeded = "ResolutionExceeded", n.MetadataUnavailable = "MetadataUnavailable", n);
    let n$ = e => {
            var t, n;
            let i;
            return e.size > 0xc800000 ? "FileTooBig" : null != (i = null == (n = (t = e).name.split(".").pop()) ? void 0 : n.toLowerCase()) && nJ.some(e => e === i) && ("" === t.type || nQ.includes(t.type)) ? null : "FileWrongType"
        },
        n0 = async e => {
            try {
                let t = await new Promise((t, n) => {
                    let i = document.createElement("video");
                    i.preload = "metadata", i.muted = !0, i.playsInline = !0;
                    let a = URL.createObjectURL(e);
                    i.addEventListener("loadedmetadata", () => {
                        URL.revokeObjectURL(a);
                        let e = i.duration;
                        !Number.isFinite(e) || e <= 0 ? n(Error("Video duration is unavailable")) : t({
                            duration: e,
                            width: i.videoWidth,
                            height: i.videoHeight
                        })
                    }, {
                        once: !0
                    }), i.addEventListener("error", () => {
                        URL.revokeObjectURL(a), n(Error("Failed to load video metadata"))
                    }, {
                        once: !0
                    }), i.src = a
                });
                return (e => {
                    let {
                        duration: t,
                        width: n,
                        height: i
                    } = e;
                    return t > 300.1 ? "DurationExceeded" : n > 4096 || i > 2160 ? "ResolutionExceeded" : null
                })(t)
            } catch (e) {
                return "MetadataUnavailable"
            }
        }, n1 = async e => {
            let t = [],
                n = [];
            for (let i of e) {
                let e = n$(i);
                if (null != e) {
                    n.push({
                        file: i,
                        reason: e
                    });
                    continue
                }
                let a = await n0(i);
                if (null != a) {
                    n.push({
                        file: i,
                        reason: a
                    });
                    continue
                }
                t.push(i)
            }
            return {
                validFiles: t,
                errors: n
            }
        }, n2 = nJ.map(e => e.toUpperCase()).join("/"), n4 = (0, d.K)(e => {
            let {
                hasSelectedExperience: t,
                hasSelectedLanguage: n,
                selectedFiles: r,
                isUploading: o = !1,
                onFilesChange: s,
                onValidationErrorsChange: l
            } = e, {
                translate: u
            } = (0, d.A)(), [c, m] = (0, a.useState)(!1), p = u("CreateMomentModal.DropTarget.UploadButton"), f = u("CreateMomentModal.DropTarget.NoExperienceAddedText"), h = u("CreateMomentModal.DropTarget.ExperienceAddedText"), [v, g] = (0, a.useState)(!1), x = t && n, y = t ? h : f, b = (0, a.useRef)(s), I = (0, a.useRef)(l), w = (0, a.useRef)(u);
            b.current = s, I.current = l, w.current = u;
            let C = (0, a.useCallback)(async e => {
                    var t, n, i, a;
                    if (g(!1), !x || o || c) return;
                    let r = Array.from(null != e ? e : []);
                    if (0 !== r.length) {
                        null == (t = I.current) || t.call(I, []), m(!0);
                        try {
                            let {
                                validFiles: e,
                                errors: t
                            } = await n1(r);
                            if (t.length > 0) {
                                for (let {
                                        file: e,
                                        reason: n
                                    }
                                    of t) tH(tq.ValidateVideo, n, {
                                    fileSize: e.size,
                                    fileType: e.type,
                                    reason: n
                                });
                                null == (n = I.current) || n.call(I, (i = w.current, a = t.map(e => {
                                    let {
                                        reason: t
                                    } = e;
                                    return t
                                }), [...new Set(a)].map(e => ((e, t) => {
                                    switch (t) {
                                        case nZ.FileTooBig:
                                            return e("CreateMomentModal.Error.FileTooBigMegabytes", {
                                                maxFileSizeMB: new Intl.NumberFormat().format(200)
                                            });
                                        case nZ.FileWrongType:
                                            return e("CreateMomentModal.Error.FileWrongType", {
                                                formats: n2
                                            });
                                        case nZ.DurationExceeded:
                                            return e("CreateMomentModal.Error.DurationExceeded", {
                                                maxDurationMinutes: String(5)
                                            });
                                        case nZ.ResolutionExceeded:
                                            return e("CreateMomentModal.Error.ResolutionExceeded", {
                                                maxWidth: String(4096),
                                                maxHeight: String(2160)
                                            });
                                        case nZ.MetadataUnavailable:
                                            return e("CreateMomentModal.Error.MetadataUnavailable");
                                        default:
                                            throw Error("Unhandled Moments video reject reason: ".concat(String(t)))
                                    }
                                })(i, e))))
                            }
                            e.length > 0 && b.current(e)
                        } finally {
                            m(!1)
                        }
                    }
                }, [x, o, c]),
                T = (0, a.useCallback)(() => {
                    !x || o || c || g(!0)
                }, [x, o, c]),
                j = (0, a.useCallback)(() => {
                    g(!1)
                }, []),
                S = !x || o || c;
            return (0, i.jsx)("div", {
                className: "flex flex-col gap-y-small width-full",
                children: (0, i.jsx)(nY.f, {
                    accept: "video/mp4,video/quicktime,.mp4,.mov",
                    multiple: !0,
                    size: 0xc800000,
                    onChange: C,
                    onDragActiveHandler: T,
                    onDragLeaveHandler: j,
                    className: "width-full",
                    children: (e, t, n, a, s) => (0, i.jsxs)("div", {
                        role: "presentation",
                        onKeyDown: t,
                        onDrop: n,
                        onDragOver: a,
                        onDragLeave: s,
                        className: "flex flex-col items-center justify-center gap-y-small padding-xlarge radius-medium stroke-standard width-full min-height-250 ".concat(v ? "bg-shift-200" : "bg-surface-100"),
                        children: [(0, i.jsx)(el.f, {
                            variant: "Standard",
                            size: "Medium",
                            type: "button",
                            icon: o || c ? void 0 : "icon-regular-arrow-up-from-line",
                            isDisabled: S,
                            onClick: e,
                            children: o || c ? (0, i.jsxs)("span", {
                                className: "inline-flex items-center gap-xsmall",
                                children: [(0, i.jsx)(Z.f, {
                                    ariaLabel: p,
                                    size: "Small",
                                    variant: "Indeterminate"
                                }), p]
                            }) : p
                        }), (0, i.jsx)("span", {
                            className: "text-body-small content-muted text-align-x-center",
                            children: y
                        }), r.map(e => (0, i.jsx)("span", {
                            className: "text-body-small content-muted text-align-x-center",
                            children: e.name
                        }, "".concat(e.name, "-").concat(e.lastModified)))]
                    })
                })
            })
        }, [ei.f.Creations]), n5 = (0, d.K)(e => {
            let {
                open: t,
                onOpenChange: n,
                onMomentUploaded: r
            } = e, {
                addMoments: o
            } = eH(), {
                setStatusTab: s
            } = nN(), l = nk(), {
                translate: u
            } = (0, d.A)(), {
                locale: c
            } = (0, d.z)(), m = t$(c), [p, f] = (0, a.useState)(), [h, v] = (0, a.useState)(), g = null != h ? h : m, [x, y] = (0, a.useState)([]), [b, I] = (0, a.useState)([]), w = (0, a.useRef)(0), {
                uploadVideos: C,
                isUploading: T
            } = (() => {
                let {
                    user: e
                } = (0, F.f)(), [t, n] = (0, a.useState)(!1), [i, r] = (0, a.useState)(0);
                return {
                    uploadVideo: (0, a.useCallback)(async t => {
                        let {
                            experience: i,
                            locale: a,
                            file: o
                        } = t, s = null == e ? void 0 : e.id;
                        if (null == s) throw Error("Cannot upload Moments video without a signed-in user");
                        n(!0), r(0);
                        try {
                            var l;
                            let e = await t6({
                                    experienceId: i.id,
                                    experienceName: null != (l = i.name) ? l : "",
                                    rootPlaceId: i.rootPlaceId,
                                    ...null != a ? {
                                        locale: a
                                    } : {},
                                    file: o,
                                    onProgress: r
                                }),
                                {
                                    hasLocalVideo: t
                                } = await nR(s, e.draftId, o, []);
                            return {
                                ...e,
                                hasLocalVideo: t
                            }
                        } finally {
                            n(!1), r(0)
                        }
                    }, [null == e ? void 0 : e.id]),
                    uploadVideos: (0, a.useCallback)(async t => {
                        let {
                            experience: i,
                            locale: a,
                            files: o
                        } = t, s = null == e ? void 0 : e.id;
                        if (null == s) throw Error("Cannot upload Moments video without a signed-in user");
                        if (0 === o.length) return {
                            moments: [],
                            storageEvictedMediaDraftIds: []
                        };
                        n(!0), r(0);
                        try {
                            let e = [],
                                t = [];
                            for (let n of o) {
                                var l;
                                let o = await t6({
                                        experienceId: i.id,
                                        experienceName: null != (l = i.name) ? l : "",
                                        rootPlaceId: i.rootPlaceId,
                                        ...null != a ? {
                                            locale: a
                                        } : {},
                                        file: n,
                                        onProgress: r
                                    }),
                                    {
                                        hasLocalVideo: u,
                                        storageEvictedMediaDraftIds: d
                                    } = await nR(s, o.draftId, n, e);
                                t.push(...d), e.push({
                                    ...o,
                                    hasLocalVideo: u
                                })
                            }
                            return {
                                moments: e,
                                storageEvictedMediaDraftIds: [...new Set(t)]
                            }
                        } finally {
                            n(!1), r(0)
                        }
                    }, [null == e ? void 0 : e.id]),
                    isUploading: t,
                    uploadProgress: i
                }
            })(), j = (0, a.useCallback)(() => {
                f(void 0), v(void 0), y([]), I([])
            }, []), S = (0, a.useCallback)(() => {
                n(!1), j()
            }, [n, j]), M = (0, a.useCallback)(e => {
                f(e)
            }, []), k = (0, a.useCallback)(e => {
                v(e)
            }, []), E = (0, a.useCallback)(() => {
                w.current += 1, y([]), I([]), f(void 0)
            }, []), P = (0, a.useCallback)(e => {
                !T && (n(e), e || j())
            }, [T, n, j]), A = (0, a.useCallback)(e => {
                I(e)
            }, []), L = (0, a.useCallback)(() => {
                I([])
            }, []), N = (0, a.useCallback)(async e => {
                var t, n, i;
                if (0 === e.length || (null == p ? void 0 : p.id) == null || l && null == g || T) return void y(e);
                let a = w.current + 1;
                w.current = a, y(e), tX(tq.UploadVideo, {
                    experienceId: p.id,
                    fileCount: e.length,
                    fileSize: e.reduce((e, t) => e + t.size, 0),
                    fileType: null == (t = e[0]) ? void 0 : t.type,
                    ...l ? {
                        locale: g
                    } : {}
                });
                try {
                    let {
                        moments: t,
                        storageEvictedMediaDraftIds: i
                    } = await C({
                        experience: p,
                        files: e,
                        ...l ? {
                            locale: g
                        } : {}
                    });
                    if (w.current !== a) return;
                    r ? t.forEach(e => {
                        r(e)
                    }) : o(t, {
                        storageEvictedMediaDraftIds: i
                    }), tY(tq.UploadVideo, {
                        experienceId: p.id,
                        fileCount: t.length,
                        persistedVideoCount: t.filter(e => e.hasLocalVideo).length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (n = e[0]) ? void 0 : n.type,
                        ...l ? {
                            locale: g
                        } : {}
                    }), s(eg), S()
                } catch (t) {
                    if (w.current !== a) return;
                    tH(tq.UploadVideo, t, {
                        experienceId: p.id,
                        fileCount: e.length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (i = e[0]) ? void 0 : i.type,
                        ...l ? {
                            locale: g
                        } : {}
                    }), y([])
                }
            }, [o, S, l, T, r, p, g, s, C]), R = u("CreateMomentModal.Title"), U = b[0], O = b.length > 1 ? b.slice(1).join(" ") : void 0;
            return (0, i.jsx)(ed.N, {
                open: t,
                onOpenChange: P,
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: u("Action.Close"),
                children: (0, i.jsx)(ed.d, {
                    className: "flex flex-col min-width-0 width-[min(720px,95vw)] !max-width-[min(720px,95vw)]",
                    children: (0, i.jsxs)(ed.K, {
                        className: "flex flex-col gap-y-medium",
                        children: [(0, i.jsx)(ed.F, {
                            className: "text-heading-small content-emphasis margin-none",
                            children: R
                        }), null != U ? (0, i.jsx)("div", {
                            className: "width-full margin-top-small padding-bottom-small",
                            children: (0, i.jsx)(eu.f, {
                                className: "width-full",
                                variant: "Feedback",
                                severity: "Error",
                                hasCloseAffordance: !0,
                                onDismiss: L,
                                closeLabel: u("Action.Close"),
                                "data-testid": "moments-video-validation-error-banner",
                                children: (0, i.jsxs)("div", {
                                    className: "flex flex-col gap-xsmall",
                                    children: [(0, i.jsx)("span", {
                                        className: "text-label-medium content-emphasis",
                                        children: U
                                    }), null != O ? (0, i.jsx)("span", {
                                        className: "text-body-medium content-default",
                                        children: O
                                    }) : null]
                                })
                            })
                        }) : null, p ? (0, i.jsx)(nO, {
                            experience: p,
                            onChangeExperience: E
                        }) : (0, i.jsx)(nH, {
                            onExperienceResolved: M,
                            isDisabled: T
                        }), l ? (0, i.jsx)(nX, {
                            value: g,
                            onChange: k,
                            isDisabled: T
                        }) : null, (0, i.jsx)(n4, {
                            hasSelectedExperience: (null == p ? void 0 : p.id) != null,
                            hasSelectedLanguage: !l || null != g,
                            selectedFiles: x,
                            isUploading: T,
                            onFilesChange: N,
                            onValidationErrorsChange: A
                        })]
                    })
                })
            })
        }, [ei.f.Creations, ei.f.Controls]);

    function n8() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        (0, ec.G)({
            component: n5,
            props: e,
            options: {
                mode: "standalone"
            }
        })
    }
    let n3 = () => n8(),
        n7 = () => {
            let {
                translate: e
            } = (0, d.A)();
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(el.f, {
                    variant: "Emphasis",
                    size: "Large",
                    type: "button",
                    onClick: n3,
                    children: e("Action.CreateMoments")
                })
            })
        };
    var n6 = e.i(554977);
    let n9 = e => {
            let {
                tabs: t = ey,
                selected: n,
                onChange: a,
                labels: r,
                groupLabel: o
            } = e;
            return (0, i.jsx)("div", {
                className: "inline-flex wrap items-center gap-small",
                "data-testid": "moments-status-filter-pills",
                role: "radiogroup",
                "aria-label": o,
                children: t.map(e => (0, i.jsx)(n6.f, {
                    "data-testid": "moments-status-pill-".concat(e),
                    isChecked: n === e,
                    size: "Medium",
                    text: r[e],
                    onCheckedChange: t => {
                        t && a(e)
                    }
                }, e))
            })
        },
        ie = () => {
            let {
                translate: e
            } = (0, d.A)(), {
                statusTab: t,
                statusTabs: n,
                setStatusTab: r
            } = nN(), o = (0, a.useMemo)(() => ({
                [eh]: e("MomentsTable.Pills.Active"),
                [eg]: e("MomentsTable.Pills.Draft"),
                [ex]: e("MomentsTable.Pills.Moderated")
            }), [e]);
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(n9, {
                    groupLabel: e("MomentsTable.Header.Status"),
                    tabs: n,
                    labels: o,
                    selected: t,
                    onChange: r
                })
            })
        };
    var it = e.i(253536),
        ii = e.i(418564);
    let ia = e => {
        var t, n, a;
        let {
            data: r
        } = e, {
            translate: o
        } = (0, d.A)(), s = (null == r || null == (n = r.creationAccessMetadata) ? void 0 : n.accessAllowed) === !1;
        if (!s) return null;
        let l = null != (t = null == r || null == (a = r.creationAccessMetadata) ? void 0 : a.daysToUnblock) ? t : 0,
            u = s && -1 === l;
        return (0, i.jsx)(ii.f, {
            alertTitle: u ? o("Heading.PermanentlyCreationBanned") : o("Heading.TemporaryCreationBanned", {
                days: l.toString()
            }),
            alertDescription: o(u ? "Description.PermanentlyCreationBanned" : "Description.TemporaryCreationBanned"),
            severity: "warning",
            externalLink: it.P,
            linkLabel: o("Label.MarketplacePolicy"),
            allowCloseDialog: !1
        })
    };
    var ir = e.i(442621),
        io = e.i(215680),
        is = e.i(956642),
        il = e.i(944213),
        iu = e.i(67243),
        id = e.i(756568),
        ic = e.i(131385),
        im = e.i(643093);
    let ip = () => {
        let {
            translate: e
        } = (0, d.A)(), [{
            activeTab: t
        }, n] = (0, en.f)(["activeTab", "filterIndex"]), {
            l1Options: r,
            activeL1Key: o
        } = (0, ic.f)(!0), s = (0, g.Y)(t), l = (0, g.Z)(t), u = (0, a.useCallback)(e => {
            e && n({
                activeTab: (0, g.c)(e),
                filterIndex: 0
            })
        }, [n]), c = (0, a.useCallback)(() => {
            n({
                activeTab: (0, g.c)(g.X),
                filterIndex: 0
            })
        }, [n]), m = (0, a.useCallback)(() => {
            n({
                activeTab: (0, g.c)(g.w),
                filterIndex: 0
            })
        }, [n]), p = e("Label.Categories");
        return 0 !== r.length || s ? (0, i.jsxs)("fieldset", {
            className: "flex wrap items-center gap-small stroke-none margin-none padding-none [min-inline-size:auto]",
            "aria-label": p,
            children: [(0, i.jsx)(n6.f, {
                text: e("Label.Avatars"),
                size: "Medium",
                variant: "Standard",
                isChecked: l,
                onCheckedChange: m
            }), r.map(t => {
                var n;
                return (0, i.jsx)(n6.f, {
                    text: (0, im.s)(t, e),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: t.taxonomyKey === o,
                    onCheckedChange: () => u(t.taxonomyKey)
                }, null != (n = t.taxonomyKey) ? n : t.nameKey)
            }), (0, i.jsx)(n6.f, {
                text: e("Label.AllAssetTypes"),
                size: "Medium",
                variant: "Standard",
                isChecked: s,
                onCheckedChange: c
            })]
        }) : null
    };
    var ih = e.i(638016),
        iv = e.i(348558),
        ig = e.i(100226);
    let ix = (e, t) => {
            let n = C(),
                i = (0, ig.f)(),
                r = (0, iv.f)(),
                {
                    data: o
                } = (0, eJ.f)({
                    queryKey: ["avatar-items-entry-point-asset-types"],
                    queryFn: b.X,
                    staleTime: 3e5
                });
            return (0, a.useMemo)(() => {
                var a, s;
                return null != (a = null == (s = e.menuItem.submenuItems) ? void 0 : s.filter(a => I.f.isMenuItemEnabled(a, t, "Label.AvatarItems" === e.menuItem.nameKey ? null == o ? void 0 : o.has(a.type) : void 0, o, n, i, r))) ? a : []
            }, [e.menuItem.submenuItems, e.menuItem.nameKey, t, o, n, i, r])
        },
        iy = (0, iu.f)()(e => ({
            subMenuContainer: {
                maxWidth: "100%",
                position: "relative",
                [e.breakpoints.down("Large")]: {
                    paddingTop: 24
                }
            },
            subMenu: {
                overflowX: "scroll",
                scrollbarWidth: "none",
                "&::-webkit-scrollbar ": {
                    display: "none"
                }
            },
            backButton: {
                zIndex: e.zIndex.mobileStepper,
                backgroundColor: e.palette.surface[0],
                position: "absolute",
                left: 0,
                paddingRight: 8
            },
            nextButton: {
                zIndex: e.zIndex.mobileStepper,
                backgroundColor: e.palette.surface[0],
                position: "absolute",
                right: 0,
                paddingLeft: 8
            },
            chip: {
                marginRight: 8
            }
        })),
        ib = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                group: r
            } = e, {
                classes: {
                    subMenuContainer: o,
                    subMenu: s,
                    backButton: l,
                    nextButton: u,
                    chip: c
                },
                cx: m
            } = iy(), p = (0, a.useRef)(null), {
                translate: f
            } = (0, d.A)(), [h, v] = (0, a.useState)(0), [g, x] = (0, a.useState)(0), [y, b] = (0, a.useState)(0), {
                isTaxonomyMode: w
            } = (0, ih.f)(I.f.getAssetType(t)), C = ix(t, r), T = (0, a.useMemo)(() => h <= 0, [h]), j = (0, a.useMemo)(() => h + y >= g, [h, g, y]), S = () => {
                var e, t, n;
                let i = null == p ? void 0 : p.current;
                v(null != (e = null == i ? void 0 : i.scrollLeft) ? e : 0), x(null != (t = null == i ? void 0 : i.scrollWidth) ? t : 0), b(null != (n = null == i ? void 0 : i.offsetWidth) ? n : 0)
            };
            return ((0, a.useEffect)(() => {
                let e = null == p ? void 0 : p.current,
                    t = new ResizeObserver(S);
                return e && (e.addEventListener("scroll", S), t.observe(e)), () => {
                    e && (e.removeEventListener("scroll", S), t.unobserve(e))
                }
            }, []), w) ? (0, i.jsx)(ip, {}) : (0, i.jsxs)(id.f, {
                classes: {
                    root: o
                },
                children: [!T && (0, i.jsx)("div", {
                    className: l,
                    children: (0, i.jsx)(io.f, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: -y,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "back",
                        children: (0, i.jsx)(is.f, {
                            fontSize: "small"
                        })
                    })
                }), (0, i.jsx)("div", {
                    ref: p,
                    className: m(s, "flex max-medium:wrap max-medium:gap-y-small"),
                    children: null == C ? void 0 : C.map(e => {
                        let a = t.submenuItem === e;
                        return (0, i.jsx)(ir.f, {
                            classes: {
                                root: c
                            },
                            color: a ? "primary" : "secondary",
                            onClick: a ? void 0 : () => {
                                n({
                                    menuItem: t.menuItem,
                                    submenuItem: e
                                })
                            },
                            label: f(e.nameKey),
                            clickable: !0,
                            tabIndex: 0,
                            "aria-selected": a,
                            role: "tab"
                        }, e.type)
                    })
                }), !j && (0, i.jsx)("div", {
                    className: u,
                    children: (0, i.jsx)(io.f, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: y,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "next",
                        children: (0, i.jsx)(il.f, {
                            fontSize: "small"
                        })
                    })
                })]
            })
        };
    var iI = e.i(482979),
        iw = e.i(198566),
        iC = e.i(43594),
        iT = e.i(90539),
        ij = e.i(239328),
        iS = e.i(823062),
        iM = e.i(198528),
        ik = e.i(949599),
        iE = e.i(704443),
        iP = e.i(696564),
        iA = e.i(433285),
        iL = e.i(148792),
        iN = e.i(8994),
        iR = e.i(402976),
        iU = e.i(563947),
        iO = e.i(397407),
        iD = e.i(828200),
        i_ = e.i(144512),
        iz = e.i(391864),
        iq = e.i(328678),
        iV = e.i(455158),
        iF = e.i(626890),
        iB = e.i(779767),
        iG = e.i(47277),
        iH = e.i(12246),
        iK = e.i(913893),
        iW = e.i(185915);

    function iX(e) {
        if (void 0 === e.id || void 0 === e.autoPublishEnabled) throw Error("Publishing preferences response was malformed");
        return e
    }
    async function iY(e) {
        return iX(await iK.f.getPublishingPreferences(e))
    }
    async function iJ(e) {
        return iX(await iK.f.createPublishingPreferences(e))
    }
    var iQ = e.i(812141);
    let iZ = e => {
        let {
            label: t,
            children: n,
            className: a,
            labelClassName: r
        } = e;
        return (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsxs)("div", {
                className: null != a ? a : "grid [grid-template-columns:175px_1fr] items-center padding-y-large",
                children: [(0, i.jsx)("span", {
                    className: "text-label-large ".concat(null != r ? r : ""),
                    children: t
                }), n]
            }), (0, i.jsx)(iU.f, {})]
        })
    };

    function i$(e) {
        return 4 === e || 2 === e
    }

    function i0(e, t, n) {
        return e && t && "all" === n ? 1 : e && t && "specific" === n ? 4 : e && !t ? 3 : !e && t ? 2 : 0
    }
    let i1 = e => {
        var t;
        let {
            open: n,
            onClose: r
        } = e, {
            translate: o
        } = (0, d.A)(), {
            enqueue: s
        } = (0, iH.J)(), {
            user: l
        } = (0, F.f)(), u = (0, v.W)(), c = null == u ? void 0 : u.id, {
            data: m
        } = (0, iQ.U)(iK.f), p = null != (t = null == m ? void 0 : m.maxCollectiblePrice) ? t : iP.N, [f, h] = (0, a.useState)(!0), [g, x] = (0, a.useState)(!1), [y, b] = (0, a.useState)(!1), [I, w] = (0, a.useState)(""), [C, T] = (0, a.useState)(""), [j, S] = (0, a.useState)(!0), [M, k] = (0, a.useState)(!0), [E, P] = (0, a.useState)(!0), [A, L] = (0, a.useState)("all"), [N, R] = (0, a.useState)(""), [U, O] = (0, a.useState)(!1);
        (0, a.useEffect)(() => {
            n && iY(c).then(e => {
                w(String(e.priceOffset)), T(e.priceInRobux > 0 ? String(e.priceInRobux) : ""), S(e.enableRegionalPricing), b(e.isRentalOptIn);
                let t = function(e) {
                    switch (e) {
                        case 3:
                            return {
                                sellInMarketplace: !0, sellInExperiences: !1, experienceLocationMode: "all"
                            };
                        case 2:
                            return {
                                sellInMarketplace: !1, sellInExperiences: !0, experienceLocationMode: "specific"
                            };
                        case 4:
                            return {
                                sellInMarketplace: !0, sellInExperiences: !0, experienceLocationMode: "specific"
                            };
                        default:
                            return {
                                sellInMarketplace: !0, sellInExperiences: !0, experienceLocationMode: "all"
                            }
                    }
                }(e.saleLocationType);
                k(t.sellInMarketplace), P(t.sellInExperiences), L(t.experienceLocationMode), e.places.length > 0 && R(e.places.join(","))
            }).catch(e => {
                var t;
                (null == (t = (0, iW.f)(e)) ? void 0 : t.status) !== 404 && (O(!0), s({
                    message: o("Message.ErrorProcessingRequest"),
                    autoHide: !0,
                    autoHideDuration: 3e3,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "left"
                    }
                }))
            }).finally(() => h(!1))
        }, [n, c, s, o]);
        let D = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.id) {
                    x(!0);
                    try {
                        let e = i0(M, E, A),
                            t = i$(e) ? N.split(",").filter(Boolean).map(e => Number(e)) : [];
                        await iJ({
                            creatorUserId: l.id,
                            creatorGroupId: c,
                            publishingType: 2,
                            saleLocationType: e,
                            places: t,
                            priceInRobux: Number(C) || 0,
                            priceOffset: Number(I),
                            isFree: !1,
                            enableRegionalPricing: j,
                            isRentalOptIn: y,
                            autoPublishEnabled: !0
                        }), s({
                            message: o("Message.PublishingDefaultsSaved"),
                            autoHide: !0,
                            autoHideDuration: 3e3,
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "left"
                            }
                        }), r()
                    } catch (t) {
                        let e = await (0, tD.f)(t);
                        s({
                            message: o((null == e ? void 0 : e.code) === 9 ? "Message.UserMissingGroupPermissions" : "Message.PublishingUnsuccessful"),
                            autoHide: !0,
                            autoHideDuration: 3e3,
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "left"
                            }
                        })
                    } finally {
                        x(!1)
                    }
                }
            }, [l, c, M, E, A, N, C, I, j, y, s, r, o]),
            _ = (0, a.useCallback)(() => {
                D()
            }, [D]),
            z = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && w(t)
            }, [p]),
            q = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && T(t)
            }, [p]),
            V = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9,]/g, "").replaceAll(/,{2,}/g, ",").replace(/^,/, "").split(",").map(e => e.replace(/^0+(\d)/, "$1")).filter(e => "0" !== e).join(","),
                    n = t.split(",").filter(Boolean);
                if (!(n.length > 5)) {
                    if (5 === n.length && t.endsWith(",")) return void R(t.slice(0, -1));
                    R(t)
                }
            }, []),
            B = f || g || U || !M && !E || "" === I || "" === C || 0 >= Number(C) || i$(i0(M, E, A)) && 0 === N.split(",").filter(Boolean).length;
        return (0, i.jsxs)(iL.f, {
            open: n,
            onClose: r,
            maxWidth: "Medium",
            color: "primaryBrand",
            PaperProps: {
                className: "[width:580px]"
            },
            children: [(0, i.jsx)(iR.f, {
                className: "padding-bottom-none",
                children: (0, i.jsxs)("div", {
                    className: "flex justify-between items-start",
                    children: [(0, i.jsx)("span", {
                        className: "text-heading-small",
                        children: o("Heading.StudioPublishSettings")
                    }), (0, i.jsx)(io.f, {
                        "aria-label": "Close",
                        onClick: r,
                        size: "small",
                        color: "inherit",
                        children: (0, i.jsx)(iD.f, {})
                    })]
                })
            }), (0, i.jsxs)(iN.f, {
                className: "padding-top-small",
                children: [(0, i.jsx)(iG.f, {
                    variant: "body2",
                    className: "[opacity:0.7] padding-bottom-medium",
                    children: o("Description.StudioPublishSettingsSubtitle")
                }), (0, i.jsx)(iZ, {
                    label: o("Label.Availability"),
                    children: (0, i.jsx)("span", {
                        className: "text-label-large [margin-left:12px]",
                        children: o("Label.NonLimited")
                    })
                }), (0, i.jsx)(iZ, {
                    label: o("Label.TimedOption"),
                    children: (0, i.jsx)(iV.f, {
                        checked: y,
                        onChange: () => b(e => !e),
                        "aria-label": "Timed Option"
                    })
                }), (0, i.jsx)(iZ, {
                    label: o("Label.PriceConfigurations"),
                    className: "grid [grid-template-columns:175px_1fr] padding-y-large gap-xsmall",
                    labelClassName: "padding-top-small",
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col [flex:1] gap-xsmall",
                        children: [(0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(iF.f, {
                                id: "price-offset",
                                label: "",
                                placeholder: o("Placeholder.AmountAbovePriceFloor"),
                                variant: "outlined",
                                size: "small",
                                value: I,
                                onChange: z,
                                fullWidth: !0
                            }), (0, i.jsx)(iB.f, {
                                title: o("Tooltip.AmountAbovePriceFloor"),
                                children: (0, i.jsx)(io.f, {
                                    "aria-label": "price offset info",
                                    size: "small",
                                    children: (0, i.jsx)(i_.f, {})
                                })
                            })]
                        }), (0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(iF.f, {
                                id: "price-floor-minimum",
                                label: "",
                                placeholder: o("Placeholder.DoNotPriceBelow"),
                                variant: "outlined",
                                size: "small",
                                value: C,
                                onChange: q,
                                fullWidth: !0
                            }), (0, i.jsx)(iB.f, {
                                title: o("Tooltip.MinimumPriceFloor"),
                                children: (0, i.jsx)(io.f, {
                                    "aria-label": "minimum price info",
                                    size: "small",
                                    children: (0, i.jsx)(i_.f, {})
                                })
                            })]
                        })]
                    })
                }), (0, i.jsx)(iZ, {
                    label: o("Label.RegionalPricing"),
                    children: (0, i.jsx)(iV.f, {
                        checked: j,
                        onChange: () => S(e => !e),
                        "aria-label": "Regional Pricing"
                    })
                }), (0, i.jsx)(iZ, {
                    label: o("Label.SellInMarketplace"),
                    children: (0, i.jsx)(iV.f, {
                        checked: M,
                        onChange: () => {
                            let e = !M;
                            e || L("specific"), k(e)
                        },
                        "aria-label": "Sell in Marketplace"
                    })
                }), (0, i.jsx)(iZ, {
                    label: o("Label.SellInExperiences"),
                    children: (0, i.jsx)(iV.f, {
                        checked: E,
                        onChange: () => P(e => !e),
                        "aria-label": "Sell in experiences"
                    })
                }), E && (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(iU.f, {}), (0, i.jsxs)("div", {
                        className: "padding-y-large",
                        children: [(0, i.jsxs)("div", {
                            className: "grid [grid-template-columns:175px_1fr] items-center",
                            children: [(0, i.jsx)("span", {
                                className: "text-label-large",
                                children: o("Label.ExperienceLocations")
                            }), (0, i.jsxs)(iq.f, {
                                row: !0,
                                value: A,
                                onChange: e => {
                                    let t = e.target.value;
                                    ("all" === t || "specific" === t) && L(t)
                                },
                                className: "flex flex-row no-wrap gap-xsmall [margin-left:12px]",
                                children: [(0, i.jsx)(iO.f, {
                                    value: "all",
                                    disabled: !M,
                                    control: (0, i.jsx)(iz.f, {
                                        "aria-label": o("Label.AllGames"),
                                        size: "small"
                                    }),
                                    label: o("Label.AllGames"),
                                    className: "margin-right-medium"
                                }), (0, i.jsx)(iO.f, {
                                    value: "specific",
                                    control: (0, i.jsx)(iz.f, {
                                        "aria-label": o("Label.SpecificExperiences"),
                                        size: "small"
                                    }),
                                    label: o("Label.SpecificExperiences")
                                })]
                            })]
                        }), "specific" === A && (0, i.jsxs)("div", {
                            className: "[margin-left:187px] [margin-top:10px]",
                            children: [(0, i.jsx)(iF.f, {
                                id: "place-ids",
                                label: "",
                                placeholder: o("Placeholder.EnterExperienceIDs"),
                                variant: "outlined",
                                size: "small",
                                value: N,
                                onChange: V,
                                fullWidth: !0
                            }), (0, i.jsxs)(iG.f, {
                                variant: "caption",
                                className: "[opacity:0.6] block [margin-top:4px]",
                                children: [N ? N.split(",").filter(Boolean).length : 0, "/", 5, " ", o("Label.ExperiencesCount")]
                            })]
                        })]
                    })]
                })]
            }), (0, i.jsxs)("div", {
                className: "flex padding-x-large padding-y-medium gap-small",
                children: [(0, i.jsx)(iA.f, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: _,
                    disabled: B,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: o("Action.Save")
                }), (0, i.jsx)(iA.f, {
                    variant: "contained",
                    color: "secondary",
                    onClick: r,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: o("Action.Cancel")
                })]
            })]
        })
    };
    var i2 = e.i(356936),
        i4 = e.i(759283),
        i5 = e.i(776344);
    let i8 = (e, t) => {
        switch (null == e ? void 0 : e.code) {
            case void 0:
            default:
                return null != t ? t : "Message.UnknownError";
            case 9:
                return "Message.LimitedPublishLimit";
            case 12:
                return "Message.MissingGroupPermission";
            case 14:
                return "Message.ItemPendingReview";
            case 15:
            case 52:
            case 72:
                return "Message.ItemIsModeratedOrPendingReview";
            case 18:
                return "Message.UserDoesNotOwnItem";
            case 19:
                return "Message.ItemPriceTooLow";
            case 20:
                return "Message.ItemPriceTooHigh";
            case 21:
                return "Message.AssetIdInvalid";
            case 26:
                return "Message.NameOrDescriptionModerated";
            case 28:
                return "Message.L2PreviouslyOnSale";
            case 35:
                return "Message.QuantityInvalid";
            case 44:
                return "Message.InvalidQuantityLimit";
            case 45:
                return "Message.AssetCopyOfPublished";
            case 59:
                return "Message.PriceOffsetInvalid";
            case 60:
                return "Message.MinimumPriceInvalid";
            case 61:
                return "Message.InvalidSaleStatus";
            case 70:
                return "Message.NotEnoughRobux";
            case 75:
                return "Message.ItemHasArchivedDependencies";
            case 76:
                return "Message.ItemIsDelisted";
            case 79:
                return "Message.InvalidSaleLocation";
            case 101:
                return "Message.CalendarQuotaLimit";
            case 106:
                return "Message.MissingIdVerification";
            case 125:
                return "Message.MissingTwoStepVerification";
            case 107:
                return "Message.CreationAccessBlocked";
            case 108:
                return "Message.MissingPremiumSubscription";
            case 109:
                return "Message.GroupOwnerMissingPremiumSubscription";
            case 118:
                return "Message.GrantedItemCannotBePublished"
        }
    };
    var i3 = e.i(327449),
        i7 = e.i(47252),
        i6 = e.i(418162);
    let i9 = (0, iu.f)()(e => ({
            dialogPaper: {
                minWidth: 376,
                maxWidth: 480
            },
            dialogContent: {
                padding: e.spacing(3)
            },
            dialogTitle: {
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center"
            },
            dialogTitleText: {
                flex: 1,
                minWidth: 0
            },
            closeButton: {
                marginLeft: "auto"
            },
            descriptionText: {
                marginBottom: e.spacing(2),
                color: e.palette.content.standard
            },
            checkboxList: {
                gap: e.spacing(.5),
                marginBottom: e.spacing(2),
                "& .text-title-small": {
                    font: "var(--typography-body-medium-font)",
                    letterSpacing: "var(--typography-body-medium-letter-spacing)"
                }
            },
            categoryRow: {
                display: "flex",
                alignItems: "center",
                gap: e.spacing(.5),
                minHeight: 40
            },
            expandToggle: {
                padding: e.spacing(.5),
                "& svg": {
                    transition: e.transitions.create("transform", {
                        duration: 150
                    })
                }
            },
            expandToggleCollapsed: {
                transform: "rotate(90deg)"
            },
            expandToggleExpanded: {
                transform: "rotate(-90deg)"
            },
            subtypeIndent: {
                paddingLeft: e.spacing(8),
                gap: e.spacing(.5),
                flexDirection: "column",
                display: "flex",
                paddingBottom: e.spacing(1)
            },
            buttonContainer: {
                flexDirection: "row",
                gap: e.spacing(2),
                width: "100%"
            },
            actionButton: {
                flex: 1
            },
            bulletList: {
                marginTop: e.spacing(1),
                marginBottom: e.spacing(2),
                paddingLeft: e.spacing(3),
                color: e.palette.content.standard
            },
            categoryLabelWide: {
                flex: 1,
                minWidth: 0
            }
        })),
        ae = ["makeup", "clothing", "accessories"],
        at = ["clothing", "makeup"],
        an = {
            makeup: {
                all: "Label.AllMakeup",
                short: "Label.Makeup"
            },
            clothing: {
                all: "Label.AllClothing",
                short: "Label.Clothing"
            },
            accessories: {
                all: "Label.AllAccessories",
                short: "Label.Accessories"
            }
        };

    function ai(e) {
        return e ? an.clothing.all : "Label.ClothingOnlyTShirtsPantsSweaters"
    }
    let aa = (0, d.K)(e => {
        let t, {
                open: n,
                onClose: r,
                categoryFlags: o,
                assetTypesByCategory: s
            } = e,
            {
                translate: l
            } = (0, d.A)(),
            {
                classes: u,
                cx: c
            } = i9(),
            {
                enqueue: m,
                close: p
            } = (0, iH.J)(),
            f = (0, v.W)(),
            h = !1 !== o.showCategorySubtypeDropdowns,
            g = (0, a.useMemo)(() => h ? ae : at, [h]),
            [x, y] = (0, a.useState)({
                clothing: !1,
                makeup: !1,
                accessories: !1
            }),
            [b, I] = (0, a.useState)({}),
            [w, C] = (0, a.useState)(() => ({
                clothing: !0,
                makeup: !0,
                accessories: !0
            })),
            [T, j] = (0, a.useState)(!1),
            [S, M] = (0, a.useState)(null),
            k = (0, a.useMemo)(() => s ? {
                clothing: s.clothing,
                makeup: s.makeup,
                accessories: s.accessories
            } : {
                clothing: [],
                makeup: [],
                accessories: []
            }, [s]),
            E = (0, a.useMemo)(() => ({
                clothing: o.showClothing,
                makeup: o.showMakeup,
                accessories: o.showAccessories
            }), [o.showAccessories, o.showClothing, o.showMakeup]);
        (0, a.useEffect)(() => {
            if (n) {
                let e = {};
                if (s) {
                    let {
                        clothing: t,
                        makeup: n,
                        accessories: i
                    } = s;
                    [...t, ...n, ...i].forEach(t => {
                        e[t] = !0
                    })
                }
                I(e), C({
                    clothing: !0,
                    makeup: !0,
                    accessories: !0
                }), y({
                    clothing: !1,
                    makeup: !1,
                    accessories: !1
                }), j(!1), M(null)
            }
        }, [n, s]);
        let P = (0, a.useCallback)(() => {
                r()
            }, [r]),
            A = (0, a.useCallback)(() => {
                M("enable"), j(!0)
            }, []),
            L = (0, a.useCallback)(() => {
                M("disable"), j(!0)
            }, []),
            N = (0, a.useCallback)(async () => {
                if (!s || null === S) return void r();
                let e = g.flatMap(e => E[e] ? k[e].filter(e => b[e]) : []);
                try {
                    await iK.f.bulkUpdateCollectible(B.L.generateRandomUuid(), null == f ? void 0 : f.id, e.map(e => (0, i6.k)(e)), "enable" === S), m({
                        message: l("Message.TimedOptionSettingsApplied"),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: i4.A,
                        autoHide: !0,
                        onClose: p
                    }), window.location.reload(), r()
                } catch (e) {
                    m({
                        message: l(i8(await (0, tD.f)(e), "Error.Unknown")),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: i4.A,
                        autoHide: !0,
                        onClose: p
                    })
                }
            }, [s, b, S, null == f ? void 0 : f.id, m, p, r, k, E, l, g]),
            R = (0, a.useCallback)(() => {
                j(!1), M(null)
            }, []),
            U = (0, a.useMemo)(() => g.map(e => {
                if (!E[e]) return null;
                let t = k[e];
                if (0 === t.length) return null;
                let n = t.filter(e => b[e]);
                if (0 === n.length) return null;
                if (n.length === t.length) return l("clothing" === e ? ai(h) : an[e].all);
                let i = l(an[e].short),
                    a = n.map(e => l(i4.M[e])).join(", ");
                return "".concat(i, " (").concat(a, ")")
            }).filter(e => null !== e), [b, k, E, h, l, g]),
            O = (0, a.useMemo)(() => g.some(e => E[e] && k[e].some(e => b[e])), [b, k, E, g]),
            D = (0, i.jsxs)(i.Fragment, {
                children: [(0, i.jsx)(i2.f, {
                    className: u.descriptionText,
                    children: l("Description.BulkUpdateAllTimedOptions")
                }), (0, i.jsx)(i5.U, {
                    flexDirection: "column",
                    classes: {
                        root: u.checkboxList
                    },
                    children: g.map(e => (e => {
                        let t = k[e];
                        if (!E[e]) return null;
                        let n = x[e],
                            r = "timed-options-bulk-".concat(e, "-subtypes"),
                            o = l("clothing" === e ? ai(h) : an[e].all);
                        return (0, i.jsxs)(a.default.Fragment, {
                            children: [(0, i.jsxs)("div", {
                                className: u.categoryRow,
                                children: [h ? (0, i.jsx)(io.f, {
                                    type: "button",
                                    size: "small",
                                    className: u.expandToggle,
                                    onClick: () => y(t => ({
                                        ...t,
                                        [e]: !t[e]
                                    })),
                                    "aria-expanded": n,
                                    "aria-controls": r,
                                    "aria-label": l("AriaLabel.ToggleTimedOptionsCategorySubtypes", {
                                        categoryName: o
                                    }),
                                    color: "inherit",
                                    children: (0, i.jsx)(i7.f, {
                                        className: c(n ? u.expandToggleExpanded : u.expandToggleCollapsed)
                                    })
                                }) : null, (0, i.jsx)(i3.f, {
                                    label: o,
                                    size: "Small",
                                    placement: "Start",
                                    isChecked: ((e, t) => {
                                        if (0 === t.length) return w[e];
                                        let n = e => b[e],
                                            i = t.some(n),
                                            a = t.every(n);
                                        return !!i && (!!a || "indeterminate")
                                    })(e, t),
                                    onCheckedChange: n => {
                                        0 === t.length ? C(t => ({
                                            ...t,
                                            [e]: !0 === n
                                        })) : I(e => {
                                            let i = {
                                                ...e
                                            };
                                            return t.forEach(e => {
                                                i[e] = !0 === n
                                            }), i
                                        })
                                    },
                                    className: u.categoryLabelWide
                                })]
                            }), h && n ? (0, i.jsx)("div", {
                                id: r,
                                className: u.subtypeIndent,
                                children: t.map(e => (0, i.jsx)(i3.f, {
                                    label: l(i4.M[e]),
                                    size: "Small",
                                    placement: "Start",
                                    isChecked: b[e],
                                    onCheckedChange: t => {
                                        I(n => ({
                                            ...n,
                                            [e]: !0 === t
                                        }))
                                    }
                                }, e))
                            }) : null]
                        }, e)
                    })(e))
                }), (0, i.jsxs)(i5.U, {
                    flexDirection: "row",
                    classes: {
                        root: u.buttonContainer
                    },
                    children: [(0, i.jsx)(iA.f, {
                        variant: "contained",
                        color: "secondary",
                        onClick: A,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !O,
                        children: l("Action.Enable")
                    }), (0, i.jsx)(iA.f, {
                        variant: "contained",
                        color: "secondary",
                        onClick: L,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !O,
                        children: l("Action.Disable")
                    })]
                })]
            });
        return T && (t = "enable" === S ? "Description.ThisWillEnableTimedOptionsFor" : "Description.ThisWillDisableTimedOptionsFor", D = (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(i2.f, {
                className: u.descriptionText,
                children: l(t)
            }), U.length > 0 && (0, i.jsx)("ul", {
                className: u.bulletList,
                children: U.map(e => (0, i.jsx)("li", {
                    children: e
                }, e))
            }), (0, i.jsx)(i2.f, {
                className: u.descriptionText,
                children: l("Description.ThisWillAlsoReplaceAnyItemLevelSettings")
            }), (0, i.jsxs)(i5.U, {
                flexDirection: "row",
                classes: {
                    root: u.buttonContainer
                },
                children: [(0, i.jsx)(iA.f, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: N,
                    size: "medium",
                    className: u.actionButton,
                    children: l("Action.Confirm")
                }), (0, i.jsx)(iA.f, {
                    variant: "contained",
                    color: "secondary",
                    onClick: R,
                    size: "medium",
                    className: u.actionButton,
                    children: l("Action.Cancel")
                })]
            })]
        })), (0, i.jsxs)(iL.f, {
            open: n,
            onClose: P,
            maxWidth: "Small",
            color: "primaryBrand",
            classes: {
                paper: u.dialogPaper
            },
            children: [(0, i.jsxs)(iR.f, {
                className: u.dialogTitle,
                children: [(0, i.jsx)("span", {
                    className: u.dialogTitleText,
                    children: T ? l("Title.ConfirmOption") : l("Action.TimedOptions")
                }), !T && (0, i.jsx)(io.f, {
                    "aria-label": "Close",
                    onClick: P,
                    size: "small",
                    className: u.closeButton,
                    color: "inherit",
                    children: (0, i.jsx)(iD.f, {})
                })]
            }), (0, i.jsx)(iN.f, {
                className: u.dialogContent,
                children: D
            })]
        })
    }, [ei.f.ConfigureItem, ei.f.Creations, ei.f.AssetTypes]);

    function ar(e) {
        return "Tshirt" === e ? m.f.TShirt : "TshirtAccessory" === e ? m.f.TShirtAccessory : e
    }
    let ao = (0, iu.f)()(e => ({
            dialogContent: {
                padding: e.spacing(3),
                minWidth: 300
            },
            buttonContainer: {
                gap: e.spacing(2),
                width: "100%"
            },
            actionButton: {
                width: "100%"
            },
            dialogTitle: {
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center"
            },
            descriptionText: {
                marginBottom: e.spacing(2)
            },
            closeButton: {
                marginLeft: "auto"
            }
        })),
        as = (0, d.K)(e => {
            let t, n, r, o, {
                    open: s,
                    onClose: l
                } = e,
                {
                    translate: u,
                    translateHTML: c
                } = (0, d.A)(),
                {
                    classes: p
                } = ao(),
                {
                    enqueue: f,
                    close: h
                } = (0, iH.J)(),
                g = (0, v.W)(),
                [x, y] = (0, a.useState)(null),
                [b, I] = (0, a.useState)(() => B.L.generateRandomUuid()),
                [w, C] = (0, a.useState)({
                    showClothing: !1,
                    showMakeup: !1,
                    showAccessories: !1,
                    showCategorySubtypeDropdowns: !0
                }),
                [T, j] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                s ? (y(null), I(B.L.generateRandomUuid()), (0, iP.l)().then(() => {
                    let e = new Set(iP.v.map(e => ar(e))),
                        t = 3 === e.size && Array.from(ik.X).every(t => e.has(t));
                    if (j(t), t) C({
                        showClothing: !1,
                        showMakeup: !1,
                        showAccessories: !1,
                        showCategorySubtypeDropdowns: !0
                    });
                    else {
                        let t = [...e].every(e => ik.X.has(e) || ik.n.includes(e)),
                            n = e.has(m.f.EyeMakeup),
                            i = ik.o.some(t => e.has(t) && !ik.X.has(t)),
                            a = Array.from(ik.X).some(t => e.has(t));
                        C({
                            showClothing: i || a,
                            showMakeup: n,
                            showAccessories: e.has(m.f.Hat),
                            showCategorySubtypeDropdowns: !t
                        })
                    }
                })) : I(B.L.generateRandomUuid())
            }, [s]);
            let S = (0, a.useCallback)(async () => {
                    try {
                        await iK.f.bulkUpdateCollectible(b, null == g ? void 0 : g.id, [64, 66, 68], !0 === x), f({
                            message: u("Message.TimedOptionSettingsApplied"),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: i4.A,
                            autoHide: !0,
                            onClose: h
                        }), window.location.reload(), l()
                    } catch (e) {
                        f({
                            message: u(i8(await (0, tD.f)(e), "Error.Unknown")),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: i4.A,
                            autoHide: !0,
                            onClose: h
                        })
                    }
                }, [f, h, u, l, b, null == g ? void 0 : g.id, x]),
                M = (0, a.useCallback)(() => {
                    l()
                }, [l]),
                k = !T,
                E = k ? (t = new Set(iP.v.map(e => ar(e))), n = ik.o.some(e => t.has(e) && !ik.X.has(e)), r = Array.from(ik.X).some(e => t.has(e)), o = w.showCategorySubtypeDropdowns && (!r || n) ? ik.o.filter(e => t.has(e)) : Array.from(ik.X).filter(e => t.has(e)), {
                    clothing: o,
                    makeup: ik.n.filter(e => t.has(e)),
                    accessories: w.showCategorySubtypeDropdowns ? ik.U.filter(e => t.has(e)) : []
                }) : void 0;
            return k ? (0, i.jsx)(aa, {
                open: s,
                onClose: M,
                categoryFlags: w,
                assetTypesByCategory: E
            }) : (0, i.jsxs)(iL.f, {
                open: s,
                onClose: M,
                maxWidth: "Small",
                color: "primaryBrand",
                children: [(0, i.jsxs)(iR.f, {
                    className: p.dialogTitle,
                    children: [(0, i.jsx)("span", {
                        children: null === x ? u("Action.TimedOptions") : u("Action.Confirm")
                    }), (0, i.jsx)(io.f, {
                        "aria-label": "Close",
                        onClick: M,
                        size: "small",
                        className: p.closeButton,
                        color: "inherit",
                        children: (0, i.jsx)(iD.f, {})
                    })]
                }), (0, i.jsx)(iN.f, {
                    className: p.dialogContent,
                    children: null === x ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(i2.f, {
                            className: p.descriptionText,
                            children: u("Description.BulkUpdateTimedOptions")
                        }), (0, i.jsxs)(i5.U, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(iA.f, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    y(!0)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.TurnAllOn")
                            }), (0, i.jsx)(iA.f, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    y(!1)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.TurnAllOff")
                            })]
                        })]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(i2.f, {
                            className: p.descriptionText,
                            children: x ? c("Description.BulkUpdateOnConfirmation", [{
                                opening: "boldStart",
                                closing: "boldEnd",
                                content: e => (0, i.jsx)("strong", {
                                    children: e
                                })
                            }]) : c("Description.BulkUpdateOffConfirmation", [{
                                opening: "boldStart",
                                closing: "boldEnd",
                                content: e => (0, i.jsx)("strong", {
                                    children: e
                                })
                            }])
                        }), (0, i.jsxs)(i5.U, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(iA.f, {
                                variant: "contained",
                                color: "primaryBrand",
                                onClick: S,
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.Confirm")
                            }), (0, i.jsx)(iA.f, {
                                variant: "contained",
                                color: "secondary",
                                onClick: M,
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.Cancel")
                            })]
                        })]
                    })
                })]
            })
        }, [ei.f.ConfigureItem, ei.f.Creations]),
        al = Object.values(J.V),
        au = Object.values(iI.W),
        ad = ["publishSettings"],
        ac = e => {
            let {
                menuState: t
            } = e, {
                translate: n
            } = (0, d.A)(), {
                unifiedLogger: r
            } = (0, iS.X)(), {
                ready: o,
                value: s
            } = (0, u.f)(ij.D), {
                isFetched: l
            } = (0, v._)(), [c, p] = (0, a.useState)(!1), [f, h] = (0, a.useState)(!1), [x, y] = (0, a.useState)(0), [w, C] = (0, a.useState)(!1), [T, j] = (0, a.useState)(!1), [S, M] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                (0, iP.l)().then(() => {
                    j(!0)
                })
            }, []);
            let {
                sort: k,
                setSort: E,
                sortOrder: A,
                setSortOrder: L,
                isArchived: N,
                setIsArchived: R,
                isAgeRestrictedCollaboration: U,
                setIsAgeRestrictedCollaboration: O,
                isPublicOnly: D,
                setIsPublicOnly: _,
                isOnMarketplace: z,
                setIsOnMarketplace: q
            } = (0, es.f)(), [{
                filterIndex: F,
                publishSettings: G
            }] = (0, en.f)(["filterIndex", "publishSettings"]), H = (0, a.useContext)(V).isResolving, [, K] = (0, en.f)(["activeTab", "filterIndex"]), [, W] = (0, en.f)(ad), X = (0, a.useMemo)(() => {
                let e = I.f.getAssetType(t);
                return e !== m.f.AllCatalogAsset || Number(F) > 0 ? e : g.K
            }, [t, F]), Y = X in ik.w || X === m.f.AllCatalogAsset, Q = Y && s, Z = (0, iM.j)(G), $ = !!Q && l && !H && !w && ("true" === Z || "1" === Z);
            (0, a.useEffect)(() => {
                o && l && !H && void 0 !== Z && ($ || W({
                    publishSettings: null
                }, {
                    skipHistory: !0
                }))
            }, [o, H, l, $, Z, W]);
            let ee = (0, a.useCallback)(() => {
                    h(!1), $ && (C(!0), W({
                        publishSettings: null
                    }, {
                        skipHistory: !0
                    }))
                }, [$, W]),
                {
                    canUseTaxonomy: et,
                    isTaxonomyMode: ei
                } = (0, ih.f)(X),
                ea = ix(t, (0, v.W)()),
                {
                    isSortable: er,
                    isArchivable: eo
                } = (0, a.useMemo)(() => {
                    let e = ei || null == F ? void 0 : Number(F),
                        t = I.f.isAssetTypeArchivable(X, e);
                    return {
                        isSortable: I.f.isAssetTypeSortable(X),
                        isArchivable: t || I.f.isAssetTypeDirectlyArchivable(X)
                    }
                }, [X, F, ei]),
                el = n("Label.CategorizeByTaxonomy"),
                eu = (0, a.useCallback)(() => {
                    var e;
                    let t = null == (e = ea[0]) ? void 0 : e.type;
                    K({
                        activeTab: ei ? null != t ? t : X : (0, g.c)(),
                        filterIndex: 0
                    }, {
                        skipHistory: !0
                    })
                }, [ei, X, ea, K]),
                ed = (0, a.useMemo)(() => !er && !eo && !et && X !== m.f.MyExperiences && X !== m.f.SharedExperiences, [er, eo, et, X]),
                ec = (0, a.useCallback)(e => {
                    if (X === m.f.MyExperiences || X === m.f.SharedExperiences) al.includes(e) && E(t => ({
                        ...t,
                        [m.f.Place]: e
                    }));
                    else au.includes(e) && E(t => ({
                        ...t,
                        [X]: e
                    }))
                }, [E, X]),
                em = (0, a.useCallback)(() => {
                    L(e => e === B.f.Asc ? B.f.Desc : B.f.Asc)
                }, [L]),
                ep = (0, a.useCallback)(() => {
                    p(!0)
                }, []),
                ef = (0, a.useCallback)(() => {
                    let e = !U;
                    r.logClickEvent({
                        eventName: t_.f.ImpactedExperiencesFilterClick,
                        parameters: {
                            page: "creations",
                            action: e ? "enable" : "disable",
                            assetType: X.toString()
                        }
                    }), O(e => !e)
                }, [r, U, X, O]),
                eh = X === m.f.MyExperiences || X === m.f.SharedExperiences,
                ev = (0, a.useMemo)(() => eh ? Object.values(J.V).map(e => ({
                    value: e,
                    labelKey: b.s[e]
                })) : Object.values(iI.W).map(e => ({
                    value: e,
                    labelKey: b.R[e]
                })), [eh]),
                eg = (0, a.useMemo)(() => eh ? k[m.f.Place] : (0, iE.f)(X, k), [eh, k, X]),
                ex = Y && T && (iP.v.length > 0 || iP.U.length > 0);
            if (ed) return null;
            let ey = X === m.f.MyExperiences || X === m.f.SharedExperiences || eo || et || X === m.f.MeshPart,
                eb = X === m.f.MyExperiences || X === m.f.SharedExperiences,
                eI = X === m.f.Decal || X === m.f.MeshPart,
                ew = !!Q || ex,
                eC = !ew && !!(X === m.f.MyExperiences || eb || eo && X);
            return (0, i.jsxs)("div", {
                className: "flex flex-row justify-start items-center gap-large [flex-wrap:wrap] padding-left-medium max-large:[flex-grow:1] max-large:justify-between",
                children: [ey && (0, i.jsxs)("div", {
                    className: "flex flex-row items-center gap-medium",
                    children: [eC && (0, i.jsx)("span", {
                        className: "text-body-large margin-right-[16px]",
                        children: n("Label.ShowPrefix")
                    }), X === m.f.MyExperiences && (0, i.jsx)(iT.f, {
                        size: "Large",
                        placement: "Start",
                        label: n("Label.Public"),
                        isChecked: D,
                        onCheckedChange: () => _(e => !e)
                    }), eb && (0, i.jsx)(iT.f, {
                        size: "Large",
                        placement: "Start",
                        label: n("Label.Impacted"),
                        isChecked: U,
                        onCheckedChange: ef
                    }), eo && X && (0, i.jsx)(iT.f, {
                        size: "Large",
                        placement: "Start",
                        label: Q ? n("Action.ShowArchived") : n("Label.Archived"),
                        isChecked: N,
                        onCheckedChange: () => R(e => !e)
                    }), et && (0, i.jsx)(iT.f, {
                        size: "Large",
                        placement: "Start",
                        label: el,
                        isChecked: ei,
                        onCheckedChange: eu
                    }), ew && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)("span", {
                            className: "flex [height:20px] margin-x-[12px]",
                            children: (0, i.jsx)(iw.f, {
                                orientation: "vertical"
                            })
                        }), (0, i.jsxs)(iC.V, {
                            open: S,
                            onOpenChange: M,
                            children: [(0, i.jsx)(iC.J, {
                                asChild: !0,
                                children: (0, i.jsx)(P.f, {
                                    as: "button",
                                    icon: "icon-filled-gear",
                                    size: "Medium",
                                    variant: "Utility",
                                    isCircular: !0,
                                    ariaLabel: n("Label.Settings")
                                })
                            }), (0, i.jsx)(iC.T, {
                                side: "bottom",
                                align: "end",
                                ariaLabel: n("Label.Settings"),
                                children: (0, i.jsx)(nW.k, {
                                    size: "Medium",
                                    children: (0, i.jsxs)(nW.T, {
                                        children: [ex && (0, i.jsx)(nW.d, {
                                            value: "timed-options",
                                            title: n("Action.TimedOptions"),
                                            onSelect: () => {
                                                M(!1), ep()
                                            }
                                        }), Q && (0, i.jsx)(nW.d, {
                                            value: "publish-settings",
                                            title: n("Action.StudioPublishSettings"),
                                            onSelect: () => {
                                                M(!1), y(e => e + 1), h(!0)
                                            }
                                        })]
                                    })
                                })
                            })]
                        })]
                    }), eI && (0, i.jsx)(iT.f, {
                        size: "Large",
                        placement: "Start",
                        label: n("Label.OnCreatorStore"),
                        isChecked: z,
                        onCheckedChange: () => q(e => !e)
                    })]
                }), er && (0, i.jsxs)("div", {
                    className: "flex flex-row items-center gap-xsmall [flex-wrap:nowrap]",
                    children: [(0, i.jsx)(nK.x, {
                        size: "Medium",
                        ariaLabel: n("Label.SortBy"),
                        placeholder: n("Label.SortBy"),
                        value: eg,
                        onValueChange: ec,
                        children: (0, i.jsx)(nW.k, {
                            children: ev.map(e => (0, i.jsx)(nW.d, {
                                value: e.value,
                                title: n("Label.SortByOption", {
                                    sortOption: n(e.labelKey)
                                })
                            }, e.value))
                        })
                    }), (0, i.jsx)(P.f, {
                        as: "button",
                        size: "Medium",
                        variant: "Utility",
                        icon: A === B.f.Asc ? "icon-regular-arrow-wide-up" : "icon-regular-arrow-wide-down",
                        ariaLabel: n("Heading.SortOrder"),
                        onClick: em
                    })]
                }), (0, i.jsx)(as, {
                    open: c,
                    onClose: () => p(!1)
                }), (0, i.jsx)(i1, {
                    open: f || $,
                    onClose: ee
                }, x)]
            })
        },
        am = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                verificationMetadata: a,
                group: r
            } = e, o = [m.f.UpcomingEvent, m.f.PastEvent, m.f.DraftEvent], s = !!t.submenuItem && o.includes(t.submenuItem.type);
            return (0, i.jsxs)("div", {
                className: "flex justify-between padding-top-small",
                children: [t.menuItem.type === m.f.TShirt && (0, i.jsx)(ia, {
                    data: a
                }), !s && (0, i.jsx)("div", {
                    className: "flex width-full padding-bottom-large [align-content:flex-start] [row-gap:12px] justify-between flex-row items-center wrap",
                    children: t.menuItem.type === m.f.Moments ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(ie, {}), (0, i.jsx)(n7, {})]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [t.submenuItem && (0, i.jsx)(ib, {
                            menuState: t,
                            onMenuStateChange: n,
                            group: r
                        }), (0, i.jsx)(ac, {
                            menuState: t
                        })]
                    })
                })]
            })
        };
    var ap = e.i(396875),
        af = e.i(71375),
        ah = e.i(83560),
        av = e.i(576069),
        ag = e.i(134817);
    let ax = [],
        ay = new Date(0).toISOString(),
        ab = e => e.startsWith("Label.AbuseType."),
        aI = e => {
            var t, n;
            return {
                momentId: e.uid,
                description: null != (t = e.description) ? t : "",
                experienceName: "",
                modifiedAt: null != (n = e.uploadedAt) ? n : ay,
                status: ex,
                moderation: {
                    violationUid: e.uid,
                    abuseTypeLabelKeys: e.abuseTypeLabelKeys,
                    ...null != e.uploadedAt ? {
                        uploadedAt: e.uploadedAt
                    } : {}
                }
            }
        };

    function aw(e) {
        return null != e.universeId ? e.universeId : "experienceId" in e && "number" == typeof e.experienceId ? e.experienceId : void 0
    }
    var aC = e.i(878962),
        aT = e.i(214918);
    let aj = (e, t) => {
            let {
                user: n
            } = (0, F.f)(), {
                enabled: i,
                thumbnailUrl: r,
                videoUrl: o
            } = t, s = null == n ? void 0 : n.id, l = (0, a.useMemo)(() => r || o ? {
                thumbnailUrl: null != r ? r : "",
                videoUrl: null != o ? o : ""
            } : null, [r, o]), [u, d] = (0, a.useState)(null);
            return ((0, a.useEffect)(() => {
                if (l || null == s || !i || null == e || "" === e) return;
                let t = !1;
                return (async () => {
                    let n = {
                        draftId: e,
                        userId: s
                    };
                    tX(tq.LoadLocalVideoMedia, n);
                    try {
                        let i = await eR(s, e);
                        t || (d(i), null != i && tY(tq.LoadLocalVideoMedia, n))
                    } catch (n) {
                        tH(tq.LoadLocalVideoMedia, n, {
                            draftId: e
                        }), t || d(null)
                    }
                })(), () => {
                    t = !0
                }
            }, [e, i, l, s]), l) ? l : i ? u : null
        },
        aS = "block width-full height-full max-w-full max-h-full object-contain",
        aM = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)("div", {
                className: "flex items-center justify-center radius-medium bg-surface-200 width-full shrink-0 overflow-hidden h-[240px]",
                "data-testid": "moments-video-preview-container",
                children: t
            })
        },
        ak = e => {
            let {
                thumbnailUrl: t,
                videoUrl: n
            } = e;
            return n ? (0, i.jsx)(aM, {
                children: (0, i.jsx)("video", {
                    "aria-label": "Moment video preview",
                    className: "radius-medium ".concat(aS),
                    controls: !0,
                    playsInline: !0,
                    poster: t,
                    src: n,
                    children: (0, i.jsx)("track", {
                        kind: "captions"
                    })
                })
            }) : t ? (0, i.jsx)(aM, {
                children: (0, i.jsx)("img", {
                    alt: "Moment thumbnail preview",
                    className: "radius-medium ".concat(aS),
                    src: t
                })
            }) : (0, i.jsx)(aM, {})
        },
        aE = (0, d.K)(e => {
            var t, n, r;
            let {
                moment: o,
                open: s,
                onOpenChange: l,
                onMomentMetadataChange: u,
                onPublish: c,
                onDelete: m,
                publishingDraftId: p = null,
                deletingMomentKey: f = null,
                isPublishDisabled: h = !1
            } = e, {
                translate: v
            } = (0, d.A)(), {
                locale: g
            } = (0, d.z)(), x = nk(), y = t$(g), [b, I] = (0, a.useState)(() => {
                var e, t, n, i;
                let a;
                return o && ((a = {
                    id: null != (i = aw(n = o)) ? i : 0,
                    name: n.experienceName
                }).id > 0 || (null != (e = null == (t = a.name) ? void 0 : t.length) ? e : 0) > 0) ? a : void 0
            }), [w, C] = (0, a.useState)(() => {
                var e;
                return null != (e = null == o ? void 0 : o.description) ? e : ""
            }), [T, j] = (0, a.useState)(), S = null != (t = null != T ? T : null == o ? void 0 : o.locale) ? t : y, M = (null == o ? void 0 : o.status) === eg && !0 === o.hasLocalVideo, k = aj((null == o ? void 0 : o.status) === eg ? o.draftId : null, {
                enabled: s && M,
                thumbnailUrl: null == o ? void 0 : o.thumbnailUrl,
                videoUrl: null == o ? void 0 : o.videoUrl
            }), E = (0, a.useCallback)(() => {
                o && !h && null == p && (null == c || c(o))
            }, [h, o, c, p]), P = (0, a.useCallback)(() => {
                o && f !== nE(o) && (null == m || m(o))
            }, [f, o, m]), A = (0, a.useCallback)(e => {
                o && e.id && e.name && (I(e), null == u || u(o, {
                    experienceId: e.id,
                    rootPlaceId: e.rootPlaceId,
                    experienceName: e.name
                }))
            }, [o, u]), L = (0, a.useCallback)(e => {
                C(e.target.value)
            }, []), N = (0, a.useCallback)(e => {
                j(e), o && e !== o.locale && (null == u || u(o, {
                    locale: e
                }))
            }, [o, u]), R = (0, a.useCallback)(() => {
                o && w !== o.description && (null == u || u(o, {
                    description: w
                }))
            }, [w, o, u]), U = (0, a.useCallback)(() => {
                R()
            }, [R]), O = (0, a.useCallback)(e => {
                e || R(), l(e)
            }, [R, l]);
            if (!o) return null;
            let D = nE(o),
                _ = null != p && p === D,
                z = null != p,
                q = null != f && f === D,
                V = o.status === eh,
                F = o.status === eg,
                B = F && !_,
                G = !V && null != c && (F && M || _),
                H = null != m,
                K = w.length >= 140;
            return (0, i.jsx)(aC.q, {
                open: s,
                onOpenChange: O,
                children: (0, i.jsxs)(aC.U, {
                    closeLabel: v("Action.Close"),
                    largeScreenVariant: "side",
                    children: [(0, i.jsx)(aC.L, {
                        children: v("Heading.EditMoment")
                    }), (0, i.jsxs)(aC.O, {
                        className: "flex flex-col gap-y-medium padding-top-small padding-bottom-large",
                        children: [(0, i.jsx)(ak, {
                            thumbnailUrl: null != (n = null == k ? void 0 : k.thumbnailUrl) ? n : o.thumbnailUrl,
                            videoUrl: null != (r = null == k ? void 0 : k.videoUrl) ? r : o.videoUrl
                        }), B ? (0, i.jsx)(i.Fragment, {
                            children: b ? (0, i.jsx)(nO, {
                                experience: b,
                                onChangeExperience: () => I(void 0)
                            }) : (0, i.jsx)(nH, {
                                onExperienceResolved: A
                            })
                        }) : b ? (0, i.jsxs)("div", {
                            className: "flex flex-col gap-y-xsmall width-full margin-top-small",
                            children: [(0, i.jsx)("span", {
                                className: "text-body-small content-muted",
                                children: v("CreateMomentModal.ExperienceInput.Label")
                            }), (0, i.jsx)(nO, {
                                experience: b,
                                hideTitle: !0
                            })]
                        }) : null, x ? (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: B ? (0, i.jsx)(nX, {
                                value: S,
                                onChange: N,
                                isDisabled: _
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: v("CreateMomentModal.LanguageInput.Label")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-content-language-readonly",
                                    children: t0(o.locale)
                                })]
                            })
                        }) : null, (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: B ? (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)(aT.f, {
                                    id: "edit-moment-description-".concat(D),
                                    label: v("MomentsTable.Header.Description"),
                                    rows: 3,
                                    placeholder: v("MomentsTable.Placeholders.Description"),
                                    size: "Small",
                                    value: w,
                                    maxLength: 140,
                                    onBlur: U,
                                    onChange: L
                                }), (0, i.jsx)("span", {
                                    "aria-live": "polite",
                                    className: K ? "text-body-small content-system-alert text-align-x-right" : "text-body-small content-muted text-align-x-right",
                                    "data-testid": "edit-moment-description-char-count",
                                    children: "".concat(w.length, "/").concat(140)
                                })]
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: v("MomentsTable.Header.Description")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-description-readonly",
                                    children: w || "-"
                                })]
                            })
                        })]
                    }), (0, i.jsx)(aC.$, {
                        className: "width-full",
                        children: (0, i.jsxs)("div", {
                            className: "flex gap-small width-full",
                            children: [G ? (0, i.jsx)(el.f, {
                                variant: "Emphasis",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: h || z,
                                isLoading: _,
                                onClick: E,
                                children: v("Action.Publish")
                            }) : null, H ? (0, i.jsx)(el.f, {
                                variant: "Standard",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: q,
                                isLoading: q,
                                onClick: P,
                                children: (0, i.jsx)("span", {
                                    className: "content-action-alert",
                                    children: v("Action.Delete")
                                })
                            }) : null]
                        })
                    })]
                })
            })
        }, [ei.f.Creations, ei.f.Controls]);
    var aP = e.i(561178),
        aA = e.i(493924);
    let aL = e => {
        let {
            onCreateClick: t
        } = e, {
            translate: n
        } = (0, d.A)();
        return (0, i.jsx)(aA.U, {
            title: n("Heading.ReachPlayersDirectlyInMoments"),
            size: "large",
            illustration: "videos",
            description: (0, i.jsxs)(i.Fragment, {
                children: [n("Description.UploadExternalVideosToMoments"), " ", (0, i.jsx)(aP.f, {
                    "aria-label": n("Label.LearnMore"),
                    href: it.T,
                    target: "_blank",
                    rel: "noopener noreferrer",
                    variant: "Inline",
                    underline: "always",
                    isExternal: !1,
                    children: n("Label.LearnMore")
                })]
            }),
            children: (0, i.jsx)(el.f, {
                variant: "Emphasis",
                size: "Large",
                type: "button",
                onClick: t,
                children: n("Action.CreateMoments")
            })
        })
    };
    var aN = e.i(260022),
        aR = e.i(923499),
        aU = e.i(910281),
        aO = e.i(125677),
        aD = e.i(20227),
        a_ = e.i(494601);
    let az = "text/plain",
        aq = async e => {
            if ("u" < typeof ClipboardItem || "function" != typeof navigator.clipboard.write) return e.then(e => navigator.clipboard.writeText(e));
            let t = e.then(e => new Blob([e], {
                type: az
            }));
            return t.catch(() => {}), navigator.clipboard.write([new ClipboardItem({
                [az]: t
            })])
        }, aV = e => {
            let {
                moment: t
            } = e, n = (() => {
                let {
                    ready: e,
                    value: t
                } = (0, u.f)(w.s);
                return e && null != t && t
            })(), {
                translate: r
            } = (0, d.A)(), {
                createMomentShareLink: o,
                isCreatingMomentShareLink: s
            } = function() {
                let {
                    mutateAsync: e,
                    isPending: t
                } = (0, eY.f)({
                    mutationFn: e => nS.createStaticLink(e)
                });
                return {
                    createMomentShareLink: (0, a.useCallback)(t => e(t), [e]),
                    isCreatingMomentShareLink: t
                }
            }(), l = (0, a.useRef)(!1), c = r("Action.CopyMomentLink"), m = r("Message.MomentLinkCopied"), p = r("Message.MomentLinkCopyFailed"), f = (0, a.useCallback)(async () => {
                if (l.current || t.status !== eh || !t.feedItemId) return;
                l.current = !0;
                let e = {
                    momentId: t.momentId,
                    feedItemId: t.feedItemId
                };
                tX(tq.CopyShareLink, e);
                try {
                    if (!("clipboard" in navigator)) throw Error("Clipboard API is unavailable");
                    let n = o({
                        momentId: t.momentId,
                        feedItemId: t.feedItemId
                    });
                    await Promise.all([n, aq(n)]), tY(tq.CopyShareLink, e), (0, ah.c)({
                        title: m
                    })
                } catch (t) {
                    tH(tq.CopyShareLink, t, e), (0, ah.c)({
                        title: p
                    })
                } finally {
                    l.current = !1
                }
            }, [o, m, p, t]);
            return n && t.status === eh && t.feedItemId ? (0, i.jsx)(aU.W, {
                position: "top-center",
                title: c,
                children: (0, i.jsx)(aU.y, {
                    asChild: !0,
                    children: (0, i.jsx)(P.f, {
                        ariaLabel: c,
                        icon: "icon-regular-chain-link",
                        isDisabled: s,
                        size: "Small",
                        type: "button",
                        variant: "Utility",
                        onClick: f
                    })
                })
            }) : null
        }, aF = {
            [eh]: "bg-system-success",
            [ev]: "bg-system-warning",
            [eg]: "bg-surface-300",
            [ex]: "bg-system-alert"
        }, aB = e => {
            let {
                status: t,
                label: n
            } = e;
            return (0, i.jsxs)("span", {
                className: "inline-flex items-center gap-xsmall",
                children: [(0, i.jsx)("span", {
                    "aria-hidden": !0,
                    className: "size-[8px] radius-circle shrink-0 ".concat(aF[t]),
                    "data-testid": "moment-status-dot-".concat(t)
                }), (0, i.jsx)("span", {
                    children: n
                })]
            })
        };
    var aG = e.i(458451),
        aH = e.i(218701),
        aK = e.i(363717);
    let aW = (0, d.K)(e => {
            let t, {
                    moment: n
                } = e,
                {
                    translate: r
                } = (0, d.A)(),
                {
                    user: o
                } = (0, aG.s)(),
                s = n.status === eg,
                l = s && !0 === n.hasLocalVideo,
                u = aj(s ? n.draftId : null, {
                    enabled: l,
                    thumbnailUrl: n.thumbnailUrl,
                    videoUrl: n.videoUrl
                }),
                {
                    assetId: c
                } = n,
                [m, p] = (0, a.useState)(!1),
                f = r("Label.MomentVideoPreview"),
                h = !!(null == u ? void 0 : u.videoUrl) || null != c,
                v = (0, a.useCallback)(() => {
                    h && p(!0)
                }, [h]),
                g = (0, a.useCallback)(() => {
                    p(!1)
                }, []);
            t = (null == u ? void 0 : u.thumbnailUrl) ? (0, i.jsx)("img", {
                alt: "",
                className: "radius-small [object-fit:cover]",
                "data-testid": "moment-video-thumbnail-image",
                height: 48,
                src: u.thumbnailUrl,
                width: 48
            }) : null != c ? (0, i.jsx)("div", {
                className: "radius-small clip size-[48px]",
                "data-testid": "moment-video-thumbnail-image",
                children: (0, i.jsx)(aH.x, {
                    alt: "",
                    containerClass: "block",
                    imgClassName: "[object-fit:cover]",
                    returnPolicy: aH.X.PlaceHolder,
                    targetId: c,
                    type: aH.V.assetThumbnail
                })
            }) : (0, i.jsx)("div", {
                "aria-hidden": !0,
                className: "radius-small bg-surface-200 size-[48px]"
            });
            let x = null;
            return ((null == u ? void 0 : u.videoUrl) ? x = (0, i.jsx)("video", {
                "aria-label": f,
                autoPlay: !0,
                className: "radius-medium block max-width-[500px] max-height-[500px]",
                loop: !0,
                muted: !0,
                playsInline: !0,
                src: u.videoUrl
            }) : null != c && (x = (0, i.jsx)("div", {
                "aria-label": f,
                className: "radius-medium clip max-width-[500px] max-height-[500px] bg-surface-200",
                children: (0, i.jsx)(aK.g, {
                    cmcdInstanceType: aK.Q.CreatorDashboard,
                    cmcdUserId: null == o ? void 0 : o.id,
                    videoAssetId: String(c),
                    environment: "production",
                    src: void 0,
                    autoPlay: !0,
                    disableControls: !0,
                    loop: !0,
                    muted: !0
                })
            })), h) ? (0, i.jsxs)(iC.V, {
                open: m,
                onOpenChange: p,
                children: [(0, i.jsx)(iC.r, {
                    asChild: !0,
                    children: (0, i.jsx)("button", {
                        "aria-label": f,
                        className: "padding-none bg-none stroke-none",
                        type: "button",
                        onPointerEnter: v,
                        onPointerLeave: g,
                        onFocus: v,
                        onBlur: g,
                        children: t
                    })
                }), (0, i.jsx)(iC.T, {
                    align: "start",
                    ariaLabel: f,
                    className: "outline-none",
                    side: "bottom",
                    children: x
                })]
            }) : t
        }, [ei.f.Creations]),
        aX = [10, 25, 50],
        aY = {
            [eh]: "MomentsTable.NoActiveMoments",
            [eg]: "MomentsTable.NoDraftMoments",
            [ex]: "MomentsTable.NoModeratedMoments"
        },
        aJ = e => {
            let {
                moment: t,
                disabled: n,
                onBlur: r
            } = e, {
                translate: o
            } = (0, d.A)(), s = nE(t), [l, u] = (0, a.useState)(t.description), c = l.length >= 140, m = (0, a.useCallback)(e => {
                u(e.target.value)
            }, []), p = (0, a.useCallback)(e => {
                r(t, e)
            }, [t, r]);
            return (0, i.jsxs)("div", {
                className: "flex width-full flex-col gap-y-xsmall",
                children: [(0, i.jsx)(nD.f, {
                    id: "moment-description-".concat(s),
                    "aria-label": o("MomentsTable.Header.Description"),
                    value: l,
                    isDisabled: n,
                    maxLength: 140,
                    placeholder: o("MomentsTable.Placeholders.Description"),
                    size: "Small",
                    onBlur: p,
                    onChange: m
                }), (0, i.jsx)("span", {
                    "aria-live": "polite",
                    className: c ? "text-body-small content-system-alert text-align-x-right" : "text-body-small content-muted text-align-x-right",
                    "data-testid": "moment-description-char-count-".concat(s),
                    children: "".concat(l.length, "/").concat(140)
                })]
            })
        },
        aQ = e => {
            let t, {
                    moment: n,
                    editLabel: r,
                    publishingDraftId: o,
                    isPublishDisabled: s,
                    showMomentDetailColumns: l,
                    showContentLanguageColumn: u,
                    showModerationColumns: c,
                    moreDetailsLabel: m,
                    reportAppealsUrl: p,
                    statusLabel: f,
                    onEditMoment: h,
                    onDescriptionBlur: v,
                    onPublishMoment: g
                } = e,
                {
                    translate: x,
                    translateWithNamespace: y
                } = (0, d.A)(),
                {
                    locale: b
                } = (0, d.z)(),
                I = nE(n),
                w = n.status === eg,
                C = n.status === ex ? n.moderation : void 0,
                T = (0, a.useCallback)(() => {
                    h(n)
                }, [n, h]),
                j = (0, a.useCallback)(() => {
                    n.status === eg && (null == g || g(n.draftId))
                }, [n, g]),
                S = (0, a.useMemo)(() => {
                    var e;
                    if (!c) return null;
                    let t = (null != (e = null == C ? void 0 : C.abuseTypeLabelKeys) ? e : []).filter(ab);
                    return (t.length > 0 ? t : ["Label.AbuseType.Other"]).map(e => y(ei.f.NotApproved, e)).join(", ")
                }, [C, c, y]),
                M = null != C ? (t = C.violationUid, p ? "".concat(p, "#/v/").concat(encodeURIComponent(t)) : null) : null,
                k = (0, i.jsx)(aR.d, {
                    children: (0, i.jsx)(aB, {
                        label: f,
                        status: n.status
                    })
                });
            return (0, i.jsxs)(aR.N, {
                isHoverable: !0,
                "data-testid": "moment-row-".concat(I),
                children: [(0, i.jsx)(aR.d, {
                    children: (0, i.jsx)(aW, {
                        moment: n
                    })
                }), l ? (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(aR.d, {
                        children: n.experienceName
                    }), (0, i.jsx)(aR.d, {
                        children: n.status === eh ? (0, i.jsx)("span", {
                            "data-testid": "moment-description-".concat(I),
                            children: n.description || "-"
                        }) : (0, i.jsx)(aJ, {
                            moment: n,
                            disabled: null != o && o === I,
                            onBlur: v
                        }, "moment-description-".concat(I, "-").concat(n.modifiedAt))
                    })]
                }) : null, u ? (0, i.jsx)(aR.d, {
                    children: (0, i.jsx)("span", {
                        "data-testid": "moment-content-language-".concat(I),
                        children: t0(n.locale)
                    })
                }) : null, c ? (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(aR.d, {
                        children: (0, i.jsx)("span", {
                            "data-testid": "moment-description-".concat(I),
                            children: n.description || "-"
                        })
                    }), (0, i.jsx)(aR.d, {
                        children: (0, i.jsx)("span", {
                            "data-testid": "moment-upload-time-".concat(I),
                            children: (null == C ? void 0 : C.uploadedAt) != null && ((e, t) => {
                                let n = new Date(e),
                                    i = n.getTime();
                                if (Number.isNaN(i) || 0 === i) return "";
                                let a = Intl.DateTimeFormat().resolvedOptions().timeZone,
                                    r = new Intl.DateTimeFormat(t.toString(), {
                                        weekday: "short",
                                        month: "short",
                                        day: "numeric",
                                        hour: "numeric",
                                        minute: "2-digit",
                                        hour12: !0,
                                        timeZone: a
                                    }).formatToParts(n),
                                    o = e => {
                                        var t, n;
                                        return null != (t = null == (n = r.find(t => t.type === e)) ? void 0 : n.value) ? t : ""
                                    },
                                    s = o("dayPeriod").toUpperCase();
                                return "".concat(o("weekday"), ", ").concat(o("month"), " ").concat(o("day"), ", ").concat(o("hour"), ":").concat(o("minute")).concat(s)
                            })(C.uploadedAt, null != b ? b : d.v.English) || "-"
                        })
                    }), (0, i.jsx)(aR.d, {
                        children: (0, i.jsx)("span", {
                            "data-testid": "moment-moderation-reason-".concat(I),
                            children: S
                        })
                    }), k, (0, i.jsx)(aR.d, {
                        align: "end",
                        children: null != M ? (0, i.jsx)(aU.W, {
                            position: "top-center",
                            title: m,
                            children: (0, i.jsx)(aU.y, {
                                asChild: !0,
                                children: (0, i.jsx)(P.f, {
                                    as: "a",
                                    href: M,
                                    target: "_blank",
                                    rel: "noopener noreferrer",
                                    ariaLabel: m,
                                    icon: "icon-regular-arrow-up-right-from-square",
                                    size: "Small",
                                    variant: "Utility",
                                    "data-testid": "moment-violation-details-".concat(I)
                                })
                            })
                        }) : null
                    })]
                }) : (0, i.jsxs)(i.Fragment, {
                    children: [k, (0, i.jsx)(aR.d, {
                        align: "end",
                        children: (0, i.jsxs)("div", {
                            className: "inline-flex items-center gap-xsmall",
                            children: [(0, i.jsx)(aV, {
                                moment: n
                            }), (0, i.jsx)(aU.W, {
                                position: "top-center",
                                title: r,
                                children: (0, i.jsx)(aU.y, {
                                    asChild: !0,
                                    children: (0, i.jsx)(P.f, {
                                        ariaLabel: r,
                                        icon: "icon-regular-pencil",
                                        size: "Small",
                                        type: "button",
                                        variant: "Utility",
                                        onClick: T
                                    })
                                })
                            }), w && !0 === n.hasLocalVideo && g ? (0, i.jsx)(el.f, {
                                size: "Small",
                                type: "button",
                                variant: "Standard",
                                isDisabled: s || null != o,
                                onClick: j,
                                children: x("Action.Publish")
                            }) : null]
                        })
                    })]
                })]
            })
        },
        aZ = (0, d.K)(e => {
            let {
                moments: t,
                onEditMoment: n,
                onMomentMetadataChange: r,
                onPublishMoment: o,
                publishingDraftId: s = null,
                isPublishDisabled: l = !1,
                hasNextPage: u = !1,
                fetchNextPage: c,
                serverPageSize: m = 25
            } = e, {
                translate: p,
                translateWithNamespace: f
            } = (0, d.A)(), {
                classes: {
                    gridContainer: h,
                    createButtonContainer: v
                }
            } = (0, a_.f)(), {
                statusTab: g
            } = nN(), x = nk(), y = (0, a.useCallback)(e => {
                switch (e) {
                    case eh:
                        return p("MomentsTable.Pills.Active");
                    case ev:
                        return p("MomentsTable.Pills.Pending");
                    case eg:
                        return p("MomentsTable.Pills.Draft");
                    case ex:
                        return p("MomentsTable.Pills.Moderated");
                    default:
                        return e
                }
            }, [p]), b = g === eh, I = g === ex, w = !I, C = x && !I, T = (0, a.useMemo)(() => g === eg ? t.filter(e => e.status === eg || e.status === ev) : t.filter(e => e.status === g), [t, g]), {
                page: j,
                rowsPerPage: S,
                onPageChange: M,
                onRowsPerPageChange: k
            } = (0, aD.f)({
                count: T.length,
                initialRowsPerPage: 10,
                resetKey: g
            }), {
                currentPage: E
            } = (0, aO.f)(T, {
                page: j,
                rowsPerPage: S,
                hasNextPage: !!b && u,
                fetchNextPage: b ? c : void 0,
                fetchLimit: m
            }), P = (0, a.useCallback)((e, t) => {
                let n = t.target.value;
                n !== e.description && r(e, {
                    description: n
                })
            }, [r]), A = (0, a.useCallback)(e => {
                M(void 0, e)
            }, [M]), N = p("Action.Edit"), R = f(ei.f.OAuth, "Label.OAuthMoreDetails"), U = (0, aN.h)("reportAppealsUrl", "production", "global"), O = (0, i.jsx)(aR.U, {
                children: p("MomentsTable.Header.Status")
            }), D = 3 + 2 * !!w + +!!C + 3 * !!I;
            return (0, i.jsx)("div", {
                className: h,
                children: (0, i.jsx)("div", {
                    className: (0, L.q)(v, "flex flex-col gap-xlarge width-full self-stretch"),
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col gap-y-medium width-full",
                        children: [(0, i.jsxs)(aR.s, {
                            className: "width-full",
                            variant: "Framed",
                            children: [(0, i.jsx)(aR.E, {
                                children: (0, i.jsxs)(aR.N, {
                                    children: [(0, i.jsx)(aR.U, {
                                        children: p("MomentsTable.Header.Moments")
                                    }), w ? (0, i.jsxs)(i.Fragment, {
                                        children: [(0, i.jsx)(aR.U, {
                                            children: p("MomentsTable.Header.ExperienceName")
                                        }), (0, i.jsx)(aR.U, {
                                            children: p("MomentsTable.Header.Description")
                                        })]
                                    }) : null, C ? (0, i.jsx)(aR.U, {
                                        children: p("CreateMomentModal.LanguageInput.Label")
                                    }) : null, I ? (0, i.jsxs)(i.Fragment, {
                                        children: [(0, i.jsx)(aR.U, {
                                            children: p("MomentsTable.Header.Description")
                                        }), (0, i.jsx)(aR.U, {
                                            children: f(ei.f.AppealsPortal, "Label.UploadTime")
                                        }), (0, i.jsx)(aR.U, {
                                            children: p("TableHeader.Reason")
                                        }), O, (0, i.jsx)(aR.U, {
                                            align: "end",
                                            children: " "
                                        })]
                                    }) : (0, i.jsxs)(i.Fragment, {
                                        children: [O, (0, i.jsx)(aR.U, {
                                            align: "end",
                                            children: " "
                                        })]
                                    })]
                                })
                            }), (0, i.jsx)(aR.z, {
                                children: 0 === T.length ? (0, i.jsx)(aR.N, {
                                    children: (0, i.jsx)(aR.d, {
                                        colSpan: D,
                                        align: "center",
                                        className: "padding-y-xxlarge",
                                        children: (0, i.jsx)("span", {
                                            className: "text-body-medium content-muted block padding-y-xxlarge",
                                            "data-testid": "moments-table-empty-filter-message",
                                            children: p(aY[g])
                                        })
                                    })
                                }) : E.map(e => (0, i.jsx)(aQ, {
                                    moment: e,
                                    editLabel: N,
                                    publishingDraftId: s,
                                    isPublishDisabled: l,
                                    showMomentDetailColumns: w,
                                    showContentLanguageColumn: C,
                                    showModerationColumns: I,
                                    moreDetailsLabel: R,
                                    reportAppealsUrl: U,
                                    statusLabel: y(e.status),
                                    onEditMoment: n,
                                    onDescriptionBlur: P,
                                    onPublishMoment: o
                                }, nE(e)))
                            })]
                        }), T.length > 0 ? (0, i.jsx)(aR.c, {
                            paginationAriaLabel: "Pagination",
                            page: j,
                            rowsPerPage: S,
                            totalRows: T.length,
                            rowsPerPageOptions: aX,
                            onPageChange: A,
                            onRowsPerPageChange: k
                        }) : null]
                    })
                })
            })
        }, [ei.f.Creations, ei.f.Controls, ei.f.NotApproved, ei.f.AppealsPortal, ei.f.OAuth]),
        a$ = (0, d.K)(e => {
            let {
                onRetry: t
            } = e, {
                translate: n
            } = (0, d.A)();
            return (0, i.jsx)(eu.f, {
                className: "width-full",
                variant: "Feedback",
                severity: "Error",
                hasCloseAffordance: !1,
                primaryActionLabel: n("Action.FailedToLoadPage"),
                onPrimaryAction: t,
                "data-testid": "moments-creator-eligibility-error-banner",
                children: (0, i.jsxs)("div", {
                    className: "flex flex-col gap-xsmall",
                    children: [(0, i.jsx)("span", {
                        className: "text-label-medium content-emphasis",
                        children: n("Heading.GenericError")
                    }), (0, i.jsx)("span", {
                        className: "text-body-medium content-default",
                        children: n("Message.FailedToLoadPage")
                    })]
                })
            })
        }, [ei.f.Error]);
    var a0 = e.i(917852);
    let a1 = () => {
            window.open(a0.Y, "_blank", "noopener,noreferrer")
        },
        a2 = (0, d.K)(() => {
            let {
                translate: e
            } = (0, d.A)();
            return (0, i.jsx)(eu.f, {
                className: "width-full",
                variant: "Feedback",
                severity: "Warning",
                hasCloseAffordance: !1,
                primaryActionLabel: e("Label.VerifyId"),
                onPrimaryAction: a1,
                "data-testid": "moments-id-verification-banner",
                children: (0, i.jsxs)("div", {
                    className: "flex flex-col gap-xsmall",
                    children: [(0, i.jsx)("span", {
                        className: "text-label-medium content-emphasis",
                        children: e("Heading.MomentsIdVerificationRequired")
                    }), (0, i.jsx)("span", {
                        className: "text-body-medium content-default",
                        children: e("Message.MomentsIdVerificationRequired")
                    })]
                })
            })
        }, [ei.f.Creations]),
        a4 = () => {
            var e;
            (() => {
                let {
                    user: e
                } = (0, F.f)(), t = null == e ? void 0 : e.id;
                (0, a.useEffect)(() => () => {
                    void 0 !== t && (() => {
                        for (let e of eT.keys()) {
                            let t = eT.get(e);
                            t && (URL.revokeObjectURL(t.thumbnailUrl), URL.revokeObjectURL(t.videoUrl), eT.delete(e))
                        }
                    })()
                }, [t])
            })();
            let {
                translate: t
            } = (0, d.A)(), {
                user: n
            } = (0, F.f)(), r = null == n ? void 0 : n.id, {
                data: o,
                isLoading: s,
                isError: l,
                refetch: u
            } = (0, av.C)(), c = null != (e = null == o ? void 0 : o.creatorEligibility.includes(ap._.IdVerified)) && e, m = s || l || !c, p = !s && !l && !c, f = (0, a.useCallback)(() => {
                u()
            }, [u]), [h, v] = (0, a.useState)(!1), [g, x] = (0, a.useState)(null), [y, b] = (0, a.useState)({}), {
                moments: I,
                updateMoment: w,
                removeMoment: C
            } = eH(), {
                publishMoment: T,
                publishingDraftId: j,
                isPublishing: S
            } = function() {
                var e;
                let {
                    translate: t
                } = (0, d.A)(), {
                    locale: n
                } = (0, d.z)(), i = nk(), {
                    user: r
                } = (0, F.f)(), o = null == r ? void 0 : r.id, {
                    mutateAsync: s,
                    isPending: l,
                    variables: u
                } = (0, eY.f)({
                    mutationFn: async e => {
                        let {
                            moment: a
                        } = e;
                        if (null == o) throw Error("Authenticated user is required to publish a moment");
                        let r = await eN(o, a.draftId);
                        if (!r) throw Error("Local moment video is required before publishing");
                        return await nw({
                            moment: a,
                            file: r,
                            userId: o,
                            uiLocale: n,
                            sendVideoContentLanguage: i,
                            displayName: t("Label.PublishMomentDisplayName") || "Creator Hub Moment"
                        }), a
                    }
                });
                return {
                    publishMoment: (0, a.useCallback)(e => s({
                        moment: e
                    }), [s]),
                    publishingDraftId: l && null != (e = null == u ? void 0 : u.moment.draftId) ? e : null,
                    isPublishing: l
                }
            }(), M = (0, a.useRef)(!1), {
                deleteMoment: k,
                deletingMomentKey: E
            } = function() {
                let {
                    user: e
                } = (0, F.f)(), t = (0, eK.d)(), n = null == e ? void 0 : e.id, i = nM(), {
                    mutateAsync: r,
                    isPending: o,
                    variables: s
                } = (0, eY.f)({
                    mutationFn: e => {
                        let {
                            moment: t
                        } = e;
                        return t9({
                            momentId: t.momentId,
                            feedItemId: t.feedItemId,
                            useFeedItemId: i
                        })
                    },
                    onSuccess: (e, a) => {
                        let {
                            moment: r
                        } = a;
                        null != n && function(e, t, n) {
                            let i = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
                            e.setQueryData(nA(t, i), e => (null == e ? void 0 : e.pages.length) ? {
                                ...e,
                                pages: e.pages.map(e => ({
                                    ...e,
                                    moments: e.moments.filter(e => nE(e) !== n)
                                }))
                            } : e)
                        }(t, n, nE(r), i)
                    }
                });
                return {
                    deleteMoment: (0, a.useCallback)(e => r({
                        moment: e
                    }), [r]),
                    deletingMomentKey: o && null != s ? nE(s.moment) : null,
                    isDeleting: o
                }
            }(), {
                statusTab: P
            } = nN(), A = nL(), {
                serverMoments: L,
                isAllServerMomentsLoaded: N,
                hasNextPage: R,
                fetchNextPage: U,
                error: O,
                isPending: D,
                isFetchingNextPage: _,
                isFetchNextPageError: z,
                errorUpdatedAt: q,
                loadedPageCount: V,
                refetch: B,
                serverPageSize: G
            } = function() {
                var e;
                let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 25,
                    {
                        data: n,
                        error: i,
                        isPending: r,
                        refetch: o,
                        fetchNextPage: s,
                        hasNextPage: l,
                        isFetchingNextPage: u,
                        isFetchNextPageError: d,
                        errorUpdatedAt: c
                    } = function() {
                        let {
                            user: e
                        } = (0, F.f)(), t = null == e ? void 0 : e.id, n = nM();
                        return (0, eX.f)({
                            queryKey: nA(t, n),
                            queryFn: null != t ? e => {
                                let {
                                    pageParam: i
                                } = e;
                                return t7(t, i, n)
                            } : eW.V,
                            initialPageParam: {
                                pageNumber: 1
                            },
                            getNextPageParam: (e, t) => e.paginationContext ? {
                                paginationContext: e.paginationContext,
                                pageNumber: t.length + 1
                            } : void 0,
                            enabled: null != t
                        })
                    }(),
                    m = (0, a.useMemo)(() => n ? function(e) {
                        let t = new Map;
                        for (let n of e)
                            for (let e of n.moments) t.set(nE(e), e);
                        return [...t.values()]
                    }(n.pages) : ax, [n]),
                    p = null != (e = null == n ? void 0 : n.pages.length) ? e : 0,
                    f = (0, a.useCallback)(() => {
                        s({
                            cancelRefetch: !1,
                            throwOnError: !1
                        })
                    }, [s]),
                    h = l && !d;
                (0, ag.f)({
                    hasNextPage: h,
                    fetchNextPage: f,
                    disabled: r
                });
                let v = !h && !r && !u;
                return (0, a.useMemo)(() => ({
                    serverMoments: m,
                    isAllServerMomentsLoaded: v,
                    hasNextPage: h,
                    fetchNextPage: f,
                    error: i,
                    isPending: r,
                    isFetchingNextPage: u,
                    isFetchNextPageError: d,
                    errorUpdatedAt: c,
                    loadedPageCount: p,
                    refetch: o,
                    serverPageSize: t
                }), [h, i, f, v, d, u, r, c, p, o, m, t])
            }(), H = A && P === ex, {
                data: K,
                isPending: W,
                error: X,
                refetch: Y
            } = function(e) {
                let {
                    enabled: t
                } = e, {
                    user: n
                } = (0, F.f)(), i = null == n ? void 0 : n.id;
                return (0, eJ.f)({
                    queryKey: ["userViolations", i],
                    queryFn: null != i && t ? () => nh(i) : eW.V,
                    staleTime: 1 / 0,
                    retry: !1
                })
            }({
                enabled: H
            }), J = (0, a.useMemo)(() => (null != K ? K : []).map(aI), [K]), Q = (0, a.useCallback)(() => {
                Y()
            }, [Y]);
            (0, a.useEffect)(() => {
                X && tH(tq.ListViolations, X, {
                    userId: r
                })
            }, [r, X]);
            let $ = (0, a.useMemo)(() => [...L, ...I].map(e => {
                    let t = y[nE(e)];
                    return t ? {
                        ...e,
                        ...t
                    } : e
                }), [I, y, L]),
                ee = (0, a.useMemo)(() => {
                    let e = $.filter(e => e.status !== ex);
                    return H ? [...e, ...J] : e
                }, [H, J, $]),
                et = ee.length > 0,
                en = (0, a.useRef)(0);
            (0, a.useEffect)(() => {
                !O || D || z || q <= en.current || (en.current = q, tH(tq.ListMoments, O, {
                    userId: r,
                    pageCount: V
                }))
            }, [O, q, z, D, V, r]);
            let ei = (0, a.useRef)(!1);
            (0, a.useEffect)(() => {
                if (!z || _) {
                    ei.current = !1;
                    return
                }
                O && !ei.current && (ei.current = !0, tH(tq.FetchNextPage, O, {
                    userId: r,
                    pageCount: V
                }))
            }, [O, z, _, V, r]);
            let ea = (0, a.useMemo)(() => {
                    var e;
                    if (!g) return null;
                    let t = nE(g);
                    return null != (e = $.find(e => nE(e) === t)) ? e : g
                }, [g, $]),
                er = (0, a.useCallback)(e => {
                    x(e), v(!0)
                }, []),
                eo = (0, a.useCallback)(e => {
                    v(e), e || x(null)
                }, []),
                es = (0, a.useCallback)(() => {
                    B()
                }, [B]),
                el = (0, a.useCallback)(() => {
                    (0, ah.c)({
                        title: t("Message.MomentPublishedError")
                    })
                }, [t]),
                eu = (0, a.useCallback)(() => {
                    (0, ah.c)({
                        title: t("Message.MomentUploading")
                    })
                }, [t]),
                ed = (0, a.useCallback)(() => {
                    (0, ah.c)({
                        title: t("Message.MomentProcessing")
                    })
                }, [t]),
                ec = (0, a.useCallback)(() => {
                    (0, ah.c)({
                        title: t("Message.MomentDeletedError")
                    })
                }, [t]),
                em = (0, a.useCallback)(async e => {
                    let t = e.status === eg,
                        n = nE(e),
                        i = {
                            ...t ? {
                                draftId: e.draftId
                            } : {
                                momentId: e.momentId,
                                feedItemId: e.feedItemId
                            },
                            experienceId: aw(e),
                            isLocalMoment: t,
                            userId: r
                        };
                    tX(tq.DeleteMoment, i);
                    try {
                        e.status === eg ? C(e.draftId) : await k(e), b(e => {
                            if (!(n in e)) return e;
                            let {
                                [n]: t, ...i
                            } = e;
                            return i
                        }), v(!1), x(null), tY(tq.DeleteMoment, i)
                    } catch (e) {
                        tH(tq.DeleteMoment, e, i), ec()
                    }
                }, [k, C, ec, r]),
                ep = (0, a.useCallback)((e, t) => {
                    if (e.status === eg) return void w(e.draftId, t);
                    let n = nE(e),
                        i = new Date().toISOString();
                    b(e => ({
                        ...e,
                        [n]: {
                            ...e[n],
                            ...null != t.description ? {
                                description: t.description
                            } : {},
                            ...null != t.experienceName ? {
                                experienceName: t.experienceName
                            } : {},
                            ...null != t.locale ? {
                                locale: t.locale
                            } : {},
                            modifiedAt: i
                        }
                    }))
                }, [w]),
                ef = (0, a.useCallback)(async e => {
                    if (M.current || S || m) return;
                    let t = I.find(t => t.draftId === e);
                    if (!t) return;
                    M.current = !0;
                    let n = {
                        draftId: e,
                        experienceId: aw(t),
                        isLocalMoment: !0,
                        userId: r
                    };
                    tX(tq.PublishMoment, n), eu();
                    try {
                        await T(t), C(e), v(!1), x(null), tY(tq.PublishMoment, n), ed()
                    } catch (e) {
                        tH(tq.PublishMoment, e, n), el()
                    } finally {
                        M.current = !1
                    }
                }, [m, S, I, T, C, el, eu, ed, r]),
                eh = (0, a.useCallback)(e => {
                    e.status === eg && ef(e.draftId)
                }, [ef]);
            return H && X ? (0, i.jsx)(af.f, {
                onReload: Q
            }) : H && W ? (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(Z.f, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            }) : !O || P === eg || H || et ? (!D || H || et) && (N || H || et) ? (0, i.jsxs)("div", {
                className: "flex grow-1 flex-col gap-medium self-stretch width-full",
                children: [l ? (0, i.jsx)(a$, {
                    onRetry: f
                }) : null, p ? (0, i.jsx)(a2, {}) : null, et || H ? (0, i.jsx)(aZ, {
                    moments: ee,
                    hasNextPage: R,
                    fetchNextPage: U,
                    serverPageSize: G,
                    onEditMoment: er,
                    onMomentMetadataChange: ep,
                    onPublishMoment: ef,
                    publishingDraftId: j,
                    isPublishDisabled: m
                }) : (0, i.jsx)("div", {
                    className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                    children: (0, i.jsx)(aL, {
                        onCreateClick: n8
                    })
                }), (0, i.jsx)(aE, {
                    moment: ea,
                    open: h,
                    onOpenChange: eo,
                    onMomentMetadataChange: ep,
                    onDelete: ea ? em : void 0,
                    onPublish: (null == ea ? void 0 : ea.status) === eg ? eh : void 0,
                    publishingDraftId: j,
                    deletingMomentKey: E,
                    isPublishDisabled: m
                }, ea ? nE(ea) : void 0)]
            }) : (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(Z.f, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            }) : (0, i.jsx)(af.f, {
                onReload: es
            })
        },
        a5 = {
            width: "100%",
            height: "100%"
        },
        a8 = (0, iu.f)()(e => ({
            section: {
                ...a5
            },
            container: {
                ...a5
            },
            title: {
                marginBottom: e.spacing(1),
                [e.breakpoints.down("Medium")]: {
                    padding: e.spacing(0, 1)
                }
            },
            checkedDeleteIconContainer: {
                marginLeft: e.spacing(.5),
                marginRight: e.spacing(.25),
                padding: 0
            }
        })),
        a3 = (0, Y.default)(() => e.A(202045), {
            loadableGenerated: {
                modules: [623728]
            },
            ssr: !1
        }),
        a7 = (0, Y.default)(() => e.A(378869), {
            loadableGenerated: {
                modules: [518808]
            },
            ssr: !1
        }),
        a6 = (0, Y.default)(() => e.A(580854), {
            loadableGenerated: {
                modules: [427685]
            },
            ssr: !1
        }),
        a9 = (0, Y.default)(() => e.A(307640), {
            loadableGenerated: {
                modules: [48220]
            },
            ssr: !1
        }),
        re = (0, Y.default)(() => e.A(114198), {
            loadableGenerated: {
                modules: [595604]
            },
            ssr: !1
        }),
        rt = (0, Y.default)(() => e.A(558217), {
            loadableGenerated: {
                modules: [333771]
            },
            ssr: !1
        }),
        rn = (0, Y.default)(() => e.A(546234), {
            loadableGenerated: {
                modules: [82873]
            },
            ssr: !1
        }),
        ri = (0, Y.default)(() => e.A(85397), {
            loadableGenerated: {
                modules: [973472]
            },
            ssr: !1
        }),
        ra = (0, Y.default)(() => e.A(890748), {
            loadableGenerated: {
                modules: [835459]
            },
            ssr: !1
        }),
        rr = (0, Y.default)(() => e.A(68996), {
            loadableGenerated: {
                modules: [565869]
            },
            ssr: !1
        }),
        ro = (0, Y.default)(() => e.A(441969), {
            loadableGenerated: {
                modules: [415945]
            },
            ssr: !1
        }),
        rs = (0, Y.default)(() => e.A(481709), {
            loadableGenerated: {
                modules: [947274]
            },
            ssr: !1
        }),
        rl = (0, Y.default)(() => e.A(272047), {
            loadableGenerated: {
                modules: [616027]
            },
            ssr: !1
        });

    function ru(e) {
        let t = (0, f.d)(e);
        return void 0 === t ? m.f.MyExperiences : (0, p.s)(m.f, t) ? t : m.f.MyExperiences
    }
    let rd = (0, d.K)(e => {
            let {
                verificationMetadata: t,
                currentGroup: n,
                currentUser: r,
                allowedAssetTypes: o
            } = e, [s, l] = (0, en.f)(["activeTab", "filterIndex"]), {
                resetAllFilters: u
            } = (0, es.f)(), {
                isFetched: c
            } = (0, v._)(), {
                isResolving: p
            } = (0, a.useContext)(V), f = C(), h = (0, iv.f)(), w = (0, ig.f)(), {
                translate: T,
                ready: j
            } = (0, d.A)(), S = (0, y.f)(), M = (0, a.useRef)(void 0), k = (0, a.useMemo)(() => [], []), E = (0, g.z)(s.activeTab), P = E || (0, g.q)(s.activeTab), A = (0, a.useMemo)(() => {
                let e = (0, g.Y)(s.activeTab) ? m.f.AllCatalogAsset : g.K;
                return I.f.getMenuState(P ? e : ru(s.activeTab), k)
            }, [s.activeTab, k, P]);
            (0, a.useEffect)(() => {
                (0, g.q)(s.activeTab) && l({
                    activeTab: E ? (0, g.c)(g.X) : m.f.AllCatalogAsset,
                    filterIndex: 0
                })
            }, [s.activeTab, E, l]);
            let L = (0, a.useMemo)(() => b.U.filter(e => !k.includes(e.type)), [k]),
                {
                    classes: {
                        section: N,
                        container: R
                    }
                } = a8(),
                U = (0, a.useCallback)(e => {
                    if (A.menuItem === e.menuItem && A.submenuItem === e.submenuItem) return;
                    if ((0, g.r)({
                            isTaxonomyEnabled: S,
                            isChangingSection: A.menuItem !== e.menuItem,
                            nextAssetType: I.f.getAssetType(e)
                        })) return void l({
                        activeTab: g.a,
                        filterIndex: 0
                    });
                    let t = (0, eo.g)(e.menuItem.type) ? 0 : void 0;
                    l({
                        activeTab: I.f.getAssetType(e),
                        filterIndex: t
                    })
                }, [A.menuItem, A.submenuItem, l, S]),
                O = (0, a.useMemo)(() => {
                    let e = ru(s.activeTab);
                    if (void 0 === f && e === m.f.Moments || void 0 === w && e === m.f.Showcase) return A;
                    let t = ru(s.activeTab) === m.f.TextDocument;
                    if (void 0 === h && t) return A;
                    let i = I.f.getValidMenuState(L, A, n, void 0, void 0, f, w, h);
                    if (i !== A) {
                        if (!E) {
                            let e = (0, eo.g)(i.menuItem.type) ? 0 : void 0;
                            l({
                                activeTab: I.f.getAssetType(i),
                                filterIndex: e
                            })
                        }
                        return i
                    }
                    return A
                }, [L, A, E, s.activeTab, n, f, h, w, l]),
                D = (0, a.useMemo)(() => I.f.getAssetType(O), [O]);
            (0, a.useEffect)(() => {
                if (void 0 === M.current) {
                    M.current = D;
                    return
                }
                let e = M.current;
                e !== D && (M.current = D, (0, x.c)(e, h) && (0, x.c)(D, h) || u())
            }, [D, h, u]);
            let _ = D === m.f.MyExperiences || D === m.f.SharedExperiences,
                z = (0, a.useMemo)(() => null == o ? void 0 : o.has(D), [D, o]),
                q = (0, x.c)(D, h),
                F = (0, a.useMemo)(() => {
                    var e, t;
                    return q ? (0, i.jsx)(rs, {
                        groupId: null == n ? void 0 : n.id,
                        useTabNavigationSpacing: !1,
                        userId: null == r ? void 0 : r.id
                    }) : D === m.f.Decal ? (0, i.jsx)(a6, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.f.Animation ? (0, i.jsx)(a7, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.f.Audio || D === m.f.Video ? (0, i.jsx)(a9, {
                        mediaAssetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.f.Plugin ? (0, i.jsx)(rn, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.f.Model ? (0, i.jsx)(rt, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.f.MeshPart ? (0, i.jsx)(re, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.f.TextDocument ? (0, i.jsx)("div", {
                        className: "flex justify-center items-center padding-y-xxlarge",
                        children: (0, i.jsx)(Z.f, {
                            ariaLabel: T("Label.Loading"),
                            size: "Large",
                            variant: "Indeterminate"
                        })
                    }) : D === m.f.ShareLink ? (0, i.jsx)(rr, {}) : D === m.f.Moments ? (0, i.jsx)(a4, {}) : D === m.f.AssetPermissionRequests ? (0, i.jsx)(rl, {}) : D === m.f.Showcase ? (0, i.jsx)(ri, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.f.AllCatalogAsset || D === m.f.AvatarLooks || D === m.f.AvatarBackground ? (0, i.jsx)(a3, {
                        assetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.f.Image || D === m.f.Mesh ? (0, i.jsx)(ra, {
                        primitiveAssetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : z ? (0, i.jsx)(a3, {
                        assetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : (0, i.jsx)(ro, {
                        assetType: D,
                        creatorType: (null == n ? void 0 : n.id) ? J.W.Group : J.W.User,
                        creatorTargetId: null != (e = null != (t = null == n ? void 0 : n.id) ? t : null == r ? void 0 : r.id) ? e : 0,
                        isTelemetryReady: c && j && !p && (null == r ? void 0 : r.id) !== void 0 && ru(s.activeTab) === D
                    })
                }, [D, null == n ? void 0 : n.id, null == r ? void 0 : r.id, z, q, T, c, j, p, s.activeTab]);
            return (0, i.jsxs)(er.U, {
                children: [(0, i.jsx)(Q.i, {
                    title: (0, Q.t)(O.submenuItem ? T(O.submenuItem.nameKey) : T(O.menuItem.nameKey)),
                    breadcrumb: (0, Q.A)(T("Heading.Creations"), T(O.menuItem.nameKey), O.submenuItem ? T(O.submenuItem.nameKey) : void 0)
                }), (0, i.jsx)("section", {
                    className: N,
                    children: (0, i.jsxs)($.f, {
                        container: !0,
                        direction: "column",
                        className: R,
                        children: [(0, i.jsx)(ea.f, {}), (0, i.jsx)(ee.J, {
                            trackingPage: ee.e.Creations
                        }), !q && (0, i.jsx)(am, {
                            menuState: O,
                            onMenuStateChange: U,
                            verificationMetadata: t,
                            group: n
                        }), _ && (0, i.jsx)(et.f, {}), F]
                    })
                })]
            })
        }, [ei.f.AssetTypes, ei.f.Controls, ei.f.Creations, ei.f.Error, ei.f.Navigation, ei.f.ShareLinksManagement, ei.f.ExperienceReleases, ei.f.Taxonomy]),
        rc = () => {
            let e = (0, v.W)(),
                {
                    user: t
                } = (0, F.f)(),
                n = (0, X.f)(),
                [r, o] = (0, a.useState)(void 0);
            return (0, a.useEffect)(() => {
                (0, b.V)().then(e => {
                    let {
                        assetTypes: t
                    } = e;
                    o(t)
                })
            }, []), (0, i.jsx)(W, {
                children: (0, i.jsx)(rd, {
                    verificationMetadata: n,
                    currentGroup: e,
                    currentUser: t,
                    allowedAssetTypes: r
                })
            })
        };
    var rm = e.i(675330),
        rp = e.i(177608),
        rf = e.i(796266);
    let rh = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)(rp.f, {
                title: (0, i.jsx)(q, {}),
                secondaryRail: (0, i.jsx)(k, {}),
                secondarySize: "small",
                noBreadCrumbs: !0,
                children: (0, i.jsx)(o.f, {
                    children: t
                })
            })
        },
        rv = () => {
            let {
                isResolving: e
            } = (0, rf.f)(), t = (0, a.useMemo)(() => ({
                isResolving: e
            }), [e]);
            return (0, i.jsx)(s.f, {
                children: (0, i.jsx)(rm.f, {
                    children: (0, i.jsx)(r.U, {
                        children: (0, i.jsx)(V.Provider, {
                            value: t,
                            children: (0, i.jsx)(rc, {})
                        })
                    })
                })
            })
        };
    rv.getPageLayout = e => (0, i.jsx)(rh, {
        children: e
    }), rv.loggerConfig = {
        rosId: "3539"
    }, e.s(["default", 0, rv], 962059)
}]);

//# debugId=e52fcdff-50fd-a2c2-688a-0aeece1ec91e
//# sourceMappingURL=0bib3f70kf3xw.js.map