;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "cc6398d1-c2dd-d4e8-77c5-f9637a5dcef1")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 913893, 336288, e => {
    "use strict";
    var t = e.i(805290),
        i = e.i(415858),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i])
            })(e, t)
        };

    function r(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }

    function l(e, t, i, n) {
        return new(i || (i = Promise))(function(r, l) {
            function o(e) {
                try {
                    a(n.next(e))
                } catch (e) {
                    l(e)
                }
            }

            function s(e) {
                try {
                    a(n.throw(e))
                } catch (e) {
                    l(e)
                }
            }

            function a(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(o, s)
            }
            a((n = n.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var i, n, r, l = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(a) {
                var u = [s, a];
                if (i) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (l = 0)), l;) try {
                    if (i = 1, n && (r = 2 & u[0] ? n.return : u[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, u[1])).done) return r;
                    switch (n = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return l.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            l.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = l.ops.pop(), l.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = l.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                l = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                l.label = u[1];
                                break
                            }
                            if (6 === u[0] && l.label < r[1]) {
                                l.label = r[1], r = u;
                                break
                            }
                            if (r && l.label < r[2]) {
                                l.label = r[2], l.ops.push(u);
                                break
                            }
                            r[2] && l.ops.pop(), l.trys.pop();
                            continue
                    }
                    u = t.call(e, l)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    i = r = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function s(e, t) {
        return null == e ? e : {
            seconds: (0, i.u)(e, "Seconds") ? e.Seconds : void 0,
            nanos: (0, i.u)(e, "Nanos") ? e.Nanos : void 0
        }
    }

    function a(e) {
        var t;
        return null == (t = e) ? t : {
            type: (0, i.u)(t, "type") ? t.type : void 0,
            id: (0, i.u)(t, "id") ? t.id : void 0,
            name: (0, i.u)(t, "name") ? t.name : void 0
        }
    }

    function u(e) {
        var t, n, r;
        return null == (t = e) ? t : {
            assetId: (0, i.u)(t, "assetId") ? t.assetId : void 0,
            name: (0, i.u)(t, "name") ? t.name : void 0,
            status: (0, i.u)(t, "status") ? t.status : void 0,
            description: (0, i.u)(t, "description") ? t.description : void 0,
            creatorType: (0, i.u)(t, "creatorType") ? t.creatorType : void 0,
            creatorTargetId: (0, i.u)(t, "creatorTargetId") ? t.creatorTargetId : void 0,
            price: (0, i.u)(t, "price") ? t.price : void 0,
            priceConfiguration: (0, i.u)(t, "priceConfiguration") ? null == (n = t.priceConfiguration) ? n : {
                priceInRobux: (0, i.u)(n, "priceInRobux") ? n.priceInRobux : void 0,
                premiumDiscountPercentage: (0, i.u)(n, "premiumDiscountPercentage") ? n.premiumDiscountPercentage : void 0,
                premiumPriceInRobux: (0, i.u)(n, "premiumPriceInRobux") ? n.premiumPriceInRobux : void 0,
                priceOffset: (0, i.u)(n, "priceOffset") ? n.priceOffset : void 0
            } : void 0,
            isArchived: (0, i.u)(t, "isArchived") ? t.isArchived : void 0,
            assetType: (0, i.u)(t, "assetType") ? t.assetType : void 0,
            releaseConfiguration: (0, i.u)(t, "releaseConfiguration") ? null == (r = t.releaseConfiguration) ? r : {
                saleAvailabilityLocations: (0, i.u)(r, "saleAvailabilityLocations") ? r.saleAvailabilityLocations : void 0
            } : void 0,
            created: (0, i.u)(t, "created") ? new Date(t.created) : void 0,
            updated: (0, i.u)(t, "updated") ? new Date(t.updated) : void 0,
            isDelisted: (0, i.u)(t, "isDelisted") ? t.isDelisted : void 0,
            isCreatedForBundle: (0, i.u)(t, "isCreatedForBundle") ? t.isCreatedForBundle : void 0
        }
    }

    function c(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, i.u)(t, "assetId") ? t.assetId : void 0,
            name: (0, i.u)(t, "name") ? t.name : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function d(e, t) {
        return null == e ? e : {
            creatorSplitPercentage: (0, i.u)(e, "creatorSplitPercentage") ? e.creatorSplitPercentage : void 0,
            sellerSplitPercentage: (0, i.u)(e, "sellerSplitPercentage") ? e.sellerSplitPercentage : void 0,
            marketplaceSplitPercentage: (0, i.u)(e, "marketplaceSplitPercentage") ? e.marketplaceSplitPercentage : void 0,
            resellerSplitPercentage: (0, i.u)(e, "resellerSplitPercentage") ? e.resellerSplitPercentage : void 0,
            ipHolderSplitPercentage: (0, i.u)(e, "ipHolderSplitPercentage") ? e.ipHolderSplitPercentage : void 0
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            priceFloorMultiplierLowerBound: (0, i.u)(t, "priceFloorMultiplierLowerBound") ? t.priceFloorMultiplierLowerBound : void 0,
            priceFloorMultiplierUpperBound: (0, i.u)(t, "priceFloorMultiplierUpperBound") ? t.priceFloorMultiplierUpperBound : void 0,
            revenueSplits: (0, i.u)(t, "revenueSplits") ? d(t.revenueSplits) : void 0
        }
    }

    function v(e) {
        var t, n, r;
        return null == (t = e) ? t : {
            itemTypeDetails: (0, i.u)(t, "itemTypeDetails") ? null == (n = t.itemTypeDetails) ? n : {
                itemType: (0, i.u)(n, "itemType") ? n.itemType : void 0
            } : void 0,
            commissionRates: (0, i.u)(t, "commissionRates") ? null == (r = t.commissionRates) ? r : {
                marketplaceFeesPercentage: (0, i.u)(r, "marketplaceFeesPercentage") ? r.marketplaceFeesPercentage : void 0,
                creatorFeesPercentage: (0, i.u)(r, "creatorFeesPercentage") ? r.creatorFeesPercentage : void 0,
                affiliateFeesPercentage: (0, i.u)(r, "affiliateFeesPercentage") ? r.affiliateFeesPercentage : void 0
            } : void 0
        }
    }

    function h(e) {
        var t;
        return null == (t = e) ? t : {
            rentalDays: (0, i.u)(t, "rentalDays") ? t.rentalDays : void 0,
            priceInRobux: (0, i.u)(t, "priceInRobux") ? t.priceInRobux : void 0
        }
    }

    function m(e) {
        var t, n, r, l, o, a, u, c, d, p, v, m, R, f, b, g;
        return null == (t = e) ? t : {
            id: (0, i.u)(t, "id") ? t.id : void 0,
            marketplaceItemDetails: (0, i.u)(t, "marketplaceItemDetails") ? null == (n = t.marketplaceItemDetails) ? n : {
                assetDetails: (0, i.u)(n, "assetDetails") ? null == (r = n.assetDetails) ? r : {
                    assetType: (0, i.u)(r, "assetType") ? r.assetType : void 0
                } : void 0,
                bundleDetails: (0, i.u)(n, "bundleDetails") ? null == (l = n.bundleDetails) ? l : {
                    bundleType: (0, i.u)(l, "bundleType") ? l.bundleType : void 0
                } : void 0
            } : void 0,
            createdTime: (0, i.u)(t, "createdTime") ? new Date(t.createdTime) : void 0,
            name: (0, i.u)(t, "name") ? t.name : void 0,
            description: (0, i.u)(t, "description") ? t.description : void 0,
            creator: (0, i.u)(t, "creator") ? null == (o = t.creator) ? o : {
                user: (0, i.u)(o, "User") ? null == (a = o.User) ? a : {
                    userId: (0, i.u)(a, "UserId") ? a.UserId : void 0
                } : void 0,
                group: (0, i.u)(o, "Group") ? null == (u = o.Group) ? u : {
                    groupId: (0, i.u)(u, "GroupId") ? u.GroupId : void 0
                } : void 0,
                kindCase: (0, i.u)(o, "KindCase") ? o.KindCase : void 0
            } : void 0,
            moderationStatus: (0, i.u)(t, "moderationStatus") ? t.moderationStatus : void 0,
            isUpdating: (0, i.u)(t, "isUpdating") ? t.isUpdating : void 0,
            price: (0, i.u)(t, "price") ? t.price : void 0,
            saleStatus: (0, i.u)(t, "saleStatus") ? t.saleStatus : void 0,
            collectibleItemType: (0, i.u)(t, "collectibleItemType") ? t.collectibleItemType : void 0,
            creationUniverseId: (0, i.u)(t, "creationUniverseId") ? t.creationUniverseId : void 0,
            delistingStatus: (0, i.u)(t, "delistingStatus") ? null == (c = t.delistingStatus) ? c : {
                target: (0, i.u)(c, "Target") ? null == (d = c.Target) ? d : {
                    targetType: (0, i.u)(d, "TargetType") ? d.TargetType : void 0,
                    id: (0, i.u)(d, "Id") ? d.Id : void 0
                } : void 0,
                status: (0, i.u)(c, "Status") ? c.Status : void 0
            } : void 0,
            scheduledRelease: (0, i.u)(t, "scheduledRelease") ? null == (p = t.scheduledRelease) ? p : {
                onSaleTime: (0, i.u)(p, "OnSaleTime") ? s(p.OnSaleTime) : void 0,
                offSaleTime: (0, i.u)(p, "OffSaleTime") ? s(p.OffSaleTime) : void 0
            } : void 0,
            cannotBePublishedReason: (0, i.u)(t, "cannotBePublishedReason") ? t.cannotBePublishedReason : void 0,
            dynamicPriceConfiguration: (0, i.u)(t, "dynamicPriceConfiguration") ? null == (v = t.dynamicPriceConfiguration) ? v : {
                minimumPrice: (0, i.u)(v, "MinimumPrice") ? v.MinimumPrice : void 0,
                priceOffset: (0, i.u)(v, "PriceOffset") ? v.PriceOffset : void 0,
                isOptOutRegionalPricing: (0, i.u)(v, "IsOptOutRegionalPricing") ? v.IsOptOutRegionalPricing : void 0
            } : void 0,
            isRentalOptIn: (0, i.u)(t, "isRentalOptIn") ? t.isRentalOptIn : void 0,
            rentalOptions: (0, i.u)(t, "rentalOptions") ? t.rentalOptions.map(h) : void 0,
            taxonomyDetails: (0, i.u)(t, "taxonomyDetails") ? null == (m = t.taxonomyDetails) ? m : {
                dpfTaxonomyName: (0, i.u)(m, "dpfTaxonomyName") ? m.dpfTaxonomyName : void 0,
                dpfTaxonomyId: (0, i.u)(m, "dpfTaxonomyId") ? m.dpfTaxonomyId : void 0,
                dpfTaxonomyIsDefaultTaxonomy: (0, i.u)(m, "dpfTaxonomyIsDefaultTaxonomy") ? m.dpfTaxonomyIsDefaultTaxonomy : void 0
            } : void 0,
            isHD: (0, i.u)(t, "isHD") ? t.isHD : void 0,
            discoverabilityDetails: (0, i.u)(t, "discoverabilityDetails") ? null == (R = t.discoverabilityDetails) ? R : {
                isDiscoverabilityReduced: (0, i.u)(R, "isDiscoverabilityReduced") ? R.isDiscoverabilityReduced : void 0,
                isCoreContentGated: (0, i.u)(R, "isCoreContentGated") ? R.isCoreContentGated : void 0
            } : void 0,
            isEmissive: (0, i.u)(t, "isEmissive") ? t.isEmissive : void 0,
            isCollectible: (0, i.u)(t, "isCollectible") ? t.isCollectible : void 0,
            saleLocation: (0, i.u)(t, "saleLocation") ? null == (f = t.saleLocation) ? f : {
                saleLocationType: (0, i.u)(f, "saleLocationType") ? f.saleLocationType : void 0,
                universeIds: (0, i.u)(f, "universeIds") ? f.universeIds : void 0
            } : void 0,
            collectibleDetails: (0, i.u)(t, "collectibleDetails") ? null == (b = t.collectibleDetails) ? b : {
                collectibleItemId: (0, i.u)(b, "collectibleItemId") ? b.collectibleItemId : void 0,
                quantityLimitPerUser: (0, i.u)(b, "quantityLimitPerUser") ? b.quantityLimitPerUser : void 0,
                totalRestockedQuantity: (0, i.u)(b, "totalRestockedQuantity") ? b.totalRestockedQuantity : void 0,
                lastRestockedTime: (0, i.u)(b, "lastRestockedTime") ? new Date(b.lastRestockedTime) : void 0,
                isResellable: (0, i.u)(b, "isResellable") ? b.isResellable : void 0,
                totalQuantity: (0, i.u)(b, "totalQuantity") ? b.totalQuantity : void 0,
                licensingInfo: (0, i.u)(b, "licensingInfo") ? null == (g = b.licensingInfo) ? g : {
                    state: (0, i.u)(g, "state") ? g.state : void 0,
                    licenseId: (0, i.u)(g, "licenseId") ? g.licenseId : void 0,
                    agreementId: (0, i.u)(g, "agreementId") ? g.agreementId : void 0
                } : void 0
            } : void 0
        }
    }

    function R(e) {
        var t;
        return null == (t = e) ? t : {
            priceInRobux: (0, i.u)(t, "priceInRobux") ? t.priceInRobux : void 0,
            countryIso2Code: (0, i.u)(t, "countryIso2Code") ? t.countryIso2Code : void 0
        }
    }

    function f(e) {
        var t;
        return null == (t = e) ? t : {
            folderId: (0, i.u)(t, "folderId") ? t.folderId : void 0,
            name: (0, i.u)(t, "name") ? t.name : void 0,
            parentFolderId: (0, i.u)(t, "parentFolderId") ? t.parentFolderId : void 0
        }
    }

    function b(e) {
        if (void 0 !== e) return null === e ? null : {
            id: e.id,
            itemType: e.itemType
        }
    }

    function g(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, i.u)(t, "id") ? t.id : void 0,
            marketplaceItem: (0, i.u)(t, "marketplaceItem") ? m(t.marketplaceItem) : void 0,
            folder: (0, i.u)(t, "folder") ? f(t.folder) : void 0
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            countryIso2Code: (0, i.u)(t, "countryIso2Code") ? t.countryIso2Code : void 0,
            rentalPrices: (0, i.u)(t, "rentalPrices") ? t.rentalPrices.map(h) : void 0
        }
    }

    function y(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, i.u)(t, "id") ? t.id : void 0,
            name: (0, i.u)(t, "name") ? t.name : void 0
        }
    }

    function I(e) {
        if (void 0 !== e) return null === e ? null : {
            targetType: e.targetType,
            targetId: e.targetId
        }
    }

    function E(e) {
        if (void 0 !== e) return null === e ? null : {
            saleLocationType: e.saleLocationType,
            places: e.places
        }
    }
    var U = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        P = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        B = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        M = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        _ = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        N = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        };

    function T(e) {
        var t;
        return null == (t = e) ? t : {
            minimumQuantity: (0, i.u)(t, "minimumQuantity") ? t.minimumQuantity : void 0,
            maximumQuantity: (0, i.u)(t, "maximumQuantity") ? t.maximumQuantity : void 0,
            isEligibleForUpload: (0, i.u)(t, "isEligibleForUpload") ? t.isEligibleForUpload : void 0,
            allowedFileExtensions: (0, i.u)(t, "allowedFileExtensions") ? t.allowedFileExtensions : void 0
        }
    }

    function C(e) {
        var t, n;
        return null == (t = e) ? t : {
            allowedAssetTypeSettings: (0, i.u)(t, "allowedAssetTypeSettings") ? (0, i.A)(t.allowedAssetTypeSettings, T) : void 0,
            marketplaceFeePercentage: (0, i.u)(t, "marketplaceFeePercentage") ? t.marketplaceFeePercentage : void 0,
            allowedPriceRange: (0, i.u)(t, "allowedPriceRange") ? null == (n = t.allowedPriceRange) ? n : {
                minimumPrice: (0, i.u)(n, "minimumPrice") ? n.minimumPrice : void 0,
                maximumPrice: (0, i.u)(n, "maximumPrice") ? n.maximumPrice : void 0
            } : void 0
        }
    }

    function q(e) {
        var t;
        return null == (t = e) ? t : {
            webStableId: (0, i.u)(t, "webStableId") ? t.webStableId : void 0,
            id: (0, i.u)(t, "id") ? t.id : void 0,
            name: (0, i.u)(t, "name") ? t.name : void 0,
            isPublishable: (0, i.u)(t, "isPublishable") ? t.isPublishable : void 0,
            assetTypeIds: (0, i.u)(t, "assetTypeIds") ? t.assetTypeIds : void 0,
            bundleTypeIds: (0, i.u)(t, "bundleTypeIds") ? t.bundleTypeIds : void 0,
            children: (0, i.u)(t, "children") ? t.children.map(q) : void 0
        }
    }

    function G(e, t) {
        return null == e ? e : {
            id: (0, i.u)(e, "id") ? e.id : void 0,
            creatorUserId: (0, i.u)(e, "creatorUserId") ? e.creatorUserId : void 0,
            creatorGroupId: (0, i.u)(e, "creatorGroupId") ? e.creatorGroupId : void 0,
            publishingType: (0, i.u)(e, "publishingType") ? e.publishingType : void 0,
            saleLocationType: (0, i.u)(e, "saleLocationType") ? e.saleLocationType : void 0,
            places: (0, i.u)(e, "places") ? e.places : void 0,
            priceInRobux: (0, i.u)(e, "priceInRobux") ? e.priceInRobux : void 0,
            priceOffset: (0, i.u)(e, "priceOffset") ? e.priceOffset : void 0,
            isFree: (0, i.u)(e, "isFree") ? e.isFree : void 0,
            enableRegionalPricing: (0, i.u)(e, "enableRegionalPricing") ? e.enableRegionalPricing : void 0,
            isRentalOptIn: (0, i.u)(e, "isRentalOptIn") ? e.isRentalOptIn : void 0,
            autoPublishEnabled: (0, i.u)(e, "autoPublishEnabled") ? e.autoPublishEnabled : void 0,
            created: (0, i.u)(e, "created") ? new Date(e.created) : void 0,
            updated: (0, i.u)(e, "updated") ? new Date(e.updated) : void 0
        }
    }
    var F = i._;

    function A() {
        return null !== F && F.apply(this, arguments) || this
    }
    r(A, F), A.prototype.v1BundlesCreateContextPostRaw = function(e, t) {
        return l(this, void 0, void 0, function() {
            var n, r, l;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1BundlesCreateContextPost.");
                        return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/bundles/create-context",
                            schemaPath: "/v1/bundles/create-context",
                            method: "POST",
                            headers: r,
                            query: n,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    assetQuantities: e.assetQuantities,
                                    bundleDescription: e.bundleDescription,
                                    bundleName: e.bundleName,
                                    bundleType: e.bundleType,
                                    bodyScale: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            height: e.height,
                                            width: e.width,
                                            head: e.head,
                                            bodyType: e.bodyType,
                                            proportion: e.proportion
                                        }
                                    }(e.bodyScale),
                                    bodyColorSet: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            headColor3: e.headColor3,
                                            torsoColor3: e.torsoColor3,
                                            leftArmColor3: e.leftArmColor3,
                                            rightArmColor3: e.rightArmColor3,
                                            leftLegColor3: e.leftLegColor3,
                                            rightLegColor3: e.rightLegColor3
                                        }
                                    }(e.bodyColorSet),
                                    groupId: e.groupId
                                }
                            }(e.request)
                        }, t)];
                    case 1:
                        return l = o.sent(), [2, new i.H(l, function(e) {
                            return null == e ? e : {
                                operationId: (0, i.u)(e, "operationId") ? e.operationId : void 0
                            }
                        })]
                }
            })
        })
    }, A.prototype.v1BundlesCreateContextPost = function(e, t) {
        return l(this, void 0, void 0, function() {
            return o(this, function(i) {
                switch (i.label) {
                    case 0:
                        return [4, this.v1BundlesCreateContextPostRaw(e, t)];
                    case 1:
                        return [4, i.sent().value()];
                    case 2:
                        return [2, i.sent()]
                }
            })
        })
    }, A.prototype.v1BundlesMetadataGetRaw = function(e) {
        return l(this, void 0, void 0, function() {
            var t, n, r;
            return o(this, function(l) {
                switch (l.label) {
                    case 0:
                        return t = {}, n = {}, [4, this.request({
                            path: "/v1/bundles/metadata",
                            schemaPath: "/v1/bundles/metadata",
                            method: "GET",
                            headers: n,
                            query: t
                        }, e)];
                    case 1:
                        return r = l.sent(), [2, new i.H(r, function(e) {
                            return null == e ? e : {
                                isBundlesControllerEnabled: (0, i.u)(e, "isBundlesControllerEnabled") ? e.isBundlesControllerEnabled : void 0,
                                isBundlesCreationEnabled: (0, i.u)(e, "isBundlesCreationEnabled") ? e.isBundlesCreationEnabled : void 0,
                                isBundlesPublishingEnabled: (0, i.u)(e, "isBundlesPublishingEnabled") ? e.isBundlesPublishingEnabled : void 0,
                                allowedBundleTypeSettings: (0, i.u)(e, "allowedBundleTypeSettings") ? (0, i.A)(e.allowedBundleTypeSettings, C) : void 0,
                                isGroupBundlesUploadEnabled: (0, i.u)(e, "isGroupBundlesUploadEnabled") ? e.isGroupBundlesUploadEnabled : void 0
                            }
                        })]
                }
            })
        })
    }, A.prototype.v1BundlesMetadataGet = function(e) {
        return l(this, void 0, void 0, function() {
            return o(this, function(t) {
                switch (t.label) {
                    case 0:
                        return [4, this.v1BundlesMetadataGetRaw(e)];
                    case 1:
                        return [4, t.sent().value()];
                    case 2:
                        return [2, t.sent()]
                }
            })
        })
    }, A.prototype.v1BundlesPostRaw = function(e, t) {
        return l(this, void 0, void 0, function() {
            var n, r, l;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1BundlesPost.");
                        return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/bundles",
                            schemaPath: "/v1/bundles",
                            method: "POST",
                            headers: r,
                            query: n,
                            body: function(e) {
                                if (void 0 !== e) return null === e ? null : {
                                    bundleType: e.bundleType,
                                    name: e.name,
                                    description: e.description,
                                    assetIds: e.assetIds,
                                    operationId: e.operationId,
                                    agreedCreationFee: e.agreedCreationFee
                                }
                            }(e.request)
                        }, t)];
                    case 1:
                        return l = o.sent(), [2, new i.H(l, function(e) {
                            return null == e ? e : {
                                creationStatusId: (0, i.u)(e, "creationStatusId") ? e.creationStatusId : void 0
                            }
                        })]
                }
            })
        })
    }, A.prototype.v1BundlesPost = function(e, t) {
        return l(this, void 0, void 0, function() {
            return o(this, function(i) {
                switch (i.label) {
                    case 0:
                        return [4, this.v1BundlesPostRaw(e, t)];
                    case 1:
                        return [4, i.sent().value()];
                    case 2:
                        return [2, i.sent()]
                }
            })
        })
    }, A.prototype.v1BundlesStatusCreationStatusIdGetRaw = function(e, t) {
        return l(this, void 0, void 0, function() {
            var n, r, l;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.creationStatusId || void 0 === e.creationStatusId) throw new i.w("creationStatusId", "Required parameter requestParameters.creationStatusId was null or undefined when calling v1BundlesStatusCreationStatusIdGet.");
                        return n = {}, r = {}, [4, this.request({
                            path: "/v1/bundles/status/{creationStatusId}".replace("{".concat("creationStatusId", "}"), encodeURIComponent(String(e.creationStatusId))),
                            schemaPath: "/v1/bundles/status/{creationStatusId}",
                            method: "GET",
                            headers: r,
                            query: n
                        }, t)];
                    case 1:
                        return l = o.sent(), [2, new i.H(l, function(e) {
                            return null == e ? e : {
                                bundleId: (0, i.u)(e, "bundleId") ? e.bundleId : void 0,
                                status: (0, i.u)(e, "status") ? e.status : void 0
                            }
                        })]
                }
            })
        })
    }, A.prototype.v1BundlesStatusCreationStatusIdGet = function(e, t) {
        return l(this, void 0, void 0, function() {
            return o(this, function(i) {
                switch (i.label) {
                    case 0:
                        return [4, this.v1BundlesStatusCreationStatusIdGetRaw(e, t)];
                    case 1:
                        return [4, i.sent().value()];
                    case 2:
                        return [2, i.sent()]
                }
            })
        })
    };
    var S = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(t, e), t.prototype.v1CollectiblesBulkUpdatePatchRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1CollectiblesBulkUpdatePatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles/bulk-update",
                                    schemaPath: "/v1/collectibles/bulk-update",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            idempotencyKey: e.idempotencyKey,
                                            groupId: e.groupId,
                                            updateTargets: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    assetType: e.assetType,
                                                    target: void 0 === e.target ? void 0 : e.target.map(I)
                                                }
                                            }(e.updateTargets),
                                            updatePayload: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    rentalOptIn: e.rentalOptIn
                                                }
                                            }(e.updatePayload)
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.V(l)]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesBulkUpdatePatch = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesBulkUpdatePatchRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCheckItemConfigurationAccessGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesCheckItemConfigurationAccessGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.w("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1CollectiblesCheckItemConfigurationAccessGet.");
                                return n = {}, void 0 !== e.targetType && (n.TargetType = e.targetType), void 0 !== e.targetId && (n.TargetId = e.targetId), r = {}, [4, this.request({
                                    path: "/v1/collectibles/check-item-configuration-access",
                                    schemaPath: "/v1/collectibles/check-item-configuration-access",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        isAllowed: (0, i.u)(e, "isAllowed") ? e.isAllowed : void 0,
                                        deniedReason: (0, i.u)(e, "deniedReason") ? e.deniedReason : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCheckItemConfigurationAccessGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesCheckItemConfigurationAccessGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCheckItemPublishAccessGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesCheckItemPublishAccessGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.w("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1CollectiblesCheckItemPublishAccessGet.");
                                if (null === e.publishingType || void 0 === e.publishingType) throw new i.w("publishingType", "Required parameter requestParameters.publishingType was null or undefined when calling v1CollectiblesCheckItemPublishAccessGet.");
                                return n = {}, void 0 !== e.targetType && (n.TargetType = e.targetType), void 0 !== e.targetId && (n.TargetId = e.targetId), void 0 !== e.publishingType && (n.PublishingType = e.publishingType), r = {}, [4, this.request({
                                    path: "/v1/collectibles/check-item-publish-access",
                                    schemaPath: "/v1/collectibles/check-item-publish-access",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        isAllowed: (0, i.u)(e, "isAllowed") ? e.isAllowed : void 0,
                                        deniedReason: (0, i.u)(e, "deniedReason") ? e.deniedReason : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCheckItemPublishAccessGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesCheckItemPublishAccessGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCheckItemUploadAccessGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesCheckItemUploadAccessGet.");
                                return n = {}, void 0 !== e.targetType && (n.targetType = e.targetType), void 0 !== e.groupId && (n.groupId = e.groupId), r = {}, [4, this.request({
                                    path: "/v1/collectibles/check-item-upload-access",
                                    schemaPath: "/v1/collectibles/check-item-upload-access",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        isAllowed: (0, i.u)(e, "isAllowed") ? e.isAllowed : void 0,
                                        deniedReason: (0, i.u)(e, "deniedReason") ? e.deniedReason : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCheckItemUploadAccessGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesCheckItemUploadAccessGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdPatchRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.w("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesCollectibleItemIdPatch.");
                                if (null === e.updateCollectibleItemRequest || void 0 === e.updateCollectibleItemRequest) throw new i.w("updateCollectibleItemRequest", "Required parameter requestParameters.updateCollectibleItemRequest was null or undefined when calling v1CollectiblesCollectibleItemIdPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles/{collectibleItemId}".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/{collectibleItemId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            saleLocationConfiguration: E(e.saleLocationConfiguration),
                                            isRentalOptIn: e.isRentalOptIn,
                                            saleStatus: e.saleStatus,
                                            quantityLimitPerUser: e.quantityLimitPerUser,
                                            resaleRestriction: e.resaleRestriction,
                                            priceInRobux: e.priceInRobux,
                                            priceOffset: e.priceOffset,
                                            optOutFromRegionalPricing: e.optOutFromRegionalPricing,
                                            isFree: e.isFree,
                                            onSaleTime: void 0 === e.onSaleTime ? void 0 : e.onSaleTime.toISOString(),
                                            offSaleTime: void 0 === e.offSaleTime ? void 0 : e.offSaleTime.toISOString()
                                        }
                                    }(e.updateCollectibleItemRequest)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.V(l)]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdPatch = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesCollectibleItemIdPatchRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdRestockEligibilityGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.w("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesCollectibleItemIdRestockEligibilityGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/collectibles/{collectibleItemId}/restock-eligibility".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/{collectibleItemId}/restock-eligibility",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        isRestockingEnabled: (0, i.u)(e, "isRestockingEnabled") ? e.isRestockingEnabled : void 0,
                                        isEligible: (0, i.u)(e, "isEligible") ? e.isEligible : void 0,
                                        ineligibilityReason: (0, i.u)(e, "ineligibilityReason") ? e.ineligibilityReason : void 0,
                                        hasBeenRestocked: (0, i.u)(e, "hasBeenRestocked") ? e.hasBeenRestocked : void 0,
                                        totalRestockedQuantity: (0, i.u)(e, "totalRestockedQuantity") ? e.totalRestockedQuantity : void 0,
                                        maxRestockQuantityPerOperation: (0, i.u)(e, "maxRestockQuantityPerOperation") ? e.maxRestockQuantityPerOperation : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdRestockEligibilityGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesCollectibleItemIdRestockEligibilityGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdRestockPostRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.w("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesCollectibleItemIdRestockPost.");
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1CollectiblesCollectibleItemIdRestockPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles/{collectibleItemId}/restock".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/{collectibleItemId}/restock",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            newTotalQuantity: e.newTotalQuantity,
                                            agreedRestockingFee: e.agreedRestockingFee
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        newTotalQuantity: (0, i.u)(e, "newTotalQuantity") ? e.newTotalQuantity : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdRestockPost = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesCollectibleItemIdRestockPostRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdRestockingFeesGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.w("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesCollectibleItemIdRestockingFeesGet.");
                                if (null === e.additionalQuantity || void 0 === e.additionalQuantity) throw new i.w("additionalQuantity", "Required parameter requestParameters.additionalQuantity was null or undefined when calling v1CollectiblesCollectibleItemIdRestockingFeesGet.");
                                return n = {}, void 0 !== e.additionalQuantity && (n.additionalQuantity = e.additionalQuantity), r = {}, [4, this.request({
                                    path: "/v1/collectibles/{collectibleItemId}/restocking-fees".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/{collectibleItemId}/restocking-fees",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        restockingFeeInRobux: (0, i.u)(e, "restockingFeeInRobux") ? e.restockingFeeInRobux : void 0,
                                        unitRestockingFeeInRobux: (0, i.u)(e, "unitRestockingFeeInRobux") ? e.unitRestockingFeeInRobux : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdRestockingFeesGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesCollectibleItemIdRestockingFeesGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdSaleScheduleDeleteRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.w("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesCollectibleItemIdSaleScheduleDelete.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/collectibles/{collectibleItemId}/sale-schedule".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/{collectibleItemId}/sale-schedule",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l)]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdSaleScheduleDelete = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesCollectibleItemIdSaleScheduleDeleteRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCommissionRatesGetRaw = function(e) {
                return l(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(l) {
                        switch (l.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/collectibles/commission-rates",
                                    schemaPath: "/v1/collectibles/commission-rates",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = l.sent(), [2, new i.H(r, function(e) {
                                    return null == e ? e : {
                                        creatorFeesPercentage: (0, i.u)(e, "creatorFeesPercentage") ? e.creatorFeesPercentage : void 0,
                                        marketplaceFeesPercentage: (0, i.u)(e, "marketplaceFeesPercentage") ? e.marketplaceFeesPercentage : void 0,
                                        resellerFeesPercentage: (0, i.u)(e, "resellerFeesPercentage") ? e.resellerFeesPercentage : void 0,
                                        sellerFeesPercentage: (0, i.u)(e, "sellerFeesPercentage") ? e.sellerFeesPercentage : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCommissionRatesGet = function(e) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1CollectiblesCommissionRatesGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesMetadataGetRaw = function(e) {
                return l(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(l) {
                        switch (l.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/collectibles/metadata",
                                    schemaPath: "/v1/collectibles/metadata",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = l.sent(), [2, new i.H(r, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        isAvatarItemLicensingEnabled: (0, i.u)(e, "isAvatarItemLicensingEnabled") ? e.isAvatarItemLicensingEnabled : void 0,
                                        isMarketplaceAffiliateLinkUiEnabled: (0, i.u)(e, "isMarketplaceAffiliateLinkUiEnabled") ? e.isMarketplaceAffiliateLinkUiEnabled : void 0,
                                        isCollectiblesControllerEnabled: (0, i.u)(e, "isCollectiblesControllerEnabled") ? e.isCollectiblesControllerEnabled : void 0,
                                        isCollectiblesPublishingEnabled: (0, i.u)(e, "isCollectiblesPublishingEnabled") ? e.isCollectiblesPublishingEnabled : void 0,
                                        isCollectiblesPublishingLocationTypeEnabled: (0, i.u)(e, "isCollectiblesPublishingLocationTypeEnabled") ? e.isCollectiblesPublishingLocationTypeEnabled : void 0,
                                        allowedCollectibleSaleLocations: (0, i.u)(e, "allowedCollectibleSaleLocations") ? e.allowedCollectibleSaleLocations : void 0,
                                        isCollectibleFreeItemPublishingAvailable: (0, i.u)(e, "IsCollectibleFreeItemPublishingAvailable") ? e.IsCollectibleFreeItemPublishingAvailable : void 0,
                                        isCollectibleGroupPublishingAvailable: (0, i.u)(e, "isCollectibleGroupPublishingAvailable") ? e.isCollectibleGroupPublishingAvailable : void 0,
                                        isCollectibleResaleRestrictionsEnabled: (0, i.u)(e, "isCollectibleResaleRestrictionsEnabled") ? e.isCollectibleResaleRestrictionsEnabled : void 0,
                                        isCollectiblePublishMinQuantityEnabled: (0, i.u)(e, "isCollectiblePublishMinQuantityEnabled") ? e.isCollectiblePublishMinQuantityEnabled : void 0,
                                        isUgc4AllUIEnabled: (0, i.u)(e, "IsUgc4AllUIEnabled") ? e.IsUgc4AllUIEnabled : void 0,
                                        limitedMaxQuantity: (0, i.u)(e, "LimitedMaxQuantity") ? e.LimitedMaxQuantity : void 0,
                                        isLimitedCollectibleBundlesPublishingEnabled: (0, i.u)(e, "IsLimitedCollectibleBundlesPublishingEnabled") ? e.IsLimitedCollectibleBundlesPublishingEnabled : void 0,
                                        isResellabilityEnabled: (0, i.u)(e, "IsResellabilityEnabled") ? e.IsResellabilityEnabled : void 0,
                                        isNewBundleUIEnabled: (0, i.u)(e, "IsNewBundleUIEnabled") ? e.IsNewBundleUIEnabled : void 0,
                                        isCollectible2DPublishingEnabled: (0, i.u)(e, "IsCollectible2DPublishingEnabled") ? e.IsCollectible2DPublishingEnabled : void 0,
                                        isAvatarCreationTokensUIEnabled: (0, i.u)(e, "IsAvatarCreationTokensUIEnabled") ? e.IsAvatarCreationTokensUIEnabled : void 0,
                                        isScheduledPublishingEnabled: (0, i.u)(e, "IsScheduledPublishingEnabled") ? e.IsScheduledPublishingEnabled : void 0,
                                        scheduledPublishingSettings: (0, i.u)(e, "ScheduledPublishingSettings") ? null == (t = e.ScheduledPublishingSettings) ? t : {
                                            scheduledPublishMaxTimeInAdvanceTimeSpan: (0, i.u)(t, "scheduledPublishMaxTimeInAdvanceTimeSpan") ? t.scheduledPublishMaxTimeInAdvanceTimeSpan : void 0,
                                            scheduledPublishMinDurationTimeSpan: (0, i.u)(t, "scheduledPublishMinDurationTimeSpan") ? t.scheduledPublishMinDurationTimeSpan : void 0
                                        } : void 0,
                                        isGetPriceFloorEnabled: (0, i.u)(e, "isGetPriceFloorEnabled") ? e.isGetPriceFloorEnabled : void 0,
                                        isRegionalPricingEnabled: (0, i.u)(e, "isRegionalPricingEnabled") ? e.isRegionalPricingEnabled : void 0,
                                        isRevenueSplitEnabled: (0, i.u)(e, "isRevenueSplitEnabled") ? e.isRevenueSplitEnabled : void 0,
                                        revenueSplitTiersForPurchase: (0, i.u)(e, "revenueSplitTiersForPurchase") ? e.revenueSplitTiersForPurchase.map(p) : void 0,
                                        isContentMetadataAppealEnabled: (0, i.u)(e, "isContentMetadataAppealEnabled") ? e.isContentMetadataAppealEnabled : void 0,
                                        bodysuitEligibleAssetTypes: (0, i.u)(e, "bodysuitEligibleAssetTypes") ? e.bodysuitEligibleAssetTypes : void 0,
                                        unifyConfigureUI: (0, i.u)(e, "unifyConfigureUI") ? e.unifyConfigureUI : void 0,
                                        maxCollectiblePrice: (0, i.u)(e, "MaxCollectiblePrice") ? e.MaxCollectiblePrice : void 0,
                                        isRestockingEnabled: (0, i.u)(e, "isRestockingEnabled") ? e.isRestockingEnabled : void 0,
                                        restockResaleLockDurationSeconds: (0, i.u)(e, "restockResaleLockDurationSeconds") ? e.restockResaleLockDurationSeconds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesMetadataGet = function(e) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1CollectiblesMetadataGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesPostRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1CollectiblesPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles",
                                    schemaPath: "/v1/collectibles",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isRentalOptIn: e.isRentalOptIn,
                                            idempotencyToken: e.idempotencyToken,
                                            targetId: e.targetId,
                                            targetType: e.targetType,
                                            publishingType: e.publishingType,
                                            agreedPublishingFee: e.agreedPublishingFee,
                                            creatorUserId: e.creatorUserId,
                                            creatorGroupId: e.creatorGroupId,
                                            publisherUserId: e.publisherUserId,
                                            quantity: e.quantity,
                                            quantityLimitPerUser: e.quantityLimitPerUser,
                                            resaleRestriction: e.resaleRestriction,
                                            priceInRobux: e.priceInRobux,
                                            priceOffset: e.priceOffset,
                                            optOutFromRegionalPricing: e.optOutFromRegionalPricing,
                                            isFree: e.isFree,
                                            saleLocationConfiguration: E(e.saleLocationConfiguration),
                                            name: e.name,
                                            description: e.description,
                                            onSaleTime: void 0 === e.onSaleTime ? void 0 : e.onSaleTime.toISOString(),
                                            offSaleTime: void 0 === e.offSaleTime ? void 0 : e.offSaleTime.toISOString(),
                                            agreementId: e.agreementId
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        status: (0, i.u)(e, "status") ? e.status : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesPost = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesPostRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesPriceFloorGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesPriceFloorGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.w("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1CollectiblesPriceFloorGet.");
                                if (null === e.publishingType || void 0 === e.publishingType) throw new i.w("publishingType", "Required parameter requestParameters.publishingType was null or undefined when calling v1CollectiblesPriceFloorGet.");
                                return n = {}, void 0 !== e.targetType && (n.TargetType = e.targetType), void 0 !== e.targetId && (n.TargetId = e.targetId), void 0 !== e.publishingType && (n.PublishingType = e.publishingType), r = {}, [4, this.request({
                                    path: "/v1/collectibles/price-floor",
                                    schemaPath: "/v1/collectibles/price-floor",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        priceFloorInRobux: (0, i.u)(e, "priceFloorInRobux") ? e.priceFloorInRobux : void 0,
                                        displayName: (0, i.u)(e, "displayName") ? e.displayName : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesPriceFloorGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesPriceFloorGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesPublishingFeesGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.targetID || void 0 === e.targetID) throw new i.w("targetID", "Required parameter requestParameters.targetID was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.quantity || void 0 === e.quantity) throw new i.w("quantity", "Required parameter requestParameters.quantity was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.saleLocation || void 0 === e.saleLocation) throw new i.w("saleLocation", "Required parameter requestParameters.saleLocation was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.resaleRestriction || void 0 === e.resaleRestriction) throw new i.w("resaleRestriction", "Required parameter requestParameters.resaleRestriction was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.isFree || void 0 === e.isFree) throw new i.w("isFree", "Required parameter requestParameters.isFree was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.publishingType || void 0 === e.publishingType) throw new i.w("publishingType", "Required parameter requestParameters.publishingType was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                return n = {}, void 0 !== e.targetType && (n.TargetType = e.targetType), void 0 !== e.targetID && (n.TargetID = e.targetID), void 0 !== e.quantity && (n.Quantity = e.quantity), void 0 !== e.saleLocation && (n.SaleLocation = e.saleLocation), void 0 !== e.resaleRestriction && (n.ResaleRestriction = e.resaleRestriction), void 0 !== e.isFree && (n.IsFree = e.isFree), void 0 !== e.publishingType && (n.PublishingType = e.publishingType), r = {}, [4, this.request({
                                    path: "/v1/collectibles/publishing-fees",
                                    schemaPath: "/v1/collectibles/publishing-fees",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        publishingFeeInRobux: (0, i.u)(e, "publishingFeeInRobux") ? e.publishingFeeInRobux : void 0,
                                        unitPublishingFeeInRobux: (0, i.u)(e, "unitPublishingFeeInRobux") ? e.unitPublishingFeeInRobux : void 0,
                                        isDynamicFeeEnabled: (0, i.u)(e, "isDynamicFeeEnabled") ? e.isDynamicFeeEnabled : void 0,
                                        publishingFeeType: (0, i.u)(e, "publishingFeeType") ? e.publishingFeeType : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesPublishingFeesGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesPublishingFeesGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRegionalPricingPreviewGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesRegionalPricingPreviewGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.w("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1CollectiblesRegionalPricingPreviewGet.");
                                if (null === e.publishingType || void 0 === e.publishingType) throw new i.w("publishingType", "Required parameter requestParameters.publishingType was null or undefined when calling v1CollectiblesRegionalPricingPreviewGet.");
                                if (null === e.minimumPrice || void 0 === e.minimumPrice) throw new i.w("minimumPrice", "Required parameter requestParameters.minimumPrice was null or undefined when calling v1CollectiblesRegionalPricingPreviewGet.");
                                if (null === e.priceOffset || void 0 === e.priceOffset) throw new i.w("priceOffset", "Required parameter requestParameters.priceOffset was null or undefined when calling v1CollectiblesRegionalPricingPreviewGet.");
                                return n = {}, void 0 !== e.targetType && (n.TargetType = e.targetType), void 0 !== e.targetId && (n.TargetId = e.targetId), void 0 !== e.publishingType && (n.PublishingType = e.publishingType), void 0 !== e.minimumPrice && (n.MinimumPrice = e.minimumPrice), void 0 !== e.priceOffset && (n.PriceOffset = e.priceOffset), r = {}, [4, this.request({
                                    path: "/v1/collectibles/regional-pricing/preview",
                                    schemaPath: "/v1/collectibles/regional-pricing/preview",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        regionalPrices: (0, i.u)(e, "regionalPrices") ? e.regionalPrices.map(R) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRegionalPricingPreviewGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesRegionalPricingPreviewGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRegionalPricingRepresentativeCountriesGetRaw = function(e) {
                return l(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(l) {
                        switch (l.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/collectibles/regional-pricing/representative-countries",
                                    schemaPath: "/v1/collectibles/regional-pricing/representative-countries",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = l.sent(), [2, new i.H(r, function(e) {
                                    return null == e ? e : {
                                        countryIso2Codes: (0, i.u)(e, "countryIso2Codes") ? e.countryIso2Codes : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRegionalPricingRepresentativeCountriesGet = function(e) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1CollectiblesRegionalPricingRepresentativeCountriesGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRentalPricingPreviewGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.w("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                if (null === e.publishingType || void 0 === e.publishingType) throw new i.w("publishingType", "Required parameter requestParameters.publishingType was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                if (null === e.minimumPrice || void 0 === e.minimumPrice) throw new i.w("minimumPrice", "Required parameter requestParameters.minimumPrice was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                if (null === e.priceOffset || void 0 === e.priceOffset) throw new i.w("priceOffset", "Required parameter requestParameters.priceOffset was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                if (null === e.includeRegionalPricing || void 0 === e.includeRegionalPricing) throw new i.w("includeRegionalPricing", "Required parameter requestParameters.includeRegionalPricing was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                return n = {}, void 0 !== e.targetType && (n.TargetType = e.targetType), void 0 !== e.targetId && (n.TargetId = e.targetId), void 0 !== e.publishingType && (n.PublishingType = e.publishingType), void 0 !== e.minimumPrice && (n.MinimumPrice = e.minimumPrice), void 0 !== e.priceOffset && (n.PriceOffset = e.priceOffset), void 0 !== e.includeRegionalPricing && (n.IncludeRegionalPricing = e.includeRegionalPricing), r = {}, [4, this.request({
                                    path: "/v1/collectibles/rental-pricing/preview",
                                    schemaPath: "/v1/collectibles/rental-pricing/preview",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        rentalPrices: (0, i.u)(e, "rentalPrices") ? e.rentalPrices.map(h) : void 0,
                                        regionalRentalPrices: (0, i.u)(e, "regionalRentalPrices") ? e.regionalRentalPrices.map(w) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRentalPricingPreviewGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesRentalPricingPreviewGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRevenueSplitGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                if (null === e.targetID || void 0 === e.targetID) throw new i.w("targetID", "Required parameter requestParameters.targetID was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                if (null === e.collectibleItemType || void 0 === e.collectibleItemType) throw new i.w("collectibleItemType", "Required parameter requestParameters.collectibleItemType was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                if (null === e.minimumPrice || void 0 === e.minimumPrice) throw new i.w("minimumPrice", "Required parameter requestParameters.minimumPrice was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                if (null === e.priceOffset || void 0 === e.priceOffset) throw new i.w("priceOffset", "Required parameter requestParameters.priceOffset was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                if (null === e.purchasePlatform || void 0 === e.purchasePlatform) throw new i.w("purchasePlatform", "Required parameter requestParameters.purchasePlatform was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                return n = {}, void 0 !== e.targetType && (n.TargetType = e.targetType), void 0 !== e.targetID && (n.TargetID = e.targetID), void 0 !== e.collectibleItemType && (n.CollectibleItemType = e.collectibleItemType), void 0 !== e.minimumPrice && (n.MinimumPrice = e.minimumPrice), void 0 !== e.priceOffset && (n.PriceOffset = e.priceOffset), void 0 !== e.purchasePlatform && (n.PurchasePlatform = e.purchasePlatform), void 0 !== e.licenseId && (n.LicenseId = e.licenseId), r = {}, [4, this.request({
                                    path: "/v1/collectibles/revenue-split",
                                    schemaPath: "/v1/collectibles/revenue-split",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        revenueSplit: (0, i.u)(e, "RevenueSplit") ? d(e.RevenueSplit) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRevenueSplitGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesRevenueSplitGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesUpdateItemDisplayInformationPatchRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1CollectiblesUpdateItemDisplayInformationPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles/update-item-display-information",
                                    schemaPath: "/v1/collectibles/update-item-display-information",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            targetType: e.targetType,
                                            targetId: e.targetId,
                                            name: e.name,
                                            description: e.description
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l)]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesUpdateItemDisplayInformationPatch = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesUpdateItemDisplayInformationPatchRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(i._),
        k = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        D = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        O = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        x = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        L = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        H = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        Q = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        j = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        V = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            r(t, e), t.prototype.v1ContentMetadataAppealPostRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1ContentMetadataAppealPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/content-metadata/appeal",
                                    schemaPath: "/v1/content-metadata/appeal",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            targetType: e.targetType,
                                            targetId: e.targetId,
                                            appealType: e.appealType
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        success: (0, i.u)(e, "success") ? e.success : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ContentMetadataAppealPost = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1ContentMetadataAppealPostRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1ContentMetadataAppealStatusGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1ContentMetadataAppealStatusGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.w("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1ContentMetadataAppealStatusGet.");
                                if (null === e.appealType || void 0 === e.appealType) throw new i.w("appealType", "Required parameter requestParameters.appealType was null or undefined when calling v1ContentMetadataAppealStatusGet.");
                                return n = {}, void 0 !== e.targetType && (n.TargetType = e.targetType), void 0 !== e.targetId && (n.TargetId = e.targetId), void 0 !== e.appealType && (n.AppealType = e.appealType), r = {}, [4, this.request({
                                    path: "/v1/content-metadata/appeal-status",
                                    schemaPath: "/v1/content-metadata/appeal-status",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        appealStatus: (0, i.u)(e, "appealStatus") ? e.appealStatus : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ContentMetadataAppealStatusGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1ContentMetadataAppealStatusGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }
        }(i._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(t, e), t.prototype.v1DelistItemPostRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.w("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1DelistItemPost.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.w("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1DelistItemPost.");
                                return n = {}, void 0 !== e.targetType && (n.TargetType = e.targetType), void 0 !== e.targetId && (n.TargetId = e.targetId), r = {}, [4, this.request({
                                    path: "/v1/delist-item",
                                    schemaPath: "/v1/delist-item",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l)]
                        }
                    })
                })
            }, t.prototype.v1DelistItemPost = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1DelistItemPostRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(i._)),
        K = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        z = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(t, e), t.prototype.v1FoldersFolderIdDeleteRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.w("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdDelete.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/folders/{folderId}".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.V(l)]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdDelete = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1FoldersFolderIdDeleteRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.w("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/folders/{folderId}".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1FoldersFolderIdGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdItemsDeleteRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.w("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdItemsDelete.");
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1FoldersFolderIdItemsDelete.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/folders/{folderId}/items".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}/items",
                                    method: "DELETE",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            items: void 0 === e.items ? void 0 : e.items.map(b)
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.V(l)]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdItemsDelete = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1FoldersFolderIdItemsDeleteRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdItemsGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.w("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdItemsGet.");
                                return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/folders/{folderId}/items".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}/items",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        items: (0, i.u)(e, "items") ? e.items.map(g) : void 0,
                                        nextCursor: (0, i.u)(e, "nextCursor") ? e.nextCursor : void 0,
                                        prevCursor: (0, i.u)(e, "prevCursor") ? e.prevCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdItemsGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1FoldersFolderIdItemsGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdItemsPostRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.w("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdItemsPost.");
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1FoldersFolderIdItemsPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/folders/{folderId}/items".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}/items",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            items: void 0 === e.items ? void 0 : e.items.map(b)
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.V(l)]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdItemsPost = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1FoldersFolderIdItemsPostRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdPatchRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.w("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1FoldersFolderIdPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/folders/{folderId}".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.V(l)]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdPatch = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1FoldersFolderIdPatchRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.v1FoldersGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.groupId && (n.groupId = e.groupId), r = {}, [4, this.request({
                                    path: "/v1/folders",
                                    schemaPath: "/v1/folders",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        folders: (0, i.u)(e, "folders") ? e.folders.map(f) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1FoldersGet = function() {
                return l(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1FoldersGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1FoldersPostRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1FoldersPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/folders",
                                    schemaPath: "/v1/folders",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            parentFolderId: e.parentFolderId,
                                            groupId: e.groupId
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        folderId: (0, i.u)(e, "folderId") ? e.folderId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1FoldersPost = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1FoldersPostRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(i._),
        J = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(t, e), t.prototype.v1CreationsGetAssetDetailsPostRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1CreationsGetAssetDetailsPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/creations/get-asset-details",
                                    schemaPath: "/v1/creations/get-asset-details",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            AssetIds: e.assetIds
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return e.map(u)
                                })]
                        }
                    })
                })
            }, t.prototype.v1CreationsGetAssetDetailsPost = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CreationsGetAssetDetailsPostRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CreationsGetAssetsGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new i.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling v1CreationsGetAssetsGet.");
                                return n = {}, void 0 !== e.assetType && (n.assetType = e.assetType), void 0 !== e.isArchived && (n.isArchived = e.isArchived), void 0 !== e.groupId && (n.groupId = e.groupId), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/creations/get-assets",
                                    schemaPath: "/v1/creations/get-assets",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, i.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, i.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, i.u)(e, "data") ? e.data.map(c) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CreationsGetAssetsGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CreationsGetAssetsGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1GetCommissionRatesGetRaw = function(e) {
                return l(this, void 0, void 0, function() {
                    var t, n, r;
                    return o(this, function(l) {
                        switch (l.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/get-commission-rates",
                                    schemaPath: "/v1/get-commission-rates",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = l.sent(), [2, new i.H(r, function(e) {
                                    return e.map(v)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GetCommissionRatesGet = function(e) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GetCommissionRatesGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(i._),
        W = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(t, e), t.prototype.v1ItemsByCreatorGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.bundleType && (n.bundleType = e.bundleType), void 0 !== e.assetType && (n.assetType = e.assetType), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.groupId && (n.groupId = e.groupId), void 0 !== e.taxonomy && (n.taxonomy = e.taxonomy), r = {}, [4, this.request({
                                    path: "/v1/items/by-creator",
                                    schemaPath: "/v1/items/by-creator",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        items: (0, i.u)(e, "items") ? e.items.map(m) : void 0,
                                        nextCursor: (0, i.u)(e, "nextCursor") ? e.nextCursor : void 0,
                                        prevCursor: (0, i.u)(e, "prevCursor") ? e.prevCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsByCreatorGet = function() {
                return l(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1ItemsByCreatorGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1ItemsByTokenGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.tokenId || void 0 === e.tokenId) throw new i.w("tokenId", "Required parameter requestParameters.tokenId was null or undefined when calling v1ItemsByTokenGet.");
                                if (null === e.limit || void 0 === e.limit) throw new i.w("limit", "Required parameter requestParameters.limit was null or undefined when calling v1ItemsByTokenGet.");
                                return n = {}, void 0 !== e.tokenId && (n.tokenId = e.tokenId), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/items/by-token",
                                    schemaPath: "/v1/items/by-token",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        items: (0, i.u)(e, "items") ? e.items.map(m) : void 0,
                                        nextCursor: (0, i.u)(e, "nextCursor") ? e.nextCursor : void 0,
                                        prevCursor: (0, i.u)(e, "prevCursor") ? e.prevCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsByTokenGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1ItemsByTokenGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1ItemsCategoriesGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.categoryDomain && (n.categoryDomain = e.categoryDomain), r = {}, [4, this.request({
                                    path: "/v1/items/categories",
                                    schemaPath: "/v1/items/categories",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        categoriesVersionId: (0, i.u)(e, "categoriesVersionId") ? e.categoriesVersionId : void 0,
                                        categories: (0, i.u)(e, "categories") ? e.categories.map(q) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsCategoriesGet = function() {
                return l(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1ItemsCategoriesGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1ItemsGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.itemType || void 0 === e.itemType) throw new i.w("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1ItemsGet.");
                                if (null === e.itemId || void 0 === e.itemId) throw new i.w("itemId", "Required parameter requestParameters.itemId was null or undefined when calling v1ItemsGet.");
                                return n = {}, void 0 !== e.itemType && (n.itemType = e.itemType), void 0 !== e.itemId && (n.itemId = e.itemId), r = {}, [4, this.request({
                                    path: "/v1/items",
                                    schemaPath: "/v1/items",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        item: (0, i.u)(e, "item") ? m(e.item) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1ItemsGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1ItemsPriceFloorGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemType || void 0 === e.collectibleItemType) throw new i.w("collectibleItemType", "Required parameter requestParameters.collectibleItemType was null or undefined when calling v1ItemsPriceFloorGet.");
                                if (null === e.creationType || void 0 === e.creationType) throw new i.w("creationType", "Required parameter requestParameters.creationType was null or undefined when calling v1ItemsPriceFloorGet.");
                                if (null === e.isPbr || void 0 === e.isPbr) throw new i.w("isPbr", "Required parameter requestParameters.isPbr was null or undefined when calling v1ItemsPriceFloorGet.");
                                if (null === e.isEmissive || void 0 === e.isEmissive) throw new i.w("isEmissive", "Required parameter requestParameters.isEmissive was null or undefined when calling v1ItemsPriceFloorGet.");
                                return n = {}, void 0 !== e.collectibleItemType && (n.collectibleItemType = e.collectibleItemType), void 0 !== e.creationType && (n.creationType = e.creationType), void 0 !== e.isPbr && (n.isPbr = e.isPbr), void 0 !== e.isEmissive && (n.isEmissive = e.isEmissive), void 0 !== e.assetType && (n.assetType = e.assetType), void 0 !== e.bundleType && (n.bundleType = e.bundleType), void 0 !== e.categoryId && (n.categoryId = e.categoryId), r = {}, [4, this.request({
                                    path: "/v1/items/price-floor",
                                    schemaPath: "/v1/items/price-floor",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        priceFloor: (0, i.u)(e, "priceFloor") ? e.priceFloor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsPriceFloorGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1ItemsPriceFloorGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1ItemsUploadFeeGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.bundleType && (n.bundleType = e.bundleType), void 0 !== e.assetType && (n.assetType = e.assetType), r = {}, [4, this.request({
                                    path: "/v1/items/upload-fee",
                                    schemaPath: "/v1/items/upload-fee",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        canAfford: (0, i.u)(e, "canAfford") ? e.canAfford : void 0,
                                        price: (0, i.u)(e, "price") ? e.price : void 0,
                                        balance: (0, i.u)(e, "balance") ? e.balance : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsUploadFeeGet = function() {
                return l(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1ItemsUploadFeeGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(i._),
        X = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        Y = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(t, e), t.prototype.v1AssetTypesAssetTypeAgentsGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new i.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling v1AssetTypesAssetTypeAgentsGet.");
                                if (null === e.actionType || void 0 === e.actionType) throw new i.w("actionType", "Required parameter requestParameters.actionType was null or undefined when calling v1AssetTypesAssetTypeAgentsGet.");
                                if (null === e.agentType || void 0 === e.agentType) throw new i.w("agentType", "Required parameter requestParameters.agentType was null or undefined when calling v1AssetTypesAssetTypeAgentsGet.");
                                return n = {}, void 0 !== e.actionType && (n.ActionType = e.actionType), void 0 !== e.agentType && (n.AgentType = e.agentType), r = {}, [4, this.request({
                                    path: "/v1/asset-types/{assetType}/agents".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/asset-types/{assetType}/agents",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        agents: (0, i.u)(e, "agents") ? e.agents.map(a) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetTypesAssetTypeAgentsGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1AssetTypesAssetTypeAgentsGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1PermissionsActionAllowedForItemTypeGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.action || void 0 === e.action) throw new i.w("action", "Required parameter requestParameters.action was null or undefined when calling v1PermissionsActionAllowedForItemTypeGet.");
                                return n = {}, void 0 !== e.action && (n.action = e.action), void 0 !== e.groupId && (n.groupId = e.groupId), void 0 !== e.assetType && (n.assetType = e.assetType), void 0 !== e.bundleType && (n.bundleType = e.bundleType), void 0 !== e.lookType && (n.lookType = e.lookType), void 0 !== e.trustedCreatorCheck && (n.trustedCreatorCheck = e.trustedCreatorCheck), r = {}, [4, this.request({
                                    path: "/v1/permissions/action-allowed-for-item-type",
                                    schemaPath: "/v1/permissions/action-allowed-for-item-type",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        isActionAllowed: (0, i.u)(e, "isActionAllowed") ? e.isActionAllowed : void 0,
                                        metadataPermissions: (0, i.u)(e, "metadataPermissions") ? e.metadataPermissions : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PermissionsActionAllowedForItemTypeGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1PermissionsActionAllowedForItemTypeGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1PermissionsGroupsGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.action || void 0 === e.action) throw new i.w("action", "Required parameter requestParameters.action was null or undefined when calling v1PermissionsGroupsGet.");
                                return n = {}, void 0 !== e.action && (n.action = e.action), r = {}, [4, this.request({
                                    path: "/v1/permissions/groups",
                                    schemaPath: "/v1/permissions/groups",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        allowedGroups: (0, i.u)(e, "allowedGroups") ? e.allowedGroups.map(y) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PermissionsGroupsGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1PermissionsGroupsGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1PermissionsItemTypesGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.action || void 0 === e.action) throw new i.w("action", "Required parameter requestParameters.action was null or undefined when calling v1PermissionsItemTypesGet.");
                                if (null === e.targetTypes || void 0 === e.targetTypes) throw new i.w("targetTypes", "Required parameter requestParameters.targetTypes was null or undefined when calling v1PermissionsItemTypesGet.");
                                return n = {}, void 0 !== e.action && (n.action = e.action), e.targetTypes && (n.targetTypes = e.targetTypes), r = {}, [4, this.request({
                                    path: "/v1/permissions/item-types",
                                    schemaPath: "/v1/permissions/item-types",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return null == e ? e : {
                                        allowedAssetTypes: (0, i.u)(e, "allowedAssetTypes") ? e.allowedAssetTypes : void 0,
                                        allowedBundleTypes: (0, i.u)(e, "allowedBundleTypes") ? e.allowedBundleTypes : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PermissionsItemTypesGet = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1PermissionsItemTypesGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(i._),
        Z = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(t, e), t.prototype.v1PreferencesPublishingDeleteRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.groupId && (n.groupId = e.groupId), r = {}, [4, this.request({
                                    path: "/v1/preferences/publishing",
                                    schemaPath: "/v1/preferences/publishing",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.V(l)]
                        }
                    })
                })
            }, t.prototype.v1PreferencesPublishingDelete = function() {
                return l(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1PreferencesPublishingDeleteRaw(e, t)];
                            case 1:
                                return i.sent(), [2]
                        }
                    })
                })
            }, t.prototype.v1PreferencesPublishingGetRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, void 0 !== e.groupId && (n.groupId = e.groupId), r = {}, [4, this.request({
                                    path: "/v1/preferences/publishing",
                                    schemaPath: "/v1/preferences/publishing",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PreferencesPublishingGet = function() {
                return l(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1PreferencesPublishingGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1PreferencesPublishingPatchRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PreferencesPublishingPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/preferences/publishing",
                                    schemaPath: "/v1/preferences/publishing",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            creatorUserId: e.creatorUserId,
                                            creatorGroupId: e.creatorGroupId,
                                            publishingType: e.publishingType,
                                            saleLocationType: e.saleLocationType,
                                            places: e.places,
                                            priceInRobux: e.priceInRobux,
                                            priceOffset: e.priceOffset,
                                            isFree: e.isFree,
                                            enableRegionalPricing: e.enableRegionalPricing,
                                            isRentalOptIn: e.isRentalOptIn,
                                            autoPublishEnabled: e.autoPublishEnabled
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PreferencesPublishingPatch = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1PreferencesPublishingPatchRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1PreferencesPublishingPostRaw = function(e, t) {
                return l(this, void 0, void 0, function() {
                    var n, r, l;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PreferencesPublishingPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/preferences/publishing",
                                    schemaPath: "/v1/preferences/publishing",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            creatorUserId: e.creatorUserId,
                                            creatorGroupId: e.creatorGroupId,
                                            publishingType: e.publishingType,
                                            saleLocationType: e.saleLocationType,
                                            places: e.places,
                                            priceInRobux: e.priceInRobux,
                                            priceOffset: e.priceOffset,
                                            isFree: e.isFree,
                                            enableRegionalPricing: e.enableRegionalPricing,
                                            isRentalOptIn: e.isRentalOptIn,
                                            autoPublishEnabled: e.autoPublishEnabled
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return l = o.sent(), [2, new i.H(l, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PreferencesPublishingPost = function(e, t) {
                return l(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1PreferencesPublishingPostRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t
        }(i._);
    e.s(["S", 0, S, "R", 0, V, "L", 0, z, "E", 0, J, "l", 0, W, "T", 0, Y, "M", 0, Z, "s", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "W", 0, {
        Unknown: "Unknown",
        ReviewPending: "ReviewPending",
        Moderated: "Moderated",
        ReviewApproved: "ReviewApproved",
        OnSale: "OnSale",
        OffSale: "OffSale",
        DelayedRelease: "DelayedRelease",
        Free: "Free"
    }, "t", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6,
        NUMBER_7: 7,
        NUMBER_8: 8,
        NUMBER_9: 9,
        NUMBER_10: 10,
        NUMBER_11: 11,
        NUMBER_12: 12,
        NUMBER_13: 13,
        NUMBER_16: 16,
        NUMBER_17: 17,
        NUMBER_18: 18,
        NUMBER_19: 19,
        NUMBER_21: 21,
        NUMBER_22: 22,
        NUMBER_24: 24,
        NUMBER_25: 25,
        NUMBER_26: 26,
        NUMBER_27: 27,
        NUMBER_28: 28,
        NUMBER_29: 29,
        NUMBER_30: 30,
        NUMBER_31: 31,
        NUMBER_32: 32,
        NUMBER_33: 33,
        NUMBER_34: 34,
        NUMBER_35: 35,
        NUMBER_37: 37,
        NUMBER_38: 38,
        NUMBER_39: 39,
        NUMBER_40: 40,
        NUMBER_41: 41,
        NUMBER_42: 42,
        NUMBER_43: 43,
        NUMBER_44: 44,
        NUMBER_45: 45,
        NUMBER_46: 46,
        NUMBER_47: 47,
        NUMBER_48: 48,
        NUMBER_49: 49,
        NUMBER_50: 50,
        NUMBER_51: 51,
        NUMBER_52: 52,
        NUMBER_53: 53,
        NUMBER_54: 54,
        NUMBER_55: 55,
        NUMBER_56: 56,
        NUMBER_59: 59,
        NUMBER_60: 60,
        NUMBER_61: 61,
        NUMBER_62: 62,
        NUMBER_63: 63,
        NUMBER_64: 64,
        NUMBER_65: 65,
        NUMBER_66: 66,
        NUMBER_67: 67,
        NUMBER_68: 68,
        NUMBER_69: 69,
        NUMBER_70: 70,
        NUMBER_71: 71,
        NUMBER_72: 72,
        NUMBER_73: 73,
        NUMBER_74: 74,
        NUMBER_75: 75,
        NUMBER_76: 76,
        NUMBER_77: 77,
        NUMBER_78: 78,
        NUMBER_79: 79,
        NUMBER_80: 80,
        NUMBER_81: 81,
        NUMBER_82: 82,
        NUMBER_83: 83,
        NUMBER_84: 84,
        NUMBER_85: 85,
        NUMBER_86: 86,
        NUMBER_87: 87,
        NUMBER_88: 88,
        NUMBER_89: 89,
        NUMBER_90: 90,
        NUMBER_91: 91,
        NUMBER_92: 92
    }, "z", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "x", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5
    }, "$", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "U", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "k", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "X", 0, {
        Unknown: "Unknown",
        Asset: "Asset",
        Bundle: "Bundle",
        IecToken: "IECToken",
        Folder: "Folder"
    }, "J", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "D", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "p", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "q", 0, P, "K", 0, B, "o", 0, U, "V", 0, _, "O", 0, M, "y", 0, N, "e", 0, {
        Unknown: "Unknown",
        Body: "Body",
        DynamicHead: "DynamicHead",
        Shoes: "Shoes",
        AvatarAnimations: "AvatarAnimations"
    }, "w", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "Y", 0, k, "f", 0, O, "g", 0, D, "Z", 0, L, "m", 0, x, "H", 0, j, "G", 0, Q, "h", 0, H, "A", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }, "u", 0, K, "a", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6,
        NUMBER_7: 7,
        NUMBER_8: 8,
        NUMBER_9: 9,
        NUMBER_10: 10,
        NUMBER_11: 11,
        NUMBER_12: 12,
        NUMBER_13: 13,
        NUMBER_16: 16,
        NUMBER_17: 17,
        NUMBER_18: 18,
        NUMBER_19: 19,
        NUMBER_21: 21,
        NUMBER_22: 22,
        NUMBER_24: 24,
        NUMBER_25: 25,
        NUMBER_26: 26,
        NUMBER_27: 27,
        NUMBER_28: 28,
        NUMBER_29: 29,
        NUMBER_30: 30,
        NUMBER_31: 31,
        NUMBER_32: 32,
        NUMBER_33: 33,
        NUMBER_34: 34,
        NUMBER_35: 35,
        NUMBER_37: 37,
        NUMBER_38: 38,
        NUMBER_39: 39,
        NUMBER_40: 40,
        NUMBER_41: 41,
        NUMBER_42: 42,
        NUMBER_43: 43,
        NUMBER_44: 44,
        NUMBER_45: 45,
        NUMBER_46: 46,
        NUMBER_47: 47,
        NUMBER_48: 48,
        NUMBER_49: 49,
        NUMBER_50: 50,
        NUMBER_51: 51,
        NUMBER_52: 52,
        NUMBER_53: 53,
        NUMBER_54: 54,
        NUMBER_55: 55,
        NUMBER_56: 56,
        NUMBER_59: 59,
        NUMBER_60: 60,
        NUMBER_61: 61,
        NUMBER_62: 62,
        NUMBER_63: 63,
        NUMBER_64: 64,
        NUMBER_65: 65,
        NUMBER_66: 66,
        NUMBER_67: 67,
        NUMBER_68: 68,
        NUMBER_69: 69,
        NUMBER_70: 70,
        NUMBER_71: 71,
        NUMBER_72: 72,
        NUMBER_73: 73,
        NUMBER_74: 74,
        NUMBER_75: 75,
        NUMBER_76: 76,
        NUMBER_77: 77,
        NUMBER_78: 78,
        NUMBER_79: 79,
        NUMBER_80: 80,
        NUMBER_81: 81,
        NUMBER_82: 82,
        NUMBER_83: 83,
        NUMBER_84: 84,
        NUMBER_85: 85,
        NUMBER_86: 86,
        NUMBER_87: 87,
        NUMBER_88: 88,
        NUMBER_89: 89,
        NUMBER_90: 90,
        NUMBER_91: 91,
        NUMBER_92: 92
    }, "B", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3
    }, "r", 0, X, "N", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "b", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "v", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6,
        NUMBER_7: 7,
        NUMBER_8: 8,
        NUMBER_9: 9,
        NUMBER_10: 10,
        NUMBER_11: 11,
        NUMBER_12: 12,
        NUMBER_13: 13,
        NUMBER_16: 16,
        NUMBER_17: 17,
        NUMBER_18: 18,
        NUMBER_19: 19,
        NUMBER_21: 21,
        NUMBER_22: 22,
        NUMBER_24: 24,
        NUMBER_25: 25,
        NUMBER_26: 26,
        NUMBER_27: 27,
        NUMBER_28: 28,
        NUMBER_29: 29,
        NUMBER_30: 30,
        NUMBER_31: 31,
        NUMBER_32: 32,
        NUMBER_33: 33,
        NUMBER_34: 34,
        NUMBER_35: 35,
        NUMBER_37: 37,
        NUMBER_38: 38,
        NUMBER_39: 39,
        NUMBER_40: 40,
        NUMBER_41: 41,
        NUMBER_42: 42,
        NUMBER_43: 43,
        NUMBER_44: 44,
        NUMBER_45: 45,
        NUMBER_46: 46,
        NUMBER_47: 47,
        NUMBER_48: 48,
        NUMBER_49: 49,
        NUMBER_50: 50,
        NUMBER_51: 51,
        NUMBER_52: 52,
        NUMBER_53: 53,
        NUMBER_54: 54,
        NUMBER_55: 55,
        NUMBER_56: 56,
        NUMBER_59: 59,
        NUMBER_60: 60,
        NUMBER_61: 61,
        NUMBER_62: 62,
        NUMBER_63: 63,
        NUMBER_64: 64,
        NUMBER_65: 65,
        NUMBER_66: 66,
        NUMBER_67: 67,
        NUMBER_68: 68,
        NUMBER_69: 69,
        NUMBER_70: 70,
        NUMBER_71: 71,
        NUMBER_72: 72,
        NUMBER_73: 73,
        NUMBER_74: 74,
        NUMBER_75: 75,
        NUMBER_76: 76,
        NUMBER_77: 77,
        NUMBER_78: 78,
        NUMBER_79: 79,
        NUMBER_80: 80,
        NUMBER_81: 81,
        NUMBER_82: 82,
        NUMBER_83: 83,
        NUMBER_84: 84,
        NUMBER_85: 85,
        NUMBER_86: 86,
        NUMBER_87: 87,
        NUMBER_88: 88,
        NUMBER_89: 89,
        NUMBER_90: 90,
        NUMBER_91: 91,
        NUMBER_92: 92
    }, "_", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6
    }, "C", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6,
        NUMBER_7: 7,
        NUMBER_8: 8,
        NUMBER_9: 9,
        NUMBER_10: 10,
        NUMBER_11: 11,
        NUMBER_12: 12,
        NUMBER_13: 13,
        NUMBER_16: 16,
        NUMBER_17: 17,
        NUMBER_18: 18,
        NUMBER_19: 19,
        NUMBER_21: 21,
        NUMBER_22: 22,
        NUMBER_24: 24,
        NUMBER_25: 25,
        NUMBER_26: 26,
        NUMBER_27: 27,
        NUMBER_28: 28,
        NUMBER_29: 29,
        NUMBER_30: 30,
        NUMBER_31: 31,
        NUMBER_32: 32,
        NUMBER_33: 33,
        NUMBER_34: 34,
        NUMBER_35: 35,
        NUMBER_37: 37,
        NUMBER_38: 38,
        NUMBER_39: 39,
        NUMBER_40: 40,
        NUMBER_41: 41,
        NUMBER_42: 42,
        NUMBER_43: 43,
        NUMBER_44: 44,
        NUMBER_45: 45,
        NUMBER_46: 46,
        NUMBER_47: 47,
        NUMBER_48: 48,
        NUMBER_49: 49,
        NUMBER_50: 50,
        NUMBER_51: 51,
        NUMBER_52: 52,
        NUMBER_53: 53,
        NUMBER_54: 54,
        NUMBER_55: 55,
        NUMBER_56: 56,
        NUMBER_59: 59,
        NUMBER_60: 60,
        NUMBER_61: 61,
        NUMBER_62: 62,
        NUMBER_63: 63,
        NUMBER_64: 64,
        NUMBER_65: 65,
        NUMBER_66: 66,
        NUMBER_67: 67,
        NUMBER_68: 68,
        NUMBER_69: 69,
        NUMBER_70: 70,
        NUMBER_71: 71,
        NUMBER_72: 72,
        NUMBER_73: 73,
        NUMBER_74: 74,
        NUMBER_75: 75,
        NUMBER_76: 76,
        NUMBER_77: 77,
        NUMBER_78: 78,
        NUMBER_79: 79,
        NUMBER_80: 80,
        NUMBER_81: 81,
        NUMBER_82: 82,
        NUMBER_83: 83,
        NUMBER_84: 84,
        NUMBER_85: 85,
        NUMBER_86: 86,
        NUMBER_87: 87,
        NUMBER_88: 88,
        NUMBER_89: 89,
        NUMBER_90: 90,
        NUMBER_91: 91,
        NUMBER_92: 92,
        NUMBER_93: 93,
        NUMBER_94: 94
    }, "j", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6
    }, "d", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3
    }], 336288);
    var $ = e.i(272593);
    let ee = new class {
        checkItemConfigurationAccess(e, t) {
            let i = {
                targetType: e ? k.NUMBER_1 : k.NUMBER_0,
                targetId: t
            };
            return this.collectiblesApi.v1CollectiblesCheckItemConfigurationAccessGet(i)
        }
        checkItemPublishAccess(e, t, i) {
            let n = {
                targetType: e ? D.NUMBER_1 : D.NUMBER_0,
                targetId: t,
                publishingType: i ? O.NUMBER_1 : O.NUMBER_2
            };
            return this.collectiblesApi.v1CollectiblesCheckItemPublishAccessGet(n)
        }
        delistItem(e, t) {
            let i = {
                targetType: e ? K.NUMBER_1 : K.NUMBER_0,
                targetId: t
            };
            return this.delistingApi.v1DelistItemPost(i)
        }
        getCollectiblesMetadata() {
            return this.collectiblesApi.v1CollectiblesMetadataGet()
        }
        getCollectibleCommissionRates() {
            return this.collectiblesApi.v1CollectiblesCommissionRatesGet()
        }
        getCollectiblePublishingFees(e, t, i, n, r, l, o) {
            let s = {
                targetType: e ? H.NUMBER_1 : H.NUMBER_0,
                targetID: t,
                quantity: i,
                publishingType: 1 === n ? j.NUMBER_1 : j.NUMBER_2,
                saleLocation: r,
                resaleRestriction: l ? Q.NUMBER_1 : Q.NUMBER_2,
                isFree: o
            };
            return this.collectiblesApi.v1CollectiblesPublishingFeesGet(s)
        }
        getPriceFloor(e, t, i) {
            let n = {
                targetType: t ? x.NUMBER_1 : x.NUMBER_0,
                targetId: e,
                publishingType: i ? L.NUMBER_1 : L.NUMBER_2
            };
            return this.collectiblesApi.v1CollectiblesPriceFloorGet(n)
        }
        updateCollectibleItemDisplayInfo(e, t, i, n) {
            let r = {
                targetType: e ? N.NUMBER_1 : N.NUMBER_0,
                targetId: t.toString(),
                name: i,
                description: n
            };
            return this.collectiblesApi.v1CollectiblesUpdateItemDisplayInformationPatch({
                request: r
            })
        }
        bulkUpdateCollectible(e, t, i, n) {
            return this.collectiblesApi.v1CollectiblesBulkUpdatePatch({
                request: {
                    idempotencyKey: e,
                    groupId: t,
                    updateTargets: {
                        assetType: i
                    },
                    updatePayload: {
                        rentalOptIn: n
                    }
                }
            })
        }
        publishCollectible(e, t, i, n, r, l, o, s, a, u, c, d, p, v, h, m, R, f, b, g, w, y) {
            let I = {
                idempotencyToken: e,
                targetId: t,
                targetType: i ? U.NUMBER_1 : U.NUMBER_0,
                publishingType: n ? P.NUMBER_1 : P.NUMBER_2,
                agreedPublishingFee: r,
                creatorUserId: l,
                creatorGroupId: o,
                publisherUserId: s,
                quantity: a,
                quantityLimitPerUser: u,
                resaleRestriction: c ? B.NUMBER_1 : B.NUMBER_2,
                priceInRobux: d,
                priceOffset: p,
                isFree: v,
                saleLocationConfiguration: h,
                name: m,
                description: R,
                onSaleTime: null != f ? f : void 0,
                offSaleTime: null != b ? b : void 0,
                optOutFromRegionalPricing: null != g && g,
                isRentalOptIn: null != w && w,
                agreementId: y
            };
            return this.collectiblesApi.v1CollectiblesPost({
                request: I
            })
        }
        updateCollectibleInformation(e, t, i, n, r, l, o, s, a, u, c, d) {
            let p = {
                saleLocationConfiguration: t,
                saleStatus: i ? M.NUMBER_0 : M.NUMBER_1,
                quantityLimitPerUser: n,
                resaleRestriction: r ? _.NUMBER_1 : _.NUMBER_2,
                priceInRobux: l,
                priceOffset: o,
                isFree: s,
                onSaleTime: null != a ? a : void 0,
                offSaleTime: null != u ? u : void 0,
                optOutFromRegionalPricing: null != c && c,
                isRentalOptIn: d
            };
            return this.collectiblesApi.v1CollectiblesCollectibleItemIdPatch({
                collectibleItemId: e,
                updateCollectibleItemRequest: p
            })
        }
        cancelScheduledSaleStatus(e) {
            return this.collectiblesApi.v1CollectiblesCollectibleItemIdSaleScheduleDelete({
                collectibleItemId: e
            })
        }
        getCreations(e, t, i, n, r) {
            return this.itemConfigurationApi.v1CreationsGetAssetsGet({
                assetType: e,
                isArchived: t,
                groupId: i,
                limit: n,
                cursor: r
            })
        }
        getAllowedAssetTypes(e, t) {
            return this.permissionsApi.v1PermissionsItemTypesGet({
                action: e,
                targetTypes: t
            })
        }
        isActionAllowedForItemType(e, t, i, n, r) {
            return this.permissionsApi.v1PermissionsActionAllowedForItemTypeGet({
                action: e,
                groupId: t,
                assetType: i,
                bundleType: n,
                trustedCreatorCheck: r
            })
        }
        async getItemUploadFee(e, t) {
            return this.marketplaceItemApi.v1ItemsUploadFeeGet({
                assetType: e,
                bundleType: t
            })
        }
        async getPriceFloorFromVariables(e, t, i, n, r, l) {
            let o = arguments.length > 6 && void 0 !== arguments[6] && arguments[6];
            return this.marketplaceItemApi.v1ItemsPriceFloorGet({
                collectibleItemType: e,
                creationType: t,
                isPbr: i,
                isEmissive: o,
                assetType: n,
                bundleType: r,
                categoryId: l
            })
        }
        getItem(e, t) {
            let i = {
                itemType: e ? X.NUMBER_1 : X.NUMBER_0,
                itemId: t
            };
            return this.marketplaceItemApi.v1ItemsGet(i)
        }
        getItemsByCreator(e, t, i, n, r, l) {
            return this.marketplaceItemApi.v1ItemsByCreatorGet({
                limit: e,
                cursor: t,
                groupId: i,
                bundleType: n,
                assetType: r,
                taxonomy: l
            })
        }
        getItemCategories(e) {
            return this.marketplaceItemApi.v1ItemsCategoriesGet({
                categoryDomain: e
            })
        }
        getItemsByToken(e, t, i) {
            return this.marketplaceItemApi.v1ItemsByTokenGet({
                tokenId: e,
                limit: t,
                cursor: i
            })
        }
        getRepresentativeCountries() {
            return this.collectiblesApi.v1CollectiblesRegionalPricingRepresentativeCountriesGet()
        }
        getRegionalPricingPreview(e, t, i, n, r) {
            let l = {
                targetType: e ? k.NUMBER_1 : k.NUMBER_0,
                targetId: t,
                publishingType: i ? j.NUMBER_1 : j.NUMBER_2,
                minimumPrice: n,
                priceOffset: r
            };
            return this.collectiblesApi.v1CollectiblesRegionalPricingPreviewGet(l)
        }
        getRentalPricingPreview(e, t, i, n, r, l) {
            let o = {
                targetType: e ? k.NUMBER_1 : k.NUMBER_0,
                targetId: t,
                publishingType: i ? j.NUMBER_1 : j.NUMBER_2,
                minimumPrice: n,
                priceOffset: r,
                includeRegionalPricing: l
            };
            return this.collectiblesApi.v1CollectiblesRentalPricingPreviewGet(o)
        }
        getRevenueSplit(e, t, i, n, r, l, o) {
            let s = {
                targetType: e ? k.NUMBER_1 : k.NUMBER_0,
                targetID: t,
                collectibleItemType: i ? j.NUMBER_1 : j.NUMBER_2,
                minimumPrice: n,
                priceOffset: r,
                purchasePlatform: l,
                licenseId: o
            };
            return this.collectiblesApi.v1CollectiblesRevenueSplitGet(s)
        }
        getFolder(e) {
            return this.foldersApi.v1FoldersFolderIdGet({
                folderId: e
            })
        }
        getFolders(e) {
            return this.foldersApi.v1FoldersGet({
                groupId: e
            })
        }
        getFolderItems(e, t, i) {
            return this.foldersApi.v1FoldersFolderIdItemsGet({
                folderId: e,
                cursor: t,
                limit: i
            })
        }
        createFolder(e, t, i) {
            return this.foldersApi.v1FoldersPost({
                request: {
                    name: e,
                    parentFolderId: t,
                    groupId: i
                }
            })
        }
        addItemToFolder(e, t, i) {
            return this.addItemsToFolder([e], t, i)
        }
        addItemsToFolder(e, t, i) {
            let n = {
                items: e.map(e => ({
                    id: e,
                    itemType: t
                }))
            };
            return this.foldersApi.v1FoldersFolderIdItemsPost({
                folderId: i,
                request: n
            })
        }
        removeItemFromFolder(e, t, i) {
            return this.foldersApi.v1FoldersFolderIdItemsDelete({
                folderId: i,
                request: {
                    items: [{
                        id: e,
                        itemType: t
                    }]
                }
            })
        }
        updateFolder(e, t) {
            return this.foldersApi.v1FoldersFolderIdPatch({
                folderId: e,
                request: {
                    name: t
                }
            })
        }
        deleteFolder(e) {
            return this.foldersApi.v1FoldersFolderIdDelete({
                folderId: e
            })
        }
        restockCollectible(e, t, i) {
            return this.collectiblesApi.v1CollectiblesCollectibleItemIdRestockPost({
                collectibleItemId: e,
                request: {
                    newTotalQuantity: t,
                    agreedRestockingFee: i
                }
            })
        }
        getRestockingFees(e, t) {
            return this.collectiblesApi.v1CollectiblesCollectibleItemIdRestockingFeesGet({
                collectibleItemId: e,
                additionalQuantity: t
            })
        }
        getRestockEligibility(e) {
            return this.collectiblesApi.v1CollectiblesCollectibleItemIdRestockEligibilityGet({
                collectibleItemId: e
            })
        }
        getPublishingPreferences(e) {
            return this.publishingPreferencesApi.v1PreferencesPublishingGet({
                groupId: e
            })
        }
        createPublishingPreferences(e) {
            return this.publishingPreferencesApi.v1PreferencesPublishingPost({
                request: e
            })
        }
        updatePublishingPreferences(e) {
            return this.publishingPreferencesApi.v1PreferencesPublishingPatch({
                request: e
            })
        }
        deletePublishingPreferences(e) {
            return this.publishingPreferencesApi.v1PreferencesPublishingDelete({
                groupId: e
            })
        }
        constructor() {
            (0, t._)(this, "collectiblesApi", void 0), (0, t._)(this, "delistingApi", void 0), (0, t._)(this, "itemConfigurationApi", void 0), (0, t._)(this, "marketplaceItemApi", void 0), (0, t._)(this, "permissionsApi", void 0), (0, t._)(this, "foldersApi", void 0), (0, t._)(this, "publishingPreferencesApi", void 0);
            let e = (0, $.f)("itemconfiguration", "bedev1");
            this.collectiblesApi = new S(e), this.delistingApi = new V(e), this.itemConfigurationApi = new J(e), this.marketplaceItemApi = new W(e), this.permissionsApi = new Y(e), this.foldersApi = new z(e), this.publishingPreferencesApi = new Z(e)
        }
    };
    e.s(["f", 0, ee], 913893)
}]);

//# debugId=cc6398d1-c2dd-d4e8-77c5-f9637a5dcef1
//# sourceMappingURL=3biba86rfbp-i.js.map