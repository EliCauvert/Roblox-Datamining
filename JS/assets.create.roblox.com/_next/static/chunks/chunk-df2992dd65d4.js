;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9b5ddc4c-adc7-f153-fc1e-0bd0669fcef6")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 962059, e => {
    "use strict";
    var t, n, i = e.i(221628),
        a = e.i(416340),
        s = e.i(79187),
        o = e.i(203450),
        r = e.i(384621),
        l = e.i(138726),
        d = e.i(237401),
        u = e.i(692734),
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
            } = (0, u.useFlag)(T.isMomentsUploadEnabled);
            if (e) return t
        },
        w = "creation-",
        S = {
            [m.Asset.Place]: "Label.Experiences",
            [m.Asset.ShareLink]: "Heading.ShareLinks",
            [m.Asset.TShirt]: "Label.AvatarItems",
            [m.Asset.Decal]: "Label.DevelopmentItems",
            [m.Asset.Moments]: "Label.Moments"
        };

    function A() {
        let e = (0, d.useRouter)(),
            {
                translate: t
            } = (0, s.useTranslation)(),
            {
                settings: n
            } = (0, x.useSettings)(),
            i = (0, f.useCurrentGroup)(),
            o = C(),
            {
                value: r
            } = (0, u.useFlag)(c.isAssetAccessRequestsEnabled),
            l = (0, b.default)(),
            v = (0, a.useMemo)(() => (t, n) => {
                let i = new URLSearchParams,
                    a = (0, h.readQueryValue)(e.query.groupId);
                a && i.set("groupId", a), t && i.set("activeTab", t), void 0 !== n && i.set("filterIndex", String(n));
                let s = i.toString();
                return s ? "/dashboard/creations?".concat(s) : "/dashboard/creations"
            }, [e.query.groupId]),
            T = (0, a.useMemo)(() => y.default.filter(e => e.type !== m.Asset.AssetPermissionRequests || r).filter(e => I.default.isMenuItemEnabled(e, n, i, void 0, void 0, o)).map(e => {
                var n, i, a;
                let s = null != (n = null == (a = e.submenuItems) || null == (i = a[0]) ? void 0 : i.type) ? n : e.type,
                    o = S[e.type],
                    r = e.type === m.Asset.TShirt,
                    d = l ? g.AVATAR_ITEMS_ACTIVE_TAB : m.Asset.AvatarLooks;
                return {
                    key: "".concat(w).concat(e.type),
                    label: o ? t(o) : t(e.nameKey),
                    href: e.type === m.Asset.Place ? v() : v(r ? d : s, r ? 0 : void 0)
                }
            }), [v, i, r, o, l, n, t]),
            A = (0, a.useMemo)(() => {
                var t;
                let n, i = (0, g.isTaxonomyActiveTab)(e.query.activeTab) || (0, g.isRecentsActiveTab)(e.query.activeTab),
                    a = I.default.getMenuState(i ? g.TAXONOMY_HOST_ASSET : (t = e.query.activeTab, void 0 !== (n = (0, h.readQueryValue)(t)) && (0, p.isValidEnumValue)(m.Asset, n) ? n : void 0), []);
                return "".concat(w).concat(a.menuItem.type)
            }, [e.query.activeTab]);
        return {
            activeItem: (0, a.useMemo)(() => T.find(e => e.key === A), [A, T]),
            activeKey: A,
            items: T
        }
    }
    let M = () => {
            let {
                translate: e
            } = (0, s.useTranslation)(), {
                activeKey: t,
                items: n
            } = A();
            return (0, i.jsx)(v.default, {
                header: e("Heading.Creations"),
                activeKey: t,
                items: n
            })
        },
        j = (0, a.createContext)({
            isResolving: !1
        });
    var E = e.i(814975),
        P = e.i(252842),
        k = e.i(533414),
        L = e.i(456810);
    let R = {
            sort: L.defaultAssetsSort,
            sortOrder: P.SortOrder.Desc,
            isArchived: !1,
            isPublishOnly: !1,
            isOnMarketplace: !1
        },
        N = e => {
            let {
                children: t
            } = e, {
                user: n
            } = (0, E.useAuthentication)(), [s, o] = (0, k.useLocalStorage)("creationSort.".concat(null == n ? void 0 : n.id), R.sort), r = (0, a.useRef)(s), l = (0, a.useMemo)(() => {
                let e = r.current;
                return Object.keys(s).some(t => s[t] !== e[t]) && (r.current = s), r.current
            }, [s]), [d, u] = (0, k.useLocalStorage)("creationSortOrder.".concat(null == n ? void 0 : n.id), R.sortOrder), [c, m] = (0, a.useState)(R.isArchived), [p, h] = (0, a.useState)(!1), [v, f] = (0, a.useState)(R.isPublishOnly), [x, g] = (0, a.useState)(R.isOnMarketplace), b = (0, a.useCallback)(() => {
                o(R.sort), u(R.sortOrder), m(R.isArchived), h(!1), f(R.isPublishOnly), g(R.isOnMarketplace)
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
            return (0, i.jsx)(L.default.Provider, {
                value: y,
                children: t
            })
        };
    var D = e.i(668091),
        O = e.i(109182),
        U = e.i(959222),
        B = e.i(37819),
        z = e.i(169722),
        V = e.i(714039),
        F = e.i(686197),
        q = e.i(780880),
        G = e.i(881670),
        _ = e.i(845592),
        H = e.i(418564);
    let K = () => {
            let {
                translate: e
            } = (0, s.useTranslation)(), {
                settings: t
            } = (0, x.useSettings)();
            return t.enableUgcUploadPublishBlockBanner ? (0, i.jsx)(H.default, {
                alertTitle: e("Heading.UgcUploadPublishBlockTitle"),
                alertDescription: e("Label.UgcUploadPublishBlock"),
                severity: "warning",
                externalLink: void 0,
                linkLabel: void 0,
                allowCloseDialog: !0
            }) : null
        },
        W = () => {
            let {
                translate: e
            } = (0, s.useTranslation)(), {
                settings: t
            } = (0, x.useSettings)();
            return t.enable2D3DUnificationBanner ? (0, i.jsx)("div", {
                className: "margin-bottom-[32px]",
                children: (0, i.jsx)(H.default, {
                    alertTitle: void 0,
                    alertDescription: e("Label.2D3DUnificationBanner"),
                    severity: "info",
                    externalLink: t.unification2D3DBannerLearnMoreUrl || void 0,
                    linkLabel: e("Label.LearnMore"),
                    allowCloseDialog: !0
                })
            }) : null
        };
    var Y = e.i(339544),
        Q = e.i(475642),
        J = e.i(211461),
        X = e.i(608972),
        Z = e.i(956728),
        $ = e.i(978989),
        ee = e.i(211388);
    let et = "CreatorHub.MomentsCreations.local",
        en = e => "".concat(et, ".").concat(e),
        ei = "".concat(et, ".__inactive__"),
        ea = "active",
        es = "pending",
        eo = "draft",
        er = "moderated",
        el = [ea, eo],
        ed = e => new Date(e.modifiedAt).getTime(),
        eu = "momentMedia",
        ec = async e => {
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
        }, em = new Map, ep = (e, t) => "".concat(e, ":").concat(t), eh = (e, t, n) => new Promise((t, n) => {
            if ("u" < typeof indexedDB) return void n(Error("IndexedDB is unavailable"));
            let i = indexedDB.open("".concat("CreatorHub.MomentsVideoMedia", ".").concat(e), 1);
            i.addEventListener("upgradeneeded", () => {
                let e = i.result;
                e.objectStoreNames.contains(eu) || e.createObjectStore(eu, {
                    keyPath: "momentId"
                })
            }), i.addEventListener("success", () => t(i.result)), i.addEventListener("error", () => {
                var e;
                return n(null != (e = i.error) ? e : Error("Failed to open IndexedDB"))
            })
        }).then(e => new Promise((i, a) => {
            let s = n(e.transaction(eu, t).objectStore(eu));
            s.addEventListener("success", () => i(s.result)), s.addEventListener("error", () => {
                var e;
                return a(null != (e = s.error) ? e : Error("IndexedDB request failed"))
            })
        })), ev = e => "object" == typeof e && null !== e && "momentId" in e && "string" == typeof e.momentId && "videoBlob" in e && e.videoBlob instanceof Blob && "thumbnailBlob" in e && e.thumbnailBlob instanceof Blob && "updatedAt" in e && "string" == typeof e.updatedAt, ef = (e, t) => {
            let n = ep(e, t),
                i = em.get(n);
            i && (URL.revokeObjectURL(i.thumbnailUrl), URL.revokeObjectURL(i.videoUrl), em.delete(n))
        }, ex = async (e, t, n) => {
            let i = await ec(n),
                a = {
                    momentId: t,
                    videoBlob: n,
                    thumbnailBlob: i,
                    fileName: n.name,
                    updatedAt: new Date().toISOString()
                };
            ef(e, t), await eh(e, "readwrite", e => e.put(a))
        }, eg = new Set(["QuotaExceededError", "NS_ERROR_DOM_QUOTA_REACHED"]), eb = e => !!(e instanceof DOMException && eg.has(e.name)) || e instanceof Error && e.message.toLowerCase().includes("quota"), ey = async (e, t, n, i) => {
            let a = [],
                s = async () => {
                    await ex(e, t, n)
                };
            try {
                return await s(), {
                    evictedMediaDraftIds: a
                }
            } catch (e) {
                if (!eb(e)) throw e
            }
            for (let n of [...i.filter(e => e.draftId !== t && !1 !== e.hasLocalVideo)].sort((e, t) => ed(e) - ed(t))) {
                await eC(e, [n.draftId]), a.includes(n.draftId) || a.push(n.draftId);
                try {
                    return await s(), {
                        evictedMediaDraftIds: a
                    }
                } catch (e) {
                    if (!eb(e)) throw e
                }
            }
            throw Error("Failed to store moment video locally")
        };
    async function eI(e, t) {
        var n, i;
        let a, s = await eh(e, "readonly", e => e.get(t));
        if (!ev(s)) return null;
        let {
            videoBlob: o
        } = s;
        return new File([o], (a = null == (i = (n = s).fileName) ? void 0 : i.trim()) ? a : n.videoBlob.type.includes("quicktime") ? "moment.mov" : "moment.mp4", {
            type: o.type || "video/mp4"
        })
    }
    let eT = async (e, t) => {
        let n = ep(e, t),
            i = em.get(n);
        if (i) return i;
        let a = await eh(e, "readonly", e => e.get(t));
        if (!ev(a)) return null;
        let s = {
            thumbnailUrl: URL.createObjectURL(a.thumbnailBlob),
            videoUrl: URL.createObjectURL(a.videoBlob)
        };
        return em.set(n, s), s
    }, eC = async (e, t) => {
        0 !== t.length && await Promise.all(t.map(async t => {
            ef(e, t), await eh(e, "readwrite", e => e.delete(t))
        }))
    }, ew = {
        version: "1",
        moments: []
    }, eS = e => "object" == typeof e && null !== e && !Array.isArray(e), eA = e => eS(e) && "1" === e.version && Array.isArray(e.moments) ? e.moments : [], eM = e => "string" == typeof e ? e : void 0, ej = e => "number" == typeof e && Number.isFinite(e) ? e : void 0, eE = new Set(Object.values(s.Locale)), eP = e => eA(e).map(e => (e => {
        var t, n, i, a, s, o;
        let r;
        if (!eS(e)) return null;
        let l = null != (t = eM(e.draftId)) ? t : eM(e.id);
        return null == l || "" === l || e.status !== eo ? null : {
            draftId: l,
            status: eo,
            experienceId: null != (n = ej(e.experienceId)) ? n : 0,
            rootPlaceId: ej(e.rootPlaceId),
            experienceName: null != (i = eM(e.experienceName)) ? i : "",
            description: null != (a = eM(e.description)) ? a : "",
            modifiedAt: null != (s = eM(e.modifiedAt)) ? s : new Date(0).toISOString(),
            assetId: ej(e.assetId),
            thumbnailUrl: eM(e.thumbnailUrl),
            videoUrl: eM(e.videoUrl),
            universeId: ej(e.universeId),
            locale: "string" == typeof(r = o = e.locale) && eE.has(r) ? o : void 0,
            ..."boolean" == typeof e.hasLocalVideo ? {
                hasLocalVideo: e.hasLocalVideo
            } : {}
        }
    })(e)).filter(e => null != e), ek = e => {
        if (!e) return [];
        try {
            let t = JSON.parse(e);
            return eP(t)
        } catch (e) {
            return []
        }
    }, eL = e => ({
        version: "1",
        moments: e
    }), eR = () => {
        let {
            user: e
        } = (0, E.useAuthentication)(), t = null == e ? void 0 : e.id, n = null != t, i = n ? en(t) : ei, [s, o] = (0, k.useLocalStorage)(i, ew), r = (0, a.useMemo)(() => n ? eP(s) : [], [n, s]);
        (0, a.useEffect)(() => {
            if (!n || null == t) return;
            let e = eA(s).filter(e => eS(e) && e.status !== eo).map(e => {
                var t, n;
                return eS(e) && null != (t = null != (n = eM(e.draftId)) ? n : eM(e.id)) ? t : ""
            }).filter(e => "" !== e);
            0 !== e.length && (o(eL(r)), eC(t, e))
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
                } = (l = ek(window.localStorage.getItem(i)), {
                    moments: [...e.map(e => {
                        var t;
                        return {
                            ...e,
                            status: eo,
                            hasLocalVideo: null == (t = e.hasLocalVideo) || t
                        }
                    }), ...l].sort((e, t) => ed(t) - ed(e)),
                    evictedMediaDraftIds: []
                }), c = ((e, t) => {
                    if (0 === t.length) return [...e];
                    let n = new Set(t);
                    return e.map(e => n.has(e.draftId) ? {
                        ...e,
                        hasLocalVideo: !1
                    } : e)
                })(d, null != (s = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? s : []), m = [...new Set([...null != (r = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? r : [], ...u])];
                return o(eL(c)), m.length > 0 && eC(t, m), {
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
                return a ? (o(eL(a)), a) : null
            }, [n, r, o, t]),
            c = (0, a.useCallback)(e => {
                if (!n || null == t) return null;
                let i = -1 === r.findIndex(t => t.draftId === e) ? null : r.filter(t => t.draftId !== e);
                return i ? (o(eL(i)), eC(t, [e]), i) : null
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
                return o(eL(i)), eC(t, s), i
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
    var eN = e.i(795621),
        eD = e.i(711367),
        eO = e.i(630986),
        eU = e.i(182012),
        eB = e.i(677753),
        ez = function(e, t) {
            return (ez = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function eV(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        ez(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function eF(e, t, n, i) {
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

    function eq(e, t) {
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

    function eG(e) {
        if (void 0 !== e) return null === e ? null : {
            chunkNum: e.chunkNum,
            eTag: e.eTag
        }
    }

    function e_(e) {
        if (void 0 !== e) return null === e ? null : {
            role: e.role,
            operationId: e.operationId,
            parts: void 0 === e.parts ? void 0 : null === e.parts ? null : e.parts.map(eG)
        }
    }

    function eH(e) {
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

    function eK(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function eW(e) {
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

    function eY(e) {
        if (void 0 !== e) return null === e ? null : {}
    }

    function eQ(e) {
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

    function eJ(e, t) {
        return null == e ? e : {
            assetId: (0, eB.exists)(e, "assetId") ? e.assetId : void 0,
            startTime: (0, eB.exists)(e, "startTime") ? e.startTime : void 0
        }
    }

    function eX(e) {
        var t;
        return null == (t = e) ? t : {
            position: (0, eB.exists)(t, "position") ? t.position : void 0,
            rotation: (0, eB.exists)(t, "rotation") ? t.rotation : void 0,
            stickerSize: (0, eB.exists)(t, "stickerSize") ? t.stickerSize : void 0,
            scale: (0, eB.exists)(t, "scale") ? t.scale : void 0,
            stickerURI: (0, eB.exists)(t, "stickerURI") ? t.stickerURI : void 0,
            zIndex: (0, eB.exists)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function eZ(e) {
        if (void 0 !== e) return null === e ? null : {
            position: e.position,
            rotation: e.rotation,
            stickerSize: e.stickerSize,
            scale: e.scale,
            stickerURI: e.stickerURI,
            zIndex: e.zIndex
        }
    }

    function e$(e) {
        var t, n;
        return null == (t = e) ? t : {
            position: (0, eB.exists)(t, "position") ? t.position : void 0,
            rotation: (0, eB.exists)(t, "rotation") ? t.rotation : void 0,
            scale: (0, eB.exists)(t, "scale") ? t.scale : void 0,
            text: (0, eB.exists)(t, "text") ? t.text : void 0,
            textOverlayStyle: (0, eB.exists)(t, "textOverlayStyle") ? null == (n = t.textOverlayStyle) ? n : {
                font: (0, eB.exists)(n, "font") ? n.font : void 0,
                fontColor: (0, eB.exists)(n, "fontColor") ? n.fontColor : void 0,
                fontSize: (0, eB.exists)(n, "fontSize") ? n.fontSize : void 0,
                textXAlignment: (0, eB.exists)(n, "textXAlignment") ? n.textXAlignment : void 0
            } : void 0,
            zIndex: (0, eB.exists)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function e0(e) {
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

    function e1(e) {
        var t;
        return null == (t = e) ? t : {
            httpVerb: (0, eB.exists)(t, "httpVerb") ? t.httpVerb : void 0,
            url: (0, eB.exists)(t, "url") ? t.url : void 0,
            chunkNum: (0, eB.exists)(t, "chunkNum") ? t.chunkNum : void 0,
            contentStart: (0, eB.exists)(t, "contentStart") ? t.contentStart : void 0,
            contentLength: (0, eB.exists)(t, "contentLength") ? t.contentLength : void 0,
            expirationTimeMs: (0, eB.exists)(t, "expirationTimeMs") ? t.expirationTimeMs : void 0
        }
    }

    function e2(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eB.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eB.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eB.exists)(t, "operationPath") ? t.operationPath : void 0,
            uploadUrls: (0, eB.exists)(t, "uploadUrls") ? null === t.uploadUrls ? null : t.uploadUrls.map(e1) : void 0
        }
    }

    function e4(e, t) {
        var n, i, a;
        return null == e ? e : {
            assetId: (0, eB.exists)(e, "assetId") ? e.assetId : void 0,
            assetAccessContext: (0, eB.exists)(e, "assetAccessContext") ? e.assetAccessContext : void 0,
            assetTotalDuration: (0, eB.exists)(e, "assetTotalDuration") ? e.assetTotalDuration : void 0,
            caption: (0, eB.exists)(e, "caption") ? e.caption : void 0,
            videoContentLanguage: (0, eB.exists)(e, "videoContentLanguage") ? e.videoContentLanguage : void 0,
            partnerUploadType: (0, eB.exists)(e, "partnerUploadType") ? e.partnerUploadType : void 0,
            captureType: (0, eB.exists)(e, "captureType") ? e.captureType : void 0,
            editsType: (0, eB.exists)(e, "editsType") ? e.editsType : void 0,
            videoCaptureEdits: (0, eB.exists)(e, "videoCaptureEdits") ? null == (n = e.videoCaptureEdits) ? n : {
                trim: (0, eB.exists)(n, "trim") ? null == (i = n.trim) ? i : {
                    startTime: (0, eB.exists)(i, "startTime") ? i.startTime : void 0,
                    endTime: (0, eB.exists)(i, "endTime") ? i.endTime : void 0
                } : void 0,
                music: (0, eB.exists)(n, "music") ? eJ(n.music) : void 0,
                textOverlays: (0, eB.exists)(n, "textOverlays") ? null === n.textOverlays ? null : n.textOverlays.map(e$) : void 0,
                stickerOverlays: (0, eB.exists)(n, "stickerOverlays") ? null === n.stickerOverlays ? null : n.stickerOverlays.map(eX) : void 0
            } : void 0,
            screenshotCaptureEdits: (0, eB.exists)(e, "screenshotCaptureEdits") ? null == (a = e.screenshotCaptureEdits) ? a : {
                music: (0, eB.exists)(a, "music") ? eJ(a.music) : void 0,
                textOverlays: (0, eB.exists)(a, "textOverlays") ? null === a.textOverlays ? null : a.textOverlays.map(e$) : void 0
            } : void 0
        }
    }

    function e5(e, t) {
        var n;
        return null == e ? e : {
            status: (0, eB.exists)(e, "status") ? e.status : void 0,
            result: (0, eB.exists)(e, "result") ? null == (n = e.result) ? n : {
                assetId: (0, eB.exists)(n, "assetId") ? n.assetId : void 0,
                isApproved: (0, eB.exists)(n, "isApproved") ? n.isApproved : void 0,
                operationError: (0, eB.exists)(n, "operationError") ? n.operationError : void 0
            } : void 0
        }
    }

    function e3(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eB.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eB.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eB.exists)(t, "operationPath") ? t.operationPath : void 0,
            done: (0, eB.exists)(t, "done") ? t.done : void 0
        }
    }

    function e7(e, t) {
        return null == e ? e : {
            generationToken: (0, eB.exists)(e, "generationToken") ? e.generationToken : void 0
        }
    }

    function e8(e, t) {
        return null == e ? e : {
            type: (0, eB.exists)(e, "type") ? e.type : void 0,
            id: (0, eB.exists)(e, "id") ? e.id : void 0
        }
    }

    function e9(e, t) {
        return null == e ? e : {
            counts: (0, eB.exists)(e, "counts") ? e.counts : void 0,
            userReaction: (0, eB.exists)(e, "userReaction") ? e.userReaction : void 0
        }
    }

    function e6(e, t) {
        return null == e ? e : {
            shareCount: (0, eB.exists)(e, "shareCount") ? e.shareCount : void 0
        }
    }

    function te(e, t) {
        var n;
        return null == e ? e : {
            type: (0, eB.exists)(e, "type") ? e.type : void 0,
            experienceCta: (0, eB.exists)(e, "experienceCta") ? null == (n = e.experienceCta) ? n : {
                experienceId: (0, eB.exists)(n, "experienceId") ? n.experienceId : void 0,
                placeId: (0, eB.exists)(n, "placeId") ? n.placeId : void 0
            } : void 0
        }
    }

    function tt(e) {
        var t;
        return null == (t = e) ? t : {
            feedSessionId: (0, eB.exists)(t, "feedSessionId") ? t.feedSessionId : void 0,
            entityId: (0, eB.exists)(t, "entityId") ? t.entityId : void 0,
            entityType: (0, eB.exists)(t, "entityType") ? t.entityType : void 0,
            id: (0, eB.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eB.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            type: (0, eB.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eB.exists)(t, "captionedAssetMoment") ? e4(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eB.exists)(t, "primaryCta") ? te(t.primaryCta) : void 0,
            owner: (0, eB.exists)(t, "owner") ? e8(t.owner) : void 0,
            visibilityStatus: (0, eB.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eB.exists)(t, "reactions") ? e9(t.reactions) : void 0,
            stats: (0, eB.exists)(t, "stats") ? e6(t.stats) : void 0
        }
    }

    function tn(e, t) {
        return null == e ? e : {
            feedItems: (0, eB.exists)(e, "feedItems") ? e.feedItems : void 0,
            loaded: (0, eB.exists)(e, "loaded") ? e.loaded : void 0,
            failed: (0, eB.exists)(e, "failed") ? e.failed : void 0,
            moderated: (0, eB.exists)(e, "moderated") ? e.moderated : void 0
        }
    }

    function ti(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, eB.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eB.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            type: (0, eB.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eB.exists)(t, "captionedAssetMoment") ? e4(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eB.exists)(t, "primaryCta") ? te(t.primaryCta) : void 0,
            owner: (0, eB.exists)(t, "owner") ? e8(t.owner) : void 0,
            visibilityStatus: (0, eB.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eB.exists)(t, "reactions") ? e9(t.reactions) : void 0,
            stats: (0, eB.exists)(t, "stats") ? e6(t.stats) : void 0
        }
    }

    function ta(e, t) {
        return null == e ? e : {
            signingAlgorithmVersion: (0, eB.exists)(e, "signingAlgorithmVersion") ? e.signingAlgorithmVersion : void 0,
            signature: (0, eB.exists)(e, "signature") ? e.signature : void 0
        }
    }
    var ts = eB.BaseAPI;

    function to() {
        return null !== ts && ts.apply(this, arguments) || this
    }
    eV(to, ts), to.prototype.backfillTriggerB1Raw = function(e, t) {
        return eF(this, void 0, void 0, function() {
            var n, i, a;
            return eq(this, function(s) {
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
                        return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                }
            })
        })
    }, to.prototype.backfillTriggerB1 = function() {
        return eF(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), eq(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.backfillTriggerB1Raw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var tr = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eV(t, e), t.prototype.contentCapturesBatchCheckExperienceUploadabilityRaw = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesBatchCheckExperienceUploadability = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesBatchCheckExperienceUploadabilityRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibilityRaw = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isEligible: (0, eB.exists)(e, "isEligible") ? e.isEligible : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibility = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    return e5(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatus = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    return e5(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatusRcc = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a, s;
                    return eq(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eB.canConsumeForm)([{
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
                                return s = o.sent(), [2, new eB.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        operationId: (0, eB.exists)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCreateInfluencerMomentFromVideo = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesGrantExperiencePermissions = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesGrantExperiencePermissionsRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadataRaw = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    return ta(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadata = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a, s;
                    return eq(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eB.canConsumeForm)([{
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
                                return s = o.sent(), [2, new eB.JSONApiResponse(s, function(e) {
                                    return ta(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignFileAndMetadataInternal = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(e0),
                                                                    stickerOverlays: void 0 === e.stickerOverlays ? void 0 : null === e.stickerOverlays ? null : e.stickerOverlays.map(eZ)
                                                                }
                                                            }(e.edits)
                                                        }
                                                    }(e.metadata),
                                                    feedRegistrationInfo: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            attributes: void 0 === e.attributes ? void 0 : null === e.attributes ? null : e.attributes.map(eQ),
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
                                return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesUploadCaptureWithAsset = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesUploadCaptureWithAssetRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(eB.BaseAPI),
        tl = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            eV(t, e), t.prototype.moderationApplyModerationDecisionRaw = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationApplyModerationDecision = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationApplyModerationDecisionRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.moderationEnrichReportRaw = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                            custom: void 0 === e.custom ? void 0 : null === e.custom ? null : (0, eB.mapValues)(e.custom, eY)
                                        }
                                    }(e.moderationEnrichReportRequest)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationEnrichReport = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationEnrichReportRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.moderationReportMomentRaw = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eB.RequiredError("momentId", "Required parameter requestParameters.momentId was null or undefined when calling moderationReportMoment.");
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
                                return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationReportMoment = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    return eq(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationReportMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(eB.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            eV(t, e), t.prototype.momentTextGenerationCreateMomentVideoUploadUrlRaw = function(e) {
                return eF(this, void 0, void 0, function() {
                    var t, n, i;
                    return eq(this, function(a) {
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
                                return i = a.sent(), [2, new eB.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        uploadUrl: (0, eB.exists)(e, "uploadUrl") ? e.uploadUrl : void 0,
                                        videoObjectKey: (0, eB.exists)(e, "videoObjectKey") ? e.videoObjectKey : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationCreateMomentVideoUploadUrl = function(e) {
                return eF(this, void 0, void 0, function() {
                    return eq(this, function(t) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    return e7(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentText = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    return e7(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentTextWithVideo = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        status: (0, eB.exists)(e, "status") ? e.status : void 0,
                                        result: (0, eB.exists)(e, "result") ? null == (t = e.result) ? t : {
                                            summary: (0, eB.exists)(t, "summary") ? t.summary : void 0,
                                            description: (0, eB.exists)(t, "description") ? t.description : void 0,
                                            error: (0, eB.exists)(t, "error") ? t.error : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGetMomentTextGenerationStatus = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
        }(eB.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eV(t, e), t.prototype.momentsCleanUserDataRaw = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        notificationId: (0, eB.exists)(e, "NotificationId") ? e.NotificationId : void 0,
                                        eventType: (0, eB.exists)(e, "EventType") ? e.EventType : void 0,
                                        eventTime: (0, eB.exists)(e, "EventTime") ? new Date(e.EventTime) : void 0,
                                        eventPayload: (0, eB.exists)(e, "EventPayload") ? null == (t = e.EventPayload) ? t : {
                                            userId: (0, eB.exists)(t, "UserId") ? t.UserId : void 0,
                                            gameIds: (0, eB.exists)(t, "GameIds") ? t.GameIds : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsCleanUserData = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eB.RequiredError("momentId", "Required parameter requestParameters.momentId was null or undefined when calling momentsDeleteMoment.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/{momentId}".replace("{".concat("momentId", "}"), encodeURIComponent(String(e.momentId))),
                                    schemaPath: "/v2/moments/{momentId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMoment = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    return eq(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItemRaw = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.feedItemId || void 0 === e.feedItemId) throw new eB.RequiredError("feedItemId", "Required parameter requestParameters.feedItemId was null or undefined when calling momentsDeleteMomentByFeedItem.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/by-feed-item/{feedItemId}".replace("{".concat("feedItemId", "}"), encodeURIComponent(String(e.feedItemId))),
                                    schemaPath: "/v2/moments/by-feed-item/{feedItemId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItem = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    return eq(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentByFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendationsRaw = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eB.exists)(e, "items") ? null === e.items ? null : e.items.map(tt) : void 0,
                                        paginationContext: (0, eB.exists)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, eB.exists)(e, "metadata") ? tn(e.metadata) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendations = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eB.exists)(e, "items") ? null === e.items ? null : e.items.map(ti) : void 0,
                                        failedMomentIds: (0, eB.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eB.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMoments = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eB.exists)(e, "items") ? null === e.items ? null : e.items.map(ti) : void 0,
                                        failedMomentIds: (0, eB.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eB.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0,
                                        paginationContext: (0, eB.exists)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, eB.exists)(e, "metadata") ? tn(e.metadata) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetUsersMoments = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
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
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItem = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2Raw = function(e, t) {
                return eF(this, void 0, void 0, function() {
                    var n, i, a;
                    return eq(this, function(s) {
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
                                return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2 = function() {
                return eF(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eq(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemV2Raw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(eB.BaseAPI));
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        eV(t, e), t.prototype.postsCompletePostRaw = function(e, t) {
            return eF(this, void 0, void 0, function() {
                var n, i, a;
                return eq(this, function(s) {
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
                                        uploads: void 0 === e.uploads ? void 0 : null === e.uploads ? null : e.uploads.map(e_)
                                    }
                                }(e.postsCompletePostRequest)
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    uploads: (0, eB.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(e3) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.postsCompletePost = function() {
            return eF(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eq(this, function(n) {
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
            return eF(this, void 0, void 0, function() {
                var n, i, a;
                return eq(this, function(s) {
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
                                                textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(eW)
                                            }
                                        }(e.common),
                                        videoPost: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                video: eH(e.video),
                                                durationSeconds: e.durationSeconds,
                                                trim: eK(e.trim)
                                            }
                                        }(e.videoPost),
                                        screenshotPost: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                screenshot: eH(e.screenshot),
                                                widthPixels: e.widthPixels,
                                                heightPixels: e.heightPixels
                                            }
                                        }(e.screenshotPost),
                                        influencerVideoPost: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                video: eH(e.video),
                                                durationSeconds: e.durationSeconds,
                                                trim: eK(e.trim)
                                            }
                                        }(e.influencerVideoPost)
                                    }
                                }(e.postsCreatePostRequest)
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new eB.JSONApiResponse(a, function(e) {
                                var t;
                                return null == e ? e : {
                                    post: (0, eB.exists)(e, "post") ? null == (t = e.post) ? t : {
                                        operationId: (0, eB.exists)(t, "operationId") ? t.operationId : void 0
                                    } : void 0,
                                    uploads: (0, eB.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(e2) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.postsCreatePost = function() {
            return eF(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eq(this, function(n) {
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
    })(eB.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        eV(t, e), t.prototype.testSeedCreatePostAssetRaw = function(e, t) {
            return eF(this, void 0, void 0, function() {
                var n, i, a;
                return eq(this, function(s) {
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
                            return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedCreatePostAsset = function() {
            return eF(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eq(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.testSeedCreatePostAssetRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.testSeedInspectPostRaw = function(e, t) {
            return eF(this, void 0, void 0, function() {
                var n, i, a;
                return eq(this, function(s) {
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
                            return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedInspectPost = function() {
            return eF(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eq(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.testSeedInspectPostRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.testSeedListUserMomentsRaw = function(e) {
            return eF(this, void 0, void 0, function() {
                var t, n, i;
                return eq(this, function(a) {
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
                            return i = a.sent(), [2, new eB.VoidApiResponse(i)]
                    }
                })
            })
        }, t.prototype.testSeedListUserMoments = function(e) {
            return eF(this, void 0, void 0, function() {
                return eq(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.testSeedListUserMomentsRaw(e)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, t.prototype.testSeedSeedBatchRaw = function(e, t) {
            return eF(this, void 0, void 0, function() {
                var n, i, a;
                return eq(this, function(s) {
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
                            return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedSeedBatch = function() {
            return eF(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eq(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.testSeedSeedBatchRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.testSeedSeedMomentRaw = function(e, t) {
            return eF(this, void 0, void 0, function() {
                var n, i, a;
                return eq(this, function(s) {
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
                            return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedSeedMoment = function() {
            return eF(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eq(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.testSeedSeedMomentRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.testSeedWirePostRaw = function(e, t) {
            return eF(this, void 0, void 0, function() {
                var n, i, a;
                return eq(this, function(s) {
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
                            return a = s.sent(), [2, new eB.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedWirePost = function() {
            return eF(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eq(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.testSeedWirePostRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }
    }(eB.BaseAPI);
    let td = (0, e.i(272593).createClientConfiguration)("content-captures-api", "bedev2"),
        tu = new tr(td),
        tc = new tl(td),
        tm = Object.assign(tu, {
            momentsGetUsersMoments: e => tc.momentsGetUsersMoments(e),
            momentsDeleteMoment: e => tc.momentsDeleteMoment(e),
            momentsDeleteMomentByFeedItem: e => tc.momentsDeleteMomentByFeedItem(e)
        });
    var tp = e.i(773057),
        th = e.i(227987),
        tv = e.i(889311),
        tf = e.i(215955),
        tx = ((t = {}).ListMoments = "listMoments", t.FetchNextPage = "fetchNextPage", t.UploadVideo = "uploadVideo", t.ValidateVideo = "validateVideo", t.PersistLocalVideo = "persistLocalVideo", t.PublishMoment = "publishMoment", t.DeleteMoment = "deleteMoment", t.ResolveExperience = "resolveExperience", t.LoadLocalVideoMedia = "loadLocalVideoMedia", t.EnrichExperienceNames = "enrichExperienceNames", t);
    let tg = (e, t) => {
            let n;
            return null != t.momentId && (e.momentId = t.momentId), null != t.feedItemId && (e.feedItemId = t.feedItemId), null != t.draftId && (e.draftId = t.draftId), null != t.experienceId && (e.experienceId = String(t.experienceId)), null != t.placeId && (e.placeId = String(t.placeId)), null != t.fileCount && (e.fileCount = String(t.fileCount)), null != t.fileSize && (e.fileSize = String(t.fileSize)), null != t.fileType && t.fileType.length > 0 && (e.fileType = t.fileType), null != t.locale && t.locale.length > 0 && (e.locale = t.locale), null != t.inputValue && t.inputValue.length > 0 && (e.inputValue = (n = t.inputValue).length <= 200 ? n : n.slice(0, 200)), null != t.idType && (e.idType = t.idType), null != t.matchedId && (e.matchedId = String(t.matchedId)), null != t.userId && (e.userId = String(t.userId)), null != t.pageCount && (e.pageCount = String(t.pageCount)), null != t.momentCount && (e.momentCount = String(t.momentCount)), null != t.persistedVideoCount && (e.persistedVideoCount = String(t.persistedVideoCount)), null != t.isLocalMoment && (e.isLocalMoment = String(t.isLocalMoment)), null != t.universeIdCount && (e.universeIdCount = String(t.universeIdCount)), e
        },
        tb = async (e, t) => {
            var n;
            let i = await (0, th.default)(e),
                a = e instanceof Error ? e.message : "string" == typeof e ? e : "Unknown error";
            return i ? {
                reason: null != (n = null != t ? t : i.message) ? n : a,
                httpStatus: i.status,
                errorCode: i.code
            } : {
                reason: null != t ? t : a
            }
        }, ty = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return {
                eventName: tv.default.MomentsCreationsError,
                parameters: tg({
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
        }, tI = async function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tf.default,
                a = await tb(t, n.reason);
            i.logErrorEvent(ty(e, a, n))
        }, tT = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tf.default;
            tI(e, t, n, i)
        }, tC = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: tv.default.MomentsCreationsAttempt,
                parameters: tg({
                    operation: e
                }, t)
            }
        }, tw = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: tv.default.MomentsCreationsSuccess,
                parameters: tg({
                    operation: e
                }, t)
            }
        }, tS = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tf.default;
            n.logClickEvent(tC(e, t))
        }, tA = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tf.default;
            n.logImpressionEvent(tw(e, t))
        };
    var tM = e.i(773595);
    let tj = tM.availableDocsLocales,
        tE = new Set(tj),
        tP = e => {
            let t = e === s.Locale.SimplifiedChineseJV ? s.Locale.SimplifiedChinese : e;
            return null != t && tE.has(t) ? t : s.Locale.English
        },
        tk = e => null != e ? (0, s.toLocaleNativeName)(e) : "-",
        tL = {
            active: ea,
            captionedassetmoment: ea,
            live: ea,
            moderated: er,
            pending: es,
            published: ea
        },
        tR = new Date(0).toISOString(),
        tN = function(e) {
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
                    if (null != e && "" !== e) return tM.StringLocaleMap.get(e.toLowerCase())
                })(null == p ? void 0 : p.videoContentLanguage);
            return {
                momentId: d,
                feedItemId: u,
                assetId: null == p ? void 0 : p.assetId,
                description: null != (a = null == p ? void 0 : p.caption) ? a : "",
                experienceName: "",
                modifiedAt: tR,
                status: (e => {
                    if (!e) return ea;
                    let t = tL[e.toLowerCase()];
                    if (t) return t;
                    let n = e.toLowerCase();
                    return n.includes("pending") ? es : (n.includes("active") || n.includes("publish") || n.includes("live"), ea)
                })(e.type),
                universeId: h,
                ...null != v ? {
                    locale: v
                } : {}
            }
        },
        tD = function(e) {
            var t;
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return (null != (t = e.items) ? t : []).map(e => tN(e, n)).filter(e => null != e)
        },
        tO = async (e, t) => tm.momentsGetUsersMoments({
            targetUserId: e,
            paginationContext: null == t ? void 0 : t.paginationContext,
            count: 25
        }), tU = async e => {
            let t = [...new Set(e.map(e => e.universeId).filter(e => null != e && e > 0))];
            if (0 === t.length) return e;
            try {
                tS(tx.EnrichExperienceNames, {
                    universeIdCount: t.length
                });
                let {
                    data: n = []
                } = await tp.default.getUniversesDetails(t), i = new Map(n.filter(e => null != e.id && "string" == typeof e.name && e.name.length > 0).map(e => [e.id, e.name])), a = e.map(e => {
                    var t;
                    let n = null != e.universeId && null != (t = i.get(e.universeId)) ? t : "";
                    return n === e.experienceName ? e : {
                        ...e,
                        experienceName: n
                    }
                });
                return tA(tx.EnrichExperienceNames, {
                    universeIdCount: t.length
                }), a
            } catch (n) {
                return tT(tx.EnrichExperienceNames, n, {
                    universeIdCount: t.length
                }), e
            }
        }, tB = async function(e, t) {
            var n, i;
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                s = (null == t ? void 0 : t.paginationContext) != null ? tx.FetchNextPage : tx.ListMoments;
            tS(s, {
                userId: e
            });
            let o = await tO(e, t),
                r = tD(o, a),
                l = await tU(r);
            return tA(s, {
                userId: e,
                pageCount: null != (n = null == t ? void 0 : t.pageNumber) ? n : 1,
                momentCount: l.length
            }), {
                moments: l,
                paginationContext: null != (i = o.paginationContext) ? i : void 0
            }
        }, tz = async e => {
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
                status: eo,
                ...null != a ? {
                    locale: a
                } : {}
            }
        };
    async function tV(e) {
        let {
            feedItemId: t,
            momentId: n,
            useFeedItemId: i = !1
        } = e;
        if (i) {
            if (null == t || "" === t) throw Error("Moment feed item id is required before deleting");
            await tm.momentsDeleteMomentByFeedItem({
                feedItemId: t
            });
            return
        }
        if (null == n || "" === n) throw Error("Moment id is required before deleting");
        await tm.momentsDeleteMoment({
            momentId: n
        })
    }
    async function tF(e) {
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
    async function tq(e) {
        var t;
        let {
            moment: n,
            file: i,
            displayName: a,
            uiLocale: s,
            sendVideoContentLanguage: o = !0
        } = e;
        if (!n.experienceId) throw Error("Moment experience is required before publishing");
        let r = await tF(i),
            l = {
                metadata: {
                    captureType: "Video",
                    description: n.description,
                    universeId: n.experienceId,
                    placeId: n.rootPlaceId,
                    assetTotalDuration: r,
                    edits: {}
                },
                feedRegistrationInfo: {
                    contentType: "moment",
                    duration: r,
                    attributes: [],
                    customTags: []
                }
            },
            d = (await tm.contentCapturesCreateInfluencerMomentFromVideo({
                files: [i],
                name: a,
                description: n.description,
                universeId: n.experienceId,
                momentPublishData: JSON.stringify(l),
                ...o ? {
                    videoContentLanguage: (null != (t = n.locale) ? t : tP(s)).toLowerCase()
                } : {}
            })).operationId;
        if (null == d || "" === d) throw Error("Publish operation id is missing from the response");
        return {
            operationId: d
        }
    }
    let tG = () => {
            let {
                ready: e,
                value: t
            } = (0, u.useFlag)(T.isMomentsFeedIdEnabled);
            return e && null != t && t
        },
        t_ = () => {
            let {
                ready: e,
                value: t
            } = (0, u.useFlag)(T.isMomentsUploadLanguageSelectEnabled);
            return e && null != t && t
        },
        tH = e => {
            var t, n;
            return e.status === eo ? e.draftId : null != (t = null != (n = e.feedItemId) ? n : e.momentId) ? t : ""
        },
        tK = e => ["momentsCreations", e],
        tW = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return [...tK(e), t]
        },
        tY = () => {
            let e, [{
                    momentStatus: t
                }, n] = (0, q.useQueryParams)(["momentStatus"]),
                i = (0, eN.useQueryClient)(),
                {
                    user: s
                } = (0, E.useAuthentication)();
            return {
                statusTab: "string" == typeof(e = null == t ? void 0 : Array.isArray(t) ? t[0] : t) && el.some(t => t === e) ? e : eo,
                setStatusTab: (0, a.useCallback)(e => {
                    n({
                        momentStatus: e
                    }), e === ea && i.invalidateQueries({
                        queryKey: tK(null == s ? void 0 : s.id)
                    })
                }, [i, n, null == s ? void 0 : s.id])
            }
        },
        tQ = async (e, t, n, i) => {
            let a = {
                draftId: t,
                fileSize: n.size,
                fileType: n.type
            };
            tS(tx.PersistLocalVideo, a);
            try {
                let s, o, {
                    evictedMediaDraftIds: r
                } = await ey(e, t, n, (s = ek(window.localStorage.getItem(en(e))), o = new Set(i.map(e => e.draftId)), [...i, ...s.filter(e => !o.has(e.draftId))]));
                return tA(tx.PersistLocalVideo, a), {
                    hasLocalVideo: !0,
                    storageEvictedMediaDraftIds: r
                }
            } catch (e) {
                return tT(tx.PersistLocalVideo, e, {
                    draftId: t,
                    fileSize: n.size,
                    fileType: n.type
                }), {
                    hasLocalVideo: !1,
                    storageEvictedMediaDraftIds: []
                }
            }
        };
    var tJ = e.i(137785);
    let tX = (0, s.withTranslation)(e => {
        let {
            experience: t,
            hideTitle: n = !1,
            onChangeExperience: a
        } = e, {
            translate: o
        } = (0, s.useTranslation)();
        return (0, i.jsxs)("div", {
            className: "flex flex-col gap-y-xsmall width-full",
            children: [n ? null : (0, i.jsxs)("div", {
                className: "flex flex-row items-center justify-between",
                children: [(0, i.jsx)("span", {
                    className: "text-body-small content-muted",
                    children: o("CreateMomentModal.Preview.Title")
                }), a && (0, i.jsx)(X.Button, {
                    variant: "Link",
                    size: "Small",
                    onClick: a,
                    children: o("Action.EEChange")
                })]
            }), (0, i.jsx)("div", {
                className: "padding-medium radius-medium bg-surface-200 width-full",
                children: (0, i.jsx)(tJ.default, {
                    disableLink: !0,
                    target: t,
                    targetType: "Experience",
                    variant: "medium"
                })
            })]
        })
    }, [G.TranslationNamespace.Creations]);
    var tZ = e.i(119673),
        t$ = e.i(392782);
    let t0 = "UniverseId",
        t1 = "PlaceId",
        t2 = /(?:https?:\/\/)?create\.roblox\.com\/dashboard\/creations\/experiences\/(\d+)/,
        t4 = /(?:https?:\/\/)?(?:www\.)?roblox\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
        t5 = /^\d+$/,
        t3 = [{
            regex: /(?:https?:\/\/)?create\.sitetest\d\.robloxlabs\.com\/dashboard\/creations\/experiences\/(\d+)/,
            idType: t0
        }, {
            regex: /(?:https?:\/\/)?(?:www\.)?sitetest\d\.robloxlabs\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
            idType: t1
        }],
        t7 = (0, s.withTranslation)(e => {
            let {
                onExperienceResolved: t,
                isDisabled: n = !1
            } = e, {
                translate: o
            } = (0, s.useTranslation)(), {
                ready: r,
                value: l
            } = (0, u.useFlag)(T.isMomentsSitetestUrlParsingEnabled), [d, c] = (0, a.useState)(""), [m, p] = (0, a.useState)(!1), [h, v] = (0, a.useState)(), f = (0, a.useMemo)(() => [{
                regex: t2,
                idType: t0
            }, {
                regex: t4,
                idType: t1
            }, ...r && null != l && l ? t3 : [], {
                regex: t5,
                idType: t0
            }], [l, r]), x = (0, a.useMemo)(() => d.trim().length > 0 && f.some(e => {
                let {
                    regex: t
                } = e;
                return t.test(d.trim())
            }), [f, d]), g = (0, a.useCallback)(async () => {
                var e, n, i, a, s, r;
                let l = d.trim(),
                    u = f.find(e => {
                        let {
                            regex: t
                        } = e;
                        return t.test(l)
                    });
                if (!u) return;
                let m = u.idType === t0 && t5.test(l) ? Number(l) : Number(null == (e = u.regex.exec(l)) ? void 0 : e[1]);
                if (!m || !Number.isFinite(m)) return;
                let h = {
                    inputValue: l,
                    idType: u.idType,
                    matchedId: m
                };
                p(!0), v(void 0), tS(tx.ResolveExperience, h);
                try {
                    let e;
                    if (u.idType === t1) {
                        let t = null == (r = (await t$.default.multigetPlaceDetails([m]))[0]) ? void 0 : r.universeId;
                        if (!t) {
                            tT(tx.ResolveExperience, "Experience not found", {
                                ...h,
                                placeId: m,
                                reason: "ExperienceNotFound"
                            }), v(o("Error.ExperienceNotFound")), p(!1);
                            return
                        }
                        e = t
                    } else e = m;
                    let l = null == (s = (await t$.default.getDetails([e])).data) ? void 0 : s[0];
                    if (!(null == l ? void 0 : l.id)) {
                        tT(tx.ResolveExperience, "Experience not found", {
                            ...h,
                            experienceId: e,
                            reason: "ExperienceNotFound"
                        }), v(o("Error.ExperienceNotFound")), p(!1);
                        return
                    }
                    t({
                        id: l.id,
                        name: null != (n = l.name) ? n : void 0,
                        description: null != (i = l.description) ? i : void 0,
                        rootPlaceId: null != (a = l.rootPlaceId) ? a : void 0
                    }), tA(tx.ResolveExperience, {
                        ...h,
                        experienceId: l.id,
                        placeId: u.idType === t1 ? m : void 0
                    }), c("")
                } catch (e) {
                    tT(tx.ResolveExperience, e, {
                        ...h,
                        placeId: u.idType === t1 ? m : void 0,
                        experienceId: u.idType === t0 ? m : void 0
                    }), v(o("Error.ExperienceNotFound"))
                } finally {
                    p(!1)
                }
            }, [t, f, o, d]), b = (0, a.useCallback)(e => {
                "Enter" === e.key && x && (g(), e.preventDefault())
            }, [x, g]);
            return (0, i.jsxs)("div", {
                className: "flex flex-row gap-x-medium items-end width-full",
                children: [(0, i.jsx)("div", {
                    className: "grow-1 min-width-0",
                    children: (0, i.jsx)(tZ.TextInput, {
                        label: o("CreateMomentModal.ExperienceInput.Label"),
                        placeholder: o("CreateMomentModal.ExperienceInput.Placeholder"),
                        value: d,
                        onChange: e => {
                            c(e.target.value), v(void 0)
                        },
                        onKeyDown: b,
                        hasError: null != h,
                        error: h,
                        isDisabled: n || m,
                        size: "Medium"
                    })
                }), (0, i.jsx)(X.Button, {
                    variant: "Emphasis",
                    size: "Medium",
                    className: h ? "margin-bottom-[22px]" : void 0,
                    isDisabled: !x || m,
                    isLoading: m,
                    onClick: () => {
                        g()
                    },
                    children: o("Action.Add")
                })]
            })
        }, [G.TranslationNamespace.Creations, G.TranslationNamespace.Controls]);
    var t8 = e.i(634733),
        t9 = e.i(605836),
        t6 = e.i(220754);
    let ne = (0, s.withTranslation)(e => {
        let {
            value: t,
            onChange: n,
            isDisabled: o = !1
        } = e, {
            translate: r
        } = (0, s.useTranslation)(), l = r("CreateMomentModal.LanguageInput.Label"), d = r("CreateMomentModal.LanguageInput.Placeholder"), u = (0, a.useCallback)(e => {
            tE.has(e) && n(e)
        }, [n]);
        return (0, i.jsx)("div", {
            className: "width-full",
            "data-testid": "moments-language-select",
            children: (0, i.jsx)(t8.Dropdown, {
                className: "width-full [&_.content-system-alert]:text-caption-medium",
                size: "Medium",
                label: l,
                ariaLabel: l,
                placeholder: d,
                value: t,
                isDisabled: o,
                onValueChange: u,
                children: (0, i.jsx)(t6.Menu, {
                    children: (0, i.jsx)(t6.MenuSection, {
                        children: tj.map(e => (0, i.jsx)(t6.MenuItem, {
                            value: e,
                            title: (0, s.toLocaleNativeName)(e),
                            trailing: t === e && (0, i.jsx)(t9.Icon, {
                                name: "icon-filled-check",
                                size: "Medium"
                            })
                        }, e))
                    })
                })
            })
        })
    }, [G.TranslationNamespace.Creations]);
    var nt = e.i(377282),
        nn = e.i(321211);
    let ni = ["mp4", "mov"],
        na = ["video/mp4", "video/quicktime"];
    var ns = ((n = {}).FileTooBig = "FileTooBig", n.FileWrongType = "FileWrongType", n.DurationExceeded = "DurationExceeded", n.ResolutionExceeded = "ResolutionExceeded", n.MetadataUnavailable = "MetadataUnavailable", n);
    let no = e => {
            var t, n;
            let i;
            return e.size > 0xf0000000 ? "FileTooBig" : null != (i = null == (n = (t = e).name.split(".").pop()) ? void 0 : n.toLowerCase()) && ni.some(e => e === i) && ("" === t.type || na.includes(t.type)) ? null : "FileWrongType"
        },
        nr = async e => {
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
        }, nl = async e => {
            let t = [],
                n = [];
            for (let i of e) {
                let e = no(i);
                if (null != e) {
                    n.push({
                        file: i,
                        reason: e
                    });
                    continue
                }
                let a = await nr(i);
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
        }, nd = ni.map(e => e.toUpperCase()).join("/"), nu = (0, s.withTranslation)(e => {
            let {
                hasSelectedExperience: t,
                hasSelectedLanguage: n,
                selectedFiles: o,
                isUploading: r = !1,
                onFilesChange: l,
                onValidationErrorsChange: d
            } = e, {
                translate: u
            } = (0, s.useTranslation)(), [c, m] = (0, a.useState)(!1), p = u("CreateMomentModal.DropTarget.UploadButton"), h = u("CreateMomentModal.DropTarget.NoExperienceAddedText"), v = u("CreateMomentModal.DropTarget.ExperienceAddedText"), [f, x] = (0, a.useState)(!1), g = t && n, b = t ? v : h, y = (0, a.useRef)(l), I = (0, a.useRef)(d), T = (0, a.useRef)(u);
            y.current = l, I.current = d, T.current = u;
            let C = (0, a.useCallback)(async e => {
                    var t, n, i, a;
                    if (x(!1), !g || r || c) return;
                    let s = Array.from(null != e ? e : []);
                    if (0 !== s.length) {
                        null == (t = I.current) || t.call(I, []), m(!0);
                        try {
                            let {
                                validFiles: e,
                                errors: t
                            } = await nl(s);
                            if (t.length > 0) {
                                for (let {
                                        file: e,
                                        reason: n
                                    }
                                    of t) tT(tx.ValidateVideo, n, {
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
                                        case ns.FileTooBig:
                                            return e("CreateMomentModal.Error.FileTooBig", {
                                                maxFileSizeGB: String(3.75)
                                            });
                                        case ns.FileWrongType:
                                            return e("CreateMomentModal.Error.FileWrongType", {
                                                formats: nd
                                            });
                                        case ns.DurationExceeded:
                                            return e("CreateMomentModal.Error.DurationExceeded", {
                                                maxDurationMinutes: String(5)
                                            });
                                        case ns.ResolutionExceeded:
                                            return e("CreateMomentModal.Error.ResolutionExceeded", {
                                                maxWidth: String(4096),
                                                maxHeight: String(2160)
                                            });
                                        case ns.MetadataUnavailable:
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
                w = (0, a.useCallback)(() => {
                    !g || r || c || x(!0)
                }, [g, r, c]),
                S = (0, a.useCallback)(() => {
                    x(!1)
                }, []),
                A = !g || r || c;
            return (0, i.jsx)("div", {
                className: "flex flex-col gap-y-small width-full",
                children: (0, i.jsx)(nn.default, {
                    accept: "video/mp4,video/quicktime,.mp4,.mov",
                    multiple: !0,
                    size: 0xf0000000,
                    onChange: C,
                    onDragActiveHandler: w,
                    onDragLeaveHandler: S,
                    className: "width-full",
                    children: (e, t, n, a, s) => (0, i.jsxs)("div", {
                        role: "presentation",
                        onKeyDown: t,
                        onDrop: n,
                        onDragOver: a,
                        onDragLeave: s,
                        className: "flex flex-col items-center justify-center gap-y-small padding-xlarge radius-medium stroke-standard width-full min-height-250 ".concat(f ? "bg-shift-200" : "bg-surface-100"),
                        children: [(0, i.jsx)(X.Button, {
                            variant: "Standard",
                            size: "Medium",
                            type: "button",
                            icon: r || c ? void 0 : "icon-regular-arrow-up-from-line",
                            isDisabled: A,
                            onClick: e,
                            children: r || c ? (0, i.jsxs)("span", {
                                className: "inline-flex items-center gap-xsmall",
                                children: [(0, i.jsx)(nt.ProgressCircle, {
                                    ariaLabel: p,
                                    size: "Small",
                                    variant: "Indeterminate"
                                }), p]
                            }) : p
                        }), (0, i.jsx)("span", {
                            className: "text-body-small content-muted text-align-x-center",
                            children: b
                        }), o.map(e => (0, i.jsx)("span", {
                            className: "text-body-small content-muted text-align-x-center",
                            children: e.name
                        }, "".concat(e.name, "-").concat(e.lastModified)))]
                    })
                })
            })
        }, [G.TranslationNamespace.Creations]), nc = (0, s.withTranslation)(e => {
            let {
                open: t,
                onOpenChange: n,
                onMomentUploaded: o
            } = e, {
                addMoments: r
            } = eR(), {
                setStatusTab: l
            } = tY(), d = t_(), {
                translate: u
            } = (0, s.useTranslation)(), {
                locale: c
            } = (0, s.useLocalization)(), m = tP(c), [p, h] = (0, a.useState)(), [v, f] = (0, a.useState)(), x = null != v ? v : m, [g, b] = (0, a.useState)([]), [y, I] = (0, a.useState)([]), T = (0, a.useRef)(0), {
                uploadVideos: C,
                isUploading: w
            } = (() => {
                let {
                    user: e
                } = (0, E.useAuthentication)(), [t, n] = (0, a.useState)(!1), [i, s] = (0, a.useState)(0);
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
                            let e = await tz({
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
                                } = await tQ(r, e.draftId, o, []);
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
                                let o = await tz({
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
                                    } = await tQ(r, o.draftId, n, e);
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
            }, []), P = (0, a.useCallback)(() => {
                T.current += 1, b([]), I([]), h(void 0)
            }, []), k = (0, a.useCallback)(e => {
                !w && (n(e), e || S())
            }, [w, n, S]), L = (0, a.useCallback)(e => {
                I(e)
            }, []), R = (0, a.useCallback)(() => {
                I([])
            }, []), N = (0, a.useCallback)(async e => {
                var t, n, i;
                if (0 === e.length || (null == p ? void 0 : p.id) == null || d && null == x || w) return void b(e);
                let a = T.current + 1;
                T.current = a, b(e), tS(tx.UploadVideo, {
                    experienceId: p.id,
                    fileCount: e.length,
                    fileSize: e.reduce((e, t) => e + t.size, 0),
                    fileType: null == (t = e[0]) ? void 0 : t.type,
                    ...d ? {
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
                        ...d ? {
                            locale: x
                        } : {}
                    });
                    if (T.current !== a) return;
                    o ? t.forEach(e => {
                        o(e)
                    }) : r(t, {
                        storageEvictedMediaDraftIds: i
                    }), tA(tx.UploadVideo, {
                        experienceId: p.id,
                        fileCount: t.length,
                        persistedVideoCount: t.filter(e => e.hasLocalVideo).length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (n = e[0]) ? void 0 : n.type,
                        ...d ? {
                            locale: x
                        } : {}
                    }), l(eo), A()
                } catch (t) {
                    if (T.current !== a) return;
                    tT(tx.UploadVideo, t, {
                        experienceId: p.id,
                        fileCount: e.length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (i = e[0]) ? void 0 : i.type,
                        ...d ? {
                            locale: x
                        } : {}
                    }), b([])
                }
            }, [r, A, d, w, o, p, x, l, C]), D = u("CreateMomentModal.Title"), O = y[0], U = y.length > 1 ? y.slice(1).join(" ") : void 0;
            return (0, i.jsx)(Z.Dialog, {
                open: t,
                onOpenChange: k,
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: u("Action.Close"),
                children: (0, i.jsx)(Z.DialogContent, {
                    className: "flex flex-col min-width-0 width-[min(720px,95vw)] !max-width-[min(720px,95vw)]",
                    children: (0, i.jsxs)(Z.DialogBody, {
                        className: "flex flex-col gap-y-medium",
                        children: [(0, i.jsx)(Z.DialogTitle, {
                            className: "text-heading-small content-emphasis margin-none",
                            children: D
                        }), null != O ? (0, i.jsx)("div", {
                            className: "width-full margin-top-small padding-bottom-small",
                            children: (0, i.jsx)($.FeedbackBanner, {
                                className: "width-full",
                                layout: "Stacked",
                                variant: "Standard",
                                severity: "Error",
                                title: O,
                                description: U,
                                onDismiss: R,
                                dismissIconAriaLabel: u("Action.Close"),
                                "data-testid": "moments-video-validation-error-banner"
                            })
                        }) : null, p ? (0, i.jsx)(tX, {
                            experience: p,
                            onChangeExperience: P
                        }) : (0, i.jsx)(t7, {
                            onExperienceResolved: M,
                            isDisabled: w
                        }), d ? (0, i.jsx)(ne, {
                            value: x,
                            onChange: j,
                            isDisabled: w
                        }) : null, (0, i.jsx)(nu, {
                            hasSelectedExperience: (null == p ? void 0 : p.id) != null,
                            hasSelectedLanguage: !d || null != x,
                            selectedFiles: g,
                            isUploading: w,
                            onFilesChange: N,
                            onValidationErrorsChange: L
                        })]
                    })
                })
            })
        }, [G.TranslationNamespace.Creations, G.TranslationNamespace.Controls]);

    function nm() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        (0, ee.openDialog)({
            component: nc,
            props: e,
            options: {
                mode: "standalone"
            }
        })
    }
    let np = () => nm(),
        nh = () => {
            let {
                translate: e
            } = (0, s.useTranslation)();
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(X.Button, {
                    variant: "Emphasis",
                    size: "Large",
                    type: "button",
                    onClick: np,
                    children: e("Action.CreateMoments")
                })
            })
        };
    var nv = e.i(368313);
    let nf = e => {
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
                children: el.map(e => (0, i.jsx)(nv.Chip, {
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
        nx = () => {
            let {
                translate: e
            } = (0, s.useTranslation)(), {
                statusTab: t,
                setStatusTab: n
            } = tY(), o = (0, a.useMemo)(() => ({
                [ea]: e("MomentsTable.Pills.Active"),
                [eo]: e("MomentsTable.Pills.Draft")
            }), [e]);
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(nf, {
                    groupLabel: e("MomentsTable.Header.Status"),
                    labels: o,
                    selected: t,
                    onChange: n
                })
            })
        };
    var ng = e.i(253536);
    let nb = e => {
        var t, n, a;
        let {
            data: o
        } = e, {
            translate: r
        } = (0, s.useTranslation)(), l = (null == o || null == (n = o.creationAccessMetadata) ? void 0 : n.accessAllowed) === !1;
        if (!l) return null;
        let d = null != (t = null == o || null == (a = o.creationAccessMetadata) ? void 0 : a.daysToUnblock) ? t : 0,
            u = l && -1 === d;
        return (0, i.jsx)(H.default, {
            alertTitle: u ? r("Heading.PermanentlyCreationBanned") : r("Heading.TemporaryCreationBanned", {
                days: d.toString()
            }),
            alertDescription: r(u ? "Description.PermanentlyCreationBanned" : "Description.TemporaryCreationBanned"),
            severity: "warning",
            externalLink: ng.MARKETPLACE_POLICY,
            linkLabel: r("Label.MarketplacePolicy"),
            allowCloseDialog: !1
        })
    };
    var ny = e.i(770009),
        nI = e.i(988012),
        nT = e.i(93235),
        nC = e.i(27281),
        nw = e.i(706442),
        nS = e.i(756568),
        nA = e.i(849087),
        nM = e.i(665357),
        nj = e.i(131385),
        nE = e.i(643093);
    let nP = (0, nw.makeStyles)()({
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
        nk = () => {
            var e;
            let {
                classes: {
                    chipRow: t
                }
            } = nP(), {
                translate: n
            } = (0, s.useTranslation)(), o = (0, nM.default)(), r = null != (e = (0, nA.default)()) && e, [{
                activeTab: l
            }, d] = (0, q.useQueryParams)(["activeTab", "filterIndex"]), {
                l1Options: u,
                activeL1Key: c
            } = (0, nj.default)(!0), m = (0, g.isAllAssetTypesActiveTab)(l), p = (0, g.isAvatarLooksActiveTab)(l), h = (0, a.useCallback)(e => {
                e && d({
                    activeTab: (0, g.buildTaxonomyActiveTab)(e),
                    filterIndex: 0
                })
            }, [d]), v = (0, a.useCallback)(() => {
                d({
                    activeTab: (0, g.buildTaxonomyActiveTab)(g.ALL_ASSET_TYPES_L1_KEY),
                    filterIndex: 0
                })
            }, [d]), f = (0, a.useCallback)(() => {
                d({
                    activeTab: (0, g.buildTaxonomyActiveTab)(g.AVATAR_LOOKS_L1_KEY),
                    filterIndex: 0
                })
            }, [d]), x = n("Label.Categories");
            return 0 !== u.length || m ? (0, i.jsxs)("fieldset", {
                className: t,
                "aria-label": x,
                children: [r && (0, i.jsx)(nv.Chip, {
                    text: n("Label.Avatars"),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: p,
                    onCheckedChange: f
                }), u.map(e => {
                    var t;
                    return (0, i.jsx)(nv.Chip, {
                        text: (0, nE.taxonomyOptionLabel)(e, n),
                        size: "Medium",
                        variant: "Standard",
                        isChecked: e.taxonomyKey === c,
                        onCheckedChange: () => h(e.taxonomyKey)
                    }, null != (t = e.taxonomyKey) ? t : e.nameKey)
                }), o && (0, i.jsx)(nv.Chip, {
                    text: n("Label.AllAssetTypes"),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: m,
                    onCheckedChange: v
                })]
            }) : null
        };
    var nL = e.i(638016),
        nR = e.i(157310),
        nN = e.i(100226);
    let nD = (e, t) => {
            let {
                settings: n
            } = (0, x.useSettings)(), i = C(), s = (0, nM.default)(), o = (0, nA.default)(), r = (0, nN.default)(), {
                data: l
            } = (0, nR.useQuery)({
                queryKey: ["avatar-items-entry-point-asset-types"],
                queryFn: y.getAvatarItemsEntryPointAssetTypes,
                staleTime: 3e5
            });
            return (0, a.useMemo)(() => {
                var a, d;
                return null != (a = null == (d = e.menuItem.submenuItems) ? void 0 : d.filter(a => I.default.isMenuItemEnabled(a, n, t, "Label.AvatarItems" === e.menuItem.nameKey ? null == l ? void 0 : l.has(a.type) : void 0, l, i, s, o, r))) ? a : []
            }, [e.menuItem.submenuItems, e.menuItem.nameKey, n, t, l, i, s, o, r])
        },
        nO = (0, nw.makeStyles)()(e => ({
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
        nU = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                group: o
            } = e, {
                classes: {
                    subMenuContainer: r,
                    subMenu: l,
                    backButton: d,
                    nextButton: u,
                    chip: c
                },
                cx: m
            } = nO(), p = (0, a.useRef)(null), {
                translate: h
            } = (0, s.useTranslation)(), [v, f] = (0, a.useState)(0), [x, g] = (0, a.useState)(0), [b, y] = (0, a.useState)(0), {
                isTaxonomyMode: T
            } = (0, nL.default)(I.default.getAssetType(t)), C = nD(t, o), w = (0, a.useMemo)(() => v <= 0, [v]), S = (0, a.useMemo)(() => v + b >= x, [v, x, b]), A = () => {
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
            }, []), T) ? (0, i.jsx)(nk, {}) : (0, i.jsxs)(nS.Flex, {
                classes: {
                    root: r
                },
                children: [!w && (0, i.jsx)("div", {
                    className: d,
                    children: (0, i.jsx)(nI.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: -b,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "back",
                        children: (0, i.jsx)(nT.NavigateBeforeIcon, {
                            fontSize: "small"
                        })
                    })
                }), (0, i.jsx)("div", {
                    ref: p,
                    className: m(l, "flex max-medium:wrap max-medium:gap-y-small"),
                    children: null == C ? void 0 : C.map(e => {
                        let a = t.submenuItem === e;
                        return (0, i.jsx)(ny.Chip, {
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
                    children: (0, i.jsx)(nI.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: b,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "next",
                        children: (0, i.jsx)(nC.NavigateNextIcon, {
                            fontSize: "small"
                        })
                    })
                })]
            })
        };
    var nB = e.i(54842),
        nz = e.i(774807),
        nV = e.i(558826),
        nF = e.i(872204),
        nq = e.i(39128),
        nG = e.i(54369),
        n_ = e.i(220552),
        nH = e.i(573672),
        nK = e.i(310634),
        nW = e.i(556030),
        nY = e.i(517379),
        nQ = e.i(199834),
        nJ = e.i(239328),
        nX = e.i(776344),
        nZ = e.i(823062),
        n$ = e.i(198528),
        n0 = e.i(949599),
        n1 = e.i(704443),
        n2 = e.i(696564),
        n4 = e.i(418162);
    let n5 = (0, nw.makeStyles)()(e => ({
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
    var n3 = e.i(291037),
        n7 = e.i(777004),
        n8 = e.i(899819),
        n9 = e.i(447055),
        n6 = e.i(242788),
        ie = e.i(854705),
        it = e.i(235684),
        ii = e.i(210598),
        ia = e.i(904090),
        is = e.i(196945),
        io = e.i(913893),
        ir = e.i(185915);

    function il(e) {
        if (void 0 === e.id || void 0 === e.autoPublishEnabled) throw Error("Publishing preferences response was malformed");
        return e
    }
    async function id(e) {
        return il(await io.default.getPublishingPreferences(e))
    }
    async function iu(e) {
        return il(await io.default.createPublishingPreferences(e))
    }
    var ic = e.i(812141);
    let im = e => {
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
            }), (0, i.jsx)(nq.Divider, {})]
        })
    };

    function ip(e) {
        return 4 === e || 2 === e
    }

    function ih(e, t, n) {
        return e && t && "all" === n ? 1 : e && t && "specific" === n ? 4 : e && !t ? 3 : !e && t ? 2 : 0
    }
    let iv = e => {
        var t;
        let {
            open: n,
            onClose: o
        } = e, {
            translate: r
        } = (0, s.useTranslation)(), {
            enqueue: l
        } = (0, is.useSnackbar)(), {
            user: d
        } = (0, E.useAuthentication)(), u = (0, f.useCurrentGroup)(), c = null == u ? void 0 : u.id, {
            data: m
        } = (0, ic.default)(io.default), p = null != (t = null == m ? void 0 : m.maxCollectiblePrice) ? t : n2.DefaultMaxCollectiblePrice, [h, v] = (0, a.useState)(!0), [x, g] = (0, a.useState)(!1), [b, y] = (0, a.useState)(!1), [I, T] = (0, a.useState)(""), [C, w] = (0, a.useState)(""), [S, A] = (0, a.useState)(!0), [M, j] = (0, a.useState)(!0), [P, k] = (0, a.useState)(!0), [L, R] = (0, a.useState)("all"), [N, D] = (0, a.useState)(""), [O, U] = (0, a.useState)(!1);
        (0, a.useEffect)(() => {
            n && id(c).then(e => {
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
                j(t.sellInMarketplace), k(t.sellInExperiences), R(t.experienceLocationMode), e.places.length > 0 && D(e.places.join(","))
            }).catch(e => {
                var t;
                (null == (t = (0, ir.default)(e)) ? void 0 : t.status) !== 404 && (U(!0), l({
                    message: r("Message.ErrorProcessingRequest"),
                    autoHide: !0,
                    autoHideDuration: 3e3,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "left"
                    }
                }))
            }).finally(() => v(!1))
        }, [n, c, l, r]);
        let B = (0, a.useCallback)(async () => {
                if (null == d ? void 0 : d.id) {
                    g(!0);
                    try {
                        let e = ih(M, P, L),
                            t = ip(e) ? N.split(",").filter(Boolean).map(e => Number(e)) : [];
                        await iu({
                            creatorUserId: d.id,
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
                        }), l({
                            message: r("Message.PublishingDefaultsSaved"),
                            autoHide: !0,
                            autoHideDuration: 3e3,
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "left"
                            }
                        }), o()
                    } catch (t) {
                        let e = await (0, th.default)(t);
                        l({
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
            }, [d, c, M, P, L, N, C, I, S, b, l, o, r]),
            z = (0, a.useCallback)(() => {
                B()
            }, [B]),
            V = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && T(t)
            }, [p]),
            F = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && w(t)
            }, [p]),
            q = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9,]/g, "").replaceAll(/,{2,}/g, ",").replace(/^,/, "").split(",").map(e => e.replace(/^0+(\d)/, "$1")).filter(e => "0" !== e).join(","),
                    n = t.split(",").filter(Boolean);
                if (!(n.length > 5)) {
                    if (5 === n.length && t.endsWith(",")) return void D(t.slice(0, -1));
                    D(t)
                }
            }, []),
            G = h || x || O || !M && !P || "" === I || "" === C || 0 >= Number(C) || ip(ih(M, P, L)) && 0 === N.split(",").filter(Boolean).length;
        return (0, i.jsxs)(n3.Dialog, {
            open: n,
            onClose: o,
            maxWidth: "Medium",
            color: "primaryBrand",
            PaperProps: {
                className: "[width:580px]"
            },
            children: [(0, i.jsx)(n8.DialogTitle, {
                className: "padding-bottom-none",
                children: (0, i.jsxs)("div", {
                    className: "flex justify-between items-start",
                    children: [(0, i.jsx)("span", {
                        className: "text-heading-small",
                        children: r("Heading.StudioPublishSettings")
                    }), (0, i.jsx)(nI.IconButton, {
                        "aria-label": "Close",
                        onClick: o,
                        size: "small",
                        color: "inherit",
                        children: (0, i.jsx)(n9.CloseIcon, {})
                    })]
                })
            }), (0, i.jsxs)(n7.DialogContent, {
                className: "padding-top-small",
                children: [(0, i.jsx)(nQ.Typography, {
                    variant: "body2",
                    className: "[opacity:0.7] padding-bottom-medium",
                    children: r("Description.StudioPublishSettingsSubtitle")
                }), (0, i.jsx)(im, {
                    label: r("Label.Availability"),
                    children: (0, i.jsx)("span", {
                        className: "text-label-large [margin-left:12px]",
                        children: r("Label.NonLimited")
                    })
                }), (0, i.jsx)(im, {
                    label: r("Label.TimedOption"),
                    children: (0, i.jsx)(nY.Switch, {
                        checked: b,
                        onChange: () => y(e => !e),
                        "aria-label": "Timed Option"
                    })
                }), (0, i.jsx)(im, {
                    label: r("Label.PriceConfigurations"),
                    className: "grid [grid-template-columns:175px_1fr] padding-y-large gap-xsmall",
                    labelClassName: "padding-top-small",
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col [flex:1] gap-xsmall",
                        children: [(0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(ii.TextField, {
                                id: "price-offset",
                                label: "",
                                placeholder: r("Placeholder.AmountAbovePriceFloor"),
                                variant: "outlined",
                                size: "small",
                                value: I,
                                onChange: V,
                                fullWidth: !0
                            }), (0, i.jsx)(ia.Tooltip, {
                                title: r("Tooltip.AmountAbovePriceFloor"),
                                children: (0, i.jsx)(nI.IconButton, {
                                    "aria-label": "price offset info",
                                    size: "small",
                                    children: (0, i.jsx)(n6.InfoOutlinedIcon, {})
                                })
                            })]
                        }), (0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(ii.TextField, {
                                id: "price-floor-minimum",
                                label: "",
                                placeholder: r("Placeholder.DoNotPriceBelow"),
                                variant: "outlined",
                                size: "small",
                                value: C,
                                onChange: F,
                                fullWidth: !0
                            }), (0, i.jsx)(ia.Tooltip, {
                                title: r("Tooltip.MinimumPriceFloor"),
                                children: (0, i.jsx)(nI.IconButton, {
                                    "aria-label": "minimum price info",
                                    size: "small",
                                    children: (0, i.jsx)(n6.InfoOutlinedIcon, {})
                                })
                            })]
                        })]
                    })
                }), (0, i.jsx)(im, {
                    label: r("Label.RegionalPricing"),
                    children: (0, i.jsx)(nY.Switch, {
                        checked: S,
                        onChange: () => A(e => !e),
                        "aria-label": "Regional Pricing"
                    })
                }), (0, i.jsx)(im, {
                    label: r("Label.SellInMarketplace"),
                    children: (0, i.jsx)(nY.Switch, {
                        checked: M,
                        onChange: () => {
                            let e = !M;
                            e || R("specific"), j(e)
                        },
                        "aria-label": "Sell in Marketplace"
                    })
                }), (0, i.jsx)(im, {
                    label: r("Label.SellInExperiences"),
                    children: (0, i.jsx)(nY.Switch, {
                        checked: P,
                        onChange: () => k(e => !e),
                        "aria-label": "Sell in experiences"
                    })
                }), P && (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(nq.Divider, {}), (0, i.jsxs)("div", {
                        className: "padding-y-large",
                        children: [(0, i.jsxs)("div", {
                            className: "grid [grid-template-columns:175px_1fr] items-center",
                            children: [(0, i.jsx)("span", {
                                className: "text-label-large",
                                children: r("Label.ExperienceLocations")
                            }), (0, i.jsxs)(it.RadioGroup, {
                                row: !0,
                                value: L,
                                onChange: e => {
                                    let t = e.target.value;
                                    ("all" === t || "specific" === t) && R(t)
                                },
                                className: "flex flex-row no-wrap gap-xsmall [margin-left:12px]",
                                children: [(0, i.jsx)(nG.FormControlLabel, {
                                    value: "all",
                                    disabled: !M,
                                    control: (0, i.jsx)(ie.Radio, {
                                        "aria-label": r("Label.AllGames"),
                                        size: "small"
                                    }),
                                    label: r("Label.AllGames"),
                                    className: "margin-right-medium"
                                }), (0, i.jsx)(nG.FormControlLabel, {
                                    value: "specific",
                                    control: (0, i.jsx)(ie.Radio, {
                                        "aria-label": r("Label.SpecificExperiences"),
                                        size: "small"
                                    }),
                                    label: r("Label.SpecificExperiences")
                                })]
                            })]
                        }), "specific" === L && (0, i.jsxs)("div", {
                            className: "[margin-left:187px] [margin-top:10px]",
                            children: [(0, i.jsx)(ii.TextField, {
                                id: "place-ids",
                                label: "",
                                placeholder: r("Placeholder.EnterExperienceIDs"),
                                variant: "outlined",
                                size: "small",
                                value: N,
                                onChange: q,
                                fullWidth: !0
                            }), (0, i.jsxs)(nQ.Typography, {
                                variant: "caption",
                                className: "[opacity:0.6] block [margin-top:4px]",
                                children: [N ? N.split(",").filter(Boolean).length : 0, "/", 5, " ", r("Label.ExperiencesCount")]
                            })]
                        })]
                    })]
                })]
            }), (0, i.jsxs)("div", {
                className: "flex padding-x-large padding-y-medium gap-small",
                children: [(0, i.jsx)(nF.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: z,
                    disabled: G,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: r("Action.Save")
                }), (0, i.jsx)(nF.Button, {
                    variant: "contained",
                    color: "secondary",
                    onClick: o,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: r("Action.Cancel")
                })]
            })]
        })
    };
    var ix = e.i(186214),
        ig = e.i(759283);
    let ib = (e, t) => {
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
    var iy = e.i(685245),
        iI = e.i(431498);
    let iT = (0, nw.makeStyles)()(e => ({
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
        iC = ["makeup", "clothing", "accessories"],
        iw = ["clothing", "makeup"],
        iS = {
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

    function iA(e) {
        return e ? iS.clothing.all : "Label.ClothingOnlyTShirtsPantsSweaters"
    }
    let iM = (0, s.withTranslation)(e => {
        let t, {
                open: n,
                onClose: o,
                categoryFlags: r,
                assetTypesByCategory: l
            } = e,
            {
                translate: d
            } = (0, s.useTranslation)(),
            {
                classes: u,
                cx: c
            } = iT(),
            {
                enqueue: m,
                close: p
            } = (0, is.useSnackbar)(),
            h = (0, f.useCurrentGroup)(),
            v = !1 !== r.showCategorySubtypeDropdowns,
            x = (0, a.useMemo)(() => v ? iC : iw, [v]),
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
            j = (0, a.useMemo)(() => l ? {
                clothing: l.clothing,
                makeup: l.makeup,
                accessories: l.accessories
            } : {
                clothing: [],
                makeup: [],
                accessories: []
            }, [l]),
            E = (0, a.useMemo)(() => ({
                clothing: r.showClothing,
                makeup: r.showMakeup,
                accessories: r.showAccessories
            }), [r.showAccessories, r.showClothing, r.showMakeup]);
        (0, a.useEffect)(() => {
            if (n) {
                let e = {};
                if (l) {
                    let {
                        clothing: t,
                        makeup: n,
                        accessories: i
                    } = l;
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
        }, [n, l]);
        let k = (0, a.useCallback)(() => {
                o()
            }, [o]),
            L = (0, a.useCallback)(() => {
                M("enable"), S(!0)
            }, []),
            R = (0, a.useCallback)(() => {
                M("disable"), S(!0)
            }, []),
            N = (0, a.useCallback)(async () => {
                if (!l || null === A) return void o();
                let e = x.flatMap(e => E[e] ? j[e].filter(e => y[e]) : []);
                try {
                    await io.default.bulkUpdateCollectible(P.uuidService.generateRandomUuid(), null == h ? void 0 : h.id, e.map(e => (0, n4.translateAssetType)(e)), "enable" === A), m({
                        message: d("Message.TimedOptionSettingsApplied"),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: ig.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    }), window.location.reload(), o()
                } catch (e) {
                    m({
                        message: d(ib(await (0, th.default)(e), "Error.Unknown")),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: ig.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    })
                }
            }, [l, y, A, null == h ? void 0 : h.id, m, p, o, j, E, d, x]),
            D = (0, a.useCallback)(() => {
                S(!1), M(null)
            }, []),
            O = (0, a.useMemo)(() => x.map(e => {
                if (!E[e]) return null;
                let t = j[e];
                if (0 === t.length) return null;
                let n = t.filter(e => y[e]);
                if (0 === n.length) return null;
                if (n.length === t.length) return d("clothing" === e ? iA(v) : iS[e].all);
                let i = d(iS[e].short),
                    a = n.map(e => d(ig.assetFullNameKeys[e])).join(", ");
                return "".concat(i, " (").concat(a, ")")
            }).filter(e => null !== e), [y, j, E, v, d, x]),
            U = (0, a.useMemo)(() => x.some(e => E[e] && j[e].some(e => y[e])), [y, j, E, x]),
            B = (0, i.jsxs)(i.Fragment, {
                children: [(0, i.jsx)(ix.DialogContentText, {
                    className: u.descriptionText,
                    children: d("Description.BulkUpdateAllTimedOptions")
                }), (0, i.jsx)(nX.default, {
                    flexDirection: "column",
                    classes: {
                        root: u.checkboxList
                    },
                    children: x.map(e => (e => {
                        let t = j[e];
                        if (!E[e]) return null;
                        let n = g[e],
                            s = "timed-options-bulk-".concat(e, "-subtypes"),
                            o = d("clothing" === e ? iA(v) : iS[e].all);
                        return (0, i.jsxs)(a.default.Fragment, {
                            children: [(0, i.jsxs)("div", {
                                className: u.categoryRow,
                                children: [v ? (0, i.jsx)(nI.IconButton, {
                                    type: "button",
                                    size: "small",
                                    className: u.expandToggle,
                                    onClick: () => b(t => ({
                                        ...t,
                                        [e]: !t[e]
                                    })),
                                    "aria-expanded": n,
                                    "aria-controls": s,
                                    "aria-label": d("AriaLabel.ToggleTimedOptionsCategorySubtypes", {
                                        categoryName: o
                                    }),
                                    color: "inherit",
                                    children: (0, i.jsx)(iI.ChevronRightIcon, {
                                        className: c(n ? u.expandToggleExpanded : u.expandToggleCollapsed)
                                    })
                                }) : null, (0, i.jsx)(iy.Checkbox, {
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
                                    className: u.categoryLabelWide
                                })]
                            }), v && n ? (0, i.jsx)("div", {
                                id: s,
                                className: u.subtypeIndent,
                                children: t.map(e => (0, i.jsx)(iy.Checkbox, {
                                    label: d(ig.assetFullNameKeys[e]),
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
                }), (0, i.jsxs)(nX.default, {
                    flexDirection: "row",
                    classes: {
                        root: u.buttonContainer
                    },
                    children: [(0, i.jsx)(nF.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: L,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !U,
                        children: d("Action.Enable")
                    }), (0, i.jsx)(nF.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: R,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !U,
                        children: d("Action.Disable")
                    })]
                })]
            });
        return w && (t = "enable" === A ? "Description.ThisWillEnableTimedOptionsFor" : "Description.ThisWillDisableTimedOptionsFor", B = (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(ix.DialogContentText, {
                className: u.descriptionText,
                children: d(t)
            }), O.length > 0 && (0, i.jsx)("ul", {
                className: u.bulletList,
                children: O.map(e => (0, i.jsx)("li", {
                    children: e
                }, e))
            }), (0, i.jsx)(ix.DialogContentText, {
                className: u.descriptionText,
                children: d("Description.ThisWillAlsoReplaceAnyItemLevelSettings")
            }), (0, i.jsxs)(nX.default, {
                flexDirection: "row",
                classes: {
                    root: u.buttonContainer
                },
                children: [(0, i.jsx)(nF.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: N,
                    size: "medium",
                    className: u.actionButton,
                    children: d("Action.Confirm")
                }), (0, i.jsx)(nF.Button, {
                    variant: "contained",
                    color: "secondary",
                    onClick: D,
                    size: "medium",
                    className: u.actionButton,
                    children: d("Action.Cancel")
                })]
            })]
        })), (0, i.jsxs)(n3.Dialog, {
            open: n,
            onClose: k,
            maxWidth: "Small",
            color: "primaryBrand",
            classes: {
                paper: u.dialogPaper
            },
            children: [(0, i.jsxs)(n8.DialogTitle, {
                className: u.dialogTitle,
                children: [(0, i.jsx)("span", {
                    className: u.dialogTitleText,
                    children: w ? d("Title.ConfirmOption") : d("Action.TimedOptions")
                }), !w && (0, i.jsx)(nI.IconButton, {
                    "aria-label": "Close",
                    onClick: k,
                    size: "small",
                    className: u.closeButton,
                    color: "inherit",
                    children: (0, i.jsx)(n9.CloseIcon, {})
                })]
            }), (0, i.jsx)(n7.DialogContent, {
                className: u.dialogContent,
                children: B
            })]
        })
    }, [G.TranslationNamespace.ConfigureItem, G.TranslationNamespace.Creations, G.TranslationNamespace.AssetTypes]);

    function ij(e) {
        return "Tshirt" === e ? m.Asset.TShirt : "TshirtAccessory" === e ? m.Asset.TShirtAccessory : e
    }
    let iE = (0, nw.makeStyles)()(e => ({
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
        iP = (0, s.withTranslation)(e => {
            let t, n, o, r, {
                    open: l,
                    onClose: d
                } = e,
                {
                    translate: u,
                    translateHTML: c
                } = (0, s.useTranslation)(),
                {
                    classes: p
                } = iE(),
                {
                    enqueue: h,
                    close: v
                } = (0, is.useSnackbar)(),
                x = (0, f.useCurrentGroup)(),
                [g, b] = (0, a.useState)(null),
                [y, I] = (0, a.useState)(() => P.uuidService.generateRandomUuid()),
                [T, C] = (0, a.useState)({
                    showClothing: !1,
                    showMakeup: !1,
                    showAccessories: !1,
                    showCategorySubtypeDropdowns: !0
                }),
                [w, S] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                l ? (b(null), I(P.uuidService.generateRandomUuid()), (0, n2.getValidTimedOptionsTypes)().then(() => {
                    let e = new Set(n2.ValidTimedOptionsAssetTypes.map(e => ij(e))),
                        t = 3 === e.size && Array.from(n0.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).every(t => e.has(t));
                    if (S(t), t) C({
                        showClothing: !1,
                        showMakeup: !1,
                        showAccessories: !1,
                        showCategorySubtypeDropdowns: !0
                    });
                    else {
                        let t = [...e].every(e => n0.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e) || n0.MAKEUP_ASSET_TYPES.includes(e)),
                            n = e.has(m.Asset.EyeMakeup),
                            i = n0.CLOTHING_ASSET_TYPES.some(t => e.has(t) && !n0.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(t)),
                            a = Array.from(n0.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(t => e.has(t));
                        C({
                            showClothing: i || a,
                            showMakeup: n,
                            showAccessories: e.has(m.Asset.Hat),
                            showCategorySubtypeDropdowns: !t
                        })
                    }
                })) : I(P.uuidService.generateRandomUuid())
            }, [l]);
            let A = (0, a.useCallback)(async () => {
                    try {
                        await io.default.bulkUpdateCollectible(y, null == x ? void 0 : x.id, [64, 66, 68], !0 === g), h({
                            message: u("Message.TimedOptionSettingsApplied"),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: ig.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        }), window.location.reload(), d()
                    } catch (e) {
                        h({
                            message: u(ib(await (0, th.default)(e), "Error.Unknown")),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: ig.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        })
                    }
                }, [h, v, u, d, y, null == x ? void 0 : x.id, g]),
                M = (0, a.useCallback)(() => {
                    d()
                }, [d]),
                j = !w,
                E = j ? (t = new Set(n2.ValidTimedOptionsAssetTypes.map(e => ij(e))), n = n0.CLOTHING_ASSET_TYPES.some(e => t.has(e) && !n0.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e)), o = Array.from(n0.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(e => t.has(e)), r = T.showCategorySubtypeDropdowns && (!o || n) ? n0.CLOTHING_ASSET_TYPES.filter(e => t.has(e)) : Array.from(n0.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).filter(e => t.has(e)), {
                    clothing: r,
                    makeup: n0.MAKEUP_ASSET_TYPES.filter(e => t.has(e)),
                    accessories: T.showCategorySubtypeDropdowns ? n0.ACCESSORY_ASSET_TYPES.filter(e => t.has(e)) : []
                }) : void 0;
            return j ? (0, i.jsx)(iM, {
                open: l,
                onClose: M,
                categoryFlags: T,
                assetTypesByCategory: E
            }) : (0, i.jsxs)(n3.Dialog, {
                open: l,
                onClose: M,
                maxWidth: "Small",
                color: "primaryBrand",
                children: [(0, i.jsxs)(n8.DialogTitle, {
                    className: p.dialogTitle,
                    children: [(0, i.jsx)("span", {
                        children: null === g ? u("Action.TimedOptions") : u("Action.Confirm")
                    }), (0, i.jsx)(nI.IconButton, {
                        "aria-label": "Close",
                        onClick: M,
                        size: "small",
                        className: p.closeButton,
                        color: "inherit",
                        children: (0, i.jsx)(n9.CloseIcon, {})
                    })]
                }), (0, i.jsx)(n7.DialogContent, {
                    className: p.dialogContent,
                    children: null === g ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(ix.DialogContentText, {
                            className: p.descriptionText,
                            children: u("Description.BulkUpdateTimedOptions")
                        }), (0, i.jsxs)(nX.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(nF.Button, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    b(!0)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.TurnAllOn")
                            }), (0, i.jsx)(nF.Button, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    b(!1)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.TurnAllOff")
                            })]
                        })]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(ix.DialogContentText, {
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
                        }), (0, i.jsxs)(nX.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(nF.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                onClick: A,
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.Confirm")
                            }), (0, i.jsx)(nF.Button, {
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
        }, [G.TranslationNamespace.ConfigureItem, G.TranslationNamespace.Creations]),
        ik = Object.values(U.SearchSortParameter),
        iL = Object.values(nB.EventSortBy),
        iR = ["publishSettings"],
        iN = e => {
            var t;
            let {
                menuState: n
            } = e, {
                translate: o
            } = (0, s.useTranslation)(), {
                unifiedLogger: r
            } = (0, nZ.useUnifiedLoggerProvider)(), {
                ready: l,
                value: d
            } = (0, u.useFlag)(nJ.isAutoPublishPreferencesEnabled), {
                isFetched: c
            } = (0, f.useGroups)(), {
                classes: {
                    toolbarContainer: p,
                    sortContainer: h,
                    timedOptionsButton: v,
                    timedOptionsButtonDivider: x
                }
            } = n5(), [b, T] = (0, a.useState)(!1), [C, w] = (0, a.useState)(!1), [S, A] = (0, a.useState)(0), [M, E] = (0, a.useState)(!1), [k, L] = (0, a.useState)(!1), [R, N] = (0, a.useState)(null);
            (0, a.useEffect)(() => {
                (0, n2.getValidTimedOptionsTypes)().then(() => {
                    L(!0)
                })
            }, []);
            let {
                sort: D,
                setSort: O,
                sortOrder: B,
                setSortOrder: z,
                isArchived: V,
                setIsArchived: F,
                isAgeRestrictedCollaboration: G,
                setIsAgeRestrictedCollaboration: _,
                isPublicOnly: H,
                setIsPublicOnly: K,
                isOnMarketplace: W,
                setIsOnMarketplace: Y
            } = (0, Q.default)(), [{
                filterIndex: J,
                publishSettings: X
            }] = (0, q.useQueryParams)(["filterIndex", "publishSettings"]), Z = (0, a.useContext)(j).isResolving, [, $] = (0, q.useQueryParams)(["activeTab", "filterIndex"]), [, ee] = (0, q.useQueryParams)(iR), et = (0, a.useMemo)(() => {
                let e = I.default.getAssetType(n);
                return e !== m.Asset.AllCatalogAsset || Number(J) > 0 ? e : g.TAXONOMY_HOST_ASSET
            }, [n, J]), en = (et in n0.AvatarMenuMap || et === m.Asset.AllCatalogAsset) && d, ei = (0, n$.normalizeSingleQueryParam)(X), ea = !!en && c && !Z && !M && ("true" === ei || "1" === ei);
            (0, a.useEffect)(() => {
                l && c && !Z && void 0 !== ei && (ea || ee({
                    publishSettings: null
                }, {
                    skipHistory: !0
                }))
            }, [l, Z, c, ea, ei, ee]);
            let es = (0, a.useCallback)(() => {
                    w(!1), ea && (E(!0), ee({
                        publishSettings: null
                    }, {
                        skipHistory: !0
                    }))
                }, [ea, ee]),
                {
                    canUseTaxonomy: eo,
                    isTaxonomyMode: er
                } = (0, nL.default)(et),
                el = nD(n, (0, f.useCurrentGroup)()),
                {
                    isSortable: ed,
                    isArchivable: eu
                } = (0, a.useMemo)(() => {
                    let e = er || null == J ? void 0 : Number(J),
                        t = I.default.isAssetTypeArchivable(et, e);
                    return {
                        isSortable: I.default.isAssetTypeSortable(et),
                        isArchivable: t || I.default.isAssetTypeDirectlyArchivable(et)
                    }
                }, [et, J, er]),
                ec = o("Label.CategorizeByTaxonomy"),
                em = (0, a.useCallback)(() => {
                    var e;
                    let t = null == (e = el[0]) ? void 0 : e.type;
                    $({
                        activeTab: er ? null != t ? t : et : (0, g.buildTaxonomyActiveTab)(),
                        filterIndex: 0
                    }, {
                        skipHistory: !0
                    })
                }, [er, et, el, $]),
                ep = (0, a.useMemo)(() => !ed && !eu && !eo && et !== m.Asset.MyExperiences && et !== m.Asset.SharedExperiences, [ed, eu, eo, et]),
                eh = (0, a.useCallback)(e => {
                    let {
                        value: t
                    } = e.target;
                    if (et === m.Asset.MyExperiences || et === m.Asset.SharedExperiences) {
                        if (!ik.includes(t)) return;
                        O(e => ({
                            ...e,
                            [m.Asset.Place]: t
                        }))
                    } else iL.includes(t) && O(e => ({
                        ...e,
                        [et]: t
                    }))
                }, [O, et]),
                ev = (0, a.useCallback)(() => {
                    z(e => e === P.SortOrder.Asc ? P.SortOrder.Desc : P.SortOrder.Asc)
                }, [z]),
                ef = (0, a.useCallback)(() => {
                    T(!0)
                }, []),
                ex = (0, a.useCallback)(() => {
                    let e = !G;
                    r.logClickEvent({
                        eventName: tv.default.ImpactedExperiencesFilterClick,
                        parameters: {
                            page: "creations",
                            action: e ? "enable" : "disable",
                            assetType: et.toString()
                        }
                    }), _(e => !e)
                }, [r, G, et, _]),
                eg = et === m.Asset.MyExperiences || et === m.Asset.SharedExperiences,
                eb = (0, a.useMemo)(() => eg ? Object.values(U.SearchSortParameter).map(e => ({
                    value: e,
                    labelKey: y.universeSortTranslationKeys[e]
                })) : Object.values(nB.EventSortBy).map(e => ({
                    value: e,
                    labelKey: y.eventSortTranslationKeys[e]
                })), [eg]),
                ey = (0, a.useMemo)(() => eg ? D[m.Asset.Place] : (0, n1.getSortForAssetType)(et, D), [eg, D, et]),
                eI = (0, a.useMemo)(() => {
                    var e, t;
                    if (!k) return !1;
                    let i = er || null == J ? void 0 : Number(J);
                    if (void 0 !== i && n0.AvatarMenuMap[et]) {
                        let e = n0.AvatarMenuMap[et][i];
                        if (e) return (0, n4.getIsRentableType)(e.assetType, e.bundleType)
                    }
                    return (0, n4.getIsRentableType)(null != (e = null == (t = n.submenuItem) ? void 0 : t.type) ? e : et, void 0)
                }, [et, J, er, null == (t = n.submenuItem) ? void 0 : t.type, k]);
            if (ep) return null;
            let eT = et === m.Asset.MyExperiences || et === m.Asset.SharedExperiences || eu || eo || et === m.Asset.MeshPart,
                eC = et === m.Asset.MyExperiences || et === m.Asset.SharedExperiences,
                ew = et === m.Asset.Decal || et === m.Asset.MeshPart,
                eS = !en && !eI && !!(et === m.Asset.MyExperiences || eC || eu && et);
            return (0, i.jsxs)(nX.Flex, {
                flexDirection: "row",
                justifyContent: "flex-start",
                alignItems: "flex-start",
                flexWrap: "wrap",
                classes: {
                    root: p
                },
                children: [eT && (0, i.jsxs)(nX.Flex, {
                    alignItems: "center",
                    gap: 1,
                    flexDirection: "row",
                    children: [eS && (0, i.jsx)(nQ.Typography, {
                        marginRight: "16px",
                        children: o("Label.ShowPrefix")
                    }), et === m.Asset.MyExperiences && (0, i.jsx)(nG.FormControlLabel, {
                        control: (0, i.jsx)(nY.Switch, {
                            checked: H,
                            onChange: () => K(e => !e),
                            "aria-label": o("Label.Public")
                        }),
                        label: o("Label.Public")
                    }), eC && (0, i.jsx)(nG.FormControlLabel, {
                        control: (0, i.jsx)(nY.Switch, {
                            checked: G,
                            onChange: ex,
                            "aria-label": o("Label.Impacted")
                        }),
                        label: o("Label.Impacted")
                    }), eI && !en && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nF.Button, {
                            variant: "contained",
                            color: "secondary",
                            onClick: ef,
                            classes: {
                                root: v
                            },
                            children: o("Action.TimedOptions")
                        }), (0, i.jsx)(nq.Divider, {
                            orientation: "vertical",
                            flexItem: !0,
                            classes: {
                                root: x
                            }
                        })]
                    }), eu && et && (0, i.jsx)(nG.FormControlLabel, {
                        control: (0, i.jsx)(nY.Switch, {
                            checked: V,
                            onChange: () => F(e => !e),
                            "aria-label": en ? o("Action.ShowArchived") : o("Label.Archived")
                        }),
                        label: en ? o("Action.ShowArchived") : o("Label.Archived")
                    }), eo && (0, i.jsx)(nG.FormControlLabel, {
                        control: (0, i.jsx)(nY.Switch, {
                            checked: er,
                            onChange: em,
                            "aria-label": ec
                        }),
                        label: ec
                    }), en && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nq.Divider, {
                            orientation: "vertical",
                            flexItem: !0,
                            classes: {
                                root: x
                            }
                        }), (0, i.jsx)(nI.IconButton, {
                            "aria-label": o("Label.Settings"),
                            size: "medium",
                            color: "secondary",
                            onClick: e => N(e.currentTarget),
                            children: (0, i.jsx)(nW.SettingsIcon, {})
                        }), (0, i.jsxs)(n_.Menu, {
                            anchorEl: R,
                            open: null != R,
                            onClose: () => N(null),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "right"
                            },
                            transformOrigin: {
                                vertical: "top",
                                horizontal: "right"
                            },
                            className: "margin-top-small",
                            children: [eI && (0, i.jsx)(nH.MenuItem, {
                                onClick: () => {
                                    N(null), ef()
                                },
                                children: (0, i.jsx)(nQ.Typography, {
                                    variant: "body1",
                                    children: o("Action.TimedOptions")
                                })
                            }), (0, i.jsx)(nH.MenuItem, {
                                onClick: () => {
                                    N(null), A(e => e + 1), w(!0)
                                },
                                children: (0, i.jsx)(nQ.Typography, {
                                    variant: "body1",
                                    children: o("Action.StudioPublishSettings")
                                })
                            })]
                        })]
                    }), ew && (0, i.jsx)(nG.FormControlLabel, {
                        control: (0, i.jsx)(nY.Switch, {
                            "aria-label": o("Label.OnCreatorStore"),
                            checked: W,
                            onChange: () => Y(e => !e)
                        }),
                        label: o("Label.OnCreatorStore")
                    })]
                }), ed && (0, i.jsxs)(nX.Flex, {
                    flexDirection: "row",
                    classes: {
                        root: h
                    },
                    alignItems: "center",
                    flexWrap: "nowrap",
                    children: [(0, i.jsx)(nK.Select, {
                        variant: "outlined",
                        margin: "dense",
                        size: "small",
                        label: o("Label.SortBy"),
                        value: ey,
                        onChange: eh,
                        inputProps: {
                            "aria-label": o("Label.SortBy")
                        },
                        children: eb.map(e => (0, i.jsx)(nH.MenuItem, {
                            value: e.value,
                            children: o(e.labelKey)
                        }, e.value))
                    }), (0, i.jsx)(nI.IconButton, {
                        "aria-label": o("Heading.SortOrder"),
                        onClick: ev,
                        size: "large",
                        children: B === P.SortOrder.Asc ? (0, i.jsx)(nV.ArrowUpwardIcon, {
                            color: "secondary"
                        }) : (0, i.jsx)(nz.ArrowDownwardIcon, {
                            color: "secondary"
                        })
                    })]
                }), (0, i.jsx)(iP, {
                    open: b,
                    onClose: () => T(!1)
                }), (0, i.jsx)(iv, {
                    open: C || ea,
                    onClose: es
                }, S)]
            })
        },
        iD = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                verificationMetadata: a,
                group: s
            } = e, o = [m.Asset.UpcomingEvent, m.Asset.PastEvent, m.Asset.DraftEvent], r = !!t.submenuItem && o.includes(t.submenuItem.type);
            return (0, i.jsxs)("div", {
                className: "flex justify-between padding-top-small",
                children: [t.menuItem.type === m.Asset.TShirt && (0, i.jsx)(nb, {
                    data: a
                }), !r && (0, i.jsx)("div", {
                    className: "flex width-full padding-bottom-large [align-content:flex-start] [row-gap:12px] justify-between flex-row items-start wrap",
                    children: t.menuItem.type === m.Asset.Moments ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nx, {}), (0, i.jsx)(nh, {})]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [t.submenuItem && (0, i.jsx)(nU, {
                            menuState: t,
                            onMenuStateChange: n,
                            group: s
                        }), (0, i.jsx)(iN, {
                            menuState: t
                        })]
                    })
                })]
            })
        };
    var iO = e.i(675454),
        iU = e.i(71375),
        iB = e.i(83560),
        iz = e.i(576069),
        iV = e.i(134817);
    let iF = [];

    function iq(e) {
        return null != e.universeId ? e.universeId : "experienceId" in e && "number" == typeof e.experienceId ? e.experienceId : void 0
    }
    var iG = e.i(897350),
        i_ = e.i(533030);
    let iH = (e, t) => {
            let {
                user: n
            } = (0, E.useAuthentication)(), {
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
                    tS(tx.LoadLocalVideoMedia, n);
                    try {
                        let i = await eT(r, e);
                        t || (u(i), null != i && tA(tx.LoadLocalVideoMedia, n))
                    } catch (n) {
                        tT(tx.LoadLocalVideoMedia, n, {
                            draftId: e
                        }), t || u(null)
                    }
                })(), () => {
                    t = !0
                }
            }, [e, i, l, r]), l) ? l : i ? d : null
        },
        iK = "block width-full height-full max-w-full max-h-full object-contain",
        iW = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)("div", {
                className: "flex items-center justify-center radius-medium bg-surface-200 width-full shrink-0 overflow-hidden h-[240px]",
                "data-testid": "moments-video-preview-container",
                children: t
            })
        },
        iY = e => {
            let {
                thumbnailUrl: t,
                videoUrl: n
            } = e;
            return n ? (0, i.jsx)(iW, {
                children: (0, i.jsx)("video", {
                    "aria-label": "Moment video preview",
                    className: "radius-medium ".concat(iK),
                    controls: !0,
                    playsInline: !0,
                    poster: t,
                    src: n,
                    children: (0, i.jsx)("track", {
                        kind: "captions"
                    })
                })
            }) : t ? (0, i.jsx)(iW, {
                children: (0, i.jsx)("img", {
                    alt: "Moment thumbnail preview",
                    className: "radius-medium ".concat(iK),
                    src: t
                })
            }) : (0, i.jsx)(iW, {})
        },
        iQ = (0, s.withTranslation)(e => {
            var t, n, o;
            let {
                moment: r,
                open: l,
                onOpenChange: d,
                onMomentMetadataChange: u,
                onPublish: c,
                onDelete: m,
                publishingDraftId: p = null,
                deletingMomentKey: h = null,
                isPublishDisabled: v = !1
            } = e, {
                translate: f
            } = (0, s.useTranslation)(), {
                locale: x
            } = (0, s.useLocalization)(), g = t_(), b = tP(x), [y, I] = (0, a.useState)(() => {
                var e, t, n, i;
                let a;
                return r && ((a = {
                    id: null != (i = iq(n = r)) ? i : 0,
                    name: n.experienceName
                }).id > 0 || (null != (e = null == (t = a.name) ? void 0 : t.length) ? e : 0) > 0) ? a : void 0
            }), [T, C] = (0, a.useState)(() => {
                var e;
                return null != (e = null == r ? void 0 : r.description) ? e : ""
            }), [w, S] = (0, a.useState)(), A = null != (t = null != w ? w : null == r ? void 0 : r.locale) ? t : b, M = (null == r ? void 0 : r.status) === eo && !0 === r.hasLocalVideo, j = iH((null == r ? void 0 : r.status) === eo ? r.draftId : null, {
                enabled: l && M,
                thumbnailUrl: null == r ? void 0 : r.thumbnailUrl,
                videoUrl: null == r ? void 0 : r.videoUrl
            }), E = (0, a.useCallback)(() => {
                r && !v && null == p && (null == c || c(r))
            }, [v, r, c, p]), P = (0, a.useCallback)(() => {
                r && h !== tH(r) && (null == m || m(r))
            }, [h, r, m]), k = (0, a.useCallback)(e => {
                r && e.id && e.name && (I(e), null == u || u(r, {
                    experienceId: e.id,
                    rootPlaceId: e.rootPlaceId,
                    experienceName: e.name
                }))
            }, [r, u]), L = (0, a.useCallback)(e => {
                C(e.target.value)
            }, []), R = (0, a.useCallback)(e => {
                S(e), r && e !== r.locale && (null == u || u(r, {
                    locale: e
                }))
            }, [r, u]), N = (0, a.useCallback)(() => {
                r && T !== r.description && (null == u || u(r, {
                    description: T
                }))
            }, [T, r, u]), D = (0, a.useCallback)(() => {
                N()
            }, [N]), O = (0, a.useCallback)(e => {
                e || N(), d(e)
            }, [N, d]);
            if (!r) return null;
            let U = tH(r),
                B = null != p && p === U,
                z = null != p,
                V = null != h && h === U,
                F = r.status === ea,
                q = r.status === eo,
                G = q && !B,
                _ = !F && null != c && (q && M || B),
                H = null != m,
                K = T.length >= 140;
            return (0, i.jsx)(iG.SheetRoot, {
                open: l,
                onOpenChange: O,
                children: (0, i.jsxs)(iG.SheetContent, {
                    closeLabel: f("Action.Close"),
                    largeScreenVariant: "side",
                    children: [(0, i.jsx)(iG.SheetTitle, {
                        children: f("Heading.EditMoment")
                    }), (0, i.jsxs)(iG.SheetBody, {
                        className: "flex flex-col gap-y-medium padding-top-small padding-bottom-large",
                        children: [(0, i.jsx)(iY, {
                            thumbnailUrl: null != (n = null == j ? void 0 : j.thumbnailUrl) ? n : r.thumbnailUrl,
                            videoUrl: null != (o = null == j ? void 0 : j.videoUrl) ? o : r.videoUrl
                        }), G ? (0, i.jsx)(i.Fragment, {
                            children: y ? (0, i.jsx)(tX, {
                                experience: y,
                                onChangeExperience: () => I(void 0)
                            }) : (0, i.jsx)(t7, {
                                onExperienceResolved: k
                            })
                        }) : y ? (0, i.jsxs)("div", {
                            className: "flex flex-col gap-y-xsmall width-full margin-top-small",
                            children: [(0, i.jsx)("span", {
                                className: "text-body-small content-muted",
                                children: f("CreateMomentModal.ExperienceInput.Label")
                            }), (0, i.jsx)(tX, {
                                experience: y,
                                hideTitle: !0
                            })]
                        }) : null, g ? (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: G ? (0, i.jsx)(ne, {
                                value: A,
                                onChange: R,
                                isDisabled: B
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: f("CreateMomentModal.LanguageInput.Label")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-content-language-readonly",
                                    children: tk(r.locale)
                                })]
                            })
                        }) : null, (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: G ? (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)(i_.TextArea, {
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
                    }), (0, i.jsx)(iG.SheetActions, {
                        className: "width-full",
                        children: (0, i.jsxs)("div", {
                            className: "flex gap-small width-full",
                            children: [_ ? (0, i.jsx)(X.Button, {
                                variant: "Emphasis",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: v || z,
                                isLoading: B,
                                onClick: E,
                                children: f("Action.Publish")
                            }) : null, H ? (0, i.jsx)(X.Button, {
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
        }, [G.TranslationNamespace.Creations, G.TranslationNamespace.Controls]);
    var iJ = e.i(696490),
        iX = e.i(493924);
    let iZ = e => {
        let {
            onCreateClick: t
        } = e, {
            translate: n
        } = (0, s.useTranslation)();
        return (0, i.jsx)(iX.default, {
            title: n("Heading.ReachPlayersDirectlyInMoments"),
            size: "large",
            illustration: "videos",
            description: (0, i.jsxs)(i.Fragment, {
                children: [n("Description.UploadExternalVideosToMoments"), " ", (0, i.jsx)(iJ.Link, {
                    "aria-label": n("Label.LearnMore"),
                    href: ng.MOMENTS_LEARN_MORE_URL,
                    target: "_blank",
                    rel: "noopener noreferrer",
                    variant: "Inline",
                    underline: "always",
                    isExternal: !1,
                    children: n("Label.LearnMore")
                })]
            }),
            children: (0, i.jsx)(X.Button, {
                variant: "Emphasis",
                size: "Large",
                type: "button",
                onClick: t,
                children: n("Action.CreateMoments")
            })
        })
    };
    var i$ = e.i(197649),
        i0 = e.i(708064),
        i1 = e.i(390398),
        i2 = e.i(516674),
        i4 = e.i(125677),
        i5 = e.i(20227),
        i3 = e.i(494601);
    let i7 = {
            [ea]: "bg-system-success",
            [es]: "bg-system-warning",
            [eo]: "bg-surface-300",
            [er]: "bg-system-alert"
        },
        i8 = e => {
            let {
                status: t,
                label: n
            } = e;
            return (0, i.jsxs)("span", {
                className: "inline-flex items-center gap-xsmall",
                children: [(0, i.jsx)("span", {
                    "aria-hidden": !0,
                    className: "size-[8px] radius-circle shrink-0 ".concat(i7[t]),
                    "data-testid": "moment-status-dot-".concat(t)
                }), (0, i.jsx)("span", {
                    children: n
                })]
            })
        };
    var i9 = e.i(252082),
        i6 = e.i(540513),
        ae = e.i(914040);
    let at = (0, s.withTranslation)(e => {
            let t, {
                    moment: n
                } = e,
                {
                    translate: o
                } = (0, s.useTranslation)(),
                r = n.status === eo,
                l = r && !0 === n.hasLocalVideo,
                d = iH(r ? n.draftId : null, {
                    enabled: l,
                    thumbnailUrl: n.thumbnailUrl,
                    videoUrl: n.videoUrl
                }),
                {
                    assetId: u
                } = n,
                [c, m] = (0, a.useState)(!1),
                p = o("Label.MomentVideoPreview"),
                h = !!(null == d ? void 0 : d.videoUrl) || null != u,
                v = (0, a.useCallback)(() => {
                    h && m(!0)
                }, [h]),
                f = (0, a.useCallback)(() => {
                    m(!1)
                }, []);
            t = (null == d ? void 0 : d.thumbnailUrl) ? (0, i.jsx)("img", {
                alt: "",
                className: "radius-small [object-fit:cover]",
                "data-testid": "moment-video-thumbnail-image",
                height: 48,
                src: d.thumbnailUrl,
                width: 48
            }) : null != u ? (0, i.jsx)("div", {
                className: "radius-small clip size-[48px]",
                "data-testid": "moment-video-thumbnail-image",
                children: (0, i.jsx)(i6.Thumbnail2d, {
                    alt: "",
                    containerClass: "block",
                    imgClassName: "[object-fit:cover]",
                    returnPolicy: i6.ReturnPolicy.PlaceHolder,
                    targetId: u,
                    type: i6.ThumbnailTypes.assetThumbnail
                })
            }) : (0, i.jsx)("div", {
                "aria-hidden": !0,
                className: "radius-small bg-surface-200 size-[48px]"
            });
            let x = null;
            return ((null == d ? void 0 : d.videoUrl) ? x = (0, i.jsx)("video", {
                "aria-label": p,
                autoPlay: !0,
                className: "radius-medium block max-width-[500px] max-height-[500px]",
                loop: !0,
                muted: !0,
                playsInline: !0,
                src: d.videoUrl
            }) : null != u && (x = (0, i.jsx)("div", {
                "aria-label": p,
                className: "radius-medium clip max-width-[500px] max-height-[500px] bg-surface-200",
                children: (0, i.jsx)(ae.RobloxVideoPlayer, {
                    videoAssetId: String(u),
                    environment: "production",
                    src: void 0,
                    autoPlay: !0,
                    disableControls: !0,
                    loop: !0,
                    muted: !0
                })
            })), h) ? (0, i.jsxs)(i9.Popover, {
                open: c,
                onOpenChange: m,
                children: [(0, i.jsx)(i9.PopoverAnchor, {
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
                }), (0, i.jsx)(i9.PopoverContent, {
                    align: "start",
                    ariaLabel: p,
                    className: "outline-none",
                    side: "bottom",
                    children: x
                })]
            }) : t
        }, [G.TranslationNamespace.Creations]),
        an = [10, 25, 50],
        ai = {
            [ea]: "MomentsTable.NoActiveMoments",
            [eo]: "MomentsTable.NoDraftMoments"
        },
        aa = e => {
            let {
                moment: t,
                disabled: n,
                onBlur: o
            } = e, {
                translate: r
            } = (0, s.useTranslation)(), l = tH(t), [d, u] = (0, a.useState)(t.description), c = d.length >= 140, m = (0, a.useCallback)(e => {
                u(e.target.value)
            }, []), p = (0, a.useCallback)(e => {
                o(t, e)
            }, [t, o]);
            return (0, i.jsxs)("div", {
                className: "flex flex-col gap-y-xsmall width-full",
                children: [(0, i.jsx)(tZ.TextInput, {
                    id: "moment-description-".concat(l),
                    label: r("MomentsTable.Header.Description"),
                    value: d,
                    isDisabled: n,
                    maxLength: 140,
                    placeholder: r("MomentsTable.Placeholders.Description"),
                    size: "Small",
                    onBlur: p,
                    onChange: m
                }), (0, i.jsx)("span", {
                    "aria-live": "polite",
                    className: c ? "text-body-small content-system-alert text-align-x-right" : "text-body-small content-muted text-align-x-right",
                    "data-testid": "moment-description-char-count-".concat(l),
                    children: "".concat(d.length, "/").concat(140)
                })]
            })
        },
        as = e => {
            let {
                moment: t,
                editLabel: n,
                publishingDraftId: o,
                isPublishDisabled: r,
                showContentLanguageColumn: l,
                statusLabel: d,
                onEditMoment: u,
                onDescriptionBlur: c,
                onPublishMoment: m
            } = e, {
                translate: p
            } = (0, s.useTranslation)(), h = tH(t), v = t.status === eo, f = (0, a.useCallback)(() => {
                u(t)
            }, [t, u]), x = (0, a.useCallback)(() => {
                t.status === eo && (null == m || m(t.draftId))
            }, [t, m]);
            return (0, i.jsxs)(i1.TableRow, {
                isHoverable: !0,
                "data-testid": "moment-row-".concat(h),
                children: [(0, i.jsx)(i1.TableCell, {
                    children: (0, i.jsx)(at, {
                        moment: t
                    })
                }), (0, i.jsx)(i1.TableCell, {
                    children: t.experienceName
                }), (0, i.jsx)(i1.TableCell, {
                    children: t.status === ea ? (0, i.jsx)("span", {
                        "data-testid": "moment-description-".concat(h),
                        children: t.description || "-"
                    }) : (0, i.jsx)(aa, {
                        moment: t,
                        disabled: null != o && o === h,
                        onBlur: c
                    }, "moment-description-".concat(h, "-").concat(t.modifiedAt))
                }), l ? (0, i.jsx)(i1.TableCell, {
                    children: (0, i.jsx)("span", {
                        "data-testid": "moment-content-language-".concat(h),
                        children: tk(t.locale)
                    })
                }) : null, (0, i.jsx)(i1.TableCell, {
                    children: (0, i.jsx)(i8, {
                        label: d,
                        status: t.status
                    })
                }), (0, i.jsx)(i1.TableCell, {
                    align: "end",
                    children: (0, i.jsxs)("div", {
                        className: "inline-flex items-center gap-xsmall",
                        children: [(0, i.jsx)(i2.Tooltip, {
                            position: "top-center",
                            title: n,
                            children: (0, i.jsx)(i2.TooltipTrigger, {
                                asChild: !0,
                                children: (0, i.jsx)(i0.IconButton, {
                                    ariaLabel: n,
                                    icon: "icon-regular-pencil",
                                    size: "Small",
                                    type: "button",
                                    variant: "Utility",
                                    onClick: f
                                })
                            })
                        }), v && !0 === t.hasLocalVideo && m ? (0, i.jsx)(X.Button, {
                            size: "Small",
                            type: "button",
                            variant: "Standard",
                            isDisabled: r || null != o,
                            onClick: x,
                            children: p("Action.Publish")
                        }) : null]
                    })
                })]
            })
        },
        ao = (0, s.withTranslation)(e => {
            let {
                moments: t,
                onEditMoment: n,
                onMomentMetadataChange: o,
                onPublishMoment: r,
                publishingDraftId: l = null,
                isPublishDisabled: d = !1,
                hasNextPage: u = !1,
                fetchNextPage: c,
                serverPageSize: m = 25
            } = e, {
                translate: p
            } = (0, s.useTranslation)(), {
                classes: {
                    gridContainer: h,
                    createButtonContainer: v
                }
            } = (0, i3.default)(), {
                statusTab: f
            } = tY(), x = t_(), g = (0, a.useCallback)(e => {
                switch (e) {
                    case ea:
                        return p("MomentsTable.Pills.Active");
                    case es:
                        return p("MomentsTable.Pills.Pending");
                    case eo:
                        return p("MomentsTable.Pills.Draft");
                    case er:
                        return p("MomentsTable.Pills.Moderated");
                    default:
                        return e
                }
            }, [p]), b = f === ea, y = (0, a.useMemo)(() => f === eo ? t.filter(e => e.status === eo || e.status === es) : t.filter(e => e.status === f), [t, f]), {
                page: I,
                rowsPerPage: T,
                onPageChange: C,
                onRowsPerPageChange: w
            } = (0, i5.useTablePagination)({
                count: y.length,
                initialRowsPerPage: 10,
                resetKey: f
            }), {
                currentPage: S
            } = (0, i4.useCurrentPage)(y, {
                page: I,
                rowsPerPage: T,
                hasNextPage: !!b && u,
                fetchNextPage: b ? c : void 0,
                fetchLimit: m
            }), A = (0, a.useCallback)((e, t) => {
                let n = t.target.value;
                n !== e.description && o(e, {
                    description: n
                })
            }, [o]), M = (0, a.useCallback)(e => {
                C(void 0, e)
            }, [C]), j = p("Action.Edit");
            return (0, i.jsx)("div", {
                className: h,
                children: (0, i.jsx)("div", {
                    className: (0, i$.clsx)(v, "flex flex-col gap-xlarge width-full self-stretch"),
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col gap-y-medium width-full",
                        children: [(0, i.jsxs)(i1.Table, {
                            className: "width-full",
                            variant: "Framed",
                            children: [(0, i.jsx)(i1.TableHeader, {
                                children: (0, i.jsxs)(i1.TableRow, {
                                    children: [(0, i.jsx)(i1.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Moments")
                                    }), (0, i.jsx)(i1.TableHeaderCell, {
                                        children: p("MomentsTable.Header.ExperienceName")
                                    }), (0, i.jsx)(i1.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Description")
                                    }), x ? (0, i.jsx)(i1.TableHeaderCell, {
                                        children: p("CreateMomentModal.LanguageInput.Label")
                                    }) : null, (0, i.jsx)(i1.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Status")
                                    }), (0, i.jsx)(i1.TableHeaderCell, {
                                        align: "end",
                                        children: " "
                                    })]
                                })
                            }), (0, i.jsx)(i1.TableBody, {
                                children: 0 === y.length ? (0, i.jsx)(i1.TableRow, {
                                    children: (0, i.jsx)(i1.TableCell, {
                                        colSpan: x ? 6 : 5,
                                        align: "center",
                                        className: "padding-y-xxlarge",
                                        children: (0, i.jsx)("span", {
                                            className: "text-body-medium content-muted block padding-y-xxlarge",
                                            "data-testid": "moments-table-empty-filter-message",
                                            children: p(ai[f])
                                        })
                                    })
                                }) : S.map(e => (0, i.jsx)(as, {
                                    moment: e,
                                    editLabel: j,
                                    publishingDraftId: l,
                                    isPublishDisabled: d,
                                    showContentLanguageColumn: x,
                                    statusLabel: g(e.status),
                                    onEditMoment: n,
                                    onDescriptionBlur: A,
                                    onPublishMoment: r
                                }, tH(e)))
                            })]
                        }), y.length > 0 ? (0, i.jsx)(i1.TablePagination, {
                            page: I,
                            rowsPerPage: T,
                            totalRows: y.length,
                            rowsPerPageOptions: an,
                            onPageChange: M,
                            onRowsPerPageChange: w
                        }) : null]
                    })
                })
            })
        }, [G.TranslationNamespace.Creations, G.TranslationNamespace.Controls]),
        ar = (0, s.withTranslation)(e => {
            let {
                onRetry: t
            } = e, {
                translate: n
            } = (0, s.useTranslation)();
            return (0, i.jsx)($.FeedbackBanner, {
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
        }, [G.TranslationNamespace.Error]);
    var al = e.i(917852);
    let ad = () => {
            window.open(al.idVerificationActionUrl, "_blank", "noopener,noreferrer")
        },
        au = (0, s.withTranslation)(() => {
            let {
                translate: e
            } = (0, s.useTranslation)();
            return (0, i.jsx)($.FeedbackBanner, {
                className: "width-full",
                layout: "Inline",
                variant: "Emphasis",
                severity: "Warning",
                title: e("Heading.MomentsIdVerificationRequired"),
                description: e("Message.MomentsIdVerificationRequired"),
                primaryActionLabel: e("Label.VerifyId"),
                onPrimaryAction: ad,
                "data-testid": "moments-id-verification-banner"
            })
        }, [G.TranslationNamespace.Creations]),
        ac = () => {
            var e;
            (() => {
                let {
                    user: e
                } = (0, E.useAuthentication)(), t = null == e ? void 0 : e.id;
                (0, a.useEffect)(() => () => {
                    void 0 !== t && (() => {
                        for (let e of em.keys()) {
                            let t = em.get(e);
                            t && (URL.revokeObjectURL(t.thumbnailUrl), URL.revokeObjectURL(t.videoUrl), em.delete(e))
                        }
                    })()
                }, [t])
            })();
            let {
                translate: t
            } = (0, s.useTranslation)(), {
                user: n
            } = (0, E.useAuthentication)(), o = null == n ? void 0 : n.id, {
                data: r,
                isLoading: l,
                isError: d,
                refetch: u
            } = (0, iz.useCreatorEligibility)(), c = null != (e = null == r ? void 0 : r.creatorEligibility.includes(iO.CreatorEligibilityEnum.IdVerified)) && e, m = l || d || !c, p = !l && !d && !c, h = (0, a.useCallback)(() => {
                u()
            }, [u]), [v, f] = (0, a.useState)(!1), [x, g] = (0, a.useState)(null), [b, y] = (0, a.useState)({}), {
                moments: I,
                updateMoment: T,
                removeMoment: C
            } = eR(), {
                publishMoment: w,
                publishingDraftId: S,
                isPublishing: A
            } = function() {
                var e;
                let {
                    translate: t
                } = (0, s.useTranslation)(), {
                    locale: n
                } = (0, s.useLocalization)(), i = t_(), {
                    user: o
                } = (0, E.useAuthentication)(), r = null == o ? void 0 : o.id, {
                    mutateAsync: l,
                    isPending: d,
                    variables: u
                } = (0, eU.useMutation)({
                    mutationFn: async e => {
                        let {
                            moment: a
                        } = e;
                        if (null == r) throw Error("Authenticated user is required to publish a moment");
                        let s = await eI(r, a.draftId);
                        if (!s) throw Error("Local moment video is required before publishing");
                        return await tq({
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
                    publishMoment: (0, a.useCallback)(e => l({
                        moment: e
                    }), [l]),
                    publishingDraftId: d && null != (e = null == u ? void 0 : u.moment.draftId) ? e : null,
                    isPublishing: d
                }
            }(), M = (0, a.useRef)(!1), {
                deleteMoment: j,
                deletingMomentKey: P
            } = function() {
                let {
                    user: e
                } = (0, E.useAuthentication)(), t = (0, eN.useQueryClient)(), n = null == e ? void 0 : e.id, i = tG(), {
                    mutateAsync: s,
                    isPending: o,
                    variables: r
                } = (0, eU.useMutation)({
                    mutationFn: e => {
                        let {
                            moment: t
                        } = e;
                        return tV({
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
                            e.setQueryData(tW(t, i), e => (null == e ? void 0 : e.pages.length) ? {
                                ...e,
                                pages: e.pages.map(e => ({
                                    ...e,
                                    moments: e.moments.filter(e => tH(e) !== n)
                                }))
                            } : e)
                        }(t, n, tH(s), i)
                    }
                });
                return {
                    deleteMoment: (0, a.useCallback)(e => s({
                        moment: e
                    }), [s]),
                    deletingMomentKey: o && null != r ? tH(r.moment) : null,
                    isDeleting: o
                }
            }(), {
                statusTab: k
            } = tY(), {
                serverMoments: L,
                isAllServerMomentsLoaded: R,
                hasNextPage: N,
                fetchNextPage: D,
                error: O,
                isPending: U,
                isFetchingNextPage: B,
                isFetchNextPageError: z,
                errorUpdatedAt: V,
                loadedPageCount: F,
                refetch: q,
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
                        isFetchingNextPage: d,
                        isFetchNextPageError: u,
                        errorUpdatedAt: c
                    } = function() {
                        let {
                            user: e
                        } = (0, E.useAuthentication)(), t = null == e ? void 0 : e.id, n = tG();
                        return (0, eO.useInfiniteQuery)({
                            queryKey: tW(t, n),
                            queryFn: null != t ? e => {
                                let {
                                    pageParam: i
                                } = e;
                                return tB(t, i, n)
                            } : eD.skipToken,
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
                            for (let e of n.moments) t.set(tH(e), e);
                        return [...t.values()]
                    }(n.pages) : iF, [n]),
                    p = null != (e = null == n ? void 0 : n.pages.length) ? e : 0,
                    h = (0, a.useCallback)(() => {
                        r({
                            cancelRefetch: !1,
                            throwOnError: !1
                        })
                    }, [r]),
                    v = l && !u;
                (0, iV.useBackgroundPageLoader)({
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
            }(), _ = (0, a.useMemo)(() => [...L, ...I].map(e => {
                let t = b[tH(e)];
                return t ? {
                    ...e,
                    ...t
                } : e
            }), [I, b, L]), H = (0, a.useMemo)(() => _.filter(e => e.status !== er), [_]), K = H.length > 0, W = (0, a.useRef)(0);
            (0, a.useEffect)(() => {
                !O || U || z || V <= W.current || (W.current = V, tT(tx.ListMoments, O, {
                    userId: o,
                    pageCount: F
                }))
            }, [O, V, z, U, F, o]);
            let Y = (0, a.useRef)(!1);
            (0, a.useEffect)(() => {
                if (!z || B) {
                    Y.current = !1;
                    return
                }
                O && !Y.current && (Y.current = !0, tT(tx.FetchNextPage, O, {
                    userId: o,
                    pageCount: F
                }))
            }, [O, z, B, F, o]);
            let Q = (0, a.useMemo)(() => {
                    var e;
                    if (!x) return null;
                    let t = tH(x);
                    return null != (e = _.find(e => tH(e) === t)) ? e : x
                }, [x, _]),
                J = (0, a.useCallback)(e => {
                    g(e), f(!0)
                }, []),
                X = (0, a.useCallback)(e => {
                    f(e), e || g(null)
                }, []),
                Z = (0, a.useCallback)(() => {
                    q()
                }, [q]),
                $ = (0, a.useCallback)(() => {
                    (0, iB.toast)({
                        title: t("Message.MomentPublishedError")
                    })
                }, [t]),
                ee = (0, a.useCallback)(() => {
                    (0, iB.toast)({
                        title: t("Message.MomentDeletedError")
                    })
                }, [t]),
                et = (0, a.useCallback)(() => {
                    (0, iB.toast)({
                        title: t("Message.MomentUploadStarted"),
                        icon: "icon-filled-circle-check"
                    })
                }, [t]),
                en = (0, a.useCallback)(async e => {
                    let t = e.status === eo,
                        n = tH(e),
                        i = {
                            ...t ? {
                                draftId: e.draftId
                            } : {
                                momentId: e.momentId,
                                feedItemId: e.feedItemId
                            },
                            experienceId: iq(e),
                            isLocalMoment: t,
                            userId: o
                        };
                    tS(tx.DeleteMoment, i);
                    try {
                        e.status === eo ? C(e.draftId) : await j(e), y(e => {
                            if (!(n in e)) return e;
                            let {
                                [n]: t, ...i
                            } = e;
                            return i
                        }), f(!1), g(null), tA(tx.DeleteMoment, i)
                    } catch (e) {
                        tT(tx.DeleteMoment, e, i), ee()
                    }
                }, [j, C, ee, o]),
                ei = (0, a.useCallback)((e, t) => {
                    if (e.status === eo) return void T(e.draftId, t);
                    let n = tH(e),
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
                ea = (0, a.useCallback)(async e => {
                    if (M.current || A || m) return;
                    let t = I.find(t => t.draftId === e);
                    if (!t) return;
                    M.current = !0;
                    let n = {
                        draftId: e,
                        experienceId: iq(t),
                        isLocalMoment: !0,
                        userId: o
                    };
                    tS(tx.PublishMoment, n);
                    try {
                        await w(t), C(e), f(!1), g(null), tA(tx.PublishMoment, n), et()
                    } catch (e) {
                        tT(tx.PublishMoment, e, n), $()
                    } finally {
                        M.current = !1
                    }
                }, [m, A, I, w, C, $, et, o]),
                es = (0, a.useCallback)(e => {
                    e.status === eo && ea(e.draftId)
                }, [ea]);
            return O && k !== eo && !K ? (0, i.jsx)(iU.default, {
                onReload: Z
            }) : (!U || K) && (R || K) ? (0, i.jsxs)("div", {
                className: "flex grow-1 flex-col gap-medium self-stretch width-full",
                children: [d ? (0, i.jsx)(ar, {
                    onRetry: h
                }) : null, p ? (0, i.jsx)(au, {}) : null, K ? (0, i.jsx)(ao, {
                    moments: H,
                    hasNextPage: N,
                    fetchNextPage: D,
                    serverPageSize: G,
                    onEditMoment: J,
                    onMomentMetadataChange: ei,
                    onPublishMoment: ea,
                    publishingDraftId: S,
                    isPublishDisabled: m
                }) : (0, i.jsx)("div", {
                    className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                    children: (0, i.jsx)(iZ, {
                        onCreateClick: nm
                    })
                }), (0, i.jsx)(iQ, {
                    moment: Q,
                    open: v,
                    onOpenChange: X,
                    onMomentMetadataChange: ei,
                    onDelete: Q ? en : void 0,
                    onPublish: (null == Q ? void 0 : Q.status) === eo ? es : void 0,
                    publishingDraftId: S,
                    deletingMomentKey: P,
                    isPublishDisabled: m
                }, Q ? tH(Q) : void 0)]
            }) : (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(nt.ProgressCircle, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            })
        },
        am = {
            width: "100%",
            height: "100%"
        },
        ap = (0, nw.makeStyles)()(e => ({
            section: {
                ...am
            },
            container: {
                ...am
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
        ah = (0, O.default)(() => e.A(202045), {
            loadableGenerated: {
                modules: [623728]
            },
            ssr: !1
        }),
        av = (0, O.default)(() => e.A(378869), {
            loadableGenerated: {
                modules: [518808]
            },
            ssr: !1
        }),
        af = (0, O.default)(() => e.A(580854), {
            loadableGenerated: {
                modules: [427685]
            },
            ssr: !1
        }),
        ax = (0, O.default)(() => e.A(307640), {
            loadableGenerated: {
                modules: [48220]
            },
            ssr: !1
        }),
        ag = (0, O.default)(() => e.A(114198), {
            loadableGenerated: {
                modules: [595604]
            },
            ssr: !1
        }),
        ab = (0, O.default)(() => e.A(558217), {
            loadableGenerated: {
                modules: [333771]
            },
            ssr: !1
        }),
        ay = (0, O.default)(() => e.A(546234), {
            loadableGenerated: {
                modules: [82873]
            },
            ssr: !1
        }),
        aI = (0, O.default)(() => e.A(85397), {
            loadableGenerated: {
                modules: [973472]
            },
            ssr: !1
        }),
        aT = (0, O.default)(() => e.A(890748), {
            loadableGenerated: {
                modules: [835459]
            },
            ssr: !1
        }),
        aC = (0, O.default)(() => e.A(68996), {
            loadableGenerated: {
                modules: [565869]
            },
            ssr: !1
        }),
        aw = (0, O.default)(() => e.A(441969), {
            loadableGenerated: {
                modules: [415945]
            },
            ssr: !1
        }),
        aS = (0, O.default)(() => e.A(481709), {
            loadableGenerated: {
                modules: [947274]
            },
            ssr: !1
        }),
        aA = (0, O.default)(() => e.A(272047), {
            loadableGenerated: {
                modules: [616027]
            },
            ssr: !1
        });

    function aM(e) {
        let t = (0, h.readQueryValue)(e);
        return void 0 === t ? m.Asset.MyExperiences : (0, p.isValidEnumValue)(m.Asset, t) ? t : m.Asset.MyExperiences
    }
    let aj = (0, s.withTranslation)(e => {
            let {
                verificationMetadata: t,
                currentGroup: n,
                currentUser: o,
                allowedAssetTypes: r
            } = e, [l, d] = (0, q.useQueryParams)(["activeTab", "filterIndex"]), {
                resetAllFilters: u
            } = (0, Q.default)(), {
                settings: c
            } = (0, x.useSettings)(), p = C(), h = (0, nM.default)(), v = (0, nA.default)(), f = (0, nN.default)(), {
                translate: T
            } = (0, s.useTranslation)(), w = (0, b.default)(), S = (0, a.useRef)(void 0), A = (0, a.useMemo)(() => [], []), M = (0, g.isTaxonomyActiveTab)(l.activeTab), j = M || (0, g.isRecentsActiveTab)(l.activeTab), E = (0, a.useMemo)(() => {
                let e = (0, g.isAllAssetTypesActiveTab)(l.activeTab) ? m.Asset.AllCatalogAsset : g.TAXONOMY_HOST_ASSET;
                return I.default.getMenuState(j ? e : aM(l.activeTab), A)
            }, [l.activeTab, A, j]);
            (0, a.useEffect)(() => {
                (0, g.isRecentsActiveTab)(l.activeTab) && d({
                    activeTab: M ? (0, g.buildTaxonomyActiveTab)(g.ALL_ASSET_TYPES_L1_KEY) : m.Asset.AllCatalogAsset,
                    filterIndex: 0
                })
            }, [l.activeTab, M, d]);
            let P = (0, a.useMemo)(() => y.default.filter(e => !A.includes(e.type)), [A]),
                {
                    classes: {
                        section: k,
                        container: L
                    }
                } = ap(),
                R = (0, a.useCallback)(e => {
                    if (E.menuItem === e.menuItem && E.submenuItem === e.submenuItem) return;
                    if ((0, g.shouldOpenTaxonomyView)({
                            isTaxonomyEnabled: w,
                            isChangingSection: E.menuItem !== e.menuItem,
                            nextAssetType: I.default.getAssetType(e)
                        })) return void d({
                        activeTab: g.AVATAR_ITEMS_ACTIVE_TAB,
                        filterIndex: 0
                    });
                    let t = (0, Y.isOnItemTab)(e.menuItem.type) ? 0 : void 0;
                    d({
                        activeTab: I.default.getAssetType(e),
                        filterIndex: t
                    })
                }, [E.menuItem, E.submenuItem, d, w]),
                N = (0, a.useMemo)(() => {
                    let e = aM(l.activeTab);
                    if (void 0 === p && e === m.Asset.Moments || void 0 === h && e === m.Asset.AllCatalogAsset || void 0 === v && e === m.Asset.AvatarLooks || void 0 === f && e === m.Asset.Showcase) return E;
                    let t = I.default.getValidMenuState(P, E, c, n, void 0, void 0, p, h, v, f);
                    if (t !== E) {
                        if (!M) {
                            let e = (0, Y.isOnItemTab)(t.menuItem.type) ? 0 : void 0;
                            d({
                                activeTab: I.default.getAssetType(t),
                                filterIndex: e
                            })
                        }
                        return t
                    }
                    return E
                }, [P, E, M, l.activeTab, c, n, p, h, v, f, d]),
                D = (0, a.useMemo)(() => I.default.getAssetType(N), [N]);
            (0, a.useEffect)(() => {
                if (void 0 === S.current) {
                    S.current = D;
                    return
                }
                let e = S.current;
                e !== D && (S.current = D, (0, J.isDevelopmentItemAsset)(e) && (0, J.isDevelopmentItemAsset)(D) || u())
            }, [D, u]);
            let O = D === m.Asset.MyExperiences || D === m.Asset.SharedExperiences,
                G = (0, a.useMemo)(() => null == r ? void 0 : r.has(D), [D, r]),
                H = G && !(0, g.isAvatarLooksActiveTab)(l.activeTab),
                X = (0, J.isDevelopmentItemAsset)(D),
                Z = (0, a.useMemo)(() => {
                    var e, t;
                    return X ? (0, i.jsx)(aS, {
                        groupId: null == n ? void 0 : n.id,
                        useTabNavigationSpacing: !1,
                        userId: null == o ? void 0 : o.id
                    }) : D === m.Asset.Decal ? (0, i.jsx)(af, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.Animation ? (0, i.jsx)(av, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.Audio || D === m.Asset.Video ? (0, i.jsx)(ax, {
                        mediaAssetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.Plugin ? (0, i.jsx)(ay, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.Model ? (0, i.jsx)(ab, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.MeshPart ? (0, i.jsx)(ag, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.ShareLink ? (0, i.jsx)(aC, {}) : D === m.Asset.Moments ? (0, i.jsx)(ac, {}) : D === m.Asset.AssetPermissionRequests ? (0, i.jsx)(aA, {}) : D === m.Asset.Showcase ? (0, i.jsx)(aI, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.AllCatalogAsset || D === m.Asset.AvatarLooks || D === m.Asset.AvatarBackground ? (0, i.jsx)(ah, {
                        assetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.Image || D === m.Asset.Mesh ? (0, i.jsx)(aT, {
                        primitiveAssetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : G ? (0, i.jsx)(ah, {
                        assetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : (0, i.jsx)(aw, {
                        assetType: D,
                        creatorType: (null == n ? void 0 : n.id) ? U.SearchCreatorType.Group : U.SearchCreatorType.User,
                        creatorTargetId: null != (e = null != (t = null == n ? void 0 : n.id) ? t : null == o ? void 0 : o.id) ? e : 0
                    })
                }, [D, null == n ? void 0 : n.id, null == o ? void 0 : o.id, G, X]);
            return (0, i.jsxs)(_.default, {
                children: [(0, i.jsx)(B.HubMeta, {
                    title: (0, B.buildTitle)(T(N.submenuItem ? N.submenuItem.nameKey : N.menuItem.nameKey)),
                    breadcrumb: (0, B.buildBreadcrumb)(T("Heading.Creations"), T(N.menuItem.nameKey), N.submenuItem ? T(N.submenuItem.nameKey) : void 0)
                }), (0, i.jsx)("section", {
                    className: k,
                    children: (0, i.jsxs)(z.Grid, {
                        container: !0,
                        direction: "column",
                        className: L,
                        children: [(0, i.jsx)(V.AgeVerificationUpsellBanner, {
                            trackingPage: V.AgeVerificationUpsellPage.Creations
                        }), !X && (0, i.jsx)(iD, {
                            menuState: N,
                            onMenuStateChange: R,
                            verificationMetadata: t,
                            group: n
                        }), O && (0, i.jsx)(F.default, {}), H && (0, i.jsx)(W, {}), H && (0, i.jsx)(K, {}), Z]
                    })
                })]
            })
        }, [G.TranslationNamespace.AssetTypes, G.TranslationNamespace.Controls, G.TranslationNamespace.Creations, G.TranslationNamespace.Error, G.TranslationNamespace.Navigation, G.TranslationNamespace.ShareLinksManagement, G.TranslationNamespace.ExperienceReleases, G.TranslationNamespace.Taxonomy]),
        aE = () => {
            let e = (0, f.useCurrentGroup)(),
                {
                    user: t
                } = (0, E.useAuthentication)(),
                n = (0, D.default)(),
                [s, o] = (0, a.useState)(void 0);
            return (0, a.useEffect)(() => {
                (0, y.getAllowedMarketplaceItemTypes)().then(e => {
                    let {
                        assetTypes: t
                    } = e;
                    o(t)
                })
            }, []), (0, i.jsx)(N, {
                children: (0, i.jsx)(aj, {
                    verificationMetadata: n,
                    currentGroup: e,
                    currentUser: t,
                    allowedAssetTypes: s
                })
            })
        };
    var aP = e.i(675330),
        ak = e.i(177608),
        aL = e.i(796266);
    let aR = () => {
            var e;
            let {
                translate: t
            } = (0, s.useTranslation)(), {
                activeItem: n
            } = A();
            return (0, i.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: null != (e = null == n ? void 0 : n.label) ? e : t("Heading.Creations")
            })
        },
        aN = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)(ak.default, {
                title: (0, i.jsx)(aR, {}),
                secondaryRail: (0, i.jsx)(M, {}),
                secondarySize: "small",
                noBreadCrumbs: !0,
                children: (0, i.jsx)(r.default, {
                    children: t
                })
            })
        },
        aD = () => {
            let {
                isResolving: e
            } = (0, aL.default)(), t = (0, a.useMemo)(() => ({
                isResolving: e
            }), [e]);
            return (0, i.jsx)(l.default, {
                children: (0, i.jsx)(aP.default, {
                    children: (0, i.jsx)(o.default, {
                        children: (0, i.jsx)(j.Provider, {
                            value: t,
                            children: (0, i.jsx)(aE, {})
                        })
                    })
                })
            })
        };
    aD.getPageLayout = e => (0, i.jsx)(aN, {
        children: e
    }), aD.loggerConfig = {
        rosId: "3539"
    }, e.s(["default", 0, aD], 962059)
}, 748348, (e, t, n) => {
    let i = "/dashboard/creations";
    (window.__NEXT_P = window.__NEXT_P || []).push([i, () => e.r(962059)]), t.hot && t.hot.dispose(function() {
        window.__NEXT_P.push([i])
    })
}]);

//# debugId=9b5ddc4c-adc7-f153-fc1e-0bd0669fcef6
//# sourceMappingURL=3xih6obabruch.js.map