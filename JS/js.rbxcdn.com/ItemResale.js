! function() {
    try {
        var t = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "44fc9454dc27fb95cac3107e60ec172e51ad6797"
        };
        var e = (new t.Error).stack;
        e && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[e] = "e812770e-254f-40eb-834c-5b064d0e55a0", t._sentryDebugIdIdentifier = "sentry-dbid-e812770e-254f-40eb-834c-5b064d0e55a0")
    } catch (t) {}
}(),
function() {
    var t = {
            784: function(t, e, i) {
                "use strict";

                function n(t, e) {
                    return null != e && "u" > typeof Symbol && e[Symbol.hasInstance] ? !!e[Symbol.hasInstance](t) : t instanceof e
                }
                i.r(e), i.d(e, {
                    _: function() {
                        return n
                    }
                })
            },
            844: function(t, e, i) {
                "use strict";

                function n(t) {
                    return t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
                }
                i.r(e), i.d(e, {
                    _: function() {
                        return n
                    }
                })
            },
            611: function(t, e, i) {
                var n = i(844);
                !
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var e = {}.hasOwnProperty;

                    function i() {
                        for (var t = "", s = 0; s < arguments.length; s++) {
                            var o = arguments[s];
                            o && (t = r(t, function(t) {
                                if ("string" == typeof t || "number" == typeof t) return t;
                                if ((void 0 === t ? "undefined" : n._(t)) !== "object") return "";
                                if (Array.isArray(t)) return i.apply(null, t);
                                if (t.toString !== Object.prototype.toString && !t.toString.toString().includes("[native code]")) return t.toString();
                                var s = "";
                                for (var o in t) e.call(t, o) && t[o] && (s = r(s, o));
                                return s
                            }(o)))
                        }
                        return t
                    }

                    function r(t, e) {
                        return e ? t ? t + " " + e : t + e : t
                    }
                    t.exports ? (i.default = i, t.exports = i) : "function" == typeof define && "object" === n._(define.amd) && define.amd ? define("classnames", [], function() {
                        return i
                    }) : window.classNames = i
                }()
            },
            573: function(t, e, i) {
                t = i.nmd(t);
                var n, r, s = i(784),
                    o = i(844);
                n = "u" > typeof window ? window : this, r = function(t) {
                    i = (e = window).document, n = e.navigator && e.navigator.userAgent || "", r = i && i.createElementNS && !!i.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGRect, a = /(edge|msie|trident)/i.test(n) && !window.opera, h = (l = /Firefox/.test(n)) && 4 > parseInt(n.split("Firefox/")[1], 10), d = [], u = (c = t = e.Highcharts ? e.Highcharts.error(16, !0) : {
                            product: "Highcharts",
                            version: "5.0.14",
                            deg2rad: 2 * Math.PI / 360,
                            doc: i,
                            hasBidiBug: h,
                            hasTouch: i && void 0 !== i.documentElement.ontouchstart,
                            isMS: a,
                            isWebKit: /AppleWebKit/.test(n),
                            isFirefox: l,
                            isTouchDevice: /(Mobile|Android|Windows Phone)/.test(n),
                            SVG_NS: "http://www.w3.org/2000/svg",
                            chartCount: 0,
                            seriesTypes: {},
                            symbolSizes: {},
                            svg: r,
                            vml: !r,
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
                                    n = [],
                                    r = this.now,
                                    s = e.length;
                                if (1 === r) n = this.toD;
                                else if (s === i.length && 1 > r)
                                    for (; s--;) t = parseFloat(e[s]), n[s] = isNaN(t) ? e[s] : r * parseFloat(i[s] - t) + t;
                                else n = i;
                                this.elem.attr("d", n, null, !0)
                            },
                            update: function() {
                                var t = this.elem,
                                    e = this.prop,
                                    i = this.now,
                                    n = this.options.step;
                                this[e + "Setter"] ? this[e + "Setter"]() : t.attr ? t.element && t.attr(e, i, null, !0) : t.style[e] = i + this.unit, n && n.call(t, i, this)
                            },
                            run: function(t, e, i) {
                                var n, r = this,
                                    s = function(t) {
                                        return !s.stopped && r.step(t)
                                    };
                                this.startTime = +new Date, this.start = t, this.end = e, this.unit = i, this.now = this.start, this.pos = 0, s.elem = this.elem, s.prop = this.prop, s() && 1 === d.push(s) && (s.timerId = setInterval(function() {
                                    for (n = 0; n < d.length; n++) d[n]() || d.splice(n--, 1);
                                    d.length || clearInterval(s.timerId)
                                }, 13))
                            },
                            step: function(t) {
                                var e, i = +new Date,
                                    n = this.options,
                                    r = this.elem,
                                    s = n.complete,
                                    o = n.duration,
                                    a = n.curAnim;
                                return r.attr && !r.element ? t = !1 : t || i >= o + this.startTime ? (this.now = this.end, this.pos = 1, this.update(), e = a[this.prop] = !0, c.objectEach(a, function(t) {
                                    !0 !== t && (e = !1)
                                }), e && s && s.call(r), t = !1) : (this.pos = n.easing((i - this.startTime) / o), this.now = this.start + (this.end - this.start) * this.pos, this.update(), t = !0), t
                            },
                            initPath: function(t, e, i) {
                                function n(t) {
                                    var e, i;
                                    for (h = t.length; h--;) e = "M" === t[h] || "L" === t[h], i = /[a-zA-Z]/.test(t[h + 3]), e && i && t.splice(h + 1, 0, t[h + 1], t[h + 2], t[h + 1], t[h + 2])
                                }

                                function r(t, e) {
                                    for (; t.length < a;) {
                                        t[0] = e[a - t.length];
                                        var i = t.slice(0, f);
                                        [].splice.apply(t, [0, 0].concat(i)), m && (i = t.slice(t.length - f), [].splice.apply(t, [t.length, 0].concat(i)), h--)
                                    }
                                    t[0] = "M"
                                }

                                function s(t, e) {
                                    for (var i = (a - t.length) / f; 0 < i && i--;)(l = t.slice().splice(t.length / v - f, f * v))[0] = e[a - f - i * f], p && (l[f - 6] = l[f - 2], l[f - 5] = l[f - 1]), [].splice.apply(t, [t.length / v, 0].concat(l)), m && i--
                                }
                                e = e || "";
                                var o, a, l, h, d = t.startX,
                                    u = t.endX,
                                    p = -1 < e.indexOf("C"),
                                    f = p ? 7 : 3;
                                e = e.split(" "), i = i.slice();
                                var g, m = t.isArea,
                                    v = m ? 2 : 1;
                                if (p && (n(e), n(i)), d && u) {
                                    for (h = 0; h < d.length; h++)
                                        if (d[h] === u[0]) {
                                            o = h;
                                            break
                                        } else if (d[0] === u[u.length - d.length + h]) {
                                        o = h, g = !0;
                                        break
                                    }
                                    void 0 === o && (e = [])
                                }
                                return e.length && c.isNumber(o) && (a = i.length + o * v * f, g ? (r(e, i), s(i, e)) : (r(i, e), s(e, i))), [e, i]
                            }
                        }, c.Fx.prototype.fillSetter = c.Fx.prototype.strokeSetter = function() {
                            this.elem.attr(this.prop, c.color(this.start).tweenTo(c.color(this.end), this.pos), null, !0)
                        }, c.extend = function(t, e) {
                            var i;
                            for (i in t || (t = {}), e) t[i] = e[i];
                            return t
                        }, c.merge = function() {
                            var t, e, i = arguments,
                                n = {},
                                r = function(t, e) {
                                    return "object" !== (void 0 === t ? "undefined" : o._(t)) && (t = {}), c.objectEach(e, function(i, n) {
                                        !c.isObject(i, !0) || c.isClass(i) || c.isDOMElement(i) ? t[n] = e[n] : t[n] = r(t[n] || {}, i)
                                    }), t
                                };
                            for (!0 === i[0] && (n = i[1], i = Array.prototype.slice.call(i, 2)), e = i.length, t = 0; t < e; t++) n = r(n, i[t]);
                            return n
                        }, c.pInt = function(t, e) {
                            return parseInt(t, e || 10)
                        }, c.isString = function(t) {
                            return "string" == typeof t
                        }, c.isArray = function(t) {
                            return "[object Array]" === (t = Object.prototype.toString.call(t)) || "[object Array Iterator]" === t
                        }, c.isObject = function(t, e) {
                            return !!t && "object" === (void 0 === t ? "undefined" : o._(t)) && (!e || !c.isArray(t))
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
                            var n;
                            return c.isString(e) ? c.defined(i) ? t.setAttribute(e, i) : t && t.getAttribute && (n = t.getAttribute(e)) : c.defined(e) && c.isObject(e) && c.objectEach(e, function(e, i) {
                                t.setAttribute(i, e)
                            }), n
                        }, c.splat = function(t) {
                            return c.isArray(t) ? t : [t]
                        }, c.syncTimeout = function(t, e, i) {
                            if (e) return setTimeout(t, e, i);
                            t.call(0, i)
                        }, c.pick = function() {
                            var t, e, i = arguments,
                                n = i.length;
                            for (t = 0; t < n; t++)
                                if (null != (e = i[t])) return e
                        }, c.css = function(t, e) {
                            c.isMS && !c.svg && e && void 0 !== e.opacity && (e.filter = "alpha(opacity=" + 100 * e.opacity + ")"), c.extend(t.style, e)
                        }, c.createElement = function(t, e, i, n, r) {
                            t = p.createElement(t);
                            var s = c.css;
                            return e && c.extend(t, e), r && s(t, {
                                padding: 0,
                                border: "none",
                                margin: 0
                            }), i && s(t, i), n && n.appendChild(t), t
                        }, c.extendClass = function(t, e) {
                            var i = function() {};
                            return i.prototype = new t, c.extend(i.prototype, e), i
                        }, c.pad = function(t, e, i) {
                            return Array((e || 2) + 1 - String(t).length).join(i || 0) + t
                        }, c.relativeLength = function(t, e, i) {
                            return /%$/.test(t) ? e * parseFloat(t) / 100 + (i || 0) : parseFloat(t)
                        }, c.wrap = function(t, e, i) {
                            var n = t[e];
                            t[e] = function() {
                                var t = Array.prototype.slice.call(arguments),
                                    e = arguments,
                                    r = this;
                                return r.proceed = function() {
                                    n.apply(r, arguments.length ? arguments : e)
                                }, t.unshift(n), t = i.apply(this, t), r.proceed = null, t
                            }
                        }, c.getTZOffset = function(t) {
                            var e = c.Date;
                            return 6e4 * (e.hcGetTimezoneOffset && e.hcGetTimezoneOffset(t) || e.hcTimezoneOffset || 0)
                        }, c.dateFormat = function(t, e, i) {
                            if (!c.defined(e) || isNaN(e)) return c.defaultOptions.lang.invalidDate || "";
                            t = c.pick(t, "%Y-%m-%d %H:%M:%S");
                            var n = c.Date,
                                r = new n(e - c.getTZOffset(e)),
                                s = r[n.hcGetHours](),
                                o = r[n.hcGetDay](),
                                a = r[n.hcGetDate](),
                                l = r[n.hcGetMonth](),
                                h = r[n.hcGetFullYear](),
                                d = c.defaultOptions.lang,
                                u = d.weekdays,
                                p = d.shortWeekdays,
                                f = c.pad,
                                n = c.extend({
                                    a: p ? p[o] : u[o].substr(0, 3),
                                    A: u[o],
                                    d: f(a),
                                    e: f(a, 2, " "),
                                    w: o,
                                    b: d.shortMonths[l],
                                    B: d.months[l],
                                    m: f(l + 1),
                                    y: h.toString().substr(2, 2),
                                    Y: h,
                                    H: f(s),
                                    k: s,
                                    I: f(s % 12 || 12),
                                    l: s % 12 || 12,
                                    M: f(r[n.hcGetMinutes]()),
                                    p: 12 > s ? "AM" : "PM",
                                    P: 12 > s ? "am" : "pm",
                                    S: f(r.getSeconds()),
                                    L: f(Math.round(e % 1e3), 3)
                                }, c.dateFormats);
                            return c.objectEach(n, function(i, n) {
                                for (; - 1 !== t.indexOf("%" + n);) t = t.replace("%" + n, "function" == typeof i ? i(e) : i)
                            }), i ? t.substr(0, 1).toUpperCase() + t.substr(1) : t
                        }, c.formatSingle = function(t, e) {
                            var i = /\.([0-9])/,
                                n = c.defaultOptions.lang;
                            return /f$/.test(t) ? (i = (i = t.match(i)) ? i[1] : -1, null !== e && (e = c.numberFormat(e, i, n.decimalPoint, -1 < t.indexOf(",") ? n.thousandsSep : ""))) : e = c.dateFormat(t, e), e
                        }, c.format = function(t, e) {
                            for (var i, n, r, s, o, a = "{", l = !1, h = []; t && -1 !== (a = t.indexOf(a));) {
                                if (i = t.slice(0, a), l) {
                                    for (r = 0, s = (n = (i = i.split(":")).shift().split(".")).length, o = e; r < s; r++) o = o[n[r]];
                                    i.length && (o = c.formatSingle(i.join(":"), o)), h.push(o)
                                } else h.push(i);
                                t = t.slice(a + 1), a = (l = !l) ? "}" : "{"
                            }
                            return h.push(t), h.join("")
                        }, c.getMagnitude = function(t) {
                            return Math.pow(10, Math.floor(Math.log(t) / Math.LN10))
                        }, c.normalizeTickInterval = function(t, e, i, n, r) {
                            var s, o = t;
                            for (s = t / (i = c.pick(i, 1)), e || (e = r ? [1, 1.2, 1.5, 2, 2.5, 3, 4, 5, 6, 8, 10] : [1, 2, 2.5, 5, 10], !1 === n && (1 === i ? e = c.grep(e, function(t) {
                                    return 0 == t % 1
                                }) : .1 >= i && (e = [1 / i]))), n = 0; n < e.length && (o = e[n], (!r || !(o * i >= t)) && (r || !(s <= (e[n] + (e[n + 1] || e[n])) / 2))); n++);
                            return c.correctFloat(o * i, -Math.round(Math.log(.001) / Math.LN10))
                        }, c.stableSort = function(t, e) {
                            var i, n, r = t.length;
                            for (n = 0; n < r; n++) t[n].safeI = n;
                            for (t.sort(function(t, n) {
                                    return 0 === (i = e(t, n)) ? t.safeI - n.safeI : i
                                }), n = 0; n < r; n++) delete t[n].safeI
                        }, c.arrayMin = function(t) {
                            for (var e = t.length, i = t[0]; e--;) t[e] < i && (i = t[e]);
                            return i
                        }, c.arrayMax = function(t) {
                            for (var e = t.length, i = t[0]; e--;) t[e] > i && (i = t[e]);
                            return i
                        }, c.destroyObjectProperties = function(t, e) {
                            c.objectEach(t, function(i, n) {
                                i && i !== e && i.destroy && i.destroy(), delete t[n]
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
                        }, c.numberFormat = function(t, e, i, n) {
                            t = +t || 0, e *= 1;
                            var r, s, o = c.defaultOptions.lang,
                                a = (t.toString().split(".")[1] || "").split("e")[0].length,
                                l = t.toString().split("e");
                            return -1 === e ? e = Math.min(a, 20) : c.isNumber(e) || (e = 2), s = (Math.abs(l[1] ? l[0] : t) + Math.pow(10, -Math.max(e, a) - 1)).toFixed(e), r = 3 < (a = String(c.pInt(s))).length ? a.length % 3 : 0, i = c.pick(i, o.decimalPoint), n = c.pick(n, o.thousandsSep), t = (0 > t ? "-" : "") + (r ? a.substr(0, r) + n : "") + a.substr(r).replace(/(\d{3})(?=\d)/g, "$1" + n), e && (t += i + s.slice(-e)), l[1] && (t += "e" + l[1]), t
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
                            for (var i = [], n = 0, r = t.length; n < r; n++) i[n] = e.call(t[n], t[n], n, t);
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
                            for (var n in t) t.hasOwnProperty(n) && e.call(i, t[n], n, t)
                        }, c.addEvent = function(t, e, i) {
                            function n(e) {
                                e.target = e.srcElement || f, i.call(t, e)
                            }
                            var r = t.hcEvents = t.hcEvents || {};
                            return t.addEventListener ? t.addEventListener(e, i, !1) : t.attachEvent && (t.hcEventsIE || (t.hcEventsIE = {}), i.hcGetKey || (i.hcGetKey = c.uniqueKey()), t.hcEventsIE[i.hcGetKey] = n, t.attachEvent("on" + e, n)), r[e] || (r[e] = []), r[e].push(i),
                                function() {
                                    c.removeEvent(t, e, i)
                                }
                        }, c.removeEvent = function(t, e, i) {
                            function n(e, i) {
                                t.removeEventListener ? t.removeEventListener(e, i, !1) : t.attachEvent && (i = t.hcEventsIE[i.hcGetKey], t.detachEvent("on" + e, i))
                            }

                            function r() {
                                var i, r;
                                t.nodeName && (e ? (i = {})[e] = !0 : i = a, c.objectEach(i, function(t, e) {
                                    if (a[e])
                                        for (r = a[e].length; r--;) n(e, a[e][r])
                                }))
                            }
                            var s, o, a = t.hcEvents;
                            a && (e ? (s = a[e] || [], i ? (-1 < (o = c.inArray(i, s)) && (s.splice(o, 1), a[e] = s), n(e, i)) : (r(), a[e] = [])) : (r(), t.hcEvents = {}))
                        }, c.fireEvent = function(t, e, i, n) {
                            var r, s, o;
                            if (r = t.hcEvents, i = i || {}, p.createEvent && (t.dispatchEvent || t.fireEvent))(r = p.createEvent("Events")).initEvent(e, !0, !0), c.extend(r, i), t.dispatchEvent ? t.dispatchEvent(r) : t.fireEvent(e, r);
                            else if (r)
                                for (s = (r = r[e] || []).length, i.target || c.extend(i, {
                                        preventDefault: function() {
                                            i.defaultPrevented = !0
                                        },
                                        target: t,
                                        type: e
                                    }), e = 0; e < s; e++)(o = r[e]) && !1 === o.call(t, i) && i.preventDefault();
                            n && !i.defaultPrevented && n(i)
                        }, c.animate = function(t, e, i) {
                            var n, r, s, o, a = "";
                            c.isObject(i) || (o = arguments, i = {
                                duration: o[2],
                                easing: o[3],
                                complete: o[4]
                            }), c.isNumber(i.duration) || (i.duration = 400), i.easing = "function" == typeof i.easing ? i.easing : Math[i.easing] || Math.easeInOutSine, i.curAnim = c.merge(e), c.objectEach(e, function(o, l) {
                                c.stop(t, l), s = new c.Fx(t, i, l), r = null, "d" === l ? (s.paths = s.initPath(t, t.d, e.d), s.toD = e.d, n = 0, r = 1) : t.attr ? n = t.attr(l) : (n = parseFloat(c.getStyle(t, l)) || 0, "opacity" !== l && (a = "px")), r || (r = o), r && r.match && r.match("px") && (r = r.replace(/px/g, "")), s.run(n, r, a)
                            })
                        }, c.seriesType = function(t, e, i, n, r) {
                            var s = c.getOptions(),
                                o = c.seriesTypes;
                            return s.plotOptions[t] = c.merge(s.plotOptions[e], i), o[t] = c.extendClass(o[e] || function() {}, n), o[t].prototype.type = t, r && (o[t].prototype.pointClass = c.extendClass(c.Point, r)), o[t]
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
                            for (var n = 0, r = t.length; n < r; n++)
                                if (!1 === e.call(i, t[n], n, t)) return n
                        }), Array.prototype.indexOf || (c.inArray = function(t, e) {
                            var i, n = 0;
                            if (e) {
                                for (i = e.length; n < i; n++)
                                    if (e[n] === t) return n
                            }
                            return -1
                        }), Array.prototype.filter || (c.grep = function(t, e) {
                            for (var i = [], n = 0, r = t.length; n < r; n++) e(t[n], n) && i.push(t[n]);
                            return i
                        }), Array.prototype.find || (c.find = function(t, e) {
                            var i, n = t.length;
                            for (i = 0; i < n; i++)
                                if (e(t[i], i)) return t[i]
                        }), y = (v = t).each, x = v.isNumber, b = v.map, w = v.merge, k = v.pInt, v.Color = function(t) {
                            if (!s._(this, v.Color)) return new v.Color(t);
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
                                var e, i, n, r;
                                if ((this.input = t = this.names[t && t.toLowerCase ? t.toLowerCase() : ""] || t) && t.stops) this.stops = b(t.stops, function(t) {
                                    return new v.Color(t[1])
                                });
                                else if (t && "#" === t.charAt() && (e = t.length, t = parseInt(t.substr(1), 16), 7 === e ? i = [(0xff0000 & t) >> 16, (65280 & t) >> 8, 255 & t, 1] : 4 === e && (i = [(3840 & t) >> 4 | (3840 & t) >> 8, (240 & t) >> 4 | 240 & t, (15 & t) << 4 | 15 & t, 1])), !i)
                                    for (n = this.parsers.length; n-- && !i;)(e = (r = this.parsers[n]).regex.exec(t)) && (i = r.parse(e));
                                this.rgba = i || []
                            },
                            get: function(t) {
                                var e, i = this.input,
                                    n = this.rgba;
                                return this.stops ? ((e = w(i)).stops = [].concat(e.stops), y(this.stops, function(i, n) {
                                    e.stops[n] = [e.stops[n][0], i.get(t)]
                                })) : e = n && x(n[0]) ? "rgb" !== t && (t || 1 !== n[3]) ? "a" === t ? n[3] : "rgba(" + n.join(",") + ")" : "rgb(" + n[0] + "," + n[1] + "," + n[2] + ")" : i, e
                            },
                            brighten: function(t) {
                                var e, i = this.rgba;
                                if (this.stops) y(this.stops, function(e) {
                                    e.brighten(t)
                                });
                                else if (x(t) && 0 !== t)
                                    for (e = 0; 3 > e; e++) i[e] += k(255 * t), 0 > i[e] && (i[e] = 0), 255 < i[e] && (i[e] = 255);
                                return this
                            },
                            setOpacity: function(t) {
                                return this.rgba[3] = t, this
                            },
                            tweenTo: function(t, e) {
                                var i, n;
                                return t.rgba.length ? (i = this.rgba, t = ((n = 1 !== (t = t.rgba)[3] || 1 !== i[3]) ? "rgba(" : "rgb(") + Math.round(t[0] + (i[0] - t[0]) * (1 - e)) + "," + Math.round(t[1] + (i[1] - t[1]) * (1 - e)) + "," + Math.round(t[2] + (i[2] - t[2]) * (1 - e)) + (n ? "," + (t[3] + (i[3] - t[3]) * (1 - e)) : "") + ")") : t = t.input || "none", t
                            }
                        }, v.color = function(t) {
                            return new v.Color(t)
                        }, T = (S = t).addEvent, A = S.animate, P = S.attr, L = S.charts, I = S.color, O = S.css, D = S.createElement, E = S.defined, N = S.deg2rad, R = S.destroyObjectProperties, B = S.doc, z = S.each, j = S.extend, G = S.erase, W = S.grep, H = S.hasTouch, F = S.inArray, X = S.isArray, Y = S.isFirefox, V = S.isMS, U = S.isObject, _ = S.isString, K = S.isWebKit, q = S.merge, Z = S.noop, $ = S.objectEach, J = S.pick, Q = S.pInt, tt = S.removeEvent, te = S.stop, ti = S.svg, tn = S.SVG_NS, tr = S.symbolSizes, ts = S.win, j((M = S.SVGElement = function() {
                            return this
                        }).prototype, {
                            opacity: 1,
                            SVG_NS: tn,
                            textProps: "direction fontSize fontWeight fontFamily fontStyle color lineHeight width textAlign textDecoration textOverflow textOutline".split(" "),
                            init: function(t, e) {
                                this.element = "span" === e ? D(e) : B.createElementNS(this.SVG_NS, e), this.renderer = t
                            },
                            animate: function(t, e, i) {
                                return 0 !== (e = S.animObject(J(e, this.renderer.globalAnimation, !0))).duration ? (i && (e.complete = i), A(this, t, e)) : (this.attr(t, null, i), e.step && e.step.call(this)), this
                            },
                            colorGradient: function(t, e, i) {
                                var n, r, s, o, a, l, h, c, d, u, p, f = this.renderer,
                                    g = [];
                                t.radialGradient ? r = "radialGradient" : t.linearGradient && (r = "linearGradient"), r && (s = t[r], a = f.gradients, h = t.stops, u = i.radialReference, X(s) && (t[r] = s = {
                                    x1: s[0],
                                    y1: s[1],
                                    x2: s[2],
                                    y2: s[3],
                                    gradientUnits: "userSpaceOnUse"
                                }), "radialGradient" === r && u && !E(s.gradientUnits) && (o = s, s = q(s, f.getRadialAttr(u, o), {
                                    gradientUnits: "userSpaceOnUse"
                                })), $(s, function(t, e) {
                                    "id" !== e && g.push(e, t)
                                }), $(h, function(t) {
                                    g.push(t)
                                }), a[g = g.join(",")] ? u = a[g].attr("id") : (s.id = u = S.uniqueKey(), a[g] = l = f.createElement(r).attr(s).add(f.defs), l.radAttr = o, l.stops = [], z(h, function(t) {
                                    0 === t[1].indexOf("rgba") ? (c = (n = S.color(t[1])).get("rgb"), d = n.get("a")) : (c = t[1], d = 1), t = f.createElement("stop").attr({
                                        offset: t[0],
                                        "stop-color": c,
                                        "stop-opacity": d
                                    }).add(l), l.stops.push(t)
                                })), p = "url(" + f.url + "#" + u + ")", i.setAttribute(e, p), i.gradient = g, t.toString = function() {
                                    return p
                                })
                            },
                            applyTextOutline: function(t) {
                                var e, i, n, r, s, o = this.element;
                                if (-1 !== t.indexOf("contrast") && (t = t.replace(/contrast/g, this.renderer.getContrast(o.style.fill))), i = (t = t.split(" "))[t.length - 1], (n = t[0]) && "none" !== n && S.svg) {
                                    for (this.fakeTS = !0, t = [].slice.call(o.getElementsByTagName("tspan")), this.ySetter = this.xSetter, n = n.replace(/(^[\d\.]+)(.*?)$/g, function(t, e, i) {
                                            return 2 * e + i
                                        }), s = t.length; s--;) "highcharts-text-outline" === (e = t[s]).getAttribute("class") && G(t, o.removeChild(e));
                                    r = o.firstChild, z(t, function(t, e) {
                                        0 === e && (t.setAttribute("x", o.getAttribute("x")), e = o.getAttribute("y"), t.setAttribute("y", e || 0), null === e && o.setAttribute("y", 0)), P(t = t.cloneNode(1), {
                                            class: "highcharts-text-outline",
                                            fill: i,
                                            stroke: i,
                                            "stroke-width": n,
                                            "stroke-linejoin": "round"
                                        }), o.insertBefore(t, r)
                                    })
                                }
                            },
                            attr: function(t, e, i, n) {
                                var r, s, o, a, l = this.element,
                                    h = this;
                                return "string" == typeof t && void 0 !== e && (r = t, (t = {})[r] = e), "string" == typeof t ? h = (this[t + "Getter"] || this._defaultGetter).call(this, t, l) : ($(t, function(e, i) {
                                    o = !1, n || te(this, i), this.symbolName && /^(x|y|width|height|r|start|end|innerR|anchorX|anchorY)$/.test(i) && (s || (this.symbolAttr(t), s = !0), o = !0), this.rotation && ("x" === i || "y" === i) && (this.doTransform = !0), o || ((a = this[i + "Setter"] || this._defaultSetter).call(this, e, i, l), this.shadows && /^(width|height|visibility|x|y|d|transform|cx|cy|r)$/.test(i) && this.updateShadows(i, e, a))
                                }, this), this.afterSetters()), i && i(), h
                            },
                            afterSetters: function() {
                                this.doTransform && (this.updateTransform(), this.doTransform = !1)
                            },
                            updateShadows: function(t, e, i) {
                                for (var n = this.shadows, r = n.length; r--;) i.call(n[r], "height" === t ? Math.max(e - (n[r].cutHeight || 0), 0) : "d" === t ? this.d : e, t, n[r])
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
                                z("x y r start end width height innerR anchorX anchorY".split(" "), function(i) {
                                    e[i] = J(t[i], e[i])
                                }), e.attr({
                                    d: e.renderer.symbols[e.symbolName](e.x, e.y, e.width, e.height, e)
                                })
                            },
                            clip: function(t) {
                                return this.attr("clip-path", t ? "url(" + this.renderer.url + "#" + t.id + ")" : "none")
                            },
                            crisp: function(t, e) {
                                var i, n = this,
                                    r = {};
                                return i = Math.round(e = e || t.strokeWidth || 0) % 2 / 2, t.x = Math.floor(t.x || n.x || 0) + i, t.y = Math.floor(t.y || n.y || 0) + i, t.width = Math.floor((t.width || n.width || 0) - 2 * i), t.height = Math.floor((t.height || n.height || 0) - 2 * i), E(t.strokeWidth) && (t.strokeWidth = e), $(t, function(t, e) {
                                    n[e] !== t && (n[e] = r[e] = t)
                                }), r
                            },
                            css: function(t) {
                                var e, i, n = this.styles,
                                    r = {},
                                    s = this.element,
                                    o = "",
                                    a = !n,
                                    l = ["textOutline", "textOverflow", "width"];
                                return t && t.color && (t.fill = t.color), n && $(t, function(t, e) {
                                    t !== n[e] && (r[e] = t, a = !0)
                                }), a && (n && (t = j(n, r)), e = this.textWidth = t && t.width && "auto" !== t.width && "text" === s.nodeName.toLowerCase() && Q(t.width), this.styles = t, e && !ti && this.renderer.forExport && delete t.width, V && !ti ? O(this.element, t) : (i = function(t, e) {
                                    return "-" + e.toLowerCase()
                                }, $(t, function(t, e) {
                                    -1 === F(e, l) && (o += e.replace(/([A-Z])/g, i) + ":" + t + ";")
                                }), o && P(s, "style", o)), this.added && ("text" === this.element.nodeName && this.renderer.buildText(this), t && t.textOutline && this.applyTextOutline(t.textOutline))), this
                            },
                            strokeWidth: function() {
                                return this["stroke-width"] || 0
                            },
                            on: function(t, e) {
                                var i = this,
                                    n = i.element;
                                return H && "click" === t ? (n.ontouchstart = function(t) {
                                    i.touchEventFired = Date.now(), t.preventDefault(), e.call(n, t)
                                }, n.onclick = function(t) {
                                    (-1 === ts.navigator.userAgent.indexOf("Android") || 1100 < Date.now() - (i.touchEventFired || 0)) && e.call(n, t)
                                }) : n["on" + t] = e, this
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
                                    n = this.scaleY,
                                    r = this.inverted,
                                    s = this.rotation,
                                    o = this.element;
                                r && (t += this.width, e += this.height), t = ["translate(" + t + "," + e + ")"], r ? t.push("rotate(90) scale(-1,1)") : s && t.push("rotate(" + s + " " + (o.getAttribute("x") || 0) + " " + (o.getAttribute("y") || 0) + ")"), (E(i) || E(n)) && t.push("scale(" + J(i, 1) + " " + J(n, 1) + ")"), t.length && o.setAttribute("transform", t.join(" "))
                            },
                            toFront: function() {
                                var t = this.element;
                                return t.parentNode.appendChild(t), this
                            },
                            align: function(t, e, i) {
                                var n, r, s, o, a, l, h = {};
                                return a = (o = this.renderer).alignedObjects, t ? (this.alignOptions = t, this.alignByTranslate = e, (!i || _(i)) && (this.alignTo = s = i || "renderer", G(a, this), a.push(this), i = null)) : (t = this.alignOptions, e = this.alignByTranslate, s = this.alignTo), i = J(i, o[s], o), s = t.align, o = t.verticalAlign, a = (i.x || 0) + (t.x || 0), l = (i.y || 0) + (t.y || 0), "right" === s ? n = 1 : "center" === s && (n = 2), n && (a += (i.width - (t.width || 0)) / n), h[e ? "translateX" : "x"] = Math.round(a), "bottom" === o ? r = 1 : "middle" === o && (r = 2), r && (l += (i.height - (t.height || 0)) / r), h[e ? "translateY" : "y"] = Math.round(l), this[this.placed ? "animate" : "attr"](h), this.placed = !0, this.alignAttr = h, this
                            },
                            getBBox: function(t, e) {
                                var i, n, r, s, o, a = this.renderer,
                                    l = this.element,
                                    h = this.styles,
                                    c = this.textStr,
                                    d = a.cache,
                                    u = a.cacheKeys;
                                if (n = (e = J(e, this.rotation)) * N, r = h && h.fontSize, void 0 !== c && (-1 === (o = c.toString()).indexOf("<") && (o = o.replace(/[0-9]/g, "0")), o += ["", e || 0, r, h && h.width, h && h.textOverflow].join()), o && !t && (i = d[o]), !i) {
                                    if (l.namespaceURI === this.SVG_NS || a.forExport) {
                                        try {
                                            (s = this.fakeTS && function(t) {
                                                z(l.querySelectorAll(".highcharts-text-outline"), function(e) {
                                                    e.style.display = t
                                                })
                                            }) && s("none"), i = l.getBBox ? j({}, l.getBBox()) : {
                                                width: l.offsetWidth,
                                                height: l.offsetHeight
                                            }, s && s("")
                                        } catch (t) {}(!i || 0 > i.width) && (i = {
                                            width: 0,
                                            height: 0
                                        })
                                    } else i = this.htmlGetBBox();
                                    if (a.isSVG && (t = i.width, a = i.height, h && "11px" === h.fontSize && 17 === Math.round(a) && (i.height = a = 14), e && (i.width = Math.abs(a * Math.sin(n)) + Math.abs(t * Math.cos(n)), i.height = Math.abs(a * Math.cos(n)) + Math.abs(t * Math.sin(n)))), o && 0 < i.height) {
                                        for (; 250 < u.length;) delete d[u.shift()];
                                        d[o] || u.push(o), d[o] = i
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
                                    n = this.element;
                                return t && (this.parentGroup = t), this.parentInverted = t && t.inverted, void 0 !== this.textStr && i.buildText(this), this.added = !0, (!t || t.handleZ || this.zIndex) && (e = this.zIndexSetter()), e || (t ? t.element : i.box).appendChild(n), this.onAdd && this.onAdd(), this
                            },
                            safeRemoveChild: function(t) {
                                var e = t.parentNode;
                                e && e.removeChild(t)
                            },
                            destroy: function() {
                                var t = this,
                                    e = t.element || {},
                                    i = t.renderer.isSVG && "SPAN" === e.nodeName && t.parentGroup,
                                    n = e.ownerSVGElement;
                                if (e.onclick = e.onmouseout = e.onmouseover = e.onmousemove = e.point = null, te(t), t.clipPath && n && (z(n.querySelectorAll("[clip-path]"), function(e) {
                                        -1 < e.getAttribute("clip-path").indexOf(t.clipPath.element.id + ")") && e.removeAttribute("clip-path")
                                    }), t.clipPath = t.clipPath.destroy()), t.stops) {
                                    for (n = 0; n < t.stops.length; n++) t.stops[n] = t.stops[n].destroy();
                                    t.stops = null
                                }
                                for (t.safeRemoveChild(e), t.destroyShadows(); i && i.div && 0 === i.div.childNodes.length;) e = i.parentGroup, t.safeRemoveChild(i.div), delete i.div, i = e;
                                return t.alignTo && G(t.renderer.alignedObjects, t), $(t, function(e, i) {
                                    delete t[i]
                                }), null
                            },
                            shadow: function(t, e, i) {
                                var n, r, s, o, a, l, h = [],
                                    c = this.element;
                                if (t) {
                                    if (!this.shadows) {
                                        for (n = 1, o = J(t.width, 3), a = (t.opacity || .15) / o, l = this.parentInverted ? "(-1,-1)" : "(" + J(t.offsetX, 1) + ", " + J(t.offsetY, 1) + ")"; n <= o; n++) r = c.cloneNode(0), s = 2 * o + 1 - 2 * n, P(r, {
                                            isShadow: "true",
                                            stroke: t.color || "#000000",
                                            "stroke-opacity": a * n,
                                            "stroke-width": s,
                                            transform: "translate" + l,
                                            fill: "none"
                                        }), i && (P(r, "height", Math.max(P(r, "height") - s, 0)), r.cutHeight = s), e ? e.element.appendChild(r) : c.parentNode.insertBefore(r, c), h.push(r);
                                        this.shadows = h
                                    }
                                } else this.destroyShadows();
                                return this
                            },
                            destroyShadows: function() {
                                z(this.shadows || [], function(t) {
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
                                e || (e = B.createElementNS(this.SVG_NS, "title"), this.element.appendChild(e)), e.firstChild && e.removeChild(e.firstChild), e.appendChild(B.createTextNode(String(J(t), "").replace(/<[^>]*>/g, "")))
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
                                var i, n, r, s = this.renderer,
                                    o = this.parentGroup,
                                    a = (o || s).element || s.box,
                                    l = this.element;
                                if (n = this.added, E(t) && (l.zIndex = t, t *= 1, this[e] === t && (n = !1), this[e] = t), n) {
                                    for ((t = this.zIndex) && o && (o.handleZ = !0), e = a.childNodes, i = 0; i < e.length && !r; i++) n = (o = e[i]).zIndex, o !== l && (Q(n) > t || !E(t) && E(n) || 0 > t && !E(n) && a !== s.box) && (a.insertBefore(l, o), r = !0);
                                    r || a.appendChild(l)
                                }
                                return r
                            },
                            _defaultSetter: function(t, e, i) {
                                i.setAttribute(e, t)
                            }
                        }), M.prototype.yGetter = M.prototype.xGetter, M.prototype.translateXSetter = M.prototype.translateYSetter = M.prototype.rotationSetter = M.prototype.verticalAlignSetter = M.prototype.scaleXSetter = M.prototype.scaleYSetter = function(t, e) {
                            this[e] = t, this.doTransform = !0
                        }, M.prototype["stroke-widthSetter"] = M.prototype.strokeSetter = function(t, e, i) {
                            this[e] = t, this.stroke && this["stroke-width"] ? (M.prototype.fillSetter.call(this, this.stroke, "stroke", i), i.setAttribute("stroke-width", this["stroke-width"]), this.hasStroke = !0) : "stroke-width" === e && 0 === t && this.hasStroke && (i.removeAttribute("stroke"), this.hasStroke = !1)
                        }, j((C = S.SVGRenderer = function() {
                            this.init.apply(this, arguments)
                        }).prototype, {
                            Element: M,
                            SVG_NS: tn,
                            init: function(t, e, i, n, r, s) {
                                var o, a;
                                o = (n = this.createElement("svg").attr({
                                    version: "1.1",
                                    class: "highcharts-root"
                                }).css(this.getStyle(n))).element, t.appendChild(o), -1 === t.innerHTML.indexOf("xmlns") && P(o, "xmlns", this.SVG_NS), this.isSVG = !0, this.box = o, this.boxWrapper = n, this.alignedObjects = [], this.url = (Y || K) && B.getElementsByTagName("base").length ? ts.location.href.replace(/#.*?$/, "").replace(/<[^>]*>/g, "").replace(/([\('\)])/g, "\\$1").replace(/ /g, "%20") : "", this.createElement("desc").add().element.appendChild(B.createTextNode("Created with Highcharts 5.0.14")), this.defs = this.createElement("defs").add(), this.allowHTML = s, this.forExport = r, this.gradients = {}, this.cache = {}, this.cacheKeys = [], this.imgCount = 0, this.setSize(e, i, !1), Y && t.getBoundingClientRect && ((e = function() {
                                    O(t, {
                                        left: 0,
                                        top: 0
                                    }), a = t.getBoundingClientRect(), O(t, {
                                        left: Math.ceil(a.left) - a.left + "px",
                                        top: Math.ceil(a.top) - a.top + "px"
                                    })
                                })(), this.unSubPixelFix = T(ts, "resize", e))
                            },
                            getStyle: function(t) {
                                return this.style = j({
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
                                return this.box = null, this.boxWrapper = this.boxWrapper.destroy(), R(this.gradients || {}), this.gradients = null, t && (this.defs = t.destroy()), this.unSubPixelFix && this.unSubPixelFix(), this.alignedObjects = null
                            },
                            createElement: function(t) {
                                var e = new this.Element;
                                return e.init(this, t), e
                            },
                            draw: Z,
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
                            applyEllipsis: function(t, e, i, n) {
                                var r, s, o = t.rotation,
                                    a = i,
                                    l = 0,
                                    h = i.length,
                                    c = function(t) {
                                        e.removeChild(e.firstChild), t && e.appendChild(B.createTextNode(t))
                                    };
                                if (t.rotation = 0, s = (a = this.getSpanWidth(t, e)) > n) {
                                    for (; l <= h;) r = Math.ceil((l + h) / 2), c(a = i.substring(0, r) + "…"), a = this.getSpanWidth(t, e), l === h ? l = h + 1 : a > n ? h = r - 1 : l = r;
                                    0 === h && c("")
                                }
                                return t.rotation = o, s
                            },
                            buildText: function(t) {
                                var e, i, n, r, s, o, a = t.element,
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
                                    x = f && "nowrap" === f.whiteSpace,
                                    b = f && f.fontSize,
                                    w = u.length,
                                    f = g && !t.added && this.box,
                                    k = function(t) {
                                        var e;
                                        return e = /(px|em)$/.test(t && t.style.fontSize) ? t.style.fontSize : b || l.style.fontSize || 12, m ? Q(m) : l.fontMetrics(e, t.getAttribute("style") ? t : a).h
                                    };
                                if ((s = [c, y, x, m, v, b, g].join()) !== t.textCache) {
                                    for (t.textCache = s; w--;) a.removeChild(u[w]);
                                    d || v || y || g || -1 !== c.indexOf(" ") ? (e = /<.*class="([^"]+)".*>/, i = /<.*style="([^"]+)".*>/, n = /<.*href="([^"]+)".*>/, f && f.appendChild(a), z(c = W(c = d ? c.replace(/<(b|strong)>/g, '<span style="font-weight:bold">').replace(/<(i|em)>/g, '<span style="font-style:italic">').replace(/<a/g, "<span").replace(/<\/(b|strong|i|em|a)>/g, "</span>").split(/<br.*?>/g) : [c], function(t) {
                                        return "" !== t
                                    }), function(s, c) {
                                        var d, u = 0;
                                        z(d = (s = s.replace(/^\s+|\s+$/g, "").replace(/<span/g, "|||<span").replace(/<\/span>/g, "</span>|||")).split("|||"), function(s) {
                                            if ("" !== s || 1 === d.length) {
                                                var f, m, v = {},
                                                    b = B.createElementNS(l.SVG_NS, "tspan");
                                                if (e.test(s) && P(b, "class", f = s.match(e)[1]), i.test(s) && P(b, "style", m = s.match(i)[1].replace(/(;| |^)color([ :])/, "$1fill$2")), n.test(s) && !h && (P(b, "onclick", 'location.href="' + s.match(n)[1] + '"'), O(b, {
                                                        cursor: "pointer"
                                                    })), " " !== (s = (s.replace(/<(.|\n)*?>/g, "") || " ").replace(/&lt;/g, "<").replace(/&gt;/g, ">"))) {
                                                    if (b.appendChild(B.createTextNode(s)), u ? v.dx = 0 : c && null !== p && (v.x = p), P(b, v), a.appendChild(b), !u && o && (!ti && h && O(b, {
                                                            display: "block"
                                                        }), P(b, "dy", k(b))), g) {
                                                        v = s.replace(/([^\^])-/g, "$1- ").split(" "), f = 1 < d.length || c || 1 < v.length && !x;
                                                        var w, S = [],
                                                            M = k(b),
                                                            C = t.rotation;
                                                        for (y && (r = l.applyEllipsis(t, b, s, g)); !y && f && (v.length || S.length);) t.rotation = 0, s = (w = l.getSpanWidth(t, b)) > g, void 0 === r && (r = s), s && 1 !== v.length ? (b.removeChild(b.firstChild), S.unshift(v.pop())) : (v = S, S = [], v.length && !x && (P(b = B.createElementNS(tn, "tspan"), {
                                                            dy: M,
                                                            x: p
                                                        }), m && P(b, "style", m), a.appendChild(b)), w > g && (g = w)), v.length && b.appendChild(B.createTextNode(v.join(" ").replace(/- /g, "-")));
                                                        t.rotation = C
                                                    }
                                                    u++
                                                }
                                            }
                                        }), o = o || a.childNodes.length
                                    }), r && t.attr("title", t.textStr), f && f.removeChild(a), v && t.applyTextOutline && t.applyTextOutline(v)) : a.appendChild(B.createTextNode(c.replace(/&lt;/g, "<").replace(/&gt;/g, ">")))
                                }
                            },
                            getContrast: function(t) {
                                return 510 < (t = I(t).rgba)[0] + t[1] + t[2] ? "#000000" : "#FFFFFF"
                            },
                            button: function(t, e, i, n, r, s, o, a, l) {
                                var h, c, d, u, p = this.label(t, e, i, l, null, null, null, null, "button"),
                                    f = 0;
                                return p.attr(q({
                                    padding: 8,
                                    r: 2
                                }, r)), h = (r = q({
                                    fill: "#f7f7f7",
                                    stroke: "#cccccc",
                                    "stroke-width": 1,
                                    style: {
                                        color: "#333333",
                                        cursor: "pointer",
                                        fontWeight: "normal"
                                    }
                                }, r)).style, delete r.style, c = (s = q(r, {
                                    fill: "#e6e6e6"
                                }, s)).style, delete s.style, d = (o = q(r, {
                                    fill: "#e6ebf5",
                                    style: {
                                        color: "#000000",
                                        fontWeight: "bold"
                                    }
                                }, o)).style, delete o.style, u = (a = q(r, {
                                    style: {
                                        color: "#cccccc"
                                    }
                                }, a)).style, delete a.style, T(p.element, V ? "mouseover" : "mouseenter", function() {
                                    3 !== f && p.setState(1)
                                }), T(p.element, V ? "mouseout" : "mouseleave", function() {
                                    3 !== f && p.setState(f)
                                }), p.setState = function(t) {
                                    1 !== t && (p.state = f = t), p.removeClass(/highcharts-button-(normal|hover|pressed|disabled)/).addClass("highcharts-button-" + ["normal", "hover", "pressed", "disabled"][t || 0]), p.attr([r, s, o, a][t || 0]).css([h, c, d, u][t || 0])
                                }, p.attr(r).css(j({
                                    cursor: "default"
                                }, h)), p.on("click", function(t) {
                                    3 !== f && n.call(p, t)
                                })
                            },
                            crispLine: function(t, e) {
                                return t[1] === t[4] && (t[1] = t[4] = Math.round(t[1]) - e % 2 / 2), t[2] === t[5] && (t[2] = t[5] = Math.round(t[2]) + e % 2 / 2), t
                            },
                            path: function(t) {
                                var e = {
                                    fill: "none"
                                };
                                return X(t) ? e.d = t : U(t) && j(e, t), this.createElement("path").attr(e)
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
                            arc: function(t, e, i, n, r, s) {
                                return U(t) ? (e = (n = t).y, i = n.r, t = n.x) : n = {
                                    innerR: n,
                                    start: r,
                                    end: s
                                }, (t = this.symbol("arc", t, e, i, i, n)).r = i, t
                            },
                            rect: function(t, e, i, n, r, s) {
                                r = U(t) ? t.r : r;
                                var o = this.createElement("rect");
                                return t = U(t) ? t : void 0 === t ? {} : {
                                    x: t,
                                    y: e,
                                    width: Math.max(i, 0),
                                    height: Math.max(n, 0)
                                }, void 0 !== s && (t.strokeWidth = s, t = o.crisp(t)), t.fill = "none", r && (t.r = r), o.rSetter = function(t, e, i) {
                                    P(i, {
                                        rx: t,
                                        ry: t
                                    })
                                }, o.attr(t)
                            },
                            setSize: function(t, e, i) {
                                var n = this.alignedObjects,
                                    r = n.length;
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
                                    }); r--;) n[r].align()
                            },
                            g: function(t) {
                                var e = this.createElement("g");
                                return t ? e.attr({
                                    class: "highcharts-" + t
                                }) : e
                            },
                            image: function(t, e, i, n, r) {
                                var s = {
                                    preserveAspectRatio: "none"
                                };
                                return 1 < arguments.length && j(s, {
                                    x: e,
                                    y: i,
                                    width: n,
                                    height: r
                                }), (s = this.createElement("image").attr(s)).element.setAttributeNS ? s.element.setAttributeNS("http://www.w3.org/1999/xlink", "href", t) : s.element.setAttribute("hc-svg-href", t), s
                            },
                            symbol: function(t, e, i, n, r, s) {
                                var o, a, l, h = this,
                                    c = /^url\((.*?)\)$/,
                                    d = c.test(t),
                                    u = !d && (this.symbols[t] ? t : "circle"),
                                    p = u && this.symbols[u],
                                    f = E(e) && p && p.call(this.symbols, Math.round(e), Math.round(i), n, r, s);
                                return p ? ((o = this.path(f)).attr("fill", "none"), j(o, {
                                    symbolName: u,
                                    x: e,
                                    y: i,
                                    width: n,
                                    height: r
                                }), s && j(o, s)) : d && (a = t.match(c)[1], (o = this.image(a)).imgwidth = J(tr[a] && tr[a].width, s && s.width), o.imgheight = J(tr[a] && tr[a].height, s && s.height), l = function() {
                                    o.attr({
                                        width: o.width,
                                        height: o.height
                                    })
                                }, z(["width", "height"], function(t) {
                                    o[t + "Setter"] = function(t, e) {
                                        var i = {},
                                            n = this["img" + e],
                                            r = "width" === e ? "translateX" : "translateY";
                                        this[e] = t, E(n) && (this.element && this.element.setAttribute(e, n), this.alignByTranslate || (i[r] = ((this[e] || 0) - n) / 2, this.attr(i)))
                                    }
                                }), E(e) && o.attr({
                                    x: e,
                                    y: i
                                }), o.isImg = !0, E(o.imgwidth) && E(o.imgheight) ? l() : (o.attr({
                                    width: 0,
                                    height: 0
                                }), D("img", {
                                    onload: function() {
                                        var t = L[h.chartIndex];
                                        0 === this.width && (O(this, {
                                            position: "absolute",
                                            top: "-999em"
                                        }), B.body.appendChild(this)), tr[a] = {
                                            width: this.width,
                                            height: this.height
                                        }, o.imgwidth = this.width, o.imgheight = this.height, o.element && l(), this.parentNode && this.parentNode.removeChild(this), h.imgCount--, !h.imgCount && t && t.onload && t.onload()
                                    },
                                    src: a
                                }), this.imgCount++)), o
                            },
                            symbols: {
                                circle: function(t, e, i, n) {
                                    return this.arc(t + i / 2, e + n / 2, i / 2, n / 2, {
                                        start: 0,
                                        end: 2 * Math.PI,
                                        open: !1
                                    })
                                },
                                square: function(t, e, i, n) {
                                    return ["M", t, e, "L", t + i, e, t + i, e + n, t, e + n, "Z"]
                                },
                                triangle: function(t, e, i, n) {
                                    return ["M", t + i / 2, e, "L", t + i, e + n, t, e + n, "Z"]
                                },
                                "triangle-down": function(t, e, i, n) {
                                    return ["M", t, e, "L", t + i, e, t + i / 2, e + n, "Z"]
                                },
                                diamond: function(t, e, i, n) {
                                    return ["M", t + i / 2, e, "L", t + i, e + n / 2, t + i / 2, e + n, t, e + n / 2, "Z"]
                                },
                                arc: function(t, e, i, n, r) {
                                    var s = r.start,
                                        o = r.r || i,
                                        a = r.r || n || i,
                                        l = r.end - .001;
                                    i = r.innerR, n = J(r.open, .001 > Math.abs(r.end - r.start - 2 * Math.PI));
                                    var h = Math.cos(s),
                                        c = Math.sin(s),
                                        d = Math.cos(l),
                                        l = Math.sin(l);
                                    return o = ["M", t + o * h, e + a * c, "A", o, a, 0, r = .001 > r.end - s - Math.PI ? 0 : 1, 1, t + o * d, e + a * l], E(i) && o.push(n ? "M" : "L", t + i * d, e + i * l, "A", i, i, 0, r, 0, t + i * h, e + i * c), o.push(n ? "" : "Z"), o
                                },
                                callout: function(t, e, i, n, r) {
                                    var s, o = Math.min(r && r.r || 0, i, n),
                                        a = o + 6,
                                        l = r && r.anchorX;
                                    return r = r && r.anchorY, s = ["M", t + o, e, "L", t + i - o, e, "C", t + i, e, t + i, e, t + i, e + o, "L", t + i, e + n - o, "C", t + i, e + n, t + i, e + n, t + i - o, e + n, "L", t + o, e + n, "C", t, e + n, t, e + n, t, e + n - o, "L", t, e + o, "C", t, e, t, e, t + o, e], l && l > i ? r > e + a && r < e + n - a ? s.splice(13, 3, "L", t + i, r - 6, t + i + 6, r, t + i, r + 6, t + i, e + n - o) : s.splice(13, 3, "L", t + i, n / 2, l, r, t + i, n / 2, t + i, e + n - o) : l && 0 > l ? r > e + a && r < e + n - a ? s.splice(33, 3, "L", t, r + 6, t - 6, r, t, r - 6, t, e + o) : s.splice(33, 3, "L", t, n / 2, l, r, t, n / 2, t, e + o) : r && r > n && l > t + a && l < t + i - a ? s.splice(23, 3, "L", l + 6, e + n, l, e + n + 6, l - 6, e + n, t + o, e + n) : r && 0 > r && l > t + a && l < t + i - a && s.splice(3, 3, "L", l - 6, e, l, e - 6, l + 6, e, i - o, e), s
                                }
                            },
                            clipRect: function(t, e, i, n) {
                                var r = S.uniqueKey(),
                                    s = this.createElement("clipPath").attr({
                                        id: r
                                    }).add(this.defs);
                                return (t = this.rect(t, e, i, n, 0).add(s)).id = r, t.clipPath = s, t.count = 0, t
                            },
                            text: function(t, e, i, n) {
                                var r = !ti && this.forExport,
                                    s = {};
                                return n && (this.allowHTML || !this.forExport) ? this.html(t, e, i) : (s.x = Math.round(e || 0), i && (s.y = Math.round(i)), (t || 0 === t) && (s.text = t), t = this.createElement("text").attr(s), r && t.css({
                                    position: "absolute"
                                }), n || (t.xSetter = function(t, e, i) {
                                    var n, r, s = i.getElementsByTagName("tspan"),
                                        o = i.getAttribute(e);
                                    for (r = 0; r < s.length; r++)(n = s[r]).getAttribute(e) === o && n.setAttribute(e, t);
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
                                var n = t;
                                return e && i && (n = Math.max(n * Math.cos(e * N), 4)), {
                                    x: -t / 3 * Math.sin(e * N),
                                    y: n
                                }
                            },
                            label: function(t, e, i, n, r, s, o, a, l) {
                                var h, c, d, u, p, f, g, m, v, y, x, b, w, k = this,
                                    C = k.g("button" !== l && "label"),
                                    T = C.text = k.text("", 0, 0, o).attr({
                                        zIndex: 1
                                    }),
                                    A = 0,
                                    P = 3,
                                    L = 0,
                                    I = {},
                                    O = /^url\((.*?)\)$/.test(n),
                                    D = O;
                                l && C.addClass("highcharts-" + l), D = O, y = function() {
                                    return (m || 0) % 2 / 2
                                }, x = function() {
                                    var t = T.element.style,
                                        e = {};
                                    c = (void 0 === d || void 0 === u || g) && E(T.textStr) && T.getBBox(), C.width = (d || c.width || 0) + 2 * P + L, C.height = (u || c.height || 0) + 2 * P, v = P + k.fontMetrics(t && t.fontSize, T).b, D && (h || (C.box = h = k.symbols[n] || O ? k.symbol(n) : k.rect(), h.addClass(("button" === l ? "" : "highcharts-label-box") + (l ? " highcharts-" + l + "-box" : "")), h.add(C), e.x = t = y(), e.y = (a ? -v : 0) + t), e.width = Math.round(C.width), e.height = Math.round(C.height), h.attr(j(e, I)), I = {})
                                }, b = function() {
                                    var t, e = L + P;
                                    t = a ? 0 : v, E(d) && c && ("center" === g || "right" === g) && (e += ({
                                        center: .5,
                                        right: 1
                                    })[g] * (d - c.width)), (e !== T.x || t !== T.y) && (T.attr("x", e), void 0 !== t && T.attr("y", t)), T.x = e, T.y = t
                                }, w = function(t, e) {
                                    h ? h.attr(t, e) : I[t] = e
                                }, C.onAdd = function() {
                                    T.add(C), C.attr({
                                        text: t || 0 === t ? t : "",
                                        x: e,
                                        y: i
                                    }), h && E(r) && C.attr({
                                        anchorX: r,
                                        anchorY: s
                                    })
                                }, C.widthSetter = function(t) {
                                    d = S.isNumber(t) ? t : null
                                }, C.heightSetter = function(t) {
                                    u = t
                                }, C["text-alignSetter"] = function(t) {
                                    g = t
                                }, C.paddingSetter = function(t) {
                                    E(t) && t !== P && (P = C.padding = t, b())
                                }, C.paddingLeftSetter = function(t) {
                                    E(t) && t !== L && (L = t, b())
                                }, C.alignSetter = function(t) {
                                    (t = ({
                                        left: 0,
                                        center: .5,
                                        right: 1
                                    })[t]) !== A && (A = t, c && C.attr({
                                        x: p
                                    }))
                                }, C.textSetter = function(t) {
                                    void 0 !== t && T.textSetter(t), x(), b()
                                }, C["stroke-widthSetter"] = function(t, e) {
                                    t && (D = !0), m = this["stroke-width"] = t, w(e, t)
                                }, C.strokeSetter = C.fillSetter = C.rSetter = function(t, e) {
                                    "r" !== e && ("fill" === e && t && (D = !0), C[e] = t), w(e, t)
                                }, C.anchorXSetter = function(t, e) {
                                    r = C.anchorX = t, w(e, Math.round(t) - y() - p)
                                }, C.anchorYSetter = function(t, e) {
                                    s = C.anchorY = t, w(e, t - f)
                                }, C.xSetter = function(t) {
                                    C.x = t, A && (t -= A * ((d || c.width) + 2 * P)), p = Math.round(t), C.attr("translateX", p)
                                }, C.ySetter = function(t) {
                                    f = C.y = Math.round(t), C.attr("translateY", f)
                                };
                                var N = C.css;
                                return j(C, {
                                    css: function(t) {
                                        if (t) {
                                            var e = {};
                                            t = q(t), z(C.textProps, function(i) {
                                                void 0 !== t[i] && (e[i] = t[i], delete t[i])
                                            }), T.css(e)
                                        }
                                        return N.call(C, t)
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
                                        return t && (x(), h && h.shadow(t)), C
                                    },
                                    destroy: function() {
                                        tt(C.element, "mouseenter"), tt(C.element, "mouseleave"), T && (T = T.destroy()), h && (h = h.destroy()), M.prototype.destroy.call(C), C = k = x = b = w = null
                                    }
                                })
                            }
                        }), S.Renderer = C, ta = (to = t).attr, tl = to.createElement, th = to.css, tc = to.defined, td = to.each, tu = to.extend, tp = to.isFirefox, tf = to.isMS, tg = to.isWebKit, tm = to.pInt, tv = to.SVGRenderer, ty = to.win, tx = to.wrap, tu(to.SVGElement.prototype, {
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
                                        n = this.translateY || 0,
                                        r = this.x || 0,
                                        s = this.y || 0,
                                        o = this.textAlign || "left",
                                        a = {
                                            left: 0,
                                            center: .5,
                                            right: 1
                                        } [o],
                                        l = this.styles;
                                    if (th(e, {
                                            marginLeft: i,
                                            marginTop: n
                                        }), this.shadows && td(this.shadows, function(t) {
                                            th(t, {
                                                marginLeft: i + 1,
                                                marginTop: n + 1
                                            })
                                        }), this.inverted && td(e.childNodes, function(i) {
                                            t.invertChild(i, e)
                                        }), "SPAN" === e.tagName) {
                                        var h = this.rotation,
                                            c = tm(this.textWidth),
                                            d = l && l.whiteSpace,
                                            u = [h, o, e.innerHTML, this.textWidth, this.textAlign].join();
                                        u !== this.cTT && (l = t.fontMetrics(e.style.fontSize).b, tc(h) && this.setSpanRotation(h, a, l), th(e, {
                                            width: "",
                                            whiteSpace: d || "nowrap"
                                        }), e.offsetWidth > c && /[ \-]/.test(e.textContent || e.innerText) && th(e, {
                                            width: c + "px",
                                            display: "block",
                                            whiteSpace: d || "normal"
                                        }), this.getSpanCorrection(e.offsetWidth, l, a, h, o)), th(e, {
                                            left: r + (this.xCorr || 0) + "px",
                                            top: s + (this.yCorr || 0) + "px"
                                        }), tg && (l = e.offsetHeight), this.cTT = u
                                    }
                                } else this.alignOnAdd = !0
                            },
                            setSpanRotation: function(t, e, i) {
                                var n = {},
                                    r = tf ? "-ms-transform" : tg ? "-webkit-transform" : tp ? "MozTransform" : ty.opera ? "-o-transform" : "";
                                n[r] = n.transform = "rotate(" + t + "deg)", n[r + (tp ? "Origin" : "-origin")] = n.transformOrigin = 100 * e + "% " + i + "px", th(this.element, n)
                            },
                            getSpanCorrection: function(t, e, i) {
                                this.xCorr = -t * i, this.yCorr = -e
                            }
                        }), tu(tv.prototype, {
                            html: function(t, e, i) {
                                var n = this.createElement("span"),
                                    r = n.element,
                                    s = n.renderer,
                                    o = s.isSVG,
                                    a = function(t, e) {
                                        td(["opacity", "visibility"], function(i) {
                                            tx(t, i + "Setter", function(t, i, n, r) {
                                                t.call(this, i, n, r), e[n] = i
                                            })
                                        })
                                    };
                                return n.textSetter = function(t) {
                                    t !== r.innerHTML && delete this.bBox, r.innerHTML = this.textStr = t, n.htmlUpdateTransform()
                                }, o && a(n, n.element.style), n.xSetter = n.ySetter = n.alignSetter = n.rotationSetter = function(t, e) {
                                    "align" === e && (e = "textAlign"), n[e] = t, n.htmlUpdateTransform()
                                }, n.attr({
                                    text: t,
                                    x: Math.round(e),
                                    y: Math.round(i)
                                }).css({
                                    fontFamily: this.style.fontFamily,
                                    fontSize: this.style.fontSize,
                                    position: "absolute"
                                }), r.style.whiteSpace = "nowrap", n.css = n.htmlCss, o && (n.add = function(t) {
                                    var e, i = s.box.parentNode,
                                        o = [];
                                    if (this.parentGroup = t) {
                                        if (!(e = t.div)) {
                                            for (; t;) o.push(t), t = t.parentGroup;
                                            td(o.reverse(), function(t) {
                                                var r, s = ta(t.element, "class");
                                                s && (s = {
                                                    className: s
                                                }), r = (e = t.div = t.div || tl("div", s, {
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
                                                        return o[0].div && n.on.apply({
                                                            element: o[0].div
                                                        }, arguments), t
                                                    },
                                                    translateXSetter: function(e, i) {
                                                        r.left = e + "px", t[i] = e, t.doTransform = !0
                                                    },
                                                    translateYSetter: function(e, i) {
                                                        r.top = e + "px", t[i] = e, t.doTransform = !0
                                                    }
                                                }), a(t, r)
                                            })
                                        }
                                    } else e = i;
                                    return e.appendChild(r), n.added = !0, n.alignOnAdd && n.htmlUpdateTransform(), n
                                }), n
                            }
                        }), tS = (tb = t).createElement, tM = tb.css, tC = tb.defined, tT = tb.deg2rad, tA = tb.discardElement, tP = tb.doc, tL = tb.each, tI = tb.erase, tO = tb.extend, tw = tb.extendClass, tD = tb.isArray, tE = tb.isNumber, tN = tb.isObject, tR = tb.merge, tk = tb.noop, tB = tb.pick, tz = tb.pInt, tj = tb.SVGElement, tG = tb.SVGRenderer, tW = tb.win, tb.svg || ((tk = {
                            docMode8: tP && 8 === tP.documentMode,
                            init: function(t, e) {
                                var i = ["<", e, ' filled="f" stroked="f"'],
                                    n = ["position: ", "absolute", ";"],
                                    r = "div" === e;
                                ("shape" === e || r) && n.push("left:0;top:0;width:1px;height:1px;"), n.push("visibility: ", r ? "hidden" : "visible"), i.push(' style="', n.join(""), '"/>'), e && (i = r || "span" === e || "img" === e ? i.join("") : t.prepVML(i), this.element = tS(i)), this.renderer = t
                            },
                            add: function(t) {
                                var e = this.renderer,
                                    i = this.element,
                                    n = e.box,
                                    r = t && t.inverted,
                                    n = t ? t.element || t : n;
                                return t && (this.parentGroup = t), r && e.invertChild(i, n), n.appendChild(i), this.added = !0, this.alignOnAdd && !this.deferUpdateTransform && this.updateTransform(), this.onAdd && this.onAdd(), this.className && this.attr("class", this.className), this
                            },
                            updateTransform: tj.prototype.htmlUpdateTransform,
                            setSpanRotation: function() {
                                var t = this.rotation,
                                    e = Math.cos(t * tT),
                                    i = Math.sin(t * tT);
                                tM(this.element, {
                                    filter: t ? ["progid:DXImageTransform.Microsoft.Matrix(M11=", e, ", M12=", -i, ", M21=", i, ", M22=", e, ", sizingMethod='auto expand')"].join("") : "none"
                                })
                            },
                            getSpanCorrection: function(t, e, i, n, r) {
                                var s, o = n ? Math.cos(n * tT) : 1,
                                    a = n ? Math.sin(n * tT) : 0,
                                    l = tB(this.elemHeight, this.element.offsetHeight);
                                this.xCorr = 0 > o && -t, this.yCorr = 0 > a && -l, s = 0 > o * a, this.xCorr += a * e * (s ? 1 - i : i), this.yCorr -= o * e * (n ? s ? i : 1 - i : 1), r && "left" !== r && (this.xCorr -= t * i * (0 > o ? -1 : 1), n && (this.yCorr -= l * i * (0 > a ? -1 : 1)), tM(this.element, {
                                    textAlign: r
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
                            css: tj.prototype.htmlCss,
                            safeRemoveChild: function(t) {
                                t.parentNode && tA(t)
                            },
                            destroy: function() {
                                return this.destroyClip && this.destroyClip(), tj.prototype.destroy.apply(this)
                            },
                            on: function(t, e) {
                                return this.element["on" + t] = function() {
                                    var t = tW.event;
                                    t.target = t.srcElement, e(t)
                                }, this
                            },
                            cutOffPath: function(t, e) {
                                var i;
                                return (9 === (i = (t = t.split(/[ ,]/)).length) || 11 === i) && (t[i - 4] = t[i - 2] = tz(t[i - 2]) - 10 * e), t.join(" ")
                            },
                            shadow: function(t, e, i) {
                                var n, r, s, o, a, l, h, c = [],
                                    d = this.element,
                                    u = this.renderer,
                                    p = d.style,
                                    f = d.path;
                                if (f && "string" != typeof f.value && (f = "x"), a = f, t) {
                                    for (n = 1, l = tB(t.width, 3), h = (t.opacity || .15) / l; 3 >= n; n++) o = 2 * l + 1 - 2 * n, i && (a = this.cutOffPath(f.value, o + .5)), s = ['<shape isShadow="true" strokeweight="', o, '" filled="false" path="', a, '" coordsize="10 10" style="', d.style.cssText, '" />'], r = tS(u.prepVML(s), null, {
                                        left: tz(p.left) + tB(t.offsetX, 1),
                                        top: tz(p.top) + tB(t.offsetY, 1)
                                    }), i && (r.cutOff = o + 1), s = ['<stroke color="', t.color || "#000000", '" opacity="', h * n, '"/>'], tS(u.prepVML(s), null, null, r), e ? e.element.appendChild(r) : d.parentNode.insertBefore(r, d), c.push(r);
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
                                var n = this.shadows;
                                if (t = t || [], this.d = t.join && t.join(" "), i.path = t = this.pathToVML(t), n)
                                    for (i = n.length; i--;) n[i].path = n[i].cutOff ? this.cutOffPath(t, n[i].cutOff) : t;
                                this.setAttr(e, t)
                            },
                            fillSetter: function(t, e, i) {
                                var n = i.nodeName;
                                "SPAN" === n ? i.style.color = t : "IMG" !== n && (i.filled = "none" !== t, this.setAttr("fillcolor", this.renderer.color(t, i, e, this)))
                            },
                            "fill-opacitySetter": function(t, e, i) {
                                tS(this.renderer.prepVML(["<", e.split("-")[0], ' opacity="', t, '"/>']), null, null, i)
                            },
                            opacitySetter: tk,
                            rotationSetter: function(t, e, i) {
                                i = i.style, this[e] = i[e] = t, i.left = -Math.round(Math.sin(t * tT) + 1) + "px", i.top = Math.round(Math.cos(t * tT)) + "px"
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
                                "inherit" === t && (t = "visible"), this.shadows && tL(this.shadows, function(i) {
                                    i.style[e] = t
                                }), "DIV" === i.nodeName && (t = "hidden" === t ? "-999em" : 0, this.docMode8 || (i.style[e] = t ? "visible" : "hidden"), e = "top"), i.style[e] = t
                            },
                            xSetter: function(t, e, i) {
                                this[e] = t, "x" === e ? e = "left" : "y" === e && (e = "top"), this.updateClipping ? (this[e] = t, this.updateClipping()) : i.style[e] = t
                            },
                            zIndexSetter: function(t, e, i) {
                                i.style[e] = t
                            }
                        })["stroke-opacitySetter"] = tk["fill-opacitySetter"], tb.VMLElement = tk = tw(tj, tk), tk.prototype.ySetter = tk.prototype.widthSetter = tk.prototype.heightSetter = tk.prototype.xSetter, tk = {
                            Element: tk,
                            isIE8: -1 < tW.navigator.userAgent.indexOf("MSIE 8.0"),
                            init: function(t, e, i) {
                                var n, r;
                                if (this.alignedObjects = [], r = (n = this.createElement("div").css({
                                        position: "relative"
                                    })).element, t.appendChild(n.element), this.isVML = !0, this.box = r, this.boxWrapper = n, this.gradients = {}, this.cache = {}, this.cacheKeys = [], this.imgCount = 0, this.setSize(e, i, !1), !tP.namespaces.hcv) {
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
                            clipRect: function(t, e, i, n) {
                                var r = this.createElement(),
                                    s = tN(t);
                                return tO(r, {
                                    members: [],
                                    count: 0,
                                    left: (s ? t.x : t) + 1,
                                    top: (s ? t.y : e) + 1,
                                    width: (s ? t.width : i) - 1,
                                    height: (s ? t.height : n) - 1,
                                    getCSS: function(t) {
                                        var e = t.element,
                                            i = e.nodeName,
                                            n = t.inverted,
                                            r = this.top - ("shape" === i ? e.offsetTop : 0),
                                            s = this.left,
                                            e = s + this.width,
                                            o = r + this.height,
                                            r = {
                                                clip: "rect(" + Math.round(n ? s : r) + "px," + Math.round(n ? o : e) + "px," + Math.round(n ? e : o) + "px," + Math.round(n ? r : s) + "px)"
                                            };
                                        return !n && t.docMode8 && "DIV" === i && tO(r, {
                                            width: e + "px",
                                            height: o + "px"
                                        }), r
                                    },
                                    updateClipping: function() {
                                        tL(r.members, function(t) {
                                            t.element && t.css(r.getCSS(t))
                                        })
                                    }
                                })
                            },
                            color: function(t, e, i, n) {
                                var r, s, o, a = this,
                                    l = /^rgba/,
                                    h = "none";
                                if (t && t.linearGradient ? o = "gradient" : t && t.radialGradient && (o = "pattern"), o) {
                                    var c, d, u, p, f, g, m, v = t.linearGradient || t.radialGradient,
                                        y = "";
                                    t = t.stops;
                                    var x, b = [],
                                        w = function() {
                                            s = ['<fill colors="' + b.join(",") + '" opacity="', f, '" o:opacity2="', p, '" type="', o, '" ', y, 'focus="100%" method="any" />'], tS(a.prepVML(s), null, null, e)
                                        };
                                    if (u = t[0], x = t[t.length - 1], 0 < u[0] && t.unshift([0, u[1]]), 1 > x[0] && t.push([1, x[1]]), tL(t, function(t, e) {
                                            l.test(t[1]) ? (c = (r = tb.color(t[1])).get("rgb"), d = r.get("a")) : (c = t[1], d = 1), b.push(100 * t[0] + "% " + c), e ? (f = d, g = c) : (p = d, m = c)
                                        }), "fill" === i)
                                        if ("gradient" === o) i = v.x1 || v[0] || 0, t = v.y1 || v[1] || 0, u = v.x2 || v[2] || 0, y = 'angle="' + (90 - 180 * Math.atan(((v = v.y2 || v[3] || 0) - t) / (u - i)) / Math.PI) + '"', w();
                                        else {
                                            var k, h = v.r,
                                                S = 2 * h,
                                                M = 2 * h,
                                                C = v.cx,
                                                T = v.cy,
                                                A = e.radialReference,
                                                h = function() {
                                                    A && (k = n.getBBox(), C += (A[0] - k.x) / k.width - .5, T += (A[1] - k.y) / k.height - .5, S *= A[2] / k.width, M *= A[2] / k.height), y = 'src="' + tb.getOptions().global.VMLRadialGradientURL + '" size="' + S + "," + M + '" origin="0.5,0.5" position="' + C + "," + T + '" color2="' + m + '" ', w()
                                                };
                                            n.added ? h() : n.onAdd = h, h = g
                                        }
                                    else h = c
                                } else l.test(t) && "IMG" !== e.tagName ? (r = tb.color(t), n[i + "-opacitySetter"](r.get("a"), i, e), h = r.get("rgb")) : ((h = e.getElementsByTagName(i)).length && (h[0].opacity = 1, h[0].type = "solid"), h = t);
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
                                return tD(t) ? e.d = t : tN(t) && tO(e, t), this.createElement("shape").attr(e)
                            },
                            circle: function(t, e, i) {
                                var n = this.symbol("circle");
                                return tN(t) && (i = t.r, e = t.y, t = t.x), n.isCircle = !0, n.r = i, n.attr({
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
                            image: function(t, e, i, n, r) {
                                var s = this.createElement("img").attr({
                                    src: t
                                });
                                return 1 < arguments.length && s.attr({
                                    x: e,
                                    y: i,
                                    width: n,
                                    height: r
                                }), s
                            },
                            createElement: function(t) {
                                return "rect" === t ? this.symbol(t) : tG.prototype.createElement.call(this, t)
                            },
                            invertChild: function(t, e) {
                                var i = this;
                                e = e.style;
                                var n = "IMG" === t.tagName && t.style;
                                tM(t, {
                                    flip: "x",
                                    left: tz(e.width) - (n ? tz(n.top) : 1),
                                    top: tz(e.height) - (n ? tz(n.left) : 1),
                                    rotation: -90
                                }), tL(t.childNodes, function(e) {
                                    i.invertChild(e, t)
                                })
                            },
                            symbols: {
                                arc: function(t, e, i, n, r) {
                                    var s = r.start,
                                        o = r.end,
                                        a = r.r || i || n;
                                    i = r.innerR, n = Math.cos(s);
                                    var l = Math.sin(s),
                                        h = Math.cos(o),
                                        c = Math.sin(o);
                                    return 0 == o - s ? ["x"] : (s = ["wa", t - a, e - a, t + a, e + a, t + a * n, e + a * l, t + a * h, e + a * c], r.open && !i && s.push("e", "M", t, e), s.push("at", t - i, e - i, t + i, e + i, t + i * h, e + i * c, t + i * n, e + i * l, "x", "e"), s.isArc = !0, s)
                                },
                                circle: function(t, e, i, n, r) {
                                    return r && tC(r.r) && (i = n = 2 * r.r), r && r.isCircle && (t -= i / 2, e -= n / 2), ["wa", t, e, t + i, e + n, t + i, e + n / 2, t + i, e + n / 2, "e"]
                                },
                                rect: function(t, e, i, n, r) {
                                    return tG.prototype.symbols[tC(r) && r.r ? "callout" : "square"].call(0, t, e, i, n, r)
                                }
                            }
                        }, tb.VMLRenderer = tw = function() {
                            this.init.apply(this, arguments)
                        }, tw.prototype = tR(tG.prototype, tk), tb.Renderer = tw), tG.prototype.measureSpanWidth = function(t, e) {
                            var i = tP.createElement("span");
                            return t = tP.createTextNode(t), i.appendChild(t), tM(i, e), this.box.appendChild(i), e = i.offsetWidth, tA(i), e
                        },
                        function(t) {
                            function e() {
                                var e, i = t.defaultOptions.global,
                                    s = i.useUTC,
                                    l = s ? "getUTC" : "get",
                                    h = s ? "setUTC" : "set";
                                t.Date = e = i.Date || a.Date, e.hcTimezoneOffset = s && i.timezoneOffset, e.hcGetTimezoneOffset = function() {
                                    var e = t.defaultOptions.global,
                                        i = a.moment;
                                    if (e.timezone) {
                                        if (i) return function(t) {
                                            return -i.tz(t, e.timezone).utcOffset()
                                        };
                                        t.error(25)
                                    }
                                    return e.useUTC && e.getTimezoneOffset
                                }(), e.hcMakeTime = function(t, i, n, a, l, h) {
                                    var c;
                                    return s ? (c = e.UTC.apply(0, arguments), c += r(c)) : c = new e(t, i, o(n, 1), o(a, 0), o(l, 0), o(h, 0)).getTime(), c
                                }, n("Minutes Hours Day Date Month FullYear".split(" "), function(t) {
                                    e["hcGet" + t] = l + t
                                }), n("Milliseconds Seconds Minutes Hours Date Month FullYear".split(" "), function(t) {
                                    e["hcSet" + t] = h + t
                                })
                            }
                            var i = t.color,
                                n = t.each,
                                r = t.getTZOffset,
                                s = t.merge,
                                o = t.pick,
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
                                return t.defaultOptions = s(!0, t.defaultOptions, i), e(), t.defaultOptions
                            }, t.getOptions = function() {
                                return t.defaultOptions
                            }, t.defaultPlotOptions = t.defaultOptions.plotOptions, e()
                        }(t), tF = (tH = t).correctFloat, tX = tH.defined, tY = tH.destroyObjectProperties, tV = tH.isNumber, tU = tH.merge, t_ = tH.pick, tK = tH.deg2rad, tH.Tick = function(t, e, i, n) {
                            this.axis = t, this.pos = e, this.type = i || "", this.isNewLabel = this.isNew = !0, i || n || this.addLabel()
                        }, tH.Tick.prototype = {
                            addLabel: function() {
                                var t, e = this.axis,
                                    i = e.options,
                                    n = e.chart,
                                    r = e.categories,
                                    s = e.names,
                                    o = this.pos,
                                    a = i.labels,
                                    l = e.tickPositions,
                                    h = o === l[0],
                                    c = o === l[l.length - 1],
                                    s = r ? t_(r[o], s[o], o) : o,
                                    r = this.label,
                                    l = l.info;
                                e.isDatetimeAxis && l && (t = i.dateTimeLabelFormats[l.higherRanks[o] || l.unitName]), this.isFirst = h, this.isLast = c, i = e.labelFormatter.call({
                                    axis: e,
                                    chart: n,
                                    isFirst: h,
                                    isLast: c,
                                    dateTimeLabelFormat: t,
                                    value: e.isLog ? tF(e.lin2log(s)) : s,
                                    pos: o
                                }), tX(r) ? r && r.attr({
                                    text: i
                                }) : (this.labelLength = (this.label = r = tX(i) && a.enabled ? n.renderer.text(i, 0, 0, a.useHTML).css(tU(a.style)).add(e.labelGroup) : null) && r.getBBox().width, this.rotation = 0)
                            },
                            getLabelSize: function() {
                                return this.label ? this.label.getBBox()[this.axis.horiz ? "height" : "width"] : 0
                            },
                            handleOverflow: function(t) {
                                var e, i = this.axis,
                                    n = t.x,
                                    r = i.chart.chartWidth,
                                    s = i.chart.spacing,
                                    o = t_(i.labelLeft, Math.min(i.pos, s[3])),
                                    s = t_(i.labelRight, Math.max(i.pos + i.len, r - s[1])),
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
                                l ? 0 > l && n - h * c < o ? e = Math.round(n / Math.cos(l * tK) - o) : 0 < l && n + h * c > s && (e = Math.round((r - n) / Math.cos(l * tK))) : (r = n + (1 - h) * c, n - h * c < o ? u = t.x + u * (1 - h) - o : r > s && (u = s - t.x + u * h, p = -1), (u = Math.min(d, u)) < d && "center" === i.labelAlign && (t.x += p * (d - u - h * (d - Math.min(c, u)))), (c > u || i.autoRotation && (a.styles || {}).width) && (e = u)), e && (f.width = e, (i.options.labels.style || {}).textOverflow || (f.textOverflow = "ellipsis"), a.css(f))
                            },
                            getPosition: function(t, e, i, n) {
                                var r = this.axis,
                                    s = r.chart,
                                    o = n && s.oldChartHeight || s.chartHeight;
                                return {
                                    x: t ? r.translate(e + i, null, null, n) + r.transB : r.left + r.offset + (r.opposite ? (n && s.oldChartWidth || s.chartWidth) - r.right - r.left : 0),
                                    y: t ? o - r.bottom + r.offset - (r.opposite ? r.height : 0) : o - r.translate(e + i, null, null, n) - r.transB
                                }
                            },
                            getLabelPosition: function(t, e, i, n, r, s, o, a) {
                                var l = this.axis,
                                    h = l.transA,
                                    c = l.reversed,
                                    d = l.staggerLines,
                                    u = l.tickRotCorr || {
                                        x: 0,
                                        y: 0
                                    },
                                    p = r.y;
                                return tX(p) || (p = 0 === l.side ? i.rotation ? -8 : -i.getBBox().height : 2 === l.side ? u.y + 8 : Math.cos(i.rotation * tK) * (u.y - i.getBBox(!1, 0).height / 2)), t = t + r.x + u.x - (s && n ? s * h * (c ? -1 : 1) : 0), e = e + p - (s && !n ? s * h * (c ? 1 : -1) : 0), d && (i = o / (a || 1) % d, l.opposite && (i = d - i - 1), e += l.labelOffset / d * i), {
                                    x: t,
                                    y: Math.round(e)
                                }
                            },
                            getMarkPath: function(t, e, i, n, r, s) {
                                return s.crispLine(["M", t, e, "L", t + (r ? 0 : -i), e + (r ? i : 0)], n)
                            },
                            renderGridLine: function(t, e, i) {
                                var n = this.axis,
                                    r = n.options,
                                    s = this.gridLine,
                                    o = {},
                                    a = this.pos,
                                    l = this.type,
                                    h = n.tickmarkOffset,
                                    c = n.chart.renderer,
                                    d = l ? l + "Grid" : "grid",
                                    u = r[d + "LineWidth"],
                                    p = r[d + "LineColor"],
                                    r = r[d + "LineDashStyle"];
                                s || (o.stroke = p, o["stroke-width"] = u, r && (o.dashstyle = r), l || (o.zIndex = 1), t && (o.opacity = 0), this.gridLine = s = c.path().attr(o).addClass("highcharts-" + (l ? l + "-" : "") + "grid-line").add(n.gridGroup)), !t && s && (t = n.getPlotLinePath(a + h, s.strokeWidth() * i, t, !0)) && s[this.isNew ? "attr" : "animate"]({
                                    d: t,
                                    opacity: e
                                })
                            },
                            renderMark: function(t, e, i) {
                                var n = this.axis,
                                    r = n.options,
                                    s = n.chart.renderer,
                                    o = this.type,
                                    a = o ? o + "Tick" : "tick",
                                    l = n.tickSize(a),
                                    h = this.mark,
                                    c = !h,
                                    d = t.x;
                                t = t.y;
                                var u = t_(r[a + "Width"], !o && n.isXAxis ? 1 : 0),
                                    r = r[a + "Color"];
                                l && (n.opposite && (l[0] = -l[0]), c && (this.mark = h = s.path().addClass("highcharts-" + (o ? o + "-" : "") + "tick").add(n.axisGroup), h.attr({
                                    stroke: r,
                                    "stroke-width": u
                                })), h[c ? "attr" : "animate"]({
                                    d: this.getMarkPath(d, t, l[0], h.strokeWidth() * i, n.horiz, s),
                                    opacity: e
                                }))
                            },
                            renderLabel: function(t, e, i, n) {
                                var r = this.axis,
                                    s = r.horiz,
                                    o = r.options,
                                    a = this.label,
                                    l = o.labels,
                                    h = l.step,
                                    c = r.tickmarkOffset,
                                    d = !0,
                                    u = t.x;
                                t = t.y, a && tV(u) && (a.xy = t = this.getLabelPosition(u, t, a, s, l, c, n, h), (!this.isFirst || this.isLast || t_(o.showFirstLabel, 1)) && (!this.isLast || this.isFirst || t_(o.showLastLabel, 1)) ? !s || r.isRadial || l.step || l.rotation || e || 0 === i || this.handleOverflow(t) : d = !1, h && n % h && (d = !1), d && tV(t.y) ? (t.opacity = i, a[this.isNewLabel ? "attr" : "animate"](t), this.isNewLabel = !1) : (a.attr("y", -9999), this.isNewLabel = !0), this.isNew = !1)
                            },
                            render: function(t, e, i) {
                                var n = this.axis,
                                    r = n.horiz,
                                    s = this.getPosition(r, this.pos, n.tickmarkOffset, e),
                                    o = s.x,
                                    a = s.y,
                                    n = r && o === n.pos + n.len || !r && a === n.pos ? -1 : 1;
                                i = t_(i, 1), this.isActive = !0, this.renderGridLine(e, i, n), this.renderMark(s, i, n), this.renderLabel(s, e, i, t)
                            },
                            destroy: function() {
                                tY(this, this.axis)
                            }
                        };
                    var e, i, n, r, a, l, h, c, d, u, p, f, g, m, v, y, x, b, w, k, S, M, C, T, A, P, L, I, O, D, E, N, R, B, z, j, G, W, H, F, X, Y, V, U, _, K, q, Z, $, J, Q, tt, te, ti, tn, tr, ts, to, ta, tl, th, tc, td, tu, tp, tf, tg, tm, tv, ty, tx, tb, tw, tk, tS, tM, tC, tT, tA, tP, tL, tI, tO, tD, tE, tN, tR, tB, tz, tj, tG, tW, tH, tF, tX, tY, tV, tU, t_, tK, tq, tZ, t$, tJ, tQ, t0, t1, t2, t3, t5, t9, t6, t4, t8, t7, et, ee, ei, en, er, es, eo, ea, el, eh, ec, ed, eu, ep, ef, eg, em, ev, ey, ex, eb, ew, ek, eS, eM, eC, eT, eA, eP, eL, eI, eO, eD, eE, eN, eR, eB, ez, ej, eG, eW, eH, eF, eX, eY, eV, eU, e_, eK, eq, eZ, e$, eJ, eQ, e0, e1, e2, e3, e5, e9, e6, e4, e8, e7, it, ie, ii, ir, is, io, ia, il, ih, ic, id, iu, ip, ig, im, iv, iy, ix, ib, iw, ik, iS, iM, iC, iT, iA, iP, iL, iI, iO, iD, iE, iN, iR, iB, iz, ij, iG, iW, iH, iF, iX, iY, iV, iU, i_, iK, iq, iZ, i$, iJ, iQ, i0, i1, i2, i3, i5, i9, i6, i4, i8, i7, nt, ne, ni, nn, nr, ns, no, na, nl, nh, nc, nd, nu, np, nf, ng, nm, nv, ny, nx, nb, nw, nk, nS, nM, nC, nT, nA, nP, nL, nI, nO, nD, nE, nN, nR, nB, nz, nj, nG, nW, nH, nF, nX, nY, nV, nU, n_, nK, nq, nZ, n$, nJ, nQ, n0, n1, n2, n3, n5, n9, n6, n4, n8, n7, rt, re, ri, rn, rr, rs, ro, ra, rl, rh, rc, rd, ru, rp, rf, rg, rm, rv, ry, rx, rb, rw, rk, rS, rM, rC, rT, rA, rP, rL, rI, rO, rD, rE, rN, rR, rB, rz, rj, rG, rW, rH, rF, rX, rY, rV, rU, r_, rK, rq, rZ, r$, rJ, rQ, r0, r1, r2, r3, r5, r9, r6, r4, r8, r7, st, se, si, sn, sr, ss, so, sa, sl, sh, sc, sd, su, sp, sf, sg, sm, sv, sy, sx, sb, sw, sk, sS, sM, sC, sT, sA, sP, sL, sI, sO, sD, sE, sN, sR, sB = (tZ = (tq = t).addEvent, t$ = tq.animObject, tJ = tq.arrayMax, tQ = tq.arrayMin, t0 = tq.color, t1 = tq.correctFloat, t2 = tq.defaultOptions, t3 = tq.defined, t5 = tq.deg2rad, t9 = tq.destroyObjectProperties, t6 = tq.each, t4 = tq.extend, t8 = tq.fireEvent, t7 = tq.format, et = tq.getMagnitude, ee = tq.grep, ei = tq.inArray, en = tq.isArray, er = tq.isNumber, es = tq.isString, eo = tq.merge, ea = tq.normalizeTickInterval, el = tq.objectEach, eh = tq.pick, ec = tq.removeEvent, ed = tq.splat, eu = tq.syncTimeout, ep = tq.Tick, ef = function() {
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
                                n = this;
                            n.chart = t, n.horiz = t.inverted && !n.isZAxis ? !i : i, n.isXAxis = i, n.coll = n.coll || (i ? "xAxis" : "yAxis"), n.opposite = e.opposite, n.side = e.side || (n.horiz ? 2 * !n.opposite : n.opposite ? 1 : 3), n.setOptions(e);
                            var r = this.options,
                                s = r.type;
                            n.labelFormatter = r.labels.formatter || n.defaultLabelFormatter, n.userOptions = e, n.minPixelPadding = 0, n.reversed = r.reversed, n.visible = !1 !== r.visible, n.zoomEnabled = !1 !== r.zoomEnabled, n.hasNames = "category" === s || !0 === r.categories, n.categories = r.categories || n.hasNames, n.names = n.names || [], n.plotLinesAndBandsGroups = {}, n.isLog = "logarithmic" === s, n.isDatetimeAxis = "datetime" === s, n.positiveValuesOnly = n.isLog && !n.allowNegativeLog, n.isLinked = t3(r.linkedTo), n.ticks = {}, n.labelEdge = [], n.minorTicks = {}, n.plotLinesAndBands = [], n.alternateBands = {}, n.len = 0, n.minRange = n.userMinRange = r.minRange || r.maxZoom, n.range = r.range, n.offset = r.offset || 0, n.stacks = {}, n.oldStacks = {}, n.stacksTouched = 0, n.max = null, n.min = null, n.crosshair = eh(r.crosshair, ed(t.options.tooltip.crosshairs)[+!i], !1), e = n.options.events, -1 === ei(n, t.axes) && (i ? t.axes.splice(t.xAxis.length, 0, n) : t.axes.push(n), t[n.coll].push(n)), n.series = n.series || [], t.inverted && !n.isZAxis && i && void 0 === n.reversed && (n.reversed = !0), el(e, function(t, e) {
                                tZ(n, e, t)
                            }), n.lin2log = r.linearToLogConverter || n.lin2log, n.isLog && (n.val2lin = n.log2lin, n.lin2val = n.lin2log)
                        },
                        setOptions: function(t) {
                            this.options = eo(this.defaultOptions, "yAxis" === this.coll && this.defaultYAxisOptions, [this.defaultTopAxisOptions, this.defaultRightAxisOptions, this.defaultBottomAxisOptions, this.defaultLeftAxisOptions][this.side], eo(t2[this.coll], t))
                        },
                        defaultLabelFormatter: function() {
                            var t, e = this.axis,
                                i = this.value,
                                n = e.categories,
                                r = this.dateTimeLabelFormat,
                                s = t2.lang,
                                o = s.numericSymbols,
                                s = s.numericSymbolMagnitude || 1e3,
                                a = o && o.length,
                                l = e.options.labels.format,
                                e = e.isLog ? Math.abs(i) : e.tickInterval;
                            if (l) t = t7(l, this);
                            else if (n) t = i;
                            else if (r) t = tq.dateFormat(r, i);
                            else if (a && 1e3 <= e)
                                for (; a-- && void 0 === t;) e >= (n = Math.pow(s, a + 1)) && 0 == 10 * i % n && null !== o[a] && 0 !== i && (t = tq.numberFormat(i / n, -1) + o[a]);
                            return void 0 === t && (t = 1e4 <= Math.abs(i) ? tq.numberFormat(i, -1) : tq.numberFormat(i, -1, void 0, "")), t
                        },
                        getSeriesExtremes: function() {
                            var t = this,
                                e = t.chart;
                            t.hasVisibleSeries = !1, t.dataMin = t.dataMax = t.threshold = null, t.softThreshold = !t.isXAxis, t.buildStacks && t.buildStacks(), t6(t.series, function(i) {
                                if (i.visible || !e.options.chart.ignoreHiddenSeries) {
                                    var n, r = i.options,
                                        o = r.threshold;
                                    t.hasVisibleSeries = !0, t.positiveValuesOnly && 0 >= o && (o = null), t.isXAxis ? (r = i.xData).length && (er(i = tQ(r)) || s._(i, Date) || (i = tQ(r = ee(r, function(t) {
                                        return er(t)
                                    }))), t.dataMin = Math.min(eh(t.dataMin, r[0]), i), t.dataMax = Math.max(eh(t.dataMax, r[0]), tJ(r))) : (i.getExtremes(), n = i.dataMax, t3(i = i.dataMin) && t3(n) && (t.dataMin = Math.min(eh(t.dataMin, i), i), t.dataMax = Math.max(eh(t.dataMax, n), n)), t3(o) && (t.threshold = o), (!r.softThreshold || t.positiveValuesOnly) && (t.softThreshold = !1))
                                }
                            })
                        },
                        translate: function(t, e, i, n, r, s) {
                            var o = this.linkedParent || this,
                                a = 1,
                                l = 0,
                                h = n ? o.oldTransA : o.transA;
                            n = n ? o.oldMin : o.min;
                            var c = o.minPixelPadding;
                            return r = (o.isOrdinal || o.isBroken || o.isLog && r) && o.lin2val, h || (h = o.transA), i && (a *= -1, l = o.len), o.reversed && (a *= -1, l -= a * (o.sector || o.len)), e ? (t = (t * a + l - c) / h + n, r && (t = o.lin2val(t))) : (r && (t = o.val2lin(t)), t = a * (t - n) * h + l + a * c + (er(s) ? h * s : 0)), t
                        },
                        toPixels: function(t, e) {
                            return this.translate(t, !1, !this.horiz, null, !0) + (e ? 0 : this.pos)
                        },
                        toValue: function(t, e) {
                            return this.translate(t - (e ? 0 : this.pos), !0, !this.horiz, null, !0)
                        },
                        getPlotLinePath: function(t, e, i, n, r) {
                            var s, o, a, l = this.chart,
                                h = this.left,
                                c = this.top,
                                d = i && l.oldChartHeight || l.chartHeight,
                                u = i && l.oldChartWidth || l.chartWidth;
                            s = this.transB;
                            var p = function(t, e, i) {
                                return (t < e || t > i) && (n ? t = Math.min(Math.max(e, t), i) : a = !0), t
                            };
                            return t = i = Math.round((r = eh(r, this.translate(t, null, null, i))) + s), s = o = Math.round(d - r - s), er(r) ? this.horiz ? (s = c, o = d - this.bottom, t = i = p(t, h, h + this.width)) : (t = h, i = u - this.right, s = o = p(s, c, c + this.height)) : a = !0, a && !n ? null : l.renderer.crispLine(["M", t, s, "L", i, o], e || 1)
                        },
                        getLinearTickPositions: function(t, e, i) {
                            var n, r = t1(Math.floor(e / t) * t);
                            i = t1(Math.ceil(i / t) * t);
                            var s = [];
                            if (this.single) return [e];
                            for (e = r; e <= i && (s.push(e), (e = t1(e + t)) !== n);) n = e;
                            return s
                        },
                        getMinorTickPositions: function() {
                            var t = this,
                                e = t.options,
                                i = t.tickPositions,
                                n = t.minorTickInterval,
                                r = [],
                                s = t.pointRangePadding || 0,
                                o = t.min - s,
                                s = t.max + s,
                                a = s - o;
                            if (a && a / n < t.len / 3)
                                if (t.isLog) t6(this.paddedTicks, function(e, i, s) {
                                    i && r.push.apply(r, t.getLogTickPositions(n, s[i - 1], s[i], !0))
                                });
                                else if (t.isDatetimeAxis && "auto" === e.minorTickInterval) r = r.concat(t.getTimeTicks(t.normalizeTimeTickInterval(n), o, s, e.startOfWeek));
                            else
                                for (e = o + (i[0] - o) % n; e <= s && e !== r[0]; e += n) r.push(e);
                            return 0 !== r.length && t.trimTicks(r), r
                        },
                        adjustForMinRange: function() {
                            var t, e, i, n, r, s, o, a, l = this.options,
                                h = this.min,
                                c = this.max;
                            this.isXAxis && void 0 === this.minRange && !this.isLog && (t3(l.min) || t3(l.max) ? this.minRange = null : (t6(this.series, function(t) {
                                for (s = t.xData, n = o = t.xIncrement ? 1 : s.length - 1; 0 < n; n--) r = s[n] - s[n - 1], (void 0 === i || r < i) && (i = r)
                            }), this.minRange = Math.min(5 * i, this.dataMax - this.dataMin))), c - h < this.minRange && (e = this.dataMax - this.dataMin >= this.minRange, t = ((a = this.minRange) - c + h) / 2, t = [h - t, eh(l.min, h - t)], e && (t[2] = this.isLog ? this.log2lin(this.dataMin) : this.dataMin), c = [(h = tJ(t)) + a, eh(l.max, h + a)], e && (c[2] = this.isLog ? this.log2lin(this.dataMax) : this.dataMax), (c = tQ(c)) - h < a && (t[0] = c - a, t[1] = eh(l.min, c - a), h = tJ(t))), this.min = h, this.max = c
                        },
                        getClosest: function() {
                            var t;
                            return this.categories ? t = 1 : t6(this.series, function(e) {
                                var i = e.closestPointRange,
                                    n = e.visible || !e.chart.options.chart.ignoreHiddenSeries;
                                !e.noSharedTooltip && t3(i) && n && (t = t3(t) ? Math.min(t, i) : i)
                            }), t
                        },
                        nameToX: function(t) {
                            var e, i = en(this.categories),
                                n = i ? this.categories : this.names,
                                r = t.options.x;
                            return t.series.requireSorting = !1, t3(r) || (r = !1 === this.options.uniqueNames ? t.series.autoIncrement() : ei(t.name, n)), -1 === r ? i || (e = n.length) : e = r, void 0 !== e && (this.names[e] = t.name), e
                        },
                        updateNames: function() {
                            var t = this;
                            0 < this.names.length && (this.names.length = 0, this.minRange = this.userMinRange, t6(this.series || [], function(e) {
                                e.xIncrement = null, (!e.points || e.isDirtyData) && (e.processData(), e.generatePoints()), t6(e.points, function(i, n) {
                                    var r;
                                    i.options && void 0 !== (r = t.nameToX(i)) && r !== i.x && (i.x = r, e.xData[n] = r)
                                })
                            }))
                        },
                        setAxisTranslation: function(t) {
                            var e, i = this,
                                n = i.max - i.min,
                                r = i.axisPointRange || 0,
                                s = 0,
                                o = 0,
                                a = i.linkedParent,
                                l = !!i.categories,
                                h = i.transA,
                                c = i.isXAxis;
                            (c || l || r) && (e = i.getClosest(), a ? (s = a.minPointOffset, o = a.pointRangePadding) : t6(i.series, function(t) {
                                var n = l ? 1 : c ? eh(t.options.pointRange, e, 0) : i.axisPointRange || 0;
                                t = t.options.pointPlacement, r = Math.max(r, n), i.single || (s = Math.max(s, es(t) ? 0 : n / 2), o = Math.max(o, "on" === t ? 0 : n))
                            }), a = i.ordinalSlope && e ? i.ordinalSlope / e : 1, i.minPointOffset = s *= a, i.pointRangePadding = o *= a, i.pointRange = Math.min(r, n), c && (i.closestPointRange = e)), t && (i.oldTransA = h), i.translationSlope = i.transA = h = i.options.staticScale || i.len / (n + o || 1), i.transB = i.horiz ? i.left : i.bottom, i.minPixelPadding = h * s
                        },
                        minFromRange: function() {
                            return this.max - this.range
                        },
                        setTickInterval: function(t) {
                            var e, i, n, r, s = this,
                                o = s.chart,
                                a = s.options,
                                l = s.isLog,
                                h = s.log2lin,
                                c = s.isDatetimeAxis,
                                d = s.isXAxis,
                                u = s.isLinked,
                                p = a.maxPadding,
                                f = a.minPadding,
                                g = a.tickInterval,
                                m = a.tickPixelInterval,
                                v = s.categories,
                                y = s.threshold,
                                x = s.softThreshold;
                            c || v || u || this.getTickAmount(), n = eh(s.userMin, a.min), r = eh(s.userMax, a.max), u ? (s.linkedParent = o[s.coll][a.linkedTo], o = s.linkedParent.getExtremes(), s.min = eh(o.min, o.dataMin), s.max = eh(o.max, o.dataMax), a.type !== s.linkedParent.options.type && tq.error(11, 1)) : (!x && t3(y) && (s.dataMin >= y ? (e = y, f = 0) : s.dataMax <= y && (i = y, p = 0)), s.min = eh(n, e, s.dataMin), s.max = eh(r, i, s.dataMax)), l && (s.positiveValuesOnly && !t && 0 >= Math.min(s.min, eh(s.dataMin, s.min)) && tq.error(10, 1), s.min = t1(h(s.min), 15), s.max = t1(h(s.max), 15)), s.range && t3(s.max) && (s.userMin = s.min = n = Math.max(s.dataMin, s.minFromRange()), s.userMax = r = s.max, s.range = null), t8(s, "foundExtremes"), s.beforePadding && s.beforePadding(), s.adjustForMinRange(), !(v || s.axisPointRange || s.usePercentage || u) && t3(s.min) && t3(s.max) && (h = s.max - s.min) && (!t3(n) && f && (s.min -= h * f), !t3(r) && p && (s.max += h * p)), er(a.softMin) && (s.min = Math.min(s.min, a.softMin)), er(a.softMax) && (s.max = Math.max(s.max, a.softMax)), er(a.floor) && (s.min = Math.max(s.min, a.floor)), er(a.ceiling) && (s.max = Math.min(s.max, a.ceiling)), x && t3(s.dataMin) && (y = y || 0, !t3(n) && s.min < y && s.dataMin >= y ? s.min = y : !t3(r) && s.max > y && s.dataMax <= y && (s.max = y)), s.tickInterval = s.min === s.max || void 0 === s.min || void 0 === s.max ? 1 : u && !g && m === s.linkedParent.options.tickPixelInterval ? g = s.linkedParent.tickInterval : eh(g, this.tickAmount ? (s.max - s.min) / Math.max(this.tickAmount - 1, 1) : void 0, v ? 1 : (s.max - s.min) * m / Math.max(s.len, m)), d && !t && t6(s.series, function(t) {
                                t.processData(s.min !== s.oldMin || s.max !== s.oldMax)
                            }), s.setAxisTranslation(!0), s.beforeSetTickPositions && s.beforeSetTickPositions(), s.postProcessTickInterval && (s.tickInterval = s.postProcessTickInterval(s.tickInterval)), s.pointRange && !g && (s.tickInterval = Math.max(s.pointRange, s.tickInterval)), t = eh(a.minTickInterval, s.isDatetimeAxis && s.closestPointRange), !g && s.tickInterval < t && (s.tickInterval = t), c || l || g || (s.tickInterval = ea(s.tickInterval, null, et(s.tickInterval), eh(a.allowDecimals, !(.5 < s.tickInterval && 5 > s.tickInterval && 1e3 < s.max && 9999 > s.max)), !!this.tickAmount)), this.tickAmount || (s.tickInterval = s.unsquish()), this.setTickPositions()
                        },
                        setTickPositions: function() {
                            var t, e = this.options,
                                i = e.tickPositions,
                                n = e.tickPositioner,
                                r = e.startOnTick,
                                s = e.endOnTick;
                            this.tickmarkOffset = this.categories && "between" === e.tickmarkPlacement && 1 === this.tickInterval ? .5 : 0, this.minorTickInterval = "auto" === e.minorTickInterval && this.tickInterval ? this.tickInterval / 5 : e.minorTickInterval, this.single = this.min === this.max && t3(this.min) && !this.tickAmount && (parseInt(this.min, 10) === this.min || !1 !== e.allowDecimals), this.tickPositions = t = i && i.slice(), !t && ((t = this.isDatetimeAxis ? this.getTimeTicks(this.normalizeTimeTickInterval(this.tickInterval, e.units), this.min, this.max, e.startOfWeek, this.ordinalPositions, this.closestPointRange, !0) : this.isLog ? this.getLogTickPositions(this.tickInterval, this.min, this.max) : this.getLinearTickPositions(this.tickInterval, this.min, this.max)).length > this.len && (t = [t[0], t.pop()]), this.tickPositions = t, n && (n = n.apply(this, [this.min, this.max]))) && (this.tickPositions = t = n), this.paddedTicks = t.slice(0), this.trimTicks(t, r, s), this.isLinked || (this.single && 2 > t.length && (this.min -= .5, this.max += .5), i || n || this.adjustTickAmount())
                        },
                        trimTicks: function(t, e, i) {
                            var n = t[0],
                                r = t[t.length - 1],
                                s = this.minPointOffset || 0;
                            if (!this.isLinked) {
                                if (e && -1 / 0 !== n) this.min = n;
                                else
                                    for (; this.min - s > t[0];) t.shift();
                                if (i) this.max = r;
                                else
                                    for (; this.max + s < t[t.length - 1];) t.pop();
                                0 === t.length && t3(n) && t.push((r + n) / 2)
                            }
                        },
                        alignToOthers: function() {
                            var t, e = {},
                                i = this.options;
                            return !1 === this.chart.options.chart.alignTicks || !1 === i.alignTicks || this.isLog || t6(this.chart[this.coll], function(i) {
                                var n = i.options,
                                    n = [i.horiz ? n.left : n.top, n.width, n.height, n.pane].join();
                                i.series.length && (e[n] ? t = !0 : e[n] = 1)
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
                                n = this.finalTickAmt,
                                r = e && e.length;
                            if (r < i) {
                                for (; e.length < i;) e.push(t1(e[e.length - 1] + t));
                                this.transA *= (r - 1) / (i - 1), this.max = e[e.length - 1]
                            } else r > i && (this.tickInterval *= 2, this.setTickPositions());
                            if (t3(n)) {
                                for (t = i = e.length; t--;)(3 === n && 1 == t % 2 || 2 >= n && 0 < t && t < i - 1) && e.splice(t, 1);
                                this.finalTickAmt = void 0
                            }
                        },
                        setScale: function() {
                            var t, e;
                            this.oldMin = this.min, this.oldMax = this.max, this.oldAxisLength = this.len, this.setAxisSize(), e = this.len !== this.oldAxisLength, t6(this.series, function(e) {
                                (e.isDirtyData || e.isDirty || e.xAxis.isDirty) && (t = !0)
                            }), e || t || this.isLinked || this.forceRedraw || this.userMin !== this.oldUserMin || this.userMax !== this.oldUserMax || this.alignToOthers() ? (this.resetStacks && this.resetStacks(), this.forceRedraw = !1, this.getSeriesExtremes(), this.setTickInterval(), this.oldUserMin = this.userMin, this.oldUserMax = this.userMax, this.isDirty || (this.isDirty = e || this.min !== this.oldMin || this.max !== this.oldMax)) : this.cleanStacks && this.cleanStacks()
                        },
                        setExtremes: function(t, e, i, n, r) {
                            var s = this,
                                o = s.chart;
                            i = eh(i, !0), t6(s.series, function(t) {
                                delete t.kdTree
                            }), t8(s, "setExtremes", r = t4(r, {
                                min: t,
                                max: e
                            }), function() {
                                s.userMin = t, s.userMax = e, s.eventArgs = r, i && o.redraw(n)
                            })
                        },
                        zoom: function(t, e) {
                            var i = this.dataMin,
                                n = this.dataMax,
                                r = this.options,
                                s = Math.min(i, eh(r.min, i)),
                                r = Math.max(n, eh(r.max, n));
                            return (t !== this.min || e !== this.max) && (this.allowZoomOutside || (t3(i) && (t < s && (t = s), t > r && (t = r)), t3(n) && (e < s && (e = s), e > r && (e = r))), this.displayBtn = void 0 !== t || void 0 !== e, this.setExtremes(t, e, !1, void 0, {
                                trigger: "zoom"
                            })), !0
                        },
                        setAxisSize: function() {
                            var t = this.chart,
                                e = this.options,
                                i = e.offsets || [0, 0, 0, 0],
                                n = this.horiz,
                                r = this.width = Math.round(tq.relativeLength(eh(e.width, t.plotWidth - i[3] + i[1]), t.plotWidth)),
                                s = this.height = Math.round(tq.relativeLength(eh(e.height, t.plotHeight - i[0] + i[2]), t.plotHeight)),
                                o = this.top = Math.round(tq.relativeLength(eh(e.top, t.plotTop + i[0]), t.plotHeight, t.plotTop)),
                                e = this.left = Math.round(tq.relativeLength(eh(e.left, t.plotLeft + i[3]), t.plotWidth, t.plotLeft));
                            this.bottom = t.chartHeight - s - o, this.right = t.chartWidth - r - e, this.len = Math.max(n ? r : s, 0), this.pos = n ? e : o
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
                                n = e ? i(this.min) : this.min,
                                e = e ? i(this.max) : this.max;
                            return null === t || n > t ? t = n : e < t && (t = e), this.translate(t, 0, 1, 0, 1)
                        },
                        autoLabelAlign: function(t) {
                            return 15 < (t = (eh(t, 0) - 90 * this.side + 720) % 360) && 165 > t ? "right" : 195 < t && 345 > t ? "left" : "center"
                        },
                        tickSize: function(t) {
                            var e = this.options,
                                i = e[t + "Length"],
                                n = eh(e[t + "Width"], "tick" === t && this.isXAxis ? 1 : 0);
                            if (n && i) return "inside" === e[t + "Position"] && (i = -i), [i, n]
                        },
                        labelMetrics: function() {
                            var t = this.tickPositions && this.tickPositions[0] || 0;
                            return this.chart.renderer.fontMetrics(this.options.labels.style && this.options.labels.style.fontSize, this.ticks[t] && this.ticks[t].label)
                        },
                        unsquish: function() {
                            var t, e, i, n = this.options.labels,
                                r = this.horiz,
                                s = this.tickInterval,
                                o = s,
                                a = this.len / ((+!!this.categories + this.max - this.min) / s),
                                l = n.rotation,
                                h = this.labelMetrics(),
                                c = Number.MAX_VALUE,
                                d = function(t) {
                                    return t /= a || 1, (t = 1 < t ? Math.ceil(t) : 1) * s
                                };
                            return r ? (i = !n.staggerLines && !n.step && (t3(l) ? [l] : a < eh(n.autoRotationLimit, 80) && n.autoRotation)) && t6(i, function(i) {
                                var n;
                                (i === l || i && -90 <= i && 90 >= i) && (n = (e = d(Math.abs(h.h / Math.sin(t5 * i)))) + Math.abs(i / 360)) < c && (c = n, t = i, o = e)
                            }) : n.step || (o = d(h.h)), this.autoRotation = i, this.labelRotation = eh(t, l), o
                        },
                        getSlotWidth: function() {
                            var t = this.chart,
                                e = this.horiz,
                                i = this.options.labels,
                                n = Math.max(this.tickPositions.length - !this.categories, 1),
                                r = t.margin[3];
                            return e && 2 > (i.step || 0) && !i.rotation && (this.staggerLines || 1) * this.len / n || !e && (r && r - t.spacing[3] || .33 * t.chartWidth)
                        },
                        renderUnsquish: function() {
                            var t, e, i, n = this.chart,
                                r = n.renderer,
                                s = this.tickPositions,
                                o = this.ticks,
                                a = this.options.labels,
                                l = this.horiz,
                                h = this.getSlotWidth(),
                                c = Math.max(1, Math.round(h - 2 * (a.padding || 5))),
                                d = {},
                                u = this.labelMetrics(),
                                p = a.style && a.style.textOverflow,
                                f = 0;
                            if (es(a.rotation) || (d.rotation = a.rotation || 0), t6(s, function(t) {
                                    (t = o[t]) && t.labelLength > f && (f = t.labelLength)
                                }), this.maxLabelLength = f, this.autoRotation) f > c && f > u.h ? d.rotation = this.labelRotation : this.labelRotation = 0;
                            else if (h && (t = {
                                    width: c + "px"
                                }, !p))
                                for (t.textOverflow = "clip", e = s.length; !l && e--;)(c = o[i = s[e]].label) && (c.styles && "ellipsis" === c.styles.textOverflow ? c.css({
                                    textOverflow: "clip"
                                }) : o[i].labelLength > h && c.css({
                                    width: h + "px"
                                }), c.getBBox().height > this.len / s.length - (u.h - u.f) && (c.specCss = {
                                    textOverflow: "ellipsis"
                                }));
                            d.rotation && (t = {
                                width: (f > .5 * n.chartHeight ? .33 * n.chartHeight : n.chartHeight) + "px"
                            }, p || (t.textOverflow = "ellipsis")), (this.labelAlign = a.align || this.autoLabelAlign(this.labelRotation)) && (d.align = this.labelAlign), t6(s, function(e) {
                                var i = (e = o[e]) && e.label;
                                i && (i.attr(d), t && i.css(eo(t, i.specCss)), delete i.specCss, e.rotation = d.rotation)
                            }), this.tickRotCorr = r.rotCorr(u.b, this.labelRotation || 0, 0 !== this.side)
                        },
                        hasData: function() {
                            return this.hasVisibleSeries || t3(this.min) && t3(this.max) && !!this.tickPositions
                        },
                        addTitle: function(t) {
                            var e, i = this.chart.renderer,
                                n = this.horiz,
                                r = this.opposite,
                                s = this.options.title;
                            this.axisTitle || ((e = s.textAlign) || (e = (n ? {
                                low: "left",
                                middle: "center",
                                high: "right"
                            } : {
                                low: r ? "right" : "left",
                                middle: "center",
                                high: r ? "left" : "right"
                            })[s.align]), this.axisTitle = i.text(s.text, 0, 0, s.useHTML).attr({
                                zIndex: 7,
                                rotation: s.rotation || 0,
                                align: e
                            }).addClass("highcharts-axis-title").css(s.style).add(this.axisGroup), this.axisTitle.isNew = !0), s.style.width || this.isRadial || this.axisTitle.css({
                                width: this.len
                            }), this.axisTitle[t ? "show" : "hide"](!0)
                        },
                        generateTick: function(t) {
                            var e = this.ticks;
                            e[t] ? e[t].addLabel() : e[t] = new ep(this, t)
                        },
                        getOffset: function() {
                            var t, e, i, n = this,
                                r = n.chart,
                                s = r.renderer,
                                o = n.options,
                                a = n.tickPositions,
                                l = n.ticks,
                                h = n.horiz,
                                c = n.side,
                                d = r.inverted && !n.isZAxis ? [1, 0, 3, 2][c] : c,
                                u = 0,
                                p = 0,
                                f = o.title,
                                g = o.labels,
                                m = 0,
                                v = r.axisOffset,
                                r = r.clipOffset,
                                y = [-1, 1, 1, -1][c],
                                x = o.className,
                                b = n.axisParent,
                                w = this.tickSize("tick");
                            t = n.hasData(), n.showAxis = e = t || eh(o.showEmpty, !0), n.staggerLines = n.horiz && g.staggerLines, n.axisGroup || (n.gridGroup = s.g("grid").attr({
                                zIndex: o.gridZIndex || 1
                            }).addClass("highcharts-" + this.coll.toLowerCase() + "-grid " + (x || "")).add(b), n.axisGroup = s.g("axis").attr({
                                zIndex: o.zIndex || 2
                            }).addClass("highcharts-" + this.coll.toLowerCase() + " " + (x || "")).add(b), n.labelGroup = s.g("axis-labels").attr({
                                zIndex: g.zIndex || 7
                            }).addClass("highcharts-" + n.coll.toLowerCase() + "-labels " + (x || "")).add(b)), t || n.isLinked ? (t6(a, function(t, e) {
                                n.generateTick(t, e)
                            }), n.renderUnsquish(), !1 === g.reserveSpace || 0 !== c && 2 !== c && ({
                                1: "left",
                                3: "right"
                            })[c] !== n.labelAlign && "center" !== n.labelAlign || t6(a, function(t) {
                                m = Math.max(l[t].getLabelSize(), m)
                            }), n.staggerLines && (m *= n.staggerLines, n.labelOffset = m * (n.opposite ? -1 : 1))) : el(l, function(t, e) {
                                t.destroy(), delete l[e]
                            }), f && f.text && !1 !== f.enabled && (n.addTitle(e), e && !1 !== f.reserveSpace && (n.titleOffset = u = n.axisTitle.getBBox()[h ? "height" : "width"], p = t3(i = f.offset) ? 0 : eh(f.margin, h ? 5 : 10))), n.renderLine(), n.offset = y * eh(o.offset, v[c]), n.tickRotCorr = n.tickRotCorr || {
                                x: 0,
                                y: 0
                            }, s = 0 === c ? -n.labelMetrics().h : 2 === c ? n.tickRotCorr.y : 0, p = Math.abs(m) + p, m && (p = p - s + y * (h ? eh(g.y, n.tickRotCorr.y + 8 * y) : g.x)), n.axisTitleMargin = eh(i, p), v[c] = Math.max(v[c], n.axisTitleMargin + u + y * n.offset, p, t && a.length && w ? w[0] + y * n.offset : 0), a = 2 * Math.floor(n.axisLine.strokeWidth() / 2), 0 < o.offset && (a -= 2 * o.offset), r[d] = Math.max(r[d] || a, a)
                        },
                        getLinePath: function(t) {
                            var e = this.chart,
                                i = this.opposite,
                                n = this.offset,
                                r = this.horiz,
                                s = this.left + (i ? this.width : 0) + n,
                                n = e.chartHeight - this.bottom - (i ? this.height : 0) + n;
                            return i && (t *= -1), e.renderer.crispLine(["M", r ? this.left : s, r ? n : this.top, "L", r ? e.chartWidth - this.right : s, r ? n : e.chartHeight - this.bottom], t)
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
                                n = this.len,
                                r = this.options.title,
                                s = t ? e : i,
                                o = this.opposite,
                                a = this.offset,
                                l = r.x || 0,
                                h = r.y || 0,
                                c = this.axisTitle,
                                d = this.chart.renderer.fontMetrics(r.style && r.style.fontSize, c),
                                c = Math.max(c.getBBox(null, 0).height - d.h - 1, 0),
                                n = {
                                    low: s + (t ? 0 : n),
                                    middle: s + n / 2,
                                    high: s + (t ? n : 0)
                                } [r.align],
                                e = (t ? i + this.height : e) + (t ? 1 : -1) * (o ? -1 : 1) * this.axisTitleMargin + [-c, c, d.f, -c][this.side];
                            return {
                                x: t ? n + l : e + (o ? this.width : 0) + a + l,
                                y: t ? e + h - (o ? this.height : 0) + a : n + h
                            }
                        },
                        renderMinorTick: function(t) {
                            var e = this.chart.hasRendered && er(this.oldMin),
                                i = this.minorTicks;
                            i[t] || (i[t] = new ep(this, t, "minor")), e && i[t].isNew && i[t].render(null, !0), i[t].render(null, !1, 1)
                        },
                        renderTick: function(t, e) {
                            var i = this.isLinked,
                                n = this.ticks,
                                r = this.chart.hasRendered && er(this.oldMin);
                            (!i || t >= this.min && t <= this.max) && (n[t] || (n[t] = new ep(this, t)), r && n[t].isNew && n[t].render(e, !0, .1), n[t].render(e))
                        },
                        render: function() {
                            var t, e, i = this,
                                n = i.chart,
                                r = i.options,
                                s = i.isLog,
                                o = i.lin2log,
                                a = i.isLinked,
                                l = i.tickPositions,
                                h = i.axisTitle,
                                c = i.ticks,
                                d = i.minorTicks,
                                u = i.alternateBands,
                                p = r.stackLabels,
                                f = r.alternateGridColor,
                                g = i.tickmarkOffset,
                                m = i.axisLine,
                                v = i.showAxis,
                                y = t$(n.renderer.globalAnimation);
                            i.labelEdge.length = 0, i.overlap = !1, t6([c, d, u], function(t) {
                                el(t, function(t) {
                                    t.isActive = !1
                                })
                            }), (i.hasData() || a) && (i.minorTickInterval && !i.categories && t6(i.getMinorTickPositions(), function(t) {
                                i.renderMinorTick(t)
                            }), l.length && (t6(l, function(t, e) {
                                i.renderTick(t, e)
                            }), g && (0 === i.min || i.single) && (c[-1] || (c[-1] = new ep(i, -1, null, !0)), c[-1].render(-1))), f && t6(l, function(r, a) {
                                e = void 0 !== l[a + 1] ? l[a + 1] + g : i.max - g, 0 == a % 2 && r < i.max && e <= i.max + (n.polar ? -g : g) && (u[r] || (u[r] = new tq.PlotLineOrBand(i)), t = r + g, u[r].options = {
                                    from: s ? o(t) : t,
                                    to: s ? o(e) : e,
                                    color: f
                                }, u[r].render(), u[r].isActive = !0)
                            }), i._addedPlotLB || (t6((r.plotLines || []).concat(r.plotBands || []), function(t) {
                                i.addPlotBandOrLine(t)
                            }), i._addedPlotLB = !0)), t6([c, d, u], function(t) {
                                var e, i = [],
                                    r = y.duration;
                                el(t, function(t, e) {
                                    t.isActive || (t.render(e, !1, 0), t.isActive = !1, i.push(e))
                                }), eu(function() {
                                    for (e = i.length; e--;) t[i[e]] && !t[i[e]].isActive && (t[i[e]].destroy(), delete t[i[e]])
                                }, t !== u && n.hasRendered && r ? r : 0)
                            }), m && (m[m.isPlaced ? "animate" : "attr"]({
                                d: this.getLinePath(m.strokeWidth())
                            }), m.isPlaced = !0, m[v ? "show" : "hide"](!0)), h && v && (er((r = i.getTitlePosition()).y) ? (h[h.isNew ? "attr" : "animate"](r), h.isNew = !1) : (h.attr("y", -9999), h.isNew = !0)), p && p.enabled && i.renderStackTotals(), i.isDirty = !1
                        },
                        redraw: function() {
                            this.visible && (this.render(), t6(this.plotLinesAndBands, function(t) {
                                t.render()
                            })), t6(this.series, function(t) {
                                t.isDirty = !0
                            })
                        },
                        keepProps: "extKey hcEvents names series userMax userMin".split(" "),
                        destroy: function(t) {
                            var e, i = this,
                                n = i.stacks,
                                r = i.plotLinesAndBands;
                            if (t || ec(i), el(n, function(t, e) {
                                    t9(t), n[e] = null
                                }), t6([i.ticks, i.minorTicks, i.alternateBands], function(t) {
                                    t9(t)
                                }), r)
                                for (t = r.length; t--;) r[t].destroy();
                            for (e in t6("stackTotalGroup axisLine axisTitle axisGroup gridGroup labelGroup cross".split(" "), function(t) {
                                    i[t] && (i[t] = i[t].destroy())
                                }), i.plotLinesAndBandsGroups) i.plotLinesAndBandsGroups[e] = i.plotLinesAndBandsGroups[e].destroy();
                            el(i, function(t, e) {
                                -1 === ei(e, i.keepProps) && delete i[e]
                            })
                        },
                        drawCrosshair: function(t, e) {
                            var i, n, r = this.crosshair,
                                s = eh(r.snap, !0),
                                o = this.cross;
                            t || (t = this.cross && this.cross.e), this.crosshair && !1 !== (t3(e) || !s) ? (s ? t3(e) && (n = this.isXAxis ? e.plotX : this.len - e.plotY) : n = t && (this.horiz ? t.chartX - this.pos : this.len - t.chartY + this.pos), t3(n) && (i = this.getPlotLinePath(e && (this.isXAxis ? e.x : eh(e.stackY, e.y)), null, null, null, n) || null), t3(i) ? (e = this.categories && !this.isRadial, o || (this.cross = o = this.chart.renderer.path().addClass("highcharts-crosshair highcharts-crosshair-" + (e ? "category " : "thin ") + r.className).attr({
                                zIndex: eh(r.zIndex, 2)
                            }).add(), o.attr({
                                stroke: r.color || (e ? t0("#ccd6eb").setOpacity(.25).get() : "#cccccc"),
                                "stroke-width": eh(r.width, 1)
                            }), r.dashStyle && o.attr({
                                dashstyle: r.dashStyle
                            })), o.show().attr({
                                d: i
                            }), e && !r.width && o.attr({
                                "stroke-width": this.transA
                            }), this.cross.e = t) : this.hideCrosshair()) : this.hideCrosshair()
                        },
                        hideCrosshair: function() {
                            this.cross && this.cross.hide()
                        }
                    }), tq.Axis = ef);
                    return em = (eg = t).Axis, ev = eg.Date, ey = eg.dateFormat, ex = eg.defaultOptions, eb = eg.defined, ew = eg.each, ek = eg.extend, eS = eg.getMagnitude, eM = eg.getTZOffset, eC = eg.normalizeTickInterval, eT = eg.pick, eA = eg.timeUnits, em.prototype.getTimeTicks = function(t, e, i, n) {
                        var r, s, o, a = [],
                            l = {},
                            h = ex.global.useUTC,
                            c = new ev(e - Math.max(eM(e), eM(i))),
                            d = ev.hcMakeTime,
                            u = t.unitRange,
                            p = t.count;
                        if (eb(e)) {
                            c[ev.hcSetMilliseconds](u >= eA.second ? 0 : p * Math.floor(c.getMilliseconds() / p)), u >= eA.second && c[ev.hcSetSeconds](u >= eA.minute ? 0 : p * Math.floor(c.getSeconds() / p)), u >= eA.minute && c[ev.hcSetMinutes](u >= eA.hour ? 0 : p * Math.floor(c[ev.hcGetMinutes]() / p)), u >= eA.hour && c[ev.hcSetHours](u >= eA.day ? 0 : p * Math.floor(c[ev.hcGetHours]() / p)), u >= eA.day && c[ev.hcSetDate](u >= eA.month ? 1 : p * Math.floor(c[ev.hcGetDate]() / p)), u >= eA.month && (c[ev.hcSetMonth](u >= eA.year ? 0 : p * Math.floor(c[ev.hcGetMonth]() / p)), r = c[ev.hcGetFullYear]()), u >= eA.year && c[ev.hcSetFullYear](r - r % p), u === eA.week && c[ev.hcSetDate](c[ev.hcGetDate]() - c[ev.hcGetDay]() + eT(n, 1)), r = c[ev.hcGetFullYear](), n = c[ev.hcGetMonth]();
                            var f = c[ev.hcGetDate](),
                                g = c[ev.hcGetHours]();
                            for ((ev.hcTimezoneOffset || ev.hcGetTimezoneOffset) && (o = (!h || !!ev.hcGetTimezoneOffset) && (i - e > 4 * eA.month || eM(e) !== eM(i)), s = eM(c = c.getTime()), c = new ev(c + s)), h = c.getTime(), e = 1; h < i;) a.push(h), h = u === eA.year ? d(r + e * p, 0) : u === eA.month ? d(r, n + e * p) : o && (u === eA.day || u === eA.week) ? d(r, n, f + e * p * (u === eA.day ? 1 : 7)) : o && u === eA.hour ? d(r, n, f, g + e * p, 0, 0, s) - s : h + u * p, e++;
                            a.push(h), u <= eA.hour && 1e4 > a.length && ew(a, function(t) {
                                0 == t % 18e5 && "000000000" === ey("%H%M%S%L", t) && (l[t] = "day")
                            })
                        }
                        return a.info = ek(t, {
                            higherRanks: l,
                            totalRange: u * p
                        }), a
                    }, em.prototype.normalizeTimeTickInterval = function(t, e) {
                        var i, n = e || [
                                ["millisecond", [1, 2, 5, 10, 20, 25, 50, 100, 200, 500]],
                                ["second", [1, 2, 5, 10, 15, 30]],
                                ["minute", [1, 2, 5, 10, 15, 30]],
                                ["hour", [1, 2, 3, 4, 6, 8, 12]],
                                ["day", [1, 2]],
                                ["week", [1, 2]],
                                ["month", [1, 2, 3, 4, 6]],
                                ["year", null]
                            ],
                            r = eA[(e = n[n.length - 1])[0]],
                            s = e[1];
                        for (i = 0; i < n.length && (r = eA[(e = n[i])[0]], s = e[1], !n[i + 1] || !(t <= (r * s[s.length - 1] + eA[n[i + 1][0]]) / 2)); i++);
                        return r === eA.year && t < 5 * r && (s = [1, 2, 5]), t = eC(t / r, s, "year" === e[0] ? Math.max(eS(t / r), 1) : 1), {
                            unitRange: r,
                            count: t,
                            unitName: e[0]
                        }
                    }, eL = (eP = t).Axis, eI = eP.getMagnitude, eO = eP.map, eD = eP.normalizeTickInterval, eE = eP.pick, eL.prototype.getLogTickPositions = function(t, e, i, n) {
                        var r = this.options,
                            s = this.len,
                            o = this.lin2log,
                            a = this.log2lin,
                            l = [];
                        if (n || (this._minorAutoInterval = null), .5 <= t) t = Math.round(t), l = this.getLinearTickPositions(t, e, i);
                        else if (.08 <= t)
                            for (var h, c, d, u, p, s = Math.floor(e), r = .3 < t ? [1, 2, 4] : .15 < t ? [1, 2, 4, 6, 8] : [1, 2, 3, 4, 5, 6, 7, 8, 9]; s < i + 1 && !p; s++)
                                for (c = r.length, h = 0; h < c && !p; h++)(d = a(o(s) * r[h])) > e && (!n || u <= i) && void 0 !== u && l.push(u), u > i && (p = !0), u = d;
                        else e = o(e), i = o(i), t = eD(t = eE("auto" === (t = r[n ? "minorTickInterval" : "tickInterval"]) ? null : t, this._minorAutoInterval, r.tickPixelInterval / (n ? 5 : 1) * (i - e) / ((n ? s / this.tickPositions.length : s) || 1)), null, eI(t)), l = eO(this.getLinearTickPositions(t, e, i), a), n || (this._minorAutoInterval = t / 5);
                        return n || (this.tickInterval = t), l
                    }, eL.prototype.log2lin = function(t) {
                        return Math.log(t) / Math.LN10
                    }, eL.prototype.lin2log = function(t) {
                        return Math.pow(10, t)
                    }, eR = (eN = t).arrayMax, eB = eN.arrayMin, ez = eN.defined, ej = eN.destroyObjectProperties, eG = eN.each, eW = eN.erase, eH = eN.merge, eF = eN.pick, eN.PlotLineOrBand = function(t, e) {
                        this.axis = t, e && (this.options = e, this.id = e.id)
                    }, eN.PlotLineOrBand.prototype = {
                        render: function() {
                            var t = this,
                                e = t.axis,
                                i = e.horiz,
                                n = t.options,
                                r = n.label,
                                s = t.label,
                                o = n.to,
                                a = n.from,
                                l = n.value,
                                h = ez(a) && ez(o),
                                c = ez(l),
                                d = t.svgElem,
                                u = !d,
                                p = [],
                                f = n.color,
                                g = eF(n.zIndex, 0),
                                m = n.events,
                                p = {
                                    class: "highcharts-plot-" + (h ? "band " : "line ") + (n.className || "")
                                },
                                v = {},
                                y = e.chart.renderer,
                                x = h ? "bands" : "lines",
                                b = e.log2lin;
                            if (e.isLog && (a = b(a), o = b(o), l = b(l)), c ? (p = {
                                    stroke: f,
                                    "stroke-width": n.width
                                }, n.dashStyle && (p.dashstyle = n.dashStyle)) : h && (f && (p.fill = f), n.borderWidth && (p.stroke = n.borderColor, p["stroke-width"] = n.borderWidth)), v.zIndex = g, x += "-" + g, (f = e.plotLinesAndBandsGroups[x]) || (e.plotLinesAndBandsGroups[x] = f = y.g("plot-" + x).attr(v).add()), u && (t.svgElem = d = y.path().attr(p).add(f)), c) p = e.getPlotLinePath(l, d.strokeWidth());
                            else {
                                if (!h) return;
                                p = e.getPlotBandPath(a, o, n)
                            }
                            return u && p && p.length ? (d.attr({
                                d: p
                            }), m && eN.objectEach(m, function(e, i) {
                                d.on(i, function(e) {
                                    m[i].apply(t, [e])
                                })
                            })) : d && (p ? (d.show(), d.animate({
                                d: p
                            })) : (d.hide(), s && (t.label = s = s.destroy()))), r && ez(r.text) && p && p.length && 0 < e.width && 0 < e.height && !p.flat ? (r = eH({
                                align: i && h && "center",
                                x: i ? !h && 4 : 10,
                                verticalAlign: !i && h && "middle",
                                y: i ? h ? 16 : 10 : h ? 6 : -4,
                                rotation: i && !h && 90
                            }, r), this.renderLabel(r, p, h, g)) : s && s.hide(), t
                        },
                        renderLabel: function(t, e, i, n) {
                            var r = this.label,
                                s = this.axis.chart.renderer;
                            r || ((r = {
                                align: t.textAlign || t.align,
                                rotation: t.rotation,
                                class: "highcharts-plot-" + (i ? "band" : "line") + "-label " + (t.className || "")
                            }).zIndex = n, this.label = r = s.text(t.text, 0, 0, t.useHTML).attr(r).add(), r.css(t.style)), n = [e[1], e[4], i ? e[6] : e[1]], e = [e[2], e[5], i ? e[7] : e[2]], i = eB(n), s = eB(e), r.align(t, !1, {
                                x: i,
                                y: s,
                                width: eR(n) - i,
                                height: eR(e) - s
                            }), r.show()
                        },
                        destroy: function() {
                            eW(this.axis.plotLinesAndBands, this), delete this.axis, ej(this)
                        }
                    }, eN.extend(sB.prototype, {
                        getPlotBandPath: function(t, e) {
                            var i = this.getPlotLinePath(e, null, null, !0),
                                n = this.getPlotLinePath(t, null, null, !0),
                                r = this.horiz,
                                s = 1;
                            return t = t < this.min && e < this.min || t > this.max && e > this.max, n && i ? (t && (n.flat = n.toString() === i.toString(), s = 0), n.push(r && i[4] === n[4] ? i[4] + s : i[4], r || i[5] !== n[5] ? i[5] : i[5] + s, r && i[1] === n[1] ? i[1] + s : i[1], r || i[2] !== n[2] ? i[2] : i[2] + s)) : n = null, n
                        },
                        addPlotBand: function(t) {
                            return this.addPlotBandOrLine(t, "plotBands")
                        },
                        addPlotLine: function(t) {
                            return this.addPlotBandOrLine(t, "plotLines")
                        },
                        addPlotBandOrLine: function(t, e) {
                            var i = new eN.PlotLineOrBand(this, t).render(),
                                n = this.userOptions;
                            return i && (e && (n[e] = n[e] || [], n[e].push(t)), this.plotLinesAndBands.push(i)), i
                        },
                        removePlotBandOrLine: function(t) {
                            for (var e = this.plotLinesAndBands, i = this.options, n = this.userOptions, r = e.length; r--;) e[r].id === t && e[r].destroy();
                            eG([i.plotLines || [], n.plotLines || [], i.plotBands || [], n.plotBands || []], function(e) {
                                for (r = e.length; r--;) e[r].id === t && eW(e, e[r])
                            })
                        },
                        removePlotBand: function(t) {
                            this.removePlotBandOrLine(t)
                        },
                        removePlotLine: function(t) {
                            this.removePlotBandOrLine(t)
                        }
                    }), eY = (eX = t).dateFormat, eV = eX.each, eU = eX.extend, e_ = eX.format, eK = eX.isNumber, eq = eX.map, eZ = eX.merge, e$ = eX.pick, eJ = eX.splat, eQ = eX.syncTimeout, e0 = eX.timeUnits, eX.Tooltip = function() {
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
                            this.destroy(), eZ(!0, this.chart.options.tooltip.userOptions, t), this.init(this.chart, eZ(!0, this.options, t))
                        },
                        destroy: function() {
                            this.label && (this.label = this.label.destroy()), this.split && this.tt && (this.cleanSplit(this.chart, !0), this.tt = this.tt.destroy()), clearTimeout(this.hideTimer), clearTimeout(this.tooltipTimeout)
                        },
                        move: function(t, e, i, n) {
                            var r = this,
                                s = r.now,
                                o = !1 !== r.options.animation && !r.isHidden && (1 < Math.abs(t - s.x) || 1 < Math.abs(e - s.y)),
                                a = r.followPointer || 1 < r.len;
                            eU(s, {
                                x: o ? (2 * s.x + t) / 3 : t,
                                y: o ? (s.y + e) / 2 : e,
                                anchorX: a ? void 0 : o ? (2 * s.anchorX + i) / 3 : i,
                                anchorY: a ? void 0 : o ? (s.anchorY + n) / 2 : n
                            }), r.getLabel().attr(s), o && (clearTimeout(this.tooltipTimeout), this.tooltipTimeout = setTimeout(function() {
                                r && r.move(t, e, i, n)
                            }, 32))
                        },
                        hide: function(t) {
                            var e = this;
                            clearTimeout(this.hideTimer), t = e$(t, this.options.hideDelay, 500), this.isHidden || (this.hideTimer = eQ(function() {
                                e.getLabel()[t ? "fadeOut" : "hide"](), e.isHidden = !0
                            }, t))
                        },
                        getAnchor: function(t, e) {
                            var i, n, r, s = this.chart,
                                o = s.inverted,
                                a = s.plotTop,
                                l = s.plotLeft,
                                h = 0,
                                c = 0;
                            return i = (t = eJ(t))[0].tooltipPos, this.followPointer && e && (void 0 === e.chartX && (e = s.pointer.normalize(e)), i = [e.chartX - s.plotLeft, e.chartY - a]), i || (eV(t, function(t) {
                                n = t.series.yAxis, r = t.series.xAxis, h += t.plotX + (!o && r ? r.left - l : 0), c += (t.plotLow ? (t.plotLow + t.plotHigh) / 2 : t.plotY) + (!o && n ? n.top - a : 0)
                            }), h /= t.length, c /= t.length, i = [o ? s.plotWidth - c : h, this.shared && !o && 1 < t.length && e ? e.chartY - a : o ? s.plotHeight - h : c]), eq(i, Math.round)
                        },
                        getPosition: function(t, e, i) {
                            var n, r = this.chart,
                                s = this.distance,
                                o = {},
                                a = i.h || 0,
                                l = ["y", r.chartHeight, e, i.plotY + r.plotTop, r.plotTop, r.plotTop + r.plotHeight],
                                h = ["x", r.chartWidth, t, i.plotX + r.plotLeft, r.plotLeft, r.plotLeft + r.plotWidth],
                                c = !this.followPointer && e$(i.ttBelow, !r.inverted == !!i.negative),
                                d = function(t, e, i, n, r, l) {
                                    var h = i < n - s,
                                        d = n + s + i < e,
                                        u = n - s - i;
                                    if (n += s, c && d) o[t] = n;
                                    else if (!c && h) o[t] = u;
                                    else if (h) o[t] = Math.min(l - i, 0 > u - a ? u : u - a);
                                    else {
                                        if (!d) return !1;
                                        o[t] = Math.max(r, n + a + i > e ? n : n + a)
                                    }
                                },
                                u = function(t, e, i, n) {
                                    var r;
                                    return n < s || n > e - s ? r = !1 : o[t] = n < i / 2 ? 1 : n > e - i / 2 ? e - i - 2 : n - i / 2, r
                                },
                                p = function(t) {
                                    var e = l;
                                    l = h, h = e, n = t
                                },
                                f = function() {
                                    !1 !== d.apply(0, l) ? !1 !== u.apply(0, h) || n || (p(!0), f()) : n ? o.x = o.y = 0 : (p(!0), f())
                                };
                            return (r.inverted || 1 < this.len) && p(), f(), o
                        },
                        defaultFormatter: function(t) {
                            var e, i = this.points || eJ(this);
                            return (e = (e = [t.tooltipFooterHeaderFormatter(i[0])]).concat(t.bodyFormatter(i))).push(t.tooltipFooterHeaderFormatter(i[0], !0)), e
                        },
                        refresh: function(t, e) {
                            var i, n, r, s = this.options,
                                o = t,
                                a = {},
                                l = [];
                            i = s.formatter || this.defaultFormatter;
                            var h, a = this.shared;
                            s.enabled && (clearTimeout(this.hideTimer), this.followPointer = eJ(o)[0].series.tooltipOptions.followPointer, e = (r = this.getAnchor(o, e))[0], n = r[1], !a || o.series && o.series.noSharedTooltip ? a = o.getLabelConfig() : (eV(o, function(t) {
                                t.setState("hover"), l.push(t.getLabelConfig())
                            }), (a = {
                                x: o[0].category,
                                y: o[0].y
                            }).points = l, o = o[0]), this.len = l.length, a = i.call(a, this), h = o.series, this.distance = e$(h.tooltipOptions.distance, 16), !1 === a ? this.hide() : (i = this.getLabel(), this.isHidden && i.attr({
                                opacity: 1
                            }).show(), this.split ? this.renderSplit(a, t) : (s.style.width || i.css({
                                width: this.chart.spacingBox.width
                            }), i.attr({
                                text: a && a.join ? a.join("") : a
                            }), i.removeClass(/highcharts-color-[\d]+/g).addClass("highcharts-color-" + e$(o.colorIndex, h.colorIndex)), i.attr({
                                stroke: s.borderColor || o.color || h.color || "#666666"
                            }), this.updatePosition({
                                plotX: e,
                                plotY: n,
                                negative: o.negative,
                                ttBelow: o.ttBelow,
                                h: r[2] || 0
                            })), this.isHidden = !1))
                        },
                        renderSplit: function(t, e) {
                            var i = this,
                                n = [],
                                r = this.chart,
                                s = r.renderer,
                                o = !0,
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
                                        f = "highcharts-color-" + e$(c.colorIndex, p.colorIndex, "none");
                                    u || (d.tt = u = s.label(null, null, null, "callout").addClass("highcharts-tooltip-box " + f).attr({
                                        padding: a.padding,
                                        r: a.borderRadius,
                                        fill: a.backgroundColor,
                                        stroke: a.borderColor || c.color || p.color || "#333333",
                                        "stroke-width": a.borderWidth
                                    }).add(h)), u.isActive = !0, u.attr({
                                        text: t
                                    }), u.css(a.style).shadow(a.shadow), p = (t = u.getBBox()).width + u.strokeWidth(), c.isHeader ? (l = t.height, p = Math.max(0, Math.min(c.plotX + r.plotLeft - p / 2, r.chartWidth - p))) : p = c.plotX + r.plotLeft - e$(a.distance, 16) - p, 0 > p && (o = !1), t = (c.series && c.series.yAxis && c.series.yAxis.pos) + (c.plotY || 0) - r.plotTop, n.push({
                                        target: c.isHeader ? r.plotHeight + l : t,
                                        rank: +!!c.isHeader,
                                        size: d.tt.getBBox().height + 1,
                                        point: c,
                                        x: p,
                                        tt: u
                                    })
                                }
                            }), this.cleanSplit(), eX.distribute(n, r.plotHeight + l), eV(n, function(t) {
                                var e = t.point,
                                    i = e.series;
                                t.tt.attr({
                                    visibility: void 0 === t.pos ? "hidden" : "inherit",
                                    x: o || e.isHeader ? t.x : e.plotX + r.plotLeft + e$(a.distance, 16),
                                    y: t.pos + r.plotTop,
                                    anchorX: e.isHeader ? e.plotX + r.plotLeft : e.plotX + i.xAxis.pos,
                                    anchorY: e.isHeader ? t.pos + r.plotTop - 15 : e.plotY + i.yAxis.pos
                                })
                            })
                        },
                        updatePosition: function(t) {
                            var e = this.chart,
                                i = this.getLabel(),
                                i = (this.options.positioner || this.getPosition).call(this, i.width, i.height, t);
                            this.move(Math.round(i.x), Math.round(i.y || 0), t.plotX + e.plotLeft, t.plotY + e.plotTop)
                        },
                        getDateFormat: function(t, e, i, n) {
                            var r, s, o = eY("%m-%d %H:%M:%S.%L", e),
                                a = {
                                    millisecond: 15,
                                    second: 12,
                                    minute: 9,
                                    hour: 6,
                                    day: 3
                                },
                                l = "millisecond";
                            for (s in e0) {
                                if (t === e0.week && +eY("%w", e) === i && "00:00:00.000" === o.substr(6)) {
                                    s = "week";
                                    break
                                }
                                if (e0[s] > t) {
                                    s = l;
                                    break
                                }
                                if (a[s] && o.substr(a[s]) !== "01-01 00:00:00.000".substr(a[s])) break;
                                "week" !== s && (l = s)
                            }
                            return s && (r = n[s]), r
                        },
                        getXDateFormat: function(t, e, i) {
                            e = e.dateTimeLabelFormats;
                            var n = i && i.closestPointRange;
                            return (n ? this.getDateFormat(n, t.x, i.options.startOfWeek, e) : e.day) || e.year
                        },
                        tooltipFooterHeaderFormatter: function(t, e) {
                            var i = e ? "footer" : "header",
                                n = (e = t.series).tooltipOptions,
                                r = n.xDateFormat,
                                s = e.xAxis,
                                o = s && "datetime" === s.options.type && eK(t.key),
                                i = n[i + "Format"];
                            return o && !r && (r = this.getXDateFormat(t, n, s)), o && r && (i = i.replace("{point.key}", "{point.key:" + r + "}")), e_(i, {
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
                    }, e2 = (e1 = t).addEvent, e3 = e1.attr, e5 = e1.charts, e9 = e1.color, e6 = e1.css, e4 = e1.defined, e8 = e1.each, e7 = e1.extend, it = e1.find, ie = e1.fireEvent, ii = e1.isObject, ir = e1.offset, is = e1.pick, io = e1.removeEvent, ia = e1.splat, il = e1.Tooltip, ih = e1.win, e1.Pointer = function(t, e) {
                        this.init(t, e)
                    }, e1.Pointer.prototype = {
                        init: function(t, e) {
                            this.options = e, this.chart = t, this.runChartClick = e.chart.events && !!e.chart.events.click, this.pinchDown = [], this.lastValidTouch = {}, il && (t.tooltip = new il(t, e.tooltip), this.followTouchMove = is(e.tooltip.followTouchMove, !0)), this.setDOMEvents()
                        },
                        zoomOption: function(t) {
                            var e = this.chart,
                                i = e.options.chart,
                                n = i.zoomType || "",
                                e = e.inverted;
                            /touch/.test(t.type) && (n = is(i.pinchType, n)), this.zoomX = t = /x/.test(n), this.zoomY = n = /y/.test(n), this.zoomHor = t && !e || n && e, this.zoomVert = n && !e || t && e, this.hasZoom = t || n
                        },
                        normalize: function(t, e) {
                            var i, n;
                            return (t = t || ih.event).target || (t.target = t.srcElement), n = t.touches ? t.touches.length ? t.touches.item(0) : t.changedTouches[0] : t, e || (this.chartPosition = e = ir(this.chart.container)), void 0 === n.pageX ? (i = Math.max(t.x, t.clientX - e.left), e = t.y) : (i = n.pageX - e.left, e = n.pageY - e.top), e7(t, {
                                chartX: Math.round(i),
                                chartY: Math.round(e)
                            })
                        },
                        getCoordinates: function(t) {
                            var e = {
                                xAxis: [],
                                yAxis: []
                            };
                            return e8(this.chart.axes, function(i) {
                                e[i.isXAxis ? "xAxis" : "yAxis"].push({
                                    axis: i,
                                    value: i.toValue(t[i.horiz ? "chartX" : "chartY"])
                                })
                            }), e
                        },
                        findNearestKDPoint: function(t, e, i) {
                            var n;
                            return e8(t, function(t) {
                                var r = !(t.noSharedTooltip && e) && 0 > t.options.findNearestPointBy.indexOf("y");
                                if ((r = ii(t = t.searchPoint(i, r), !0)) && !(r = !ii(n, !0))) var r = n.distX - t.distX,
                                    s = n.dist - t.dist,
                                    o = (t.series.group && t.series.group.zIndex) - (n.series.group && n.series.group.zIndex),
                                    r = 0 < (0 !== r && e ? r : 0 !== s ? s : 0 !== o ? o : n.series.index > t.series.index ? -1 : 1);
                                r && (n = t)
                            }), n
                        },
                        getPointFromEvent: function(t) {
                            t = t.target;
                            for (var e; t && !e;) e = t.point, t = t.parentNode;
                            return e
                        },
                        getChartCoordinatesFromPoint: function(t, e) {
                            var i = t.series,
                                n = i.xAxis,
                                i = i.yAxis;
                            if (n && i) return e ? {
                                chartX: n.len + n.pos - t.clientX,
                                chartY: i.len + i.pos - t.plotY
                            } : {
                                chartX: t.clientX + n.pos,
                                chartY: t.plotY + i.pos
                            }
                        },
                        getHoverData: function(t, e, i, n, r, s) {
                            var o, a = [];
                            n = !(!n || !t);
                            var l = e && !e.stickyTracking ? [e] : e1.grep(i, function(t) {
                                return t.visible && !(!r && t.directTouch) && is(t.options.enableMouseTracking, !0) && t.stickyTracking
                            });
                            return e = (o = n ? t : this.findNearestKDPoint(l, r, s)) && o.series, o && (r && !e.noSharedTooltip ? e8(l = e1.grep(i, function(t) {
                                return t.visible && !(!r && t.directTouch) && is(t.options.enableMouseTracking, !0) && !t.noSharedTooltip
                            }), function(t) {
                                ii(t = it(t.points, function(t) {
                                    return t.x === o.x
                                })) && !t.isNull && a.push(t)
                            }) : a.push(o)), {
                                hoverPoint: o,
                                hoverSeries: e,
                                hoverPoints: a
                            }
                        },
                        runPointActions: function(t, e) {
                            var i, n = this.chart,
                                r = n.tooltip,
                                s = !!r && r.shared,
                                o = e || n.hoverPoint,
                                a = o && o.series || n.hoverSeries,
                                a = this.getHoverData(o, a, n.series, !!e || a && a.directTouch && this.isDirectTouch, s, t),
                                o = a.hoverPoint;
                            i = a.hoverPoints, e = (a = a.hoverSeries) && a.tooltipOptions.followPointer, s = s && a && !a.noSharedTooltip, o && (o !== n.hoverPoint || r && r.isHidden) ? (e8(n.hoverPoints || [], function(t) {
                                -1 === e1.inArray(t, i) && t.setState()
                            }), e8(i || [], function(t) {
                                t.setState("hover")
                            }), n.hoverSeries !== a && a.onMouseOver(), n.hoverPoint && n.hoverPoint.firePointEvent("mouseOut"), o.firePointEvent("mouseOver"), n.hoverPoints = i, n.hoverPoint = o, r && r.refresh(s ? i : o, t)) : e && r && !r.isHidden && (o = r.getAnchor([{}], t), r.updatePosition({
                                plotX: o[0],
                                plotY: o[1]
                            })), this.unDocMouseMove || (this.unDocMouseMove = e2(n.container.ownerDocument, "mousemove", function(t) {
                                var e = e5[e1.hoverChartIndex];
                                e && e.pointer.onDocumentMouseMove(t)
                            })), e8(n.axes, function(e) {
                                var n = is(e.crosshair.snap, !0),
                                    r = n ? e1.find(i, function(t) {
                                        return t.series[e.coll] === e
                                    }) : void 0;
                                r || !n ? e.drawCrosshair(t, r) : e.hideCrosshair()
                            })
                        },
                        reset: function(t, e) {
                            var i = this.chart,
                                n = i.hoverSeries,
                                r = i.hoverPoint,
                                s = i.hoverPoints,
                                o = i.tooltip,
                                a = o && o.shared ? s : r;
                            t && a && e8(ia(a), function(e) {
                                e.series.isCartesian && void 0 === e.plotX && (t = !1)
                            }), t ? o && a && (o.refresh(a), r && (r.setState(r.state, !0), e8(i.axes, function(t) {
                                t.crosshair && t.drawCrosshair(null, r)
                            }))) : (r && r.onMouseOut(), s && e8(s, function(t) {
                                t.setState()
                            }), n && n.onMouseOut(), o && o.hide(e), this.unDocMouseMove && (this.unDocMouseMove = this.unDocMouseMove()), e8(i.axes, function(t) {
                                t.hideCrosshair()
                            }), this.hoverX = i.hoverPoints = i.hoverPoint = null)
                        },
                        scaleGroups: function(t, e) {
                            var i, n = this.chart;
                            e8(n.series, function(r) {
                                i = t || r.getPlotBox(), r.xAxis && r.xAxis.zoomEnabled && r.group && (r.group.attr(i), r.markerGroup && (r.markerGroup.attr(i), r.markerGroup.clip(e ? n.clipRect : null)), r.dataLabelsGroup && r.dataLabelsGroup.attr(i))
                            }), n.clipRect.attr(e || n.clipBox)
                        },
                        dragStart: function(t) {
                            var e = this.chart;
                            e.mouseIsDown = t.type, e.cancelClick = !1, e.mouseDownX = this.mouseDownX = t.chartX, e.mouseDownY = this.mouseDownY = t.chartY
                        },
                        drag: function(t) {
                            var e, i = this.chart,
                                n = i.options.chart,
                                r = t.chartX,
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
                                g = n.panKey && t[n.panKey + "Key"];
                            u && u.touch || (r < l ? r = l : r > l + c && (r = l + c), s < h ? s = h : s > h + d && (s = h + d), this.hasDragged = Math.sqrt(Math.pow(p - r, 2) + Math.pow(f - s, 2)), 10 < this.hasDragged && (e = i.isInsidePlot(p - l, f - h), i.hasCartesianSeries && (this.zoomX || this.zoomY) && e && !g && !u && (this.selectionMarker = u = i.renderer.rect(l, h, o ? 1 : c, a ? 1 : d, 0).attr({
                                fill: n.selectionMarkerFill || e9("#335cad").setOpacity(.25).get(),
                                class: "highcharts-selection-marker",
                                zIndex: 7
                            }).add()), u && o && (r -= p, u.attr({
                                width: Math.abs(r),
                                x: (0 < r ? 0 : r) + p
                            })), u && a && (r = s - f, u.attr({
                                height: Math.abs(r),
                                y: (0 < r ? 0 : r) + f
                            })), e && !u && n.panning && i.pan(t, n.panning)))
                        },
                        drop: function(t) {
                            var e = this,
                                i = this.chart,
                                n = this.hasPinched;
                            if (this.selectionMarker) {
                                var r, s = {
                                        originalEvent: t,
                                        xAxis: [],
                                        yAxis: []
                                    },
                                    o = this.selectionMarker,
                                    a = o.attr ? o.attr("x") : o.x,
                                    l = o.attr ? o.attr("y") : o.y,
                                    h = o.attr ? o.attr("width") : o.width,
                                    c = o.attr ? o.attr("height") : o.height;
                                (this.hasDragged || n) && (e8(i.axes, function(i) {
                                    if (i.zoomEnabled && e4(i.min) && (n || e[({
                                            xAxis: "zoomX",
                                            yAxis: "zoomY"
                                        })[i.coll]])) {
                                        var o = i.horiz,
                                            d = "touchend" === t.type ? i.minPixelPadding : 0,
                                            u = i.toValue((o ? a : l) + d),
                                            o = i.toValue((o ? a + h : l + c) - d);
                                        s[i.coll].push({
                                            axis: i,
                                            min: Math.min(u, o),
                                            max: Math.max(u, o)
                                        }), r = !0
                                    }
                                }), r && ie(i, "selection", s, function(t) {
                                    i.zoom(e7(t, n ? {
                                        animation: !1
                                    } : null))
                                })), this.selectionMarker = this.selectionMarker.destroy(), n && this.scaleGroups()
                            }
                            i && (e6(i.container, {
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
                            e4(e1.hoverChartIndex) && e5[e1.hoverChartIndex] && e5[e1.hoverChartIndex].mouseIsDown || (e1.hoverChartIndex = e.index), (t = this.normalize(t)).returnValue = !1, "mousedown" === e.mouseIsDown && this.drag(t), (this.inClass(t.target, "highcharts-tracker") || e.isInsidePlot(t.chartX - e.plotLeft, t.chartY - e.plotTop)) && !e.openMenu && this.runPointActions(t)
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
                                n = e.plotLeft,
                                r = e.plotTop;
                            t = this.normalize(t), e.cancelClick || (i && this.inClass(t.target, "highcharts-tracker") ? (ie(i.series, "click", e7(t, {
                                point: i
                            })), e.hoverPoint && i.firePointEvent("click", t)) : (e7(t, this.getCoordinates(t)), e.isInsidePlot(t.chartX - n, t.chartY - r) && ie(e, "click", t)))
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
                            t.unDocMouseMove && t.unDocMouseMove(), io(t.chart.container, "mouseleave", t.onContainerMouseLeave), e1.chartCount || (io(e, "mouseup", t.onDocumentMouseUp), e1.hasTouch && io(e, "touchend", t.onDocumentTouchEnd)), clearInterval(t.tooltipTimeout), e1.objectEach(t, function(e, i) {
                                t[i] = null
                            })
                        }
                    }, id = (ic = t).charts, iu = ic.each, ip = ic.extend, ig = ic.map, im = ic.noop, iv = ic.pick, ip(ic.Pointer.prototype, {
                        pinchTranslate: function(t, e, i, n, r, s) {
                            this.zoomHor && this.pinchTranslateDirection(!0, t, e, i, n, r, s), this.zoomVert && this.pinchTranslateDirection(!1, t, e, i, n, r, s)
                        },
                        pinchTranslateDirection: function(t, e, i, n, r, s, o, a) {
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
                                S = !b && e[1][f],
                                M = !b && i[1][f];
                            (i = function() {
                                !b && 20 < Math.abs(w - S) && (v = a || Math.abs(k - M) / Math.abs(w - S)), h = (m - k) / v + w, l = d["plot" + (t ? "Width" : "Height")] / v
                            })(), (e = h) < x.min ? (e = x.min, c = !0) : e + l > x.max && (e = x.max - l, c = !0), c ? (k -= .8 * (k - o[u][0]), b || (M -= .8 * (M - o[u][1])), i()) : o[u] = [k, M], y || (s[u] = h - m, s[g] = l), s = y ? 1 / v : v, r[g] = l, r[u] = e, n[y ? t ? "scaleY" : "scaleX" : "scale" + p] = v, n["translate" + p] = s * m + (k - s * w)
                        },
                        pinch: function(t) {
                            var e = this,
                                i = e.chart,
                                n = e.pinchDown,
                                r = t.touches,
                                s = r.length,
                                o = e.lastValidTouch,
                                a = e.hasZoom,
                                l = e.selectionMarker,
                                h = {},
                                c = 1 === s && (e.inClass(t.target, "highcharts-tracker") && i.runTrackerClick || e.runChartClick),
                                d = {};
                            1 < s && (e.initiated = !0), a && e.initiated && !c && t.preventDefault(), ig(r, function(t) {
                                return e.normalize(t)
                            }), "touchstart" === t.type ? (iu(r, function(t, e) {
                                n[e] = {
                                    chartX: t.chartX,
                                    chartY: t.chartY
                                }
                            }), o.x = [n[0].chartX, n[1] && n[1].chartX], o.y = [n[0].chartY, n[1] && n[1].chartY], iu(i.axes, function(t) {
                                if (t.zoomEnabled) {
                                    var e = i.bounds[t.horiz ? "h" : "v"],
                                        n = t.minPixelPadding,
                                        r = t.toPixels(iv(t.options.min, t.dataMin)),
                                        s = t.toPixels(iv(t.options.max, t.dataMax)),
                                        o = Math.max(r, s);
                                    e.min = Math.min(t.pos, Math.min(r, s) - n), e.max = Math.max(t.pos + t.len, o + n)
                                }
                            }), e.res = !0) : e.followTouchMove && 1 === s ? this.runPointActions(e.normalize(t)) : n.length && (l || (e.selectionMarker = l = ip({
                                destroy: im,
                                touch: !0
                            }, i.plotBox)), e.pinchTranslate(n, r, h, l, d, o), e.hasPinched = a, e.scaleGroups(h, d), e.res && (e.res = !1, this.reset(!1, 0)))
                        },
                        touch: function(t, e) {
                            var i, n = this.chart;
                            n.index !== ic.hoverChartIndex && this.onContainerMouseLeave({
                                relatedTarget: !0
                            }), ic.hoverChartIndex = n.index, 1 === t.touches.length ? (t = this.normalize(t), n.isInsidePlot(t.chartX - n.plotLeft, t.chartY - n.plotTop) && !n.openMenu ? (e && this.runPointActions(t), "touchmove" === t.type && (i = !!(e = this.pinchDown)[0] && 4 <= Math.sqrt(Math.pow(e[0].chartX - t.chartX, 2) + Math.pow(e[0].chartY - t.chartY, 2))), iv(i, !0) && this.pinch(t)) : e && this.reset()) : 2 === t.touches.length && this.pinch(t)
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
                            n = t.css,
                            r = t.doc,
                            s = t.extend,
                            o = t.noop,
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
                                f = function(e, n, r, s) {
                                    ("touch" === e.pointerType || e.pointerType === e.MSPOINTER_TYPE_TOUCH) && i[t.hoverChartIndex] && (s(e), (s = i[t.hoverChartIndex].pointer)[n]({
                                        type: r,
                                        target: e.currentTarget,
                                        preventDefault: o,
                                        touches: p()
                                    }))
                                };
                            s(a.prototype, {
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
                                    t(this.chart.container, u ? "pointerdown" : "MSPointerDown", this.onContainerPointerDown), t(this.chart.container, u ? "pointermove" : "MSPointerMove", this.onContainerPointerMove), t(r, u ? "pointerup" : "MSPointerUp", this.onDocumentPointerUp)
                                }
                            }), c(a.prototype, "init", function(t, e, i) {
                                t.call(this, e, i), this.hasZoom && n(e.container, {
                                    "-ms-touch-action": "none",
                                    "touch-action": "none"
                                })
                            }), c(a.prototype, "setDOMEvents", function(t) {
                                t.apply(this), (this.hasZoom || this.followTouchMove) && this.batchMSEvents(e)
                            }), c(a.prototype, "destroy", function(t) {
                                this.batchMSEvents(l), t.call(this)
                            })
                        }
                    }(t), ix = (iy = t).addEvent, ib = iy.css, iw = iy.discardElement, ik = iy.defined, iS = iy.each, iM = iy.isFirefox, iC = iy.marginNames, iT = iy.merge, iA = iy.pick, iP = iy.setAnimation, iL = iy.stableSort, iI = iy.win, iO = iy.wrap, iy.Legend = function(t, e) {
                        this.init(t, e)
                    }, iy.Legend.prototype = {
                        init: function(t, e) {
                            this.chart = t, this.setOptions(e), e.enabled && (this.render(), ix(this.chart, "endResize", function() {
                                this.legend.positionCheckboxes()
                            }))
                        },
                        setOptions: function(t) {
                            var e = iA(t.padding, 8);
                            this.options = t, this.itemStyle = t.itemStyle, this.itemHiddenStyle = iT(this.itemStyle, t.itemHiddenStyle), this.itemMarginTop = t.itemMarginTop || 0, this.padding = e, this.initialItemY = e - 5, this.itemHeight = this.maxItemWidth = 0, this.symbolWidth = iA(t.symbolWidth, 16), this.pages = []
                        },
                        update: function(t, e) {
                            var i = this.chart;
                            this.setOptions(iT(!0, this.options, t)), this.destroy(), i.isDirtyLegend = i.isDirtyBox = !0, iA(e, !0) && i.redraw()
                        },
                        colorizeItem: function(t, e) {
                            t.legendGroup[e ? "removeClass" : "addClass"]("highcharts-legend-item-hidden");
                            var i = this.options,
                                n = t.legendItem,
                                r = t.legendLine,
                                s = t.legendSymbol,
                                o = this.itemHiddenStyle.color,
                                i = e ? i.itemStyle.color : o,
                                a = e && t.color || o,
                                l = t.options && t.options.marker,
                                h = {
                                    fill: a
                                };
                            n && n.css({
                                fill: i,
                                color: i
                            }), r && r.attr({
                                stroke: a
                            }), s && (l && s.isMarker && (h = t.pointAttribs(), e || (h.stroke = h.fill = o)), s.attr(h))
                        },
                        positionItem: function(t) {
                            var e = this.options,
                                i = e.symbolPadding,
                                e = !e.rtl,
                                n = t._legendItemPos,
                                r = n[0],
                                n = n[1],
                                s = t.checkbox;
                            (t = t.legendGroup) && t.element && t.translate(e ? r : this.legendWidth - r - 2 * i - 4, n), s && (s.x = r, s.y = n)
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
                                n = this.clipHeight || this.legendHeight,
                                r = this.titleHeight;
                            i && (e = i.translateY, iS(this.allItems, function(s) {
                                var o, a = s.checkbox;
                                a && (o = e + r + a.y + (t || 0) + 3, ib(a, {
                                    left: i.translateX + s.checkboxOffset + a.x - 20 + "px",
                                    top: o + "px",
                                    display: o > e - 6 && o < e + n - 6 ? "" : "none"
                                }))
                            }))
                        },
                        renderTitle: function() {
                            var t = this.options,
                                e = this.padding,
                                i = t.title,
                                n = 0;
                            i.text && (this.title || (this.title = this.chart.renderer.label(i.text, e - 3, e - 4, null, null, null, t.useHTML, null, "legend-title").attr({
                                zIndex: 1
                            }).css(i.style).add(this.group)), n = (t = this.title.getBBox()).height, this.offsetWidth = t.width, this.contentGroup.attr({
                                translateY: n
                            })), this.titleHeight = n
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
                                n = this.options,
                                r = "horizontal" === n.layout,
                                s = this.symbolWidth,
                                o = n.symbolPadding,
                                a = this.itemStyle,
                                l = this.itemHiddenStyle,
                                h = this.padding,
                                c = r ? iA(n.itemDistance, 20) : 0,
                                d = !n.rtl,
                                u = n.width,
                                p = n.itemMarginBottom || 0,
                                f = this.itemMarginTop,
                                g = t.legendItem,
                                m = !t.series,
                                v = !m && t.series.drawLegendSymbol ? t.series : t,
                                y = v.options,
                                x = this.createCheckboxForItem && y && y.showCheckbox,
                                y = s + o + c + 20 * !!x,
                                b = n.useHTML,
                                w = t.options.className;
                            g || (t.legendGroup = i.g("legend-item").addClass("highcharts-" + v.type + "-series highcharts-color-" + t.colorIndex + (w ? " " + w : "") + (m ? " highcharts-series-" + t.index : "")).attr({
                                zIndex: 1
                            }).add(this.scrollGroup), t.legendItem = g = i.text("", d ? s + o : -o, this.baseline || 0, b).css(iT(t.visible ? a : l)).attr({
                                align: d ? "left" : "right",
                                zIndex: 2
                            }).add(t.legendGroup), this.baseline || (s = a.fontSize, this.fontMetrics = i.fontMetrics(s, g), this.baseline = this.fontMetrics.f + 3 + f, g.attr("y", this.baseline)), this.symbolHeight = n.symbolHeight || this.fontMetrics.f, v.drawLegendSymbol(this, t), this.setItemEvents && this.setItemEvents(t, g, b), x && this.createCheckboxForItem(t)), this.colorizeItem(t, t.visible), a.width || g.css({
                                width: (n.itemWidth || n.width || e.spacingBox.width) - y
                            }), this.setText(t), i = g.getBBox(), a = t.checkboxOffset = n.itemWidth || t.legendItemWidth || i.width + y, this.itemHeight = i = Math.round(t.legendItemHeight || i.height || this.symbolHeight), r && this.itemX - h + a > (u || e.spacingBox.width - 2 * h - n.x) && (this.itemX = h, this.itemY += f + this.lastLineHeight + p, this.lastLineHeight = 0), this.maxItemWidth = Math.max(this.maxItemWidth, a), this.lastItemY = f + this.itemY + p, this.lastLineHeight = Math.max(i, this.lastLineHeight), t._legendItemPos = [this.itemX, this.itemY], r ? this.itemX += a : (this.itemY += f + i + p, this.lastLineHeight = i), this.offsetWidth = u || Math.max((r ? this.itemX - h - (t.checkbox ? 0 : c) : a) + h, this.offsetWidth)
                        },
                        getAllItems: function() {
                            var t = [];
                            return iS(this.chart.series, function(e) {
                                var i = e && e.options;
                                e && iA(i.showInLegend, !ik(i.linkedTo) && void 0, !0) && (t = t.concat(e.legendItems || ("point" === i.legendType ? e.data : e)))
                            }), t
                        },
                        adjustMargins: function(t, e) {
                            var i = this.chart,
                                n = this.options,
                                r = n.align.charAt(0) + n.verticalAlign.charAt(0) + n.layout.charAt(0);
                            n.floating || iS([/(lth|ct|rth)/, /(rtv|rm|rbv)/, /(rbh|cb|lbh)/, /(lbv|lm|ltv)/], function(s, o) {
                                s.test(r) && !ik(t[o]) && (i[iC[o]] = Math.max(i[iC[o]], i.legend[(o + 1) % 2 ? "legendHeight" : "legendWidth"] + [1, -1, -1, 1][o] * n[o % 2 ? "x" : "y"] + iA(n.margin, 12) + e[o]))
                            })
                        },
                        render: function() {
                            var t, e, i, n, r = this,
                                s = r.chart,
                                o = s.renderer,
                                a = r.group,
                                l = r.box,
                                h = r.options,
                                c = r.padding;
                            r.itemX = c, r.itemY = r.initialItemY, r.offsetWidth = 0, r.lastItemY = 0, a || (r.group = a = o.g("legend").attr({
                                zIndex: 7
                            }).add(), r.contentGroup = o.g().attr({
                                zIndex: 1
                            }).add(a), r.scrollGroup = o.g().add(r.contentGroup)), r.renderTitle(), iL(t = r.getAllItems(), function(t, e) {
                                return (t.options && t.options.legendIndex || 0) - (e.options && e.options.legendIndex || 0)
                            }), h.reversed && t.reverse(), r.allItems = t, r.display = e = !!t.length, r.lastLineHeight = 0, iS(t, function(t) {
                                r.renderItem(t)
                            }), i = (h.width || r.offsetWidth) + c, n = r.lastItemY + r.lastLineHeight + r.titleHeight, n = r.handleOverflow(n) + c, l || (r.box = l = o.rect().addClass("highcharts-legend-box").attr({
                                r: h.borderRadius
                            }).add(a), l.isNew = !0), l.attr({
                                stroke: h.borderColor,
                                "stroke-width": h.borderWidth || 0,
                                fill: h.backgroundColor || "none"
                            }).shadow(h.shadow), 0 < i && 0 < n && (l[l.isNew ? "attr" : "animate"](l.crisp({
                                x: 0,
                                y: 0,
                                width: i,
                                height: n
                            }, l.strokeWidth())), l.isNew = !1), l[e ? "show" : "hide"](), r.legendWidth = i, r.legendHeight = n, iS(t, function(t) {
                                r.positionItem(t)
                            }), e && a.align(iT(h, {
                                width: i,
                                height: n
                            }), !0, "spacingBox"), s.isResizing || this.positionCheckboxes()
                        },
                        handleOverflow: function(t) {
                            var e, i, n = this,
                                r = this.chart,
                                s = r.renderer,
                                o = this.options,
                                a = o.y,
                                l = this.padding,
                                r = r.spacingBox.height + ("top" === o.verticalAlign ? -a : a) - l,
                                a = o.maxHeight,
                                h = this.clipRect,
                                c = o.navigation,
                                d = iA(c.animation, !0),
                                u = c.arrowSize || 12,
                                p = this.nav,
                                f = this.pages,
                                g = this.allItems,
                                m = function(t) {
                                    "number" == typeof t ? h.attr({
                                        height: t
                                    }) : h && (n.clipRect = h.destroy(), n.contentGroup.clip()), n.contentGroup.div && (n.contentGroup.div.style.clip = t ? "rect(" + l + "px,9999px," + (l + t) + "px,0)" : "auto")
                                };
                            return "horizontal" !== o.layout || "middle" === o.verticalAlign || o.floating || (r /= 2), a && (r = Math.min(r, a)), f.length = 0, t > r && !1 !== c.enabled ? (this.clipHeight = e = Math.max(r - 20 - this.titleHeight - l, 0), this.currentPage = iA(this.currentPage, 1), this.fullHeight = t, iS(g, function(t, n) {
                                var r = t._legendItemPos[1];
                                t = Math.round(t.legendItem.getBBox().height);
                                var s = f.length;
                                (!s || r - f[s - 1] > e && (i || r) !== f[s - 1]) && (f.push(i || r), s++), n === g.length - 1 && r + t - f[s - 1] > e && f.push(r), r !== i && (i = r)
                            }), h || (h = n.clipRect = s.clipRect(0, l, 9999, 0), n.contentGroup.clip(h)), m(e), p || (this.nav = p = s.g().attr({
                                zIndex: 1
                            }).add(this.group), this.up = s.symbol("triangle", 0, 0, u, u).on("click", function() {
                                n.scroll(-1, d)
                            }).add(p), this.pager = s.text("", 15, 10).addClass("highcharts-legend-navigation").css(c.style).add(p), this.down = s.symbol("triangle-down", 0, 0, u, u).on("click", function() {
                                n.scroll(1, d)
                            }).add(p)), n.scroll(0), t = r) : p && (m(), this.nav = p.destroy(), this.scrollGroup.attr({
                                translateY: 1
                            }), this.clipHeight = 0), t
                        },
                        scroll: function(t, e) {
                            var i = this.pages,
                                n = i.length;
                            t = this.currentPage + t;
                            var r = this.clipHeight,
                                s = this.options.navigation,
                                o = this.pager,
                                a = this.padding;
                            t > n && (t = n), 0 < t && (void 0 !== e && iP(e, this.chart), this.nav.attr({
                                translateX: a,
                                translateY: r + this.padding + 7 + this.titleHeight,
                                visibility: "visible"
                            }), this.up.attr({
                                class: 1 === t ? "highcharts-legend-nav-inactive" : "highcharts-legend-nav-active"
                            }), o.attr({
                                text: t + "/" + n
                            }), this.down.attr({
                                x: 18 + this.pager.getBBox().width,
                                class: t === n ? "highcharts-legend-nav-inactive" : "highcharts-legend-nav-active"
                            }), this.up.attr({
                                fill: 1 === t ? s.inactiveColor : s.activeColor
                            }).css({
                                cursor: 1 === t ? "default" : "pointer"
                            }), this.down.attr({
                                fill: t === n ? s.inactiveColor : s.activeColor
                            }).css({
                                cursor: t === n ? "default" : "pointer"
                            }), e = -i[t - 1] + this.initialItemY, this.scrollGroup.animate({
                                translateY: e
                            }), this.currentPage = t, this.positionCheckboxes(e))
                        }
                    }, iy.LegendSymbolMixin = {
                        drawRectangle: function(t, e) {
                            var i = t.symbolHeight,
                                n = t.options.squareSymbol;
                            e.legendSymbol = this.chart.renderer.rect(n ? (t.symbolWidth - i) / 2 : 0, t.baseline - i + 1, n ? i : t.symbolWidth, i, iA(t.options.symbolRadius, i / 2)).addClass("highcharts-point").attr({
                                zIndex: 3
                            }).add(e.legendGroup)
                        },
                        drawLineMarker: function(t) {
                            var e, i = this.options,
                                n = i.marker,
                                r = t.symbolWidth,
                                s = t.symbolHeight,
                                o = s / 2,
                                a = this.chart.renderer,
                                l = this.legendGroup;
                            t = t.baseline - Math.round(.3 * t.fontMetrics.b), e = {
                                "stroke-width": i.lineWidth || 0
                            }, i.dashStyle && (e.dashstyle = i.dashStyle), this.legendLine = a.path(["M", 0, t, "L", r, t]).addClass("highcharts-graph").attr(e).add(l), n && !1 !== n.enabled && (i = Math.min(iA(n.radius, o), o), 0 === this.symbol.indexOf("url") && (n = iT(n, {
                                width: s,
                                height: s
                            }), i = 0), this.legendSymbol = n = a.symbol(this.symbol, r / 2 - i, t - i, 2 * i, 2 * i, n).addClass("highcharts-point").add(l), n.isMarker = !0)
                        }
                    }, (/Trident\/7\.0/.test(iI.navigator.userAgent) || iM) && iO(iy.Legend.prototype, "positionItem", function(t, e) {
                        var i = this,
                            n = function() {
                                e._legendItemPos && t.call(i, e)
                            };
                        n(), setTimeout(n)
                    }), iE = (iD = t).addEvent, iN = iD.animate, iR = iD.animObject, iB = iD.attr, iz = iD.doc, ij = iD.Axis, iG = iD.createElement, iW = iD.defaultOptions, iH = iD.discardElement, iF = iD.charts, iX = iD.css, iY = iD.defined, iV = iD.each, iU = iD.extend, i_ = iD.find, iK = iD.fireEvent, iq = iD.getStyle, iZ = iD.grep, i$ = iD.isNumber, iJ = iD.isObject, iQ = iD.isString, i0 = iD.Legend, i1 = iD.marginNames, i2 = iD.merge, i3 = iD.objectEach, i5 = iD.Pointer, i9 = iD.pick, i6 = iD.pInt, i4 = iD.removeEvent, i8 = iD.seriesTypes, i7 = iD.splat, nt = iD.svg, ne = iD.syncTimeout, ni = iD.win, nn = iD.Renderer, nr = iD.Chart = function() {
                        this.getArgs.apply(this, arguments)
                    }, iD.chart = function(t, e, i) {
                        return new nr(t, e, i)
                    }, iU(nr.prototype, {
                        callbacks: [],
                        getArgs: function() {
                            var t = [].slice.call(arguments);
                            (iQ(t[0]) || t[0].nodeName) && (this.renderTo = t.shift()), this.init(t[0], t[1])
                        },
                        init: function(t, e) {
                            var i, n, r = t.series,
                                s = t.plotOptions || {};
                            for (n in t.series = null, (i = i2(iW, t)).plotOptions) i.plotOptions[n].tooltip = s[n] && i2(s[n].tooltip) || void 0;
                            i.tooltip.userOptions = t.chart && t.chart.forExport && t.tooltip.userOptions || t.tooltip, i.series = t.series = r, this.userOptions = t, n = (t = i.chart).events, this.margin = [], this.spacing = [], this.bounds = {
                                h: {},
                                v: {}
                            }, this.callback = e, this.isResizing = 0, this.options = i, this.axes = [], this.series = [], this.hasCartesianSeries = t.showAxes;
                            var o = this;
                            o.index = iF.length, iF.push(o), iD.chartCount++, n && i3(n, function(t, e) {
                                iE(o, e, t)
                            }), o.xAxis = [], o.yAxis = [], o.pointCount = o.colorCounter = o.symbolCounter = 0, o.firstRender()
                        },
                        initSeries: function(t) {
                            var e = this.options.chart;
                            return (e = i8[t.type || e.type || e.defaultSeriesType]) || iD.error(17, !0), (e = new e).init(this, t), e
                        },
                        orderSeries: function(t) {
                            var e = this.series;
                            for (t = t || 0; t < e.length; t++) e[t] && (e[t].index = t, e[t].name = e[t].name || "Series " + (e[t].index + 1))
                        },
                        isInsidePlot: function(t, e, i) {
                            var n = i ? e : t;
                            return t = i ? t : e, 0 <= n && n <= this.plotWidth && 0 <= t && t <= this.plotHeight
                        },
                        redraw: function(t) {
                            var e, i, n, r = this.axes,
                                s = this.series,
                                o = this.pointer,
                                a = this.legend,
                                l = this.isDirtyLegend,
                                h = this.hasCartesianSeries,
                                c = this.isDirtyBox,
                                d = this.renderer,
                                u = d.isHidden(),
                                p = [];
                            for (this.setResponsive && this.setResponsive(!1), iD.setAnimation(t, this), u && this.temporaryDisplay(), this.layOutTitles(), t = s.length; t--;)
                                if ((n = s[t]).options.stacking && (e = !0, n.isDirty)) {
                                    i = !0;
                                    break
                                } if (i)
                                for (t = s.length; t--;)(n = s[t]).options.stacking && (n.isDirty = !0);
                            iV(s, function(t) {
                                t.isDirty && "point" === t.options.legendType && (t.updateTotals && t.updateTotals(), l = !0), t.isDirtyData && iK(t, "updatedData")
                            }), l && a.options.enabled && (a.render(), this.isDirtyLegend = !1), e && this.getStacks(), h && iV(r, function(t) {
                                t.updateNames(), t.setScale()
                            }), this.getMargins(), h && (iV(r, function(t) {
                                t.isDirty && (c = !0)
                            }), iV(r, function(t) {
                                var i = t.min + "," + t.max;
                                t.extKey !== i && (t.extKey = i, p.push(function() {
                                    iK(t, "afterSetExtremes", iU(t.eventArgs, t.getExtremes())), delete t.eventArgs
                                })), (c || e) && t.redraw()
                            })), c && this.drawChartBox(), iK(this, "predraw"), iV(s, function(t) {
                                (c || t.isDirty) && t.visible && t.redraw(), t.isDirtyData = !1
                            }), o && o.reset(!0), d.draw(), iK(this, "redraw"), iK(this, "render"), u && this.temporaryDisplay(!0), iV(p, function(t) {
                                t.call()
                            })
                        },
                        get: function(t) {
                            function e(e) {
                                return e.id === t || e.options && e.options.id === t
                            }
                            var i, n, r = this.series;
                            for (n = 0, i = i_(this.axes, e) || i_(this.series, e); !i && n < r.length; n++) i = i_(r[n].points || [], e);
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
                                new ij(t, e)
                            })
                        },
                        getSelectedPoints: function() {
                            var t = [];
                            return iV(this.series, function(e) {
                                t = t.concat(iZ(e.data || [], function(t) {
                                    return t.selected
                                }))
                            }), t
                        },
                        getSelectedSeries: function() {
                            return iZ(this.series, function(t) {
                                return t.selected
                            })
                        },
                        setTitle: function(t, e, i) {
                            var n, r = this,
                                s = r.options;
                            n = s.title = i2({
                                style: {
                                    color: "#333333",
                                    fontSize: s.isStock ? "16px" : "18px"
                                }
                            }, s.title, t), s = s.subtitle = i2({
                                style: {
                                    color: "#666666"
                                }
                            }, s.subtitle, e), iV([
                                ["title", t, n],
                                ["subtitle", e, s]
                            ], function(t, e) {
                                var i = t[0],
                                    n = r[i],
                                    s = t[1];
                                t = t[2], n && s && (r[i] = n = n.destroy()), t && t.text && !n && (r[i] = r.renderer.text(t.text, 0, 0, t.useHTML).attr({
                                    align: t.align,
                                    class: "highcharts-" + i,
                                    zIndex: t.zIndex || 4
                                }).add(), r[i].update = function(t) {
                                    r.setTitle(!e && t, e && t)
                                }, r[i].css(t.style))
                            }), r.layOutTitles(i)
                        },
                        layOutTitles: function(t) {
                            var e, i = 0,
                                n = this.renderer,
                                r = this.spacingBox;
                            iV(["title", "subtitle"], function(t) {
                                var e, s = this[t],
                                    o = this.options[t];
                                t = "title" === t ? -3 : o.verticalAlign ? 0 : i + 2, s && (e = o.style.fontSize, e = n.fontMetrics(e, s).b, s.css({
                                    width: (o.width || r.width + o.widthAdjust) + "px"
                                }).align(iU({
                                    y: t + e
                                }, o), !1, "spacingBox"), o.floating || o.verticalAlign || (i = Math.ceil(i + s.getBBox(o.useHTML).height)))
                            }, this), e = this.titleOffset !== i, this.titleOffset = i, !this.isDirtyBox && e && (this.isDirtyBox = e, this.hasRendered && i9(t, !0) && this.isDirtyBox && this.redraw())
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
                                for (; e && e.style;) e.hcOrigStyle && (iD.css(e, e.hcOrigStyle), delete e.hcOrigStyle), e.hcOrigDetached && (iz.body.removeChild(e), e.hcOrigDetached = !1), e = e.parentNode;
                            else
                                for (; e && e.style && (iz.body.contains(e) || (e.hcOrigDetached = !0, iz.body.appendChild(e)), ("none" === iq(e, "display", !1) || e.hcOricDetached) && (e.hcOrigStyle = {
                                        display: e.style.display,
                                        height: e.style.height,
                                        overflow: e.style.overflow
                                    }, t = {
                                        display: "block",
                                        overflow: "hidden"
                                    }, e !== this.renderTo && (t.height = 0), iD.css(e, t), e.offsetWidth || e.style.setProperty("display", "block", "important")), (e = e.parentNode) !== iz.body););
                        },
                        setClassName: function(t) {
                            this.container.className = "highcharts-container " + (t || "")
                        },
                        getContainer: function() {
                            var t, e, i, n = this.options,
                                r = n.chart;
                            t = this.renderTo;
                            var s, o = iD.uniqueKey();
                            t || (this.renderTo = t = r.renderTo), iQ(t) && (this.renderTo = t = iz.getElementById(t)), t || iD.error(13, !0), i$(e = i6(iB(t, "data-highcharts-chart"))) && iF[e] && iF[e].hasRendered && iF[e].destroy(), iB(t, "data-highcharts-chart", this.index), t.innerHTML = "", r.skipClone || t.offsetWidth || this.temporaryDisplay(), this.getChartSize(), s = iU({
                                position: "relative",
                                overflow: "hidden",
                                width: (e = this.chartWidth) + "px",
                                height: (i = this.chartHeight) + "px",
                                textAlign: "left",
                                lineHeight: "normal",
                                zIndex: 0,
                                "-webkit-tap-highlight-color": "rgba(0,0,0,0)"
                            }, r.style), this.container = t = iG("div", {
                                id: o
                            }, s, t), this._cursor = t.style.cursor, this.renderer = new(iD[r.renderer] || nn)(t, e, i, null, r.forExport, n.exporting && n.exporting.allowHTML), this.setClassName(r.className), this.renderer.setStyle(r.style), this.renderer.chartIndex = this.index
                        },
                        getMargins: function(t) {
                            var e = this.spacing,
                                i = this.margin,
                                n = this.titleOffset;
                            this.resetMargins(), n && !iY(i[0]) && (this.plotTop = Math.max(this.plotTop, n + this.options.title.margin + e[0])), this.legend.display && this.legend.adjustMargins(i, e), this.extraMargin && (this[this.extraMargin.type] = (this[this.extraMargin.type] || 0) + this.extraMargin.value), this.extraTopMargin && (this.plotTop += this.extraTopMargin), t || this.getAxisMargins()
                        },
                        getAxisMargins: function() {
                            var t = this,
                                e = t.axisOffset = [0, 0, 0, 0],
                                i = t.margin;
                            t.hasCartesianSeries && iV(t.axes, function(t) {
                                t.visible && t.getOffset()
                            }), iV(i1, function(n, r) {
                                iY(i[r]) || (t[n] += e[r])
                            }), t.setChartSize()
                        },
                        reflow: function(t) {
                            var e = this,
                                i = e.options.chart,
                                n = e.renderTo,
                                r = iY(i.width) && iY(i.height),
                                s = i.width || iq(n, "width"),
                                i = i.height || iq(n, "height"),
                                n = t ? t.target : ni;
                            !r && !e.isPrinting && s && i && (n === ni || n === iz) && ((s !== e.containerWidth || i !== e.containerHeight) && (clearTimeout(e.reflowTimeout), e.reflowTimeout = ne(function() {
                                e.container && e.setSize(void 0, void 0, !1)
                            }, 100 * !!t)), e.containerWidth = s, e.containerHeight = i)
                        },
                        initReflow: function() {
                            var t, e = this;
                            t = iE(ni, "resize", function(t) {
                                e.reflow(t)
                            }), iE(e, "destroy", t)
                        },
                        setSize: function(t, e, i) {
                            var n = this,
                                r = n.renderer;
                            n.isResizing += 1, iD.setAnimation(i, n), n.oldChartHeight = n.chartHeight, n.oldChartWidth = n.chartWidth, void 0 !== t && (n.options.chart.width = t), void 0 !== e && (n.options.chart.height = e), n.getChartSize(), ((t = r.globalAnimation) ? iN : iX)(n.container, {
                                width: n.chartWidth + "px",
                                height: n.chartHeight + "px"
                            }, t), n.setChartSize(!0), r.setSize(n.chartWidth, n.chartHeight, i), iV(n.axes, function(t) {
                                t.isDirty = !0, t.setScale()
                            }), n.isDirtyLegend = !0, n.isDirtyBox = !0, n.layOutTitles(), n.getMargins(), n.redraw(i), n.oldChartHeight = null, iK(n, "resize"), ne(function() {
                                n && iK(n, "endResize", null, function() {
                                    --n.isResizing
                                })
                            }, iR(t).duration)
                        },
                        setChartSize: function(t) {
                            function e(t) {
                                return t = p[t] || 0, Math.max(o || t, t) / 2
                            }
                            var i, n, r, s, o, a = this.inverted,
                                l = this.renderer,
                                h = this.chartWidth,
                                c = this.chartHeight,
                                d = this.options.chart,
                                u = this.spacing,
                                p = this.clipOffset;
                            this.plotLeft = i = Math.round(this.plotLeft), this.plotTop = n = Math.round(this.plotTop), this.plotWidth = r = Math.max(0, Math.round(h - i - this.marginRight)), this.plotHeight = s = Math.max(0, Math.round(c - n - this.marginBottom)), this.plotSizeX = a ? s : r, this.plotSizeY = a ? r : s, this.plotBorderWidth = d.plotBorderWidth || 0, this.spacingBox = l.spacingBox = {
                                x: u[3],
                                y: u[0],
                                width: h - u[3] - u[1],
                                height: c - u[0] - u[2]
                            }, this.plotBox = l.plotBox = {
                                x: i,
                                y: n,
                                width: r,
                                height: s
                            }, o = 2 * Math.floor(this.plotBorderWidth / 2), a = Math.ceil(e(3)), l = Math.ceil(e(0)), this.clipBox = {
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
                                var n = e[i],
                                    r = iJ(n) ? n : [n, n, n, n];
                                iV(["Top", "Right", "Bottom", "Left"], function(n, s) {
                                    t[i][s] = i9(e[i + n], r[s])
                                })
                            }), iV(i1, function(e, i) {
                                t[e] = i9(t.margin[i], t.spacing[i])
                            }), t.axisOffset = [0, 0, 0, 0], t.clipOffset = []
                        },
                        drawChartBox: function() {
                            var t, e, i = this.options.chart,
                                n = this.renderer,
                                r = this.chartWidth,
                                s = this.chartHeight,
                                o = this.chartBackground,
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
                                x = this.clipBox,
                                b = "animate";
                            o || (this.chartBackground = o = n.rect().addClass("highcharts-background").add(), b = "attr"), e = (t = i.borderWidth || 0) + 8 * !!i.shadow, c = {
                                fill: c || "none"
                            }, (t || o["stroke-width"]) && (c.stroke = i.borderColor, c["stroke-width"] = t), o.attr(c).shadow(i.shadow), o[b]({
                                x: e / 2,
                                y: e / 2,
                                width: r - e - t % 2,
                                height: s - e - t % 2,
                                r: i.borderRadius
                            }), b = "animate", a || (b = "attr", this.plotBackground = a = n.rect().addClass("highcharts-plot-background").add()), a[b](v), a.attr({
                                fill: d || "none"
                            }).shadow(i.plotShadow), u && (h ? h.animate(v) : this.plotBGImage = n.image(u, p, f, g, m).add()), y ? y.animate({
                                width: x.width,
                                height: x.height
                            }) : this.clipRect = n.clipRect(x), b = "animate", l || (b = "attr", this.plotBorder = l = n.rect().addClass("highcharts-plot-border").attr({
                                zIndex: 1
                            }).add()), l.attr({
                                stroke: i.plotBorderColor,
                                "stroke-width": i.plotBorderWidth || 0,
                                fill: "none"
                            }), l[b](l.crisp({
                                x: p,
                                y: f,
                                width: g,
                                height: m
                            }, -l.strokeWidth())), this.isDirtyBox = !1
                        },
                        propFromSeries: function() {
                            var t, e, i, n = this,
                                r = n.options.chart,
                                s = n.options.series;
                            iV(["inverted", "angular", "polar"], function(o) {
                                for (t = i8[r.type || r.defaultSeriesType], i = r[o] || t && t.prototype[o], e = s && s.length; !i && e--;)(t = i8[s[e].type]) && t.prototype[o] && (i = !0);
                                n[o] = i
                            })
                        },
                        linkSeries: function() {
                            var t = this,
                                e = t.series;
                            iV(e, function(t) {
                                t.linkedSeries.length = 0
                            }), iV(e, function(e) {
                                var i = e.options.linkedTo;
                                iQ(i) && (i = ":previous" === i ? t.series[e.index - 1] : t.get(i)) && i.linkedParent !== e && (i.linkedSeries.push(e), e.linkedParent = i, e.visible = i9(e.options.visible, i.options.visible, e.visible))
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
                                var n = iU(e.style, i.style),
                                    r = i6(n.left) + t.plotLeft,
                                    s = i6(n.top) + t.plotTop + 12;
                                delete n.left, delete n.top, t.renderer.text(i.html, r, s).attr({
                                    zIndex: 2
                                }).css(n).add()
                            })
                        },
                        render: function() {
                            var t, e, i, n = this.axes,
                                r = this.renderer,
                                s = this.options;
                            this.setTitle(), this.legend = new i0(this, s.legend), this.getStacks && this.getStacks(), this.getMargins(!0), this.setChartSize(), s = this.plotWidth, t = this.plotHeight -= 21, iV(n, function(t) {
                                t.setScale()
                            }), this.getAxisMargins(), e = 1.1 < s / this.plotWidth, i = 1.05 < t / this.plotHeight, (e || i) && (iV(n, function(t) {
                                (t.horiz && e || !t.horiz && i) && t.setTickInterval(!0)
                            }), this.getMargins()), this.drawChartBox(), this.hasCartesianSeries && iV(n, function(t) {
                                t.visible && t.render()
                            }), this.seriesGroup || (this.seriesGroup = r.g("series-group").attr({
                                zIndex: 3
                            }).add()), this.renderSeries(), this.renderLabels(), this.addCredits(), this.setResponsive && this.setResponsive(), this.hasRendered = !0
                        },
                        addCredits: function(t) {
                            var e = this;
                            (t = i2(!0, this.options.credits, t)).enabled && !this.credits && (this.credits = this.renderer.text(t.text + (this.mapCredits || ""), 0, 0).addClass("highcharts-credits").on("click", function() {
                                t.href && (ni.location.href = t.href)
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
                                n = e.series,
                                r = e.container,
                                s = r && r.parentNode;
                            for (iK(e, "destroy"), e.renderer.forExport ? iD.erase(iF, e) : iF[e.index] = void 0, iD.chartCount--, e.renderTo.removeAttribute("data-highcharts-chart"), i4(e), t = i.length; t--;) i[t] = i[t].destroy();
                            for (this.scroller && this.scroller.destroy && this.scroller.destroy(), t = n.length; t--;) n[t] = n[t].destroy();
                            iV("title subtitle chartBackground plotBackground plotBGImage plotBorder seriesGroup clipRect credits pointer rangeSelector legend resetZoomButton tooltip renderer".split(" "), function(t) {
                                var i = e[t];
                                i && i.destroy && (e[t] = i.destroy())
                            }), r && (r.innerHTML = "", i4(r), s && iH(r)), i3(e, function(t, i) {
                                delete e[i]
                            })
                        },
                        isReadyToRender: function() {
                            var t = this;
                            return !!nt || ni != ni.top || "complete" === iz.readyState || (iz.attachEvent("onreadystatechange", function() {
                                iz.detachEvent("onreadystatechange", t.firstRender), "complete" === iz.readyState && t.firstRender()
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
                    }), na = (ns = t).each, nl = ns.extend, nh = ns.erase, nc = ns.fireEvent, nd = ns.format, nu = ns.isArray, np = ns.isNumber, nf = ns.pick, ng = ns.removeEvent, ns.Point = no = function() {}, ns.Point.prototype = {
                        init: function(t, e, i) {
                            return this.series = t, this.color = t.color, this.applyOptions(e, i), t.options.colorByPoint ? (e = t.options.colors || t.chart.options.colors, this.color = this.color || e[t.colorCounter], e = e.length, i = t.colorCounter, t.colorCounter++, t.colorCounter === e && (t.colorCounter = 0)) : i = t.colorIndex, this.colorIndex = nf(this.colorIndex, i), t.chart.pointCount++, this
                        },
                        applyOptions: function(t, e) {
                            var i = this.series,
                                n = i.options.pointValKey || i.pointValKey;
                            return nl(this, t = no.prototype.optionsToObject.call(this, t)), this.options = this.options ? nl(this.options, t) : t, t.group && delete this.group, n && (this.y = this[n]), this.isNull = nf(this.isValid && !this.isValid(), null === this.x || !np(this.y, !0)), this.selected && (this.state = "select"), "name" in this && void 0 === e && i.xAxis && i.xAxis.hasNames && (this.x = i.xAxis.nameToX(this)), void 0 === this.x && i && (this.x = void 0 === e ? i.autoIncrement(this) : e), this
                        },
                        optionsToObject: function(t) {
                            var e = {},
                                i = this.series,
                                n = i.options.keys,
                                r = n || i.pointArrayMap || ["y"],
                                s = r.length,
                                a = 0,
                                l = 0;
                            if (np(t) || null === t) e[r[0]] = t;
                            else if (nu(t))
                                for (!n && t.length > s && ("string" === (i = o._(t[0])) ? e.name = t[0] : "number" === i && (e.x = t[0]), a++); l < s;) n && void 0 === t[a] || (e[r[l]] = t[a]), a++, l++;
                            else "object" === (void 0 === t ? "undefined" : o._(t)) && (e = t, t.dataLabels && (i._hasPointLabels = !0), t.marker && (i._hasPointMarkers = !0));
                            return e
                        },
                        getClassName: function() {
                            return "highcharts-point" + (this.selected ? " highcharts-point-select" : "") + (this.negative ? " highcharts-negative" : "") + (this.isNull ? " highcharts-null-point" : "") + (void 0 !== this.colorIndex ? " highcharts-color-" + this.colorIndex : "") + (this.options.className ? " " + this.options.className : "") + (this.zone && this.zone.className ? " " + this.zone.className.replace("highcharts-negative", "") : "")
                        },
                        getZone: function() {
                            var t, e = this.series,
                                i = e.zones,
                                e = e.zoneAxis || "y",
                                n = 0;
                            for (t = i[0]; this[e] >= t.value;) t = i[++n];
                            return t && t.color && !this.options.color && (this.color = t.color), t
                        },
                        destroy: function() {
                            var t, e = this.series.chart,
                                i = e.hoverPoints;
                            for (t in e.pointCount--, i && (this.setState(), nh(i, this), i.length || (e.hoverPoints = null)), this === e.hoverPoint && this.onMouseOut(), (this.graphic || this.dataLabel) && (ng(this), this.destroyElements()), this.legendItem && e.legend.destroyItem(this), this) this[t] = null
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
                                n = nf(i.valueDecimals, ""),
                                r = i.valuePrefix || "",
                                s = i.valueSuffix || "";
                            return na(e.pointArrayMap || ["y"], function(e) {
                                e = "{point." + e, (r || s) && (t = t.replace(e + "}", r + e + "}" + s)), t = t.replace(e + "}", e + ":,." + n + "f}")
                            }), nd(t, {
                                point: this,
                                series: this.series
                            })
                        },
                        firePointEvent: function(t, e, i) {
                            var n = this,
                                r = this.series.options;
                            (r.point.events[t] || n.options && n.options.events && n.options.events[t]) && this.importEvents(), "click" === t && r.allowPointSelect && (i = function(t) {
                                n.select && n.select(null, t.ctrlKey || t.metaKey || t.shiftKey)
                            }), nc(this, t, e, i)
                        },
                        visible: !0
                    }, nv = (nm = t).addEvent, ny = nm.animObject, nx = nm.arrayMax, nb = nm.arrayMin, nw = nm.correctFloat, nk = nm.Date, nS = nm.defaultOptions, nM = nm.defaultPlotOptions, nC = nm.defined, nT = nm.each, nA = nm.erase, nP = nm.extend, nL = nm.fireEvent, nI = nm.grep, nO = nm.isArray, nD = nm.isNumber, nE = nm.isString, nN = nm.merge, nR = nm.objectEach, nB = nm.pick, nz = nm.removeEvent, nj = nm.splat, nG = nm.SVGElement, nW = nm.syncTimeout, nH = nm.win, nm.Series = nm.seriesType("line", null, {
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
                                return null === this.y ? "" : nm.numberFormat(this.y, -1)
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
                        pointClass: nm.Point,
                        sorted: !0,
                        requireSorting: !0,
                        directTouch: !1,
                        axisTypes: ["xAxis", "yAxis"],
                        colorCounter: 0,
                        parallelArrays: ["x", "y"],
                        coll: "series",
                        init: function(t, e) {
                            var i, n, r = this,
                                s = t.series;
                            r.chart = t, r.options = e = r.setOptions(e), r.linkedSeries = [], r.bindAxes(), nP(r, {
                                name: e.name,
                                state: "",
                                visible: !1 !== e.visible,
                                selected: !0 === e.selected
                            }), nR(i = e.events, function(t, e) {
                                nv(r, e, t)
                            }), (i && i.click || e.point && e.point.events && e.point.events.click || e.allowPointSelect) && (t.runTrackerClick = !0), r.getColor(), r.getSymbol(), nT(r.parallelArrays, function(t) {
                                r[t + "Data"] = []
                            }), r.setData(e.data, !1), r.isCartesian && (t.hasCartesianSeries = !0), s.length && (n = s[s.length - 1]), r._i = nB(n && n._i, -1) + 1, t.orderSeries(this.insert(s))
                        },
                        insert: function(t) {
                            var e, i = this.options.index;
                            if (nD(i)) {
                                for (e = t.length; e--;)
                                    if (i >= nB(t[e].options.index, t[e]._i)) {
                                        t.splice(e + 1, 0, this);
                                        break
                                    } - 1 === e && t.unshift(this), e += 1
                            } else t.push(this);
                            return nB(e, t.length - 1)
                        },
                        bindAxes: function() {
                            var t, e = this,
                                i = e.options,
                                n = e.chart;
                            nT(e.axisTypes || [], function(r) {
                                nT(n[r], function(n) {
                                    t = n.options, (i[r] === t.index || void 0 !== i[r] && i[r] === t.id || void 0 === i[r] && 0 === t.index) && (e.insert(n.series), e[r] = n, n.isDirty = !0)
                                }), e[r] || e.optionalAxis === r || nm.error(18, !0)
                            })
                        },
                        updateParallelArrays: function(t, e) {
                            var i = t.series,
                                n = arguments,
                                r = nD(e) ? function(n) {
                                    var r = "y" === n && i.toYData ? i.toYData(t) : t[n];
                                    i[n + "Data"][e] = r
                                } : function(t) {
                                    Array.prototype[e].apply(i[t + "Data"], Array.prototype.slice.call(n, 2))
                                };
                            nT(i.parallelArrays, r)
                        },
                        autoIncrement: function() {
                            var t, e = this.options,
                                i = this.xIncrement,
                                n = e.pointIntervalUnit,
                                i = nB(i, e.pointStart, 0);
                            return this.pointInterval = t = nB(this.pointInterval, e.pointInterval, 1), n && (e = new nk(i), "day" === n ? e = +e[nk.hcSetDate](e[nk.hcGetDate]() + t) : "month" === n ? e = +e[nk.hcSetMonth](e[nk.hcGetMonth]() + t) : "year" === n && (e = +e[nk.hcSetFullYear](e[nk.hcGetFullYear]() + t)), t = e - i), this.xIncrement = i + t, i
                        },
                        setOptions: function(t) {
                            var e = this.chart,
                                i = e.options,
                                n = i.plotOptions,
                                r = (e.userOptions || {}).plotOptions || {},
                                s = n[this.type];
                            return this.userOptions = t, e = nN(s, n.series, t), this.tooltipOptions = nN(nS.tooltip, nS.plotOptions.series && nS.plotOptions.series.tooltip, nS.plotOptions[this.type].tooltip, i.tooltip.userOptions, n.series && n.series.tooltip, n[this.type].tooltip, t.tooltip), this.stickyTracking = nB(t.stickyTracking, r[this.type] && r[this.type].stickyTracking, r.series && r.series.stickyTracking, !!this.tooltipOptions.shared && !this.noSharedTooltip || e.stickyTracking), null === s.marker && delete e.marker, this.zoneAxis = e.zoneAxis, t = this.zones = (e.zones || []).slice(), (e.negativeColor || e.negativeFillColor) && !e.zones && t.push({
                                value: e[this.zoneAxis + "Threshold"] || e.threshold || 0,
                                className: "highcharts-negative",
                                color: e.negativeColor,
                                fillColor: e.negativeFillColor
                            }), t.length && nC(t[t.length - 1].value) && t.push({
                                color: this.color,
                                fillColor: this.fillColor
                            }), e
                        },
                        getCyclic: function(t, e, i) {
                            var n, r = this.chart,
                                s = this.userOptions,
                                o = t + "Index",
                                a = t + "Counter",
                                l = i ? i.length : nB(r.options.chart[t + "Count"], r[t + "Count"]);
                            e || (nC(n = nB(s[o], s["_" + o])) || (r.series.length || (r[a] = 0), s["_" + o] = n = r[a] % l, r[a] += 1), i && (e = i[n])), void 0 !== n && (this[o] = n), this[t] = e
                        },
                        getColor: function() {
                            this.options.colorByPoint ? this.options.color = null : this.getCyclic("color", this.options.color || nM[this.type].color, this.chart.options.colors)
                        },
                        getSymbol: function() {
                            this.getCyclic("symbol", this.options.marker.symbol, this.chart.options.symbols)
                        },
                        drawLegendSymbol: nm.LegendSymbolMixin.drawLineMarker,
                        setData: function(t, e, i, n) {
                            var r, s = this,
                                o = s.points,
                                a = o && o.length || 0,
                                l = s.options,
                                h = s.chart,
                                c = null,
                                d = s.xAxis,
                                u = l.turboThreshold,
                                p = this.xData,
                                f = this.yData,
                                g = (r = s.pointArrayMap) && r.length;
                            if (r = (t = t || []).length, e = nB(e, !0), !1 !== n && r && a === r && !s.cropped && !s.hasGroupedData && s.visible) nT(t, function(t, e) {
                                o[e].update && t !== l.data[e] && o[e].update(t, !1, null, !1)
                            });
                            else {
                                if (s.xIncrement = null, s.colorCounter = 0, nT(this.parallelArrays, function(t) {
                                        s[t + "Data"].length = 0
                                    }), u && r > u) {
                                    for (i = 0; null === c && i < r;) c = t[i], i++;
                                    if (nD(c))
                                        for (i = 0; i < r; i++) p[i] = this.autoIncrement(), f[i] = t[i];
                                    else if (nO(c))
                                        if (g)
                                            for (i = 0; i < r; i++) c = t[i], p[i] = c[0], f[i] = c.slice(1, g + 1);
                                        else
                                            for (i = 0; i < r; i++) c = t[i], p[i] = c[0], f[i] = c[1];
                                    else nm.error(12)
                                } else
                                    for (i = 0; i < r; i++) void 0 !== t[i] && (c = {
                                        series: s
                                    }, s.pointClass.prototype.applyOptions.apply(c, [t[i]]), s.updateParallelArrays(c, i));
                                for (nE(f[0]) && nm.error(14, !0), s.data = [], s.options.data = s.userOptions.data = t, i = a; i--;) o[i] && o[i].destroy && o[i].destroy();
                                d && (d.minRange = d.userMinRange), s.isDirty = h.isDirtyBox = !0, s.isDirtyData = !!o, i = !1
                            }
                            "point" === l.legendType && (this.processData(), this.generatePoints()), e && h.redraw(i)
                        },
                        processData: function(t) {
                            var e, i = this.xData,
                                n = this.yData,
                                r = i.length;
                            e = 0;
                            var s, o, a, l = this.xAxis,
                                h = this.options;
                            a = h.cropThreshold;
                            var c, d, u = this.getExtremesFromAll || h.getExtremesFromAll,
                                p = this.isCartesian,
                                h = l && l.val2lin,
                                f = l && l.isLog;
                            if (p && !this.isDirty && !l.isDirty && !this.yAxis.isDirty && !t) return !1;
                            for (l && (c = (t = l.getExtremes()).min, d = t.max), p && this.sorted && !u && (!a || r > a || this.forceCrop) && (i[r - 1] < c || i[0] > d ? (i = [], n = []) : (i[0] < c || i[r - 1] > d) && (i = (e = this.cropData(this.xData, this.yData, c, d)).xData, n = e.yData, e = e.start, s = !0)), a = i.length || 1; --a;) 0 < (r = f ? h(i[a]) - h(i[a - 1]) : i[a] - i[a - 1]) && (void 0 === o || r < o) ? o = r : 0 > r && this.requireSorting && nm.error(15);
                            this.cropped = s, this.cropStart = e, this.processedXData = i, this.processedYData = n, this.closestPointRange = o
                        },
                        cropData: function(t, e, i, n) {
                            var r, s = t.length,
                                o = 0,
                                a = s,
                                l = nB(this.cropShoulder, 1);
                            for (r = 0; r < s; r++)
                                if (t[r] >= i) {
                                    o = Math.max(0, r - l);
                                    break
                                } for (i = r; i < s; i++)
                                if (t[i] > n) {
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
                            var t, e, i, n, r = this.options,
                                s = r.data,
                                o = this.data,
                                a = this.processedXData,
                                l = this.processedYData,
                                h = this.pointClass,
                                c = a.length,
                                d = this.cropStart || 0,
                                u = this.hasGroupedData,
                                r = r.keys,
                                p = [];
                            for (o || u || ((o = []).length = s.length, o = this.data = o), r && u && (this.options.keys = !1), n = 0; n < c; n++) e = d + n, u ? (i = (new h).init(this, [a[n]].concat(nj(l[n])))).dataGroup = this.groupMap[n] : (i = o[e]) || void 0 === s[e] || (o[e] = i = (new h).init(this, s[e], a[n])), i && (i.index = e, p[n] = i);
                            if (this.options.keys = r, o && (c !== (t = o.length) || u))
                                for (n = 0; n < t; n++) n !== d || u || (n += c), o[n] && (o[n].destroyElements(), o[n].plotX = void 0);
                            this.data = o, this.points = p
                        },
                        getExtremes: function(t) {
                            var e, i, n, r, s, o = this.yAxis,
                                a = this.processedXData,
                                l = [],
                                h = 0,
                                c = (e = this.xAxis.getExtremes()).min,
                                d = e.max;
                            for (s = 0, e = (t = t || this.stackedYData || this.processedYData || []).length; s < e; s++)
                                if (n = a[s], i = (nD(r = t[s], !0) || nO(r)) && (!o.positiveValuesOnly || r.length || 0 < r), n = this.getExtremesFromAll || this.options.getExtremesFromAll || this.cropped || (a[s] || n) >= c && (a[s] || n) <= d, i && n)
                                    if (i = r.length)
                                        for (; i--;) null !== r[i] && (l[h++] = r[i]);
                                    else l[h++] = r;
                            this.dataMin = nb(l), this.dataMax = nx(l)
                        },
                        translate: function() {
                            this.processedXData || this.processData(), this.generatePoints();
                            var t, e, i, n, r = this.options,
                                s = r.stacking,
                                o = this.xAxis,
                                a = o.categories,
                                l = this.yAxis,
                                h = this.points,
                                c = h.length,
                                d = !!this.modifyValue,
                                u = r.pointPlacement,
                                p = "between" === u || nD(u),
                                f = r.threshold,
                                g = r.startFromThreshold ? f : 0,
                                m = Number.MAX_VALUE;
                            for ("between" === u && (u = .5), nD(u) && (u *= nB(r.pointRange || o.pointRange)), r = 0; r < c; r++) {
                                var v = h[r],
                                    y = v.x,
                                    x = v.y;
                                e = v.low;
                                var b, w = s && l.stacks[(this.negStacks && x < (g ? 0 : f) ? "-" : "") + this.stackKey];
                                l.positiveValuesOnly && null !== x && 0 >= x && (v.isNull = !0), v.plotX = t = nw(Math.min(Math.max(-1e5, o.translate(y, 0, 0, 0, 1, u, "flags" === this.type)), 1e5)), s && this.visible && !v.isNull && w && w[y] && (n = this.getStackIndicator(n, y, this.index), e = (x = (b = w[y]).points[n.key])[0], x = x[1], e === g && n.key === w[y].base && (e = nB(f, l.min)), l.positiveValuesOnly && 0 >= e && (e = null), v.total = v.stackTotal = b.total, v.percentage = b.total && v.y / b.total * 100, v.stackY = x, b.setOffset(this.pointXOffset || 0, this.barW || 0)), v.yBottom = nC(e) ? l.translate(e, 0, 1, 0, 1) : null, d && (x = this.modifyValue(x, v)), v.plotY = e = "number" == typeof x && 1 / 0 !== x ? Math.min(Math.max(-1e5, l.translate(x, 0, 1, 0, 1)), 1e5) : void 0, v.isInside = void 0 !== e && 0 <= e && e <= l.len && 0 <= t && t <= o.len, v.clientX = p ? nw(o.translate(y, 0, 0, 0, 1, u)) : t, v.negative = v.y < (f || 0), v.category = a && void 0 !== a[v.x] ? a[v.x] : v.x, v.isNull || (void 0 !== i && (m = Math.min(m, Math.abs(t - i))), i = t), v.zone = this.zones.length && v.getZone()
                            }
                            this.closestPointRangePx = m
                        },
                        getValidPoints: function(t, e) {
                            var i = this.chart;
                            return nI(t || this.points || [], function(t) {
                                return (!e || !!i.isInsidePlot(t.plotX, t.plotY, i.inverted)) && !t.isNull
                            })
                        },
                        setClip: function(t) {
                            var e = this.chart,
                                i = this.options,
                                n = e.renderer,
                                r = e.inverted,
                                s = this.clipBox,
                                o = s || e.clipBox,
                                a = this.sharedClipKey || ["_sharedClip", t && t.duration, t && t.easing, o.height, i.xAxis, i.yAxis].join(),
                                l = e[a],
                                h = e[a + "m"];
                            l || (t && (o.width = 0, e[a + "m"] = h = n.clipRect(-99, r ? -e.plotLeft : -e.plotTop, 99, r ? e.chartWidth : e.chartHeight)), e[a] = l = n.clipRect(o), l.count = {
                                length: 0
                            }), t && !l.count[this.index] && (l.count[this.index] = !0, l.count.length += 1), !1 !== i.clip && (this.group.clip(t || s ? l : e.clipRect), this.markerGroup.clip(h), this.sharedClipKey = a), t || (l.count[this.index] && (delete l.count[this.index], --l.count.length), 0 === l.count.length && a && e[a] && (s || (e[a] = e[a].destroy()), e[a + "m"] && (e[a + "m"] = e[a + "m"].destroy())))
                        },
                        animate: function(t) {
                            var e, i = this.chart,
                                n = ny(this.options.animation);
                            t ? this.setClip(n) : ((t = i[e = this.sharedClipKey]) && t.animate({
                                width: i.plotSizeX
                            }, n), i[e + "m"] && i[e + "m"].animate({
                                width: i.plotSizeX + 99
                            }, n), this.animate = null)
                        },
                        afterAnimate: function() {
                            this.setClip(), nL(this, "afterAnimate"), this.finishedAnimating = !0
                        },
                        drawPoints: function() {
                            var t, e, i, n, r, s, o, a, l = this.points,
                                h = this.chart,
                                c = this.options.marker,
                                d = this[this.specialGroup] || this.markerGroup,
                                u = nB(c.enabled, !!this.xAxis.isRadial || null, this.closestPointRangePx >= 2 * c.radius);
                            if (!1 !== c.enabled || this._hasPointMarkers)
                                for (e = 0; e < l.length; e++) t = (i = l[e]).plotY, n = i.graphic, r = i.marker || {}, s = !!i.marker, o = u && void 0 === r.enabled || r.enabled, a = i.isInside, o && nD(t) && null !== i.y ? (i.hasImage = 0 === (t = nB(r.symbol, this.symbol)).indexOf("url"), o = this.markerAttribs(i, i.selected && "select"), n ? n[a ? "show" : "hide"](!0).animate(o) : a && (0 < o.width || i.hasImage) && (i.graphic = n = h.renderer.symbol(t, o.x, o.y, o.width, o.height, s ? r : c).add(d)), n && n.attr(this.pointAttribs(i, i.selected && "select")), n && n.addClass(i.getClassName(), !0)) : n && (i.graphic = n.destroy())
                        },
                        markerAttribs: function(t, e) {
                            var i = this.options.marker,
                                n = t.marker || {},
                                r = nB(n.radius, i.radius);
                            return e && (i = i.states[e], r = nB((e = n.states && n.states[e]) && e.radius, i && i.radius, r + (i && i.radiusPlus || 0))), t.hasImage && (r = 0), t = {
                                x: Math.floor(t.plotX) - r,
                                y: t.plotY - r
                            }, r && (t.width = t.height = 2 * r), t
                        },
                        pointAttribs: function(t, e) {
                            var i = this.options.marker,
                                n = t && t.options,
                                r = n && n.marker || {},
                                s = this.color,
                                o = n && n.color,
                                a = t && t.color,
                                n = nB(r.lineWidth, i.lineWidth);
                            return t = t && t.zone && t.zone.color, s = o || t || a || s, t = r.fillColor || i.fillColor || s, s = r.lineColor || i.lineColor || s, e && (i = i.states[e], n = nB((e = r.states && r.states[e] || {}).lineWidth, i.lineWidth, n + nB(e.lineWidthPlus, i.lineWidthPlus, 0)), t = e.fillColor || i.fillColor || t, s = e.lineColor || i.lineColor || s), {
                                stroke: s,
                                "stroke-width": n,
                                fill: t
                            }
                        },
                        destroy: function() {
                            var t, e, i, n = this,
                                r = n.chart,
                                o = /AppleWebKit\/533/.test(nH.navigator.userAgent),
                                a = n.data || [];
                            for (nL(n, "destroy"), nz(n), nT(n.axisTypes || [], function(t) {
                                    (i = n[t]) && i.series && (nA(i.series, n), i.isDirty = i.forceRedraw = !0)
                                }), n.legendItem && n.chart.legend.destroyItem(n), t = a.length; t--;)(e = a[t]) && e.destroy && e.destroy();
                            n.points = null, clearTimeout(n.animationTimeout), nR(n, function(t, e) {
                                s._(t, nG) && !t.survive && t[o && "group" === e ? "hide" : "destroy"]()
                            }), r.hoverSeries === n && (r.hoverSeries = null), nA(r.series, n), r.orderSeries(), nR(n, function(t, e) {
                                delete n[e]
                            })
                        },
                        getGraphPath: function(t, e, i) {
                            var n, r, s = this,
                                o = s.options,
                                a = o.step,
                                l = [],
                                h = [];
                            return (n = (t = t || s.points).reversed) && t.reverse(), (a = ({
                                right: 1,
                                center: 2
                            })[a] || a && 3) && n && (a = 4 - a), !o.connectNulls || e || i || (t = this.getValidPoints(t)), nT(t, function(n, c) {
                                var d = n.plotX,
                                    u = n.plotY,
                                    p = t[c - 1];
                                (n.leftCliff || p && p.rightCliff) && !i && (r = !0), n.isNull && !nC(e) && 0 < c ? r = !o.connectNulls : n.isNull && !e ? r = !0 : (0 === c || r ? c = ["M", n.plotX, n.plotY] : s.getPointSpline ? c = s.getPointSpline(t, n, c) : a ? (c = 1 === a ? ["L", p.plotX, u] : 2 === a ? ["L", (p.plotX + d) / 2, p.plotY, "L", (p.plotX + d) / 2, u] : ["L", d, p.plotY]).push("L", d, u) : c = ["L", d, u], h.push(n.x), a && h.push(n.x), l.push.apply(l, c), r = !1)
                            }), l.xMap = h, s.graphPath = l
                        },
                        drawGraph: function() {
                            var t = this,
                                e = this.options,
                                i = (this.gappedPath || this.getGraphPath).call(this),
                                n = [
                                    ["graph", "highcharts-graph", e.lineColor || this.color, e.dashStyle]
                                ];
                            nT(this.zones, function(i, r) {
                                n.push(["zone-graph-" + r, "highcharts-graph highcharts-zone-graph-" + r + " " + (i.className || ""), i.color || t.color, i.dashStyle || e.dashStyle])
                            }), nT(n, function(n, r) {
                                var s = n[0],
                                    o = t[s];
                                o ? (o.endX = i.xMap, o.animate({
                                    d: i
                                })) : i.length && (t[s] = t.chart.renderer.path(i).addClass(n[1]).attr({
                                    zIndex: 1
                                }).add(t.group), o = {
                                    stroke: n[2],
                                    "stroke-width": e.lineWidth,
                                    fill: t.fillGraph && t.color || "none"
                                }, n[3] ? o.dashstyle = n[3] : "square" !== e.linecap && (o["stroke-linecap"] = o["stroke-linejoin"] = "round"), o = t[s].attr(o).shadow(2 > r && e.shadow)), o && (o.startX = i.xMap, o.isArea = i.isArea)
                            })
                        },
                        applyZones: function() {
                            var t, e, i, n, r, s, o, a, l, h = this,
                                c = this.chart,
                                d = c.renderer,
                                u = this.zones,
                                p = this.clips || [],
                                f = this.graph,
                                g = this.area,
                                m = Math.max(c.chartWidth, c.chartHeight),
                                v = this[(this.zoneAxis || "y") + "Axis"],
                                y = c.inverted,
                                x = !1;
                            u.length && (f || g) && v && void 0 !== v.min && (r = v.reversed, s = v.horiz, f && f.hide(), g && g.hide(), n = v.getExtremes(), nT(u, function(u, b) {
                                t = r ? s ? c.plotWidth : 0 : s ? 0 : v.toPixels(n.min), t = Math.min(Math.max(nB(e, t), 0), m), e = Math.min(Math.max(Math.round(v.toPixels(nB(u.value, n.max), !0)), 0), m), x && (t = e = v.toPixels(n.max)), o = Math.abs(t - e), a = Math.min(t, e), l = Math.max(t, e), v.isXAxis ? (i = {
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
                                    y: r ? a : l,
                                    height: i.width,
                                    width: c.chartWidth
                                } : {
                                    x: i.y - c.plotLeft - c.spacingBox.x,
                                    y: 0,
                                    width: i.height,
                                    height: c.chartHeight
                                }), p[b] ? p[b].animate(i) : (p[b] = d.clipRect(i), f && h["zone-graph-" + b].clip(p[b]), g && h["zone-area-" + b].clip(p[b])), x = u.value > n.max
                            }), this.clips = p)
                        },
                        invertGroups: function(t) {
                            function e() {
                                nT(["group", "markerGroup"], function(e) {
                                    n[e] && (r.renderer.isVML && n[e].attr({
                                        width: n.yAxis.len,
                                        height: n.xAxis.len
                                    }), n[e].width = n.yAxis.len, n[e].height = n.xAxis.len, n[e].invert(t))
                                })
                            }
                            var i, n = this,
                                r = n.chart;
                            n.xAxis && (i = nv(r, "resize", e), nv(n, "destroy", i), e(t), n.invertGroups = e)
                        },
                        plotGroup: function(t, e, i, n, r) {
                            var s = this[t],
                                o = !s;
                            return o && (this[t] = s = this.chart.renderer.g().attr({
                                zIndex: n || .1
                            }).add(r)), s.addClass("highcharts-" + e + " highcharts-series-" + this.index + " highcharts-" + this.type + "-series highcharts-color-" + this.colorIndex + " " + (this.options.className || ""), !0), s.attr({
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
                                n = e.options,
                                r = !!e.animate && i.renderer.isSVG && ny(n.animation).duration,
                                s = e.visible ? "inherit" : "hidden",
                                o = n.zIndex,
                                a = e.hasRendered,
                                l = i.seriesGroup,
                                h = i.inverted;
                            t = e.plotGroup("group", "series", s, o, l), e.markerGroup = e.plotGroup("markerGroup", "markers", s, o, l), r && e.animate(!0), t.inverted = !!e.isCartesian && h, e.drawGraph && (e.drawGraph(), e.applyZones()), e.drawDataLabels && e.drawDataLabels(), e.visible && e.drawPoints(), e.drawTracker && !1 !== e.options.enableMouseTracking && e.drawTracker(), e.invertGroups(h), !1 === n.clip || e.sharedClipKey || a || t.clip(i.clipRect), r && e.animate(), a || (e.animationTimeout = nW(function() {
                                e.afterAnimate()
                            }, r)), e.isDirty = !1, e.hasRendered = !0
                        },
                        redraw: function() {
                            var t = this.chart,
                                e = this.isDirty || this.isDirtyData,
                                i = this.group,
                                n = this.xAxis,
                                r = this.yAxis;
                            i && (t.inverted && i.attr({
                                width: t.plotWidth,
                                height: t.plotHeight
                            }), i.animate({
                                translateX: nB(n && n.left, t.plotLeft),
                                translateY: nB(r && r.top, t.plotTop)
                            })), this.translate(), this.render(), e && delete this.kdTree
                        },
                        kdAxisArray: ["clientX", "plotY"],
                        searchPoint: function(t, e) {
                            var i = this.xAxis,
                                n = this.yAxis,
                                r = this.chart.inverted;
                            return this.searchKDTree({
                                clientX: r ? i.len - t.chartY + i.pos : t.chartX - i.pos,
                                plotY: r ? n.len - t.chartX + n.pos : t.chartY - n.pos
                            }, e)
                        },
                        buildKDTree: function() {
                            this.buildingKdTree = !0;
                            var t = this,
                                e = -1 < t.options.findNearestPointBy.indexOf("y") ? 2 : 1;
                            delete t.kdTree, nW(function() {
                                t.kdTree = function e(i, n, r) {
                                    var s, o;
                                    if (o = i && i.length) return s = t.kdAxisArray[n % r], i.sort(function(t, e) {
                                        return t[s] - e[s]
                                    }), {
                                        point: i[o = Math.floor(o / 2)],
                                        left: e(i.slice(0, o), n + 1, r),
                                        right: e(i.slice(o + 1), n + 1, r)
                                    }
                                }(t.getValidPoints(null, !t.directTouch), e, e), t.buildingKdTree = !1
                            }, +!t.options.kdNow)
                        },
                        searchKDTree: function(t, e) {
                            var i = this,
                                n = this.kdAxisArray[0],
                                r = this.kdAxisArray[1],
                                s = e ? "distX" : "dist";
                            if (e = -1 < i.options.findNearestPointBy.indexOf("y") ? 2 : 1, this.kdTree || this.buildingKdTree || this.buildKDTree(), this.kdTree) return function t(e, o, a, l) {
                                var h, c, d = o.point,
                                    u = i.kdAxisArray[a % l],
                                    p = d;
                                return h = ((c = nC(e[n]) && nC(d[n]) ? Math.pow(e[n] - d[n], 2) : null) || 0) + ((h = nC(e[r]) && nC(d[r]) ? Math.pow(e[r] - d[r], 2) : null) || 0), d.dist = nC(h) ? Math.sqrt(h) : Number.MAX_VALUE, d.distX = nC(c) ? Math.sqrt(c) : Number.MAX_VALUE, h = 0 > (u = e[u] - d[u]) ? "left" : "right", c = 0 > u ? "right" : "left", o[h] && (p = (h = t(e, o[h], a + 1, l))[s] < p[s] ? h : d), o[c] && Math.sqrt(u * u) < p[s] && (p = (e = t(e, o[c], a + 1, l))[s] < p[s] ? e : p), p
                            }(t, this.kdTree, e, e)
                        }
                    }), nX = (nF = t).Axis, nY = nF.Chart, nV = nF.correctFloat, nU = nF.defined, n_ = nF.destroyObjectProperties, nK = nF.each, nq = nF.format, nZ = nF.objectEach, n$ = nF.pick, nJ = nF.Series, nF.StackItem = function(t, e, i, n, r) {
                        var s = t.chart.inverted;
                        this.axis = t, this.isNegative = i, this.options = e, this.x = n, this.total = null, this.points = {}, this.stack = r, this.rightCliff = this.leftCliff = 0, this.alignOptions = {
                            align: e.align || (s ? i ? "left" : "right" : "center"),
                            verticalAlign: e.verticalAlign || (s ? "middle" : i ? "bottom" : "top"),
                            y: n$(e.y, s ? 4 : i ? 14 : -6),
                            x: n$(e.x, s ? i ? -6 : 6 : 0)
                        }, this.textAlign = e.textAlign || (s ? i ? "right" : "left" : "center")
                    }, nF.StackItem.prototype = {
                        destroy: function() {
                            n_(this, this.axis)
                        },
                        render: function(t) {
                            var e = this.options,
                                i = e.format,
                                i = i ? nq(i, this) : e.formatter.call(this);
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
                                n = i.chart,
                                r = i.translate(i.usePercentage ? 100 : this.total, 0, 0, 0, 1),
                                i = i.translate(0),
                                i = Math.abs(r - i);
                            t = n.xAxis[0].translate(this.x) + t, r = this.getStackBox(n, this, t, r, e, i), (e = this.label) && (e.align(this.alignOptions, null, r), r = e.alignAttr, e[!1 === this.options.crop || n.isInsidePlot(r.x, r.y) ? "show" : "hide"](!0))
                        },
                        getStackBox: function(t, e, i, n, r, s) {
                            var o = e.axis.reversed,
                                a = t.inverted;
                            return t = t.plotHeight, e = e.isNegative && !o || !e.isNegative && o, {
                                x: a ? e ? n : n - s : i,
                                y: a ? t - i - r : e ? t - n - s : t - n,
                                width: a ? s : r,
                                height: a ? r : s
                            }
                        }
                    }, nY.prototype.getStacks = function() {
                        var t = this;
                        nK(t.yAxis, function(t) {
                            t.stacks && t.hasVisibleSeries && (t.oldStacks = t.stacks)
                        }), nK(t.series, function(e) {
                            e.options.stacking && (!0 === e.visible || !1 === t.options.chart.ignoreHiddenSeries) && (e.stackKey = e.type + n$(e.options.stack, ""))
                        })
                    }, nX.prototype.buildStacks = function() {
                        var t, e = this.series,
                            i = n$(this.options.reversedStacks, !0),
                            n = e.length;
                        if (!this.isXAxis) {
                            for (this.usePercentage = !1, t = n; t--;) e[i ? t : n - t - 1].setStackedPoints();
                            if (this.usePercentage)
                                for (t = 0; t < n; t++) e[t].setPercentStacks()
                        }
                    }, nX.prototype.renderStackTotals = function() {
                        var t = this.chart,
                            e = t.renderer,
                            i = this.stacks,
                            n = this.stackTotalGroup;
                        n || (this.stackTotalGroup = n = e.g("stack-labels").attr({
                            visibility: "visible",
                            zIndex: 6
                        }).add()), n.translate(t.plotLeft, t.plotTop), nZ(i, function(t) {
                            nZ(t, function(t) {
                                t.render(n)
                            })
                        })
                    }, nX.prototype.resetStacks = function() {
                        var t = this,
                            e = t.stacks;
                        t.isXAxis || nZ(e, function(e) {
                            nZ(e, function(i, n) {
                                i.touched < t.stacksTouched ? (i.destroy(), delete e[n]) : (i.total = null, i.cum = null)
                            })
                        })
                    }, nX.prototype.cleanStacks = function() {
                        var t;
                        this.isXAxis || (this.oldStacks && (t = this.stacks = this.oldStacks), nZ(t, function(t) {
                            nZ(t, function(t) {
                                t.cum = t.total
                            })
                        }))
                    }, nJ.prototype.setStackedPoints = function() {
                        if (this.options.stacking && (!0 === this.visible || !1 === this.chart.options.chart.ignoreHiddenSeries)) {
                            var t, e, i, n, r, s, o, a = this.processedXData,
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
                                x = y.stacks,
                                b = y.oldStacks;
                            for (y.stacksTouched += 1, r = 0; r < c; r++) s = a[r], o = l[r], n = (t = this.getStackIndicator(t, s, this.index)).key, x[i = (e = v && o < (p ? 0 : u)) ? m : g] || (x[i] = {}), x[i][s] || (b[i] && b[i][s] ? (x[i][s] = b[i][s], x[i][s].total = null) : x[i][s] = new nF.StackItem(y, y.options.stackLabels, e, s, f)), i = x[i][s], null !== o && (i.points[n] = i.points[this.index] = [n$(i.cum, p)], nU(i.cum) || (i.base = n), i.touched = y.stacksTouched, 0 < t.index && !1 === this.singleStacks && (i.points[n][0] = i.points[this.index + "," + s + ",0"][0])), "percent" === d ? (e = e ? g : m, v && x[e] && x[e][s] ? (e = x[e][s], i.total = e.total = Math.max(e.total, i.total) + Math.abs(o) || 0) : i.total = nV(i.total + (Math.abs(o) || 0))) : i.total = nV(i.total + (o || 0)), i.cum = n$(i.cum, p) + (o || 0), null !== o && (i.points[n].push(i.cum), h[r] = i.cum);
                            "percent" === d && (y.usePercentage = !0), this.stackedYData = h, y.oldStacks = {}
                        }
                    }, nJ.prototype.setPercentStacks = function() {
                        var t, e = this,
                            i = e.stackKey,
                            n = e.yAxis.stacks,
                            r = e.processedXData;
                        nK([i, "-" + i], function(i) {
                            for (var s, o, a = r.length; a--;) s = r[a], t = e.getStackIndicator(t, s, e.index, i), (s = (o = n[i] && n[i][s]) && o.points[t.key]) && (o = o.total ? 100 / o.total : 0, s[0] = nV(s[0] * o), s[1] = nV(s[1] * o), e.stackedYData[a] = s[1])
                        })
                    }, nJ.prototype.getStackIndicator = function(t, e, i, n) {
                        return !nU(t) || t.x !== e || n && t.key !== n ? t = {
                            x: e,
                            index: 0,
                            key: n
                        } : t.index++, t.key = [i, e, t.index].join(), t
                    }, n0 = (nQ = t).addEvent, n1 = nQ.animate, n2 = nQ.Axis, n3 = nQ.createElement, n5 = nQ.css, n9 = nQ.defined, n6 = nQ.each, n4 = nQ.erase, n8 = nQ.extend, n7 = nQ.fireEvent, rt = nQ.inArray, re = nQ.isNumber, ri = nQ.isObject, rn = nQ.isArray, rr = nQ.merge, rs = nQ.objectEach, ro = nQ.pick, ra = nQ.Point, rl = nQ.Series, rh = nQ.seriesTypes, rc = nQ.setAnimation, rd = nQ.splat, n8(nQ.Chart.prototype, {
                        addSeries: function(t, e, i) {
                            var n, r = this;
                            return t && (e = ro(e, !0), n7(r, "addSeries", {
                                options: t
                            }, function() {
                                n = r.initSeries(t), r.isDirtyLegend = !0, r.linkSeries(), e && r.redraw(i)
                            })), n
                        },
                        addAxis: function(t, e, i, n) {
                            var r = e ? "xAxis" : "yAxis",
                                s = this.options;
                            return e = new n2(this, t = rr(t, {
                                index: this[r].length,
                                isX: e
                            })), s[r] = rd(s[r] || {}), s[r].push(t), ro(i, !0) && this.redraw(n), e
                        },
                        showLoading: function(t) {
                            var e = this,
                                i = e.options,
                                n = e.loadingDiv,
                                r = i.loading,
                                s = function() {
                                    n && n5(n, {
                                        left: e.plotLeft + "px",
                                        top: e.plotTop + "px",
                                        width: e.plotWidth + "px",
                                        height: e.plotHeight + "px"
                                    })
                                };
                            n || (e.loadingDiv = n = n3("div", {
                                className: "highcharts-loading highcharts-loading-hidden"
                            }, null, e.container), e.loadingSpan = n3("span", {
                                className: "highcharts-loading-inner"
                            }, null, n), n0(e, "redraw", s)), n.className = "highcharts-loading", e.loadingSpan.innerHTML = t || i.lang.loading, n5(n, n8(r.style, {
                                zIndex: 10
                            })), n5(e.loadingSpan, r.labelStyle), e.loadingShown || (n5(n, {
                                opacity: 0,
                                display: ""
                            }), n1(n, {
                                opacity: r.style.opacity || .5
                            }, {
                                duration: r.showDuration || 0
                            })), e.loadingShown = !0, s()
                        },
                        hideLoading: function() {
                            var t = this.options,
                                e = this.loadingDiv;
                            e && (e.className = "highcharts-loading highcharts-loading-hidden", n1(e, {
                                opacity: 0
                            }, {
                                duration: t.loading.hideDuration || 100,
                                complete: function() {
                                    n5(e, {
                                        display: "none"
                                    })
                                }
                            })), this.loadingShown = !1
                        },
                        propsRequireDirtyBox: "backgroundColor borderColor borderWidth margin marginTop marginRight marginBottom marginLeft spacing spacingTop spacingRight spacingBottom spacingLeft borderRadius plotBackgroundColor plotBackgroundImage plotBorderColor plotBorderWidth plotShadow shadow".split(" "),
                        propsRequireUpdateSeries: "chart.inverted chart.polar chart.ignoreHiddenSeries chart.type colors plotOptions tooltip".split(" "),
                        update: function(t, e, i) {
                            var n, r, s = this,
                                o = {
                                    credits: "addCredits",
                                    title: "setTitle",
                                    subtitle: "setSubtitle"
                                },
                                a = t.chart,
                                l = [];
                            a && (rr(!0, s.options.chart, a), "className" in a && s.setClassName(a.className), ("inverted" in a || "polar" in a) && (s.propFromSeries(), n = !0), "alignTicks" in a && (n = !0), rs(a, function(t, e) {
                                -1 !== rt("chart." + e, s.propsRequireUpdateSeries) && (r = !0), -1 !== rt(e, s.propsRequireDirtyBox) && (s.isDirtyBox = !0)
                            }), "style" in a && s.renderer.setStyle(a.style)), t.colors && (this.options.colors = t.colors), t.plotOptions && rr(!0, this.options.plotOptions, t.plotOptions), rs(t, function(t, e) {
                                s[e] && "function" == typeof s[e].update ? s[e].update(t, !1) : "function" == typeof s[o[e]] && s[o[e]](t), "chart" !== e && -1 !== rt(e, s.propsRequireUpdateSeries) && (r = !0)
                            }), n6("xAxis yAxis zAxis series colorAxis pane".split(" "), function(e) {
                                t[e] && (n6(rd(t[e]), function(t, n) {
                                    (n = n9(t.id) && s.get(t.id) || s[e][n]) && n.coll === e && (n.update(t, !1), i && (n.touched = !0)), !n && i && ("series" === e ? s.addSeries(t, !1).touched = !0 : ("xAxis" === e || "yAxis" === e) && (s.addAxis(t, "xAxis" === e, !1).touched = !0))
                                }), i && n6(s[e], function(t) {
                                    t.touched ? delete t.touched : l.push(t)
                                }))
                            }), n6(l, function(t) {
                                t.remove(!1)
                            }), n && n6(s.axes, function(t) {
                                t.update({}, !1)
                            }), r && n6(s.series, function(t) {
                                t.update({}, !1)
                            }), t.loading && rr(!0, s.options.loading, t.loading), n = a && a.width, a = a && a.height, re(n) && n !== s.chartWidth || re(a) && a !== s.chartHeight ? s.setSize(n, a) : ro(e, !0) && s.redraw()
                        },
                        setSubtitle: function(t) {
                            this.setTitle(void 0, t)
                        }
                    }), n8(ra.prototype, {
                        update: function(t, e, i, n) {
                            function r() {
                                o.applyOptions(t), null === o.y && l && (o.graphic = l.destroy()), ri(t, !0) && (l && l.element && t && t.marker && void 0 !== t.marker.symbol && (o.graphic = l.destroy()), t && t.dataLabels && o.dataLabel && (o.dataLabel = o.dataLabel.destroy())), s = o.index, a.updateParallelArrays(o, s), c.data[s] = ri(c.data[s], !0) || ri(t, !0) ? o.options : t, a.isDirty = a.isDirtyData = !0, !a.fixedBox && a.hasCartesianSeries && (h.isDirtyBox = !0), "point" === c.legendType && (h.isDirtyLegend = !0), e && h.redraw(i)
                            }
                            var s, o = this,
                                a = o.series,
                                l = o.graphic,
                                h = a.chart,
                                c = a.options;
                            e = ro(e, !0), !1 === n ? r() : o.firePointEvent("update", {
                                options: t
                            }, r)
                        },
                        remove: function(t, e) {
                            this.series.removePoint(rt(this, this.series.data), t, e)
                        }
                    }), n8(rl.prototype, {
                        addPoint: function(t, e, i, n) {
                            var r, s, o, a, l = this.options,
                                h = this.data,
                                c = this.chart,
                                d = this.xAxis,
                                d = d && d.hasNames && d.names,
                                u = l.data,
                                p = this.xData;
                            if (e = ro(e, !0), r = {
                                    series: this
                                }, this.pointClass.prototype.applyOptions.apply(r, [t]), a = r.x, o = p.length, this.requireSorting && a < p[o - 1])
                                for (s = !0; o && p[o - 1] > a;) o--;
                            this.updateParallelArrays(r, "splice", o, 0, 0), this.updateParallelArrays(r, o), d && r.name && (d[a] = r.name), u.splice(o, 0, t), s && (this.data.splice(o, 0, null), this.processData()), "point" === l.legendType && this.generatePoints(), i && (h[0] && h[0].remove ? h[0].remove(!1) : (h.shift(), this.updateParallelArrays(r, "shift"), u.shift())), this.isDirtyData = this.isDirty = !0, e && c.redraw(n)
                        },
                        removePoint: function(t, e, i) {
                            var n = this,
                                r = n.data,
                                s = r[t],
                                o = n.points,
                                a = n.chart,
                                l = function() {
                                    o && o.length === r.length && o.splice(t, 1), r.splice(t, 1), n.options.data.splice(t, 1), n.updateParallelArrays(s || {
                                        series: n
                                    }, "splice", t, 1), s && s.destroy(), n.isDirty = !0, n.isDirtyData = !0, e && a.redraw()
                                };
                            rc(i, a), e = ro(e, !0), s ? s.firePointEvent("remove", null, l) : l()
                        },
                        remove: function(t, e, i) {
                            function n() {
                                r.destroy(), s.isDirtyLegend = s.isDirtyBox = !0, s.linkSeries(), ro(t, !0) && s.redraw(e)
                            }
                            var r = this,
                                s = r.chart;
                            !1 !== i ? n7(r, "remove", null, n) : n()
                        },
                        update: function(t, e) {
                            var i, n = this,
                                r = n.chart,
                                s = n.userOptions,
                                o = n.oldType || n.type,
                                a = t.type || s.type || r.options.chart.type,
                                l = rh[o].prototype,
                                h = ["group", "markerGroup", "dataLabelsGroup", "navigatorSeries", "baseSeries"],
                                c = n.finishedAnimating && {
                                    animation: !1
                                };
                            if (Object.keys && "data" === Object.keys(t).toString()) return this.setData(t.data, e);
                            for (i in (a && a !== o || void 0 !== t.zIndex) && (h.length = 0), n6(h, function(t) {
                                    h[t] = n[t], delete n[t]
                                }), t = rr(s, c, {
                                    index: n.index,
                                    pointStart: n.xData[0]
                                }, {
                                    data: n.options.data
                                }, t), n.remove(!1, null, !1), l) n[i] = void 0;
                            n8(n, rh[a || o].prototype), n6(h, function(t) {
                                n[t] = h[t]
                            }), n.init(r, t), n.oldType = o, r.linkSeries(), ro(e, !0) && r.redraw(!1)
                        }
                    }), n8(n2.prototype, {
                        update: function(t, e) {
                            var i = this.chart;
                            t = i.options[this.coll][this.options.index] = rr(this.userOptions, t), this.destroy(!0), this.init(i, n8(t, {
                                events: void 0
                            })), i.isDirtyBox = !0, ro(e, !0) && i.redraw()
                        },
                        remove: function(t) {
                            for (var e = this.chart, i = this.coll, n = this.series, r = n.length; r--;) n[r] && n[r].remove(!1);
                            n4(e.axes, this), n4(e[i], this), rn(e.options[i]) ? e.options[i].splice(this.options.index, 1) : delete e.options[i], n6(e[i], function(t, e) {
                                t.options.index = e
                            }), this.destroy(), e.isDirtyBox = !0, ro(t, !0) && e.redraw()
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
                    }), rp = (ru = t).color, rf = ru.each, rg = ru.map, rm = ru.pick, rv = ru.Series, (0, ru.seriesType)("area", "line", {
                        softThreshold: !1,
                        threshold: 0
                    }, {
                        singleStacks: !1,
                        getStackPoints: function(t) {
                            var e, i, n = [],
                                r = [],
                                s = this.xAxis,
                                o = this.yAxis,
                                a = o.stacks[this.stackKey],
                                l = {},
                                h = this.index,
                                c = o.series,
                                d = c.length,
                                u = rm(o.options.reversedStacks, !0) ? 1 : -1;
                            if (t = t || this.points, this.options.stacking) {
                                for (i = 0; i < t.length; i++) l[t[i].x] = t[i];
                                ru.objectEach(a, function(t, e) {
                                    null !== t.total && r.push(e)
                                }), r.sort(function(t, e) {
                                    return t - e
                                }), e = rg(c, function() {
                                    return this.visible
                                }), rf(r, function(t, c) {
                                    var p, f, g = 0;
                                    if (l[t] && !l[t].isNull) n.push(l[t]), rf([-1, 1], function(n) {
                                        var s = 1 === n ? "rightNull" : "leftNull",
                                            o = 0,
                                            g = a[r[c + n]];
                                        if (g)
                                            for (i = h; 0 <= i && i < d;)(p = g.points[i]) || (i === h ? l[t][s] = !0 : e[i] && (f = a[t].points[i]) && (o -= f[1] - f[0])), i += u;
                                        l[t][1 === n ? "rightCliff" : "leftCliff"] = o
                                    });
                                    else {
                                        for (i = h; 0 <= i && i < d;) {
                                            if (p = a[t].points[i]) {
                                                g = p[1];
                                                break
                                            }
                                            i += u
                                        }
                                        g = o.translate(g, 0, 1, 0, 1), n.push({
                                            isNull: !0,
                                            plotX: s.translate(t, 0, 0, 0, 1),
                                            x: t,
                                            plotY: g,
                                            yBottom: g
                                        })
                                    }
                                })
                            }
                            return n
                        },
                        getGraphPath: function(t) {
                            var e, i, n, r, s = rv.prototype.getGraphPath,
                                o = this.options,
                                a = o.stacking,
                                l = this.yAxis,
                                h = [],
                                c = [],
                                d = this.index,
                                u = l.stacks[this.stackKey],
                                p = o.threshold,
                                f = l.getThreshold(o.threshold),
                                o = o.connectNulls || "percent" === a,
                                g = function(e, i, r) {
                                    var s = t[e];
                                    e = a && u[s.x].points[d];
                                    var o = s[r + "Null"] || 0;
                                    r = s[r + "Cliff"] || 0;
                                    var g, m, s = !0;
                                    r || o ? (g = (o ? e[0] : e[1]) + r, m = e[0] + r, s = !!o) : !a && t[i] && t[i].isNull && (g = m = p), void 0 !== g && (c.push({
                                        plotX: n,
                                        plotY: null === g ? f : l.getThreshold(g),
                                        isNull: s,
                                        isCliff: !0
                                    }), h.push({
                                        plotX: n,
                                        plotY: null === m ? f : l.getThreshold(m),
                                        doCurve: !1
                                    }))
                                };
                            for (t = t || this.points, a && (t = this.getStackPoints(t)), e = 0; e < t.length; e++) i = t[e].isNull, n = rm(t[e].rectPlotX, t[e].plotX), r = rm(t[e].yBottom, f), (!i || o) && (o || g(e, e - 1, "left"), i && !a && o || (c.push(t[e]), h.push({
                                x: e,
                                plotX: n,
                                plotY: r
                            })), o || g(e, e + 1, "right"));
                            return e = s.call(this, c, !0, !0), h.reversed = !0, (i = s.call(this, h, !0, !0)).length && (i[0] = "L"), i = e.concat(i), s = s.call(this, c, !1, o), i.xMap = e.xMap, this.areaPath = i, s
                        },
                        drawGraph: function() {
                            this.areaPath = [], rv.prototype.drawGraph.apply(this);
                            var t = this,
                                e = this.areaPath,
                                i = this.options,
                                n = [
                                    ["area", "highcharts-area", this.color, i.fillColor]
                                ];
                            rf(this.zones, function(e, r) {
                                n.push(["zone-area-" + r, "highcharts-area highcharts-zone-area-" + r + " " + e.className, e.color || t.color, e.fillColor || i.fillColor])
                            }), rf(n, function(n) {
                                var r = n[0],
                                    s = t[r];
                                s ? (s.endX = e.xMap, s.animate({
                                    d: e
                                })) : (s = t[r] = t.chart.renderer.path(e).addClass(n[1]).attr({
                                    fill: rm(n[3], rp(n[2]).setOpacity(rm(i.fillOpacity, .75)).get()),
                                    zIndex: 0
                                }).add(t.group)).isArea = !0, s.startX = e.xMap, s.shiftUnit = i.step ? 2 : 1
                            })
                        },
                        drawLegendSymbol: ru.LegendSymbolMixin.drawRectangle
                    }), rx = (ry = t).pick, (ry = ry.seriesType)("spline", "line", {}, {
                        getPointSpline: function(t, e, i) {
                            var n, r, s, o, a = e.plotX,
                                l = e.plotY,
                                h = t[i - 1];
                            if (i = t[i + 1], h && !h.isNull && !1 !== h.doCurve && !e.isCliff && i && !i.isNull && !1 !== i.doCurve && !e.isCliff) {
                                t = h.plotY, s = i.plotX, i = i.plotY;
                                var c = 0;
                                n = (1.5 * a + h.plotX) / 2.5, r = (1.5 * l + t) / 2.5, s = (1.5 * a + s) / 2.5, o = (1.5 * l + i) / 2.5, s !== n && (c = (o - r) * (s - a) / (s - n) + l - o), r += c, o += c, r > t && r > l ? (r = Math.max(t, l), o = 2 * l - r) : r < t && r < l && (r = Math.min(t, l), o = 2 * l - r), o > i && o > l ? (o = Math.max(i, l), r = 2 * l - o) : o < i && o < l && (o = Math.min(i, l), r = 2 * l - o), e.rightContX = s, e.rightContY = o
                            }
                            return e = ["C", rx(h.rightContX, h.plotX), rx(h.rightContY, h.plotY), rx(n, a), rx(r, l), a, l], h.rightContX = h.rightContY = null, e
                        }
                    }), rw = (rb = t).seriesTypes.area.prototype, (0, rb.seriesType)("areaspline", "spline", rb.defaultPlotOptions.area, {
                        getStackPoints: rw.getStackPoints,
                        getGraphPath: rw.getGraphPath,
                        drawGraph: rw.drawGraph,
                        drawLegendSymbol: rb.LegendSymbolMixin.drawRectangle
                    }), rS = (rk = t).animObject, rM = rk.color, rC = rk.each, rT = rk.extend, rA = rk.isNumber, rP = rk.merge, rL = rk.pick, rI = rk.Series, rO = rk.seriesType, rD = rk.svg, rO("column", "line", {
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
                            rI.prototype.init.apply(this, arguments);
                            var t = this,
                                e = t.chart;
                            e.hasRendered && rC(e.series, function(e) {
                                e.type === t.type && (e.isDirty = !0)
                            })
                        },
                        getColumnMetrics: function() {
                            var t, e = this,
                                i = e.options,
                                n = e.xAxis,
                                r = e.yAxis,
                                s = n.reversed,
                                o = {},
                                a = 0;
                            !1 === i.grouping ? a = 1 : rC(e.chart.series, function(i) {
                                var n, s = i.options,
                                    l = i.yAxis;
                                i.type !== e.type || !i.visible && e.chart.options.chart.ignoreHiddenSeries || r.len !== l.len || r.pos !== l.pos || (s.stacking ? (void 0 === o[t = i.stackKey] && (o[t] = a++), n = o[t]) : !1 !== s.grouping && (n = a++), i.columnIndex = n)
                            });
                            var l = Math.min(Math.abs(n.transA) * (n.ordinalSlope || i.pointRange || n.closestPointRange || n.tickInterval || 1), n.len),
                                h = l * i.groupPadding,
                                c = (l - 2 * h) / (a || 1),
                                i = Math.min(i.maxPointWidth || n.len, rL(i.pointWidth, c * (1 - 2 * i.pointPadding)));
                            return e.columnMetrics = {
                                width: i,
                                offset: (c - i) / 2 + (h + ((e.columnIndex || 0) + +!!s) * c - l / 2) * (s ? -1 : 1)
                            }, e.columnMetrics
                        },
                        crispCol: function(t, e, i, n) {
                            var r = this.chart,
                                s = this.borderWidth,
                                o = -(s % 2 ? .5 : 0),
                                s = s % 2 ? .5 : 1;
                            return r.inverted && r.renderer.isVML && (s += 1), this.options.crisp && (i = Math.round(t + i) + o - (t = Math.round(t) + o)), n = Math.round(e + n) + s, o = .5 >= Math.abs(e) && .5 < n, n -= e = Math.round(e) + s, o && n && (--e, n += 1), {
                                x: t,
                                y: e,
                                width: i,
                                height: n
                            }
                        },
                        translate: function() {
                            var t = this,
                                e = t.chart,
                                i = t.options,
                                n = t.dense = 2 > t.closestPointRange * t.xAxis.transA,
                                n = t.borderWidth = rL(i.borderWidth, +!n),
                                r = t.yAxis,
                                s = t.translatedThreshold = r.getThreshold(i.threshold),
                                o = rL(i.minPointLength, 5),
                                a = t.getColumnMetrics(),
                                l = a.width,
                                h = t.barW = Math.max(l, 1 + 2 * n),
                                c = t.pointXOffset = a.offset;
                            e.inverted && (s -= .5), i.pointPadding && (h = Math.ceil(h)), rI.prototype.translate.apply(t), rC(t.points, function(i) {
                                var n, a = rL(i.yBottom, s),
                                    d = 999 + Math.abs(a),
                                    d = Math.min(Math.max(-d, i.plotY), r.len + d),
                                    u = i.plotX + c,
                                    p = h,
                                    f = Math.min(d, a),
                                    g = Math.max(d, a) - f;
                                Math.abs(g) < o && o && (g = o, n = !r.reversed && !i.negative || r.reversed && i.negative, f = Math.abs(f - s) > o ? a - o : s - (n ? o : 0)), i.barX = u, i.pointWidth = l, i.tooltipPos = e.inverted ? [r.len + r.pos - e.plotLeft - d, t.xAxis.len - u - p / 2, g] : [u + p / 2, d + r.pos - e.plotTop, g], i.shapeType = "rect", i.shapeArgs = t.crispCol.apply(t, i.isNull ? [u, s, p, 0] : [u, f, p, g])
                            })
                        },
                        getSymbol: rk.noop,
                        drawLegendSymbol: rk.LegendSymbolMixin.drawRectangle,
                        drawGraph: function() {
                            this.group[this.dense ? "addClass" : "removeClass"]("highcharts-dense-data")
                        },
                        pointAttribs: function(t, e) {
                            var i, n = this.options,
                                r = this.pointAttrToOptions || {};
                            i = r.stroke || "borderColor";
                            var s = r["stroke-width"] || "borderWidth",
                                o = t && t.color || this.color,
                                a = t[i] || n[i] || this.color || o,
                                l = t[s] || n[s] || this[s] || 0,
                                r = n.dashStyle;
                            return t && this.zones.length && (o = t.getZone(), o = t.options.color || o && o.color || this.color), e && (e = (t = rP(n.states[e], t.options.states && t.options.states[e] || {})).brightness, o = t.color || void 0 !== e && rM(o).brighten(t.brightness).get() || o, a = t[i] || a, l = t[s] || l, r = t.dashStyle || r), i = {
                                fill: o,
                                stroke: a,
                                "stroke-width": l
                            }, r && (i.dashstyle = r), i
                        },
                        drawPoints: function() {
                            var t, e = this,
                                i = this.chart,
                                n = e.options,
                                r = i.renderer,
                                s = n.animationLimit || 250;
                            rC(e.points, function(o) {
                                var a = o.graphic;
                                rA(o.plotY) && null !== o.y ? (t = o.shapeArgs, a ? a[i.pointCount < s ? "animate" : "attr"](rP(t)) : o.graphic = a = r[o.shapeType](t).add(o.group || e.group), n.borderRadius && a.attr({
                                    r: n.borderRadius
                                }), a.attr(e.pointAttribs(o, o.selected && "select")).shadow(n.shadow, null, n.stacking && !n.borderRadius), a.addClass(o.getClassName(), !0)) : a && (o.graphic = a.destroy())
                            })
                        },
                        animate: function(t) {
                            var e = this,
                                i = this.yAxis,
                                n = e.options,
                                r = this.chart.inverted,
                                s = {};
                            rD && (t ? (s.scaleY = .001, t = Math.min(i.pos + i.len, Math.max(i.pos, i.toPixels(n.threshold))), r ? s.translateX = t - i.len : s.translateY = t, e.group.attr(s)) : (s[r ? "translateX" : "translateY"] = i.pos, e.group.animate(s, rT(rS(e.options.animation), {
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
                            e.hasRendered && rC(e.series, function(e) {
                                e.type === t.type && (e.isDirty = !0)
                            }), rI.prototype.remove.apply(t, arguments)
                        }
                    }), (0, t.seriesType)("bar", "column", null, {
                        inverted: !0
                    }), rN = (rE = t).Series, (rE = rE.seriesType)("scatter", "line", {
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
                            this.options.lineWidth && rN.prototype.drawGraph.call(this)
                        }
                    }), rB = (rR = t).pick, rz = rR.relativeLength, rR.CenteredSeriesMixin = {
                        getCenter: function() {
                            var t, e, i = this.options,
                                n = this.chart,
                                r = 2 * (i.slicedOffset || 0),
                                s = n.plotWidth - 2 * r,
                                n = n.plotHeight - 2 * r,
                                o = i.center,
                                o = [rB(o[0], "50%"), rB(o[1], "50%"), i.size || "100%", i.innerSize || 0],
                                a = Math.min(s, n);
                            for (t = 0; 4 > t; ++t) e = o[t], i = 2 > t || 2 === t && /%$/.test(e), o[t] = rz(e, [s, n, a, o[2]][t]) + (i ? r : 0);
                            return o[3] > o[2] && (o[3] = o[2]), o
                        }
                    }, rG = (rj = t).addEvent, rW = rj.defined, rH = rj.each, rF = rj.extend, rX = rj.inArray, rY = rj.noop, rV = rj.pick, rU = rj.Point, r_ = rj.Series, rK = rj.seriesType, rq = rj.setAnimation, rK("pie", "line", {
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
                        pointAttribs: rj.seriesTypes.column.prototype.pointAttribs,
                        animate: function(t) {
                            var e = this,
                                i = e.points,
                                n = e.startAngleRad;
                            t || (rH(i, function(t) {
                                var i = t.graphic,
                                    r = t.shapeArgs;
                                i && (i.attr({
                                    r: t.startR || e.center[3] / 2,
                                    start: n,
                                    end: n
                                }), i.animate({
                                    r: r.r,
                                    start: r.start,
                                    end: r.end
                                }, e.options.animation))
                            }), e.animate = null)
                        },
                        updateTotals: function() {
                            var t, e, i = 0,
                                n = this.points,
                                r = n.length,
                                s = this.options.ignoreHiddenPoint;
                            for (t = 0; t < r; t++) e = n[t], i += s && !e.visible || e.isNull ? 0 : e.y;
                            for (t = 0, this.total = i; t < r; t++)(e = n[t]).percentage = 0 < i && (e.visible || !s) ? e.y / i * 100 : 0, e.total = i
                        },
                        generatePoints: function() {
                            r_.prototype.generatePoints.call(this), this.updateTotals()
                        },
                        translate: function(t) {
                            this.generatePoints();
                            var e, i, n, r, s, o, a = 0,
                                l = this.options,
                                h = l.slicedOffset,
                                c = h + (l.borderWidth || 0),
                                d = l.startAngle || 0,
                                u = this.startAngleRad = Math.PI / 180 * (d - 90),
                                d = (this.endAngleRad = Math.PI / 180 * (rV(l.endAngle, d + 360) - 90)) - u,
                                p = this.points,
                                f = l.dataLabels.distance,
                                l = l.ignoreHiddenPoint,
                                g = p.length;
                            for (t || (this.center = t = this.getCenter()), this.getX = function(e, i, r) {
                                    return n = Math.asin(Math.min((e - t[1]) / (t[2] / 2 + r.labelDistance), 1)), t[0] + (i ? -1 : 1) * Math.cos(n) * (t[2] / 2 + r.labelDistance)
                                }, s = 0; s < g; s++)(o = p[s]).labelDistance = rV(o.options.dataLabels && o.options.dataLabels.distance, f), this.maxLabelDistance = Math.max(this.maxLabelDistance || 0, o.labelDistance), e = u + a * d, (!l || o.visible) && (a += o.percentage / 100), i = u + a * d, o.shapeType = "arc", o.shapeArgs = {
                                x: t[0],
                                y: t[1],
                                r: t[2] / 2,
                                innerR: t[3] / 2,
                                start: Math.round(1e3 * e) / 1e3,
                                end: Math.round(1e3 * i) / 1e3
                            }, (n = (i + e) / 2) > 1.5 * Math.PI ? n -= 2 * Math.PI : n < -Math.PI / 2 && (n += 2 * Math.PI), o.slicedTranslation = {
                                translateX: Math.round(Math.cos(n) * h),
                                translateY: Math.round(Math.sin(n) * h)
                            }, i = Math.cos(n) * t[2] / 2, r = Math.sin(n) * t[2] / 2, o.tooltipPos = [t[0] + .7 * i, t[1] + .7 * r], o.half = +(n < -Math.PI / 2 || n > Math.PI / 2), o.angle = n, e = Math.min(c, o.labelDistance / 5), o.labelPos = [t[0] + i + Math.cos(n) * o.labelDistance, t[1] + r + Math.sin(n) * o.labelDistance, t[0] + i + Math.cos(n) * e, t[1] + r + Math.sin(n) * e, t[0] + i, t[1] + r, 0 > o.labelDistance ? "center" : o.half ? "right" : "left", n]
                        },
                        drawGraph: null,
                        drawPoints: function() {
                            var t, e, i, n, r = this,
                                s = r.chart.renderer,
                                o = r.options.shadow;
                            o && !r.shadowGroup && (r.shadowGroup = s.g("shadow").add(r.group)), rH(r.points, function(a) {
                                if (!a.isNull) {
                                    e = a.graphic, n = a.shapeArgs, t = a.getTranslate();
                                    var l = a.shadowGroup;
                                    o && !l && (l = a.shadowGroup = s.g("shadow").add(r.shadowGroup)), l && l.attr(t), i = r.pointAttribs(a, a.selected && "select"), e ? e.setRadialReference(r.center).attr(i).animate(rF(n, t)) : (a.graphic = e = s[a.shapeType](n).setRadialReference(r.center).attr(t).add(r.group), a.visible || e.attr({
                                        visibility: "hidden"
                                    }), e.attr(i).attr({
                                        "stroke-linejoin": "round"
                                    }).shadow(o, l)), e.addClass(a.getClassName())
                                }
                            })
                        },
                        searchPoint: rY,
                        sortByAngle: function(t, e) {
                            t.sort(function(t, i) {
                                return void 0 !== t.angle && (i.angle - t.angle) * e
                            })
                        },
                        drawLegendSymbol: rj.LegendSymbolMixin.drawRectangle,
                        getCenter: rj.CenteredSeriesMixin.getCenter,
                        getSymbol: rY
                    }, {
                        init: function() {
                            rU.prototype.init.apply(this, arguments);
                            var t, e = this;
                            return e.name = rV(e.name, "Slice"), t = function(t) {
                                e.slice("select" === t.type)
                            }, rG(e, "select", t), rG(e, "unselect", t), e
                        },
                        isValid: function() {
                            return rj.isNumber(this.y, !0) && 0 <= this.y
                        },
                        setVisible: function(t, e) {
                            var i = this,
                                n = i.series,
                                r = n.chart,
                                s = n.options.ignoreHiddenPoint;
                            e = rV(e, s), t !== i.visible && (i.visible = i.options.visible = t = void 0 === t ? !i.visible : t, n.options.data[rX(i, n.data)] = i.options, rH(["graphic", "dataLabel", "connector", "shadowGroup"], function(e) {
                                i[e] && i[e][t ? "show" : "hide"](!0)
                            }), i.legendItem && r.legend.colorizeItem(i, t), t || "hover" !== i.state || i.setState(""), s && (n.isDirty = !0), e && r.redraw())
                        },
                        slice: function(t, e, i) {
                            var n = this.series;
                            rq(i, n.chart), rV(e, !0), this.sliced = this.options.sliced = rW(t) ? t : !this.sliced, n.options.data[rX(this, n.data)] = this.options, this.graphic.animate(this.getTranslate()), this.shadowGroup && this.shadowGroup.animate(this.getTranslate())
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
                    }), r$ = (rZ = t).addEvent, rJ = rZ.arrayMax, rQ = rZ.defined, r0 = rZ.each, r1 = rZ.extend, r2 = rZ.format, r3 = rZ.map, r5 = rZ.merge, r9 = rZ.noop, r6 = rZ.pick, r4 = rZ.relativeLength, r8 = rZ.Series, r7 = rZ.seriesTypes, st = rZ.stableSort, rZ.distribute = function(t, e) {
                        function i(t, e) {
                            return t.target - e.target
                        }
                        var n, r, s = !0,
                            o = t,
                            a = [];
                        for (r = 0, n = t.length; n--;) r += t[n].size;
                        if (r > e) {
                            for (st(t, function(t, e) {
                                    return (e.rank || 0) - (t.rank || 0)
                                }), r = n = 0; r <= e;) r += t[n].size, n++;
                            a = t.splice(n - 1, t.length)
                        }
                        for (st(t, i), t = r3(t, function(t) {
                                return {
                                    size: t.size,
                                    targets: [t.target]
                                }
                            }); s;) {
                            for (n = t.length; n--;) s = t[n], r = (Math.min.apply(0, s.targets) + Math.max.apply(0, s.targets)) / 2, s.pos = Math.min(Math.max(0, r - s.size / 2), e - s.size);
                            for (n = t.length, s = !1; n--;) 0 < n && t[n - 1].pos + t[n - 1].size > t[n].pos && (t[n - 1].size += t[n].size, t[n - 1].targets = t[n - 1].targets.concat(t[n].targets), t[n - 1].pos + t[n - 1].size > e && (t[n - 1].pos = e - t[n - 1].size), t.splice(n, 1), s = !0)
                        }
                        n = 0, r0(t, function(t) {
                            var e = 0;
                            r0(t.targets, function() {
                                o[n].pos = t.pos + e, e += o[n].size, n++
                            })
                        }), o.push.apply(o, a), st(o, i)
                    }, r8.prototype.drawDataLabels = function() {
                        var t, e, i, n, r = this,
                            s = r.options,
                            o = s.dataLabels,
                            a = r.points,
                            l = r.hasRendered || 0,
                            h = r6(o.defer, !!s.animation),
                            c = r.chart.renderer;
                        (o.enabled || r._hasPointLabels) && (r.dlProcessOptions && r.dlProcessOptions(o), n = r.plotGroup("dataLabelsGroup", "data-labels", h && !l ? "hidden" : "visible", o.zIndex || 6), h && (n.attr({
                            opacity: +l
                        }), l || r$(r, "afterAnimate", function() {
                            r.visible && n.show(!0), n[s.animation ? "animate" : "attr"]({
                                opacity: 1
                            }, {
                                duration: 200
                            })
                        })), e = o, r0(a, function(a) {
                            var l, h, d, u, p = a.dataLabel,
                                f = a.connector,
                                g = !p;
                            (l = r6((t = a.dlOptions || a.options && a.options.dataLabels) && t.enabled, e.enabled) && null !== a.y) && (o = r5(e, t), h = a.getLabelConfig(), i = o.format ? r2(o.format, h) : o.formatter.call(h, o), u = o.style, h = o.rotation, u.color = r6(o.color, u.color, r.color, "#000000"), "contrast" === u.color && (a.contrastColor = c.getContrast(a.color || r.color), u.color = o.inside || 0 > r6(a.labelDistance, o.distance) || s.stacking ? a.contrastColor : "#000000"), s.cursor && (u.cursor = s.cursor), d = {
                                fill: o.backgroundColor,
                                stroke: o.borderColor,
                                "stroke-width": o.borderWidth,
                                r: o.borderRadius || 0,
                                rotation: h,
                                padding: o.padding,
                                zIndex: 1
                            }, rZ.objectEach(d, function(t, e) {
                                void 0 === t && delete d[e]
                            })), !p || l && rQ(i) ? l && rQ(i) && (p ? d.text = i : (p = a.dataLabel = c[h ? "text" : "label"](i, 0, -9999, o.shape, null, null, o.useHTML, null, "data-label")).addClass("highcharts-data-label-color-" + a.colorIndex + " " + (o.className || "") + (o.useHTML ? "highcharts-tracker" : "")), p.attr(d), p.css(u).shadow(o.shadow), p.added || p.add(n), r.alignDataLabel(a, p, o, null, g)) : (a.dataLabel = p = p.destroy(), f && (a.connector = f.destroy()))
                        }))
                    }, r8.prototype.alignDataLabel = function(t, e, i, n, r) {
                        var s, o = this.chart,
                            a = o.inverted,
                            l = r6(t.plotX, -9999),
                            h = r6(t.plotY, -9999),
                            c = e.getBBox(),
                            d = i.rotation,
                            u = i.align,
                            p = this.visible && (t.series.forceDL || o.isInsidePlot(l, Math.round(h), a) || n && o.isInsidePlot(l, a ? n.x + 1 : n.y + n.height - 1, a)),
                            f = "justify" === r6(i.overflow, "justify");
                        p && (s = i.style.fontSize, s = o.renderer.fontMetrics(s, e).b, n = r1({
                            x: a ? this.yAxis.len - h : l,
                            y: Math.round(a ? this.xAxis.len - l : h),
                            width: 0,
                            height: 0
                        }, n), r1(i, {
                            width: c.width,
                            height: c.height
                        }), d ? (f = !1, l = o.renderer.rotCorr(s, d), l = {
                            x: n.x + i.x + n.width / 2 + l.x,
                            y: n.y + i.y + ({
                                top: 0,
                                middle: .5,
                                bottom: 1
                            })[i.verticalAlign] * n.height
                        }, e[r ? "attr" : "animate"](l).attr({
                            align: u
                        }), h = 180 < (h = (d + 720) % 360) && 360 > h, "left" === u ? l.y -= h ? c.height : 0 : "center" === u ? (l.x -= c.width / 2, l.y -= c.height / 2) : "right" === u && (l.x -= c.width, l.y -= h ? 0 : c.height)) : (e.align(i, null, n), l = e.alignAttr), f ? t.isLabelJustified = this.justifyDataLabel(e, i, l, c, n, r) : r6(i.crop, !0) && (p = o.isInsidePlot(l.x, l.y) && o.isInsidePlot(l.x + c.width, l.y + c.height)), i.shape && !d) && e[r ? "attr" : "animate"]({
                            anchorX: a ? o.plotWidth - t.plotY : t.plotX,
                            anchorY: a ? o.plotHeight - t.plotX : t.plotY
                        }), p || (e.attr({
                            y: -9999
                        }), e.placed = !1)
                    }, r8.prototype.justifyDataLabel = function(t, e, i, n, r, s) {
                        var o, a, l = this.chart,
                            h = e.align,
                            c = e.verticalAlign,
                            d = t.box ? 0 : t.padding || 0;
                        return 0 > (o = i.x + d) && ("right" === h ? e.align = "left" : e.x = -o, a = !0), (o = i.x + n.width - d) > l.plotWidth && ("left" === h ? e.align = "right" : e.x = l.plotWidth - o, a = !0), 0 > (o = i.y + d) && ("bottom" === c ? e.verticalAlign = "top" : e.y = -o, a = !0), (o = i.y + n.height - d) > l.plotHeight && ("top" === c ? e.verticalAlign = "bottom" : e.y = l.plotHeight - o, a = !0), a && (t.placed = !s, t.align(e, null, r)), a
                    }, r7.pie && (r7.pie.prototype.drawDataLabels = function() {
                        var t, e, i, n, r, s, o, a, l, h, c = this,
                            d = c.data,
                            u = c.chart,
                            p = c.options.dataLabels,
                            f = r6(p.connectorPadding, 10),
                            g = r6(p.connectorWidth, 1),
                            m = u.plotWidth,
                            v = u.plotHeight,
                            y = c.center,
                            x = y[2] / 2,
                            b = y[1],
                            w = [
                                [],
                                []
                            ],
                            k = [0, 0, 0, 0];
                        c.visible && (p.enabled || c._hasPointLabels) && (r0(d, function(t) {
                            t.dataLabel && t.visible && t.dataLabel.shortened && (t.dataLabel.attr({
                                width: "auto"
                            }).css({
                                width: "auto",
                                textOverflow: "clip"
                            }), t.dataLabel.shortened = !1)
                        }), r8.prototype.drawDataLabels.apply(c), r0(d, function(t) {
                            t.dataLabel && t.visible && (w[t.half].push(t), t.dataLabel._pos = null)
                        }), r0(w, function(e, d) {
                            var g, w, S, M = e.length,
                                C = [];
                            if (M)
                                for (c.sortByAngle(e, d - .5), 0 < c.maxLabelDistance && (g = Math.max(0, b - x - c.maxLabelDistance), w = Math.min(b + x + c.maxLabelDistance, u.plotHeight), r0(e, function(t) {
                                        0 < t.labelDistance && t.dataLabel && (t.top = Math.max(0, b - x - t.labelDistance), t.bottom = Math.min(b + x + t.labelDistance, u.plotHeight), S = t.dataLabel.getBBox().height || 21, t.positionsIndex = C.push({
                                            target: t.labelPos[1] - t.top + S / 2,
                                            size: S,
                                            rank: t.y
                                        }) - 1)
                                    }), rZ.distribute(C, w + S - g)), h = 0; h < M; h++) w = (t = e[h]).positionsIndex, r = t.labelPos, i = t.dataLabel, l = !1 === t.visible ? "hidden" : "inherit", g = r[1], C && rQ(C[w]) ? void 0 === C[w].pos ? l = "hidden" : (s = C[w].size, a = t.top + C[w].pos) : a = g, delete t.positionIndex, o = p.justify ? y[0] + (d ? -1 : 1) * (x + t.labelDistance) : c.getX(a < t.top + 2 || a > t.bottom - 2 ? g : a, d, t), i._attr = {
                                    visibility: l,
                                    align: r[6]
                                }, i._pos = {
                                    x: o + p.x + (({
                                        left: f,
                                        right: -f
                                    })[r[6]] || 0),
                                    y: a + p.y - 10
                                }, r.x = o, r.y = a, r6(p.crop, !0) && (n = i.getBBox().width, g = null, o - n < f ? (g = Math.round(n - o + f), k[3] = Math.max(g, k[3])) : o + n > m - f && (g = Math.round(o + n - m + f), k[1] = Math.max(g, k[1])), 0 > a - s / 2 ? k[0] = Math.max(Math.round(-a + s / 2), k[0]) : a + s / 2 > v && (k[2] = Math.max(Math.round(a + s / 2 - v), k[2])), i.sideOverflow = g)
                        }), 0 === rJ(k) || this.verifyDataLabelOverflow(k)) && (this.placeDataLabels(), g && r0(this.points, function(t) {
                            var n;
                            e = t.connector, (i = t.dataLabel) && i._pos && t.visible && 0 < t.labelDistance ? (l = i._attr.visibility, (n = !e) && (t.connector = e = u.renderer.path().addClass("highcharts-data-label-connector highcharts-color-" + t.colorIndex).add(c.dataLabelsGroup), e.attr({
                                "stroke-width": g,
                                stroke: p.connectorColor || t.color || "#666666"
                            })), e[n ? "attr" : "animate"]({
                                d: c.connectorPath(t.labelPos)
                            }), e.attr("visibility", l)) : e && (t.connector = e.destroy())
                        }))
                    }, r7.pie.prototype.connectorPath = function(t) {
                        var e = t.x,
                            i = t.y;
                        return r6(this.options.dataLabels.softConnector, !0) ? ["M", e + ("left" === t[6] ? 5 : -5), i, "C", e, i, 2 * t[2] - t[4], 2 * t[3] - t[5], t[2], t[3], "L", t[4], t[5]] : ["M", e + ("left" === t[6] ? 5 : -5), i, "L", t[2], t[3], "L", t[4], t[5]]
                    }, r7.pie.prototype.placeDataLabels = function() {
                        r0(this.points, function(t) {
                            var e = t.dataLabel;
                            e && t.visible && ((t = e._pos) ? (e.sideOverflow && (e._attr.width = e.getBBox().width - e.sideOverflow, e.css({
                                width: e._attr.width + "px",
                                textOverflow: "ellipsis"
                            }), e.shortened = !0), e.attr(e._attr), e[e.moved ? "animate" : "attr"](t), e.moved = !0) : e && e.attr({
                                y: -9999
                            }))
                        }, this)
                    }, r7.pie.prototype.alignDataLabel = r9, r7.pie.prototype.verifyDataLabelOverflow = function(t) {
                        var e, i = this.center,
                            n = this.options,
                            r = n.center,
                            s = n.minSize || 80,
                            o = null !== n.size;
                        return o || (null !== r[0] ? e = Math.max(i[2] - Math.max(t[1], t[3]), s) : (e = Math.max(i[2] - t[1] - t[3], s), i[0] += (t[3] - t[1]) / 2), null !== r[1] ? e = Math.max(Math.min(e, i[2] - Math.max(t[0], t[2])), s) : (e = Math.max(Math.min(e, i[2] - t[0] - t[2]), s), i[1] += (t[0] - t[2]) / 2), e < i[2] ? (i[2] = e, i[3] = Math.min(r4(n.innerSize || 0, e), e), this.translate(i), this.drawDataLabels && this.drawDataLabels()) : o = !0), o
                    }), r7.column && (r7.column.prototype.alignDataLabel = function(t, e, i, n, r) {
                        var s = this.chart.inverted,
                            o = t.series,
                            a = t.dlBox || t.shapeArgs,
                            l = r6(t.below, t.plotY > r6(this.translatedThreshold, o.yAxis.len)),
                            h = r6(i.inside, !!this.options.stacking);
                        a && (0 > (n = r5(a)).y && (n.height += n.y, n.y = 0), 0 < (a = n.y + n.height - o.yAxis.len) && (n.height -= a), s && (n = {
                            x: o.yAxis.len - n.y - n.height,
                            y: o.xAxis.len - n.x - n.width,
                            width: n.height,
                            height: n.width
                        }), h || (s ? (n.x += l ? 0 : n.width, n.width = 0) : (n.y += l ? n.height : 0, n.height = 0))), i.align = r6(i.align, !s || h ? "center" : l ? "right" : "left"), i.verticalAlign = r6(i.verticalAlign, s || h ? "middle" : l ? "top" : "bottom"), r8.prototype.alignDataLabel.call(this, t, e, i, n, r), t.isLabelJustified && t.contrastColor && t.dataLabel.css({
                            color: t.contrastColor
                        })
                    }), si = (se = t).Chart, sn = se.each, sr = se.objectEach, ss = se.pick, so = se.addEvent, si.prototype.callbacks.push(function(t) {
                        function e() {
                            var e = [];
                            sn(t.yAxis || [], function(t) {
                                t.options.stackLabels && !t.options.stackLabels.allowOverlap && sr(t.stacks, function(t) {
                                    sr(t, function(t) {
                                        e.push(t.label)
                                    })
                                })
                            }), sn(t.series || [], function(t) {
                                var i = t.options.dataLabels,
                                    n = t.dataLabelCollections || ["dataLabel"];
                                (i.enabled || t._hasPointLabels) && !i.allowOverlap && t.visible && sn(n, function(i) {
                                    sn(t.points, function(t) {
                                        t[i] && (t[i].labelrank = ss(t.labelrank, t.shapeArgs && t.shapeArgs.height), e.push(t[i]))
                                    })
                                })
                            }), t.hideOverlappingLabels(e)
                        }
                        e(), so(t, "redraw", e)
                    }), si.prototype.hideOverlappingLabels = function(t) {
                        var e, i, n, r, s, o, a, l, h, c, d, u, p, f, g, m, v, y = t.length;
                        for (c = 0; c < y; c++)(h = t[c]) && (h.oldOpacity = h.opacity, h.newOpacity = 1, h.width || (d = h.getBBox(), h.width = d.width, h.height = d.height));
                        for (t.sort(function(t, e) {
                                return (e.labelrank || 0) - (t.labelrank || 0)
                            }), c = 0; c < y; c++)
                            for (d = t[c], h = c + 1; h < y; ++h) u = t[h], d && u && d !== u && d.placed && u.placed && 0 !== d.newOpacity && 0 !== u.newOpacity && (p = d.alignAttr, f = u.alignAttr, g = d.parentGroup, m = u.parentGroup, v = 2 * (d.box ? 0 : d.padding || 0), e = p.x + g.translateX, i = p.y + g.translateY, n = d.width - v, r = d.height - v, s = f.x + m.translateX, o = f.y + m.translateY, a = u.width - v, l = u.height - v, p = !(s > e + n || s + a < e || o > i + r || o + l < i)) && ((d.labelrank < u.labelrank ? d : u).newOpacity = 0);
                        sn(t, function(t) {
                            var e, i;
                            t && (i = t.newOpacity, t.oldOpacity !== i && t.placed && (i ? t.show(!0) : e = function() {
                                t.hide()
                            }, t.alignAttr.opacity = i, t[t.isOld ? "animate" : "attr"](t.alignAttr, null, e)), t.isOld = !0)
                        })
                    }, sh = (sa = t).addEvent, sc = sa.Chart, sd = sa.createElement, su = sa.css, sp = sa.defaultOptions, sf = sa.defaultPlotOptions, sg = sa.each, sm = sa.extend, sv = sa.fireEvent, sy = sa.hasTouch, sx = sa.inArray, sb = sa.isObject, sw = sa.Legend, sk = sa.merge, sS = sa.pick, sM = sa.Point, sC = sa.Series, sT = sa.seriesTypes, sA = sa.svg, sl = sa.TrackerMixin = {
                        drawTrackerPoint: function() {
                            var t = this,
                                e = t.chart.pointer,
                                i = function(t) {
                                    var i = e.getPointFromEvent(t);
                                    void 0 !== i && (e.isDirectTouch = !0, i.onMouseOver(t))
                                };
                            sg(t.points, function(t) {
                                t.graphic && (t.graphic.element.point = t), t.dataLabel && (t.dataLabel.div ? t.dataLabel.div.point = t : t.dataLabel.element.point = t)
                            }), t._hasTracking || (sg(t.trackerGroups, function(n) {
                                t[n] && (t[n].addClass("highcharts-tracker").on("mouseover", i).on("mouseout", function(t) {
                                    e.onTrackerMouseOut(t)
                                }), sy && t[n].on("touchstart", i), t.options.cursor && t[n].css(su).css({
                                    cursor: t.options.cursor
                                }))
                            }), t._hasTracking = !0)
                        },
                        drawTrackerGraph: function() {
                            var t, e = this,
                                i = e.options,
                                n = i.trackByArea,
                                r = [].concat(n ? e.areaPath : e.graphPath),
                                s = r.length,
                                o = e.chart,
                                a = o.pointer,
                                l = o.renderer,
                                h = o.options.tooltip.snap,
                                c = e.tracker,
                                d = function() {
                                    o.hoverSeries !== e && e.onMouseOver()
                                },
                                u = "rgba(192,192,192," + (sA ? 1e-4 : .002) + ")";
                            if (s && !n)
                                for (t = s + 1; t--;) "M" === r[t] && r.splice(t + 1, 0, r[t + 1] - h, r[t + 2], "L"), (t && "M" === r[t] || t === s) && r.splice(t, 0, "L", r[t - 2] + h, r[t - 1]);
                            c ? c.attr({
                                d: r
                            }) : e.graph && (e.tracker = l.path(r).attr({
                                "stroke-linejoin": "round",
                                visibility: e.visible ? "visible" : "hidden",
                                stroke: u,
                                fill: n ? u : "none",
                                "stroke-width": e.graph.strokeWidth() + (n ? 0 : 2 * h),
                                zIndex: 2
                            }).add(e.group), sg([e.tracker, e.markerGroup], function(t) {
                                t.addClass("highcharts-tracker").on("mouseover", d).on("mouseout", function(t) {
                                    a.onTrackerMouseOut(t)
                                }), i.cursor && t.css({
                                    cursor: i.cursor
                                }), sy && t.on("touchstart", d)
                            }))
                        }
                    }, sT.column && (sT.column.prototype.drawTracker = sl.drawTrackerPoint), sT.pie && (sT.pie.prototype.drawTracker = sl.drawTrackerPoint), sT.scatter && (sT.scatter.prototype.drawTracker = sl.drawTrackerPoint), sm(sw.prototype, {
                        setItemEvents: function(t, e, i) {
                            var n = this,
                                r = n.chart.renderer.boxWrapper,
                                s = "highcharts-legend-" + (t.series ? "point" : "series") + "-active";
                            (i ? e : t.legendGroup).on("mouseover", function() {
                                t.setState("hover"), r.addClass(s), e.css(n.options.itemHoverStyle)
                            }).on("mouseout", function() {
                                e.css(sk(t.visible ? n.itemStyle : n.itemHiddenStyle)), r.removeClass(s), t.setState()
                            }).on("click", function(e) {
                                var i = function() {
                                    t.setVisible && t.setVisible()
                                };
                                e = {
                                    browserEvent: e
                                }, t.firePointEvent ? t.firePointEvent("legendItemClick", e, i) : sv(t, "legendItemClick", e, i)
                            })
                        },
                        createCheckboxForItem: function(t) {
                            t.checkbox = sd("input", {
                                type: "checkbox",
                                checked: t.selected,
                                defaultChecked: t.selected
                            }, this.options.itemCheckboxStyle, this.chart.container), sh(t.checkbox, "click", function(e) {
                                sv(t.series || t, "checkboxClick", {
                                    checked: e.target.checked,
                                    item: t
                                }, function() {
                                    t.select()
                                })
                            })
                        }
                    }), sp.legend.itemStyle.cursor = "pointer", sm(sc.prototype, {
                        showResetZoom: function() {
                            var t = this,
                                e = sp.lang,
                                i = t.options.chart.resetZoomButton,
                                n = i.theme,
                                r = n.states,
                                s = "chart" === i.relativeTo ? null : "plotBox";
                            this.resetZoomButton = t.renderer.button(e.resetZoom, null, null, function() {
                                t.zoomOut()
                            }, n, r && r.hover).attr({
                                align: i.position.align,
                                title: e.resetZoomTitle
                            }).addClass("highcharts-reset-zoom").add().align(i.position, !1, s)
                        },
                        zoomOut: function() {
                            var t = this;
                            sv(t, "selection", {
                                resetSelection: !0
                            }, function() {
                                t.zoom()
                            })
                        },
                        zoom: function(t) {
                            var e, i, n = this.pointer,
                                r = !1;
                            !t || t.resetSelection ? (sg(this.axes, function(t) {
                                e = t.zoom()
                            }), n.initiated = !1) : sg(t.xAxis.concat(t.yAxis), function(t) {
                                var i = t.axis;
                                n[i.isXAxis ? "zoomX" : "zoomY"] && (e = i.zoom(t.min, t.max), i.displayBtn && (r = !0))
                            }), i = this.resetZoomButton, r && !i ? this.showResetZoom() : !r && sb(i) && (this.resetZoomButton = i.destroy()), e && this.redraw(sS(this.options.chart.animation, t && t.animation, 100 > this.pointCount))
                        },
                        pan: function(t, e) {
                            var i, n = this,
                                r = n.hoverPoints;
                            r && sg(r, function(t) {
                                t.setState()
                            }), sg("xy" === e ? [1, 0] : [1], function(e) {
                                var r, s = (e = n[e ? "xAxis" : "yAxis"][0]).horiz,
                                    o = t[s ? "chartX" : "chartY"],
                                    s = s ? "mouseDownX" : "mouseDownY",
                                    a = n[s],
                                    l = (e.pointRange || 0) / 2,
                                    h = e.getExtremes(),
                                    c = e.toValue(a - o, !0) + l,
                                    l = e.toValue(a + e.len - o, !0) - l,
                                    d = l < c,
                                    a = d ? l : c,
                                    c = d ? c : l,
                                    l = Math.min(h.dataMin, e.toValue(e.toPixels(h.min) - e.minPixelPadding)),
                                    d = Math.max(h.dataMax, e.toValue(e.toPixels(h.max) + e.minPixelPadding));
                                0 < (r = l - a) && (c += r, a = l), 0 < (r = c - d) && (c = d, a -= r), e.series.length && a !== h.min && c !== h.max && (e.setExtremes(a, c, !1, !1, {
                                    trigger: "pan"
                                }), i = !0), n[s] = o
                            }), i && n.redraw(!1), su(n.container, {
                                cursor: "move"
                            })
                        }
                    }), sm(sM.prototype, {
                        select: function(t, e) {
                            var i = this,
                                n = i.series,
                                r = n.chart;
                            t = sS(t, !i.selected), i.firePointEvent(t ? "select" : "unselect", {
                                accumulate: e
                            }, function() {
                                i.selected = i.options.selected = t, n.options.data[sx(i, n.data)] = i.options, i.setState(t && "select"), e || sg(r.getSelectedPoints(), function(t) {
                                    t.selected && t !== i && (t.selected = t.options.selected = !1, n.options.data[sx(t, n.data)] = t.options, t.setState(""), t.firePointEvent("unselect"))
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
                            this.firePointEvent("mouseOut"), sg(t.hoverPoints || [], function(t) {
                                t.setState()
                            }), t.hoverPoints = t.hoverPoint = null
                        },
                        importEvents: function() {
                            if (!this.hasImportedEvents) {
                                var t = this,
                                    e = sk(t.series.options.point, t.options).events;
                                t.events = e, sa.objectEach(e, function(e, i) {
                                    sh(t, i, e)
                                }), this.hasImportedEvents = !0
                            }
                        },
                        setState: function(t, e) {
                            var i, n = Math.floor(this.plotX),
                                r = this.plotY,
                                s = this.series,
                                o = s.options.states[t] || {},
                                a = sf[s.type].marker && s.options.marker,
                                l = a && !1 === a.enabled,
                                h = a && a.states && a.states[t] || {},
                                c = !1 === h.enabled,
                                d = s.stateMarkerGraphic,
                                u = this.marker || {},
                                p = s.chart,
                                f = s.halo,
                                g = a && s.markerAttribs;
                            (t = t || "") === this.state && !e || this.selected && "select" !== t || !1 === o.enabled || t && (c || l && !1 === h.enabled) || t && u.states && u.states[t] && !1 === u.states[t].enabled || (g && (i = s.markerAttribs(this, t)), this.graphic ? (this.state && this.graphic.removeClass("highcharts-point-" + this.state), t && this.graphic.addClass("highcharts-point-" + t), this.graphic.animate(s.pointAttribs(this, t), sS(p.options.chart.animation, o.animation)), i && this.graphic.animate(i, sS(p.options.chart.animation, h.animation, a.animation)), d && d.hide()) : (t && h && (a = u.symbol || s.symbol, d && d.currentSymbol !== a && (d = d.destroy()), d ? d[e ? "animate" : "attr"]({
                                x: i.x,
                                y: i.y
                            }) : a && (s.stateMarkerGraphic = d = p.renderer.symbol(a, i.x, i.y, i.width, i.height).add(s.markerGroup), d.currentSymbol = a), d && d.attr(s.pointAttribs(this, t))), d && (d[t && p.isInsidePlot(n, r, p.inverted) ? "show" : "hide"](), d.element.point = this)), (n = o.halo) && n.size ? (f || (s.halo = f = p.renderer.path().add((this.graphic || d).parentGroup)), f[e ? "animate" : "attr"]({
                                d: this.haloPath(n.size)
                            }), f.attr({
                                class: "highcharts-halo highcharts-color-" + sS(this.colorIndex, s.colorIndex)
                            }), f.point = this, f.attr(sm({
                                fill: this.color || s.color,
                                "fill-opacity": n.opacity,
                                zIndex: -1
                            }, n.attributes))) : f && f.point && f.point.haloPath && f.animate({
                                d: f.point.haloPath(0)
                            }), this.state = t)
                        },
                        haloPath: function(t) {
                            return this.series.chart.renderer.symbols.circle(Math.floor(this.plotX) - t, this.plotY - t, 2 * t, 2 * t)
                        }
                    }), sm(sC.prototype, {
                        onMouseOver: function() {
                            var t = this.chart,
                                e = t.hoverSeries;
                            e && e !== this && e.onMouseOut(), this.options.events.mouseOver && sv(this, "mouseOver"), this.setState("hover"), t.hoverSeries = this
                        },
                        onMouseOut: function() {
                            var t = this.options,
                                e = this.chart,
                                i = e.tooltip,
                                n = e.hoverPoint;
                            e.hoverSeries = null, n && n.onMouseOut(), this && t.events.mouseOut && sv(this, "mouseOut"), !i || this.stickyTracking || i.shared && !this.noSharedTooltip || i.hide(), this.setState()
                        },
                        setState: function(t) {
                            var e = this,
                                i = e.options,
                                n = e.graph,
                                r = i.states,
                                s = i.lineWidth,
                                i = 0;
                            if (t = t || "", e.state !== t && (sg([e.group, e.markerGroup, e.dataLabelsGroup], function(i) {
                                    i && (e.state && i.removeClass("highcharts-series-" + e.state), t && i.addClass("highcharts-series-" + t))
                                }), e.state = t, !r[t] || !1 !== r[t].enabled) && (t && (s = r[t].lineWidth || s + (r[t].lineWidthPlus || 0)), n && !n.dashstyle))
                                for (s = {
                                        "stroke-width": s
                                    }, n.animate(s, sS(e.chart.options.chart.animation, r[t] && r[t].animation)); e["zone-graph-" + i];) e["zone-graph-" + i].attr(s), i += 1
                        },
                        setVisible: function(t, e) {
                            var i, n = this,
                                r = n.chart,
                                s = n.legendItem,
                                o = r.options.chart.ignoreHiddenSeries,
                                a = n.visible;
                            i = (n.visible = t = n.options.visible = n.userOptions.visible = void 0 === t ? !a : t) ? "show" : "hide", sg(["group", "dataLabelsGroup", "markerGroup", "tracker", "tt"], function(t) {
                                n[t] && n[t][i]()
                            }), (r.hoverSeries === n || (r.hoverPoint && r.hoverPoint.series) === n) && n.onMouseOut(), s && r.legend.colorizeItem(n, t), n.isDirty = !0, n.options.stacking && sg(r.series, function(t) {
                                t.options.stacking && t.visible && (t.isDirty = !0)
                            }), sg(n.linkedSeries, function(e) {
                                e.setVisible(t, !1)
                            }), o && (r.isDirtyBox = !0), !1 !== e && r.redraw(), sv(n, i)
                        },
                        show: function() {
                            this.setVisible(!0)
                        },
                        hide: function() {
                            this.setVisible(!1)
                        },
                        select: function(t) {
                            this.selected = t = void 0 === t ? !this.selected : t, this.checkbox && (this.checkbox.checked = t), sv(this, t ? "select" : "unselect")
                        },
                        drawTracker: sl.drawTrackerGraph
                    }), sL = (sP = t).Chart, sI = sP.each, sO = sP.inArray, sD = sP.isArray, sE = sP.isObject, sN = sP.pick, sR = sP.splat, sL.prototype.setResponsive = function(t) {
                        var e = this.options.responsive,
                            i = [],
                            n = this.currentResponsive;
                        e && e.rules && sI(e.rules, function(e) {
                            void 0 === e._id && (e._id = sP.uniqueKey()), this.matchResponsiveRule(e, i, t)
                        }, this);
                        var r = sP.merge.apply(0, sP.map(i, function(t) {
                                return sP.find(e.rules, function(e) {
                                    return e._id === t
                                }).chartOptions
                            })),
                            i = i.toString() || void 0;
                        i !== (n && n.ruleIds) && (n && this.update(n.undoOptions, t), i ? (this.currentResponsive = {
                            ruleIds: i,
                            mergedOptions: r,
                            undoOptions: this.currentOptions(r)
                        }, this.update(r, t)) : this.currentResponsive = void 0)
                    }, sL.prototype.matchResponsiveRule = function(t, e) {
                        var i = t.condition;
                        (i.callback || function() {
                            return this.chartWidth <= sN(i.maxWidth, Number.MAX_VALUE) && this.chartHeight <= sN(i.maxHeight, Number.MAX_VALUE) && this.chartWidth >= sN(i.minWidth, 0) && this.chartHeight >= sN(i.minHeight, 0)
                        }).call(this) && e.push(t._id)
                    }, sL.prototype.currentOptions = function(t) {
                        var e = {};
                        return ! function t(e, i, n, r) {
                            var s;
                            sP.objectEach(e, function(o, a) {
                                if (!r && -1 < sO(a, ["series", "xAxis", "yAxis"]))
                                    for (e[a] = sR(e[a]), n[a] = [], s = 0; s < e[a].length; s++) i[a][s] && (n[a][s] = {}, t(o[s], i[a][s], n[a][s], r + 1));
                                else sE(o) ? (n[a] = sD(o) ? [] : {}, t(o, i[a] || {}, n[a], r + 1)) : n[a] = i[a] || null
                            })
                        }(t, this.options, e, 0), e
                    }, t
                }, "object" === o._(t) && t.exports ? t.exports = n.document ? r(n) : r : n.Highcharts = r(n)
            },
            726: function(t, e, i) {
                t = i.nmd(t);
                var n, r = i(844);
                n = function(t) {
                    var e, i, n, s, o, a, l, h, c;
                    i = t.win.document, n = t.each, s = t.objectEach, o = t.pick, a = t.inArray, l = t.isNumber, h = t.splat, c = function(t, e) {
                        this.init(t, e)
                    }, t.extend(c.prototype, {
                        init: function(t, e) {
                            this.options = t, this.chartOptions = e, this.columns = t.columns || this.rowsToColumns(t.rows) || [], this.firstRowAsNames = o(t.firstRowAsNames, !0), this.decimalRegex = t.decimalPoint && RegExp("^(-?[0-9]+)" + t.decimalPoint + "([0-9]+)$"), this.rawColumns = [], this.columns.length ? this.dataFound() : (this.parseCSV(), this.parseTable(), this.parseGoogleSpreadsheet())
                        },
                        getColumnDistribution: function() {
                            var i, r = this.chartOptions,
                                o = this.options,
                                a = [],
                                l = function(e) {
                                    return (t.seriesTypes[e || "line"].prototype.pointArrayMap || [0]).length
                                },
                                h = r && r.chart && r.chart.type,
                                c = [],
                                d = [],
                                u = 0;
                            n(r && r.series || [], function(t) {
                                c.push(l(t.type || h))
                            }), n(o && o.seriesMapping || [], function(t) {
                                a.push(t.x || 0)
                            }), 0 === a.length && a.push(0), n(o && o.seriesMapping || [], function(n) {
                                var o = new e,
                                    a = c[u] || l(h),
                                    p = t.seriesTypes[((r && r.series || [])[u] || {}).type || h || "line"].prototype.pointArrayMap || ["y"];
                                for (o.addColumnReader(n.x, "x"), s(n, function(t, e) {
                                        "x" !== e && o.addColumnReader(t, e)
                                    }), i = 0; i < a; i++) o.hasReader(p[i]) || o.addColumnReader(void 0, p[i]);
                                d.push(o), u++
                            }), void 0 === (o = t.seriesTypes[h || "line"].prototype.pointArrayMap) && (o = ["y"]), this.valueCount = {
                                global: l(h),
                                xColumns: a,
                                individual: c,
                                seriesBuilders: d,
                                globalPointArrayMap: o
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
                            s && (e = s.replace(/\r\n/g, "\n").replace(/\r/g, "\n").split(r.lineDelimiter || "\n"), t = r.itemDelimiter || (-1 !== s.indexOf("	") ? "	" : ","), n(e, function(e, r) {
                                var s = i.trim(e),
                                    u = 0 === s.indexOf("#");
                                r >= a && r <= l && !u && "" !== s && (n(e = e.split(t), function(t, e) {
                                    e >= h && e <= c && (o[e - h] || (o[e - h] = []), o[e - h][d] = t)
                                }), d += 1)
                            }), this.dataFound())
                        },
                        parseTable: function() {
                            var t = this.options,
                                e = t.table,
                                r = this.columns,
                                s = t.startRow || 0,
                                o = t.endRow || Number.MAX_VALUE,
                                a = t.startColumn || 0,
                                l = t.endColumn || Number.MAX_VALUE;
                            e && ("string" == typeof e && (e = i.getElementById(e)), n(e.getElementsByTagName("tr"), function(t, e) {
                                e >= s && e <= o && n(t.children, function(t, i) {
                                    ("TD" === t.tagName || "TH" === t.tagName) && i >= a && i <= l && (r[i - a] || (r[i - a] = []), r[i - a][e - s] = t.innerHTML)
                                })
                            }), this.dataFound())
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
                                    for (d = 0; d < u; d++) p = Math.max(p, (s = r[d]).gs$cell.col), f = Math.max(f, s.gs$cell.row);
                                    for (d = 0; d < p; d++) d >= h && d <= c && (o[d - h] = [], o[d - h].length = Math.min(f, l - a));
                                    for (d = 0; d < u; d++) t = (s = r[d]).gs$cell.row - 1, (e = s.gs$cell.col - 1) >= h && e <= c && t >= a && t <= l && (o[e - h][t - a] = s.content.$t);
                                    n(o, function(t) {
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
                            var i, n, r, s, o, c = this.rawColumns,
                                d = this.columns,
                                u = t.length,
                                p = this.firstRowAsNames,
                                f = -1 !== a(e, this.valueCount.xColumns),
                                g = [],
                                m = this.chartOptions,
                                v = (this.options.columnTypes || [])[e],
                                m = f && (m && m.xAxis && "category" === h(m.xAxis)[0].type || "string" === v);
                            for (c[e] || (c[e] = []); u--;) i = g[u] || t[u], r = this.trim(i), n = parseFloat(s = this.trim(i, !0)), void 0 === c[e][u] && (c[e][u] = r), m || 0 === u && p ? t[u] = r : +s === n ? (t[u] = n, 31536e6 < n && "float" !== v ? t.isDatetime = !0 : t.isNumeric = !0, void 0 !== t[u + 1] && (o = n > t[u + 1])) : (n = this.parseDate(i), f && l(n) && "float" !== v ? (g[u] = i, t[u] = n, t.isDatetime = !0, void 0 !== t[u + 1] && ((i = n > t[u + 1]) !== o && void 0 !== o && (this.alternativeFormat ? (this.dateFormat = this.alternativeFormat, u = t.length, this.alternativeFormat = this.dateFormats[this.dateFormat].alternative) : t.unsorted = !0), o = i)) : (t[u] = "" === r ? null : r, 0 !== u && (t.isDatetime || t.isNumeric) && (t.mixed = !0)));
                            if (f && t.mixed && (d[e] = c[e]), f && o && this.options.sort)
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
                                        } n || ("object" === (void 0 === (n = Date.parse(t)) ? "undefined" : r._(n)) && null !== n && n.getTime ? e = n.getTime() - 6e4 * n.getTimezoneOffset() : l(n) && (e = n - 6e4 * new Date(n).getTimezoneOffset()))
                            }
                            return e
                        },
                        rowsToColumns: function(t) {
                            var e, i, n, r, s;
                            if (t)
                                for (s = [], i = t.length, e = 0; e < i; e++)
                                    for (r = t[e].length, n = 0; n < r; n++) s[n] || (s[n] = []), s[n][e] = t[e][n];
                            return s
                        },
                        parsed: function() {
                            if (this.options.parsed) return this.options.parsed.call(this, this.columns)
                        },
                        getFreeIndexes: function(t, e) {
                            var i, n, r = [],
                                s = [];
                            for (i = 0; i < t; i += 1) r.push(!0);
                            for (t = 0; t < e.length; t += 1)
                                for (n = e[t].getReferencedColumnIndexes(), i = 0; i < n.length; i += 1) r[n[i]] = !1;
                            for (i = 0; i < r.length; i += 1) r[i] && s.push(i);
                            return s
                        },
                        complete: function() {
                            var t, i, n, r, s, o, l = this.columns,
                                h = this.options,
                                c = [];
                            if (h.complete || h.afterComplete) {
                                for (r = 0; r < l.length; r++) this.firstRowAsNames && (l[r].name = l[r].shift());
                                for (r = 0, i = [], n = this.getFreeIndexes(l.length, this.valueCount.seriesBuilders); r < this.valueCount.seriesBuilders.length; r++)(o = this.valueCount.seriesBuilders[r]).populateColumns(n) && c.push(o);
                                for (; 0 < n.length;) {
                                    for ((o = new e).addColumnReader(0, "x"), -1 !== (r = a(0, n)) && n.splice(r, 1), r = 0; r < this.valueCount.global; r++) o.addColumnReader(void 0, this.valueCount.globalPointArrayMap[r]);
                                    o.populateColumns(n) && c.push(o)
                                }
                                if (0 < c.length && 0 < c[0].readers.length && void 0 !== (o = l[c[0].readers[0].columnIndex]) && (o.isDatetime ? t = "datetime" : o.isNumeric || (t = "category")), "category" === t)
                                    for (r = 0; r < c.length; r++)
                                        for (o = c[r], n = 0; n < o.readers.length; n++) "x" === o.readers[n].configName && (o.readers[n].configName = "name");
                                for (r = 0; r < c.length; r++) {
                                    for (s = 0, o = c[r], n = []; s < l[0].length; s++) n[s] = o.read(l, s);
                                    i[r] = {
                                        data: n
                                    }, o.name && (i[r].name = o.name), "category" === t && (i[r].turboThreshold = 0)
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
                    }, t.wrap(t.Chart.prototype, "init", function(e, i, n) {
                        var s = this;
                        i && i.data ? t.data(t.extend(i.data, {
                            afterComplete: function(o) {
                                var a, l;
                                if (i.hasOwnProperty("series"))
                                    if ("object" === r._(i.series))
                                        for (a = Math.max(i.series.length, o.series.length); a--;) l = i.series[a] || {}, i.series[a] = t.merge(l, o.series[a]);
                                    else delete i.series;
                                i = t.merge(o, i), e.call(s, i, n)
                            }
                        }), i) : e.call(s, i, n)
                    }), (e = function() {
                        this.readers = [], this.pointIsArray = !0
                    }).prototype.populateColumns = function(t) {
                        var e = !0;
                        return n(this.readers, function(e) {
                            void 0 === e.columnIndex && (e.columnIndex = t.shift())
                        }), n(this.readers, function(t) {
                            void 0 === t.columnIndex && (e = !1)
                        }), e
                    }, e.prototype.read = function(t, e) {
                        var i, r = this.pointIsArray,
                            s = r ? [] : {};
                        return n(this.readers, function(i) {
                            var n = t[i.columnIndex][e];
                            r ? s.push(n) : s[i.configName] = n
                        }), void 0 === this.name && 2 <= this.readers.length && 2 <= (i = this.getReferencedColumnIndexes()).length && (i.shift(), i.sort(), this.name = t[i.shift()].name), s
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
                }, "object" === r._(t) && t.exports ? t.exports = n : n(Highcharts)
            }
        },
        e = {};

    function i(n) {
        var r = e[n];
        if (void 0 !== r) return r.exports;
        var s = e[n] = {
            id: n,
            loaded: !1,
            exports: {}
        };
        return t[n].call(s.exports, s, s.exports, i), s.loaded = !0, s.exports
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
            for (var n in e) i.o(e, n) && !i.o(t, n) && Object.defineProperty(t, n, {
                enumerable: !0,
                get: e[n]
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
            var t, e, n, r, s = window.ReactJSX,
                o = window.React,
                a = i.n(o),
                l = window.Roblox["core-scripts"].util.ready,
                h = i.n(l),
                c = window.Roblox["core-scripts"].react;

            function d(t, e, i) {
                return e in t ? Object.defineProperty(t, e, {
                    value: i,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[e] = i, t
            }

            function u(t) {
                for (var e = 1; e < arguments.length; e++) {
                    var i = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(i);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(i).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(i, t).enumerable
                    }))), n.forEach(function(e) {
                        d(t, e, i[e])
                    })
                }
                return t
            }

            function p(t, e) {
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

            function f(t, e) {
                (null == e || e > t.length) && (e = t.length);
                for (var i = 0, n = Array(e); i < e; i++) n[i] = t[i];
                return n
            }

            function g(t, e) {
                if (t) {
                    if ("string" == typeof t) return f(t, e);
                    var i = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === i && t.constructor && (i = t.constructor.name), "Map" === i || "Set" === i) return Array.from(i);
                    if ("Arguments" === i || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(i)) return f(t, e)
                }
            }

            function m(t, e) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, e) {
                    var i, n, r = null == t ? null : "u" > typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != r) {
                        var s = [],
                            o = !0,
                            a = !1;
                        try {
                            for (r = r.call(t); !(o = (i = r.next()).done) && (s.push(i.value), !e || s.length !== e); o = !0);
                        } catch (t) {
                            a = !0, n = t
                        } finally {
                            try {
                                o || null == r.return || r.return()
                            } finally {
                                if (a) throw n
                            }
                        }
                        return s
                    }
                }(t, e) || g(t, e) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function v(t) {
                return function(t) {
                    if (Array.isArray(t)) return f(t)
                }(t) || function(t) {
                    if ("u" > typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || g(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var y = i(611),
                x = i.n(y),
                b = window.ReactUtilities,
                w = window.Roblox,
                k = window.Roblox["core-scripts"].meta.user,
                S = [30, 90, 180],
                M = "Label.NotAvailable",
                C = "Message.TakeOffSaleFailure",
                T = {
                    resellersList: "resellersList"
                },
                A = {
                    buyBtn: "buyBtn",
                    tradeBtn: "tradeBtn",
                    upgradeBtn: "upgradeBtn",
                    nonPremiumTradeBtn: "nonPremiumTradeBtn"
                },
                P = {
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
                L = {
                    priceChart: "priceChart",
                    resellers: "resellers",
                    inventory: "inventory"
                },
                I = "angular-to-react-purchase-event",
                O = "limited-reseller-list",
                D = {
                    common: ["Feature.PrivateSales", "Feature.Item", "Feature.Profile", "Feature.Trades", "Feature.Premium"],
                    feature: "Feature.Catalog"
                },
                E = window.CoreUtilities,
                N = window.Roblox["core-scripts"].environmentUrls,
                R = i.n(N),
                B = {
                    getResaleData: function(t) {
                        return {
                            url: "".concat(R().economyApi, "/v1/assets/").concat(t, "/resale-data"),
                            withCredentials: !0
                        }
                    },
                    getCanTradeWith: function(t) {
                        return {
                            url: "".concat(R().tradesApi, "/v1/users/").concat(t, "/can-trade-with"),
                            withCredentials: !0
                        }
                    },
                    postItemDetails: {
                        url: "".concat(R().catalogApi, "/v1/catalog/items/details"),
                        withCredentials: !0
                    },
                    postMarketplaceItemDetails: {
                        url: "".concat(R().apiGatewayUrl, "/marketplace-items/v1/items/details"),
                        withCredentials: !0
                    },
                    getResellersForLimited2Item: function(t) {
                        return {
                            url: "".concat(R().apiGatewayUrl, "/marketplace-sales/v1/item/").concat(t, "/resellers"),
                            withCredentials: !0
                        }
                    },
                    placeLimited2ItemOnSale: function(t, e) {
                        return {
                            url: "".concat(R().apiGatewayUrl, "/marketplace-sales/v1/item/").concat(t, "/instance/").concat(e, "/resale"),
                            withCredentials: !0
                        }
                    },
                    getResaleDataForLimited2Item: function(t) {
                        return {
                            url: "".concat(R().apiGatewayUrl, "/marketplace-sales/v1/item/").concat(t, "/resale-data"),
                            withCredentials: !0
                        }
                    }
                },
                z = function(t, e, i) {
                    var n;
                    return E.httpService.patch(B.placeLimited2ItemOnSale(t, null != (n = e.collectibleItemInstanceId) ? n : ""), {
                        price: void 0,
                        isOnSale: !1,
                        sellerId: i,
                        sellerType: "User",
                        collectibleProductId: e.collectibleProductId
                    })
                },
                j = i(573),
                G = i.n(j),
                W = i(726),
                H = i.n(W),
                F = P.itemDelimiter,
                X = P.lineDelimiter,
                Y = function(t) {
                    var e = new Date;
                    return e.setDate(e.getDate() - t), e.getTime()
                },
                V = function(t) {
                    return {
                        csv: "col".concat(F, "row").concat(X).concat(v(t).reverse().map(function(t) {
                            return "".concat(new Date(t.date).getTime()).concat(F).concat(t.value)
                        }).join(X)).concat(X),
                        itemDelimiter: F,
                        lineDelimiter: X
                    }
                };
            H()(G());
            var U = function(t) {
                    var e = t.id,
                        i = t.className,
                        n = t.days,
                        r = t.buildConfig,
                        a = (0, o.useRef)(null),
                        l = (0, o.useRef)(null),
                        h = (0, o.useRef)(r);
                    return h.current = r, (0, o.useEffect)(function() {
                        if (a.current) {
                            var t = h.current();
                            return l.current = new(G()).Chart(p(u({}, t), {
                                    chart: p(u({}, t.chart), {
                                        renderTo: a.current
                                    })
                                })),
                                function() {
                                    var t;
                                    null == (t = l.current) || t.destroy(), l.current = null
                                }
                        }
                    }, []), (0, o.useEffect)(function() {
                        var t, e;
                        null == (e = l.current) || null == (t = e.xAxis[0]) || t.update({
                            min: Y(n)
                        })
                    }, [n]), (0, s.jsx)("div", {
                        id: e,
                        className: i,
                        ref: a
                    })
                },
                _ = new Date().getTime(),
                K = function(t) {
                    return {
                        chart: {
                            backgroundColor: P.colors.backgroundColor,
                            marginLeft: P.marginLeft
                        },
                        title: {
                            text: ""
                        },
                        legend: {
                            enabled: !1
                        },
                        tooltip: {
                            backgroundColor: P.colors.borderColor,
                            borderColor: P.colors.borderColor,
                            pointFormat: '<span style="color:'.concat(P.colors.pointColor, '">{point.y}</span>'),
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
                q = function(t, e) {
                    var i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : _,
                        n = K(i);
                    return n.colors = [P.colors.lineColor], n.chart.height = P.lineChartHeight, n.data = V(t), n.xAxis.min = Y(e), n.xAxis.labels = {
                        format: "{value:%m/%d}"
                    }, n.yAxis = {
                        title: {
                            text: ""
                        },
                        labels: {
                            formatter: function() {
                                return E.abbreviateNumber.getAbbreviatedValue(this.value, void 0, 1e3)
                            }
                        }
                    }, n
                },
                Z = function(t, e) {
                    var i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : _,
                        n = K(i);
                    return n.chart.type = "column", n.colors = [P.colors.verticalBarColor], n.chart.height = P.verticalBarChartHeight, n.data = V(t), n.xAxis.min = Y(e), n.xAxis.labels = {
                        enabled: !1
                    }, n.yAxis = {
                        gridLineWidth: 0,
                        minorGridLineWidth: 0,
                        title: {
                            text: ""
                        },
                        labels: {
                            enabled: !1
                        }
                    }, n.plotOptions = {
                        series: {
                            pointWidth: 1
                        }
                    }, n
                },
                $ = function(t) {
                    var e = t.chartDataPoints,
                        i = t.days,
                        n = (0, o.useRef)("line_chart_".concat(new Date().getTime())),
                        r = (0, o.useRef)(i),
                        a = (0, o.useCallback)(function() {
                            return q(e, r.current)
                        }, [e]);
                    return (0, s.jsx)(U, {
                        id: n.current,
                        days: i,
                        buildConfig: a
                    })
                },
                J = function(t) {
                    var e = t.chartDataPoints,
                        i = t.days,
                        n = (0, o.useRef)("vertical_bar_chart_".concat(new Date().getTime())),
                        r = (0, o.useRef)(i),
                        a = (0, o.useCallback)(function() {
                            return Z(e, r.current)
                        }, [e]);
                    return (0, s.jsx)(U, {
                        id: n.current,
                        days: i,
                        buildConfig: a
                    })
                },
                Q = function(t) {
                    var e = t.dayOptions,
                        i = t.selectedDays,
                        n = t.onSelect,
                        r = t.formatDays,
                        a = m((0, o.useState)(!1), 2),
                        l = a[0],
                        h = a[1],
                        c = (0, o.useRef)(null);
                    return (0, o.useEffect)(function() {
                        var t = function(t) {
                            var e = t.target;
                            c.current && !c.current.contains(e) && h(!1)
                        };
                        return document.addEventListener("mousedown", t),
                            function() {
                                document.removeEventListener("mousedown", t)
                            }
                    }, []), (0, s.jsxs)("div", {
                        ref: c,
                        className: x()("input-group-btn", "price-chart-range-dropdown", {
                            open: l
                        }),
                        children: [(0, s.jsxs)("button", {
                            type: "button",
                            className: "input-dropdown-btn",
                            "aria-haspopup": "true",
                            "aria-expanded": l ? "true" : "false",
                            onClick: function() {
                                h(!l)
                            },
                            children: [(0, s.jsx)("span", {
                                className: "rbx-selection-label",
                                children: r(i)
                            }), (0, s.jsx)("span", {
                                className: "icon-down-16x16"
                            })]
                        }), (0, s.jsx)("ul", {
                            className: "dropdown-menu",
                            role: "menu",
                            style: {
                                display: l ? "block" : "none"
                            },
                            children: e.map(function(t) {
                                return (0, s.jsx)("li", {
                                    children: (0, s.jsx)("button", {
                                        type: "button",
                                        onClick: function() {
                                            n(t), h(!1)
                                        },
                                        children: r(t)
                                    })
                                }, t)
                            })
                        })]
                    })
                },
                tt = function(t, e) {
                    return null != t && t > 0 ? E.numberFormat.getNumberFormat(t) : e
                },
                te = function(t, e) {
                    return null == t ? e : t >= 0 ? E.numberFormat.getNumberFormat(t) : e
                },
                ti = function(t, e) {
                    var i, n, r, s, o, a, l, h;
                    return e ? (null != (i = null == (a = t.priceDataPoints) ? void 0 : a.length) ? i : 0) > 0 || (null != (n = null == (l = t.volumeDataPoints) ? void 0 : l.length) ? n : 0) > 0 || (null != (r = t.recentAveragePrice) ? r : -1) >= 0 || (null != (s = t.originalPrice) ? s : -1) >= 0 || (null != (o = t.sales) ? o : -1) >= 0 : (null != (h = t.recentAveragePrice) ? h : 0) > 0
                },
                tn = (0, b.withTranslations)(function(t) {
                    var e, i, n, r, l, h, c = t.resaleData,
                        d = t.isLimited2,
                        u = t.translate,
                        p = u(M),
                        f = m((0, o.useState)(S[S.length - 1]), 2),
                        g = f[0],
                        v = f[1],
                        y = (0, o.useRef)({
                            chartDataAvailable: (null != (e = null == (l = c.priceDataPoints) ? void 0 : l.length) ? e : 0) > 0 && (null != (i = null == (h = c.volumeDataPoints) ? void 0 : h.length) ? i : 0) > 0,
                            historicalDataAvailable: ti(c, d)
                        }).current,
                        x = y.chartDataAvailable,
                        b = y.historicalDataAvailable,
                        w = d ? te : tt;
                    return b ? (0, s.jsxs)("div", {
                        className: "section-content price-volume-charts-container",
                        children: [x && (0, s.jsxs)(a().Fragment, {
                            children: [(0, s.jsx)(Q, {
                                dayOptions: S,
                                selectedDays: g,
                                onSelect: v,
                                formatDays: function(t) {
                                    return u("Label.XDays", {
                                        numberOfDays: t
                                    })
                                }
                            }), (0, s.jsxs)("div", {
                                className: "price-chart-legend",
                                children: [(0, s.jsx)("div", {
                                    className: "line"
                                }), (0, s.jsx)("div", {
                                    className: "text-pastname legend-text",
                                    children: u("Label.RecentAveragePrice")
                                }), (0, s.jsx)("div", {
                                    className: "line volume"
                                }), (0, s.jsx)("div", {
                                    className: "text-pastname legend-text",
                                    children: u("Label.Volume")
                                })]
                            }), (0, s.jsx)($, {
                                chartDataPoints: null != (n = c.priceDataPoints) ? n : [],
                                days: g
                            }), (0, s.jsx)(J, {
                                chartDataPoints: null != (r = c.volumeDataPoints) ? r : [],
                                days: g
                            })]
                        }), (0, s.jsxs)("div", {
                            className: "clearfix",
                            children: [(0, s.jsxs)("div", {
                                className: "price-chart-info-container clearfix",
                                children: [(0, s.jsx)("div", {
                                    className: "text-label",
                                    children: u("Label.QuantitySold")
                                }), (0, s.jsx)("div", {
                                    id: "item-quantity-sold",
                                    className: "text-lead info-content",
                                    children: w(c.sales, p)
                                })]
                            }), (0, s.jsxs)("div", {
                                className: "price-chart-info-container clearfix",
                                children: [(0, s.jsx)("div", {
                                    className: "text-label",
                                    children: u("Label.OriginalPrice")
                                }), (0, s.jsxs)("div", {
                                    id: "item-original-price",
                                    className: "info-content",
                                    children: [(0, s.jsx)("span", {
                                        id: "original-price-robux-icon",
                                        className: "icon-robux-20x20"
                                    }), (0, s.jsx)("span", {
                                        className: "text-robux",
                                        children: w(c.originalPrice, p)
                                    })]
                                })]
                            }), (0, s.jsxs)("div", {
                                className: "price-chart-info-container clearfix",
                                children: [(0, s.jsx)("div", {
                                    className: "text-label",
                                    children: u("Label.AveragePrice")
                                }), (0, s.jsxs)("div", {
                                    className: "info-content",
                                    children: [(0, s.jsx)("span", {
                                        className: "icon-robux-20x20"
                                    }), (0, s.jsx)("span", {
                                        id: "item-average-price",
                                        className: "text-robux",
                                        children: w(c.recentAveragePrice, p)
                                    })]
                                })]
                            })]
                        })]
                    }) : (0, s.jsx)("div", {
                        id: "no-price-chart-data",
                        className: "section-content-off",
                        children: u("Label.NoHistoricalData")
                    })
                }, D);

            function tr(t, e, i, n, r, s, o) {
                try {
                    var a = t[s](o),
                        l = a.value
                } catch (t) {
                    i(t);
                    return
                }
                a.done ? e(l) : Promise.resolve(l).then(n, r)
            }

            function ts(t) {
                return function() {
                    var e = this,
                        i = arguments;
                    return new Promise(function(n, r) {
                        var s = t.apply(e, i);

                        function o(t) {
                            tr(s, n, r, o, a, "next", t)
                        }

                        function a(t) {
                            tr(s, n, r, o, a, "throw", t)
                        }
                        o(void 0)
                    })
                }
            }

            function to(t, e) {
                var i, n, r, s = {
                        label: 0,
                        sent: function() {
                            if (1 & r[0]) throw r[1];
                            return r[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    a = Object.defineProperty;
                return a(o, "next", {
                    value: l(0)
                }), a(o, "throw", {
                    value: l(1)
                }), a(o, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && a(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function l(a) {
                    return function(l) {
                        var h = [a, l];
                        if (i) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, h[0] && (s = 0)), s;) try {
                            if (i = 1, n && (r = 2 & h[0] ? n.return : h[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, h[1])).done) return r;
                            switch (n = 0, r && (h = [2 & h[0], r.value]), h[0]) {
                                case 0:
                                case 1:
                                    r = h;
                                    break;
                                case 4:
                                    return s.label++, {
                                        value: h[1],
                                        done: !1
                                    };
                                case 5:
                                    s.label++, n = h[1], h = [0];
                                    continue;
                                case 7:
                                    h = s.ops.pop(), s.trys.pop();
                                    continue;
                                default:
                                    if (!(r = (r = s.trys).length > 0 && r[r.length - 1]) && (6 === h[0] || 2 === h[0])) {
                                        s = 0;
                                        continue
                                    }
                                    if (3 === h[0] && (!r || h[1] > r[0] && h[1] < r[3])) {
                                        s.label = h[1];
                                        break
                                    }
                                    if (6 === h[0] && s.label < r[1]) {
                                        s.label = r[1], r = h;
                                        break
                                    }
                                    if (r && s.label < r[2]) {
                                        s.label = r[2], s.ops.push(h);
                                        break
                                    }
                                    r[2] && s.ops.pop(), s.trys.pop();
                                    continue
                            }
                            h = e.call(t, s)
                        } catch (t) {
                            h = [6, t], n = 0
                        } finally {
                            i = r = 0
                        }
                        if (5 & h[0]) throw h[1];
                        return {
                            value: h[0] ? h[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ta = window.ReactStyleGuide,
                tl = window.CoreRobloxUtilities,
                th = function(t, e, i) {
                    return {
                        url: "".concat(R().apiGatewayUrl, "/product-experimentation-platform/v1/projects/").concat(t, "/layers/").concat(e, "/values?parameters=").concat(i.join(",")),
                        withCredentials: !0
                    }
                },
                tc = ["showResellerTradeButton"],
                td = "AvatarMarketplace.UI",
                tu = "Roblox.AvatarMarketplace.showResellerTradeButton",
                tp = function() {
                    var t = (0, k.isAuthenticated)() && Number((0, k.userId)());
                    return t ? "".concat(tu, ":").concat(t) : null
                },
                tf = function() {
                    var t, e = tp();
                    return e && null != (t = tl.localStorageService.getLocalStorage(e)) ? t : null
                },
                tg = function(t) {
                    var e = tp();
                    e && tl.localStorageService.setLocalStorage(e, t)
                },
                tm = function() {
                    return E.httpService.get(th(1, td, tc))
                },
                tv = window.Roblox["core-scripts"].eventStream,
                ty = window.Roblox["core-scripts"].endpoints,
                tx = window.HeaderScripts,
                tb = i(844),
                tw = function(t, e) {
                    var i = void 0 === t ? "undefined" : (0, tb._)(t),
                        n = void 0 === e ? "undefined" : (0, tb._)(e);
                    return i !== n ? i < n ? -1 : 1 : t === e ? 0 : t < e ? -1 : 1
                },
                tk = window.RobloxThumbnails,
                tS = window.RobloxBadges,
                tM = function(t) {
                    return t.seller.id ? t.seller.id : t.seller.sellerId
                },
                tC = function(t) {
                    var e, i, n, r, o, a = t.resaleRecord,
                        l = t.assetData,
                        h = t.resaleData,
                        c = t.isLimited2,
                        d = t.showResellerTradeButton,
                        u = t.isPremiumUser,
                        p = t.authenticatedUserId,
                        f = t.resellerTradePermissions,
                        g = t.activeUpgradeTradeBtnId,
                        m = t.takeOffSaleDebounce,
                        v = t.onBuy,
                        y = t.onTradeClick,
                        b = t.onUpgradeClick,
                        w = t.onNonPremiumTradeClick,
                        k = t.onTakeOffSale,
                        S = t.getProfilePageUrl,
                        M = t.getUserTradeUrl,
                        C = t.getUpgradeToPremiumUrl,
                        T = t.formatNumber,
                        A = t.translate,
                        P = tM(a),
                        L = P === p,
                        I = !P || null == (e = null == (i = f[P]) ? void 0 : i.isFetching) || e,
                        O = !I && (!!P && (null == (n = f[P]) ? void 0 : n.canTrade) || !1),
                        D = (null == (r = a.discountInformation) ? void 0 : r.originalPrice) !== void 0 && null !== a.discountInformation.originalPrice && void 0 !== a.price && null !== a.price && a.discountInformation.originalPrice > a.price;
                    return (0, s.jsxs)("li", {
                        className: "reseller-item list-item",
                        children: [(0, s.jsx)("a", {
                            className: "list-header reseller-item-avatar",
                            href: S(P),
                            children: (0, s.jsx)("span", {
                                className: "avatar-headshot-md",
                                children: (0, s.jsx)(tk.Thumbnail2d, {
                                    type: tk.ThumbnailTypes.avatarHeadshot,
                                    targetId: null != P ? P : 0
                                })
                            })
                        }), (0, s.jsxs)("div", {
                            className: "resale-info",
                            children: [(0, s.jsxs)("div", {
                                className: "item-reseller-container",
                                children: [(0, s.jsx)("a", {
                                    className: "text-name username",
                                    href: S(P),
                                    children: a.seller.name
                                }), !!a.seller.hasVerifiedBadge && (0, s.jsx)(tS.VerifiedBadgeIconContainer, {
                                    size: tS.BadgeSizes.TITLE,
                                    overrideImgClass: "verified-badge-icon-item-resellers-rendered",
                                    titleText: a.seller.name
                                })]
                            }), (0, s.jsx)("span", {
                                className: "separator",
                                children: "-"
                            }), (0, s.jsx)("span", {
                                className: "font-caption-body serial-number",
                                children: a.serialNumber ? A("Label.SerialNumberOfTotal", {
                                    number: T(a.serialNumber),
                                    total: T(h.assetStock)
                                }) : A("Label.SerialNotAvailable")
                            }), (0, s.jsxs)("div", {
                                className: "reseller-price-container",
                                children: [(0, s.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, s.jsx)("span", {
                                    className: "icon-robux-28x28"
                                }), (0, s.jsx)("span", {
                                    className: "text-robux",
                                    children: T(a.price)
                                }), D && (0, s.jsxs)("span", {
                                    className: "reseller-original-price",
                                    children: [(0, s.jsx)("span", {
                                        className: "icon-robux-16x16"
                                    }), (0, s.jsx)("span", {
                                        children: T(null == (o = a.discountInformation) ? void 0 : o.originalPrice)
                                    })]
                                })]
                            })]
                        }), (0, s.jsxs)("div", {
                            className: x()("reseller-buttons-container", {
                                "has-trade-btn": d
                            }),
                            children: [d && u && (0, s.jsxs)("div", {
                                className: "trade-button-container",
                                children: [!L && (0, s.jsx)("a", {
                                    className: x()("btn-min-width", "btn-control-md", "reseller-trade-link", {
                                        "fetching-trade-permissions": I
                                    }),
                                    href: M(P, a.userAssetId),
                                    "aria-disabled": !O,
                                    onClick: function() {
                                        y(a)
                                    },
                                    children: A("Action.Trade")
                                }), I && (0, s.jsx)("div", {
                                    className: "spinner-circle spinner-no-margin"
                                })]
                            }), d && !u && (0, s.jsxs)("div", {
                                className: "trade-button-container",
                                children: [(0, s.jsxs)("div", {
                                    className: x()("popover", "top", "fade", "in", {
                                        show: g === a.userAssetId
                                    }),
                                    children: [(0, s.jsx)("div", {
                                        className: "arrow"
                                    }), (0, s.jsx)("div", {
                                        className: "popover-inner",
                                        children: (0, s.jsxs)("div", {
                                            className: "popover-content",
                                            children: [(0, s.jsxs)("h3", {
                                                children: [(0, s.jsx)("span", {
                                                    className: "icon-premium-small"
                                                }), (0, s.jsx)("span", {
                                                    children: A("Error.RequiresPremiumMembership")
                                                })]
                                            }), (0, s.jsx)("p", {
                                                children: A("Description.TradeBenefit")
                                            }), (0, s.jsx)("a", {
                                                className: "btn-growth-sm btn-full-width upgrade",
                                                href: C(),
                                                target: "_self",
                                                onClick: function() {
                                                    b(a)
                                                },
                                                children: A("Action.Upgrade")
                                            })]
                                        })
                                    })]
                                }), !L && (0, s.jsx)("button", {
                                    type: "button",
                                    className: "btn-min-width btn-control-md reseller-trade-link",
                                    onClick: function() {
                                        w(a)
                                    },
                                    children: A("Action.Trade")
                                })]
                            }), !L && !c && (0, s.jsx)("button", {
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
                                    v(a)
                                },
                                children: A("Action.Buy")
                            }), !L && c && (0, s.jsx)("button", {
                                type: "button",
                                className: "reseller-purchase-button btn-min-width btn-buy-md",
                                onClick: function() {
                                    v(a)
                                },
                                children: A("Action.Buy")
                            }), L && (0, s.jsx)("button", {
                                type: "button",
                                className: "remove-sale btn-control-md btn-min-width",
                                "data-button-type": "reseller",
                                disabled: !!m[String(a.userAssetId)],
                                onClick: function() {
                                    k(a)
                                },
                                children: A("Action.Remove")
                            })]
                        })]
                    })
                },
                tT = (0, b.withTranslations)(function(t) {
                    var e = t.resaleData,
                        i = t.assetData,
                        n = t.resaleRecords,
                        r = t.resellerTradePermissions,
                        a = t.showResellerTradeButton,
                        l = t.isLimited2,
                        h = t.itemType,
                        c = t.onRecordRemoved,
                        f = t.onTakeOffSaleFailure,
                        g = t.translate,
                        y = g(M),
                        x = m((0, o.useState)(null), 2),
                        b = x[0],
                        w = x[1],
                        S = m((0, o.useState)({}), 2),
                        P = S[0],
                        L = S[1],
                        D = (0, o.useRef)(b);
                    D.current = b;
                    var N = (0, o.useRef)((0, k.isPremiumUser)()).current,
                        R = (0, o.useRef)(Number((0, k.userId)())).current,
                        B = (0, o.useCallback)(function(t) {
                            return null != t && t > 0 ? E.numberFormat.getNumberFormat(t) : y
                        }, [y]),
                        j = (0, o.useCallback)(function(t, e) {
                            var n = [
                                ["assetId", i.id],
                                ["sellerAssetId", t.userAssetId],
                                ["sellerUserId", t.seller.id],
                                ["sellerAssetPrice", t.price],
                                ["btn", e]
                            ].filter(function(t) {
                                return void 0 !== t[1] && null !== t[1]
                            });
                            n.length && (0, tv.sendEventWithTarget)(tv.eventTypes.buttonClick, T.resellersList, Object.fromEntries(n))
                        }, [i.id]),
                        G = (0, o.useCallback)(function(t) {
                            window.dispatchEvent(new CustomEvent(I, {
                                detail: {
                                    identifier: O,
                                    name: i.name,
                                    itemType: h,
                                    assetId: i.id,
                                    productId: i.productId,
                                    assetType: i.type,
                                    expectedCurrency: 1,
                                    expectedPrice: t.price,
                                    expectedPurchaserId: tx.authenticatedUser.id,
                                    expectedPurchaserType: "User",
                                    expectedSellerId: tM(t),
                                    expectedSellerName: t.seller.name,
                                    userAssetId: t.userAssetId,
                                    refreshPage: !0,
                                    resalePurchase: !0
                                }
                            })), j(t, A.buyBtn)
                        }, [i, h, j]),
                        W = (0, o.useCallback)(function(t) {
                            var n = E.uuidService.generateRandomUuid();
                            window.dispatchEvent(new CustomEvent(I, {
                                detail: {
                                    identifier: O,
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
                                    expectedPurchaserId: tx.authenticatedUser.id,
                                    expectedPurchaserType: "User",
                                    expectedSellerId: t.seller.sellerId,
                                    expectedSellerName: t.seller.name,
                                    expectedSellerType: t.seller.sellerType,
                                    idempotencyKey: n,
                                    refreshPage: !0,
                                    resalePurchase: !0
                                }
                            }))
                        }, [i, h, e]),
                        H = (0, o.useCallback)(function(t) {
                            var i, n = function() {
                                    f(g(C))
                                },
                                r = function(t) {
                                    L(function(e) {
                                        var i = u({}, e);
                                        return delete i[t], i
                                    })
                                };
                            if (!l) return void n();
                            var s = String(t.collectibleProductId);
                            L(function(t) {
                                return p(u({}, t), d({}, s, !0))
                            }), z(null != (i = e.collectibleItemId) ? i : "", t, tx.authenticatedUser.id).then(function() {
                                r(s), c(t)
                            }).catch(function() {
                                r(s), n()
                            })
                        }, [i.id, l, c, f, e, g]),
                        F = (0, o.useCallback)(function(t) {
                            var e;
                            D.current === t.userAssetId ? w(null) : (w(null != (e = t.userAssetId) ? e : null), j(t, A.nonPremiumTradeBtn))
                        }, [j]);
                    return (0, o.useEffect)(function() {
                        var t = function(t) {
                            if (D.current) {
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
                    }, []), (0, s.jsx)("ul", {
                        className: "vlist",
                        children: v(n).sort(function(t, e) {
                            return tw(t.price, e.price) || tw(t.userAssetId, e.userAssetId)
                        }).map(function(t) {
                            return (0, s.jsx)(tC, {
                                resaleRecord: t,
                                assetData: i,
                                resaleData: e,
                                isLimited2: l,
                                showResellerTradeButton: a,
                                isPremiumUser: N,
                                authenticatedUserId: R,
                                resellerTradePermissions: r,
                                activeUpgradeTradeBtnId: b,
                                takeOffSaleDebounce: P,
                                onBuy: l ? W : G,
                                onTradeClick: function(t) {
                                    j(t, A.tradeBtn)
                                },
                                onUpgradeClick: function(t) {
                                    j(t, A.upgradeBtn)
                                },
                                onNonPremiumTradeClick: F,
                                onTakeOffSale: H,
                                getProfilePageUrl: function(t) {
                                    return (0, ty.getAbsoluteUrl)("/users/".concat(t, "/profile"))
                                },
                                getUserTradeUrl: function(t, e) {
                                    return (0, ty.getAbsoluteUrl)("/users/".concat(t, "/trade?ritems=").concat(e))
                                },
                                getUpgradeToPremiumUrl: function() {
                                    return (0, ty.getAbsoluteUrl)("/premium/membership?ctx=trade#premium-memberships")
                                },
                                formatNumber: B,
                                translate: g
                            }, l ? String(t.collectibleItemInstanceId) : String(t.userAssetId))
                        })
                    })
                }, D),
                tA = m((0, ta.createSystemFeedback)(), 2),
                tP = tA[0],
                tL = tA[1],
                tI = (0, b.withTranslations)(function(t) {
                    var e = t.resaleData,
                        i = t.assetData,
                        n = t.economyMetadata,
                        r = t.isLimited2,
                        l = t.itemType,
                        h = t.translate,
                        c = m((0, o.useState)([]), 2),
                        d = c[0],
                        p = c[1],
                        f = m((0, o.useState)(!1), 2),
                        g = f[0],
                        y = f[1],
                        x = m((0, o.useState)(!1), 2),
                        b = x[0],
                        w = x[1],
                        k = m((0, o.useState)(!1), 2),
                        S = k[0],
                        M = k[1],
                        C = m((0, o.useState)({}), 2),
                        T = C[0],
                        A = C[1],
                        P = (0, o.useRef)({}),
                        L = (0, o.useRef)({}),
                        I = (0, o.useCallback)(function(t) {
                            return ts(function() {
                                return to(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            var i;
                                            return e.trys.push([0, 2, , 3]), [4, (i = t, E.httpService.get(B.getCanTradeWith(i), {}).then(function(t) {
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
                        O = (0, o.useCallback)(function(t) {
                            return ts(function() {
                                var e, i, n;
                                return to(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (!t.length) return [2];
                                            return e = 5, [4, Promise.all(t.slice(0, e).map(I))];
                                        case 1:
                                            return i = r.sent(), n = {}, i.forEach(function(t) {
                                                var e = t.sellerId,
                                                    i = t.permissions,
                                                    r = t.error;
                                                n[e] = {
                                                    isFetching: !1,
                                                    canTrade: !!(null == i ? void 0 : i.canTrade),
                                                    error: null != r ? r : null
                                                }
                                            }), L.current = u({}, L.current, n), A(L.current), [4, O(t.slice(e))];
                                        case 2:
                                            return r.sent(), [2]
                                    }
                                })
                            })()
                        }, [I]),
                        D = (0, o.useCallback)(function(t) {
                            return ts(function() {
                                var e, i;
                                return to(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (!t.length) return [2];
                                            return e = t.map(function(t) {
                                                var e;
                                                return null == (e = t.seller) ? void 0 : e.id
                                            }).filter(function(t) {
                                                return !!t && !L.current[t]
                                            }), i = {}, e.forEach(function(t) {
                                                L.current[t] || (i[t] = {
                                                    isFetching: !0,
                                                    canTrade: !1
                                                })
                                            }), L.current = u({}, L.current, i), A(L.current), [4, O(e)];
                                        case 1:
                                            return n.sent(), [2]
                                    }
                                })
                            })()
                        }, [O]),
                        N = (0, o.useRef)(new E.CursorPager(10, 100, function(t) {
                            var i, n, r;
                            return e.collectibleItemId ? (i = e.collectibleItemId, n = t.cursor, r = t.count, E.httpService.get(B.getResellersForLimited2Item(i), {
                                cursor: n,
                                limit: r
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
                        R = (0, o.useCallback)(function(t) {
                            y(!1);
                            var e = [];
                            t.forEach(function(t) {
                                var i = String(r ? t.collectibleItemInstanceId : t.userAssetId),
                                    n = P.current[i];
                                if (n) {
                                    n.price = t.price, n.seller = t.seller;
                                    return
                                }
                                P.current[i] = t, e.push(t)
                            }), p(function(t) {
                                return v(t).concat(v(e))
                            }), w(N.current.canLoadNextPage), D(t)
                        }, [D, r]),
                        z = (0, o.useCallback)(function(t) {
                            var e = (null !== E.cursorPaginationConstants && void 0 !== E.cursorPaginationConstants ? E.cursorPaginationConstants : {}).errorType;
                            null != t && t.type && t.type === (null == e ? void 0 : e.pagingParametersChanged) || y(!1)
                        }, []),
                        j = (0, o.useCallback)(function() {
                            y(!0), N.current.loadNextPage().then(R).catch(z)
                        }, [R, z]);
                    (0, o.useEffect)(function() {
                        ts(function() {
                            var t, e, i, n;
                            return to(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        if ("boolean" == typeof(e = tf())) return ts(function() {
                                            var t, e;
                                            return to(this, function(i) {
                                                switch (i.label) {
                                                    case 0:
                                                        return [4, tm()];
                                                    case 1:
                                                        return "boolean" != typeof(null == (e = i.sent()) || null == (t = e.data) ? void 0 : t.showResellerTradeButton) && tg(""), [2]
                                                }
                                            })
                                        })(), [2, e];
                                        return [4, tm()];
                                    case 1:
                                        return "boolean" == typeof(n = null == (i = r.sent()) || null == (t = i.data) ? void 0 : t.showResellerTradeButton) && tg(n), [2, n]
                                }
                            })
                        })().then(function(t) {
                            M(null != t && t)
                        }).catch(function() {}), N.current.loadFirstPage().then(R).catch(z)
                    }, []);
                    var G = (0, o.useCallback)(function(t) {
                            p(function(e) {
                                return e.filter(function(e) {
                                    return e !== t
                                })
                            })
                        }, []),
                        W = (0, o.useCallback)(function(t) {
                            tL.warning(t, 0, 5e3)
                        }, []);
                    return (0, s.jsxs)("div", {
                        className: "remove-panel section-content",
                        children: [(0, s.jsx)(tP, {}), (0, s.jsx)("div", {
                            id: "angular-react-purchase-handoff",
                            "data-identifier": "limited-reseller-list"
                        }), n.purchasingEnabled ? (0, s.jsxs)(a().Fragment, {
                            children: [(0, s.jsxs)("div", {
                                className: "resellers",
                                children: [(0, s.jsx)(tT, {
                                    resaleData: e,
                                    assetData: i,
                                    resaleRecords: d,
                                    resellerTradePermissions: T,
                                    showResellerTradeButton: S,
                                    isLimited2: r,
                                    itemType: l,
                                    onRecordRemoved: G,
                                    onTakeOffSaleFailure: W
                                }), g && (0, s.jsx)("span", {
                                    className: "spinner spinner-default"
                                })]
                            }), b && (0, s.jsx)("button", {
                                className: "btn-control-sm see-more-resellers",
                                type: "button",
                                onClick: j,
                                children: h("Label.SeeMore")
                            }), !g && 0 === d.length && (0, s.jsx)("div", {
                                className: "section-content-off",
                                children: h("Message.NoOneSelling")
                            })]
                        }) : (0, s.jsx)("div", {
                            className: "section-content-off",
                            children: h("Message.EconomyDisabled")
                        })]
                    })
                }, D),
                tO = i(784);

            function tD() {
                return null != r || (r = "".concat(R().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), r
            }
            var tE = function() {},
                tN = function(t, e) {
                    return t << 3 | e
                },
                tR = tN(1, 2),
                tB = tN(2, 2),
                tz = tN(5, 2),
                tj = tN(6, 2),
                tG = tN(8, 2),
                tW = tN(1, 2),
                tH = tN(2, 1),
                tF = tN(3, 0),
                tX = tN(5, 2);
            tN(1, 2), tN(2, 1), tN(3, 0), tN(4, 2), tN(5, 2), tN(6, 0), tN(8, 2);
            var tY = tN(4, 0),
                tV = tN(6, 2),
                tU = tN(7, 2);
            tN(1, 0), tN(2, 2);
            var t_ = tN(1, 2),
                tK = tN(2, 2),
                tq = tN(1, 2);
            tN(1, 2), tN(2, 2), tN(1, 2);
            var tZ = new TextEncoder,
                t$ = function() {
                    var t;

                    function e() {
                        if (!(0, tO._)(this, e)) throw TypeError("Cannot call a class as a function");
                        d(this, "buf", [])
                    }
                    return t = [{
                            key: "writeVarint",
                            value: function(t) {
                                var e = (void 0 === t ? "undefined" : (0, tb._)(t)) === "bigint" ? t : BigInt(Math.trunc(t));
                                for (e < BigInt(0) && (e += BigInt(1) << BigInt(64)); e > BigInt(127);) this.buf.push(128 | Number(e & BigInt(127))), e >>= BigInt(7);
                                this.buf.push(Number(e))
                            }
                        }, {
                            key: "writeString",
                            value: function(t) {
                                var e = tZ.encode(t);
                                this.writeVarint(e.length);
                                var i = !0,
                                    n = !1,
                                    r = void 0;
                                try {
                                    for (var s, o = e[Symbol.iterator](); !(i = (s = o.next()).done); i = !0) {
                                        var a = s.value;
                                        this.buf.push(a)
                                    }
                                } catch (t) {
                                    n = !0, r = t
                                } finally {
                                    try {
                                        i || null == o.return || o.return()
                                    } finally {
                                        if (n) throw r
                                    }
                                }
                            }
                        }, {
                            key: "writeBytes",
                            value: function(t) {
                                this.writeVarint(t.length);
                                var e = !0,
                                    i = !1,
                                    n = void 0;
                                try {
                                    for (var r, s = t[Symbol.iterator](); !(e = (r = s.next()).done); e = !0) {
                                        var o = r.value;
                                        this.buf.push(o)
                                    }
                                } catch (t) {
                                    i = !0, n = t
                                } finally {
                                    try {
                                        e || null == s.return || s.return()
                                    } finally {
                                        if (i) throw n
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
                                var n = e[i];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(t, n.key, n)
                            }
                        }(e.prototype, t), e
                }();

            function tJ(t, e, i) {
                var n = new t$;
                return n.writeVarint(tN(1, 2)), n.writeString(t), n.writeVarint(e), i(n), n.toBytes()
            }

            function tQ(t) {
                var e = new t$;
                if (e.writeVarint(tW), e.writeString(t.name), e.writeVarint(tH), e.writeDouble(t.value), e.writeVarint(tF), e.writeVarint(t.timestampMs), t.attributes && Object.keys(t.attributes).length > 0) {
                    var i = function(t) {
                        var e = new t$,
                            i = !0,
                            n = !1,
                            r = void 0;
                        try {
                            for (var s, o = Object.entries(t)[Symbol.iterator](); !(i = (s = o.next()).done); i = !0) ! function() {
                                var t = m(s.value, 2),
                                    i = t[0],
                                    n = t[1];
                                if ("string" == typeof n) {
                                    var r = tJ(i, tN(2, 2), function(t) {
                                        t.writeString(n)
                                    });
                                    e.writeVarint(tz), e.writeBytes(r)
                                } else if ("boolean" == typeof n) {
                                    var o = tJ(i, tN(2, 0), function(t) {
                                        t.writeVarint(+!!n)
                                    });
                                    e.writeVarint(tj), e.writeBytes(o)
                                } else if ((void 0 === n ? "undefined" : (0, tb._)(n)) === "bigint") {
                                    var a = tJ(i, tN(2, 0), function(t) {
                                        t.writeVarint(n)
                                    });
                                    e.writeVarint(tB), e.writeBytes(a)
                                } else if ("number" == typeof n)
                                    if (Number.isFinite(n))
                                        if (Number.isInteger(n) && n >= -0x80000000 && n <= 0x7fffffff) {
                                            var l = tJ(i, tN(2, 0), function(t) {
                                                t.writeVarint(n)
                                            });
                                            e.writeVarint(tR), e.writeBytes(l)
                                        } else if (Number.isInteger(n)) {
                                    var h = tJ(i, tN(2, 0), function(t) {
                                        t.writeVarint(BigInt(n))
                                    });
                                    e.writeVarint(tB), e.writeBytes(h)
                                } else {
                                    var c = tJ(i, tN(2, 1), function(t) {
                                        t.writeDouble(n)
                                    });
                                    e.writeVarint(tG), e.writeBytes(c)
                                } else {
                                    var d = tJ(i, tN(2, 2), function(t) {
                                        t.writeString(String(n))
                                    });
                                    e.writeVarint(tz), e.writeBytes(d)
                                }
                            }()
                        } catch (t) {
                            n = !0, r = t
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (n) throw r
                            }
                        }
                        return e.toBytes()
                    }(t.attributes);
                    e.writeVarint(tX), e.writeBytes(i)
                }
                return e.toBytes()
            }

            function t0(t, e, i) {
                var n = new t$;
                n.writeVarint(tY), n.writeVarint(i);
                var r = !0,
                    s = !1,
                    o = void 0;
                try {
                    for (var a, l = t[Symbol.iterator](); !(r = (a = l.next()).done); r = !0) {
                        var h = a.value;
                        n.writeVarint(tV), n.writeBytes(h)
                    }
                } catch (t) {
                    s = !0, o = t
                } finally {
                    try {
                        r || null == l.return || l.return()
                    } finally {
                        if (s) throw o
                    }
                }
                var c = !0,
                    d = !1,
                    u = void 0;
                try {
                    for (var p, f = e[Symbol.iterator](); !(c = (p = f.next()).done); c = !0) {
                        var g = p.value;
                        n.writeVarint(tU), n.writeBytes(g)
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
                return n.toBytes()
            }

            function t1(t) {
                var e = new t$;
                e.writeVarint(t_), e.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), e.writeVarint(tK), e.writeBytes(t);
                var i = e.toBytes(),
                    n = new t$;
                return n.writeVarint(tq), n.writeBytes(i), n.toBytes()
            }
            var t2 = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function t3(t) {
                return t2.test(t)
            }
            var t5 = [],
                t9 = !1,
                t6 = !1;

            function t4(t, e) {
                var i, n, r = t.map(function(t) {
                        return {
                            name: t.name,
                            value: t.value,
                            timestampMs: t.timestampMs,
                            attributes: t.attributes
                        }
                    }),
                    s = BigInt(Date.now());
                !0 === e || t6 || "u" > typeof document && "hidden" === document.visibilityState ? (i = t1(t0(r.map(tQ), [], s)).buffer, fetch("".concat(tD()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: i,
                    credentials: "include",
                    keepalive: !0
                }).catch(tE)) : (n = t1(t0(r.map(tQ), [], s)), ts(function() {
                    var t, e, i, r, s, o, a, l, h, c, d, u, p;
                    return to(this, function(f) {
                        switch (f.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: n.buffer,
                                    compressed: !1
                                }];
                                return (e = (t = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(tE), e.close().catch(tE), i = [], [4, (r = t.readable.getReader()).read()];
                            case 1:
                                s = f.sent(), f.label = 2;
                            case 2:
                                if (s.done) return [3, 4];
                                return i.push(s.value), [4, r.read()];
                            case 3:
                                return s = f.sent(), [3, 2];
                            case 4:
                                o = new Uint8Array(i.reduce(function(t, e) {
                                    return t + e.length
                                }, 0)), a = 0, l = !0, h = !1, c = void 0;
                                try {
                                    for (d = i[Symbol.iterator](); !(l = (u = d.next()).done); l = !0) p = u.value, o.set(p, a), a += p.length
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
                                    body: o.buffer,
                                    compressed: !0
                                }]
                        }
                    })
                })()).then(function(t) {
                    var e = t.body,
                        i = t.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return i && (n["Content-Encoding"] = "gzip"), fetch("".concat(tD()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: e,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(tE)
            }

            function t8() {
                var t = !0,
                    e = !1,
                    i = void 0;
                try {
                    for (var n, r = t5[Symbol.iterator](); !(t = (n = r.next()).done); t = !0) {
                        var s = n.value.splice(0);
                        0 !== s.length && t4(s, !0)
                    }
                } catch (t) {
                    e = !0, i = t
                } finally {
                    try {
                        t || null == r.return || r.return()
                    } finally {
                        if (e) throw i
                    }
                }
            }
            var t7 = function(t) {
                var e = t.publish,
                    i = t.captureException,
                    n = t.featureName;

                function r(t, e, r) {
                    if (null != r) {
                        var s = (0, tO._)(r, Error) ? r.name || "Error" : "UnknownError",
                            o = n ? "".concat(n, "_").concat(t) : t;
                        return null == i || i(r, {
                            error_counter: o
                        }), p(u({}, e), {
                            errorType: s
                        })
                    }
                    return e
                }
                return {
                    trackCounter: function() {
                        for (var t = arguments.length, i = Array(t), n = 0; n < t; n++) i[n] = arguments[n];
                        var r = m(i, 2);
                        e(r[0], r[1])
                    },
                    trackError: function() {
                        for (var t = arguments.length, i = Array(t), n = 0; n < t; n++) i[n] = arguments[n];
                        var s = m(i, 3),
                            o = s[0],
                            a = s[1],
                            l = s[2],
                            h = r(o, p(u({}, null != a ? a : {}), {
                                severity: "error"
                            }), l);
                        e(o, h)
                    },
                    trackCriticalError: function() {
                        for (var t = arguments.length, i = Array(t), n = 0; n < t; n++) i[n] = arguments[n];
                        var s = m(i, 3),
                            o = s[0],
                            a = s[1],
                            l = s[2],
                            h = r(o, p(u({}, null != a ? a : {}), {
                                severity: "critical"
                            }), l);
                        e(o, h)
                    }
                }
            }({
                publish: function(t) {
                    var e, i = Math.max(1, 10),
                        n = 250;

                    function r(t, e) {
                        console.error(t, e)
                    }
                    if (!t3(t)) return r('@rbx/web-telemetry: invalid featureName "'.concat(t, '"'), {
                            name: t
                        }),
                        function() {};
                    var s = [];
                    return t5.push(s), t9 || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                            "hidden" === document.visibilityState && t8()
                        }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                            t6 = !0, t8()
                        }), t9 = !0),
                        function(o, a, l) {
                            var h = "".concat(t, "_").concat(o);
                            if (! function(t, e) {
                                    if (!t3(t)) return !1;
                                    if (e) {
                                        var i = !0,
                                            n = !1,
                                            r = void 0;
                                        try {
                                            for (var s, o = Object.keys(e)[Symbol.iterator](); !(i = (s = o.next()).done); i = !0) {
                                                var a = s.value;
                                                if (!t3(a)) return !1
                                            }
                                        } catch (t) {
                                            n = !0, r = t
                                        } finally {
                                            try {
                                                i || null == o.return || o.return()
                                            } finally {
                                                if (n) throw r
                                            }
                                        }
                                    }
                                    return !0
                                }(h, a)) return void r("@rbx/web-telemetry: invalid event name or attribute key", {
                                name: o,
                                attributes: a
                            });
                            var c = null != l ? l : 1;
                            if (!Number.isFinite(c)) return void r("@rbx/web-telemetry: value must be a finite number", {
                                name: o,
                                attributes: a
                            });
                            var d = a && Object.keys(a).length > 0 ? a : void 0;
                            s.push({
                                name: h,
                                attributes: d,
                                value: c,
                                timestampMs: BigInt(Date.now())
                            }), s.length >= i ? (void 0 !== e && (clearTimeout(e), e = void 0), t4(s.splice(0, i))) : void 0 === e && (e = setTimeout(function() {
                                for (e = void 0; s.length > 0;) t4(s.splice(0, i))
                            }, n))
                        }
                }("Catalog"),
                captureException: function(t, e) {
                    var i;
                    console.error(t, e), null == (i = "u" < typeof window ? void 0 : window.Sentry) || i.captureException(t, e ? {
                        extra: e
                    } : void 0)
                }
            });
            t7.trackCounter;
            var et = t7.trackError;
            t7.trackCriticalError;
            var ee = function(t) {
                    var e, i = null != (e = t.itemRestrictions) ? e : [];
                    return i.indexOf("Collectible") > -1 || i.indexOf("Limited") > -1 || i.indexOf("LimitedUnique") > -1
                },
                ei = (0, b.withTranslations)(function(t) {
                    var e = t.assetId,
                        i = t.isBundle,
                        n = t.assetData,
                        r = t.economyMetadata,
                        a = t.translate,
                        l = !0 === i ? "bundle" : "asset",
                        h = m((0, o.useState)(void 0), 2),
                        c = h[0],
                        d = h[1],
                        f = m((0, o.useState)(void 0), 2),
                        g = f[0],
                        y = f[1],
                        b = m((0, o.useState)(!1), 2),
                        S = b[0],
                        M = b[1],
                        C = m((0, o.useState)(void 0), 2),
                        T = C[0],
                        A = C[1],
                        P = m((0, o.useState)(!1), 2),
                        I = P[0],
                        O = P[1],
                        D = m((0, o.useState)(!1), 2),
                        N = D[0],
                        R = D[1],
                        z = m((0, o.useState)(L.priceChart), 2),
                        j = z[0],
                        G = z[1],
                        W = (0, o.useRef)((0, k.isAuthenticated)() ? {
                            id: Number((0, k.userId)())
                        } : null).current,
                        H = (0, o.useRef)(!1),
                        F = (0, o.useRef)(void 0),
                        X = (0, o.useRef)(void 0),
                        Y = (0, o.useCallback)(function() {
                            if (!H.current) {
                                H.current = !0, O(!0), R(!1);
                                var t, i = function() {
                                    H.current = !1, O(!1)
                                };
                                if (X.current) {
                                    var n = X.current;
                                    w.ItemDetailsHydrationService.getItemDetails([{
                                        id: e,
                                        itemType: l
                                    }], void 0, !0).then(function(t) {
                                        var e, r, s, o, a = null == (s = t[0]) ? void 0 : s.collectibleItemDetails,
                                            l = {
                                                assetStock: null == a ? void 0 : a.assetStock,
                                                assetType: w.AvatarAccoutrementService.getAssetTypeNameById(null != (r = null == (o = F.current) ? void 0 : o.assetType) ? r : 0),
                                                collectibleItemId: n,
                                                sales: null == a ? void 0 : a.sales,
                                                originalPrice: null == a ? void 0 : a.price
                                            };
                                        return (e = n, E.httpService.get(B.getResaleDataForLimited2Item(e), {}).then(function(t) {
                                            return t.data
                                        })).then(function(t) {
                                            y(p(u({}, l), {
                                                priceDataPoints: t.priceDataPoints,
                                                volumeDataPoints: t.volumeDataPoints,
                                                recentAveragePrice: t.recentAveragePrice
                                            })), i()
                                        }).catch(function(t) {
                                            et("ResaleDataLoadFailed", null, t), y(void 0), R(!0), i()
                                        })
                                    }).catch(function(t) {
                                        et("ResaleDataLoadFailed", null, t), y(void 0), R(!0), i()
                                    });
                                    return
                                }(t = e, E.httpService.get(B.getResaleData(t), {}).then(function(t) {
                                    return t.data
                                })).then(function(t) {
                                    y(t), i()
                                }).catch(function(t) {
                                    et("ResaleDataLoadFailed", null, t), y(void 0), R(!0), i()
                                })
                            }
                        }, [e, l]);
                    if ((0, o.useEffect)(function() {
                            w.ItemDetailsHydrationService.getItemDetails([{
                                id: e,
                                itemType: l
                            }], void 0, !0).then(function(t) {
                                var e, i = t[0];
                                i && ee(i) ? (d(!0), F.current = i, i.collectibleItemId && (A(null == (e = i.collectibleItemDetails) ? void 0 : e.resaleRestriction), M(!0), X.current = i.collectibleItemId, G(L.inventory)), Y()) : d(!1)
                            }).catch(function(t) {
                                et("ResaleDataLoadFailed", null, t), R(!0), H.current = !1, O(!1)
                            })
                        }, []), !c) return (0, s.jsx)("div", {
                        className: "rbx-tabs-horizontal resale-pricechart-tabs"
                    });
                    var V = function(t) {
                        return x()("tab-pane", {
                            active: t === j
                        })
                    };
                    return (0, s.jsx)("div", {
                        className: "rbx-tabs-horizontal resale-pricechart-tabs",
                        children: (0, s.jsxs)("div", {
                            children: [!!g && !!W && (0, s.jsxs)("div", {
                                children: [(0, s.jsx)("ul", {
                                    id: "horizontal-tabs",
                                    className: "nav nav-tabs",
                                    role: "tablist",
                                    children: [{
                                        tab: L.inventory,
                                        label: "Label.YourInventory"
                                    }, {
                                        tab: L.priceChart,
                                        label: "Heading.PriceChart"
                                    }].concat(v(S && 2 !== T ? [{
                                        tab: L.resellers,
                                        label: "Heading.Resellers"
                                    }] : [])).map(function(t) {
                                        var e = t.tab,
                                            i = t.label;
                                        return (0, s.jsx)("li", {
                                            className: x()("rbx-tab", {
                                                active: e === j
                                            }),
                                            children: (0, s.jsx)("button", {
                                                type: "button",
                                                className: "rbx-tab-heading",
                                                role: "tab",
                                                "aria-selected": e === j,
                                                onClick: function() {
                                                    G(e)
                                                },
                                                children: (0, s.jsx)("span", {
                                                    className: "text-lead",
                                                    children: a(i)
                                                })
                                            })
                                        }, e)
                                    })
                                }), (0, s.jsxs)("div", {
                                    className: "tab-content rbx-tab-content",
                                    children: [(0, s.jsxs)("div", {
                                        id: "price-chart",
                                        className: x()(V(L.priceChart), "price-chart-section"),
                                        children: [(0, s.jsx)("div", {
                                            className: "container-header",
                                            children: (0, s.jsx)("h2", {
                                                children: a("Heading.PriceChart")
                                            })
                                        }), (0, s.jsx)(tn, {
                                            resaleData: g,
                                            isLimited2: S
                                        })]
                                    }), (0, s.jsx)("div", {
                                        id: "item-details-limited-inventory-container",
                                        className: V(L.inventory),
                                        "data-target-id": e,
                                        "data-is-bundle": String(!!i)
                                    }), S && 2 !== T && (0, s.jsxs)("div", {
                                        id: "resellers",
                                        className: x()(V(L.resellers), "resellers-container"),
                                        children: [(0, s.jsx)("div", {
                                            className: "container-header",
                                            children: (0, s.jsx)("h2", {
                                                children: a("Heading.Resellers")
                                            })
                                        }), (0, s.jsx)(tI, {
                                            resaleData: g,
                                            assetData: n,
                                            economyMetadata: r,
                                            isLimited2: S,
                                            itemType: l
                                        })]
                                    })]
                                })]
                            }), !!g && !W && (0, s.jsxs)("div", {
                                className: "tab-content rbx-tab-content",
                                children: [(0, s.jsx)("div", {
                                    className: "container-header",
                                    children: (0, s.jsx)("h2", {
                                        children: a("Heading.PriceChart")
                                    })
                                }), (0, s.jsx)(tn, {
                                    resaleData: g
                                })]
                            }), I && (0, s.jsx)("div", {
                                className: "section-content price-chart-spinner",
                                children: (0, s.jsx)("span", {
                                    className: "spinner spinner-default"
                                })
                            }), N && (0, s.jsxs)("div", {
                                className: "section-content-off",
                                children: [(0, s.jsx)("span", {
                                    children: a("Label.ResaleDataLoadFailure")
                                }), (0, s.jsx)("button", {
                                    type: "button",
                                    className: "refresh-link-icon",
                                    onClick: Y
                                })]
                            })]
                        })
                    })
                }, D),
                en = window.RobloxItemPurchase,
                er = window.Roblox["core-scripts"].meta.device,
                es = globalThis.window,
                eo = void 0 === es ? void 0 : es,
                ea = window.Roblox["core-lib"].http.index,
                el = window.Roblox["core-lib"].url.index,
                eh = function() {
                    return el.Url.parse(R().metricsApi).getOrThrow().withPath("/v1/games/report-event")
                },
                ec = function(t, e, i) {
                    try {
                        ea.postUntyped(t().withSearchParams(u({
                            name: e
                        }, i)), "", {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e4)
                        })
                    } catch (t) {}
                },
                ed = function() {
                    for (var t = arguments.length, e = Array(t), i = 0; i < t; i++) e[i] = arguments[i];
                    e.forEach(function(t) {
                        ec(eh, t)
                    })
                },
                eu = ((t = {})[t.View = 0] = "View", t[t.Click = 1] = "Click", t[t.Error = 2] = "Error", t),
                ep = ((e = {})[e.Web = 0] = "Web", e[e.MobileWeb = 1] = "MobileWeb", e),
                ef = function() {
                    var t = (0, er.getDeviceMeta)();
                    return !!(null == t ? void 0 : t.isPhone) || !!(null == t ? void 0 : t.isTablet) || (null == t ? void 0 : t.deviceType) === "phone"
                },
                eg = function() {
                    try {
                        return !!(null == eo ? void 0 : eo.sessionStorage.getItem("AXAnalyticsDebugLogging"))
                    } catch (t) {
                        return !1
                    }
                },
                em = function(t) {
                    var e = t.itemName,
                        i = t.counterName,
                        n = t.metaData,
                        r = t.actionType,
                        s = void 0 === r ? eu.View : r,
                        o = t.excludeCounter,
                        a = t.excludeTelemetry,
                        l = eg(),
                        h = ef(),
                        c = "AXTracking_".concat(h ? "Mweb" : "Web");
                    if (!(void 0 !== o && o)) {
                        var d = i ? "".concat(c, "_").concat(i) : "".concat(c, "_").concat(e);
                        ed(d), l && console.log("AXAnalyticsService.sendCounter", d)
                    }
                    if (!(void 0 !== a && a)) {
                        var p = u({
                            item_name: e,
                            action_type: s,
                            platform: h ? ep.MobileWeb : ep.Web
                        }, n);
                        (0, tv.sendEventWithTarget)("userJourneyAction", "RobloxWWW", p), l && console.log("AXAnalyticsService.sendEvent", p)
                    }
                },
                ev = u({}, {
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
                ey = ((n = {}).ItemDetailsPage = "ItemDetailsPage", n.ShoppingCart = "ShoppingCart", n.LookDetails = "LookDetails", n.CurrentWearing = "CurrentWearing", n.DirectResale = "DirectResale", n.AvatarEditorExpiredItems = "AvatarEditorExpiredItems", n),
                ex = function(t, e) {
                    t && em({
                        itemName: t,
                        actionType: eu.Click,
                        metaData: e ? {
                            metaData: JSON.stringify(e)
                        } : void 0
                    })
                },
                eb = function(t, e) {
                    ex(ev.PurchaseButtonClick, u({
                        source: t
                    }, e))
                },
                ew = m((0, en.createItemPurchase)(), 2),
                ek = ew[0],
                eS = ew[1],
                eM = (0, b.withTranslations)(function(t) {
                    var e = t.identifier,
                        i = t.translate,
                        n = m((0, o.useState)(), 2),
                        r = n[0],
                        l = n[1],
                        h = m((0, o.useState)(), 2),
                        c = h[0],
                        d = h[1],
                        p = m((0, ta.createSystemFeedback)(), 2),
                        f = p[0];
                    p[1];
                    var g = function(t) {
                        t ? window.location.reload() : window.dispatchEvent(new CustomEvent("navigation-update-user-currency"))
                    };
                    return (0, o.useEffect)(function() {
                        window.addEventListener("angular-to-react-purchase-event", function(t) {
                            var e, n = t.detail;
                            eb(ey.DirectResale, {
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
                                userId: null != (e = (0, k.userId)()) ? e : void 0
                            }), l((d(n.identifier), {
                                translate: i,
                                productId: n.productId,
                                expectedPrice: n.expectedPrice,
                                thumbnail: (0, s.jsx)(tk.Thumbnail2d, {
                                    type: "asset" === n.itemType.toLowerCase() ? tk.ThumbnailTypes.assetThumbnail : tk.ThumbnailTypes.bundleThumbnail,
                                    size: tk.DefaultThumbnailSize,
                                    targetId: n.assetId,
                                    imgClassName: "",
                                    format: tk.ThumbnailFormat.webp
                                }),
                                assetName: n.name,
                                assetType: n.assetType,
                                sellerName: n.expectedSellerName,
                                sellerType: n.expectedSellerType,
                                expectedCurrency: 1,
                                expectedSellerId: n.expectedSellerId,
                                collectibleItemId: n.collectibleItemId,
                                collectibleProductId: n.collectibleProductId,
                                collectibleItemInstanceId: n.collectibleItemInstanceId,
                                showSuccessBanner: !0,
                                userAssetId: n.userAssetId,
                                isLimited: !0,
                                onPurchaseSuccess: function() {
                                    var t, e = {
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
                                        userId: null != (t = (0, k.userId)()) ? t : void 0
                                    };
                                    em({
                                        itemName: ev.PurchaseSuccessDirectResale,
                                        excludeTelemetry: !0
                                    }), em({
                                        itemName: ev.PurchaseSuccess,
                                        counterName: ev.PurchaseSuccessDirectResale,
                                        metaData: {
                                            metaData: JSON.stringify(e),
                                            totalValue: n.expectedPrice
                                        },
                                        actionType: eu.Click
                                    }), (0, tv.sendEvent)({
                                        name: "marketplaceWebPurchaseSuccess",
                                        type: "marketplaceWebPurchaseSuccess",
                                        context: "marketplaceWebPurchase"
                                    }, e), g(n.refreshPage)
                                }
                            }))
                        })
                    }, []), (0, o.useEffect)(function() {
                        e === c && r && eS.start()
                    }, [r, c, e]), (0, s.jsxs)(a().Fragment, {
                        children: [(0, s.jsx)(f, {}), r && (0, s.jsx)(ek, u({}, r))]
                    })
                }, {
                    common: [""],
                    feature: "Feature.Catalog"
                }),
                eC = function(t, e) {
                    var i;
                    return (null == (i = t.getAttribute(e)) ? void 0 : i.toString().toLowerCase()) === "true"
                };
            h()(function() {
                ! function t() {
                    var e, i, n, r, o, a = document.getElementById("asset-resale-data-container");
                    if (!a) return void window.requestAnimationFrame(t);
                    var l = null != (e = a.getAttribute("data-target-id")) ? e : "";
                    (0, c.renderWithErrorBoundary)((0, s.jsx)(ei, {
                        assetId: l,
                        isBundle: eC(a, "data-is-bundle"),
                        assetData: {
                            id: l,
                            name: null != (i = a.getAttribute("data-item-name")) ? i : void 0,
                            type: null != (n = a.getAttribute("data-asset-type")) ? n : void 0,
                            productId: null != (r = a.getAttribute("data-product-id")) ? r : void 0,
                            membershipRequirement: null != (o = a.getAttribute("data-bc-requirement")) ? o : void 0
                        },
                        economyMetadata: {
                            purchasingEnabled: eC(a, "data-is-purchase-enabled")
                        }
                    }), a)
                }(),
                function t() {
                    var e = document.getElementById("angular-react-purchase-handoff");
                    e ? (0, c.renderWithErrorBoundary)((0, s.jsx)(eM, {
                        identifier: e.getAttribute("data-identifier")
                    }), e) : window.requestAnimationFrame(t)
                }()
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "ItemResale");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemResale-b191d83ff6ddff0f.js.map