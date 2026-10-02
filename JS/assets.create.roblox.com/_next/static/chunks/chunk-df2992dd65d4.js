;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1178bc04-941d-7556-4cbf-7ef2748a5011")
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
        d = e.i(589624),
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
    var P = e.i(814975),
        E = e.i(252842),
        k = e.i(533414),
        R = e.i(456810);
    let L = {
            sort: R.defaultAssetsSort,
            sortOrder: E.SortOrder.Desc,
            isArchived: !1,
            isPublishOnly: !1,
            isOnMarketplace: !1
        },
        N = e => {
            let {
                children: t
            } = e, {
                user: n
            } = (0, P.useAuthentication)(), [s, o] = (0, k.useLocalStorage)("creationSort.".concat(null == n ? void 0 : n.id), L.sort), r = (0, a.useRef)(s), l = (0, a.useMemo)(() => {
                let e = r.current;
                return Object.keys(s).some(t => s[t] !== e[t]) && (r.current = s), r.current
            }, [s]), [d, u] = (0, k.useLocalStorage)("creationSortOrder.".concat(null == n ? void 0 : n.id), L.sortOrder), [c, m] = (0, a.useState)(L.isArchived), [p, h] = (0, a.useState)(!1), [v, f] = (0, a.useState)(L.isPublishOnly), [x, g] = (0, a.useState)(L.isOnMarketplace), b = (0, a.useCallback)(() => {
                o(L.sort), u(L.sortOrder), m(L.isArchived), h(!1), f(L.isPublishOnly), g(L.isOnMarketplace)
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
            return (0, i.jsx)(R.default.Provider, {
                value: y,
                children: t
            })
        };
    var O = e.i(668091),
        D = e.i(507742),
        U = e.i(9618),
        B = e.i(37819),
        q = e.i(631226),
        z = e.i(345886),
        F = e.i(714039),
        V = e.i(896852),
        G = e.i(780880),
        _ = e.i(881670),
        H = e.i(845592),
        W = e.i(339544),
        K = e.i(475642),
        Y = e.i(211461),
        J = e.i(41466),
        Q = e.i(842051),
        X = e.i(984656),
        Z = e.i(211388);
    let $ = "CreatorHub.MomentsCreations.local",
        ee = e => "".concat($, ".").concat(e),
        et = "".concat($, ".__inactive__"),
        en = "active",
        ei = "pending",
        ea = "draft",
        es = "moderated",
        eo = [en, ea],
        er = e => new Date(e.modifiedAt).getTime(),
        el = "momentMedia",
        ed = async e => {
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
        }, eu = new Map, ec = (e, t) => "".concat(e, ":").concat(t), em = (e, t, n) => new Promise((t, n) => {
            if ("u" < typeof indexedDB) return void n(Error("IndexedDB is unavailable"));
            let i = indexedDB.open("".concat("CreatorHub.MomentsVideoMedia", ".").concat(e), 1);
            i.addEventListener("upgradeneeded", () => {
                let e = i.result;
                e.objectStoreNames.contains(el) || e.createObjectStore(el, {
                    keyPath: "momentId"
                })
            }), i.addEventListener("success", () => t(i.result)), i.addEventListener("error", () => {
                var e;
                return n(null != (e = i.error) ? e : Error("Failed to open IndexedDB"))
            })
        }).then(e => new Promise((i, a) => {
            let s = n(e.transaction(el, t).objectStore(el));
            s.addEventListener("success", () => i(s.result)), s.addEventListener("error", () => {
                var e;
                return a(null != (e = s.error) ? e : Error("IndexedDB request failed"))
            })
        })), ep = e => "object" == typeof e && null !== e && "momentId" in e && "string" == typeof e.momentId && "videoBlob" in e && e.videoBlob instanceof Blob && "thumbnailBlob" in e && e.thumbnailBlob instanceof Blob && "updatedAt" in e && "string" == typeof e.updatedAt, eh = (e, t) => {
            let n = ec(e, t),
                i = eu.get(n);
            i && (URL.revokeObjectURL(i.thumbnailUrl), URL.revokeObjectURL(i.videoUrl), eu.delete(n))
        }, ev = async (e, t, n) => {
            let i = await ed(n),
                a = {
                    momentId: t,
                    videoBlob: n,
                    thumbnailBlob: i,
                    fileName: n.name,
                    updatedAt: new Date().toISOString()
                };
            eh(e, t), await em(e, "readwrite", e => e.put(a))
        }, ef = new Set(["QuotaExceededError", "NS_ERROR_DOM_QUOTA_REACHED"]), ex = e => !!(e instanceof DOMException && ef.has(e.name)) || e instanceof Error && e.message.toLowerCase().includes("quota"), eg = async (e, t, n, i) => {
            let a = [],
                s = async () => {
                    await ev(e, t, n)
                };
            try {
                return await s(), {
                    evictedMediaDraftIds: a
                }
            } catch (e) {
                if (!ex(e)) throw e
            }
            for (let n of [...i.filter(e => e.draftId !== t && !1 !== e.hasLocalVideo)].sort((e, t) => er(e) - er(t))) {
                await eI(e, [n.draftId]), a.includes(n.draftId) || a.push(n.draftId);
                try {
                    return await s(), {
                        evictedMediaDraftIds: a
                    }
                } catch (e) {
                    if (!ex(e)) throw e
                }
            }
            throw Error("Failed to store moment video locally")
        };
    async function eb(e, t) {
        var n, i;
        let a, s = await em(e, "readonly", e => e.get(t));
        if (!ep(s)) return null;
        let {
            videoBlob: o
        } = s;
        return new File([o], (a = null == (i = (n = s).fileName) ? void 0 : i.trim()) ? a : n.videoBlob.type.includes("quicktime") ? "moment.mov" : "moment.mp4", {
            type: o.type || "video/mp4"
        })
    }
    let ey = async (e, t) => {
        let n = ec(e, t),
            i = eu.get(n);
        if (i) return i;
        let a = await em(e, "readonly", e => e.get(t));
        if (!ep(a)) return null;
        let s = {
            thumbnailUrl: URL.createObjectURL(a.thumbnailBlob),
            videoUrl: URL.createObjectURL(a.videoBlob)
        };
        return eu.set(n, s), s
    }, eI = async (e, t) => {
        0 !== t.length && await Promise.all(t.map(async t => {
            eh(e, t), await em(e, "readwrite", e => e.delete(t))
        }))
    }, eT = {
        version: "1",
        moments: []
    }, eC = e => "object" == typeof e && null !== e && !Array.isArray(e), ew = e => eC(e) && "1" === e.version && Array.isArray(e.moments) ? e.moments : [], eS = e => "string" == typeof e ? e : void 0, eA = e => "number" == typeof e && Number.isFinite(e) ? e : void 0, eM = new Set(Object.values(s.Locale)), ej = e => ew(e).map(e => (e => {
        var t, n, i, a, s, o;
        let r;
        if (!eC(e)) return null;
        let l = null != (t = eS(e.draftId)) ? t : eS(e.id);
        return null == l || "" === l || e.status !== ea ? null : {
            draftId: l,
            status: ea,
            experienceId: null != (n = eA(e.experienceId)) ? n : 0,
            rootPlaceId: eA(e.rootPlaceId),
            experienceName: null != (i = eS(e.experienceName)) ? i : "",
            description: null != (a = eS(e.description)) ? a : "",
            modifiedAt: null != (s = eS(e.modifiedAt)) ? s : new Date(0).toISOString(),
            assetId: eA(e.assetId),
            thumbnailUrl: eS(e.thumbnailUrl),
            videoUrl: eS(e.videoUrl),
            universeId: eA(e.universeId),
            locale: "string" == typeof(r = o = e.locale) && eM.has(r) ? o : void 0,
            ..."boolean" == typeof e.hasLocalVideo ? {
                hasLocalVideo: e.hasLocalVideo
            } : {}
        }
    })(e)).filter(e => null != e), eP = e => {
        if (!e) return [];
        try {
            let t = JSON.parse(e);
            return ej(t)
        } catch (e) {
            return []
        }
    }, eE = e => ({
        version: "1",
        moments: e
    }), ek = () => {
        let {
            user: e
        } = (0, P.useAuthentication)(), t = null == e ? void 0 : e.id, n = null != t, i = n ? ee(t) : et, [s, o] = (0, k.useLocalStorage)(i, eT), r = (0, a.useMemo)(() => n ? ej(s) : [], [n, s]);
        (0, a.useEffect)(() => {
            if (!n || null == t) return;
            let e = ew(s).filter(e => eC(e) && e.status !== ea).map(e => {
                var t, n;
                return eC(e) && null != (t = null != (n = eS(e.draftId)) ? n : eS(e.id)) ? t : ""
            }).filter(e => "" !== e);
            0 !== e.length && (o(eE(r)), eI(t, e))
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
                } = (l = eP(window.localStorage.getItem(i)), {
                    moments: [...e.map(e => {
                        var t;
                        return {
                            ...e,
                            status: ea,
                            hasLocalVideo: null == (t = e.hasLocalVideo) || t
                        }
                    }), ...l].sort((e, t) => er(t) - er(e)),
                    evictedMediaDraftIds: []
                }), c = ((e, t) => {
                    if (0 === t.length) return [...e];
                    let n = new Set(t);
                    return e.map(e => n.has(e.draftId) ? {
                        ...e,
                        hasLocalVideo: !1
                    } : e)
                })(d, null != (s = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? s : []), m = [...new Set([...null != (r = null == a ? void 0 : a.storageEvictedMediaDraftIds) ? r : [], ...u])];
                return o(eE(c)), m.length > 0 && eI(t, m), {
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
                return a ? (o(eE(a)), a) : null
            }, [n, r, o, t]),
            c = (0, a.useCallback)(e => {
                if (!n || null == t) return null;
                let i = -1 === r.findIndex(t => t.draftId === e) ? null : r.filter(t => t.draftId !== e);
                return i ? (o(eE(i)), eI(t, [e]), i) : null
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
                return o(eE(i)), eI(t, s), i
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
    var eR = e.i(795621),
        eL = e.i(711367),
        eN = e.i(630986),
        eO = e.i(182012),
        eD = e.i(677753),
        eU = function(e, t) {
            return (eU = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function eB(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        eU(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function eq(e, t, n, i) {
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

    function ez(e, t) {
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

    function eF(e) {
        if (void 0 !== e) return null === e ? null : {
            chunkNum: e.chunkNum,
            eTag: e.eTag
        }
    }

    function eV(e) {
        if (void 0 !== e) return null === e ? null : {
            role: e.role,
            operationId: e.operationId,
            parts: void 0 === e.parts ? void 0 : null === e.parts ? null : e.parts.map(eF)
        }
    }

    function eG(e) {
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

    function e_(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function eH(e) {
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
        if (void 0 !== e) return null === e ? null : {
            text: e.text,
            voiceId: e.voiceId,
            pitch: e.pitch,
            speed: e.speed,
            startTime: e.startTime
        }
    }

    function eK(e) {
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

    function eY(e, t) {
        return null == e ? e : {
            assetId: (0, eD.exists)(e, "assetId") ? e.assetId : void 0,
            startTime: (0, eD.exists)(e, "startTime") ? e.startTime : void 0
        }
    }

    function eJ(e) {
        var t;
        return null == (t = e) ? t : {
            position: (0, eD.exists)(t, "position") ? t.position : void 0,
            rotation: (0, eD.exists)(t, "rotation") ? t.rotation : void 0,
            stickerSize: (0, eD.exists)(t, "stickerSize") ? t.stickerSize : void 0,
            scale: (0, eD.exists)(t, "scale") ? t.scale : void 0,
            stickerURI: (0, eD.exists)(t, "stickerURI") ? t.stickerURI : void 0,
            zIndex: (0, eD.exists)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function eQ(e) {
        if (void 0 !== e) return null === e ? null : {
            position: e.position,
            rotation: e.rotation,
            stickerSize: e.stickerSize,
            scale: e.scale,
            stickerURI: e.stickerURI,
            zIndex: e.zIndex
        }
    }

    function eX(e) {
        var t, n;
        return null == (t = e) ? t : {
            position: (0, eD.exists)(t, "position") ? t.position : void 0,
            rotation: (0, eD.exists)(t, "rotation") ? t.rotation : void 0,
            scale: (0, eD.exists)(t, "scale") ? t.scale : void 0,
            text: (0, eD.exists)(t, "text") ? t.text : void 0,
            textOverlayStyle: (0, eD.exists)(t, "textOverlayStyle") ? null == (n = t.textOverlayStyle) ? n : {
                font: (0, eD.exists)(n, "font") ? n.font : void 0,
                fontColor: (0, eD.exists)(n, "fontColor") ? n.fontColor : void 0,
                fontSize: (0, eD.exists)(n, "fontSize") ? n.fontSize : void 0,
                textXAlignment: (0, eD.exists)(n, "textXAlignment") ? n.textXAlignment : void 0
            } : void 0,
            zIndex: (0, eD.exists)(t, "zIndex") ? t.zIndex : void 0
        }
    }

    function eZ(e) {
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

    function e$(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, eD.exists)(t, "assetId") ? t.assetId : void 0,
            startTime: (0, eD.exists)(t, "startTime") ? t.startTime : void 0,
            assetAccessContext: (0, eD.exists)(t, "assetAccessContext") ? t.assetAccessContext : void 0
        }
    }

    function e0(e) {
        if (void 0 !== e) return null === e ? null : {
            assetId: e.assetId,
            startTime: e.startTime,
            assetAccessContext: e.assetAccessContext
        }
    }

    function e1(e) {
        var t;
        return null == (t = e) ? t : {
            httpVerb: (0, eD.exists)(t, "httpVerb") ? t.httpVerb : void 0,
            url: (0, eD.exists)(t, "url") ? t.url : void 0,
            chunkNum: (0, eD.exists)(t, "chunkNum") ? t.chunkNum : void 0,
            contentStart: (0, eD.exists)(t, "contentStart") ? t.contentStart : void 0,
            contentLength: (0, eD.exists)(t, "contentLength") ? t.contentLength : void 0,
            expirationTimeMs: (0, eD.exists)(t, "expirationTimeMs") ? t.expirationTimeMs : void 0
        }
    }

    function e2(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eD.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eD.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eD.exists)(t, "operationPath") ? t.operationPath : void 0,
            uploadUrls: (0, eD.exists)(t, "uploadUrls") ? null === t.uploadUrls ? null : t.uploadUrls.map(e1) : void 0
        }
    }

    function e4(e, t) {
        var n, i, a;
        return null == e ? e : {
            assetId: (0, eD.exists)(e, "assetId") ? e.assetId : void 0,
            assetAccessContext: (0, eD.exists)(e, "assetAccessContext") ? e.assetAccessContext : void 0,
            assetTotalDuration: (0, eD.exists)(e, "assetTotalDuration") ? e.assetTotalDuration : void 0,
            caption: (0, eD.exists)(e, "caption") ? e.caption : void 0,
            videoContentLanguage: (0, eD.exists)(e, "videoContentLanguage") ? e.videoContentLanguage : void 0,
            partnerUploadType: (0, eD.exists)(e, "partnerUploadType") ? e.partnerUploadType : void 0,
            captureType: (0, eD.exists)(e, "captureType") ? e.captureType : void 0,
            editsType: (0, eD.exists)(e, "editsType") ? e.editsType : void 0,
            videoCaptureEdits: (0, eD.exists)(e, "videoCaptureEdits") ? null == (n = e.videoCaptureEdits) ? n : {
                trim: (0, eD.exists)(n, "trim") ? null == (i = n.trim) ? i : {
                    startTime: (0, eD.exists)(i, "startTime") ? i.startTime : void 0,
                    endTime: (0, eD.exists)(i, "endTime") ? i.endTime : void 0
                } : void 0,
                music: (0, eD.exists)(n, "music") ? eY(n.music) : void 0,
                textOverlays: (0, eD.exists)(n, "textOverlays") ? null === n.textOverlays ? null : n.textOverlays.map(eX) : void 0,
                stickerOverlays: (0, eD.exists)(n, "stickerOverlays") ? null === n.stickerOverlays ? null : n.stickerOverlays.map(eJ) : void 0,
                ttsAudios: (0, eD.exists)(n, "ttsAudios") ? null === n.ttsAudios ? null : n.ttsAudios.map(e$) : void 0
            } : void 0,
            screenshotCaptureEdits: (0, eD.exists)(e, "screenshotCaptureEdits") ? null == (a = e.screenshotCaptureEdits) ? a : {
                music: (0, eD.exists)(a, "music") ? eY(a.music) : void 0,
                textOverlays: (0, eD.exists)(a, "textOverlays") ? null === a.textOverlays ? null : a.textOverlays.map(eX) : void 0,
                ttsAudios: (0, eD.exists)(a, "ttsAudios") ? null === a.ttsAudios ? null : a.ttsAudios.map(e$) : void 0
            } : void 0
        }
    }

    function e5(e, t) {
        var n;
        return null == e ? e : {
            status: (0, eD.exists)(e, "status") ? e.status : void 0,
            result: (0, eD.exists)(e, "result") ? null == (n = e.result) ? n : {
                assetId: (0, eD.exists)(n, "assetId") ? n.assetId : void 0,
                isApproved: (0, eD.exists)(n, "isApproved") ? n.isApproved : void 0,
                operationError: (0, eD.exists)(n, "operationError") ? n.operationError : void 0
            } : void 0
        }
    }

    function e8(e) {
        var t;
        return null == (t = e) ? t : {
            role: (0, eD.exists)(t, "role") ? t.role : void 0,
            operationId: (0, eD.exists)(t, "operationId") ? t.operationId : void 0,
            operationPath: (0, eD.exists)(t, "operationPath") ? t.operationPath : void 0,
            done: (0, eD.exists)(t, "done") ? t.done : void 0
        }
    }

    function e3(e, t) {
        return null == e ? e : {
            generationToken: (0, eD.exists)(e, "generationToken") ? e.generationToken : void 0
        }
    }

    function e6(e, t) {
        return null == e ? e : {
            count: (0, eD.exists)(e, "count") ? e.count : void 0,
            countIsCapped: (0, eD.exists)(e, "countIsCapped") ? e.countIsCapped : void 0,
            creatorEnabled: (0, eD.exists)(e, "creatorEnabled") ? e.creatorEnabled : void 0,
            viewerCanRead: (0, eD.exists)(e, "viewerCanRead") ? e.viewerCanRead : void 0,
            viewerCanWrite: (0, eD.exists)(e, "viewerCanWrite") ? e.viewerCanWrite : void 0
        }
    }

    function e9(e, t) {
        return null == e ? e : {
            type: (0, eD.exists)(e, "type") ? e.type : void 0,
            id: (0, eD.exists)(e, "id") ? e.id : void 0
        }
    }

    function e7(e, t) {
        return null == e ? e : {
            counts: (0, eD.exists)(e, "counts") ? e.counts : void 0,
            userReaction: (0, eD.exists)(e, "userReaction") ? e.userReaction : void 0
        }
    }

    function te(e, t) {
        return null == e ? e : {
            shareCount: (0, eD.exists)(e, "shareCount") ? e.shareCount : void 0
        }
    }

    function tt(e, t) {
        var n;
        return null == e ? e : {
            type: (0, eD.exists)(e, "type") ? e.type : void 0,
            experienceCta: (0, eD.exists)(e, "experienceCta") ? null == (n = e.experienceCta) ? n : {
                experienceId: (0, eD.exists)(n, "experienceId") ? n.experienceId : void 0,
                placeId: (0, eD.exists)(n, "placeId") ? n.placeId : void 0
            } : void 0
        }
    }

    function tn(e) {
        var t;
        return null == (t = e) ? t : {
            feedSessionId: (0, eD.exists)(t, "feedSessionId") ? t.feedSessionId : void 0,
            entityId: (0, eD.exists)(t, "entityId") ? t.entityId : void 0,
            entityType: (0, eD.exists)(t, "entityType") ? t.entityType : void 0,
            id: (0, eD.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eD.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            channelId: (0, eD.exists)(t, "channelId") ? t.channelId : void 0,
            type: (0, eD.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eD.exists)(t, "captionedAssetMoment") ? e4(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eD.exists)(t, "primaryCta") ? tt(t.primaryCta) : void 0,
            owner: (0, eD.exists)(t, "owner") ? e9(t.owner) : void 0,
            visibilityStatus: (0, eD.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eD.exists)(t, "reactions") ? e7(t.reactions) : void 0,
            comments: (0, eD.exists)(t, "comments") ? e6(t.comments) : void 0,
            stats: (0, eD.exists)(t, "stats") ? te(t.stats) : void 0
        }
    }

    function ti(e, t) {
        return null == e ? e : {
            feedItems: (0, eD.exists)(e, "feedItems") ? e.feedItems : void 0,
            loaded: (0, eD.exists)(e, "loaded") ? e.loaded : void 0,
            failed: (0, eD.exists)(e, "failed") ? e.failed : void 0,
            moderated: (0, eD.exists)(e, "moderated") ? e.moderated : void 0
        }
    }

    function ta(e, t) {
        return null == e ? e : {
            items: (0, eD.exists)(e, "items") ? null === e.items ? null : e.items.map(tn) : void 0,
            paginationContext: (0, eD.exists)(e, "paginationContext") ? e.paginationContext : void 0,
            metadata: (0, eD.exists)(e, "metadata") ? ti(e.metadata) : void 0
        }
    }

    function ts(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, eD.exists)(t, "id") ? t.id : void 0,
            feedItemId: (0, eD.exists)(t, "feedItemId") ? t.feedItemId : void 0,
            channelId: (0, eD.exists)(t, "channelId") ? t.channelId : void 0,
            type: (0, eD.exists)(t, "type") ? t.type : void 0,
            captionedAssetMoment: (0, eD.exists)(t, "captionedAssetMoment") ? e4(t.captionedAssetMoment) : void 0,
            primaryCta: (0, eD.exists)(t, "primaryCta") ? tt(t.primaryCta) : void 0,
            owner: (0, eD.exists)(t, "owner") ? e9(t.owner) : void 0,
            visibilityStatus: (0, eD.exists)(t, "visibilityStatus") ? t.visibilityStatus : void 0,
            reactions: (0, eD.exists)(t, "reactions") ? e7(t.reactions) : void 0,
            comments: (0, eD.exists)(t, "comments") ? e6(t.comments) : void 0,
            stats: (0, eD.exists)(t, "stats") ? te(t.stats) : void 0
        }
    }

    function to(e) {
        var t;
        return null == (t = e) ? t : {
            startSeconds: (0, eD.exists)(t, "startSeconds") ? t.startSeconds : void 0,
            endSeconds: (0, eD.exists)(t, "endSeconds") ? t.endSeconds : void 0,
            text: (0, eD.exists)(t, "text") ? t.text : void 0
        }
    }

    function tr(e, t) {
        return null == e ? e : {
            signingAlgorithmVersion: (0, eD.exists)(e, "signingAlgorithmVersion") ? e.signingAlgorithmVersion : void 0,
            signature: (0, eD.exists)(e, "signature") ? e.signature : void 0
        }
    }
    var tl = eD.BaseAPI;

    function td() {
        return null !== tl && tl.apply(this, arguments) || this
    }
    eB(td, tl), td.prototype.backfillTriggerB1Raw = function(e, t) {
        return eq(this, void 0, void 0, function() {
            var n, i, a;
            return ez(this, function(s) {
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
                        return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                }
            })
        })
    }, td.prototype.backfillTriggerB1 = function() {
        return eq(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), ez(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.backfillTriggerB1Raw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var tu = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eB(t, e), t.prototype.contentCapturesBatchCheckExperienceUploadabilityRaw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesBatchCheckExperienceUploadability = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesBatchCheckExperienceUploadabilityRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibilityRaw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isEligible: (0, eD.exists)(e, "isEligible") ? e.isEligible : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckMomentsEligibility = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return e5(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatus = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return e5(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCheckUploadStatusRcc = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a, s;
                    return ez(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eD.canConsumeForm)([{
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
                                return s = o.sent(), [2, new eD.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        operationId: (0, eD.exists)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesCreateInfluencerMomentFromVideo = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesGrantExperiencePermissions = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesGrantExperiencePermissionsRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadataRaw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return tr(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignContentAndMetadata = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a, s;
                    return ez(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, i = {}, a = (0, eD.canConsumeForm)([{
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
                                return s = o.sent(), [2, new eD.JSONApiResponse(s, function(e) {
                                    return tr(e)
                                })]
                        }
                    })
                })
            }, t.prototype.contentCapturesSignFileAndMetadataInternal = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(eZ),
                                                                    stickerOverlays: void 0 === e.stickerOverlays ? void 0 : null === e.stickerOverlays ? null : e.stickerOverlays.map(eQ),
                                                                    ttsAudios: void 0 === e.ttsAudios ? void 0 : null === e.ttsAudios ? null : e.ttsAudios.map(e0)
                                                                }
                                                            }(e.edits)
                                                        }
                                                    }(e.metadata),
                                                    feedRegistrationInfo: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            attributes: void 0 === e.attributes ? void 0 : null === e.attributes ? null : e.attributes.map(eK),
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
                                return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.contentCapturesUploadCaptureWithAsset = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.contentCapturesUploadCaptureWithAssetRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t
        }(eD.BaseAPI),
        tc = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            eB(t, e), t.prototype.moderationApplyModerationDecisionRaw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationApplyModerationDecision = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationApplyModerationDecisionRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.moderationReportMomentRaw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eD.RequiredError("momentId", "Required parameter requestParameters.momentId was null or undefined when calling moderationReportMoment.");
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
                                return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.moderationReportMoment = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    return ez(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.moderationReportMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(eD.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            eB(t, e), t.prototype.momentTextGenerationCreateMomentVideoUploadUrlRaw = function(e) {
                return eq(this, void 0, void 0, function() {
                    var t, n, i;
                    return ez(this, function(a) {
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
                                return i = a.sent(), [2, new eD.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        uploadUrl: (0, eD.exists)(e, "uploadUrl") ? e.uploadUrl : void 0,
                                        videoObjectKey: (0, eD.exists)(e, "videoObjectKey") ? e.videoObjectKey : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationCreateMomentVideoUploadUrl = function(e) {
                return eq(this, void 0, void 0, function() {
                    return ez(this, function(t) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return e3(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentText = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return e3(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGenerateMomentTextWithVideo = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        status: (0, eD.exists)(e, "status") ? e.status : void 0,
                                        result: (0, eD.exists)(e, "result") ? null == (t = e.result) ? t : {
                                            summary: (0, eD.exists)(t, "summary") ? t.summary : void 0,
                                            description: (0, eD.exists)(t, "description") ? t.description : void 0,
                                            error: (0, eD.exists)(t, "error") ? t.error : void 0,
                                            segments: (0, eD.exists)(t, "segments") ? null === t.segments ? null : t.segments.map(to) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationGetMomentTextGenerationStatus = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentTextGenerationSubmitMomentGeneratedTextFeedback = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentTextGenerationSubmitMomentGeneratedTextFeedbackRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(eD.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eB(t, e), t.prototype.momentsCleanUserDataRaw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        notificationId: (0, eD.exists)(e, "NotificationId") ? e.NotificationId : void 0,
                                        eventType: (0, eD.exists)(e, "EventType") ? e.EventType : void 0,
                                        eventTime: (0, eD.exists)(e, "EventTime") ? new Date(e.EventTime) : void 0,
                                        eventPayload: (0, eD.exists)(e, "EventPayload") ? null == (t = e.EventPayload) ? t : {
                                            userId: (0, eD.exists)(t, "UserId") ? t.UserId : void 0,
                                            gameIds: (0, eD.exists)(t, "GameIds") ? t.GameIds : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsCleanUserData = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.momentId || void 0 === e.momentId) throw new eD.RequiredError("momentId", "Required parameter requestParameters.momentId was null or undefined when calling momentsDeleteMoment.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/{momentId}".replace("{".concat("momentId", "}"), encodeURIComponent(String(e.momentId))),
                                    schemaPath: "/v2/moments/{momentId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMoment = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    return ez(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItemRaw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.feedItemId || void 0 === e.feedItemId) throw new eD.RequiredError("feedItemId", "Required parameter requestParameters.feedItemId was null or undefined when calling momentsDeleteMomentByFeedItem.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v2/moments/by-feed-item/{feedItemId}".replace("{".concat("feedItemId", "}"), encodeURIComponent(String(e.feedItemId))),
                                    schemaPath: "/v2/moments/by-feed-item/{feedItemId}",
                                    method: "DELETE",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsDeleteMomentByFeedItem = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    return ez(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsDeleteMomentByFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendationsRaw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return ta(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMomentRecommendations = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eD.exists)(e, "items") ? null === e.items ? null : e.items.map(ts) : void 0,
                                        failedMomentIds: (0, eD.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eD.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetMoments = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        items: (0, eD.exists)(e, "items") ? null === e.items ? null : e.items.map(ts) : void 0,
                                        failedMomentIds: (0, eD.exists)(e, "failedMomentIds") ? e.failedMomentIds : void 0,
                                        moderatedMomentIds: (0, eD.exists)(e, "moderatedMomentIds") ? e.moderatedMomentIds : void 0,
                                        paginationContext: (0, eD.exists)(e, "paginationContext") ? e.paginationContext : void 0,
                                        metadata: (0, eD.exists)(e, "metadata") ? ti(e.metadata) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.momentsGetUsersMoments = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItem = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2Raw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.momentsReactToFeedItemV2 = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.momentsReactToFeedItemV2Raw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, t.prototype.momentsSearchMomentsRaw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return ta(e)
                                })]
                        }
                    })
                })
            }, t.prototype.momentsSearchMoments = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var t, n, i;
                    return ez(this, function(a) {
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
                                return i = a.sent(), [2, new eD.VoidApiResponse(i)]
                        }
                    })
                })
            }, t.prototype.momentsTestSuppressOwnedFeedItems = function(e) {
                return eq(this, void 0, void 0, function() {
                    return ez(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.momentsTestSuppressOwnedFeedItemsRaw(e)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, t
        }(eD.BaseAPI)),
        tm = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eB(t, e), t.prototype.postsCompletePostRaw = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                            uploads: void 0 === e.uploads ? void 0 : null === e.uploads ? null : e.uploads.map(eV)
                                        }
                                    }(e.postsCompletePostRequest)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        uploads: (0, eD.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(e8) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsCompletePost = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
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
                                                    textOverlays: void 0 === e.textOverlays ? void 0 : null === e.textOverlays ? null : e.textOverlays.map(eH),
                                                    textToSpeech: void 0 === e.textToSpeech ? void 0 : null === e.textToSpeech ? null : e.textToSpeech.map(eW),
                                                    contentLanguage: e.contentLanguage
                                                }
                                            }(e.common),
                                            videoPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    video: eG(e.video),
                                                    durationSeconds: e.durationSeconds,
                                                    trim: e_(e.trim)
                                                }
                                            }(e.videoPost),
                                            screenshotPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    screenshot: eG(e.screenshot),
                                                    widthPixels: e.widthPixels,
                                                    heightPixels: e.heightPixels
                                                }
                                            }(e.screenshotPost),
                                            influencerVideoPost: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    video: eG(e.video),
                                                    durationSeconds: e.durationSeconds,
                                                    trim: e_(e.trim)
                                                }
                                            }(e.influencerVideoPost)
                                        }
                                    }(e.postsCreatePostRequest)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        post: (0, eD.exists)(e, "post") ? null == (t = e.post) ? t : {
                                            operationId: (0, eD.exists)(t, "operationId") ? t.operationId : void 0
                                        } : void 0,
                                        uploads: (0, eD.exists)(e, "uploads") ? null === e.uploads ? null : e.uploads.map(e2) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsCreatePost = function() {
                return eq(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), ez(this, function(n) {
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
                return eq(this, void 0, void 0, function() {
                    var n, i, a;
                    return ez(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new eD.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling postsGetPostOperationStatus.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new eD.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        path: (0, eD.exists)(e, "path") ? e.path : void 0,
                                        done: (0, eD.exists)(e, "done") ? e.done : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.postsGetPostOperationStatus = function(e, t) {
                return eq(this, void 0, void 0, function() {
                    return ez(this, function(n) {
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
        }(eD.BaseAPI),
        tp = eD.BaseAPI;

    function th() {
        return null !== tp && tp.apply(this, arguments) || this
    }
    eB(th, tp), th.prototype.testSeedCreatePostAssetRaw = function(e, t) {
        return eq(this, void 0, void 0, function() {
            var n, i, a;
            return ez(this, function(s) {
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
                        return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                }
            })
        })
    }, th.prototype.testSeedCreatePostAsset = function() {
        return eq(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), ez(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedCreatePostAssetRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, th.prototype.testSeedInspectPostRaw = function(e, t) {
        return eq(this, void 0, void 0, function() {
            var n, i, a;
            return ez(this, function(s) {
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
                        return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                }
            })
        })
    }, th.prototype.testSeedInspectPost = function() {
        return eq(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), ez(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedInspectPostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, th.prototype.testSeedListUserMomentsRaw = function(e) {
        return eq(this, void 0, void 0, function() {
            var t, n, i;
            return ez(this, function(a) {
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
                        return i = a.sent(), [2, new eD.VoidApiResponse(i)]
                }
            })
        })
    }, th.prototype.testSeedListUserMoments = function(e) {
        return eq(this, void 0, void 0, function() {
            return ez(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.testSeedListUserMomentsRaw(e)];
                    case 1:
                        return t.sent(), [2]
                }
            })
        })
    }, th.prototype.testSeedMomentToPostRaw = function(e, t) {
        return eq(this, void 0, void 0, function() {
            var n, i, a;
            return ez(this, function(s) {
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
                        return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                }
            })
        })
    }, th.prototype.testSeedMomentToPost = function() {
        return eq(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), ez(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedMomentToPostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, th.prototype.testSeedSeedBatchRaw = function(e, t) {
        return eq(this, void 0, void 0, function() {
            var n, i, a;
            return ez(this, function(s) {
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
                        return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                }
            })
        })
    }, th.prototype.testSeedSeedBatch = function() {
        return eq(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), ez(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedSeedBatchRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, th.prototype.testSeedSeedMomentRaw = function(e, t) {
        return eq(this, void 0, void 0, function() {
            var n, i, a;
            return ez(this, function(s) {
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
                        return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                }
            })
        })
    }, th.prototype.testSeedSeedMoment = function() {
        return eq(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), ez(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedSeedMomentRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, th.prototype.testSeedWirePostRaw = function(e, t) {
        return eq(this, void 0, void 0, function() {
            var n, i, a;
            return ez(this, function(s) {
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
                        return a = s.sent(), [2, new eD.VoidApiResponse(a)]
                }
            })
        })
    }, th.prototype.testSeedWirePost = function() {
        return eq(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), ez(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.testSeedWirePostRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    let tv = (0, e.i(272593).createClientConfiguration)("content-captures-api", "bedev2"),
        tf = new tu(tv),
        tx = new tc(tv),
        tg = new tm(tv),
        tb = Object.assign(tf, {
            momentsGetUsersMoments: e => tx.momentsGetUsersMoments(e),
            momentsDeleteMoment: e => tx.momentsDeleteMoment(e),
            momentsDeleteMomentByFeedItem: e => tx.momentsDeleteMomentByFeedItem(e),
            postsCreatePost: e => tg.postsCreatePost(e),
            postsCompletePost: e => tg.postsCompletePost(e)
        });
    var ty = e.i(773057),
        tI = e.i(227987),
        tT = e.i(889311),
        tC = e.i(215955),
        tw = ((t = {}).ListMoments = "listMoments", t.FetchNextPage = "fetchNextPage", t.UploadVideo = "uploadVideo", t.ValidateVideo = "validateVideo", t.PersistLocalVideo = "persistLocalVideo", t.PublishMoment = "publishMoment", t.DeleteMoment = "deleteMoment", t.ResolveExperience = "resolveExperience", t.LoadLocalVideoMedia = "loadLocalVideoMedia", t.EnrichExperienceNames = "enrichExperienceNames", t);
    let tS = (e, t) => {
            let n;
            return null != t.momentId && (e.momentId = t.momentId), null != t.feedItemId && (e.feedItemId = t.feedItemId), null != t.draftId && (e.draftId = t.draftId), null != t.experienceId && (e.experienceId = String(t.experienceId)), null != t.placeId && (e.placeId = String(t.placeId)), null != t.fileCount && (e.fileCount = String(t.fileCount)), null != t.fileSize && (e.fileSize = String(t.fileSize)), null != t.fileType && t.fileType.length > 0 && (e.fileType = t.fileType), null != t.locale && t.locale.length > 0 && (e.locale = t.locale), null != t.inputValue && t.inputValue.length > 0 && (e.inputValue = (n = t.inputValue).length <= 200 ? n : n.slice(0, 200)), null != t.idType && (e.idType = t.idType), null != t.matchedId && (e.matchedId = String(t.matchedId)), null != t.userId && (e.userId = String(t.userId)), null != t.pageCount && (e.pageCount = String(t.pageCount)), null != t.momentCount && (e.momentCount = String(t.momentCount)), null != t.persistedVideoCount && (e.persistedVideoCount = String(t.persistedVideoCount)), null != t.isLocalMoment && (e.isLocalMoment = String(t.isLocalMoment)), null != t.universeIdCount && (e.universeIdCount = String(t.universeIdCount)), e
        },
        tA = async (e, t) => {
            var n;
            let i = await (0, tI.default)(e),
                a = e instanceof Error ? e.message : "string" == typeof e ? e : "Unknown error";
            return i ? {
                reason: null != (n = null != t ? t : i.message) ? n : a,
                httpStatus: i.status,
                errorCode: i.code
            } : {
                reason: null != t ? t : a
            }
        }, tM = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return {
                eventName: tT.default.MomentsCreationsError,
                parameters: tS({
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
        }, tj = async function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tC.default,
                a = await tA(t, n.reason);
            i.logErrorEvent(tM(e, a, n))
        }, tP = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : tC.default;
            tj(e, t, n, i)
        }, tE = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: tT.default.MomentsCreationsAttempt,
                parameters: tS({
                    operation: e
                }, t)
            }
        }, tk = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return {
                eventName: tT.default.MomentsCreationsSuccess,
                parameters: tS({
                    operation: e
                }, t)
            }
        }, tR = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tC.default;
            n.logClickEvent(tE(e, t))
        }, tL = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tC.default;
            n.logImpressionEvent(tk(e, t))
        };
    var tN = e.i(773595);
    let tO = tN.availableDocsLocales,
        tD = new Set(tO),
        tU = e => {
            let t = e === s.Locale.SimplifiedChineseJV ? s.Locale.SimplifiedChinese : e;
            return null != t && tD.has(t) ? t : s.Locale.English
        },
        tB = (e, t) => {
            var n;
            return null != (n = e.locale) ? n : tU(t)
        },
        tq = e => null != e ? (0, s.toLocaleNativeName)(e) : "-",
        tz = {
            active: en,
            captionedassetmoment: en,
            live: en,
            moderated: es,
            pending: ei,
            published: en
        },
        tF = new Date(0).toISOString(),
        tV = function(e) {
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
                    if (null != e && "" !== e) return tN.StringLocaleMap.get(e.toLowerCase())
                })(null == p ? void 0 : p.videoContentLanguage);
            return {
                momentId: d,
                feedItemId: u,
                assetId: null == p ? void 0 : p.assetId,
                description: null != (a = null == p ? void 0 : p.caption) ? a : "",
                experienceName: "",
                modifiedAt: tF,
                status: (e => {
                    if (!e) return en;
                    let t = tz[e.toLowerCase()];
                    if (t) return t;
                    let n = e.toLowerCase();
                    return n.includes("pending") ? ei : (n.includes("active") || n.includes("publish") || n.includes("live"), en)
                })(e.type),
                universeId: h,
                ...null != v ? {
                    locale: v
                } : {}
            }
        },
        tG = function(e) {
            var t;
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return (null != (t = e.items) ? t : []).map(e => tV(e, n)).filter(e => null != e)
        },
        t_ = async (e, t) => tb.momentsGetUsersMoments({
            targetUserId: e,
            paginationContext: null == t ? void 0 : t.paginationContext,
            count: 25
        }), tH = async e => {
            let t = [...new Set(e.map(e => e.universeId).filter(e => null != e && e > 0))];
            if (0 === t.length) return e;
            try {
                tR(tw.EnrichExperienceNames, {
                    universeIdCount: t.length
                });
                let {
                    data: n = []
                } = await ty.default.getUniversesDetails(t), i = new Map(n.filter(e => null != e.id && "string" == typeof e.name && e.name.length > 0).map(e => [e.id, e.name])), a = e.map(e => {
                    var t;
                    let n = null != e.universeId && null != (t = i.get(e.universeId)) ? t : "";
                    return n === e.experienceName ? e : {
                        ...e,
                        experienceName: n
                    }
                });
                return tL(tw.EnrichExperienceNames, {
                    universeIdCount: t.length
                }), a
            } catch (n) {
                return tP(tw.EnrichExperienceNames, n, {
                    universeIdCount: t.length
                }), e
            }
        }, tW = async function(e, t) {
            var n, i;
            let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                s = (null == t ? void 0 : t.paginationContext) != null ? tw.FetchNextPage : tw.ListMoments;
            tR(s, {
                userId: e
            });
            let o = await t_(e, t),
                r = tG(o, a),
                l = await tH(r);
            return tL(s, {
                userId: e,
                pageCount: null != (n = null == t ? void 0 : t.pageNumber) ? n : 1,
                momentCount: l.length
            }), {
                moments: l,
                paginationContext: null != (i = o.paginationContext) ? i : void 0
            }
        }, tK = async e => {
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
                status: ea,
                ...null != a ? {
                    locale: a
                } : {}
            }
        };
    async function tY(e) {
        let {
            feedItemId: t,
            momentId: n,
            useFeedItemId: i = !1
        } = e;
        if (i) {
            if (null == t || "" === t) throw Error("Moment feed item id is required before deleting");
            await tb.momentsDeleteMomentByFeedItem({
                feedItemId: t
            });
            return
        }
        if (null == n || "" === n) throw Error("Moment id is required before deleting");
        await tb.momentsDeleteMoment({
            momentId: n
        })
    }
    var tJ = e.i(408068);
    async function tQ(e) {
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
    let tX = "influencerVideo";
    async function tZ(e) {
        let t = tJ.md5.create();
        for (let n = 0; n < e.size; n += 5242880) {
            let i = Math.min(n + 5242880, e.size);
            t.update(await e.slice(n, i).arrayBuffer())
        }
        return t.hex()
    }
    async function t$(e, t) {
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
    async function t0(e) {
        let {
            moment: t,
            file: n,
            displayName: i,
            uiLocale: a,
            sendVideoContentLanguage: s = !0
        } = e, o = await tQ(n), r = {
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
        }, l = (await tb.contentCapturesCreateInfluencerMomentFromVideo({
            files: [n],
            name: i,
            description: t.description,
            universeId: t.experienceId,
            momentPublishData: JSON.stringify(r),
            ...s ? {
                videoContentLanguage: tB(t, a).toLowerCase()
            } : {}
        })).operationId;
        if (null == l || "" === l) throw Error("Publish operation id is missing from the response");
        return {
            operationId: l
        }
    }
    async function t1(e) {
        var t, n, i, a, s;
        let {
            moment: o,
            file: r,
            displayName: l,
            uiLocale: d,
            sendVideoContentLanguage: u = !0
        } = e, c = await tQ(r), m = await tZ(r), p = {
            caption: o.description,
            ...u ? {
                contentLanguage: tB(o, d).toLowerCase()
            } : {},
            primaryCta: {
                experience: {
                    universeId: o.experienceId,
                    placeId: o.rootPlaceId
                }
            }
        }, h = await tb.postsCreatePost({
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
        let f = null != (t = null == (a = h.uploads) ? void 0 : a.find(e => e.role === tX)) ? t : null == (s = h.uploads) ? void 0 : s[0];
        if (!(null == f ? void 0 : f.operationId)) throw Error("Create post response is missing the video upload target");
        let x = null != (n = f.uploadUrls) ? n : [];
        if (0 === x.length) throw Error("Create post response did not return any upload URLs");
        let g = await t$(x, r);
        return await tb.postsCompletePost({
            postsCompletePostRequest: {
                uploads: [{
                    role: tX,
                    operationId: f.operationId,
                    parts: g
                }]
            }
        }), {
            operationId: v
        }
    }
    async function t2(e) {
        if (!e.moment.experienceId) throw Error("Moment experience is required before publishing");
        if (0 === e.file.size) throw Error("Moment video file must not be empty");
        return e.usePostCreation ? t1(e) : t0(e)
    }
    let t4 = () => {
            let {
                ready: e,
                value: t
            } = (0, u.useFlag)(T.isMomentsFeedIdEnabled);
            return e && null != t && t
        },
        t5 = () => {
            let {
                ready: e,
                value: t
            } = (0, u.useFlag)(T.isMomentsUploadLanguageSelectEnabled);
            return e && null != t && t
        },
        t8 = e => {
            var t, n;
            return e.status === ea ? e.draftId : null != (t = null != (n = e.feedItemId) ? n : e.momentId) ? t : ""
        },
        t3 = e => ["momentsCreations", e],
        t6 = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            return [...t3(e), t]
        },
        t9 = () => {
            let e, [{
                    momentStatus: t
                }, n] = (0, G.useQueryParams)(["momentStatus"]),
                i = (0, eR.useQueryClient)(),
                {
                    user: s
                } = (0, P.useAuthentication)();
            return {
                statusTab: "string" == typeof(e = null == t ? void 0 : Array.isArray(t) ? t[0] : t) && eo.some(t => t === e) ? e : ea,
                setStatusTab: (0, a.useCallback)(e => {
                    n({
                        momentStatus: e
                    }), e === en && i.invalidateQueries({
                        queryKey: t3(null == s ? void 0 : s.id)
                    })
                }, [i, n, null == s ? void 0 : s.id])
            }
        },
        t7 = async (e, t, n, i) => {
            let a = {
                draftId: t,
                fileSize: n.size,
                fileType: n.type
            };
            tR(tw.PersistLocalVideo, a);
            try {
                let s, o, {
                    evictedMediaDraftIds: r
                } = await eg(e, t, n, (s = eP(window.localStorage.getItem(ee(e))), o = new Set(i.map(e => e.draftId)), [...i, ...s.filter(e => !o.has(e.draftId))]));
                return tL(tw.PersistLocalVideo, a), {
                    hasLocalVideo: !0,
                    storageEvictedMediaDraftIds: r
                }
            } catch (e) {
                return tP(tw.PersistLocalVideo, e, {
                    draftId: t,
                    fileSize: n.size,
                    fileType: n.type
                }), {
                    hasLocalVideo: !1,
                    storageEvictedMediaDraftIds: []
                }
            }
        };
    var ne = e.i(137785);
    let nt = (0, s.withTranslation)(e => {
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
                }), a && (0, i.jsx)(J.Button, {
                    variant: "Link",
                    size: "Small",
                    onClick: a,
                    children: o("Action.EEChange")
                })]
            }), (0, i.jsx)("div", {
                className: "padding-medium radius-medium bg-surface-200 width-full",
                children: (0, i.jsx)(ne.default, {
                    disableLink: !0,
                    target: t,
                    targetType: "Experience",
                    variant: "medium"
                })
            })]
        })
    }, [_.TranslationNamespace.Creations]);
    var nn = e.i(395203),
        ni = e.i(392782);
    let na = "UniverseId",
        ns = "PlaceId",
        no = /(?:https?:\/\/)?create\.roblox\.com\/dashboard\/creations\/experiences\/(\d+)/,
        nr = /(?:https?:\/\/)?(?:www\.)?roblox\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
        nl = /^\d+$/,
        nd = [{
            regex: /(?:https?:\/\/)?create\.sitetest\d\.robloxlabs\.com\/dashboard\/creations\/experiences\/(\d+)/,
            idType: na
        }, {
            regex: /(?:https?:\/\/)?(?:www\.)?sitetest\d\.robloxlabs\.com(?:\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?\/games\/(\d+)/,
            idType: ns
        }],
        nu = (0, s.withTranslation)(e => {
            let {
                onExperienceResolved: t,
                isDisabled: n = !1
            } = e, {
                translate: o
            } = (0, s.useTranslation)(), {
                ready: r,
                value: l
            } = (0, u.useFlag)(T.isMomentsSitetestUrlParsingEnabled), [d, c] = (0, a.useState)(""), [m, p] = (0, a.useState)(!1), [h, v] = (0, a.useState)(), f = (0, a.useMemo)(() => [{
                regex: no,
                idType: na
            }, {
                regex: nr,
                idType: ns
            }, ...r && null != l && l ? nd : [], {
                regex: nl,
                idType: na
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
                let m = u.idType === na && nl.test(l) ? Number(l) : Number(null == (e = u.regex.exec(l)) ? void 0 : e[1]);
                if (!m || !Number.isFinite(m)) return;
                let h = {
                    inputValue: l,
                    idType: u.idType,
                    matchedId: m
                };
                p(!0), v(void 0), tR(tw.ResolveExperience, h);
                try {
                    let e;
                    if (u.idType === ns) {
                        let t = null == (r = (await ni.default.multigetPlaceDetails([m]))[0]) ? void 0 : r.universeId;
                        if (!t) {
                            tP(tw.ResolveExperience, "Experience not found", {
                                ...h,
                                placeId: m,
                                reason: "ExperienceNotFound"
                            }), v(o("Error.ExperienceNotFound")), p(!1);
                            return
                        }
                        e = t
                    } else e = m;
                    let l = null == (s = (await ni.default.getDetails([e])).data) ? void 0 : s[0];
                    if (!(null == l ? void 0 : l.id)) {
                        tP(tw.ResolveExperience, "Experience not found", {
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
                    }), tL(tw.ResolveExperience, {
                        ...h,
                        experienceId: l.id,
                        placeId: u.idType === ns ? m : void 0
                    }), c("")
                } catch (e) {
                    tP(tw.ResolveExperience, e, {
                        ...h,
                        placeId: u.idType === ns ? m : void 0,
                        experienceId: u.idType === na ? m : void 0
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
                    children: (0, i.jsx)(nn.TextInput, {
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
                }), (0, i.jsx)(J.Button, {
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
        }, [_.TranslationNamespace.Creations, _.TranslationNamespace.Controls]);
    var nc = e.i(316413),
        nm = e.i(75584),
        np = e.i(95899);
    let nh = (0, s.withTranslation)(e => {
        let {
            value: t,
            onChange: n,
            isDisabled: o = !1
        } = e, {
            translate: r
        } = (0, s.useTranslation)(), l = r("CreateMomentModal.LanguageInput.Label"), d = r("CreateMomentModal.LanguageInput.Placeholder"), u = (0, a.useCallback)(e => {
            tD.has(e) && n(e)
        }, [n]);
        return (0, i.jsx)("div", {
            className: "width-full",
            "data-testid": "moments-language-select",
            children: (0, i.jsx)(nc.Dropdown, {
                className: "width-full [&_.content-system-alert]:text-caption-medium",
                size: "Medium",
                label: l,
                ariaLabel: l,
                placeholder: d,
                value: t,
                isDisabled: o,
                onValueChange: u,
                children: (0, i.jsx)(np.Menu, {
                    children: (0, i.jsx)(np.MenuSection, {
                        children: tO.map(e => (0, i.jsx)(np.MenuItem, {
                            value: e,
                            title: (0, s.toLocaleNativeName)(e),
                            trailing: t === e && (0, i.jsx)(nm.Icon, {
                                name: "icon-filled-check",
                                size: "Medium"
                            })
                        }, e))
                    })
                })
            })
        })
    }, [_.TranslationNamespace.Creations]);
    var nv = e.i(321211);
    let nf = ["mp4", "mov"],
        nx = ["video/mp4", "video/quicktime"];
    var ng = ((n = {}).FileTooBig = "FileTooBig", n.FileWrongType = "FileWrongType", n.DurationExceeded = "DurationExceeded", n.ResolutionExceeded = "ResolutionExceeded", n.MetadataUnavailable = "MetadataUnavailable", n);
    let nb = e => {
            var t, n;
            let i;
            return e.size > 0xc800000 ? "FileTooBig" : null != (i = null == (n = (t = e).name.split(".").pop()) ? void 0 : n.toLowerCase()) && nf.some(e => e === i) && ("" === t.type || nx.includes(t.type)) ? null : "FileWrongType"
        },
        ny = async e => {
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
        }, nI = async e => {
            let t = [],
                n = [];
            for (let i of e) {
                let e = nb(i);
                if (null != e) {
                    n.push({
                        file: i,
                        reason: e
                    });
                    continue
                }
                let a = await ny(i);
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
        }, nT = nf.map(e => e.toUpperCase()).join("/"), nC = (0, s.withTranslation)(e => {
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
                            } = await nI(s);
                            if (t.length > 0) {
                                for (let {
                                        file: e,
                                        reason: n
                                    }
                                    of t) tP(tw.ValidateVideo, n, {
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
                                        case ng.FileTooBig:
                                            return e("CreateMomentModal.Error.FileTooBigMegabytes", {
                                                maxFileSizeMB: new Intl.NumberFormat().format(200)
                                            });
                                        case ng.FileWrongType:
                                            return e("CreateMomentModal.Error.FileWrongType", {
                                                formats: nT
                                            });
                                        case ng.DurationExceeded:
                                            return e("CreateMomentModal.Error.DurationExceeded", {
                                                maxDurationMinutes: String(5)
                                            });
                                        case ng.ResolutionExceeded:
                                            return e("CreateMomentModal.Error.ResolutionExceeded", {
                                                maxWidth: String(4096),
                                                maxHeight: String(2160)
                                            });
                                        case ng.MetadataUnavailable:
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
                children: (0, i.jsx)(nv.default, {
                    accept: "video/mp4,video/quicktime,.mp4,.mov",
                    multiple: !0,
                    size: 0xc800000,
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
                        children: [(0, i.jsx)(J.Button, {
                            variant: "Standard",
                            size: "Medium",
                            type: "button",
                            icon: r || c ? void 0 : "icon-regular-arrow-up-from-line",
                            isDisabled: A,
                            onClick: e,
                            children: r || c ? (0, i.jsxs)("span", {
                                className: "inline-flex items-center gap-xsmall",
                                children: [(0, i.jsx)(q.ProgressCircle, {
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
        }, [_.TranslationNamespace.Creations]), nw = (0, s.withTranslation)(e => {
            let {
                open: t,
                onOpenChange: n,
                onMomentUploaded: o
            } = e, {
                addMoments: r
            } = ek(), {
                setStatusTab: l
            } = t9(), d = t5(), {
                translate: u
            } = (0, s.useTranslation)(), {
                locale: c
            } = (0, s.useLocalization)(), m = tU(c), [p, h] = (0, a.useState)(), [v, f] = (0, a.useState)(), x = null != v ? v : m, [g, b] = (0, a.useState)([]), [y, I] = (0, a.useState)([]), T = (0, a.useRef)(0), {
                uploadVideos: C,
                isUploading: w
            } = (() => {
                let {
                    user: e
                } = (0, P.useAuthentication)(), [t, n] = (0, a.useState)(!1), [i, s] = (0, a.useState)(0);
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
                            let e = await tK({
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
                                } = await t7(r, e.draftId, o, []);
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
                                let o = await tK({
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
                                    } = await t7(r, o.draftId, n, e);
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
            }, []), k = (0, a.useCallback)(e => {
                !w && (n(e), e || S())
            }, [w, n, S]), R = (0, a.useCallback)(e => {
                I(e)
            }, []), L = (0, a.useCallback)(() => {
                I([])
            }, []), N = (0, a.useCallback)(async e => {
                var t, n, i;
                if (0 === e.length || (null == p ? void 0 : p.id) == null || d && null == x || w) return void b(e);
                let a = T.current + 1;
                T.current = a, b(e), tR(tw.UploadVideo, {
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
                    }), tL(tw.UploadVideo, {
                        experienceId: p.id,
                        fileCount: t.length,
                        persistedVideoCount: t.filter(e => e.hasLocalVideo).length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (n = e[0]) ? void 0 : n.type,
                        ...d ? {
                            locale: x
                        } : {}
                    }), l(ea), A()
                } catch (t) {
                    if (T.current !== a) return;
                    tP(tw.UploadVideo, t, {
                        experienceId: p.id,
                        fileCount: e.length,
                        fileSize: e.reduce((e, t) => e + t.size, 0),
                        fileType: null == (i = e[0]) ? void 0 : i.type,
                        ...d ? {
                            locale: x
                        } : {}
                    }), b([])
                }
            }, [r, A, d, w, o, p, x, l, C]), O = u("CreateMomentModal.Title"), D = y[0], U = y.length > 1 ? y.slice(1).join(" ") : void 0;
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
                            children: O
                        }), null != D ? (0, i.jsx)("div", {
                            className: "width-full margin-top-small padding-bottom-small",
                            children: (0, i.jsx)(Q.Alert, {
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
                                        children: D
                                    }), null != U ? (0, i.jsx)("span", {
                                        className: "text-body-medium content-default",
                                        children: U
                                    }) : null]
                                })
                            })
                        }) : null, p ? (0, i.jsx)(nt, {
                            experience: p,
                            onChangeExperience: E
                        }) : (0, i.jsx)(nu, {
                            onExperienceResolved: M,
                            isDisabled: w
                        }), d ? (0, i.jsx)(nh, {
                            value: x,
                            onChange: j,
                            isDisabled: w
                        }) : null, (0, i.jsx)(nC, {
                            hasSelectedExperience: (null == p ? void 0 : p.id) != null,
                            hasSelectedLanguage: !d || null != x,
                            selectedFiles: g,
                            isUploading: w,
                            onFilesChange: N,
                            onValidationErrorsChange: R
                        })]
                    })
                })
            })
        }, [_.TranslationNamespace.Creations, _.TranslationNamespace.Controls]);

    function nS() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        (0, Z.openDialog)({
            component: nw,
            props: e,
            options: {
                mode: "standalone"
            }
        })
    }
    let nA = () => nS(),
        nM = () => {
            let {
                translate: e
            } = (0, s.useTranslation)();
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(J.Button, {
                    variant: "Emphasis",
                    size: "Large",
                    type: "button",
                    onClick: nA,
                    children: e("Action.CreateMoments")
                })
            })
        };
    var nj = e.i(836344);
    let nP = e => {
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
                children: eo.map(e => (0, i.jsx)(nj.Chip, {
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
        nE = () => {
            let {
                translate: e
            } = (0, s.useTranslation)(), {
                statusTab: t,
                setStatusTab: n
            } = t9(), o = (0, a.useMemo)(() => ({
                [en]: e("MomentsTable.Pills.Active"),
                [ea]: e("MomentsTable.Pills.Draft")
            }), [e]);
            return (0, i.jsx)("div", {
                className: "flex max-width-full relative max-large:padding-top-[24px]",
                children: (0, i.jsx)(nP, {
                    groupLabel: e("MomentsTable.Header.Status"),
                    labels: o,
                    selected: t,
                    onChange: n
                })
            })
        };
    var nk = e.i(253536),
        nR = e.i(418564);
    let nL = e => {
        var t, n, a;
        let {
            data: o
        } = e, {
            translate: r
        } = (0, s.useTranslation)(), l = (null == o || null == (n = o.creationAccessMetadata) ? void 0 : n.accessAllowed) === !1;
        if (!l) return null;
        let d = null != (t = null == o || null == (a = o.creationAccessMetadata) ? void 0 : a.daysToUnblock) ? t : 0,
            u = l && -1 === d;
        return (0, i.jsx)(nR.default, {
            alertTitle: u ? r("Heading.PermanentlyCreationBanned") : r("Heading.TemporaryCreationBanned", {
                days: d.toString()
            }),
            alertDescription: r(u ? "Description.PermanentlyCreationBanned" : "Description.TemporaryCreationBanned"),
            severity: "warning",
            externalLink: nk.MARKETPLACE_POLICY,
            linkLabel: r("Label.MarketplacePolicy"),
            allowCloseDialog: !1
        })
    };
    var nN = e.i(699848),
        nO = e.i(649114),
        nD = e.i(883302),
        nU = e.i(16255),
        nB = e.i(697973),
        nq = e.i(756568),
        nz = e.i(131385),
        nF = e.i(643093);
    let nV = () => {
        let {
            translate: e
        } = (0, s.useTranslation)(), [{
            activeTab: t
        }, n] = (0, G.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: o,
            activeL1Key: r
        } = (0, nz.default)(!0), l = (0, g.isAllAssetTypesActiveTab)(t), d = (0, g.isAvatarLooksActiveTab)(t), u = (0, a.useCallback)(e => {
            e && n({
                activeTab: (0, g.buildTaxonomyActiveTab)(e),
                filterIndex: 0
            })
        }, [n]), c = (0, a.useCallback)(() => {
            n({
                activeTab: (0, g.buildTaxonomyActiveTab)(g.ALL_ASSET_TYPES_L1_KEY),
                filterIndex: 0
            })
        }, [n]), m = (0, a.useCallback)(() => {
            n({
                activeTab: (0, g.buildTaxonomyActiveTab)(g.AVATAR_LOOKS_L1_KEY),
                filterIndex: 0
            })
        }, [n]), p = e("Label.Categories");
        return 0 !== o.length || l ? (0, i.jsxs)("fieldset", {
            className: "flex wrap items-center gap-small stroke-none margin-none padding-none [min-inline-size:auto]",
            "aria-label": p,
            children: [(0, i.jsx)(nj.Chip, {
                text: e("Label.Avatars"),
                size: "Medium",
                variant: "Standard",
                isChecked: d,
                onCheckedChange: m
            }), o.map(t => {
                var n;
                return (0, i.jsx)(nj.Chip, {
                    text: (0, nF.taxonomyOptionLabel)(t, e),
                    size: "Medium",
                    variant: "Standard",
                    isChecked: t.taxonomyKey === r,
                    onCheckedChange: () => u(t.taxonomyKey)
                }, null != (n = t.taxonomyKey) ? n : t.nameKey)
            }), (0, i.jsx)(nj.Chip, {
                text: e("Label.AllAssetTypes"),
                size: "Medium",
                variant: "Standard",
                isChecked: l,
                onCheckedChange: c
            })]
        }) : null
    };
    var nG = e.i(638016),
        n_ = e.i(157310),
        nH = e.i(348558),
        nW = e.i(100226);
    let nK = (e, t) => {
            let {
                settings: n
            } = (0, x.useSettings)(), i = C(), s = (0, nW.default)(), o = (0, nH.default)(), {
                data: r
            } = (0, n_.useQuery)({
                queryKey: ["avatar-items-entry-point-asset-types"],
                queryFn: y.getAvatarItemsEntryPointAssetTypes,
                staleTime: 3e5
            });
            return (0, a.useMemo)(() => {
                var a, l;
                return null != (a = null == (l = e.menuItem.submenuItems) ? void 0 : l.filter(a => I.default.isMenuItemEnabled(a, n, t, "Label.AvatarItems" === e.menuItem.nameKey ? null == r ? void 0 : r.has(a.type) : void 0, r, i, s, o))) ? a : []
            }, [e.menuItem.submenuItems, e.menuItem.nameKey, n, t, r, i, s, o])
        },
        nY = (0, nB.makeStyles)()(e => ({
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
        nJ = e => {
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
            } = nY(), p = (0, a.useRef)(null), {
                translate: h
            } = (0, s.useTranslation)(), [v, f] = (0, a.useState)(0), [x, g] = (0, a.useState)(0), [b, y] = (0, a.useState)(0), {
                isTaxonomyMode: T
            } = (0, nG.default)(I.default.getAssetType(t)), C = nK(t, o), w = (0, a.useMemo)(() => v <= 0, [v]), S = (0, a.useMemo)(() => v + b >= x, [v, x, b]), A = () => {
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
            }, []), T) ? (0, i.jsx)(nV, {}) : (0, i.jsxs)(nq.Flex, {
                classes: {
                    root: r
                },
                children: [!w && (0, i.jsx)("div", {
                    className: d,
                    children: (0, i.jsx)(nO.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: -b,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "back",
                        children: (0, i.jsx)(nD.NavigateBeforeIcon, {
                            fontSize: "small"
                        })
                    })
                }), (0, i.jsx)("div", {
                    ref: p,
                    className: m(l, "flex max-medium:wrap max-medium:gap-y-small"),
                    children: null == C ? void 0 : C.map(e => {
                        let a = t.submenuItem === e;
                        return (0, i.jsx)(nN.Chip, {
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
                    children: (0, i.jsx)(nO.IconButton, {
                        onClick: () => {
                            var e;
                            null == (e = p.current) || e.scrollBy({
                                left: b,
                                behavior: "smooth"
                            })
                        },
                        color: "secondary",
                        "aria-label": "next",
                        children: (0, i.jsx)(nU.NavigateNextIcon, {
                            fontSize: "small"
                        })
                    })
                })]
            })
        };
    var nQ = e.i(54842),
        nX = e.i(763833),
        nZ = e.i(650642),
        n$ = e.i(748893),
        n0 = e.i(260782),
        n1 = e.i(348148),
        n2 = e.i(79238),
        n4 = e.i(249259),
        n5 = e.i(481458),
        n8 = e.i(918324),
        n3 = e.i(610873),
        n6 = e.i(623983),
        n9 = e.i(239328),
        n7 = e.i(776344),
        ie = e.i(823062),
        it = e.i(198528),
        ii = e.i(949599),
        ia = e.i(704443),
        is = e.i(696564),
        io = e.i(418162);
    let ir = (0, nB.makeStyles)()(e => ({
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
    var il = e.i(226519),
        id = e.i(668539),
        iu = e.i(102725),
        ic = e.i(15645),
        im = e.i(200363),
        ip = e.i(957474),
        ih = e.i(419959),
        iv = e.i(155495),
        ix = e.i(257256),
        ig = e.i(990729),
        ib = e.i(913893),
        iy = e.i(185915);

    function iI(e) {
        if (void 0 === e.id || void 0 === e.autoPublishEnabled) throw Error("Publishing preferences response was malformed");
        return e
    }
    async function iT(e) {
        return iI(await ib.default.getPublishingPreferences(e))
    }
    async function iC(e) {
        return iI(await ib.default.createPublishingPreferences(e))
    }
    var iw = e.i(812141);
    let iS = e => {
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
            }), (0, i.jsx)(n0.Divider, {})]
        })
    };

    function iA(e) {
        return 4 === e || 2 === e
    }

    function iM(e, t, n) {
        return e && t && "all" === n ? 1 : e && t && "specific" === n ? 4 : e && !t ? 3 : !e && t ? 2 : 0
    }
    let ij = e => {
        var t;
        let {
            open: n,
            onClose: o
        } = e, {
            translate: r
        } = (0, s.useTranslation)(), {
            enqueue: l
        } = (0, ig.useSnackbar)(), {
            user: d
        } = (0, P.useAuthentication)(), u = (0, f.useCurrentGroup)(), c = null == u ? void 0 : u.id, {
            data: m
        } = (0, iw.default)(ib.default), p = null != (t = null == m ? void 0 : m.maxCollectiblePrice) ? t : is.DefaultMaxCollectiblePrice, [h, v] = (0, a.useState)(!0), [x, g] = (0, a.useState)(!1), [b, y] = (0, a.useState)(!1), [I, T] = (0, a.useState)(""), [C, w] = (0, a.useState)(""), [S, A] = (0, a.useState)(!0), [M, j] = (0, a.useState)(!0), [E, k] = (0, a.useState)(!0), [R, L] = (0, a.useState)("all"), [N, O] = (0, a.useState)(""), [D, U] = (0, a.useState)(!1);
        (0, a.useEffect)(() => {
            n && iT(c).then(e => {
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
                j(t.sellInMarketplace), k(t.sellInExperiences), L(t.experienceLocationMode), e.places.length > 0 && O(e.places.join(","))
            }).catch(e => {
                var t;
                (null == (t = (0, iy.default)(e)) ? void 0 : t.status) !== 404 && (U(!0), l({
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
                        let e = iM(M, E, R),
                            t = iA(e) ? N.split(",").filter(Boolean).map(e => Number(e)) : [];
                        await iC({
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
                        let e = await (0, tI.default)(t);
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
            }, [d, c, M, E, R, N, C, I, S, b, l, o, r]),
            q = (0, a.useCallback)(() => {
                B()
            }, [B]),
            z = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && T(t)
            }, [p]),
            F = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9]/g, "").replace(/^0+(\d)/, "$1");
                ("" === t || +t <= p) && w(t)
            }, [p]),
            V = (0, a.useCallback)(e => {
                let t = e.target.value.replaceAll(/[^0-9,]/g, "").replaceAll(/,{2,}/g, ",").replace(/^,/, "").split(",").map(e => e.replace(/^0+(\d)/, "$1")).filter(e => "0" !== e).join(","),
                    n = t.split(",").filter(Boolean);
                if (!(n.length > 5)) {
                    if (5 === n.length && t.endsWith(",")) return void O(t.slice(0, -1));
                    O(t)
                }
            }, []),
            G = h || x || D || !M && !E || "" === I || "" === C || 0 >= Number(C) || iA(iM(M, E, R)) && 0 === N.split(",").filter(Boolean).length;
        return (0, i.jsxs)(il.Dialog, {
            open: n,
            onClose: o,
            maxWidth: "Medium",
            color: "primaryBrand",
            PaperProps: {
                className: "[width:580px]"
            },
            children: [(0, i.jsx)(iu.DialogTitle, {
                className: "padding-bottom-none",
                children: (0, i.jsxs)("div", {
                    className: "flex justify-between items-start",
                    children: [(0, i.jsx)("span", {
                        className: "text-heading-small",
                        children: r("Heading.StudioPublishSettings")
                    }), (0, i.jsx)(nO.IconButton, {
                        "aria-label": "Close",
                        onClick: o,
                        size: "small",
                        color: "inherit",
                        children: (0, i.jsx)(ic.CloseIcon, {})
                    })]
                })
            }), (0, i.jsxs)(id.DialogContent, {
                className: "padding-top-small",
                children: [(0, i.jsx)(n6.Typography, {
                    variant: "body2",
                    className: "[opacity:0.7] padding-bottom-medium",
                    children: r("Description.StudioPublishSettingsSubtitle")
                }), (0, i.jsx)(iS, {
                    label: r("Label.Availability"),
                    children: (0, i.jsx)("span", {
                        className: "text-label-large [margin-left:12px]",
                        children: r("Label.NonLimited")
                    })
                }), (0, i.jsx)(iS, {
                    label: r("Label.TimedOption"),
                    children: (0, i.jsx)(n3.Switch, {
                        checked: b,
                        onChange: () => y(e => !e),
                        "aria-label": "Timed Option"
                    })
                }), (0, i.jsx)(iS, {
                    label: r("Label.PriceConfigurations"),
                    className: "grid [grid-template-columns:175px_1fr] padding-y-large gap-xsmall",
                    labelClassName: "padding-top-small",
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col [flex:1] gap-xsmall",
                        children: [(0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(iv.TextField, {
                                id: "price-offset",
                                label: "",
                                placeholder: r("Placeholder.AmountAbovePriceFloor"),
                                variant: "outlined",
                                size: "small",
                                value: I,
                                onChange: z,
                                fullWidth: !0
                            }), (0, i.jsx)(ix.Tooltip, {
                                title: r("Tooltip.AmountAbovePriceFloor"),
                                children: (0, i.jsx)(nO.IconButton, {
                                    "aria-label": "price offset info",
                                    size: "small",
                                    children: (0, i.jsx)(im.InfoOutlinedIcon, {})
                                })
                            })]
                        }), (0, i.jsxs)("div", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, i.jsx)(iv.TextField, {
                                id: "price-floor-minimum",
                                label: "",
                                placeholder: r("Placeholder.DoNotPriceBelow"),
                                variant: "outlined",
                                size: "small",
                                value: C,
                                onChange: F,
                                fullWidth: !0
                            }), (0, i.jsx)(ix.Tooltip, {
                                title: r("Tooltip.MinimumPriceFloor"),
                                children: (0, i.jsx)(nO.IconButton, {
                                    "aria-label": "minimum price info",
                                    size: "small",
                                    children: (0, i.jsx)(im.InfoOutlinedIcon, {})
                                })
                            })]
                        })]
                    })
                }), (0, i.jsx)(iS, {
                    label: r("Label.RegionalPricing"),
                    children: (0, i.jsx)(n3.Switch, {
                        checked: S,
                        onChange: () => A(e => !e),
                        "aria-label": "Regional Pricing"
                    })
                }), (0, i.jsx)(iS, {
                    label: r("Label.SellInMarketplace"),
                    children: (0, i.jsx)(n3.Switch, {
                        checked: M,
                        onChange: () => {
                            let e = !M;
                            e || L("specific"), j(e)
                        },
                        "aria-label": "Sell in Marketplace"
                    })
                }), (0, i.jsx)(iS, {
                    label: r("Label.SellInExperiences"),
                    children: (0, i.jsx)(n3.Switch, {
                        checked: E,
                        onChange: () => k(e => !e),
                        "aria-label": "Sell in experiences"
                    })
                }), E && (0, i.jsxs)(i.Fragment, {
                    children: [(0, i.jsx)(n0.Divider, {}), (0, i.jsxs)("div", {
                        className: "padding-y-large",
                        children: [(0, i.jsxs)("div", {
                            className: "grid [grid-template-columns:175px_1fr] items-center",
                            children: [(0, i.jsx)("span", {
                                className: "text-label-large",
                                children: r("Label.ExperienceLocations")
                            }), (0, i.jsxs)(ih.RadioGroup, {
                                row: !0,
                                value: R,
                                onChange: e => {
                                    let t = e.target.value;
                                    ("all" === t || "specific" === t) && L(t)
                                },
                                className: "flex flex-row no-wrap gap-xsmall [margin-left:12px]",
                                children: [(0, i.jsx)(n1.FormControlLabel, {
                                    value: "all",
                                    disabled: !M,
                                    control: (0, i.jsx)(ip.Radio, {
                                        "aria-label": r("Label.AllGames"),
                                        size: "small"
                                    }),
                                    label: r("Label.AllGames"),
                                    className: "margin-right-medium"
                                }), (0, i.jsx)(n1.FormControlLabel, {
                                    value: "specific",
                                    control: (0, i.jsx)(ip.Radio, {
                                        "aria-label": r("Label.SpecificExperiences"),
                                        size: "small"
                                    }),
                                    label: r("Label.SpecificExperiences")
                                })]
                            })]
                        }), "specific" === R && (0, i.jsxs)("div", {
                            className: "[margin-left:187px] [margin-top:10px]",
                            children: [(0, i.jsx)(iv.TextField, {
                                id: "place-ids",
                                label: "",
                                placeholder: r("Placeholder.EnterExperienceIDs"),
                                variant: "outlined",
                                size: "small",
                                value: N,
                                onChange: V,
                                fullWidth: !0
                            }), (0, i.jsxs)(n6.Typography, {
                                variant: "caption",
                                className: "[opacity:0.6] block [margin-top:4px]",
                                children: [N ? N.split(",").filter(Boolean).length : 0, "/", 5, " ", r("Label.ExperiencesCount")]
                            })]
                        })]
                    })]
                })]
            }), (0, i.jsxs)("div", {
                className: "flex padding-x-large padding-y-medium gap-small",
                children: [(0, i.jsx)(n$.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: q,
                    disabled: G,
                    size: "large",
                    className: "[flex:1] radius-medium",
                    children: r("Action.Save")
                }), (0, i.jsx)(n$.Button, {
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
    var iP = e.i(59973),
        iE = e.i(759283);
    let ik = (e, t) => {
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
    var iR = e.i(904451),
        iL = e.i(691236);
    let iN = (0, nB.makeStyles)()(e => ({
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
        iO = ["makeup", "clothing", "accessories"],
        iD = ["clothing", "makeup"],
        iU = {
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

    function iB(e) {
        return e ? iU.clothing.all : "Label.ClothingOnlyTShirtsPantsSweaters"
    }
    let iq = (0, s.withTranslation)(e => {
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
            } = iN(),
            {
                enqueue: m,
                close: p
            } = (0, ig.useSnackbar)(),
            h = (0, f.useCurrentGroup)(),
            v = !1 !== r.showCategorySubtypeDropdowns,
            x = (0, a.useMemo)(() => v ? iO : iD, [v]),
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
            P = (0, a.useMemo)(() => ({
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
            R = (0, a.useCallback)(() => {
                M("enable"), S(!0)
            }, []),
            L = (0, a.useCallback)(() => {
                M("disable"), S(!0)
            }, []),
            N = (0, a.useCallback)(async () => {
                if (!l || null === A) return void o();
                let e = x.flatMap(e => P[e] ? j[e].filter(e => y[e]) : []);
                try {
                    await ib.default.bulkUpdateCollectible(E.uuidService.generateRandomUuid(), null == h ? void 0 : h.id, e.map(e => (0, io.translateAssetType)(e)), "enable" === A), m({
                        message: d("Message.TimedOptionSettingsApplied"),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: iE.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    }), window.location.reload(), o()
                } catch (e) {
                    m({
                        message: d(ik(await (0, tI.default)(e), "Error.Unknown")),
                        anchorOrigin: {
                            vertical: "bottom",
                            horizontal: "center"
                        },
                        autoHideDuration: iE.toastDurationTime,
                        autoHide: !0,
                        onClose: p
                    })
                }
            }, [l, y, A, null == h ? void 0 : h.id, m, p, o, j, P, d, x]),
            O = (0, a.useCallback)(() => {
                S(!1), M(null)
            }, []),
            D = (0, a.useMemo)(() => x.map(e => {
                if (!P[e]) return null;
                let t = j[e];
                if (0 === t.length) return null;
                let n = t.filter(e => y[e]);
                if (0 === n.length) return null;
                if (n.length === t.length) return d("clothing" === e ? iB(v) : iU[e].all);
                let i = d(iU[e].short),
                    a = n.map(e => d(iE.assetFullNameKeys[e])).join(", ");
                return "".concat(i, " (").concat(a, ")")
            }).filter(e => null !== e), [y, j, P, v, d, x]),
            U = (0, a.useMemo)(() => x.some(e => P[e] && j[e].some(e => y[e])), [y, j, P, x]),
            B = (0, i.jsxs)(i.Fragment, {
                children: [(0, i.jsx)(iP.DialogContentText, {
                    className: u.descriptionText,
                    children: d("Description.BulkUpdateAllTimedOptions")
                }), (0, i.jsx)(n7.default, {
                    flexDirection: "column",
                    classes: {
                        root: u.checkboxList
                    },
                    children: x.map(e => (e => {
                        let t = j[e];
                        if (!P[e]) return null;
                        let n = g[e],
                            s = "timed-options-bulk-".concat(e, "-subtypes"),
                            o = d("clothing" === e ? iB(v) : iU[e].all);
                        return (0, i.jsxs)(a.default.Fragment, {
                            children: [(0, i.jsxs)("div", {
                                className: u.categoryRow,
                                children: [v ? (0, i.jsx)(nO.IconButton, {
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
                                    children: (0, i.jsx)(iL.ChevronRightIcon, {
                                        className: c(n ? u.expandToggleExpanded : u.expandToggleCollapsed)
                                    })
                                }) : null, (0, i.jsx)(iR.Checkbox, {
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
                                children: t.map(e => (0, i.jsx)(iR.Checkbox, {
                                    label: d(iE.assetFullNameKeys[e]),
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
                }), (0, i.jsxs)(n7.default, {
                    flexDirection: "row",
                    classes: {
                        root: u.buttonContainer
                    },
                    children: [(0, i.jsx)(n$.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: R,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !U,
                        children: d("Action.Enable")
                    }), (0, i.jsx)(n$.Button, {
                        variant: "contained",
                        color: "secondary",
                        onClick: L,
                        size: "medium",
                        className: u.actionButton,
                        disabled: !U,
                        children: d("Action.Disable")
                    })]
                })]
            });
        return w && (t = "enable" === A ? "Description.ThisWillEnableTimedOptionsFor" : "Description.ThisWillDisableTimedOptionsFor", B = (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(iP.DialogContentText, {
                className: u.descriptionText,
                children: d(t)
            }), D.length > 0 && (0, i.jsx)("ul", {
                className: u.bulletList,
                children: D.map(e => (0, i.jsx)("li", {
                    children: e
                }, e))
            }), (0, i.jsx)(iP.DialogContentText, {
                className: u.descriptionText,
                children: d("Description.ThisWillAlsoReplaceAnyItemLevelSettings")
            }), (0, i.jsxs)(n7.default, {
                flexDirection: "row",
                classes: {
                    root: u.buttonContainer
                },
                children: [(0, i.jsx)(n$.Button, {
                    variant: "contained",
                    color: "primaryBrand",
                    onClick: N,
                    size: "medium",
                    className: u.actionButton,
                    children: d("Action.Confirm")
                }), (0, i.jsx)(n$.Button, {
                    variant: "contained",
                    color: "secondary",
                    onClick: O,
                    size: "medium",
                    className: u.actionButton,
                    children: d("Action.Cancel")
                })]
            })]
        })), (0, i.jsxs)(il.Dialog, {
            open: n,
            onClose: k,
            maxWidth: "Small",
            color: "primaryBrand",
            classes: {
                paper: u.dialogPaper
            },
            children: [(0, i.jsxs)(iu.DialogTitle, {
                className: u.dialogTitle,
                children: [(0, i.jsx)("span", {
                    className: u.dialogTitleText,
                    children: w ? d("Title.ConfirmOption") : d("Action.TimedOptions")
                }), !w && (0, i.jsx)(nO.IconButton, {
                    "aria-label": "Close",
                    onClick: k,
                    size: "small",
                    className: u.closeButton,
                    color: "inherit",
                    children: (0, i.jsx)(ic.CloseIcon, {})
                })]
            }), (0, i.jsx)(id.DialogContent, {
                className: u.dialogContent,
                children: B
            })]
        })
    }, [_.TranslationNamespace.ConfigureItem, _.TranslationNamespace.Creations, _.TranslationNamespace.AssetTypes]);

    function iz(e) {
        return "Tshirt" === e ? m.Asset.TShirt : "TshirtAccessory" === e ? m.Asset.TShirtAccessory : e
    }
    let iF = (0, nB.makeStyles)()(e => ({
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
        iV = (0, s.withTranslation)(e => {
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
                } = iF(),
                {
                    enqueue: h,
                    close: v
                } = (0, ig.useSnackbar)(),
                x = (0, f.useCurrentGroup)(),
                [g, b] = (0, a.useState)(null),
                [y, I] = (0, a.useState)(() => E.uuidService.generateRandomUuid()),
                [T, C] = (0, a.useState)({
                    showClothing: !1,
                    showMakeup: !1,
                    showAccessories: !1,
                    showCategorySubtypeDropdowns: !0
                }),
                [w, S] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                l ? (b(null), I(E.uuidService.generateRandomUuid()), (0, is.getValidTimedOptionsTypes)().then(() => {
                    let e = new Set(is.ValidTimedOptionsAssetTypes.map(e => iz(e))),
                        t = 3 === e.size && Array.from(ii.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).every(t => e.has(t));
                    if (S(t), t) C({
                        showClothing: !1,
                        showMakeup: !1,
                        showAccessories: !1,
                        showCategorySubtypeDropdowns: !0
                    });
                    else {
                        let t = [...e].every(e => ii.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e) || ii.MAKEUP_ASSET_TYPES.includes(e)),
                            n = e.has(m.Asset.EyeMakeup),
                            i = ii.CLOTHING_ASSET_TYPES.some(t => e.has(t) && !ii.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(t)),
                            a = Array.from(ii.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(t => e.has(t));
                        C({
                            showClothing: i || a,
                            showMakeup: n,
                            showAccessories: e.has(m.Asset.Hat),
                            showCategorySubtypeDropdowns: !t
                        })
                    }
                })) : I(E.uuidService.generateRandomUuid())
            }, [l]);
            let A = (0, a.useCallback)(async () => {
                    try {
                        await ib.default.bulkUpdateCollectible(y, null == x ? void 0 : x.id, [64, 66, 68], !0 === g), h({
                            message: u("Message.TimedOptionSettingsApplied"),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: iE.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        }), window.location.reload(), d()
                    } catch (e) {
                        h({
                            message: u(ik(await (0, tI.default)(e), "Error.Unknown")),
                            anchorOrigin: {
                                vertical: "bottom",
                                horizontal: "center"
                            },
                            autoHideDuration: iE.toastDurationTime,
                            autoHide: !0,
                            onClose: v
                        })
                    }
                }, [h, v, u, d, y, null == x ? void 0 : x.id, g]),
                M = (0, a.useCallback)(() => {
                    d()
                }, [d]),
                j = !w,
                P = j ? (t = new Set(is.ValidTimedOptionsAssetTypes.map(e => iz(e))), n = ii.CLOTHING_ASSET_TYPES.some(e => t.has(e) && !ii.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES.has(e)), o = Array.from(ii.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).some(e => t.has(e)), r = T.showCategorySubtypeDropdowns && (!o || n) ? ii.CLOTHING_ASSET_TYPES.filter(e => t.has(e)) : Array.from(ii.ORIGINAL_TIMED_OPTIONS_ASSET_TYPES).filter(e => t.has(e)), {
                    clothing: r,
                    makeup: ii.MAKEUP_ASSET_TYPES.filter(e => t.has(e)),
                    accessories: T.showCategorySubtypeDropdowns ? ii.ACCESSORY_ASSET_TYPES.filter(e => t.has(e)) : []
                }) : void 0;
            return j ? (0, i.jsx)(iq, {
                open: l,
                onClose: M,
                categoryFlags: T,
                assetTypesByCategory: P
            }) : (0, i.jsxs)(il.Dialog, {
                open: l,
                onClose: M,
                maxWidth: "Small",
                color: "primaryBrand",
                children: [(0, i.jsxs)(iu.DialogTitle, {
                    className: p.dialogTitle,
                    children: [(0, i.jsx)("span", {
                        children: null === g ? u("Action.TimedOptions") : u("Action.Confirm")
                    }), (0, i.jsx)(nO.IconButton, {
                        "aria-label": "Close",
                        onClick: M,
                        size: "small",
                        className: p.closeButton,
                        color: "inherit",
                        children: (0, i.jsx)(ic.CloseIcon, {})
                    })]
                }), (0, i.jsx)(id.DialogContent, {
                    className: p.dialogContent,
                    children: null === g ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(iP.DialogContentText, {
                            className: p.descriptionText,
                            children: u("Description.BulkUpdateTimedOptions")
                        }), (0, i.jsxs)(n7.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(n$.Button, {
                                variant: "contained",
                                color: "secondary",
                                onClick: () => {
                                    b(!0)
                                },
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.TurnAllOn")
                            }), (0, i.jsx)(n$.Button, {
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
                        children: [(0, i.jsx)(iP.DialogContentText, {
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
                        }), (0, i.jsxs)(n7.default, {
                            flexDirection: "column",
                            classes: {
                                root: p.buttonContainer
                            },
                            children: [(0, i.jsx)(n$.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                onClick: A,
                                size: "large",
                                className: p.actionButton,
                                children: u("Action.Confirm")
                            }), (0, i.jsx)(n$.Button, {
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
        }, [_.TranslationNamespace.ConfigureItem, _.TranslationNamespace.Creations]),
        iG = Object.values(U.SearchSortParameter),
        i_ = Object.values(nQ.EventSortBy),
        iH = ["publishSettings"],
        iW = e => {
            var t;
            let {
                menuState: n
            } = e, {
                translate: o
            } = (0, s.useTranslation)(), {
                unifiedLogger: r
            } = (0, ie.useUnifiedLoggerProvider)(), {
                ready: l,
                value: d
            } = (0, u.useFlag)(n9.isAutoPublishPreferencesEnabled), {
                isFetched: c
            } = (0, f.useGroups)(), {
                classes: {
                    toolbarContainer: p,
                    sortContainer: h,
                    timedOptionsButton: v,
                    timedOptionsButtonDivider: x
                }
            } = ir(), [b, T] = (0, a.useState)(!1), [C, w] = (0, a.useState)(!1), [S, A] = (0, a.useState)(0), [M, P] = (0, a.useState)(!1), [k, R] = (0, a.useState)(!1), [L, N] = (0, a.useState)(null);
            (0, a.useEffect)(() => {
                (0, is.getValidTimedOptionsTypes)().then(() => {
                    R(!0)
                })
            }, []);
            let {
                sort: O,
                setSort: D,
                sortOrder: B,
                setSortOrder: q,
                isArchived: z,
                setIsArchived: F,
                isAgeRestrictedCollaboration: V,
                setIsAgeRestrictedCollaboration: _,
                isPublicOnly: H,
                setIsPublicOnly: W,
                isOnMarketplace: Y,
                setIsOnMarketplace: J
            } = (0, K.default)(), [{
                filterIndex: Q,
                publishSettings: X
            }] = (0, G.useQueryParams)(["filterIndex", "publishSettings"]), Z = (0, a.useContext)(j).isResolving, [, $] = (0, G.useQueryParams)(["activeTab", "filterIndex"]), [, ee] = (0, G.useQueryParams)(iH), et = (0, a.useMemo)(() => {
                let e = I.default.getAssetType(n);
                return e !== m.Asset.AllCatalogAsset || Number(Q) > 0 ? e : g.TAXONOMY_HOST_ASSET
            }, [n, Q]), en = (et in ii.AvatarMenuMap || et === m.Asset.AllCatalogAsset) && d, ei = (0, it.normalizeSingleQueryParam)(X), ea = !!en && c && !Z && !M && ("true" === ei || "1" === ei);
            (0, a.useEffect)(() => {
                l && c && !Z && void 0 !== ei && (ea || ee({
                    publishSettings: null
                }, {
                    skipHistory: !0
                }))
            }, [l, Z, c, ea, ei, ee]);
            let es = (0, a.useCallback)(() => {
                    w(!1), ea && (P(!0), ee({
                        publishSettings: null
                    }, {
                        skipHistory: !0
                    }))
                }, [ea, ee]),
                {
                    canUseTaxonomy: eo,
                    isTaxonomyMode: er
                } = (0, nG.default)(et),
                el = nK(n, (0, f.useCurrentGroup)()),
                {
                    isSortable: ed,
                    isArchivable: eu
                } = (0, a.useMemo)(() => {
                    let e = er || null == Q ? void 0 : Number(Q),
                        t = I.default.isAssetTypeArchivable(et, e);
                    return {
                        isSortable: I.default.isAssetTypeSortable(et),
                        isArchivable: t || I.default.isAssetTypeDirectlyArchivable(et)
                    }
                }, [et, Q, er]),
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
                        if (!iG.includes(t)) return;
                        D(e => ({
                            ...e,
                            [m.Asset.Place]: t
                        }))
                    } else i_.includes(t) && D(e => ({
                        ...e,
                        [et]: t
                    }))
                }, [D, et]),
                ev = (0, a.useCallback)(() => {
                    q(e => e === E.SortOrder.Asc ? E.SortOrder.Desc : E.SortOrder.Asc)
                }, [q]),
                ef = (0, a.useCallback)(() => {
                    T(!0)
                }, []),
                ex = (0, a.useCallback)(() => {
                    let e = !V;
                    r.logClickEvent({
                        eventName: tT.default.ImpactedExperiencesFilterClick,
                        parameters: {
                            page: "creations",
                            action: e ? "enable" : "disable",
                            assetType: et.toString()
                        }
                    }), _(e => !e)
                }, [r, V, et, _]),
                eg = et === m.Asset.MyExperiences || et === m.Asset.SharedExperiences,
                eb = (0, a.useMemo)(() => eg ? Object.values(U.SearchSortParameter).map(e => ({
                    value: e,
                    labelKey: y.universeSortTranslationKeys[e]
                })) : Object.values(nQ.EventSortBy).map(e => ({
                    value: e,
                    labelKey: y.eventSortTranslationKeys[e]
                })), [eg]),
                ey = (0, a.useMemo)(() => eg ? O[m.Asset.Place] : (0, ia.getSortForAssetType)(et, O), [eg, O, et]),
                eI = (0, a.useMemo)(() => {
                    var e, t;
                    if (!k) return !1;
                    let i = er || null == Q ? void 0 : Number(Q);
                    if (void 0 !== i && ii.AvatarMenuMap[et]) {
                        let e = ii.AvatarMenuMap[et][i];
                        if (e) return (0, io.getIsRentableType)(e.assetType, e.bundleType)
                    }
                    return (0, io.getIsRentableType)(null != (e = null == (t = n.submenuItem) ? void 0 : t.type) ? e : et, void 0)
                }, [et, Q, er, null == (t = n.submenuItem) ? void 0 : t.type, k]);
            if (ep) return null;
            let eT = et === m.Asset.MyExperiences || et === m.Asset.SharedExperiences || eu || eo || et === m.Asset.MeshPart,
                eC = et === m.Asset.MyExperiences || et === m.Asset.SharedExperiences,
                ew = et === m.Asset.Decal || et === m.Asset.MeshPart,
                eS = !en && !eI && !!(et === m.Asset.MyExperiences || eC || eu && et);
            return (0, i.jsxs)(n7.Flex, {
                flexDirection: "row",
                justifyContent: "flex-start",
                alignItems: "flex-start",
                flexWrap: "wrap",
                classes: {
                    root: p
                },
                children: [eT && (0, i.jsxs)(n7.Flex, {
                    alignItems: "center",
                    gap: 1,
                    flexDirection: "row",
                    children: [eS && (0, i.jsx)(n6.Typography, {
                        marginRight: "16px",
                        children: o("Label.ShowPrefix")
                    }), et === m.Asset.MyExperiences && (0, i.jsx)(n1.FormControlLabel, {
                        control: (0, i.jsx)(n3.Switch, {
                            checked: H,
                            onChange: () => W(e => !e),
                            "aria-label": o("Label.Public")
                        }),
                        label: o("Label.Public")
                    }), eC && (0, i.jsx)(n1.FormControlLabel, {
                        control: (0, i.jsx)(n3.Switch, {
                            checked: V,
                            onChange: ex,
                            "aria-label": o("Label.Impacted")
                        }),
                        label: o("Label.Impacted")
                    }), eI && !en && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(n$.Button, {
                            variant: "contained",
                            color: "secondary",
                            onClick: ef,
                            classes: {
                                root: v
                            },
                            children: o("Action.TimedOptions")
                        }), (0, i.jsx)(n0.Divider, {
                            orientation: "vertical",
                            flexItem: !0,
                            classes: {
                                root: x
                            }
                        })]
                    }), eu && et && (0, i.jsx)(n1.FormControlLabel, {
                        control: (0, i.jsx)(n3.Switch, {
                            checked: z,
                            onChange: () => F(e => !e),
                            "aria-label": en ? o("Action.ShowArchived") : o("Label.Archived")
                        }),
                        label: en ? o("Action.ShowArchived") : o("Label.Archived")
                    }), eo && (0, i.jsx)(n1.FormControlLabel, {
                        control: (0, i.jsx)(n3.Switch, {
                            checked: er,
                            onChange: em,
                            "aria-label": ec
                        }),
                        label: ec
                    }), en && (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(n0.Divider, {
                            orientation: "vertical",
                            flexItem: !0,
                            classes: {
                                root: x
                            }
                        }), (0, i.jsx)(nO.IconButton, {
                            "aria-label": o("Label.Settings"),
                            size: "medium",
                            color: "secondary",
                            onClick: e => N(e.currentTarget),
                            children: (0, i.jsx)(n8.SettingsIcon, {})
                        }), (0, i.jsxs)(n2.Menu, {
                            anchorEl: L,
                            open: null != L,
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
                            children: [eI && (0, i.jsx)(n4.MenuItem, {
                                onClick: () => {
                                    N(null), ef()
                                },
                                children: (0, i.jsx)(n6.Typography, {
                                    variant: "body1",
                                    children: o("Action.TimedOptions")
                                })
                            }), (0, i.jsx)(n4.MenuItem, {
                                onClick: () => {
                                    N(null), A(e => e + 1), w(!0)
                                },
                                children: (0, i.jsx)(n6.Typography, {
                                    variant: "body1",
                                    children: o("Action.StudioPublishSettings")
                                })
                            })]
                        })]
                    }), ew && (0, i.jsx)(n1.FormControlLabel, {
                        control: (0, i.jsx)(n3.Switch, {
                            "aria-label": o("Label.OnCreatorStore"),
                            checked: Y,
                            onChange: () => J(e => !e)
                        }),
                        label: o("Label.OnCreatorStore")
                    })]
                }), ed && (0, i.jsxs)(n7.Flex, {
                    flexDirection: "row",
                    classes: {
                        root: h
                    },
                    alignItems: "center",
                    flexWrap: "nowrap",
                    children: [(0, i.jsx)(n5.Select, {
                        variant: "outlined",
                        margin: "dense",
                        size: "small",
                        label: o("Label.SortBy"),
                        value: ey,
                        onChange: eh,
                        inputProps: {
                            "aria-label": o("Label.SortBy")
                        },
                        children: eb.map(e => (0, i.jsx)(n4.MenuItem, {
                            value: e.value,
                            children: o(e.labelKey)
                        }, e.value))
                    }), (0, i.jsx)(nO.IconButton, {
                        "aria-label": o("Heading.SortOrder"),
                        onClick: ev,
                        size: "large",
                        children: B === E.SortOrder.Asc ? (0, i.jsx)(nZ.ArrowUpwardIcon, {
                            color: "secondary"
                        }) : (0, i.jsx)(nX.ArrowDownwardIcon, {
                            color: "secondary"
                        })
                    })]
                }), (0, i.jsx)(iV, {
                    open: b,
                    onClose: () => T(!1)
                }), (0, i.jsx)(ij, {
                    open: C || ea,
                    onClose: es
                }, S)]
            })
        },
        iK = e => {
            let {
                menuState: t,
                onMenuStateChange: n,
                verificationMetadata: a,
                group: s
            } = e, o = [m.Asset.UpcomingEvent, m.Asset.PastEvent, m.Asset.DraftEvent], r = !!t.submenuItem && o.includes(t.submenuItem.type);
            return (0, i.jsxs)("div", {
                className: "flex justify-between padding-top-small",
                children: [t.menuItem.type === m.Asset.TShirt && (0, i.jsx)(nL, {
                    data: a
                }), !r && (0, i.jsx)("div", {
                    className: "flex width-full padding-bottom-large [align-content:flex-start] [row-gap:12px] justify-between flex-row items-start wrap",
                    children: t.menuItem.type === m.Asset.Moments ? (0, i.jsxs)(i.Fragment, {
                        children: [(0, i.jsx)(nE, {}), (0, i.jsx)(nM, {})]
                    }) : (0, i.jsxs)(i.Fragment, {
                        children: [t.submenuItem && (0, i.jsx)(nJ, {
                            menuState: t,
                            onMenuStateChange: n,
                            group: s
                        }), (0, i.jsx)(iW, {
                            menuState: t
                        })]
                    })
                })]
            })
        };
    var iY = e.i(812077),
        iJ = e.i(71375),
        iQ = e.i(83560),
        iX = e.i(576069),
        iZ = e.i(134817);
    let i$ = [];

    function i0(e) {
        return null != e.universeId ? e.universeId : "experienceId" in e && "number" == typeof e.experienceId ? e.experienceId : void 0
    }
    var i1 = e.i(517359),
        i2 = e.i(986939);
    let i4 = (e, t) => {
            let {
                user: n
            } = (0, P.useAuthentication)(), {
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
                    tR(tw.LoadLocalVideoMedia, n);
                    try {
                        let i = await ey(r, e);
                        t || (u(i), null != i && tL(tw.LoadLocalVideoMedia, n))
                    } catch (n) {
                        tP(tw.LoadLocalVideoMedia, n, {
                            draftId: e
                        }), t || u(null)
                    }
                })(), () => {
                    t = !0
                }
            }, [e, i, l, r]), l) ? l : i ? d : null
        },
        i5 = "block width-full height-full max-w-full max-h-full object-contain",
        i8 = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)("div", {
                className: "flex items-center justify-center radius-medium bg-surface-200 width-full shrink-0 overflow-hidden h-[240px]",
                "data-testid": "moments-video-preview-container",
                children: t
            })
        },
        i3 = e => {
            let {
                thumbnailUrl: t,
                videoUrl: n
            } = e;
            return n ? (0, i.jsx)(i8, {
                children: (0, i.jsx)("video", {
                    "aria-label": "Moment video preview",
                    className: "radius-medium ".concat(i5),
                    controls: !0,
                    playsInline: !0,
                    poster: t,
                    src: n,
                    children: (0, i.jsx)("track", {
                        kind: "captions"
                    })
                })
            }) : t ? (0, i.jsx)(i8, {
                children: (0, i.jsx)("img", {
                    alt: "Moment thumbnail preview",
                    className: "radius-medium ".concat(i5),
                    src: t
                })
            }) : (0, i.jsx)(i8, {})
        },
        i6 = (0, s.withTranslation)(e => {
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
            } = (0, s.useLocalization)(), g = t5(), b = tU(x), [y, I] = (0, a.useState)(() => {
                var e, t, n, i;
                let a;
                return r && ((a = {
                    id: null != (i = i0(n = r)) ? i : 0,
                    name: n.experienceName
                }).id > 0 || (null != (e = null == (t = a.name) ? void 0 : t.length) ? e : 0) > 0) ? a : void 0
            }), [T, C] = (0, a.useState)(() => {
                var e;
                return null != (e = null == r ? void 0 : r.description) ? e : ""
            }), [w, S] = (0, a.useState)(), A = null != (t = null != w ? w : null == r ? void 0 : r.locale) ? t : b, M = (null == r ? void 0 : r.status) === ea && !0 === r.hasLocalVideo, j = i4((null == r ? void 0 : r.status) === ea ? r.draftId : null, {
                enabled: l && M,
                thumbnailUrl: null == r ? void 0 : r.thumbnailUrl,
                videoUrl: null == r ? void 0 : r.videoUrl
            }), P = (0, a.useCallback)(() => {
                r && !v && null == p && (null == c || c(r))
            }, [v, r, c, p]), E = (0, a.useCallback)(() => {
                r && h !== t8(r) && (null == m || m(r))
            }, [h, r, m]), k = (0, a.useCallback)(e => {
                r && e.id && e.name && (I(e), null == u || u(r, {
                    experienceId: e.id,
                    rootPlaceId: e.rootPlaceId,
                    experienceName: e.name
                }))
            }, [r, u]), R = (0, a.useCallback)(e => {
                C(e.target.value)
            }, []), L = (0, a.useCallback)(e => {
                S(e), r && e !== r.locale && (null == u || u(r, {
                    locale: e
                }))
            }, [r, u]), N = (0, a.useCallback)(() => {
                r && T !== r.description && (null == u || u(r, {
                    description: T
                }))
            }, [T, r, u]), O = (0, a.useCallback)(() => {
                N()
            }, [N]), D = (0, a.useCallback)(e => {
                e || N(), d(e)
            }, [N, d]);
            if (!r) return null;
            let U = t8(r),
                B = null != p && p === U,
                q = null != p,
                z = null != h && h === U,
                F = r.status === en,
                V = r.status === ea,
                G = V && !B,
                _ = !F && null != c && (V && M || B),
                H = null != m,
                W = T.length >= 140;
            return (0, i.jsx)(i1.SheetRoot, {
                open: l,
                onOpenChange: D,
                children: (0, i.jsxs)(i1.SheetContent, {
                    closeLabel: f("Action.Close"),
                    largeScreenVariant: "side",
                    children: [(0, i.jsx)(i1.SheetTitle, {
                        children: f("Heading.EditMoment")
                    }), (0, i.jsxs)(i1.SheetBody, {
                        className: "flex flex-col gap-y-medium padding-top-small padding-bottom-large",
                        children: [(0, i.jsx)(i3, {
                            thumbnailUrl: null != (n = null == j ? void 0 : j.thumbnailUrl) ? n : r.thumbnailUrl,
                            videoUrl: null != (o = null == j ? void 0 : j.videoUrl) ? o : r.videoUrl
                        }), G ? (0, i.jsx)(i.Fragment, {
                            children: y ? (0, i.jsx)(nt, {
                                experience: y,
                                onChangeExperience: () => I(void 0)
                            }) : (0, i.jsx)(nu, {
                                onExperienceResolved: k
                            })
                        }) : y ? (0, i.jsxs)("div", {
                            className: "flex flex-col gap-y-xsmall width-full margin-top-small",
                            children: [(0, i.jsx)("span", {
                                className: "text-body-small content-muted",
                                children: f("CreateMomentModal.ExperienceInput.Label")
                            }), (0, i.jsx)(nt, {
                                experience: y,
                                hideTitle: !0
                            })]
                        }) : null, g ? (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: G ? (0, i.jsx)(nh, {
                                value: A,
                                onChange: L,
                                isDisabled: B
                            }) : (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)("span", {
                                    className: "text-body-small content-muted",
                                    children: f("CreateMomentModal.LanguageInput.Label")
                                }), (0, i.jsx)("span", {
                                    "data-testid": "edit-moment-content-language-readonly",
                                    children: tq(r.locale)
                                })]
                            })
                        }) : null, (0, i.jsx)("div", {
                            className: "flex flex-col gap-y-xsmall width-full padding-top-small",
                            children: G ? (0, i.jsxs)(i.Fragment, {
                                children: [(0, i.jsx)(i2.TextArea, {
                                    id: "edit-moment-description-".concat(U),
                                    label: f("MomentsTable.Header.Description"),
                                    rows: 3,
                                    placeholder: f("MomentsTable.Placeholders.Description"),
                                    size: "Small",
                                    value: T,
                                    maxLength: 140,
                                    onBlur: O,
                                    onChange: R
                                }), (0, i.jsx)("span", {
                                    "aria-live": "polite",
                                    className: W ? "text-body-small content-system-alert text-align-x-right" : "text-body-small content-muted text-align-x-right",
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
                    }), (0, i.jsx)(i1.SheetActions, {
                        className: "width-full",
                        children: (0, i.jsxs)("div", {
                            className: "flex gap-small width-full",
                            children: [_ ? (0, i.jsx)(J.Button, {
                                variant: "Emphasis",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: v || q,
                                isLoading: B,
                                onClick: P,
                                children: f("Action.Publish")
                            }) : null, H ? (0, i.jsx)(J.Button, {
                                variant: "Standard",
                                size: "Medium",
                                type: "button",
                                className: "grow-1 basis-0 min-width-0",
                                isDisabled: z,
                                isLoading: z,
                                onClick: E,
                                children: (0, i.jsx)("span", {
                                    className: "content-action-alert",
                                    children: f("Action.Delete")
                                })
                            }) : null]
                        })
                    })]
                })
            })
        }, [_.TranslationNamespace.Creations, _.TranslationNamespace.Controls]);
    var i9 = e.i(607895),
        i7 = e.i(493924);
    let ae = e => {
        let {
            onCreateClick: t
        } = e, {
            translate: n
        } = (0, s.useTranslation)();
        return (0, i.jsx)(i7.default, {
            title: n("Heading.ReachPlayersDirectlyInMoments"),
            size: "large",
            illustration: "videos",
            description: (0, i.jsxs)(i.Fragment, {
                children: [n("Description.UploadExternalVideosToMoments"), " ", (0, i.jsx)(i9.Link, {
                    "aria-label": n("Label.LearnMore"),
                    href: nk.MOMENTS_LEARN_MORE_URL,
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
    var at = e.i(197649),
        an = e.i(659332),
        ai = e.i(369114),
        aa = e.i(515351),
        as = e.i(125677),
        ao = e.i(20227),
        ar = e.i(494601);
    let al = {
            [en]: "bg-system-success",
            [ei]: "bg-system-warning",
            [ea]: "bg-surface-300",
            [es]: "bg-system-alert"
        },
        ad = e => {
            let {
                status: t,
                label: n
            } = e;
            return (0, i.jsxs)("span", {
                className: "inline-flex items-center gap-xsmall",
                children: [(0, i.jsx)("span", {
                    "aria-hidden": !0,
                    className: "size-[8px] radius-circle shrink-0 ".concat(al[t]),
                    "data-testid": "moment-status-dot-".concat(t)
                }), (0, i.jsx)("span", {
                    children: n
                })]
            })
        };
    var au = e.i(905943),
        ac = e.i(751846),
        am = e.i(930047);
    let ap = (0, s.withTranslation)(e => {
            let t, {
                    moment: n
                } = e,
                {
                    translate: o
                } = (0, s.useTranslation)(),
                r = n.status === ea,
                l = r && !0 === n.hasLocalVideo,
                d = i4(r ? n.draftId : null, {
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
                children: (0, i.jsx)(ac.Thumbnail2d, {
                    alt: "",
                    containerClass: "block",
                    imgClassName: "[object-fit:cover]",
                    returnPolicy: ac.ReturnPolicy.PlaceHolder,
                    targetId: u,
                    type: ac.ThumbnailTypes.assetThumbnail
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
                children: (0, i.jsx)(am.RobloxVideoPlayer, {
                    videoAssetId: String(u),
                    environment: "production",
                    src: void 0,
                    autoPlay: !0,
                    disableControls: !0,
                    loop: !0,
                    muted: !0
                })
            })), h) ? (0, i.jsxs)(au.Popover, {
                open: c,
                onOpenChange: m,
                children: [(0, i.jsx)(au.PopoverAnchor, {
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
                }), (0, i.jsx)(au.PopoverContent, {
                    align: "start",
                    ariaLabel: p,
                    className: "outline-none",
                    side: "bottom",
                    children: x
                })]
            }) : t
        }, [_.TranslationNamespace.Creations]),
        ah = [10, 25, 50],
        av = {
            [en]: "MomentsTable.NoActiveMoments",
            [ea]: "MomentsTable.NoDraftMoments"
        },
        af = e => {
            let {
                moment: t,
                disabled: n,
                onBlur: o
            } = e, {
                translate: r
            } = (0, s.useTranslation)(), l = t8(t), [d, u] = (0, a.useState)(t.description), c = d.length >= 140, m = (0, a.useCallback)(e => {
                u(e.target.value)
            }, []), p = (0, a.useCallback)(e => {
                o(t, e)
            }, [t, o]);
            return (0, i.jsxs)("div", {
                className: "flex width-full flex-col gap-y-xsmall",
                children: [(0, i.jsx)(nn.TextInput, {
                    id: "moment-description-".concat(l),
                    "aria-label": r("MomentsTable.Header.Description"),
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
        ax = e => {
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
            } = (0, s.useTranslation)(), h = t8(t), v = t.status === ea, f = (0, a.useCallback)(() => {
                u(t)
            }, [t, u]), x = (0, a.useCallback)(() => {
                t.status === ea && (null == m || m(t.draftId))
            }, [t, m]);
            return (0, i.jsxs)(ai.TableRow, {
                isHoverable: !0,
                "data-testid": "moment-row-".concat(h),
                children: [(0, i.jsx)(ai.TableCell, {
                    children: (0, i.jsx)(ap, {
                        moment: t
                    })
                }), (0, i.jsx)(ai.TableCell, {
                    children: t.experienceName
                }), (0, i.jsx)(ai.TableCell, {
                    children: t.status === en ? (0, i.jsx)("span", {
                        "data-testid": "moment-description-".concat(h),
                        children: t.description || "-"
                    }) : (0, i.jsx)(af, {
                        moment: t,
                        disabled: null != o && o === h,
                        onBlur: c
                    }, "moment-description-".concat(h, "-").concat(t.modifiedAt))
                }), l ? (0, i.jsx)(ai.TableCell, {
                    children: (0, i.jsx)("span", {
                        "data-testid": "moment-content-language-".concat(h),
                        children: tq(t.locale)
                    })
                }) : null, (0, i.jsx)(ai.TableCell, {
                    children: (0, i.jsx)(ad, {
                        label: d,
                        status: t.status
                    })
                }), (0, i.jsx)(ai.TableCell, {
                    align: "end",
                    children: (0, i.jsxs)("div", {
                        className: "inline-flex items-center gap-xsmall",
                        children: [(0, i.jsx)(aa.Tooltip, {
                            position: "top-center",
                            title: n,
                            children: (0, i.jsx)(aa.TooltipTrigger, {
                                asChild: !0,
                                children: (0, i.jsx)(an.IconButton, {
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
                            isDisabled: r || null != o,
                            onClick: x,
                            children: p("Action.Publish")
                        }) : null]
                    })
                })]
            })
        },
        ag = (0, s.withTranslation)(e => {
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
            } = (0, ar.default)(), {
                statusTab: f
            } = t9(), x = t5(), g = (0, a.useCallback)(e => {
                switch (e) {
                    case en:
                        return p("MomentsTable.Pills.Active");
                    case ei:
                        return p("MomentsTable.Pills.Pending");
                    case ea:
                        return p("MomentsTable.Pills.Draft");
                    case es:
                        return p("MomentsTable.Pills.Moderated");
                    default:
                        return e
                }
            }, [p]), b = f === en, y = (0, a.useMemo)(() => f === ea ? t.filter(e => e.status === ea || e.status === ei) : t.filter(e => e.status === f), [t, f]), {
                page: I,
                rowsPerPage: T,
                onPageChange: C,
                onRowsPerPageChange: w
            } = (0, ao.useTablePagination)({
                count: y.length,
                initialRowsPerPage: 10,
                resetKey: f
            }), {
                currentPage: S
            } = (0, as.useCurrentPage)(y, {
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
                    className: (0, at.clsx)(v, "flex flex-col gap-xlarge width-full self-stretch"),
                    children: (0, i.jsxs)("div", {
                        className: "flex flex-col gap-y-medium width-full",
                        children: [(0, i.jsxs)(ai.Table, {
                            className: "width-full",
                            variant: "Framed",
                            children: [(0, i.jsx)(ai.TableHeader, {
                                children: (0, i.jsxs)(ai.TableRow, {
                                    children: [(0, i.jsx)(ai.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Moments")
                                    }), (0, i.jsx)(ai.TableHeaderCell, {
                                        children: p("MomentsTable.Header.ExperienceName")
                                    }), (0, i.jsx)(ai.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Description")
                                    }), x ? (0, i.jsx)(ai.TableHeaderCell, {
                                        children: p("CreateMomentModal.LanguageInput.Label")
                                    }) : null, (0, i.jsx)(ai.TableHeaderCell, {
                                        children: p("MomentsTable.Header.Status")
                                    }), (0, i.jsx)(ai.TableHeaderCell, {
                                        align: "end",
                                        children: " "
                                    })]
                                })
                            }), (0, i.jsx)(ai.TableBody, {
                                children: 0 === y.length ? (0, i.jsx)(ai.TableRow, {
                                    children: (0, i.jsx)(ai.TableCell, {
                                        colSpan: x ? 6 : 5,
                                        align: "center",
                                        className: "padding-y-xxlarge",
                                        children: (0, i.jsx)("span", {
                                            className: "text-body-medium content-muted block padding-y-xxlarge",
                                            "data-testid": "moments-table-empty-filter-message",
                                            children: p(av[f])
                                        })
                                    })
                                }) : S.map(e => (0, i.jsx)(ax, {
                                    moment: e,
                                    editLabel: j,
                                    publishingDraftId: l,
                                    isPublishDisabled: d,
                                    showContentLanguageColumn: x,
                                    statusLabel: g(e.status),
                                    onEditMoment: n,
                                    onDescriptionBlur: A,
                                    onPublishMoment: r
                                }, t8(e)))
                            })]
                        }), y.length > 0 ? (0, i.jsx)(ai.TablePagination, {
                            page: I,
                            rowsPerPage: T,
                            totalRows: y.length,
                            rowsPerPageOptions: ah,
                            onPageChange: M,
                            onRowsPerPageChange: w
                        }) : null]
                    })
                })
            })
        }, [_.TranslationNamespace.Creations, _.TranslationNamespace.Controls]),
        ab = (0, s.withTranslation)(e => {
            let {
                onRetry: t
            } = e, {
                translate: n
            } = (0, s.useTranslation)();
            return (0, i.jsx)(Q.Alert, {
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
        }, [_.TranslationNamespace.Error]);
    var ay = e.i(917852);
    let aI = () => {
            window.open(ay.idVerificationActionUrl, "_blank", "noopener,noreferrer")
        },
        aT = (0, s.withTranslation)(() => {
            let {
                translate: e
            } = (0, s.useTranslation)();
            return (0, i.jsx)(Q.Alert, {
                className: "width-full",
                variant: "Feedback",
                severity: "Warning",
                hasCloseAffordance: !1,
                primaryActionLabel: e("Label.VerifyId"),
                onPrimaryAction: aI,
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
        }, [_.TranslationNamespace.Creations]),
        aC = () => {
            var e;
            (() => {
                let {
                    user: e
                } = (0, P.useAuthentication)(), t = null == e ? void 0 : e.id;
                (0, a.useEffect)(() => () => {
                    void 0 !== t && (() => {
                        for (let e of eu.keys()) {
                            let t = eu.get(e);
                            t && (URL.revokeObjectURL(t.thumbnailUrl), URL.revokeObjectURL(t.videoUrl), eu.delete(e))
                        }
                    })()
                }, [t])
            })();
            let {
                translate: t
            } = (0, s.useTranslation)(), {
                user: n
            } = (0, P.useAuthentication)(), o = null == n ? void 0 : n.id, {
                data: r,
                isLoading: l,
                isError: d,
                refetch: c
            } = (0, iX.useCreatorEligibility)(), m = null != (e = null == r ? void 0 : r.creatorEligibility.includes(iY.CreatorEligibilityEnum.IdVerified)) && e, p = l || d || !m, h = !l && !d && !m, v = (0, a.useCallback)(() => {
                c()
            }, [c]), [f, x] = (0, a.useState)(!1), [g, b] = (0, a.useState)(null), [y, I] = (0, a.useState)({}), {
                moments: C,
                updateMoment: w,
                removeMoment: S
            } = ek(), {
                publishMoment: A,
                publishingDraftId: M,
                isPublishing: j
            } = function() {
                var e;
                let {
                    translate: t
                } = (0, s.useTranslation)(), {
                    locale: n
                } = (0, s.useLocalization)(), i = t5(), o = (() => {
                    let {
                        ready: e,
                        value: t
                    } = (0, u.useFlag)(T.isMomentsPostCreationEnabled);
                    return e && null != t && t
                })(), {
                    user: r
                } = (0, P.useAuthentication)(), l = null == r ? void 0 : r.id, {
                    mutateAsync: d,
                    isPending: c,
                    variables: m
                } = (0, eO.useMutation)({
                    mutationFn: async e => {
                        let {
                            moment: a
                        } = e;
                        if (null == l) throw Error("Authenticated user is required to publish a moment");
                        let s = await eb(l, a.draftId);
                        if (!s) throw Error("Local moment video is required before publishing");
                        return await t2({
                            moment: a,
                            file: s,
                            userId: l,
                            uiLocale: n,
                            sendVideoContentLanguage: i,
                            usePostCreation: o,
                            displayName: t("Label.PublishMomentDisplayName") || "Creator Hub Moment"
                        }), a
                    }
                });
                return {
                    publishMoment: (0, a.useCallback)(e => d({
                        moment: e
                    }), [d]),
                    publishingDraftId: c && null != (e = null == m ? void 0 : m.moment.draftId) ? e : null,
                    isPublishing: c
                }
            }(), E = (0, a.useRef)(!1), {
                deleteMoment: k,
                deletingMomentKey: R
            } = function() {
                let {
                    user: e
                } = (0, P.useAuthentication)(), t = (0, eR.useQueryClient)(), n = null == e ? void 0 : e.id, i = t4(), {
                    mutateAsync: s,
                    isPending: o,
                    variables: r
                } = (0, eO.useMutation)({
                    mutationFn: e => {
                        let {
                            moment: t
                        } = e;
                        return tY({
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
                            e.setQueryData(t6(t, i), e => (null == e ? void 0 : e.pages.length) ? {
                                ...e,
                                pages: e.pages.map(e => ({
                                    ...e,
                                    moments: e.moments.filter(e => t8(e) !== n)
                                }))
                            } : e)
                        }(t, n, t8(s), i)
                    }
                });
                return {
                    deleteMoment: (0, a.useCallback)(e => s({
                        moment: e
                    }), [s]),
                    deletingMomentKey: o && null != r ? t8(r.moment) : null,
                    isDeleting: o
                }
            }(), {
                statusTab: L
            } = t9(), {
                serverMoments: N,
                isAllServerMomentsLoaded: O,
                hasNextPage: D,
                fetchNextPage: U,
                error: B,
                isPending: z,
                isFetchingNextPage: F,
                isFetchNextPageError: V,
                errorUpdatedAt: G,
                loadedPageCount: _,
                refetch: H,
                serverPageSize: W
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
                        } = (0, P.useAuthentication)(), t = null == e ? void 0 : e.id, n = t4();
                        return (0, eN.useInfiniteQuery)({
                            queryKey: t6(t, n),
                            queryFn: null != t ? e => {
                                let {
                                    pageParam: i
                                } = e;
                                return tW(t, i, n)
                            } : eL.skipToken,
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
                            for (let e of n.moments) t.set(t8(e), e);
                        return [...t.values()]
                    }(n.pages) : i$, [n]),
                    p = null != (e = null == n ? void 0 : n.pages.length) ? e : 0,
                    h = (0, a.useCallback)(() => {
                        r({
                            cancelRefetch: !1,
                            throwOnError: !1
                        })
                    }, [r]),
                    v = l && !u;
                (0, iZ.useBackgroundPageLoader)({
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
            }(), K = (0, a.useMemo)(() => [...N, ...C].map(e => {
                let t = y[t8(e)];
                return t ? {
                    ...e,
                    ...t
                } : e
            }), [C, y, N]), Y = (0, a.useMemo)(() => K.filter(e => e.status !== es), [K]), J = Y.length > 0, Q = (0, a.useRef)(0);
            (0, a.useEffect)(() => {
                !B || z || V || G <= Q.current || (Q.current = G, tP(tw.ListMoments, B, {
                    userId: o,
                    pageCount: _
                }))
            }, [B, G, V, z, _, o]);
            let X = (0, a.useRef)(!1);
            (0, a.useEffect)(() => {
                if (!V || F) {
                    X.current = !1;
                    return
                }
                B && !X.current && (X.current = !0, tP(tw.FetchNextPage, B, {
                    userId: o,
                    pageCount: _
                }))
            }, [B, V, F, _, o]);
            let Z = (0, a.useMemo)(() => {
                    var e;
                    if (!g) return null;
                    let t = t8(g);
                    return null != (e = K.find(e => t8(e) === t)) ? e : g
                }, [g, K]),
                $ = (0, a.useCallback)(e => {
                    b(e), x(!0)
                }, []),
                ee = (0, a.useCallback)(e => {
                    x(e), e || b(null)
                }, []),
                et = (0, a.useCallback)(() => {
                    H()
                }, [H]),
                en = (0, a.useCallback)(() => {
                    (0, iQ.toast)({
                        title: t("Message.MomentPublishedError")
                    })
                }, [t]),
                ei = (0, a.useCallback)(() => {
                    (0, iQ.toast)({
                        title: t("Message.MomentUploading")
                    })
                }, [t]),
                eo = (0, a.useCallback)(() => {
                    (0, iQ.toast)({
                        title: t("Message.MomentProcessing")
                    })
                }, [t]),
                er = (0, a.useCallback)(() => {
                    (0, iQ.toast)({
                        title: t("Message.MomentDeletedError")
                    })
                }, [t]),
                el = (0, a.useCallback)(async e => {
                    let t = e.status === ea,
                        n = t8(e),
                        i = {
                            ...t ? {
                                draftId: e.draftId
                            } : {
                                momentId: e.momentId,
                                feedItemId: e.feedItemId
                            },
                            experienceId: i0(e),
                            isLocalMoment: t,
                            userId: o
                        };
                    tR(tw.DeleteMoment, i);
                    try {
                        e.status === ea ? S(e.draftId) : await k(e), I(e => {
                            if (!(n in e)) return e;
                            let {
                                [n]: t, ...i
                            } = e;
                            return i
                        }), x(!1), b(null), tL(tw.DeleteMoment, i)
                    } catch (e) {
                        tP(tw.DeleteMoment, e, i), er()
                    }
                }, [k, S, er, o]),
                ed = (0, a.useCallback)((e, t) => {
                    if (e.status === ea) return void w(e.draftId, t);
                    let n = t8(e),
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
                ec = (0, a.useCallback)(async e => {
                    if (E.current || j || p) return;
                    let t = C.find(t => t.draftId === e);
                    if (!t) return;
                    E.current = !0;
                    let n = {
                        draftId: e,
                        experienceId: i0(t),
                        isLocalMoment: !0,
                        userId: o
                    };
                    tR(tw.PublishMoment, n), ei();
                    try {
                        await A(t), S(e), x(!1), b(null), tL(tw.PublishMoment, n), eo()
                    } catch (e) {
                        tP(tw.PublishMoment, e, n), en()
                    } finally {
                        E.current = !1
                    }
                }, [p, j, C, A, S, en, ei, eo, o]),
                em = (0, a.useCallback)(e => {
                    e.status === ea && ec(e.draftId)
                }, [ec]);
            return B && L !== ea && !J ? (0, i.jsx)(iJ.default, {
                onReload: et
            }) : (!z || J) && (O || J) ? (0, i.jsxs)("div", {
                className: "flex grow-1 flex-col gap-medium self-stretch width-full",
                children: [d ? (0, i.jsx)(ab, {
                    onRetry: v
                }) : null, h ? (0, i.jsx)(aT, {}) : null, J ? (0, i.jsx)(ag, {
                    moments: Y,
                    hasNextPage: D,
                    fetchNextPage: U,
                    serverPageSize: W,
                    onEditMoment: $,
                    onMomentMetadataChange: ed,
                    onPublishMoment: ec,
                    publishingDraftId: M,
                    isPublishDisabled: p
                }) : (0, i.jsx)("div", {
                    className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                    children: (0, i.jsx)(ae, {
                        onCreateClick: nS
                    })
                }), (0, i.jsx)(i6, {
                    moment: Z,
                    open: f,
                    onOpenChange: ee,
                    onMomentMetadataChange: ed,
                    onDelete: Z ? el : void 0,
                    onPublish: (null == Z ? void 0 : Z.status) === ea ? em : void 0,
                    publishingDraftId: M,
                    deletingMomentKey: R,
                    isPublishDisabled: p
                }, Z ? t8(Z) : void 0)]
            }) : (0, i.jsx)("div", {
                className: "flex grow-1 flex-col items-center justify-center self-stretch width-full",
                children: (0, i.jsx)(q.ProgressCircle, {
                    ariaLabel: t("Label.Loading"),
                    size: "Large",
                    variant: "Indeterminate"
                })
            })
        },
        aw = {
            width: "100%",
            height: "100%"
        },
        aS = (0, nB.makeStyles)()(e => ({
            section: {
                ...aw
            },
            container: {
                ...aw
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
        aA = (0, D.default)(() => e.A(202045), {
            loadableGenerated: {
                modules: [623728]
            },
            ssr: !1
        }),
        aM = (0, D.default)(() => e.A(378869), {
            loadableGenerated: {
                modules: [518808]
            },
            ssr: !1
        }),
        aj = (0, D.default)(() => e.A(580854), {
            loadableGenerated: {
                modules: [427685]
            },
            ssr: !1
        }),
        aP = (0, D.default)(() => e.A(307640), {
            loadableGenerated: {
                modules: [48220]
            },
            ssr: !1
        }),
        aE = (0, D.default)(() => e.A(114198), {
            loadableGenerated: {
                modules: [595604]
            },
            ssr: !1
        }),
        ak = (0, D.default)(() => e.A(558217), {
            loadableGenerated: {
                modules: [333771]
            },
            ssr: !1
        }),
        aR = (0, D.default)(() => e.A(546234), {
            loadableGenerated: {
                modules: [82873]
            },
            ssr: !1
        }),
        aL = (0, D.default)(() => e.A(85397), {
            loadableGenerated: {
                modules: [973472]
            },
            ssr: !1
        }),
        aN = (0, D.default)(() => e.A(890748), {
            loadableGenerated: {
                modules: [835459]
            },
            ssr: !1
        }),
        aO = (0, D.default)(() => e.A(68996), {
            loadableGenerated: {
                modules: [565869]
            },
            ssr: !1
        }),
        aD = (0, D.default)(() => e.A(441969), {
            loadableGenerated: {
                modules: [415945]
            },
            ssr: !1
        }),
        aU = (0, D.default)(() => e.A(481709), {
            loadableGenerated: {
                modules: [947274]
            },
            ssr: !1
        }),
        aB = (0, D.default)(() => e.A(272047), {
            loadableGenerated: {
                modules: [616027]
            },
            ssr: !1
        });

    function aq(e) {
        let t = (0, h.readQueryValue)(e);
        return void 0 === t ? m.Asset.MyExperiences : (0, p.isValidEnumValue)(m.Asset, t) ? t : m.Asset.MyExperiences
    }
    let az = (0, s.withTranslation)(e => {
            let {
                verificationMetadata: t,
                currentGroup: n,
                currentUser: o,
                allowedAssetTypes: r
            } = e, [l, d] = (0, G.useQueryParams)(["activeTab", "filterIndex"]), {
                resetAllFilters: u
            } = (0, K.default)(), {
                settings: c
            } = (0, x.useSettings)(), p = C(), h = (0, nH.default)(), v = (0, nW.default)(), {
                translate: f
            } = (0, s.useTranslation)(), T = (0, b.default)(), w = (0, a.useRef)(void 0), S = (0, a.useMemo)(() => [], []), A = (0, g.isTaxonomyActiveTab)(l.activeTab), M = A || (0, g.isRecentsActiveTab)(l.activeTab), j = (0, a.useMemo)(() => {
                let e = (0, g.isAllAssetTypesActiveTab)(l.activeTab) ? m.Asset.AllCatalogAsset : g.TAXONOMY_HOST_ASSET;
                return I.default.getMenuState(M ? e : aq(l.activeTab), S)
            }, [l.activeTab, S, M]);
            (0, a.useEffect)(() => {
                (0, g.isRecentsActiveTab)(l.activeTab) && d({
                    activeTab: A ? (0, g.buildTaxonomyActiveTab)(g.ALL_ASSET_TYPES_L1_KEY) : m.Asset.AllCatalogAsset,
                    filterIndex: 0
                })
            }, [l.activeTab, A, d]);
            let P = (0, a.useMemo)(() => y.default.filter(e => !S.includes(e.type)), [S]),
                {
                    classes: {
                        section: E,
                        container: k
                    }
                } = aS(),
                R = (0, a.useCallback)(e => {
                    if (j.menuItem === e.menuItem && j.submenuItem === e.submenuItem) return;
                    if ((0, g.shouldOpenTaxonomyView)({
                            isTaxonomyEnabled: T,
                            isChangingSection: j.menuItem !== e.menuItem,
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
                }, [j.menuItem, j.submenuItem, d, T]),
                L = (0, a.useMemo)(() => {
                    let e = aq(l.activeTab);
                    if (void 0 === p && e === m.Asset.Moments || void 0 === v && e === m.Asset.Showcase) return j;
                    let t = aq(l.activeTab) === m.Asset.TextDocument;
                    if (void 0 === h && t) return j;
                    let i = I.default.getValidMenuState(P, j, c, n, void 0, void 0, p, v, h);
                    if (i !== j) {
                        if (!A) {
                            let e = (0, W.isOnItemTab)(i.menuItem.type) ? 0 : void 0;
                            d({
                                activeTab: I.default.getAssetType(i),
                                filterIndex: e
                            })
                        }
                        return i
                    }
                    return j
                }, [P, j, A, l.activeTab, c, n, p, h, v, d]),
                N = (0, a.useMemo)(() => I.default.getAssetType(L), [L]);
            (0, a.useEffect)(() => {
                if (void 0 === w.current) {
                    w.current = N;
                    return
                }
                let e = w.current;
                e !== N && (w.current = N, (0, Y.isDevelopmentItemAsset)(e, h) && (0, Y.isDevelopmentItemAsset)(N, h) || u())
            }, [N, h, u]);
            let O = N === m.Asset.MyExperiences || N === m.Asset.SharedExperiences,
                D = (0, a.useMemo)(() => null == r ? void 0 : r.has(N), [N, r]),
                _ = (0, Y.isDevelopmentItemAsset)(N, h),
                J = (0, a.useMemo)(() => {
                    var e, t;
                    return _ ? (0, i.jsx)(aU, {
                        groupId: null == n ? void 0 : n.id,
                        useTabNavigationSpacing: !1,
                        userId: null == o ? void 0 : o.id
                    }) : N === m.Asset.Decal ? (0, i.jsx)(aj, {
                        groupId: null == n ? void 0 : n.id
                    }) : N === m.Asset.Animation ? (0, i.jsx)(aM, {
                        groupId: null == n ? void 0 : n.id
                    }) : N === m.Asset.Audio || N === m.Asset.Video ? (0, i.jsx)(aP, {
                        mediaAssetType: N,
                        groupId: null == n ? void 0 : n.id
                    }) : N === m.Asset.Plugin ? (0, i.jsx)(aR, {
                        groupId: null == n ? void 0 : n.id
                    }) : N === m.Asset.Model ? (0, i.jsx)(ak, {
                        groupId: null == n ? void 0 : n.id
                    }) : N === m.Asset.MeshPart ? (0, i.jsx)(aE, {
                        groupId: null == n ? void 0 : n.id
                    }) : N === m.Asset.TextDocument ? (0, i.jsx)("div", {
                        className: "flex justify-center items-center padding-y-xxlarge",
                        children: (0, i.jsx)(q.ProgressCircle, {
                            ariaLabel: f("Label.Loading"),
                            size: "Large",
                            variant: "Indeterminate"
                        })
                    }) : N === m.Asset.ShareLink ? (0, i.jsx)(aO, {}) : N === m.Asset.Moments ? (0, i.jsx)(aC, {}) : N === m.Asset.AssetPermissionRequests ? (0, i.jsx)(aB, {}) : N === m.Asset.Showcase ? (0, i.jsx)(aL, {
                        groupId: null == n ? void 0 : n.id
                    }) : N === m.Asset.AllCatalogAsset || N === m.Asset.AvatarLooks || N === m.Asset.AvatarBackground ? (0, i.jsx)(aA, {
                        assetType: N,
                        groupId: null == n ? void 0 : n.id
                    }) : N === m.Asset.Image || N === m.Asset.Mesh ? (0, i.jsx)(aN, {
                        primitiveAssetType: N,
                        groupId: null == n ? void 0 : n.id
                    }) : D ? (0, i.jsx)(aA, {
                        assetType: N,
                        groupId: null == n ? void 0 : n.id
                    }) : (0, i.jsx)(aD, {
                        assetType: N,
                        creatorType: (null == n ? void 0 : n.id) ? U.SearchCreatorType.Group : U.SearchCreatorType.User,
                        creatorTargetId: null != (e = null != (t = null == n ? void 0 : n.id) ? t : null == o ? void 0 : o.id) ? e : 0
                    })
                }, [N, null == n ? void 0 : n.id, null == o ? void 0 : o.id, D, _, f]);
            return (0, i.jsxs)(H.default, {
                children: [(0, i.jsx)(B.HubMeta, {
                    title: (0, B.buildTitle)(L.submenuItem ? f(L.submenuItem.nameKey) : f(L.menuItem.nameKey)),
                    breadcrumb: (0, B.buildBreadcrumb)(f("Heading.Creations"), f(L.menuItem.nameKey), L.submenuItem ? f(L.submenuItem.nameKey) : void 0)
                }), (0, i.jsx)("section", {
                    className: E,
                    children: (0, i.jsxs)(z.Grid, {
                        container: !0,
                        direction: "column",
                        className: k,
                        children: [(0, i.jsx)(F.AgeVerificationUpsellBanner, {
                            trackingPage: F.AgeVerificationUpsellPage.Creations
                        }), !_ && (0, i.jsx)(iK, {
                            menuState: L,
                            onMenuStateChange: R,
                            verificationMetadata: t,
                            group: n
                        }), O && (0, i.jsx)(V.default, {}), J]
                    })
                })]
            })
        }, [_.TranslationNamespace.AssetTypes, _.TranslationNamespace.Controls, _.TranslationNamespace.Creations, _.TranslationNamespace.Error, _.TranslationNamespace.Navigation, _.TranslationNamespace.ShareLinksManagement, _.TranslationNamespace.ExperienceReleases, _.TranslationNamespace.Taxonomy]),
        aF = () => {
            let e = (0, f.useCurrentGroup)(),
                {
                    user: t
                } = (0, P.useAuthentication)(),
                n = (0, O.default)(),
                [s, o] = (0, a.useState)(void 0);
            return (0, a.useEffect)(() => {
                (0, y.getAllowedMarketplaceItemTypes)().then(e => {
                    let {
                        assetTypes: t
                    } = e;
                    o(t)
                })
            }, []), (0, i.jsx)(N, {
                children: (0, i.jsx)(az, {
                    verificationMetadata: n,
                    currentGroup: e,
                    currentUser: t,
                    allowedAssetTypes: s
                })
            })
        };
    var aV = e.i(675330),
        aG = e.i(177608),
        a_ = e.i(796266);
    let aH = () => {
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
        aW = e => {
            let {
                children: t
            } = e;
            return (0, i.jsx)(aG.default, {
                title: (0, i.jsx)(aH, {}),
                secondaryRail: (0, i.jsx)(M, {}),
                secondarySize: "small",
                noBreadCrumbs: !0,
                children: (0, i.jsx)(r.default, {
                    children: t
                })
            })
        },
        aK = () => {
            let {
                isResolving: e
            } = (0, a_.default)(), t = (0, a.useMemo)(() => ({
                isResolving: e
            }), [e]);
            return (0, i.jsx)(l.default, {
                children: (0, i.jsx)(aV.default, {
                    children: (0, i.jsx)(o.default, {
                        children: (0, i.jsx)(j.Provider, {
                            value: t,
                            children: (0, i.jsx)(aF, {})
                        })
                    })
                })
            })
        };
    aK.getPageLayout = e => (0, i.jsx)(aW, {
        children: e
    }), aK.loggerConfig = {
        rosId: "3539"
    }, e.s(["default", 0, aK], 962059)
}, 748348, (e, t, n) => {
    let i = "/dashboard/creations";
    (window.__NEXT_P = window.__NEXT_P || []).push([i, () => e.r(962059)]), t.hot && t.hot.dispose(function() {
        window.__NEXT_P.push([i])
    })
}]);

//# debugId=1178bc04-941d-7556-4cbf-7ef2748a5011
//# sourceMappingURL=0soy0lx37la9c.js.map