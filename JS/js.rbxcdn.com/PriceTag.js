! function() {
    var n = {
            779: function(e, t) {
                var n;
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                ! function() {
                    "use strict";
                    var i = {}.hasOwnProperty;

                    function c() {
                        for (var e = [], t = 0; t < arguments.length; t++) {
                            var n = arguments[t];
                            if (n) {
                                var r, o = typeof n;
                                if ("string" == o || "number" == o) e.push(n);
                                else if (Array.isArray(n)) !n.length || (r = c.apply(null, n)) && e.push(r);
                                else if ("object" == o)
                                    if (n.toString === Object.prototype.toString || n.toString.toString().includes("[native code]"))
                                        for (var a in n) i.call(n, a) && n[a] && e.push(a);
                                    else e.push(n.toString())
                            }
                        }
                        return e.join(" ")
                    }
                    e.exports ? (c.default = c, e.exports = c) : void 0 === (n = function() {
                        return c
                    }.apply(t, [])) || (e.exports = n)
                }()
            }
        },
        r = {};

    function g(e) {
        if (r[e]) return r[e].exports;
        var t = r[e] = {
            exports: {}
        };
        return n[e](t, t.exports, g), t.exports
    }
    g.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return g.d(t, {
                a: t
            }), t
        }, g.d = function(e, t) {
            for (var n in t) g.o(t, n) && !g.o(e, n) && Object.defineProperty(e, n, {
                enumerable: !0,
                get: t[n]
            })
        }, g.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        },
        function() {
            "use strict";
            var e = React,
                l = g.n(e),
                r = ReactDOM,
                t = CoreUtilities,
                n = PropTypes,
                e = g.n(n),
                u = window.EventTracker ? EventTracker : {
                    fireEvent: console.log,
                    start: console.log,
                    endSuccess: console.log,
                    endCancel: console.log,
                    endFailure: console.log
                },
                n = g(779),
                s = g.n(n),
                p = "ar-",
                d = "en-",
                f = ["JPY"],
                m = {
                    PRICE_DATA_NOT_VALID: (n = "PriceTag") + "DataNotValid",
                    NUMBER_FORMAT_LOCALE_EXCEPTION: n + "NumberFormatLocaleException",
                    ARABIC_LOCALE_TRIGGERED: n + "ArabicLocale"
                };

            function o(e) {
                var t = e.amount,
                    n = e.currencyCode,
                    r = e.tagClassName,
                    e = t < 0,
                    o = Math.abs(t),
                    a = "" + o + n,
                    r = s()("price-tag", r);
                try {
                    var i = (c = Intl.NumberFormat().resolvedOptions().locale).startsWith(p) ? ((0, u.fireEvent)(m.ARABIC_LOCALE_TRIGGERED), c.replace(p, d)) : c,
                        c = {
                            style: "currency",
                            currency: n,
                            notation: "standard"
                        };
                    1e4 <= o && !f.includes(n) && (c.minimumFractionDigits = 0, c.maximumFractionDigits = 2, c.maximumSignificantDigits = 21, c.notation = "compact"), a = Intl.NumberFormat(i, c).format(o)
                } catch (e) {
                    (0, u.fireEvent)(m.NUMBER_FORMAT_LOCALE_EXCEPTION)
                }
                return l().createElement("div", {
                    className: "d-flex-inline gap-1 justify-content-start align-items-center"
                }, e && l().createElement("span", {
                    className: r
                }, "-"), l().createElement("span", {
                    className: r
                }, a))
            }
            o.propTypes = {
                amount: e().number.isRequired,
                currencyCode: e().string.isRequired
            };
            var a = o,
                i = function() {
                    return (i = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function c(e) {
                var t, n = e.containerDataset,
                    r = e.options,
                    e = null !== (e = null == r ? void 0 : r.amount) && void 0 !== e ? e : parseFloat(null !== (t = null == n ? void 0 : n.amount) && void 0 !== t ? t : String()),
                    n = null !== (t = null == r ? void 0 : r.currencyCode) && void 0 !== t ? t : null == n ? void 0 : n.currencyCode;
                return !n || !e && 0 !== e || Number.isNaN(e) ? ((0, u.fireEvent)(m.PRICE_DATA_NOT_VALID), null) : l().createElement(a, i({}, r, {
                    amount: e,
                    currencyCode: n
                }))
            }
            c.defaultProps = {
                containerDataset: {},
                options: {}
            }, c.propTypes = {
                containerDataset: e().shape({
                    amount: e().string,
                    currencyCode: e().string
                }),
                options: e().shape({
                    amount: e().number,
                    currencyCode: e().string,
                    tagClassName: e().string
                })
            };
            var v = c;
            (0, t.ready)(function() {
                window.addEventListener("price-tag:render", function(e) {
                    var n, e = e.detail;
                    e = null !== (e = null == (n = e) ? void 0 : n.targetSelector) && void 0 !== e ? e : ".fiat-price-tag", 0 === (e = document.querySelectorAll(e)).length && (e = document.querySelectorAll("#fiat-price-tag")), e.forEach(function(e) {
                        var t = e.dataset;
                        (0, r.render)(l().createElement(v, {
                            containerDataset: t,
                            options: n
                        }), e)
                    })
                })
            })
        }()
}();
//# sourceMappingURL=https://js.rbxcdn.com/62079e6baeeb2d50aa7d484bbec1f6d6-priceTag.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PriceTag");