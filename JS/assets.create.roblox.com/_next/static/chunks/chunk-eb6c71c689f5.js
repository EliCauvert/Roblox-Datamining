;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "377d5f3f-b9a3-e016-0814-cddd35a1747a")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 783842, e => {
    "use strict";
    var t = e.i(336288);
    e.s(["f", () => t.w])
}, 110149, e => {
    "use strict";
    var t = e.i(415858),
        a = function(e, t) {
            return (a = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function s(e, t, a, s) {
        return new(a || (a = Promise))(function(n, r) {
            function i(e) {
                try {
                    l(s.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                try {
                    l(s.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(i, o)
            }
            l((s = s.apply(e, t || [])).next())
        })
    }

    function n(e, t) {
        var a, s, n, r = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = o(0), i.throw = o(1), i.return = o(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function o(o) {
            return function(l) {
                var c = [o, l];
                if (a) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, c[0] && (r = 0)), r;) try {
                    if (a = 1, s && (n = 2 & c[0] ? s.return : c[0] ? s.throw || ((n = s.return) && n.call(s), 0) : s.next) && !(n = n.call(s, c[1])).done) return n;
                    switch (s = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return r.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            r.label++, s = c[1], c = [0];
                            continue;
                        case 7:
                            c = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = r.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                r.label = c[1];
                                break
                            }
                            if (6 === c[0] && r.label < n[1]) {
                                r.label = n[1], n = c;
                                break
                            }
                            if (n && r.label < n[2]) {
                                r.label = n[2], r.ops.push(c);
                                break
                            }
                            n[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    c = t.call(e, r)
                } catch (e) {
                    c = [6, e], s = 0
                } finally {
                    a = n = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function r(e) {
        return e
    }

    function i(e) {
        var a;
        return null == (a = e) ? a : {
            robuxDiscountAmount: (0, t.u)(a, "robuxDiscountAmount") ? a.robuxDiscountAmount : void 0,
            robuxDiscountPercentage: (0, t.u)(a, "robuxDiscountPercentage") ? a.robuxDiscountPercentage : void 0,
            discountCampaign: (0, t.u)(a, "discountCampaign") ? a.discountCampaign : void 0,
            localizedDiscountAttribution: (0, t.u)(a, "localizedDiscountAttribution") ? a.localizedDiscountAttribution : void 0
        }
    }

    function o(e) {
        var a;
        return null == (a = e) ? a : {
            id: (0, t.u)(a, "id") ? a.id : void 0,
            name: (0, t.u)(a, "name") ? a.name : void 0,
            detailPageLink: (0, t.u)(a, "detailPageLink") ? a.detailPageLink : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, a) {
        return null == e ? e : {
            seconds: (0, t.u)(e, "seconds") ? e.seconds : void 0,
            nanos: (0, t.u)(e, "nanos") ? e.nanos : void 0
        }
    }

    function c(e) {
        var a, s, n;
        return null == (a = e) ? a : {
            collectibleItemId: (0, t.u)(a, "collectibleItemId") ? a.collectibleItemId : void 0,
            name: (0, t.u)(a, "name") ? a.name : void 0,
            description: (0, t.u)(a, "description") ? a.description : void 0,
            collectibleProductId: (0, t.u)(a, "collectibleProductId") ? a.collectibleProductId : void 0,
            itemType: (0, t.u)(a, "itemType") ? a.itemType : void 0,
            itemRestrictions: (0, t.u)(a, "itemRestrictions") ? a.itemRestrictions : void 0,
            creatorHasVerifiedBadge: (0, t.u)(a, "creatorHasVerifiedBadge") ? a.creatorHasVerifiedBadge : void 0,
            creatorType: (0, t.u)(a, "creatorType") ? a.creatorType : void 0,
            itemTargetId: (0, t.u)(a, "itemTargetId") ? a.itemTargetId : void 0,
            itemTargetType: (0, t.u)(a, "itemTargetType") ? a.itemTargetType : void 0,
            creatorId: (0, t.u)(a, "creatorId") ? a.creatorId : void 0,
            creatorName: (0, t.u)(a, "creatorName") ? a.creatorName : void 0,
            price: (0, t.u)(a, "price") ? a.price : void 0,
            lowestPrice: (0, t.u)(a, "lowestPrice") ? a.lowestPrice : void 0,
            hasResellers: (0, t.u)(a, "hasResellers") ? a.hasResellers : void 0,
            unitsAvailableForConsumption: (0, t.u)(a, "unitsAvailableForConsumption") ? a.unitsAvailableForConsumption : void 0,
            offSaleDeadline: (0, t.u)(a, "offSaleDeadline") ? new Date(a.offSaleDeadline) : void 0,
            assetStock: (0, t.u)(a, "assetStock") ? a.assetStock : void 0,
            errorCode: (0, t.u)(a, "errorCode") ? a.errorCode : void 0,
            saleLocationType: (0, t.u)(a, "saleLocationType") ? a.saleLocationType : void 0,
            universeIds: (0, t.u)(a, "universeIds") ? a.universeIds : void 0,
            experiences: (0, t.u)(a, "experiences") ? null === a.experiences ? null : a.experiences.map(o) : void 0,
            sales: (0, t.u)(a, "sales") ? a.sales : void 0,
            lowestResalePrice: (0, t.u)(a, "lowestResalePrice") ? a.lowestResalePrice : void 0,
            quantityLimitPerUser: (0, t.u)(a, "quantityLimitPerUser") ? a.quantityLimitPerUser : void 0,
            lowestAvailableResaleProductId: (0, t.u)(a, "lowestAvailableResaleProductId") ? a.lowestAvailableResaleProductId : void 0,
            lowestAvailableResaleItemInstanceId: (0, t.u)(a, "lowestAvailableResaleItemInstanceId") ? a.lowestAvailableResaleItemInstanceId : void 0,
            resaleRestriction: (0, t.u)(a, "resaleRestriction") ? a.resaleRestriction : void 0,
            productSaleStatus: (0, t.u)(a, "productSaleStatus") ? a.productSaleStatus : void 0,
            productTargetId: (0, t.u)(a, "productTargetId") ? a.productTargetId : void 0,
            scheduledRelease: (0, t.u)(a, "scheduledRelease") ? null == (s = a.scheduledRelease) ? s : {
                onSaleTime: (0, t.u)(s, "onSaleTime") ? l(s.onSaleTime) : void 0,
                offSaleTime: (0, t.u)(s, "offSaleTime") ? l(s.offSaleTime) : void 0
            } : void 0,
            discountInformation: (0, t.u)(a, "discountInformation") ? null == (n = a.discountInformation) ? n : {
                originalPrice: (0, t.u)(n, "originalPrice") ? n.originalPrice : void 0,
                totalDiscountPercentage: (0, t.u)(n, "totalDiscountPercentage") ? n.totalDiscountPercentage : void 0,
                totalDiscountAmount: (0, t.u)(n, "totalDiscountAmount") ? n.totalDiscountAmount : void 0,
                discounts: (0, t.u)(n, "discounts") ? null === n.discounts ? null : n.discounts.map(i) : void 0
            } : void 0,
            itemStatus: (0, t.u)(a, "itemStatus") ? null === a.itemStatus ? null : a.itemStatus.map(r) : void 0,
            totalRestockedQuantity: (0, t.u)(a, "totalRestockedQuantity") ? a.totalRestockedQuantity : void 0,
            lastRestockedTime: (0, t.u)(a, "lastRestockedTime") ? a.lastRestockedTime : void 0
        }
    }
    var u = function(e) {
        function r() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function s() {
                this.constructor = e
            }
            a(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
        }(r, e), r.prototype.marketplaceItemsGetCollectibleItemsDetailsRaw = function(e, a) {
            return s(this, void 0, void 0, function() {
                var s, r, i;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.marketplaceItemsGetCollectibleItemsDetailsRequest || void 0 === e.marketplaceItemsGetCollectibleItemsDetailsRequest) throw new t.w("marketplaceItemsGetCollectibleItemsDetailsRequest", "Required parameter requestParameters.marketplaceItemsGetCollectibleItemsDetailsRequest was null or undefined when calling marketplaceItemsGetCollectibleItemsDetails.");
                            return s = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/items/details",
                                schemaPath: "/v1/items/details",
                                method: "POST",
                                headers: r,
                                query: s,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        itemIds: e.itemIds
                                    }
                                }(e.marketplaceItemsGetCollectibleItemsDetailsRequest)
                            }, a)];
                        case 1:
                            return i = n.sent(), [2, new t.H(i, function(e) {
                                return e.map(c)
                            })]
                    }
                })
            })
        }, r.prototype.marketplaceItemsGetCollectibleItemsDetails = function(e, t) {
            return s(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.marketplaceItemsGetCollectibleItemsDetailsRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r
    }(t._);
    e.s(["C", 0, {
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "A", 0, {
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3
    }, "n", 0, u, "q", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "Q", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }])
}, 356936, e => {
    "use strict";
    var t = e.i(735807);
    e.s(["f", () => t.D])
}, 799972, e => {
    "use strict";
    var t = e.i(317143),
        a = e.i(671376);
    let {
        docs: s
    } = e.i(829425).f, n = {
        [a.f.Decal]: t.s.Decal,
        [a.f.Audio]: t.s.Audio,
        [a.f.Video]: t.s.Video,
        [a.f.TShirt]: t.s.Tshirt,
        [a.f.Shirt]: t.s.Shirt,
        [a.f.Pants]: t.s.Pants,
        [a.f.AvatarBackground]: t.s.AvatarBackground,
        [a.f.TextDocument]: t.s.TextDocument
    }, r = {
        [a.f.Decal]: "Message.DecalResolutionLimits",
        [a.f.Audio]: "Message.AudioLimits",
        [a.f.AvatarBackground]: "Message.AvatarBackgroundUploadRequirements"
    }, i = [a.f.Shirt, a.f.Pants, a.f.Video, a.f.TShirt, a.f.AvatarBackground], o = [a.f.Audio, a.f.Video];
    e.s(["l", 0, e => {
        switch (e) {
            case a.f.Decal:
            case a.f.TShirt:
            case a.f.Shirt:
            case a.f.Pants:
            case a.f.AvatarBackground:
                return ["jpg", "png", "tga", "bmp"];
            case a.f.Audio:
                return ["mp3", "ogg", "flac", "wav"];
            case a.f.Video:
                return ["mp4", "mov"];
            case a.f.TextDocument:
                return ["md", "txt"];
            default:
                return []
        }
    }, "g", 0, r, "r", 0, n, "z", 0, e => {
        switch (e) {
            case a.f.Decal:
                return s.getDecalReferenceUrl();
            case a.f.TShirt:
            case a.f.Shirt:
            case a.f.Pants:
                return s.getClassicClothingUrl();
            case a.f.Audio:
                return s.getAudioAssetsUrl();
            case a.f.Video:
                return s.getAssetsUrl();
            case a.f.AvatarBackground:
                return s.getAvatarItemsUrl();
            case a.f.TextDocument:
                return s.getAssetsUrl();
            default:
                return ""
        }
    }, "j", 0, e => {
        switch (e) {
            case a.f.TShirt:
            case a.f.Shirt:
            case a.f.Pants:
                return !0;
            default:
                return !1
        }
    }, "S", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        switch (e) {
            case a.f.Audio:
            case a.f.Decal:
            case a.f.Video:
            case a.f.TShirt:
            case a.f.Shirt:
            case a.f.Pants:
            case a.f.AvatarBackground:
                return !0;
            case a.f.TextDocument:
                return t;
            default:
                return !1
        }
    }, "_", 0, e => e === a.f.Video ? 300 : null, "D", 0, e => {
        switch (e) {
            case a.f.Decal:
            case a.f.TShirt:
            case a.f.Shirt:
            case a.f.Pants:
            case a.f.Audio:
            case a.f.AvatarBackground:
            case a.f.TextDocument:
                return 20;
            case a.f.Video:
                return 30;
            default:
                return 0
        }
    }, "t", 0, e => e === a.f.Video ? "4096x2160" : null, "k", 0, i, "b", 0, o])
}, 877109, e => {
    "use strict";
    var t, a = e.i(336288),
        s = e.i(110149),
        n = e.i(913893),
        r = e.i(783842),
        i = e.i(642663),
        o = e.i(322489),
        l = e.i(671376),
        c = e.i(759283),
        u = e.i(475360),
        d = e.i(927868),
        f = e.i(427149),
        y = e.i(696564),
        p = e.i(418162),
        m = e.i(949599),
        v = ((t = v || {}).Unknown = "Unknown", t.Body = "Body", t.DynamicHead = "DynamicHead", t.Shoes = "Shoes", t.AvatarAnimations = "AvatarAnimations", t);
    let A = e => e === r.f.NUMBER_1 || e === r.f.NUMBER_2 || e === r.f.NUMBER_4;

    function T(e) {
        return e && e.seconds ? new Date(1e3 * e.seconds) : null
    }
    let h = {
        [m.i.Unknown]: "Unknown",
        [m.i.Body]: "Body",
        [m.i.DynamicHead]: "DynamicHead",
        [m.i.Shoes]: "Shoes",
        [m.i.AvatarAnimations]: "AvatarAnimations"
    };

    function B(e) {
        var t;
        return void 0 === e ? "Unknown" : null != (t = h[e]) ? t : "Unknown"
    }

    function E(e) {
        if (void 0 === e) return;
        let t = (0, y.V)(e);
        return (0, d.s)(l.f, t) ? t : void 0
    }

    function S(e, t) {
        if (t === a.U.NUMBER_2) return i.f.Moderated;
        switch (e) {
            case a.k.NUMBER_0:
                return i.f.OnSale;
            case a.k.NUMBER_1:
                return i.f.OffSale;
            case a.k.NUMBER_2:
                return i.f.Free;
            default:
                return i.f.OffSale
        }
    }
    async function M(e, t) {
        var a, r, i, o;
        let l, {
                taxonomy: d,
                isRecents: v = !1
            } = null != (a = e.avatarItem) ? a : {},
            h = void 0 !== d || v,
            M = (null == (r = e.avatarItem) ? void 0 : r.bundleType) !== void 0,
            R = B(null == (i = e.avatarItem) ? void 0 : i.bundleType),
            b = e.avatarItem.assetType,
            U = M ? u.f.Bundle : c.K[b],
            {
                isArchived: g
            } = e,
            I = [];
        try {
            let {
                items: a,
                nextCursor: r
            } = await n.f.getItemsByCreator(m.l, e.cursor, e.groupId, !h && M ? null == (o = e.avatarItem) ? void 0 : o.bundleType : void 0, !h && !M ? (0, p.k)(b) : void 0, d);
            if (l = "" === r ? void 0 : r, !a) return {
                nextPageCursor: void 0,
                items: []
            };
            let i = !M && !!b && f.f.isAssetTypeDirectlyArchivable(b);
            I = a.filter(e => {
                var t;
                return (null == (t = e.delistingStatus) ? void 0 : t.status) === (g ? 1 : 2)
            }).map(a => {
                var n, r, o, l, d, p, m, v, g, I, k;
                let N = null == (l = a.marketplaceItemDetails) || null == (o = l.assetDetails) ? void 0 : o.assetType,
                    _ = null == (p = a.marketplaceItemDetails) || null == (d = p.bundleDetails) ? void 0 : d.bundleType,
                    D = h ? void 0 !== _ && void 0 === N : M,
                    w = h ? E(N) : b,
                    P = h ? B(_) : R,
                    L = h ? D ? u.f.Bundle : null != (n = w ? c.K[w] : void 0) ? n : u.f.CatalogAsset : U,
                    C = h ? !D && !!w && f.f.isAssetTypeDirectlyArchivable(w) : !M && i;
                return {
                    itemType: L,
                    assetType: D ? void 0 : w,
                    assetId: D ? void 0 : a.id,
                    bundleType: P,
                    bundleId: D ? a.id : void 0,
                    name: a.name,
                    price: null != (r = a.price) ? r : null,
                    isDirectlyArchivable: C,
                    isArchived: e.isArchived,
                    isClickable: e.isClickable,
                    created: a.createdTime,
                    status: S(a.saleStatus, a.moderationStatus),
                    isLimited2: a.collectibleItemType === s.C.NUMBER_1,
                    isDelisted: (null == (m = a.delistingStatus) ? void 0 : m.status) === 1,
                    saleLocationType: null == (v = a.saleLocation) ? void 0 : v.saleLocationType,
                    isCreatedForBundle: 3 === a.cannotBePublishedReason,
                    scheduledStartDate: T(null == (g = a.scheduledRelease) ? void 0 : g.onSaleTime),
                    scheduledEndDate: T(null == (I = a.scheduledRelease) ? void 0 : I.offSaleTime),
                    bundleModerationStatus: a.moderationStatus,
                    isUpdating: a.isUpdating,
                    hidePricingInfo: A(a.moderationStatus),
                    isSellable: 0 === a.cannotBePublishedReason,
                    isCollectible: 0 !== a.collectibleItemType,
                    collectibleItemId: null == (k = a.collectibleDetails) ? void 0 : k.collectibleItemId,
                    wearTime: y.h.Permanent,
                    isRentalOptIn: a.isRentalOptIn,
                    rentalOptions: a.rentalOptions,
                    userId: t
                }
            })
        } catch (e) {
            I = []
        }
        return {
            nextPageCursor: l,
            items: I
        }
    }
    async function R(e, t) {
        let a, {
                avatarItem: s
            } = t,
            {
                lookType: n
            } = s;
        if (void 0 === n) return {
            items: [],
            nextPageCursor: void 0
        };
        let r = [],
            {
                cursor: i
            } = t;
        try {
            let {
                data: t,
                nextCursor: s
            } = await o.f.getLooksByCuratorAndType(e.toString(), n, m.l, i);
            if (a = null != s ? s : void 0, !t) return {
                items: [],
                nextPageCursor: void 0
            };
            r = t.map(t => {
                var a, s, n, r;
                return {
                    itemType: u.f.Look,
                    lookId: null != (a = t.lookId) ? a : void 0,
                    lookModerationStatus: t.moderationStatus,
                    lookType: t.lookType,
                    lookAssets: null != (s = t.assets) ? s : void 0,
                    lookBundles: null != (n = t.bundles) ? n : void 0,
                    lookDisplayProperties: t.displayProperties,
                    isClickable: !0,
                    userId: e,
                    name: null != (r = t.name) ? r : void 0,
                    created: t.createdTime,
                    price: t.totalValue
                }
            })
        } catch (e) {
            r = []
        }
        return {
            nextPageCursor: a,
            items: r
        }
    }
    async function b(e, t) {
        let a, {
                avatarItem: s
            } = t,
            {
                lookType: n
            } = s;
        if (void 0 === n) return {
            items: [],
            nextPageCursor: void 0
        };
        let r = [],
            {
                cursor: i
            } = t;
        try {
            let {
                data: t,
                nextCursor: s
            } = await o.f.getLooksByGroupAndType(e.toString(), n, m.l, i);
            if (a = null != s ? s : void 0, !t) return {
                items: [],
                nextPageCursor: void 0
            };
            r = t.map(e => {
                var t, a, s, n;
                return {
                    itemType: u.f.Look,
                    lookId: null != (t = e.lookId) ? t : void 0,
                    lookModerationStatus: e.moderationStatus,
                    lookType: e.lookType,
                    lookAssets: null != (a = e.assets) ? a : void 0,
                    lookBundles: null != (s = e.bundles) ? s : void 0,
                    lookDisplayProperties: e.displayProperties,
                    isClickable: !0,
                    userId: void 0,
                    name: null != (n = e.name) ? n : void 0,
                    created: e.createdTime,
                    price: e.totalValue
                }
            })
        } catch (e) {
            r = []
        }
        return {
            nextPageCursor: a,
            items: r
        }
    }
    async function U(e, t) {
        let a, {
                avatarItem: r
            } = e,
            i = [];
        if (r.folderId) {
            let o = await n.f.getFolderItems(r.folderId, e.cursor, m.t);
            if (a = "" === o.nextCursor ? void 0 : o.nextCursor, !o.items) return {
                items: [],
                nextPageCursor: void 0
            };
            i = o.items.map(a => {
                var n, i, o, l, c, d, y, p;
                let {
                    marketplaceItem: m
                } = a, v = (null == m || null == (n = m.marketplaceItemDetails) ? void 0 : n.assetDetails) !== void 0, h = v ? E(null == m || null == (o = m.marketplaceItemDetails) || null == (i = o.assetDetails) ? void 0 : i.assetType) : void 0, B = !!v && void 0 !== h && f.f.isAssetTypeDirectlyArchivable(h);
                return {
                    itemType: v ? u.f.CatalogAsset : u.f.Bundle,
                    assetType: h,
                    assetId: v ? a.id : void 0,
                    bundleId: v ? void 0 : a.id,
                    name: null == m ? void 0 : m.name,
                    price: null == m ? void 0 : m.price,
                    isDirectlyArchivable: !!v && B,
                    isArchived: e.isArchived,
                    isClickable: e.isClickable,
                    created: null == m ? void 0 : m.createdTime,
                    status: S(null == m ? void 0 : m.saleStatus, null == m ? void 0 : m.moderationStatus),
                    isLimited2: (null == m ? void 0 : m.collectibleItemType) === s.C.NUMBER_1,
                    isDelisted: (null == m || null == (l = m.delistingStatus) ? void 0 : l.status) === 1,
                    saleLocationType: null == m || null == (c = m.saleLocation) ? void 0 : c.saleLocationType,
                    isCreatedForBundle: (null == m ? void 0 : m.cannotBePublishedReason) === 3,
                    scheduledStartDate: T(null == m || null == (d = m.scheduledRelease) ? void 0 : d.onSaleTime),
                    scheduledEndDate: T(null == m || null == (y = m.scheduledRelease) ? void 0 : y.offSaleTime),
                    bundleModerationStatus: null == m ? void 0 : m.moderationStatus,
                    isUpdating: null == m ? void 0 : m.isUpdating,
                    hidePricingInfo: A(null == m ? void 0 : m.moderationStatus),
                    isSellable: (null == m ? void 0 : m.cannotBePublishedReason) === 0,
                    isCollectible: (null == m ? void 0 : m.collectibleItemType) !== 0,
                    collectibleItemId: null == m || null == (p = m.collectibleDetails) ? void 0 : p.collectibleItemId,
                    containingFolderId: r.folderId,
                    userId: t
                }
            })
        }
        return {
            nextPageCursor: a,
            items: i
        }
    }
    e.s(["O", 0, T, "i", 0, M, "H", 0, U, "N", 0, R, "x", 0, b, "$", 0, function(e) {
        if (void 0 !== e && (0, d.s)(a.t, e)) return E(e)
    }, "P", 0, function(e) {
        var t, a;
        let s = null != (t = null == e || null == (a = e.folders) ? void 0 : a.map(e => {
            var t;
            return {
                nameKey: null != (t = e.name) ? t : "",
                folderId: e.folderId,
                isFolder: !0,
                skipTranslation: !0
            }
        }).filter(e => "" !== e.nameKey)) ? t : [];
        return [m.V, ...s]
    }, "f", 0, A, "v", 0, S])
}, 427149, e => {
    "use strict";
    var t = e.i(799972),
        a = e.i(671376),
        s = e.i(759283),
        n = e.i(475360),
        r = e.i(117236);
    let i = r.U.reduce((e, t) => {
            var a;
            return t.submenuItems || e.set(t.type, {
                menuItem: t
            }), null == (a = t.submenuItems) || a.forEach(a => {
                if (a.submenuItems) {
                    var s;
                    null == (s = a.submenuItems) || s.forEach(s => {
                        e.set(s.type, {
                            menuItem: t,
                            submenuItem: a
                        })
                    })
                } else e.set(a.type, {
                    menuItem: t,
                    submenuItem: a
                })
            }), e
        }, new Map),
        o = {
            menuItem: r.U[0]
        },
        l = a.f.EyeMakeup,
        c = a.f.AvatarLooks,
        u = a.f.AvatarBackground,
        d = a.f.Showcase;
    e.s(["f", 0, {
        isMenuItemEnabled(e, s, r, i, o, f, y) {
            var p, m;
            return ((null == e ? void 0 : e.type) !== a.f.TextDocument || !!y) && ((null == e ? void 0 : e.type) === a.f.AllCatalogAsset || ((null == e ? void 0 : e.type) === a.f.SharedExperiences ? null == s : (null == e ? void 0 : e.type) === a.f.Moments ? null != o && o : (null == e ? void 0 : e.itemType) === n.f.Bundle || (null == e ? void 0 : e.type) === c || ((null == e ? void 0 : e.type) === u ? null != (p = null == i ? void 0 : i.has(e.type)) && p : (null == e ? void 0 : e.type) === d ? null != f && f : (null == e ? void 0 : e.type) === l ? null != (m = null == i ? void 0 : i.has(null == e ? void 0 : e.type)) && m : (null == e ? void 0 : e.type) === void 0 || !!(0, t.j)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === r || null != r && r)))
        },
        getValidMenuState(e, t, a, s, n, r, i, o) {
            var c, d, f, y, p, m;
            let v, A, T = (null == (c = t.submenuItem) ? void 0 : c.type) !== l && (null == (d = t.submenuItem) ? void 0 : d.type) !== u || void 0 !== n;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, s, n, r, i, o)) {
                if (void 0 !== t.submenuItem && T && !this.isMenuItemEnabled(t.submenuItem, a, s, n, r, i, o))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            l = 0;
                        for (; l < (null == (y = t.menuItem.submenuItems) ? void 0 : y.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[l], a, s, n, r, i, o)) {
                                e = l;
                                break
                            }
                            l += 1
                        }
                        v = t.menuItem, A = null == (p = t.menuItem.submenuItems) ? void 0 : p[e]
                    } else v = t.menuItem, A = null == (m = t.menuItem.submenuItems) ? void 0 : m[0]
            } else [v] = e, A = null == (f = e[0].submenuItems) ? void 0 : f[0];
            return v ? {
                menuItem: v,
                submenuItem: A
            } : t
        },
        isAssetTypeDirectlyArchivable: e => r.t.has(e),
        isAssetTypeArchivable: e => r.w.has(e),
        isAssetTypeSortable: e => r.l.has(e),
        isItemTypeUploadable: e => r.H.has(e),
        getAssetFullNameKey: e => s.M[e],
        getItemFullNameKey: e => s.w[e],
        getAssetType: e => e.submenuItem ? e.submenuItem.type : e.menuItem.type,
        getItemType(e) {
            return e.submenuItem && e.submenuItem.itemType ? e.submenuItem.itemType : e.menuItem.itemType ? e.menuItem.itemType : s.K[this.getAssetType(e)]
        },
        getMenuState(e, t) {
            var a;
            return e && t.includes(e) ? o : e && null != (a = i.get(e)) ? a : o
        }
    }])
}, 696564, e => {
    "use strict";
    var t, a, s, n = e.i(336288),
        r = e.i(913893),
        i = e.i(671376),
        o = e.i(814768),
        l = ((t = {})[t.Invalid = 0] = "Invalid", t[t.MarketplaceAndAllExperiences = 1] = "MarketplaceAndAllExperiences", t[t.ExperiencesAndDevAPIOnly = 2] = "ExperiencesAndDevAPIOnly", t[t.MarketplaceOnly = 3] = "MarketplaceOnly", t[t.MarketplaceAndExperiencesById = 4] = "MarketplaceAndExperiencesById", t),
        c = ((a = {})[a.Invalid = 0] = "Invalid", a[a.Marketplace = 1] = "Marketplace", a[a.InExperience = 2] = "InExperience", a),
        u = ((s = {}).Days3 = "Days3", s.Days7 = "Days7", s.Days14 = "Days14", s.Permanent = "Permanent", s);
    let d = Object.values(u),
        f = [],
        y = [],
        p = [],
        m = [];
    async function v() {
        if (f.length > 0 && y.length > 0) return;
        let e = await r.f.getAllowedAssetTypes(n.j.NUMBER_4, [n.d.NUMBER_0, n.d.NUMBER_1]);
        e.allowedAssetTypes && e.allowedAssetTypes.forEach(e => {
            f.push(e)
        }), e.allowedBundleTypes && e.allowedBundleTypes.forEach(e => {
            y.push((0, o.f)(e))
        })
    }
    async function A() {
        if (p.length > 0 && m.length > 0) return;
        let e = await r.f.getAllowedAssetTypes(n.j.NUMBER_5, [n.d.NUMBER_0, n.d.NUMBER_1]);
        e.allowedAssetTypes && e.allowedAssetTypes.forEach(e => {
            let t = e;
            "TshirtAccessory" === e && (t = "TShirtAccessory"), p.push(t)
        }), e.allowedBundleTypes && e.allowedBundleTypes.forEach(e => {
            m.push((0, o.f)(e))
        })
    }
    e.s(["N", 0, 0x3b9ac9ff, "P", 0, d, "h", () => u, "T", 0, .3, "O", () => c, "Q", () => l, "v", 0, p, "U", 0, m, "Y", 0, f, "R", 0, y, "l", 0, A, "s", 0, v, "V", 0, function(e) {
        switch (e) {
            case n.t.NUMBER_1:
                return i.f.Image.toString();
            case n.t.NUMBER_2:
                return i.f.TShirt.toString();
            case n.t.NUMBER_3:
                return i.f.Audio.toString();
            case n.t.NUMBER_4:
                return i.f.Mesh.toString();
            case n.t.NUMBER_8:
                return i.f.Hat.toString();
            case n.t.NUMBER_9:
                return i.f.Place.toString();
            case n.t.NUMBER_10:
                return i.f.Model.toString();
            case n.t.NUMBER_11:
                return i.f.Shirt.toString();
            case n.t.NUMBER_12:
                return i.f.Pants.toString();
            case n.t.NUMBER_13:
                return i.f.Decal.toString();
            case n.t.NUMBER_24:
                return i.f.Animation.toString();
            case n.t.NUMBER_38:
                return i.f.Plugin.toString();
            case n.t.NUMBER_40:
                return i.f.MeshPart.toString();
            case n.t.NUMBER_41:
                return i.f.HairAccessory.toString();
            case n.t.NUMBER_42:
                return i.f.FaceAccessory.toString();
            case n.t.NUMBER_43:
                return i.f.NeckAccessory.toString();
            case n.t.NUMBER_44:
                return i.f.ShoulderAccessory.toString();
            case n.t.NUMBER_45:
                return i.f.FrontAccessory.toString();
            case n.t.NUMBER_46:
                return i.f.BackAccessory.toString();
            case n.t.NUMBER_47:
                return i.f.WaistAccessory.toString();
            case n.t.NUMBER_61:
                return i.f.EmoteAnimation.toString();
            case n.t.NUMBER_62:
                return i.f.Video.toString();
            case n.t.NUMBER_64:
                return i.f.TShirtAccessory.toString();
            case n.t.NUMBER_65:
                return i.f.ShirtAccessory.toString();
            case n.t.NUMBER_66:
                return i.f.PantsAccessory.toString();
            case n.t.NUMBER_67:
                return i.f.JacketAccessory.toString();
            case n.t.NUMBER_68:
                return i.f.SweaterAccessory.toString();
            case n.t.NUMBER_69:
                return i.f.ShortsAccessory.toString();
            case n.t.NUMBER_72:
                return i.f.DressSkirtAccessory.toString();
            case n.t.NUMBER_73:
                return i.f.FontFamily.toString();
            case n.t.NUMBER_76:
                return i.f.EyebrowAccessory.toString();
            case n.t.NUMBER_77:
                return i.f.EyelashAccessory.toString();
            case n.t.NUMBER_88:
                return i.f.FaceMakeup.toString();
            case n.t.NUMBER_89:
                return i.f.LipMakeup.toString();
            case n.t.NUMBER_90:
                return i.f.EyeMakeup.toString();
            case n.t.NUMBER_92:
                return i.f.AvatarBackground.toString();
            default:
                return "Invalid"
        }
    }, "x", 0, function(e) {
        switch (e) {
            case n.z.NUMBER_1:
                return "Body";
            case n.z.NUMBER_2:
                return "DynamicHead";
            case n.z.NUMBER_3:
                return "Shoes";
            case n.z.NUMBER_4:
                return "AvatarAnimations";
            default:
                return "Invalid"
        }
    }, "$", 0, function(e) {
        switch (e) {
            case "Permanent":
            default:
                return 0;
            case "Days3":
                return 3;
            case "Days14":
                return 14;
            case "Days7":
                return 7
        }
    }, "n", 0, function(e) {
        switch (e) {
            case 3:
                return "Days3";
            case 7:
                return "Days7";
            case 14:
                return "Days14";
            default:
                return "Permanent"
        }
    }, "S", 0, function(e) {
        switch (e) {
            case "Permanent":
                return "Permanent";
            case "Days14":
                return "Days14";
            case "Days7":
                return "Days7";
            case "Days3":
                return "Days3";
            default:
                return ""
        }
    }, "W", 0, function(e) {
        switch (e) {
            case 1:
                return n.p.NUMBER_1;
            case 2:
                return n.p.NUMBER_2;
            case 3:
                return n.p.NUMBER_3;
            case 4:
                return n.p.NUMBER_4;
            default:
                return n.p.NUMBER_0
        }
    }])
}, 418162, e => {
    "use strict";
    var t = e.i(974184),
        a = e.i(336288),
        s = e.i(671376),
        n = e.i(759283),
        r = e.i(927868),
        i = e.i(949599),
        o = e.i(696564);
    let l = {
            [s.f.Place]: {
                asset: s.f.Place,
                apiType: a.a.NUMBER_9
            },
            [s.f.TShirt]: {
                asset: s.f.TShirt,
                apiType: a.a.NUMBER_2
            },
            [s.f.Shirt]: {
                asset: s.f.Shirt,
                apiType: a.a.NUMBER_11
            },
            [s.f.Pants]: {
                asset: s.f.Pants,
                apiType: a.a.NUMBER_12
            },
            [s.f.Hat]: {
                asset: s.f.Hat,
                apiType: a.a.NUMBER_8
            },
            [s.f.HairAccessory]: {
                asset: s.f.HairAccessory,
                apiType: a.a.NUMBER_41
            },
            [s.f.FaceAccessory]: {
                asset: s.f.FaceAccessory,
                apiType: a.a.NUMBER_42
            },
            [s.f.NeckAccessory]: {
                asset: s.f.NeckAccessory,
                apiType: a.a.NUMBER_43
            },
            [s.f.ShoulderAccessory]: {
                asset: s.f.ShoulderAccessory,
                apiType: a.a.NUMBER_44
            },
            [s.f.FrontAccessory]: {
                asset: s.f.FrontAccessory,
                apiType: a.a.NUMBER_45
            },
            [s.f.BackAccessory]: {
                asset: s.f.BackAccessory,
                apiType: a.a.NUMBER_46
            },
            [s.f.WaistAccessory]: {
                asset: s.f.WaistAccessory,
                apiType: a.a.NUMBER_47
            },
            [s.f.TShirtAccessory]: {
                asset: s.f.TShirtAccessory,
                apiType: a.a.NUMBER_64
            },
            [s.f.ShirtAccessory]: {
                asset: s.f.ShirtAccessory,
                apiType: a.a.NUMBER_65
            },
            [s.f.PantsAccessory]: {
                asset: s.f.PantsAccessory,
                apiType: a.a.NUMBER_66
            },
            [s.f.JacketAccessory]: {
                asset: s.f.JacketAccessory,
                apiType: a.a.NUMBER_67
            },
            [s.f.SweaterAccessory]: {
                asset: s.f.SweaterAccessory,
                apiType: a.a.NUMBER_68
            },
            [s.f.ShortsAccessory]: {
                asset: s.f.ShortsAccessory,
                apiType: a.a.NUMBER_69
            },
            [s.f.DressSkirtAccessory]: {
                asset: s.f.DressSkirtAccessory,
                apiType: a.a.NUMBER_72
            },
            [s.f.EmoteAnimation]: {
                asset: s.f.EmoteAnimation,
                apiType: a.a.NUMBER_61
            },
            [s.f.AllCatalogAsset]: {
                asset: s.f.AllCatalogAsset,
                apiType: a.a.NUMBER_0
            },
            [s.f.AvatarLooks]: {
                asset: s.f.AvatarLooks,
                apiType: a.a.NUMBER_0
            },
            [s.f.Showcase]: {
                asset: s.f.Showcase,
                apiType: a.a.NUMBER_0
            },
            [s.f.Decal]: {
                asset: s.f.Decal,
                apiType: a.a.NUMBER_13
            },
            [s.f.Image]: {
                asset: s.f.Image,
                apiType: a.a.NUMBER_1
            },
            [s.f.Audio]: {
                asset: s.f.Audio,
                apiType: a.a.NUMBER_3
            },
            [s.f.Model]: {
                asset: s.f.Model,
                apiType: a.a.NUMBER_10
            },
            [s.f.Mesh]: {
                asset: s.f.Mesh,
                apiType: a.a.NUMBER_4
            },
            [s.f.MeshPart]: {
                asset: s.f.MeshPart,
                apiType: a.a.NUMBER_40
            },
            [s.f.Plugin]: {
                asset: s.f.Plugin,
                apiType: a.a.NUMBER_38
            },
            [s.f.Animation]: {
                asset: s.f.Animation,
                apiType: a.a.NUMBER_24
            },
            [s.f.Video]: {
                asset: s.f.Video,
                apiType: a.a.NUMBER_62
            },
            [s.f.FontFamily]: {
                asset: s.f.FontFamily,
                apiType: a.a.NUMBER_73
            },
            [s.f.StorePreviewVideo]: {
                asset: s.f.StorePreviewVideo,
                apiType: a.a.NUMBER_0
            },
            [s.f.GamePreviewVideo]: {
                asset: s.f.GamePreviewVideo,
                apiType: a.a.NUMBER_0
            },
            [s.f.MyExperiences]: {
                asset: s.f.MyExperiences,
                apiType: a.a.NUMBER_0
            },
            [s.f.SharedExperiences]: {
                asset: s.f.SharedExperiences,
                apiType: a.a.NUMBER_0
            },
            [s.f.ShareLink]: {
                asset: s.f.ShareLink,
                apiType: a.a.NUMBER_0
            },
            [s.f.Moments]: {
                asset: s.f.Moments,
                apiType: a.a.NUMBER_0
            },
            [s.f.Event]: {
                asset: s.f.Event,
                apiType: a.a.NUMBER_0
            },
            [s.f.UpcomingEvent]: {
                asset: s.f.UpcomingEvent,
                apiType: a.a.NUMBER_0
            },
            [s.f.DraftEvent]: {
                asset: s.f.DraftEvent,
                apiType: a.a.NUMBER_0
            },
            [s.f.PastEvent]: {
                asset: s.f.PastEvent,
                apiType: a.a.NUMBER_0
            },
            [s.f.EyebrowAccessory]: {
                asset: s.f.EyebrowAccessory,
                apiType: a.a.NUMBER_76
            },
            [s.f.EyelashAccessory]: {
                asset: s.f.EyelashAccessory,
                apiType: a.a.NUMBER_77
            },
            [s.f.FaceMakeup]: {
                asset: s.f.FaceMakeup,
                apiType: a.a.NUMBER_88
            },
            [s.f.LipMakeup]: {
                asset: s.f.LipMakeup,
                apiType: a.a.NUMBER_89
            },
            [s.f.EyeMakeup]: {
                asset: s.f.EyeMakeup,
                apiType: a.a.NUMBER_90
            },
            [s.f.AvatarBackground]: {
                asset: s.f.AvatarBackground,
                apiType: a.a.NUMBER_92
            },
            [s.f.TextDocument]: {
                asset: s.f.TextDocument,
                apiType: a.a.NUMBER_0
            },
            [s.f.AssetPermissionRequests]: {
                asset: s.f.AssetPermissionRequests,
                apiType: a.a.NUMBER_0
            }
        },
        c = e => {
            let t = Object.values(l).find(t => t.apiType === e);
            return null == t ? void 0 : t.asset
        },
        u = e => {
            switch (e) {
                case a.z.NUMBER_0:
                    return i.i.Unknown;
                case a.z.NUMBER_1:
                    return i.i.Body;
                case a.z.NUMBER_2:
                    return i.i.DynamicHead;
                case a.z.NUMBER_3:
                    return i.i.Shoes;
                case a.z.NUMBER_4:
                    return i.i.AvatarAnimations;
                default:
                    return i.i.Unknown
            }
        },
        d = e => {
            switch (e) {
                case a.e.Unknown:
                    return i.i.Unknown;
                case a.e.Body:
                    return i.i.Body;
                case a.e.DynamicHead:
                    return i.i.DynamicHead;
                case a.e.Shoes:
                    return i.i.Shoes;
                case a.e.AvatarAnimations:
                    return i.i.AvatarAnimations;
                default:
                    return i.i.Unknown
            }
        },
        f = new Set([s.f.TShirt, s.f.Pants, s.f.Shirt].map(e => e.toLowerCase())),
        y = (e, a) => {
            if (null == e) return !1;
            let s = e.status !== t.Y.Active && e.status !== t.Y.Accepted,
                n = null != e.endTime && e.endTime.getTime() <= a.getTime();
            return s || n
        };
    e.s(["X", 0, e => {
        var t, a, s, n, r, i;
        return null != (t = null != (a = null != (s = null == e || null == (n = e.license) ? void 0 : n.name) ? s : null == e || null == (r = e.listing) ? void 0 : r.name) ? a : null == e || null == (i = e.license) ? void 0 : i.listingName) ? t : void 0
    }, "z", 0, e => {
        var t, a;
        let s = null != (t = null == e ? void 0 : e.endTime) ? t : null;
        if (null != s) return {
            startTime: null != (a = null == e ? void 0 : e.startTime) ? a : null,
            endTime: s
        }
    }, "D", 0, function(e, t) {
        return "/dashboard/creations/".concat(n.e[e], "/").concat(t, "/configure")
    }, "u", 0, (e, t) => e ? {
        startTime: null != e.startTime ? new Date(Math.max(e.startTime.getTime(), t.getTime())) : null,
        endTime: e.endTime
    } : void 0, "E", 0, function(e, t) {
        if (void 0 !== e) {
            if ("number" == typeof e) {
                let t = c(e);
                return !!t && o.Y.includes(t)
            }
            return o.Y.includes(e)
        }
        if (void 0 !== t) {
            if ((0, r.s)(a.z, t)) return o.R.includes(u(t));
            if ((0, r.s)(a.e, t)) return o.R.includes(d(t));
            if ((0, r.s)(i.i, t)) return o.R.includes(t)
        }
        return !1
    }, "G", 0, function(e, t) {
        if (void 0 !== e) {
            if ("number" == typeof e) {
                let t = c(e);
                return !!t && o.v.includes(t)
            }
            return o.v.includes(e)
        }
        if (void 0 !== t) {
            if ((0, r.s)(a.z, t)) return o.U.includes(u(t));
            if ((0, r.s)(a.e, t)) return o.U.includes(d(t));
            if ((0, r.s)(i.i, t)) return o.U.includes(t)
        }
        return !1
    }, "q", 0, function(e, t) {
        let a = e.toLowerCase(),
            s = f.has(a) ? "".concat(a, "accessory") : a;
        return "".concat("".concat("https://assets.create.roblox.com/c0ff46001a33469d7c113d2197ac228e8375dd72/assets", "/unifiedFeeSystem"), "/").concat(t ? "".concat(s, ".svg") : "".concat(s, "_black.svg"))
    }, "U", 0, function(e, t) {
        return "/dashboard/creations/".concat(n.e[e], "/").concat(t, "/publish")
    }, "h", 0, function(e, t) {
        let a, s = t((a = e.replaceAll(/[^a-zA-Z0-9]/g, ""), "Label.Taxonomy".concat(a)));
        return null == s || "" === s ? e : s
    }, "v", 0, e => (null == e ? void 0 : e.revenueTargetsCount) != null && null != e.maxRevenueTargets && e.revenueTargetsCount >= e.maxRevenueTargets, "y", 0, y, "l", 0, (e, a) => null == e || e.status === t.Y.Active && !y(e, a), "k", 0, e => {
        var t, s;
        return null != (t = null == (s = l[e]) ? void 0 : s.apiType) ? t : a.a.NUMBER_0
    }, "Y", 0, c, "F", 0, e => {
        switch (e) {
            case a.z.NUMBER_0:
                return a.e.Unknown;
            case a.z.NUMBER_1:
                return a.e.Body;
            case a.z.NUMBER_2:
                return a.e.DynamicHead;
            case a.z.NUMBER_3:
                return a.e.Shoes;
            case a.z.NUMBER_4:
                return a.e.AvatarAnimations;
            default:
                return a.e.Unknown
        }
    }, "n", 0, d, "H", 0, e => {
        switch (e) {
            case i.i.Body:
                return "Body";
            case i.i.DynamicHead:
                return "DynamicHead";
            case i.i.Shoes:
                return "Shoes";
            case i.i.AvatarAnimations:
                return "AvatarAnimations";
            case i.i.Unknown:
            default:
                return "Unknown"
        }
    }])
}, 814768, 266213, 949599, e => {
    "use strict";
    var t, a, s = e.i(671376),
        n = e.i(475360),
        r = ((t = r || {}).Makeup = "Makeup", t.Avatar = "Avatar", t);
    e.s(["f", 0, r], 266213);
    var i = ((a = {})[a.Unknown = 0] = "Unknown", a[a.Body = 1] = "Body", a[a.DynamicHead = 2] = "DynamicHead", a[a.Shoes = 3] = "Shoes", a[a.AvatarAnimations = 4] = "AvatarAnimations", a);
    let o = {
            [s.f.HairAccessory]: [{
                assetType: s.f.HairAccessory,
                nameKey: "Label.HairAccessories"
            }, {
                itemType: n.f.Bundle,
                id: 2,
                nameKey: "Label.Bodies",
                bundleType: 1
            }, {
                itemType: n.f.Bundle,
                id: 2,
                nameKey: "Label.DynamicHeads",
                bundleType: 2
            }],
            [s.f.TShirt]: [{
                assetType: s.f.TShirt,
                nameKey: "Label.ClassicTShirts"
            }, {
                assetType: s.f.Shirt,
                nameKey: "Label.ClassicShirts"
            }, {
                assetType: s.f.Pants,
                nameKey: "Label.ClassicPants"
            }],
            [s.f.Hat]: [{
                assetType: s.f.Hat,
                nameKey: "Label.Hats"
            }, {
                assetType: s.f.HairAccessory,
                nameKey: "Label.HairAccessories"
            }, {
                assetType: s.f.FaceAccessory,
                nameKey: "Label.FaceAccessories"
            }, {
                assetType: s.f.NeckAccessory,
                nameKey: "Label.NeckAccessories"
            }, {
                assetType: s.f.ShoulderAccessory,
                nameKey: "Label.ShoulderAccessories"
            }, {
                assetType: s.f.FrontAccessory,
                nameKey: "Label.FrontAccessories"
            }, {
                assetType: s.f.BackAccessory,
                nameKey: "Label.BackAccessories"
            }, {
                assetType: s.f.WaistAccessory,
                nameKey: "Label.WaistAccessories"
            }],
            [s.f.TShirtAccessory]: [{
                assetType: s.f.TShirtAccessory,
                nameKey: "Label.TShirts"
            }, {
                assetType: s.f.ShirtAccessory,
                nameKey: "Label.Shirts"
            }, {
                assetType: s.f.PantsAccessory,
                nameKey: "Label.Pants"
            }, {
                assetType: s.f.JacketAccessory,
                nameKey: "Label.Jackets"
            }, {
                assetType: s.f.SweaterAccessory,
                nameKey: "Label.Sweaters"
            }, {
                assetType: s.f.ShortsAccessory,
                nameKey: "Label.ShortsAccessories"
            }, {
                assetType: s.f.DressSkirtAccessory,
                nameKey: "Label.Skirts"
            }, {
                itemType: n.f.Bundle,
                nameKey: "Label.Shoes",
                bundleType: 3
            }],
            [s.f.EmoteAnimation]: [{
                assetType: s.f.EmoteAnimation,
                nameKey: "Label.Emote"
            }, {
                itemType: n.f.Bundle,
                nameKey: "Label.AvatarAnimations",
                bundleType: 4
            }],
            [s.f.EyeMakeup]: [{
                assetType: s.f.EyeMakeup,
                nameKey: "Label.EyeMakeupAccessories"
            }, {
                assetType: s.f.LipMakeup,
                nameKey: "Label.LipMakeupAccessories"
            }, {
                assetType: s.f.FaceMakeup,
                nameKey: "Label.FaceMakeupAccessories"
            }, {
                assetType: s.f.EyebrowAccessory,
                nameKey: "Label.EyebrowAccessories"
            }, {
                assetType: s.f.EyelashAccessory,
                nameKey: "Label.EyelashAccessories"
            }, {
                lookType: r.Makeup,
                nameKey: "Label.Looks"
            }],
            [s.f.AvatarBackground]: [{
                assetType: s.f.AvatarBackground,
                nameKey: "Label.Backgrounds"
            }]
        },
        l = new Set([s.f.TShirtAccessory, s.f.PantsAccessory, s.f.SweaterAccessory]),
        c = [s.f.TShirtAccessory, s.f.ShirtAccessory, s.f.PantsAccessory, s.f.JacketAccessory, s.f.SweaterAccessory, s.f.ShortsAccessory, s.f.DressSkirtAccessory],
        u = [s.f.EyeMakeup, s.f.LipMakeup, s.f.FaceMakeup, s.f.EyebrowAccessory, s.f.EyelashAccessory],
        d = [s.f.Hat, s.f.HairAccessory, s.f.FaceAccessory, s.f.NeckAccessory, s.f.ShoulderAccessory, s.f.FrontAccessory, s.f.BackAccessory, s.f.WaistAccessory];
    e.s(["U", 0, d, "w", 0, o, "i", () => i, "o", 0, c, "t", 0, 30, "l", 0, 30, "n", 0, u, "S", 0, 50, "X", 0, l, "V", 0, {
        nameKey: "Label.Recents",
        isRecents: !0
    }], 949599), e.s(["f", 0, e => {
        switch (e) {
            case "Body":
                return i.Body;
            case "DynamicHead":
                return i.DynamicHead;
            case "Shoes":
                return i.Shoes;
            case "AvatarAnimations":
                return i.AvatarAnimations;
            default:
                return i.Unknown
        }
    }], 814768)
}, 812141, e => {
    "use strict";
    var t = e.i(60584),
        a = e.i(910272);
    let s = {},
        n = e => ["folders", null != e ? e : null];
    e.s(["U", 0, function(e) {
        return (0, a.f)({
            queryKey: ["metadata"],
            queryFn: async () => {
                try {
                    let t = await e.getCollectiblesMetadata();
                    return null != t ? t : s
                } catch (e) {
                    return s
                }
            }
        })
    }, "o", 0, n, "Q", 0, function(e, a) {
        let {
            onSuccess: s,
            onError: n
        } = a;
        return (0, t.f)({
            mutationFn: t => e.addItemToFolder(t.itemId, t.itemType, t.folderId),
            onSuccess: s,
            onError: n
        })
    }, "P", 0, function(e, a) {
        let {
            onSuccess: s,
            onError: n
        } = a;
        return (0, t.f)({
            mutationFn: t => e.createFolder(t.name, void 0, t.groupId),
            onSuccess: e => {
                var t;
                return s(null != (t = e.folderId) ? t : "")
            },
            onError: n
        })
    }, "s", 0, function(e, t) {
        let s = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
        return (0, a.f)({
            queryKey: n(t),
            queryFn: () => e.getFolders(t),
            enabled: s
        })
    }, "y", 0, function(e, a) {
        let {
            onSuccess: s,
            onError: n
        } = a;
        return (0, t.f)({
            mutationFn: t => e.updateFolder(t.folderId, t.name),
            onSuccess: s,
            onError: n
        })
    }])
}]);

//# debugId=377d5f3f-b9a3-e016-0814-cddd35a1747a
//# sourceMappingURL=2dfraf3y04awe.js.map