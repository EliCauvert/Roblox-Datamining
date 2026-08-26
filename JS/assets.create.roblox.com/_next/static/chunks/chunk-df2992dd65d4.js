;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9e84687a-6f20-9c07-4f4c-3040fe4d8058")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 962059, e => {
    "use strict";
    var t, n, i = e.i(221628),
        a = e.i(79187),
        s = e.i(203450),
        o = e.i(384621),
        r = e.i(138726),
        l = e.i(416340),
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
            } = (0, a.useTranslation)(),
            {
                settings: n
            } = (0, x.useSettings)(),
            i = (0, f.useCurrentGroup)(),
            s = C(),
            {
                value: o
            } = (0, u.useFlag)(c.isAssetAccessRequestsEnabled),
            r = (0, b.default)(),
            v = (0, l.useMemo)(() => (t, n) => {
                let i = new URLSearchParams,
                    a = (0, h.readQueryValue)(e.query.groupId);
                a && i.set("groupId", a), t && i.set("activeTab", t), void 0 !== n && i.set("filterIndex", String(n));
                let s = i.toString();
                return s ? "/dashboard/creations?".concat(s) : "/dashboard/creations"
            }, [e.query.groupId]),
            T = (0, l.useMemo)(() => y.default.filter(e => e.type !== m.Asset.AssetPermissionRequests || o).filter(e => I.default.isMenuItemEnabled(e, n, i, void 0, void 0, s)).map(e => {
                var n, i, a;
                let s = null != (n = null == (a = e.submenuItems) || null == (i = a[0]) ? void 0 : i.type) ? n : e.type,
                    o = S[e.type],
                    l = e.type === m.Asset.TShirt,
                    d = r ? g.AVATAR_ITEMS_ACTIVE_TAB : m.Asset.AvatarLooks;
                return {
                    key: "".concat(w).concat(e.type),
                    label: o ? t(o) : t(e.nameKey),
                    href: e.type === m.Asset.Place ? v() : v(l ? d : s, l ? 0 : void 0)
                }
            }), [v, i, o, s, r, n, t]),
            A = (0, l.useMemo)(() => {
                var t;
                let n, i = (0, g.isTaxonomyActiveTab)(e.query.activeTab) || (0, g.isRecentsActiveTab)(e.query.activeTab),
                    a = I.default.getMenuState(i ? g.TAXONOMY_HOST_ASSET : (t = e.query.activeTab, void 0 !== (n = (0, h.readQueryValue)(t)) && (0, p.isValidEnumValue)(m.Asset, n) ? n : void 0), []);
                return "".concat(w).concat(a.menuItem.type)
            }, [e.query.activeTab]);
        return {
            activeItem: (0, l.useMemo)(() => T.find(e => e.key === A), [A, T]),
            activeKey: A,
            items: T
        }
    }
    let M = () => {
        let {
            translate: e
        } = (0, a.useTranslation)(), {
            activeKey: t,
            items: n
        } = A();
        return (0, i.jsx)(v.default, {
            header: e("Heading.Creations"),
            activeKey: t,
            items: n
        })
    };
    var j = e.i(814975),
        E = e.i(252842),
        P = e.i(533414),
        k = e.i(456810);
    let L = {
            sort: k.defaultAssetsSort,
            sortOrder: E.SortOrder.Desc,
            isArchived: !1,
            isPublishOnly: !1,
            isOnMarketplace: !1
        },
        R = e => {
            let {
                children: t
            } = e, {
                user: n
            } = (0, j.useAuthentication)(), [a, s] = (0, P.useLocalStorage)("creationSort.".concat(null == n ? void 0 : n.id), L.sort), o = (0, l.useRef)(a), r = (0, l.useMemo)(() => {
                let e = o.current;
                return Object.keys(a).some(t => a[t] !== e[t]) && (o.current = a), o.current
            }, [a]), [d, u] = (0, P.useLocalStorage)("creationSortOrder.".concat(null == n ? void 0 : n.id), L.sortOrder), [c, m] = (0, l.useState)(L.isArchived), [p, h] = (0, l.useState)(!1), [v, f] = (0, l.useState)(L.isPublishOnly), [x, g] = (0, l.useState)(L.isOnMarketplace), b = (0, l.useCallback)(() => {
                s(L.sort), u(L.sortOrder), m(L.isArchived), h(!1), f(L.isPublishOnly), g(L.isOnMarketplace)
            }, [s, u]), y = (0, l.useMemo)(() => ({
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
                setSortOrder: u,
                sort: r,
                sortOrder: d
            }), [c, p, x, v, b, m, h, g, f, s, u, r, d]);
            return (0, i.jsx)(k.default.Provider, {
                value: y,
                children: t
            })
        };
    var N = e.i(668091),
        D = e.i(109182),
        O = e.i(959222),
        U = e.i(37819),
        B = e.i(169722),
        z = e.i(714039),
        V = e.i(686197),
        F = e.i(780880),
        q = e.i(881670),
        G = e.i(845592),
        _ = e.i(418564);
    let H = () => {
            let {
                translate: e
            } = (0, a.useTranslation)(), {
                settings: t
            } = (0, x.useSettings)();
            return t.enableUgcUploadPublishBlockBanner ? (0, i.jsx)(_.default, {
                alertTitle: e("Heading.UgcUploadPublishBlockTitle"),
                alertDescription: e("Label.UgcUploadPublishBlock"),
                severity: "warning",
                externalLink: void 0,
                linkLabel: void 0,
                allowCloseDialog: !0
            }) : null
        },
        K = () => {
            let {
                translate: e
            } = (0, a.useTranslation)(), {
                settings: t
            } = (0, x.useSettings)();
            return t.enable2D3DUnificationBanner ? (0, i.jsx)("div", {
                className: "margin-bottom-[32px]",
                children: (0, i.jsx)(_.default, {
                    alertTitle: void 0,
                    alertDescription: e("Label.2D3DUnificationBanner"),
                    severity: "info",
                    externalLink: t.unification2D3DBannerLearnMoreUrl || void 0,
                    linkLabel: e("Label.LearnMore"),
                    allowCloseDialog: !0
                })
            }) : null
        };
    var W = e.i(339544),
        Y = e.i(475642),
        Q = e.i(211461),
        J = e.i(608972),
        X = e.i(956728),
        Z = e.i(978989),
        $ = e.i(211388);
    let ee = "CreatorHub.MomentsCreations.local",
        et = e => "".concat(ee, ".").concat(e),
        en = "".concat(ee, ".__inactive__"),
        ei = "active",
        ea = "pending",
        es = "draft",
        eo = "moderated",
        er = [ei, es],
        el = e => new Date(e.modifiedAt).getTime(),
        ed = "momentMedia",
        eu = async e => {
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
        }, ec = new Map, em = (e, t) => "".concat(e, ":").concat(t), ep = (e, t, n) => new Promise((t, n) => {
            if ("u" < typeof indexedDB) return void n(Error("IndexedDB is unavailable"));
            let i = indexedDB.open("".concat("CreatorHub.MomentsVideoMedia", ".").concat(e), 1);
            i.addEventListener("upgradeneeded", () => {
                let e = i.result;
                e.objectStoreNames.contains(ed) || e.createObjectStore(ed, {
                    keyPath: "momentId"
                })
            }), i.addEventListener("success", () => t(i.result)), i.addEventListener("error", () => {
                var e;
                return n(null != (e = i.error) ? e : Error("Failed to open IndexedDB"))
            })
        }).then(e => new Promise((i, a) => {
            let s = n(e.transaction(ed, t).objectStore(ed));
            s.addEventListener("success", () => i(s.result)), s.addEventListener("error", () => {
                var e;
                return a(null != (e = s.error) ? e : Error("IndexedDB request failed"))
            })
        })), eh = e => "object" == typeof e && null !== e && "momentId" in e && "string" == typeof e.momentId && "videoBlob" in e && e.videoBlob instanceof Blob && "thumbnailBlob" in e && e.thumbnailBlob instanceof Blob && "updatedAt" in e && "string" == typeof e.updatedAt, ev = (e, t) => {
            let n = em(e, t),
                i = ec.get(n);
            i && (URL.revokeObjectURL(i.thumbnailUrl), URL.revokeObjectURL(i.videoUrl), ec.delete(n))
        }, ef = async (e, t, n) => {
            let i = await eu(n),
                a = {
                    momentId: t,
                    videoBlob: n,
                    thumbnailBlob: i,
                    fileName: n.name,
                    updatedAt: new Date().toISOString()
                };
            ev(e, t), await ep(e, "readwrite", e => e.put(a))
        }, ex = new Set(["QuotaExceededError", "NS_ERROR_DOM_QUOTA_REACHED"]), eg = e => !!(e instanceof DOMException && ex.has(e.name)) || e instanceof Error && e.message.toLowerCase().includes("quota"), eb = async (e, t, n, i) => {
            let a = [],
                s = async () => {
                    await ef(e, t, n)
                };
            try {
                return await s(), {
                    evictedMediaDraftIds: a
                }
            } catch (e) {
                if (!eg(e)) throw e
            }
            for (let n of [...i.filter(e => e.draftId !== t && !1 !== e.hasLocalVideo)].sort((e, t) => el(e) - el(t))) {
                await eT(e, [n.draftId]), a.includes(n.draftId) || a.push(n.draftId);
                try {
                    return await s(), {
                        evictedMediaDraftIds: a
                    }
                } catch (e) {
                    if (!eg(e)) throw e
                }
            }
            throw Error("Failed to store moment video locally")
        };
    async function ey(e, t) {
        var n, i;
        let a, s = await ep(e, "readonly", e => e.get(t));
        if (!eh(s)) return null;
        let {
            videoBlob: o
        } = s;
        return new File([o], (a = null == (i = (n = s).fileName) ? void 0 : i.trim()) ? a : n.videoBlob.type.includes("quicktime") ? "moment.mov" : "moment.mp4", {
            type: o.type || "video/mp4"
        })
    }
    let eI = async (e, t) => {
        let n = em(e, t),
            i = ec.get(n);
        if (i) return i;
        let a = await ep(e, "readonly", e => e.get(t));
        if (!eh(a)) return null;
        let s = {
            thumbnailUrl: URL.createObjectURL(a.thumbnailBlob),
            videoUrl: URL.createObjectURL(a.videoBlob)
        };
        return ec.set(n, s), s
    }, eT = async (e, t) => {
        0 !== t.length && await Promise.all(t.map(async t => {
            ev(e, t), await ep(e, "readwrite", e => e.delete(t))
        }))
    }, eC = {
        version: "1",
        moments: []
    }, ew = e => "object" == typeof e && null !== e && !Array.isArray(e), eS = e => ew(e) && "1" === e.version && Array.isArray(e.moments) ? e.moments : [], eA = e => "string" == typeof e ? e : void 0, eM = e => "number" == typeof e && Number.isFinite(e) ? e : void 0, ej = new Set(Object.values(a.Locale)), eE = e => eS(e).map(e => (e => {
        var t, n, i, a, s, o;
        let r;
        if (!ew(e)) return null;
        let l = null != (t = eA(e.draftId)) ? t : eA(e.id);
        return null == l || "" === l || e.status !== es ? null : {
            draftId: l,
            status: es,
            experienceId: null != (n = eM(e.experienceId)) ? n : 0,
            rootPlaceId: eM(e.rootPlaceId),
            experienceName: null != (i = eA(e.experienceName)) ? i : "",
            description: null != (a = eA(e.description)) ? a : "",
            modifiedAt: null != (s = eA(e.modifiedAt)) ? s : new Date(0).toISOString(),
            assetId: eM(e.assetId),
            thumbnailUrl: eA(e.thumbnailUrl),
            videoUrl: eA(e.videoUrl),
            universeId: eM(e.universeId),
            locale: "string" == typeof(r = o = e.locale) && ej.has(r) ? o : void 0,
            ..."boolean" == typeof e.hasLocalVideo ? {
                hasLocalVideo: e.hasLocalVideo
            } : {}
        }
    })(e)).filter(e => null != e), eP = e => {
        if (!e) return [];
        try {
            let t = JSON.parse(e);
            return eE(t)
        } catch (e) {
            return []
        }
    }, ek = e => ({
        version: "1",
        moments: e
    }), eL = () => {
        let {
            user: e
        } = (0, j.useAuthentication)(), t = null == e ? void 0 : e.id, n = null != t, i = n ? et(t) : en, [a, s] = (0, P.useLocalStorage)(i, eC), o = (0, l.useMemo)(() => n ? eE(a) : [], [n, a]);
        (0, l.useEffect)(() => {
            if (!n || null == t) return;
            let e = eS(a).filter(e => ew(e) && e.status !== es).map(e => {
                var t, n;
                return ew(e) && null != (t = null != (n = eA(e.draftId)) ? n : eA(e.id)) ? t : ""
            }).filter(e => "" !== e);
            0 !== e.length && (s(ek(o)), eT(t, e))
        }, [n, o, a, s, t]);
        let r = (0, l.useCallback)((e, a) => {
                var o, r, l;
                if (!n || null == t || 0 === e.length) return {
                    moments: [],
                    evictedMediaDraftIds: []
                };
                let {
                    moments: d,
                    evictedMediaDraftIds: u
                } = (l = eP(window.localStorage.getItem(i)), {
                    moments: [...e.map(e => {
                        var t;
                        return {
                            ...e,
                            status: es,
                            hasLocalVideo: null == (t = e.hasLocalVideo) || t
                        }
                    }), ...l].sort((e, t) => el(t) - el(e)),
                    evictedMediaDraftIds: []
                }), c = ((e, t) => {
                    if (0 === t.length) return [...e];
                    let n = new Set(t);
                    return e.map(e => n.has(e.draftId) ? {
                        ...e,
                        hasLocalVideo: !1
                    } : e)
                })(d, null != (o = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? o : []), m = [...new Set([...null != (r = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? r : [], ...u])];
                return s(ek(c)), m.length > 0 && eT(t, m), {
                    moments: c,
                    evictedMediaDraftIds: m
                }
            }, [n, s, i, t]),
            d = (0, l.useCallback)((e, t) => r([e], t), [r]),
            u = (0, l.useCallback)((e, i) => {
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
                })(o, e, i);
                return a ? (s(ek(a)), a) : null
            }, [n, o, s, t]),
            c = (0, l.useCallback)(e => {
                if (!n || null == t) return null;
                let i = -1 === o.findIndex(t => t.draftId === e) ? null : o.filter(t => t.draftId !== e);
                return i ? (s(ek(i)), eT(t, [e]), i) : null
            }, [n, o, s, t]),
            m = (0, l.useCallback)(e => {
                if (!n || null == t) return null;
                let i = ((e, t) => {
                    let n = new Set(t);
                    if (0 === n.size) return null;
                    let i = e.filter(e => !n.has(e.draftId));
                    return i.length === e.length ? null : i
                })(o, e);
                if (!i) return null;
                let a = new Set(e),
                    r = o.filter(e => a.has(e.draftId)).map(e => e.draftId);
                return s(ek(i)), eT(t, r), i
            }, [n, o, s, t]);
        return {
            moments: o,
            addMoment: d,
            addMoments: r,
            updateMoment: u,
            removeMoment: c,
            removeMoments: m
        }
    };
    var eR = e.i(795621),
        eN = e.i(711367),
        eD = e.i(630986),
        eO = e.i(182012),
        eU = e.i(677753),
        eB = function(e, t) {
            return (eB = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function ez(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        eB(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function eV(e, t, n, i) {
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

    function eF(e, t) {
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

    function eq(e) {
        if (void 0 !== e) return null === e ? null : {
            chunkNum: e.chunkNum,
            eTag: e.eTag
        }
    }

    function eG(e) {
        if (void 0 !== e) return null === e ? null : {
            role: e.role,
            operationId: e.operationId,
            parts: void 0 === e.parts ? void 0 : null === e.parts ? null : e.parts.map(eq)
        }
    }

    function e_(e) {
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

    function eH(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function eK(e) {
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

    function eW(e) {
        if (void 0 !== e) return null === e ? null : {}
    }

    function eY(e) {
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

    function eQ(e, t) {
        return null == e ? e : {
            assetId: (0, eU.exists)(e, "assetId") ? e.assetId : void 0,
            startTime: (0, eU.exists)(e, "startTime") ? e.startTime : void 0
        }
    }

    function eJ(e) {
        var t;
        return null == (t = e) ? t : {
            position: (0, eU.exists)(t, "position") ? t.position : void 0,
            rotation: (0, eU.exists)(t, "rotation") ? t.rotation : void 0,
            stickerSize: (0, eU.exists)(t, "stickerSize") ? t.stickerSize : void 0,
            scale: (0, eU.exists)(t, "scale") ? t.scale : void 0,
            stickerURI: (0, eU.exists)(t, "stickerURI") ? t.stickerURI : void 0,
            zIndex: (0, eU.exists)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function eX(e) {
        if (void 0 !== e) return null === e ? null : {
            position: e.position,
            rotation: e.rotation,
            stickerSize: e.stickerSize,
            scale: e.scale,
            stickerURI: e.stickerURI,
            zIndex: e.zIndex
        }
    }

    function eZ(e) {
        var t, n;
        return null == (t = e) ? t : {
            position: (0, eU.exists)(t, "position") ? t.position : void 0,
            rotation: (0, eU.exists)(t, "rotation") ? t.rotation : void 0,
            scale: (0, eU.exists)(t, "scale") ? t.scale : void 0,
            text: (0, eU.exists)(t, "text") ? t.text : void 0,
            textOverlayStyle: (0, eU.exists)(t, "textOverlayStyle") ? null == (n = t.textOverlayStyle) ? n : {
                font: (0, eU.exists)(n, "font") ? n.font : void 0,
                fontColor: (0, eU.exists)(n, "fontColor") ? n.fontColor : void 0,
                fontSize: (0, eU.exists)(n, "fontSize") ? n.fontSize : void 0,
                textXAlignment: (0, eU.exists)(n, "textXAlignment") ? n.textXAlignment : void 0
            } : void 0,
            zIndex: (0, eU.exists)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function e$(e) {
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

    function e0(e) {
        var t;
        return null == (t = e) ? t : {
            httpVerb: (0, eU.exists)(t, "httpVerb") ? t.httpVerb : void 0,
            url: (0, eU.exists)(t, "url") ? t.url : void 0,
            chunkNum: (0, eU.exists)(t, "chunkNum") ? t.chunkNum : void 0,
            contentStart: (0, eU.exists)(t, "contentStart") ? t.contentStart : void 0,
            contentLength: (0, eU.exists)(t, "contentLength") ? t.contentLength : void 0,
            expirationTimeMs: (0, eU.exists)(t, "expirationTimeMs") ? t.expirationTimeMs : void 0
        }
    }

    function e1(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eU.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eU.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eU.exists)(t, "operationPath") ? t.operationPath : void 0,
            uploadUrls: (0, eU.exists)(t, "uploadUrls") ? null === t.uploadUrls ? null : t.uploadUrls.map(e0) : void 0
        }
    }

    function e2(e, t) {
        var n, i, a;
        return null == e ? e : {
            assetId: (0, eU.exists)(e, "assetId") ? e.assetId : void 0,
            assetAccessContext: (0, eU.exists)(e, "assetAccessContext") ? e.assetAccessContext : void 0,
            assetTotalDuration: (0, eU.exists)(e, "assetTotalDuration") ? e.assetTotalDuration : void 0,
            caption: (0, eU.exists)(e, "caption") ? e.caption : void 0,
            videoContentLanguage: (0, eU.exists)(e, "videoContentLanguage") ? e.videoContentLanguage : void 0,
            partnerUploadType: (0, eU.exists)(e, "partnerUploadType") ? e.partnerUploadType : void 0,
            captureType: (0, eU.exists)(e, "captureType") ? e.captureType : void 0,
            editsType: (0, eU.exists)(e, "editsType") ? e.editsType : void 0,
            videoCaptureEdits: (0, eU.exists)(e, "videoCaptureEdits") ? null == (n = e.videoCaptureEdits) ? n : {
                trim: (0, eU.exists)(n, "trim") ? null == (i = n.trim) ? i : {
                    startTime: (0, eU.exists)(i, "startTime") ? i.startTime : void 0,
                    endTime: (0, eU.exists)(i, "endTime") ? i.endTime : void 0
                } : void 0,
                music: (0, eU.exists)(n, "music") ? eQ(n.music) : void 0,
                textOverlays: (0, eU.exists)(n, "textOverlays") ? null === n.textOverlays ? null : n.textOverlays.map(eZ) : void 0,
                stickerOverlays: (0, eU.exists)(n, "stickerOverlays") ? null === n.stickerOverlays ? null : n.stickerOverlays.map(eJ) : void 0
            } : void 0,
            screenshotCaptureEdits: (0, eU.exists)(e, "screenshotCaptureEdits") ? null == (a = e.screenshotCaptureEdits) ? a : {
                music: (0, eU.exists)(a, "music") ? eQ(a.music) : void 0,
                textOverlays: (0, eU.exists)(a, "textOverlays") ? null === a.textOverlays ? null : a.textOverlays.map(eZ) : void 0
            } : void 0
        }
    }

    function e4(e, t) {
        var n;
        return null == e ? e : {
            status: (0, eU.exists)(e, "status") ? e.status : void 0,
            result: (0, eU.exists)(e, "result") ? null == (n = e.result) ? n : {
                assetId: (0, eU.exists)(n, "assetId") ? n.assetId : void 0,
                isApproved: (0, eU.exists)(n, "isApproved") ? n.isApproved : void 0,
                operationError: (0, eU.exists)(n, "operationError") ? n.operationError : void 0
            } : void 0
        }
    }

    function e5(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eU.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eU.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eU.exists)(t, "operationPath") ? t.operationPath : void 0,
            done: (0, eU.exists)(t, "done") ? t.done : void 0
        }
    }

    function e3(e, t) {
        return null == e ? e : {
            generationToken: (0, eU.exists)(e, "generationToken") ? e.generationToken : void 0
        }
    }

    function e7(e, t) {
        return null == e ? e : {
            type: (0, eU.exists)(e, "type") ? e.type : void 0,
            id: (0, eU.exists)(e, "id") ? e.id : void 0
        }
    }

    function e8(e, t) {
        return null == e ? e : {
            counts: (0, eU.exists)(e, "counts") ? e.counts : void 0,
            userReaction: (0, eU.exists)(e, "userReaction") ? e.userReaction : void 0
        }
    }

    function e9(e, t) {
        return null == e ? e : {
            shareCount: (0, eU.exists)(e, "shareCount") ? e.shareCount : void 0
        }
    }

    function e6(e, t) {
        var n;
        return null == e ? e : {
            type: (0, eU.exists)(e, "type") ? e.type : void 0,
            experienceCta: (0, eU.exists)(e, "experienceCta") ? null == (n = e.experienceCta) ? n : {
                experienceId: (0, eU.exists)(n, "experienceId") ? n.experienceId : void 0,
                placeId: (0, eU.exists)(n, "placeId") ? n.placeId : void 0
            } : void 0
        }
    }

    function te(e) {
        var t;
        return null == (t = e) ? t : {
            feedSessionId: (0, eU.exists)(t, "feedSessionId") ? t.feedSessionId : void 0,
            entityId: (0, eU.exists)(t, "entityId") ? t.entityId : void 0,
            entityType: (0, eU.exists)(t, "entityType") ? t.entityType : void 0,
            id: (0, eU.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eU.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            type: (0, eU.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eU.exists)(t, "captionedAssetMoment") ? e2(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eU.exists)(t, "primaryCta") ? e6(t.primaryCta) : void 0,
            owner: (0, eU.exists)(t, "owner") ? e7(t.owner) : void 0,
            visibilityStatus: (0, eU.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eU.exists)(t, "reactions") ? e8(t.reactions) : void 0,
            stats: (0, eU.exists)(t, "stats") ? e9(t.stats) : void 0
        }
    }

    function tt(e, t) {
        return null == e ? e : {
            feedItems: (0, eU.exists)(e, "feedItems") ? e.feedItems : void 0,
            loaded: (0, eU.exists)(e, "loaded") ? e.loaded : void 0,
            failed: (0, eU.exists)(e, "failed") ? e.failed : void 0,
            moderated: (0, eU.exists)(e, "moderated") ? e.moderated : void 0
        }
    }

    function tn(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, eU.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eU.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            type: (0, eU.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eU.exists)(t, "captionedAssetMoment") ? e2(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eU.exists)(t, "primaryCta") ? e6(t.primaryCta) : void 0,
            owner: (0, eU.exists)(t, "owner") ? e7(t.owner) : void 0,
            visibilityStatus: (0, eU.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eU.exists)(t, "reactions") ? e8(t.reactions) : void 0,
            stats: (0, eU.exists)(t, "stats") ? e9(t.stats) : void 0
        }
    }

    function ti(e, t) {
        return null == e ? e : {
            signingAlgorithmVersion: (0, eU.exists)(e, "signingAlgorithmVersion") ? e.signingAlgorithmVersion : void 0,
            signature: (0, eU.exists)(e, "signature") ? e.signature : void 0
        }
    }
    var ta = eU.BaseAPI;

    function ts() {
        return null !== ta && ta.apply(this, arguments) || this
    }
    ez(ts, ta), ts.prototype.backfillTriggerB1Raw = function(e, t) {
        return eV(this, void 0, void 0, function() {
            var n, i, a;
            return eF(this, function(s) {
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
                        return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                }
            })
        })
    }, ts.prototype.backfillTriggerB1 = function() {
        return eV(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), eF(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.backfillTriggerB1Raw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var to = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return ez(t, e), t.prototype.contentCapturesBatchCheckExperienceUploadabilityRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesBatchCheckExperienceUploadability = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesBatchCheckExperienceUploadabilityRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibilityRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isEligible: (0, eU.exists)(e, "isEligible") ? e.isEligible : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibility = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    return e4(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatus = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    return e4(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatusRcc = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a, s;
                    return eF(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eU.canConsumeForm)([{
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
                                return s = o.sent(), [2, new eU.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        operationId: (0, eU.exists)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCreateInfluencerMomentFromVideo = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesGrantExperiencePermissions = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesGrantExperiencePermissionsRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadataRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    return ti(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadata = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a, s;
                    return eF(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eU.canConsumeForm)([{
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
                                return s = o.sent(), [2, new eU.JSONApiResponse(s, function(e) {
                                    return ti(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignFileAndMetadataInternal = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(e$),
                                                                    stickerOverlays: void 0 === e.stickerOverlays ? void 0 : null === e.stickerOverlays ? null : e.stickerOverlays.map(eX)
                                                                }
                                                            }(e.edits)
                                                        }
                                                    }(e.metadata),
                                                    feedRegistrationInfo: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            attributes: void 0 === e.attributes ? void 0 : null === e.attributes ? null : e.attributes.map(eY),
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
                                return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesUploadCaptureWithAsset = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesUploadCaptureWithAssetRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(eU.BaseAPI),
        tr = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            ez(t, e), t.prototype.moderationApplyModerationDecisionRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationApplyModerationDecision = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationApplyModerationDecisionRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.moderationEnrichReportRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                            custom: void 0 === e.custom ? void 0 : null === e.custom ? null : (0, eU.mapValues)(e.custom, eW)
                                        }
                                    }(e.moderationEnrichReportRequest)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationEnrichReport = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationEnrichReportRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.moderationReportMomentRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eU.RequiredError("momentId", "Required parameter requestParameters.momentId was null or undefined when calling moderationReportMoment.");
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
                                return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationReportMoment = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eF(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationReportMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(eU.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            ez(t, e), t.prototype.momentTextGenerationCreateMomentVideoUploadUrlRaw = function(e) {
                return eV(this, void 0, void 0, function() {
                    var t, n, i;
                    return eF(this, function(a) {
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
                                return i = a.sent(), [2, new eU.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        uploadUrl: (0, eU.exists)(e, "uploadUrl") ? e.uploadUrl : void 0,
                                        videoObjectKey: (0, eU.exists)(e, "videoObjectKey") ? e.videoObjectKey : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationCreateMomentVideoUploadUrl = function(e) {
                return eV(this, void 0, void 0, function() {
                    return eF(this, function(t) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    return e3(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentText = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    return e3(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentTextWithVideo = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        status: (0, eU.exists)(e, "status") ? e.status : void 0,
                                        result: (0, eU.exists)(e, "result") ? null == (t = e.result) ? t : {
                                            summary: (0, eU.exists)(t, "summary") ? t.summary : void 0,
                                            description: (0, eU.exists)(t, "description") ? t.description : void 0,
                                            error: (0, eU.exists)(t, "error") ? t.error : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGetMomentTextGenerationStatus = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
        }(eU.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return ez(t, e), t.prototype.momentsCleanUserDataRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        notificationId: (0, eU.exists)(e, "NotificationId") ? e.NotificationId : void 0,
                                        eventType: (0, eU.exists)(e, "EventType") ? e.EventType : void 0,
                                        eventTime: (0, eU.exists)(e, "EventTime") ? new Date(e.EventTime) : void 0,
                                        eventPayload: (0, eU.exists)(e, "EventPayload") ? null == (t = e.EventPayload) ? t : {
                                            userId: (0, eU.exists)(t, "UserId") ? t.UserId : void 0,
                                            gameIds: (0, eU.exists)(t, "GameIds") ? t.GameIds : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsCleanUserData = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eU.RequiredError("momentId", "Required parameter requestParameters.momentId was null or undefined when calling momentsDeleteMoment.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/{momentId}".replace("{".concat("momentId", "}"), encodeURIComponent(String(e.momentId))),
                                    schemaPath: "/v2/moments/{momentId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMoment = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eF(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItemRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.feedItemId || void 0 === e.feedItemId) throw new eU.RequiredError("feedItemId", "Required parameter requestParameters.feedItemId was null or undefined when calling momentsDeleteMomentByFeedItem.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/by-feed-item/{feedItemId}".replace("{".concat("feedItemId", "}"), encodeURIComponent(String(e.feedItemId))),
                                    schemaPath: "/v2/moments/by-feed-item/{feedItemId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItem = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eF(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentByFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendationsRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eU.exists)(e, "items") ? null === e.items ? null : e.items.map(te) : void 0,
                                        paginationContext: (0, eU.exists)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, eU.exists)(e, "metadata") ? tt(e.metadata) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendations = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eU.exists)(e, "items") ? null === e.items ? null : e.items.map(tn) : void 0,
                                        failedMomentIds: (0, eU.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eU.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMoments = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eU.exists)(e, "items") ? null === e.items ? null : e.items.map(tn) : void 0,
                                        failedMomentIds: (0, eU.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eU.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0,
                                        paginationContext: (0, eU.exists)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, eU.exists)(e, "metadata") ? tt(e.metadata) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetUsersMoments = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
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
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItem = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2Raw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, i, a;
                    return eF(this, function(s) {
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
                                return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2 = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eF(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemV2Raw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(eU.BaseAPI));
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ez(t, e), t.prototype.postsCompletePostRaw = function(e, t) {
            return eV(this, void 0, void 0, function() {
                var n, i, a;
                return eF(this, function(s) {
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
                                        uploads: void 0 === e.uploads ? void 0 : null === e.uploads ? null : e.uploads.map(eG)
                                    }
                                }(e.postsCompletePostRequest)
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    uploads: (0, eU.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(e5) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.postsCompletePost = function() {
            return eV(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eF(this, function(n) {
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
            return eV(this, void 0, void 0, function() {
                var n, i, a;
                return eF(this, function(s) {
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
                                                textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(eK)
                                            }
                                        }(e.common),
                                        videoPost: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                video: e_(e.video),
                                                durationSeconds: e.durationSeconds,
                                                trim: eH(e.trim)
                                            }
                                        }(e.videoPost),
                                        screenshotPost: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                screenshot: e_(e.screenshot),
                                                widthPixels: e.widthPixels,
                                                heightPixels: e.heightPixels
                                            }
                                        }(e.screenshotPost),
                                        influencerVideoPost: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                video: e_(e.video),
                                                durationSeconds: e.durationSeconds,
                                                trim: eH(e.trim)
                                            }
                                        }(e.influencerVideoPost)
                                    }
                                }(e.postsCreatePostRequest)
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new eU.JSONApiResponse(a, function(e) {
                                var t;
                                return null == e ? e : {
                                    post: (0, eU.exists)(e, "post") ? null == (t = e.post) ? t : {
                                        operationId: (0, eU.exists)(t, "operationId") ? t.operationId : void 0
                                    } : void 0,
                                    uploads: (0, eU.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(e1) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.postsCreatePost = function() {
            return eV(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eF(this, function(n) {
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
    })(eU.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ez(t, e), t.prototype.testSeedCreatePostAssetRaw = function(e, t) {
            return eV(this, void 0, void 0, function() {
                var n, i, a;
                return eF(this, function(s) {
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
                            return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedCreatePostAsset = function() {
            return eV(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eF(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.testSeedCreatePostAssetRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.testSeedInspectPostRaw = function(e, t) {
            return eV(this, void 0, void 0, function() {
                var n, i, a;
                return eF(this, function(s) {
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
                            return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedInspectPost = function() {
            return eV(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eF(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.testSeedInspectPostRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.testSeedListUserMomentsRaw = function(e) {
            return eV(this, void 0, void 0, function() {
                var t, n, i;
                return eF(this, function(a) {
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
                            return i = a.sent(), [2, new eU.VoidApiResponse(i)]
                    }
                })
            })
        }, t.prototype.testSeedListUserMoments = function(e) {
            return eV(this, void 0, void 0, function() {
                return eF(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.testSeedListUserMomentsRaw(e)];
                        case 1:
                            return t.sent(), [2]
                    }
                })
            })
        }, t.prototype.testSeedSeedBatchRaw = function(e, t) {
            return eV(this, void 0, void 0, function() {
                var n, i, a;
                return eF(this, function(s) {
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
                            return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedSeedBatch = function() {
            return eV(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eF(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.testSeedSeedBatchRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.testSeedSeedMomentRaw = function(e, t) {
            return eV(this, void 0, void 0, function() {
                var n, i, a;
                return eF(this, function(s) {
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
                            return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedSeedMoment = function() {
            return eV(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eF(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.testSeedSeedMomentRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.testSeedWirePostRaw = function(e, t) {
            return eV(this, void 0, void 0, function() {
                var n, i, a;
                return eF(this, function(s) {
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
                            return a = s.sent(), [2, new eU.VoidApiResponse(a)]
                    }
                })
            })
        }, t.prototype.testSeedWirePost = function() {
            return eV(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), eF(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.testSeedWirePostRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }
    }(eU.BaseAPI);
    let tl = (0, e.i(272593).createClientConfiguration)("content-captures-api", "bedev2"),
        td = new to(tl),
        tu = new tr(tl),
        tc = Object.assign(td, {
            momentsGetUsersMoments: e => tu.momentsGetUsersMoments(e),
            momentsDeleteMoment: e => tu.momentsDeleteMoment(e),
            momentsDeleteMomentByFeedItem: e => tu.momentsDeleteMomentByFeedItem(e)
        });
    var tm = e.i(773057),
        tp = e.i(227987),
        th = e.i(889311),
        tv = e.i(215955),
        tf = ((t = {}).ListMoments = "listMoments", t.FetchNextPage = "fetchNextPage", t.UploadVideo = "uploadVideo", t.ValidateVideo = "validateVideo", t.PersistLocalVideo = "persistLocalVideo", t.PublishMoment = "publishMoment", t.DeleteMoment = "deleteMoment", t.ResolveExperience = "resolveExperience", t.LoadLocalVideoMedia = "loadLocalVideoMedia", t.EnrichExperienceNames = "enrichExperienceNames", t);
    let tx = (e, t) => {
            let n;
            return null != t.momentId && (e.momentId = t.momentId), null != t.feedItemId && (e.feedItemId = t.feedItemId), null != t.draftId && (e.draftId = t.draftId), null != t.experienceId && (e.experienceId = String(t.experienceId)), null != t.placeId && (e.placeId = String(t.placeId)), null != t.fileCount && (e.fileCount = String(t.fileCount)), null != t.fileSize && (e.fileSize = String(t.fileSize)), null != t.fileType && t.fileType.length > 0 && (e.fileType = t.fileType), null != t.locale && t.locale.length > 0 && (e.locale = t.locale), null != t.inputValue && t.inputValue.length > 0 && (e.inputValue = (n = t.inputValue).length <= 200 ? n : n.slice(0, 200)), null != t.idType && (e.idType = t.idType), null != t.matchedId && (e.matchedId = String(t.matchedId)), null != t.userId && (e.userId = String(t.userId)), null != t.pageCount && (e.pageCount = String(t.pageCount)), null != t.momentCount && (e.momentCount = String(t.momentCount)), null != t.persistedVideoCount && (e.persistedVideoCount = String(t.persistedVideoCount)), null != t.isLocalMoment && (e.isLocalMoment = String(t.isLocalMoment)), null != t.universeIdCount && (e.universeIdCount = String(t.universeIdCount)), e
        },
        tg = async (e, t) => {
            var n;
            let i = await (0, tp.default)(e),
                a = e instanceof Error ? e.message : "string" == typeof e ? e : "Unknown error";
            return i ? {
                reason: null != (n = null != t ? t : i.message) ? n : a,
                httpStatus: i.status,
                errorCode: i.code
            } : {
                reason: null != t ? t : a
            }
        }, tb = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return {
                eventName: th.default.MomentsCreationsError,
                parameters: tx({
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
        }, ty = async function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tv.default,
                a = await tg(t, n.reason);
            i.logErrorEvent(tb(e, a, n))
        }, tI = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tv.default;
            ty(e, t, n, i)
        }, tT = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: th.default.MomentsCreationsAttempt,
                parameters: tx({
                    operation: e
                }, t)
            }
        }, tC = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: th.default.MomentsCreationsSuccess,
                parameters: tx({
                    operation: e
                }, t)
            }
        }, tw = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tv.default;
            n.logClickEvent(tT(e, t))
        }, tS = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tv.default;
            n.logImpressionEvent(tC(e, t))
        };
    var tA = e.i(773595);
    let tM = tA.availableDocsLocales,
        tj = new Set(tM),
        tE = e => {
            let t = e === a.Locale.SimplifiedChineseJV ? a.Locale.SimplifiedChinese : e;
            return null != t && tj.has(t) ? t : a.Locale.English
        },
        tP = e => null != e ? (0, a.toLocaleNativeName)(e) : "-",
        tk = {
            active: ei,
            captionedassetmoment: ei,
            live: ei,
            moderated: eo,
            pending: ea,
            published: ei
        },
        tL = new Date(0).toISOString(),
        tR = function(e) {
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
                    if (null != e && "" !== e) return tA.StringLocaleMap.get(e.toLowerCase())
                })(null == p ? void 0 : p.videoContentLanguage);
            return {
                momentId: d,
                feedItemId: u,
                assetId: null == p ? void 0 : p.assetId,
                description: null != (a = null == p ? void 0 : p.caption) ? a : "",
                experienceName: "",
                modifiedAt: tL,
                status: (e => {
                    if (!e) return ei;
                    let t = tk[e.toLowerCase()];
                    if (t) return t;
                    let n = e.toLowerCase();
                    return n.includes("pending") ? ea : (n.includes("active") || n.includes("publish") || n.includes("live"), ei)
                })(e.type),
                universeId: h,
                ...null != v ? {
                    locale: v
                } : {}
            }
        },
        tN = function(e) {
            var t;
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return (null != (t = e.items) ? t : []).map(e => tR(e, n)).filter(e => null != e)
        },
        tD = async (e, t) => tc.momentsGetUsersMoments({
            targetUserId: e,
            paginationContext: null == t ? void 0 : t.paginationContext,
            count: 25
        }), tO = async e => {
            let t = [...new Set(e.map(e => e.universeId).filter(e => null != e && e > 0))];
            if (0 === t.length) return e;
            try {
                tw(tf.EnrichExperienceNames, {
                    universeIdCount: t.length
                });
                let {
                    data: n = []
                } = await tm.default.getUniversesDetails(t), i = new Map(n.filter(e => null != e.id && "string" == typeof e.name && e.name.length > 0).map(e => [e.id, e.name])), a = e.map(e => {
                    var t;
                    let n = null != e.universeId && null != (t = i.get(e.universeId)) ? t : "";
                    return n === e.experienceName ? e : {
                        ...e,
                        experienceName: n
                    }
                });
                return tS(tf.EnrichExperienceNames, {
                    universeIdCount: t.length
                }), a
            } catch (n) {
                return tI(tf.EnrichExperienceNames, n, {
                    universeIdCount: t.length
                }), e
            }
        }, tU = async function(e, t) {
            var n, i;
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                s = (null == t ? void 0 : t.paginationContext) != null ? tf.FetchNextPage : tf.ListMoments;
            tw(s, {
                userId: e
            });
            let o = await tD(e, t),
                r = tN(o, a),
                l = await tO(r);
            return tS(s, {
                userId: e,
                pageCount: null != (n = null == t ? void 0 : t.pageNumber) ? n : 1,
                momentCount: l.length
            }), {
                moments: l,
                paginationContext: null != (i = o.paginationContext) ? i : void 0
            }
        }, tB = async e => {
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
                status: es,
                ...null != a ? {
                    locale: a
                } : {}
            }
        };
    async function tz(e) {
        let {
            feedItemId: t,
            momentId: n,
            useFeedItemId: i = !1
        } = e;
        if (i) {
            if (null == t || "" === t) throw Error("Moment feed item id is required before deleting");
            await tc.momentsDeleteMomentByFeedItem({
                feedItemId: t
            });
            return
        }
        if (null == n || "" === n) throw Error("Moment id is required before deleting");
        await tc.momentsDeleteMoment({
            momentId: n
        })
    }
    async function tV(e) {
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
    async function tF(e) {
        var t;
        let {
            moment: n,
            file: i,
            displayName: a,
            uiLocale: s,
            sendVideoContentLanguage: o = !0
        } = e;
        if (!n.experienceId) throw Error("Moment experience is required before publishing");
        let r = await tV(i),
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
            d = (await tc.contentCapturesCreateInfluencerMomentFromVideo({
                files: [i],
                name: a,
                description: n.description,
                universeId: n.experienceId,
                momentPublishData: JSON.stringify(l),
                ...o ? {
                    videoContentLanguage: (null != (t = n.locale) ? t : tE(s)).toLowerCase()
                } : {}
            })).operationId;
        if (null == d || "" === d) throw Error("Publish operation id is missing from the response");
        return {
            operationId: d
        }
    }
    let tq = () => {
            let {
                ready: e,
                value: t
            } = (0, u.useFlag)(T.isMomentsFeedIdEnabled);
            return e && null != t && t
        },
        tG = () => {
            let {
                ready: e,
                value: t
            } = (0, u.useFlag)(T.isMomentsUploadLanguageSelectEnabled);
            return e && null != t && t
        },
        t_ = e => {
            var t, n;
            return e.status === es ? e.draftId : null != (t = null != (n = e.feedItemId) ? n : e.momentId) ? t : ""
        },
        tH = e => ["momentsCreations", e],
        tK = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return [...tH(e), t]
        },
        tW = () => {
            let e, [{
                    momentStatus: t
                }, n] = (0, F.useQueryParams)(["momentStatus"]),
                i = (0, eR.useQueryClient)(),
                {
                    user: a
                } = (0, j.useAuthentication)();
            return {
                statusTab: "string" == typeof(e = null == t ? void 0 : Array.isArray(t) ? t[0] : t) && er.some(t => t === e) ? e : es,
                setStatusTab: (0, l.useCallback)(e => {
                    n({
                        momentStatus: e
                    }), e === ei && i.invalidateQueries({
                        queryKey: tH(null == a ? void 0 : a.id)
                    })
                }, [i, n, null == a ? void 0 : a.id])
            }
        },
        tY = async (e, t, n, i) => {
            let a = {
                draftId: t,
                fileSize: n.size,
                fileType: n.type
            };
            tw(tf.PersistLocalVideo, a);
            try {
                let s, o, {
                    evictedMediaDraftIds: r
                } = await eb(e, t, n, (s = eP(window.localStorage.getItem(et(e))), o = new Set(i.map(e => e.draftId)), [...i, ...s.filter(e => !o.has(e.draftId))]));
                return tS(tf.PersistLocalVideo, a), {
                    hasLocalVideo: !0,
                    storageEvictedMediaDraftIds: r
                }
            } catch (e) {
                return tI(tf.PersistLocalVideo, e, {
                    draftId: t,
                    fileSize: n.size,
                    fileType: n.type
                }), {
                    hasLocalVideo: !1,
                    storageEvictedMediaDraftIds: []
                }
            }
        };
    var tQ = e.i(137785);
    let tJ = (0, a.withTranslation)(e => {
        let {
            experience: t,
            hideTitle: n = !1,
            onChangeExperience: s
        } = e, {
            translate: o
        } = (0, a.useTranslation)();
        return (0, i.jsxs)("div", {
            className: "flex flex-col gap-y-xsmall width-full",
            children: [n ? null : (0, i.jsxs)("div", {
                className: "flex flex-row items-center justify-between",
                children: [(0, i.jsx)("span", {
                    className: "text-body-small content-muted",
                    children: o("CreateMomentModal.Preview.Title")
                }), s && (0, i.jsx)(J.Button, {
                    variant: "Link",
                    size: "Small",
                    onClick: s,
                    children: o("Action.EEChange")
                })]
            }), (0, i.jsx)("div", {
                className: "padding-medium radius-medium bg-surface-200 width-full",
                children: (0, i.jsx)(tQ.default, {
                    disableLink: !0,
                    target: t,
                    targetType: "Experience",
                    variant: "medium"
                })
            })]
        })
    }, [q.TranslationNamespace.Creations]);
    var tX = e.i(119673),
        tZ = e.i(392782);
    let t$ = "UniverseId",
        t0 = "PlaceId",
        t1 = /(?:https?:\/\/)?create\.roblox\.com\/dashboard\/creations\/experiences\/(\d+)/,
        t2 = /(?:https?:\/\/)?(?:www\.)?roblox\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
        t4 = /^\d+$/,
        t5 = [{
            regex: /(?:https?:\/\/)?create\.sitetest\d\.robloxlabs\.com\/dashboard\/creations\/experiences\/(\d+)/,
            idType: t$
        }, {
            regex: /(?:https?:\/\/)?(?:www\.)?sitetest\d\.robloxlabs\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
            idType: t0
        }],
        t3 = (0, a.withTranslation)(e => {
            let {
                onExperienceResolved: t,
                isDisabled: n = !1
            } = e, {
                translate: s
            } = (0, a.useTranslation)(), {
                ready: o,
                value: r
            } = (0, u.useFlag)(T.isMomentsSitetestUrlParsingEnabled), [d, c] = (0, l.useState)(""), [m, p] = (0, l.useState)(!1), [h, v] = (0, l.useState)(), f = (0, l.useMemo)(() => [{
                regex: t1,
                idType: t$
            }, {
                regex: t2,
                idType: t0
            }, ...o && null != r && r ? t5 : [], {
                regex: t4,
                idType: t$
            }], [r, o]), x = (0, l.useMemo)(() => d.trim().length > 0 && f.some(e => {
                let {
                    regex: t
                } = e;
                return t.test(d.trim())
            }), [f, d]), g = (0, l.useCallback)(async () => {
                var e, n, i, a, o, r;
                let l = d.trim(),
                    u = f.find(e => {
                        let {
                            regex: t
                        } = e;
                        return t.test(l)
                    });
                if (!u) return;
                let m = u.idType === t$ && t4.test(l) ? Number(l) : Number(null == (e = u.regex.exec(l)) ? void 0 : e[1]);
                if (!m || !Number.isFinite(m)) return;
                let h = {
                    inputValue: l,
                    idType: u.idType,
                    matchedId: m
                };
                p(!0), v(void 0), tw(tf.ResolveExperience, h);
                try {
                    let e;
                    if (u.idType === t0) {
                        let t = null == (r = (await tZ.default.multigetPlaceDetails([m]))[0]) ? void 0 : r.universeId;
                        if (!t) {
                            tI(tf.ResolveExperience, "Experience not found", {
                                ...h,
                                placeId: m,
                                reason: "ExperienceNotFound"
                            }), v(s("Error.ExperienceNotFound")), p(!1);
                            return
                        }
                        e = t
                    } else e = m;
                    let l = null == (o = (await tZ.default.getDetails([e])).data) ? void 0 : o[0];
                    if (!(null == l ? void 0 : l.id)) {
                        tI(tf.ResolveExperience, "Experience not found", {
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
                    }), tS(tf.ResolveExperience, {
                        ...h,
                        experienceId: l.id,
                        placeId: u.idType === t0 ? m : void 0
                    }), c("")
                } catch (e) {
                    tI(tf.ResolveExperience, e, {
                        ...h,
                        placeId: u.idType === t0 ? m : void 0,
                        experienceId: u.idType === t$ ? m : void 0
                    }), v(s("Error.ExperienceNotFound"))
                } finally {
                    p(!1)
                }
            }, [t, f, s, d]), b = (0, l.useCallback)(e => {
                "Enter" === e.key && x && (g(), e.preventDefault())
            }, [x, g]);
            return (0, i.jsxs)("div", {
                className: "flex flex-row gap-x-medium items-end width-full",
                children: [(0, i.jsx)("div", {
                    className: "grow-1 min-width-0",
                    children: (0, i.jsx)(tX.TextInput, {
                        label: s("CreateMomentModal.ExperienceInput.Label"),
                        placeholder: s("CreateMomentModal.ExperienceInput.Placeholder"),
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
                }), (0, i.jsx)(J.Button, {
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
        }, [q.TranslationNamespace.Creations, q.TranslationNamespace.Controls]);
    var t7 = e.i(634733),
        t8 = e.i(605836),
        t9 = e.i(220754);
    let t6 = (0, a.withTranslation)(e => {
        let {
            value: t,
            onChange: n,
            isDisabled: s = !1
        } = e, {
            translate: o
        } = (0, a.useTranslation)(), r = o("CreateMomentModal.LanguageInput.Label"), d = o("CreateMomentModal.LanguageInput.Placeholder"), u = (0, l.useCallback)(e => {
            tj.has(e) && n(e)
        }, [n]);
        return (0, i.jsx)("div", {
            className: "width-full",
            "data-testid": "moments-language-select",
            children: (0, i.jsx)(t7.Dropdown, {
                className: "width-full [&_.content-system-alert]:text-caption-medium",
                size: "Medium",
                label: r,
                ariaLabel: r,
                placeholder: d,
                value: t,
                isDisabled: s,
                onValueChange: u,
                children: (0, i.jsx)(t9.Menu, {
                    children: (0, i.jsx)(t9.MenuSection, {
                        children: tM.map(e => (0, i.jsx)(t9.MenuItem, {
                            value: e,
                            title: (0, a.toLocaleNativeName)(e),
                            trailing: t === e && (0, i.jsx)(t8.Icon, {
                                name: "icon-filled-check",
                                size: "Medium"
                            })
                        }, e))
                    })
                })
            })
        })
    }, [q.TranslationNamespace.Creations]);
    var ne = e.i(377282),
        nt = e.i(321211);
    let nn = ["mp4", "mov"],
        ni = ["video/mp4", "video/quicktime"];
    var na = ((n = {}).FileTooBig = "FileTooBig", n.FileWrongType = "FileWrongType", n.DurationExceeded = "DurationExceeded", n.ResolutionExceeded = "ResolutionExceeded", n.MetadataUnavailable = "MetadataUnavailable", n);
    let ns = e => {
            var t, n;
            let i;
            return e.size > 0xf0000000 ? "FileTooBig" : null != (i = null == (n = (t = e).name.split(".").pop()) ? void 0 : n.toLowerCase()) && nn.some(e => e === i) && ("" === t.type || ni.includes(t.type)) ? null : "FileWrongType"
        },
        no = async e => {
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
        }, nr = async e => {
            let t = [],
                n = [];
            for (let i of e) {
                let e = ns(i);
                if (null != e) {
                    n.push({
                        file: i,
                        reason: e
                    });
                    continue
                }
                let a = await no(i);
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
        }, nl = nn.map(e => e.toUpperCase()).join("/"), nd = (0, a.withTranslation)(e => {
            let {
                hasSelectedExperience: t,
                hasSelectedLanguage: n,
                selectedFiles: s,
                isUploading: o = !1,
                onFilesChange: r,
                onValidationErrorsChange: d
            } = e, {
                translate: u
            } = (0, a.useTranslation)(), [c, m] = (0, l.useState)(!1), p = u("CreateMomentModal.DropTarget.UploadButton"), h = u("CreateMomentModal.DropTarget.NoExperienceAddedText"), v = u("CreateMomentModal.DropTarget.ExperienceAddedText"), [f, x] = (0, l.useState)(!1), g = t && n, b = t ? v : h, y = (0, l.useRef)(r), I = (0, l.useRef)(d), T = (0, l.useRef)(u);
            y.current = r, I.current = d, T.current = u;
            let C = (0, l.useCallback)(async e => {
                    var t, n, i, a;
                    if (x(!1), !g || o || c) return;
                    let s = Array.from(null != e ? e : []);
                    if (0 !== s.length) {
                        null == (t = I.current) || t.call(I, []), m(!0);
                        try {
                            let {
                                validFiles: e,
                                errors: t
                            } = await nr(s);
                            if (t.length > 0) {
                                for (let {
                                        file: e,
                                        reason: n
                                    }
                                    of t) tI(tf.ValidateVideo, n, {
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
                                        case na.FileTooBig:
                                            return e("CreateMomentModal.Error.FileTooBig", {
                                                maxFileSizeGB: String(3.75)
                                            });
                                        case na.FileWrongType:
                                            return e("CreateMomentModal.Error.FileWrongType", {
                                                formats: nl
                                            });
                                        case na.DurationExceeded:
                                            return e("CreateMomentModal.Error.DurationExceeded", {
                                                maxDurationMinutes: String(5)
                                            });
                                        case na.ResolutionExceeded:
                                            return e("CreateMomentModal.Error.ResolutionExceeded", {
                                                maxWidth: String(4096),
                                                maxHeight: String(2160)
                                            });
                                        case na.MetadataUnavailable:
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
                w = (0, l.useCallback)(() => {
                    !g || o || c || x(!0)
                }, [g, o, c]),
                S = (0, l.useCallback)(() => {
                    x(!1)
                }, []),
                A = !g || o || c;
            return (0, i.jsx)("div", {
                className: "flex flex-col gap-y-small width-full",
                children: (0, i.jsx)(nt.default, {
                    accept: "video/mp4,video/quicktime,.mp4,.mov",
                    multiple: !0,
                    size: 0xf0000000,
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
                        children: [(0, i.jsx)(J.Button, {
                            variant: "Standard",
                            size: "Medium",
                            type: "button",
                            icon: o || c ? void 0 : "icon-regular-arrow-up-from-line",
                            isDisabled: A,
                            onClick: e,
                            children: o || c ? (0, i.jsxs)("span", {
                                className: "inline-flex items-center gap-xsmall",
                                children: [(0, i.jsx)(ne.ProgressCircle, {
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
        }, [q.TranslationNamespace.Creations]), nu = (0, a.withTranslation)(e => {
            let {
                open: t,
                onOpenChange: n,
                onMomentUploaded: s
            } = e, {
                addMoments: o
            } = eL(), {
                setStatusTab: r
            } = tW(), d = tG(), {
                translate: u
            } = (0, a.useTranslation)(), {
                locale: c
            } = (0, a.useLocalization)(), m = tE(c), [p, h] = (0, l.useState)(), [v, f] = (0, l.useState)(), x = null != v ? v : m, [g, b] = (0, l.useState)([]), [y, I] = (0, l.useState)([]), T = (0, l.useRef)(0), {
                uploadVideos: C,
                isUploading: w
            } = (() => {
                let {
                    user: e
                } = (0, j.useAuthentication)(), [t, n] = (0, l.useState)(!1), [i, a] = (0, l.useState)(0);
                return {
                    uploadVideo: (0, l.useCallback)(async t => {
                        let {
                            experience: i,
                            locale: s,
                            file: o
                        } = t, r = null == e ? void 0 : e.id;
                        if (null == r) throw Error("Cannot upload Moments video without a signed-in user");
                        n(!0), a(0);
                        try {
                            var l;
                            let e = await tB({
                                    experienceId: i.id,
                                    experienceName: null != (l = i.name) ? l : "",
                                    rootPlaceId: i.rootPlaceId,
                                    ...null != s ? {
                                        locale: s
                                    } : {},
                                    file: o,
                                    onProgress: a
                                }),
                                {
                                    hasLocalVideo: t
                                } = await tY(r, e.draftId, o, []);
                            return {
                                ...e,
                                hasLocalVideo: t
                            }
                        } finally {
                            n(!1), a(0)
                        }
                    }, [null == e ? void 0 : e.id]),
                    uploadVideos: (0, l.useCallback)(async t => {
                        let {
                            experience: i,
                            locale: s,
                            files: o
                        } = t, r = null == e ? void 0 : e.id;
                        if (null == r) throw Error("Cannot upload Moments video without a signed-in user");
                        if (0 === o.length) return {
                            moments: [],
                            storageEvictedMediaDraftIds: []
                        };
                        n(!0), a(0);
                        try {
                            let e = [],
                                t = [];
                            for (let n of o) {
                                var l;
                                let o = await tB({
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
                                        hasLocalVideo: d,
                                        storageEvictedMediaDraftIds: u
                                    } = await tY(r, o.draftId, n, e);
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
                            n(!1), a(0)
                        }
                    }, [null == e ? void 0 : e.id]),
                    isUploading: t,
                    uploadProgress: i
                }
            })(), S = (0, l.useCallback)(() => {
                h(void 0), f(void 0), b([]), I([])
            }, []), A = (0, l.useCallback)(() => {
                n(!1), S()
            }, [n, S]), M = (0, l.useCallback)(e => {
                h(e)
            }, []), E = (0, l.useCallback)(e => {
                f(e)
            }, []), P = (0, l.useCallback)(() => {
                T.current += 1, b([]), I([]), h(void 0)
            }, []), k = (0, l.useCallback)(e => {
                !w && (n(e), e || S())
            }, [w, n, S]), L = (0, l.useCallback)(e => {
                I(e)
            }, []), R = (0, l.useCallback)(() => {
                I([])
            }, []), N = (0, l.useCallback)(async e => {
                var t, n, i;
                if (0 === e.length || (null == p ? void 0 : p.id) == null || d && null == x || w) return void b(e);
                let a = T.current + 1;
                T.current = a, b(e), tw(tf.UploadVideo, {
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
                    s ? t.forEach(e => {
                        s(e)
                    }) : o(t, {
                        storageEvictedMediaDraftIds: i
                    }), tS(tf.UploadVideo, {
                        experienceId: p.id,
                        fileCount: t.length,
                        persistedVideoCount: t.filter(e => e.hasLocalVideo).length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (n = e[0]) ? void 0 : n.type,
                        ...d ? {
                            locale: x
                        } : {}
                    }), r(es), A()
                } catch (t) {
                    if (T.current !== a) return;
                    tI(tf.UploadVideo, t, {
                        experienceId: p.id,
                        fileCount: e.length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (i = e[0]) ? void 0 : i.type,
                        ...d ? {
                            locale: x
                        } : {}
                    }), b([])
                }
            }, [o, A, d, w, s, p, x, r, C]), D = u("CreateMomentModal.Title"), O = y[0], U = y.length > 1 ? y.slice(1).join(" ") : void 0;
            return (0, i.jsx)(X.Dialog, {
                open: t,
                onOpenChange: k,
                size: "Large",
                isModal: !0,
                hasCloseAffordance: !0,
                closeLabel: u("Action.Close"),
                children: (0, i.jsx)(X.DialogContent, {
                    className: "flex flex-col min-width-0 width-[min(720px,95vw)] !max-width-[min(720px,95vw)]",
                    children: (0, i.jsxs)(X.DialogBody, {
                        className: "flex flex-col gap-y-medium",
                        children: [(0, i.jsx)(X.DialogTitle, {
                            className: "text-heading-small content-emphasis margin-none",
                            children: D
                        }), null != O ? (0, i.jsx)("div", {
                            className: "width-full margin-top-small padding-bottom-small",
                            children: (0, i.jsx)(Z.FeedbackBanner, {
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
                        }) : null, p ? (0, i.jsx)(tJ, {
                            experience: p,
                            onChangeExperience: P
                        }) : (0, i.jsx)(t3, {
                            onExperienceResolved: M,
                            isDisabled: w
                        }), d ? (0, i.jsx)(t6, {
                            value: x,
                            onChange: E,
                            isDisabled: w
                        }) : null, (0, i.jsx)(nd, {
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
        }, [q.TranslationNamespace.Creations, q.TranslationNamespace.Controls]);

    function nc() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        (0, $.openDialog)({
            component: nu,
            props: e,
            options: {
                mode: "standalone"
            }
        })
    }
    let nm = () => nc(),
        np = () => {
            let {
                translate: e
            } = (0, a.useTranslation)();
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(J.Button, {
                    variant: "Emphasis",
                    size: "Large",
                    type: "button",
                    onClick: nm,
                    children: e("Action.CreateMoments")
                })
            })
        };
    var nh = e.i(368313);
    let nv = e => {
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
                children: er.map(e => (0, i.jsx)(nh.Chip, {
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
        nf = () => {
            let {
                translate: e
            } = (0, a.useTranslation)(), {
                statusTab: t,
                setStatusTab: n
            } = tW(), s = (0, l.useMemo)(() => ({
                [ei]: e("MomentsTable.Pills.Active"),
                [es]: e("MomentsTable.Pills.Draft")
            }), [e]);
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(nv, {
                    groupLabel: e("MomentsTable.Header.Status"),
                    labels: s,
                    selected: t,
                    onChange: n
                })
            })
        };
    var nx = e.i(253536);
    let ng = e => {
        var t, n, s;
        let {
            data: o
        } = e, {
            translate: r
        } = (0, a.useTranslation)(), l = (null == o || null == (n = o.creationAccessMetadata) ? void 0 : n.accessAllowed) === !1;
        if (!l) return null;
        let d = null != (t = null == o || null == (s = o.creationAccessMetadata) ? void 0 : s.daysToUnblock) ? t : 0,
            u = l && -1 === d;
        return (0, i.jsx)(_.default, {
            alertTitle: u ? r("Heading.PermanentlyCreationBanned") : r("Heading.TemporaryCreationBanned", {
                days: d.toString()
            }),
            alertDescription: r(u ? "Description.PermanentlyCreationBanned" : "Description.TemporaryCreationBanned"),
            severity: "warning",
            externalLink: nx.MARKETPLACE_POLICY,
            linkLabel: r("Label.MarketplacePolicy"),
            allowCloseDialog: !1
        })
    };
    var nb = e.i(770009),
        ny = e.i(988012),
        nI = e.i(93235),
        nT = e.i(27281),
        nC = e.i(706442),
        nw = e.i(756568),
        nS = e.i(849087),
        nA = e.i(665357),
        nM = e.i(131385),
        nj = e.i(643093);
    let nE = (0, nC.makeStyles)()({
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
        nP = () => {
            var e;
            let {
                classes: {
                    chipRow: t
                }
            } = nE(), {
                translate: n
            } = (0, a.useTranslation)(), s = (0, nA.default)(), o = null != (e = (0, nS.default)()) && e, [{
                activeTab: r
            }, d] = (0, F.useQueryParams)(["activeTab", "filterIndex"]), {
                l1Options: u,
                activeL1Key: c
            } = (0, nM.default)(!0), m = (0, g.isAllAssetTypesActiveTab)(r), p = (0, g.isAvatarLooksActiveTab)(r), h = (0, l.useCallback)(e => {
                e && d({
                    activeTab: (0, g.buildTaxonomyActiveTab)(e),
                    filterIndex: 0
                })
            }, [d]), v = (0, l.useCallback)(() => {
                d({
                    activeTab: (0, g.buildTaxonomyActiveTab)(g.ALL_ASSET_TYPES_L1_KEY),
                    filterIndex: 0
                })
            }, [d]), f = (0, l.useCallback)(() => {
                d({
                    activeTab: (0, g.buildTaxonomyActiveTab)(g.AVATAR_LOOKS_L1_KEY),
                    filterIndex: 0
                })
            }, [d]), x = n("Label.Categories");
            return 0 !== u.length || m ? (0, i.jsxs)("fieldset", {
                className: t,
                "aria-label": x,
                children: [o && (0, i.jsx)(nh.Chip, {
                    text: n("Label.Avatars"),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: p,
                    onCheckedChange: f
                }), u.map(e => {
                    var t;
                    return (0, i.jsx)(nh.Chip, {
                        text: (0, nj.taxonomyOptionLabel)(e, n),
                        size: "Medium",
                        variant: "Standard",
                        isChecked: e.taxonomyKey === c,
                        onCheckedChange: () => h(e.taxonomyKey)
                    }, null != (t = e.taxonomyKey) ? t : e.nameKey)
                }), s && (0, i.jsx)(nh.Chip, {
                    text: n("Label.AllAssetTypes"),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: m,
                    onCheckedChange: v
                })]
            }) : null
        };
    var nk = e.i(638016),
        nL = e.i(157310),
        nR = e.i(100226);
    let nN = (e, t) => {
            let {
                settings: n
            } = (0, x.useSettings)(), i = C(), a = (0, nA.default)(), s = (0, nS.default)(), o = (0, nR.default)(), {
                data: r
            } = (0, nL.useQuery)({
                queryKey: ["avatar-items-entry-point-asset-types"],
                queryFn: y.getAvatarItemsEntryPointAssetTypes,
                staleTime: 3e5
            });
            return (0, l.useMemo)(() => {
                var l, d;
                return null != (l = null == (d = e.menuItem.submenuItems) ? void 0 : d.filter(l => I.default.isMenuItemEnabled(l, n, t, "Label.AvatarItems" === e.menuItem.nameKey ? null == r ? void 0 : r.has(l.type) : void 0, r, i, a, s, o))) ? l : []
            }, [e.menuItem.submenuItems, e.menuItem.nameKey, n, t, r, i, a, s, o])
        },
        nD = (0, nC.makeStyles)()(e => ({
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
        nO = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                group: s
            } = e, {
                classes: {
                    subMenuContainer: o,
                    subMenu: r,
                    backButton: d,
                    nextButton: u,
                    chip: c
                },
                cx: m
            } = nD(), p = (0, l.useRef)(null), {
                translate: h
            } = (0, a.useTranslation)(), [v, f] = (0, l.useState)(0), [x, g] = (0, l.useState)(0), [b, y] = (0, l.useState)(0), {
                isTaxonomyMode: T
            } = (0, nk.default)(I.default.getAssetType(t)), C = nN(t, s), w = (0, l.useMemo)(() => v <= 0, [v]), S = (0, l.useMemo)(() => v + b >= x, [v, x, b]), A = () => {
                var e, t, n;
                let i = null == p ? void 0 : p.current;
                f(null != (e = null == i ? void 0 : i.scrollLeft) ? e : 0), g(null != (t = null == i ? void 0 : i.scrollWidth) ? t : 0), y(null != (n = null == i ? void 0 : i.offsetWidth) ? n : 0)
            };
            return ((0, l.useEffect)(() => {
                let e = null == p ? void 0 : p.current,
                    t = new ResizeObserver(A);
                return e && (e.addEventListener("scroll", A), t.observe(e)), () => {
                    e && (e.removeEventListener("scroll", A), t.unobserve(e))
                }
            }, []), T) ? (0, i.jsx)(nP, {}) : (0, i.jsxs)(nw.Flex, {
                classes: {
                    root: o
                },
                children: [!w && (0, i.jsx)("div", {
                    className: d,
                    children: (0, i.jsx)(ny.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: -b,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "back",
                        children: (0, i.jsx)(nI.NavigateBeforeIcon, {
                            fontSize: "small"
                        })
                    })
                }), (0, i.jsx)("div", {
                    ref: p,
                    className: m(r, "flex max-medium:wrap max-medium:gap-y-small"),
                    children: null == C ? void 0 : C.map(e => {
                        let a = t.submenuItem === e;
                        return (0, i.jsx)(nb.Chip, {
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
                    children: (0, i.jsx)(ny.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: b,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "next",
                        children: (0, i.jsx)(nT.NavigateNextIcon, {
                            fontSize: "small"
                        })
                    })
                })]
            })
        };
    var nU = e.i(54842),
        nB = e.i(774807),
        nz = e.i(558826),
        nV = e.i(872204),
        nF = e.i(39128),
        nq = e.i(54369),
        nG = e.i(220552),
        n_ = e.i(573672),
        nH = e.i(310634),
        nK = e.i(556030),
        nW = e.i(517379),
        nY = e.i(199834),
        nQ = e.i(239328),
        nJ = e.i(776344),
        nX = e.i(823062),
        nZ = e.i(198528),
        n$ = e.i(949599),
        n0 = e.i(704443),
        n1 = e.i(696564),
        n2 = e.i(418162);
    let n4 = (0, nC.makeStyles)()(e => ({
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
    var n5 = e.i(291037),
        n3 = e.i(777004),
        n7 = e.i(899819),
        n8 = e.i(447055),
        n9 = e.i(242788),
        n6 = e.i(854705),
        ie = e.i(235684),
        it = e.i(210598),
        ii = e.i(904090),
        ia = e.i(196945),
        is = e.i(913893),
        io = e.i(185915);

    function ir(e) {
        if (void 0 === e.id || void 0 === e.autoPublishEnabled) throw Error("Publishing preferences response was malformed");
        return e
    }
    async function il(e) {
        return ir(await is.default.getPublishingPreferences(e))
    }
    async function id(e) {
        return ir(await is.default.createPublishingPreferences(e))
    }
    var iu = e.i(812141);
    let ic = e => {
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
            }), (0, i.jsx)(nF.Divider, {})]
        })
    };

    function im(e) {
        return 4 === e || 2 === e
    }

    function ip(e, t, n) {
        return e && t && "all" === n ? 1 : e && t && "specific" === n ? 4 : e && !t ? 3 : !e && t ? 2 : 0
    }
    let ih = e => {
        var t;
        let {
            open: n,
            onClose: s
        } = e, {
            translate: o
        } = (0, a.useTranslation)(), {
            enqueue: r
        } = (0, ia.useSnackbar)(), {
            user: d
        } = (0, j.useAuthentication)(), u = (0, f.useCurrentGroup)(), c = null == u ? void 0 : u.id, {
            data: m
        } = (0, iu.default)(is.default), p = null != (t = null == m ? void 0 : m.maxCollectiblePrice) ? t : n1.DefaultMaxCollectiblePrice, [h, v] = (0, l.useState)(!0), [x, g] = (0, l.useState)(!1), [b, y] = (0, l.useState)(!1), [I, T] = (0, l.useState)(""), [C, w] = (0, l.useState)(""), [S, A] = (0, l.useState)(!0), [M, E] = (0, l.useState)(!0), [P, k] = (0, l.useState)(!0), [L, R] = (0, l.useState)("all"), [N, D] = (0, l.useState)(""), [O, U] = (0, l.useState)(!1);
        (0, l.useEffect)(() => {
            n && il(c).then(e => {
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
                E(t.sellInMarketplace), k(t.sellInExperiences), R(t.experienceLocationMode), e.places.length > 0 && D(e.places.join(","))
            }).catch(e => {
                var t;
                (null == (t = (0, io.default)(e)) ? void 0 : t.status) !== 404 && (U(!0), r({
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
        let B = (0, l.useCallback)(async () => {
                if (null == d ? void 0 : d.id) {
                    g(!0);
                    try {
                        let e = ip(M, P, L),
                            t = im(e) ? N.split(",").filter(Boolean).map(e => Number(e)) : [];
                        await id({
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
                        let e = await (0, tp.default)(t);
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
            }, [d, c, M, P, L, N, C, I, S, b, r, s, o]),
            z = (0, l.useCallback)(() => {
                B()
            }, [B]),
            V = (0, l.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && T(t)
            }, [p]),
            F = (0, l.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && w(t)
            }, [p]),
            q = (0, l.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9,]/g, "").replaceAll(/,{2,}/g, ",").replace(/^,/, "").split(",").map(e => e.replace(/^0+(\d)/, "$1")).filter(e => "0" !== e).join(","),
                    n = t.split(",").filter(Boolean);
                if (!(n.length > 5)) {
                    if (5 === n.length && t.endsWith(",")) return void D(t.slice(0, -1));
                    D(t)
                }
            }, []),
            G = h || x || O || !M && !P || "" === I || "" === C || 0 >= Number(C) || im(ip(M, P, L)) && 0 === N.split(",").filter(Boolean).length;
        return (0, i.jsxs)(n5.Dialog, {
            open: n,
            onClose: s,
            maxWidth: "Medium",
            color: "primaryBrand",
            PaperProps: {
                className: "[width:580px]"
            },
            children: [(0, i.jsx)(n7.DialogTitle, {
                className: "padding-bottom-none",
                children: (0, i.jsxs)("div", {
                    className: "flex justify-between items-start",
                    children: [(0, i.jsx)("span", {
                        className: "text-heading-small",
                        children: o("Heading.StudioPublishSettings")
                    }), (0, i.jsx)(ny.IconButton, {
                        "aria-label": "Close",
                        onClick: s,
                        size: "small",
                        color: "inherit",
                        children: (0, i.jsx)(n8.CloseIcon, {})
                    })]
                })
            }), (0, i.jsxs)(n3.DialogContent, {
                className: "padding-top-small",
                children: [(0, i.jsx)(nY.Typography, {
                    variant: "body2",
                    className: "[opacity:0.7] padding-bottom-medium",
                    children: o("Description.StudioPublishSettingsSubtitle")
                }), (0, i.jsx)(ic, {
                    label: o("Label.Availability"),
                    children: (0, i.jsx)("span", {
                        className: "text-label-large [margin-left:12px]",
                        children: o("Label.NonLimited")
                    })
                }), (0, i.jsx)(ic, {
                    label: o("Label.TimedOption"),
                    children: (0, i.jsx)(nW.Switch, {
                        checked: b,
                        onChange: () => y(e => !e),
                        "aria-label": "Timed Option"
                    })
                }), (0, i.jsx)(ic, {
                    label: o("Label.PriceConfigurations"),
                    className: "grid [grid-template-columns:175px_1fr] padding-y-large gap-xsmall",
                    labelClassName: "padding-top-small",
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col [flex:1] gap-xsmall",
                        children: [(0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(it.TextField, {
                                id: "price-offset",
                                label: "",
                                placeholder: o("Placeholder.AmountAbovePriceFloor"),
                                variant: "outlined",
                                size: "small",
                                value: I,
                                onChange: V,
                                fullWidth: !0
                            }), (0, i.jsx)(ii.Tooltip, {
                                title: o("Tooltip.AmountAbovePriceFloor"),
                                children: (0, i.jsx)(ny.IconButton, {
                                    "aria-label": "price offset info",
                                    size: "small",
                                    children: (0, i.jsx)(n9.InfoOutlinedIcon, {})
                                })
                            })]
                        }), (0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(it.TextField, {
                                id: "price-floor-minimum",
                                label: "",
                                placeholder: o("Placeholder.DoNotPriceBelow"),
                                variant: "outlined",
                                size: "small",
                                value: C,
                                onChange: F,
                                fullWidth: !0
                            }), (0, i.jsx)(ii.Tooltip, {
                                title: o("Tooltip.MinimumPriceFloor"),
                                children: (0, i.jsx)(ny.IconButton, {
                                    "aria-label": "minimum price info",
                                    size: "small",
                                    children: (0, i.jsx)(n9.InfoOutlinedIcon, {})
                                })
                            })]
                        })]
                    })
                }), (0, i.jsx)(ic, {
                    label: o("Label.RegionalPricing"),
                    children: (0, i.jsx)(nW.Switch, {
                        checked: S,
                        onChange: () => A(e => !e),
                        "aria-label": "Regional Pricing"
                    })
                }), (0, i.jsx)(ic, {
                    label: o("Label.SellInMarketplace"),
                    children: (0, i.jsx)(nW.Switch, {
                        checked: M,
                        onChange: () => {
                            let e = !M;
                            e || R("specific"), E(e)
                        },
                        "aria-label": "Sell in Marketplace"
                    })
                }), (0, i.jsx)(ic, {
                    label: o("Label.SellInExperiences"),
                    children: (0, i.jsx)(nW.Switch, {
                        checked: P,
                        onChange: () => k(e => !e),
                        "aria-label": "Sell in experiences"
                    })
                }), P && (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(nF.Divider, {}), (0, i.jsxs)("div", {
                        className: "padding-y-large",
                        children: [(0, i.jsxs)("div", {
                            className: "grid [grid-template-columns:175px_1fr] items-center",
                            children: [(0, i.jsx)("span", {
                                className: "text-label-large",
                                children: o("Label.ExperienceLocations")
                            }), (0, i.jsxs)(ie.RadioGroup, {
                                row: !0,
                                value: L,
                                onChange: e => {
                                    let t = e.target.value;
                                    ("all" === t || "specific" === t) && R(t)
                                },
                                className: "flex flex-row no-wrap gap-xsmall [margin-left:12px]",
                                children: [(0, i.jsx)(nq.FormControlLabel, {
                                    value: "all",
                                    disabled: !M,
                                    control: (0, i.jsx)(n6.Radio, {
                                        "aria-label": o("Label.AllGames"),
                                        size: "small"
                                    }),
                                    label: o("Label.AllGames"),
                                    className: "margin-right-medium"
                                }), (0, i.jsx)(nq.FormControlLabel, {
                                    value: "specific",
                                    control: (0, i.jsx)(n6.Radio, {
                                        "aria-label": o("Label.SpecificExperiences"),
                                        size: "small"
                                    }),
                                    label: o("Label.SpecificExperiences")
                                })]
                            })]
                        }), "specific" === L && (0, i.jsxs)("div", {
                            className: "[margin-left:187px] [margin-top:10px]",
                            children: [(0, i.jsx)(it.TextField, {
                                id: "place-ids",
                                label: "",
                                placeholder: o("Placeholder.EnterExperienceIDs"),
                                variant: "outlined",
                                size: "small",
                                value: N,
                                onChange: q,
                                fullWidth: !0
                            }), (0, i.jsxs)(nY.Typography, {
                                variant: "caption",
                                className: "[opacity:0.6] block [margin-top:4px]",
                                children: [N ? N.split(",").filter(Boolean).length : 0, "/", 5, " ", o("Label.ExperiencesCount")]
                            })]
                        })]
                    })]
                })]
            }), (0, i.jsxs)("div", {
                className: "flex padding-x-large padding-y-medium gap-small",
                children: [(0, i.jsx)(nV.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: z,
                    disabled: G,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: o("Action.Save")
                }), (0, i.jsx)(nV.Button, {
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
    var iv = e.i(186214),
        ix = e.i(759283);
    let ig = (e, t) => {
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
    var ib = e.i(685245),
        iy = e.i(431498);
    let iI = (0, nC.makeStyles)()(e => ({
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
        iT = ["makeup", "clothing", "accessories"],
        iC = ["clothing", "makeup"],
        iw = {
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

    function iS(e) {
        return e ? iw.clothing.all : "Label.ClothingOnlyTShirtsPantsSweaters"
    }
    let iA = (0, a.withTranslation)(e => {
        let t, {
                open: n,
                onClose: s,
                categoryFlags: o,
                assetTypesByCategory: r
            } = e,
            {
                translate: d
            } = (0, a.useTranslation)(),
            {
                classes: u,
                cx: c
            } = iI(),
            {
                enqueue: m,
                close: p
            } = (0, ia.useSnackbar)(),
            h = (0, f.useCurrentGroup)(),
            v = !1 !== o.showCategorySubtypeDropdowns,
            x = (0, l.useMemo)(() => v ? iT : iC, [v]),
            [g, b] = (0, l.useState)({
                clothing: !1,
                makeup: !1,
                accessories: !1
            }),
            [y, I] = (0, l.useState)({}),
            [T, C] = (0, l.useState)(() => ({
                clothing: !0,
                makeup: !0,
                accessories: !0
            })),
            [w, S] = (0, l.useState)(!1),
            [A, M] = (0, l.useState)(null),
            j = (0, l.useMemo)(() => r ? {
                clothing: r.clothing,
                makeup: r.makeup,
                accessories: r.accessories
            } : {
                clothing: [],
                makeup: [],
                accessories: []
            }, [r]),
            P = (0, l.useMemo)(() => ({
                clothing: o.showClothing,
                makeup: o.showMakeup,
                accessories: o.showAccessories
            }), [o.showAccessories, o.showClothing, o.showMakeup]);
        (0, l.useEffect)(() => {
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
        let k = (0, l.useCallback)(() => {
                s()
            }, [s]),
            L = (0, l.useCallback)(() => {
                M("enable"), S(!0)
            }, []),
            R = (0, l.useCallback)(() => {
                M("disable"), S(!0)
            }, []),
            N = (0, l.useCallback)(async () => {
                if (!r || null === A) return void s();
                let e = x.flatMap(e => P[e] ? j[e].filter(e => y[e]) : []);
                try {
                    await is.default.bulkUpdateCollectible(E.uuidService.generateRandomUuid(), null == h ? void 0 : h.id, e.map(e => (0, n2.translateAssetType)(e)), "enable" === A), m({
                        message: d("Message.TimedOptionSettingsApplied"),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: ix.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    }), window.location.reload(), s()
                } catch (e) {
                    m({
                        message: d(ig(await (0, tp.default)(e), "Error.Unknown")),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: ix.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    })
                }
            }, [r, y, A, null == h ? void 0 : h.id, m, p, s, j, P, d, x]),
            D = (0, l.useCallback)(() => {
                S(!1), M(null)
            }, []),
            O = (0, l.useMemo)(() => x.map(e => {
                if (!P[e]) return null;
                let t = j[e];
                if (0 === t.length) return null;
                let n = t.filter(e => y[e]);
                if (0 === n.length) return null;
                if (n.length === t.length) return d("clothing" === e ? iS(v) : iw[e].all);
                let i = d(iw[e].short),
                    a = n.map(e => d(ix.assetFullNameKeys[e])).join(", ");
                return "".concat(i, " (").concat(a, ")")
            }).filter(e => null !== e), [y, j, P, v, d, x]),
            U = (0, l.useMemo)(() => x.some(e => P[e] && j[e].some(e => y[e])), [y, j, P, x]),
            B = (0, i.jsxs)(i.Fragment, {
                children: [(0, i.jsx)(iv.DialogContentText, {
                    className: u.descriptionText,
                    children: d("Description.BulkUpdateAllTimedOptions")
                }), (0, i.jsx)(nJ.default, {
                    flexDirection: "column",
                    classes: {
                        root: u.checkboxList
                    },
                    children: x.map(e => (e => {
                        let t = j[e];
                        if (!P[e]) return null;
                        let n = g[e],
                            a = "timed-options-bulk-".concat(e, "-subtypes"),
                            s = d("clothing" === e ? iS(v) : iw[e].all);
                        return (0, i.jsxs)(l.default.Fragment, {
                            children: [(0, i.jsxs)("div", {
                                className: u.categoryRow,
                                children: [v ? (0, i.jsx)(ny.IconButton, {
                                    type: "button",
                                    size: "small",
                                    className: u.expandToggle,
                                    onClick: () => b(t => ({
                                        ...t,
                                        [e]: !t[e]
                                    })),
                                    "aria-expanded": n,
                                    "aria-controls": a,
                                    "aria-label": d("AriaLabel.ToggleTimedOptionsCategorySubtypes", {
                                        categoryName: s
                                    }),
                                    color: "inherit",
                                    children: (0, i.jsx)(iy.ChevronRightIcon, {
                                        className: c(n ? u.expandToggleExpanded : u.expandToggleCollapsed)
                                    })
                                }) : null, (0, i.jsx)(ib.Checkbox, {
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
                                    className: u.categoryLabelWide
                                })]
                            }), v && n ? (0, i.jsx)("div", {
                                id: a,
                                className: u.subtypeIndent,
                                children: t.map(e => (0, i.jsx)(ib.Checkbox, {
                                    label: d(ix.assetFullNameKeys[e]),
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
                }), (0, i.jsxs)(nJ.default, {
                    flexDirection: "row",
                    classes: {
                        root: u.buttonContainer
                    },
                    children: [(0, i.jsx)(nV.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: L,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !U,
                        children: d("Action.Enable")
                    }), (0, i.jsx)(nV.Button, {
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
            children: [(0, i.jsx)(iv.DialogContentText, {
                className: u.descriptionText,
                children: d(t)
            }), O.length > 0 && (0, i.jsx)("ul", {
                className: u.bulletList,
                children: O.map(e => (0, i.jsx)("li", {
                    children: e
                }, e))
            }), (0, i.jsx)(iv.DialogContentText, {
                className: u.descriptionText,
                children: d("Description.ThisWillAlsoReplaceAnyItemLevelSettings")
            }), (0, i.jsxs)(nJ.default, {
                flexDirection: "row",
                classes: {
                    root: u.buttonContainer
                },
                children: [(0, i.jsx)(nV.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: N,
                    size: "medium",
                    className: u.actionButton,
                    children: d("Action.Confirm")
                }), (0, i.jsx)(nV.Button, {
                    variant: "contained",
                    color: "secondary",
                    onClick: D,
                    size: "medium",
                    className: u.actionButton,
                    children: d("Action.Cancel")
                })]
            })]
        })), (0, i.jsxs)(n5.Dialog, {
            open: n,
            onClose: k,
            maxWidth: "Small",
            color: "primaryBrand",
            classes: {
                paper: u.dialogPaper
            },
            children: [(0, i.jsxs)(n7.DialogTitle, {
                className: u.dialogTitle,
                children: [(0, i.jsx)("span", {
                    className: u.dialogTitleText,
                    children: w ? d("Title.ConfirmOption") : d("Action.TimedOptions")
                }), !w && (0, i.jsx)(ny.IconButton, {
                    "aria-label": "Close",
                    onClick: k,
                    size: "small",
                    className: u.closeButton,
                    color: "inherit",
                    children: (0, i.jsx)(n8.CloseIcon, {})
                })]
            }), (0, i.jsx)(n3.DialogContent, {
                className: u.dialogContent,
                children: B
            })]
        })
    }, [q.TranslationNamespace.ConfigureItem, q.TranslationNamespace.Creations, q.TranslationNamespace.AssetTypes]);

    function iM(e) {
        return "Tshirt" === e ? m.Asset.TShirt : "TshirtAccessory" === e ? m.Asset.TShirtAccessory : e
    }
    let ij = (0, nC.makeStyles)()(e => ({
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
        iE = (0, a.withTranslation)(e => {
            let t, n, s, o, {
                    open: r,
                    onClose: d
                } = e,
                {
                    translate: u,
                    translateHTML: c
                } = (0, a.useTranslation)(),
                {
                    classes: p
                } = ij(),
                {
                    enqueue: h,
                    close: v
                } = (0, ia.useSnackbar)(),
                x = (0, f.useCurrentGroup)(),
                [g, b] = (0, l.useState)(null),
                [y, I] = (0, l.useState)(() => E.uuidService.generateRandomUuid()),
                [T, C] = (0, l.useState)({
                    showClothing: !1,
                    showMakeup: !1,
                    showAccessories: !1,
                    showCategorySubtypeDropdowns: !0
                }),
                [w, S] = (0, l.useState)(!1);
            (0, l.useEffect)(() => {
                r ? (b(null), I(E.uuidService.generateRandomUuid()), (0, n1.getValidTimedOptionsTypes)().then(() => {
                    let e = new Set(n1.ValidTimedOptionsAssetTypes.map(e => iM(e))),
                        t = 3 === e.size && Array.from(n$.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).every(t => e.has(t));
                    if (S(t), t) C({
                        showClothing: !1,
                        showMakeup: !1,
                        showAccessories: !1,
                        showCategorySubtypeDropdowns: !0
                    });
                    else {
                        let t = [...e].every(e => n$.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e) || n$.MAKEUP_ASSET_TYPES.includes(e)),
                            n = e.has(m.Asset.EyeMakeup),
                            i = n$.CLOTHING_ASSET_TYPES.some(t => e.has(t) && !n$.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(t)),
                            a = Array.from(n$.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(t => e.has(t));
                        C({
                            showClothing: i || a,
                            showMakeup: n,
                            showAccessories: e.has(m.Asset.Hat),
                            showCategorySubtypeDropdowns: !t
                        })
                    }
                })) : I(E.uuidService.generateRandomUuid())
            }, [r]);
            let A = (0, l.useCallback)(async () => {
                    try {
                        await is.default.bulkUpdateCollectible(y, null == x ? void 0 : x.id, [64, 66, 68], !0 === g), h({
                            message: u("Message.TimedOptionSettingsApplied"),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: ix.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        }), window.location.reload(), d()
                    } catch (e) {
                        h({
                            message: u(ig(await (0, tp.default)(e), "Error.Unknown")),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: ix.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        })
                    }
                }, [h, v, u, d, y, null == x ? void 0 : x.id, g]),
                M = (0, l.useCallback)(() => {
                    d()
                }, [d]),
                j = !w,
                P = j ? (t = new Set(n1.ValidTimedOptionsAssetTypes.map(e => iM(e))), n = n$.CLOTHING_ASSET_TYPES.some(e => t.has(e) && !n$.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e)), s = Array.from(n$.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(e => t.has(e)), o = T.showCategorySubtypeDropdowns && (!s || n) ? n$.CLOTHING_ASSET_TYPES.filter(e => t.has(e)) : Array.from(n$.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).filter(e => t.has(e)), {
                    clothing: o,
                    makeup: n$.MAKEUP_ASSET_TYPES.filter(e => t.has(e)),
                    accessories: T.showCategorySubtypeDropdowns ? n$.ACCESSORY_ASSET_TYPES.filter(e => t.has(e)) : []
                }) : void 0;
            return j ? (0, i.jsx)(iA, {
                open: r,
                onClose: M,
                categoryFlags: T,
                assetTypesByCategory: P
            }) : (0, i.jsxs)(n5.Dialog, {
                open: r,
                onClose: M,
                maxWidth: "Small",
                color: "primaryBrand",
                children: [(0, i.jsxs)(n7.DialogTitle, {
                    className: p.dialogTitle,
                    children: [(0, i.jsx)("span", {
                        children: null === g ? u("Action.TimedOptions") : u("Action.Confirm")
                    }), (0, i.jsx)(ny.IconButton, {
                        "aria-label": "Close",
                        onClick: M,
                        size: "small",
                        className: p.closeButton,
                        color: "inherit",
                        children: (0, i.jsx)(n8.CloseIcon, {})
                    })]
                }), (0, i.jsx)(n3.DialogContent, {
                    className: p.dialogContent,
                    children: null === g ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(iv.DialogContentText, {
                            className: p.descriptionText,
                            children: u("Description.BulkUpdateTimedOptions")
                        }), (0, i.jsxs)(nJ.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(nV.Button, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    b(!0)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.TurnAllOn")
                            }), (0, i.jsx)(nV.Button, {
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
                        children: [(0, i.jsx)(iv.DialogContentText, {
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
                        }), (0, i.jsxs)(nJ.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(nV.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                onClick: A,
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.Confirm")
                            }), (0, i.jsx)(nV.Button, {
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
        }, [q.TranslationNamespace.ConfigureItem, q.TranslationNamespace.Creations]),
        iP = Object.values(O.SearchSortParameter),
        ik = Object.values(nU.EventSortBy),
        iL = ["publishSettings"],
        iR = e => {
            var t;
            let {
                menuState: n
            } = e, {
                translate: s
            } = (0, a.useTranslation)(), {
                unifiedLogger: o
            } = (0, nX.useUnifiedLoggerProvider)(), {
                value: r
            } = (0, u.useFlag)(nQ.isAutoPublishPreferencesEnabled), {
                isFetched: d
            } = (0, f.useGroups)(), {
                classes: {
                    toolbarContainer: c,
                    sortContainer: p,
                    timedOptionsButton: h,
                    timedOptionsButtonDivider: v
                }
            } = n4(), [x, b] = (0, l.useState)(!1), [T, C] = (0, l.useState)(!1), [w, S] = (0, l.useState)(0), [A, M] = (0, l.useState)(!1), [j, P] = (0, l.useState)(!1), [k, L] = (0, l.useState)(null);
            (0, l.useEffect)(() => {
                (0, n1.getValidTimedOptionsTypes)().then(() => {
                    P(!0)
                })
            }, []);
            let {
                sort: R,
                setSort: N,
                sortOrder: D,
                setSortOrder: U,
                isArchived: B,
                setIsArchived: z,
                isAgeRestrictedCollaboration: V,
                setIsAgeRestrictedCollaboration: q,
                isPublicOnly: G,
                setIsPublicOnly: _,
                isOnMarketplace: H,
                setIsOnMarketplace: K
            } = (0, Y.default)(), [{
                filterIndex: W,
                publishSettings: Q
            }] = (0, F.useQueryParams)(["filterIndex", "publishSettings"]), [, J] = (0, F.useQueryParams)(["activeTab", "filterIndex"]), [, X] = (0, F.useQueryParams)(iL), Z = (0, l.useMemo)(() => {
                let e = I.default.getAssetType(n);
                return e !== m.Asset.AllCatalogAsset || Number(W) > 0 ? e : g.TAXONOMY_HOST_ASSET
            }, [n, W]), $ = (Z in n$.AvatarMenuMap || Z === m.Asset.AllCatalogAsset) && r, ee = (0, nZ.normalizeSingleQueryParam)(Q), et = !!$ && d && !A && ("true" === ee || "1" === ee);
            (0, l.useEffect)(() => {
                d && void 0 !== ee && (et || X({
                    publishSettings: null
                }, {
                    skipHistory: !0
                }))
            }, [d, et, ee, X]);
            let en = (0, l.useCallback)(() => {
                    C(!1), et && (M(!0), X({
                        publishSettings: null
                    }, {
                        skipHistory: !0
                    }))
                }, [et, X]),
                {
                    canUseTaxonomy: ei,
                    isTaxonomyMode: ea
                } = (0, nk.default)(Z),
                es = nN(n, (0, f.useCurrentGroup)()),
                {
                    isSortable: eo,
                    isArchivable: er
                } = (0, l.useMemo)(() => {
                    let e = ea || null == W ? void 0 : Number(W),
                        t = I.default.isAssetTypeArchivable(Z, e);
                    return {
                        isSortable: I.default.isAssetTypeSortable(Z),
                        isArchivable: t || I.default.isAssetTypeDirectlyArchivable(Z)
                    }
                }, [Z, W, ea]),
                el = s("Label.CategorizeByTaxonomy"),
                ed = (0, l.useCallback)(() => {
                    var e;
                    let t = null == (e = es[0]) ? void 0 : e.type;
                    J({
                        activeTab: ea ? null != t ? t : Z : (0, g.buildTaxonomyActiveTab)(),
                        filterIndex: 0
                    }, {
                        skipHistory: !0
                    })
                }, [ea, Z, es, J]),
                eu = (0, l.useMemo)(() => !eo && !er && !ei && Z !== m.Asset.MyExperiences && Z !== m.Asset.SharedExperiences, [eo, er, ei, Z]),
                ec = (0, l.useCallback)(e => {
                    let {
                        value: t
                    } = e.target;
                    if (Z === m.Asset.MyExperiences || Z === m.Asset.SharedExperiences) {
                        if (!iP.includes(t)) return;
                        N(e => ({
                            ...e,
                            [m.Asset.Place]: t
                        }))
                    } else ik.includes(t) && N(e => ({
                        ...e,
                        [Z]: t
                    }))
                }, [N, Z]),
                em = (0, l.useCallback)(() => {
                    U(e => e === E.SortOrder.Asc ? E.SortOrder.Desc : E.SortOrder.Asc)
                }, [U]),
                ep = (0, l.useCallback)(() => {
                    b(!0)
                }, []),
                eh = (0, l.useCallback)(() => {
                    let e = !V;
                    o.logClickEvent({
                        eventName: th.default.ImpactedExperiencesFilterClick,
                        parameters: {
                            page: "creations",
                            action: e ? "enable" : "disable",
                            assetType: Z.toString()
                        }
                    }), q(e => !e)
                }, [o, V, Z, q]),
                ev = Z === m.Asset.MyExperiences || Z === m.Asset.SharedExperiences,
                ef = (0, l.useMemo)(() => ev ? Object.values(O.SearchSortParameter).map(e => ({
                    value: e,
                    labelKey: y.universeSortTranslationKeys[e]
                })) : Object.values(nU.EventSortBy).map(e => ({
                    value: e,
                    labelKey: y.eventSortTranslationKeys[e]
                })), [ev]),
                ex = (0, l.useMemo)(() => ev ? R[m.Asset.Place] : (0, n0.getSortForAssetType)(Z, R), [ev, R, Z]),
                eg = (0, l.useMemo)(() => {
                    var e, t;
                    if (!j) return !1;
                    let i = ea || null == W ? void 0 : Number(W);
                    if (void 0 !== i && n$.AvatarMenuMap[Z]) {
                        let e = n$.AvatarMenuMap[Z][i];
                        if (e) return (0, n2.getIsRentableType)(e.assetType, e.bundleType)
                    }
                    return (0, n2.getIsRentableType)(null != (e = null == (t = n.submenuItem) ? void 0 : t.type) ? e : Z, void 0)
                }, [Z, W, ea, null == (t = n.submenuItem) ? void 0 : t.type, j]);
            if (eu) return null;
            let eb = Z === m.Asset.MyExperiences || Z === m.Asset.SharedExperiences || er || ei || Z === m.Asset.MeshPart,
                ey = Z === m.Asset.MyExperiences || Z === m.Asset.SharedExperiences,
                eI = Z === m.Asset.Decal || Z === m.Asset.MeshPart,
                eT = !$ && !eg && !!(Z === m.Asset.MyExperiences || ey || er && Z);
            return (0, i.jsxs)(nJ.Flex, {
                flexDirection: "row",
                justifyContent: "flex-start",
                alignItems: "flex-start",
                flexWrap: "wrap",
                classes: {
                    root: c
                },
                children: [eb && (0, i.jsxs)(nJ.Flex, {
                    alignItems: "center",
                    gap: 1,
                    flexDirection: "row",
                    children: [eT && (0, i.jsx)(nY.Typography, {
                        marginRight: "16px",
                        children: s("Label.ShowPrefix")
                    }), Z === m.Asset.MyExperiences && (0, i.jsx)(nq.FormControlLabel, {
                        control: (0, i.jsx)(nW.Switch, {
                            checked: G,
                            onChange: () => _(e => !e),
                            "aria-label": s("Label.Public")
                        }),
                        label: s("Label.Public")
                    }), ey && (0, i.jsx)(nq.FormControlLabel, {
                        control: (0, i.jsx)(nW.Switch, {
                            checked: V,
                            onChange: eh,
                            "aria-label": s("Label.Impacted")
                        }),
                        label: s("Label.Impacted")
                    }), eg && !$ && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nV.Button, {
                            variant: "contained",
                            color: "secondary",
                            onClick: ep,
                            classes: {
                                root: h
                            },
                            children: s("Action.TimedOptions")
                        }), (0, i.jsx)(nF.Divider, {
                            orientation: "vertical",
                            flexItem: !0,
                            classes: {
                                root: v
                            }
                        })]
                    }), er && Z && (0, i.jsx)(nq.FormControlLabel, {
                        control: (0, i.jsx)(nW.Switch, {
                            checked: B,
                            onChange: () => z(e => !e),
                            "aria-label": $ ? s("Action.ShowArchived") : s("Label.Archived")
                        }),
                        label: $ ? s("Action.ShowArchived") : s("Label.Archived")
                    }), ei && (0, i.jsx)(nq.FormControlLabel, {
                        control: (0, i.jsx)(nW.Switch, {
                            checked: ea,
                            onChange: ed,
                            "aria-label": el
                        }),
                        label: el
                    }), $ && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nF.Divider, {
                            orientation: "vertical",
                            flexItem: !0,
                            classes: {
                                root: v
                            }
                        }), (0, i.jsx)(ny.IconButton, {
                            "aria-label": s("Label.Settings"),
                            size: "medium",
                            color: "secondary",
                            onClick: e => L(e.currentTarget),
                            children: (0, i.jsx)(nK.SettingsIcon, {})
                        }), (0, i.jsxs)(nG.Menu, {
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
                            children: [eg && (0, i.jsx)(n_.MenuItem, {
                                onClick: () => {
                                    L(null), ep()
                                },
                                children: (0, i.jsx)(nY.Typography, {
                                    variant: "body1",
                                    children: s("Action.TimedOptions")
                                })
                            }), (0, i.jsx)(n_.MenuItem, {
                                onClick: () => {
                                    L(null), S(e => e + 1), C(!0)
                                },
                                children: (0, i.jsx)(nY.Typography, {
                                    variant: "body1",
                                    children: s("Action.StudioPublishSettings")
                                })
                            })]
                        })]
                    }), eI && (0, i.jsx)(nq.FormControlLabel, {
                        control: (0, i.jsx)(nW.Switch, {
                            "aria-label": s("Label.OnCreatorStore"),
                            checked: H,
                            onChange: () => K(e => !e)
                        }),
                        label: s("Label.OnCreatorStore")
                    })]
                }), eo && (0, i.jsxs)(nJ.Flex, {
                    flexDirection: "row",
                    classes: {
                        root: p
                    },
                    alignItems: "center",
                    flexWrap: "nowrap",
                    children: [(0, i.jsx)(nH.Select, {
                        variant: "outlined",
                        margin: "dense",
                        size: "small",
                        label: s("Label.SortBy"),
                        value: ex,
                        onChange: ec,
                        inputProps: {
                            "aria-label": s("Label.SortBy")
                        },
                        children: ef.map(e => (0, i.jsx)(n_.MenuItem, {
                            value: e.value,
                            children: s(e.labelKey)
                        }, e.value))
                    }), (0, i.jsx)(ny.IconButton, {
                        "aria-label": s("Heading.SortOrder"),
                        onClick: em,
                        size: "large",
                        children: D === E.SortOrder.Asc ? (0, i.jsx)(nz.ArrowUpwardIcon, {
                            color: "secondary"
                        }) : (0, i.jsx)(nB.ArrowDownwardIcon, {
                            color: "secondary"
                        })
                    })]
                }), (0, i.jsx)(iE, {
                    open: x,
                    onClose: () => b(!1)
                }), (0, i.jsx)(ih, {
                    open: T || et,
                    onClose: en
                }, w)]
            })
        },
        iN = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                verificationMetadata: a,
                group: s
            } = e, o = [m.Asset.UpcomingEvent, m.Asset.PastEvent, m.Asset.DraftEvent], r = !!t.submenuItem && o.includes(t.submenuItem.type);
            return (0, i.jsxs)("div", {
                className: "flex justify-between padding-top-small",
                children: [t.menuItem.type === m.Asset.TShirt && (0, i.jsx)(ng, {
                    data: a
                }), !r && (0, i.jsx)("div", {
                    className: "flex width-full padding-bottom-large [align-content:flex-start] [row-gap:12px] justify-between flex-row items-start wrap",
                    children: t.menuItem.type === m.Asset.Moments ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nf, {}), (0, i.jsx)(np, {})]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [t.submenuItem && (0, i.jsx)(nO, {
                            menuState: t,
                            onMenuStateChange: n,
                            group: s
                        }), (0, i.jsx)(iR, {
                            menuState: t
                        })]
                    })
                })]
            })
        };
    var iD = e.i(675454),
        iO = e.i(71375),
        iU = e.i(83560),
        iB = e.i(576069),
        iz = e.i(134817);
    let iV = [];

    function iF(e) {
        return null != e.universeId ? e.universeId : "experienceId" in e && "number" == typeof e.experienceId ? e.experienceId : void 0
    }
    var iq = e.i(897350),
        iG = e.i(533030);
    let i_ = (e, t) => {
            let {
                user: n
            } = (0, j.useAuthentication)(), {
                enabled: i,
                thumbnailUrl: a,
                videoUrl: s
            } = t, o = null == n ? void 0 : n.id, r = (0, l.useMemo)(() => a || s ? {
                thumbnailUrl: null != a ? a : "",
                videoUrl: null != s ? s : ""
            } : null, [a, s]), [d, u] = (0, l.useState)(null);
            return ((0, l.useEffect)(() => {
                if (r || null == o || !i || null == e || "" === e) return;
                let t = !1;
                return (async () => {
                    let n = {
                        draftId: e,
                        userId: o
                    };
                    tw(tf.LoadLocalVideoMedia, n);
                    try {
                        let i = await eI(o, e);
                        t || (u(i), null != i && tS(tf.LoadLocalVideoMedia, n))
                    } catch (n) {
                        tI(tf.LoadLocalVideoMedia, n, {
                            draftId: e
                        }), t || u(null)
                    }
                })(), () => {
                    t = !0
                }
            }, [e, i, r, o]), r) ? r : i ? d : null
        },
        iH = "block width-full height-full max-w-full max-h-full object-contain",
        iK = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)("div", {
                className: "flex items-center justify-center radius-medium bg-surface-200 width-full shrink-0 overflow-hidden h-[240px]",
                "data-testid": "moments-video-preview-container",
                children: t
            })
        },
        iW = e => {
            let {
                thumbnailUrl: t,
                videoUrl: n
            } = e;
            return n ? (0, i.jsx)(iK, {
                children: (0, i.jsx)("video", {
                    "aria-label": "Moment video preview",
                    className: "radius-medium ".concat(iH),
                    controls: !0,
                    playsInline: !0,
                    poster: t,
                    src: n,
                    children: (0, i.jsx)("track", {
                        kind: "captions"
                    })
                })
            }) : t ? (0, i.jsx)(iK, {
                children: (0, i.jsx)("img", {
                    alt: "Moment thumbnail preview",
                    className: "radius-medium ".concat(iH),
                    src: t
                })
            }) : (0, i.jsx)(iK, {})
        },
        iY = (0, a.withTranslation)(e => {
            var t, n, s;
            let {
                moment: o,
                open: r,
                onOpenChange: d,
                onMomentMetadataChange: u,
                onPublish: c,
                onDelete: m,
                publishingDraftId: p = null,
                deletingMomentKey: h = null,
                isPublishDisabled: v = !1
            } = e, {
                translate: f
            } = (0, a.useTranslation)(), {
                locale: x
            } = (0, a.useLocalization)(), g = tG(), b = tE(x), [y, I] = (0, l.useState)(() => {
                var e, t, n, i;
                let a;
                return o && ((a = {
                    id: null != (i = iF(n = o)) ? i : 0,
                    name: n.experienceName
                }).id > 0 || (null != (e = null == (t = a.name) ? void 0 : t.length) ? e : 0) > 0) ? a : void 0
            }), [T, C] = (0, l.useState)(() => {
                var e;
                return null != (e = null == o ? void 0 : o.description) ? e : ""
            }), [w, S] = (0, l.useState)(), A = null != (t = null != w ? w : null == o ? void 0 : o.locale) ? t : b, M = (null == o ? void 0 : o.status) === es && !0 === o.hasLocalVideo, j = i_((null == o ? void 0 : o.status) === es ? o.draftId : null, {
                enabled: r && M,
                thumbnailUrl: null == o ? void 0 : o.thumbnailUrl,
                videoUrl: null == o ? void 0 : o.videoUrl
            }), E = (0, l.useCallback)(() => {
                o && !v && null == p && (null == c || c(o))
            }, [v, o, c, p]), P = (0, l.useCallback)(() => {
                o && h !== t_(o) && (null == m || m(o))
            }, [h, o, m]), k = (0, l.useCallback)(e => {
                o && e.id && e.name && (I(e), null == u || u(o, {
                    experienceId: e.id,
                    rootPlaceId: e.rootPlaceId,
                    experienceName: e.name
                }))
            }, [o, u]), L = (0, l.useCallback)(e => {
                C(e.target.value)
            }, []), R = (0, l.useCallback)(e => {
                S(e), o && e !== o.locale && (null == u || u(o, {
                    locale: e
                }))
            }, [o, u]), N = (0, l.useCallback)(() => {
                o && T !== o.description && (null == u || u(o, {
                    description: T
                }))
            }, [T, o, u]), D = (0, l.useCallback)(() => {
                N()
            }, [N]), O = (0, l.useCallback)(e => {
                e || N(), d(e)
            }, [N, d]);
            if (!o) return null;
            let U = t_(o),
                B = null != p && p === U,
                z = null != p,
                V = null != h && h === U,
                F = o.status === ei,
                q = o.status === es,
                G = q && !B,
                _ = !F && null != c && (q && M || B),
                H = null != m,
                K = T.length >= 140;
            return (0, i.jsx)(iq.SheetRoot, {
                open: r,
                onOpenChange: O,
                children: (0, i.jsxs)(iq.SheetContent, {
                    closeLabel: f("Action.Close"),
                    largeScreenVariant: "side",
                    children: [(0, i.jsx)(iq.SheetTitle, {
                        children: f("Heading.EditMoment")
                    }), (0, i.jsxs)(iq.SheetBody, {
                        className: "flex flex-col gap-y-medium padding-top-small padding-bottom-large",
                        children: [(0, i.jsx)(iW, {
                            thumbnailUrl: null != (n = null == j ? void 0 : j.thumbnailUrl) ? n : o.thumbnailUrl,
                            videoUrl: null != (s = null == j ? void 0 : j.videoUrl) ? s : o.videoUrl
                        }), G ? (0, i.jsx)(i.Fragment, {
                            children: y ? (0, i.jsx)(tJ, {
                                experience: y,
                                onChangeExperience: () => I(void 0)
                            }) : (0, i.jsx)(t3, {
                                onExperienceResolved: k
                            })
                        }) : y ? (0, i.jsxs)("div", {
                            className: "flex flex-col gap-y-xsmall width-full margin-top-small",
                            children: [(0, i.jsx)("span", {
                                className: "text-body-small content-muted",
                                children: f("CreateMomentModal.ExperienceInput.Label")
                            }), (0, i.jsx)(tJ, {
                                experience: y,
                                hideTitle: !0
                            })]
                        }) : null, g ? (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: G ? (0, i.jsx)(t6, {
                                value: A,
                                onChange: R,
                                isDisabled: B
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: f("CreateMomentModal.LanguageInput.Label")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-content-language-readonly",
                                    children: tP(o.locale)
                                })]
                            })
                        }) : null, (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: G ? (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)(iG.TextArea, {
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
                    }), (0, i.jsx)(iq.SheetActions, {
                        className: "width-full",
                        children: (0, i.jsxs)("div", {
                            className: "flex gap-small width-full",
                            children: [_ ? (0, i.jsx)(J.Button, {
                                variant: "Emphasis",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: v || z,
                                isLoading: B,
                                onClick: E,
                                children: f("Action.Publish")
                            }) : null, H ? (0, i.jsx)(J.Button, {
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
        }, [q.TranslationNamespace.Creations, q.TranslationNamespace.Controls]);
    var iQ = e.i(696490),
        iJ = e.i(493924);
    let iX = e => {
        let {
            onCreateClick: t
        } = e, {
            translate: n
        } = (0, a.useTranslation)();
        return (0, i.jsx)(iJ.default, {
            title: n("Heading.ReachPlayersDirectlyInMoments"),
            size: "large",
            illustration: "videos",
            description: (0, i.jsxs)(i.Fragment, {
                children: [n("Description.UploadExternalVideosToMoments"), " ", (0, i.jsx)(iQ.Link, {
                    "aria-label": n("Label.LearnMore"),
                    href: nx.MOMENTS_LEARN_MORE_URL,
                    target: "_blank",
                    rel: "noopener noreferrer",
                    variant: "Inline",
                    underline: "always",
                    isExternal: !1,
                    children: n("Label.LearnMore")
                })]
            }),
            children: (0, i.jsx)(J.Button, {
                variant: "Emphasis",
                size: "Large",
                type: "button",
                onClick: t,
                children: n("Action.CreateMoments")
            })
        })
    };
    var iZ = e.i(197649),
        i$ = e.i(708064),
        i0 = e.i(390398),
        i1 = e.i(516674),
        i2 = e.i(125677),
        i4 = e.i(20227),
        i5 = e.i(494601);
    let i3 = {
            [ei]: "bg-system-success",
            [ea]: "bg-system-warning",
            [es]: "bg-surface-300",
            [eo]: "bg-system-alert"
        },
        i7 = e => {
            let {
                status: t,
                label: n
            } = e;
            return (0, i.jsxs)("span", {
                className: "inline-flex items-center gap-xsmall",
                children: [(0, i.jsx)("span", {
                    "aria-hidden": !0,
                    className: "size-[8px] radius-circle shrink-0 ".concat(i3[t]),
                    "data-testid": "moment-status-dot-".concat(t)
                }), (0, i.jsx)("span", {
                    children: n
                })]
            })
        };
    var i8 = e.i(252082),
        i9 = e.i(540513),
        i6 = e.i(914040);
    let ae = (0, a.withTranslation)(e => {
            let t, {
                    moment: n
                } = e,
                {
                    translate: s
                } = (0, a.useTranslation)(),
                o = n.status === es,
                r = o && !0 === n.hasLocalVideo,
                d = i_(o ? n.draftId : null, {
                    enabled: r,
                    thumbnailUrl: n.thumbnailUrl,
                    videoUrl: n.videoUrl
                }),
                {
                    assetId: u
                } = n,
                [c, m] = (0, l.useState)(!1),
                p = s("Label.MomentVideoPreview"),
                h = !!(null == d ? void 0 : d.videoUrl) || null != u,
                v = (0, l.useCallback)(() => {
                    h && m(!0)
                }, [h]),
                f = (0, l.useCallback)(() => {
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
                children: (0, i.jsx)(i9.Thumbnail2d, {
                    alt: "",
                    containerClass: "block",
                    imgClassName: "[object-fit:cover]",
                    returnPolicy: i9.ReturnPolicy.PlaceHolder,
                    targetId: u,
                    type: i9.ThumbnailTypes.assetThumbnail
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
                children: (0, i.jsx)(i6.RobloxVideoPlayer, {
                    videoAssetId: String(u),
                    environment: "production",
                    src: void 0,
                    autoPlay: !0,
                    disableControls: !0,
                    loop: !0,
                    muted: !0
                })
            })), h) ? (0, i.jsxs)(i8.Popover, {
                open: c,
                onOpenChange: m,
                children: [(0, i.jsx)(i8.PopoverAnchor, {
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
                }), (0, i.jsx)(i8.PopoverContent, {
                    align: "start",
                    ariaLabel: p,
                    className: "outline-none",
                    side: "bottom",
                    children: x
                })]
            }) : t
        }, [q.TranslationNamespace.Creations]),
        at = [10, 25, 50],
        an = {
            [ei]: "MomentsTable.NoActiveMoments",
            [es]: "MomentsTable.NoDraftMoments"
        },
        ai = e => {
            let {
                moment: t,
                disabled: n,
                onBlur: s
            } = e, {
                translate: o
            } = (0, a.useTranslation)(), r = t_(t), [d, u] = (0, l.useState)(t.description), c = d.length >= 140, m = (0, l.useCallback)(e => {
                u(e.target.value)
            }, []), p = (0, l.useCallback)(e => {
                s(t, e)
            }, [t, s]);
            return (0, i.jsxs)("div", {
                className: "flex flex-col gap-y-xsmall width-full",
                children: [(0, i.jsx)(tX.TextInput, {
                    id: "moment-description-".concat(r),
                    label: o("MomentsTable.Header.Description"),
                    value: d,
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
                    children: "".concat(d.length, "/").concat(140)
                })]
            })
        },
        aa = e => {
            let {
                moment: t,
                editLabel: n,
                publishingDraftId: s,
                isPublishDisabled: o,
                showContentLanguageColumn: r,
                statusLabel: d,
                onEditMoment: u,
                onDescriptionBlur: c,
                onPublishMoment: m
            } = e, {
                translate: p
            } = (0, a.useTranslation)(), h = t_(t), v = t.status === es, f = (0, l.useCallback)(() => {
                u(t)
            }, [t, u]), x = (0, l.useCallback)(() => {
                t.status === es && (null == m || m(t.draftId))
            }, [t, m]);
            return (0, i.jsxs)(i0.TableRow, {
                isHoverable: !0,
                "data-testid": "moment-row-".concat(h),
                children: [(0, i.jsx)(i0.TableCell, {
                    children: (0, i.jsx)(ae, {
                        moment: t
                    })
                }), (0, i.jsx)(i0.TableCell, {
                    children: t.experienceName
                }), (0, i.jsx)(i0.TableCell, {
                    children: t.status === ei ? (0, i.jsx)("span", {
                        "data-testid": "moment-description-".concat(h),
                        children: t.description || "-"
                    }) : (0, i.jsx)(ai, {
                        moment: t,
                        disabled: null != s && s === h,
                        onBlur: c
                    }, "moment-description-".concat(h, "-").concat(t.modifiedAt))
                }), r ? (0, i.jsx)(i0.TableCell, {
                    children: (0, i.jsx)("span", {
                        "data-testid": "moment-content-language-".concat(h),
                        children: tP(t.locale)
                    })
                }) : null, (0, i.jsx)(i0.TableCell, {
                    children: (0, i.jsx)(i7, {
                        label: d,
                        status: t.status
                    })
                }), (0, i.jsx)(i0.TableCell, {
                    align: "end",
                    children: (0, i.jsxs)("div", {
                        className: "inline-flex items-center gap-xsmall",
                        children: [(0, i.jsx)(i1.Tooltip, {
                            position: "top-center",
                            title: n,
                            children: (0, i.jsx)(i1.TooltipTrigger, {
                                asChild: !0,
                                children: (0, i.jsx)(i$.IconButton, {
                                    ariaLabel: n,
                                    icon: "icon-regular-pencil",
                                    size: "Small",
                                    type: "button",
                                    variant: "Utility",
                                    onClick: f
                                })
                            })
                        }), v && !0 === t.hasLocalVideo && m ? (0, i.jsx)(J.Button, {
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
        as = (0, a.withTranslation)(e => {
            let {
                moments: t,
                onEditMoment: n,
                onMomentMetadataChange: s,
                onPublishMoment: o,
                publishingDraftId: r = null,
                isPublishDisabled: d = !1,
                hasNextPage: u = !1,
                fetchNextPage: c,
                serverPageSize: m = 25
            } = e, {
                translate: p
            } = (0, a.useTranslation)(), {
                classes: {
                    gridContainer: h,
                    createButtonContainer: v
                }
            } = (0, i5.default)(), {
                statusTab: f
            } = tW(), x = tG(), g = (0, l.useCallback)(e => {
                switch (e) {
                    case ei:
                        return p("MomentsTable.Pills.Active");
                    case ea:
                        return p("MomentsTable.Pills.Pending");
                    case es:
                        return p("MomentsTable.Pills.Draft");
                    case eo:
                        return p("MomentsTable.Pills.Moderated");
                    default:
                        return e
                }
            }, [p]), b = f === ei, y = (0, l.useMemo)(() => f === es ? t.filter(e => e.status === es || e.status === ea) : t.filter(e => e.status === f), [t, f]), {
                page: I,
                rowsPerPage: T,
                onPageChange: C,
                onRowsPerPageChange: w
            } = (0, i4.useTablePagination)({
                count: y.length,
                initialRowsPerPage: 10,
                resetKey: f
            }), {
                currentPage: S
            } = (0, i2.useCurrentPage)(y, {
                page: I,
                rowsPerPage: T,
                hasNextPage: !!b && u,
                fetchNextPage: b ? c : void 0,
                fetchLimit: m
            }), A = (0, l.useCallback)((e, t) => {
                let n = t.target.value;
                n !== e.description && s(e, {
                    description: n
                })
            }, [s]), M = (0, l.useCallback)(e => {
                C(void 0, e)
            }, [C]), j = p("Action.Edit");
            return (0, i.jsx)("div", {
                className: h,
                children: (0, i.jsx)("div", {
                    className: (0, iZ.clsx)(v, "flex flex-col gap-xlarge width-full self-stretch"),
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col gap-y-medium width-full",
                        children: [(0, i.jsxs)(i0.Table, {
                            className: "width-full",
                            variant: "Framed",
                            children: [(0, i.jsx)(i0.TableHeader, {
                                children: (0, i.jsxs)(i0.TableRow, {
                                    children: [(0, i.jsx)(i0.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Moments")
                                    }), (0, i.jsx)(i0.TableHeaderCell, {
                                        children: p("MomentsTable.Header.ExperienceName")
                                    }), (0, i.jsx)(i0.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Description")
                                    }), x ? (0, i.jsx)(i0.TableHeaderCell, {
                                        children: p("CreateMomentModal.LanguageInput.Label")
                                    }) : null, (0, i.jsx)(i0.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Status")
                                    }), (0, i.jsx)(i0.TableHeaderCell, {
                                        align: "end",
                                        children: " "
                                    })]
                                })
                            }), (0, i.jsx)(i0.TableBody, {
                                children: 0 === y.length ? (0, i.jsx)(i0.TableRow, {
                                    children: (0, i.jsx)(i0.TableCell, {
                                        colSpan: x ? 6 : 5,
                                        align: "center",
                                        className: "padding-y-xxlarge",
                                        children: (0, i.jsx)("span", {
                                            className: "text-body-medium content-muted block padding-y-xxlarge",
                                            "data-testid": "moments-table-empty-filter-message",
                                            children: p(an[f])
                                        })
                                    })
                                }) : S.map(e => (0, i.jsx)(aa, {
                                    moment: e,
                                    editLabel: j,
                                    publishingDraftId: r,
                                    isPublishDisabled: d,
                                    showContentLanguageColumn: x,
                                    statusLabel: g(e.status),
                                    onEditMoment: n,
                                    onDescriptionBlur: A,
                                    onPublishMoment: o
                                }, t_(e)))
                            })]
                        }), y.length > 0 ? (0, i.jsx)(i0.TablePagination, {
                            page: I,
                            rowsPerPage: T,
                            totalRows: y.length,
                            rowsPerPageOptions: at,
                            onPageChange: M,
                            onRowsPerPageChange: w
                        }) : null]
                    })
                })
            })
        }, [q.TranslationNamespace.Creations, q.TranslationNamespace.Controls]),
        ao = (0, a.withTranslation)(e => {
            let {
                onRetry: t
            } = e, {
                translate: n
            } = (0, a.useTranslation)();
            return (0, i.jsx)(Z.FeedbackBanner, {
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
        }, [q.TranslationNamespace.Error]);
    var ar = e.i(917852);
    let al = () => {
            window.open(ar.idVerificationActionUrl, "_blank", "noopener,noreferrer")
        },
        ad = (0, a.withTranslation)(() => {
            let {
                translate: e
            } = (0, a.useTranslation)();
            return (0, i.jsx)(Z.FeedbackBanner, {
                className: "width-full",
                layout: "Inline",
                variant: "Emphasis",
                severity: "Warning",
                title: e("Heading.MomentsIdVerificationRequired"),
                description: e("Message.MomentsIdVerificationRequired"),
                primaryActionLabel: e("Label.VerifyId"),
                onPrimaryAction: al,
                "data-testid": "moments-id-verification-banner"
            })
        }, [q.TranslationNamespace.Creations]),
        au = () => {
            var e;
            (() => {
                let {
                    user: e
                } = (0, j.useAuthentication)(), t = null == e ? void 0 : e.id;
                (0, l.useEffect)(() => () => {
                    void 0 !== t && (() => {
                        for (let e of ec.keys()) {
                            let t = ec.get(e);
                            t && (URL.revokeObjectURL(t.thumbnailUrl), URL.revokeObjectURL(t.videoUrl), ec.delete(e))
                        }
                    })()
                }, [t])
            })();
            let {
                translate: t
            } = (0, a.useTranslation)(), {
                user: n
            } = (0, j.useAuthentication)(), s = null == n ? void 0 : n.id, {
                data: o,
                isLoading: r,
                isError: d,
                refetch: u
            } = (0, iB.useCreatorEligibility)(), c = null != (e = null == o ? void 0 : o.creatorEligibility.includes(iD.CreatorEligibilityEnum.IdVerified)) && e, m = r || d || !c, p = !r && !d && !c, h = (0, l.useCallback)(() => {
                u()
            }, [u]), [v, f] = (0, l.useState)(!1), [x, g] = (0, l.useState)(null), [b, y] = (0, l.useState)({}), {
                moments: I,
                updateMoment: T,
                removeMoment: C
            } = eL(), {
                publishMoment: w,
                publishingDraftId: S,
                isPublishing: A
            } = function() {
                var e;
                let {
                    translate: t
                } = (0, a.useTranslation)(), {
                    locale: n
                } = (0, a.useLocalization)(), i = tG(), {
                    user: s
                } = (0, j.useAuthentication)(), o = null == s ? void 0 : s.id, {
                    mutateAsync: r,
                    isPending: d,
                    variables: u
                } = (0, eO.useMutation)({
                    mutationFn: async e => {
                        let {
                            moment: a
                        } = e;
                        if (null == o) throw Error("Authenticated user is required to publish a moment");
                        let s = await ey(o, a.draftId);
                        if (!s) throw Error("Local moment video is required before publishing");
                        return await tF({
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
                    publishMoment: (0, l.useCallback)(e => r({
                        moment: e
                    }), [r]),
                    publishingDraftId: d && null != (e = null == u ? void 0 : u.moment.draftId) ? e : null,
                    isPublishing: d
                }
            }(), M = (0, l.useRef)(!1), {
                deleteMoment: E,
                deletingMomentKey: P
            } = function() {
                let {
                    user: e
                } = (0, j.useAuthentication)(), t = (0, eR.useQueryClient)(), n = null == e ? void 0 : e.id, i = tq(), {
                    mutateAsync: a,
                    isPending: s,
                    variables: o
                } = (0, eO.useMutation)({
                    mutationFn: e => {
                        let {
                            moment: t
                        } = e;
                        return tz({
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
                            e.setQueryData(tK(t, i), e => (null == e ? void 0 : e.pages.length) ? {
                                ...e,
                                pages: e.pages.map(e => ({
                                    ...e,
                                    moments: e.moments.filter(e => t_(e) !== n)
                                }))
                            } : e)
                        }(t, n, t_(s), i)
                    }
                });
                return {
                    deleteMoment: (0, l.useCallback)(e => a({
                        moment: e
                    }), [a]),
                    deletingMomentKey: s && null != o ? t_(o.moment) : null,
                    isDeleting: s
                }
            }(), {
                statusTab: k
            } = tW(), {
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
                        isPending: a,
                        refetch: s,
                        fetchNextPage: o,
                        hasNextPage: r,
                        isFetchingNextPage: d,
                        isFetchNextPageError: u,
                        errorUpdatedAt: c
                    } = function() {
                        let {
                            user: e
                        } = (0, j.useAuthentication)(), t = null == e ? void 0 : e.id, n = tq();
                        return (0, eD.useInfiniteQuery)({
                            queryKey: tK(t, n),
                            queryFn: null != t ? e => {
                                let {
                                    pageParam: i
                                } = e;
                                return tU(t, i, n)
                            } : eN.skipToken,
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
                    m = (0, l.useMemo)(() => n ? function(e) {
                        let t = new Map;
                        for (let n of e)
                            for (let e of n.moments) t.set(t_(e), e);
                        return [...t.values()]
                    }(n.pages) : iV, [n]),
                    p = null != (e = null == n ? void 0 : n.pages.length) ? e : 0,
                    h = (0, l.useCallback)(() => {
                        o({
                            cancelRefetch: !1,
                            throwOnError: !1
                        })
                    }, [o]),
                    v = r && !u;
                (0, iz.useBackgroundPageLoader)({
                    hasNextPage: v,
                    fetchNextPage: h,
                    disabled: a
                });
                let f = !v && !a && !d;
                return (0, l.useMemo)(() => ({
                    serverMoments: m,
                    isAllServerMomentsLoaded: f,
                    hasNextPage: v,
                    fetchNextPage: h,
                    error: i,
                    isPending: a,
                    isFetchingNextPage: d,
                    isFetchNextPageError: u,
                    errorUpdatedAt: c,
                    loadedPageCount: p,
                    refetch: s,
                    serverPageSize: t
                }), [v, i, h, f, u, d, a, c, p, s, m, t])
            }(), _ = (0, l.useMemo)(() => [...L, ...I].map(e => {
                let t = b[t_(e)];
                return t ? {
                    ...e,
                    ...t
                } : e
            }), [I, b, L]), H = (0, l.useMemo)(() => _.filter(e => e.status !== eo), [_]), K = H.length > 0, W = (0, l.useRef)(0);
            (0, l.useEffect)(() => {
                !O || U || z || V <= W.current || (W.current = V, tI(tf.ListMoments, O, {
                    userId: s,
                    pageCount: F
                }))
            }, [O, V, z, U, F, s]);
            let Y = (0, l.useRef)(!1);
            (0, l.useEffect)(() => {
                if (!z || B) {
                    Y.current = !1;
                    return
                }
                O && !Y.current && (Y.current = !0, tI(tf.FetchNextPage, O, {
                    userId: s,
                    pageCount: F
                }))
            }, [O, z, B, F, s]);
            let Q = (0, l.useMemo)(() => {
                    var e;
                    if (!x) return null;
                    let t = t_(x);
                    return null != (e = _.find(e => t_(e) === t)) ? e : x
                }, [x, _]),
                J = (0, l.useCallback)(e => {
                    g(e), f(!0)
                }, []),
                X = (0, l.useCallback)(e => {
                    f(e), e || g(null)
                }, []),
                Z = (0, l.useCallback)(() => {
                    q()
                }, [q]),
                $ = (0, l.useCallback)(() => {
                    (0, iU.toast)({
                        title: t("Message.MomentPublishedError")
                    })
                }, [t]),
                ee = (0, l.useCallback)(() => {
                    (0, iU.toast)({
                        title: t("Message.MomentDeletedError")
                    })
                }, [t]),
                et = (0, l.useCallback)(() => {
                    (0, iU.toast)({
                        title: t("Message.MomentUploadStarted"),
                        icon: "icon-filled-circle-check"
                    })
                }, [t]),
                en = (0, l.useCallback)(async e => {
                    let t = e.status === es,
                        n = t_(e),
                        i = {
                            ...t ? {
                                draftId: e.draftId
                            } : {
                                momentId: e.momentId,
                                feedItemId: e.feedItemId
                            },
                            experienceId: iF(e),
                            isLocalMoment: t,
                            userId: s
                        };
                    tw(tf.DeleteMoment, i);
                    try {
                        e.status === es ? C(e.draftId) : await E(e), y(e => {
                            if (!(n in e)) return e;
                            let {
                                [n]: t, ...i
                            } = e;
                            return i
                        }), f(!1), g(null), tS(tf.DeleteMoment, i)
                    } catch (e) {
                        tI(tf.DeleteMoment, e, i), ee()
                    }
                }, [E, C, ee, s]),
                ei = (0, l.useCallback)((e, t) => {
                    if (e.status === es) return void T(e.draftId, t);
                    let n = t_(e),
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
                ea = (0, l.useCallback)(async e => {
                    if (M.current || A || m) return;
                    let t = I.find(t => t.draftId === e);
                    if (!t) return;
                    M.current = !0;
                    let n = {
                        draftId: e,
                        experienceId: iF(t),
                        isLocalMoment: !0,
                        userId: s
                    };
                    tw(tf.PublishMoment, n);
                    try {
                        await w(t), C(e), f(!1), g(null), tS(tf.PublishMoment, n), et()
                    } catch (e) {
                        tI(tf.PublishMoment, e, n), $()
                    } finally {
                        M.current = !1
                    }
                }, [m, A, I, w, C, $, et, s]),
                er = (0, l.useCallback)(e => {
                    e.status === es && ea(e.draftId)
                }, [ea]);
            return O && k !== es && !K ? (0, i.jsx)(iO.default, {
                onReload: Z
            }) : (!U || K) && (R || K) ? (0, i.jsxs)("div", {
                className: "flex grow-1 flex-col gap-medium self-stretch width-full",
                children: [d ? (0, i.jsx)(ao, {
                    onRetry: h
                }) : null, p ? (0, i.jsx)(ad, {}) : null, K ? (0, i.jsx)(as, {
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
                    children: (0, i.jsx)(iX, {
                        onCreateClick: nc
                    })
                }), (0, i.jsx)(iY, {
                    moment: Q,
                    open: v,
                    onOpenChange: X,
                    onMomentMetadataChange: ei,
                    onDelete: Q ? en : void 0,
                    onPublish: (null == Q ? void 0 : Q.status) === es ? er : void 0,
                    publishingDraftId: S,
                    deletingMomentKey: P,
                    isPublishDisabled: m
                }, Q ? t_(Q) : void 0)]
            }) : (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(ne.ProgressCircle, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            })
        },
        ac = {
            width: "100%",
            height: "100%"
        },
        am = (0, nC.makeStyles)()(e => ({
            section: {
                ...ac
            },
            container: {
                ...ac
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
        ap = (0, D.default)(() => e.A(202045), {
            loadableGenerated: {
                modules: [623728]
            },
            ssr: !1
        }),
        ah = (0, D.default)(() => e.A(378869), {
            loadableGenerated: {
                modules: [518808]
            },
            ssr: !1
        }),
        av = (0, D.default)(() => e.A(580854), {
            loadableGenerated: {
                modules: [427685]
            },
            ssr: !1
        }),
        af = (0, D.default)(() => e.A(307640), {
            loadableGenerated: {
                modules: [48220]
            },
            ssr: !1
        }),
        ax = (0, D.default)(() => e.A(114198), {
            loadableGenerated: {
                modules: [595604]
            },
            ssr: !1
        }),
        ag = (0, D.default)(() => e.A(558217), {
            loadableGenerated: {
                modules: [333771]
            },
            ssr: !1
        }),
        ab = (0, D.default)(() => e.A(546234), {
            loadableGenerated: {
                modules: [82873]
            },
            ssr: !1
        }),
        ay = (0, D.default)(() => e.A(85397), {
            loadableGenerated: {
                modules: [973472]
            },
            ssr: !1
        }),
        aI = (0, D.default)(() => e.A(890748), {
            loadableGenerated: {
                modules: [835459]
            },
            ssr: !1
        }),
        aT = (0, D.default)(() => e.A(68996), {
            loadableGenerated: {
                modules: [565869]
            },
            ssr: !1
        }),
        aC = (0, D.default)(() => e.A(441969), {
            loadableGenerated: {
                modules: [415945]
            },
            ssr: !1
        }),
        aw = (0, D.default)(() => e.A(481709), {
            loadableGenerated: {
                modules: [947274]
            },
            ssr: !1
        }),
        aS = (0, D.default)(() => e.A(272047), {
            loadableGenerated: {
                modules: [616027]
            },
            ssr: !1
        });

    function aA(e) {
        let t = (0, h.readQueryValue)(e);
        return void 0 === t ? m.Asset.MyExperiences : (0, p.isValidEnumValue)(m.Asset, t) ? t : m.Asset.MyExperiences
    }
    let aM = (0, a.withTranslation)(e => {
            let {
                verificationMetadata: t,
                currentGroup: n,
                currentUser: s,
                allowedAssetTypes: o
            } = e, [r, d] = (0, F.useQueryParams)(["activeTab", "filterIndex"]), {
                resetAllFilters: u
            } = (0, Y.default)(), {
                settings: c
            } = (0, x.useSettings)(), p = C(), h = (0, nA.default)(), v = (0, nS.default)(), f = (0, nR.default)(), {
                translate: T
            } = (0, a.useTranslation)(), w = (0, b.default)(), S = (0, l.useRef)(void 0), A = (0, l.useMemo)(() => [], []), M = (0, g.isTaxonomyActiveTab)(r.activeTab), j = M || (0, g.isRecentsActiveTab)(r.activeTab), E = (0, l.useMemo)(() => {
                let e = (0, g.isAllAssetTypesActiveTab)(r.activeTab) ? m.Asset.AllCatalogAsset : g.TAXONOMY_HOST_ASSET;
                return I.default.getMenuState(j ? e : aA(r.activeTab), A)
            }, [r.activeTab, A, j]);
            (0, l.useEffect)(() => {
                (0, g.isRecentsActiveTab)(r.activeTab) && d({
                    activeTab: M ? (0, g.buildTaxonomyActiveTab)(g.ALL_ASSET_TYPES_L1_KEY) : m.Asset.AllCatalogAsset,
                    filterIndex: 0
                })
            }, [r.activeTab, M, d]);
            let P = (0, l.useMemo)(() => y.default.filter(e => !A.includes(e.type)), [A]),
                {
                    classes: {
                        section: k,
                        container: L
                    }
                } = am(),
                R = (0, l.useCallback)(e => {
                    if (E.menuItem === e.menuItem && E.submenuItem === e.submenuItem) return;
                    if ((0, g.shouldOpenTaxonomyView)({
                            isTaxonomyEnabled: w,
                            isChangingSection: E.menuItem !== e.menuItem,
                            nextAssetType: I.default.getAssetType(e)
                        })) return void d({
                        activeTab: g.AVATAR_ITEMS_ACTIVE_TAB,
                        filterIndex: 0
                    });
                    let t = (0, W.isOnItemTab)(e.menuItem.type) ? 0 : void 0;
                    d({
                        activeTab: I.default.getAssetType(e),
                        filterIndex: t
                    })
                }, [E.menuItem, E.submenuItem, d, w]),
                N = (0, l.useMemo)(() => {
                    let e = aA(r.activeTab);
                    if (void 0 === p && e === m.Asset.Moments || void 0 === h && e === m.Asset.AllCatalogAsset || void 0 === v && e === m.Asset.AvatarLooks || void 0 === f && e === m.Asset.Showcase) return E;
                    let t = I.default.getValidMenuState(P, E, c, n, void 0, void 0, p, h, v, f);
                    if (t !== E) {
                        if (!M) {
                            let e = (0, W.isOnItemTab)(t.menuItem.type) ? 0 : void 0;
                            d({
                                activeTab: I.default.getAssetType(t),
                                filterIndex: e
                            })
                        }
                        return t
                    }
                    return E
                }, [P, E, M, r.activeTab, c, n, p, h, v, f, d]),
                D = (0, l.useMemo)(() => I.default.getAssetType(N), [N]);
            (0, l.useEffect)(() => {
                if (void 0 === S.current) {
                    S.current = D;
                    return
                }
                let e = S.current;
                e !== D && (S.current = D, (0, Q.isDevelopmentItemAsset)(e) && (0, Q.isDevelopmentItemAsset)(D) || u())
            }, [D, u]);
            let q = D === m.Asset.MyExperiences || D === m.Asset.SharedExperiences,
                _ = (0, l.useMemo)(() => null == o ? void 0 : o.has(D), [D, o]),
                J = _ && !(0, g.isAvatarLooksActiveTab)(r.activeTab),
                X = (0, Q.isDevelopmentItemAsset)(D),
                Z = (0, l.useMemo)(() => {
                    var e, t;
                    return X ? (0, i.jsx)(aw, {
                        groupId: null == n ? void 0 : n.id,
                        useTabNavigationSpacing: !1,
                        userId: null == s ? void 0 : s.id
                    }) : D === m.Asset.Decal ? (0, i.jsx)(av, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.Animation ? (0, i.jsx)(ah, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.Audio || D === m.Asset.Video ? (0, i.jsx)(af, {
                        mediaAssetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.Plugin ? (0, i.jsx)(ab, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.Model ? (0, i.jsx)(ag, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.MeshPart ? (0, i.jsx)(ax, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.ShareLink ? (0, i.jsx)(aT, {}) : D === m.Asset.Moments ? (0, i.jsx)(au, {}) : D === m.Asset.AssetPermissionRequests ? (0, i.jsx)(aS, {}) : D === m.Asset.Showcase ? (0, i.jsx)(ay, {
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.AllCatalogAsset || D === m.Asset.AvatarLooks || D === m.Asset.AvatarBackground ? (0, i.jsx)(ap, {
                        assetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : D === m.Asset.Image || D === m.Asset.Mesh ? (0, i.jsx)(aI, {
                        primitiveAssetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : _ ? (0, i.jsx)(ap, {
                        assetType: D,
                        groupId: null == n ? void 0 : n.id
                    }) : (0, i.jsx)(aC, {
                        assetType: D,
                        creatorType: (null == n ? void 0 : n.id) ? O.SearchCreatorType.Group : O.SearchCreatorType.User,
                        creatorTargetId: null != (e = null != (t = null == n ? void 0 : n.id) ? t : null == s ? void 0 : s.id) ? e : 0
                    })
                }, [D, null == n ? void 0 : n.id, null == s ? void 0 : s.id, _, X]);
            return (0, i.jsxs)(G.default, {
                children: [(0, i.jsx)(U.HubMeta, {
                    title: (0, U.buildTitle)(T(N.submenuItem ? N.submenuItem.nameKey : N.menuItem.nameKey)),
                    breadcrumb: (0, U.buildBreadcrumb)(T("Heading.Creations"), T(N.menuItem.nameKey), N.submenuItem ? T(N.submenuItem.nameKey) : void 0)
                }), (0, i.jsx)("section", {
                    className: k,
                    children: (0, i.jsxs)(B.Grid, {
                        container: !0,
                        direction: "column",
                        className: L,
                        children: [(0, i.jsx)(z.AgeVerificationUpsellBanner, {
                            trackingPage: z.AgeVerificationUpsellPage.Creations
                        }), !X && (0, i.jsx)(iN, {
                            menuState: N,
                            onMenuStateChange: R,
                            verificationMetadata: t,
                            group: n
                        }), q && (0, i.jsx)(V.default, {}), J && (0, i.jsx)(K, {}), J && (0, i.jsx)(H, {}), Z]
                    })
                })]
            })
        }, [q.TranslationNamespace.AssetTypes, q.TranslationNamespace.Controls, q.TranslationNamespace.Creations, q.TranslationNamespace.Error, q.TranslationNamespace.Navigation, q.TranslationNamespace.ShareLinksManagement, q.TranslationNamespace.ExperienceReleases, q.TranslationNamespace.Taxonomy]),
        aj = () => {
            let e = (0, f.useCurrentGroup)(),
                {
                    user: t
                } = (0, j.useAuthentication)(),
                n = (0, N.default)(),
                [a, s] = (0, l.useState)(void 0);
            return (0, l.useEffect)(() => {
                (0, y.getAllowedMarketplaceItemTypes)().then(e => {
                    let {
                        assetTypes: t
                    } = e;
                    s(t)
                })
            }, []), (0, i.jsx)(R, {
                children: (0, i.jsx)(aM, {
                    verificationMetadata: n,
                    currentGroup: e,
                    currentUser: t,
                    allowedAssetTypes: a
                })
            })
        };
    var aE = e.i(675330),
        aP = e.i(177608);
    let ak = () => {
            var e;
            let {
                translate: t
            } = (0, a.useTranslation)(), {
                activeItem: n
            } = A();
            return (0, i.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: null != (e = null == n ? void 0 : n.label) ? e : t("Heading.Creations")
            })
        },
        aL = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)(aP.default, {
                title: (0, i.jsx)(ak, {}),
                secondaryRail: (0, i.jsx)(M, {}),
                secondarySize: "small",
                noBreadCrumbs: !0,
                children: (0, i.jsx)(o.default, {
                    children: t
                })
            })
        },
        aR = () => (0, i.jsx)(r.default, {
            children: (0, i.jsx)(aE.default, {
                children: (0, i.jsx)(s.default, {
                    children: (0, i.jsx)(aj, {})
                })
            })
        });
    aR.getPageLayout = e => (0, i.jsx)(aL, {
        children: e
    }), aR.loggerConfig = {
        rosId: "3539"
    }, e.s(["default", 0, aR], 962059)
}, 748348, (e, t, n) => {
    let i = "/dashboard/creations";
    (window.__NEXT_P = window.__NEXT_P || []).push([i, () => e.r(962059)]), t.hot && t.hot.dispose(function() {
        window.__NEXT_P.push([i])
    })
}]);

//# debugId=9e84687a-6f20-9c07-4f4c-3040fe4d8058
//# sourceMappingURL=1sgxa-zbxms-j.js.map