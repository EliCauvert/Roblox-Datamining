;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1861767b-813b-521f-50c5-2c5beedbc276")
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
        u = e.i(944672),
        d = e.i(79187),
        c = e.i(134731),
        m = e.i(671376),
        p = e.i(927868),
        h = e.i(692587),
        v = e.i(85057),
        f = e.i(745873),
        x = e.i(130778),
        g = e.i(211461),
        y = e.i(723538),
        b = e.i(117236),
        T = e.i(427149),
        I = e.i(9436);
    let C = () => {
            let {
                ready: e,
                value: t
            } = (0, u.useFlag)(I.isMomentsUploadEnabled);
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
            } = (0, d.useTranslation)(),
            n = (0, f.useCurrentGroup)(),
            i = C(),
            {
                value: s
            } = (0, u.useFlag)(c.isAssetAccessRequestsEnabled),
            o = (0, y.default)(),
            r = (0, a.useMemo)(() => (t, n, i) => {
                let a = new URLSearchParams,
                    s = (0, h.readQueryValue)(e.query.groupId);
                s && a.set("groupId", s), t && a.set("activeTab", t), i && a.set("inventoryAssetTypes", i), void 0 !== n && a.set("filterIndex", String(n));
                let o = a.toString();
                return o ? "/dashboard/creations?".concat(o) : "/dashboard/creations"
            }, [e.query.groupId]),
            v = (0, a.useMemo)(() => b.default.filter(e => e.type !== m.Asset.AssetPermissionRequests || s).filter(e => T.default.isMenuItemEnabled(e, n, void 0, void 0, i)).map(e => {
                var n, i, a;
                let s = e.type === m.Asset.Decal,
                    l = null != (n = null == (a = e.submenuItems) || null == (i = a[0]) ? void 0 : i.type) ? n : e.type,
                    u = S[e.type],
                    d = e.type === m.Asset.TShirt,
                    c = o ? x.AVATAR_ITEMS_ACTIVE_TAB : m.Asset.AvatarLooks;
                return {
                    key: "".concat(w).concat(e.type),
                    label: u ? t(u) : t(e.nameKey),
                    href: e.type === m.Asset.Place ? r() : r(d ? c : l, d ? 0 : void 0, s ? g.DevelopmentItemsAssetTypeFilter.All : void 0)
                }
            }), [r, n, s, i, o, t]),
            I = (0, a.useMemo)(() => {
                var t;
                let n, i = (0, x.isTaxonomyActiveTab)(e.query.activeTab) || (0, x.isRecentsActiveTab)(e.query.activeTab),
                    a = T.default.getMenuState(i ? x.TAXONOMY_HOST_ASSET : (t = e.query.activeTab, void 0 !== (n = (0, h.readQueryValue)(t)) && (0, p.isValidEnumValue)(m.Asset, n) ? n : void 0), []);
                return "".concat(w).concat(a.menuItem.type)
            }, [e.query.activeTab]);
        return {
            activeItem: (0, a.useMemo)(() => v.find(e => e.key === I), [I, v]),
            activeKey: I,
            homeHref: r(),
            isDevelopmentItemsActive: I === A,
            items: v
        }
    }
    let j = () => {
        let {
            translate: e
        } = (0, d.useTranslation)(), {
            activeKey: t,
            items: n
        } = M();
        return (0, i.jsx)(v.default, {
            header: e("Heading.Creations"),
            activeKey: t,
            items: n
        })
    };
    var E = e.i(880343),
        k = e.i(494118),
        P = e.i(441515),
        N = e.i(197649);
    let L = () => a.default.createElement("div", {
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
                href: s,
                leadingIcon: o,
                mediaSrc: r,
                onClick: l
            } = t, u = a.default.createElement("div", {
                className: (0, N.default)("flex items-center gap-small shrink-0 height-600")
            }, o && a.default.createElement(E.Icon, {
                name: o,
                size: "XSmall",
                className: "content-emphasis"
            }), r && a.default.createElement("div", {
                className: "shrink-0 size-500"
            }, a.default.createElement(P.Media, {
                src: r,
                alt: i,
                aspectRatio: "1:1",
                containerClassName: "radius-small clip"
            })), a.default.createElement("span", {
                className: (0, N.default)("text-no-wrap", {
                    "content-emphasis text-title-medium": n,
                    "content-default text-body-medium": !n
                })
            }, i));
            return s && !n ? a.default.createElement("a", {
                href: s,
                onClick: l,
                className: (0, N.default)("flex items-center shrink-0 focus-visible:outline-focus radius-small"),
                style: {
                    textDecoration: "none"
                }
            }, u) : l && !n ? a.default.createElement("button", {
                type: "button",
                onClick: l,
                className: (0, N.default)("flex items-center shrink-0 cursor-pointer padding-none bg-none focus-visible:outline-focus radius-small"),
                style: {
                    border: "none"
                }
            }, u) : a.default.createElement("div", {
                className: "flex items-center shrink-0",
                "aria-current": n ? "page" : void 0
            }, u)
        },
        O = e => {
            let {
                items: t,
                maxItems: n,
                ariaLabel: i,
                expansionAriaLabel: s,
                className: o,
                ...r
            } = e, [l, u] = (0, a.useState)(!1), d = null != n && t.length > n && !l, c = t, m = !1;
            d && (c = [t[0], t[t.length - 1]], m = !0);
            let p = () => {
                u(!0)
            };
            return a.default.createElement("nav", {
                "aria-label": i,
                className: (0, N.default)("flex items-center height-1000", o),
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
                }, m && 1 === t && a.default.createElement(a.default.Fragment, null, a.default.createElement("li", null, a.default.createElement(k.IconButton, {
                    icon: "icon-filled-three-dots-horizontal",
                    ariaLabel: s,
                    size: "XSmall",
                    variant: "Standard",
                    onClick: p,
                    className: "size-600 min-height-600 max-height-600"
                })), a.default.createElement("li", null, a.default.createElement(L, null))), a.default.createElement("li", null, a.default.createElement(R, {
                    item: e,
                    isActive: n
                })), t < c.length - 1 && a.default.createElement("li", null, a.default.createElement(L, null)))
            })))
        };
    O.displayName = "Breadcrumbs";
    var D = e.i(725509);
    let _ = e => {
        let {
            creationsHref: t,
            creationsLabel: n,
            currentLabel: s
        } = e, o = (0, l.useRouter)(), r = (0, D.default)(), u = (0, a.useMemo)(() => [{
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
            className: "max-[600px]:[&_li:not(:first-child)]:[display:none]",
            expansionAriaLabel: r.showHiddenBreadcrumbs,
            items: u
        })
    };
    var U = e.i(376204);
    let B = e => {
            let {
                fallback: t,
                ...n
            } = e, {
                isEnabled: a
            } = (0, U.default)();
            return a ? (0, i.jsx)(_, {
                ...n
            }) : t
        },
        z = () => {
            var e;
            let {
                translate: t
            } = (0, d.useTranslation)(), {
                activeItem: n,
                homeHref: a,
                isDevelopmentItemsActive: s
            } = M(), o = t("Heading.Creations"), r = (0, i.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: null != (e = null == n ? void 0 : n.label) ? e : o
            });
            return s && null != n ? (0, i.jsx)(B, {
                creationsHref: a,
                creationsLabel: o,
                currentLabel: n.label,
                fallback: r
            }) : r
        },
        q = (0, a.createContext)({
            isResolving: !1
        });
    var V = e.i(814975),
        F = e.i(252842),
        G = e.i(533414),
        H = e.i(456810);
    let K = {
            sort: H.defaultAssetsSort,
            sortOrder: F.SortOrder.Desc,
            isArchived: !1,
            isPublishOnly: !1,
            isOnMarketplace: !1
        },
        W = e => {
            let {
                children: t
            } = e, {
                user: n
            } = (0, V.useAuthentication)(), [s, o] = (0, G.useLocalStorage)("creationSort.".concat(null == n ? void 0 : n.id), K.sort), r = (0, a.useRef)(s), l = (0, a.useMemo)(() => {
                let e = r.current;
                return Object.keys(s).some(t => s[t] !== e[t]) && (r.current = s), r.current
            }, [s]), [u, d] = (0, G.useLocalStorage)("creationSortOrder.".concat(null == n ? void 0 : n.id), K.sortOrder), [c, m] = (0, a.useState)(K.isArchived), [p, h] = (0, a.useState)(!1), [v, f] = (0, a.useState)(K.isPublishOnly), [x, g] = (0, a.useState)(K.isOnMarketplace), y = (0, a.useCallback)(() => {
                o(K.sort), d(K.sortOrder), m(K.isArchived), h(!1), f(K.isPublishOnly), g(K.isOnMarketplace)
            }, [o, d]), b = (0, a.useMemo)(() => ({
                isArchived: c,
                isAgeRestrictedCollaboration: p,
                isOnMarketplace: x,
                isPublicOnly: v,
                resetAllFilters: y,
                setIsArchived: m,
                setIsAgeRestrictedCollaboration: h,
                setIsOnMarketplace: g,
                setIsPublicOnly: f,
                setSort: o,
                setSortOrder: d,
                sort: l,
                sortOrder: u
            }), [c, p, x, v, y, m, h, g, f, o, d, l, u]);
            return (0, i.jsx)(H.default.Provider, {
                value: b,
                children: t
            })
        };
    var Y = e.i(668091),
        J = e.i(507742),
        Q = e.i(9618),
        X = e.i(37819),
        Z = e.i(830655),
        $ = e.i(537683),
        ee = e.i(714039),
        et = e.i(896852),
        en = e.i(780880),
        ei = e.i(881670),
        ea = e.i(845592),
        es = e.i(339544),
        eo = e.i(475642),
        er = e.i(968892),
        el = e.i(826246),
        eu = e.i(973047),
        ed = e.i(211388);
    let ec = "CreatorHub.MomentsCreations.local",
        em = e => "".concat(ec, ".").concat(e),
        ep = "".concat(ec, ".__inactive__"),
        eh = "active",
        ev = "pending",
        ef = "draft",
        ex = "moderated",
        eg = [eh, ef],
        ey = [eh, ex, ef],
        eb = e => new Date(e.modifiedAt).getTime(),
        eT = "momentMedia",
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
        }, eC = new Map, ew = (e, t) => "".concat(e, ":").concat(t), eS = (e, t, n) => new Promise((t, n) => {
            if ("u" < typeof indexedDB) return void n(Error("IndexedDB is unavailable"));
            let i = indexedDB.open("".concat("CreatorHub.MomentsVideoMedia", ".").concat(e), 1);
            i.addEventListener("upgradeneeded", () => {
                let e = i.result;
                e.objectStoreNames.contains(eT) || e.createObjectStore(eT, {
                    keyPath: "momentId"
                })
            }), i.addEventListener("success", () => t(i.result)), i.addEventListener("error", () => {
                var e;
                return n(null != (e = i.error) ? e : Error("Failed to open IndexedDB"))
            })
        }).then(e => new Promise((i, a) => {
            let s = n(e.transaction(eT, t).objectStore(eT));
            s.addEventListener("success", () => i(s.result)), s.addEventListener("error", () => {
                var e;
                return a(null != (e = s.error) ? e : Error("IndexedDB request failed"))
            })
        })), eA = e => "object" == typeof e && null !== e && "momentId" in e && "string" == typeof e.momentId && "videoBlob" in e && e.videoBlob instanceof Blob && "thumbnailBlob" in e && e.thumbnailBlob instanceof Blob && "updatedAt" in e && "string" == typeof e.updatedAt, eM = (e, t) => {
            let n = ew(e, t),
                i = eC.get(n);
            i && (URL.revokeObjectURL(i.thumbnailUrl), URL.revokeObjectURL(i.videoUrl), eC.delete(n))
        }, ej = async (e, t, n) => {
            let i = await eI(n),
                a = {
                    momentId: t,
                    videoBlob: n,
                    thumbnailBlob: i,
                    fileName: n.name,
                    updatedAt: new Date().toISOString()
                };
            eM(e, t), await eS(e, "readwrite", e => e.put(a))
        }, eE = new Set(["QuotaExceededError", "NS_ERROR_DOM_QUOTA_REACHED"]), ek = e => !!(e instanceof DOMException && eE.has(e.name)) || e instanceof Error && e.message.toLowerCase().includes("quota"), eP = async (e, t, n, i) => {
            let a = [],
                s = async () => {
                    await ej(e, t, n)
                };
            try {
                return await s(), {
                    evictedMediaDraftIds: a
                }
            } catch (e) {
                if (!ek(e)) throw e
            }
            for (let n of [...i.filter(e => e.draftId !== t && !1 !== e.hasLocalVideo)].sort((e, t) => eb(e) - eb(t))) {
                await eR(e, [n.draftId]), a.includes(n.draftId) || a.push(n.draftId);
                try {
                    return await s(), {
                        evictedMediaDraftIds: a
                    }
                } catch (e) {
                    if (!ek(e)) throw e
                }
            }
            throw Error("Failed to store moment video locally")
        };
    async function eN(e, t) {
        var n, i;
        let a, s = await eS(e, "readonly", e => e.get(t));
        if (!eA(s)) return null;
        let {
            videoBlob: o
        } = s;
        return new File([o], (a = null == (i = (n = s).fileName) ? void 0 : i.trim()) ? a : n.videoBlob.type.includes("quicktime") ? "moment.mov" : "moment.mp4", {
            type: o.type || "video/mp4"
        })
    }
    let eL = async (e, t) => {
        let n = ew(e, t),
            i = eC.get(n);
        if (i) return i;
        let a = await eS(e, "readonly", e => e.get(t));
        if (!eA(a)) return null;
        let s = {
            thumbnailUrl: URL.createObjectURL(a.thumbnailBlob),
            videoUrl: URL.createObjectURL(a.videoBlob)
        };
        return eC.set(n, s), s
    }, eR = async (e, t) => {
        0 !== t.length && await Promise.all(t.map(async t => {
            eM(e, t), await eS(e, "readwrite", e => e.delete(t))
        }))
    }, eO = {
        version: "1",
        moments: []
    }, eD = e => "object" == typeof e && null !== e && !Array.isArray(e), e_ = e => eD(e) && "1" === e.version && Array.isArray(e.moments) ? e.moments : [], eU = e => "string" == typeof e ? e : void 0, eB = e => "number" == typeof e && Number.isFinite(e) ? e : void 0, ez = new Set(Object.values(d.Locale)), eq = e => e_(e).map(e => (e => {
        var t, n, i, a, s, o;
        let r;
        if (!eD(e)) return null;
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
    })(e)).filter(e => null != e), eV = e => {
        if (!e) return [];
        try {
            let t = JSON.parse(e);
            return eq(t)
        } catch (e) {
            return []
        }
    }, eF = e => ({
        version: "1",
        moments: e
    }), eG = () => {
        let {
            user: e
        } = (0, V.useAuthentication)(), t = null == e ? void 0 : e.id, n = null != t, i = n ? em(t) : ep, [s, o] = (0, G.useLocalStorage)(i, eO), r = (0, a.useMemo)(() => n ? eq(s) : [], [n, s]);
        (0, a.useEffect)(() => {
            if (!n || null == t) return;
            let e = e_(s).filter(e => eD(e) && e.status !== ef).map(e => {
                var t, n;
                return eD(e) && null != (t = null != (n = eU(e.draftId)) ? n : eU(e.id)) ? t : ""
            }).filter(e => "" !== e);
            0 !== e.length && (o(eF(r)), eR(t, e))
        }, [n, r, s, o, t]);
        let l = (0, a.useCallback)((e, a) => {
                var s, r, l;
                if (!n || null == t || 0 === e.length) return {
                    moments: [],
                    evictedMediaDraftIds: []
                };
                let {
                    moments: u,
                    evictedMediaDraftIds: d
                } = (l = eV(window.localStorage.getItem(i)), {
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
                })(u, null != (s = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? s : []), m = [...new Set([...null != (r = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? r : [], ...d])];
                return o(eF(c)), m.length > 0 && eR(t, m), {
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
                })(r, e, i);
                return a ? (o(eF(a)), a) : null
            }, [n, r, o, t]),
            c = (0, a.useCallback)(e => {
                if (!n || null == t) return null;
                let i = -1 === r.findIndex(t => t.draftId === e) ? null : r.filter(t => t.draftId !== e);
                return i ? (o(eF(i)), eR(t, [e]), i) : null
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
                return o(eF(i)), eR(t, s), i
            }, [n, r, o, t]);
        return {
            moments: r,
            addMoment: u,
            addMoments: l,
            updateMoment: d,
            removeMoment: c,
            removeMoments: m
        }
    };
    var eH = e.i(795621),
        eK = e.i(711367),
        eW = e.i(630986),
        eY = e.i(182012),
        eJ = e.i(157310),
        eQ = e.i(677753),
        eX = function(e, t) {
            return (eX = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function eZ(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        eX(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function e$(e, t, n, i) {
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

    function e0(e, t) {
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
                var u = [r, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (s = 0)), s;) try {
                    if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                    switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return s.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = u[1], u = [0];
                            continue;
                        case 7:
                            u = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = s.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                s.label = u[1];
                                break
                            }
                            if (6 === u[0] && s.label < a[1]) {
                                s.label = a[1], a = u;
                                break
                            }
                            if (a && s.label < a[2]) {
                                s.label = a[2], s.ops.push(u);
                                break
                            }
                            a[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    u = t.call(e, s)
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

    function e1(e) {
        if (void 0 !== e) return null === e ? null : {
            chunkNum: e.chunkNum,
            eTag: e.eTag
        }
    }

    function e2(e) {
        if (void 0 !== e) return null === e ? null : {
            role: e.role,
            operationId: e.operationId,
            parts: void 0 === e.parts ? void 0 : null === e.parts ? null : e.parts.map(e1)
        }
    }

    function e4(e) {
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

    function e5(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function e8(e) {
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

    function e6(e) {
        if (void 0 !== e) return null === e ? null : {
            text: e.text,
            voiceId: e.voiceId,
            pitch: e.pitch,
            speed: e.speed,
            startTime: e.startTime
        }
    }

    function e3(e) {
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

    function e7(e, t) {
        return null == e ? e : {
            assetId: (0, eQ.exists)(e, "assetId") ? e.assetId : void 0,
            startTime: (0, eQ.exists)(e, "startTime") ? e.startTime : void 0
        }
    }

    function e9(e) {
        var t;
        return null == (t = e) ? t : {
            position: (0, eQ.exists)(t, "position") ? t.position : void 0,
            rotation: (0, eQ.exists)(t, "rotation") ? t.rotation : void 0,
            stickerSize: (0, eQ.exists)(t, "stickerSize") ? t.stickerSize : void 0,
            scale: (0, eQ.exists)(t, "scale") ? t.scale : void 0,
            stickerURI: (0, eQ.exists)(t, "stickerURI") ? t.stickerURI : void 0,
            zIndex: (0, eQ.exists)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function te(e) {
        if (void 0 !== e) return null === e ? null : {
            position: e.position,
            rotation: e.rotation,
            stickerSize: e.stickerSize,
            scale: e.scale,
            stickerURI: e.stickerURI,
            zIndex: e.zIndex
        }
    }

    function tt(e) {
        var t, n;
        return null == (t = e) ? t : {
            position: (0, eQ.exists)(t, "position") ? t.position : void 0,
            rotation: (0, eQ.exists)(t, "rotation") ? t.rotation : void 0,
            scale: (0, eQ.exists)(t, "scale") ? t.scale : void 0,
            text: (0, eQ.exists)(t, "text") ? t.text : void 0,
            textOverlayStyle: (0, eQ.exists)(t, "textOverlayStyle") ? null == (n = t.textOverlayStyle) ? n : {
                font: (0, eQ.exists)(n, "font") ? n.font : void 0,
                fontColor: (0, eQ.exists)(n, "fontColor") ? n.fontColor : void 0,
                fontSize: (0, eQ.exists)(n, "fontSize") ? n.fontSize : void 0,
                textXAlignment: (0, eQ.exists)(n, "textXAlignment") ? n.textXAlignment : void 0
            } : void 0,
            zIndex: (0, eQ.exists)(t, "zIndex") ? t.zIndex : void 0
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
        var t;
        return null == (t = e) ? t : {
            assetId: (0, eQ.exists)(t, "assetId") ? t.assetId : void 0,
            startTime: (0, eQ.exists)(t, "startTime") ? t.startTime : void 0,
            assetAccessContext: (0, eQ.exists)(t, "assetAccessContext") ? t.assetAccessContext : void 0
        }
    }

    function ta(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId,
            startTime: e.startTime,
            assetAccessContext: e.assetAccessContext
        }
    }

    function ts(e) {
        var t;
        return null == (t = e) ? t : {
            httpVerb: (0, eQ.exists)(t, "httpVerb") ? t.httpVerb : void 0,
            url: (0, eQ.exists)(t, "url") ? t.url : void 0,
            chunkNum: (0, eQ.exists)(t, "chunkNum") ? t.chunkNum : void 0,
            contentStart: (0, eQ.exists)(t, "contentStart") ? t.contentStart : void 0,
            contentLength: (0, eQ.exists)(t, "contentLength") ? t.contentLength : void 0,
            expirationTimeMs: (0, eQ.exists)(t, "expirationTimeMs") ? t.expirationTimeMs : void 0
        }
    }

    function to(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eQ.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eQ.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eQ.exists)(t, "operationPath") ? t.operationPath : void 0,
            uploadUrls: (0, eQ.exists)(t, "uploadUrls") ? null === t.uploadUrls ? null : t.uploadUrls.map(ts) : void 0
        }
    }

    function tr(e, t) {
        var n, i, a;
        return null == e ? e : {
            assetId: (0, eQ.exists)(e, "assetId") ? e.assetId : void 0,
            assetAccessContext: (0, eQ.exists)(e, "assetAccessContext") ? e.assetAccessContext : void 0,
            assetTotalDuration: (0, eQ.exists)(e, "assetTotalDuration") ? e.assetTotalDuration : void 0,
            caption: (0, eQ.exists)(e, "caption") ? e.caption : void 0,
            videoContentLanguage: (0, eQ.exists)(e, "videoContentLanguage") ? e.videoContentLanguage : void 0,
            partnerUploadType: (0, eQ.exists)(e, "partnerUploadType") ? e.partnerUploadType : void 0,
            captureType: (0, eQ.exists)(e, "captureType") ? e.captureType : void 0,
            editsType: (0, eQ.exists)(e, "editsType") ? e.editsType : void 0,
            videoCaptureEdits: (0, eQ.exists)(e, "videoCaptureEdits") ? null == (n = e.videoCaptureEdits) ? n : {
                trim: (0, eQ.exists)(n, "trim") ? null == (i = n.trim) ? i : {
                    startTime: (0, eQ.exists)(i, "startTime") ? i.startTime : void 0,
                    endTime: (0, eQ.exists)(i, "endTime") ? i.endTime : void 0
                } : void 0,
                music: (0, eQ.exists)(n, "music") ? e7(n.music) : void 0,
                textOverlays: (0, eQ.exists)(n, "textOverlays") ? null === n.textOverlays ? null : n.textOverlays.map(tt) : void 0,
                stickerOverlays: (0, eQ.exists)(n, "stickerOverlays") ? null === n.stickerOverlays ? null : n.stickerOverlays.map(e9) : void 0,
                ttsAudios: (0, eQ.exists)(n, "ttsAudios") ? null === n.ttsAudios ? null : n.ttsAudios.map(ti) : void 0
            } : void 0,
            screenshotCaptureEdits: (0, eQ.exists)(e, "screenshotCaptureEdits") ? null == (a = e.screenshotCaptureEdits) ? a : {
                music: (0, eQ.exists)(a, "music") ? e7(a.music) : void 0,
                textOverlays: (0, eQ.exists)(a, "textOverlays") ? null === a.textOverlays ? null : a.textOverlays.map(tt) : void 0,
                ttsAudios: (0, eQ.exists)(a, "ttsAudios") ? null === a.ttsAudios ? null : a.ttsAudios.map(ti) : void 0
            } : void 0
        }
    }

    function tl(e, t) {
        var n;
        return null == e ? e : {
            status: (0, eQ.exists)(e, "status") ? e.status : void 0,
            result: (0, eQ.exists)(e, "result") ? null == (n = e.result) ? n : {
                assetId: (0, eQ.exists)(n, "assetId") ? n.assetId : void 0,
                isApproved: (0, eQ.exists)(n, "isApproved") ? n.isApproved : void 0,
                operationError: (0, eQ.exists)(n, "operationError") ? n.operationError : void 0
            } : void 0
        }
    }

    function tu(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eQ.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eQ.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eQ.exists)(t, "operationPath") ? t.operationPath : void 0,
            done: (0, eQ.exists)(t, "done") ? t.done : void 0
        }
    }

    function td(e, t) {
        return null == e ? e : {
            generationToken: (0, eQ.exists)(e, "generationToken") ? e.generationToken : void 0
        }
    }

    function tc(e, t) {
        return null == e ? e : {
            count: (0, eQ.exists)(e, "count") ? e.count : void 0,
            countIsCapped: (0, eQ.exists)(e, "countIsCapped") ? e.countIsCapped : void 0,
            creatorEnabled: (0, eQ.exists)(e, "creatorEnabled") ? e.creatorEnabled : void 0,
            viewerCanRead: (0, eQ.exists)(e, "viewerCanRead") ? e.viewerCanRead : void 0,
            viewerCanWrite: (0, eQ.exists)(e, "viewerCanWrite") ? e.viewerCanWrite : void 0
        }
    }

    function tm(e, t) {
        return null == e ? e : {
            type: (0, eQ.exists)(e, "type") ? e.type : void 0,
            id: (0, eQ.exists)(e, "id") ? e.id : void 0
        }
    }

    function tp(e, t) {
        return null == e ? e : {
            counts: (0, eQ.exists)(e, "counts") ? e.counts : void 0,
            userReaction: (0, eQ.exists)(e, "userReaction") ? e.userReaction : void 0
        }
    }

    function th(e, t) {
        return null == e ? e : {
            shareCount: (0, eQ.exists)(e, "shareCount") ? e.shareCount : void 0
        }
    }

    function tv(e, t) {
        var n;
        return null == e ? e : {
            type: (0, eQ.exists)(e, "type") ? e.type : void 0,
            experienceCta: (0, eQ.exists)(e, "experienceCta") ? null == (n = e.experienceCta) ? n : {
                experienceId: (0, eQ.exists)(n, "experienceId") ? n.experienceId : void 0,
                placeId: (0, eQ.exists)(n, "placeId") ? n.placeId : void 0
            } : void 0
        }
    }

    function tf(e) {
        var t;
        return null == (t = e) ? t : {
            feedSessionId: (0, eQ.exists)(t, "feedSessionId") ? t.feedSessionId : void 0,
            entityId: (0, eQ.exists)(t, "entityId") ? t.entityId : void 0,
            entityType: (0, eQ.exists)(t, "entityType") ? t.entityType : void 0,
            id: (0, eQ.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eQ.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            channelId: (0, eQ.exists)(t, "channelId") ? t.channelId : void 0,
            type: (0, eQ.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eQ.exists)(t, "captionedAssetMoment") ? tr(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eQ.exists)(t, "primaryCta") ? tv(t.primaryCta) : void 0,
            owner: (0, eQ.exists)(t, "owner") ? tm(t.owner) : void 0,
            visibilityStatus: (0, eQ.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eQ.exists)(t, "reactions") ? tp(t.reactions) : void 0,
            comments: (0, eQ.exists)(t, "comments") ? tc(t.comments) : void 0,
            stats: (0, eQ.exists)(t, "stats") ? th(t.stats) : void 0
        }
    }

    function tx(e, t) {
        return null == e ? e : {
            feedItems: (0, eQ.exists)(e, "feedItems") ? e.feedItems : void 0,
            loaded: (0, eQ.exists)(e, "loaded") ? e.loaded : void 0,
            failed: (0, eQ.exists)(e, "failed") ? e.failed : void 0,
            moderated: (0, eQ.exists)(e, "moderated") ? e.moderated : void 0
        }
    }

    function tg(e, t) {
        return null == e ? e : {
            items: (0, eQ.exists)(e, "items") ? null === e.items ? null : e.items.map(tf) : void 0,
            paginationContext: (0, eQ.exists)(e, "paginationContext") ? e.paginationContext : void 0,
            metadata: (0, eQ.exists)(e, "metadata") ? tx(e.metadata) : void 0
        }
    }

    function ty(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, eQ.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eQ.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            channelId: (0, eQ.exists)(t, "channelId") ? t.channelId : void 0,
            type: (0, eQ.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eQ.exists)(t, "captionedAssetMoment") ? tr(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eQ.exists)(t, "primaryCta") ? tv(t.primaryCta) : void 0,
            owner: (0, eQ.exists)(t, "owner") ? tm(t.owner) : void 0,
            visibilityStatus: (0, eQ.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eQ.exists)(t, "reactions") ? tp(t.reactions) : void 0,
            comments: (0, eQ.exists)(t, "comments") ? tc(t.comments) : void 0,
            stats: (0, eQ.exists)(t, "stats") ? th(t.stats) : void 0
        }
    }

    function tb(e) {
        var t;
        return null == (t = e) ? t : {
            startSeconds: (0, eQ.exists)(t, "startSeconds") ? t.startSeconds : void 0,
            endSeconds: (0, eQ.exists)(t, "endSeconds") ? t.endSeconds : void 0,
            text: (0, eQ.exists)(t, "text") ? t.text : void 0
        }
    }

    function tT(e, t) {
        return null == e ? e : {
            signingAlgorithmVersion: (0, eQ.exists)(e, "signingAlgorithmVersion") ? e.signingAlgorithmVersion : void 0,
            signature: (0, eQ.exists)(e, "signature") ? e.signature : void 0
        }
    }
    var tI = eQ.BaseAPI;

    function tC() {
        return null !== tI && tI.apply(this, arguments) || this
    }
    eZ(tC, tI), tC.prototype.backfillTriggerB1Raw = function(e, t) {
        return e$(this, void 0, void 0, function() {
            var n, i, a;
            return e0(this, function(s) {
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
                        return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                }
            })
        })
    }, tC.prototype.backfillTriggerB1 = function() {
        return e$(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e0(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.backfillTriggerB1Raw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var tw = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eZ(t, e), t.prototype.contentCapturesBatchCheckExperienceUploadabilityRaw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesBatchCheckExperienceUploadability = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesBatchCheckExperienceUploadabilityRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibilityRaw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isEligible: (0, eQ.exists)(e, "isEligible") ? e.isEligible : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibility = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return tl(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatus = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return tl(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatusRcc = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a, s;
                    return e0(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eQ.canConsumeForm)([{
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
                                return s = o.sent(), [2, new eQ.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        operationId: (0, eQ.exists)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCreateInfluencerMomentFromVideo = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesGrantExperiencePermissions = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesGrantExperiencePermissionsRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadataRaw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return tT(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadata = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a, s;
                    return e0(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eQ.canConsumeForm)([{
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
                                return s = o.sent(), [2, new eQ.JSONApiResponse(s, function(e) {
                                    return tT(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignFileAndMetadataInternal = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(tn),
                                                                    stickerOverlays: void 0 === e.stickerOverlays ? void 0 : null === e.stickerOverlays ? null : e.stickerOverlays.map(te),
                                                                    ttsAudios: void 0 === e.ttsAudios ? void 0 : null === e.ttsAudios ? null : e.ttsAudios.map(ta)
                                                                }
                                                            }(e.edits)
                                                        }
                                                    }(e.metadata),
                                                    feedRegistrationInfo: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            attributes: void 0 === e.attributes ? void 0 : null === e.attributes ? null : e.attributes.map(e3),
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesUploadCaptureWithAsset = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesUploadCaptureWithAssetRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(eQ.BaseAPI),
        tS = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            eZ(t, e), t.prototype.moderationApplyModerationDecisionRaw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationApplyModerationDecision = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationApplyModerationDecisionRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.moderationReportMomentRaw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eQ.RequiredError("momentId", "Required parameter requestParameters.momentId was null or undefined when calling moderationReportMoment.");
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationReportMoment = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    return e0(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationReportMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(eQ.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            eZ(t, e), t.prototype.momentTextGenerationCreateMomentVideoUploadUrlRaw = function(e) {
                return e$(this, void 0, void 0, function() {
                    var t, n, i;
                    return e0(this, function(a) {
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
                                return i = a.sent(), [2, new eQ.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        uploadUrl: (0, eQ.exists)(e, "uploadUrl") ? e.uploadUrl : void 0,
                                        videoObjectKey: (0, eQ.exists)(e, "videoObjectKey") ? e.videoObjectKey : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationCreateMomentVideoUploadUrl = function(e) {
                return e$(this, void 0, void 0, function() {
                    return e0(this, function(t) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return td(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentText = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return td(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentTextWithVideo = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        status: (0, eQ.exists)(e, "status") ? e.status : void 0,
                                        result: (0, eQ.exists)(e, "result") ? null == (t = e.result) ? t : {
                                            summary: (0, eQ.exists)(t, "summary") ? t.summary : void 0,
                                            description: (0, eQ.exists)(t, "description") ? t.description : void 0,
                                            error: (0, eQ.exists)(t, "error") ? t.error : void 0,
                                            segments: (0, eQ.exists)(t, "segments") ? null === t.segments ? null : t.segments.map(tb) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGetMomentTextGenerationStatus = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationSubmitMomentGeneratedTextFeedback = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentTextGenerationSubmitMomentGeneratedTextFeedbackRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(eQ.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eZ(t, e), t.prototype.momentsCleanUserDataRaw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        notificationId: (0, eQ.exists)(e, "NotificationId") ? e.NotificationId : void 0,
                                        eventType: (0, eQ.exists)(e, "EventType") ? e.EventType : void 0,
                                        eventTime: (0, eQ.exists)(e, "EventTime") ? new Date(e.EventTime) : void 0,
                                        eventPayload: (0, eQ.exists)(e, "EventPayload") ? null == (t = e.EventPayload) ? t : {
                                            userId: (0, eQ.exists)(t, "UserId") ? t.UserId : void 0,
                                            gameIds: (0, eQ.exists)(t, "GameIds") ? t.GameIds : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsCleanUserData = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eQ.RequiredError("momentId", "Required parameter requestParameters.momentId was null or undefined when calling momentsDeleteMoment.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/{momentId}".replace("{".concat("momentId", "}"), encodeURIComponent(String(e.momentId))),
                                    schemaPath: "/v2/moments/{momentId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMoment = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    return e0(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItemRaw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.feedItemId || void 0 === e.feedItemId) throw new eQ.RequiredError("feedItemId", "Required parameter requestParameters.feedItemId was null or undefined when calling momentsDeleteMomentByFeedItem.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/by-feed-item/{feedItemId}".replace("{".concat("feedItemId", "}"), encodeURIComponent(String(e.feedItemId))),
                                    schemaPath: "/v2/moments/by-feed-item/{feedItemId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItem = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    return e0(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentByFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendationsRaw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return tg(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendations = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eQ.exists)(e, "items") ? null === e.items ? null : e.items.map(ty) : void 0,
                                        failedMomentIds: (0, eQ.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eQ.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMoments = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eQ.exists)(e, "items") ? null === e.items ? null : e.items.map(ty) : void 0,
                                        failedMomentIds: (0, eQ.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eQ.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0,
                                        paginationContext: (0, eQ.exists)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, eQ.exists)(e, "metadata") ? tx(e.metadata) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetUsersMoments = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItem = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2Raw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2 = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemV2Raw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsSearchMomentsRaw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return tg(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentsSearchMoments = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var t, n, i;
                    return e0(this, function(a) {
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
                                return i = a.sent(), [2, new eQ.VoidApiResponse(i)]
                        }
                    })
                })
            }, t.prototype.momentsTestSuppressOwnedFeedItems = function(e) {
                return e$(this, void 0, void 0, function() {
                    return e0(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.momentsTestSuppressOwnedFeedItemsRaw(e)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, t
        }(eQ.BaseAPI)),
        tA = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eZ(t, e), t.prototype.postsCompletePostRaw = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                            uploads: void 0 === e.uploads ? void 0 : null === e.uploads ? null : e.uploads.map(e2)
                                        }
                                    }(e.postsCompletePostRequest)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        uploads: (0, eQ.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(tu) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsCompletePost = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
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
                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(e8),
                                                    textToSpeech: void 0 === e.textToSpeech ? void 0 : null === e.textToSpeech ? null : e.textToSpeech.map(e6),
                                                    contentLanguage: e.contentLanguage
                                                }
                                            }(e.common),
                                            videoPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    video: e4(e.video),
                                                    durationSeconds: e.durationSeconds,
                                                    trim: e5(e.trim)
                                                }
                                            }(e.videoPost),
                                            screenshotPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    screenshot: e4(e.screenshot),
                                                    widthPixels: e.widthPixels,
                                                    heightPixels: e.heightPixels
                                                }
                                            }(e.screenshotPost),
                                            influencerVideoPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    video: e4(e.video),
                                                    durationSeconds: e.durationSeconds,
                                                    trim: e5(e.trim)
                                                }
                                            }(e.influencerVideoPost)
                                        }
                                    }(e.postsCreatePostRequest)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        post: (0, eQ.exists)(e, "post") ? null == (t = e.post) ? t : {
                                            operationId: (0, eQ.exists)(t, "operationId") ? t.operationId : void 0
                                        } : void 0,
                                        uploads: (0, eQ.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(to) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsCreatePost = function() {
                return e$(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), e0(this, function(n) {
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
                return e$(this, void 0, void 0, function() {
                    var n, i, a;
                    return e0(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new eQ.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling postsGetPostOperationStatus.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        path: (0, eQ.exists)(e, "path") ? e.path : void 0,
                                        done: (0, eQ.exists)(e, "done") ? e.done : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsGetPostOperationStatus = function(e, t) {
                return e$(this, void 0, void 0, function() {
                    return e0(this, function(n) {
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
        }(eQ.BaseAPI),
        tM = eQ.BaseAPI;

    function tj() {
        return null !== tM && tM.apply(this, arguments) || this
    }
    eZ(tj, tM), tj.prototype.testSeedCreatePostAssetRaw = function(e, t) {
        return e$(this, void 0, void 0, function() {
            var n, i, a;
            return e0(this, function(s) {
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
                        return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                }
            })
        })
    }, tj.prototype.testSeedCreatePostAsset = function() {
        return e$(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e0(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedCreatePostAssetRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tj.prototype.testSeedInspectPostRaw = function(e, t) {
        return e$(this, void 0, void 0, function() {
            var n, i, a;
            return e0(this, function(s) {
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
                        return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                }
            })
        })
    }, tj.prototype.testSeedInspectPost = function() {
        return e$(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e0(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedInspectPostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tj.prototype.testSeedListUserMomentsRaw = function(e) {
        return e$(this, void 0, void 0, function() {
            var t, n, i;
            return e0(this, function(a) {
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
                        return i = a.sent(), [2, new eQ.VoidApiResponse(i)]
                }
            })
        })
    }, tj.prototype.testSeedListUserMoments = function(e) {
        return e$(this, void 0, void 0, function() {
            return e0(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.testSeedListUserMomentsRaw(e)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    }, tj.prototype.testSeedMomentToPostRaw = function(e, t) {
        return e$(this, void 0, void 0, function() {
            var n, i, a;
            return e0(this, function(s) {
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
                        return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                }
            })
        })
    }, tj.prototype.testSeedMomentToPost = function() {
        return e$(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e0(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedMomentToPostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tj.prototype.testSeedSeedBatchRaw = function(e, t) {
        return e$(this, void 0, void 0, function() {
            var n, i, a;
            return e0(this, function(s) {
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
                        return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                }
            })
        })
    }, tj.prototype.testSeedSeedBatch = function() {
        return e$(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e0(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedSeedBatchRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tj.prototype.testSeedSeedMomentRaw = function(e, t) {
        return e$(this, void 0, void 0, function() {
            var n, i, a;
            return e0(this, function(s) {
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
                        return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                }
            })
        })
    }, tj.prototype.testSeedSeedMoment = function() {
        return e$(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e0(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedSeedMomentRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, tj.prototype.testSeedWirePostRaw = function(e, t) {
        return e$(this, void 0, void 0, function() {
            var n, i, a;
            return e0(this, function(s) {
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
                        return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                }
            })
        })
    }, tj.prototype.testSeedWirePost = function() {
        return e$(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), e0(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedWirePostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var tE = e.i(272593);
    let tk = (0, tE.createClientConfiguration)("content-captures-api", "bedev2"),
        tP = new tw(tk),
        tN = new tS(tk),
        tL = new tA(tk),
        tR = Object.assign(tP, {
            momentsGetUsersMoments: e => tN.momentsGetUsersMoments(e),
            momentsDeleteMoment: e => tN.momentsDeleteMoment(e),
            momentsDeleteMomentByFeedItem: e => tN.momentsDeleteMomentByFeedItem(e),
            postsCreatePost: e => tL.postsCreatePost(e),
            postsCompletePost: e => tL.postsCompletePost(e)
        });
    var tO = e.i(773057),
        tD = e.i(227987),
        t_ = e.i(889311),
        tU = e.i(215955),
        tB = ((t = {}).ListMoments = "listMoments", t.FetchNextPage = "fetchNextPage", t.UploadVideo = "uploadVideo", t.ValidateVideo = "validateVideo", t.PersistLocalVideo = "persistLocalVideo", t.PublishMoment = "publishMoment", t.DeleteMoment = "deleteMoment", t.ResolveExperience = "resolveExperience", t.LoadLocalVideoMedia = "loadLocalVideoMedia", t.EnrichExperienceNames = "enrichExperienceNames", t.CopyShareLink = "copyShareLink", t.ListViolations = "listViolations", t);
    let tz = (e, t) => {
            let n;
            return null != t.momentId && (e.momentId = t.momentId), null != t.feedItemId && (e.feedItemId = t.feedItemId), null != t.draftId && (e.draftId = t.draftId), null != t.experienceId && (e.experienceId = String(t.experienceId)), null != t.placeId && (e.placeId = String(t.placeId)), null != t.fileCount && (e.fileCount = String(t.fileCount)), null != t.fileSize && (e.fileSize = String(t.fileSize)), null != t.fileType && t.fileType.length > 0 && (e.fileType = t.fileType), null != t.locale && t.locale.length > 0 && (e.locale = t.locale), null != t.inputValue && t.inputValue.length > 0 && (e.inputValue = (n = t.inputValue).length <= 200 ? n : n.slice(0, 200)), null != t.idType && (e.idType = t.idType), null != t.matchedId && (e.matchedId = String(t.matchedId)), null != t.userId && (e.userId = String(t.userId)), null != t.pageCount && (e.pageCount = String(t.pageCount)), null != t.momentCount && (e.momentCount = String(t.momentCount)), null != t.persistedVideoCount && (e.persistedVideoCount = String(t.persistedVideoCount)), null != t.isLocalMoment && (e.isLocalMoment = String(t.isLocalMoment)), null != t.universeIdCount && (e.universeIdCount = String(t.universeIdCount)), e
        },
        tq = async (e, t) => {
            var n;
            let i = await (0, tD.default)(e),
                a = e instanceof Error ? e.message : "string" == typeof e ? e : "Unknown error";
            return i ? {
                reason: null != (n = null != t ? t : i.message) ? n : a,
                httpStatus: i.status,
                errorCode: i.code
            } : {
                reason: null != t ? t : a
            }
        }, tV = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return {
                eventName: t_.default.MomentsCreationsError,
                parameters: tz({
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
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tU.default,
                a = await tq(t, n.reason);
            i.logErrorEvent(tV(e, a, n))
        }, tG = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tU.default;
            tF(e, t, n, i)
        }, tH = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: t_.default.MomentsCreationsAttempt,
                parameters: tz({
                    operation: e
                }, t)
            }
        }, tK = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: t_.default.MomentsCreationsSuccess,
                parameters: tz({
                    operation: e
                }, t)
            }
        }, tW = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tU.default;
            n.logClickEvent(tH(e, t))
        }, tY = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tU.default;
            n.logImpressionEvent(tK(e, t))
        };
    var tJ = e.i(773595);
    let tQ = tJ.availableDocsLocales,
        tX = new Set(tQ),
        tZ = e => {
            let t = e === d.Locale.SimplifiedChineseJV ? d.Locale.SimplifiedChinese : e;
            return null != t && tX.has(t) ? t : d.Locale.English
        },
        t$ = e => null != e ? (0, d.toLocaleNativeName)(e) : "-",
        t0 = {
            active: eh,
            captionedassetmoment: eh,
            live: eh,
            moderated: ex,
            pending: ev,
            published: eh
        },
        t1 = new Date(0).toISOString(),
        t2 = function(e) {
            var t, n, i, a, s, o, r;
            let l = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                u = null != (t = e.id) ? t : void 0,
                d = null != (n = e.feedItemId) ? n : void 0,
                c = l ? d : u;
            if (null == c || "" === c) return null;
            let m = null != (i = null == (s = e.type) ? void 0 : s.toLowerCase()) ? i : "";
            if ("draft" === m || m.includes("draft")) return null;
            let p = e.captionedAssetMoment,
                h = null == (r = e.primaryCta) || null == (o = r.experienceCta) ? void 0 : o.experienceId,
                v = (e => {
                    if (null != e && "" !== e) return tJ.StringLocaleMap.get(e.toLowerCase())
                })(null == p ? void 0 : p.videoContentLanguage);
            return {
                momentId: u,
                feedItemId: d,
                assetId: null == p ? void 0 : p.assetId,
                description: null != (a = null == p ? void 0 : p.caption) ? a : "",
                experienceName: "",
                modifiedAt: t1,
                status: (e => {
                    if (!e) return eh;
                    let t = t0[e.toLowerCase()];
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
        t4 = function(e) {
            var t;
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return (null != (t = e.items) ? t : []).map(e => t2(e, n)).filter(e => null != e)
        },
        t5 = async (e, t) => tR.momentsGetUsersMoments({
            targetUserId: e,
            paginationContext: null == t ? void 0 : t.paginationContext,
            count: 25
        }), t8 = async e => {
            let t = [...new Set(e.map(e => e.universeId).filter(e => null != e && e > 0))];
            if (0 === t.length) return e;
            try {
                tW(tB.EnrichExperienceNames, {
                    universeIdCount: t.length
                });
                let {
                    data: n = []
                } = await tO.default.getUniversesDetails(t), i = new Map(n.filter(e => null != e.id && "string" == typeof e.name && e.name.length > 0).map(e => [e.id, e.name])), a = e.map(e => {
                    var t;
                    let n = null != e.universeId && null != (t = i.get(e.universeId)) ? t : "";
                    return n === e.experienceName ? e : {
                        ...e,
                        experienceName: n
                    }
                });
                return tY(tB.EnrichExperienceNames, {
                    universeIdCount: t.length
                }), a
            } catch (n) {
                return tG(tB.EnrichExperienceNames, n, {
                    universeIdCount: t.length
                }), e
            }
        }, t6 = async function(e, t) {
            var n, i;
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                s = (null == t ? void 0 : t.paginationContext) != null ? tB.FetchNextPage : tB.ListMoments;
            tW(s, {
                userId: e
            });
            let o = await t5(e, t),
                r = t4(o, a),
                l = await t8(r);
            return tY(s, {
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
    async function t7(e) {
        let {
            feedItemId: t,
            momentId: n,
            useFeedItemId: i = !1
        } = e;
        if (i) {
            if (null == t || "" === t) throw Error("Moment feed item id is required before deleting");
            await tR.momentsDeleteMomentByFeedItem({
                feedItemId: t
            });
            return
        }
        if (null == n || "" === n) throw Error("Moment id is required before deleting");
        await tR.momentsDeleteMoment({
            momentId: n
        })
    }
    var t9 = e.i(721281),
        ne = function(e, t) {
            return (ne = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        },
        nt = function() {
            return (nt = Object.assign || function(e) {
                for (var t, n = 1, i = arguments.length; n < i; n++)
                    for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                return e
            }).apply(this, arguments)
        };

    function nn(e, t, n, i) {
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

    function ni(e, t) {
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
                var u = [r, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (s = 0)), s;) try {
                    if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                    switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return s.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = u[1], u = [0];
                            continue;
                        case 7:
                            u = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = s.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                s.label = u[1];
                                break
                            }
                            if (6 === u[0] && s.label < a[1]) {
                                s.label = a[1], a = u;
                                break
                            }
                            if (a && s.label < a[2]) {
                                s.label = a[2], s.ops.push(u);
                                break
                            }
                            a[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    u = t.call(e, s)
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

    function na(e) {
        return e
    }
    "function" == typeof SuppressedError && SuppressedError;

    function ns(e) {
        var t;
        return null == (t = e) ? t : {
            uid: t.uid,
            create_time: new Date(t.create_time),
            update_time: new Date(t.update_time),
            name: t.name,
            state: t.state,
            abuse_type_keys: t.abuse_type_keys,
            decision_time: (0, eQ.exists)(t, "decision_time") ? new Date(t.decision_time) : void 0,
            message: t.message
        }
    }

    function no(e) {
        var t, n, i;
        return null == (t = e) ? t : {
            uid: t.uid,
            create_time: new Date(t.create_time),
            update_time: new Date(t.update_time),
            name: t.name,
            user: t.user,
            content: (0, eQ.exists)(t, "content") ? function(e) {
                var t, n, i, a, s, o;
                if (null == e) return e;
                switch (e.content_type) {
                    case "CONTENT_TYPE_ASSET":
                        return nt(nt({}, null == (t = e) ? t : {
                            content_type: t.content_type,
                            asset_id: t.asset_id,
                            name: t.name,
                            display_name: (0, eQ.exists)(t, "display_name") ? t.display_name : void 0,
                            description: (0, eQ.exists)(t, "description") ? t.description : void 0,
                            asset_type: t.asset_type
                        }), {
                            content_type: "CONTENT_TYPE_ASSET"
                        });
                    case "CONTENT_TYPE_AVATAR":
                        return nt(nt({}, null == (n = e) ? n : {
                            content_type: n.content_type
                        }), {
                            content_type: "CONTENT_TYPE_AVATAR"
                        });
                    case "CONTENT_TYPE_BUNDLE":
                        return nt(nt({}, null == (i = e) ? i : {
                            content_type: i.content_type,
                            bundle_id: i.bundle_id,
                            name: i.name,
                            display_name: (0, eQ.exists)(i, "display_name") ? i.display_name : void 0,
                            description: (0, eQ.exists)(i, "description") ? i.description : void 0,
                            bundle_type: i.bundle_type
                        }), {
                            content_type: "CONTENT_TYPE_BUNDLE"
                        });
                    case "CONTENT_TYPE_CHAT":
                        return nt(nt({}, null == (a = e) ? a : {
                            content_type: a.content_type,
                            chatlines: a.chatlines,
                            review_time: a.review_time,
                            is_in_app_chat: a.is_in_app_chat,
                            experience_name: (0, eQ.exists)(a, "experience_name") ? a.experience_name : void 0,
                            username: a.username
                        }), {
                            content_type: "CONTENT_TYPE_CHAT"
                        });
                    case "CONTENT_TYPE_LOOK":
                        return nt(nt({}, null == (s = e) ? s : {
                            content_type: s.content_type,
                            id: s.id,
                            name: (0, eQ.exists)(s, "name") ? s.name : void 0,
                            description: (0, eQ.exists)(s, "description") ? s.description : void 0
                        }), {
                            content_type: "CONTENT_TYPE_LOOK"
                        });
                    case "CONTENT_TYPE_USER_PROFILE":
                        return nt(nt({}, null == (o = e) ? o : {
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
            appeals: t.appeals.map(ns),
            allowed_appeal_types: t.allowed_appeal_types.map(na),
            evidence: (0, eQ.exists)(t, "evidence") ? null == (n = t.evidence) ? n : {
                type: n.type,
                elements: (0, eQ.exists)(n, "elements") ? n.elements : void 0,
                elementsObj: (0, eQ.exists)(n, "elementsObj") ? n.elementsObj : void 0,
                display_meta: null == (i = n.display_meta) ? i : {
                    lowercase_key: (0, eQ.exists)(i, "lowercase_key") ? i.lowercase_key : void 0,
                    capitalized_key: (0, eQ.exists)(i, "capitalized_key") ? i.capitalized_key : void 0,
                    icon: (0, eQ.exists)(i, "icon") ? i.icon : void 0
                }
            } : void 0,
            user_note: (0, eQ.exists)(t, "user_note") ? t.user_note : void 0
        }
    }
    var nr = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            ne(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(t, e), t.prototype.listViolationsRaw = function(e, t) {
            return nn(this, void 0, void 0, function() {
                var n, i, a;
                return ni(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new eQ.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling listViolations.");
                            return n = {}, void 0 !== e.pageSize && (n.page_size = e.pageSize), void 0 !== e.pageToken && (n.page_token = e.pageToken), i = {}, [4, this.request({
                                path: "/v1/users/{user_id}/violations".replace("{".concat("user_id", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{user_id}/violations",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    violations: e.violations.map(no),
                                    next_page_token: (0, eQ.exists)(e, "next_page_token") ? e.next_page_token : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.listViolations = function(e, t) {
            return nn(this, void 0, void 0, function() {
                return ni(this, function(n) {
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
    }(eQ.BaseAPI);
    let nl = new class {
            listViolationsRaw(e) {
                return this.violationsApi.listViolationsRaw(e)
            }
            constructor() {
                (0, t9._)(this, "violationsApi", void 0), this.violationsApi = new nr((0, tE.createClientConfiguration)("moderation-appeal-service", "bedev2"))
            }
        },
        nu = e => "object" == typeof e && null !== e && !Array.isArray(e),
        nd = function(e) {
            for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), i = 1; i < t; i++) n[i - 1] = arguments[i];
            for (let t of n) {
                let n = e[t];
                if ("string" == typeof n && "" !== n) return n
            }
        },
        nc = function(e) {
            for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), i = 1; i < t; i++) n[i - 1] = arguments[i];
            for (let t of n) {
                let n = e[t];
                if (nu(n)) return n
            }
        },
        nm = e => {
            var t;
            if (!nu(e)) return !1;
            let n = null != (t = nc(e, "evidence")) ? t : {},
                i = nc(n, "display_meta", "displayMeta");
            return null != i && ("Label.Type.Post" === nd(i, "capitalized_key", "capitalizedKey") || "Label.TypeLower.Post" === nd(i, "lowercase_key", "lowercaseKey"))
        },
        np = e => {
            var t, n;
            if (!nu(e)) return null;
            let i = nd(e, "uid");
            if (null == i) return null;
            let a = null != (t = (e => {
                    let t = nd(e, "create_time", "createTime");
                    if (null == t) return;
                    let n = new Date(t).getTime();
                    return Number.isNaN(n) ? void 0 : new Date(n).toISOString()
                })(e)) ? t : (e => {
                    var t;
                    let n = null == (t = nc(e, "evidence")) ? void 0 : t.elements;
                    if (Array.isArray(n)) {
                        for (let e of n)
                            if (nu(e) && "Label.UploadTime" === e.labelKey && "number" == typeof e.unix && Number.isFinite(e.unix) && e.unix > 0) return new Date(1e3 * e.unix).toISOString()
                    }
                })(e),
                s = (e => {
                    var t, n, i;
                    let a = null == (t = nc(e, "evidence")) ? void 0 : t.elements;
                    if (Array.isArray(a)) {
                        for (let e of a)
                            if (nu(e) && "Label.MomentDescription" === e.labelKey) {
                                let t = null != (n = null == (i = nd(e, "text")) ? void 0 : i.trim()) ? n : "";
                                return t.length > 0 ? t : void 0
                            }
                    }
                })(e);
            return {
                uid: i,
                abuseTypeLabelKeys: Object.values(null != (n = nc(e, "abuse_type_keys", "abuseTypeKeys")) ? n : {}).filter(e => "string" == typeof e && "" !== e),
                ...null != a ? {
                    uploadedAt: a
                } : {},
                ...null != s ? {
                    description: s
                } : {}
            }
        },
        nh = async e => {
            let t, n = [];
            for (let i = 0; i < 20; i += 1) {
                let i = await nl.listViolationsRaw({
                        userId: String(e),
                        pageSize: 10,
                        pageToken: t
                    }),
                    a = await i.raw.json();
                if (!nu(a)) break;
                for (let e of Array.isArray(a.violations) ? a.violations : []) {
                    if (!nm(e)) continue;
                    let t = np(e);
                    null != t && n.push(t)
                }
                if (null == (t = nd(a, "next_page_token", "nextPageToken"))) break
            }
            return n
        };
    var nv = e.i(408068);
    async function nf(e) {
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
    async function ng(e) {
        let t = nv.md5.create();
        for (let n = 0; n < e.size; n += 5242880) {
            let i = Math.min(n + 5242880, e.size);
            t.update(await e.slice(n, i).arrayBuffer())
        }
        return t.hex()
    }
    async function ny(e, t) {
        let n = [];
        for (let [s, o] of e.entries()) {
            var i, a;
            let e = null != (i = o.chunkNum) ? i : s + 1;
            if (!o.url) throw Error("Pre-signed upload URL is missing for video chunk ".concat(e));
            let r = Number(o.contentStart),
                l = Number(o.contentLength),
                u = t.slice(r, r + l);
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
    async function nb(e) {
        var t, n, i, a, s, o;
        let {
            moment: r,
            file: l,
            displayName: u,
            uiLocale: d,
            sendVideoContentLanguage: c = !0
        } = e, m = await nf(l), p = await ng(l), h = {
            caption: r.description,
            ...c ? {
                contentLanguage: (null != (o = r.locale) ? o : tZ(d)).toLowerCase()
            } : {},
            primaryCta: {
                experience: {
                    universeId: r.experienceId,
                    placeId: r.rootPlaceId
                }
            }
        }, v = await tR.postsCreatePost({
            postsCreatePostRequest: {
                common: h,
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
                        description: r.description
                    },
                    durationSeconds: m
                }
            }
        }), f = null == (i = v.post) ? void 0 : i.operationId;
        if (null == f || "" === f) throw Error("Publish operation id is missing from the response");
        let x = null != (t = null == (a = v.uploads) ? void 0 : a.find(e => e.role === nx)) ? t : null == (s = v.uploads) ? void 0 : s[0];
        if (!(null == x ? void 0 : x.operationId)) throw Error("Create post response is missing the video upload target");
        let g = null != (n = x.uploadUrls) ? n : [];
        if (0 === g.length) throw Error("Create post response did not return any upload URLs");
        let y = await ny(g, l);
        return await tR.postsCompletePost({
            postsCompletePostRequest: {
                uploads: [{
                    role: nx,
                    operationId: x.operationId,
                    parts: y
                }]
            }
        }), {
            operationId: f
        }
    }
    async function nT(e) {
        if (!e.moment.experienceId) throw Error("Moment experience is required before publishing");
        if (0 === e.file.size) throw Error("Moment video file must not be empty");
        return nb(e)
    }
    var nI = eQ;
    let nC = "/v2/get-or-create-static";
    class nw extends nI.BaseAPI {
        async createStaticLink(e) {
            let t;
            if ("" === e.feedItemId) throw Error("Moment feed item id is required before creating a share link");
            let n = await this.request({
                    method: "POST",
                    path: nC,
                    schemaPath: nC,
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
                i = await new nI.JSONApiResponse(n).value();
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
    let nS = new nw((0, tE.createClientConfiguration)("deeplinks", "bedev2")),
        nA = () => {
            let {
                ready: e,
                value: t
            } = (0, u.useFlag)(I.isMomentsFeedIdEnabled);
            return e && null != t && t
        },
        nM = () => {
            let {
                ready: e,
                value: t
            } = (0, u.useFlag)(I.isMomentsUploadLanguageSelectEnabled);
            return e && null != t && t
        },
        nj = e => {
            var t, n;
            return e.status === ef ? e.draftId : null != (t = null != (n = e.feedItemId) ? n : e.momentId) ? t : ""
        },
        nE = e => ["momentsCreations", e],
        nk = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return [...nE(e), t]
        },
        nP = () => {
            let {
                ready: e,
                value: t
            } = (0, u.useFlag)(I.isMomentsModeratedTabEnabled);
            return e && null != t && t
        },
        nN = () => {
            let e, t, [{
                    momentStatus: n
                }, i] = (0, en.useQueryParams)(["momentStatus"]),
                s = (0, eH.useQueryClient)(),
                {
                    user: o
                } = (0, V.useAuthentication)(),
                r = nP() ? ey : eg;
            return {
                statusTab: (e = null == n ? void 0 : Array.isArray(n) ? n[0] : n, (t = r.find(t => t === e)) || ef),
                statusTabs: r,
                setStatusTab: (0, a.useCallback)(e => {
                    i({
                        momentStatus: e
                    }), e === eh && s.invalidateQueries({
                        queryKey: nE(null == o ? void 0 : o.id)
                    })
                }, [s, i, null == o ? void 0 : o.id])
            }
        },
        nL = async (e, t, n, i) => {
            let a = {
                draftId: t,
                fileSize: n.size,
                fileType: n.type
            };
            tW(tB.PersistLocalVideo, a);
            try {
                let s, o, {
                    evictedMediaDraftIds: r
                } = await eP(e, t, n, (s = eV(window.localStorage.getItem(em(e))), o = new Set(i.map(e => e.draftId)), [...i, ...s.filter(e => !o.has(e.draftId))]));
                return tY(tB.PersistLocalVideo, a), {
                    hasLocalVideo: !0,
                    storageEvictedMediaDraftIds: r
                }
            } catch (e) {
                return tG(tB.PersistLocalVideo, e, {
                    draftId: t,
                    fileSize: n.size,
                    fileType: n.type
                }), {
                    hasLocalVideo: !1,
                    storageEvictedMediaDraftIds: []
                }
            }
        };
    var nR = e.i(137785);
    let nO = (0, d.withTranslation)(e => {
        let {
            experience: t,
            hideTitle: n = !1,
            onChangeExperience: a
        } = e, {
            translate: s
        } = (0, d.useTranslation)();
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
                children: (0, i.jsx)(nR.default, {
                    disableLink: !0,
                    target: t,
                    targetType: "Experience",
                    variant: "medium"
                })
            })]
        })
    }, [ei.TranslationNamespace.Creations]);
    var nD = e.i(756199),
        n_ = e.i(392782);
    let nU = "UniverseId",
        nB = "PlaceId",
        nz = /(?:https?:\/\/)?create\.roblox\.com\/dashboard\/creations\/experiences\/(\d+)/,
        nq = /(?:https?:\/\/)?(?:www\.)?roblox\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
        nV = /^\d+$/,
        nF = [{
            regex: /(?:https?:\/\/)?create\.sitetest\d\.robloxlabs\.com\/dashboard\/creations\/experiences\/(\d+)/,
            idType: nU
        }, {
            regex: /(?:https?:\/\/)?(?:www\.)?sitetest\d\.robloxlabs\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
            idType: nB
        }],
        nG = (0, d.withTranslation)(e => {
            let {
                onExperienceResolved: t,
                isDisabled: n = !1
            } = e, {
                translate: s
            } = (0, d.useTranslation)(), {
                ready: o,
                value: r
            } = (0, u.useFlag)(I.isMomentsSitetestUrlParsingEnabled), [l, c] = (0, a.useState)(""), [m, p] = (0, a.useState)(!1), [h, v] = (0, a.useState)(), f = (0, a.useMemo)(() => [{
                regex: nz,
                idType: nU
            }, {
                regex: nq,
                idType: nB
            }, ...o && null != r && r ? nF : [], {
                regex: nV,
                idType: nU
            }], [r, o]), x = (0, a.useMemo)(() => l.trim().length > 0 && f.some(e => {
                let {
                    regex: t
                } = e;
                return t.test(l.trim())
            }), [f, l]), g = (0, a.useCallback)(async () => {
                var e, n, i, a, o, r;
                let u = l.trim(),
                    d = f.find(e => {
                        let {
                            regex: t
                        } = e;
                        return t.test(u)
                    });
                if (!d) return;
                let m = d.idType === nU && nV.test(u) ? Number(u) : Number(null == (e = d.regex.exec(u)) ? void 0 : e[1]);
                if (!m || !Number.isFinite(m)) return;
                let h = {
                    inputValue: u,
                    idType: d.idType,
                    matchedId: m
                };
                p(!0), v(void 0), tW(tB.ResolveExperience, h);
                try {
                    let e;
                    if (d.idType === nB) {
                        let t = null == (r = (await n_.default.multigetPlaceDetails([m]))[0]) ? void 0 : r.universeId;
                        if (!t) {
                            tG(tB.ResolveExperience, "Experience not found", {
                                ...h,
                                placeId: m,
                                reason: "ExperienceNotFound"
                            }), v(s("Error.ExperienceNotFound")), p(!1);
                            return
                        }
                        e = t
                    } else e = m;
                    let l = null == (o = (await n_.default.getDetails([e])).data) ? void 0 : o[0];
                    if (!(null == l ? void 0 : l.id)) {
                        tG(tB.ResolveExperience, "Experience not found", {
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
                    }), tY(tB.ResolveExperience, {
                        ...h,
                        experienceId: l.id,
                        placeId: d.idType === nB ? m : void 0
                    }), c("")
                } catch (e) {
                    tG(tB.ResolveExperience, e, {
                        ...h,
                        placeId: d.idType === nB ? m : void 0,
                        experienceId: d.idType === nU ? m : void 0
                    }), v(s("Error.ExperienceNotFound"))
                } finally {
                    p(!1)
                }
            }, [t, f, s, l]), y = (0, a.useCallback)(e => {
                "Enter" === e.key && x && (g(), e.preventDefault())
            }, [x, g]);
            return (0, i.jsxs)("div", {
                className: "flex flex-row gap-x-medium items-end width-full",
                children: [(0, i.jsx)("div", {
                    className: "grow-1 min-width-0",
                    children: (0, i.jsx)(nD.TextInput, {
                        label: s("CreateMomentModal.ExperienceInput.Label"),
                        placeholder: s("CreateMomentModal.ExperienceInput.Placeholder"),
                        value: l,
                        onChange: e => {
                            c(e.target.value), v(void 0)
                        },
                        onKeyDown: y,
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
    var nH = e.i(222298),
        nK = e.i(732749);
    let nW = (0, d.withTranslation)(e => {
        let {
            value: t,
            onChange: n,
            isDisabled: s = !1
        } = e, {
            translate: o
        } = (0, d.useTranslation)(), r = o("CreateMomentModal.LanguageInput.Label"), l = o("CreateMomentModal.LanguageInput.Placeholder"), u = (0, a.useCallback)(e => {
            tX.has(e) && n(e)
        }, [n]);
        return (0, i.jsx)("div", {
            className: "width-full",
            "data-testid": "moments-language-select",
            children: (0, i.jsx)(nH.Dropdown, {
                className: "width-full [&_.content-system-alert]:text-caption-medium",
                size: "Medium",
                label: r,
                ariaLabel: r,
                placeholder: l,
                value: t,
                isDisabled: s,
                onValueChange: u,
                children: (0, i.jsx)(nK.Menu, {
                    children: (0, i.jsx)(nK.MenuSection, {
                        children: tQ.map(e => (0, i.jsx)(nK.MenuItem, {
                            value: e,
                            title: (0, d.toLocaleNativeName)(e),
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
    var nY = e.i(321211);
    let nJ = ["mp4", "mov"],
        nQ = ["video/mp4", "video/quicktime"];
    var nX = ((n = {}).FileTooBig = "FileTooBig", n.FileWrongType = "FileWrongType", n.DurationExceeded = "DurationExceeded", n.ResolutionExceeded = "ResolutionExceeded", n.MetadataUnavailable = "MetadataUnavailable", n);
    let nZ = e => {
            var t, n;
            let i;
            return e.size > 0xc800000 ? "FileTooBig" : null != (i = null == (n = (t = e).name.split(".").pop()) ? void 0 : n.toLowerCase()) && nJ.some(e => e === i) && ("" === t.type || nQ.includes(t.type)) ? null : "FileWrongType"
        },
        n$ = async e => {
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
        }, n0 = async e => {
            let t = [],
                n = [];
            for (let i of e) {
                let e = nZ(i);
                if (null != e) {
                    n.push({
                        file: i,
                        reason: e
                    });
                    continue
                }
                let a = await n$(i);
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
        }, n1 = nJ.map(e => e.toUpperCase()).join("/"), n2 = (0, d.withTranslation)(e => {
            let {
                hasSelectedExperience: t,
                hasSelectedLanguage: n,
                selectedFiles: s,
                isUploading: o = !1,
                onFilesChange: r,
                onValidationErrorsChange: l
            } = e, {
                translate: u
            } = (0, d.useTranslation)(), [c, m] = (0, a.useState)(!1), p = u("CreateMomentModal.DropTarget.UploadButton"), h = u("CreateMomentModal.DropTarget.NoExperienceAddedText"), v = u("CreateMomentModal.DropTarget.ExperienceAddedText"), [f, x] = (0, a.useState)(!1), g = t && n, y = t ? v : h, b = (0, a.useRef)(r), T = (0, a.useRef)(l), I = (0, a.useRef)(u);
            b.current = r, T.current = l, I.current = u;
            let C = (0, a.useCallback)(async e => {
                    var t, n, i, a;
                    if (x(!1), !g || o || c) return;
                    let s = Array.from(null != e ? e : []);
                    if (0 !== s.length) {
                        null == (t = T.current) || t.call(T, []), m(!0);
                        try {
                            let {
                                validFiles: e,
                                errors: t
                            } = await n0(s);
                            if (t.length > 0) {
                                for (let {
                                        file: e,
                                        reason: n
                                    }
                                    of t) tG(tB.ValidateVideo, n, {
                                    fileSize: e.size,
                                    fileType: e.type,
                                    reason: n
                                });
                                null == (n = T.current) || n.call(T, (i = I.current, a = t.map(e => {
                                    let {
                                        reason: t
                                    } = e;
                                    return t
                                }), [...new Set(a)].map(e => ((e, t) => {
                                    switch (t) {
                                        case nX.FileTooBig:
                                            return e("CreateMomentModal.Error.FileTooBigMegabytes", {
                                                maxFileSizeMB: new Intl.NumberFormat().format(200)
                                            });
                                        case nX.FileWrongType:
                                            return e("CreateMomentModal.Error.FileWrongType", {
                                                formats: n1
                                            });
                                        case nX.DurationExceeded:
                                            return e("CreateMomentModal.Error.DurationExceeded", {
                                                maxDurationMinutes: String(5)
                                            });
                                        case nX.ResolutionExceeded:
                                            return e("CreateMomentModal.Error.ResolutionExceeded", {
                                                maxWidth: String(4096),
                                                maxHeight: String(2160)
                                            });
                                        case nX.MetadataUnavailable:
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
                children: (0, i.jsx)(nY.default, {
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
                            children: y
                        }), s.map(e => (0, i.jsx)("span", {
                            className: "text-body-small content-muted text-align-x-center",
                            children: e.name
                        }, "".concat(e.name, "-").concat(e.lastModified)))]
                    })
                })
            })
        }, [ei.TranslationNamespace.Creations]), n4 = (0, d.withTranslation)(e => {
            let {
                open: t,
                onOpenChange: n,
                onMomentUploaded: s
            } = e, {
                addMoments: o
            } = eG(), {
                setStatusTab: r
            } = nN(), l = nM(), {
                translate: u
            } = (0, d.useTranslation)(), {
                locale: c
            } = (0, d.useLocalization)(), m = tZ(c), [p, h] = (0, a.useState)(), [v, f] = (0, a.useState)(), x = null != v ? v : m, [g, y] = (0, a.useState)([]), [b, T] = (0, a.useState)([]), I = (0, a.useRef)(0), {
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
                                } = await nL(r, e.draftId, o, []);
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
                                        hasLocalVideo: u,
                                        storageEvictedMediaDraftIds: d
                                    } = await nL(r, o.draftId, n, e);
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
                            n(!1), s(0)
                        }
                    }, [null == e ? void 0 : e.id]),
                    isUploading: t,
                    uploadProgress: i
                }
            })(), S = (0, a.useCallback)(() => {
                h(void 0), f(void 0), y([]), T([])
            }, []), A = (0, a.useCallback)(() => {
                n(!1), S()
            }, [n, S]), M = (0, a.useCallback)(e => {
                h(e)
            }, []), j = (0, a.useCallback)(e => {
                f(e)
            }, []), E = (0, a.useCallback)(() => {
                I.current += 1, y([]), T([]), h(void 0)
            }, []), k = (0, a.useCallback)(e => {
                !w && (n(e), e || S())
            }, [w, n, S]), P = (0, a.useCallback)(e => {
                T(e)
            }, []), N = (0, a.useCallback)(() => {
                T([])
            }, []), L = (0, a.useCallback)(async e => {
                var t, n, i;
                if (0 === e.length || (null == p ? void 0 : p.id) == null || l && null == x || w) return void y(e);
                let a = I.current + 1;
                I.current = a, y(e), tW(tB.UploadVideo, {
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
                    if (I.current !== a) return;
                    s ? t.forEach(e => {
                        s(e)
                    }) : o(t, {
                        storageEvictedMediaDraftIds: i
                    }), tY(tB.UploadVideo, {
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
                    if (I.current !== a) return;
                    tG(tB.UploadVideo, t, {
                        experienceId: p.id,
                        fileCount: e.length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (i = e[0]) ? void 0 : i.type,
                        ...l ? {
                            locale: x
                        } : {}
                    }), y([])
                }
            }, [o, A, l, w, s, p, x, r, C]), R = u("CreateMomentModal.Title"), O = b[0], D = b.length > 1 ? b.slice(1).join(" ") : void 0;
            return (0, i.jsx)(eu.Dialog, {
                open: t,
                onOpenChange: k,
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: u("Action.Close"),
                children: (0, i.jsx)(eu.DialogContent, {
                    className: "flex flex-col min-width-0 width-[min(720px,95vw)] !max-width-[min(720px,95vw)]",
                    children: (0, i.jsxs)(eu.DialogBody, {
                        className: "flex flex-col gap-y-medium",
                        children: [(0, i.jsx)(eu.DialogTitle, {
                            className: "text-heading-small content-emphasis margin-none",
                            children: R
                        }), null != O ? (0, i.jsx)("div", {
                            className: "width-full margin-top-small padding-bottom-small",
                            children: (0, i.jsx)(el.Alert, {
                                className: "width-full",
                                variant: "Feedback",
                                severity: "Error",
                                hasCloseAffordance: !0,
                                onDismiss: N,
                                closeLabel: u("Action.Close"),
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
                        }) : null, p ? (0, i.jsx)(nO, {
                            experience: p,
                            onChangeExperience: E
                        }) : (0, i.jsx)(nG, {
                            onExperienceResolved: M,
                            isDisabled: w
                        }), l ? (0, i.jsx)(nW, {
                            value: x,
                            onChange: j,
                            isDisabled: w
                        }) : null, (0, i.jsx)(n2, {
                            hasSelectedExperience: (null == p ? void 0 : p.id) != null,
                            hasSelectedLanguage: !l || null != x,
                            selectedFiles: g,
                            isUploading: w,
                            onFilesChange: L,
                            onValidationErrorsChange: P
                        })]
                    })
                })
            })
        }, [ei.TranslationNamespace.Creations, ei.TranslationNamespace.Controls]);

    function n5() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        (0, ed.openDialog)({
            component: n4,
            props: e,
            options: {
                mode: "standalone"
            }
        })
    }
    let n8 = () => n5(),
        n6 = () => {
            let {
                translate: e
            } = (0, d.useTranslation)();
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(er.Button, {
                    variant: "Emphasis",
                    size: "Large",
                    type: "button",
                    onClick: n8,
                    children: e("Action.CreateMoments")
                })
            })
        };
    var n3 = e.i(420028);
    let n7 = e => {
            let {
                tabs: t = eg,
                selected: n,
                onChange: a,
                labels: s,
                groupLabel: o
            } = e;
            return (0, i.jsx)("div", {
                className: "inline-flex wrap items-center gap-small",
                "data-testid": "moments-status-filter-pills",
                role: "radiogroup",
                "aria-label": o,
                children: t.map(e => (0, i.jsx)(n3.Chip, {
                    "data-testid": "moments-status-pill-".concat(e),
                    isChecked: n === e,
                    size: "Medium",
                    text: s[e],
                    onCheckedChange: t => {
                        t && a(e)
                    }
                }, e))
            })
        },
        n9 = () => {
            let {
                translate: e
            } = (0, d.useTranslation)(), {
                statusTab: t,
                statusTabs: n,
                setStatusTab: s
            } = nN(), o = (0, a.useMemo)(() => ({
                [eh]: e("MomentsTable.Pills.Active"),
                [ef]: e("MomentsTable.Pills.Draft"),
                [ex]: e("MomentsTable.Pills.Moderated")
            }), [e]);
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(n7, {
                    groupLabel: e("MomentsTable.Header.Status"),
                    tabs: n,
                    labels: o,
                    selected: t,
                    onChange: s
                })
            })
        };
    var ie = e.i(253536),
        it = e.i(418564);
    let ii = e => {
        var t, n, a;
        let {
            data: s
        } = e, {
            translate: o
        } = (0, d.useTranslation)(), r = (null == s || null == (n = s.creationAccessMetadata) ? void 0 : n.accessAllowed) === !1;
        if (!r) return null;
        let l = null != (t = null == s || null == (a = s.creationAccessMetadata) ? void 0 : a.daysToUnblock) ? t : 0,
            u = r && -1 === l;
        return (0, i.jsx)(it.default, {
            alertTitle: u ? o("Heading.PermanentlyCreationBanned") : o("Heading.TemporaryCreationBanned", {
                days: l.toString()
            }),
            alertDescription: o(u ? "Description.PermanentlyCreationBanned" : "Description.TemporaryCreationBanned"),
            severity: "warning",
            externalLink: ie.MARKETPLACE_POLICY,
            linkLabel: o("Label.MarketplacePolicy"),
            allowCloseDialog: !1
        })
    };
    var ia = e.i(416504),
        is = e.i(401631),
        io = e.i(940685),
        ir = e.i(95063),
        il = e.i(695763),
        iu = e.i(756568),
        id = e.i(131385),
        ic = e.i(643093);
    let im = () => {
        let {
            translate: e
        } = (0, d.useTranslation)(), [{
            activeTab: t
        }, n] = (0, en.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: s,
            activeL1Key: o
        } = (0, id.default)(!0), r = (0, x.isAllAssetTypesActiveTab)(t), l = (0, x.isAvatarLooksActiveTab)(t), u = (0, a.useCallback)(e => {
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
            children: [(0, i.jsx)(n3.Chip, {
                text: e("Label.Avatars"),
                size: "Medium",
                variant: "Standard",
                isChecked: l,
                onCheckedChange: m
            }), s.map(t => {
                var n;
                return (0, i.jsx)(n3.Chip, {
                    text: (0, ic.taxonomyOptionLabel)(t, e),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: t.taxonomyKey === o,
                    onCheckedChange: () => u(t.taxonomyKey)
                }, null != (n = t.taxonomyKey) ? n : t.nameKey)
            }), (0, i.jsx)(n3.Chip, {
                text: e("Label.AllAssetTypes"),
                size: "Medium",
                variant: "Standard",
                isChecked: r,
                onCheckedChange: c
            })]
        }) : null
    };
    var ip = e.i(638016),
        ih = e.i(348558),
        iv = e.i(100226);
    let ix = (e, t) => {
            let n = C(),
                i = (0, iv.default)(),
                s = (0, ih.default)(),
                {
                    data: o
                } = (0, eJ.useQuery)({
                    queryKey: ["avatar-items-entry-point-asset-types"],
                    queryFn: b.getAvatarItemsEntryPointAssetTypes,
                    staleTime: 3e5
                });
            return (0, a.useMemo)(() => {
                var a, r;
                return null != (a = null == (r = e.menuItem.submenuItems) ? void 0 : r.filter(a => T.default.isMenuItemEnabled(a, t, "Label.AvatarItems" === e.menuItem.nameKey ? null == o ? void 0 : o.has(a.type) : void 0, o, n, i, s))) ? a : []
            }, [e.menuItem.submenuItems, e.menuItem.nameKey, t, o, n, i, s])
        },
        ig = (0, il.makeStyles)()(e => ({
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
        iy = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                group: s
            } = e, {
                classes: {
                    subMenuContainer: o,
                    subMenu: r,
                    backButton: l,
                    nextButton: u,
                    chip: c
                },
                cx: m
            } = ig(), p = (0, a.useRef)(null), {
                translate: h
            } = (0, d.useTranslation)(), [v, f] = (0, a.useState)(0), [x, g] = (0, a.useState)(0), [y, b] = (0, a.useState)(0), {
                isTaxonomyMode: I
            } = (0, ip.default)(T.default.getAssetType(t)), C = ix(t, s), w = (0, a.useMemo)(() => v <= 0, [v]), S = (0, a.useMemo)(() => v + y >= x, [v, x, y]), A = () => {
                var e, t, n;
                let i = null == p ? void 0 : p.current;
                f(null != (e = null == i ? void 0 : i.scrollLeft) ? e : 0), g(null != (t = null == i ? void 0 : i.scrollWidth) ? t : 0), b(null != (n = null == i ? void 0 : i.offsetWidth) ? n : 0)
            };
            return ((0, a.useEffect)(() => {
                let e = null == p ? void 0 : p.current,
                    t = new ResizeObserver(A);
                return e && (e.addEventListener("scroll", A), t.observe(e)), () => {
                    e && (e.removeEventListener("scroll", A), t.unobserve(e))
                }
            }, []), I) ? (0, i.jsx)(im, {}) : (0, i.jsxs)(iu.Flex, {
                classes: {
                    root: o
                },
                children: [!w && (0, i.jsx)("div", {
                    className: l,
                    children: (0, i.jsx)(is.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: -y,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "back",
                        children: (0, i.jsx)(io.NavigateBeforeIcon, {
                            fontSize: "small"
                        })
                    })
                }), (0, i.jsx)("div", {
                    ref: p,
                    className: m(r, "flex max-medium:wrap max-medium:gap-y-small"),
                    children: null == C ? void 0 : C.map(e => {
                        let a = t.submenuItem === e;
                        return (0, i.jsx)(ia.Chip, {
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
                    className: u,
                    children: (0, i.jsx)(is.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: y,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "next",
                        children: (0, i.jsx)(ir.NavigateNextIcon, {
                            fontSize: "small"
                        })
                    })
                })]
            })
        };
    var ib = e.i(54842),
        iT = e.i(960916),
        iI = e.i(610932),
        iC = e.i(246602),
        iw = e.i(239328),
        iS = e.i(823062),
        iA = e.i(198528),
        iM = e.i(949599),
        ij = e.i(704443),
        iE = e.i(696564),
        ik = e.i(848427),
        iP = e.i(547710),
        iN = e.i(319266),
        iL = e.i(157852),
        iR = e.i(484541),
        iO = e.i(485681),
        iD = e.i(930669),
        i_ = e.i(230553),
        iU = e.i(525861),
        iB = e.i(893502),
        iz = e.i(695073),
        iq = e.i(205357),
        iV = e.i(46591),
        iF = e.i(611043),
        iG = e.i(459703),
        iH = e.i(913893),
        iK = e.i(185915);

    function iW(e) {
        if (void 0 === e.id || void 0 === e.autoPublishEnabled) throw Error("Publishing preferences response was malformed");
        return e
    }
    async function iY(e) {
        return iW(await iH.default.getPublishingPreferences(e))
    }
    async function iJ(e) {
        return iW(await iH.default.createPublishingPreferences(e))
    }
    var iQ = e.i(812141);
    let iX = e => {
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
            }), (0, i.jsx)(iR.Divider, {})]
        })
    };

    function iZ(e) {
        return 4 === e || 2 === e
    }

    function i$(e, t, n) {
        return e && t && "all" === n ? 1 : e && t && "specific" === n ? 4 : e && !t ? 3 : !e && t ? 2 : 0
    }
    let i0 = e => {
        var t;
        let {
            open: n,
            onClose: s
        } = e, {
            translate: o
        } = (0, d.useTranslation)(), {
            enqueue: r
        } = (0, iG.useSnackbar)(), {
            user: l
        } = (0, V.useAuthentication)(), u = (0, f.useCurrentGroup)(), c = null == u ? void 0 : u.id, {
            data: m
        } = (0, iQ.default)(iH.default), p = null != (t = null == m ? void 0 : m.maxCollectiblePrice) ? t : iE.DefaultMaxCollectiblePrice, [h, v] = (0, a.useState)(!0), [x, g] = (0, a.useState)(!1), [y, b] = (0, a.useState)(!1), [T, I] = (0, a.useState)(""), [C, w] = (0, a.useState)(""), [S, A] = (0, a.useState)(!0), [M, j] = (0, a.useState)(!0), [E, k] = (0, a.useState)(!0), [P, N] = (0, a.useState)("all"), [L, R] = (0, a.useState)(""), [O, D] = (0, a.useState)(!1);
        (0, a.useEffect)(() => {
            n && iY(c).then(e => {
                I(String(e.priceOffset)), w(e.priceInRobux > 0 ? String(e.priceInRobux) : ""), A(e.enableRegionalPricing), b(e.isRentalOptIn);
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
                j(t.sellInMarketplace), k(t.sellInExperiences), N(t.experienceLocationMode), e.places.length > 0 && R(e.places.join(","))
            }).catch(e => {
                var t;
                (null == (t = (0, iK.default)(e)) ? void 0 : t.status) !== 404 && (D(!0), r({
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
        let _ = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.id) {
                    g(!0);
                    try {
                        let e = i$(M, E, P),
                            t = iZ(e) ? L.split(",").filter(Boolean).map(e => Number(e)) : [];
                        await iJ({
                            creatorUserId: l.id,
                            creatorGroupId: c,
                            publishingType: 2,
                            saleLocationType: e,
                            places: t,
                            priceInRobux: Number(C) || 0,
                            priceOffset: Number(T),
                            isFree: !1,
                            enableRegionalPricing: S,
                            isRentalOptIn: y,
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
                        let e = await (0, tD.default)(t);
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
            }, [l, c, M, E, P, L, C, T, S, y, r, s, o]),
            U = (0, a.useCallback)(() => {
                _()
            }, [_]),
            B = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && I(t)
            }, [p]),
            z = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && w(t)
            }, [p]),
            q = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9,]/g, "").replaceAll(/,{2,}/g, ",").replace(/^,/, "").split(",").map(e => e.replace(/^0+(\d)/, "$1")).filter(e => "0" !== e).join(","),
                    n = t.split(",").filter(Boolean);
                if (!(n.length > 5)) {
                    if (5 === n.length && t.endsWith(",")) return void R(t.slice(0, -1));
                    R(t)
                }
            }, []),
            F = h || x || O || !M && !E || "" === T || "" === C || 0 >= Number(C) || iZ(i$(M, E, P)) && 0 === L.split(",").filter(Boolean).length;
        return (0, i.jsxs)(iP.Dialog, {
            open: n,
            onClose: s,
            maxWidth: "Medium",
            color: "primaryBrand",
            PaperProps: {
                className: "[width:580px]"
            },
            children: [(0, i.jsx)(iL.DialogTitle, {
                className: "padding-bottom-none",
                children: (0, i.jsxs)("div", {
                    className: "flex justify-between items-start",
                    children: [(0, i.jsx)("span", {
                        className: "text-heading-small",
                        children: o("Heading.StudioPublishSettings")
                    }), (0, i.jsx)(is.IconButton, {
                        "aria-label": "Close",
                        onClick: s,
                        size: "small",
                        color: "inherit",
                        children: (0, i.jsx)(iD.CloseIcon, {})
                    })]
                })
            }), (0, i.jsxs)(iN.DialogContent, {
                className: "padding-top-small",
                children: [(0, i.jsx)(iF.Typography, {
                    variant: "body2",
                    className: "[opacity:0.7] padding-bottom-medium",
                    children: o("Description.StudioPublishSettingsSubtitle")
                }), (0, i.jsx)(iX, {
                    label: o("Label.Availability"),
                    children: (0, i.jsx)("span", {
                        className: "text-label-large [margin-left:12px]",
                        children: o("Label.NonLimited")
                    })
                }), (0, i.jsx)(iX, {
                    label: o("Label.TimedOption"),
                    children: (0, i.jsx)(iz.Switch, {
                        checked: y,
                        onChange: () => b(e => !e),
                        "aria-label": "Timed Option"
                    })
                }), (0, i.jsx)(iX, {
                    label: o("Label.PriceConfigurations"),
                    className: "grid [grid-template-columns:175px_1fr] padding-y-large gap-xsmall",
                    labelClassName: "padding-top-small",
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col [flex:1] gap-xsmall",
                        children: [(0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(iq.TextField, {
                                id: "price-offset",
                                label: "",
                                placeholder: o("Placeholder.AmountAbovePriceFloor"),
                                variant: "outlined",
                                size: "small",
                                value: T,
                                onChange: B,
                                fullWidth: !0
                            }), (0, i.jsx)(iV.Tooltip, {
                                title: o("Tooltip.AmountAbovePriceFloor"),
                                children: (0, i.jsx)(is.IconButton, {
                                    "aria-label": "price offset info",
                                    size: "small",
                                    children: (0, i.jsx)(i_.InfoOutlinedIcon, {})
                                })
                            })]
                        }), (0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(iq.TextField, {
                                id: "price-floor-minimum",
                                label: "",
                                placeholder: o("Placeholder.DoNotPriceBelow"),
                                variant: "outlined",
                                size: "small",
                                value: C,
                                onChange: z,
                                fullWidth: !0
                            }), (0, i.jsx)(iV.Tooltip, {
                                title: o("Tooltip.MinimumPriceFloor"),
                                children: (0, i.jsx)(is.IconButton, {
                                    "aria-label": "minimum price info",
                                    size: "small",
                                    children: (0, i.jsx)(i_.InfoOutlinedIcon, {})
                                })
                            })]
                        })]
                    })
                }), (0, i.jsx)(iX, {
                    label: o("Label.RegionalPricing"),
                    children: (0, i.jsx)(iz.Switch, {
                        checked: S,
                        onChange: () => A(e => !e),
                        "aria-label": "Regional Pricing"
                    })
                }), (0, i.jsx)(iX, {
                    label: o("Label.SellInMarketplace"),
                    children: (0, i.jsx)(iz.Switch, {
                        checked: M,
                        onChange: () => {
                            let e = !M;
                            e || N("specific"), j(e)
                        },
                        "aria-label": "Sell in Marketplace"
                    })
                }), (0, i.jsx)(iX, {
                    label: o("Label.SellInExperiences"),
                    children: (0, i.jsx)(iz.Switch, {
                        checked: E,
                        onChange: () => k(e => !e),
                        "aria-label": "Sell in experiences"
                    })
                }), E && (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(iR.Divider, {}), (0, i.jsxs)("div", {
                        className: "padding-y-large",
                        children: [(0, i.jsxs)("div", {
                            className: "grid [grid-template-columns:175px_1fr] items-center",
                            children: [(0, i.jsx)("span", {
                                className: "text-label-large",
                                children: o("Label.ExperienceLocations")
                            }), (0, i.jsxs)(iB.RadioGroup, {
                                row: !0,
                                value: P,
                                onChange: e => {
                                    let t = e.target.value;
                                    ("all" === t || "specific" === t) && N(t)
                                },
                                className: "flex flex-row no-wrap gap-xsmall [margin-left:12px]",
                                children: [(0, i.jsx)(iO.FormControlLabel, {
                                    value: "all",
                                    disabled: !M,
                                    control: (0, i.jsx)(iU.Radio, {
                                        "aria-label": o("Label.AllGames"),
                                        size: "small"
                                    }),
                                    label: o("Label.AllGames"),
                                    className: "margin-right-medium"
                                }), (0, i.jsx)(iO.FormControlLabel, {
                                    value: "specific",
                                    control: (0, i.jsx)(iU.Radio, {
                                        "aria-label": o("Label.SpecificExperiences"),
                                        size: "small"
                                    }),
                                    label: o("Label.SpecificExperiences")
                                })]
                            })]
                        }), "specific" === P && (0, i.jsxs)("div", {
                            className: "[margin-left:187px] [margin-top:10px]",
                            children: [(0, i.jsx)(iq.TextField, {
                                id: "place-ids",
                                label: "",
                                placeholder: o("Placeholder.EnterExperienceIDs"),
                                variant: "outlined",
                                size: "small",
                                value: L,
                                onChange: q,
                                fullWidth: !0
                            }), (0, i.jsxs)(iF.Typography, {
                                variant: "caption",
                                className: "[opacity:0.6] block [margin-top:4px]",
                                children: [L ? L.split(",").filter(Boolean).length : 0, "/", 5, " ", o("Label.ExperiencesCount")]
                            })]
                        })]
                    })]
                })]
            }), (0, i.jsxs)("div", {
                className: "flex padding-x-large padding-y-medium gap-small",
                children: [(0, i.jsx)(ik.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: U,
                    disabled: F,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: o("Action.Save")
                }), (0, i.jsx)(ik.Button, {
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
    var i1 = e.i(464508),
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
    var i8 = e.i(202289),
        i6 = e.i(912359),
        i3 = e.i(418162);
    let i7 = (0, il.makeStyles)()(e => ({
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
    let ai = (0, d.withTranslation)(e => {
        let t, {
                open: n,
                onClose: s,
                categoryFlags: o,
                assetTypesByCategory: r
            } = e,
            {
                translate: l
            } = (0, d.useTranslation)(),
            {
                classes: u,
                cx: c
            } = i7(),
            {
                enqueue: m,
                close: p
            } = (0, iG.useSnackbar)(),
            h = (0, f.useCurrentGroup)(),
            v = !1 !== o.showCategorySubtypeDropdowns,
            x = (0, a.useMemo)(() => v ? i9 : ae, [v]),
            [g, y] = (0, a.useState)({
                clothing: !1,
                makeup: !1,
                accessories: !1
            }),
            [b, T] = (0, a.useState)({}),
            [I, C] = (0, a.useState)(() => ({
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
                T(e), C({
                    clothing: !0,
                    makeup: !0,
                    accessories: !0
                }), y({
                    clothing: !1,
                    makeup: !1,
                    accessories: !1
                }), S(!1), M(null)
            }
        }, [n, r]);
        let k = (0, a.useCallback)(() => {
                s()
            }, [s]),
            P = (0, a.useCallback)(() => {
                M("enable"), S(!0)
            }, []),
            N = (0, a.useCallback)(() => {
                M("disable"), S(!0)
            }, []),
            L = (0, a.useCallback)(async () => {
                if (!r || null === A) return void s();
                let e = x.flatMap(e => E[e] ? j[e].filter(e => b[e]) : []);
                try {
                    await iH.default.bulkUpdateCollectible(F.uuidService.generateRandomUuid(), null == h ? void 0 : h.id, e.map(e => (0, i3.translateAssetType)(e)), "enable" === A), m({
                        message: l("Message.TimedOptionSettingsApplied"),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: i2.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    }), window.location.reload(), s()
                } catch (e) {
                    m({
                        message: l(i5(await (0, tD.default)(e), "Error.Unknown")),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: i2.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    })
                }
            }, [r, b, A, null == h ? void 0 : h.id, m, p, s, j, E, l, x]),
            R = (0, a.useCallback)(() => {
                S(!1), M(null)
            }, []),
            O = (0, a.useMemo)(() => x.map(e => {
                if (!E[e]) return null;
                let t = j[e];
                if (0 === t.length) return null;
                let n = t.filter(e => b[e]);
                if (0 === n.length) return null;
                if (n.length === t.length) return l("clothing" === e ? an(v) : at[e].all);
                let i = l(at[e].short),
                    a = n.map(e => l(i2.assetFullNameKeys[e])).join(", ");
                return "".concat(i, " (").concat(a, ")")
            }).filter(e => null !== e), [b, j, E, v, l, x]),
            D = (0, a.useMemo)(() => x.some(e => E[e] && j[e].some(e => b[e])), [b, j, E, x]),
            _ = (0, i.jsxs)(i.Fragment, {
                children: [(0, i.jsx)(i1.DialogContentText, {
                    className: u.descriptionText,
                    children: l("Description.BulkUpdateAllTimedOptions")
                }), (0, i.jsx)(i4.default, {
                    flexDirection: "column",
                    classes: {
                        root: u.checkboxList
                    },
                    children: x.map(e => (e => {
                        let t = j[e];
                        if (!E[e]) return null;
                        let n = g[e],
                            s = "timed-options-bulk-".concat(e, "-subtypes"),
                            o = l("clothing" === e ? an(v) : at[e].all);
                        return (0, i.jsxs)(a.default.Fragment, {
                            children: [(0, i.jsxs)("div", {
                                className: u.categoryRow,
                                children: [v ? (0, i.jsx)(is.IconButton, {
                                    type: "button",
                                    size: "small",
                                    className: u.expandToggle,
                                    onClick: () => y(t => ({
                                        ...t,
                                        [e]: !t[e]
                                    })),
                                    "aria-expanded": n,
                                    "aria-controls": s,
                                    "aria-label": l("AriaLabel.ToggleTimedOptionsCategorySubtypes", {
                                        categoryName: o
                                    }),
                                    color: "inherit",
                                    children: (0, i.jsx)(i6.ChevronRightIcon, {
                                        className: c(n ? u.expandToggleExpanded : u.expandToggleCollapsed)
                                    })
                                }) : null, (0, i.jsx)(i8.Checkbox, {
                                    label: o,
                                    size: "Small",
                                    placement: "Start",
                                    isChecked: ((e, t) => {
                                        if (0 === t.length) return I[e];
                                        let n = e => b[e],
                                            i = t.some(n),
                                            a = t.every(n);
                                        return !!i && (!!a || "indeterminate")
                                    })(e, t),
                                    onCheckedChange: n => {
                                        0 === t.length ? C(t => ({
                                            ...t,
                                            [e]: !0 === n
                                        })) : T(e => {
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
                                id: s,
                                className: u.subtypeIndent,
                                children: t.map(e => (0, i.jsx)(i8.Checkbox, {
                                    label: l(i2.assetFullNameKeys[e]),
                                    size: "Small",
                                    placement: "Start",
                                    isChecked: b[e],
                                    onCheckedChange: t => {
                                        T(n => ({
                                            ...n,
                                            [e]: !0 === t
                                        }))
                                    }
                                }, e))
                            }) : null]
                        }, e)
                    })(e))
                }), (0, i.jsxs)(i4.default, {
                    flexDirection: "row",
                    classes: {
                        root: u.buttonContainer
                    },
                    children: [(0, i.jsx)(ik.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: P,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !D,
                        children: l("Action.Enable")
                    }), (0, i.jsx)(ik.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: N,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !D,
                        children: l("Action.Disable")
                    })]
                })]
            });
        return w && (t = "enable" === A ? "Description.ThisWillEnableTimedOptionsFor" : "Description.ThisWillDisableTimedOptionsFor", _ = (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(i1.DialogContentText, {
                className: u.descriptionText,
                children: l(t)
            }), O.length > 0 && (0, i.jsx)("ul", {
                className: u.bulletList,
                children: O.map(e => (0, i.jsx)("li", {
                    children: e
                }, e))
            }), (0, i.jsx)(i1.DialogContentText, {
                className: u.descriptionText,
                children: l("Description.ThisWillAlsoReplaceAnyItemLevelSettings")
            }), (0, i.jsxs)(i4.default, {
                flexDirection: "row",
                classes: {
                    root: u.buttonContainer
                },
                children: [(0, i.jsx)(ik.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: L,
                    size: "medium",
                    className: u.actionButton,
                    children: l("Action.Confirm")
                }), (0, i.jsx)(ik.Button, {
                    variant: "contained",
                    color: "secondary",
                    onClick: R,
                    size: "medium",
                    className: u.actionButton,
                    children: l("Action.Cancel")
                })]
            })]
        })), (0, i.jsxs)(iP.Dialog, {
            open: n,
            onClose: k,
            maxWidth: "Small",
            color: "primaryBrand",
            classes: {
                paper: u.dialogPaper
            },
            children: [(0, i.jsxs)(iL.DialogTitle, {
                className: u.dialogTitle,
                children: [(0, i.jsx)("span", {
                    className: u.dialogTitleText,
                    children: w ? l("Title.ConfirmOption") : l("Action.TimedOptions")
                }), !w && (0, i.jsx)(is.IconButton, {
                    "aria-label": "Close",
                    onClick: k,
                    size: "small",
                    className: u.closeButton,
                    color: "inherit",
                    children: (0, i.jsx)(iD.CloseIcon, {})
                })]
            }), (0, i.jsx)(iN.DialogContent, {
                className: u.dialogContent,
                children: _
            })]
        })
    }, [ei.TranslationNamespace.ConfigureItem, ei.TranslationNamespace.Creations, ei.TranslationNamespace.AssetTypes]);

    function aa(e) {
        return "Tshirt" === e ? m.Asset.TShirt : "TshirtAccessory" === e ? m.Asset.TShirtAccessory : e
    }
    let as = (0, il.makeStyles)()(e => ({
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
        ao = (0, d.withTranslation)(e => {
            let t, n, s, o, {
                    open: r,
                    onClose: l
                } = e,
                {
                    translate: u,
                    translateHTML: c
                } = (0, d.useTranslation)(),
                {
                    classes: p
                } = as(),
                {
                    enqueue: h,
                    close: v
                } = (0, iG.useSnackbar)(),
                x = (0, f.useCurrentGroup)(),
                [g, y] = (0, a.useState)(null),
                [b, T] = (0, a.useState)(() => F.uuidService.generateRandomUuid()),
                [I, C] = (0, a.useState)({
                    showClothing: !1,
                    showMakeup: !1,
                    showAccessories: !1,
                    showCategorySubtypeDropdowns: !0
                }),
                [w, S] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                r ? (y(null), T(F.uuidService.generateRandomUuid()), (0, iE.getValidTimedOptionsTypes)().then(() => {
                    let e = new Set(iE.ValidTimedOptionsAssetTypes.map(e => aa(e))),
                        t = 3 === e.size && Array.from(iM.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).every(t => e.has(t));
                    if (S(t), t) C({
                        showClothing: !1,
                        showMakeup: !1,
                        showAccessories: !1,
                        showCategorySubtypeDropdowns: !0
                    });
                    else {
                        let t = [...e].every(e => iM.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e) || iM.MAKEUP_ASSET_TYPES.includes(e)),
                            n = e.has(m.Asset.EyeMakeup),
                            i = iM.CLOTHING_ASSET_TYPES.some(t => e.has(t) && !iM.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(t)),
                            a = Array.from(iM.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(t => e.has(t));
                        C({
                            showClothing: i || a,
                            showMakeup: n,
                            showAccessories: e.has(m.Asset.Hat),
                            showCategorySubtypeDropdowns: !t
                        })
                    }
                })) : T(F.uuidService.generateRandomUuid())
            }, [r]);
            let A = (0, a.useCallback)(async () => {
                    try {
                        await iH.default.bulkUpdateCollectible(b, null == x ? void 0 : x.id, [64, 66, 68], !0 === g), h({
                            message: u("Message.TimedOptionSettingsApplied"),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: i2.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        }), window.location.reload(), l()
                    } catch (e) {
                        h({
                            message: u(i5(await (0, tD.default)(e), "Error.Unknown")),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: i2.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        })
                    }
                }, [h, v, u, l, b, null == x ? void 0 : x.id, g]),
                M = (0, a.useCallback)(() => {
                    l()
                }, [l]),
                j = !w,
                E = j ? (t = new Set(iE.ValidTimedOptionsAssetTypes.map(e => aa(e))), n = iM.CLOTHING_ASSET_TYPES.some(e => t.has(e) && !iM.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e)), s = Array.from(iM.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(e => t.has(e)), o = I.showCategorySubtypeDropdowns && (!s || n) ? iM.CLOTHING_ASSET_TYPES.filter(e => t.has(e)) : Array.from(iM.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).filter(e => t.has(e)), {
                    clothing: o,
                    makeup: iM.MAKEUP_ASSET_TYPES.filter(e => t.has(e)),
                    accessories: I.showCategorySubtypeDropdowns ? iM.ACCESSORY_ASSET_TYPES.filter(e => t.has(e)) : []
                }) : void 0;
            return j ? (0, i.jsx)(ai, {
                open: r,
                onClose: M,
                categoryFlags: I,
                assetTypesByCategory: E
            }) : (0, i.jsxs)(iP.Dialog, {
                open: r,
                onClose: M,
                maxWidth: "Small",
                color: "primaryBrand",
                children: [(0, i.jsxs)(iL.DialogTitle, {
                    className: p.dialogTitle,
                    children: [(0, i.jsx)("span", {
                        children: null === g ? u("Action.TimedOptions") : u("Action.Confirm")
                    }), (0, i.jsx)(is.IconButton, {
                        "aria-label": "Close",
                        onClick: M,
                        size: "small",
                        className: p.closeButton,
                        color: "inherit",
                        children: (0, i.jsx)(iD.CloseIcon, {})
                    })]
                }), (0, i.jsx)(iN.DialogContent, {
                    className: p.dialogContent,
                    children: null === g ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(i1.DialogContentText, {
                            className: p.descriptionText,
                            children: u("Description.BulkUpdateTimedOptions")
                        }), (0, i.jsxs)(i4.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(ik.Button, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    y(!0)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.TurnAllOn")
                            }), (0, i.jsx)(ik.Button, {
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
                        children: [(0, i.jsx)(i1.DialogContentText, {
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
                        }), (0, i.jsxs)(i4.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(ik.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                onClick: A,
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.Confirm")
                            }), (0, i.jsx)(ik.Button, {
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
        }, [ei.TranslationNamespace.ConfigureItem, ei.TranslationNamespace.Creations]),
        ar = Object.values(Q.SearchSortParameter),
        al = Object.values(ib.EventSortBy),
        au = ["publishSettings"],
        ad = e => {
            let {
                menuState: t
            } = e, {
                translate: n
            } = (0, d.useTranslation)(), {
                unifiedLogger: s
            } = (0, iS.useUnifiedLoggerProvider)(), {
                ready: o,
                value: r
            } = (0, u.useFlag)(iw.isAutoPublishPreferencesEnabled), {
                isFetched: l
            } = (0, f.useGroups)(), [c, p] = (0, a.useState)(!1), [h, v] = (0, a.useState)(!1), [g, y] = (0, a.useState)(0), [I, C] = (0, a.useState)(!1), [w, S] = (0, a.useState)(!1), [A, M] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                (0, iE.getValidTimedOptionsTypes)().then(() => {
                    S(!0)
                })
            }, []);
            let {
                sort: j,
                setSort: E,
                sortOrder: P,
                setSortOrder: N,
                isArchived: L,
                setIsArchived: R,
                isAgeRestrictedCollaboration: O,
                setIsAgeRestrictedCollaboration: D,
                isPublicOnly: _,
                setIsPublicOnly: U,
                isOnMarketplace: B,
                setIsOnMarketplace: z
            } = (0, eo.default)(), [{
                filterIndex: V,
                publishSettings: G
            }] = (0, en.useQueryParams)(["filterIndex", "publishSettings"]), H = (0, a.useContext)(q).isResolving, [, K] = (0, en.useQueryParams)(["activeTab", "filterIndex"]), [, W] = (0, en.useQueryParams)(au), Y = (0, a.useMemo)(() => {
                let e = T.default.getAssetType(t);
                return e !== m.Asset.AllCatalogAsset || Number(V) > 0 ? e : x.TAXONOMY_HOST_ASSET
            }, [t, V]), J = Y in iM.AvatarMenuMap || Y === m.Asset.AllCatalogAsset, X = J && r, Z = (0, iA.normalizeSingleQueryParam)(G), $ = !!X && l && !H && !I && ("true" === Z || "1" === Z);
            (0, a.useEffect)(() => {
                o && l && !H && void 0 !== Z && ($ || W({
                    publishSettings: null
                }, {
                    skipHistory: !0
                }))
            }, [o, H, l, $, Z, W]);
            let ee = (0, a.useCallback)(() => {
                    v(!1), $ && (C(!0), W({
                        publishSettings: null
                    }, {
                        skipHistory: !0
                    }))
                }, [$, W]),
                {
                    canUseTaxonomy: et,
                    isTaxonomyMode: ei
                } = (0, ip.default)(Y),
                ea = ix(t, (0, f.useCurrentGroup)()),
                {
                    isSortable: es,
                    isArchivable: er
                } = (0, a.useMemo)(() => {
                    let e = ei || null == V ? void 0 : Number(V),
                        t = T.default.isAssetTypeArchivable(Y, e);
                    return {
                        isSortable: T.default.isAssetTypeSortable(Y),
                        isArchivable: t || T.default.isAssetTypeDirectlyArchivable(Y)
                    }
                }, [Y, V, ei]),
                el = n("Label.CategorizeByTaxonomy"),
                eu = (0, a.useCallback)(() => {
                    var e;
                    let t = null == (e = ea[0]) ? void 0 : e.type;
                    K({
                        activeTab: ei ? null != t ? t : Y : (0, x.buildTaxonomyActiveTab)(),
                        filterIndex: 0
                    }, {
                        skipHistory: !0
                    })
                }, [ei, Y, ea, K]),
                ed = (0, a.useMemo)(() => !es && !er && !et && Y !== m.Asset.MyExperiences && Y !== m.Asset.SharedExperiences, [es, er, et, Y]),
                ec = (0, a.useCallback)(e => {
                    if (Y === m.Asset.MyExperiences || Y === m.Asset.SharedExperiences) ar.includes(e) && E(t => ({
                        ...t,
                        [m.Asset.Place]: e
                    }));
                    else al.includes(e) && E(t => ({
                        ...t,
                        [Y]: e
                    }))
                }, [E, Y]),
                em = (0, a.useCallback)(() => {
                    N(e => e === F.SortOrder.Asc ? F.SortOrder.Desc : F.SortOrder.Asc)
                }, [N]),
                ep = (0, a.useCallback)(() => {
                    p(!0)
                }, []),
                eh = (0, a.useCallback)(() => {
                    let e = !O;
                    s.logClickEvent({
                        eventName: t_.default.ImpactedExperiencesFilterClick,
                        parameters: {
                            page: "creations",
                            action: e ? "enable" : "disable",
                            assetType: Y.toString()
                        }
                    }), D(e => !e)
                }, [s, O, Y, D]),
                ev = Y === m.Asset.MyExperiences || Y === m.Asset.SharedExperiences,
                ef = (0, a.useMemo)(() => ev ? Object.values(Q.SearchSortParameter).map(e => ({
                    value: e,
                    labelKey: b.universeSortTranslationKeys[e]
                })) : Object.values(ib.EventSortBy).map(e => ({
                    value: e,
                    labelKey: b.eventSortTranslationKeys[e]
                })), [ev]),
                ex = (0, a.useMemo)(() => ev ? j[m.Asset.Place] : (0, ij.getSortForAssetType)(Y, j), [ev, j, Y]),
                eg = J && w && (iE.ValidTimedOptionsAssetTypes.length > 0 || iE.ValidTimedOptionsBundleTypes.length > 0);
            if (ed) return null;
            let ey = Y === m.Asset.MyExperiences || Y === m.Asset.SharedExperiences || er || et || Y === m.Asset.MeshPart,
                eb = Y === m.Asset.MyExperiences || Y === m.Asset.SharedExperiences,
                eT = Y === m.Asset.Decal || Y === m.Asset.MeshPart,
                eI = !!X || eg,
                eC = !eI && !!(Y === m.Asset.MyExperiences || eb || er && Y);
            return (0, i.jsxs)("div", {
                className: "flex flex-row justify-start items-center gap-large [flex-wrap:wrap] padding-left-medium max-large:[flex-grow:1] max-large:justify-between",
                children: [ey && (0, i.jsxs)("div", {
                    className: "flex flex-row items-center gap-medium",
                    children: [eC && (0, i.jsx)("span", {
                        className: "text-body-large margin-right-[16px]",
                        children: n("Label.ShowPrefix")
                    }), Y === m.Asset.MyExperiences && (0, i.jsx)(iC.Toggle, {
                        size: "Large",
                        placement: "Start",
                        label: n("Label.Public"),
                        isChecked: _,
                        onCheckedChange: () => U(e => !e)
                    }), eb && (0, i.jsx)(iC.Toggle, {
                        size: "Large",
                        placement: "Start",
                        label: n("Label.Impacted"),
                        isChecked: O,
                        onCheckedChange: eh
                    }), er && Y && (0, i.jsx)(iC.Toggle, {
                        size: "Large",
                        placement: "Start",
                        label: X ? n("Action.ShowArchived") : n("Label.Archived"),
                        isChecked: L,
                        onCheckedChange: () => R(e => !e)
                    }), et && (0, i.jsx)(iC.Toggle, {
                        size: "Large",
                        placement: "Start",
                        label: el,
                        isChecked: ei,
                        onCheckedChange: eu
                    }), eI && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)("span", {
                            className: "flex [height:20px] margin-x-[12px]",
                            children: (0, i.jsx)(iT.Divider, {
                                orientation: "vertical"
                            })
                        }), (0, i.jsxs)(iI.Popover, {
                            open: A,
                            onOpenChange: M,
                            children: [(0, i.jsx)(iI.PopoverTrigger, {
                                asChild: !0,
                                children: (0, i.jsx)(k.IconButton, {
                                    as: "button",
                                    icon: "icon-filled-gear",
                                    size: "Medium",
                                    variant: "Utility",
                                    isCircular: !0,
                                    ariaLabel: n("Label.Settings")
                                })
                            }), (0, i.jsx)(iI.PopoverContent, {
                                side: "bottom",
                                align: "end",
                                ariaLabel: n("Label.Settings"),
                                children: (0, i.jsx)(nK.Menu, {
                                    size: "Medium",
                                    children: (0, i.jsxs)(nK.MenuSection, {
                                        children: [eg && (0, i.jsx)(nK.MenuItem, {
                                            value: "timed-options",
                                            title: n("Action.TimedOptions"),
                                            onSelect: () => {
                                                M(!1), ep()
                                            }
                                        }), X && (0, i.jsx)(nK.MenuItem, {
                                            value: "publish-settings",
                                            title: n("Action.StudioPublishSettings"),
                                            onSelect: () => {
                                                M(!1), y(e => e + 1), v(!0)
                                            }
                                        })]
                                    })
                                })
                            })]
                        })]
                    }), eT && (0, i.jsx)(iC.Toggle, {
                        size: "Large",
                        placement: "Start",
                        label: n("Label.OnCreatorStore"),
                        isChecked: B,
                        onCheckedChange: () => z(e => !e)
                    })]
                }), es && (0, i.jsxs)("div", {
                    className: "flex flex-row items-center gap-xsmall [flex-wrap:nowrap]",
                    children: [(0, i.jsx)(nH.Dropdown, {
                        size: "Medium",
                        ariaLabel: n("Label.SortBy"),
                        placeholder: n("Label.SortBy"),
                        value: ex,
                        onValueChange: ec,
                        children: (0, i.jsx)(nK.Menu, {
                            children: ef.map(e => (0, i.jsx)(nK.MenuItem, {
                                value: e.value,
                                title: n("Label.SortByOption", {
                                    sortOption: n(e.labelKey)
                                })
                            }, e.value))
                        })
                    }), (0, i.jsx)(k.IconButton, {
                        as: "button",
                        size: "Medium",
                        variant: "Utility",
                        icon: P === F.SortOrder.Asc ? "icon-regular-arrow-wide-up" : "icon-regular-arrow-wide-down",
                        ariaLabel: n("Heading.SortOrder"),
                        onClick: em
                    })]
                }), (0, i.jsx)(ao, {
                    open: c,
                    onClose: () => p(!1)
                }), (0, i.jsx)(i0, {
                    open: h || $,
                    onClose: ee
                }, g)]
            })
        },
        ac = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                verificationMetadata: a,
                group: s
            } = e, o = [m.Asset.UpcomingEvent, m.Asset.PastEvent, m.Asset.DraftEvent], r = !!t.submenuItem && o.includes(t.submenuItem.type);
            return (0, i.jsxs)("div", {
                className: "flex justify-between padding-top-small",
                children: [t.menuItem.type === m.Asset.TShirt && (0, i.jsx)(ii, {
                    data: a
                }), !r && (0, i.jsx)("div", {
                    className: "flex width-full padding-bottom-large [align-content:flex-start] [row-gap:12px] justify-between flex-row items-center wrap",
                    children: t.menuItem.type === m.Asset.Moments ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(n9, {}), (0, i.jsx)(n6, {})]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [t.submenuItem && (0, i.jsx)(iy, {
                            menuState: t,
                            onMenuStateChange: n,
                            group: s
                        }), (0, i.jsx)(ad, {
                            menuState: t
                        })]
                    })
                })]
            })
        };
    var am = e.i(812077),
        ap = e.i(71375),
        ah = e.i(83560),
        av = e.i(576069),
        af = e.i(134817);
    let ax = [],
        ag = new Date(0).toISOString(),
        ay = e => e.startsWith("Label.AbuseType."),
        ab = e => {
            var t, n;
            return {
                momentId: e.uid,
                description: null != (t = e.description) ? t : "",
                experienceName: "",
                modifiedAt: null != (n = e.uploadedAt) ? n : ag,
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

    function aT(e) {
        return null != e.universeId ? e.universeId : "experienceId" in e && "number" == typeof e.experienceId ? e.experienceId : void 0
    }
    var aI = e.i(11763),
        aC = e.i(622361);
    let aw = (e, t) => {
            let {
                user: n
            } = (0, V.useAuthentication)(), {
                enabled: i,
                thumbnailUrl: s,
                videoUrl: o
            } = t, r = null == n ? void 0 : n.id, l = (0, a.useMemo)(() => s || o ? {
                thumbnailUrl: null != s ? s : "",
                videoUrl: null != o ? o : ""
            } : null, [s, o]), [u, d] = (0, a.useState)(null);
            return ((0, a.useEffect)(() => {
                if (l || null == r || !i || null == e || "" === e) return;
                let t = !1;
                return (async () => {
                    let n = {
                        draftId: e,
                        userId: r
                    };
                    tW(tB.LoadLocalVideoMedia, n);
                    try {
                        let i = await eL(r, e);
                        t || (d(i), null != i && tY(tB.LoadLocalVideoMedia, n))
                    } catch (n) {
                        tG(tB.LoadLocalVideoMedia, n, {
                            draftId: e
                        }), t || d(null)
                    }
                })(), () => {
                    t = !0
                }
            }, [e, i, l, r]), l) ? l : i ? u : null
        },
        aS = "block width-full height-full max-w-full max-h-full object-contain",
        aA = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)("div", {
                className: "flex items-center justify-center radius-medium bg-surface-200 width-full shrink-0 overflow-hidden h-[240px]",
                "data-testid": "moments-video-preview-container",
                children: t
            })
        },
        aM = e => {
            let {
                thumbnailUrl: t,
                videoUrl: n
            } = e;
            return n ? (0, i.jsx)(aA, {
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
            }) : t ? (0, i.jsx)(aA, {
                children: (0, i.jsx)("img", {
                    alt: "Moment thumbnail preview",
                    className: "radius-medium ".concat(aS),
                    src: t
                })
            }) : (0, i.jsx)(aA, {})
        },
        aj = (0, d.withTranslation)(e => {
            var t, n, s;
            let {
                moment: o,
                open: r,
                onOpenChange: l,
                onMomentMetadataChange: u,
                onPublish: c,
                onDelete: m,
                publishingDraftId: p = null,
                deletingMomentKey: h = null,
                isPublishDisabled: v = !1
            } = e, {
                translate: f
            } = (0, d.useTranslation)(), {
                locale: x
            } = (0, d.useLocalization)(), g = nM(), y = tZ(x), [b, T] = (0, a.useState)(() => {
                var e, t, n, i;
                let a;
                return o && ((a = {
                    id: null != (i = aT(n = o)) ? i : 0,
                    name: n.experienceName
                }).id > 0 || (null != (e = null == (t = a.name) ? void 0 : t.length) ? e : 0) > 0) ? a : void 0
            }), [I, C] = (0, a.useState)(() => {
                var e;
                return null != (e = null == o ? void 0 : o.description) ? e : ""
            }), [w, S] = (0, a.useState)(), A = null != (t = null != w ? w : null == o ? void 0 : o.locale) ? t : y, M = (null == o ? void 0 : o.status) === ef && !0 === o.hasLocalVideo, j = aw((null == o ? void 0 : o.status) === ef ? o.draftId : null, {
                enabled: r && M,
                thumbnailUrl: null == o ? void 0 : o.thumbnailUrl,
                videoUrl: null == o ? void 0 : o.videoUrl
            }), E = (0, a.useCallback)(() => {
                o && !v && null == p && (null == c || c(o))
            }, [v, o, c, p]), k = (0, a.useCallback)(() => {
                o && h !== nj(o) && (null == m || m(o))
            }, [h, o, m]), P = (0, a.useCallback)(e => {
                o && e.id && e.name && (T(e), null == u || u(o, {
                    experienceId: e.id,
                    rootPlaceId: e.rootPlaceId,
                    experienceName: e.name
                }))
            }, [o, u]), N = (0, a.useCallback)(e => {
                C(e.target.value)
            }, []), L = (0, a.useCallback)(e => {
                S(e), o && e !== o.locale && (null == u || u(o, {
                    locale: e
                }))
            }, [o, u]), R = (0, a.useCallback)(() => {
                o && I !== o.description && (null == u || u(o, {
                    description: I
                }))
            }, [I, o, u]), O = (0, a.useCallback)(() => {
                R()
            }, [R]), D = (0, a.useCallback)(e => {
                e || R(), l(e)
            }, [R, l]);
            if (!o) return null;
            let _ = nj(o),
                U = null != p && p === _,
                B = null != p,
                z = null != h && h === _,
                q = o.status === eh,
                V = o.status === ef,
                F = V && !U,
                G = !q && null != c && (V && M || U),
                H = null != m,
                K = I.length >= 140;
            return (0, i.jsx)(aI.SheetRoot, {
                open: r,
                onOpenChange: D,
                children: (0, i.jsxs)(aI.SheetContent, {
                    closeLabel: f("Action.Close"),
                    largeScreenVariant: "side",
                    children: [(0, i.jsx)(aI.SheetTitle, {
                        children: f("Heading.EditMoment")
                    }), (0, i.jsxs)(aI.SheetBody, {
                        className: "flex flex-col gap-y-medium padding-top-small padding-bottom-large",
                        children: [(0, i.jsx)(aM, {
                            thumbnailUrl: null != (n = null == j ? void 0 : j.thumbnailUrl) ? n : o.thumbnailUrl,
                            videoUrl: null != (s = null == j ? void 0 : j.videoUrl) ? s : o.videoUrl
                        }), F ? (0, i.jsx)(i.Fragment, {
                            children: b ? (0, i.jsx)(nO, {
                                experience: b,
                                onChangeExperience: () => T(void 0)
                            }) : (0, i.jsx)(nG, {
                                onExperienceResolved: P
                            })
                        }) : b ? (0, i.jsxs)("div", {
                            className: "flex flex-col gap-y-xsmall width-full margin-top-small",
                            children: [(0, i.jsx)("span", {
                                className: "text-body-small content-muted",
                                children: f("CreateMomentModal.ExperienceInput.Label")
                            }), (0, i.jsx)(nO, {
                                experience: b,
                                hideTitle: !0
                            })]
                        }) : null, g ? (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: F ? (0, i.jsx)(nW, {
                                value: A,
                                onChange: L,
                                isDisabled: U
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: f("CreateMomentModal.LanguageInput.Label")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-content-language-readonly",
                                    children: t$(o.locale)
                                })]
                            })
                        }) : null, (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: F ? (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)(aC.TextArea, {
                                    id: "edit-moment-description-".concat(_),
                                    label: f("MomentsTable.Header.Description"),
                                    rows: 3,
                                    placeholder: f("MomentsTable.Placeholders.Description"),
                                    size: "Small",
                                    value: I,
                                    maxLength: 140,
                                    onBlur: O,
                                    onChange: N
                                }), (0, i.jsx)("span", {
                                    "aria-live": "polite",
                                    className: K ? "text-body-small content-system-alert text-align-x-right" : "text-body-small content-muted text-align-x-right",
                                    "data-testid": "edit-moment-description-char-count",
                                    children: "".concat(I.length, "/").concat(140)
                                })]
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: f("MomentsTable.Header.Description")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-description-readonly",
                                    children: I || "-"
                                })]
                            })
                        })]
                    }), (0, i.jsx)(aI.SheetActions, {
                        className: "width-full",
                        children: (0, i.jsxs)("div", {
                            className: "flex gap-small width-full",
                            children: [G ? (0, i.jsx)(er.Button, {
                                variant: "Emphasis",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: v || B,
                                isLoading: U,
                                onClick: E,
                                children: f("Action.Publish")
                            }) : null, H ? (0, i.jsx)(er.Button, {
                                variant: "Standard",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: z,
                                isLoading: z,
                                onClick: k,
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
    var aE = e.i(24286),
        ak = e.i(493924);
    let aP = e => {
        let {
            onCreateClick: t
        } = e, {
            translate: n
        } = (0, d.useTranslation)();
        return (0, i.jsx)(ak.default, {
            title: n("Heading.ReachPlayersDirectlyInMoments"),
            size: "large",
            illustration: "videos",
            description: (0, i.jsxs)(i.Fragment, {
                children: [n("Description.UploadExternalVideosToMoments"), " ", (0, i.jsx)(aE.Link, {
                    "aria-label": n("Label.LearnMore"),
                    href: ie.MOMENTS_LEARN_MORE_URL,
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
    var aN = e.i(260022),
        aL = e.i(278300),
        aR = e.i(776569),
        aO = e.i(125677),
        aD = e.i(20227),
        a_ = e.i(494601);
    let aU = "text/plain",
        aB = async e => {
            if ("u" < typeof ClipboardItem || "function" != typeof navigator.clipboard.write) return e.then(e => navigator.clipboard.writeText(e));
            let t = e.then(e => new Blob([e], {
                type: aU
            }));
            return t.catch(() => {}), navigator.clipboard.write([new ClipboardItem({
                [aU]: t
            })])
        }, az = e => {
            let {
                moment: t
            } = e, n = (() => {
                let {
                    ready: e,
                    value: t
                } = (0, u.useFlag)(I.isMomentsShareLinkEnabled);
                return e && null != t && t
            })(), {
                translate: s
            } = (0, d.useTranslation)(), {
                createMomentShareLink: o,
                isCreatingMomentShareLink: r
            } = function() {
                let {
                    mutateAsync: e,
                    isPending: t
                } = (0, eY.useMutation)({
                    mutationFn: e => nS.createStaticLink(e)
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
                tW(tB.CopyShareLink, e);
                try {
                    if (!("clipboard" in navigator)) throw Error("Clipboard API is unavailable");
                    let n = o({
                        momentId: t.momentId,
                        feedItemId: t.feedItemId
                    });
                    await Promise.all([n, aB(n)]), tY(tB.CopyShareLink, e), (0, ah.toast)({
                        title: m
                    })
                } catch (t) {
                    tG(tB.CopyShareLink, t, e), (0, ah.toast)({
                        title: p
                    })
                } finally {
                    l.current = !1
                }
            }, [o, m, p, t]);
            return n && t.status === eh && t.feedItemId ? (0, i.jsx)(aR.Tooltip, {
                position: "top-center",
                title: c,
                children: (0, i.jsx)(aR.TooltipTrigger, {
                    asChild: !0,
                    children: (0, i.jsx)(k.IconButton, {
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
        }, aq = {
            [eh]: "bg-system-success",
            [ev]: "bg-system-warning",
            [ef]: "bg-surface-300",
            [ex]: "bg-system-alert"
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
        aG = e.i(958885),
        aH = e.i(302219);
    let aK = (0, d.withTranslation)(e => {
            let t, {
                    moment: n
                } = e,
                {
                    translate: s
                } = (0, d.useTranslation)(),
                {
                    user: o
                } = (0, aF.useRobloxAuthentication)(),
                r = n.status === ef,
                l = r && !0 === n.hasLocalVideo,
                u = aw(r ? n.draftId : null, {
                    enabled: l,
                    thumbnailUrl: n.thumbnailUrl,
                    videoUrl: n.videoUrl
                }),
                {
                    assetId: c
                } = n,
                [m, p] = (0, a.useState)(!1),
                h = s("Label.MomentVideoPreview"),
                v = !!(null == u ? void 0 : u.videoUrl) || null != c,
                f = (0, a.useCallback)(() => {
                    v && p(!0)
                }, [v]),
                x = (0, a.useCallback)(() => {
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
                children: (0, i.jsx)(aG.Thumbnail2d, {
                    alt: "",
                    containerClass: "block",
                    imgClassName: "[object-fit:cover]",
                    returnPolicy: aG.ReturnPolicy.PlaceHolder,
                    targetId: c,
                    type: aG.ThumbnailTypes.assetThumbnail
                })
            }) : (0, i.jsx)("div", {
                "aria-hidden": !0,
                className: "radius-small bg-surface-200 size-[48px]"
            });
            let g = null;
            return ((null == u ? void 0 : u.videoUrl) ? g = (0, i.jsx)("video", {
                "aria-label": h,
                autoPlay: !0,
                className: "radius-medium block max-width-[500px] max-height-[500px]",
                loop: !0,
                muted: !0,
                playsInline: !0,
                src: u.videoUrl
            }) : null != c && (g = (0, i.jsx)("div", {
                "aria-label": h,
                className: "radius-medium clip max-width-[500px] max-height-[500px] bg-surface-200",
                children: (0, i.jsx)(aH.RobloxVideoPlayer, {
                    cmcdInstanceType: aH.CmcdInstanceType.CreatorDashboard,
                    cmcdUserId: null == o ? void 0 : o.id,
                    videoAssetId: String(c),
                    environment: "production",
                    src: void 0,
                    autoPlay: !0,
                    disableControls: !0,
                    loop: !0,
                    muted: !0
                })
            })), v) ? (0, i.jsxs)(iI.Popover, {
                open: m,
                onOpenChange: p,
                children: [(0, i.jsx)(iI.PopoverAnchor, {
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
                }), (0, i.jsx)(iI.PopoverContent, {
                    align: "start",
                    ariaLabel: h,
                    className: "outline-none",
                    side: "bottom",
                    children: g
                })]
            }) : t
        }, [ei.TranslationNamespace.Creations]),
        aW = [10, 25, 50],
        aY = {
            [eh]: "MomentsTable.NoActiveMoments",
            [ef]: "MomentsTable.NoDraftMoments",
            [ex]: "MomentsTable.NoModeratedMoments"
        },
        aJ = e => {
            let {
                moment: t,
                disabled: n,
                onBlur: s
            } = e, {
                translate: o
            } = (0, d.useTranslation)(), r = nj(t), [l, u] = (0, a.useState)(t.description), c = l.length >= 140, m = (0, a.useCallback)(e => {
                u(e.target.value)
            }, []), p = (0, a.useCallback)(e => {
                s(t, e)
            }, [t, s]);
            return (0, i.jsxs)("div", {
                className: "flex width-full flex-col gap-y-xsmall",
                children: [(0, i.jsx)(nD.TextInput, {
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
        aQ = e => {
            let t, {
                    moment: n,
                    editLabel: s,
                    publishingDraftId: o,
                    isPublishDisabled: r,
                    showMomentDetailColumns: l,
                    showContentLanguageColumn: u,
                    showModerationColumns: c,
                    moreDetailsLabel: m,
                    reportAppealsUrl: p,
                    statusLabel: h,
                    onEditMoment: v,
                    onDescriptionBlur: f,
                    onPublishMoment: x
                } = e,
                {
                    translate: g,
                    translateWithNamespace: y
                } = (0, d.useTranslation)(),
                {
                    locale: b
                } = (0, d.useLocalization)(),
                T = nj(n),
                I = n.status === ef,
                C = n.status === ex ? n.moderation : void 0,
                w = (0, a.useCallback)(() => {
                    v(n)
                }, [n, v]),
                S = (0, a.useCallback)(() => {
                    n.status === ef && (null == x || x(n.draftId))
                }, [n, x]),
                A = (0, a.useMemo)(() => {
                    var e;
                    if (!c) return null;
                    let t = (null != (e = null == C ? void 0 : C.abuseTypeLabelKeys) ? e : []).filter(ay);
                    return (t.length > 0 ? t : ["Label.AbuseType.Other"]).map(e => y(ei.TranslationNamespace.NotApproved, e)).join(", ")
                }, [C, c, y]),
                M = null != C ? (t = C.violationUid, p ? "".concat(p, "#/v/").concat(encodeURIComponent(t)) : null) : null,
                j = (0, i.jsx)(aL.TableCell, {
                    children: (0, i.jsx)(aV, {
                        label: h,
                        status: n.status
                    })
                });
            return (0, i.jsxs)(aL.TableRow, {
                isHoverable: !0,
                "data-testid": "moment-row-".concat(T),
                children: [(0, i.jsx)(aL.TableCell, {
                    children: (0, i.jsx)(aK, {
                        moment: n
                    })
                }), l ? (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(aL.TableCell, {
                        children: n.experienceName
                    }), (0, i.jsx)(aL.TableCell, {
                        children: n.status === eh ? (0, i.jsx)("span", {
                            "data-testid": "moment-description-".concat(T),
                            children: n.description || "-"
                        }) : (0, i.jsx)(aJ, {
                            moment: n,
                            disabled: null != o && o === T,
                            onBlur: f
                        }, "moment-description-".concat(T, "-").concat(n.modifiedAt))
                    })]
                }) : null, u ? (0, i.jsx)(aL.TableCell, {
                    children: (0, i.jsx)("span", {
                        "data-testid": "moment-content-language-".concat(T),
                        children: t$(n.locale)
                    })
                }) : null, c ? (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(aL.TableCell, {
                        children: (0, i.jsx)("span", {
                            "data-testid": "moment-description-".concat(T),
                            children: n.description || "-"
                        })
                    }), (0, i.jsx)(aL.TableCell, {
                        children: (0, i.jsx)("span", {
                            "data-testid": "moment-upload-time-".concat(T),
                            children: (null == C ? void 0 : C.uploadedAt) != null && ((e, t) => {
                                let n = new Date(e),
                                    i = n.getTime();
                                if (Number.isNaN(i) || 0 === i) return "";
                                let a = Intl.DateTimeFormat().resolvedOptions().timeZone,
                                    s = new Intl.DateTimeFormat(t.toString(), {
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
                                        return null != (t = null == (n = s.find(t => t.type === e)) ? void 0 : n.value) ? t : ""
                                    },
                                    r = o("dayPeriod").toUpperCase();
                                return "".concat(o("weekday"), ", ").concat(o("month"), " ").concat(o("day"), ", ").concat(o("hour"), ":").concat(o("minute")).concat(r)
                            })(C.uploadedAt, null != b ? b : d.Locale.English) || "-"
                        })
                    }), (0, i.jsx)(aL.TableCell, {
                        children: (0, i.jsx)("span", {
                            "data-testid": "moment-moderation-reason-".concat(T),
                            children: A
                        })
                    }), j, (0, i.jsx)(aL.TableCell, {
                        align: "end",
                        children: null != M ? (0, i.jsx)(aR.Tooltip, {
                            position: "top-center",
                            title: m,
                            children: (0, i.jsx)(aR.TooltipTrigger, {
                                asChild: !0,
                                children: (0, i.jsx)(k.IconButton, {
                                    as: "a",
                                    href: M,
                                    target: "_blank",
                                    rel: "noopener noreferrer",
                                    ariaLabel: m,
                                    icon: "icon-regular-arrow-up-right-from-square",
                                    size: "Small",
                                    variant: "Utility",
                                    "data-testid": "moment-violation-details-".concat(T)
                                })
                            })
                        }) : null
                    })]
                }) : (0, i.jsxs)(i.Fragment, {
                    children: [j, (0, i.jsx)(aL.TableCell, {
                        align: "end",
                        children: (0, i.jsxs)("div", {
                            className: "inline-flex items-center gap-xsmall",
                            children: [(0, i.jsx)(az, {
                                moment: n
                            }), (0, i.jsx)(aR.Tooltip, {
                                position: "top-center",
                                title: s,
                                children: (0, i.jsx)(aR.TooltipTrigger, {
                                    asChild: !0,
                                    children: (0, i.jsx)(k.IconButton, {
                                        ariaLabel: s,
                                        icon: "icon-regular-pencil",
                                        size: "Small",
                                        type: "button",
                                        variant: "Utility",
                                        onClick: w
                                    })
                                })
                            }), I && !0 === n.hasLocalVideo && x ? (0, i.jsx)(er.Button, {
                                size: "Small",
                                type: "button",
                                variant: "Standard",
                                isDisabled: r || null != o,
                                onClick: S,
                                children: g("Action.Publish")
                            }) : null]
                        })
                    })]
                })]
            })
        },
        aX = (0, d.withTranslation)(e => {
            let {
                moments: t,
                onEditMoment: n,
                onMomentMetadataChange: s,
                onPublishMoment: o,
                publishingDraftId: r = null,
                isPublishDisabled: l = !1,
                hasNextPage: u = !1,
                fetchNextPage: c,
                serverPageSize: m = 25
            } = e, {
                translate: p,
                translateWithNamespace: h
            } = (0, d.useTranslation)(), {
                classes: {
                    gridContainer: v,
                    createButtonContainer: f
                }
            } = (0, a_.default)(), {
                statusTab: x
            } = nN(), g = nM(), y = (0, a.useCallback)(e => {
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
            }, [p]), b = x === eh, T = x === ex, I = !T, C = g && !T, w = (0, a.useMemo)(() => x === ef ? t.filter(e => e.status === ef || e.status === ev) : t.filter(e => e.status === x), [t, x]), {
                page: S,
                rowsPerPage: A,
                onPageChange: M,
                onRowsPerPageChange: j
            } = (0, aD.useTablePagination)({
                count: w.length,
                initialRowsPerPage: 10,
                resetKey: x
            }), {
                currentPage: E
            } = (0, aO.useCurrentPage)(w, {
                page: S,
                rowsPerPage: A,
                hasNextPage: !!b && u,
                fetchNextPage: b ? c : void 0,
                fetchLimit: m
            }), k = (0, a.useCallback)((e, t) => {
                let n = t.target.value;
                n !== e.description && s(e, {
                    description: n
                })
            }, [s]), P = (0, a.useCallback)(e => {
                M(void 0, e)
            }, [M]), L = p("Action.Edit"), R = h(ei.TranslationNamespace.OAuth, "Label.OAuthMoreDetails"), O = (0, aN.resolveUrl)("reportAppealsUrl", "production", "global"), D = (0, i.jsx)(aL.TableHeaderCell, {
                children: p("MomentsTable.Header.Status")
            }), _ = 3 + 2 * !!I + +!!C + 3 * !!T;
            return (0, i.jsx)("div", {
                className: v,
                children: (0, i.jsx)("div", {
                    className: (0, N.clsx)(f, "flex flex-col gap-xlarge width-full self-stretch"),
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col gap-y-medium width-full",
                        children: [(0, i.jsxs)(aL.Table, {
                            className: "width-full",
                            variant: "Framed",
                            children: [(0, i.jsx)(aL.TableHeader, {
                                children: (0, i.jsxs)(aL.TableRow, {
                                    children: [(0, i.jsx)(aL.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Moments")
                                    }), I ? (0, i.jsxs)(i.Fragment, {
                                        children: [(0, i.jsx)(aL.TableHeaderCell, {
                                            children: p("MomentsTable.Header.ExperienceName")
                                        }), (0, i.jsx)(aL.TableHeaderCell, {
                                            children: p("MomentsTable.Header.Description")
                                        })]
                                    }) : null, C ? (0, i.jsx)(aL.TableHeaderCell, {
                                        children: p("CreateMomentModal.LanguageInput.Label")
                                    }) : null, T ? (0, i.jsxs)(i.Fragment, {
                                        children: [(0, i.jsx)(aL.TableHeaderCell, {
                                            children: p("MomentsTable.Header.Description")
                                        }), (0, i.jsx)(aL.TableHeaderCell, {
                                            children: h(ei.TranslationNamespace.AppealsPortal, "Label.UploadTime")
                                        }), (0, i.jsx)(aL.TableHeaderCell, {
                                            children: p("TableHeader.Reason")
                                        }), D, (0, i.jsx)(aL.TableHeaderCell, {
                                            align: "end",
                                            children: " "
                                        })]
                                    }) : (0, i.jsxs)(i.Fragment, {
                                        children: [D, (0, i.jsx)(aL.TableHeaderCell, {
                                            align: "end",
                                            children: " "
                                        })]
                                    })]
                                })
                            }), (0, i.jsx)(aL.TableBody, {
                                children: 0 === w.length ? (0, i.jsx)(aL.TableRow, {
                                    children: (0, i.jsx)(aL.TableCell, {
                                        colSpan: _,
                                        align: "center",
                                        className: "padding-y-xxlarge",
                                        children: (0, i.jsx)("span", {
                                            className: "text-body-medium content-muted block padding-y-xxlarge",
                                            "data-testid": "moments-table-empty-filter-message",
                                            children: p(aY[x])
                                        })
                                    })
                                }) : E.map(e => (0, i.jsx)(aQ, {
                                    moment: e,
                                    editLabel: L,
                                    publishingDraftId: r,
                                    isPublishDisabled: l,
                                    showMomentDetailColumns: I,
                                    showContentLanguageColumn: C,
                                    showModerationColumns: T,
                                    moreDetailsLabel: R,
                                    reportAppealsUrl: O,
                                    statusLabel: y(e.status),
                                    onEditMoment: n,
                                    onDescriptionBlur: k,
                                    onPublishMoment: o
                                }, nj(e)))
                            })]
                        }), w.length > 0 ? (0, i.jsx)(aL.TablePagination, {
                            paginationAriaLabel: "Pagination",
                            page: S,
                            rowsPerPage: A,
                            totalRows: w.length,
                            rowsPerPageOptions: aW,
                            onPageChange: P,
                            onRowsPerPageChange: j
                        }) : null]
                    })
                })
            })
        }, [ei.TranslationNamespace.Creations, ei.TranslationNamespace.Controls, ei.TranslationNamespace.NotApproved, ei.TranslationNamespace.AppealsPortal, ei.TranslationNamespace.OAuth]),
        aZ = (0, d.withTranslation)(e => {
            let {
                onRetry: t
            } = e, {
                translate: n
            } = (0, d.useTranslation)();
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
    var a$ = e.i(917852);
    let a0 = () => {
            window.open(a$.idVerificationActionUrl, "_blank", "noopener,noreferrer")
        },
        a1 = (0, d.withTranslation)(() => {
            let {
                translate: e
            } = (0, d.useTranslation)();
            return (0, i.jsx)(el.Alert, {
                className: "width-full",
                variant: "Feedback",
                severity: "Warning",
                hasCloseAffordance: !1,
                primaryActionLabel: e("Label.VerifyId"),
                onPrimaryAction: a0,
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
        a2 = () => {
            var e;
            (() => {
                let {
                    user: e
                } = (0, V.useAuthentication)(), t = null == e ? void 0 : e.id;
                (0, a.useEffect)(() => () => {
                    void 0 !== t && (() => {
                        for (let e of eC.keys()) {
                            let t = eC.get(e);
                            t && (URL.revokeObjectURL(t.thumbnailUrl), URL.revokeObjectURL(t.videoUrl), eC.delete(e))
                        }
                    })()
                }, [t])
            })();
            let {
                translate: t
            } = (0, d.useTranslation)(), {
                user: n
            } = (0, V.useAuthentication)(), s = null == n ? void 0 : n.id, {
                data: o,
                isLoading: r,
                isError: l,
                refetch: u
            } = (0, av.useCreatorEligibility)(), c = null != (e = null == o ? void 0 : o.creatorEligibility.includes(am.CreatorEligibilityEnum.IdVerified)) && e, m = r || l || !c, p = !r && !l && !c, h = (0, a.useCallback)(() => {
                u()
            }, [u]), [v, f] = (0, a.useState)(!1), [x, g] = (0, a.useState)(null), [y, b] = (0, a.useState)({}), {
                moments: T,
                updateMoment: I,
                removeMoment: C
            } = eG(), {
                publishMoment: w,
                publishingDraftId: S,
                isPublishing: A
            } = function() {
                var e;
                let {
                    translate: t
                } = (0, d.useTranslation)(), {
                    locale: n
                } = (0, d.useLocalization)(), i = nM(), {
                    user: s
                } = (0, V.useAuthentication)(), o = null == s ? void 0 : s.id, {
                    mutateAsync: r,
                    isPending: l,
                    variables: u
                } = (0, eY.useMutation)({
                    mutationFn: async e => {
                        let {
                            moment: a
                        } = e;
                        if (null == o) throw Error("Authenticated user is required to publish a moment");
                        let s = await eN(o, a.draftId);
                        if (!s) throw Error("Local moment video is required before publishing");
                        return await nT({
                            moment: a,
                            file: s,
                            userId: o,
                            uiLocale: n,
                            sendVideoContentLanguage: i,
                            displayName: t("Label.PublishMomentDisplayName") || "Creator Hub Moment"
                        }), a
                    }
                });
                return {
                    publishMoment: (0, a.useCallback)(e => r({
                        moment: e
                    }), [r]),
                    publishingDraftId: l && null != (e = null == u ? void 0 : u.moment.draftId) ? e : null,
                    isPublishing: l
                }
            }(), M = (0, a.useRef)(!1), {
                deleteMoment: j,
                deletingMomentKey: E
            } = function() {
                let {
                    user: e
                } = (0, V.useAuthentication)(), t = (0, eH.useQueryClient)(), n = null == e ? void 0 : e.id, i = nA(), {
                    mutateAsync: s,
                    isPending: o,
                    variables: r
                } = (0, eY.useMutation)({
                    mutationFn: e => {
                        let {
                            moment: t
                        } = e;
                        return t7({
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
                            e.setQueryData(nk(t, i), e => (null == e ? void 0 : e.pages.length) ? {
                                ...e,
                                pages: e.pages.map(e => ({
                                    ...e,
                                    moments: e.moments.filter(e => nj(e) !== n)
                                }))
                            } : e)
                        }(t, n, nj(s), i)
                    }
                });
                return {
                    deleteMoment: (0, a.useCallback)(e => s({
                        moment: e
                    }), [s]),
                    deletingMomentKey: o && null != r ? nj(r.moment) : null,
                    isDeleting: o
                }
            }(), {
                statusTab: k
            } = nN(), P = nP(), {
                serverMoments: N,
                isAllServerMomentsLoaded: L,
                hasNextPage: R,
                fetchNextPage: O,
                error: D,
                isPending: _,
                isFetchingNextPage: U,
                isFetchNextPageError: B,
                errorUpdatedAt: z,
                loadedPageCount: q,
                refetch: F,
                serverPageSize: G
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
                        isFetchingNextPage: u,
                        isFetchNextPageError: d,
                        errorUpdatedAt: c
                    } = function() {
                        let {
                            user: e
                        } = (0, V.useAuthentication)(), t = null == e ? void 0 : e.id, n = nA();
                        return (0, eW.useInfiniteQuery)({
                            queryKey: nk(t, n),
                            queryFn: null != t ? e => {
                                let {
                                    pageParam: i
                                } = e;
                                return t6(t, i, n)
                            } : eK.skipToken,
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
                            for (let e of n.moments) t.set(nj(e), e);
                        return [...t.values()]
                    }(n.pages) : ax, [n]),
                    p = null != (e = null == n ? void 0 : n.pages.length) ? e : 0,
                    h = (0, a.useCallback)(() => {
                        r({
                            cancelRefetch: !1,
                            throwOnError: !1
                        })
                    }, [r]),
                    v = l && !d;
                (0, af.useBackgroundPageLoader)({
                    hasNextPage: v,
                    fetchNextPage: h,
                    disabled: s
                });
                let f = !v && !s && !u;
                return (0, a.useMemo)(() => ({
                    serverMoments: m,
                    isAllServerMomentsLoaded: f,
                    hasNextPage: v,
                    fetchNextPage: h,
                    error: i,
                    isPending: s,
                    isFetchingNextPage: u,
                    isFetchNextPageError: d,
                    errorUpdatedAt: c,
                    loadedPageCount: p,
                    refetch: o,
                    serverPageSize: t
                }), [v, i, h, f, d, u, s, c, p, o, m, t])
            }(), H = P && k === ex, {
                data: K,
                isPending: W,
                error: Y,
                refetch: J
            } = function(e) {
                let {
                    enabled: t
                } = e, {
                    user: n
                } = (0, V.useAuthentication)(), i = null == n ? void 0 : n.id;
                return (0, eJ.useQuery)({
                    queryKey: ["userViolations", i],
                    queryFn: null != i && t ? () => nh(i) : eK.skipToken,
                    staleTime: 1 / 0,
                    retry: !1
                })
            }({
                enabled: H
            }), Q = (0, a.useMemo)(() => (null != K ? K : []).map(ab), [K]), X = (0, a.useCallback)(() => {
                J()
            }, [J]);
            (0, a.useEffect)(() => {
                Y && tG(tB.ListViolations, Y, {
                    userId: s
                })
            }, [s, Y]);
            let $ = (0, a.useMemo)(() => [...N, ...T].map(e => {
                    let t = y[nj(e)];
                    return t ? {
                        ...e,
                        ...t
                    } : e
                }), [T, y, N]),
                ee = (0, a.useMemo)(() => {
                    let e = $.filter(e => e.status !== ex);
                    return H ? [...e, ...Q] : e
                }, [H, Q, $]),
                et = ee.length > 0,
                en = (0, a.useRef)(0);
            (0, a.useEffect)(() => {
                !D || _ || B || z <= en.current || (en.current = z, tG(tB.ListMoments, D, {
                    userId: s,
                    pageCount: q
                }))
            }, [D, z, B, _, q, s]);
            let ei = (0, a.useRef)(!1);
            (0, a.useEffect)(() => {
                if (!B || U) {
                    ei.current = !1;
                    return
                }
                D && !ei.current && (ei.current = !0, tG(tB.FetchNextPage, D, {
                    userId: s,
                    pageCount: q
                }))
            }, [D, B, U, q, s]);
            let ea = (0, a.useMemo)(() => {
                    var e;
                    if (!x) return null;
                    let t = nj(x);
                    return null != (e = $.find(e => nj(e) === t)) ? e : x
                }, [x, $]),
                es = (0, a.useCallback)(e => {
                    g(e), f(!0)
                }, []),
                eo = (0, a.useCallback)(e => {
                    f(e), e || g(null)
                }, []),
                er = (0, a.useCallback)(() => {
                    F()
                }, [F]),
                el = (0, a.useCallback)(() => {
                    (0, ah.toast)({
                        title: t("Message.MomentPublishedError")
                    })
                }, [t]),
                eu = (0, a.useCallback)(() => {
                    (0, ah.toast)({
                        title: t("Message.MomentUploading")
                    })
                }, [t]),
                ed = (0, a.useCallback)(() => {
                    (0, ah.toast)({
                        title: t("Message.MomentProcessing")
                    })
                }, [t]),
                ec = (0, a.useCallback)(() => {
                    (0, ah.toast)({
                        title: t("Message.MomentDeletedError")
                    })
                }, [t]),
                em = (0, a.useCallback)(async e => {
                    let t = e.status === ef,
                        n = nj(e),
                        i = {
                            ...t ? {
                                draftId: e.draftId
                            } : {
                                momentId: e.momentId,
                                feedItemId: e.feedItemId
                            },
                            experienceId: aT(e),
                            isLocalMoment: t,
                            userId: s
                        };
                    tW(tB.DeleteMoment, i);
                    try {
                        e.status === ef ? C(e.draftId) : await j(e), b(e => {
                            if (!(n in e)) return e;
                            let {
                                [n]: t, ...i
                            } = e;
                            return i
                        }), f(!1), g(null), tY(tB.DeleteMoment, i)
                    } catch (e) {
                        tG(tB.DeleteMoment, e, i), ec()
                    }
                }, [j, C, ec, s]),
                ep = (0, a.useCallback)((e, t) => {
                    if (e.status === ef) return void I(e.draftId, t);
                    let n = nj(e),
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
                }, [I]),
                eh = (0, a.useCallback)(async e => {
                    if (M.current || A || m) return;
                    let t = T.find(t => t.draftId === e);
                    if (!t) return;
                    M.current = !0;
                    let n = {
                        draftId: e,
                        experienceId: aT(t),
                        isLocalMoment: !0,
                        userId: s
                    };
                    tW(tB.PublishMoment, n), eu();
                    try {
                        await w(t), C(e), f(!1), g(null), tY(tB.PublishMoment, n), ed()
                    } catch (e) {
                        tG(tB.PublishMoment, e, n), el()
                    } finally {
                        M.current = !1
                    }
                }, [m, A, T, w, C, el, eu, ed, s]),
                ev = (0, a.useCallback)(e => {
                    e.status === ef && eh(e.draftId)
                }, [eh]);
            return H && Y ? (0, i.jsx)(ap.default, {
                onReload: X
            }) : H && W ? (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(Z.ProgressCircle, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            }) : !D || k === ef || H || et ? (!_ || H || et) && (L || H || et) ? (0, i.jsxs)("div", {
                className: "flex grow-1 flex-col gap-medium self-stretch width-full",
                children: [l ? (0, i.jsx)(aZ, {
                    onRetry: h
                }) : null, p ? (0, i.jsx)(a1, {}) : null, et || H ? (0, i.jsx)(aX, {
                    moments: ee,
                    hasNextPage: R,
                    fetchNextPage: O,
                    serverPageSize: G,
                    onEditMoment: es,
                    onMomentMetadataChange: ep,
                    onPublishMoment: eh,
                    publishingDraftId: S,
                    isPublishDisabled: m
                }) : (0, i.jsx)("div", {
                    className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                    children: (0, i.jsx)(aP, {
                        onCreateClick: n5
                    })
                }), (0, i.jsx)(aj, {
                    moment: ea,
                    open: v,
                    onOpenChange: eo,
                    onMomentMetadataChange: ep,
                    onDelete: ea ? em : void 0,
                    onPublish: (null == ea ? void 0 : ea.status) === ef ? ev : void 0,
                    publishingDraftId: S,
                    deletingMomentKey: E,
                    isPublishDisabled: m
                }, ea ? nj(ea) : void 0)]
            }) : (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(Z.ProgressCircle, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            }) : (0, i.jsx)(ap.default, {
                onReload: er
            })
        },
        a4 = {
            width: "100%",
            height: "100%"
        },
        a5 = (0, il.makeStyles)()(e => ({
            section: {
                ...a4
            },
            container: {
                ...a4
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
        a8 = (0, J.default)(() => e.A(202045), {
            loadableGenerated: {
                modules: [623728]
            },
            ssr: !1
        }),
        a6 = (0, J.default)(() => e.A(378869), {
            loadableGenerated: {
                modules: [518808]
            },
            ssr: !1
        }),
        a3 = (0, J.default)(() => e.A(580854), {
            loadableGenerated: {
                modules: [427685]
            },
            ssr: !1
        }),
        a7 = (0, J.default)(() => e.A(307640), {
            loadableGenerated: {
                modules: [48220]
            },
            ssr: !1
        }),
        a9 = (0, J.default)(() => e.A(114198), {
            loadableGenerated: {
                modules: [595604]
            },
            ssr: !1
        }),
        se = (0, J.default)(() => e.A(558217), {
            loadableGenerated: {
                modules: [333771]
            },
            ssr: !1
        }),
        st = (0, J.default)(() => e.A(546234), {
            loadableGenerated: {
                modules: [82873]
            },
            ssr: !1
        }),
        sn = (0, J.default)(() => e.A(85397), {
            loadableGenerated: {
                modules: [973472]
            },
            ssr: !1
        }),
        si = (0, J.default)(() => e.A(890748), {
            loadableGenerated: {
                modules: [835459]
            },
            ssr: !1
        }),
        sa = (0, J.default)(() => e.A(68996), {
            loadableGenerated: {
                modules: [565869]
            },
            ssr: !1
        }),
        ss = (0, J.default)(() => e.A(441969), {
            loadableGenerated: {
                modules: [415945]
            },
            ssr: !1
        }),
        so = (0, J.default)(() => e.A(481709), {
            loadableGenerated: {
                modules: [947274]
            },
            ssr: !1
        }),
        sr = (0, J.default)(() => e.A(272047), {
            loadableGenerated: {
                modules: [616027]
            },
            ssr: !1
        });

    function sl(e) {
        let t = (0, h.readQueryValue)(e);
        return void 0 === t ? m.Asset.MyExperiences : (0, p.isValidEnumValue)(m.Asset, t) ? t : m.Asset.MyExperiences
    }
    let su = (0, d.withTranslation)(e => {
            let {
                verificationMetadata: t,
                currentGroup: n,
                currentUser: s,
                allowedAssetTypes: o
            } = e, [r, l] = (0, en.useQueryParams)(["activeTab", "filterIndex"]), {
                resetAllFilters: u
            } = (0, eo.default)(), {
                isFetched: c
            } = (0, f.useGroups)(), {
                isResolving: p
            } = (0, a.useContext)(q), h = C(), v = (0, ih.default)(), I = (0, iv.default)(), {
                translate: w,
                ready: S
            } = (0, d.useTranslation)(), A = (0, y.default)(), M = (0, a.useRef)(void 0), j = (0, a.useMemo)(() => [], []), E = (0, x.isTaxonomyActiveTab)(r.activeTab), k = E || (0, x.isRecentsActiveTab)(r.activeTab), P = (0, a.useMemo)(() => {
                let e = (0, x.isAllAssetTypesActiveTab)(r.activeTab) ? m.Asset.AllCatalogAsset : x.TAXONOMY_HOST_ASSET;
                return T.default.getMenuState(k ? e : sl(r.activeTab), j)
            }, [r.activeTab, j, k]);
            (0, a.useEffect)(() => {
                (0, x.isRecentsActiveTab)(r.activeTab) && l({
                    activeTab: E ? (0, x.buildTaxonomyActiveTab)(x.ALL_ASSET_TYPES_L1_KEY) : m.Asset.AllCatalogAsset,
                    filterIndex: 0
                })
            }, [r.activeTab, E, l]);
            let N = (0, a.useMemo)(() => b.default.filter(e => !j.includes(e.type)), [j]),
                {
                    classes: {
                        section: L,
                        container: R
                    }
                } = a5(),
                O = (0, a.useCallback)(e => {
                    if (P.menuItem === e.menuItem && P.submenuItem === e.submenuItem) return;
                    if ((0, x.shouldOpenTaxonomyView)({
                            isTaxonomyEnabled: A,
                            isChangingSection: P.menuItem !== e.menuItem,
                            nextAssetType: T.default.getAssetType(e)
                        })) return void l({
                        activeTab: x.AVATAR_ITEMS_ACTIVE_TAB,
                        filterIndex: 0
                    });
                    let t = (0, es.isOnItemTab)(e.menuItem.type) ? 0 : void 0;
                    l({
                        activeTab: T.default.getAssetType(e),
                        filterIndex: t
                    })
                }, [P.menuItem, P.submenuItem, l, A]),
                D = (0, a.useMemo)(() => {
                    let e = sl(r.activeTab);
                    if (void 0 === h && e === m.Asset.Moments || void 0 === I && e === m.Asset.Showcase) return P;
                    let t = sl(r.activeTab) === m.Asset.TextDocument;
                    if (void 0 === v && t) return P;
                    let i = T.default.getValidMenuState(N, P, n, void 0, void 0, h, I, v);
                    if (i !== P) {
                        if (!E) {
                            let e = (0, es.isOnItemTab)(i.menuItem.type) ? 0 : void 0;
                            l({
                                activeTab: T.default.getAssetType(i),
                                filterIndex: e
                            })
                        }
                        return i
                    }
                    return P
                }, [N, P, E, r.activeTab, n, h, v, I, l]),
                _ = (0, a.useMemo)(() => T.default.getAssetType(D), [D]);
            (0, a.useEffect)(() => {
                if (void 0 === M.current) {
                    M.current = _;
                    return
                }
                let e = M.current;
                e !== _ && (M.current = _, (0, g.isDevelopmentItemAsset)(e, v) && (0, g.isDevelopmentItemAsset)(_, v) || u())
            }, [_, v, u]);
            let U = _ === m.Asset.MyExperiences || _ === m.Asset.SharedExperiences,
                B = (0, a.useMemo)(() => null == o ? void 0 : o.has(_), [_, o]),
                z = (0, g.isDevelopmentItemAsset)(_, v),
                V = (0, a.useMemo)(() => {
                    var e, t;
                    return z ? (0, i.jsx)(so, {
                        groupId: null == n ? void 0 : n.id,
                        useTabNavigationSpacing: !1,
                        userId: null == s ? void 0 : s.id
                    }) : _ === m.Asset.Decal ? (0, i.jsx)(a3, {
                        groupId: null == n ? void 0 : n.id
                    }) : _ === m.Asset.Animation ? (0, i.jsx)(a6, {
                        groupId: null == n ? void 0 : n.id
                    }) : _ === m.Asset.Audio || _ === m.Asset.Video ? (0, i.jsx)(a7, {
                        mediaAssetType: _,
                        groupId: null == n ? void 0 : n.id
                    }) : _ === m.Asset.Plugin ? (0, i.jsx)(st, {
                        groupId: null == n ? void 0 : n.id
                    }) : _ === m.Asset.Model ? (0, i.jsx)(se, {
                        groupId: null == n ? void 0 : n.id
                    }) : _ === m.Asset.MeshPart ? (0, i.jsx)(a9, {
                        groupId: null == n ? void 0 : n.id
                    }) : _ === m.Asset.TextDocument ? (0, i.jsx)("div", {
                        className: "flex justify-center items-center padding-y-xxlarge",
                        children: (0, i.jsx)(Z.ProgressCircle, {
                            ariaLabel: w("Label.Loading"),
                            size: "Large",
                            variant: "Indeterminate"
                        })
                    }) : _ === m.Asset.ShareLink ? (0, i.jsx)(sa, {}) : _ === m.Asset.Moments ? (0, i.jsx)(a2, {}) : _ === m.Asset.AssetPermissionRequests ? (0, i.jsx)(sr, {}) : _ === m.Asset.Showcase ? (0, i.jsx)(sn, {
                        groupId: null == n ? void 0 : n.id
                    }) : _ === m.Asset.AllCatalogAsset || _ === m.Asset.AvatarLooks || _ === m.Asset.AvatarBackground ? (0, i.jsx)(a8, {
                        assetType: _,
                        groupId: null == n ? void 0 : n.id
                    }) : _ === m.Asset.Image || _ === m.Asset.Mesh ? (0, i.jsx)(si, {
                        primitiveAssetType: _,
                        groupId: null == n ? void 0 : n.id
                    }) : B ? (0, i.jsx)(a8, {
                        assetType: _,
                        groupId: null == n ? void 0 : n.id
                    }) : (0, i.jsx)(ss, {
                        assetType: _,
                        creatorType: (null == n ? void 0 : n.id) ? Q.SearchCreatorType.Group : Q.SearchCreatorType.User,
                        creatorTargetId: null != (e = null != (t = null == n ? void 0 : n.id) ? t : null == s ? void 0 : s.id) ? e : 0,
                        isTelemetryReady: c && S && !p && (null == s ? void 0 : s.id) !== void 0 && sl(r.activeTab) === _
                    })
                }, [_, null == n ? void 0 : n.id, null == s ? void 0 : s.id, B, z, w, c, S, p, r.activeTab]);
            return (0, i.jsxs)(ea.default, {
                children: [(0, i.jsx)(X.HubMeta, {
                    title: (0, X.buildTitle)(D.submenuItem ? w(D.submenuItem.nameKey) : w(D.menuItem.nameKey)),
                    breadcrumb: (0, X.buildBreadcrumb)(w("Heading.Creations"), w(D.menuItem.nameKey), D.submenuItem ? w(D.submenuItem.nameKey) : void 0)
                }), (0, i.jsx)("section", {
                    className: L,
                    children: (0, i.jsxs)($.Grid, {
                        container: !0,
                        direction: "column",
                        className: R,
                        children: [(0, i.jsx)(ee.AgeVerificationUpsellBanner, {
                            trackingPage: ee.AgeVerificationUpsellPage.Creations
                        }), !z && (0, i.jsx)(ac, {
                            menuState: D,
                            onMenuStateChange: O,
                            verificationMetadata: t,
                            group: n
                        }), U && (0, i.jsx)(et.default, {}), V]
                    })
                })]
            })
        }, [ei.TranslationNamespace.AssetTypes, ei.TranslationNamespace.Controls, ei.TranslationNamespace.Creations, ei.TranslationNamespace.Error, ei.TranslationNamespace.Navigation, ei.TranslationNamespace.ShareLinksManagement, ei.TranslationNamespace.ExperienceReleases, ei.TranslationNamespace.Taxonomy]),
        sd = () => {
            let e = (0, f.useCurrentGroup)(),
                {
                    user: t
                } = (0, V.useAuthentication)(),
                n = (0, Y.default)(),
                [s, o] = (0, a.useState)(void 0);
            return (0, a.useEffect)(() => {
                (0, b.getAllowedMarketplaceItemTypes)().then(e => {
                    let {
                        assetTypes: t
                    } = e;
                    o(t)
                })
            }, []), (0, i.jsx)(W, {
                children: (0, i.jsx)(su, {
                    verificationMetadata: n,
                    currentGroup: e,
                    currentUser: t,
                    allowedAssetTypes: s
                })
            })
        };
    var sc = e.i(675330),
        sm = e.i(177608),
        sp = e.i(796266);
    let sh = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)(sm.default, {
                title: (0, i.jsx)(z, {}),
                secondaryRail: (0, i.jsx)(j, {}),
                secondarySize: "small",
                noBreadCrumbs: !0,
                children: (0, i.jsx)(o.default, {
                    children: t
                })
            })
        },
        sv = () => {
            let {
                isResolving: e
            } = (0, sp.default)(), t = (0, a.useMemo)(() => ({
                isResolving: e
            }), [e]);
            return (0, i.jsx)(r.default, {
                children: (0, i.jsx)(sc.default, {
                    children: (0, i.jsx)(s.default, {
                        children: (0, i.jsx)(q.Provider, {
                            value: t,
                            children: (0, i.jsx)(sd, {})
                        })
                    })
                })
            })
        };
    sv.getPageLayout = e => (0, i.jsx)(sh, {
        children: e
    }), sv.loggerConfig = {
        rosId: "3539"
    }, e.s(["default", 0, sv], 962059)
}, 748348, (e, t, n) => {
    let i = "/dashboard/creations";
    (window.__NEXT_P = window.__NEXT_P || []).push([i, () => e.r(962059)]), t.hot && t.hot.dispose(function() {
        window.__NEXT_P.push([i])
    })
}]);

//# debugId=1861767b-813b-521f-50c5-2c5beedbc276
//# sourceMappingURL=1ymhxy50-cpik.js.map