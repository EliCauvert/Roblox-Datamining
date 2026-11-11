;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "67deefb4-244f-6b70-f1ae-5fd73590405d")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 28918, e => {
    "use strict";
    var t = e.i(415858),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function n(e, t, r, n) {
        return new(r || (r = Promise))(function(a, i) {
            function o(e) {
                try {
                    s(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                try {
                    s(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, u)
            }
            s((n = n.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var r, n, a, i = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = u(0), o.throw = u(1), o.return = u(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function u(u) {
            return function(s) {
                var l = [u, s];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (i = 0)), i;) try {
                    if (r = 1, n && (a = 2 & l[0] ? n.return : l[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, l[1])).done) return a;
                    switch (n = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                        case 0:
                        case 1:
                            a = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < a[1]) {
                                i.label = a[1], a = l;
                                break
                            }
                            if (a && i.label < a[2]) {
                                i.label = a[2], i.ops.push(l);
                                break
                            }
                            a[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    r = a = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function i(e) {
        var r, n;
        return null == (r = e) ? r : {
            collectibleItemInstanceId: (0, t.u)(r, "collectibleItemInstanceId") ? r.collectibleItemInstanceId : void 0,
            renter: (0, t.u)(r, "renter") ? null == (n = r.renter) ? n : {
                id: (0, t.u)(n, "id") ? n.id : void 0,
                name: (0, t.u)(n, "name") ? n.name : void 0
            } : void 0,
            timeRemainingInSeconds: (0, t.u)(r, "timeRemainingInSeconds") ? r.timeRemainingInSeconds : void 0
        }
    }

    function o(e) {
        var r;
        return null == (r = e) ? r : {
            offerId: (0, t.u)(r, "offerId") ? r.offerId : void 0,
            localizedDescription: (0, t.u)(r, "localizedDescription") ? r.localizedDescription : void 0,
            selected: (0, t.u)(r, "selected") ? r.selected : void 0
        }
    }

    function u(e) {
        var r;
        return null == (r = e) ? r : {
            message: (0, t.u)(r, "message") ? r.message : void 0,
            code: (0, t.u)(r, "code") ? r.code : void 0
        }
    }

    function s(e) {
        var r;
        return null == (r = e) ? r : {
            robuxDiscountAmount: (0, t.u)(r, "robuxDiscountAmount") ? r.robuxDiscountAmount : void 0,
            robuxDiscountPercentage: (0, t.u)(r, "robuxDiscountPercentage") ? r.robuxDiscountPercentage : void 0,
            discountCampaign: (0, t.u)(r, "discountCampaign") ? r.discountCampaign : void 0,
            localizedDiscountAttribution: (0, t.u)(r, "localizedDiscountAttribution") ? r.localizedDiscountAttribution : void 0,
            discountType: (0, t.u)(r, "discountType") ? r.discountType : void 0,
            discountId: (0, t.u)(r, "discountId") ? r.discountId : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, r) {
        return null == e ? e : {
            originalPrice: (0, t.u)(e, "originalPrice") ? e.originalPrice : void 0,
            totalDiscountPercentage: (0, t.u)(e, "totalDiscountPercentage") ? e.totalDiscountPercentage : void 0,
            totalDiscountAmount: (0, t.u)(e, "totalDiscountAmount") ? e.totalDiscountAmount : void 0,
            discounts: (0, t.u)(e, "discounts") ? null === e.discounts ? null : e.discounts.map(s) : void 0
        }
    }

    function c(e) {
        var r;
        return null == (r = e) ? r : {
            collectibleItemId: (0, t.u)(r, "collectibleItemId") ? r.collectibleItemId : void 0,
            priceInRobux: (0, t.u)(r, "priceInRobux") ? r.priceInRobux : void 0,
            regularPriceInRobux: (0, t.u)(r, "regularPriceInRobux") ? r.regularPriceInRobux : void 0,
            discountInformation: (0, t.u)(r, "discountInformation") ? l(r.discountInformation) : void 0
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            collectibleItemId: e.collectibleItemId,
            isPermanent: e.isPermanent,
            rentalDays: e.rentalDays
        }
    }

    function m(e) {
        var r, n;
        return null == (r = e) ? r : {
            icon: (0, t.u)(r, "icon") ? r.icon : void 0,
            localizedText: (0, t.u)(r, "localizedText") ? r.localizedText : void 0,
            offerId: (0, t.u)(r, "offerId") ? r.offerId : void 0,
            offerStatus: (0, t.u)(r, "offerStatus") ? r.offerStatus : void 0,
            modal: (0, t.u)(r, "modal") ? null == (n = r.modal) ? n : {
                modalHeroIcon: (0, t.u)(n, "modalHeroIcon") ? n.modalHeroIcon : void 0,
                modalTitle: (0, t.u)(n, "modalTitle") ? n.modalTitle : void 0,
                offerBodyLinkText: (0, t.u)(n, "offerBodyLinkText") ? n.offerBodyLinkText : void 0,
                termsModalTitle: (0, t.u)(n, "termsModalTitle") ? n.termsModalTitle : void 0,
                termsBody: (0, t.u)(n, "termsBody") ? n.termsBody : void 0
            } : void 0
        }
    }

    function p(e) {
        var r;
        return null == (r = e) ? r : {
            collectibleItemId: (0, t.u)(r, "collectibleItemId") ? r.collectibleItemId : void 0,
            collectibleProductId: (0, t.u)(r, "collectibleProductId") ? r.collectibleProductId : void 0,
            targetId: (0, t.u)(r, "targetId") ? r.targetId : void 0,
            targetType: (0, t.u)(r, "targetType") ? r.targetType : void 0,
            universeId: (0, t.u)(r, "universeId") ? r.universeId : void 0,
            status: (0, t.u)(r, "status") ? r.status : void 0
        }
    }

    function v(e) {
        var r;
        return null == (r = e) ? r : {
            collectibleInstanceId: (0, t.u)(r, "collectibleInstanceId") ? r.collectibleInstanceId : void 0,
            collectibleItemId: (0, t.u)(r, "collectibleItemId") ? r.collectibleItemId : void 0,
            collectibleProductId: (0, t.u)(r, "collectibleProductId") ? r.collectibleProductId : void 0,
            serialNumber: (0, t.u)(r, "serialNumber") ? r.serialNumber : void 0,
            isHeld: (0, t.u)(r, "isHeld") ? r.isHeld : void 0,
            saleState: (0, t.u)(r, "saleState") ? r.saleState : void 0,
            price: (0, t.u)(r, "price") ? r.price : void 0,
            discountInformation: (0, t.u)(r, "discountInformation") ? l(r.discountInformation) : void 0
        }
    }

    function f(e) {
        var r;
        return null == (r = e) ? r : {
            priceFloor: (0, t.u)(r, "priceFloor") ? r.priceFloor : void 0
        }
    }

    function h(e) {
        var r;
        return null == (r = e) ? r : {
            value: (0, t.u)(r, "value") ? r.value : void 0,
            date: (0, t.u)(r, "date") ? new Date(r.date) : void 0
        }
    }

    function I(e) {
        var r;
        return null == (r = e) ? r : {
            rentalDays: (0, t.u)(r, "rentalDays") ? r.rentalDays : void 0,
            priceInRobux: (0, t.u)(r, "priceInRobux") ? r.priceInRobux : void 0,
            discountInformation: (0, t.u)(r, "discountInformation") ? l(r.discountInformation) : void 0
        }
    }

    function w(e) {
        var r, n;
        return null == (r = e) ? r : {
            collectibleProductId: (0, t.u)(r, "collectibleProductId") ? r.collectibleProductId : void 0,
            collectibleItemInstanceId: (0, t.u)(r, "collectibleItemInstanceId") ? r.collectibleItemInstanceId : void 0,
            seller: (0, t.u)(r, "seller") ? null == (n = r.seller) ? n : {
                hasVerifiedBadge: (0, t.u)(n, "hasVerifiedBadge") ? n.hasVerifiedBadge : void 0,
                sellerId: (0, t.u)(n, "sellerId") ? n.sellerId : void 0,
                sellerType: (0, t.u)(n, "sellerType") ? n.sellerType : void 0,
                name: (0, t.u)(n, "name") ? n.name : void 0
            } : void 0,
            price: (0, t.u)(r, "price") ? r.price : void 0,
            serialNumber: (0, t.u)(r, "serialNumber") ? r.serialNumber : void 0,
            errorMessage: (0, t.u)(r, "errorMessage") ? r.errorMessage : void 0,
            discountInformation: (0, t.u)(r, "discountInformation") ? l(r.discountInformation) : void 0,
            rentalOptions: (0, t.u)(r, "rentalOptions") ? null === r.rentalOptions ? null : r.rentalOptions.map(I) : void 0
        }
    }

    function P(e, r) {
        return null == e ? e : {
            purchaseResult: (0, t.u)(e, "purchaseResult") ? e.purchaseResult : void 0,
            purchased: (0, t.u)(e, "purchased") ? e.purchased : void 0,
            pending: (0, t.u)(e, "pending") ? e.pending : void 0,
            errorMessage: (0, t.u)(e, "errorMessage") ? e.errorMessage : void 0,
            reason: (0, t.u)(e, "reason") ? e.reason : void 0
        }
    }
    let g = new(function(e) {
        function s() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            r(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(s, e), s.prototype.marketplaceSalesCheckCreationAccessRaw = function(e) {
            return n(this, void 0, void 0, function() {
                var r, n, i;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return r = {}, n = {}, [4, this.request({
                                path: "/v1/item/check-creation-access",
                                schemaPath: "/v1/item/check-creation-access",
                                method: "GET",
                                headers: n,
                                query: r
                            }, e)];
                        case 1:
                            return i = a.sent(), [2, new t.H(i, function(e) {
                                return null == e ? e : {
                                    accessAllowed: (0, t.u)(e, "accessAllowed") ? e.accessAllowed : void 0,
                                    daysToUnblock: (0, t.u)(e, "daysToUnblock") ? e.daysToUnblock : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesCheckCreationAccess = function(e) {
            return n(this, void 0, void 0, function() {
                return a(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.marketplaceSalesCheckCreationAccessRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGeneratePurchaseAuthTokenRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.w("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGeneratePurchaseAuthToken.");
                            if (null === e.marketplaceSalesGeneratePurchaseAuthTokenRequest || void 0 === e.marketplaceSalesGeneratePurchaseAuthTokenRequest) throw new t.w("marketplaceSalesGeneratePurchaseAuthTokenRequest", "Required parameter requestParameters.marketplaceSalesGeneratePurchaseAuthTokenRequest was null or undefined when calling marketplaceSalesGeneratePurchaseAuthToken.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (i["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/item/{itemId}/generate-purchase-auth-token".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/generate-purchase-auth-token",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        purchaserId: e.purchaserId,
                                        purchaserType: e.purchaserType,
                                        idempotencyKey: e.idempotencyKey,
                                        collectibleProductId: e.collectibleProductId
                                    }
                                }(e.marketplaceSalesGeneratePurchaseAuthTokenRequest)
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    purchaseAuthToken: (0, t.u)(e, "purchaseAuthToken") ? e.purchaseAuthToken : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGeneratePurchaseAuthToken = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGeneratePurchaseAuthTokenRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetCartPricingRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, s;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.marketplaceSalesGetCartPricingRequest || void 0 === e.marketplaceSalesGetCartPricingRequest) throw new t.w("marketplaceSalesGetCartPricingRequest", "Required parameter requestParameters.marketplaceSalesGetCartPricingRequest was null or undefined when calling marketplaceSalesGetCartPricing.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/cart-pricing",
                                schemaPath: "/v1/cart-pricing",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        items: e.items.map(d),
                                        featureKey: e.featureKey,
                                        unselectedOffers: e.unselectedOffers
                                    }
                                }(e.marketplaceSalesGetCartPricingRequest)
                            }, r)];
                        case 1:
                            return s = a.sent(), [2, new t.H(s, function(e) {
                                return null == e ? e : {
                                    items: (0, t.u)(e, "items") ? null === e.items ? null : e.items.map(c) : void 0,
                                    savingsSummary: (0, t.u)(e, "savingsSummary") ? e.savingsSummary : void 0,
                                    availableOffers: (0, t.u)(e, "availableOffers") ? null === e.availableOffers ? null : e.availableOffers.map(o) : void 0,
                                    errors: (0, t.u)(e, "errors") ? null === e.errors ? null : e.errors.map(u) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetCartPricing = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetCartPricingRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetItemResaleDataRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.w("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGetItemResaleData.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v1/item/{itemId}/resale-data".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/resale-data",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    priceDataPoints: (0, t.u)(e, "priceDataPoints") ? null === e.priceDataPoints ? null : e.priceDataPoints.map(h) : void 0,
                                    volumeDataPoints: (0, t.u)(e, "volumeDataPoints") ? null === e.volumeDataPoints ? null : e.volumeDataPoints.map(h) : void 0,
                                    recentAveragePrice: (0, t.u)(e, "recentAveragePrice") ? e.recentAveragePrice : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetItemResaleData = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetItemResaleDataRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetItemResellableInstancesRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.w("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGetItemResellableInstances.");
                            return n = {}, void 0 !== e.ownerId && (n.OwnerId = e.ownerId), void 0 !== e.ownerType && (n.OwnerType = e.ownerType), void 0 !== e.cursor && (n.Cursor = e.cursor), void 0 !== e.limit && (n.Limit = e.limit), i = {}, [4, this.request({
                                path: "/v1/item/{itemId}/resellable-instances".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/resellable-instances",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    itemInstances: (0, t.u)(e, "itemInstances") ? null === e.itemInstances ? null : e.itemInstances.map(v) : void 0,
                                    previousPageCursor: (0, t.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, t.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetItemResellableInstances = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetItemResellableInstancesRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetItemResellersRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.w("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGetItemResellers.");
                            return n = {}, void 0 !== e.cursor && (n.Cursor = e.cursor), void 0 !== e.limit && (n.Limit = e.limit), i = {}, [4, this.request({
                                path: "/v1/item/{itemId}/resellers".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/resellers",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(w) : void 0,
                                    previousPageCursor: (0, t.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, t.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetItemResellers = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetItemResellersRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetOffersForUserRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling marketplaceSalesGetOffersForUser.");
                            if (null === e.featureKey || void 0 === e.featureKey) throw new t.w("featureKey", "Required parameter requestParameters.featureKey was null or undefined when calling marketplaceSalesGetOffersForUser.");
                            return n = {}, void 0 !== e.userId && (n.userId = e.userId), void 0 !== e.featureKey && (n.featureKey = e.featureKey), void 0 !== e.offerId && (n.offerId = e.offerId), i = {}, [4, this.request({
                                path: "/v1/offers",
                                schemaPath: "/v1/offers",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    offers: (0, t.u)(e, "offers") ? null === e.offers ? null : e.offers.map(m) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetOffersForUser = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetOffersForUserRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetResaleParametersRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.w("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGetResaleParameters.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v1/item/{itemId}/get-resale-parameters".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/get-resale-parameters",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    resalePercentageFee: (0, t.u)(e, "resalePercentageFee") ? e.resalePercentageFee : void 0,
                                    minimumFee: (0, t.u)(e, "minimumFee") ? e.minimumFee : void 0,
                                    resellableLimitedItemPriceFloors: (0, t.u)(e, "resellableLimitedItemPriceFloors") ? null === e.resellableLimitedItemPriceFloors ? null : (0, t.A)(e.resellableLimitedItemPriceFloors, f) : void 0,
                                    priceFloor: (0, t.u)(e, "priceFloor") ? e.priceFloor : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetResaleParameters = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetResaleParametersRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetResellerRentalStatusRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, o, u;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.w("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesGetResellerRentalStatus.");
                            return n = {}, o = {}, [4, this.request({
                                path: "/v1/item/{itemId}/reseller-rental-status".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/reseller-rental-status",
                                method: "GET",
                                headers: o,
                                query: n
                            }, r)];
                        case 1:
                            return u = a.sent(), [2, new t.H(u, function(e) {
                                return null == e ? e : {
                                    data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(i) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetResellerRentalStatus = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetResellerRentalStatusRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetUniverseProductConfigurationRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling marketplaceSalesGetUniverseProductConfiguration.");
                            if (null === e.targetType || void 0 === e.targetType) throw new t.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling marketplaceSalesGetUniverseProductConfiguration.");
                            if (null === e.targetId || void 0 === e.targetId) throw new t.w("targetId", "Required parameter requestParameters.targetId was null or undefined when calling marketplaceSalesGetUniverseProductConfiguration.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v1/universe/{universeId}/targetType/{targetType}/targets/{targetId}/universe-product-configuration".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("targetType", "}"), encodeURIComponent(String(e.targetType))).replace("{".concat("targetId", "}"), encodeURIComponent(String(e.targetId))),
                                schemaPath: "/v1/universe/{universeId}/targetType/{targetType}/targets/{targetId}/universe-product-configuration",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    _configuration: (0, t.u)(e, "configuration") ? p(e.configuration) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesGetUniverseProductConfiguration = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesGetUniverseProductConfigurationRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesListUniverseProductConfigurationsRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling marketplaceSalesListUniverseProductConfigurations.");
                            if (null === e.status || void 0 === e.status) throw new t.w("status", "Required parameter requestParameters.status was null or undefined when calling marketplaceSalesListUniverseProductConfigurations.");
                            return n = {}, void 0 !== e.cursor && (n.Cursor = e.cursor), void 0 !== e.limit && (n.Limit = e.limit), i = {}, [4, this.request({
                                path: "/v1/universe/{universeId}/status/{status}/universe-product-configurations".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("status", "}"), encodeURIComponent(String(e.status))),
                                schemaPath: "/v1/universe/{universeId}/status/{status}/universe-product-configurations",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(p) : void 0,
                                    previousPageCursor: (0, t.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, t.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    hasMore: (0, t.u)(e, "hasMore") ? e.hasMore : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesListUniverseProductConfigurations = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesListUniverseProductConfigurationsRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesPurchaseItemRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.w("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesPurchaseItem.");
                            if (null === e.marketplaceSalesPurchaseItemRequest || void 0 === e.marketplaceSalesPurchaseItemRequest) throw new t.w("marketplaceSalesPurchaseItemRequest", "Required parameter requestParameters.marketplaceSalesPurchaseItemRequest was null or undefined when calling marketplaceSalesPurchaseItem.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (i["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/item/{itemId}/purchase-item".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/purchase-item",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        expectedCurrency: e.expectedCurrency,
                                        expectedPrice: e.expectedPrice,
                                        expectedPurchaserId: e.expectedPurchaserId,
                                        expectedPurchaserType: e.expectedPurchaserType,
                                        collectibleProductId: e.collectibleProductId,
                                        placeId: e.placeId,
                                        idempotencyKey: e.idempotencyKey,
                                        purchaseAuthToken: e.purchaseAuthToken,
                                        rentalOptionDays: e.rentalOptionDays,
                                        offerIds: e.offerIds
                                    }
                                }(e.marketplaceSalesPurchaseItemRequest)
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return P(e)
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesPurchaseItem = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesPurchaseItemRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesPurchaseResaleRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.w("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesPurchaseResale.");
                            if (null === e.marketplaceSalesPurchaseResaleRequest || void 0 === e.marketplaceSalesPurchaseResaleRequest) throw new t.w("marketplaceSalesPurchaseResaleRequest", "Required parameter requestParameters.marketplaceSalesPurchaseResaleRequest was null or undefined when calling marketplaceSalesPurchaseResale.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (i["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/item/{itemId}/purchase-resale".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))),
                                schemaPath: "/v1/item/{itemId}/purchase-resale",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        expectedCurrency: e.expectedCurrency,
                                        expectedPrice: e.expectedPrice,
                                        expectedPurchaserId: e.expectedPurchaserId,
                                        expectedPurchaserType: e.expectedPurchaserType,
                                        collectibleProductId: e.collectibleProductId,
                                        collectibleItemInstanceId: e.collectibleItemInstanceId,
                                        idempotencyKey: e.idempotencyKey,
                                        purchaseAuthToken: e.purchaseAuthToken,
                                        rentalDays: e.rentalDays
                                    }
                                }(e.marketplaceSalesPurchaseResaleRequest)
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return P(e)
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesPurchaseResale = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesPurchaseResaleRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesUpdateSaleRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.itemId || void 0 === e.itemId) throw new t.w("itemId", "Required parameter requestParameters.itemId was null or undefined when calling marketplaceSalesUpdateSale.");
                            if (null === e.itemInstanceId || void 0 === e.itemInstanceId) throw new t.w("itemInstanceId", "Required parameter requestParameters.itemInstanceId was null or undefined when calling marketplaceSalesUpdateSale.");
                            if (null === e.marketplaceSalesUpdateSaleRequest || void 0 === e.marketplaceSalesUpdateSaleRequest) throw new t.w("marketplaceSalesUpdateSaleRequest", "Required parameter requestParameters.marketplaceSalesUpdateSaleRequest was null or undefined when calling marketplaceSalesUpdateSale.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/item/{itemId}/instance/{itemInstanceId}/resale".replace("{".concat("itemId", "}"), encodeURIComponent(String(e.itemId))).replace("{".concat("itemInstanceId", "}"), encodeURIComponent(String(e.itemInstanceId))),
                                schemaPath: "/v1/item/{itemId}/instance/{itemInstanceId}/resale",
                                method: "PATCH",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        price: e.price,
                                        sellerId: e.sellerId,
                                        sellerType: e.sellerType,
                                        isOnSale: e.isOnSale,
                                        collectibleProductId: e.collectibleProductId,
                                        isRentalOptIn: e.isRentalOptIn
                                    }
                                }(e.marketplaceSalesUpdateSaleRequest)
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o, function(e) {
                                return null == e ? e : {
                                    updateSaleResult: (0, t.u)(e, "updateSaleResult") ? e.updateSaleResult : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.marketplaceSalesUpdateSale = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesUpdateSaleRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s.prototype.marketplaceSalesUpdateUniverseProductConfigurationRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.marketplaceSalesUpdateUniverseProductConfigurationRequest || void 0 === e.marketplaceSalesUpdateUniverseProductConfigurationRequest) throw new t.w("marketplaceSalesUpdateUniverseProductConfigurationRequest", "Required parameter requestParameters.marketplaceSalesUpdateUniverseProductConfigurationRequest was null or undefined when calling marketplaceSalesUpdateUniverseProductConfiguration.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/universe-product-configuration",
                                schemaPath: "/v1/universe-product-configuration",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        configuration: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                collectibleItemId: e.collectibleItemId,
                                                collectibleProductId: e.collectibleProductId,
                                                targetId: e.targetId,
                                                targetType: e.targetType,
                                                universeId: e.universeId,
                                                status: e.status
                                            }
                                        }(e._configuration)
                                    }
                                }(e.marketplaceSalesUpdateUniverseProductConfigurationRequest)
                            }, r)];
                        case 1:
                            return o = a.sent(), [2, new t.H(o)]
                    }
                })
            })
        }, s.prototype.marketplaceSalesUpdateUniverseProductConfiguration = function(e, t) {
            return n(this, void 0, void 0, function() {
                return a(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.marketplaceSalesUpdateUniverseProductConfigurationRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, s
    }(t._))((0, e.i(272593).f)("marketplace-sales", "bedev2"));
    e.s(["f", 0, {
        getUniverseProductConfiguration: async function(e, t) {
            let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "Asset";
            return g.marketplaceSalesGetUniverseProductConfiguration({
                universeId: e,
                targetId: t,
                targetType: r
            })
        },
        listUniverseProductConfigurations: async (e, t, r, n) => g.marketplaceSalesListUniverseProductConfigurations({
            universeId: e,
            status: t,
            limit: null != r ? r : 0,
            cursor: n
        }),
        checkCreationAccess: async () => g.marketplaceSalesCheckCreationAccess(),
        updateUniverseProductConfiguration: async function(e, t, r, n, a) {
            let i = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : "Asset";
            await g.marketplaceSalesUpdateUniverseProductConfiguration({
                marketplaceSalesUpdateUniverseProductConfigurationRequest: {
                    _configuration: {
                        universeId: e,
                        targetType: i,
                        targetId: t,
                        status: r,
                        collectibleItemId: n,
                        collectibleProductId: a
                    }
                }
            })
        }
    }], 28918)
}, 418564, e => {
    "use strict";
    var t = e.i(785517),
        r = e.i(643766),
        n = e.i(177610),
        a = e.i(79187);
    let i = {
        info: "Info",
        warning: "Warning",
        error: "Error"
    };
    e.s(["f", 0, e => {
        let {
            alertTitle: o,
            alertDescription: u,
            severity: s,
            externalLink: l,
            linkLabel: c,
            allowCloseDialog: d,
            onDismiss: m
        } = e, {
            translate: p
        } = (0, a.A)(), [v, f] = (0, r.useState)(!0);
        if (!v) return null;
        let h = d ? {
            closeLabel: p("Action.Close"),
            onDismiss: () => {
                null == m || m(), f(!1)
            }
        } : {
            hasCloseAffordance: !1
        };
        return (0, t.jsx)(n.f, {
            severity: i[s],
            variant: "Feedback",
            className: "width-full",
            primaryActionLabel: c,
            primaryActionHref: l,
            ...h,
            children: (0, t.jsxs)("div", {
                className: "flex flex-col gap-xsmall",
                children: [o && (0, t.jsx)("span", {
                    className: "text-label-medium content-emphasis",
                    children: o
                }), (0, t.jsx)("span", {
                    className: "text-body-medium text-truncate-split content-default width-full",
                    children: u
                })]
            })
        })
    }])
}, 668091, e => {
    "use strict";
    var t = e.i(643766),
        r = e.i(109543);
    e.s(["f", 0, function() {
        return (0, t.useContext)(r.U)
    }])
}]);

//# debugId=67deefb4-244f-6b70-f1ae-5fd73590405d
//# sourceMappingURL=3h0zl0c68r_t5.js.map