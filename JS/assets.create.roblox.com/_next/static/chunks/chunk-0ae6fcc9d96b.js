;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7b48a4b1-1209-eb0c-84f3-776df3cd99b4")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 642663, e => {
    "use strict";
    var o = e.i(336288);
    e.s(["f", () => o.W])
}, 791540, e => {
    "use strict";
    var o = e.i(415858),
        t = function(e, o) {
            return (t = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, o) {
                e.__proto__ = o
            } || function(e, o) {
                for (var t in o) Object.prototype.hasOwnProperty.call(o, t) && (e[t] = o[t])
            })(e, o)
        };

    function r(e, o) {
        if ("function" != typeof o && null !== o) throw TypeError("Class extends value " + String(o) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        t(e, o), e.prototype = null === o ? Object.create(o) : (r.prototype = o.prototype, new r)
    }

    function n(e, o, t, r) {
        return new(t || (t = Promise))(function(n, i) {
            function u(e) {
                try {
                    a(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                try {
                    a(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function a(e) {
                var o;
                e.done ? n(e.value) : ((o = e.value) instanceof t ? o : new t(function(e) {
                    e(o)
                })).then(u, s)
            }
            a((r = r.apply(e, o || [])).next())
        })
    }

    function i(e, o) {
        var t, r, n, i = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return u.next = s(0), u.throw = s(1), u.return = s(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
            return this
        }), u;

        function s(s) {
            return function(a) {
                var l = [s, a];
                if (t) throw TypeError("Generator is already executing.");
                for (; u && (u = 0, l[0] && (i = 0)), i;) try {
                    if (t = 1, r && (n = 2 & l[0] ? r.return : l[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, l[1])).done) return n;
                    switch (r = 0, n && (l = [2 & l[0], n.value]), l[0]) {
                        case 0:
                        case 1:
                            n = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = i.trys).length > 0 && n[n.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < n[1]) {
                                i.label = n[1], n = l;
                                break
                            }
                            if (n && i.label < n[2]) {
                                i.label = n[2], i.ops.push(l);
                                break
                            }
                            n[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = o.call(e, i)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    t = n = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function u(e, t) {
        var r, n, i;
        return null == e ? e : {
            version: (0, o.u)(e, "version") ? e.version : void 0,
            order: (0, o.u)(e, "order") ? e.order : void 0,
            puffiness: (0, o.u)(e, "puffiness") ? e.puffiness : void 0,
            position: (0, o.u)(e, "position") ? null == (r = e.position) ? r : {
                x: (0, o.u)(r, "x") ? r.x : void 0,
                y: (0, o.u)(r, "y") ? r.y : void 0,
                z: (0, o.u)(r, "z") ? r.z : void 0
            } : void 0,
            rotation: (0, o.u)(e, "rotation") ? null == (n = e.rotation) ? n : {
                x: (0, o.u)(n, "x") ? n.x : void 0,
                y: (0, o.u)(n, "y") ? n.y : void 0,
                z: (0, o.u)(n, "z") ? n.z : void 0
            } : void 0,
            scale: (0, o.u)(e, "scale") ? null == (i = e.scale) ? i : {
                scale: (0, o.u)(i, "scale") ? i.scale : void 0,
                x: (0, o.u)(i, "x") ? i.x : void 0,
                y: (0, o.u)(i, "y") ? i.y : void 0,
                z: (0, o.u)(i, "z") ? i.z : void 0
            } : void 0,
            headShape: (0, o.u)(e, "headShape") ? e.headShape : void 0
        }
    }

    function s(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, o.u)(t, "id") ? t.id : void 0,
            bundleId: (0, o.u)(t, "bundleId") ? t.bundleId : void 0,
            meta: (0, o.u)(t, "meta") ? u(t.meta) : void 0
        }
    }

    function a(e) {
        if (void 0 !== e) return null === e ? null : {
            id: e.id,
            bundleId: e.bundleId,
            meta: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    version: e.version,
                    order: e.order,
                    puffiness: e.puffiness,
                    position: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            x: e.x,
                            y: e.y,
                            z: e.z
                        }
                    }(e.position),
                    rotation: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            x: e.x,
                            y: e.y,
                            z: e.z
                        }
                    }(e.rotation),
                    scale: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            scale: e.scale,
                            x: e.x,
                            y: e.y,
                            z: e.z
                        }
                    }(e.scale),
                    headShape: e.headShape
                }
            }(e.meta)
        }
    }

    function l(e) {
        var t;
        return null == (t = e) ? t : {
            lookId: (0, o.u)(t, "lookId") ? t.lookId : void 0,
            success: (0, o.u)(t, "success") ? t.success : void 0,
            errorMessage: (0, o.u)(t, "errorMessage") ? t.errorMessage : void 0
        }
    }

    function d(e) {
        return e
    }

    function c(e, t) {
        return null == e ? e : {
            backgroundType: (0, o.u)(e, "backgroundType") ? e.backgroundType : void 0,
            backgroundValue: (0, o.u)(e, "backgroundValue") ? e.backgroundValue : void 0,
            emoteAssetId: (0, o.u)(e, "emoteAssetId") ? e.emoteAssetId : void 0
        }
    }

    function v(e) {
        var t;
        return null == (t = e) ? t : {
            errorCode: (0, o.u)(t, "errorCode") ? t.errorCode : void 0,
            errorDescription: (0, o.u)(t, "errorDescription") ? t.errorDescription : void 0,
            warnings: (0, o.u)(t, "warnings") ? null === t.warnings ? null : t.warnings.map(v) : void 0
        }
    }

    function p(e, t) {
        return null == e ? e : {
            type: (0, o.u)(e, "type") ? e.type : void 0,
            id: (0, o.u)(e, "id") ? e.id : void 0,
            name: (0, o.u)(e, "name") ? e.name : void 0,
            hasVerifiedBadge: (0, o.u)(e, "hasVerifiedBadge") ? e.hasVerifiedBadge : void 0
        }
    }

    function h(e) {
        var t;
        return null == (t = e) ? t : {
            discountCampaign: (0, o.u)(t, "discountCampaign") ? t.discountCampaign : void 0,
            robuxDiscountPercentage: (0, o.u)(t, "robuxDiscountPercentage") ? t.robuxDiscountPercentage : void 0,
            robuxDiscountAmount: (0, o.u)(t, "robuxDiscountAmount") ? t.robuxDiscountAmount : void 0,
            localizedDiscountAttribution: (0, o.u)(t, "localizedDiscountAttribution") ? t.localizedDiscountAttribution : void 0
        }
    }

    function k(e, t) {
        return null == e ? e : {
            originalPrice: (0, o.u)(e, "originalPrice") ? e.originalPrice : void 0,
            totalAmountSaved: (0, o.u)(e, "totalAmountSaved") ? e.totalAmountSaved : void 0,
            discounts: (0, o.u)(e, "discounts") ? null === e.discounts ? null : e.discounts.map(h) : void 0
        }
    }

    function f(e) {
        var t;
        return null == (t = e) ? t : {
            sellerUserId: (0, o.u)(t, "sellerUserId") ? t.sellerUserId : void 0,
            collectibleItemInstanceId: (0, o.u)(t, "collectibleItemInstanceId") ? t.collectibleItemInstanceId : void 0,
            collectibleProductId: (0, o.u)(t, "collectibleProductId") ? t.collectibleProductId : void 0,
            price: (0, o.u)(t, "price") ? t.price : void 0,
            userAssetId: (0, o.u)(t, "userAssetId") ? t.userAssetId : void 0,
            isOriginalSeller: (0, o.u)(t, "isOriginalSeller") ? t.isOriginalSeller : void 0
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, o.u)(t, "id") ? t.id : void 0,
            name: (0, o.u)(t, "name") ? t.name : void 0,
            description: (0, o.u)(t, "description") ? t.description : void 0,
            priceInRobux: (0, o.u)(t, "priceInRobux") ? t.priceInRobux : void 0,
            collectibleItemId: (0, o.u)(t, "collectibleItemId") ? t.collectibleItemId : void 0,
            collectibleProductId: (0, o.u)(t, "collectibleProductId") ? t.collectibleProductId : void 0,
            bundleIdToPurchaseFrom: (0, o.u)(t, "bundleIdToPurchaseFrom") ? t.bundleIdToPurchaseFrom : void 0,
            isPurchasable: (0, o.u)(t, "isPurchasable") ? t.isPurchasable : void 0,
            quantityOwned: (0, o.u)(t, "quantityOwned") ? t.quantityOwned : void 0,
            shouldPurchaseFromOriginalStock: (0, o.u)(t, "shouldPurchaseFromOriginalStock") ? t.shouldPurchaseFromOriginalStock : void 0,
            assetType: (0, o.u)(t, "assetType") ? t.assetType : void 0,
            order: (0, o.u)(t, "order") ? t.order : void 0,
            premiumPriceInRobux: (0, o.u)(t, "premiumPriceInRobux") ? t.premiumPriceInRobux : void 0,
            resellers: (0, o.u)(t, "resellers") ? null === t.resellers ? null : t.resellers.map(f) : void 0,
            catalogItemRestrictions: (0, o.u)(t, "catalogItemRestrictions") ? null === t.catalogItemRestrictions ? null : t.catalogItemRestrictions.map(d) : void 0
        }
    }

    function y(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, o.u)(t, "id") ? t.id : void 0,
            assetType: (0, o.u)(t, "assetType") ? t.assetType : void 0,
            isIncluded: (0, o.u)(t, "isIncluded") ? t.isIncluded : void 0,
            meta: (0, o.u)(t, "meta") ? u(t.meta) : void 0,
            supportsHeadShapes: (0, o.u)(t, "supportsHeadShapes") ? t.supportsHeadShapes : void 0
        }
    }

    function I(e) {
        var t;
        return null == (t = e) ? t : {
            days: (0, o.u)(t, "days") ? t.days : void 0,
            price: (0, o.u)(t, "price") ? t.price : void 0,
            discountInformation: (0, o.u)(t, "discountInformation") ? k(t.discountInformation) : void 0
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, o.u)(t, "id") ? t.id : void 0,
            name: (0, o.u)(t, "name") ? t.name : void 0,
            description: (0, o.u)(t, "description") ? t.description : void 0,
            priceInRobux: (0, o.u)(t, "priceInRobux") ? t.priceInRobux : void 0,
            discountInformation: (0, o.u)(t, "discountInformation") ? k(t.discountInformation) : void 0,
            collectibleItemId: (0, o.u)(t, "collectibleItemId") ? t.collectibleItemId : void 0,
            collectibleProductId: (0, o.u)(t, "collectibleProductId") ? t.collectibleProductId : void 0,
            isPurchasable: (0, o.u)(t, "isPurchasable") ? t.isPurchasable : void 0,
            quantityOwned: (0, o.u)(t, "quantityOwned") ? t.quantityOwned : void 0,
            assetType: (0, o.u)(t, "assetType") ? t.assetType : void 0,
            bundleType: (0, o.u)(t, "bundleType") ? t.bundleType : void 0,
            creator: (0, o.u)(t, "creator") ? p(t.creator) : void 0,
            assetsInBundle: (0, o.u)(t, "assetsInBundle") ? null === t.assetsInBundle ? null : t.assetsInBundle.map(y) : void 0,
            noPriceStatus: (0, o.u)(t, "noPriceStatus") ? t.noPriceStatus : void 0,
            itemRestrictions: (0, o.u)(t, "itemRestrictions") ? null === t.itemRestrictions ? null : t.itemRestrictions.map(d) : void 0,
            itemType: (0, o.u)(t, "itemType") ? t.itemType : void 0,
            meta: (0, o.u)(t, "meta") ? u(t.meta) : void 0,
            supportsHeadShapes: (0, o.u)(t, "supportsHeadShapes") ? t.supportsHeadShapes : void 0,
            timedOptions: (0, o.u)(t, "timedOptions") ? null === t.timedOptions ? null : t.timedOptions.map(I) : void 0
        }
    }

    function g(e, t) {
        var r, n, i, u;
        return null == e ? e : {
            look: (0, o.u)(e, "look") ? null == (r = e.look) ? r : {
                lookId: (0, o.u)(r, "lookId") ? r.lookId : void 0,
                items: (0, o.u)(r, "items") ? null === r.items ? null : r.items.map(w) : void 0,
                curator: (0, o.u)(r, "curator") ? p(r.curator) : void 0,
                totalValue: (0, o.u)(r, "totalValue") ? r.totalValue : void 0,
                totalPrice: (0, o.u)(r, "totalPrice") ? r.totalPrice : void 0,
                favoriteCount: (0, o.u)(r, "favoriteCount") ? r.favoriteCount : void 0,
                avatarProperties: (0, o.u)(r, "avatarProperties") ? null == (n = r.avatarProperties) ? n : {
                    playerAvatarType: (0, o.u)(n, "playerAvatarType") ? n.playerAvatarType : void 0,
                    bodyColor3s: (0, o.u)(n, "bodyColor3s") ? null == (i = n.bodyColor3s) ? i : {
                        headColor3: (0, o.u)(i, "headColor3") ? i.headColor3 : void 0,
                        leftArmColor3: (0, o.u)(i, "leftArmColor3") ? i.leftArmColor3 : void 0,
                        leftLegColor3: (0, o.u)(i, "leftLegColor3") ? i.leftLegColor3 : void 0,
                        rightArmColor3: (0, o.u)(i, "rightArmColor3") ? i.rightArmColor3 : void 0,
                        rightLegColor3: (0, o.u)(i, "rightLegColor3") ? i.rightLegColor3 : void 0,
                        torsoColor3: (0, o.u)(i, "torsoColor3") ? i.torsoColor3 : void 0
                    } : void 0,
                    scale: (0, o.u)(n, "scale") ? null == (u = n.scale) ? u : {
                        height: (0, o.u)(u, "height") ? u.height : void 0,
                        width: (0, o.u)(u, "width") ? u.width : void 0,
                        head: (0, o.u)(u, "head") ? u.head : void 0,
                        proportion: (0, o.u)(u, "proportion") ? u.proportion : void 0,
                        bodyType: (0, o.u)(u, "bodyType") ? u.bodyType : void 0,
                        depth: (0, o.u)(u, "depth") ? u.depth : void 0
                    } : void 0
                } : void 0,
                createdTime: (0, o.u)(r, "createdTime") ? new Date(r.createdTime) : void 0,
                updatedTime: (0, o.u)(r, "updatedTime") ? new Date(r.updatedTime) : void 0,
                lookType: (0, o.u)(r, "lookType") ? r.lookType : void 0,
                moderationStatus: (0, o.u)(r, "moderationStatus") ? r.moderationStatus : void 0,
                name: (0, o.u)(r, "name") ? r.name : void 0,
                description: (0, o.u)(r, "description") ? r.description : void 0,
                displayProperties: (0, o.u)(r, "displayProperties") ? c(r.displayProperties) : void 0,
                creatingUniverseId: (0, o.u)(r, "creatingUniverseId") ? r.creatingUniverseId : void 0,
                rootPlaceId: (0, o.u)(r, "rootPlaceId") ? r.rootPlaceId : void 0,
                universeName: (0, o.u)(r, "universeName") ? r.universeName : void 0,
                outfitId: (0, o.u)(r, "outfitId") ? r.outfitId : void 0
            } : void 0,
            errorCode: (0, o.u)(e, "errorCode") ? e.errorCode : void 0,
            errorDescription: (0, o.u)(e, "errorDescription") ? e.errorDescription : void 0,
            warnings: (0, o.u)(e, "warnings") ? null === e.warnings ? null : e.warnings.map(v) : void 0
        }
    }

    function b(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, o.u)(t, "id") ? t.id : void 0
        }
    }

    function P(e) {
        var t;
        return null == (t = e) ? t : {
            lookId: (0, o.u)(t, "lookId") ? t.lookId : void 0,
            moderationStatus: (0, o.u)(t, "moderationStatus") ? t.moderationStatus : void 0,
            displayProperties: (0, o.u)(t, "displayProperties") ? c(t.displayProperties) : void 0,
            lookType: (0, o.u)(t, "lookType") ? t.lookType : void 0,
            assets: (0, o.u)(t, "assets") ? null === t.assets ? null : t.assets.map(b) : void 0,
            bundles: (0, o.u)(t, "bundles") ? null === t.bundles ? null : t.bundles.map(b) : void 0,
            totalValue: (0, o.u)(t, "totalValue") ? t.totalValue : void 0,
            name: (0, o.u)(t, "name") ? t.name : void 0,
            createdTime: (0, o.u)(t, "createdTime") ? new Date(t.createdTime) : void 0,
            updatedTime: (0, o.u)(t, "updatedTime") ? new Date(t.updatedTime) : void 0,
            outfitId: (0, o.u)(t, "outfitId") ? t.outfitId : void 0,
            eligibleForFreeAvatar: (0, o.u)(t, "eligibleForFreeAvatar") ? t.eligibleForFreeAvatar : void 0
        }
    }

    function T(e, t) {
        return null == e ? e : {
            data: (0, o.u)(e, "data") ? null === e.data ? null : e.data.map(P) : void 0,
            nextCursor: (0, o.u)(e, "nextCursor") ? e.nextCursor : void 0,
            previousCursor: (0, o.u)(e, "previousCursor") ? e.previousCursor : void 0
        }
    }

    function L(e) {
        if (void 0 !== e) return null === e ? null : {
            id: e.id,
            lookType: e.lookType
        }
    }

    function C(e, t) {
        return null == e ? e : {
            isFavorited: (0, o.u)(e, "isFavorited") ? e.isFavorited : void 0
        }
    }

    function R(e) {
        if (void 0 !== e) return null === e ? null : {
            itemType: e.itemType,
            itemId: e.itemId,
            days: e.days
        }
    }

    function S(e) {
        return e
    }
    var U = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(t, e), t.prototype.avatarUniverseLinkGetLinkedAvatarsByUniverseRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new o.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling avatarUniverseLinkGetLinkedAvatarsByUniverse.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/avatars".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/avatars",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return null == e ? e : {
                                        lookIds: (0, o.u)(e, "lookIds") ? e.lookIds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.avatarUniverseLinkGetLinkedAvatarsByUniverse = function(e, o) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.avatarUniverseLinkGetLinkedAvatarsByUniverseRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.avatarUniverseLinkLinkAvatarsToUniverseRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new o.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling avatarUniverseLinkLinkAvatarsToUniverse.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/{universeId}/avatars/link".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/avatars/link",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            lookIds: e.lookIds
                                        }
                                    }(e.avatarUniverseLinkLinkAvatarsToUniverseRequest)
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return null == e ? e : {
                                        success: (0, o.u)(e, "success") ? e.success : void 0,
                                        errorMessage: (0, o.u)(e, "errorMessage") ? e.errorMessage : void 0,
                                        results: (0, o.u)(e, "results") ? null === e.results ? null : e.results.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.avatarUniverseLinkLinkAvatarsToUniverse = function(e, o) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.avatarUniverseLinkLinkAvatarsToUniverseRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.avatarUniverseLinkUnlinkAvatarsFromUniverseRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new o.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling avatarUniverseLinkUnlinkAvatarsFromUniverse.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/{universeId}/avatars/unlink".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/avatars/unlink",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            lookIds: e.lookIds
                                        }
                                    }(e.avatarUniverseLinkUnlinkAvatarsFromUniverseRequest)
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return null == e ? e : {
                                        success: (0, o.u)(e, "success") ? e.success : void 0,
                                        errorMessage: (0, o.u)(e, "errorMessage") ? e.errorMessage : void 0,
                                        results: (0, o.u)(e, "results") ? null === e.results ? null : e.results.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.avatarUniverseLinkUnlinkAvatarsFromUniverse = function(e, o) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.avatarUniverseLinkUnlinkAvatarsFromUniverseRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(o._),
        A = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(t, e), t.prototype.lookCreateLookRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/looks/create",
                                    schemaPath: "/v1/looks/create",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description,
                                            displayProperties: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    backgroundType: e.backgroundType,
                                                    backgroundValue: e.backgroundValue,
                                                    emoteAssetId: e.emoteAssetId
                                                }
                                            }(e.displayProperties),
                                            avatarProperties: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    playerAvatarType: e.playerAvatarType,
                                                    bodyColor3s: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            headColor3: e.headColor3,
                                                            leftArmColor3: e.leftArmColor3,
                                                            leftLegColor3: e.leftLegColor3,
                                                            rightArmColor3: e.rightArmColor3,
                                                            rightLegColor3: e.rightLegColor3,
                                                            torsoColor3: e.torsoColor3
                                                        }
                                                    }(e.bodyColor3s),
                                                    scale: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            height: e.height,
                                                            width: e.width,
                                                            head: e.head,
                                                            proportion: e.proportion,
                                                            bodyType: e.bodyType,
                                                            depth: e.depth
                                                        }
                                                    }(e.scale)
                                                }
                                            }(e.avatarProperties),
                                            assets: void 0 === e.assets ? void 0 : null === e.assets ? null : e.assets.map(a),
                                            lookType: e.lookType,
                                            validationType: e.validationType,
                                            groupId: e.groupId
                                        }
                                    }(e.lookCreateLookRequest)
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return null == e ? e : {
                                        id: (0, o.u)(e, "id") ? e.id : void 0,
                                        errorCode: (0, o.u)(e, "errorCode") ? e.errorCode : void 0,
                                        errorDescription: (0, o.u)(e, "errorDescription") ? e.errorDescription : void 0,
                                        warnings: (0, o.u)(e, "warnings") ? null === e.warnings ? null : e.warnings.map(v) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.lookCreateLook = function() {
                return n(this, arguments, void 0, function(e, o) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookCreateLookRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookCreateLookFavoriteRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/looks/favorite/create",
                                    schemaPath: "/v1/looks/favorite/create",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: L(e.lookCreateLookFavoriteRequest)
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, t.prototype.lookCreateLookFavorite = function() {
                return n(this, arguments, void 0, function(e, o) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookCreateLookFavoriteRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookDeleteAvatarRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.lookId || void 0 === e.lookId) throw new o.w("lookId", "Required parameter requestParameters.lookId was null or undefined when calling lookDeleteAvatar.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/looks/{lookId}".replace("{".concat("lookId", "}"), encodeURIComponent(String(e.lookId))),
                                    schemaPath: "/v1/looks/{lookId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.V(u)]
                        }
                    })
                })
            }, t.prototype.lookDeleteAvatar = function(e, o) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookDeleteAvatarRaw(e, o)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, t.prototype.lookDeleteLookFavoriteRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/looks/favorite/delete",
                                    schemaPath: "/v1/looks/favorite/delete",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: L(e.lookCreateLookFavoriteRequest)
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, t.prototype.lookDeleteLookFavorite = function() {
                return n(this, arguments, void 0, function(e, o) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookDeleteLookFavoriteRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookGetFavoriteLookRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.lookId || void 0 === e.lookId) throw new o.w("lookId", "Required parameter requestParameters.lookId was null or undefined when calling lookGetFavoriteLook.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/looks/{lookId}/favorite".replace("{".concat("lookId", "}"), encodeURIComponent(String(e.lookId))),
                                    schemaPath: "/v1/looks/{lookId}/favorite",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return C(e)
                                })]
                        }
                    })
                })
            }, t.prototype.lookGetFavoriteLook = function(e, o) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookGetFavoriteLookRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookGetFavoritedLooksPagedRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.userId && (r.userId = e.userId), void 0 !== e.lookType && (r.lookType = e.lookType), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.isPrevious && (r.isPrevious = e.isPrevious), n = {}, [4, this.request({
                                    path: "/v1/looks/favorites",
                                    schemaPath: "/v1/looks/favorites",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return null == e ? e : {
                                        lookIds: (0, o.u)(e, "lookIds") ? e.lookIds : void 0,
                                        previousPageCursor: (0, o.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, o.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.lookGetFavoritedLooksPaged = function() {
                return n(this, arguments, void 0, function(e, o) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookGetFavoritedLooksPagedRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookGetFeaturesEnabledRaw = function(e) {
                return n(this, void 0, void 0, function() {
                    var t, r, n;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/me/features",
                                    schemaPath: "/v1/me/features",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, e)];
                            case 1:
                                return n = i.sent(), [2, new o.H(n, function(e) {
                                    return null == e ? e : {
                                        makeupLookStudioCreation: (0, o.u)(e, "makeupLookStudioCreation") ? e.makeupLookStudioCreation : void 0,
                                        avatarLookStudioCreation: (0, o.u)(e, "avatarLookStudioCreation") ? e.avatarLookStudioCreation : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.lookGetFeaturesEnabled = function(e) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return [4, this.lookGetFeaturesEnabledRaw(e)];
                            case 1:
                                return [4, o.sent().value()];
                            case 2:
                                return [2, o.sent()]
                        }
                    })
                })
            }, t.prototype.lookGetLookDetailRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.lookId || void 0 === e.lookId) throw new o.w("lookId", "Required parameter requestParameters.lookId was null or undefined when calling lookGetLookDetail.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/looks/{LookId}".replace("{".concat("lookId", "}"), encodeURIComponent(String(e.lookId))),
                                    schemaPath: "/v1/looks/{LookId}",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        look: (0, o.u)(e, "look") ? null == (t = e.look) ? t : {
                                            lookId: (0, o.u)(t, "lookId") ? t.lookId : void 0,
                                            items: (0, o.u)(t, "items") ? null === t.items ? null : t.items.map(m) : void 0,
                                            totalPrice: (0, o.u)(t, "totalPrice") ? t.totalPrice : void 0,
                                            totalPremiumPrice: (0, o.u)(t, "totalPremiumPrice") ? t.totalPremiumPrice : void 0,
                                            createdTime: (0, o.u)(t, "createdTime") ? new Date(t.createdTime) : void 0,
                                            updatedTime: (0, o.u)(t, "updatedTime") ? new Date(t.updatedTime) : void 0
                                        } : void 0,
                                        errorCode: (0, o.u)(e, "errorCode") ? e.errorCode : void 0,
                                        errorDescription: (0, o.u)(e, "errorDescription") ? e.errorDescription : void 0,
                                        warnings: (0, o.u)(e, "warnings") ? null === e.warnings ? null : e.warnings.map(v) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.lookGetLookDetail = function(e, o) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookGetLookDetailRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookGetLooksByCuratorRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.curatorUserIdString || void 0 === e.curatorUserIdString) throw new o.w("curatorUserIdString", "Required parameter requestParameters.curatorUserIdString was null or undefined when calling lookGetLooksByCurator.");
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.isPrevious && (r.isPrevious = e.isPrevious), n = {}, [4, this.request({
                                    path: "/v1/users/{curatorUserIdString}/looks".replace("{".concat("curatorUserIdString", "}"), encodeURIComponent(String(e.curatorUserIdString))),
                                    schemaPath: "/v1/users/{curatorUserIdString}/looks",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.lookGetLooksByCurator = function(e, o) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookGetLooksByCuratorRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookGetLooksByCuratorAndTypeRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.curatorUserIdString || void 0 === e.curatorUserIdString) throw new o.w("curatorUserIdString", "Required parameter requestParameters.curatorUserIdString was null or undefined when calling lookGetLooksByCuratorAndType.");
                                if (null === e.lookType || void 0 === e.lookType) throw new o.w("lookType", "Required parameter requestParameters.lookType was null or undefined when calling lookGetLooksByCuratorAndType.");
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.isPrevious && (r.isPrevious = e.isPrevious), void 0 !== e.universeId && (r.universeId = e.universeId), n = {}, [4, this.request({
                                    path: "/v1/users/{curatorUserIdString}/looks/{lookType}".replace("{".concat("curatorUserIdString", "}"), encodeURIComponent(String(e.curatorUserIdString))).replace("{".concat("lookType", "}"), encodeURIComponent(String(e.lookType))),
                                    schemaPath: "/v1/users/{curatorUserIdString}/looks/{lookType}",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.lookGetLooksByCuratorAndType = function(e, o) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookGetLooksByCuratorAndTypeRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookGetLooksByGroupCuratorAndTypeRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.curatorGroupIdString || void 0 === e.curatorGroupIdString) throw new o.w("curatorGroupIdString", "Required parameter requestParameters.curatorGroupIdString was null or undefined when calling lookGetLooksByGroupCuratorAndType.");
                                if (null === e.lookType || void 0 === e.lookType) throw new o.w("lookType", "Required parameter requestParameters.lookType was null or undefined when calling lookGetLooksByGroupCuratorAndType.");
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.isPrevious && (r.isPrevious = e.isPrevious), void 0 !== e.universeId && (r.universeId = e.universeId), n = {}, [4, this.request({
                                    path: "/v1/groups/{curatorGroupIdString}/looks/{lookType}".replace("{".concat("curatorGroupIdString", "}"), encodeURIComponent(String(e.curatorGroupIdString))).replace("{".concat("lookType", "}"), encodeURIComponent(String(e.lookType))),
                                    schemaPath: "/v1/groups/{curatorGroupIdString}/looks/{lookType}",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return T(e)
                                })]
                        }
                    })
                })
            }, t.prototype.lookGetLooksByGroupCuratorAndType = function(e, o) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookGetLooksByGroupCuratorAndTypeRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookPreviewLookRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/looks/preview",
                                    schemaPath: "/v1/looks/preview",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            assets: void 0 === e.assets ? void 0 : null === e.assets ? null : e.assets.map(a),
                                            lookType: e.lookType,
                                            validationType: e.validationType,
                                            groupId: e.groupId
                                        }
                                    }(e.lookPreviewLookRequest)
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        look: (0, o.u)(e, "look") ? null == (t = e.look) ? t : {
                                            totalValue: (0, o.u)(t, "totalValue") ? t.totalValue : void 0,
                                            totalPrice: (0, o.u)(t, "totalPrice") ? t.totalPrice : void 0,
                                            items: (0, o.u)(t, "items") ? null === t.items ? null : t.items.map(w) : void 0
                                        } : void 0,
                                        errorCode: (0, o.u)(e, "errorCode") ? e.errorCode : void 0,
                                        errorDescription: (0, o.u)(e, "errorDescription") ? e.errorDescription : void 0,
                                        warnings: (0, o.u)(e, "warnings") ? null === e.warnings ? null : e.warnings.map(v) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.lookPreviewLook = function() {
                return n(this, arguments, void 0, function(e, o) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookPreviewLookRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookPurchaseDetailsRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/looks/purchase-details",
                                    schemaPath: "/v1/looks/purchase-details",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            assets: void 0 === e.assets ? void 0 : null === e.assets ? null : e.assets.map(a)
                                        }
                                    }(e.lookPurchaseDetailsRequest)
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.H(u, function(e) {
                                    return null == e ? e : {
                                        assets: (0, o.u)(e, "assets") ? null === e.assets ? null : e.assets.map(s) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.lookPurchaseDetails = function() {
                return n(this, arguments, void 0, function(e, o) {
                    return void 0 === e && (e = {}), i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookPurchaseDetailsRaw(e, o)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.lookUpdateLookRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var r, n, u;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.lookId || void 0 === e.lookId) throw new o.w("lookId", "Required parameter requestParameters.lookId was null or undefined when calling lookUpdateLook.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/looks/{lookId}".replace("{".concat("lookId", "}"), encodeURIComponent(String(e.lookId))),
                                    schemaPath: "/v1/looks/{lookId}",
                                    method: "PATCH",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description
                                        }
                                    }(e.lookUpdateLookRequest)
                                }, t)];
                            case 1:
                                return u = i.sent(), [2, new o.V(u)]
                        }
                    })
                })
            }, t.prototype.lookUpdateLook = function(e, o) {
                return n(this, void 0, void 0, function() {
                    return i(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.lookUpdateLookRaw(e, o)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, t
        }(o._);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        r(t, e), t.prototype.lookV2GetLookDetailByOutfitIdV2Raw = function(e, t) {
            return n(this, void 0, void 0, function() {
                var r, n, u;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.outfitId || void 0 === e.outfitId) throw new o.w("outfitId", "Required parameter requestParameters.outfitId was null or undefined when calling lookV2GetLookDetailByOutfitIdV2.");
                            return r = {}, n = {}, [4, this.request({
                                path: "/v2/looks/by-outfit/{outfitId}".replace("{".concat("outfitId", "}"), encodeURIComponent(String(e.outfitId))),
                                schemaPath: "/v2/looks/by-outfit/{outfitId}",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return u = i.sent(), [2, new o.H(u, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, t.prototype.lookV2GetLookDetailByOutfitIdV2 = function(e, o) {
            return n(this, void 0, void 0, function() {
                return i(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.lookV2GetLookDetailByOutfitIdV2Raw(e, o)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.lookV2GetLookDetailV2Raw = function(e, t) {
            return n(this, void 0, void 0, function() {
                var r, n, u;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.lookId || void 0 === e.lookId) throw new o.w("lookId", "Required parameter requestParameters.lookId was null or undefined when calling lookV2GetLookDetailV2.");
                            return r = {}, n = {}, [4, this.request({
                                path: "/v2/looks/{LookId}".replace("{".concat("lookId", "}"), encodeURIComponent(String(e.lookId))),
                                schemaPath: "/v2/looks/{LookId}",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return u = i.sent(), [2, new o.H(u, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, t.prototype.lookV2GetLookDetailV2 = function(e, o) {
            return n(this, void 0, void 0, function() {
                return i(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.lookV2GetLookDetailV2Raw(e, o)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.lookV2PurchaseLookV2Raw = function(e, t) {
            return n(this, void 0, void 0, function() {
                var r, n, u;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.lookId || void 0 === e.lookId) throw new o.w("lookId", "Required parameter requestParameters.lookId was null or undefined when calling lookV2PurchaseLookV2.");
                            return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v2/looks/{LookId}/purchase".replace("{".concat("lookId", "}"), encodeURIComponent(String(e.lookId))),
                                schemaPath: "/v2/looks/{LookId}/purchase",
                                method: "POST",
                                headers: n,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        id: e.id,
                                        idempotencyKey: e.idempotencyKey,
                                        expectedPrice: e.expectedPrice,
                                        excludedAssets: void 0 === e.excludedAssets ? void 0 : null === e.excludedAssets ? null : Array.from(e.excludedAssets),
                                        excludedBundles: void 0 === e.excludedBundles ? void 0 : null === e.excludedBundles ? null : Array.from(e.excludedBundles),
                                        timedOptions: void 0 === e.timedOptions ? void 0 : null === e.timedOptions ? null : e.timedOptions.map(R)
                                    }
                                }(e.lookV2PurchaseLookV2Request)
                            }, t)];
                        case 1:
                            return u = i.sent(), [2, new o.H(u, function(e) {
                                return null == e ? e : {
                                    purchaseLookStatus: (0, o.u)(e, "purchaseLookStatus") ? e.purchaseLookStatus : void 0,
                                    assetPurchaseStatus: (0, o.u)(e, "assetPurchaseStatus") ? null === e.assetPurchaseStatus ? null : (0, o.A)(e.assetPurchaseStatus, S) : void 0,
                                    bundlePurchaseStatus: (0, o.u)(e, "bundlePurchaseStatus") ? null === e.bundlePurchaseStatus ? null : (0, o.A)(e.bundlePurchaseStatus, S) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.lookV2PurchaseLookV2 = function(e, o) {
            return n(this, void 0, void 0, function() {
                return i(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.lookV2PurchaseLookV2Raw(e, o)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    })(o._), e.s(["Q", 0, U, "V", 0, {
        Invalid: "Invalid",
        User: "User",
        Group: "Group"
    }, "B", 0, A, "L", 0, {
        Free: "Free",
        OffSale: "OffSale",
        NoResellers: "NoResellers",
        InExperience: "InExperience",
        ContentDeleted: "ContentDeleted"
    }])
}, 322489, e => {
    "use strict";
    var o = e.i(805290),
        t = e.i(791540),
        r = e.i(415858),
        n = e.i(272593);
    class i extends r._ {
        getLookDetail(e) {
            return this.request({
                path: "/v2/looks/".concat(e),
                schemaPath: "/v2/looks/{LookId}",
                method: "GET",
                headers: {}
            }).then(e => e.json())
        }
        getLooksByCuratorAndType(e, o, t, r, n) {
            return this.looksV1Api.lookGetLooksByCuratorAndType({
                curatorUserIdString: e,
                lookType: o,
                limit: t,
                cursor: r,
                isPrevious: n
            })
        }
        getLooksByGroupAndType(e, o, t, r, n) {
            return this.looksV1Api.lookGetLooksByGroupCuratorAndType({
                curatorGroupIdString: e,
                lookType: o,
                limit: t,
                cursor: r,
                isPrevious: n
            })
        }
        deleteLook(e) {
            return this.looksV1Api.lookDeleteAvatar({
                lookId: e
            })
        }
        updateLook(e, o, t) {
            return this.looksV1Api.lookUpdateLook({
                lookId: e,
                lookUpdateLookRequest: {
                    name: o,
                    description: t
                }
            })
        }
        linkAvatarsToUniverse(e, o) {
            return this.avatarUniverseLinkApi.avatarUniverseLinkLinkAvatarsToUniverse({
                universeId: e,
                avatarUniverseLinkLinkAvatarsToUniverseRequest: {
                    lookIds: o
                }
            })
        }
        unlinkAvatarsFromUniverse(e, o) {
            return this.avatarUniverseLinkApi.avatarUniverseLinkUnlinkAvatarsFromUniverse({
                universeId: e,
                avatarUniverseLinkUnlinkAvatarsFromUniverseRequest: {
                    lookIds: o
                }
            })
        }
        getLinkedAvatarsByUniverse(e) {
            return this.avatarUniverseLinkApi.avatarUniverseLinkGetLinkedAvatarsByUniverse({
                universeId: e
            })
        }
        constructor() {
            let e = (0, n.f)("look-api", "bedev2");
            super(e), (0, o._)(this, "looksV1Api", void 0), (0, o._)(this, "avatarUniverseLinkApi", void 0), this.looksV1Api = new t.B(e), this.avatarUniverseLinkApi = new t.Q(e)
        }
    }
    let u = new i;
    e.s(["f", 0, u])
}]);

//# debugId=7b48a4b1-1209-eb0c-84f3-776df3cd99b4
//# sourceMappingURL=1ffxhooj47oxc.js.map