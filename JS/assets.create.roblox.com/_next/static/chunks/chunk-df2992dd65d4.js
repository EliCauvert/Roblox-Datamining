;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "594b768e-186d-d457-b0d5-0be8006068e0")
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
        o = e.i(138726),
        s = e.i(341260),
        l = e.i(500758),
        d = e.i(79187),
        u = e.i(134731),
        c = e.i(671376),
        m = e.i(927868),
        p = e.i(692587),
        f = e.i(85057),
        h = e.i(745873),
        v = e.i(130778),
        g = e.i(211461),
        x = e.i(117236),
        y = e.i(427149),
        b = e.i(9436);
    let I = () => {
            let {
                ready: e,
                value: t
            } = (0, l.f)(b.t);
            if (e) return t
        },
        w = "creation-",
        C = {
            [c.f.Place]: "Label.Experiences",
            [c.f.ShareLink]: "Heading.ShareLinks",
            [c.f.TShirt]: "Label.AvatarItems",
            [c.f.Decal]: "Label.DevelopmentItems",
            [c.f.Moments]: "Label.Moments"
        },
        T = "".concat(w).concat(c.f.Decal);

    function j() {
        let e = (0, s.useRouter)(),
            {
                translate: t
            } = (0, d.A)(),
            n = (0, h.W)(),
            i = I(),
            {
                value: r
            } = (0, l.f)(u.E),
            o = (0, a.useMemo)(() => (t, n, i) => {
                let a = new URLSearchParams,
                    r = (0, p.d)(e.query.groupId);
                r && a.set("groupId", r), t && a.set("activeTab", t), i && a.set("inventoryAssetTypes", i), void 0 !== n && a.set("filterIndex", String(n));
                let o = a.toString();
                return o ? "/dashboard/creations?".concat(o) : "/dashboard/creations"
            }, [e.query.groupId]),
            f = (0, a.useMemo)(() => x.U.filter(e => e.type !== c.f.AssetPermissionRequests || r).filter(e => y.f.isMenuItemEnabled(e, n, void 0, void 0, i)).map(e => {
                var n, i, a;
                let r = e.type === c.f.Decal,
                    s = null != (n = null == (a = e.submenuItems) || null == (i = a[0]) ? void 0 : i.type) ? n : e.type,
                    l = C[e.type],
                    d = e.type === c.f.TShirt;
                return {
                    key: "".concat(w).concat(e.type),
                    label: l ? t(l) : t(e.nameKey),
                    href: e.type === c.f.Place ? o() : o(d ? v.a : s, d ? 0 : void 0, r ? g.G.All : void 0)
                }
            }), [o, n, r, i, t]),
            b = (0, a.useMemo)(() => {
                var t;
                let n, i = (0, v.z)(e.query.activeTab) || (0, v.q)(e.query.activeTab),
                    a = y.f.getMenuState(i ? v.K : (t = e.query.activeTab, void 0 !== (n = (0, p.d)(t)) && (0, m.s)(c.f, n) ? n : void 0), []);
                return "".concat(w).concat(a.menuItem.type)
            }, [e.query.activeTab]);
        return {
            activeItem: (0, a.useMemo)(() => f.find(e => e.key === b), [b, f]),
            activeKey: b,
            homeHref: o(),
            isDevelopmentItemsActive: b === T,
            items: f
        }
    }
    let S = () => {
        let {
            translate: e
        } = (0, d.A)(), {
            activeKey: t,
            items: n
        } = j();
        return (0, i.jsx)(f.f, {
            header: e("Heading.Creations"),
            activeKey: t,
            items: n
        })
    };
    var M = e.i(154570),
        k = e.i(331420),
        E = e.i(298772),
        P = e.i(335020);
    let A = () => a.default.createElement("div", {
            className: "flex items-center justify-center shrink-0 width-600"
        }, a.default.createElement("span", {
            className: "text-body-medium content-default"
        }, "/")),
        L = e => {
            let {
                item: t,
                isActive: n
            } = e, {
                label: i,
                href: r,
                leadingIcon: o,
                mediaSrc: s,
                onClick: l
            } = t, d = a.default.createElement("div", {
                className: (0, P.U)("flex items-center gap-small shrink-0 height-600")
            }, o && a.default.createElement(M.f, {
                name: o,
                size: "XSmall",
                className: "content-emphasis"
            }), s && a.default.createElement("div", {
                className: "shrink-0 size-500"
            }, a.default.createElement(E.f, {
                src: s,
                alt: i,
                aspectRatio: "1:1",
                containerClassName: "radius-small clip"
            })), a.default.createElement("span", {
                className: (0, P.U)("text-no-wrap", {
                    "content-emphasis text-title-medium": n,
                    "content-default text-body-medium": !n
                })
            }, i));
            return r && !n ? a.default.createElement("a", {
                href: r,
                onClick: l,
                className: (0, P.U)("flex items-center shrink-0 focus-visible:outline-focus radius-small"),
                style: {
                    textDecoration: "none"
                }
            }, d) : l && !n ? a.default.createElement("button", {
                type: "button",
                onClick: l,
                className: (0, P.U)("flex items-center shrink-0 cursor-pointer padding-none bg-none focus-visible:outline-focus radius-small"),
                style: {
                    border: "none"
                }
            }, d) : a.default.createElement("div", {
                className: "flex items-center shrink-0",
                "aria-current": n ? "page" : void 0
            }, d)
        },
        N = e => {
            let {
                items: t,
                maxItems: n,
                ariaLabel: i,
                expansionAriaLabel: r,
                className: o,
                ...s
            } = e, [l, d] = (0, a.useState)(!1), u = null != n && t.length > n && !l, c = t, m = !1;
            u && (c = [t[0], t[t.length - 1]], m = !0);
            let p = () => {
                d(!0)
            };
            return a.default.createElement("nav", {
                "aria-label": i,
                className: (0, P.U)("flex items-center height-1000", o),
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
                }, m && 1 === t && a.default.createElement(a.default.Fragment, null, a.default.createElement("li", null, a.default.createElement(k.f, {
                    icon: "icon-filled-three-dots-horizontal",
                    ariaLabel: r,
                    size: "XSmall",
                    variant: "Standard",
                    onClick: p,
                    className: "size-600 min-height-600 max-height-600"
                })), a.default.createElement("li", null, a.default.createElement(A, null))), a.default.createElement("li", null, a.default.createElement(L, {
                    item: e,
                    isActive: n
                })), t < c.length - 1 && a.default.createElement("li", null, a.default.createElement(A, null)))
            })))
        };
    N.displayName = "Breadcrumbs";
    var R = e.i(725509);
    let U = e => {
        let {
            creationsHref: t,
            creationsLabel: n,
            currentLabel: r
        } = e, o = (0, s.useRouter)(), l = (0, R.f)(), d = (0, a.useMemo)(() => [{
            href: t,
            label: n,
            onClick: e => {
                e.altKey || e.ctrlKey || e.metaKey || e.shiftKey || (e.preventDefault(), o.push(t))
            }
        }, {
            label: r
        }], [t, n, r, o]);
        return (0, i.jsx)(N, {
            ariaLabel: l.breadcrumbs,
            className: "max-[600px]:[&_li:not(:first-child)]:[display:none]",
            expansionAriaLabel: l.showHiddenBreadcrumbs,
            items: d
        })
    };
    var D = e.i(376204);
    let O = e => {
            let {
                fallback: t,
                ...n
            } = e, {
                isEnabled: a
            } = (0, D.f)();
            return a ? (0, i.jsx)(U, {
                ...n
            }) : t
        },
        _ = () => {
            var e;
            let {
                translate: t
            } = (0, d.A)(), {
                activeItem: n,
                homeHref: a,
                isDevelopmentItemsActive: r
            } = j(), o = t("Heading.Creations"), s = (0, i.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: null != (e = null == n ? void 0 : n.label) ? e : o
            });
            return r && null != n ? (0, i.jsx)(O, {
                creationsHref: a,
                creationsLabel: o,
                currentLabel: n.label,
                fallback: s
            }) : s
        },
        z = (0, a.createContext)({
            isResolving: !1
        });
    var q = e.i(814975),
        V = e.i(252842),
        F = e.i(533414),
        B = e.i(456810);
    let G = {
            sort: B.K,
            sortOrder: V.f.Desc,
            isArchived: !1,
            isPublishOnly: !1,
            isOnMarketplace: !1
        },
        H = e => {
            let {
                children: t
            } = e, {
                user: n
            } = (0, q.f)(), [r, o] = (0, F.j)("creationSort.".concat(null == n ? void 0 : n.id), G.sort), s = (0, a.useRef)(r), l = (0, a.useMemo)(() => {
                let e = s.current;
                return Object.keys(r).some(t => r[t] !== e[t]) && (s.current = r), s.current
            }, [r]), [d, u] = (0, F.j)("creationSortOrder.".concat(null == n ? void 0 : n.id), G.sortOrder), [c, m] = (0, a.useState)(G.isArchived), [p, f] = (0, a.useState)(!1), [h, v] = (0, a.useState)(G.isPublishOnly), [g, x] = (0, a.useState)(G.isOnMarketplace), y = (0, a.useCallback)(() => {
                o(G.sort), u(G.sortOrder), m(G.isArchived), f(!1), v(G.isPublishOnly), x(G.isOnMarketplace)
            }, [o, u]), b = (0, a.useMemo)(() => ({
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
                setSortOrder: u,
                sort: l,
                sortOrder: d
            }), [c, p, g, h, y, m, f, x, v, o, u, l, d]);
            return (0, i.jsx)(B.U.Provider, {
                value: b,
                children: t
            })
        };
    var K = e.i(668091),
        W = e.i(458263),
        X = e.i(593430),
        Y = e.i(37819),
        J = e.i(298176),
        Q = e.i(870999),
        Z = e.i(714039),
        $ = e.i(896852),
        ee = e.i(71375),
        et = e.i(780880),
        en = e.i(881670),
        ei = e.i(57798),
        ea = e.i(845592),
        er = e.i(75325),
        eo = e.i(215742),
        es = e.i(949599),
        el = e.i(339544),
        ed = e.i(643093);
    let eu = e => void 0 === e.lookType ? void 0 : "look:".concat(e.lookType),
        ec = e => (0, eo.T)({
            assetTypeIds: e.assetTypeIds,
            bundleTypeIds: e.bundleTypeIds
        }),
        em = {
            activeTab: v.a,
            filterIndex: 0
        };
    var ep = e.i(475642),
        ef = e.i(661736),
        eh = e.i(549856),
        ev = e.i(270921),
        eg = e.i(211388);
    let ex = "CreatorHub.MomentsCreations.local",
        ey = e => "".concat(ex, ".").concat(e),
        eb = "".concat(ex, ".__inactive__"),
        eI = "active",
        ew = "pending",
        eC = "draft",
        eT = "moderated",
        ej = [eI, eC],
        eS = [eI, eT, eC],
        eM = e => new Date(e.modifiedAt).getTime(),
        ek = "momentMedia",
        eE = async e => {
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
        }, eP = new Map, eA = (e, t) => "".concat(e, ":").concat(t), eL = (e, t, n) => new Promise((t, n) => {
            if ("u" < typeof indexedDB) return void n(Error("IndexedDB is unavailable"));
            let i = indexedDB.open("".concat("CreatorHub.MomentsVideoMedia", ".").concat(e), 1);
            i.addEventListener("upgradeneeded", () => {
                let e = i.result;
                e.objectStoreNames.contains(ek) || e.createObjectStore(ek, {
                    keyPath: "momentId"
                })
            }), i.addEventListener("success", () => t(i.result)), i.addEventListener("error", () => {
                var e;
                return n(null != (e = i.error) ? e : Error("Failed to open IndexedDB"))
            })
        }).then(e => new Promise((i, a) => {
            let r = n(e.transaction(ek, t).objectStore(ek));
            r.addEventListener("success", () => i(r.result)), r.addEventListener("error", () => {
                var e;
                return a(null != (e = r.error) ? e : Error("IndexedDB request failed"))
            })
        })), eN = e => "object" == typeof e && null !== e && "momentId" in e && "string" == typeof e.momentId && "videoBlob" in e && e.videoBlob instanceof Blob && "thumbnailBlob" in e && e.thumbnailBlob instanceof Blob && "updatedAt" in e && "string" == typeof e.updatedAt, eR = (e, t) => {
            let n = eA(e, t),
                i = eP.get(n);
            i && (URL.revokeObjectURL(i.thumbnailUrl), URL.revokeObjectURL(i.videoUrl), eP.delete(n))
        }, eU = async (e, t, n) => {
            let i = await eE(n),
                a = {
                    momentId: t,
                    videoBlob: n,
                    thumbnailBlob: i,
                    fileName: n.name,
                    updatedAt: new Date().toISOString()
                };
            eR(e, t), await eL(e, "readwrite", e => e.put(a))
        }, eD = new Set(["QuotaExceededError", "NS_ERROR_DOM_QUOTA_REACHED"]), eO = e => !!(e instanceof DOMException && eD.has(e.name)) || e instanceof Error && e.message.toLowerCase().includes("quota"), e_ = async (e, t, n, i) => {
            let a = [],
                r = async () => {
                    await eU(e, t, n)
                };
            try {
                return await r(), {
                    evictedMediaDraftIds: a
                }
            } catch (e) {
                if (!eO(e)) throw e
            }
            for (let n of [...i.filter(e => e.draftId !== t && !1 !== e.hasLocalVideo)].sort((e, t) => eM(e) - eM(t))) {
                await eV(e, [n.draftId]), a.includes(n.draftId) || a.push(n.draftId);
                try {
                    return await r(), {
                        evictedMediaDraftIds: a
                    }
                } catch (e) {
                    if (!eO(e)) throw e
                }
            }
            throw Error("Failed to store moment video locally")
        };
    async function ez(e, t) {
        var n, i;
        let a, r = await eL(e, "readonly", e => e.get(t));
        if (!eN(r)) return null;
        let {
            videoBlob: o
        } = r;
        return new File([o], (a = null == (i = (n = r).fileName) ? void 0 : i.trim()) ? a : n.videoBlob.type.includes("quicktime") ? "moment.mov" : "moment.mp4", {
            type: o.type || "video/mp4"
        })
    }
    let eq = async (e, t) => {
        let n = eA(e, t),
            i = eP.get(n);
        if (i) return i;
        let a = await eL(e, "readonly", e => e.get(t));
        if (!eN(a)) return null;
        let r = {
            thumbnailUrl: URL.createObjectURL(a.thumbnailBlob),
            videoUrl: URL.createObjectURL(a.videoBlob)
        };
        return eP.set(n, r), r
    }, eV = async (e, t) => {
        0 !== t.length && await Promise.all(t.map(async t => {
            eR(e, t), await eL(e, "readwrite", e => e.delete(t))
        }))
    }, eF = {
        version: "1",
        moments: []
    }, eB = e => "object" == typeof e && null !== e && !Array.isArray(e), eG = e => eB(e) && "1" === e.version && Array.isArray(e.moments) ? e.moments : [], eH = e => "string" == typeof e ? e : void 0, eK = e => "number" == typeof e && Number.isFinite(e) ? e : void 0, eW = new Set(Object.values(d.v)), eX = e => eG(e).map(e => (e => {
        var t, n, i, a, r, o;
        let s;
        if (!eB(e)) return null;
        let l = null != (t = eH(e.draftId)) ? t : eH(e.id);
        return null == l || "" === l || e.status !== eC ? null : {
            draftId: l,
            status: eC,
            experienceId: null != (n = eK(e.experienceId)) ? n : 0,
            rootPlaceId: eK(e.rootPlaceId),
            experienceName: null != (i = eH(e.experienceName)) ? i : "",
            description: null != (a = eH(e.description)) ? a : "",
            modifiedAt: null != (r = eH(e.modifiedAt)) ? r : new Date(0).toISOString(),
            assetId: eK(e.assetId),
            thumbnailUrl: eH(e.thumbnailUrl),
            videoUrl: eH(e.videoUrl),
            universeId: eK(e.universeId),
            locale: "string" == typeof(s = o = e.locale) && eW.has(s) ? o : void 0,
            ..."boolean" == typeof e.hasLocalVideo ? {
                hasLocalVideo: e.hasLocalVideo
            } : {}
        }
    })(e)).filter(e => null != e), eY = e => {
        if (!e) return [];
        try {
            let t = JSON.parse(e);
            return eX(t)
        } catch (e) {
            return []
        }
    }, eJ = e => ({
        version: "1",
        moments: e
    }), eQ = () => {
        let {
            user: e
        } = (0, q.f)(), t = null == e ? void 0 : e.id, n = null != t, i = n ? ey(t) : eb, [r, o] = (0, F.j)(i, eF), s = (0, a.useMemo)(() => n ? eX(r) : [], [n, r]);
        (0, a.useEffect)(() => {
            if (!n || null == t) return;
            let e = eG(r).filter(e => eB(e) && e.status !== eC).map(e => {
                var t, n;
                return eB(e) && null != (t = null != (n = eH(e.draftId)) ? n : eH(e.id)) ? t : ""
            }).filter(e => "" !== e);
            0 !== e.length && (o(eJ(s)), eV(t, e))
        }, [n, s, r, o, t]);
        let l = (0, a.useCallback)((e, a) => {
                var r, s, l;
                if (!n || null == t || 0 === e.length) return {
                    moments: [],
                    evictedMediaDraftIds: []
                };
                let {
                    moments: d,
                    evictedMediaDraftIds: u
                } = (l = eY(window.localStorage.getItem(i)), {
                    moments: [...e.map(e => {
                        var t;
                        return {
                            ...e,
                            status: eC,
                            hasLocalVideo: null == (t = e.hasLocalVideo) || t
                        }
                    }), ...l].sort((e, t) => eM(t) - eM(e)),
                    evictedMediaDraftIds: []
                }), c = ((e, t) => {
                    if (0 === t.length) return [...e];
                    let n = new Set(t);
                    return e.map(e => n.has(e.draftId) ? {
                        ...e,
                        hasLocalVideo: !1
                    } : e)
                })(d, null != (r = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? r : []), m = [...new Set([...null != (s = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? s : [], ...u])];
                return o(eJ(c)), m.length > 0 && eV(t, m), {
                    moments: c,
                    evictedMediaDraftIds: m
                }
            }, [n, o, i, t]),
            d = (0, a.useCallback)((e, t) => l([e], t), [l]),
            u = (0, a.useCallback)((e, i) => {
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
                return a ? (o(eJ(a)), a) : null
            }, [n, s, o, t]),
            c = (0, a.useCallback)(e => {
                if (!n || null == t) return null;
                let i = -1 === s.findIndex(t => t.draftId === e) ? null : s.filter(t => t.draftId !== e);
                return i ? (o(eJ(i)), eV(t, [e]), i) : null
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
                return o(eJ(i)), eV(t, r), i
            }, [n, s, o, t]);
        return {
            moments: s,
            addMoment: d,
            addMoments: l,
            updateMoment: u,
            removeMoment: c,
            removeMoments: m
        }
    };
    var eZ = e.i(228096),
        e$ = e.i(463146),
        e0 = e.i(900496),
        e1 = e.i(60584),
        e2 = e.i(910272),
        e4 = e.i(415858),
        e5 = function(e, t) {
            return (e5 = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function e3(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        e5(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function e7(e, t, n, i) {
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

    function e8(e, t) {
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
                var d = [s, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, d[0] && (r = 0)), r;) try {
                    if (n = 1, i && (a = 2 & d[0] ? i.return : d[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, d[1])).done) return a;
                    switch (i = 0, a && (d = [2 & d[0], a.value]), d[0]) {
                        case 0:
                        case 1:
                            a = d;
                            break;
                        case 4:
                            return r.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = d[1], d = [0];
                            continue;
                        case 7:
                            d = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === d[0] && (!a || d[1] > a[0] && d[1] < a[3])) {
                                r.label = d[1];
                                break
                            }
                            if (6 === d[0] && r.label < a[1]) {
                                r.label = a[1], a = d;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(d);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    d = t.call(e, r)
                } catch (e) {
                    d = [6, e], i = 0
                } finally {
                    n = a = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function e6(e) {
        if (void 0 !== e) return null === e ? null : {
            chunkNum: e.chunkNum,
            eTag: e.eTag
        }
    }

    function e9(e) {
        if (void 0 !== e) return null === e ? null : {
            role: e.role,
            operationId: e.operationId,
            parts: void 0 === e.parts ? void 0 : null === e.parts ? null : e.parts.map(e6)
        }
    }

    function te(e) {
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

    function tt(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function tn(e) {
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

    function ti(e) {
        if (void 0 !== e) return null === e ? null : {
            text: e.text,
            voiceId: e.voiceId,
            pitch: e.pitch,
            speed: e.speed,
            startTime: e.startTime
        }
    }

    function ta(e) {
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

    function tr(e, t) {
        return null == e ? e : {
            assetId: (0, e4.u)(e, "assetId") ? e.assetId : void 0,
            startTime: (0, e4.u)(e, "startTime") ? e.startTime : void 0
        }
    }

    function to(e) {
        var t;
        return null == (t = e) ? t : {
            position: (0, e4.u)(t, "position") ? t.position : void 0,
            rotation: (0, e4.u)(t, "rotation") ? t.rotation : void 0,
            stickerSize: (0, e4.u)(t, "stickerSize") ? t.stickerSize : void 0,
            scale: (0, e4.u)(t, "scale") ? t.scale : void 0,
            stickerURI: (0, e4.u)(t, "stickerURI") ? t.stickerURI : void 0,
            zIndex: (0, e4.u)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function ts(e) {
        if (void 0 !== e) return null === e ? null : {
            position: e.position,
            rotation: e.rotation,
            stickerSize: e.stickerSize,
            scale: e.scale,
            stickerURI: e.stickerURI,
            zIndex: e.zIndex
        }
    }

    function tl(e) {
        var t, n;
        return null == (t = e) ? t : {
            position: (0, e4.u)(t, "position") ? t.position : void 0,
            rotation: (0, e4.u)(t, "rotation") ? t.rotation : void 0,
            scale: (0, e4.u)(t, "scale") ? t.scale : void 0,
            text: (0, e4.u)(t, "text") ? t.text : void 0,
            textOverlayStyle: (0, e4.u)(t, "textOverlayStyle") ? null == (n = t.textOverlayStyle) ? n : {
                font: (0, e4.u)(n, "font") ? n.font : void 0,
                fontColor: (0, e4.u)(n, "fontColor") ? n.fontColor : void 0,
                fontSize: (0, e4.u)(n, "fontSize") ? n.fontSize : void 0,
                textXAlignment: (0, e4.u)(n, "textXAlignment") ? n.textXAlignment : void 0
            } : void 0,
            zIndex: (0, e4.u)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function td(e) {
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

    function tu(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, e4.u)(t, "assetId") ? t.assetId : void 0,
            startTime: (0, e4.u)(t, "startTime") ? t.startTime : void 0,
            assetAccessContext: (0, e4.u)(t, "assetAccessContext") ? t.assetAccessContext : void 0
        }
    }

    function tc(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId,
            startTime: e.startTime,
            assetAccessContext: e.assetAccessContext
        }
    }

    function tm(e) {
        var t;
        return null == (t = e) ? t : {
            httpVerb: (0, e4.u)(t, "httpVerb") ? t.httpVerb : void 0,
            url: (0, e4.u)(t, "url") ? t.url : void 0,
            chunkNum: (0, e4.u)(t, "chunkNum") ? t.chunkNum : void 0,
            contentStart: (0, e4.u)(t, "contentStart") ? t.contentStart : void 0,
            contentLength: (0, e4.u)(t, "contentLength") ? t.contentLength : void 0,
            expirationTimeMs: (0, e4.u)(t, "expirationTimeMs") ? t.expirationTimeMs : void 0
        }
    }

    function tp(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, e4.u)(t, "role") ? t.role : void 0,
            operationId: (0, e4.u)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, e4.u)(t, "operationPath") ? t.operationPath : void 0,
            uploadUrls: (0, e4.u)(t, "uploadUrls") ? null === t.uploadUrls ? null : t.uploadUrls.map(tm) : void 0
        }
    }

    function tf(e, t) {
        var n, i, a;
        return null == e ? e : {
            assetId: (0, e4.u)(e, "assetId") ? e.assetId : void 0,
            assetAccessContext: (0, e4.u)(e, "assetAccessContext") ? e.assetAccessContext : void 0,
            assetTotalDuration: (0, e4.u)(e, "assetTotalDuration") ? e.assetTotalDuration : void 0,
            caption: (0, e4.u)(e, "caption") ? e.caption : void 0,
            videoContentLanguage: (0, e4.u)(e, "videoContentLanguage") ? e.videoContentLanguage : void 0,
            partnerUploadType: (0, e4.u)(e, "partnerUploadType") ? e.partnerUploadType : void 0,
            captureType: (0, e4.u)(e, "captureType") ? e.captureType : void 0,
            editsType: (0, e4.u)(e, "editsType") ? e.editsType : void 0,
            videoCaptureEdits: (0, e4.u)(e, "videoCaptureEdits") ? null == (n = e.videoCaptureEdits) ? n : {
                trim: (0, e4.u)(n, "trim") ? null == (i = n.trim) ? i : {
                    startTime: (0, e4.u)(i, "startTime") ? i.startTime : void 0,
                    endTime: (0, e4.u)(i, "endTime") ? i.endTime : void 0
                } : void 0,
                music: (0, e4.u)(n, "music") ? tr(n.music) : void 0,
                textOverlays: (0, e4.u)(n, "textOverlays") ? null === n.textOverlays ? null : n.textOverlays.map(tl) : void 0,
                stickerOverlays: (0, e4.u)(n, "stickerOverlays") ? null === n.stickerOverlays ? null : n.stickerOverlays.map(to) : void 0,
                ttsAudios: (0, e4.u)(n, "ttsAudios") ? null === n.ttsAudios ? null : n.ttsAudios.map(tu) : void 0
            } : void 0,
            screenshotCaptureEdits: (0, e4.u)(e, "screenshotCaptureEdits") ? null == (a = e.screenshotCaptureEdits) ? a : {
                music: (0, e4.u)(a, "music") ? tr(a.music) : void 0,
                textOverlays: (0, e4.u)(a, "textOverlays") ? null === a.textOverlays ? null : a.textOverlays.map(tl) : void 0,
                ttsAudios: (0, e4.u)(a, "ttsAudios") ? null === a.ttsAudios ? null : a.ttsAudios.map(tu) : void 0
            } : void 0
        }
    }

    function th(e, t) {
        var n;
        return null == e ? e : {
            status: (0, e4.u)(e, "status") ? e.status : void 0,
            result: (0, e4.u)(e, "result") ? null == (n = e.result) ? n : {
                assetId: (0, e4.u)(n, "assetId") ? n.assetId : void 0,
                isApproved: (0, e4.u)(n, "isApproved") ? n.isApproved : void 0,
                operationError: (0, e4.u)(n, "operationError") ? n.operationError : void 0
            } : void 0
        }
    }

    function tv(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, e4.u)(t, "role") ? t.role : void 0,
            operationId: (0, e4.u)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, e4.u)(t, "operationPath") ? t.operationPath : void 0,
            done: (0, e4.u)(t, "done") ? t.done : void 0
        }
    }

    function tg(e, t) {
        return null == e ? e : {
            generationToken: (0, e4.u)(e, "generationToken") ? e.generationToken : void 0
        }
    }

    function tx(e, t) {
        return null == e ? e : {
            count: (0, e4.u)(e, "count") ? e.count : void 0,
            countIsCapped: (0, e4.u)(e, "countIsCapped") ? e.countIsCapped : void 0,
            creatorEnabled: (0, e4.u)(e, "creatorEnabled") ? e.creatorEnabled : void 0,
            viewerCanRead: (0, e4.u)(e, "viewerCanRead") ? e.viewerCanRead : void 0,
            viewerCanWrite: (0, e4.u)(e, "viewerCanWrite") ? e.viewerCanWrite : void 0
        }
    }

    function ty(e, t) {
        return null == e ? e : {
            type: (0, e4.u)(e, "type") ? e.type : void 0,
            id: (0, e4.u)(e, "id") ? e.id : void 0
        }
    }

    function tb(e, t) {
        return null == e ? e : {
            counts: (0, e4.u)(e, "counts") ? e.counts : void 0,
            userReaction: (0, e4.u)(e, "userReaction") ? e.userReaction : void 0
        }
    }

    function tI(e, t) {
        return null == e ? e : {
            shareCount: (0, e4.u)(e, "shareCount") ? e.shareCount : void 0
        }
    }

    function tw(e, t) {
        var n;
        return null == e ? e : {
            type: (0, e4.u)(e, "type") ? e.type : void 0,
            experienceCta: (0, e4.u)(e, "experienceCta") ? null == (n = e.experienceCta) ? n : {
                experienceId: (0, e4.u)(n, "experienceId") ? n.experienceId : void 0,
                placeId: (0, e4.u)(n, "placeId") ? n.placeId : void 0
            } : void 0
        }
    }

    function tC(e) {
        var t;
        return null == (t = e) ? t : {
            feedSessionId: (0, e4.u)(t, "feedSessionId") ? t.feedSessionId : void 0,
            entityId: (0, e4.u)(t, "entityId") ? t.entityId : void 0,
            entityType: (0, e4.u)(t, "entityType") ? t.entityType : void 0,
            id: (0, e4.u)(t, "id") ? t.id : void 0,
            feedItemId: (0, e4.u)(t, "feedItemId") ? t.feedItemId : void 0,
            channelId: (0, e4.u)(t, "channelId") ? t.channelId : void 0,
            type: (0, e4.u)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, e4.u)(t, "captionedAssetMoment") ? tf(t.captionedAssetMoment) : void 0,
            primaryCta: (0, e4.u)(t, "primaryCta") ? tw(t.primaryCta) : void 0,
            owner: (0, e4.u)(t, "owner") ? ty(t.owner) : void 0,
            visibilityStatus: (0, e4.u)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, e4.u)(t, "reactions") ? tb(t.reactions) : void 0,
            comments: (0, e4.u)(t, "comments") ? tx(t.comments) : void 0,
            stats: (0, e4.u)(t, "stats") ? tI(t.stats) : void 0
        }
    }

    function tT(e, t) {
        return null == e ? e : {
            feedItems: (0, e4.u)(e, "feedItems") ? e.feedItems : void 0,
            loaded: (0, e4.u)(e, "loaded") ? e.loaded : void 0,
            failed: (0, e4.u)(e, "failed") ? e.failed : void 0,
            moderated: (0, e4.u)(e, "moderated") ? e.moderated : void 0
        }
    }

    function tj(e, t) {
        return null == e ? e : {
            items: (0, e4.u)(e, "items") ? null === e.items ? null : e.items.map(tC) : void 0,
            paginationContext: (0, e4.u)(e, "paginationContext") ? e.paginationContext : void 0,
            metadata: (0, e4.u)(e, "metadata") ? tT(e.metadata) : void 0
        }
    }

    function tS(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, e4.u)(t, "id") ? t.id : void 0,
            feedItemId: (0, e4.u)(t, "feedItemId") ? t.feedItemId : void 0,
            channelId: (0, e4.u)(t, "channelId") ? t.channelId : void 0,
            type: (0, e4.u)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, e4.u)(t, "captionedAssetMoment") ? tf(t.captionedAssetMoment) : void 0,
            primaryCta: (0, e4.u)(t, "primaryCta") ? tw(t.primaryCta) : void 0,
            owner: (0, e4.u)(t, "owner") ? ty(t.owner) : void 0,
            visibilityStatus: (0, e4.u)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, e4.u)(t, "reactions") ? tb(t.reactions) : void 0,
            comments: (0, e4.u)(t, "comments") ? tx(t.comments) : void 0,
            stats: (0, e4.u)(t, "stats") ? tI(t.stats) : void 0
        }
    }

    function tM(e) {
        var t;
        return null == (t = e) ? t : {
            startSeconds: (0, e4.u)(t, "startSeconds") ? t.startSeconds : void 0,
            endSeconds: (0, e4.u)(t, "endSeconds") ? t.endSeconds : void 0,
            text: (0, e4.u)(t, "text") ? t.text : void 0
        }
    }

    function tk(e, t) {
        return null == e ? e : {
            signingAlgorithmVersion: (0, e4.u)(e, "signingAlgorithmVersion") ? e.signingAlgorithmVersion : void 0,
            signature: (0, e4.u)(e, "signature") ? e.signature : void 0
        }
    }
    var tE = e4._;

    function tP() {
        return null !== tE && tE.apply(this, arguments) || this
    }
    e3(tP, tE), tP.prototype.backfillTriggerB1Raw = function(e, t) {
        return e7(this, void 0, void 0, function() {
            var n, i, a;
            return e8(this, function(r) {
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
                        return a = r.sent(), [2, new e4.V(a)]
                }
            })
        })
    }, tP.prototype.backfillTriggerB1 = function() {
        return e7(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e8(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.backfillTriggerB1Raw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var tA = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return e3(t, e), t.prototype.contentCapturesBatchCheckExperienceUploadabilityRaw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.V(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesBatchCheckExperienceUploadability = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesBatchCheckExperienceUploadabilityRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibilityRaw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return null == e ? e : {
                                        isEligible: (0, e4.u)(e, "isEligible") ? e.isEligible : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibility = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return th(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatus = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return th(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatusRcc = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a, r;
                    return e8(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, e4.I)([{
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
                                return r = o.sent(), [2, new e4.H(r, function(e) {
                                    return null == e ? e : {
                                        operationId: (0, e4.u)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCreateInfluencerMomentFromVideo = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.V(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesGrantExperiencePermissions = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesGrantExperiencePermissionsRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadataRaw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return tk(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadata = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a, r;
                    return e8(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, e4.I)([{
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
                                return r = o.sent(), [2, new e4.H(r, function(e) {
                                    return tk(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignFileAndMetadataInternal = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(td),
                                                                    stickerOverlays: void 0 === e.stickerOverlays ? void 0 : null === e.stickerOverlays ? null : e.stickerOverlays.map(ts),
                                                                    ttsAudios: void 0 === e.ttsAudios ? void 0 : null === e.ttsAudios ? null : e.ttsAudios.map(tc)
                                                                }
                                                            }(e.edits)
                                                        }
                                                    }(e.metadata),
                                                    feedRegistrationInfo: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            attributes: void 0 === e.attributes ? void 0 : null === e.attributes ? null : e.attributes.map(ta),
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
                                return a = r.sent(), [2, new e4.V(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesUploadCaptureWithAsset = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesUploadCaptureWithAssetRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(e4._),
        tL = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            e3(t, e), t.prototype.moderationApplyModerationDecisionRaw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.V(a)]
                        }
                    })
                })
            }, t.prototype.moderationApplyModerationDecision = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationApplyModerationDecisionRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.moderationReportMomentRaw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new e4.w("momentId", "Required parameter requestParameters.momentId was null or undefined when calling moderationReportMoment.");
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
                                return a = r.sent(), [2, new e4.V(a)]
                        }
                    })
                })
            }, t.prototype.moderationReportMoment = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    return e8(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationReportMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(e4._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            e3(t, e), t.prototype.momentTextGenerationCreateMomentVideoUploadUrlRaw = function(e) {
                return e7(this, void 0, void 0, function() {
                    var t, n, i;
                    return e8(this, function(a) {
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
                                return i = a.sent(), [2, new e4.H(i, function(e) {
                                    return null == e ? e : {
                                        uploadUrl: (0, e4.u)(e, "uploadUrl") ? e.uploadUrl : void 0,
                                        videoObjectKey: (0, e4.u)(e, "videoObjectKey") ? e.videoObjectKey : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationCreateMomentVideoUploadUrl = function(e) {
                return e7(this, void 0, void 0, function() {
                    return e8(this, function(t) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return tg(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentText = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return tg(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentTextWithVideo = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        status: (0, e4.u)(e, "status") ? e.status : void 0,
                                        result: (0, e4.u)(e, "result") ? null == (t = e.result) ? t : {
                                            summary: (0, e4.u)(t, "summary") ? t.summary : void 0,
                                            description: (0, e4.u)(t, "description") ? t.description : void 0,
                                            error: (0, e4.u)(t, "error") ? t.error : void 0,
                                            segments: (0, e4.u)(t, "segments") ? null === t.segments ? null : t.segments.map(tM) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGetMomentTextGenerationStatus = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.V(a)]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationSubmitMomentGeneratedTextFeedback = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentTextGenerationSubmitMomentGeneratedTextFeedbackRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(e4._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return e3(t, e), t.prototype.momentsCleanUserDataRaw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        notificationId: (0, e4.u)(e, "NotificationId") ? e.NotificationId : void 0,
                                        eventType: (0, e4.u)(e, "EventType") ? e.EventType : void 0,
                                        eventTime: (0, e4.u)(e, "EventTime") ? new Date(e.EventTime) : void 0,
                                        eventPayload: (0, e4.u)(e, "EventPayload") ? null == (t = e.EventPayload) ? t : {
                                            userId: (0, e4.u)(t, "UserId") ? t.UserId : void 0,
                                            gameIds: (0, e4.u)(t, "GameIds") ? t.GameIds : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsCleanUserData = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new e4.w("momentId", "Required parameter requestParameters.momentId was null or undefined when calling momentsDeleteMoment.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/{momentId}".replace("{".concat("momentId", "}"), encodeURIComponent(String(e.momentId))),
                                    schemaPath: "/v2/moments/{momentId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new e4.V(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMoment = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    return e8(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItemRaw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.feedItemId || void 0 === e.feedItemId) throw new e4.w("feedItemId", "Required parameter requestParameters.feedItemId was null or undefined when calling momentsDeleteMomentByFeedItem.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/by-feed-item/{feedItemId}".replace("{".concat("feedItemId", "}"), encodeURIComponent(String(e.feedItemId))),
                                    schemaPath: "/v2/moments/by-feed-item/{feedItemId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new e4.V(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItem = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    return e8(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentByFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendationsRaw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return tj(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendations = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, e4.u)(e, "items") ? null === e.items ? null : e.items.map(tS) : void 0,
                                        failedMomentIds: (0, e4.u)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, e4.u)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMoments = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, e4.u)(e, "items") ? null === e.items ? null : e.items.map(tS) : void 0,
                                        failedMomentIds: (0, e4.u)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, e4.u)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0,
                                        paginationContext: (0, e4.u)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, e4.u)(e, "metadata") ? tT(e.metadata) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetUsersMoments = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.V(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItem = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2Raw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.V(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2 = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemV2Raw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsSearchMomentsRaw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return tj(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentsSearchMoments = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var t, n, i;
                    return e8(this, function(a) {
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
                                return i = a.sent(), [2, new e4.V(i)]
                        }
                    })
                })
            }, t.prototype.momentsTestSuppressOwnedFeedItems = function(e) {
                return e7(this, void 0, void 0, function() {
                    return e8(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.momentsTestSuppressOwnedFeedItemsRaw(e)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, t
        }(e4._)),
        tN = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return e3(t, e), t.prototype.postsCompletePostRaw = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                            uploads: void 0 === e.uploads ? void 0 : null === e.uploads ? null : e.uploads.map(e9)
                                        }
                                    }(e.postsCompletePostRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return null == e ? e : {
                                        uploads: (0, e4.u)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(tv) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsCompletePost = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
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
                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(tn),
                                                    textToSpeech: void 0 === e.textToSpeech ? void 0 : null === e.textToSpeech ? null : e.textToSpeech.map(ti),
                                                    contentLanguage: e.contentLanguage
                                                }
                                            }(e.common),
                                            videoPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    video: te(e.video),
                                                    durationSeconds: e.durationSeconds,
                                                    trim: tt(e.trim)
                                                }
                                            }(e.videoPost),
                                            screenshotPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    screenshot: te(e.screenshot),
                                                    widthPixels: e.widthPixels,
                                                    heightPixels: e.heightPixels
                                                }
                                            }(e.screenshotPost),
                                            influencerVideoPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    video: te(e.video),
                                                    durationSeconds: e.durationSeconds,
                                                    trim: tt(e.trim)
                                                }
                                            }(e.influencerVideoPost)
                                        }
                                    }(e.postsCreatePostRequest)
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        post: (0, e4.u)(e, "post") ? null == (t = e.post) ? t : {
                                            operationId: (0, e4.u)(t, "operationId") ? t.operationId : void 0
                                        } : void 0,
                                        uploads: (0, e4.u)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(tp) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsCreatePost = function() {
                return e7(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e8(this, function(n) {
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
                return e7(this, void 0, void 0, function() {
                    var n, i, a;
                    return e8(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new e4.w("operationId", "Required parameter requestParameters.operationId was null or undefined when calling postsGetPostOperationStatus.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = r.sent(), [2, new e4.H(a, function(e) {
                                    return null == e ? e : {
                                        path: (0, e4.u)(e, "path") ? e.path : void 0,
                                        done: (0, e4.u)(e, "done") ? e.done : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsGetPostOperationStatus = function(e, t) {
                return e7(this, void 0, void 0, function() {
                    return e8(this, function(n) {
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
        }(e4._),
        tR = e4._;

    function tU() {
        return null !== tR && tR.apply(this, arguments) || this
    }
    e3(tU, tR), tU.prototype.testSeedCreatePostAssetRaw = function(e, t) {
        return e7(this, void 0, void 0, function() {
            var n, i, a;
            return e8(this, function(r) {
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
                        return a = r.sent(), [2, new e4.V(a)]
                }
            })
        })
    }, tU.prototype.testSeedCreatePostAsset = function() {
        return e7(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e8(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedCreatePostAssetRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tU.prototype.testSeedInspectPostRaw = function(e, t) {
        return e7(this, void 0, void 0, function() {
            var n, i, a;
            return e8(this, function(r) {
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
                        return a = r.sent(), [2, new e4.V(a)]
                }
            })
        })
    }, tU.prototype.testSeedInspectPost = function() {
        return e7(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e8(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedInspectPostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tU.prototype.testSeedListUserMomentsRaw = function(e) {
        return e7(this, void 0, void 0, function() {
            var t, n, i;
            return e8(this, function(a) {
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
                        return i = a.sent(), [2, new e4.V(i)]
                }
            })
        })
    }, tU.prototype.testSeedListUserMoments = function(e) {
        return e7(this, void 0, void 0, function() {
            return e8(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.testSeedListUserMomentsRaw(e)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    }, tU.prototype.testSeedMomentToPostRaw = function(e, t) {
        return e7(this, void 0, void 0, function() {
            var n, i, a;
            return e8(this, function(r) {
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
                        return a = r.sent(), [2, new e4.V(a)]
                }
            })
        })
    }, tU.prototype.testSeedMomentToPost = function() {
        return e7(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e8(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedMomentToPostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tU.prototype.testSeedSeedBatchRaw = function(e, t) {
        return e7(this, void 0, void 0, function() {
            var n, i, a;
            return e8(this, function(r) {
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
                        return a = r.sent(), [2, new e4.V(a)]
                }
            })
        })
    }, tU.prototype.testSeedSeedBatch = function() {
        return e7(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e8(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedSeedBatchRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tU.prototype.testSeedSeedMomentRaw = function(e, t) {
        return e7(this, void 0, void 0, function() {
            var n, i, a;
            return e8(this, function(r) {
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
                        return a = r.sent(), [2, new e4.V(a)]
                }
            })
        })
    }, tU.prototype.testSeedSeedMoment = function() {
        return e7(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e8(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedSeedMomentRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tU.prototype.testSeedWirePostRaw = function(e, t) {
        return e7(this, void 0, void 0, function() {
            var n, i, a;
            return e8(this, function(r) {
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
                        return a = r.sent(), [2, new e4.V(a)]
                }
            })
        })
    }, tU.prototype.testSeedWirePost = function() {
        return e7(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e8(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedWirePostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var tD = e.i(272593);
    let tO = (0, tD.f)("content-captures-api", "bedev2"),
        t_ = new tA(tO),
        tz = new tL(tO),
        tq = new tN(tO),
        tV = Object.assign(t_, {
            momentsGetUsersMoments: e => tz.momentsGetUsersMoments(e),
            momentsDeleteMoment: e => tz.momentsDeleteMoment(e),
            momentsDeleteMomentByFeedItem: e => tz.momentsDeleteMomentByFeedItem(e),
            postsCreatePost: e => tq.postsCreatePost(e),
            postsCompletePost: e => tq.postsCompletePost(e)
        });
    var tF = e.i(773057),
        tB = e.i(227987),
        tG = e.i(889311),
        tH = e.i(215955),
        tK = ((t = {}).ListMoments = "listMoments", t.FetchNextPage = "fetchNextPage", t.UploadVideo = "uploadVideo", t.ValidateVideo = "validateVideo", t.PersistLocalVideo = "persistLocalVideo", t.PublishMoment = "publishMoment", t.DeleteMoment = "deleteMoment", t.ResolveExperience = "resolveExperience", t.LoadLocalVideoMedia = "loadLocalVideoMedia", t.EnrichExperienceNames = "enrichExperienceNames", t.CopyShareLink = "copyShareLink", t.ListViolations = "listViolations", t);
    let tW = (e, t) => {
            let n;
            return null != t.momentId && (e.momentId = t.momentId), null != t.feedItemId && (e.feedItemId = t.feedItemId), null != t.draftId && (e.draftId = t.draftId), null != t.experienceId && (e.experienceId = String(t.experienceId)), null != t.placeId && (e.placeId = String(t.placeId)), null != t.fileCount && (e.fileCount = String(t.fileCount)), null != t.fileSize && (e.fileSize = String(t.fileSize)), null != t.fileType && t.fileType.length > 0 && (e.fileType = t.fileType), null != t.locale && t.locale.length > 0 && (e.locale = t.locale), null != t.inputValue && t.inputValue.length > 0 && (e.inputValue = (n = t.inputValue).length <= 200 ? n : n.slice(0, 200)), null != t.idType && (e.idType = t.idType), null != t.matchedId && (e.matchedId = String(t.matchedId)), null != t.userId && (e.userId = String(t.userId)), null != t.pageCount && (e.pageCount = String(t.pageCount)), null != t.momentCount && (e.momentCount = String(t.momentCount)), null != t.persistedVideoCount && (e.persistedVideoCount = String(t.persistedVideoCount)), null != t.isLocalMoment && (e.isLocalMoment = String(t.isLocalMoment)), null != t.universeIdCount && (e.universeIdCount = String(t.universeIdCount)), e
        },
        tX = async (e, t) => {
            var n;
            let i = await (0, tB.f)(e),
                a = e instanceof Error ? e.message : "string" == typeof e ? e : "Unknown error";
            return i ? {
                reason: null != (n = null != t ? t : i.message) ? n : a,
                httpStatus: i.status,
                errorCode: i.code
            } : {
                reason: null != t ? t : a
            }
        }, tY = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return {
                eventName: tG.f.MomentsCreationsError,
                parameters: tW({
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
        }, tJ = async function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tH.f,
                a = await tX(t, n.reason);
            i.logErrorEvent(tY(e, a, n))
        }, tQ = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tH.f;
            tJ(e, t, n, i)
        }, tZ = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: tG.f.MomentsCreationsAttempt,
                parameters: tW({
                    operation: e
                }, t)
            }
        }, t$ = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: tG.f.MomentsCreationsSuccess,
                parameters: tW({
                    operation: e
                }, t)
            }
        }, t0 = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tH.f;
            n.logClickEvent(tZ(e, t))
        }, t1 = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tH.f;
            n.logImpressionEvent(t$(e, t))
        };
    var t2 = e.i(773595);
    let t4 = t2.W,
        t5 = new Set(t4),
        t3 = e => {
            let t = e === d.v.SimplifiedChineseJV ? d.v.SimplifiedChinese : e;
            return null != t && t5.has(t) ? t : d.v.English
        },
        t7 = e => null != e ? (0, d.t)(e) : "-",
        t8 = {
            active: eI,
            captionedassetmoment: eI,
            live: eI,
            moderated: eT,
            pending: ew,
            published: eI
        },
        t6 = new Date(0).toISOString(),
        t9 = function(e) {
            var t, n, i, a, r, o, s;
            let l = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                d = null != (t = e.id) ? t : void 0,
                u = null != (n = e.feedItemId) ? n : void 0,
                c = l ? u : d;
            if (null == c || "" === c) return null;
            let m = null != (i = null == (r = e.type) ? void 0 : r.toLowerCase()) ? i : "";
            if ("draft" === m || m.includes("draft")) return null;
            let p = e.captionedAssetMoment,
                f = null == (s = e.primaryCta) || null == (o = s.experienceCta) ? void 0 : o.experienceId,
                h = (e => {
                    if (null != e && "" !== e) return t2.D.get(e.toLowerCase())
                })(null == p ? void 0 : p.videoContentLanguage);
            return {
                momentId: d,
                feedItemId: u,
                assetId: null == p ? void 0 : p.assetId,
                description: null != (a = null == p ? void 0 : p.caption) ? a : "",
                experienceName: "",
                modifiedAt: t6,
                status: (e => {
                    if (!e) return eI;
                    let t = t8[e.toLowerCase()];
                    if (t) return t;
                    let n = e.toLowerCase();
                    return n.includes("pending") ? ew : (n.includes("active") || n.includes("publish") || n.includes("live"), eI)
                })(e.type),
                universeId: f,
                ...null != h ? {
                    locale: h
                } : {}
            }
        },
        ne = function(e) {
            var t;
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return (null != (t = e.items) ? t : []).map(e => t9(e, n)).filter(e => null != e)
        },
        nt = async (e, t) => tV.momentsGetUsersMoments({
            targetUserId: e,
            paginationContext: null == t ? void 0 : t.paginationContext,
            count: 25
        }), nn = async e => {
            let t = [...new Set(e.map(e => e.universeId).filter(e => null != e && e > 0))];
            if (0 === t.length) return e;
            try {
                t0(tK.EnrichExperienceNames, {
                    universeIdCount: t.length
                });
                let {
                    data: n = []
                } = await tF.f.getUniversesDetails(t), i = new Map(n.filter(e => null != e.id && "string" == typeof e.name && e.name.length > 0).map(e => [e.id, e.name])), a = e.map(e => {
                    var t;
                    let n = null != e.universeId && null != (t = i.get(e.universeId)) ? t : "";
                    return n === e.experienceName ? e : {
                        ...e,
                        experienceName: n
                    }
                });
                return t1(tK.EnrichExperienceNames, {
                    universeIdCount: t.length
                }), a
            } catch (n) {
                return tQ(tK.EnrichExperienceNames, n, {
                    universeIdCount: t.length
                }), e
            }
        }, ni = async function(e, t) {
            var n, i;
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                r = (null == t ? void 0 : t.paginationContext) != null ? tK.FetchNextPage : tK.ListMoments;
            t0(r, {
                userId: e
            });
            let o = await nt(e, t),
                s = ne(o, a),
                l = await nn(s);
            return t1(r, {
                userId: e,
                pageCount: null != (n = null == t ? void 0 : t.pageNumber) ? n : 1,
                momentCount: l.length
            }), {
                moments: l,
                paginationContext: null != (i = o.paginationContext) ? i : void 0
            }
        }, na = async e => {
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
                status: eC,
                ...null != a ? {
                    locale: a
                } : {}
            }
        };
    async function nr(e) {
        let {
            feedItemId: t,
            momentId: n,
            useFeedItemId: i = !1
        } = e;
        if (i) {
            if (null == t || "" === t) throw Error("Moment feed item id is required before deleting");
            await tV.momentsDeleteMomentByFeedItem({
                feedItemId: t
            });
            return
        }
        if (null == n || "" === n) throw Error("Moment id is required before deleting");
        await tV.momentsDeleteMoment({
            momentId: n
        })
    }
    var no = e.i(805290),
        ns = function(e, t) {
            return (ns = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        },
        nl = function() {
            return (nl = Object.assign || function(e) {
                for (var t, n = 1, i = arguments.length; n < i; n++)
                    for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                return e
            }).apply(this, arguments)
        };

    function nd(e, t, n, i) {
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

    function nu(e, t) {
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
                var d = [s, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, d[0] && (r = 0)), r;) try {
                    if (n = 1, i && (a = 2 & d[0] ? i.return : d[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, d[1])).done) return a;
                    switch (i = 0, a && (d = [2 & d[0], a.value]), d[0]) {
                        case 0:
                        case 1:
                            a = d;
                            break;
                        case 4:
                            return r.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = d[1], d = [0];
                            continue;
                        case 7:
                            d = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === d[0] && (!a || d[1] > a[0] && d[1] < a[3])) {
                                r.label = d[1];
                                break
                            }
                            if (6 === d[0] && r.label < a[1]) {
                                r.label = a[1], a = d;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(d);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    d = t.call(e, r)
                } catch (e) {
                    d = [6, e], i = 0
                } finally {
                    n = a = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function nc(e) {
        return e
    }
    "function" == typeof SuppressedError && SuppressedError;

    function nm(e) {
        var t;
        return null == (t = e) ? t : {
            uid: t.uid,
            create_time: new Date(t.create_time),
            update_time: new Date(t.update_time),
            name: t.name,
            state: t.state,
            abuse_type_keys: t.abuse_type_keys,
            decision_time: (0, e4.u)(t, "decision_time") ? new Date(t.decision_time) : void 0,
            message: t.message
        }
    }

    function np(e) {
        var t, n, i;
        return null == (t = e) ? t : {
            uid: t.uid,
            create_time: new Date(t.create_time),
            update_time: new Date(t.update_time),
            name: t.name,
            user: t.user,
            content: (0, e4.u)(t, "content") ? function(e) {
                var t, n, i, a, r, o;
                if (null == e) return e;
                switch (e.content_type) {
                    case "CONTENT_TYPE_ASSET":
                        return nl(nl({}, null == (t = e) ? t : {
                            content_type: t.content_type,
                            asset_id: t.asset_id,
                            name: t.name,
                            display_name: (0, e4.u)(t, "display_name") ? t.display_name : void 0,
                            description: (0, e4.u)(t, "description") ? t.description : void 0,
                            asset_type: t.asset_type
                        }), {
                            content_type: "CONTENT_TYPE_ASSET"
                        });
                    case "CONTENT_TYPE_AVATAR":
                        return nl(nl({}, null == (n = e) ? n : {
                            content_type: n.content_type
                        }), {
                            content_type: "CONTENT_TYPE_AVATAR"
                        });
                    case "CONTENT_TYPE_BUNDLE":
                        return nl(nl({}, null == (i = e) ? i : {
                            content_type: i.content_type,
                            bundle_id: i.bundle_id,
                            name: i.name,
                            display_name: (0, e4.u)(i, "display_name") ? i.display_name : void 0,
                            description: (0, e4.u)(i, "description") ? i.description : void 0,
                            bundle_type: i.bundle_type
                        }), {
                            content_type: "CONTENT_TYPE_BUNDLE"
                        });
                    case "CONTENT_TYPE_CHAT":
                        return nl(nl({}, null == (a = e) ? a : {
                            content_type: a.content_type,
                            chatlines: a.chatlines,
                            review_time: a.review_time,
                            is_in_app_chat: a.is_in_app_chat,
                            experience_name: (0, e4.u)(a, "experience_name") ? a.experience_name : void 0,
                            username: a.username
                        }), {
                            content_type: "CONTENT_TYPE_CHAT"
                        });
                    case "CONTENT_TYPE_LOOK":
                        return nl(nl({}, null == (r = e) ? r : {
                            content_type: r.content_type,
                            id: r.id,
                            name: (0, e4.u)(r, "name") ? r.name : void 0,
                            description: (0, e4.u)(r, "description") ? r.description : void 0
                        }), {
                            content_type: "CONTENT_TYPE_LOOK"
                        });
                    case "CONTENT_TYPE_USER_PROFILE":
                        return nl(nl({}, null == (o = e) ? o : {
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
            appeals: t.appeals.map(nm),
            allowed_appeal_types: t.allowed_appeal_types.map(nc),
            evidence: (0, e4.u)(t, "evidence") ? null == (n = t.evidence) ? n : {
                type: n.type,
                elements: (0, e4.u)(n, "elements") ? n.elements : void 0,
                elementsObj: (0, e4.u)(n, "elementsObj") ? n.elementsObj : void 0,
                display_meta: null == (i = n.display_meta) ? i : {
                    lowercase_key: (0, e4.u)(i, "lowercase_key") ? i.lowercase_key : void 0,
                    capitalized_key: (0, e4.u)(i, "capitalized_key") ? i.capitalized_key : void 0,
                    icon: (0, e4.u)(i, "icon") ? i.icon : void 0
                }
            } : void 0,
            user_note: (0, e4.u)(t, "user_note") ? t.user_note : void 0
        }
    }
    var nf = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            ns(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(t, e), t.prototype.listViolationsRaw = function(e, t) {
            return nd(this, void 0, void 0, function() {
                var n, i, a;
                return nu(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new e4.w("userId", "Required parameter requestParameters.userId was null or undefined when calling listViolations.");
                            return n = {}, void 0 !== e.pageSize && (n.page_size = e.pageSize), void 0 !== e.pageToken && (n.page_token = e.pageToken), i = {}, [4, this.request({
                                path: "/v1/users/{user_id}/violations".replace("{".concat("user_id", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{user_id}/violations",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = r.sent(), [2, new e4.H(a, function(e) {
                                return null == e ? e : {
                                    violations: e.violations.map(np),
                                    next_page_token: (0, e4.u)(e, "next_page_token") ? e.next_page_token : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.listViolations = function(e, t) {
            return nd(this, void 0, void 0, function() {
                return nu(this, function(n) {
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
    }(e4._);
    let nh = new class {
            listViolationsRaw(e) {
                return this.violationsApi.listViolationsRaw(e)
            }
            constructor() {
                (0, no._)(this, "violationsApi", void 0), this.violationsApi = new nf((0, tD.f)("moderation-appeal-service", "bedev2"))
            }
        },
        nv = e => "object" == typeof e && null !== e && !Array.isArray(e),
        ng = function(e) {
            for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), i = 1; i < t; i++) n[i - 1] = arguments[i];
            for (let t of n) {
                let n = e[t];
                if ("string" == typeof n && "" !== n) return n
            }
        },
        nx = function(e) {
            for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), i = 1; i < t; i++) n[i - 1] = arguments[i];
            for (let t of n) {
                let n = e[t];
                if (nv(n)) return n
            }
        },
        ny = e => {
            var t;
            if (!nv(e)) return !1;
            let n = null != (t = nx(e, "evidence")) ? t : {},
                i = nx(n, "display_meta", "displayMeta");
            return null != i && ("Label.Type.Post" === ng(i, "capitalized_key", "capitalizedKey") || "Label.TypeLower.Post" === ng(i, "lowercase_key", "lowercaseKey"))
        },
        nb = e => {
            var t, n;
            if (!nv(e)) return null;
            let i = ng(e, "uid");
            if (null == i) return null;
            let a = null != (t = (e => {
                    let t = ng(e, "create_time", "createTime");
                    if (null == t) return;
                    let n = new Date(t).getTime();
                    return Number.isNaN(n) ? void 0 : new Date(n).toISOString()
                })(e)) ? t : (e => {
                    var t;
                    let n = null == (t = nx(e, "evidence")) ? void 0 : t.elements;
                    if (Array.isArray(n)) {
                        for (let e of n)
                            if (nv(e) && "Label.UploadTime" === e.labelKey && "number" == typeof e.unix && Number.isFinite(e.unix) && e.unix > 0) return new Date(1e3 * e.unix).toISOString()
                    }
                })(e),
                r = (e => {
                    var t, n, i;
                    let a = null == (t = nx(e, "evidence")) ? void 0 : t.elements;
                    if (Array.isArray(a)) {
                        for (let e of a)
                            if (nv(e) && "Label.MomentDescription" === e.labelKey) {
                                let t = null != (n = null == (i = ng(e, "text")) ? void 0 : i.trim()) ? n : "";
                                return t.length > 0 ? t : void 0
                            }
                    }
                })(e);
            return {
                uid: i,
                abuseTypeLabelKeys: Object.values(null != (n = nx(e, "abuse_type_keys", "abuseTypeKeys")) ? n : {}).filter(e => "string" == typeof e && "" !== e),
                ...null != a ? {
                    uploadedAt: a
                } : {},
                ...null != r ? {
                    description: r
                } : {}
            }
        },
        nI = async e => {
            let t, n = [];
            for (let i = 0; i < 20; i += 1) {
                let i = await nh.listViolationsRaw({
                        userId: String(e),
                        pageSize: 10,
                        pageToken: t
                    }),
                    a = await i.raw.json();
                if (!nv(a)) break;
                for (let e of Array.isArray(a.violations) ? a.violations : []) {
                    if (!ny(e)) continue;
                    let t = nb(e);
                    null != t && n.push(t)
                }
                if (null == (t = ng(a, "next_page_token", "nextPageToken"))) break
            }
            return n
        };
    var nw = e.i(11682);
    async function nC(e) {
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
    let nT = "influencerVideo";
    async function nj(e) {
        let t = nw.md5.create();
        for (let n = 0; n < e.size; n += 5242880) {
            let i = Math.min(n + 5242880, e.size);
            t.update(await e.slice(n, i).arrayBuffer())
        }
        return t.hex()
    }
    async function nS(e, t) {
        let n = [];
        for (let [r, o] of e.entries()) {
            var i, a;
            let e = null != (i = o.chunkNum) ? i : r + 1;
            if (!o.url) throw Error("Pre-signed upload URL is missing for video chunk ".concat(e));
            let s = Number(o.contentStart),
                l = Number(o.contentLength),
                d = t.slice(s, s + l);
            if (d.size !== l) throw Error("Video chunk ".concat(e, " size mismatch: expected ").concat(l, " bytes, got ").concat(d.size));
            let u = await fetch(o.url, {
                method: null != (a = o.httpVerb) ? a : "PUT",
                body: d
            });
            if (!u.ok) throw Error("Failed to upload video chunk ".concat(e, ": ").concat(u.status, " ").concat(u.statusText));
            let c = u.headers.get("ETag");
            if (!c) throw Error("Missing ETag for video chunk ".concat(e));
            n.push({
                chunkNum: e,
                eTag: c.replaceAll(/["']/g, "")
            })
        }
        return n
    }
    async function nM(e) {
        var t, n, i, a, r, o;
        let {
            moment: s,
            file: l,
            displayName: d,
            uiLocale: u,
            sendVideoContentLanguage: c = !0
        } = e, m = await nC(l), p = await nj(l), f = {
            caption: s.description,
            ...c ? {
                contentLanguage: (null != (o = s.locale) ? o : t3(u)).toLowerCase()
            } : {},
            primaryCta: {
                experience: {
                    universeId: s.experienceId,
                    placeId: s.rootPlaceId
                }
            }
        }, h = await tV.postsCreatePost({
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
                        displayName: d,
                        description: s.description
                    },
                    durationSeconds: m
                }
            }
        }), v = null == (i = h.post) ? void 0 : i.operationId;
        if (null == v || "" === v) throw Error("Publish operation id is missing from the response");
        let g = null != (t = null == (a = h.uploads) ? void 0 : a.find(e => e.role === nT)) ? t : null == (r = h.uploads) ? void 0 : r[0];
        if (!(null == g ? void 0 : g.operationId)) throw Error("Create post response is missing the video upload target");
        let x = null != (n = g.uploadUrls) ? n : [];
        if (0 === x.length) throw Error("Create post response did not return any upload URLs");
        let y = await nS(x, l);
        return await tV.postsCompletePost({
            postsCompletePostRequest: {
                uploads: [{
                    role: nT,
                    operationId: g.operationId,
                    parts: y
                }]
            }
        }), {
            operationId: v
        }
    }
    async function nk(e) {
        if (!e.moment.experienceId) throw Error("Moment experience is required before publishing");
        if (0 === e.file.size) throw Error("Moment video file must not be empty");
        return nM(e)
    }
    var nE = e4;
    let nP = "/v2/get-or-create-static";
    class nA extends nE._ {
        async createStaticLink(e) {
            let t;
            if ("" === e.feedItemId) throw Error("Moment feed item id is required before creating a share link");
            let n = await this.request({
                    method: "POST",
                    path: nP,
                    schemaPath: nP,
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
                i = await new nE.H(n).value();
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
    let nL = new nA((0, tD.f)("deeplinks", "bedev2")),
        nN = () => {
            let {
                ready: e,
                value: t
            } = (0, l.f)(b.h);
            return e && null != t && t
        },
        nR = () => {
            let {
                ready: e,
                value: t
            } = (0, l.f)(b.M);
            return e && null != t && t
        },
        nU = e => {
            var t, n;
            return e.status === eC ? e.draftId : null != (t = null != (n = e.feedItemId) ? n : e.momentId) ? t : ""
        },
        nD = e => ["momentsCreations", e],
        nO = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return [...nD(e), t]
        },
        n_ = () => {
            let {
                ready: e,
                value: t
            } = (0, l.f)(b.q);
            return e && null != t && t
        },
        nz = () => {
            let e, t, [{
                    momentStatus: n
                }, i] = (0, et.f)(["momentStatus"]),
                r = (0, eZ.d)(),
                {
                    user: o
                } = (0, q.f)(),
                s = n_() ? eS : ej;
            return {
                statusTab: (e = null == n ? void 0 : Array.isArray(n) ? n[0] : n, (t = s.find(t => t === e)) || eC),
                statusTabs: s,
                setStatusTab: (0, a.useCallback)(e => {
                    i({
                        momentStatus: e
                    }), e === eI && r.invalidateQueries({
                        queryKey: nD(null == o ? void 0 : o.id)
                    })
                }, [r, i, null == o ? void 0 : o.id])
            }
        },
        nq = async (e, t, n, i) => {
            let a = {
                draftId: t,
                fileSize: n.size,
                fileType: n.type
            };
            t0(tK.PersistLocalVideo, a);
            try {
                let r, o, {
                    evictedMediaDraftIds: s
                } = await e_(e, t, n, (r = eY(window.localStorage.getItem(ey(e))), o = new Set(i.map(e => e.draftId)), [...i, ...r.filter(e => !o.has(e.draftId))]));
                return t1(tK.PersistLocalVideo, a), {
                    hasLocalVideo: !0,
                    storageEvictedMediaDraftIds: s
                }
            } catch (e) {
                return tQ(tK.PersistLocalVideo, e, {
                    draftId: t,
                    fileSize: n.size,
                    fileType: n.type
                }), {
                    hasLocalVideo: !1,
                    storageEvictedMediaDraftIds: []
                }
            }
        };
    var nV = e.i(137785);
    let nF = (0, d.K)(e => {
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
                }), a && (0, i.jsx)(ef.f, {
                    variant: "Link",
                    size: "Small",
                    onClick: a,
                    children: r("Action.EEChange")
                })]
            }), (0, i.jsx)("div", {
                className: "padding-medium radius-medium bg-surface-200 width-full",
                children: (0, i.jsx)(nV.f, {
                    disableLink: !0,
                    target: t,
                    targetType: "Experience",
                    variant: "medium"
                })
            })]
        })
    }, [en.f.Creations]);
    var nB = e.i(41472),
        nG = e.i(392782);
    let nH = "UniverseId",
        nK = "PlaceId",
        nW = /(?:https?:\/\/)?create\.roblox\.com\/dashboard\/creations\/experiences\/(\d+)/,
        nX = /(?:https?:\/\/)?(?:www\.)?roblox\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
        nY = /^\d+$/,
        nJ = [{
            regex: /(?:https?:\/\/)?create\.sitetest\d\.robloxlabs\.com\/dashboard\/creations\/experiences\/(\d+)/,
            idType: nH
        }, {
            regex: /(?:https?:\/\/)?(?:www\.)?sitetest\d\.robloxlabs\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
            idType: nK
        }],
        nQ = (0, d.K)(e => {
            let {
                onExperienceResolved: t,
                isDisabled: n = !1
            } = e, {
                translate: r
            } = (0, d.A)(), {
                ready: o,
                value: s
            } = (0, l.f)(b.G), [u, c] = (0, a.useState)(""), [m, p] = (0, a.useState)(!1), [f, h] = (0, a.useState)(), v = (0, a.useMemo)(() => [{
                regex: nW,
                idType: nH
            }, {
                regex: nX,
                idType: nK
            }, ...o && null != s && s ? nJ : [], {
                regex: nY,
                idType: nH
            }], [s, o]), g = (0, a.useMemo)(() => u.trim().length > 0 && v.some(e => {
                let {
                    regex: t
                } = e;
                return t.test(u.trim())
            }), [v, u]), x = (0, a.useCallback)(async () => {
                var e, n, i, a, o, s;
                let l = u.trim(),
                    d = v.find(e => {
                        let {
                            regex: t
                        } = e;
                        return t.test(l)
                    });
                if (!d) return;
                let m = d.idType === nH && nY.test(l) ? Number(l) : Number(null == (e = d.regex.exec(l)) ? void 0 : e[1]);
                if (!m || !Number.isFinite(m)) return;
                let f = {
                    inputValue: l,
                    idType: d.idType,
                    matchedId: m
                };
                p(!0), h(void 0), t0(tK.ResolveExperience, f);
                try {
                    let e;
                    if (d.idType === nK) {
                        let t = null == (s = (await nG.f.multigetPlaceDetails([m]))[0]) ? void 0 : s.universeId;
                        if (!t) {
                            tQ(tK.ResolveExperience, "Experience not found", {
                                ...f,
                                placeId: m,
                                reason: "ExperienceNotFound"
                            }), h(r("Error.ExperienceNotFound")), p(!1);
                            return
                        }
                        e = t
                    } else e = m;
                    let l = null == (o = (await nG.f.getDetails([e])).data) ? void 0 : o[0];
                    if (!(null == l ? void 0 : l.id)) {
                        tQ(tK.ResolveExperience, "Experience not found", {
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
                    }), t1(tK.ResolveExperience, {
                        ...f,
                        experienceId: l.id,
                        placeId: d.idType === nK ? m : void 0
                    }), c("")
                } catch (e) {
                    tQ(tK.ResolveExperience, e, {
                        ...f,
                        placeId: d.idType === nK ? m : void 0,
                        experienceId: d.idType === nH ? m : void 0
                    }), h(r("Error.ExperienceNotFound"))
                } finally {
                    p(!1)
                }
            }, [t, v, r, u]), y = (0, a.useCallback)(e => {
                "Enter" === e.key && g && (x(), e.preventDefault())
            }, [g, x]);
            return (0, i.jsxs)("div", {
                className: "flex flex-row gap-x-medium items-end width-full",
                children: [(0, i.jsx)("div", {
                    className: "grow-1 min-width-0",
                    children: (0, i.jsx)(nB.f, {
                        label: r("CreateMomentModal.ExperienceInput.Label"),
                        placeholder: r("CreateMomentModal.ExperienceInput.Placeholder"),
                        value: u,
                        onChange: e => {
                            c(e.target.value), h(void 0)
                        },
                        onKeyDown: y,
                        hasError: null != f,
                        error: f,
                        isDisabled: n || m,
                        size: "Medium"
                    })
                }), (0, i.jsx)(ef.f, {
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
        }, [en.f.Creations, en.f.Controls]);
    var nZ = e.i(854145),
        n$ = e.i(722027);
    let n0 = (0, d.K)(e => {
        let {
            value: t,
            onChange: n,
            isDisabled: r = !1
        } = e, {
            translate: o
        } = (0, d.A)(), s = o("CreateMomentModal.LanguageInput.Label"), l = o("CreateMomentModal.LanguageInput.Placeholder"), u = (0, a.useCallback)(e => {
            t5.has(e) && n(e)
        }, [n]);
        return (0, i.jsx)("div", {
            className: "width-full",
            "data-testid": "moments-language-select",
            children: (0, i.jsx)(nZ.x, {
                className: "width-full [&_.content-system-alert]:text-caption-medium",
                size: "Medium",
                label: s,
                ariaLabel: s,
                placeholder: l,
                value: t,
                isDisabled: r,
                onValueChange: u,
                children: (0, i.jsx)(n$.k, {
                    children: (0, i.jsx)(n$.T, {
                        children: t4.map(e => (0, i.jsx)(n$.d, {
                            value: e,
                            title: (0, d.t)(e)
                        }, e))
                    })
                })
            })
        })
    }, [en.f.Creations]);
    var n1 = e.i(321211);
    let n2 = ["mp4", "mov"],
        n4 = ["video/mp4", "video/quicktime"];
    var n5 = ((n = {}).FileTooBig = "FileTooBig", n.FileWrongType = "FileWrongType", n.DurationExceeded = "DurationExceeded", n.ResolutionExceeded = "ResolutionExceeded", n.MetadataUnavailable = "MetadataUnavailable", n);
    let n3 = e => {
            var t, n;
            let i;
            return e.size > 0xc800000 ? "FileTooBig" : null != (i = null == (n = (t = e).name.split(".").pop()) ? void 0 : n.toLowerCase()) && n2.some(e => e === i) && ("" === t.type || n4.includes(t.type)) ? null : "FileWrongType"
        },
        n7 = async e => {
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
        }, n8 = async e => {
            let t = [],
                n = [];
            for (let i of e) {
                let e = n3(i);
                if (null != e) {
                    n.push({
                        file: i,
                        reason: e
                    });
                    continue
                }
                let a = await n7(i);
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
        }, n6 = n2.map(e => e.toUpperCase()).join("/"), n9 = (0, d.K)(e => {
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
                            } = await n8(r);
                            if (t.length > 0) {
                                for (let {
                                        file: e,
                                        reason: n
                                    }
                                    of t) tQ(tK.ValidateVideo, n, {
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
                                        case n5.FileTooBig:
                                            return e("CreateMomentModal.Error.FileTooBigMegabytes", {
                                                maxFileSizeMB: new Intl.NumberFormat().format(200)
                                            });
                                        case n5.FileWrongType:
                                            return e("CreateMomentModal.Error.FileWrongType", {
                                                formats: n6
                                            });
                                        case n5.DurationExceeded:
                                            return e("CreateMomentModal.Error.DurationExceeded", {
                                                maxDurationMinutes: String(5)
                                            });
                                        case n5.ResolutionExceeded:
                                            return e("CreateMomentModal.Error.ResolutionExceeded", {
                                                maxWidth: String(4096),
                                                maxHeight: String(2160)
                                            });
                                        case n5.MetadataUnavailable:
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
                children: (0, i.jsx)(n1.f, {
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
                        children: [(0, i.jsx)(ef.f, {
                            variant: "Standard",
                            size: "Medium",
                            type: "button",
                            icon: o || c ? void 0 : "icon-regular-arrow-up-from-line",
                            isDisabled: S,
                            onClick: e,
                            children: o || c ? (0, i.jsxs)("span", {
                                className: "inline-flex items-center gap-xsmall",
                                children: [(0, i.jsx)(J.f, {
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
        }, [en.f.Creations]), ie = (0, d.K)(e => {
            let {
                open: t,
                onOpenChange: n,
                onMomentUploaded: r
            } = e, {
                addMoments: o
            } = eQ(), {
                setStatusTab: s
            } = nz(), l = nR(), {
                translate: u
            } = (0, d.A)(), {
                locale: c
            } = (0, d.z)(), m = t3(c), [p, f] = (0, a.useState)(), [h, v] = (0, a.useState)(), g = null != h ? h : m, [x, y] = (0, a.useState)([]), [b, I] = (0, a.useState)([]), w = (0, a.useRef)(0), {
                uploadVideos: C,
                isUploading: T
            } = (() => {
                let {
                    user: e
                } = (0, q.f)(), [t, n] = (0, a.useState)(!1), [i, r] = (0, a.useState)(0);
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
                            let e = await na({
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
                                } = await nq(s, e.draftId, o, []);
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
                                let o = await na({
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
                                        hasLocalVideo: d,
                                        storageEvictedMediaDraftIds: u
                                    } = await nq(s, o.draftId, n, e);
                                t.push(...u), e.push({
                                    ...o,
                                    hasLocalVideo: d
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
                w.current = a, y(e), t0(tK.UploadVideo, {
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
                    }), t1(tK.UploadVideo, {
                        experienceId: p.id,
                        fileCount: t.length,
                        persistedVideoCount: t.filter(e => e.hasLocalVideo).length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (n = e[0]) ? void 0 : n.type,
                        ...l ? {
                            locale: g
                        } : {}
                    }), s(eC), S()
                } catch (t) {
                    if (w.current !== a) return;
                    tQ(tK.UploadVideo, t, {
                        experienceId: p.id,
                        fileCount: e.length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (i = e[0]) ? void 0 : i.type,
                        ...l ? {
                            locale: g
                        } : {}
                    }), y([])
                }
            }, [o, S, l, T, r, p, g, s, C]), R = u("CreateMomentModal.Title"), U = b[0], D = b.length > 1 ? b.slice(1).join(" ") : void 0;
            return (0, i.jsx)(ev.N, {
                open: t,
                onOpenChange: P,
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: u("Action.Close"),
                children: (0, i.jsx)(ev.d, {
                    className: "flex flex-col min-width-0 width-[min(720px,95vw)] !max-width-[min(720px,95vw)]",
                    children: (0, i.jsxs)(ev.K, {
                        className: "flex flex-col gap-y-medium",
                        children: [(0, i.jsx)(ev.F, {
                            className: "text-heading-small content-emphasis margin-none",
                            children: R
                        }), null != U ? (0, i.jsx)("div", {
                            className: "width-full margin-top-small padding-bottom-small",
                            children: (0, i.jsx)(eh.f, {
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
                                    }), null != D ? (0, i.jsx)("span", {
                                        className: "text-body-medium content-default",
                                        children: D
                                    }) : null]
                                })
                            })
                        }) : null, p ? (0, i.jsx)(nF, {
                            experience: p,
                            onChangeExperience: E
                        }) : (0, i.jsx)(nQ, {
                            onExperienceResolved: M,
                            isDisabled: T
                        }), l ? (0, i.jsx)(n0, {
                            value: g,
                            onChange: k,
                            isDisabled: T
                        }) : null, (0, i.jsx)(n9, {
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
        }, [en.f.Creations, en.f.Controls]);

    function it() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        (0, eg.G)({
            component: ie,
            props: e,
            options: {
                mode: "standalone"
            }
        })
    }
    let ii = () => it(),
        ia = () => {
            let {
                translate: e
            } = (0, d.A)();
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(ef.f, {
                    variant: "Emphasis",
                    size: "Large",
                    type: "button",
                    onClick: ii,
                    children: e("Action.CreateMoments")
                })
            })
        };
    var ir = e.i(357667);
    let io = e => {
            let {
                tabs: t = ej,
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
                children: t.map(e => (0, i.jsx)(ir.f, {
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
        is = () => {
            let {
                translate: e
            } = (0, d.A)(), {
                statusTab: t,
                statusTabs: n,
                setStatusTab: r
            } = nz(), o = (0, a.useMemo)(() => ({
                [eI]: e("MomentsTable.Pills.Active"),
                [eC]: e("MomentsTable.Pills.Draft"),
                [eT]: e("MomentsTable.Pills.Moderated")
            }), [e]);
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(io, {
                    groupLabel: e("MomentsTable.Header.Status"),
                    tabs: n,
                    labels: o,
                    selected: t,
                    onChange: r
                })
            })
        };
    var il = e.i(253536),
        id = e.i(418564);
    let iu = e => {
        var t, n, a;
        let {
            data: r
        } = e, {
            translate: o
        } = (0, d.A)(), s = (null == r || null == (n = r.creationAccessMetadata) ? void 0 : n.accessAllowed) === !1;
        if (!s) return null;
        let l = null != (t = null == r || null == (a = r.creationAccessMetadata) ? void 0 : a.daysToUnblock) ? t : 0,
            u = s && -1 === l;
        return (0, i.jsx)(id.f, {
            alertTitle: u ? o("Heading.PermanentlyCreationBanned") : o("Heading.TemporaryCreationBanned", {
                days: l.toString()
            }),
            alertDescription: o(u ? "Description.PermanentlyCreationBanned" : "Description.TemporaryCreationBanned"),
            severity: "warning",
            externalLink: il.P,
            linkLabel: o("Label.MarketplacePolicy"),
            allowCloseDialog: !1
        })
    };
    var ic = e.i(131385);
    let im = e => {
        var t;
        let {
            showcases: n
        } = e, {
            translate: r
        } = (0, d.A)(), [{
            activeTab: o
        }, s] = (0, et.f)(["activeTab", "filterIndex"]), {
            l1Options: l,
            activeL1Key: u,
            isLoading: c
        } = (0, ic.f)(!0), m = (0, v.Y)(o), p = (0, v.Z)(o), f = (0, a.useCallback)(e => {
            e && s({
                activeTab: (0, v.c)(e),
                filterIndex: 0
            })
        }, [s]), h = (0, a.useCallback)(() => {
            s({
                activeTab: (0, v.c)(v.X),
                filterIndex: 0
            })
        }, [s]), g = (0, a.useCallback)(() => {
            s({
                activeTab: (0, v.c)(v.w),
                filterIndex: 0
            })
        }, [s]), x = null != (t = null == n ? void 0 : n.isSelected) && t, y = null == n ? void 0 : n.onSelect, b = (0, a.useCallback)(() => {
            x || null == y || y()
        }, [x, y]), I = r("Label.Categories");
        return !c || m || x ? (0, i.jsxs)("fieldset", {
            className: "flex wrap items-center gap-small stroke-none margin-none padding-none [min-inline-size:auto]",
            "aria-label": I,
            children: [(0, i.jsx)(ir.f, {
                text: r("Label.Avatars"),
                size: "Medium",
                variant: "Standard",
                isChecked: p,
                onCheckedChange: g
            }), l.map(e => {
                var t;
                return (0, i.jsx)(ir.f, {
                    text: (0, ed.s)(e, r),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: e.taxonomyKey === u,
                    onCheckedChange: () => f(e.taxonomyKey)
                }, null != (t = e.taxonomyKey) ? t : e.nameKey)
            }), n && (0, i.jsx)(ir.f, {
                text: n.text,
                size: "Medium",
                variant: "Standard",
                isChecked: x,
                onCheckedChange: b
            }), (0, i.jsx)(ir.f, {
                text: r("Label.AllAssetTypes"),
                size: "Medium",
                variant: "Standard",
                isChecked: m,
                onCheckedChange: h
            })]
        }) : null
    };
    var ip = e.i(348558),
        ih = e.i(100226);
    let iv = e => {
            let {
                submenuItem: t,
                isSelected: n,
                onSelect: r
            } = e, {
                translate: o
            } = (0, d.A)(), s = (0, a.useCallback)(() => {
                n || r(t)
            }, [n, r, t]);
            return (0, i.jsx)(ir.f, {
                text: o(t.nameKey),
                size: "Medium",
                variant: "Standard",
                isChecked: n,
                onCheckedChange: s
            })
        },
        ig = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                group: r
            } = e, {
                translate: o
            } = (0, d.A)(), {
                menuItem: s,
                submenuItem: l
            } = t, u = (0, a.useCallback)(e => {
                n({
                    menuItem: s,
                    submenuItem: e
                })
            }, [s, n]), m = ((e, t) => {
                let n = I(),
                    i = (0, ih.f)(),
                    r = (0, ip.f)(),
                    {
                        data: o
                    } = (0, e2.f)({
                        queryKey: ["avatar-items-entry-point-asset-types"],
                        queryFn: x.X,
                        staleTime: 3e5
                    });
                return (0, a.useMemo)(() => {
                    var a, s;
                    return null != (a = null == (s = e.menuItem.submenuItems) ? void 0 : s.filter(a => y.f.isMenuItemEnabled(a, t, "Label.AvatarItems" === e.menuItem.nameKey ? null == o ? void 0 : o.has(a.type) : void 0, o, n, i, r))) ? a : []
                }, [e.menuItem.submenuItems, e.menuItem.nameKey, t, o, n, i, r])
            })(t, r), p = (0, v.k)(y.f.getAssetType(t)), f = m.find(e => e.type === c.f.Showcase), h = (0, a.useMemo)(() => f && {
                text: o(f.nameKey),
                isSelected: l === f,
                onSelect: () => u(f)
            }, [f, l, u, o]);
            return (0, i.jsx)("div", {
                className: "max-width-full max-large:padding-top-[24px]",
                children: p ? (0, i.jsx)(im, {
                    showcases: h
                }) : (0, i.jsx)("fieldset", {
                    className: "flex wrap items-center gap-small stroke-none margin-none padding-none [min-inline-size:auto]",
                    "aria-label": o(s.nameKey),
                    children: m.map(e => (0, i.jsx)(iv, {
                        submenuItem: e,
                        isSelected: l === e,
                        onSelect: u
                    }, e.type))
                })
            })
        };
    var ix = e.i(482979),
        iy = e.i(435431),
        ib = e.i(651235),
        iI = e.i(197454),
        iw = e.i(239328),
        iC = e.i(823062),
        iT = e.i(198528),
        ij = e.i(638016),
        iS = e.i(704443),
        iM = e.i(696564),
        ik = e.i(433285),
        iE = e.i(148792),
        iP = e.i(8994),
        iA = e.i(402976),
        iL = e.i(563947),
        iN = e.i(397407),
        iR = e.i(215680),
        iU = e.i(828200),
        iD = e.i(144512),
        iO = e.i(391864),
        i_ = e.i(328678),
        iz = e.i(455158),
        iq = e.i(626890),
        iV = e.i(779767),
        iF = e.i(47277),
        iB = e.i(12246),
        iG = e.i(913893),
        iH = e.i(185915);

    function iK(e) {
        if (void 0 === e.id || void 0 === e.autoPublishEnabled) throw Error("Publishing preferences response was malformed");
        return e
    }
    async function iW(e) {
        return iK(await iG.f.getPublishingPreferences(e))
    }
    async function iX(e) {
        return iK(await iG.f.createPublishingPreferences(e))
    }
    var iY = e.i(812141);
    let iJ = e => {
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
            }), (0, i.jsx)(iL.f, {})]
        })
    };

    function iQ(e) {
        return 4 === e || 2 === e
    }

    function iZ(e, t, n) {
        return e && t && "all" === n ? 1 : e && t && "specific" === n ? 4 : e && !t ? 3 : !e && t ? 2 : 0
    }
    let i$ = e => {
        var t;
        let {
            open: n,
            onClose: r
        } = e, {
            translate: o
        } = (0, d.A)(), {
            enqueue: s
        } = (0, iB.J)(), {
            user: l
        } = (0, q.f)(), u = (0, h.W)(), c = null == u ? void 0 : u.id, {
            data: m
        } = (0, iY.U)(iG.f), p = null != (t = null == m ? void 0 : m.maxCollectiblePrice) ? t : iM.N, [f, v] = (0, a.useState)(!0), [g, x] = (0, a.useState)(!1), [y, b] = (0, a.useState)(!1), [I, w] = (0, a.useState)(""), [C, T] = (0, a.useState)(""), [j, S] = (0, a.useState)(!0), [M, k] = (0, a.useState)(!0), [E, P] = (0, a.useState)(!0), [A, L] = (0, a.useState)("all"), [N, R] = (0, a.useState)(""), [U, D] = (0, a.useState)(!1);
        (0, a.useEffect)(() => {
            n && iW(c).then(e => {
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
                (null == (t = (0, iH.f)(e)) ? void 0 : t.status) !== 404 && (D(!0), s({
                    message: o("Message.ErrorProcessingRequest"),
                    autoHide: !0,
                    autoHideDuration: 3e3,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "left"
                    }
                }))
            }).finally(() => v(!1))
        }, [n, c, s, o]);
        let O = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.id) {
                    x(!0);
                    try {
                        let e = iZ(M, E, A),
                            t = iQ(e) ? N.split(",").filter(Boolean).map(e => Number(e)) : [];
                        await iX({
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
                        let e = await (0, tB.f)(t);
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
                O()
            }, [O]),
            z = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && w(t)
            }, [p]),
            V = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && T(t)
            }, [p]),
            F = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9,]/g, "").replaceAll(/,{2,}/g, ",").replace(/^,/, "").split(",").map(e => e.replace(/^0+(\d)/, "$1")).filter(e => "0" !== e).join(","),
                    n = t.split(",").filter(Boolean);
                if (!(n.length > 5)) {
                    if (5 === n.length && t.endsWith(",")) return void R(t.slice(0, -1));
                    R(t)
                }
            }, []),
            B = f || g || U || !M && !E || "" === I || "" === C || 0 >= Number(C) || iQ(iZ(M, E, A)) && 0 === N.split(",").filter(Boolean).length;
        return (0, i.jsxs)(iE.f, {
            open: n,
            onClose: r,
            maxWidth: "Medium",
            color: "primaryBrand",
            PaperProps: {
                className: "[width:580px]"
            },
            children: [(0, i.jsx)(iA.f, {
                className: "padding-bottom-none",
                children: (0, i.jsxs)("div", {
                    className: "flex justify-between items-start",
                    children: [(0, i.jsx)("span", {
                        className: "text-heading-small",
                        children: o("Heading.StudioPublishSettings")
                    }), (0, i.jsx)(iR.f, {
                        "aria-label": "Close",
                        onClick: r,
                        size: "small",
                        color: "inherit",
                        children: (0, i.jsx)(iU.f, {})
                    })]
                })
            }), (0, i.jsxs)(iP.f, {
                className: "padding-top-small",
                children: [(0, i.jsx)(iF.f, {
                    variant: "body2",
                    className: "[opacity:0.7] padding-bottom-medium",
                    children: o("Description.StudioPublishSettingsSubtitle")
                }), (0, i.jsx)(iJ, {
                    label: o("Label.Availability"),
                    children: (0, i.jsx)("span", {
                        className: "text-label-large [margin-left:12px]",
                        children: o("Label.NonLimited")
                    })
                }), (0, i.jsx)(iJ, {
                    label: o("Label.TimedOption"),
                    children: (0, i.jsx)(iz.f, {
                        checked: y,
                        onChange: () => b(e => !e),
                        "aria-label": "Timed Option"
                    })
                }), (0, i.jsx)(iJ, {
                    label: o("Label.PriceConfigurations"),
                    className: "grid [grid-template-columns:175px_1fr] padding-y-large gap-xsmall",
                    labelClassName: "padding-top-small",
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col [flex:1] gap-xsmall",
                        children: [(0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(iq.f, {
                                id: "price-offset",
                                label: "",
                                placeholder: o("Placeholder.AmountAbovePriceFloor"),
                                variant: "outlined",
                                size: "small",
                                value: I,
                                onChange: z,
                                fullWidth: !0
                            }), (0, i.jsx)(iV.f, {
                                title: o("Tooltip.AmountAbovePriceFloor"),
                                children: (0, i.jsx)(iR.f, {
                                    "aria-label": "price offset info",
                                    size: "small",
                                    children: (0, i.jsx)(iD.f, {})
                                })
                            })]
                        }), (0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(iq.f, {
                                id: "price-floor-minimum",
                                label: "",
                                placeholder: o("Placeholder.DoNotPriceBelow"),
                                variant: "outlined",
                                size: "small",
                                value: C,
                                onChange: V,
                                fullWidth: !0
                            }), (0, i.jsx)(iV.f, {
                                title: o("Tooltip.MinimumPriceFloor"),
                                children: (0, i.jsx)(iR.f, {
                                    "aria-label": "minimum price info",
                                    size: "small",
                                    children: (0, i.jsx)(iD.f, {})
                                })
                            })]
                        })]
                    })
                }), (0, i.jsx)(iJ, {
                    label: o("Label.RegionalPricing"),
                    children: (0, i.jsx)(iz.f, {
                        checked: j,
                        onChange: () => S(e => !e),
                        "aria-label": "Regional Pricing"
                    })
                }), (0, i.jsx)(iJ, {
                    label: o("Label.SellInMarketplace"),
                    children: (0, i.jsx)(iz.f, {
                        checked: M,
                        onChange: () => {
                            let e = !M;
                            e || L("specific"), k(e)
                        },
                        "aria-label": "Sell in Marketplace"
                    })
                }), (0, i.jsx)(iJ, {
                    label: o("Label.SellInExperiences"),
                    children: (0, i.jsx)(iz.f, {
                        checked: E,
                        onChange: () => P(e => !e),
                        "aria-label": "Sell in experiences"
                    })
                }), E && (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(iL.f, {}), (0, i.jsxs)("div", {
                        className: "padding-y-large",
                        children: [(0, i.jsxs)("div", {
                            className: "grid [grid-template-columns:175px_1fr] items-center",
                            children: [(0, i.jsx)("span", {
                                className: "text-label-large",
                                children: o("Label.ExperienceLocations")
                            }), (0, i.jsxs)(i_.f, {
                                row: !0,
                                value: A,
                                onChange: e => {
                                    let t = e.target.value;
                                    ("all" === t || "specific" === t) && L(t)
                                },
                                className: "flex flex-row no-wrap gap-xsmall [margin-left:12px]",
                                children: [(0, i.jsx)(iN.f, {
                                    value: "all",
                                    disabled: !M,
                                    control: (0, i.jsx)(iO.f, {
                                        "aria-label": o("Label.AllGames"),
                                        size: "small"
                                    }),
                                    label: o("Label.AllGames"),
                                    className: "margin-right-medium"
                                }), (0, i.jsx)(iN.f, {
                                    value: "specific",
                                    control: (0, i.jsx)(iO.f, {
                                        "aria-label": o("Label.SpecificExperiences"),
                                        size: "small"
                                    }),
                                    label: o("Label.SpecificExperiences")
                                })]
                            })]
                        }), "specific" === A && (0, i.jsxs)("div", {
                            className: "[margin-left:187px] [margin-top:10px]",
                            children: [(0, i.jsx)(iq.f, {
                                id: "place-ids",
                                label: "",
                                placeholder: o("Placeholder.EnterExperienceIDs"),
                                variant: "outlined",
                                size: "small",
                                value: N,
                                onChange: F,
                                fullWidth: !0
                            }), (0, i.jsxs)(iF.f, {
                                variant: "caption",
                                className: "[opacity:0.6] block [margin-top:4px]",
                                children: [N ? N.split(",").filter(Boolean).length : 0, "/", 5, " ", o("Label.ExperiencesCount")]
                            })]
                        })]
                    })]
                })]
            }), (0, i.jsxs)("div", {
                className: "flex padding-x-large padding-y-medium gap-small",
                children: [(0, i.jsx)(ik.f, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: _,
                    disabled: B,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: o("Action.Save")
                }), (0, i.jsx)(ik.f, {
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
    var i0 = e.i(356936),
        i1 = e.i(67243),
        i2 = e.i(759283),
        i4 = e.i(776344);
    let i5 = (e, t) => {
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
    var i3 = e.i(147325),
        i7 = e.i(47252),
        i8 = e.i(418162);
    let i6 = (0, i1.f)()(e => ({
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
        i9 = ["makeup", "clothing", "accessories"],
        ae = ["clothing", "makeup"],
        at = {
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

    function an(e) {
        return e ? at.clothing.all : "Label.ClothingOnlyTShirtsPantsSweaters"
    }
    let ai = (0, d.K)(e => {
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
            } = i6(),
            {
                enqueue: m,
                close: p
            } = (0, iB.J)(),
            f = (0, h.W)(),
            v = !1 !== o.showCategorySubtypeDropdowns,
            g = (0, a.useMemo)(() => v ? i9 : ae, [v]),
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
                    await iG.f.bulkUpdateCollectible(V.L.generateRandomUuid(), null == f ? void 0 : f.id, e.map(e => (0, i8.k)(e)), "enable" === S), m({
                        message: l("Message.TimedOptionSettingsApplied"),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: i2.A,
                        autoHide: !0,
                        onClose: p
                    }), window.location.reload(), r()
                } catch (e) {
                    m({
                        message: l(i5(await (0, tB.f)(e), "Error.Unknown")),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: i2.A,
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
                if (n.length === t.length) return l("clothing" === e ? an(v) : at[e].all);
                let i = l(at[e].short),
                    a = n.map(e => l(i2.M[e])).join(", ");
                return "".concat(i, " (").concat(a, ")")
            }).filter(e => null !== e), [b, k, E, v, l, g]),
            D = (0, a.useMemo)(() => g.some(e => E[e] && k[e].some(e => b[e])), [b, k, E, g]),
            O = (0, i.jsxs)(i.Fragment, {
                children: [(0, i.jsx)(i0.f, {
                    className: u.descriptionText,
                    children: l("Description.BulkUpdateAllTimedOptions")
                }), (0, i.jsx)(i4.U, {
                    flexDirection: "column",
                    classes: {
                        root: u.checkboxList
                    },
                    children: g.map(e => (e => {
                        let t = k[e];
                        if (!E[e]) return null;
                        let n = x[e],
                            r = "timed-options-bulk-".concat(e, "-subtypes"),
                            o = l("clothing" === e ? an(v) : at[e].all);
                        return (0, i.jsxs)(a.default.Fragment, {
                            children: [(0, i.jsxs)("div", {
                                className: u.categoryRow,
                                children: [v ? (0, i.jsx)(iR.f, {
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
                            }), v && n ? (0, i.jsx)("div", {
                                id: r,
                                className: u.subtypeIndent,
                                children: t.map(e => (0, i.jsx)(i3.f, {
                                    label: l(i2.M[e]),
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
                }), (0, i.jsxs)(i4.U, {
                    flexDirection: "row",
                    classes: {
                        root: u.buttonContainer
                    },
                    children: [(0, i.jsx)(ik.f, {
                        variant: "contained",
                        color: "secondary",
                        onClick: A,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !D,
                        children: l("Action.Enable")
                    }), (0, i.jsx)(ik.f, {
                        variant: "contained",
                        color: "secondary",
                        onClick: L,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !D,
                        children: l("Action.Disable")
                    })]
                })]
            });
        return T && (t = "enable" === S ? "Description.ThisWillEnableTimedOptionsFor" : "Description.ThisWillDisableTimedOptionsFor", O = (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(i0.f, {
                className: u.descriptionText,
                children: l(t)
            }), U.length > 0 && (0, i.jsx)("ul", {
                className: u.bulletList,
                children: U.map(e => (0, i.jsx)("li", {
                    children: e
                }, e))
            }), (0, i.jsx)(i0.f, {
                className: u.descriptionText,
                children: l("Description.ThisWillAlsoReplaceAnyItemLevelSettings")
            }), (0, i.jsxs)(i4.U, {
                flexDirection: "row",
                classes: {
                    root: u.buttonContainer
                },
                children: [(0, i.jsx)(ik.f, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: N,
                    size: "medium",
                    className: u.actionButton,
                    children: l("Action.Confirm")
                }), (0, i.jsx)(ik.f, {
                    variant: "contained",
                    color: "secondary",
                    onClick: R,
                    size: "medium",
                    className: u.actionButton,
                    children: l("Action.Cancel")
                })]
            })]
        })), (0, i.jsxs)(iE.f, {
            open: n,
            onClose: P,
            maxWidth: "Small",
            color: "primaryBrand",
            classes: {
                paper: u.dialogPaper
            },
            children: [(0, i.jsxs)(iA.f, {
                className: u.dialogTitle,
                children: [(0, i.jsx)("span", {
                    className: u.dialogTitleText,
                    children: T ? l("Title.ConfirmOption") : l("Action.TimedOptions")
                }), !T && (0, i.jsx)(iR.f, {
                    "aria-label": "Close",
                    onClick: P,
                    size: "small",
                    className: u.closeButton,
                    color: "inherit",
                    children: (0, i.jsx)(iU.f, {})
                })]
            }), (0, i.jsx)(iP.f, {
                className: u.dialogContent,
                children: O
            })]
        })
    }, [en.f.ConfigureItem, en.f.Creations, en.f.AssetTypes]);

    function aa(e) {
        return "Tshirt" === e ? c.f.TShirt : "TshirtAccessory" === e ? c.f.TShirtAccessory : e
    }
    let ar = (0, i1.f)()(e => ({
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
        ao = (0, d.K)(e => {
            let t, n, r, o, {
                    open: s,
                    onClose: l
                } = e,
                {
                    translate: u,
                    translateHTML: m
                } = (0, d.A)(),
                {
                    classes: p
                } = ar(),
                {
                    enqueue: f,
                    close: v
                } = (0, iB.J)(),
                g = (0, h.W)(),
                [x, y] = (0, a.useState)(null),
                [b, I] = (0, a.useState)(() => V.L.generateRandomUuid()),
                [w, C] = (0, a.useState)({
                    showClothing: !1,
                    showMakeup: !1,
                    showAccessories: !1,
                    showCategorySubtypeDropdowns: !0
                }),
                [T, j] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                s ? (y(null), I(V.L.generateRandomUuid()), (0, iM.l)().then(() => {
                    let e = new Set(iM.v.map(e => aa(e))),
                        t = 3 === e.size && Array.from(es.X).every(t => e.has(t));
                    if (j(t), t) C({
                        showClothing: !1,
                        showMakeup: !1,
                        showAccessories: !1,
                        showCategorySubtypeDropdowns: !0
                    });
                    else {
                        let t = [...e].every(e => es.X.has(e) || es.n.includes(e)),
                            n = e.has(c.f.EyeMakeup),
                            i = es.o.some(t => e.has(t) && !es.X.has(t)),
                            a = Array.from(es.X).some(t => e.has(t));
                        C({
                            showClothing: i || a,
                            showMakeup: n,
                            showAccessories: e.has(c.f.Hat),
                            showCategorySubtypeDropdowns: !t
                        })
                    }
                })) : I(V.L.generateRandomUuid())
            }, [s]);
            let S = (0, a.useCallback)(async () => {
                    try {
                        await iG.f.bulkUpdateCollectible(b, null == g ? void 0 : g.id, [64, 66, 68], !0 === x), f({
                            message: u("Message.TimedOptionSettingsApplied"),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: i2.A,
                            autoHide: !0,
                            onClose: v
                        }), window.location.reload(), l()
                    } catch (e) {
                        f({
                            message: u(i5(await (0, tB.f)(e), "Error.Unknown")),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: i2.A,
                            autoHide: !0,
                            onClose: v
                        })
                    }
                }, [f, v, u, l, b, null == g ? void 0 : g.id, x]),
                M = (0, a.useCallback)(() => {
                    l()
                }, [l]),
                k = !T,
                E = k ? (t = new Set(iM.v.map(e => aa(e))), n = es.o.some(e => t.has(e) && !es.X.has(e)), r = Array.from(es.X).some(e => t.has(e)), o = w.showCategorySubtypeDropdowns && (!r || n) ? es.o.filter(e => t.has(e)) : Array.from(es.X).filter(e => t.has(e)), {
                    clothing: o,
                    makeup: es.n.filter(e => t.has(e)),
                    accessories: w.showCategorySubtypeDropdowns ? es.U.filter(e => t.has(e)) : []
                }) : void 0;
            return k ? (0, i.jsx)(ai, {
                open: s,
                onClose: M,
                categoryFlags: w,
                assetTypesByCategory: E
            }) : (0, i.jsxs)(iE.f, {
                open: s,
                onClose: M,
                maxWidth: "Small",
                color: "primaryBrand",
                children: [(0, i.jsxs)(iA.f, {
                    className: p.dialogTitle,
                    children: [(0, i.jsx)("span", {
                        children: null === x ? u("Action.TimedOptions") : u("Action.Confirm")
                    }), (0, i.jsx)(iR.f, {
                        "aria-label": "Close",
                        onClick: M,
                        size: "small",
                        className: p.closeButton,
                        color: "inherit",
                        children: (0, i.jsx)(iU.f, {})
                    })]
                }), (0, i.jsx)(iP.f, {
                    className: p.dialogContent,
                    children: null === x ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(i0.f, {
                            className: p.descriptionText,
                            children: u("Description.BulkUpdateTimedOptions")
                        }), (0, i.jsxs)(i4.U, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(ik.f, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    y(!0)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.TurnAllOn")
                            }), (0, i.jsx)(ik.f, {
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
                        children: [(0, i.jsx)(i0.f, {
                            className: p.descriptionText,
                            children: x ? m("Description.BulkUpdateOnConfirmation", [{
                                opening: "boldStart",
                                closing: "boldEnd",
                                content: e => (0, i.jsx)("strong", {
                                    children: e
                                })
                            }]) : m("Description.BulkUpdateOffConfirmation", [{
                                opening: "boldStart",
                                closing: "boldEnd",
                                content: e => (0, i.jsx)("strong", {
                                    children: e
                                })
                            }])
                        }), (0, i.jsxs)(i4.U, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(ik.f, {
                                variant: "contained",
                                color: "primaryBrand",
                                onClick: S,
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.Confirm")
                            }), (0, i.jsx)(ik.f, {
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
        }, [en.f.ConfigureItem, en.f.Creations]),
        as = Object.values(X.V),
        al = Object.values(ix.W),
        ad = ["publishSettings"],
        au = e => {
            let {
                menuState: t
            } = e, {
                translate: n
            } = (0, d.A)(), {
                unifiedLogger: r
            } = (0, iC.X)(), {
                ready: o,
                value: s
            } = (0, l.f)(iw.D), {
                isFetched: u
            } = (0, h._)(), [m, p] = (0, a.useState)(!1), [f, g] = (0, a.useState)(!1), [b, I] = (0, a.useState)(0), [w, C] = (0, a.useState)(!1), [T, j] = (0, a.useState)(!1), [S, M] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                (0, iM.l)().then(() => {
                    j(!0)
                })
            }, []);
            let {
                sort: E,
                setSort: P,
                sortOrder: A,
                setSortOrder: L,
                isArchived: N,
                setIsArchived: R,
                isAgeRestrictedCollaboration: U,
                setIsAgeRestrictedCollaboration: D,
                isPublicOnly: O,
                setIsPublicOnly: _,
                isOnMarketplace: q,
                setIsOnMarketplace: F
            } = (0, ep.f)(), [{
                filterIndex: B,
                publishSettings: G
            }] = (0, et.f)(["filterIndex", "publishSettings"]), H = (0, a.useContext)(z).isResolving, [, K] = (0, et.f)(ad), W = (0, a.useMemo)(() => {
                let e = y.f.getAssetType(t);
                return e !== c.f.AllCatalogAsset || Number(B) > 0 ? e : v.K
            }, [t, B]), Y = (0, v.k)(y.f.getAssetType(t)), J = Y && s, Q = (0, iT.j)(G), Z = !!J && u && !H && !w && ("true" === Q || "1" === Q);
            (0, a.useEffect)(() => {
                o && u && !H && void 0 !== Q && (Z || K({
                    publishSettings: null
                }, {
                    skipHistory: !0
                }))
            }, [o, H, u, Z, Q, K]);
            let $ = (0, a.useCallback)(() => {
                    g(!1), Z && (C(!0), K({
                        publishSettings: null
                    }, {
                        skipHistory: !0
                    }))
                }, [Z, K]),
                {
                    isTaxonomyView: ee,
                    isAvatarLooksView: en
                } = (0, ij.f)(),
                {
                    selection: ei
                } = (0, ic.f)(ee),
                ea = en || (null == ei ? void 0 : ei.lookType) !== void 0,
                {
                    isSortable: er,
                    isArchivable: eo
                } = (0, a.useMemo)(() => ({
                    isSortable: y.f.isAssetTypeSortable(W),
                    isArchivable: !ea && (y.f.isAssetTypeArchivable(W) || y.f.isAssetTypeDirectlyArchivable(W))
                }), [W, ea]),
                es = eo || Y;
            (0, a.useEffect)(() => {
                Y && !eo && N && R(!1)
            }, [Y, eo, N, R]);
            let el = !er && !es && W !== c.f.MyExperiences && W !== c.f.SharedExperiences,
                ed = (0, a.useCallback)(e => {
                    if (W === c.f.MyExperiences || W === c.f.SharedExperiences) as.includes(e) && P(t => ({
                        ...t,
                        [c.f.Place]: e
                    }));
                    else al.includes(e) && P(t => ({
                        ...t,
                        [W]: e
                    }))
                }, [P, W]),
                eu = (0, a.useCallback)(() => {
                    L(e => e === V.f.Asc ? V.f.Desc : V.f.Asc)
                }, [L]),
                ec = (0, a.useCallback)(() => {
                    p(!0)
                }, []),
                em = (0, a.useCallback)(() => {
                    let e = !U;
                    r.logClickEvent({
                        eventName: tG.f.ImpactedExperiencesFilterClick,
                        parameters: {
                            page: "creations",
                            action: e ? "enable" : "disable",
                            assetType: W.toString()
                        }
                    }), D(e => !e)
                }, [r, U, W, D]),
                ef = W === c.f.MyExperiences || W === c.f.SharedExperiences,
                eh = (0, a.useMemo)(() => ef ? Object.values(X.V).map(e => ({
                    value: e,
                    labelKey: x.s[e]
                })) : Object.values(ix.W).map(e => ({
                    value: e,
                    labelKey: x.R[e]
                })), [ef]),
                ev = (0, a.useMemo)(() => ef ? E[c.f.Place] : (0, iS.f)(W, E), [ef, E, W]),
                eg = Y && T && (iM.v.length > 0 || iM.U.length > 0);
            if (el) return null;
            let ex = W === c.f.MyExperiences || W === c.f.SharedExperiences || es || W === c.f.MeshPart,
                ey = W === c.f.MyExperiences || W === c.f.SharedExperiences,
                eb = W === c.f.Decal || W === c.f.MeshPart,
                eI = !!J || eg,
                ew = !eI && !!(W === c.f.MyExperiences || ey || es && W);
            return (0, i.jsxs)("div", {
                className: "flex flex-row justify-start items-center gap-large [flex-wrap:wrap] padding-left-medium max-large:[flex-grow:1] max-large:justify-between",
                children: [ex && (0, i.jsxs)("div", {
                    className: "flex flex-row items-center gap-medium",
                    children: [ew && (0, i.jsx)("span", {
                        className: "text-body-large margin-right-[16px]",
                        children: n("Label.ShowPrefix")
                    }), W === c.f.MyExperiences && (0, i.jsx)(iI.f, {
                        size: "Large",
                        placement: "Start",
                        label: n("Label.Public"),
                        isChecked: O,
                        onCheckedChange: () => _(e => !e)
                    }), ey && (0, i.jsx)(iI.f, {
                        size: "Large",
                        placement: "Start",
                        label: n("Label.Impacted"),
                        isChecked: U,
                        onCheckedChange: em
                    }), es && W && (0, i.jsx)(iI.f, {
                        size: "Large",
                        placement: "Start",
                        label: J ? n("Action.ShowArchived") : n("Label.Archived"),
                        isChecked: eo && N,
                        isDisabled: !eo,
                        onCheckedChange: () => R(e => !e)
                    }), eI && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)("span", {
                            className: "flex [height:20px] margin-x-[12px]",
                            children: (0, i.jsx)(iy.f, {
                                orientation: "vertical"
                            })
                        }), (0, i.jsxs)(ib.V, {
                            open: S,
                            onOpenChange: M,
                            children: [(0, i.jsx)(ib.J, {
                                asChild: !0,
                                children: (0, i.jsx)(k.f, {
                                    as: "button",
                                    icon: "icon-filled-gear",
                                    size: "Medium",
                                    variant: "Utility",
                                    isCircular: !0,
                                    ariaLabel: n("Label.Settings")
                                })
                            }), (0, i.jsx)(ib.T, {
                                side: "bottom",
                                align: "end",
                                ariaLabel: n("Label.Settings"),
                                children: (0, i.jsx)(n$.k, {
                                    size: "Medium",
                                    children: (0, i.jsxs)(n$.T, {
                                        children: [eg && (0, i.jsx)(n$.d, {
                                            value: "timed-options",
                                            title: n("Action.TimedOptions"),
                                            onSelect: () => {
                                                M(!1), ec()
                                            }
                                        }), J && (0, i.jsx)(n$.d, {
                                            value: "publish-settings",
                                            title: n("Action.StudioPublishSettings"),
                                            onSelect: () => {
                                                M(!1), I(e => e + 1), g(!0)
                                            }
                                        })]
                                    })
                                })
                            })]
                        })]
                    }), eb && (0, i.jsx)(iI.f, {
                        size: "Large",
                        placement: "Start",
                        label: n("Label.OnCreatorStore"),
                        isChecked: q,
                        onCheckedChange: () => F(e => !e)
                    })]
                }), er && (0, i.jsxs)("div", {
                    className: "flex flex-row items-center gap-xsmall [flex-wrap:nowrap]",
                    children: [(0, i.jsx)(nZ.x, {
                        size: "Medium",
                        ariaLabel: n("Label.SortBy"),
                        placeholder: n("Label.SortBy"),
                        value: ev,
                        onValueChange: ed,
                        children: (0, i.jsx)(n$.k, {
                            children: eh.map(e => (0, i.jsx)(n$.d, {
                                value: e.value,
                                title: n("Label.SortByOption", {
                                    sortOption: n(e.labelKey)
                                })
                            }, e.value))
                        })
                    }), (0, i.jsx)(k.f, {
                        as: "button",
                        size: "Medium",
                        variant: "Utility",
                        icon: A === V.f.Asc ? "icon-regular-arrow-wide-up" : "icon-regular-arrow-wide-down",
                        ariaLabel: n("Heading.SortOrder"),
                        onClick: eu
                    })]
                }), (0, i.jsx)(ao, {
                    open: m,
                    onClose: () => p(!1)
                }), (0, i.jsx)(i$, {
                    open: f || Z,
                    onClose: $
                }, b)]
            })
        },
        ac = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                verificationMetadata: a,
                group: r
            } = e, o = [c.f.UpcomingEvent, c.f.PastEvent, c.f.DraftEvent], s = !!t.submenuItem && o.includes(t.submenuItem.type);
            return (0, i.jsxs)("div", {
                className: "flex justify-between padding-top-small",
                children: [t.menuItem.type === c.f.TShirt && (0, i.jsx)(iu, {
                    data: a
                }), !s && (0, i.jsx)("div", {
                    className: "flex width-full padding-bottom-large [align-content:flex-start] [row-gap:12px] justify-between flex-row items-center wrap",
                    children: t.menuItem.type === c.f.Moments ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(is, {}), (0, i.jsx)(ia, {})]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [t.submenuItem && (0, i.jsx)(ig, {
                            menuState: t,
                            onMenuStateChange: n,
                            group: r
                        }), (0, i.jsx)(au, {
                            menuState: t
                        })]
                    })
                })]
            })
        };
    var am = e.i(396875),
        ap = e.i(83560),
        af = e.i(576069),
        ah = e.i(134817);
    let av = [],
        ag = new Date(0).toISOString(),
        ax = e => e.startsWith("Label.AbuseType."),
        ay = e => {
            var t, n;
            return {
                momentId: e.uid,
                description: null != (t = e.description) ? t : "",
                experienceName: "",
                modifiedAt: null != (n = e.uploadedAt) ? n : ag,
                status: eT,
                moderation: {
                    violationUid: e.uid,
                    abuseTypeLabelKeys: e.abuseTypeLabelKeys,
                    ...null != e.uploadedAt ? {
                        uploadedAt: e.uploadedAt
                    } : {}
                }
            }
        };

    function ab(e) {
        return null != e.universeId ? e.universeId : "experienceId" in e && "number" == typeof e.experienceId ? e.experienceId : void 0
    }
    var aI = e.i(369431),
        aw = e.i(507191);
    let aC = (e, t) => {
            let {
                user: n
            } = (0, q.f)(), {
                enabled: i,
                thumbnailUrl: r,
                videoUrl: o
            } = t, s = null == n ? void 0 : n.id, l = (0, a.useMemo)(() => r || o ? {
                thumbnailUrl: null != r ? r : "",
                videoUrl: null != o ? o : ""
            } : null, [r, o]), [d, u] = (0, a.useState)(null);
            return ((0, a.useEffect)(() => {
                if (l || null == s || !i || null == e || "" === e) return;
                let t = !1;
                return (async () => {
                    let n = {
                        draftId: e,
                        userId: s
                    };
                    t0(tK.LoadLocalVideoMedia, n);
                    try {
                        let i = await eq(s, e);
                        t || (u(i), null != i && t1(tK.LoadLocalVideoMedia, n))
                    } catch (n) {
                        tQ(tK.LoadLocalVideoMedia, n, {
                            draftId: e
                        }), t || u(null)
                    }
                })(), () => {
                    t = !0
                }
            }, [e, i, l, s]), l) ? l : i ? d : null
        },
        aT = "block width-full height-full max-w-full max-h-full object-contain",
        aj = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)("div", {
                className: "flex items-center justify-center radius-medium bg-surface-200 width-full shrink-0 overflow-hidden h-[240px]",
                "data-testid": "moments-video-preview-container",
                children: t
            })
        },
        aS = e => {
            let {
                thumbnailUrl: t,
                videoUrl: n
            } = e;
            return n ? (0, i.jsx)(aj, {
                children: (0, i.jsx)("video", {
                    "aria-label": "Moment video preview",
                    className: "radius-medium ".concat(aT),
                    controls: !0,
                    playsInline: !0,
                    poster: t,
                    src: n,
                    children: (0, i.jsx)("track", {
                        kind: "captions"
                    })
                })
            }) : t ? (0, i.jsx)(aj, {
                children: (0, i.jsx)("img", {
                    alt: "Moment thumbnail preview",
                    className: "radius-medium ".concat(aT),
                    src: t
                })
            }) : (0, i.jsx)(aj, {})
        },
        aM = (0, d.K)(e => {
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
            } = (0, d.z)(), x = nR(), y = t3(g), [b, I] = (0, a.useState)(() => {
                var e, t, n, i;
                let a;
                return o && ((a = {
                    id: null != (i = ab(n = o)) ? i : 0,
                    name: n.experienceName
                }).id > 0 || (null != (e = null == (t = a.name) ? void 0 : t.length) ? e : 0) > 0) ? a : void 0
            }), [w, C] = (0, a.useState)(() => {
                var e;
                return null != (e = null == o ? void 0 : o.description) ? e : ""
            }), [T, j] = (0, a.useState)(), S = null != (t = null != T ? T : null == o ? void 0 : o.locale) ? t : y, M = (null == o ? void 0 : o.status) === eC && !0 === o.hasLocalVideo, k = aC((null == o ? void 0 : o.status) === eC ? o.draftId : null, {
                enabled: s && M,
                thumbnailUrl: null == o ? void 0 : o.thumbnailUrl,
                videoUrl: null == o ? void 0 : o.videoUrl
            }), E = (0, a.useCallback)(() => {
                o && !h && null == p && (null == c || c(o))
            }, [h, o, c, p]), P = (0, a.useCallback)(() => {
                o && f !== nU(o) && (null == m || m(o))
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
            }, [R]), D = (0, a.useCallback)(e => {
                e || R(), l(e)
            }, [R, l]);
            if (!o) return null;
            let O = nU(o),
                _ = null != p && p === O,
                z = null != p,
                q = null != f && f === O,
                V = o.status === eI,
                F = o.status === eC,
                B = F && !_,
                G = !V && null != c && (F && M || _),
                H = null != m,
                K = w.length >= 140;
            return (0, i.jsx)(aI.q, {
                open: s,
                onOpenChange: D,
                children: (0, i.jsxs)(aI.U, {
                    closeLabel: v("Action.Close"),
                    largeScreenVariant: "side",
                    children: [(0, i.jsx)(aI.L, {
                        children: v("Heading.EditMoment")
                    }), (0, i.jsxs)(aI.O, {
                        className: "flex flex-col gap-y-medium padding-top-small padding-bottom-large",
                        children: [(0, i.jsx)(aS, {
                            thumbnailUrl: null != (n = null == k ? void 0 : k.thumbnailUrl) ? n : o.thumbnailUrl,
                            videoUrl: null != (r = null == k ? void 0 : k.videoUrl) ? r : o.videoUrl
                        }), B ? (0, i.jsx)(i.Fragment, {
                            children: b ? (0, i.jsx)(nF, {
                                experience: b,
                                onChangeExperience: () => I(void 0)
                            }) : (0, i.jsx)(nQ, {
                                onExperienceResolved: A
                            })
                        }) : b ? (0, i.jsxs)("div", {
                            className: "flex flex-col gap-y-xsmall width-full margin-top-small",
                            children: [(0, i.jsx)("span", {
                                className: "text-body-small content-muted",
                                children: v("CreateMomentModal.ExperienceInput.Label")
                            }), (0, i.jsx)(nF, {
                                experience: b,
                                hideTitle: !0
                            })]
                        }) : null, x ? (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: B ? (0, i.jsx)(n0, {
                                value: S,
                                onChange: N,
                                isDisabled: _
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: v("CreateMomentModal.LanguageInput.Label")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-content-language-readonly",
                                    children: t7(o.locale)
                                })]
                            })
                        }) : null, (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: B ? (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)(aw.f, {
                                    id: "edit-moment-description-".concat(O),
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
                    }), (0, i.jsx)(aI.$, {
                        className: "width-full",
                        children: (0, i.jsxs)("div", {
                            className: "flex gap-small width-full",
                            children: [G ? (0, i.jsx)(ef.f, {
                                variant: "Emphasis",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: h || z,
                                isLoading: _,
                                onClick: E,
                                children: v("Action.Publish")
                            }) : null, H ? (0, i.jsx)(ef.f, {
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
        }, [en.f.Creations, en.f.Controls]);
    var ak = e.i(882057),
        aE = e.i(493924);
    let aP = e => {
        let {
            onCreateClick: t
        } = e, {
            translate: n
        } = (0, d.A)();
        return (0, i.jsx)(aE.U, {
            title: n("Heading.ReachPlayersDirectlyInMoments"),
            size: "large",
            illustration: "videos",
            description: (0, i.jsxs)(i.Fragment, {
                children: [n("Description.UploadExternalVideosToMoments"), " ", (0, i.jsx)(ak.f, {
                    "aria-label": n("Label.LearnMore"),
                    href: il.T,
                    target: "_blank",
                    rel: "noopener noreferrer",
                    variant: "Inline",
                    underline: "always",
                    isExternal: !1,
                    children: n("Label.LearnMore")
                })]
            }),
            children: (0, i.jsx)(ef.f, {
                variant: "Emphasis",
                size: "Large",
                type: "button",
                onClick: t,
                children: n("Action.CreateMoments")
            })
        })
    };
    var aA = e.i(260022),
        aL = e.i(402467),
        aN = e.i(134321),
        aR = e.i(125677),
        aU = e.i(20227),
        aD = e.i(494601);
    let aO = "text/plain",
        a_ = async e => {
            if ("u" < typeof ClipboardItem || "function" != typeof navigator.clipboard.write) return e.then(e => navigator.clipboard.writeText(e));
            let t = e.then(e => new Blob([e], {
                type: aO
            }));
            return t.catch(() => {}), navigator.clipboard.write([new ClipboardItem({
                [aO]: t
            })])
        }, az = e => {
            let {
                moment: t
            } = e, n = (() => {
                let {
                    ready: e,
                    value: t
                } = (0, l.f)(b.s);
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
                } = (0, e1.f)({
                    mutationFn: e => nL.createStaticLink(e)
                });
                return {
                    createMomentShareLink: (0, a.useCallback)(t => e(t), [e]),
                    isCreatingMomentShareLink: t
                }
            }(), u = (0, a.useRef)(!1), c = r("Action.CopyMomentLink"), m = r("Message.MomentLinkCopied"), p = r("Message.MomentLinkCopyFailed"), f = (0, a.useCallback)(async () => {
                if (u.current || t.status !== eI || !t.feedItemId) return;
                u.current = !0;
                let e = {
                    momentId: t.momentId,
                    feedItemId: t.feedItemId
                };
                t0(tK.CopyShareLink, e);
                try {
                    if (!("clipboard" in navigator)) throw Error("Clipboard API is unavailable");
                    let n = o({
                        momentId: t.momentId,
                        feedItemId: t.feedItemId
                    });
                    await Promise.all([n, a_(n)]), t1(tK.CopyShareLink, e), (0, ap.c)({
                        title: m
                    })
                } catch (t) {
                    tQ(tK.CopyShareLink, t, e), (0, ap.c)({
                        title: p
                    })
                } finally {
                    u.current = !1
                }
            }, [o, m, p, t]);
            return n && t.status === eI && t.feedItemId ? (0, i.jsx)(aN.W, {
                position: "top-center",
                title: c,
                children: (0, i.jsx)(aN.y, {
                    asChild: !0,
                    children: (0, i.jsx)(k.f, {
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
        }, aq = {
            [eI]: "bg-system-success",
            [ew]: "bg-system-warning",
            [eC]: "bg-surface-300",
            [eT]: "bg-system-alert"
        }, aV = e => {
            let {
                status: t,
                label: n
            } = e;
            return (0, i.jsxs)("span", {
                className: "inline-flex items-center gap-xsmall",
                children: [(0, i.jsx)("span", {
                    "aria-hidden": !0,
                    className: "size-[8px] radius-circle shrink-0 ".concat(aq[t]),
                    "data-testid": "moment-status-dot-".concat(t)
                }), (0, i.jsx)("span", {
                    children: n
                })]
            })
        };
    var aF = e.i(458451),
        aB = e.i(218701),
        aG = e.i(363717);
    let aH = (0, d.K)(e => {
            let t, {
                    moment: n
                } = e,
                {
                    translate: r
                } = (0, d.A)(),
                {
                    user: o
                } = (0, aF.s)(),
                s = n.status === eC,
                l = s && !0 === n.hasLocalVideo,
                u = aC(s ? n.draftId : null, {
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
                children: (0, i.jsx)(aB.x, {
                    alt: "",
                    containerClass: "block",
                    imgClassName: "[object-fit:cover]",
                    returnPolicy: aB.X.PlaceHolder,
                    targetId: c,
                    type: aB.V.assetThumbnail
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
                children: (0, i.jsx)(aG.g, {
                    cmcdInstanceType: aG.Q.CreatorDashboard,
                    cmcdUserId: null == o ? void 0 : o.id,
                    videoAssetId: String(c),
                    environment: "production",
                    src: void 0,
                    autoPlay: !0,
                    disableControls: !0,
                    loop: !0,
                    muted: !0
                })
            })), h) ? (0, i.jsxs)(ib.V, {
                open: m,
                onOpenChange: p,
                children: [(0, i.jsx)(ib.r, {
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
                }), (0, i.jsx)(ib.T, {
                    align: "start",
                    ariaLabel: f,
                    className: "outline-none",
                    side: "bottom",
                    children: x
                })]
            }) : t
        }, [en.f.Creations]),
        aK = [10, 25, 50],
        aW = {
            [eI]: "MomentsTable.NoActiveMoments",
            [eC]: "MomentsTable.NoDraftMoments",
            [eT]: "MomentsTable.NoModeratedMoments"
        },
        aX = e => {
            let {
                moment: t,
                disabled: n,
                onBlur: r
            } = e, {
                translate: o
            } = (0, d.A)(), s = nU(t), [l, u] = (0, a.useState)(t.description), c = l.length >= 140, m = (0, a.useCallback)(e => {
                u(e.target.value)
            }, []), p = (0, a.useCallback)(e => {
                r(t, e)
            }, [t, r]);
            return (0, i.jsxs)("div", {
                className: "flex width-full flex-col gap-y-xsmall",
                children: [(0, i.jsx)(nB.f, {
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
        aY = e => {
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
                I = nU(n),
                w = n.status === eC,
                C = n.status === eT ? n.moderation : void 0,
                T = (0, a.useCallback)(() => {
                    h(n)
                }, [n, h]),
                j = (0, a.useCallback)(() => {
                    n.status === eC && (null == g || g(n.draftId))
                }, [n, g]),
                S = (0, a.useMemo)(() => {
                    var e;
                    if (!c) return null;
                    let t = (null != (e = null == C ? void 0 : C.abuseTypeLabelKeys) ? e : []).filter(ax);
                    return (t.length > 0 ? t : ["Label.AbuseType.Other"]).map(e => y(en.f.NotApproved, e)).join(", ")
                }, [C, c, y]),
                M = null != C ? (t = C.violationUid, p ? "".concat(p, "#/v/").concat(encodeURIComponent(t)) : null) : null,
                E = (0, i.jsx)(aL.d, {
                    children: (0, i.jsx)(aV, {
                        label: f,
                        status: n.status
                    })
                });
            return (0, i.jsxs)(aL.N, {
                isHoverable: !0,
                "data-testid": "moment-row-".concat(I),
                children: [(0, i.jsx)(aL.d, {
                    children: (0, i.jsx)(aH, {
                        moment: n
                    })
                }), l ? (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(aL.d, {
                        children: n.experienceName
                    }), (0, i.jsx)(aL.d, {
                        children: n.status === eI ? (0, i.jsx)("span", {
                            "data-testid": "moment-description-".concat(I),
                            children: n.description || "-"
                        }) : (0, i.jsx)(aX, {
                            moment: n,
                            disabled: null != o && o === I,
                            onBlur: v
                        }, "moment-description-".concat(I, "-").concat(n.modifiedAt))
                    })]
                }) : null, u ? (0, i.jsx)(aL.d, {
                    children: (0, i.jsx)("span", {
                        "data-testid": "moment-content-language-".concat(I),
                        children: t7(n.locale)
                    })
                }) : null, c ? (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(aL.d, {
                        children: (0, i.jsx)("span", {
                            "data-testid": "moment-description-".concat(I),
                            children: n.description || "-"
                        })
                    }), (0, i.jsx)(aL.d, {
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
                    }), (0, i.jsx)(aL.d, {
                        children: (0, i.jsx)("span", {
                            "data-testid": "moment-moderation-reason-".concat(I),
                            children: S
                        })
                    }), E, (0, i.jsx)(aL.d, {
                        align: "end",
                        children: null != M ? (0, i.jsx)(aN.W, {
                            position: "top-center",
                            title: m,
                            children: (0, i.jsx)(aN.y, {
                                asChild: !0,
                                children: (0, i.jsx)(k.f, {
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
                    children: [E, (0, i.jsx)(aL.d, {
                        align: "end",
                        children: (0, i.jsxs)("div", {
                            className: "inline-flex items-center gap-xsmall",
                            children: [(0, i.jsx)(az, {
                                moment: n
                            }), (0, i.jsx)(aN.W, {
                                position: "top-center",
                                title: r,
                                children: (0, i.jsx)(aN.y, {
                                    asChild: !0,
                                    children: (0, i.jsx)(k.f, {
                                        ariaLabel: r,
                                        icon: "icon-regular-pencil",
                                        size: "Small",
                                        type: "button",
                                        variant: "Utility",
                                        onClick: T
                                    })
                                })
                            }), w && !0 === n.hasLocalVideo && g ? (0, i.jsx)(ef.f, {
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
        aJ = (0, d.K)(e => {
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
            } = (0, aD.f)(), {
                statusTab: g
            } = nz(), x = nR(), y = (0, a.useCallback)(e => {
                switch (e) {
                    case eI:
                        return p("MomentsTable.Pills.Active");
                    case ew:
                        return p("MomentsTable.Pills.Pending");
                    case eC:
                        return p("MomentsTable.Pills.Draft");
                    case eT:
                        return p("MomentsTable.Pills.Moderated");
                    default:
                        return e
                }
            }, [p]), b = g === eI, I = g === eT, w = !I, C = x && !I, T = (0, a.useMemo)(() => g === eC ? t.filter(e => e.status === eC || e.status === ew) : t.filter(e => e.status === g), [t, g]), {
                page: j,
                rowsPerPage: S,
                onPageChange: M,
                onRowsPerPageChange: k
            } = (0, aU.f)({
                count: T.length,
                initialRowsPerPage: 10,
                resetKey: g
            }), {
                currentPage: E
            } = (0, aR.f)(T, {
                page: j,
                rowsPerPage: S,
                hasNextPage: !!b && u,
                fetchNextPage: b ? c : void 0,
                fetchLimit: m
            }), A = (0, a.useCallback)((e, t) => {
                let n = t.target.value;
                n !== e.description && r(e, {
                    description: n
                })
            }, [r]), L = (0, a.useCallback)(e => {
                M(void 0, e)
            }, [M]), N = p("Action.Edit"), R = f(en.f.OAuth, "Label.OAuthMoreDetails"), U = (0, aA.h)("reportAppealsUrl", "production", "global"), D = (0, i.jsx)(aL.U, {
                children: p("MomentsTable.Header.Status")
            }), O = 3 + 2 * !!w + +!!C + 3 * !!I;
            return (0, i.jsx)("div", {
                className: h,
                children: (0, i.jsx)("div", {
                    className: (0, P.q)(v, "flex flex-col gap-xlarge width-full self-stretch"),
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col gap-y-medium width-full",
                        children: [(0, i.jsxs)(aL.s, {
                            className: "width-full",
                            variant: "Framed",
                            children: [(0, i.jsx)(aL.E, {
                                children: (0, i.jsxs)(aL.N, {
                                    children: [(0, i.jsx)(aL.U, {
                                        children: p("MomentsTable.Header.Moments")
                                    }), w ? (0, i.jsxs)(i.Fragment, {
                                        children: [(0, i.jsx)(aL.U, {
                                            children: p("MomentsTable.Header.ExperienceName")
                                        }), (0, i.jsx)(aL.U, {
                                            children: p("MomentsTable.Header.Description")
                                        })]
                                    }) : null, C ? (0, i.jsx)(aL.U, {
                                        children: p("CreateMomentModal.LanguageInput.Label")
                                    }) : null, I ? (0, i.jsxs)(i.Fragment, {
                                        children: [(0, i.jsx)(aL.U, {
                                            children: p("MomentsTable.Header.Description")
                                        }), (0, i.jsx)(aL.U, {
                                            children: f(en.f.AppealsPortal, "Label.UploadTime")
                                        }), (0, i.jsx)(aL.U, {
                                            children: p("TableHeader.Reason")
                                        }), D, (0, i.jsx)(aL.U, {
                                            align: "end",
                                            children: " "
                                        })]
                                    }) : (0, i.jsxs)(i.Fragment, {
                                        children: [D, (0, i.jsx)(aL.U, {
                                            align: "end",
                                            children: " "
                                        })]
                                    })]
                                })
                            }), (0, i.jsx)(aL.z, {
                                children: 0 === T.length ? (0, i.jsx)(aL.N, {
                                    children: (0, i.jsx)(aL.d, {
                                        colSpan: O,
                                        align: "center",
                                        className: "padding-y-xxlarge",
                                        children: (0, i.jsx)("span", {
                                            className: "text-body-medium content-muted block padding-y-xxlarge",
                                            "data-testid": "moments-table-empty-filter-message",
                                            children: p(aW[g])
                                        })
                                    })
                                }) : E.map(e => (0, i.jsx)(aY, {
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
                                    onDescriptionBlur: A,
                                    onPublishMoment: o
                                }, nU(e)))
                            })]
                        }), T.length > 0 ? (0, i.jsx)(aL.c, {
                            paginationAriaLabel: "Pagination",
                            page: j,
                            rowsPerPage: S,
                            totalRows: T.length,
                            rowsPerPageOptions: aK,
                            onPageChange: L,
                            onRowsPerPageChange: k
                        }) : null]
                    })
                })
            })
        }, [en.f.Creations, en.f.Controls, en.f.NotApproved, en.f.AppealsPortal, en.f.OAuth]),
        aQ = (0, d.K)(e => {
            let {
                onRetry: t
            } = e, {
                translate: n
            } = (0, d.A)();
            return (0, i.jsx)(eh.f, {
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
        }, [en.f.Error]);
    var aZ = e.i(917852);
    let a$ = () => {
            window.open(aZ.Y, "_blank", "noopener,noreferrer")
        },
        a0 = (0, d.K)(() => {
            let {
                translate: e
            } = (0, d.A)();
            return (0, i.jsx)(eh.f, {
                className: "width-full",
                variant: "Feedback",
                severity: "Warning",
                hasCloseAffordance: !1,
                primaryActionLabel: e("Label.VerifyId"),
                onPrimaryAction: a$,
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
        }, [en.f.Creations]),
        a1 = () => {
            var e;
            (() => {
                let {
                    user: e
                } = (0, q.f)(), t = null == e ? void 0 : e.id;
                (0, a.useEffect)(() => () => {
                    void 0 !== t && (() => {
                        for (let e of eP.keys()) {
                            let t = eP.get(e);
                            t && (URL.revokeObjectURL(t.thumbnailUrl), URL.revokeObjectURL(t.videoUrl), eP.delete(e))
                        }
                    })()
                }, [t])
            })();
            let {
                translate: t
            } = (0, d.A)(), {
                user: n
            } = (0, q.f)(), r = null == n ? void 0 : n.id, {
                data: o,
                isLoading: s,
                isError: l,
                refetch: u
            } = (0, af.C)(), c = null != (e = null == o ? void 0 : o.creatorEligibility.includes(am._.IdVerified)) && e, m = s || l || !c, p = !s && !l && !c, f = (0, a.useCallback)(() => {
                u()
            }, [u]), [h, v] = (0, a.useState)(!1), [g, x] = (0, a.useState)(null), [y, b] = (0, a.useState)({}), {
                moments: I,
                updateMoment: w,
                removeMoment: C
            } = eQ(), {
                publishMoment: T,
                publishingDraftId: j,
                isPublishing: S
            } = function() {
                var e;
                let {
                    translate: t
                } = (0, d.A)(), {
                    locale: n
                } = (0, d.z)(), i = nR(), {
                    user: r
                } = (0, q.f)(), o = null == r ? void 0 : r.id, {
                    mutateAsync: s,
                    isPending: l,
                    variables: u
                } = (0, e1.f)({
                    mutationFn: async e => {
                        let {
                            moment: a
                        } = e;
                        if (null == o) throw Error("Authenticated user is required to publish a moment");
                        let r = await ez(o, a.draftId);
                        if (!r) throw Error("Local moment video is required before publishing");
                        return await nk({
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
                } = (0, q.f)(), t = (0, eZ.d)(), n = null == e ? void 0 : e.id, i = nN(), {
                    mutateAsync: r,
                    isPending: o,
                    variables: s
                } = (0, e1.f)({
                    mutationFn: e => {
                        let {
                            moment: t
                        } = e;
                        return nr({
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
                            e.setQueryData(nO(t, i), e => (null == e ? void 0 : e.pages.length) ? {
                                ...e,
                                pages: e.pages.map(e => ({
                                    ...e,
                                    moments: e.moments.filter(e => nU(e) !== n)
                                }))
                            } : e)
                        }(t, n, nU(r), i)
                    }
                });
                return {
                    deleteMoment: (0, a.useCallback)(e => r({
                        moment: e
                    }), [r]),
                    deletingMomentKey: o && null != s ? nU(s.moment) : null,
                    isDeleting: o
                }
            }(), {
                statusTab: P
            } = nz(), A = n_(), {
                serverMoments: L,
                isAllServerMomentsLoaded: N,
                hasNextPage: R,
                fetchNextPage: U,
                error: D,
                isPending: O,
                isFetchingNextPage: _,
                isFetchNextPageError: z,
                errorUpdatedAt: V,
                loadedPageCount: F,
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
                        isFetchingNextPage: d,
                        isFetchNextPageError: u,
                        errorUpdatedAt: c
                    } = function() {
                        let {
                            user: e
                        } = (0, q.f)(), t = null == e ? void 0 : e.id, n = nN();
                        return (0, e0.f)({
                            queryKey: nO(t, n),
                            queryFn: null != t ? e => {
                                let {
                                    pageParam: i
                                } = e;
                                return ni(t, i, n)
                            } : e$.V,
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
                            for (let e of n.moments) t.set(nU(e), e);
                        return [...t.values()]
                    }(n.pages) : av, [n]),
                    p = null != (e = null == n ? void 0 : n.pages.length) ? e : 0,
                    f = (0, a.useCallback)(() => {
                        s({
                            cancelRefetch: !1,
                            throwOnError: !1
                        })
                    }, [s]),
                    h = l && !u;
                (0, ah.f)({
                    hasNextPage: h,
                    fetchNextPage: f,
                    disabled: r
                });
                let v = !h && !r && !d;
                return (0, a.useMemo)(() => ({
                    serverMoments: m,
                    isAllServerMomentsLoaded: v,
                    hasNextPage: h,
                    fetchNextPage: f,
                    error: i,
                    isPending: r,
                    isFetchingNextPage: d,
                    isFetchNextPageError: u,
                    errorUpdatedAt: c,
                    loadedPageCount: p,
                    refetch: o,
                    serverPageSize: t
                }), [h, i, f, v, u, d, r, c, p, o, m, t])
            }(), H = A && P === eT, {
                data: K,
                isPending: W,
                error: X,
                refetch: Y
            } = function(e) {
                let {
                    enabled: t
                } = e, {
                    user: n
                } = (0, q.f)(), i = null == n ? void 0 : n.id;
                return (0, e2.f)({
                    queryKey: ["userViolations", i],
                    queryFn: null != i && t ? () => nI(i) : e$.V,
                    staleTime: 1 / 0,
                    retry: !1
                })
            }({
                enabled: H
            }), Q = (0, a.useMemo)(() => (null != K ? K : []).map(ay), [K]), Z = (0, a.useCallback)(() => {
                Y()
            }, [Y]);
            (0, a.useEffect)(() => {
                X && tQ(tK.ListViolations, X, {
                    userId: r
                })
            }, [r, X]);
            let $ = (0, a.useMemo)(() => [...L, ...I].map(e => {
                    let t = y[nU(e)];
                    return t ? {
                        ...e,
                        ...t
                    } : e
                }), [I, y, L]),
                et = (0, a.useMemo)(() => {
                    let e = $.filter(e => e.status !== eT);
                    return H ? [...e, ...Q] : e
                }, [H, Q, $]),
                en = et.length > 0,
                ei = (0, a.useRef)(0);
            (0, a.useEffect)(() => {
                !D || O || z || V <= ei.current || (ei.current = V, tQ(tK.ListMoments, D, {
                    userId: r,
                    pageCount: F
                }))
            }, [D, V, z, O, F, r]);
            let ea = (0, a.useRef)(!1);
            (0, a.useEffect)(() => {
                if (!z || _) {
                    ea.current = !1;
                    return
                }
                D && !ea.current && (ea.current = !0, tQ(tK.FetchNextPage, D, {
                    userId: r,
                    pageCount: F
                }))
            }, [D, z, _, F, r]);
            let er = (0, a.useMemo)(() => {
                    var e;
                    if (!g) return null;
                    let t = nU(g);
                    return null != (e = $.find(e => nU(e) === t)) ? e : g
                }, [g, $]),
                eo = (0, a.useCallback)(e => {
                    x(e), v(!0)
                }, []),
                es = (0, a.useCallback)(e => {
                    v(e), e || x(null)
                }, []),
                el = (0, a.useCallback)(() => {
                    B()
                }, [B]),
                ed = (0, a.useCallback)(() => {
                    (0, ap.c)({
                        title: t("Message.MomentPublishedError")
                    })
                }, [t]),
                eu = (0, a.useCallback)(() => {
                    (0, ap.c)({
                        title: t("Message.MomentUploading")
                    })
                }, [t]),
                ec = (0, a.useCallback)(() => {
                    (0, ap.c)({
                        title: t("Message.MomentProcessing")
                    })
                }, [t]),
                em = (0, a.useCallback)(() => {
                    (0, ap.c)({
                        title: t("Message.MomentDeletedError")
                    })
                }, [t]),
                ep = (0, a.useCallback)(async e => {
                    let t = e.status === eC,
                        n = nU(e),
                        i = {
                            ...t ? {
                                draftId: e.draftId
                            } : {
                                momentId: e.momentId,
                                feedItemId: e.feedItemId
                            },
                            experienceId: ab(e),
                            isLocalMoment: t,
                            userId: r
                        };
                    t0(tK.DeleteMoment, i);
                    try {
                        e.status === eC ? C(e.draftId) : await k(e), b(e => {
                            if (!(n in e)) return e;
                            let {
                                [n]: t, ...i
                            } = e;
                            return i
                        }), v(!1), x(null), t1(tK.DeleteMoment, i)
                    } catch (e) {
                        tQ(tK.DeleteMoment, e, i), em()
                    }
                }, [k, C, em, r]),
                ef = (0, a.useCallback)((e, t) => {
                    if (e.status === eC) return void w(e.draftId, t);
                    let n = nU(e),
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
                eh = (0, a.useCallback)(async e => {
                    if (M.current || S || m) return;
                    let t = I.find(t => t.draftId === e);
                    if (!t) return;
                    M.current = !0;
                    let n = {
                        draftId: e,
                        experienceId: ab(t),
                        isLocalMoment: !0,
                        userId: r
                    };
                    t0(tK.PublishMoment, n), eu();
                    try {
                        await T(t), C(e), v(!1), x(null), t1(tK.PublishMoment, n), ec()
                    } catch (e) {
                        tQ(tK.PublishMoment, e, n), ed()
                    } finally {
                        M.current = !1
                    }
                }, [m, S, I, T, C, ed, eu, ec, r]),
                ev = (0, a.useCallback)(e => {
                    e.status === eC && eh(e.draftId)
                }, [eh]);
            return H && X ? (0, i.jsx)(ee.f, {
                onReload: Z
            }) : H && W ? (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(J.f, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            }) : !D || P === eC || H || en ? (!O || H || en) && (N || H || en) ? (0, i.jsxs)("div", {
                className: "flex grow-1 flex-col gap-medium self-stretch width-full",
                children: [l ? (0, i.jsx)(aQ, {
                    onRetry: f
                }) : null, p ? (0, i.jsx)(a0, {}) : null, en || H ? (0, i.jsx)(aJ, {
                    moments: et,
                    hasNextPage: R,
                    fetchNextPage: U,
                    serverPageSize: G,
                    onEditMoment: eo,
                    onMomentMetadataChange: ef,
                    onPublishMoment: eh,
                    publishingDraftId: j,
                    isPublishDisabled: m
                }) : (0, i.jsx)("div", {
                    className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                    children: (0, i.jsx)(aP, {
                        onCreateClick: it
                    })
                }), (0, i.jsx)(aM, {
                    moment: er,
                    open: h,
                    onOpenChange: es,
                    onMomentMetadataChange: ef,
                    onDelete: er ? ep : void 0,
                    onPublish: (null == er ? void 0 : er.status) === eC ? ev : void 0,
                    publishingDraftId: j,
                    deletingMomentKey: E,
                    isPublishDisabled: m
                }, er ? nU(er) : void 0)]
            }) : (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(J.f, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            }) : (0, i.jsx)(ee.f, {
                onReload: el
            })
        },
        a2 = {
            width: "100%",
            height: "100%"
        },
        a4 = (0, i1.f)()(e => ({
            section: {
                ...a2
            },
            container: {
                ...a2
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
        a5 = (0, W.default)(() => e.A(202045), {
            loadableGenerated: {
                modules: [623728]
            },
            ssr: !1
        }),
        a3 = (0, W.default)(() => e.A(378869), {
            loadableGenerated: {
                modules: [518808]
            },
            ssr: !1
        }),
        a7 = (0, W.default)(() => e.A(580854), {
            loadableGenerated: {
                modules: [427685]
            },
            ssr: !1
        }),
        a8 = (0, W.default)(() => e.A(307640), {
            loadableGenerated: {
                modules: [48220]
            },
            ssr: !1
        }),
        a6 = (0, W.default)(() => e.A(114198), {
            loadableGenerated: {
                modules: [595604]
            },
            ssr: !1
        }),
        a9 = (0, W.default)(() => e.A(558217), {
            loadableGenerated: {
                modules: [333771]
            },
            ssr: !1
        }),
        re = (0, W.default)(() => e.A(546234), {
            loadableGenerated: {
                modules: [82873]
            },
            ssr: !1
        }),
        rt = (0, W.default)(() => e.A(85397), {
            loadableGenerated: {
                modules: [973472]
            },
            ssr: !1
        }),
        rn = (0, W.default)(() => e.A(890748), {
            loadableGenerated: {
                modules: [835459]
            },
            ssr: !1
        }),
        ri = (0, W.default)(() => e.A(68996), {
            loadableGenerated: {
                modules: [565869]
            },
            ssr: !1
        }),
        ra = (0, W.default)(() => e.A(441969), {
            loadableGenerated: {
                modules: [415945]
            },
            ssr: !1
        }),
        rr = (0, W.default)(() => e.A(481709), {
            loadableGenerated: {
                modules: [947274]
            },
            ssr: !1
        }),
        ro = (0, W.default)(() => e.A(272047), {
            loadableGenerated: {
                modules: [616027]
            },
            ssr: !1
        });

    function rs(e) {
        let t = (0, p.d)(e);
        return void 0 === t ? c.f.MyExperiences : (0, m.s)(c.f, t) ? t : c.f.MyExperiences
    }
    let rl = (0, d.K)(e => {
            let {
                verificationMetadata: t,
                currentGroup: n,
                currentUser: r
            } = e, [o, s] = (0, et.f)(["activeTab", "filterIndex"]), {
                resetAllFilters: l
            } = (0, ep.f)(), {
                isFetched: u
            } = (0, h._)(), {
                isResolving: f
            } = (0, a.useContext)(z), b = I(), w = (0, ip.f)(), C = (0, ih.f)(), {
                translate: T,
                ready: j
            } = (0, d.A)(), S = (0, a.useRef)(void 0), M = (0, a.useMemo)(() => [], []), k = (0, v.z)(o.activeTab), E = function(e) {
                let t = (0, p.d)(e);
                if (void 0 !== t && (0, m.s)(c.f, t)) return t !== c.f.Showcase && (0, v.k)(t) ? t : void 0
            }(o.activeTab), P = k || (0, v.q)(o.activeTab) || void 0 !== E, A = (0, a.useMemo)(() => {
                let e = (0, v.Y)(o.activeTab) ? c.f.AllCatalogAsset : v.K;
                return y.f.getMenuState(P ? e : rs(o.activeTab), M)
            }, [o.activeTab, M, P]);
            (0, a.useEffect)(() => {
                (0, v.q)(o.activeTab) && s({
                    activeTab: (0, v.c)(v.X),
                    filterIndex: 0
                })
            }, [o.activeTab, s]);
            let {
                categories: L,
                isLoading: N,
                isError: R,
                refetch: U
            } = (0, er.f)(void 0 !== E);
            (0, a.useEffect)(() => {
                if (void 0 === E || N || R) return;
                let e = (0, p.d)(o.filterIndex);
                s(function(e, t, n) {
                    var i;
                    if (e === c.f.AvatarLooks) return {
                        activeTab: (0, v.c)(v.w),
                        filterIndex: 0
                    };
                    if (e === c.f.AllCatalogAsset) return {
                        activeTab: (0, v.c)(v.X),
                        filterIndex: void 0 !== t && Number.isInteger(t) && t > 0 ? t : 0
                    };
                    let a = null != (i = es.w[e]) ? i : [],
                        r = a[(0, el.f)(t, a) && null != t ? t : 0],
                        o = r ? void 0 !== r.lookType ? eu(r) : void 0 !== r.assetType ? r.assetType : void 0 !== r.bundleType ? (0, eo.L)(r.bundleType) : void 0 : void 0;
                    if (void 0 === o) return em;
                    for (let e of n) {
                        let t = (0, ed.R)(e);
                        if (0 === t.length) {
                            if (ec(e) === o) return {
                                activeTab: (0, v.c)(e.key),
                                filterIndex: 0
                            }
                        } else {
                            let n = t.findIndex(t => (function(e, t) {
                                if (void 0 !== t.lookType) return eu(t);
                                let n = e.children.find(e => e.webStableId === t.taxonomy);
                                return n ? (0, eo.T)(n) : void 0
                            })(e, t) === o);
                            if (n >= 0) return {
                                activeTab: (0, v.c)(e.key),
                                filterIndex: n
                            }
                        }
                    }
                    return em
                }(E, void 0 === e ? void 0 : Number(e), L), {
                    skipHistory: !0
                })
            }, [E, N, R, L, o.filterIndex, s]);
            let D = (0, a.useMemo)(() => x.U.filter(e => !M.includes(e.type)), [M]),
                {
                    classes: {
                        section: O,
                        container: _
                    }
                } = a4(),
                q = (0, a.useCallback)(e => {
                    if (A.menuItem === e.menuItem && A.submenuItem === e.submenuItem) return;
                    let t = y.f.getAssetType(e);
                    A.menuItem !== e.menuItem && (0, v.k)(t) ? s({
                        activeTab: v.a,
                        filterIndex: 0
                    }) : s({
                        activeTab: t,
                        filterIndex: void 0
                    })
                }, [A.menuItem, A.submenuItem, s]),
                V = (0, a.useMemo)(() => {
                    let e = rs(o.activeTab);
                    if (void 0 === b && e === c.f.Moments || void 0 === C && e === c.f.Showcase) return A;
                    let t = rs(o.activeTab) === c.f.TextDocument;
                    if (void 0 === w && t) return A;
                    let i = y.f.getValidMenuState(D, A, n, void 0, void 0, b, C, w);
                    if (i !== A) {
                        if (!k) {
                            let e = y.f.getAssetType(i);
                            s((0, v.k)(e) ? {
                                activeTab: v.a,
                                filterIndex: 0
                            } : {
                                activeTab: e,
                                filterIndex: void 0
                            })
                        }
                        return i
                    }
                    return A
                }, [D, A, k, o.activeTab, n, b, w, C, s]),
                F = (0, a.useMemo)(() => y.f.getAssetType(V), [V]);
            (0, a.useEffect)(() => {
                if (void 0 === S.current) {
                    S.current = F;
                    return
                }
                let e = S.current;
                e !== F && (S.current = F, (0, g.c)(e, w) && (0, g.c)(F, w) || l())
            }, [F, w, l]);
            let B = F === c.f.MyExperiences || F === c.f.SharedExperiences,
                G = (0, g.c)(F, w),
                H = (0, a.useMemo)(() => {
                    var e, t;
                    return G ? (0, i.jsx)(rr, {
                        groupId: null == n ? void 0 : n.id,
                        useTabNavigationSpacing: !1,
                        userId: null == r ? void 0 : r.id
                    }) : F === c.f.Decal ? (0, i.jsx)(a7, {
                        groupId: null == n ? void 0 : n.id
                    }) : F === c.f.Animation ? (0, i.jsx)(a3, {
                        groupId: null == n ? void 0 : n.id
                    }) : F === c.f.Audio || F === c.f.Video ? (0, i.jsx)(a8, {
                        mediaAssetType: F,
                        groupId: null == n ? void 0 : n.id
                    }) : F === c.f.Plugin ? (0, i.jsx)(re, {
                        groupId: null == n ? void 0 : n.id
                    }) : F === c.f.Model ? (0, i.jsx)(a9, {
                        groupId: null == n ? void 0 : n.id
                    }) : F === c.f.MeshPart ? (0, i.jsx)(a6, {
                        groupId: null == n ? void 0 : n.id
                    }) : F === c.f.TextDocument ? (0, i.jsx)("div", {
                        className: "flex justify-center items-center padding-y-xxlarge",
                        children: (0, i.jsx)(J.f, {
                            ariaLabel: T("Label.Loading"),
                            size: "Large",
                            variant: "Indeterminate"
                        })
                    }) : F === c.f.ShareLink ? (0, i.jsx)(ri, {}) : F === c.f.Moments ? (0, i.jsx)(a1, {}) : F === c.f.AssetPermissionRequests ? (0, i.jsx)(ro, {}) : F === c.f.Showcase ? (0, i.jsx)(rt, {
                        groupId: null == n ? void 0 : n.id
                    }) : (0, v.k)(F) ? (0, i.jsx)(a5, {
                        assetType: F,
                        groupId: null == n ? void 0 : n.id
                    }) : F === c.f.Image || F === c.f.Mesh ? (0, i.jsx)(rn, {
                        primitiveAssetType: F,
                        groupId: null == n ? void 0 : n.id
                    }) : (0, i.jsx)(ra, {
                        assetType: F,
                        creatorType: (null == n ? void 0 : n.id) ? X.W.Group : X.W.User,
                        creatorTargetId: null != (e = null != (t = null == n ? void 0 : n.id) ? t : null == r ? void 0 : r.id) ? e : 0,
                        isTelemetryReady: u && j && !f && (null == r ? void 0 : r.id) !== void 0 && rs(o.activeTab) === F
                    })
                }, [F, null == n ? void 0 : n.id, null == r ? void 0 : r.id, G, T, u, j, f, o.activeTab]);
            return (0, i.jsxs)(ea.U, {
                children: [(0, i.jsx)(Y.i, {
                    title: (0, Y.t)(V.submenuItem ? T(V.submenuItem.nameKey) : T(V.menuItem.nameKey)),
                    breadcrumb: (0, Y.A)(T("Heading.Creations"), T(V.menuItem.nameKey), V.submenuItem ? T(V.submenuItem.nameKey) : void 0)
                }), (0, i.jsx)("section", {
                    className: O,
                    children: (0, i.jsxs)(Q.f, {
                        container: !0,
                        direction: "column",
                        className: _,
                        children: [(0, i.jsx)(ei.f, {}), (0, i.jsx)(Z.J, {
                            trackingPage: Z.e.Creations
                        }), void 0 !== E && R ? (0, i.jsx)(ee.f, {
                            onReload: U
                        }) : void 0 !== E ? (0, i.jsx)("div", {
                            className: "flex justify-center items-center padding-y-xxlarge",
                            children: (0, i.jsx)(J.f, {
                                ariaLabel: T("Label.Loading"),
                                size: "Large",
                                variant: "Indeterminate"
                            })
                        }) : (0, i.jsxs)(i.Fragment, {
                            children: [!G && (0, i.jsx)(ac, {
                                menuState: V,
                                onMenuStateChange: q,
                                verificationMetadata: t,
                                group: n
                            }), B && (0, i.jsx)($.f, {}), H]
                        })]
                    })
                })]
            })
        }, [en.f.AssetTypes, en.f.Controls, en.f.Creations, en.f.Error, en.f.Navigation, en.f.ShareLinksManagement, en.f.ExperienceReleases, en.f.Taxonomy]),
        rd = () => {
            let e = (0, h.W)(),
                {
                    user: t
                } = (0, q.f)(),
                n = (0, K.f)();
            return (0, i.jsx)(H, {
                children: (0, i.jsx)(rl, {
                    verificationMetadata: n,
                    currentGroup: e,
                    currentUser: t
                })
            })
        };
    var ru = e.i(675330),
        rc = e.i(177608),
        rm = e.i(796266);
    let rp = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)(rc.f, {
                title: (0, i.jsx)(_, {}),
                secondaryRail: (0, i.jsx)(S, {}),
                secondarySize: "small",
                noBreadCrumbs: !0,
                children: t
            })
        },
        rf = () => {
            let {
                isResolving: e
            } = (0, rm.f)(), t = (0, a.useMemo)(() => ({
                isResolving: e
            }), [e]);
            return (0, i.jsx)(o.f, {
                children: (0, i.jsx)(ru.f, {
                    children: (0, i.jsx)(r.U, {
                        children: (0, i.jsx)(z.Provider, {
                            value: t,
                            children: (0, i.jsx)(rd, {})
                        })
                    })
                })
            })
        };
    rf.getPageLayout = e => (0, i.jsx)(rp, {
        children: e
    }), rf.loggerConfig = {
        rosId: "3539"
    }, e.s(["default", 0, rf], 962059)
}]);

//# debugId=594b768e-186d-d457-b0d5-0be8006068e0
//# sourceMappingURL=08er1vj23k-wl.js.map