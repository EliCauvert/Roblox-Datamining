! function() {
    try {
        var t = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "5690ea7bf840f017788de8e800bea68dcf38055e"
        };
        var e = (new t.Error).stack;
        e && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[e] = "68e4d900-3bbd-4e86-a32d-80ae106dbcb7", t._sentryDebugIdIdentifier = "sentry-dbid-68e4d900-3bbd-4e86-a32d-80ae106dbcb7")
    } catch (t) {}
}(),
function() {
    var t = {
            611: function(t) {
                function e(t) {
                    return t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var i = {}.hasOwnProperty;

                    function r() {
                        for (var t = "", o = 0; o < arguments.length; o++) {
                            var s = arguments[o];
                            s && (t = n(t, function(t) {
                                if ("string" == typeof t || "number" == typeof t) return t;
                                if ((void 0 === t ? "undefined" : e(t)) !== "object") return "";
                                if (Array.isArray(t)) return r.apply(null, t);
                                if (t.toString !== Object.prototype.toString && !t.toString.toString().includes("[native code]")) return t.toString();
                                var o = "";
                                for (var s in t) i.call(t, s) && t[s] && (o = n(o, s));
                                return o
                            }(s)))
                        }
                        return t
                    }

                    function n(t, e) {
                        return e ? t ? t + " " + e : t + e : t
                    }
                    t.exports ? (r.default = r, t.exports = r) : "function" == typeof define && "object" === e(define.amd) && define.amd ? define("classnames", [], function() {
                        return r
                    }) : window.classNames = r
                }()
            },
            573: function(t, e, i) {
                var r, n;

                function o(t, e) {
                    return null != e && "u" > typeof Symbol && e[Symbol.hasInstance] ? !!e[Symbol.hasInstance](t) : t instanceof e
                }

                function s(t) {
                    return t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
                }
                t = i.nmd(t), r = "u" > typeof window ? window : this, n = function(t) {
                    i = (e = window).document, r = e.navigator && e.navigator.userAgent || "", n = i && i.createElementNS && !!i.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGRect, a = /(edge|msie|trident)/i.test(r) && !window.opera, h = (l = /Firefox/.test(r)) && 4 > parseInt(r.split("Firefox/")[1], 10), d = [], u = (c = t = e.Highcharts ? e.Highcharts.error(16, !0) : {
                            product: "Highcharts",
                            version: "5.0.14",
                            deg2rad: 2 * Math.PI / 360,
                            doc: i,
                            hasBidiBug: h,
                            hasTouch: i && void 0 !== i.documentElement.ontouchstart,
                            isMS: a,
                            isWebKit: /AppleWebKit/.test(r),
                            isFirefox: l,
                            isTouchDevice: /(Mobile|Android|Windows Phone)/.test(r),
                            SVG_NS: "http://www.w3.org/2000/svg",
                            chartCount: 0,
                            seriesTypes: {},
                            symbolSizes: {},
                            svg: n,
                            vml: !n,
                            win: e,
                            marginNames: ["plotTop", "marginRight", "marginBottom", "plotLeft"],
                            noop: function() {},
                            charts: []
                        }).charts, p = c.doc, f = c.win, c.error = function(t, e) {
                            if (t = c.isNumber(t) ? "Highcharts error #" + t + ": www.highcharts.com/errors/" + t : t, e) throw Error(t);
                            f.console && console.log(t)
                        }, c.Fx = function(t, e, i) {
                            this.options = e, this.elem = t, this.prop = i
                        }, c.Fx.prototype = {
                            dSetter: function() {
                                var t, e = this.paths[0],
                                    i = this.paths[1],
                                    r = [],
                                    n = this.now,
                                    o = e.length;
                                if (1 === n) r = this.toD;
                                else if (o === i.length && 1 > n)
                                    for (; o--;) t = parseFloat(e[o]), r[o] = isNaN(t) ? e[o] : n * parseFloat(i[o] - t) + t;
                                else r = i;
                                this.elem.attr("d", r, null, !0)
                            },
                            update: function() {
                                var t = this.elem,
                                    e = this.prop,
                                    i = this.now,
                                    r = this.options.step;
                                this[e + "Setter"] ? this[e + "Setter"]() : t.attr ? t.element && t.attr(e, i, null, !0) : t.style[e] = i + this.unit, r && r.call(t, i, this)
                            },
                            run: function(t, e, i) {
                                var r, n = this,
                                    o = function(t) {
                                        return !o.stopped && n.step(t)
                                    };
                                this.startTime = +new Date, this.start = t, this.end = e, this.unit = i, this.now = this.start, this.pos = 0, o.elem = this.elem, o.prop = this.prop, o() && 1 === d.push(o) && (o.timerId = setInterval(function() {
                                    for (r = 0; r < d.length; r++) d[r]() || d.splice(r--, 1);
                                    d.length || clearInterval(o.timerId)
                                }, 13))
                            },
                            step: function(t) {
                                var e, i = +new Date,
                                    r = this.options,
                                    n = this.elem,
                                    o = r.complete,
                                    s = r.duration,
                                    a = r.curAnim;
                                return n.attr && !n.element ? t = !1 : t || i >= s + this.startTime ? (this.now = this.end, this.pos = 1, this.update(), e = a[this.prop] = !0, c.objectEach(a, function(t) {
                                    !0 !== t && (e = !1)
                                }), e && o && o.call(n), t = !1) : (this.pos = r.easing((i - this.startTime) / s), this.now = this.start + (this.end - this.start) * this.pos, this.update(), t = !0), t
                            },
                            initPath: function(t, e, i) {
                                function r(t) {
                                    var e, i;
                                    for (h = t.length; h--;) e = "M" === t[h] || "L" === t[h], i = /[a-zA-Z]/.test(t[h + 3]), e && i && t.splice(h + 1, 0, t[h + 1], t[h + 2], t[h + 1], t[h + 2])
                                }

                                function n(t, e) {
                                    for (; t.length < a;) {
                                        t[0] = e[a - t.length];
                                        var i = t.slice(0, f);
                                        [].splice.apply(t, [0, 0].concat(i)), m && (i = t.slice(t.length - f), [].splice.apply(t, [t.length, 0].concat(i)), h--)
                                    }
                                    t[0] = "M"
                                }

                                function o(t, e) {
                                    for (var i = (a - t.length) / f; 0 < i && i--;)(l = t.slice().splice(t.length / v - f, f * v))[0] = e[a - f - i * f], p && (l[f - 6] = l[f - 2], l[f - 5] = l[f - 1]), [].splice.apply(t, [t.length / v, 0].concat(l)), m && i--
                                }
                                e = e || "";
                                var s, a, l, h, d = t.startX,
                                    u = t.endX,
                                    p = -1 < e.indexOf("C"),
                                    f = p ? 7 : 3;
                                e = e.split(" "), i = i.slice();
                                var g, m = t.isArea,
                                    v = m ? 2 : 1;
                                if (p && (r(e), r(i)), d && u) {
                                    for (h = 0; h < d.length; h++)
                                        if (d[h] === u[0]) {
                                            s = h;
                                            break
                                        } else if (d[0] === u[u.length - d.length + h]) {
                                        s = h, g = !0;
                                        break
                                    }
                                    void 0 === s && (e = [])
                                }
                                return e.length && c.isNumber(s) && (a = i.length + s * v * f, g ? (n(e, i), o(i, e)) : (n(i, e), o(e, i))), [e, i]
                            }
                        }, c.Fx.prototype.fillSetter = c.Fx.prototype.strokeSetter = function() {
                            this.elem.attr(this.prop, c.color(this.start).tweenTo(c.color(this.end), this.pos), null, !0)
                        }, c.extend = function(t, e) {
                            var i;
                            for (i in t || (t = {}), e) t[i] = e[i];
                            return t
                        }, c.merge = function() {
                            var t, e, i = arguments,
                                r = {},
                                n = function(t, e) {
                                    return "object" !== (void 0 === t ? "undefined" : s(t)) && (t = {}), c.objectEach(e, function(i, r) {
                                        !c.isObject(i, !0) || c.isClass(i) || c.isDOMElement(i) ? t[r] = e[r] : t[r] = n(t[r] || {}, i)
                                    }), t
                                };
                            for (!0 === i[0] && (r = i[1], i = Array.prototype.slice.call(i, 2)), e = i.length, t = 0; t < e; t++) r = n(r, i[t]);
                            return r
                        }, c.pInt = function(t, e) {
                            return parseInt(t, e || 10)
                        }, c.isString = function(t) {
                            return "string" == typeof t
                        }, c.isArray = function(t) {
                            return "[object Array]" === (t = Object.prototype.toString.call(t)) || "[object Array Iterator]" === t
                        }, c.isObject = function(t, e) {
                            return !!t && "object" === (void 0 === t ? "undefined" : s(t)) && (!e || !c.isArray(t))
                        }, c.isDOMElement = function(t) {
                            return c.isObject(t) && "number" == typeof t.nodeType
                        }, c.isClass = function(t) {
                            var e = t && t.constructor;
                            return !(!c.isObject(t, !0) || c.isDOMElement(t) || !e || !e.name || "Object" === e.name)
                        }, c.isNumber = function(t) {
                            return "number" == typeof t && !isNaN(t)
                        }, c.erase = function(t, e) {
                            for (var i = t.length; i--;)
                                if (t[i] === e) {
                                    t.splice(i, 1);
                                    break
                                }
                        }, c.defined = function(t) {
                            return null != t
                        }, c.attr = function(t, e, i) {
                            var r;
                            return c.isString(e) ? c.defined(i) ? t.setAttribute(e, i) : t && t.getAttribute && (r = t.getAttribute(e)) : c.defined(e) && c.isObject(e) && c.objectEach(e, function(e, i) {
                                t.setAttribute(i, e)
                            }), r
                        }, c.splat = function(t) {
                            return c.isArray(t) ? t : [t]
                        }, c.syncTimeout = function(t, e, i) {
                            if (e) return setTimeout(t, e, i);
                            t.call(0, i)
                        }, c.pick = function() {
                            var t, e, i = arguments,
                                r = i.length;
                            for (t = 0; t < r; t++)
                                if (null != (e = i[t])) return e
                        }, c.css = function(t, e) {
                            c.isMS && !c.svg && e && void 0 !== e.opacity && (e.filter = "alpha(opacity=" + 100 * e.opacity + ")"), c.extend(t.style, e)
                        }, c.createElement = function(t, e, i, r, n) {
                            t = p.createElement(t);
                            var o = c.css;
                            return e && c.extend(t, e), n && o(t, {
                                padding: 0,
                                border: "none",
                                margin: 0
                            }), i && o(t, i), r && r.appendChild(t), t
                        }, c.extendClass = function(t, e) {
                            var i = function() {};
                            return i.prototype = new t, c.extend(i.prototype, e), i
                        }, c.pad = function(t, e, i) {
                            return Array((e || 2) + 1 - String(t).length).join(i || 0) + t
                        }, c.relativeLength = function(t, e, i) {
                            return /%$/.test(t) ? e * parseFloat(t) / 100 + (i || 0) : parseFloat(t)
                        }, c.wrap = function(t, e, i) {
                            var r = t[e];
                            t[e] = function() {
                                var t = Array.prototype.slice.call(arguments),
                                    e = arguments,
                                    n = this;
                                return n.proceed = function() {
                                    r.apply(n, arguments.length ? arguments : e)
                                }, t.unshift(r), t = i.apply(this, t), n.proceed = null, t
                            }
                        }, c.getTZOffset = function(t) {
                            var e = c.Date;
                            return 6e4 * (e.hcGetTimezoneOffset && e.hcGetTimezoneOffset(t) || e.hcTimezoneOffset || 0)
                        }, c.dateFormat = function(t, e, i) {
                            if (!c.defined(e) || isNaN(e)) return c.defaultOptions.lang.invalidDate || "";
                            t = c.pick(t, "%Y-%m-%d %H:%M:%S");
                            var r = c.Date,
                                n = new r(e - c.getTZOffset(e)),
                                o = n[r.hcGetHours](),
                                s = n[r.hcGetDay](),
                                a = n[r.hcGetDate](),
                                l = n[r.hcGetMonth](),
                                h = n[r.hcGetFullYear](),
                                d = c.defaultOptions.lang,
                                u = d.weekdays,
                                p = d.shortWeekdays,
                                f = c.pad,
                                r = c.extend({
                                    a: p ? p[s] : u[s].substr(0, 3),
                                    A: u[s],
                                    d: f(a),
                                    e: f(a, 2, " "),
                                    w: s,
                                    b: d.shortMonths[l],
                                    B: d.months[l],
                                    m: f(l + 1),
                                    y: h.toString().substr(2, 2),
                                    Y: h,
                                    H: f(o),
                                    k: o,
                                    I: f(o % 12 || 12),
                                    l: o % 12 || 12,
                                    M: f(n[r.hcGetMinutes]()),
                                    p: 12 > o ? "AM" : "PM",
                                    P: 12 > o ? "am" : "pm",
                                    S: f(n.getSeconds()),
                                    L: f(Math.round(e % 1e3), 3)
                                }, c.dateFormats);
                            return c.objectEach(r, function(i, r) {
                                for (; - 1 !== t.indexOf("%" + r);) t = t.replace("%" + r, "function" == typeof i ? i(e) : i)
                            }), i ? t.substr(0, 1).toUpperCase() + t.substr(1) : t
                        }, c.formatSingle = function(t, e) {
                            var i = /\.([0-9])/,
                                r = c.defaultOptions.lang;
                            return /f$/.test(t) ? (i = (i = t.match(i)) ? i[1] : -1, null !== e && (e = c.numberFormat(e, i, r.decimalPoint, -1 < t.indexOf(",") ? r.thousandsSep : ""))) : e = c.dateFormat(t, e), e
                        }, c.format = function(t, e) {
                            for (var i, r, n, o, s, a = "{", l = !1, h = []; t && -1 !== (a = t.indexOf(a));) {
                                if (i = t.slice(0, a), l) {
                                    for (n = 0, o = (r = (i = i.split(":")).shift().split(".")).length, s = e; n < o; n++) s = s[r[n]];
                                    i.length && (s = c.formatSingle(i.join(":"), s)), h.push(s)
                                } else h.push(i);
                                t = t.slice(a + 1), a = (l = !l) ? "}" : "{"
                            }
                            return h.push(t), h.join("")
                        }, c.getMagnitude = function(t) {
                            return Math.pow(10, Math.floor(Math.log(t) / Math.LN10))
                        }, c.normalizeTickInterval = function(t, e, i, r, n) {
                            var o, s = t;
                            for (o = t / (i = c.pick(i, 1)), e || (e = n ? [1, 1.2, 1.5, 2, 2.5, 3, 4, 5, 6, 8, 10] : [1, 2, 2.5, 5, 10], !1 === r && (1 === i ? e = c.grep(e, function(t) {
                                    return 0 == t % 1
                                }) : .1 >= i && (e = [1 / i]))), r = 0; r < e.length && (s = e[r], (!n || !(s * i >= t)) && (n || !(o <= (e[r] + (e[r + 1] || e[r])) / 2))); r++);
                            return c.correctFloat(s * i, -Math.round(Math.log(.001) / Math.LN10))
                        }, c.stableSort = function(t, e) {
                            var i, r, n = t.length;
                            for (r = 0; r < n; r++) t[r].safeI = r;
                            for (t.sort(function(t, r) {
                                    return 0 === (i = e(t, r)) ? t.safeI - r.safeI : i
                                }), r = 0; r < n; r++) delete t[r].safeI
                        }, c.arrayMin = function(t) {
                            for (var e = t.length, i = t[0]; e--;) t[e] < i && (i = t[e]);
                            return i
                        }, c.arrayMax = function(t) {
                            for (var e = t.length, i = t[0]; e--;) t[e] > i && (i = t[e]);
                            return i
                        }, c.destroyObjectProperties = function(t, e) {
                            c.objectEach(t, function(i, r) {
                                i && i !== e && i.destroy && i.destroy(), delete t[r]
                            })
                        }, c.discardElement = function(t) {
                            var e = c.garbageBin;
                            e || (e = c.createElement("div")), t && e.appendChild(t), e.innerHTML = ""
                        }, c.correctFloat = function(t, e) {
                            return parseFloat(t.toPrecision(e || 14))
                        }, c.setAnimation = function(t, e) {
                            e.renderer.globalAnimation = c.pick(t, e.options.chart.animation, !0)
                        }, c.animObject = function(t) {
                            return c.isObject(t) ? c.merge(t) : {
                                duration: 500 * !!t
                            }
                        }, c.timeUnits = {
                            millisecond: 1,
                            second: 1e3,
                            minute: 6e4,
                            hour: 36e5,
                            day: 864e5,
                            week: 6048e5,
                            month: 24192e5,
                            year: 314496e5
                        }, c.numberFormat = function(t, e, i, r) {
                            t = +t || 0, e *= 1;
                            var n, o, s = c.defaultOptions.lang,
                                a = (t.toString().split(".")[1] || "").split("e")[0].length,
                                l = t.toString().split("e");
                            return -1 === e ? e = Math.min(a, 20) : c.isNumber(e) || (e = 2), o = (Math.abs(l[1] ? l[0] : t) + Math.pow(10, -Math.max(e, a) - 1)).toFixed(e), n = 3 < (a = String(c.pInt(o))).length ? a.length % 3 : 0, i = c.pick(i, s.decimalPoint), r = c.pick(r, s.thousandsSep), t = (0 > t ? "-" : "") + (n ? a.substr(0, n) + r : "") + a.substr(n).replace(/(\d{3})(?=\d)/g, "$1" + r), e && (t += i + o.slice(-e)), l[1] && (t += "e" + l[1]), t
                        }, Math.easeInOutSine = function(t) {
                            return -.5 * (Math.cos(Math.PI * t) - 1)
                        }, c.getStyle = function(t, e, i) {
                            return "width" === e ? Math.min(t.offsetWidth, t.scrollWidth) - c.getStyle(t, "padding-left") - c.getStyle(t, "padding-right") : "height" === e ? Math.min(t.offsetHeight, t.scrollHeight) - c.getStyle(t, "padding-top") - c.getStyle(t, "padding-bottom") : ((t = f.getComputedStyle(t, void 0)) && (t = t.getPropertyValue(e), c.pick(i, !0) && (t = c.pInt(t))), t)
                        }, c.inArray = function(t, e) {
                            return e.indexOf ? e.indexOf(t) : [].indexOf.call(e, t)
                        }, c.grep = function(t, e) {
                            return [].filter.call(t, e)
                        }, c.find = function(t, e) {
                            return [].find.call(t, e)
                        }, c.map = function(t, e) {
                            for (var i = [], r = 0, n = t.length; r < n; r++) i[r] = e.call(t[r], t[r], r, t);
                            return i
                        }, c.offset = function(t) {
                            var e = p.documentElement;
                            return {
                                top: (t = t.getBoundingClientRect()).top + (f.pageYOffset || e.scrollTop) - (e.clientTop || 0),
                                left: t.left + (f.pageXOffset || e.scrollLeft) - (e.clientLeft || 0)
                            }
                        }, c.stop = function(t, e) {
                            for (var i = d.length; i--;) d[i].elem !== t || e && e !== d[i].prop || (d[i].stopped = !0)
                        }, c.each = function(t, e, i) {
                            return Array.prototype.forEach.call(t, e, i)
                        }, c.objectEach = function(t, e, i) {
                            for (var r in t) t.hasOwnProperty(r) && e.call(i, t[r], r, t)
                        }, c.addEvent = function(t, e, i) {
                            function r(e) {
                                e.target = e.srcElement || f, i.call(t, e)
                            }
                            var n = t.hcEvents = t.hcEvents || {};
                            return t.addEventListener ? t.addEventListener(e, i, !1) : t.attachEvent && (t.hcEventsIE || (t.hcEventsIE = {}), i.hcGetKey || (i.hcGetKey = c.uniqueKey()), t.hcEventsIE[i.hcGetKey] = r, t.attachEvent("on" + e, r)), n[e] || (n[e] = []), n[e].push(i),
                                function() {
                                    c.removeEvent(t, e, i)
                                }
                        }, c.removeEvent = function(t, e, i) {
                            function r(e, i) {
                                t.removeEventListener ? t.removeEventListener(e, i, !1) : t.attachEvent && (i = t.hcEventsIE[i.hcGetKey], t.detachEvent("on" + e, i))
                            }

                            function n() {
                                var i, n;
                                t.nodeName && (e ? (i = {})[e] = !0 : i = a, c.objectEach(i, function(t, e) {
                                    if (a[e])
                                        for (n = a[e].length; n--;) r(e, a[e][n])
                                }))
                            }
                            var o, s, a = t.hcEvents;
                            a && (e ? (o = a[e] || [], i ? (-1 < (s = c.inArray(i, o)) && (o.splice(s, 1), a[e] = o), r(e, i)) : (n(), a[e] = [])) : (n(), t.hcEvents = {}))
                        }, c.fireEvent = function(t, e, i, r) {
                            var n, o, s;
                            if (n = t.hcEvents, i = i || {}, p.createEvent && (t.dispatchEvent || t.fireEvent))(n = p.createEvent("Events")).initEvent(e, !0, !0), c.extend(n, i), t.dispatchEvent ? t.dispatchEvent(n) : t.fireEvent(e, n);
                            else if (n)
                                for (o = (n = n[e] || []).length, i.target || c.extend(i, {
                                        preventDefault: function() {
                                            i.defaultPrevented = !0
                                        },
                                        target: t,
                                        type: e
                                    }), e = 0; e < o; e++)(s = n[e]) && !1 === s.call(t, i) && i.preventDefault();
                            r && !i.defaultPrevented && r(i)
                        }, c.animate = function(t, e, i) {
                            var r, n, o, s, a = "";
                            c.isObject(i) || (s = arguments, i = {
                                duration: s[2],
                                easing: s[3],
                                complete: s[4]
                            }), c.isNumber(i.duration) || (i.duration = 400), i.easing = "function" == typeof i.easing ? i.easing : Math[i.easing] || Math.easeInOutSine, i.curAnim = c.merge(e), c.objectEach(e, function(s, l) {
                                c.stop(t, l), o = new c.Fx(t, i, l), n = null, "d" === l ? (o.paths = o.initPath(t, t.d, e.d), o.toD = e.d, r = 0, n = 1) : t.attr ? r = t.attr(l) : (r = parseFloat(c.getStyle(t, l)) || 0, "opacity" !== l && (a = "px")), n || (n = s), n && n.match && n.match("px") && (n = n.replace(/px/g, "")), o.run(r, n, a)
                            })
                        }, c.seriesType = function(t, e, i, r, n) {
                            var o = c.getOptions(),
                                s = c.seriesTypes;
                            return o.plotOptions[t] = c.merge(o.plotOptions[e], i), s[t] = c.extendClass(s[e] || function() {}, r), s[t].prototype.type = t, n && (s[t].prototype.pointClass = c.extendClass(c.Point, n)), s[t]
                        }, g = Math.random().toString(36).substring(2, 9), m = 0, c.uniqueKey = function() {
                            return "highcharts-" + g + "-" + m++
                        }, f.jQuery && (f.jQuery.fn.highcharts = function() {
                            var t = [].slice.call(arguments);
                            if (this[0]) return t[0] ? (new c[c.isString(t[0]) ? t.shift() : "Chart"](this[0], t[0], t[1]), this) : u[c.attr(this[0], "data-highcharts-chart")]
                        }), p && !p.defaultView && (c.getStyle = function(t, e) {
                            var i = {
                                width: "clientWidth",
                                height: "clientHeight"
                            } [e];
                            return t.style[e] ? c.pInt(t.style[e]) : ("opacity" === e && (e = "filter"), i) ? (t.style.zoom = 1, Math.max(t[i] - 2 * c.getStyle(t, "padding"), 0)) : (t = t.currentStyle[e.replace(/\-(\w)/g, function(t, e) {
                                return e.toUpperCase()
                            })], "filter" === e && (t = t.replace(/alpha\(opacity=([0-9]+)\)/, function(t, e) {
                                return e / 100
                            })), "" === t ? 1 : c.pInt(t))
                        }), Array.prototype.forEach || (c.each = function(t, e, i) {
                            for (var r = 0, n = t.length; r < n; r++)
                                if (!1 === e.call(i, t[r], r, t)) return r
                        }), Array.prototype.indexOf || (c.inArray = function(t, e) {
                            var i, r = 0;
                            if (e) {
                                for (i = e.length; r < i; r++)
                                    if (e[r] === t) return r
                            }
                            return -1
                        }), Array.prototype.filter || (c.grep = function(t, e) {
                            for (var i = [], r = 0, n = t.length; r < n; r++) e(t[r], r) && i.push(t[r]);
                            return i
                        }), Array.prototype.find || (c.find = function(t, e) {
                            var i, r = t.length;
                            for (i = 0; i < r; i++)
                                if (e(t[i], i)) return t[i]
                        }), y = (v = t).each, b = v.isNumber, x = v.map, w = v.merge, k = v.pInt, v.Color = function(t) {
                            if (!o(this, v.Color)) return new v.Color(t);
                            this.init(t)
                        }, v.Color.prototype = {
                            parsers: [{
                                regex: /rgba\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]?(?:\.[0-9]+)?)\s*\)/,
                                parse: function(t) {
                                    return [k(t[1]), k(t[2]), k(t[3]), parseFloat(t[4], 10)]
                                }
                            }, {
                                regex: /rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/,
                                parse: function(t) {
                                    return [k(t[1]), k(t[2]), k(t[3]), 1]
                                }
                            }],
                            names: {
                                none: "rgba(255,255,255,0)",
                                white: "#ffffff",
                                black: "#000000"
                            },
                            init: function(t) {
                                var e, i, r, n;
                                if ((this.input = t = this.names[t && t.toLowerCase ? t.toLowerCase() : ""] || t) && t.stops) this.stops = x(t.stops, function(t) {
                                    return new v.Color(t[1])
                                });
                                else if (t && "#" === t.charAt() && (e = t.length, t = parseInt(t.substr(1), 16), 7 === e ? i = [(0xff0000 & t) >> 16, (65280 & t) >> 8, 255 & t, 1] : 4 === e && (i = [(3840 & t) >> 4 | (3840 & t) >> 8, (240 & t) >> 4 | 240 & t, (15 & t) << 4 | 15 & t, 1])), !i)
                                    for (r = this.parsers.length; r-- && !i;)(e = (n = this.parsers[r]).regex.exec(t)) && (i = n.parse(e));
                                this.rgba = i || []
                            },
                            get: function(t) {
                                var e, i = this.input,
                                    r = this.rgba;
                                return this.stops ? ((e = w(i)).stops = [].concat(e.stops), y(this.stops, function(i, r) {
                                    e.stops[r] = [e.stops[r][0], i.get(t)]
                                })) : e = r && b(r[0]) ? "rgb" !== t && (t || 1 !== r[3]) ? "a" === t ? r[3] : "rgba(" + r.join(",") + ")" : "rgb(" + r[0] + "," + r[1] + "," + r[2] + ")" : i, e
                            },
                            brighten: function(t) {
                                var e, i = this.rgba;
                                if (this.stops) y(this.stops, function(e) {
                                    e.brighten(t)
                                });
                                else if (b(t) && 0 !== t)
                                    for (e = 0; 3 > e; e++) i[e] += k(255 * t), 0 > i[e] && (i[e] = 0), 255 < i[e] && (i[e] = 255);
                                return this
                            },
                            setOpacity: function(t) {
                                return this.rgba[3] = t, this
                            },
                            tweenTo: function(t, e) {
                                var i, r;
                                return t.rgba.length ? (i = this.rgba, t = ((r = 1 !== (t = t.rgba)[3] || 1 !== i[3]) ? "rgba(" : "rgb(") + Math.round(t[0] + (i[0] - t[0]) * (1 - e)) + "," + Math.round(t[1] + (i[1] - t[1]) * (1 - e)) + "," + Math.round(t[2] + (i[2] - t[2]) * (1 - e)) + (r ? "," + (t[3] + (i[3] - t[3]) * (1 - e)) : "") + ")") : t = t.input || "none", t
                            }
                        }, v.color = function(t) {
                            return new v.Color(t)
                        }, A = (S = t).addEvent, T = S.animate, P = S.attr, O = S.charts, I = S.color, L = S.css, D = S.createElement, E = S.defined, j = S.deg2rad, N = S.destroyObjectProperties, R = S.doc, B = S.each, z = S.extend, G = S.erase, W = S.grep, H = S.hasTouch, F = S.inArray, X = S.isArray, Y = S.isFirefox, V = S.isMS, U = S.isObject, _ = S.isString, K = S.isWebKit, q = S.merge, $ = S.noop, Z = S.objectEach, J = S.pick, Q = S.pInt, tt = S.removeEvent, te = S.stop, ti = S.svg, tr = S.SVG_NS, tn = S.symbolSizes, to = S.win, z((M = S.SVGElement = function() {
                            return this
                        }).prototype, {
                            opacity: 1,
                            SVG_NS: tr,
                            textProps: "direction fontSize fontWeight fontFamily fontStyle color lineHeight width textAlign textDecoration textOverflow textOutline".split(" "),
                            init: function(t, e) {
                                this.element = "span" === e ? D(e) : R.createElementNS(this.SVG_NS, e), this.renderer = t
                            },
                            animate: function(t, e, i) {
                                return 0 !== (e = S.animObject(J(e, this.renderer.globalAnimation, !0))).duration ? (i && (e.complete = i), T(this, t, e)) : (this.attr(t, null, i), e.step && e.step.call(this)), this
                            },
                            colorGradient: function(t, e, i) {
                                var r, n, o, s, a, l, h, c, d, u, p, f = this.renderer,
                                    g = [];
                                t.radialGradient ? n = "radialGradient" : t.linearGradient && (n = "linearGradient"), n && (o = t[n], a = f.gradients, h = t.stops, u = i.radialReference, X(o) && (t[n] = o = {
                                    x1: o[0],
                                    y1: o[1],
                                    x2: o[2],
                                    y2: o[3],
                                    gradientUnits: "userSpaceOnUse"
                                }), "radialGradient" === n && u && !E(o.gradientUnits) && (s = o, o = q(o, f.getRadialAttr(u, s), {
                                    gradientUnits: "userSpaceOnUse"
                                })), Z(o, function(t, e) {
                                    "id" !== e && g.push(e, t)
                                }), Z(h, function(t) {
                                    g.push(t)
                                }), a[g = g.join(",")] ? u = a[g].attr("id") : (o.id = u = S.uniqueKey(), a[g] = l = f.createElement(n).attr(o).add(f.defs), l.radAttr = s, l.stops = [], B(h, function(t) {
                                    0 === t[1].indexOf("rgba") ? (c = (r = S.color(t[1])).get("rgb"), d = r.get("a")) : (c = t[1], d = 1), t = f.createElement("stop").attr({
                                        offset: t[0],
                                        "stop-color": c,
                                        "stop-opacity": d
                                    }).add(l), l.stops.push(t)
                                })), p = "url(" + f.url + "#" + u + ")", i.setAttribute(e, p), i.gradient = g, t.toString = function() {
                                    return p
                                })
                            },
                            applyTextOutline: function(t) {
                                var e, i, r, n, o, s = this.element;
                                if (-1 !== t.indexOf("contrast") && (t = t.replace(/contrast/g, this.renderer.getContrast(s.style.fill))), i = (t = t.split(" "))[t.length - 1], (r = t[0]) && "none" !== r && S.svg) {
                                    for (this.fakeTS = !0, t = [].slice.call(s.getElementsByTagName("tspan")), this.ySetter = this.xSetter, r = r.replace(/(^[\d\.]+)(.*?)$/g, function(t, e, i) {
                                            return 2 * e + i
                                        }), o = t.length; o--;) "highcharts-text-outline" === (e = t[o]).getAttribute("class") && G(t, s.removeChild(e));
                                    n = s.firstChild, B(t, function(t, e) {
                                        0 === e && (t.setAttribute("x", s.getAttribute("x")), e = s.getAttribute("y"), t.setAttribute("y", e || 0), null === e && s.setAttribute("y", 0)), P(t = t.cloneNode(1), {
                                            class: "highcharts-text-outline",
                                            fill: i,
                                            stroke: i,
                                            "stroke-width": r,
                                            "stroke-linejoin": "round"
                                        }), s.insertBefore(t, n)
                                    })
                                }
                            },
                            attr: function(t, e, i, r) {
                                var n, o, s, a, l = this.element,
                                    h = this;
                                return "string" == typeof t && void 0 !== e && (n = t, (t = {})[n] = e), "string" == typeof t ? h = (this[t + "Getter"] || this._defaultGetter).call(this, t, l) : (Z(t, function(e, i) {
                                    s = !1, r || te(this, i), this.symbolName && /^(x|y|width|height|r|start|end|innerR|anchorX|anchorY)$/.test(i) && (o || (this.symbolAttr(t), o = !0), s = !0), this.rotation && ("x" === i || "y" === i) && (this.doTransform = !0), s || ((a = this[i + "Setter"] || this._defaultSetter).call(this, e, i, l), this.shadows && /^(width|height|visibility|x|y|d|transform|cx|cy|r)$/.test(i) && this.updateShadows(i, e, a))
                                }, this), this.afterSetters()), i && i(), h
                            },
                            afterSetters: function() {
                                this.doTransform && (this.updateTransform(), this.doTransform = !1)
                            },
                            updateShadows: function(t, e, i) {
                                for (var r = this.shadows, n = r.length; n--;) i.call(r[n], "height" === t ? Math.max(e - (r[n].cutHeight || 0), 0) : "d" === t ? this.d : e, t, r[n])
                            },
                            addClass: function(t, e) {
                                var i = this.attr("class") || "";
                                return -1 === i.indexOf(t) && (e || (t = (i + (i ? " " : "") + t).replace("  ", " ")), this.attr("class", t)), this
                            },
                            hasClass: function(t) {
                                return -1 !== F(t, (this.attr("class") || "").split(" "))
                            },
                            removeClass: function(t) {
                                return this.attr("class", (this.attr("class") || "").replace(t, ""))
                            },
                            symbolAttr: function(t) {
                                var e = this;
                                B("x y r start end width height innerR anchorX anchorY".split(" "), function(i) {
                                    e[i] = J(t[i], e[i])
                                }), e.attr({
                                    d: e.renderer.symbols[e.symbolName](e.x, e.y, e.width, e.height, e)
                                })
                            },
                            clip: function(t) {
                                return this.attr("clip-path", t ? "url(" + this.renderer.url + "#" + t.id + ")" : "none")
                            },
                            crisp: function(t, e) {
                                var i, r = this,
                                    n = {};
                                return i = Math.round(e = e || t.strokeWidth || 0) % 2 / 2, t.x = Math.floor(t.x || r.x || 0) + i, t.y = Math.floor(t.y || r.y || 0) + i, t.width = Math.floor((t.width || r.width || 0) - 2 * i), t.height = Math.floor((t.height || r.height || 0) - 2 * i), E(t.strokeWidth) && (t.strokeWidth = e), Z(t, function(t, e) {
                                    r[e] !== t && (r[e] = n[e] = t)
                                }), n
                            },
                            css: function(t) {
                                var e, i, r = this.styles,
                                    n = {},
                                    o = this.element,
                                    s = "",
                                    a = !r,
                                    l = ["textOutline", "textOverflow", "width"];
                                return t && t.color && (t.fill = t.color), r && Z(t, function(t, e) {
                                    t !== r[e] && (n[e] = t, a = !0)
                                }), a && (r && (t = z(r, n)), e = this.textWidth = t && t.width && "auto" !== t.width && "text" === o.nodeName.toLowerCase() && Q(t.width), this.styles = t, e && !ti && this.renderer.forExport && delete t.width, V && !ti ? L(this.element, t) : (i = function(t, e) {
                                    return "-" + e.toLowerCase()
                                }, Z(t, function(t, e) {
                                    -1 === F(e, l) && (s += e.replace(/([A-Z])/g, i) + ":" + t + ";")
                                }), s && P(o, "style", s)), this.added && ("text" === this.element.nodeName && this.renderer.buildText(this), t && t.textOutline && this.applyTextOutline(t.textOutline))), this
                            },
                            strokeWidth: function() {
                                return this["stroke-width"] || 0
                            },
                            on: function(t, e) {
                                var i = this,
                                    r = i.element;
                                return H && "click" === t ? (r.ontouchstart = function(t) {
                                    i.touchEventFired = Date.now(), t.preventDefault(), e.call(r, t)
                                }, r.onclick = function(t) {
                                    (-1 === to.navigator.userAgent.indexOf("Android") || 1100 < Date.now() - (i.touchEventFired || 0)) && e.call(r, t)
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
                            invert: function(t) {
                                return this.inverted = t, this.updateTransform(), this
                            },
                            updateTransform: function() {
                                var t = this.translateX || 0,
                                    e = this.translateY || 0,
                                    i = this.scaleX,
                                    r = this.scaleY,
                                    n = this.inverted,
                                    o = this.rotation,
                                    s = this.element;
                                n && (t += this.width, e += this.height), t = ["translate(" + t + "," + e + ")"], n ? t.push("rotate(90) scale(-1,1)") : o && t.push("rotate(" + o + " " + (s.getAttribute("x") || 0) + " " + (s.getAttribute("y") || 0) + ")"), (E(i) || E(r)) && t.push("scale(" + J(i, 1) + " " + J(r, 1) + ")"), t.length && s.setAttribute("transform", t.join(" "))
                            },
                            toFront: function() {
                                var t = this.element;
                                return t.parentNode.appendChild(t), this
                            },
                            align: function(t, e, i) {
                                var r, n, o, s, a, l, h = {};
                                return a = (s = this.renderer).alignedObjects, t ? (this.alignOptions = t, this.alignByTranslate = e, (!i || _(i)) && (this.alignTo = o = i || "renderer", G(a, this), a.push(this), i = null)) : (t = this.alignOptions, e = this.alignByTranslate, o = this.alignTo), i = J(i, s[o], s), o = t.align, s = t.verticalAlign, a = (i.x || 0) + (t.x || 0), l = (i.y || 0) + (t.y || 0), "right" === o ? r = 1 : "center" === o && (r = 2), r && (a += (i.width - (t.width || 0)) / r), h[e ? "translateX" : "x"] = Math.round(a), "bottom" === s ? n = 1 : "middle" === s && (n = 2), n && (l += (i.height - (t.height || 0)) / n), h[e ? "translateY" : "y"] = Math.round(l), this[this.placed ? "animate" : "attr"](h), this.placed = !0, this.alignAttr = h, this
                            },
                            getBBox: function(t, e) {
                                var i, r, n, o, s, a = this.renderer,
                                    l = this.element,
                                    h = this.styles,
                                    c = this.textStr,
                                    d = a.cache,
                                    u = a.cacheKeys;
                                if (r = (e = J(e, this.rotation)) * j, n = h && h.fontSize, void 0 !== c && (-1 === (s = c.toString()).indexOf("<") && (s = s.replace(/[0-9]/g, "0")), s += ["", e || 0, n, h && h.width, h && h.textOverflow].join()), s && !t && (i = d[s]), !i) {
                                    if (l.namespaceURI === this.SVG_NS || a.forExport) {
                                        try {
                                            (o = this.fakeTS && function(t) {
                                                B(l.querySelectorAll(".highcharts-text-outline"), function(e) {
                                                    e.style.display = t
                                                })
                                            }) && o("none"), i = l.getBBox ? z({}, l.getBBox()) : {
                                                width: l.offsetWidth,
                                                height: l.offsetHeight
                                            }, o && o("")
                                        } catch (t) {}(!i || 0 > i.width) && (i = {
                                            width: 0,
                                            height: 0
                                        })
                                    } else i = this.htmlGetBBox();
                                    if (a.isSVG && (t = i.width, a = i.height, h && "11px" === h.fontSize && 17 === Math.round(a) && (i.height = a = 14), e && (i.width = Math.abs(a * Math.sin(r)) + Math.abs(t * Math.cos(r)), i.height = Math.abs(a * Math.cos(r)) + Math.abs(t * Math.sin(r)))), s && 0 < i.height) {
                                        for (; 250 < u.length;) delete d[u.shift()];
                                        d[s] || u.push(s), d[s] = i
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
                                var t = this,
                                    e = t.element || {},
                                    i = t.renderer.isSVG && "SPAN" === e.nodeName && t.parentGroup,
                                    r = e.ownerSVGElement;
                                if (e.onclick = e.onmouseout = e.onmouseover = e.onmousemove = e.point = null, te(t), t.clipPath && r && (B(r.querySelectorAll("[clip-path]"), function(e) {
                                        -1 < e.getAttribute("clip-path").indexOf(t.clipPath.element.id + ")") && e.removeAttribute("clip-path")
                                    }), t.clipPath = t.clipPath.destroy()), t.stops) {
                                    for (r = 0; r < t.stops.length; r++) t.stops[r] = t.stops[r].destroy();
                                    t.stops = null
                                }
                                for (t.safeRemoveChild(e), t.destroyShadows(); i && i.div && 0 === i.div.childNodes.length;) e = i.parentGroup, t.safeRemoveChild(i.div), delete i.div, i = e;
                                return t.alignTo && G(t.renderer.alignedObjects, t), Z(t, function(e, i) {
                                    delete t[i]
                                }), null
                            },
                            shadow: function(t, e, i) {
                                var r, n, o, s, a, l, h = [],
                                    c = this.element;
                                if (t) {
                                    if (!this.shadows) {
                                        for (r = 1, s = J(t.width, 3), a = (t.opacity || .15) / s, l = this.parentInverted ? "(-1,-1)" : "(" + J(t.offsetX, 1) + ", " + J(t.offsetY, 1) + ")"; r <= s; r++) n = c.cloneNode(0), o = 2 * s + 1 - 2 * r, P(n, {
                                            isShadow: "true",
                                            stroke: t.color || "#000000",
                                            "stroke-opacity": a * r,
                                            "stroke-width": o,
                                            transform: "translate" + l,
                                            fill: "none"
                                        }), i && (P(n, "height", Math.max(P(n, "height") - o, 0)), n.cutHeight = o), e ? e.element.appendChild(n) : c.parentNode.insertBefore(n, c), h.push(n);
                                        this.shadows = h
                                    }
                                } else this.destroyShadows();
                                return this
                            },
                            destroyShadows: function() {
                                B(this.shadows || [], function(t) {
                                    this.safeRemoveChild(t)
                                }, this), this.shadows = void 0
                            },
                            xGetter: function(t) {
                                return "circle" === this.element.nodeName && ("x" === t ? t = "cx" : "y" === t && (t = "cy")), this._defaultGetter(t)
                            },
                            _defaultGetter: function(t) {
                                return t = J(this[t], this.element ? this.element.getAttribute(t) : null, 0), /^[\-0-9\.]+$/.test(t) && (t = parseFloat(t)), t
                            },
                            dSetter: function(t, e, i) {
                                t && t.join && (t = t.join(" ")), /(NaN| {2}|^$)/.test(t) && (t = "M 0 0"), this[e] !== t && (i.setAttribute(e, t), this[e] = t)
                            },
                            dashstyleSetter: function(t) {
                                var e, i = this["stroke-width"];
                                if ("inherit" === i && (i = 1), t = t && t.toLowerCase()) {
                                    for (e = (t = t.replace("shortdashdotdot", "3,1,1,1,1,1,").replace("shortdashdot", "3,1,1,1").replace("shortdot", "1,1,").replace("shortdash", "3,1,").replace("longdash", "8,3,").replace(/dot/g, "1,3,").replace("dash", "4,3,").replace(/,$/, "").split(",")).length; e--;) t[e] = Q(t[e]) * i;
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
                            opacitySetter: function(t, e, i) {
                                this[e] = t, i.setAttribute(e, t)
                            },
                            titleSetter: function(t) {
                                var e = this.element.getElementsByTagName("title")[0];
                                e || (e = R.createElementNS(this.SVG_NS, "title"), this.element.appendChild(e)), e.firstChild && e.removeChild(e.firstChild), e.appendChild(R.createTextNode(String(J(t), "").replace(/<[^>]*>/g, "")))
                            },
                            textSetter: function(t) {
                                t !== this.textStr && (delete this.bBox, this.textStr = t, this.added && this.renderer.buildText(this))
                            },
                            fillSetter: function(t, e, i) {
                                "string" == typeof t ? i.setAttribute(e, t) : t && this.colorGradient(t, e, i)
                            },
                            visibilitySetter: function(t, e, i) {
                                "inherit" === t ? i.removeAttribute(e) : this[e] !== t && i.setAttribute(e, t), this[e] = t
                            },
                            zIndexSetter: function(t, e) {
                                var i, r, n, o = this.renderer,
                                    s = this.parentGroup,
                                    a = (s || o).element || o.box,
                                    l = this.element;
                                if (r = this.added, E(t) && (l.zIndex = t, t *= 1, this[e] === t && (r = !1), this[e] = t), r) {
                                    for ((t = this.zIndex) && s && (s.handleZ = !0), e = a.childNodes, i = 0; i < e.length && !n; i++) r = (s = e[i]).zIndex, s !== l && (Q(r) > t || !E(t) && E(r) || 0 > t && !E(r) && a !== o.box) && (a.insertBefore(l, s), n = !0);
                                    n || a.appendChild(l)
                                }
                                return n
                            },
                            _defaultSetter: function(t, e, i) {
                                i.setAttribute(e, t)
                            }
                        }), M.prototype.yGetter = M.prototype.xGetter, M.prototype.translateXSetter = M.prototype.translateYSetter = M.prototype.rotationSetter = M.prototype.verticalAlignSetter = M.prototype.scaleXSetter = M.prototype.scaleYSetter = function(t, e) {
                            this[e] = t, this.doTransform = !0
                        }, M.prototype["stroke-widthSetter"] = M.prototype.strokeSetter = function(t, e, i) {
                            this[e] = t, this.stroke && this["stroke-width"] ? (M.prototype.fillSetter.call(this, this.stroke, "stroke", i), i.setAttribute("stroke-width", this["stroke-width"]), this.hasStroke = !0) : "stroke-width" === e && 0 === t && this.hasStroke && (i.removeAttribute("stroke"), this.hasStroke = !1)
                        }, z((C = S.SVGRenderer = function() {
                            this.init.apply(this, arguments)
                        }).prototype, {
                            Element: M,
                            SVG_NS: tr,
                            init: function(t, e, i, r, n, o) {
                                var s, a;
                                s = (r = this.createElement("svg").attr({
                                    version: "1.1",
                                    class: "highcharts-root"
                                }).css(this.getStyle(r))).element, t.appendChild(s), -1 === t.innerHTML.indexOf("xmlns") && P(s, "xmlns", this.SVG_NS), this.isSVG = !0, this.box = s, this.boxWrapper = r, this.alignedObjects = [], this.url = (Y || K) && R.getElementsByTagName("base").length ? to.location.href.replace(/#.*?$/, "").replace(/<[^>]*>/g, "").replace(/([\('\)])/g, "\\$1").replace(/ /g, "%20") : "", this.createElement("desc").add().element.appendChild(R.createTextNode("Created with Highcharts 5.0.14")), this.defs = this.createElement("defs").add(), this.allowHTML = o, this.forExport = n, this.gradients = {}, this.cache = {}, this.cacheKeys = [], this.imgCount = 0, this.setSize(e, i, !1), Y && t.getBoundingClientRect && ((e = function() {
                                    L(t, {
                                        left: 0,
                                        top: 0
                                    }), a = t.getBoundingClientRect(), L(t, {
                                        left: Math.ceil(a.left) - a.left + "px",
                                        top: Math.ceil(a.top) - a.top + "px"
                                    })
                                })(), this.unSubPixelFix = A(to, "resize", e))
                            },
                            getStyle: function(t) {
                                return this.style = z({
                                    fontFamily: '"Lucida Grande", "Lucida Sans Unicode", Arial, Helvetica, sans-serif',
                                    fontSize: "12px"
                                }, t)
                            },
                            setStyle: function(t) {
                                this.boxWrapper.css(this.getStyle(t))
                            },
                            isHidden: function() {
                                return !this.boxWrapper.getBBox().width
                            },
                            destroy: function() {
                                var t = this.defs;
                                return this.box = null, this.boxWrapper = this.boxWrapper.destroy(), N(this.gradients || {}), this.gradients = null, t && (this.defs = t.destroy()), this.unSubPixelFix && this.unSubPixelFix(), this.alignedObjects = null
                            },
                            createElement: function(t) {
                                var e = new this.Element;
                                return e.init(this, t), e
                            },
                            draw: $,
                            getRadialAttr: function(t, e) {
                                return {
                                    cx: t[0] - t[2] / 2 + e.cx * t[2],
                                    cy: t[1] - t[2] / 2 + e.cy * t[2],
                                    r: e.r * t[2]
                                }
                            },
                            getSpanWidth: function(t, e) {
                                var i = t.getBBox(!0).width;
                                return !ti && this.forExport && (i = this.measureSpanWidth(e.firstChild.data, t.styles)), i
                            },
                            applyEllipsis: function(t, e, i, r) {
                                var n, o, s = t.rotation,
                                    a = i,
                                    l = 0,
                                    h = i.length,
                                    c = function(t) {
                                        e.removeChild(e.firstChild), t && e.appendChild(R.createTextNode(t))
                                    };
                                if (t.rotation = 0, o = (a = this.getSpanWidth(t, e)) > r) {
                                    for (; l <= h;) n = Math.ceil((l + h) / 2), c(a = i.substring(0, n) + "…"), a = this.getSpanWidth(t, e), l === h ? l = h + 1 : a > r ? h = n - 1 : l = n;
                                    0 === h && c("")
                                }
                                return t.rotation = s, o
                            },
                            buildText: function(t) {
                                var e, i, r, n, o, s, a = t.element,
                                    l = this,
                                    h = l.forExport,
                                    c = J(t.textStr, "").toString(),
                                    d = -1 !== c.indexOf("<"),
                                    u = a.childNodes,
                                    p = P(a, "x"),
                                    f = t.styles,
                                    g = t.textWidth,
                                    m = f && f.lineHeight,
                                    v = f && f.textOutline,
                                    y = f && "ellipsis" === f.textOverflow,
                                    b = f && "nowrap" === f.whiteSpace,
                                    x = f && f.fontSize,
                                    w = u.length,
                                    f = g && !t.added && this.box,
                                    k = function(t) {
                                        var e;
                                        return e = /(px|em)$/.test(t && t.style.fontSize) ? t.style.fontSize : x || l.style.fontSize || 12, m ? Q(m) : l.fontMetrics(e, t.getAttribute("style") ? t : a).h
                                    };
                                if ((o = [c, y, b, m, v, x, g].join()) !== t.textCache) {
                                    for (t.textCache = o; w--;) a.removeChild(u[w]);
                                    d || v || y || g || -1 !== c.indexOf(" ") ? (e = /<.*class="([^"]+)".*>/, i = /<.*style="([^"]+)".*>/, r = /<.*href="([^"]+)".*>/, f && f.appendChild(a), B(c = W(c = d ? c.replace(/<(b|strong)>/g, '<span style="font-weight:bold">').replace(/<(i|em)>/g, '<span style="font-style:italic">').replace(/<a/g, "<span").replace(/<\/(b|strong|i|em|a)>/g, "</span>").split(/<br.*?>/g) : [c], function(t) {
                                        return "" !== t
                                    }), function(o, c) {
                                        var d, u = 0;
                                        B(d = (o = o.replace(/^\s+|\s+$/g, "").replace(/<span/g, "|||<span").replace(/<\/span>/g, "</span>|||")).split("|||"), function(o) {
                                            if ("" !== o || 1 === d.length) {
                                                var f, m, v = {},
                                                    x = R.createElementNS(l.SVG_NS, "tspan");
                                                if (e.test(o) && P(x, "class", f = o.match(e)[1]), i.test(o) && P(x, "style", m = o.match(i)[1].replace(/(;| |^)color([ :])/, "$1fill$2")), r.test(o) && !h && (P(x, "onclick", 'location.href="' + o.match(r)[1] + '"'), L(x, {
                                                        cursor: "pointer"
                                                    })), " " !== (o = (o.replace(/<(.|\n)*?>/g, "") || " ").replace(/&lt;/g, "<").replace(/&gt;/g, ">"))) {
                                                    if (x.appendChild(R.createTextNode(o)), u ? v.dx = 0 : c && null !== p && (v.x = p), P(x, v), a.appendChild(x), !u && s && (!ti && h && L(x, {
                                                            display: "block"
                                                        }), P(x, "dy", k(x))), g) {
                                                        v = o.replace(/([^\^])-/g, "$1- ").split(" "), f = 1 < d.length || c || 1 < v.length && !b;
                                                        var w, S = [],
                                                            M = k(x),
                                                            C = t.rotation;
                                                        for (y && (n = l.applyEllipsis(t, x, o, g)); !y && f && (v.length || S.length);) t.rotation = 0, o = (w = l.getSpanWidth(t, x)) > g, void 0 === n && (n = o), o && 1 !== v.length ? (x.removeChild(x.firstChild), S.unshift(v.pop())) : (v = S, S = [], v.length && !b && (P(x = R.createElementNS(tr, "tspan"), {
                                                            dy: M,
                                                            x: p
                                                        }), m && P(x, "style", m), a.appendChild(x)), w > g && (g = w)), v.length && x.appendChild(R.createTextNode(v.join(" ").replace(/- /g, "-")));
                                                        t.rotation = C
                                                    }
                                                    u++
                                                }
                                            }
                                        }), s = s || a.childNodes.length
                                    }), n && t.attr("title", t.textStr), f && f.removeChild(a), v && t.applyTextOutline && t.applyTextOutline(v)) : a.appendChild(R.createTextNode(c.replace(/&lt;/g, "<").replace(/&gt;/g, ">")))
                                }
                            },
                            getContrast: function(t) {
                                return 510 < (t = I(t).rgba)[0] + t[1] + t[2] ? "#000000" : "#FFFFFF"
                            },
                            button: function(t, e, i, r, n, o, s, a, l) {
                                var h, c, d, u, p = this.label(t, e, i, l, null, null, null, null, "button"),
                                    f = 0;
                                return p.attr(q({
                                    padding: 8,
                                    r: 2
                                }, n)), h = (n = q({
                                    fill: "#f7f7f7",
                                    stroke: "#cccccc",
                                    "stroke-width": 1,
                                    style: {
                                        color: "#333333",
                                        cursor: "pointer",
                                        fontWeight: "normal"
                                    }
                                }, n)).style, delete n.style, c = (o = q(n, {
                                    fill: "#e6e6e6"
                                }, o)).style, delete o.style, d = (s = q(n, {
                                    fill: "#e6ebf5",
                                    style: {
                                        color: "#000000",
                                        fontWeight: "bold"
                                    }
                                }, s)).style, delete s.style, u = (a = q(n, {
                                    style: {
                                        color: "#cccccc"
                                    }
                                }, a)).style, delete a.style, A(p.element, V ? "mouseover" : "mouseenter", function() {
                                    3 !== f && p.setState(1)
                                }), A(p.element, V ? "mouseout" : "mouseleave", function() {
                                    3 !== f && p.setState(f)
                                }), p.setState = function(t) {
                                    1 !== t && (p.state = f = t), p.removeClass(/highcharts-button-(normal|hover|pressed|disabled)/).addClass("highcharts-button-" + ["normal", "hover", "pressed", "disabled"][t || 0]), p.attr([n, o, s, a][t || 0]).css([h, c, d, u][t || 0])
                                }, p.attr(n).css(z({
                                    cursor: "default"
                                }, h)), p.on("click", function(t) {
                                    3 !== f && r.call(p, t)
                                })
                            },
                            crispLine: function(t, e) {
                                return t[1] === t[4] && (t[1] = t[4] = Math.round(t[1]) - e % 2 / 2), t[2] === t[5] && (t[2] = t[5] = Math.round(t[2]) + e % 2 / 2), t
                            },
                            path: function(t) {
                                var e = {
                                    fill: "none"
                                };
                                return X(t) ? e.d = t : U(t) && z(e, t), this.createElement("path").attr(e)
                            },
                            circle: function(t, e, i) {
                                return t = U(t) ? t : {
                                    x: t,
                                    y: e,
                                    r: i
                                }, (e = this.createElement("circle")).xSetter = e.ySetter = function(t, e, i) {
                                    i.setAttribute("c" + e, t)
                                }, e.attr(t)
                            },
                            arc: function(t, e, i, r, n, o) {
                                return U(t) ? (e = (r = t).y, i = r.r, t = r.x) : r = {
                                    innerR: r,
                                    start: n,
                                    end: o
                                }, (t = this.symbol("arc", t, e, i, i, r)).r = i, t
                            },
                            rect: function(t, e, i, r, n, o) {
                                n = U(t) ? t.r : n;
                                var s = this.createElement("rect");
                                return t = U(t) ? t : void 0 === t ? {} : {
                                    x: t,
                                    y: e,
                                    width: Math.max(i, 0),
                                    height: Math.max(r, 0)
                                }, void 0 !== o && (t.strokeWidth = o, t = s.crisp(t)), t.fill = "none", n && (t.r = n), s.rSetter = function(t, e, i) {
                                    P(i, {
                                        rx: t,
                                        ry: t
                                    })
                                }, s.attr(t)
                            },
                            setSize: function(t, e, i) {
                                var r = this.alignedObjects,
                                    n = r.length;
                                for (this.width = t, this.height = e, this.boxWrapper.animate({
                                        width: t,
                                        height: e
                                    }, {
                                        step: function() {
                                            this.attr({
                                                viewBox: "0 0 " + this.attr("width") + " " + this.attr("height")
                                            })
                                        },
                                        duration: J(i, !0) ? void 0 : 0
                                    }); n--;) r[n].align()
                            },
                            g: function(t) {
                                var e = this.createElement("g");
                                return t ? e.attr({
                                    class: "highcharts-" + t
                                }) : e
                            },
                            image: function(t, e, i, r, n) {
                                var o = {
                                    preserveAspectRatio: "none"
                                };
                                return 1 < arguments.length && z(o, {
                                    x: e,
                                    y: i,
                                    width: r,
                                    height: n
                                }), (o = this.createElement("image").attr(o)).element.setAttributeNS ? o.element.setAttributeNS("http://www.w3.org/1999/xlink", "href", t) : o.element.setAttribute("hc-svg-href", t), o
                            },
                            symbol: function(t, e, i, r, n, o) {
                                var s, a, l, h = this,
                                    c = /^url\((.*?)\)$/,
                                    d = c.test(t),
                                    u = !d && (this.symbols[t] ? t : "circle"),
                                    p = u && this.symbols[u],
                                    f = E(e) && p && p.call(this.symbols, Math.round(e), Math.round(i), r, n, o);
                                return p ? ((s = this.path(f)).attr("fill", "none"), z(s, {
                                    symbolName: u,
                                    x: e,
                                    y: i,
                                    width: r,
                                    height: n
                                }), o && z(s, o)) : d && (a = t.match(c)[1], (s = this.image(a)).imgwidth = J(tn[a] && tn[a].width, o && o.width), s.imgheight = J(tn[a] && tn[a].height, o && o.height), l = function() {
                                    s.attr({
                                        width: s.width,
                                        height: s.height
                                    })
                                }, B(["width", "height"], function(t) {
                                    s[t + "Setter"] = function(t, e) {
                                        var i = {},
                                            r = this["img" + e],
                                            n = "width" === e ? "translateX" : "translateY";
                                        this[e] = t, E(r) && (this.element && this.element.setAttribute(e, r), this.alignByTranslate || (i[n] = ((this[e] || 0) - r) / 2, this.attr(i)))
                                    }
                                }), E(e) && s.attr({
                                    x: e,
                                    y: i
                                }), s.isImg = !0, E(s.imgwidth) && E(s.imgheight) ? l() : (s.attr({
                                    width: 0,
                                    height: 0
                                }), D("img", {
                                    onload: function() {
                                        var t = O[h.chartIndex];
                                        0 === this.width && (L(this, {
                                            position: "absolute",
                                            top: "-999em"
                                        }), R.body.appendChild(this)), tn[a] = {
                                            width: this.width,
                                            height: this.height
                                        }, s.imgwidth = this.width, s.imgheight = this.height, s.element && l(), this.parentNode && this.parentNode.removeChild(this), h.imgCount--, !h.imgCount && t && t.onload && t.onload()
                                    },
                                    src: a
                                }), this.imgCount++)), s
                            },
                            symbols: {
                                circle: function(t, e, i, r) {
                                    return this.arc(t + i / 2, e + r / 2, i / 2, r / 2, {
                                        start: 0,
                                        end: 2 * Math.PI,
                                        open: !1
                                    })
                                },
                                square: function(t, e, i, r) {
                                    return ["M", t, e, "L", t + i, e, t + i, e + r, t, e + r, "Z"]
                                },
                                triangle: function(t, e, i, r) {
                                    return ["M", t + i / 2, e, "L", t + i, e + r, t, e + r, "Z"]
                                },
                                "triangle-down": function(t, e, i, r) {
                                    return ["M", t, e, "L", t + i, e, t + i / 2, e + r, "Z"]
                                },
                                diamond: function(t, e, i, r) {
                                    return ["M", t + i / 2, e, "L", t + i, e + r / 2, t + i / 2, e + r, t, e + r / 2, "Z"]
                                },
                                arc: function(t, e, i, r, n) {
                                    var o = n.start,
                                        s = n.r || i,
                                        a = n.r || r || i,
                                        l = n.end - .001;
                                    i = n.innerR, r = J(n.open, .001 > Math.abs(n.end - n.start - 2 * Math.PI));
                                    var h = Math.cos(o),
                                        c = Math.sin(o),
                                        d = Math.cos(l),
                                        l = Math.sin(l);
                                    return s = ["M", t + s * h, e + a * c, "A", s, a, 0, n = .001 > n.end - o - Math.PI ? 0 : 1, 1, t + s * d, e + a * l], E(i) && s.push(r ? "M" : "L", t + i * d, e + i * l, "A", i, i, 0, n, 0, t + i * h, e + i * c), s.push(r ? "" : "Z"), s
                                },
                                callout: function(t, e, i, r, n) {
                                    var o, s = Math.min(n && n.r || 0, i, r),
                                        a = s + 6,
                                        l = n && n.anchorX;
                                    return n = n && n.anchorY, o = ["M", t + s, e, "L", t + i - s, e, "C", t + i, e, t + i, e, t + i, e + s, "L", t + i, e + r - s, "C", t + i, e + r, t + i, e + r, t + i - s, e + r, "L", t + s, e + r, "C", t, e + r, t, e + r, t, e + r - s, "L", t, e + s, "C", t, e, t, e, t + s, e], l && l > i ? n > e + a && n < e + r - a ? o.splice(13, 3, "L", t + i, n - 6, t + i + 6, n, t + i, n + 6, t + i, e + r - s) : o.splice(13, 3, "L", t + i, r / 2, l, n, t + i, r / 2, t + i, e + r - s) : l && 0 > l ? n > e + a && n < e + r - a ? o.splice(33, 3, "L", t, n + 6, t - 6, n, t, n - 6, t, e + s) : o.splice(33, 3, "L", t, r / 2, l, n, t, r / 2, t, e + s) : n && n > r && l > t + a && l < t + i - a ? o.splice(23, 3, "L", l + 6, e + r, l, e + r + 6, l - 6, e + r, t + s, e + r) : n && 0 > n && l > t + a && l < t + i - a && o.splice(3, 3, "L", l - 6, e, l, e - 6, l + 6, e, i - s, e), o
                                }
                            },
                            clipRect: function(t, e, i, r) {
                                var n = S.uniqueKey(),
                                    o = this.createElement("clipPath").attr({
                                        id: n
                                    }).add(this.defs);
                                return (t = this.rect(t, e, i, r, 0).add(o)).id = n, t.clipPath = o, t.count = 0, t
                            },
                            text: function(t, e, i, r) {
                                var n = !ti && this.forExport,
                                    o = {};
                                return r && (this.allowHTML || !this.forExport) ? this.html(t, e, i) : (o.x = Math.round(e || 0), i && (o.y = Math.round(i)), (t || 0 === t) && (o.text = t), t = this.createElement("text").attr(o), n && t.css({
                                    position: "absolute"
                                }), r || (t.xSetter = function(t, e, i) {
                                    var r, n, o = i.getElementsByTagName("tspan"),
                                        s = i.getAttribute(e);
                                    for (n = 0; n < o.length; n++)(r = o[n]).getAttribute(e) === s && r.setAttribute(e, t);
                                    i.setAttribute(e, t)
                                }), t)
                            },
                            fontMetrics: function(t, e) {
                                return t = t || e && e.style && e.style.fontSize || this.style && this.style.fontSize, {
                                    h: e = 24 > (t = /px/.test(t) ? Q(t) : /em/.test(t) ? parseFloat(t) * (e ? this.fontMetrics(null, e.parentNode).f : 16) : 12) ? t + 3 : Math.round(1.2 * t),
                                    b: Math.round(.8 * e),
                                    f: t
                                }
                            },
                            rotCorr: function(t, e, i) {
                                var r = t;
                                return e && i && (r = Math.max(r * Math.cos(e * j), 4)), {
                                    x: -t / 3 * Math.sin(e * j),
                                    y: r
                                }
                            },
                            label: function(t, e, i, r, n, o, s, a, l) {
                                var h, c, d, u, p, f, g, m, v, y, b, x, w, k = this,
                                    C = k.g("button" !== l && "label"),
                                    A = C.text = k.text("", 0, 0, s).attr({
                                        zIndex: 1
                                    }),
                                    T = 0,
                                    P = 3,
                                    O = 0,
                                    I = {},
                                    L = /^url\((.*?)\)$/.test(r),
                                    D = L;
                                l && C.addClass("highcharts-" + l), D = L, y = function() {
                                    return (m || 0) % 2 / 2
                                }, b = function() {
                                    var t = A.element.style,
                                        e = {};
                                    c = (void 0 === d || void 0 === u || g) && E(A.textStr) && A.getBBox(), C.width = (d || c.width || 0) + 2 * P + O, C.height = (u || c.height || 0) + 2 * P, v = P + k.fontMetrics(t && t.fontSize, A).b, D && (h || (C.box = h = k.symbols[r] || L ? k.symbol(r) : k.rect(), h.addClass(("button" === l ? "" : "highcharts-label-box") + (l ? " highcharts-" + l + "-box" : "")), h.add(C), e.x = t = y(), e.y = (a ? -v : 0) + t), e.width = Math.round(C.width), e.height = Math.round(C.height), h.attr(z(e, I)), I = {})
                                }, x = function() {
                                    var t, e = O + P;
                                    t = a ? 0 : v, E(d) && c && ("center" === g || "right" === g) && (e += ({
                                        center: .5,
                                        right: 1
                                    })[g] * (d - c.width)), (e !== A.x || t !== A.y) && (A.attr("x", e), void 0 !== t && A.attr("y", t)), A.x = e, A.y = t
                                }, w = function(t, e) {
                                    h ? h.attr(t, e) : I[t] = e
                                }, C.onAdd = function() {
                                    A.add(C), C.attr({
                                        text: t || 0 === t ? t : "",
                                        x: e,
                                        y: i
                                    }), h && E(n) && C.attr({
                                        anchorX: n,
                                        anchorY: o
                                    })
                                }, C.widthSetter = function(t) {
                                    d = S.isNumber(t) ? t : null
                                }, C.heightSetter = function(t) {
                                    u = t
                                }, C["text-alignSetter"] = function(t) {
                                    g = t
                                }, C.paddingSetter = function(t) {
                                    E(t) && t !== P && (P = C.padding = t, x())
                                }, C.paddingLeftSetter = function(t) {
                                    E(t) && t !== O && (O = t, x())
                                }, C.alignSetter = function(t) {
                                    (t = ({
                                        left: 0,
                                        center: .5,
                                        right: 1
                                    })[t]) !== T && (T = t, c && C.attr({
                                        x: p
                                    }))
                                }, C.textSetter = function(t) {
                                    void 0 !== t && A.textSetter(t), b(), x()
                                }, C["stroke-widthSetter"] = function(t, e) {
                                    t && (D = !0), m = this["stroke-width"] = t, w(e, t)
                                }, C.strokeSetter = C.fillSetter = C.rSetter = function(t, e) {
                                    "r" !== e && ("fill" === e && t && (D = !0), C[e] = t), w(e, t)
                                }, C.anchorXSetter = function(t, e) {
                                    n = C.anchorX = t, w(e, Math.round(t) - y() - p)
                                }, C.anchorYSetter = function(t, e) {
                                    o = C.anchorY = t, w(e, t - f)
                                }, C.xSetter = function(t) {
                                    C.x = t, T && (t -= T * ((d || c.width) + 2 * P)), p = Math.round(t), C.attr("translateX", p)
                                }, C.ySetter = function(t) {
                                    f = C.y = Math.round(t), C.attr("translateY", f)
                                };
                                var j = C.css;
                                return z(C, {
                                    css: function(t) {
                                        if (t) {
                                            var e = {};
                                            t = q(t), B(C.textProps, function(i) {
                                                void 0 !== t[i] && (e[i] = t[i], delete t[i])
                                            }), A.css(e)
                                        }
                                        return j.call(C, t)
                                    },
                                    getBBox: function() {
                                        return {
                                            width: c.width + 2 * P,
                                            height: c.height + 2 * P,
                                            x: c.x - P,
                                            y: c.y - P
                                        }
                                    },
                                    shadow: function(t) {
                                        return t && (b(), h && h.shadow(t)), C
                                    },
                                    destroy: function() {
                                        tt(C.element, "mouseenter"), tt(C.element, "mouseleave"), A && (A = A.destroy()), h && (h = h.destroy()), M.prototype.destroy.call(C), C = k = b = x = w = null
                                    }
                                })
                            }
                        }), S.Renderer = C, ta = (ts = t).attr, tl = ts.createElement, th = ts.css, tc = ts.defined, td = ts.each, tu = ts.extend, tp = ts.isFirefox, tf = ts.isMS, tg = ts.isWebKit, tm = ts.pInt, tv = ts.SVGRenderer, ty = ts.win, tb = ts.wrap, tu(ts.SVGElement.prototype, {
                            htmlCss: function(t) {
                                var e = this.element;
                                return (e = t && "SPAN" === e.tagName && t.width) && (delete t.width, this.textWidth = e, this.updateTransform()), t && "ellipsis" === t.textOverflow && (t.whiteSpace = "nowrap", t.overflow = "hidden"), this.styles = tu(this.styles, t), th(this.element, t), this
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
                                        s = this.textAlign || "left",
                                        a = {
                                            left: 0,
                                            center: .5,
                                            right: 1
                                        } [s],
                                        l = this.styles;
                                    if (th(e, {
                                            marginLeft: i,
                                            marginTop: r
                                        }), this.shadows && td(this.shadows, function(t) {
                                            th(t, {
                                                marginLeft: i + 1,
                                                marginTop: r + 1
                                            })
                                        }), this.inverted && td(e.childNodes, function(i) {
                                            t.invertChild(i, e)
                                        }), "SPAN" === e.tagName) {
                                        var h = this.rotation,
                                            c = tm(this.textWidth),
                                            d = l && l.whiteSpace,
                                            u = [h, s, e.innerHTML, this.textWidth, this.textAlign].join();
                                        u !== this.cTT && (l = t.fontMetrics(e.style.fontSize).b, tc(h) && this.setSpanRotation(h, a, l), th(e, {
                                            width: "",
                                            whiteSpace: d || "nowrap"
                                        }), e.offsetWidth > c && /[ \-]/.test(e.textContent || e.innerText) && th(e, {
                                            width: c + "px",
                                            display: "block",
                                            whiteSpace: d || "normal"
                                        }), this.getSpanCorrection(e.offsetWidth, l, a, h, s)), th(e, {
                                            left: n + (this.xCorr || 0) + "px",
                                            top: o + (this.yCorr || 0) + "px"
                                        }), tg && (l = e.offsetHeight), this.cTT = u
                                    }
                                } else this.alignOnAdd = !0
                            },
                            setSpanRotation: function(t, e, i) {
                                var r = {},
                                    n = tf ? "-ms-transform" : tg ? "-webkit-transform" : tp ? "MozTransform" : ty.opera ? "-o-transform" : "";
                                r[n] = r.transform = "rotate(" + t + "deg)", r[n + (tp ? "Origin" : "-origin")] = r.transformOrigin = 100 * e + "% " + i + "px", th(this.element, r)
                            },
                            getSpanCorrection: function(t, e, i) {
                                this.xCorr = -t * i, this.yCorr = -e
                            }
                        }), tu(tv.prototype, {
                            html: function(t, e, i) {
                                var r = this.createElement("span"),
                                    n = r.element,
                                    o = r.renderer,
                                    s = o.isSVG,
                                    a = function(t, e) {
                                        td(["opacity", "visibility"], function(i) {
                                            tb(t, i + "Setter", function(t, i, r, n) {
                                                t.call(this, i, r, n), e[r] = i
                                            })
                                        })
                                    };
                                return r.textSetter = function(t) {
                                    t !== n.innerHTML && delete this.bBox, n.innerHTML = this.textStr = t, r.htmlUpdateTransform()
                                }, s && a(r, r.element.style), r.xSetter = r.ySetter = r.alignSetter = r.rotationSetter = function(t, e) {
                                    "align" === e && (e = "textAlign"), r[e] = t, r.htmlUpdateTransform()
                                }, r.attr({
                                    text: t,
                                    x: Math.round(e),
                                    y: Math.round(i)
                                }).css({
                                    fontFamily: this.style.fontFamily,
                                    fontSize: this.style.fontSize,
                                    position: "absolute"
                                }), n.style.whiteSpace = "nowrap", r.css = r.htmlCss, s && (r.add = function(t) {
                                    var e, i = o.box.parentNode,
                                        s = [];
                                    if (this.parentGroup = t) {
                                        if (!(e = t.div)) {
                                            for (; t;) s.push(t), t = t.parentGroup;
                                            td(s.reverse(), function(t) {
                                                var n, o = ta(t.element, "class");
                                                o && (o = {
                                                    className: o
                                                }), n = (e = t.div = t.div || tl("div", o, {
                                                    position: "absolute",
                                                    left: (t.translateX || 0) + "px",
                                                    top: (t.translateY || 0) + "px",
                                                    display: t.display,
                                                    opacity: t.opacity,
                                                    pointerEvents: t.styles && t.styles.pointerEvents
                                                }, e || i)).style, tu(t, {
                                                    classSetter: function(t) {
                                                        this.element.setAttribute("class", t), e.className = t
                                                    },
                                                    on: function() {
                                                        return s[0].div && r.on.apply({
                                                            element: s[0].div
                                                        }, arguments), t
                                                    },
                                                    translateXSetter: function(e, i) {
                                                        n.left = e + "px", t[i] = e, t.doTransform = !0
                                                    },
                                                    translateYSetter: function(e, i) {
                                                        n.top = e + "px", t[i] = e, t.doTransform = !0
                                                    }
                                                }), a(t, n)
                                            })
                                        }
                                    } else e = i;
                                    return e.appendChild(n), r.added = !0, r.alignOnAdd && r.htmlUpdateTransform(), r
                                }), r
                            }
                        }), tS = (tx = t).createElement, tM = tx.css, tC = tx.defined, tA = tx.deg2rad, tT = tx.discardElement, tP = tx.doc, tO = tx.each, tI = tx.erase, tL = tx.extend, tw = tx.extendClass, tD = tx.isArray, tE = tx.isNumber, tj = tx.isObject, tN = tx.merge, tk = tx.noop, tR = tx.pick, tB = tx.pInt, tz = tx.SVGElement, tG = tx.SVGRenderer, tW = tx.win, tx.svg || ((tk = {
                            docMode8: tP && 8 === tP.documentMode,
                            init: function(t, e) {
                                var i = ["<", e, ' filled="f" stroked="f"'],
                                    r = ["position: ", "absolute", ";"],
                                    n = "div" === e;
                                ("shape" === e || n) && r.push("left:0;top:0;width:1px;height:1px;"), r.push("visibility: ", n ? "hidden" : "visible"), i.push(' style="', r.join(""), '"/>'), e && (i = n || "span" === e || "img" === e ? i.join("") : t.prepVML(i), this.element = tS(i)), this.renderer = t
                            },
                            add: function(t) {
                                var e = this.renderer,
                                    i = this.element,
                                    r = e.box,
                                    n = t && t.inverted,
                                    r = t ? t.element || t : r;
                                return t && (this.parentGroup = t), n && e.invertChild(i, r), r.appendChild(i), this.added = !0, this.alignOnAdd && !this.deferUpdateTransform && this.updateTransform(), this.onAdd && this.onAdd(), this.className && this.attr("class", this.className), this
                            },
                            updateTransform: tz.prototype.htmlUpdateTransform,
                            setSpanRotation: function() {
                                var t = this.rotation,
                                    e = Math.cos(t * tA),
                                    i = Math.sin(t * tA);
                                tM(this.element, {
                                    filter: t ? ["progid:DXImageTransform.Microsoft.Matrix(M11=", e, ", M12=", -i, ", M21=", i, ", M22=", e, ", sizingMethod='auto expand')"].join("") : "none"
                                })
                            },
                            getSpanCorrection: function(t, e, i, r, n) {
                                var o, s = r ? Math.cos(r * tA) : 1,
                                    a = r ? Math.sin(r * tA) : 0,
                                    l = tR(this.elemHeight, this.element.offsetHeight);
                                this.xCorr = 0 > s && -t, this.yCorr = 0 > a && -l, o = 0 > s * a, this.xCorr += a * e * (o ? 1 - i : i), this.yCorr -= s * e * (r ? o ? i : 1 - i : 1), n && "left" !== n && (this.xCorr -= t * i * (0 > s ? -1 : 1), r && (this.yCorr -= l * i * (0 > a ? -1 : 1)), tM(this.element, {
                                    textAlign: n
                                }))
                            },
                            pathToVML: function(t) {
                                for (var e = t.length, i = []; e--;) tE(t[e]) ? i[e] = Math.round(10 * t[e]) - 5 : "Z" === t[e] ? i[e] = "x" : (i[e] = t[e], t.isArc && ("wa" === t[e] || "at" === t[e]) && (i[e + 5] === i[e + 7] && (i[e + 7] += t[e + 7] > t[e + 5] ? 1 : -1), i[e + 6] === i[e + 8] && (i[e + 8] += t[e + 8] > t[e + 6] ? 1 : -1)));
                                return i.join(" ") || "x"
                            },
                            clip: function(t) {
                                var e, i = this;
                                return t ? (tI(e = t.members, i), e.push(i), i.destroyClip = function() {
                                    tI(e, i)
                                }, t = t.getCSS(i)) : (i.destroyClip && i.destroyClip(), t = {
                                    clip: i.docMode8 ? "inherit" : "rect(auto)"
                                }), i.css(t)
                            },
                            css: tz.prototype.htmlCss,
                            safeRemoveChild: function(t) {
                                t.parentNode && tT(t)
                            },
                            destroy: function() {
                                return this.destroyClip && this.destroyClip(), tz.prototype.destroy.apply(this)
                            },
                            on: function(t, e) {
                                return this.element["on" + t] = function() {
                                    var t = tW.event;
                                    t.target = t.srcElement, e(t)
                                }, this
                            },
                            cutOffPath: function(t, e) {
                                var i;
                                return (9 === (i = (t = t.split(/[ ,]/)).length) || 11 === i) && (t[i - 4] = t[i - 2] = tB(t[i - 2]) - 10 * e), t.join(" ")
                            },
                            shadow: function(t, e, i) {
                                var r, n, o, s, a, l, h, c = [],
                                    d = this.element,
                                    u = this.renderer,
                                    p = d.style,
                                    f = d.path;
                                if (f && "string" != typeof f.value && (f = "x"), a = f, t) {
                                    for (r = 1, l = tR(t.width, 3), h = (t.opacity || .15) / l; 3 >= r; r++) s = 2 * l + 1 - 2 * r, i && (a = this.cutOffPath(f.value, s + .5)), o = ['<shape isShadow="true" strokeweight="', s, '" filled="false" path="', a, '" coordsize="10 10" style="', d.style.cssText, '" />'], n = tS(u.prepVML(o), null, {
                                        left: tB(p.left) + tR(t.offsetX, 1),
                                        top: tB(p.top) + tR(t.offsetY, 1)
                                    }), i && (n.cutOff = s + 1), o = ['<stroke color="', t.color || "#000000", '" opacity="', h * r, '"/>'], tS(u.prepVML(o), null, null, n), e ? e.element.appendChild(n) : d.parentNode.insertBefore(n, d), c.push(n);
                                    this.shadows = c
                                }
                                return this
                            },
                            updateShadows: tk,
                            setAttr: function(t, e) {
                                this.docMode8 ? this.element[t] = e : this.element.setAttribute(t, e)
                            },
                            classSetter: function(t) {
                                (this.added ? this.element : this).className = t
                            },
                            dashstyleSetter: function(t, e, i) {
                                (i.getElementsByTagName("stroke")[0] || tS(this.renderer.prepVML(["<stroke/>"]), null, null, i))[e] = t || "solid", this[e] = t
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
                                tS(this.renderer.prepVML(["<", e.split("-")[0], ' opacity="', t, '"/>']), null, null, i)
                            },
                            opacitySetter: tk,
                            rotationSetter: function(t, e, i) {
                                i = i.style, this[e] = i[e] = t, i.left = -Math.round(Math.sin(t * tA) + 1) + "px", i.top = Math.round(Math.cos(t * tA)) + "px"
                            },
                            strokeSetter: function(t, e, i) {
                                this.setAttr("strokecolor", this.renderer.color(t, i, e, this))
                            },
                            "stroke-widthSetter": function(t, e, i) {
                                i.stroked = !!t, this[e] = t, tE(t) && (t += "px"), this.setAttr("strokeweight", t)
                            },
                            titleSetter: function(t, e) {
                                this.setAttr(e, t)
                            },
                            visibilitySetter: function(t, e, i) {
                                "inherit" === t && (t = "visible"), this.shadows && tO(this.shadows, function(i) {
                                    i.style[e] = t
                                }), "DIV" === i.nodeName && (t = "hidden" === t ? "-999em" : 0, this.docMode8 || (i.style[e] = t ? "visible" : "hidden"), e = "top"), i.style[e] = t
                            },
                            xSetter: function(t, e, i) {
                                this[e] = t, "x" === e ? e = "left" : "y" === e && (e = "top"), this.updateClipping ? (this[e] = t, this.updateClipping()) : i.style[e] = t
                            },
                            zIndexSetter: function(t, e, i) {
                                i.style[e] = t
                            }
                        })["stroke-opacitySetter"] = tk["fill-opacitySetter"], tx.VMLElement = tk = tw(tz, tk), tk.prototype.ySetter = tk.prototype.widthSetter = tk.prototype.heightSetter = tk.prototype.xSetter, tk = {
                            Element: tk,
                            isIE8: -1 < tW.navigator.userAgent.indexOf("MSIE 8.0"),
                            init: function(t, e, i) {
                                var r, n;
                                if (this.alignedObjects = [], n = (r = this.createElement("div").css({
                                        position: "relative"
                                    })).element, t.appendChild(r.element), this.isVML = !0, this.box = n, this.boxWrapper = r, this.gradients = {}, this.cache = {}, this.cacheKeys = [], this.imgCount = 0, this.setSize(e, i, !1), !tP.namespaces.hcv) {
                                    tP.namespaces.add("hcv", "urn:schemas-microsoft-com:vml");
                                    try {
                                        tP.createStyleSheet().cssText = "hcv\\:fill, hcv\\:path, hcv\\:shape, hcv\\:stroke{ behavior:url(#default#VML); display: inline-block; } "
                                    } catch (t) {
                                        tP.styleSheets[0].cssText += "hcv\\:fill, hcv\\:path, hcv\\:shape, hcv\\:stroke{ behavior:url(#default#VML); display: inline-block; } "
                                    }
                                }
                            },
                            isHidden: function() {
                                return !this.box.offsetWidth
                            },
                            clipRect: function(t, e, i, r) {
                                var n = this.createElement(),
                                    o = tj(t);
                                return tL(n, {
                                    members: [],
                                    count: 0,
                                    left: (o ? t.x : t) + 1,
                                    top: (o ? t.y : e) + 1,
                                    width: (o ? t.width : i) - 1,
                                    height: (o ? t.height : r) - 1,
                                    getCSS: function(t) {
                                        var e = t.element,
                                            i = e.nodeName,
                                            r = t.inverted,
                                            n = this.top - ("shape" === i ? e.offsetTop : 0),
                                            o = this.left,
                                            e = o + this.width,
                                            s = n + this.height,
                                            n = {
                                                clip: "rect(" + Math.round(r ? o : n) + "px," + Math.round(r ? s : e) + "px," + Math.round(r ? e : s) + "px," + Math.round(r ? n : o) + "px)"
                                            };
                                        return !r && t.docMode8 && "DIV" === i && tL(n, {
                                            width: e + "px",
                                            height: s + "px"
                                        }), n
                                    },
                                    updateClipping: function() {
                                        tO(n.members, function(t) {
                                            t.element && t.css(n.getCSS(t))
                                        })
                                    }
                                })
                            },
                            color: function(t, e, i, r) {
                                var n, o, s, a = this,
                                    l = /^rgba/,
                                    h = "none";
                                if (t && t.linearGradient ? s = "gradient" : t && t.radialGradient && (s = "pattern"), s) {
                                    var c, d, u, p, f, g, m, v = t.linearGradient || t.radialGradient,
                                        y = "";
                                    t = t.stops;
                                    var b, x = [],
                                        w = function() {
                                            o = ['<fill colors="' + x.join(",") + '" opacity="', f, '" o:opacity2="', p, '" type="', s, '" ', y, 'focus="100%" method="any" />'], tS(a.prepVML(o), null, null, e)
                                        };
                                    if (u = t[0], b = t[t.length - 1], 0 < u[0] && t.unshift([0, u[1]]), 1 > b[0] && t.push([1, b[1]]), tO(t, function(t, e) {
                                            l.test(t[1]) ? (c = (n = tx.color(t[1])).get("rgb"), d = n.get("a")) : (c = t[1], d = 1), x.push(100 * t[0] + "% " + c), e ? (f = d, g = c) : (p = d, m = c)
                                        }), "fill" === i)
                                        if ("gradient" === s) i = v.x1 || v[0] || 0, t = v.y1 || v[1] || 0, u = v.x2 || v[2] || 0, y = 'angle="' + (90 - 180 * Math.atan(((v = v.y2 || v[3] || 0) - t) / (u - i)) / Math.PI) + '"', w();
                                        else {
                                            var k, h = v.r,
                                                S = 2 * h,
                                                M = 2 * h,
                                                C = v.cx,
                                                A = v.cy,
                                                T = e.radialReference,
                                                h = function() {
                                                    T && (k = r.getBBox(), C += (T[0] - k.x) / k.width - .5, A += (T[1] - k.y) / k.height - .5, S *= T[2] / k.width, M *= T[2] / k.height), y = 'src="' + tx.getOptions().global.VMLRadialGradientURL + '" size="' + S + "," + M + '" origin="0.5,0.5" position="' + C + "," + A + '" color2="' + m + '" ', w()
                                                };
                                            r.added ? h() : r.onAdd = h, h = g
                                        }
                                    else h = c
                                } else l.test(t) && "IMG" !== e.tagName ? (n = tx.color(t), r[i + "-opacitySetter"](n.get("a"), i, e), h = n.get("rgb")) : ((h = e.getElementsByTagName(i)).length && (h[0].opacity = 1, h[0].type = "solid"), h = t);
                                return h
                            },
                            prepVML: function(t) {
                                var e = this.isIE8;
                                return t = t.join(""), t = e ? -1 === (t = t.replace("/>", ' xmlns="urn:schemas-microsoft-com:vml" />')).indexOf('style="') ? t.replace("/>", ' style="display:inline-block;behavior:url(#default#VML);" />') : t.replace('style="', 'style="display:inline-block;behavior:url(#default#VML);') : t.replace("<", "<hcv:")
                            },
                            text: tG.prototype.html,
                            path: function(t) {
                                var e = {
                                    coordsize: "10 10"
                                };
                                return tD(t) ? e.d = t : tj(t) && tL(e, t), this.createElement("shape").attr(e)
                            },
                            circle: function(t, e, i) {
                                var r = this.symbol("circle");
                                return tj(t) && (i = t.r, e = t.y, t = t.x), r.isCircle = !0, r.r = i, r.attr({
                                    x: t,
                                    y: e
                                })
                            },
                            g: function(t) {
                                var e;
                                return t && (e = {
                                    className: "highcharts-" + t,
                                    class: "highcharts-" + t
                                }), this.createElement("div").attr(e)
                            },
                            image: function(t, e, i, r, n) {
                                var o = this.createElement("img").attr({
                                    src: t
                                });
                                return 1 < arguments.length && o.attr({
                                    x: e,
                                    y: i,
                                    width: r,
                                    height: n
                                }), o
                            },
                            createElement: function(t) {
                                return "rect" === t ? this.symbol(t) : tG.prototype.createElement.call(this, t)
                            },
                            invertChild: function(t, e) {
                                var i = this;
                                e = e.style;
                                var r = "IMG" === t.tagName && t.style;
                                tM(t, {
                                    flip: "x",
                                    left: tB(e.width) - (r ? tB(r.top) : 1),
                                    top: tB(e.height) - (r ? tB(r.left) : 1),
                                    rotation: -90
                                }), tO(t.childNodes, function(e) {
                                    i.invertChild(e, t)
                                })
                            },
                            symbols: {
                                arc: function(t, e, i, r, n) {
                                    var o = n.start,
                                        s = n.end,
                                        a = n.r || i || r;
                                    i = n.innerR, r = Math.cos(o);
                                    var l = Math.sin(o),
                                        h = Math.cos(s),
                                        c = Math.sin(s);
                                    return 0 == s - o ? ["x"] : (o = ["wa", t - a, e - a, t + a, e + a, t + a * r, e + a * l, t + a * h, e + a * c], n.open && !i && o.push("e", "M", t, e), o.push("at", t - i, e - i, t + i, e + i, t + i * h, e + i * c, t + i * r, e + i * l, "x", "e"), o.isArc = !0, o)
                                },
                                circle: function(t, e, i, r, n) {
                                    return n && tC(n.r) && (i = r = 2 * n.r), n && n.isCircle && (t -= i / 2, e -= r / 2), ["wa", t, e, t + i, e + r, t + i, e + r / 2, t + i, e + r / 2, "e"]
                                },
                                rect: function(t, e, i, r, n) {
                                    return tG.prototype.symbols[tC(n) && n.r ? "callout" : "square"].call(0, t, e, i, r, n)
                                }
                            }
                        }, tx.VMLRenderer = tw = function() {
                            this.init.apply(this, arguments)
                        }, tw.prototype = tN(tG.prototype, tk), tx.Renderer = tw), tG.prototype.measureSpanWidth = function(t, e) {
                            var i = tP.createElement("span");
                            return t = tP.createTextNode(t), i.appendChild(t), tM(i, e), this.box.appendChild(i), e = i.offsetWidth, tT(i), e
                        },
                        function(t) {
                            function e() {
                                var e, i = t.defaultOptions.global,
                                    o = i.useUTC,
                                    l = o ? "getUTC" : "get",
                                    h = o ? "setUTC" : "set";
                                t.Date = e = i.Date || a.Date, e.hcTimezoneOffset = o && i.timezoneOffset, e.hcGetTimezoneOffset = function() {
                                    var e = t.defaultOptions.global,
                                        i = a.moment;
                                    if (e.timezone) {
                                        if (i) return function(t) {
                                            return -i.tz(t, e.timezone).utcOffset()
                                        };
                                        t.error(25)
                                    }
                                    return e.useUTC && e.getTimezoneOffset
                                }(), e.hcMakeTime = function(t, i, r, a, l, h) {
                                    var c;
                                    return o ? (c = e.UTC.apply(0, arguments), c += n(c)) : c = new e(t, i, s(r, 1), s(a, 0), s(l, 0), s(h, 0)).getTime(), c
                                }, r("Minutes Hours Day Date Month FullYear".split(" "), function(t) {
                                    e["hcGet" + t] = l + t
                                }), r("Milliseconds Seconds Minutes Hours Date Month FullYear".split(" "), function(t) {
                                    e["hcSet" + t] = h + t
                                })
                            }
                            var i = t.color,
                                r = t.each,
                                n = t.getTZOffset,
                                o = t.merge,
                                s = t.pick,
                                a = t.win;
                            t.defaultOptions = {
                                colors: "#7cb5ec #434348 #90ed7d #f7a35c #8085e9 #f15c80 #e4d354 #2b908f #f45b5b #91e8e1".split(" "),
                                symbols: ["circle", "diamond", "square", "triangle", "triangle-down"],
                                lang: {
                                    loading: "Loading...",
                                    months: "January February March April May June July August September October November December".split(" "),
                                    shortMonths: "Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec".split(" "),
                                    weekdays: "Sunday Monday Tuesday Wednesday Thursday Friday Saturday".split(" "),
                                    decimalPoint: ".",
                                    numericSymbols: "kMGTPE".split(""),
                                    resetZoom: "Reset zoom",
                                    resetZoomTitle: "Reset zoom level 1:1",
                                    thousandsSep: " "
                                },
                                global: {
                                    useUTC: !0,
                                    VMLRadialGradientURL: "http://code.highcharts.com/5.0.14/gfx/vml-radial-gradient.png"
                                },
                                chart: {
                                    borderRadius: 0,
                                    defaultSeriesType: "line",
                                    ignoreHiddenSeries: !0,
                                    spacing: [10, 10, 15, 10],
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
                                    height: null,
                                    borderColor: "#335cad",
                                    backgroundColor: "#ffffff",
                                    plotBorderColor: "#cccccc"
                                },
                                title: {
                                    text: "Chart title",
                                    align: "center",
                                    margin: 15,
                                    widthAdjust: -44
                                },
                                subtitle: {
                                    text: "",
                                    align: "center",
                                    widthAdjust: -44
                                },
                                plotOptions: {},
                                labels: {
                                    style: {
                                        position: "absolute",
                                        color: "#333333"
                                    }
                                },
                                legend: {
                                    enabled: !0,
                                    align: "center",
                                    layout: "horizontal",
                                    labelFormatter: function() {
                                        return this.name
                                    },
                                    borderColor: "#999999",
                                    borderRadius: 0,
                                    navigation: {
                                        activeColor: "#003399",
                                        inactiveColor: "#cccccc"
                                    },
                                    itemStyle: {
                                        color: "#333333",
                                        fontSize: "12px",
                                        fontWeight: "bold",
                                        textOverflow: "ellipsis"
                                    },
                                    itemHoverStyle: {
                                        color: "#000000"
                                    },
                                    itemHiddenStyle: {
                                        color: "#cccccc"
                                    },
                                    shadow: !1,
                                    itemCheckboxStyle: {
                                        position: "absolute",
                                        width: "13px",
                                        height: "13px"
                                    },
                                    squareSymbol: !0,
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
                                        backgroundColor: "#ffffff",
                                        opacity: .5,
                                        textAlign: "center"
                                    }
                                },
                                tooltip: {
                                    enabled: !0,
                                    animation: t.svg,
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
                                    padding: 8,
                                    snap: t.isTouchDevice ? 25 : 10,
                                    backgroundColor: i("#f7f7f7").setOpacity(.85).get(),
                                    borderWidth: 1,
                                    headerFormat: '<span style="font-size: 10px">{point.key}</span><br/>',
                                    pointFormat: '<span style="color:{point.color}">●</span> {series.name}: <b>{point.y}</b><br/>',
                                    shadow: !0,
                                    style: {
                                        color: "#333333",
                                        cursor: "default",
                                        fontSize: "12px",
                                        pointerEvents: "none",
                                        whiteSpace: "nowrap"
                                    }
                                },
                                credits: {
                                    enabled: !0,
                                    href: "http://www.highcharts.com",
                                    position: {
                                        align: "right",
                                        x: -10,
                                        verticalAlign: "bottom",
                                        y: -5
                                    },
                                    style: {
                                        cursor: "pointer",
                                        color: "#999999",
                                        fontSize: "9px"
                                    },
                                    text: "Highcharts.com"
                                }
                            }, t.setOptions = function(i) {
                                return t.defaultOptions = o(!0, t.defaultOptions, i), e(), t.defaultOptions
                            }, t.getOptions = function() {
                                return t.defaultOptions
                            }, t.defaultPlotOptions = t.defaultOptions.plotOptions, e()
                        }(t), tF = (tH = t).correctFloat, tX = tH.defined, tY = tH.destroyObjectProperties, tV = tH.isNumber, tU = tH.merge, t_ = tH.pick, tK = tH.deg2rad, tH.Tick = function(t, e, i, r) {
                            this.axis = t, this.pos = e, this.type = i || "", this.isNewLabel = this.isNew = !0, i || r || this.addLabel()
                        }, tH.Tick.prototype = {
                            addLabel: function() {
                                var t, e = this.axis,
                                    i = e.options,
                                    r = e.chart,
                                    n = e.categories,
                                    o = e.names,
                                    s = this.pos,
                                    a = i.labels,
                                    l = e.tickPositions,
                                    h = s === l[0],
                                    c = s === l[l.length - 1],
                                    o = n ? t_(n[s], o[s], s) : s,
                                    n = this.label,
                                    l = l.info;
                                e.isDatetimeAxis && l && (t = i.dateTimeLabelFormats[l.higherRanks[s] || l.unitName]), this.isFirst = h, this.isLast = c, i = e.labelFormatter.call({
                                    axis: e,
                                    chart: r,
                                    isFirst: h,
                                    isLast: c,
                                    dateTimeLabelFormat: t,
                                    value: e.isLog ? tF(e.lin2log(o)) : o,
                                    pos: s
                                }), tX(n) ? n && n.attr({
                                    text: i
                                }) : (this.labelLength = (this.label = n = tX(i) && a.enabled ? r.renderer.text(i, 0, 0, a.useHTML).css(tU(a.style)).add(e.labelGroup) : null) && n.getBBox().width, this.rotation = 0)
                            },
                            getLabelSize: function() {
                                return this.label ? this.label.getBBox()[this.axis.horiz ? "height" : "width"] : 0
                            },
                            handleOverflow: function(t) {
                                var e, i = this.axis,
                                    r = t.x,
                                    n = i.chart.chartWidth,
                                    o = i.chart.spacing,
                                    s = t_(i.labelLeft, Math.min(i.pos, o[3])),
                                    o = t_(i.labelRight, Math.max(i.pos + i.len, n - o[1])),
                                    a = this.label,
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
                                l ? 0 > l && r - h * c < s ? e = Math.round(r / Math.cos(l * tK) - s) : 0 < l && r + h * c > o && (e = Math.round((n - r) / Math.cos(l * tK))) : (n = r + (1 - h) * c, r - h * c < s ? u = t.x + u * (1 - h) - s : n > o && (u = o - t.x + u * h, p = -1), (u = Math.min(d, u)) < d && "center" === i.labelAlign && (t.x += p * (d - u - h * (d - Math.min(c, u)))), (c > u || i.autoRotation && (a.styles || {}).width) && (e = u)), e && (f.width = e, (i.options.labels.style || {}).textOverflow || (f.textOverflow = "ellipsis"), a.css(f))
                            },
                            getPosition: function(t, e, i, r) {
                                var n = this.axis,
                                    o = n.chart,
                                    s = r && o.oldChartHeight || o.chartHeight;
                                return {
                                    x: t ? n.translate(e + i, null, null, r) + n.transB : n.left + n.offset + (n.opposite ? (r && o.oldChartWidth || o.chartWidth) - n.right - n.left : 0),
                                    y: t ? s - n.bottom + n.offset - (n.opposite ? n.height : 0) : s - n.translate(e + i, null, null, r) - n.transB
                                }
                            },
                            getLabelPosition: function(t, e, i, r, n, o, s, a) {
                                var l = this.axis,
                                    h = l.transA,
                                    c = l.reversed,
                                    d = l.staggerLines,
                                    u = l.tickRotCorr || {
                                        x: 0,
                                        y: 0
                                    },
                                    p = n.y;
                                return tX(p) || (p = 0 === l.side ? i.rotation ? -8 : -i.getBBox().height : 2 === l.side ? u.y + 8 : Math.cos(i.rotation * tK) * (u.y - i.getBBox(!1, 0).height / 2)), t = t + n.x + u.x - (o && r ? o * h * (c ? -1 : 1) : 0), e = e + p - (o && !r ? o * h * (c ? 1 : -1) : 0), d && (i = s / (a || 1) % d, l.opposite && (i = d - i - 1), e += l.labelOffset / d * i), {
                                    x: t,
                                    y: Math.round(e)
                                }
                            },
                            getMarkPath: function(t, e, i, r, n, o) {
                                return o.crispLine(["M", t, e, "L", t + (n ? 0 : -i), e + (n ? i : 0)], r)
                            },
                            renderGridLine: function(t, e, i) {
                                var r = this.axis,
                                    n = r.options,
                                    o = this.gridLine,
                                    s = {},
                                    a = this.pos,
                                    l = this.type,
                                    h = r.tickmarkOffset,
                                    c = r.chart.renderer,
                                    d = l ? l + "Grid" : "grid",
                                    u = n[d + "LineWidth"],
                                    p = n[d + "LineColor"],
                                    n = n[d + "LineDashStyle"];
                                o || (s.stroke = p, s["stroke-width"] = u, n && (s.dashstyle = n), l || (s.zIndex = 1), t && (s.opacity = 0), this.gridLine = o = c.path().attr(s).addClass("highcharts-" + (l ? l + "-" : "") + "grid-line").add(r.gridGroup)), !t && o && (t = r.getPlotLinePath(a + h, o.strokeWidth() * i, t, !0)) && o[this.isNew ? "attr" : "animate"]({
                                    d: t,
                                    opacity: e
                                })
                            },
                            renderMark: function(t, e, i) {
                                var r = this.axis,
                                    n = r.options,
                                    o = r.chart.renderer,
                                    s = this.type,
                                    a = s ? s + "Tick" : "tick",
                                    l = r.tickSize(a),
                                    h = this.mark,
                                    c = !h,
                                    d = t.x;
                                t = t.y;
                                var u = t_(n[a + "Width"], !s && r.isXAxis ? 1 : 0),
                                    n = n[a + "Color"];
                                l && (r.opposite && (l[0] = -l[0]), c && (this.mark = h = o.path().addClass("highcharts-" + (s ? s + "-" : "") + "tick").add(r.axisGroup), h.attr({
                                    stroke: n,
                                    "stroke-width": u
                                })), h[c ? "attr" : "animate"]({
                                    d: this.getMarkPath(d, t, l[0], h.strokeWidth() * i, r.horiz, o),
                                    opacity: e
                                }))
                            },
                            renderLabel: function(t, e, i, r) {
                                var n = this.axis,
                                    o = n.horiz,
                                    s = n.options,
                                    a = this.label,
                                    l = s.labels,
                                    h = l.step,
                                    c = n.tickmarkOffset,
                                    d = !0,
                                    u = t.x;
                                t = t.y, a && tV(u) && (a.xy = t = this.getLabelPosition(u, t, a, o, l, c, r, h), (!this.isFirst || this.isLast || t_(s.showFirstLabel, 1)) && (!this.isLast || this.isFirst || t_(s.showLastLabel, 1)) ? !o || n.isRadial || l.step || l.rotation || e || 0 === i || this.handleOverflow(t) : d = !1, h && r % h && (d = !1), d && tV(t.y) ? (t.opacity = i, a[this.isNewLabel ? "attr" : "animate"](t), this.isNewLabel = !1) : (a.attr("y", -9999), this.isNewLabel = !0), this.isNew = !1)
                            },
                            render: function(t, e, i) {
                                var r = this.axis,
                                    n = r.horiz,
                                    o = this.getPosition(n, this.pos, r.tickmarkOffset, e),
                                    s = o.x,
                                    a = o.y,
                                    r = n && s === r.pos + r.len || !n && a === r.pos ? -1 : 1;
                                i = t_(i, 1), this.isActive = !0, this.renderGridLine(e, i, r), this.renderMark(o, i, r), this.renderLabel(o, e, i, t)
                            },
                            destroy: function() {
                                tY(this, this.axis)
                            }
                        };
                    var e, i, r, n, a, l, h, c, d, u, p, f, g, m, v, y, b, x, w, k, S, M, C, A, T, P, O, I, L, D, E, j, N, R, B, z, G, W, H, F, X, Y, V, U, _, K, q, $, Z, J, Q, tt, te, ti, tr, tn, to, ts, ta, tl, th, tc, td, tu, tp, tf, tg, tm, tv, ty, tb, tx, tw, tk, tS, tM, tC, tA, tT, tP, tO, tI, tL, tD, tE, tj, tN, tR, tB, tz, tG, tW, tH, tF, tX, tY, tV, tU, t_, tK, tq, t$, tZ, tJ, tQ, t0, t1, t2, t3, t5, t6, t9, t8, t4, t7, et, ee, ei, er, en, eo, es, ea, el, eh, ec, ed, eu, ep, ef, eg, em, ev, ey, eb, ex, ew, ek, eS, eM, eC, eA, eT, eP, eO, eI, eL, eD, eE, ej, eN, eR, eB, ez, eG, eW, eH, eF, eX, eY, eV, eU, e_, eK, eq, e$, eZ, eJ, eQ, e0, e1, e2, e3, e5, e6, e9, e8, e4, e7, it, ie, ii, ir, io, is, ia, il, ih, ic, id, iu, ip, ig, im, iv, iy, ib, ix, iw, ik, iS, iM, iC, iA, iT, iP, iO, iI, iL, iD, iE, ij, iN, iR, iB, iz, iG, iW, iH, iF, iX, iY, iV, iU, i_, iK, iq, i$, iZ, iJ, iQ, i0, i1, i2, i3, i5, i6, i9, i8, i4, i7, rt, re, ri, rr, rn, ro, rs, ra, rl, rh, rc, rd, ru, rp, rf, rg, rm, rv, ry, rb, rx, rw, rk, rS, rM, rC, rA, rT, rP, rO, rI, rL, rD, rE, rj, rN, rR, rB, rz, rG, rW, rH, rF, rX, rY, rV, rU, r_, rK, rq, r$, rZ, rJ, rQ, r0, r1, r2, r3, r5, r6, r9, r8, r4, r7, nt, ne, ni, nr, nn, no, ns, na, nl, nh, nc, nd, nu, np, nf, ng, nm, nv, ny, nb, nx, nw, nk, nS, nM, nC, nA, nT, nP, nO, nI, nL, nD, nE, nj, nN, nR, nB, nz, nG, nW, nH, nF, nX, nY, nV, nU, n_, nK, nq, n$, nZ, nJ, nQ, n0, n1, n2, n3, n5, n6, n9, n8, n4, n7, ot, oe, oi, or, on, oo, os, oa, ol, oh, oc, od, ou, op, of, og, om, ov, oy, ob, ox, ow, ok, oS, oM, oC, oA, oT, oP, oO, oI, oL, oD, oE, oj, oN, oR = (t$ = (tq = t).addEvent, tZ = tq.animObject, tJ = tq.arrayMax, tQ = tq.arrayMin, t0 = tq.color, t1 = tq.correctFloat, t2 = tq.defaultOptions, t3 = tq.defined, t5 = tq.deg2rad, t6 = tq.destroyObjectProperties, t9 = tq.each, t8 = tq.extend, t4 = tq.fireEvent, t7 = tq.format, et = tq.getMagnitude, ee = tq.grep, ei = tq.inArray, er = tq.isArray, en = tq.isNumber, eo = tq.isString, es = tq.merge, ea = tq.normalizeTickInterval, el = tq.objectEach, eh = tq.pick, ec = tq.removeEvent, ed = tq.splat, eu = tq.syncTimeout, ep = tq.Tick, ef = function() {
                        this.init.apply(this, arguments)
                    }, tq.extend(ef.prototype, {
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
                            labels: {
                                enabled: !0,
                                style: {
                                    color: "#666666",
                                    cursor: "default",
                                    fontSize: "11px"
                                },
                                x: 0
                            },
                            minPadding: .01,
                            maxPadding: .01,
                            minorTickLength: 2,
                            minorTickPosition: "outside",
                            startOfWeek: 1,
                            startOnTick: !1,
                            tickLength: 10,
                            tickmarkPlacement: "between",
                            tickPixelInterval: 100,
                            tickPosition: "outside",
                            title: {
                                align: "middle",
                                style: {
                                    color: "#666666"
                                }
                            },
                            type: "linear",
                            minorGridLineColor: "#f2f2f2",
                            minorGridLineWidth: 1,
                            minorTickColor: "#999999",
                            lineColor: "#ccd6eb",
                            lineWidth: 1,
                            gridLineColor: "#e6e6e6",
                            tickColor: "#ccd6eb"
                        },
                        defaultYAxisOptions: {
                            endOnTick: !0,
                            tickPixelInterval: 72,
                            showLastLabel: !0,
                            labels: {
                                x: -8
                            },
                            maxPadding: .05,
                            minPadding: .05,
                            startOnTick: !0,
                            title: {
                                rotation: 270,
                                text: "Values"
                            },
                            stackLabels: {
                                allowOverlap: !1,
                                enabled: !1,
                                formatter: function() {
                                    return tq.numberFormat(this.total, -1)
                                },
                                style: {
                                    fontSize: "11px",
                                    fontWeight: "bold",
                                    color: "#000000",
                                    textOutline: "1px contrast"
                                }
                            },
                            gridLineWidth: 1,
                            lineWidth: 0
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
                            var i = e.isX,
                                r = this;
                            r.chart = t, r.horiz = t.inverted && !r.isZAxis ? !i : i, r.isXAxis = i, r.coll = r.coll || (i ? "xAxis" : "yAxis"), r.opposite = e.opposite, r.side = e.side || (r.horiz ? 2 * !r.opposite : r.opposite ? 1 : 3), r.setOptions(e);
                            var n = this.options,
                                o = n.type;
                            r.labelFormatter = n.labels.formatter || r.defaultLabelFormatter, r.userOptions = e, r.minPixelPadding = 0, r.reversed = n.reversed, r.visible = !1 !== n.visible, r.zoomEnabled = !1 !== n.zoomEnabled, r.hasNames = "category" === o || !0 === n.categories, r.categories = n.categories || r.hasNames, r.names = r.names || [], r.plotLinesAndBandsGroups = {}, r.isLog = "logarithmic" === o, r.isDatetimeAxis = "datetime" === o, r.positiveValuesOnly = r.isLog && !r.allowNegativeLog, r.isLinked = t3(n.linkedTo), r.ticks = {}, r.labelEdge = [], r.minorTicks = {}, r.plotLinesAndBands = [], r.alternateBands = {}, r.len = 0, r.minRange = r.userMinRange = n.minRange || n.maxZoom, r.range = n.range, r.offset = n.offset || 0, r.stacks = {}, r.oldStacks = {}, r.stacksTouched = 0, r.max = null, r.min = null, r.crosshair = eh(n.crosshair, ed(t.options.tooltip.crosshairs)[+!i], !1), e = r.options.events, -1 === ei(r, t.axes) && (i ? t.axes.splice(t.xAxis.length, 0, r) : t.axes.push(r), t[r.coll].push(r)), r.series = r.series || [], t.inverted && !r.isZAxis && i && void 0 === r.reversed && (r.reversed = !0), el(e, function(t, e) {
                                t$(r, e, t)
                            }), r.lin2log = n.linearToLogConverter || r.lin2log, r.isLog && (r.val2lin = r.log2lin, r.lin2val = r.lin2log)
                        },
                        setOptions: function(t) {
                            this.options = es(this.defaultOptions, "yAxis" === this.coll && this.defaultYAxisOptions, [this.defaultTopAxisOptions, this.defaultRightAxisOptions, this.defaultBottomAxisOptions, this.defaultLeftAxisOptions][this.side], es(t2[this.coll], t))
                        },
                        defaultLabelFormatter: function() {
                            var t, e = this.axis,
                                i = this.value,
                                r = e.categories,
                                n = this.dateTimeLabelFormat,
                                o = t2.lang,
                                s = o.numericSymbols,
                                o = o.numericSymbolMagnitude || 1e3,
                                a = s && s.length,
                                l = e.options.labels.format,
                                e = e.isLog ? Math.abs(i) : e.tickInterval;
                            if (l) t = t7(l, this);
                            else if (r) t = i;
                            else if (n) t = tq.dateFormat(n, i);
                            else if (a && 1e3 <= e)
                                for (; a-- && void 0 === t;) e >= (r = Math.pow(o, a + 1)) && 0 == 10 * i % r && null !== s[a] && 0 !== i && (t = tq.numberFormat(i / r, -1) + s[a]);
                            return void 0 === t && (t = 1e4 <= Math.abs(i) ? tq.numberFormat(i, -1) : tq.numberFormat(i, -1, void 0, "")), t
                        },
                        getSeriesExtremes: function() {
                            var t = this,
                                e = t.chart;
                            t.hasVisibleSeries = !1, t.dataMin = t.dataMax = t.threshold = null, t.softThreshold = !t.isXAxis, t.buildStacks && t.buildStacks(), t9(t.series, function(i) {
                                if (i.visible || !e.options.chart.ignoreHiddenSeries) {
                                    var r, n = i.options,
                                        s = n.threshold;
                                    t.hasVisibleSeries = !0, t.positiveValuesOnly && 0 >= s && (s = null), t.isXAxis ? (n = i.xData).length && (en(i = tQ(n)) || o(i, Date) || (i = tQ(n = ee(n, function(t) {
                                        return en(t)
                                    }))), t.dataMin = Math.min(eh(t.dataMin, n[0]), i), t.dataMax = Math.max(eh(t.dataMax, n[0]), tJ(n))) : (i.getExtremes(), r = i.dataMax, t3(i = i.dataMin) && t3(r) && (t.dataMin = Math.min(eh(t.dataMin, i), i), t.dataMax = Math.max(eh(t.dataMax, r), r)), t3(s) && (t.threshold = s), (!n.softThreshold || t.positiveValuesOnly) && (t.softThreshold = !1))
                                }
                            })
                        },
                        translate: function(t, e, i, r, n, o) {
                            var s = this.linkedParent || this,
                                a = 1,
                                l = 0,
                                h = r ? s.oldTransA : s.transA;
                            r = r ? s.oldMin : s.min;
                            var c = s.minPixelPadding;
                            return n = (s.isOrdinal || s.isBroken || s.isLog && n) && s.lin2val, h || (h = s.transA), i && (a *= -1, l = s.len), s.reversed && (a *= -1, l -= a * (s.sector || s.len)), e ? (t = (t * a + l - c) / h + r, n && (t = s.lin2val(t))) : (n && (t = s.val2lin(t)), t = a * (t - r) * h + l + a * c + (en(o) ? h * o : 0)), t
                        },
                        toPixels: function(t, e) {
                            return this.translate(t, !1, !this.horiz, null, !0) + (e ? 0 : this.pos)
                        },
                        toValue: function(t, e) {
                            return this.translate(t - (e ? 0 : this.pos), !0, !this.horiz, null, !0)
                        },
                        getPlotLinePath: function(t, e, i, r, n) {
                            var o, s, a, l = this.chart,
                                h = this.left,
                                c = this.top,
                                d = i && l.oldChartHeight || l.chartHeight,
                                u = i && l.oldChartWidth || l.chartWidth;
                            o = this.transB;
                            var p = function(t, e, i) {
                                return (t < e || t > i) && (r ? t = Math.min(Math.max(e, t), i) : a = !0), t
                            };
                            return t = i = Math.round((n = eh(n, this.translate(t, null, null, i))) + o), o = s = Math.round(d - n - o), en(n) ? this.horiz ? (o = c, s = d - this.bottom, t = i = p(t, h, h + this.width)) : (t = h, i = u - this.right, o = s = p(o, c, c + this.height)) : a = !0, a && !r ? null : l.renderer.crispLine(["M", t, o, "L", i, s], e || 1)
                        },
                        getLinearTickPositions: function(t, e, i) {
                            var r, n = t1(Math.floor(e / t) * t);
                            i = t1(Math.ceil(i / t) * t);
                            var o = [];
                            if (this.single) return [e];
                            for (e = n; e <= i && (o.push(e), (e = t1(e + t)) !== r);) r = e;
                            return o
                        },
                        getMinorTickPositions: function() {
                            var t = this,
                                e = t.options,
                                i = t.tickPositions,
                                r = t.minorTickInterval,
                                n = [],
                                o = t.pointRangePadding || 0,
                                s = t.min - o,
                                o = t.max + o,
                                a = o - s;
                            if (a && a / r < t.len / 3)
                                if (t.isLog) t9(this.paddedTicks, function(e, i, o) {
                                    i && n.push.apply(n, t.getLogTickPositions(r, o[i - 1], o[i], !0))
                                });
                                else if (t.isDatetimeAxis && "auto" === e.minorTickInterval) n = n.concat(t.getTimeTicks(t.normalizeTimeTickInterval(r), s, o, e.startOfWeek));
                            else
                                for (e = s + (i[0] - s) % r; e <= o && e !== n[0]; e += r) n.push(e);
                            return 0 !== n.length && t.trimTicks(n), n
                        },
                        adjustForMinRange: function() {
                            var t, e, i, r, n, o, s, a, l = this.options,
                                h = this.min,
                                c = this.max;
                            this.isXAxis && void 0 === this.minRange && !this.isLog && (t3(l.min) || t3(l.max) ? this.minRange = null : (t9(this.series, function(t) {
                                for (o = t.xData, r = s = t.xIncrement ? 1 : o.length - 1; 0 < r; r--) n = o[r] - o[r - 1], (void 0 === i || n < i) && (i = n)
                            }), this.minRange = Math.min(5 * i, this.dataMax - this.dataMin))), c - h < this.minRange && (e = this.dataMax - this.dataMin >= this.minRange, t = ((a = this.minRange) - c + h) / 2, t = [h - t, eh(l.min, h - t)], e && (t[2] = this.isLog ? this.log2lin(this.dataMin) : this.dataMin), c = [(h = tJ(t)) + a, eh(l.max, h + a)], e && (c[2] = this.isLog ? this.log2lin(this.dataMax) : this.dataMax), (c = tQ(c)) - h < a && (t[0] = c - a, t[1] = eh(l.min, c - a), h = tJ(t))), this.min = h, this.max = c
                        },
                        getClosest: function() {
                            var t;
                            return this.categories ? t = 1 : t9(this.series, function(e) {
                                var i = e.closestPointRange,
                                    r = e.visible || !e.chart.options.chart.ignoreHiddenSeries;
                                !e.noSharedTooltip && t3(i) && r && (t = t3(t) ? Math.min(t, i) : i)
                            }), t
                        },
                        nameToX: function(t) {
                            var e, i = er(this.categories),
                                r = i ? this.categories : this.names,
                                n = t.options.x;
                            return t.series.requireSorting = !1, t3(n) || (n = !1 === this.options.uniqueNames ? t.series.autoIncrement() : ei(t.name, r)), -1 === n ? i || (e = r.length) : e = n, void 0 !== e && (this.names[e] = t.name), e
                        },
                        updateNames: function() {
                            var t = this;
                            0 < this.names.length && (this.names.length = 0, this.minRange = this.userMinRange, t9(this.series || [], function(e) {
                                e.xIncrement = null, (!e.points || e.isDirtyData) && (e.processData(), e.generatePoints()), t9(e.points, function(i, r) {
                                    var n;
                                    i.options && void 0 !== (n = t.nameToX(i)) && n !== i.x && (i.x = n, e.xData[r] = n)
                                })
                            }))
                        },
                        setAxisTranslation: function(t) {
                            var e, i = this,
                                r = i.max - i.min,
                                n = i.axisPointRange || 0,
                                o = 0,
                                s = 0,
                                a = i.linkedParent,
                                l = !!i.categories,
                                h = i.transA,
                                c = i.isXAxis;
                            (c || l || n) && (e = i.getClosest(), a ? (o = a.minPointOffset, s = a.pointRangePadding) : t9(i.series, function(t) {
                                var r = l ? 1 : c ? eh(t.options.pointRange, e, 0) : i.axisPointRange || 0;
                                t = t.options.pointPlacement, n = Math.max(n, r), i.single || (o = Math.max(o, eo(t) ? 0 : r / 2), s = Math.max(s, "on" === t ? 0 : r))
                            }), a = i.ordinalSlope && e ? i.ordinalSlope / e : 1, i.minPointOffset = o *= a, i.pointRangePadding = s *= a, i.pointRange = Math.min(n, r), c && (i.closestPointRange = e)), t && (i.oldTransA = h), i.translationSlope = i.transA = h = i.options.staticScale || i.len / (r + s || 1), i.transB = i.horiz ? i.left : i.bottom, i.minPixelPadding = h * o
                        },
                        minFromRange: function() {
                            return this.max - this.range
                        },
                        setTickInterval: function(t) {
                            var e, i, r, n, o = this,
                                s = o.chart,
                                a = o.options,
                                l = o.isLog,
                                h = o.log2lin,
                                c = o.isDatetimeAxis,
                                d = o.isXAxis,
                                u = o.isLinked,
                                p = a.maxPadding,
                                f = a.minPadding,
                                g = a.tickInterval,
                                m = a.tickPixelInterval,
                                v = o.categories,
                                y = o.threshold,
                                b = o.softThreshold;
                            c || v || u || this.getTickAmount(), r = eh(o.userMin, a.min), n = eh(o.userMax, a.max), u ? (o.linkedParent = s[o.coll][a.linkedTo], s = o.linkedParent.getExtremes(), o.min = eh(s.min, s.dataMin), o.max = eh(s.max, s.dataMax), a.type !== o.linkedParent.options.type && tq.error(11, 1)) : (!b && t3(y) && (o.dataMin >= y ? (e = y, f = 0) : o.dataMax <= y && (i = y, p = 0)), o.min = eh(r, e, o.dataMin), o.max = eh(n, i, o.dataMax)), l && (o.positiveValuesOnly && !t && 0 >= Math.min(o.min, eh(o.dataMin, o.min)) && tq.error(10, 1), o.min = t1(h(o.min), 15), o.max = t1(h(o.max), 15)), o.range && t3(o.max) && (o.userMin = o.min = r = Math.max(o.dataMin, o.minFromRange()), o.userMax = n = o.max, o.range = null), t4(o, "foundExtremes"), o.beforePadding && o.beforePadding(), o.adjustForMinRange(), !(v || o.axisPointRange || o.usePercentage || u) && t3(o.min) && t3(o.max) && (h = o.max - o.min) && (!t3(r) && f && (o.min -= h * f), !t3(n) && p && (o.max += h * p)), en(a.softMin) && (o.min = Math.min(o.min, a.softMin)), en(a.softMax) && (o.max = Math.max(o.max, a.softMax)), en(a.floor) && (o.min = Math.max(o.min, a.floor)), en(a.ceiling) && (o.max = Math.min(o.max, a.ceiling)), b && t3(o.dataMin) && (y = y || 0, !t3(r) && o.min < y && o.dataMin >= y ? o.min = y : !t3(n) && o.max > y && o.dataMax <= y && (o.max = y)), o.tickInterval = o.min === o.max || void 0 === o.min || void 0 === o.max ? 1 : u && !g && m === o.linkedParent.options.tickPixelInterval ? g = o.linkedParent.tickInterval : eh(g, this.tickAmount ? (o.max - o.min) / Math.max(this.tickAmount - 1, 1) : void 0, v ? 1 : (o.max - o.min) * m / Math.max(o.len, m)), d && !t && t9(o.series, function(t) {
                                t.processData(o.min !== o.oldMin || o.max !== o.oldMax)
                            }), o.setAxisTranslation(!0), o.beforeSetTickPositions && o.beforeSetTickPositions(), o.postProcessTickInterval && (o.tickInterval = o.postProcessTickInterval(o.tickInterval)), o.pointRange && !g && (o.tickInterval = Math.max(o.pointRange, o.tickInterval)), t = eh(a.minTickInterval, o.isDatetimeAxis && o.closestPointRange), !g && o.tickInterval < t && (o.tickInterval = t), c || l || g || (o.tickInterval = ea(o.tickInterval, null, et(o.tickInterval), eh(a.allowDecimals, !(.5 < o.tickInterval && 5 > o.tickInterval && 1e3 < o.max && 9999 > o.max)), !!this.tickAmount)), this.tickAmount || (o.tickInterval = o.unsquish()), this.setTickPositions()
                        },
                        setTickPositions: function() {
                            var t, e = this.options,
                                i = e.tickPositions,
                                r = e.tickPositioner,
                                n = e.startOnTick,
                                o = e.endOnTick;
                            this.tickmarkOffset = this.categories && "between" === e.tickmarkPlacement && 1 === this.tickInterval ? .5 : 0, this.minorTickInterval = "auto" === e.minorTickInterval && this.tickInterval ? this.tickInterval / 5 : e.minorTickInterval, this.single = this.min === this.max && t3(this.min) && !this.tickAmount && (parseInt(this.min, 10) === this.min || !1 !== e.allowDecimals), this.tickPositions = t = i && i.slice(), !t && ((t = this.isDatetimeAxis ? this.getTimeTicks(this.normalizeTimeTickInterval(this.tickInterval, e.units), this.min, this.max, e.startOfWeek, this.ordinalPositions, this.closestPointRange, !0) : this.isLog ? this.getLogTickPositions(this.tickInterval, this.min, this.max) : this.getLinearTickPositions(this.tickInterval, this.min, this.max)).length > this.len && (t = [t[0], t.pop()]), this.tickPositions = t, r && (r = r.apply(this, [this.min, this.max]))) && (this.tickPositions = t = r), this.paddedTicks = t.slice(0), this.trimTicks(t, n, o), this.isLinked || (this.single && 2 > t.length && (this.min -= .5, this.max += .5), i || r || this.adjustTickAmount())
                        },
                        trimTicks: function(t, e, i) {
                            var r = t[0],
                                n = t[t.length - 1],
                                o = this.minPointOffset || 0;
                            if (!this.isLinked) {
                                if (e && -1 / 0 !== r) this.min = r;
                                else
                                    for (; this.min - o > t[0];) t.shift();
                                if (i) this.max = n;
                                else
                                    for (; this.max + o < t[t.length - 1];) t.pop();
                                0 === t.length && t3(r) && t.push((n + r) / 2)
                            }
                        },
                        alignToOthers: function() {
                            var t, e = {},
                                i = this.options;
                            return !1 === this.chart.options.chart.alignTicks || !1 === i.alignTicks || this.isLog || t9(this.chart[this.coll], function(i) {
                                var r = i.options,
                                    r = [i.horiz ? r.left : r.top, r.width, r.height, r.pane].join();
                                i.series.length && (e[r] ? t = !0 : e[r] = 1)
                            }), t
                        },
                        getTickAmount: function() {
                            var t = this.options,
                                e = t.tickAmount,
                                i = t.tickPixelInterval;
                            !t3(t.tickInterval) && this.len < i && !this.isRadial && !this.isLog && t.startOnTick && t.endOnTick && (e = 2), !e && this.alignToOthers() && (e = Math.ceil(this.len / i) + 1), 4 > e && (this.finalTickAmt = e, e = 5), this.tickAmount = e
                        },
                        adjustTickAmount: function() {
                            var t = this.tickInterval,
                                e = this.tickPositions,
                                i = this.tickAmount,
                                r = this.finalTickAmt,
                                n = e && e.length;
                            if (n < i) {
                                for (; e.length < i;) e.push(t1(e[e.length - 1] + t));
                                this.transA *= (n - 1) / (i - 1), this.max = e[e.length - 1]
                            } else n > i && (this.tickInterval *= 2, this.setTickPositions());
                            if (t3(r)) {
                                for (t = i = e.length; t--;)(3 === r && 1 == t % 2 || 2 >= r && 0 < t && t < i - 1) && e.splice(t, 1);
                                this.finalTickAmt = void 0
                            }
                        },
                        setScale: function() {
                            var t, e;
                            this.oldMin = this.min, this.oldMax = this.max, this.oldAxisLength = this.len, this.setAxisSize(), e = this.len !== this.oldAxisLength, t9(this.series, function(e) {
                                (e.isDirtyData || e.isDirty || e.xAxis.isDirty) && (t = !0)
                            }), e || t || this.isLinked || this.forceRedraw || this.userMin !== this.oldUserMin || this.userMax !== this.oldUserMax || this.alignToOthers() ? (this.resetStacks && this.resetStacks(), this.forceRedraw = !1, this.getSeriesExtremes(), this.setTickInterval(), this.oldUserMin = this.userMin, this.oldUserMax = this.userMax, this.isDirty || (this.isDirty = e || this.min !== this.oldMin || this.max !== this.oldMax)) : this.cleanStacks && this.cleanStacks()
                        },
                        setExtremes: function(t, e, i, r, n) {
                            var o = this,
                                s = o.chart;
                            i = eh(i, !0), t9(o.series, function(t) {
                                delete t.kdTree
                            }), t4(o, "setExtremes", n = t8(n, {
                                min: t,
                                max: e
                            }), function() {
                                o.userMin = t, o.userMax = e, o.eventArgs = n, i && s.redraw(r)
                            })
                        },
                        zoom: function(t, e) {
                            var i = this.dataMin,
                                r = this.dataMax,
                                n = this.options,
                                o = Math.min(i, eh(n.min, i)),
                                n = Math.max(r, eh(n.max, r));
                            return (t !== this.min || e !== this.max) && (this.allowZoomOutside || (t3(i) && (t < o && (t = o), t > n && (t = n)), t3(r) && (e < o && (e = o), e > n && (e = n))), this.displayBtn = void 0 !== t || void 0 !== e, this.setExtremes(t, e, !1, void 0, {
                                trigger: "zoom"
                            })), !0
                        },
                        setAxisSize: function() {
                            var t = this.chart,
                                e = this.options,
                                i = e.offsets || [0, 0, 0, 0],
                                r = this.horiz,
                                n = this.width = Math.round(tq.relativeLength(eh(e.width, t.plotWidth - i[3] + i[1]), t.plotWidth)),
                                o = this.height = Math.round(tq.relativeLength(eh(e.height, t.plotHeight - i[0] + i[2]), t.plotHeight)),
                                s = this.top = Math.round(tq.relativeLength(eh(e.top, t.plotTop + i[0]), t.plotHeight, t.plotTop)),
                                e = this.left = Math.round(tq.relativeLength(eh(e.left, t.plotLeft + i[3]), t.plotWidth, t.plotLeft));
                            this.bottom = t.chartHeight - o - s, this.right = t.chartWidth - n - e, this.len = Math.max(r ? n : o, 0), this.pos = r ? e : s
                        },
                        getExtremes: function() {
                            var t = this.isLog,
                                e = this.lin2log;
                            return {
                                min: t ? t1(e(this.min)) : this.min,
                                max: t ? t1(e(this.max)) : this.max,
                                dataMin: this.dataMin,
                                dataMax: this.dataMax,
                                userMin: this.userMin,
                                userMax: this.userMax
                            }
                        },
                        getThreshold: function(t) {
                            var e = this.isLog,
                                i = this.lin2log,
                                r = e ? i(this.min) : this.min,
                                e = e ? i(this.max) : this.max;
                            return null === t || r > t ? t = r : e < t && (t = e), this.translate(t, 0, 1, 0, 1)
                        },
                        autoLabelAlign: function(t) {
                            return 15 < (t = (eh(t, 0) - 90 * this.side + 720) % 360) && 165 > t ? "right" : 195 < t && 345 > t ? "left" : "center"
                        },
                        tickSize: function(t) {
                            var e = this.options,
                                i = e[t + "Length"],
                                r = eh(e[t + "Width"], "tick" === t && this.isXAxis ? 1 : 0);
                            if (r && i) return "inside" === e[t + "Position"] && (i = -i), [i, r]
                        },
                        labelMetrics: function() {
                            var t = this.tickPositions && this.tickPositions[0] || 0;
                            return this.chart.renderer.fontMetrics(this.options.labels.style && this.options.labels.style.fontSize, this.ticks[t] && this.ticks[t].label)
                        },
                        unsquish: function() {
                            var t, e, i, r = this.options.labels,
                                n = this.horiz,
                                o = this.tickInterval,
                                s = o,
                                a = this.len / ((+!!this.categories + this.max - this.min) / o),
                                l = r.rotation,
                                h = this.labelMetrics(),
                                c = Number.MAX_VALUE,
                                d = function(t) {
                                    return t /= a || 1, (t = 1 < t ? Math.ceil(t) : 1) * o
                                };
                            return n ? (i = !r.staggerLines && !r.step && (t3(l) ? [l] : a < eh(r.autoRotationLimit, 80) && r.autoRotation)) && t9(i, function(i) {
                                var r;
                                (i === l || i && -90 <= i && 90 >= i) && (r = (e = d(Math.abs(h.h / Math.sin(t5 * i)))) + Math.abs(i / 360)) < c && (c = r, t = i, s = e)
                            }) : r.step || (s = d(h.h)), this.autoRotation = i, this.labelRotation = eh(t, l), s
                        },
                        getSlotWidth: function() {
                            var t = this.chart,
                                e = this.horiz,
                                i = this.options.labels,
                                r = Math.max(this.tickPositions.length - !this.categories, 1),
                                n = t.margin[3];
                            return e && 2 > (i.step || 0) && !i.rotation && (this.staggerLines || 1) * this.len / r || !e && (n && n - t.spacing[3] || .33 * t.chartWidth)
                        },
                        renderUnsquish: function() {
                            var t, e, i, r = this.chart,
                                n = r.renderer,
                                o = this.tickPositions,
                                s = this.ticks,
                                a = this.options.labels,
                                l = this.horiz,
                                h = this.getSlotWidth(),
                                c = Math.max(1, Math.round(h - 2 * (a.padding || 5))),
                                d = {},
                                u = this.labelMetrics(),
                                p = a.style && a.style.textOverflow,
                                f = 0;
                            if (eo(a.rotation) || (d.rotation = a.rotation || 0), t9(o, function(t) {
                                    (t = s[t]) && t.labelLength > f && (f = t.labelLength)
                                }), this.maxLabelLength = f, this.autoRotation) f > c && f > u.h ? d.rotation = this.labelRotation : this.labelRotation = 0;
                            else if (h && (t = {
                                    width: c + "px"
                                }, !p))
                                for (t.textOverflow = "clip", e = o.length; !l && e--;)(c = s[i = o[e]].label) && (c.styles && "ellipsis" === c.styles.textOverflow ? c.css({
                                    textOverflow: "clip"
                                }) : s[i].labelLength > h && c.css({
                                    width: h + "px"
                                }), c.getBBox().height > this.len / o.length - (u.h - u.f) && (c.specCss = {
                                    textOverflow: "ellipsis"
                                }));
                            d.rotation && (t = {
                                width: (f > .5 * r.chartHeight ? .33 * r.chartHeight : r.chartHeight) + "px"
                            }, p || (t.textOverflow = "ellipsis")), (this.labelAlign = a.align || this.autoLabelAlign(this.labelRotation)) && (d.align = this.labelAlign), t9(o, function(e) {
                                var i = (e = s[e]) && e.label;
                                i && (i.attr(d), t && i.css(es(t, i.specCss)), delete i.specCss, e.rotation = d.rotation)
                            }), this.tickRotCorr = n.rotCorr(u.b, this.labelRotation || 0, 0 !== this.side)
                        },
                        hasData: function() {
                            return this.hasVisibleSeries || t3(this.min) && t3(this.max) && !!this.tickPositions
                        },
                        addTitle: function(t) {
                            var e, i = this.chart.renderer,
                                r = this.horiz,
                                n = this.opposite,
                                o = this.options.title;
                            this.axisTitle || ((e = o.textAlign) || (e = (r ? {
                                low: "left",
                                middle: "center",
                                high: "right"
                            } : {
                                low: n ? "right" : "left",
                                middle: "center",
                                high: n ? "left" : "right"
                            })[o.align]), this.axisTitle = i.text(o.text, 0, 0, o.useHTML).attr({
                                zIndex: 7,
                                rotation: o.rotation || 0,
                                align: e
                            }).addClass("highcharts-axis-title").css(o.style).add(this.axisGroup), this.axisTitle.isNew = !0), o.style.width || this.isRadial || this.axisTitle.css({
                                width: this.len
                            }), this.axisTitle[t ? "show" : "hide"](!0)
                        },
                        generateTick: function(t) {
                            var e = this.ticks;
                            e[t] ? e[t].addLabel() : e[t] = new ep(this, t)
                        },
                        getOffset: function() {
                            var t, e, i, r = this,
                                n = r.chart,
                                o = n.renderer,
                                s = r.options,
                                a = r.tickPositions,
                                l = r.ticks,
                                h = r.horiz,
                                c = r.side,
                                d = n.inverted && !r.isZAxis ? [1, 0, 3, 2][c] : c,
                                u = 0,
                                p = 0,
                                f = s.title,
                                g = s.labels,
                                m = 0,
                                v = n.axisOffset,
                                n = n.clipOffset,
                                y = [-1, 1, 1, -1][c],
                                b = s.className,
                                x = r.axisParent,
                                w = this.tickSize("tick");
                            t = r.hasData(), r.showAxis = e = t || eh(s.showEmpty, !0), r.staggerLines = r.horiz && g.staggerLines, r.axisGroup || (r.gridGroup = o.g("grid").attr({
                                zIndex: s.gridZIndex || 1
                            }).addClass("highcharts-" + this.coll.toLowerCase() + "-grid " + (b || "")).add(x), r.axisGroup = o.g("axis").attr({
                                zIndex: s.zIndex || 2
                            }).addClass("highcharts-" + this.coll.toLowerCase() + " " + (b || "")).add(x), r.labelGroup = o.g("axis-labels").attr({
                                zIndex: g.zIndex || 7
                            }).addClass("highcharts-" + r.coll.toLowerCase() + "-labels " + (b || "")).add(x)), t || r.isLinked ? (t9(a, function(t, e) {
                                r.generateTick(t, e)
                            }), r.renderUnsquish(), !1 === g.reserveSpace || 0 !== c && 2 !== c && ({
                                1: "left",
                                3: "right"
                            })[c] !== r.labelAlign && "center" !== r.labelAlign || t9(a, function(t) {
                                m = Math.max(l[t].getLabelSize(), m)
                            }), r.staggerLines && (m *= r.staggerLines, r.labelOffset = m * (r.opposite ? -1 : 1))) : el(l, function(t, e) {
                                t.destroy(), delete l[e]
                            }), f && f.text && !1 !== f.enabled && (r.addTitle(e), e && !1 !== f.reserveSpace && (r.titleOffset = u = r.axisTitle.getBBox()[h ? "height" : "width"], p = t3(i = f.offset) ? 0 : eh(f.margin, h ? 5 : 10))), r.renderLine(), r.offset = y * eh(s.offset, v[c]), r.tickRotCorr = r.tickRotCorr || {
                                x: 0,
                                y: 0
                            }, o = 0 === c ? -r.labelMetrics().h : 2 === c ? r.tickRotCorr.y : 0, p = Math.abs(m) + p, m && (p = p - o + y * (h ? eh(g.y, r.tickRotCorr.y + 8 * y) : g.x)), r.axisTitleMargin = eh(i, p), v[c] = Math.max(v[c], r.axisTitleMargin + u + y * r.offset, p, t && a.length && w ? w[0] + y * r.offset : 0), a = 2 * Math.floor(r.axisLine.strokeWidth() / 2), 0 < s.offset && (a -= 2 * s.offset), n[d] = Math.max(n[d] || a, a)
                        },
                        getLinePath: function(t) {
                            var e = this.chart,
                                i = this.opposite,
                                r = this.offset,
                                n = this.horiz,
                                o = this.left + (i ? this.width : 0) + r,
                                r = e.chartHeight - this.bottom - (i ? this.height : 0) + r;
                            return i && (t *= -1), e.renderer.crispLine(["M", n ? this.left : o, n ? r : this.top, "L", n ? e.chartWidth - this.right : o, n ? r : e.chartHeight - this.bottom], t)
                        },
                        renderLine: function() {
                            this.axisLine || (this.axisLine = this.chart.renderer.path().addClass("highcharts-axis-line").add(this.axisGroup), this.axisLine.attr({
                                stroke: this.options.lineColor,
                                "stroke-width": this.options.lineWidth,
                                zIndex: 7
                            }))
                        },
                        getTitlePosition: function() {
                            var t = this.horiz,
                                e = this.left,
                                i = this.top,
                                r = this.len,
                                n = this.options.title,
                                o = t ? e : i,
                                s = this.opposite,
                                a = this.offset,
                                l = n.x || 0,
                                h = n.y || 0,
                                c = this.axisTitle,
                                d = this.chart.renderer.fontMetrics(n.style && n.style.fontSize, c),
                                c = Math.max(c.getBBox(null, 0).height - d.h - 1, 0),
                                r = {
                                    low: o + (t ? 0 : r),
                                    middle: o + r / 2,
                                    high: o + (t ? r : 0)
                                } [n.align],
                                e = (t ? i + this.height : e) + (t ? 1 : -1) * (s ? -1 : 1) * this.axisTitleMargin + [-c, c, d.f, -c][this.side];
                            return {
                                x: t ? r + l : e + (s ? this.width : 0) + a + l,
                                y: t ? e + h - (s ? this.height : 0) + a : r + h
                            }
                        },
                        renderMinorTick: function(t) {
                            var e = this.chart.hasRendered && en(this.oldMin),
                                i = this.minorTicks;
                            i[t] || (i[t] = new ep(this, t, "minor")), e && i[t].isNew && i[t].render(null, !0), i[t].render(null, !1, 1)
                        },
                        renderTick: function(t, e) {
                            var i = this.isLinked,
                                r = this.ticks,
                                n = this.chart.hasRendered && en(this.oldMin);
                            (!i || t >= this.min && t <= this.max) && (r[t] || (r[t] = new ep(this, t)), n && r[t].isNew && r[t].render(e, !0, .1), r[t].render(e))
                        },
                        render: function() {
                            var t, e, i = this,
                                r = i.chart,
                                n = i.options,
                                o = i.isLog,
                                s = i.lin2log,
                                a = i.isLinked,
                                l = i.tickPositions,
                                h = i.axisTitle,
                                c = i.ticks,
                                d = i.minorTicks,
                                u = i.alternateBands,
                                p = n.stackLabels,
                                f = n.alternateGridColor,
                                g = i.tickmarkOffset,
                                m = i.axisLine,
                                v = i.showAxis,
                                y = tZ(r.renderer.globalAnimation);
                            i.labelEdge.length = 0, i.overlap = !1, t9([c, d, u], function(t) {
                                el(t, function(t) {
                                    t.isActive = !1
                                })
                            }), (i.hasData() || a) && (i.minorTickInterval && !i.categories && t9(i.getMinorTickPositions(), function(t) {
                                i.renderMinorTick(t)
                            }), l.length && (t9(l, function(t, e) {
                                i.renderTick(t, e)
                            }), g && (0 === i.min || i.single) && (c[-1] || (c[-1] = new ep(i, -1, null, !0)), c[-1].render(-1))), f && t9(l, function(n, a) {
                                e = void 0 !== l[a + 1] ? l[a + 1] + g : i.max - g, 0 == a % 2 && n < i.max && e <= i.max + (r.polar ? -g : g) && (u[n] || (u[n] = new tq.PlotLineOrBand(i)), t = n + g, u[n].options = {
                                    from: o ? s(t) : t,
                                    to: o ? s(e) : e,
                                    color: f
                                }, u[n].render(), u[n].isActive = !0)
                            }), i._addedPlotLB || (t9((n.plotLines || []).concat(n.plotBands || []), function(t) {
                                i.addPlotBandOrLine(t)
                            }), i._addedPlotLB = !0)), t9([c, d, u], function(t) {
                                var e, i = [],
                                    n = y.duration;
                                el(t, function(t, e) {
                                    t.isActive || (t.render(e, !1, 0), t.isActive = !1, i.push(e))
                                }), eu(function() {
                                    for (e = i.length; e--;) t[i[e]] && !t[i[e]].isActive && (t[i[e]].destroy(), delete t[i[e]])
                                }, t !== u && r.hasRendered && n ? n : 0)
                            }), m && (m[m.isPlaced ? "animate" : "attr"]({
                                d: this.getLinePath(m.strokeWidth())
                            }), m.isPlaced = !0, m[v ? "show" : "hide"](!0)), h && v && (en((n = i.getTitlePosition()).y) ? (h[h.isNew ? "attr" : "animate"](n), h.isNew = !1) : (h.attr("y", -9999), h.isNew = !0)), p && p.enabled && i.renderStackTotals(), i.isDirty = !1
                        },
                        redraw: function() {
                            this.visible && (this.render(), t9(this.plotLinesAndBands, function(t) {
                                t.render()
                            })), t9(this.series, function(t) {
                                t.isDirty = !0
                            })
                        },
                        keepProps: "extKey hcEvents names series userMax userMin".split(" "),
                        destroy: function(t) {
                            var e, i = this,
                                r = i.stacks,
                                n = i.plotLinesAndBands;
                            if (t || ec(i), el(r, function(t, e) {
                                    t6(t), r[e] = null
                                }), t9([i.ticks, i.minorTicks, i.alternateBands], function(t) {
                                    t6(t)
                                }), n)
                                for (t = n.length; t--;) n[t].destroy();
                            for (e in t9("stackTotalGroup axisLine axisTitle axisGroup gridGroup labelGroup cross".split(" "), function(t) {
                                    i[t] && (i[t] = i[t].destroy())
                                }), i.plotLinesAndBandsGroups) i.plotLinesAndBandsGroups[e] = i.plotLinesAndBandsGroups[e].destroy();
                            el(i, function(t, e) {
                                -1 === ei(e, i.keepProps) && delete i[e]
                            })
                        },
                        drawCrosshair: function(t, e) {
                            var i, r, n = this.crosshair,
                                o = eh(n.snap, !0),
                                s = this.cross;
                            t || (t = this.cross && this.cross.e), this.crosshair && !1 !== (t3(e) || !o) ? (o ? t3(e) && (r = this.isXAxis ? e.plotX : this.len - e.plotY) : r = t && (this.horiz ? t.chartX - this.pos : this.len - t.chartY + this.pos), t3(r) && (i = this.getPlotLinePath(e && (this.isXAxis ? e.x : eh(e.stackY, e.y)), null, null, null, r) || null), t3(i) ? (e = this.categories && !this.isRadial, s || (this.cross = s = this.chart.renderer.path().addClass("highcharts-crosshair highcharts-crosshair-" + (e ? "category " : "thin ") + n.className).attr({
                                zIndex: eh(n.zIndex, 2)
                            }).add(), s.attr({
                                stroke: n.color || (e ? t0("#ccd6eb").setOpacity(.25).get() : "#cccccc"),
                                "stroke-width": eh(n.width, 1)
                            }), n.dashStyle && s.attr({
                                dashstyle: n.dashStyle
                            })), s.show().attr({
                                d: i
                            }), e && !n.width && s.attr({
                                "stroke-width": this.transA
                            }), this.cross.e = t) : this.hideCrosshair()) : this.hideCrosshair()
                        },
                        hideCrosshair: function() {
                            this.cross && this.cross.hide()
                        }
                    }), tq.Axis = ef);
                    return em = (eg = t).Axis, ev = eg.Date, ey = eg.dateFormat, eb = eg.defaultOptions, ex = eg.defined, ew = eg.each, ek = eg.extend, eS = eg.getMagnitude, eM = eg.getTZOffset, eC = eg.normalizeTickInterval, eA = eg.pick, eT = eg.timeUnits, em.prototype.getTimeTicks = function(t, e, i, r) {
                        var n, o, s, a = [],
                            l = {},
                            h = eb.global.useUTC,
                            c = new ev(e - Math.max(eM(e), eM(i))),
                            d = ev.hcMakeTime,
                            u = t.unitRange,
                            p = t.count;
                        if (ex(e)) {
                            c[ev.hcSetMilliseconds](u >= eT.second ? 0 : p * Math.floor(c.getMilliseconds() / p)), u >= eT.second && c[ev.hcSetSeconds](u >= eT.minute ? 0 : p * Math.floor(c.getSeconds() / p)), u >= eT.minute && c[ev.hcSetMinutes](u >= eT.hour ? 0 : p * Math.floor(c[ev.hcGetMinutes]() / p)), u >= eT.hour && c[ev.hcSetHours](u >= eT.day ? 0 : p * Math.floor(c[ev.hcGetHours]() / p)), u >= eT.day && c[ev.hcSetDate](u >= eT.month ? 1 : p * Math.floor(c[ev.hcGetDate]() / p)), u >= eT.month && (c[ev.hcSetMonth](u >= eT.year ? 0 : p * Math.floor(c[ev.hcGetMonth]() / p)), n = c[ev.hcGetFullYear]()), u >= eT.year && c[ev.hcSetFullYear](n - n % p), u === eT.week && c[ev.hcSetDate](c[ev.hcGetDate]() - c[ev.hcGetDay]() + eA(r, 1)), n = c[ev.hcGetFullYear](), r = c[ev.hcGetMonth]();
                            var f = c[ev.hcGetDate](),
                                g = c[ev.hcGetHours]();
                            for ((ev.hcTimezoneOffset || ev.hcGetTimezoneOffset) && (s = (!h || !!ev.hcGetTimezoneOffset) && (i - e > 4 * eT.month || eM(e) !== eM(i)), o = eM(c = c.getTime()), c = new ev(c + o)), h = c.getTime(), e = 1; h < i;) a.push(h), h = u === eT.year ? d(n + e * p, 0) : u === eT.month ? d(n, r + e * p) : s && (u === eT.day || u === eT.week) ? d(n, r, f + e * p * (u === eT.day ? 1 : 7)) : s && u === eT.hour ? d(n, r, f, g + e * p, 0, 0, o) - o : h + u * p, e++;
                            a.push(h), u <= eT.hour && 1e4 > a.length && ew(a, function(t) {
                                0 == t % 18e5 && "000000000" === ey("%H%M%S%L", t) && (l[t] = "day")
                            })
                        }
                        return a.info = ek(t, {
                            higherRanks: l,
                            totalRange: u * p
                        }), a
                    }, em.prototype.normalizeTimeTickInterval = function(t, e) {
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
                            n = eT[(e = r[r.length - 1])[0]],
                            o = e[1];
                        for (i = 0; i < r.length && (n = eT[(e = r[i])[0]], o = e[1], !r[i + 1] || !(t <= (n * o[o.length - 1] + eT[r[i + 1][0]]) / 2)); i++);
                        return n === eT.year && t < 5 * n && (o = [1, 2, 5]), t = eC(t / n, o, "year" === e[0] ? Math.max(eS(t / n), 1) : 1), {
                            unitRange: n,
                            count: t,
                            unitName: e[0]
                        }
                    }, eO = (eP = t).Axis, eI = eP.getMagnitude, eL = eP.map, eD = eP.normalizeTickInterval, eE = eP.pick, eO.prototype.getLogTickPositions = function(t, e, i, r) {
                        var n = this.options,
                            o = this.len,
                            s = this.lin2log,
                            a = this.log2lin,
                            l = [];
                        if (r || (this._minorAutoInterval = null), .5 <= t) t = Math.round(t), l = this.getLinearTickPositions(t, e, i);
                        else if (.08 <= t)
                            for (var h, c, d, u, p, o = Math.floor(e), n = .3 < t ? [1, 2, 4] : .15 < t ? [1, 2, 4, 6, 8] : [1, 2, 3, 4, 5, 6, 7, 8, 9]; o < i + 1 && !p; o++)
                                for (c = n.length, h = 0; h < c && !p; h++)(d = a(s(o) * n[h])) > e && (!r || u <= i) && void 0 !== u && l.push(u), u > i && (p = !0), u = d;
                        else e = s(e), i = s(i), t = eD(t = eE("auto" === (t = n[r ? "minorTickInterval" : "tickInterval"]) ? null : t, this._minorAutoInterval, n.tickPixelInterval / (r ? 5 : 1) * (i - e) / ((r ? o / this.tickPositions.length : o) || 1)), null, eI(t)), l = eL(this.getLinearTickPositions(t, e, i), a), r || (this._minorAutoInterval = t / 5);
                        return r || (this.tickInterval = t), l
                    }, eO.prototype.log2lin = function(t) {
                        return Math.log(t) / Math.LN10
                    }, eO.prototype.lin2log = function(t) {
                        return Math.pow(10, t)
                    }, eN = (ej = t).arrayMax, eR = ej.arrayMin, eB = ej.defined, ez = ej.destroyObjectProperties, eG = ej.each, eW = ej.erase, eH = ej.merge, eF = ej.pick, ej.PlotLineOrBand = function(t, e) {
                        this.axis = t, e && (this.options = e, this.id = e.id)
                    }, ej.PlotLineOrBand.prototype = {
                        render: function() {
                            var t = this,
                                e = t.axis,
                                i = e.horiz,
                                r = t.options,
                                n = r.label,
                                o = t.label,
                                s = r.to,
                                a = r.from,
                                l = r.value,
                                h = eB(a) && eB(s),
                                c = eB(l),
                                d = t.svgElem,
                                u = !d,
                                p = [],
                                f = r.color,
                                g = eF(r.zIndex, 0),
                                m = r.events,
                                p = {
                                    class: "highcharts-plot-" + (h ? "band " : "line ") + (r.className || "")
                                },
                                v = {},
                                y = e.chart.renderer,
                                b = h ? "bands" : "lines",
                                x = e.log2lin;
                            if (e.isLog && (a = x(a), s = x(s), l = x(l)), c ? (p = {
                                    stroke: f,
                                    "stroke-width": r.width
                                }, r.dashStyle && (p.dashstyle = r.dashStyle)) : h && (f && (p.fill = f), r.borderWidth && (p.stroke = r.borderColor, p["stroke-width"] = r.borderWidth)), v.zIndex = g, b += "-" + g, (f = e.plotLinesAndBandsGroups[b]) || (e.plotLinesAndBandsGroups[b] = f = y.g("plot-" + b).attr(v).add()), u && (t.svgElem = d = y.path().attr(p).add(f)), c) p = e.getPlotLinePath(l, d.strokeWidth());
                            else {
                                if (!h) return;
                                p = e.getPlotBandPath(a, s, r)
                            }
                            return u && p && p.length ? (d.attr({
                                d: p
                            }), m && ej.objectEach(m, function(e, i) {
                                d.on(i, function(e) {
                                    m[i].apply(t, [e])
                                })
                            })) : d && (p ? (d.show(), d.animate({
                                d: p
                            })) : (d.hide(), o && (t.label = o = o.destroy()))), n && eB(n.text) && p && p.length && 0 < e.width && 0 < e.height && !p.flat ? (n = eH({
                                align: i && h && "center",
                                x: i ? !h && 4 : 10,
                                verticalAlign: !i && h && "middle",
                                y: i ? h ? 16 : 10 : h ? 6 : -4,
                                rotation: i && !h && 90
                            }, n), this.renderLabel(n, p, h, g)) : o && o.hide(), t
                        },
                        renderLabel: function(t, e, i, r) {
                            var n = this.label,
                                o = this.axis.chart.renderer;
                            n || ((n = {
                                align: t.textAlign || t.align,
                                rotation: t.rotation,
                                class: "highcharts-plot-" + (i ? "band" : "line") + "-label " + (t.className || "")
                            }).zIndex = r, this.label = n = o.text(t.text, 0, 0, t.useHTML).attr(n).add(), n.css(t.style)), r = [e[1], e[4], i ? e[6] : e[1]], e = [e[2], e[5], i ? e[7] : e[2]], i = eR(r), o = eR(e), n.align(t, !1, {
                                x: i,
                                y: o,
                                width: eN(r) - i,
                                height: eN(e) - o
                            }), n.show()
                        },
                        destroy: function() {
                            eW(this.axis.plotLinesAndBands, this), delete this.axis, ez(this)
                        }
                    }, ej.extend(oR.prototype, {
                        getPlotBandPath: function(t, e) {
                            var i = this.getPlotLinePath(e, null, null, !0),
                                r = this.getPlotLinePath(t, null, null, !0),
                                n = this.horiz,
                                o = 1;
                            return t = t < this.min && e < this.min || t > this.max && e > this.max, r && i ? (t && (r.flat = r.toString() === i.toString(), o = 0), r.push(n && i[4] === r[4] ? i[4] + o : i[4], n || i[5] !== r[5] ? i[5] : i[5] + o, n && i[1] === r[1] ? i[1] + o : i[1], n || i[2] !== r[2] ? i[2] : i[2] + o)) : r = null, r
                        },
                        addPlotBand: function(t) {
                            return this.addPlotBandOrLine(t, "plotBands")
                        },
                        addPlotLine: function(t) {
                            return this.addPlotBandOrLine(t, "plotLines")
                        },
                        addPlotBandOrLine: function(t, e) {
                            var i = new ej.PlotLineOrBand(this, t).render(),
                                r = this.userOptions;
                            return i && (e && (r[e] = r[e] || [], r[e].push(t)), this.plotLinesAndBands.push(i)), i
                        },
                        removePlotBandOrLine: function(t) {
                            for (var e = this.plotLinesAndBands, i = this.options, r = this.userOptions, n = e.length; n--;) e[n].id === t && e[n].destroy();
                            eG([i.plotLines || [], r.plotLines || [], i.plotBands || [], r.plotBands || []], function(e) {
                                for (n = e.length; n--;) e[n].id === t && eW(e, e[n])
                            })
                        },
                        removePlotBand: function(t) {
                            this.removePlotBandOrLine(t)
                        },
                        removePlotLine: function(t) {
                            this.removePlotBandOrLine(t)
                        }
                    }), eY = (eX = t).dateFormat, eV = eX.each, eU = eX.extend, e_ = eX.format, eK = eX.isNumber, eq = eX.map, e$ = eX.merge, eZ = eX.pick, eJ = eX.splat, eQ = eX.syncTimeout, e0 = eX.timeUnits, eX.Tooltip = function() {
                        this.init.apply(this, arguments)
                    }, eX.Tooltip.prototype = {
                        init: function(t, e) {
                            this.chart = t, this.options = e, this.crosshairs = [], this.now = {
                                x: 0,
                                y: 0
                            }, this.isHidden = !0, this.split = e.split && !t.inverted, this.shared = e.shared || this.split
                        },
                        cleanSplit: function(t) {
                            eV(this.chart.series, function(e) {
                                var i = e && e.tt;
                                i && (!i.isActive || t ? e.tt = i.destroy() : i.isActive = !1)
                            })
                        },
                        getLabel: function() {
                            var t = this.chart.renderer,
                                e = this.options;
                            return this.label || (this.split ? this.label = t.g("tooltip") : (this.label = t.label("", 0, 0, e.shape || "callout", null, null, e.useHTML, null, "tooltip").attr({
                                padding: e.padding,
                                r: e.borderRadius
                            }), this.label.attr({
                                fill: e.backgroundColor,
                                "stroke-width": e.borderWidth
                            }).css(e.style).shadow(e.shadow)), this.label.attr({
                                zIndex: 8
                            }).add()), this.label
                        },
                        update: function(t) {
                            this.destroy(), e$(!0, this.chart.options.tooltip.userOptions, t), this.init(this.chart, e$(!0, this.options, t))
                        },
                        destroy: function() {
                            this.label && (this.label = this.label.destroy()), this.split && this.tt && (this.cleanSplit(this.chart, !0), this.tt = this.tt.destroy()), clearTimeout(this.hideTimer), clearTimeout(this.tooltipTimeout)
                        },
                        move: function(t, e, i, r) {
                            var n = this,
                                o = n.now,
                                s = !1 !== n.options.animation && !n.isHidden && (1 < Math.abs(t - o.x) || 1 < Math.abs(e - o.y)),
                                a = n.followPointer || 1 < n.len;
                            eU(o, {
                                x: s ? (2 * o.x + t) / 3 : t,
                                y: s ? (o.y + e) / 2 : e,
                                anchorX: a ? void 0 : s ? (2 * o.anchorX + i) / 3 : i,
                                anchorY: a ? void 0 : s ? (o.anchorY + r) / 2 : r
                            }), n.getLabel().attr(o), s && (clearTimeout(this.tooltipTimeout), this.tooltipTimeout = setTimeout(function() {
                                n && n.move(t, e, i, r)
                            }, 32))
                        },
                        hide: function(t) {
                            var e = this;
                            clearTimeout(this.hideTimer), t = eZ(t, this.options.hideDelay, 500), this.isHidden || (this.hideTimer = eQ(function() {
                                e.getLabel()[t ? "fadeOut" : "hide"](), e.isHidden = !0
                            }, t))
                        },
                        getAnchor: function(t, e) {
                            var i, r, n, o = this.chart,
                                s = o.inverted,
                                a = o.plotTop,
                                l = o.plotLeft,
                                h = 0,
                                c = 0;
                            return i = (t = eJ(t))[0].tooltipPos, this.followPointer && e && (void 0 === e.chartX && (e = o.pointer.normalize(e)), i = [e.chartX - o.plotLeft, e.chartY - a]), i || (eV(t, function(t) {
                                r = t.series.yAxis, n = t.series.xAxis, h += t.plotX + (!s && n ? n.left - l : 0), c += (t.plotLow ? (t.plotLow + t.plotHigh) / 2 : t.plotY) + (!s && r ? r.top - a : 0)
                            }), h /= t.length, c /= t.length, i = [s ? o.plotWidth - c : h, this.shared && !s && 1 < t.length && e ? e.chartY - a : s ? o.plotHeight - h : c]), eq(i, Math.round)
                        },
                        getPosition: function(t, e, i) {
                            var r, n = this.chart,
                                o = this.distance,
                                s = {},
                                a = i.h || 0,
                                l = ["y", n.chartHeight, e, i.plotY + n.plotTop, n.plotTop, n.plotTop + n.plotHeight],
                                h = ["x", n.chartWidth, t, i.plotX + n.plotLeft, n.plotLeft, n.plotLeft + n.plotWidth],
                                c = !this.followPointer && eZ(i.ttBelow, !n.inverted == !!i.negative),
                                d = function(t, e, i, r, n, l) {
                                    var h = i < r - o,
                                        d = r + o + i < e,
                                        u = r - o - i;
                                    if (r += o, c && d) s[t] = r;
                                    else if (!c && h) s[t] = u;
                                    else if (h) s[t] = Math.min(l - i, 0 > u - a ? u : u - a);
                                    else {
                                        if (!d) return !1;
                                        s[t] = Math.max(n, r + a + i > e ? r : r + a)
                                    }
                                },
                                u = function(t, e, i, r) {
                                    var n;
                                    return r < o || r > e - o ? n = !1 : s[t] = r < i / 2 ? 1 : r > e - i / 2 ? e - i - 2 : r - i / 2, n
                                },
                                p = function(t) {
                                    var e = l;
                                    l = h, h = e, r = t
                                },
                                f = function() {
                                    !1 !== d.apply(0, l) ? !1 !== u.apply(0, h) || r || (p(!0), f()) : r ? s.x = s.y = 0 : (p(!0), f())
                                };
                            return (n.inverted || 1 < this.len) && p(), f(), s
                        },
                        defaultFormatter: function(t) {
                            var e, i = this.points || eJ(this);
                            return (e = (e = [t.tooltipFooterHeaderFormatter(i[0])]).concat(t.bodyFormatter(i))).push(t.tooltipFooterHeaderFormatter(i[0], !0)), e
                        },
                        refresh: function(t, e) {
                            var i, r, n, o = this.options,
                                s = t,
                                a = {},
                                l = [];
                            i = o.formatter || this.defaultFormatter;
                            var h, a = this.shared;
                            o.enabled && (clearTimeout(this.hideTimer), this.followPointer = eJ(s)[0].series.tooltipOptions.followPointer, e = (n = this.getAnchor(s, e))[0], r = n[1], !a || s.series && s.series.noSharedTooltip ? a = s.getLabelConfig() : (eV(s, function(t) {
                                t.setState("hover"), l.push(t.getLabelConfig())
                            }), (a = {
                                x: s[0].category,
                                y: s[0].y
                            }).points = l, s = s[0]), this.len = l.length, a = i.call(a, this), h = s.series, this.distance = eZ(h.tooltipOptions.distance, 16), !1 === a ? this.hide() : (i = this.getLabel(), this.isHidden && i.attr({
                                opacity: 1
                            }).show(), this.split ? this.renderSplit(a, t) : (o.style.width || i.css({
                                width: this.chart.spacingBox.width
                            }), i.attr({
                                text: a && a.join ? a.join("") : a
                            }), i.removeClass(/highcharts-color-[\d]+/g).addClass("highcharts-color-" + eZ(s.colorIndex, h.colorIndex)), i.attr({
                                stroke: o.borderColor || s.color || h.color || "#666666"
                            }), this.updatePosition({
                                plotX: e,
                                plotY: r,
                                negative: s.negative,
                                ttBelow: s.ttBelow,
                                h: n[2] || 0
                            })), this.isHidden = !1))
                        },
                        renderSplit: function(t, e) {
                            var i = this,
                                r = [],
                                n = this.chart,
                                o = n.renderer,
                                s = !0,
                                a = this.options,
                                l = 0,
                                h = this.getLabel();
                            eV(t.slice(0, e.length + 1), function(t, c) {
                                if (!1 !== t) {
                                    var d = (c = e[c - 1] || {
                                            isHeader: !0,
                                            plotX: e[0].plotX
                                        }).series || i,
                                        u = d.tt,
                                        p = c.series || {},
                                        f = "highcharts-color-" + eZ(c.colorIndex, p.colorIndex, "none");
                                    u || (d.tt = u = o.label(null, null, null, "callout").addClass("highcharts-tooltip-box " + f).attr({
                                        padding: a.padding,
                                        r: a.borderRadius,
                                        fill: a.backgroundColor,
                                        stroke: a.borderColor || c.color || p.color || "#333333",
                                        "stroke-width": a.borderWidth
                                    }).add(h)), u.isActive = !0, u.attr({
                                        text: t
                                    }), u.css(a.style).shadow(a.shadow), p = (t = u.getBBox()).width + u.strokeWidth(), c.isHeader ? (l = t.height, p = Math.max(0, Math.min(c.plotX + n.plotLeft - p / 2, n.chartWidth - p))) : p = c.plotX + n.plotLeft - eZ(a.distance, 16) - p, 0 > p && (s = !1), t = (c.series && c.series.yAxis && c.series.yAxis.pos) + (c.plotY || 0) - n.plotTop, r.push({
                                        target: c.isHeader ? n.plotHeight + l : t,
                                        rank: +!!c.isHeader,
                                        size: d.tt.getBBox().height + 1,
                                        point: c,
                                        x: p,
                                        tt: u
                                    })
                                }
                            }), this.cleanSplit(), eX.distribute(r, n.plotHeight + l), eV(r, function(t) {
                                var e = t.point,
                                    i = e.series;
                                t.tt.attr({
                                    visibility: void 0 === t.pos ? "hidden" : "inherit",
                                    x: s || e.isHeader ? t.x : e.plotX + n.plotLeft + eZ(a.distance, 16),
                                    y: t.pos + n.plotTop,
                                    anchorX: e.isHeader ? e.plotX + n.plotLeft : e.plotX + i.xAxis.pos,
                                    anchorY: e.isHeader ? t.pos + n.plotTop - 15 : e.plotY + i.yAxis.pos
                                })
                            })
                        },
                        updatePosition: function(t) {
                            var e = this.chart,
                                i = this.getLabel(),
                                i = (this.options.positioner || this.getPosition).call(this, i.width, i.height, t);
                            this.move(Math.round(i.x), Math.round(i.y || 0), t.plotX + e.plotLeft, t.plotY + e.plotTop)
                        },
                        getDateFormat: function(t, e, i, r) {
                            var n, o, s = eY("%m-%d %H:%M:%S.%L", e),
                                a = {
                                    millisecond: 15,
                                    second: 12,
                                    minute: 9,
                                    hour: 6,
                                    day: 3
                                },
                                l = "millisecond";
                            for (o in e0) {
                                if (t === e0.week && +eY("%w", e) === i && "00:00:00.000" === s.substr(6)) {
                                    o = "week";
                                    break
                                }
                                if (e0[o] > t) {
                                    o = l;
                                    break
                                }
                                if (a[o] && s.substr(a[o]) !== "01-01 00:00:00.000".substr(a[o])) break;
                                "week" !== o && (l = o)
                            }
                            return o && (n = r[o]), n
                        },
                        getXDateFormat: function(t, e, i) {
                            e = e.dateTimeLabelFormats;
                            var r = i && i.closestPointRange;
                            return (r ? this.getDateFormat(r, t.x, i.options.startOfWeek, e) : e.day) || e.year
                        },
                        tooltipFooterHeaderFormatter: function(t, e) {
                            var i = e ? "footer" : "header",
                                r = (e = t.series).tooltipOptions,
                                n = r.xDateFormat,
                                o = e.xAxis,
                                s = o && "datetime" === o.options.type && eK(t.key),
                                i = r[i + "Format"];
                            return s && !n && (n = this.getXDateFormat(t, r, o)), s && n && (i = i.replace("{point.key}", "{point.key:" + n + "}")), e_(i, {
                                point: t,
                                series: e
                            })
                        },
                        bodyFormatter: function(t) {
                            return eq(t, function(t) {
                                var e = t.series.tooltipOptions;
                                return (e.pointFormatter || t.point.tooltipFormatter).call(t.point, e.pointFormat)
                            })
                        }
                    }, e2 = (e1 = t).addEvent, e3 = e1.attr, e5 = e1.charts, e6 = e1.color, e9 = e1.css, e8 = e1.defined, e4 = e1.each, e7 = e1.extend, it = e1.find, ie = e1.fireEvent, ii = e1.isObject, ir = e1.offset, io = e1.pick, is = e1.removeEvent, ia = e1.splat, il = e1.Tooltip, ih = e1.win, e1.Pointer = function(t, e) {
                        this.init(t, e)
                    }, e1.Pointer.prototype = {
                        init: function(t, e) {
                            this.options = e, this.chart = t, this.runChartClick = e.chart.events && !!e.chart.events.click, this.pinchDown = [], this.lastValidTouch = {}, il && (t.tooltip = new il(t, e.tooltip), this.followTouchMove = io(e.tooltip.followTouchMove, !0)), this.setDOMEvents()
                        },
                        zoomOption: function(t) {
                            var e = this.chart,
                                i = e.options.chart,
                                r = i.zoomType || "",
                                e = e.inverted;
                            /touch/.test(t.type) && (r = io(i.pinchType, r)), this.zoomX = t = /x/.test(r), this.zoomY = r = /y/.test(r), this.zoomHor = t && !e || r && e, this.zoomVert = r && !e || t && e, this.hasZoom = t || r
                        },
                        normalize: function(t, e) {
                            var i, r;
                            return (t = t || ih.event).target || (t.target = t.srcElement), r = t.touches ? t.touches.length ? t.touches.item(0) : t.changedTouches[0] : t, e || (this.chartPosition = e = ir(this.chart.container)), void 0 === r.pageX ? (i = Math.max(t.x, t.clientX - e.left), e = t.y) : (i = r.pageX - e.left, e = r.pageY - e.top), e7(t, {
                                chartX: Math.round(i),
                                chartY: Math.round(e)
                            })
                        },
                        getCoordinates: function(t) {
                            var e = {
                                xAxis: [],
                                yAxis: []
                            };
                            return e4(this.chart.axes, function(i) {
                                e[i.isXAxis ? "xAxis" : "yAxis"].push({
                                    axis: i,
                                    value: i.toValue(t[i.horiz ? "chartX" : "chartY"])
                                })
                            }), e
                        },
                        findNearestKDPoint: function(t, e, i) {
                            var r;
                            return e4(t, function(t) {
                                var n = !(t.noSharedTooltip && e) && 0 > t.options.findNearestPointBy.indexOf("y");
                                if ((n = ii(t = t.searchPoint(i, n), !0)) && !(n = !ii(r, !0))) var n = r.distX - t.distX,
                                    o = r.dist - t.dist,
                                    s = (t.series.group && t.series.group.zIndex) - (r.series.group && r.series.group.zIndex),
                                    n = 0 < (0 !== n && e ? n : 0 !== o ? o : 0 !== s ? s : r.series.index > t.series.index ? -1 : 1);
                                n && (r = t)
                            }), r
                        },
                        getPointFromEvent: function(t) {
                            t = t.target;
                            for (var e; t && !e;) e = t.point, t = t.parentNode;
                            return e
                        },
                        getChartCoordinatesFromPoint: function(t, e) {
                            var i = t.series,
                                r = i.xAxis,
                                i = i.yAxis;
                            if (r && i) return e ? {
                                chartX: r.len + r.pos - t.clientX,
                                chartY: i.len + i.pos - t.plotY
                            } : {
                                chartX: t.clientX + r.pos,
                                chartY: t.plotY + i.pos
                            }
                        },
                        getHoverData: function(t, e, i, r, n, o) {
                            var s, a = [];
                            r = !(!r || !t);
                            var l = e && !e.stickyTracking ? [e] : e1.grep(i, function(t) {
                                return t.visible && !(!n && t.directTouch) && io(t.options.enableMouseTracking, !0) && t.stickyTracking
                            });
                            return e = (s = r ? t : this.findNearestKDPoint(l, n, o)) && s.series, s && (n && !e.noSharedTooltip ? e4(l = e1.grep(i, function(t) {
                                return t.visible && !(!n && t.directTouch) && io(t.options.enableMouseTracking, !0) && !t.noSharedTooltip
                            }), function(t) {
                                ii(t = it(t.points, function(t) {
                                    return t.x === s.x
                                })) && !t.isNull && a.push(t)
                            }) : a.push(s)), {
                                hoverPoint: s,
                                hoverSeries: e,
                                hoverPoints: a
                            }
                        },
                        runPointActions: function(t, e) {
                            var i, r = this.chart,
                                n = r.tooltip,
                                o = !!n && n.shared,
                                s = e || r.hoverPoint,
                                a = s && s.series || r.hoverSeries,
                                a = this.getHoverData(s, a, r.series, !!e || a && a.directTouch && this.isDirectTouch, o, t),
                                s = a.hoverPoint;
                            i = a.hoverPoints, e = (a = a.hoverSeries) && a.tooltipOptions.followPointer, o = o && a && !a.noSharedTooltip, s && (s !== r.hoverPoint || n && n.isHidden) ? (e4(r.hoverPoints || [], function(t) {
                                -1 === e1.inArray(t, i) && t.setState()
                            }), e4(i || [], function(t) {
                                t.setState("hover")
                            }), r.hoverSeries !== a && a.onMouseOver(), r.hoverPoint && r.hoverPoint.firePointEvent("mouseOut"), s.firePointEvent("mouseOver"), r.hoverPoints = i, r.hoverPoint = s, n && n.refresh(o ? i : s, t)) : e && n && !n.isHidden && (s = n.getAnchor([{}], t), n.updatePosition({
                                plotX: s[0],
                                plotY: s[1]
                            })), this.unDocMouseMove || (this.unDocMouseMove = e2(r.container.ownerDocument, "mousemove", function(t) {
                                var e = e5[e1.hoverChartIndex];
                                e && e.pointer.onDocumentMouseMove(t)
                            })), e4(r.axes, function(e) {
                                var r = io(e.crosshair.snap, !0),
                                    n = r ? e1.find(i, function(t) {
                                        return t.series[e.coll] === e
                                    }) : void 0;
                                n || !r ? e.drawCrosshair(t, n) : e.hideCrosshair()
                            })
                        },
                        reset: function(t, e) {
                            var i = this.chart,
                                r = i.hoverSeries,
                                n = i.hoverPoint,
                                o = i.hoverPoints,
                                s = i.tooltip,
                                a = s && s.shared ? o : n;
                            t && a && e4(ia(a), function(e) {
                                e.series.isCartesian && void 0 === e.plotX && (t = !1)
                            }), t ? s && a && (s.refresh(a), n && (n.setState(n.state, !0), e4(i.axes, function(t) {
                                t.crosshair && t.drawCrosshair(null, n)
                            }))) : (n && n.onMouseOut(), o && e4(o, function(t) {
                                t.setState()
                            }), r && r.onMouseOut(), s && s.hide(e), this.unDocMouseMove && (this.unDocMouseMove = this.unDocMouseMove()), e4(i.axes, function(t) {
                                t.hideCrosshair()
                            }), this.hoverX = i.hoverPoints = i.hoverPoint = null)
                        },
                        scaleGroups: function(t, e) {
                            var i, r = this.chart;
                            e4(r.series, function(n) {
                                i = t || n.getPlotBox(), n.xAxis && n.xAxis.zoomEnabled && n.group && (n.group.attr(i), n.markerGroup && (n.markerGroup.attr(i), n.markerGroup.clip(e ? r.clipRect : null)), n.dataLabelsGroup && n.dataLabelsGroup.attr(i))
                            }), r.clipRect.attr(e || r.clipBox)
                        },
                        dragStart: function(t) {
                            var e = this.chart;
                            e.mouseIsDown = t.type, e.cancelClick = !1, e.mouseDownX = this.mouseDownX = t.chartX, e.mouseDownY = this.mouseDownY = t.chartY
                        },
                        drag: function(t) {
                            var e, i = this.chart,
                                r = i.options.chart,
                                n = t.chartX,
                                o = t.chartY,
                                s = this.zoomHor,
                                a = this.zoomVert,
                                l = i.plotLeft,
                                h = i.plotTop,
                                c = i.plotWidth,
                                d = i.plotHeight,
                                u = this.selectionMarker,
                                p = this.mouseDownX,
                                f = this.mouseDownY,
                                g = r.panKey && t[r.panKey + "Key"];
                            u && u.touch || (n < l ? n = l : n > l + c && (n = l + c), o < h ? o = h : o > h + d && (o = h + d), this.hasDragged = Math.sqrt(Math.pow(p - n, 2) + Math.pow(f - o, 2)), 10 < this.hasDragged && (e = i.isInsidePlot(p - l, f - h), i.hasCartesianSeries && (this.zoomX || this.zoomY) && e && !g && !u && (this.selectionMarker = u = i.renderer.rect(l, h, s ? 1 : c, a ? 1 : d, 0).attr({
                                fill: r.selectionMarkerFill || e6("#335cad").setOpacity(.25).get(),
                                class: "highcharts-selection-marker",
                                zIndex: 7
                            }).add()), u && s && (n -= p, u.attr({
                                width: Math.abs(n),
                                x: (0 < n ? 0 : n) + p
                            })), u && a && (n = o - f, u.attr({
                                height: Math.abs(n),
                                y: (0 < n ? 0 : n) + f
                            })), e && !u && r.panning && i.pan(t, r.panning)))
                        },
                        drop: function(t) {
                            var e = this,
                                i = this.chart,
                                r = this.hasPinched;
                            if (this.selectionMarker) {
                                var n, o = {
                                        originalEvent: t,
                                        xAxis: [],
                                        yAxis: []
                                    },
                                    s = this.selectionMarker,
                                    a = s.attr ? s.attr("x") : s.x,
                                    l = s.attr ? s.attr("y") : s.y,
                                    h = s.attr ? s.attr("width") : s.width,
                                    c = s.attr ? s.attr("height") : s.height;
                                (this.hasDragged || r) && (e4(i.axes, function(i) {
                                    if (i.zoomEnabled && e8(i.min) && (r || e[({
                                            xAxis: "zoomX",
                                            yAxis: "zoomY"
                                        })[i.coll]])) {
                                        var s = i.horiz,
                                            d = "touchend" === t.type ? i.minPixelPadding : 0,
                                            u = i.toValue((s ? a : l) + d),
                                            s = i.toValue((s ? a + h : l + c) - d);
                                        o[i.coll].push({
                                            axis: i,
                                            min: Math.min(u, s),
                                            max: Math.max(u, s)
                                        }), n = !0
                                    }
                                }), n && ie(i, "selection", o, function(t) {
                                    i.zoom(e7(t, r ? {
                                        animation: !1
                                    } : null))
                                })), this.selectionMarker = this.selectionMarker.destroy(), r && this.scaleGroups()
                            }
                            i && (e9(i.container, {
                                cursor: i._cursor
                            }), i.cancelClick = 10 < this.hasDragged, i.mouseIsDown = this.hasDragged = this.hasPinched = !1, this.pinchDown = [])
                        },
                        onContainerMouseDown: function(t) {
                            t = this.normalize(t), this.zoomOption(t), t.preventDefault && t.preventDefault(), this.dragStart(t)
                        },
                        onDocumentMouseUp: function(t) {
                            e5[e1.hoverChartIndex] && e5[e1.hoverChartIndex].pointer.drop(t)
                        },
                        onDocumentMouseMove: function(t) {
                            var e = this.chart,
                                i = this.chartPosition;
                            t = this.normalize(t, i), !i || this.inClass(t.target, "highcharts-tracker") || e.isInsidePlot(t.chartX - e.plotLeft, t.chartY - e.plotTop) || this.reset()
                        },
                        onContainerMouseLeave: function(t) {
                            var e = e5[e1.hoverChartIndex];
                            e && (t.relatedTarget || t.toElement) && (e.pointer.reset(), e.pointer.chartPosition = null)
                        },
                        onContainerMouseMove: function(t) {
                            var e = this.chart;
                            e8(e1.hoverChartIndex) && e5[e1.hoverChartIndex] && e5[e1.hoverChartIndex].mouseIsDown || (e1.hoverChartIndex = e.index), (t = this.normalize(t)).returnValue = !1, "mousedown" === e.mouseIsDown && this.drag(t), (this.inClass(t.target, "highcharts-tracker") || e.isInsidePlot(t.chartX - e.plotLeft, t.chartY - e.plotTop)) && !e.openMenu && this.runPointActions(t)
                        },
                        inClass: function(t, e) {
                            for (var i; t;) {
                                if (i = e3(t, "class")) {
                                    if (-1 !== i.indexOf(e)) return !0;
                                    if (-1 !== i.indexOf("highcharts-container")) return !1
                                }
                                t = t.parentNode
                            }
                        },
                        onTrackerMouseOut: function(t) {
                            var e = this.chart.hoverSeries;
                            t = t.relatedTarget || t.toElement, this.isDirectTouch = !1, !e || !t || e.stickyTracking || this.inClass(t, "highcharts-tooltip") || this.inClass(t, "highcharts-series-" + e.index) && this.inClass(t, "highcharts-tracker") || e.onMouseOut()
                        },
                        onContainerClick: function(t) {
                            var e = this.chart,
                                i = e.hoverPoint,
                                r = e.plotLeft,
                                n = e.plotTop;
                            t = this.normalize(t), e.cancelClick || (i && this.inClass(t.target, "highcharts-tracker") ? (ie(i.series, "click", e7(t, {
                                point: i
                            })), e.hoverPoint && i.firePointEvent("click", t)) : (e7(t, this.getCoordinates(t)), e.isInsidePlot(t.chartX - r, t.chartY - n) && ie(e, "click", t)))
                        },
                        setDOMEvents: function() {
                            var t = this,
                                e = t.chart.container,
                                i = e.ownerDocument;
                            e.onmousedown = function(e) {
                                t.onContainerMouseDown(e)
                            }, e.onmousemove = function(e) {
                                t.onContainerMouseMove(e)
                            }, e.onclick = function(e) {
                                t.onContainerClick(e)
                            }, e2(e, "mouseleave", t.onContainerMouseLeave), 1 === e1.chartCount && e2(i, "mouseup", t.onDocumentMouseUp), e1.hasTouch && (e.ontouchstart = function(e) {
                                t.onContainerTouchStart(e)
                            }, e.ontouchmove = function(e) {
                                t.onContainerTouchMove(e)
                            }, 1 === e1.chartCount && e2(i, "touchend", t.onDocumentTouchEnd))
                        },
                        destroy: function() {
                            var t = this,
                                e = this.chart.container.ownerDocument;
                            t.unDocMouseMove && t.unDocMouseMove(), is(t.chart.container, "mouseleave", t.onContainerMouseLeave), e1.chartCount || (is(e, "mouseup", t.onDocumentMouseUp), e1.hasTouch && is(e, "touchend", t.onDocumentTouchEnd)), clearInterval(t.tooltipTimeout), e1.objectEach(t, function(e, i) {
                                t[i] = null
                            })
                        }
                    }, id = (ic = t).charts, iu = ic.each, ip = ic.extend, ig = ic.map, im = ic.noop, iv = ic.pick, ip(ic.Pointer.prototype, {
                        pinchTranslate: function(t, e, i, r, n, o) {
                            this.zoomHor && this.pinchTranslateDirection(!0, t, e, i, r, n, o), this.zoomVert && this.pinchTranslateDirection(!1, t, e, i, r, n, o)
                        },
                        pinchTranslateDirection: function(t, e, i, r, n, o, s, a) {
                            var l, h, c, d = this.chart,
                                u = t ? "x" : "y",
                                p = t ? "X" : "Y",
                                f = "chart" + p,
                                g = t ? "width" : "height",
                                m = d["plot" + (t ? "Left" : "Top")],
                                v = a || 1,
                                y = d.inverted,
                                b = d.bounds[t ? "h" : "v"],
                                x = 1 === e.length,
                                w = e[0][f],
                                k = i[0][f],
                                S = !x && e[1][f],
                                M = !x && i[1][f];
                            (i = function() {
                                !x && 20 < Math.abs(w - S) && (v = a || Math.abs(k - M) / Math.abs(w - S)), h = (m - k) / v + w, l = d["plot" + (t ? "Width" : "Height")] / v
                            })(), (e = h) < b.min ? (e = b.min, c = !0) : e + l > b.max && (e = b.max - l, c = !0), c ? (k -= .8 * (k - s[u][0]), x || (M -= .8 * (M - s[u][1])), i()) : s[u] = [k, M], y || (o[u] = h - m, o[g] = l), o = y ? 1 / v : v, n[g] = l, n[u] = e, r[y ? t ? "scaleY" : "scaleX" : "scale" + p] = v, r["translate" + p] = o * m + (k - o * w)
                        },
                        pinch: function(t) {
                            var e = this,
                                i = e.chart,
                                r = e.pinchDown,
                                n = t.touches,
                                o = n.length,
                                s = e.lastValidTouch,
                                a = e.hasZoom,
                                l = e.selectionMarker,
                                h = {},
                                c = 1 === o && (e.inClass(t.target, "highcharts-tracker") && i.runTrackerClick || e.runChartClick),
                                d = {};
                            1 < o && (e.initiated = !0), a && e.initiated && !c && t.preventDefault(), ig(n, function(t) {
                                return e.normalize(t)
                            }), "touchstart" === t.type ? (iu(n, function(t, e) {
                                r[e] = {
                                    chartX: t.chartX,
                                    chartY: t.chartY
                                }
                            }), s.x = [r[0].chartX, r[1] && r[1].chartX], s.y = [r[0].chartY, r[1] && r[1].chartY], iu(i.axes, function(t) {
                                if (t.zoomEnabled) {
                                    var e = i.bounds[t.horiz ? "h" : "v"],
                                        r = t.minPixelPadding,
                                        n = t.toPixels(iv(t.options.min, t.dataMin)),
                                        o = t.toPixels(iv(t.options.max, t.dataMax)),
                                        s = Math.max(n, o);
                                    e.min = Math.min(t.pos, Math.min(n, o) - r), e.max = Math.max(t.pos + t.len, s + r)
                                }
                            }), e.res = !0) : e.followTouchMove && 1 === o ? this.runPointActions(e.normalize(t)) : r.length && (l || (e.selectionMarker = l = ip({
                                destroy: im,
                                touch: !0
                            }, i.plotBox)), e.pinchTranslate(r, n, h, l, d, s), e.hasPinched = a, e.scaleGroups(h, d), e.res && (e.res = !1, this.reset(!1, 0)))
                        },
                        touch: function(t, e) {
                            var i, r = this.chart;
                            r.index !== ic.hoverChartIndex && this.onContainerMouseLeave({
                                relatedTarget: !0
                            }), ic.hoverChartIndex = r.index, 1 === t.touches.length ? (t = this.normalize(t), r.isInsidePlot(t.chartX - r.plotLeft, t.chartY - r.plotTop) && !r.openMenu ? (e && this.runPointActions(t), "touchmove" === t.type && (i = !!(e = this.pinchDown)[0] && 4 <= Math.sqrt(Math.pow(e[0].chartX - t.chartX, 2) + Math.pow(e[0].chartY - t.chartY, 2))), iv(i, !0) && this.pinch(t)) : e && this.reset()) : 2 === t.touches.length && this.pinch(t)
                        },
                        onContainerTouchStart: function(t) {
                            this.zoomOption(t), this.touch(t, !0)
                        },
                        onContainerTouchMove: function(t) {
                            this.touch(t)
                        },
                        onDocumentTouchEnd: function(t) {
                            id[ic.hoverChartIndex] && id[ic.hoverChartIndex].pointer.drop(t)
                        }
                    }), ! function(t) {
                        var e = t.addEvent,
                            i = t.charts,
                            r = t.css,
                            n = t.doc,
                            o = t.extend,
                            s = t.noop,
                            a = t.Pointer,
                            l = t.removeEvent,
                            h = t.win,
                            c = t.wrap;
                        if (!t.hasTouch && (h.PointerEvent || h.MSPointerEvent)) {
                            var d = {},
                                u = !!h.PointerEvent,
                                p = function() {
                                    var e = [];
                                    return e.item = function(t) {
                                        return this[t]
                                    }, t.objectEach(d, function(t) {
                                        e.push({
                                            pageX: t.pageX,
                                            pageY: t.pageY,
                                            target: t.target
                                        })
                                    }), e
                                },
                                f = function(e, r, n, o) {
                                    ("touch" === e.pointerType || e.pointerType === e.MSPOINTER_TYPE_TOUCH) && i[t.hoverChartIndex] && (o(e), (o = i[t.hoverChartIndex].pointer)[r]({
                                        type: n,
                                        target: e.currentTarget,
                                        preventDefault: s,
                                        touches: p()
                                    }))
                                };
                            o(a.prototype, {
                                onContainerPointerDown: function(t) {
                                    f(t, "onContainerTouchStart", "touchstart", function(t) {
                                        d[t.pointerId] = {
                                            pageX: t.pageX,
                                            pageY: t.pageY,
                                            target: t.currentTarget
                                        }
                                    })
                                },
                                onContainerPointerMove: function(t) {
                                    f(t, "onContainerTouchMove", "touchmove", function(t) {
                                        d[t.pointerId] = {
                                            pageX: t.pageX,
                                            pageY: t.pageY
                                        }, d[t.pointerId].target || (d[t.pointerId].target = t.currentTarget)
                                    })
                                },
                                onDocumentPointerUp: function(t) {
                                    f(t, "onDocumentTouchEnd", "touchend", function(t) {
                                        delete d[t.pointerId]
                                    })
                                },
                                batchMSEvents: function(t) {
                                    t(this.chart.container, u ? "pointerdown" : "MSPointerDown", this.onContainerPointerDown), t(this.chart.container, u ? "pointermove" : "MSPointerMove", this.onContainerPointerMove), t(n, u ? "pointerup" : "MSPointerUp", this.onDocumentPointerUp)
                                }
                            }), c(a.prototype, "init", function(t, e, i) {
                                t.call(this, e, i), this.hasZoom && r(e.container, {
                                    "-ms-touch-action": "none",
                                    "touch-action": "none"
                                })
                            }), c(a.prototype, "setDOMEvents", function(t) {
                                t.apply(this), (this.hasZoom || this.followTouchMove) && this.batchMSEvents(e)
                            }), c(a.prototype, "destroy", function(t) {
                                this.batchMSEvents(l), t.call(this)
                            })
                        }
                    }(t), ib = (iy = t).addEvent, ix = iy.css, iw = iy.discardElement, ik = iy.defined, iS = iy.each, iM = iy.isFirefox, iC = iy.marginNames, iA = iy.merge, iT = iy.pick, iP = iy.setAnimation, iO = iy.stableSort, iI = iy.win, iL = iy.wrap, iy.Legend = function(t, e) {
                        this.init(t, e)
                    }, iy.Legend.prototype = {
                        init: function(t, e) {
                            this.chart = t, this.setOptions(e), e.enabled && (this.render(), ib(this.chart, "endResize", function() {
                                this.legend.positionCheckboxes()
                            }))
                        },
                        setOptions: function(t) {
                            var e = iT(t.padding, 8);
                            this.options = t, this.itemStyle = t.itemStyle, this.itemHiddenStyle = iA(this.itemStyle, t.itemHiddenStyle), this.itemMarginTop = t.itemMarginTop || 0, this.padding = e, this.initialItemY = e - 5, this.itemHeight = this.maxItemWidth = 0, this.symbolWidth = iT(t.symbolWidth, 16), this.pages = []
                        },
                        update: function(t, e) {
                            var i = this.chart;
                            this.setOptions(iA(!0, this.options, t)), this.destroy(), i.isDirtyLegend = i.isDirtyBox = !0, iT(e, !0) && i.redraw()
                        },
                        colorizeItem: function(t, e) {
                            t.legendGroup[e ? "removeClass" : "addClass"]("highcharts-legend-item-hidden");
                            var i = this.options,
                                r = t.legendItem,
                                n = t.legendLine,
                                o = t.legendSymbol,
                                s = this.itemHiddenStyle.color,
                                i = e ? i.itemStyle.color : s,
                                a = e && t.color || s,
                                l = t.options && t.options.marker,
                                h = {
                                    fill: a
                                };
                            r && r.css({
                                fill: i,
                                color: i
                            }), n && n.attr({
                                stroke: a
                            }), o && (l && o.isMarker && (h = t.pointAttribs(), e || (h.stroke = h.fill = s)), o.attr(h))
                        },
                        positionItem: function(t) {
                            var e = this.options,
                                i = e.symbolPadding,
                                e = !e.rtl,
                                r = t._legendItemPos,
                                n = r[0],
                                r = r[1],
                                o = t.checkbox;
                            (t = t.legendGroup) && t.element && t.translate(e ? n : this.legendWidth - n - 2 * i - 4, r), o && (o.x = n, o.y = r)
                        },
                        destroyItem: function(t) {
                            var e = t.checkbox;
                            iS(["legendItem", "legendLine", "legendSymbol", "legendGroup"], function(e) {
                                t[e] && (t[e] = t[e].destroy())
                            }), e && iw(t.checkbox)
                        },
                        destroy: function() {
                            function t(t) {
                                this[t] && (this[t] = this[t].destroy())
                            }
                            iS(this.getAllItems(), function(e) {
                                iS(["legendItem", "legendGroup"], t, e)
                            }), iS("clipRect up down pager nav box title group".split(" "), t, this), this.display = null
                        },
                        positionCheckboxes: function(t) {
                            var e, i = this.group && this.group.alignAttr,
                                r = this.clipHeight || this.legendHeight,
                                n = this.titleHeight;
                            i && (e = i.translateY, iS(this.allItems, function(o) {
                                var s, a = o.checkbox;
                                a && (s = e + n + a.y + (t || 0) + 3, ix(a, {
                                    left: i.translateX + o.checkboxOffset + a.x - 20 + "px",
                                    top: s + "px",
                                    display: s > e - 6 && s < e + r - 6 ? "" : "none"
                                }))
                            }))
                        },
                        renderTitle: function() {
                            var t = this.options,
                                e = this.padding,
                                i = t.title,
                                r = 0;
                            i.text && (this.title || (this.title = this.chart.renderer.label(i.text, e - 3, e - 4, null, null, null, t.useHTML, null, "legend-title").attr({
                                zIndex: 1
                            }).css(i.style).add(this.group)), r = (t = this.title.getBBox()).height, this.offsetWidth = t.width, this.contentGroup.attr({
                                translateY: r
                            })), this.titleHeight = r
                        },
                        setText: function(t) {
                            var e = this.options;
                            t.legendItem.attr({
                                text: e.labelFormat ? iy.format(e.labelFormat, t) : e.labelFormatter.call(t)
                            })
                        },
                        renderItem: function(t) {
                            var e = this.chart,
                                i = e.renderer,
                                r = this.options,
                                n = "horizontal" === r.layout,
                                o = this.symbolWidth,
                                s = r.symbolPadding,
                                a = this.itemStyle,
                                l = this.itemHiddenStyle,
                                h = this.padding,
                                c = n ? iT(r.itemDistance, 20) : 0,
                                d = !r.rtl,
                                u = r.width,
                                p = r.itemMarginBottom || 0,
                                f = this.itemMarginTop,
                                g = t.legendItem,
                                m = !t.series,
                                v = !m && t.series.drawLegendSymbol ? t.series : t,
                                y = v.options,
                                b = this.createCheckboxForItem && y && y.showCheckbox,
                                y = o + s + c + 20 * !!b,
                                x = r.useHTML,
                                w = t.options.className;
                            g || (t.legendGroup = i.g("legend-item").addClass("highcharts-" + v.type + "-series highcharts-color-" + t.colorIndex + (w ? " " + w : "") + (m ? " highcharts-series-" + t.index : "")).attr({
                                zIndex: 1
                            }).add(this.scrollGroup), t.legendItem = g = i.text("", d ? o + s : -s, this.baseline || 0, x).css(iA(t.visible ? a : l)).attr({
                                align: d ? "left" : "right",
                                zIndex: 2
                            }).add(t.legendGroup), this.baseline || (o = a.fontSize, this.fontMetrics = i.fontMetrics(o, g), this.baseline = this.fontMetrics.f + 3 + f, g.attr("y", this.baseline)), this.symbolHeight = r.symbolHeight || this.fontMetrics.f, v.drawLegendSymbol(this, t), this.setItemEvents && this.setItemEvents(t, g, x), b && this.createCheckboxForItem(t)), this.colorizeItem(t, t.visible), a.width || g.css({
                                width: (r.itemWidth || r.width || e.spacingBox.width) - y
                            }), this.setText(t), i = g.getBBox(), a = t.checkboxOffset = r.itemWidth || t.legendItemWidth || i.width + y, this.itemHeight = i = Math.round(t.legendItemHeight || i.height || this.symbolHeight), n && this.itemX - h + a > (u || e.spacingBox.width - 2 * h - r.x) && (this.itemX = h, this.itemY += f + this.lastLineHeight + p, this.lastLineHeight = 0), this.maxItemWidth = Math.max(this.maxItemWidth, a), this.lastItemY = f + this.itemY + p, this.lastLineHeight = Math.max(i, this.lastLineHeight), t._legendItemPos = [this.itemX, this.itemY], n ? this.itemX += a : (this.itemY += f + i + p, this.lastLineHeight = i), this.offsetWidth = u || Math.max((n ? this.itemX - h - (t.checkbox ? 0 : c) : a) + h, this.offsetWidth)
                        },
                        getAllItems: function() {
                            var t = [];
                            return iS(this.chart.series, function(e) {
                                var i = e && e.options;
                                e && iT(i.showInLegend, !ik(i.linkedTo) && void 0, !0) && (t = t.concat(e.legendItems || ("point" === i.legendType ? e.data : e)))
                            }), t
                        },
                        adjustMargins: function(t, e) {
                            var i = this.chart,
                                r = this.options,
                                n = r.align.charAt(0) + r.verticalAlign.charAt(0) + r.layout.charAt(0);
                            r.floating || iS([/(lth|ct|rth)/, /(rtv|rm|rbv)/, /(rbh|cb|lbh)/, /(lbv|lm|ltv)/], function(o, s) {
                                o.test(n) && !ik(t[s]) && (i[iC[s]] = Math.max(i[iC[s]], i.legend[(s + 1) % 2 ? "legendHeight" : "legendWidth"] + [1, -1, -1, 1][s] * r[s % 2 ? "x" : "y"] + iT(r.margin, 12) + e[s]))
                            })
                        },
                        render: function() {
                            var t, e, i, r, n = this,
                                o = n.chart,
                                s = o.renderer,
                                a = n.group,
                                l = n.box,
                                h = n.options,
                                c = n.padding;
                            n.itemX = c, n.itemY = n.initialItemY, n.offsetWidth = 0, n.lastItemY = 0, a || (n.group = a = s.g("legend").attr({
                                zIndex: 7
                            }).add(), n.contentGroup = s.g().attr({
                                zIndex: 1
                            }).add(a), n.scrollGroup = s.g().add(n.contentGroup)), n.renderTitle(), iO(t = n.getAllItems(), function(t, e) {
                                return (t.options && t.options.legendIndex || 0) - (e.options && e.options.legendIndex || 0)
                            }), h.reversed && t.reverse(), n.allItems = t, n.display = e = !!t.length, n.lastLineHeight = 0, iS(t, function(t) {
                                n.renderItem(t)
                            }), i = (h.width || n.offsetWidth) + c, r = n.lastItemY + n.lastLineHeight + n.titleHeight, r = n.handleOverflow(r) + c, l || (n.box = l = s.rect().addClass("highcharts-legend-box").attr({
                                r: h.borderRadius
                            }).add(a), l.isNew = !0), l.attr({
                                stroke: h.borderColor,
                                "stroke-width": h.borderWidth || 0,
                                fill: h.backgroundColor || "none"
                            }).shadow(h.shadow), 0 < i && 0 < r && (l[l.isNew ? "attr" : "animate"](l.crisp({
                                x: 0,
                                y: 0,
                                width: i,
                                height: r
                            }, l.strokeWidth())), l.isNew = !1), l[e ? "show" : "hide"](), n.legendWidth = i, n.legendHeight = r, iS(t, function(t) {
                                n.positionItem(t)
                            }), e && a.align(iA(h, {
                                width: i,
                                height: r
                            }), !0, "spacingBox"), o.isResizing || this.positionCheckboxes()
                        },
                        handleOverflow: function(t) {
                            var e, i, r = this,
                                n = this.chart,
                                o = n.renderer,
                                s = this.options,
                                a = s.y,
                                l = this.padding,
                                n = n.spacingBox.height + ("top" === s.verticalAlign ? -a : a) - l,
                                a = s.maxHeight,
                                h = this.clipRect,
                                c = s.navigation,
                                d = iT(c.animation, !0),
                                u = c.arrowSize || 12,
                                p = this.nav,
                                f = this.pages,
                                g = this.allItems,
                                m = function(t) {
                                    "number" == typeof t ? h.attr({
                                        height: t
                                    }) : h && (r.clipRect = h.destroy(), r.contentGroup.clip()), r.contentGroup.div && (r.contentGroup.div.style.clip = t ? "rect(" + l + "px,9999px," + (l + t) + "px,0)" : "auto")
                                };
                            return "horizontal" !== s.layout || "middle" === s.verticalAlign || s.floating || (n /= 2), a && (n = Math.min(n, a)), f.length = 0, t > n && !1 !== c.enabled ? (this.clipHeight = e = Math.max(n - 20 - this.titleHeight - l, 0), this.currentPage = iT(this.currentPage, 1), this.fullHeight = t, iS(g, function(t, r) {
                                var n = t._legendItemPos[1];
                                t = Math.round(t.legendItem.getBBox().height);
                                var o = f.length;
                                (!o || n - f[o - 1] > e && (i || n) !== f[o - 1]) && (f.push(i || n), o++), r === g.length - 1 && n + t - f[o - 1] > e && f.push(n), n !== i && (i = n)
                            }), h || (h = r.clipRect = o.clipRect(0, l, 9999, 0), r.contentGroup.clip(h)), m(e), p || (this.nav = p = o.g().attr({
                                zIndex: 1
                            }).add(this.group), this.up = o.symbol("triangle", 0, 0, u, u).on("click", function() {
                                r.scroll(-1, d)
                            }).add(p), this.pager = o.text("", 15, 10).addClass("highcharts-legend-navigation").css(c.style).add(p), this.down = o.symbol("triangle-down", 0, 0, u, u).on("click", function() {
                                r.scroll(1, d)
                            }).add(p)), r.scroll(0), t = n) : p && (m(), this.nav = p.destroy(), this.scrollGroup.attr({
                                translateY: 1
                            }), this.clipHeight = 0), t
                        },
                        scroll: function(t, e) {
                            var i = this.pages,
                                r = i.length;
                            t = this.currentPage + t;
                            var n = this.clipHeight,
                                o = this.options.navigation,
                                s = this.pager,
                                a = this.padding;
                            t > r && (t = r), 0 < t && (void 0 !== e && iP(e, this.chart), this.nav.attr({
                                translateX: a,
                                translateY: n + this.padding + 7 + this.titleHeight,
                                visibility: "visible"
                            }), this.up.attr({
                                class: 1 === t ? "highcharts-legend-nav-inactive" : "highcharts-legend-nav-active"
                            }), s.attr({
                                text: t + "/" + r
                            }), this.down.attr({
                                x: 18 + this.pager.getBBox().width,
                                class: t === r ? "highcharts-legend-nav-inactive" : "highcharts-legend-nav-active"
                            }), this.up.attr({
                                fill: 1 === t ? o.inactiveColor : o.activeColor
                            }).css({
                                cursor: 1 === t ? "default" : "pointer"
                            }), this.down.attr({
                                fill: t === r ? o.inactiveColor : o.activeColor
                            }).css({
                                cursor: t === r ? "default" : "pointer"
                            }), e = -i[t - 1] + this.initialItemY, this.scrollGroup.animate({
                                translateY: e
                            }), this.currentPage = t, this.positionCheckboxes(e))
                        }
                    }, iy.LegendSymbolMixin = {
                        drawRectangle: function(t, e) {
                            var i = t.symbolHeight,
                                r = t.options.squareSymbol;
                            e.legendSymbol = this.chart.renderer.rect(r ? (t.symbolWidth - i) / 2 : 0, t.baseline - i + 1, r ? i : t.symbolWidth, i, iT(t.options.symbolRadius, i / 2)).addClass("highcharts-point").attr({
                                zIndex: 3
                            }).add(e.legendGroup)
                        },
                        drawLineMarker: function(t) {
                            var e, i = this.options,
                                r = i.marker,
                                n = t.symbolWidth,
                                o = t.symbolHeight,
                                s = o / 2,
                                a = this.chart.renderer,
                                l = this.legendGroup;
                            t = t.baseline - Math.round(.3 * t.fontMetrics.b), e = {
                                "stroke-width": i.lineWidth || 0
                            }, i.dashStyle && (e.dashstyle = i.dashStyle), this.legendLine = a.path(["M", 0, t, "L", n, t]).addClass("highcharts-graph").attr(e).add(l), r && !1 !== r.enabled && (i = Math.min(iT(r.radius, s), s), 0 === this.symbol.indexOf("url") && (r = iA(r, {
                                width: o,
                                height: o
                            }), i = 0), this.legendSymbol = r = a.symbol(this.symbol, n / 2 - i, t - i, 2 * i, 2 * i, r).addClass("highcharts-point").add(l), r.isMarker = !0)
                        }
                    }, (/Trident\/7\.0/.test(iI.navigator.userAgent) || iM) && iL(iy.Legend.prototype, "positionItem", function(t, e) {
                        var i = this,
                            r = function() {
                                e._legendItemPos && t.call(i, e)
                            };
                        r(), setTimeout(r)
                    }), iE = (iD = t).addEvent, ij = iD.animate, iN = iD.animObject, iR = iD.attr, iB = iD.doc, iz = iD.Axis, iG = iD.createElement, iW = iD.defaultOptions, iH = iD.discardElement, iF = iD.charts, iX = iD.css, iY = iD.defined, iV = iD.each, iU = iD.extend, i_ = iD.find, iK = iD.fireEvent, iq = iD.getStyle, i$ = iD.grep, iZ = iD.isNumber, iJ = iD.isObject, iQ = iD.isString, i0 = iD.Legend, i1 = iD.marginNames, i2 = iD.merge, i3 = iD.objectEach, i5 = iD.Pointer, i6 = iD.pick, i9 = iD.pInt, i8 = iD.removeEvent, i4 = iD.seriesTypes, i7 = iD.splat, rt = iD.svg, re = iD.syncTimeout, ri = iD.win, rr = iD.Renderer, rn = iD.Chart = function() {
                        this.getArgs.apply(this, arguments)
                    }, iD.chart = function(t, e, i) {
                        return new rn(t, e, i)
                    }, iU(rn.prototype, {
                        callbacks: [],
                        getArgs: function() {
                            var t = [].slice.call(arguments);
                            (iQ(t[0]) || t[0].nodeName) && (this.renderTo = t.shift()), this.init(t[0], t[1])
                        },
                        init: function(t, e) {
                            var i, r, n = t.series,
                                o = t.plotOptions || {};
                            for (r in t.series = null, (i = i2(iW, t)).plotOptions) i.plotOptions[r].tooltip = o[r] && i2(o[r].tooltip) || void 0;
                            i.tooltip.userOptions = t.chart && t.chart.forExport && t.tooltip.userOptions || t.tooltip, i.series = t.series = n, this.userOptions = t, r = (t = i.chart).events, this.margin = [], this.spacing = [], this.bounds = {
                                h: {},
                                v: {}
                            }, this.callback = e, this.isResizing = 0, this.options = i, this.axes = [], this.series = [], this.hasCartesianSeries = t.showAxes;
                            var s = this;
                            s.index = iF.length, iF.push(s), iD.chartCount++, r && i3(r, function(t, e) {
                                iE(s, e, t)
                            }), s.xAxis = [], s.yAxis = [], s.pointCount = s.colorCounter = s.symbolCounter = 0, s.firstRender()
                        },
                        initSeries: function(t) {
                            var e = this.options.chart;
                            return (e = i4[t.type || e.type || e.defaultSeriesType]) || iD.error(17, !0), (e = new e).init(this, t), e
                        },
                        orderSeries: function(t) {
                            var e = this.series;
                            for (t = t || 0; t < e.length; t++) e[t] && (e[t].index = t, e[t].name = e[t].name || "Series " + (e[t].index + 1))
                        },
                        isInsidePlot: function(t, e, i) {
                            var r = i ? e : t;
                            return t = i ? t : e, 0 <= r && r <= this.plotWidth && 0 <= t && t <= this.plotHeight
                        },
                        redraw: function(t) {
                            var e, i, r, n = this.axes,
                                o = this.series,
                                s = this.pointer,
                                a = this.legend,
                                l = this.isDirtyLegend,
                                h = this.hasCartesianSeries,
                                c = this.isDirtyBox,
                                d = this.renderer,
                                u = d.isHidden(),
                                p = [];
                            for (this.setResponsive && this.setResponsive(!1), iD.setAnimation(t, this), u && this.temporaryDisplay(), this.layOutTitles(), t = o.length; t--;)
                                if ((r = o[t]).options.stacking && (e = !0, r.isDirty)) {
                                    i = !0;
                                    break
                                } if (i)
                                for (t = o.length; t--;)(r = o[t]).options.stacking && (r.isDirty = !0);
                            iV(o, function(t) {
                                t.isDirty && "point" === t.options.legendType && (t.updateTotals && t.updateTotals(), l = !0), t.isDirtyData && iK(t, "updatedData")
                            }), l && a.options.enabled && (a.render(), this.isDirtyLegend = !1), e && this.getStacks(), h && iV(n, function(t) {
                                t.updateNames(), t.setScale()
                            }), this.getMargins(), h && (iV(n, function(t) {
                                t.isDirty && (c = !0)
                            }), iV(n, function(t) {
                                var i = t.min + "," + t.max;
                                t.extKey !== i && (t.extKey = i, p.push(function() {
                                    iK(t, "afterSetExtremes", iU(t.eventArgs, t.getExtremes())), delete t.eventArgs
                                })), (c || e) && t.redraw()
                            })), c && this.drawChartBox(), iK(this, "predraw"), iV(o, function(t) {
                                (c || t.isDirty) && t.visible && t.redraw(), t.isDirtyData = !1
                            }), s && s.reset(!0), d.draw(), iK(this, "redraw"), iK(this, "render"), u && this.temporaryDisplay(!0), iV(p, function(t) {
                                t.call()
                            })
                        },
                        get: function(t) {
                            function e(e) {
                                return e.id === t || e.options && e.options.id === t
                            }
                            var i, r, n = this.series;
                            for (r = 0, i = i_(this.axes, e) || i_(this.series, e); !i && r < n.length; r++) i = i_(n[r].points || [], e);
                            return i
                        },
                        getAxes: function() {
                            var t = this,
                                e = this.options,
                                i = e.xAxis = i7(e.xAxis || {}),
                                e = e.yAxis = i7(e.yAxis || {});
                            iV(i, function(t, e) {
                                t.index = e, t.isX = !0
                            }), iV(e, function(t, e) {
                                t.index = e
                            }), iV(i = i.concat(e), function(e) {
                                new iz(t, e)
                            })
                        },
                        getSelectedPoints: function() {
                            var t = [];
                            return iV(this.series, function(e) {
                                t = t.concat(i$(e.data || [], function(t) {
                                    return t.selected
                                }))
                            }), t
                        },
                        getSelectedSeries: function() {
                            return i$(this.series, function(t) {
                                return t.selected
                            })
                        },
                        setTitle: function(t, e, i) {
                            var r, n = this,
                                o = n.options;
                            r = o.title = i2({
                                style: {
                                    color: "#333333",
                                    fontSize: o.isStock ? "16px" : "18px"
                                }
                            }, o.title, t), o = o.subtitle = i2({
                                style: {
                                    color: "#666666"
                                }
                            }, o.subtitle, e), iV([
                                ["title", t, r],
                                ["subtitle", e, o]
                            ], function(t, e) {
                                var i = t[0],
                                    r = n[i],
                                    o = t[1];
                                t = t[2], r && o && (n[i] = r = r.destroy()), t && t.text && !r && (n[i] = n.renderer.text(t.text, 0, 0, t.useHTML).attr({
                                    align: t.align,
                                    class: "highcharts-" + i,
                                    zIndex: t.zIndex || 4
                                }).add(), n[i].update = function(t) {
                                    n.setTitle(!e && t, e && t)
                                }, n[i].css(t.style))
                            }), n.layOutTitles(i)
                        },
                        layOutTitles: function(t) {
                            var e, i = 0,
                                r = this.renderer,
                                n = this.spacingBox;
                            iV(["title", "subtitle"], function(t) {
                                var e, o = this[t],
                                    s = this.options[t];
                                t = "title" === t ? -3 : s.verticalAlign ? 0 : i + 2, o && (e = s.style.fontSize, e = r.fontMetrics(e, o).b, o.css({
                                    width: (s.width || n.width + s.widthAdjust) + "px"
                                }).align(iU({
                                    y: t + e
                                }, s), !1, "spacingBox"), s.floating || s.verticalAlign || (i = Math.ceil(i + o.getBBox(s.useHTML).height)))
                            }, this), e = this.titleOffset !== i, this.titleOffset = i, !this.isDirtyBox && e && (this.isDirtyBox = e, this.hasRendered && i6(t, !0) && this.isDirtyBox && this.redraw())
                        },
                        getChartSize: function() {
                            var t = this.options.chart,
                                e = t.width,
                                t = t.height,
                                i = this.renderTo;
                            iY(e) || (this.containerWidth = iq(i, "width")), iY(t) || (this.containerHeight = iq(i, "height")), this.chartWidth = Math.max(0, e || this.containerWidth || 600), this.chartHeight = Math.max(0, iD.relativeLength(t, this.chartWidth) || this.containerHeight || 400)
                        },
                        temporaryDisplay: function(t) {
                            var e = this.renderTo;
                            if (t)
                                for (; e && e.style;) e.hcOrigStyle && (iD.css(e, e.hcOrigStyle), delete e.hcOrigStyle), e.hcOrigDetached && (iB.body.removeChild(e), e.hcOrigDetached = !1), e = e.parentNode;
                            else
                                for (; e && e.style && (iB.body.contains(e) || (e.hcOrigDetached = !0, iB.body.appendChild(e)), ("none" === iq(e, "display", !1) || e.hcOricDetached) && (e.hcOrigStyle = {
                                        display: e.style.display,
                                        height: e.style.height,
                                        overflow: e.style.overflow
                                    }, t = {
                                        display: "block",
                                        overflow: "hidden"
                                    }, e !== this.renderTo && (t.height = 0), iD.css(e, t), e.offsetWidth || e.style.setProperty("display", "block", "important")), (e = e.parentNode) !== iB.body););
                        },
                        setClassName: function(t) {
                            this.container.className = "highcharts-container " + (t || "")
                        },
                        getContainer: function() {
                            var t, e, i, r = this.options,
                                n = r.chart;
                            t = this.renderTo;
                            var o, s = iD.uniqueKey();
                            t || (this.renderTo = t = n.renderTo), iQ(t) && (this.renderTo = t = iB.getElementById(t)), t || iD.error(13, !0), iZ(e = i9(iR(t, "data-highcharts-chart"))) && iF[e] && iF[e].hasRendered && iF[e].destroy(), iR(t, "data-highcharts-chart", this.index), t.innerHTML = "", n.skipClone || t.offsetWidth || this.temporaryDisplay(), this.getChartSize(), o = iU({
                                position: "relative",
                                overflow: "hidden",
                                width: (e = this.chartWidth) + "px",
                                height: (i = this.chartHeight) + "px",
                                textAlign: "left",
                                lineHeight: "normal",
                                zIndex: 0,
                                "-webkit-tap-highlight-color": "rgba(0,0,0,0)"
                            }, n.style), this.container = t = iG("div", {
                                id: s
                            }, o, t), this._cursor = t.style.cursor, this.renderer = new(iD[n.renderer] || rr)(t, e, i, null, n.forExport, r.exporting && r.exporting.allowHTML), this.setClassName(n.className), this.renderer.setStyle(n.style), this.renderer.chartIndex = this.index
                        },
                        getMargins: function(t) {
                            var e = this.spacing,
                                i = this.margin,
                                r = this.titleOffset;
                            this.resetMargins(), r && !iY(i[0]) && (this.plotTop = Math.max(this.plotTop, r + this.options.title.margin + e[0])), this.legend.display && this.legend.adjustMargins(i, e), this.extraMargin && (this[this.extraMargin.type] = (this[this.extraMargin.type] || 0) + this.extraMargin.value), this.extraTopMargin && (this.plotTop += this.extraTopMargin), t || this.getAxisMargins()
                        },
                        getAxisMargins: function() {
                            var t = this,
                                e = t.axisOffset = [0, 0, 0, 0],
                                i = t.margin;
                            t.hasCartesianSeries && iV(t.axes, function(t) {
                                t.visible && t.getOffset()
                            }), iV(i1, function(r, n) {
                                iY(i[n]) || (t[r] += e[n])
                            }), t.setChartSize()
                        },
                        reflow: function(t) {
                            var e = this,
                                i = e.options.chart,
                                r = e.renderTo,
                                n = iY(i.width) && iY(i.height),
                                o = i.width || iq(r, "width"),
                                i = i.height || iq(r, "height"),
                                r = t ? t.target : ri;
                            !n && !e.isPrinting && o && i && (r === ri || r === iB) && ((o !== e.containerWidth || i !== e.containerHeight) && (clearTimeout(e.reflowTimeout), e.reflowTimeout = re(function() {
                                e.container && e.setSize(void 0, void 0, !1)
                            }, 100 * !!t)), e.containerWidth = o, e.containerHeight = i)
                        },
                        initReflow: function() {
                            var t, e = this;
                            t = iE(ri, "resize", function(t) {
                                e.reflow(t)
                            }), iE(e, "destroy", t)
                        },
                        setSize: function(t, e, i) {
                            var r = this,
                                n = r.renderer;
                            r.isResizing += 1, iD.setAnimation(i, r), r.oldChartHeight = r.chartHeight, r.oldChartWidth = r.chartWidth, void 0 !== t && (r.options.chart.width = t), void 0 !== e && (r.options.chart.height = e), r.getChartSize(), ((t = n.globalAnimation) ? ij : iX)(r.container, {
                                width: r.chartWidth + "px",
                                height: r.chartHeight + "px"
                            }, t), r.setChartSize(!0), n.setSize(r.chartWidth, r.chartHeight, i), iV(r.axes, function(t) {
                                t.isDirty = !0, t.setScale()
                            }), r.isDirtyLegend = !0, r.isDirtyBox = !0, r.layOutTitles(), r.getMargins(), r.redraw(i), r.oldChartHeight = null, iK(r, "resize"), re(function() {
                                r && iK(r, "endResize", null, function() {
                                    --r.isResizing
                                })
                            }, iN(t).duration)
                        },
                        setChartSize: function(t) {
                            function e(t) {
                                return t = p[t] || 0, Math.max(s || t, t) / 2
                            }
                            var i, r, n, o, s, a = this.inverted,
                                l = this.renderer,
                                h = this.chartWidth,
                                c = this.chartHeight,
                                d = this.options.chart,
                                u = this.spacing,
                                p = this.clipOffset;
                            this.plotLeft = i = Math.round(this.plotLeft), this.plotTop = r = Math.round(this.plotTop), this.plotWidth = n = Math.max(0, Math.round(h - i - this.marginRight)), this.plotHeight = o = Math.max(0, Math.round(c - r - this.marginBottom)), this.plotSizeX = a ? o : n, this.plotSizeY = a ? n : o, this.plotBorderWidth = d.plotBorderWidth || 0, this.spacingBox = l.spacingBox = {
                                x: u[3],
                                y: u[0],
                                width: h - u[3] - u[1],
                                height: c - u[0] - u[2]
                            }, this.plotBox = l.plotBox = {
                                x: i,
                                y: r,
                                width: n,
                                height: o
                            }, s = 2 * Math.floor(this.plotBorderWidth / 2), a = Math.ceil(e(3)), l = Math.ceil(e(0)), this.clipBox = {
                                x: a,
                                y: l,
                                width: Math.floor(this.plotSizeX - e(1) - a),
                                height: Math.max(0, Math.floor(this.plotSizeY - e(2) - l))
                            }, t || iV(this.axes, function(t) {
                                t.setAxisSize(), t.setAxisTranslation()
                            })
                        },
                        resetMargins: function() {
                            var t = this,
                                e = t.options.chart;
                            iV(["margin", "spacing"], function(i) {
                                var r = e[i],
                                    n = iJ(r) ? r : [r, r, r, r];
                                iV(["Top", "Right", "Bottom", "Left"], function(r, o) {
                                    t[i][o] = i6(e[i + r], n[o])
                                })
                            }), iV(i1, function(e, i) {
                                t[e] = i6(t.margin[i], t.spacing[i])
                            }), t.axisOffset = [0, 0, 0, 0], t.clipOffset = []
                        },
                        drawChartBox: function() {
                            var t, e, i = this.options.chart,
                                r = this.renderer,
                                n = this.chartWidth,
                                o = this.chartHeight,
                                s = this.chartBackground,
                                a = this.plotBackground,
                                l = this.plotBorder,
                                h = this.plotBGImage,
                                c = i.backgroundColor,
                                d = i.plotBackgroundColor,
                                u = i.plotBackgroundImage,
                                p = this.plotLeft,
                                f = this.plotTop,
                                g = this.plotWidth,
                                m = this.plotHeight,
                                v = this.plotBox,
                                y = this.clipRect,
                                b = this.clipBox,
                                x = "animate";
                            s || (this.chartBackground = s = r.rect().addClass("highcharts-background").add(), x = "attr"), e = (t = i.borderWidth || 0) + 8 * !!i.shadow, c = {
                                fill: c || "none"
                            }, (t || s["stroke-width"]) && (c.stroke = i.borderColor, c["stroke-width"] = t), s.attr(c).shadow(i.shadow), s[x]({
                                x: e / 2,
                                y: e / 2,
                                width: n - e - t % 2,
                                height: o - e - t % 2,
                                r: i.borderRadius
                            }), x = "animate", a || (x = "attr", this.plotBackground = a = r.rect().addClass("highcharts-plot-background").add()), a[x](v), a.attr({
                                fill: d || "none"
                            }).shadow(i.plotShadow), u && (h ? h.animate(v) : this.plotBGImage = r.image(u, p, f, g, m).add()), y ? y.animate({
                                width: b.width,
                                height: b.height
                            }) : this.clipRect = r.clipRect(b), x = "animate", l || (x = "attr", this.plotBorder = l = r.rect().addClass("highcharts-plot-border").attr({
                                zIndex: 1
                            }).add()), l.attr({
                                stroke: i.plotBorderColor,
                                "stroke-width": i.plotBorderWidth || 0,
                                fill: "none"
                            }), l[x](l.crisp({
                                x: p,
                                y: f,
                                width: g,
                                height: m
                            }, -l.strokeWidth())), this.isDirtyBox = !1
                        },
                        propFromSeries: function() {
                            var t, e, i, r = this,
                                n = r.options.chart,
                                o = r.options.series;
                            iV(["inverted", "angular", "polar"], function(s) {
                                for (t = i4[n.type || n.defaultSeriesType], i = n[s] || t && t.prototype[s], e = o && o.length; !i && e--;)(t = i4[o[e].type]) && t.prototype[s] && (i = !0);
                                r[s] = i
                            })
                        },
                        linkSeries: function() {
                            var t = this,
                                e = t.series;
                            iV(e, function(t) {
                                t.linkedSeries.length = 0
                            }), iV(e, function(e) {
                                var i = e.options.linkedTo;
                                iQ(i) && (i = ":previous" === i ? t.series[e.index - 1] : t.get(i)) && i.linkedParent !== e && (i.linkedSeries.push(e), e.linkedParent = i, e.visible = i6(e.options.visible, i.options.visible, e.visible))
                            })
                        },
                        renderSeries: function() {
                            iV(this.series, function(t) {
                                t.translate(), t.render()
                            })
                        },
                        renderLabels: function() {
                            var t = this,
                                e = t.options.labels;
                            e.items && iV(e.items, function(i) {
                                var r = iU(e.style, i.style),
                                    n = i9(r.left) + t.plotLeft,
                                    o = i9(r.top) + t.plotTop + 12;
                                delete r.left, delete r.top, t.renderer.text(i.html, n, o).attr({
                                    zIndex: 2
                                }).css(r).add()
                            })
                        },
                        render: function() {
                            var t, e, i, r = this.axes,
                                n = this.renderer,
                                o = this.options;
                            this.setTitle(), this.legend = new i0(this, o.legend), this.getStacks && this.getStacks(), this.getMargins(!0), this.setChartSize(), o = this.plotWidth, t = this.plotHeight -= 21, iV(r, function(t) {
                                t.setScale()
                            }), this.getAxisMargins(), e = 1.1 < o / this.plotWidth, i = 1.05 < t / this.plotHeight, (e || i) && (iV(r, function(t) {
                                (t.horiz && e || !t.horiz && i) && t.setTickInterval(!0)
                            }), this.getMargins()), this.drawChartBox(), this.hasCartesianSeries && iV(r, function(t) {
                                t.visible && t.render()
                            }), this.seriesGroup || (this.seriesGroup = n.g("series-group").attr({
                                zIndex: 3
                            }).add()), this.renderSeries(), this.renderLabels(), this.addCredits(), this.setResponsive && this.setResponsive(), this.hasRendered = !0
                        },
                        addCredits: function(t) {
                            var e = this;
                            (t = i2(!0, this.options.credits, t)).enabled && !this.credits && (this.credits = this.renderer.text(t.text + (this.mapCredits || ""), 0, 0).addClass("highcharts-credits").on("click", function() {
                                t.href && (ri.location.href = t.href)
                            }).attr({
                                align: t.position.align,
                                zIndex: 8
                            }).css(t.style).add().align(t.position), this.credits.update = function(t) {
                                e.credits = e.credits.destroy(), e.addCredits(t)
                            })
                        },
                        destroy: function() {
                            var t, e = this,
                                i = e.axes,
                                r = e.series,
                                n = e.container,
                                o = n && n.parentNode;
                            for (iK(e, "destroy"), e.renderer.forExport ? iD.erase(iF, e) : iF[e.index] = void 0, iD.chartCount--, e.renderTo.removeAttribute("data-highcharts-chart"), i8(e), t = i.length; t--;) i[t] = i[t].destroy();
                            for (this.scroller && this.scroller.destroy && this.scroller.destroy(), t = r.length; t--;) r[t] = r[t].destroy();
                            iV("title subtitle chartBackground plotBackground plotBGImage plotBorder seriesGroup clipRect credits pointer rangeSelector legend resetZoomButton tooltip renderer".split(" "), function(t) {
                                var i = e[t];
                                i && i.destroy && (e[t] = i.destroy())
                            }), n && (n.innerHTML = "", i8(n), o && iH(n)), i3(e, function(t, i) {
                                delete e[i]
                            })
                        },
                        isReadyToRender: function() {
                            var t = this;
                            return !!rt || ri != ri.top || "complete" === iB.readyState || (iB.attachEvent("onreadystatechange", function() {
                                iB.detachEvent("onreadystatechange", t.firstRender), "complete" === iB.readyState && t.firstRender()
                            }), !1)
                        },
                        firstRender: function() {
                            var t = this,
                                e = t.options;
                            t.isReadyToRender() && (t.getContainer(), iK(t, "init"), t.resetMargins(), t.setChartSize(), t.propFromSeries(), t.getAxes(), iV(e.series || [], function(e) {
                                t.initSeries(e)
                            }), t.linkSeries(), iK(t, "beforeRender"), i5 && (t.pointer = new i5(t, e)), t.render(), !t.renderer.imgCount && t.onload && t.onload(), t.temporaryDisplay(!0))
                        },
                        onload: function() {
                            iV([this.callback].concat(this.callbacks), function(t) {
                                t && void 0 !== this.index && t.apply(this, [this])
                            }, this), iK(this, "load"), iK(this, "render"), iY(this.index) && !1 !== this.options.chart.reflow && this.initReflow(), this.onload = null
                        }
                    }), ra = (ro = t).each, rl = ro.extend, rh = ro.erase, rc = ro.fireEvent, rd = ro.format, ru = ro.isArray, rp = ro.isNumber, rf = ro.pick, rg = ro.removeEvent, ro.Point = rs = function() {}, ro.Point.prototype = {
                        init: function(t, e, i) {
                            return this.series = t, this.color = t.color, this.applyOptions(e, i), t.options.colorByPoint ? (e = t.options.colors || t.chart.options.colors, this.color = this.color || e[t.colorCounter], e = e.length, i = t.colorCounter, t.colorCounter++, t.colorCounter === e && (t.colorCounter = 0)) : i = t.colorIndex, this.colorIndex = rf(this.colorIndex, i), t.chart.pointCount++, this
                        },
                        applyOptions: function(t, e) {
                            var i = this.series,
                                r = i.options.pointValKey || i.pointValKey;
                            return rl(this, t = rs.prototype.optionsToObject.call(this, t)), this.options = this.options ? rl(this.options, t) : t, t.group && delete this.group, r && (this.y = this[r]), this.isNull = rf(this.isValid && !this.isValid(), null === this.x || !rp(this.y, !0)), this.selected && (this.state = "select"), "name" in this && void 0 === e && i.xAxis && i.xAxis.hasNames && (this.x = i.xAxis.nameToX(this)), void 0 === this.x && i && (this.x = void 0 === e ? i.autoIncrement(this) : e), this
                        },
                        optionsToObject: function(t) {
                            var e = {},
                                i = this.series,
                                r = i.options.keys,
                                n = r || i.pointArrayMap || ["y"],
                                o = n.length,
                                a = 0,
                                l = 0;
                            if (rp(t) || null === t) e[n[0]] = t;
                            else if (ru(t))
                                for (!r && t.length > o && ("string" === (i = s(t[0])) ? e.name = t[0] : "number" === i && (e.x = t[0]), a++); l < o;) r && void 0 === t[a] || (e[n[l]] = t[a]), a++, l++;
                            else "object" === (void 0 === t ? "undefined" : s(t)) && (e = t, t.dataLabels && (i._hasPointLabels = !0), t.marker && (i._hasPointMarkers = !0));
                            return e
                        },
                        getClassName: function() {
                            return "highcharts-point" + (this.selected ? " highcharts-point-select" : "") + (this.negative ? " highcharts-negative" : "") + (this.isNull ? " highcharts-null-point" : "") + (void 0 !== this.colorIndex ? " highcharts-color-" + this.colorIndex : "") + (this.options.className ? " " + this.options.className : "") + (this.zone && this.zone.className ? " " + this.zone.className.replace("highcharts-negative", "") : "")
                        },
                        getZone: function() {
                            var t, e = this.series,
                                i = e.zones,
                                e = e.zoneAxis || "y",
                                r = 0;
                            for (t = i[0]; this[e] >= t.value;) t = i[++r];
                            return t && t.color && !this.options.color && (this.color = t.color), t
                        },
                        destroy: function() {
                            var t, e = this.series.chart,
                                i = e.hoverPoints;
                            for (t in e.pointCount--, i && (this.setState(), rh(i, this), i.length || (e.hoverPoints = null)), this === e.hoverPoint && this.onMouseOut(), (this.graphic || this.dataLabel) && (rg(this), this.destroyElements()), this.legendItem && e.legend.destroyItem(this), this) this[t] = null
                        },
                        destroyElements: function() {
                            for (var t, e = ["graphic", "dataLabel", "dataLabelUpper", "connector", "shadowGroup"], i = 6; i--;) this[t = e[i]] && (this[t] = this[t].destroy())
                        },
                        getLabelConfig: function() {
                            return {
                                x: this.category,
                                y: this.y,
                                color: this.color,
                                colorIndex: this.colorIndex,
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
                                r = rf(i.valueDecimals, ""),
                                n = i.valuePrefix || "",
                                o = i.valueSuffix || "";
                            return ra(e.pointArrayMap || ["y"], function(e) {
                                e = "{point." + e, (n || o) && (t = t.replace(e + "}", n + e + "}" + o)), t = t.replace(e + "}", e + ":,." + r + "f}")
                            }), rd(t, {
                                point: this,
                                series: this.series
                            })
                        },
                        firePointEvent: function(t, e, i) {
                            var r = this,
                                n = this.series.options;
                            (n.point.events[t] || r.options && r.options.events && r.options.events[t]) && this.importEvents(), "click" === t && n.allowPointSelect && (i = function(t) {
                                r.select && r.select(null, t.ctrlKey || t.metaKey || t.shiftKey)
                            }), rc(this, t, e, i)
                        },
                        visible: !0
                    }, rv = (rm = t).addEvent, ry = rm.animObject, rb = rm.arrayMax, rx = rm.arrayMin, rw = rm.correctFloat, rk = rm.Date, rS = rm.defaultOptions, rM = rm.defaultPlotOptions, rC = rm.defined, rA = rm.each, rT = rm.erase, rP = rm.extend, rO = rm.fireEvent, rI = rm.grep, rL = rm.isArray, rD = rm.isNumber, rE = rm.isString, rj = rm.merge, rN = rm.objectEach, rR = rm.pick, rB = rm.removeEvent, rz = rm.splat, rG = rm.SVGElement, rW = rm.syncTimeout, rH = rm.win, rm.Series = rm.seriesType("line", null, {
                        lineWidth: 2,
                        allowPointSelect: !1,
                        showCheckbox: !1,
                        animation: {
                            duration: 1e3
                        },
                        events: {},
                        marker: {
                            lineWidth: 0,
                            lineColor: "#ffffff",
                            radius: 4,
                            states: {
                                hover: {
                                    animation: {
                                        duration: 50
                                    },
                                    enabled: !0,
                                    radiusPlus: 2,
                                    lineWidthPlus: 1
                                },
                                select: {
                                    fillColor: "#cccccc",
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
                                return null === this.y ? "" : rm.numberFormat(this.y, -1)
                            },
                            style: {
                                fontSize: "11px",
                                fontWeight: "bold",
                                color: "contrast",
                                textOutline: "1px contrast"
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
                                animation: {
                                    duration: 50
                                },
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
                        turboThreshold: 1e3,
                        findNearestPointBy: "x"
                    }, {
                        isCartesian: !0,
                        pointClass: rm.Point,
                        sorted: !0,
                        requireSorting: !0,
                        directTouch: !1,
                        axisTypes: ["xAxis", "yAxis"],
                        colorCounter: 0,
                        parallelArrays: ["x", "y"],
                        coll: "series",
                        init: function(t, e) {
                            var i, r, n = this,
                                o = t.series;
                            n.chart = t, n.options = e = n.setOptions(e), n.linkedSeries = [], n.bindAxes(), rP(n, {
                                name: e.name,
                                state: "",
                                visible: !1 !== e.visible,
                                selected: !0 === e.selected
                            }), rN(i = e.events, function(t, e) {
                                rv(n, e, t)
                            }), (i && i.click || e.point && e.point.events && e.point.events.click || e.allowPointSelect) && (t.runTrackerClick = !0), n.getColor(), n.getSymbol(), rA(n.parallelArrays, function(t) {
                                n[t + "Data"] = []
                            }), n.setData(e.data, !1), n.isCartesian && (t.hasCartesianSeries = !0), o.length && (r = o[o.length - 1]), n._i = rR(r && r._i, -1) + 1, t.orderSeries(this.insert(o))
                        },
                        insert: function(t) {
                            var e, i = this.options.index;
                            if (rD(i)) {
                                for (e = t.length; e--;)
                                    if (i >= rR(t[e].options.index, t[e]._i)) {
                                        t.splice(e + 1, 0, this);
                                        break
                                    } - 1 === e && t.unshift(this), e += 1
                            } else t.push(this);
                            return rR(e, t.length - 1)
                        },
                        bindAxes: function() {
                            var t, e = this,
                                i = e.options,
                                r = e.chart;
                            rA(e.axisTypes || [], function(n) {
                                rA(r[n], function(r) {
                                    t = r.options, (i[n] === t.index || void 0 !== i[n] && i[n] === t.id || void 0 === i[n] && 0 === t.index) && (e.insert(r.series), e[n] = r, r.isDirty = !0)
                                }), e[n] || e.optionalAxis === n || rm.error(18, !0)
                            })
                        },
                        updateParallelArrays: function(t, e) {
                            var i = t.series,
                                r = arguments,
                                n = rD(e) ? function(r) {
                                    var n = "y" === r && i.toYData ? i.toYData(t) : t[r];
                                    i[r + "Data"][e] = n
                                } : function(t) {
                                    Array.prototype[e].apply(i[t + "Data"], Array.prototype.slice.call(r, 2))
                                };
                            rA(i.parallelArrays, n)
                        },
                        autoIncrement: function() {
                            var t, e = this.options,
                                i = this.xIncrement,
                                r = e.pointIntervalUnit,
                                i = rR(i, e.pointStart, 0);
                            return this.pointInterval = t = rR(this.pointInterval, e.pointInterval, 1), r && (e = new rk(i), "day" === r ? e = +e[rk.hcSetDate](e[rk.hcGetDate]() + t) : "month" === r ? e = +e[rk.hcSetMonth](e[rk.hcGetMonth]() + t) : "year" === r && (e = +e[rk.hcSetFullYear](e[rk.hcGetFullYear]() + t)), t = e - i), this.xIncrement = i + t, i
                        },
                        setOptions: function(t) {
                            var e = this.chart,
                                i = e.options,
                                r = i.plotOptions,
                                n = (e.userOptions || {}).plotOptions || {},
                                o = r[this.type];
                            return this.userOptions = t, e = rj(o, r.series, t), this.tooltipOptions = rj(rS.tooltip, rS.plotOptions.series && rS.plotOptions.series.tooltip, rS.plotOptions[this.type].tooltip, i.tooltip.userOptions, r.series && r.series.tooltip, r[this.type].tooltip, t.tooltip), this.stickyTracking = rR(t.stickyTracking, n[this.type] && n[this.type].stickyTracking, n.series && n.series.stickyTracking, !!this.tooltipOptions.shared && !this.noSharedTooltip || e.stickyTracking), null === o.marker && delete e.marker, this.zoneAxis = e.zoneAxis, t = this.zones = (e.zones || []).slice(), (e.negativeColor || e.negativeFillColor) && !e.zones && t.push({
                                value: e[this.zoneAxis + "Threshold"] || e.threshold || 0,
                                className: "highcharts-negative",
                                color: e.negativeColor,
                                fillColor: e.negativeFillColor
                            }), t.length && rC(t[t.length - 1].value) && t.push({
                                color: this.color,
                                fillColor: this.fillColor
                            }), e
                        },
                        getCyclic: function(t, e, i) {
                            var r, n = this.chart,
                                o = this.userOptions,
                                s = t + "Index",
                                a = t + "Counter",
                                l = i ? i.length : rR(n.options.chart[t + "Count"], n[t + "Count"]);
                            e || (rC(r = rR(o[s], o["_" + s])) || (n.series.length || (n[a] = 0), o["_" + s] = r = n[a] % l, n[a] += 1), i && (e = i[r])), void 0 !== r && (this[s] = r), this[t] = e
                        },
                        getColor: function() {
                            this.options.colorByPoint ? this.options.color = null : this.getCyclic("color", this.options.color || rM[this.type].color, this.chart.options.colors)
                        },
                        getSymbol: function() {
                            this.getCyclic("symbol", this.options.marker.symbol, this.chart.options.symbols)
                        },
                        drawLegendSymbol: rm.LegendSymbolMixin.drawLineMarker,
                        setData: function(t, e, i, r) {
                            var n, o = this,
                                s = o.points,
                                a = s && s.length || 0,
                                l = o.options,
                                h = o.chart,
                                c = null,
                                d = o.xAxis,
                                u = l.turboThreshold,
                                p = this.xData,
                                f = this.yData,
                                g = (n = o.pointArrayMap) && n.length;
                            if (n = (t = t || []).length, e = rR(e, !0), !1 !== r && n && a === n && !o.cropped && !o.hasGroupedData && o.visible) rA(t, function(t, e) {
                                s[e].update && t !== l.data[e] && s[e].update(t, !1, null, !1)
                            });
                            else {
                                if (o.xIncrement = null, o.colorCounter = 0, rA(this.parallelArrays, function(t) {
                                        o[t + "Data"].length = 0
                                    }), u && n > u) {
                                    for (i = 0; null === c && i < n;) c = t[i], i++;
                                    if (rD(c))
                                        for (i = 0; i < n; i++) p[i] = this.autoIncrement(), f[i] = t[i];
                                    else if (rL(c))
                                        if (g)
                                            for (i = 0; i < n; i++) c = t[i], p[i] = c[0], f[i] = c.slice(1, g + 1);
                                        else
                                            for (i = 0; i < n; i++) c = t[i], p[i] = c[0], f[i] = c[1];
                                    else rm.error(12)
                                } else
                                    for (i = 0; i < n; i++) void 0 !== t[i] && (c = {
                                        series: o
                                    }, o.pointClass.prototype.applyOptions.apply(c, [t[i]]), o.updateParallelArrays(c, i));
                                for (rE(f[0]) && rm.error(14, !0), o.data = [], o.options.data = o.userOptions.data = t, i = a; i--;) s[i] && s[i].destroy && s[i].destroy();
                                d && (d.minRange = d.userMinRange), o.isDirty = h.isDirtyBox = !0, o.isDirtyData = !!s, i = !1
                            }
                            "point" === l.legendType && (this.processData(), this.generatePoints()), e && h.redraw(i)
                        },
                        processData: function(t) {
                            var e, i = this.xData,
                                r = this.yData,
                                n = i.length;
                            e = 0;
                            var o, s, a, l = this.xAxis,
                                h = this.options;
                            a = h.cropThreshold;
                            var c, d, u = this.getExtremesFromAll || h.getExtremesFromAll,
                                p = this.isCartesian,
                                h = l && l.val2lin,
                                f = l && l.isLog;
                            if (p && !this.isDirty && !l.isDirty && !this.yAxis.isDirty && !t) return !1;
                            for (l && (c = (t = l.getExtremes()).min, d = t.max), p && this.sorted && !u && (!a || n > a || this.forceCrop) && (i[n - 1] < c || i[0] > d ? (i = [], r = []) : (i[0] < c || i[n - 1] > d) && (i = (e = this.cropData(this.xData, this.yData, c, d)).xData, r = e.yData, e = e.start, o = !0)), a = i.length || 1; --a;) 0 < (n = f ? h(i[a]) - h(i[a - 1]) : i[a] - i[a - 1]) && (void 0 === s || n < s) ? s = n : 0 > n && this.requireSorting && rm.error(15);
                            this.cropped = o, this.cropStart = e, this.processedXData = i, this.processedYData = r, this.closestPointRange = s
                        },
                        cropData: function(t, e, i, r) {
                            var n, o = t.length,
                                s = 0,
                                a = o,
                                l = rR(this.cropShoulder, 1);
                            for (n = 0; n < o; n++)
                                if (t[n] >= i) {
                                    s = Math.max(0, n - l);
                                    break
                                } for (i = n; i < o; i++)
                                if (t[i] > r) {
                                    a = i + l;
                                    break
                                } return {
                                xData: t.slice(s, a),
                                yData: e.slice(s, a),
                                start: s,
                                end: a
                            }
                        },
                        generatePoints: function() {
                            var t, e, i, r, n = this.options,
                                o = n.data,
                                s = this.data,
                                a = this.processedXData,
                                l = this.processedYData,
                                h = this.pointClass,
                                c = a.length,
                                d = this.cropStart || 0,
                                u = this.hasGroupedData,
                                n = n.keys,
                                p = [];
                            for (s || u || ((s = []).length = o.length, s = this.data = s), n && u && (this.options.keys = !1), r = 0; r < c; r++) e = d + r, u ? (i = (new h).init(this, [a[r]].concat(rz(l[r])))).dataGroup = this.groupMap[r] : (i = s[e]) || void 0 === o[e] || (s[e] = i = (new h).init(this, o[e], a[r])), i && (i.index = e, p[r] = i);
                            if (this.options.keys = n, s && (c !== (t = s.length) || u))
                                for (r = 0; r < t; r++) r !== d || u || (r += c), s[r] && (s[r].destroyElements(), s[r].plotX = void 0);
                            this.data = s, this.points = p
                        },
                        getExtremes: function(t) {
                            var e, i, r, n, o, s = this.yAxis,
                                a = this.processedXData,
                                l = [],
                                h = 0,
                                c = (e = this.xAxis.getExtremes()).min,
                                d = e.max;
                            for (o = 0, e = (t = t || this.stackedYData || this.processedYData || []).length; o < e; o++)
                                if (r = a[o], i = (rD(n = t[o], !0) || rL(n)) && (!s.positiveValuesOnly || n.length || 0 < n), r = this.getExtremesFromAll || this.options.getExtremesFromAll || this.cropped || (a[o] || r) >= c && (a[o] || r) <= d, i && r)
                                    if (i = n.length)
                                        for (; i--;) null !== n[i] && (l[h++] = n[i]);
                                    else l[h++] = n;
                            this.dataMin = rx(l), this.dataMax = rb(l)
                        },
                        translate: function() {
                            this.processedXData || this.processData(), this.generatePoints();
                            var t, e, i, r, n = this.options,
                                o = n.stacking,
                                s = this.xAxis,
                                a = s.categories,
                                l = this.yAxis,
                                h = this.points,
                                c = h.length,
                                d = !!this.modifyValue,
                                u = n.pointPlacement,
                                p = "between" === u || rD(u),
                                f = n.threshold,
                                g = n.startFromThreshold ? f : 0,
                                m = Number.MAX_VALUE;
                            for ("between" === u && (u = .5), rD(u) && (u *= rR(n.pointRange || s.pointRange)), n = 0; n < c; n++) {
                                var v = h[n],
                                    y = v.x,
                                    b = v.y;
                                e = v.low;
                                var x, w = o && l.stacks[(this.negStacks && b < (g ? 0 : f) ? "-" : "") + this.stackKey];
                                l.positiveValuesOnly && null !== b && 0 >= b && (v.isNull = !0), v.plotX = t = rw(Math.min(Math.max(-1e5, s.translate(y, 0, 0, 0, 1, u, "flags" === this.type)), 1e5)), o && this.visible && !v.isNull && w && w[y] && (r = this.getStackIndicator(r, y, this.index), e = (b = (x = w[y]).points[r.key])[0], b = b[1], e === g && r.key === w[y].base && (e = rR(f, l.min)), l.positiveValuesOnly && 0 >= e && (e = null), v.total = v.stackTotal = x.total, v.percentage = x.total && v.y / x.total * 100, v.stackY = b, x.setOffset(this.pointXOffset || 0, this.barW || 0)), v.yBottom = rC(e) ? l.translate(e, 0, 1, 0, 1) : null, d && (b = this.modifyValue(b, v)), v.plotY = e = "number" == typeof b && 1 / 0 !== b ? Math.min(Math.max(-1e5, l.translate(b, 0, 1, 0, 1)), 1e5) : void 0, v.isInside = void 0 !== e && 0 <= e && e <= l.len && 0 <= t && t <= s.len, v.clientX = p ? rw(s.translate(y, 0, 0, 0, 1, u)) : t, v.negative = v.y < (f || 0), v.category = a && void 0 !== a[v.x] ? a[v.x] : v.x, v.isNull || (void 0 !== i && (m = Math.min(m, Math.abs(t - i))), i = t), v.zone = this.zones.length && v.getZone()
                            }
                            this.closestPointRangePx = m
                        },
                        getValidPoints: function(t, e) {
                            var i = this.chart;
                            return rI(t || this.points || [], function(t) {
                                return (!e || !!i.isInsidePlot(t.plotX, t.plotY, i.inverted)) && !t.isNull
                            })
                        },
                        setClip: function(t) {
                            var e = this.chart,
                                i = this.options,
                                r = e.renderer,
                                n = e.inverted,
                                o = this.clipBox,
                                s = o || e.clipBox,
                                a = this.sharedClipKey || ["_sharedClip", t && t.duration, t && t.easing, s.height, i.xAxis, i.yAxis].join(),
                                l = e[a],
                                h = e[a + "m"];
                            l || (t && (s.width = 0, e[a + "m"] = h = r.clipRect(-99, n ? -e.plotLeft : -e.plotTop, 99, n ? e.chartWidth : e.chartHeight)), e[a] = l = r.clipRect(s), l.count = {
                                length: 0
                            }), t && !l.count[this.index] && (l.count[this.index] = !0, l.count.length += 1), !1 !== i.clip && (this.group.clip(t || o ? l : e.clipRect), this.markerGroup.clip(h), this.sharedClipKey = a), t || (l.count[this.index] && (delete l.count[this.index], --l.count.length), 0 === l.count.length && a && e[a] && (o || (e[a] = e[a].destroy()), e[a + "m"] && (e[a + "m"] = e[a + "m"].destroy())))
                        },
                        animate: function(t) {
                            var e, i = this.chart,
                                r = ry(this.options.animation);
                            t ? this.setClip(r) : ((t = i[e = this.sharedClipKey]) && t.animate({
                                width: i.plotSizeX
                            }, r), i[e + "m"] && i[e + "m"].animate({
                                width: i.plotSizeX + 99
                            }, r), this.animate = null)
                        },
                        afterAnimate: function() {
                            this.setClip(), rO(this, "afterAnimate"), this.finishedAnimating = !0
                        },
                        drawPoints: function() {
                            var t, e, i, r, n, o, s, a, l = this.points,
                                h = this.chart,
                                c = this.options.marker,
                                d = this[this.specialGroup] || this.markerGroup,
                                u = rR(c.enabled, !!this.xAxis.isRadial || null, this.closestPointRangePx >= 2 * c.radius);
                            if (!1 !== c.enabled || this._hasPointMarkers)
                                for (e = 0; e < l.length; e++) t = (i = l[e]).plotY, r = i.graphic, n = i.marker || {}, o = !!i.marker, s = u && void 0 === n.enabled || n.enabled, a = i.isInside, s && rD(t) && null !== i.y ? (i.hasImage = 0 === (t = rR(n.symbol, this.symbol)).indexOf("url"), s = this.markerAttribs(i, i.selected && "select"), r ? r[a ? "show" : "hide"](!0).animate(s) : a && (0 < s.width || i.hasImage) && (i.graphic = r = h.renderer.symbol(t, s.x, s.y, s.width, s.height, o ? n : c).add(d)), r && r.attr(this.pointAttribs(i, i.selected && "select")), r && r.addClass(i.getClassName(), !0)) : r && (i.graphic = r.destroy())
                        },
                        markerAttribs: function(t, e) {
                            var i = this.options.marker,
                                r = t.marker || {},
                                n = rR(r.radius, i.radius);
                            return e && (i = i.states[e], n = rR((e = r.states && r.states[e]) && e.radius, i && i.radius, n + (i && i.radiusPlus || 0))), t.hasImage && (n = 0), t = {
                                x: Math.floor(t.plotX) - n,
                                y: t.plotY - n
                            }, n && (t.width = t.height = 2 * n), t
                        },
                        pointAttribs: function(t, e) {
                            var i = this.options.marker,
                                r = t && t.options,
                                n = r && r.marker || {},
                                o = this.color,
                                s = r && r.color,
                                a = t && t.color,
                                r = rR(n.lineWidth, i.lineWidth);
                            return t = t && t.zone && t.zone.color, o = s || t || a || o, t = n.fillColor || i.fillColor || o, o = n.lineColor || i.lineColor || o, e && (i = i.states[e], r = rR((e = n.states && n.states[e] || {}).lineWidth, i.lineWidth, r + rR(e.lineWidthPlus, i.lineWidthPlus, 0)), t = e.fillColor || i.fillColor || t, o = e.lineColor || i.lineColor || o), {
                                stroke: o,
                                "stroke-width": r,
                                fill: t
                            }
                        },
                        destroy: function() {
                            var t, e, i, r = this,
                                n = r.chart,
                                s = /AppleWebKit\/533/.test(rH.navigator.userAgent),
                                a = r.data || [];
                            for (rO(r, "destroy"), rB(r), rA(r.axisTypes || [], function(t) {
                                    (i = r[t]) && i.series && (rT(i.series, r), i.isDirty = i.forceRedraw = !0)
                                }), r.legendItem && r.chart.legend.destroyItem(r), t = a.length; t--;)(e = a[t]) && e.destroy && e.destroy();
                            r.points = null, clearTimeout(r.animationTimeout), rN(r, function(t, e) {
                                o(t, rG) && !t.survive && t[s && "group" === e ? "hide" : "destroy"]()
                            }), n.hoverSeries === r && (n.hoverSeries = null), rT(n.series, r), n.orderSeries(), rN(r, function(t, e) {
                                delete r[e]
                            })
                        },
                        getGraphPath: function(t, e, i) {
                            var r, n, o = this,
                                s = o.options,
                                a = s.step,
                                l = [],
                                h = [];
                            return (r = (t = t || o.points).reversed) && t.reverse(), (a = ({
                                right: 1,
                                center: 2
                            })[a] || a && 3) && r && (a = 4 - a), !s.connectNulls || e || i || (t = this.getValidPoints(t)), rA(t, function(r, c) {
                                var d = r.plotX,
                                    u = r.plotY,
                                    p = t[c - 1];
                                (r.leftCliff || p && p.rightCliff) && !i && (n = !0), r.isNull && !rC(e) && 0 < c ? n = !s.connectNulls : r.isNull && !e ? n = !0 : (0 === c || n ? c = ["M", r.plotX, r.plotY] : o.getPointSpline ? c = o.getPointSpline(t, r, c) : a ? (c = 1 === a ? ["L", p.plotX, u] : 2 === a ? ["L", (p.plotX + d) / 2, p.plotY, "L", (p.plotX + d) / 2, u] : ["L", d, p.plotY]).push("L", d, u) : c = ["L", d, u], h.push(r.x), a && h.push(r.x), l.push.apply(l, c), n = !1)
                            }), l.xMap = h, o.graphPath = l
                        },
                        drawGraph: function() {
                            var t = this,
                                e = this.options,
                                i = (this.gappedPath || this.getGraphPath).call(this),
                                r = [
                                    ["graph", "highcharts-graph", e.lineColor || this.color, e.dashStyle]
                                ];
                            rA(this.zones, function(i, n) {
                                r.push(["zone-graph-" + n, "highcharts-graph highcharts-zone-graph-" + n + " " + (i.className || ""), i.color || t.color, i.dashStyle || e.dashStyle])
                            }), rA(r, function(r, n) {
                                var o = r[0],
                                    s = t[o];
                                s ? (s.endX = i.xMap, s.animate({
                                    d: i
                                })) : i.length && (t[o] = t.chart.renderer.path(i).addClass(r[1]).attr({
                                    zIndex: 1
                                }).add(t.group), s = {
                                    stroke: r[2],
                                    "stroke-width": e.lineWidth,
                                    fill: t.fillGraph && t.color || "none"
                                }, r[3] ? s.dashstyle = r[3] : "square" !== e.linecap && (s["stroke-linecap"] = s["stroke-linejoin"] = "round"), s = t[o].attr(s).shadow(2 > n && e.shadow)), s && (s.startX = i.xMap, s.isArea = i.isArea)
                            })
                        },
                        applyZones: function() {
                            var t, e, i, r, n, o, s, a, l, h = this,
                                c = this.chart,
                                d = c.renderer,
                                u = this.zones,
                                p = this.clips || [],
                                f = this.graph,
                                g = this.area,
                                m = Math.max(c.chartWidth, c.chartHeight),
                                v = this[(this.zoneAxis || "y") + "Axis"],
                                y = c.inverted,
                                b = !1;
                            u.length && (f || g) && v && void 0 !== v.min && (n = v.reversed, o = v.horiz, f && f.hide(), g && g.hide(), r = v.getExtremes(), rA(u, function(u, x) {
                                t = n ? o ? c.plotWidth : 0 : o ? 0 : v.toPixels(r.min), t = Math.min(Math.max(rR(e, t), 0), m), e = Math.min(Math.max(Math.round(v.toPixels(rR(u.value, r.max), !0)), 0), m), b && (t = e = v.toPixels(r.max)), s = Math.abs(t - e), a = Math.min(t, e), l = Math.max(t, e), v.isXAxis ? (i = {
                                    x: y ? l : a,
                                    y: 0,
                                    width: s,
                                    height: m
                                }, o || (i.x = c.plotHeight - i.x)) : (i = {
                                    x: 0,
                                    y: y ? l : a,
                                    width: m,
                                    height: s
                                }, o && (i.y = c.plotWidth - i.y)), y && d.isVML && (i = v.isXAxis ? {
                                    x: 0,
                                    y: n ? a : l,
                                    height: i.width,
                                    width: c.chartWidth
                                } : {
                                    x: i.y - c.plotLeft - c.spacingBox.x,
                                    y: 0,
                                    width: i.height,
                                    height: c.chartHeight
                                }), p[x] ? p[x].animate(i) : (p[x] = d.clipRect(i), f && h["zone-graph-" + x].clip(p[x]), g && h["zone-area-" + x].clip(p[x])), b = u.value > r.max
                            }), this.clips = p)
                        },
                        invertGroups: function(t) {
                            function e() {
                                rA(["group", "markerGroup"], function(e) {
                                    r[e] && (n.renderer.isVML && r[e].attr({
                                        width: r.yAxis.len,
                                        height: r.xAxis.len
                                    }), r[e].width = r.yAxis.len, r[e].height = r.xAxis.len, r[e].invert(t))
                                })
                            }
                            var i, r = this,
                                n = r.chart;
                            r.xAxis && (i = rv(n, "resize", e), rv(r, "destroy", i), e(t), r.invertGroups = e)
                        },
                        plotGroup: function(t, e, i, r, n) {
                            var o = this[t],
                                s = !o;
                            return s && (this[t] = o = this.chart.renderer.g().attr({
                                zIndex: r || .1
                            }).add(n)), o.addClass("highcharts-" + e + " highcharts-series-" + this.index + " highcharts-" + this.type + "-series highcharts-color-" + this.colorIndex + " " + (this.options.className || ""), !0), o.attr({
                                visibility: i
                            })[s ? "attr" : "animate"](this.getPlotBox()), o
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
                                n = !!e.animate && i.renderer.isSVG && ry(r.animation).duration,
                                o = e.visible ? "inherit" : "hidden",
                                s = r.zIndex,
                                a = e.hasRendered,
                                l = i.seriesGroup,
                                h = i.inverted;
                            t = e.plotGroup("group", "series", o, s, l), e.markerGroup = e.plotGroup("markerGroup", "markers", o, s, l), n && e.animate(!0), t.inverted = !!e.isCartesian && h, e.drawGraph && (e.drawGraph(), e.applyZones()), e.drawDataLabels && e.drawDataLabels(), e.visible && e.drawPoints(), e.drawTracker && !1 !== e.options.enableMouseTracking && e.drawTracker(), e.invertGroups(h), !1 === r.clip || e.sharedClipKey || a || t.clip(i.clipRect), n && e.animate(), a || (e.animationTimeout = rW(function() {
                                e.afterAnimate()
                            }, n)), e.isDirty = !1, e.hasRendered = !0
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
                                translateX: rR(r && r.left, t.plotLeft),
                                translateY: rR(n && n.top, t.plotTop)
                            })), this.translate(), this.render(), e && delete this.kdTree
                        },
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
                            this.buildingKdTree = !0;
                            var t = this,
                                e = -1 < t.options.findNearestPointBy.indexOf("y") ? 2 : 1;
                            delete t.kdTree, rW(function() {
                                t.kdTree = function e(i, r, n) {
                                    var o, s;
                                    if (s = i && i.length) return o = t.kdAxisArray[r % n], i.sort(function(t, e) {
                                        return t[o] - e[o]
                                    }), {
                                        point: i[s = Math.floor(s / 2)],
                                        left: e(i.slice(0, s), r + 1, n),
                                        right: e(i.slice(s + 1), r + 1, n)
                                    }
                                }(t.getValidPoints(null, !t.directTouch), e, e), t.buildingKdTree = !1
                            }, +!t.options.kdNow)
                        },
                        searchKDTree: function(t, e) {
                            var i = this,
                                r = this.kdAxisArray[0],
                                n = this.kdAxisArray[1],
                                o = e ? "distX" : "dist";
                            if (e = -1 < i.options.findNearestPointBy.indexOf("y") ? 2 : 1, this.kdTree || this.buildingKdTree || this.buildKDTree(), this.kdTree) return function t(e, s, a, l) {
                                var h, c, d = s.point,
                                    u = i.kdAxisArray[a % l],
                                    p = d;
                                return h = ((c = rC(e[r]) && rC(d[r]) ? Math.pow(e[r] - d[r], 2) : null) || 0) + ((h = rC(e[n]) && rC(d[n]) ? Math.pow(e[n] - d[n], 2) : null) || 0), d.dist = rC(h) ? Math.sqrt(h) : Number.MAX_VALUE, d.distX = rC(c) ? Math.sqrt(c) : Number.MAX_VALUE, h = 0 > (u = e[u] - d[u]) ? "left" : "right", c = 0 > u ? "right" : "left", s[h] && (p = (h = t(e, s[h], a + 1, l))[o] < p[o] ? h : d), s[c] && Math.sqrt(u * u) < p[o] && (p = (e = t(e, s[c], a + 1, l))[o] < p[o] ? e : p), p
                            }(t, this.kdTree, e, e)
                        }
                    }), rX = (rF = t).Axis, rY = rF.Chart, rV = rF.correctFloat, rU = rF.defined, r_ = rF.destroyObjectProperties, rK = rF.each, rq = rF.format, r$ = rF.objectEach, rZ = rF.pick, rJ = rF.Series, rF.StackItem = function(t, e, i, r, n) {
                        var o = t.chart.inverted;
                        this.axis = t, this.isNegative = i, this.options = e, this.x = r, this.total = null, this.points = {}, this.stack = n, this.rightCliff = this.leftCliff = 0, this.alignOptions = {
                            align: e.align || (o ? i ? "left" : "right" : "center"),
                            verticalAlign: e.verticalAlign || (o ? "middle" : i ? "bottom" : "top"),
                            y: rZ(e.y, o ? 4 : i ? 14 : -6),
                            x: rZ(e.x, o ? i ? -6 : 6 : 0)
                        }, this.textAlign = e.textAlign || (o ? i ? "right" : "left" : "center")
                    }, rF.StackItem.prototype = {
                        destroy: function() {
                            r_(this, this.axis)
                        },
                        render: function(t) {
                            var e = this.options,
                                i = e.format,
                                i = i ? rq(i, this) : e.formatter.call(this);
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
                            var i = this.axis,
                                r = i.chart,
                                n = i.translate(i.usePercentage ? 100 : this.total, 0, 0, 0, 1),
                                i = i.translate(0),
                                i = Math.abs(n - i);
                            t = r.xAxis[0].translate(this.x) + t, n = this.getStackBox(r, this, t, n, e, i), (e = this.label) && (e.align(this.alignOptions, null, n), n = e.alignAttr, e[!1 === this.options.crop || r.isInsidePlot(n.x, n.y) ? "show" : "hide"](!0))
                        },
                        getStackBox: function(t, e, i, r, n, o) {
                            var s = e.axis.reversed,
                                a = t.inverted;
                            return t = t.plotHeight, e = e.isNegative && !s || !e.isNegative && s, {
                                x: a ? e ? r : r - o : i,
                                y: a ? t - i - n : e ? t - r - o : t - r,
                                width: a ? o : n,
                                height: a ? n : o
                            }
                        }
                    }, rY.prototype.getStacks = function() {
                        var t = this;
                        rK(t.yAxis, function(t) {
                            t.stacks && t.hasVisibleSeries && (t.oldStacks = t.stacks)
                        }), rK(t.series, function(e) {
                            e.options.stacking && (!0 === e.visible || !1 === t.options.chart.ignoreHiddenSeries) && (e.stackKey = e.type + rZ(e.options.stack, ""))
                        })
                    }, rX.prototype.buildStacks = function() {
                        var t, e = this.series,
                            i = rZ(this.options.reversedStacks, !0),
                            r = e.length;
                        if (!this.isXAxis) {
                            for (this.usePercentage = !1, t = r; t--;) e[i ? t : r - t - 1].setStackedPoints();
                            if (this.usePercentage)
                                for (t = 0; t < r; t++) e[t].setPercentStacks()
                        }
                    }, rX.prototype.renderStackTotals = function() {
                        var t = this.chart,
                            e = t.renderer,
                            i = this.stacks,
                            r = this.stackTotalGroup;
                        r || (this.stackTotalGroup = r = e.g("stack-labels").attr({
                            visibility: "visible",
                            zIndex: 6
                        }).add()), r.translate(t.plotLeft, t.plotTop), r$(i, function(t) {
                            r$(t, function(t) {
                                t.render(r)
                            })
                        })
                    }, rX.prototype.resetStacks = function() {
                        var t = this,
                            e = t.stacks;
                        t.isXAxis || r$(e, function(e) {
                            r$(e, function(i, r) {
                                i.touched < t.stacksTouched ? (i.destroy(), delete e[r]) : (i.total = null, i.cum = null)
                            })
                        })
                    }, rX.prototype.cleanStacks = function() {
                        var t;
                        this.isXAxis || (this.oldStacks && (t = this.stacks = this.oldStacks), r$(t, function(t) {
                            r$(t, function(t) {
                                t.cum = t.total
                            })
                        }))
                    }, rJ.prototype.setStackedPoints = function() {
                        if (this.options.stacking && (!0 === this.visible || !1 === this.chart.options.chart.ignoreHiddenSeries)) {
                            var t, e, i, r, n, o, s, a = this.processedXData,
                                l = this.processedYData,
                                h = [],
                                c = l.length,
                                d = this.options,
                                u = d.threshold,
                                p = d.startFromThreshold ? u : 0,
                                f = d.stack,
                                d = d.stacking,
                                g = this.stackKey,
                                m = "-" + g,
                                v = this.negStacks,
                                y = this.yAxis,
                                b = y.stacks,
                                x = y.oldStacks;
                            for (y.stacksTouched += 1, n = 0; n < c; n++) o = a[n], s = l[n], r = (t = this.getStackIndicator(t, o, this.index)).key, b[i = (e = v && s < (p ? 0 : u)) ? m : g] || (b[i] = {}), b[i][o] || (x[i] && x[i][o] ? (b[i][o] = x[i][o], b[i][o].total = null) : b[i][o] = new rF.StackItem(y, y.options.stackLabels, e, o, f)), i = b[i][o], null !== s && (i.points[r] = i.points[this.index] = [rZ(i.cum, p)], rU(i.cum) || (i.base = r), i.touched = y.stacksTouched, 0 < t.index && !1 === this.singleStacks && (i.points[r][0] = i.points[this.index + "," + o + ",0"][0])), "percent" === d ? (e = e ? g : m, v && b[e] && b[e][o] ? (e = b[e][o], i.total = e.total = Math.max(e.total, i.total) + Math.abs(s) || 0) : i.total = rV(i.total + (Math.abs(s) || 0))) : i.total = rV(i.total + (s || 0)), i.cum = rZ(i.cum, p) + (s || 0), null !== s && (i.points[r].push(i.cum), h[n] = i.cum);
                            "percent" === d && (y.usePercentage = !0), this.stackedYData = h, y.oldStacks = {}
                        }
                    }, rJ.prototype.setPercentStacks = function() {
                        var t, e = this,
                            i = e.stackKey,
                            r = e.yAxis.stacks,
                            n = e.processedXData;
                        rK([i, "-" + i], function(i) {
                            for (var o, s, a = n.length; a--;) o = n[a], t = e.getStackIndicator(t, o, e.index, i), (o = (s = r[i] && r[i][o]) && s.points[t.key]) && (s = s.total ? 100 / s.total : 0, o[0] = rV(o[0] * s), o[1] = rV(o[1] * s), e.stackedYData[a] = o[1])
                        })
                    }, rJ.prototype.getStackIndicator = function(t, e, i, r) {
                        return !rU(t) || t.x !== e || r && t.key !== r ? t = {
                            x: e,
                            index: 0,
                            key: r
                        } : t.index++, t.key = [i, e, t.index].join(), t
                    }, r0 = (rQ = t).addEvent, r1 = rQ.animate, r2 = rQ.Axis, r3 = rQ.createElement, r5 = rQ.css, r6 = rQ.defined, r9 = rQ.each, r8 = rQ.erase, r4 = rQ.extend, r7 = rQ.fireEvent, nt = rQ.inArray, ne = rQ.isNumber, ni = rQ.isObject, nr = rQ.isArray, nn = rQ.merge, no = rQ.objectEach, ns = rQ.pick, na = rQ.Point, nl = rQ.Series, nh = rQ.seriesTypes, nc = rQ.setAnimation, nd = rQ.splat, r4(rQ.Chart.prototype, {
                        addSeries: function(t, e, i) {
                            var r, n = this;
                            return t && (e = ns(e, !0), r7(n, "addSeries", {
                                options: t
                            }, function() {
                                r = n.initSeries(t), n.isDirtyLegend = !0, n.linkSeries(), e && n.redraw(i)
                            })), r
                        },
                        addAxis: function(t, e, i, r) {
                            var n = e ? "xAxis" : "yAxis",
                                o = this.options;
                            return e = new r2(this, t = nn(t, {
                                index: this[n].length,
                                isX: e
                            })), o[n] = nd(o[n] || {}), o[n].push(t), ns(i, !0) && this.redraw(r), e
                        },
                        showLoading: function(t) {
                            var e = this,
                                i = e.options,
                                r = e.loadingDiv,
                                n = i.loading,
                                o = function() {
                                    r && r5(r, {
                                        left: e.plotLeft + "px",
                                        top: e.plotTop + "px",
                                        width: e.plotWidth + "px",
                                        height: e.plotHeight + "px"
                                    })
                                };
                            r || (e.loadingDiv = r = r3("div", {
                                className: "highcharts-loading highcharts-loading-hidden"
                            }, null, e.container), e.loadingSpan = r3("span", {
                                className: "highcharts-loading-inner"
                            }, null, r), r0(e, "redraw", o)), r.className = "highcharts-loading", e.loadingSpan.innerHTML = t || i.lang.loading, r5(r, r4(n.style, {
                                zIndex: 10
                            })), r5(e.loadingSpan, n.labelStyle), e.loadingShown || (r5(r, {
                                opacity: 0,
                                display: ""
                            }), r1(r, {
                                opacity: n.style.opacity || .5
                            }, {
                                duration: n.showDuration || 0
                            })), e.loadingShown = !0, o()
                        },
                        hideLoading: function() {
                            var t = this.options,
                                e = this.loadingDiv;
                            e && (e.className = "highcharts-loading highcharts-loading-hidden", r1(e, {
                                opacity: 0
                            }, {
                                duration: t.loading.hideDuration || 100,
                                complete: function() {
                                    r5(e, {
                                        display: "none"
                                    })
                                }
                            })), this.loadingShown = !1
                        },
                        propsRequireDirtyBox: "backgroundColor borderColor borderWidth margin marginTop marginRight marginBottom marginLeft spacing spacingTop spacingRight spacingBottom spacingLeft borderRadius plotBackgroundColor plotBackgroundImage plotBorderColor plotBorderWidth plotShadow shadow".split(" "),
                        propsRequireUpdateSeries: "chart.inverted chart.polar chart.ignoreHiddenSeries chart.type colors plotOptions tooltip".split(" "),
                        update: function(t, e, i) {
                            var r, n, o = this,
                                s = {
                                    credits: "addCredits",
                                    title: "setTitle",
                                    subtitle: "setSubtitle"
                                },
                                a = t.chart,
                                l = [];
                            a && (nn(!0, o.options.chart, a), "className" in a && o.setClassName(a.className), ("inverted" in a || "polar" in a) && (o.propFromSeries(), r = !0), "alignTicks" in a && (r = !0), no(a, function(t, e) {
                                -1 !== nt("chart." + e, o.propsRequireUpdateSeries) && (n = !0), -1 !== nt(e, o.propsRequireDirtyBox) && (o.isDirtyBox = !0)
                            }), "style" in a && o.renderer.setStyle(a.style)), t.colors && (this.options.colors = t.colors), t.plotOptions && nn(!0, this.options.plotOptions, t.plotOptions), no(t, function(t, e) {
                                o[e] && "function" == typeof o[e].update ? o[e].update(t, !1) : "function" == typeof o[s[e]] && o[s[e]](t), "chart" !== e && -1 !== nt(e, o.propsRequireUpdateSeries) && (n = !0)
                            }), r9("xAxis yAxis zAxis series colorAxis pane".split(" "), function(e) {
                                t[e] && (r9(nd(t[e]), function(t, r) {
                                    (r = r6(t.id) && o.get(t.id) || o[e][r]) && r.coll === e && (r.update(t, !1), i && (r.touched = !0)), !r && i && ("series" === e ? o.addSeries(t, !1).touched = !0 : ("xAxis" === e || "yAxis" === e) && (o.addAxis(t, "xAxis" === e, !1).touched = !0))
                                }), i && r9(o[e], function(t) {
                                    t.touched ? delete t.touched : l.push(t)
                                }))
                            }), r9(l, function(t) {
                                t.remove(!1)
                            }), r && r9(o.axes, function(t) {
                                t.update({}, !1)
                            }), n && r9(o.series, function(t) {
                                t.update({}, !1)
                            }), t.loading && nn(!0, o.options.loading, t.loading), r = a && a.width, a = a && a.height, ne(r) && r !== o.chartWidth || ne(a) && a !== o.chartHeight ? o.setSize(r, a) : ns(e, !0) && o.redraw()
                        },
                        setSubtitle: function(t) {
                            this.setTitle(void 0, t)
                        }
                    }), r4(na.prototype, {
                        update: function(t, e, i, r) {
                            function n() {
                                s.applyOptions(t), null === s.y && l && (s.graphic = l.destroy()), ni(t, !0) && (l && l.element && t && t.marker && void 0 !== t.marker.symbol && (s.graphic = l.destroy()), t && t.dataLabels && s.dataLabel && (s.dataLabel = s.dataLabel.destroy())), o = s.index, a.updateParallelArrays(s, o), c.data[o] = ni(c.data[o], !0) || ni(t, !0) ? s.options : t, a.isDirty = a.isDirtyData = !0, !a.fixedBox && a.hasCartesianSeries && (h.isDirtyBox = !0), "point" === c.legendType && (h.isDirtyLegend = !0), e && h.redraw(i)
                            }
                            var o, s = this,
                                a = s.series,
                                l = s.graphic,
                                h = a.chart,
                                c = a.options;
                            e = ns(e, !0), !1 === r ? n() : s.firePointEvent("update", {
                                options: t
                            }, n)
                        },
                        remove: function(t, e) {
                            this.series.removePoint(nt(this, this.series.data), t, e)
                        }
                    }), r4(nl.prototype, {
                        addPoint: function(t, e, i, r) {
                            var n, o, s, a, l = this.options,
                                h = this.data,
                                c = this.chart,
                                d = this.xAxis,
                                d = d && d.hasNames && d.names,
                                u = l.data,
                                p = this.xData;
                            if (e = ns(e, !0), n = {
                                    series: this
                                }, this.pointClass.prototype.applyOptions.apply(n, [t]), a = n.x, s = p.length, this.requireSorting && a < p[s - 1])
                                for (o = !0; s && p[s - 1] > a;) s--;
                            this.updateParallelArrays(n, "splice", s, 0, 0), this.updateParallelArrays(n, s), d && n.name && (d[a] = n.name), u.splice(s, 0, t), o && (this.data.splice(s, 0, null), this.processData()), "point" === l.legendType && this.generatePoints(), i && (h[0] && h[0].remove ? h[0].remove(!1) : (h.shift(), this.updateParallelArrays(n, "shift"), u.shift())), this.isDirtyData = this.isDirty = !0, e && c.redraw(r)
                        },
                        removePoint: function(t, e, i) {
                            var r = this,
                                n = r.data,
                                o = n[t],
                                s = r.points,
                                a = r.chart,
                                l = function() {
                                    s && s.length === n.length && s.splice(t, 1), n.splice(t, 1), r.options.data.splice(t, 1), r.updateParallelArrays(o || {
                                        series: r
                                    }, "splice", t, 1), o && o.destroy(), r.isDirty = !0, r.isDirtyData = !0, e && a.redraw()
                                };
                            nc(i, a), e = ns(e, !0), o ? o.firePointEvent("remove", null, l) : l()
                        },
                        remove: function(t, e, i) {
                            function r() {
                                n.destroy(), o.isDirtyLegend = o.isDirtyBox = !0, o.linkSeries(), ns(t, !0) && o.redraw(e)
                            }
                            var n = this,
                                o = n.chart;
                            !1 !== i ? r7(n, "remove", null, r) : r()
                        },
                        update: function(t, e) {
                            var i, r = this,
                                n = r.chart,
                                o = r.userOptions,
                                s = r.oldType || r.type,
                                a = t.type || o.type || n.options.chart.type,
                                l = nh[s].prototype,
                                h = ["group", "markerGroup", "dataLabelsGroup", "navigatorSeries", "baseSeries"],
                                c = r.finishedAnimating && {
                                    animation: !1
                                };
                            if (Object.keys && "data" === Object.keys(t).toString()) return this.setData(t.data, e);
                            for (i in (a && a !== s || void 0 !== t.zIndex) && (h.length = 0), r9(h, function(t) {
                                    h[t] = r[t], delete r[t]
                                }), t = nn(o, c, {
                                    index: r.index,
                                    pointStart: r.xData[0]
                                }, {
                                    data: r.options.data
                                }, t), r.remove(!1, null, !1), l) r[i] = void 0;
                            r4(r, nh[a || s].prototype), r9(h, function(t) {
                                r[t] = h[t]
                            }), r.init(n, t), r.oldType = s, n.linkSeries(), ns(e, !0) && n.redraw(!1)
                        }
                    }), r4(r2.prototype, {
                        update: function(t, e) {
                            var i = this.chart;
                            t = i.options[this.coll][this.options.index] = nn(this.userOptions, t), this.destroy(!0), this.init(i, r4(t, {
                                events: void 0
                            })), i.isDirtyBox = !0, ns(e, !0) && i.redraw()
                        },
                        remove: function(t) {
                            for (var e = this.chart, i = this.coll, r = this.series, n = r.length; n--;) r[n] && r[n].remove(!1);
                            r8(e.axes, this), r8(e[i], this), nr(e.options[i]) ? e.options[i].splice(this.options.index, 1) : delete e.options[i], r9(e[i], function(t, e) {
                                t.options.index = e
                            }), this.destroy(), e.isDirtyBox = !0, ns(t, !0) && e.redraw()
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
                    }), np = (nu = t).color, nf = nu.each, ng = nu.map, nm = nu.pick, nv = nu.Series, (0, nu.seriesType)("area", "line", {
                        softThreshold: !1,
                        threshold: 0
                    }, {
                        singleStacks: !1,
                        getStackPoints: function(t) {
                            var e, i, r = [],
                                n = [],
                                o = this.xAxis,
                                s = this.yAxis,
                                a = s.stacks[this.stackKey],
                                l = {},
                                h = this.index,
                                c = s.series,
                                d = c.length,
                                u = nm(s.options.reversedStacks, !0) ? 1 : -1;
                            if (t = t || this.points, this.options.stacking) {
                                for (i = 0; i < t.length; i++) l[t[i].x] = t[i];
                                nu.objectEach(a, function(t, e) {
                                    null !== t.total && n.push(e)
                                }), n.sort(function(t, e) {
                                    return t - e
                                }), e = ng(c, function() {
                                    return this.visible
                                }), nf(n, function(t, c) {
                                    var p, f, g = 0;
                                    if (l[t] && !l[t].isNull) r.push(l[t]), nf([-1, 1], function(r) {
                                        var o = 1 === r ? "rightNull" : "leftNull",
                                            s = 0,
                                            g = a[n[c + r]];
                                        if (g)
                                            for (i = h; 0 <= i && i < d;)(p = g.points[i]) || (i === h ? l[t][o] = !0 : e[i] && (f = a[t].points[i]) && (s -= f[1] - f[0])), i += u;
                                        l[t][1 === r ? "rightCliff" : "leftCliff"] = s
                                    });
                                    else {
                                        for (i = h; 0 <= i && i < d;) {
                                            if (p = a[t].points[i]) {
                                                g = p[1];
                                                break
                                            }
                                            i += u
                                        }
                                        g = s.translate(g, 0, 1, 0, 1), r.push({
                                            isNull: !0,
                                            plotX: o.translate(t, 0, 0, 0, 1),
                                            x: t,
                                            plotY: g,
                                            yBottom: g
                                        })
                                    }
                                })
                            }
                            return r
                        },
                        getGraphPath: function(t) {
                            var e, i, r, n, o = nv.prototype.getGraphPath,
                                s = this.options,
                                a = s.stacking,
                                l = this.yAxis,
                                h = [],
                                c = [],
                                d = this.index,
                                u = l.stacks[this.stackKey],
                                p = s.threshold,
                                f = l.getThreshold(s.threshold),
                                s = s.connectNulls || "percent" === a,
                                g = function(e, i, n) {
                                    var o = t[e];
                                    e = a && u[o.x].points[d];
                                    var s = o[n + "Null"] || 0;
                                    n = o[n + "Cliff"] || 0;
                                    var g, m, o = !0;
                                    n || s ? (g = (s ? e[0] : e[1]) + n, m = e[0] + n, o = !!s) : !a && t[i] && t[i].isNull && (g = m = p), void 0 !== g && (c.push({
                                        plotX: r,
                                        plotY: null === g ? f : l.getThreshold(g),
                                        isNull: o,
                                        isCliff: !0
                                    }), h.push({
                                        plotX: r,
                                        plotY: null === m ? f : l.getThreshold(m),
                                        doCurve: !1
                                    }))
                                };
                            for (t = t || this.points, a && (t = this.getStackPoints(t)), e = 0; e < t.length; e++) i = t[e].isNull, r = nm(t[e].rectPlotX, t[e].plotX), n = nm(t[e].yBottom, f), (!i || s) && (s || g(e, e - 1, "left"), i && !a && s || (c.push(t[e]), h.push({
                                x: e,
                                plotX: r,
                                plotY: n
                            })), s || g(e, e + 1, "right"));
                            return e = o.call(this, c, !0, !0), h.reversed = !0, (i = o.call(this, h, !0, !0)).length && (i[0] = "L"), i = e.concat(i), o = o.call(this, c, !1, s), i.xMap = e.xMap, this.areaPath = i, o
                        },
                        drawGraph: function() {
                            this.areaPath = [], nv.prototype.drawGraph.apply(this);
                            var t = this,
                                e = this.areaPath,
                                i = this.options,
                                r = [
                                    ["area", "highcharts-area", this.color, i.fillColor]
                                ];
                            nf(this.zones, function(e, n) {
                                r.push(["zone-area-" + n, "highcharts-area highcharts-zone-area-" + n + " " + e.className, e.color || t.color, e.fillColor || i.fillColor])
                            }), nf(r, function(r) {
                                var n = r[0],
                                    o = t[n];
                                o ? (o.endX = e.xMap, o.animate({
                                    d: e
                                })) : (o = t[n] = t.chart.renderer.path(e).addClass(r[1]).attr({
                                    fill: nm(r[3], np(r[2]).setOpacity(nm(i.fillOpacity, .75)).get()),
                                    zIndex: 0
                                }).add(t.group)).isArea = !0, o.startX = e.xMap, o.shiftUnit = i.step ? 2 : 1
                            })
                        },
                        drawLegendSymbol: nu.LegendSymbolMixin.drawRectangle
                    }), nb = (ny = t).pick, (ny = ny.seriesType)("spline", "line", {}, {
                        getPointSpline: function(t, e, i) {
                            var r, n, o, s, a = e.plotX,
                                l = e.plotY,
                                h = t[i - 1];
                            if (i = t[i + 1], h && !h.isNull && !1 !== h.doCurve && !e.isCliff && i && !i.isNull && !1 !== i.doCurve && !e.isCliff) {
                                t = h.plotY, o = i.plotX, i = i.plotY;
                                var c = 0;
                                r = (1.5 * a + h.plotX) / 2.5, n = (1.5 * l + t) / 2.5, o = (1.5 * a + o) / 2.5, s = (1.5 * l + i) / 2.5, o !== r && (c = (s - n) * (o - a) / (o - r) + l - s), n += c, s += c, n > t && n > l ? (n = Math.max(t, l), s = 2 * l - n) : n < t && n < l && (n = Math.min(t, l), s = 2 * l - n), s > i && s > l ? (s = Math.max(i, l), n = 2 * l - s) : s < i && s < l && (s = Math.min(i, l), n = 2 * l - s), e.rightContX = o, e.rightContY = s
                            }
                            return e = ["C", nb(h.rightContX, h.plotX), nb(h.rightContY, h.plotY), nb(r, a), nb(n, l), a, l], h.rightContX = h.rightContY = null, e
                        }
                    }), nw = (nx = t).seriesTypes.area.prototype, (0, nx.seriesType)("areaspline", "spline", nx.defaultPlotOptions.area, {
                        getStackPoints: nw.getStackPoints,
                        getGraphPath: nw.getGraphPath,
                        drawGraph: nw.drawGraph,
                        drawLegendSymbol: nx.LegendSymbolMixin.drawRectangle
                    }), nS = (nk = t).animObject, nM = nk.color, nC = nk.each, nA = nk.extend, nT = nk.isNumber, nP = nk.merge, nO = nk.pick, nI = nk.Series, nL = nk.seriesType, nD = nk.svg, nL("column", "line", {
                        borderRadius: 0,
                        crisp: !0,
                        groupPadding: .2,
                        marker: null,
                        pointPadding: .1,
                        minPointLength: 0,
                        cropThreshold: 50,
                        pointRange: null,
                        states: {
                            hover: {
                                halo: !1,
                                brightness: .1,
                                shadow: !1
                            },
                            select: {
                                color: "#cccccc",
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
                        threshold: 0,
                        borderColor: "#ffffff"
                    }, {
                        cropShoulder: 0,
                        directTouch: !0,
                        trackerGroups: ["group", "dataLabelsGroup"],
                        negStacks: !0,
                        init: function() {
                            nI.prototype.init.apply(this, arguments);
                            var t = this,
                                e = t.chart;
                            e.hasRendered && nC(e.series, function(e) {
                                e.type === t.type && (e.isDirty = !0)
                            })
                        },
                        getColumnMetrics: function() {
                            var t, e = this,
                                i = e.options,
                                r = e.xAxis,
                                n = e.yAxis,
                                o = r.reversed,
                                s = {},
                                a = 0;
                            !1 === i.grouping ? a = 1 : nC(e.chart.series, function(i) {
                                var r, o = i.options,
                                    l = i.yAxis;
                                i.type !== e.type || !i.visible && e.chart.options.chart.ignoreHiddenSeries || n.len !== l.len || n.pos !== l.pos || (o.stacking ? (void 0 === s[t = i.stackKey] && (s[t] = a++), r = s[t]) : !1 !== o.grouping && (r = a++), i.columnIndex = r)
                            });
                            var l = Math.min(Math.abs(r.transA) * (r.ordinalSlope || i.pointRange || r.closestPointRange || r.tickInterval || 1), r.len),
                                h = l * i.groupPadding,
                                c = (l - 2 * h) / (a || 1),
                                i = Math.min(i.maxPointWidth || r.len, nO(i.pointWidth, c * (1 - 2 * i.pointPadding)));
                            return e.columnMetrics = {
                                width: i,
                                offset: (c - i) / 2 + (h + ((e.columnIndex || 0) + +!!o) * c - l / 2) * (o ? -1 : 1)
                            }, e.columnMetrics
                        },
                        crispCol: function(t, e, i, r) {
                            var n = this.chart,
                                o = this.borderWidth,
                                s = -(o % 2 ? .5 : 0),
                                o = o % 2 ? .5 : 1;
                            return n.inverted && n.renderer.isVML && (o += 1), this.options.crisp && (i = Math.round(t + i) + s - (t = Math.round(t) + s)), r = Math.round(e + r) + o, s = .5 >= Math.abs(e) && .5 < r, r -= e = Math.round(e) + o, s && r && (--e, r += 1), {
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
                                r = t.dense = 2 > t.closestPointRange * t.xAxis.transA,
                                r = t.borderWidth = nO(i.borderWidth, +!r),
                                n = t.yAxis,
                                o = t.translatedThreshold = n.getThreshold(i.threshold),
                                s = nO(i.minPointLength, 5),
                                a = t.getColumnMetrics(),
                                l = a.width,
                                h = t.barW = Math.max(l, 1 + 2 * r),
                                c = t.pointXOffset = a.offset;
                            e.inverted && (o -= .5), i.pointPadding && (h = Math.ceil(h)), nI.prototype.translate.apply(t), nC(t.points, function(i) {
                                var r, a = nO(i.yBottom, o),
                                    d = 999 + Math.abs(a),
                                    d = Math.min(Math.max(-d, i.plotY), n.len + d),
                                    u = i.plotX + c,
                                    p = h,
                                    f = Math.min(d, a),
                                    g = Math.max(d, a) - f;
                                Math.abs(g) < s && s && (g = s, r = !n.reversed && !i.negative || n.reversed && i.negative, f = Math.abs(f - o) > s ? a - s : o - (r ? s : 0)), i.barX = u, i.pointWidth = l, i.tooltipPos = e.inverted ? [n.len + n.pos - e.plotLeft - d, t.xAxis.len - u - p / 2, g] : [u + p / 2, d + n.pos - e.plotTop, g], i.shapeType = "rect", i.shapeArgs = t.crispCol.apply(t, i.isNull ? [u, o, p, 0] : [u, f, p, g])
                            })
                        },
                        getSymbol: nk.noop,
                        drawLegendSymbol: nk.LegendSymbolMixin.drawRectangle,
                        drawGraph: function() {
                            this.group[this.dense ? "addClass" : "removeClass"]("highcharts-dense-data")
                        },
                        pointAttribs: function(t, e) {
                            var i, r = this.options,
                                n = this.pointAttrToOptions || {};
                            i = n.stroke || "borderColor";
                            var o = n["stroke-width"] || "borderWidth",
                                s = t && t.color || this.color,
                                a = t[i] || r[i] || this.color || s,
                                l = t[o] || r[o] || this[o] || 0,
                                n = r.dashStyle;
                            return t && this.zones.length && (s = t.getZone(), s = t.options.color || s && s.color || this.color), e && (e = (t = nP(r.states[e], t.options.states && t.options.states[e] || {})).brightness, s = t.color || void 0 !== e && nM(s).brighten(t.brightness).get() || s, a = t[i] || a, l = t[o] || l, n = t.dashStyle || n), i = {
                                fill: s,
                                stroke: a,
                                "stroke-width": l
                            }, n && (i.dashstyle = n), i
                        },
                        drawPoints: function() {
                            var t, e = this,
                                i = this.chart,
                                r = e.options,
                                n = i.renderer,
                                o = r.animationLimit || 250;
                            nC(e.points, function(s) {
                                var a = s.graphic;
                                nT(s.plotY) && null !== s.y ? (t = s.shapeArgs, a ? a[i.pointCount < o ? "animate" : "attr"](nP(t)) : s.graphic = a = n[s.shapeType](t).add(s.group || e.group), r.borderRadius && a.attr({
                                    r: r.borderRadius
                                }), a.attr(e.pointAttribs(s, s.selected && "select")).shadow(r.shadow, null, r.stacking && !r.borderRadius), a.addClass(s.getClassName(), !0)) : a && (s.graphic = a.destroy())
                            })
                        },
                        animate: function(t) {
                            var e = this,
                                i = this.yAxis,
                                r = e.options,
                                n = this.chart.inverted,
                                o = {};
                            nD && (t ? (o.scaleY = .001, t = Math.min(i.pos + i.len, Math.max(i.pos, i.toPixels(r.threshold))), n ? o.translateX = t - i.len : o.translateY = t, e.group.attr(o)) : (o[n ? "translateX" : "translateY"] = i.pos, e.group.animate(o, nA(nS(e.options.animation), {
                                step: function(t, i) {
                                    e.group.attr({
                                        scaleY: Math.max(.001, i.pos)
                                    })
                                }
                            })), e.animate = null))
                        },
                        remove: function() {
                            var t = this,
                                e = t.chart;
                            e.hasRendered && nC(e.series, function(e) {
                                e.type === t.type && (e.isDirty = !0)
                            }), nI.prototype.remove.apply(t, arguments)
                        }
                    }), (0, t.seriesType)("bar", "column", null, {
                        inverted: !0
                    }), nj = (nE = t).Series, (nE = nE.seriesType)("scatter", "line", {
                        lineWidth: 0,
                        findNearestPointBy: "xy",
                        marker: {
                            enabled: !0
                        },
                        tooltip: {
                            headerFormat: '<span style="color:{point.color}">●</span> <span style="font-size: 0.85em"> {series.name}</span><br/>',
                            pointFormat: "x: <b>{point.x}</b><br/>y: <b>{point.y}</b><br/>"
                        }
                    }, {
                        sorted: !1,
                        requireSorting: !1,
                        noSharedTooltip: !0,
                        trackerGroups: ["group", "markerGroup", "dataLabelsGroup"],
                        takeOrdinalPosition: !1,
                        drawGraph: function() {
                            this.options.lineWidth && nj.prototype.drawGraph.call(this)
                        }
                    }), nR = (nN = t).pick, nB = nN.relativeLength, nN.CenteredSeriesMixin = {
                        getCenter: function() {
                            var t, e, i = this.options,
                                r = this.chart,
                                n = 2 * (i.slicedOffset || 0),
                                o = r.plotWidth - 2 * n,
                                r = r.plotHeight - 2 * n,
                                s = i.center,
                                s = [nR(s[0], "50%"), nR(s[1], "50%"), i.size || "100%", i.innerSize || 0],
                                a = Math.min(o, r);
                            for (t = 0; 4 > t; ++t) e = s[t], i = 2 > t || 2 === t && /%$/.test(e), s[t] = nB(e, [o, r, a, s[2]][t]) + (i ? n : 0);
                            return s[3] > s[2] && (s[3] = s[2]), s
                        }
                    }, nG = (nz = t).addEvent, nW = nz.defined, nH = nz.each, nF = nz.extend, nX = nz.inArray, nY = nz.noop, nV = nz.pick, nU = nz.Point, n_ = nz.Series, nK = nz.seriesType, nq = nz.setAnimation, nK("pie", "line", {
                        center: [null, null],
                        clip: !1,
                        colorByPoint: !0,
                        dataLabels: {
                            distance: 30,
                            enabled: !0,
                            formatter: function() {
                                return this.point.isNull ? void 0 : this.point.name
                            },
                            x: 0
                        },
                        ignoreHiddenPoint: !0,
                        legendType: "point",
                        marker: null,
                        size: null,
                        showInLegend: !1,
                        slicedOffset: 10,
                        stickyTracking: !1,
                        tooltip: {
                            followPointer: !0
                        },
                        borderColor: "#ffffff",
                        borderWidth: 1,
                        states: {
                            hover: {
                                brightness: .1,
                                shadow: !1
                            }
                        }
                    }, {
                        isCartesian: !1,
                        requireSorting: !1,
                        directTouch: !0,
                        noSharedTooltip: !0,
                        trackerGroups: ["group", "dataLabelsGroup"],
                        axisTypes: [],
                        pointAttribs: nz.seriesTypes.column.prototype.pointAttribs,
                        animate: function(t) {
                            var e = this,
                                i = e.points,
                                r = e.startAngleRad;
                            t || (nH(i, function(t) {
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
                            }), e.animate = null)
                        },
                        updateTotals: function() {
                            var t, e, i = 0,
                                r = this.points,
                                n = r.length,
                                o = this.options.ignoreHiddenPoint;
                            for (t = 0; t < n; t++) e = r[t], i += o && !e.visible || e.isNull ? 0 : e.y;
                            for (t = 0, this.total = i; t < n; t++)(e = r[t]).percentage = 0 < i && (e.visible || !o) ? e.y / i * 100 : 0, e.total = i
                        },
                        generatePoints: function() {
                            n_.prototype.generatePoints.call(this), this.updateTotals()
                        },
                        translate: function(t) {
                            this.generatePoints();
                            var e, i, r, n, o, s, a = 0,
                                l = this.options,
                                h = l.slicedOffset,
                                c = h + (l.borderWidth || 0),
                                d = l.startAngle || 0,
                                u = this.startAngleRad = Math.PI / 180 * (d - 90),
                                d = (this.endAngleRad = Math.PI / 180 * (nV(l.endAngle, d + 360) - 90)) - u,
                                p = this.points,
                                f = l.dataLabels.distance,
                                l = l.ignoreHiddenPoint,
                                g = p.length;
                            for (t || (this.center = t = this.getCenter()), this.getX = function(e, i, n) {
                                    return r = Math.asin(Math.min((e - t[1]) / (t[2] / 2 + n.labelDistance), 1)), t[0] + (i ? -1 : 1) * Math.cos(r) * (t[2] / 2 + n.labelDistance)
                                }, o = 0; o < g; o++)(s = p[o]).labelDistance = nV(s.options.dataLabels && s.options.dataLabels.distance, f), this.maxLabelDistance = Math.max(this.maxLabelDistance || 0, s.labelDistance), e = u + a * d, (!l || s.visible) && (a += s.percentage / 100), i = u + a * d, s.shapeType = "arc", s.shapeArgs = {
                                x: t[0],
                                y: t[1],
                                r: t[2] / 2,
                                innerR: t[3] / 2,
                                start: Math.round(1e3 * e) / 1e3,
                                end: Math.round(1e3 * i) / 1e3
                            }, (r = (i + e) / 2) > 1.5 * Math.PI ? r -= 2 * Math.PI : r < -Math.PI / 2 && (r += 2 * Math.PI), s.slicedTranslation = {
                                translateX: Math.round(Math.cos(r) * h),
                                translateY: Math.round(Math.sin(r) * h)
                            }, i = Math.cos(r) * t[2] / 2, n = Math.sin(r) * t[2] / 2, s.tooltipPos = [t[0] + .7 * i, t[1] + .7 * n], s.half = +(r < -Math.PI / 2 || r > Math.PI / 2), s.angle = r, e = Math.min(c, s.labelDistance / 5), s.labelPos = [t[0] + i + Math.cos(r) * s.labelDistance, t[1] + n + Math.sin(r) * s.labelDistance, t[0] + i + Math.cos(r) * e, t[1] + n + Math.sin(r) * e, t[0] + i, t[1] + n, 0 > s.labelDistance ? "center" : s.half ? "right" : "left", r]
                        },
                        drawGraph: null,
                        drawPoints: function() {
                            var t, e, i, r, n = this,
                                o = n.chart.renderer,
                                s = n.options.shadow;
                            s && !n.shadowGroup && (n.shadowGroup = o.g("shadow").add(n.group)), nH(n.points, function(a) {
                                if (!a.isNull) {
                                    e = a.graphic, r = a.shapeArgs, t = a.getTranslate();
                                    var l = a.shadowGroup;
                                    s && !l && (l = a.shadowGroup = o.g("shadow").add(n.shadowGroup)), l && l.attr(t), i = n.pointAttribs(a, a.selected && "select"), e ? e.setRadialReference(n.center).attr(i).animate(nF(r, t)) : (a.graphic = e = o[a.shapeType](r).setRadialReference(n.center).attr(t).add(n.group), a.visible || e.attr({
                                        visibility: "hidden"
                                    }), e.attr(i).attr({
                                        "stroke-linejoin": "round"
                                    }).shadow(s, l)), e.addClass(a.getClassName())
                                }
                            })
                        },
                        searchPoint: nY,
                        sortByAngle: function(t, e) {
                            t.sort(function(t, i) {
                                return void 0 !== t.angle && (i.angle - t.angle) * e
                            })
                        },
                        drawLegendSymbol: nz.LegendSymbolMixin.drawRectangle,
                        getCenter: nz.CenteredSeriesMixin.getCenter,
                        getSymbol: nY
                    }, {
                        init: function() {
                            nU.prototype.init.apply(this, arguments);
                            var t, e = this;
                            return e.name = nV(e.name, "Slice"), t = function(t) {
                                e.slice("select" === t.type)
                            }, nG(e, "select", t), nG(e, "unselect", t), e
                        },
                        isValid: function() {
                            return nz.isNumber(this.y, !0) && 0 <= this.y
                        },
                        setVisible: function(t, e) {
                            var i = this,
                                r = i.series,
                                n = r.chart,
                                o = r.options.ignoreHiddenPoint;
                            e = nV(e, o), t !== i.visible && (i.visible = i.options.visible = t = void 0 === t ? !i.visible : t, r.options.data[nX(i, r.data)] = i.options, nH(["graphic", "dataLabel", "connector", "shadowGroup"], function(e) {
                                i[e] && i[e][t ? "show" : "hide"](!0)
                            }), i.legendItem && n.legend.colorizeItem(i, t), t || "hover" !== i.state || i.setState(""), o && (r.isDirty = !0), e && n.redraw())
                        },
                        slice: function(t, e, i) {
                            var r = this.series;
                            nq(i, r.chart), nV(e, !0), this.sliced = this.options.sliced = nW(t) ? t : !this.sliced, r.options.data[nX(this, r.data)] = this.options, this.graphic.animate(this.getTranslate()), this.shadowGroup && this.shadowGroup.animate(this.getTranslate())
                        },
                        getTranslate: function() {
                            return this.sliced ? this.slicedTranslation : {
                                translateX: 0,
                                translateY: 0
                            }
                        },
                        haloPath: function(t) {
                            var e = this.shapeArgs;
                            return this.sliced || !this.visible ? [] : this.series.chart.renderer.symbols.arc(e.x, e.y, e.r + t, e.r + t, {
                                innerR: this.shapeArgs.r,
                                start: e.start,
                                end: e.end
                            })
                        }
                    }), nZ = (n$ = t).addEvent, nJ = n$.arrayMax, nQ = n$.defined, n0 = n$.each, n1 = n$.extend, n2 = n$.format, n3 = n$.map, n5 = n$.merge, n6 = n$.noop, n9 = n$.pick, n8 = n$.relativeLength, n4 = n$.Series, n7 = n$.seriesTypes, ot = n$.stableSort, n$.distribute = function(t, e) {
                        function i(t, e) {
                            return t.target - e.target
                        }
                        var r, n, o = !0,
                            s = t,
                            a = [];
                        for (n = 0, r = t.length; r--;) n += t[r].size;
                        if (n > e) {
                            for (ot(t, function(t, e) {
                                    return (e.rank || 0) - (t.rank || 0)
                                }), n = r = 0; n <= e;) n += t[r].size, r++;
                            a = t.splice(r - 1, t.length)
                        }
                        for (ot(t, i), t = n3(t, function(t) {
                                return {
                                    size: t.size,
                                    targets: [t.target]
                                }
                            }); o;) {
                            for (r = t.length; r--;) o = t[r], n = (Math.min.apply(0, o.targets) + Math.max.apply(0, o.targets)) / 2, o.pos = Math.min(Math.max(0, n - o.size / 2), e - o.size);
                            for (r = t.length, o = !1; r--;) 0 < r && t[r - 1].pos + t[r - 1].size > t[r].pos && (t[r - 1].size += t[r].size, t[r - 1].targets = t[r - 1].targets.concat(t[r].targets), t[r - 1].pos + t[r - 1].size > e && (t[r - 1].pos = e - t[r - 1].size), t.splice(r, 1), o = !0)
                        }
                        r = 0, n0(t, function(t) {
                            var e = 0;
                            n0(t.targets, function() {
                                s[r].pos = t.pos + e, e += s[r].size, r++
                            })
                        }), s.push.apply(s, a), ot(s, i)
                    }, n4.prototype.drawDataLabels = function() {
                        var t, e, i, r, n = this,
                            o = n.options,
                            s = o.dataLabels,
                            a = n.points,
                            l = n.hasRendered || 0,
                            h = n9(s.defer, !!o.animation),
                            c = n.chart.renderer;
                        (s.enabled || n._hasPointLabels) && (n.dlProcessOptions && n.dlProcessOptions(s), r = n.plotGroup("dataLabelsGroup", "data-labels", h && !l ? "hidden" : "visible", s.zIndex || 6), h && (r.attr({
                            opacity: +l
                        }), l || nZ(n, "afterAnimate", function() {
                            n.visible && r.show(!0), r[o.animation ? "animate" : "attr"]({
                                opacity: 1
                            }, {
                                duration: 200
                            })
                        })), e = s, n0(a, function(a) {
                            var l, h, d, u, p = a.dataLabel,
                                f = a.connector,
                                g = !p;
                            (l = n9((t = a.dlOptions || a.options && a.options.dataLabels) && t.enabled, e.enabled) && null !== a.y) && (s = n5(e, t), h = a.getLabelConfig(), i = s.format ? n2(s.format, h) : s.formatter.call(h, s), u = s.style, h = s.rotation, u.color = n9(s.color, u.color, n.color, "#000000"), "contrast" === u.color && (a.contrastColor = c.getContrast(a.color || n.color), u.color = s.inside || 0 > n9(a.labelDistance, s.distance) || o.stacking ? a.contrastColor : "#000000"), o.cursor && (u.cursor = o.cursor), d = {
                                fill: s.backgroundColor,
                                stroke: s.borderColor,
                                "stroke-width": s.borderWidth,
                                r: s.borderRadius || 0,
                                rotation: h,
                                padding: s.padding,
                                zIndex: 1
                            }, n$.objectEach(d, function(t, e) {
                                void 0 === t && delete d[e]
                            })), !p || l && nQ(i) ? l && nQ(i) && (p ? d.text = i : (p = a.dataLabel = c[h ? "text" : "label"](i, 0, -9999, s.shape, null, null, s.useHTML, null, "data-label")).addClass("highcharts-data-label-color-" + a.colorIndex + " " + (s.className || "") + (s.useHTML ? "highcharts-tracker" : "")), p.attr(d), p.css(u).shadow(s.shadow), p.added || p.add(r), n.alignDataLabel(a, p, s, null, g)) : (a.dataLabel = p = p.destroy(), f && (a.connector = f.destroy()))
                        }))
                    }, n4.prototype.alignDataLabel = function(t, e, i, r, n) {
                        var o, s = this.chart,
                            a = s.inverted,
                            l = n9(t.plotX, -9999),
                            h = n9(t.plotY, -9999),
                            c = e.getBBox(),
                            d = i.rotation,
                            u = i.align,
                            p = this.visible && (t.series.forceDL || s.isInsidePlot(l, Math.round(h), a) || r && s.isInsidePlot(l, a ? r.x + 1 : r.y + r.height - 1, a)),
                            f = "justify" === n9(i.overflow, "justify");
                        p && (o = i.style.fontSize, o = s.renderer.fontMetrics(o, e).b, r = n1({
                            x: a ? this.yAxis.len - h : l,
                            y: Math.round(a ? this.xAxis.len - l : h),
                            width: 0,
                            height: 0
                        }, r), n1(i, {
                            width: c.width,
                            height: c.height
                        }), d ? (f = !1, l = s.renderer.rotCorr(o, d), l = {
                            x: r.x + i.x + r.width / 2 + l.x,
                            y: r.y + i.y + ({
                                top: 0,
                                middle: .5,
                                bottom: 1
                            })[i.verticalAlign] * r.height
                        }, e[n ? "attr" : "animate"](l).attr({
                            align: u
                        }), h = 180 < (h = (d + 720) % 360) && 360 > h, "left" === u ? l.y -= h ? c.height : 0 : "center" === u ? (l.x -= c.width / 2, l.y -= c.height / 2) : "right" === u && (l.x -= c.width, l.y -= h ? 0 : c.height)) : (e.align(i, null, r), l = e.alignAttr), f ? t.isLabelJustified = this.justifyDataLabel(e, i, l, c, r, n) : n9(i.crop, !0) && (p = s.isInsidePlot(l.x, l.y) && s.isInsidePlot(l.x + c.width, l.y + c.height)), i.shape && !d) && e[n ? "attr" : "animate"]({
                            anchorX: a ? s.plotWidth - t.plotY : t.plotX,
                            anchorY: a ? s.plotHeight - t.plotX : t.plotY
                        }), p || (e.attr({
                            y: -9999
                        }), e.placed = !1)
                    }, n4.prototype.justifyDataLabel = function(t, e, i, r, n, o) {
                        var s, a, l = this.chart,
                            h = e.align,
                            c = e.verticalAlign,
                            d = t.box ? 0 : t.padding || 0;
                        return 0 > (s = i.x + d) && ("right" === h ? e.align = "left" : e.x = -s, a = !0), (s = i.x + r.width - d) > l.plotWidth && ("left" === h ? e.align = "right" : e.x = l.plotWidth - s, a = !0), 0 > (s = i.y + d) && ("bottom" === c ? e.verticalAlign = "top" : e.y = -s, a = !0), (s = i.y + r.height - d) > l.plotHeight && ("top" === c ? e.verticalAlign = "bottom" : e.y = l.plotHeight - s, a = !0), a && (t.placed = !o, t.align(e, null, n)), a
                    }, n7.pie && (n7.pie.prototype.drawDataLabels = function() {
                        var t, e, i, r, n, o, s, a, l, h, c = this,
                            d = c.data,
                            u = c.chart,
                            p = c.options.dataLabels,
                            f = n9(p.connectorPadding, 10),
                            g = n9(p.connectorWidth, 1),
                            m = u.plotWidth,
                            v = u.plotHeight,
                            y = c.center,
                            b = y[2] / 2,
                            x = y[1],
                            w = [
                                [],
                                []
                            ],
                            k = [0, 0, 0, 0];
                        c.visible && (p.enabled || c._hasPointLabels) && (n0(d, function(t) {
                            t.dataLabel && t.visible && t.dataLabel.shortened && (t.dataLabel.attr({
                                width: "auto"
                            }).css({
                                width: "auto",
                                textOverflow: "clip"
                            }), t.dataLabel.shortened = !1)
                        }), n4.prototype.drawDataLabels.apply(c), n0(d, function(t) {
                            t.dataLabel && t.visible && (w[t.half].push(t), t.dataLabel._pos = null)
                        }), n0(w, function(e, d) {
                            var g, w, S, M = e.length,
                                C = [];
                            if (M)
                                for (c.sortByAngle(e, d - .5), 0 < c.maxLabelDistance && (g = Math.max(0, x - b - c.maxLabelDistance), w = Math.min(x + b + c.maxLabelDistance, u.plotHeight), n0(e, function(t) {
                                        0 < t.labelDistance && t.dataLabel && (t.top = Math.max(0, x - b - t.labelDistance), t.bottom = Math.min(x + b + t.labelDistance, u.plotHeight), S = t.dataLabel.getBBox().height || 21, t.positionsIndex = C.push({
                                            target: t.labelPos[1] - t.top + S / 2,
                                            size: S,
                                            rank: t.y
                                        }) - 1)
                                    }), n$.distribute(C, w + S - g)), h = 0; h < M; h++) w = (t = e[h]).positionsIndex, n = t.labelPos, i = t.dataLabel, l = !1 === t.visible ? "hidden" : "inherit", g = n[1], C && nQ(C[w]) ? void 0 === C[w].pos ? l = "hidden" : (o = C[w].size, a = t.top + C[w].pos) : a = g, delete t.positionIndex, s = p.justify ? y[0] + (d ? -1 : 1) * (b + t.labelDistance) : c.getX(a < t.top + 2 || a > t.bottom - 2 ? g : a, d, t), i._attr = {
                                    visibility: l,
                                    align: n[6]
                                }, i._pos = {
                                    x: s + p.x + (({
                                        left: f,
                                        right: -f
                                    })[n[6]] || 0),
                                    y: a + p.y - 10
                                }, n.x = s, n.y = a, n9(p.crop, !0) && (r = i.getBBox().width, g = null, s - r < f ? (g = Math.round(r - s + f), k[3] = Math.max(g, k[3])) : s + r > m - f && (g = Math.round(s + r - m + f), k[1] = Math.max(g, k[1])), 0 > a - o / 2 ? k[0] = Math.max(Math.round(-a + o / 2), k[0]) : a + o / 2 > v && (k[2] = Math.max(Math.round(a + o / 2 - v), k[2])), i.sideOverflow = g)
                        }), 0 === nJ(k) || this.verifyDataLabelOverflow(k)) && (this.placeDataLabels(), g && n0(this.points, function(t) {
                            var r;
                            e = t.connector, (i = t.dataLabel) && i._pos && t.visible && 0 < t.labelDistance ? (l = i._attr.visibility, (r = !e) && (t.connector = e = u.renderer.path().addClass("highcharts-data-label-connector highcharts-color-" + t.colorIndex).add(c.dataLabelsGroup), e.attr({
                                "stroke-width": g,
                                stroke: p.connectorColor || t.color || "#666666"
                            })), e[r ? "attr" : "animate"]({
                                d: c.connectorPath(t.labelPos)
                            }), e.attr("visibility", l)) : e && (t.connector = e.destroy())
                        }))
                    }, n7.pie.prototype.connectorPath = function(t) {
                        var e = t.x,
                            i = t.y;
                        return n9(this.options.dataLabels.softConnector, !0) ? ["M", e + ("left" === t[6] ? 5 : -5), i, "C", e, i, 2 * t[2] - t[4], 2 * t[3] - t[5], t[2], t[3], "L", t[4], t[5]] : ["M", e + ("left" === t[6] ? 5 : -5), i, "L", t[2], t[3], "L", t[4], t[5]]
                    }, n7.pie.prototype.placeDataLabels = function() {
                        n0(this.points, function(t) {
                            var e = t.dataLabel;
                            e && t.visible && ((t = e._pos) ? (e.sideOverflow && (e._attr.width = e.getBBox().width - e.sideOverflow, e.css({
                                width: e._attr.width + "px",
                                textOverflow: "ellipsis"
                            }), e.shortened = !0), e.attr(e._attr), e[e.moved ? "animate" : "attr"](t), e.moved = !0) : e && e.attr({
                                y: -9999
                            }))
                        }, this)
                    }, n7.pie.prototype.alignDataLabel = n6, n7.pie.prototype.verifyDataLabelOverflow = function(t) {
                        var e, i = this.center,
                            r = this.options,
                            n = r.center,
                            o = r.minSize || 80,
                            s = null !== r.size;
                        return s || (null !== n[0] ? e = Math.max(i[2] - Math.max(t[1], t[3]), o) : (e = Math.max(i[2] - t[1] - t[3], o), i[0] += (t[3] - t[1]) / 2), null !== n[1] ? e = Math.max(Math.min(e, i[2] - Math.max(t[0], t[2])), o) : (e = Math.max(Math.min(e, i[2] - t[0] - t[2]), o), i[1] += (t[0] - t[2]) / 2), e < i[2] ? (i[2] = e, i[3] = Math.min(n8(r.innerSize || 0, e), e), this.translate(i), this.drawDataLabels && this.drawDataLabels()) : s = !0), s
                    }), n7.column && (n7.column.prototype.alignDataLabel = function(t, e, i, r, n) {
                        var o = this.chart.inverted,
                            s = t.series,
                            a = t.dlBox || t.shapeArgs,
                            l = n9(t.below, t.plotY > n9(this.translatedThreshold, s.yAxis.len)),
                            h = n9(i.inside, !!this.options.stacking);
                        a && (0 > (r = n5(a)).y && (r.height += r.y, r.y = 0), 0 < (a = r.y + r.height - s.yAxis.len) && (r.height -= a), o && (r = {
                            x: s.yAxis.len - r.y - r.height,
                            y: s.xAxis.len - r.x - r.width,
                            width: r.height,
                            height: r.width
                        }), h || (o ? (r.x += l ? 0 : r.width, r.width = 0) : (r.y += l ? r.height : 0, r.height = 0))), i.align = n9(i.align, !o || h ? "center" : l ? "right" : "left"), i.verticalAlign = n9(i.verticalAlign, o || h ? "middle" : l ? "top" : "bottom"), n4.prototype.alignDataLabel.call(this, t, e, i, r, n), t.isLabelJustified && t.contrastColor && t.dataLabel.css({
                            color: t.contrastColor
                        })
                    }), oi = (oe = t).Chart, or = oe.each, on = oe.objectEach, oo = oe.pick, os = oe.addEvent, oi.prototype.callbacks.push(function(t) {
                        function e() {
                            var e = [];
                            or(t.yAxis || [], function(t) {
                                t.options.stackLabels && !t.options.stackLabels.allowOverlap && on(t.stacks, function(t) {
                                    on(t, function(t) {
                                        e.push(t.label)
                                    })
                                })
                            }), or(t.series || [], function(t) {
                                var i = t.options.dataLabels,
                                    r = t.dataLabelCollections || ["dataLabel"];
                                (i.enabled || t._hasPointLabels) && !i.allowOverlap && t.visible && or(r, function(i) {
                                    or(t.points, function(t) {
                                        t[i] && (t[i].labelrank = oo(t.labelrank, t.shapeArgs && t.shapeArgs.height), e.push(t[i]))
                                    })
                                })
                            }), t.hideOverlappingLabels(e)
                        }
                        e(), os(t, "redraw", e)
                    }), oi.prototype.hideOverlappingLabels = function(t) {
                        var e, i, r, n, o, s, a, l, h, c, d, u, p, f, g, m, v, y = t.length;
                        for (c = 0; c < y; c++)(h = t[c]) && (h.oldOpacity = h.opacity, h.newOpacity = 1, h.width || (d = h.getBBox(), h.width = d.width, h.height = d.height));
                        for (t.sort(function(t, e) {
                                return (e.labelrank || 0) - (t.labelrank || 0)
                            }), c = 0; c < y; c++)
                            for (d = t[c], h = c + 1; h < y; ++h) u = t[h], d && u && d !== u && d.placed && u.placed && 0 !== d.newOpacity && 0 !== u.newOpacity && (p = d.alignAttr, f = u.alignAttr, g = d.parentGroup, m = u.parentGroup, v = 2 * (d.box ? 0 : d.padding || 0), e = p.x + g.translateX, i = p.y + g.translateY, r = d.width - v, n = d.height - v, o = f.x + m.translateX, s = f.y + m.translateY, a = u.width - v, l = u.height - v, p = !(o > e + r || o + a < e || s > i + n || s + l < i)) && ((d.labelrank < u.labelrank ? d : u).newOpacity = 0);
                        or(t, function(t) {
                            var e, i;
                            t && (i = t.newOpacity, t.oldOpacity !== i && t.placed && (i ? t.show(!0) : e = function() {
                                t.hide()
                            }, t.alignAttr.opacity = i, t[t.isOld ? "animate" : "attr"](t.alignAttr, null, e)), t.isOld = !0)
                        })
                    }, oh = (oa = t).addEvent, oc = oa.Chart, od = oa.createElement, ou = oa.css, op = oa.defaultOptions, of = oa.defaultPlotOptions, og = oa.each, om = oa.extend, ov = oa.fireEvent, oy = oa.hasTouch, ob = oa.inArray, ox = oa.isObject, ow = oa.Legend, ok = oa.merge, oS = oa.pick, oM = oa.Point, oC = oa.Series, oA = oa.seriesTypes, oT = oa.svg, ol = oa.TrackerMixin = {
                        drawTrackerPoint: function() {
                            var t = this,
                                e = t.chart.pointer,
                                i = function(t) {
                                    var i = e.getPointFromEvent(t);
                                    void 0 !== i && (e.isDirectTouch = !0, i.onMouseOver(t))
                                };
                            og(t.points, function(t) {
                                t.graphic && (t.graphic.element.point = t), t.dataLabel && (t.dataLabel.div ? t.dataLabel.div.point = t : t.dataLabel.element.point = t)
                            }), t._hasTracking || (og(t.trackerGroups, function(r) {
                                t[r] && (t[r].addClass("highcharts-tracker").on("mouseover", i).on("mouseout", function(t) {
                                    e.onTrackerMouseOut(t)
                                }), oy && t[r].on("touchstart", i), t.options.cursor && t[r].css(ou).css({
                                    cursor: t.options.cursor
                                }))
                            }), t._hasTracking = !0)
                        },
                        drawTrackerGraph: function() {
                            var t, e = this,
                                i = e.options,
                                r = i.trackByArea,
                                n = [].concat(r ? e.areaPath : e.graphPath),
                                o = n.length,
                                s = e.chart,
                                a = s.pointer,
                                l = s.renderer,
                                h = s.options.tooltip.snap,
                                c = e.tracker,
                                d = function() {
                                    s.hoverSeries !== e && e.onMouseOver()
                                },
                                u = "rgba(192,192,192," + (oT ? 1e-4 : .002) + ")";
                            if (o && !r)
                                for (t = o + 1; t--;) "M" === n[t] && n.splice(t + 1, 0, n[t + 1] - h, n[t + 2], "L"), (t && "M" === n[t] || t === o) && n.splice(t, 0, "L", n[t - 2] + h, n[t - 1]);
                            c ? c.attr({
                                d: n
                            }) : e.graph && (e.tracker = l.path(n).attr({
                                "stroke-linejoin": "round",
                                visibility: e.visible ? "visible" : "hidden",
                                stroke: u,
                                fill: r ? u : "none",
                                "stroke-width": e.graph.strokeWidth() + (r ? 0 : 2 * h),
                                zIndex: 2
                            }).add(e.group), og([e.tracker, e.markerGroup], function(t) {
                                t.addClass("highcharts-tracker").on("mouseover", d).on("mouseout", function(t) {
                                    a.onTrackerMouseOut(t)
                                }), i.cursor && t.css({
                                    cursor: i.cursor
                                }), oy && t.on("touchstart", d)
                            }))
                        }
                    }, oA.column && (oA.column.prototype.drawTracker = ol.drawTrackerPoint), oA.pie && (oA.pie.prototype.drawTracker = ol.drawTrackerPoint), oA.scatter && (oA.scatter.prototype.drawTracker = ol.drawTrackerPoint), om(ow.prototype, {
                        setItemEvents: function(t, e, i) {
                            var r = this,
                                n = r.chart.renderer.boxWrapper,
                                o = "highcharts-legend-" + (t.series ? "point" : "series") + "-active";
                            (i ? e : t.legendGroup).on("mouseover", function() {
                                t.setState("hover"), n.addClass(o), e.css(r.options.itemHoverStyle)
                            }).on("mouseout", function() {
                                e.css(ok(t.visible ? r.itemStyle : r.itemHiddenStyle)), n.removeClass(o), t.setState()
                            }).on("click", function(e) {
                                var i = function() {
                                    t.setVisible && t.setVisible()
                                };
                                e = {
                                    browserEvent: e
                                }, t.firePointEvent ? t.firePointEvent("legendItemClick", e, i) : ov(t, "legendItemClick", e, i)
                            })
                        },
                        createCheckboxForItem: function(t) {
                            t.checkbox = od("input", {
                                type: "checkbox",
                                checked: t.selected,
                                defaultChecked: t.selected
                            }, this.options.itemCheckboxStyle, this.chart.container), oh(t.checkbox, "click", function(e) {
                                ov(t.series || t, "checkboxClick", {
                                    checked: e.target.checked,
                                    item: t
                                }, function() {
                                    t.select()
                                })
                            })
                        }
                    }), op.legend.itemStyle.cursor = "pointer", om(oc.prototype, {
                        showResetZoom: function() {
                            var t = this,
                                e = op.lang,
                                i = t.options.chart.resetZoomButton,
                                r = i.theme,
                                n = r.states,
                                o = "chart" === i.relativeTo ? null : "plotBox";
                            this.resetZoomButton = t.renderer.button(e.resetZoom, null, null, function() {
                                t.zoomOut()
                            }, r, n && n.hover).attr({
                                align: i.position.align,
                                title: e.resetZoomTitle
                            }).addClass("highcharts-reset-zoom").add().align(i.position, !1, o)
                        },
                        zoomOut: function() {
                            var t = this;
                            ov(t, "selection", {
                                resetSelection: !0
                            }, function() {
                                t.zoom()
                            })
                        },
                        zoom: function(t) {
                            var e, i, r = this.pointer,
                                n = !1;
                            !t || t.resetSelection ? (og(this.axes, function(t) {
                                e = t.zoom()
                            }), r.initiated = !1) : og(t.xAxis.concat(t.yAxis), function(t) {
                                var i = t.axis;
                                r[i.isXAxis ? "zoomX" : "zoomY"] && (e = i.zoom(t.min, t.max), i.displayBtn && (n = !0))
                            }), i = this.resetZoomButton, n && !i ? this.showResetZoom() : !n && ox(i) && (this.resetZoomButton = i.destroy()), e && this.redraw(oS(this.options.chart.animation, t && t.animation, 100 > this.pointCount))
                        },
                        pan: function(t, e) {
                            var i, r = this,
                                n = r.hoverPoints;
                            n && og(n, function(t) {
                                t.setState()
                            }), og("xy" === e ? [1, 0] : [1], function(e) {
                                var n, o = (e = r[e ? "xAxis" : "yAxis"][0]).horiz,
                                    s = t[o ? "chartX" : "chartY"],
                                    o = o ? "mouseDownX" : "mouseDownY",
                                    a = r[o],
                                    l = (e.pointRange || 0) / 2,
                                    h = e.getExtremes(),
                                    c = e.toValue(a - s, !0) + l,
                                    l = e.toValue(a + e.len - s, !0) - l,
                                    d = l < c,
                                    a = d ? l : c,
                                    c = d ? c : l,
                                    l = Math.min(h.dataMin, e.toValue(e.toPixels(h.min) - e.minPixelPadding)),
                                    d = Math.max(h.dataMax, e.toValue(e.toPixels(h.max) + e.minPixelPadding));
                                0 < (n = l - a) && (c += n, a = l), 0 < (n = c - d) && (c = d, a -= n), e.series.length && a !== h.min && c !== h.max && (e.setExtremes(a, c, !1, !1, {
                                    trigger: "pan"
                                }), i = !0), r[o] = s
                            }), i && r.redraw(!1), ou(r.container, {
                                cursor: "move"
                            })
                        }
                    }), om(oM.prototype, {
                        select: function(t, e) {
                            var i = this,
                                r = i.series,
                                n = r.chart;
                            t = oS(t, !i.selected), i.firePointEvent(t ? "select" : "unselect", {
                                accumulate: e
                            }, function() {
                                i.selected = i.options.selected = t, r.options.data[ob(i, r.data)] = i.options, i.setState(t && "select"), e || og(n.getSelectedPoints(), function(t) {
                                    t.selected && t !== i && (t.selected = t.options.selected = !1, r.options.data[ob(t, r.data)] = t.options, t.setState(""), t.firePointEvent("unselect"))
                                })
                            })
                        },
                        onMouseOver: function(t) {
                            var e = this.series.chart,
                                i = e.pointer;
                            t = t ? i.normalize(t) : i.getChartCoordinatesFromPoint(this, e.inverted), i.runPointActions(t, this)
                        },
                        onMouseOut: function() {
                            var t = this.series.chart;
                            this.firePointEvent("mouseOut"), og(t.hoverPoints || [], function(t) {
                                t.setState()
                            }), t.hoverPoints = t.hoverPoint = null
                        },
                        importEvents: function() {
                            if (!this.hasImportedEvents) {
                                var t = this,
                                    e = ok(t.series.options.point, t.options).events;
                                t.events = e, oa.objectEach(e, function(e, i) {
                                    oh(t, i, e)
                                }), this.hasImportedEvents = !0
                            }
                        },
                        setState: function(t, e) {
                            var i, r = Math.floor(this.plotX),
                                n = this.plotY,
                                o = this.series,
                                s = o.options.states[t] || {},
                                a = of [o.type].marker && o.options.marker,
                                l = a && !1 === a.enabled,
                                h = a && a.states && a.states[t] || {},
                                c = !1 === h.enabled,
                                d = o.stateMarkerGraphic,
                                u = this.marker || {},
                                p = o.chart,
                                f = o.halo,
                                g = a && o.markerAttribs;
                            (t = t || "") === this.state && !e || this.selected && "select" !== t || !1 === s.enabled || t && (c || l && !1 === h.enabled) || t && u.states && u.states[t] && !1 === u.states[t].enabled || (g && (i = o.markerAttribs(this, t)), this.graphic ? (this.state && this.graphic.removeClass("highcharts-point-" + this.state), t && this.graphic.addClass("highcharts-point-" + t), this.graphic.animate(o.pointAttribs(this, t), oS(p.options.chart.animation, s.animation)), i && this.graphic.animate(i, oS(p.options.chart.animation, h.animation, a.animation)), d && d.hide()) : (t && h && (a = u.symbol || o.symbol, d && d.currentSymbol !== a && (d = d.destroy()), d ? d[e ? "animate" : "attr"]({
                                x: i.x,
                                y: i.y
                            }) : a && (o.stateMarkerGraphic = d = p.renderer.symbol(a, i.x, i.y, i.width, i.height).add(o.markerGroup), d.currentSymbol = a), d && d.attr(o.pointAttribs(this, t))), d && (d[t && p.isInsidePlot(r, n, p.inverted) ? "show" : "hide"](), d.element.point = this)), (r = s.halo) && r.size ? (f || (o.halo = f = p.renderer.path().add((this.graphic || d).parentGroup)), f[e ? "animate" : "attr"]({
                                d: this.haloPath(r.size)
                            }), f.attr({
                                class: "highcharts-halo highcharts-color-" + oS(this.colorIndex, o.colorIndex)
                            }), f.point = this, f.attr(om({
                                fill: this.color || o.color,
                                "fill-opacity": r.opacity,
                                zIndex: -1
                            }, r.attributes))) : f && f.point && f.point.haloPath && f.animate({
                                d: f.point.haloPath(0)
                            }), this.state = t)
                        },
                        haloPath: function(t) {
                            return this.series.chart.renderer.symbols.circle(Math.floor(this.plotX) - t, this.plotY - t, 2 * t, 2 * t)
                        }
                    }), om(oC.prototype, {
                        onMouseOver: function() {
                            var t = this.chart,
                                e = t.hoverSeries;
                            e && e !== this && e.onMouseOut(), this.options.events.mouseOver && ov(this, "mouseOver"), this.setState("hover"), t.hoverSeries = this
                        },
                        onMouseOut: function() {
                            var t = this.options,
                                e = this.chart,
                                i = e.tooltip,
                                r = e.hoverPoint;
                            e.hoverSeries = null, r && r.onMouseOut(), this && t.events.mouseOut && ov(this, "mouseOut"), !i || this.stickyTracking || i.shared && !this.noSharedTooltip || i.hide(), this.setState()
                        },
                        setState: function(t) {
                            var e = this,
                                i = e.options,
                                r = e.graph,
                                n = i.states,
                                o = i.lineWidth,
                                i = 0;
                            if (t = t || "", e.state !== t && (og([e.group, e.markerGroup, e.dataLabelsGroup], function(i) {
                                    i && (e.state && i.removeClass("highcharts-series-" + e.state), t && i.addClass("highcharts-series-" + t))
                                }), e.state = t, !n[t] || !1 !== n[t].enabled) && (t && (o = n[t].lineWidth || o + (n[t].lineWidthPlus || 0)), r && !r.dashstyle))
                                for (o = {
                                        "stroke-width": o
                                    }, r.animate(o, oS(e.chart.options.chart.animation, n[t] && n[t].animation)); e["zone-graph-" + i];) e["zone-graph-" + i].attr(o), i += 1
                        },
                        setVisible: function(t, e) {
                            var i, r = this,
                                n = r.chart,
                                o = r.legendItem,
                                s = n.options.chart.ignoreHiddenSeries,
                                a = r.visible;
                            i = (r.visible = t = r.options.visible = r.userOptions.visible = void 0 === t ? !a : t) ? "show" : "hide", og(["group", "dataLabelsGroup", "markerGroup", "tracker", "tt"], function(t) {
                                r[t] && r[t][i]()
                            }), (n.hoverSeries === r || (n.hoverPoint && n.hoverPoint.series) === r) && r.onMouseOut(), o && n.legend.colorizeItem(r, t), r.isDirty = !0, r.options.stacking && og(n.series, function(t) {
                                t.options.stacking && t.visible && (t.isDirty = !0)
                            }), og(r.linkedSeries, function(e) {
                                e.setVisible(t, !1)
                            }), s && (n.isDirtyBox = !0), !1 !== e && n.redraw(), ov(r, i)
                        },
                        show: function() {
                            this.setVisible(!0)
                        },
                        hide: function() {
                            this.setVisible(!1)
                        },
                        select: function(t) {
                            this.selected = t = void 0 === t ? !this.selected : t, this.checkbox && (this.checkbox.checked = t), ov(this, t ? "select" : "unselect")
                        },
                        drawTracker: ol.drawTrackerGraph
                    }), oO = (oP = t).Chart, oI = oP.each, oL = oP.inArray, oD = oP.isArray, oE = oP.isObject, oj = oP.pick, oN = oP.splat, oO.prototype.setResponsive = function(t) {
                        var e = this.options.responsive,
                            i = [],
                            r = this.currentResponsive;
                        e && e.rules && oI(e.rules, function(e) {
                            void 0 === e._id && (e._id = oP.uniqueKey()), this.matchResponsiveRule(e, i, t)
                        }, this);
                        var n = oP.merge.apply(0, oP.map(i, function(t) {
                                return oP.find(e.rules, function(e) {
                                    return e._id === t
                                }).chartOptions
                            })),
                            i = i.toString() || void 0;
                        i !== (r && r.ruleIds) && (r && this.update(r.undoOptions, t), i ? (this.currentResponsive = {
                            ruleIds: i,
                            mergedOptions: n,
                            undoOptions: this.currentOptions(n)
                        }, this.update(n, t)) : this.currentResponsive = void 0)
                    }, oO.prototype.matchResponsiveRule = function(t, e) {
                        var i = t.condition;
                        (i.callback || function() {
                            return this.chartWidth <= oj(i.maxWidth, Number.MAX_VALUE) && this.chartHeight <= oj(i.maxHeight, Number.MAX_VALUE) && this.chartWidth >= oj(i.minWidth, 0) && this.chartHeight >= oj(i.minHeight, 0)
                        }).call(this) && e.push(t._id)
                    }, oO.prototype.currentOptions = function(t) {
                        var e = {};
                        return ! function t(e, i, r, n) {
                            var o;
                            oP.objectEach(e, function(s, a) {
                                if (!n && -1 < oL(a, ["series", "xAxis", "yAxis"]))
                                    for (e[a] = oN(e[a]), r[a] = [], o = 0; o < e[a].length; o++) i[a][o] && (r[a][o] = {}, t(s[o], i[a][o], r[a][o], n + 1));
                                else oE(s) ? (r[a] = oD(s) ? [] : {}, t(s, i[a] || {}, r[a], n + 1)) : r[a] = i[a] || null
                            })
                        }(t, this.options, e, 0), e
                    }, t
                }, "object" === s(t) && t.exports ? t.exports = r.document ? n(r) : n : r.Highcharts = n(r)
            },
            726: function(t, e, i) {
                var r;

                function n(t) {
                    return t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
                }
                t = i.nmd(t), r = function(t) {
                    var e, i, r, o, s, a, l, h, c;
                    i = t.win.document, r = t.each, o = t.objectEach, s = t.pick, a = t.inArray, l = t.isNumber, h = t.splat, c = function(t, e) {
                        this.init(t, e)
                    }, t.extend(c.prototype, {
                        init: function(t, e) {
                            this.options = t, this.chartOptions = e, this.columns = t.columns || this.rowsToColumns(t.rows) || [], this.firstRowAsNames = s(t.firstRowAsNames, !0), this.decimalRegex = t.decimalPoint && RegExp("^(-?[0-9]+)" + t.decimalPoint + "([0-9]+)$"), this.rawColumns = [], this.columns.length ? this.dataFound() : (this.parseCSV(), this.parseTable(), this.parseGoogleSpreadsheet())
                        },
                        getColumnDistribution: function() {
                            var i, n = this.chartOptions,
                                s = this.options,
                                a = [],
                                l = function(e) {
                                    return (t.seriesTypes[e || "line"].prototype.pointArrayMap || [0]).length
                                },
                                h = n && n.chart && n.chart.type,
                                c = [],
                                d = [],
                                u = 0;
                            r(n && n.series || [], function(t) {
                                c.push(l(t.type || h))
                            }), r(s && s.seriesMapping || [], function(t) {
                                a.push(t.x || 0)
                            }), 0 === a.length && a.push(0), r(s && s.seriesMapping || [], function(r) {
                                var s = new e,
                                    a = c[u] || l(h),
                                    p = t.seriesTypes[((n && n.series || [])[u] || {}).type || h || "line"].prototype.pointArrayMap || ["y"];
                                for (s.addColumnReader(r.x, "x"), o(r, function(t, e) {
                                        "x" !== e && s.addColumnReader(t, e)
                                    }), i = 0; i < a; i++) s.hasReader(p[i]) || s.addColumnReader(void 0, p[i]);
                                d.push(s), u++
                            }), void 0 === (s = t.seriesTypes[h || "line"].prototype.pointArrayMap) && (s = ["y"]), this.valueCount = {
                                global: l(h),
                                xColumns: a,
                                individual: c,
                                seriesBuilders: d,
                                globalPointArrayMap: s
                            }
                        },
                        dataFound: function() {
                            this.options.switchRowsAndColumns && (this.columns = this.rowsToColumns(this.columns)), this.getColumnDistribution(), this.parseTypes(), !1 !== this.parsed() && this.complete()
                        },
                        parseCSV: function() {
                            var t, e, i = this,
                                n = this.options,
                                o = n.csv,
                                s = this.columns,
                                a = n.startRow || 0,
                                l = n.endRow || Number.MAX_VALUE,
                                h = n.startColumn || 0,
                                c = n.endColumn || Number.MAX_VALUE,
                                d = 0;
                            o && (e = o.replace(/\r\n/g, "\n").replace(/\r/g, "\n").split(n.lineDelimiter || "\n"), t = n.itemDelimiter || (-1 !== o.indexOf("	") ? "	" : ","), r(e, function(e, n) {
                                var o = i.trim(e),
                                    u = 0 === o.indexOf("#");
                                n >= a && n <= l && !u && "" !== o && (r(e = e.split(t), function(t, e) {
                                    e >= h && e <= c && (s[e - h] || (s[e - h] = []), s[e - h][d] = t)
                                }), d += 1)
                            }), this.dataFound())
                        },
                        parseTable: function() {
                            var t = this.options,
                                e = t.table,
                                n = this.columns,
                                o = t.startRow || 0,
                                s = t.endRow || Number.MAX_VALUE,
                                a = t.startColumn || 0,
                                l = t.endColumn || Number.MAX_VALUE;
                            e && ("string" == typeof e && (e = i.getElementById(e)), r(e.getElementsByTagName("tr"), function(t, e) {
                                e >= o && e <= s && r(t.children, function(t, i) {
                                    ("TD" === t.tagName || "TH" === t.tagName) && i >= a && i <= l && (n[i - a] || (n[i - a] = []), n[i - a][e - o] = t.innerHTML)
                                })
                            }), this.dataFound())
                        },
                        parseGoogleSpreadsheet: function() {
                            var t, e, i = this,
                                n = this.options,
                                o = n.googleSpreadsheetKey,
                                s = this.columns,
                                a = n.startRow || 0,
                                l = n.endRow || Number.MAX_VALUE,
                                h = n.startColumn || 0,
                                c = n.endColumn || Number.MAX_VALUE;
                            o && jQuery.ajax({
                                dataType: "json",
                                url: "https://spreadsheets.google.com/feeds/cells/" + o + "/" + (n.googleSpreadsheetWorksheet || "od6") + "/public/values?alt=json-in-script&callback=?",
                                error: n.error,
                                success: function(n) {
                                    var o, d, u = (n = n.feed.entry).length,
                                        p = 0,
                                        f = 0;
                                    for (d = 0; d < u; d++) p = Math.max(p, (o = n[d]).gs$cell.col), f = Math.max(f, o.gs$cell.row);
                                    for (d = 0; d < p; d++) d >= h && d <= c && (s[d - h] = [], s[d - h].length = Math.min(f, l - a));
                                    for (d = 0; d < u; d++) t = (o = n[d]).gs$cell.row - 1, (e = o.gs$cell.col - 1) >= h && e <= c && t >= a && t <= l && (s[e - h][t - a] = o.content.$t);
                                    r(s, function(t) {
                                        for (d = 0; d < t.length; d++) void 0 === t[d] && (t[d] = null)
                                    }), i.dataFound()
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
                            var i, r, n, o, s, c = this.rawColumns,
                                d = this.columns,
                                u = t.length,
                                p = this.firstRowAsNames,
                                f = -1 !== a(e, this.valueCount.xColumns),
                                g = [],
                                m = this.chartOptions,
                                v = (this.options.columnTypes || [])[e],
                                m = f && (m && m.xAxis && "category" === h(m.xAxis)[0].type || "string" === v);
                            for (c[e] || (c[e] = []); u--;) i = g[u] || t[u], n = this.trim(i), r = parseFloat(o = this.trim(i, !0)), void 0 === c[e][u] && (c[e][u] = n), m || 0 === u && p ? t[u] = n : +o === r ? (t[u] = r, 31536e6 < r && "float" !== v ? t.isDatetime = !0 : t.isNumeric = !0, void 0 !== t[u + 1] && (s = r > t[u + 1])) : (r = this.parseDate(i), f && l(r) && "float" !== v ? (g[u] = i, t[u] = r, t.isDatetime = !0, void 0 !== t[u + 1] && ((i = r > t[u + 1]) !== s && void 0 !== s && (this.alternativeFormat ? (this.dateFormat = this.alternativeFormat, u = t.length, this.alternativeFormat = this.dateFormats[this.dateFormat].alternative) : t.unsorted = !0), s = i)) : (t[u] = "" === n ? null : n, 0 !== u && (t.isDatetime || t.isNumeric) && (t.mixed = !0)));
                            if (f && t.mixed && (d[e] = c[e]), f && s && this.options.sort)
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
                            var e, i, r, o = this.options.parseDate,
                                s = this.options.dateFormat || this.dateFormat;
                            if (o) e = o(t);
                            else if ("string" == typeof t) {
                                if (s) o = this.dateFormats[s], (r = t.match(o.regex)) && (e = o.parser(r));
                                else
                                    for (i in this.dateFormats)
                                        if (o = this.dateFormats[i], r = t.match(o.regex)) {
                                            this.dateFormat = i, this.alternativeFormat = o.alternative, e = o.parser(r);
                                            break
                                        } r || ("object" === (void 0 === (r = Date.parse(t)) ? "undefined" : n(r)) && null !== r && r.getTime ? e = r.getTime() - 6e4 * r.getTimezoneOffset() : l(r) && (e = r - 6e4 * new Date(r).getTimezoneOffset()))
                            }
                            return e
                        },
                        rowsToColumns: function(t) {
                            var e, i, r, n, o;
                            if (t)
                                for (o = [], i = t.length, e = 0; e < i; e++)
                                    for (n = t[e].length, r = 0; r < n; r++) o[r] || (o[r] = []), o[r][e] = t[e][r];
                            return o
                        },
                        parsed: function() {
                            if (this.options.parsed) return this.options.parsed.call(this, this.columns)
                        },
                        getFreeIndexes: function(t, e) {
                            var i, r, n = [],
                                o = [];
                            for (i = 0; i < t; i += 1) n.push(!0);
                            for (t = 0; t < e.length; t += 1)
                                for (r = e[t].getReferencedColumnIndexes(), i = 0; i < r.length; i += 1) n[r[i]] = !1;
                            for (i = 0; i < n.length; i += 1) n[i] && o.push(i);
                            return o
                        },
                        complete: function() {
                            var t, i, r, n, o, s, l = this.columns,
                                h = this.options,
                                c = [];
                            if (h.complete || h.afterComplete) {
                                for (n = 0; n < l.length; n++) this.firstRowAsNames && (l[n].name = l[n].shift());
                                for (n = 0, i = [], r = this.getFreeIndexes(l.length, this.valueCount.seriesBuilders); n < this.valueCount.seriesBuilders.length; n++)(s = this.valueCount.seriesBuilders[n]).populateColumns(r) && c.push(s);
                                for (; 0 < r.length;) {
                                    for ((s = new e).addColumnReader(0, "x"), -1 !== (n = a(0, r)) && r.splice(n, 1), n = 0; n < this.valueCount.global; n++) s.addColumnReader(void 0, this.valueCount.globalPointArrayMap[n]);
                                    s.populateColumns(r) && c.push(s)
                                }
                                if (0 < c.length && 0 < c[0].readers.length && void 0 !== (s = l[c[0].readers[0].columnIndex]) && (s.isDatetime ? t = "datetime" : s.isNumeric || (t = "category")), "category" === t)
                                    for (n = 0; n < c.length; n++)
                                        for (s = c[n], r = 0; r < s.readers.length; r++) "x" === s.readers[r].configName && (s.readers[r].configName = "name");
                                for (n = 0; n < c.length; n++) {
                                    for (o = 0, s = c[n], r = []; o < l[0].length; o++) r[o] = s.read(l, o);
                                    i[n] = {
                                        data: r
                                    }, s.name && (i[n].name = s.name), "category" === t && (i[n].turboThreshold = 0)
                                }
                                l = {
                                    series: i
                                }, t && (l.xAxis = {
                                    type: t
                                }, "category" === t && (l.xAxis.uniqueNames = !1)), h.complete && h.complete(l), h.afterComplete && h.afterComplete(l)
                            }
                        }
                    }), t.Data = c, t.data = function(t, e) {
                        return new c(t, e)
                    }, t.wrap(t.Chart.prototype, "init", function(e, i, r) {
                        var o = this;
                        i && i.data ? t.data(t.extend(i.data, {
                            afterComplete: function(s) {
                                var a, l;
                                if (i.hasOwnProperty("series"))
                                    if ("object" === n(i.series))
                                        for (a = Math.max(i.series.length, s.series.length); a--;) l = i.series[a] || {}, i.series[a] = t.merge(l, s.series[a]);
                                    else delete i.series;
                                i = t.merge(s, i), e.call(o, i, r)
                            }
                        }), i) : e.call(o, i, r)
                    }), (e = function() {
                        this.readers = [], this.pointIsArray = !0
                    }).prototype.populateColumns = function(t) {
                        var e = !0;
                        return r(this.readers, function(e) {
                            void 0 === e.columnIndex && (e.columnIndex = t.shift())
                        }), r(this.readers, function(t) {
                            void 0 === t.columnIndex && (e = !1)
                        }), e
                    }, e.prototype.read = function(t, e) {
                        var i, n = this.pointIsArray,
                            o = n ? [] : {};
                        return r(this.readers, function(i) {
                            var r = t[i.columnIndex][e];
                            n ? o.push(r) : o[i.configName] = r
                        }), void 0 === this.name && 2 <= this.readers.length && 2 <= (i = this.getReferencedColumnIndexes()).length && (i.shift(), i.sort(), this.name = t[i.shift()].name), o
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
                }, "object" === n(t) && t.exports ? t.exports = r : r(Highcharts)
            }
        },
        e = {};

    function i(r) {
        var n = e[r];
        if (void 0 !== n) return n.exports;
        var o = e[r] = {
            id: r,
            loaded: !1,
            exports: {}
        };
        return t[r].call(o.exports, o, o.exports, i), o.loaded = !0, o.exports
    }
    i.m = t, i.n = function(t) {
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
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(t, "__esModule", {
                value: !0
            })
        }, i.nmd = function(t) {
            return t.paths = [], t.children || (t.children = []), t
        }, i.rv = function() {
            return "1.7.12"
        }, i.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var t, e, r, n, o = window.ReactJSX,
                s = window.React,
                a = i.n(s),
                l = window.Roblox["core-scripts"].util.ready,
                h = i.n(l),
                c = window.Roblox["core-scripts"].react,
                d = i(611),
                u = i.n(d),
                p = window.ReactUtilities,
                f = window.Roblox,
                g = window.Roblox["core-scripts"].meta.user,
                m = [30, 90, 180],
                v = "Label.NotAvailable",
                y = "Message.TakeOffSaleFailure",
                b = {
                    resellersList: "resellersList"
                },
                x = {
                    buyBtn: "buyBtn",
                    tradeBtn: "tradeBtn",
                    upgradeBtn: "upgradeBtn",
                    nonPremiumTradeBtn: "nonPremiumTradeBtn"
                },
                w = {
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
                k = {
                    priceChart: "priceChart",
                    resellers: "resellers",
                    inventory: "inventory"
                },
                S = "angular-to-react-purchase-event",
                M = "limited-reseller-list",
                C = {
                    common: ["Feature.PrivateSales", "Feature.Item", "Feature.Profile", "Feature.Trades", "Feature.Premium"],
                    feature: "Feature.Catalog"
                },
                A = window.CoreUtilities,
                T = window.Roblox["core-scripts"].environmentUrls,
                P = i.n(T),
                O = {
                    getResaleData: function(t) {
                        return {
                            url: "".concat(P().economyApi, "/v1/assets/").concat(t, "/resale-data"),
                            withCredentials: !0
                        }
                    },
                    getCanTradeWith: function(t) {
                        return {
                            url: "".concat(P().tradesApi, "/v1/users/").concat(t, "/can-trade-with"),
                            withCredentials: !0
                        }
                    },
                    postItemDetails: {
                        url: "".concat(P().catalogApi, "/v1/catalog/items/details"),
                        withCredentials: !0
                    },
                    postMarketplaceItemDetails: {
                        url: "".concat(P().apiGatewayUrl, "/marketplace-items/v1/items/details"),
                        withCredentials: !0
                    },
                    getResellersForLimited2Item: function(t) {
                        return {
                            url: "".concat(P().apiGatewayUrl, "/marketplace-sales/v1/item/").concat(t, "/resellers"),
                            withCredentials: !0
                        }
                    },
                    placeLimited2ItemOnSale: function(t, e) {
                        return {
                            url: "".concat(P().apiGatewayUrl, "/marketplace-sales/v1/item/").concat(t, "/instance/").concat(e, "/resale"),
                            withCredentials: !0
                        }
                    },
                    getResaleDataForLimited2Item: function(t) {
                        return {
                            url: "".concat(P().apiGatewayUrl, "/marketplace-sales/v1/item/").concat(t, "/resale-data"),
                            withCredentials: !0
                        }
                    }
                },
                I = function(t, e, i) {
                    var r;
                    return A.httpService.patch(O.placeLimited2ItemOnSale(t, null != (r = e.collectibleItemInstanceId) ? r : ""), {
                        price: void 0,
                        isOnSale: !1,
                        sellerId: i,
                        sellerType: "User",
                        collectibleProductId: e.collectibleProductId
                    })
                },
                L = i(573),
                D = i.n(L),
                E = i(726),
                j = i.n(E);

            function N(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, r = Array(e); i < e; i++) r[i] = t[i];
                return r
            }
            var R = w.itemDelimiter,
                B = w.lineDelimiter,
                z = function(t) {
                    return ((function(t) {
                        if (Array.isArray(t)) return N(t)
                    })(t) || function(t) {
                        if ("u" > typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                    }(t) || function(t) {
                        if (t) {
                            if ("string" == typeof t) return N(t, void 0);
                            var e = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === e && t.constructor && (e = t.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                            if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return N(t, void 0)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()).reverse().map(function(t) {
                        return "".concat(new Date(t.date).getTime()).concat(R).concat(t.value)
                    }).join(B)
                },
                G = function(t) {
                    var e = new Date;
                    return e.setDate(e.getDate() - t), e.getTime()
                },
                W = function(t) {
                    return {
                        csv: "col".concat(R, "row").concat(B).concat(z(t)).concat(B),
                        itemDelimiter: R,
                        lineDelimiter: B
                    }
                };

            function H(t) {
                for (var e = 1; e < arguments.length; e++) {
                    var i = null != arguments[e] ? arguments[e] : {},
                        r = Object.keys(i);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(i).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(i, t).enumerable
                    }))), r.forEach(function(e) {
                        var r;
                        r = i[e], e in t ? Object.defineProperty(t, e, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[e] = r
                    })
                }
                return t
            }

            function F(t, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(e)) : (function(t) {
                    var e = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        e.push.apply(e, i)
                    }
                    return e
                })(Object(e)).forEach(function(i) {
                    Object.defineProperty(t, i, Object.getOwnPropertyDescriptor(e, i))
                }), t
            }
            j()(D());
            var X = function(t) {
                    var e = t.id,
                        i = t.className,
                        r = t.days,
                        n = t.buildConfig,
                        a = (0, s.useRef)(null),
                        l = (0, s.useRef)(null),
                        h = (0, s.useRef)(n);
                    return h.current = n, (0, s.useEffect)(function() {
                        if (a.current) {
                            var t = h.current();
                            return l.current = new(D()).Chart(F(H({}, t), {
                                    chart: F(H({}, t.chart), {
                                        renderTo: a.current
                                    })
                                })),
                                function() {
                                    var t;
                                    null == (t = l.current) || t.destroy(), l.current = null
                                }
                        }
                    }, []), (0, s.useEffect)(function() {
                        var t, e;
                        null == (e = l.current) || null == (t = e.xAxis[0]) || t.update({
                            min: G(r)
                        })
                    }, [r]), (0, o.jsx)("div", {
                        id: e,
                        className: i,
                        ref: a
                    })
                },
                Y = new Date().getTime(),
                V = function(t) {
                    return {
                        chart: {
                            backgroundColor: w.colors.backgroundColor,
                            marginLeft: w.marginLeft
                        },
                        title: {
                            text: ""
                        },
                        legend: {
                            enabled: !1
                        },
                        tooltip: {
                            backgroundColor: w.colors.borderColor,
                            borderColor: w.colors.borderColor,
                            pointFormat: '<span style="color:'.concat(w.colors.pointColor, '">{point.y}</span>'),
                            headerFormat: ""
                        },
                        xAxis: {
                            type: "datetime",
                            max: t,
                            tickLength: 0
                        },
                        credits: {
                            enabled: !1
                        }
                    }
                },
                U = function(t, e) {
                    var i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Y,
                        r = V(i);
                    return r.colors = [w.colors.lineColor], r.chart.height = w.lineChartHeight, r.data = W(t), r.xAxis.min = G(e), r.xAxis.labels = {
                        format: "{value:%m/%d}"
                    }, r.yAxis = {
                        title: {
                            text: ""
                        },
                        labels: {
                            formatter: function() {
                                return A.abbreviateNumber.getAbbreviatedValue(this.value, void 0, 1e3)
                            }
                        }
                    }, r
                },
                _ = function(t, e) {
                    var i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Y,
                        r = V(i);
                    return r.chart.type = "column", r.colors = [w.colors.verticalBarColor], r.chart.height = w.verticalBarChartHeight, r.data = W(t), r.xAxis.min = G(e), r.xAxis.labels = {
                        enabled: !1
                    }, r.yAxis = {
                        gridLineWidth: 0,
                        minorGridLineWidth: 0,
                        title: {
                            text: ""
                        },
                        labels: {
                            enabled: !1
                        }
                    }, r.plotOptions = {
                        series: {
                            pointWidth: 1
                        }
                    }, r
                },
                K = function(t) {
                    var e = t.chartDataPoints,
                        i = t.days,
                        r = (0, s.useRef)("line_chart_".concat(new Date().getTime())),
                        n = (0, s.useRef)(i),
                        a = (0, s.useCallback)(function() {
                            return U(e, n.current)
                        }, [e]);
                    return (0, o.jsx)(X, {
                        id: r.current,
                        days: i,
                        buildConfig: a
                    })
                },
                q = function(t) {
                    var e = t.chartDataPoints,
                        i = t.days,
                        r = (0, s.useRef)("vertical_bar_chart_".concat(new Date().getTime())),
                        n = (0, s.useRef)(i),
                        a = (0, s.useCallback)(function() {
                            return _(e, n.current)
                        }, [e]);
                    return (0, o.jsx)(X, {
                        id: r.current,
                        days: i,
                        buildConfig: a
                    })
                };

            function $(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, r = Array(e); i < e; i++) r[i] = t[i];
                return r
            }
            var Z = function(t) {
                var e, i = t.dayOptions,
                    r = t.selectedDays,
                    n = t.onSelect,
                    a = t.formatDays,
                    l = function(t) {
                        if (Array.isArray(t)) return t
                    }(e = (0, s.useState)(!1)) || function(t) {
                        var e, i, r = null == t ? null : "u" > typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != r) {
                            var n = [],
                                o = !0,
                                s = !1;
                            try {
                                for (r = r.call(t); !(o = (e = r.next()).done) && (n.push(e.value), 2 !== n.length); o = !0);
                            } catch (t) {
                                s = !0, i = t
                            } finally {
                                try {
                                    o || null == r.return || r.return()
                                } finally {
                                    if (s) throw i
                                }
                            }
                            return n
                        }
                    }(e) || function(t) {
                        if (t) {
                            if ("string" == typeof t) return $(t, 2);
                            var e = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === e && t.constructor && (e = t.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                            if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return $(t, 2)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    h = l[0],
                    c = l[1],
                    d = (0, s.useRef)(null);
                return (0, s.useEffect)(function() {
                    var t = function(t) {
                        var e = t.target;
                        d.current && !d.current.contains(e) && c(!1)
                    };
                    return document.addEventListener("mousedown", t),
                        function() {
                            document.removeEventListener("mousedown", t)
                        }
                }, []), (0, o.jsxs)("div", {
                    ref: d,
                    className: u()("input-group-btn", "price-chart-range-dropdown", {
                        open: h
                    }),
                    children: [(0, o.jsxs)("button", {
                        type: "button",
                        className: "input-dropdown-btn",
                        "aria-haspopup": "true",
                        "aria-expanded": h ? "true" : "false",
                        onClick: function() {
                            c(!h)
                        },
                        children: [(0, o.jsx)("span", {
                            className: "rbx-selection-label",
                            children: a(r)
                        }), (0, o.jsx)("span", {
                            className: "icon-down-16x16"
                        })]
                    }), (0, o.jsx)("ul", {
                        className: "dropdown-menu",
                        role: "menu",
                        style: {
                            display: h ? "block" : "none"
                        },
                        children: i.map(function(t) {
                            return (0, o.jsx)("li", {
                                children: (0, o.jsx)("button", {
                                    type: "button",
                                    onClick: function() {
                                        n(t), c(!1)
                                    },
                                    children: a(t)
                                })
                            }, t)
                        })
                    })]
                })
            };

            function J(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, r = Array(e); i < e; i++) r[i] = t[i];
                return r
            }
            var Q = function(t, e) {
                    return null != t && t > 0 ? A.numberFormat.getNumberFormat(t) : e
                },
                tt = function(t, e) {
                    return null == t ? e : t >= 0 ? A.numberFormat.getNumberFormat(t) : e
                },
                te = function(t, e) {
                    var i, r, n, o, s, a, l, h;
                    return e ? (null != (i = null == (a = t.priceDataPoints) ? void 0 : a.length) ? i : 0) > 0 || (null != (r = null == (l = t.volumeDataPoints) ? void 0 : l.length) ? r : 0) > 0 || (null != (n = t.recentAveragePrice) ? n : -1) >= 0 || (null != (o = t.originalPrice) ? o : -1) >= 0 || (null != (s = t.sales) ? s : -1) >= 0 : (null != (h = t.recentAveragePrice) ? h : 0) > 0
                },
                ti = (0, p.withTranslations)(function(t) {
                    var e, i, r, n, l, h, c, d = t.resaleData,
                        u = t.isLimited2,
                        p = t.translate,
                        f = p(v),
                        g = function(t) {
                            if (Array.isArray(t)) return t
                        }(e = (0, s.useState)(m[m.length - 1])) || function(t) {
                            var e, i, r = null == t ? null : "u" > typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != r) {
                                var n = [],
                                    o = !0,
                                    s = !1;
                                try {
                                    for (r = r.call(t); !(o = (e = r.next()).done) && (n.push(e.value), 2 !== n.length); o = !0);
                                } catch (t) {
                                    s = !0, i = t
                                } finally {
                                    try {
                                        o || null == r.return || r.return()
                                    } finally {
                                        if (s) throw i
                                    }
                                }
                                return n
                            }
                        }(e) || function(t) {
                            if (t) {
                                if ("string" == typeof t) return J(t, 2);
                                var e = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === e && t.constructor && (e = t.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                                if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return J(t, 2)
                            }
                        }(e) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        y = g[0],
                        b = g[1],
                        x = (0, s.useRef)({
                            chartDataAvailable: (null != (i = null == (h = d.priceDataPoints) ? void 0 : h.length) ? i : 0) > 0 && (null != (r = null == (c = d.volumeDataPoints) ? void 0 : c.length) ? r : 0) > 0,
                            historicalDataAvailable: te(d, u)
                        }).current,
                        w = x.chartDataAvailable,
                        k = x.historicalDataAvailable,
                        S = u ? tt : Q;
                    return k ? (0, o.jsxs)("div", {
                        className: "section-content price-volume-charts-container",
                        children: [w && (0, o.jsxs)(a().Fragment, {
                            children: [(0, o.jsx)(Z, {
                                dayOptions: m,
                                selectedDays: y,
                                onSelect: b,
                                formatDays: function(t) {
                                    return p("Label.XDays", {
                                        numberOfDays: t
                                    })
                                }
                            }), (0, o.jsxs)("div", {
                                className: "price-chart-legend",
                                children: [(0, o.jsx)("div", {
                                    className: "line"
                                }), (0, o.jsx)("div", {
                                    className: "text-pastname legend-text",
                                    children: p("Label.RecentAveragePrice")
                                }), (0, o.jsx)("div", {
                                    className: "line volume"
                                }), (0, o.jsx)("div", {
                                    className: "text-pastname legend-text",
                                    children: p("Label.Volume")
                                })]
                            }), (0, o.jsx)(K, {
                                chartDataPoints: null != (n = d.priceDataPoints) ? n : [],
                                days: y
                            }), (0, o.jsx)(q, {
                                chartDataPoints: null != (l = d.volumeDataPoints) ? l : [],
                                days: y
                            })]
                        }), (0, o.jsxs)("div", {
                            className: "clearfix",
                            children: [(0, o.jsxs)("div", {
                                className: "price-chart-info-container clearfix",
                                children: [(0, o.jsx)("div", {
                                    className: "text-label",
                                    children: p("Label.QuantitySold")
                                }), (0, o.jsx)("div", {
                                    id: "item-quantity-sold",
                                    className: "text-lead info-content",
                                    children: S(d.sales, f)
                                })]
                            }), (0, o.jsxs)("div", {
                                className: "price-chart-info-container clearfix",
                                children: [(0, o.jsx)("div", {
                                    className: "text-label",
                                    children: p("Label.OriginalPrice")
                                }), (0, o.jsxs)("div", {
                                    id: "item-original-price",
                                    className: "info-content",
                                    children: [(0, o.jsx)("span", {
                                        id: "original-price-robux-icon",
                                        className: "icon-robux-20x20"
                                    }), (0, o.jsx)("span", {
                                        className: "text-robux",
                                        children: S(d.originalPrice, f)
                                    })]
                                })]
                            }), (0, o.jsxs)("div", {
                                className: "price-chart-info-container clearfix",
                                children: [(0, o.jsx)("div", {
                                    className: "text-label",
                                    children: p("Label.AveragePrice")
                                }), (0, o.jsxs)("div", {
                                    className: "info-content",
                                    children: [(0, o.jsx)("span", {
                                        className: "icon-robux-20x20"
                                    }), (0, o.jsx)("span", {
                                        id: "item-average-price",
                                        className: "text-robux",
                                        children: S(d.recentAveragePrice, f)
                                    })]
                                })]
                            })]
                        })]
                    }) : (0, o.jsx)("div", {
                        id: "no-price-chart-data",
                        className: "section-content-off",
                        children: p("Label.NoHistoricalData")
                    })
                }, C),
                tr = window.ReactStyleGuide,
                tn = window.CoreRobloxUtilities,
                to = function(t, e, i) {
                    return {
                        url: "".concat(P().apiGatewayUrl, "/product-experimentation-platform/v1/projects/").concat(t, "/layers/").concat(e, "/values?parameters=").concat(i.join(",")),
                        withCredentials: !0
                    }
                },
                ts = ["showResellerTradeButton"],
                ta = "AvatarMarketplace.UI",
                tl = "Roblox.AvatarMarketplace.showResellerTradeButton";

            function th(t, e, i, r, n, o, s) {
                try {
                    var a = t[o](s),
                        l = a.value
                } catch (t) {
                    i(t);
                    return
                }
                a.done ? e(l) : Promise.resolve(l).then(r, n)
            }

            function tc(t) {
                return function() {
                    var e = this,
                        i = arguments;
                    return new Promise(function(r, n) {
                        var o = t.apply(e, i);

                        function s(t) {
                            th(o, r, n, s, a, "next", t)
                        }

                        function a(t) {
                            th(o, r, n, s, a, "throw", t)
                        }
                        s(void 0)
                    })
                }
            }

            function td(t, e) {
                var i, r, n, o = {
                        label: 0,
                        sent: function() {
                            if (1 & n[0]) throw n[1];
                            return n[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    a = Object.defineProperty;
                return a(s, "next", {
                    value: l(0)
                }), a(s, "throw", {
                    value: l(1)
                }), a(s, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && a(s, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), s;

                function l(a) {
                    return function(l) {
                        var h = [a, l];
                        if (i) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, h[0] && (o = 0)), o;) try {
                            if (i = 1, r && (n = 2 & h[0] ? r.return : h[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, h[1])).done) return n;
                            switch (r = 0, n && (h = [2 & h[0], n.value]), h[0]) {
                                case 0:
                                case 1:
                                    n = h;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: h[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = h[1], h = [0];
                                    continue;
                                case 7:
                                    h = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(n = (n = o.trys).length > 0 && n[n.length - 1]) && (6 === h[0] || 2 === h[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === h[0] && (!n || h[1] > n[0] && h[1] < n[3])) {
                                        o.label = h[1];
                                        break
                                    }
                                    if (6 === h[0] && o.label < n[1]) {
                                        o.label = n[1], n = h;
                                        break
                                    }
                                    if (n && o.label < n[2]) {
                                        o.label = n[2], o.ops.push(h);
                                        break
                                    }
                                    n[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            h = e.call(t, o)
                        } catch (t) {
                            h = [6, t], r = 0
                        } finally {
                            i = n = 0
                        }
                        if (5 & h[0]) throw h[1];
                        return {
                            value: h[0] ? h[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var tu = function() {
                    var t = (0, g.isAuthenticated)() && Number((0, g.userId)());
                    return t ? "".concat(tl, ":").concat(t) : null
                },
                tp = function() {
                    var t, e = tu();
                    return e && null != (t = tn.localStorageService.getLocalStorage(e)) ? t : null
                },
                tf = function(t) {
                    var e = tu();
                    e && tn.localStorageService.setLocalStorage(e, t)
                },
                tg = function() {
                    return A.httpService.get(to(1, ta, ts))
                },
                tm = window.Roblox["core-scripts"].eventStream,
                tv = window.Roblox["core-scripts"].endpoints,
                ty = window.HeaderScripts;

            function tb(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, r = Array(e); i < e; i++) r[i] = t[i];
                return r
            }

            function tx(t) {
                return t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }
            var tw = function(t, e) {
                    var i = void 0 === t ? "undefined" : tx(t),
                        r = void 0 === e ? "undefined" : tx(e);
                    return i !== r ? i < r ? -1 : 1 : t === e ? 0 : t < e ? -1 : 1
                },
                tk = function(t) {
                    return ((function(t) {
                        if (Array.isArray(t)) return tb(t)
                    })(t) || function(t) {
                        if ("u" > typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                    }(t) || function(t) {
                        if (t) {
                            if ("string" == typeof t) return tb(t, void 0);
                            var e = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === e && t.constructor && (e = t.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                            if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return tb(t, void 0)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()).sort(function(t, e) {
                        return tw(t.price, e.price) || tw(t.userAssetId, e.userAssetId)
                    })
                },
                tS = window.RobloxThumbnails,
                tM = window.RobloxBadges,
                tC = function(t) {
                    return t.seller.id ? t.seller.id : t.seller.sellerId
                },
                tA = function(t) {
                    var e, i, r, n, s, a = t.resaleRecord,
                        l = t.assetData,
                        h = t.resaleData,
                        c = t.isLimited2,
                        d = t.showResellerTradeButton,
                        p = t.isPremiumUser,
                        f = t.authenticatedUserId,
                        g = t.resellerTradePermissions,
                        m = t.activeUpgradeTradeBtnId,
                        v = t.takeOffSaleDebounce,
                        y = t.onBuy,
                        b = t.onTradeClick,
                        x = t.onUpgradeClick,
                        w = t.onNonPremiumTradeClick,
                        k = t.onTakeOffSale,
                        S = t.getProfilePageUrl,
                        M = t.getUserTradeUrl,
                        C = t.getUpgradeToPremiumUrl,
                        A = t.formatNumber,
                        T = t.translate,
                        P = tC(a),
                        O = P === f,
                        I = !P || null == (e = null == (i = g[P]) ? void 0 : i.isFetching) || e,
                        L = !I && (!!P && (null == (r = g[P]) ? void 0 : r.canTrade) || !1),
                        D = (null == (n = a.discountInformation) ? void 0 : n.originalPrice) !== void 0 && null !== a.discountInformation.originalPrice && void 0 !== a.price && null !== a.price && a.discountInformation.originalPrice > a.price;
                    return (0, o.jsxs)("li", {
                        className: "reseller-item list-item",
                        children: [(0, o.jsx)("a", {
                            className: "list-header reseller-item-avatar",
                            href: S(P),
                            children: (0, o.jsx)(tS.Thumbnail2d, {
                                type: tS.ThumbnailTypes.avatarHeadshot,
                                targetId: null != P ? P : 0,
                                containerClass: "avatar-headshot-md"
                            })
                        }), (0, o.jsxs)("div", {
                            className: "resale-info",
                            children: [(0, o.jsxs)("div", {
                                className: "item-reseller-container",
                                children: [(0, o.jsx)("a", {
                                    className: "text-name username",
                                    href: S(P),
                                    children: a.seller.name
                                }), !!a.seller.hasVerifiedBadge && (0, o.jsx)(tM.VerifiedBadgeIconContainer, {
                                    size: tM.BadgeSizes.TITLE,
                                    overrideImgClass: "verified-badge-icon-item-resellers-rendered",
                                    titleText: a.seller.name
                                })]
                            }), (0, o.jsx)("span", {
                                className: "separator",
                                children: "-"
                            }), (0, o.jsx)("span", {
                                className: "font-caption-body serial-number",
                                children: a.serialNumber ? T("Label.SerialNumberOfTotal", {
                                    number: A(a.serialNumber),
                                    total: A(h.assetStock)
                                }) : T("Label.SerialNotAvailable")
                            }), (0, o.jsxs)("div", {
                                className: "reseller-price-container",
                                children: [(0, o.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, o.jsx)("span", {
                                    className: "icon-robux-28x28"
                                }), (0, o.jsx)("span", {
                                    className: "text-robux",
                                    children: A(a.price)
                                }), D && (0, o.jsxs)("span", {
                                    className: "reseller-original-price",
                                    children: [(0, o.jsx)("span", {
                                        className: "icon-robux-16x16"
                                    }), (0, o.jsx)("span", {
                                        children: A(null == (s = a.discountInformation) ? void 0 : s.originalPrice)
                                    })]
                                })]
                            })]
                        }), (0, o.jsxs)("div", {
                            className: u()("reseller-buttons-container", {
                                "has-trade-btn": d
                            }),
                            children: [d && p && (0, o.jsxs)("div", {
                                className: "trade-button-container",
                                children: [!O && (0, o.jsx)("a", {
                                    className: u()("btn-min-width", "btn-control-md", "reseller-trade-link", {
                                        "fetching-trade-permissions": I
                                    }),
                                    href: M(P, a.userAssetId),
                                    "aria-disabled": !L,
                                    onClick: function() {
                                        b(a)
                                    },
                                    children: T("Action.Trade")
                                }), I && (0, o.jsx)("div", {
                                    className: "spinner-circle spinner-no-margin"
                                })]
                            }), d && !p && (0, o.jsxs)("div", {
                                className: "trade-button-container",
                                children: [(0, o.jsxs)("div", {
                                    className: u()("popover", "top", "fade", "in", {
                                        show: m === a.userAssetId
                                    }),
                                    children: [(0, o.jsx)("div", {
                                        className: "arrow"
                                    }), (0, o.jsx)("div", {
                                        className: "popover-inner",
                                        children: (0, o.jsxs)("div", {
                                            className: "popover-content",
                                            children: [(0, o.jsxs)("h3", {
                                                children: [(0, o.jsx)("span", {
                                                    className: "icon-premium-small"
                                                }), (0, o.jsx)("span", {
                                                    children: T("Error.RequiresPremiumMembership")
                                                })]
                                            }), (0, o.jsx)("p", {
                                                children: T("Description.TradeBenefit")
                                            }), (0, o.jsx)("a", {
                                                className: "btn-growth-sm btn-full-width upgrade",
                                                href: C(),
                                                target: "_self",
                                                onClick: function() {
                                                    x(a)
                                                },
                                                children: T("Action.Upgrade")
                                            })]
                                        })
                                    })]
                                }), !O && (0, o.jsx)("button", {
                                    type: "button",
                                    className: "btn-min-width btn-control-md reseller-trade-link",
                                    onClick: function() {
                                        w(a)
                                    },
                                    children: T("Action.Trade")
                                })]
                            }), !O && !c && (0, o.jsx)("button", {
                                type: "button",
                                className: "reseller-purchase-button btn-min-width btn-buy-md",
                                "data-button-type": "reseller",
                                "data-expected-price": a.price,
                                "data-expected-seller-id": P,
                                "data-seller-name": a.seller.name,
                                "data-userasset-id": a.userAssetId,
                                "data-product-id": l.productId,
                                "data-item-id": l.id,
                                "data-item-name": l.name,
                                "data-asset-type": l.type,
                                "data-bc-requirement": l.membershipRequirement,
                                "data-expected-currency": "1",
                                onClick: function() {
                                    y(a)
                                },
                                children: T("Action.Buy")
                            }), !O && c && (0, o.jsx)("button", {
                                type: "button",
                                className: "reseller-purchase-button btn-min-width btn-buy-md",
                                onClick: function() {
                                    y(a)
                                },
                                children: T("Action.Buy")
                            }), O && (0, o.jsx)("button", {
                                type: "button",
                                className: "remove-sale btn-control-md btn-min-width",
                                "data-button-type": "reseller",
                                disabled: !!v[String(a.userAssetId)],
                                onClick: function() {
                                    k(a)
                                },
                                children: T("Action.Remove")
                            })]
                        })]
                    })
                };

            function tT(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, r = Array(e); i < e; i++) r[i] = t[i];
                return r
            }

            function tP(t, e, i) {
                return e in t ? Object.defineProperty(t, e, {
                    value: i,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[e] = i, t
            }

            function tO(t) {
                for (var e = 1; e < arguments.length; e++) {
                    var i = null != arguments[e] ? arguments[e] : {},
                        r = Object.keys(i);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(i).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(i, t).enumerable
                    }))), r.forEach(function(e) {
                        tP(t, e, i[e])
                    })
                }
                return t
            }

            function tI(t, e) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, e) {
                    var i, r, n = null == t ? null : "u" > typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != n) {
                        var o = [],
                            s = !0,
                            a = !1;
                        try {
                            for (n = n.call(t); !(s = (i = n.next()).done) && (o.push(i.value), !e || o.length !== e); s = !0);
                        } catch (t) {
                            a = !0, r = t
                        } finally {
                            try {
                                s || null == n.return || n.return()
                            } finally {
                                if (a) throw r
                            }
                        }
                        return o
                    }
                }(t, e) || function(t, e) {
                    if (t) {
                        if ("string" == typeof t) return tT(t, e);
                        var i = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === i && t.constructor && (i = t.constructor.name), "Map" === i || "Set" === i) return Array.from(i);
                        if ("Arguments" === i || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(i)) return tT(t, e)
                    }
                }(t, e) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tL = (0, p.withTranslations)(function(t) {
                var e = t.resaleData,
                    i = t.assetData,
                    r = t.resaleRecords,
                    n = t.resellerTradePermissions,
                    a = t.showResellerTradeButton,
                    l = t.isLimited2,
                    h = t.itemType,
                    c = t.onRecordRemoved,
                    d = t.onTakeOffSaleFailure,
                    u = t.translate,
                    p = u(v),
                    f = tI((0, s.useState)(null), 2),
                    m = f[0],
                    w = f[1],
                    k = tI((0, s.useState)({}), 2),
                    C = k[0],
                    T = k[1],
                    P = (0, s.useRef)(m);
                P.current = m;
                var O = (0, s.useRef)((0, g.isPremiumUser)()).current,
                    L = (0, s.useRef)(Number((0, g.userId)())).current,
                    D = (0, s.useCallback)(function(t) {
                        return null != t && t > 0 ? A.numberFormat.getNumberFormat(t) : p
                    }, [p]),
                    E = (0, s.useCallback)(function(t, e) {
                        var r = [
                            ["assetId", i.id],
                            ["sellerAssetId", t.userAssetId],
                            ["sellerUserId", t.seller.id],
                            ["sellerAssetPrice", t.price],
                            ["btn", e]
                        ].filter(function(t) {
                            return void 0 !== t[1] && null !== t[1]
                        });
                        r.length && (0, tm.sendEventWithTarget)(tm.eventTypes.buttonClick, b.resellersList, Object.fromEntries(r))
                    }, [i.id]),
                    j = (0, s.useCallback)(function(t) {
                        window.dispatchEvent(new CustomEvent(S, {
                            detail: {
                                identifier: M,
                                name: i.name,
                                itemType: h,
                                assetId: i.id,
                                productId: i.productId,
                                assetType: i.type,
                                expectedCurrency: 1,
                                expectedPrice: t.price,
                                expectedPurchaserId: ty.authenticatedUser.id,
                                expectedPurchaserType: "User",
                                expectedSellerId: tC(t),
                                expectedSellerName: t.seller.name,
                                userAssetId: t.userAssetId,
                                refreshPage: !0,
                                resalePurchase: !0
                            }
                        })), E(t, x.buyBtn)
                    }, [i, h, E]),
                    N = (0, s.useCallback)(function(t) {
                        var r = A.uuidService.generateRandomUuid();
                        window.dispatchEvent(new CustomEvent(S, {
                            detail: {
                                identifier: M,
                                name: i.name,
                                itemType: h,
                                assetId: i.id,
                                productId: void 0,
                                assetType: e.assetType,
                                collectibleItemId: e.collectibleItemId,
                                collectibleItemInstanceId: t.collectibleItemInstanceId,
                                collectibleProductId: t.collectibleProductId,
                                expectedCurrency: 1,
                                expectedPrice: t.price,
                                expectedPurchaserId: ty.authenticatedUser.id,
                                expectedPurchaserType: "User",
                                expectedSellerId: t.seller.sellerId,
                                expectedSellerName: t.seller.name,
                                expectedSellerType: t.seller.sellerType,
                                idempotencyKey: r,
                                refreshPage: !0,
                                resalePurchase: !0
                            }
                        }))
                    }, [i, h, e]),
                    R = (0, s.useCallback)(function(t) {
                        var i, r = function() {
                                d(u(y))
                            },
                            n = function(t) {
                                T(function(e) {
                                    var i = tO({}, e);
                                    return delete i[t], i
                                })
                            };
                        if (!l) return void r();
                        var o = String(t.collectibleProductId);
                        T(function(t) {
                            var e, i;
                            return e = tO({}, t), i = null != (i = tP({}, o, !0)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(i)) : (function(t) {
                                var e = Object.keys(t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(t);
                                    e.push.apply(e, i)
                                }
                                return e
                            })(Object(i)).forEach(function(t) {
                                Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(i, t))
                            }), e
                        }), I(null != (i = e.collectibleItemId) ? i : "", t, ty.authenticatedUser.id).then(function() {
                            n(o), c(t)
                        }).catch(function() {
                            n(o), r()
                        })
                    }, [i.id, l, c, d, e, u]),
                    B = (0, s.useCallback)(function(t) {
                        var e;
                        P.current === t.userAssetId ? w(null) : (w(null != (e = t.userAssetId) ? e : null), E(t, x.nonPremiumTradeBtn))
                    }, [E]);
                return (0, s.useEffect)(function() {
                    var t = function(t) {
                        if (P.current) {
                            var e = !1;
                            document.querySelectorAll(".trade-button-container").forEach(function(i) {
                                i.contains(t.target) && (e = !0)
                            }), e || w(null)
                        }
                    };
                    return window.addEventListener("click", t, !0),
                        function() {
                            window.removeEventListener("click", t, !0)
                        }
                }, []), (0, o.jsx)("ul", {
                    className: "vlist",
                    children: tk(r).map(function(t) {
                        return (0, o.jsx)(tA, {
                            resaleRecord: t,
                            assetData: i,
                            resaleData: e,
                            isLimited2: l,
                            showResellerTradeButton: a,
                            isPremiumUser: O,
                            authenticatedUserId: L,
                            resellerTradePermissions: n,
                            activeUpgradeTradeBtnId: m,
                            takeOffSaleDebounce: C,
                            onBuy: l ? N : j,
                            onTradeClick: function(t) {
                                E(t, x.tradeBtn)
                            },
                            onUpgradeClick: function(t) {
                                E(t, x.upgradeBtn)
                            },
                            onNonPremiumTradeClick: B,
                            onTakeOffSale: R,
                            getProfilePageUrl: function(t) {
                                return (0, tv.getAbsoluteUrl)("/users/".concat(t, "/profile"))
                            },
                            getUserTradeUrl: function(t, e) {
                                return (0, tv.getAbsoluteUrl)("/users/".concat(t, "/trade?ritems=").concat(e))
                            },
                            getUpgradeToPremiumUrl: function() {
                                return (0, tv.getAbsoluteUrl)("/premium/membership?ctx=trade#premium-memberships")
                            },
                            formatNumber: D,
                            translate: u
                        }, l ? String(t.collectibleItemInstanceId) : String(t.userAssetId))
                    })
                })
            }, C);

            function tD(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, r = Array(e); i < e; i++) r[i] = t[i];
                return r
            }

            function tE(t, e, i, r, n, o, s) {
                try {
                    var a = t[o](s),
                        l = a.value
                } catch (t) {
                    i(t);
                    return
                }
                a.done ? e(l) : Promise.resolve(l).then(r, n)
            }

            function tj(t) {
                return function() {
                    var e = this,
                        i = arguments;
                    return new Promise(function(r, n) {
                        var o = t.apply(e, i);

                        function s(t) {
                            tE(o, r, n, s, a, "next", t)
                        }

                        function a(t) {
                            tE(o, r, n, s, a, "throw", t)
                        }
                        s(void 0)
                    })
                }
            }

            function tN(t) {
                for (var e = 1; e < arguments.length; e++) {
                    var i = null != arguments[e] ? arguments[e] : {},
                        r = Object.keys(i);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(i).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(i, t).enumerable
                    }))), r.forEach(function(e) {
                        var r;
                        r = i[e], e in t ? Object.defineProperty(t, e, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[e] = r
                    })
                }
                return t
            }

            function tR(t, e) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, e) {
                    var i, r, n = null == t ? null : "u" > typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != n) {
                        var o = [],
                            s = !0,
                            a = !1;
                        try {
                            for (n = n.call(t); !(s = (i = n.next()).done) && (o.push(i.value), !e || o.length !== e); s = !0);
                        } catch (t) {
                            a = !0, r = t
                        } finally {
                            try {
                                s || null == n.return || n.return()
                            } finally {
                                if (a) throw r
                            }
                        }
                        return o
                    }
                }(t, e) || tz(t, e) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tB(t) {
                return function(t) {
                    if (Array.isArray(t)) return tD(t)
                }(t) || function(t) {
                    if ("u" > typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || tz(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tz(t, e) {
                if (t) {
                    if ("string" == typeof t) return tD(t, e);
                    var i = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === i && t.constructor && (i = t.constructor.name), "Map" === i || "Set" === i) return Array.from(i);
                    if ("Arguments" === i || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(i)) return tD(t, e)
                }
            }

            function tG(t, e) {
                var i, r, n, o = {
                        label: 0,
                        sent: function() {
                            if (1 & n[0]) throw n[1];
                            return n[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    a = Object.defineProperty;
                return a(s, "next", {
                    value: l(0)
                }), a(s, "throw", {
                    value: l(1)
                }), a(s, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && a(s, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), s;

                function l(a) {
                    return function(l) {
                        var h = [a, l];
                        if (i) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, h[0] && (o = 0)), o;) try {
                            if (i = 1, r && (n = 2 & h[0] ? r.return : h[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, h[1])).done) return n;
                            switch (r = 0, n && (h = [2 & h[0], n.value]), h[0]) {
                                case 0:
                                case 1:
                                    n = h;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: h[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = h[1], h = [0];
                                    continue;
                                case 7:
                                    h = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(n = (n = o.trys).length > 0 && n[n.length - 1]) && (6 === h[0] || 2 === h[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === h[0] && (!n || h[1] > n[0] && h[1] < n[3])) {
                                        o.label = h[1];
                                        break
                                    }
                                    if (6 === h[0] && o.label < n[1]) {
                                        o.label = n[1], n = h;
                                        break
                                    }
                                    if (n && o.label < n[2]) {
                                        o.label = n[2], o.ops.push(h);
                                        break
                                    }
                                    n[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            h = e.call(t, o)
                        } catch (t) {
                            h = [6, t], r = 0
                        } finally {
                            i = n = 0
                        }
                        if (5 & h[0]) throw h[1];
                        return {
                            value: h[0] ? h[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var tW = tR((0, tr.createSystemFeedback)(), 2),
                tH = tW[0],
                tF = tW[1],
                tX = (0, p.withTranslations)(function(t) {
                    var e = t.resaleData,
                        i = t.assetData,
                        r = t.economyMetadata,
                        n = t.isLimited2,
                        l = t.itemType,
                        h = t.translate,
                        c = tR((0, s.useState)([]), 2),
                        d = c[0],
                        u = c[1],
                        p = tR((0, s.useState)(!1), 2),
                        f = p[0],
                        g = p[1],
                        m = tR((0, s.useState)(!1), 2),
                        v = m[0],
                        y = m[1],
                        b = tR((0, s.useState)(!1), 2),
                        x = b[0],
                        w = b[1],
                        k = tR((0, s.useState)({}), 2),
                        S = k[0],
                        M = k[1],
                        C = (0, s.useRef)({}),
                        T = (0, s.useRef)({}),
                        P = (0, s.useCallback)(function(t) {
                            return tj(function() {
                                return tG(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            var i;
                                            return e.trys.push([0, 2, , 3]), [4, (i = t, A.httpService.get(O.getCanTradeWith(i), {}).then(function(t) {
                                                return t.data
                                            }))];
                                        case 1:
                                            return [2, {
                                                sellerId: t,
                                                permissions: e.sent()
                                            }];
                                        case 2:
                                            return [2, {
                                                sellerId: t,
                                                error: e.sent()
                                            }];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        }, []),
                        I = (0, s.useCallback)(function(t) {
                            return tj(function() {
                                var e, i, r;
                                return tG(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (!t.length) return [2];
                                            return e = 5, [4, Promise.all(t.slice(0, e).map(P))];
                                        case 1:
                                            return i = n.sent(), r = {}, i.forEach(function(t) {
                                                var e = t.sellerId,
                                                    i = t.permissions,
                                                    n = t.error;
                                                r[e] = {
                                                    isFetching: !1,
                                                    canTrade: !!(null == i ? void 0 : i.canTrade),
                                                    error: null != n ? n : null
                                                }
                                            }), T.current = tN({}, T.current, r), M(T.current), [4, I(t.slice(e))];
                                        case 2:
                                            return n.sent(), [2]
                                    }
                                })
                            })()
                        }, [P]),
                        L = (0, s.useCallback)(function(t) {
                            return tj(function() {
                                var e, i;
                                return tG(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (!t.length) return [2];
                                            return e = t.map(function(t) {
                                                var e;
                                                return null == (e = t.seller) ? void 0 : e.id
                                            }).filter(function(t) {
                                                return !!t && !T.current[t]
                                            }), i = {}, e.forEach(function(t) {
                                                T.current[t] || (i[t] = {
                                                    isFetching: !0,
                                                    canTrade: !1
                                                })
                                            }), T.current = tN({}, T.current, i), M(T.current), [4, I(e)];
                                        case 1:
                                            return r.sent(), [2]
                                    }
                                })
                            })()
                        }, [I]),
                        D = (0, s.useRef)(new A.CursorPager(10, 100, function(t) {
                            var i, r, n;
                            return e.collectibleItemId ? (i = e.collectibleItemId, r = t.cursor, n = t.count, A.httpService.get(O.getResellersForLimited2Item(i), {
                                cursor: r,
                                limit: n
                            }).then(function(t) {
                                return t.data
                            })).then(function(t) {
                                return {
                                    nextPageCursor: "" !== t.nextPageCursor ? t.nextPageCursor : void 0,
                                    items: t.data
                                }
                            }) : Promise.resolve({
                                items: []
                            })
                        })),
                        E = (0, s.useCallback)(function(t) {
                            g(!1);
                            var e = [];
                            t.forEach(function(t) {
                                var i = String(n ? t.collectibleItemInstanceId : t.userAssetId),
                                    r = C.current[i];
                                if (r) {
                                    r.price = t.price, r.seller = t.seller;
                                    return
                                }
                                C.current[i] = t, e.push(t)
                            }), u(function(t) {
                                return tB(t).concat(tB(e))
                            }), y(D.current.canLoadNextPage), L(t)
                        }, [L, n]),
                        j = (0, s.useCallback)(function(t) {
                            var e = (null !== A.cursorPaginationConstants && void 0 !== A.cursorPaginationConstants ? A.cursorPaginationConstants : {}).errorType;
                            null != t && t.type && t.type === (null == e ? void 0 : e.pagingParametersChanged) || g(!1)
                        }, []),
                        N = (0, s.useCallback)(function() {
                            g(!0), D.current.loadNextPage().then(E).catch(j)
                        }, [E, j]);
                    (0, s.useEffect)(function() {
                        tc(function() {
                            var t, e, i, r;
                            return td(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        if ("boolean" == typeof(e = tp())) return tc(function() {
                                            var t, e;
                                            return td(this, function(i) {
                                                switch (i.label) {
                                                    case 0:
                                                        return [4, tg()];
                                                    case 1:
                                                        return "boolean" != typeof(null == (e = i.sent()) || null == (t = e.data) ? void 0 : t.showResellerTradeButton) && tf(""), [2]
                                                }
                                            })
                                        })(), [2, e];
                                        return [4, tg()];
                                    case 1:
                                        return "boolean" == typeof(r = null == (i = n.sent()) || null == (t = i.data) ? void 0 : t.showResellerTradeButton) && tf(r), [2, r]
                                }
                            })
                        })().then(function(t) {
                            w(null != t && t)
                        }).catch(function() {}), D.current.loadFirstPage().then(E).catch(j)
                    }, []);
                    var R = (0, s.useCallback)(function(t) {
                            u(function(e) {
                                return e.filter(function(e) {
                                    return e !== t
                                })
                            })
                        }, []),
                        B = (0, s.useCallback)(function(t) {
                            tF.warning(t, 0, 5e3)
                        }, []);
                    return (0, o.jsxs)("div", {
                        className: "remove-panel section-content",
                        children: [(0, o.jsx)(tH, {}), (0, o.jsx)("div", {
                            id: "angular-react-purchase-handoff",
                            "data-identifier": "limited-reseller-list"
                        }), r.purchasingEnabled ? (0, o.jsxs)(a().Fragment, {
                            children: [(0, o.jsxs)("div", {
                                className: "resellers",
                                children: [(0, o.jsx)(tL, {
                                    resaleData: e,
                                    assetData: i,
                                    resaleRecords: d,
                                    resellerTradePermissions: S,
                                    showResellerTradeButton: x,
                                    isLimited2: n,
                                    itemType: l,
                                    onRecordRemoved: R,
                                    onTakeOffSaleFailure: B
                                }), f && (0, o.jsx)("span", {
                                    className: "spinner spinner-default"
                                })]
                            }), v && (0, o.jsx)("button", {
                                className: "btn-control-sm see-more-resellers",
                                type: "button",
                                onClick: N,
                                children: h("Label.SeeMore")
                            }), !f && 0 === d.length && (0, o.jsx)("div", {
                                className: "section-content-off",
                                children: h("Message.NoOneSelling")
                            })]
                        }) : (0, o.jsx)("div", {
                            className: "section-content-off",
                            children: h("Message.EconomyDisabled")
                        })]
                    })
                }, C);

            function tY(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, r = Array(e); i < e; i++) r[i] = t[i];
                return r
            }

            function tV(t) {
                for (var e = 1; e < arguments.length; e++) {
                    var i = null != arguments[e] ? arguments[e] : {},
                        r = Object.keys(i);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(i).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(i, t).enumerable
                    }))), r.forEach(function(e) {
                        var r;
                        r = i[e], e in t ? Object.defineProperty(t, e, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[e] = r
                    })
                }
                return t
            }

            function tU(t, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(e)) : (function(t) {
                    var e = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        e.push.apply(e, i)
                    }
                    return e
                })(Object(e)).forEach(function(i) {
                    Object.defineProperty(t, i, Object.getOwnPropertyDescriptor(e, i))
                }), t
            }

            function t_(t, e) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, e) {
                    var i, r, n = null == t ? null : "u" > typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != n) {
                        var o = [],
                            s = !0,
                            a = !1;
                        try {
                            for (n = n.call(t); !(s = (i = n.next()).done) && (o.push(i.value), !e || o.length !== e); s = !0);
                        } catch (t) {
                            a = !0, r = t
                        } finally {
                            try {
                                s || null == n.return || n.return()
                            } finally {
                                if (a) throw r
                            }
                        }
                        return o
                    }
                }(t, e) || function(t, e) {
                    if (t) {
                        if ("string" == typeof t) return tY(t, e);
                        var i = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === i && t.constructor && (i = t.constructor.name), "Map" === i || "Set" === i) return Array.from(i);
                        if ("Arguments" === i || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(i)) return tY(t, e)
                    }
                }(t, e) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tK(t, e, i, r, n, o, s) {
                try {
                    var a = t[o](s),
                        l = a.value
                } catch (t) {
                    i(t);
                    return
                }
                a.done ? e(l) : Promise.resolve(l).then(r, n)
            }

            function tq() {
                return null != n || (n = "".concat(P().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), n
            }
            var t$ = function() {};

            function tZ(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, r = Array(e); i < e; i++) r[i] = t[i];
                return r
            }

            function tJ(t) {
                return t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }
            var tQ = function(t, e) {
                    return t << 3 | e
                },
                t0 = tQ(1, 2),
                t1 = tQ(2, 2),
                t2 = tQ(5, 2),
                t3 = tQ(6, 2),
                t5 = tQ(8, 2),
                t6 = tQ(1, 2),
                t9 = tQ(2, 1),
                t8 = tQ(3, 0),
                t4 = tQ(5, 2);
            tQ(1, 2), tQ(2, 1), tQ(3, 0), tQ(4, 2), tQ(5, 2), tQ(6, 0), tQ(8, 2);
            var t7 = tQ(4, 0),
                et = tQ(6, 2),
                ee = tQ(7, 2);
            tQ(1, 0), tQ(2, 2);
            var ei = tQ(1, 2),
                er = tQ(2, 2),
                en = tQ(1, 2);
            tQ(1, 2), tQ(2, 2), tQ(1, 2);
            var eo = new TextEncoder,
                es = function() {
                    var t;

                    function e() {
                        var t;
                        if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
                        t = [], "buf" in this ? Object.defineProperty(this, "buf", {
                            value: t,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : this.buf = t
                    }
                    return t = [{
                            key: "writeVarint",
                            value: function(t) {
                                var e = (void 0 === t ? "undefined" : tJ(t)) === "bigint" ? t : BigInt(Math.trunc(t));
                                for (e < BigInt(0) && (e += BigInt(1) << BigInt(64)); e > BigInt(127);) this.buf.push(128 | Number(e & BigInt(127))), e >>= BigInt(7);
                                this.buf.push(Number(e))
                            }
                        }, {
                            key: "writeString",
                            value: function(t) {
                                var e = eo.encode(t);
                                this.writeVarint(e.length);
                                var i = !0,
                                    r = !1,
                                    n = void 0;
                                try {
                                    for (var o, s = e[Symbol.iterator](); !(i = (o = s.next()).done); i = !0) {
                                        var a = o.value;
                                        this.buf.push(a)
                                    }
                                } catch (t) {
                                    r = !0, n = t
                                } finally {
                                    try {
                                        i || null == s.return || s.return()
                                    } finally {
                                        if (r) throw n
                                    }
                                }
                            }
                        }, {
                            key: "writeBytes",
                            value: function(t) {
                                this.writeVarint(t.length);
                                var e = !0,
                                    i = !1,
                                    r = void 0;
                                try {
                                    for (var n, o = t[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                                        var s = n.value;
                                        this.buf.push(s)
                                    }
                                } catch (t) {
                                    i = !0, r = t
                                } finally {
                                    try {
                                        e || null == o.return || o.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                            }
                        }, {
                            key: "writeDouble",
                            value: function(t) {
                                var e = new DataView(new ArrayBuffer(8));
                                e.setFloat64(0, t, !0);
                                for (var i = 0; i < 8; i += 1) this.buf.push(e.getUint8(i))
                            }
                        }, {
                            key: "toBytes",
                            value: function() {
                                return new Uint8Array(this.buf)
                            }
                        }],
                        function(t, e) {
                            for (var i = 0; i < e.length; i++) {
                                var r = e[i];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(t, r.key, r)
                            }
                        }(e.prototype, t), e
                }();

            function ea(t, e, i) {
                var r = new es;
                return r.writeVarint(tQ(1, 2)), r.writeString(t), r.writeVarint(e), i(r), r.toBytes()
            }

            function el(t) {
                var e = new es;
                if (e.writeVarint(t6), e.writeString(t.name), e.writeVarint(t9), e.writeDouble(t.value), e.writeVarint(t8), e.writeVarint(t.timestampMs), t.attributes && Object.keys(t.attributes).length > 0) {
                    var i = function(t) {
                        var e = new es,
                            i = !0,
                            r = !1,
                            n = void 0;
                        try {
                            for (var o, s = Object.entries(t)[Symbol.iterator](); !(i = (o = s.next()).done); i = !0) ! function() {
                                var t, i = (t = o.value, function(t) {
                                        if (Array.isArray(t)) return t
                                    }(t) || function(t) {
                                        var e, i, r = null == t ? null : "u" > typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                                        if (null != r) {
                                            var n = [],
                                                o = !0,
                                                s = !1;
                                            try {
                                                for (r = r.call(t); !(o = (e = r.next()).done) && (n.push(e.value), 2 !== n.length); o = !0);
                                            } catch (t) {
                                                s = !0, i = t
                                            } finally {
                                                try {
                                                    o || null == r.return || r.return()
                                                } finally {
                                                    if (s) throw i
                                                }
                                            }
                                            return n
                                        }
                                    }(t) || function(t) {
                                        if (t) {
                                            if ("string" == typeof t) return tZ(t, 2);
                                            var e = Object.prototype.toString.call(t).slice(8, -1);
                                            if ("Object" === e && t.constructor && (e = t.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                                            if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return tZ(t, 2)
                                        }
                                    }(t) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    r = i[0],
                                    n = i[1];
                                if ("string" == typeof n) {
                                    var s = ea(r, tQ(2, 2), function(t) {
                                        t.writeString(n)
                                    });
                                    e.writeVarint(t2), e.writeBytes(s)
                                } else if ("boolean" == typeof n) {
                                    var a = ea(r, tQ(2, 0), function(t) {
                                        t.writeVarint(+!!n)
                                    });
                                    e.writeVarint(t3), e.writeBytes(a)
                                } else if ((void 0 === n ? "undefined" : tJ(n)) === "bigint") {
                                    var l = ea(r, tQ(2, 0), function(t) {
                                        t.writeVarint(n)
                                    });
                                    e.writeVarint(t1), e.writeBytes(l)
                                } else if ("number" == typeof n)
                                    if (Number.isFinite(n))
                                        if (Number.isInteger(n) && n >= -0x80000000 && n <= 0x7fffffff) {
                                            var h = ea(r, tQ(2, 0), function(t) {
                                                t.writeVarint(n)
                                            });
                                            e.writeVarint(t0), e.writeBytes(h)
                                        } else if (Number.isInteger(n)) {
                                    var c = ea(r, tQ(2, 0), function(t) {
                                        t.writeVarint(BigInt(n))
                                    });
                                    e.writeVarint(t1), e.writeBytes(c)
                                } else {
                                    var d = ea(r, tQ(2, 1), function(t) {
                                        t.writeDouble(n)
                                    });
                                    e.writeVarint(t5), e.writeBytes(d)
                                } else {
                                    var u = ea(r, tQ(2, 2), function(t) {
                                        t.writeString(String(n))
                                    });
                                    e.writeVarint(t2), e.writeBytes(u)
                                }
                            }()
                        } catch (t) {
                            r = !0, n = t
                        } finally {
                            try {
                                i || null == s.return || s.return()
                            } finally {
                                if (r) throw n
                            }
                        }
                        return e.toBytes()
                    }(t.attributes);
                    e.writeVarint(t4), e.writeBytes(i)
                }
                return e.toBytes()
            }

            function eh(t, e, i) {
                var r = new es;
                r.writeVarint(t7), r.writeVarint(i);
                var n = !0,
                    o = !1,
                    s = void 0;
                try {
                    for (var a, l = t[Symbol.iterator](); !(n = (a = l.next()).done); n = !0) {
                        var h = a.value;
                        r.writeVarint(et), r.writeBytes(h)
                    }
                } catch (t) {
                    o = !0, s = t
                } finally {
                    try {
                        n || null == l.return || l.return()
                    } finally {
                        if (o) throw s
                    }
                }
                var c = !0,
                    d = !1,
                    u = void 0;
                try {
                    for (var p, f = e[Symbol.iterator](); !(c = (p = f.next()).done); c = !0) {
                        var g = p.value;
                        r.writeVarint(ee), r.writeBytes(g)
                    }
                } catch (t) {
                    d = !0, u = t
                } finally {
                    try {
                        c || null == f.return || f.return()
                    } finally {
                        if (d) throw u
                    }
                }
                return r.toBytes()
            }

            function ec(t) {
                var e = new es;
                e.writeVarint(ei), e.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), e.writeVarint(er), e.writeBytes(t);
                var i = e.toBytes(),
                    r = new es;
                return r.writeVarint(en), r.writeBytes(i), r.toBytes()
            }
            var ed = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function eu(t) {
                return ed.test(t)
            }
            var ep = [],
                ef = !1,
                eg = !1;

            function em(t, e) {
                var i, r, n, o = t.map(function(t) {
                        return {
                            name: t.name,
                            value: t.value,
                            timestampMs: t.timestampMs,
                            attributes: t.attributes
                        }
                    }),
                    s = BigInt(Date.now());
                !0 === e || eg || "u" > typeof document && "hidden" === document.visibilityState ? (i = ec(eh(o.map(el), [], s)).buffer, fetch("".concat(tq()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: i,
                    credentials: "include",
                    keepalive: !0
                }).catch(t$)) : (r = ec(eh(o.map(el), [], s)), (n = function() {
                    var t, e, i, n, o, s, a, l, h, c, d, u, p;
                    return function(t, e) {
                        var i, r, n, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & n[0]) throw n[1];
                                    return n[1]
                                },
                                trys: [],
                                ops: []
                            },
                            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            a = Object.defineProperty;
                        return a(s, "next", {
                            value: l(0)
                        }), a(s, "throw", {
                            value: l(1)
                        }), a(s, "return", {
                            value: l(2)
                        }), "function" == typeof Symbol && a(s, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), s;

                        function l(a) {
                            return function(l) {
                                var h = [a, l];
                                if (i) throw TypeError("Generator is already executing.");
                                for (; s && (s = 0, h[0] && (o = 0)), o;) try {
                                    if (i = 1, r && (n = 2 & h[0] ? r.return : h[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, h[1])).done) return n;
                                    switch (r = 0, n && (h = [2 & h[0], n.value]), h[0]) {
                                        case 0:
                                        case 1:
                                            n = h;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: h[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, r = h[1], h = [0];
                                            continue;
                                        case 7:
                                            h = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(n = (n = o.trys).length > 0 && n[n.length - 1]) && (6 === h[0] || 2 === h[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === h[0] && (!n || h[1] > n[0] && h[1] < n[3])) {
                                                o.label = h[1];
                                                break
                                            }
                                            if (6 === h[0] && o.label < n[1]) {
                                                o.label = n[1], n = h;
                                                break
                                            }
                                            if (n && o.label < n[2]) {
                                                o.label = n[2], o.ops.push(h);
                                                break
                                            }
                                            n[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    h = e.call(t, o)
                                } catch (t) {
                                    h = [6, t], r = 0
                                } finally {
                                    i = n = 0
                                }
                                if (5 & h[0]) throw h[1];
                                return {
                                    value: h[0] ? h[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(f) {
                        switch (f.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: r.buffer,
                                    compressed: !1
                                }];
                                return (e = (t = new CompressionStream("gzip")).writable.getWriter()).write(r).catch(t$), e.close().catch(t$), i = [], [4, (n = t.readable.getReader()).read()];
                            case 1:
                                o = f.sent(), f.label = 2;
                            case 2:
                                if (o.done) return [3, 4];
                                return i.push(o.value), [4, n.read()];
                            case 3:
                                return o = f.sent(), [3, 2];
                            case 4:
                                s = new Uint8Array(i.reduce(function(t, e) {
                                    return t + e.length
                                }, 0)), a = 0, l = !0, h = !1, c = void 0;
                                try {
                                    for (d = i[Symbol.iterator](); !(l = (u = d.next()).done); l = !0) p = u.value, s.set(p, a), a += p.length
                                } catch (t) {
                                    h = !0, c = t
                                } finally {
                                    try {
                                        l || null == d.return || d.return()
                                    } finally {
                                        if (h) throw c
                                    }
                                }
                                return [2, {
                                    body: s.buffer,
                                    compressed: !0
                                }]
                        }
                    })
                }, function() {
                    var t = this,
                        e = arguments;
                    return new Promise(function(i, r) {
                        var o = n.apply(t, e);

                        function s(t) {
                            tK(o, i, r, s, a, "next", t)
                        }

                        function a(t) {
                            tK(o, i, r, s, a, "throw", t)
                        }
                        s(void 0)
                    })
                })()).then(function(t) {
                    var e = t.body,
                        i = t.compressed,
                        r = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return i && (r["Content-Encoding"] = "gzip"), fetch("".concat(tq()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: r,
                        body: e,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(t$)
            }

            function ev() {
                var t = !0,
                    e = !1,
                    i = void 0;
                try {
                    for (var r, n = ep[Symbol.iterator](); !(t = (r = n.next()).done); t = !0) {
                        var o = r.value.splice(0);
                        0 !== o.length && em(o, !0)
                    }
                } catch (t) {
                    e = !0, i = t
                } finally {
                    try {
                        t || null == n.return || n.return()
                    } finally {
                        if (e) throw i
                    }
                }
            }
            var ey = function(t) {
                var e = t.publish,
                    i = t.captureException,
                    r = t.featureName;

                function n(t, e, n) {
                    if (null != n) {
                        var o, s = (null != (o = Error) && "u" > typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](n) : n instanceof o) ? n.name || "Error" : "UnknownError",
                            a = r ? "".concat(r, "_").concat(t) : t;
                        return null == i || i(n, {
                            error_counter: a
                        }), tU(tV({}, e), {
                            errorType: s
                        })
                    }
                    return e
                }
                return {
                    trackCounter: function() {
                        for (var t = arguments.length, i = Array(t), r = 0; r < t; r++) i[r] = arguments[r];
                        var n = t_(i, 2);
                        e(n[0], n[1])
                    },
                    trackError: function() {
                        for (var t = arguments.length, i = Array(t), r = 0; r < t; r++) i[r] = arguments[r];
                        var o = t_(i, 3),
                            s = o[0],
                            a = o[1],
                            l = o[2],
                            h = n(s, tU(tV({}, null != a ? a : {}), {
                                severity: "error"
                            }), l);
                        e(s, h)
                    },
                    trackCriticalError: function() {
                        for (var t = arguments.length, i = Array(t), r = 0; r < t; r++) i[r] = arguments[r];
                        var o = t_(i, 3),
                            s = o[0],
                            a = o[1],
                            l = o[2],
                            h = n(s, tU(tV({}, null != a ? a : {}), {
                                severity: "critical"
                            }), l);
                        e(s, h)
                    }
                }
            }({
                publish: function(t) {
                    var e, i = Math.max(1, 10),
                        r = 250;

                    function n(t, e) {
                        console.error(t, e)
                    }
                    if (!eu(t)) return n('@rbx/web-telemetry: invalid featureName "'.concat(t, '"'), {
                            name: t
                        }),
                        function() {};
                    var o = [];
                    return ep.push(o), ef || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                            "hidden" === document.visibilityState && ev()
                        }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                            eg = !0, ev()
                        }), ef = !0),
                        function(s, a, l) {
                            var h = "".concat(t, "_").concat(s);
                            if (! function(t, e) {
                                    if (!eu(t)) return !1;
                                    if (e) {
                                        var i = !0,
                                            r = !1,
                                            n = void 0;
                                        try {
                                            for (var o, s = Object.keys(e)[Symbol.iterator](); !(i = (o = s.next()).done); i = !0) {
                                                var a = o.value;
                                                if (!eu(a)) return !1
                                            }
                                        } catch (t) {
                                            r = !0, n = t
                                        } finally {
                                            try {
                                                i || null == s.return || s.return()
                                            } finally {
                                                if (r) throw n
                                            }
                                        }
                                    }
                                    return !0
                                }(h, a)) return void n("@rbx/web-telemetry: invalid event name or attribute key", {
                                name: s,
                                attributes: a
                            });
                            var c = null != l ? l : 1;
                            if (!Number.isFinite(c)) return void n("@rbx/web-telemetry: value must be a finite number", {
                                name: s,
                                attributes: a
                            });
                            var d = a && Object.keys(a).length > 0 ? a : void 0;
                            o.push({
                                name: h,
                                attributes: d,
                                value: c,
                                timestampMs: BigInt(Date.now())
                            }), o.length >= i ? (void 0 !== e && (clearTimeout(e), e = void 0), em(o.splice(0, i))) : void 0 === e && (e = setTimeout(function() {
                                for (e = void 0; o.length > 0;) em(o.splice(0, i))
                            }, r))
                        }
                }("Catalog"),
                captureException: function(t, e) {
                    var i;
                    console.error(t, e), null == (i = "u" < typeof window ? void 0 : window.Sentry) || i.captureException(t, e ? {
                        extra: e
                    } : void 0)
                }
            });
            ey.trackCounter;
            var eb = ey.trackError;

            function ex(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, r = Array(e); i < e; i++) r[i] = t[i];
                return r
            }

            function ew(t, e) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, e) {
                    var i, r, n = null == t ? null : "u" > typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != n) {
                        var o = [],
                            s = !0,
                            a = !1;
                        try {
                            for (n = n.call(t); !(s = (i = n.next()).done) && (o.push(i.value), !e || o.length !== e); s = !0);
                        } catch (t) {
                            a = !0, r = t
                        } finally {
                            try {
                                s || null == n.return || n.return()
                            } finally {
                                if (a) throw r
                            }
                        }
                        return o
                    }
                }(t, e) || ek(t, e) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ek(t, e) {
                if (t) {
                    if ("string" == typeof t) return ex(t, e);
                    var i = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === i && t.constructor && (i = t.constructor.name), "Map" === i || "Set" === i) return Array.from(i);
                    if ("Arguments" === i || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(i)) return ex(t, e)
                }
            }
            ey.trackCriticalError;
            var eS = function(t) {
                    var e, i = null != (e = t.itemRestrictions) ? e : [];
                    return i.indexOf("Collectible") > -1 || i.indexOf("Limited") > -1 || i.indexOf("LimitedUnique") > -1
                },
                eM = (0, p.withTranslations)(function(t) {
                    var e, i = t.assetId,
                        r = t.isBundle,
                        n = t.assetData,
                        a = t.economyMetadata,
                        l = t.translate,
                        h = !0 === r ? "bundle" : "asset",
                        c = ew((0, s.useState)(void 0), 2),
                        d = c[0],
                        p = c[1],
                        m = ew((0, s.useState)(void 0), 2),
                        v = m[0],
                        y = m[1],
                        b = ew((0, s.useState)(!1), 2),
                        x = b[0],
                        w = b[1],
                        S = ew((0, s.useState)(void 0), 2),
                        M = S[0],
                        C = S[1],
                        T = ew((0, s.useState)(!1), 2),
                        P = T[0],
                        I = T[1],
                        L = ew((0, s.useState)(!1), 2),
                        D = L[0],
                        E = L[1],
                        j = ew((0, s.useState)(k.priceChart), 2),
                        N = j[0],
                        R = j[1],
                        B = (0, s.useRef)((0, g.isAuthenticated)() ? {
                            id: Number((0, g.userId)())
                        } : null).current,
                        z = (0, s.useRef)(!1),
                        G = (0, s.useRef)(void 0),
                        W = (0, s.useRef)(void 0),
                        H = (0, s.useCallback)(function() {
                            if (!z.current) {
                                z.current = !0, I(!0), E(!1);
                                var t, e = function() {
                                    z.current = !1, I(!1)
                                };
                                if (W.current) {
                                    var r = W.current;
                                    f.ItemDetailsHydrationService.getItemDetails([{
                                        id: i,
                                        itemType: h
                                    }], void 0, !0).then(function(t) {
                                        var i, n, o, s, a = null == (o = t[0]) ? void 0 : o.collectibleItemDetails,
                                            l = {
                                                assetStock: null == a ? void 0 : a.assetStock,
                                                assetType: f.AvatarAccoutrementService.getAssetTypeNameById(null != (n = null == (s = G.current) ? void 0 : s.assetType) ? n : 0),
                                                collectibleItemId: r,
                                                sales: null == a ? void 0 : a.sales,
                                                originalPrice: null == a ? void 0 : a.price
                                            };
                                        return (i = r, A.httpService.get(O.getResaleDataForLimited2Item(i), {}).then(function(t) {
                                            return t.data
                                        })).then(function(t) {
                                            var i, r;
                                            y((i = function(t) {
                                                for (var e = 1; e < arguments.length; e++) {
                                                    var i = null != arguments[e] ? arguments[e] : {},
                                                        r = Object.keys(i);
                                                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(i).filter(function(t) {
                                                        return Object.getOwnPropertyDescriptor(i, t).enumerable
                                                    }))), r.forEach(function(e) {
                                                        var r;
                                                        r = i[e], e in t ? Object.defineProperty(t, e, {
                                                            value: r,
                                                            enumerable: !0,
                                                            configurable: !0,
                                                            writable: !0
                                                        }) : t[e] = r
                                                    })
                                                }
                                                return t
                                            }({}, l), r = r = {
                                                priceDataPoints: t.priceDataPoints,
                                                volumeDataPoints: t.volumeDataPoints,
                                                recentAveragePrice: t.recentAveragePrice
                                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(i, Object.getOwnPropertyDescriptors(r)) : (function(t) {
                                                var e = Object.keys(t);
                                                if (Object.getOwnPropertySymbols) {
                                                    var i = Object.getOwnPropertySymbols(t);
                                                    e.push.apply(e, i)
                                                }
                                                return e
                                            })(Object(r)).forEach(function(t) {
                                                Object.defineProperty(i, t, Object.getOwnPropertyDescriptor(r, t))
                                            }), i)), e()
                                        }).catch(function(t) {
                                            eb("ResaleDataLoadFailed", null, t), y(void 0), E(!0), e()
                                        })
                                    }).catch(function(t) {
                                        eb("ResaleDataLoadFailed", null, t), y(void 0), E(!0), e()
                                    });
                                    return
                                }(t = i, A.httpService.get(O.getResaleData(t), {}).then(function(t) {
                                    return t.data
                                })).then(function(t) {
                                    y(t), e()
                                }).catch(function(t) {
                                    eb("ResaleDataLoadFailed", null, t), y(void 0), E(!0), e()
                                })
                            }
                        }, [i, h]);
                    if ((0, s.useEffect)(function() {
                            f.ItemDetailsHydrationService.getItemDetails([{
                                id: i,
                                itemType: h
                            }], void 0, !0).then(function(t) {
                                var e, i = t[0];
                                i && eS(i) ? (p(!0), G.current = i, i.collectibleItemId && (C(null == (e = i.collectibleItemDetails) ? void 0 : e.resaleRestriction), w(!0), W.current = i.collectibleItemId, R(k.inventory)), H()) : p(!1)
                            }).catch(function(t) {
                                eb("ResaleDataLoadFailed", null, t), E(!0), z.current = !1, I(!1)
                            })
                        }, []), !d) return (0, o.jsx)("div", {
                        className: "rbx-tabs-horizontal resale-pricechart-tabs"
                    });
                    var F = function(t) {
                        return u()("tab-pane", {
                            active: t === N
                        })
                    };
                    return (0, o.jsx)("div", {
                        className: "rbx-tabs-horizontal resale-pricechart-tabs",
                        children: (0, o.jsxs)("div", {
                            children: [!!v && !!B && (0, o.jsxs)("div", {
                                children: [(0, o.jsx)("ul", {
                                    id: "horizontal-tabs",
                                    className: "nav nav-tabs",
                                    role: "tablist",
                                    children: [{
                                        tab: k.inventory,
                                        label: "Label.YourInventory"
                                    }, {
                                        tab: k.priceChart,
                                        label: "Heading.PriceChart"
                                    }].concat(function(t) {
                                        if (Array.isArray(t)) return ex(t)
                                    }(e = x && 2 !== M ? [{
                                        tab: k.resellers,
                                        label: "Heading.Resellers"
                                    }] : []) || function(t) {
                                        if ("u" > typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                                    }(e) || ek(e) || function() {
                                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()).map(function(t) {
                                        var e = t.tab,
                                            i = t.label;
                                        return (0, o.jsx)("li", {
                                            className: u()("rbx-tab", {
                                                active: e === N
                                            }),
                                            children: (0, o.jsx)("button", {
                                                type: "button",
                                                className: "rbx-tab-heading",
                                                role: "tab",
                                                "aria-selected": e === N,
                                                onClick: function() {
                                                    R(e)
                                                },
                                                children: (0, o.jsx)("span", {
                                                    className: "text-lead",
                                                    children: l(i)
                                                })
                                            })
                                        }, e)
                                    })
                                }), (0, o.jsxs)("div", {
                                    className: "tab-content rbx-tab-content",
                                    children: [(0, o.jsxs)("div", {
                                        id: "price-chart",
                                        className: u()(F(k.priceChart), "price-chart-section"),
                                        children: [(0, o.jsx)("div", {
                                            className: "container-header",
                                            children: (0, o.jsx)("h2", {
                                                children: l("Heading.PriceChart")
                                            })
                                        }), (0, o.jsx)(ti, {
                                            resaleData: v,
                                            isLimited2: x
                                        })]
                                    }), (0, o.jsx)("div", {
                                        id: "item-details-limited-inventory-container",
                                        className: F(k.inventory),
                                        "data-target-id": i,
                                        "data-is-bundle": String(!!r)
                                    }), x && 2 !== M && (0, o.jsxs)("div", {
                                        id: "resellers",
                                        className: u()(F(k.resellers), "resellers-container"),
                                        children: [(0, o.jsx)("div", {
                                            className: "container-header",
                                            children: (0, o.jsx)("h2", {
                                                children: l("Heading.Resellers")
                                            })
                                        }), (0, o.jsx)(tX, {
                                            resaleData: v,
                                            assetData: n,
                                            economyMetadata: a,
                                            isLimited2: x,
                                            itemType: h
                                        })]
                                    })]
                                })]
                            }), !!v && !B && (0, o.jsxs)("div", {
                                className: "tab-content rbx-tab-content",
                                children: [(0, o.jsx)("div", {
                                    className: "container-header",
                                    children: (0, o.jsx)("h2", {
                                        children: l("Heading.PriceChart")
                                    })
                                }), (0, o.jsx)(ti, {
                                    resaleData: v
                                })]
                            }), P && (0, o.jsx)("div", {
                                className: "section-content price-chart-spinner",
                                children: (0, o.jsx)("span", {
                                    className: "spinner spinner-default"
                                })
                            }), D && (0, o.jsxs)("div", {
                                className: "section-content-off",
                                children: [(0, o.jsx)("span", {
                                    children: l("Label.ResaleDataLoadFailure")
                                }), (0, o.jsx)("button", {
                                    type: "button",
                                    className: "refresh-link-icon",
                                    onClick: H
                                })]
                            })]
                        })
                    })
                }, C),
                eC = window.RobloxItemPurchase,
                eA = window.Roblox["core-scripts"].meta.device,
                eT = window.EventTracker,
                eP = ((t = {})[t.View = 0] = "View", t[t.Click = 1] = "Click", t[t.Error = 2] = "Error", t),
                eO = ((e = {})[e.Web = 0] = "Web", e[e.MobileWeb = 1] = "MobileWeb", e),
                eI = function() {
                    var t = (0, eA.getDeviceMeta)();
                    return !!(null == t ? void 0 : t.isPhone) || !!(null == t ? void 0 : t.isTablet) || (null == t ? void 0 : t.deviceType) === "phone"
                },
                eL = function(t) {
                    var e = t.itemName,
                        i = t.counterName,
                        r = t.metaData,
                        n = t.actionType,
                        o = void 0 === n ? eP.View : n,
                        s = t.excludeCounter,
                        a = t.excludeTelemetry,
                        l = sessionStorage.getItem("AXAnalyticsDebugLogging"),
                        h = eI(),
                        c = "AXTracking_".concat(h ? "Mweb" : "Web");
                    if (!(void 0 !== s && s)) {
                        var d = i ? "".concat(c, "_").concat(i) : "".concat(c, "_").concat(e);
                        (0, eT.fireEvent)(d), l && console.log("AXAnalyticsService.sendCounter", d)
                    }
                    if (!(void 0 !== a && a)) {
                        var u = function(t) {
                            for (var e = 1; e < arguments.length; e++) {
                                var i = null != arguments[e] ? arguments[e] : {},
                                    r = Object.keys(i);
                                "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(i).filter(function(t) {
                                    return Object.getOwnPropertyDescriptor(i, t).enumerable
                                }))), r.forEach(function(e) {
                                    var r;
                                    r = i[e], e in t ? Object.defineProperty(t, e, {
                                        value: r,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : t[e] = r
                                })
                            }
                            return t
                        }({
                            item_name: e,
                            action_type: o,
                            platform: h ? eO.MobileWeb : eO.Web
                        }, r);
                        (0, tm.sendEventWithTarget)("userJourneyAction", "RobloxWWW", u), l && console.log("AXAnalyticsService.sendEvent", u)
                    }
                },
                eD = function(t) {
                    for (var e = 1; e < arguments.length; e++) {
                        var i = null != arguments[e] ? arguments[e] : {},
                            r = Object.keys(i);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(i).filter(function(t) {
                            return Object.getOwnPropertyDescriptor(i, t).enumerable
                        }))), r.forEach(function(e) {
                            var r;
                            r = i[e], e in t ? Object.defineProperty(t, e, {
                                value: r,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : t[e] = r
                        })
                    }
                    return t
                }({}, {
                    CatalogView: "CatalogView"
                }, {
                    CatalogSearchView: "CatalogSearchView"
                }, {
                    CatalogFiltersApplied: "CatalogFiltersApplied"
                }, {
                    CatalogSearchFiltersApplied: "CatalogSearchFiltersApplied"
                }, {
                    AvatarEditorView: "AvatarEditorView",
                    AvatarEditorChangeAvatar: "AvatarEditorChangeAvatar",
                    AvatarEditorReactMigrationEnabled: "AvatarEditorReactMigrationEnabled",
                    AvatarEditorReactMigrationControlGroup: "AvatarEditorReactMigrationControlGroup"
                }, {
                    AvatarEditorFirstEditClick: "AvatarEditorFirstEditClick",
                    AvatarEditorEditClick: "AvatarEditorEditClick",
                    AvatarEditorEquipClick: "AvatarEditorEquipClick",
                    AvatarEditorUnequipClick: "AvatarEditorUnequipClick",
                    AvatarEditorBodyColorChangeClick: "AvatarEditorBodyColorChangeClick",
                    AvatarEditorScaleChangeClick: "AvatarEditorScaleChangeClick",
                    AvatarEditorTypeChangeClick: "AvatarEditorTypeChangeClick",
                    AvatarEditorAdvancedEditorClick: "AvatarEditorAdvancedEditorClick",
                    AvatarEditorEmoteChangeClick: "AvatarEditorEmoteChangeClick",
                    AvatarEditorRecommendationClick: "AvatarEditorRecommendationClick",
                    AvatarEditorGetMoreClick: "AvatarEditorGetMoreClick",
                    AvatarEditorOutfitCreatedClick: "AvatarEditorOutfitCreatedClick",
                    AvatarEditorOutfitDeletedClick: "AvatarEditorOutfitDeletedClick",
                    AvatarEditorOutfitEditedClick: "AvatarEditorOutfitEditedClick"
                }, {
                    CatalogItemDetailsView: "CatalogItemDetailsView",
                    CatalogLookDetailsView: "CatalogLookDetailsView",
                    PurchaseSuccessAsset: "PurchaseSuccessAsset",
                    PurchaseSuccessBundle: "PurchaseSuccessBundle",
                    PurchaseSuccess: "PurchaseSuccess",
                    PurchaseSuccessShoppingCart: "PurchaseSuccessShoppingCart",
                    PurchaseErrorShoppingCart: "PurchaseErrorShoppingCart",
                    PurchaseSuccessLook: "PurchaseSuccessLook",
                    PurchaseSuccessDirectResale: "PurchaseSuccessDirectResale",
                    PurchaseSuccessTimedOptionRepurchase: "PurchaseSuccessTimedOptionRepurchase"
                }, {
                    CatalogRevampEnabledWithRobuxInThumbnail: "CatalogRevampEnabledWithRobuxInThumbnail",
                    CatalogRevampEnabledWithoutRobuxInThumbnail: "CatalogRevampEnabledWithoutRobuxInThumbnail",
                    CatalogRevampControlGroup: "CatalogRevampControlGroup"
                }, {
                    ItemCardClick: "ItemCardClick",
                    CatalogFilterClick: "CatalogFilterClick",
                    CatalogSearchClick: "CatalogSearchClick",
                    CatalogPaginationClick: "CatalogPaginationClick",
                    ShoppingCartAddClick: "ShoppingCartAddClick",
                    ShoppingCartRemoveClick: "ShoppingCartRemoveClick",
                    ShoppingCartOpenClick: "ShoppingCartOpenClick",
                    ShoppingCartCloseClick: "ShoppingCartCloseClick",
                    PurchaseButtonClick: "PurchaseButtonClick"
                }, {
                    TradePageView: "tradePageView",
                    TradeInitiated: "tradeInitiated",
                    TradeCompleted: "tradeCompleted",
                    TradeDeclined: "tradeDeclined",
                    TradeCanceled: "tradeCanceled",
                    TradeCountered: "tradeCountered",
                    TradeViewed: "tradeViewed",
                    TradeCenterFirstVisit: "tradeCenterFirstVisit",
                    TradeFilterClick: "tradeFilterClick",
                    TradeHowToTradeClick: "tradeHowToTradeClick",
                    TradeBannerDismiss: "tradeBannerDismiss",
                    TradeProfileClick: "tradeProfileClick"
                }),
                eE = ((r = {}).ItemDetailsPage = "ItemDetailsPage", r.ShoppingCart = "ShoppingCart", r.LookDetails = "LookDetails", r.CurrentWearing = "CurrentWearing", r.DirectResale = "DirectResale", r.AvatarEditorExpiredItems = "AvatarEditorExpiredItems", r),
                ej = function(t, e) {
                    t && eL({
                        itemName: t,
                        actionType: eP.Click,
                        metaData: e ? {
                            metaData: JSON.stringify(e)
                        } : void 0
                    })
                },
                eN = function(t, e) {
                    ej(eD.PurchaseButtonClick, function(t) {
                        for (var e = 1; e < arguments.length; e++) {
                            var i = null != arguments[e] ? arguments[e] : {},
                                r = Object.keys(i);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(i).filter(function(t) {
                                return Object.getOwnPropertyDescriptor(i, t).enumerable
                            }))), r.forEach(function(e) {
                                var r;
                                r = i[e], e in t ? Object.defineProperty(t, e, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : t[e] = r
                            })
                        }
                        return t
                    }({
                        source: t
                    }, e))
                };

            function eR(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, r = Array(e); i < e; i++) r[i] = t[i];
                return r
            }

            function eB(t, e) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, e) {
                    var i, r, n = null == t ? null : "u" > typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != n) {
                        var o = [],
                            s = !0,
                            a = !1;
                        try {
                            for (n = n.call(t); !(s = (i = n.next()).done) && (o.push(i.value), !e || o.length !== e); s = !0);
                        } catch (t) {
                            a = !0, r = t
                        } finally {
                            try {
                                s || null == n.return || n.return()
                            } finally {
                                if (a) throw r
                            }
                        }
                        return o
                    }
                }(t, e) || function(t, e) {
                    if (t) {
                        if ("string" == typeof t) return eR(t, e);
                        var i = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === i && t.constructor && (i = t.constructor.name), "Map" === i || "Set" === i) return Array.from(i);
                        if ("Arguments" === i || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(i)) return eR(t, e)
                    }
                }(t, e) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ez = eB((0, eC.createItemPurchase)(), 2),
                eG = ez[0],
                eW = ez[1],
                eH = (0, p.withTranslations)(function(t) {
                    var e = t.identifier,
                        i = t.translate,
                        r = eB((0, s.useState)(), 2),
                        n = r[0],
                        l = r[1],
                        h = eB((0, s.useState)(), 2),
                        c = h[0],
                        d = h[1],
                        u = eB((0, tr.createSystemFeedback)(), 2),
                        p = u[0];
                    u[1];
                    var f = function(t) {
                        t ? window.location.reload() : window.dispatchEvent(new CustomEvent("navigation-update-user-currency"))
                    };
                    return (0, s.useEffect)(function() {
                        window.addEventListener("angular-to-react-purchase-event", function(t) {
                            var e, r = t.detail;
                            eN(eE.DirectResale, {
                                totalTransactionValue: r.expectedPrice,
                                transactionItems: JSON.stringify([{
                                    itemType: r.itemType,
                                    subType: r.assetType,
                                    itemId: r.assetId,
                                    resalePurchase: r.resalePurchase,
                                    isLimited: !0,
                                    isTimedOptionPurchase: !1
                                }]),
                                purchaseType: r.identifier,
                                userId: null != (e = (0, g.userId)()) ? e : void 0
                            }), l((d(r.identifier), {
                                translate: i,
                                productId: r.productId,
                                expectedPrice: r.expectedPrice,
                                thumbnail: (0, o.jsx)(tS.Thumbnail2d, {
                                    type: "asset" === r.itemType.toLowerCase() ? tS.ThumbnailTypes.assetThumbnail : tS.ThumbnailTypes.bundleThumbnail,
                                    size: tS.DefaultThumbnailSize,
                                    targetId: r.assetId,
                                    imgClassName: "",
                                    format: tS.ThumbnailFormat.webp
                                }),
                                assetName: r.name,
                                assetType: r.assetType,
                                sellerName: r.expectedSellerName,
                                sellerType: r.expectedSellerType,
                                expectedCurrency: 1,
                                expectedSellerId: r.expectedSellerId,
                                collectibleItemId: r.collectibleItemId,
                                collectibleProductId: r.collectibleProductId,
                                collectibleItemInstanceId: r.collectibleItemInstanceId,
                                showSuccessBanner: !0,
                                userAssetId: r.userAssetId,
                                isLimited: !0,
                                onPurchaseSuccess: function() {
                                    var t, e = {
                                        totalTransactionValue: r.expectedPrice,
                                        transactionItems: JSON.stringify([{
                                            itemType: r.itemType,
                                            subType: r.assetType,
                                            itemId: r.assetId,
                                            resalePurchase: r.resalePurchase,
                                            isLimited: !0,
                                            isTimedOptionPurchase: !1
                                        }]),
                                        purchaseType: r.identifier,
                                        userId: null != (t = (0, g.userId)()) ? t : void 0
                                    };
                                    eL({
                                        itemName: eD.PurchaseSuccessDirectResale,
                                        excludeTelemetry: !0
                                    }), eL({
                                        itemName: eD.PurchaseSuccess,
                                        counterName: eD.PurchaseSuccessDirectResale,
                                        metaData: {
                                            metaData: JSON.stringify(e),
                                            totalValue: r.expectedPrice
                                        },
                                        actionType: eP.Click
                                    }), (0, tm.sendEvent)({
                                        name: "marketplaceWebPurchaseSuccess",
                                        type: "marketplaceWebPurchaseSuccess",
                                        context: "marketplaceWebPurchase"
                                    }, e), f(r.refreshPage)
                                }
                            }))
                        })
                    }, []), (0, s.useEffect)(function() {
                        e === c && n && eW.start()
                    }, [n, c, e]), (0, o.jsxs)(a().Fragment, {
                        children: [(0, o.jsx)(p, {}), n && (0, o.jsx)(eG, function(t) {
                            for (var e = 1; e < arguments.length; e++) {
                                var i = null != arguments[e] ? arguments[e] : {},
                                    r = Object.keys(i);
                                "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(i).filter(function(t) {
                                    return Object.getOwnPropertyDescriptor(i, t).enumerable
                                }))), r.forEach(function(e) {
                                    var r;
                                    r = i[e], e in t ? Object.defineProperty(t, e, {
                                        value: r,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : t[e] = r
                                })
                            }
                            return t
                        }({}, n))]
                    })
                }, {
                    common: [""],
                    feature: "Feature.Catalog"
                }),
                eF = function(t, e) {
                    var i;
                    return (null == (i = t.getAttribute(e)) ? void 0 : i.toString().toLowerCase()) === "true"
                };
            h()(function() {
                ! function t() {
                    var e, i, r, n, s, a = document.getElementById("asset-resale-data-container");
                    if (!a) return void window.requestAnimationFrame(t);
                    var l = null != (e = a.getAttribute("data-target-id")) ? e : "";
                    (0, c.renderWithErrorBoundary)((0, o.jsx)(eM, {
                        assetId: l,
                        isBundle: eF(a, "data-is-bundle"),
                        assetData: {
                            id: l,
                            name: null != (i = a.getAttribute("data-item-name")) ? i : void 0,
                            type: null != (r = a.getAttribute("data-asset-type")) ? r : void 0,
                            productId: null != (n = a.getAttribute("data-product-id")) ? n : void 0,
                            membershipRequirement: null != (s = a.getAttribute("data-bc-requirement")) ? s : void 0
                        },
                        economyMetadata: {
                            purchasingEnabled: eF(a, "data-is-purchase-enabled")
                        }
                    }), a)
                }(),
                function t() {
                    var e = document.getElementById("angular-react-purchase-handoff");
                    e ? (0, c.renderWithErrorBoundary)((0, o.jsx)(eH, {
                        identifier: e.getAttribute("data-identifier")
                    }), e) : window.requestAnimationFrame(t)
                }()
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemResale");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemResale-ac470cc536a7f514.js.map