;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "da33ddcc-266d-e908-8f2d-50652a9dccef")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 962059, e => {
    "use strict";
    var t, n, i = e.i(221628),
        a = e.i(237401),
        s = e.i(79187),
        r = e.i(203450),
        o = e.i(384621),
        l = e.i(138726),
        u = e.i(416340),
        d = e.i(692734),
        c = e.i(134731),
        m = e.i(671376),
        p = e.i(927868),
        h = e.i(692587),
        v = e.i(85057),
        f = e.i(745873),
        x = e.i(486736),
        g = e.i(130778),
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
        A = () => {
            let e = (0, a.useRouter)(),
                {
                    translate: t
                } = (0, s.useTranslation)(),
                {
                    settings: n
                } = (0, x.useSettings)(),
                r = (0, f.useCurrentGroup)(),
                o = C(),
                {
                    value: l
                } = (0, d.useFlag)(c.isAssetAccessRequestsEnabled),
                T = (0, b.default)(),
                A = (0, u.useMemo)(() => (t, n) => {
                    let i = new URLSearchParams,
                        a = (0, h.readQueryValue)(e.query.groupId);
                    a && i.set("groupId", a), t && i.set("activeTab", t), void 0 !== n && i.set("filterIndex", String(n));
                    let s = i.toString();
                    return s ? "/dashboard/creations?".concat(s) : "/dashboard/creations"
                }, [e.query.groupId]),
                M = (0, u.useMemo)(() => y.default.filter(e => e.type !== m.Asset.AssetPermissionRequests || l).filter(e => I.default.isMenuItemEnabled(e, n, r, void 0, void 0, o)).map(e => {
                    var n, i, a;
                    let s = null != (n = null == (a = e.submenuItems) || null == (i = a[0]) ? void 0 : i.type) ? n : e.type,
                        r = S[e.type],
                        o = e.type === m.Asset.TShirt,
                        l = T ? g.AVATAR_ITEMS_ACTIVE_TAB : m.Asset.AvatarLooks;
                    return {
                        key: "".concat(w).concat(e.type),
                        label: r ? t(r) : t(e.nameKey),
                        href: e.type === m.Asset.Place ? A() : A(o ? l : s, o ? 0 : void 0)
                    }
                }), [A, r, l, o, T, n, t]),
                j = (0, u.useMemo)(() => {
                    var t;
                    let n, i = I.default.getMenuState((0, g.isTaxonomyActiveTab)(e.query.activeTab) ? g.TAXONOMY_HOST_ASSET : (t = e.query.activeTab, void 0 !== (n = (0, h.readQueryValue)(t)) && (0, p.isValidEnumValue)(m.Asset, n) ? n : void 0), []);
                    return "".concat(w).concat(i.menuItem.type)
                }, [e.query.activeTab]);
            return (0, i.jsx)(v.default, {
                header: t("Heading.Creations"),
                activeKey: j,
                items: M
            })
        };
    var M = e.i(29929),
        j = e.i(227700);
    let E = () => {
        let {
            params: e
        } = (0, j.useIXPParameters)(M.IXPLayers.CreatorHubPublishing, {
            restoreInitialValueFromCache: !0
        });
        return !0 === e[M.CreatorHubPublishingParameters.EnablePublishingConsolidation]
    };
    var P = e.i(443967),
        k = e.i(197649),
        L = e.i(278705),
        N = e.i(634851),
        R = e.i(270737);
    let D = () => u.default.createElement("div", {
            className: "flex items-center justify-center shrink-0 width-600"
        }, u.default.createElement("span", {
            className: "text-body-medium content-default"
        }, "/")),
        O = e => {
            let {
                item: t,
                isActive: n
            } = e, {
                label: i,
                href: a,
                leadingIcon: s,
                mediaSrc: r,
                onClick: o
            } = t, l = u.default.createElement("div", {
                className: (0, k.default)("flex items-center gap-small shrink-0 height-600")
            }, s && u.default.createElement(L.Icon, {
                name: s,
                size: "XSmall",
                className: "content-emphasis"
            }), r && u.default.createElement("div", {
                className: "shrink-0 size-500"
            }, u.default.createElement(R.Media, {
                src: r,
                alt: i,
                aspectRatio: "1:1",
                containerClassName: "radius-small clip"
            })), u.default.createElement("span", {
                className: (0, k.default)("text-no-wrap", {
                    "content-emphasis text-title-medium": n,
                    "content-default text-body-medium": !n
                })
            }, i));
            return a && !n ? u.default.createElement("a", {
                href: a,
                onClick: o,
                className: (0, k.default)("flex items-center shrink-0 focus-visible:outline-focus radius-small"),
                style: {
                    textDecoration: "none"
                }
            }, l) : o && !n ? u.default.createElement("button", {
                type: "button",
                onClick: o,
                className: (0, k.default)("flex items-center shrink-0 cursor-pointer padding-none bg-none focus-visible:outline-focus radius-small"),
                style: {
                    border: "none"
                }
            }, l) : u.default.createElement("div", {
                className: "flex items-center shrink-0",
                "aria-current": n ? "page" : void 0
            }, l)
        },
        U = e => {
            var {
                items: t,
                maxItems: n,
                ariaLabel: i,
                expansionAriaLabel: a,
                className: s
            } = e, r = (0, P._)(e, ["items", "maxItems", "ariaLabel", "expansionAriaLabel", "className"]);
            let [o, l] = (0, u.useState)(!1), d = null != n && t.length > n && !o, c = t, m = !1;
            d && (c = [t[0], t[t.length - 1]], m = !0);
            let p = () => {
                l(!0)
            };
            return u.default.createElement("nav", Object.assign({
                "aria-label": i,
                className: (0, k.default)("flex items-center height-1000", s)
            }, r), u.default.createElement("ol", {
                className: "flex items-center padding-none margin-none gap-none",
                style: {
                    listStyle: "none"
                }
            }, c.map((e, t) => {
                let n = t === c.length - 1;
                return u.default.createElement(u.default.Fragment, {
                    key: e.href || "".concat(e.label, "-").concat(t)
                }, m && 1 === t && u.default.createElement(u.default.Fragment, null, u.default.createElement("li", null, u.default.createElement(N.IconButton, {
                    icon: "icon-filled-three-dots-horizontal",
                    ariaLabel: a,
                    size: "XSmall",
                    variant: "Standard",
                    onClick: p,
                    className: "size-600 min-height-600 max-height-600"
                })), u.default.createElement("li", null, u.default.createElement(D, null))), u.default.createElement("li", null, u.default.createElement(O, {
                    item: e,
                    isActive: n
                })), t < c.length - 1 && u.default.createElement("li", null, u.default.createElement(D, null)))
            })))
        };
    U.displayName = "Breadcrumbs";
    var B = e.i(881670);
    let z = (0, s.withTranslation)(() => {
        let e, t = (0, a.useRouter)(),
            {
                translate: n
            } = (0, s.useTranslation)(),
            r = Array.isArray(e = t.query.groupId) ? e[0] : e,
            o = (0, u.useMemo)(() => {
                let e, t;
                return [{
                    label: n("Heading.Creations"),
                    href: (e = new URLSearchParams, null != r && e.set("groupId", r), (t = e.toString()).length > 0 ? "/dashboard/creations?".concat(t) : "/dashboard/creations")
                }, {
                    label: n("Label.DevelopmentItems")
                }]
            }, [r, n]);
        return (0, i.jsx)(U, {
            ariaLabel: n("Label.DevelopmentItems"),
            expansionAriaLabel: n("Label.OpenOptions"),
            items: o
        })
    }, [B.TranslationNamespace.Controls, B.TranslationNamespace.Creations, B.TranslationNamespace.Navigation]);
    var V = e.i(211461),
        F = e.i(814975),
        q = e.i(252842),
        G = e.i(533414),
        _ = e.i(456810);
    let H = {
            sort: _.defaultAssetsSort,
            sortOrder: q.SortOrder.Desc,
            isArchived: !1,
            isPublishOnly: !1,
            isOnMarketplace: !1
        },
        K = e => {
            let {
                children: t
            } = e, {
                user: n
            } = (0, F.useAuthentication)(), [a, s] = (0, G.useLocalStorage)("creationSort.".concat(null == n ? void 0 : n.id), H.sort), r = (0, u.useRef)(a), o = (0, u.useMemo)(() => {
                let e = r.current;
                return Object.keys(a).some(t => a[t] !== e[t]) && (r.current = a), r.current
            }, [a]), [l, d] = (0, G.useLocalStorage)("creationSortOrder.".concat(null == n ? void 0 : n.id), H.sortOrder), [c, m] = (0, u.useState)(H.isArchived), [p, h] = (0, u.useState)(!1), [v, f] = (0, u.useState)(H.isPublishOnly), [x, g] = (0, u.useState)(H.isOnMarketplace), b = (0, u.useCallback)(() => {
                s(H.sort), d(H.sortOrder), m(H.isArchived), h(!1), f(H.isPublishOnly), g(H.isOnMarketplace)
            }, [s, d]), y = (0, u.useMemo)(() => ({
                isArchived: c,
                isAgeRestrictedCollaboration: p,
                isOnMarketplace: x,
                isPublicOnly: v,
                resetAllFilters: b,
                setIsArchived: m,
                setIsAgeRestrictedCollaboration: h,
                setIsOnMarketplace: g,
                setIsPublicOnly: f,
                setSort: s,
                setSortOrder: d,
                sort: o,
                sortOrder: l
            }), [c, p, x, v, b, m, h, g, f, s, d, o, l]);
            return (0, i.jsx)(_.default.Provider, {
                value: y,
                children: t
            })
        };
    var W = e.i(668091),
        Q = e.i(109182),
        Y = e.i(959222),
        J = e.i(37819),
        X = e.i(169722),
        Z = e.i(714039),
        $ = e.i(686197),
        ee = e.i(780880),
        et = e.i(845592),
        en = e.i(418564);
    let ei = () => {
            let {
                translate: e
            } = (0, s.useTranslation)(), {
                settings: t
            } = (0, x.useSettings)();
            return t.enableUgcUploadPublishBlockBanner ? (0, i.jsx)(en.default, {
                alertTitle: e("Heading.UgcUploadPublishBlockTitle"),
                alertDescription: e("Label.UgcUploadPublishBlock"),
                severity: "warning",
                externalLink: void 0,
                linkLabel: void 0,
                allowCloseDialog: !0
            }) : null
        },
        ea = () => {
            let {
                translate: e
            } = (0, s.useTranslation)(), {
                settings: t
            } = (0, x.useSettings)();
            return t.enable2D3DUnificationBanner ? (0, i.jsx)("div", {
                className: "margin-bottom-[32px]",
                children: (0, i.jsx)(en.default, {
                    alertTitle: void 0,
                    alertDescription: e("Label.2D3DUnificationBanner"),
                    severity: "info",
                    externalLink: t.unification2D3DBannerLearnMoreUrl || void 0,
                    linkLabel: e("Label.LearnMore"),
                    allowCloseDialog: !0
                })
            }) : null
        };
    var es = e.i(339544),
        er = e.i(475642),
        eo = e.i(514961),
        el = e.i(427650),
        eu = e.i(74706),
        ed = e.i(211388);
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
                await eN(e, [n.draftId]), a.includes(n.draftId) || a.push(n.draftId);
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
            videoBlob: r
        } = s;
        return new File([r], (a = null == (i = (n = s).fileName) ? void 0 : i.trim()) ? a : n.videoBlob.type.includes("quicktime") ? "moment.mov" : "moment.mp4", {
            type: r.type || "video/mp4"
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
    }, eN = async (e, t) => {
        0 !== t.length && await Promise.all(t.map(async t => {
            eA(e, t), await ew(e, "readwrite", e => e.delete(t))
        }))
    }, eR = {
        version: "1",
        moments: []
    }, eD = e => "object" == typeof e && null !== e && !Array.isArray(e), eO = e => eD(e) && "1" === e.version && Array.isArray(e.moments) ? e.moments : [], eU = e => "string" == typeof e ? e : void 0, eB = e => "number" == typeof e && Number.isFinite(e) ? e : void 0, ez = new Set(Object.values(s.Locale)), eV = e => eO(e).map(e => (e => {
        var t, n, i, a, s, r;
        let o;
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
            locale: "string" == typeof(o = r = e.locale) && ez.has(o) ? r : void 0,
            ..."boolean" == typeof e.hasLocalVideo ? {
                hasLocalVideo: e.hasLocalVideo
            } : {}
        }
    })(e)).filter(e => null != e), eF = e => {
        if (!e) return [];
        try {
            let t = JSON.parse(e);
            return eV(t)
        } catch (e) {
            return []
        }
    }, eq = e => ({
        version: "1",
        moments: e
    }), eG = () => {
        let {
            user: e
        } = (0, F.useAuthentication)(), t = null == e ? void 0 : e.id, n = null != t, i = n ? em(t) : ep, [a, s] = (0, G.useLocalStorage)(i, eR), r = (0, u.useMemo)(() => n ? eV(a) : [], [n, a]);
        (0, u.useEffect)(() => {
            if (!n || null == t) return;
            let e = eO(a).filter(e => eD(e) && e.status !== ef).map(e => {
                var t, n;
                return eD(e) && null != (t = null != (n = eU(e.draftId)) ? n : eU(e.id)) ? t : ""
            }).filter(e => "" !== e);
            0 !== e.length && (s(eq(r)), eN(t, e))
        }, [n, r, a, s, t]);
        let o = (0, u.useCallback)((e, a) => {
                var r, o, l;
                if (!n || null == t || 0 === e.length) return {
                    moments: [],
                    evictedMediaDraftIds: []
                };
                let {
                    moments: u,
                    evictedMediaDraftIds: d
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
                })(u, null != (r = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? r : []), m = [...new Set([...null != (o = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? o : [], ...d])];
                return s(eq(c)), m.length > 0 && eN(t, m), {
                    moments: c,
                    evictedMediaDraftIds: m
                }
            }, [n, s, i, t]),
            l = (0, u.useCallback)((e, t) => o([e], t), [o]),
            d = (0, u.useCallback)((e, i) => {
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
                return a ? (s(eq(a)), a) : null
            }, [n, r, s, t]),
            c = (0, u.useCallback)(e => {
                if (!n || null == t) return null;
                let i = -1 === r.findIndex(t => t.draftId === e) ? null : r.filter(t => t.draftId !== e);
                return i ? (s(eq(i)), eN(t, [e]), i) : null
            }, [n, r, s, t]),
            m = (0, u.useCallback)(e => {
                if (!n || null == t) return null;
                let i = ((e, t) => {
                    let n = new Set(t);
                    if (0 === n.size) return null;
                    let i = e.filter(e => !n.has(e.draftId));
                    return i.length === e.length ? null : i
                })(r, e);
                if (!i) return null;
                let a = new Set(e),
                    o = r.filter(e => a.has(e.draftId)).map(e => e.draftId);
                return s(eq(i)), eN(t, o), i
            }, [n, r, s, t]);
        return {
            moments: r,
            addMoment: l,
            addMoments: o,
            updateMoment: d,
            removeMoment: c,
            removeMoments: m
        }
    };
    var e_ = e.i(795621),
        eH = e.i(711367),
        eK = e.i(630986),
        eW = e.i(182012),
        eQ = e.i(677753),
        eY = function(e, t) {
            return (eY = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function eJ(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        eY(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function eX(e, t, n, i) {
        return new(n || (n = Promise))(function(a, s) {
            function r(e) {
                try {
                    l(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
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
                })).then(r, o)
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
            r = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return r.next = o(0), r.throw = o(1), r.return = o(2), "function" == typeof Symbol && (r[Symbol.iterator] = function() {
            return this
        }), r;

        function o(o) {
            return function(l) {
                var u = [o, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; r && (r = 0, u[0] && (s = 0)), s;) try {
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
        if (void 0 !== e) return null === e ? null : {}
    }

    function e7(e) {
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
            assetId: (0, eQ.exists)(e, "assetId") ? e.assetId : void 0,
            startTime: (0, eQ.exists)(e, "startTime") ? e.startTime : void 0
        }
    }

    function e8(e) {
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

    function e6(e) {
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
            httpVerb: (0, eQ.exists)(t, "httpVerb") ? t.httpVerb : void 0,
            url: (0, eQ.exists)(t, "url") ? t.url : void 0,
            chunkNum: (0, eQ.exists)(t, "chunkNum") ? t.chunkNum : void 0,
            contentStart: (0, eQ.exists)(t, "contentStart") ? t.contentStart : void 0,
            contentLength: (0, eQ.exists)(t, "contentLength") ? t.contentLength : void 0,
            expirationTimeMs: (0, eQ.exists)(t, "expirationTimeMs") ? t.expirationTimeMs : void 0
        }
    }

    function tn(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eQ.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eQ.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eQ.exists)(t, "operationPath") ? t.operationPath : void 0,
            uploadUrls: (0, eQ.exists)(t, "uploadUrls") ? null === t.uploadUrls ? null : t.uploadUrls.map(tt) : void 0
        }
    }

    function ti(e, t) {
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
                music: (0, eQ.exists)(n, "music") ? e3(n.music) : void 0,
                textOverlays: (0, eQ.exists)(n, "textOverlays") ? null === n.textOverlays ? null : n.textOverlays.map(e6) : void 0,
                stickerOverlays: (0, eQ.exists)(n, "stickerOverlays") ? null === n.stickerOverlays ? null : n.stickerOverlays.map(e8) : void 0
            } : void 0,
            screenshotCaptureEdits: (0, eQ.exists)(e, "screenshotCaptureEdits") ? null == (a = e.screenshotCaptureEdits) ? a : {
                music: (0, eQ.exists)(a, "music") ? e3(a.music) : void 0,
                textOverlays: (0, eQ.exists)(a, "textOverlays") ? null === a.textOverlays ? null : a.textOverlays.map(e6) : void 0
            } : void 0
        }
    }

    function ta(e, t) {
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

    function ts(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eQ.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eQ.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eQ.exists)(t, "operationPath") ? t.operationPath : void 0,
            done: (0, eQ.exists)(t, "done") ? t.done : void 0
        }
    }

    function tr(e, t) {
        return null == e ? e : {
            generationToken: (0, eQ.exists)(e, "generationToken") ? e.generationToken : void 0
        }
    }

    function to(e, t) {
        return null == e ? e : {
            type: (0, eQ.exists)(e, "type") ? e.type : void 0,
            id: (0, eQ.exists)(e, "id") ? e.id : void 0
        }
    }

    function tl(e, t) {
        return null == e ? e : {
            counts: (0, eQ.exists)(e, "counts") ? e.counts : void 0,
            userReaction: (0, eQ.exists)(e, "userReaction") ? e.userReaction : void 0
        }
    }

    function tu(e, t) {
        return null == e ? e : {
            shareCount: (0, eQ.exists)(e, "shareCount") ? e.shareCount : void 0
        }
    }

    function td(e, t) {
        var n;
        return null == e ? e : {
            type: (0, eQ.exists)(e, "type") ? e.type : void 0,
            experienceCta: (0, eQ.exists)(e, "experienceCta") ? null == (n = e.experienceCta) ? n : {
                experienceId: (0, eQ.exists)(n, "experienceId") ? n.experienceId : void 0,
                placeId: (0, eQ.exists)(n, "placeId") ? n.placeId : void 0
            } : void 0
        }
    }

    function tc(e) {
        var t;
        return null == (t = e) ? t : {
            feedSessionId: (0, eQ.exists)(t, "feedSessionId") ? t.feedSessionId : void 0,
            entityId: (0, eQ.exists)(t, "entityId") ? t.entityId : void 0,
            entityType: (0, eQ.exists)(t, "entityType") ? t.entityType : void 0,
            id: (0, eQ.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eQ.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            type: (0, eQ.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eQ.exists)(t, "captionedAssetMoment") ? ti(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eQ.exists)(t, "primaryCta") ? td(t.primaryCta) : void 0,
            owner: (0, eQ.exists)(t, "owner") ? to(t.owner) : void 0,
            visibilityStatus: (0, eQ.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eQ.exists)(t, "reactions") ? tl(t.reactions) : void 0,
            stats: (0, eQ.exists)(t, "stats") ? tu(t.stats) : void 0
        }
    }

    function tm(e, t) {
        return null == e ? e : {
            feedItems: (0, eQ.exists)(e, "feedItems") ? e.feedItems : void 0,
            loaded: (0, eQ.exists)(e, "loaded") ? e.loaded : void 0,
            failed: (0, eQ.exists)(e, "failed") ? e.failed : void 0,
            moderated: (0, eQ.exists)(e, "moderated") ? e.moderated : void 0
        }
    }

    function tp(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, eQ.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eQ.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            type: (0, eQ.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eQ.exists)(t, "captionedAssetMoment") ? ti(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eQ.exists)(t, "primaryCta") ? td(t.primaryCta) : void 0,
            owner: (0, eQ.exists)(t, "owner") ? to(t.owner) : void 0,
            visibilityStatus: (0, eQ.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eQ.exists)(t, "reactions") ? tl(t.reactions) : void 0,
            stats: (0, eQ.exists)(t, "stats") ? tu(t.stats) : void 0
        }
    }

    function th(e, t) {
        return null == e ? e : {
            signingAlgorithmVersion: (0, eQ.exists)(e, "signingAlgorithmVersion") ? e.signingAlgorithmVersion : void 0,
            signature: (0, eQ.exists)(e, "signature") ? e.signature : void 0
        }
    }
    var tv = eQ.BaseAPI;

    function tf() {
        return null !== tv && tv.apply(this, arguments) || this
    }
    eJ(tf, tv), tf.prototype.backfillTriggerB1Raw = function(e, t) {
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
                        return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                }
            })
        })
    }, tf.prototype.backfillTriggerB1 = function() {
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
    var tx = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eJ(t, e), t.prototype.contentCapturesBatchCheckExperienceUploadabilityRaw = function(e, t) {
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isEligible: (0, eQ.exists)(e, "isEligible") ? e.isEligible : void 0
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return ta(e)
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return ta(e)
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
                    return eZ(this, function(r) {
                        switch (r.label) {
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
                                return s = r.sent(), [2, new eQ.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        operationId: (0, eQ.exists)(e, "operationId") ? e.operationId : void 0
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return th(e)
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
                    return eZ(this, function(r) {
                        switch (r.label) {
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
                                return s = r.sent(), [2, new eQ.JSONApiResponse(s, function(e) {
                                    return th(e)
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
                                                                    stickerOverlays: void 0 === e.stickerOverlays ? void 0 : null === e.stickerOverlays ? null : e.stickerOverlays.map(e9)
                                                                }
                                                            }(e.edits)
                                                        }
                                                    }(e.metadata),
                                                    feedRegistrationInfo: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            attributes: void 0 === e.attributes ? void 0 : null === e.attributes ? null : e.attributes.map(e7),
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
        }(eQ.BaseAPI),
        tg = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            eJ(t, e), t.prototype.moderationApplyModerationDecisionRaw = function(e, t) {
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
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
            }, t.prototype.moderationEnrichReportRaw = function(e, t) {
                return eX(this, void 0, void 0, function() {
                    var n, i, a;
                    return eZ(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/moderate/enrich-report",
                                    schemaPath: "/v1/moderate/enrich-report",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            report: e.report,
                                            content: e.content,
                                            source: e.source,
                                            custom: void 0 === e.custom ? void 0 : null === e.custom ? null : (0, eQ.mapValues)(e.custom, e5)
                                        }
                                    }(e.moderationEnrichReportRequest)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationEnrichReport = function() {
                return eX(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eZ(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationEnrichReportRaw(e, t)];
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
        }(eQ.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            eJ(t, e), t.prototype.momentTextGenerationCreateMomentVideoUploadUrlRaw = function(e) {
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
                                            videoObjectKey: e.videoObjectKey
                                        }
                                    }(e.momentTextGenerationGenerateMomentTextRequest)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return tr(e)
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return tr(e)
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        status: (0, eQ.exists)(e, "status") ? e.status : void 0,
                                        result: (0, eQ.exists)(e, "result") ? null == (t = e.result) ? t : {
                                            summary: (0, eQ.exists)(t, "summary") ? t.summary : void 0,
                                            description: (0, eQ.exists)(t, "description") ? t.description : void 0,
                                            error: (0, eQ.exists)(t, "error") ? t.error : void 0
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
            }
        }(eQ.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eJ(t, e), t.prototype.momentsCleanUserDataRaw = function(e, t) {
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eQ.exists)(e, "items") ? null === e.items ? null : e.items.map(tc) : void 0,
                                        paginationContext: (0, eQ.exists)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, eQ.exists)(e, "metadata") ? tm(e.metadata) : void 0
                                    }
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eQ.exists)(e, "items") ? null === e.items ? null : e.items.map(tp) : void 0,
                                        failedMomentIds: (0, eQ.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eQ.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0
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
                                return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eQ.exists)(e, "items") ? null === e.items ? null : e.items.map(tp) : void 0,
                                        failedMomentIds: (0, eQ.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eQ.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0,
                                        paginationContext: (0, eQ.exists)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, eQ.exists)(e, "metadata") ? tm(e.metadata) : void 0
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
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
                                return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
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
            }, t
        }(eQ.BaseAPI));
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        eJ(t, e), t.prototype.postsCompletePostRaw = function(e, t) {
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
                            return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    uploads: (0, eQ.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(ts) : void 0
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
                                                textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(e4)
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
                            return a = s.sent(), [2, new eQ.JSONApiResponse(a, function(e) {
                                var t;
                                return null == e ? e : {
                                    post: (0, eQ.exists)(e, "post") ? null == (t = e.post) ? t : {
                                        operationId: (0, eQ.exists)(t, "operationId") ? t.operationId : void 0
                                    } : void 0,
                                    uploads: (0, eQ.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(tn) : void 0
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
        }
    })(eQ.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        eJ(t, e), t.prototype.testSeedCreatePostAssetRaw = function(e, t) {
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
                            return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedCreatePostAsset = function() {
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
        }, t.prototype.testSeedInspectPostRaw = function(e, t) {
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
                            return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedInspectPost = function() {
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
        }, t.prototype.testSeedListUserMomentsRaw = function(e) {
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
                            return i = a.sent(), [2, new eQ.VoidApiResponse(i)]
                    }
                })
            })
        }, t.prototype.testSeedListUserMoments = function(e) {
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
        }, t.prototype.testSeedSeedBatchRaw = function(e, t) {
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
                            return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedSeedBatch = function() {
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
        }, t.prototype.testSeedSeedMomentRaw = function(e, t) {
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
                            return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedSeedMoment = function() {
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
        }, t.prototype.testSeedWirePostRaw = function(e, t) {
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
                            return a = s.sent(), [2, new eQ.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedWirePost = function() {
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
        }
    }(eQ.BaseAPI);
    let tb = (0, e.i(272593).createClientConfiguration)("content-captures-api", "bedev2"),
        ty = new tx(tb),
        tI = new tg(tb),
        tT = Object.assign(ty, {
            momentsGetUsersMoments: e => tI.momentsGetUsersMoments(e),
            momentsDeleteMoment: e => tI.momentsDeleteMoment(e),
            momentsDeleteMomentByFeedItem: e => tI.momentsDeleteMomentByFeedItem(e)
        });
    var tC = e.i(773057),
        tw = e.i(227987),
        tS = e.i(889311),
        tA = e.i(215955),
        tM = ((t = {}).ListMoments = "listMoments", t.FetchNextPage = "fetchNextPage", t.UploadVideo = "uploadVideo", t.ValidateVideo = "validateVideo", t.PersistLocalVideo = "persistLocalVideo", t.PublishMoment = "publishMoment", t.DeleteMoment = "deleteMoment", t.ResolveExperience = "resolveExperience", t.LoadLocalVideoMedia = "loadLocalVideoMedia", t.EnrichExperienceNames = "enrichExperienceNames", t);
    let tj = (e, t) => {
            let n;
            return null != t.momentId && (e.momentId = t.momentId), null != t.feedItemId && (e.feedItemId = t.feedItemId), null != t.draftId && (e.draftId = t.draftId), null != t.experienceId && (e.experienceId = String(t.experienceId)), null != t.placeId && (e.placeId = String(t.placeId)), null != t.fileCount && (e.fileCount = String(t.fileCount)), null != t.fileSize && (e.fileSize = String(t.fileSize)), null != t.fileType && t.fileType.length > 0 && (e.fileType = t.fileType), null != t.locale && t.locale.length > 0 && (e.locale = t.locale), null != t.inputValue && t.inputValue.length > 0 && (e.inputValue = (n = t.inputValue).length <= 200 ? n : n.slice(0, 200)), null != t.idType && (e.idType = t.idType), null != t.matchedId && (e.matchedId = String(t.matchedId)), null != t.userId && (e.userId = String(t.userId)), null != t.pageCount && (e.pageCount = String(t.pageCount)), null != t.momentCount && (e.momentCount = String(t.momentCount)), null != t.persistedVideoCount && (e.persistedVideoCount = String(t.persistedVideoCount)), null != t.isLocalMoment && (e.isLocalMoment = String(t.isLocalMoment)), null != t.universeIdCount && (e.universeIdCount = String(t.universeIdCount)), e
        },
        tE = async (e, t) => {
            var n;
            let i = await (0, tw.default)(e),
                a = e instanceof Error ? e.message : "string" == typeof e ? e : "Unknown error";
            return i ? {
                reason: null != (n = null != t ? t : i.message) ? n : a,
                httpStatus: i.status,
                errorCode: i.code
            } : {
                reason: null != t ? t : a
            }
        }, tP = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return {
                eventName: tS.default.MomentsCreationsError,
                parameters: tj({
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
        }, tk = async function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tA.default,
                a = await tE(t, n.reason);
            i.logErrorEvent(tP(e, a, n))
        }, tL = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tA.default;
            tk(e, t, n, i)
        }, tN = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: tS.default.MomentsCreationsAttempt,
                parameters: tj({
                    operation: e
                }, t)
            }
        }, tR = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: tS.default.MomentsCreationsSuccess,
                parameters: tj({
                    operation: e
                }, t)
            }
        }, tD = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tA.default;
            n.logClickEvent(tN(e, t))
        }, tO = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tA.default;
            n.logImpressionEvent(tR(e, t))
        };
    var tU = e.i(773595);
    let tB = tU.availableDocsLocales,
        tz = new Set(tB),
        tV = e => {
            let t = e === s.Locale.SimplifiedChineseJV ? s.Locale.SimplifiedChinese : e;
            return null != t && tz.has(t) ? t : s.Locale.English
        },
        tF = e => null != e ? (0, s.toLocaleNativeName)(e) : "-",
        tq = {
            active: eh,
            captionedassetmoment: eh,
            live: eh,
            moderated: ex,
            pending: ev,
            published: eh
        },
        tG = new Date(0).toISOString(),
        t_ = function(e) {
            var t, n, i, a, s, r, o;
            let l = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                u = null != (t = e.id) ? t : void 0,
                d = null != (n = e.feedItemId) ? n : void 0,
                c = l ? d : u;
            if (null == c || "" === c) return null;
            let m = null != (i = null == (s = e.type) ? void 0 : s.toLowerCase()) ? i : "";
            if ("draft" === m || m.includes("draft")) return null;
            let p = e.captionedAssetMoment,
                h = null == (o = e.primaryCta) || null == (r = o.experienceCta) ? void 0 : r.experienceId,
                v = (e => {
                    if (null != e && "" !== e) return tU.StringLocaleMap.get(e.toLowerCase())
                })(null == p ? void 0 : p.videoContentLanguage);
            return {
                momentId: u,
                feedItemId: d,
                assetId: null == p ? void 0 : p.assetId,
                description: null != (a = null == p ? void 0 : p.caption) ? a : "",
                experienceName: "",
                modifiedAt: tG,
                status: (e => {
                    if (!e) return eh;
                    let t = tq[e.toLowerCase()];
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
        tH = function(e) {
            var t;
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return (null != (t = e.items) ? t : []).map(e => t_(e, n)).filter(e => null != e)
        },
        tK = async (e, t) => tT.momentsGetUsersMoments({
            targetUserId: e,
            paginationContext: null == t ? void 0 : t.paginationContext,
            count: 25
        }), tW = async e => {
            let t = [...new Set(e.map(e => e.universeId).filter(e => null != e && e > 0))];
            if (0 === t.length) return e;
            try {
                tD(tM.EnrichExperienceNames, {
                    universeIdCount: t.length
                });
                let {
                    data: n = []
                } = await tC.default.getUniversesDetails(t), i = new Map(n.filter(e => null != e.id && "string" == typeof e.name && e.name.length > 0).map(e => [e.id, e.name])), a = e.map(e => {
                    var t;
                    let n = null != e.universeId && null != (t = i.get(e.universeId)) ? t : "";
                    return n === e.experienceName ? e : {
                        ...e,
                        experienceName: n
                    }
                });
                return tO(tM.EnrichExperienceNames, {
                    universeIdCount: t.length
                }), a
            } catch (n) {
                return tL(tM.EnrichExperienceNames, n, {
                    universeIdCount: t.length
                }), e
            }
        }, tQ = async function(e, t) {
            var n, i;
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                s = (null == t ? void 0 : t.paginationContext) != null ? tM.FetchNextPage : tM.ListMoments;
            tD(s, {
                userId: e
            });
            let r = await tK(e, t),
                o = tH(r, a),
                l = await tW(o);
            return tO(s, {
                userId: e,
                pageCount: null != (n = null == t ? void 0 : t.pageNumber) ? n : 1,
                momentCount: l.length
            }), {
                moments: l,
                paginationContext: null != (i = r.paginationContext) ? i : void 0
            }
        }, tY = async e => {
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
    async function tJ(e) {
        let {
            feedItemId: t,
            momentId: n,
            useFeedItemId: i = !1
        } = e;
        if (i) {
            if (null == t || "" === t) throw Error("Moment feed item id is required before deleting");
            await tT.momentsDeleteMomentByFeedItem({
                feedItemId: t
            });
            return
        }
        if (null == n || "" === n) throw Error("Moment id is required before deleting");
        await tT.momentsDeleteMoment({
            momentId: n
        })
    }
    async function tX(e) {
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
    async function tZ(e) {
        var t;
        let {
            moment: n,
            file: i,
            displayName: a,
            uiLocale: s,
            sendVideoContentLanguage: r = !0
        } = e;
        if (!n.experienceId) throw Error("Moment experience is required before publishing");
        let o = await tX(i),
            l = {
                metadata: {
                    captureType: "Video",
                    description: n.description,
                    universeId: n.experienceId,
                    placeId: n.rootPlaceId,
                    assetTotalDuration: o,
                    edits: {}
                },
                feedRegistrationInfo: {
                    contentType: "moment",
                    duration: o,
                    attributes: [],
                    customTags: []
                }
            },
            u = (await tT.contentCapturesCreateInfluencerMomentFromVideo({
                files: [i],
                name: a,
                description: n.description,
                universeId: n.experienceId,
                momentPublishData: JSON.stringify(l),
                ...r ? {
                    videoContentLanguage: (null != (t = n.locale) ? t : tV(s)).toLowerCase()
                } : {}
            })).operationId;
        if (null == u || "" === u) throw Error("Publish operation id is missing from the response");
        return {
            operationId: u
        }
    }
    let t$ = () => {
            let {
                ready: e,
                value: t
            } = (0, d.useFlag)(T.isMomentsFeedIdEnabled);
            return e && null != t && t
        },
        t0 = () => {
            let {
                ready: e,
                value: t
            } = (0, d.useFlag)(T.isMomentsUploadLanguageSelectEnabled);
            return e && null != t && t
        },
        t1 = e => {
            var t, n;
            return e.status === ef ? e.draftId : null != (t = null != (n = e.feedItemId) ? n : e.momentId) ? t : ""
        },
        t2 = e => ["momentsCreations", e],
        t4 = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return [...t2(e), t]
        },
        t5 = () => {
            let e, [{
                    momentStatus: t
                }, n] = (0, ee.useQueryParams)(["momentStatus"]),
                i = (0, e_.useQueryClient)(),
                {
                    user: a
                } = (0, F.useAuthentication)();
            return {
                statusTab: "string" == typeof(e = null == t ? void 0 : Array.isArray(t) ? t[0] : t) && eg.some(t => t === e) ? e : ef,
                setStatusTab: (0, u.useCallback)(e => {
                    n({
                        momentStatus: e
                    }), e === eh && i.invalidateQueries({
                        queryKey: t2(null == a ? void 0 : a.id)
                    })
                }, [i, n, null == a ? void 0 : a.id])
            }
        },
        t7 = async (e, t, n, i) => {
            let a = {
                draftId: t,
                fileSize: n.size,
                fileType: n.type
            };
            tD(tM.PersistLocalVideo, a);
            try {
                let s, r, {
                    evictedMediaDraftIds: o
                } = await eP(e, t, n, (s = eF(window.localStorage.getItem(em(e))), r = new Set(i.map(e => e.draftId)), [...i, ...s.filter(e => !r.has(e.draftId))]));
                return tO(tM.PersistLocalVideo, a), {
                    hasLocalVideo: !0,
                    storageEvictedMediaDraftIds: o
                }
            } catch (e) {
                return tL(tM.PersistLocalVideo, e, {
                    draftId: t,
                    fileSize: n.size,
                    fileType: n.type
                }), {
                    hasLocalVideo: !1,
                    storageEvictedMediaDraftIds: []
                }
            }
        };
    var t3 = e.i(137785);
    let t8 = (0, s.withTranslation)(e => {
        let {
            experience: t,
            hideTitle: n = !1,
            onChangeExperience: a
        } = e, {
            translate: r
        } = (0, s.useTranslation)();
        return (0, i.jsxs)("div", {
            className: "flex flex-col gap-y-xsmall width-full",
            children: [n ? null : (0, i.jsxs)("div", {
                className: "flex flex-row items-center justify-between",
                children: [(0, i.jsx)("span", {
                    className: "text-body-small content-muted",
                    children: r("CreateMomentModal.Preview.Title")
                }), a && (0, i.jsx)(eo.Button, {
                    variant: "Link",
                    size: "Small",
                    onClick: a,
                    children: r("Action.EEChange")
                })]
            }), (0, i.jsx)("div", {
                className: "padding-medium radius-medium bg-surface-200 width-full",
                children: (0, i.jsx)(t3.default, {
                    disableLink: !0,
                    target: t,
                    targetType: "Experience",
                    variant: "medium"
                })
            })]
        })
    }, [B.TranslationNamespace.Creations]);
    var t9 = e.i(522163),
        t6 = e.i(392782);
    let ne = "UniverseId",
        nt = "PlaceId",
        nn = /(?:https?:\/\/)?create\.roblox\.com\/dashboard\/creations\/experiences\/(\d+)/,
        ni = /(?:https?:\/\/)?(?:www\.)?roblox\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
        na = /^\d+$/,
        ns = [{
            regex: /(?:https?:\/\/)?create\.sitetest\d\.robloxlabs\.com\/dashboard\/creations\/experiences\/(\d+)/,
            idType: ne
        }, {
            regex: /(?:https?:\/\/)?(?:www\.)?sitetest\d\.robloxlabs\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
            idType: nt
        }],
        nr = (0, s.withTranslation)(e => {
            let {
                onExperienceResolved: t,
                isDisabled: n = !1
            } = e, {
                translate: a
            } = (0, s.useTranslation)(), {
                ready: r,
                value: o
            } = (0, d.useFlag)(T.isMomentsSitetestUrlParsingEnabled), [l, c] = (0, u.useState)(""), [m, p] = (0, u.useState)(!1), [h, v] = (0, u.useState)(), f = (0, u.useMemo)(() => [{
                regex: nn,
                idType: ne
            }, {
                regex: ni,
                idType: nt
            }, ...r && null != o && o ? ns : [], {
                regex: na,
                idType: ne
            }], [o, r]), x = (0, u.useMemo)(() => l.trim().length > 0 && f.some(e => {
                let {
                    regex: t
                } = e;
                return t.test(l.trim())
            }), [f, l]), g = (0, u.useCallback)(async () => {
                var e, n, i, s, r, o;
                let u = l.trim(),
                    d = f.find(e => {
                        let {
                            regex: t
                        } = e;
                        return t.test(u)
                    });
                if (!d) return;
                let m = d.idType === ne && na.test(u) ? Number(u) : Number(null == (e = d.regex.exec(u)) ? void 0 : e[1]);
                if (!m || !Number.isFinite(m)) return;
                let h = {
                    inputValue: u,
                    idType: d.idType,
                    matchedId: m
                };
                p(!0), v(void 0), tD(tM.ResolveExperience, h);
                try {
                    let e;
                    if (d.idType === nt) {
                        let t = null == (o = (await t6.default.multigetPlaceDetails([m]))[0]) ? void 0 : o.universeId;
                        if (!t) {
                            tL(tM.ResolveExperience, "Experience not found", {
                                ...h,
                                placeId: m,
                                reason: "ExperienceNotFound"
                            }), v(a("Error.ExperienceNotFound")), p(!1);
                            return
                        }
                        e = t
                    } else e = m;
                    let l = null == (r = (await t6.default.getDetails([e])).data) ? void 0 : r[0];
                    if (!(null == l ? void 0 : l.id)) {
                        tL(tM.ResolveExperience, "Experience not found", {
                            ...h,
                            experienceId: e,
                            reason: "ExperienceNotFound"
                        }), v(a("Error.ExperienceNotFound")), p(!1);
                        return
                    }
                    t({
                        id: l.id,
                        name: null != (n = l.name) ? n : void 0,
                        description: null != (i = l.description) ? i : void 0,
                        rootPlaceId: null != (s = l.rootPlaceId) ? s : void 0
                    }), tO(tM.ResolveExperience, {
                        ...h,
                        experienceId: l.id,
                        placeId: d.idType === nt ? m : void 0
                    }), c("")
                } catch (e) {
                    tL(tM.ResolveExperience, e, {
                        ...h,
                        placeId: d.idType === nt ? m : void 0,
                        experienceId: d.idType === ne ? m : void 0
                    }), v(a("Error.ExperienceNotFound"))
                } finally {
                    p(!1)
                }
            }, [t, f, a, l]), b = (0, u.useCallback)(e => {
                "Enter" === e.key && x && (g(), e.preventDefault())
            }, [x, g]);
            return (0, i.jsxs)("div", {
                className: "flex flex-row gap-x-medium items-end width-full",
                children: [(0, i.jsx)("div", {
                    className: "grow-1 min-width-0",
                    children: (0, i.jsx)(t9.TextInput, {
                        label: a("CreateMomentModal.ExperienceInput.Label"),
                        placeholder: a("CreateMomentModal.ExperienceInput.Placeholder"),
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
                }), (0, i.jsx)(eo.Button, {
                    variant: "Emphasis",
                    size: "Medium",
                    className: h ? "margin-bottom-[22px]" : void 0,
                    isDisabled: !x || m,
                    isLoading: m,
                    onClick: () => {
                        g()
                    },
                    children: a("Action.Add")
                })]
            })
        }, [B.TranslationNamespace.Creations, B.TranslationNamespace.Controls]);
    var no = e.i(340206),
        nl = e.i(110273);
    let nu = (0, s.withTranslation)(e => {
        let {
            value: t,
            onChange: n,
            isDisabled: a = !1
        } = e, {
            translate: r
        } = (0, s.useTranslation)(), o = r("CreateMomentModal.LanguageInput.Label"), l = r("CreateMomentModal.LanguageInput.Placeholder"), d = (0, u.useCallback)(e => {
            tz.has(e) && n(e)
        }, [n]);
        return (0, i.jsx)("div", {
            className: "width-full",
            "data-testid": "moments-language-select",
            children: (0, i.jsx)(no.Dropdown, {
                className: "width-full [&_.content-system-alert]:text-caption-medium",
                size: "Medium",
                label: o,
                ariaLabel: o,
                placeholder: l,
                value: t,
                isDisabled: a,
                onValueChange: d,
                children: (0, i.jsx)(nl.Menu, {
                    children: (0, i.jsx)(nl.MenuSection, {
                        children: tB.map(e => (0, i.jsx)(nl.MenuItem, {
                            value: e,
                            title: (0, s.toLocaleNativeName)(e),
                            trailing: t === e && (0, i.jsx)(L.Icon, {
                                name: "icon-filled-check",
                                size: "Medium"
                            })
                        }, e))
                    })
                })
            })
        })
    }, [B.TranslationNamespace.Creations]);
    var nd = e.i(660882),
        nc = e.i(321211);
    let nm = ["mp4", "mov"],
        np = ["video/mp4", "video/quicktime"];
    var nh = ((n = {}).FileTooBig = "FileTooBig", n.FileWrongType = "FileWrongType", n.DurationExceeded = "DurationExceeded", n.ResolutionExceeded = "ResolutionExceeded", n.MetadataUnavailable = "MetadataUnavailable", n);
    let nv = e => {
            var t, n;
            let i;
            return e.size > 0xf0000000 ? "FileTooBig" : null != (i = null == (n = (t = e).name.split(".").pop()) ? void 0 : n.toLowerCase()) && nm.some(e => e === i) && ("" === t.type || np.includes(t.type)) ? null : "FileWrongType"
        },
        nf = async e => {
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
        }, nx = async e => {
            let t = [],
                n = [];
            for (let i of e) {
                let e = nv(i);
                if (null != e) {
                    n.push({
                        file: i,
                        reason: e
                    });
                    continue
                }
                let a = await nf(i);
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
        }, ng = nm.map(e => e.toUpperCase()).join("/"), nb = (0, s.withTranslation)(e => {
            let {
                hasSelectedExperience: t,
                hasSelectedLanguage: n,
                selectedFiles: a,
                isUploading: r = !1,
                onFilesChange: o,
                onValidationErrorsChange: l
            } = e, {
                translate: d
            } = (0, s.useTranslation)(), [c, m] = (0, u.useState)(!1), p = d("CreateMomentModal.DropTarget.UploadButton"), h = d("CreateMomentModal.DropTarget.NoExperienceAddedText"), v = d("CreateMomentModal.DropTarget.ExperienceAddedText"), [f, x] = (0, u.useState)(!1), g = t && n, b = t ? v : h, y = (0, u.useRef)(o), I = (0, u.useRef)(l), T = (0, u.useRef)(d);
            y.current = o, I.current = l, T.current = d;
            let C = (0, u.useCallback)(async e => {
                    var t, n, i, a;
                    if (x(!1), !g || r || c) return;
                    let s = Array.from(null != e ? e : []);
                    if (0 !== s.length) {
                        null == (t = I.current) || t.call(I, []), m(!0);
                        try {
                            let {
                                validFiles: e,
                                errors: t
                            } = await nx(s);
                            if (t.length > 0) {
                                for (let {
                                        file: e,
                                        reason: n
                                    }
                                    of t) tL(tM.ValidateVideo, n, {
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
                                        case nh.FileTooBig:
                                            return e("CreateMomentModal.Error.FileTooBig", {
                                                maxFileSizeGB: String(3.75)
                                            });
                                        case nh.FileWrongType:
                                            return e("CreateMomentModal.Error.FileWrongType", {
                                                formats: ng
                                            });
                                        case nh.DurationExceeded:
                                            return e("CreateMomentModal.Error.DurationExceeded", {
                                                maxDurationMinutes: String(5)
                                            });
                                        case nh.ResolutionExceeded:
                                            return e("CreateMomentModal.Error.ResolutionExceeded", {
                                                maxWidth: String(4096),
                                                maxHeight: String(2160)
                                            });
                                        case nh.MetadataUnavailable:
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
                }, [g, r, c]),
                w = (0, u.useCallback)(() => {
                    !g || r || c || x(!0)
                }, [g, r, c]),
                S = (0, u.useCallback)(() => {
                    x(!1)
                }, []),
                A = !g || r || c;
            return (0, i.jsx)("div", {
                className: "flex flex-col gap-y-small width-full",
                children: (0, i.jsx)(nc.default, {
                    accept: "video/mp4,video/quicktime,.mp4,.mov",
                    multiple: !0,
                    size: 0xf0000000,
                    onChange: C,
                    onDragActiveHandler: w,
                    onDragLeaveHandler: S,
                    className: "width-full",
                    children: (e, t, n, s, o) => (0, i.jsxs)("div", {
                        role: "presentation",
                        onKeyDown: t,
                        onDrop: n,
                        onDragOver: s,
                        onDragLeave: o,
                        className: "flex flex-col items-center justify-center gap-y-small padding-xlarge radius-medium stroke-standard width-full min-height-250 ".concat(f ? "bg-shift-200" : "bg-surface-100"),
                        children: [(0, i.jsx)(eo.Button, {
                            variant: "Standard",
                            size: "Medium",
                            type: "button",
                            icon: r || c ? void 0 : "icon-regular-arrow-up-from-line",
                            isDisabled: A,
                            onClick: e,
                            children: r || c ? (0, i.jsxs)("span", {
                                className: "inline-flex items-center gap-xsmall",
                                children: [(0, i.jsx)(nd.ProgressCircle, {
                                    ariaLabel: p,
                                    size: "Small",
                                    variant: "Indeterminate"
                                }), p]
                            }) : p
                        }), (0, i.jsx)("span", {
                            className: "text-body-small content-muted text-align-x-center",
                            children: b
                        }), a.map(e => (0, i.jsx)("span", {
                            className: "text-body-small content-muted text-align-x-center",
                            children: e.name
                        }, "".concat(e.name, "-").concat(e.lastModified)))]
                    })
                })
            })
        }, [B.TranslationNamespace.Creations]), ny = (0, s.withTranslation)(e => {
            let {
                open: t,
                onOpenChange: n,
                onMomentUploaded: a
            } = e, {
                addMoments: r
            } = eG(), {
                setStatusTab: o
            } = t5(), l = t0(), {
                translate: d
            } = (0, s.useTranslation)(), {
                locale: c
            } = (0, s.useLocalization)(), m = tV(c), [p, h] = (0, u.useState)(), [v, f] = (0, u.useState)(), x = null != v ? v : m, [g, b] = (0, u.useState)([]), [y, I] = (0, u.useState)([]), T = (0, u.useRef)(0), {
                uploadVideos: C,
                isUploading: w
            } = (() => {
                let {
                    user: e
                } = (0, F.useAuthentication)(), [t, n] = (0, u.useState)(!1), [i, a] = (0, u.useState)(0);
                return {
                    uploadVideo: (0, u.useCallback)(async t => {
                        let {
                            experience: i,
                            locale: s,
                            file: r
                        } = t, o = null == e ? void 0 : e.id;
                        if (null == o) throw Error("Cannot upload Moments video without a signed-in user");
                        n(!0), a(0);
                        try {
                            var l;
                            let e = await tY({
                                    experienceId: i.id,
                                    experienceName: null != (l = i.name) ? l : "",
                                    rootPlaceId: i.rootPlaceId,
                                    ...null != s ? {
                                        locale: s
                                    } : {},
                                    file: r,
                                    onProgress: a
                                }),
                                {
                                    hasLocalVideo: t
                                } = await t7(o, e.draftId, r, []);
                            return {
                                ...e,
                                hasLocalVideo: t
                            }
                        } finally {
                            n(!1), a(0)
                        }
                    }, [null == e ? void 0 : e.id]),
                    uploadVideos: (0, u.useCallback)(async t => {
                        let {
                            experience: i,
                            locale: s,
                            files: r
                        } = t, o = null == e ? void 0 : e.id;
                        if (null == o) throw Error("Cannot upload Moments video without a signed-in user");
                        if (0 === r.length) return {
                            moments: [],
                            storageEvictedMediaDraftIds: []
                        };
                        n(!0), a(0);
                        try {
                            let e = [],
                                t = [];
                            for (let n of r) {
                                var l;
                                let r = await tY({
                                        experienceId: i.id,
                                        experienceName: null != (l = i.name) ? l : "",
                                        rootPlaceId: i.rootPlaceId,
                                        ...null != s ? {
                                            locale: s
                                        } : {},
                                        file: n,
                                        onProgress: a
                                    }),
                                    {
                                        hasLocalVideo: u,
                                        storageEvictedMediaDraftIds: d
                                    } = await t7(o, r.draftId, n, e);
                                t.push(...d), e.push({
                                    ...r,
                                    hasLocalVideo: u
                                })
                            }
                            return {
                                moments: e,
                                storageEvictedMediaDraftIds: [...new Set(t)]
                            }
                        } finally {
                            n(!1), a(0)
                        }
                    }, [null == e ? void 0 : e.id]),
                    isUploading: t,
                    uploadProgress: i
                }
            })(), S = (0, u.useCallback)(() => {
                h(void 0), f(void 0), b([]), I([])
            }, []), A = (0, u.useCallback)(() => {
                n(!1), S()
            }, [n, S]), M = (0, u.useCallback)(e => {
                h(e)
            }, []), j = (0, u.useCallback)(e => {
                f(e)
            }, []), E = (0, u.useCallback)(() => {
                T.current += 1, b([]), I([]), h(void 0)
            }, []), P = (0, u.useCallback)(e => {
                !w && (n(e), e || S())
            }, [w, n, S]), k = (0, u.useCallback)(e => {
                I(e)
            }, []), L = (0, u.useCallback)(() => {
                I([])
            }, []), N = (0, u.useCallback)(async e => {
                var t, n, i;
                if (0 === e.length || (null == p ? void 0 : p.id) == null || l && null == x || w) return void b(e);
                let s = T.current + 1;
                T.current = s, b(e), tD(tM.UploadVideo, {
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
                    if (T.current !== s) return;
                    a ? t.forEach(e => {
                        a(e)
                    }) : r(t, {
                        storageEvictedMediaDraftIds: i
                    }), tO(tM.UploadVideo, {
                        experienceId: p.id,
                        fileCount: t.length,
                        persistedVideoCount: t.filter(e => e.hasLocalVideo).length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (n = e[0]) ? void 0 : n.type,
                        ...l ? {
                            locale: x
                        } : {}
                    }), o(ef), A()
                } catch (t) {
                    if (T.current !== s) return;
                    tL(tM.UploadVideo, t, {
                        experienceId: p.id,
                        fileCount: e.length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (i = e[0]) ? void 0 : i.type,
                        ...l ? {
                            locale: x
                        } : {}
                    }), b([])
                }
            }, [r, A, l, w, a, p, x, o, C]), R = d("CreateMomentModal.Title"), D = y[0], O = y.length > 1 ? y.slice(1).join(" ") : void 0;
            return (0, i.jsx)(el.Dialog, {
                open: t,
                onOpenChange: P,
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: d("Action.Close"),
                children: (0, i.jsx)(el.DialogContent, {
                    className: "flex flex-col min-width-0 width-[min(720px,95vw)] !max-width-[min(720px,95vw)]",
                    children: (0, i.jsxs)(el.DialogBody, {
                        className: "flex flex-col gap-y-medium",
                        children: [(0, i.jsx)(el.DialogTitle, {
                            className: "text-heading-small content-emphasis margin-none",
                            children: R
                        }), null != D ? (0, i.jsx)("div", {
                            className: "width-full margin-top-small padding-bottom-small",
                            children: (0, i.jsx)(eu.FeedbackBanner, {
                                className: "width-full",
                                layout: "Stacked",
                                variant: "Standard",
                                severity: "Error",
                                title: D,
                                description: O,
                                onDismiss: L,
                                dismissIconAriaLabel: d("Action.Close"),
                                "data-testid": "moments-video-validation-error-banner"
                            })
                        }) : null, p ? (0, i.jsx)(t8, {
                            experience: p,
                            onChangeExperience: E
                        }) : (0, i.jsx)(nr, {
                            onExperienceResolved: M,
                            isDisabled: w
                        }), l ? (0, i.jsx)(nu, {
                            value: x,
                            onChange: j,
                            isDisabled: w
                        }) : null, (0, i.jsx)(nb, {
                            hasSelectedExperience: (null == p ? void 0 : p.id) != null,
                            hasSelectedLanguage: !l || null != x,
                            selectedFiles: g,
                            isUploading: w,
                            onFilesChange: N,
                            onValidationErrorsChange: k
                        })]
                    })
                })
            })
        }, [B.TranslationNamespace.Creations, B.TranslationNamespace.Controls]);

    function nI() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        (0, ed.openDialog)({
            component: ny,
            props: e,
            options: {
                mode: "standalone"
            }
        })
    }
    let nT = () => nI(),
        nC = () => {
            let {
                translate: e
            } = (0, s.useTranslation)();
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(eo.Button, {
                    variant: "Emphasis",
                    size: "Large",
                    type: "button",
                    onClick: nT,
                    children: e("Action.CreateMoments")
                })
            })
        };
    var nw = e.i(523586);
    let nS = e => {
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
                children: eg.map(e => (0, i.jsx)(nw.Chip, {
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
        nA = () => {
            let {
                translate: e
            } = (0, s.useTranslation)(), {
                statusTab: t,
                setStatusTab: n
            } = t5(), a = (0, u.useMemo)(() => ({
                [eh]: e("MomentsTable.Pills.Active"),
                [ef]: e("MomentsTable.Pills.Draft")
            }), [e]);
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(nS, {
                    groupLabel: e("MomentsTable.Header.Status"),
                    labels: a,
                    selected: t,
                    onChange: n
                })
            })
        };
    var nM = e.i(253536);
    let nj = e => {
        var t, n, a;
        let {
            data: r
        } = e, {
            translate: o
        } = (0, s.useTranslation)(), l = (null == r || null == (n = r.creationAccessMetadata) ? void 0 : n.accessAllowed) === !1;
        if (!l) return null;
        let u = null != (t = null == r || null == (a = r.creationAccessMetadata) ? void 0 : a.daysToUnblock) ? t : 0,
            d = l && -1 === u;
        return (0, i.jsx)(en.default, {
            alertTitle: d ? o("Heading.PermanentlyCreationBanned") : o("Heading.TemporaryCreationBanned", {
                days: u.toString()
            }),
            alertDescription: o(d ? "Description.PermanentlyCreationBanned" : "Description.TemporaryCreationBanned"),
            severity: "warning",
            externalLink: nM.MARKETPLACE_POLICY,
            linkLabel: o("Label.MarketplacePolicy"),
            allowCloseDialog: !1
        })
    };
    var nE = e.i(770009),
        nP = e.i(988012),
        nk = e.i(93235),
        nL = e.i(27281),
        nN = e.i(706442),
        nR = e.i(756568),
        nD = e.i(849087),
        nO = e.i(665357),
        nU = e.i(131385),
        nB = e.i(643093);
    let nz = (0, nN.makeStyles)()({
            chipRow: {
                display: "flex",
                flexWrap: "wrap",
                alignItems: "center",
                gap: 8,
                border: "none",
                margin: 0,
                padding: 0,
                minInlineSize: "auto"
            }
        }),
        nV = () => {
            var e;
            let {
                classes: {
                    chipRow: t
                }
            } = nz(), {
                translate: n
            } = (0, s.useTranslation)(), a = (0, nO.default)(), r = null != (e = (0, nD.default)()) && e, [{
                activeTab: o
            }, l] = (0, ee.useQueryParams)(["activeTab", "filterIndex"]), {
                l1Options: d,
                activeL1Key: c
            } = (0, nU.default)(!0), m = (0, g.isAllAssetTypesActiveTab)(o), p = (0, g.isRecentsActiveTab)(o), h = (0, g.isAvatarLooksActiveTab)(o), v = (0, u.useCallback)(e => {
                e && l({
                    activeTab: (0, g.buildTaxonomyActiveTab)(e),
                    filterIndex: 0
                })
            }, [l]), f = (0, u.useCallback)(() => {
                l({
                    activeTab: (0, g.buildTaxonomyActiveTab)(g.ALL_ASSET_TYPES_L1_KEY),
                    filterIndex: 0
                })
            }, [l]), x = (0, u.useCallback)(() => {
                l({
                    activeTab: (0, g.buildTaxonomyActiveTab)(g.RECENTS_L1_KEY),
                    filterIndex: 0
                })
            }, [l]), b = (0, u.useCallback)(() => {
                l({
                    activeTab: (0, g.buildTaxonomyActiveTab)(g.AVATAR_LOOKS_L1_KEY),
                    filterIndex: 0
                })
            }, [l]), y = n("Label.Categories"), I = n("Label.Recents");
            return 0 !== d.length || p || m ? (0, i.jsxs)("fieldset", {
                className: t,
                "aria-label": y,
                children: [r && (0, i.jsx)(nw.Chip, {
                    text: n("Label.Avatars"),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: h,
                    onCheckedChange: b
                }), d.map(e => {
                    var t;
                    return (0, i.jsx)(nw.Chip, {
                        text: (0, nB.taxonomyOptionLabel)(e, n),
                        size: "Medium",
                        variant: "Standard",
                        isChecked: e.taxonomyKey === c,
                        onCheckedChange: () => v(e.taxonomyKey)
                    }, null != (t = e.taxonomyKey) ? t : e.nameKey)
                }), (0, i.jsx)(nw.Chip, {
                    text: I,
                    size: "Medium",
                    variant: "Standard",
                    isChecked: p,
                    onCheckedChange: x
                }), a && (0, i.jsx)(nw.Chip, {
                    text: n("Label.AllAssetTypes"),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: m,
                    onCheckedChange: f
                })]
            }) : null
        };
    var nF = e.i(638016),
        nq = e.i(157310),
        nG = e.i(100226);
    let n_ = (e, t) => {
            let {
                settings: n
            } = (0, x.useSettings)(), i = C(), a = (0, nO.default)(), s = (0, nD.default)(), r = (0, nG.default)(), {
                data: o
            } = (0, nq.useQuery)({
                queryKey: ["avatar-items-entry-point-asset-types"],
                queryFn: y.getAvatarItemsEntryPointAssetTypes,
                staleTime: 3e5
            });
            return (0, u.useMemo)(() => {
                var l, u;
                return null != (l = null == (u = e.menuItem.submenuItems) ? void 0 : u.filter(l => I.default.isMenuItemEnabled(l, n, t, "Label.AvatarItems" === e.menuItem.nameKey ? null == o ? void 0 : o.has(l.type) : void 0, o, i, a, s, r))) ? l : []
            }, [e.menuItem.submenuItems, e.menuItem.nameKey, n, t, o, i, a, s, r])
        },
        nH = (0, nN.makeStyles)()(e => ({
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
        nK = e => {
            var t;
            let {
                menuState: n,
                onMenuStateChange: a,
                group: r
            } = e, {
                classes: {
                    subMenuContainer: o,
                    subMenu: l,
                    backButton: d,
                    nextButton: c,
                    chip: p
                },
                cx: h
            } = nH(), v = (0, u.useRef)(null), {
                translate: f
            } = (0, s.useTranslation)(), [x, b] = (0, u.useState)(0), [y, T] = (0, u.useState)(0), [C, w] = (0, u.useState)(0), {
                isTaxonomyMode: S,
                canUseTaxonomy: A
            } = (0, nF.default)(I.default.getAssetType(n)), [{
                activeTab: M
            }, j] = (0, ee.useQueryParams)(["activeTab", "filterIndex"]), E = f("Label.Recents"), P = (0, g.isRecentsActiveTab)(M), k = (0, u.useCallback)(() => {
                j({
                    activeTab: (0, g.buildRecentsActiveTab)(S),
                    filterIndex: 0
                })
            }, [S, j]), L = (0, i.jsx)(nE.Chip, {
                classes: {
                    root: p
                },
                color: P ? "primary" : "secondary",
                onClick: P ? void 0 : k,
                label: E,
                clickable: !0,
                tabIndex: 0,
                "aria-selected": P,
                role: "tab"
            }, "recents"), N = n_(n, r), R = A && null != (t = null == N ? void 0 : N.some(e => e.type === m.Asset.AllCatalogAsset)) && t, D = (0, u.useMemo)(() => x <= 0, [x]), O = (0, u.useMemo)(() => x + C >= y, [x, y, C]), U = () => {
                var e, t, n;
                let i = null == v ? void 0 : v.current;
                b(null != (e = null == i ? void 0 : i.scrollLeft) ? e : 0), T(null != (t = null == i ? void 0 : i.scrollWidth) ? t : 0), w(null != (n = null == i ? void 0 : i.offsetWidth) ? n : 0)
            };
            return ((0, u.useEffect)(() => {
                let e = null == v ? void 0 : v.current,
                    t = new ResizeObserver(U);
                return e && (e.addEventListener("scroll", U), t.observe(e)), () => {
                    e && (e.removeEventListener("scroll", U), t.unobserve(e))
                }
            }, []), S) ? (0, i.jsx)(nV, {}) : (0, i.jsxs)(nR.Flex, {
                classes: {
                    root: o
                },
                children: [!D && (0, i.jsx)("div", {
                    className: d,
                    children: (0, i.jsx)(nP.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = v.current) || e.scrollBy({
                                left: -C,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "back",
                        children: (0, i.jsx)(nk.NavigateBeforeIcon, {
                            fontSize: "small"
                        })
                    })
                }), (0, i.jsxs)("div", {
                    ref: v,
                    className: h(l, "flex max-medium:wrap max-medium:gap-y-small"),
                    children: [null == N ? void 0 : N.flatMap(e => {
                        let t = !P && n.submenuItem === e,
                            s = (0, i.jsx)(nE.Chip, {
                                classes: {
                                    root: p
                                },
                                color: t ? "primary" : "secondary",
                                onClick: t ? void 0 : () => {
                                    a({
                                        menuItem: n.menuItem,
                                        submenuItem: e
                                    })
                                },
                                label: f(e.nameKey),
                                clickable: !0,
                                tabIndex: 0,
                                "aria-selected": t,
                                role: "tab"
                            }, e.type);
                        return R && e.type === m.Asset.AllCatalogAsset ? [L, s] : [s]
                    }), A && !R && L]
                }), !O && (0, i.jsx)("div", {
                    className: c,
                    children: (0, i.jsx)(nP.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = v.current) || e.scrollBy({
                                left: C,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "next",
                        children: (0, i.jsx)(nL.NavigateNextIcon, {
                            fontSize: "small"
                        })
                    })
                })]
            })
        };
    var nW = e.i(54842),
        nQ = e.i(774807),
        nY = e.i(558826),
        nJ = e.i(872204),
        nX = e.i(39128),
        nZ = e.i(54369),
        n$ = e.i(220552),
        n0 = e.i(573672),
        n1 = e.i(310634),
        n2 = e.i(556030),
        n4 = e.i(517379),
        n5 = e.i(199834),
        n7 = e.i(239328),
        n3 = e.i(776344),
        n8 = e.i(823062),
        n9 = e.i(198528),
        n6 = e.i(949599),
        ie = e.i(704443),
        it = e.i(696564),
        ii = e.i(418162);
    let ia = (0, nN.makeStyles)()(e => ({
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
    var is = e.i(291037),
        ir = e.i(777004),
        io = e.i(899819),
        il = e.i(447055),
        iu = e.i(242788),
        id = e.i(854705),
        ic = e.i(235684),
        im = e.i(210598),
        ip = e.i(904090),
        ih = e.i(196945),
        iv = e.i(913893),
        ix = e.i(185915);

    function ig(e) {
        if (void 0 === e.id || void 0 === e.autoPublishEnabled) throw Error("Publishing preferences response was malformed");
        return e
    }
    async function ib(e) {
        return ig(await iv.default.getPublishingPreferences(e))
    }
    async function iy(e) {
        return ig(await iv.default.createPublishingPreferences(e))
    }
    var iI = e.i(812141);
    let iT = e => {
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
            }), (0, i.jsx)(nX.Divider, {})]
        })
    };

    function iC(e) {
        return 4 === e || 2 === e
    }

    function iw(e, t, n) {
        return e && t && "all" === n ? 1 : e && t && "specific" === n ? 4 : e && !t ? 3 : !e && t ? 2 : 0
    }
    let iS = e => {
        var t;
        let {
            open: n,
            onClose: a
        } = e, {
            translate: r
        } = (0, s.useTranslation)(), {
            enqueue: o
        } = (0, ih.useSnackbar)(), {
            user: l
        } = (0, F.useAuthentication)(), d = (0, f.useCurrentGroup)(), c = null == d ? void 0 : d.id, {
            data: m
        } = (0, iI.default)(iv.default), p = null != (t = null == m ? void 0 : m.maxCollectiblePrice) ? t : it.DefaultMaxCollectiblePrice, [h, v] = (0, u.useState)(!0), [x, g] = (0, u.useState)(!1), [b, y] = (0, u.useState)(!1), [I, T] = (0, u.useState)(""), [C, w] = (0, u.useState)(""), [S, A] = (0, u.useState)(!0), [M, j] = (0, u.useState)(!0), [E, P] = (0, u.useState)(!0), [k, L] = (0, u.useState)("all"), [N, R] = (0, u.useState)(""), [D, O] = (0, u.useState)(!1);
        (0, u.useEffect)(() => {
            n && ib(c).then(e => {
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
                j(t.sellInMarketplace), P(t.sellInExperiences), L(t.experienceLocationMode), e.places.length > 0 && R(e.places.join(","))
            }).catch(e => {
                var t;
                (null == (t = (0, ix.default)(e)) ? void 0 : t.status) !== 404 && (O(!0), o({
                    message: r("Message.ErrorProcessingRequest"),
                    autoHide: !0,
                    autoHideDuration: 3e3,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "left"
                    }
                }))
            }).finally(() => v(!1))
        }, [n, c, o, r]);
        let U = (0, u.useCallback)(async () => {
                if (null == l ? void 0 : l.id) {
                    g(!0);
                    try {
                        let e = iw(M, E, k),
                            t = iC(e) ? N.split(",").filter(Boolean).map(e => Number(e)) : [];
                        await iy({
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
                        }), o({
                            message: r("Message.PublishingDefaultsSaved"),
                            autoHide: !0,
                            autoHideDuration: 3e3,
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "left"
                            }
                        }), a()
                    } catch (t) {
                        let e = await (0, tw.default)(t);
                        o({
                            message: r((null == e ? void 0 : e.code) === 9 ? "Message.UserMissingGroupPermissions" : "Message.PublishingUnsuccessful"),
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
            }, [l, c, M, E, k, N, C, I, S, b, o, a, r]),
            B = (0, u.useCallback)(() => {
                U()
            }, [U]),
            z = (0, u.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && T(t)
            }, [p]),
            V = (0, u.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && w(t)
            }, [p]),
            q = (0, u.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9,]/g, "").replaceAll(/,{2,}/g, ",").replace(/^,/, "").split(",").map(e => e.replace(/^0+(\d)/, "$1")).filter(e => "0" !== e).join(","),
                    n = t.split(",").filter(Boolean);
                if (!(n.length > 5)) {
                    if (5 === n.length && t.endsWith(",")) return void R(t.slice(0, -1));
                    R(t)
                }
            }, []),
            G = h || x || D || !M && !E || "" === I || "" === C || 0 >= Number(C) || iC(iw(M, E, k)) && 0 === N.split(",").filter(Boolean).length;
        return (0, i.jsxs)(is.Dialog, {
            open: n,
            onClose: a,
            maxWidth: "Medium",
            color: "primaryBrand",
            PaperProps: {
                className: "[width:580px]"
            },
            children: [(0, i.jsx)(io.DialogTitle, {
                className: "padding-bottom-none",
                children: (0, i.jsxs)("div", {
                    className: "flex justify-between items-start",
                    children: [(0, i.jsx)("span", {
                        className: "text-heading-small",
                        children: r("Heading.StudioPublishSettings")
                    }), (0, i.jsx)(nP.IconButton, {
                        "aria-label": "Close",
                        onClick: a,
                        size: "small",
                        color: "inherit",
                        children: (0, i.jsx)(il.CloseIcon, {})
                    })]
                })
            }), (0, i.jsxs)(ir.DialogContent, {
                className: "padding-top-small",
                children: [(0, i.jsx)(n5.Typography, {
                    variant: "body2",
                    className: "[opacity:0.7] padding-bottom-medium",
                    children: r("Description.StudioPublishSettingsSubtitle")
                }), (0, i.jsx)(iT, {
                    label: r("Label.Availability"),
                    children: (0, i.jsx)("span", {
                        className: "text-label-large [margin-left:12px]",
                        children: r("Label.NonLimited")
                    })
                }), (0, i.jsx)(iT, {
                    label: r("Label.TimedOption"),
                    children: (0, i.jsx)(n4.Switch, {
                        checked: b,
                        onChange: () => y(e => !e),
                        "aria-label": "Timed Option"
                    })
                }), (0, i.jsx)(iT, {
                    label: r("Label.PriceConfigurations"),
                    className: "grid [grid-template-columns:175px_1fr] padding-y-large gap-xsmall",
                    labelClassName: "padding-top-small",
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col [flex:1] gap-xsmall",
                        children: [(0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(im.TextField, {
                                id: "price-offset",
                                label: "",
                                placeholder: r("Placeholder.AmountAbovePriceFloor"),
                                variant: "outlined",
                                size: "small",
                                value: I,
                                onChange: z,
                                fullWidth: !0
                            }), (0, i.jsx)(ip.Tooltip, {
                                title: r("Tooltip.AmountAbovePriceFloor"),
                                children: (0, i.jsx)(nP.IconButton, {
                                    "aria-label": "price offset info",
                                    size: "small",
                                    children: (0, i.jsx)(iu.InfoOutlinedIcon, {})
                                })
                            })]
                        }), (0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(im.TextField, {
                                id: "price-floor-minimum",
                                label: "",
                                placeholder: r("Placeholder.DoNotPriceBelow"),
                                variant: "outlined",
                                size: "small",
                                value: C,
                                onChange: V,
                                fullWidth: !0
                            }), (0, i.jsx)(ip.Tooltip, {
                                title: r("Tooltip.MinimumPriceFloor"),
                                children: (0, i.jsx)(nP.IconButton, {
                                    "aria-label": "minimum price info",
                                    size: "small",
                                    children: (0, i.jsx)(iu.InfoOutlinedIcon, {})
                                })
                            })]
                        })]
                    })
                }), (0, i.jsx)(iT, {
                    label: r("Label.RegionalPricing"),
                    children: (0, i.jsx)(n4.Switch, {
                        checked: S,
                        onChange: () => A(e => !e),
                        "aria-label": "Regional Pricing"
                    })
                }), (0, i.jsx)(iT, {
                    label: r("Label.SellInMarketplace"),
                    children: (0, i.jsx)(n4.Switch, {
                        checked: M,
                        onChange: () => {
                            let e = !M;
                            e || L("specific"), j(e)
                        },
                        "aria-label": "Sell in Marketplace"
                    })
                }), (0, i.jsx)(iT, {
                    label: r("Label.SellInExperiences"),
                    children: (0, i.jsx)(n4.Switch, {
                        checked: E,
                        onChange: () => P(e => !e),
                        "aria-label": "Sell in experiences"
                    })
                }), E && (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(nX.Divider, {}), (0, i.jsxs)("div", {
                        className: "padding-y-large",
                        children: [(0, i.jsxs)("div", {
                            className: "grid [grid-template-columns:175px_1fr] items-center",
                            children: [(0, i.jsx)("span", {
                                className: "text-label-large",
                                children: r("Label.ExperienceLocations")
                            }), (0, i.jsxs)(ic.RadioGroup, {
                                row: !0,
                                value: k,
                                onChange: e => {
                                    let t = e.target.value;
                                    ("all" === t || "specific" === t) && L(t)
                                },
                                className: "flex flex-row no-wrap gap-xsmall [margin-left:12px]",
                                children: [(0, i.jsx)(nZ.FormControlLabel, {
                                    value: "all",
                                    disabled: !M,
                                    control: (0, i.jsx)(id.Radio, {
                                        "aria-label": r("Label.AllGames"),
                                        size: "small"
                                    }),
                                    label: r("Label.AllGames"),
                                    className: "margin-right-medium"
                                }), (0, i.jsx)(nZ.FormControlLabel, {
                                    value: "specific",
                                    control: (0, i.jsx)(id.Radio, {
                                        "aria-label": r("Label.SpecificExperiences"),
                                        size: "small"
                                    }),
                                    label: r("Label.SpecificExperiences")
                                })]
                            })]
                        }), "specific" === k && (0, i.jsxs)("div", {
                            className: "[margin-left:187px] [margin-top:10px]",
                            children: [(0, i.jsx)(im.TextField, {
                                id: "place-ids",
                                label: "",
                                placeholder: r("Placeholder.EnterExperienceIDs"),
                                variant: "outlined",
                                size: "small",
                                value: N,
                                onChange: q,
                                fullWidth: !0
                            }), (0, i.jsxs)(n5.Typography, {
                                variant: "caption",
                                className: "[opacity:0.6] block [margin-top:4px]",
                                children: [N ? N.split(",").filter(Boolean).length : 0, "/", 5, " ", r("Label.ExperiencesCount")]
                            })]
                        })]
                    })]
                })]
            }), (0, i.jsxs)("div", {
                className: "flex padding-x-large padding-y-medium gap-small",
                children: [(0, i.jsx)(nJ.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: B,
                    disabled: G,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: r("Action.Save")
                }), (0, i.jsx)(nJ.Button, {
                    variant: "contained",
                    color: "secondary",
                    onClick: a,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: r("Action.Cancel")
                })]
            })]
        })
    };
    var iA = e.i(186214),
        iM = e.i(759283);
    let ij = (e, t) => {
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
    var iE = e.i(222563),
        iP = e.i(431498);
    let ik = (0, nN.makeStyles)()(e => ({
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
        iL = ["makeup", "clothing", "accessories"],
        iN = ["clothing", "makeup"],
        iR = {
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

    function iD(e) {
        return e ? iR.clothing.all : "Label.ClothingOnlyTShirtsPantsSweaters"
    }
    let iO = (0, s.withTranslation)(e => {
        let t, {
                open: n,
                onClose: a,
                categoryFlags: r,
                assetTypesByCategory: o
            } = e,
            {
                translate: l
            } = (0, s.useTranslation)(),
            {
                classes: d,
                cx: c
            } = ik(),
            {
                enqueue: m,
                close: p
            } = (0, ih.useSnackbar)(),
            h = (0, f.useCurrentGroup)(),
            v = !1 !== r.showCategorySubtypeDropdowns,
            x = (0, u.useMemo)(() => v ? iL : iN, [v]),
            [g, b] = (0, u.useState)({
                clothing: !1,
                makeup: !1,
                accessories: !1
            }),
            [y, I] = (0, u.useState)({}),
            [T, C] = (0, u.useState)(() => ({
                clothing: !0,
                makeup: !0,
                accessories: !0
            })),
            [w, S] = (0, u.useState)(!1),
            [A, M] = (0, u.useState)(null),
            j = (0, u.useMemo)(() => o ? {
                clothing: o.clothing,
                makeup: o.makeup,
                accessories: o.accessories
            } : {
                clothing: [],
                makeup: [],
                accessories: []
            }, [o]),
            E = (0, u.useMemo)(() => ({
                clothing: r.showClothing,
                makeup: r.showMakeup,
                accessories: r.showAccessories
            }), [r.showAccessories, r.showClothing, r.showMakeup]);
        (0, u.useEffect)(() => {
            if (n) {
                let e = {};
                if (o) {
                    let {
                        clothing: t,
                        makeup: n,
                        accessories: i
                    } = o;
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
        }, [n, o]);
        let P = (0, u.useCallback)(() => {
                a()
            }, [a]),
            k = (0, u.useCallback)(() => {
                M("enable"), S(!0)
            }, []),
            L = (0, u.useCallback)(() => {
                M("disable"), S(!0)
            }, []),
            N = (0, u.useCallback)(async () => {
                if (!o || null === A) return void a();
                let e = x.flatMap(e => E[e] ? j[e].filter(e => y[e]) : []);
                try {
                    await iv.default.bulkUpdateCollectible(q.uuidService.generateRandomUuid(), null == h ? void 0 : h.id, e.map(e => (0, ii.translateAssetType)(e)), "enable" === A), m({
                        message: l("Message.TimedOptionSettingsApplied"),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: iM.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    }), window.location.reload(), a()
                } catch (e) {
                    m({
                        message: l(ij(await (0, tw.default)(e), "Error.Unknown")),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: iM.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    })
                }
            }, [o, y, A, null == h ? void 0 : h.id, m, p, a, j, E, l, x]),
            R = (0, u.useCallback)(() => {
                S(!1), M(null)
            }, []),
            D = (0, u.useMemo)(() => x.map(e => {
                if (!E[e]) return null;
                let t = j[e];
                if (0 === t.length) return null;
                let n = t.filter(e => y[e]);
                if (0 === n.length) return null;
                if (n.length === t.length) return l("clothing" === e ? iD(v) : iR[e].all);
                let i = l(iR[e].short),
                    a = n.map(e => l(iM.assetFullNameKeys[e])).join(", ");
                return "".concat(i, " (").concat(a, ")")
            }).filter(e => null !== e), [y, j, E, v, l, x]),
            O = (0, u.useMemo)(() => x.some(e => E[e] && j[e].some(e => y[e])), [y, j, E, x]),
            U = (0, i.jsxs)(i.Fragment, {
                children: [(0, i.jsx)(iA.DialogContentText, {
                    className: d.descriptionText,
                    children: l("Description.BulkUpdateAllTimedOptions")
                }), (0, i.jsx)(n3.default, {
                    flexDirection: "column",
                    classes: {
                        root: d.checkboxList
                    },
                    children: x.map(e => (e => {
                        let t = j[e];
                        if (!E[e]) return null;
                        let n = g[e],
                            a = "timed-options-bulk-".concat(e, "-subtypes"),
                            s = l("clothing" === e ? iD(v) : iR[e].all);
                        return (0, i.jsxs)(u.default.Fragment, {
                            children: [(0, i.jsxs)("div", {
                                className: d.categoryRow,
                                children: [v ? (0, i.jsx)(nP.IconButton, {
                                    type: "button",
                                    size: "small",
                                    className: d.expandToggle,
                                    onClick: () => b(t => ({
                                        ...t,
                                        [e]: !t[e]
                                    })),
                                    "aria-expanded": n,
                                    "aria-controls": a,
                                    "aria-label": l("AriaLabel.ToggleTimedOptionsCategorySubtypes", {
                                        categoryName: s
                                    }),
                                    color: "inherit",
                                    children: (0, i.jsx)(iP.ChevronRightIcon, {
                                        className: c(n ? d.expandToggleExpanded : d.expandToggleCollapsed)
                                    })
                                }) : null, (0, i.jsx)(iE.Checkbox, {
                                    label: s,
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
                                id: a,
                                className: d.subtypeIndent,
                                children: t.map(e => (0, i.jsx)(iE.Checkbox, {
                                    label: l(iM.assetFullNameKeys[e]),
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
                }), (0, i.jsxs)(n3.default, {
                    flexDirection: "row",
                    classes: {
                        root: d.buttonContainer
                    },
                    children: [(0, i.jsx)(nJ.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: k,
                        size: "medium",
                        className: d.actionButton,
                        disabled: !O,
                        children: l("Action.Enable")
                    }), (0, i.jsx)(nJ.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: L,
                        size: "medium",
                        className: d.actionButton,
                        disabled: !O,
                        children: l("Action.Disable")
                    })]
                })]
            });
        return w && (t = "enable" === A ? "Description.ThisWillEnableTimedOptionsFor" : "Description.ThisWillDisableTimedOptionsFor", U = (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(iA.DialogContentText, {
                className: d.descriptionText,
                children: l(t)
            }), D.length > 0 && (0, i.jsx)("ul", {
                className: d.bulletList,
                children: D.map(e => (0, i.jsx)("li", {
                    children: e
                }, e))
            }), (0, i.jsx)(iA.DialogContentText, {
                className: d.descriptionText,
                children: l("Description.ThisWillAlsoReplaceAnyItemLevelSettings")
            }), (0, i.jsxs)(n3.default, {
                flexDirection: "row",
                classes: {
                    root: d.buttonContainer
                },
                children: [(0, i.jsx)(nJ.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: N,
                    size: "medium",
                    className: d.actionButton,
                    children: l("Action.Confirm")
                }), (0, i.jsx)(nJ.Button, {
                    variant: "contained",
                    color: "secondary",
                    onClick: R,
                    size: "medium",
                    className: d.actionButton,
                    children: l("Action.Cancel")
                })]
            })]
        })), (0, i.jsxs)(is.Dialog, {
            open: n,
            onClose: P,
            maxWidth: "Small",
            color: "primaryBrand",
            classes: {
                paper: d.dialogPaper
            },
            children: [(0, i.jsxs)(io.DialogTitle, {
                className: d.dialogTitle,
                children: [(0, i.jsx)("span", {
                    className: d.dialogTitleText,
                    children: w ? l("Title.ConfirmOption") : l("Action.TimedOptions")
                }), !w && (0, i.jsx)(nP.IconButton, {
                    "aria-label": "Close",
                    onClick: P,
                    size: "small",
                    className: d.closeButton,
                    color: "inherit",
                    children: (0, i.jsx)(il.CloseIcon, {})
                })]
            }), (0, i.jsx)(ir.DialogContent, {
                className: d.dialogContent,
                children: U
            })]
        })
    }, [B.TranslationNamespace.ConfigureItem, B.TranslationNamespace.Creations, B.TranslationNamespace.AssetTypes]);

    function iU(e) {
        return "Tshirt" === e ? m.Asset.TShirt : "TshirtAccessory" === e ? m.Asset.TShirtAccessory : e
    }
    let iB = (0, nN.makeStyles)()(e => ({
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
        iz = (0, s.withTranslation)(e => {
            let t, n, a, r, {
                    open: o,
                    onClose: l
                } = e,
                {
                    translate: d,
                    translateHTML: c
                } = (0, s.useTranslation)(),
                {
                    classes: p
                } = iB(),
                {
                    enqueue: h,
                    close: v
                } = (0, ih.useSnackbar)(),
                x = (0, f.useCurrentGroup)(),
                [g, b] = (0, u.useState)(null),
                [y, I] = (0, u.useState)(() => q.uuidService.generateRandomUuid()),
                [T, C] = (0, u.useState)({
                    showClothing: !1,
                    showMakeup: !1,
                    showAccessories: !1,
                    showCategorySubtypeDropdowns: !0
                }),
                [w, S] = (0, u.useState)(!1);
            (0, u.useEffect)(() => {
                o ? (b(null), I(q.uuidService.generateRandomUuid()), (0, it.getValidTimedOptionsTypes)().then(() => {
                    let e = new Set(it.ValidTimedOptionsAssetTypes.map(e => iU(e))),
                        t = 3 === e.size && Array.from(n6.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).every(t => e.has(t));
                    if (S(t), t) C({
                        showClothing: !1,
                        showMakeup: !1,
                        showAccessories: !1,
                        showCategorySubtypeDropdowns: !0
                    });
                    else {
                        let t = [...e].every(e => n6.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e) || n6.MAKEUP_ASSET_TYPES.includes(e)),
                            n = e.has(m.Asset.EyeMakeup),
                            i = n6.CLOTHING_ASSET_TYPES.some(t => e.has(t) && !n6.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(t)),
                            a = Array.from(n6.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(t => e.has(t));
                        C({
                            showClothing: i || a,
                            showMakeup: n,
                            showAccessories: e.has(m.Asset.Hat),
                            showCategorySubtypeDropdowns: !t
                        })
                    }
                })) : I(q.uuidService.generateRandomUuid())
            }, [o]);
            let A = (0, u.useCallback)(async () => {
                    try {
                        await iv.default.bulkUpdateCollectible(y, null == x ? void 0 : x.id, [64, 66, 68], !0 === g), h({
                            message: d("Message.TimedOptionSettingsApplied"),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: iM.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        }), window.location.reload(), l()
                    } catch (e) {
                        h({
                            message: d(ij(await (0, tw.default)(e), "Error.Unknown")),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: iM.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        })
                    }
                }, [h, v, d, l, y, null == x ? void 0 : x.id, g]),
                M = (0, u.useCallback)(() => {
                    l()
                }, [l]),
                j = !w,
                E = j ? (t = new Set(it.ValidTimedOptionsAssetTypes.map(e => iU(e))), n = n6.CLOTHING_ASSET_TYPES.some(e => t.has(e) && !n6.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e)), a = Array.from(n6.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(e => t.has(e)), r = T.showCategorySubtypeDropdowns && (!a || n) ? n6.CLOTHING_ASSET_TYPES.filter(e => t.has(e)) : Array.from(n6.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).filter(e => t.has(e)), {
                    clothing: r,
                    makeup: n6.MAKEUP_ASSET_TYPES.filter(e => t.has(e)),
                    accessories: T.showCategorySubtypeDropdowns ? n6.ACCESSORY_ASSET_TYPES.filter(e => t.has(e)) : []
                }) : void 0;
            return j ? (0, i.jsx)(iO, {
                open: o,
                onClose: M,
                categoryFlags: T,
                assetTypesByCategory: E
            }) : (0, i.jsxs)(is.Dialog, {
                open: o,
                onClose: M,
                maxWidth: "Small",
                color: "primaryBrand",
                children: [(0, i.jsxs)(io.DialogTitle, {
                    className: p.dialogTitle,
                    children: [(0, i.jsx)("span", {
                        children: null === g ? d("Action.TimedOptions") : d("Action.Confirm")
                    }), (0, i.jsx)(nP.IconButton, {
                        "aria-label": "Close",
                        onClick: M,
                        size: "small",
                        className: p.closeButton,
                        color: "inherit",
                        children: (0, i.jsx)(il.CloseIcon, {})
                    })]
                }), (0, i.jsx)(ir.DialogContent, {
                    className: p.dialogContent,
                    children: null === g ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(iA.DialogContentText, {
                            className: p.descriptionText,
                            children: d("Description.BulkUpdateTimedOptions")
                        }), (0, i.jsxs)(n3.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(nJ.Button, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    b(!0)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: d("Action.TurnAllOn")
                            }), (0, i.jsx)(nJ.Button, {
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
                        children: [(0, i.jsx)(iA.DialogContentText, {
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
                        }), (0, i.jsxs)(n3.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(nJ.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                onClick: A,
                                size: "large",
                                className: p.actionButton,
                                children: d("Action.Confirm")
                            }), (0, i.jsx)(nJ.Button, {
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
        }, [B.TranslationNamespace.ConfigureItem, B.TranslationNamespace.Creations]),
        iV = Object.values(Y.SearchSortParameter),
        iF = Object.values(nW.EventSortBy),
        iq = ["publishSettings"],
        iG = e => {
            var t;
            let {
                menuState: n
            } = e, {
                translate: a
            } = (0, s.useTranslation)(), {
                unifiedLogger: r
            } = (0, n8.useUnifiedLoggerProvider)(), {
                value: o
            } = (0, d.useFlag)(n7.isAutoPublishPreferencesEnabled), {
                isFetched: l
            } = (0, f.useGroups)(), {
                classes: {
                    toolbarContainer: c,
                    sortContainer: p,
                    timedOptionsButton: h,
                    timedOptionsButtonDivider: v
                }
            } = ia(), [x, b] = (0, u.useState)(!1), [T, C] = (0, u.useState)(!1), [w, S] = (0, u.useState)(0), [A, M] = (0, u.useState)(!1), [j, E] = (0, u.useState)(!1), [P, k] = (0, u.useState)(null);
            (0, u.useEffect)(() => {
                (0, it.getValidTimedOptionsTypes)().then(() => {
                    E(!0)
                })
            }, []);
            let {
                sort: L,
                setSort: N,
                sortOrder: R,
                setSortOrder: D,
                isArchived: O,
                setIsArchived: U,
                isAgeRestrictedCollaboration: B,
                setIsAgeRestrictedCollaboration: z,
                isPublicOnly: V,
                setIsPublicOnly: F,
                isOnMarketplace: G,
                setIsOnMarketplace: _
            } = (0, er.default)(), [{
                filterIndex: H,
                publishSettings: K
            }] = (0, ee.useQueryParams)(["filterIndex", "publishSettings"]), [, W] = (0, ee.useQueryParams)(["activeTab", "filterIndex"]), [, Q] = (0, ee.useQueryParams)(iq), J = (0, u.useMemo)(() => I.default.getAssetType(n), [n]), X = J in n6.AvatarMenuMap && o, Z = (0, n9.normalizeSingleQueryParam)(K), $ = !!X && l && !A && ("true" === Z || "1" === Z);
            (0, u.useEffect)(() => {
                l && void 0 !== Z && ($ || Q({
                    publishSettings: null
                }, {
                    skipHistory: !0
                }))
            }, [l, $, Z, Q]);
            let et = (0, u.useCallback)(() => {
                    C(!1), $ && (M(!0), Q({
                        publishSettings: null
                    }, {
                        skipHistory: !0
                    }))
                }, [$, Q]),
                {
                    canUseTaxonomy: en,
                    isTaxonomyMode: ei
                } = (0, nF.default)(J),
                ea = n_(n, (0, f.useCurrentGroup)()),
                {
                    isSortable: es,
                    isArchivable: eo
                } = (0, u.useMemo)(() => {
                    let e = ei || null == H ? void 0 : Number(H),
                        t = I.default.isAssetTypeArchivable(J, e);
                    return {
                        isSortable: I.default.isAssetTypeSortable(J),
                        isArchivable: t || I.default.isAssetTypeDirectlyArchivable(J)
                    }
                }, [J, H, ei]),
                el = a("Label.CategorizeByTaxonomy"),
                eu = (0, u.useCallback)(() => {
                    var e;
                    let t = null == (e = ea[0]) ? void 0 : e.type;
                    W({
                        activeTab: ei ? null != t ? t : J : (0, g.buildTaxonomyActiveTab)(),
                        filterIndex: 0
                    }, {
                        skipHistory: !0
                    })
                }, [ei, J, ea, W]),
                ed = (0, u.useMemo)(() => !es && !eo && !en && J !== m.Asset.MyExperiences && J !== m.Asset.SharedExperiences, [es, eo, en, J]),
                ec = (0, u.useCallback)(e => {
                    let {
                        value: t
                    } = e.target;
                    if (J === m.Asset.MyExperiences || J === m.Asset.SharedExperiences) {
                        if (!iV.includes(t)) return;
                        N(e => ({
                            ...e,
                            [m.Asset.Place]: t
                        }))
                    } else iF.includes(t) && N(e => ({
                        ...e,
                        [J]: t
                    }))
                }, [N, J]),
                em = (0, u.useCallback)(() => {
                    D(e => e === q.SortOrder.Asc ? q.SortOrder.Desc : q.SortOrder.Asc)
                }, [D]),
                ep = (0, u.useCallback)(() => {
                    b(!0)
                }, []),
                eh = (0, u.useCallback)(() => {
                    let e = !B;
                    r.logClickEvent({
                        eventName: tS.default.ImpactedExperiencesFilterClick,
                        parameters: {
                            page: "creations",
                            action: e ? "enable" : "disable",
                            assetType: J.toString()
                        }
                    }), z(e => !e)
                }, [r, B, J, z]),
                ev = J === m.Asset.MyExperiences || J === m.Asset.SharedExperiences,
                ef = (0, u.useMemo)(() => ev ? Object.values(Y.SearchSortParameter).map(e => ({
                    value: e,
                    labelKey: y.universeSortTranslationKeys[e]
                })) : Object.values(nW.EventSortBy).map(e => ({
                    value: e,
                    labelKey: y.eventSortTranslationKeys[e]
                })), [ev]),
                ex = (0, u.useMemo)(() => ev ? L[m.Asset.Place] : (0, ie.getSortForAssetType)(J, L), [ev, L, J]),
                eg = (0, u.useMemo)(() => {
                    var e, t;
                    if (!j) return !1;
                    let i = ei || null == H ? void 0 : Number(H);
                    if (void 0 !== i && n6.AvatarMenuMap[J]) {
                        let e = n6.AvatarMenuMap[J][i];
                        if (e) return (0, ii.getIsRentableType)(e.assetType, e.bundleType)
                    }
                    return (0, ii.getIsRentableType)(null != (e = null == (t = n.submenuItem) ? void 0 : t.type) ? e : J, void 0)
                }, [J, H, ei, null == (t = n.submenuItem) ? void 0 : t.type, j]);
            if (ed) return null;
            let eb = J === m.Asset.MyExperiences || J === m.Asset.SharedExperiences || eo || en || J === m.Asset.MeshPart,
                ey = J === m.Asset.MyExperiences || J === m.Asset.SharedExperiences,
                eI = J === m.Asset.Decal || J === m.Asset.MeshPart,
                eT = !X && !eg && !!(J === m.Asset.MyExperiences || ey || eo && J);
            return (0, i.jsxs)(n3.Flex, {
                flexDirection: "row",
                justifyContent: "flex-start",
                alignItems: "flex-start",
                flexWrap: "wrap",
                classes: {
                    root: c
                },
                children: [eb && (0, i.jsxs)(n3.Flex, {
                    alignItems: "center",
                    gap: 1,
                    flexDirection: "row",
                    children: [eT && (0, i.jsx)(n5.Typography, {
                        marginRight: "16px",
                        children: a("Label.ShowPrefix")
                    }), J === m.Asset.MyExperiences && (0, i.jsx)(nZ.FormControlLabel, {
                        control: (0, i.jsx)(n4.Switch, {
                            checked: V,
                            onChange: () => F(e => !e),
                            "aria-label": a("Label.Public")
                        }),
                        label: a("Label.Public")
                    }), ey && (0, i.jsx)(nZ.FormControlLabel, {
                        control: (0, i.jsx)(n4.Switch, {
                            checked: B,
                            onChange: eh,
                            "aria-label": a("Label.Impacted")
                        }),
                        label: a("Label.Impacted")
                    }), eg && !X && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nJ.Button, {
                            variant: "contained",
                            color: "secondary",
                            onClick: ep,
                            classes: {
                                root: h
                            },
                            children: a("Action.TimedOptions")
                        }), (0, i.jsx)(nX.Divider, {
                            orientation: "vertical",
                            flexItem: !0,
                            classes: {
                                root: v
                            }
                        })]
                    }), eo && J && (0, i.jsx)(nZ.FormControlLabel, {
                        control: (0, i.jsx)(n4.Switch, {
                            checked: O,
                            onChange: () => U(e => !e),
                            "aria-label": X ? a("Action.ShowArchived") : a("Label.Archived")
                        }),
                        label: X ? a("Action.ShowArchived") : a("Label.Archived")
                    }), en && (0, i.jsx)(nZ.FormControlLabel, {
                        control: (0, i.jsx)(n4.Switch, {
                            checked: ei,
                            onChange: eu,
                            "aria-label": el
                        }),
                        label: el
                    }), X && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nX.Divider, {
                            orientation: "vertical",
                            flexItem: !0,
                            classes: {
                                root: v
                            }
                        }), (0, i.jsx)(nP.IconButton, {
                            "aria-label": a("Label.Settings"),
                            size: "medium",
                            color: "secondary",
                            onClick: e => k(e.currentTarget),
                            children: (0, i.jsx)(n2.SettingsIcon, {})
                        }), (0, i.jsxs)(n$.Menu, {
                            anchorEl: P,
                            open: null != P,
                            onClose: () => k(null),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "right"
                            },
                            transformOrigin: {
                                vertical: "top",
                                horizontal: "right"
                            },
                            className: "margin-top-small",
                            children: [eg && (0, i.jsx)(n0.MenuItem, {
                                onClick: () => {
                                    k(null), ep()
                                },
                                children: (0, i.jsx)(n5.Typography, {
                                    variant: "body1",
                                    children: a("Action.TimedOptions")
                                })
                            }), (0, i.jsx)(n0.MenuItem, {
                                onClick: () => {
                                    k(null), S(e => e + 1), C(!0)
                                },
                                children: (0, i.jsx)(n5.Typography, {
                                    variant: "body1",
                                    children: a("Action.StudioPublishSettings")
                                })
                            })]
                        })]
                    }), eI && (0, i.jsx)(nZ.FormControlLabel, {
                        control: (0, i.jsx)(n4.Switch, {
                            "aria-label": a("Label.OnCreatorStore"),
                            checked: G,
                            onChange: () => _(e => !e)
                        }),
                        label: a("Label.OnCreatorStore")
                    })]
                }), es && (0, i.jsxs)(n3.Flex, {
                    flexDirection: "row",
                    classes: {
                        root: p
                    },
                    alignItems: "center",
                    flexWrap: "nowrap",
                    children: [(0, i.jsx)(n1.Select, {
                        variant: "outlined",
                        margin: "dense",
                        size: "small",
                        label: a("Label.SortBy"),
                        value: ex,
                        onChange: ec,
                        inputProps: {
                            "aria-label": a("Label.SortBy")
                        },
                        children: ef.map(e => (0, i.jsx)(n0.MenuItem, {
                            value: e.value,
                            children: a(e.labelKey)
                        }, e.value))
                    }), (0, i.jsx)(nP.IconButton, {
                        "aria-label": a("Heading.SortOrder"),
                        onClick: em,
                        size: "large",
                        children: R === q.SortOrder.Asc ? (0, i.jsx)(nY.ArrowUpwardIcon, {
                            color: "secondary"
                        }) : (0, i.jsx)(nQ.ArrowDownwardIcon, {
                            color: "secondary"
                        })
                    })]
                }), (0, i.jsx)(iz, {
                    open: x,
                    onClose: () => b(!1)
                }), (0, i.jsx)(iS, {
                    open: T || $,
                    onClose: et
                }, w)]
            })
        },
        i_ = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                verificationMetadata: a,
                group: s
            } = e, r = [m.Asset.UpcomingEvent, m.Asset.PastEvent, m.Asset.DraftEvent], o = !!t.submenuItem && r.includes(t.submenuItem.type);
            return (0, i.jsxs)("div", {
                className: "flex justify-between padding-top-small",
                children: [t.menuItem.type === m.Asset.TShirt && (0, i.jsx)(nj, {
                    data: a
                }), !o && (0, i.jsx)("div", {
                    className: "flex width-full padding-bottom-large [align-content:flex-start] [row-gap:12px] justify-between flex-row items-start wrap",
                    children: t.menuItem.type === m.Asset.Moments ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nA, {}), (0, i.jsx)(nC, {})]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [t.submenuItem && (0, i.jsx)(nK, {
                            menuState: t,
                            onMenuStateChange: n,
                            group: s
                        }), (0, i.jsx)(iG, {
                            menuState: t
                        })]
                    })
                })]
            })
        };
    var iH = e.i(513997),
        iK = e.i(71375),
        iW = e.i(83560),
        iQ = e.i(576069),
        iY = e.i(134817);
    let iJ = [];

    function iX(e) {
        return null != e.universeId ? e.universeId : "experienceId" in e && "number" == typeof e.experienceId ? e.experienceId : void 0
    }
    var iZ = e.i(187901),
        i$ = e.i(258858);
    let i0 = (e, t) => {
            let {
                user: n
            } = (0, F.useAuthentication)(), {
                enabled: i,
                thumbnailUrl: a,
                videoUrl: s
            } = t, r = null == n ? void 0 : n.id, o = (0, u.useMemo)(() => a || s ? {
                thumbnailUrl: null != a ? a : "",
                videoUrl: null != s ? s : ""
            } : null, [a, s]), [l, d] = (0, u.useState)(null);
            return ((0, u.useEffect)(() => {
                if (o || null == r || !i || null == e || "" === e) return;
                let t = !1;
                return (async () => {
                    let n = {
                        draftId: e,
                        userId: r
                    };
                    tD(tM.LoadLocalVideoMedia, n);
                    try {
                        let i = await eL(r, e);
                        t || (d(i), null != i && tO(tM.LoadLocalVideoMedia, n))
                    } catch (n) {
                        tL(tM.LoadLocalVideoMedia, n, {
                            draftId: e
                        }), t || d(null)
                    }
                })(), () => {
                    t = !0
                }
            }, [e, i, o, r]), o) ? o : i ? l : null
        },
        i1 = "block width-full height-full max-w-full max-h-full object-contain",
        i2 = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)("div", {
                className: "flex items-center justify-center radius-medium bg-surface-200 width-full shrink-0 overflow-hidden h-[240px]",
                "data-testid": "moments-video-preview-container",
                children: t
            })
        },
        i4 = e => {
            let {
                thumbnailUrl: t,
                videoUrl: n
            } = e;
            return n ? (0, i.jsx)(i2, {
                children: (0, i.jsx)("video", {
                    "aria-label": "Moment video preview",
                    className: "radius-medium ".concat(i1),
                    controls: !0,
                    playsInline: !0,
                    poster: t,
                    src: n,
                    children: (0, i.jsx)("track", {
                        kind: "captions"
                    })
                })
            }) : t ? (0, i.jsx)(i2, {
                children: (0, i.jsx)("img", {
                    alt: "Moment thumbnail preview",
                    className: "radius-medium ".concat(i1),
                    src: t
                })
            }) : (0, i.jsx)(i2, {})
        },
        i5 = (0, s.withTranslation)(e => {
            var t, n, a;
            let {
                moment: r,
                open: o,
                onOpenChange: l,
                onMomentMetadataChange: d,
                onPublish: c,
                onDelete: m,
                publishingDraftId: p = null,
                deletingMomentKey: h = null,
                isPublishDisabled: v = !1
            } = e, {
                translate: f
            } = (0, s.useTranslation)(), {
                locale: x
            } = (0, s.useLocalization)(), g = t0(), b = tV(x), [y, I] = (0, u.useState)(() => {
                var e, t, n, i;
                let a;
                return r && ((a = {
                    id: null != (i = iX(n = r)) ? i : 0,
                    name: n.experienceName
                }).id > 0 || (null != (e = null == (t = a.name) ? void 0 : t.length) ? e : 0) > 0) ? a : void 0
            }), [T, C] = (0, u.useState)(() => {
                var e;
                return null != (e = null == r ? void 0 : r.description) ? e : ""
            }), [w, S] = (0, u.useState)(), A = null != (t = null != w ? w : null == r ? void 0 : r.locale) ? t : b, M = (null == r ? void 0 : r.status) === ef && !0 === r.hasLocalVideo, j = i0((null == r ? void 0 : r.status) === ef ? r.draftId : null, {
                enabled: o && M,
                thumbnailUrl: null == r ? void 0 : r.thumbnailUrl,
                videoUrl: null == r ? void 0 : r.videoUrl
            }), E = (0, u.useCallback)(() => {
                r && !v && null == p && (null == c || c(r))
            }, [v, r, c, p]), P = (0, u.useCallback)(() => {
                r && h !== t1(r) && (null == m || m(r))
            }, [h, r, m]), k = (0, u.useCallback)(e => {
                r && e.id && e.name && (I(e), null == d || d(r, {
                    experienceId: e.id,
                    rootPlaceId: e.rootPlaceId,
                    experienceName: e.name
                }))
            }, [r, d]), L = (0, u.useCallback)(e => {
                C(e.target.value)
            }, []), N = (0, u.useCallback)(e => {
                S(e), r && e !== r.locale && (null == d || d(r, {
                    locale: e
                }))
            }, [r, d]), R = (0, u.useCallback)(() => {
                r && T !== r.description && (null == d || d(r, {
                    description: T
                }))
            }, [T, r, d]), D = (0, u.useCallback)(() => {
                R()
            }, [R]), O = (0, u.useCallback)(e => {
                e || R(), l(e)
            }, [R, l]);
            if (!r) return null;
            let U = t1(r),
                B = null != p && p === U,
                z = null != p,
                V = null != h && h === U,
                F = r.status === eh,
                q = r.status === ef,
                G = q && !B,
                _ = !F && null != c && (q && M || B),
                H = null != m,
                K = T.length >= 140;
            return (0, i.jsx)(iZ.SheetRoot, {
                open: o,
                onOpenChange: O,
                children: (0, i.jsxs)(iZ.SheetContent, {
                    closeLabel: f("Action.Close"),
                    largeScreenVariant: "side",
                    children: [(0, i.jsx)(iZ.SheetTitle, {
                        children: f("Heading.EditMoment")
                    }), (0, i.jsxs)(iZ.SheetBody, {
                        className: "flex flex-col gap-y-medium padding-top-small padding-bottom-large",
                        children: [(0, i.jsx)(i4, {
                            thumbnailUrl: null != (n = null == j ? void 0 : j.thumbnailUrl) ? n : r.thumbnailUrl,
                            videoUrl: null != (a = null == j ? void 0 : j.videoUrl) ? a : r.videoUrl
                        }), G ? (0, i.jsx)(i.Fragment, {
                            children: y ? (0, i.jsx)(t8, {
                                experience: y,
                                onChangeExperience: () => I(void 0)
                            }) : (0, i.jsx)(nr, {
                                onExperienceResolved: k
                            })
                        }) : y ? (0, i.jsxs)("div", {
                            className: "flex flex-col gap-y-xsmall width-full margin-top-small",
                            children: [(0, i.jsx)("span", {
                                className: "text-body-small content-muted",
                                children: f("CreateMomentModal.ExperienceInput.Label")
                            }), (0, i.jsx)(t8, {
                                experience: y,
                                hideTitle: !0
                            })]
                        }) : null, g ? (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: G ? (0, i.jsx)(nu, {
                                value: A,
                                onChange: N,
                                isDisabled: B
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: f("CreateMomentModal.LanguageInput.Label")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-content-language-readonly",
                                    children: tF(r.locale)
                                })]
                            })
                        }) : null, (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: G ? (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)(i$.TextArea, {
                                    id: "edit-moment-description-".concat(U),
                                    label: f("MomentsTable.Header.Description"),
                                    rows: 3,
                                    placeholder: f("MomentsTable.Placeholders.Description"),
                                    size: "Small",
                                    value: T,
                                    maxLength: 140,
                                    onBlur: D,
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
                    }), (0, i.jsx)(iZ.SheetActions, {
                        className: "width-full",
                        children: (0, i.jsxs)("div", {
                            className: "flex gap-small width-full",
                            children: [_ ? (0, i.jsx)(eo.Button, {
                                variant: "Emphasis",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: v || z,
                                isLoading: B,
                                onClick: E,
                                children: f("Action.Publish")
                            }) : null, H ? (0, i.jsx)(eo.Button, {
                                variant: "Standard",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: V,
                                isLoading: V,
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
        }, [B.TranslationNamespace.Creations, B.TranslationNamespace.Controls]);
    var i7 = e.i(947591),
        i3 = e.i(493924);
    let i8 = e => {
        let {
            onCreateClick: t
        } = e, {
            translate: n
        } = (0, s.useTranslation)();
        return (0, i.jsx)(i3.default, {
            title: n("Heading.ReachPlayersDirectlyInMoments"),
            size: "large",
            illustration: "videos",
            description: (0, i.jsxs)(i.Fragment, {
                children: [n("Description.UploadExternalVideosToMoments"), " ", (0, i.jsx)(i7.Link, {
                    "aria-label": n("Label.LearnMore"),
                    href: nM.MOMENTS_LEARN_MORE_URL,
                    target: "_blank",
                    rel: "noopener noreferrer",
                    variant: "Inline",
                    underline: "always",
                    isExternal: !1,
                    children: n("Label.LearnMore")
                })]
            }),
            children: (0, i.jsx)(eo.Button, {
                variant: "Emphasis",
                size: "Large",
                type: "button",
                onClick: t,
                children: n("Action.CreateMoments")
            })
        })
    };
    var i9 = e.i(886493),
        i6 = e.i(799724),
        ae = e.i(125677),
        at = e.i(20227),
        an = e.i(494601);
    let ai = {
            [eh]: "bg-system-success",
            [ev]: "bg-system-warning",
            [ef]: "bg-surface-300",
            [ex]: "bg-system-alert"
        },
        aa = e => {
            let {
                status: t,
                label: n
            } = e;
            return (0, i.jsxs)("span", {
                className: "inline-flex items-center gap-xsmall",
                children: [(0, i.jsx)("span", {
                    "aria-hidden": !0,
                    className: "size-[8px] radius-circle shrink-0 ".concat(ai[t]),
                    "data-testid": "moment-status-dot-".concat(t)
                }), (0, i.jsx)("span", {
                    children: n
                })]
            })
        };
    var as = e.i(977690),
        ar = e.i(540513),
        ao = e.i(914040);
    let al = (0, s.withTranslation)(e => {
            let t, {
                    moment: n
                } = e,
                {
                    translate: a
                } = (0, s.useTranslation)(),
                r = n.status === ef,
                o = r && !0 === n.hasLocalVideo,
                l = i0(r ? n.draftId : null, {
                    enabled: o,
                    thumbnailUrl: n.thumbnailUrl,
                    videoUrl: n.videoUrl
                }),
                {
                    assetId: d
                } = n,
                [c, m] = (0, u.useState)(!1),
                p = a("Label.MomentVideoPreview"),
                h = !!(null == l ? void 0 : l.videoUrl) || null != d,
                v = (0, u.useCallback)(() => {
                    h && m(!0)
                }, [h]),
                f = (0, u.useCallback)(() => {
                    m(!1)
                }, []);
            t = (null == l ? void 0 : l.thumbnailUrl) ? (0, i.jsx)("img", {
                alt: "",
                className: "radius-small [object-fit:cover]",
                "data-testid": "moment-video-thumbnail-image",
                height: 48,
                src: l.thumbnailUrl,
                width: 48
            }) : null != d ? (0, i.jsx)("div", {
                className: "radius-small clip size-[48px]",
                "data-testid": "moment-video-thumbnail-image",
                children: (0, i.jsx)(ar.Thumbnail2d, {
                    alt: "",
                    containerClass: "block",
                    imgClassName: "[object-fit:cover]",
                    returnPolicy: ar.ReturnPolicy.PlaceHolder,
                    targetId: d,
                    type: ar.ThumbnailTypes.assetThumbnail
                })
            }) : (0, i.jsx)("div", {
                "aria-hidden": !0,
                className: "radius-small bg-surface-200 size-[48px]"
            });
            let x = null;
            return ((null == l ? void 0 : l.videoUrl) ? x = (0, i.jsx)("video", {
                "aria-label": p,
                autoPlay: !0,
                className: "radius-medium block max-width-[500px] max-height-[500px]",
                loop: !0,
                muted: !0,
                playsInline: !0,
                src: l.videoUrl
            }) : null != d && (x = (0, i.jsx)("div", {
                "aria-label": p,
                className: "radius-medium clip max-width-[500px] max-height-[500px] bg-surface-200",
                children: (0, i.jsx)(ao.RobloxVideoPlayer, {
                    videoAssetId: String(d),
                    environment: "production",
                    src: void 0,
                    autoPlay: !0,
                    disableControls: !0,
                    loop: !0,
                    muted: !0
                })
            })), h) ? (0, i.jsxs)(as.Popover, {
                open: c,
                onOpenChange: m,
                children: [(0, i.jsx)(as.PopoverAnchor, {
                    asChild: !0,
                    children: (0, i.jsx)("button", {
                        "aria-label": p,
                        className: "padding-none bg-none stroke-none",
                        type: "button",
                        onPointerEnter: v,
                        onPointerLeave: f,
                        onFocus: v,
                        onBlur: f,
                        children: t
                    })
                }), (0, i.jsx)(as.PopoverContent, {
                    align: "start",
                    ariaLabel: p,
                    className: "outline-none",
                    side: "bottom",
                    children: x
                })]
            }) : t
        }, [B.TranslationNamespace.Creations]),
        au = [10, 25, 50],
        ad = {
            [eh]: "MomentsTable.NoActiveMoments",
            [ef]: "MomentsTable.NoDraftMoments"
        },
        ac = e => {
            let {
                moment: t,
                disabled: n,
                onBlur: a
            } = e, {
                translate: r
            } = (0, s.useTranslation)(), o = t1(t), [l, d] = (0, u.useState)(t.description), c = l.length >= 140, m = (0, u.useCallback)(e => {
                d(e.target.value)
            }, []), p = (0, u.useCallback)(e => {
                a(t, e)
            }, [t, a]);
            return (0, i.jsxs)("div", {
                className: "flex flex-col gap-y-xsmall width-full",
                children: [(0, i.jsx)(t9.TextInput, {
                    id: "moment-description-".concat(o),
                    label: r("MomentsTable.Header.Description"),
                    value: l,
                    isDisabled: n,
                    maxLength: 140,
                    placeholder: r("MomentsTable.Placeholders.Description"),
                    size: "Small",
                    onBlur: p,
                    onChange: m
                }), (0, i.jsx)("span", {
                    "aria-live": "polite",
                    className: c ? "text-body-small content-system-alert text-align-x-right" : "text-body-small content-muted text-align-x-right",
                    "data-testid": "moment-description-char-count-".concat(o),
                    children: "".concat(l.length, "/").concat(140)
                })]
            })
        },
        am = e => {
            let {
                moment: t,
                editLabel: n,
                publishingDraftId: a,
                isPublishDisabled: r,
                showContentLanguageColumn: o,
                statusLabel: l,
                onEditMoment: d,
                onDescriptionBlur: c,
                onPublishMoment: m
            } = e, {
                translate: p
            } = (0, s.useTranslation)(), h = t1(t), v = t.status === ef, f = (0, u.useCallback)(() => {
                d(t)
            }, [t, d]), x = (0, u.useCallback)(() => {
                t.status === ef && (null == m || m(t.draftId))
            }, [t, m]);
            return (0, i.jsxs)(i9.TableRow, {
                isHoverable: !0,
                "data-testid": "moment-row-".concat(h),
                children: [(0, i.jsx)(i9.TableCell, {
                    children: (0, i.jsx)(al, {
                        moment: t
                    })
                }), (0, i.jsx)(i9.TableCell, {
                    children: t.experienceName
                }), (0, i.jsx)(i9.TableCell, {
                    children: t.status === eh ? (0, i.jsx)("span", {
                        "data-testid": "moment-description-".concat(h),
                        children: t.description || "-"
                    }) : (0, i.jsx)(ac, {
                        moment: t,
                        disabled: null != a && a === h,
                        onBlur: c
                    }, "moment-description-".concat(h, "-").concat(t.modifiedAt))
                }), o ? (0, i.jsx)(i9.TableCell, {
                    children: (0, i.jsx)("span", {
                        "data-testid": "moment-content-language-".concat(h),
                        children: tF(t.locale)
                    })
                }) : null, (0, i.jsx)(i9.TableCell, {
                    children: (0, i.jsx)(aa, {
                        label: l,
                        status: t.status
                    })
                }), (0, i.jsx)(i9.TableCell, {
                    align: "end",
                    children: (0, i.jsxs)("div", {
                        className: "inline-flex items-center gap-xsmall",
                        children: [(0, i.jsx)(i6.Tooltip, {
                            position: "top-center",
                            title: n,
                            children: (0, i.jsx)(i6.TooltipTrigger, {
                                asChild: !0,
                                children: (0, i.jsx)(N.IconButton, {
                                    ariaLabel: n,
                                    icon: "icon-regular-pencil",
                                    size: "Small",
                                    type: "button",
                                    variant: "Utility",
                                    onClick: f
                                })
                            })
                        }), v && !0 === t.hasLocalVideo && m ? (0, i.jsx)(eo.Button, {
                            size: "Small",
                            type: "button",
                            variant: "Standard",
                            isDisabled: r || null != a,
                            onClick: x,
                            children: p("Action.Publish")
                        }) : null]
                    })
                })]
            })
        },
        ap = (0, s.withTranslation)(e => {
            let {
                moments: t,
                onEditMoment: n,
                onMomentMetadataChange: a,
                onPublishMoment: r,
                publishingDraftId: o = null,
                isPublishDisabled: l = !1,
                hasNextPage: d = !1,
                fetchNextPage: c,
                serverPageSize: m = 25
            } = e, {
                translate: p
            } = (0, s.useTranslation)(), {
                classes: {
                    gridContainer: h,
                    createButtonContainer: v
                }
            } = (0, an.default)(), {
                statusTab: f
            } = t5(), x = t0(), g = (0, u.useCallback)(e => {
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
            }, [p]), b = f === eh, y = (0, u.useMemo)(() => f === ef ? t.filter(e => e.status === ef || e.status === ev) : t.filter(e => e.status === f), [t, f]), {
                page: I,
                rowsPerPage: T,
                onPageChange: C,
                onRowsPerPageChange: w
            } = (0, at.useTablePagination)({
                count: y.length,
                initialRowsPerPage: 10,
                resetKey: f
            }), {
                currentPage: S
            } = (0, ae.useCurrentPage)(y, {
                page: I,
                rowsPerPage: T,
                hasNextPage: !!b && d,
                fetchNextPage: b ? c : void 0,
                fetchLimit: m
            }), A = (0, u.useCallback)((e, t) => {
                let n = t.target.value;
                n !== e.description && a(e, {
                    description: n
                })
            }, [a]), M = (0, u.useCallback)(e => {
                C(void 0, e)
            }, [C]), j = p("Action.Edit");
            return (0, i.jsx)("div", {
                className: h,
                children: (0, i.jsx)("div", {
                    className: (0, k.clsx)(v, "flex flex-col gap-xlarge width-full self-stretch"),
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col gap-y-medium width-full",
                        children: [(0, i.jsxs)(i9.Table, {
                            className: "width-full",
                            variant: "Framed",
                            children: [(0, i.jsx)(i9.TableHeader, {
                                children: (0, i.jsxs)(i9.TableRow, {
                                    children: [(0, i.jsx)(i9.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Moments")
                                    }), (0, i.jsx)(i9.TableHeaderCell, {
                                        children: p("MomentsTable.Header.ExperienceName")
                                    }), (0, i.jsx)(i9.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Description")
                                    }), x ? (0, i.jsx)(i9.TableHeaderCell, {
                                        children: p("CreateMomentModal.LanguageInput.Label")
                                    }) : null, (0, i.jsx)(i9.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Status")
                                    }), (0, i.jsx)(i9.TableHeaderCell, {
                                        align: "end",
                                        children: " "
                                    })]
                                })
                            }), (0, i.jsx)(i9.TableBody, {
                                children: 0 === y.length ? (0, i.jsx)(i9.TableRow, {
                                    children: (0, i.jsx)(i9.TableCell, {
                                        colSpan: x ? 6 : 5,
                                        align: "center",
                                        className: "padding-y-xxlarge",
                                        children: (0, i.jsx)("span", {
                                            className: "text-body-medium content-muted block padding-y-xxlarge",
                                            "data-testid": "moments-table-empty-filter-message",
                                            children: p(ad[f])
                                        })
                                    })
                                }) : S.map(e => (0, i.jsx)(am, {
                                    moment: e,
                                    editLabel: j,
                                    publishingDraftId: o,
                                    isPublishDisabled: l,
                                    showContentLanguageColumn: x,
                                    statusLabel: g(e.status),
                                    onEditMoment: n,
                                    onDescriptionBlur: A,
                                    onPublishMoment: r
                                }, t1(e)))
                            })]
                        }), y.length > 0 ? (0, i.jsx)(i9.TablePagination, {
                            page: I,
                            rowsPerPage: T,
                            totalRows: y.length,
                            rowsPerPageOptions: au,
                            onPageChange: M,
                            onRowsPerPageChange: w
                        }) : null]
                    })
                })
            })
        }, [B.TranslationNamespace.Creations, B.TranslationNamespace.Controls]),
        ah = (0, s.withTranslation)(e => {
            let {
                onRetry: t
            } = e, {
                translate: n
            } = (0, s.useTranslation)();
            return (0, i.jsx)(eu.FeedbackBanner, {
                className: "width-full",
                layout: "Inline",
                variant: "Emphasis",
                severity: "Error",
                title: n("Heading.GenericError"),
                description: n("Message.FailedToLoadPage"),
                primaryActionLabel: n("Action.FailedToLoadPage"),
                onPrimaryAction: t,
                "data-testid": "moments-creator-eligibility-error-banner"
            })
        }, [B.TranslationNamespace.Error]);
    var av = e.i(917852);
    let af = () => {
            window.open(av.idVerificationActionUrl, "_blank", "noopener,noreferrer")
        },
        ax = (0, s.withTranslation)(() => {
            let {
                translate: e
            } = (0, s.useTranslation)();
            return (0, i.jsx)(eu.FeedbackBanner, {
                className: "width-full",
                layout: "Inline",
                variant: "Emphasis",
                severity: "Warning",
                title: e("Heading.MomentsIdVerificationRequired"),
                description: e("Message.MomentsIdVerificationRequired"),
                primaryActionLabel: e("Label.VerifyId"),
                onPrimaryAction: af,
                "data-testid": "moments-id-verification-banner"
            })
        }, [B.TranslationNamespace.Creations]),
        ag = () => {
            var e;
            (() => {
                let {
                    user: e
                } = (0, F.useAuthentication)(), t = null == e ? void 0 : e.id;
                (0, u.useEffect)(() => () => {
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
            } = (0, s.useTranslation)(), {
                user: n
            } = (0, F.useAuthentication)(), a = null == n ? void 0 : n.id, {
                data: r,
                isLoading: o,
                isError: l,
                refetch: d
            } = (0, iQ.useCreatorEligibility)(), c = null != (e = null == r ? void 0 : r.creatorEligibility.includes(iH.CreatorEligibilityEnum.IdVerified)) && e, m = o || l || !c, p = !o && !l && !c, h = (0, u.useCallback)(() => {
                d()
            }, [d]), [v, f] = (0, u.useState)(!1), [x, g] = (0, u.useState)(null), [b, y] = (0, u.useState)({}), {
                moments: I,
                updateMoment: T,
                removeMoment: C
            } = eG(), {
                publishMoment: w,
                publishingDraftId: S,
                isPublishing: A
            } = function() {
                var e;
                let {
                    translate: t
                } = (0, s.useTranslation)(), {
                    locale: n
                } = (0, s.useLocalization)(), i = t0(), {
                    user: a
                } = (0, F.useAuthentication)(), r = null == a ? void 0 : a.id, {
                    mutateAsync: o,
                    isPending: l,
                    variables: d
                } = (0, eW.useMutation)({
                    mutationFn: async e => {
                        let {
                            moment: a
                        } = e;
                        if (null == r) throw Error("Authenticated user is required to publish a moment");
                        let s = await ek(r, a.draftId);
                        if (!s) throw Error("Local moment video is required before publishing");
                        return await tZ({
                            moment: a,
                            file: s,
                            userId: r,
                            uiLocale: n,
                            sendVideoContentLanguage: i,
                            displayName: t("Label.PublishMomentDisplayName") || "Creator Hub Moment"
                        }), a
                    }
                });
                return {
                    publishMoment: (0, u.useCallback)(e => o({
                        moment: e
                    }), [o]),
                    publishingDraftId: l && null != (e = null == d ? void 0 : d.moment.draftId) ? e : null,
                    isPublishing: l
                }
            }(), M = (0, u.useRef)(!1), {
                deleteMoment: j,
                deletingMomentKey: E
            } = function() {
                let {
                    user: e
                } = (0, F.useAuthentication)(), t = (0, e_.useQueryClient)(), n = null == e ? void 0 : e.id, i = t$(), {
                    mutateAsync: a,
                    isPending: s,
                    variables: r
                } = (0, eW.useMutation)({
                    mutationFn: e => {
                        let {
                            moment: t
                        } = e;
                        return tJ({
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
                            e.setQueryData(t4(t, i), e => (null == e ? void 0 : e.pages.length) ? {
                                ...e,
                                pages: e.pages.map(e => ({
                                    ...e,
                                    moments: e.moments.filter(e => t1(e) !== n)
                                }))
                            } : e)
                        }(t, n, t1(s), i)
                    }
                });
                return {
                    deleteMoment: (0, u.useCallback)(e => a({
                        moment: e
                    }), [a]),
                    deletingMomentKey: s && null != r ? t1(r.moment) : null,
                    isDeleting: s
                }
            }(), {
                statusTab: P
            } = t5(), {
                serverMoments: k,
                isAllServerMomentsLoaded: L,
                hasNextPage: N,
                fetchNextPage: R,
                error: D,
                isPending: O,
                isFetchingNextPage: U,
                isFetchNextPageError: B,
                errorUpdatedAt: z,
                loadedPageCount: V,
                refetch: q,
                serverPageSize: G
            } = function() {
                var e;
                let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 25,
                    {
                        data: n,
                        error: i,
                        isPending: a,
                        refetch: s,
                        fetchNextPage: r,
                        hasNextPage: o,
                        isFetchingNextPage: l,
                        isFetchNextPageError: d,
                        errorUpdatedAt: c
                    } = function() {
                        let {
                            user: e
                        } = (0, F.useAuthentication)(), t = null == e ? void 0 : e.id, n = t$();
                        return (0, eK.useInfiniteQuery)({
                            queryKey: t4(t, n),
                            queryFn: null != t ? e => {
                                let {
                                    pageParam: i
                                } = e;
                                return tQ(t, i, n)
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
                    m = (0, u.useMemo)(() => n ? function(e) {
                        let t = new Map;
                        for (let n of e)
                            for (let e of n.moments) t.set(t1(e), e);
                        return [...t.values()]
                    }(n.pages) : iJ, [n]),
                    p = null != (e = null == n ? void 0 : n.pages.length) ? e : 0,
                    h = (0, u.useCallback)(() => {
                        r({
                            cancelRefetch: !1,
                            throwOnError: !1
                        })
                    }, [r]),
                    v = o && !d;
                (0, iY.useBackgroundPageLoader)({
                    hasNextPage: v,
                    fetchNextPage: h,
                    disabled: a
                });
                let f = !v && !a && !l;
                return (0, u.useMemo)(() => ({
                    serverMoments: m,
                    isAllServerMomentsLoaded: f,
                    hasNextPage: v,
                    fetchNextPage: h,
                    error: i,
                    isPending: a,
                    isFetchingNextPage: l,
                    isFetchNextPageError: d,
                    errorUpdatedAt: c,
                    loadedPageCount: p,
                    refetch: s,
                    serverPageSize: t
                }), [v, i, h, f, d, l, a, c, p, s, m, t])
            }(), _ = (0, u.useMemo)(() => [...k, ...I].map(e => {
                let t = b[t1(e)];
                return t ? {
                    ...e,
                    ...t
                } : e
            }), [I, b, k]), H = (0, u.useMemo)(() => _.filter(e => e.status !== ex), [_]), K = H.length > 0, W = (0, u.useRef)(0);
            (0, u.useEffect)(() => {
                !D || O || B || z <= W.current || (W.current = z, tL(tM.ListMoments, D, {
                    userId: a,
                    pageCount: V
                }))
            }, [D, z, B, O, V, a]);
            let Q = (0, u.useRef)(!1);
            (0, u.useEffect)(() => {
                if (!B || U) {
                    Q.current = !1;
                    return
                }
                D && !Q.current && (Q.current = !0, tL(tM.FetchNextPage, D, {
                    userId: a,
                    pageCount: V
                }))
            }, [D, B, U, V, a]);
            let Y = (0, u.useMemo)(() => {
                    var e;
                    if (!x) return null;
                    let t = t1(x);
                    return null != (e = _.find(e => t1(e) === t)) ? e : x
                }, [x, _]),
                J = (0, u.useCallback)(e => {
                    g(e), f(!0)
                }, []),
                X = (0, u.useCallback)(e => {
                    f(e), e || g(null)
                }, []),
                Z = (0, u.useCallback)(() => {
                    q()
                }, [q]),
                $ = (0, u.useCallback)(() => {
                    (0, iW.toast)({
                        title: t("Message.MomentPublishedError")
                    })
                }, [t]),
                ee = (0, u.useCallback)(() => {
                    (0, iW.toast)({
                        title: t("Message.MomentDeletedError")
                    })
                }, [t]),
                et = (0, u.useCallback)(() => {
                    (0, iW.toast)({
                        title: t("Message.MomentUploadStarted"),
                        icon: "icon-filled-circle-check"
                    })
                }, [t]),
                en = (0, u.useCallback)(async e => {
                    let t = e.status === ef,
                        n = t1(e),
                        i = {
                            ...t ? {
                                draftId: e.draftId
                            } : {
                                momentId: e.momentId,
                                feedItemId: e.feedItemId
                            },
                            experienceId: iX(e),
                            isLocalMoment: t,
                            userId: a
                        };
                    tD(tM.DeleteMoment, i);
                    try {
                        e.status === ef ? C(e.draftId) : await j(e), y(e => {
                            if (!(n in e)) return e;
                            let {
                                [n]: t, ...i
                            } = e;
                            return i
                        }), f(!1), g(null), tO(tM.DeleteMoment, i)
                    } catch (e) {
                        tL(tM.DeleteMoment, e, i), ee()
                    }
                }, [j, C, ee, a]),
                ei = (0, u.useCallback)((e, t) => {
                    if (e.status === ef) return void T(e.draftId, t);
                    let n = t1(e),
                        i = new Date().toISOString();
                    y(e => ({
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
                }, [T]),
                ea = (0, u.useCallback)(async e => {
                    if (M.current || A || m) return;
                    let t = I.find(t => t.draftId === e);
                    if (!t) return;
                    M.current = !0;
                    let n = {
                        draftId: e,
                        experienceId: iX(t),
                        isLocalMoment: !0,
                        userId: a
                    };
                    tD(tM.PublishMoment, n);
                    try {
                        await w(t), C(e), f(!1), g(null), tO(tM.PublishMoment, n), et()
                    } catch (e) {
                        tL(tM.PublishMoment, e, n), $()
                    } finally {
                        M.current = !1
                    }
                }, [m, A, I, w, C, $, et, a]),
                es = (0, u.useCallback)(e => {
                    e.status === ef && ea(e.draftId)
                }, [ea]);
            return D && P !== ef && !K ? (0, i.jsx)(iK.default, {
                onReload: Z
            }) : (!O || K) && (L || K) ? (0, i.jsxs)("div", {
                className: "flex grow-1 flex-col gap-medium self-stretch width-full",
                children: [l ? (0, i.jsx)(ah, {
                    onRetry: h
                }) : null, p ? (0, i.jsx)(ax, {}) : null, K ? (0, i.jsx)(ap, {
                    moments: H,
                    hasNextPage: N,
                    fetchNextPage: R,
                    serverPageSize: G,
                    onEditMoment: J,
                    onMomentMetadataChange: ei,
                    onPublishMoment: ea,
                    publishingDraftId: S,
                    isPublishDisabled: m
                }) : (0, i.jsx)("div", {
                    className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                    children: (0, i.jsx)(i8, {
                        onCreateClick: nI
                    })
                }), (0, i.jsx)(i5, {
                    moment: Y,
                    open: v,
                    onOpenChange: X,
                    onMomentMetadataChange: ei,
                    onDelete: Y ? en : void 0,
                    onPublish: (null == Y ? void 0 : Y.status) === ef ? es : void 0,
                    publishingDraftId: S,
                    deletingMomentKey: E,
                    isPublishDisabled: m
                }, Y ? t1(Y) : void 0)]
            }) : (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(nd.ProgressCircle, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            })
        },
        ab = {
            width: "100%",
            height: "100%"
        },
        ay = (0, nN.makeStyles)()(e => ({
            section: {
                ...ab
            },
            container: {
                ...ab
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
        aI = (0, Q.default)(() => e.A(202045), {
            loadableGenerated: {
                modules: [623728]
            },
            ssr: !1
        }),
        aT = (0, Q.default)(() => e.A(378869), {
            loadableGenerated: {
                modules: [518808]
            },
            ssr: !1
        }),
        aC = (0, Q.default)(() => e.A(580854), {
            loadableGenerated: {
                modules: [427685]
            },
            ssr: !1
        }),
        aw = (0, Q.default)(() => e.A(307640), {
            loadableGenerated: {
                modules: [48220]
            },
            ssr: !1
        }),
        aS = (0, Q.default)(() => e.A(114198), {
            loadableGenerated: {
                modules: [595604]
            },
            ssr: !1
        }),
        aA = (0, Q.default)(() => e.A(558217), {
            loadableGenerated: {
                modules: [333771]
            },
            ssr: !1
        }),
        aM = (0, Q.default)(() => e.A(546234), {
            loadableGenerated: {
                modules: [82873]
            },
            ssr: !1
        }),
        aj = (0, Q.default)(() => e.A(85397), {
            loadableGenerated: {
                modules: [973472]
            },
            ssr: !1
        }),
        aE = (0, Q.default)(() => e.A(890748), {
            loadableGenerated: {
                modules: [835459]
            },
            ssr: !1
        }),
        aP = (0, Q.default)(() => e.A(68996), {
            loadableGenerated: {
                modules: [565869]
            },
            ssr: !1
        }),
        ak = (0, Q.default)(() => e.A(441969), {
            loadableGenerated: {
                modules: [415945]
            },
            ssr: !1
        }),
        aL = (0, Q.default)(() => e.A(481709), {
            loadableGenerated: {
                modules: [947274]
            },
            ssr: !1
        }),
        aN = (0, Q.default)(() => e.A(272047), {
            loadableGenerated: {
                modules: [616027]
            },
            ssr: !1
        });

    function aR(e) {
        let t = (0, h.readQueryValue)(e);
        return void 0 === t ? m.Asset.MyExperiences : (0, p.isValidEnumValue)(m.Asset, t) ? t : m.Asset.MyExperiences
    }
    let aD = (0, s.withTranslation)(e => {
            let {
                verificationMetadata: t,
                currentGroup: n,
                currentUser: a,
                allowedAssetTypes: r
            } = e, [o, l] = (0, ee.useQueryParams)(["activeTab", "filterIndex"]), {
                resetAllFilters: d
            } = (0, er.default)(), {
                settings: c
            } = (0, x.useSettings)(), p = C(), h = (0, nO.default)(), v = (0, nD.default)(), f = (0, nG.default)(), {
                translate: T
            } = (0, s.useTranslation)(), w = (0, b.default)(), S = E(), A = (0, u.useRef)(void 0), M = (0, u.useMemo)(() => [], []), j = (0, g.isTaxonomyActiveTab)(o.activeTab), P = j || (0, g.isRecentsActiveTab)(o.activeTab), k = (0, u.useMemo)(() => {
                let e = (0, g.isAllAssetTypesActiveTab)(o.activeTab) ? m.Asset.AllCatalogAsset : g.TAXONOMY_HOST_ASSET;
                return I.default.getMenuState(P ? e : aR(o.activeTab), M)
            }, [o.activeTab, M, P]), L = (0, u.useMemo)(() => y.default.filter(e => !M.includes(e.type)), [M]), {
                classes: {
                    section: N,
                    container: R
                }
            } = ay(), D = (0, u.useCallback)(e => {
                if (k.menuItem === e.menuItem && k.submenuItem === e.submenuItem) return;
                if ((0, g.shouldOpenTaxonomyView)({
                        isTaxonomyEnabled: w,
                        isChangingSection: k.menuItem !== e.menuItem,
                        nextAssetType: I.default.getAssetType(e)
                    })) return void l({
                    activeTab: g.AVATAR_ITEMS_ACTIVE_TAB,
                    filterIndex: 0
                });
                let t = (0, es.isOnItemTab)(e.menuItem.type) ? 0 : void 0;
                l({
                    activeTab: I.default.getAssetType(e),
                    filterIndex: t
                })
            }, [k.menuItem, k.submenuItem, l, w]), O = (0, u.useMemo)(() => {
                let e = aR(o.activeTab);
                if (void 0 === p && e === m.Asset.Moments || void 0 === h && e === m.Asset.AllCatalogAsset || void 0 === v && e === m.Asset.AvatarLooks || void 0 === f && e === m.Asset.Showcase) return k;
                let t = I.default.getValidMenuState(L, k, c, n, void 0, void 0, p, h, v, f);
                if (t !== k) {
                    if (!j) {
                        let e = (0, es.isOnItemTab)(t.menuItem.type) ? 0 : void 0;
                        l({
                            activeTab: I.default.getAssetType(t),
                            filterIndex: e
                        })
                    }
                    return t
                }
                return k
            }, [L, k, j, o.activeTab, c, n, p, h, v, f, l]), U = (0, u.useMemo)(() => I.default.getAssetType(O), [O]);
            (0, u.useEffect)(() => {
                if (void 0 === A.current) {
                    A.current = U;
                    return
                }
                let e = A.current;
                e !== U && (A.current = U, S && (0, V.isDevelopmentItemAsset)(e) && (0, V.isDevelopmentItemAsset)(U) || d())
            }, [U, S, d]);
            let B = U === m.Asset.MyExperiences || U === m.Asset.SharedExperiences,
                z = (0, u.useMemo)(() => null == r ? void 0 : r.has(U), [U, r]),
                F = z && !(0, g.isAvatarLooksActiveTab)(o.activeTab),
                q = S && (0, V.isDevelopmentItemAsset)(U),
                G = (0, u.useMemo)(() => {
                    var e, t;
                    return q ? (0, i.jsx)(aL, {
                        groupId: null == n ? void 0 : n.id,
                        useTabNavigationSpacing: !1,
                        userId: null == a ? void 0 : a.id
                    }) : U === m.Asset.Decal ? (0, i.jsx)(aC, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.Animation ? (0, i.jsx)(aT, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.Audio || U === m.Asset.Video ? (0, i.jsx)(aw, {
                        mediaAssetType: U,
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.Plugin ? (0, i.jsx)(aM, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.Model ? (0, i.jsx)(aA, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.MeshPart ? (0, i.jsx)(aS, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.ShareLink ? (0, i.jsx)(aP, {}) : U === m.Asset.Moments ? (0, i.jsx)(ag, {}) : U === m.Asset.AssetPermissionRequests ? (0, i.jsx)(aN, {}) : U === m.Asset.Showcase ? (0, i.jsx)(aj, {
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.AllCatalogAsset || U === m.Asset.AvatarLooks || U === m.Asset.AvatarBackground ? (0, i.jsx)(aI, {
                        assetType: U,
                        groupId: null == n ? void 0 : n.id
                    }) : U === m.Asset.Image || U === m.Asset.Mesh ? (0, i.jsx)(aE, {
                        primitiveAssetType: U,
                        groupId: null == n ? void 0 : n.id
                    }) : z ? (0, i.jsx)(aI, {
                        assetType: U,
                        groupId: null == n ? void 0 : n.id
                    }) : (0, i.jsx)(ak, {
                        assetType: U,
                        creatorType: (null == n ? void 0 : n.id) ? Y.SearchCreatorType.Group : Y.SearchCreatorType.User,
                        creatorTargetId: null != (e = null != (t = null == n ? void 0 : n.id) ? t : null == a ? void 0 : a.id) ? e : 0
                    })
                }, [U, null == n ? void 0 : n.id, null == a ? void 0 : a.id, z, q]);
            return (0, i.jsxs)(et.default, {
                children: [(0, i.jsx)(J.HubMeta, {
                    title: (0, J.buildTitle)(T(O.submenuItem ? O.submenuItem.nameKey : O.menuItem.nameKey)),
                    breadcrumb: (0, J.buildBreadcrumb)(T("Heading.Creations"), T(O.menuItem.nameKey), O.submenuItem ? T(O.submenuItem.nameKey) : void 0)
                }), (0, i.jsx)("section", {
                    className: N,
                    children: (0, i.jsxs)(X.Grid, {
                        container: !0,
                        direction: "column",
                        className: R,
                        children: [(0, i.jsx)(Z.AgeVerificationUpsellBanner, {
                            trackingPage: Z.AgeVerificationUpsellPage.Creations
                        }), !q && (0, i.jsx)(i_, {
                            menuState: O,
                            onMenuStateChange: D,
                            verificationMetadata: t,
                            group: n
                        }), B && (0, i.jsx)($.default, {}), F && (0, i.jsx)(ea, {}), F && (0, i.jsx)(ei, {}), G]
                    })
                })]
            })
        }, [B.TranslationNamespace.AssetTypes, B.TranslationNamespace.Controls, B.TranslationNamespace.Creations, B.TranslationNamespace.Error, B.TranslationNamespace.Navigation, B.TranslationNamespace.ShareLinksManagement, B.TranslationNamespace.ExperienceReleases, B.TranslationNamespace.Taxonomy]),
        aO = () => {
            let e = (0, f.useCurrentGroup)(),
                {
                    user: t
                } = (0, F.useAuthentication)(),
                n = (0, W.default)(),
                [a, s] = (0, u.useState)(void 0);
            return (0, u.useEffect)(() => {
                (0, y.getAllowedMarketplaceItemTypes)().then(e => {
                    let {
                        assetTypes: t
                    } = e;
                    s(t)
                })
            }, []), (0, i.jsx)(K, {
                children: (0, i.jsx)(aD, {
                    verificationMetadata: n,
                    currentGroup: e,
                    currentUser: t,
                    allowedAssetTypes: a
                })
            })
        };
    var aU = e.i(675330),
        aB = e.i(177608);
    let az = e => {
            var t;
            let n, {
                    children: r
                } = e,
                l = (0, a.useRouter)(),
                u = E() && (0, V.isDevelopmentItemAsset)(null != (n = Array.isArray(t = l.query.activeTab) ? t[0] : t) && (0, p.isValidEnumValue)(m.Asset, n) ? n : m.Asset.MyExperiences);
            return (0, i.jsx)(aB.default, {
                title: u ? (0, i.jsx)(z, {}) : (0, i.jsx)(s.Translate, {
                    namespace: "CreatorDashboard.Navigation",
                    translationKey: "Heading.Creations"
                }),
                secondaryRail: (0, i.jsx)(A, {}),
                secondarySize: "small",
                noBreadCrumbs: !0,
                children: (0, i.jsx)(o.default, {
                    children: r
                })
            })
        },
        aV = () => (0, i.jsx)(l.default, {
            children: (0, i.jsx)(aU.default, {
                children: (0, i.jsx)(r.default, {
                    children: (0, i.jsx)(aO, {})
                })
            })
        });
    aV.getPageLayout = e => (0, i.jsx)(az, {
        children: e
    }), aV.loggerConfig = {
        rosId: "3539"
    }, e.s(["default", 0, aV], 962059)
}, 748348, (e, t, n) => {
    let i = "/dashboard/creations";
    (window.__NEXT_P = window.__NEXT_P || []).push([i, () => e.r(962059)]), t.hot && t.hot.dispose(function() {
        window.__NEXT_P.push([i])
    })
}]);

//# debugId=da33ddcc-266d-e908-8f2d-50652a9dccef
//# sourceMappingURL=3dmr5i4myh4rv.js.map