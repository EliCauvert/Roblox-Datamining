! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "5690ea7bf840f017788de8e800bea68dcf38055e"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "278bcfe5-ac69-4169-ac9e-fbf9b478e968", e._sentryDebugIdIdentifier = "sentry-dbid-278bcfe5-ac69-4169-ac9e-fbf9b478e968")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, r, n = {},
        a = {};

    function i(e) {
        var t = a[e];
        if (void 0 !== t) return t.exports;
        var r = a[e] = {
            exports: {}
        };
        return n[e](r, r.exports, i), r.exports
    }
    i.m = n, i.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return i.d(t, {
            a: t
        }), t
    }, i.d = function(e, t) {
        for (var r in t) i.o(t, r) && !i.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, i.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, i.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, i.rv = function() {
        return "1.7.12"
    }, i.ruid = "bundler=rspack@1.7.12";
    var o = window.ReactJSX,
        l = window.React,
        c = i.n(l),
        s = window.Roblox["core-scripts"].util.ready,
        u = i.n(s),
        f = window.Roblox["core-scripts"].react,
        d = window.ReactStyleGuide,
        b = window.HeaderScripts,
        m = window.ReactUtilities,
        y = window.Roblox,
        v = window.CoreUtilities,
        p = {
            common: [""],
            feature: "Feature.Catalog"
        },
        h = ((e = {})[e.INVALID = 0] = "INVALID", e[e.NONE = 1] = "NONE", e[e.DISABLED = 2] = "DISABLED", e),
        w = (0, m.withTranslations)(function(e) {
            var t = e.collectibleItemData,
                r = e.resaleRestriction,
                n = (e.isLimited2, e.onResaleButtonClicked),
                a = e.translate,
                i = function() {
                    return t.isInHolding ? ek.holding : t.price ? ek.onSale : ek.offSale
                },
                l = function() {
                    n(t, i())
                },
                c = i();
            return (0, o.jsx)("div", {
                className: "resale-button",
                id: function() {
                    switch (c) {
                        case ek.onSale:
                            return "take-off-sale";
                        case ek.offSale:
                            return "sell";
                        case ek.holding:
                            return "holding";
                        default:
                            return "sell"
                    }
                }(),
                children: r !== h.DISABLED && (0, o.jsx)("button", {
                    type: "button",
                    className: "btn-min-width btn-buy-md",
                    onClick: function(e) {
                        e.currentTarget.blur(), l()
                    },
                    disabled: !b.authenticatedUser.isPremiumUser || c === ek.holding,
                    children: function() {
                        switch (c) {
                            case ek.onSale:
                                return a("Heading.TakeOffSale");
                            case ek.offSale:
                                return a("Action.Sell");
                            case ek.holding:
                                return a("Label.Holding");
                            default:
                                return a("Action.Sell")
                        }
                    }()
                })
            })
        }, p),
        g = (0, m.withTranslations)(function(e) {
            var t = e.collectibleItemData,
                r = e.resaleRestriction,
                n = e.itemName,
                a = e.isLimited2,
                i = e.isFirstItem,
                l = e.onButtonAction,
                s = e.translate,
                u = t.serialNumber ? "#".concat(t.serialNumber) : n;
            return (0, o.jsxs)("div", {
                className: "item-details-limited-inventory-row",
                children: [(0, o.jsxs)("span", {
                    className: "item-info",
                    children: [(0, o.jsx)("span", {
                        className: "collectible-serial-number font-header-2",
                        children: u
                    }), (0, o.jsxs)("span", {
                        className: "buy-price font-caption-body text",
                        children: [void 0 !== t.buyPrice && (0, o.jsxs)("span", {
                            children: [s("Label.BuyPrice"), (0, o.jsx)("span", {
                                className: "icon-robux-16x16"
                            }), (0, o.jsx)("span", {
                                className: "text-robux",
                                children: v.numberFormat.getNumberFormat(t.buyPrice)
                            })]
                        }), void 0 !== t.buyPrice && void 0 !== t.price && (0, o.jsx)("span", {
                            className: "on-sale-tag-divider-container",
                            children: (0, o.jsx)("div", {
                                className: "on-sale-tag-divider"
                            })
                        }), void 0 !== t.price && (0, o.jsxs)(c().Fragment, {
                            children: [(0, o.jsx)("span", {
                                className: "on-sale-tag",
                                children: s("Label.OnSale")
                            }), (0, o.jsx)("span", {
                                className: "on-sale-tag-divider-container",
                                children: (0, o.jsx)("div", {
                                    className: "on-sale-tag-divider"
                                })
                            }), (0, o.jsxs)("span", {
                                children: [s("Label.SalePrice"), (0, o.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, o.jsx)("span", {
                                    className: "text-robux",
                                    children: v.numberFormat.getNumberFormat(t.price)
                                })]
                            })]
                        })]
                    })]
                }), (0, o.jsx)("span", {
                    className: "sale-status",
                    children: (0, o.jsx)(w, {
                        collectibleItemData: t,
                        isLimited2: a,
                        onResaleButtonClicked: function(e, t) {
                            l(e, t)
                        },
                        resaleRestriction: r
                    })
                }), !i && (0, o.jsx)("div", {
                    className: "dividing-line"
                })]
            })
        }, p),
        x = window.Roblox["core-scripts"].environmentUrls,
        S = i.n(x),
        j = {
            assetRootUrlTemplate: "catalog",
            bundleRootUrlTemplate: "bundles",
            getRecommendations: {
                url: "".concat(S().catalogApi, "/v2/recommendations/complement-assets"),
                retryable: !0,
                withCredentials: !0
            },
            postItemDetails: {
                url: "".concat(S().catalogApi, "/v1/catalog/items/details"),
                retryable: !0,
                withCredentials: !0
            },
            getItemOwnershipUrl: function(e, t, r) {
                return "".concat(S().inventoryApi, "/v1/users/").concat(e, "/items/").concat(t, "/").concat(r, "/is-owned")
            },
            getLimited2CopiesOwned: function(e, t, r, n) {
                return "".concat(S().apiGatewayUrl, "/marketplace-sales/v1/item/").concat(t, "/resellable-instances?cursor=").concat(n || "", "&ownerType=User&ownerId=").concat(e, "&limit=").concat(r)
            },
            placeLimited2ItemOnSale: function(e, t) {
                return "".concat(S().apiGatewayUrl, "/marketplace-sales/v1/item/").concat(e, "/instance/").concat(t, "/resale")
            },
            getLimited2ResaleParameters: function(e) {
                return "".concat(S().apiGatewayUrl, "/marketplace-sales/v1/item/").concat(e, "/get-resale-parameters")
            },
            getLimited1ResaleData: function(e) {
                return "".concat(S().economyApi, "/v1/assets/").concat(e, "/resale-data")
            },
            getLimited2ResaleData: function(e) {
                return "".concat(S().apiGatewayUrl, "/marketplace-sales/v1/item/").concat(e, "/resale-data")
            }
        },
        I = function(e, t, r, n) {
            var a = {
                url: j.getLimited2CopiesOwned(e, t, r, n),
                retryable: !0,
                withCredentials: !0
            };
            return v.httpService.get(a)
        },
        N = function(e, t, r, n, a, i) {
            var o, l;
            return t && r && n && (o = {
                url: j.placeLimited2ItemOnSale(t, r),
                retryable: !0,
                withCredentials: !0
            }, l = {
                price: i,
                isOnSale: a,
                sellerId: e,
                sellerType: "User",
                collectibleProductId: n
            }), v.httpService.patch(o, l)
        },
        O = function(e) {
            var t = {
                url: j.getLimited2ResaleParameters(e),
                retryable: !0,
                withCredentials: !0
            };
            return v.httpService.get(t, {})
        },
        A = function(e) {
            var t = {
                url: j.getLimited1ResaleData(e),
                retryable: !0,
                withCredentials: !0
            };
            return v.httpService.get(t, {})
        },
        P = function(e) {
            var t = {
                url: j.getLimited2ResaleData(e),
                retryable: !0,
                withCredentials: !0
            };
            return v.httpService.get(t, {})
        };

    function k(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function C(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != a) {
                var i = [],
                    o = !0,
                    l = !1;
                try {
                    for (a = a.call(e); !(o = (r = a.next()).done) && (i.push(r.value), !t || i.length !== t); o = !0);
                } catch (e) {
                    l = !0, n = e
                } finally {
                    try {
                        o || null == a.return || a.return()
                    } finally {
                        if (l) throw n
                    }
                }
                return i
            }
        }(e, t) || function(e, t) {
            if (e) {
                if ("string" == typeof e) return k(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return k(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var B = (0, m.withTranslations)(function(e) {
        var t = e.collectibleItemData,
            r = e.isLimited2,
            n = e.onResalePriceChange,
            a = e.resalePriceFloor,
            i = e.recentAveragePrice,
            s = e.translate,
            u = e.collectibleResaleFeePercentage,
            f = C((0, l.useState)(), 2),
            b = f[0],
            m = f[1],
            y = C((0, l.useState)(0), 2),
            p = y[0],
            h = y[1],
            w = C((0, l.useState)(0), 2),
            g = w[0],
            x = w[1],
            S = "below-average-price-warning",
            j = function() {
                return r ? u / 100 : .3
            },
            I = function(e) {
                var t = e * j();
                return t <= 1 ? 1 : t % 1 == .5 && Math.trunc(t) % 2 != 0 ? Math.trunc(t) : Math.round(t)
            },
            N = function(e) {
                var t = parseInt(e, 10);
                if (t) {
                    t > 0x2540be3ff && (t = 0x2540be3ff);
                    var r = Math.abs(t),
                        a = I(r),
                        i = r - a;
                    m(r), h(a), x(i), n(r)
                } else m(void 0), h(0), x(0), n(0)
            };
        (0, l.useEffect)(function() {
            N("".concat(a))
        }, []);
        var O = void 0 !== i && i > 0,
            A = O && void 0 !== b && b >= a && b < .5 * i,
            P = O ? v.numberFormat.getNumberFormat(i) : "";
        return (0, o.jsx)("div", {
            className: "place-on-sale-modal-body",
            children: (0, o.jsx)("div", {
                className: "modal-top-body",
                children: (0, o.jsxs)("div", {
                    className: "modal-message",
                    children: [(t.serialNumber || O) && (0, o.jsxs)(c().Fragment, {
                        children: [(0, o.jsxs)("div", {
                            className: "item-info-container",
                            children: [(0, o.jsx)("div", {
                                className: "item-info-header font-header-2",
                                children: s("Heading.ItemInfo")
                            }), t.serialNumber && (0, o.jsxs)("div", {
                                className: "item-info-header",
                                children: [(0, o.jsx)("span", {
                                    children: s("Label.SerialNumberColon")
                                }), (0, o.jsxs)("span", {
                                    className: "on-sale-tag",
                                    children: [(0, o.jsx)("span", {
                                        className: "icon-shop-limited"
                                    }), (0, o.jsx)("span", {
                                        children: s("Label.SerialNumberDisplay", {
                                            serialNumber: t.serialNumber
                                        })
                                    })]
                                })]
                            }), O && (0, o.jsxs)("div", {
                                className: "item-info-header",
                                children: [(0, o.jsx)("span", {
                                    children: s("Label.AveragePrice") + ":"
                                }), (0, o.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, o.jsx)("span", {
                                    className: "text-robux ",
                                    children: P
                                })]
                            })]
                        }), (0, o.jsx)("br", {})]
                    }), (0, o.jsxs)("div", {
                        id: "sell-content-wrapper",
                        className: "",
                        children: [(0, o.jsx)("div", {
                            className: "text-label",
                            children: s("Heading.SetPrice")
                        }), (0, o.jsx)("div", {
                            className: "form-group price-form",
                            children: (0, o.jsx)("input", {
                                className: "form-control input-field sell-price",
                                maxLength: 10,
                                type: "number",
                                placeholder: "".concat(a),
                                value: b,
                                min: a,
                                "aria-describedby": A ? S : void 0,
                                onChange: function(e) {
                                    N(e.target.value)
                                }
                            })
                        }), !b && (0, o.jsx)("div", {
                            className: "font-caption-body text",
                            children: s("Label.MinimumAmountCustom", {
                                minimumAmount: a
                            })
                        }), b && b < a && (0, o.jsx)("div", {
                            className: "font-caption-body text",
                            children: s("Label.MinimumAmountCustom", {
                                minimumAmount: a
                            })
                        }), (0, o.jsx)("div", {
                            id: S,
                            className: "font-caption-body below-average-price-warning",
                            role: "status",
                            "aria-live": "polite",
                            children: A ? s("Message.SellingBelowAveragePrice", {
                                averagePrice: P
                            }) || "This price is well below the recent average price of ".concat(P, " Robux. Double-check the amount before you sell.") : ""
                        }), (0, o.jsx)("br", {}), (0, o.jsx)("div", {
                            className: "text-label",
                            children: (0, o.jsx)(d.Tooltip, {
                                placement: "right",
                                id: "resale-tooltip",
                                content: (0, o.jsxs)("div", {
                                    className: "resale-tooltip-body",
                                    children: [(0, o.jsx)("div", {
                                        className: "font-caption-header holding-tooltip-body-header",
                                        children: s("Label.ResaleFeePolicy")
                                    }), (0, o.jsx)("div", {
                                        className: "font-caption-body text holding-tooltip-body-text",
                                        children: s("Message.ResaleFeePolicy", {
                                            yourSharePercent: (1 - j()) * 100,
                                            robloxFeePercent: 100 * j()
                                        })
                                    })]
                                }),
                                containerClassName: "holding-tooltip-container",
                                children: (0, o.jsxs)("span", {
                                    className: "item-hold-tooltip",
                                    children: [(0, o.jsx)("span", {
                                        className: "text-label",
                                        children: s("Heading.Overview")
                                    }), (0, o.jsx)("span", {
                                        className: "icon-actions-info-sm info-icon"
                                    })]
                                })
                            })
                        }), (0, o.jsxs)("div", {
                            className: "text-overflow",
                            children: [(0, o.jsx)("span", {
                                className: "share-label",
                                children: s("Label.Fee", {
                                    feePercentage: 100 * j()
                                })
                            }), (0, o.jsx)("span", {
                                className: "text-robux ",
                                children: "-"
                            }), (0, o.jsx)("span", {
                                className: "icon-robux-16x16"
                            }), (0, o.jsx)("span", {
                                className: "text-robux ",
                                children: v.numberFormat.getNumberFormat(p)
                            })]
                        }), (0, o.jsxs)("div", {
                            className: "text-overflow",
                            children: [(0, o.jsx)("span", {
                                className: "share-label",
                                children: s("Label.SellCut")
                            }), (0, o.jsx)("span", {
                                className: "icon-robux-16x16"
                            }), (0, o.jsx)("span", {
                                className: "text-robux",
                                children: v.numberFormat.getNumberFormat(g)
                            })]
                        })]
                    })]
                })
            })
        })
    }, p);

    function L(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function T(e, t, r, n, a, i, o) {
        try {
            var l = e[i](o),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, a)
    }
    var D = (0, m.withTranslations)(function(e) {
        var t, r = e.collectibleItemData,
            n = e.isLimited2,
            a = e.showModal,
            i = e.onPlaceOnSaleActionComplete,
            c = e.onModalClosed,
            s = e.resalePriceFloor,
            u = e.recentAveragePrice,
            f = e.translate,
            m = e.collectibleResaleFeePercentage,
            y = function(e) {
                if (Array.isArray(e)) return e
            }(t = (0, l.useMemo)(function() {
                return (0, d.createModal)()
            }, [])) || function(e) {
                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                if (null != n) {
                    var a = [],
                        i = !0,
                        o = !1;
                    try {
                        for (n = n.call(e); !(i = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); i = !0);
                    } catch (e) {
                        o = !0, r = e
                    } finally {
                        try {
                            i || null == n.return || n.return()
                        } finally {
                            if (o) throw r
                        }
                    }
                    return a
                }
            }(t) || function(e) {
                if (e) {
                    if ("string" == typeof e) return L(e, 2);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return L(e, 2)
                }
            }(t) || function() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }(),
            v = y[0],
            p = y[1],
            h = (0, l.useRef)(0),
            w = (0, l.useCallback)(function(e, t) {
                return N(b.authenticatedUser.id, e.collectibleItemId, e.collectibleInstanceId, e.collectibleProductId, !0, t)
            }, []),
            g = (0, l.useCallback)(function(e, t) {
                var r;
                return (r = function() {
                    return function(e, t) {
                        var r, n, a, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(o, "next", {
                            value: c(0)
                        }), l(o, "throw", {
                            value: c(1)
                        }), l(o, "return", {
                            value: c(2)
                        }), "function" == typeof Symbol && l(o, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), o;

                        function c(l) {
                            return function(c) {
                                var s = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; o && (o = 0, s[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                    switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            a = s;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                i.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && i.label < a[1]) {
                                                i.label = a[1], a = s;
                                                break
                                            }
                                            if (a && i.label < a[2]) {
                                                i.label = a[2], i.ops.push(s);
                                                break
                                            }
                                            a[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    s = t.call(e, i)
                                } catch (e) {
                                    s = [6, e], n = 0
                                } finally {
                                    r = a = 0
                                }
                                if (5 & s[0]) throw s[1];
                                return {
                                    value: s[0] ? s[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (t < s || !e) return p.close(), i(!1), [2];
                                r.label = 1;
                            case 1:
                                if (r.trys.push([1, 3, , 4]), !n) return p.close(), i(!1), [2];
                                return [4, w(e, t)];
                            case 2:
                                return r.sent(), p.close(), i(!0), [3, 4];
                            case 3:
                                return r.sent(), i(!1), p.close(), [3, 4];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(n, a) {
                        var i = r.apply(e, t);

                        function o(e) {
                            T(i, n, a, o, l, "next", e)
                        }

                        function l(e) {
                            T(i, n, a, o, l, "throw", e)
                        }
                        o(void 0)
                    })
                })()
            }, [s, n, p, i, w]);
        return ((0, l.useEffect)(function() {
            r && a ? p.open() : p.close()
        }, [r, p, a]), r) ? (0, o.jsx)(v, {
            title: f("Heading.SellItem"),
            body: (0, o.jsx)(B, {
                collectibleItemData: r,
                isLimited2: n,
                onResalePriceChange: function(e) {
                    h.current = e
                },
                resalePriceFloor: s,
                recentAveragePrice: u,
                collectibleResaleFeePercentage: m
            }),
            neutralButtonText: f("Action.Cancel"),
            actionButtonText: f("Action.Sell"),
            onAction: function() {
                g(r, h.current).catch(function() {
                    p.close(), i(!1)
                })
            },
            onNeutral: function() {
                r && (i(void 0), p.close(), c())
            },
            size: "md",
            actionButtonShow: !0
        }) : (0, o.jsx)("div", {})
    }, p);

    function E(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function R(e, t, r, n, a, i, o) {
        try {
            var l = e[i](o),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, a)
    }
    var F = (0, m.withTranslations)(function(e) {
        var t, r = e.collectibleItemData,
            n = e.isLimited2,
            a = e.showModal,
            i = e.onTakeOffSaleActionComplete,
            c = e.onModalClosed,
            s = e.translate,
            u = function(e) {
                if (Array.isArray(e)) return e
            }(t = (0, d.createModal)()) || function(e) {
                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                if (null != n) {
                    var a = [],
                        i = !0,
                        o = !1;
                    try {
                        for (n = n.call(e); !(i = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); i = !0);
                    } catch (e) {
                        o = !0, r = e
                    } finally {
                        try {
                            i || null == n.return || n.return()
                        } finally {
                            if (o) throw r
                        }
                    }
                    return a
                }
            }(t) || function(e) {
                if (e) {
                    if ("string" == typeof e) return E(e, 2);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return E(e, 2)
                }
            }(t) || function() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }(),
            f = u[0],
            m = u[1],
            y = (0, l.useCallback)(function(e) {
                return N(b.authenticatedUser.id, e.collectibleItemId, e.collectibleInstanceId, e.collectibleProductId, !1, void 0)
            }, []),
            v = (0, l.useCallback)(function(e) {
                var t;
                return (t = function() {
                    return function(e, t) {
                        var r, n, a, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(o, "next", {
                            value: c(0)
                        }), l(o, "throw", {
                            value: c(1)
                        }), l(o, "return", {
                            value: c(2)
                        }), "function" == typeof Symbol && l(o, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), o;

                        function c(l) {
                            return function(c) {
                                var s = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; o && (o = 0, s[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                    switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            a = s;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                i.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && i.label < a[1]) {
                                                i.label = a[1], a = s;
                                                break
                                            }
                                            if (a && i.label < a[2]) {
                                                i.label = a[2], i.ops.push(s);
                                                break
                                            }
                                            a[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    s = t.call(e, i)
                                } catch (e) {
                                    s = [6, e], n = 0
                                } finally {
                                    r = a = 0
                                }
                                if (5 & s[0]) throw s[1];
                                return {
                                    value: s[0] ? s[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (!e) return m.close(), i(!1), [2];
                                t.label = 1;
                            case 1:
                                if (t.trys.push([1, 3, , 4]), !n) return m.close(), i(!1), [2];
                                return [4, y(e)];
                            case 2:
                                return t.sent(), m.close(), i(!0), [3, 4];
                            case 3:
                                return t.sent(), m.close(), i(!1), [3, 4];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var e = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var i = t.apply(e, r);

                        function o(e) {
                            R(i, n, a, o, l, "next", e)
                        }

                        function l(e) {
                            R(i, n, a, o, l, "throw", e)
                        }
                        o(void 0)
                    })
                })()
            }, []);
        (0, l.useEffect)(function() {
            r && a ? m.open() : m.close()
        }, [r, m, a]);
        var p = (0, o.jsx)("div", {
            className: "modal-body",
            children: s("Label.TakeOffSaleConfirmation")
        });
        return r ? (0, o.jsx)(f, {
            title: s("Heading.TakeOffSale"),
            body: p,
            neutralButtonText: s("Action.Cancel"),
            actionButtonText: s("Heading.TakeOffSale"),
            onAction: function() {
                v(r).catch(function() {
                    m.close(), i(!1)
                })
            },
            onNeutral: function() {
                r && (i(void 0), m.close(), c())
            },
            size: "sm",
            actionButtonShow: !0
        }) : (0, o.jsx)("div", {})
    }, p);

    function M(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function V(e) {
        for (var t = 1; t < arguments.length; t++) {
            var r = null != arguments[t] ? arguments[t] : {},
                n = Object.keys(r);
            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                return Object.getOwnPropertyDescriptor(r, e).enumerable
            }))), n.forEach(function(t) {
                var n;
                n = r[t], t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n
            })
        }
        return e
    }

    function U(e, t) {
        return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
            var t = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var r = Object.getOwnPropertySymbols(e);
                t.push.apply(t, r)
            }
            return t
        })(Object(t)).forEach(function(r) {
            Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
        }), e
    }

    function _(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != a) {
                var i = [],
                    o = !0,
                    l = !1;
                try {
                    for (a = a.call(e); !(o = (r = a.next()).done) && (i.push(r.value), !t || i.length !== t); o = !0);
                } catch (e) {
                    l = !0, n = e
                } finally {
                    try {
                        o || null == a.return || a.return()
                    } finally {
                        if (l) throw n
                    }
                }
                return i
            }
        }(e, t) || function(e, t) {
            if (e) {
                if ("string" == typeof e) return M(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return M(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function H(e, t, r, n, a, i, o) {
        try {
            var l = e[i](o),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, a)
    }

    function G() {
        return null != r || (r = "".concat(S().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), r
    }
    var $ = function() {};

    function z(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function W(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }
    var Z = function(e, t) {
            return e << 3 | t
        },
        q = Z(1, 2),
        J = Z(2, 2),
        X = Z(5, 2),
        Y = Z(6, 2),
        K = Z(8, 2),
        Q = Z(1, 2),
        ee = Z(2, 1),
        et = Z(3, 0),
        er = Z(5, 2);
    Z(1, 2), Z(2, 1), Z(3, 0), Z(4, 2), Z(5, 2), Z(6, 0), Z(8, 2);
    var en = Z(4, 0),
        ea = Z(6, 2),
        ei = Z(7, 2);
    Z(1, 0), Z(2, 2);
    var eo = Z(1, 2),
        el = Z(2, 2),
        ec = Z(1, 2);
    Z(1, 2), Z(2, 2), Z(1, 2);
    var es = new TextEncoder,
        eu = function() {
            var e;

            function t() {
                var e;
                if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                e = [], "buf" in this ? Object.defineProperty(this, "buf", {
                    value: e,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : this.buf = e
            }
            return e = [{
                    key: "writeVarint",
                    value: function(e) {
                        var t = (void 0 === e ? "undefined" : W(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                        for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                        this.buf.push(Number(t))
                    }
                }, {
                    key: "writeString",
                    value: function(e) {
                        var t = es.encode(e);
                        this.writeVarint(t.length);
                        var r = !0,
                            n = !1,
                            a = void 0;
                        try {
                            for (var i, o = t[Symbol.iterator](); !(r = (i = o.next()).done); r = !0) {
                                var l = i.value;
                                this.buf.push(l)
                            }
                        } catch (e) {
                            n = !0, a = e
                        } finally {
                            try {
                                r || null == o.return || o.return()
                            } finally {
                                if (n) throw a
                            }
                        }
                    }
                }, {
                    key: "writeBytes",
                    value: function(e) {
                        this.writeVarint(e.length);
                        var t = !0,
                            r = !1,
                            n = void 0;
                        try {
                            for (var a, i = e[Symbol.iterator](); !(t = (a = i.next()).done); t = !0) {
                                var o = a.value;
                                this.buf.push(o)
                            }
                        } catch (e) {
                            r = !0, n = e
                        } finally {
                            try {
                                t || null == i.return || i.return()
                            } finally {
                                if (r) throw n
                            }
                        }
                    }
                }, {
                    key: "writeDouble",
                    value: function(e) {
                        var t = new DataView(new ArrayBuffer(8));
                        t.setFloat64(0, e, !0);
                        for (var r = 0; r < 8; r += 1) this.buf.push(t.getUint8(r))
                    }
                }, {
                    key: "toBytes",
                    value: function() {
                        return new Uint8Array(this.buf)
                    }
                }],
                function(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var n = t[r];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                    }
                }(t.prototype, e), t
        }();

    function ef(e, t, r) {
        var n = new eu;
        return n.writeVarint(Z(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
    }

    function ed(e) {
        var t = new eu;
        if (t.writeVarint(Q), t.writeString(e.name), t.writeVarint(ee), t.writeDouble(e.value), t.writeVarint(et), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
            var r = function(e) {
                var t = new eu,
                    r = !0,
                    n = !1,
                    a = void 0;
                try {
                    for (var i, o = Object.entries(e)[Symbol.iterator](); !(r = (i = o.next()).done); r = !0) ! function() {
                        var e, r = (e = i.value, function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var a = [],
                                        i = !0,
                                        o = !1;
                                    try {
                                        for (n = n.call(e); !(i = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); i = !0);
                                    } catch (e) {
                                        o = !0, r = e
                                    } finally {
                                        try {
                                            i || null == n.return || n.return()
                                        } finally {
                                            if (o) throw r
                                        }
                                    }
                                    return a
                                }
                            }(e) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return z(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return z(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            n = r[0],
                            a = r[1];
                        if ("string" == typeof a) {
                            var o = ef(n, Z(2, 2), function(e) {
                                e.writeString(a)
                            });
                            t.writeVarint(X), t.writeBytes(o)
                        } else if ("boolean" == typeof a) {
                            var l = ef(n, Z(2, 0), function(e) {
                                e.writeVarint(+!!a)
                            });
                            t.writeVarint(Y), t.writeBytes(l)
                        } else if ((void 0 === a ? "undefined" : W(a)) === "bigint") {
                            var c = ef(n, Z(2, 0), function(e) {
                                e.writeVarint(a)
                            });
                            t.writeVarint(J), t.writeBytes(c)
                        } else if ("number" == typeof a)
                            if (Number.isFinite(a))
                                if (Number.isInteger(a) && a >= -0x80000000 && a <= 0x7fffffff) {
                                    var s = ef(n, Z(2, 0), function(e) {
                                        e.writeVarint(a)
                                    });
                                    t.writeVarint(q), t.writeBytes(s)
                                } else if (Number.isInteger(a)) {
                            var u = ef(n, Z(2, 0), function(e) {
                                e.writeVarint(BigInt(a))
                            });
                            t.writeVarint(J), t.writeBytes(u)
                        } else {
                            var f = ef(n, Z(2, 1), function(e) {
                                e.writeDouble(a)
                            });
                            t.writeVarint(K), t.writeBytes(f)
                        } else {
                            var d = ef(n, Z(2, 2), function(e) {
                                e.writeString(String(a))
                            });
                            t.writeVarint(X), t.writeBytes(d)
                        }
                    }()
                } catch (e) {
                    n = !0, a = e
                } finally {
                    try {
                        r || null == o.return || o.return()
                    } finally {
                        if (n) throw a
                    }
                }
                return t.toBytes()
            }(e.attributes);
            t.writeVarint(er), t.writeBytes(r)
        }
        return t.toBytes()
    }

    function eb(e, t, r) {
        var n = new eu;
        n.writeVarint(en), n.writeVarint(r);
        var a = !0,
            i = !1,
            o = void 0;
        try {
            for (var l, c = e[Symbol.iterator](); !(a = (l = c.next()).done); a = !0) {
                var s = l.value;
                n.writeVarint(ea), n.writeBytes(s)
            }
        } catch (e) {
            i = !0, o = e
        } finally {
            try {
                a || null == c.return || c.return()
            } finally {
                if (i) throw o
            }
        }
        var u = !0,
            f = !1,
            d = void 0;
        try {
            for (var b, m = t[Symbol.iterator](); !(u = (b = m.next()).done); u = !0) {
                var y = b.value;
                n.writeVarint(ei), n.writeBytes(y)
            }
        } catch (e) {
            f = !0, d = e
        } finally {
            try {
                u || null == m.return || m.return()
            } finally {
                if (f) throw d
            }
        }
        return n.toBytes()
    }

    function em(e) {
        var t = new eu;
        t.writeVarint(eo), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(el), t.writeBytes(e);
        var r = t.toBytes(),
            n = new eu;
        return n.writeVarint(ec), n.writeBytes(r), n.toBytes()
    }
    var ey = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

    function ev(e) {
        return ey.test(e)
    }
    var ep = [],
        eh = !1,
        ew = !1;

    function eg(e, t) {
        var r, n, a, i = e.map(function(e) {
                return {
                    name: e.name,
                    value: e.value,
                    timestampMs: e.timestampMs,
                    attributes: e.attributes
                }
            }),
            o = BigInt(Date.now());
        !0 === t || ew || "u" > typeof document && "hidden" === document.visibilityState ? (r = em(eb(i.map(ed), [], o)).buffer, fetch("".concat(G()).concat("/v1/events/single"), {
            method: "POST",
            headers: {
                "Content-Type": "application/x-protobuf"
            },
            body: r,
            credentials: "include",
            keepalive: !0
        }).catch($)) : (n = em(eb(i.map(ed), [], o)), (a = function() {
            var e, t, r, a, i, o, l, c, s, u, f, d, b;
            return function(e, t) {
                var r, n, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(o, "next", {
                    value: c(0)
                }), l(o, "throw", {
                    value: c(1)
                }), l(o, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = t.call(e, i)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }(this, function(m) {
                switch (m.label) {
                    case 0:
                        if ("u" < typeof CompressionStream) return [2, {
                            body: n.buffer,
                            compressed: !1
                        }];
                        return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch($), t.close().catch($), r = [], [4, (a = e.readable.getReader()).read()];
                    case 1:
                        i = m.sent(), m.label = 2;
                    case 2:
                        if (i.done) return [3, 4];
                        return r.push(i.value), [4, a.read()];
                    case 3:
                        return i = m.sent(), [3, 2];
                    case 4:
                        o = new Uint8Array(r.reduce(function(e, t) {
                            return e + t.length
                        }, 0)), l = 0, c = !0, s = !1, u = void 0;
                        try {
                            for (f = r[Symbol.iterator](); !(c = (d = f.next()).done); c = !0) b = d.value, o.set(b, l), l += b.length
                        } catch (e) {
                            s = !0, u = e
                        } finally {
                            try {
                                c || null == f.return || f.return()
                            } finally {
                                if (s) throw u
                            }
                        }
                        return [2, {
                            body: o.buffer,
                            compressed: !0
                        }]
                }
            })
        }, function() {
            var e = this,
                t = arguments;
            return new Promise(function(r, n) {
                var i = a.apply(e, t);

                function o(e) {
                    H(i, r, n, o, l, "next", e)
                }

                function l(e) {
                    H(i, r, n, o, l, "throw", e)
                }
                o(void 0)
            })
        })()).then(function(e) {
            var t = e.body,
                r = e.compressed,
                n = {
                    "Content-Type": "application/x-protobuf"
                };
            return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(G()).concat("/v1/events/single"), {
                method: "POST",
                headers: n,
                body: t,
                credentials: "include",
                keepalive: !0
            })
        }).catch($)
    }

    function ex() {
        var e = !0,
            t = !1,
            r = void 0;
        try {
            for (var n, a = ep[Symbol.iterator](); !(e = (n = a.next()).done); e = !0) {
                var i = n.value.splice(0);
                0 !== i.length && eg(i, !0)
            }
        } catch (e) {
            t = !0, r = e
        } finally {
            try {
                e || null == a.return || a.return()
            } finally {
                if (t) throw r
            }
        }
    }
    var eS = function(e) {
        var t = e.publish,
            r = e.captureException,
            n = e.featureName;

        function a(e, t, a) {
            if (null != a) {
                var i, o = (null != (i = Error) && "u" > typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](a) : a instanceof i) ? a.name || "Error" : "UnknownError",
                    l = n ? "".concat(n, "_").concat(e) : e;
                return null == r || r(a, {
                    error_counter: l
                }), U(V({}, t), {
                    errorType: o
                })
            }
            return t
        }
        return {
            trackCounter: function() {
                for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                var a = _(r, 2);
                t(a[0], a[1])
            },
            trackError: function() {
                for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                var i = _(r, 3),
                    o = i[0],
                    l = i[1],
                    c = i[2],
                    s = a(o, U(V({}, null != l ? l : {}), {
                        severity: "error"
                    }), c);
                t(o, s)
            },
            trackCriticalError: function() {
                for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                var i = _(r, 3),
                    o = i[0],
                    l = i[1],
                    c = i[2],
                    s = a(o, U(V({}, null != l ? l : {}), {
                        severity: "critical"
                    }), c);
                t(o, s)
            }
        }
    }({
        publish: function(e) {
            var t, r = Math.max(1, 10),
                n = 250;

            function a(e, t) {
                console.error(e, t)
            }
            if (!ev(e)) return a('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                    name: e
                }),
                function() {};
            var i = [];
            return ep.push(i), eh || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                    "hidden" === document.visibilityState && ex()
                }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                    ew = !0, ex()
                }), eh = !0),
                function(o, l, c) {
                    var s = "".concat(e, "_").concat(o);
                    if (! function(e, t) {
                            if (!ev(e)) return !1;
                            if (t) {
                                var r = !0,
                                    n = !1,
                                    a = void 0;
                                try {
                                    for (var i, o = Object.keys(t)[Symbol.iterator](); !(r = (i = o.next()).done); r = !0) {
                                        var l = i.value;
                                        if (!ev(l)) return !1
                                    }
                                } catch (e) {
                                    n = !0, a = e
                                } finally {
                                    try {
                                        r || null == o.return || o.return()
                                    } finally {
                                        if (n) throw a
                                    }
                                }
                            }
                            return !0
                        }(s, l)) return void a("@rbx/web-telemetry: invalid event name or attribute key", {
                        name: o,
                        attributes: l
                    });
                    var u = null != c ? c : 1;
                    if (!Number.isFinite(u)) return void a("@rbx/web-telemetry: value must be a finite number", {
                        name: o,
                        attributes: l
                    });
                    var f = l && Object.keys(l).length > 0 ? l : void 0;
                    i.push({
                        name: s,
                        attributes: f,
                        value: u,
                        timestampMs: BigInt(Date.now())
                    }), i.length >= r ? (void 0 !== t && (clearTimeout(t), t = void 0), eg(i.splice(0, r))) : void 0 === t && (t = setTimeout(function() {
                        for (t = void 0; i.length > 0;) eg(i.splice(0, r))
                    }, n))
                }
        }("Catalog"),
        captureException: function(e, t) {
            var r;
            console.error(e, t), null == (r = "u" < typeof window ? void 0 : window.Sentry) || r.captureException(e, t ? {
                extra: t
            } : void 0)
        }
    });
    eS.trackCounter;
    var ej = eS.trackError;

    function eI(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function eN(e, t, r, n, a, i, o) {
        try {
            var l = e[i](o),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, a)
    }

    function eO(e) {
        return function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, a) {
                var i = e.apply(t, r);

                function o(e) {
                    eN(i, n, a, o, l, "next", e)
                }

                function l(e) {
                    eN(i, n, a, o, l, "throw", e)
                }
                o(void 0)
            })
        }
    }

    function eA(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != a) {
                var i = [],
                    o = !0,
                    l = !1;
                try {
                    for (a = a.call(e); !(o = (r = a.next()).done) && (i.push(r.value), !t || i.length !== t); o = !0);
                } catch (e) {
                    l = !0, n = e
                } finally {
                    try {
                        o || null == a.return || a.return()
                    } finally {
                        if (l) throw n
                    }
                }
                return i
            }
        }(e, t) || function(e, t) {
            if (e) {
                if ("string" == typeof e) return eI(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eI(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function eP(e, t) {
        var r, n, a, i = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
            l = Object.defineProperty;
        return l(o, "next", {
            value: c(0)
        }), l(o, "throw", {
            value: c(1)
        }), l(o, "return", {
            value: c(2)
        }), "function" == typeof Symbol && l(o, Symbol.iterator, {
            value: function() {
                return this
            }
        }), o;

        function c(l) {
            return function(c) {
                var s = [l, c];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, s[0] && (i = 0)), i;) try {
                    if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                    switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                        case 0:
                        case 1:
                            a = s;
                            break;
                        case 4:
                            return i.label++, {
                                value: s[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = s[1], s = [0];
                            continue;
                        case 7:
                            s = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                i.label = s[1];
                                break
                            }
                            if (6 === s[0] && i.label < a[1]) {
                                i.label = a[1], a = s;
                                break
                            }
                            if (a && i.label < a[2]) {
                                i.label = a[2], i.ops.push(s);
                                break
                            }
                            a[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    s = t.call(e, i)
                } catch (e) {
                    s = [6, e], n = 0
                } finally {
                    r = a = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    }
    eS.trackCriticalError;
    var ek = ((t = {})[t.onSale = 0] = "onSale", t[t.offSale = 1] = "offSale", t[t.holding = 2] = "holding", t),
        eC = eA((0, d.createSystemFeedback)(), 2),
        eB = eC[0],
        eL = eC[1],
        eT = (0, m.withTranslations)(function(e) {
            var t = e.itemId,
                r = e.isBundle,
                n = e.translate,
                a = eA((0, l.useState)([]), 2),
                i = a[0],
                s = a[1],
                u = eA((0, l.useState)(!1), 2),
                f = (u[0], u[1]),
                d = eA((0, l.useState)(!1), 2),
                m = d[0],
                v = d[1],
                p = eA((0, l.useState)(), 2),
                w = p[0],
                x = p[1],
                S = eA((0, l.useState)(!1), 2),
                j = S[0],
                N = S[1],
                k = eA((0, l.useState)(!1), 2),
                C = k[0],
                B = k[1],
                L = eA((0, l.useState)(), 2),
                T = L[0],
                E = L[1],
                R = eA((0, l.useState)(0), 2),
                M = (R[0], R[1]),
                V = eA((0, l.useState)(""), 2),
                U = (V[0], V[1]),
                _ = eA((0, l.useState)(), 2),
                H = _[0],
                G = _[1],
                $ = eA((0, l.useState)(!1), 2),
                z = $[0],
                W = $[1],
                Z = eA((0, l.useState)(h.NONE), 2),
                q = Z[0],
                J = Z[1],
                X = eA((0, l.useState)(1), 2),
                Y = X[0],
                K = X[1],
                Q = eA((0, l.useState)(30), 2),
                ee = Q[0],
                et = Q[1],
                er = eA((0, l.useState)(), 2),
                en = er[0],
                ea = er[1],
                ei = (0, l.useCallback)(function(e) {
                    return O(e)
                }, []),
                eo = (0, l.useCallback)(function(e, t) {
                    return eO(function() {
                        var r, n, a, i;
                        return eP(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    if (!t) return [3, 2];
                                    return [4, P(t)];
                                case 1:
                                    return i = o.sent(), [3, 4];
                                case 2:
                                    return [4, A(e)];
                                case 3:
                                    i = o.sent(), o.label = 4;
                                case 4:
                                    return ea(null != (r = null == (a = i) || null == (n = a.data) ? void 0 : n.recentAveragePrice) ? r : void 0), [2]
                            }
                        })
                    })()
                }, []),
                el = (0, l.useCallback)(function() {
                    return y.ItemDetailsHydrationService.getItemDetails([{
                        id: t,
                        itemType: r ? "bundle" : "asset"
                    }], void 0, !0)
                }, []),
                ec = (0, l.useCallback)(function(e, t, r) {
                    return I(e, t, 500, r)
                }, []),
                es = (0, l.useCallback)(function(e) {
                    var t = {};
                    return t.collectibleInstanceId = e.collectibleInstanceId, t.collectibleItemId = e.collectibleItemId, t.collectibleProductId = e.collectibleProductId, t.serialNumber = e.serialNumber, t.price = e.price, "OffSale" === e.saleState && (t.price = void 0), e.isHeld ? (t.isInHolding = !0, f(!0)) : v(!0), t
                }, []),
                eu = (0, l.useCallback)(function() {
                    return eO(function() {
                        var e, n, a, i, o, l, c, u;
                        return eP(this, function(f) {
                            switch (f.label) {
                                case 0:
                                    return [4, el()];
                                case 1:
                                    if (J((e = f.sent())[0].collectibleItemDetails ? e[0].collectibleItemDetails.resaleRestriction : h.NONE), n = e[0].collectibleItemId, a = e[0].name, i = e[0].creatorTargetId, o = void 0 !== n, M(i), U(e[0].creatorType), W(o), n && G(n), E(a), (!r || n) && eo(t, n).catch(function() {
                                            ea(void 0)
                                        }), !n) return s([]), [2];
                                    return [4, ei(n)];
                                case 2:
                                    return et((l = f.sent()).data.resalePercentageFee), l && K(l.data.priceFloor), [4, ec(b.authenticatedUser.id, n, void 0)];
                                case 3:
                                    return (c = f.sent()) && (u = [], c.data.itemInstances.forEach(function(e) {
                                        u.push(es(e))
                                    }), s(u)), [2]
                            }
                        })
                    })()
                }, []),
                ef = function(e, t) {
                    1 === t ? (x(e), N(!0)) : 0 === t && (x(e), B(!0))
                },
                ed = (0, l.useCallback)(function(e) {
                    e ? (eL.success(n("Response.PlacedOnSaleSuccess")), eu().catch(function(e) {
                        ej("LimitedInventoryLoadFailed", null, e), window.location.reload()
                    })) : !1 === e && eL.warning(n("Response.PlacedOnSaleFailure")), N(!1)
                }, []),
                eb = (0, l.useCallback)(function(e) {
                    e ? (eL.success(n("Response.TakenOffSaleSuccess")), eu().catch(function(e) {
                        ej("LimitedInventoryLoadFailed", null, e), window.location.reload()
                    })) : !1 === e && eL.warning(n("Response.TakenOffSaleFailure")), B(!1)
                }, []);
            return ((0, l.useEffect)(function() {
                eu().catch(function(e) {
                    ej("LimitedInventoryLoadFailed", null, e), s([])
                })
            }, []), z && void 0 === H) ? (0, o.jsx)("div", {}) : (0, o.jsxs)(c().Fragment, {
                children: [(0, o.jsx)(eB, {}), (0, o.jsxs)("div", {
                    className: "item-details-limited-inventory",
                    children: [(0, o.jsx)("span", {
                        className: "font-header-1",
                        children: n("Label.ItemOwnedCount", {
                            itemCount: i.length
                        })
                    }), !b.authenticatedUser.isPremiumUser && m && q !== h.DISABLED && (0, o.jsx)("span", {
                        className: "premium-only-tooltip",
                        children: (0, o.jsx)("span", {
                            className: "font-caption-body text",
                            children: n("Label.PremiumForResell")
                        })
                    }), (null == i ? void 0 : i.length) ? i.map(function(e) {
                        return (0, o.jsx)(g, {
                            collectibleItemData: e,
                            itemName: T,
                            isLimited2: z,
                            isFirstItem: e === i[0],
                            onButtonAction: ef,
                            resaleRestriction: q
                        }, e.collectibleInstanceId)
                    }) : (0, o.jsx)("span", {
                        className: "item-details-limited-inventory-empty-text",
                        children: (0, o.jsx)("span", {
                            className: "text",
                            children: n("Response.NoItemsFound")
                        })
                    }), !1, (0, o.jsx)(D, {
                        collectibleItemData: w,
                        isLimited2: z,
                        showModal: j,
                        resalePriceFloor: Y,
                        recentAveragePrice: en,
                        onPlaceOnSaleActionComplete: ed,
                        onModalClosed: function() {
                            N(!1)
                        },
                        collectibleResaleFeePercentage: ee
                    }), (0, o.jsx)(F, {
                        collectibleItemData: w,
                        isLimited2: z,
                        showModal: C,
                        onTakeOffSaleActionComplete: eb,
                        onModalClosed: function() {
                            B(!1)
                        }
                    })]
                })]
            })
        }, p),
        eD = function(e) {
            var t = e.getAttribute("data-target-id");
            return t ? parseInt(t, 10) : 0
        },
        eE = function(e) {
            var t;
            return (null == (t = e.getAttribute("data-is-bundle")) ? void 0 : t.toString().toLowerCase()) === "true"
        };
    u()(function() {
        ! function e() {
            var t = document.getElementById("item-details-limited-inventory-container");
            t ? (0, f.renderWithErrorBoundary)((0, o.jsx)(eT, {
                itemId: eD(t),
                isBundle: eE(t)
            }), t) : window.requestAnimationFrame(e)
        }()
    })
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemDetailsLimitedInventory");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemDetailsLimitedInventory-988d60f0252dc6bc.js.map