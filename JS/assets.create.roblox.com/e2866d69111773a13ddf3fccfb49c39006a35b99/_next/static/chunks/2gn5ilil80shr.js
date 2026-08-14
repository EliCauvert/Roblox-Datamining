;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "82bdab37-7f9a-4767-0503-84e323a7d7c0")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 913893, 536306, e => {
    "use strict";
    var t = e.i(721281),
        i = e.i(677753),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i])
            })(e, t)
        };

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }

    function s(e, t, i, r) {
        return new(i || (i = Promise))(function(n, s) {
            function o(e) {
                try {
                    a(r.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function l(e) {
                try {
                    a(r.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function a(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(o, l)
            }
            a((r = r.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var i, r, n, s = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = l(0), o.throw = l(1), o.return = l(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function l(l) {
            return function(a) {
                var u = [l, a];
                if (i) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (s = 0)), s;) try {
                    if (i = 1, r && (n = 2 & u[0] ? r.return : u[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, u[1])).done) return n;
                    switch (r = 0, n && (u = [2 & u[0], n.value]), u[0]) {
                        case 0:
                        case 1:
                            n = u;
                            break;
                        case 4:
                            return s.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            s.label++, r = u[1], u = [0];
                            continue;
                        case 7:
                            u = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = s.trys).length > 0 && n[n.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === u[0] && (!n || u[1] > n[0] && u[1] < n[3])) {
                                s.label = u[1];
                                break
                            }
                            if (6 === u[0] && s.label < n[1]) {
                                s.label = n[1], n = u;
                                break
                            }
                            if (n && s.label < n[2]) {
                                s.label = n[2], s.ops.push(u);
                                break
                            }
                            n[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    u = t.call(e, s)
                } catch (e) {
                    u = [6, e], r = 0
                } finally {
                    i = n = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function l(e, t) {
        return null == e ? e : {
            seconds: (0, i.exists)(e, "Seconds") ? e.Seconds : void 0,
            nanos: (0, i.exists)(e, "Nanos") ? e.Nanos : void 0
        }
    }

    function a(e) {
        var t;
        return null == (t = e) ? t : {
            type: (0, i.exists)(t, "type") ? t.type : void 0,
            id: (0, i.exists)(t, "id") ? t.id : void 0,
            name: (0, i.exists)(t, "name") ? t.name : void 0
        }
    }

    function u(e) {
        var t, r, n;
        return null == (t = e) ? t : {
            assetId: (0, i.exists)(t, "assetId") ? t.assetId : void 0,
            name: (0, i.exists)(t, "name") ? t.name : void 0,
            status: (0, i.exists)(t, "status") ? t.status : void 0,
            description: (0, i.exists)(t, "description") ? t.description : void 0,
            creatorType: (0, i.exists)(t, "creatorType") ? t.creatorType : void 0,
            creatorTargetId: (0, i.exists)(t, "creatorTargetId") ? t.creatorTargetId : void 0,
            price: (0, i.exists)(t, "price") ? t.price : void 0,
            priceConfiguration: (0, i.exists)(t, "priceConfiguration") ? null == (r = t.priceConfiguration) ? r : {
                priceInRobux: (0, i.exists)(r, "priceInRobux") ? r.priceInRobux : void 0,
                premiumDiscountPercentage: (0, i.exists)(r, "premiumDiscountPercentage") ? r.premiumDiscountPercentage : void 0,
                premiumPriceInRobux: (0, i.exists)(r, "premiumPriceInRobux") ? r.premiumPriceInRobux : void 0,
                priceOffset: (0, i.exists)(r, "priceOffset") ? r.priceOffset : void 0
            } : void 0,
            isArchived: (0, i.exists)(t, "isArchived") ? t.isArchived : void 0,
            assetType: (0, i.exists)(t, "assetType") ? t.assetType : void 0,
            releaseConfiguration: (0, i.exists)(t, "releaseConfiguration") ? null == (n = t.releaseConfiguration) ? n : {
                saleAvailabilityLocations: (0, i.exists)(n, "saleAvailabilityLocations") ? n.saleAvailabilityLocations : void 0
            } : void 0,
            created: (0, i.exists)(t, "created") ? new Date(t.created) : void 0,
            updated: (0, i.exists)(t, "updated") ? new Date(t.updated) : void 0,
            isDelisted: (0, i.exists)(t, "isDelisted") ? t.isDelisted : void 0,
            isCreatedForBundle: (0, i.exists)(t, "isCreatedForBundle") ? t.isCreatedForBundle : void 0
        }
    }

    function c(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, i.exists)(t, "assetId") ? t.assetId : void 0,
            name: (0, i.exists)(t, "name") ? t.name : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function d(e, t) {
        return null == e ? e : {
            creatorSplitPercentage: (0, i.exists)(e, "creatorSplitPercentage") ? e.creatorSplitPercentage : void 0,
            sellerSplitPercentage: (0, i.exists)(e, "sellerSplitPercentage") ? e.sellerSplitPercentage : void 0,
            marketplaceSplitPercentage: (0, i.exists)(e, "marketplaceSplitPercentage") ? e.marketplaceSplitPercentage : void 0,
            resellerSplitPercentage: (0, i.exists)(e, "resellerSplitPercentage") ? e.resellerSplitPercentage : void 0
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            priceFloorMultiplierLowerBound: (0, i.exists)(t, "priceFloorMultiplierLowerBound") ? t.priceFloorMultiplierLowerBound : void 0,
            priceFloorMultiplierUpperBound: (0, i.exists)(t, "priceFloorMultiplierUpperBound") ? t.priceFloorMultiplierUpperBound : void 0,
            revenueSplits: (0, i.exists)(t, "revenueSplits") ? d(t.revenueSplits) : void 0
        }
    }

    function v(e) {
        var t, r, n;
        return null == (t = e) ? t : {
            itemTypeDetails: (0, i.exists)(t, "itemTypeDetails") ? null == (r = t.itemTypeDetails) ? r : {
                itemType: (0, i.exists)(r, "itemType") ? r.itemType : void 0
            } : void 0,
            commissionRates: (0, i.exists)(t, "commissionRates") ? null == (n = t.commissionRates) ? n : {
                marketplaceFeesPercentage: (0, i.exists)(n, "marketplaceFeesPercentage") ? n.marketplaceFeesPercentage : void 0,
                creatorFeesPercentage: (0, i.exists)(n, "creatorFeesPercentage") ? n.creatorFeesPercentage : void 0,
                affiliateFeesPercentage: (0, i.exists)(n, "affiliateFeesPercentage") ? n.affiliateFeesPercentage : void 0
            } : void 0
        }
    }

    function h(e) {
        var t;
        return null == (t = e) ? t : {
            rentalDays: (0, i.exists)(t, "rentalDays") ? t.rentalDays : void 0,
            priceInRobux: (0, i.exists)(t, "priceInRobux") ? t.priceInRobux : void 0
        }
    }

    function m(e) {
        var t, r, n, s, o, a, u, c, d, p, v, m, R;
        return null == (t = e) ? t : {
            id: (0, i.exists)(t, "id") ? t.id : void 0,
            marketplaceItemDetails: (0, i.exists)(t, "marketplaceItemDetails") ? null == (r = t.marketplaceItemDetails) ? r : {
                assetDetails: (0, i.exists)(r, "assetDetails") ? null == (n = r.assetDetails) ? n : {
                    assetType: (0, i.exists)(n, "assetType") ? n.assetType : void 0
                } : void 0,
                bundleDetails: (0, i.exists)(r, "bundleDetails") ? null == (s = r.bundleDetails) ? s : {
                    bundleType: (0, i.exists)(s, "bundleType") ? s.bundleType : void 0
                } : void 0
            } : void 0,
            createdTime: (0, i.exists)(t, "createdTime") ? new Date(t.createdTime) : void 0,
            name: (0, i.exists)(t, "name") ? t.name : void 0,
            description: (0, i.exists)(t, "description") ? t.description : void 0,
            creator: (0, i.exists)(t, "creator") ? null == (o = t.creator) ? o : {
                user: (0, i.exists)(o, "User") ? null == (a = o.User) ? a : {
                    userId: (0, i.exists)(a, "UserId") ? a.UserId : void 0
                } : void 0,
                group: (0, i.exists)(o, "Group") ? null == (u = o.Group) ? u : {
                    groupId: (0, i.exists)(u, "GroupId") ? u.GroupId : void 0
                } : void 0,
                kindCase: (0, i.exists)(o, "KindCase") ? o.KindCase : void 0
            } : void 0,
            moderationStatus: (0, i.exists)(t, "moderationStatus") ? t.moderationStatus : void 0,
            price: (0, i.exists)(t, "price") ? t.price : void 0,
            saleStatus: (0, i.exists)(t, "saleStatus") ? t.saleStatus : void 0,
            collectibleItemType: (0, i.exists)(t, "collectibleItemType") ? t.collectibleItemType : void 0,
            creationUniverseId: (0, i.exists)(t, "creationUniverseId") ? t.creationUniverseId : void 0,
            delistingStatus: (0, i.exists)(t, "delistingStatus") ? null == (c = t.delistingStatus) ? c : {
                target: (0, i.exists)(c, "Target") ? null == (d = c.Target) ? d : {
                    targetType: (0, i.exists)(d, "TargetType") ? d.TargetType : void 0,
                    id: (0, i.exists)(d, "Id") ? d.Id : void 0
                } : void 0,
                status: (0, i.exists)(c, "Status") ? c.Status : void 0
            } : void 0,
            scheduledRelease: (0, i.exists)(t, "scheduledRelease") ? null == (p = t.scheduledRelease) ? p : {
                onSaleTime: (0, i.exists)(p, "OnSaleTime") ? l(p.OnSaleTime) : void 0,
                offSaleTime: (0, i.exists)(p, "OffSaleTime") ? l(p.OffSaleTime) : void 0
            } : void 0,
            cannotBePublishedReason: (0, i.exists)(t, "cannotBePublishedReason") ? t.cannotBePublishedReason : void 0,
            dynamicPriceConfiguration: (0, i.exists)(t, "dynamicPriceConfiguration") ? null == (v = t.dynamicPriceConfiguration) ? v : {
                minimumPrice: (0, i.exists)(v, "MinimumPrice") ? v.MinimumPrice : void 0,
                priceOffset: (0, i.exists)(v, "PriceOffset") ? v.PriceOffset : void 0,
                isOptOutRegionalPricing: (0, i.exists)(v, "IsOptOutRegionalPricing") ? v.IsOptOutRegionalPricing : void 0
            } : void 0,
            isRentalOptIn: (0, i.exists)(t, "isRentalOptIn") ? t.isRentalOptIn : void 0,
            rentalOptions: (0, i.exists)(t, "rentalOptions") ? t.rentalOptions.map(h) : void 0,
            taxonomyDetails: (0, i.exists)(t, "taxonomyDetails") ? null == (m = t.taxonomyDetails) ? m : {
                dpfTaxonomyName: (0, i.exists)(m, "dpfTaxonomyName") ? m.dpfTaxonomyName : void 0,
                dpfTaxonomyId: (0, i.exists)(m, "dpfTaxonomyId") ? m.dpfTaxonomyId : void 0,
                dpfTaxonomyIsDefaultTaxonomy: (0, i.exists)(m, "dpfTaxonomyIsDefaultTaxonomy") ? m.dpfTaxonomyIsDefaultTaxonomy : void 0
            } : void 0,
            isHD: (0, i.exists)(t, "isHD") ? t.isHD : void 0,
            discoverabilityDetails: (0, i.exists)(t, "discoverabilityDetails") ? null == (R = t.discoverabilityDetails) ? R : {
                isDiscoverabilityReduced: (0, i.exists)(R, "isDiscoverabilityReduced") ? R.isDiscoverabilityReduced : void 0,
                isCoreContentGated: (0, i.exists)(R, "isCoreContentGated") ? R.isCoreContentGated : void 0
            } : void 0,
            isEmissive: (0, i.exists)(t, "isEmissive") ? t.isEmissive : void 0
        }
    }

    function R(e) {
        var t;
        return null == (t = e) ? t : {
            priceInRobux: (0, i.exists)(t, "priceInRobux") ? t.priceInRobux : void 0,
            countryIso2Code: (0, i.exists)(t, "countryIso2Code") ? t.countryIso2Code : void 0
        }
    }

    function f(e) {
        var t;
        return null == (t = e) ? t : {
            folderId: (0, i.exists)(t, "folderId") ? t.folderId : void 0,
            name: (0, i.exists)(t, "name") ? t.name : void 0,
            parentFolderId: (0, i.exists)(t, "parentFolderId") ? t.parentFolderId : void 0
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
            id: (0, i.exists)(t, "id") ? t.id : void 0,
            marketplaceItem: (0, i.exists)(t, "marketplaceItem") ? m(t.marketplaceItem) : void 0,
            folder: (0, i.exists)(t, "folder") ? f(t.folder) : void 0
        }
    }

    function I(e) {
        var t;
        return null == (t = e) ? t : {
            countryIso2Code: (0, i.exists)(t, "countryIso2Code") ? t.countryIso2Code : void 0,
            rentalPrices: (0, i.exists)(t, "rentalPrices") ? t.rentalPrices.map(h) : void 0
        }
    }

    function y(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, i.exists)(t, "id") ? t.id : void 0,
            name: (0, i.exists)(t, "name") ? t.name : void 0
        }
    }

    function w(e) {
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
    var P = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        T = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        B = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        U = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        M = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        C = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        };

    function N(e) {
        var t;
        return null == (t = e) ? t : {
            minimumQuantity: (0, i.exists)(t, "minimumQuantity") ? t.minimumQuantity : void 0,
            maximumQuantity: (0, i.exists)(t, "maximumQuantity") ? t.maximumQuantity : void 0,
            isEligibleForUpload: (0, i.exists)(t, "isEligibleForUpload") ? t.isEligibleForUpload : void 0,
            allowedFileExtensions: (0, i.exists)(t, "allowedFileExtensions") ? t.allowedFileExtensions : void 0
        }
    }

    function q(e) {
        var t, r;
        return null == (t = e) ? t : {
            allowedAssetTypeSettings: (0, i.exists)(t, "allowedAssetTypeSettings") ? (0, i.mapValues)(t.allowedAssetTypeSettings, N) : void 0,
            marketplaceFeePercentage: (0, i.exists)(t, "marketplaceFeePercentage") ? t.marketplaceFeePercentage : void 0,
            allowedPriceRange: (0, i.exists)(t, "allowedPriceRange") ? null == (r = t.allowedPriceRange) ? r : {
                minimumPrice: (0, i.exists)(r, "minimumPrice") ? r.minimumPrice : void 0,
                maximumPrice: (0, i.exists)(r, "maximumPrice") ? r.maximumPrice : void 0
            } : void 0
        }
    }

    function _(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, i.exists)(t, "id") ? t.id : void 0,
            name: (0, i.exists)(t, "name") ? t.name : void 0
        }
    }

    function x(e) {
        var t;
        return null == (t = e) ? t : {
            webStableId: (0, i.exists)(t, "webStableId") ? t.webStableId : void 0,
            name: (0, i.exists)(t, "name") ? t.name : void 0,
            isPublishable: (0, i.exists)(t, "isPublishable") ? t.isPublishable : void 0,
            assetTypeIds: (0, i.exists)(t, "assetTypeIds") ? t.assetTypeIds : void 0,
            bundleTypeIds: (0, i.exists)(t, "bundleTypeIds") ? t.bundleTypeIds : void 0,
            children: (0, i.exists)(t, "children") ? t.children.map(x) : void 0
        }
    }

    function A(e, t) {
        return null == e ? e : {
            id: (0, i.exists)(e, "id") ? e.id : void 0,
            creatorUserId: (0, i.exists)(e, "creatorUserId") ? e.creatorUserId : void 0,
            creatorGroupId: (0, i.exists)(e, "creatorGroupId") ? e.creatorGroupId : void 0,
            publishingType: (0, i.exists)(e, "publishingType") ? e.publishingType : void 0,
            saleLocationType: (0, i.exists)(e, "saleLocationType") ? e.saleLocationType : void 0,
            places: (0, i.exists)(e, "places") ? e.places : void 0,
            priceInRobux: (0, i.exists)(e, "priceInRobux") ? e.priceInRobux : void 0,
            priceOffset: (0, i.exists)(e, "priceOffset") ? e.priceOffset : void 0,
            isFree: (0, i.exists)(e, "isFree") ? e.isFree : void 0,
            enableRegionalPricing: (0, i.exists)(e, "enableRegionalPricing") ? e.enableRegionalPricing : void 0,
            isRentalOptIn: (0, i.exists)(e, "isRentalOptIn") ? e.isRentalOptIn : void 0,
            autoPublishEnabled: (0, i.exists)(e, "autoPublishEnabled") ? e.autoPublishEnabled : void 0,
            created: (0, i.exists)(e, "created") ? new Date(e.created) : void 0,
            updated: (0, i.exists)(e, "updated") ? new Date(e.updated) : void 0
        }
    }
    var G = i.BaseAPI;

    function F() {
        return null !== G && G.apply(this, arguments) || this
    }
    n(F, G), F.prototype.v1BundlesCreateContextPostRaw = function(e, t) {
        return s(this, void 0, void 0, function() {
            var r, n, s;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1BundlesCreateContextPost.");
                        return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/bundles/create-context",
                            schemaPath: "/v1/bundles/create-context",
                            method: "POST",
                            headers: n,
                            query: r,
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
                        return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                            return null == e ? e : {
                                operationId: (0, i.exists)(e, "operationId") ? e.operationId : void 0
                            }
                        })]
                }
            })
        })
    }, F.prototype.v1BundlesCreateContextPost = function(e, t) {
        return s(this, void 0, void 0, function() {
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
    }, F.prototype.v1BundlesMetadataGetRaw = function(e) {
        return s(this, void 0, void 0, function() {
            var t, r, n;
            return o(this, function(s) {
                switch (s.label) {
                    case 0:
                        return t = {}, r = {}, [4, this.request({
                            path: "/v1/bundles/metadata",
                            schemaPath: "/v1/bundles/metadata",
                            method: "GET",
                            headers: r,
                            query: t
                        }, e)];
                    case 1:
                        return n = s.sent(), [2, new i.JSONApiResponse(n, function(e) {
                            return null == e ? e : {
                                isBundlesControllerEnabled: (0, i.exists)(e, "isBundlesControllerEnabled") ? e.isBundlesControllerEnabled : void 0,
                                isBundlesCreationEnabled: (0, i.exists)(e, "isBundlesCreationEnabled") ? e.isBundlesCreationEnabled : void 0,
                                isBundlesPublishingEnabled: (0, i.exists)(e, "isBundlesPublishingEnabled") ? e.isBundlesPublishingEnabled : void 0,
                                allowedBundleTypeSettings: (0, i.exists)(e, "allowedBundleTypeSettings") ? (0, i.mapValues)(e.allowedBundleTypeSettings, q) : void 0,
                                isGroupBundlesUploadEnabled: (0, i.exists)(e, "isGroupBundlesUploadEnabled") ? e.isGroupBundlesUploadEnabled : void 0
                            }
                        })]
                }
            })
        })
    }, F.prototype.v1BundlesMetadataGet = function(e) {
        return s(this, void 0, void 0, function() {
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
    }, F.prototype.v1BundlesPostRaw = function(e, t) {
        return s(this, void 0, void 0, function() {
            var r, n, s;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1BundlesPost.");
                        return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/bundles",
                            schemaPath: "/v1/bundles",
                            method: "POST",
                            headers: n,
                            query: r,
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
                        return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                            return null == e ? e : {
                                creationStatusId: (0, i.exists)(e, "creationStatusId") ? e.creationStatusId : void 0
                            }
                        })]
                }
            })
        })
    }, F.prototype.v1BundlesPost = function(e, t) {
        return s(this, void 0, void 0, function() {
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
    }, F.prototype.v1BundlesStatusCreationStatusIdGetRaw = function(e, t) {
        return s(this, void 0, void 0, function() {
            var r, n, s;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        if (null === e.creationStatusId || void 0 === e.creationStatusId) throw new i.RequiredError("creationStatusId", "Required parameter requestParameters.creationStatusId was null or undefined when calling v1BundlesStatusCreationStatusIdGet.");
                        return r = {}, n = {}, [4, this.request({
                            path: "/v1/bundles/status/{creationStatusId}".replace("{".concat("creationStatusId", "}"), encodeURIComponent(String(e.creationStatusId))),
                            schemaPath: "/v1/bundles/status/{creationStatusId}",
                            method: "GET",
                            headers: n,
                            query: r
                        }, t)];
                    case 1:
                        return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                            return null == e ? e : {
                                bundleId: (0, i.exists)(e, "bundleId") ? e.bundleId : void 0,
                                status: (0, i.exists)(e, "status") ? e.status : void 0
                            }
                        })]
                }
            })
        })
    }, F.prototype.v1BundlesStatusCreationStatusIdGet = function(e, t) {
        return s(this, void 0, void 0, function() {
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
            return n(t, e), t.prototype.v1CollectiblesBulkUpdatePatchRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1CollectiblesBulkUpdatePatch.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles/bulk-update",
                                    schemaPath: "/v1/collectibles/bulk-update",
                                    method: "PATCH",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            idempotencyKey: e.idempotencyKey,
                                            groupId: e.groupId,
                                            updateTargets: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    assetType: e.assetType,
                                                    target: void 0 === e.target ? void 0 : e.target.map(w)
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
                                return s = o.sent(), [2, new i.VoidApiResponse(s)]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesBulkUpdatePatch = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesCheckItemConfigurationAccessGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.RequiredError("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1CollectiblesCheckItemConfigurationAccessGet.");
                                return r = {}, void 0 !== e.targetType && (r.TargetType = e.targetType), void 0 !== e.targetId && (r.TargetId = e.targetId), n = {}, [4, this.request({
                                    path: "/v1/collectibles/check-item-configuration-access",
                                    schemaPath: "/v1/collectibles/check-item-configuration-access",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        isAllowed: (0, i.exists)(e, "isAllowed") ? e.isAllowed : void 0,
                                        deniedReason: (0, i.exists)(e, "deniedReason") ? e.deniedReason : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCheckItemConfigurationAccessGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesCheckItemPublishAccessGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.RequiredError("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1CollectiblesCheckItemPublishAccessGet.");
                                if (null === e.publishingType || void 0 === e.publishingType) throw new i.RequiredError("publishingType", "Required parameter requestParameters.publishingType was null or undefined when calling v1CollectiblesCheckItemPublishAccessGet.");
                                return r = {}, void 0 !== e.targetType && (r.TargetType = e.targetType), void 0 !== e.targetId && (r.TargetId = e.targetId), void 0 !== e.publishingType && (r.PublishingType = e.publishingType), n = {}, [4, this.request({
                                    path: "/v1/collectibles/check-item-publish-access",
                                    schemaPath: "/v1/collectibles/check-item-publish-access",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        isAllowed: (0, i.exists)(e, "isAllowed") ? e.isAllowed : void 0,
                                        deniedReason: (0, i.exists)(e, "deniedReason") ? e.deniedReason : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCheckItemPublishAccessGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesCheckItemUploadAccessGet.");
                                return r = {}, void 0 !== e.targetType && (r.targetType = e.targetType), void 0 !== e.groupId && (r.groupId = e.groupId), n = {}, [4, this.request({
                                    path: "/v1/collectibles/check-item-upload-access",
                                    schemaPath: "/v1/collectibles/check-item-upload-access",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        isAllowed: (0, i.exists)(e, "isAllowed") ? e.isAllowed : void 0,
                                        deniedReason: (0, i.exists)(e, "deniedReason") ? e.deniedReason : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCheckItemUploadAccessGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.RequiredError("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesCollectibleItemIdPatch.");
                                if (null === e.updateCollectibleItemRequest || void 0 === e.updateCollectibleItemRequest) throw new i.RequiredError("updateCollectibleItemRequest", "Required parameter requestParameters.updateCollectibleItemRequest was null or undefined when calling v1CollectiblesCollectibleItemIdPatch.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles/{collectibleItemId}".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/{collectibleItemId}",
                                    method: "PATCH",
                                    headers: n,
                                    query: r,
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
                                return s = o.sent(), [2, new i.VoidApiResponse(s)]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdPatch = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.RequiredError("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesCollectibleItemIdRestockEligibilityGet.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/collectibles/{collectibleItemId}/restock-eligibility".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/{collectibleItemId}/restock-eligibility",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        isRestockingEnabled: (0, i.exists)(e, "isRestockingEnabled") ? e.isRestockingEnabled : void 0,
                                        isEligible: (0, i.exists)(e, "isEligible") ? e.isEligible : void 0,
                                        ineligibilityReason: (0, i.exists)(e, "ineligibilityReason") ? e.ineligibilityReason : void 0,
                                        hasBeenRestocked: (0, i.exists)(e, "hasBeenRestocked") ? e.hasBeenRestocked : void 0,
                                        totalRestockedQuantity: (0, i.exists)(e, "totalRestockedQuantity") ? e.totalRestockedQuantity : void 0,
                                        maxRestockQuantityPerOperation: (0, i.exists)(e, "maxRestockQuantityPerOperation") ? e.maxRestockQuantityPerOperation : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdRestockEligibilityGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.RequiredError("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesCollectibleItemIdRestockPost.");
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1CollectiblesCollectibleItemIdRestockPost.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles/{collectibleItemId}/restock".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/{collectibleItemId}/restock",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            newTotalQuantity: e.newTotalQuantity,
                                            agreedRestockingFee: e.agreedRestockingFee
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        newTotalQuantity: (0, i.exists)(e, "newTotalQuantity") ? e.newTotalQuantity : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdRestockPost = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.RequiredError("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesCollectibleItemIdRestockingFeesGet.");
                                if (null === e.additionalQuantity || void 0 === e.additionalQuantity) throw new i.RequiredError("additionalQuantity", "Required parameter requestParameters.additionalQuantity was null or undefined when calling v1CollectiblesCollectibleItemIdRestockingFeesGet.");
                                return r = {}, void 0 !== e.additionalQuantity && (r.additionalQuantity = e.additionalQuantity), n = {}, [4, this.request({
                                    path: "/v1/collectibles/{collectibleItemId}/restocking-fees".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/{collectibleItemId}/restocking-fees",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        restockingFeeInRobux: (0, i.exists)(e, "restockingFeeInRobux") ? e.restockingFeeInRobux : void 0,
                                        unitRestockingFeeInRobux: (0, i.exists)(e, "unitRestockingFeeInRobux") ? e.unitRestockingFeeInRobux : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdRestockingFeesGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.RequiredError("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesCollectibleItemIdSaleScheduleDelete.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/collectibles/{collectibleItemId}/sale-schedule".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/{collectibleItemId}/sale-schedule",
                                    method: "DELETE",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s)]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCollectibleItemIdSaleScheduleDelete = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var t, r, n;
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/collectibles/commission-rates",
                                    schemaPath: "/v1/collectibles/commission-rates",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, e)];
                            case 1:
                                return n = s.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        creatorFeesPercentage: (0, i.exists)(e, "creatorFeesPercentage") ? e.creatorFeesPercentage : void 0,
                                        marketplaceFeesPercentage: (0, i.exists)(e, "marketplaceFeesPercentage") ? e.marketplaceFeesPercentage : void 0,
                                        resellerFeesPercentage: (0, i.exists)(e, "resellerFeesPercentage") ? e.resellerFeesPercentage : void 0,
                                        sellerFeesPercentage: (0, i.exists)(e, "sellerFeesPercentage") ? e.sellerFeesPercentage : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesCommissionRatesGet = function(e) {
                return s(this, void 0, void 0, function() {
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
            }, t.prototype.v1CollectiblesFreeAvatarPatchRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1CollectiblesFreeAvatarPatch.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles/free-avatar",
                                    schemaPath: "/v1/collectibles/free-avatar",
                                    method: "PATCH",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            targetType: e.targetType,
                                            targetId: e.targetId,
                                            enabled: e.enabled,
                                            universeId: e.universeId
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        success: (0, i.exists)(e, "success") ? e.success : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesFreeAvatarPatch = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesFreeAvatarPatchRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesItemConfigurationCollectibleItemIdGetRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemId || void 0 === e.collectibleItemId) throw new i.RequiredError("collectibleItemId", "Required parameter requestParameters.collectibleItemId was null or undefined when calling v1CollectiblesItemConfigurationCollectibleItemIdGet.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/collectibles/item-configuration/{collectibleItemId}".replace("{".concat("collectibleItemId", "}"), encodeURIComponent(String(e.collectibleItemId))),
                                    schemaPath: "/v1/collectibles/item-configuration/{collectibleItemId}",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        dynamicPriceConfiguration: (0, i.exists)(e, "dynamicPriceConfiguration") ? null == (t = e.dynamicPriceConfiguration) ? t : {
                                            minimumPrice: (0, i.exists)(t, "minimumPrice") ? t.minimumPrice : void 0,
                                            priceOffset: (0, i.exists)(t, "priceOffset") ? t.priceOffset : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesItemConfigurationCollectibleItemIdGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesItemConfigurationCollectibleItemIdGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesMetadataGetRaw = function(e) {
                return s(this, void 0, void 0, function() {
                    var t, r, n;
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/collectibles/metadata",
                                    schemaPath: "/v1/collectibles/metadata",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, e)];
                            case 1:
                                return n = s.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        isCollectiblesControllerEnabled: (0, i.exists)(e, "isCollectiblesControllerEnabled") ? e.isCollectiblesControllerEnabled : void 0,
                                        isCollectiblesPublishingEnabled: (0, i.exists)(e, "isCollectiblesPublishingEnabled") ? e.isCollectiblesPublishingEnabled : void 0,
                                        isCollectiblesPublishingLocationTypeEnabled: (0, i.exists)(e, "isCollectiblesPublishingLocationTypeEnabled") ? e.isCollectiblesPublishingLocationTypeEnabled : void 0,
                                        allowedCollectibleSaleLocations: (0, i.exists)(e, "allowedCollectibleSaleLocations") ? e.allowedCollectibleSaleLocations : void 0,
                                        isCollectibleFreeItemPublishingAvailable: (0, i.exists)(e, "IsCollectibleFreeItemPublishingAvailable") ? e.IsCollectibleFreeItemPublishingAvailable : void 0,
                                        isCollectibleGroupPublishingAvailable: (0, i.exists)(e, "isCollectibleGroupPublishingAvailable") ? e.isCollectibleGroupPublishingAvailable : void 0,
                                        isCollectibleResaleRestrictionsEnabled: (0, i.exists)(e, "isCollectibleResaleRestrictionsEnabled") ? e.isCollectibleResaleRestrictionsEnabled : void 0,
                                        isCollectiblePublishMinQuantityEnabled: (0, i.exists)(e, "isCollectiblePublishMinQuantityEnabled") ? e.isCollectiblePublishMinQuantityEnabled : void 0,
                                        isUgc4AllUIEnabled: (0, i.exists)(e, "IsUgc4AllUIEnabled") ? e.IsUgc4AllUIEnabled : void 0,
                                        limitedMaxQuantity: (0, i.exists)(e, "LimitedMaxQuantity") ? e.LimitedMaxQuantity : void 0,
                                        isLimitedCollectibleBundlesPublishingEnabled: (0, i.exists)(e, "IsLimitedCollectibleBundlesPublishingEnabled") ? e.IsLimitedCollectibleBundlesPublishingEnabled : void 0,
                                        isResellabilityEnabled: (0, i.exists)(e, "IsResellabilityEnabled") ? e.IsResellabilityEnabled : void 0,
                                        isNewBundleUIEnabled: (0, i.exists)(e, "IsNewBundleUIEnabled") ? e.IsNewBundleUIEnabled : void 0,
                                        isCollectible2DPublishingEnabled: (0, i.exists)(e, "IsCollectible2DPublishingEnabled") ? e.IsCollectible2DPublishingEnabled : void 0,
                                        isAvatarCreationTokensUIEnabled: (0, i.exists)(e, "IsAvatarCreationTokensUIEnabled") ? e.IsAvatarCreationTokensUIEnabled : void 0,
                                        isScheduledPublishingEnabled: (0, i.exists)(e, "IsScheduledPublishingEnabled") ? e.IsScheduledPublishingEnabled : void 0,
                                        scheduledPublishingSettings: (0, i.exists)(e, "ScheduledPublishingSettings") ? null == (t = e.ScheduledPublishingSettings) ? t : {
                                            scheduledPublishMaxTimeInAdvanceTimeSpan: (0, i.exists)(t, "scheduledPublishMaxTimeInAdvanceTimeSpan") ? t.scheduledPublishMaxTimeInAdvanceTimeSpan : void 0,
                                            scheduledPublishMinDurationTimeSpan: (0, i.exists)(t, "scheduledPublishMinDurationTimeSpan") ? t.scheduledPublishMinDurationTimeSpan : void 0
                                        } : void 0,
                                        isGetPriceFloorEnabled: (0, i.exists)(e, "isGetPriceFloorEnabled") ? e.isGetPriceFloorEnabled : void 0,
                                        isRegionalPricingEnabled: (0, i.exists)(e, "isRegionalPricingEnabled") ? e.isRegionalPricingEnabled : void 0,
                                        isRevenueSplitEnabled: (0, i.exists)(e, "isRevenueSplitEnabled") ? e.isRevenueSplitEnabled : void 0,
                                        revenueSplitTiersForPurchase: (0, i.exists)(e, "revenueSplitTiersForPurchase") ? e.revenueSplitTiersForPurchase.map(p) : void 0,
                                        isContentMetadataAppealEnabled: (0, i.exists)(e, "isContentMetadataAppealEnabled") ? e.isContentMetadataAppealEnabled : void 0,
                                        bodysuitEligibleAssetTypes: (0, i.exists)(e, "bodysuitEligibleAssetTypes") ? e.bodysuitEligibleAssetTypes : void 0,
                                        unifyConfigureUI: (0, i.exists)(e, "unifyConfigureUI") ? e.unifyConfigureUI : void 0,
                                        maxCollectiblePrice: (0, i.exists)(e, "MaxCollectiblePrice") ? e.MaxCollectiblePrice : void 0,
                                        isFreeAvatarSystemEnabled: (0, i.exists)(e, "IsFreeAvatarSystemEnabled") ? e.IsFreeAvatarSystemEnabled : void 0,
                                        showAvatarLooksInCreations: (0, i.exists)(e, "ShowAvatarLooksInCreations") ? e.ShowAvatarLooksInCreations : void 0,
                                        isRestockingEnabled: (0, i.exists)(e, "isRestockingEnabled") ? e.isRestockingEnabled : void 0,
                                        restockResaleLockDurationSeconds: (0, i.exists)(e, "restockResaleLockDurationSeconds") ? e.restockResaleLockDurationSeconds : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesMetadataGet = function(e) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1CollectiblesPost.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles",
                                    schemaPath: "/v1/collectibles",
                                    method: "POST",
                                    headers: n,
                                    query: r,
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
                                            offSaleTime: void 0 === e.offSaleTime ? void 0 : e.offSaleTime.toISOString()
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        status: (0, i.exists)(e, "status") ? e.status : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesPost = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesPriceFloorGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.RequiredError("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1CollectiblesPriceFloorGet.");
                                if (null === e.publishingType || void 0 === e.publishingType) throw new i.RequiredError("publishingType", "Required parameter requestParameters.publishingType was null or undefined when calling v1CollectiblesPriceFloorGet.");
                                return r = {}, void 0 !== e.targetType && (r.TargetType = e.targetType), void 0 !== e.targetId && (r.TargetId = e.targetId), void 0 !== e.publishingType && (r.PublishingType = e.publishingType), n = {}, [4, this.request({
                                    path: "/v1/collectibles/price-floor",
                                    schemaPath: "/v1/collectibles/price-floor",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        priceFloorInRobux: (0, i.exists)(e, "priceFloorInRobux") ? e.priceFloorInRobux : void 0,
                                        displayName: (0, i.exists)(e, "displayName") ? e.displayName : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesPriceFloorGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.targetID || void 0 === e.targetID) throw new i.RequiredError("targetID", "Required parameter requestParameters.targetID was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.quantity || void 0 === e.quantity) throw new i.RequiredError("quantity", "Required parameter requestParameters.quantity was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.saleLocation || void 0 === e.saleLocation) throw new i.RequiredError("saleLocation", "Required parameter requestParameters.saleLocation was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.resaleRestriction || void 0 === e.resaleRestriction) throw new i.RequiredError("resaleRestriction", "Required parameter requestParameters.resaleRestriction was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.isFree || void 0 === e.isFree) throw new i.RequiredError("isFree", "Required parameter requestParameters.isFree was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                if (null === e.publishingType || void 0 === e.publishingType) throw new i.RequiredError("publishingType", "Required parameter requestParameters.publishingType was null or undefined when calling v1CollectiblesPublishingFeesGet.");
                                return r = {}, void 0 !== e.targetType && (r.TargetType = e.targetType), void 0 !== e.targetID && (r.TargetID = e.targetID), void 0 !== e.quantity && (r.Quantity = e.quantity), void 0 !== e.saleLocation && (r.SaleLocation = e.saleLocation), void 0 !== e.resaleRestriction && (r.ResaleRestriction = e.resaleRestriction), void 0 !== e.isFree && (r.IsFree = e.isFree), void 0 !== e.publishingType && (r.PublishingType = e.publishingType), n = {}, [4, this.request({
                                    path: "/v1/collectibles/publishing-fees",
                                    schemaPath: "/v1/collectibles/publishing-fees",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        publishingFeeInRobux: (0, i.exists)(e, "publishingFeeInRobux") ? e.publishingFeeInRobux : void 0,
                                        unitPublishingFeeInRobux: (0, i.exists)(e, "unitPublishingFeeInRobux") ? e.unitPublishingFeeInRobux : void 0,
                                        isDynamicFeeEnabled: (0, i.exists)(e, "isDynamicFeeEnabled") ? e.isDynamicFeeEnabled : void 0,
                                        publishingFeeType: (0, i.exists)(e, "publishingFeeType") ? e.publishingFeeType : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesPublishingFeesGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesRegionalPricingPreviewGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.RequiredError("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1CollectiblesRegionalPricingPreviewGet.");
                                if (null === e.publishingType || void 0 === e.publishingType) throw new i.RequiredError("publishingType", "Required parameter requestParameters.publishingType was null or undefined when calling v1CollectiblesRegionalPricingPreviewGet.");
                                if (null === e.minimumPrice || void 0 === e.minimumPrice) throw new i.RequiredError("minimumPrice", "Required parameter requestParameters.minimumPrice was null or undefined when calling v1CollectiblesRegionalPricingPreviewGet.");
                                if (null === e.priceOffset || void 0 === e.priceOffset) throw new i.RequiredError("priceOffset", "Required parameter requestParameters.priceOffset was null or undefined when calling v1CollectiblesRegionalPricingPreviewGet.");
                                return r = {}, void 0 !== e.targetType && (r.TargetType = e.targetType), void 0 !== e.targetId && (r.TargetId = e.targetId), void 0 !== e.publishingType && (r.PublishingType = e.publishingType), void 0 !== e.minimumPrice && (r.MinimumPrice = e.minimumPrice), void 0 !== e.priceOffset && (r.PriceOffset = e.priceOffset), n = {}, [4, this.request({
                                    path: "/v1/collectibles/regional-pricing/preview",
                                    schemaPath: "/v1/collectibles/regional-pricing/preview",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        regionalPrices: (0, i.exists)(e, "regionalPrices") ? e.regionalPrices.map(R) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRegionalPricingPreviewGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var t, r, n;
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/collectibles/regional-pricing/representative-countries",
                                    schemaPath: "/v1/collectibles/regional-pricing/representative-countries",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, e)];
                            case 1:
                                return n = s.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        countryIso2Codes: (0, i.exists)(e, "countryIso2Codes") ? e.countryIso2Codes : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRegionalPricingRepresentativeCountriesGet = function(e) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.RequiredError("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                if (null === e.publishingType || void 0 === e.publishingType) throw new i.RequiredError("publishingType", "Required parameter requestParameters.publishingType was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                if (null === e.minimumPrice || void 0 === e.minimumPrice) throw new i.RequiredError("minimumPrice", "Required parameter requestParameters.minimumPrice was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                if (null === e.priceOffset || void 0 === e.priceOffset) throw new i.RequiredError("priceOffset", "Required parameter requestParameters.priceOffset was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                if (null === e.includeRegionalPricing || void 0 === e.includeRegionalPricing) throw new i.RequiredError("includeRegionalPricing", "Required parameter requestParameters.includeRegionalPricing was null or undefined when calling v1CollectiblesRentalPricingPreviewGet.");
                                return r = {}, void 0 !== e.targetType && (r.TargetType = e.targetType), void 0 !== e.targetId && (r.TargetId = e.targetId), void 0 !== e.publishingType && (r.PublishingType = e.publishingType), void 0 !== e.minimumPrice && (r.MinimumPrice = e.minimumPrice), void 0 !== e.priceOffset && (r.PriceOffset = e.priceOffset), void 0 !== e.includeRegionalPricing && (r.IncludeRegionalPricing = e.includeRegionalPricing), n = {}, [4, this.request({
                                    path: "/v1/collectibles/rental-pricing/preview",
                                    schemaPath: "/v1/collectibles/rental-pricing/preview",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        rentalPrices: (0, i.exists)(e, "rentalPrices") ? e.rentalPrices.map(h) : void 0,
                                        regionalRentalPrices: (0, i.exists)(e, "regionalRentalPrices") ? e.regionalRentalPrices.map(I) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRentalPricingPreviewGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                if (null === e.targetID || void 0 === e.targetID) throw new i.RequiredError("targetID", "Required parameter requestParameters.targetID was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                if (null === e.collectibleItemType || void 0 === e.collectibleItemType) throw new i.RequiredError("collectibleItemType", "Required parameter requestParameters.collectibleItemType was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                if (null === e.minimumPrice || void 0 === e.minimumPrice) throw new i.RequiredError("minimumPrice", "Required parameter requestParameters.minimumPrice was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                if (null === e.priceOffset || void 0 === e.priceOffset) throw new i.RequiredError("priceOffset", "Required parameter requestParameters.priceOffset was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                if (null === e.purchasePlatform || void 0 === e.purchasePlatform) throw new i.RequiredError("purchasePlatform", "Required parameter requestParameters.purchasePlatform was null or undefined when calling v1CollectiblesRevenueSplitGet.");
                                return r = {}, void 0 !== e.targetType && (r.TargetType = e.targetType), void 0 !== e.targetID && (r.TargetID = e.targetID), void 0 !== e.collectibleItemType && (r.CollectibleItemType = e.collectibleItemType), void 0 !== e.minimumPrice && (r.MinimumPrice = e.minimumPrice), void 0 !== e.priceOffset && (r.PriceOffset = e.priceOffset), void 0 !== e.purchasePlatform && (r.PurchasePlatform = e.purchasePlatform), n = {}, [4, this.request({
                                    path: "/v1/collectibles/revenue-split",
                                    schemaPath: "/v1/collectibles/revenue-split",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        revenueSplit: (0, i.exists)(e, "RevenueSplit") ? d(e.RevenueSplit) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesRevenueSplitGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
            }, t.prototype.v1CollectiblesTargetTypeIdGetRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1CollectiblesTargetTypeIdGet.");
                                if (null === e.id || void 0 === e.id) throw new i.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling v1CollectiblesTargetTypeIdGet.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/collectibles/{targetType}/{id}".replace("{".concat("targetType", "}"), encodeURIComponent(String(e.targetType))).replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/collectibles/{targetType}/{id}",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        collectibleItemId: (0, i.exists)(e, "collectibleItemId") ? e.collectibleItemId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesTargetTypeIdGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return o(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.v1CollectiblesTargetTypeIdGetRaw(e, t)];
                            case 1:
                                return [4, i.sent().value()];
                            case 2:
                                return [2, i.sent()]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesUpdateItemDisplayInformationPatchRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1CollectiblesUpdateItemDisplayInformationPatch.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/collectibles/update-item-display-information",
                                    schemaPath: "/v1/collectibles/update-item-display-information",
                                    method: "PATCH",
                                    headers: n,
                                    query: r,
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
                                return s = o.sent(), [2, new i.JSONApiResponse(s)]
                        }
                    })
                })
            }, t.prototype.v1CollectiblesUpdateItemDisplayInformationPatch = function(e, t) {
                return s(this, void 0, void 0, function() {
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
        }(i.BaseAPI),
        k = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        O = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        D = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        L = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        J = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        V = {
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
        H = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        K = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1ContentMetadataAppealPostRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ContentMetadataAppealPost.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/content-metadata/appeal",
                                    schemaPath: "/v1/content-metadata/appeal",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            targetType: e.targetType,
                                            targetId: e.targetId,
                                            appealType: e.appealType
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        success: (0, i.exists)(e, "success") ? e.success : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ContentMetadataAppealPost = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1ContentMetadataAppealStatusGet.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.RequiredError("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1ContentMetadataAppealStatusGet.");
                                if (null === e.appealType || void 0 === e.appealType) throw new i.RequiredError("appealType", "Required parameter requestParameters.appealType was null or undefined when calling v1ContentMetadataAppealStatusGet.");
                                return r = {}, void 0 !== e.targetType && (r.TargetType = e.targetType), void 0 !== e.targetId && (r.TargetId = e.targetId), void 0 !== e.appealType && (r.AppealType = e.appealType), n = {}, [4, this.request({
                                    path: "/v1/content-metadata/appeal-status",
                                    schemaPath: "/v1/content-metadata/appeal-status",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        appealStatus: (0, i.exists)(e, "appealStatus") ? e.appealStatus : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ContentMetadataAppealStatusGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
            }, t
        }(i.BaseAPI),
        z = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1DelistItemPostRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.targetType || void 0 === e.targetType) throw new i.RequiredError("targetType", "Required parameter requestParameters.targetType was null or undefined when calling v1DelistItemPost.");
                                if (null === e.targetId || void 0 === e.targetId) throw new i.RequiredError("targetId", "Required parameter requestParameters.targetId was null or undefined when calling v1DelistItemPost.");
                                return r = {}, void 0 !== e.targetType && (r.TargetType = e.targetType), void 0 !== e.targetId && (r.TargetId = e.targetId), n = {}, [4, this.request({
                                    path: "/v1/delist-item",
                                    schemaPath: "/v1/delist-item",
                                    method: "POST",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s)]
                        }
                    })
                })
            }, t.prototype.v1DelistItemPost = function(e, t) {
                return s(this, void 0, void 0, function() {
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
        }(i.BaseAPI),
        W = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2,
            NUMBER_3: 3
        },
        X = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1FoldersFolderIdDeleteRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.RequiredError("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdDelete.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/folders/{folderId}".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}",
                                    method: "DELETE",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.VoidApiResponse(s)]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdDelete = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.RequiredError("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdGet.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/folders/{folderId}".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.RequiredError("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdItemsDelete.");
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1FoldersFolderIdItemsDelete.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/folders/{folderId}/items".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}/items",
                                    method: "DELETE",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            items: void 0 === e.items ? void 0 : e.items.map(b)
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.VoidApiResponse(s)]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdItemsDelete = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.RequiredError("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdItemsGet.");
                                return r = {}, void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/folders/{folderId}/items".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}/items",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        items: (0, i.exists)(e, "items") ? e.items.map(g) : void 0,
                                        nextCursor: (0, i.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                        prevCursor: (0, i.exists)(e, "prevCursor") ? e.prevCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdItemsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.RequiredError("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdItemsPost.");
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1FoldersFolderIdItemsPost.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/folders/{folderId}/items".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}/items",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            items: void 0 === e.items ? void 0 : e.items.map(b)
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.VoidApiResponse(s)]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdItemsPost = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.folderId || void 0 === e.folderId) throw new i.RequiredError("folderId", "Required parameter requestParameters.folderId was null or undefined when calling v1FoldersFolderIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1FoldersFolderIdPatch.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/folders/{folderId}".replace("{".concat("folderId", "}"), encodeURIComponent(String(e.folderId))),
                                    schemaPath: "/v1/folders/{folderId}",
                                    method: "PATCH",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.VoidApiResponse(s)]
                        }
                    })
                })
            }, t.prototype.v1FoldersFolderIdPatch = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return r = {}, void 0 !== e.groupId && (r.groupId = e.groupId), n = {}, [4, this.request({
                                    path: "/v1/folders",
                                    schemaPath: "/v1/folders",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        folders: (0, i.exists)(e, "folders") ? e.folders.map(f) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1FoldersGet = function() {
                return s(this, arguments, void 0, function(e, t) {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1FoldersPost.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/folders",
                                    schemaPath: "/v1/folders",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            parentFolderId: e.parentFolderId,
                                            groupId: e.groupId
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        folderId: (0, i.exists)(e, "folderId") ? e.folderId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1FoldersPost = function(e, t) {
                return s(this, void 0, void 0, function() {
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
        }(i.BaseAPI),
        Y = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1CreationsGetAssetDetailsPostRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1CreationsGetAssetDetailsPost.");
                                return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/creations/get-asset-details",
                                    schemaPath: "/v1/creations/get-asset-details",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            AssetIds: e.assetIds
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return e.map(u)
                                })]
                        }
                    })
                })
            }, t.prototype.v1CreationsGetAssetDetailsPost = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new i.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling v1CreationsGetAssetsGet.");
                                return r = {}, void 0 !== e.assetType && (r.assetType = e.assetType), void 0 !== e.isArchived && (r.isArchived = e.isArchived), void 0 !== e.groupId && (r.groupId = e.groupId), void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/creations/get-assets",
                                    schemaPath: "/v1/creations/get-assets",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, i.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, i.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, i.exists)(e, "data") ? e.data.map(c) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1CreationsGetAssetsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var t, r, n;
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/get-commission-rates",
                                    schemaPath: "/v1/get-commission-rates",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, e)];
                            case 1:
                                return n = s.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return e.map(v)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GetCommissionRatesGet = function(e) {
                return s(this, void 0, void 0, function() {
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
        }(i.BaseAPI),
        Z = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1ItemsByCreatorGetRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return r = {}, void 0 !== e.bundleType && (r.bundleType = e.bundleType), void 0 !== e.assetType && (r.assetType = e.assetType), void 0 !== e.cursor && (r.cursor = e.cursor), void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.groupId && (r.groupId = e.groupId), void 0 !== e.taxonomy && (r.taxonomy = e.taxonomy), n = {}, [4, this.request({
                                    path: "/v1/items/by-creator",
                                    schemaPath: "/v1/items/by-creator",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        items: (0, i.exists)(e, "items") ? e.items.map(m) : void 0,
                                        nextCursor: (0, i.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                        prevCursor: (0, i.exists)(e, "prevCursor") ? e.prevCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsByCreatorGet = function() {
                return s(this, arguments, void 0, function(e, t) {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.tokenId || void 0 === e.tokenId) throw new i.RequiredError("tokenId", "Required parameter requestParameters.tokenId was null or undefined when calling v1ItemsByTokenGet.");
                                if (null === e.limit || void 0 === e.limit) throw new i.RequiredError("limit", "Required parameter requestParameters.limit was null or undefined when calling v1ItemsByTokenGet.");
                                return r = {}, void 0 !== e.tokenId && (r.tokenId = e.tokenId), void 0 !== e.limit && (r.limit = e.limit), void 0 !== e.cursor && (r.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/items/by-token",
                                    schemaPath: "/v1/items/by-token",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        items: (0, i.exists)(e, "items") ? e.items.map(m) : void 0,
                                        nextCursor: (0, i.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                        prevCursor: (0, i.exists)(e, "prevCursor") ? e.prevCursor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsByTokenGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return r = {}, void 0 !== e.categoryDomain && (r.categoryDomain = e.categoryDomain), n = {}, [4, this.request({
                                    path: "/v1/items/categories",
                                    schemaPath: "/v1/items/categories",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        categoriesVersionId: (0, i.exists)(e, "categoriesVersionId") ? e.categoriesVersionId : void 0,
                                        categories: (0, i.exists)(e, "categories") ? e.categories.map(x) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsCategoriesGet = function() {
                return s(this, arguments, void 0, function(e, t) {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.itemType || void 0 === e.itemType) throw new i.RequiredError("itemType", "Required parameter requestParameters.itemType was null or undefined when calling v1ItemsGet.");
                                if (null === e.itemId || void 0 === e.itemId) throw new i.RequiredError("itemId", "Required parameter requestParameters.itemId was null or undefined when calling v1ItemsGet.");
                                return r = {}, void 0 !== e.itemType && (r.itemType = e.itemType), void 0 !== e.itemId && (r.itemId = e.itemId), n = {}, [4, this.request({
                                    path: "/v1/items",
                                    schemaPath: "/v1/items",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        item: (0, i.exists)(e, "item") ? m(e.item) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.collectibleItemType || void 0 === e.collectibleItemType) throw new i.RequiredError("collectibleItemType", "Required parameter requestParameters.collectibleItemType was null or undefined when calling v1ItemsPriceFloorGet.");
                                if (null === e.creationType || void 0 === e.creationType) throw new i.RequiredError("creationType", "Required parameter requestParameters.creationType was null or undefined when calling v1ItemsPriceFloorGet.");
                                if (null === e.isPbr || void 0 === e.isPbr) throw new i.RequiredError("isPbr", "Required parameter requestParameters.isPbr was null or undefined when calling v1ItemsPriceFloorGet.");
                                if (null === e.isBodysuit || void 0 === e.isBodysuit) throw new i.RequiredError("isBodysuit", "Required parameter requestParameters.isBodysuit was null or undefined when calling v1ItemsPriceFloorGet.");
                                if (null === e.isEmissive || void 0 === e.isEmissive) throw new i.RequiredError("isEmissive", "Required parameter requestParameters.isEmissive was null or undefined when calling v1ItemsPriceFloorGet.");
                                return r = {}, void 0 !== e.collectibleItemType && (r.collectibleItemType = e.collectibleItemType), void 0 !== e.creationType && (r.creationType = e.creationType), void 0 !== e.isPbr && (r.isPbr = e.isPbr), void 0 !== e.isBodysuit && (r.isBodysuit = e.isBodysuit), void 0 !== e.isEmissive && (r.isEmissive = e.isEmissive), void 0 !== e.assetType && (r.assetType = e.assetType), void 0 !== e.bundleType && (r.bundleType = e.bundleType), void 0 !== e.categoryId && (r.categoryId = e.categoryId), n = {}, [4, this.request({
                                    path: "/v1/items/price-floor",
                                    schemaPath: "/v1/items/price-floor",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        priceFloor: (0, i.exists)(e, "priceFloor") ? e.priceFloor : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsPriceFloorGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
            }, t.prototype.v1ItemsPriceFloorVariablesGetRaw = function(e) {
                return s(this, void 0, void 0, function() {
                    var t, r, n;
                    return o(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, r = {}, [4, this.request({
                                    path: "/v1/items/price-floor-variables",
                                    schemaPath: "/v1/items/price-floor-variables",
                                    method: "GET",
                                    headers: r,
                                    query: t
                                }, e)];
                            case 1:
                                return n = s.sent(), [2, new i.JSONApiResponse(n, function(e) {
                                    return null == e ? e : {
                                        assetTypes: (0, i.exists)(e, "assetTypes") ? e.assetTypes : void 0,
                                        bundleTypes: (0, i.exists)(e, "bundleTypes") ? e.bundleTypes : void 0,
                                        categories: (0, i.exists)(e, "categories") ? e.categories.map(_) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsPriceFloorVariablesGet = function(e) {
                return s(this, void 0, void 0, function() {
                    return o(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1ItemsPriceFloorVariablesGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1ItemsUploadFeeGetRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return r = {}, void 0 !== e.bundleType && (r.bundleType = e.bundleType), void 0 !== e.assetType && (r.assetType = e.assetType), n = {}, [4, this.request({
                                    path: "/v1/items/upload-fee",
                                    schemaPath: "/v1/items/upload-fee",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        canAfford: (0, i.exists)(e, "canAfford") ? e.canAfford : void 0,
                                        price: (0, i.exists)(e, "price") ? e.price : void 0,
                                        balance: (0, i.exists)(e, "balance") ? e.balance : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1ItemsUploadFeeGet = function() {
                return s(this, arguments, void 0, function(e, t) {
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
        }(i.BaseAPI),
        $ = {
            NUMBER_0: 0,
            NUMBER_1: 1,
            NUMBER_2: 2
        },
        ee = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1AssetTypesAssetTypeAgentsGetRaw = function(e, t) {
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new i.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling v1AssetTypesAssetTypeAgentsGet.");
                                if (null === e.actionType || void 0 === e.actionType) throw new i.RequiredError("actionType", "Required parameter requestParameters.actionType was null or undefined when calling v1AssetTypesAssetTypeAgentsGet.");
                                if (null === e.agentType || void 0 === e.agentType) throw new i.RequiredError("agentType", "Required parameter requestParameters.agentType was null or undefined when calling v1AssetTypesAssetTypeAgentsGet.");
                                return r = {}, void 0 !== e.actionType && (r.ActionType = e.actionType), void 0 !== e.agentType && (r.AgentType = e.agentType), n = {}, [4, this.request({
                                    path: "/v1/asset-types/{assetType}/agents".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/asset-types/{assetType}/agents",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        agents: (0, i.exists)(e, "agents") ? e.agents.map(a) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetTypesAssetTypeAgentsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.action || void 0 === e.action) throw new i.RequiredError("action", "Required parameter requestParameters.action was null or undefined when calling v1PermissionsActionAllowedForItemTypeGet.");
                                return r = {}, void 0 !== e.action && (r.action = e.action), void 0 !== e.groupId && (r.groupId = e.groupId), void 0 !== e.assetType && (r.assetType = e.assetType), void 0 !== e.bundleType && (r.bundleType = e.bundleType), void 0 !== e.lookType && (r.lookType = e.lookType), void 0 !== e.trustedCreatorCheck && (r.trustedCreatorCheck = e.trustedCreatorCheck), n = {}, [4, this.request({
                                    path: "/v1/permissions/action-allowed-for-item-type",
                                    schemaPath: "/v1/permissions/action-allowed-for-item-type",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        isActionAllowed: (0, i.exists)(e, "isActionAllowed") ? e.isActionAllowed : void 0,
                                        metadataPermissions: (0, i.exists)(e, "metadataPermissions") ? e.metadataPermissions : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PermissionsActionAllowedForItemTypeGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.action || void 0 === e.action) throw new i.RequiredError("action", "Required parameter requestParameters.action was null or undefined when calling v1PermissionsGroupsGet.");
                                return r = {}, void 0 !== e.action && (r.action = e.action), n = {}, [4, this.request({
                                    path: "/v1/permissions/groups",
                                    schemaPath: "/v1/permissions/groups",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        allowedGroups: (0, i.exists)(e, "allowedGroups") ? e.allowedGroups.map(y) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PermissionsGroupsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
                return s(this, void 0, void 0, function() {
                    var r, n, s;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.action || void 0 === e.action) throw new i.RequiredError("action", "Required parameter requestParameters.action was null or undefined when calling v1PermissionsItemTypesGet.");
                                if (null === e.targetTypes || void 0 === e.targetTypes) throw new i.RequiredError("targetTypes", "Required parameter requestParameters.targetTypes was null or undefined when calling v1PermissionsItemTypesGet.");
                                return r = {}, void 0 !== e.action && (r.action = e.action), e.targetTypes && (r.targetTypes = e.targetTypes), n = {}, [4, this.request({
                                    path: "/v1/permissions/item-types",
                                    schemaPath: "/v1/permissions/item-types",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, t)];
                            case 1:
                                return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        allowedAssetTypes: (0, i.exists)(e, "allowedAssetTypes") ? e.allowedAssetTypes : void 0,
                                        allowedBundleTypes: (0, i.exists)(e, "allowedBundleTypes") ? e.allowedBundleTypes : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PermissionsItemTypesGet = function(e, t) {
                return s(this, void 0, void 0, function() {
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
        }(i.BaseAPI);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(t, e), t.prototype.v1PreferencesPublishingDeleteRaw = function(e, t) {
            return s(this, void 0, void 0, function() {
                var r, n, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return r = {}, void 0 !== e.groupId && (r.groupId = e.groupId), n = {}, [4, this.request({
                                path: "/v1/preferences/publishing",
                                schemaPath: "/v1/preferences/publishing",
                                method: "DELETE",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new i.VoidApiResponse(s)]
                    }
                })
            })
        }, t.prototype.v1PreferencesPublishingDelete = function() {
            return s(this, arguments, void 0, function(e, t) {
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
            return s(this, void 0, void 0, function() {
                var r, n, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return r = {}, void 0 !== e.groupId && (r.groupId = e.groupId), n = {}, [4, this.request({
                                path: "/v1/preferences/publishing",
                                schemaPath: "/v1/preferences/publishing",
                                method: "GET",
                                headers: n,
                                query: r
                            }, t)];
                        case 1:
                            return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                return A(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1PreferencesPublishingGet = function() {
            return s(this, arguments, void 0, function(e, t) {
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
            return s(this, void 0, void 0, function() {
                var r, n, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PreferencesPublishingPatch.");
                            return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/preferences/publishing",
                                schemaPath: "/v1/preferences/publishing",
                                method: "PATCH",
                                headers: n,
                                query: r,
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
                            return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                return A(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1PreferencesPublishingPatch = function(e, t) {
            return s(this, void 0, void 0, function() {
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
            return s(this, void 0, void 0, function() {
                var r, n, s;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new i.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PreferencesPublishingPost.");
                            return r = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/preferences/publishing",
                                schemaPath: "/v1/preferences/publishing",
                                method: "POST",
                                headers: n,
                                query: r,
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
                            return s = o.sent(), [2, new i.JSONApiResponse(s, function(e) {
                                return A(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1PreferencesPublishingPost = function(e, t) {
            return s(this, void 0, void 0, function() {
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
        }
    })(i.BaseAPI), e.s(["CollectiblesApi", 0, S, "ContentMetadataApi", 0, K, "DelistingApi", 0, z, "FoldersApi", 0, X, "ItemApi", 0, Y, "MarketplaceItemApi", 0, Z, "PermissionsApi", 0, ee, "RobloxAvatarMarketplacePublishingAvatarMarketplacePublishingGatewayV1Beta1ItemDelistingStatusStatusEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "RobloxItemConfigurationApiAssetCreationsDetailsResponseStatusEnum", 0, {
        Unknown: "Unknown",
        ReviewPending: "ReviewPending",
        Moderated: "Moderated",
        ReviewApproved: "ReviewApproved",
        OnSale: "OnSale",
        OffSale: "OffSale",
        DelayedRelease: "DelayedRelease",
        Free: "Free"
    }, "RobloxItemConfigurationApiAssetDetailsAssetTypeEnum", 0, {
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
    }, "RobloxItemConfigurationApiBundleDetailsBundleTypeEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "RobloxItemConfigurationApiMarketplaceItemCannotBePublishedReasonEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5
    }, "RobloxItemConfigurationApiMarketplaceItemModerationStatusEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "RobloxItemConfigurationApiMarketplaceItemSaleStatusEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "RobloxItemConfigurationApiModelsFolderFolderItemItemTypeEnum", 0, {
        Unknown: "Unknown",
        Asset: "Asset",
        Bundle: "Bundle",
        IecToken: "IECToken",
        Folder: "Folder"
    }, "RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "RobloxItemConfigurationApiModelsRequestPublishCollectibleItemRequestPublishingTypeEnum", 0, T, "RobloxItemConfigurationApiModelsRequestPublishCollectibleItemRequestResaleRestrictionEnum", 0, B, "RobloxItemConfigurationApiModelsRequestPublishCollectibleItemRequestTargetTypeEnum", 0, P, "RobloxItemConfigurationApiModelsRequestUpdateCollectibleItemRequestResaleRestrictionEnum", 0, M, "RobloxItemConfigurationApiModelsRequestUpdateCollectibleItemRequestSaleStatusEnum", 0, U, "RobloxItemConfigurationApiModelsRequestUpdateItemDisplayInformationRequestTargetTypeEnum", 0, C, "RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum", 0, {
        Unknown: "Unknown",
        Body: "Body",
        DynamicHead: "DynamicHead",
        Shoes: "Shoes",
        AvatarAnimations: "AvatarAnimations"
    }, "RobloxItemConfigurationApiModelsResponseBundleBundleInfoModerationStatusEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4
    }, "V1CollectiblesCheckItemConfigurationAccessGetTargetTypeEnum", 0, k, "V1CollectiblesCheckItemPublishAccessGetPublishingTypeEnum", 0, D, "V1CollectiblesCheckItemPublishAccessGetTargetTypeEnum", 0, O, "V1CollectiblesPriceFloorGetPublishingTypeEnum", 0, J, "V1CollectiblesPriceFloorGetTargetTypeEnum", 0, L, "V1CollectiblesPublishingFeesGetPublishingTypeEnum", 0, j, "V1CollectiblesPublishingFeesGetResaleRestrictionEnum", 0, Q, "V1CollectiblesPublishingFeesGetTargetTypeEnum", 0, V, "V1CollectiblesTargetTypeIdGetTargetTypeEnum", 0, H, "V1CreationsGetAssetsGetLimitEnum", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }, "V1DelistItemPostTargetTypeEnum", 0, W, "V1ItemsByCreatorGetAssetTypeEnum", 0, {
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
    }, "V1ItemsCategoriesGetCategoryDomainEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3
    }, "V1ItemsGetItemTypeEnum", 0, $, "V1ItemsPriceFloorGetCollectibleItemTypeEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "V1ItemsPriceFloorGetCreationTypeEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2
    }, "V1PermissionsActionAllowedForItemTypeGetActionEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6
    }, "V1PermissionsActionAllowedForItemTypeGetAssetTypeEnum", 0, {
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
    }, "V1PermissionsItemTypesGetActionEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3,
        NUMBER_4: 4,
        NUMBER_5: 5,
        NUMBER_6: 6
    }, "V1PermissionsItemTypesGetTargetTypesEnum", 0, {
        NUMBER_0: 0,
        NUMBER_1: 1,
        NUMBER_2: 2,
        NUMBER_3: 3
    }], 536306);
    var et = e.i(272593);
    let ei = new class {
        checkItemConfigurationAccess(e, t) {
            let i = {
                targetType: e ? k.NUMBER_1 : k.NUMBER_0,
                targetId: t
            };
            return this.collectiblesApi.v1CollectiblesCheckItemConfigurationAccessGet(i)
        }
        checkItemPublishAccess(e, t, i) {
            let r = {
                targetType: e ? O.NUMBER_1 : O.NUMBER_0,
                targetId: t,
                publishingType: i ? D.NUMBER_1 : D.NUMBER_2
            };
            return this.collectiblesApi.v1CollectiblesCheckItemPublishAccessGet(r)
        }
        delistItem(e, t) {
            let i = {
                targetType: e ? W.NUMBER_1 : W.NUMBER_0,
                targetId: t
            };
            return this.delistingApi.v1DelistItemPost(i)
        }
        getCollectiblesMetadata() {
            return this.collectiblesApi.v1CollectiblesMetadataGet()
        }
        getDynamicPriceConfiguration(e) {
            return this.collectiblesApi.v1CollectiblesItemConfigurationCollectibleItemIdGet({
                collectibleItemId: e
            })
        }
        getCollectibleItemId(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                i = {
                    targetType: t ? H.NUMBER_1 : H.NUMBER_0,
                    id: e
                };
            return this.collectiblesApi.v1CollectiblesTargetTypeIdGet(i)
        }
        getCollectibleCommissionRates() {
            return this.collectiblesApi.v1CollectiblesCommissionRatesGet()
        }
        getCollectiblePublishingFees(e, t, i, r, n, s, o) {
            let l = {
                targetType: e ? V.NUMBER_1 : V.NUMBER_0,
                targetID: t,
                quantity: i,
                publishingType: 1 === r ? j.NUMBER_1 : j.NUMBER_2,
                saleLocation: n,
                resaleRestriction: s ? Q.NUMBER_1 : Q.NUMBER_2,
                isFree: o
            };
            return this.collectiblesApi.v1CollectiblesPublishingFeesGet(l)
        }
        getPriceFloor(e, t, i) {
            let r = {
                targetType: t ? L.NUMBER_1 : L.NUMBER_0,
                targetId: e,
                publishingType: i ? J.NUMBER_1 : J.NUMBER_2
            };
            return this.collectiblesApi.v1CollectiblesPriceFloorGet(r)
        }
        updateCollectibleItemDisplayInfo(e, t, i, r) {
            let n = {
                targetType: e ? C.NUMBER_1 : C.NUMBER_0,
                targetId: t.toString(),
                name: i,
                description: r
            };
            return this.collectiblesApi.v1CollectiblesUpdateItemDisplayInformationPatch({
                request: n
            })
        }
        bulkUpdateCollectible(e, t, i, r) {
            return this.collectiblesApi.v1CollectiblesBulkUpdatePatch({
                request: {
                    idempotencyKey: e,
                    groupId: t,
                    updateTargets: {
                        assetType: i
                    },
                    updatePayload: {
                        rentalOptIn: r
                    }
                }
            })
        }
        publishCollectible(e, t, i, r, n, s, o, l, a, u, c, d, p, v, h, m, R, f, b, g, I) {
            let y = {
                idempotencyToken: e,
                targetId: t,
                targetType: i ? P.NUMBER_1 : P.NUMBER_0,
                publishingType: r ? T.NUMBER_1 : T.NUMBER_2,
                agreedPublishingFee: n,
                creatorUserId: s,
                creatorGroupId: o,
                publisherUserId: l,
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
                isRentalOptIn: null != I && I
            };
            return this.collectiblesApi.v1CollectiblesPost({
                request: y
            })
        }
        updateCollectibleInformation(e, t, i, r, n, s, o, l, a, u, c, d) {
            let p = {
                saleLocationConfiguration: t,
                saleStatus: i ? U.NUMBER_0 : U.NUMBER_1,
                quantityLimitPerUser: r,
                resaleRestriction: n ? M.NUMBER_1 : M.NUMBER_2,
                priceInRobux: s,
                priceOffset: o,
                isFree: l,
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
        getCreations(e, t, i, r, n) {
            return this.itemConfigurationApi.v1CreationsGetAssetsGet({
                assetType: e,
                isArchived: t,
                groupId: i,
                limit: r,
                cursor: n
            })
        }
        getAllowedAssetTypes(e, t) {
            return this.permissionsApi.v1PermissionsItemTypesGet({
                action: e,
                targetTypes: t
            })
        }
        isActionAllowedForItemType(e, t, i, r, n) {
            return this.permissionsApi.v1PermissionsActionAllowedForItemTypeGet({
                action: e,
                groupId: t,
                assetType: i,
                bundleType: r,
                trustedCreatorCheck: n
            })
        }
        async getItemUploadFee(e, t) {
            return this.marketplaceItemApi.v1ItemsUploadFeeGet({
                assetType: e,
                bundleType: t
            })
        }
        async getPriceFloorVariables() {
            return this.marketplaceItemApi.v1ItemsPriceFloorVariablesGet()
        }
        async getPriceFloorFromVariables(e, t, i, r, n, s, o) {
            let l = arguments.length > 7 && void 0 !== arguments[7] && arguments[7];
            return this.marketplaceItemApi.v1ItemsPriceFloorGet({
                collectibleItemType: e,
                creationType: t,
                isPbr: i,
                isBodysuit: r,
                isEmissive: l,
                assetType: n,
                bundleType: s,
                categoryId: o
            })
        }
        getItem(e, t) {
            let i = {
                itemType: e ? $.NUMBER_1 : $.NUMBER_0,
                itemId: t
            };
            return this.marketplaceItemApi.v1ItemsGet(i)
        }
        getItemsByCreator(e, t, i, r, n, s) {
            return this.marketplaceItemApi.v1ItemsByCreatorGet({
                limit: e,
                cursor: t,
                groupId: i,
                bundleType: r,
                assetType: n,
                taxonomy: s
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
        getRegionalPricingPreview(e, t, i, r, n) {
            let s = {
                targetType: e ? k.NUMBER_1 : k.NUMBER_0,
                targetId: t,
                publishingType: i ? j.NUMBER_1 : j.NUMBER_2,
                minimumPrice: r,
                priceOffset: n
            };
            return this.collectiblesApi.v1CollectiblesRegionalPricingPreviewGet(s)
        }
        getRentalPricingPreview(e, t, i, r, n, s) {
            let o = {
                targetType: e ? k.NUMBER_1 : k.NUMBER_0,
                targetId: t,
                publishingType: i ? j.NUMBER_1 : j.NUMBER_2,
                minimumPrice: r,
                priceOffset: n,
                includeRegionalPricing: s
            };
            return this.collectiblesApi.v1CollectiblesRentalPricingPreviewGet(o)
        }
        getRevenueSplit(e, t, i, r, n, s) {
            let o = {
                targetType: e ? k.NUMBER_1 : k.NUMBER_0,
                targetID: t,
                collectibleItemType: i ? j.NUMBER_1 : j.NUMBER_2,
                minimumPrice: r,
                priceOffset: n,
                purchasePlatform: s
            };
            return this.collectiblesApi.v1CollectiblesRevenueSplitGet(o)
        }
        getContentMetadataAppealStatus(e, t, i) {
            return this.contentMetadataApi.v1ContentMetadataAppealStatusGet({
                targetType: e,
                targetId: t,
                appealType: i
            })
        }
        createContentMetadataAppeal(e) {
            return this.contentMetadataApi.v1ContentMetadataAppealPost({
                request: e
            })
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
            let r = {
                items: e.map(e => ({
                    id: e,
                    itemType: t
                }))
            };
            return this.foldersApi.v1FoldersFolderIdItemsPost({
                folderId: i,
                request: r
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
        constructor() {
            (0, t._)(this, "collectiblesApi", void 0), (0, t._)(this, "delistingApi", void 0), (0, t._)(this, "itemConfigurationApi", void 0), (0, t._)(this, "marketplaceItemApi", void 0), (0, t._)(this, "permissionsApi", void 0), (0, t._)(this, "contentMetadataApi", void 0), (0, t._)(this, "foldersApi", void 0);
            const e = (0, et.createClientConfiguration)("itemconfiguration", "bedev1");
            this.collectiblesApi = new S(e), this.delistingApi = new z(e), this.itemConfigurationApi = new Y(e), this.marketplaceItemApi = new Z(e), this.permissionsApi = new ee(e), this.contentMetadataApi = new K(e), this.foldersApi = new X(e)
        }
    };
    e.s(["default", 0, ei], 913893)
}]);

//# debugId=82bdab37-7f9a-4767-0503-84e323a7d7c0
//# sourceMappingURL=3y8gio5yfom6i.js.map