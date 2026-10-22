;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "0a09ad06-dbdf-ea15-5eb7-20b9dd9c35cc")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 962059, e => {
    "use strict";
    var t, n, i = e.i(221628),
        a = e.i(416340),
        s = e.i(203450),
        o = e.i(384621),
        r = e.i(138726),
        l = e.i(589624),
        d = e.i(692734),
        u = e.i(79187),
        c = e.i(134731),
        m = e.i(671376),
        p = e.i(927868),
        h = e.i(692587),
        v = e.i(85057),
        f = e.i(745873),
        x = e.i(130778),
        g = e.i(211461),
        b = e.i(723538),
        y = e.i(117236),
        I = e.i(427149),
        T = e.i(9436);
    let C = () => {
            let {
                ready: e,
                value: t
            } = (0, d.useFlag)(T.isMomentsUploadEnabled);
            if (e) return t
        },
        w = "creation-",
        S = {
            [m.Asset.Place]: "Label.Experiences",
            [m.Asset.ShareLink]: "Heading.ShareLinks",
            [m.Asset.TShirt]: "Label.AvatarItems",
            [m.Asset.Decal]: "Label.DevelopmentItems",
            [m.Asset.Moments]: "Label.Moments"
        },
        A = "".concat(w).concat(m.Asset.Decal);

    function M() {
        let e = (0, l.useRouter)(),
            {
                translate: t
            } = (0, u.useTranslation)(),
            n = (0, f.useCurrentGroup)(),
            i = C(),
            {
                value: s
            } = (0, d.useFlag)(c.isAssetAccessRequestsEnabled),
            o = (0, b.default)(),
            r = (0, a.useMemo)(() => (t, n, i) => {
                let a = new URLSearchParams,
                    s = (0, h.readQueryValue)(e.query.groupId);
                s && a.set("groupId", s), t && a.set("activeTab", t), i && a.set("inventoryAssetTypes", i), void 0 !== n && a.set("filterIndex", String(n));
                let o = a.toString();
                return o ? "/dashboard/creations?".concat(o) : "/dashboard/creations"
            }, [e.query.groupId]),
            v = (0, a.useMemo)(() => y.default.filter(e => e.type !== m.Asset.AssetPermissionRequests || s).filter(e => I.default.isMenuItemEnabled(e, n, void 0, void 0, i)).map(e => {
                var n, i, a;
                let s = e.type === m.Asset.Decal,
                    l = null != (n = null == (a = e.submenuItems) || null == (i = a[0]) ? void 0 : i.type) ? n : e.type,
                    d = S[e.type],
                    u = e.type === m.Asset.TShirt,
                    c = o ? x.AVATAR_ITEMS_ACTIVE_TAB : m.Asset.AvatarLooks;
                return {
                    key: "".concat(w).concat(e.type),
                    label: d ? t(d) : t(e.nameKey),
                    href: e.type === m.Asset.Place ? r() : r(u ? c : l, u ? 0 : void 0, s ? g.DevelopmentItemsAssetTypeFilter.All : void 0)
                }
            }), [r, n, s, i, o, t]),
            T = (0, a.useMemo)(() => {
                var t;
                let n, i = (0, x.isTaxonomyActiveTab)(e.query.activeTab) || (0, x.isRecentsActiveTab)(e.query.activeTab),
                    a = I.default.getMenuState(i ? x.TAXONOMY_HOST_ASSET : (t = e.query.activeTab, void 0 !== (n = (0, h.readQueryValue)(t)) && (0, p.isValidEnumValue)(m.Asset, n) ? n : void 0), []);
                return "".concat(w).concat(a.menuItem.type)
            }, [e.query.activeTab]);
        return {
            activeItem: (0, a.useMemo)(() => v.find(e => e.key === T), [T, v]),
            activeKey: T,
            homeHref: r(),
            isDevelopmentItemsActive: T === A,
            items: v
        }
    }
    let j = () => {
        let {
            translate: e
        } = (0, u.useTranslation)(), {
            activeKey: t,
            items: n
        } = M();
        return (0, i.jsx)(v.default, {
            header: e("Heading.Creations"),
            activeKey: t,
            items: n
        })
    };
    var E = e.i(562991),
        P = e.i(489098),
        k = e.i(36482),
        L = e.i(197649);
    let R = () => a.default.createElement("div", {
            className: "flex items-center justify-center shrink-0 width-600"
        }, a.default.createElement("span", {
            className: "text-body-medium content-default"
        }, "/")),
        N = e => {
            let {
                item: t,
                isActive: n
            } = e, {
                label: i,
                href: s,
                leadingIcon: o,
                mediaSrc: r,
                onClick: l
            } = t, d = a.default.createElement("div", {
                className: (0, L.default)("flex items-center gap-small shrink-0 height-600")
            }, o && a.default.createElement(E.Icon, {
                name: o,
                size: "XSmall",
                className: "content-emphasis"
            }), r && a.default.createElement("div", {
                className: "shrink-0 size-500"
            }, a.default.createElement(k.Media, {
                src: r,
                alt: i,
                aspectRatio: "1:1",
                containerClassName: "radius-small clip"
            })), a.default.createElement("span", {
                className: (0, L.default)("text-no-wrap", {
                    "content-emphasis text-title-medium": n,
                    "content-default text-body-medium": !n
                })
            }, i));
            return s && !n ? a.default.createElement("a", {
                href: s,
                onClick: l,
                className: (0, L.default)("flex items-center shrink-0 focus-visible:outline-focus radius-small"),
                style: {
                    textDecoration: "none"
                }
            }, d) : l && !n ? a.default.createElement("button", {
                type: "button",
                onClick: l,
                className: (0, L.default)("flex items-center shrink-0 cursor-pointer padding-none bg-none focus-visible:outline-focus radius-small"),
                style: {
                    border: "none"
                }
            }, d) : a.default.createElement("div", {
                className: "flex items-center shrink-0",
                "aria-current": n ? "page" : void 0
            }, d)
        },
        O = e => {
            let {
                items: t,
                maxItems: n,
                ariaLabel: i,
                expansionAriaLabel: s,
                className: o,
                ...r
            } = e, [l, d] = (0, a.useState)(!1), u = null != n && t.length > n && !l, c = t, m = !1;
            u && (c = [t[0], t[t.length - 1]], m = !0);
            let p = () => {
                d(!0)
            };
            return a.default.createElement("nav", {
                "aria-label": i,
                className: (0, L.default)("flex items-center height-1000", o),
                ...r
            }, a.default.createElement("ol", {
                className: "flex items-center padding-none margin-none gap-none",
                style: {
                    listStyle: "none"
                }
            }, c.map((e, t) => {
                let n = t === c.length - 1;
                return a.default.createElement(a.default.Fragment, {
                    key: e.href || "".concat(e.label, "-").concat(t)
                }, m && 1 === t && a.default.createElement(a.default.Fragment, null, a.default.createElement("li", null, a.default.createElement(P.IconButton, {
                    icon: "icon-filled-three-dots-horizontal",
                    ariaLabel: s,
                    size: "XSmall",
                    variant: "Standard",
                    onClick: p,
                    className: "size-600 min-height-600 max-height-600"
                })), a.default.createElement("li", null, a.default.createElement(R, null))), a.default.createElement("li", null, a.default.createElement(N, {
                    item: e,
                    isActive: n
                })), t < c.length - 1 && a.default.createElement("li", null, a.default.createElement(R, null)))
            })))
        };
    O.displayName = "Breadcrumbs";
    var D = e.i(725509);
    let U = e => {
        let {
            creationsHref: t,
            creationsLabel: n,
            currentLabel: s
        } = e, o = (0, l.useRouter)(), r = (0, D.default)(), d = (0, a.useMemo)(() => [{
            href: t,
            label: n,
            onClick: e => {
                e.altKey || e.ctrlKey || e.metaKey || e.shiftKey || (e.preventDefault(), o.push(t))
            }
        }, {
            label: s
        }], [t, n, s, o]);
        return (0, i.jsx)(O, {
            ariaLabel: r.breadcrumbs,
            expansionAriaLabel: r.showHiddenBreadcrumbs,
            items: d
        })
    };
    var B = e.i(376204);
    let z = e => {
            let {
                fallback: t,
                ...n
            } = e, {
                isEnabled: a
            } = (0, B.default)();
            return a ? (0, i.jsx)(U, {
                ...n
            }) : t
        },
        q = () => {
            var e;
            let {
                translate: t
            } = (0, u.useTranslation)(), {
                activeItem: n,
                homeHref: a,
                isDevelopmentItemsActive: s
            } = M(), o = t("Heading.Creations"), r = (0, i.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: null != (e = null == n ? void 0 : n.label) ? e : o
            });
            return s && null != n ? (0, i.jsx)(z, {
                creationsHref: a,
                creationsLabel: o,
                currentLabel: n.label,
                fallback: r
            }) : r
        },
        F = (0, a.createContext)({
            isResolving: !1
        });
    var V = e.i(814975),
        G = e.i(252842),
        _ = e.i(533414),
        H = e.i(456810);
    let K = {
            sort: H.defaultAssetsSort,
            sortOrder: G.SortOrder.Desc,
            isArchived: !1,
            isPublishOnly: !1,
            isOnMarketplace: !1
        },
        W = e => {
            let {
                children: t
            } = e, {
                user: n
            } = (0, V.useAuthentication)(), [s, o] = (0, _.useLocalStorage)("creationSort.".concat(null == n ? void 0 : n.id), K.sort), r = (0, a.useRef)(s), l = (0, a.useMemo)(() => {
                let e = r.current;
                return Object.keys(s).some(t => s[t] !== e[t]) && (r.current = s), r.current
            }, [s]), [d, u] = (0, _.useLocalStorage)("creationSortOrder.".concat(null == n ? void 0 : n.id), K.sortOrder), [c, m] = (0, a.useState)(K.isArchived), [p, h] = (0, a.useState)(!1), [v, f] = (0, a.useState)(K.isPublishOnly), [x, g] = (0, a.useState)(K.isOnMarketplace), b = (0, a.useCallback)(() => {
                o(K.sort), u(K.sortOrder), m(K.isArchived), h(!1), f(K.isPublishOnly), g(K.isOnMarketplace)
            }, [o, u]), y = (0, a.useMemo)(() => ({
                isArchived: c,
                isAgeRestrictedCollaboration: p,
                isOnMarketplace: x,
                isPublicOnly: v,
                resetAllFilters: b,
                setIsArchived: m,
                setIsAgeRestrictedCollaboration: h,
                setIsOnMarketplace: g,
                setIsPublicOnly: f,
                setSort: o,
                setSortOrder: u,
                sort: l,
                sortOrder: d
            }), [c, p, x, v, b, m, h, g, f, o, u, l, d]);
            return (0, i.jsx)(H.default.Provider, {
                value: y,
                children: t
            })
        };
    var J = e.i(668091),
        Y = e.i(507742),
        Q = e.i(9618),
        X = e.i(37819),
        Z = e.i(580683),
        $ = e.i(345886),
        ee = e.i(714039),
        et = e.i(896852),
        en = e.i(780880),
        ei = e.i(881670),
        ea = e.i(845592),
        es = e.i(339544),
        eo = e.i(475642),
        er = e.i(278862),
        el = e.i(711950),
        ed = e.i(643992),
        eu = e.i(211388);
    let ec = "CreatorHub.MomentsCreations.local",
        em = e => "".concat(ec, ".").concat(e),
        ep = "".concat(ec, ".__inactive__"),
        eh = "active",
        ev = "pending",
        ef = "draft",
        ex = "moderated",
        eg = [eh, ef],
        eb = e => new Date(e.modifiedAt).getTime(),
        ey = "momentMedia",
        eI = async e => {
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
        }, eT = new Map, eC = (e, t) => "".concat(e, ":").concat(t), ew = (e, t, n) => new Promise((t, n) => {
            if ("u" < typeof indexedDB) return void n(Error("IndexedDB is unavailable"));
            let i = indexedDB.open("".concat("CreatorHub.MomentsVideoMedia", ".").concat(e), 1);
            i.addEventListener("upgradeneeded", () => {
                let e = i.result;
                e.objectStoreNames.contains(ey) || e.createObjectStore(ey, {
                    keyPath: "momentId"
                })
            }), i.addEventListener("success", () => t(i.result)), i.addEventListener("error", () => {
                var e;
                return n(null != (e = i.error) ? e : Error("Failed to open IndexedDB"))
            })
        }).then(e => new Promise((i, a) => {
            let s = n(e.transaction(ey, t).objectStore(ey));
            s.addEventListener("success", () => i(s.result)), s.addEventListener("error", () => {
                var e;
                return a(null != (e = s.error) ? e : Error("IndexedDB request failed"))
            })
        })), eS = e => "object" == typeof e && null !== e && "momentId" in e && "string" == typeof e.momentId && "videoBlob" in e && e.videoBlob instanceof Blob && "thumbnailBlob" in e && e.thumbnailBlob instanceof Blob && "updatedAt" in e && "string" == typeof e.updatedAt, eA = (e, t) => {
            let n = eC(e, t),
                i = eT.get(n);
            i && (URL.revokeObjectURL(i.thumbnailUrl), URL.revokeObjectURL(i.videoUrl), eT.delete(n))
        }, eM = async (e, t, n) => {
            let i = await eI(n),
                a = {
                    momentId: t,
                    videoBlob: n,
                    thumbnailBlob: i,
                    fileName: n.name,
                    updatedAt: new Date().toISOString()
                };
            eA(e, t), await ew(e, "readwrite", e => e.put(a))
        }, ej = new Set(["QuotaExceededError", "NS_ERROR_DOM_QUOTA_REACHED"]), eE = e => !!(e instanceof DOMException && ej.has(e.name)) || e instanceof Error && e.message.toLowerCase().includes("quota"), eP = async (e, t, n, i) => {
            let a = [],
                s = async () => {
                    await eM(e, t, n)
                };
            try {
                return await s(), {
                    evictedMediaDraftIds: a
                }
            } catch (e) {
                if (!eE(e)) throw e
            }
            for (let n of [...i.filter(e => e.draftId !== t && !1 !== e.hasLocalVideo)].sort((e, t) => eb(e) - eb(t))) {
                await eR(e, [n.draftId]), a.includes(n.draftId) || a.push(n.draftId);
                try {
                    return await s(), {
                        evictedMediaDraftIds: a
                    }
                } catch (e) {
                    if (!eE(e)) throw e
                }
            }
            throw Error("Failed to store moment video locally")
        };
    async function ek(e, t) {
        var n, i;
        let a, s = await ew(e, "readonly", e => e.get(t));
        if (!eS(s)) return null;
        let {
            videoBlob: o
        } = s;
        return new File([o], (a = null == (i = (n = s).fileName) ? void 0 : i.trim()) ? a : n.videoBlob.type.includes("quicktime") ? "moment.mov" : "moment.mp4", {
            type: o.type || "video/mp4"
        })
    }
    let eL = async (e, t) => {
        let n = eC(e, t),
            i = eT.get(n);
        if (i) return i;
        let a = await ew(e, "readonly", e => e.get(t));
        if (!eS(a)) return null;
        let s = {
            thumbnailUrl: URL.createObjectURL(a.thumbnailBlob),
            videoUrl: URL.createObjectURL(a.videoBlob)
        };
        return eT.set(n, s), s
    }, eR = async (e, t) => {
        0 !== t.length && await Promise.all(t.map(async t => {
            eA(e, t), await ew(e, "readwrite", e => e.delete(t))
        }))
    }, eN = {
        version: "1",
        moments: []
    }, eO = e => "object" == typeof e && null !== e && !Array.isArray(e), eD = e => eO(e) && "1" === e.version && Array.isArray(e.moments) ? e.moments : [], eU = e => "string" == typeof e ? e : void 0, eB = e => "number" == typeof e && Number.isFinite(e) ? e : void 0, ez = new Set(Object.values(u.Locale)), eq = e => eD(e).map(e => (e => {
        var t, n, i, a, s, o;
        let r;
        if (!eO(e)) return null;
        let l = null != (t = eU(e.draftId)) ? t : eU(e.id);
        return null == l || "" === l || e.status !== ef ? null : {
            draftId: l,
            status: ef,
            experienceId: null != (n = eB(e.experienceId)) ? n : 0,
            rootPlaceId: eB(e.rootPlaceId),
            experienceName: null != (i = eU(e.experienceName)) ? i : "",
            description: null != (a = eU(e.description)) ? a : "",
            modifiedAt: null != (s = eU(e.modifiedAt)) ? s : new Date(0).toISOString(),
            assetId: eB(e.assetId),
            thumbnailUrl: eU(e.thumbnailUrl),
            videoUrl: eU(e.videoUrl),
            universeId: eB(e.universeId),
            locale: "string" == typeof(r = o = e.locale) && ez.has(r) ? o : void 0,
            ..."boolean" == typeof e.hasLocalVideo ? {
                hasLocalVideo: e.hasLocalVideo
            } : {}
        }
    })(e)).filter(e => null != e), eF = e => {
        if (!e) return [];
        try {
            let t = JSON.parse(e);
            return eq(t)
        } catch (e) {
            return []
        }
    }, eV = e => ({
        version: "1",
        moments: e
    }), eG = () => {
        let {
            user: e
        } = (0, V.useAuthentication)(), t = null == e ? void 0 : e.id, n = null != t, i = n ? em(t) : ep, [s, o] = (0, _.useLocalStorage)(i, eN), r = (0, a.useMemo)(() => n ? eq(s) : [], [n, s]);
        (0, a.useEffect)(() => {
            if (!n || null == t) return;
            let e = eD(s).filter(e => eO(e) && e.status !== ef).map(e => {
                var t, n;
                return eO(e) && null != (t = null != (n = eU(e.draftId)) ? n : eU(e.id)) ? t : ""
            }).filter(e => "" !== e);
            0 !== e.length && (o(eV(r)), eR(t, e))
        }, [n, r, s, o, t]);
        let l = (0, a.useCallback)((e, a) => {
                var s, r, l;
                if (!n || null == t || 0 === e.length) return {
                    moments: [],
                    evictedMediaDraftIds: []
                };
                let {
                    moments: d,
                    evictedMediaDraftIds: u
                } = (l = eF(window.localStorage.getItem(i)), {
                    moments: [...e.map(e => {
                        var t;
                        return {
                            ...e,
                            status: ef,
                            hasLocalVideo: null == (t = e.hasLocalVideo) || t
                        }
                    }), ...l].sort((e, t) => eb(t) - eb(e)),
                    evictedMediaDraftIds: []
                }), c = ((e, t) => {
                    if (0 === t.length) return [...e];
                    let n = new Set(t);
                    return e.map(e => n.has(e.draftId) ? {
                        ...e,
                        hasLocalVideo: !1
                    } : e)
                })(d, null != (s = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? s : []), m = [...new Set([...null != (r = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? r : [], ...u])];
                return o(eV(c)), m.length > 0 && eR(t, m), {
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
                })(r, e, i);
                return a ? (o(eV(a)), a) : null
            }, [n, r, o, t]),
            c = (0, a.useCallback)(e => {
                if (!n || null == t) return null;
                let i = -1 === r.findIndex(t => t.draftId === e) ? null : r.filter(t => t.draftId !== e);
                return i ? (o(eV(i)), eR(t, [e]), i) : null
            }, [n, r, o, t]),
            m = (0, a.useCallback)(e => {
                if (!n || null == t) return null;
                let i = ((e, t) => {
                    let n = new Set(t);
                    if (0 === n.size) return null;
                    let i = e.filter(e => !n.has(e.draftId));
                    return i.length === e.length ? null : i
                })(r, e);
                if (!i) return null;
                let a = new Set(e),
                    s = r.filter(e => a.has(e.draftId)).map(e => e.draftId);
                return o(eV(i)), eR(t, s), i
            }, [n, r, o, t]);
        return {
            moments: r,
            addMoment: d,
            addMoments: l,
            updateMoment: u,
            removeMoment: c,
            removeMoments: m
        }
    };
    var e_ = e.i(795621),
        eH = e.i(711367),
        eK = e.i(630986),
        eW = e.i(182012),
        eJ = e.i(677753),
        eY = function(e, t) {
            return (eY = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function eQ(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        eY(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function eX(e, t, n, i) {
        return new(n || (n = Promise))(function(a, s) {
            function o(e) {
                try {
                    l(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function r(e) {
                try {
                    l(i.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function l(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, r)
            }
            l((i = i.apply(e, t || [])).next())
        })
    }

    function eZ(e, t) {
        var n, i, a, s = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = r(0), o.throw = r(1), o.return = r(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function r(r) {
            return function(l) {
                var d = [r, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, d[0] && (s = 0)), s;) try {
                    if (n = 1, i && (a = 2 & d[0] ? i.return : d[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, d[1])).done) return a;
                    switch (i = 0, a && (d = [2 & d[0], a.value]), d[0]) {
                        case 0:
                        case 1:
                            a = d;
                            break;
                        case 4:
                            return s.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = d[1], d = [0];
                            continue;
                        case 7:
                            d = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = s.trys).length > 0 && a[a.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === d[0] && (!a || d[1] > a[0] && d[1] < a[3])) {
                                s.label = d[1];
                                break
                            }
                            if (6 === d[0] && s.label < a[1]) {
                                s.label = a[1], a = d;
                                break
                            }
                            if (a && s.label < a[2]) {
                                s.label = a[2], s.ops.push(d);
                                break
                            }
                            a[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    d = t.call(e, s)
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

    function e$(e) {
        if (void 0 !== e) return null === e ? null : {
            chunkNum: e.chunkNum,
            eTag: e.eTag
        }
    }

    function e0(e) {
        if (void 0 !== e) return null === e ? null : {
            role: e.role,
            operationId: e.operationId,
            parts: void 0 === e.parts ? void 0 : null === e.parts ? null : e.parts.map(e$)
        }
    }

    function e1(e) {
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

    function e2(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function e4(e) {
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

    function e5(e) {
        if (void 0 !== e) return null === e ? null : {
            text: e.text,
            voiceId: e.voiceId,
            pitch: e.pitch,
            speed: e.speed,
            startTime: e.startTime
        }
    }

    function e8(e) {
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

    function e3(e, t) {
        return null == e ? e : {
            assetId: (0, eJ.exists)(e, "assetId") ? e.assetId : void 0,
            startTime: (0, eJ.exists)(e, "startTime") ? e.startTime : void 0
        }
    }

    function e6(e) {
        var t;
        return null == (t = e) ? t : {
            position: (0, eJ.exists)(t, "position") ? t.position : void 0,
            rotation: (0, eJ.exists)(t, "rotation") ? t.rotation : void 0,
            stickerSize: (0, eJ.exists)(t, "stickerSize") ? t.stickerSize : void 0,
            scale: (0, eJ.exists)(t, "scale") ? t.scale : void 0,
            stickerURI: (0, eJ.exists)(t, "stickerURI") ? t.stickerURI : void 0,
            zIndex: (0, eJ.exists)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function e9(e) {
        if (void 0 !== e) return null === e ? null : {
            position: e.position,
            rotation: e.rotation,
            stickerSize: e.stickerSize,
            scale: e.scale,
            stickerURI: e.stickerURI,
            zIndex: e.zIndex
        }
    }

    function e7(e) {
        var t, n;
        return null == (t = e) ? t : {
            position: (0, eJ.exists)(t, "position") ? t.position : void 0,
            rotation: (0, eJ.exists)(t, "rotation") ? t.rotation : void 0,
            scale: (0, eJ.exists)(t, "scale") ? t.scale : void 0,
            text: (0, eJ.exists)(t, "text") ? t.text : void 0,
            textOverlayStyle: (0, eJ.exists)(t, "textOverlayStyle") ? null == (n = t.textOverlayStyle) ? n : {
                font: (0, eJ.exists)(n, "font") ? n.font : void 0,
                fontColor: (0, eJ.exists)(n, "fontColor") ? n.fontColor : void 0,
                fontSize: (0, eJ.exists)(n, "fontSize") ? n.fontSize : void 0,
                textXAlignment: (0, eJ.exists)(n, "textXAlignment") ? n.textXAlignment : void 0
            } : void 0,
            zIndex: (0, eJ.exists)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function te(e) {
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

    function tt(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, eJ.exists)(t, "assetId") ? t.assetId : void 0,
            startTime: (0, eJ.exists)(t, "startTime") ? t.startTime : void 0,
            assetAccessContext: (0, eJ.exists)(t, "assetAccessContext") ? t.assetAccessContext : void 0
        }
    }

    function tn(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId,
            startTime: e.startTime,
            assetAccessContext: e.assetAccessContext
        }
    }

    function ti(e) {
        var t;
        return null == (t = e) ? t : {
            httpVerb: (0, eJ.exists)(t, "httpVerb") ? t.httpVerb : void 0,
            url: (0, eJ.exists)(t, "url") ? t.url : void 0,
            chunkNum: (0, eJ.exists)(t, "chunkNum") ? t.chunkNum : void 0,
            contentStart: (0, eJ.exists)(t, "contentStart") ? t.contentStart : void 0,
            contentLength: (0, eJ.exists)(t, "contentLength") ? t.contentLength : void 0,
            expirationTimeMs: (0, eJ.exists)(t, "expirationTimeMs") ? t.expirationTimeMs : void 0
        }
    }

    function ta(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eJ.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eJ.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eJ.exists)(t, "operationPath") ? t.operationPath : void 0,
            uploadUrls: (0, eJ.exists)(t, "uploadUrls") ? null === t.uploadUrls ? null : t.uploadUrls.map(ti) : void 0
        }
    }

    function ts(e, t) {
        var n, i, a;
        return null == e ? e : {
            assetId: (0, eJ.exists)(e, "assetId") ? e.assetId : void 0,
            assetAccessContext: (0, eJ.exists)(e, "assetAccessContext") ? e.assetAccessContext : void 0,
            assetTotalDuration: (0, eJ.exists)(e, "assetTotalDuration") ? e.assetTotalDuration : void 0,
            caption: (0, eJ.exists)(e, "caption") ? e.caption : void 0,
            videoContentLanguage: (0, eJ.exists)(e, "videoContentLanguage") ? e.videoContentLanguage : void 0,
            partnerUploadType: (0, eJ.exists)(e, "partnerUploadType") ? e.partnerUploadType : void 0,
            captureType: (0, eJ.exists)(e, "captureType") ? e.captureType : void 0,
            editsType: (0, eJ.exists)(e, "editsType") ? e.editsType : void 0,
            videoCaptureEdits: (0, eJ.exists)(e, "videoCaptureEdits") ? null == (n = e.videoCaptureEdits) ? n : {
                trim: (0, eJ.exists)(n, "trim") ? null == (i = n.trim) ? i : {
                    startTime: (0, eJ.exists)(i, "startTime") ? i.startTime : void 0,
                    endTime: (0, eJ.exists)(i, "endTime") ? i.endTime : void 0
                } : void 0,
                music: (0, eJ.exists)(n, "music") ? e3(n.music) : void 0,
                textOverlays: (0, eJ.exists)(n, "textOverlays") ? null === n.textOverlays ? null : n.textOverlays.map(e7) : void 0,
                stickerOverlays: (0, eJ.exists)(n, "stickerOverlays") ? null === n.stickerOverlays ? null : n.stickerOverlays.map(e6) : void 0,
                ttsAudios: (0, eJ.exists)(n, "ttsAudios") ? null === n.ttsAudios ? null : n.ttsAudios.map(tt) : void 0
            } : void 0,
            screenshotCaptureEdits: (0, eJ.exists)(e, "screenshotCaptureEdits") ? null == (a = e.screenshotCaptureEdits) ? a : {
                music: (0, eJ.exists)(a, "music") ? e3(a.music) : void 0,
                textOverlays: (0, eJ.exists)(a, "textOverlays") ? null === a.textOverlays ? null : a.textOverlays.map(e7) : void 0,
                ttsAudios: (0, eJ.exists)(a, "ttsAudios") ? null === a.ttsAudios ? null : a.ttsAudios.map(tt) : void 0
            } : void 0
        }
    }

    function to(e, t) {
        var n;
        return null == e ? e : {
            status: (0, eJ.exists)(e, "status") ? e.status : void 0,
            result: (0, eJ.exists)(e, "result") ? null == (n = e.result) ? n : {
                assetId: (0, eJ.exists)(n, "assetId") ? n.assetId : void 0,
                isApproved: (0, eJ.exists)(n, "isApproved") ? n.isApproved : void 0,
                operationError: (0, eJ.exists)(n, "operationError") ? n.operationError : void 0
            } : void 0
        }
    }

    function tr(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eJ.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eJ.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eJ.exists)(t, "operationPath") ? t.operationPath : void 0,
            done: (0, eJ.exists)(t, "done") ? t.done : void 0
        }
    }

    function tl(e, t) {
        return null == e ? e : {
            generationToken: (0, eJ.exists)(e, "generationToken") ? e.generationToken : void 0
        }
    }

    function td(e, t) {
        return null == e ? e : {
            count: (0, eJ.exists)(e, "count") ? e.count : void 0,
            countIsCapped: (0, eJ.exists)(e, "countIsCapped") ? e.countIsCapped : void 0,
            creatorEnabled: (0, eJ.exists)(e, "creatorEnabled") ? e.creatorEnabled : void 0,
            viewerCanRead: (0, eJ.exists)(e, "viewerCanRead") ? e.viewerCanRead : void 0,
            viewerCanWrite: (0, eJ.exists)(e, "viewerCanWrite") ? e.viewerCanWrite : void 0
        }
    }

    function tu(e, t) {
        return null == e ? e : {
            type: (0, eJ.exists)(e, "type") ? e.type : void 0,
            id: (0, eJ.exists)(e, "id") ? e.id : void 0
        }
    }

    function tc(e, t) {
        return null == e ? e : {
            counts: (0, eJ.exists)(e, "counts") ? e.counts : void 0,
            userReaction: (0, eJ.exists)(e, "userReaction") ? e.userReaction : void 0
        }
    }

    function tm(e, t) {
        return null == e ? e : {
            shareCount: (0, eJ.exists)(e, "shareCount") ? e.shareCount : void 0
        }
    }

    function tp(e, t) {
        var n;
        return null == e ? e : {
            type: (0, eJ.exists)(e, "type") ? e.type : void 0,
            experienceCta: (0, eJ.exists)(e, "experienceCta") ? null == (n = e.experienceCta) ? n : {
                experienceId: (0, eJ.exists)(n, "experienceId") ? n.experienceId : void 0,
                placeId: (0, eJ.exists)(n, "placeId") ? n.placeId : void 0
            } : void 0
        }
    }

    function th(e) {
        var t;
        return null == (t = e) ? t : {
            feedSessionId: (0, eJ.exists)(t, "feedSessionId") ? t.feedSessionId : void 0,
            entityId: (0, eJ.exists)(t, "entityId") ? t.entityId : void 0,
            entityType: (0, eJ.exists)(t, "entityType") ? t.entityType : void 0,
            id: (0, eJ.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eJ.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            channelId: (0, eJ.exists)(t, "channelId") ? t.channelId : void 0,
            type: (0, eJ.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eJ.exists)(t, "captionedAssetMoment") ? ts(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eJ.exists)(t, "primaryCta") ? tp(t.primaryCta) : void 0,
            owner: (0, eJ.exists)(t, "owner") ? tu(t.owner) : void 0,
            visibilityStatus: (0, eJ.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eJ.exists)(t, "reactions") ? tc(t.reactions) : void 0,
            comments: (0, eJ.exists)(t, "comments") ? td(t.comments) : void 0,
            stats: (0, eJ.exists)(t, "stats") ? tm(t.stats) : void 0
        }
    }

    function tv(e, t) {
        return null == e ? e : {
            feedItems: (0, eJ.exists)(e, "feedItems") ? e.feedItems : void 0,
            loaded: (0, eJ.exists)(e, "loaded") ? e.loaded : void 0,
            failed: (0, eJ.exists)(e, "failed") ? e.failed : void 0,
            moderated: (0, eJ.exists)(e, "moderated") ? e.moderated : void 0
        }
    }

    function tf(e, t) {
        return null == e ? e : {
            items: (0, eJ.exists)(e, "items") ? null === e.items ? null : e.items.map(th) : void 0,
            paginationContext: (0, eJ.exists)(e, "paginationContext") ? e.paginationContext : void 0,
            metadata: (0, eJ.exists)(e, "metadata") ? tv(e.metadata) : void 0
        }
    }

    function tx(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, eJ.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eJ.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            channelId: (0, eJ.exists)(t, "channelId") ? t.channelId : void 0,
            type: (0, eJ.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eJ.exists)(t, "captionedAssetMoment") ? ts(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eJ.exists)(t, "primaryCta") ? tp(t.primaryCta) : void 0,
            owner: (0, eJ.exists)(t, "owner") ? tu(t.owner) : void 0,
            visibilityStatus: (0, eJ.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eJ.exists)(t, "reactions") ? tc(t.reactions) : void 0,
            comments: (0, eJ.exists)(t, "comments") ? td(t.comments) : void 0,
            stats: (0, eJ.exists)(t, "stats") ? tm(t.stats) : void 0
        }
    }

    function tg(e) {
        var t;
        return null == (t = e) ? t : {
            startSeconds: (0, eJ.exists)(t, "startSeconds") ? t.startSeconds : void 0,
            endSeconds: (0, eJ.exists)(t, "endSeconds") ? t.endSeconds : void 0,
            text: (0, eJ.exists)(t, "text") ? t.text : void 0
        }
    }

    function tb(e, t) {
        return null == e ? e : {
            signingAlgorithmVersion: (0, eJ.exists)(e, "signingAlgorithmVersion") ? e.signingAlgorithmVersion : void 0,
            signature: (0, eJ.exists)(e, "signature") ? e.signature : void 0
        }
    }
    var ty = eJ.BaseAPI;

    function tI() {
        return null !== ty && ty.apply(this, arguments) || this
    }
    eQ(tI, ty), tI.prototype.backfillTriggerB1Raw = function(e, t) {
        return eX(this, void 0, void 0, function() {
            var n, i, a;
            return eZ(this, function(s) {
                switch (s.label) {
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
                        return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                }
            })
        })
    }, tI.prototype.backfillTriggerB1 = function() {
        return eX(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), eZ(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.backfillTriggerB1Raw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var tT = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eQ(t, e), t.prototype.contentCapturesBatchCheckExperienceUploadabilityRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.contentType && (n.contentType = e.contentType), void 0 !== e.experienceIds && (n.experienceIds = e.experienceIds), void 0 !== e.allowExternalExperiences && (n.allowExternalExperiences = e.allowExternalExperiences), i = {}, [4, this.request({
                                    path: "/v1/batch-check-experience-uploadability",
                                    schemaPath: "/v1/batch-check-experience-uploadability",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesBatchCheckExperienceUploadability = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesBatchCheckExperienceUploadabilityRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibilityRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.experienceId && (n.experienceId = e.experienceId), void 0 !== e.contentType && (n.contentType = e.contentType), i = {}, [4, this.request({
                                    path: "/v1/check-moments-eligibility",
                                    schemaPath: "/v1/check-moments-eligibility",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isEligible: (0, eJ.exists)(e, "isEligible") ? e.isEligible : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibility = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.token && (n.token = e.token), i = {}, [4, this.request({
                                    path: "/v1/check-upload-status",
                                    schemaPath: "/v1/check-upload-status",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return to(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatus = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.token && (n.token = e.token), i = {}, [4, this.request({
                                    path: "/v1/check-upload-status-rcc",
                                    schemaPath: "/v1/check-upload-status-rcc",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return to(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatusRcc = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a, s;
                    return eZ(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eJ.canConsumeForm)([{
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
                                return s = o.sent(), [2, new eJ.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        operationId: (0, eJ.exists)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCreateInfluencerMomentFromVideo = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
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
                                return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesGrantExperiencePermissions = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesGrantExperiencePermissionsRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadataRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
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
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return tb(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadata = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a, s;
                    return eZ(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eJ.canConsumeForm)([{
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
                                return s = o.sent(), [2, new eJ.JSONApiResponse(s, function(e) {
                                    return tb(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignFileAndMetadataInternal = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
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
                                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(te),
                                                                    stickerOverlays: void 0 === e.stickerOverlays ? void 0 : null === e.stickerOverlays ? null : e.stickerOverlays.map(e9),
                                                                    ttsAudios: void 0 === e.ttsAudios ? void 0 : null === e.ttsAudios ? null : e.ttsAudios.map(tn)
                                                                }
                                                            }(e.edits)
                                                        }
                                                    }(e.metadata),
                                                    feedRegistrationInfo: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            attributes: void 0 === e.attributes ? void 0 : null === e.attributes ? null : e.attributes.map(e8),
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
                                return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesUploadCaptureWithAsset = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesUploadCaptureWithAssetRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(eJ.BaseAPI),
        tC = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            eQ(t, e), t.prototype.moderationApplyModerationDecisionRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
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
                                return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationApplyModerationDecision = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationApplyModerationDecisionRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.moderationReportMomentRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eJ.RequiredError("momentId", "Required parameter requestParameters.momentId was null or undefined when calling moderationReportMoment.");
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
                                return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationReportMoment = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    return eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationReportMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(eJ.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            eQ(t, e), t.prototype.momentTextGenerationCreateMomentVideoUploadUrlRaw = function(e) {
                return eX(this, void 0, void 0, function() {
                    var t, n, i;
                    return eZ(this, function(a) {
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
                                return i = a.sent(), [2, new eJ.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        uploadUrl: (0, eJ.exists)(e, "uploadUrl") ? e.uploadUrl : void 0,
                                        videoObjectKey: (0, eJ.exists)(e, "videoObjectKey") ? e.videoObjectKey : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationCreateMomentVideoUploadUrl = function(e) {
                return eX(this, void 0, void 0, function() {
                    return eZ(this, function(t) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
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
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return tl(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentText = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.captureType && (n.captureType = e.captureType), i = {}, [4, this.request({
                                    path: "/v1/generate-moment-text-with-video",
                                    schemaPath: "/v1/generate-moment-text-with-video",
                                    method: "POST",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return tl(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentTextWithVideo = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.token && (n.token = e.token), i = {}, [4, this.request({
                                    path: "/v1/moment-text-generation-status",
                                    schemaPath: "/v1/moment-text-generation-status",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        status: (0, eJ.exists)(e, "status") ? e.status : void 0,
                                        result: (0, eJ.exists)(e, "result") ? null == (t = e.result) ? t : {
                                            summary: (0, eJ.exists)(t, "summary") ? t.summary : void 0,
                                            description: (0, eJ.exists)(t, "description") ? t.description : void 0,
                                            error: (0, eJ.exists)(t, "error") ? t.error : void 0,
                                            segments: (0, eJ.exists)(t, "segments") ? null === t.segments ? null : t.segments.map(tg) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGetMomentTextGenerationStatus = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
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
                                return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationSubmitMomentGeneratedTextFeedback = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentTextGenerationSubmitMomentGeneratedTextFeedbackRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(eJ.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eQ(t, e), t.prototype.momentsCleanUserDataRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
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
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        notificationId: (0, eJ.exists)(e, "NotificationId") ? e.NotificationId : void 0,
                                        eventType: (0, eJ.exists)(e, "EventType") ? e.EventType : void 0,
                                        eventTime: (0, eJ.exists)(e, "EventTime") ? new Date(e.EventTime) : void 0,
                                        eventPayload: (0, eJ.exists)(e, "EventPayload") ? null == (t = e.EventPayload) ? t : {
                                            userId: (0, eJ.exists)(t, "UserId") ? t.UserId : void 0,
                                            gameIds: (0, eJ.exists)(t, "GameIds") ? t.GameIds : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsCleanUserData = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eJ.RequiredError("momentId", "Required parameter requestParameters.momentId was null or undefined when calling momentsDeleteMoment.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/{momentId}".replace("{".concat("momentId", "}"), encodeURIComponent(String(e.momentId))),
                                    schemaPath: "/v2/moments/{momentId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMoment = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    return eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItemRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.feedItemId || void 0 === e.feedItemId) throw new eJ.RequiredError("feedItemId", "Required parameter requestParameters.feedItemId was null or undefined when calling momentsDeleteMomentByFeedItem.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/by-feed-item/{feedItemId}".replace("{".concat("feedItemId", "}"), encodeURIComponent(String(e.feedItemId))),
                                    schemaPath: "/v2/moments/by-feed-item/{feedItemId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItem = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    return eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentByFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendationsRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.paginationContext && (n.PaginationContext = e.paginationContext), void 0 !== e.locationId && (n.LocationId = e.locationId), void 0 !== e.count && (n.Count = e.count), void 0 !== e.signals && (n.Signals = e.signals), i = {}, [4, this.request({
                                    path: "/v2/moments/get-moment-recommendations",
                                    schemaPath: "/v2/moments/get-moment-recommendations",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return tf(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendations = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, e.ids && (n.Ids = e.ids), void 0 !== e.type && (n.type = e.type), i = {}, [4, this.request({
                                    path: "/v2/moments/get-moments",
                                    schemaPath: "/v2/moments/get-moments",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eJ.exists)(e, "items") ? null === e.items ? null : e.items.map(tx) : void 0,
                                        failedMomentIds: (0, eJ.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eJ.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMoments = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.targetUserId && (n.TargetUserId = e.targetUserId), void 0 !== e.paginationContext && (n.PaginationContext = e.paginationContext), void 0 !== e.count && (n.Count = e.count), e.filterBy && (n.FilterBy = e.filterBy), i = {}, [4, this.request({
                                    path: "/v2/moments/get-users-moments",
                                    schemaPath: "/v2/moments/get-users-moments",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eJ.exists)(e, "items") ? null === e.items ? null : e.items.map(tx) : void 0,
                                        failedMomentIds: (0, eJ.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eJ.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0,
                                        paginationContext: (0, eJ.exists)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, eJ.exists)(e, "metadata") ? tv(e.metadata) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetUsersMoments = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
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
                                return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItem = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2Raw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
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
                                return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2 = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemV2Raw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsSearchMomentsRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.q && (n.q = e.q), void 0 !== e.paginationContext && (n.paginationContext = e.paginationContext), void 0 !== e.locationId && (n.locationId = e.locationId), void 0 !== e.count && (n.count = e.count), i = {}, [4, this.request({
                                    path: "/v2/moments/search-moments",
                                    schemaPath: "/v2/moments/search-moments",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return tf(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentsSearchMoments = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var t, n, i;
                    return eZ(this, function(a) {
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
                                return i = a.sent(), [2, new eJ.VoidApiResponse(i)]
                        }
                    })
                })
            }, t.prototype.momentsTestSuppressOwnedFeedItems = function(e) {
                return eX(this, void 0, void 0, function() {
                    return eZ(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.momentsTestSuppressOwnedFeedItemsRaw(e)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, t
        }(eJ.BaseAPI)),
        tw = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eQ(t, e), t.prototype.postsCompletePostRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/complete-post",
                                    schemaPath: "/v1/complete-post",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            uploads: void 0 === e.uploads ? void 0 : null === e.uploads ? null : e.uploads.map(e0)
                                        }
                                    }(e.postsCompletePostRequest)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        uploads: (0, eJ.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(tr) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsCompletePost = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
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
                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(e4),
                                                    textToSpeech: void 0 === e.textToSpeech ? void 0 : null === e.textToSpeech ? null : e.textToSpeech.map(e5),
                                                    contentLanguage: e.contentLanguage
                                                }
                                            }(e.common),
                                            videoPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    video: e1(e.video),
                                                    durationSeconds: e.durationSeconds,
                                                    trim: e2(e.trim)
                                                }
                                            }(e.videoPost),
                                            screenshotPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    screenshot: e1(e.screenshot),
                                                    widthPixels: e.widthPixels,
                                                    heightPixels: e.heightPixels
                                                }
                                            }(e.screenshotPost),
                                            influencerVideoPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    video: e1(e.video),
                                                    durationSeconds: e.durationSeconds,
                                                    trim: e2(e.trim)
                                                }
                                            }(e.influencerVideoPost)
                                        }
                                    }(e.postsCreatePostRequest)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        post: (0, eJ.exists)(e, "post") ? null == (t = e.post) ? t : {
                                            operationId: (0, eJ.exists)(t, "operationId") ? t.operationId : void 0
                                        } : void 0,
                                        uploads: (0, eJ.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(ta) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsCreatePost = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
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
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new eJ.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling postsGetPostOperationStatus.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eJ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        path: (0, eJ.exists)(e, "path") ? e.path : void 0,
                                        done: (0, eJ.exists)(e, "done") ? e.done : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsGetPostOperationStatus = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    return eZ(this, function(n) {
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
        }(eJ.BaseAPI),
        tS = eJ.BaseAPI;

    function tA() {
        return null !== tS && tS.apply(this, arguments) || this
    }
    eQ(tA, tS), tA.prototype.testSeedCreatePostAssetRaw = function(e, t) {
        return eX(this, void 0, void 0, function() {
            var n, i, a;
            return eZ(this, function(s) {
                switch (s.label) {
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
                        return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                }
            })
        })
    }, tA.prototype.testSeedCreatePostAsset = function() {
        return eX(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), eZ(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedCreatePostAssetRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tA.prototype.testSeedInspectPostRaw = function(e, t) {
        return eX(this, void 0, void 0, function() {
            var n, i, a;
            return eZ(this, function(s) {
                switch (s.label) {
                    case 0:
                        return n = {}, void 0 !== e.id && (n.id = e.id), void 0 !== e.type && (n.type = e.type), i = {}, [4, this.request({
                            path: "/v2/moments/test/inspect-post",
                            schemaPath: "/v2/moments/test/inspect-post",
                            method: "GET",
                            headers: i,
                            query: n
                        }, t)];
                    case 1:
                        return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                }
            })
        })
    }, tA.prototype.testSeedInspectPost = function() {
        return eX(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), eZ(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedInspectPostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tA.prototype.testSeedListUserMomentsRaw = function(e) {
        return eX(this, void 0, void 0, function() {
            var t, n, i;
            return eZ(this, function(a) {
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
                        return i = a.sent(), [2, new eJ.VoidApiResponse(i)]
                }
            })
        })
    }, tA.prototype.testSeedListUserMoments = function(e) {
        return eX(this, void 0, void 0, function() {
            return eZ(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.testSeedListUserMomentsRaw(e)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    }, tA.prototype.testSeedMomentToPostRaw = function(e, t) {
        return eX(this, void 0, void 0, function() {
            var n, i, a;
            return eZ(this, function(s) {
                switch (s.label) {
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
                        return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                }
            })
        })
    }, tA.prototype.testSeedMomentToPost = function() {
        return eX(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), eZ(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedMomentToPostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tA.prototype.testSeedSeedBatchRaw = function(e, t) {
        return eX(this, void 0, void 0, function() {
            var n, i, a;
            return eZ(this, function(s) {
                switch (s.label) {
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
                        return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                }
            })
        })
    }, tA.prototype.testSeedSeedBatch = function() {
        return eX(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), eZ(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedSeedBatchRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tA.prototype.testSeedSeedMomentRaw = function(e, t) {
        return eX(this, void 0, void 0, function() {
            var n, i, a;
            return eZ(this, function(s) {
                switch (s.label) {
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
                        return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                }
            })
        })
    }, tA.prototype.testSeedSeedMoment = function() {
        return eX(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), eZ(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedSeedMomentRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tA.prototype.testSeedWirePostRaw = function(e, t) {
        return eX(this, void 0, void 0, function() {
            var n, i, a;
            return eZ(this, function(s) {
                switch (s.label) {
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
                        return a = s.sent(), [2, new eJ.VoidApiResponse(a)]
                }
            })
        })
    }, tA.prototype.testSeedWirePost = function() {
        return eX(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), eZ(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedWirePostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var tM = e.i(272593);
    let tj = (0, tM.createClientConfiguration)("content-captures-api", "bedev2"),
        tE = new tT(tj),
        tP = new tC(tj),
        tk = new tw(tj),
        tL = Object.assign(tE, {
            momentsGetUsersMoments: e => tP.momentsGetUsersMoments(e),
            momentsDeleteMoment: e => tP.momentsDeleteMoment(e),
            momentsDeleteMomentByFeedItem: e => tP.momentsDeleteMomentByFeedItem(e),
            postsCreatePost: e => tk.postsCreatePost(e),
            postsCompletePost: e => tk.postsCompletePost(e)
        });
    var tR = e.i(773057),
        tN = e.i(227987),
        tO = e.i(889311),
        tD = e.i(215955),
        tU = ((t = {}).ListMoments = "listMoments", t.FetchNextPage = "fetchNextPage", t.UploadVideo = "uploadVideo", t.ValidateVideo = "validateVideo", t.PersistLocalVideo = "persistLocalVideo", t.PublishMoment = "publishMoment", t.DeleteMoment = "deleteMoment", t.ResolveExperience = "resolveExperience", t.LoadLocalVideoMedia = "loadLocalVideoMedia", t.EnrichExperienceNames = "enrichExperienceNames", t.CopyShareLink = "copyShareLink", t);
    let tB = (e, t) => {
            let n;
            return null != t.momentId && (e.momentId = t.momentId), null != t.feedItemId && (e.feedItemId = t.feedItemId), null != t.draftId && (e.draftId = t.draftId), null != t.experienceId && (e.experienceId = String(t.experienceId)), null != t.placeId && (e.placeId = String(t.placeId)), null != t.fileCount && (e.fileCount = String(t.fileCount)), null != t.fileSize && (e.fileSize = String(t.fileSize)), null != t.fileType && t.fileType.length > 0 && (e.fileType = t.fileType), null != t.locale && t.locale.length > 0 && (e.locale = t.locale), null != t.inputValue && t.inputValue.length > 0 && (e.inputValue = (n = t.inputValue).length <= 200 ? n : n.slice(0, 200)), null != t.idType && (e.idType = t.idType), null != t.matchedId && (e.matchedId = String(t.matchedId)), null != t.userId && (e.userId = String(t.userId)), null != t.pageCount && (e.pageCount = String(t.pageCount)), null != t.momentCount && (e.momentCount = String(t.momentCount)), null != t.persistedVideoCount && (e.persistedVideoCount = String(t.persistedVideoCount)), null != t.isLocalMoment && (e.isLocalMoment = String(t.isLocalMoment)), null != t.universeIdCount && (e.universeIdCount = String(t.universeIdCount)), e
        },
        tz = async (e, t) => {
            var n;
            let i = await (0, tN.default)(e),
                a = e instanceof Error ? e.message : "string" == typeof e ? e : "Unknown error";
            return i ? {
                reason: null != (n = null != t ? t : i.message) ? n : a,
                httpStatus: i.status,
                errorCode: i.code
            } : {
                reason: null != t ? t : a
            }
        }, tq = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return {
                eventName: tO.default.MomentsCreationsError,
                parameters: tB({
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
        }, tF = async function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tD.default,
                a = await tz(t, n.reason);
            i.logErrorEvent(tq(e, a, n))
        }, tV = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tD.default;
            tF(e, t, n, i)
        }, tG = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: tO.default.MomentsCreationsAttempt,
                parameters: tB({
                    operation: e
                }, t)
            }
        }, t_ = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: tO.default.MomentsCreationsSuccess,
                parameters: tB({
                    operation: e
                }, t)
            }
        }, tH = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tD.default;
            n.logClickEvent(tG(e, t))
        }, tK = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tD.default;
            n.logImpressionEvent(t_(e, t))
        };
    var tW = e.i(773595);
    let tJ = tW.availableDocsLocales,
        tY = new Set(tJ),
        tQ = e => {
            let t = e === u.Locale.SimplifiedChineseJV ? u.Locale.SimplifiedChinese : e;
            return null != t && tY.has(t) ? t : u.Locale.English
        },
        tX = (e, t) => {
            var n;
            return null != (n = e.locale) ? n : tQ(t)
        },
        tZ = e => null != e ? (0, u.toLocaleNativeName)(e) : "-",
        t$ = {
            active: eh,
            captionedassetmoment: eh,
            live: eh,
            moderated: ex,
            pending: ev,
            published: eh
        },
        t0 = new Date(0).toISOString(),
        t1 = function(e) {
            var t, n, i, a, s, o, r;
            let l = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                d = null != (t = e.id) ? t : void 0,
                u = null != (n = e.feedItemId) ? n : void 0,
                c = l ? u : d;
            if (null == c || "" === c) return null;
            let m = null != (i = null == (s = e.type) ? void 0 : s.toLowerCase()) ? i : "";
            if ("draft" === m || m.includes("draft")) return null;
            let p = e.captionedAssetMoment,
                h = null == (r = e.primaryCta) || null == (o = r.experienceCta) ? void 0 : o.experienceId,
                v = (e => {
                    if (null != e && "" !== e) return tW.StringLocaleMap.get(e.toLowerCase())
                })(null == p ? void 0 : p.videoContentLanguage);
            return {
                momentId: d,
                feedItemId: u,
                assetId: null == p ? void 0 : p.assetId,
                description: null != (a = null == p ? void 0 : p.caption) ? a : "",
                experienceName: "",
                modifiedAt: t0,
                status: (e => {
                    if (!e) return eh;
                    let t = t$[e.toLowerCase()];
                    if (t) return t;
                    let n = e.toLowerCase();
                    return n.includes("pending") ? ev : (n.includes("active") || n.includes("publish") || n.includes("live"), eh)
                })(e.type),
                universeId: h,
                ...null != v ? {
                    locale: v
                } : {}
            }
        },
        t2 = function(e) {
            var t;
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return (null != (t = e.items) ? t : []).map(e => t1(e, n)).filter(e => null != e)
        },
        t4 = async (e, t) => tL.momentsGetUsersMoments({
            targetUserId: e,
            paginationContext: null == t ? void 0 : t.paginationContext,
            count: 25
        }), t5 = async e => {
            let t = [...new Set(e.map(e => e.universeId).filter(e => null != e && e > 0))];
            if (0 === t.length) return e;
            try {
                tH(tU.EnrichExperienceNames, {
                    universeIdCount: t.length
                });
                let {
                    data: n = []
                } = await tR.default.getUniversesDetails(t), i = new Map(n.filter(e => null != e.id && "string" == typeof e.name && e.name.length > 0).map(e => [e.id, e.name])), a = e.map(e => {
                    var t;
                    let n = null != e.universeId && null != (t = i.get(e.universeId)) ? t : "";
                    return n === e.experienceName ? e : {
                        ...e,
                        experienceName: n
                    }
                });
                return tK(tU.EnrichExperienceNames, {
                    universeIdCount: t.length
                }), a
            } catch (n) {
                return tV(tU.EnrichExperienceNames, n, {
                    universeIdCount: t.length
                }), e
            }
        }, t8 = async function(e, t) {
            var n, i;
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                s = (null == t ? void 0 : t.paginationContext) != null ? tU.FetchNextPage : tU.ListMoments;
            tH(s, {
                userId: e
            });
            let o = await t4(e, t),
                r = t2(o, a),
                l = await t5(r);
            return tK(s, {
                userId: e,
                pageCount: null != (n = null == t ? void 0 : t.pageNumber) ? n : 1,
                momentCount: l.length
            }), {
                moments: l,
                paginationContext: null != (i = o.paginationContext) ? i : void 0
            }
        }, t3 = async e => {
            let {
                experienceId: t,
                experienceName: n,
                rootPlaceId: i,
                locale: a,
                onProgress: s
            } = e;
            for (let e = 1; e <= 10; e += 1) await new Promise(e => {
                setTimeout(e, 100)
            }), null == s || s(e / 10);
            return {
                draftId: "u" > typeof crypto && "function" == typeof crypto.randomUUID ? crypto.randomUUID() : "moment-".concat(Date.now(), "-").concat(Math.random().toString(36).slice(2, 9)),
                experienceId: t,
                rootPlaceId: i,
                experienceName: n,
                description: "",
                modifiedAt: new Date().toISOString(),
                status: ef,
                ...null != a ? {
                    locale: a
                } : {}
            }
        };
    async function t6(e) {
        let {
            feedItemId: t,
            momentId: n,
            useFeedItemId: i = !1
        } = e;
        if (i) {
            if (null == t || "" === t) throw Error("Moment feed item id is required before deleting");
            await tL.momentsDeleteMomentByFeedItem({
                feedItemId: t
            });
            return
        }
        if (null == n || "" === n) throw Error("Moment id is required before deleting");
        await tL.momentsDeleteMoment({
            momentId: n
        })
    }
    var t9 = e.i(408068);
    async function t7(e) {
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
    let ne = "influencerVideo";
    async function nt(e) {
        let t = t9.md5.create();
        for (let n = 0; n < e.size; n += 5242880) {
            let i = Math.min(n + 5242880, e.size);
            t.update(await e.slice(n, i).arrayBuffer())
        }
        return t.hex()
    }
    async function nn(e, t) {
        let n = [];
        for (let [s, o] of e.entries()) {
            var i, a;
            let e = null != (i = o.chunkNum) ? i : s + 1;
            if (!o.url) throw Error("Pre-signed upload URL is missing for video chunk ".concat(e));
            let r = Number(o.contentStart),
                l = Number(o.contentLength),
                d = t.slice(r, r + l);
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
    async function ni(e) {
        let {
            moment: t,
            file: n,
            displayName: i,
            uiLocale: a,
            sendVideoContentLanguage: s = !0
        } = e, o = await t7(n), r = {
            metadata: {
                captureType: "Video",
                description: t.description,
                universeId: t.experienceId,
                placeId: t.rootPlaceId,
                assetTotalDuration: o,
                edits: {}
            },
            feedRegistrationInfo: {
                contentType: "moment",
                duration: o,
                attributes: [],
                customTags: []
            }
        }, l = (await tL.contentCapturesCreateInfluencerMomentFromVideo({
            files: [n],
            name: i,
            description: t.description,
            universeId: t.experienceId,
            momentPublishData: JSON.stringify(r),
            ...s ? {
                videoContentLanguage: tX(t, a).toLowerCase()
            } : {}
        })).operationId;
        if (null == l || "" === l) throw Error("Publish operation id is missing from the response");
        return {
            operationId: l
        }
    }
    async function na(e) {
        var t, n, i, a, s;
        let {
            moment: o,
            file: r,
            displayName: l,
            uiLocale: d,
            sendVideoContentLanguage: u = !0
        } = e, c = await t7(r), m = await nt(r), p = {
            caption: o.description,
            ...u ? {
                contentLanguage: tX(o, d).toLowerCase()
            } : {},
            primaryCta: {
                experience: {
                    universeId: o.experienceId,
                    placeId: o.rootPlaceId
                }
            }
        }, h = await tL.postsCreatePost({
            postsCreatePostRequest: {
                common: p,
                influencerVideoPost: {
                    video: {
                        encryptedCreationContext: "",
                        file: {
                            contentType: "" !== r.type ? r.type : r.name.toLowerCase().endsWith(".mov") ? "video/quicktime" : "video/mp4",
                            filesizeBytes: r.size,
                            md5Checksum: m,
                            chunkPlan: function(e) {
                                let t = [];
                                for (let n = 0; n < e; n += 5242880) t.push(Math.min(5242880, e - n));
                                return t
                            }(r.size)
                        },
                        displayName: l,
                        description: o.description
                    },
                    durationSeconds: c
                }
            }
        }), v = null == (i = h.post) ? void 0 : i.operationId;
        if (null == v || "" === v) throw Error("Publish operation id is missing from the response");
        let f = null != (t = null == (a = h.uploads) ? void 0 : a.find(e => e.role === ne)) ? t : null == (s = h.uploads) ? void 0 : s[0];
        if (!(null == f ? void 0 : f.operationId)) throw Error("Create post response is missing the video upload target");
        let x = null != (n = f.uploadUrls) ? n : [];
        if (0 === x.length) throw Error("Create post response did not return any upload URLs");
        let g = await nn(x, r);
        return await tL.postsCompletePost({
            postsCompletePostRequest: {
                uploads: [{
                    role: ne,
                    operationId: f.operationId,
                    parts: g
                }]
            }
        }), {
            operationId: v
        }
    }
    async function ns(e) {
        if (!e.moment.experienceId) throw Error("Moment experience is required before publishing");
        if (0 === e.file.size) throw Error("Moment video file must not be empty");
        return e.usePostCreation ? na(e) : ni(e)
    }
    var no = eJ;
    let nr = "/v2/get-or-create-static";
    class nl extends no.BaseAPI {
        async createStaticLink(e) {
            let t;
            if ("" === e.feedItemId) throw Error("Moment feed item id is required before creating a share link");
            let n = await this.request({
                    method: "POST",
                    path: nr,
                    schemaPath: nr,
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
                i = await new no.JSONApiResponse(n).value();
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
    let nd = new nl((0, tM.createClientConfiguration)("deeplinks", "bedev2")),
        nu = () => {
            let {
                ready: e,
                value: t
            } = (0, d.useFlag)(T.isMomentsFeedIdEnabled);
            return e && null != t && t
        },
        nc = () => {
            let {
                ready: e,
                value: t
            } = (0, d.useFlag)(T.isMomentsUploadLanguageSelectEnabled);
            return e && null != t && t
        },
        nm = e => {
            var t, n;
            return e.status === ef ? e.draftId : null != (t = null != (n = e.feedItemId) ? n : e.momentId) ? t : ""
        },
        np = e => ["momentsCreations", e],
        nh = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return [...np(e), t]
        },
        nv = () => {
            let e, [{
                    momentStatus: t
                }, n] = (0, en.useQueryParams)(["momentStatus"]),
                i = (0, e_.useQueryClient)(),
                {
                    user: s
                } = (0, V.useAuthentication)();
            return {
                statusTab: "string" == typeof(e = null == t ? void 0 : Array.isArray(t) ? t[0] : t) && eg.some(t => t === e) ? e : ef,
                setStatusTab: (0, a.useCallback)(e => {
                    n({
                        momentStatus: e
                    }), e === eh && i.invalidateQueries({
                        queryKey: np(null == s ? void 0 : s.id)
                    })
                }, [i, n, null == s ? void 0 : s.id])
            }
        },
        nf = async (e, t, n, i) => {
            let a = {
                draftId: t,
                fileSize: n.size,
                fileType: n.type
            };
            tH(tU.PersistLocalVideo, a);
            try {
                let s, o, {
                    evictedMediaDraftIds: r
                } = await eP(e, t, n, (s = eF(window.localStorage.getItem(em(e))), o = new Set(i.map(e => e.draftId)), [...i, ...s.filter(e => !o.has(e.draftId))]));
                return tK(tU.PersistLocalVideo, a), {
                    hasLocalVideo: !0,
                    storageEvictedMediaDraftIds: r
                }
            } catch (e) {
                return tV(tU.PersistLocalVideo, e, {
                    draftId: t,
                    fileSize: n.size,
                    fileType: n.type
                }), {
                    hasLocalVideo: !1,
                    storageEvictedMediaDraftIds: []
                }
            }
        };
    var nx = e.i(137785);
    let ng = (0, u.withTranslation)(e => {
        let {
            experience: t,
            hideTitle: n = !1,
            onChangeExperience: a
        } = e, {
            translate: s
        } = (0, u.useTranslation)();
        return (0, i.jsxs)("div", {
            className: "flex flex-col gap-y-xsmall width-full",
            children: [n ? null : (0, i.jsxs)("div", {
                className: "flex flex-row items-center justify-between",
                children: [(0, i.jsx)("span", {
                    className: "text-body-small content-muted",
                    children: s("CreateMomentModal.Preview.Title")
                }), a && (0, i.jsx)(er.Button, {
                    variant: "Link",
                    size: "Small",
                    onClick: a,
                    children: s("Action.EEChange")
                })]
            }), (0, i.jsx)("div", {
                className: "padding-medium radius-medium bg-surface-200 width-full",
                children: (0, i.jsx)(nx.default, {
                    disableLink: !0,
                    target: t,
                    targetType: "Experience",
                    variant: "medium"
                })
            })]
        })
    }, [ei.TranslationNamespace.Creations]);
    var nb = e.i(809166),
        ny = e.i(392782);
    let nI = "UniverseId",
        nT = "PlaceId",
        nC = /(?:https?:\/\/)?create\.roblox\.com\/dashboard\/creations\/experiences\/(\d+)/,
        nw = /(?:https?:\/\/)?(?:www\.)?roblox\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
        nS = /^\d+$/,
        nA = [{
            regex: /(?:https?:\/\/)?create\.sitetest\d\.robloxlabs\.com\/dashboard\/creations\/experiences\/(\d+)/,
            idType: nI
        }, {
            regex: /(?:https?:\/\/)?(?:www\.)?sitetest\d\.robloxlabs\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
            idType: nT
        }],
        nM = (0, u.withTranslation)(e => {
            let {
                onExperienceResolved: t,
                isDisabled: n = !1
            } = e, {
                translate: s
            } = (0, u.useTranslation)(), {
                ready: o,
                value: r
            } = (0, d.useFlag)(T.isMomentsSitetestUrlParsingEnabled), [l, c] = (0, a.useState)(""), [m, p] = (0, a.useState)(!1), [h, v] = (0, a.useState)(), f = (0, a.useMemo)(() => [{
                regex: nC,
                idType: nI
            }, {
                regex: nw,
                idType: nT
            }, ...o && null != r && r ? nA : [], {
                regex: nS,
                idType: nI
            }], [r, o]), x = (0, a.useMemo)(() => l.trim().length > 0 && f.some(e => {
                let {
                    regex: t
                } = e;
                return t.test(l.trim())
            }), [f, l]), g = (0, a.useCallback)(async () => {
                var e, n, i, a, o, r;
                let d = l.trim(),
                    u = f.find(e => {
                        let {
                            regex: t
                        } = e;
                        return t.test(d)
                    });
                if (!u) return;
                let m = u.idType === nI && nS.test(d) ? Number(d) : Number(null == (e = u.regex.exec(d)) ? void 0 : e[1]);
                if (!m || !Number.isFinite(m)) return;
                let h = {
                    inputValue: d,
                    idType: u.idType,
                    matchedId: m
                };
                p(!0), v(void 0), tH(tU.ResolveExperience, h);
                try {
                    let e;
                    if (u.idType === nT) {
                        let t = null == (r = (await ny.default.multigetPlaceDetails([m]))[0]) ? void 0 : r.universeId;
                        if (!t) {
                            tV(tU.ResolveExperience, "Experience not found", {
                                ...h,
                                placeId: m,
                                reason: "ExperienceNotFound"
                            }), v(s("Error.ExperienceNotFound")), p(!1);
                            return
                        }
                        e = t
                    } else e = m;
                    let l = null == (o = (await ny.default.getDetails([e])).data) ? void 0 : o[0];
                    if (!(null == l ? void 0 : l.id)) {
                        tV(tU.ResolveExperience, "Experience not found", {
                            ...h,
                            experienceId: e,
                            reason: "ExperienceNotFound"
                        }), v(s("Error.ExperienceNotFound")), p(!1);
                        return
                    }
                    t({
                        id: l.id,
                        name: null != (n = l.name) ? n : void 0,
                        description: null != (i = l.description) ? i : void 0,
                        rootPlaceId: null != (a = l.rootPlaceId) ? a : void 0
                    }), tK(tU.ResolveExperience, {
                        ...h,
                        experienceId: l.id,
                        placeId: u.idType === nT ? m : void 0
                    }), c("")
                } catch (e) {
                    tV(tU.ResolveExperience, e, {
                        ...h,
                        placeId: u.idType === nT ? m : void 0,
                        experienceId: u.idType === nI ? m : void 0
                    }), v(s("Error.ExperienceNotFound"))
                } finally {
                    p(!1)
                }
            }, [t, f, s, l]), b = (0, a.useCallback)(e => {
                "Enter" === e.key && x && (g(), e.preventDefault())
            }, [x, g]);
            return (0, i.jsxs)("div", {
                className: "flex flex-row gap-x-medium items-end width-full",
                children: [(0, i.jsx)("div", {
                    className: "grow-1 min-width-0",
                    children: (0, i.jsx)(nb.TextInput, {
                        label: s("CreateMomentModal.ExperienceInput.Label"),
                        placeholder: s("CreateMomentModal.ExperienceInput.Placeholder"),
                        value: l,
                        onChange: e => {
                            c(e.target.value), v(void 0)
                        },
                        onKeyDown: b,
                        hasError: null != h,
                        error: h,
                        isDisabled: n || m,
                        size: "Medium"
                    })
                }), (0, i.jsx)(er.Button, {
                    variant: "Emphasis",
                    size: "Medium",
                    className: h ? "margin-bottom-[22px]" : void 0,
                    isDisabled: !x || m,
                    isLoading: m,
                    onClick: () => {
                        g()
                    },
                    children: s("Action.Add")
                })]
            })
        }, [ei.TranslationNamespace.Creations, ei.TranslationNamespace.Controls]);
    var nj = e.i(108872),
        nE = e.i(152324);
    let nP = (0, u.withTranslation)(e => {
        let {
            value: t,
            onChange: n,
            isDisabled: s = !1
        } = e, {
            translate: o
        } = (0, u.useTranslation)(), r = o("CreateMomentModal.LanguageInput.Label"), l = o("CreateMomentModal.LanguageInput.Placeholder"), d = (0, a.useCallback)(e => {
            tY.has(e) && n(e)
        }, [n]);
        return (0, i.jsx)("div", {
            className: "width-full",
            "data-testid": "moments-language-select",
            children: (0, i.jsx)(nj.Dropdown, {
                className: "width-full [&_.content-system-alert]:text-caption-medium",
                size: "Medium",
                label: r,
                ariaLabel: r,
                placeholder: l,
                value: t,
                isDisabled: s,
                onValueChange: d,
                children: (0, i.jsx)(nE.Menu, {
                    children: (0, i.jsx)(nE.MenuSection, {
                        children: tJ.map(e => (0, i.jsx)(nE.MenuItem, {
                            value: e,
                            title: (0, u.toLocaleNativeName)(e),
                            trailing: t === e && (0, i.jsx)(E.Icon, {
                                name: "icon-filled-check",
                                size: "Medium"
                            })
                        }, e))
                    })
                })
            })
        })
    }, [ei.TranslationNamespace.Creations]);
    var nk = e.i(321211);
    let nL = ["mp4", "mov"],
        nR = ["video/mp4", "video/quicktime"];
    var nN = ((n = {}).FileTooBig = "FileTooBig", n.FileWrongType = "FileWrongType", n.DurationExceeded = "DurationExceeded", n.ResolutionExceeded = "ResolutionExceeded", n.MetadataUnavailable = "MetadataUnavailable", n);
    let nO = e => {
            var t, n;
            let i;
            return e.size > 0xc800000 ? "FileTooBig" : null != (i = null == (n = (t = e).name.split(".").pop()) ? void 0 : n.toLowerCase()) && nL.some(e => e === i) && ("" === t.type || nR.includes(t.type)) ? null : "FileWrongType"
        },
        nD = async e => {
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
        }, nU = async e => {
            let t = [],
                n = [];
            for (let i of e) {
                let e = nO(i);
                if (null != e) {
                    n.push({
                        file: i,
                        reason: e
                    });
                    continue
                }
                let a = await nD(i);
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
        }, nB = nL.map(e => e.toUpperCase()).join("/"), nz = (0, u.withTranslation)(e => {
            let {
                hasSelectedExperience: t,
                hasSelectedLanguage: n,
                selectedFiles: s,
                isUploading: o = !1,
                onFilesChange: r,
                onValidationErrorsChange: l
            } = e, {
                translate: d
            } = (0, u.useTranslation)(), [c, m] = (0, a.useState)(!1), p = d("CreateMomentModal.DropTarget.UploadButton"), h = d("CreateMomentModal.DropTarget.NoExperienceAddedText"), v = d("CreateMomentModal.DropTarget.ExperienceAddedText"), [f, x] = (0, a.useState)(!1), g = t && n, b = t ? v : h, y = (0, a.useRef)(r), I = (0, a.useRef)(l), T = (0, a.useRef)(d);
            y.current = r, I.current = l, T.current = d;
            let C = (0, a.useCallback)(async e => {
                    var t, n, i, a;
                    if (x(!1), !g || o || c) return;
                    let s = Array.from(null != e ? e : []);
                    if (0 !== s.length) {
                        null == (t = I.current) || t.call(I, []), m(!0);
                        try {
                            let {
                                validFiles: e,
                                errors: t
                            } = await nU(s);
                            if (t.length > 0) {
                                for (let {
                                        file: e,
                                        reason: n
                                    }
                                    of t) tV(tU.ValidateVideo, n, {
                                    fileSize: e.size,
                                    fileType: e.type,
                                    reason: n
                                });
                                null == (n = I.current) || n.call(I, (i = T.current, a = t.map(e => {
                                    let {
                                        reason: t
                                    } = e;
                                    return t
                                }), [...new Set(a)].map(e => ((e, t) => {
                                    switch (t) {
                                        case nN.FileTooBig:
                                            return e("CreateMomentModal.Error.FileTooBigMegabytes", {
                                                maxFileSizeMB: new Intl.NumberFormat().format(200)
                                            });
                                        case nN.FileWrongType:
                                            return e("CreateMomentModal.Error.FileWrongType", {
                                                formats: nB
                                            });
                                        case nN.DurationExceeded:
                                            return e("CreateMomentModal.Error.DurationExceeded", {
                                                maxDurationMinutes: String(5)
                                            });
                                        case nN.ResolutionExceeded:
                                            return e("CreateMomentModal.Error.ResolutionExceeded", {
                                                maxWidth: String(4096),
                                                maxHeight: String(2160)
                                            });
                                        case nN.MetadataUnavailable:
                                            return e("CreateMomentModal.Error.MetadataUnavailable");
                                        default:
                                            throw Error("Unhandled Moments video reject reason: ".concat(String(t)))
                                    }
                                })(i, e))))
                            }
                            e.length > 0 && y.current(e)
                        } finally {
                            m(!1)
                        }
                    }
                }, [g, o, c]),
                w = (0, a.useCallback)(() => {
                    !g || o || c || x(!0)
                }, [g, o, c]),
                S = (0, a.useCallback)(() => {
                    x(!1)
                }, []),
                A = !g || o || c;
            return (0, i.jsx)("div", {
                className: "flex flex-col gap-y-small width-full",
                children: (0, i.jsx)(nk.default, {
                    accept: "video/mp4,video/quicktime,.mp4,.mov",
                    multiple: !0,
                    size: 0xc800000,
                    onChange: C,
                    onDragActiveHandler: w,
                    onDragLeaveHandler: S,
                    className: "width-full",
                    children: (e, t, n, a, r) => (0, i.jsxs)("div", {
                        role: "presentation",
                        onKeyDown: t,
                        onDrop: n,
                        onDragOver: a,
                        onDragLeave: r,
                        className: "flex flex-col items-center justify-center gap-y-small padding-xlarge radius-medium stroke-standard width-full min-height-250 ".concat(f ? "bg-shift-200" : "bg-surface-100"),
                        children: [(0, i.jsx)(er.Button, {
                            variant: "Standard",
                            size: "Medium",
                            type: "button",
                            icon: o || c ? void 0 : "icon-regular-arrow-up-from-line",
                            isDisabled: A,
                            onClick: e,
                            children: o || c ? (0, i.jsxs)("span", {
                                className: "inline-flex items-center gap-xsmall",
                                children: [(0, i.jsx)(Z.ProgressCircle, {
                                    ariaLabel: p,
                                    size: "Small",
                                    variant: "Indeterminate"
                                }), p]
                            }) : p
                        }), (0, i.jsx)("span", {
                            className: "text-body-small content-muted text-align-x-center",
                            children: b
                        }), s.map(e => (0, i.jsx)("span", {
                            className: "text-body-small content-muted text-align-x-center",
                            children: e.name
                        }, "".concat(e.name, "-").concat(e.lastModified)))]
                    })
                })
            })
        }, [ei.TranslationNamespace.Creations]), nq = (0, u.withTranslation)(e => {
            let {
                open: t,
                onOpenChange: n,
                onMomentUploaded: s
            } = e, {
                addMoments: o
            } = eG(), {
                setStatusTab: r
            } = nv(), l = nc(), {
                translate: d
            } = (0, u.useTranslation)(), {
                locale: c
            } = (0, u.useLocalization)(), m = tQ(c), [p, h] = (0, a.useState)(), [v, f] = (0, a.useState)(), x = null != v ? v : m, [g, b] = (0, a.useState)([]), [y, I] = (0, a.useState)([]), T = (0, a.useRef)(0), {
                uploadVideos: C,
                isUploading: w
            } = (() => {
                let {
                    user: e
                } = (0, V.useAuthentication)(), [t, n] = (0, a.useState)(!1), [i, s] = (0, a.useState)(0);
                return {
                    uploadVideo: (0, a.useCallback)(async t => {
                        let {
                            experience: i,
                            locale: a,
                            file: o
                        } = t, r = null == e ? void 0 : e.id;
                        if (null == r) throw Error("Cannot upload Moments video without a signed-in user");
                        n(!0), s(0);
                        try {
                            var l;
                            let e = await t3({
                                    experienceId: i.id,
                                    experienceName: null != (l = i.name) ? l : "",
                                    rootPlaceId: i.rootPlaceId,
                                    ...null != a ? {
                                        locale: a
                                    } : {},
                                    file: o,
                                    onProgress: s
                                }),
                                {
                                    hasLocalVideo: t
                                } = await nf(r, e.draftId, o, []);
                            return {
                                ...e,
                                hasLocalVideo: t
                            }
                        } finally {
                            n(!1), s(0)
                        }
                    }, [null == e ? void 0 : e.id]),
                    uploadVideos: (0, a.useCallback)(async t => {
                        let {
                            experience: i,
                            locale: a,
                            files: o
                        } = t, r = null == e ? void 0 : e.id;
                        if (null == r) throw Error("Cannot upload Moments video without a signed-in user");
                        if (0 === o.length) return {
                            moments: [],
                            storageEvictedMediaDraftIds: []
                        };
                        n(!0), s(0);
                        try {
                            let e = [],
                                t = [];
                            for (let n of o) {
                                var l;
                                let o = await t3({
                                        experienceId: i.id,
                                        experienceName: null != (l = i.name) ? l : "",
                                        rootPlaceId: i.rootPlaceId,
                                        ...null != a ? {
                                            locale: a
                                        } : {},
                                        file: n,
                                        onProgress: s
                                    }),
                                    {
                                        hasLocalVideo: d,
                                        storageEvictedMediaDraftIds: u
                                    } = await nf(r, o.draftId, n, e);
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
                            n(!1), s(0)
                        }
                    }, [null == e ? void 0 : e.id]),
                    isUploading: t,
                    uploadProgress: i
                }
            })(), S = (0, a.useCallback)(() => {
                h(void 0), f(void 0), b([]), I([])
            }, []), A = (0, a.useCallback)(() => {
                n(!1), S()
            }, [n, S]), M = (0, a.useCallback)(e => {
                h(e)
            }, []), j = (0, a.useCallback)(e => {
                f(e)
            }, []), E = (0, a.useCallback)(() => {
                T.current += 1, b([]), I([]), h(void 0)
            }, []), P = (0, a.useCallback)(e => {
                !w && (n(e), e || S())
            }, [w, n, S]), k = (0, a.useCallback)(e => {
                I(e)
            }, []), L = (0, a.useCallback)(() => {
                I([])
            }, []), R = (0, a.useCallback)(async e => {
                var t, n, i;
                if (0 === e.length || (null == p ? void 0 : p.id) == null || l && null == x || w) return void b(e);
                let a = T.current + 1;
                T.current = a, b(e), tH(tU.UploadVideo, {
                    experienceId: p.id,
                    fileCount: e.length,
                    fileSize: e.reduce((e, t) => e + t.size, 0),
                    fileType: null == (t = e[0]) ? void 0 : t.type,
                    ...l ? {
                        locale: x
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
                            locale: x
                        } : {}
                    });
                    if (T.current !== a) return;
                    s ? t.forEach(e => {
                        s(e)
                    }) : o(t, {
                        storageEvictedMediaDraftIds: i
                    }), tK(tU.UploadVideo, {
                        experienceId: p.id,
                        fileCount: t.length,
                        persistedVideoCount: t.filter(e => e.hasLocalVideo).length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (n = e[0]) ? void 0 : n.type,
                        ...l ? {
                            locale: x
                        } : {}
                    }), r(ef), A()
                } catch (t) {
                    if (T.current !== a) return;
                    tV(tU.UploadVideo, t, {
                        experienceId: p.id,
                        fileCount: e.length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (i = e[0]) ? void 0 : i.type,
                        ...l ? {
                            locale: x
                        } : {}
                    }), b([])
                }
            }, [o, A, l, w, s, p, x, r, C]), N = d("CreateMomentModal.Title"), O = y[0], D = y.length > 1 ? y.slice(1).join(" ") : void 0;
            return (0, i.jsx)(ed.Dialog, {
                open: t,
                onOpenChange: P,
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: d("Action.Close"),
                children: (0, i.jsx)(ed.DialogContent, {
                    className: "flex flex-col min-width-0 width-[min(720px,95vw)] !max-width-[min(720px,95vw)]",
                    children: (0, i.jsxs)(ed.DialogBody, {
                        className: "flex flex-col gap-y-medium",
                        children: [(0, i.jsx)(ed.DialogTitle, {
                            className: "text-heading-small content-emphasis margin-none",
                            children: N
                        }), null != O ? (0, i.jsx)("div", {
                            className: "width-full margin-top-small padding-bottom-small",
                            children: (0, i.jsx)(el.Alert, {
                                className: "width-full",
                                variant: "Feedback",
                                severity: "Error",
                                hasCloseAffordance: !0,
                                onDismiss: L,
                                closeLabel: d("Action.Close"),
                                "data-testid": "moments-video-validation-error-banner",
                                children: (0, i.jsxs)("div", {
                                    className: "flex flex-col gap-xsmall",
                                    children: [(0, i.jsx)("span", {
                                        className: "text-label-medium content-emphasis",
                                        children: O
                                    }), null != D ? (0, i.jsx)("span", {
                                        className: "text-body-medium content-default",
                                        children: D
                                    }) : null]
                                })
                            })
                        }) : null, p ? (0, i.jsx)(ng, {
                            experience: p,
                            onChangeExperience: E
                        }) : (0, i.jsx)(nM, {
                            onExperienceResolved: M,
                            isDisabled: w
                        }), l ? (0, i.jsx)(nP, {
                            value: x,
                            onChange: j,
                            isDisabled: w
                        }) : null, (0, i.jsx)(nz, {
                            hasSelectedExperience: (null == p ? void 0 : p.id) != null,
                            hasSelectedLanguage: !l || null != x,
                            selectedFiles: g,
                            isUploading: w,
                            onFilesChange: R,
                            onValidationErrorsChange: k
                        })]
                    })
                })
            })
        }, [ei.TranslationNamespace.Creations, ei.TranslationNamespace.Controls]);

    function nF() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        (0, eu.openDialog)({
            component: nq,
            props: e,
            options: {
                mode: "standalone"
            }
        })
    }
    let nV = () => nF(),
        nG = () => {
            let {
                translate: e
            } = (0, u.useTranslation)();
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(er.Button, {
                    variant: "Emphasis",
                    size: "Large",
                    type: "button",
                    onClick: nV,
                    children: e("Action.CreateMoments")
                })
            })
        };
    var n_ = e.i(591012);
    let nH = e => {
            let {
                selected: t,
                onChange: n,
                labels: a,
                groupLabel: s
            } = e;
            return (0, i.jsx)("div", {
                className: "inline-flex wrap items-center gap-small",
                "data-testid": "moments-status-filter-pills",
                role: "radiogroup",
                "aria-label": s,
                children: eg.map(e => (0, i.jsx)(n_.Chip, {
                    "data-testid": "moments-status-pill-".concat(e),
                    isChecked: t === e,
                    size: "Medium",
                    text: a[e],
                    onCheckedChange: t => {
                        t && n(e)
                    }
                }, e))
            })
        },
        nK = () => {
            let {
                translate: e
            } = (0, u.useTranslation)(), {
                statusTab: t,
                setStatusTab: n
            } = nv(), s = (0, a.useMemo)(() => ({
                [eh]: e("MomentsTable.Pills.Active"),
                [ef]: e("MomentsTable.Pills.Draft")
            }), [e]);
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(nH, {
                    groupLabel: e("MomentsTable.Header.Status"),
                    labels: s,
                    selected: t,
                    onChange: n
                })
            })
        };
    var nW = e.i(253536),
        nJ = e.i(418564);
    let nY = e => {
        var t, n, a;
        let {
            data: s
        } = e, {
            translate: o
        } = (0, u.useTranslation)(), r = (null == s || null == (n = s.creationAccessMetadata) ? void 0 : n.accessAllowed) === !1;
        if (!r) return null;
        let l = null != (t = null == s || null == (a = s.creationAccessMetadata) ? void 0 : a.daysToUnblock) ? t : 0,
            d = r && -1 === l;
        return (0, i.jsx)(nJ.default, {
            alertTitle: d ? o("Heading.PermanentlyCreationBanned") : o("Heading.TemporaryCreationBanned", {
                days: l.toString()
            }),
            alertDescription: o(d ? "Description.PermanentlyCreationBanned" : "Description.TemporaryCreationBanned"),
            severity: "warning",
            externalLink: nW.MARKETPLACE_POLICY,
            linkLabel: o("Label.MarketplacePolicy"),
            allowCloseDialog: !1
        })
    };
    var nQ = e.i(699848),
        nX = e.i(649114),
        nZ = e.i(883302),
        n$ = e.i(16255),
        n0 = e.i(697973),
        n1 = e.i(756568),
        n2 = e.i(131385),
        n4 = e.i(643093);
    let n5 = () => {
        let {
            translate: e
        } = (0, u.useTranslation)(), [{
            activeTab: t
        }, n] = (0, en.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: s,
            activeL1Key: o
        } = (0, n2.default)(!0), r = (0, x.isAllAssetTypesActiveTab)(t), l = (0, x.isAvatarLooksActiveTab)(t), d = (0, a.useCallback)(e => {
            e && n({
                activeTab: (0, x.buildTaxonomyActiveTab)(e),
                filterIndex: 0
            })
        }, [n]), c = (0, a.useCallback)(() => {
            n({
                activeTab: (0, x.buildTaxonomyActiveTab)(x.ALL_ASSET_TYPES_L1_KEY),
                filterIndex: 0
            })
        }, [n]), m = (0, a.useCallback)(() => {
            n({
                activeTab: (0, x.buildTaxonomyActiveTab)(x.AVATAR_LOOKS_L1_KEY),
                filterIndex: 0
            })
        }, [n]), p = e("Label.Categories");
        return 0 !== s.length || r ? (0, i.jsxs)("fieldset", {
            className: "flex wrap items-center gap-small stroke-none margin-none padding-none [min-inline-size:auto]",
            "aria-label": p,
            children: [(0, i.jsx)(n_.Chip, {
                text: e("Label.Avatars"),
                size: "Medium",
                variant: "Standard",
                isChecked: l,
                onCheckedChange: m
            }), s.map(t => {
                var n;
                return (0, i.jsx)(n_.Chip, {
                    text: (0, n4.taxonomyOptionLabel)(t, e),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: t.taxonomyKey === o,
                    onCheckedChange: () => d(t.taxonomyKey)
                }, null != (n = t.taxonomyKey) ? n : t.nameKey)
            }), (0, i.jsx)(n_.Chip, {
                text: e("Label.AllAssetTypes"),
                size: "Medium",
                variant: "Standard",
                isChecked: r,
                onCheckedChange: c
            })]
        }) : null
    };
    var n8 = e.i(638016),
        n3 = e.i(157310),
        n6 = e.i(348558),
        n9 = e.i(100226);
    let n7 = (e, t) => {
            let n = C(),
                i = (0, n9.default)(),
                s = (0, n6.default)(),
                {
                    data: o
                } = (0, n3.useQuery)({
                    queryKey: ["avatar-items-entry-point-asset-types"],
                    queryFn: y.getAvatarItemsEntryPointAssetTypes,
                    staleTime: 3e5
                });
            return (0, a.useMemo)(() => {
                var a, r;
                return null != (a = null == (r = e.menuItem.submenuItems) ? void 0 : r.filter(a => I.default.isMenuItemEnabled(a, t, "Label.AvatarItems" === e.menuItem.nameKey ? null == o ? void 0 : o.has(a.type) : void 0, o, n, i, s))) ? a : []
            }, [e.menuItem.submenuItems, e.menuItem.nameKey, t, o, n, i, s])
        },
        ie = (0, n0.makeStyles)()(e => ({
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
        it = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                group: s
            } = e, {
                classes: {
                    subMenuContainer: o,
                    subMenu: r,
                    backButton: l,
                    nextButton: d,
                    chip: c
                },
                cx: m
            } = ie(), p = (0, a.useRef)(null), {
                translate: h
            } = (0, u.useTranslation)(), [v, f] = (0, a.useState)(0), [x, g] = (0, a.useState)(0), [b, y] = (0, a.useState)(0), {
                isTaxonomyMode: T
            } = (0, n8.default)(I.default.getAssetType(t)), C = n7(t, s), w = (0, a.useMemo)(() => v <= 0, [v]), S = (0, a.useMemo)(() => v + b >= x, [v, x, b]), A = () => {
                var e, t, n;
                let i = null == p ? void 0 : p.current;
                f(null != (e = null == i ? void 0 : i.scrollLeft) ? e : 0), g(null != (t = null == i ? void 0 : i.scrollWidth) ? t : 0), y(null != (n = null == i ? void 0 : i.offsetWidth) ? n : 0)
            };
            return ((0, a.useEffect)(() => {
                let e = null == p ? void 0 : p.current,
                    t = new ResizeObserver(A);
                return e && (e.addEventListener("scroll", A), t.observe(e)), () => {
                    e && (e.removeEventListener("scroll", A), t.unobserve(e))
                }
            }, []), T) ? (0, i.jsx)(n5, {}) : (0, i.jsxs)(n1.Flex, {
                classes: {
                    root: o
                },
                children: [!w && (0, i.jsx)("div", {
                    className: l,
                    children: (0, i.jsx)(nX.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: -b,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "back",
                        children: (0, i.jsx)(nZ.NavigateBeforeIcon, {
                            fontSize: "small"
                        })
                    })
                }), (0, i.jsx)("div", {
                    ref: p,
                    className: m(r, "flex max-medium:wrap max-medium:gap-y-small"),
                    children: null == C ? void 0 : C.map(e => {
                        let a = t.submenuItem === e;
                        return (0, i.jsx)(nQ.Chip, {
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
                            label: h(e.nameKey),
                            clickable: !0,
                            tabIndex: 0,
                            "aria-selected": a,
                            role: "tab"
                        }, e.type)
                    })
                }), !S && (0, i.jsx)("div", {
                    className: d,
                    children: (0, i.jsx)(nX.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: b,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "next",
                        children: (0, i.jsx)(n$.NavigateNextIcon, {
                            fontSize: "small"
                        })
                    })
                })]
            })
        };
    var ii = e.i(54842),
        ia = e.i(763833),
        is = e.i(650642),
        io = e.i(748893),
        ir = e.i(260782),
        il = e.i(348148),
        id = e.i(79238),
        iu = e.i(249259),
        ic = e.i(481458),
        im = e.i(918324),
        ip = e.i(610873),
        ih = e.i(623983),
        iv = e.i(239328),
        ix = e.i(776344),
        ig = e.i(823062),
        ib = e.i(198528),
        iy = e.i(949599),
        iI = e.i(704443),
        iT = e.i(696564),
        iC = e.i(418162);
    let iw = (0, n0.makeStyles)()(e => ({
        toolbarContainer: {
            [e.breakpoints.down("Large")]: {
                flexGrow: 1,
                justifyContent: "space-between"
            },
            paddingLeft: 12
        },
        sortContainer: {
            marginTop: -12,
            [e.breakpoints.down("Large")]: {
                marginTop: 0
            }
        },
        labelText: {
            marginRight: 26,
            whiteSpace: "nowrap"
        },
        timedOptionsButton: {
            marginLeft: 12,
            marginRight: 12
        },
        timedOptionsButtonDivider: {
            marginLeft: 12,
            marginRight: 12
        }
    }));
    var iS = e.i(226519),
        iA = e.i(668539),
        iM = e.i(102725),
        ij = e.i(15645),
        iE = e.i(200363),
        iP = e.i(957474),
        ik = e.i(419959),
        iL = e.i(155495),
        iR = e.i(257256),
        iN = e.i(990729),
        iO = e.i(913893),
        iD = e.i(185915);

    function iU(e) {
        if (void 0 === e.id || void 0 === e.autoPublishEnabled) throw Error("Publishing preferences response was malformed");
        return e
    }
    async function iB(e) {
        return iU(await iO.default.getPublishingPreferences(e))
    }
    async function iz(e) {
        return iU(await iO.default.createPublishingPreferences(e))
    }
    var iq = e.i(812141);
    let iF = e => {
        let {
            label: t,
            children: n,
            className: a,
            labelClassName: s
        } = e;
        return (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsxs)("div", {
                className: null != a ? a : "grid [grid-template-columns:175px_1fr] items-center padding-y-large",
                children: [(0, i.jsx)("span", {
                    className: "text-label-large ".concat(null != s ? s : ""),
                    children: t
                }), n]
            }), (0, i.jsx)(ir.Divider, {})]
        })
    };

    function iV(e) {
        return 4 === e || 2 === e
    }

    function iG(e, t, n) {
        return e && t && "all" === n ? 1 : e && t && "specific" === n ? 4 : e && !t ? 3 : !e && t ? 2 : 0
    }
    let i_ = e => {
        var t;
        let {
            open: n,
            onClose: s
        } = e, {
            translate: o
        } = (0, u.useTranslation)(), {
            enqueue: r
        } = (0, iN.useSnackbar)(), {
            user: l
        } = (0, V.useAuthentication)(), d = (0, f.useCurrentGroup)(), c = null == d ? void 0 : d.id, {
            data: m
        } = (0, iq.default)(iO.default), p = null != (t = null == m ? void 0 : m.maxCollectiblePrice) ? t : iT.DefaultMaxCollectiblePrice, [h, v] = (0, a.useState)(!0), [x, g] = (0, a.useState)(!1), [b, y] = (0, a.useState)(!1), [I, T] = (0, a.useState)(""), [C, w] = (0, a.useState)(""), [S, A] = (0, a.useState)(!0), [M, j] = (0, a.useState)(!0), [E, P] = (0, a.useState)(!0), [k, L] = (0, a.useState)("all"), [R, N] = (0, a.useState)(""), [O, D] = (0, a.useState)(!1);
        (0, a.useEffect)(() => {
            n && iB(c).then(e => {
                T(String(e.priceOffset)), w(e.priceInRobux > 0 ? String(e.priceInRobux) : ""), A(e.enableRegionalPricing), y(e.isRentalOptIn);
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
                j(t.sellInMarketplace), P(t.sellInExperiences), L(t.experienceLocationMode), e.places.length > 0 && N(e.places.join(","))
            }).catch(e => {
                var t;
                (null == (t = (0, iD.default)(e)) ? void 0 : t.status) !== 404 && (D(!0), r({
                    message: o("Message.ErrorProcessingRequest"),
                    autoHide: !0,
                    autoHideDuration: 3e3,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "left"
                    }
                }))
            }).finally(() => v(!1))
        }, [n, c, r, o]);
        let U = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.id) {
                    g(!0);
                    try {
                        let e = iG(M, E, k),
                            t = iV(e) ? R.split(",").filter(Boolean).map(e => Number(e)) : [];
                        await iz({
                            creatorUserId: l.id,
                            creatorGroupId: c,
                            publishingType: 2,
                            saleLocationType: e,
                            places: t,
                            priceInRobux: Number(C) || 0,
                            priceOffset: Number(I),
                            isFree: !1,
                            enableRegionalPricing: S,
                            isRentalOptIn: b,
                            autoPublishEnabled: !0
                        }), r({
                            message: o("Message.PublishingDefaultsSaved"),
                            autoHide: !0,
                            autoHideDuration: 3e3,
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "left"
                            }
                        }), s()
                    } catch (t) {
                        let e = await (0, tN.default)(t);
                        r({
                            message: o((null == e ? void 0 : e.code) === 9 ? "Message.UserMissingGroupPermissions" : "Message.PublishingUnsuccessful"),
                            autoHide: !0,
                            autoHideDuration: 3e3,
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "left"
                            }
                        })
                    } finally {
                        g(!1)
                    }
                }
            }, [l, c, M, E, k, R, C, I, S, b, r, s, o]),
            B = (0, a.useCallback)(() => {
                U()
            }, [U]),
            z = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && T(t)
            }, [p]),
            q = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && w(t)
            }, [p]),
            F = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9,]/g, "").replaceAll(/,{2,}/g, ",").replace(/^,/, "").split(",").map(e => e.replace(/^0+(\d)/, "$1")).filter(e => "0" !== e).join(","),
                    n = t.split(",").filter(Boolean);
                if (!(n.length > 5)) {
                    if (5 === n.length && t.endsWith(",")) return void N(t.slice(0, -1));
                    N(t)
                }
            }, []),
            G = h || x || O || !M && !E || "" === I || "" === C || 0 >= Number(C) || iV(iG(M, E, k)) && 0 === R.split(",").filter(Boolean).length;
        return (0, i.jsxs)(iS.Dialog, {
            open: n,
            onClose: s,
            maxWidth: "Medium",
            color: "primaryBrand",
            PaperProps: {
                className: "[width:580px]"
            },
            children: [(0, i.jsx)(iM.DialogTitle, {
                className: "padding-bottom-none",
                children: (0, i.jsxs)("div", {
                    className: "flex justify-between items-start",
                    children: [(0, i.jsx)("span", {
                        className: "text-heading-small",
                        children: o("Heading.StudioPublishSettings")
                    }), (0, i.jsx)(nX.IconButton, {
                        "aria-label": "Close",
                        onClick: s,
                        size: "small",
                        color: "inherit",
                        children: (0, i.jsx)(ij.CloseIcon, {})
                    })]
                })
            }), (0, i.jsxs)(iA.DialogContent, {
                className: "padding-top-small",
                children: [(0, i.jsx)(ih.Typography, {
                    variant: "body2",
                    className: "[opacity:0.7] padding-bottom-medium",
                    children: o("Description.StudioPublishSettingsSubtitle")
                }), (0, i.jsx)(iF, {
                    label: o("Label.Availability"),
                    children: (0, i.jsx)("span", {
                        className: "text-label-large [margin-left:12px]",
                        children: o("Label.NonLimited")
                    })
                }), (0, i.jsx)(iF, {
                    label: o("Label.TimedOption"),
                    children: (0, i.jsx)(ip.Switch, {
                        checked: b,
                        onChange: () => y(e => !e),
                        "aria-label": "Timed Option"
                    })
                }), (0, i.jsx)(iF, {
                    label: o("Label.PriceConfigurations"),
                    className: "grid [grid-template-columns:175px_1fr] padding-y-large gap-xsmall",
                    labelClassName: "padding-top-small",
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col [flex:1] gap-xsmall",
                        children: [(0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(iL.TextField, {
                                id: "price-offset",
                                label: "",
                                placeholder: o("Placeholder.AmountAbovePriceFloor"),
                                variant: "outlined",
                                size: "small",
                                value: I,
                                onChange: z,
                                fullWidth: !0
                            }), (0, i.jsx)(iR.Tooltip, {
                                title: o("Tooltip.AmountAbovePriceFloor"),
                                children: (0, i.jsx)(nX.IconButton, {
                                    "aria-label": "price offset info",
                                    size: "small",
                                    children: (0, i.jsx)(iE.InfoOutlinedIcon, {})
                                })
                            })]
                        }), (0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(iL.TextField, {
                                id: "price-floor-minimum",
                                label: "",
                                placeholder: o("Placeholder.DoNotPriceBelow"),
                                variant: "outlined",
                                size: "small",
                                value: C,
                                onChange: q,
                                fullWidth: !0
                            }), (0, i.jsx)(iR.Tooltip, {
                                title: o("Tooltip.MinimumPriceFloor"),
                                children: (0, i.jsx)(nX.IconButton, {
                                    "aria-label": "minimum price info",
                                    size: "small",
                                    children: (0, i.jsx)(iE.InfoOutlinedIcon, {})
                                })
                            })]
                        })]
                    })
                }), (0, i.jsx)(iF, {
                    label: o("Label.RegionalPricing"),
                    children: (0, i.jsx)(ip.Switch, {
                        checked: S,
                        onChange: () => A(e => !e),
                        "aria-label": "Regional Pricing"
                    })
                }), (0, i.jsx)(iF, {
                    label: o("Label.SellInMarketplace"),
                    children: (0, i.jsx)(ip.Switch, {
                        checked: M,
                        onChange: () => {
                            let e = !M;
                            e || L("specific"), j(e)
                        },
                        "aria-label": "Sell in Marketplace"
                    })
                }), (0, i.jsx)(iF, {
                    label: o("Label.SellInExperiences"),
                    children: (0, i.jsx)(ip.Switch, {
                        checked: E,
                        onChange: () => P(e => !e),
                        "aria-label": "Sell in experiences"
                    })
                }), E && (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(ir.Divider, {}), (0, i.jsxs)("div", {
                        className: "padding-y-large",
                        children: [(0, i.jsxs)("div", {
                            className: "grid [grid-template-columns:175px_1fr] items-center",
                            children: [(0, i.jsx)("span", {
                                className: "text-label-large",
                                children: o("Label.ExperienceLocations")
                            }), (0, i.jsxs)(ik.RadioGroup, {
                                row: !0,
                                value: k,
                                onChange: e => {
                                    let t = e.target.value;
                                    ("all" === t || "specific" === t) && L(t)
                                },
                                className: "flex flex-row no-wrap gap-xsmall [margin-left:12px]",
                                children: [(0, i.jsx)(il.FormControlLabel, {
                                    value: "all",
                                    disabled: !M,
                                    control: (0, i.jsx)(iP.Radio, {
                                        "aria-label": o("Label.AllGames"),
                                        size: "small"
                                    }),
                                    label: o("Label.AllGames"),
                                    className: "margin-right-medium"
                                }), (0, i.jsx)(il.FormControlLabel, {
                                    value: "specific",
                                    control: (0, i.jsx)(iP.Radio, {
                                        "aria-label": o("Label.SpecificExperiences"),
                                        size: "small"
                                    }),
                                    label: o("Label.SpecificExperiences")
                                })]
                            })]
                        }), "specific" === k && (0, i.jsxs)("div", {
                            className: "[margin-left:187px] [margin-top:10px]",
                            children: [(0, i.jsx)(iL.TextField, {
                                id: "place-ids",
                                label: "",
                                placeholder: o("Placeholder.EnterExperienceIDs"),
                                variant: "outlined",
                                size: "small",
                                value: R,
                                onChange: F,
                                fullWidth: !0
                            }), (0, i.jsxs)(ih.Typography, {
                                variant: "caption",
                                className: "[opacity:0.6] block [margin-top:4px]",
                                children: [R ? R.split(",").filter(Boolean).length : 0, "/", 5, " ", o("Label.ExperiencesCount")]
                            })]
                        })]
                    })]
                })]
            }), (0, i.jsxs)("div", {
                className: "flex padding-x-large padding-y-medium gap-small",
                children: [(0, i.jsx)(io.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: B,
                    disabled: G,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: o("Action.Save")
                }), (0, i.jsx)(io.Button, {
                    variant: "contained",
                    color: "secondary",
                    onClick: s,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: o("Action.Cancel")
                })]
            })]
        })
    };
    var iH = e.i(59973),
        iK = e.i(759283);
    let iW = (e, t) => {
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
    var iJ = e.i(614875),
        iY = e.i(691236);
    let iQ = (0, n0.makeStyles)()(e => ({
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
        iX = ["makeup", "clothing", "accessories"],
        iZ = ["clothing", "makeup"],
        i$ = {
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

    function i0(e) {
        return e ? i$.clothing.all : "Label.ClothingOnlyTShirtsPantsSweaters"
    }
    let i1 = (0, u.withTranslation)(e => {
        let t, {
                open: n,
                onClose: s,
                categoryFlags: o,
                assetTypesByCategory: r
            } = e,
            {
                translate: l
            } = (0, u.useTranslation)(),
            {
                classes: d,
                cx: c
            } = iQ(),
            {
                enqueue: m,
                close: p
            } = (0, iN.useSnackbar)(),
            h = (0, f.useCurrentGroup)(),
            v = !1 !== o.showCategorySubtypeDropdowns,
            x = (0, a.useMemo)(() => v ? iX : iZ, [v]),
            [g, b] = (0, a.useState)({
                clothing: !1,
                makeup: !1,
                accessories: !1
            }),
            [y, I] = (0, a.useState)({}),
            [T, C] = (0, a.useState)(() => ({
                clothing: !0,
                makeup: !0,
                accessories: !0
            })),
            [w, S] = (0, a.useState)(!1),
            [A, M] = (0, a.useState)(null),
            j = (0, a.useMemo)(() => r ? {
                clothing: r.clothing,
                makeup: r.makeup,
                accessories: r.accessories
            } : {
                clothing: [],
                makeup: [],
                accessories: []
            }, [r]),
            E = (0, a.useMemo)(() => ({
                clothing: o.showClothing,
                makeup: o.showMakeup,
                accessories: o.showAccessories
            }), [o.showAccessories, o.showClothing, o.showMakeup]);
        (0, a.useEffect)(() => {
            if (n) {
                let e = {};
                if (r) {
                    let {
                        clothing: t,
                        makeup: n,
                        accessories: i
                    } = r;
                    [...t, ...n, ...i].forEach(t => {
                        e[t] = !0
                    })
                }
                I(e), C({
                    clothing: !0,
                    makeup: !0,
                    accessories: !0
                }), b({
                    clothing: !1,
                    makeup: !1,
                    accessories: !1
                }), S(!1), M(null)
            }
        }, [n, r]);
        let P = (0, a.useCallback)(() => {
                s()
            }, [s]),
            k = (0, a.useCallback)(() => {
                M("enable"), S(!0)
            }, []),
            L = (0, a.useCallback)(() => {
                M("disable"), S(!0)
            }, []),
            R = (0, a.useCallback)(async () => {
                if (!r || null === A) return void s();
                let e = x.flatMap(e => E[e] ? j[e].filter(e => y[e]) : []);
                try {
                    await iO.default.bulkUpdateCollectible(G.uuidService.generateRandomUuid(), null == h ? void 0 : h.id, e.map(e => (0, iC.translateAssetType)(e)), "enable" === A), m({
                        message: l("Message.TimedOptionSettingsApplied"),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: iK.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    }), window.location.reload(), s()
                } catch (e) {
                    m({
                        message: l(iW(await (0, tN.default)(e), "Error.Unknown")),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: iK.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    })
                }
            }, [r, y, A, null == h ? void 0 : h.id, m, p, s, j, E, l, x]),
            N = (0, a.useCallback)(() => {
                S(!1), M(null)
            }, []),
            O = (0, a.useMemo)(() => x.map(e => {
                if (!E[e]) return null;
                let t = j[e];
                if (0 === t.length) return null;
                let n = t.filter(e => y[e]);
                if (0 === n.length) return null;
                if (n.length === t.length) return l("clothing" === e ? i0(v) : i$[e].all);
                let i = l(i$[e].short),
                    a = n.map(e => l(iK.assetFullNameKeys[e])).join(", ");
                return "".concat(i, " (").concat(a, ")")
            }).filter(e => null !== e), [y, j, E, v, l, x]),
            D = (0, a.useMemo)(() => x.some(e => E[e] && j[e].some(e => y[e])), [y, j, E, x]),
            U = (0, i.jsxs)(i.Fragment, {
                children: [(0, i.jsx)(iH.DialogContentText, {
                    className: d.descriptionText,
                    children: l("Description.BulkUpdateAllTimedOptions")
                }), (0, i.jsx)(ix.default, {
                    flexDirection: "column",
                    classes: {
                        root: d.checkboxList
                    },
                    children: x.map(e => (e => {
                        let t = j[e];
                        if (!E[e]) return null;
                        let n = g[e],
                            s = "timed-options-bulk-".concat(e, "-subtypes"),
                            o = l("clothing" === e ? i0(v) : i$[e].all);
                        return (0, i.jsxs)(a.default.Fragment, {
                            children: [(0, i.jsxs)("div", {
                                className: d.categoryRow,
                                children: [v ? (0, i.jsx)(nX.IconButton, {
                                    type: "button",
                                    size: "small",
                                    className: d.expandToggle,
                                    onClick: () => b(t => ({
                                        ...t,
                                        [e]: !t[e]
                                    })),
                                    "aria-expanded": n,
                                    "aria-controls": s,
                                    "aria-label": l("AriaLabel.ToggleTimedOptionsCategorySubtypes", {
                                        categoryName: o
                                    }),
                                    color: "inherit",
                                    children: (0, i.jsx)(iY.ChevronRightIcon, {
                                        className: c(n ? d.expandToggleExpanded : d.expandToggleCollapsed)
                                    })
                                }) : null, (0, i.jsx)(iJ.Checkbox, {
                                    label: o,
                                    size: "Small",
                                    placement: "Start",
                                    isChecked: ((e, t) => {
                                        if (0 === t.length) return T[e];
                                        let n = e => y[e],
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
                                    className: d.categoryLabelWide
                                })]
                            }), v && n ? (0, i.jsx)("div", {
                                id: s,
                                className: d.subtypeIndent,
                                children: t.map(e => (0, i.jsx)(iJ.Checkbox, {
                                    label: l(iK.assetFullNameKeys[e]),
                                    size: "Small",
                                    placement: "Start",
                                    isChecked: y[e],
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
                }), (0, i.jsxs)(ix.default, {
                    flexDirection: "row",
                    classes: {
                        root: d.buttonContainer
                    },
                    children: [(0, i.jsx)(io.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: k,
                        size: "medium",
                        className: d.actionButton,
                        disabled: !D,
                        children: l("Action.Enable")
                    }), (0, i.jsx)(io.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: L,
                        size: "medium",
                        className: d.actionButton,
                        disabled: !D,
                        children: l("Action.Disable")
                    })]
                })]
            });
        return w && (t = "enable" === A ? "Description.ThisWillEnableTimedOptionsFor" : "Description.ThisWillDisableTimedOptionsFor", U = (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(iH.DialogContentText, {
                className: d.descriptionText,
                children: l(t)
            }), O.length > 0 && (0, i.jsx)("ul", {
                className: d.bulletList,
                children: O.map(e => (0, i.jsx)("li", {
                    children: e
                }, e))
            }), (0, i.jsx)(iH.DialogContentText, {
                className: d.descriptionText,
                children: l("Description.ThisWillAlsoReplaceAnyItemLevelSettings")
            }), (0, i.jsxs)(ix.default, {
                flexDirection: "row",
                classes: {
                    root: d.buttonContainer
                },
                children: [(0, i.jsx)(io.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: R,
                    size: "medium",
                    className: d.actionButton,
                    children: l("Action.Confirm")
                }), (0, i.jsx)(io.Button, {
                    variant: "contained",
                    color: "secondary",
                    onClick: N,
                    size: "medium",
                    className: d.actionButton,
                    children: l("Action.Cancel")
                })]
            })]
        })), (0, i.jsxs)(iS.Dialog, {
            open: n,
            onClose: P,
            maxWidth: "Small",
            color: "primaryBrand",
            classes: {
                paper: d.dialogPaper
            },
            children: [(0, i.jsxs)(iM.DialogTitle, {
                className: d.dialogTitle,
                children: [(0, i.jsx)("span", {
                    className: d.dialogTitleText,
                    children: w ? l("Title.ConfirmOption") : l("Action.TimedOptions")
                }), !w && (0, i.jsx)(nX.IconButton, {
                    "aria-label": "Close",
                    onClick: P,
                    size: "small",
                    className: d.closeButton,
                    color: "inherit",
                    children: (0, i.jsx)(ij.CloseIcon, {})
                })]
            }), (0, i.jsx)(iA.DialogContent, {
                className: d.dialogContent,
                children: U
            })]
        })
    }, [ei.TranslationNamespace.ConfigureItem, ei.TranslationNamespace.Creations, ei.TranslationNamespace.AssetTypes]);

    function i2(e) {
        return "Tshirt" === e ? m.Asset.TShirt : "TshirtAccessory" === e ? m.Asset.TShirtAccessory : e
    }
    let i4 = (0, n0.makeStyles)()(e => ({
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
        i5 = (0, u.withTranslation)(e => {
            let t, n, s, o, {
                    open: r,
                    onClose: l
                } = e,
                {
                    translate: d,
                    translateHTML: c
                } = (0, u.useTranslation)(),
                {
                    classes: p
                } = i4(),
                {
                    enqueue: h,
                    close: v
                } = (0, iN.useSnackbar)(),
                x = (0, f.useCurrentGroup)(),
                [g, b] = (0, a.useState)(null),
                [y, I] = (0, a.useState)(() => G.uuidService.generateRandomUuid()),
                [T, C] = (0, a.useState)({
                    showClothing: !1,
                    showMakeup: !1,
                    showAccessories: !1,
                    showCategorySubtypeDropdowns: !0
                }),
                [w, S] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                r ? (b(null), I(G.uuidService.generateRandomUuid()), (0, iT.getValidTimedOptionsTypes)().then(() => {
                    let e = new Set(iT.ValidTimedOptionsAssetTypes.map(e => i2(e))),
                        t = 3 === e.size && Array.from(iy.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).every(t => e.has(t));
                    if (S(t), t) C({
                        showClothing: !1,
                        showMakeup: !1,
                        showAccessories: !1,
                        showCategorySubtypeDropdowns: !0
                    });
                    else {
                        let t = [...e].every(e => iy.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e) || iy.MAKEUP_ASSET_TYPES.includes(e)),
                            n = e.has(m.Asset.EyeMakeup),
                            i = iy.CLOTHING_ASSET_TYPES.some(t => e.has(t) && !iy.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(t)),
                            a = Array.from(iy.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(t => e.has(t));
                        C({
                            showClothing: i || a,
                            showMakeup: n,
                            showAccessories: e.has(m.Asset.Hat),
                            showCategorySubtypeDropdowns: !t
                        })
                    }
                })) : I(G.uuidService.generateRandomUuid())
            }, [r]);
            let A = (0, a.useCallback)(async () => {
                    try {
                        await iO.default.bulkUpdateCollectible(y, null == x ? void 0 : x.id, [64, 66, 68], !0 === g), h({
                            message: d("Message.TimedOptionSettingsApplied"),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: iK.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        }), window.location.reload(), l()
                    } catch (e) {
                        h({
                            message: d(iW(await (0, tN.default)(e), "Error.Unknown")),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: iK.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        })
                    }
                }, [h, v, d, l, y, null == x ? void 0 : x.id, g]),
                M = (0, a.useCallback)(() => {
                    l()
                }, [l]),
                j = !w,
                E = j ? (t = new Set(iT.ValidTimedOptionsAssetTypes.map(e => i2(e))), n = iy.CLOTHING_ASSET_TYPES.some(e => t.has(e) && !iy.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e)), s = Array.from(iy.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(e => t.has(e)), o = T.showCategorySubtypeDropdowns && (!s || n) ? iy.CLOTHING_ASSET_TYPES.filter(e => t.has(e)) : Array.from(iy.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).filter(e => t.has(e)), {
                    clothing: o,
                    makeup: iy.MAKEUP_ASSET_TYPES.filter(e => t.has(e)),
                    accessories: T.showCategorySubtypeDropdowns ? iy.ACCESSORY_ASSET_TYPES.filter(e => t.has(e)) : []
                }) : void 0;
            return j ? (0, i.jsx)(i1, {
                open: r,
                onClose: M,
                categoryFlags: T,
                assetTypesByCategory: E
            }) : (0, i.jsxs)(iS.Dialog, {
                open: r,
                onClose: M,
                maxWidth: "Small",
                color: "primaryBrand",
                children: [(0, i.jsxs)(iM.DialogTitle, {
                    className: p.dialogTitle,
                    children: [(0, i.jsx)("span", {
                        children: null === g ? d("Action.TimedOptions") : d("Action.Confirm")
                    }), (0, i.jsx)(nX.IconButton, {
                        "aria-label": "Close",
                        onClick: M,
                        size: "small",
                        className: p.closeButton,
                        color: "inherit",
                        children: (0, i.jsx)(ij.CloseIcon, {})
                    })]
                }), (0, i.jsx)(iA.DialogContent, {
                    className: p.dialogContent,
                    children: null === g ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(iH.DialogContentText, {
                            className: p.descriptionText,
                            children: d("Description.BulkUpdateTimedOptions")
                        }), (0, i.jsxs)(ix.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(io.Button, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    b(!0)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: d("Action.TurnAllOn")
                            }), (0, i.jsx)(io.Button, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    b(!1)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: d("Action.TurnAllOff")
                            })]
                        })]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(iH.DialogContentText, {
                            className: p.descriptionText,
                            children: g ? c("Description.BulkUpdateOnConfirmation", [{
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
                        }), (0, i.jsxs)(ix.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(io.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                onClick: A,
                                size: "large",
                                className: p.actionButton,
                                children: d("Action.Confirm")
                            }), (0, i.jsx)(io.Button, {
                                variant: "contained",
                                color: "secondary",
                                onClick: M,
                                size: "large",
                                className: p.actionButton,
                                children: d("Action.Cancel")
                            })]
                        })]
                    })
                })]
            })
        }, [ei.TranslationNamespace.ConfigureItem, ei.TranslationNamespace.Creations]),
        i8 = Object.values(Q.SearchSortParameter),
        i3 = Object.values(ii.EventSortBy),
        i6 = ["publishSettings"],
        i9 = e => {
            var t;
            let {
                menuState: n
            } = e, {
                translate: s
            } = (0, u.useTranslation)(), {
                unifiedLogger: o
            } = (0, ig.useUnifiedLoggerProvider)(), {
                ready: r,
                value: l
            } = (0, d.useFlag)(iv.isAutoPublishPreferencesEnabled), {
                isFetched: c
            } = (0, f.useGroups)(), {
                classes: {
                    toolbarContainer: p,
                    sortContainer: h,
                    timedOptionsButton: v,
                    timedOptionsButtonDivider: g
                }
            } = iw(), [b, T] = (0, a.useState)(!1), [C, w] = (0, a.useState)(!1), [S, A] = (0, a.useState)(0), [M, j] = (0, a.useState)(!1), [E, P] = (0, a.useState)(!1), [k, L] = (0, a.useState)(null);
            (0, a.useEffect)(() => {
                (0, iT.getValidTimedOptionsTypes)().then(() => {
                    P(!0)
                })
            }, []);
            let {
                sort: R,
                setSort: N,
                sortOrder: O,
                setSortOrder: D,
                isArchived: U,
                setIsArchived: B,
                isAgeRestrictedCollaboration: z,
                setIsAgeRestrictedCollaboration: q,
                isPublicOnly: V,
                setIsPublicOnly: _,
                isOnMarketplace: H,
                setIsOnMarketplace: K
            } = (0, eo.default)(), [{
                filterIndex: W,
                publishSettings: J
            }] = (0, en.useQueryParams)(["filterIndex", "publishSettings"]), Y = (0, a.useContext)(F).isResolving, [, X] = (0, en.useQueryParams)(["activeTab", "filterIndex"]), [, Z] = (0, en.useQueryParams)(i6), $ = (0, a.useMemo)(() => {
                let e = I.default.getAssetType(n);
                return e !== m.Asset.AllCatalogAsset || Number(W) > 0 ? e : x.TAXONOMY_HOST_ASSET
            }, [n, W]), ee = ($ in iy.AvatarMenuMap || $ === m.Asset.AllCatalogAsset) && l, et = (0, ib.normalizeSingleQueryParam)(J), ei = !!ee && c && !Y && !M && ("true" === et || "1" === et);
            (0, a.useEffect)(() => {
                r && c && !Y && void 0 !== et && (ei || Z({
                    publishSettings: null
                }, {
                    skipHistory: !0
                }))
            }, [r, Y, c, ei, et, Z]);
            let ea = (0, a.useCallback)(() => {
                    w(!1), ei && (j(!0), Z({
                        publishSettings: null
                    }, {
                        skipHistory: !0
                    }))
                }, [ei, Z]),
                {
                    canUseTaxonomy: es,
                    isTaxonomyMode: er
                } = (0, n8.default)($),
                el = n7(n, (0, f.useCurrentGroup)()),
                {
                    isSortable: ed,
                    isArchivable: eu
                } = (0, a.useMemo)(() => {
                    let e = er || null == W ? void 0 : Number(W),
                        t = I.default.isAssetTypeArchivable($, e);
                    return {
                        isSortable: I.default.isAssetTypeSortable($),
                        isArchivable: t || I.default.isAssetTypeDirectlyArchivable($)
                    }
                }, [$, W, er]),
                ec = s("Label.CategorizeByTaxonomy"),
                em = (0, a.useCallback)(() => {
                    var e;
                    let t = null == (e = el[0]) ? void 0 : e.type;
                    X({
                        activeTab: er ? null != t ? t : $ : (0, x.buildTaxonomyActiveTab)(),
                        filterIndex: 0
                    }, {
                        skipHistory: !0
                    })
                }, [er, $, el, X]),
                ep = (0, a.useMemo)(() => !ed && !eu && !es && $ !== m.Asset.MyExperiences && $ !== m.Asset.SharedExperiences, [ed, eu, es, $]),
                eh = (0, a.useCallback)(e => {
                    let {
                        value: t
                    } = e.target;
                    if ($ === m.Asset.MyExperiences || $ === m.Asset.SharedExperiences) {
                        if (!i8.includes(t)) return;
                        N(e => ({
                            ...e,
                            [m.Asset.Place]: t
                        }))
                    } else i3.includes(t) && N(e => ({
                        ...e,
                        [$]: t
                    }))
                }, [N, $]),
                ev = (0, a.useCallback)(() => {
                    D(e => e === G.SortOrder.Asc ? G.SortOrder.Desc : G.SortOrder.Asc)
                }, [D]),
                ef = (0, a.useCallback)(() => {
                    T(!0)
                }, []),
                ex = (0, a.useCallback)(() => {
                    let e = !z;
                    o.logClickEvent({
                        eventName: tO.default.ImpactedExperiencesFilterClick,
                        parameters: {
                            page: "creations",
                            action: e ? "enable" : "disable",
                            assetType: $.toString()
                        }
                    }), q(e => !e)
                }, [o, z, $, q]),
                eg = $ === m.Asset.MyExperiences || $ === m.Asset.SharedExperiences,
                eb = (0, a.useMemo)(() => eg ? Object.values(Q.SearchSortParameter).map(e => ({
                    value: e,
                    labelKey: y.universeSortTranslationKeys[e]
                })) : Object.values(ii.EventSortBy).map(e => ({
                    value: e,
                    labelKey: y.eventSortTranslationKeys[e]
                })), [eg]),
                ey = (0, a.useMemo)(() => eg ? R[m.Asset.Place] : (0, iI.getSortForAssetType)($, R), [eg, R, $]),
                eI = (0, a.useMemo)(() => {
                    var e, t;
                    if (!E) return !1;
                    let i = er || null == W ? void 0 : Number(W);
                    if (void 0 !== i && iy.AvatarMenuMap[$]) {
                        let e = iy.AvatarMenuMap[$][i];
                        if (e) return (0, iC.getIsRentableType)(e.assetType, e.bundleType)
                    }
                    return (0, iC.getIsRentableType)(null != (e = null == (t = n.submenuItem) ? void 0 : t.type) ? e : $, void 0)
                }, [$, W, er, null == (t = n.submenuItem) ? void 0 : t.type, E]);
            if (ep) return null;
            let eT = $ === m.Asset.MyExperiences || $ === m.Asset.SharedExperiences || eu || es || $ === m.Asset.MeshPart,
                eC = $ === m.Asset.MyExperiences || $ === m.Asset.SharedExperiences,
                ew = $ === m.Asset.Decal || $ === m.Asset.MeshPart,
                eS = !ee && !eI && !!($ === m.Asset.MyExperiences || eC || eu && $);
            return (0, i.jsxs)(ix.Flex, {
                flexDirection: "row",
                justifyContent: "flex-start",
                alignItems: "flex-start",
                flexWrap: "wrap",
                classes: {
                    root: p
                },
                children: [eT && (0, i.jsxs)(ix.Flex, {
                    alignItems: "center",
                    gap: 1,
                    flexDirection: "row",
                    children: [eS && (0, i.jsx)(ih.Typography, {
                        marginRight: "16px",
                        children: s("Label.ShowPrefix")
                    }), $ === m.Asset.MyExperiences && (0, i.jsx)(il.FormControlLabel, {
                        control: (0, i.jsx)(ip.Switch, {
                            checked: V,
                            onChange: () => _(e => !e),
                            "aria-label": s("Label.Public")
                        }),
                        label: s("Label.Public")
                    }), eC && (0, i.jsx)(il.FormControlLabel, {
                        control: (0, i.jsx)(ip.Switch, {
                            checked: z,
                            onChange: ex,
                            "aria-label": s("Label.Impacted")
                        }),
                        label: s("Label.Impacted")
                    }), eI && !ee && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(io.Button, {
                            variant: "contained",
                            color: "secondary",
                            onClick: ef,
                            classes: {
                                root: v
                            },
                            children: s("Action.TimedOptions")
                        }), (0, i.jsx)(ir.Divider, {
                            orientation: "vertical",
                            flexItem: !0,
                            classes: {
                                root: g
                            }
                        })]
                    }), eu && $ && (0, i.jsx)(il.FormControlLabel, {
                        control: (0, i.jsx)(ip.Switch, {
                            checked: U,
                            onChange: () => B(e => !e),
                            "aria-label": ee ? s("Action.ShowArchived") : s("Label.Archived")
                        }),
                        label: ee ? s("Action.ShowArchived") : s("Label.Archived")
                    }), es && (0, i.jsx)(il.FormControlLabel, {
                        control: (0, i.jsx)(ip.Switch, {
                            checked: er,
                            onChange: em,
                            "aria-label": ec
                        }),
                        label: ec
                    }), ee && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(ir.Divider, {
                            orientation: "vertical",
                            flexItem: !0,
                            classes: {
                                root: g
                            }
                        }), (0, i.jsx)(nX.IconButton, {
                            "aria-label": s("Label.Settings"),
                            size: "medium",
                            color: "secondary",
                            onClick: e => L(e.currentTarget),
                            children: (0, i.jsx)(im.SettingsIcon, {})
                        }), (0, i.jsxs)(id.Menu, {
                            anchorEl: k,
                            open: null != k,
                            onClose: () => L(null),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "right"
                            },
                            transformOrigin: {
                                vertical: "top",
                                horizontal: "right"
                            },
                            className: "margin-top-small",
                            children: [eI && (0, i.jsx)(iu.MenuItem, {
                                onClick: () => {
                                    L(null), ef()
                                },
                                children: (0, i.jsx)(ih.Typography, {
                                    variant: "body1",
                                    children: s("Action.TimedOptions")
                                })
                            }), (0, i.jsx)(iu.MenuItem, {
                                onClick: () => {
                                    L(null), A(e => e + 1), w(!0)
                                },
                                children: (0, i.jsx)(ih.Typography, {
                                    variant: "body1",
                                    children: s("Action.StudioPublishSettings")
                                })
                            })]
                        })]
                    }), ew && (0, i.jsx)(il.FormControlLabel, {
                        control: (0, i.jsx)(ip.Switch, {
                            "aria-label": s("Label.OnCreatorStore"),
                            checked: H,
                            onChange: () => K(e => !e)
                        }),
                        label: s("Label.OnCreatorStore")
                    })]
                }), ed && (0, i.jsxs)(ix.Flex, {
                    flexDirection: "row",
                    classes: {
                        root: h
                    },
                    alignItems: "center",
                    flexWrap: "nowrap",
                    children: [(0, i.jsx)(ic.Select, {
                        variant: "outlined",
                        margin: "dense",
                        size: "small",
                        label: s("Label.SortBy"),
                        value: ey,
                        onChange: eh,
                        inputProps: {
                            "aria-label": s("Label.SortBy")
                        },
                        children: eb.map(e => (0, i.jsx)(iu.MenuItem, {
                            value: e.value,
                            children: s(e.labelKey)
                        }, e.value))
                    }), (0, i.jsx)(nX.IconButton, {
                        "aria-label": s("Heading.SortOrder"),
                        onClick: ev,
                        size: "large",
                        children: O === G.SortOrder.Asc ? (0, i.jsx)(is.ArrowUpwardIcon, {
                            color: "secondary"
                        }) : (0, i.jsx)(ia.ArrowDownwardIcon, {
                            color: "secondary"
                        })
                    })]
                }), (0, i.jsx)(i5, {
                    open: b,
                    onClose: () => T(!1)
                }), (0, i.jsx)(i_, {
                    open: C || ei,
                    onClose: ea
                }, S)]
            })
        },
        i7 = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                verificationMetadata: a,
                group: s
            } = e, o = [m.Asset.UpcomingEvent, m.Asset.PastEvent, m.Asset.DraftEvent], r = !!t.submenuItem && o.includes(t.submenuItem.type);
            return (0, i.jsxs)("div", {
                className: "flex justify-between padding-top-small",
                children: [t.menuItem.type === m.Asset.TShirt && (0, i.jsx)(nY, {
                    data: a
                }), !r && (0, i.jsx)("div", {
                    className: "flex width-full padding-bottom-large [align-content:flex-start] [row-gap:12px] justify-between flex-row items-start wrap",
                    children: t.menuItem.type === m.Asset.Moments ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nK, {}), (0, i.jsx)(nG, {})]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [t.submenuItem && (0, i.jsx)(it, {
                            menuState: t,
                            onMenuStateChange: n,
                            group: s
                        }), (0, i.jsx)(i9, {
                            menuState: t
                        })]
                    })
                })]
            })
        };
    var ae = e.i(812077),
        at = e.i(71375),
        an = e.i(83560),
        ai = e.i(576069),
        aa = e.i(134817);
    let as = [];

    function ao(e) {
        return null != e.universeId ? e.universeId : "experienceId" in e && "number" == typeof e.experienceId ? e.experienceId : void 0
    }
    var ar = e.i(130058),
        al = e.i(921378);
    let ad = (e, t) => {
            let {
                user: n
            } = (0, V.useAuthentication)(), {
                enabled: i,
                thumbnailUrl: s,
                videoUrl: o
            } = t, r = null == n ? void 0 : n.id, l = (0, a.useMemo)(() => s || o ? {
                thumbnailUrl: null != s ? s : "",
                videoUrl: null != o ? o : ""
            } : null, [s, o]), [d, u] = (0, a.useState)(null);
            return ((0, a.useEffect)(() => {
                if (l || null == r || !i || null == e || "" === e) return;
                let t = !1;
                return (async () => {
                    let n = {
                        draftId: e,
                        userId: r
                    };
                    tH(tU.LoadLocalVideoMedia, n);
                    try {
                        let i = await eL(r, e);
                        t || (u(i), null != i && tK(tU.LoadLocalVideoMedia, n))
                    } catch (n) {
                        tV(tU.LoadLocalVideoMedia, n, {
                            draftId: e
                        }), t || u(null)
                    }
                })(), () => {
                    t = !0
                }
            }, [e, i, l, r]), l) ? l : i ? d : null
        },
        au = "block width-full height-full max-w-full max-h-full object-contain",
        ac = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)("div", {
                className: "flex items-center justify-center radius-medium bg-surface-200 width-full shrink-0 overflow-hidden h-[240px]",
                "data-testid": "moments-video-preview-container",
                children: t
            })
        },
        am = e => {
            let {
                thumbnailUrl: t,
                videoUrl: n
            } = e;
            return n ? (0, i.jsx)(ac, {
                children: (0, i.jsx)("video", {
                    "aria-label": "Moment video preview",
                    className: "radius-medium ".concat(au),
                    controls: !0,
                    playsInline: !0,
                    poster: t,
                    src: n,
                    children: (0, i.jsx)("track", {
                        kind: "captions"
                    })
                })
            }) : t ? (0, i.jsx)(ac, {
                children: (0, i.jsx)("img", {
                    alt: "Moment thumbnail preview",
                    className: "radius-medium ".concat(au),
                    src: t
                })
            }) : (0, i.jsx)(ac, {})
        },
        ap = (0, u.withTranslation)(e => {
            var t, n, s;
            let {
                moment: o,
                open: r,
                onOpenChange: l,
                onMomentMetadataChange: d,
                onPublish: c,
                onDelete: m,
                publishingDraftId: p = null,
                deletingMomentKey: h = null,
                isPublishDisabled: v = !1
            } = e, {
                translate: f
            } = (0, u.useTranslation)(), {
                locale: x
            } = (0, u.useLocalization)(), g = nc(), b = tQ(x), [y, I] = (0, a.useState)(() => {
                var e, t, n, i;
                let a;
                return o && ((a = {
                    id: null != (i = ao(n = o)) ? i : 0,
                    name: n.experienceName
                }).id > 0 || (null != (e = null == (t = a.name) ? void 0 : t.length) ? e : 0) > 0) ? a : void 0
            }), [T, C] = (0, a.useState)(() => {
                var e;
                return null != (e = null == o ? void 0 : o.description) ? e : ""
            }), [w, S] = (0, a.useState)(), A = null != (t = null != w ? w : null == o ? void 0 : o.locale) ? t : b, M = (null == o ? void 0 : o.status) === ef && !0 === o.hasLocalVideo, j = ad((null == o ? void 0 : o.status) === ef ? o.draftId : null, {
                enabled: r && M,
                thumbnailUrl: null == o ? void 0 : o.thumbnailUrl,
                videoUrl: null == o ? void 0 : o.videoUrl
            }), E = (0, a.useCallback)(() => {
                o && !v && null == p && (null == c || c(o))
            }, [v, o, c, p]), P = (0, a.useCallback)(() => {
                o && h !== nm(o) && (null == m || m(o))
            }, [h, o, m]), k = (0, a.useCallback)(e => {
                o && e.id && e.name && (I(e), null == d || d(o, {
                    experienceId: e.id,
                    rootPlaceId: e.rootPlaceId,
                    experienceName: e.name
                }))
            }, [o, d]), L = (0, a.useCallback)(e => {
                C(e.target.value)
            }, []), R = (0, a.useCallback)(e => {
                S(e), o && e !== o.locale && (null == d || d(o, {
                    locale: e
                }))
            }, [o, d]), N = (0, a.useCallback)(() => {
                o && T !== o.description && (null == d || d(o, {
                    description: T
                }))
            }, [T, o, d]), O = (0, a.useCallback)(() => {
                N()
            }, [N]), D = (0, a.useCallback)(e => {
                e || N(), l(e)
            }, [N, l]);
            if (!o) return null;
            let U = nm(o),
                B = null != p && p === U,
                z = null != p,
                q = null != h && h === U,
                F = o.status === eh,
                V = o.status === ef,
                G = V && !B,
                _ = !F && null != c && (V && M || B),
                H = null != m,
                K = T.length >= 140;
            return (0, i.jsx)(ar.SheetRoot, {
                open: r,
                onOpenChange: D,
                children: (0, i.jsxs)(ar.SheetContent, {
                    closeLabel: f("Action.Close"),
                    largeScreenVariant: "side",
                    children: [(0, i.jsx)(ar.SheetTitle, {
                        children: f("Heading.EditMoment")
                    }), (0, i.jsxs)(ar.SheetBody, {
                        className: "flex flex-col gap-y-medium padding-top-small padding-bottom-large",
                        children: [(0, i.jsx)(am, {
                            thumbnailUrl: null != (n = null == j ? void 0 : j.thumbnailUrl) ? n : o.thumbnailUrl,
                            videoUrl: null != (s = null == j ? void 0 : j.videoUrl) ? s : o.videoUrl
                        }), G ? (0, i.jsx)(i.Fragment, {
                            children: y ? (0, i.jsx)(ng, {
                                experience: y,
                                onChangeExperience: () => I(void 0)
                            }) : (0, i.jsx)(nM, {
                                onExperienceResolved: k
                            })
                        }) : y ? (0, i.jsxs)("div", {
                            className: "flex flex-col gap-y-xsmall width-full margin-top-small",
                            children: [(0, i.jsx)("span", {
                                className: "text-body-small content-muted",
                                children: f("CreateMomentModal.ExperienceInput.Label")
                            }), (0, i.jsx)(ng, {
                                experience: y,
                                hideTitle: !0
                            })]
                        }) : null, g ? (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: G ? (0, i.jsx)(nP, {
                                value: A,
                                onChange: R,
                                isDisabled: B
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: f("CreateMomentModal.LanguageInput.Label")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-content-language-readonly",
                                    children: tZ(o.locale)
                                })]
                            })
                        }) : null, (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: G ? (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)(al.TextArea, {
                                    id: "edit-moment-description-".concat(U),
                                    label: f("MomentsTable.Header.Description"),
                                    rows: 3,
                                    placeholder: f("MomentsTable.Placeholders.Description"),
                                    size: "Small",
                                    value: T,
                                    maxLength: 140,
                                    onBlur: O,
                                    onChange: L
                                }), (0, i.jsx)("span", {
                                    "aria-live": "polite",
                                    className: K ? "text-body-small content-system-alert text-align-x-right" : "text-body-small content-muted text-align-x-right",
                                    "data-testid": "edit-moment-description-char-count",
                                    children: "".concat(T.length, "/").concat(140)
                                })]
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: f("MomentsTable.Header.Description")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-description-readonly",
                                    children: T || "-"
                                })]
                            })
                        })]
                    }), (0, i.jsx)(ar.SheetActions, {
                        className: "width-full",
                        children: (0, i.jsxs)("div", {
                            className: "flex gap-small width-full",
                            children: [_ ? (0, i.jsx)(er.Button, {
                                variant: "Emphasis",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: v || z,
                                isLoading: B,
                                onClick: E,
                                children: f("Action.Publish")
                            }) : null, H ? (0, i.jsx)(er.Button, {
                                variant: "Standard",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: q,
                                isLoading: q,
                                onClick: P,
                                children: (0, i.jsx)("span", {
                                    className: "content-action-alert",
                                    children: f("Action.Delete")
                                })
                            }) : null]
                        })
                    })]
                })
            })
        }, [ei.TranslationNamespace.Creations, ei.TranslationNamespace.Controls]);
    var ah = e.i(927072),
        av = e.i(493924);
    let af = e => {
        let {
            onCreateClick: t
        } = e, {
            translate: n
        } = (0, u.useTranslation)();
        return (0, i.jsx)(av.default, {
            title: n("Heading.ReachPlayersDirectlyInMoments"),
            size: "large",
            illustration: "videos",
            description: (0, i.jsxs)(i.Fragment, {
                children: [n("Description.UploadExternalVideosToMoments"), " ", (0, i.jsx)(ah.Link, {
                    "aria-label": n("Label.LearnMore"),
                    href: nW.MOMENTS_LEARN_MORE_URL,
                    target: "_blank",
                    rel: "noopener noreferrer",
                    variant: "Inline",
                    underline: "always",
                    isExternal: !1,
                    children: n("Label.LearnMore")
                })]
            }),
            children: (0, i.jsx)(er.Button, {
                variant: "Emphasis",
                size: "Large",
                type: "button",
                onClick: t,
                children: n("Action.CreateMoments")
            })
        })
    };
    var ax = e.i(25505),
        ag = e.i(508019),
        ab = e.i(125677),
        ay = e.i(20227),
        aI = e.i(494601);
    let aT = "text/plain",
        aC = async e => {
            if ("u" < typeof ClipboardItem || "function" != typeof navigator.clipboard.write) return e.then(e => navigator.clipboard.writeText(e));
            let t = e.then(e => new Blob([e], {
                type: aT
            }));
            return t.catch(() => {}), navigator.clipboard.write([new ClipboardItem({
                [aT]: t
            })])
        }, aw = e => {
            let {
                moment: t
            } = e, n = (() => {
                let {
                    ready: e,
                    value: t
                } = (0, d.useFlag)(T.isMomentsShareLinkEnabled);
                return e && null != t && t
            })(), {
                translate: s
            } = (0, u.useTranslation)(), {
                createMomentShareLink: o,
                isCreatingMomentShareLink: r
            } = function() {
                let {
                    mutateAsync: e,
                    isPending: t
                } = (0, eW.useMutation)({
                    mutationFn: e => nd.createStaticLink(e)
                });
                return {
                    createMomentShareLink: (0, a.useCallback)(t => e(t), [e]),
                    isCreatingMomentShareLink: t
                }
            }(), l = (0, a.useRef)(!1), c = s("Action.CopyMomentLink"), m = s("Message.MomentLinkCopied"), p = s("Message.MomentLinkCopyFailed"), h = (0, a.useCallback)(async () => {
                if (l.current || t.status !== eh || !t.feedItemId) return;
                l.current = !0;
                let e = {
                    momentId: t.momentId,
                    feedItemId: t.feedItemId
                };
                tH(tU.CopyShareLink, e);
                try {
                    if (!("clipboard" in navigator)) throw Error("Clipboard API is unavailable");
                    let n = o({
                        momentId: t.momentId,
                        feedItemId: t.feedItemId
                    });
                    await Promise.all([n, aC(n)]), tK(tU.CopyShareLink, e), (0, an.toast)({
                        title: m
                    })
                } catch (t) {
                    tV(tU.CopyShareLink, t, e), (0, an.toast)({
                        title: p
                    })
                } finally {
                    l.current = !1
                }
            }, [o, m, p, t]);
            return n && t.status === eh && t.feedItemId ? (0, i.jsx)(ag.Tooltip, {
                position: "top-center",
                title: c,
                children: (0, i.jsx)(ag.TooltipTrigger, {
                    asChild: !0,
                    children: (0, i.jsx)(P.IconButton, {
                        ariaLabel: c,
                        icon: "icon-regular-chain-link",
                        isDisabled: r,
                        size: "Small",
                        type: "button",
                        variant: "Utility",
                        onClick: h
                    })
                })
            }) : null
        }, aS = {
            [eh]: "bg-system-success",
            [ev]: "bg-system-warning",
            [ef]: "bg-surface-300",
            [ex]: "bg-system-alert"
        }, aA = e => {
            let {
                status: t,
                label: n
            } = e;
            return (0, i.jsxs)("span", {
                className: "inline-flex items-center gap-xsmall",
                children: [(0, i.jsx)("span", {
                    "aria-hidden": !0,
                    className: "size-[8px] radius-circle shrink-0 ".concat(aS[t]),
                    "data-testid": "moment-status-dot-".concat(t)
                }), (0, i.jsx)("span", {
                    children: n
                })]
            })
        };
    var aM = e.i(458451),
        aj = e.i(984863),
        aE = e.i(751846),
        aP = e.i(186930);
    let ak = (0, u.withTranslation)(e => {
            let t, {
                    moment: n
                } = e,
                {
                    translate: s
                } = (0, u.useTranslation)(),
                {
                    user: o
                } = (0, aM.useRobloxAuthentication)(),
                r = n.status === ef,
                l = r && !0 === n.hasLocalVideo,
                d = ad(r ? n.draftId : null, {
                    enabled: l,
                    thumbnailUrl: n.thumbnailUrl,
                    videoUrl: n.videoUrl
                }),
                {
                    assetId: c
                } = n,
                [m, p] = (0, a.useState)(!1),
                h = s("Label.MomentVideoPreview"),
                v = !!(null == d ? void 0 : d.videoUrl) || null != c,
                f = (0, a.useCallback)(() => {
                    v && p(!0)
                }, [v]),
                x = (0, a.useCallback)(() => {
                    p(!1)
                }, []);
            t = (null == d ? void 0 : d.thumbnailUrl) ? (0, i.jsx)("img", {
                alt: "",
                className: "radius-small [object-fit:cover]",
                "data-testid": "moment-video-thumbnail-image",
                height: 48,
                src: d.thumbnailUrl,
                width: 48
            }) : null != c ? (0, i.jsx)("div", {
                className: "radius-small clip size-[48px]",
                "data-testid": "moment-video-thumbnail-image",
                children: (0, i.jsx)(aE.Thumbnail2d, {
                    alt: "",
                    containerClass: "block",
                    imgClassName: "[object-fit:cover]",
                    returnPolicy: aE.ReturnPolicy.PlaceHolder,
                    targetId: c,
                    type: aE.ThumbnailTypes.assetThumbnail
                })
            }) : (0, i.jsx)("div", {
                "aria-hidden": !0,
                className: "radius-small bg-surface-200 size-[48px]"
            });
            let g = null;
            return ((null == d ? void 0 : d.videoUrl) ? g = (0, i.jsx)("video", {
                "aria-label": h,
                autoPlay: !0,
                className: "radius-medium block max-width-[500px] max-height-[500px]",
                loop: !0,
                muted: !0,
                playsInline: !0,
                src: d.videoUrl
            }) : null != c && (g = (0, i.jsx)("div", {
                "aria-label": h,
                className: "radius-medium clip max-width-[500px] max-height-[500px] bg-surface-200",
                children: (0, i.jsx)(aP.RobloxVideoPlayer, {
                    cmcdInstanceType: aP.CmcdInstanceType.CreatorDashboard,
                    cmcdUserId: null == o ? void 0 : o.id,
                    videoAssetId: String(c),
                    environment: "production",
                    src: void 0,
                    autoPlay: !0,
                    disableControls: !0,
                    loop: !0,
                    muted: !0
                })
            })), v) ? (0, i.jsxs)(aj.Popover, {
                open: m,
                onOpenChange: p,
                children: [(0, i.jsx)(aj.PopoverAnchor, {
                    asChild: !0,
                    children: (0, i.jsx)("button", {
                        "aria-label": h,
                        className: "padding-none bg-none stroke-none",
                        type: "button",
                        onPointerEnter: f,
                        onPointerLeave: x,
                        onFocus: f,
                        onBlur: x,
                        children: t
                    })
                }), (0, i.jsx)(aj.PopoverContent, {
                    align: "start",
                    ariaLabel: h,
                    className: "outline-none",
                    side: "bottom",
                    children: g
                })]
            }) : t
        }, [ei.TranslationNamespace.Creations]),
        aL = [10, 25, 50],
        aR = {
            [eh]: "MomentsTable.NoActiveMoments",
            [ef]: "MomentsTable.NoDraftMoments"
        },
        aN = e => {
            let {
                moment: t,
                disabled: n,
                onBlur: s
            } = e, {
                translate: o
            } = (0, u.useTranslation)(), r = nm(t), [l, d] = (0, a.useState)(t.description), c = l.length >= 140, m = (0, a.useCallback)(e => {
                d(e.target.value)
            }, []), p = (0, a.useCallback)(e => {
                s(t, e)
            }, [t, s]);
            return (0, i.jsxs)("div", {
                className: "flex width-full flex-col gap-y-xsmall",
                children: [(0, i.jsx)(nb.TextInput, {
                    id: "moment-description-".concat(r),
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
                    "data-testid": "moment-description-char-count-".concat(r),
                    children: "".concat(l.length, "/").concat(140)
                })]
            })
        },
        aO = e => {
            let {
                moment: t,
                editLabel: n,
                publishingDraftId: s,
                isPublishDisabled: o,
                showContentLanguageColumn: r,
                statusLabel: l,
                onEditMoment: d,
                onDescriptionBlur: c,
                onPublishMoment: m
            } = e, {
                translate: p
            } = (0, u.useTranslation)(), h = nm(t), v = t.status === ef, f = (0, a.useCallback)(() => {
                d(t)
            }, [t, d]), x = (0, a.useCallback)(() => {
                t.status === ef && (null == m || m(t.draftId))
            }, [t, m]);
            return (0, i.jsxs)(ax.TableRow, {
                isHoverable: !0,
                "data-testid": "moment-row-".concat(h),
                children: [(0, i.jsx)(ax.TableCell, {
                    children: (0, i.jsx)(ak, {
                        moment: t
                    })
                }), (0, i.jsx)(ax.TableCell, {
                    children: t.experienceName
                }), (0, i.jsx)(ax.TableCell, {
                    children: t.status === eh ? (0, i.jsx)("span", {
                        "data-testid": "moment-description-".concat(h),
                        children: t.description || "-"
                    }) : (0, i.jsx)(aN, {
                        moment: t,
                        disabled: null != s && s === h,
                        onBlur: c
                    }, "moment-description-".concat(h, "-").concat(t.modifiedAt))
                }), r ? (0, i.jsx)(ax.TableCell, {
                    children: (0, i.jsx)("span", {
                        "data-testid": "moment-content-language-".concat(h),
                        children: tZ(t.locale)
                    })
                }) : null, (0, i.jsx)(ax.TableCell, {
                    children: (0, i.jsx)(aA, {
                        label: l,
                        status: t.status
                    })
                }), (0, i.jsx)(ax.TableCell, {
                    align: "end",
                    children: (0, i.jsxs)("div", {
                        className: "inline-flex items-center gap-xsmall",
                        children: [(0, i.jsx)(aw, {
                            moment: t
                        }), (0, i.jsx)(ag.Tooltip, {
                            position: "top-center",
                            title: n,
                            children: (0, i.jsx)(ag.TooltipTrigger, {
                                asChild: !0,
                                children: (0, i.jsx)(P.IconButton, {
                                    ariaLabel: n,
                                    icon: "icon-regular-pencil",
                                    size: "Small",
                                    type: "button",
                                    variant: "Utility",
                                    onClick: f
                                })
                            })
                        }), v && !0 === t.hasLocalVideo && m ? (0, i.jsx)(er.Button, {
                            size: "Small",
                            type: "button",
                            variant: "Standard",
                            isDisabled: o || null != s,
                            onClick: x,
                            children: p("Action.Publish")
                        }) : null]
                    })
                })]
            })
        },
        aD = (0, u.withTranslation)(e => {
            let {
                moments: t,
                onEditMoment: n,
                onMomentMetadataChange: s,
                onPublishMoment: o,
                publishingDraftId: r = null,
                isPublishDisabled: l = !1,
                hasNextPage: d = !1,
                fetchNextPage: c,
                serverPageSize: m = 25
            } = e, {
                translate: p
            } = (0, u.useTranslation)(), {
                classes: {
                    gridContainer: h,
                    createButtonContainer: v
                }
            } = (0, aI.default)(), {
                statusTab: f
            } = nv(), x = nc(), g = (0, a.useCallback)(e => {
                switch (e) {
                    case eh:
                        return p("MomentsTable.Pills.Active");
                    case ev:
                        return p("MomentsTable.Pills.Pending");
                    case ef:
                        return p("MomentsTable.Pills.Draft");
                    case ex:
                        return p("MomentsTable.Pills.Moderated");
                    default:
                        return e
                }
            }, [p]), b = f === eh, y = (0, a.useMemo)(() => f === ef ? t.filter(e => e.status === ef || e.status === ev) : t.filter(e => e.status === f), [t, f]), {
                page: I,
                rowsPerPage: T,
                onPageChange: C,
                onRowsPerPageChange: w
            } = (0, ay.useTablePagination)({
                count: y.length,
                initialRowsPerPage: 10,
                resetKey: f
            }), {
                currentPage: S
            } = (0, ab.useCurrentPage)(y, {
                page: I,
                rowsPerPage: T,
                hasNextPage: !!b && d,
                fetchNextPage: b ? c : void 0,
                fetchLimit: m
            }), A = (0, a.useCallback)((e, t) => {
                let n = t.target.value;
                n !== e.description && s(e, {
                    description: n
                })
            }, [s]), M = (0, a.useCallback)(e => {
                C(void 0, e)
            }, [C]), j = p("Action.Edit");
            return (0, i.jsx)("div", {
                className: h,
                children: (0, i.jsx)("div", {
                    className: (0, L.clsx)(v, "flex flex-col gap-xlarge width-full self-stretch"),
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col gap-y-medium width-full",
                        children: [(0, i.jsxs)(ax.Table, {
                            className: "width-full",
                            variant: "Framed",
                            children: [(0, i.jsx)(ax.TableHeader, {
                                children: (0, i.jsxs)(ax.TableRow, {
                                    children: [(0, i.jsx)(ax.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Moments")
                                    }), (0, i.jsx)(ax.TableHeaderCell, {
                                        children: p("MomentsTable.Header.ExperienceName")
                                    }), (0, i.jsx)(ax.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Description")
                                    }), x ? (0, i.jsx)(ax.TableHeaderCell, {
                                        children: p("CreateMomentModal.LanguageInput.Label")
                                    }) : null, (0, i.jsx)(ax.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Status")
                                    }), (0, i.jsx)(ax.TableHeaderCell, {
                                        align: "end",
                                        children: " "
                                    })]
                                })
                            }), (0, i.jsx)(ax.TableBody, {
                                children: 0 === y.length ? (0, i.jsx)(ax.TableRow, {
                                    children: (0, i.jsx)(ax.TableCell, {
                                        colSpan: x ? 6 : 5,
                                        align: "center",
                                        className: "padding-y-xxlarge",
                                        children: (0, i.jsx)("span", {
                                            className: "text-body-medium content-muted block padding-y-xxlarge",
                                            "data-testid": "moments-table-empty-filter-message",
                                            children: p(aR[f])
                                        })
                                    })
                                }) : S.map(e => (0, i.jsx)(aO, {
                                    moment: e,
                                    editLabel: j,
                                    publishingDraftId: r,
                                    isPublishDisabled: l,
                                    showContentLanguageColumn: x,
                                    statusLabel: g(e.status),
                                    onEditMoment: n,
                                    onDescriptionBlur: A,
                                    onPublishMoment: o
                                }, nm(e)))
                            })]
                        }), y.length > 0 ? (0, i.jsx)(ax.TablePagination, {
                            paginationAriaLabel: "Pagination",
                            page: I,
                            rowsPerPage: T,
                            totalRows: y.length,
                            rowsPerPageOptions: aL,
                            onPageChange: M,
                            onRowsPerPageChange: w
                        }) : null]
                    })
                })
            })
        }, [ei.TranslationNamespace.Creations, ei.TranslationNamespace.Controls]),
        aU = (0, u.withTranslation)(e => {
            let {
                onRetry: t
            } = e, {
                translate: n
            } = (0, u.useTranslation)();
            return (0, i.jsx)(el.Alert, {
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
        }, [ei.TranslationNamespace.Error]);
    var aB = e.i(917852);
    let az = () => {
            window.open(aB.idVerificationActionUrl, "_blank", "noopener,noreferrer")
        },
        aq = (0, u.withTranslation)(() => {
            let {
                translate: e
            } = (0, u.useTranslation)();
            return (0, i.jsx)(el.Alert, {
                className: "width-full",
                variant: "Feedback",
                severity: "Warning",
                hasCloseAffordance: !1,
                primaryActionLabel: e("Label.VerifyId"),
                onPrimaryAction: az,
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
        }, [ei.TranslationNamespace.Creations]),
        aF = () => {
            var e;
            (() => {
                let {
                    user: e
                } = (0, V.useAuthentication)(), t = null == e ? void 0 : e.id;
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
            } = (0, u.useTranslation)(), {
                user: n
            } = (0, V.useAuthentication)(), s = null == n ? void 0 : n.id, {
                data: o,
                isLoading: r,
                isError: l,
                refetch: c
            } = (0, ai.useCreatorEligibility)(), m = null != (e = null == o ? void 0 : o.creatorEligibility.includes(ae.CreatorEligibilityEnum.IdVerified)) && e, p = r || l || !m, h = !r && !l && !m, v = (0, a.useCallback)(() => {
                c()
            }, [c]), [f, x] = (0, a.useState)(!1), [g, b] = (0, a.useState)(null), [y, I] = (0, a.useState)({}), {
                moments: C,
                updateMoment: w,
                removeMoment: S
            } = eG(), {
                publishMoment: A,
                publishingDraftId: M,
                isPublishing: j
            } = function() {
                var e;
                let {
                    translate: t
                } = (0, u.useTranslation)(), {
                    locale: n
                } = (0, u.useLocalization)(), i = nc(), s = (() => {
                    let {
                        ready: e,
                        value: t
                    } = (0, d.useFlag)(T.isMomentsPostCreationEnabled);
                    return e && null != t && t
                })(), {
                    user: o
                } = (0, V.useAuthentication)(), r = null == o ? void 0 : o.id, {
                    mutateAsync: l,
                    isPending: c,
                    variables: m
                } = (0, eW.useMutation)({
                    mutationFn: async e => {
                        let {
                            moment: a
                        } = e;
                        if (null == r) throw Error("Authenticated user is required to publish a moment");
                        let o = await ek(r, a.draftId);
                        if (!o) throw Error("Local moment video is required before publishing");
                        return await ns({
                            moment: a,
                            file: o,
                            userId: r,
                            uiLocale: n,
                            sendVideoContentLanguage: i,
                            usePostCreation: s,
                            displayName: t("Label.PublishMomentDisplayName") || "Creator Hub Moment"
                        }), a
                    }
                });
                return {
                    publishMoment: (0, a.useCallback)(e => l({
                        moment: e
                    }), [l]),
                    publishingDraftId: c && null != (e = null == m ? void 0 : m.moment.draftId) ? e : null,
                    isPublishing: c
                }
            }(), E = (0, a.useRef)(!1), {
                deleteMoment: P,
                deletingMomentKey: k
            } = function() {
                let {
                    user: e
                } = (0, V.useAuthentication)(), t = (0, e_.useQueryClient)(), n = null == e ? void 0 : e.id, i = nu(), {
                    mutateAsync: s,
                    isPending: o,
                    variables: r
                } = (0, eW.useMutation)({
                    mutationFn: e => {
                        let {
                            moment: t
                        } = e;
                        return t6({
                            momentId: t.momentId,
                            feedItemId: t.feedItemId,
                            useFeedItemId: i
                        })
                    },
                    onSuccess: (e, a) => {
                        let {
                            moment: s
                        } = a;
                        null != n && function(e, t, n) {
                            let i = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
                            e.setQueryData(nh(t, i), e => (null == e ? void 0 : e.pages.length) ? {
                                ...e,
                                pages: e.pages.map(e => ({
                                    ...e,
                                    moments: e.moments.filter(e => nm(e) !== n)
                                }))
                            } : e)
                        }(t, n, nm(s), i)
                    }
                });
                return {
                    deleteMoment: (0, a.useCallback)(e => s({
                        moment: e
                    }), [s]),
                    deletingMomentKey: o && null != r ? nm(r.moment) : null,
                    isDeleting: o
                }
            }(), {
                statusTab: L
            } = nv(), {
                serverMoments: R,
                isAllServerMomentsLoaded: N,
                hasNextPage: O,
                fetchNextPage: D,
                error: U,
                isPending: B,
                isFetchingNextPage: z,
                isFetchNextPageError: q,
                errorUpdatedAt: F,
                loadedPageCount: G,
                refetch: _,
                serverPageSize: H
            } = function() {
                var e;
                let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 25,
                    {
                        data: n,
                        error: i,
                        isPending: s,
                        refetch: o,
                        fetchNextPage: r,
                        hasNextPage: l,
                        isFetchingNextPage: d,
                        isFetchNextPageError: u,
                        errorUpdatedAt: c
                    } = function() {
                        let {
                            user: e
                        } = (0, V.useAuthentication)(), t = null == e ? void 0 : e.id, n = nu();
                        return (0, eK.useInfiniteQuery)({
                            queryKey: nh(t, n),
                            queryFn: null != t ? e => {
                                let {
                                    pageParam: i
                                } = e;
                                return t8(t, i, n)
                            } : eH.skipToken,
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
                            for (let e of n.moments) t.set(nm(e), e);
                        return [...t.values()]
                    }(n.pages) : as, [n]),
                    p = null != (e = null == n ? void 0 : n.pages.length) ? e : 0,
                    h = (0, a.useCallback)(() => {
                        r({
                            cancelRefetch: !1,
                            throwOnError: !1
                        })
                    }, [r]),
                    v = l && !u;
                (0, aa.useBackgroundPageLoader)({
                    hasNextPage: v,
                    fetchNextPage: h,
                    disabled: s
                });
                let f = !v && !s && !d;
                return (0, a.useMemo)(() => ({
                    serverMoments: m,
                    isAllServerMomentsLoaded: f,
                    hasNextPage: v,
                    fetchNextPage: h,
                    error: i,
                    isPending: s,
                    isFetchingNextPage: d,
                    isFetchNextPageError: u,
                    errorUpdatedAt: c,
                    loadedPageCount: p,
                    refetch: o,
                    serverPageSize: t
                }), [v, i, h, f, u, d, s, c, p, o, m, t])
            }(), K = (0, a.useMemo)(() => [...R, ...C].map(e => {
                let t = y[nm(e)];
                return t ? {
                    ...e,
                    ...t
                } : e
            }), [C, y, R]), W = (0, a.useMemo)(() => K.filter(e => e.status !== ex), [K]), J = W.length > 0, Y = (0, a.useRef)(0);
            (0, a.useEffect)(() => {
                !U || B || q || F <= Y.current || (Y.current = F, tV(tU.ListMoments, U, {
                    userId: s,
                    pageCount: G
                }))
            }, [U, F, q, B, G, s]);
            let Q = (0, a.useRef)(!1);
            (0, a.useEffect)(() => {
                if (!q || z) {
                    Q.current = !1;
                    return
                }
                U && !Q.current && (Q.current = !0, tV(tU.FetchNextPage, U, {
                    userId: s,
                    pageCount: G
                }))
            }, [U, q, z, G, s]);
            let X = (0, a.useMemo)(() => {
                    var e;
                    if (!g) return null;
                    let t = nm(g);
                    return null != (e = K.find(e => nm(e) === t)) ? e : g
                }, [g, K]),
                $ = (0, a.useCallback)(e => {
                    b(e), x(!0)
                }, []),
                ee = (0, a.useCallback)(e => {
                    x(e), e || b(null)
                }, []),
                et = (0, a.useCallback)(() => {
                    _()
                }, [_]),
                en = (0, a.useCallback)(() => {
                    (0, an.toast)({
                        title: t("Message.MomentPublishedError")
                    })
                }, [t]),
                ei = (0, a.useCallback)(() => {
                    (0, an.toast)({
                        title: t("Message.MomentUploading")
                    })
                }, [t]),
                ea = (0, a.useCallback)(() => {
                    (0, an.toast)({
                        title: t("Message.MomentProcessing")
                    })
                }, [t]),
                es = (0, a.useCallback)(() => {
                    (0, an.toast)({
                        title: t("Message.MomentDeletedError")
                    })
                }, [t]),
                eo = (0, a.useCallback)(async e => {
                    let t = e.status === ef,
                        n = nm(e),
                        i = {
                            ...t ? {
                                draftId: e.draftId
                            } : {
                                momentId: e.momentId,
                                feedItemId: e.feedItemId
                            },
                            experienceId: ao(e),
                            isLocalMoment: t,
                            userId: s
                        };
                    tH(tU.DeleteMoment, i);
                    try {
                        e.status === ef ? S(e.draftId) : await P(e), I(e => {
                            if (!(n in e)) return e;
                            let {
                                [n]: t, ...i
                            } = e;
                            return i
                        }), x(!1), b(null), tK(tU.DeleteMoment, i)
                    } catch (e) {
                        tV(tU.DeleteMoment, e, i), es()
                    }
                }, [P, S, es, s]),
                er = (0, a.useCallback)((e, t) => {
                    if (e.status === ef) return void w(e.draftId, t);
                    let n = nm(e),
                        i = new Date().toISOString();
                    I(e => ({
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
                el = (0, a.useCallback)(async e => {
                    if (E.current || j || p) return;
                    let t = C.find(t => t.draftId === e);
                    if (!t) return;
                    E.current = !0;
                    let n = {
                        draftId: e,
                        experienceId: ao(t),
                        isLocalMoment: !0,
                        userId: s
                    };
                    tH(tU.PublishMoment, n), ei();
                    try {
                        await A(t), S(e), x(!1), b(null), tK(tU.PublishMoment, n), ea()
                    } catch (e) {
                        tV(tU.PublishMoment, e, n), en()
                    } finally {
                        E.current = !1
                    }
                }, [p, j, C, A, S, en, ei, ea, s]),
                ed = (0, a.useCallback)(e => {
                    e.status === ef && el(e.draftId)
                }, [el]);
            return U && L !== ef && !J ? (0, i.jsx)(at.default, {
                onReload: et
            }) : (!B || J) && (N || J) ? (0, i.jsxs)("div", {
                className: "flex grow-1 flex-col gap-medium self-stretch width-full",
                children: [l ? (0, i.jsx)(aU, {
                    onRetry: v
                }) : null, h ? (0, i.jsx)(aq, {}) : null, J ? (0, i.jsx)(aD, {
                    moments: W,
                    hasNextPage: O,
                    fetchNextPage: D,
                    serverPageSize: H,
                    onEditMoment: $,
                    onMomentMetadataChange: er,
                    onPublishMoment: el,
                    publishingDraftId: M,
                    isPublishDisabled: p
                }) : (0, i.jsx)("div", {
                    className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                    children: (0, i.jsx)(af, {
                        onCreateClick: nF
                    })
                }), (0, i.jsx)(ap, {
                    moment: X,
                    open: f,
                    onOpenChange: ee,
                    onMomentMetadataChange: er,
                    onDelete: X ? eo : void 0,
                    onPublish: (null == X ? void 0 : X.status) === ef ? ed : void 0,
                    publishingDraftId: M,
                    deletingMomentKey: k,
                    isPublishDisabled: p
                }, X ? nm(X) : void 0)]
            }) : (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(Z.ProgressCircle, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            })
        },
        aV = {
            width: "100%",
            height: "100%"
        },
        aG = (0, n0.makeStyles)()(e => ({
            section: {
                ...aV
            },
            container: {
                ...aV
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
        a_ = (0, Y.default)(() => e.A(202045), {
            loadableGenerated: {
                modules: [623728]
            },
            ssr: !1
        }),
        aH = (0, Y.default)(() => e.A(378869), {
            loadableGenerated: {
                modules: [518808]
            },
            ssr: !1
        }),
        aK = (0, Y.default)(() => e.A(580854), {
            loadableGenerated: {
                modules: [427685]
            },
            ssr: !1
        }),
        aW = (0, Y.default)(() => e.A(307640), {
            loadableGenerated: {
                modules: [48220]
            },
            ssr: !1
        }),
        aJ = (0, Y.default)(() => e.A(114198), {
            loadableGenerated: {
                modules: [595604]
            },
            ssr: !1
        }),
        aY = (0, Y.default)(() => e.A(558217), {
            loadableGenerated: {
                modules: [333771]
            },
            ssr: !1
        }),
        aQ = (0, Y.default)(() => e.A(546234), {
            loadableGenerated: {
                modules: [82873]
            },
            ssr: !1
        }),
        aX = (0, Y.default)(() => e.A(85397), {
            loadableGenerated: {
                modules: [973472]
            },
            ssr: !1
        }),
        aZ = (0, Y.default)(() => e.A(890748), {
            loadableGenerated: {
                modules: [835459]
            },
            ssr: !1
        }),
        a$ = (0, Y.default)(() => e.A(68996), {
            loadableGenerated: {
                modules: [565869]
            },
            ssr: !1
        }),
        a0 = (0, Y.default)(() => e.A(441969), {
            loadableGenerated: {
                modules: [415945]
            },
            ssr: !1
        }),
        a1 = (0, Y.default)(() => e.A(481709), {
            loadableGenerated: {
                modules: [947274]
            },
            ssr: !1
        }),
        a2 = (0, Y.default)(() => e.A(272047), {
            loadableGenerated: {
                modules: [616027]
            },
            ssr: !1
        });

    function a4(e) {
        let t = (0, h.readQueryValue)(e);
        return void 0 === t ? m.Asset.MyExperiences : (0, p.isValidEnumValue)(m.Asset, t) ? t : m.Asset.MyExperiences
    }
    let a5 = (0, u.withTranslation)(e => {
            let {
                verificationMetadata: t,
                currentGroup: n,
                currentUser: s,
                allowedAssetTypes: o
            } = e, [r, l] = (0, en.useQueryParams)(["activeTab", "filterIndex"]), {
                resetAllFilters: d
            } = (0, eo.default)(), {
                isFetched: c
            } = (0, f.useGroups)(), {
                isResolving: p
            } = (0, a.useContext)(F), h = C(), v = (0, n6.default)(), T = (0, n9.default)(), {
                translate: w,
                ready: S
            } = (0, u.useTranslation)(), A = (0, b.default)(), M = (0, a.useRef)(void 0), j = (0, a.useMemo)(() => [], []), E = (0, x.isTaxonomyActiveTab)(r.activeTab), P = E || (0, x.isRecentsActiveTab)(r.activeTab), k = (0, a.useMemo)(() => {
                let e = (0, x.isAllAssetTypesActiveTab)(r.activeTab) ? m.Asset.AllCatalogAsset : x.TAXONOMY_HOST_ASSET;
                return I.default.getMenuState(P ? e : a4(r.activeTab), j)
            }, [r.activeTab, j, P]);
            (0, a.useEffect)(() => {
                (0, x.isRecentsActiveTab)(r.activeTab) && l({
                    activeTab: E ? (0, x.buildTaxonomyActiveTab)(x.ALL_ASSET_TYPES_L1_KEY) : m.Asset.AllCatalogAsset,
                    filterIndex: 0
                })
            }, [r.activeTab, E, l]);
            let L = (0, a.useMemo)(() => y.default.filter(e => !j.includes(e.type)), [j]),
                {
                    classes: {
                        section: R,
                        container: N
                    }
                } = aG(),
                O = (0, a.useCallback)(e => {
                    if (k.menuItem === e.menuItem && k.submenuItem === e.submenuItem) return;
                    if ((0, x.shouldOpenTaxonomyView)({
                            isTaxonomyEnabled: A,
                            isChangingSection: k.menuItem !== e.menuItem,
                            nextAssetType: I.default.getAssetType(e)
                        })) return void l({
                        activeTab: x.AVATAR_ITEMS_ACTIVE_TAB,
                        filterIndex: 0
                    });
                    let t = (0, es.isOnItemTab)(e.menuItem.type) ? 0 : void 0;
                    l({
                        activeTab: I.default.getAssetType(e),
                        filterIndex: t
                    })
                }, [k.menuItem, k.submenuItem, l, A]),
                D = (0, a.useMemo)(() => {
                    let e = a4(r.activeTab);
                    if (void 0 === h && e === m.Asset.Moments || void 0 === T && e === m.Asset.Showcase) return k;
                    let t = a4(r.activeTab) === m.Asset.TextDocument;
                    if (void 0 === v && t) return k;
                    let i = I.default.getValidMenuState(L, k, n, void 0, void 0, h, T, v);
                    if (i !== k) {
                        if (!E) {
                            let e = (0, es.isOnItemTab)(i.menuItem.type) ? 0 : void 0;
                            l({
                                activeTab: I.default.getAssetType(i),
                                filterIndex: e
                            })
                        }
                        return i
                    }
                    return k
                }, [L, k, E, r.activeTab, n, h, v, T, l]),
                U = (0, a.useMemo)(() => I.default.getAssetType(D), [D]);
            (0, a.useEffect)(() => {
                if (void 0 === M.current) {
                    M.current = U;
                    return
                }
                let e = M.current;
                e !== U && (M.current = U, (0, g.isDevelopmentItemAsset)(e, v) && (0, g.isDevelopmentItemAsset)(U, v) || d())
            }, [U, v, d]);
            let B = U === m.Asset.MyExperiences || U === m.Asset.SharedExperiences,
                z = (0, a.useMemo)(() => null == o ? void 0 : o.has(U), [U, o]),
                q = (0, g.isDevelopmentItemAsset)(U, v),
                V = (0, a.useMemo)(() => {
                    var e, t;
                    return q ? (0, i.jsx)(a1, {
                        groupId: null == n ? void 0 : n.id,
                        useTabNavigationSpacing: !1,
                        userId: null == s ? void 0 : s.id
                    }) : U === m.Asset.Decal ? (0, i.jsx)(aK, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.Animation ? (0, i.jsx)(aH, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.Audio || U === m.Asset.Video ? (0, i.jsx)(aW, {
                        mediaAssetType: U,
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.Plugin ? (0, i.jsx)(aQ, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.Model ? (0, i.jsx)(aY, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.MeshPart ? (0, i.jsx)(aJ, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.TextDocument ? (0, i.jsx)("div", {
                        className: "flex justify-center items-center padding-y-xxlarge",
                        children: (0, i.jsx)(Z.ProgressCircle, {
                            ariaLabel: w("Label.Loading"),
                            size: "Large",
                            variant: "Indeterminate"
                        })
                    }) : U === m.Asset.ShareLink ? (0, i.jsx)(a$, {}) : U === m.Asset.Moments ? (0, i.jsx)(aF, {}) : U === m.Asset.AssetPermissionRequests ? (0, i.jsx)(a2, {}) : U === m.Asset.Showcase ? (0, i.jsx)(aX, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.AllCatalogAsset || U === m.Asset.AvatarLooks || U === m.Asset.AvatarBackground ? (0, i.jsx)(a_, {
                        assetType: U,
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.Image || U === m.Asset.Mesh ? (0, i.jsx)(aZ, {
                        primitiveAssetType: U,
                        groupId: null == n ? void 0 : n.id
                    }) : z ? (0, i.jsx)(a_, {
                        assetType: U,
                        groupId: null == n ? void 0 : n.id
                    }) : (0, i.jsx)(a0, {
                        assetType: U,
                        creatorType: (null == n ? void 0 : n.id) ? Q.SearchCreatorType.Group : Q.SearchCreatorType.User,
                        creatorTargetId: null != (e = null != (t = null == n ? void 0 : n.id) ? t : null == s ? void 0 : s.id) ? e : 0,
                        isTelemetryReady: c && S && !p && (null == s ? void 0 : s.id) !== void 0 && a4(r.activeTab) === U
                    })
                }, [U, null == n ? void 0 : n.id, null == s ? void 0 : s.id, z, q, w, c, S, p, r.activeTab]);
            return (0, i.jsxs)(ea.default, {
                children: [(0, i.jsx)(X.HubMeta, {
                    title: (0, X.buildTitle)(D.submenuItem ? w(D.submenuItem.nameKey) : w(D.menuItem.nameKey)),
                    breadcrumb: (0, X.buildBreadcrumb)(w("Heading.Creations"), w(D.menuItem.nameKey), D.submenuItem ? w(D.submenuItem.nameKey) : void 0)
                }), (0, i.jsx)("section", {
                    className: R,
                    children: (0, i.jsxs)($.Grid, {
                        container: !0,
                        direction: "column",
                        className: N,
                        children: [(0, i.jsx)(ee.AgeVerificationUpsellBanner, {
                            trackingPage: ee.AgeVerificationUpsellPage.Creations
                        }), !q && (0, i.jsx)(i7, {
                            menuState: D,
                            onMenuStateChange: O,
                            verificationMetadata: t,
                            group: n
                        }), B && (0, i.jsx)(et.default, {}), V]
                    })
                })]
            })
        }, [ei.TranslationNamespace.AssetTypes, ei.TranslationNamespace.Controls, ei.TranslationNamespace.Creations, ei.TranslationNamespace.Error, ei.TranslationNamespace.Navigation, ei.TranslationNamespace.ShareLinksManagement, ei.TranslationNamespace.ExperienceReleases, ei.TranslationNamespace.Taxonomy]),
        a8 = () => {
            let e = (0, f.useCurrentGroup)(),
                {
                    user: t
                } = (0, V.useAuthentication)(),
                n = (0, J.default)(),
                [s, o] = (0, a.useState)(void 0);
            return (0, a.useEffect)(() => {
                (0, y.getAllowedMarketplaceItemTypes)().then(e => {
                    let {
                        assetTypes: t
                    } = e;
                    o(t)
                })
            }, []), (0, i.jsx)(W, {
                children: (0, i.jsx)(a5, {
                    verificationMetadata: n,
                    currentGroup: e,
                    currentUser: t,
                    allowedAssetTypes: s
                })
            })
        };
    var a3 = e.i(675330),
        a6 = e.i(177608),
        a9 = e.i(796266);
    let a7 = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)(a6.default, {
                title: (0, i.jsx)(q, {}),
                secondaryRail: (0, i.jsx)(j, {}),
                secondarySize: "small",
                noBreadCrumbs: !0,
                children: (0, i.jsx)(o.default, {
                    children: t
                })
            })
        },
        se = () => {
            let {
                isResolving: e
            } = (0, a9.default)(), t = (0, a.useMemo)(() => ({
                isResolving: e
            }), [e]);
            return (0, i.jsx)(r.default, {
                children: (0, i.jsx)(a3.default, {
                    children: (0, i.jsx)(s.default, {
                        children: (0, i.jsx)(F.Provider, {
                            value: t,
                            children: (0, i.jsx)(a8, {})
                        })
                    })
                })
            })
        };
    se.getPageLayout = e => (0, i.jsx)(a7, {
        children: e
    }), se.loggerConfig = {
        rosId: "3539"
    }, e.s(["default", 0, se], 962059)
}, 748348, (e, t, n) => {
    let i = "/dashboard/creations";
    (window.__NEXT_P = window.__NEXT_P || []).push([i, () => e.r(962059)]), t.hot && t.hot.dispose(function() {
        window.__NEXT_P.push([i])
    })
}]);

//# debugId=0a09ad06-dbdf-ea15-5eb7-20b9dd9c35cc
//# sourceMappingURL=0_tasmvowt6mn.js.map