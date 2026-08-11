! function() {
    "use strict";
    var e, t = {
            n: function(e) {
                var n = e && e.__esModule ? function() {
                    return e.default
                } : function() {
                    return e
                };
                return t.d(n, {
                    a: n
                }), n
            },
            d: function(e, n) {
                for (var a in n) t.o(n, a) && !t.o(e, a) && Object.defineProperty(e, a, {
                    enumerable: !0,
                    get: n[a]
                })
            },
            o: function(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            }
        },
        n = React,
        a = t.n(n),
        r = CoreUtilities,
        l = ReactDOM,
        i = ReactStyleGuide,
        c = HeaderScripts,
        o = ReactUtilities,
        s = Roblox,
        u = {
            common: [""],
            feature: "Feature.Catalog"
        };
    ! function(e) {
        e[e.INVALID = 0] = "INVALID", e[e.NONE = 1] = "NONE", e[e.DISABLED = 2] = "DISABLED"
    }(e || (e = {}));
    var m, d = e,
        f = (0, o.withTranslations)((function(e) {
            var t = e.collectibleItemData,
                n = e.resaleRestriction,
                r = (e.isLimited2, e.onResaleButtonClicked),
                l = e.translate,
                i = function() {
                    return t.isInHolding ? m.holding : t.price ? m.onSale : m.offSale
                },
                o = i();
            return a().createElement("div", {
                className: "resale-button",
                id: function() {
                    switch (o) {
                        case m.onSale:
                            return "take-off-sale";
                        case m.offSale:
                            return "sell";
                        case m.holding:
                            return "holding";
                        default:
                            return "sell"
                    }
                }()
            }, n !== d.DISABLED && a().createElement("button", {
                type: "button",
                className: "btn-min-width btn-buy-md",
                onClick: function(e) {
                    e.currentTarget.blur(), r(t, i())
                },
                disabled: !c.authenticatedUser.isPremiumUser || o === m.holding
            }, function() {
                switch (o) {
                    case m.onSale:
                        return l("Heading.TakeOffSale");
                    case m.offSale:
                        return l("Action.Sell");
                    case m.holding:
                        return l("Label.Holding");
                    default:
                        return l("Action.Sell")
                }
            }()))
        }), u),
        p = (0, o.withTranslations)((function(e) {
            var t = e.collectibleItemData,
                n = e.resaleRestriction,
                l = e.itemName,
                i = e.isLimited2,
                c = e.isFirstItem,
                o = e.onButtonAction,
                s = e.translate,
                u = t.serialNumber ? "#" + t.serialNumber : l;
            return a().createElement("div", {
                className: "item-details-limited-inventory-row"
            }, a().createElement("span", {
                className: "item-info"
            }, a().createElement("span", {
                className: "collectible-serial-number font-header-2"
            }, u), a().createElement("span", {
                className: "buy-price font-caption-body text"
            }, void 0 !== t.buyPrice && a().createElement("span", null, s("Label.BuyPrice"), a().createElement("span", {
                className: "icon-robux-16x16"
            }), a().createElement("span", {
                className: "text-robux"
            }, r.numberFormat.getNumberFormat(t.buyPrice))), void 0 !== t.buyPrice && void 0 !== t.price && a().createElement("span", {
                className: "on-sale-tag-divider-container"
            }, a().createElement("div", {
                className: "on-sale-tag-divider"
            })), void 0 !== t.price && a().createElement(a().Fragment, null, a().createElement("span", {
                className: "on-sale-tag"
            }, s("Label.OnSale")), a().createElement("span", {
                className: "on-sale-tag-divider-container"
            }, a().createElement("div", {
                className: "on-sale-tag-divider"
            })), a().createElement("span", null, s("Label.SalePrice"), a().createElement("span", {
                className: "icon-robux-16x16"
            }), a().createElement("span", {
                className: "text-robux"
            }, r.numberFormat.getNumberFormat(t.price)))))), a().createElement("span", {
                className: "sale-status"
            }, a().createElement(f, {
                collectibleItemData: t,
                isLimited2: i,
                onResaleButtonClicked: function(e, t) {
                    o(e, t)
                },
                resaleRestriction: n
            })), !c && a().createElement("div", {
                className: "dividing-line"
            }))
        }), u),
        b = {
            itemTypeConstants: {
                asset: "asset",
                bundle: "bundle"
            },
            batchBuyPurchaseResults: {
                success: "Success",
                alreadyOwned: "AlreadyOwned",
                insufficientFunds: "InsufficientFunds",
                exceptionOccured: "ExceptionOccurred",
                tooManyPurchases: "TooManyPurchases"
            },
            limited: "Limited",
            numberOfItemsToRecommend: 5,
            itemDetailsLimitedInventoryEventName: "item-details-limited-inventory:render",
            itemDetailsLimitedInventoryElementName: "item-details-limited-inventory-container",
            marketplaceFeePercentage: .3,
            robloxCreatedlimited2MarketplaceFeePercentage: .3,
            limited2MarketplaceFeePercentage: .5,
            marketplaceFeeMinimum: 1
        },
        v = {
            assetRootUrlTemplate: "catalog",
            bundleRootUrlTemplate: "bundles",
            getRecommendations: {
                url: s.EnvironmentUrls.catalogApi + "/v2/recommendations/complement-assets",
                retryable: !0,
                withCredentials: !0
            },
            postItemDetails: {
                url: s.EnvironmentUrls.catalogApi + "/v1/catalog/items/details",
                retryable: !0,
                withCredentials: !0
            },
            getItemOwnershipUrl: function(e, t, n) {
                return s.EnvironmentUrls.inventoryApi + "/v1/users/" + e + "/items/" + t + "/" + n + "/is-owned"
            },
            getLimited1CopiesOwned: function(e, t) {
                return s.EnvironmentUrls.economyApi + "/v1/assets/" + t + "/users/" + e + "/resellable-copies"
            },
            placeLimited1ItemOnSale: function(e, t) {
                return s.EnvironmentUrls.economyApi + "/v1/assets/" + e + "/resellable-copies/" + t
            },
            getLimited2CopiesOwned: function(e, t, n, a) {
                return s.EnvironmentUrls.apiGatewayUrl + "/marketplace-sales/v1/item/" + t + "/resellable-instances?cursor=" + (a || "") + "&ownerType=User&ownerId=" + e + "&limit=" + n
            },
            placeLimited2ItemOnSale: function(e, t) {
                return s.EnvironmentUrls.apiGatewayUrl + "/marketplace-sales/v1/item/" + e + "/instance/" + t + "/resale"
            },
            getLimited2ResaleParameters: function(e) {
                return s.EnvironmentUrls.apiGatewayUrl + "/marketplace-sales/v1/item/" + e + "/get-resale-parameters"
            }
        },
        h = function(e, t) {
            var n = {
                url: v.getLimited1CopiesOwned(e, t),
                retryable: !0,
                withCredentials: !0
            };
            return r.httpService.get(n)
        },
        y = function(e, t, n, a) {
            var l = {
                url: v.getLimited2CopiesOwned(e, t, n, a),
                retryable: !0,
                withCredentials: !0
            };
            return r.httpService.get(l)
        },
        E = function(e, t, n) {
            var a, l = {
                url: v.placeLimited1ItemOnSale(e, t),
                retryable: !0,
                withCredentials: !0
            };
            return a = void 0 !== n ? {
                price: n
            } : {}, r.httpService.patch(l, a)
        },
        g = function(e, t, n, a, l, i) {
            var c, o;
            return t && n && a && (c = {
                url: v.placeLimited2ItemOnSale(t, n),
                retryable: !0,
                withCredentials: !0
            }, o = {
                price: i,
                isOnSale: l,
                sellerId: e,
                sellerType: "User",
                collectibleProductId: a
            }), r.httpService.patch(c, o)
        },
        N = function(e) {
            var t = {
                url: v.getLimited2ResaleParameters(e),
                retryable: !0,
                withCredentials: !0
            };
            return r.httpService.get(t, {})
        },
        I = (0, o.withTranslations)((function(e) {
            var t = e.collectibleItemData,
                l = e.isLimited2,
                c = e.onResalePriceChange,
                o = e.resalePriceFloor,
                s = e.translate,
                u = e.collectibleResaleFeePercentage,
                m = (0, n.useState)(),
                d = m[0],
                f = m[1],
                p = (0, n.useState)(0),
                v = p[0],
                h = p[1],
                y = (0, n.useState)(0),
                E = y[0],
                g = y[1],
                N = 9999999999,
                I = function() {
                    return l ? u / 100 : b.marketplaceFeePercentage
                },
                w = function(e) {
                    var t, n = parseInt(e, 10);
                    if (n) {
                        n > N && (n = N);
                        var a = Math.abs(n),
                            r = (t = a * I()) <= b.marketplaceFeeMinimum ? b.marketplaceFeeMinimum : t % 1 == .5 && Math.trunc(t) % 2 != 0 ? Math.trunc(t) : Math.round(t),
                            l = a - r;
                        f(a), h(r), g(l), c(a)
                    } else f(void 0), h(0), g(0), c(0)
                };
            return (0, n.useEffect)((function() {
                w("" + o)
            }), []), a().createElement("div", {
                className: "place-on-sale-modal-body"
            }, a().createElement("div", {
                className: "modal-top-body"
            }, a().createElement("div", {
                className: "modal-message"
            }, (t.serialNumber || t.averagePrice) && a().createElement(a().Fragment, null, a().createElement("div", {
                className: "item-info-container"
            }, a().createElement("div", {
                className: "item-info-header font-header-2"
            }, s("Heading.ItemInfo")), t.serialNumber && a().createElement("div", {
                className: "item-info-header"
            }, a().createElement("span", null, s("Label.SerialNumberColon")), a().createElement("span", {
                className: "on-sale-tag"
            }, a().createElement("span", {
                className: "icon-shop-limited"
            }), a().createElement("span", null, s("Label.SerialNumberDisplay", {
                serialNumber: t.serialNumber
            })))), t.averagePrice && a().createElement("div", {
                className: "item-info-header"
            }, a().createElement("span", null, s("Label.AveragePrice") + ":"), a().createElement("span", {
                className: "icon-robux-16x16"
            }), a().createElement("span", {
                className: "text-robux "
            }, r.numberFormat.getNumberFormat(t.averagePrice)))), a().createElement("br", null)), a().createElement("div", {
                id: "sell-content-wrapper",
                className: ""
            }, a().createElement("div", {
                className: "text-label"
            }, s("Heading.SetPrice")), a().createElement("div", {
                className: "form-group price-form"
            }, a().createElement("input", {
                className: "form-control input-field sell-price",
                maxLength: 10,
                type: "number",
                placeholder: "" + o,
                value: d,
                min: o,
                onChange: function(e) {
                    w(e.target.value)
                }
            })), !d && a().createElement("div", {
                className: "font-caption-body text"
            }, s("Label.MinimumAmountCustom", {
                minimumAmount: o
            })), d && d < o && a().createElement("div", {
                className: "font-caption-body text"
            }, s("Label.MinimumAmountCustom", {
                minimumAmount: o
            })), a().createElement("br", null), a().createElement("div", {
                className: "text-label"
            }, a().createElement(i.Tooltip, {
                placement: "right",
                id: "resale-tooltip",
                content: a().createElement("div", {
                    className: "resale-tooltip-body"
                }, a().createElement("div", {
                    className: "font-caption-header holding-tooltip-body-header"
                }, s("Label.ResaleFeePolicy")), a().createElement("div", {
                    className: "font-caption-body text holding-tooltip-body-text"
                }, s("Message.ResaleFeePolicy", {
                    yourSharePercent: 100 * (1 - I()),
                    robloxFeePercent: 100 * I()
                }))),
                containerClassName: "holding-tooltip-container"
            }, a().createElement("span", {
                className: "item-hold-tooltip"
            }, a().createElement("span", {
                className: "text-label"
            }, s("Heading.Overview")), a().createElement("span", {
                className: "icon-actions-info-sm info-icon"
            })))), a().createElement("div", {
                className: "text-overflow"
            }, a().createElement("span", {
                className: "share-label"
            }, s("Label.Fee", {
                feePercentage: 100 * I()
            })), a().createElement("span", {
                className: "text-robux "
            }, "-"), a().createElement("span", {
                className: "icon-robux-16x16"
            }), a().createElement("span", {
                className: "text-robux "
            }, r.numberFormat.getNumberFormat(v))), a().createElement("div", {
                className: "text-overflow"
            }, a().createElement("span", {
                className: "share-label"
            }, s("Label.SellCut")), a().createElement("span", {
                className: "icon-robux-16x16"
            }), a().createElement("span", {
                className: "text-robux"
            }, r.numberFormat.getNumberFormat(E)))))))
        }), u),
        w = function() {
            return w = Object.assign || function(e) {
                for (var t, n = 1, a = arguments.length; n < a; n++)
                    for (var r in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
                return e
            }, w.apply(this, arguments)
        },
        S = function(e, t, n, a) {
            return new(n || (n = Promise))((function(r, l) {
                function i(e) {
                    try {
                        o(a.next(e))
                    } catch (e) {
                        l(e)
                    }
                }

                function c(e) {
                    try {
                        o(a.throw(e))
                    } catch (e) {
                        l(e)
                    }
                }

                function o(e) {
                    var t;
                    e.done ? r(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(i, c)
                }
                o((a = a.apply(e, t || [])).next())
            }))
        },
        x = function(e, t) {
            var n, a, r, l, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            };
            return l = {
                next: c(0),
                throw: c(1),
                return: c(2)
            }, "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                return this
            }), l;

            function c(l) {
                return function(c) {
                    return function(l) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; i;) try {
                            if (n = 1, a && (r = 2 & l[0] ? a.return : l[0] ? a.throw || ((r = a.return) && r.call(a), 0) : a.next) && !(r = r.call(a, l[1])).done) return r;
                            switch (a = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                                case 0:
                                case 1:
                                    r = l;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(r = i.trys, (r = r.length > 0 && r[r.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                        i.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && i.label < r[1]) {
                                        i.label = r[1], r = l;
                                        break
                                    }
                                    if (r && i.label < r[2]) {
                                        i.label = r[2], i.ops.push(l);
                                        break
                                    }
                                    r[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            l = t.call(e, i)
                        } catch (e) {
                            l = [6, e], a = 0
                        } finally {
                            n = r = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }([l, c])
                }
            }
        },
        C = (0, o.withTranslations)((function(e) {
            var t = e.collectibleItemData,
                r = e.itemId,
                l = e.isLimited2,
                o = e.showModal,
                s = e.onPlaceOnSaleActionComplete,
                u = e.onModalClosed,
                m = e.resalePriceFloor,
                d = e.translate,
                f = e.collectibleResaleFeePercentage,
                p = (0, i.createModal)(),
                b = p[0],
                v = p[1],
                h = 0,
                y = (0, n.useCallback)((function(e, t, n) {
                    return E(e, t, n)
                }), []),
                N = (0, n.useCallback)((function(e, t) {
                    return g(c.authenticatedUser.id, e.collectibleItemId, e.collectibleInstanceId, e.collectibleProductId, !0, t)
                }), []),
                C = (0, n.useCallback)((function(e, t, n) {
                    return S(void 0, void 0, void 0, (function() {
                        return x(this, (function(a) {
                            switch (a.label) {
                                case 0:
                                    if (n < m) return v.close(), s(!1), [2];
                                    if (!t) return v.close(), s(!1), [2];
                                    a.label = 1;
                                case 1:
                                    return a.trys.push([1, 6, , 7]), l && t ? [4, N(t, n)] : [3, 3];
                                case 2:
                                    return a.sent(), v.close(), s(!0), [3, 5];
                                case 3:
                                    return t.userAssetId ? [4, y(e, t.userAssetId, n)] : [2];
                                case 4:
                                    a.sent(), v.close(), s(!0), a.label = 5;
                                case 5:
                                    return [3, 7];
                                case 6:
                                    return a.sent(), s(!1), v.close(), [3, 7];
                                case 7:
                                    return [2]
                            }
                        }))
                    }))
                }), []);
            return (0, n.useEffect)((function() {
                t && o ? v.open() : v.close()
            }), [t, v, o]), t ? a().createElement(b, w({}, {
                title: d("Heading.SellItem"),
                body: a().createElement(I, {
                    collectibleItemData: t,
                    isLimited2: l,
                    onResalePriceChange: function(e) {
                        h = e
                    },
                    resalePriceFloor: m,
                    collectibleResaleFeePercentage: f
                }),
                neutralButtonText: d("Action.Cancel"),
                actionButtonText: d("Action.Sell"),
                onAction: function() {
                    C(r, t, h).catch((function() {
                        v.close(), s(!1)
                    }))
                },
                onNeutral: function() {
                    t && (s(void 0), v.close(), u())
                },
                size: "md"
            }, {
                actionButtonShow: !0
            })) : a().createElement("div", null)
        }), u),
        P = function() {
            return P = Object.assign || function(e) {
                for (var t, n = 1, a = arguments.length; n < a; n++)
                    for (var r in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
                return e
            }, P.apply(this, arguments)
        },
        k = function(e, t, n, a) {
            return new(n || (n = Promise))((function(r, l) {
                function i(e) {
                    try {
                        o(a.next(e))
                    } catch (e) {
                        l(e)
                    }
                }

                function c(e) {
                    try {
                        o(a.throw(e))
                    } catch (e) {
                        l(e)
                    }
                }

                function o(e) {
                    var t;
                    e.done ? r(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(i, c)
                }
                o((a = a.apply(e, t || [])).next())
            }))
        },
        L = function(e, t) {
            var n, a, r, l, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            };
            return l = {
                next: c(0),
                throw: c(1),
                return: c(2)
            }, "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                return this
            }), l;

            function c(l) {
                return function(c) {
                    return function(l) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; i;) try {
                            if (n = 1, a && (r = 2 & l[0] ? a.return : l[0] ? a.throw || ((r = a.return) && r.call(a), 0) : a.next) && !(r = r.call(a, l[1])).done) return r;
                            switch (a = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                                case 0:
                                case 1:
                                    r = l;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(r = i.trys, (r = r.length > 0 && r[r.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                        i.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && i.label < r[1]) {
                                        i.label = r[1], r = l;
                                        break
                                    }
                                    if (r && i.label < r[2]) {
                                        i.label = r[2], i.ops.push(l);
                                        break
                                    }
                                    r[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            l = t.call(e, i)
                        } catch (e) {
                            l = [6, e], a = 0
                        } finally {
                            n = r = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }([l, c])
                }
            }
        },
        O = (0, o.withTranslations)((function(e) {
            var t = e.collectibleItemData,
                r = e.itemId,
                l = e.isLimited2,
                o = e.showModal,
                s = e.onTakeOffSaleActionComplete,
                u = e.onModalClosed,
                m = e.translate,
                d = (0, i.createModal)(),
                f = d[0],
                p = d[1],
                b = (0, n.useCallback)((function(e, t) {
                    return E(e, t, void 0)
                }), []),
                v = (0, n.useCallback)((function(e) {
                    return g(c.authenticatedUser.id, e.collectibleItemId, e.collectibleInstanceId, e.collectibleProductId, !1, void 0)
                }), []),
                h = (0, n.useCallback)((function(e, t) {
                    return k(void 0, void 0, void 0, (function() {
                        return L(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    if (!t) return p.close(), s(!1), [2];
                                    n.label = 1;
                                case 1:
                                    return n.trys.push([1, 6, , 7]), l && t ? [4, v(t)] : [3, 3];
                                case 2:
                                    return n.sent(), p.close(), s(!0), [3, 5];
                                case 3:
                                    return t.userAssetId ? [4, b(e, t.userAssetId)] : [2];
                                case 4:
                                    n.sent(), p.close(), s(!0), n.label = 5;
                                case 5:
                                    return [3, 7];
                                case 6:
                                    return n.sent(), p.close(), s(!1), [3, 7];
                                case 7:
                                    return [2]
                            }
                        }))
                    }))
                }), []);
            (0, n.useEffect)((function() {
                t && o ? p.open() : p.close()
            }), [t, p, o]);
            var y = a().createElement("div", {
                className: "modal-body"
            }, m("Label.TakeOffSaleConfirmation"));
            return t ? a().createElement(f, P({}, {
                title: m("Heading.TakeOffSale"),
                body: y,
                neutralButtonText: m("Action.Cancel"),
                actionButtonText: m("Heading.TakeOffSale"),
                onAction: function() {
                    h(r, t).catch((function() {
                        p.close(), s(!1)
                    }))
                },
                onNeutral: function() {
                    t && (s(void 0), p.close(), u())
                }
            }, {
                actionButtonShow: !0
            })) : a().createElement("div", null)
        }), u),
        F = function(e, t, n, a) {
            return new(n || (n = Promise))((function(r, l) {
                function i(e) {
                    try {
                        o(a.next(e))
                    } catch (e) {
                        l(e)
                    }
                }

                function c(e) {
                    try {
                        o(a.throw(e))
                    } catch (e) {
                        l(e)
                    }
                }

                function o(e) {
                    var t;
                    e.done ? r(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(i, c)
                }
                o((a = a.apply(e, t || [])).next())
            }))
        },
        A = function(e, t) {
            var n, a, r, l, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            };
            return l = {
                next: c(0),
                throw: c(1),
                return: c(2)
            }, "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                return this
            }), l;

            function c(l) {
                return function(c) {
                    return function(l) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; i;) try {
                            if (n = 1, a && (r = 2 & l[0] ? a.return : l[0] ? a.throw || ((r = a.return) && r.call(a), 0) : a.next) && !(r = r.call(a, l[1])).done) return r;
                            switch (a = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                                case 0:
                                case 1:
                                    r = l;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(r = i.trys, (r = r.length > 0 && r[r.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                        i.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && i.label < r[1]) {
                                        i.label = r[1], r = l;
                                        break
                                    }
                                    if (r && i.label < r[2]) {
                                        i.label = r[2], i.ops.push(l);
                                        break
                                    }
                                    r[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            l = t.call(e, i)
                        } catch (e) {
                            l = [6, e], a = 0
                        } finally {
                            n = r = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }([l, c])
                }
            }
        };
    ! function(e) {
        e[e.onSale = 0] = "onSale", e[e.offSale = 1] = "offSale", e[e.holding = 2] = "holding"
    }(m || (m = {}));
    var R = (0, i.createSystemFeedback)(),
        T = R[0],
        D = R[1],
        M = (0, o.withTranslations)((function(e) {
            var t = e.itemId,
                r = e.isBundle,
                l = e.translate,
                i = (0, n.useState)([]),
                o = i[0],
                u = i[1],
                f = (0, n.useState)(!1),
                b = (f[0], f[1]),
                v = (0, n.useState)(!1),
                E = v[0],
                g = v[1],
                I = (0, n.useState)(),
                w = I[0],
                S = I[1],
                x = (0, n.useState)(!1),
                P = x[0],
                k = x[1],
                L = (0, n.useState)(!1),
                R = L[0],
                M = L[1],
                U = (0, n.useState)(),
                B = U[0],
                H = U[1],
                G = (0, n.useState)(0),
                j = (G[0], G[1]),
                V = (0, n.useState)(""),
                _ = (V[0], V[1]),
                q = (0, n.useState)(),
                z = q[0],
                J = q[1],
                K = (0, n.useState)(!1),
                Q = K[0],
                W = K[1],
                X = (0, n.useState)(d.NONE),
                Y = X[0],
                Z = X[1],
                $ = (0, n.useState)(1),
                ee = $[0],
                te = $[1],
                ne = (0, n.useState)(30),
                ae = ne[0],
                re = ne[1],
                le = (0, n.useCallback)((function(e) {
                    return N(e)
                }), []),
                ie = (0, n.useCallback)((function() {
                    return s.ItemDetailsHydrationService.getItemDetails([{
                        id: t,
                        itemType: r ? "bundle" : "asset"
                    }], void 0, !0)
                }), []),
                ce = (0, n.useCallback)((function(e, t) {
                    return h(e, t)
                }), []),
                oe = (0, n.useCallback)((function(e, t, n) {
                    return y(e, t, 500, n)
                }), []),
                se = (0, n.useCallback)((function(e) {
                    var t = {};
                    return t.userAssetId = e.userAssetId, t.serialNumber = e.serialNumber, t.price = e.price, null === t.price && (t.price = void 0), e.isOnHold ? (t.isInHolding = !0, b(!0)) : g(!0), t
                }), []),
                ue = (0, n.useCallback)((function(e) {
                    var t = {};
                    return t.collectibleInstanceId = e.collectibleInstanceId, t.collectibleItemId = e.collectibleItemId, t.collectibleProductId = e.collectibleProductId, t.serialNumber = e.serialNumber, t.price = e.price, "OffSale" === e.saleState && (t.price = void 0), e.isHeld ? (t.isInHolding = !0, b(!0)) : g(!0), t
                }), []),
                me = (0, n.useCallback)((function() {
                    return F(void 0, void 0, void 0, (function() {
                        var e, n, a, r, l, i, o, s, m;
                        return A(this, (function(f) {
                            switch (f.label) {
                                case 0:
                                    return [4, ie()];
                                case 1:
                                    return e = f.sent(), Z(e[0].collectibleItemDetails ? e[0].collectibleItemDetails.resaleRestriction : d.NONE), n = e[0].collectibleItemId, a = e[0].name, r = e[0].creatorTargetId, l = void 0 !== n, j(r), _(e[0].creatorType), W(l), n && J(n), H(a), l ? [3, 3] : [4, ce(c.authenticatedUser.id, t)];
                                case 2:
                                    return (s = f.sent()) && (i = [], s.data.data.forEach((function(e) {
                                        i.push(se(e))
                                    })), u(i)), [3, 7];
                                case 3:
                                    return n ? l ? [4, le(e[0].collectibleItemId)] : [3, 5] : [2];
                                case 4:
                                    o = f.sent(), re(o.data.resalePercentageFee), o && te(o.data.priceFloor), f.label = 5;
                                case 5:
                                    return [4, oe(c.authenticatedUser.id, n, void 0)];
                                case 6:
                                    (s = f.sent()) && (m = [], s.data.itemInstances.forEach((function(e) {
                                        m.push(ue(e))
                                    })), u(m)), f.label = 7;
                                case 7:
                                    return [2]
                            }
                        }))
                    }))
                }), []),
                de = function(e, t) {
                    t === m.offSale ? (S(e), k(!0)) : t === m.onSale && (S(e), M(!0))
                },
                fe = (0, n.useCallback)((function(e) {
                    e ? (D.success(l("Response.PlacedOnSaleSuccess")), me().catch((function() {
                        window.location.reload()
                    }))) : !1 === e && D.warning(l("Response.PlacedOnSaleFailure")), k(!1)
                }), []),
                pe = (0, n.useCallback)((function(e) {
                    e ? (D.success(l("Response.TakenOffSaleSuccess")), me().catch((function() {
                        window.location.reload()
                    }))) : !1 === e && D.warning(l("Response.TakenOffSaleFailure")), M(!1)
                }), []);
            return (0, n.useEffect)((function() {
                me().catch((function() {
                    u([])
                }))
            }), []), Q && void 0 === z ? a().createElement("div", null) : a().createElement(a().Fragment, null, a().createElement(T, null), a().createElement("div", {
                className: "item-details-limited-inventory"
            }, a().createElement("span", {
                className: "font-header-1"
            }, l("Label.ItemOwnedCount", {
                itemCount: o.length
            })), !c.authenticatedUser.isPremiumUser && E && Y !== d.DISABLED && a().createElement("span", {
                className: "premium-only-tooltip"
            }, a().createElement("span", {
                className: "font-caption-body text"
            }, l("Label.PremiumForResell"))), (null == o ? void 0 : o.length) ? o.map((function(e) {
                return a().createElement(p, {
                    key: e.userAssetId,
                    collectibleItemData: e,
                    itemName: B,
                    isLimited2: Q,
                    isFirstItem: e === o[0],
                    onButtonAction: de,
                    resaleRestriction: Y
                })
            })) : a().createElement("span", {
                className: "item-details-limited-inventory-empty-text"
            }, a().createElement("span", {
                className: "text"
            }, l("Response.NoItemsFound"))), !1, a().createElement(C, {
                collectibleItemData: w,
                itemId: t,
                isLimited2: Q,
                showModal: P,
                resalePriceFloor: ee,
                onPlaceOnSaleActionComplete: fe,
                onModalClosed: function() {
                    k(!1)
                },
                collectibleResaleFeePercentage: ae
            }), a().createElement(O, {
                collectibleItemData: w,
                itemId: t,
                isLimited2: Q,
                showModal: R,
                onTakeOffSaleActionComplete: pe,
                onModalClosed: function() {
                    M(!1)
                }
            })))
        }), u),
        U = function(e) {
            var t = e.getAttribute("data-target-id");
            return t ? parseInt(t, 10) : 0
        },
        B = function(e) {
            var t;
            return "true" === (null === (t = e.getAttribute("data-is-bundle")) || void 0 === t ? void 0 : t.toString().toLowerCase())
        };

    function H() {
        var e = document.getElementById(b.itemDetailsLimitedInventoryElementName);
        e ? (0, l.render)(a().createElement(M, {
            itemId: U(e),
            isBundle: B(e)
        }), e) : window.requestAnimationFrame(H)
    }(0, r.ready)((function() {
        H()
    }))
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/057c35d1c110aad57ecd4c275d45bdfa-itemDetailsLimitedInventory.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemDetailsLimitedInventory");