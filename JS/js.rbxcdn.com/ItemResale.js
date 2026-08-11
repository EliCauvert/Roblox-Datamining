! function() {
    var t = {
            2291: function(t, e, i) {
                var r = {
                    "./assetResaleDataPaneComponent.js": 6502,
                    "./assetResalePaneComponent.js": 4430,
                    "./lineChartComponent.js": 6164,
                    "./resellersListComponent.js": 7751,
                    "./resellersPaneComponent.js": 6421,
                    "./verticalBarChartComponent.js": 6953
                };

                function n(t) {
                    var e = s(t);
                    return i(e)
                }

                function s(t) {
                    if (!i.o(r, t)) {
                        var e = new Error("Cannot find module '" + t + "'");
                        throw e.code = "MODULE_NOT_FOUND", e
                    }
                    return r[t]
                }
                n.keys = function() {
                    return Object.keys(r)
                }, n.resolve = s, t.exports = n, n.id = 2291
            },
            7020: function(t, e, i) {
                var r = {
                    "./experimentConstants.js": 3698,
                    "./resellersConstants.js": 5268
                };

                function n(t) {
                    var e = s(t);
                    return i(e)
                }

                function s(t) {
                    if (!i.o(r, t)) {
                        var e = new Error("Cannot find module '" + t + "'");
                        throw e.code = "MODULE_NOT_FOUND", e
                    }
                    return r[t]
                }
                n.keys = function() {
                    return Object.keys(r)
                }, n.resolve = s, t.exports = n, n.id = 7020
            },
            7904: function(t, e, i) {
                var r = {
                    "./assetResaleDataPaneController.js": 1914,
                    "./assetResalePaneController.js": 3238,
                    "./lineChartController.js": 6816,
                    "./resellersListController.js": 4242,
                    "./resellersPaneController.js": 4892,
                    "./verticalBarChartController.js": 5009
                };

                function n(t) {
                    var e = s(t);
                    return i(e)
                }

                function s(t) {
                    if (!i.o(r, t)) {
                        var e = new Error("Cannot find module '" + t + "'");
                        throw e.code = "MODULE_NOT_FOUND", e
                    }
                    return r[t]
                }
                n.keys = function() {
                    return Object.keys(r)
                }, n.resolve = s, t.exports = n, n.id = 7904
            },
            5727: function(t, e, i) {
                var r = {
                    "./experimentationService.js": 6066,
                    "./highchartsService.js": 6361,
                    "./resaleService.js": 4960
                };

                function n(t) {
                    var e = s(t);
                    return i(e)
                }

                function s(t) {
                    if (!i.o(r, t)) {
                        var e = new Error("Cannot find module '" + t + "'");
                        throw e.code = "MODULE_NOT_FOUND", e
                    }
                    return r[t]
                }
                n.keys = function() {
                    return Object.keys(r)
                }, n.resolve = s, t.exports = n, n.id = 5727
            },
            744: function(t, e, i) {
                var r = {
                    "./components/templates/assetResaleDataPane.html": 1481,
                    "./components/templates/assetResalePane.html": 9081,
                    "./components/templates/lineChart.html": 839,
                    "./components/templates/resellersList.html": 4441,
                    "./components/templates/resellersPane.html": 1228,
                    "./components/templates/verticalBarChart.html": 7956
                };

                function n(t) {
                    var e = s(t);
                    return i(e)
                }

                function s(t) {
                    if (!i.o(r, t)) {
                        var e = new Error("Cannot find module '" + t + "'");
                        throw e.code = "MODULE_NOT_FOUND", e
                    }
                    return r[t]
                }
                n.keys = function() {
                    return Object.keys(r)
                }, n.resolve = s, t.exports = n, n.id = 744
            },
            1060: function(t, e, i) {
                function r(t) {
                    return r = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(t) {
                        return typeof t
                    } : function(t) {
                        return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t
                    }, r(t)
                }
                var n, s;
                t = i.nmd(t), n = "undefined" != typeof window ? window : this, s = function(t) {
                    function e(e, i) {
                        var r = "Highcharts error #" + e + ": www.highcharts.com/errors/" + e;
                        if (i) throw Error(r);
                        t.console && console.log(r)
                    }

                    function i(t, e, i) {
                        this.options = e, this.elem = t, this.prop = i
                    }

                    function n() {
                        var t, e, i = arguments,
                            n = {},
                            s = function t(e, i) {
                                var n, s;
                                for (s in "object" !== r(e) && (e = {}), i) i.hasOwnProperty(s) && (n = i[s], e[s] = nt.isObject(n, !0) && "renderTo" !== s && "number" != typeof n.nodeType ? t(e[s] || {}, n) : i[s]);
                                return e
                            };
                        for (!0 === i[0] && (n = i[1], i = Array.prototype.slice.call(i, 2)), e = i.length, t = 0; t < e; t++) n = s(n, i[t]);
                        return n
                    }

                    function s(t, e) {
                        return parseInt(t, e || 10)
                    }

                    function o(t) {
                        return "string" == typeof t
                    }

                    function a(t) {
                        return "[object Array]" === (t = Object.prototype.toString.call(t)) || "[object Array Iterator]" === t
                    }

                    function l(t, e) {
                        for (var i = t.length; i--;)
                            if (t[i] === e) {
                                t.splice(i, 1);
                                break
                            }
                    }

                    function h(t) {
                        return t !== B && null !== t
                    }

                    function c(t, e, i) {
                        var r, n;
                        if (o(e)) h(i) ? t.setAttribute(e, i) : t && t.getAttribute && (n = t.getAttribute(e));
                        else if (h(e) && Jt(e))
                            for (r in e) t.setAttribute(r, e[r]);
                        return n
                    }

                    function d(t) {
                        return a(t) ? t : [t]
                    }

                    function u(t, e, i) {
                        if (e) return setTimeout(t, e, i);
                        t.call(0, i)
                    }

                    function p(t, e) {
                        xt && !St && e && e.opacity !== B && (e.filter = "alpha(opacity=" + 100 * e.opacity + ")"), qt(t.style, e)
                    }

                    function f(t, e, i, r, n) {
                        return t = st.createElement(t), e && qt(t, e), n && p(t, {
                            padding: 0,
                            border: "none",
                            margin: 0
                        }), i && p(t, i), r && r.appendChild(t), t
                    }

                    function g(t, e) {
                        var i = function() {};
                        return i.prototype = new t, qt(i.prototype, e), i
                    }

                    function m(t, e, i) {
                        return Array((e || 2) + 1 - String(t).length).join(i || 0) + t
                    }

                    function v(t) {
                        return 6e4 * (Y && Y(t) || W || 0)
                    }

                    function y(t, e) {
                        for (var i, r, n, s, o, a = "{", l = !1, h = []; - 1 !== (a = t.indexOf(a));) {
                            if (i = t.slice(0, a), l) {
                                for (o = (n = (r = i.split(":")).shift().split(".")).length, i = e, s = 0; s < o; s++) i = i[n[s]];
                                r.length && (r = r.join(":"), n = /\.([0-9])/, s = N.lang, o = void 0, /f$/.test(r) ? (o = (o = r.match(n)) ? o[1] : -1, null !== i && (i = nt.numberFormat(i, o, s.decimalPoint, r.indexOf(",") > -1 ? s.thousandsSep : ""))) : i = $(r, i))
                            }
                            h.push(i), t = t.slice(a + 1), a = (l = !l) ? "}" : "{"
                        }
                        return h.push(t), h.join("")
                    }

                    function x(t) {
                        return ot.pow(10, lt(ot.log(t) / ot.LN10))
                    }

                    function b(t, e, i, r, n) {
                        var s, o = t;
                        for (s = t / (i = te(i, 1)), e || (e = [1, 2, 2.5, 5, 10], !1 === r && (1 === i ? e = [1, 2, 5, 10] : i <= .1 && (e = [1 / i]))), r = 0; r < e.length && (o = e[r], !(n && o * i >= t || !n && s <= (e[r] + (e[r + 1] || e[r])) / 2)); r++);
                        return o *= i
                    }

                    function w(t, e) {
                        var i, r, n = t.length;
                        for (r = 0; r < n; r++) t[r].safeI = r;
                        for (t.sort((function(t, r) {
                                return 0 === (i = e(t, r)) ? t.safeI - r.safeI : i
                            })), r = 0; r < n; r++) delete t[r].safeI
                    }

                    function k(t) {
                        for (var e = t.length, i = t[0]; e--;) t[e] < i && (i = t[e]);
                        return i
                    }

                    function C(t) {
                        for (var e = t.length, i = t[0]; e--;) t[e] > i && (i = t[e]);
                        return i
                    }

                    function T(t, e) {
                        for (var i in t) t[i] && t[i] !== e && t[i].destroy && t[i].destroy(), delete t[i]
                    }

                    function S(t) {
                        F || (F = f(Ot)), t && F.appendChild(t), F.innerHTML = ""
                    }

                    function A(t, e) {
                        return parseFloat(t.toPrecision(e || 14))
                    }

                    function P(t, e) {
                        e.renderer.globalAnimation = te(t, e.animation)
                    }

                    function D(t) {
                        return Jt(t) ? n(t) : {
                            duration: t ? 500 : 0
                        }
                    }

                    function I() {
                        var e = N.global,
                            i = e.useUTC,
                            r = i ? "getUTC" : "get",
                            n = i ? "setUTC" : "set";
                        X = e.Date || t.Date, W = i && e.timezoneOffset, Y = i && e.getTimezoneOffset, G = function(t, e, r, n, s, o) {
                            var a;
                            return i ? (a = X.UTC.apply(0, arguments), a += v(a)) : a = new X(t, e, te(r, 1), te(n, 0), te(s, 0), te(o, 0)).getTime(), a
                        }, j = r + "Minutes", U = r + "Hours", V = r + "Day", _ = r + "Date", K = r + "Month", Z = r + "FullYear", q = n + "Milliseconds", J = n + "Seconds", Q = n + "Minutes", tt = n + "Hours", et = n + "Date", it = n + "Month", rt = n + "FullYear"
                    }

                    function L(t) {
                        if (!(this instanceof L)) return new L(t);
                        this.init(t)
                    }

                    function M() {}

                    function R(t, e, i, r) {
                        this.axis = t, this.pos = e, this.type = i || "", this.isNew = !0, !i && !r && this.addLabel()
                    }

                    function O(t, e, i, r, n) {
                        var s = t.chart.inverted;
                        this.axis = t, this.isNegative = i, this.options = e, this.x = r, this.total = null, this.points = {}, this.stack = n, this.rightCliff = this.leftCliff = 0, this.alignOptions = {
                            align: e.align || (s ? i ? "left" : "right" : "center"),
                            verticalAlign: e.verticalAlign || (s ? "middle" : i ? "bottom" : "top"),
                            y: te(e.y, s ? 4 : i ? 14 : -6),
                            x: te(e.x, s ? i ? -6 : 6 : 0)
                        }, this.textAlign = e.textAlign || (s ? i ? "right" : "left" : "center")
                    }
                    var B, E, z, F, N, $, H, X, G, W, Y, j, U, V, _, K, Z, q, J, Q, tt, et, it, rt, nt, st = t.document,
                        ot = Math,
                        at = ot.round,
                        lt = ot.floor,
                        ht = ot.ceil,
                        ct = ot.max,
                        dt = ot.min,
                        ut = ot.abs,
                        pt = ot.cos,
                        ft = ot.sin,
                        gt = ot.PI,
                        mt = 2 * gt / 360,
                        vt = t.navigator && t.navigator.userAgent || "",
                        yt = t.opera,
                        xt = /(msie|trident|edge)/i.test(vt) && !yt,
                        bt = st && 8 === st.documentMode,
                        wt = !xt && /AppleWebKit/.test(vt),
                        kt = /Firefox/.test(vt),
                        Ct = /(Mobile|Android|Windows Phone)/.test(vt),
                        Tt = "http://www.w3.org/2000/svg",
                        St = st && st.createElementNS && !!st.createElementNS(Tt, "svg").createSVGRect,
                        At = kt && parseInt(vt.split("Firefox/")[1], 10) < 4,
                        Pt = st && !St && !xt && !!st.createElement("canvas").getContext,
                        Dt = {},
                        It = 0,
                        Lt = function() {},
                        Mt = [],
                        Rt = 0,
                        Ot = "div",
                        Bt = "M",
                        Et = "L",
                        zt = /[0-9]/g,
                        Ft = ["plotTop", "marginRight", "marginBottom", "plotLeft"],
                        Nt = {};
                    (nt = t.Highcharts ? e(16, !0) : {
                        win: t
                    }).seriesTypes = Nt;
                    var $t, Ht, Xt, Gt, Wt, Yt, jt, Ut, Vt, _t, Kt, Zt = [];
                    i.prototype = {
                        dSetter: function() {
                            var t, e = this.paths[0],
                                i = this.paths[1],
                                r = [],
                                n = this.now,
                                s = e.length;
                            if (1 === n) r = this.toD;
                            else if (s === i.length && n < 1)
                                for (; s--;) t = parseFloat(e[s]), r[s] = isNaN(t) ? e[s] : n * parseFloat(i[s] - t) + t;
                            else r = i;
                            this.elem.attr("d", r)
                        },
                        update: function() {
                            var t = this.elem,
                                e = this.prop,
                                i = this.now,
                                r = this.options.step;
                            this[e + "Setter"] ? this[e + "Setter"]() : t.attr ? t.element && t.attr(e, i) : t.style[e] = i + this.unit, r && r.call(t, i, this)
                        },
                        run: function(t, e, i) {
                            var r, n = this,
                                s = function t(e) {
                                    return !t.stopped && n.step(e)
                                };
                            this.startTime = +new X, this.start = t, this.end = e, this.unit = i, this.now = this.start, this.pos = 0, s.elem = this.elem, s() && 1 === Zt.push(s) && (s.timerId = setInterval((function() {
                                for (r = 0; r < Zt.length; r++) Zt[r]() || Zt.splice(r--, 1);
                                Zt.length || clearInterval(s.timerId)
                            }), 13))
                        },
                        step: function(t) {
                            var e, i = +new X,
                                r = this.options;
                            e = this.elem;
                            var n, s = r.complete,
                                o = r.duration,
                                a = r.curAnim;
                            if (e.attr && !e.element) e = !1;
                            else if (t || i >= o + this.startTime) {
                                for (n in this.now = this.end, this.pos = 1, this.update(), t = a[this.prop] = !0, a) !0 !== a[n] && (t = !1);
                                t && s && s.call(e), e = !1
                            } else this.pos = r.easing((i - this.startTime) / o), this.now = this.start + (this.end - this.start) * this.pos, this.update(), e = !0;
                            return e
                        },
                        initPath: function(t, e, i) {
                            function r(t) {
                                for (h = t.length; h--;)(t[h] === Bt || t[h] === Et) && t.splice(h + 1, 0, t[h + 1], t[h + 2], t[h + 1], t[h + 2])
                            }

                            function n(t, e) {
                                for (; t.length < a;) {
                                    t[0] = e[a - t.length];
                                    var i = t.slice(0, f);
                                    [].splice.apply(t, [0, 0].concat(i)), g && (i = t.slice(t.length - f), [].splice.apply(t, [t.length, 0].concat(i)), h--)
                                }
                                t[0] = "M"
                            }

                            function s(t, e) {
                                for (var i = (a - t.length) / f; i > 0 && i--;)(l = t.slice().splice(t.length / m - f, f * m))[0] = e[a - f - i * f], p && (l[f - 6] = l[f - 2], l[f - 5] = l[f - 1]), [].splice.apply(t, [t.length / m, 0].concat(l)), g && i--
                            }
                            e = e || "";
                            var o, a, l, h, c, d = t.startX,
                                u = t.endX,
                                p = e.indexOf("C") > -1,
                                f = p ? 7 : 3,
                                g = (e = e.split(" "), i = i.slice(), t.isArea),
                                m = g ? 2 : 1;
                            if (p && (r(e), r(i)), d && u) {
                                for (h = 0; h < d.length; h++) {
                                    if (d[h] === u[0]) {
                                        o = h;
                                        break
                                    }
                                    if (d[0] === u[u.length - d.length + h]) {
                                        o = h, c = !0;
                                        break
                                    }
                                }
                                void 0 === o && (e = [])
                            }
                            return e.length && nt.isNumber(o) && (a = i.length + o * m * f, c ? (n(e, i), s(i, e)) : (n(i, e), s(e, i))), [e, i]
                        }
                    };
                    var qt = nt.extend = function(t, e) {
                            var i;
                            for (i in t || (t = {}), e) t[i] = e[i];
                            return t
                        },
                        Jt = nt.isObject = function(t, e) {
                            return t && "object" === r(t) && (!e || !a(t))
                        },
                        Qt = nt.isNumber = function(t) {
                            return "number" == typeof t && !isNaN(t)
                        },
                        te = nt.pick = function() {
                            var t, e, i = arguments,
                                r = i.length;
                            for (t = 0; t < r; t++)
                                if ((e = i[t]) !== B && null !== e) return e
                        },
                        ee = nt.wrap = function(t, e, i) {
                            var r = t[e];
                            t[e] = function() {
                                var t = Array.prototype.slice.call(arguments);
                                return t.unshift(r), i.apply(this, t)
                            }
                        };
                    $ = function(t, e, i) {
                        if (!h(e) || isNaN(e)) return N.lang.invalidDate || "";
                        t = te(t, "%Y-%m-%d %H:%M:%S");
                        var r, n = (p = new X(e - v(e)))[U](),
                            s = p[V](),
                            o = p[_](),
                            a = p[K](),
                            l = p[Z](),
                            c = N.lang,
                            d = c.weekdays,
                            u = c.shortWeekdays,
                            p = qt({
                                a: u ? u[s] : d[s].substr(0, 3),
                                A: d[s],
                                d: m(o),
                                e: m(o, 2, " "),
                                w: s,
                                b: c.shortMonths[a],
                                B: c.months[a],
                                m: m(a + 1),
                                y: l.toString().substr(2, 2),
                                Y: l,
                                H: m(n),
                                k: n,
                                I: m(n % 12 || 12),
                                l: n % 12 || 12,
                                M: m(p[j]()),
                                p: n < 12 ? "AM" : "PM",
                                P: n < 12 ? "am" : "pm",
                                S: m(p.getSeconds()),
                                L: m(at(e % 1e3), 3)
                            }, nt.dateFormats);
                        for (r in p)
                            for (; - 1 !== t.indexOf("%" + r);) t = t.replace("%" + r, "function" == typeof p[r] ? p[r](e) : p[r]);
                        return i ? t.substr(0, 1).toUpperCase() + t.substr(1) : t
                    }, H = {
                        millisecond: 1,
                        second: 1e3,
                        minute: 6e4,
                        hour: 36e5,
                        day: 864e5,
                        week: 6048e5,
                        month: 24192e5,
                        year: 314496e5
                    }, nt.numberFormat = function(t, e, i, r) {
                        t = +t || 0, e = +e;
                        var n, o, a = N.lang,
                            l = (t.toString().split(".")[1] || "").length,
                            h = Math.abs(t);
                        return -1 === e ? e = Math.min(l, 20) : Qt(e) || (e = 2), o = (n = String(s(h.toFixed(e)))).length > 3 ? n.length % 3 : 0, i = te(i, a.decimalPoint), r = te(r, a.thousandsSep), t = t < 0 ? "-" : "", t += o ? n.substr(0, o) + r : "", t += n.substr(o).replace(/(\d{3})(?=\d)/g, "$1" + r), e && (t += i + (r = Math.abs(h - n + Math.pow(10, -Math.max(e, l) - 1))).toFixed(e).slice(2)), t
                    }, Math.easeInOutSine = function(t) {
                        return -.5 * (Math.cos(Math.PI * t) - 1)
                    }, $t = function(e, i) {
                        var r;
                        return "width" === i ? Math.min(e.offsetWidth, e.scrollWidth) - $t(e, "padding-left") - $t(e, "padding-right") : "height" === i ? Math.min(e.offsetHeight, e.scrollHeight) - $t(e, "padding-top") - $t(e, "padding-bottom") : (r = t.getComputedStyle(e, void 0)) && s(r.getPropertyValue(i))
                    }, Ht = function(t, e) {
                        return e.indexOf ? e.indexOf(t) : [].indexOf.call(e, t)
                    }, Gt = function(t, e) {
                        return [].filter.call(t, e)
                    }, Yt = function(t, e) {
                        for (var i = [], r = 0, n = t.length; r < n; r++) i[r] = e.call(t[r], t[r], r, t);
                        return i
                    }, Wt = function(e) {
                        var i = st.documentElement;
                        return {
                            top: (e = e.getBoundingClientRect()).top + (t.pageYOffset || i.scrollTop) - (i.clientTop || 0),
                            left: e.left + (t.pageXOffset || i.scrollLeft) - (i.clientLeft || 0)
                        }
                    }, Kt = function(t) {
                        for (var e = Zt.length; e--;) Zt[e].elem === t && (Zt[e].stopped = !0)
                    }, Xt = function(t, e) {
                        return Array.prototype.forEach.call(t, e)
                    }, jt = function(e, i, r) {
                        function n(i) {
                            i.target = i.srcElement || t, r.call(e, i)
                        }
                        var s = e.hcEvents = e.hcEvents || {};
                        e.addEventListener ? e.addEventListener(i, r, !1) : e.attachEvent && (e.hcEventsIE || (e.hcEventsIE = {}), e.hcEventsIE[r.toString()] = n, e.attachEvent("on" + i, n)), s[i] || (s[i] = []), s[i].push(r)
                    }, Ut = function(t, e, i) {
                        function r(e, i) {
                            t.removeEventListener ? t.removeEventListener(e, i, !1) : t.attachEvent && (i = t.hcEventsIE[i.toString()], t.detachEvent("on" + e, i))
                        }

                        function n() {
                            var i, n, s;
                            if (t.nodeName)
                                for (s in e ? (i = {})[e] = !0 : i = a, i)
                                    if (a[s])
                                        for (n = a[s].length; n--;) r(s, a[s][n])
                        }
                        var s, o, a = t.hcEvents;
                        a && (e ? (s = a[e] || [], i ? ((o = Ht(i, s)) > -1 && (s.splice(o, 1), a[e] = s), r(e, i)) : (n(), a[e] = [])) : (n(), t.hcEvents = {}))
                    }, Vt = function(t, e, i, r) {
                        var n, s, o;
                        if (n = t.hcEvents, i = i || {}, st.createEvent && (t.dispatchEvent || t.fireEvent))(n = st.createEvent("Events")).initEvent(e, !0, !0), n.target = t, qt(n, i), t.dispatchEvent ? t.dispatchEvent(n) : t.fireEvent(e, n);
                        else if (n)
                            for (s = (n = n[e] || []).length, i.preventDefault || (i.preventDefault = function() {
                                    i.defaultPrevented = !0
                                }), i.target = t, i.type || (i.type = e), e = 0; e < s; e++)(o = n[e]) && !1 === o.call(t, i) && i.preventDefault();
                        r && !i.defaultPrevented && r(i)
                    }, _t = function(t, e, r) {
                        var s, o, a, l, h = "";
                        for (l in Jt(r) || (r = {
                                duration: (s = arguments)[2],
                                easing: s[3],
                                complete: s[4]
                            }), Qt(r.duration) || (r.duration = 400), r.easing = "function" == typeof r.easing ? r.easing : Math[r.easing] || Math.easeInOutSine, r.curAnim = n(e), e) a = new i(t, r, l), o = null, "d" === l ? (a.paths = a.initPath(t, t.d, e.d), a.toD = e.d, s = 0, o = 1) : t.attr ? s = t.attr(l) : (s = parseFloat($t(t, l)) || 0, "opacity" !== l && (h = "px")), o || (o = e[l]), o.match && o.match("px") && (o = o.replace(/px/g, "")), a.run(s, o, h)
                    }, t.jQuery && (t.jQuery.fn.highcharts = function() {
                        var t = [].slice.call(arguments);
                        if (this[0]) return t[0] ? (new(nt[o(t[0]) ? t.shift() : "Chart"])(this[0], t[0], t[1]), this) : Mt[c(this[0], "data-highcharts-chart")]
                    }), st && !st.defaultView && ($t = function(t, e) {
                        var i;
                        return i = {
                            width: "clientWidth",
                            height: "clientHeight"
                        } [e], t.style[e] ? s(t.style[e]) : ("opacity" === e && (e = "filter"), i ? (t.style.zoom = 1, Math.max(t[i] - 2 * $t(t, "padding"), 0)) : (i = t.currentStyle[e.replace(/\-(\w)/g, (function(t, e) {
                            return e.toUpperCase()
                        }))], "filter" === e && (i = i.replace(/alpha\(opacity=([0-9]+)\)/, (function(t, e) {
                            return e / 100
                        }))), "" === i ? 1 : s(i)))
                    }), Array.prototype.forEach || (Xt = function(t, e) {
                        for (var i = 0, r = t.length; i < r; i++)
                            if (!1 === e.call(t[i], t[i], i, t)) return i
                    }), Array.prototype.indexOf || (Ht = function(t, e) {
                        var i, r = 0;
                        if (e)
                            for (i = e.length; r < i; r++)
                                if (e[r] === t) return r;
                        return -1
                    }), Array.prototype.filter || (Gt = function(t, e) {
                        for (var i = [], r = 0, n = t.length; r < n; r++) e(t[r], r) && i.push(t[r]);
                        return i
                    }), nt.Fx = i, nt.inArray = Ht, nt.each = Xt, nt.grep = Gt, nt.offset = Wt, nt.map = Yt, nt.addEvent = jt, nt.removeEvent = Ut, nt.fireEvent = Vt, nt.animate = _t, nt.animObject = D, nt.stop = Kt;
                    var ie = (N = {
                            colors: "#7cb5ec,#434348,#90ed7d,#f7a35c,#8085e9,#f15c80,#e4d354,#2b908f,#f45b5b,#91e8e1".split(","),
                            symbols: ["circle", "diamond", "square", "triangle", "triangle-down"],
                            lang: {
                                loading: "Loading...",
                                months: "January,February,March,April,May,June,July,August,September,October,November,December".split(","),
                                shortMonths: "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec".split(","),
                                weekdays: "Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday".split(","),
                                decimalPoint: ".",
                                numericSymbols: "k,M,G,T,P,E".split(","),
                                resetZoom: "Reset zoom",
                                resetZoomTitle: "Reset zoom level 1:1",
                                thousandsSep: " "
                            },
                            global: {
                                useUTC: !0,
                                canvasToolsURL: "http://code.highcharts.com/modules/canvas-tools.js",
                                VMLRadialGradientURL: "http://code.highcharts.com/4.2.7/gfx/vml-radial-gradient.png"
                            },
                            chart: {
                                borderColor: "#4572A7",
                                borderRadius: 0,
                                defaultSeriesType: "line",
                                ignoreHiddenSeries: !0,
                                spacing: [10, 10, 15, 10],
                                backgroundColor: "#FFFFFF",
                                plotBorderColor: "#C0C0C0",
                                resetZoomButton: {
                                    theme: {
                                        zIndex: 20
                                    },
                                    position: {
                                        align: "right",
                                        x: -10,
                                        y: 10
                                    }
                                },
                                width: null,
                                height: null
                            },
                            title: {
                                text: "Chart title",
                                align: "center",
                                margin: 15,
                                style: {
                                    color: "#333333",
                                    fontSize: "18px"
                                },
                                widthAdjust: -44
                            },
                            subtitle: {
                                text: "",
                                align: "center",
                                style: {
                                    color: "#555555"
                                },
                                widthAdjust: -44
                            },
                            plotOptions: {
                                line: {
                                    allowPointSelect: !1,
                                    showCheckbox: !1,
                                    animation: {
                                        duration: 1e3
                                    },
                                    events: {},
                                    lineWidth: 2,
                                    marker: {
                                        lineWidth: 0,
                                        radius: 4,
                                        lineColor: "#FFFFFF",
                                        states: {
                                            hover: {
                                                enabled: !0,
                                                lineWidthPlus: 1,
                                                radiusPlus: 2
                                            },
                                            select: {
                                                fillColor: "#FFFFFF",
                                                lineColor: "#000000",
                                                lineWidth: 2
                                            }
                                        }
                                    },
                                    point: {
                                        events: {}
                                    },
                                    dataLabels: {
                                        align: "center",
                                        formatter: function() {
                                            return null === this.y ? "" : nt.numberFormat(this.y, -1)
                                        },
                                        style: {
                                            color: "contrast",
                                            fontSize: "11px",
                                            fontWeight: "bold",
                                            textShadow: "0 0 6px contrast, 0 0 3px contrast"
                                        },
                                        verticalAlign: "bottom",
                                        x: 0,
                                        y: 0,
                                        padding: 5
                                    },
                                    cropThreshold: 300,
                                    pointRange: 0,
                                    softThreshold: !0,
                                    states: {
                                        hover: {
                                            lineWidthPlus: 1,
                                            marker: {},
                                            halo: {
                                                size: 10,
                                                opacity: .25
                                            }
                                        },
                                        select: {
                                            marker: {}
                                        }
                                    },
                                    stickyTracking: !0,
                                    turboThreshold: 1e3
                                }
                            },
                            labels: {
                                style: {
                                    position: "absolute",
                                    color: "#3E576F"
                                }
                            },
                            legend: {
                                enabled: !0,
                                align: "center",
                                layout: "horizontal",
                                labelFormatter: function() {
                                    return this.name
                                },
                                borderColor: "#909090",
                                borderRadius: 0,
                                navigation: {
                                    activeColor: "#274b6d",
                                    inactiveColor: "#CCC"
                                },
                                shadow: !1,
                                itemStyle: {
                                    color: "#333333",
                                    fontSize: "12px",
                                    fontWeight: "bold"
                                },
                                itemHoverStyle: {
                                    color: "#000"
                                },
                                itemHiddenStyle: {
                                    color: "#CCC"
                                },
                                itemCheckboxStyle: {
                                    position: "absolute",
                                    width: "13px",
                                    height: "13px"
                                },
                                symbolPadding: 5,
                                verticalAlign: "bottom",
                                x: 0,
                                y: 0,
                                title: {
                                    style: {
                                        fontWeight: "bold"
                                    }
                                }
                            },
                            loading: {
                                labelStyle: {
                                    fontWeight: "bold",
                                    position: "relative",
                                    top: "45%"
                                },
                                style: {
                                    position: "absolute",
                                    backgroundColor: "white",
                                    opacity: .5,
                                    textAlign: "center"
                                }
                            },
                            tooltip: {
                                enabled: !0,
                                animation: St,
                                backgroundColor: "rgba(249, 249, 249, .85)",
                                borderWidth: 1,
                                borderRadius: 3,
                                dateTimeLabelFormats: {
                                    millisecond: "%A, %b %e, %H:%M:%S.%L",
                                    second: "%A, %b %e, %H:%M:%S",
                                    minute: "%A, %b %e, %H:%M",
                                    hour: "%A, %b %e, %H:%M",
                                    day: "%A, %b %e, %Y",
                                    week: "Week from %A, %b %e, %Y",
                                    month: "%B %Y",
                                    year: "%Y"
                                },
                                footerFormat: "",
                                headerFormat: '<span style="font-size: 10px">{point.key}</span><br/>',
                                pointFormat: '<span style="color:{point.color}">●</span> {series.name}: <b>{point.y}</b><br/>',
                                shadow: !0,
                                snap: Ct ? 25 : 10,
                                style: {
                                    color: "#333333",
                                    cursor: "default",
                                    fontSize: "12px",
                                    padding: "8px",
                                    pointerEvents: "none",
                                    whiteSpace: "nowrap"
                                }
                            },
                            credits: {
                                enabled: !0,
                                text: "Highcharts.com",
                                href: "http://www.highcharts.com",
                                position: {
                                    align: "right",
                                    x: -10,
                                    verticalAlign: "bottom",
                                    y: -5
                                },
                                style: {
                                    cursor: "pointer",
                                    color: "#909090",
                                    fontSize: "9px"
                                }
                            }
                        }).plotOptions,
                        re = ie.line;
                    I(), L.prototype = {
                        parsers: [{
                            regex: /rgba\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]?(?:\.[0-9]+)?)\s*\)/,
                            parse: function(t) {
                                return [s(t[1]), s(t[2]), s(t[3]), parseFloat(t[4], 10)]
                            }
                        }, {
                            regex: /#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/,
                            parse: function(t) {
                                return [s(t[1], 16), s(t[2], 16), s(t[3], 16), 1]
                            }
                        }, {
                            regex: /rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/,
                            parse: function(t) {
                                return [s(t[1]), s(t[2]), s(t[3]), 1]
                            }
                        }],
                        init: function(t) {
                            var e, i, r, n;
                            if ((this.input = t) && t.stops) this.stops = Yt(t.stops, (function(t) {
                                return new L(t[1])
                            }));
                            else
                                for (r = this.parsers.length; r-- && !i;)(e = (n = this.parsers[r]).regex.exec(t)) && (i = n.parse(e));
                            this.rgba = i || []
                        },
                        get: function(t) {
                            var e, i = this.input,
                                r = this.rgba;
                            return this.stops ? ((e = n(i)).stops = [].concat(e.stops), Xt(this.stops, (function(i, r) {
                                e.stops[r] = [e.stops[r][0], i.get(t)]
                            }))) : e = r && Qt(r[0]) ? "rgb" === t || !t && 1 === r[3] ? "rgb(" + r[0] + "," + r[1] + "," + r[2] + ")" : "a" === t ? r[3] : "rgba(" + r.join(",") + ")" : i, e
                        },
                        brighten: function(t) {
                            var e, i = this.rgba;
                            if (this.stops) Xt(this.stops, (function(e) {
                                e.brighten(t)
                            }));
                            else if (Qt(t) && 0 !== t)
                                for (e = 0; e < 3; e++) i[e] += s(255 * t), i[e] < 0 && (i[e] = 0), i[e] > 255 && (i[e] = 255);
                            return this
                        },
                        setOpacity: function(t) {
                            return this.rgba[3] = t, this
                        }
                    }, M.prototype = {
                        opacity: 1,
                        textProps: "direction,fontSize,fontWeight,fontFamily,fontStyle,color,lineHeight,width,textDecoration,textOverflow,textShadow".split(","),
                        init: function(t, e) {
                            this.element = "span" === e ? f(e) : st.createElementNS(Tt, e), this.renderer = t
                        },
                        animate: function(t, e, i) {
                            return e = te(e, this.renderer.globalAnimation, !0), Kt(this), e ? (i && (e.complete = i), _t(this, t, e)) : this.attr(t, null, i), this
                        },
                        colorGradient: function(t, e, i) {
                            var r, s, o, l, c, d, u, p, f, g, m, v, y = this.renderer,
                                x = [];
                            if (t.linearGradient ? s = "linearGradient" : t.radialGradient && (s = "radialGradient"), s) {
                                for (m in o = t[s], c = y.gradients, u = t.stops, g = i.radialReference, a(o) && (t[s] = o = {
                                        x1: o[0],
                                        y1: o[1],
                                        x2: o[2],
                                        y2: o[3],
                                        gradientUnits: "userSpaceOnUse"
                                    }), "radialGradient" === s && g && !h(o.gradientUnits) && (l = o, o = n(o, y.getRadialAttr(g, l), {
                                        gradientUnits: "userSpaceOnUse"
                                    })), o) "id" !== m && x.push(m, o[m]);
                                for (m in u) x.push(u[m]);
                                c[x = x.join(",")] ? g = c[x].attr("id") : (o.id = g = "highcharts-" + It++, c[x] = d = y.createElement(s).attr(o).add(y.defs), d.radAttr = l, d.stops = [], Xt(u, (function(t) {
                                    0 === t[1].indexOf("rgba") ? (r = L(t[1]), p = r.get("rgb"), f = r.get("a")) : (p = t[1], f = 1), t = y.createElement("stop").attr({
                                        offset: t[0],
                                        "stop-color": p,
                                        "stop-opacity": f
                                    }).add(d), d.stops.push(t)
                                }))), v = "url(" + y.url + "#" + g + ")", i.setAttribute(e, v), i.gradient = x, t.toString = function() {
                                    return v
                                }
                            }
                        },
                        applyTextShadow: function(t) {
                            var e, i = this.element,
                                r = -1 !== t.indexOf("contrast"),
                                n = {},
                                o = this.renderer.forExport,
                                a = o || i.style.textShadow !== B && !xt;
                            r && (n.textShadow = t = t.replace(/contrast/g, this.renderer.getContrast(i.style.fill))), (wt || o) && (n.textRendering = "geometricPrecision"), a ? this.css(n) : (this.fakeTS = !0, this.ySetter = this.xSetter, e = [].slice.call(i.getElementsByTagName("tspan")), Xt(t.split(/\s?,\s?/g), (function(t) {
                                var r, n, o = i.firstChild;
                                t = t.split(" "), r = t[t.length - 1], (n = t[t.length - 2]) && Xt(e, (function(t, e) {
                                    var a;
                                    0 === e && (t.setAttribute("x", i.getAttribute("x")), e = i.getAttribute("y"), t.setAttribute("y", e || 0), null === e && i.setAttribute("y", 0)), c(a = t.cloneNode(1), {
                                        class: "highcharts-text-shadow",
                                        fill: r,
                                        stroke: r,
                                        "stroke-opacity": 1 / ct(s(n), 3),
                                        "stroke-width": n,
                                        "stroke-linejoin": "round"
                                    }), i.insertBefore(a, o)
                                }))
                            })))
                        },
                        attr: function(t, e, i) {
                            var r, n, s, o = this.element,
                                a = this;
                            if ("string" == typeof t && e !== B && (r = t, (t = {})[r] = e), "string" == typeof t) a = (this[t + "Getter"] || this._defaultGetter).call(this, t, o);
                            else {
                                for (r in t) e = t[r], s = !1, this.symbolName && /^(x|y|width|height|r|start|end|innerR|anchorX|anchorY)/.test(r) && (n || (this.symbolAttr(t), n = !0), s = !0), !this.rotation || "x" !== r && "y" !== r || (this.doTransform = !0), s || ((s = this[r + "Setter"] || this._defaultSetter).call(this, e, r, o), this.shadows && /^(width|height|visibility|x|y|d|transform|cx|cy|r)$/.test(r) && this.updateShadows(r, e, s));
                                this.doTransform && (this.updateTransform(), this.doTransform = !1)
                            }
                            return i && i(), a
                        },
                        updateShadows: function(t, e, i) {
                            for (var r = this.shadows, n = r.length; n--;) i.call(r[n], "height" === t ? Math.max(e - (r[n].cutHeight || 0), 0) : "d" === t ? this.d : e, t, r[n])
                        },
                        addClass: function(t) {
                            var e = this.element,
                                i = c(e, "class") || "";
                            return -1 === i.indexOf(t) && c(e, "class", i + " " + t), this
                        },
                        symbolAttr: function(t) {
                            var e = this;
                            Xt("x,y,r,start,end,width,height,innerR,anchorX,anchorY".split(","), (function(i) {
                                e[i] = te(t[i], e[i])
                            })), e.attr({
                                d: e.renderer.symbols[e.symbolName](e.x, e.y, e.width, e.height, e)
                            })
                        },
                        clip: function(t) {
                            return this.attr("clip-path", t ? "url(" + this.renderer.url + "#" + t.id + ")" : "none")
                        },
                        crisp: function(t) {
                            var e, i, r = {},
                                n = this.strokeWidth || 0;
                            for (e in i = at(n) % 2 / 2, t.x = lt(t.x || this.x || 0) + i, t.y = lt(t.y || this.y || 0) + i, t.width = lt((t.width || this.width || 0) - 2 * i), t.height = lt((t.height || this.height || 0) - 2 * i), t.strokeWidth = n, t) this[e] !== t[e] && (this[e] = r[e] = t[e]);
                            return r
                        },
                        css: function(t) {
                            var e, i, r = this.styles,
                                n = {},
                                o = this.element,
                                a = "";
                            if (e = !r, t && t.color && (t.fill = t.color), r)
                                for (i in t) t[i] !== r[i] && (n[i] = t[i], e = !0);
                            if (e) {
                                if (e = this.textWidth = t && t.width && "text" === o.nodeName.toLowerCase() && s(t.width) || this.textWidth, r && (t = qt(r, n)), this.styles = t, e && (Pt || !St && this.renderer.forExport) && delete t.width, xt && !St) p(this.element, t);
                                else {
                                    for (i in r = function(t, e) {
                                            return "-" + e.toLowerCase()
                                        }, t) a += i.replace(/([A-Z])/g, r) + ":" + t[i] + ";";
                                    c(o, "style", a)
                                }
                                e && this.added && this.renderer.buildText(this)
                            }
                            return this
                        },
                        on: function(t, e) {
                            var i = this,
                                r = i.element;
                            return z && "click" === t ? (r.ontouchstart = function(t) {
                                i.touchEventFired = X.now(), t.preventDefault(), e.call(r, t)
                            }, r.onclick = function(t) {
                                (-1 === vt.indexOf("Android") || X.now() - (i.touchEventFired || 0) > 1100) && e.call(r, t)
                            }) : r["on" + t] = e, this
                        },
                        setRadialReference: function(t) {
                            var e = this.renderer.gradients[this.element.gradient];
                            return this.element.radialReference = t, e && e.radAttr && e.animate(this.renderer.getRadialAttr(t, e.radAttr)), this
                        },
                        translate: function(t, e) {
                            return this.attr({
                                translateX: t,
                                translateY: e
                            })
                        },
                        invert: function() {
                            return this.inverted = !0, this.updateTransform(), this
                        },
                        updateTransform: function() {
                            var t = this.translateX || 0,
                                e = this.translateY || 0,
                                i = this.scaleX,
                                r = this.scaleY,
                                n = this.inverted,
                                s = this.rotation,
                                o = this.element;
                            n && (t += this.attr("width"), e += this.attr("height")), t = ["translate(" + t + "," + e + ")"], n ? t.push("rotate(90) scale(-1,1)") : s && t.push("rotate(" + s + " " + (o.getAttribute("x") || 0) + " " + (o.getAttribute("y") || 0) + ")"), (h(i) || h(r)) && t.push("scale(" + te(i, 1) + " " + te(r, 1) + ")"), t.length && o.setAttribute("transform", t.join(" "))
                        },
                        toFront: function() {
                            var t = this.element;
                            return t.parentNode.appendChild(t), this
                        },
                        align: function(t, e, i) {
                            var r, n, s, a, h = {};
                            return s = (n = this.renderer).alignedObjects, t ? (this.alignOptions = t, this.alignByTranslate = e, (!i || o(i)) && (this.alignTo = r = i || "renderer", l(s, this), s.push(this), i = null)) : (t = this.alignOptions, e = this.alignByTranslate, r = this.alignTo), i = te(i, n[r], n), r = t.align, n = t.verticalAlign, s = (i.x || 0) + (t.x || 0), a = (i.y || 0) + (t.y || 0), "right" !== r && "center" !== r || (s += (i.width - (t.width || 0)) / {
                                right: 1,
                                center: 2
                            } [r]), h[e ? "translateX" : "x"] = at(s), "bottom" !== n && "middle" !== n || (a += (i.height - (t.height || 0)) / ({
                                bottom: 1,
                                middle: 2
                            } [n] || 1)), h[e ? "translateY" : "y"] = at(a), this[this.placed ? "animate" : "attr"](h), this.placed = !0, this.alignAttr = h, this
                        },
                        getBBox: function(t, e) {
                            var i, r, n, s, o = this.renderer,
                                a = this.element,
                                l = this.styles;
                            r = this.textStr;
                            var h, c, d, u = a.style,
                                p = o.cache,
                                f = o.cacheKeys;
                            if (s = (n = te(e, this.rotation)) * mt, r !== B && (d = r.toString().replace(zt, "0") + ["", n || 0, l && l.fontSize, a.style.width].join(",")), d && !t && (i = p[d]), !i) {
                                if (a.namespaceURI === Tt || o.forExport) {
                                    try {
                                        c = this.fakeTS && function(t) {
                                            Xt(a.querySelectorAll(".highcharts-text-shadow"), (function(e) {
                                                e.style.display = t
                                            }))
                                        }, kt && u.textShadow ? (h = u.textShadow, u.textShadow = "") : c && c("none"), i = a.getBBox ? qt({}, a.getBBox()) : {
                                            width: a.offsetWidth,
                                            height: a.offsetHeight
                                        }, h ? u.textShadow = h : c && c("")
                                    } catch (t) {}(!i || i.width < 0) && (i = {
                                        width: 0,
                                        height: 0
                                    })
                                } else i = this.htmlGetBBox();
                                if (o.isSVG && (o = i.width, r = i.height, xt && l && "11px" === l.fontSize && "16.9" === r.toPrecision(3) && (i.height = r = 14), n && (i.width = ut(r * ft(s)) + ut(o * pt(s)), i.height = ut(r * pt(s)) + ut(o * ft(s)))), d && i.height > 0) {
                                    for (; f.length > 250;) delete p[f.shift()];
                                    p[d] || f.push(d), p[d] = i
                                }
                            }
                            return i
                        },
                        show: function(t) {
                            return this.attr({
                                visibility: t ? "inherit" : "visible"
                            })
                        },
                        hide: function() {
                            return this.attr({
                                visibility: "hidden"
                            })
                        },
                        fadeOut: function(t) {
                            var e = this;
                            e.animate({
                                opacity: 0
                            }, {
                                duration: t || 150,
                                complete: function() {
                                    e.attr({
                                        y: -9999
                                    })
                                }
                            })
                        },
                        add: function(t) {
                            var e, i = this.renderer,
                                r = this.element;
                            return t && (this.parentGroup = t), this.parentInverted = t && t.inverted, void 0 !== this.textStr && i.buildText(this), this.added = !0, (!t || t.handleZ || this.zIndex) && (e = this.zIndexSetter()), e || (t ? t.element : i.box).appendChild(r), this.onAdd && this.onAdd(), this
                        },
                        safeRemoveChild: function(t) {
                            var e = t.parentNode;
                            e && e.removeChild(t)
                        },
                        destroy: function() {
                            var t, e, i = this,
                                r = i.element || {},
                                n = i.shadows,
                                s = i.renderer.isSVG && "SPAN" === r.nodeName && i.parentGroup;
                            if (r.onclick = r.onmouseout = r.onmouseover = r.onmousemove = r.point = null, Kt(i), i.clipPath && (i.clipPath = i.clipPath.destroy()), i.stops) {
                                for (e = 0; e < i.stops.length; e++) i.stops[e] = i.stops[e].destroy();
                                i.stops = null
                            }
                            for (i.safeRemoveChild(r), n && Xt(n, (function(t) {
                                    i.safeRemoveChild(t)
                                })); s && s.div && 0 === s.div.childNodes.length;) r = s.parentGroup, i.safeRemoveChild(s.div), delete s.div, s = r;
                            for (t in i.alignTo && l(i.renderer.alignedObjects, i), i) delete i[t];
                            return null
                        },
                        shadow: function(t, e, i) {
                            var r, n, s, o, a, l, h = [],
                                d = this.element;
                            if (t) {
                                for (o = te(t.width, 3), a = (t.opacity || .15) / o, l = this.parentInverted ? "(-1,-1)" : "(" + te(t.offsetX, 1) + ", " + te(t.offsetY, 1) + ")", r = 1; r <= o; r++) s = 2 * o + 1 - 2 * r, c(n = d.cloneNode(0), {
                                    isShadow: "true",
                                    stroke: t.color || "black",
                                    "stroke-opacity": a * r,
                                    "stroke-width": s,
                                    transform: "translate" + l,
                                    fill: "none"
                                }), i && (c(n, "height", ct(c(n, "height") - s, 0)), n.cutHeight = s), e ? e.element.appendChild(n) : d.parentNode.insertBefore(n, d), h.push(n);
                                this.shadows = h
                            }
                            return this
                        },
                        xGetter: function(t) {
                            return "circle" === this.element.nodeName && (t = {
                                x: "cx",
                                y: "cy"
                            } [t] || t), this._defaultGetter(t)
                        },
                        _defaultGetter: function(t) {
                            return t = te(this[t], this.element ? this.element.getAttribute(t) : null, 0), /^[\-0-9\.]+$/.test(t) && (t = parseFloat(t)), t
                        },
                        dSetter: function(t, e, i) {
                            t && t.join && (t = t.join(" ")), /(NaN| {2}|^$)/.test(t) && (t = "M 0 0"), i.setAttribute(e, t), this[e] = t
                        },
                        dashstyleSetter: function(t) {
                            var e, i = this["stroke-width"];
                            if ("inherit" === i && (i = 1), t = t && t.toLowerCase()) {
                                for (e = (t = t.replace("shortdashdotdot", "3,1,1,1,1,1,").replace("shortdashdot", "3,1,1,1").replace("shortdot", "1,1,").replace("shortdash", "3,1,").replace("longdash", "8,3,").replace(/dot/g, "1,3,").replace("dash", "4,3,").replace(/,$/, "").split(",")).length; e--;) t[e] = s(t[e]) * i;
                                t = t.join(",").replace(/NaN/g, "none"), this.element.setAttribute("stroke-dasharray", t)
                            }
                        },
                        alignSetter: function(t) {
                            this.element.setAttribute("text-anchor", {
                                left: "start",
                                center: "middle",
                                right: "end"
                            } [t])
                        },
                        titleSetter: function(t) {
                            var e = this.element.getElementsByTagName("title")[0];
                            e || (e = st.createElementNS(Tt, "title"), this.element.appendChild(e)), e.firstChild && e.removeChild(e.firstChild), e.appendChild(st.createTextNode(String(te(t), "").replace(/<[^>]*>/g, "")))
                        },
                        textSetter: function(t) {
                            t !== this.textStr && (delete this.bBox, this.textStr = t, this.added && this.renderer.buildText(this))
                        },
                        fillSetter: function(t, e, i) {
                            "string" == typeof t ? i.setAttribute(e, t) : t && this.colorGradient(t, e, i)
                        },
                        visibilitySetter: function(t, e, i) {
                            "inherit" === t ? i.removeAttribute(e) : i.setAttribute(e, t)
                        },
                        zIndexSetter: function(t, e) {
                            var i, r, n, o, a = this.renderer,
                                l = this.parentGroup,
                                c = (a = (l || a).element || a.box, this.element);
                            if (i = this.added, h(t) && (c.zIndex = t, t = +t, this[e] === t && (i = !1), this[e] = t), i) {
                                for ((t = this.zIndex) && l && (l.handleZ = !0), l = a.childNodes, o = 0; o < l.length && !n; o++) r = (i = l[o]).zIndex, i !== c && (s(r) > t || !h(t) && h(r)) && (a.insertBefore(c, i), n = !0);
                                n || a.appendChild(c)
                            }
                            return n
                        },
                        _defaultSetter: function(t, e, i) {
                            i.setAttribute(e, t)
                        }
                    }, M.prototype.yGetter = M.prototype.xGetter, M.prototype.translateXSetter = M.prototype.translateYSetter = M.prototype.rotationSetter = M.prototype.verticalAlignSetter = M.prototype.scaleXSetter = M.prototype.scaleYSetter = function(t, e) {
                        this[e] = t, this.doTransform = !0
                    }, M.prototype.opacitySetter = M.prototype.displaySetter = function(t, e, i) {
                        this[e] = t, i.setAttribute(e, t)
                    }, M.prototype["stroke-widthSetter"] = M.prototype.strokeSetter = function(t, e, i) {
                        this[e] = t, this.stroke && this["stroke-width"] ? (this.strokeWidth = this["stroke-width"], M.prototype.fillSetter.call(this, this.stroke, "stroke", i), i.setAttribute("stroke-width", this["stroke-width"]), this.hasStroke = !0) : "stroke-width" === e && 0 === t && this.hasStroke && (i.removeAttribute("stroke"), this.hasStroke = !1)
                    };
                    var ne, se, oe = function() {
                        this.init.apply(this, arguments)
                    };
                    if (oe.prototype = {
                            Element: M,
                            init: function(e, i, r, n, s, o) {
                                var a, l;
                                a = (n = this.createElement("svg").attr({
                                    version: "1.1"
                                }).css(this.getStyle(n))).element, e.appendChild(a), -1 === e.innerHTML.indexOf("xmlns") && c(a, "xmlns", Tt), this.isSVG = !0, this.box = a, this.boxWrapper = n, this.alignedObjects = [], this.url = (kt || wt) && st.getElementsByTagName("base").length ? t.location.href.replace(/#.*?$/, "").replace(/([\('\)])/g, "\\$1").replace(/ /g, "%20") : "", this.createElement("desc").add().element.appendChild(st.createTextNode("Created with Highcharts 4.2.7")), this.defs = this.createElement("defs").add(), this.allowHTML = o, this.forExport = s, this.gradients = {}, this.cache = {}, this.cacheKeys = [], this.imgCount = 0, this.setSize(i, r, !1), kt && e.getBoundingClientRect && (this.subPixelFix = i = function() {
                                    p(e, {
                                        left: 0,
                                        top: 0
                                    }), l = e.getBoundingClientRect(), p(e, {
                                        left: ht(l.left) - l.left + "px",
                                        top: ht(l.top) - l.top + "px"
                                    })
                                }, i(), jt(t, "resize", i))
                            },
                            getStyle: function(t) {
                                return this.style = qt({
                                    fontFamily: '"Lucida Grande", "Lucida Sans Unicode", Arial, Helvetica, sans-serif',
                                    fontSize: "12px"
                                }, t)
                            },
                            isHidden: function() {
                                return !this.boxWrapper.getBBox().width
                            },
                            destroy: function() {
                                var e = this.defs;
                                return this.box = null, this.boxWrapper = this.boxWrapper.destroy(), T(this.gradients || {}), this.gradients = null, e && (this.defs = e.destroy()), this.subPixelFix && Ut(t, "resize", this.subPixelFix), this.alignedObjects = null
                            },
                            createElement: function(t) {
                                var e = new this.Element;
                                return e.init(this, t), e
                            },
                            draw: function() {},
                            getRadialAttr: function(t, e) {
                                return {
                                    cx: t[0] - t[2] / 2 + e.cx * t[2],
                                    cy: t[1] - t[2] / 2 + e.cy * t[2],
                                    r: e.r * t[2]
                                }
                            },
                            buildText: function(t) {
                                for (var e, i, r, n = t.element, o = this, a = o.forExport, l = te(t.textStr, "").toString(), h = -1 !== l.indexOf("<"), d = n.childNodes, u = c(n, "x"), f = t.styles, g = t.textWidth, m = f && f.lineHeight, v = f && f.textShadow, y = f && "ellipsis" === f.textOverflow, x = d.length, b = g && !t.added && this.box, w = function(t) {
                                        return m ? s(m) : o.fontMetrics(/(px|em)$/.test(t && t.style.fontSize) ? t.style.fontSize : f && f.fontSize || o.style.fontSize || 12, t).h
                                    }, k = function(t) {
                                        return t.replace(/&lt;/g, "<").replace(/&gt;/g, ">")
                                    }; x--;) n.removeChild(d[x]);
                                h || v || y || g || -1 !== l.indexOf(" ") ? (e = /<.*style="([^"]+)".*>/, i = /<.*href="(http[^"]+)".*>/, b && b.appendChild(n), l = h ? l.replace(/<(b|strong)>/g, '<span style="font-weight:bold">').replace(/<(i|em)>/g, '<span style="font-style:italic">').replace(/<a/g, "<span").replace(/<\/(b|strong|i|em|a)>/g, "</span>").split(/<br.*?>/g) : [l], l = Gt(l, (function(t) {
                                    return "" !== t
                                })), Xt(l, (function(s, l) {
                                    var h, d = 0;
                                    s = s.replace(/^\s+|\s+$/g, "").replace(/<span/g, "|||<span").replace(/<\/span>/g, "</span>|||"), h = s.split("|||"), Xt(h, (function(s) {
                                        if ("" !== s || 1 === h.length) {
                                            var m, v = {},
                                                x = st.createElementNS(Tt, "tspan");
                                            if (e.test(s) && c(x, "style", m = s.match(e)[1].replace(/(;| |^)color([ :])/, "$1fill$2")), i.test(s) && !a && (c(x, "onclick", 'location.href="' + s.match(i)[1] + '"'), p(x, {
                                                    cursor: "pointer"
                                                })), " " !== (s = k(s.replace(/<(.|\n)*?>/g, "") || " "))) {
                                                if (x.appendChild(st.createTextNode(s)), d ? v.dx = 0 : l && null !== u && (v.x = u), c(x, v), n.appendChild(x), !d && l && (!St && a && p(x, {
                                                        display: "block"
                                                    }), c(x, "dy", w(x))), g) {
                                                    v = s.replace(/([^\^])-/g, "$1- ").split(" ");
                                                    for (var b, C, T = "nowrap" === f.whiteSpace, S = h.length > 1 || l || v.length > 1 && !T, A = [], P = w(x), D = t.rotation, I = s, L = I.length;
                                                        (S || y) && (v.length || A.length);) t.rotation = 0, C = (b = t.getBBox(!0)).width, !St && o.forExport && (C = o.measureSpanWidth(x.firstChild.data, t.styles)), b = C > g, void 0 === r && (r = b), y && r ? (L /= 2, "" === I || !b && L < .5 ? v = [] : (v = [(I = s.substring(0, I.length + (b ? -1 : 1) * ht(L))) + (g > 3 ? "…" : "")], x.removeChild(x.firstChild))) : b && 1 !== v.length ? (x.removeChild(x.firstChild), A.unshift(v.pop())) : (v = A, A = [], v.length && !T && (c(x = st.createElementNS(Tt, "tspan"), {
                                                        dy: P,
                                                        x: u
                                                    }), m && c(x, "style", m), n.appendChild(x)), C > g && (g = C)), v.length && x.appendChild(st.createTextNode(v.join(" ").replace(/- /g, "-")));
                                                    t.rotation = D
                                                }
                                                d++
                                            }
                                        }
                                    }))
                                })), r && t.attr("title", t.textStr), b && b.removeChild(n), v && t.applyTextShadow && t.applyTextShadow(v)) : n.appendChild(st.createTextNode(k(l)))
                            },
                            getContrast: function(t) {
                                return (t = L(t).rgba)[0] + t[1] + t[2] > 384 ? "#000000" : "#FFFFFF"
                            },
                            button: function(t, e, i, r, s, o, a, l, h) {
                                var c, d, u, p, f, g, m = this.label(t, e, i, h, null, null, null, null, "button"),
                                    v = 0;
                                return s = n({
                                    "stroke-width": 1,
                                    stroke: "#CCCCCC",
                                    fill: {
                                        linearGradient: t = {
                                            x1: 0,
                                            y1: 0,
                                            x2: 0,
                                            y2: 1
                                        },
                                        stops: [
                                            [0, "#FEFEFE"],
                                            [1, "#F6F6F6"]
                                        ]
                                    },
                                    r: 2,
                                    padding: 5,
                                    style: {
                                        color: "black"
                                    }
                                }, s), u = s.style, delete s.style, o = n(s, {
                                    stroke: "#68A",
                                    fill: {
                                        linearGradient: t,
                                        stops: [
                                            [0, "#FFF"],
                                            [1, "#ACF"]
                                        ]
                                    }
                                }, o), p = o.style, delete o.style, a = n(s, {
                                    stroke: "#68A",
                                    fill: {
                                        linearGradient: t,
                                        stops: [
                                            [0, "#9BD"],
                                            [1, "#CDF"]
                                        ]
                                    }
                                }, a), f = a.style, delete a.style, l = n(s, {
                                    style: {
                                        color: "#CCC"
                                    }
                                }, l), g = l.style, delete l.style, jt(m.element, xt ? "mouseover" : "mouseenter", (function() {
                                    3 !== v && m.attr(o).css(p)
                                })), jt(m.element, xt ? "mouseout" : "mouseleave", (function() {
                                    3 !== v && (c = [s, o, a][v], d = [u, p, f][v], m.attr(c).css(d))
                                })), m.setState = function(t) {
                                    (m.state = v = t) ? 2 === t ? m.attr(a).css(f) : 3 === t && m.attr(l).css(g): m.attr(s).css(u)
                                }, m.on("click", (function(t) {
                                    3 !== v && r.call(m, t)
                                })).attr(s).css(qt({
                                    cursor: "default"
                                }, u))
                            },
                            crispLine: function(t, e) {
                                return t[1] === t[4] && (t[1] = t[4] = at(t[1]) - e % 2 / 2), t[2] === t[5] && (t[2] = t[5] = at(t[2]) + e % 2 / 2), t
                            },
                            path: function(t) {
                                var e = {
                                    fill: "none"
                                };
                                return a(t) ? e.d = t : Jt(t) && qt(e, t), this.createElement("path").attr(e)
                            },
                            circle: function(t, e, i) {
                                return t = Jt(t) ? t : {
                                    x: t,
                                    y: e,
                                    r: i
                                }, (e = this.createElement("circle")).xSetter = e.ySetter = function(t, e, i) {
                                    i.setAttribute("c" + e, t)
                                }, e.attr(t)
                            },
                            arc: function(t, e, i, r, n, s) {
                                return Jt(t) && (e = t.y, i = t.r, r = t.innerR, n = t.start, s = t.end, t = t.x), (t = this.symbol("arc", t || 0, e || 0, i || 0, i || 0, {
                                    innerR: r || 0,
                                    start: n || 0,
                                    end: s || 0
                                })).r = i, t
                            },
                            rect: function(t, e, i, r, n, s) {
                                n = Jt(t) ? t.r : n;
                                var o = this.createElement("rect");
                                return t = Jt(t) ? t : t === B ? {} : {
                                    x: t,
                                    y: e,
                                    width: ct(i, 0),
                                    height: ct(r, 0)
                                }, s !== B && (o.strokeWidth = s, t = o.crisp(t)), n && (t.r = n), o.rSetter = function(t, e, i) {
                                    c(i, {
                                        rx: t,
                                        ry: t
                                    })
                                }, o.attr(t)
                            },
                            setSize: function(t, e, i) {
                                var r = this.alignedObjects,
                                    n = r.length;
                                for (this.width = t, this.height = e, this.boxWrapper[te(i, !0) ? "animate" : "attr"]({
                                        width: t,
                                        height: e
                                    }); n--;) r[n].align()
                            },
                            g: function(t) {
                                var e = this.createElement("g");
                                return h(t) ? e.attr({
                                    class: "highcharts-" + t
                                }) : e
                            },
                            image: function(t, e, i, r, n) {
                                var s = {
                                    preserveAspectRatio: "none"
                                };
                                return arguments.length > 1 && qt(s, {
                                    x: e,
                                    y: i,
                                    width: r,
                                    height: n
                                }), (s = this.createElement("image").attr(s)).element.setAttributeNS ? s.element.setAttributeNS("http://www.w3.org/1999/xlink", "href", t) : s.element.setAttribute("hc-svg-href", t), s
                            },
                            symbol: function(t, e, i, r, n, s) {
                                var o, a, l, h, c = this,
                                    d = /^url\((.*?)\)$/;
                                return (a = (a = this.symbols[t]) && a(at(e), at(i), r, n, s)) ? (o = this.path(a), qt(o, {
                                    symbolName: t,
                                    x: e,
                                    y: i,
                                    width: r,
                                    height: n
                                }), s && qt(o, s)) : d.test(t) && (h = function(t, e) {
                                    t.element && (t.attr({
                                        width: e[0],
                                        height: e[1]
                                    }), t.alignByTranslate || t.translate(at((r - e[0]) / 2), at((n - e[1]) / 2)))
                                }, l = t.match(d)[1], t = Dt[l] || s && s.width && s.height && [s.width, s.height], (o = this.image(l).attr({
                                    x: e,
                                    y: i
                                })).isImg = !0, t ? h(o, t) : (o.attr({
                                    width: 0,
                                    height: 0
                                }), f("img", {
                                    onload: function() {
                                        var t = Mt[c.chartIndex];
                                        0 === this.width && (p(this, {
                                            position: "absolute",
                                            top: "-999em"
                                        }), st.body.appendChild(this)), h(o, Dt[l] = [this.width, this.height]), this.parentNode && this.parentNode.removeChild(this), c.imgCount--, !c.imgCount && t && t.onload && t.onload()
                                    },
                                    src: l
                                }), this.imgCount++)), o
                            },
                            symbols: {
                                circle: function(t, e, i, r) {
                                    var n = .166 * i;
                                    return [Bt, t + i / 2, e, "C", t + i + n, e, t + i + n, e + r, t + i / 2, e + r, "C", t - n, e + r, t - n, e, t + i / 2, e, "Z"]
                                },
                                square: function(t, e, i, r) {
                                    return [Bt, t, e, Et, t + i, e, t + i, e + r, t, e + r, "Z"]
                                },
                                triangle: function(t, e, i, r) {
                                    return [Bt, t + i / 2, e, Et, t + i, e + r, t, e + r, "Z"]
                                },
                                "triangle-down": function(t, e, i, r) {
                                    return [Bt, t, e, Et, t + i, e, t + i / 2, e + r, "Z"]
                                },
                                diamond: function(t, e, i, r) {
                                    return [Bt, t + i / 2, e, Et, t + i, e + r / 2, t + i / 2, e + r, t, e + r / 2, "Z"]
                                },
                                arc: function(t, e, i, r, n) {
                                    var s = n.start,
                                        o = (i = n.r || i || r, n.end - .001),
                                        a = (r = n.innerR, n.open),
                                        l = pt(s),
                                        h = ft(s),
                                        c = pt(o);
                                    return o = ft(o), n = n.end - s < gt ? 0 : 1, [Bt, t + i * l, e + i * h, "A", i, i, 0, n, 1, t + i * c, e + i * o, a ? Bt : Et, t + r * c, e + r * o, "A", r, r, 0, n, 0, t + r * l, e + r * h, a ? "" : "Z"]
                                },
                                callout: function(t, e, i, r, n) {
                                    var s, o = dt(n && n.r || 0, i, r),
                                        a = o + 6,
                                        l = n && n.anchorX;
                                    return n = n && n.anchorY, s = ["M", t + o, e, "L", t + i - o, e, "C", t + i, e, t + i, e, t + i, e + o, "L", t + i, e + r - o, "C", t + i, e + r, t + i, e + r, t + i - o, e + r, "L", t + o, e + r, "C", t, e + r, t, e + r, t, e + r - o, "L", t, e + o, "C", t, e, t, e, t + o, e], l && l > i && n > e + a && n < e + r - a ? s.splice(13, 3, "L", t + i, n - 6, t + i + 6, n, t + i, n + 6, t + i, e + r - o) : l && l < 0 && n > e + a && n < e + r - a ? s.splice(33, 3, "L", t, n + 6, t - 6, n, t, n - 6, t, e + o) : n && n > r && l > t + a && l < t + i - a ? s.splice(23, 3, "L", l + 6, e + r, l, e + r + 6, l - 6, e + r, t + o, e + r) : n && n < 0 && l > t + a && l < t + i - a && s.splice(3, 3, "L", l - 6, e, l, e - 6, l + 6, e, i - o, e), s
                                }
                            },
                            clipRect: function(t, e, i, r) {
                                var n = "highcharts-" + It++,
                                    s = this.createElement("clipPath").attr({
                                        id: n
                                    }).add(this.defs);
                                return (t = this.rect(t, e, i, r, 0).add(s)).id = n, t.clipPath = s, t.count = 0, t
                            },
                            text: function(t, e, i, r) {
                                var n = Pt || !St && this.forExport,
                                    s = {};
                                return !r || !this.allowHTML && this.forExport ? (s.x = Math.round(e || 0), i && (s.y = Math.round(i)), (t || 0 === t) && (s.text = t), t = this.createElement("text").attr(s), n && t.css({
                                    position: "absolute"
                                }), r || (t.xSetter = function(t, e, i) {
                                    var r, n, s = i.getElementsByTagName("tspan"),
                                        o = i.getAttribute(e);
                                    for (n = 0; n < s.length; n++)(r = s[n]).getAttribute(e) === o && r.setAttribute(e, t);
                                    i.setAttribute(e, t)
                                }), t) : this.html(t, e, i)
                            },
                            fontMetrics: function(e, i) {
                                var r;
                                return !(e = e || this.style.fontSize) && i && t.getComputedStyle && (i = i.element || i, e = (r = t.getComputedStyle(i, "")) && r.fontSize), {
                                    h: r = (e = /px/.test(e) ? s(e) : /em/.test(e) ? 12 * parseFloat(e) : 12) < 24 ? e + 3 : at(1.2 * e),
                                    b: at(.8 * r),
                                    f: e
                                }
                            },
                            rotCorr: function(t, e, i) {
                                var r = t;
                                return e && i && (r = ct(r * pt(e * mt), 4)), {
                                    x: -t / 3 * ft(e * mt),
                                    y: r
                                }
                            },
                            label: function(t, e, i, r, s, o, a, l, c) {
                                var d, u, p, f, g, m, v, y, x, b, w = this,
                                    k = w.g(c),
                                    C = w.text("", 0, 0, a).attr({
                                        zIndex: 1
                                    }),
                                    T = 0,
                                    S = 3,
                                    A = 0,
                                    P = 0,
                                    D = {},
                                    I = /^url\((.*?)\)$/.test(r),
                                    L = I;
                                y = function() {
                                    var t, e;
                                    t = C.element.style, u = (void 0 === p || void 0 === f || k.styles.textAlign) && h(C.textStr) && C.getBBox(), k.width = (p || u.width || 0) + 2 * S + A, k.height = (f || u.height || 0) + 2 * S, v = S + w.fontMetrics(t && t.fontSize, C).b, L && (d || (t = P, e = (l ? -v : 0) + P, k.box = d = w.symbols[r] || I ? w.symbol(r, t, e, k.width, k.height, D) : w.rect(t, e, k.width, k.height, 0, D["stroke-width"]), d.isImg || d.attr("fill", "none"), d.add(k)), d.isImg || d.attr(qt({
                                        width: at(k.width),
                                        height: at(k.height)
                                    }, D)), D = null)
                                }, x = function() {
                                    var t, e = (e = k.styles) && e.textAlign,
                                        i = A + S;
                                    t = l ? 0 : v, h(p) && u && ("center" === e || "right" === e) && (i += {
                                        center: .5,
                                        right: 1
                                    } [e] * (p - u.width)), i === C.x && t === C.y || (C.attr("x", i), t !== B && C.attr("y", t)), C.x = i, C.y = t
                                }, b = function(t, e) {
                                    d ? d.attr(t, e) : D[t] = e
                                }, k.onAdd = function() {
                                    C.add(k), k.attr({
                                        text: t || 0 === t ? t : "",
                                        x: e,
                                        y: i
                                    }), d && h(s) && k.attr({
                                        anchorX: s,
                                        anchorY: o
                                    })
                                }, k.widthSetter = function(t) {
                                    p = t
                                }, k.heightSetter = function(t) {
                                    f = t
                                }, k.paddingSetter = function(t) {
                                    h(t) && t !== S && (S = k.padding = t, x())
                                }, k.paddingLeftSetter = function(t) {
                                    h(t) && t !== A && (A = t, x())
                                }, k.alignSetter = function(t) {
                                    (t = {
                                        left: 0,
                                        center: .5,
                                        right: 1
                                    } [t]) !== T && (T = t, u && k.attr({
                                        x: g
                                    }))
                                }, k.textSetter = function(t) {
                                    t !== B && C.textSetter(t), y(), x()
                                }, k["stroke-widthSetter"] = function(t, e) {
                                    t && (L = !0), P = t % 2 / 2, b(e, t)
                                }, k.strokeSetter = k.fillSetter = k.rSetter = function(t, e) {
                                    "fill" === e && t && (L = !0), b(e, t)
                                }, k.anchorXSetter = function(t, e) {
                                    s = t, b(e, at(t) - P - g)
                                }, k.anchorYSetter = function(t, e) {
                                    o = t, b(e, t - m)
                                }, k.xSetter = function(t) {
                                    k.x = t, T && (t -= T * ((p || u.width) + 2 * S)), g = at(t), k.attr("translateX", g)
                                }, k.ySetter = function(t) {
                                    m = k.y = at(t), k.attr("translateY", m)
                                };
                                var R = k.css;
                                return qt(k, {
                                    css: function(t) {
                                        if (t) {
                                            var e = {};
                                            t = n(t), Xt(k.textProps, (function(i) {
                                                t[i] !== B && (e[i] = t[i], delete t[i])
                                            })), C.css(e)
                                        }
                                        return R.call(k, t)
                                    },
                                    getBBox: function() {
                                        return {
                                            width: u.width + 2 * S,
                                            height: u.height + 2 * S,
                                            x: u.x - S,
                                            y: u.y - S
                                        }
                                    },
                                    shadow: function(t) {
                                        return d && d.shadow(t), k
                                    },
                                    destroy: function() {
                                        Ut(k.element, "mouseenter"), Ut(k.element, "mouseleave"), C && (C = C.destroy()), d && (d = d.destroy()), M.prototype.destroy.call(k), k = w = y = x = b = null
                                    }
                                })
                            }
                        }, E = oe, qt(M.prototype, {
                            htmlCss: function(t) {
                                var e = this.element;
                                return (e = t && "SPAN" === e.tagName && t.width) && (delete t.width, this.textWidth = e, this.updateTransform()), t && "ellipsis" === t.textOverflow && (t.whiteSpace = "nowrap", t.overflow = "hidden"), this.styles = qt(this.styles, t), p(this.element, t), this
                            },
                            htmlGetBBox: function() {
                                var t = this.element;
                                return "text" === t.nodeName && (t.style.position = "absolute"), {
                                    x: t.offsetLeft,
                                    y: t.offsetTop,
                                    width: t.offsetWidth,
                                    height: t.offsetHeight
                                }
                            },
                            htmlUpdateTransform: function() {
                                if (this.added) {
                                    var t = this.renderer,
                                        e = this.element,
                                        i = this.translateX || 0,
                                        r = this.translateY || 0,
                                        n = this.x || 0,
                                        o = this.y || 0,
                                        a = this.textAlign || "left",
                                        l = {
                                            left: 0,
                                            center: .5,
                                            right: 1
                                        } [a],
                                        c = this.shadows,
                                        d = this.styles;
                                    if (p(e, {
                                            marginLeft: i,
                                            marginTop: r
                                        }), c && Xt(c, (function(t) {
                                            p(t, {
                                                marginLeft: i + 1,
                                                marginTop: r + 1
                                            })
                                        })), this.inverted && Xt(e.childNodes, (function(i) {
                                            t.invertChild(i, e)
                                        })), "SPAN" === e.tagName) {
                                        c = this.rotation;
                                        var u = s(this.textWidth),
                                            f = d && d.whiteSpace,
                                            g = [c, a, e.innerHTML, this.textWidth, this.textAlign].join(",");
                                        g !== this.cTT && (d = t.fontMetrics(e.style.fontSize).b, h(c) && this.setSpanRotation(c, l, d), p(e, {
                                            width: "",
                                            whiteSpace: f || "nowrap"
                                        }), e.offsetWidth > u && /[ \-]/.test(e.textContent || e.innerText) && p(e, {
                                            width: u + "px",
                                            display: "block",
                                            whiteSpace: f || "normal"
                                        }), this.getSpanCorrection(e.offsetWidth, d, l, c, a)), p(e, {
                                            left: n + (this.xCorr || 0) + "px",
                                            top: o + (this.yCorr || 0) + "px"
                                        }), wt && (d = e.offsetHeight), this.cTT = g
                                    }
                                } else this.alignOnAdd = !0
                            },
                            setSpanRotation: function(t, e, i) {
                                var r = {},
                                    n = xt ? "-ms-transform" : wt ? "-webkit-transform" : kt ? "MozTransform" : yt ? "-o-transform" : "";
                                r[n] = r.transform = "rotate(" + t + "deg)", r[n + (kt ? "Origin" : "-origin")] = r.transformOrigin = 100 * e + "% " + i + "px", p(this.element, r)
                            },
                            getSpanCorrection: function(t, e, i) {
                                this.xCorr = -t * i, this.yCorr = -e
                            }
                        }), qt(oe.prototype, {
                            html: function(t, e, i) {
                                var r = this.createElement("span"),
                                    n = r.element,
                                    s = r.renderer,
                                    o = s.isSVG,
                                    a = function(t, e) {
                                        Xt(["display", "opacity", "visibility"], (function(i) {
                                            ee(t, i + "Setter", (function(t, i, r, n) {
                                                t.call(this, i, r, n), e[r] = i
                                            }))
                                        }))
                                    };
                                return r.textSetter = function(t) {
                                    t !== n.innerHTML && delete this.bBox, n.innerHTML = this.textStr = t, r.htmlUpdateTransform()
                                }, o && a(r, r.element.style), r.xSetter = r.ySetter = r.alignSetter = r.rotationSetter = function(t, e) {
                                    "align" === e && (e = "textAlign"), r[e] = t, r.htmlUpdateTransform()
                                }, r.attr({
                                    text: t,
                                    x: at(e),
                                    y: at(i)
                                }).css({
                                    position: "absolute",
                                    fontFamily: this.style.fontFamily,
                                    fontSize: this.style.fontSize
                                }), n.style.whiteSpace = "nowrap", r.css = r.htmlCss, o && (r.add = function(t) {
                                    var e, i = s.box.parentNode,
                                        o = [];
                                    if (this.parentGroup = t) {
                                        if (!(e = t.div)) {
                                            for (; t;) o.push(t), t = t.parentGroup;
                                            Xt(o.reverse(), (function(t) {
                                                var r, n = c(t.element, "class");
                                                n && (n = {
                                                    className: n
                                                }), e = t.div = t.div || f(Ot, n, {
                                                    position: "absolute",
                                                    left: (t.translateX || 0) + "px",
                                                    top: (t.translateY || 0) + "px",
                                                    display: t.display,
                                                    opacity: t.opacity,
                                                    pointerEvents: t.styles && t.styles.pointerEvents
                                                }, e || i), r = e.style, qt(t, {
                                                    translateXSetter: function(e, i) {
                                                        r.left = e + "px", t[i] = e, t.doTransform = !0
                                                    },
                                                    translateYSetter: function(e, i) {
                                                        r.top = e + "px", t[i] = e, t.doTransform = !0
                                                    }
                                                }), a(t, r)
                                            }))
                                        }
                                    } else e = i;
                                    return e.appendChild(n), r.added = !0, r.alignOnAdd && r.htmlUpdateTransform(), r
                                }), r
                            }
                        }), !St && !Pt) {
                        (ne = {
                            init: function(t, e) {
                                var i = ["<", e, ' filled="f" stroked="f"'],
                                    r = ["position: ", "absolute", ";"],
                                    n = e === Ot;
                                ("shape" === e || n) && r.push("left:0;top:0;width:1px;height:1px;"), r.push("visibility: ", n ? "hidden" : "visible"), i.push(' style="', r.join(""), '"/>'), e && (i = n || "span" === e || "img" === e ? i.join("") : t.prepVML(i), this.element = f(i)), this.renderer = t
                            },
                            add: function(t) {
                                var e = this.renderer,
                                    i = this.element,
                                    r = e.box,
                                    n = t && t.inverted;
                                return r = t ? t.element || t : r, t && (this.parentGroup = t), n && e.invertChild(i, r), r.appendChild(i), this.added = !0, this.alignOnAdd && !this.deferUpdateTransform && this.updateTransform(), this.onAdd && this.onAdd(), this
                            },
                            updateTransform: M.prototype.htmlUpdateTransform,
                            setSpanRotation: function() {
                                var t = this.rotation,
                                    e = pt(t * mt),
                                    i = ft(t * mt);
                                p(this.element, {
                                    filter: t ? ["progid:DXImageTransform.Microsoft.Matrix(M11=", e, ", M12=", -i, ", M21=", i, ", M22=", e, ", sizingMethod='auto expand')"].join("") : "none"
                                })
                            },
                            getSpanCorrection: function(t, e, i, r, n) {
                                var s, o = r ? pt(r * mt) : 1,
                                    a = r ? ft(r * mt) : 0,
                                    l = te(this.elemHeight, this.element.offsetHeight);
                                this.xCorr = o < 0 && -t, this.yCorr = a < 0 && -l, s = o * a < 0, this.xCorr += a * e * (s ? 1 - i : i), this.yCorr -= o * e * (r ? s ? i : 1 - i : 1), n && "left" !== n && (this.xCorr -= t * i * (o < 0 ? -1 : 1), r && (this.yCorr -= l * i * (a < 0 ? -1 : 1)), p(this.element, {
                                    textAlign: n
                                }))
                            },
                            pathToVML: function(t) {
                                for (var e = t.length, i = []; e--;) Qt(t[e]) ? i[e] = at(10 * t[e]) - 5 : "Z" === t[e] ? i[e] = "x" : (i[e] = t[e], !t.isArc || "wa" !== t[e] && "at" !== t[e] || (i[e + 5] === i[e + 7] && (i[e + 7] += t[e + 7] > t[e + 5] ? 1 : -1), i[e + 6] === i[e + 8] && (i[e + 8] += t[e + 8] > t[e + 6] ? 1 : -1)));
                                return i.join(" ") || "x"
                            },
                            clip: function(t) {
                                var e, i = this;
                                return t ? (l(e = t.members, i), e.push(i), i.destroyClip = function() {
                                    l(e, i)
                                }, t = t.getCSS(i)) : (i.destroyClip && i.destroyClip(), t = {
                                    clip: bt ? "inherit" : "rect(auto)"
                                }), i.css(t)
                            },
                            css: M.prototype.htmlCss,
                            safeRemoveChild: function(t) {
                                t.parentNode && S(t)
                            },
                            destroy: function() {
                                return this.destroyClip && this.destroyClip(), M.prototype.destroy.apply(this)
                            },
                            on: function(e, i) {
                                return this.element["on" + e] = function() {
                                    var e = t.event;
                                    e.target = e.srcElement, i(e)
                                }, this
                            },
                            cutOffPath: function(t, e) {
                                var i;
                                return 9 !== (i = (t = t.split(/[ ,]/)).length) && 11 !== i || (t[i - 4] = t[i - 2] = s(t[i - 2]) - 10 * e), t.join(" ")
                            },
                            shadow: function(t, e, i) {
                                var r, n, o, a, l, h, c, d = [],
                                    u = this.element,
                                    p = this.renderer,
                                    g = u.style,
                                    m = u.path;
                                if (m && "string" != typeof m.value && (m = "x"), l = m, t) {
                                    for (h = te(t.width, 3), c = (t.opacity || .15) / h, r = 1; r <= 3; r++) a = 2 * h + 1 - 2 * r, i && (l = this.cutOffPath(m.value, a + .5)), o = ['<shape isShadow="true" strokeweight="', a, '" filled="false" path="', l, '" coordsize="10 10" style="', u.style.cssText, '" />'], n = f(p.prepVML(o), null, {
                                        left: s(g.left) + te(t.offsetX, 1),
                                        top: s(g.top) + te(t.offsetY, 1)
                                    }), i && (n.cutOff = a + 1), o = ['<stroke color="', t.color || "black", '" opacity="', c * r, '"/>'], f(p.prepVML(o), null, null, n), e ? e.element.appendChild(n) : u.parentNode.insertBefore(n, u), d.push(n);
                                    this.shadows = d
                                }
                                return this
                            },
                            updateShadows: Lt,
                            setAttr: function(t, e) {
                                bt ? this.element[t] = e : this.element.setAttribute(t, e)
                            },
                            classSetter: function(t) {
                                this.element.className = t
                            },
                            dashstyleSetter: function(t, e, i) {
                                (i.getElementsByTagName("stroke")[0] || f(this.renderer.prepVML(["<stroke/>"]), null, null, i))[e] = t || "solid", this[e] = t
                            },
                            dSetter: function(t, e, i) {
                                var r = this.shadows;
                                if (t = t || [], this.d = t.join && t.join(" "), i.path = t = this.pathToVML(t), r)
                                    for (i = r.length; i--;) r[i].path = r[i].cutOff ? this.cutOffPath(t, r[i].cutOff) : t;
                                this.setAttr(e, t)
                            },
                            fillSetter: function(t, e, i) {
                                var r = i.nodeName;
                                "SPAN" === r ? i.style.color = t : "IMG" !== r && (i.filled = "none" !== t, this.setAttr("fillcolor", this.renderer.color(t, i, e, this)))
                            },
                            "fill-opacitySetter": function(t, e, i) {
                                f(this.renderer.prepVML(["<", e.split("-")[0], ' opacity="', t, '"/>']), null, null, i)
                            },
                            opacitySetter: Lt,
                            rotationSetter: function(t, e, i) {
                                i = i.style, this[e] = i[e] = t, i.left = -at(ft(t * mt) + 1) + "px", i.top = at(pt(t * mt)) + "px"
                            },
                            strokeSetter: function(t, e, i) {
                                this.setAttr("strokecolor", this.renderer.color(t, i, e, this))
                            },
                            "stroke-widthSetter": function(t, e, i) {
                                i.stroked = !!t, this[e] = t, Qt(t) && (t += "px"), this.setAttr("strokeweight", t)
                            },
                            titleSetter: function(t, e) {
                                this.setAttr(e, t)
                            },
                            visibilitySetter: function(t, e, i) {
                                "inherit" === t && (t = "visible"), this.shadows && Xt(this.shadows, (function(i) {
                                    i.style[e] = t
                                })), "DIV" === i.nodeName && (t = "hidden" === t ? "-999em" : 0, bt || (i.style[e] = t ? "visible" : "hidden"), e = "top"), i.style[e] = t
                            },
                            displaySetter: function(t, e, i) {
                                i.style[e] = t
                            },
                            xSetter: function(t, e, i) {
                                this[e] = t, "x" === e ? e = "left" : "y" === e && (e = "top"), this.updateClipping ? (this[e] = t, this.updateClipping()) : i.style[e] = t
                            },
                            zIndexSetter: function(t, e, i) {
                                i.style[e] = t
                            }
                        })["stroke-opacitySetter"] = ne["fill-opacitySetter"], nt.VMLElement = ne = g(M, ne), ne.prototype.ySetter = ne.prototype.widthSetter = ne.prototype.heightSetter = ne.prototype.xSetter;
                        var ae = {
                            Element: ne,
                            isIE8: vt.indexOf("MSIE 8.0") > -1,
                            init: function(t, e, i, r) {
                                var n;
                                if (this.alignedObjects = [], n = (r = this.createElement(Ot).css(qt(this.getStyle(r), {
                                        position: "relative"
                                    }))).element, t.appendChild(r.element), this.isVML = !0, this.box = n, this.boxWrapper = r, this.gradients = {}, this.cache = {}, this.cacheKeys = [], this.imgCount = 0, this.setSize(e, i, !1), !st.namespaces.hcv) {
                                    st.namespaces.add("hcv", "urn:schemas-microsoft-com:vml");
                                    try {
                                        st.createStyleSheet().cssText = "hcv\\:fill, hcv\\:path, hcv\\:shape, hcv\\:stroke{ behavior:url(#default#VML); display: inline-block; } "
                                    } catch (t) {
                                        st.styleSheets[0].cssText += "hcv\\:fill, hcv\\:path, hcv\\:shape, hcv\\:stroke{ behavior:url(#default#VML); display: inline-block; } "
                                    }
                                }
                            },
                            isHidden: function() {
                                return !this.box.offsetWidth
                            },
                            clipRect: function(t, e, i, r) {
                                var n = this.createElement(),
                                    s = Jt(t);
                                return qt(n, {
                                    members: [],
                                    count: 0,
                                    left: (s ? t.x : t) + 1,
                                    top: (s ? t.y : e) + 1,
                                    width: (s ? t.width : i) - 1,
                                    height: (s ? t.height : r) - 1,
                                    getCSS: function(t) {
                                        var e = (n = t.element).nodeName,
                                            i = (t = t.inverted, this.top - ("shape" === e ? n.offsetTop : 0)),
                                            r = this.left,
                                            n = r + this.width,
                                            s = i + this.height;
                                        return i = {
                                            clip: "rect(" + at(t ? r : i) + "px," + at(t ? s : n) + "px," + at(t ? n : s) + "px," + at(t ? i : r) + "px)"
                                        }, !t && bt && "DIV" === e && qt(i, {
                                            width: n + "px",
                                            height: s + "px"
                                        }), i
                                    },
                                    updateClipping: function() {
                                        Xt(n.members, (function(t) {
                                            t.element && t.css(n.getCSS(t))
                                        }))
                                    }
                                })
                            },
                            color: function(t, e, i, r) {
                                var n, s, o, a = this,
                                    l = /^rgba/,
                                    h = "none";
                                if (t && t.linearGradient ? o = "gradient" : t && t.radialGradient && (o = "pattern"), o) {
                                    var c, d, u, p, g, m, v, y, x = t.linearGradient || t.radialGradient,
                                        b = "",
                                        w = (t = t.stops, []),
                                        k = function() {
                                            s = ['<fill colors="' + w.join(",") + '" opacity="', g, '" o:opacity2="', p, '" type="', o, '" ', b, 'focus="100%" method="any" />'], f(a.prepVML(s), null, null, e)
                                        };
                                    if (u = t[0], y = t[t.length - 1], u[0] > 0 && t.unshift([0, u[1]]), y[0] < 1 && t.push([1, y[1]]), Xt(t, (function(t, e) {
                                            l.test(t[1]) ? (n = L(t[1]), c = n.get("rgb"), d = n.get("a")) : (c = t[1], d = 1), w.push(100 * t[0] + "% " + c), e ? (g = d, m = c) : (p = d, v = c)
                                        })), "fill" === i)
                                        if ("gradient" === o) i = x.x1 || x[0] || 0, t = x.y1 || x[1] || 0, u = x.x2 || x[2] || 0, x = x.y2 || x[3] || 0, b = 'angle="' + (90 - 180 * ot.atan((x - t) / (u - i)) / gt) + '"', k();
                                        else {
                                            var C, T = 2 * (h = x.r),
                                                S = 2 * h,
                                                A = x.cx,
                                                P = x.cy,
                                                D = e.radialReference;
                                            h = function() {
                                                D && (C = r.getBBox(), A += (D[0] - C.x) / C.width - .5, P += (D[1] - C.y) / C.height - .5, T *= D[2] / C.width, S *= D[2] / C.height), b = 'src="' + N.global.VMLRadialGradientURL + '" size="' + T + "," + S + '" origin="0.5,0.5" position="' + A + "," + P + '" color2="' + v + '" ', k()
                                            }, r.added ? h() : r.onAdd = h, h = m
                                        }
                                    else h = c
                                } else l.test(t) && "IMG" !== e.tagName ? (n = L(t), r[i + "-opacitySetter"](n.get("a"), i, e), h = n.get("rgb")) : ((h = e.getElementsByTagName(i)).length && (h[0].opacity = 1, h[0].type = "solid"), h = t);
                                return h
                            },
                            prepVML: function(t) {
                                var e = this.isIE8;
                                return t = t.join(""), t = e ? -1 === (t = t.replace("/>", ' xmlns="urn:schemas-microsoft-com:vml" />')).indexOf('style="') ? t.replace("/>", ' style="display:inline-block;behavior:url(#default#VML);" />') : t.replace('style="', 'style="display:inline-block;behavior:url(#default#VML);') : t.replace("<", "<hcv:")
                            },
                            text: oe.prototype.html,
                            path: function(t) {
                                var e = {
                                    coordsize: "10 10"
                                };
                                return a(t) ? e.d = t : Jt(t) && qt(e, t), this.createElement("shape").attr(e)
                            },
                            circle: function(t, e, i) {
                                var r = this.symbol("circle");
                                return Jt(t) && (i = t.r, e = t.y, t = t.x), r.isCircle = !0, r.r = i, r.attr({
                                    x: t,
                                    y: e
                                })
                            },
                            g: function(t) {
                                var e;
                                return t && (e = {
                                    className: "highcharts-" + t,
                                    class: "highcharts-" + t
                                }), this.createElement(Ot).attr(e)
                            },
                            image: function(t, e, i, r, n) {
                                var s = this.createElement("img").attr({
                                    src: t
                                });
                                return arguments.length > 1 && s.attr({
                                    x: e,
                                    y: i,
                                    width: r,
                                    height: n
                                }), s
                            },
                            createElement: function(t) {
                                return "rect" === t ? this.symbol(t) : oe.prototype.createElement.call(this, t)
                            },
                            invertChild: function(t, e) {
                                var i = this,
                                    r = e.style,
                                    n = "IMG" === t.tagName && t.style;
                                p(t, {
                                    flip: "x",
                                    left: s(r.width) - (n ? s(n.top) : 1),
                                    top: s(r.height) - (n ? s(n.left) : 1),
                                    rotation: -90
                                }), Xt(t.childNodes, (function(e) {
                                    i.invertChild(e, t)
                                }))
                            },
                            symbols: {
                                arc: function(t, e, i, r, n) {
                                    var s = n.start,
                                        o = n.end,
                                        a = n.r || i || r,
                                        l = (i = n.innerR, r = pt(s), ft(s)),
                                        h = pt(o),
                                        c = ft(o);
                                    return o - s == 0 ? ["x"] : (s = ["wa", t - a, e - a, t + a, e + a, t + a * r, e + a * l, t + a * h, e + a * c], n.open && !i && s.push("e", Bt, t, e), s.push("at", t - i, e - i, t + i, e + i, t + i * h, e + i * c, t + i * r, e + i * l, "x", "e"), s.isArc = !0, s)
                                },
                                circle: function(t, e, i, r, n) {
                                    return n && (i = r = 2 * n.r), n && n.isCircle && (t -= i / 2, e -= r / 2), ["wa", t, e, t + i, e + r, t + i, e + r / 2, t + i, e + r / 2, "e"]
                                },
                                rect: function(t, e, i, r, n) {
                                    return oe.prototype.symbols[h(n) && n.r ? "callout" : "square"].call(0, t, e, i, r, n)
                                }
                            }
                        };
                        nt.VMLRenderer = ne = function() {
                            this.init.apply(this, arguments)
                        }, ne.prototype = n(oe.prototype, ae), E = ne
                    }
                    oe.prototype.measureSpanWidth = function(t, e) {
                        var i, r = st.createElement("span");
                        return i = st.createTextNode(t), r.appendChild(i), p(r, e), this.box.appendChild(r), i = r.offsetWidth, S(r), i
                    }, Pt && (nt.CanVGRenderer = ne = function() {
                        Tt = "http://www.w3.org/1999/xhtml"
                    }, ne.prototype.symbols = {}, se = function() {
                        function t() {
                            var t, i = e.length;
                            for (t = 0; t < i; t++) e[t]();
                            e = []
                        }
                        var e = [];
                        return {
                            push: function(i, r) {
                                if (0 === e.length) {
                                    var n = st.getElementsByTagName("head")[0],
                                        s = st.createElement("script");
                                    s.type = "text/javascript", s.src = r, s.onload = t, n.appendChild(s)
                                }
                                e.push(i)
                            }
                        }
                    }(), E = ne), R.prototype = {
                        addLabel: function() {
                            var t, e = this.axis,
                                i = e.options,
                                r = e.chart,
                                s = e.categories,
                                o = e.names,
                                a = this.pos,
                                l = i.labels,
                                c = a === (u = e.tickPositions)[0],
                                d = a === u[u.length - 1],
                                u = (o = s ? te(s[a], o[a], a) : a, s = this.label, u.info);
                            e.isDatetimeAxis && u && (t = i.dateTimeLabelFormats[u.higherRanks[a] || u.unitName]), this.isFirst = c, this.isLast = d, i = e.labelFormatter.call({
                                axis: e,
                                chart: r,
                                isFirst: c,
                                isLast: d,
                                dateTimeLabelFormat: t,
                                value: e.isLog ? A(e.lin2log(o)) : o
                            }), h(s) ? s && s.attr({
                                text: i
                            }) : (this.labelLength = (this.label = s = h(i) && l.enabled ? r.renderer.text(i, 0, 0, l.useHTML).css(n(l.style)).add(e.labelGroup) : null) && s.getBBox().width, this.rotation = 0)
                        },
                        getLabelSize: function() {
                            return this.label ? this.label.getBBox()[this.axis.horiz ? "height" : "width"] : 0
                        },
                        handleOverflow: function(t) {
                            var e, i = this.axis,
                                r = t.x,
                                n = i.chart.chartWidth,
                                s = i.chart.spacing,
                                o = te(i.labelLeft, dt(i.pos, s[3])),
                                a = (s = te(i.labelRight, ct(i.pos + i.len, n - s[1])), this.label),
                                l = this.rotation,
                                h = {
                                    left: 0,
                                    center: .5,
                                    right: 1
                                } [i.labelAlign],
                                c = a.getBBox().width,
                                d = i.getSlotWidth(),
                                u = d,
                                p = 1,
                                f = {};
                            l ? l < 0 && r - h * c < o ? e = at(r / pt(l * mt) - o) : l > 0 && r + h * c > s && (e = at((n - r) / pt(l * mt))) : (n = r + (1 - h) * c, r - h * c < o ? u = t.x + u * (1 - h) - o : n > s && (u = s - t.x + u * h, p = -1), (u = dt(d, u)) < d && "center" === i.labelAlign && (t.x += p * (d - u - h * (d - dt(c, u)))), (c > u || i.autoRotation && a.styles.width) && (e = u)), e && (f.width = e, i.options.labels.style.textOverflow || (f.textOverflow = "ellipsis"), a.css(f))
                        },
                        getPosition: function(t, e, i, r) {
                            var n = this.axis,
                                s = n.chart,
                                o = r && s.oldChartHeight || s.chartHeight;
                            return {
                                x: t ? n.translate(e + i, null, null, r) + n.transB : n.left + n.offset + (n.opposite ? (r && s.oldChartWidth || s.chartWidth) - n.right - n.left : 0),
                                y: t ? o - n.bottom + n.offset - (n.opposite ? n.height : 0) : o - n.translate(e + i, null, null, r) - n.transB
                            }
                        },
                        getLabelPosition: function(t, e, i, r, n, s, o, a) {
                            var l = this.axis,
                                c = l.transA,
                                d = l.reversed,
                                u = l.staggerLines,
                                p = l.tickRotCorr || {
                                    x: 0,
                                    y: 0
                                },
                                f = n.y;
                            return h(f) || (f = 0 === l.side ? i.rotation ? -8 : -i.getBBox().height : 2 === l.side ? p.y + 8 : pt(i.rotation * mt) * (p.y - i.getBBox(!1, 0).height / 2)), t = t + n.x + p.x - (s && r ? s * c * (d ? -1 : 1) : 0), e = e + f - (s && !r ? s * c * (d ? 1 : -1) : 0), u && (i = o / (a || 1) % u, l.opposite && (i = u - i - 1), e += i * (l.labelOffset / u)), {
                                x: t,
                                y: at(e)
                            }
                        },
                        getMarkPath: function(t, e, i, r, n, s) {
                            return s.crispLine([Bt, t, e, Et, t + (n ? 0 : -i), e + (n ? i : 0)], r)
                        },
                        render: function(t, e, i) {
                            var r = this.axis,
                                n = r.options,
                                s = r.chart.renderer,
                                o = r.horiz,
                                a = this.type,
                                l = this.label,
                                h = this.pos,
                                c = n.labels,
                                d = this.gridLine,
                                u = a ? a + "Tick" : "tick",
                                p = n[(m = a ? a + "Grid" : "grid") + "LineWidth"],
                                f = n[m + "LineColor"],
                                g = n[m + "LineDashStyle"],
                                m = r.tickSize(u),
                                v = (u = n[u + "Color"], this.mark),
                                y = c.step,
                                x = !0,
                                b = r.tickmarkOffset,
                                w = (k = this.getPosition(o, h, b, e)).x,
                                k = k.y,
                                C = o && w === r.pos + r.len || !o && k === r.pos ? -1 : 1;
                            i = te(i, 1), this.isActive = !0, p && (h = r.getPlotLinePath(h + b, p * C, e, !0), d === B && (d = {
                                stroke: f,
                                "stroke-width": p
                            }, g && (d.dashstyle = g), a || (d.zIndex = 1), e && (d.opacity = 0), this.gridLine = d = p ? s.path(h).attr(d).add(r.gridGroup) : null), !e && d && h && d[this.isNew ? "attr" : "animate"]({
                                d: h,
                                opacity: i
                            })), m && (r.opposite && (m[0] = -m[0]), a = this.getMarkPath(w, k, m[0], m[1] * C, o, s), v ? v.animate({
                                d: a,
                                opacity: i
                            }) : this.mark = s.path(a).attr({
                                stroke: u,
                                "stroke-width": m[1],
                                opacity: i
                            }).add(r.axisGroup)), l && Qt(w) && (l.xy = k = this.getLabelPosition(w, k, l, o, c, b, t, y), this.isFirst && !this.isLast && !te(n.showFirstLabel, 1) || this.isLast && !this.isFirst && !te(n.showLastLabel, 1) ? x = !1 : o && !r.isRadial && !c.step && !c.rotation && !e && 0 !== i && this.handleOverflow(k), y && t % y && (x = !1), x && Qt(k.y) ? (k.opacity = i, l[this.isNew ? "attr" : "animate"](k)) : (Kt(l), l.attr("y", -9999)), this.isNew = !1)
                        },
                        destroy: function() {
                            T(this, this.axis)
                        }
                    }, nt.PlotLineOrBand = function(t, e) {
                        this.axis = t, e && (this.options = e, this.id = e.id)
                    }, nt.PlotLineOrBand.prototype = {
                        render: function() {
                            var t, e = this,
                                i = e.axis,
                                r = i.horiz,
                                s = e.options,
                                o = s.label,
                                a = e.label,
                                l = s.width,
                                c = s.to,
                                d = s.from,
                                u = h(d) && h(c),
                                p = s.value,
                                f = s.dashStyle,
                                g = e.svgElem,
                                m = [],
                                v = s.color,
                                y = te(s.zIndex, 0),
                                x = s.events,
                                b = {},
                                w = i.chart.renderer;
                            if (m = i.log2lin, i.isLog && (d = m(d), c = m(c), p = m(p)), l) m = i.getPlotLinePath(p, l), b = {
                                stroke: v,
                                "stroke-width": l
                            }, f && (b.dashstyle = f);
                            else {
                                if (!u) return;
                                m = i.getPlotBandPath(d, c, s), v && (b.fill = v), s.borderWidth && (b.stroke = s.borderColor, b["stroke-width"] = s.borderWidth)
                            }
                            if (b.zIndex = y, g) m ? (g.show(), g.animate({
                                d: m
                            })) : (g.hide(), a && (e.label = a = a.destroy()));
                            else if (m && m.length && (e.svgElem = g = w.path(m).attr(b).add(), x))
                                for (t in s = function(t) {
                                        g.on(t, (function(i) {
                                            x[t].apply(e, [i])
                                        }))
                                    }, x) s(t);
                            return o && h(o.text) && m && m.length && i.width > 0 && i.height > 0 && !m.flat ? (o = n({
                                align: r && u && "center",
                                x: r ? !u && 4 : 10,
                                verticalAlign: !r && u && "middle",
                                y: r ? u ? 16 : 10 : u ? 6 : -4,
                                rotation: r && !u && 90
                            }, o), this.renderLabel(o, m, u, y)) : a && a.hide(), e
                        },
                        renderLabel: function(t, e, i, r) {
                            var n = this.label,
                                s = this.axis.chart.renderer;
                            n || ((n = {
                                align: t.textAlign || t.align,
                                rotation: t.rotation
                            }).zIndex = r, this.label = n = s.text(t.text, 0, 0, t.useHTML).attr(n).css(t.style).add()), r = [e[1], e[4], i ? e[6] : e[1]], e = [e[2], e[5], i ? e[7] : e[2]], i = k(r), s = k(e), n.align(t, !1, {
                                x: i,
                                y: s,
                                width: C(r) - i,
                                height: C(e) - s
                            }), n.show()
                        },
                        destroy: function() {
                            l(this.axis.plotLinesAndBands, this), delete this.axis, T(this)
                        }
                    };
                    var le = nt.Axis = function() {
                        this.init.apply(this, arguments)
                    };
                    le.prototype = {
                        defaultOptions: {
                            dateTimeLabelFormats: {
                                millisecond: "%H:%M:%S.%L",
                                second: "%H:%M:%S",
                                minute: "%H:%M",
                                hour: "%H:%M",
                                day: "%e. %b",
                                week: "%e. %b",
                                month: "%b '%y",
                                year: "%Y"
                            },
                            endOnTick: !1,
                            gridLineColor: "#D8D8D8",
                            labels: {
                                enabled: !0,
                                style: {
                                    color: "#606060",
                                    cursor: "default",
                                    fontSize: "11px"
                                },
                                x: 0
                            },
                            lineColor: "#C0D0E0",
                            lineWidth: 1,
                            minPadding: .01,
                            maxPadding: .01,
                            minorGridLineColor: "#E0E0E0",
                            minorGridLineWidth: 1,
                            minorTickColor: "#A0A0A0",
                            minorTickLength: 2,
                            minorTickPosition: "outside",
                            startOfWeek: 1,
                            startOnTick: !1,
                            tickColor: "#C0D0E0",
                            tickLength: 10,
                            tickmarkPlacement: "between",
                            tickPixelInterval: 100,
                            tickPosition: "outside",
                            title: {
                                align: "middle",
                                style: {
                                    color: "#707070"
                                }
                            },
                            type: "linear"
                        },
                        defaultYAxisOptions: {
                            endOnTick: !0,
                            gridLineWidth: 1,
                            tickPixelInterval: 72,
                            showLastLabel: !0,
                            labels: {
                                x: -8
                            },
                            lineWidth: 0,
                            maxPadding: .05,
                            minPadding: .05,
                            startOnTick: !0,
                            title: {
                                rotation: 270,
                                text: "Values"
                            },
                            stackLabels: {
                                enabled: !1,
                                formatter: function() {
                                    return nt.numberFormat(this.total, -1)
                                },
                                style: n(ie.line.dataLabels.style, {
                                    color: "#000000"
                                })
                            }
                        },
                        defaultLeftAxisOptions: {
                            labels: {
                                x: -15
                            },
                            title: {
                                rotation: 270
                            }
                        },
                        defaultRightAxisOptions: {
                            labels: {
                                x: 15
                            },
                            title: {
                                rotation: 90
                            }
                        },
                        defaultBottomAxisOptions: {
                            labels: {
                                autoRotation: [-45],
                                x: 0
                            },
                            title: {
                                rotation: 0
                            }
                        },
                        defaultTopAxisOptions: {
                            labels: {
                                autoRotation: [-45],
                                x: 0
                            },
                            title: {
                                rotation: 0
                            }
                        },
                        init: function(t, e) {
                            var i = e.isX;
                            this.chart = t, this.horiz = t.inverted ? !i : i, this.isXAxis = i, this.coll = this.coll || (i ? "xAxis" : "yAxis"), this.opposite = e.opposite, this.side = e.side || (this.horiz ? this.opposite ? 0 : 2 : this.opposite ? 1 : 3), this.setOptions(e);
                            var r = (s = this.options).type;
                            this.labelFormatter = s.labels.formatter || this.defaultLabelFormatter, this.userOptions = e, this.minPixelPadding = 0, this.reversed = s.reversed, this.visible = !1 !== s.visible, this.zoomEnabled = !1 !== s.zoomEnabled, this.hasNames = "category" === r || !0 === s.categories, this.categories = s.categories || this.hasNames, this.names = this.names || [], this.isLog = "logarithmic" === r, this.isDatetimeAxis = "datetime" === r, this.isLinked = h(s.linkedTo), this.ticks = {}, this.labelEdge = [], this.minorTicks = {}, this.plotLinesAndBands = [], this.alternateBands = {}, this.len = 0, this.minRange = this.userMinRange = s.minRange || s.maxZoom, this.range = s.range, this.offset = s.offset || 0, this.stacks = {}, this.oldStacks = {}, this.stacksTouched = 0, this.min = this.max = null, this.crosshair = te(s.crosshair, d(t.options.tooltip.crosshairs)[i ? 0 : 1], !1);
                            var n, s = this.options.events;
                            for (n in -1 === Ht(this, t.axes) && (i ? t.axes.splice(t.xAxis.length, 0, this) : t.axes.push(this), t[this.coll].push(this)), this.series = this.series || [], t.inverted && i && this.reversed === B && (this.reversed = !0), this.removePlotLine = this.removePlotBand = this.removePlotBandOrLine, s) jt(this, n, s[n]);
                            this.isLog && (this.val2lin = this.log2lin, this.lin2val = this.lin2log)
                        },
                        setOptions: function(t) {
                            this.options = n(this.defaultOptions, "yAxis" === this.coll && this.defaultYAxisOptions, [this.defaultTopAxisOptions, this.defaultRightAxisOptions, this.defaultBottomAxisOptions, this.defaultLeftAxisOptions][this.side], n(N[this.coll], t))
                        },
                        defaultLabelFormatter: function() {
                            var t, e = this.axis,
                                i = this.value,
                                r = e.categories,
                                n = this.dateTimeLabelFormat,
                                s = N.lang.numericSymbols,
                                o = s && s.length,
                                a = e.options.labels.format;
                            if (e = e.isLog ? i : e.tickInterval, a) t = y(a, this);
                            else if (r) t = i;
                            else if (n) t = $(n, i);
                            else if (o && e >= 1e3)
                                for (; o-- && t === B;) e >= (r = Math.pow(1e3, o + 1)) && 10 * i % r == 0 && null !== s[o] && 0 !== i && (t = nt.numberFormat(i / r, -1) + s[o]);
                            return t === B && (t = ut(i) >= 1e4 ? nt.numberFormat(i, -1) : nt.numberFormat(i, -1, B, "")), t
                        },
                        getSeriesExtremes: function() {
                            var t = this,
                                e = t.chart;
                            t.hasVisibleSeries = !1, t.dataMin = t.dataMax = t.threshold = null, t.softThreshold = !t.isXAxis, t.buildStacks && t.buildStacks(), Xt(t.series, (function(i) {
                                if (i.visible || !e.options.chart.ignoreHiddenSeries) {
                                    var r, n = i.options,
                                        s = n.threshold;
                                    t.hasVisibleSeries = !0, t.isLog && s <= 0 && (s = null), t.isXAxis ? (n = i.xData).length && (i = k(n), !Qt(i) && !(i instanceof X) && (n = Gt(n, (function(t) {
                                        return Qt(t)
                                    })), i = k(n)), t.dataMin = dt(te(t.dataMin, n[0]), i), t.dataMax = ct(te(t.dataMax, n[0]), C(n))) : (i.getExtremes(), r = i.dataMax, h(i = i.dataMin) && h(r) && (t.dataMin = dt(te(t.dataMin, i), i), t.dataMax = ct(te(t.dataMax, r), r)), h(s) && (t.threshold = s), n.softThreshold && !t.isLog || (t.softThreshold = !1))
                                }
                            }))
                        },
                        translate: function(t, e, i, r, n, s) {
                            var o = this.linkedParent || this,
                                a = 1,
                                l = 0,
                                h = r ? o.oldTransA : o.transA,
                                c = (r = r ? o.oldMin : o.min, o.minPixelPadding);
                            return n = (o.isOrdinal || o.isBroken || o.isLog && n) && o.lin2val, h || (h = o.transA), i && (a *= -1, l = o.len), o.reversed && (l -= (a *= -1) * (o.sector || o.len)), e ? (t = t * a + l, t = (t -= c) / h + r, n && (t = o.lin2val(t))) : (n && (t = o.val2lin(t)), "between" === s && (s = .5), t = a * (t - r) * h + l + a * c + (Qt(s) ? h * s * o.pointRange : 0)), t
                        },
                        toPixels: function(t, e) {
                            return this.translate(t, !1, !this.horiz, null, !0) + (e ? 0 : this.pos)
                        },
                        toValue: function(t, e) {
                            return this.translate(t - (e ? 0 : this.pos), !0, !this.horiz, null, !0)
                        },
                        getPlotLinePath: function(t, e, i, r, n) {
                            var s, o, a, l = this.chart,
                                h = this.left,
                                c = this.top,
                                d = i && l.oldChartHeight || l.chartHeight,
                                u = i && l.oldChartWidth || l.chartWidth;
                            s = this.transB;
                            var p = function(t, e, i) {
                                return (t < e || t > i) && (r ? t = dt(ct(e, t), i) : a = !0), t
                            };
                            return n = te(n, this.translate(t, null, null, i)), t = i = at(n + s), s = o = at(d - n - s), Qt(n) ? this.horiz ? (s = c, o = d - this.bottom, t = i = p(t, h, h + this.width)) : (t = h, i = u - this.right, s = o = p(s, c, c + this.height)) : a = !0, a && !r ? null : l.renderer.crispLine([Bt, t, s, Et, i, o], e || 1)
                        },
                        getLinearTickPositions: function(t, e, i) {
                            var r, n = A(lt(e / t) * t),
                                s = A(ht(i / t) * t),
                                o = [];
                            if (e === i && Qt(e)) return [e];
                            for (e = n; e <= s && (o.push(e), (e = A(e + t)) !== r);) r = e;
                            return o
                        },
                        getMinorTickPositions: function() {
                            var t, e = this.options,
                                i = this.tickPositions,
                                r = this.minorTickInterval,
                                n = [],
                                s = this.pointRangePadding || 0;
                            t = this.min - s;
                            var o = (s = this.max + s) - t;
                            if (o && o / r < this.len / 3)
                                if (this.isLog)
                                    for (s = i.length, t = 1; t < s; t++) n = n.concat(this.getLogTickPositions(r, i[t - 1], i[t], !0));
                                else if (this.isDatetimeAxis && "auto" === e.minorTickInterval) n = n.concat(this.getTimeTicks(this.normalizeTimeTickInterval(r), t, s, e.startOfWeek));
                            else
                                for (i = t + (i[0] - t) % r; i <= s; i += r) n.push(i);
                            return 0 !== n.length && this.trimTicks(n, e.startOnTick, e.endOnTick), n
                        },
                        adjustForMinRange: function() {
                            var t, e, i, r, n, s, o = this.options,
                                a = this.min,
                                l = this.max,
                                c = this.dataMax - this.dataMin >= this.minRange;
                            this.isXAxis && this.minRange === B && !this.isLog && (h(o.min) || h(o.max) ? this.minRange = null : (Xt(this.series, (function(t) {
                                for (n = t.xData, i = t.xIncrement ? 1 : n.length - 1; i > 0; i--) r = n[i] - n[i - 1], (e === B || r < e) && (e = r)
                            })), this.minRange = dt(5 * e, this.dataMax - this.dataMin))), l - a < this.minRange && (t = [a - (t = ((s = this.minRange) - l + a) / 2), te(o.min, a - t)], c && (t[2] = this.isLog ? this.log2lin(this.dataMin) : this.dataMin), l = [(a = C(t)) + s, te(o.max, a + s)], c && (l[2] = this.isLog ? this.log2lin(this.dataMax) : this.dataMax), (l = k(l)) - a < s && (t[0] = l - s, t[1] = te(o.min, l - s), a = C(t))), this.min = a, this.max = l
                        },
                        getClosest: function() {
                            var t;
                            return this.categories ? t = 1 : Xt(this.series, (function(e) {
                                var i = e.closestPointRange;
                                !e.noSharedTooltip && h(i) && (t = h(t) ? dt(t, i) : i)
                            })), t
                        },
                        nameToX: function(t) {
                            var e, i = a(this.categories),
                                r = i ? this.categories : this.names,
                                n = t.options.x;
                            return t.series.requireSorting = !1, h(n) || (n = !1 === this.options.nameToX ? t.series.autoIncrement() : Ht(t.name, r)), -1 === n ? i || (e = r.length) : e = n, this.names[e] = t.name, e
                        },
                        updateNames: function() {
                            var t = this;
                            this.names.length > 0 && (this.names.length = 0, this.minRange = void 0, Xt(this.series || [], (function(e) {
                                e.processedXData || (e.processData(), e.generatePoints()), Xt(e.points, (function(i, r) {
                                    var n;
                                    i.options && void 0 === i.options.x && (n = t.nameToX(i)) !== i.x && (i.x = n, e.xData[r] = n)
                                }))
                            })))
                        },
                        setAxisTranslation: function(t) {
                            var e, i = this,
                                r = i.max - i.min,
                                n = i.axisPointRange || 0,
                                s = 0,
                                a = 0,
                                l = i.linkedParent,
                                h = !!i.categories,
                                c = i.transA,
                                d = i.isXAxis;
                            (d || h || n) && (l ? (s = l.minPointOffset, a = l.pointRangePadding) : (e = i.getClosest(), Xt(i.series, (function(t) {
                                var r = h ? 1 : d ? te(t.options.pointRange, e, 0) : i.axisPointRange || 0;
                                t = t.options.pointPlacement, n = ct(n, r), i.single || (s = ct(s, o(t) ? 0 : r / 2), a = ct(a, "on" === t ? 0 : r))
                            }))), l = i.ordinalSlope && e ? i.ordinalSlope / e : 1, i.minPointOffset = s *= l, i.pointRangePadding = a *= l, i.pointRange = dt(n, r), d && (i.closestPointRange = e)), t && (i.oldTransA = c), i.translationSlope = i.transA = c = i.len / (r + a || 1), i.transB = i.horiz ? i.left : i.bottom, i.minPixelPadding = c * s
                        },
                        minFromRange: function() {
                            return this.max - this.range
                        },
                        setTickInterval: function(t) {
                            var i, r, n, s, o = this,
                                a = o.chart,
                                l = o.options,
                                c = o.isLog,
                                d = o.log2lin,
                                u = o.isDatetimeAxis,
                                p = o.isXAxis,
                                f = o.isLinked,
                                g = l.maxPadding,
                                m = l.minPadding,
                                v = l.tickInterval,
                                y = l.tickPixelInterval,
                                w = o.categories,
                                k = o.threshold,
                                C = o.softThreshold;
                            !u && !w && !f && this.getTickAmount(), n = te(o.userMin, l.min), s = te(o.userMax, l.max), f ? (o.linkedParent = a[o.coll][l.linkedTo], a = o.linkedParent.getExtremes(), o.min = te(a.min, a.dataMin), o.max = te(a.max, a.dataMax), l.type !== o.linkedParent.options.type && e(11, 1)) : (!C && h(k) && (o.dataMin >= k ? (i = k, m = 0) : o.dataMax <= k && (r = k, g = 0)), o.min = te(n, i, o.dataMin), o.max = te(s, r, o.dataMax)), c && (!t && dt(o.min, te(o.dataMin, o.min)) <= 0 && e(10, 1), o.min = A(d(o.min), 15), o.max = A(d(o.max), 15)), o.range && h(o.max) && (o.userMin = o.min = n = ct(o.min, o.minFromRange()), o.userMax = s = o.max, o.range = null), Vt(o, "foundExtremes"), o.beforePadding && o.beforePadding(), o.adjustForMinRange(), w || o.axisPointRange || o.usePercentage || f || !h(o.min) || !h(o.max) || !(d = o.max - o.min) || (!h(n) && m && (o.min -= d * m), !h(s) && g && (o.max += d * g)), Qt(l.floor) && (o.min = ct(o.min, l.floor)), Qt(l.ceiling) && (o.max = dt(o.max, l.ceiling)), C && h(o.dataMin) && (k = k || 0, !h(n) && o.min < k && o.dataMin >= k ? o.min = k : !h(s) && o.max > k && o.dataMax <= k && (o.max = k)), o.tickInterval = o.min === o.max || void 0 === o.min || void 0 === o.max ? 1 : f && !v && y === o.linkedParent.options.tickPixelInterval ? v = o.linkedParent.tickInterval : te(v, this.tickAmount ? (o.max - o.min) / ct(this.tickAmount - 1, 1) : void 0, w ? 1 : (o.max - o.min) * y / ct(o.len, y)), p && !t && Xt(o.series, (function(t) {
                                t.processData(o.min !== o.oldMin || o.max !== o.oldMax)
                            })), o.setAxisTranslation(!0), o.beforeSetTickPositions && o.beforeSetTickPositions(), o.postProcessTickInterval && (o.tickInterval = o.postProcessTickInterval(o.tickInterval)), o.pointRange && !v && (o.tickInterval = ct(o.pointRange, o.tickInterval)), t = te(l.minTickInterval, o.isDatetimeAxis && o.closestPointRange), !v && o.tickInterval < t && (o.tickInterval = t), u || c || v || (o.tickInterval = b(o.tickInterval, null, x(o.tickInterval), te(l.allowDecimals, !(o.tickInterval > .5 && o.tickInterval < 5 && o.max > 1e3 && o.max < 9999)), !!this.tickAmount)), this.tickAmount || (o.tickInterval = o.unsquish()), this.setTickPositions()
                        },
                        setTickPositions: function() {
                            var t, e, i = this.options,
                                r = i.tickPositions,
                                n = i.tickPositioner,
                                s = i.startOnTick,
                                o = i.endOnTick;
                            this.tickmarkOffset = this.categories && "between" === i.tickmarkPlacement && 1 === this.tickInterval ? .5 : 0, this.minorTickInterval = "auto" === i.minorTickInterval && this.tickInterval ? this.tickInterval / 5 : i.minorTickInterval, this.tickPositions = t = r && r.slice(), !t && ((t = this.isDatetimeAxis ? this.getTimeTicks(this.normalizeTimeTickInterval(this.tickInterval, i.units), this.min, this.max, i.startOfWeek, this.ordinalPositions, this.closestPointRange, !0) : this.isLog ? this.getLogTickPositions(this.tickInterval, this.min, this.max) : this.getLinearTickPositions(this.tickInterval, this.min, this.max)).length > this.len && (t = [t[0], t.pop()]), this.tickPositions = t, n && (n = n.apply(this, [this.min, this.max]))) && (this.tickPositions = t = n), this.isLinked || (this.trimTicks(t, s, o), this.min === this.max && h(this.min) && !this.tickAmount && (e = !0, this.min -= .5, this.max += .5), this.single = e, !r && !n && this.adjustTickAmount())
                        },
                        trimTicks: function(t, e, i) {
                            var r = t[0],
                                n = t[t.length - 1],
                                s = this.minPointOffset || 0;
                            if (e) this.min = r;
                            else
                                for (; this.min - s > t[0];) t.shift();
                            if (i) this.max = n;
                            else
                                for (; this.max + s < t[t.length - 1];) t.pop();
                            0 === t.length && h(r) && t.push((n + r) / 2)
                        },
                        alignToOthers: function() {
                            var t, e = {},
                                i = this.options;
                            return !1 !== this.chart.options.chart.alignTicks && !1 !== i.alignTicks && Xt(this.chart[this.coll], (function(i) {
                                var r = i.options;
                                r = [i.horiz ? r.left : r.top, r.width, r.height, r.pane].join(","), i.series.length && (e[r] ? t = !0 : e[r] = 1)
                            })), t
                        },
                        getTickAmount: function() {
                            var t = this.options,
                                e = t.tickAmount,
                                i = t.tickPixelInterval;
                            !h(t.tickInterval) && this.len < i && !this.isRadial && !this.isLog && t.startOnTick && t.endOnTick && (e = 2), !e && this.alignToOthers() && (e = ht(this.len / i) + 1), e < 4 && (this.finalTickAmt = e, e = 5), this.tickAmount = e
                        },
                        adjustTickAmount: function() {
                            var t = this.tickInterval,
                                e = this.tickPositions,
                                i = this.tickAmount,
                                r = this.finalTickAmt,
                                n = e && e.length;
                            if (n < i) {
                                for (; e.length < i;) e.push(A(e[e.length - 1] + t));
                                this.transA *= (n - 1) / (i - 1), this.max = e[e.length - 1]
                            } else n > i && (this.tickInterval *= 2, this.setTickPositions());
                            if (h(r)) {
                                for (t = i = e.length; t--;)(3 === r && t % 2 == 1 || r <= 2 && t > 0 && t < i - 1) && e.splice(t, 1);
                                this.finalTickAmt = B
                            }
                        },
                        setScale: function() {
                            var t, e;
                            this.oldMin = this.min, this.oldMax = this.max, this.oldAxisLength = this.len, this.setAxisSize(), e = this.len !== this.oldAxisLength, Xt(this.series, (function(e) {
                                (e.isDirtyData || e.isDirty || e.xAxis.isDirty) && (t = !0)
                            })), e || t || this.isLinked || this.forceRedraw || this.userMin !== this.oldUserMin || this.userMax !== this.oldUserMax || this.alignToOthers() ? (this.resetStacks && this.resetStacks(), this.forceRedraw = !1, this.getSeriesExtremes(), this.setTickInterval(), this.oldUserMin = this.userMin, this.oldUserMax = this.userMax, this.isDirty || (this.isDirty = e || this.min !== this.oldMin || this.max !== this.oldMax)) : this.cleanStacks && this.cleanStacks()
                        },
                        setExtremes: function(t, e, i, r, n) {
                            var s = this,
                                o = s.chart;
                            i = te(i, !0), Xt(s.series, (function(t) {
                                delete t.kdTree
                            })), n = qt(n, {
                                min: t,
                                max: e
                            }), Vt(s, "setExtremes", n, (function() {
                                s.userMin = t, s.userMax = e, s.eventArgs = n, i && o.redraw(r)
                            }))
                        },
                        zoom: function(t, e) {
                            var i = this.dataMin,
                                r = this.dataMax,
                                n = this.options,
                                s = dt(i, te(n.min, i));
                            return n = ct(r, te(n.max, r)), this.allowZoomOutside || (h(i) && t <= s && (t = s), h(r) && e >= n && (e = n)), this.displayBtn = t !== B || e !== B, this.setExtremes(t, e, !1, B, {
                                trigger: "zoom"
                            }), !0
                        },
                        setAxisSize: function() {
                            var t = this.chart,
                                e = (o = this.options).offsetLeft || 0,
                                i = this.horiz,
                                r = te(o.width, t.plotWidth - e + (o.offsetRight || 0)),
                                n = te(o.height, t.plotHeight),
                                s = te(o.top, t.plotTop),
                                o = te(o.left, t.plotLeft + e);
                            (e = /%$/).test(n) && (n = Math.round(parseFloat(n) / 100 * t.plotHeight)), e.test(s) && (s = Math.round(parseFloat(s) / 100 * t.plotHeight + t.plotTop)), this.left = o, this.top = s, this.width = r, this.height = n, this.bottom = t.chartHeight - n - s, this.right = t.chartWidth - r - o, this.len = ct(i ? r : n, 0), this.pos = i ? o : s
                        },
                        getExtremes: function() {
                            var t = this.isLog,
                                e = this.lin2log;
                            return {
                                min: t ? A(e(this.min)) : this.min,
                                max: t ? A(e(this.max)) : this.max,
                                dataMin: this.dataMin,
                                dataMax: this.dataMax,
                                userMin: this.userMin,
                                userMax: this.userMax
                            }
                        },
                        getThreshold: function(t) {
                            var e = this.isLog,
                                i = this.lin2log,
                                r = e ? i(this.min) : this.min;
                            return e = e ? i(this.max) : this.max, null === t || r > t ? t = r : e < t && (t = e), this.translate(t, 0, 1, 0, 1)
                        },
                        autoLabelAlign: function(t) {
                            return (t = (te(t, 0) - 90 * this.side + 720) % 360) > 15 && t < 165 ? "right" : t > 195 && t < 345 ? "left" : "center"
                        },
                        tickSize: function(t) {
                            var e = this.options,
                                i = e[t + "Length"],
                                r = te(e[t + "Width"], "tick" === t && this.isXAxis ? 1 : 0);
                            if (r && i) return "inside" === e[t + "Position"] && (i = -i), [i, r]
                        },
                        labelMetrics: function() {
                            return this.chart.renderer.fontMetrics(this.options.labels.style.fontSize, this.ticks[0] && this.ticks[0].label)
                        },
                        unsquish: function() {
                            var t, e, i, r = this.options.labels,
                                n = this.horiz,
                                s = this.tickInterval,
                                o = s,
                                a = this.len / (((this.categories ? 1 : 0) + this.max - this.min) / s),
                                l = r.rotation,
                                c = this.labelMetrics(),
                                d = Number.MAX_VALUE,
                                u = function(t) {
                                    return (t = (t /= a || 1) > 1 ? ht(t) : 1) * s
                                };
                            return n ? (i = !r.staggerLines && !r.step && (h(l) ? [l] : a < te(r.autoRotationLimit, 80) && r.autoRotation)) && Xt(i, (function(i) {
                                var r;
                                (i === l || i && i >= -90 && i <= 90) && (r = (e = u(ut(c.h / ft(mt * i)))) + ut(i / 360)) < d && (d = r, t = i, o = e)
                            })) : r.step || (o = u(c.h)), this.autoRotation = i, this.labelRotation = te(t, l), o
                        },
                        getSlotWidth: function() {
                            var t = this.chart,
                                e = this.horiz,
                                i = this.options.labels,
                                r = Math.max(this.tickPositions.length - (this.categories ? 0 : 1), 1),
                                n = t.margin[3];
                            return e && (i.step || 0) < 2 && !i.rotation && (this.staggerLines || 1) * t.plotWidth / r || !e && (n && n - t.spacing[3] || .33 * t.chartWidth)
                        },
                        renderUnsquish: function() {
                            var t, e, i, r = this.chart,
                                s = r.renderer,
                                a = this.tickPositions,
                                l = this.ticks,
                                h = this.options.labels,
                                c = this.horiz,
                                d = this.getSlotWidth(),
                                u = ct(1, at(d - 2 * (h.padding || 5))),
                                p = {},
                                f = this.labelMetrics(),
                                g = h.style.textOverflow,
                                m = 0;
                            if (o(h.rotation) || (p.rotation = h.rotation || 0), Xt(a, (function(t) {
                                    (t = l[t]) && t.labelLength > m && (m = t.labelLength)
                                })), this.maxLabelLength = m, this.autoRotation) m > u && m > f.h ? p.rotation = this.labelRotation : this.labelRotation = 0;
                            else if (d && (t = {
                                    width: u + "px"
                                }, !g))
                                for (t.textOverflow = "clip", e = a.length; !c && e--;) i = a[e], (u = l[i].label) && ("ellipsis" === u.styles.textOverflow ? u.css({
                                    textOverflow: "clip"
                                }) : l[i].labelLength > d && u.css({
                                    width: d + "px"
                                }), u.getBBox().height > this.len / a.length - (f.h - f.f) && (u.specCss = {
                                    textOverflow: "ellipsis"
                                }));
                            p.rotation && (t = {
                                width: (m > .5 * r.chartHeight ? .33 * r.chartHeight : r.chartHeight) + "px"
                            }, !g) && (t.textOverflow = "ellipsis"), (this.labelAlign = h.align || this.autoLabelAlign(this.labelRotation)) && (p.align = this.labelAlign), Xt(a, (function(e) {
                                var i = (e = l[e]) && e.label;
                                i && (i.attr(p), t && i.css(n(t, i.specCss)), delete i.specCss, e.rotation = p.rotation)
                            })), this.tickRotCorr = s.rotCorr(f.b, this.labelRotation || 0, 0 !== this.side)
                        },
                        hasData: function() {
                            return this.hasVisibleSeries || h(this.min) && h(this.max) && !!this.tickPositions
                        },
                        getOffset: function() {
                            var t, e, i, r, n = this,
                                s = (b = n.chart).renderer,
                                o = n.options,
                                a = n.tickPositions,
                                l = n.ticks,
                                c = n.horiz,
                                d = n.side,
                                u = b.inverted ? [1, 0, 3, 2][d] : d,
                                p = 0,
                                f = 0,
                                g = o.title,
                                m = o.labels,
                                v = 0,
                                y = n.opposite,
                                x = b.axisOffset,
                                b = b.clipOffset,
                                w = [-1, 1, 1, -1][d],
                                k = n.axisParent,
                                C = this.tickSize("tick");
                            if (t = n.hasData(), n.showAxis = e = t || te(o.showEmpty, !0), n.staggerLines = n.horiz && m.staggerLines, n.axisGroup || (n.gridGroup = s.g("grid").attr({
                                    zIndex: o.gridZIndex || 1
                                }).add(k), n.axisGroup = s.g("axis").attr({
                                    zIndex: o.zIndex || 2
                                }).add(k), n.labelGroup = s.g("axis-labels").attr({
                                    zIndex: m.zIndex || 7
                                }).addClass("highcharts-" + n.coll.toLowerCase() + "-labels").add(k)), t || n.isLinked) Xt(a, (function(t) {
                                l[t] ? l[t].addLabel() : l[t] = new R(n, t)
                            })), n.renderUnsquish(), !1 !== m.reserveSpace && (0 === d || 2 === d || {
                                1: "left",
                                3: "right"
                            } [d] === n.labelAlign || "center" === n.labelAlign) && Xt(a, (function(t) {
                                v = ct(l[t].getLabelSize(), v)
                            })), n.staggerLines && (v *= n.staggerLines, n.labelOffset = v * (n.opposite ? -1 : 1));
                            else
                                for (r in l) l[r].destroy(), delete l[r];
                            g && g.text && !1 !== g.enabled && (n.axisTitle || ((r = g.textAlign) || (r = (c ? {
                                low: "left",
                                middle: "center",
                                high: "right"
                            } : {
                                low: y ? "right" : "left",
                                middle: "center",
                                high: y ? "left" : "right"
                            })[g.align]), n.axisTitle = s.text(g.text, 0, 0, g.useHTML).attr({
                                zIndex: 7,
                                rotation: g.rotation || 0,
                                align: r
                            }).addClass("highcharts-" + this.coll.toLowerCase() + "-title").css(g.style).add(n.axisGroup), n.axisTitle.isNew = !0), e && (p = n.axisTitle.getBBox()[c ? "height" : "width"], f = h(i = g.offset) ? 0 : te(g.margin, c ? 5 : 10)), n.axisTitle[e ? "show" : "hide"](!0)), n.offset = w * te(o.offset, x[d]), n.tickRotCorr = n.tickRotCorr || {
                                x: 0,
                                y: 0
                            }, s = 0 === d ? -n.labelMetrics().h : 2 === d ? n.tickRotCorr.y : 0, f = Math.abs(v) + f, v && (f -= s, f += w * (c ? te(m.y, n.tickRotCorr.y + 8 * w) : m.x)), n.axisTitleMargin = te(i, f), x[d] = ct(x[d], n.axisTitleMargin + p + w * n.offset, f, t && a.length && C ? C[0] : 0), o = o.offset ? 0 : 2 * lt(o.lineWidth / 2), b[u] = ct(b[u], o)
                        },
                        getLinePath: function(t) {
                            var e = this.chart,
                                i = this.opposite,
                                r = this.offset,
                                n = this.horiz,
                                s = this.left + (i ? this.width : 0) + r;
                            return r = e.chartHeight - this.bottom - (i ? this.height : 0) + r, i && (t *= -1), e.renderer.crispLine([Bt, n ? this.left : s, n ? r : this.top, Et, n ? e.chartWidth - this.right : s, n ? r : e.chartHeight - this.bottom], t)
                        },
                        getTitlePosition: function() {
                            var t = this.horiz,
                                e = this.left,
                                i = this.top,
                                r = this.len,
                                n = this.options.title,
                                s = t ? e : i,
                                o = this.opposite,
                                a = this.offset,
                                l = n.x || 0,
                                h = n.y || 0,
                                c = this.chart.renderer.fontMetrics(n.style.fontSize).f;
                            return r = {
                                low: s + (t ? 0 : r),
                                middle: s + r / 2,
                                high: s + (t ? r : 0)
                            } [n.align], e = (t ? i + this.height : e) + (t ? 1 : -1) * (o ? -1 : 1) * this.axisTitleMargin + (2 === this.side ? c : 0), {
                                x: t ? r + l : e + (o ? this.width : 0) + a + l,
                                y: t ? e + h - (o ? this.height : 0) + a : r + h
                            }
                        },
                        render: function() {
                            var t, e, i, r = this,
                                n = r.chart,
                                s = n.renderer,
                                o = r.options,
                                a = r.isLog,
                                l = r.lin2log,
                                h = r.isLinked,
                                c = r.tickPositions,
                                d = r.axisTitle,
                                p = r.ticks,
                                f = r.minorTicks,
                                g = r.alternateBands,
                                m = o.stackLabels,
                                v = o.alternateGridColor,
                                y = r.tickmarkOffset,
                                x = o.lineWidth,
                                b = n.hasRendered && Qt(r.oldMin),
                                w = r.showAxis,
                                k = D(s.globalAnimation);
                            r.labelEdge.length = 0, r.overlap = !1, Xt([p, f, g], (function(t) {
                                for (var e in t) t[e].isActive = !1
                            })), (r.hasData() || h) && (r.minorTickInterval && !r.categories && Xt(r.getMinorTickPositions(), (function(t) {
                                f[t] || (f[t] = new R(r, t, "minor")), b && f[t].isNew && f[t].render(null, !0), f[t].render(null, !1, 1)
                            })), c.length && (Xt(c, (function(t, e) {
                                (!h || t >= r.min && t <= r.max) && (p[t] || (p[t] = new R(r, t)), b && p[t].isNew && p[t].render(e, !0, .1), p[t].render(e))
                            })), y && (0 === r.min || r.single)) && (p[-1] || (p[-1] = new R(r, -1, null, !0)), p[-1].render(-1)), v && Xt(c, (function(t, s) {
                                i = c[s + 1] !== B ? c[s + 1] + y : r.max - y, s % 2 == 0 && t < r.max && i <= r.max + (n.polar ? -y : y) && (g[t] || (g[t] = new nt.PlotLineOrBand(r)), e = t + y, g[t].options = {
                                    from: a ? l(e) : e,
                                    to: a ? l(i) : i,
                                    color: v
                                }, g[t].render(), g[t].isActive = !0)
                            })), r._addedPlotLB || (Xt((o.plotLines || []).concat(o.plotBands || []), (function(t) {
                                r.addPlotBandOrLine(t)
                            })), r._addedPlotLB = !0)), Xt([p, f, g], (function(t) {
                                var e, i, r = [],
                                    s = k.duration;
                                for (e in t) t[e].isActive || (t[e].render(e, !1, 0), t[e].isActive = !1, r.push(e));
                                u((function() {
                                    for (i = r.length; i--;) t[r[i]] && !t[r[i]].isActive && (t[r[i]].destroy(), delete t[r[i]])
                                }), t !== g && n.hasRendered && s ? s : 0)
                            })), x && (t = r.getLinePath(x), r.axisLine ? r.axisLine.animate({
                                d: t
                            }) : r.axisLine = s.path(t).attr({
                                stroke: o.lineColor,
                                "stroke-width": x,
                                zIndex: 7
                            }).add(r.axisGroup), r.axisLine[w ? "show" : "hide"](!0)), d && w && (d[d.isNew ? "attr" : "animate"](r.getTitlePosition()), d.isNew = !1), m && m.enabled && r.renderStackTotals(), r.isDirty = !1
                        },
                        redraw: function() {
                            this.visible && (this.render(), Xt(this.plotLinesAndBands, (function(t) {
                                t.render()
                            }))), Xt(this.series, (function(t) {
                                t.isDirty = !0
                            }))
                        },
                        destroy: function(t) {
                            var e, i = this,
                                r = i.stacks,
                                n = i.plotLinesAndBands;
                            for (e in t || Ut(i), r) T(r[e]), r[e] = null;
                            for (Xt([i.ticks, i.minorTicks, i.alternateBands], (function(t) {
                                    T(t)
                                })), t = n.length; t--;) n[t].destroy();
                            Xt("stackTotalGroup,axisLine,axisTitle,axisGroup,gridGroup,labelGroup,cross".split(","), (function(t) {
                                i[t] && (i[t] = i[t].destroy())
                            })), this._addedPlotLB = this.chart._labelPanes = this.ordinalSlope = void 0
                        },
                        drawCrosshair: function(t, e) {
                            var i, r, n, s = this.crosshair;
                            t || (t = this.cross && this.cross.e), this.crosshair && !1 !== (h(e) || !te(s.snap, !0)) ? (te(s.snap, !0) ? h(e) && (i = this.isXAxis ? e.plotX : this.len - e.plotY) : i = this.horiz ? t.chartX - this.pos : this.len - t.chartY + this.pos, null === (i = this.isRadial ? this.getPlotLinePath(this.isXAxis ? e.x : te(e.stackY, e.y)) || null : this.getPlotLinePath(null, null, null, null, i) || null) ? this.hideCrosshair() : (r = this.categories && !this.isRadial, n = te(s.width, r ? this.transA : 1), this.cross ? this.cross.attr({
                                d: i,
                                visibility: "visible",
                                "stroke-width": n
                            }) : (r = {
                                "pointer-events": "none",
                                "stroke-width": n,
                                stroke: s.color || (r ? "rgba(155,200,255,0.2)" : "#C0C0C0"),
                                zIndex: te(s.zIndex, 2)
                            }, s.dashStyle && (r.dashstyle = s.dashStyle), this.cross = this.chart.renderer.path(i).attr(r).add()), this.cross.e = t)) : this.hideCrosshair()
                        },
                        hideCrosshair: function() {
                            this.cross && this.cross.hide()
                        }
                    }, qt(le.prototype, {
                        getPlotBandPath: function(t, e) {
                            var i = this.getPlotLinePath(e, null, null, !0),
                                r = this.getPlotLinePath(t, null, null, !0);
                            return r && i ? (r.flat = r.toString() === i.toString(), r.push(i[4], i[5], i[1], i[2])) : r = null, r
                        },
                        addPlotBand: function(t) {
                            return this.addPlotBandOrLine(t, "plotBands")
                        },
                        addPlotLine: function(t) {
                            return this.addPlotBandOrLine(t, "plotLines")
                        },
                        addPlotBandOrLine: function(t, e) {
                            var i = new nt.PlotLineOrBand(this, t).render(),
                                r = this.userOptions;
                            return i && (e && (r[e] = r[e] || [], r[e].push(t)), this.plotLinesAndBands.push(i)), i
                        },
                        removePlotBandOrLine: function(t) {
                            for (var e = this.plotLinesAndBands, i = this.options, r = this.userOptions, n = e.length; n--;) e[n].id === t && e[n].destroy();
                            Xt([i.plotLines || [], r.plotLines || [], i.plotBands || [], r.plotBands || []], (function(e) {
                                for (n = e.length; n--;) e[n].id === t && l(e, e[n])
                            }))
                        }
                    }), le.prototype.getTimeTicks = function(t, e, i, r) {
                        var n, s = [],
                            o = {},
                            a = N.global.useUTC,
                            l = new X(e - v(e)),
                            c = t.unitRange,
                            d = t.count;
                        if (h(e)) {
                            l[q](c >= H.second ? 0 : d * lt(l.getMilliseconds() / d)), c >= H.second && l[J](c >= H.minute ? 0 : d * lt(l.getSeconds() / d)), c >= H.minute && l[Q](c >= H.hour ? 0 : d * lt(l[j]() / d)), c >= H.hour && l[tt](c >= H.day ? 0 : d * lt(l[U]() / d)), c >= H.day && l[et](c >= H.month ? 1 : d * lt(l[_]() / d)), c >= H.month && (l[it](c >= H.year ? 0 : d * lt(l[K]() / d)), n = l[Z]()), c >= H.year && (n -= n % d, l[rt](n)), c === H.week && l[et](l[_]() - l[V]() + te(r, 1)), e = 1, (W || Y) && (l = l.getTime(), l = new X(l + v(l))), n = l[Z](), r = l.getTime();
                            for (var u = l[K](), p = l[_](), f = !a || !!Y, g = (H.day + (a ? v(l) : 6e4 * l.getTimezoneOffset())) % H.day; r < i;) s.push(r), c === H.year ? r = G(n + e * d, 0) : c === H.month ? r = G(n, u + e * d) : !f || c !== H.day && c !== H.week ? r += c * d : r = G(n, u, p + e * d * (c === H.day ? 1 : 7)), e++;
                            s.push(r), Xt(Gt(s, (function(t) {
                                return c <= H.hour && t % H.day === g
                            })), (function(t) {
                                o[t] = "day"
                            }))
                        }
                        return s.info = qt(t, {
                            higherRanks: o,
                            totalRange: c * d
                        }), s
                    }, le.prototype.normalizeTimeTickInterval = function(t, e) {
                        var i, r = e || [
                                ["millisecond", [1, 2, 5, 10, 20, 25, 50, 100, 200, 500]],
                                ["second", [1, 2, 5, 10, 15, 30]],
                                ["minute", [1, 2, 5, 10, 15, 30]],
                                ["hour", [1, 2, 3, 4, 6, 8, 12]],
                                ["day", [1, 2]],
                                ["week", [1, 2]],
                                ["month", [1, 2, 3, 4, 6]],
                                ["year", null]
                            ],
                            n = r[r.length - 1],
                            s = H[n[0]],
                            o = n[1];
                        for (i = 0; i < r.length && (n = r[i], s = H[n[0]], o = n[1], !(r[i + 1] && t <= (s * o[o.length - 1] + H[r[i + 1][0]]) / 2)); i++);
                        return s === H.year && t < 5 * s && (o = [1, 2, 5]), {
                            unitRange: s,
                            count: r = b(t / s, o, "year" === n[0] ? ct(x(t / s), 1) : 1),
                            unitName: n[0]
                        }
                    }, le.prototype.getLogTickPositions = function(t, e, i, r) {
                        var n = this.options,
                            s = this.len,
                            o = this.lin2log,
                            a = this.log2lin,
                            l = [];
                        if (r || (this._minorAutoInterval = null), t >= .5) t = at(t), l = this.getLinearTickPositions(t, e, i);
                        else if (t >= .08) {
                            var h, c, d, u, p;
                            for (s = lt(e), n = t > .3 ? [1, 2, 4] : t > .15 ? [1, 2, 4, 6, 8] : [1, 2, 3, 4, 5, 6, 7, 8, 9]; s < i + 1 && !p; s++)
                                for (c = n.length, h = 0; h < c && !p; h++)(d = a(o(s) * n[h])) > e && (!r || u <= i) && u !== B && l.push(u), u > i && (p = !0), u = d
                        } else e = o(e), i = o(i), t = n[r ? "minorTickInterval" : "tickInterval"], t = b(t = te("auto" === t ? null : t, this._minorAutoInterval, (i - e) * (n.tickPixelInterval / (r ? 5 : 1)) / ((r ? s / this.tickPositions.length : s) || 1)), null, x(t)), l = Yt(this.getLinearTickPositions(t, e, i), a), r || (this._minorAutoInterval = t / 5);
                        return r || (this.tickInterval = t), l
                    }, le.prototype.log2lin = function(t) {
                        return ot.log(t) / ot.LN10
                    }, le.prototype.lin2log = function(t) {
                        return ot.pow(10, t)
                    };
                    var he, ce = nt.Tooltip = function() {
                        this.init.apply(this, arguments)
                    };
                    ce.prototype = {
                        init: function(t, e) {
                            var i = e.borderWidth,
                                r = e.style,
                                n = s(r.padding);
                            this.chart = t, this.options = e, this.crosshairs = [], this.now = {
                                x: 0,
                                y: 0
                            }, this.isHidden = !0, this.label = t.renderer.label("", 0, 0, e.shape || "callout", null, null, e.useHTML, null, "tooltip").attr({
                                padding: n,
                                fill: e.backgroundColor,
                                "stroke-width": i,
                                r: e.borderRadius,
                                zIndex: 8,
                                display: "none"
                            }).css(r).css({
                                padding: 0
                            }).add(), Pt || this.label.shadow(e.shadow), this.shared = e.shared
                        },
                        destroy: function() {
                            this.label && (this.label = this.label.destroy()), clearTimeout(this.hideTimer), clearTimeout(this.tooltipTimeout)
                        },
                        move: function(t, e, i, r) {
                            var n = this,
                                s = n.now,
                                o = !1 !== n.options.animation && !n.isHidden && (ut(t - s.x) > 1 || ut(e - s.y) > 1),
                                a = n.followPointer || n.len > 1;
                            qt(s, {
                                x: o ? (2 * s.x + t) / 3 : t,
                                y: o ? (s.y + e) / 2 : e,
                                anchorX: a ? B : o ? (2 * s.anchorX + i) / 3 : i,
                                anchorY: a ? B : o ? (s.anchorY + r) / 2 : r
                            }), n.label.attr(s), o && (clearTimeout(this.tooltipTimeout), this.tooltipTimeout = setTimeout((function() {
                                n && n.move(t, e, i, r)
                            }), 32))
                        },
                        hide: function(t) {
                            var e = this;
                            clearTimeout(this.hideTimer), t = te(t, this.options.hideDelay, 500), this.isHidden || (this.hideTimer = u((function() {
                                e.label[t ? "fadeOut" : "hide"](), e.isHidden = !0
                            }), t))
                        },
                        getAnchor: function(t, e) {
                            var i, r, n, s = this.chart,
                                o = s.inverted,
                                a = s.plotTop,
                                l = s.plotLeft,
                                h = 0,
                                c = 0;
                            return i = (t = d(t))[0].tooltipPos, this.followPointer && e && (e.chartX === B && (e = s.pointer.normalize(e)), i = [e.chartX - s.plotLeft, e.chartY - a]), i || (Xt(t, (function(t) {
                                r = t.series.yAxis, n = t.series.xAxis, h += t.plotX + (!o && n ? n.left - l : 0), c += (t.plotLow ? (t.plotLow + t.plotHigh) / 2 : t.plotY) + (!o && r ? r.top - a : 0)
                            })), h /= t.length, c /= t.length, i = [o ? s.plotWidth - c : h, this.shared && !o && t.length > 1 && e ? e.chartY - a : o ? s.plotHeight - h : c]), Yt(i, at)
                        },
                        getPosition: function(t, e, i) {
                            var r, n = this.chart,
                                s = this.distance,
                                o = {},
                                a = i.h || 0,
                                l = ["y", n.chartHeight, e, i.plotY + n.plotTop, n.plotTop, n.plotTop + n.plotHeight],
                                h = ["x", n.chartWidth, t, i.plotX + n.plotLeft, n.plotLeft, n.plotLeft + n.plotWidth],
                                c = !this.followPointer && te(i.ttBelow, !n.inverted == !!i.negative),
                                d = function(t, e, i, r, n, l) {
                                    var h = i < r - s,
                                        d = r + s + i < e,
                                        u = r - s - i;
                                    if (r += s, c && d) o[t] = r;
                                    else if (!c && h) o[t] = u;
                                    else if (h) o[t] = dt(l - i, u - a < 0 ? u : u - a);
                                    else {
                                        if (!d) return !1;
                                        o[t] = ct(n, r + a + i > e ? r : r + a)
                                    }
                                },
                                u = function(t, e, i, r) {
                                    var n;
                                    return r < s || r > e - s ? n = !1 : o[t] = r < i / 2 ? 1 : r > e - i / 2 ? e - i - 2 : r - i / 2, n
                                },
                                p = function(t) {
                                    var e = l;
                                    l = h, h = e, r = t
                                };
                            return (n.inverted || this.len > 1) && p(),
                                function t() {
                                    !1 !== d.apply(0, l) ? !1 === u.apply(0, h) && !r && (p(!0), t()) : r ? o.x = o.y = 0 : (p(!0), t())
                                }(), o
                        },
                        defaultFormatter: function(t) {
                            var e, i = this.points || d(this);
                            return (e = (e = [t.tooltipFooterHeaderFormatter(i[0])]).concat(t.bodyFormatter(i))).push(t.tooltipFooterHeaderFormatter(i[0], !0)), e.join("")
                        },
                        refresh: function(t, e) {
                            var i, r, n, s, o = this.chart,
                                a = this.label,
                                l = this.options,
                                h = {},
                                c = [];
                            s = l.formatter || this.defaultFormatter, h = o.hoverPoints;
                            var u, p = this.shared;
                            clearTimeout(this.hideTimer), this.followPointer = d(t)[0].series.tooltipOptions.followPointer, i = (n = this.getAnchor(t, e))[0], r = n[1], !p || t.series && t.series.noSharedTooltip ? h = t.getLabelConfig() : (o.hoverPoints = t, h && Xt(h, (function(t) {
                                t.setState()
                            })), Xt(t, (function(t) {
                                t.setState("hover"), c.push(t.getLabelConfig())
                            })), (h = {
                                x: t[0].category,
                                y: t[0].y
                            }).points = c, this.len = c.length, t = t[0]), s = s.call(h, this), h = t.series, this.distance = te(h.tooltipOptions.distance, 16), !1 === s ? this.hide() : (this.isHidden && (Kt(a), a.attr({
                                opacity: 1,
                                display: "block"
                            }).show()), a.attr({
                                text: s
                            }), u = l.borderColor || t.color || h.color || "#606060", a.attr({
                                stroke: u
                            }), this.updatePosition({
                                plotX: i,
                                plotY: r,
                                negative: t.negative,
                                ttBelow: t.ttBelow,
                                h: n[2] || 0
                            }), this.isHidden = !1), Vt(o, "tooltipRefresh", {
                                text: s,
                                x: i + o.plotLeft,
                                y: r + o.plotTop,
                                borderColor: u
                            })
                        },
                        updatePosition: function(t) {
                            var e = this.chart,
                                i = this.label;
                            i = (this.options.positioner || this.getPosition).call(this, i.width, i.height, t), this.move(at(i.x), at(i.y || 0), t.plotX + e.plotLeft, t.plotY + e.plotTop)
                        },
                        getXDateFormat: function(t, e, i) {
                            e = e.dateTimeLabelFormats;
                            var r, n, s, o = i && i.closestPointRange,
                                a = {
                                    millisecond: 15,
                                    second: 12,
                                    minute: 9,
                                    hour: 6,
                                    day: 3
                                },
                                l = "millisecond";
                            if (o) {
                                for (n in s = $("%m-%d %H:%M:%S.%L", t.x), H) {
                                    if (o === H.week && +$("%w", t.x) === i.options.startOfWeek && "00:00:00.000" === s.substr(6)) {
                                        n = "week";
                                        break
                                    }
                                    if (H[n] > o) {
                                        n = l;
                                        break
                                    }
                                    if (a[n] && s.substr(a[n]) !== "01-01 00:00:00.000".substr(a[n])) break;
                                    "week" !== n && (l = n)
                                }
                                n && (r = e[n])
                            } else r = e.day;
                            return r || e.year
                        },
                        tooltipFooterHeaderFormatter: function(t, e) {
                            var i = e ? "footer" : "header",
                                r = t.series,
                                n = r.tooltipOptions,
                                s = n.xDateFormat,
                                o = r.xAxis,
                                a = o && "datetime" === o.options.type && Qt(t.key);
                            return i = n[i + "Format"], a && !s && (s = this.getXDateFormat(t, n, o)), a && s && (i = i.replace("{point.key}", "{point.key:" + s + "}")), y(i, {
                                point: t,
                                series: r
                            })
                        },
                        bodyFormatter: function(t) {
                            return Yt(t, (function(t) {
                                var e = t.series.tooltipOptions;
                                return (e.pointFormatter || t.point.tooltipFormatter).call(t.point, e.pointFormat)
                            }))
                        }
                    }, z = st && st.documentElement.ontouchstart !== B;
                    var de = nt.Pointer = function(t, e) {
                        this.init(t, e)
                    };
                    if (de.prototype = {
                            init: function(t, e) {
                                var i, r = (s = e.chart).events,
                                    n = Pt ? "" : s.zoomType,
                                    s = t.inverted;
                                this.options = e, this.chart = t, this.zoomX = i = /x/.test(n), this.zoomY = n = /y/.test(n), this.zoomHor = i && !s || n && s, this.zoomVert = n && !s || i && s, this.hasZoom = i || n, this.runChartClick = r && !!r.click, this.pinchDown = [], this.lastValidTouch = {}, nt.Tooltip && e.tooltip.enabled && (t.tooltip = new ce(t, e.tooltip), this.followTouchMove = te(e.tooltip.followTouchMove, !0)), this.setDOMEvents()
                            },
                            normalize: function(e, i) {
                                var r, n;
                                return (e = e || t.event).target || (e.target = e.srcElement), n = e.touches ? e.touches.length ? e.touches.item(0) : e.changedTouches[0] : e, i || (this.chartPosition = i = Wt(this.chart.container)), n.pageX === B ? (r = ct(e.x, e.clientX - i.left), n = e.y) : (r = n.pageX - i.left, n = n.pageY - i.top), qt(e, {
                                    chartX: at(r),
                                    chartY: at(n)
                                })
                            },
                            getCoordinates: function(t) {
                                var e = {
                                    xAxis: [],
                                    yAxis: []
                                };
                                return Xt(this.chart.axes, (function(i) {
                                    e[i.isXAxis ? "xAxis" : "yAxis"].push({
                                        axis: i,
                                        value: i.toValue(t[i.horiz ? "chartX" : "chartY"])
                                    })
                                })), e
                            },
                            runPointActions: function(t) {
                                var e, i, r, n, s = this.chart,
                                    o = s.series,
                                    a = s.tooltip,
                                    l = !!a && a.shared,
                                    h = !0,
                                    c = s.hoverPoint,
                                    d = s.hoverSeries,
                                    u = [];
                                if (!l && !d)
                                    for (e = 0; e < o.length; e++) !o[e].directTouch && o[e].options.stickyTracking || (o = []);
                                if (d && (l ? d.noSharedTooltip : d.directTouch) && c ? u = [c] : (!l && d && !d.options.stickyTracking && (o = [d]), Xt(o, (function(e) {
                                        i = e.noSharedTooltip && l, r = !l && e.directTouch, e.visible && !i && !r && te(e.options.enableMouseTracking, !0) && (n = e.searchPoint(t, !i && 1 === e.kdDimensions)) && n.series && u.push(n)
                                    })), u.sort((function(t, e) {
                                        var i = t.distX - e.distX,
                                            r = t.dist - e.dist,
                                            n = t.series.group.zIndex > e.series.group.zIndex ? -1 : 1;
                                        return 0 !== i ? i : 0 !== r ? r : n
                                    }))), l)
                                    for (e = u.length; e--;)(u[e].clientX !== u[0].clientX || u[e].series.noSharedTooltip) && u.splice(e, 1);
                                if (u[0] && (u[0] !== this.hoverPoint || a && a.isHidden)) {
                                    if (l && !u[0].series.noSharedTooltip) {
                                        for (e = 0; e >= 0; e--) u[e].onMouseOver(t, u[e] !== (d && d.directTouch && c || u[0]));
                                        d && d.directTouch && c && c !== u[0] && c.onMouseOver(t, !1), u.length && a && a.refresh(u.sort((function(t, e) {
                                            return t.series.index - e.series.index
                                        })), t)
                                    } else a && a.refresh(u[0], t), d && d.directTouch || u[0].onMouseOver(t);
                                    this.prevKDPoint = u[0], h = !1
                                }
                                h && (o = d && d.tooltipOptions.followPointer, a && o && !a.isHidden && (o = a.getAnchor([{}], t), a.updatePosition({
                                    plotX: o[0],
                                    plotY: o[1]
                                }))), this._onDocumentMouseMove || (this._onDocumentMouseMove = function(t) {
                                    Mt[he] && Mt[he].pointer.onDocumentMouseMove(t)
                                }, jt(st, "mousemove", this._onDocumentMouseMove)), Xt(l ? u : [te(c, u[0])], (function(e) {
                                    Xt(s.axes, (function(i) {
                                        (!e || e.series && e.series[i.coll] === i) && i.drawCrosshair(t, e)
                                    }))
                                }))
                            },
                            reset: function(t, e) {
                                var i = this.chart,
                                    r = i.hoverSeries,
                                    n = i.hoverPoint,
                                    s = i.hoverPoints,
                                    o = i.tooltip,
                                    a = o && o.shared ? s : n;
                                t && a && Xt(d(a), (function(e) {
                                    e.series.isCartesian && void 0 === e.plotX && (t = !1)
                                })), t ? o && a && (o.refresh(a), n && (n.setState(n.state, !0), Xt(i.axes, (function(t) {
                                    t.crosshair && t.drawCrosshair(null, n)
                                })))) : (n && n.onMouseOut(), s && Xt(s, (function(t) {
                                    t.setState()
                                })), r && r.onMouseOut(), o && o.hide(e), this._onDocumentMouseMove && (Ut(st, "mousemove", this._onDocumentMouseMove), this._onDocumentMouseMove = null), Xt(i.axes, (function(t) {
                                    t.hideCrosshair()
                                })), this.hoverX = this.prevKDPoint = i.hoverPoints = i.hoverPoint = null)
                            },
                            scaleGroups: function(t, e) {
                                var i, r = this.chart;
                                Xt(r.series, (function(n) {
                                    i = t || n.getPlotBox(), n.xAxis && n.xAxis.zoomEnabled && (n.group.attr(i), n.markerGroup && (n.markerGroup.attr(i), n.markerGroup.clip(e ? r.clipRect : null)), n.dataLabelsGroup && n.dataLabelsGroup.attr(i))
                                })), r.clipRect.attr(e || r.clipBox)
                            },
                            dragStart: function(t) {
                                var e = this.chart;
                                e.mouseIsDown = t.type, e.cancelClick = !1, e.mouseDownX = this.mouseDownX = t.chartX, e.mouseDownY = this.mouseDownY = t.chartY
                            },
                            drag: function(t) {
                                var e, i = this.chart,
                                    r = i.options.chart,
                                    n = t.chartX,
                                    s = t.chartY,
                                    o = this.zoomHor,
                                    a = this.zoomVert,
                                    l = i.plotLeft,
                                    h = i.plotTop,
                                    c = i.plotWidth,
                                    d = i.plotHeight,
                                    u = this.selectionMarker,
                                    p = this.mouseDownX,
                                    f = this.mouseDownY,
                                    g = r.panKey && t[r.panKey + "Key"];
                                u && u.touch || (n < l ? n = l : n > l + c && (n = l + c), s < h ? s = h : s > h + d && (s = h + d), this.hasDragged = Math.sqrt(Math.pow(p - n, 2) + Math.pow(f - s, 2)), this.hasDragged > 10 && (e = i.isInsidePlot(p - l, f - h), i.hasCartesianSeries && (this.zoomX || this.zoomY) && e && !g && !u && (this.selectionMarker = u = i.renderer.rect(l, h, o ? 1 : c, a ? 1 : d, 0).attr({
                                    fill: r.selectionMarkerFill || "rgba(69,114,167,0.25)",
                                    zIndex: 7
                                }).add()), u && o && (n -= p, u.attr({
                                    width: ut(n),
                                    x: (n > 0 ? 0 : n) + p
                                })), u && a && (n = s - f, u.attr({
                                    height: ut(n),
                                    y: (n > 0 ? 0 : n) + f
                                })), e && !u && r.panning && i.pan(t, r.panning)))
                            },
                            drop: function(t) {
                                var e = this,
                                    i = this.chart,
                                    r = this.hasPinched;
                                if (this.selectionMarker) {
                                    var n, s = {
                                            originalEvent: t,
                                            xAxis: [],
                                            yAxis: []
                                        },
                                        o = this.selectionMarker,
                                        a = o.attr ? o.attr("x") : o.x,
                                        l = o.attr ? o.attr("y") : o.y,
                                        c = o.attr ? o.attr("width") : o.width,
                                        d = o.attr ? o.attr("height") : o.height;
                                    (this.hasDragged || r) && (Xt(i.axes, (function(i) {
                                        if (i.zoomEnabled && h(i.min) && (r || e[{
                                                xAxis: "zoomX",
                                                yAxis: "zoomY"
                                            } [i.coll]])) {
                                            var o = i.horiz,
                                                u = "touchend" === t.type ? i.minPixelPadding : 0,
                                                p = i.toValue((o ? a : l) + u);
                                            o = i.toValue((o ? a + c : l + d) - u), s[i.coll].push({
                                                axis: i,
                                                min: dt(p, o),
                                                max: ct(p, o)
                                            }), n = !0
                                        }
                                    })), n && Vt(i, "selection", s, (function(t) {
                                        i.zoom(qt(t, r ? {
                                            animation: !1
                                        } : null))
                                    }))), this.selectionMarker = this.selectionMarker.destroy(), r && this.scaleGroups()
                                }
                                i && (p(i.container, {
                                    cursor: i._cursor
                                }), i.cancelClick = this.hasDragged > 10, i.mouseIsDown = this.hasDragged = this.hasPinched = !1, this.pinchDown = [])
                            },
                            onContainerMouseDown: function(t) {
                                (t = this.normalize(t)).preventDefault && t.preventDefault(), this.dragStart(t)
                            },
                            onDocumentMouseUp: function(t) {
                                Mt[he] && Mt[he].pointer.drop(t)
                            },
                            onDocumentMouseMove: function(t) {
                                var e = this.chart,
                                    i = this.chartPosition;
                                t = this.normalize(t, i), i && !this.inClass(t.target, "highcharts-tracker") && !e.isInsidePlot(t.chartX - e.plotLeft, t.chartY - e.plotTop) && this.reset()
                            },
                            onContainerMouseLeave: function(t) {
                                var e = Mt[he];
                                e && (t.relatedTarget || t.toElement) && (e.pointer.reset(), e.pointer.chartPosition = null)
                            },
                            onContainerMouseMove: function(t) {
                                var e = this.chart;
                                h(he) && Mt[he] && Mt[he].mouseIsDown || (he = e.index), (t = this.normalize(t)).returnValue = !1, "mousedown" === e.mouseIsDown && this.drag(t), (this.inClass(t.target, "highcharts-tracker") || e.isInsidePlot(t.chartX - e.plotLeft, t.chartY - e.plotTop)) && !e.openMenu && this.runPointActions(t)
                            },
                            inClass: function(t, e) {
                                for (var i; t;) {
                                    if (i = c(t, "class")) {
                                        if (-1 !== i.indexOf(e)) return !0;
                                        if (-1 !== i.indexOf("highcharts-container")) return !1
                                    }
                                    t = t.parentNode
                                }
                            },
                            onTrackerMouseOut: function(t) {
                                var e = this.chart.hoverSeries;
                                t = t.relatedTarget || t.toElement, !e || !t || e.options.stickyTracking || this.inClass(t, "highcharts-tooltip") || this.inClass(t, "highcharts-series-" + e.index) || e.onMouseOut()
                            },
                            onContainerClick: function(t) {
                                var e = this.chart,
                                    i = e.hoverPoint,
                                    r = e.plotLeft,
                                    n = e.plotTop;
                                t = this.normalize(t), e.cancelClick || (i && this.inClass(t.target, "highcharts-tracker") ? (Vt(i.series, "click", qt(t, {
                                    point: i
                                })), e.hoverPoint && i.firePointEvent("click", t)) : (qt(t, this.getCoordinates(t)), e.isInsidePlot(t.chartX - r, t.chartY - n) && Vt(e, "click", t)))
                            },
                            setDOMEvents: function() {
                                var t = this,
                                    e = t.chart.container;
                                e.onmousedown = function(e) {
                                    t.onContainerMouseDown(e)
                                }, e.onmousemove = function(e) {
                                    t.onContainerMouseMove(e)
                                }, e.onclick = function(e) {
                                    t.onContainerClick(e)
                                }, jt(e, "mouseleave", t.onContainerMouseLeave), 1 === Rt && jt(st, "mouseup", t.onDocumentMouseUp), z && (e.ontouchstart = function(e) {
                                    t.onContainerTouchStart(e)
                                }, e.ontouchmove = function(e) {
                                    t.onContainerTouchMove(e)
                                }, 1 === Rt && jt(st, "touchend", t.onDocumentTouchEnd))
                            },
                            destroy: function() {
                                var t;
                                for (t in Ut(this.chart.container, "mouseleave", this.onContainerMouseLeave), Rt || (Ut(st, "mouseup", this.onDocumentMouseUp), Ut(st, "touchend", this.onDocumentTouchEnd)), clearInterval(this.tooltipTimeout), this) this[t] = null
                            }
                        }, qt(nt.Pointer.prototype, {
                            pinchTranslate: function(t, e, i, r, n, s) {
                                (this.zoomHor || this.pinchHor) && this.pinchTranslateDirection(!0, t, e, i, r, n, s), (this.zoomVert || this.pinchVert) && this.pinchTranslateDirection(!1, t, e, i, r, n, s)
                            },
                            pinchTranslateDirection: function(t, e, i, r, n, s, o, a) {
                                var l, h, c, d = this.chart,
                                    u = t ? "x" : "y",
                                    p = t ? "X" : "Y",
                                    f = "chart" + p,
                                    g = t ? "width" : "height",
                                    m = d["plot" + (t ? "Left" : "Top")],
                                    v = a || 1,
                                    y = d.inverted,
                                    x = d.bounds[t ? "h" : "v"],
                                    b = 1 === e.length,
                                    w = e[0][f],
                                    k = i[0][f],
                                    C = !b && e[1][f],
                                    T = !b && i[1][f];
                                (i = function() {
                                    !b && ut(w - C) > 20 && (v = a || ut(k - T) / ut(w - C)), h = (m - k) / v + w, l = d["plot" + (t ? "Width" : "Height")] / v
                                })(), (e = h) < x.min ? (e = x.min, c = !0) : e + l > x.max && (e = x.max - l, c = !0), c ? (k -= .8 * (k - o[u][0]), b || (T -= .8 * (T - o[u][1])), i()) : o[u] = [k, T], y || (s[u] = h - m, s[g] = l), s = y ? 1 / v : v, n[g] = l, n[u] = e, r[y ? t ? "scaleY" : "scaleX" : "scale" + p] = v, r["translate" + p] = s * m + (k - s * w)
                            },
                            pinch: function(t) {
                                var e = this,
                                    i = e.chart,
                                    r = e.pinchDown,
                                    n = t.touches,
                                    s = n.length,
                                    o = e.lastValidTouch,
                                    a = e.hasZoom,
                                    l = e.selectionMarker,
                                    h = {},
                                    c = 1 === s && (e.inClass(t.target, "highcharts-tracker") && i.runTrackerClick || e.runChartClick),
                                    d = {};
                                s > 1 && (e.initiated = !0), a && e.initiated && !c && t.preventDefault(), Yt(n, (function(t) {
                                    return e.normalize(t)
                                })), "touchstart" === t.type ? (Xt(n, (function(t, e) {
                                    r[e] = {
                                        chartX: t.chartX,
                                        chartY: t.chartY
                                    }
                                })), o.x = [r[0].chartX, r[1] && r[1].chartX], o.y = [r[0].chartY, r[1] && r[1].chartY], Xt(i.axes, (function(t) {
                                    if (t.zoomEnabled) {
                                        var e = i.bounds[t.horiz ? "h" : "v"],
                                            r = t.minPixelPadding,
                                            n = t.toPixels(te(t.options.min, t.dataMin)),
                                            s = t.toPixels(te(t.options.max, t.dataMax)),
                                            o = dt(n, s);
                                        n = ct(n, s), e.min = dt(t.pos, o - r), e.max = ct(t.pos + t.len, n + r)
                                    }
                                })), e.res = !0) : r.length && (l || (e.selectionMarker = l = qt({
                                    destroy: Lt,
                                    touch: !0
                                }, i.plotBox)), e.pinchTranslate(r, n, h, l, d, o), e.hasPinched = a, e.scaleGroups(h, d), !a && e.followTouchMove && 1 === s ? this.runPointActions(e.normalize(t)) : e.res && (e.res = !1, this.reset(!1, 0)))
                            },
                            touch: function(t, e) {
                                var i, r = this.chart;
                                he = r.index, 1 === t.touches.length ? (t = this.normalize(t), r.isInsidePlot(t.chartX - r.plotLeft, t.chartY - r.plotTop) && !r.openMenu ? (e && this.runPointActions(t), "touchmove" === t.type && (i = !!(r = this.pinchDown)[0] && Math.sqrt(Math.pow(r[0].chartX - t.chartX, 2) + Math.pow(r[0].chartY - t.chartY, 2)) >= 4), te(i, !0) && this.pinch(t)) : e && this.reset()) : 2 === t.touches.length && this.pinch(t)
                            },
                            onContainerTouchStart: function(t) {
                                this.touch(t, !0)
                            },
                            onContainerTouchMove: function(t) {
                                this.touch(t)
                            },
                            onDocumentTouchEnd: function(t) {
                                Mt[he] && Mt[he].pointer.drop(t)
                            }
                        }), t.PointerEvent || t.MSPointerEvent) {
                        var ue = {},
                            pe = !!t.PointerEvent,
                            fe = function() {
                                var t, e = [];
                                for (t in e.item = function(t) {
                                        return this[t]
                                    }, ue) ue.hasOwnProperty(t) && e.push({
                                    pageX: ue[t].pageX,
                                    pageY: ue[t].pageY,
                                    target: ue[t].target
                                });
                                return e
                            },
                            ge = function(t, e, i, r) {
                                "touch" !== t.pointerType && t.pointerType !== t.MSPOINTER_TYPE_TOUCH || !Mt[he] || (r(t), (r = Mt[he].pointer)[e]({
                                    type: i,
                                    target: t.currentTarget,
                                    preventDefault: Lt,
                                    touches: fe()
                                }))
                            };
                        qt(de.prototype, {
                            onContainerPointerDown: function(t) {
                                ge(t, "onContainerTouchStart", "touchstart", (function(t) {
                                    ue[t.pointerId] = {
                                        pageX: t.pageX,
                                        pageY: t.pageY,
                                        target: t.currentTarget
                                    }
                                }))
                            },
                            onContainerPointerMove: function(t) {
                                ge(t, "onContainerTouchMove", "touchmove", (function(t) {
                                    ue[t.pointerId] = {
                                        pageX: t.pageX,
                                        pageY: t.pageY
                                    }, ue[t.pointerId].target || (ue[t.pointerId].target = t.currentTarget)
                                }))
                            },
                            onDocumentPointerUp: function(t) {
                                ge(t, "onDocumentTouchEnd", "touchend", (function(t) {
                                    delete ue[t.pointerId]
                                }))
                            },
                            batchMSEvents: function(t) {
                                t(this.chart.container, pe ? "pointerdown" : "MSPointerDown", this.onContainerPointerDown), t(this.chart.container, pe ? "pointermove" : "MSPointerMove", this.onContainerPointerMove), t(st, pe ? "pointerup" : "MSPointerUp", this.onDocumentPointerUp)
                            }
                        }), ee(de.prototype, "init", (function(t, e, i) {
                            t.call(this, e, i), this.hasZoom && p(e.container, {
                                "-ms-touch-action": "none",
                                "touch-action": "none"
                            })
                        })), ee(de.prototype, "setDOMEvents", (function(t) {
                            t.apply(this), (this.hasZoom || this.followTouchMove) && this.batchMSEvents(jt)
                        })), ee(de.prototype, "destroy", (function(t) {
                            this.batchMSEvents(Ut), t.call(this)
                        }))
                    }
                    var me = nt.Legend = function(t, e) {
                        this.init(t, e)
                    };
                    me.prototype = {
                        init: function(t, e) {
                            var i = this,
                                r = e.itemStyle,
                                s = e.itemMarginTop || 0;
                            this.options = e, e.enabled && (i.itemStyle = r, i.itemHiddenStyle = n(r, e.itemHiddenStyle), i.itemMarginTop = s, i.padding = r = te(e.padding, 8), i.initialItemX = r, i.initialItemY = r - 5, i.maxItemWidth = 0, i.chart = t, i.itemHeight = 0, i.symbolWidth = te(e.symbolWidth, 16), i.pages = [], i.render(), jt(i.chart, "endResize", (function() {
                                i.positionCheckboxes()
                            })))
                        },
                        colorizeItem: function(t, e) {
                            var i, r = this.options,
                                n = t.legendItem,
                                s = t.legendLine,
                                o = t.legendSymbol,
                                a = this.itemHiddenStyle.color,
                                l = (r = e ? r.itemStyle.color : a, e ? t.legendColor || t.color || "#CCC" : a),
                                h = (a = t.options && t.options.marker, {
                                    fill: l
                                });
                            if (n && n.css({
                                    fill: r,
                                    color: r
                                }), s && s.attr({
                                    stroke: l
                                }), o) {
                                if (a && o.isMarker)
                                    for (i in h.stroke = l, a = t.convertAttribs(a))(n = a[i]) !== B && (h[i] = n);
                                o.attr(h)
                            }
                        },
                        positionItem: function(t) {
                            var e = (i = this.options).symbolPadding,
                                i = !i.rtl,
                                r = (n = t._legendItemPos)[0],
                                n = n[1],
                                s = t.checkbox;
                            (t = t.legendGroup) && t.element && t.translate(i ? r : this.legendWidth - r - 2 * e - 4, n), s && (s.x = r, s.y = n)
                        },
                        destroyItem: function(t) {
                            var e = t.checkbox;
                            Xt(["legendItem", "legendLine", "legendSymbol", "legendGroup"], (function(e) {
                                t[e] && (t[e] = t[e].destroy())
                            })), e && S(t.checkbox)
                        },
                        destroy: function() {
                            var t = this.group,
                                e = this.box;
                            e && (this.box = e.destroy()), t && (this.group = t.destroy())
                        },
                        positionCheckboxes: function(t) {
                            var e, i = this.group.alignAttr,
                                r = this.clipHeight || this.legendHeight,
                                n = this.titleHeight;
                            i && (e = i.translateY, Xt(this.allItems, (function(s) {
                                var o, a = s.checkbox;
                                a && (o = e + n + a.y + (t || 0) + 3, p(a, {
                                    left: i.translateX + s.checkboxOffset + a.x - 20 + "px",
                                    top: o + "px",
                                    display: o > e - 6 && o < e + r - 6 ? "" : "none"
                                }))
                            })))
                        },
                        renderTitle: function() {
                            var t = this.padding,
                                e = this.options.title,
                                i = 0;
                            e.text && (this.title || (this.title = this.chart.renderer.label(e.text, t - 3, t - 4, null, null, null, null, null, "legend-title").attr({
                                zIndex: 1
                            }).css(e.style).add(this.group)), i = (t = this.title.getBBox()).height, this.offsetWidth = t.width, this.contentGroup.attr({
                                translateY: i
                            })), this.titleHeight = i
                        },
                        setText: function(t) {
                            var e = this.options;
                            t.legendItem.attr({
                                text: e.labelFormat ? y(e.labelFormat, t) : e.labelFormatter.call(t)
                            })
                        },
                        renderItem: function(t) {
                            var e = this.chart,
                                i = e.renderer,
                                r = this.options,
                                s = "horizontal" === r.layout,
                                o = this.symbolWidth,
                                a = r.symbolPadding,
                                l = this.itemStyle,
                                h = this.itemHiddenStyle,
                                c = this.padding,
                                d = s ? te(r.itemDistance, 20) : 0,
                                u = !r.rtl,
                                p = r.width,
                                f = r.itemMarginBottom || 0,
                                g = this.itemMarginTop,
                                m = this.initialItemX,
                                v = t.legendItem,
                                y = t.series && t.series.drawLegendSymbol ? t.series : t,
                                x = y.options,
                                b = (x = this.createCheckboxForItem && x && x.showCheckbox, r.useHTML);
                            v || (t.legendGroup = i.g("legend-item").attr({
                                zIndex: 1
                            }).add(this.scrollGroup), t.legendItem = v = i.text("", u ? o + a : -a, this.baseline || 0, b).css(n(t.visible ? l : h)).attr({
                                align: u ? "left" : "right",
                                zIndex: 2
                            }).add(t.legendGroup), this.baseline || (this.fontMetrics = i.fontMetrics(l.fontSize, v), this.baseline = this.fontMetrics.f + 3 + g, v.attr("y", this.baseline)), y.drawLegendSymbol(this, t), this.setItemEvents && this.setItemEvents(t, v, b, l, h), x && this.createCheckboxForItem(t)), this.colorizeItem(t, t.visible), this.setText(t), i = v.getBBox(), o = t.checkboxOffset = r.itemWidth || t.legendItemWidth || o + a + i.width + d + (x ? 20 : 0), this.itemHeight = a = at(t.legendItemHeight || i.height), s && this.itemX - m + o > (p || e.chartWidth - 2 * c - m - r.x) && (this.itemX = m, this.itemY += g + this.lastLineHeight + f, this.lastLineHeight = 0), this.maxItemWidth = ct(this.maxItemWidth, o), this.lastItemY = g + this.itemY + f, this.lastLineHeight = ct(a, this.lastLineHeight), t._legendItemPos = [this.itemX, this.itemY], s ? this.itemX += o : (this.itemY += g + a + f, this.lastLineHeight = a), this.offsetWidth = p || ct((s ? this.itemX - m - d : o) + c, this.offsetWidth)
                        },
                        getAllItems: function() {
                            var t = [];
                            return Xt(this.chart.series, (function(e) {
                                var i = e.options;
                                te(i.showInLegend, !h(i.linkedTo) && B, !0) && (t = t.concat(e.legendItems || ("point" === i.legendType ? e.data : e)))
                            })), t
                        },
                        adjustMargins: function(t, e) {
                            var i = this.chart,
                                r = this.options,
                                n = r.align.charAt(0) + r.verticalAlign.charAt(0) + r.layout.charAt(0);
                            r.floating || Xt([/(lth|ct|rth)/, /(rtv|rm|rbv)/, /(rbh|cb|lbh)/, /(lbv|lm|ltv)/], (function(s, o) {
                                s.test(n) && !h(t[o]) && (i[Ft[o]] = ct(i[Ft[o]], i.legend[(o + 1) % 2 ? "legendHeight" : "legendWidth"] + [1, -1, -1, 1][o] * r[o % 2 ? "x" : "y"] + te(r.margin, 12) + e[o]))
                            }))
                        },
                        render: function() {
                            var t, e, i, r, n = this,
                                s = n.chart,
                                o = s.renderer,
                                a = n.group,
                                l = n.box,
                                h = n.options,
                                c = n.padding,
                                d = h.borderWidth,
                                u = h.backgroundColor;
                            n.itemX = n.initialItemX, n.itemY = n.initialItemY, n.offsetWidth = 0, n.lastItemY = 0, a || (n.group = a = o.g("legend").attr({
                                zIndex: 7
                            }).add(), n.contentGroup = o.g().attr({
                                zIndex: 1
                            }).add(a), n.scrollGroup = o.g().add(n.contentGroup)), n.renderTitle(), w(t = n.getAllItems(), (function(t, e) {
                                return (t.options && t.options.legendIndex || 0) - (e.options && e.options.legendIndex || 0)
                            })), h.reversed && t.reverse(), n.allItems = t, n.display = e = !!t.length, n.lastLineHeight = 0, Xt(t, (function(t) {
                                n.renderItem(t)
                            })), i = (h.width || n.offsetWidth) + c, r = n.lastItemY + n.lastLineHeight + n.titleHeight, r = n.handleOverflow(r), r += c, (d || u) && (l ? i > 0 && r > 0 && (l[l.isNew ? "attr" : "animate"](l.crisp({
                                width: i,
                                height: r
                            })), l.isNew = !1) : (n.box = l = o.rect(0, 0, i, r, h.borderRadius, d || 0).attr({
                                stroke: h.borderColor,
                                "stroke-width": d || 0,
                                fill: u || "none"
                            }).add(a).shadow(h.shadow), l.isNew = !0), l[e ? "show" : "hide"]()), n.legendWidth = i, n.legendHeight = r, Xt(t, (function(t) {
                                n.positionItem(t)
                            })), e && a.align(qt({
                                width: i,
                                height: r
                            }, h), !0, "spacingBox"), s.isResizing || this.positionCheckboxes()
                        },
                        handleOverflow: function(t) {
                            var e, i, r = this,
                                n = this.chart,
                                s = n.renderer,
                                o = this.options,
                                a = o.y,
                                l = (a = n.spacingBox.height + ("top" === o.verticalAlign ? -a : a) - this.padding, o.maxHeight),
                                h = this.clipRect,
                                c = o.navigation,
                                d = te(c.animation, !0),
                                u = c.arrowSize || 12,
                                p = this.nav,
                                f = this.pages,
                                g = this.padding,
                                m = this.allItems,
                                v = function(t) {
                                    h.attr({
                                        height: t
                                    }), r.contentGroup.div && (r.contentGroup.div.style.clip = "rect(" + g + "px,9999px," + (g + t) + "px,0)")
                                };
                            return "horizontal" === o.layout && (a /= 2), l && (a = dt(a, l)), f.length = 0, t > a && !1 !== c.enabled ? (this.clipHeight = e = ct(a - 20 - this.titleHeight - g, 0), this.currentPage = te(this.currentPage, 1), this.fullHeight = t, Xt(m, (function(t, r) {
                                var n = t._legendItemPos[1],
                                    s = at(t.legendItem.getBBox().height),
                                    o = f.length;
                                (!o || n - f[o - 1] > e && (i || n) !== f[o - 1]) && (f.push(i || n), o++), r === m.length - 1 && n + s - f[o - 1] > e && f.push(n), n !== i && (i = n)
                            })), h || (h = r.clipRect = s.clipRect(0, g, 9999, 0), r.contentGroup.clip(h)), v(e), p || (this.nav = p = s.g().attr({
                                zIndex: 1
                            }).add(this.group), this.up = s.symbol("triangle", 0, 0, u, u).on("click", (function() {
                                r.scroll(-1, d)
                            })).add(p), this.pager = s.text("", 15, 10).css(c.style).add(p), this.down = s.symbol("triangle-down", 0, 0, u, u).on("click", (function() {
                                r.scroll(1, d)
                            })).add(p)), r.scroll(0), t = a) : p && (v(n.chartHeight), p.hide(), this.scrollGroup.attr({
                                translateY: 1
                            }), this.clipHeight = 0), t
                        },
                        scroll: function(t, e) {
                            var i = this.pages,
                                r = i.length,
                                n = this.currentPage + t,
                                s = this.clipHeight,
                                o = (a = this.options.navigation).activeColor,
                                a = a.inactiveColor,
                                l = this.pager,
                                h = this.padding;
                            n > r && (n = r), n > 0 && (e !== B && P(e, this.chart), this.nav.attr({
                                translateX: h,
                                translateY: s + this.padding + 7 + this.titleHeight,
                                visibility: "visible"
                            }), this.up.attr({
                                fill: 1 === n ? a : o
                            }).css({
                                cursor: 1 === n ? "default" : "pointer"
                            }), l.attr({
                                text: n + "/" + r
                            }), this.down.attr({
                                x: 18 + this.pager.getBBox().width,
                                fill: n === r ? a : o
                            }).css({
                                cursor: n === r ? "default" : "pointer"
                            }), i = -i[n - 1] + this.initialItemY, this.scrollGroup.animate({
                                translateY: i
                            }), this.currentPage = n, this.positionCheckboxes(i))
                        }
                    }, ne = nt.LegendSymbolMixin = {
                        drawRectangle: function(t, e) {
                            var i = t.options.symbolHeight || t.fontMetrics.f;
                            e.legendSymbol = this.chart.renderer.rect(0, t.baseline - i + 1, t.symbolWidth, i, t.options.symbolRadius || 0).attr({
                                zIndex: 3
                            }).add(e.legendGroup)
                        },
                        drawLineMarker: function(t) {
                            var e, i = this.options,
                                r = i.marker,
                                n = t.symbolWidth,
                                s = this.chart.renderer,
                                o = this.legendGroup;
                            t = t.baseline - at(.3 * t.fontMetrics.b), i.lineWidth && (e = {
                                "stroke-width": i.lineWidth
                            }, i.dashStyle && (e.dashstyle = i.dashStyle), this.legendLine = s.path([Bt, 0, t, Et, n, t]).attr(e).add(o)), r && !1 !== r.enabled && (i = r.radius, this.legendSymbol = r = s.symbol(this.symbol, n / 2 - i, t - i, 2 * i, 2 * i, r).add(o), r.isMarker = !0)
                        }
                    }, (/Trident\/7\.0/.test(vt) || kt) && ee(me.prototype, "positionItem", (function(t, e) {
                        var i = this,
                            r = function() {
                                e._legendItemPos && t.call(i, e)
                            };
                        r(), setTimeout(r)
                    }));
                    var ve = nt.Chart = function() {
                        this.getArgs.apply(this, arguments)
                    };
                    nt.chart = function(t, e, i) {
                        return new ve(t, e, i)
                    }, ve.prototype = {
                        callbacks: [],
                        getArgs: function() {
                            var t = [].slice.call(arguments);
                            (o(t[0]) || t[0].nodeName) && (this.renderTo = t.shift()), this.init(t[0], t[1])
                        },
                        init: function(t, e) {
                            var i, r = t.series;
                            t.series = null, (i = n(N, t)).series = t.series = r, this.userOptions = t, r = i.chart, this.margin = this.splashArray("margin", r), this.spacing = this.splashArray("spacing", r);
                            var s = r.events;
                            this.bounds = {
                                h: {},
                                v: {}
                            }, this.callback = e, this.isResizing = 0, this.options = i, this.axes = [], this.series = [], this.hasCartesianSeries = r.showAxes;
                            var o, a = this;
                            if (a.index = Mt.length, Mt.push(a), Rt++, !1 !== r.reflow && jt(a, "load", (function() {
                                    a.initReflow()
                                })), s)
                                for (o in s) jt(a, o, s[o]);
                            a.xAxis = [], a.yAxis = [], a.animation = !Pt && te(r.animation, !0), a.pointCount = a.colorCounter = a.symbolCounter = 0, a.firstRender()
                        },
                        initSeries: function(t) {
                            var i = this.options.chart;
                            return (i = Nt[t.type || i.type || i.defaultSeriesType]) || e(17, !0), (i = new i).init(this, t), i
                        },
                        isInsidePlot: function(t, e, i) {
                            var r = i ? e : t;
                            return t = i ? t : e, r >= 0 && r <= this.plotWidth && t >= 0 && t <= this.plotHeight
                        },
                        redraw: function(t) {
                            var e, i, r = this.axes,
                                n = this.series,
                                s = this.pointer,
                                o = this.legend,
                                a = this.isDirtyLegend,
                                l = this.hasCartesianSeries,
                                h = this.isDirtyBox,
                                c = n.length,
                                d = c,
                                u = this.renderer,
                                p = u.isHidden(),
                                f = [];
                            for (P(t, this), p && this.cloneRenderTo(), this.layOutTitles(); d--;)
                                if ((t = n[d]).options.stacking && (e = !0, t.isDirty)) {
                                    i = !0;
                                    break
                                } if (i)
                                for (d = c; d--;)(t = n[d]).options.stacking && (t.isDirty = !0);
                            Xt(n, (function(t) {
                                t.isDirty && "point" === t.options.legendType && (t.updateTotals && t.updateTotals(), a = !0), t.isDirtyData && Vt(t, "updatedData")
                            })), a && o.options.enabled && (o.render(), this.isDirtyLegend = !1), e && this.getStacks(), l && !this.isResizing && (this.maxTicks = null, Xt(r, (function(t) {
                                t.updateNames(), t.setScale()
                            }))), this.getMargins(), l && (Xt(r, (function(t) {
                                t.isDirty && (h = !0)
                            })), Xt(r, (function(t) {
                                var i = t.min + "," + t.max;
                                t.extKey !== i && (t.extKey = i, f.push((function() {
                                    Vt(t, "afterSetExtremes", qt(t.eventArgs, t.getExtremes())), delete t.eventArgs
                                }))), (h || e) && t.redraw()
                            }))), h && this.drawChartBox(), Xt(n, (function(t) {
                                t.isDirty && t.visible && (!t.isCartesian || t.xAxis) && t.redraw()
                            })), s && s.reset(!0), u.draw(), Vt(this, "redraw"), p && this.cloneRenderTo(!0), Xt(f, (function(t) {
                                t.call()
                            }))
                        },
                        get: function(t) {
                            var e, i, r = this.axes,
                                n = this.series;
                            for (e = 0; e < r.length; e++)
                                if (r[e].options.id === t) return r[e];
                            for (e = 0; e < n.length; e++)
                                if (n[e].options.id === t) return n[e];
                            for (e = 0; e < n.length; e++)
                                for (i = n[e].points || [], r = 0; r < i.length; r++)
                                    if (i[r].id === t) return i[r];
                            return null
                        },
                        getAxes: function() {
                            var t = this,
                                e = (i = this.options).xAxis = d(i.xAxis || {}),
                                i = i.yAxis = d(i.yAxis || {});
                            Xt(e, (function(t, e) {
                                t.index = e, t.isX = !0
                            })), Xt(i, (function(t, e) {
                                t.index = e
                            })), e = e.concat(i), Xt(e, (function(e) {
                                new le(t, e)
                            }))
                        },
                        getSelectedPoints: function() {
                            var t = [];
                            return Xt(this.series, (function(e) {
                                t = t.concat(Gt(e.points || [], (function(t) {
                                    return t.selected
                                })))
                            })), t
                        },
                        getSelectedSeries: function() {
                            return Gt(this.series, (function(t) {
                                return t.selected
                            }))
                        },
                        setTitle: function(t, e, i) {
                            var r, s, o = this,
                                a = o.options;
                            s = a.title = n(a.title, t), r = a.subtitle = n(a.subtitle, e), Xt([
                                ["title", t, s],
                                ["subtitle", e, a = r]
                            ], (function(t) {
                                var e = t[0],
                                    i = o[e],
                                    r = t[1];
                                t = t[2], i && r && (o[e] = i = i.destroy()), t && t.text && !i && (o[e] = o.renderer.text(t.text, 0, 0, t.useHTML).attr({
                                    align: t.align,
                                    class: "highcharts-" + e,
                                    zIndex: t.zIndex || 4
                                }).css(t.style).add())
                            })), o.layOutTitles(i)
                        },
                        layOutTitles: function(t) {
                            var e = 0,
                                i = this.title,
                                r = this.subtitle,
                                n = (s = this.options).title,
                                s = s.subtitle,
                                o = this.renderer,
                                a = this.spacingBox;
                            !i || (i.css({
                                width: (n.width || a.width + n.widthAdjust) + "px"
                            }).align(qt({
                                y: o.fontMetrics(n.style.fontSize, i).b - 3
                            }, n), !1, a), n.floating || n.verticalAlign) || (e = i.getBBox().height), r && (r.css({
                                width: (s.width || a.width + s.widthAdjust) + "px"
                            }).align(qt({
                                y: e + (n.margin - 13) + o.fontMetrics(s.style.fontSize, i).b
                            }, s), !1, a), !s.floating && !s.verticalAlign && (e = ht(e + r.getBBox().height))), i = this.titleOffset !== e, this.titleOffset = e, !this.isDirtyBox && i && (this.isDirtyBox = i, this.hasRendered && te(t, !0) && this.isDirtyBox && this.redraw())
                        },
                        getChartSize: function() {
                            var t = (e = this.options.chart).width,
                                e = e.height,
                                i = this.renderToClone || this.renderTo;
                            h(t) || (this.containerWidth = $t(i, "width")), h(e) || (this.containerHeight = $t(i, "height")), this.chartWidth = ct(0, t || this.containerWidth || 600), this.chartHeight = ct(0, te(e, this.containerHeight > 19 ? this.containerHeight : 400))
                        },
                        cloneRenderTo: function(t) {
                            var e = this.renderToClone,
                                i = this.container;
                            if (t) {
                                if (e) {
                                    for (; e.childNodes.length;) this.renderTo.appendChild(e.firstChild);
                                    S(e), delete this.renderToClone
                                }
                            } else i && i.parentNode === this.renderTo && this.renderTo.removeChild(i), this.renderToClone = e = this.renderTo.cloneNode(0), p(e, {
                                position: "absolute",
                                top: "-9999px",
                                display: "block"
                            }), e.style.setProperty && e.style.setProperty("display", "block", "important"), st.body.appendChild(e), i && e.appendChild(i)
                        },
                        getContainer: function() {
                            var t, i, r, n = this.options,
                                a = n.chart;
                            t = this.renderTo;
                            var l = "highcharts-" + It++;
                            t || (this.renderTo = t = a.renderTo), o(t) && (this.renderTo = t = st.getElementById(t)), t || e(13, !0), i = s(c(t, "data-highcharts-chart")), Qt(i) && Mt[i] && Mt[i].hasRendered && Mt[i].destroy(), c(t, "data-highcharts-chart", this.index), t.innerHTML = "", !a.skipClone && !t.offsetWidth && this.cloneRenderTo(), this.getChartSize(), i = this.chartWidth, r = this.chartHeight, this.container = t = f(Ot, {
                                className: "highcharts-container" + (a.className ? " " + a.className : ""),
                                id: l
                            }, qt({
                                position: "relative",
                                overflow: "hidden",
                                width: i + "px",
                                height: r + "px",
                                textAlign: "left",
                                lineHeight: "normal",
                                zIndex: 0,
                                "-webkit-tap-highlight-color": "rgba(0,0,0,0)"
                            }, a.style), this.renderToClone || t), this._cursor = t.style.cursor, this.renderer = new(nt[a.renderer] || E)(t, i, r, a.style, a.forExport, n.exporting && n.exporting.allowHTML), Pt && this.renderer.create(this, t, i, r), this.renderer.chartIndex = this.index
                        },
                        getMargins: function(t) {
                            var e = this.spacing,
                                i = this.margin,
                                r = this.titleOffset;
                            this.resetMargins(), r && !h(i[0]) && (this.plotTop = ct(this.plotTop, r + this.options.title.margin + e[0])), this.legend.display && this.legend.adjustMargins(i, e), this.extraBottomMargin && (this.marginBottom += this.extraBottomMargin), this.extraTopMargin && (this.plotTop += this.extraTopMargin), t || this.getAxisMargins()
                        },
                        getAxisMargins: function() {
                            var t = this,
                                e = t.axisOffset = [0, 0, 0, 0],
                                i = t.margin;
                            t.hasCartesianSeries && Xt(t.axes, (function(t) {
                                t.visible && t.getOffset()
                            })), Xt(Ft, (function(r, n) {
                                h(i[n]) || (t[r] += e[n])
                            })), t.setChartSize()
                        },
                        reflow: function(e) {
                            var i = this,
                                r = i.options.chart,
                                n = i.renderTo,
                                s = h(r.width),
                                o = r.width || $t(n, "width");
                            r = r.height || $t(n, "height"), n = e ? e.target : t, s || i.isPrinting || !o || !r || n !== t && n !== st || (o === i.containerWidth && r === i.containerHeight || (clearTimeout(i.reflowTimeout), i.reflowTimeout = u((function() {
                                i.container && i.setSize(void 0, void 0, !1)
                            }), e ? 100 : 0)), i.containerWidth = o, i.containerHeight = r)
                        },
                        initReflow: function() {
                            var e = this,
                                i = function(t) {
                                    e.reflow(t)
                                };
                            jt(t, "resize", i), jt(e, "destroy", (function() {
                                Ut(t, "resize", i)
                            }))
                        },
                        setSize: function(t, e, i) {
                            var r = this,
                                n = r.renderer;
                            r.isResizing += 1, P(i, r), r.oldChartHeight = r.chartHeight, r.oldChartWidth = r.chartWidth, void 0 !== t && (r.options.chart.width = t), void 0 !== e && (r.options.chart.height = e), r.getChartSize(), ((t = n.globalAnimation) ? _t : p)(r.container, {
                                width: r.chartWidth + "px",
                                height: r.chartHeight + "px"
                            }, t), r.setChartSize(!0), n.setSize(r.chartWidth, r.chartHeight, i), r.maxTicks = null, Xt(r.axes, (function(t) {
                                t.isDirty = !0, t.setScale()
                            })), Xt(r.series, (function(t) {
                                t.isDirty = !0
                            })), r.isDirtyLegend = !0, r.isDirtyBox = !0, r.layOutTitles(), r.getMargins(), r.redraw(i), r.oldChartHeight = null, Vt(r, "resize"), u((function() {
                                r && Vt(r, "endResize", null, (function() {
                                    r.isResizing -= 1
                                }))
                            }), D(t).duration)
                        },
                        setChartSize: function(t) {
                            var e, i, r, n, s = this.inverted,
                                o = this.renderer,
                                a = this.chartWidth,
                                l = this.chartHeight,
                                h = this.options.chart,
                                c = this.spacing,
                                d = this.clipOffset;
                            this.plotLeft = e = at(this.plotLeft), this.plotTop = i = at(this.plotTop), this.plotWidth = r = ct(0, at(a - e - this.marginRight)), this.plotHeight = n = ct(0, at(l - i - this.marginBottom)), this.plotSizeX = s ? n : r, this.plotSizeY = s ? r : n, this.plotBorderWidth = h.plotBorderWidth || 0, this.spacingBox = o.spacingBox = {
                                x: c[3],
                                y: c[0],
                                width: a - c[3] - c[1],
                                height: l - c[0] - c[2]
                            }, this.plotBox = o.plotBox = {
                                x: e,
                                y: i,
                                width: r,
                                height: n
                            }, a = 2 * lt(this.plotBorderWidth / 2), s = ht(ct(a, d[3]) / 2), o = ht(ct(a, d[0]) / 2), this.clipBox = {
                                x: s,
                                y: o,
                                width: lt(this.plotSizeX - ct(a, d[1]) / 2 - s),
                                height: ct(0, lt(this.plotSizeY - ct(a, d[2]) / 2 - o))
                            }, t || Xt(this.axes, (function(t) {
                                t.setAxisSize(), t.setAxisTranslation()
                            }))
                        },
                        resetMargins: function() {
                            var t = this;
                            Xt(Ft, (function(e, i) {
                                t[e] = te(t.margin[i], t.spacing[i])
                            })), t.axisOffset = [0, 0, 0, 0], t.clipOffset = [0, 0, 0, 0]
                        },
                        drawChartBox: function() {
                            var t, e = this.options.chart,
                                i = this.renderer,
                                r = this.chartWidth,
                                n = this.chartHeight,
                                s = this.chartBackground,
                                o = this.plotBackground,
                                a = this.plotBorder,
                                l = this.plotBGImage,
                                h = e.borderWidth || 0,
                                c = e.backgroundColor,
                                d = e.plotBackgroundColor,
                                u = e.plotBackgroundImage,
                                p = e.plotBorderWidth || 0,
                                f = this.plotLeft,
                                g = this.plotTop,
                                m = this.plotWidth,
                                v = this.plotHeight,
                                y = this.plotBox,
                                x = this.clipRect,
                                b = this.clipBox;
                            t = h + (e.shadow ? 8 : 0), (h || c) && (s ? s.animate(s.crisp({
                                width: r - t,
                                height: n - t
                            })) : (s = {
                                fill: c || "none"
                            }, h && (s.stroke = e.borderColor, s["stroke-width"] = h), this.chartBackground = i.rect(t / 2, t / 2, r - t, n - t, e.borderRadius, h).attr(s).addClass("highcharts-background").add().shadow(e.shadow))), d && (o ? o.animate(y) : this.plotBackground = i.rect(f, g, m, v, 0).attr({
                                fill: d
                            }).add().shadow(e.plotShadow)), u && (l ? l.animate(y) : this.plotBGImage = i.image(u, f, g, m, v).add()), x ? x.animate({
                                width: b.width,
                                height: b.height
                            }) : this.clipRect = i.clipRect(b), p && (a ? (a.strokeWidth = -p, a.animate(a.crisp({
                                x: f,
                                y: g,
                                width: m,
                                height: v
                            }))) : this.plotBorder = i.rect(f, g, m, v, 0, -p).attr({
                                stroke: e.plotBorderColor,
                                "stroke-width": p,
                                fill: "none",
                                zIndex: 1
                            }).add()), this.isDirtyBox = !1
                        },
                        propFromSeries: function() {
                            var t, e, i, r = this,
                                n = r.options.chart,
                                s = r.options.series;
                            Xt(["inverted", "angular", "polar"], (function(o) {
                                for (t = Nt[n.type || n.defaultSeriesType], i = r[o] || n[o] || t && t.prototype[o], e = s && s.length; !i && e--;)(t = Nt[s[e].type]) && t.prototype[o] && (i = !0);
                                r[o] = i
                            }))
                        },
                        linkSeries: function() {
                            var t = this,
                                e = t.series;
                            Xt(e, (function(t) {
                                t.linkedSeries.length = 0
                            })), Xt(e, (function(e) {
                                var i = e.options.linkedTo;
                                o(i) && (i = ":previous" === i ? t.series[e.index - 1] : t.get(i)) && i.linkedParent !== e && (i.linkedSeries.push(e), e.linkedParent = i, e.visible = te(e.options.visible, i.options.visible, e.visible))
                            }))
                        },
                        renderSeries: function() {
                            Xt(this.series, (function(t) {
                                t.translate(), t.render()
                            }))
                        },
                        renderLabels: function() {
                            var t = this,
                                e = t.options.labels;
                            e.items && Xt(e.items, (function(i) {
                                var r = qt(e.style, i.style),
                                    n = s(r.left) + t.plotLeft,
                                    o = s(r.top) + t.plotTop + 12;
                                delete r.left, delete r.top, t.renderer.text(i.html, n, o).attr({
                                    zIndex: 2
                                }).css(r).add()
                            }))
                        },
                        render: function() {
                            var t, e, i, r, n = this.axes,
                                s = this.renderer,
                                o = this.options;
                            this.setTitle(), this.legend = new me(this, o.legend), this.getStacks && this.getStacks(), this.getMargins(!0), this.setChartSize(), t = this.plotWidth, e = this.plotHeight -= 21, Xt(n, (function(t) {
                                t.setScale()
                            })), this.getAxisMargins(), i = t / this.plotWidth > 1.1, r = e / this.plotHeight > 1.05, (i || r) && (this.maxTicks = null, Xt(n, (function(t) {
                                (t.horiz && i || !t.horiz && r) && t.setTickInterval(!0)
                            })), this.getMargins()), this.drawChartBox(), this.hasCartesianSeries && Xt(n, (function(t) {
                                t.visible && t.render()
                            })), this.seriesGroup || (this.seriesGroup = s.g("series-group").attr({
                                zIndex: 3
                            }).add()), this.renderSeries(), this.renderLabels(), this.showCredits(o.credits), this.hasRendered = !0
                        },
                        showCredits: function(e) {
                            e.enabled && !this.credits && (this.credits = this.renderer.text(e.text, 0, 0).on("click", (function() {
                                e.href && (t.location.href = e.href)
                            })).attr({
                                align: e.position.align,
                                zIndex: 8
                            }).css(e.style).add().align(e.position))
                        },
                        destroy: function() {
                            var t, e = this,
                                i = e.axes,
                                r = e.series,
                                n = e.container,
                                s = n && n.parentNode;
                            for (Vt(e, "destroy"), Mt[e.index] = B, Rt--, e.renderTo.removeAttribute("data-highcharts-chart"), Ut(e), t = i.length; t--;) i[t] = i[t].destroy();
                            for (t = r.length; t--;) r[t] = r[t].destroy();
                            for (t in Xt("title,subtitle,chartBackground,plotBackground,plotBGImage,plotBorder,seriesGroup,clipRect,credits,pointer,scroller,rangeSelector,legend,resetZoomButton,tooltip,renderer".split(","), (function(t) {
                                    var i = e[t];
                                    i && i.destroy && (e[t] = i.destroy())
                                })), n && (n.innerHTML = "", Ut(n), s && S(n)), e) delete e[t]
                        },
                        isReadyToRender: function() {
                            var e = this;
                            return !(!St && t == t.top && "complete" !== st.readyState || Pt && !t.canvg) || (Pt ? se.push((function() {
                                e.firstRender()
                            }), e.options.global.canvasToolsURL) : st.attachEvent("onreadystatechange", (function() {
                                st.detachEvent("onreadystatechange", e.firstRender), "complete" === st.readyState && e.firstRender()
                            })), !1)
                        },
                        firstRender: function() {
                            var t = this,
                                e = t.options;
                            t.isReadyToRender() && (t.getContainer(), Vt(t, "init"), t.resetMargins(), t.setChartSize(), t.propFromSeries(), t.getAxes(), Xt(e.series || [], (function(e) {
                                t.initSeries(e)
                            })), t.linkSeries(), Vt(t, "beforeRender"), nt.Pointer && (t.pointer = new de(t, e)), t.render(), t.renderer.draw(), !t.renderer.imgCount && t.onload && t.onload(), t.cloneRenderTo(!0))
                        },
                        onload: function() {
                            var t = this;
                            Xt([this.callback].concat(this.callbacks), (function(e) {
                                e && void 0 !== t.index && e.apply(t, [t])
                            })), Vt(t, "load"), this.onload = null
                        },
                        splashArray: function(t, e) {
                            var i = e[t];
                            return i = Jt(i) ? i : [i, i, i, i], [te(e[t + "Top"], i[0]), te(e[t + "Right"], i[1]), te(e[t + "Bottom"], i[2]), te(e[t + "Left"], i[3])]
                        }
                    }, ae = nt.CenteredSeriesMixin = {
                        getCenter: function() {
                            var t, e, i = this.options,
                                r = this.chart,
                                n = 2 * (i.slicedOffset || 0),
                                s = r.plotWidth - 2 * n,
                                o = (r = r.plotHeight - 2 * n, i.center),
                                a = (o = [te(o[0], "50%"), te(o[1], "50%"), i.size || "100%", i.innerSize || 0], dt(s, r));
                            for (t = 0; t < 4; ++t) e = o[t], i = t < 2 || 2 === t && /%$/.test(e), o[t] = (/%$/.test(e) ? [s, r, a, o[2]][t] * parseFloat(e) / 100 : parseFloat(e)) + (i ? n : 0);
                            return o[3] > o[2] && (o[3] = o[2]), o
                        }
                    };
                    var ye = function() {};
                    ye.prototype = {
                        init: function(t, e, i) {
                            return this.series = t, this.color = t.color, this.applyOptions(e, i), this.pointAttr = {}, t.options.colorByPoint && (e = t.options.colors || t.chart.options.colors, this.color = this.color || e[t.colorCounter++], t.colorCounter === e.length) && (t.colorCounter = 0), t.chart.pointCount++, this
                        },
                        applyOptions: function(t, e) {
                            var i = this.series,
                                r = i.options.pointValKey || i.pointValKey;
                            return t = ye.prototype.optionsToObject.call(this, t), qt(this, t), this.options = this.options ? qt(this.options, t) : t, t.group && delete this.group, r && (this.y = this[r]), this.isNull = te(this.isValid && !this.isValid(), null === this.x || !Qt(this.y, !0)), "name" in this && void 0 === e && i.xAxis && i.xAxis.hasNames && (this.x = i.xAxis.nameToX(this)), void 0 === this.x && i && (this.x = void 0 === e ? i.autoIncrement(this) : e), this
                        },
                        optionsToObject: function(t) {
                            var e = {},
                                i = this.series,
                                n = i.options.keys,
                                s = n || i.pointArrayMap || ["y"],
                                o = s.length,
                                l = 0,
                                h = 0;
                            if (Qt(t) || null === t) e[s[0]] = t;
                            else if (a(t))
                                for (!n && t.length > o && ("string" === (i = r(t[0])) ? e.name = t[0] : "number" === i && (e.x = t[0]), l++); h < o;) n && void 0 === t[l] || (e[s[h]] = t[l]), l++, h++;
                            else "object" === r(t) && (e = t, t.dataLabels && (i._hasPointLabels = !0), t.marker && (i._hasPointMarkers = !0));
                            return e
                        },
                        destroy: function() {
                            var t, e = this.series.chart,
                                i = e.hoverPoints;
                            for (t in e.pointCount--, i && (this.setState(), l(i, this), !i.length) && (e.hoverPoints = null), this === e.hoverPoint && this.onMouseOut(), (this.graphic || this.dataLabel) && (Ut(this), this.destroyElements()), this.legendItem && e.legend.destroyItem(this), this) this[t] = null
                        },
                        destroyElements: function() {
                            for (var t, e = ["graphic", "dataLabel", "dataLabelUpper", "connector", "shadowGroup"], i = 6; i--;) this[t = e[i]] && (this[t] = this[t].destroy())
                        },
                        getLabelConfig: function() {
                            return {
                                x: this.category,
                                y: this.y,
                                color: this.color,
                                key: this.name || this.category,
                                series: this.series,
                                point: this,
                                percentage: this.percentage,
                                total: this.total || this.stackTotal
                            }
                        },
                        tooltipFormatter: function(t) {
                            var e = this.series,
                                i = e.tooltipOptions,
                                r = te(i.valueDecimals, ""),
                                n = i.valuePrefix || "",
                                s = i.valueSuffix || "";
                            return Xt(e.pointArrayMap || ["y"], (function(e) {
                                e = "{point." + e, (n || s) && (t = t.replace(e + "}", n + e + "}" + s)), t = t.replace(e + "}", e + ":,." + r + "f}")
                            })), y(t, {
                                point: this,
                                series: this.series
                            })
                        },
                        firePointEvent: function(t, e, i) {
                            var r = this,
                                n = this.series.options;
                            (n.point.events[t] || r.options && r.options.events && r.options.events[t]) && this.importEvents(), "click" === t && n.allowPointSelect && (i = function(t) {
                                r.select && r.select(null, t.ctrlKey || t.metaKey || t.shiftKey)
                            }), Vt(this, t, e, i)
                        },
                        visible: !0
                    };
                    var xe = nt.Series = function() {};
                    xe.prototype = {
                        isCartesian: !0,
                        type: "line",
                        pointClass: ye,
                        sorted: !0,
                        requireSorting: !0,
                        pointAttrToOptions: {
                            stroke: "lineColor",
                            "stroke-width": "lineWidth",
                            fill: "fillColor",
                            r: "radius"
                        },
                        directTouch: !1,
                        axisTypes: ["xAxis", "yAxis"],
                        colorCounter: 0,
                        parallelArrays: ["x", "y"],
                        init: function(t, e) {
                            var i, r, n = this,
                                s = t.series,
                                o = function(t, e) {
                                    return te(t.options.index, t._i) - te(e.options.index, e._i)
                                };
                            for (i in n.chart = t, n.options = e = n.setOptions(e), n.linkedSeries = [], n.bindAxes(), qt(n, {
                                    name: e.name,
                                    state: "",
                                    pointAttr: {},
                                    visible: !1 !== e.visible,
                                    selected: !0 === e.selected
                                }), Pt && (e.animation = !1), r = e.events) jt(n, i, r[i]);
                            (r && r.click || e.point && e.point.events && e.point.events.click || e.allowPointSelect) && (t.runTrackerClick = !0), n.getColor(), n.getSymbol(), Xt(n.parallelArrays, (function(t) {
                                n[t + "Data"] = []
                            })), n.setData(e.data, !1), n.isCartesian && (t.hasCartesianSeries = !0), s.push(n), n._i = s.length - 1, w(s, o), this.yAxis && w(this.yAxis.series, o), Xt(s, (function(t, e) {
                                t.index = e, t.name = t.name || "Series " + (e + 1)
                            }))
                        },
                        bindAxes: function() {
                            var t, i = this,
                                r = i.options,
                                n = i.chart;
                            Xt(i.axisTypes || [], (function(s) {
                                Xt(n[s], (function(e) {
                                    t = e.options, (r[s] === t.index || r[s] !== B && r[s] === t.id || r[s] === B && 0 === t.index) && (e.series.push(i), i[s] = e, e.isDirty = !0)
                                })), !i[s] && i.optionalAxis !== s && e(18, !0)
                            }))
                        },
                        updateParallelArrays: function(t, e) {
                            var i = t.series,
                                r = arguments,
                                n = Qt(e) ? function(r) {
                                    var n = "y" === r && i.toYData ? i.toYData(t) : t[r];
                                    i[r + "Data"][e] = n
                                } : function(t) {
                                    Array.prototype[e].apply(i[t + "Data"], Array.prototype.slice.call(r, 2))
                                };
                            Xt(i.parallelArrays, n)
                        },
                        autoIncrement: function() {
                            var t, e = this.options,
                                i = this.xIncrement,
                                r = e.pointIntervalUnit;
                            return i = te(i, e.pointStart, 0), this.pointInterval = t = te(this.pointInterval, e.pointInterval, 1), r && (e = new X(i), "day" === r ? e = +e[et](e[_]() + t) : "month" === r ? e = +e[it](e[K]() + t) : "year" === r && (e = +e[rt](e[Z]() + t)), t = e - i), this.xIncrement = i + t, i
                        },
                        setOptions: function(t) {
                            var e, i = (e = this.chart).options.plotOptions,
                                r = (e = e.userOptions || {}).plotOptions || {},
                                s = i[this.type];
                            return this.userOptions = t, i = n(s, i.series, t), this.tooltipOptions = n(N.tooltip, N.plotOptions[this.type].tooltip, e.tooltip, r.series && r.series.tooltip, r[this.type] && r[this.type].tooltip, t.tooltip), null === s.marker && delete i.marker, this.zoneAxis = i.zoneAxis, t = this.zones = (i.zones || []).slice(), !i.negativeColor && !i.negativeFillColor || i.zones || t.push({
                                value: i[this.zoneAxis + "Threshold"] || i.threshold || 0,
                                color: i.negativeColor,
                                fillColor: i.negativeFillColor
                            }), t.length && h(t[t.length - 1].value) && t.push({
                                color: this.color,
                                fillColor: this.fillColor
                            }), i
                        },
                        getCyclic: function(t, e, i) {
                            var r = this.userOptions,
                                n = "_" + t + "Index",
                                s = t + "Counter";
                            e || (h(r[n]) ? e = r[n] : (r[n] = e = this.chart[s] % i.length, this.chart[s] += 1), e = i[e]), this[t] = e
                        },
                        getColor: function() {
                            this.options.colorByPoint ? this.options.color = null : this.getCyclic("color", this.options.color || ie[this.type].color, this.chart.options.colors)
                        },
                        getSymbol: function() {
                            var t = this.options.marker;
                            this.getCyclic("symbol", t.symbol, this.chart.options.symbols), /^url/.test(this.symbol) && (t.radius = 0)
                        },
                        drawLegendSymbol: ne.drawLineMarker,
                        setData: function(t, i, r, n) {
                            var s, l = this,
                                h = l.points,
                                c = h && h.length || 0,
                                d = l.options,
                                u = l.chart,
                                p = null,
                                f = l.xAxis,
                                g = d.turboThreshold,
                                m = this.xData,
                                v = this.yData,
                                y = (s = l.pointArrayMap) && s.length;
                            if (s = (t = t || []).length, i = te(i, !0), !1 !== n && s && c === s && !l.cropped && !l.hasGroupedData && l.visible) Xt(t, (function(t, e) {
                                h[e].update && t !== d.data[e] && h[e].update(t, !1, null, !1)
                            }));
                            else {
                                if (l.xIncrement = null, l.colorCounter = 0, Xt(this.parallelArrays, (function(t) {
                                        l[t + "Data"].length = 0
                                    })), g && s > g) {
                                    for (r = 0; null === p && r < s;) p = t[r], r++;
                                    if (Qt(p))
                                        for (r = 0; r < s; r++) m[r] = this.autoIncrement(), v[r] = t[r];
                                    else if (a(p))
                                        if (y)
                                            for (r = 0; r < s; r++) p = t[r], m[r] = p[0], v[r] = p.slice(1, y + 1);
                                        else
                                            for (r = 0; r < s; r++) p = t[r], m[r] = p[0], v[r] = p[1];
                                    else e(12)
                                } else
                                    for (r = 0; r < s; r++) t[r] !== B && (p = {
                                        series: l
                                    }, l.pointClass.prototype.applyOptions.apply(p, [t[r]]), l.updateParallelArrays(p, r));
                                for (o(v[0]) && e(14, !0), l.data = [], l.options.data = l.userOptions.data = t, r = c; r--;) h[r] && h[r].destroy && h[r].destroy();
                                f && (f.minRange = f.userMinRange), l.isDirty = l.isDirtyData = u.isDirtyBox = !0, r = !1
                            }
                            "point" === d.legendType && (this.processData(), this.generatePoints()), i && u.redraw(r)
                        },
                        processData: function(t) {
                            var i, r = this.xData,
                                n = this.yData,
                                s = r.length;
                            i = 0;
                            var o, a, l, h = this.xAxis;
                            l = (f = this.options).cropThreshold;
                            var c, d, u = this.getExtremesFromAll || f.getExtremesFromAll,
                                p = this.isCartesian,
                                f = h && h.val2lin,
                                g = h && h.isLog;
                            if (p && !this.isDirty && !h.isDirty && !this.yAxis.isDirty && !t) return !1;
                            for (h && (c = (t = h.getExtremes()).min, d = t.max), p && this.sorted && !u && (!l || s > l || this.forceCrop) && (r[s - 1] < c || r[0] > d ? (r = [], n = []) : (r[0] < c || r[s - 1] > d) && (r = (i = this.cropData(this.xData, this.yData, c, d)).xData, n = i.yData, i = i.start, o = !0)), l = r.length || 1; --l;)(s = g ? f(r[l]) - f(r[l - 1]) : r[l] - r[l - 1]) > 0 && (a === B || s < a) ? a = s : s < 0 && this.requireSorting && e(15);
                            this.cropped = o, this.cropStart = i, this.processedXData = r, this.processedYData = n, this.closestPointRange = a
                        },
                        cropData: function(t, e, i, r) {
                            var n, s = t.length,
                                o = 0,
                                a = s,
                                l = te(this.cropShoulder, 1);
                            for (n = 0; n < s; n++)
                                if (t[n] >= i) {
                                    o = ct(0, n - l);
                                    break
                                } for (i = n; i < s; i++)
                                if (t[i] > r) {
                                    a = i + l;
                                    break
                                } return {
                                xData: t.slice(o, a),
                                yData: e.slice(o, a),
                                start: o,
                                end: a
                            }
                        },
                        generatePoints: function() {
                            var t, e, i, r, n = this.options.data,
                                s = this.data,
                                o = this.processedXData,
                                a = this.processedYData,
                                l = this.pointClass,
                                h = o.length,
                                c = this.cropStart || 0,
                                u = this.hasGroupedData,
                                p = [];
                            for (s || u || ((s = []).length = n.length, s = this.data = s), r = 0; r < h; r++) e = c + r, u ? (p[r] = (new l).init(this, [o[r]].concat(d(a[r]))), p[r].dataGroup = this.groupMap[r]) : (s[e] ? i = s[e] : n[e] !== B && (s[e] = i = (new l).init(this, n[e], o[r])), p[r] = i), p[r].index = e;
                            if (s && (h !== (t = s.length) || u))
                                for (r = 0; r < t; r++) r === c && !u && (r += h), s[r] && (s[r].destroyElements(), s[r].plotX = B);
                            this.data = s, this.points = p
                        },
                        getExtremes: function(t) {
                            var e, i, r, n, s, o = this.yAxis,
                                l = this.processedXData,
                                h = [],
                                c = 0,
                                d = (e = this.xAxis.getExtremes()).min,
                                u = e.max;
                            for (e = (t = t || this.stackedYData || this.processedYData || []).length, s = 0; s < e; s++)
                                if (r = l[s], n = t[s], i = (Qt(n, !0) || a(n)) && (!o.isLog || n.length || n > 0), r = this.getExtremesFromAll || this.options.getExtremesFromAll || this.cropped || (l[s + 1] || r) >= d && (l[s - 1] || r) <= u, i && r)
                                    if (i = n.length)
                                        for (; i--;) null !== n[i] && (h[c++] = n[i]);
                                    else h[c++] = n;
                            this.dataMin = k(h), this.dataMax = C(h)
                        },
                        translate: function() {
                            this.processedXData || this.processData(), this.generatePoints();
                            for (var t, e, i, r, n = (v = this.options).stacking, s = this.xAxis, o = s.categories, a = this.yAxis, l = this.points, c = l.length, d = !!this.modifyValue, u = v.pointPlacement, p = "between" === u || Qt(u), f = v.threshold, g = v.startFromThreshold ? f : 0, m = Number.MAX_VALUE, v = 0; v < c; v++) {
                                var y = l[v],
                                    x = y.x,
                                    b = y.y;
                                e = y.low;
                                var w, k = n && a.stacks[(this.negStacks && b < (g ? 0 : f) ? "-" : "") + this.stackKey];
                                a.isLog && null !== b && b <= 0 && (y.isNull = !0), y.plotX = t = A(dt(ct(-1e5, s.translate(x, 0, 0, 0, 1, u, "flags" === this.type)), 1e5)), n && this.visible && !y.isNull && k && k[x] && (r = this.getStackIndicator(r, x, this.index), e = (b = (w = k[x]).points[r.key])[0], b = b[1], e === g && r.key === k[x].base && (e = te(f, a.min)), a.isLog && e <= 0 && (e = null), y.total = y.stackTotal = w.total, y.percentage = w.total && y.y / w.total * 100, y.stackY = b, w.setOffset(this.pointXOffset || 0, this.barW || 0)), y.yBottom = h(e) ? a.translate(e, 0, 1, 0, 1) : null, d && (b = this.modifyValue(b, y)), y.plotY = e = "number" == typeof b && b !== 1 / 0 ? dt(ct(-1e5, a.translate(b, 0, 1, 0, 1)), 1e5) : B, y.isInside = e !== B && e >= 0 && e <= a.len && t >= 0 && t <= s.len, y.clientX = p ? A(s.translate(x, 0, 0, 0, 1, u)) : t, y.negative = y.y < (f || 0), y.category = o && o[y.x] !== B ? o[y.x] : y.x, y.isNull || (void 0 !== i && (m = dt(m, ut(t - i))), i = t)
                            }
                            this.closestPointRangePx = m
                        },
                        getValidPoints: function(t, e) {
                            var i = this.chart;
                            return Gt(t || this.points || [], (function(t) {
                                return !(e && !i.isInsidePlot(t.plotX, t.plotY, i.inverted) || t.isNull)
                            }))
                        },
                        setClip: function(t) {
                            var e = this.chart,
                                i = this.options,
                                r = e.renderer,
                                n = e.inverted,
                                s = this.clipBox,
                                o = s || e.clipBox,
                                a = this.sharedClipKey || ["_sharedClip", t && t.duration, t && t.easing, o.height, i.xAxis, i.yAxis].join(","),
                                l = e[a],
                                h = e[a + "m"];
                            l || (t && (o.width = 0, e[a + "m"] = h = r.clipRect(-99, n ? -e.plotLeft : -e.plotTop, 99, n ? e.chartWidth : e.chartHeight)), e[a] = l = r.clipRect(o), l.count = {
                                length: 0
                            }), t && !l.count[this.index] && (l.count[this.index] = !0, l.count.length += 1), !1 !== i.clip && (this.group.clip(t || s ? l : e.clipRect), this.markerGroup.clip(h), this.sharedClipKey = a), t || (l.count[this.index] && (delete l.count[this.index], l.count.length -= 1), 0 === l.count.length && a && e[a] && (s || (e[a] = e[a].destroy()), e[a + "m"] && (e[a + "m"] = e[a + "m"].destroy())))
                        },
                        animate: function(t) {
                            var e, i = this.chart,
                                r = D(this.options.animation);
                            t ? this.setClip(r) : ((t = i[e = this.sharedClipKey]) && t.animate({
                                width: i.plotSizeX
                            }, r), i[e + "m"] && i[e + "m"].animate({
                                width: i.plotSizeX + 99
                            }, r), this.animate = null)
                        },
                        afterAnimate: function() {
                            this.setClip(), Vt(this, "afterAnimate")
                        },
                        drawPoints: function() {
                            var t, e, i, r, n, s, o, a, l, h, c, d, u = this.points,
                                p = this.chart,
                                f = this.options.marker,
                                g = this.pointAttr[""],
                                m = this.markerGroup,
                                v = te(f.enabled, this.xAxis.isRadial, this.closestPointRangePx > 2 * f.radius);
                            if (!1 !== f.enabled || this._hasPointMarkers)
                                for (r = u.length; r--;) n = u[r], e = lt(n.plotX), i = n.plotY, l = n.graphic, h = n.marker || {}, c = !!n.marker, t = v && h.enabled === B || h.enabled, d = n.isInside, t && Qt(i) && null !== n.y ? (s = (t = n.pointAttr[n.selected ? "select" : ""] || g).r, a = 0 === (o = te(h.symbol, this.symbol)).indexOf("url"), l ? l[d ? "show" : "hide"](!0).attr(t).animate(qt({
                                    x: e - s,
                                    y: i - s
                                }, l.symbolName ? {
                                    width: 2 * s,
                                    height: 2 * s
                                } : {})) : d && (s > 0 || a) && (n.graphic = p.renderer.symbol(o, e - s, i - s, 2 * s, 2 * s, c ? h : f).attr(t).add(m))) : l && (n.graphic = l.destroy())
                        },
                        convertAttribs: function(t, e, i, r) {
                            var n, s, o = this.pointAttrToOptions,
                                a = {};
                            for (n in t = t || {}, e = e || {}, i = i || {}, r = r || {}, o) s = o[n], a[n] = te(t[s], e[n], i[n], r[n]);
                            return a
                        },
                        getAttribs: function() {
                            var t, e, i, r = this,
                                n = r.options,
                                s = ie[r.type].marker ? n.marker : n,
                                o = s.states,
                                a = o.hover,
                                l = r.color,
                                c = r.options.negativeColor,
                                d = {
                                    stroke: l,
                                    fill: l
                                },
                                u = r.points || [],
                                p = [],
                                f = r.pointAttrToOptions;
                            t = r.hasPointSpecificOptions;
                            var g = s.lineColor,
                                m = s.fillColor;
                            e = n.turboThreshold;
                            var v, y, x = r.zones,
                                b = r.zoneAxis || "y";
                            if (n.marker ? (a.radius = +a.radius || +s.radius + +a.radiusPlus, a.lineWidth = a.lineWidth || s.lineWidth + a.lineWidthPlus) : (a.color = a.color || L(a.color || l).brighten(a.brightness).get(), a.negativeColor = a.negativeColor || L(a.negativeColor || c).brighten(a.brightness).get()), p[""] = r.convertAttribs(s, d), Xt(["hover", "select"], (function(t) {
                                    p[t] = r.convertAttribs(o[t], p[""])
                                })), r.pointAttr = p, l = u.length, !e || l < e || t)
                                for (; l--;) {
                                    if ((s = (e = u[l]).options && e.options.marker || e.options) && !1 === s.enabled && (s.radius = 0), d = null, x.length) {
                                        for (d = x[t = 0]; e[b] >= d.value;) d = x[++t];
                                        e.color = e.fillColor = d = te(d.color, r.color)
                                    }
                                    if (t = n.colorByPoint || e.color, e.options)
                                        for (y in f) h(s[f[y]]) && (t = !0);
                                    t ? (i = [], t = (o = (s = s || {}).states || {}).hover = o.hover || {}, n.marker && (!e.negative || t.fillColor || a.fillColor) || (t[r.pointAttrToOptions.fill] = t.color || !e.options.color && a[e.negative && c ? "negativeColor" : "color"] || L(e.color).brighten(t.brightness || a.brightness).get()), v = {
                                        color: e.color
                                    }, m || (v.fillColor = e.color), g || (v.lineColor = e.color), s.hasOwnProperty("color") && !s.color && delete s.color, d && !a.fillColor && (t.fillColor = d), i[""] = r.convertAttribs(qt(v, s), p[""]), i.hover = r.convertAttribs(o.hover, p.hover, i[""]), i.select = r.convertAttribs(o.select, p.select, i[""])) : i = p, e.pointAttr = i
                                }
                        },
                        destroy: function() {
                            var t, e, i, r, n = this,
                                s = n.chart,
                                o = /AppleWebKit\/533/.test(vt),
                                a = n.data || [];
                            for (Vt(n, "destroy"), Ut(n), Xt(n.axisTypes || [], (function(t) {
                                    (r = n[t]) && (l(r.series, n), r.isDirty = r.forceRedraw = !0)
                                })), n.legendItem && n.chart.legend.destroyItem(n), t = a.length; t--;)(e = a[t]) && e.destroy && e.destroy();
                            for (i in n.points = null, clearTimeout(n.animationTimeout), n) n[i] instanceof M && !n[i].survive && (t = o && "group" === i ? "hide" : "destroy", n[i][t]());
                            for (i in s.hoverSeries === n && (s.hoverSeries = null), l(s.series, n), n) delete n[i]
                        },
                        getGraphPath: function(t, e, i) {
                            var r, n, s = this,
                                o = s.options,
                                a = o.step,
                                l = [],
                                c = [];
                            return (r = (t = t || s.points).reversed) && t.reverse(), (a = {
                                right: 1,
                                center: 2
                            } [a] || a && 3) && r && (a = 4 - a), o.connectNulls && !e && !i && (t = this.getValidPoints(t)), Xt(t, (function(r, d) {
                                var u = r.plotX,
                                    p = r.plotY,
                                    f = t[d - 1];
                                (r.leftCliff || f && f.rightCliff) && !i && (n = !0), r.isNull && !h(e) && d > 0 ? n = !o.connectNulls : r.isNull && !e ? n = !0 : (0 === d || n ? f = [Bt, r.plotX, r.plotY] : s.getPointSpline ? f = s.getPointSpline(t, r, d) : a ? (f = 1 === a ? [Et, f.plotX, p] : 2 === a ? [Et, (f.plotX + u) / 2, f.plotY, Et, (f.plotX + u) / 2, p] : [Et, u, f.plotY]).push(Et, u, p) : f = [Et, u, p], c.push(r.x), a && c.push(r.x), l.push.apply(l, f), n = !1)
                            })), l.xMap = c, s.graphPath = l
                        },
                        drawGraph: function() {
                            var t = this,
                                e = this.options,
                                i = [
                                    ["graph", e.lineColor || this.color, e.dashStyle]
                                ],
                                r = e.lineWidth,
                                n = "square" !== e.linecap,
                                s = (this.gappedPath || this.getGraphPath).call(this);
                            Xt(this.zones, (function(r, n) {
                                i.push(["zoneGraph" + n, r.color || t.color, r.dashStyle || e.dashStyle])
                            })), Xt(i, (function(i, o) {
                                var a = i[0],
                                    l = t[a];
                                l ? (l.endX = s.xMap, l.animate({
                                    d: s
                                })) : r && s.length && (l = {
                                    stroke: i[1],
                                    "stroke-width": r,
                                    fill: "none",
                                    zIndex: 1
                                }, i[2] ? l.dashstyle = i[2] : n && (l["stroke-linecap"] = l["stroke-linejoin"] = "round"), l = t[a] = t.chart.renderer.path(s).attr(l).add(t.group).shadow(o < 2 && e.shadow)), l && (l.startX = s.xMap, l.isArea = s.isArea)
                            }))
                        },
                        applyZones: function() {
                            var t, e, i, r, n, s, o, a, l, h = this,
                                c = this.chart,
                                d = c.renderer,
                                u = this.zones,
                                p = this.clips || [],
                                f = this.graph,
                                g = this.area,
                                m = ct(c.chartWidth, c.chartHeight),
                                v = this[(this.zoneAxis || "y") + "Axis"],
                                y = c.inverted,
                                x = !1;
                            u.length && (f || g) && v && v.min !== B && (n = v.reversed, s = v.horiz, f && f.hide(), g && g.hide(), r = v.getExtremes(), Xt(u, (function(u, b) {
                                t = n ? s ? c.plotWidth : 0 : s ? 0 : v.toPixels(r.min), t = dt(ct(te(e, t), 0), m), e = dt(ct(at(v.toPixels(te(u.value, r.max), !0)), 0), m), x && (t = e = v.toPixels(r.max)), o = Math.abs(t - e), a = dt(t, e), l = ct(t, e), v.isXAxis ? (i = {
                                    x: y ? l : a,
                                    y: 0,
                                    width: o,
                                    height: m
                                }, s || (i.x = c.plotHeight - i.x)) : (i = {
                                    x: 0,
                                    y: y ? l : a,
                                    width: m,
                                    height: o
                                }, s && (i.y = c.plotWidth - i.y)), y && d.isVML && (i = v.isXAxis ? {
                                    x: 0,
                                    y: n ? a : l,
                                    height: i.width,
                                    width: c.chartWidth
                                } : {
                                    x: i.y - c.plotLeft - c.spacingBox.x,
                                    y: 0,
                                    width: i.height,
                                    height: c.chartHeight
                                }), p[b] ? p[b].animate(i) : (p[b] = d.clipRect(i), f && h["zoneGraph" + b].clip(p[b]), g && h["zoneArea" + b].clip(p[b])), x = u.value > r.max
                            })), this.clips = p)
                        },
                        invertGroups: function() {
                            function t() {
                                var t = {
                                    width: e.yAxis.len,
                                    height: e.xAxis.len
                                };
                                Xt(["group", "markerGroup"], (function(i) {
                                    e[i] && e[i].attr(t).invert()
                                }))
                            }
                            var e = this,
                                i = e.chart;
                            e.xAxis && (jt(i, "resize", t), jt(e, "destroy", (function() {
                                Ut(i, "resize", t)
                            })), t(), e.invertGroups = t)
                        },
                        plotGroup: function(t, e, i, r, n) {
                            var s = this[t],
                                o = !s;
                            return o && (this[t] = s = this.chart.renderer.g(e).attr({
                                zIndex: r || .1
                            }).add(n), s.addClass("highcharts-series-" + this.index)), s.attr({
                                visibility: i
                            })[o ? "attr" : "animate"](this.getPlotBox()), s
                        },
                        getPlotBox: function() {
                            var t = this.chart,
                                e = this.xAxis,
                                i = this.yAxis;
                            return t.inverted && (e = i, i = this.xAxis), {
                                translateX: e ? e.left : t.plotLeft,
                                translateY: i ? i.top : t.plotTop,
                                scaleX: 1,
                                scaleY: 1
                            }
                        },
                        render: function() {
                            var t, e = this,
                                i = e.chart,
                                r = e.options,
                                n = !!e.animate && i.renderer.isSVG && D(r.animation).duration,
                                s = e.visible ? "inherit" : "hidden",
                                o = r.zIndex,
                                a = e.hasRendered,
                                l = i.seriesGroup;
                            t = e.plotGroup("group", "series", s, o, l), e.markerGroup = e.plotGroup("markerGroup", "markers", s, o, l), n && e.animate(!0), e.getAttribs(), t.inverted = !!e.isCartesian && i.inverted, e.drawGraph && (e.drawGraph(), e.applyZones()), Xt(e.points, (function(t) {
                                t.redraw && t.redraw()
                            })), e.drawDataLabels && e.drawDataLabels(), e.visible && e.drawPoints(), e.drawTracker && !1 !== e.options.enableMouseTracking && e.drawTracker(), i.inverted && e.invertGroups(), !1 !== r.clip && !e.sharedClipKey && !a && t.clip(i.clipRect), n && e.animate(), a || (e.animationTimeout = u((function() {
                                e.afterAnimate()
                            }), n)), e.isDirty = e.isDirtyData = !1, e.hasRendered = !0
                        },
                        redraw: function() {
                            var t = this.chart,
                                e = this.isDirty || this.isDirtyData,
                                i = this.group,
                                r = this.xAxis,
                                n = this.yAxis;
                            i && (t.inverted && i.attr({
                                width: t.plotWidth,
                                height: t.plotHeight
                            }), i.animate({
                                translateX: te(r && r.left, t.plotLeft),
                                translateY: te(n && n.top, t.plotTop)
                            })), this.translate(), this.render(), e && delete this.kdTree
                        },
                        kdDimensions: 1,
                        kdAxisArray: ["clientX", "plotY"],
                        searchPoint: function(t, e) {
                            var i = this.xAxis,
                                r = this.yAxis,
                                n = this.chart.inverted;
                            return this.searchKDTree({
                                clientX: n ? i.len - t.chartY + i.pos : t.chartX - i.pos,
                                plotY: n ? r.len - t.chartX + r.pos : t.chartY - r.pos
                            }, e)
                        },
                        buildKDTree: function() {
                            function t(i, r, n) {
                                var s, o;
                                if (o = i && i.length) return s = e.kdAxisArray[r % n], i.sort((function(t, e) {
                                    return t[s] - e[s]
                                })), {
                                    point: i[o = Math.floor(o / 2)],
                                    left: t(i.slice(0, o), r + 1, n),
                                    right: t(i.slice(o + 1), r + 1, n)
                                }
                            }
                            var e = this,
                                i = e.kdDimensions;
                            delete e.kdTree, u((function() {
                                e.kdTree = t(e.getValidPoints(null, !e.directTouch), i, i)
                            }), e.options.kdNow ? 0 : 1)
                        },
                        searchKDTree: function(t, e) {
                            var i = this,
                                r = this.kdAxisArray[0],
                                n = this.kdAxisArray[1],
                                s = e ? "distX" : "dist";
                            if (this.kdTree || this.buildKDTree(), this.kdTree) return function t(e, o, a, l) {
                                var c, d, u = o.point,
                                    p = i.kdAxisArray[a % l],
                                    f = u;
                                return c = ((d = h(e[r]) && h(u[r]) ? Math.pow(e[r] - u[r], 2) : null) || 0) + ((c = h(e[n]) && h(u[n]) ? Math.pow(e[n] - u[n], 2) : null) || 0), u.dist = h(c) ? Math.sqrt(c) : Number.MAX_VALUE, u.distX = h(d) ? Math.sqrt(d) : Number.MAX_VALUE, d = (p = e[p] - u[p]) < 0 ? "right" : "left", o[c = p < 0 ? "left" : "right"] && (f = (c = t(e, o[c], a + 1, l))[s] < f[s] ? c : u), o[d] && Math.sqrt(p * p) < f[s] && (f = (e = t(e, o[d], a + 1, l))[s] < f[s] ? e : f), f
                            }(t, this.kdTree, this.kdDimensions, this.kdDimensions)
                        }
                    }, O.prototype = {
                        destroy: function() {
                            T(this, this.axis)
                        },
                        render: function(t) {
                            var e = this.options,
                                i = (i = e.format) ? y(i, this) : e.formatter.call(this);
                            this.label ? this.label.attr({
                                text: i,
                                visibility: "hidden"
                            }) : this.label = this.axis.chart.renderer.text(i, null, null, e.useHTML).css(e.style).attr({
                                align: this.textAlign,
                                rotation: e.rotation,
                                visibility: "hidden"
                            }).add(t)
                        },
                        setOffset: function(t, e) {
                            var i = (o = this.axis).chart,
                                r = i.inverted,
                                n = o.reversed,
                                s = (n = this.isNegative && !n || !this.isNegative && n, o.translate(o.usePercentage ? 100 : this.total, 0, 0, 0, 1)),
                                o = o.translate(0),
                                a = (o = ut(s - o), i.xAxis[0].translate(this.x) + t),
                                l = i.plotHeight;
                            n = {
                                x: r ? n ? s : s - o : a,
                                y: r ? l - a - e : n ? l - s - o : l - s,
                                width: r ? o : e,
                                height: r ? e : o
                            }, (r = this.label) && (r.align(this.alignOptions, null, n), n = r.alignAttr, r[!1 === this.options.crop || i.isInsidePlot(n.x, n.y) ? "show" : "hide"](!0))
                        }
                    }, ve.prototype.getStacks = function() {
                        var t = this;
                        Xt(t.yAxis, (function(t) {
                            t.stacks && t.hasVisibleSeries && (t.oldStacks = t.stacks)
                        })), Xt(t.series, (function(e) {
                            !e.options.stacking || !0 !== e.visible && !1 !== t.options.chart.ignoreHiddenSeries || (e.stackKey = e.type + te(e.options.stack, ""))
                        }))
                    }, le.prototype.buildStacks = function() {
                        var t, e, i = this.series,
                            r = te(this.options.reversedStacks, !0),
                            n = i.length;
                        if (!this.isXAxis) {
                            for (this.usePercentage = !1, e = n; e--;) i[r ? e : n - e - 1].setStackedPoints();
                            for (e = n; e--;)(t = i[r ? e : n - e - 1]).setStackCliffs && t.setStackCliffs();
                            if (this.usePercentage)
                                for (e = 0; e < n; e++) i[e].setPercentStacks()
                        }
                    }, le.prototype.renderStackTotals = function() {
                        var t, e, i = this.chart,
                            r = i.renderer,
                            n = this.stacks,
                            s = this.stackTotalGroup;
                        for (t in s || (this.stackTotalGroup = s = r.g("stack-labels").attr({
                                visibility: "visible",
                                zIndex: 6
                            }).add()), s.translate(i.plotLeft, i.plotTop), n)
                            for (e in i = n[t]) i[e].render(s)
                    }, le.prototype.resetStacks = function() {
                        var t, e, i = this.stacks;
                        if (!this.isXAxis)
                            for (t in i)
                                for (e in i[t]) i[t][e].touched < this.stacksTouched ? (i[t][e].destroy(), delete i[t][e]) : (i[t][e].total = null, i[t][e].cum = 0)
                    }, le.prototype.cleanStacks = function() {
                        var t, e, i;
                        if (!this.isXAxis)
                            for (e in this.oldStacks && (t = this.stacks = this.oldStacks), t)
                                for (i in t[e]) t[e][i].cum = t[e][i].total
                    }, xe.prototype.setStackedPoints = function() {
                        if (this.options.stacking && (!0 === this.visible || !1 === this.chart.options.chart.ignoreHiddenSeries)) {
                            var t, e, i, r, n, s, o, a = this.processedXData,
                                l = this.processedYData,
                                c = [],
                                d = l.length,
                                u = (g = this.options).threshold,
                                p = g.startFromThreshold ? u : 0,
                                f = g.stack,
                                g = g.stacking,
                                m = this.stackKey,
                                v = "-" + m,
                                y = this.negStacks,
                                x = this.yAxis,
                                b = x.stacks,
                                w = x.oldStacks;
                            for (x.stacksTouched += 1, n = 0; n < d; n++) s = a[n], o = l[n], r = (t = this.getStackIndicator(t, s, this.index)).key, b[i = (e = y && o < (p ? 0 : u)) ? v : m] || (b[i] = {}), b[i][s] || (w[i] && w[i][s] ? (b[i][s] = w[i][s], b[i][s].total = null) : b[i][s] = new O(x, x.options.stackLabels, e, s, f)), i = b[i][s], null !== o && (i.points[r] = i.points[this.index] = [te(i.cum, p)], h(i.cum) || (i.base = r), i.touched = x.stacksTouched, t.index > 0 && !1 === this.singleStacks && (i.points[r][0] = i.points[this.index + "," + s + ",0"][0])), "percent" === g ? (e = e ? m : v, y && b[e] && b[e][s] ? (e = b[e][s], i.total = e.total = ct(e.total, i.total) + ut(o) || 0) : i.total = A(i.total + (ut(o) || 0))) : i.total = A(i.total + (o || 0)), i.cum = te(i.cum, p) + (o || 0), null !== o && (i.points[r].push(i.cum), c[n] = i.cum);
                            "percent" === g && (x.usePercentage = !0), this.stackedYData = c, x.oldStacks = {}
                        }
                    }, xe.prototype.setPercentStacks = function() {
                        var t, e = this,
                            i = e.stackKey,
                            r = e.yAxis.stacks,
                            n = e.processedXData;
                        Xt([i, "-" + i], (function(i) {
                            for (var s, o, a = n.length; a--;) s = n[a], t = e.getStackIndicator(t, s, e.index), (s = (o = r[i] && r[i][s]) && o.points[t.key]) && (o = o.total ? 100 / o.total : 0, s[0] = A(s[0] * o), s[1] = A(s[1] * o), e.stackedYData[a] = s[1])
                        }))
                    }, xe.prototype.getStackIndicator = function(t, e, i) {
                        return h(t) && t.x === e ? t.index++ : t = {
                            x: e,
                            index: 0
                        }, t.key = [i, e, t.index].join(","), t
                    }, qt(ve.prototype, {
                        addSeries: function(t, e, i) {
                            var r, n = this;
                            return t && (e = te(e, !0), Vt(n, "addSeries", {
                                options: t
                            }, (function() {
                                r = n.initSeries(t), n.isDirtyLegend = !0, n.linkSeries(), e && n.redraw(i)
                            }))), r
                        },
                        addAxis: function(t, e, i, r) {
                            var s = e ? "xAxis" : "yAxis",
                                o = this.options;
                            t = n(t, {
                                index: this[s].length,
                                isX: e
                            }), new le(this, t), o[s] = d(o[s] || {}), o[s].push(t), te(i, !0) && this.redraw(r)
                        },
                        showLoading: function(t) {
                            var e = this,
                                i = e.options,
                                r = e.loadingDiv,
                                n = i.loading,
                                s = function() {
                                    r && p(r, {
                                        left: e.plotLeft + "px",
                                        top: e.plotTop + "px",
                                        width: e.plotWidth + "px",
                                        height: e.plotHeight + "px"
                                    })
                                };
                            r || (e.loadingDiv = r = f(Ot, {
                                className: "highcharts-loading"
                            }, qt(n.style, {
                                zIndex: 10,
                                display: "none"
                            }), e.container), e.loadingSpan = f("span", null, n.labelStyle, r), jt(e, "redraw", s)), e.loadingSpan.innerHTML = t || i.lang.loading, e.loadingShown || (p(r, {
                                opacity: 0,
                                display: ""
                            }), _t(r, {
                                opacity: n.style.opacity
                            }, {
                                duration: n.showDuration || 0
                            }), e.loadingShown = !0), s()
                        },
                        hideLoading: function() {
                            var t = this.options,
                                e = this.loadingDiv;
                            e && _t(e, {
                                opacity: 0
                            }, {
                                duration: t.loading.hideDuration || 100,
                                complete: function() {
                                    p(e, {
                                        display: "none"
                                    })
                                }
                            }), this.loadingShown = !1
                        }
                    }), qt(ye.prototype, {
                        update: function(t, e, i, r) {
                            function n() {
                                o.applyOptions(t), null === o.y && l && (o.graphic = l.destroy()), Jt(t, !0) && (o.redraw = function() {
                                    l && l.element && t && t.marker && t.marker.symbol && (o.graphic = l.destroy()), t && t.dataLabels && o.dataLabel && (o.dataLabel = o.dataLabel.destroy()), o.redraw = null
                                }), s = o.index, a.updateParallelArrays(o, s), c.data[s] = Jt(c.data[s], !0) ? o.options : t, a.isDirty = a.isDirtyData = !0, !a.fixedBox && a.hasCartesianSeries && (h.isDirtyBox = !0), "point" === c.legendType && (h.isDirtyLegend = !0), e && h.redraw(i)
                            }
                            var s, o = this,
                                a = o.series,
                                l = o.graphic,
                                h = a.chart,
                                c = a.options;
                            e = te(e, !0), !1 === r ? n() : o.firePointEvent("update", {
                                options: t
                            }, n)
                        },
                        remove: function(t, e) {
                            this.series.removePoint(Ht(this, this.series.data), t, e)
                        }
                    }), qt(xe.prototype, {
                        addPoint: function(t, e, i, r) {
                            var n, s, o, a, l = this.options,
                                h = this.data,
                                c = this.chart,
                                d = this.xAxis && this.xAxis.names,
                                u = l.data,
                                p = this.xData;
                            if (e = te(e, !0), n = {
                                    series: this
                                }, this.pointClass.prototype.applyOptions.apply(n, [t]), a = n.x, o = p.length, this.requireSorting && a < p[o - 1])
                                for (s = !0; o && p[o - 1] > a;) o--;
                            this.updateParallelArrays(n, "splice", o, 0, 0), this.updateParallelArrays(n, o), d && n.name && (d[a] = n.name), u.splice(o, 0, t), s && (this.data.splice(o, 0, null), this.processData()), "point" === l.legendType && this.generatePoints(), i && (h[0] && h[0].remove ? h[0].remove(!1) : (h.shift(), this.updateParallelArrays(n, "shift"), u.shift())), this.isDirtyData = this.isDirty = !0, e && (this.getAttribs(), c.redraw(r))
                        },
                        removePoint: function(t, e, i) {
                            var r = this,
                                n = r.data,
                                s = n[t],
                                o = r.points,
                                a = r.chart,
                                l = function() {
                                    o && o.length === n.length && o.splice(t, 1), n.splice(t, 1), r.options.data.splice(t, 1), r.updateParallelArrays(s || {
                                        series: r
                                    }, "splice", t, 1), s && s.destroy(), r.isDirty = !0, r.isDirtyData = !0, e && a.redraw()
                                };
                            P(i, a), e = te(e, !0), s ? s.firePointEvent("remove", null, l) : l()
                        },
                        remove: function(t, e, i) {
                            function r() {
                                n.destroy(), s.isDirtyLegend = s.isDirtyBox = !0, s.linkSeries(), te(t, !0) && s.redraw(e)
                            }
                            var n = this,
                                s = n.chart;
                            !1 !== i ? Vt(n, "remove", null, r) : r()
                        },
                        update: function(t, e) {
                            var i, r = this,
                                s = this.chart,
                                o = this.userOptions,
                                a = this.type,
                                l = Nt[a].prototype,
                                h = ["group", "markerGroup", "dataLabelsGroup"];
                            for (i in (t.type && t.type !== a || void 0 !== t.zIndex) && (h.length = 0), Xt(h, (function(t) {
                                    h[t] = r[t], delete r[t]
                                })), t = n(o, {
                                    animation: !1,
                                    index: this.index,
                                    pointStart: this.xData[0]
                                }, {
                                    data: this.options.data
                                }, t), this.remove(!1, null, !1), l) this[i] = B;
                            qt(this, Nt[t.type || a].prototype), Xt(h, (function(t) {
                                r[t] = h[t]
                            })), this.init(s, t), s.linkSeries(), te(e, !0) && s.redraw(!1)
                        }
                    }), qt(le.prototype, {
                        update: function(t, e) {
                            var i = this.chart;
                            t = i.options[this.coll][this.options.index] = n(this.userOptions, t), this.destroy(!0), this.init(i, qt(t, {
                                events: B
                            })), i.isDirtyBox = !0, te(e, !0) && i.redraw()
                        },
                        remove: function(t) {
                            for (var e = this.chart, i = this.coll, r = this.series, n = r.length; n--;) r[n] && r[n].remove(!1);
                            l(e.axes, this), l(e[i], this), e.options[i].splice(this.options.index, 1), Xt(e[i], (function(t, e) {
                                t.options.index = e
                            })), this.destroy(), e.isDirtyBox = !0, te(t, !0) && e.redraw()
                        },
                        setTitle: function(t, e) {
                            this.update({
                                title: t
                            }, e)
                        },
                        setCategories: function(t, e) {
                            this.update({
                                categories: t
                            }, e)
                        }
                    });
                    var be = g(xe);
                    Nt.line = be, ie.area = n(re, {
                        softThreshold: !1,
                        threshold: 0
                    });
                    var we, ke, Ce, Te, Se, Ae = g(xe, {
                        type: "area",
                        singleStacks: !1,
                        getStackPoints: function() {
                            var t, e, i, r = [],
                                n = [],
                                s = this.xAxis,
                                o = this.yAxis,
                                a = o.stacks[this.stackKey],
                                l = {},
                                h = this.points,
                                c = this.index,
                                d = o.series,
                                u = d.length,
                                p = te(o.options.reversedStacks, !0) ? 1 : -1;
                            if (this.options.stacking) {
                                for (e = 0; e < h.length; e++) l[h[e].x] = h[e];
                                for (i in a) null !== a[i].total && n.push(i);
                                n.sort((function(t, e) {
                                    return t - e
                                })), t = Yt(d, (function() {
                                    return this.visible
                                })), Xt(n, (function(i, h) {
                                    var d, f, g = 0;
                                    if (l[i] && !l[i].isNull) r.push(l[i]), Xt([-1, 1], (function(r) {
                                        var s = 1 === r ? "rightNull" : "leftNull",
                                            o = 0,
                                            g = a[n[h + r]];
                                        if (g)
                                            for (e = c; e >= 0 && e < u;)(d = g.points[e]) || (e === c ? l[i][s] = !0 : t[e] && (f = a[i].points[e]) && (o -= f[1] - f[0])), e += p;
                                        l[i][1 === r ? "rightCliff" : "leftCliff"] = o
                                    }));
                                    else {
                                        for (e = c; e >= 0 && e < u;) {
                                            if (d = a[i].points[e]) {
                                                g = d[1];
                                                break
                                            }
                                            e += p
                                        }
                                        g = o.toPixels(g, !0), r.push({
                                            isNull: !0,
                                            plotX: s.toPixels(i, !0),
                                            plotY: g,
                                            yBottom: g
                                        })
                                    }
                                }))
                            }
                            return r
                        },
                        getGraphPath: function(t) {
                            var e, i, r, n, s = xe.prototype.getGraphPath,
                                o = (f = this.options).stacking,
                                a = this.yAxis,
                                l = [],
                                h = [],
                                c = this.index,
                                d = a.stacks[this.stackKey],
                                u = f.threshold,
                                p = a.getThreshold(f.threshold),
                                f = f.connectNulls || "percent" === o,
                                g = function(e, i, n) {
                                    var s, f, g = t[e],
                                        m = (e = o && d[g.x].points[c], g[n + "Null"] || 0);
                                    n = g[n + "Cliff"] || 0, g = !0, n || m ? (s = (m ? e[0] : e[1]) + n, f = e[0] + n, g = !!m) : !o && t[i] && t[i].isNull && (s = f = u), void 0 !== s && (h.push({
                                        plotX: r,
                                        plotY: null === s ? p : a.getThreshold(s),
                                        isNull: g
                                    }), l.push({
                                        plotX: r,
                                        plotY: null === f ? p : a.getThreshold(f),
                                        doCurve: !1
                                    }))
                                };
                            for (t = t || this.points, o && (t = this.getStackPoints()), e = 0; e < t.length; e++) i = t[e].isNull, r = te(t[e].rectPlotX, t[e].plotX), n = te(t[e].yBottom, p), (!i || f) && (f || g(e, e - 1, "left"), i && !o && f || (h.push(t[e]), l.push({
                                x: e,
                                plotX: r,
                                plotY: n
                            })), f || g(e, e + 1, "right"));
                            return e = s.call(this, h, !0, !0), l.reversed = !0, (i = s.call(this, l, !0, !0)).length && (i[0] = Et), i = e.concat(i), s = s.call(this, h, !1, f), i.xMap = e.xMap, this.areaPath = i, s
                        },
                        drawGraph: function() {
                            this.areaPath = [], xe.prototype.drawGraph.apply(this);
                            var t = this,
                                e = this.areaPath,
                                i = this.options,
                                r = [
                                    ["area", this.color, i.fillColor]
                                ];
                            Xt(this.zones, (function(e, n) {
                                r.push(["zoneArea" + n, e.color || t.color, e.fillColor || i.fillColor])
                            })), Xt(r, (function(r) {
                                var n = r[0],
                                    s = t[n];
                                s ? (s.endX = e.xMap, s.animate({
                                    d: e
                                })) : (s = {
                                    fill: r[2] || r[1],
                                    zIndex: 0
                                }, r[2] || (s["fill-opacity"] = te(i.fillOpacity, .75)), (s = t[n] = t.chart.renderer.path(e).attr(s).add(t.group)).isArea = !0), s.startX = e.xMap, s.shiftUnit = i.step ? 2 : 1
                            }))
                        },
                        drawLegendSymbol: ne.drawRectangle
                    });
                    return Nt.area = Ae, ie.spline = n(re), be = g(xe, {
                        type: "spline",
                        getPointSpline: function(t, e, i) {
                            var r, n, s, o, a = e.plotX,
                                l = e.plotY,
                                h = t[i - 1];
                            if (i = t[i + 1], h && !h.isNull && !1 !== h.doCurve && i && !i.isNull && !1 !== i.doCurve) {
                                t = h.plotY, s = i.plotX;
                                var c = 0;
                                n = (1.5 * l + t) / 2.5, o = (1.5 * l + (i = i.plotY)) / 2.5, (s = (1.5 * a + s) / 2.5) != (r = (1.5 * a + h.plotX) / 2.5) && (c = (o - n) * (s - a) / (s - r) + l - o), o += c, (n += c) > t && n > l ? o = 2 * l - (n = ct(t, l)) : n < t && n < l && (o = 2 * l - (n = dt(t, l))), o > i && o > l ? n = 2 * l - (o = ct(i, l)) : o < i && o < l && (n = 2 * l - (o = dt(i, l))), e.rightContX = s, e.rightContY = o
                            }
                            return e = ["C", te(h.rightContX, h.plotX), te(h.rightContY, h.plotY), te(r, a), te(n, l), a, l], h.rightContX = h.rightContY = null, e
                        }
                    }), Nt.spline = be, ie.areaspline = n(ie.area), be = g(be, {
                        type: "areaspline",
                        getStackPoints: (Ae = Ae.prototype).getStackPoints,
                        getGraphPath: Ae.getGraphPath,
                        setStackCliffs: Ae.setStackCliffs,
                        drawGraph: Ae.drawGraph,
                        drawLegendSymbol: ne.drawRectangle
                    }), Nt.areaspline = be, ie.column = n(re, {
                        borderColor: "#FFFFFF",
                        borderRadius: 0,
                        groupPadding: .2,
                        marker: null,
                        pointPadding: .1,
                        minPointLength: 0,
                        cropThreshold: 50,
                        pointRange: null,
                        states: {
                            hover: {
                                brightness: .1,
                                shadow: !1,
                                halo: !1
                            },
                            select: {
                                color: "#C0C0C0",
                                borderColor: "#000000",
                                shadow: !1
                            }
                        },
                        dataLabels: {
                            align: null,
                            verticalAlign: null,
                            y: null
                        },
                        softThreshold: !1,
                        startFromThreshold: !0,
                        stickyTracking: !1,
                        tooltip: {
                            distance: 6
                        },
                        threshold: 0
                    }), be = g(xe, {
                        type: "column",
                        pointAttrToOptions: {
                            stroke: "borderColor",
                            fill: "color",
                            r: "borderRadius"
                        },
                        cropShoulder: 0,
                        directTouch: !0,
                        trackerGroups: ["group", "dataLabelsGroup"],
                        negStacks: !0,
                        init: function() {
                            xe.prototype.init.apply(this, arguments);
                            var t = this,
                                e = t.chart;
                            e.hasRendered && Xt(e.series, (function(e) {
                                e.type === t.type && (e.isDirty = !0)
                            }))
                        },
                        getColumnMetrics: function() {
                            var t, e = this,
                                i = e.options,
                                r = e.xAxis,
                                n = e.yAxis,
                                s = r.reversed,
                                o = {},
                                a = 0;
                            !1 === i.grouping ? a = 1 : Xt(e.chart.series, (function(i) {
                                var r, s = i.options,
                                    l = i.yAxis;
                                i.type === e.type && i.visible && n.len === l.len && n.pos === l.pos && (s.stacking ? (t = i.stackKey, o[t] === B && (o[t] = a++), r = o[t]) : !1 !== s.grouping && (r = a++), i.columnIndex = r)
                            }));
                            var l = dt(ut(r.transA) * (r.ordinalSlope || i.pointRange || r.closestPointRange || r.tickInterval || 1), r.len),
                                h = l * i.groupPadding,
                                c = (l - 2 * h) / a;
                            return i = dt(i.maxPointWidth || r.len, te(i.pointWidth, c * (1 - 2 * i.pointPadding))), e.columnMetrics = {
                                width: i,
                                offset: (c - i) / 2 + (h + ((e.columnIndex || 0) + (s ? 1 : 0)) * c - l / 2) * (s ? -1 : 1)
                            }, e.columnMetrics
                        },
                        crispCol: function(t, e, i, r) {
                            var n = this.chart,
                                s = -((o = this.borderWidth) % 2 ? .5 : 0),
                                o = o % 2 ? .5 : 1;
                            return n.inverted && n.renderer.isVML && (o += 1), i = Math.round(t + i) + s, i -= t = Math.round(t) + s, r = Math.round(e + r) + o, s = ut(e) <= .5 && r > .5, r -= e = Math.round(e) + o, s && r && (e -= 1, r += 1), {
                                x: t,
                                y: e,
                                width: i,
                                height: r
                            }
                        },
                        translate: function() {
                            var t = this,
                                e = t.chart,
                                i = t.options,
                                r = t.borderWidth = te(i.borderWidth, t.closestPointRange * t.xAxis.transA < 2 ? 0 : 1),
                                n = t.yAxis,
                                s = t.translatedThreshold = n.getThreshold(i.threshold),
                                o = te(i.minPointLength, 5),
                                a = t.getColumnMetrics(),
                                l = a.width,
                                h = t.barW = ct(l, 1 + 2 * r),
                                c = t.pointXOffset = a.offset;
                            e.inverted && (s -= .5), i.pointPadding && (h = ht(h)), xe.prototype.translate.apply(t), Xt(t.points, (function(i) {
                                var r, a = dt(te(i.yBottom, s), 9e4),
                                    d = 999 + ut(a),
                                    u = (d = dt(ct(-d, i.plotY), n.len + d), i.plotX + c),
                                    p = h,
                                    f = dt(d, a),
                                    g = ct(d, a) - f;
                                ut(g) < o && o && (g = o, r = !n.reversed && !i.negative || n.reversed && i.negative, f = ut(f - s) > o ? a - o : s - (r ? o : 0)), i.barX = u, i.pointWidth = l, i.tooltipPos = e.inverted ? [n.len + n.pos - e.plotLeft - d, t.xAxis.len - u - p / 2, g] : [u + p / 2, d + n.pos - e.plotTop, g], i.shapeType = "rect", i.shapeArgs = t.crispCol.apply(t, i.isNull ? [i.plotX, n.len / 2, 0, 0] : [u, f, p, g])
                            }))
                        },
                        getSymbol: Lt,
                        drawLegendSymbol: ne.drawRectangle,
                        drawGraph: Lt,
                        drawPoints: function() {
                            var t, e, i = this,
                                r = this.chart,
                                s = i.options,
                                o = r.renderer,
                                a = s.animationLimit || 250;
                            Xt(i.points, (function(l) {
                                var c, d = l.graphic;
                                Qt(l.plotY) && null !== l.y ? (t = l.shapeArgs, c = h(i.borderWidth) ? {
                                    "stroke-width": i.borderWidth
                                } : {}, e = l.pointAttr[l.selected ? "select" : ""] || i.pointAttr[""], d ? (Kt(d), d.attr(c).attr(e)[r.pointCount < a ? "animate" : "attr"](n(t))) : l.graphic = o[l.shapeType](t).attr(c).attr(e).add(l.group || i.group).shadow(s.shadow, null, s.stacking && !s.borderRadius)) : d && (l.graphic = d.destroy())
                            }))
                        },
                        animate: function(t) {
                            var e = this,
                                i = this.yAxis,
                                r = e.options,
                                n = this.chart.inverted,
                                s = {};
                            St && (t ? (s.scaleY = .001, t = dt(i.pos + i.len, ct(i.pos, i.toPixels(r.threshold))), n ? s.translateX = t - i.len : s.translateY = t, e.group.attr(s)) : (s[n ? "translateX" : "translateY"] = i.pos, e.group.animate(s, qt(D(e.options.animation), {
                                step: function(t, i) {
                                    e.group.attr({
                                        scaleY: ct(.001, i.pos)
                                    })
                                }
                            })), e.animate = null))
                        },
                        remove: function() {
                            var t = this,
                                e = t.chart;
                            e.hasRendered && Xt(e.series, (function(e) {
                                e.type === t.type && (e.isDirty = !0)
                            })), xe.prototype.remove.apply(t, arguments)
                        }
                    }), Nt.column = be, ie.bar = n(ie.column), Ae = g(be, {
                        type: "bar",
                        inverted: !0
                    }), Nt.bar = Ae, ie.scatter = n(re, {
                        lineWidth: 0,
                        marker: {
                            enabled: !0
                        },
                        tooltip: {
                            headerFormat: '<span style="color:{point.color}">●</span> <span style="font-size: 10px;"> {series.name}</span><br/>',
                            pointFormat: "x: <b>{point.x}</b><br/>y: <b>{point.y}</b><br/>"
                        }
                    }), Ae = g(xe, {
                        type: "scatter",
                        sorted: !1,
                        requireSorting: !1,
                        noSharedTooltip: !0,
                        trackerGroups: ["group", "markerGroup", "dataLabelsGroup"],
                        takeOrdinalPosition: !1,
                        kdDimensions: 2,
                        drawGraph: function() {
                            this.options.lineWidth && xe.prototype.drawGraph.call(this)
                        }
                    }), Nt.scatter = Ae, ie.pie = n(re, {
                        borderColor: "#FFFFFF",
                        borderWidth: 1,
                        center: [null, null],
                        clip: !1,
                        colorByPoint: !0,
                        dataLabels: {
                            distance: 30,
                            enabled: !0,
                            formatter: function() {
                                return null === this.y ? void 0 : this.point.name
                            },
                            x: 0
                        },
                        ignoreHiddenPoint: !0,
                        legendType: "point",
                        marker: null,
                        size: null,
                        showInLegend: !1,
                        slicedOffset: 10,
                        states: {
                            hover: {
                                brightness: .1,
                                shadow: !1
                            }
                        },
                        stickyTracking: !1,
                        tooltip: {
                            followPointer: !0
                        }
                    }), re = {
                        type: "pie",
                        isCartesian: !1,
                        pointClass: g(ye, {
                            init: function() {
                                ye.prototype.init.apply(this, arguments);
                                var t, e = this;
                                return e.name = te(e.name, "Slice"), t = function(t) {
                                    e.slice("select" === t.type)
                                }, jt(e, "select", t), jt(e, "unselect", t), e
                            },
                            setVisible: function(t, e) {
                                var i = this,
                                    r = i.series,
                                    n = r.chart,
                                    s = r.options.ignoreHiddenPoint;
                                e = te(e, s), t !== i.visible && (i.visible = i.options.visible = t = t === B ? !i.visible : t, r.options.data[Ht(i, r.data)] = i.options, Xt(["graphic", "dataLabel", "connector", "shadowGroup"], (function(e) {
                                    i[e] && i[e][t ? "show" : "hide"](!0)
                                })), i.legendItem && n.legend.colorizeItem(i, t), !t && "hover" === i.state && i.setState(""), s && (r.isDirty = !0), e && n.redraw())
                            },
                            slice: function(t, e, i) {
                                var r = this.series;
                                P(i, r.chart), te(e, !0), this.sliced = this.options.sliced = t = h(t) ? t : !this.sliced, r.options.data[Ht(this, r.data)] = this.options, t = t ? this.slicedTranslation : {
                                    translateX: 0,
                                    translateY: 0
                                }, this.graphic.animate(t), this.shadowGroup && this.shadowGroup.animate(t)
                            },
                            haloPath: function(t) {
                                var e = this.shapeArgs,
                                    i = this.series.chart;
                                return this.sliced || !this.visible ? [] : this.series.chart.renderer.symbols.arc(i.plotLeft + e.x, i.plotTop + e.y, e.r + t, e.r + t, {
                                    innerR: this.shapeArgs.r,
                                    start: e.start,
                                    end: e.end
                                })
                            }
                        }),
                        requireSorting: !1,
                        directTouch: !0,
                        noSharedTooltip: !0,
                        trackerGroups: ["group", "dataLabelsGroup"],
                        axisTypes: [],
                        pointAttrToOptions: {
                            stroke: "borderColor",
                            "stroke-width": "borderWidth",
                            fill: "color"
                        },
                        animate: function(t) {
                            var e = this,
                                i = e.points,
                                r = e.startAngleRad;
                            t || (Xt(i, (function(t) {
                                var i = t.graphic,
                                    n = t.shapeArgs;
                                i && (i.attr({
                                    r: t.startR || e.center[3] / 2,
                                    start: r,
                                    end: r
                                }), i.animate({
                                    r: n.r,
                                    start: n.start,
                                    end: n.end
                                }, e.options.animation))
                            })), e.animate = null)
                        },
                        updateTotals: function() {
                            var t, e, i = 0,
                                r = this.points,
                                n = r.length,
                                s = this.options.ignoreHiddenPoint;
                            for (t = 0; t < n; t++)(e = r[t]).y < 0 && (e.y = null), i += s && !e.visible ? 0 : e.y;
                            for (this.total = i, t = 0; t < n; t++)(e = r[t]).percentage = i > 0 && (e.visible || !s) ? e.y / i * 100 : 0, e.total = i
                        },
                        generatePoints: function() {
                            xe.prototype.generatePoints.call(this), this.updateTotals()
                        },
                        translate: function(t) {
                            this.generatePoints();
                            var e, i, r, n, s, o = 0,
                                a = (p = this.options).slicedOffset,
                                l = a + p.borderWidth,
                                h = p.startAngle || 0,
                                c = this.startAngleRad = gt / 180 * (h - 90),
                                d = (h = (this.endAngleRad = gt / 180 * (te(p.endAngle, h + 360) - 90)) - c, this.points),
                                u = p.dataLabels.distance,
                                p = p.ignoreHiddenPoint,
                                f = d.length;
                            for (t || (this.center = t = this.getCenter()), this.getX = function(e, i) {
                                    return r = ot.asin(dt((e - t[1]) / (t[2] / 2 + u), 1)), t[0] + (i ? -1 : 1) * pt(r) * (t[2] / 2 + u)
                                }, n = 0; n < f; n++) s = d[n], e = c + o * h, p && !s.visible || (o += s.percentage / 100), i = c + o * h, s.shapeType = "arc", s.shapeArgs = {
                                x: t[0],
                                y: t[1],
                                r: t[2] / 2,
                                innerR: t[3] / 2,
                                start: at(1e3 * e) / 1e3,
                                end: at(1e3 * i) / 1e3
                            }, (r = (i + e) / 2) > 1.5 * gt ? r -= 2 * gt : r < -gt / 2 && (r += 2 * gt), s.slicedTranslation = {
                                translateX: at(pt(r) * a),
                                translateY: at(ft(r) * a)
                            }, e = pt(r) * t[2] / 2, i = ft(r) * t[2] / 2, s.tooltipPos = [t[0] + .7 * e, t[1] + .7 * i], s.half = r < -gt / 2 || r > gt / 2 ? 1 : 0, s.angle = r, l = dt(l, u / 2), s.labelPos = [t[0] + e + pt(r) * u, t[1] + i + ft(r) * u, t[0] + e + pt(r) * l, t[1] + i + ft(r) * l, t[0] + e, t[1] + i, u < 0 ? "center" : s.half ? "right" : "left", r]
                        },
                        drawGraph: null,
                        drawPoints: function() {
                            var t, e, i, r, n, s, o = this,
                                a = o.chart.renderer,
                                l = o.options.shadow;
                            l && !o.shadowGroup && (o.shadowGroup = a.g("shadow").add(o.group)), Xt(o.points, (function(h) {
                                null !== h.y && (e = h.graphic, n = h.shapeArgs, i = h.shadowGroup, (r = h.pointAttr[h.selected ? "select" : ""]).stroke || (r.stroke = r.fill), l && !i && (i = h.shadowGroup = a.g("shadow").add(o.shadowGroup)), t = h.sliced ? h.slicedTranslation : {
                                    translateX: 0,
                                    translateY: 0
                                }, i && i.attr(t), e ? e.setRadialReference(o.center).attr(r).animate(qt(n, t)) : (s = {
                                    "stroke-linejoin": "round"
                                }, h.visible || (s.visibility = "hidden"), h.graphic = e = a[h.shapeType](n).setRadialReference(o.center).attr(r).attr(s).attr(t).add(o.group).shadow(l, i)))
                            }))
                        },
                        searchPoint: Lt,
                        sortByAngle: function(t, e) {
                            t.sort((function(t, i) {
                                return void 0 !== t.angle && (i.angle - t.angle) * e
                            }))
                        },
                        drawLegendSymbol: ne.drawRectangle,
                        getCenter: ae.getCenter,
                        getSymbol: Lt
                    }, re = g(xe, re), Nt.pie = re, xe.prototype.drawDataLabels = function() {
                        var t, e, i, r, s = this,
                            o = s.options,
                            a = o.cursor,
                            l = o.dataLabels,
                            c = s.points,
                            d = s.hasRendered || 0,
                            u = te(l.defer, !0),
                            p = s.chart.renderer;
                        (l.enabled || s._hasPointLabels) && (s.dlProcessOptions && s.dlProcessOptions(l), r = s.plotGroup("dataLabelsGroup", "data-labels", u && !d ? "hidden" : "visible", l.zIndex || 6), u && (r.attr({
                            opacity: +d
                        }), d || jt(s, "afterAnimate", (function() {
                            s.visible && r.show(!0), r[o.animation ? "animate" : "attr"]({
                                opacity: 1
                            }, {
                                duration: 200
                            })
                        }))), e = l, Xt(c, (function(c) {
                            var d, u, f, g, m = c.dataLabel,
                                v = c.connector,
                                x = !0,
                                b = {};
                            if (t = c.dlOptions || c.options && c.options.dataLabels, d = te(t && t.enabled, e.enabled) && null !== c.y, m && !d) c.dataLabel = m.destroy();
                            else if (d) {
                                if (g = (l = n(e, t)).style, d = l.rotation, u = c.getLabelConfig(), i = l.format ? y(l.format, u) : l.formatter.call(u, l), g.color = te(l.color, g.color, s.color, "black"), m) h(i) ? (m.attr({
                                    text: i
                                }), x = !1) : (c.dataLabel = m = m.destroy(), v && (c.connector = v.destroy()));
                                else if (h(i)) {
                                    for (f in m = {
                                            fill: l.backgroundColor,
                                            stroke: l.borderColor,
                                            "stroke-width": l.borderWidth,
                                            r: l.borderRadius || 0,
                                            rotation: d,
                                            padding: l.padding,
                                            zIndex: 1
                                        }, "contrast" === g.color && (b.color = l.inside || l.distance < 0 || o.stacking ? p.getContrast(c.color || s.color) : "#000000"), a && (b.cursor = a), m) m[f] === B && delete m[f];
                                    m = c.dataLabel = p[d ? "text" : "label"](i, 0, -9999, l.shape, null, null, l.useHTML).attr(m).css(qt(g, b)).add(r).shadow(l.shadow)
                                }
                                m && s.alignDataLabel(c, m, l, null, x)
                            }
                        })))
                    }, xe.prototype.alignDataLabel = function(t, e, i, r, n) {
                        var s = this.chart,
                            o = s.inverted,
                            a = te(t.plotX, -9999),
                            l = te(t.plotY, -9999),
                            h = e.getBBox(),
                            c = s.renderer.fontMetrics(i.style.fontSize).b,
                            d = i.rotation,
                            u = i.align,
                            p = this.visible && (t.series.forceDL || s.isInsidePlot(a, at(l), o) || r && s.isInsidePlot(a, o ? r.x + 1 : r.y + r.height - 1, o)),
                            f = "justify" === te(i.overflow, "justify");
                        p && (r = qt({
                            x: o ? s.plotWidth - l : a,
                            y: at(o ? s.plotHeight - a : l),
                            width: 0,
                            height: 0
                        }, r), qt(i, {
                            width: h.width,
                            height: h.height
                        }), d ? (f = !1, o = s.renderer.rotCorr(c, d), o = {
                            x: r.x + i.x + r.width / 2 + o.x,
                            y: r.y + i.y + {
                                top: 0,
                                middle: .5,
                                bottom: 1
                            } [i.verticalAlign] * r.height
                        }, e[n ? "attr" : "animate"](o).attr({
                            align: u
                        }), a = (a = (d + 720) % 360) > 180 && a < 360, "left" === u ? o.y -= a ? h.height : 0 : "center" === u ? (o.x -= h.width / 2, o.y -= h.height / 2) : "right" === u && (o.x -= h.width, o.y -= a ? 0 : h.height)) : (e.align(i, null, r), o = e.alignAttr), f ? this.justifyDataLabel(e, i, o, h, r, n) : te(i.crop, !0) && (p = s.isInsidePlot(o.x, o.y) && s.isInsidePlot(o.x + h.width, o.y + h.height)), i.shape && !d && e.attr({
                            anchorX: t.plotX,
                            anchorY: t.plotY
                        })), p || (Kt(e), e.attr({
                            y: -9999
                        }), e.placed = !1)
                    }, xe.prototype.justifyDataLabel = function(t, e, i, r, n, s) {
                        var o, a, l = this.chart,
                            h = e.align,
                            c = e.verticalAlign,
                            d = t.box ? 0 : t.padding || 0;
                        (o = i.x + d) < 0 && ("right" === h ? e.align = "left" : e.x = -o, a = !0), (o = i.x + r.width - d) > l.plotWidth && ("left" === h ? e.align = "right" : e.x = l.plotWidth - o, a = !0), (o = i.y + d) < 0 && ("bottom" === c ? e.verticalAlign = "top" : e.y = -o, a = !0), (o = i.y + r.height - d) > l.plotHeight && ("top" === c ? e.verticalAlign = "bottom" : e.y = l.plotHeight - o, a = !0), a && (t.placed = !s, t.align(e, null, n))
                    }, Nt.pie && (Nt.pie.prototype.drawDataLabels = function() {
                        var t, e, i, r, n, s, o, a, l, h, c, d = this,
                            u = d.data,
                            p = d.chart,
                            f = d.options.dataLabels,
                            g = te(f.connectorPadding, 10),
                            m = te(f.connectorWidth, 1),
                            v = p.plotWidth,
                            y = p.plotHeight,
                            x = te(f.softConnector, !0),
                            b = f.distance,
                            w = d.center,
                            k = w[2] / 2,
                            T = w[1],
                            S = b > 0,
                            A = [
                                [],
                                []
                            ],
                            P = [0, 0, 0, 0],
                            D = function(t, e) {
                                return e.y - t.y
                            };
                        if (d.visible && (f.enabled || d._hasPointLabels)) {
                            for (xe.prototype.drawDataLabels.apply(d), Xt(u, (function(t) {
                                    t.dataLabel && t.visible && (A[t.half].push(t), t.dataLabel._pos = null)
                                })), h = 2; h--;) {
                                var I, L = [],
                                    M = [],
                                    R = A[h],
                                    O = R.length;
                                if (O) {
                                    for (d.sortByAngle(R, h - .5), c = u = 0; !u && R[c];) u = R[c] && R[c].dataLabel && (R[c].dataLabel.getBBox().height || 21), c++;
                                    if (b > 0) {
                                        for (n = dt(T + k + b, p.plotHeight), c = ct(0, T - k - b); c <= n; c += u) L.push(c);
                                        if (O > (n = L.length)) {
                                            for ((t = [].concat(R)).sort(D), c = O; c--;) t[c].rank = c;
                                            for (c = O; c--;) R[c].rank >= n && R.splice(c, 1);
                                            O = R.length
                                        }
                                        for (c = 0; c < O; c++) {
                                            var B, E;
                                            for (t = R[c], s = t.labelPos, t = 9999, E = 0; E < n; E++)(B = ut(L[E] - s[1])) < t && (t = B, I = E);
                                            if (I < c && null !== L[c]) I = c;
                                            else
                                                for (n < O - c + I && null !== L[c] && (I = n - O + c); null === L[I];) I++;
                                            M.push({
                                                i: I,
                                                y: L[I]
                                            }), L[I] = null
                                        }
                                        M.sort(D)
                                    }
                                    for (c = 0; c < O; c++) t = R[c], s = t.labelPos, r = t.dataLabel, l = !1 === t.visible ? "hidden" : "inherit", t = s[1], b > 0 ? (I = (n = M.pop()).i, (t > (a = n.y) && null !== L[I + 1] || t < a && null !== L[I - 1]) && (a = dt(ct(0, t), p.plotHeight))) : a = t, o = f.justify ? w[0] + (h ? -1 : 1) * (k + b) : d.getX(a === T - k - b || a === T + k + b ? t : a, h), r._attr = {
                                        visibility: l,
                                        align: s[6]
                                    }, r._pos = {
                                        x: o + f.x + ({
                                            left: g,
                                            right: -g
                                        } [s[6]] || 0),
                                        y: a + f.y - 10
                                    }, r.connX = o, r.connY = a, null === this.options.size && (n = r.width, o - n < g ? P[3] = ct(at(n - o + g), P[3]) : o + n > v - g && (P[1] = ct(at(o + n - v + g), P[1])), a - u / 2 < 0 ? P[0] = ct(at(u / 2 - a), P[0]) : a + u / 2 > y && (P[2] = ct(at(a + u / 2 - y), P[2])))
                                }
                            }(0 === C(P) || this.verifyDataLabelOverflow(P)) && (this.placeDataLabels(), S && m && Xt(this.points, (function(t) {
                                e = t.connector, s = t.labelPos, (r = t.dataLabel) && r._pos && t.visible ? (l = r._attr.visibility, o = r.connX, a = r.connY, i = x ? [Bt, o + ("left" === s[6] ? 5 : -5), a, "C", o, a, 2 * s[2] - s[4], 2 * s[3] - s[5], s[2], s[3], Et, s[4], s[5]] : [Bt, o + ("left" === s[6] ? 5 : -5), a, Et, s[2], s[3], Et, s[4], s[5]], e ? (e.animate({
                                    d: i
                                }), e.attr("visibility", l)) : t.connector = e = d.chart.renderer.path(i).attr({
                                    "stroke-width": m,
                                    stroke: f.connectorColor || t.color || "#606060",
                                    visibility: l
                                }).add(d.dataLabelsGroup)) : e && (t.connector = e.destroy())
                            })))
                        }
                    }, Nt.pie.prototype.placeDataLabels = function() {
                        Xt(this.points, (function(t) {
                            var e = t.dataLabel;
                            e && t.visible && ((t = e._pos) ? (e.attr(e._attr), e[e.moved ? "animate" : "attr"](t), e.moved = !0) : e && e.attr({
                                y: -9999
                            }))
                        }))
                    }, Nt.pie.prototype.alignDataLabel = Lt, Nt.pie.prototype.verifyDataLabelOverflow = function(t) {
                        var e, i = this.center,
                            r = this.options,
                            n = r.center,
                            s = r.minSize || 80,
                            o = s;
                        return null !== n[0] ? o = ct(i[2] - ct(t[1], t[3]), s) : (o = ct(i[2] - t[1] - t[3], s), i[0] += (t[3] - t[1]) / 2), null !== n[1] ? o = ct(dt(o, i[2] - ct(t[0], t[2])), s) : (o = ct(dt(o, i[2] - t[0] - t[2]), s), i[1] += (t[0] - t[2]) / 2), o < i[2] ? (i[2] = o, i[3] = Math.min(/%$/.test(r.innerSize || 0) ? o * parseFloat(r.innerSize || 0) / 100 : parseFloat(r.innerSize || 0), o), this.translate(i), this.drawDataLabels && this.drawDataLabels()) : e = !0, e
                    }), Nt.column && (Nt.column.prototype.alignDataLabel = function(t, e, i, r, s) {
                        var o = this.chart.inverted,
                            a = t.series,
                            l = t.dlBox || t.shapeArgs,
                            h = te(t.below, t.plotY > te(this.translatedThreshold, a.yAxis.len)),
                            c = te(i.inside, !!this.options.stacking);
                        l && ((r = n(l)).y < 0 && (r.height += r.y, r.y = 0), (l = r.y + r.height - a.yAxis.len) > 0 && (r.height -= l), o && (r = {
                            x: a.yAxis.len - r.y - r.height,
                            y: a.xAxis.len - r.x - r.width,
                            width: r.height,
                            height: r.width
                        }), c || (o ? (r.x += h ? 0 : r.width, r.width = 0) : (r.y += h ? r.height : 0, r.height = 0))), i.align = te(i.align, !o || c ? "center" : h ? "right" : "left"), i.verticalAlign = te(i.verticalAlign, o || c ? "middle" : h ? "top" : "bottom"), xe.prototype.alignDataLabel.call(this, t, e, i, r, s)
                    }), ke = (we = nt).Chart, Ce = we.each, Te = we.pick, Se = we.addEvent, ke.prototype.callbacks.push((function(t) {
                        function e() {
                            var e = [];
                            Ce(t.series, (function(t) {
                                var i = t.options.dataLabels,
                                    r = t.dataLabelCollections || ["dataLabel"];
                                (i.enabled || t._hasPointLabels) && !i.allowOverlap && t.visible && Ce(r, (function(i) {
                                    Ce(t.points, (function(t) {
                                        t[i] && (t[i].labelrank = Te(t.labelrank, t.shapeArgs && t.shapeArgs.height), e.push(t[i]))
                                    }))
                                }))
                            })), t.hideOverlappingLabels(e)
                        }
                        e(), Se(t, "redraw", e)
                    })), ke.prototype.hideOverlappingLabels = function(t) {
                        var e, i, r, n, s, o, a, l, h, c = t.length;
                        for (i = 0; i < c; i++)(e = t[i]) && (e.oldOpacity = e.opacity, e.newOpacity = 1);
                        for (t.sort((function(t, e) {
                                return (e.labelrank || 0) - (t.labelrank || 0)
                            })), i = 0; i < c; i++)
                            for (r = t[i], e = i + 1; e < c; ++e) n = t[e], r && n && r.placed && n.placed && 0 !== r.newOpacity && 0 !== n.newOpacity && (s = r.alignAttr, o = n.alignAttr, a = r.parentGroup, l = n.parentGroup, h = 2 * (r.box ? 0 : r.padding), s = !(o.x + l.translateX > s.x + a.translateX + (r.width - h) || o.x + l.translateX + (n.width - h) < s.x + a.translateX || o.y + l.translateY > s.y + a.translateY + (r.height - h) || o.y + l.translateY + (n.height - h) < s.y + a.translateY)) && ((r.labelrank < n.labelrank ? r : n).newOpacity = 0);
                        Ce(t, (function(t) {
                            var e, i;
                            t && (i = t.newOpacity, t.oldOpacity !== i && t.placed && (i ? t.show(!0) : e = function() {
                                t.hide()
                            }, t.alignAttr.opacity = i, t[t.isOld ? "animate" : "attr"](t.alignAttr, null, e)), t.isOld = !0)
                        }))
                    }, re = nt.TrackerMixin = {
                        drawTrackerPoint: function() {
                            var t = this,
                                e = t.chart,
                                i = e.pointer,
                                r = t.options.cursor,
                                n = r && {
                                    cursor: r
                                },
                                s = function(t) {
                                    for (var i, r = t.target; r && !i;) i = r.point, r = r.parentNode;
                                    i !== B && i !== e.hoverPoint && i.onMouseOver(t)
                                };
                            Xt(t.points, (function(t) {
                                t.graphic && (t.graphic.element.point = t), t.dataLabel && (t.dataLabel.element.point = t)
                            })), t._hasTracking || (Xt(t.trackerGroups, (function(e) {
                                t[e] && (t[e].addClass("highcharts-tracker").on("mouseover", s).on("mouseout", (function(t) {
                                    i.onTrackerMouseOut(t)
                                })).css(n), z) && t[e].on("touchstart", s)
                            })), t._hasTracking = !0)
                        },
                        drawTrackerGraph: function() {
                            var t = this,
                                e = t.options,
                                i = e.trackByArea,
                                r = [].concat(i ? t.areaPath : t.graphPath),
                                n = r.length,
                                s = t.chart,
                                o = s.pointer,
                                a = s.renderer,
                                l = s.options.tooltip.snap,
                                h = t.tracker,
                                c = e.cursor,
                                d = c && {
                                    cursor: c
                                },
                                u = function() {
                                    s.hoverSeries !== t && t.onMouseOver()
                                },
                                p = "rgba(192,192,192," + (St ? 1e-4 : .002) + ")";
                            if (n && !i)
                                for (c = n + 1; c--;) r[c] === Bt && r.splice(c + 1, 0, r[c + 1] - l, r[c + 2], Et), (c && r[c] === Bt || c === n) && r.splice(c, 0, Et, r[c - 2] + l, r[c - 1]);
                            h ? h.attr({
                                d: r
                            }) : (t.tracker = a.path(r).attr({
                                "stroke-linejoin": "round",
                                visibility: t.visible ? "visible" : "hidden",
                                stroke: p,
                                fill: i ? p : "none",
                                "stroke-width": e.lineWidth + (i ? 0 : 2 * l),
                                zIndex: 2
                            }).add(t.group), Xt([t.tracker, t.markerGroup], (function(t) {
                                t.addClass("highcharts-tracker").on("mouseover", u).on("mouseout", (function(t) {
                                    o.onTrackerMouseOut(t)
                                })).css(d), z && t.on("touchstart", u)
                            })))
                        }
                    }, Nt.column && (be.prototype.drawTracker = re.drawTrackerPoint), Nt.pie && (Nt.pie.prototype.drawTracker = re.drawTrackerPoint), Nt.scatter && (Ae.prototype.drawTracker = re.drawTrackerPoint), qt(me.prototype, {
                        setItemEvents: function(t, e, i, r, n) {
                            var s = this;
                            (i ? e : t.legendGroup).on("mouseover", (function() {
                                t.setState("hover"), e.css(s.options.itemHoverStyle)
                            })).on("mouseout", (function() {
                                e.css(t.visible ? r : n), t.setState()
                            })).on("click", (function(e) {
                                var i = function() {
                                    t.setVisible && t.setVisible()
                                };
                                e = {
                                    browserEvent: e
                                }, t.firePointEvent ? t.firePointEvent("legendItemClick", e, i) : Vt(t, "legendItemClick", e, i)
                            }))
                        },
                        createCheckboxForItem: function(t) {
                            t.checkbox = f("input", {
                                type: "checkbox",
                                checked: t.selected,
                                defaultChecked: t.selected
                            }, this.options.itemCheckboxStyle, this.chart.container), jt(t.checkbox, "click", (function(e) {
                                Vt(t.series || t, "checkboxClick", {
                                    checked: e.target.checked,
                                    item: t
                                }, (function() {
                                    t.select()
                                }))
                            }))
                        }
                    }), N.legend.itemStyle.cursor = "pointer", qt(ve.prototype, {
                        showResetZoom: function() {
                            var t = this,
                                e = N.lang,
                                i = t.options.chart.resetZoomButton,
                                r = i.theme,
                                n = r.states,
                                s = "chart" === i.relativeTo ? null : "plotBox";
                            this.resetZoomButton = t.renderer.button(e.resetZoom, null, null, (function() {
                                t.zoomOut()
                            }), r, n && n.hover).attr({
                                align: i.position.align,
                                title: e.resetZoomTitle
                            }).add().align(i.position, !1, s)
                        },
                        zoomOut: function() {
                            var t = this;
                            Vt(t, "selection", {
                                resetSelection: !0
                            }, (function() {
                                t.zoom()
                            }))
                        },
                        zoom: function(t) {
                            var e, i, r = this.pointer,
                                n = !1;
                            !t || t.resetSelection ? Xt(this.axes, (function(t) {
                                e = t.zoom()
                            })) : Xt(t.xAxis.concat(t.yAxis), (function(t) {
                                var i = t.axis,
                                    s = i.isXAxis;
                                (r[s ? "zoomX" : "zoomY"] || r[s ? "pinchX" : "pinchY"]) && (e = i.zoom(t.min, t.max), i.displayBtn && (n = !0))
                            })), i = this.resetZoomButton, n && !i ? this.showResetZoom() : !n && Jt(i) && (this.resetZoomButton = i.destroy()), e && this.redraw(te(this.options.chart.animation, t && t.animation, this.pointCount < 100))
                        },
                        pan: function(t, e) {
                            var i, r = this,
                                n = r.hoverPoints;
                            n && Xt(n, (function(t) {
                                t.setState()
                            })), Xt("xy" === e ? [1, 0] : [1], (function(e) {
                                var n = (e = r[e ? "xAxis" : "yAxis"][0]).horiz,
                                    s = t[n ? "chartX" : "chartY"],
                                    o = r[n = n ? "mouseDownX" : "mouseDownY"],
                                    a = (e.pointRange || 0) / 2,
                                    l = e.getExtremes(),
                                    h = e.toValue(o - s, !0) + a;
                                a = e.toValue(o + e.len - s, !0) - a, o = o > s, e.series.length && (o || h > dt(l.dataMin, l.min)) && (!o || a < ct(l.dataMax, l.max)) && (e.setExtremes(h, a, !1, !1, {
                                    trigger: "pan"
                                }), i = !0), r[n] = s
                            })), i && r.redraw(!1), p(r.container, {
                                cursor: "move"
                            })
                        }
                    }), qt(ye.prototype, {
                        select: function(t, e) {
                            var i = this,
                                r = i.series,
                                n = r.chart;
                            t = te(t, !i.selected), i.firePointEvent(t ? "select" : "unselect", {
                                accumulate: e
                            }, (function() {
                                i.selected = i.options.selected = t, r.options.data[Ht(i, r.data)] = i.options, i.setState(t && "select"), e || Xt(n.getSelectedPoints(), (function(t) {
                                    t.selected && t !== i && (t.selected = t.options.selected = !1, r.options.data[Ht(t, r.data)] = t.options, t.setState(""), t.firePointEvent("unselect"))
                                }))
                            }))
                        },
                        onMouseOver: function(t, e) {
                            var i = this.series,
                                r = i.chart,
                                n = r.tooltip,
                                s = r.hoverPoint;
                            r.hoverSeries !== i && i.onMouseOver(), s && s !== this && s.onMouseOut(), this.series && (this.firePointEvent("mouseOver"), n && (!n.shared || i.noSharedTooltip) && n.refresh(this, t), this.setState("hover"), !e) && (r.hoverPoint = this)
                        },
                        onMouseOut: function() {
                            var t = this.series.chart,
                                e = t.hoverPoints;
                            this.firePointEvent("mouseOut"), e && -1 !== Ht(this, e) || (this.setState(), t.hoverPoint = null)
                        },
                        importEvents: function() {
                            if (!this.hasImportedEvents) {
                                var t, e = n(this.series.options.point, this.options).events;
                                for (t in this.events = e, e) jt(this, t, e[t]);
                                this.hasImportedEvents = !0
                            }
                        },
                        setState: function(t, e) {
                            var i, r = lt(this.plotX),
                                s = this.plotY,
                                o = this.series,
                                a = o.options.states,
                                l = ie[o.type].marker && o.options.marker,
                                h = l && !l.enabled,
                                c = l && l.states[t],
                                d = c && !1 === c.enabled,
                                u = o.stateMarkerGraphic,
                                p = this.marker || {},
                                f = o.chart,
                                g = o.halo;
                            t = t || "", i = this.pointAttr[t] || o.pointAttr[t], t === this.state && !e || this.selected && "select" !== t || a[t] && !1 === a[t].enabled || t && (d || h && !1 === c.enabled) || t && p.states && p.states[t] && !1 === p.states[t].enabled || (this.graphic ? (l = l && this.graphic.symbolName && i.r, this.graphic.attr(n(i, l ? {
                                x: r - l,
                                y: s - l,
                                width: 2 * l,
                                height: 2 * l
                            } : {})), u && u.hide()) : (t && c && (l = c.radius, p = p.symbol || o.symbol, u && u.currentSymbol !== p && (u = u.destroy()), u ? u[e ? "animate" : "attr"]({
                                x: r - l,
                                y: s - l
                            }) : p && (o.stateMarkerGraphic = u = f.renderer.symbol(p, r - l, s - l, 2 * l, 2 * l).attr(i).add(o.markerGroup), u.currentSymbol = p)), u && (u[t && f.isInsidePlot(r, s, f.inverted) ? "show" : "hide"](), u.element.point = this)), (r = a[t] && a[t].halo) && r.size ? (g || (o.halo = g = f.renderer.path().add(f.seriesGroup)), g.attr(qt({
                                fill: this.color || o.color,
                                "fill-opacity": r.opacity,
                                zIndex: -1
                            }, r.attributes))[e ? "animate" : "attr"]({
                                d: this.haloPath(r.size)
                            })) : g && g.attr({
                                d: []
                            }), this.state = t)
                        },
                        haloPath: function(t) {
                            var e = this.series,
                                i = e.chart,
                                r = e.getPlotBox(),
                                n = i.inverted,
                                s = Math.floor(this.plotX);
                            return i.renderer.symbols.circle(r.translateX + (n ? e.yAxis.len - this.plotY : s) - t, r.translateY + (n ? e.xAxis.len - s : this.plotY) - t, 2 * t, 2 * t)
                        }
                    }), qt(xe.prototype, {
                        onMouseOver: function() {
                            var t = this.chart,
                                e = t.hoverSeries;
                            e && e !== this && e.onMouseOut(), this.options.events.mouseOver && Vt(this, "mouseOver"), this.setState("hover"), t.hoverSeries = this
                        },
                        onMouseOut: function() {
                            var t = this.options,
                                e = this.chart,
                                i = e.tooltip,
                                r = e.hoverPoint;
                            e.hoverSeries = null, r && r.onMouseOut(), this && t.events.mouseOut && Vt(this, "mouseOut"), i && !t.stickyTracking && (!i.shared || this.noSharedTooltip) && i.hide(), this.setState()
                        },
                        setState: function(t) {
                            var e = this.options,
                                i = this.graph,
                                r = e.states,
                                n = e.lineWidth;
                            if (e = 0, t = t || "", this.state !== t && (this.state = t, (!r[t] || !1 !== r[t].enabled) && (t && (n = r[t].lineWidth || n + (r[t].lineWidthPlus || 0)), i && !i.dashstyle)))
                                for (t = {
                                        "stroke-width": n
                                    }, i.attr(t); this["zoneGraph" + e];) this["zoneGraph" + e].attr(t), e += 1
                        },
                        setVisible: function(t, e) {
                            var i, r = this,
                                n = r.chart,
                                s = r.legendItem,
                                o = n.options.chart.ignoreHiddenSeries,
                                a = r.visible;
                            i = (r.visible = t = r.options.visible = r.userOptions.visible = void 0 === t ? !a : t) ? "show" : "hide", Xt(["group", "dataLabelsGroup", "markerGroup", "tracker"], (function(t) {
                                r[t] && r[t][i]()
                            })), n.hoverSeries !== r && (n.hoverPoint && n.hoverPoint.series) !== r || r.onMouseOut(), s && n.legend.colorizeItem(r, t), r.isDirty = !0, r.options.stacking && Xt(n.series, (function(t) {
                                t.options.stacking && t.visible && (t.isDirty = !0)
                            })), Xt(r.linkedSeries, (function(e) {
                                e.setVisible(t, !1)
                            })), o && (n.isDirtyBox = !0), !1 !== e && n.redraw(), Vt(r, i)
                        },
                        show: function() {
                            this.setVisible(!0)
                        },
                        hide: function() {
                            this.setVisible(!1)
                        },
                        select: function(t) {
                            this.selected = t = t === B ? !this.selected : t, this.checkbox && (this.checkbox.checked = t), Vt(this, t ? "select" : "unselect")
                        },
                        drawTracker: re.drawTrackerGraph
                    }), qt(nt, {
                        Color: L,
                        Point: ye,
                        Tick: R,
                        Renderer: E,
                        SVGElement: M,
                        SVGRenderer: oe,
                        arrayMin: k,
                        arrayMax: C,
                        charts: Mt,
                        correctFloat: A,
                        dateFormat: $,
                        error: e,
                        format: y,
                        pathAnim: void 0,
                        getOptions: function() {
                            return N
                        },
                        hasBidiBug: At,
                        isTouchDevice: Ct,
                        setOptions: function(t) {
                            return N = n(!0, N, t), I(), N
                        },
                        addEvent: jt,
                        removeEvent: Ut,
                        createElement: f,
                        discardElement: S,
                        css: p,
                        each: Xt,
                        map: Yt,
                        merge: n,
                        splat: d,
                        stableSort: w,
                        extendClass: g,
                        pInt: s,
                        svg: St,
                        canvas: Pt,
                        vml: !St && !Pt,
                        product: "Highcharts",
                        version: "4.2.7"
                    }), nt
                }, "object" === r(t) && t.exports ? t.exports = n.document ? s(n) : s : n.Highcharts = s(n)
            },
            343: function(t, e, i) {
                function r(t) {
                    return r = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(t) {
                        return typeof t
                    } : function(t) {
                        return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t
                    }, r(t)
                }
                var n;
                t = i.nmd(t), n = function(t) {
                    var e, i = t.win.document,
                        n = t.each,
                        s = t.pick,
                        o = t.inArray,
                        a = t.isNumber,
                        l = t.splat,
                        h = function(t, e) {
                            this.init(t, e)
                        };
                    t.extend(h.prototype, {
                        init: function(t, e) {
                            this.options = t, this.chartOptions = e, this.columns = t.columns || this.rowsToColumns(t.rows) || [], this.firstRowAsNames = s(t.firstRowAsNames, !0), this.decimalRegex = t.decimalPoint && RegExp("^(-?[0-9]+)" + t.decimalPoint + "([0-9]+)$"), this.rawColumns = [], this.columns.length ? this.dataFound() : (this.parseCSV(), this.parseTable(), this.parseGoogleSpreadsheet())
                        },
                        getColumnDistribution: function() {
                            var i, r = this.chartOptions,
                                s = this.options,
                                o = [],
                                a = function(e) {
                                    return (t.seriesTypes[e || "line"].prototype.pointArrayMap || [0]).length
                                },
                                l = r && r.chart && r.chart.type,
                                h = [],
                                c = [],
                                d = 0;
                            n(r && r.series || [], (function(t) {
                                h.push(a(t.type || l))
                            })), n(s && s.seriesMapping || [], (function(t) {
                                o.push(t.x || 0)
                            })), 0 === o.length && o.push(0), n(s && s.seriesMapping || [], (function(n) {
                                var s, o = new e,
                                    u = h[d] || a(l),
                                    p = t.seriesTypes[((r && r.series || [])[d] || {}).type || l || "line"].prototype.pointArrayMap || ["y"];
                                for (s in o.addColumnReader(n.x, "x"), n) n.hasOwnProperty(s) && "x" !== s && o.addColumnReader(n[s], s);
                                for (i = 0; i < u; i++) o.hasReader(p[i]) || o.addColumnReader(void 0, p[i]);
                                c.push(o), d++
                            })), void 0 === (s = t.seriesTypes[l || "line"].prototype.pointArrayMap) && (s = ["y"]), this.valueCount = {
                                global: a(l),
                                xColumns: o,
                                individual: h,
                                seriesBuilders: c,
                                globalPointArrayMap: s
                            }
                        },
                        dataFound: function() {
                            this.options.switchRowsAndColumns && (this.columns = this.rowsToColumns(this.columns)), this.getColumnDistribution(), this.parseTypes(), !1 !== this.parsed() && this.complete()
                        },
                        parseCSV: function() {
                            var t, e, i = this,
                                r = this.options,
                                s = r.csv,
                                o = this.columns,
                                a = r.startRow || 0,
                                l = r.endRow || Number.MAX_VALUE,
                                h = r.startColumn || 0,
                                c = r.endColumn || Number.MAX_VALUE,
                                d = 0;
                            s && (e = s.replace(/\r\n/g, "\n").replace(/\r/g, "\n").split(r.lineDelimiter || "\n"), t = r.itemDelimiter || (-1 !== s.indexOf("\t") ? "\t" : ","), n(e, (function(e, r) {
                                var s = i.trim(e),
                                    u = 0 === s.indexOf("#");
                                r >= a && r <= l && !u && "" !== s && (s = e.split(t), n(s, (function(t, e) {
                                    e >= h && e <= c && (o[e - h] || (o[e - h] = []), o[e - h][d] = t)
                                })), d += 1)
                            })), this.dataFound())
                        },
                        parseTable: function() {
                            var t = this.options,
                                e = t.table,
                                r = this.columns,
                                s = t.startRow || 0,
                                o = t.endRow || Number.MAX_VALUE,
                                a = t.startColumn || 0,
                                l = t.endColumn || Number.MAX_VALUE;
                            e && ("string" == typeof e && (e = i.getElementById(e)), n(e.getElementsByTagName("tr"), (function(t, e) {
                                e >= s && e <= o && n(t.children, (function(t, i) {
                                    ("TD" === t.tagName || "TH" === t.tagName) && i >= a && i <= l && (r[i - a] || (r[i - a] = []), r[i - a][e - s] = t.innerHTML)
                                }))
                            })), this.dataFound())
                        },
                        parseGoogleSpreadsheet: function() {
                            var t, e, i = this,
                                r = this.options,
                                s = r.googleSpreadsheetKey,
                                o = this.columns,
                                a = r.startRow || 0,
                                l = r.endRow || Number.MAX_VALUE,
                                h = r.startColumn || 0,
                                c = r.endColumn || Number.MAX_VALUE;
                            s && jQuery.ajax({
                                dataType: "json",
                                url: "https://spreadsheets.google.com/feeds/cells/" + s + "/" + (r.googleSpreadsheetWorksheet || "od6") + "/public/values?alt=json-in-script&callback=?",
                                error: r.error,
                                success: function(r) {
                                    var s, d, u = (r = r.feed.entry).length,
                                        p = 0,
                                        f = 0;
                                    for (d = 0; d < u; d++) s = r[d], p = Math.max(p, s.gs$cell.col), f = Math.max(f, s.gs$cell.row);
                                    for (d = 0; d < p; d++) d >= h && d <= c && (o[d - h] = [], o[d - h].length = Math.min(f, l - a));
                                    for (d = 0; d < u; d++) s = r[d], t = s.gs$cell.row - 1, (e = s.gs$cell.col - 1) >= h && e <= c && t >= a && t <= l && (o[e - h][t - a] = s.content.$t);
                                    n(o, (function(t) {
                                        for (d = 0; d < t.length; d++) void 0 === t[d] && (t[d] = null)
                                    })), i.dataFound()
                                }
                            })
                        },
                        trim: function(t, e) {
                            return "string" == typeof t && (t = t.replace(/^\s+|\s+$/g, ""), e && /^[0-9\s]+$/.test(t) && (t = t.replace(/\s/g, "")), this.decimalRegex && (t = t.replace(this.decimalRegex, "$1.$2"))), t
                        },
                        parseTypes: function() {
                            for (var t = this.columns, e = t.length; e--;) this.parseColumn(t[e], e)
                        },
                        parseColumn: function(t, e) {
                            var i, r, n, s, h, c = this.rawColumns,
                                d = this.columns,
                                u = t.length,
                                p = this.firstRowAsNames,
                                f = -1 !== o(e, this.valueCount.xColumns),
                                g = [],
                                m = this.chartOptions,
                                v = (this.options.columnTypes || [])[e];
                            for (m = f && (m && m.xAxis && "category" === l(m.xAxis)[0].type || "string" === v), c[e] || (c[e] = []); u--;) i = g[u] || t[u], n = this.trim(i), s = this.trim(i, !0), r = parseFloat(s), void 0 === c[e][u] && (c[e][u] = n), m || 0 === u && p ? t[u] = n : +s === r ? (t[u] = r, r > 31536e6 && "float" !== v ? t.isDatetime = !0 : t.isNumeric = !0, void 0 !== t[u + 1] && (h = r > t[u + 1])) : (r = this.parseDate(i), f && a(r) && "float" !== v ? (g[u] = i, t[u] = r, t.isDatetime = !0, void 0 !== t[u + 1] && ((i = r > t[u + 1]) !== h && void 0 !== h && (this.alternativeFormat ? (this.dateFormat = this.alternativeFormat, u = t.length, this.alternativeFormat = this.dateFormats[this.dateFormat].alternative) : t.unsorted = !0), h = i)) : (t[u] = "" === n ? null : n, 0 !== u && (t.isDatetime || t.isNumeric) && (t.mixed = !0)));
                            if (f && t.mixed && (d[e] = c[e]), f && h && this.options.sort)
                                for (e = 0; e < d.length; e++) d[e].reverse(), p && d[e].unshift(d[e].pop())
                        },
                        dateFormats: {
                            "YYYY-mm-dd": {
                                regex: /^([0-9]{4})[\-\/\.]([0-9]{2})[\-\/\.]([0-9]{2})$/,
                                parser: function(t) {
                                    return Date.UTC(+t[1], t[2] - 1, +t[3])
                                }
                            },
                            "dd/mm/YYYY": {
                                regex: /^([0-9]{1,2})[\-\/\.]([0-9]{1,2})[\-\/\.]([0-9]{4})$/,
                                parser: function(t) {
                                    return Date.UTC(+t[3], t[2] - 1, +t[1])
                                },
                                alternative: "mm/dd/YYYY"
                            },
                            "mm/dd/YYYY": {
                                regex: /^([0-9]{1,2})[\-\/\.]([0-9]{1,2})[\-\/\.]([0-9]{4})$/,
                                parser: function(t) {
                                    return Date.UTC(+t[3], t[1] - 1, +t[2])
                                }
                            },
                            "dd/mm/YY": {
                                regex: /^([0-9]{1,2})[\-\/\.]([0-9]{1,2})[\-\/\.]([0-9]{2})$/,
                                parser: function(t) {
                                    return Date.UTC(+t[3] + 2e3, t[2] - 1, +t[1])
                                },
                                alternative: "mm/dd/YY"
                            },
                            "mm/dd/YY": {
                                regex: /^([0-9]{1,2})[\-\/\.]([0-9]{1,2})[\-\/\.]([0-9]{2})$/,
                                parser: function(t) {
                                    return Date.UTC(+t[3] + 2e3, t[1] - 1, +t[2])
                                }
                            }
                        },
                        parseDate: function(t) {
                            var e, i, n, s = this.options.parseDate,
                                o = this.options.dateFormat || this.dateFormat;
                            if (s) e = s(t);
                            else if ("string" == typeof t) {
                                if (o) s = this.dateFormats[o], (n = t.match(s.regex)) && (e = s.parser(n));
                                else
                                    for (i in this.dateFormats)
                                        if (s = this.dateFormats[i], n = t.match(s.regex)) {
                                            this.dateFormat = i, this.alternativeFormat = s.alternative, e = s.parser(n);
                                            break
                                        } n || ("object" === r(n = Date.parse(t)) && null !== n && n.getTime ? e = n.getTime() - 6e4 * n.getTimezoneOffset() : a(n) && (e = n - 6e4 * new Date(n).getTimezoneOffset()))
                            }
                            return e
                        },
                        rowsToColumns: function(t) {
                            var e, i, r, n, s;
                            if (t)
                                for (s = [], i = t.length, e = 0; e < i; e++)
                                    for (n = t[e].length, r = 0; r < n; r++) s[r] || (s[r] = []), s[r][e] = t[e][r];
                            return s
                        },
                        parsed: function() {
                            if (this.options.parsed) return this.options.parsed.call(this, this.columns)
                        },
                        getFreeIndexes: function(t, e) {
                            var i, r, n, s = [],
                                o = [];
                            for (r = 0; r < t; r += 1) s.push(!0);
                            for (i = 0; i < e.length; i += 1)
                                for (n = e[i].getReferencedColumnIndexes(), r = 0; r < n.length; r += 1) s[n[r]] = !1;
                            for (r = 0; r < s.length; r += 1) s[r] && o.push(r);
                            return o
                        },
                        complete: function() {
                            var t, i, r, n, s, a, l = this.columns,
                                h = this.options,
                                c = [];
                            if (h.complete || h.afterComplete) {
                                for (n = 0; n < l.length; n++) this.firstRowAsNames && (l[n].name = l[n].shift());
                                for (i = [], r = this.getFreeIndexes(l.length, this.valueCount.seriesBuilders), n = 0; n < this.valueCount.seriesBuilders.length; n++)(a = this.valueCount.seriesBuilders[n]).populateColumns(r) && c.push(a);
                                for (; r.length > 0;) {
                                    for ((a = new e).addColumnReader(0, "x"), -1 !== (n = o(0, r)) && r.splice(n, 1), n = 0; n < this.valueCount.global; n++) a.addColumnReader(void 0, this.valueCount.globalPointArrayMap[n]);
                                    a.populateColumns(r) && c.push(a)
                                }
                                if (c.length > 0 && c[0].readers.length > 0 && void 0 !== (a = l[c[0].readers[0].columnIndex]) && (a.isDatetime ? t = "datetime" : a.isNumeric || (t = "category")), "category" === t)
                                    for (n = 0; n < c.length; n++)
                                        for (a = c[n], r = 0; r < a.readers.length; r++) "x" === a.readers[r].configName && (a.readers[r].configName = "name");
                                for (n = 0; n < c.length; n++) {
                                    for (a = c[n], r = [], s = 0; s < l[0].length; s++) r[s] = a.read(l, s);
                                    i[n] = {
                                        data: r
                                    }, a.name && (i[n].name = a.name), "category" === t && (i[n].turboThreshold = 0)
                                }
                                l = {
                                    series: i
                                }, t && (l.xAxis = {
                                    type: t
                                }, "category" === t) && (l.xAxis.nameToX = !1), h.complete && h.complete(l), h.afterComplete && h.afterComplete(l)
                            }
                        }
                    }), t.Data = h, t.data = function(t, e) {
                        return new h(t, e)
                    }, t.wrap(t.Chart.prototype, "init", (function(e, i, n) {
                        var s = this;
                        i && i.data ? t.data(t.extend(i.data, {
                            afterComplete: function(o) {
                                var a, l;
                                if (i.hasOwnProperty("series"))
                                    if ("object" === r(i.series))
                                        for (a = Math.max(i.series.length, o.series.length); a--;) l = i.series[a] || {}, i.series[a] = t.merge(l, o.series[a]);
                                    else delete i.series;
                                i = t.merge(o, i), e.call(s, i, n)
                            }
                        }), i) : e.call(s, i, n)
                    })), (e = function() {
                        this.readers = [], this.pointIsArray = !0
                    }).prototype.populateColumns = function(t) {
                        var e = !0;
                        return n(this.readers, (function(e) {
                            void 0 === e.columnIndex && (e.columnIndex = t.shift())
                        })), n(this.readers, (function(t) {
                            void 0 === t.columnIndex && (e = !1)
                        })), e
                    }, e.prototype.read = function(t, e) {
                        var i, r = this.pointIsArray,
                            s = r ? [] : {};
                        return n(this.readers, (function(i) {
                            var n = t[i.columnIndex][e];
                            r ? s.push(n) : s[i.configName] = n
                        })), void 0 === this.name && this.readers.length >= 2 && (i = this.getReferencedColumnIndexes()).length >= 2 && (i.shift(), i.sort(), this.name = t[i.shift()].name), s
                    }, e.prototype.addColumnReader = function(t, e) {
                        this.readers.push({
                            columnIndex: t,
                            configName: e
                        }), "x" !== e && "y" !== e && void 0 !== e && (this.pointIsArray = !1)
                    }, e.prototype.getReferencedColumnIndexes = function() {
                        var t, e, i = [];
                        for (t = 0; t < this.readers.length; t += 1) void 0 !== (e = this.readers[t]).columnIndex && i.push(e.columnIndex);
                        return i
                    }, e.prototype.hasReader = function(t) {
                        var e;
                        for (e = 0; e < this.readers.length; e += 1)
                            if (this.readers[e].configName === t) return !0
                    }
                }, "object" === r(t) && t.exports ? t.exports = n : n(Highcharts)
            },
            7525: function(t) {
                function e(t) {
                    return t.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                }

                function i(t) {
                    return t.split("/").pop().replace(".html", "")
                }
                var r = {
                    importFilesUnderPath: function(t) {
                        t.keys().forEach(t)
                    },
                    templateCacheGenerator: function(t, r, n, s) {
                        return t.module(r, []).run(["$templateCache", function(t) {
                            n && n.keys().forEach((function(r) {
                                var s = e(i(r));
                                t.put(s, n(r))
                            })), s && s.keys().forEach((function(r) {
                                var n = e(i(r));
                                t.put(n, s(r).replace(/<\/?script[^>]*>/gi, ""))
                            }))
                        }])
                    }
                };
                t.exports = r
            },
            6502: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = {
                    templateUrl: "asset-resale-data-pane",
                    bindings: {
                        resaleData: "<",
                        isLimited2: "<"
                    },
                    controller: "assetResaleDataPaneController"
                };
                i(2367).A.component("assetResaleDataPane", r), e.default = r
            },
            4430: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = {
                    templateUrl: "asset-resale-pane",
                    bindings: {
                        assetId: "<",
                        isBundle: "<"
                    },
                    controller: "assetResalePaneController"
                };
                i(2367).A.component("assetResalePane", r), e.default = r
            },
            6164: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = {
                    templateUrl: "line-chart",
                    bindings: {
                        chartDataPoints: "<",
                        days: "<"
                    },
                    controller: "lineChartController"
                };
                i(2367).A.component("lineChart", r), e.default = r
            },
            7751: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = {
                    templateUrl: "resellers-list",
                    bindings: {
                        resaleData: "<",
                        assetData: "<",
                        resaleRecords: "<",
                        resellerTradePermissions: "<",
                        showResellerTradeButton: "<",
                        isLimited2: "<",
                        itemType: "<"
                    },
                    controller: "resellersListController"
                };
                i(2367).A.component("resellersList", r), e.default = r
            },
            6421: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = {
                    templateUrl: "resellers-pane",
                    bindings: {
                        resaleData: "<",
                        assetData: "<",
                        economyMetadata: "<",
                        isLimited2: "<",
                        resaleRestriction: "<",
                        itemType: "<"
                    },
                    controller: "resellersPaneController"
                };
                i(2367).A.component("resellersPane", r), e.default = r
            },
            6953: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = {
                    templateUrl: "vertical-bar-chart",
                    bindings: {
                        chartDataPoints: "<",
                        days: "<"
                    },
                    controller: "verticalBarChartController"
                };
                i(2367).A.component("verticalBarChart", r), e.default = r
            },
            3698: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = i(7577),
                    n = r.EnvironmentUrls.apiGatewayUrl,
                    s = {
                        getExperimentationValues: function(t, e, i) {
                            return {
                                url: "".concat(n, "/product-experimentation-platform/v1/projects/").concat(t, "/layers/").concat(e, "/values?parameters=").concat(i.join(",")),
                                withCredentials: !0
                            }
                        }
                    };
                e.default = {
                    url: s,
                    parameterNames: {
                        showResellerTradeButton: ["showResellerTradeButton"]
                    },
                    layerNames: {
                        itemDetailsPage: "AvatarMarketplace.UI"
                    },
                    defaultProjectId: 1,
                    localStorageNames: {
                        showResellerTradeButton: "Roblox.AvatarMarketplace.showResellerTradeButton"
                    }
                }
            },
            5268: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = i(7577),
                    n = i(2367),
                    s = {
                        urls: {
                            getResellers: "".concat(r.EnvironmentUrls.economyApi, "/v1/assets/{assetId}/resellers"),
                            getResaleData: "".concat(r.EnvironmentUrls.economyApi, "/v1/assets/{assetId}/resale-data"),
                            setResalePrice: "".concat(r.EnvironmentUrls.economyApi, "/v1/assets/{assetId}/resellable-copies/{userAssetId}"),
                            getOwnedResaleCopies: "".concat(r.EnvironmentUrls.economyApi, "/v1/assets/{assetId}/users/{userId}/resale-copies"),
                            getCanTradeWith: "".concat(r.EnvironmentUrls.tradesApi, "/v1/users/{userId}/can-trade-with"),
                            postItemDetails: "".concat(r.EnvironmentUrls.catalogApi, "/v1/catalog/items/details"),
                            postMarketplaceItemDetails: "".concat(r.EnvironmentUrls.apiGatewayUrl, "/marketplace-items/v1/items/details"),
                            getResellersForLimited2Item: "".concat(r.EnvironmentUrls.apiGatewayUrl, "/marketplace-sales/v1/item/{collectibleItemId}/resellers"),
                            placeLimited2ItemOnSale: "".concat(r.EnvironmentUrls.apiGatewayUrl, "/marketplace-sales/v1/item/{collectibleItemId}/instance/{collectibleInstanceId}/resale"),
                            getResaleDataForLimited2Item: "".concat(r.EnvironmentUrls.apiGatewayUrl, "/marketplace-sales/v1/item/{collectibleItemId}/resale-data")
                        },
                        fetchTradePermissionsBatchSize: 5,
                        resaleChartDayOptions: [30, 90, 180],
                        errorBannerTimeout: 5e3,
                        translationKeys: {
                            notAvailable: "Label.NotAvailable",
                            putForSaleFailure: "Message.PutForSaleFailure",
                            takeOffSaleFailure: "Message.TakeOffSaleFailure"
                        },
                        eventStream: {
                            context: {
                                resellersList: "resellersList"
                            },
                            name: {
                                buyBtn: "buyBtn",
                                tradeBtn: "tradeBtn",
                                upgradeBtn: "upgradeBtn",
                                nonPremiumTradeBtn: "nonPremiumTradeBtn"
                            }
                        },
                        highCharts: {
                            marginLeft: 50,
                            lineChartHeight: 130,
                            verticalBarChartHeight: 50,
                            itemDelimiter: ",",
                            lineDelimiter: "|",
                            colors: {
                                backgroundColor: "transparent",
                                lineColor: "#02b757",
                                verticalBarColor: "#b8b8b8",
                                borderColor: "#757575",
                                pointColor: "#fff"
                            }
                        },
                        resellersTabs: {
                            priceChart: "priceChart",
                            resellers: "resellers",
                            inventory: "inventory"
                        },
                        errorCodes: {
                            internal: {
                                unknown: 0
                            },
                            economyApi: {
                                priceTooLow: 6,
                                priceTooHigh: 7,
                                unowned: 8
                            }
                        }
                    };
                s.highCharts.defaultConfiguration = {
                    chart: {
                        backgroundColor: s.highCharts.colors.backgroundColor,
                        marginLeft: s.highCharts.marginLeft
                    },
                    title: {
                        text: ""
                    },
                    legend: {
                        enabled: !1
                    },
                    tooltip: {
                        backgroundColor: s.highCharts.colors.borderColor,
                        borderColor: s.highCharts.colors.borderColor,
                        pointFormat: '<span style="color:'.concat(s.highCharts.colors.pointColor, '">{point.y}</span>'),
                        headerFormat: ""
                    },
                    xAxis: {
                        type: "datetime",
                        max: (new Date).getTime(),
                        tickLength: 0
                    },
                    credits: {
                        enabled: !1
                    }
                }, n.A.constant("resellersConstants", s), e.default = s
            },
            1914: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = i(1260),
                    n = i(2367);

                function s(t, e) {
                    var i = this;
                    i.formatNumber = function(i) {
                        return i > 0 ? r.numberFormat.getNumberFormat(i) : e.get(t.translationKeys.notAvailable)
                    }, i.formatNumberIncludeZero = function(i) {
                        return null == i ? e.get(t.translationKeys.notAvailable) : i >= 0 ? r.numberFormat.getNumberFormat(i) : e.get(t.translationKeys.notAvailable)
                    }, i.setSelectedResaleChartDays = function(t) {
                        i.selectedResaleChartDays = t
                    }, i.showResellerChart = function() {
                        return i.isLimited2 ? i.resaleData.priceDataPoints.length > 0 || i.resaleData.volumeDataPoints.length > 0 || i.resaleData.recentAveragePrice >= 0 || i.resaleData.originalPrice >= 0 || i.resaleData.sales >= 0 : i.resaleData.recentAveragePrice > 0
                    };
                    i.$onInit = function() {
                        i.chartDataAvailable = i.resaleData.priceDataPoints.length > 0 && i.resaleData.volumeDataPoints.length > 0, i.historicalDataAvailable = i.showResellerChart(), i.resaleChartDayOptions = t.resaleChartDayOptions, i.selectedResaleChartDays = t.resaleChartDayOptions[t.resaleChartDayOptions.length - 1]
                    }
                }
                s.$inject = ["resellersConstants", "languageResource"], n.A.controller("assetResaleDataPaneController", s), e.default = s
            },
            3238: function(t, e, i) {
                "use strict";
                i.r(e), i.d(e, {
                    default: function() {
                        return l
                    }
                });
                var r = i(127),
                    n = i.n(r),
                    s = (PropTypes, i(7577)),
                    o = i(2367);

                function a(t, e, i) {
                    var r = this;
                    r.loadItemDetails = function() {
                        s.ItemDetailsHydrationService.getItemDetails([{
                            id: r.assetId,
                            itemType: r.itemType
                        }], void 0, !0).then((function(t) {
                            if (function(t) {
                                    return t.itemRestrictions.indexOf("Collectible") > -1 || t.itemRestrictions.indexOf("Limited") > -1 || t.itemRestrictions.indexOf("LimitedUnique") > -1
                                }(t[0])) {
                                r.resellableItem = !0;
                                var i = t[0];
                                r.itemDetails = i, t[0].collectibleItemId && (r.resaleRestriction = t[0].collectibleItemDetails.resaleRestriction, r.isLimited2 = !0, r.collectibleItemId = t[0].collectibleItemId, r.selectTab(e.resellersTabs.inventory)), r.loadResaleData()
                            } else r.resellableItem = !1
                        })).catch((function() {
                            r.resaleDataLoadFailure = !0, r.loadingResaleData = !1
                        }))
                    }, r.loadResaleData = function() {
                        r.loadingResaleData || (r.loadingResaleData = !0, r.resaleDataLoadFailure = !1, r.isLimited2 ? s.ItemDetailsHydrationService.getItemDetails([{
                            id: r.assetId,
                            itemType: r.itemType
                        }], void 0, !0).then((function(e) {
                            var i = e[0].collectibleItemDetails,
                                n = {
                                    assetStock: i.assetStock,
                                    assetType: s.AvatarAccoutrementService.getAssetTypeNameById(r.itemDetails.assetType),
                                    collectibleItemId: r.collectibleItemId,
                                    sales: i.sales,
                                    originalPrice: i.price
                                };
                            t.getLimited2AssetResaleData(r.collectibleItemId).then((function(t) {
                                r.resaleData = n, r.resaleData.priceDataPoints = t.priceDataPoints, r.resaleData.volumeDataPoints = t.volumeDataPoints, r.resaleData.recentAveragePrice = t.recentAveragePrice, r.loadingResaleData = !1
                            })).catch((function() {
                                r.resaleData = n, r.loadingResaleData = !1
                            }))
                        })).catch((function() {
                            r.resaleData = void 0, r.resaleDataLoadFailure = !0, r.loadingResaleData = !1
                        })) : t.getAssetResaleData(r.assetId).then((function(t) {
                            r.resaleData = t, r.loadingResaleData = !1
                        })).catch((function() {
                            r.resaleData = void 0, r.resaleDataLoadFailure = !0, r.loadingResaleData = !1
                        })))
                    }, r.getTabActiveClasses = function(t) {
                        return {
                            active: t === r.selectedTab
                        }
                    }, r.selectTab = function(t) {
                        r.selectedTab = t
                    };
                    r.$onInit = function() {
                        r.authenticatedUser = s.CurrentUser.isAuthenticated ? {
                            id: Number(s.CurrentUser.userId)
                        } : null, i((function() {
                            var t = n().element("#item-container");
                            document.getElementById("asset-resale-data-container") && (t = n().element("#asset-resale-data-container")), r.assetData = {
                                id: r.assetId,
                                name: t.data("item-name"),
                                type: t.data("asset-type"),
                                productId: t.data("product-id"),
                                membershipRequirement: t.data("bc-requirement")
                            }, r.economyMetadata = {
                                purchasingEnabled: t.data("is-purchase-enabled")
                            }, void 0 === r.isBundle && (r.isBundle = !1), r.itemType = !0 === r.isBundle ? "bundle" : "asset", r.resellersTabs = e.resellersTabs, r.selectTab(e.resellersTabs.priceChart), r.loadItemDetails()
                        }), 0)
                    }
                }
                a.$inject = ["resaleService", "resellersConstants", "$timeout"], o.A.controller("assetResalePaneController", a);
                var l = a
            },
            6816: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = i(127),
                    n = i.n(r),
                    s = i(1260),
                    o = i(2367);

                function a(t, e) {
                    var i = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(t);
                        e && (r = r.filter((function(e) {
                            return Object.getOwnPropertyDescriptor(t, e).enumerable
                        }))), i.push.apply(i, r)
                    }
                    return i
                }

                function l(t, e, i) {
                    return e in t ? Object.defineProperty(t, e, {
                        value: i,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : t[e] = i, t
                }

                function h(t, e, i) {
                    var r = this,
                        o = function() {
                            var i = function(t) {
                                for (var e = 1; e < arguments.length; e++) {
                                    var i = null != arguments[e] ? arguments[e] : {};
                                    e % 2 ? a(Object(i), !0).forEach((function(e) {
                                        l(t, e, i[e])
                                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : a(Object(i)).forEach((function(e) {
                                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(i, e))
                                    }))
                                }
                                return t
                            }({}, t.highCharts.defaultConfiguration);
                            i.colors = [t.highCharts.colors.lineColor], i.chart.height = t.highCharts.lineChartHeight, i.data = e.toHighChartsData(r.chartDataPoints), i.xAxis.min = e.getDateMinusDays(r.days), i.xAxis.labels = {
                                format: "{value:%m/%d}"
                            }, i.yAxis = {
                                title: {
                                    text: ""
                                },
                                labels: {
                                    formatter: function() {
                                        return s.abbreviateNumber.getAbbreviatedValue(this.value, void 0, 1e3)
                                    }
                                }
                            };
                            var o = n().element("#".concat(r.lineChartId));
                            o.highcharts(i), r.highcharts = o.highcharts()
                        };
                    r.$onInit = function() {
                        var t = (new Date).getTime();
                        r.lineChartId = "line_chart_".concat(t), i(o)
                    }, r.$onChanges = function() {
                        r.highcharts && r.highcharts.xAxis[0].update({
                            min: e.getDateMinusDays(r.days)
                        })
                    }
                }
                h.$inject = ["resellersConstants", "highchartsService", "$timeout"], o.A.controller("lineChartController", h), e.default = h
            },
            4242: function(t, e, i) {
                "use strict";
                i.r(e), i.d(e, {
                    default: function() {
                        return d
                    }
                });
                var r = i(7577),
                    n = i(5426),
                    s = HeaderScripts,
                    o = i(1260),
                    a = i(2367);

                function l(t, e) {
                    var i;
                    if ("undefined" == typeof Symbol || null == t[Symbol.iterator]) {
                        if (Array.isArray(t) || (i = function(t, e) {
                                if (!t) return;
                                if ("string" == typeof t) return h(t, e);
                                var i = Object.prototype.toString.call(t).slice(8, -1);
                                "Object" === i && t.constructor && (i = t.constructor.name);
                                if ("Map" === i || "Set" === i) return Array.from(t);
                                if ("Arguments" === i || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(i)) return h(t, e)
                            }(t)) || e && t && "number" == typeof t.length) {
                            i && (t = i);
                            var r = 0,
                                n = function() {};
                            return {
                                s: n,
                                n: function() {
                                    return r >= t.length ? {
                                        done: !0
                                    } : {
                                        done: !1,
                                        value: t[r++]
                                    }
                                },
                                e: function(t) {
                                    throw t
                                },
                                f: n
                            }
                        }
                        throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }
                    var s, o = !0,
                        a = !1;
                    return {
                        s: function() {
                            i = t[Symbol.iterator]()
                        },
                        n: function() {
                            var t = i.next();
                            return o = t.done, t
                        },
                        e: function(t) {
                            a = !0, s = t
                        },
                        f: function() {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (a) throw s
                            }
                        }
                    }
                }

                function h(t, e) {
                    (null == e || e > t.length) && (e = t.length);
                    for (var i = 0, r = new Array(e); i < e; i++) r[i] = t[i];
                    return r
                }

                function c(t, e, i, a, h, c) {
                    var d = this;
                    d.formatNumber = function(i) {
                        return i > 0 ? o.numberFormat.getNumberFormat(i) : e.get(t.translationKeys.notAvailable)
                    }, d.takeOffSale = function(i) {
                        d.isLimited2 ? (d.takeOffSaleDebounce[i.collectibleProductId] = !0, a.patchRemoveLimited2ItemFromSale(d.resaleData.collectibleItemId, i, s.authenticatedUser.id).then((function() {
                            delete d.takeOffSaleDebounce[i.collectibleProductId];
                            var t = d.resaleRecords.indexOf(i);
                            d.resaleRecords.splice(t, 1)
                        })).catch((function() {
                            delete d.takeOffSaleDebounce[i.collectibleProductId], h.warning(e.get(t.translationKeys.takeOffSaleFailure), 0, t.errorBannerTimeout)
                        }))) : (d.takeOffSaleDebounce[i.userAssetId] = !0, a.takeOffSale(d.assetData.id, i.userAssetId).then((function() {
                            delete d.takeOffSaleDebounce[i.userAssetId];
                            var t = d.resaleRecords.indexOf(i);
                            d.resaleRecords.splice(t, 1)
                        })).catch((function() {
                            delete d.takeOffSaleDebounce[i.userAssetId], h.warning(e.get(t.translationKeys.takeOffSaleFailure), 0, t.errorBannerTimeout)
                        })))
                    }, d.purchaseLimited1Item = function(t) {
                        window.dispatchEvent(new CustomEvent("angular-to-react-purchase-event", {
                            detail: {
                                identifier: "limited-reseller-list",
                                name: d.assetData.name,
                                itemType: d.itemType,
                                assetId: d.assetData.id,
                                productId: d.assetData.productId,
                                assetType: d.assetData.type,
                                expectedCurrency: 1,
                                expectedPrice: t.price,
                                expectedPurchaserId: s.authenticatedUser.id,
                                expectedPurchaserType: "User",
                                expectedSellerId: d.getSellerId(t),
                                expectedSellerName: t.seller.name,
                                userAssetId: t.userAssetId,
                                refreshPage: !0,
                                resalePurchase: !0
                            }
                        })), d.onResellerBuyBtnClick(t)
                    }, d.purchaseLimited2Item = function(t) {
                        var e = o.uuidService.generateRandomUuid();
                        window.dispatchEvent(new CustomEvent("angular-to-react-purchase-event", {
                            detail: {
                                identifier: "limited-reseller-list",
                                name: d.assetData.name,
                                itemType: d.itemType,
                                assetId: d.assetData.id,
                                productId: d.productId,
                                assetType: d.resaleData.assetType,
                                collectibleItemId: d.resaleData.collectibleItemId,
                                collectibleItemInstanceId: t.collectibleItemInstanceId,
                                collectibleProductId: t.collectibleProductId,
                                expectedCurrency: 1,
                                expectedPrice: t.price,
                                expectedPurchaserId: s.authenticatedUser.id,
                                expectedPurchaserType: "User",
                                expectedSellerId: t.seller.sellerId,
                                expectedSellerName: t.seller.name,
                                expectedSellerType: t.seller.sellerType,
                                idempotencyKey: e,
                                refreshPage: !0,
                                resalePurchase: !0
                            }
                        }))
                    }, d.isFetchingTradePermissions = function(t) {
                        var e, i, r;
                        return null === (e = null === (i = d.resellerTradePermissions) || void 0 === i || null === (r = i[t]) || void 0 === r ? void 0 : r.isFetching) || void 0 === e || e
                    }, d.getSellerId = function(t) {
                        return t.seller.id ? t.seller.id : t.seller.sellerId
                    }, d.canTradeWith = function(t) {
                        var e, i;
                        return !d.isFetchingTradePermissions(t) && ((null === (e = d.resellerTradePermissions) || void 0 === e || null === (i = e[t]) || void 0 === i ? void 0 : i.canTrade) || !1)
                    }, d.logResellerBtnClickEvent = function(e, i) {
                        var r = [
                            ["assetId", d.assetData.id],
                            ["sellerAssetId", e.userAssetId],
                            ["sellerUserId", e.seller.id],
                            ["sellerAssetPrice", e.price],
                            ["btn", i]
                        ].filter((function(t) {
                            return void 0 !== t[1] && null !== t[1]
                        }));
                        r.length && n.eventStreamService.sendEventWithTarget(n.eventStreamService.eventTypes.buttonClick, t.eventStream.context.resellersList, Object.fromEntries(r))
                    }, d.onResellerBuyBtnClick = function(e) {
                        d.logResellerBtnClickEvent(e, t.eventStream.name.buyBtn)
                    }, d.onResellerTradeBtnClick = function(e) {
                        d.logResellerBtnClickEvent(e, t.eventStream.name.tradeBtn)
                    }, d.onUpgradeToPremiumClick = function(e) {
                        d.logResellerBtnClickEvent(e, t.eventStream.name.upgradeBtn)
                    }, d.onNonPremiumTradeBtnClick = function(e) {
                        d.activeUpgradeTradeBtnId === e.userAssetId ? d.activeUpgradeTradeBtnId = null : (d.activeUpgradeTradeBtnId = e.userAssetId, d.logResellerBtnClickEvent(e, t.eventStream.name.nonPremiumTradeBtn))
                    }, d.getUpgradeToPremiumURL = function() {
                        return r.Endpoints.getAbsoluteUrl("/premium/membership?ctx=trade#premium-memberships")
                    }, d.getUserTradeUrl = function(t, e) {
                        return r.Endpoints.getAbsoluteUrl("/users/".concat(t, "/trade?ritems=").concat(e))
                    }, d.getProfilePageUrl = function(t) {
                        return r.Endpoints.getAbsoluteUrl("/users/".concat(t, "/profile"))
                    }, d.addTradeWindowClickListener = function() {
                        window.addEventListener("click", (function(t) {
                            if (d.activeUpgradeTradeBtnId) {
                                var e, i, r = !1,
                                    n = l(document.querySelectorAll(".trade-button-container"));
                                try {
                                    for (n.s(); !(e = n.n()).done;) {
                                        e.value.contains(t.target) && (r = !0)
                                    }
                                } catch (t) {
                                    n.e(t)
                                } finally {
                                    n.f()
                                }
                                if (!r) d.activeUpgradeTradeBtnId = null, null == c || null === (i = c.$apply) || void 0 === i || i.call(c)
                            }
                        }), !0)
                    }, d.showVerifiedBadge = function(t) {
                        return t && t.hasVerifiedBadge
                    };
                    d.$onInit = function() {
                        d.isPremiumUser = r.CurrentUser.isPremiumUser, d.takeOffSaleDebounce = {}, d.thumbnailTypes = i.thumbnailTypes, d.authenticatedUser = {
                            id: Number(r.CurrentUser.userId)
                        }, d.addTradeWindowClickListener()
                    }
                }
                c.$inject = ["resellersConstants", "languageResource", "thumbnailConstants", "resaleService", "systemFeedbackService", "$scope"], a.A.controller("resellersListController", c);
                var d = c
            },
            4892: function(t, e, i) {
                "use strict";
                i.r(e), i.d(e, {
                    default: function() {
                        return d
                    }
                });
                var r = RobloxBadges,
                    n = i(2367);

                function s(t, e) {
                    var i = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(t);
                        e && (r = r.filter((function(e) {
                            return Object.getOwnPropertyDescriptor(t, e).enumerable
                        }))), i.push.apply(i, r)
                    }
                    return i
                }

                function o(t) {
                    for (var e = 1; e < arguments.length; e++) {
                        var i = null != arguments[e] ? arguments[e] : {};
                        e % 2 ? s(Object(i), !0).forEach((function(e) {
                            a(t, e, i[e])
                        })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : s(Object(i)).forEach((function(e) {
                            Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(i, e))
                        }))
                    }
                    return t
                }

                function a(t, e, i) {
                    return e in t ? Object.defineProperty(t, e, {
                        value: i,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : t[e] = i, t
                }

                function l(t, e, i, r, n, s, o) {
                    try {
                        var a = t[s](o),
                            l = a.value
                    } catch (t) {
                        return void i(t)
                    }
                    a.done ? e(l) : Promise.resolve(l).then(r, n)
                }

                function h(t) {
                    return function() {
                        var e = this,
                            i = arguments;
                        return new Promise((function(r, n) {
                            var s = t.apply(e, i);

                            function o(t) {
                                l(s, r, n, o, a, "next", t)
                            }

                            function a(t) {
                                l(s, r, n, o, a, "throw", t)
                            }
                            o(void 0)
                        }))
                    }
                }

                function c(t, e, i, n, s, a, l) {
                    var c = this;
                    c.showResellerTradeButton = !1;
                    var d = function() {
                            var t = h(regeneratorRuntime.mark((function t(i) {
                                var r;
                                return regeneratorRuntime.wrap((function(t) {
                                    for (;;) switch (t.prev = t.next) {
                                        case 0:
                                            return t.prev = 0, t.next = 3, e.getCanTradeWith(i);
                                        case 3:
                                            return r = t.sent, t.abrupt("return", {
                                                sellerId: i,
                                                permissions: r
                                            });
                                        case 7:
                                            return t.prev = 7, t.t0 = t.catch(0), t.abrupt("return", {
                                                sellerId: i,
                                                error: t.t0
                                            });
                                        case 10:
                                        case "end":
                                            return t.stop()
                                    }
                                }), t, null, [
                                    [0, 7]
                                ])
                            })));
                            return function(e) {
                                return t.apply(this, arguments)
                            }
                        }(),
                        u = function() {
                            var e = h(regeneratorRuntime.mark((function e() {
                                var i, r, n, s, a, l = arguments;
                                return regeneratorRuntime.wrap((function(e) {
                                    for (;;) switch (e.prev = e.next) {
                                        case 0:
                                            if (null != (i = l.length > 0 && void 0 !== l[0] ? l[0] : []) && i.length) {
                                                e.next = 3;
                                                break
                                            }
                                            return e.abrupt("return");
                                        case 3:
                                            return r = t.fetchTradePermissionsBatchSize, n = i.slice(0, r), e.next = 7, Promise.all(n.map(d));
                                        case 7:
                                            return s = e.sent, a = {}, s.forEach((function(t) {
                                                var e = t.sellerId,
                                                    i = t.permissions,
                                                    r = t.error;
                                                a[e] = {
                                                    isFetching: !1,
                                                    canTrade: !(null == i || !i.canTrade),
                                                    error: r || null
                                                }
                                            })), c.resellerTradePermissions = o(o({}, c.resellerTradePermissions), a), e.next = 13, u(i.slice(r));
                                        case 13:
                                        case "end":
                                            return e.stop()
                                    }
                                }), e)
                            })));
                            return function() {
                                return e.apply(this, arguments)
                            }
                        }(),
                        p = function() {
                            var t = h(regeneratorRuntime.mark((function t(e) {
                                var i, r;
                                return regeneratorRuntime.wrap((function(t) {
                                    for (;;) switch (t.prev = t.next) {
                                        case 0:
                                            if (null != e && e.length) {
                                                t.next = 2;
                                                break
                                            }
                                            return t.abrupt("return");
                                        case 2:
                                            return (r = e.map((function(t) {
                                                var e;
                                                return null == t || null === (e = t.seller) || void 0 === e ? void 0 : e.id
                                            })).filter((function(t) {
                                                var e;
                                                return !(!t || null !== (e = c.resellerTradePermissions) && void 0 !== e && e[t])
                                            }))).forEach((function(t) {
                                                c.resellerTradePermissions[t] || (c.resellerTradePermissions[t] = {
                                                    isFetching: !0,
                                                    canTrade: !1
                                                })
                                            })), t.next = 6, u(r || []);
                                        case 6:
                                            null == n || null === (i = n.$apply) || void 0 === i || i.call(n);
                                        case 7:
                                        case "end":
                                            return t.stop()
                                    }
                                }), t)
                            })));
                            return function(e) {
                                return t.apply(this, arguments)
                            }
                        }(),
                        f = function(t) {
                            c.resellersLoading = !1, t.forEach((function(t) {
                                var e = c.resaleDeduplicator[c.isLimited2 ? t.collectibleItemInstanceId : t.userAssetId];
                                if (e) return e.price = t.price, void(e.seller = t.seller);
                                c.resaleDeduplicator[c.isLimited2 ? t.collectibleItemInstanceId : t.userAssetId] = t, c.resaleRecords.push(t)
                            })), p(t);
                            try {
                                (0, r.initRobloxBadgesFrameworkAgnostic)({
                                    overrideIconClass: "verified-badge-icon-item-resellers"
                                })
                            } catch (t) {}
                        },
                        g = function(t) {
                            t.type !== a.errorType.pagingParametersChanged && (c.resellersLoading = !1)
                        },
                        m = s.createPager({
                            pageSize: 10,
                            loadPageSize: 100,
                            getItems: function(t) {
                                return c.isLimited2 && c.resaleData.collectibleItemId ? i((function(i, r) {
                                    e.getResellersForLimited2Item(c.resaleData.collectibleItemId, t).then((function(t) {
                                        i({
                                            nextPageCursor: "" !== t.nextPageCursor ? t.nextPageCursor : void 0,
                                            items: t.data
                                        })
                                    })).catch(r)
                                })) : i((function(i, r) {
                                    e.getResellers(c.assetData.id, t).then((function(t) {
                                        i({
                                            nextPageCursor: t.nextPageCursor,
                                            items: t.data
                                        })
                                    })).catch(r)
                                }))
                            }
                        });
                    c.loadMore = function() {
                        c.resellersLoading = !0, m.loadNextPage().then(f).catch(g)
                    }, c.initTradeBtnExperiment = h(regeneratorRuntime.mark((function t() {
                        var e;
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return t.prev = 0, t.next = 3, l.getShouldShowResellerTradeBtn();
                                case 3:
                                    e = t.sent, c.showResellerTradeButton = e || !1, t.next = 9;
                                    break;
                                case 7:
                                    t.prev = 7, t.t0 = t.catch(0);
                                case 9:
                                case "end":
                                    return t.stop()
                            }
                        }), t, null, [
                            [0, 7]
                        ])
                    })));
                    c.$onInit = function() {
                        c.resaleRecords = [], c.resaleDeduplicator = {}, c.resellerTradePermissions = {}, c.showResellerTradeButton = !1, c.canLoadMore = m.canLoadNextPage, c.initTradeBtnExperiment(), m.loadFirstPage().then(f).catch(g)
                    }
                }
                c.$inject = ["resellersConstants", "resaleService", "$q", "$scope", "cursorPaginationServiceV2", "cursorPaginationConstants", "experimentationService"], n.A.controller("resellersPaneController", c);
                var d = c
            },
            5009: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = i(127),
                    n = i.n(r),
                    s = i(2367);

                function o(t, e) {
                    var i = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(t);
                        e && (r = r.filter((function(e) {
                            return Object.getOwnPropertyDescriptor(t, e).enumerable
                        }))), i.push.apply(i, r)
                    }
                    return i
                }

                function a(t, e, i) {
                    return e in t ? Object.defineProperty(t, e, {
                        value: i,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : t[e] = i, t
                }

                function l(t, e, i) {
                    var r = this,
                        s = function() {
                            var i = function(t) {
                                for (var e = 1; e < arguments.length; e++) {
                                    var i = null != arguments[e] ? arguments[e] : {};
                                    e % 2 ? o(Object(i), !0).forEach((function(e) {
                                        a(t, e, i[e])
                                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : o(Object(i)).forEach((function(e) {
                                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(i, e))
                                    }))
                                }
                                return t
                            }({}, t.highCharts.defaultConfiguration);
                            i.chart.type = "column", i.colors = [t.highCharts.colors.verticalBarColor], i.chart.height = t.highCharts.verticalBarChartHeight, i.data = e.toHighChartsData(r.chartDataPoints), i.xAxis.min = e.getDateMinusDays(r.days), i.xAxis.labels = {
                                enabled: !1
                            }, i.yAxis = {
                                gridLineWidth: 0,
                                minorGridLineWidth: 0,
                                title: {
                                    text: ""
                                },
                                labels: {
                                    enabled: !1
                                }
                            }, i.plotOptions = {
                                series: {
                                    pointWidth: 1
                                }
                            };
                            var s = n().element("#".concat(r.verticalBarChartId));
                            s.highcharts(i), r.highcharts = s.highcharts()
                        };
                    r.$onInit = function() {
                        var t = (new Date).getTime();
                        r.verticalBarChartId = "vertical_bar_chart_".concat(t), i(s)
                    }, r.$onChanges = function() {
                        r.highcharts && r.highcharts.xAxis[0].update({
                            min: e.getDateMinusDays(r.days)
                        })
                    }
                }
                l.$inject = ["resellersConstants", "highchartsService", "$timeout"], s.A.controller("verticalBarChartController", l), e.default = l
            },
            2367: function(t, e, i) {
                "use strict";
                var r = i(7577),
                    n = i(127),
                    s = i.n(n)().module("resellers", ["robloxApp", "resellersAppTemplates", "cursorPagination", "ui.bootstrap", "thumbnails", "systemFeedback"]).config(["languageResourceProvider", function(t) {
                        var e = new r.TranslationResourceProvider,
                            i = e.getTranslationResource("Feature.Catalog"),
                            n = e.getTranslationResource("Feature.PrivateSales"),
                            s = e.getTranslationResource("Feature.Item"),
                            o = e.getTranslationResource("Feature.Profile"),
                            a = e.getTranslationResource("Feature.Trades"),
                            l = e.getTranslationResource("Feature.Premium");
                        t.setTranslationResources([i, n, s, o, a, l])
                    }]);
                e.A = s
            },
            6066: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = i(1260),
                    n = i(3698),
                    s = i(2367),
                    o = i(7577),
                    a = i(5426);

                function l(t, e, i, r, n, s, o) {
                    try {
                        var a = t[s](o),
                            l = a.value
                    } catch (t) {
                        return void i(t)
                    }
                    a.done ? e(l) : Promise.resolve(l).then(r, n)
                }

                function h(t) {
                    return function() {
                        var e = this,
                            i = arguments;
                        return new Promise((function(r, n) {
                            var s = t.apply(e, i);

                            function o(t) {
                                l(s, r, n, o, a, "next", t)
                            }

                            function a(t) {
                                l(s, r, n, o, a, "throw", t)
                            }
                            o(void 0)
                        }))
                    }
                }

                function c() {
                    var t = function() {
                            var t = o.CurrentUser.isAuthenticated && Number(o.CurrentUser.userId);
                            return t ? "".concat(n.default.localStorageNames.showResellerTradeButton, ":").concat(t) : null
                        },
                        e = function(e) {
                            var i = t();
                            i && a.localStorageService.setLocalStorage(i, e)
                        },
                        i = function(t, e, i) {
                            return r.httpService.get(n.default.url.getExperimentationValues(t, e, i))
                        },
                        s = function() {
                            var t = h(regeneratorRuntime.mark((function t() {
                                var r, s;
                                return regeneratorRuntime.wrap((function(t) {
                                    for (;;) switch (t.prev = t.next) {
                                        case 0:
                                            return t.next = 2, i(n.default.defaultProjectId, n.default.layerNames.itemDetailsPage, n.default.parameterNames.showResellerTradeButton);
                                        case 2:
                                            s = t.sent, "boolean" != typeof(null == s || null === (r = s.data) || void 0 === r ? void 0 : r.showResellerTradeButton) && e("");
                                        case 5:
                                        case "end":
                                            return t.stop()
                                    }
                                }), t)
                            })));
                            return function() {
                                return t.apply(this, arguments)
                            }
                        }(),
                        l = function() {
                            var r = h(regeneratorRuntime.mark((function r() {
                                var o, l, h, c;
                                return regeneratorRuntime.wrap((function(r) {
                                    for (;;) switch (r.prev = r.next) {
                                        case 0:
                                            if (d = void 0, u = void 0, u = t(), "boolean" != typeof(l = u && null !== (d = a.localStorageService.getLocalStorage(u)) && void 0 !== d ? d : null)) {
                                                r.next = 4;
                                                break
                                            }
                                            return s(), r.abrupt("return", l);
                                        case 4:
                                            return r.next = 6, i(n.default.defaultProjectId, n.default.layerNames.itemDetailsPage, n.default.parameterNames.showResellerTradeButton);
                                        case 6:
                                            return h = r.sent, "boolean" == typeof(c = null == h || null === (o = h.data) || void 0 === o ? void 0 : o.showResellerTradeButton) && e(c), r.abrupt("return", c);
                                        case 10:
                                        case "end":
                                            return r.stop()
                                    }
                                    var d, u
                                }), r)
                            })));
                            return function() {
                                return r.apply(this, arguments)
                            }
                        }();
                    return {
                        getABTestEnrollment: i,
                        getShouldShowResellerTradeBtn: l
                    }
                }
                s.A.factory("experimentationService", c), e.default = c
            },
            6361: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = i(2367);

                function n(t, e, i) {
                    var r = function(e) {
                        return e.reverse().map((function(e) {
                            return new Date(e.date).getTime() + t.highCharts.itemDelimiter + e.value
                        })).join(t.highCharts.lineDelimiter)
                    };
                    return {
                        getDateMinusDays: function(t) {
                            var e = new Date;
                            return e.setDate(e.getDate() - t), e.getTime()
                        },
                        toHighChartsData: function(e) {
                            return {
                                csv: "col".concat(t.highCharts.itemDelimiter, "row").concat(t.highCharts.lineDelimiter).concat(r(e)).concat(t.highCharts.lineDelimiter),
                                itemDelimiter: t.highCharts.itemDelimiter,
                                lineDelimiter: t.highCharts.lineDelimiter
                            }
                        }
                    }
                }
                n.$inject = ["resellersConstants", "$timeout", "$q"], r.A.factory("highchartsService", n), e.default = n
            },
            4960: function(t, e, i) {
                "use strict";
                i.r(e);
                var r = i(2367);

                function n(t, e, i, r) {
                    var n = function(n, s, o) {
                        var a = {
                            url: i("formatString")(t.urls.setResalePrice, {
                                assetId: n,
                                userAssetId: s
                            })
                        };
                        return e((function(e, i) {
                            return r.httpPatch(a, {
                                price: o
                            }).then(e).catch(r.getApiErrorCodeHandler(i, t.errorCodes.economyApi))
                        }))
                    };
                    return {
                        getAssetResaleData: function(n) {
                            var s = {
                                url: i("formatString")(t.urls.getResaleData, {
                                    assetId: n
                                })
                            };
                            return e((function(e, i) {
                                return r.httpGet(s, {}).then(e).catch(r.getApiErrorCodeHandler(i, t.errorCodes.economyApi))
                            }))
                        },
                        getResellers: function(n, s) {
                            var o = {
                                    url: i("formatString")(t.urls.getResellers, {
                                        assetId: n
                                    })
                                },
                                a = {
                                    cursor: s.cursor,
                                    limit: s.count
                                };
                            return e((function(e, i) {
                                return r.httpGet(o, a).then(e).catch(r.getApiErrorCodeHandler(i, t.errorCodes.economyApi))
                            }))
                        },
                        takeOffSale: function(t, e) {
                            return n(t, e, null)
                        },
                        setResalePrice: function(t, e, i) {
                            return n(t, e, i)
                        },
                        getCanTradeWith: function(n) {
                            var s = {
                                url: i("formatString")(t.urls.getCanTradeWith, {
                                    userId: n
                                })
                            };
                            return e((function(e, i) {
                                return r.httpGet(s, {}).then(e).catch(r.getApiErrorCodeHandler(i, t.errorCodes.economyApi))
                            }))
                        },
                        postItemDetails: function(n) {
                            var s = {
                                    items: [{
                                        itemType: "Asset",
                                        id: n
                                    }]
                                },
                                o = {
                                    url: i("formatString")(t.urls.postItemDetails)
                                };
                            return e((function(e, i) {
                                return r.httpPost(o, s).then(e).catch(r.getApiErrorCodeHandler(i, t.errorCodes.economyApi))
                            }))
                        },
                        postMarketplaceItemDetails: function(n) {
                            var s = {
                                    itemIds: [n]
                                },
                                o = {
                                    url: i("formatString")(t.urls.postMarketplaceItemDetails)
                                };
                            return e((function(e, i) {
                                return r.httpPost(o, s).then(e).catch(r.getApiErrorCodeHandler(i, t.errorCodes.economyApi))
                            }))
                        },
                        getResellersForLimited2Item: function(n, s) {
                            var o = {
                                    url: i("formatString")(t.urls.getResellersForLimited2Item, {
                                        collectibleItemId: n
                                    })
                                },
                                a = {
                                    cursor: s.cursor,
                                    limit: s.count
                                };
                            return e((function(e, i) {
                                return r.httpGet(o, a).then(e).catch(r.getApiErrorCodeHandler(i, t.errorCodes.economyApi))
                            }))
                        },
                        patchRemoveLimited2ItemFromSale: function(n, s, o) {
                            var a = {
                                    price: void 0,
                                    isOnSale: !1,
                                    sellerId: o,
                                    sellerType: "User",
                                    collectibleProductId: s.collectibleProductId
                                },
                                l = {
                                    url: i("formatString")(t.urls.placeLimited2ItemOnSale, {
                                        collectibleItemId: n,
                                        collectibleInstanceId: s.collectibleItemInstanceId
                                    })
                                };
                            return e((function(e, i) {
                                return r.httpPatch(l, a).then(e).catch(r.getApiErrorCodeHandler(i, t.errorCodes.economyApi))
                            }))
                        },
                        getLimited2AssetResaleData: function(n) {
                            var s = {
                                url: i("formatString")(t.urls.getResaleDataForLimited2Item, {
                                    collectibleItemId: n
                                })
                            };
                            return e((function(e, i) {
                                return r.httpGet(s, {}).then(e).catch(r.getApiErrorCodeHandler(i, t.errorCodes.economyApi))
                            }))
                        }
                    }
                }
                n.$inject = ["resellersConstants", "$q", "$filter", "httpService"], r.A.factory("resaleService", n), e.default = n
            },
            1481: function(t) {
                t.exports = '<div class="section-content price-volume-charts-container" ng-show="$ctrl.historicalDataAvailable"> <div ng-if="$ctrl.chartDataAvailable" class="input-group-btn price-chart-range-dropdown" uib-dropdown=""> <button type="button" class="input-dropdown-btn" uib-dropdown-toggle=""> <span class="rbx-selection-label" ng-bind="\'Label.XDays\' | translate : { numberOfDays: $ctrl.selectedResaleChartDays }"></span> <span class="icon-down-16x16"></span> </button> <ul class="dropdown-menu" role="menu" uib-dropdown-menu=""> <li ng-repeat="dayCount in $ctrl.resaleChartDayOptions"> <a ng-bind="\'Label.XDays\' | translate : { numberOfDays: dayCount }" ng-click="$ctrl.setSelectedResaleChartDays(dayCount)"></a> </li> </ul> </div> <div ng-if="$ctrl.chartDataAvailable" class="price-chart-legend"> <div class="line"></div> <div class="text-pastname legend-text" ng-bind="\'Label.RecentAveragePrice\' | translate"></div> <div class="line volume"></div> <div class="text-pastname legend-text" ng-bind="\'Label.Volume\' | translate"></div> </div> <line-chart ng-if="$ctrl.chartDataAvailable" chart-data-points="$ctrl.resaleData.priceDataPoints" days="$ctrl.selectedResaleChartDays"></line-chart> <vertical-bar-chart ng-if="$ctrl.chartDataAvailable" chart-data-points="$ctrl.resaleData.volumeDataPoints" days="$ctrl.selectedResaleChartDays"></vertical-bar-chart> <div class="clearfix"> <div class="price-chart-info-container clearfix"> <div class="text-label" ng-bind="\'Label.QuantitySold\' | translate"></div> <div id="item-quantity-sold" class="text-lead info-content" ng-bind="$ctrl.isLimited2 ? $ctrl.formatNumberIncludeZero($ctrl.resaleData.sales) : $ctrl.formatNumber($ctrl.resaleData.sales)"></div> </div> <div class="price-chart-info-container clearfix"> <div class="text-label" ng-bind="\'Label.OriginalPrice\' | translate"></div> <div id="item-original-price" class="info-content"> <span id="original-price-robux-icon" class="icon-robux-20x20"></span> <span class="text-robux" ng-bind="$ctrl.isLimited2 ? $ctrl.formatNumberIncludeZero($ctrl.resaleData.originalPrice) : $ctrl.formatNumber($ctrl.resaleData.originalPrice)"></span> </div> </div> <div class="price-chart-info-container clearfix"> <div class="text-label" ng-bind="\'Label.AveragePrice\' | translate"></div> <div class="info-content"> <span class="icon-robux-20x20"></span> <span id="item-average-price" class="text-robux" ng-bind="$ctrl.isLimited2 ? $ctrl.formatNumberIncludeZero($ctrl.resaleData.recentAveragePrice) : $ctrl.formatNumber($ctrl.resaleData.recentAveragePrice)"></span> </div> </div> </div> </div> <div id="no-price-chart-data" class="section-content-off" ng-hide="$ctrl.historicalDataAvailable" ng-bind="\'Label.NoHistoricalData\' | translate"></div> '
            },
            9081: function(t) {
                t.exports = '<div class="rbx-tabs-horizontal resale-pricechart-tabs"> <div ng-if="$ctrl.resellableItem"> <div ng-if="$ctrl.resaleData && $ctrl.authenticatedUser"> <ul id="horizontal-tabs" class="nav nav-tabs" role="tablist"> <li class="rbx-tab" ng-class="$ctrl.getTabActiveClasses($ctrl.resellersTabs.inventory)"> <a class="rbx-tab-heading" ng-click="$ctrl.selectTab($ctrl.resellersTabs.inventory)"> <span class="text-lead" ng-bind="\'Label.YourInventory\' | translate"></span> </a> </li> <li class="rbx-tab" ng-class="$ctrl.getTabActiveClasses($ctrl.resellersTabs.priceChart)"> <a class="rbx-tab-heading" ng-click="$ctrl.selectTab($ctrl.resellersTabs.priceChart)"> <span class="text-lead" ng-bind="\'Heading.PriceChart\' | translate"></span> </a> </li> <li class="rbx-tab" ng-class="$ctrl.getTabActiveClasses($ctrl.resellersTabs.resellers)"> <a class="rbx-tab-heading" ng-click="$ctrl.selectTab($ctrl.resellersTabs.resellers)"> <span class="text-lead" ng-bind="\'Heading.Resellers\' | translate"></span> </a> </li> </ul> <div class="tab-content rbx-tab-content" ng-if="$ctrl.resaleData"> <div id="price-chart" class="tab-pane price-chart-section" ng-class="$ctrl.getTabActiveClasses($ctrl.resellersTabs.priceChart)"> <div class="container-header"> <h2 ng-bind="\'Heading.PriceChart\' | translate"></h2> </div> <asset-resale-data-pane resale-data="$ctrl.resaleData" is-limited-2="$ctrl.isLimited2"></asset-resale-data-pane> </div> <div id="item-details-limited-inventory-container" class="tab-pane" ng-class="$ctrl.getTabActiveClasses($ctrl.resellersTabs.inventory)" data-target-id="{{$ctrl.assetId}}" data-is-bundle="{{$ctrl.isBundle}}"></div> <div id="resellers" class="tab-pane resellers-container" ng-if="$ctrl.resaleRestriction !== 2" ng-class="$ctrl.getTabActiveClasses($ctrl.resellersTabs.resellers)"> <div class="container-header"> <h2 ng-bind="\'Heading.Resellers\' | translate"></h2> </div> <resellers-pane resale-data="$ctrl.resaleData" asset-data="$ctrl.assetData" economy-metadata="$ctrl.economyMetadata" is-limited-2="$ctrl.isLimited2" item-type="$ctrl.itemType"></resellers-pane> </div> </div> </div> <div ng-if="$ctrl.resaleData && !$ctrl.authenticatedUser" class="tab-content rbx-tab-content"> <div class="container-header"> <h2 ng-bind="\'Heading.PriceChart\' | translate"></h2> </div> <asset-resale-data-pane resale-data="$ctrl.resaleData"></asset-resale-data-pane> </div> <div class="section-content price-chart-spinner" ng-show="$ctrl.loadingResaleData"> <span class="spinner spinner-default"></span> </div> <div class="section-content-off" ng-show="$ctrl.resaleDataLoadFailure"> <span ng-bind="\'Label.ResaleDataLoadFailure\' | translate"></span> <a class="refresh-link-icon" ng-click="$ctrl.loadResaleData()"></a> </div> </div> </div> '
            },
            839: function(t) {
                t.exports = '<div id="{{ $ctrl.lineChartId }}"></div>'
            },
            4441: function(t) {
                t.exports = '<ul class="vlist"> <li class="reseller-item list-item" ng-repeat="resaleRecord in $ctrl.resaleRecords | orderBy : [\'price\',\'userAssetId\']"> <a class="list-header reseller-item-avatar" ng-href="{{ $ctrl.getProfilePageUrl($ctrl.getSellerId(resaleRecord)) }}"> <thumbnail-2d thumbnail-type="$ctrl.thumbnailTypes.avatarHeadshot" thumbnail-target-id="resaleRecord.seller.id ? resaleRecord.seller.id : resaleRecord.seller.sellerId" class="avatar-headshot-md"></thumbnail-2d> </a> <div class="resale-info"> <div class="item-reseller-container"> <a class="text-name username" ng-href="{{ $ctrl.getProfilePageUrl(resaleRecord.seller.id ? resaleRecord.seller.id : resaleRecord.seller.sellerId) }}" ng-bind="resaleRecord.seller.name"></a> <span ng-if="$ctrl.showVerifiedBadge(resaleRecord.seller)" class="verified-badge-icon-item-resellers" data-size="Title" data-overrideimgclass="verified-badge-icon-item-resellers-rendered"> </span> </div> <span class="separator">-</span> <span class="font-caption-body serial-number" ng-show="resaleRecord.serialNumber" ng-bind="\'Label.SerialNumberOfTotal\' | translate : { number: $ctrl.formatNumber(resaleRecord.serialNumber), total: $ctrl.formatNumber($ctrl.resaleData.assetStock) }"></span> <span class="font-caption-body serial-number" ng-hide="resaleRecord.serialNumber" ng-bind="\'Label.SerialNotAvailable\' | translate"></span> <div class="reseller-price-container"> <span class="icon-robux-16x16"></span> <span class="icon-robux-28x28"></span> <span class="text-robux" ng-bind="$ctrl.formatNumber(resaleRecord.price)"></span> <span class="reseller-original-price" ng-if="resaleRecord.discountInformation.originalPrice > resaleRecord.price"> <span class="icon-robux-16x16"></span> <span ng-bind="$ctrl.formatNumber(resaleRecord.discountInformation.originalPrice)"></span> </span> </div> </div> <div class="reseller-buttons-container" ng-class="{\'has-trade-btn\': $ctrl.showResellerTradeButton}"> <div class="trade-button-container" ng-if="$ctrl.showResellerTradeButton && $ctrl.isPremiumUser"> <a class="btn-min-width btn-control-md reseller-trade-link" ng-class="{\'fetching-trade-permissions\': $ctrl.isFetchingTradePermissions($ctrl.getSellerId(resaleRecord))}" ng-href="{{ $ctrl.getUserTradeUrl($ctrl.getSellerId(resaleRecord), resaleRecord.userAssetId) }}" ng-hide="$ctrl.getSellerId(resaleRecord) === $ctrl.authenticatedUser.id" ng-bind="\'Action.Trade\' | translate" ng-disabled="!$ctrl.canTradeWith($ctrl.getSellerId(resaleRecord))" ng-click="$ctrl.onResellerTradeBtnClick(resaleRecord)"></a> <div ng-if="$ctrl.isFetchingTradePermissions($ctrl.getSellerId(resaleRecord))" class="spinner-circle spinner-no-margin"></div> </div> <div class="trade-button-container" ng-if="$ctrl.showResellerTradeButton && !$ctrl.isPremiumUser"> <div class="popover top fade in" ng-class="{\'show\': $ctrl.activeUpgradeTradeBtnId === resaleRecord.userAssetId}"> <div class="arrow"></div> <div class="popover-inner"> <div class="popover-content"> <h3><span class="icon-premium-small"></span><span ng-bind="\'Error.RequiresPremiumMembership\' | translate"></span></h3> <p ng-bind="\'Description.TradeBenefit\' | translate"></p> <a class="btn-growth-sm btn-full-width upgrade" ng-href="{{ $ctrl.getUpgradeToPremiumURL() }}" target="_self" ng-click="$ctrl.onUpgradeToPremiumClick(resaleRecord)" ng-bind="\'Action.Upgrade\' | translate"></a> </div> </div> </div> <button class="btn-min-width btn-control-md reseller-trade-link" ng-hide="$ctrl.getSellerId(resaleRecord) === $ctrl.authenticatedUser.id" ng-bind="\'Action.Trade\' | translate" ng-click="$ctrl.onNonPremiumTradeBtnClick(resaleRecord)"></button> </div> <button class="reseller-purchase-button btn-min-width btn-buy-md" data-button-type="reseller" data-expected-price="{{ resaleRecord.price }}" data-expected-seller-id="{{ $ctrl.getSellerId(resaleRecord) }}" data-seller-name="{{ resaleRecord.seller.name }}" data-userasset-id="{{ resaleRecord.userAssetId }}" data-product-id="{{ $ctrl.assetData.productId }}" data-item-id="{{ $ctrl.assetData.id }}" data-item-name="{{ $ctrl.assetData.name }}" data-asset-type="{{ $ctrl.assetData.type }}" data-bc-requirement="{{ $ctrl.assetData.membershipRequirement }}" data-expected-currency="1" ng-hide="$ctrl.getSellerId(resaleRecord) === $ctrl.authenticatedUser.id || $ctrl.isLimited2" ng-bind="\'Action.Buy\' | translate" ng-click="$ctrl.purchaseLimited1Item(resaleRecord)"></button> <button class="reseller-purchase-button btn-min-width btn-buy-md" ng-hide="$ctrl.getSellerId(resaleRecord) === $ctrl.authenticatedUser.id || !$ctrl.isLimited2" ng-bind="\'Action.Buy\' | translate" ng-click="$ctrl.purchaseLimited2Item(resaleRecord)"></button> <button class="remove-sale btn-control-md btn-min-width" data-button-type="reseller" ng-disabled="$ctrl.takeOffSaleDebounce[resaleRecord.userAssetId]" ng-click="$ctrl.takeOffSale(resaleRecord)" ng-show="$ctrl.getSellerId(resaleRecord) === $ctrl.authenticatedUser.id" ng-bind="\'Action.Remove\' | translate"></button> </div> </li> </ul> '
            },
            1228: function(t) {
                t.exports = '<div class="remove-panel section-content"> <system-feedback></system-feedback> <div id="angular-react-purchase-handoff" data-identifier="limited-reseller-list"></div> <div ng-if="$ctrl.economyMetadata.purchasingEnabled"> <div class="resellers"> <resellers-list resale-data="$ctrl.resaleData" asset-data="$ctrl.assetData" resale-records="$ctrl.resaleRecords" reseller-trade-permissions="$ctrl.resellerTradePermissions" show-reseller-trade-button="$ctrl.showResellerTradeButton" is-limited-2="$ctrl.isLimited2" item-type="$ctrl.itemType"></resellers-list> <span class="spinner spinner-default" ng-if="$ctrl.resellersLoading"></span> </div> <button class="btn-control-sm see-more-resellers" type="button" ng-show="$ctrl.canLoadMore()" ng-click="$ctrl.loadMore()" ng-bind="\'Label.SeeMore\' | translate"></button> <div class="section-content-off" ng-hide="$ctrl.resellersLoading || $ctrl.resaleRecords.length > 0" ng-bind="\'Message.NoOneSelling\' | translate"></div> </div> <div class="section-content-off" ng-if="!$ctrl.economyMetadata.purchasingEnabled" ng-bind="\'Message.EconomyDisabled\' | translate"></div> </div> '
            },
            7956: function(t) {
                t.exports = '<div id="{{ $ctrl.verticalBarChartId }}"></div>'
            },
            5426: function(t) {
                "use strict";
                t.exports = CoreRobloxUtilities
            },
            1260: function(t) {
                "use strict";
                t.exports = CoreUtilities
            },
            7577: function(t) {
                "use strict";
                t.exports = Roblox
            },
            127: function(t) {
                "use strict";
                t.exports = angular
            }
        },
        e = {};

    function i(r) {
        var n = e[r];
        if (void 0 !== n) return n.exports;
        var s = e[r] = {
            id: r,
            loaded: !1,
            exports: {}
        };
        return t[r].call(s.exports, s, s.exports, i), s.loaded = !0, s.exports
    }
    i.n = function(t) {
            var e = t && t.__esModule ? function() {
                return t.default
            } : function() {
                return t
            };
            return i.d(e, {
                a: e
            }), e
        }, i.d = function(t, e) {
            for (var r in e) i.o(e, r) && !i.o(t, r) && Object.defineProperty(t, r, {
                enumerable: !0,
                get: e[r]
            })
        }, i.o = function(t, e) {
            return Object.prototype.hasOwnProperty.call(t, e)
        }, i.r = function(t) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(t, "__esModule", {
                value: !0
            })
        }, i.nmd = function(t) {
            return t.paths = [], t.children || (t.children = []), t
        },
        function() {
            "use strict";
            var t, e = i(127),
                r = i.n(e),
                n = i(7525),
                s = i(2367);
            window.Highcharts || (t = i(1060), i(343)(t), window.Highcharts = t), (0, n.importFilesUnderPath)(i(7020)), (0, n.importFilesUnderPath)(i(5727)), (0, n.importFilesUnderPath)(i(7904)), (0, n.importFilesUnderPath)(i(2291));
            var o = i(744);
            (0, n.templateCacheGenerator)(r(), "resellersAppTemplates", o);
            r().element((function() {
                r().bootstrap("#asset-resale-data-pane,asset-resale-pane", [s.A.name])
            }))
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/c20ba305a1f8e84ca8a3283a3c4926c0-resellers.bundle.min.js.map

! function() {
    "use strict";
    var e, t, a, n, i, r = {
            n: function(e) {
                var t = e && e.__esModule ? function() {
                    return e.default
                } : function() {
                    return e
                };
                return r.d(t, {
                    a: t
                }), t
            },
            d: function(e, t) {
                for (var a in t) r.o(t, a) && !r.o(e, a) && Object.defineProperty(e, a, {
                    enumerable: !0,
                    get: t[a]
                })
            },
            o: function(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            }
        },
        s = React,
        c = r.n(s),
        o = CoreUtilities,
        l = ReactDOM,
        u = ReactStyleGuide,
        d = RobloxItemPurchase,
        m = ReactUtilities,
        p = RobloxThumbnails,
        f = CoreRobloxUtilities,
        y = Roblox,
        h = {
            common: [""],
            feature: "Feature.Catalog"
        },
        I = function() {
            return I = Object.assign || function(e) {
                for (var t, a = 1, n = arguments.length; a < n; a++)
                    for (var i in t = arguments[a]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                return e
            }, I.apply(this, arguments)
        },
        g = y.AXAnalyticsService.AXAnalyticsConstants;
    ! function(e) {
        e.Catalog = "Catalog", e.ItemDetailsRecommendations = "ItemDetailsRecommendations", e.ItemDetailsBundleContents = "ItemDetailsBundleContents", e.ComplimentaryItemRecommendations = "ComplimentaryItemRecommendations", e.LookDetailsContents = "LookDetailsContents"
    }(e || (e = {})),
    function(e) {
        e.CatalogItemCard = "CatalogItemCard", e.ItemDetailsPage = "ItemDetailsPage", e.LookDetails = "LookDetails", e.ShoppingCartModal = "ShoppingCartModal", e.PostPurchase = "PostPurchase"
    }(t || (t = {})),
    function(e) {
        e.InfiniteScroll = "InfiniteScroll", e.LoadMore = "LoadMore"
    }(a || (a = {})),
    function(e) {
        e.ToggleButton = "ToggleButton", e.ClickOutside = "ClickOutside"
    }(n || (n = {})),
    function(e) {
        e.ItemDetailsPage = "ItemDetailsPage", e.ShoppingCart = "ShoppingCart", e.LookDetails = "LookDetails", e.CurrentWearing = "CurrentWearing", e.DirectResale = "DirectResale"
    }(i || (i = {}));
    var T = function(e, t) {
            e && y.AXAnalyticsService.sendAXTracking({
                itemName: e,
                actionType: y.AXSendTrackingActionType.Click,
                metaData: t ? {
                    metaData: JSON.stringify(t)
                } : void 0
            })
        },
        P = function() {
            return P = Object.assign || function(e) {
                for (var t, a = 1, n = arguments.length; a < n; a++)
                    for (var i in t = arguments[a]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                return e
            }, P.apply(this, arguments)
        },
        b = y.AXAnalyticsService.AXAnalyticsConstants,
        S = (0, d.createItemPurchase)(),
        C = S[0],
        v = S[1],
        A = (0, m.withTranslations)((function(e) {
            var t = e.identifier,
                a = e.translate,
                n = (0, s.useState)(),
                r = n[0],
                o = n[1],
                l = (0, s.useState)(),
                d = l[0],
                m = l[1],
                h = (0, u.createSystemFeedback)(),
                S = h[0];
            h[1];

            function A(e) {
                return m(e.identifier), {
                    translate: a,
                    productId: e.productId,
                    expectedPrice: e.expectedPrice,
                    thumbnail: c().createElement(p.Thumbnail2d, {
                        type: "asset" === e.itemType.toLowerCase() ? p.ThumbnailTypes.assetThumbnail : p.ThumbnailTypes.bundleThumbnail,
                        size: p.DefaultThumbnailSize,
                        targetId: e.assetId,
                        imgClassName: "",
                        format: p.ThumbnailFormat.webp
                    }),
                    assetName: e.name,
                    assetType: e.assetType,
                    sellerName: e.expectedSellerName,
                    sellerType: e.expectedSellerType,
                    expectedCurrency: 1,
                    expectedSellerId: e.expectedSellerId,
                    collectibleItemId: e.collectibleItemId,
                    collectibleProductId: e.collectibleProductId,
                    collectibleItemInstanceId: e.collectibleItemInstanceId,
                    showSuccessBanner: !0,
                    userAssetId: e.userAssetId,
                    isLimited: !0,
                    onPurchaseSuccess: function() {
                        var t = {
                            totalTransactionValue: e.expectedPrice,
                            transactionItems: JSON.stringify([{
                                itemType: e.itemType,
                                subType: e.assetType,
                                itemId: e.assetId,
                                resalePurchase: e.resalePurchase,
                                isLimited: !0,
                                isTimedOptionPurchase: !1
                            }]),
                            purchaseType: e.identifier,
                            userId: y.CurrentUser.userId
                        };
                        y.AXAnalyticsService.sendAXTracking({
                            itemName: b.PurchaseSuccessDirectResale,
                            excludeTelemetry: !0
                        }), y.AXAnalyticsService.sendAXTracking({
                            itemName: b.PurchaseSuccess,
                            counterName: b.PurchaseSuccessDirectResale,
                            metaData: {
                                metaData: JSON.stringify(t),
                                totalValue: e.expectedPrice
                            },
                            actionType: y.AXSendTrackingActionType.Click
                        }), f.eventStreamService.sendEvent({
                            name: "marketplaceWebPurchaseSuccess",
                            type: "marketplaceWebPurchaseSuccess",
                            context: "marketplaceWebPurchase"
                        }, t), e.refreshPage ? window.location.reload() : window.dispatchEvent(new CustomEvent("navigation-update-user-currency"))
                    }
                }
            }
            return (0, s.useEffect)((function() {
                window.addEventListener("angular-to-react-purchase-event", (function(e) {
                    var t, a, n = e.detail;
                    t = i.DirectResale, a = {
                        totalTransactionValue: n.expectedPrice,
                        transactionItems: JSON.stringify([{
                            itemType: n.itemType,
                            subType: n.assetType,
                            itemId: n.assetId,
                            resalePurchase: n.resalePurchase,
                            isLimited: !0,
                            isTimedOptionPurchase: !1
                        }]),
                        purchaseType: n.identifier,
                        userId: y.CurrentUser.userId
                    }, T(g.PurchaseButtonClick, I({
                        source: t
                    }, a)), o(A(n))
                }))
            }), []), (0, s.useEffect)((function() {
                t === d && r && v.start()
            }), [r, d, t]), c().createElement(c().Fragment, null, c().createElement(S, null), r && c().createElement(C, P({}, r)))
        }), h),
        D = function(e) {
            return e.getAttribute("data-identifier")
        };

    function k() {
        var e = document.getElementById("angular-react-purchase-handoff");
        e ? (0, l.render)(c().createElement(A, {
            identifier: D(e)
        }), e) : window.requestAnimationFrame(k)
    }(0, o.ready)((function() {
        k()
    }))
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/3eef1d9b0770c33e173e4e3f00ef52c5-angularToReactPurchaseHandoff.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemResale");