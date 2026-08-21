! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "ddc5e8fe866dbce1db9dc040f009b9be076a3445"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "5b69c097-39ea-4b82-94cc-bf2a710a0f17", e._sentryDebugIdIdentifier = "sentry-dbid-5b69c097-39ea-4b82-94cc-bf2a710a0f17")
    } catch (e) {}
}(),
function() {
    var e = {
            821: function() {
                ! function() {
                    "use strict";
                    var e;
                    if (("undefined" == typeof window ? "undefined" : (e = window) && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object") {
                        if ("IntersectionObserver" in window && "IntersectionObserverEntry" in window && "intersectionRatio" in window.IntersectionObserverEntry.prototype) {
                            "isIntersecting" in window.IntersectionObserverEntry.prototype || Object.defineProperty(window.IntersectionObserverEntry.prototype, "isIntersecting", {
                                get: function() {
                                    return this.intersectionRatio > 0
                                }
                            });
                            return
                        }
                        var t = function(e) {
                                for (var t = e, n = i(t); n;) n = i(t = n.ownerDocument);
                                return t
                            }(window.document),
                            n = [],
                            r = null,
                            o = null;
                        l.prototype.THROTTLE_TIMEOUT = 100, l.prototype.POLL_INTERVAL = null, l.prototype.USE_MUTATION_OBSERVER = !0, l._setupCrossOriginUpdater = function() {
                            return r || (r = function(e, t) {
                                o = e && t ? p(e, t) : f(), n.forEach(function(e) {
                                    e._checkForIntersections()
                                })
                            }), r
                        }, l._resetCrossOriginUpdater = function() {
                            r = null, o = null
                        }, l.prototype.observe = function(e) {
                            if (!this._observationTargets.some(function(t) {
                                    return t.element == e
                                })) {
                                if (!(e && 1 == e.nodeType)) throw Error("target must be an Element");
                                this._registerInstance(), this._observationTargets.push({
                                    element: e,
                                    entry: null
                                }), this._monitorIntersections(e.ownerDocument), this._checkForIntersections()
                            }
                        }, l.prototype.unobserve = function(e) {
                            this._observationTargets = this._observationTargets.filter(function(t) {
                                return t.element != e
                            }), this._unmonitorIntersections(e.ownerDocument), 0 == this._observationTargets.length && this._unregisterInstance()
                        }, l.prototype.disconnect = function() {
                            this._observationTargets = [], this._unmonitorAllIntersections(), this._unregisterInstance()
                        }, l.prototype.takeRecords = function() {
                            var e = this._queuedEntries.slice();
                            return this._queuedEntries = [], e
                        }, l.prototype._initThresholds = function(e) {
                            var t = e || [0];
                            return Array.isArray(t) || (t = [t]), t.sort().filter(function(e, t, n) {
                                if ("number" != typeof e || isNaN(e) || e < 0 || e > 1) throw Error("threshold must be a number between 0 and 1 inclusively");
                                return e !== n[t - 1]
                            })
                        }, l.prototype._parseRootMargin = function(e) {
                            var t = (e || "0px").split(/\s+/).map(function(e) {
                                var t = /^(-?\d*\.?\d+)(px|%)$/.exec(e);
                                if (!t) throw Error("rootMargin must be specified in pixels or percent");
                                return {
                                    value: parseFloat(t[1]),
                                    unit: t[2]
                                }
                            });
                            return t[1] = t[1] || t[0], t[2] = t[2] || t[0], t[3] = t[3] || t[1], t
                        }, l.prototype._monitorIntersections = function(e) {
                            var n = e.defaultView;
                            if (n && -1 == this._monitoringDocuments.indexOf(e)) {
                                var r = this._checkForIntersections,
                                    o = null,
                                    a = null;
                                if (this.POLL_INTERVAL ? o = n.setInterval(r, this.POLL_INTERVAL) : (c(n, "resize", r, !0), c(e, "scroll", r, !0), this.USE_MUTATION_OBSERVER && "MutationObserver" in n && (a = new n.MutationObserver(r)).observe(e, {
                                        attributes: !0,
                                        childList: !0,
                                        characterData: !0,
                                        subtree: !0
                                    })), this._monitoringDocuments.push(e), this._monitoringUnsubscribes.push(function() {
                                        var t = e.defaultView;
                                        t && (o && t.clearInterval(o), u(t, "resize", r, !0)), u(e, "scroll", r, !0), a && a.disconnect()
                                    }), e != (this.root && (this.root.ownerDocument || this.root) || t)) {
                                    var l = i(e);
                                    l && this._monitorIntersections(l.ownerDocument)
                                }
                            }
                        }, l.prototype._unmonitorIntersections = function(e) {
                            var n = this._monitoringDocuments.indexOf(e);
                            if (-1 != n) {
                                var r = this.root && (this.root.ownerDocument || this.root) || t;
                                if (!this._observationTargets.some(function(t) {
                                        var n = t.element.ownerDocument;
                                        if (n == e) return !0;
                                        for (; n && n != r;) {
                                            var o = i(n);
                                            if ((n = o && o.ownerDocument) == e) return !0
                                        }
                                        return !1
                                    })) {
                                    var o = this._monitoringUnsubscribes[n];
                                    if (this._monitoringDocuments.splice(n, 1), this._monitoringUnsubscribes.splice(n, 1), o(), e != r) {
                                        var a = i(e);
                                        a && this._unmonitorIntersections(a.ownerDocument)
                                    }
                                }
                            }
                        }, l.prototype._unmonitorAllIntersections = function() {
                            var e = this._monitoringUnsubscribes.slice(0);
                            this._monitoringDocuments.length = 0, this._monitoringUnsubscribes.length = 0;
                            for (var t = 0; t < e.length; t++) e[t]()
                        }, l.prototype._checkForIntersections = function() {
                            if (this.root || !r || o) {
                                var e = this._rootIsInDom(),
                                    t = e ? this._getRootRect() : f();
                                this._observationTargets.forEach(function(n) {
                                    var o = n.element,
                                        i = s(o),
                                        l = this._rootContainsTarget(o),
                                        c = n.entry,
                                        u = e && l && this._computeTargetAndRootIntersection(o, i, t),
                                        d = null;
                                    this._rootContainsTarget(o) ? (!r || this.root) && (d = t) : d = f();
                                    var p = n.entry = new a({
                                        time: window.performance && performance.now && performance.now(),
                                        target: o,
                                        boundingClientRect: i,
                                        rootBounds: d,
                                        intersectionRect: u
                                    });
                                    c ? e && l ? this._hasCrossedThreshold(c, p) && this._queuedEntries.push(p) : c && c.isIntersecting && this._queuedEntries.push(p) : this._queuedEntries.push(p)
                                }, this), this._queuedEntries.length && this._callback(this.takeRecords(), this)
                            }
                        }, l.prototype._computeTargetAndRootIntersection = function(e, n, i) {
                            if ("none" != window.getComputedStyle(e).display) {
                                for (var a = n, l = h(e), c = !1; !c && l;) {
                                    var u = null,
                                        f = 1 == l.nodeType ? window.getComputedStyle(l) : {};
                                    if ("none" == f.display) return null;
                                    if (l == this.root || 9 == l.nodeType)
                                        if (c = !0, l == this.root || l == t) r && !this.root ? o && (0 != o.width || 0 != o.height) ? u = o : (l = null, u = null, a = null) : u = i;
                                        else {
                                            var d = h(l),
                                                m = d && s(d),
                                                y = d && this._computeTargetAndRootIntersection(d, m, i);
                                            m && y ? (l = d, u = p(m, y)) : (l = null, a = null)
                                        }
                                    else {
                                        var b = l.ownerDocument;
                                        l != b.body && l != b.documentElement && "visible" != f.overflow && (u = s(l))
                                    }
                                    if (u && (a = function(e, t) {
                                            var n = Math.max(e.top, t.top),
                                                r = Math.min(e.bottom, t.bottom),
                                                o = Math.max(e.left, t.left),
                                                i = Math.min(e.right, t.right),
                                                a = i - o,
                                                l = r - n;
                                            return a >= 0 && l >= 0 && {
                                                top: n,
                                                bottom: r,
                                                left: o,
                                                right: i,
                                                width: a,
                                                height: l
                                            } || null
                                        }(u, a)), !a) break;
                                    l = l && h(l)
                                }
                                return a
                            }
                        }, l.prototype._getRootRect = function() {
                            var e;
                            if (this.root && !y(this.root)) e = s(this.root);
                            else {
                                var n = y(this.root) ? this.root : t,
                                    r = n.documentElement,
                                    o = n.body;
                                e = {
                                    top: 0,
                                    left: 0,
                                    right: r.clientWidth || o.clientWidth,
                                    width: r.clientWidth || o.clientWidth,
                                    bottom: r.clientHeight || o.clientHeight,
                                    height: r.clientHeight || o.clientHeight
                                }
                            }
                            return this._expandRectByRootMargin(e)
                        }, l.prototype._expandRectByRootMargin = function(e) {
                            var t = this._rootMarginValues.map(function(t, n) {
                                    return "px" == t.unit ? t.value : t.value * (n % 2 ? e.width : e.height) / 100
                                }),
                                n = {
                                    top: e.top - t[0],
                                    right: e.right + t[1],
                                    bottom: e.bottom + t[2],
                                    left: e.left - t[3]
                                };
                            return n.width = n.right - n.left, n.height = n.bottom - n.top, n
                        }, l.prototype._hasCrossedThreshold = function(e, t) {
                            var n = e && e.isIntersecting ? e.intersectionRatio || 0 : -1,
                                r = t.isIntersecting ? t.intersectionRatio || 0 : -1;
                            if (n !== r)
                                for (var o = 0; o < this.thresholds.length; o++) {
                                    var i = this.thresholds[o];
                                    if (i == n || i == r || i < n != i < r) return !0
                                }
                        }, l.prototype._rootIsInDom = function() {
                            return !this.root || m(t, this.root)
                        }, l.prototype._rootContainsTarget = function(e) {
                            var n = this.root && (this.root.ownerDocument || this.root) || t;
                            return m(n, e) && (!this.root || n == e.ownerDocument)
                        }, l.prototype._registerInstance = function() {
                            0 > n.indexOf(this) && n.push(this)
                        }, l.prototype._unregisterInstance = function() {
                            var e = n.indexOf(this); - 1 != e && n.splice(e, 1)
                        }, window.IntersectionObserver = l, window.IntersectionObserverEntry = a
                    }

                    function i(e) {
                        try {
                            return e.defaultView && e.defaultView.frameElement || null
                        } catch (e) {
                            return null
                        }
                    }

                    function a(e) {
                        this.time = e.time, this.target = e.target, this.rootBounds = d(e.rootBounds), this.boundingClientRect = d(e.boundingClientRect), this.intersectionRect = d(e.intersectionRect || f()), this.isIntersecting = !!e.intersectionRect;
                        var t = this.boundingClientRect,
                            n = t.width * t.height,
                            r = this.intersectionRect,
                            o = r.width * r.height;
                        n ? this.intersectionRatio = Number((o / n).toFixed(4)) : this.intersectionRatio = +!!this.isIntersecting
                    }

                    function l(e, t) {
                        var n, r, o, i = t || {};
                        if ("function" != typeof e) throw Error("callback must be a function");
                        if (i.root && 1 != i.root.nodeType && 9 != i.root.nodeType) throw Error("root must be a Document or Element");
                        this._checkForIntersections = (n = this._checkForIntersections.bind(this), r = this.THROTTLE_TIMEOUT, o = null, function() {
                            o || (o = setTimeout(function() {
                                n(), o = null
                            }, r))
                        }), this._callback = e, this._observationTargets = [], this._queuedEntries = [], this._rootMarginValues = this._parseRootMargin(i.rootMargin), this.thresholds = this._initThresholds(i.threshold), this.root = i.root || null, this.rootMargin = this._rootMarginValues.map(function(e) {
                            return e.value + e.unit
                        }).join(" "), this._monitoringDocuments = [], this._monitoringUnsubscribes = []
                    }

                    function c(e, t, n, r) {
                        "function" == typeof e.addEventListener ? e.addEventListener(t, n, r || !1) : "function" == typeof e.attachEvent && e.attachEvent("on" + t, n)
                    }

                    function u(e, t, n, r) {
                        "function" == typeof e.removeEventListener ? e.removeEventListener(t, n, r || !1) : "function" == typeof e.detachEvent && e.detachEvent("on" + t, n)
                    }

                    function s(e) {
                        var t;
                        try {
                            t = e.getBoundingClientRect()
                        } catch (e) {}
                        return t ? (t.width && t.height || (t = {
                            top: t.top,
                            right: t.right,
                            bottom: t.bottom,
                            left: t.left,
                            width: t.right - t.left,
                            height: t.bottom - t.top
                        }), t) : f()
                    }

                    function f() {
                        return {
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            width: 0,
                            height: 0
                        }
                    }

                    function d(e) {
                        return !e || "x" in e ? e : {
                            top: e.top,
                            y: e.top,
                            bottom: e.bottom,
                            left: e.left,
                            x: e.left,
                            right: e.right,
                            width: e.width,
                            height: e.height
                        }
                    }

                    function p(e, t) {
                        var n = t.top - e.top,
                            r = t.left - e.left;
                        return {
                            top: n,
                            left: r,
                            height: t.height,
                            width: t.width,
                            bottom: n + t.height,
                            right: r + t.width
                        }
                    }

                    function m(e, t) {
                        for (var n = t; n;) {
                            if (n == e) return !0;
                            n = h(n)
                        }
                        return !1
                    }

                    function h(e) {
                        var n = e.parentNode;
                        return 9 == e.nodeType && e != t ? i(e) : (n && n.assignedSlot && (n = n.assignedSlot.parentNode), n && 11 == n.nodeType && n.host) ? n.host : n
                    }

                    function y(e) {
                        return e && 9 === e.nodeType
                    }
                }()
            },
            792: function(e, t, n) {
                function r(e) {
                    return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var o = 0 / 0,
                    i = /^\s+|\s+$/g,
                    a = /^[-+]0x[0-9a-f]+$/i,
                    l = /^0b[01]+$/i,
                    c = /^0o[0-7]+$/i,
                    u = parseInt,
                    s = (void 0 === n.g ? "undefined" : r(n.g)) == "object" && n.g && n.g.Object === Object && n.g,
                    f = ("undefined" == typeof self ? "undefined" : r(self)) == "object" && self && self.Object === Object && self,
                    d = s || f || Function("return this")(),
                    p = Object.prototype.toString,
                    m = Math.max,
                    h = Math.min,
                    y = function() {
                        return d.Date.now()
                    };

                function b(e) {
                    var t = void 0 === e ? "undefined" : r(e);
                    return !!e && ("object" == t || "function" == t)
                }

                function v(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : r(t)) == "symbol" || t && (void 0 === t ? "undefined" : r(t)) == "object" && "[object Symbol]" == p.call(t)) return o;
                    if (b(e)) {
                        var t, n = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = b(n) ? n + "" : n
                    }
                    if ("string" != typeof e) return 0 === e ? e : +e;
                    e = e.replace(i, "");
                    var s = l.test(e);
                    return s || c.test(e) ? u(e.slice(2), s ? 2 : 8) : a.test(e) ? o : +e
                }
                e.exports = function(e, t, n) {
                    var r, o, i, a, l, c, u = 0,
                        s = !1,
                        f = !1,
                        d = !0;
                    if ("function" != typeof e) throw TypeError("Expected a function");

                    function p(t) {
                        var n = r,
                            i = o;
                        return r = o = void 0, u = t, a = e.apply(i, n)
                    }

                    function g(e) {
                        var n = e - c,
                            r = e - u;
                        return void 0 === c || n >= t || n < 0 || f && r >= i
                    }

                    function w() {
                        var e, n, r, o = y();
                        if (g(o)) return O(o);
                        l = setTimeout(w, (e = o - c, n = o - u, r = t - e, f ? h(r, i - n) : r))
                    }

                    function O(e) {
                        return (l = void 0, d && r) ? p(e) : (r = o = void 0, a)
                    }

                    function x() {
                        var e, n = y(),
                            i = g(n);
                        if (r = arguments, o = this, c = n, i) {
                            if (void 0 === l) return u = e = c, l = setTimeout(w, t), s ? p(e) : a;
                            if (f) return l = setTimeout(w, t), p(c)
                        }
                        return void 0 === l && (l = setTimeout(w, t)), a
                    }
                    return t = v(t) || 0, b(n) && (s = !!n.leading, i = (f = "maxWait" in n) ? m(v(n.maxWait) || 0, t) : i, d = "trailing" in n ? !!n.trailing : d), x.cancel = function() {
                        void 0 !== l && clearTimeout(l), u = 0, r = c = o = l = void 0
                    }, x.flush = function() {
                        return void 0 === l ? a : O(y())
                    }, x
                }
            },
            794: function(e, t, n) {
                "use strict";
                e.exports = {}
            },
            162: function(e, t, n) {
                "use strict";
                e.exports = {}
            }
        },
        t = {};

    function n(r) {
        var o = t[r];
        if (void 0 !== o) return o.exports;
        var i = t[r] = {
            exports: {}
        };
        return e[r](i, i.exports, n), i.exports
    }
    n.m = e, n.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return n.d(t, {
            a: t
        }), t
    }, n.d = function(e, t) {
        for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, n.k = function(e) {
        return "" + e + ".css"
    }, n.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), n.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, n.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.nc = void 0, n.rv = function() {
        return "1.5.7"
    }, n.g.importScripts && (r = n.g.location + "");
    var r, o = n.g.document;
    if (!r && o && (o.currentScript && "SCRIPT" === o.currentScript.tagName.toUpperCase() && (r = o.currentScript.src), !r)) {
        var i = o.getElementsByTagName("script");
        if (i.length)
            for (var a = i.length - 1; a > -1 && (!r || !/^http(s?):/.test(r));) r = i[a--].src
    }
    if (!r) throw Error("Automatic publicPath is not supported in this browser");
    n.p = r.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), n.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var e, t, r, o, i, a, l, c, u, s, f, d, p, m, h, y, b, v, g, w, O, x, j, S, P, E, I, A, C, R, k, N, T, D, _, M, L, F, U = window.ReactJSX,
                z = window.Roblox["core-scripts"].util.ready,
                W = n.n(z),
                B = window.Roblox["core-scripts"].react,
                G = window.TanstackQuery,
                H = window.React,
                V = n.n(H),
                J = n(792),
                $ = n.n(J);
            n(821);
            var X = function(e, t) {
                    if (0 === e.length || 0 === t) return [e];
                    for (var n = [], r = 0; r < e.length; r += t) n.push(e.slice(r, r + t));
                    return n
                },
                q = function(e, t, n) {
                    var r = [];
                    return t.forEach(function(t) {
                        if (null == t ? void 0 : t.isIntersecting) {
                            var o = e.findIndex(function(e) {
                                return e === t.target
                            });
                            o >= 0 && (r.push(o), n.unobserve(t.target))
                        }
                    }), r.sort(function(e, t) {
                        return e - t
                    })
                },
                Y = function(e, t, n) {
                    var r = (0, H.useRef)(new Set),
                        o = (0, H.useRef)(new Set),
                        i = (0, H.useRef)(null),
                        a = (0, H.useCallback)(function() {
                            X(Array.from(o.current).filter(function(e) {
                                return !r.current.has(e)
                            }), 25).filter(function(e) {
                                return e.length > 0
                            }).forEach(function(e) {
                                n(e), e.forEach(function(e) {
                                    return r.current.add(e)
                                })
                            }), o.current.clear()
                        }, [n]),
                        l = (0, H.useMemo)(function() {
                            return $()(function() {
                                return a()
                            }, 200)
                        }, [a]);
                    (0, H.useEffect)(function() {
                        var t, n, r = Array.from(null != (n = null == e || null == (t = e.current) ? void 0 : t.children) ? n : []).filter(function(e) {
                            var t;
                            return null != (t = HTMLElement) && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
                        });
                        return i.current && (i.current(), i.current = null), i.current = function(e, t) {
                                var n = e.elements,
                                    r = e.threshold;
                                try {
                                    var o = new window.IntersectionObserver(t, {
                                        threshold: r
                                    });
                                    return n.forEach(function(e) {
                                            o.observe(e)
                                        }),
                                        function() {
                                            return o.disconnect()
                                        }
                                } catch (e) {}
                                return function() {}
                            }({
                                elements: r,
                                threshold: .5
                            }, function(e, t) {
                                l.cancel(), q(r, e, t).forEach(function(e) {
                                    return o.current.add(e)
                                }), l()
                            }),
                            function() {
                                l.cancel(), i.current && (i.current(), i.current = null)
                            }
                    }, [e, t, l, o])
                };
            (r = P || (P = {})).ItemImpressions = "itemImpressions", r.ItemAction = "itemAction", (o = E || (E = {})).Games = "Games", o.Home = "Home", o.SearchLanding = "SearchLanding", o.Spotlight = "Spotlight", o.UserProfile = "UserProfile", o.GameDetail = "GameDetail", o.SongList = "SongList", o.SearchPage = "SearchPage", o.PreAuthLanding = "PreAuthLanding", (i = I || (I = {})).HomePageSessionInfo = "homePageSessionInfo", i.DiscoverPageSessionInfo = "discoverPageSessionInfo", i.GameSearchSessionInfo = "gameSearchSessionInfo", i.SpotlightPageSessionInfo = "spotlightPageSessionInfo", i.PreAuthLandingPageSessionInfo = "preAuthLandingPageSessionInfo", (a = A || (A = {})).ContentType = "contentType", a.Context = "context", a.CollectionId = "collectionId", a.CollectionPosition = "collectionPosition", a.CollectionComponentType = "collectionComponentType", (l = C || (C = {})).User = "User", l.Game = "Game", l.Song = "Song", l.Look = "Look", l.Description = "Description", (c = R || (R = {})).Online = "online", c.InGame = "inGame", c.InStudio = "inStudio", c.Offline = "offline", (u = k || (k = {})).Friend = "friend", u.NotFriend = "notFriend", (s = N || (N = {})).ItemIds = "itemIds", s.ItemPositions = "itemPositions", s.RowNumbers = "rowNumbers", s.FeedRowNumbers = "feedRowNumbers", s.PositionsInRow = "positionsInRow", s.PositionsInTopic = "positionsInTopic", s.TotalNumberOfItems = "totalNumberOfItems", (f = T || (T = {})).Presences = "presences", f.PresenceUniverseIds = "presenceUniverseIds", f.FriendStatuses = "friendStatuses", f.SourceCarousel = "sourceCarousel", (d = D || (D = {})).ItemId = "itemId", d.ItemPosition = "itemPosition", d.ItemComponentType = "itemComponentType", d.RowNumber = "rowNumber", d.FeedRowNumber = "feedRowNumber", d.PositionInRow = "positionInRow", d.PositionInTopic = "positionInTopic", d.TotalNumberOfItems = "totalNumberOfItems", d.ActionType = "actionType", (p = _ || (_ = {})).Presence = "presence", p.PresenceUniverseId = "presenceUniverseId", p.FriendStatus = "friendStatus", p.SourceCarousel = "sourceCarousel";
            var K = function(e, t) {
                    return Array.isArray(e) && !t ? e.join(",") : (void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && e ? JSON.stringify(e) : "number" == typeof e || "string" == typeof e ? e : "boolean" == typeof e ? +!!e : void 0
                },
                Z = function(e) {
                    return Object.keys(e).reduce(function(t, n) {
                        var r = K(e[n], !1);
                        return void 0 !== r && (t[n] = r), t
                    }, {})
                },
                Q = window.Roblox.ExperimentationService,
                ee = n.n(Q),
                et = window.Roblox["core-scripts"].realtime,
                en = n.n(et),
                er = window.Roblox["core-scripts"].dataStore,
                eo = n.n(er),
                ei = window.Roblox["core-scripts"].environmentUrls,
                ea = n.n(ei),
                el = window.Roblox["core-scripts"].http.http;

            function ec(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eu(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function es(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            eu(i, r, o, a, l, "next", e)
                        }

                        function l(e) {
                            eu(i, r, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function ef(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || ep(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ed(e) {
                return function(e) {
                    if (Array.isArray(e)) return ec(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ep(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ep(e, t) {
                if (e) {
                    if ("string" == typeof e) return ec(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ec(e, t)
                }
            }

            function em(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var eh = function() {
                return es(function() {
                    var e;
                    return em(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return e = {
                                    url: "".concat(ea().friendsApi, "/v1/my/new-friend-requests/count"),
                                    retryable: !0,
                                    withCredentials: !0
                                }, [4, el.get(e)];
                            case 1:
                                return [2, t.sent().data.count]
                        }
                    })
                })()
            };

            function ey(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, o)
            }
            var eb = function() {
                    var e;
                    return (e = function() {
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, el.get({
                                        url: "".concat(ea().chatApi, "/v1/metadata"),
                                        withCredentials: !0
                                    })];
                                case 1:
                                    return [2, {
                                        chatEnabled: e.sent().data.isChatUserMessagesEnabled
                                    }]
                            }
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(r, o) {
                            var i = e.apply(t, n);

                            function a(e) {
                                ey(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                ey(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                ev = function(e) {
                    var t = e.friendsCount,
                        n = e.profileUserId,
                        r = e.isOwnUser,
                        o = e.translate,
                        i = r ? "".concat(ea().websiteUrl, "/users/friends#!/friends") : "".concat(ea().websiteUrl, "/users/").concat(n, "/friends#!/friends"),
                        a = "Label.Friends";
                    return (0, U.jsxs)("div", {
                        className: "container-header people-list-header",
                        children: [null == t ? (0, U.jsx)("h2", {
                            children: o(a)
                        }) : (0, U.jsxs)("h2", {
                            children: [o(a), (0, U.jsx)("span", {
                                className: "friends-count",
                                children: "(".concat(null != t ? t : 0, ")")
                            })]
                        }), (0, U.jsx)("a", {
                            href: i,
                            className: "btn-secondary-xs btn-more see-all-link-icon",
                            children: o("Heading.SeeAll")
                        })]
                    })
                },
                eg = window.RobloxPresence,
                ew = n.n(eg),
                eO = window.RobloxBadges,
                ex = window.Roblox["core-scripts"].guac,
                ej = "web-plus-identity-badge",
                eS = function(e) {
                    return (void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && null !== e
                },
                eP = function() {
                    var e = (0, G.useQuery)({
                        queryKey: ["guac/".concat(ej)],
                        queryFn: function() {
                            return (0, ex.callBehaviour)(ej)
                        },
                        staleTime: 1 / 0
                    }).data;
                    return eS(e) && !0 === e.plusIdentityBadgeEnabled
                },
                eE = function() {
                    for (var e, t, n = 0, r = "", o = arguments.length; n < o; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, o = "";
                        if ("string" == typeof t || "number" == typeof t) o += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (n = 0; n < i; n++) t[n] && (r = e(t[n])) && (o && (o += " "), o += r)
                            } else
                                for (r in t) t[r] && (o && (o += " "), o += r);
                        return o
                    }(e)) && (r && (r += " "), r += t);
                    return r
                },
                eI = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                eA = V().forwardRef(function(e, t) {
                    var n = e.name,
                        r = e.size,
                        o = e.className,
                        i = (e.children, function(e, t) {
                            if (null == e) return {};
                            var n, r, o = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = {},
                                    i = Object.keys(e);
                                for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                            }
                            return o
                        }(e, ["name", "size", "className", "children"]));
                    return V().createElement("span", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        ref: t,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: eE("grow-0 shrink-0 basis-auto icon", n, eI[void 0 === r ? "Medium" : r], o)
                    }, i))
                });
            eA.displayName = "Icon";
            var eC = function(e) {
                    var t = e.isVerified,
                        n = e.isRobloxPlus,
                        r = e.isPremium,
                        o = e.isRobloxAdmin,
                        i = e.size,
                        a = void 0 === i ? "Large" : i,
                        l = e.plusBadgeAriaLabel,
                        c = !0 === n,
                        u = !0 === r && !c,
                        s = !0 === t,
                        f = !0 === o;
                    return s || c || u || f ? (0, U.jsxs)("span", {
                        className: "items-center gap-xxsmall inline-flex shrink-0 [--icon-size-small:1em]",
                        children: [s && (0, U.jsxs)("span", {
                            className: "relative flex items-center justify-center",
                            children: [(0, U.jsx)(eA, {
                                name: "icon-filled-verified-backplate",
                                className: "content-system-emphasis",
                                size: a
                            }), (0, U.jsx)(eA, {
                                name: "icon-filled-verified-check",
                                className: "absolute",
                                style: {
                                    color: "white"
                                },
                                size: a
                            })]
                        }), c && (0, U.jsx)(eA, {
                            name: "icon-regular-roblox-plus",
                            className: "content-system-contrast",
                            size: a,
                            "aria-label": l
                        }), u && (0, U.jsx)(eA, {
                            name: "icon-filled-premium",
                            className: "content-system-contrast",
                            size: a
                        }), f && (0, U.jsx)(eA, {
                            name: "icon-filled-tilt",
                            className: "content-system-contrast",
                            size: a
                        })]
                    }) : null
                },
                eR = window.ReactStyleGuide,
                ek = window.RobloxThumbnails,
                eN = function(e) {
                    var t = e.id,
                        n = e.userProfileUrl,
                        r = e.handleImageClick,
                        o = e.translate,
                        i = (0, U.jsx)(ek.Thumbnail2d, {
                            type: ek.ThumbnailTypes.avatarHeadshot,
                            size: ek.DefaultThumbnailSize,
                            targetId: t,
                            containerClass: "avatar-card-image"
                        });
                    return (0, U.jsx)(eR.AvatarCardItem.Headshot, {
                        statusIcon: (0, U.jsx)(ew().PresenceStatusIcon, {
                            translate: o,
                            userId: t
                        }),
                        thumbnail: i,
                        imageLink: n,
                        handleImageClick: r
                    })
                },
                eT = function(e) {
                    var t = e.id,
                        n = e.displayName,
                        r = e.userProfileUrl,
                        o = e.userPresence,
                        i = e.hasVerifiedBadge,
                        a = e.isRobloxPlus,
                        l = e.sendClickEvent,
                        c = e.translate,
                        u = eP() && !0 === a;
                    return (0, U.jsxs)("div", {
                        className: "friend-tile-content",
                        children: [(0, U.jsx)(eN, {
                            id: t,
                            translate: c,
                            userProfileUrl: r,
                            handleImageClick: l
                        }), (0, U.jsxs)("a", {
                            href: r,
                            onClick: l,
                            className: "friends-carousel-tile-labels",
                            "data-testid": "friends-carousel-tile-labels",
                            children: [(0, U.jsx)("div", {
                                className: "friends-carousel-tile-label",
                                children: (0, U.jsxs)("div", {
                                    className: "friends-carousel-tile-name",
                                    children: [(0, U.jsx)("span", {
                                        className: "friends-carousel-display-name",
                                        children: n
                                    }), i && (0, U.jsxs)("div", {
                                        className: "friend-tile-verified-badge",
                                        children: [(0, U.jsx)("div", {
                                            className: "friend-tile-spacer"
                                        }), (0, U.jsx)(eO.VerifiedBadgeIconContainer, {
                                            size: eO.BadgeSizes.SUBHEADER,
                                            additionalContainerClass: "verified-badge"
                                        })]
                                    }), u && (0, U.jsx)(eC, {
                                        isRobloxPlus: !0,
                                        size: "Small",
                                        plusBadgeAriaLabel: c("Label.RobloxPlusSubscriber", void 0, "Roblox Plus subscriber")
                                    })]
                                })
                            }), (0, U.jsx)("div", {
                                className: "friends-carousel-tile-sublabel",
                                children: null != o && (0, U.jsx)("div", {
                                    className: "friends-carousel-tile-experience",
                                    children: o
                                })
                            })]
                        })]
                    })
                },
                eD = window.Roblox,
                e_ = window.Roblox["core-scripts"].meta.device,
                eM = window.CoreRobloxUtilities,
                eL = function(e) {
                    var t = e.className;
                    return V().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: eE("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                eF = function(e) {
                    var t = e.width,
                        n = e.height;
                    return V().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, V().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function eU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ez(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function eW() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = ez(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : ez(t[e], null)
                        }
                    }
                }
            }

            function eB() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return H.useCallback(eW.apply(void 0, function(e) {
                    if (Array.isArray(e)) return eU(e)
                }(t) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eU(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eU(e, t)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function eG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eH(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function eV(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function eJ(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function e$(e) {
                return function(e) {
                    if (Array.isArray(e)) return eG(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eG(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eG(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eX(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var eq = Symbol.for("react.lazy"),
                eY = H[" use ".trim().toString()];

            function eK(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : eX(e)) === "object" && "$$typeof" in e && e.$$typeof === eq && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : eX(t)) === "object" && null !== t && "then" in t
            }
            var eZ = ((e = H.forwardRef(function(e, t) {
                    var n = e.children,
                        r = eJ(e, ["children"]);
                    if (eK(n) && "function" == typeof eY && (n = eY(n._payload)), H.isValidElement(n)) {
                        var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var n = eH({}, t);
                                for (var r in t) ! function(r) {
                                    var o = e[r],
                                        i = t[r];
                                    /^on[A-Z]/.test(r) ? o && i ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = i.apply(void 0, e$(t));
                                        return o.apply(void 0, e$(t)), r
                                    } : o && (n[r] = o) : "style" === r ? n[r] = eH({}, o, i) : "className" === r && (n[r] = [o, i].filter(Boolean).join(" "))
                                }(r);
                                return eH({}, e, n)
                            }(r, n.props);
                        return n.type !== H.Fragment && (s.ref = t ? eW(t, u) : u), H.cloneElement(n, s)
                    }
                    return H.Children.count(n) > 1 ? H.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), m = e, (h = H.forwardRef(function(e, t) {
                    var n = e.children,
                        r = eJ(e, ["children"]);
                    eK(n) && "function" == typeof eY && (n = eY(n._payload));
                    var o = H.Children.toArray(n),
                        i = o.find(e0);
                    if (i) {
                        var a = i.props.children,
                            l = o.map(function(e) {
                                return e !== i ? e : H.Children.count(a) > 1 ? H.Children.only(null) : H.isValidElement(a) ? a.props.children : null
                            });
                        return (0, U.jsx)(m, eV(eH({}, r), {
                            ref: t,
                            children: H.isValidElement(a) ? H.cloneElement(a, void 0, l) : null
                        }))
                    }
                    return (0, U.jsx)(m, eV(eH({}, r), {
                        ref: t,
                        children: n
                    }))
                })).displayName = "".concat("Slot", ".Slot"), h),
                eQ = Symbol("radix.slottable");

            function e0(e) {
                return H.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === eQ
            }

            function e1(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function e2(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function e3(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }
            var e4 = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                e5 = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                e8 = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                e6 = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                e7 = (0, H.forwardRef)(function(e, t) {
                    var n = e.children,
                        r = e.className,
                        o = e.style,
                        i = e.isDisabled,
                        a = void 0 !== i && i,
                        l = e.isLoading,
                        c = void 0 !== l && l,
                        u = e.icon,
                        s = e.size,
                        f = void 0 === s ? "Large" : s,
                        d = e.variant,
                        p = void 0 === d ? "Emphasis" : d,
                        m = e.asChild,
                        h = e3(e, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        y = eE("foundation-web-button", a ? "opacity-[0.5]" : ["relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", e5[f], a ? e6[p] : e8[p], r),
                        b = e1({
                            textDecoration: "none"
                        }, o),
                        v = function(e) {
                            return V().createElement(V().Fragment, null, V().createElement(eL, null), c && V().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, V().createElement(eF, {
                                width: e4[f],
                                height: e4[f]
                            })), V().createElement("span", {
                                className: eE("flex items-center min-width-0", "Large" === f || "Medium" === f ? "gap-small" : "gap-xsmall", c && "invisible")
                            }, u && V().createElement(eA, {
                                name: u,
                                size: f
                            }), V().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (m) {
                        h.as;
                        var g = e3(h, ["as"]),
                            w = V().Children.only(n);
                        return V().createElement(eZ, e2(e1({
                            ref: t
                        }, g), {
                            className: y,
                            style: b,
                            "aria-disabled": a || void 0
                        }), V().cloneElement(w, {}, v(w.props.children)))
                    }
                    if ("a" === h.as) {
                        h.as;
                        var O = h.href,
                            x = e3(h, ["as", "href"]);
                        return V().createElement("a", e2(e1({
                            ref: t
                        }, x), {
                            "aria-disabled": a,
                            href: a ? void 0 : O,
                            className: y,
                            style: b
                        }), v(n))
                    }
                    h.as;
                    var j = e3(h, ["as"]);
                    return V().createElement("button", e2(e1({
                        ref: t,
                        type: "button"
                    }, j), {
                        disabled: a,
                        className: y,
                        style: b
                    }), v(n))
                });

            function e9(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function te(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function tt(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }
            var tn = new Set(["_self", "_parent", "_top"]),
                tr = {
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                to = {
                    Standard: "content-emphasis",
                    Emphasis: "content-emphasis",
                    Inverse: "content-inverse-default"
                },
                ti = (0, H.forwardRef)(function(e, t) {
                    var n, r, o, i = e.children,
                        a = e.className,
                        l = e.size,
                        c = e.color,
                        u = e.variant,
                        s = e.underline,
                        f = void 0 === s ? "hover" : s,
                        d = e.isExternal,
                        p = e.asChild,
                        m = tt(e, ["children", "className", "size", "color", "variant", "underline", "isExternal", "asChild"]),
                        h = (n = null != (o = m.as) ? o : "a", r = "button" === m.as ? void 0 : m.target, void 0 !== d ? d : "button" !== n && void 0 !== r && !tn.has(r)),
                        y = eE("foundation-web-link", "button" === m.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === (void 0 === u ? "Standalone" : u) || h) && "inline-flex items-center gap-xsmall", void 0 !== l && tr[l], to[void 0 === c ? "Emphasis" : c], "always" === f ? "underline" : "no-underline", "hover" === f && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", a),
                        b = h ? V().createElement("span", {
                            "aria-hidden": !0,
                            "data-testid": "foundation-web-icon",
                            className: eE("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
                        }) : null;
                    if (p) {
                        m.as;
                        var v = tt(m, ["as"]),
                            g = V().Children.only(i);
                        return V().isValidElement(g) ? V().createElement(eZ, te(e9({
                            ref: t
                        }, v), {
                            className: y
                        }), V().cloneElement(g, {}, V().createElement(V().Fragment, null, g.props.children, b))) : null
                    }
                    if ("button" === m.as) {
                        m.as;
                        var w = m.type,
                            O = tt(m, ["as", "type"]);
                        return V().createElement("button", te(e9({
                            ref: t,
                            type: null != w ? w : "button"
                        }, O), {
                            className: y
                        }), i, b)
                    }
                    m.as;
                    var x = tt(m, ["as"]);
                    return V().createElement("a", te(e9({
                        ref: t
                    }, x), {
                        className: y
                    }), i, b)
                });
            ti.displayName = "Link";
            var ta = function(e) {
                var t = e.displayName,
                    n = e.userPresence,
                    r = e.universeId,
                    o = e.userProfileUrl,
                    i = e.canChat,
                    a = e.translate,
                    l = e.launchGame,
                    c = e.gameUrl,
                    u = e.placeId,
                    s = e.isIARCJoinCardGameRowClickableEnabled,
                    f = e.sendGameRowClickEvent,
                    d = e.startChat,
                    p = (0, U.jsxs)(H.Fragment, {
                        children: [(0, U.jsx)("span", {
                            className: "shrink-0 radius-small clip",
                            style: {
                                display: "inline-block",
                                width: 40,
                                height: 40
                            },
                            children: (0, U.jsx)(ek.Thumbnail2d, {
                                type: ek.ThumbnailTypes.gameIcon,
                                size: ek.ThumbnailGameIconSize.size150,
                                targetId: r,
                                imgClassName: "width-full height-full",
                                containerClass: "width-full height-full"
                            })
                        }), (0, U.jsxs)("span", {
                            className: "friend-presence-info flex flex-col justify-center min-width-0 fill",
                            children: [(0, U.jsxs)("span", {
                                className: "friend-tile-is-playing text-body-medium content-default text-truncate-end text-no-wrap",
                                children: [t, " ", a("Text.IsPlaying")]
                            }), (0, U.jsx)("span", {
                                className: "friend-tile-game-name text-title-medium content-emphasis text-truncate-end text-no-wrap",
                                children: n
                            })]
                        })]
                    }),
                    m = s && null != u && "" !== c;
                return (0, U.jsx)("div", {
                    className: "friend-tile-dropdown friend-tile-dropdown--iarc",
                    style: {
                        backgroundColor: "transparent",
                        borderRadius: 0
                    },
                    children: (0, U.jsxs)("div", {
                        className: "in-game-friend-card--iarc flex flex-col items-start justify-center padding-y-large padding-x-large gap-medium radius-medium stroke-standard stroke-default bg-over-media-300 width-full",
                        style: {
                            boxSizing: "border-box"
                        },
                        children: [m ? (0, U.jsx)("a", {
                            href: c,
                            onClick: f,
                            className: "flex items-center gap-small width-full min-width-0",
                            style: {
                                color: "inherit",
                                textDecoration: "none"
                            },
                            children: p
                        }) : (0, U.jsx)("div", {
                            className: "flex items-center gap-small width-full min-width-0",
                            children: p
                        }), (0, U.jsxs)("div", {
                            className: "in-game-friend-card-actions flex flex-col self-stretch gap-small",
                            children: [(0, U.jsx)(e7, {
                                variant: "Emphasis",
                                size: "Medium",
                                className: "grow",
                                onClick: l,
                                children: a("Action.Join")
                            }), i && (0, U.jsx)(e7, {
                                variant: "Standard",
                                size: "Medium",
                                className: "grow",
                                onClick: d,
                                children: a("Action.Chat")
                            }), (0, U.jsx)(ti, {
                                href: o,
                                color: "Standard",
                                underline: "none",
                                className: "flex items-center justify-center self-stretch height-600 text-label-medium content-action-standard",
                                children: a("Label.ViewProfile")
                            })]
                        })]
                    })
                })
            };

            function tl(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, o)
            }
            var tc = function(e) {
                var t, n = e.friend,
                    r = e.displayName,
                    o = e.userProfileUrl,
                    i = e.userPresence,
                    a = e.isInGame,
                    l = e.gameUrl,
                    c = e.universeId,
                    u = e.canChat,
                    s = e.translate,
                    f = e.isIARCJoinCardRedesignEnabled,
                    d = e.isIARCJoinCardGameRowClickableEnabled,
                    p = e.sendGameRowClickEvent,
                    m = function() {
                        var e;
                        return (e = function() {
                            var e, t, r, o;
                            return function(e, t) {
                                var n, r, o, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                    return this
                                }), a;

                                function l(l) {
                                    return function(c) {
                                        var u = [l, c];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                                case 0:
                                                case 1:
                                                    o = u;
                                                    break;
                                                case 4:
                                                    return i.label++, {
                                                        value: u[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    i.label++, r = u[1], u = [0];
                                                    continue;
                                                case 7:
                                                    u = i.ops.pop(), i.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                        i = 0;
                                                        continue
                                                    }
                                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                        i.label = u[1];
                                                        break
                                                    }
                                                    if (6 === u[0] && i.label < o[1]) {
                                                        i.label = o[1], o = u;
                                                        break
                                                    }
                                                    if (o && i.label < o[2]) {
                                                        i.label = o[2], i.ops.push(u);
                                                        break
                                                    }
                                                    o[2] && i.ops.pop(), i.trys.pop();
                                                    continue
                                            }
                                            u = t.call(e, i)
                                        } catch (e) {
                                            u = [6, e], r = 0
                                        } finally {
                                            n = o = 0
                                        }
                                        if (5 & u[0]) throw u[1];
                                        return {
                                            value: u[0] ? u[1] : void 0,
                                            done: !0
                                        }
                                    }
                                }
                            }(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (t = null != (e = n.presence.gameId) ? e : "", !(null == (r = (0, e_.getDeviceMeta)()) ? void 0 : r.isInApp)) return [3, 1];
                                        return r.isDesktop ? null === eD.GameLauncher || void 0 === eD.GameLauncher || eD.GameLauncher.followPlayerIntoGame(n.id, t, "JoinUser") : window.location.href = "/games/start?userID=".concat(n.id, "&joinAttemptId=").concat(t, "&joinAttemptOrigin=JoinUser"), [3, 5];
                                    case 1:
                                        if (!((null == r ? void 0 : r.isAndroidDevice) || (null == r ? void 0 : r.isChromeOs))) return [3, 2];
                                        return window.location.href = "intent://userId=".concat(n.id, "&joinAttemptId=").concat(t, "&joinAttemptOrigin=JoinUser#Intent;scheme=robloxmobile;package=com.roblox.client;S.browser_fallback_url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.roblox.client;end"), [3, 5];
                                    case 2:
                                        if (!(null == r ? void 0 : r.isIosDevice)) return [3, 3];
                                        return window.location.href = "robloxmobile://userId=".concat(n.id, "&joinAttemptId=").concat(t, "&joinAttemptOrigin=JoinUser"), [3, 5];
                                    case 3:
                                        return [4, null == (o = window.Roblox.ProtocolHandlerClientInterface) ? void 0 : o.followPlayerIntoGame({
                                            userId: n.id,
                                            joinAttemptId: t,
                                            joinAttemptOrigin: "JoinUser"
                                        })];
                                    case 4:
                                        i.sent(), i.label = 5;
                                    case 5:
                                        return [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(r, o) {
                                var i = e.apply(t, n);

                                function a(e) {
                                    tl(i, r, o, a, l, "next", e)
                                }

                                function l(e) {
                                    tl(i, r, o, a, l, "throw", e)
                                }
                                a(void 0)
                            })
                        })()
                    },
                    h = function() {
                        eM.chatService.startDesktopAndMobileWebChat({
                            userId: n.id
                        })
                    };
                return f && a && null != i ? (0, U.jsx)(ta, {
                    displayName: r,
                    userPresence: i,
                    universeId: c,
                    userProfileUrl: o,
                    canChat: u,
                    translate: s,
                    launchGame: m,
                    gameUrl: l,
                    placeId: null != (t = n.presence.placeId) ? t : null,
                    isIARCJoinCardGameRowClickableEnabled: d,
                    sendGameRowClickEvent: p,
                    startChat: h
                }) : (0, U.jsxs)("div", {
                    className: "friend-tile-dropdown",
                    children: [a && null != i && (0, U.jsxs)("div", {
                        className: "in-game-friend-card",
                        children: [(0, U.jsx)("button", {
                            type: "button",
                            className: "friend-tile-non-styled-button",
                            onClick: function() {
                                window.open(l)
                            },
                            children: (0, U.jsx)(ek.Thumbnail2d, {
                                type: ek.ThumbnailTypes.gameIcon,
                                size: ek.ThumbnailGameIconSize.size150,
                                targetId: c,
                                imgClassName: "game-card-thumb",
                                containerClass: "friend-tile-game-card"
                            })
                        }), (0, U.jsxs)("div", {
                            className: "friend-presence-info",
                            children: [(0, U.jsx)("button", {
                                type: "button",
                                className: "friend-tile-non-styled-button",
                                onClick: function() {
                                    window.open(l)
                                },
                                children: i
                            }), (0, U.jsx)(eR.Button, {
                                variant: eR.Button.variants.growth,
                                size: eR.Button.sizes.small,
                                width: eR.Button.widths.full,
                                onClick: m,
                                children: s("Action.Join")
                            })]
                        })]
                    }), (0, U.jsxs)("ul", {
                        children: [u && (0, U.jsx)("li", {
                            children: (0, U.jsxs)("button", {
                                type: "button",
                                className: "friend-tile-dropdown-button",
                                onClick: h,
                                children: [(0, U.jsx)("span", {
                                    className: "icon-chat-gray"
                                }), " ", s("Label.Chat", {
                                    username: r
                                })]
                            })
                        }), (0, U.jsx)("li", {
                            children: (0, U.jsxs)("button", {
                                type: "button",
                                className: "friend-tile-dropdown-button",
                                onClick: function() {
                                    window.open(o)
                                },
                                children: [(0, U.jsx)("span", {
                                    className: "icon-viewdetails"
                                }), " ", s("Label.ViewProfile")]
                            })
                        })]
                    })]
                })
            };

            function tu(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    o = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === o || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function ts(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tf(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function td(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        tf(e, t, n[t])
                    })
                }
                return e
            }

            function tp(e) {
                return function(e) {
                    if (Array.isArray(e)) return ts(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ts(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ts(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tm(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    n = [],
                    r = function() {
                        var t = n.map(function(e) {
                            return H.createContext(e)
                        });
                        return function(n) {
                            var r = (null == n ? void 0 : n[e]) || t;
                            return H.useMemo(function() {
                                var t, o;
                                return tf({}, "__scope".concat(e), (t = td({}, n), o = null != (o = tf({}, e, r)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                                    var n = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        n.push.apply(n, r)
                                    }
                                    return n
                                })(Object(o)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                }), t))
                            }, [n, r])
                        }
                    };
                return r.scopeName = e, [function(t, r) {
                    var o = H.createContext(r),
                        i = n.length;
                    n = tp(n).concat([r]);
                    var a = function(t) {
                        var n, r = t.scope,
                            a = t.children,
                            l = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, o = {},
                                        i = Object.keys(e);
                                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                                }
                                return o
                            }(t, ["scope", "children"]),
                            c = (null == r || null == (n = r[e]) ? void 0 : n[i]) || o,
                            u = H.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, U.jsx)(c.Provider, {
                            value: u,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(n, a) {
                        var l, c = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                            u = H.useContext(c);
                        if (u) return u;
                        if (void 0 !== r) return r;
                        throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                    }]
                }, th.apply(void 0, [r].concat(tp(t)))]
            }

            function th() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t[0];
                if (1 === t.length) return r;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var n = e.reduce(function(e, n) {
                            var r = n.useScope,
                                o = n.scopeName;
                            return td({}, e, r(t)["__scope".concat(o)])
                        }, {});
                        return H.useMemo(function() {
                            return tf({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return o.scopeName = r.scopeName, o
            }
            var ty = window.RadixUI["react-dismissable-layer"],
                tb = window.RadixUI["react-focus-guards"],
                tv = window.ReactDOM,
                tg = n.n(tv);

            function tw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tO(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function tx(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function tj(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function tS(e) {
                return function(e) {
                    if (Array.isArray(e)) return tw(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tw(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tw(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tP(e) {
                var t, n, r = (t = e, (n = H.forwardRef(function(e, t) {
                        var n = e.children,
                            r = tj(e, ["children"]);
                        if (H.isValidElement(n)) {
                            var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var n = tO({}, t);
                                    for (var r in t) ! function(r) {
                                        var o = e[r],
                                            i = t[r];
                                        /^on[A-Z]/.test(r) ? o && i ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            i.apply(void 0, tS(t)), o.apply(void 0, tS(t))
                                        } : o && (n[r] = o) : "style" === r ? n[r] = tO({}, o, i) : "className" === r && (n[r] = [o, i].filter(Boolean).join(" "))
                                    }(r);
                                    return tO({}, e, n)
                                }(r, n.props);
                            return n.type !== H.Fragment && (s.ref = t ? eW(t, u) : u), H.cloneElement(n, s)
                        }
                        return H.Children.count(n) > 1 ? H.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    o = H.forwardRef(function(e, t) {
                        var n = e.children,
                            o = tj(e, ["children"]),
                            i = H.Children.toArray(n),
                            a = i.find(tI);
                        if (a) {
                            var l = a.props.children,
                                c = i.map(function(e) {
                                    return e !== a ? e : H.Children.count(l) > 1 ? H.Children.only(null) : H.isValidElement(l) ? l.props.children : null
                                });
                            return (0, U.jsx)(r, tx(tO({}, o), {
                                ref: t,
                                children: H.isValidElement(l) ? H.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, U.jsx)(r, tx(tO({}, o), {
                            ref: t,
                            children: n
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var tE = Symbol("radix.slottable");

            function tI(e) {
                return H.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tE
            }

            function tA(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function tC(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        tA(e, t, n[t])
                    })
                }
                return e
            }

            function tR(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }
            var tk = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var n = tP("Primitive.".concat(t)),
                    r = H.forwardRef(function(e, r) {
                        var o = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, o = {},
                                        i = Object.keys(e);
                                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                                }
                                return o
                            }(e, ["asChild"]),
                            a = o ? n : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, U.jsx)(a, tR(tC({}, i), {
                            ref: r
                        }))
                    });
                return r.displayName = "Primitive.".concat(t), tR(tC({}, e), tA({}, t, r))
            }, {});

            function tN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tT(e) {
                var t = H.useRef(e);
                return H.useEffect(function() {
                    t.current = e
                }), H.useMemo(function() {
                    return function() {
                        for (var e, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return tN(e)
                        }(r) || function(e) {
                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return tN(e, void 0);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tN(e, t)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function tD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function t_(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || tM(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tM(e, t) {
                if (e) {
                    if ("string" == typeof e) return tD(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tD(e, t)
                }
            }
            var tL = "focusScope.autoFocusOnMount",
                tF = "focusScope.autoFocusOnUnmount",
                tU = {
                    bubbles: !1,
                    cancelable: !0
                },
                tz = H.forwardRef(function(e, t) {
                    var n, r, o = e.loop,
                        i = void 0 !== o && o,
                        a = e.trapped,
                        l = void 0 !== a && a,
                        c = e.onMountAutoFocus,
                        u = e.onUnmountAutoFocus,
                        s = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = {},
                                    i = Object.keys(e);
                                for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                            }
                            return o
                        }(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        f = t_(H.useState(null), 2),
                        d = f[0],
                        p = f[1],
                        m = tT(c),
                        h = tT(u),
                        y = H.useRef(null),
                        b = eB(t, function(e) {
                            return p(e)
                        }),
                        v = H.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    H.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                    if (!v.paused && d) {
                                        var t = e.target;
                                        d.contains(t) ? y.current = t : tG(y.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!v.paused && d) {
                                        var t = e.relatedTarget;
                                        null !== t && (d.contains(t) || tG(y.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                            var n = new MutationObserver(function(e) {
                                if (document.activeElement === document.body) {
                                    var t = !0,
                                        n = !1,
                                        r = void 0;
                                    try {
                                        for (var o, i = e[Symbol.iterator](); !(t = (o = i.next()).done); t = !0) o.value.removedNodes.length > 0 && tG(d)
                                    } catch (e) {
                                        n = !0, r = e
                                    } finally {
                                        try {
                                            t || null == i.return || i.return()
                                        } finally {
                                            if (n) throw r
                                        }
                                    }
                                }
                            });
                            return d && n.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), n.disconnect()
                                }
                        }
                    }, [l, d, v.paused]), H.useEffect(function() {
                        if (d) {
                            tH.add(v);
                            var e = document.activeElement;
                            if (!d.contains(e)) {
                                var t = new CustomEvent(tL, tU);
                                d.addEventListener(tL, m), d.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        n = t.select,
                                        r = void 0 !== n && n,
                                        o = document.activeElement,
                                        i = !0,
                                        a = !1,
                                        l = void 0;
                                    try {
                                        for (var c, u = e[Symbol.iterator](); !(i = (c = u.next()).done); i = !0) {
                                            var s = c.value;
                                            if (tG(s, {
                                                    select: r
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        a = !0, l = e
                                    } finally {
                                        try {
                                            i || null == u.return || u.return()
                                        } finally {
                                            if (a) throw l
                                        }
                                    }
                                }(tW(d).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && tG(d))
                            }
                            return function() {
                                d.removeEventListener(tL, m), setTimeout(function() {
                                    var t = new CustomEvent(tF, tU);
                                    d.addEventListener(tF, h), d.dispatchEvent(t), t.defaultPrevented || tG(null != e ? e : document.body, {
                                        select: !0
                                    }), d.removeEventListener(tF, h), tH.remove(v)
                                }, 0)
                            }
                        }
                    }, [d, m, h, v]);
                    var g = H.useCallback(function(e) {
                        if ((i || l) && !v.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                n = document.activeElement;
                            if (t && n) {
                                var r, o, a = e.currentTarget,
                                    c = t_([tB(o = tW(r = a), r), tB(o.reverse(), r)], 2),
                                    u = c[0],
                                    s = c[1];
                                u && s ? e.shiftKey || n !== s ? e.shiftKey && n === u && (e.preventDefault(), i && tG(s, {
                                    select: !0
                                })) : (e.preventDefault(), i && tG(u, {
                                    select: !0
                                })) : n === a && e.preventDefault()
                            }
                        }
                    }, [i, l, v.paused]);
                    return (0, U.jsx)(tk.div, (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        tabIndex: -1
                    }, s), r = r = {
                        ref: b,
                        onKeyDown: g
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                    }), n))
                });

            function tW(e) {
                for (var t = [], n = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); n.nextNode();) t.push(n.currentNode);
                return t
            }

            function tB(e, t) {
                var n = !0,
                    r = !1,
                    o = void 0;
                try {
                    for (var i, a = e[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                        var l = i.value;
                        if (! function(e, t) {
                                var n = t.upTo;
                                if ("hidden" === getComputedStyle(e).visibility) return !0;
                                for (; e && (void 0 === n || e !== n);) {
                                    if ("none" === getComputedStyle(e).display) return !0;
                                    e = e.parentElement
                                }
                                return !1
                            }(l, {
                                upTo: t
                            })) return l
                    }
                } catch (e) {
                    r = !0, o = e
                } finally {
                    try {
                        n || null == a.return || a.return()
                    } finally {
                        if (r) throw o
                    }
                }
            }

            function tG(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = t.select;
                if (e && e.focus) {
                    var r, o, i, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (o = r = e, null != (i = HTMLInputElement) && "undefined" != typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) && "select" in r && void 0 !== n && n && e.select()
                }
            }
            tz.displayName = "FocusScope";
            var tH = (t = [], {
                add: function(e) {
                    var n = t[0];
                    e !== n && (null == n || n.pause()), (t = tV(t, e)).unshift(e)
                },
                remove: function(e) {
                    var n;
                    null == (n = (t = tV(t, e))[0]) || n.resume()
                }
            });

            function tV(e, t) {
                var n = function(e) {
                        if (Array.isArray(e)) return tD(e)
                    }(e) || function(e) {
                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || tM(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    r = n.indexOf(t);
                return -1 !== r && n.splice(r, 1), n
            }
            var tJ = (null == (M = globalThis) ? void 0 : M.document) ? H.useLayoutEffect : function() {};

            function t$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var tX = H[" useId ".trim().toString()] || function() {},
                tq = 0,
                tY = ["top", "right", "bottom", "left"],
                tK = Math.min,
                tZ = Math.max,
                tQ = Math.round,
                t0 = Math.floor,
                t1 = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                t2 = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                t3 = {
                    start: "end",
                    end: "start"
                };

            function t4(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function t5(e) {
                return e.split("-")[0]
            }

            function t8(e) {
                return e.split("-")[1]
            }

            function t6(e) {
                return "x" === e ? "y" : "x"
            }

            function t7(e) {
                return "y" === e ? "height" : "width"
            }
            var t9 = new Set(["top", "bottom"]);

            function ne(e) {
                return t9.has(t5(e)) ? "y" : "x"
            }

            function nt(e) {
                return e.replace(/start|end/g, function(e) {
                    return t3[e]
                })
            }
            var nn = ["left", "right"],
                nr = ["right", "left"],
                no = ["top", "bottom"],
                ni = ["bottom", "top"];

            function na(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return t2[e]
                })
            }

            function nl(e) {
                return "number" != typeof e ? function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            var r;
                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                value: r,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = r
                        })
                    }
                    return e
                }({
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0
                }, e) : {
                    top: e,
                    right: e,
                    bottom: e,
                    left: e
                }
            }

            function nc(e) {
                var t = e.x,
                    n = e.y,
                    r = e.width,
                    o = e.height;
                return {
                    width: r,
                    height: o,
                    top: n,
                    left: t,
                    right: t + r,
                    bottom: n + o,
                    x: t,
                    y: n
                }
            }

            function nu(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ns(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function nf(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            ns(i, r, o, a, l, "next", e)
                        }

                        function l(e) {
                            ns(i, r, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function nd(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function np(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        nd(e, t, n[t])
                    })
                }
                return e
            }

            function nm(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function nh(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function ny(e) {
                return function(e) {
                    if (Array.isArray(e)) return nu(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nu(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nu(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nb(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function nv(e, t, n) {
                var r, o = e.reference,
                    i = e.floating,
                    a = ne(t),
                    l = t6(ne(t)),
                    c = t7(l),
                    u = t5(t),
                    s = "y" === a,
                    f = o.x + o.width / 2 - i.width / 2,
                    d = o.y + o.height / 2 - i.height / 2,
                    p = o[c] / 2 - i[c] / 2;
                switch (u) {
                    case "top":
                        r = {
                            x: f,
                            y: o.y - i.height
                        };
                        break;
                    case "bottom":
                        r = {
                            x: f,
                            y: o.y + o.height
                        };
                        break;
                    case "right":
                        r = {
                            x: o.x + o.width,
                            y: d
                        };
                        break;
                    case "left":
                        r = {
                            x: o.x - i.width,
                            y: d
                        };
                        break;
                    default:
                        r = {
                            x: o.x,
                            y: o.y
                        }
                }
                switch (t8(t)) {
                    case "start":
                        r[l] -= p * (n && s ? -1 : 1);
                        break;
                    case "end":
                        r[l] += p * (n && s ? -1 : 1)
                }
                return r
            }

            function ng(e, t) {
                return nf(function() {
                    var n, r, o, i, a, l, c, u, s, f, d, p, m, h, y, b, v, g, w, O, x, j, S, P, E, I, A, C, R, k, N;
                    return nb(this, function(T) {
                        switch (T.label) {
                            case 0:
                                return void 0 === t && (t = {}), r = e.x, o = e.y, i = e.platform, a = e.rects, l = e.elements, c = e.strategy, f = void 0 === (s = (u = t4(t, e)).boundary) ? "clippingAncestors" : s, p = void 0 === (d = u.rootBoundary) ? "viewport" : d, h = void 0 === (m = u.elementContext) ? "floating" : m, b = void 0 !== (y = u.altBoundary) && y, g = nl(void 0 === (v = u.padding) ? 0 : v), w = "floating" === h ? "reference" : "floating", O = l[b ? w : h], j = i.getClippingRect, S = {}, [4, null == i.isElement ? void 0 : i.isElement(O)];
                            case 1:
                                if (!(null == (n = T.sent()) || n)) return [3, 2];
                                return P = O, [3, 5];
                            case 2:
                                if (E = O.contextElement) return [3, 4];
                                return [4, null == i.getDocumentElement ? void 0 : i.getDocumentElement(l.floating)];
                            case 3:
                                E = T.sent(), T.label = 4;
                            case 4:
                                P = E, T.label = 5;
                            case 5:
                                return [4, j.apply(i, [(S.element = P, S.boundary = f, S.rootBoundary = p, S.strategy = c, S)])];
                            case 6:
                                return x = nc.apply(void 0, [T.sent()]), I = "floating" === h ? {
                                    x: r,
                                    y: o,
                                    width: a.floating.width,
                                    height: a.floating.height
                                } : a.reference, [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(l.floating)];
                            case 7:
                                return A = T.sent(), [4, null == i.isElement ? void 0 : i.isElement(A)];
                            case 8:
                                if (!T.sent()) return [3, 10];
                                return [4, null == i.getScale ? void 0 : i.getScale(A)];
                            case 9:
                                return R = T.sent() || {
                                    x: 1,
                                    y: 1
                                }, [3, 11];
                            case 10:
                                R = {
                                    x: 1,
                                    y: 1
                                }, T.label = 11;
                            case 11:
                                if (C = R, !i.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 13];
                                return [4, i.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: l,
                                    rect: I,
                                    offsetParent: A,
                                    strategy: c
                                })];
                            case 12:
                                return N = T.sent(), [3, 14];
                            case 13:
                                N = I, T.label = 14;
                            case 14:
                                return k = nc.apply(void 0, [N]), [2, {
                                    top: (x.top - k.top + g.top) / C.y,
                                    bottom: (k.bottom - x.bottom + g.bottom) / C.y,
                                    left: (x.left - k.left + g.left) / C.x,
                                    right: (k.right - x.right + g.right) / C.x
                                }]
                        }
                    })
                })()
            }

            function nw(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function nO(e) {
                return tY.some(function(t) {
                    return e[t] >= 0
                })
            }
            var nx = new Set(["left", "top"]);

            function nj(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function nS() {
                return "undefined" != typeof window
            }

            function nP(e) {
                return nA(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function nE(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function nI(e) {
                var t;
                return null == (t = (nA(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function nA(e) {
                return !!nS() && (nj(e, Node) || nj(e, nE(e).Node))
            }

            function nC(e) {
                return !!nS() && (nj(e, Element) || nj(e, nE(e).Element))
            }

            function nR(e) {
                return !!nS() && (nj(e, HTMLElement) || nj(e, nE(e).HTMLElement))
            }

            function nk(e) {
                return !!nS() && "undefined" != typeof ShadowRoot && (nj(e, ShadowRoot) || nj(e, nE(e).ShadowRoot))
            }
            var nN = new Set(["inline", "contents"]);

            function nT(e) {
                var t = nH(e),
                    n = t.overflow,
                    r = t.overflowX,
                    o = t.overflowY,
                    i = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(n + o + r) && !nN.has(i)
            }
            var nD = new Set(["table", "td", "th"]),
                n_ = [":popover-open", ":modal"];

            function nM(e) {
                return n_.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var nL = ["transform", "translate", "scale", "rotate", "perspective"],
                nF = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                nU = ["paint", "layout", "strict", "content"];

            function nz(e) {
                var t = nW(),
                    n = nC(e) ? nH(e) : e;
                return nL.some(function(e) {
                    return !!n[e] && "none" !== n[e]
                }) || !!n.containerType && "normal" !== n.containerType || !t && !!n.backdropFilter && "none" !== n.backdropFilter || !t && !!n.filter && "none" !== n.filter || nF.some(function(e) {
                    return (n.willChange || "").includes(e)
                }) || nU.some(function(e) {
                    return (n.contain || "").includes(e)
                })
            }

            function nW() {
                return "undefined" != typeof CSS && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var nB = new Set(["html", "body", "#document"]);

            function nG(e) {
                return nB.has(nP(e))
            }

            function nH(e) {
                return nE(e).getComputedStyle(e)
            }

            function nV(e) {
                return nC(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function nJ(e) {
                if ("html" === nP(e)) return e;
                var t = e.assignedSlot || e.parentNode || nk(e) && e.host || nI(e);
                return nk(t) ? t.host : t
            }

            function n$(e, t, n) {
                void 0 === t && (t = []), void 0 === n && (n = !0);
                var r, o = function e(t) {
                        var n = nJ(t);
                        return nG(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : nR(n) && nT(n) ? n : e(n)
                    }(e),
                    i = o === (null == (r = e.ownerDocument) ? void 0 : r.body),
                    a = nE(o);
                if (i) {
                    var l = nX(a);
                    return t.concat(a, a.visualViewport || [], nT(o) ? o : [], l && n ? n$(l) : [])
                }
                return t.concat(o, n$(o, [], n))
            }

            function nX(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function nq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function nY(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function nK(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function nZ(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function nQ(e) {
                return function(e) {
                    if (Array.isArray(e)) return nq(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || n0(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n0(e, t) {
                if (e) {
                    if ("string" == typeof e) return nq(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nq(e, t)
                }
            }

            function n1(e) {
                var t = nH(e),
                    n = parseFloat(t.width) || 0,
                    r = parseFloat(t.height) || 0,
                    o = nR(e),
                    i = o ? e.offsetWidth : n,
                    a = o ? e.offsetHeight : r,
                    l = tQ(n) !== i || tQ(r) !== a;
                return l && (n = i, r = a), {
                    width: n,
                    height: r,
                    $: l
                }
            }

            function n2(e) {
                return nC(e) ? e : e.contextElement
            }

            function n3(e) {
                var t = n2(e);
                if (!nR(t)) return t1(1);
                var n = t.getBoundingClientRect(),
                    r = n1(t),
                    o = r.width,
                    i = r.height,
                    a = r.$,
                    l = (a ? tQ(n.width) : n.width) / o,
                    c = (a ? tQ(n.height) : n.height) / i;
                return l && Number.isFinite(l) || (l = 1), c && Number.isFinite(c) || (c = 1), {
                    x: l,
                    y: c
                }
            }
            var n4 = t1(0);

            function n5(e) {
                var t = nE(e);
                return nW() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : n4
            }

            function n8(e, t, n, r) {
                void 0 === t && (t = !1), void 0 === n && (n = !1);
                var o, i = e.getBoundingClientRect(),
                    a = n2(e),
                    l = t1(1);
                t && (r ? nC(r) && (l = n3(r)) : l = n3(e));
                var c = (void 0 === (o = n) && (o = !1), r && (!o || r === nE(a)) && o) ? n5(a) : t1(0),
                    u = (i.left + c.x) / l.x,
                    s = (i.top + c.y) / l.y,
                    f = i.width / l.x,
                    d = i.height / l.y;
                if (a)
                    for (var p = nE(a), m = r && nC(r) ? nE(r) : r, h = p, y = nX(h); y && r && m !== h;) {
                        var b = n3(y),
                            v = y.getBoundingClientRect(),
                            g = nH(y),
                            w = v.left + (y.clientLeft + parseFloat(g.paddingLeft)) * b.x,
                            O = v.top + (y.clientTop + parseFloat(g.paddingTop)) * b.y;
                        u *= b.x, s *= b.y, f *= b.x, d *= b.y, u += w, s += O, y = nX(h = nE(y))
                    }
                return nc({
                    width: f,
                    height: d,
                    x: u,
                    y: s
                })
            }

            function n6(e, t) {
                var n = nV(e).scrollLeft;
                return t ? t.left + n : n8(nI(e)).left + n
            }

            function n7(e, t) {
                var n = e.getBoundingClientRect();
                return {
                    x: n.left + t.scrollLeft - n6(e, n),
                    y: n.top + t.scrollTop
                }
            }
            var n9 = new Set(["absolute", "fixed"]);

            function re(e, t, n) {
                if ("viewport" === t) r = function(e, t) {
                    var n = nE(e),
                        r = nI(e),
                        o = n.visualViewport,
                        i = r.clientWidth,
                        a = r.clientHeight,
                        l = 0,
                        c = 0;
                    if (o) {
                        i = o.width, a = o.height;
                        var u = nW();
                        (!u || u && "fixed" === t) && (l = o.offsetLeft, c = o.offsetTop)
                    }
                    var s = n6(r);
                    if (s <= 0) {
                        var f = r.ownerDocument,
                            d = f.body,
                            p = getComputedStyle(d),
                            m = "CSS1Compat" === f.compatMode && parseFloat(p.marginLeft) + parseFloat(p.marginRight) || 0,
                            h = Math.abs(r.clientWidth - d.clientWidth - m);
                        h <= 25 && (i -= h)
                    } else s <= 25 && (i += s);
                    return {
                        width: i,
                        height: a,
                        x: l,
                        y: c
                    }
                }(e, n);
                else if ("document" === t) o = nI(e), i = nI(o), a = nV(o), l = o.ownerDocument.body, c = tZ(i.scrollWidth, i.clientWidth, l.scrollWidth, l.clientWidth), u = tZ(i.scrollHeight, i.clientHeight, l.scrollHeight, l.clientHeight), s = -a.scrollLeft + n6(o), f = -a.scrollTop, "rtl" === nH(l).direction && (s += tZ(i.clientWidth, l.clientWidth) - c), r = {
                    width: c,
                    height: u,
                    x: s,
                    y: f
                };
                else if (nC(t)) p = (d = n8(t, !0, "fixed" === n)).top + t.clientTop, m = d.left + t.clientLeft, h = nR(t) ? n3(t) : t1(1), r = {
                    width: t.clientWidth * h.x,
                    height: t.clientHeight * h.y,
                    x: m * h.x,
                    y: p * h.y
                };
                else {
                    var r, o, i, a, l, c, u, s, f, d, p, m, h, y = n5(e);
                    r = {
                        x: t.x - y.x,
                        y: t.y - y.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return nc(r)
            }

            function rt(e, t, n) {
                var r = nR(t),
                    o = nI(t),
                    i = "fixed" === n,
                    a = n8(e, !0, i, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = t1(0);
                if (r || !r && !i)
                    if (("body" !== nP(t) || nT(o)) && (l = nV(t)), r) {
                        var u = n8(t, !0, i, t);
                        c.x = u.x + t.clientLeft, c.y = u.y + t.clientTop
                    } else o && (c.x = n6(o));
                i && !r && o && (c.x = n6(o));
                var s = !o || r || i ? t1(0) : n7(o, l);
                return {
                    x: a.left + l.scrollLeft - c.x - s.x,
                    y: a.top + l.scrollTop - c.y - s.y,
                    width: a.width,
                    height: a.height
                }
            }

            function rn(e) {
                return "static" === nH(e).position
            }

            function rr(e, t) {
                if (!nR(e) || "fixed" === nH(e).position) return null;
                if (t) return t(e);
                var n = e.offsetParent;
                return nI(e) === n && (n = n.ownerDocument.body), n
            }

            function ro(e, t) {
                var n, r = nE(e);
                if (nM(e)) return r;
                if (!nR(e)) {
                    for (var o = nJ(e); o && !nG(o);) {
                        if (nC(o) && !rn(o)) return o;
                        o = nJ(o)
                    }
                    return r
                }
                for (var i = rr(e, t); i && (n = i, nD.has(nP(n))) && rn(i);) i = rr(i, t);
                return i && nG(i) && rn(i) && !nz(i) ? r : i || function(e) {
                    for (var t = nJ(e); nR(t) && !nG(t);) {
                        if (nz(t)) return t;
                        if (nM(t)) break;
                        t = nJ(t)
                    }
                    return null
                }(e) || r
            }
            var ri = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        n = e.rect,
                        r = e.offsetParent,
                        o = "fixed" === e.strategy,
                        i = nI(r),
                        a = !!t && nM(t.floating);
                    if (r === i || a && o) return n;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = t1(1),
                        u = t1(0),
                        s = nR(r);
                    if ((s || !s && !o) && (("body" !== nP(r) || nT(i)) && (l = nV(r)), nR(r))) {
                        var f = n8(r);
                        c = n3(r), u.x = f.x + r.clientLeft, u.y = f.y + r.clientTop
                    }
                    var d = !i || s || o ? t1(0) : n7(i, l);
                    return {
                        width: n.width * c.x,
                        height: n.height * c.y,
                        x: n.x * c.x - l.scrollLeft * c.x + u.x + d.x,
                        y: n.y * c.y - l.scrollTop * c.y + u.y + d.y
                    }
                },
                getDocumentElement: nI,
                getClippingRect: function(e) {
                    var t = e.element,
                        n = e.boundary,
                        r = e.rootBoundary,
                        o = e.strategy,
                        i = nQ("clippingAncestors" === n ? nM(t) ? [] : function(e, t) {
                            var n = t.get(e);
                            if (n) return n;
                            for (var r = n$(e, [], !1).filter(function(e) {
                                    return nC(e) && "body" !== nP(e)
                                }), o = null, i = "fixed" === nH(e).position, a = i ? nJ(e) : e; nC(a) && !nG(a);) {
                                var l = nH(a),
                                    c = nz(a);
                                c || "fixed" !== l.position || (o = null), (i ? !c && !o : !c && "static" === l.position && !!o && n9.has(o.position) || nT(a) && !c && function e(t, n) {
                                    var r = nJ(t);
                                    return !(r === n || !nC(r) || nG(r)) && ("fixed" === nH(r).position || e(r, n))
                                }(e, a)) ? r = r.filter(function(e) {
                                    return e !== a
                                }) : o = l, a = nJ(a)
                            }
                            return t.set(e, r), r
                        }(t, this._c) : [].concat(n)).concat([r]),
                        a = i[0],
                        l = i.reduce(function(e, n) {
                            var r = re(t, n, o);
                            return e.top = tZ(r.top, e.top), e.right = tK(r.right, e.right), e.bottom = tK(r.bottom, e.bottom), e.left = tZ(r.left, e.left), e
                        }, re(t, a, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: ro,
                getElementRects: function(e) {
                    var t;
                    return (t = function() {
                        var t, n, r, o;
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return t = this.getOffsetParent || ro, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return n = i.sent(), r = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (r.reference = rt.apply(void 0, o.concat([i.sent(), e.strategy])), r.floating = {
                                        x: 0,
                                        y: 0,
                                        width: n.width,
                                        height: n.height
                                    }, r)]
                            }
                        })
                    }, function() {
                        var e = this,
                            n = arguments;
                        return new Promise(function(r, o) {
                            var i = t.apply(e, n);

                            function a(e) {
                                nY(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                nY(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = n1(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: n3,
                isElement: nC,
                isRTL: function(e) {
                    return "rtl" === nH(e).direction
                }
            };

            function ra(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function rl(e, t, n, r) {
                void 0 === r && (r = {});
                var o, i = r.ancestorScroll,
                    a = void 0 === i || i,
                    l = r.ancestorResize,
                    c = void 0 === l || l,
                    u = r.elementResize,
                    s = void 0 === u ? "function" == typeof ResizeObserver : u,
                    f = r.layoutShift,
                    d = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    p = r.animationFrame,
                    m = void 0 !== p && p,
                    h = n2(e),
                    y = a || c ? nQ(h ? n$(h) : []).concat(nQ(n$(t))) : [];
                y.forEach(function(e) {
                    a && e.addEventListener("scroll", n, {
                        passive: !0
                    }), c && e.addEventListener("resize", n)
                });
                var b = h && d ? function(e, t) {
                        var n, r = null,
                            o = nI(e);

                        function i() {
                            var e;
                            clearTimeout(n), null == (e = r) || e.disconnect(), r = null
                        }
                        return ! function a(l, c) {
                            void 0 === l && (l = !1), void 0 === c && (c = 1), i();
                            var u = e.getBoundingClientRect(),
                                s = u.left,
                                f = u.top,
                                d = u.width,
                                p = u.height;
                            if (l || t(), d && p) {
                                var m = {
                                        rootMargin: -t0(f) + "px " + -t0(o.clientWidth - (s + d)) + "px " + -t0(o.clientHeight - (f + p)) + "px " + -t0(s) + "px",
                                        threshold: tZ(0, tK(1, c)) || 1
                                    },
                                    h = !0;
                                try {
                                    r = new IntersectionObserver(y, nZ(nK({}, m), {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    r = new IntersectionObserver(y, m)
                                }
                                r.observe(e)
                            }

                            function y(t) {
                                var r = t[0].intersectionRatio;
                                if (r !== c) {
                                    if (!h) return a();
                                    r ? a(!1, r) : n = setTimeout(function() {
                                        a(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== r || ra(u, e.getBoundingClientRect()) || a(), h = !1
                            }
                        }(!0), i
                    }(h, n) : null,
                    v = -1,
                    g = null;
                s && (g = new ResizeObserver(function(e) {
                    var r = (function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e, t) {
                        var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, r = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw r
                                }
                            }
                            return i
                        }
                    }(e, 1) || n0(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    r && r.target === h && g && (g.unobserve(t), cancelAnimationFrame(v), v = requestAnimationFrame(function() {
                        var e;
                        null == (e = g) || e.observe(t)
                    })), n()
                }), h && !m && g.observe(h), g.observe(t));
                var w = m ? n8(e) : null;
                return m && function t() {
                        var r = n8(e);
                        w && !ra(w, r) && n(), w = r, o = requestAnimationFrame(t)
                    }(), n(),
                    function() {
                        var e;
                        y.forEach(function(e) {
                            a && e.removeEventListener("scroll", n), c && e.removeEventListener("resize", n)
                        }), null == b || b(), null == (e = g) || e.disconnect(), g = null, m && cancelAnimationFrame(o)
                    }
            }
            var rc = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return nf(function() {
                                var n, r, o, i, a, l, c, u, s, f, d, p, m, h, y, b, v, g, w, O, x, j, S, P, E, I, A, C, R, k, N, T, D, _, M, L, F;
                                return nb(this, function(U) {
                                    switch (U.label) {
                                        case 0:
                                            if (n = t.x, r = t.y, o = t.placement, i = t.rects, a = t.platform, l = t.elements, c = t.middlewareData, s = (u = t4(e, t) || {}).element, d = void 0 === (f = u.padding) ? 0 : f, null == s) return [2, {}];
                                            return p = nl(d), m = {
                                                x: n,
                                                y: r
                                            }, y = t7(h = t6(ne(o))), [4, a.getDimensions(s)];
                                        case 1:
                                            return b = U.sent(), g = (v = "y" === h) ? "top" : "left", w = v ? "bottom" : "right", O = v ? "clientHeight" : "clientWidth", x = i.reference[y] + i.reference[h] - m[h] - i.floating[y], j = m[h] - i.reference[h], [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(s)];
                                        case 2:
                                            if (E = !(P = (S = U.sent()) ? S[O] : 0)) return [3, 4];
                                            return [4, null == a.isElement ? void 0 : a.isElement(S)];
                                        case 3:
                                            E = !U.sent(), U.label = 4;
                                        case 4:
                                            return E && (P = l.floating[O] || i.floating[y]), I = x / 2 - j / 2, A = P / 2 - b[y] / 2 - 1, C = tK(p[g], A), R = tK(p[w], A), k = C, N = P - b[y] - R, D = tZ(k, tK(T = P / 2 - b[y] / 2 + I, N)), M = (_ = !c.arrow && null != t8(o) && T !== D && i.reference[y] / 2 - (T < k ? C : R) - b[y] / 2 < 0) ? T < k ? T - k : T - N : 0, [2, (nd(F = {}, h, m[h] + M), nd(F, "data", np((nd(L = {}, h, D), nd(L, "centerOffset", T - D - M), L), _ && {
                                                alignmentOffset: M
                                            })), nd(F, "reset", _), F)]
                                    }
                                })
                            })()
                        }
                    }
                },
                ru = function(e, t, n) {
                    var r, o = new Map,
                        i = nK({
                            platform: ri
                        }, n),
                        a = nZ(nK({}, i.platform), {
                            _c: o
                        });
                    return r = nZ(nK({}, i), {
                        platform: a
                    }), nf(function() {
                        var n, o, i, a, l, c, u, s, f, d, p, m, h, y, b, v, g, w, O, x, j, S, P, E, I, A;
                        return nb(this, function(C) {
                            switch (C.label) {
                                case 0:
                                    return o = void 0 === (n = r.placement) ? "bottom" : n, a = void 0 === (i = r.strategy) ? "absolute" : i, c = void 0 === (l = r.middleware) ? [] : l, u = r.platform, s = c.filter(Boolean), [4, null == u.isRTL ? void 0 : u.isRTL(t)];
                                case 1:
                                    return f = C.sent(), [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 2:
                                    m = (p = nv(d = C.sent(), o, f)).x, h = p.y, y = o, b = {}, v = 0, g = 0, C.label = 3;
                                case 3:
                                    if (!(g < s.length)) return [3, 11];
                                    return O = (w = s[g]).name, [4, (0, w.fn)({
                                        x: m,
                                        y: h,
                                        initialPlacement: o,
                                        placement: y,
                                        strategy: a,
                                        middlewareData: b,
                                        rects: d,
                                        platform: u,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    var R;
                                    if (j = (x = C.sent()).x, S = x.y, P = x.data, E = x.reset, m = null != j ? j : m, h = null != S ? S : h, b = nm(np({}, b), nd({}, O, np({}, b[O], P))), !(E && v <= 50)) return [3, 10];
                                    if (v++, (void 0 === E ? "undefined" : (R = E) && "undefined" != typeof Symbol && R.constructor === Symbol ? "symbol" : typeof R) != "object") return [3, 9];
                                    if (E.placement && (y = E.placement), !E.rects) return [3, 8];
                                    if (!0 !== E.rects) return [3, 6];
                                    return [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 5:
                                    return I = C.sent(), [3, 7];
                                case 6:
                                    I = E.rects, C.label = 7;
                                case 7:
                                    d = I, C.label = 8;
                                case 8:
                                    m = (A = nv(d, y, f)).x, h = A.y, C.label = 9;
                                case 9:
                                    g = -1, C.label = 10;
                                case 10:
                                    return g++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: m,
                                        y: h,
                                        placement: y,
                                        strategy: a,
                                        middlewareData: b
                                    }]
                            }
                        })
                    })()
                };

            function rs(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rf(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function rd(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function rp(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rs(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rs(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rm(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var rh = "undefined" != typeof document ? H.useLayoutEffect : function() {};

            function ry(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : rm(e)) !== (void 0 === t ? "undefined" : rm(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : rm(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((n = e.length) !== t.length) return !1;
                        for (r = n; 0 != r--;)
                            if (!ry(e[r], t[r])) return !1;
                        return !0
                    }
                    if ((n = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (r = n; 0 != r--;)
                        if (!({}).hasOwnProperty.call(t, o[r])) return !1;
                    for (r = n; 0 != r--;) {
                        var n, r, o, i = o[r];
                        if (("_owner" !== i || !e.$$typeof) && !ry(e[i], t[i])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function rb(e) {
                return "undefined" == typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function rv(e, t) {
                var n = rb(e);
                return Math.round(t * n) / n
            }

            function rg(e) {
                var t = H.useRef(e);
                return rh(function() {
                    t.current = e
                }), t
            }
            var rw = function(e, t) {
                    var n;
                    return rd(rf({}, (void 0 === (n = e) && (n = 0), {
                        name: "offset",
                        options: n,
                        fn: function(e) {
                            return nf(function() {
                                var t, r, o, i, a, l, c;
                                return nb(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            var s;
                                            return o = e.x, i = e.y, a = e.placement, l = e.middlewareData, [4, (s = n, nf(function() {
                                                var t, n, r, o, i, a, l, c, u, f, d, p, m, h;
                                                return nb(this, function(y) {
                                                    switch (y.label) {
                                                        case 0:
                                                            return t = e.placement, n = e.platform, r = e.elements, [4, null == n.isRTL ? void 0 : n.isRTL(r.floating)];
                                                        case 1:
                                                            return o = y.sent(), i = t5(t), a = t8(t), l = "y" === ne(t), c = nx.has(i) ? -1 : 1, u = o && l ? -1 : 1, p = (d = "number" == typeof(f = t4(s, e)) ? {
                                                                mainAxis: f,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: f.mainAxis || 0,
                                                                crossAxis: f.crossAxis || 0,
                                                                alignmentAxis: f.alignmentAxis
                                                            }).mainAxis, m = d.crossAxis, h = d.alignmentAxis, a && "number" == typeof h && (m = "end" === a ? -1 * h : h), [2, l ? {
                                                                x: m * u,
                                                                y: p * c
                                                            } : {
                                                                x: p * c,
                                                                y: m * u
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (c = u.sent(), a === (null == (t = l.offset) ? void 0 : t.placement) && null != (r = l.arrow) && r.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: o + c.x,
                                                y: i + c.y,
                                                data: nm(np({}, c), {
                                                    placement: a
                                                })
                                            }]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                rO = function(e, t) {
                    var n;
                    return rd(rf({}, (void 0 === (n = e) && (n = {}), {
                        name: "shift",
                        options: n,
                        fn: function(e) {
                            return nf(function() {
                                var t, r, o, i, a, l, c, u, s, f, d, p, m, h, y, b, v, g, w, O, x, j, S, P, E, I, A, C;
                                return nb(this, function(R) {
                                    switch (R.label) {
                                        case 0:
                                            return t = e.x, r = e.y, o = e.placement, l = void 0 === (a = (i = t4(n, e)).mainAxis) || a, u = void 0 !== (c = i.crossAxis) && c, f = void 0 === (s = i.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, d = nh(i, ["mainAxis", "crossAxis", "limiter"]), p = {
                                                x: t,
                                                y: r
                                            }, [4, ng(e, d)];
                                        case 1:
                                            return m = R.sent(), b = p[y = t6(h = ne(t5(o)))], v = p[h], l && (g = "y" === y ? "top" : "left", w = "y" === y ? "bottom" : "right", O = b + m[g], x = b - m[w], b = tZ(O, tK(b, x))), u && (j = "y" === h ? "top" : "left", S = "y" === h ? "bottom" : "right", P = v + m[j], E = v - m[S], v = tZ(P, tK(v, E))), A = f.fn(nm(np({}, e), (nd(I = {}, y, b), nd(I, h, v), I))), [2, nm(np({}, A), {
                                                data: {
                                                    x: A.x - t,
                                                    y: A.y - r,
                                                    enabled: (nd(C = {}, y, l), nd(C, h, u), C)
                                                }
                                            })]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                rx = function(e, t) {
                    var n;
                    return rd(rf({}, (void 0 === (n = e) && (n = {}), {
                        options: n,
                        fn: function(e) {
                            var t, r = e.x,
                                o = e.y,
                                i = e.placement,
                                a = e.rects,
                                l = e.middlewareData,
                                c = t4(n, e),
                                u = c.offset,
                                s = c.mainAxis,
                                f = c.crossAxis,
                                d = {
                                    x: r,
                                    y: o
                                },
                                p = ne(i),
                                m = t6(p),
                                h = d[m],
                                y = d[p],
                                b = t4(void 0 === u ? 0 : u, e),
                                v = "number" == typeof b ? {
                                    mainAxis: b,
                                    crossAxis: 0
                                } : np({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, b);
                            if (void 0 === s || s) {
                                var g = "y" === m ? "height" : "width",
                                    w = a.reference[m] - a.floating[g] + v.mainAxis,
                                    O = a.reference[m] + a.reference[g] - v.mainAxis;
                                h < w ? h = w : h > O && (h = O)
                            }
                            if (void 0 === f || f) {
                                var x, j, S = "y" === m ? "width" : "height",
                                    P = nx.has(t5(i)),
                                    E = a.reference[p] - a.floating[S] + (P && (null == (x = l.offset) ? void 0 : x[p]) || 0) + (P ? 0 : v.crossAxis),
                                    I = a.reference[p] + a.reference[S] + (P ? 0 : (null == (j = l.offset) ? void 0 : j[p]) || 0) - (P ? v.crossAxis : 0);
                                y < E ? y = E : y > I && (y = I)
                            }
                            return nd(t = {}, m, h), nd(t, p, y), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                rj = function(e, t) {
                    var n;
                    return rd(rf({}, (void 0 === (n = e) && (n = {}), {
                        name: "flip",
                        options: n,
                        fn: function(e) {
                            return nf(function() {
                                var t, r, o, i, a, l, c, u, s, f, d, p, m, h, y, b, v, g, w, O, x, j, S, P, E, I, A, C, R, k, N, T, D, _, M, L, F, U, z, W;
                                return nb(this, function(B) {
                                    var G, H, V, J, $, X, q, Y, K, Z, Q, ee, et, en, er;
                                    switch (B.label) {
                                        case 0:
                                            if (o = e.placement, i = e.middlewareData, a = e.rects, l = e.initialPlacement, c = e.platform, u = e.elements, d = void 0 === (f = (s = t4(n, e)).mainAxis) || f, m = void 0 === (p = s.crossAxis) || p, h = s.fallbackPlacements, b = void 0 === (y = s.fallbackStrategy) ? "bestFit" : y, g = void 0 === (v = s.fallbackAxisSideDirection) ? "none" : v, O = void 0 === (w = s.flipAlignment) || w, x = nh(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = i.arrow) && t.alignmentOffset) return [2, {}];
                                            return j = t5(o), S = ne(l), P = t5(l) === l, [4, null == c.isRTL ? void 0 : c.isRTL(u.floating)];
                                        case 1:
                                            return E = B.sent(), I = h || (P || !O ? [na(l)] : (H = na(G = l), [nt(G), H, nt(H)])), A = "none" !== g, !h && A && (C = I).push.apply(C, ny((V = l, J = O, $ = g, X = E, q = t8(V), Y = function(e, t, n) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (n) return t ? nr : nn;
                                                        return t ? nn : nr;
                                                    case "left":
                                                    case "right":
                                                        return t ? no : ni;
                                                    default:
                                                        return []
                                                }
                                            }(t5(V), "start" === $, X), q && (Y = Y.map(function(e) {
                                                return e + "-" + q
                                            }), J && (Y = Y.concat(Y.map(nt)))), Y))), R = [l].concat(ny(I)), [4, ng(e, x)];
                                        case 2:
                                            if (k = B.sent(), N = [], T = (null == (r = i.flip) ? void 0 : r.overflows) || [], d && N.push(k[j]), m && (K = o, Z = a, void 0 === (Q = E) && (Q = !1), ee = t8(K), en = t7(et = t6(ne(K))), er = "x" === et ? ee === (Q ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", Z.reference[en] > Z.floating[en] && (er = na(er)), D = [er, na(er)], N.push(k[D[0]], k[D[1]])), T = ny(T).concat([{
                                                    placement: o,
                                                    overflows: N
                                                }]), !N.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((F = R[L = ((null == (_ = i.flip) ? void 0 : _.index) || 0) + 1]) && ("alignment" !== m || S === ne(F) || T.every(function(e) {
                                                        return ne(e.placement) !== S || e.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: L,
                                                        overflows: T
                                                    },
                                                    reset: {
                                                        placement: F
                                                    }
                                                }];
                                                if (!(U = null == (M = T.filter(function(e) {
                                                        return e.overflows[0] <= 0
                                                    }).sort(function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    })[0]) ? void 0 : M.placement)) switch (b) {
                                                    case "bestFit":
                                                        (W = null == (z = T.filter(function(e) {
                                                            if (A) {
                                                                var t = ne(e.placement);
                                                                return t === S || "y" === t
                                                            }
                                                            return !0
                                                        }).map(function(e) {
                                                            return [e.placement, e.overflows.filter(function(e) {
                                                                return e > 0
                                                            }).reduce(function(e, t) {
                                                                return e + t
                                                            }, 0)]
                                                        }).sort(function(e, t) {
                                                            return e[1] - t[1]
                                                        })[0]) ? void 0 : z[0]) && (U = W);
                                                        break;
                                                    case "initialPlacement":
                                                        U = l
                                                }
                                                if (o !== U) return [2, {
                                                    reset: {
                                                        placement: U
                                                    }
                                                }]
                                            }
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                rS = function(e, t) {
                    var n;
                    return rd(rf({}, (void 0 === (n = e) && (n = {}), {
                        name: "size",
                        options: n,
                        fn: function(e) {
                            return nf(function() {
                                var t, r, o, i, a, l, c, u, s, f, d, p, m, h, y, b, v, g, w, O, x, j, S, P, E, I, A, C, R, k;
                                return nb(this, function(N) {
                                    switch (N.label) {
                                        case 0:
                                            return o = e.placement, i = e.rects, a = e.platform, l = e.elements, s = void 0 === (u = (c = t4(n, e)).apply) ? function() {} : u, [4, ng(e, nh(c, ["apply"]))];
                                        case 1:
                                            if (f = N.sent(), d = t5(o), p = t8(o), m = "y" === ne(o), y = (h = i.floating).width, b = h.height, "top" !== d && "bottom" !== d) return [3, 3];
                                            return v = d, [4, null == a.isRTL ? void 0 : a.isRTL(l.floating)];
                                        case 2:
                                            return g = p === (N.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            g = d, v = "end" === p ? "top" : "bottom", N.label = 4;
                                        case 4:
                                            return w = b - f.top - f.bottom, O = y - f.left - f.right, x = tK(b - f[v], w), j = tK(y - f[g], O), S = !e.middlewareData.shift, P = x, E = j, null != (t = e.middlewareData.shift) && t.enabled.x && (E = O), null != (r = e.middlewareData.shift) && r.enabled.y && (P = w), S && !p && (I = tZ(f.left, 0), A = tZ(f.right, 0), C = tZ(f.top, 0), R = tZ(f.bottom, 0), m ? E = y - 2 * (0 !== I || 0 !== A ? I + A : tZ(f.left, f.right)) : P = b - 2 * (0 !== C || 0 !== R ? C + R : tZ(f.top, f.bottom))), [4, s(nm(np({}, e), {
                                                availableWidth: E,
                                                availableHeight: P
                                            }))];
                                        case 5:
                                            return N.sent(), [4, a.getDimensions(l.floating)];
                                        case 6:
                                            if (k = N.sent(), y !== k.width || b !== k.height) return [2, {
                                                reset: {
                                                    rects: !0
                                                }
                                            }];
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                rP = function(e, t) {
                    var n;
                    return rd(rf({}, (void 0 === (n = e) && (n = {}), {
                        name: "hide",
                        options: n,
                        fn: function(e) {
                            return nf(function() {
                                var t, r, o, i, a, l, c;
                                return nb(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            switch (t = e.rects, i = void 0 === (o = (r = t4(n, e)).strategy) ? "referenceHidden" : o, a = nh(r, ["strategy"]), i) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, ng(e, nm(np({}, a), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = nw(u.sent(), t.reference),
                                                    referenceHidden: nO(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, ng(e, nm(np({}, a), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: c = nw(u.sent(), t.floating),
                                                    escaped: nO(c)
                                                }
                                            }];
                                        case 5:
                                            return [2, {}];
                                        case 6:
                                            return [2]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                rE = function(e, t) {
                    return rd(rf({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var n = "function" == typeof e ? e(t) : e,
                                r = n.element,
                                o = n.padding;
                            return r && ({}).hasOwnProperty.call(r, "current") ? null != r.current ? rc({
                                element: r.current,
                                padding: o
                            }).fn(t) : {} : r ? rc({
                                element: r,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                },
                rI = H.forwardRef(function(e, t) {
                    var n, r, o = e.children,
                        i = e.width,
                        a = e.height,
                        l = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = {},
                                    i = Object.keys(e);
                                for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                            }
                            return o
                        }(e, ["children", "width", "height"]);
                    return (0, U.jsx)(tk.svg, (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({}, l), r = r = {
                        ref: t,
                        width: void 0 === i ? 10 : i,
                        height: void 0 === a ? 5 : a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? o : (0, U.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                    }), n))
                });

            function rA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rR(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function rk(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        rR(e, t, n[t])
                    })
                }
                return e
            }

            function rN(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function rT(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function rD(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || r_(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function r_(e, t) {
                if (e) {
                    if ("string" == typeof e) return rC(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rC(e, t)
                }
            }
            rI.displayName = "Arrow";
            var rM = "Popper",
                rL = rD(tm(rM), 2),
                rF = rL[0],
                rU = rL[1],
                rz = rD(rF(rM), 2),
                rW = rz[0],
                rB = rz[1],
                rG = function(e) {
                    var t = e.__scopePopper,
                        n = e.children,
                        r = rD(H.useState(null), 2),
                        o = r[0],
                        i = r[1];
                    return (0, U.jsx)(rW, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: i,
                        children: n
                    })
                };
            rG.displayName = rM;
            var rH = "PopperAnchor",
                rV = H.forwardRef(function(e, t) {
                    var n = e.__scopePopper,
                        r = e.virtualRef,
                        o = rT(e, ["__scopePopper", "virtualRef"]),
                        i = rB(rH, n),
                        a = H.useRef(null),
                        l = eB(t, a);
                    return H.useEffect(function() {
                        i.onAnchorChange((null == r ? void 0 : r.current) || a.current)
                    }), r ? null : (0, U.jsx)(tk.div, rN(rk({}, o), {
                        ref: l
                    }))
                });
            rV.displayName = rH;
            var rJ = "PopperContent",
                r$ = rD(rF(rJ), 2),
                rX = r$[0],
                rq = r$[1],
                rY = H.forwardRef(function(e, t) {
                    var n, r, o, i, a, l, c, u, s, f, d, p, m, h, y, b, v, g, w, O, x, j, S, P, E, I, A, C, R, k, N, T, D, _, M, L, F, z, W, B, G, V, J, $, X, q, Y, K, Z, Q, ee, et, en, er, eo, ei, ea = e.__scopePopper,
                        el = e.side,
                        ec = e.sideOffset,
                        eu = e.align,
                        es = void 0 === eu ? "center" : eu,
                        ef = e.alignOffset,
                        ed = e.arrowPadding,
                        ep = e.avoidCollisions,
                        em = void 0 === ep || ep,
                        eh = e.collisionBoundary,
                        ey = void 0 === eh ? [] : eh,
                        eb = e.collisionPadding,
                        ev = void 0 === eb ? 0 : eb,
                        eg = e.sticky,
                        ew = e.hideWhenDetached,
                        eO = e.updatePositionStrategy,
                        ex = void 0 === eO ? "optimized" : eO,
                        ej = e.onPlaced,
                        eS = rT(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        eP = rB(rJ, ea),
                        eE = rD(H.useState(null), 2),
                        eI = eE[0],
                        eA = eE[1],
                        eC = eB(t, function(e) {
                            return eA(e)
                        }),
                        eR = rD(H.useState(null), 2),
                        ek = eR[0],
                        eN = eR[1],
                        eT = (o = (n = H.useState(void 0), r = function(e) {
                            if (Array.isArray(e)) return e
                        }(n) || function(e, t) {
                            var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, r = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (l) throw r
                                    }
                                }
                                return i
                            }
                        }(n, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return rA(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rA(e, t)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = r[1], tJ(function() {
                            if (ek) {
                                i({
                                    width: ek.offsetWidth,
                                    height: ek.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, n, r = e[0];
                                        if ("borderBoxSize" in r) {
                                            var o = r.borderBoxSize,
                                                a = Array.isArray(o) ? o[0] : o;
                                            t = a.inlineSize, n = a.blockSize
                                        } else t = ek.offsetWidth, n = ek.offsetHeight;
                                        i({
                                            width: t,
                                            height: n
                                        })
                                    }
                                });
                                return e.observe(ek, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(ek)
                                    }
                            }
                            i(void 0)
                        }, [ek]), o),
                        eD = null != (eo = null == eT ? void 0 : eT.width) ? eo : 0,
                        e_ = null != (ei = null == eT ? void 0 : eT.height) ? ei : 0,
                        eM = "number" == typeof ev ? ev : rk({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, ev),
                        eL = Array.isArray(ey) ? ey : [ey],
                        eF = eL.length > 0,
                        eU = {
                            padding: eM,
                            boundary: eL.filter(r0),
                            altBoundary: eF
                        },
                        ez = (c = void 0 === (l = (a = {
                            strategy: "fixed",
                            placement: (void 0 === el ? "bottom" : el) + ("center" !== es ? "-" + es : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return rl.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return rC(e)
                                })(t) || function(e) {
                                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || r_(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === ex
                                }]))
                            },
                            elements: {
                                reference: eP.anchor
                            },
                            middleware: [rw({
                                mainAxis: (void 0 === ec ? 0 : ec) + e_,
                                alignmentAxis: void 0 === ef ? 0 : ef
                            }), em && rO(rk({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === eg ? "partial" : eg) ? rx() : void 0
                            }, eU)), em && rj(rk({}, eU)), rS(rN(rk({}, eU), {
                                apply: function(e) {
                                    var t = e.elements,
                                        n = e.rects,
                                        r = e.availableWidth,
                                        o = e.availableHeight,
                                        i = n.reference,
                                        a = i.width,
                                        l = i.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(r, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), ek && rE({
                                element: ek,
                                padding: void 0 === ed ? 0 : ed
                            }), r1({
                                arrowWidth: eD,
                                arrowHeight: e_
                            }), void 0 !== ew && ew && rP(rk({
                                strategy: "referenceHidden"
                            }, eU))]
                        }).placement) ? "bottom" : l, s = void 0 === (u = a.strategy) ? "absolute" : u, d = void 0 === (f = a.middleware) ? [] : f, p = a.platform, y = (h = void 0 === (m = a.elements) ? {} : m).reference, b = h.floating, g = void 0 === (v = a.transform) || v, w = a.whileElementsMounted, O = a.open, j = (x = rp(H.useState({
                            x: 0,
                            y: 0,
                            strategy: s,
                            placement: c,
                            middlewareData: {},
                            isPositioned: !1
                        }), 2))[0], S = x[1], E = (P = rp(H.useState(d), 2))[0], I = P[1], ry(E, d) || I(d), C = (A = rp(H.useState(null), 2))[0], R = A[1], N = (k = rp(H.useState(null), 2))[0], T = k[1], D = H.useCallback(function(e) {
                            e !== F.current && (F.current = e, R(e))
                        }, []), _ = H.useCallback(function(e) {
                            e !== z.current && (z.current = e, T(e))
                        }, []), M = y || C, L = b || N, F = H.useRef(null), z = H.useRef(null), W = H.useRef(j), B = null != w, G = rg(w), V = rg(p), J = rg(O), $ = H.useCallback(function() {
                            if (F.current && z.current) {
                                var e = {
                                    placement: c,
                                    strategy: s,
                                    middleware: E
                                };
                                V.current && (e.platform = V.current), ru(F.current, z.current, e).then(function(e) {
                                    var t = rd(rf({}, e), {
                                        isPositioned: !1 !== J.current
                                    });
                                    X.current && !ry(W.current, t) && (W.current = t, tv.flushSync(function() {
                                        S(t)
                                    }))
                                })
                            }
                        }, [E, c, s, V, J]), rh(function() {
                            !1 === O && W.current.isPositioned && (W.current.isPositioned = !1, S(function(e) {
                                return rd(rf({}, e), {
                                    isPositioned: !1
                                })
                            }))
                        }, [O]), X = H.useRef(!1), rh(function() {
                            return X.current = !0,
                                function() {
                                    X.current = !1
                                }
                        }, []), rh(function() {
                            if (M && (F.current = M), L && (z.current = L), M && L) {
                                if (G.current) return G.current(M, L, $);
                                $()
                            }
                        }, [M, L, $, G, B]), q = H.useMemo(function() {
                            return {
                                reference: F,
                                floating: z,
                                setReference: D,
                                setFloating: _
                            }
                        }, [D, _]), Y = H.useMemo(function() {
                            return {
                                reference: M,
                                floating: L
                            }
                        }, [M, L]), K = H.useMemo(function() {
                            var e = {
                                position: s,
                                left: 0,
                                top: 0
                            };
                            if (!Y.floating) return e;
                            var t = rv(Y.floating, j.x),
                                n = rv(Y.floating, j.y);
                            return g ? rf(rd(rf({}, e), {
                                transform: "translate(" + t + "px, " + n + "px)"
                            }), rb(Y.floating) >= 1.5 && {
                                willChange: "transform"
                            }) : {
                                position: s,
                                left: t,
                                top: n
                            }
                        }, [s, g, Y.floating, j.x, j.y]), H.useMemo(function() {
                            return rd(rf({}, j), {
                                update: $,
                                refs: q,
                                elements: Y,
                                floatingStyles: K
                            })
                        }, [j, $, q, Y, K])),
                        eW = ez.refs,
                        eG = ez.floatingStyles,
                        eH = ez.placement,
                        eV = ez.isPositioned,
                        eJ = ez.middlewareData,
                        e$ = rD(r2(eH), 2),
                        eX = e$[0],
                        eq = e$[1],
                        eY = tT(ej);
                    tJ(function() {
                        eV && (null == eY || eY())
                    }, [eV, eY]);
                    var eK = null == (Z = eJ.arrow) ? void 0 : Z.x,
                        eZ = null == (Q = eJ.arrow) ? void 0 : Q.y,
                        eQ = (null == (ee = eJ.arrow) ? void 0 : ee.centerOffset) !== 0,
                        e0 = rD(H.useState(), 2),
                        e1 = e0[0],
                        e2 = e0[1];
                    return tJ(function() {
                        eI && e2(window.getComputedStyle(eI).zIndex)
                    }, [eI]), (0, U.jsx)("div", {
                        ref: eW.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: rk(rN(rk({}, eG), rR({
                            transform: eV ? eG.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: e1
                        }, "--radix-popper-transform-origin", [null == (et = eJ.transformOrigin) ? void 0 : et.x, null == (en = eJ.transformOrigin) ? void 0 : en.y].join(" "))), (null == (er = eJ.hide) ? void 0 : er.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, U.jsx)(rX, {
                            scope: ea,
                            placedSide: eX,
                            onArrowChange: eN,
                            arrowX: eK,
                            arrowY: eZ,
                            shouldHideArrow: eQ,
                            children: (0, U.jsx)(tk.div, rN(rk({
                                "data-side": eX,
                                "data-align": eq
                            }, eS), {
                                ref: eC,
                                style: rN(rk({}, eS.style), {
                                    animation: eV ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            rY.displayName = rJ;
            var rK = "PopperArrow",
                rZ = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                rQ = H.forwardRef(function(e, t) {
                    var n, r = e.__scopePopper,
                        o = rT(e, ["__scopePopper"]),
                        i = rq(rK, r),
                        a = rZ[i.placedSide];
                    return (0, U.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (rR(n = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, a, 0), rR(n, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), rR(n, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), rR(n, "visibility", i.shouldHideArrow ? "hidden" : void 0), n),
                        children: (0, U.jsx)(rI, rN(rk({}, o), {
                            ref: t,
                            style: rN(rk({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function r0(e) {
                return null !== e
            }
            rQ.displayName = rK;
            var r1 = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var n, r, o, i, a, l = t.placement,
                            c = t.rects,
                            u = t.middlewareData,
                            s = (null == (n = u.arrow) ? void 0 : n.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            d = s ? 0 : e.arrowHeight,
                            p = rD(r2(l), 2),
                            m = p[0],
                            h = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            y = (null != (i = null == (r = u.arrow) ? void 0 : r.x) ? i : 0) + f / 2,
                            b = (null != (a = null == (o = u.arrow) ? void 0 : o.y) ? a : 0) + d / 2,
                            v = "",
                            g = "";
                        return "bottom" === m ? (v = s ? h : "".concat(y, "px"), g = "".concat(-d, "px")) : "top" === m ? (v = s ? h : "".concat(y, "px"), g = "".concat(c.floating.height + d, "px")) : "right" === m ? (v = "".concat(-d, "px"), g = s ? h : "".concat(b, "px")) : "left" === m && (v = "".concat(c.floating.width + d, "px"), g = s ? h : "".concat(b, "px")), {
                            data: {
                                x: v,
                                y: g
                            }
                        }
                    }
                }
            };

            function r2(e) {
                var t = rD(e.split("-"), 2),
                    n = t[0],
                    r = t[1];
                return [n, void 0 === r ? "center" : r]
            }

            function r3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var r4 = H.forwardRef(function(e, t) {
                var n, r, o, i, a, l = e.container,
                    c = function(e, t) {
                        if (null == e) return {};
                        var n, r, o = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = {},
                                i = Object.keys(e);
                            for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                            return o
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(e);
                            for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                        }
                        return o
                    }(e, ["container"]),
                    u = (n = H.useState(!1), function(e) {
                        if (Array.isArray(e)) return e
                    }(n) || function(e, t) {
                        var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, r = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw r
                                }
                            }
                            return i
                        }
                    }(n, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return r3(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return r3(e, t)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    s = u[0],
                    f = u[1];
                tJ(function() {
                    return f(!0)
                }, []);
                var d = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return d ? tg().createPortal((0, U.jsx)(tk.div, (r = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            var r;
                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                value: r,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = r
                        })
                    }
                    return e
                }({}, c), o = o = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(o, e))
                }), r)), d) : null
            });

            function r5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function r8(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return r5(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return r5(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            r4.displayName = "Portal";
            var r6 = function(e) {
                var t, n, r, o, i, a, l, c, u, s, f, d, p, m, h, y, b, v = e.present,
                    g = e.children,
                    w = (t = v, i = (o = r8(H.useState(), 2))[0], a = o[1], l = H.useRef({}), c = H.useRef(t), u = H.useRef("none"), f = (s = r8((n = t ? "mounted" : "unmounted", r = {
                        mounted: {
                            UNMOUNT: "unmounted",
                            ANIMATION_OUT: "unmountSuspended"
                        },
                        unmountSuspended: {
                            MOUNT: "mounted",
                            ANIMATION_END: "unmounted"
                        },
                        unmounted: {
                            MOUNT: "mounted"
                        }
                    }, H.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], d = s[1], H.useEffect(function() {
                        var e = r7(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), tJ(function() {
                        var e = l.current,
                            n = c.current;
                        if (n !== t) {
                            var r = u.current,
                                o = r7(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : n && r !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), tJ(function() {
                        if (i) {
                            var e, t, n = null != (t = i.ownerDocument.defaultView) ? t : window,
                                r = function(t) {
                                    var r = r7(l.current).includes(t.animationName);
                                    if (t.target === i && r && (d("ANIMATION_END"), !c.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", e = n.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (u.current = r7(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(e), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                                }
                        }
                        d("ANIMATION_END")
                    }, [i, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: H.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    O = "function" == typeof g ? g({
                        present: w.isPresent
                    }) : H.Children.only(g),
                    x = eB(w.ref, (b = (y = null == (m = Object.getOwnPropertyDescriptor((p = O).props, "ref")) ? void 0 : m.get) && "isReactWarning" in y && y.isReactWarning) ? p.ref : (b = (y = null == (h = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : h.get) && "isReactWarning" in y && y.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || w.isPresent ? H.cloneElement(O, {
                    ref: x
                }) : null
            };

            function r7(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function r9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function oe(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return r9(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return r9(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            r6.displayName = "Presence";
            var ot = new WeakMap,
                on = new WeakMap,
                or = {},
                oo = 0,
                oi = function(e) {
                    return e && (e.host || oi(e.parentNode))
                },
                oa = function(e, t, n, r) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var n = oi(e);
                        return n && t.contains(n) ? n : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    or[n] || (or[n] = new WeakMap);
                    var i = or[n],
                        a = [],
                        l = new Set,
                        c = new Set(o),
                        u = function(e) {
                            !e || l.has(e) || (l.add(e), u(e.parentNode))
                        };
                    o.forEach(u);
                    var s = function(e) {
                        !e || c.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) s(e);
                            else try {
                                var t = e.getAttribute(r),
                                    o = null !== t && "false" !== t,
                                    c = (ot.get(e) || 0) + 1,
                                    u = (i.get(e) || 0) + 1;
                                ot.set(e, c), i.set(e, u), a.push(e), 1 === c && o && on.set(e, !0), 1 === u && e.setAttribute(n, "true"), o || e.setAttribute(r, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), oo++,
                        function() {
                            a.forEach(function(e) {
                                var t = ot.get(e) - 1,
                                    o = i.get(e) - 1;
                                ot.set(e, t), i.set(e, o), t || (on.has(e) || e.removeAttribute(r), on.delete(e)), o || e.removeAttribute(n)
                            }), --oo || (ot = new WeakMap, ot = new WeakMap, on = new WeakMap, or = {})
                        }
                },
                ol = function(e, t, n) {
                    void 0 === n && (n = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("undefined" == typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (r.push.apply(r, Array.from(o.querySelectorAll("[aria-live], script"))), oa(r, o, n, "aria-hidden")) : function() {
                        return null
                    }
                },
                oc = function() {
                    return (oc = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function ou(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) 0 > t.indexOf(r[o]) && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (n[r[o]] = e[r[o]]);
                return n
            }
            var os = "right-scroll-bar-position",
                of = "width-before-scroll-bar";

            function od(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var op = "undefined" != typeof window ? H.useLayoutEffect : H.useEffect,
                om = new WeakMap,
                oh = (void 0 === y && (y = {}), (void 0 === b && (b = function(e) {
                    return e
                }), v = [], g = !1, w = {
                    read: function() {
                        if (g) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return v.length ? v[v.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = b(e, g);
                        return v.push(t),
                            function() {
                                v = v.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (g = !0; v.length;) {
                            var t = v;
                            v = [], t.forEach(e)
                        }
                        v = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return v
                            }
                        }
                    },
                    assignMedium: function(e) {
                        g = !0;
                        var t = [];
                        if (v.length) {
                            var n = v;
                            v = [], n.forEach(e), t = v
                        }
                        var r = function() {
                                var n = t;
                                t = [], n.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(r)
                            };
                        o(), v = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), v
                            }
                        }
                    }
                }).options = oc({
                    async: !0,
                    ssr: !1
                }, y), w),
                oy = function() {},
                ob = H.forwardRef(function(e, t) {
                    var n, r, o, i, a = H.useRef(null),
                        l = H.useState({
                            onScrollCapture: oy,
                            onWheelCapture: oy,
                            onTouchMoveCapture: oy
                        }),
                        c = l[0],
                        u = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        d = e.className,
                        p = e.removeScrollBar,
                        m = e.enabled,
                        h = e.shards,
                        y = e.sideCar,
                        b = e.noRelative,
                        v = e.noIsolation,
                        g = e.inert,
                        w = e.allowPinchZoom,
                        O = e.as,
                        x = e.gapMode,
                        j = ou(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (n = [a, t], r = function(e) {
                            return n.forEach(function(t) {
                                return od(t, e)
                            })
                        }, (o = (0, H.useState)(function() {
                            return {
                                value: null,
                                callback: r,
                                facade: {
                                    get current() {
                                        return o.value
                                    },
                                    set current(value) {
                                        var e = o.value;
                                        e !== value && (o.value = value, o.callback(value, e))
                                    }
                                }
                            }
                        })[0]).callback = r, i = o.facade, op(function() {
                            var e = om.get(i);
                            if (e) {
                                var t = new Set(e),
                                    r = new Set(n),
                                    o = i.current;
                                t.forEach(function(e) {
                                    r.has(e) || od(e, null)
                                }), r.forEach(function(e) {
                                    t.has(e) || od(e, o)
                                })
                            }
                            om.set(i, n)
                        }, [n]), i),
                        P = oc(oc({}, j), c);
                    return H.createElement(H.Fragment, null, m && H.createElement(y, {
                        sideCar: oh,
                        removeScrollBar: p,
                        shards: h,
                        noRelative: b,
                        noIsolation: v,
                        inert: g,
                        setCallbacks: u,
                        allowPinchZoom: !!w,
                        lockRef: a,
                        gapMode: x
                    }), s ? H.cloneElement(H.Children.only(f), oc(oc({}, P), {
                        ref: S
                    })) : H.createElement(void 0 === O ? "div" : O, oc({}, P, {
                        className: d,
                        ref: S
                    }), f))
                });
            ob.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, ob.classNames = {
                fullWidth: of,
                zeroRight: os
            };
            var ov = function(e) {
                var t = e.sideCar,
                    n = ou(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var r = t.read();
                if (!r) throw Error("Sidecar medium not found");
                return H.createElement(r, oc({}, n))
            };
            ov.isSideCarExport = !0;
            var og = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(r) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = L || n.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var o, i;
                                (o = t).styleSheet ? o.styleSheet.cssText = r : o.appendChild(document.createTextNode(r)), i = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                ow = function() {
                    var e = og();
                    return function(t, n) {
                        H.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && n])
                    }
                },
                oO = function() {
                    var e = ow();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                ox = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                oj = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                oS = function(e) {
                    var t = window.getComputedStyle(document.body),
                        n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        r = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [oj(n), oj(r), oj(o)]
                },
                oP = function(e) {
                    if (void 0 === e && (e = "margin"), "undefined" == typeof window) return ox;
                    var t = oS(e),
                        n = document.documentElement.clientWidth,
                        r = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, r - n + t[2] - t[0])
                    }
                },
                oE = oO(),
                oI = "data-scroll-locked",
                oA = function(e, t, n, r) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(l, "px ").concat(r, ";\n  }\n  body[").concat(oI, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(l, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(os, " {\n    right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(of, " {\n    margin-right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(os, " .").concat(os, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(of, " .").concat(of, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(oI, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                oC = function() {
                    var e = parseInt(document.body.getAttribute(oI) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                oR = function() {
                    H.useEffect(function() {
                        return document.body.setAttribute(oI, (oC() + 1).toString()),
                            function() {
                                var e = oC() - 1;
                                e <= 0 ? document.body.removeAttribute(oI) : document.body.setAttribute(oI, e.toString())
                            }
                    }, [])
                },
                ok = function(e) {
                    var t = e.noRelative,
                        n = e.noImportant,
                        r = e.gapMode,
                        o = void 0 === r ? "margin" : r;
                    oR();
                    var i = H.useMemo(function() {
                        return oP(o)
                    }, [o]);
                    return H.createElement(oE, {
                        styles: oA(i, !t, o, n ? "" : "!important")
                    })
                },
                oN = !1;
            if ("undefined" != typeof window) try {
                var oT = Object.defineProperty({}, "passive", {
                    get: function() {
                        return oN = !0, !0
                    }
                });
                window.addEventListener("test", oT, oT), window.removeEventListener("test", oT, oT)
            } catch (e) {
                oN = !1
            }
            var oD = !!oN && {
                passive: !1
            };

            function o_(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var oM = function(e, t) {
                    if (!o_(e, Element)) return !1;
                    var n = window.getComputedStyle(e);
                    return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
                },
                oL = function(e, t) {
                    var n = t.ownerDocument,
                        r = t;
                    do {
                        if ("undefined" != typeof ShadowRoot && o_(r, ShadowRoot) && (r = r.host), oF(e, r)) {
                            var o = oU(e, r);
                            if (o[1] > o[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== n.body);
                    return !1
                },
                oF = function(e, t) {
                    return "v" === e ? oM(t, "overflowY") : oM(t, "overflowX")
                },
                oU = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                oz = function(e, t, n, r, o) {
                    var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                        l = a * r,
                        c = n.target,
                        u = t.contains(c),
                        s = !1,
                        f = l > 0,
                        d = 0,
                        p = 0;
                    do {
                        if (!c) break;
                        var m = oU(e, c),
                            h = m[0],
                            y = m[1] - m[2] - a * h;
                        (h || y) && oF(e, c) && (d += y, p += h);
                        var b = c.parentNode;
                        c = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
                    } while (!u && c !== document.body || u && (t.contains(c) || t === c));
                    return f && (o && 1 > Math.abs(d) || !o && l > d) ? s = !0 : !f && (o && 1 > Math.abs(p) || !o && -l > p) && (s = !0), s
                },
                oW = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                oB = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                oG = function(e) {
                    return e && "current" in e ? e.current : e
                },
                oH = 0,
                oV = [],
                oJ = (O = function(e) {
                    var t = H.useRef([]),
                        n = H.useRef([0, 0]),
                        r = H.useRef(),
                        o = H.useState(oH++)[0],
                        i = H.useState(oO)[0],
                        a = H.useRef(e);
                    H.useEffect(function() {
                        a.current = e
                    }, [e]), H.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, n) {
                                if (n || 2 == arguments.length)
                                    for (var r, o = 0, i = t.length; o < i; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
                                return e.concat(r || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(oG), !0).filter(Boolean);
                            return t.forEach(function(e) {
                                    return e.classList.add("allow-interactivity-".concat(o))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(o)), t.forEach(function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(o))
                                    })
                                }
                        }
                    }, [e.inert, e.lockRef.current, e.shards]);
                    var l = H.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var o, i = oW(e),
                                l = n.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - i[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - i[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var d = oL(f, s);
                            if (!d) return !0;
                            if (d ? o = f : (o = "v" === f ? "h" : "v", d = oL(f, s)), !d) return !1;
                            if (!r.current && "changedTouches" in e && (c || u) && (r.current = o), !o) return !0;
                            var p = r.current || o;
                            return oz(p, t, e, "h" === p ? c : u, !0)
                        }, []),
                        c = H.useCallback(function(e) {
                            if (oV.length && oV[oV.length - 1] === i) {
                                var n = "deltaY" in e ? oB(e) : oW(e),
                                    r = t.current.filter(function(t) {
                                        var r;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                                    })[0];
                                if (r && r.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!r) {
                                    var o = (a.current.shards || []).map(oG).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = H.useCallback(function(e, n, r, o) {
                            var i = {
                                name: e,
                                delta: n,
                                target: r,
                                should: o,
                                shadowParent: function(e) {
                                    for (var t, n, r = null; null !== e;) t = e, (null != (n = ShadowRoot) && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n) && (r = e.host, e = e.host), e = e.parentNode;
                                    return r
                                }(r)
                            };
                            t.current.push(i), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== i
                                })
                            }, 1)
                        }, []),
                        s = H.useCallback(function(e) {
                            n.current = oW(e), r.current = void 0
                        }, []),
                        f = H.useCallback(function(t) {
                            u(t.type, oB(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        d = H.useCallback(function(t) {
                            u(t.type, oW(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    H.useEffect(function() {
                        return oV.push(i), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: d
                            }), document.addEventListener("wheel", c, oD), document.addEventListener("touchmove", c, oD), document.addEventListener("touchstart", s, oD),
                            function() {
                                oV = oV.filter(function(e) {
                                    return e !== i
                                }), document.removeEventListener("wheel", c, oD), document.removeEventListener("touchmove", c, oD), document.removeEventListener("touchstart", s, oD)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        m = e.inert;
                    return H.createElement(H.Fragment, null, m ? H.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, p ? H.createElement(ok, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, oh.useMedium(O), ov),
                o$ = H.forwardRef(function(e, t) {
                    return H.createElement(ob, oc({}, e, {
                        ref: t,
                        sideCar: oJ
                    }))
                });

            function oX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function oq(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function oY(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function oK(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function oZ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return oX(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return oX(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            o$.classNames = ob.classNames;
            var oQ = "Popover",
                o0 = oZ(tm(oQ, [rU]), 2),
                o1 = o0[0];
            o0[1];
            var o2 = rU(),
                o3 = oZ(o1(oQ), 2),
                o4 = o3[0],
                o5 = o3[1],
                o8 = function(e) {
                    var t, n, r, o, i, a, l, c, u, s, f, d, p, m, h, y, b, v, g, w, O, x, j = e.__scopePopover,
                        S = e.children,
                        P = e.open,
                        E = e.defaultOpen,
                        I = e.onOpenChange,
                        A = e.modal,
                        C = o2(j),
                        R = H.useRef(null),
                        k = oZ(H.useState(!1), 2),
                        N = k[0],
                        T = k[1],
                        D = oZ((u = (c = {
                            prop: P,
                            defaultProp: E,
                            onChange: I
                        }).prop, p = (d = oe((n = (t = {
                            defaultProp: c.defaultProp,
                            onChange: f = void 0 === (s = c.onChange) ? function() {} : s
                        }).defaultProp, r = t.onChange, i = oe(o = H.useState(n), 1)[0], a = H.useRef(i), l = tT(r), H.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], m = d[1], y = (h = void 0 !== u) ? u : p, b = tT(f), [y, H.useCallback(function(e) {
                            if (h) {
                                var t = "function" == typeof e ? e(u) : e;
                                t !== u && b(t)
                            } else m(e)
                        }, [h, u, m, b])]), 2),
                        _ = D[0],
                        M = D[1];
                    return (0, U.jsx)(rG, oY(oq({}, C), {
                        children: (0, U.jsx)(o4, {
                            scope: j,
                            contentId: (O = (g = H.useState(tX()), w = function(e) {
                                if (Array.isArray(e)) return e
                            }(g) || function(e, t) {
                                var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != o) {
                                    var i = [],
                                        a = !0,
                                        l = !1;
                                    try {
                                        for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                                    } catch (e) {
                                        l = !0, r = e
                                    } finally {
                                        try {
                                            a || null == o.return || o.return()
                                        } finally {
                                            if (l) throw r
                                        }
                                    }
                                    return i
                                }
                            }(g, 2) || function(e, t) {
                                if (e) {
                                    if ("string" == typeof e) return t$(e, 2);
                                    var n = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return t$(e, t)
                                }
                            }(g, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0], x = w[1], tJ(function() {
                                x(function(e) {
                                    return null != e ? e : String(tq++)
                                })
                            }, [v]), v || (O ? "radix-".concat(O) : "")),
                            triggerRef: R,
                            open: void 0 !== _ && _,
                            onOpenChange: M,
                            onOpenToggle: H.useCallback(function() {
                                return M(function(e) {
                                    return !e
                                })
                            }, [M]),
                            hasCustomAnchor: N,
                            onCustomAnchorAdd: H.useCallback(function() {
                                return T(!0)
                            }, []),
                            onCustomAnchorRemove: H.useCallback(function() {
                                return T(!1)
                            }, []),
                            modal: void 0 !== A && A,
                            children: S
                        })
                    }))
                };
            o8.displayName = oQ;
            var o6 = "PopoverAnchor",
                o7 = H.forwardRef(function(e, t) {
                    var n = e.__scopePopover,
                        r = oK(e, ["__scopePopover"]),
                        o = o5(o6, n),
                        i = o2(n),
                        a = o.onCustomAnchorAdd,
                        l = o.onCustomAnchorRemove;
                    return H.useEffect(function() {
                        return a(),
                            function() {
                                return l()
                            }
                    }, [a, l]), (0, U.jsx)(rV, oY(oq({}, i, r), {
                        ref: t
                    }))
                });
            o7.displayName = o6;
            var o9 = "PopoverTrigger";
            H.forwardRef(function(e, t) {
                var n = e.__scopePopover,
                    r = oK(e, ["__scopePopover"]),
                    o = o5(o9, n),
                    i = o2(n),
                    a = eB(t, o.triggerRef),
                    l = (0, U.jsx)(tk.button, oY(oq({
                        type: "button",
                        "aria-haspopup": "dialog",
                        "aria-expanded": o.open,
                        "aria-controls": o.contentId,
                        "data-state": im(o.open)
                    }, r), {
                        ref: a,
                        onClick: tu(e.onClick, o.onOpenToggle)
                    }));
                return o.hasCustomAnchor ? l : (0, U.jsx)(rV, oY(oq({
                    asChild: !0
                }, i), {
                    children: l
                }))
            }).displayName = o9;
            var ie = "PopoverPortal",
                it = oZ(o1(ie, {
                    forceMount: void 0
                }), 2),
                ir = it[0],
                io = it[1],
                ii = function(e) {
                    var t = e.__scopePopover,
                        n = e.forceMount,
                        r = e.children,
                        o = e.container,
                        i = o5(ie, t);
                    return (0, U.jsx)(ir, {
                        scope: t,
                        forceMount: n,
                        children: (0, U.jsx)(r6, {
                            present: n || i.open,
                            children: (0, U.jsx)(r4, {
                                asChild: !0,
                                container: o,
                                children: r
                            })
                        })
                    })
                };
            ii.displayName = ie;
            var ia = "PopoverContent",
                il = H.forwardRef(function(e, t) {
                    var n = io(ia, e.__scopePopover),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        i = oK(e, ["forceMount"]),
                        a = o5(ia, e.__scopePopover);
                    return (0, U.jsx)(r6, {
                        present: o || a.open,
                        children: a.modal ? (0, U.jsx)(iu, oY(oq({}, i), {
                            ref: t
                        })) : (0, U.jsx)(is, oY(oq({}, i), {
                            ref: t
                        }))
                    })
                });
            il.displayName = ia;
            var ic = tP("PopoverContent.RemoveScroll"),
                iu = H.forwardRef(function(e, t) {
                    var n = o5(ia, e.__scopePopover),
                        r = H.useRef(null),
                        o = eB(t, r),
                        i = H.useRef(!1);
                    return H.useEffect(function() {
                        var e = r.current;
                        if (e) return ol(e)
                    }, []), (0, U.jsx)(o$, {
                        as: ic,
                        allowPinchZoom: !0,
                        children: (0, U.jsx)(id, oY(oq({}, e), {
                            ref: o,
                            trapFocus: n.open,
                            disableOutsidePointerEvents: !0,
                            onCloseAutoFocus: tu(e.onCloseAutoFocus, function(e) {
                                var t;
                                e.preventDefault(), i.current || null == (t = n.triggerRef.current) || t.focus()
                            }),
                            onPointerDownOutside: tu(e.onPointerDownOutside, function(e) {
                                var t = e.detail.originalEvent,
                                    n = 0 === t.button && !0 === t.ctrlKey;
                                i.current = 2 === t.button || n
                            }, {
                                checkForDefaultPrevented: !1
                            }),
                            onFocusOutside: tu(e.onFocusOutside, function(e) {
                                return e.preventDefault()
                            }, {
                                checkForDefaultPrevented: !1
                            })
                        }))
                    })
                }),
                is = H.forwardRef(function(e, t) {
                    var n = o5(ia, e.__scopePopover),
                        r = H.useRef(!1),
                        o = H.useRef(!1);
                    return (0, U.jsx)(id, oY(oq({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var i, a;
                            null == (i = e.onCloseAutoFocus) || i.call(e, t), t.defaultPrevented || (r.current || null == (a = n.triggerRef.current) || a.focus(), t.preventDefault()), r.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (i = e.onInteractOutside) || i.call(e, t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var i, a, l = t.target;
                            (null == (a = n.triggerRef.current) ? void 0 : a.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                id = H.forwardRef(function(e, t) {
                    var n = e.__scopePopover,
                        r = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = e.disableOutsidePointerEvents,
                        l = e.onEscapeKeyDown,
                        c = e.onPointerDownOutside,
                        u = e.onFocusOutside,
                        s = e.onInteractOutside,
                        f = oK(e, ["__scopePopover", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus", "disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside"]),
                        d = o5(ia, n),
                        p = o2(n);
                    return (0, tb.useFocusGuards)(), (0, U.jsx)(tz, {
                        asChild: !0,
                        loop: !0,
                        trapped: r,
                        onMountAutoFocus: o,
                        onUnmountAutoFocus: i,
                        children: (0, U.jsx)(ty.DismissableLayer, {
                            asChild: !0,
                            disableOutsidePointerEvents: a,
                            onInteractOutside: s,
                            onEscapeKeyDown: l,
                            onPointerDownOutside: c,
                            onFocusOutside: u,
                            onDismiss: function() {
                                return d.onOpenChange(!1)
                            },
                            children: (0, U.jsx)(rY, oY(oq({
                                "data-state": im(d.open),
                                role: "dialog",
                                id: d.contentId
                            }, p, f), {
                                ref: t,
                                style: oq({}, f.style, {
                                    "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                                    "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                                    "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                                    "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                                    "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                                })
                            }))
                        })
                    })
                }),
                ip = "PopoverClose";

            function im(e) {
                return e ? "open" : "closed"
            }
            H.forwardRef(function(e, t) {
                var n = e.__scopePopover,
                    r = oK(e, ["__scopePopover"]),
                    o = o5(ip, n);
                return (0, U.jsx)(tk.button, oY(oq({
                    type: "button"
                }, r), {
                    ref: t,
                    onClick: tu(e.onClick, function() {
                        return o.onOpenChange(!1)
                    })
                }))
            }).displayName = ip, H.forwardRef(function(e, t) {
                var n = e.__scopePopover,
                    r = oK(e, ["__scopePopover"]),
                    o = o2(n);
                return (0, U.jsx)(rQ, oY(oq({}, o, r), {
                    ref: t
                }))
            }).displayName = "PopoverArrow";
            var ih = function(e) {
                var t, n, r, o, i, a, l = null != (a = null == (n = (r = window).matchMedia) || null == (t = n.call(r, "(pointer: coarse)")) ? void 0 : t.matches) && a,
                    c = null == (o = document.activeElement) ? void 0 : o.matches(":focus-visible");
                if (l && !c) return void e.preventDefault();
                var u = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
                u && (e.preventDefault(), u.focus())
            };

            function iy(e) {
                var t = e.open,
                    n = e.defaultOpen,
                    r = e.onOpenChange,
                    o = e.children;
                return H.createElement(o8, {
                    open: t,
                    defaultOpen: n,
                    onOpenChange: r
                }, o)
            }

            function ib(e) {
                var t, n, r = e.side,
                    o = e.align,
                    i = e.sideOffset,
                    a = e.className,
                    l = e.children,
                    c = e.ariaLabel,
                    u = e.onOpenAutoFocus,
                    s = function(e, t) {
                        if (null == e) return {};
                        var n, r, o = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = {},
                                i = Object.keys(e);
                            for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                            return o
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(e);
                            for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                        }
                        return o
                    }(e, ["side", "align", "sideOffset", "className", "children", "ariaLabel", "onOpenAutoFocus"]);
                return H.createElement(ii, null, H.createElement(il, (t = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            var r;
                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                value: r,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = r
                        })
                    }
                    return e
                }({
                    side: void 0 === r ? "bottom" : r,
                    align: void 0 === o ? "center" : o,
                    sideOffset: void 0 === i ? 4 : i
                }, s), n = n = {
                    "aria-label": null != c ? c : s["aria-label"],
                    onOpenAutoFocus: null != u ? u : ih,
                    className: eE("foundation-web-portal-zindex", a)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(n, e))
                }), t), l))
            }

            function iv(e) {
                var t = e.asChild,
                    n = e.className,
                    r = e.children;
                return H.createElement(o7, {
                    asChild: t,
                    className: n
                }, r)
            }

            function ig(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var iw = function(e) {
                    var t, n = e.trigger,
                        r = e.content,
                        o = e.dropdownWidth,
                        i = e.ariaLabel,
                        a = (t = (0, H.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, r = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (l) throw r
                                    }
                                }
                                return i
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return ig(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ig(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        l = a[0],
                        c = a[1],
                        u = (0, H.useRef)(null),
                        s = (0, H.useRef)(null),
                        f = (0, H.useCallback)(function() {
                            c(!0)
                        }, []),
                        d = (0, H.useCallback)(function(e) {
                            var t, n, r, o, i = e.relatedTarget;
                            null == i ? c(!1) : null != (r = null == (t = u.current) ? void 0 : t.contains(i)) && r || null != (o = null == (n = s.current) ? void 0 : n.contains(i)) && o || c(!1)
                        }, []);
                    return (0, U.jsxs)(iy, {
                        open: l,
                        onOpenChange: c,
                        children: [(0, U.jsx)(iv, {
                            asChild: !0,
                            children: (0, U.jsx)("div", {
                                ref: u,
                                onMouseEnter: f,
                                onMouseLeave: d,
                                children: n
                            })
                        }), (0, U.jsx)(ib, {
                            side: "bottom",
                            align: "center",
                            sideOffset: 0,
                            collisionPadding: 24,
                            ariaLabel: i,
                            onOpenAutoFocus: function(e) {
                                e.preventDefault()
                            },
                            children: (0, U.jsx)("div", {
                                ref: s,
                                style: {
                                    width: o
                                },
                                onMouseEnter: f,
                                onMouseLeave: d,
                                children: r
                            })
                        })]
                    })
                },
                iO = window.Roblox["core-scripts"].eventStream,
                ix = function(e, t, n) {
                    return t ? R.InGame : e && "Studio" === n ? R.InStudio : e ? R.Online : R.Offline
                };

            function ij(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var iS = function(e, t, n, r, o, i, a, l) {
                    var c = arguments.length > 8 && void 0 !== arguments[8] ? arguments[8] : "OpenProfile",
                        u = (0, H.useCallback)(function() {
                            var u, s;
                            return ij(s = {}, A.Context, r), ij(s, A.ContentType, C.User), ij(s, A.CollectionId, i), ij(s, A.CollectionPosition, void 0 !== a ? a + 1 : -1), ij(s, D.TotalNumberOfItems, l), ij(s, D.ActionType, c), ij(s, D.ItemId, e.id.toString()), ij(s, D.ItemPosition, t + 1), ij(s, D.PositionInTopic, t + 1), ij(s, D.RowNumber, 1), ij(s, _.Presence, ix(e.presence.isOnline, e.presence.isInGame, e.presence.lastLocation)), ij(s, _.PresenceUniverseId, null != (u = e.presence.universeId) ? u : -1), ij(s, _.FriendStatus, "friend"), ij(s, _.SourceCarousel, n), ij(s, I.HomePageSessionInfo, o), s
                        }, [e, t, o, i, a, n, r, l, c]);
                    return (0, H.useCallback)(function() {
                        var e = u();
                        (0, iO.sendEvent)({
                            name: P.ItemAction,
                            type: P.ItemAction,
                            context: r
                        }, Z(function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var n = null != arguments[t] ? arguments[t] : {},
                                    r = Object.keys(n);
                                "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(n, e).enumerable
                                }))), r.forEach(function(t) {
                                    ij(e, t, n[t])
                                })
                            }
                            return e
                        }({}, e)))
                    }, [u, r])
                },
                iP = function(e) {
                    var t, n, r, o = e.friend,
                        i = e.friendIndex,
                        a = e.isOwnUser,
                        l = e.translate,
                        c = e.canChat,
                        u = e.carouselName,
                        s = e.eventContext,
                        f = e.homePageSessionInfo,
                        d = e.sortId,
                        p = e.sortPosition,
                        m = e.totalNumberOfFriends,
                        h = e.isIARCJoinCardRedesignEnabled,
                        y = e.isIARCJoinCardGameRowClickableEnabled,
                        b = "".concat(ea().websiteUrl, "/users/").concat(o.id, "/profile"),
                        v = null != (t = o.combinedName) ? t : l("Label.UnavailableFriendName"),
                        g = ew().usePresence(o.id, void 0),
                        w = null != g.gameId,
                        O = w ? g.lastLocation : null,
                        x = null != O && O.length > 15 ? "".concat(O.slice(0, 15), "...") : O,
                        j = w ? "".concat(ea().websiteUrl, "/games/").concat(null != (n = g.placeId) ? n : "") : "",
                        S = iS(o, i, u, s, f, d, p, m),
                        P = iS(o, i, u, s, f, d, p, m, "OpenGameDetails");
                    return (0, U.jsx)("div", {
                        className: "friends-carousel-tile",
                        children: (0, U.jsx)(iw, {
                            ariaLabel: v,
                            trigger: (0, U.jsx)("button", {
                                type: "button",
                                className: "options-dropdown",
                                id: "friend-tile-button",
                                onClick: function() {},
                                children: (0, U.jsx)(eT, {
                                    id: o.id,
                                    displayName: v,
                                    userProfileUrl: b,
                                    userPresence: x,
                                    translate: l,
                                    hasVerifiedBadge: o.hasVerifiedBadge,
                                    isRobloxPlus: o.isRobloxPlus,
                                    sendClickEvent: S
                                })
                            }),
                            content: a ? (0, U.jsx)(tc, {
                                friend: o,
                                isInGame: w,
                                universeId: null != (r = g.universeId) ? r : 0,
                                displayName: v,
                                userProfileUrl: b,
                                userPresence: O,
                                translate: l,
                                gameUrl: j,
                                canChat: c,
                                isIARCJoinCardRedesignEnabled: h,
                                isIARCJoinCardGameRowClickableEnabled: y,
                                sendGameRowClickEvent: P
                            }) : (0, U.jsx)("div", {}),
                            dropdownWidth: null == x ? 240 : h ? 260 : 315
                        })
                    })
                };

            function iE(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var iI = function(e, t, n, r, o, i, a) {
                    var l, c = (0, H.useCallback)(function(e) {
                            if (t) {
                                var l, c = e.filter(function(e) {
                                    return e < t.length
                                });
                                return iE(l = {}, A.Context, r), iE(l, A.ContentType, C.User), iE(l, A.CollectionId, i), iE(l, A.CollectionPosition, void 0 !== a ? a + 1 : -1), iE(l, N.TotalNumberOfItems, t.length), iE(l, N.ItemIds, c.map(function(e) {
                                    var n, r;
                                    return null != (r = null == (n = t[e]) ? void 0 : n.id.toString()) ? r : "-1"
                                })), iE(l, N.ItemPositions, c.map(function(e) {
                                    return e + 1
                                })), iE(l, N.PositionsInTopic, c.map(function(e) {
                                    return e + 1
                                })), iE(l, N.RowNumbers, c.map(function() {
                                    return 1
                                })), iE(l, T.Presences, c.map(function(e) {
                                    var n, r, o;
                                    return ix(null == (n = t[e]) ? void 0 : n.presence.isOnline, null == (r = t[e]) ? void 0 : r.presence.isInGame, null == (o = t[e]) ? void 0 : o.presence.lastLocation)
                                })), iE(l, T.PresenceUniverseIds, c.map(function(e) {
                                    var n, r;
                                    return null != (r = null == (n = t[e]) ? void 0 : n.presence.universeId) ? r : -1
                                })), iE(l, T.FriendStatuses, c.map(function() {
                                    return k.Friend
                                })), iE(l, T.SourceCarousel, n), iE(l, I.HomePageSessionInfo, o), l
                            }
                        }, [t, o, i, a, n, r]),
                        u = (0, H.useCallback)(function(e) {
                            var t, n = c(e);
                            void 0 !== n ? (0, iO.sendEvent)({
                                name: P.ItemImpressions,
                                type: P.ItemImpressions,
                                context: r
                            }, Z(function(e) {
                                for (var t = 1; t < arguments.length; t++) {
                                    var n = null != arguments[t] ? arguments[t] : {},
                                        r = Object.keys(n);
                                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                                    }))), r.forEach(function(t) {
                                        iE(e, t, n[t])
                                    })
                                }
                                return e
                            }({}, n))) : null == (t = window.EventTracker) || t.fireEvent("WebHomePageFriendsCarouselItemImpressionsUndefinedError")
                        }, [c, r]);
                    Y(e, null != (l = null == t ? void 0 : t.length) ? l : 0, u)
                },
                iA = ((x = iA || {}).WebHomeFriendsCarousel = "WebHomeFriendsCarousel", x.WebProfileFriendsCarousel = "WebProfileFriendsCarousel", x);

            function iC(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                    var o = 0;
                    for (r = Object.getOwnPropertySymbols(e); o < r.length; o++) 0 > t.indexOf(r[o]) && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (n[r[o]] = e[r[o]])
                }
                return n
            }
            var iR = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                ik = V().forwardRef(function(e, t) {
                    var n = e.name,
                        r = e.size,
                        o = e.className,
                        i = (e.children, iC(e, ["name", "size", "className", "children"]));
                    return V().createElement("span", Object.assign({
                        ref: t,
                        role: "presentation",
                        className: eE("grow-0 shrink-0 basis-auto icon", n, iR[void 0 === r ? "Medium" : r], o)
                    }, i))
                });
            ik.displayName = "Icon";
            var iN = {
                    Neutral: "bg-shift-300",
                    Standard: "bg-shift-300",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-system-success",
                    Warning: "bg-system-warning",
                    Alert: "bg-system-alert",
                    OverMedia: "bg-[var(--light-mode-surface-100)]"
                },
                iT = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-[var(--light-mode-content-emphasis)]",
                    Warning: "content-[var(--light-mode-content-emphasis)]",
                    Alert: "content-[var(--dark-mode-content-emphasis)]",
                    OverMedia: "content-[var(--light-mode-content-emphasis)]"
                },
                iD = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-standard"
                },
                i_ = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                iM = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                iL = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                iF = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                iU = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                iz = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                iW = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                iB = V().forwardRef(function(e, t) {
                    var n = e.className,
                        r = e.label,
                        o = e.variant,
                        i = void 0 === o ? "Neutral" : o,
                        a = e.icon,
                        l = e.size,
                        c = void 0 === l ? "Small" : l,
                        u = e.shape,
                        s = iC(e, ["className", "label", "variant", "icon", "size", "shape"]),
                        f = a && !r;
                    return V().createElement("div", Object.assign({
                        ref: t
                    }, s, {
                        className: eE("foundation-web-badge flex items-center select-none gap-xsmall", iW[void 0 === u ? "Pill" : u], i_[c], f ? [iL[c], "justify-center"] : ["width-[fit-content]", iM[c]], iN[i], iT[i], iD[i], n),
                        style: "OverMedia" === i ? {
                            borderColor: "var(--light-mode-stroke-default)"
                        } : void 0
                    }), a && V().createElement(ik, {
                        name: a,
                        size: iz[c]
                    }), r && V().createElement("span", {
                        className: eE("text-no-wrap text-truncate-split", iF[c], iU[c], iT[i])
                    }, r))
                });
            iB.displayName = "Badge";
            var iG = function(e) {
                var t = e.translate,
                    n = e.badgeCount;
                return (0, U.jsx)("div", {
                    className: "friends-carousel-tile",
                    children: (0, U.jsx)("button", {
                        type: "button",
                        id: "friend-tile-button",
                        children: (0, U.jsxs)("a", {
                            href: "/users/friends#!/friend-requests",
                            children: [(0, U.jsxs)("div", {
                                className: "add-friends-icon-container",
                                children: [n > 0 && (0, U.jsx)(iB, {
                                    className: "friend-request-badge",
                                    variant: "Alert",
                                    label: n > 99 ? "99+" : String(n)
                                }), (0, U.jsx)(eA, {
                                    className: "add-friends-icon content-secondary",
                                    name: "icon-filled-plus-large",
                                    size: "XLarge"
                                })]
                            }), (0, U.jsx)("div", {
                                className: "friends-carousel-tile-labels",
                                "data-testid": "friends-carousel-tile-labels",
                                children: (0, U.jsx)("div", {
                                    className: "friends-carousel-tile-label",
                                    children: (0, U.jsx)("div", {
                                        className: "friends-carousel-tile-name",
                                        children: (0, U.jsx)("span", {
                                            className: "friends-carousel-display-name",
                                            children: t("Label.AddFriends")
                                        })
                                    })
                                })
                            })]
                        })
                    })
                })
            };

            function iH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function iV(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return iH(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return iH(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iJ = function(e) {
                    var t = e.friendsList,
                        n = e.isOwnUser,
                        r = e.translate,
                        o = e.canChat,
                        i = e.carouselName,
                        a = e.eventContext,
                        l = e.homePageSessionInfo,
                        c = e.sortId,
                        u = e.sortPosition,
                        s = e.badgeCount,
                        f = e.isAddFriendsTileEnabled,
                        d = e.isIARCJoinCardRedesignEnabled,
                        p = e.isIARCJoinCardGameRowClickableEnabled,
                        m = (0, H.useRef)(null),
                        h = iV((0, H.useState)(t), 2),
                        y = h[0],
                        b = h[1],
                        v = iV((0, H.useState)(!1), 2),
                        g = v[0],
                        w = v[1],
                        O = iV((0, H.useState)(null), 2),
                        x = O[0],
                        j = O[1],
                        S = (0, H.useRef)(null),
                        P = i === iA.WebHomeFriendsCarousel && f;
                    return (0, H.useEffect)(function() {
                        var e = m.current;
                        if (null != e) {
                            var t = new ResizeObserver(function() {
                                j(e.offsetWidth)
                            });
                            return t.observe(e),
                                function() {
                                    t.disconnect()
                                }
                        }
                    }, []), (0, H.useEffect)(function() {
                        var e, n, r = null != x ? x : null == (e = m.current) ? void 0 : e.offsetWidth,
                            o = null != (n = null == t ? void 0 : t.length) ? n : 0;
                        if (null != r && null != t) {
                            var i = Math.floor(r / 110);
                            w(110 * (P ? o + 1 : o) > r), b(t.slice(0, i - !!P))
                        }
                    }, [x, t, P]), iI(S, t, i, a, l, c, u), (0, U.jsx)("div", {
                        children: (0, U.jsx)("div", {
                            ref: function(e) {
                                return m.current = e, m.current
                            },
                            className: "friends-carousel-container",
                            children: null == y ? (0, U.jsx)("span", {
                                className: "spinner spinner-default"
                            }) : (0, U.jsxs)("div", {
                                ref: S,
                                className: g ? "friends-carousel-list-container" : "friends-carousel-list-container-not-full",
                                children: [P ? (0, U.jsx)(iG, {
                                    translate: r,
                                    badgeCount: s,
                                    "data-testid": "add-friends-tile"
                                }, "add-friends-tile") : null, y.map(function(e, s) {
                                    var f;
                                    return (0, U.jsx)("div", {
                                        children: (0, U.jsx)(iP, {
                                            friend: e,
                                            friendIndex: s,
                                            translate: r,
                                            isOwnUser: n,
                                            canChat: o,
                                            carouselName: i,
                                            eventContext: a,
                                            homePageSessionInfo: l,
                                            sortId: c,
                                            sortPosition: u,
                                            totalNumberOfFriends: null != (f = null == t ? void 0 : t.length) ? f : 0,
                                            isIARCJoinCardRedesignEnabled: d,
                                            isIARCJoinCardGameRowClickableEnabled: p
                                        })
                                    }, e.id)
                                })]
                            })
                        })
                    })
                },
                i$ = window.Roblox["core-scripts"].meta.user;

            function iX(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, o)
            }
            var iq = ea().apiGatewayUrl,
                iY = function(e) {
                    var t;
                    return (t = function() {
                        var t, n;
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    if (null == (n = null == (t = (0, i$.authenticatedUser)()) ? void 0 : t.id)) return [2, {
                                        users: [{
                                            isBlocked: !1,
                                            isBlockingViewer: !1,
                                            userId: 0
                                        }]
                                    }];
                                    return [4, el.post({
                                        url: "".concat(iq, "/user-blocking-api/v1/users/batch-check-reciprocal-block"),
                                        withCredentials: !0
                                    }, {
                                        userIds: e,
                                        requesterId: n
                                    })];
                                case 1:
                                    return [2, r.sent().data]
                            }
                        })
                    }, function() {
                        var e = this,
                            n = arguments;
                        return new Promise(function(r, o) {
                            var i = t.apply(e, n);

                            function a(e) {
                                iX(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                iX(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                };

            function iK(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, o)
            }
            var iZ = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null,
                        n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(ea().apiGatewayUrl, "/access-management/v1/upsell-feature-access?featureName=").concat(e).concat(t ? "&extraParameters=".concat(t) : "").concat(n ? "&successfulActions=".concat(n) : "")
                    }
                },
                iQ = function(e, t, n) {
                    var r;
                    return (r = function() {
                        var r;
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return r = iZ(e, t ? btoa(JSON.stringify(t)) : null, n), [4, el.get(r)];
                                case 1:
                                    return [2, o.sent().data]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var i = r.apply(e, t);

                            function a(e) {
                                iK(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                iK(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                };

            function i0(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function i1(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            i0(i, r, o, a, l, "next", e)
                        }

                        function l(e) {
                            i0(i, r, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function i2(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function i3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function i4(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function i5(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            i4(i, r, o, a, l, "next", e)
                        }

                        function l(e) {
                            i4(i, r, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function i8(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return i3(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return i3(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i6(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var i7 = "FriendshipNotifications",
                i9 = "fulfilled",
                ae = eo().userDataStore,
                at = function(e) {
                    var t = e.profileUserId,
                        n = e.isOwnUser,
                        r = e.carouselName,
                        o = e.eventContext,
                        i = e.homePageSessionInfo,
                        a = e.sortId,
                        l = e.sortPosition,
                        c = i8((0, H.useState)(null), 2),
                        u = c[0],
                        s = c[1],
                        f = i8((0, H.useState)(null), 2),
                        d = f[0],
                        p = f[1],
                        m = i8((0, H.useState)(!1), 2),
                        h = m[0],
                        y = m[1],
                        b = i8((0, H.useState)(null), 2),
                        v = b[0],
                        g = b[1],
                        w = i8((0, H.useState)(!1), 2),
                        O = w[0],
                        x = w[1],
                        j = i8((0, H.useState)({
                            isBadgeEnabled: !1,
                            isAddFriendsTileEnabledWeb: !1,
                            isIARCJoinCardRedesignEnabled: !1,
                            isIARCJoinCardGameRowClickableEnabled: !1
                        }), 2),
                        S = j[0],
                        P = j[1],
                        E = (0, B.useTranslation)().translate;
                    return (0, H.useEffect)(function() {
                        ae.clearUserDataStoreCache()
                    }, []), (0, H.useEffect)(function() {
                        if (O) {
                            var e = function() {
                                    return i5(function() {
                                        return i6(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return e.trys.push([0, 2, , 3]), [4, eh()];
                                                case 1:
                                                    return g(e.sent()), [3, 3];
                                                case 2:
                                                    return console.error("Error fetching friend request count:", e.sent()), [3, 3];
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                t = en().GetClient();
                            return t.Subscribe(i7, e),
                                function() {
                                    t.Unsubscribe(i7, e)
                                }
                        }
                    }, [O]), (0, H.useEffect)(function() {
                        i5(function() {
                            var e, o, i, a, l, c, u, f, d, m, h, b, v;
                            return i6(this, function(w) {
                                var O;
                                switch (w.label) {
                                    case 0:
                                        return [4, Promise.allSettled([es(function() {
                                            var e;
                                            return em(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        return e = {
                                                            url: "".concat(ea().friendsApi, "/v1/users/").concat(t, "/friends/count"),
                                                            retryable: !0,
                                                            withCredentials: !0
                                                        }, [4, el.get(e)];
                                                    case 1:
                                                        return [2, n.sent().data]
                                                }
                                            })
                                        })(), es(function() {
                                            var e, r, o, i, a, l, c, u, s, f, d, p, m, h, y;
                                            return em(this, function(b) {
                                                var v;
                                                switch (b.label) {
                                                    case 0:
                                                        return [4, Promise.all([es(function() {
                                                            return em(this, function(e) {
                                                                switch (e.label) {
                                                                    case 0:
                                                                        if (!n) return [2, []];
                                                                        e.label = 1;
                                                                    case 1:
                                                                        return e.trys.push([1, 3, , 4]), [4, es(function() {
                                                                            var e;
                                                                            return em(this, function(n) {
                                                                                switch (n.label) {
                                                                                    case 0:
                                                                                        return e = {
                                                                                            url: "".concat(ea().friendsApi, "/v1/users/").concat(t, "/friends/online"),
                                                                                            retryable: !0,
                                                                                            withCredentials: !0
                                                                                        }, [4, el.get(e)];
                                                                                    case 1:
                                                                                        return [2, n.sent().data]
                                                                                }
                                                                            })
                                                                        })()];
                                                                    case 2:
                                                                        return [2, e.sent().data];
                                                                    case 3:
                                                                        return console.error("Error fetching online friends:", e.sent()), [2, []];
                                                                    case 4:
                                                                        return [2]
                                                                }
                                                            })
                                                        })(), es(function() {
                                                            return em(this, function(e) {
                                                                switch (e.label) {
                                                                    case 0:
                                                                        return e.trys.push([0, 2, , 3]), [4, es(function() {
                                                                            var e, r;
                                                                            return em(this, function(o) {
                                                                                switch (o.label) {
                                                                                    case 0:
                                                                                        return e = "".concat(ea().friendsApi, "/v1/users/").concat(t, "/friends/find"), r = {
                                                                                            url: n ? "".concat(e, "?userSort=1") : e,
                                                                                            retryable: !0,
                                                                                            withCredentials: !0
                                                                                        }, [4, el.get(r)];
                                                                                    case 1:
                                                                                        return [2, o.sent().data]
                                                                                }
                                                                            })
                                                                        })()];
                                                                    case 1:
                                                                        return [2, e.sent().PageItems];
                                                                    case 2:
                                                                        return console.error("Error fetching friends:", e.sent()), [2, []];
                                                                    case 3:
                                                                        return [2]
                                                                }
                                                            })
                                                        })()])];
                                                    case 1:
                                                        r = (e = ef.apply(void 0, [b.sent(), 2]))[0], o = e[1], r.sort(function(e, t) {
                                                            return t.sortScore - e.sortScore
                                                        }), i = new Map, a = !0, l = !1, c = void 0;
                                                        try {
                                                            for (u = r[Symbol.iterator](); !(a = (s = u.next()).done); a = !0) f = s.value, i.set(f.id, f.userPresence)
                                                        } catch (e) {
                                                            l = !0, c = e
                                                        } finally {
                                                            try {
                                                                a || null == u.return || u.return()
                                                            } finally {
                                                                if (l) throw c
                                                            }
                                                        }
                                                        if (d = r.map(function(e) {
                                                                return e.id
                                                            }), p = o.filter(function(e) {
                                                                return !d.includes(e.id)
                                                            }).map(function(e) {
                                                                return e.id
                                                            }), 0 === (m = ed(d).concat(ed(p))).length) return [2, []];
                                                        return [4, (v = m, es(function() {
                                                            var e, t;
                                                            return em(this, function(n) {
                                                                switch (n.label) {
                                                                    case 0:
                                                                        return e = {
                                                                            url: "".concat(ea().apiGatewayUrl, "/user-profile-api/v1/user/profiles/get-profiles"),
                                                                            retryable: !0,
                                                                            withCredentials: !0
                                                                        }, t = {
                                                                            userIds: v,
                                                                            fields: ["names.combinedName", "isVerified", "hasRobloxSubscription"]
                                                                        }, [4, el.post(e, t)];
                                                                    case 1:
                                                                        return [2, n.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 2:
                                                        return h = new Map(b.sent().profileDetails.map(function(e) {
                                                            return [e.userId, e]
                                                        })), y = [], m.forEach(function(e) {
                                                            var t, n, r, o, a, l, c = i.has(e),
                                                                u = {
                                                                    isOnline: c,
                                                                    isInGame: c && (null == (t = i.get(e)) ? void 0 : t.UserPresenceType) === "InGame",
                                                                    lastLocation: c ? null == (n = i.get(e)) ? void 0 : n.lastLocation : void 0,
                                                                    gameId: c ? null == (r = i.get(e)) ? void 0 : r.gameInstanceId : void 0,
                                                                    universeId: c ? null == (o = i.get(e)) ? void 0 : o.universeId : void 0,
                                                                    placeId: c ? null == (a = i.get(e)) ? void 0 : a.placeId : void 0
                                                                },
                                                                s = h.get(e);
                                                            y.push({
                                                                id: e,
                                                                combinedName: null == s ? void 0 : s.names.combinedName,
                                                                presence: u,
                                                                hasVerifiedBadge: null != (l = null == s ? void 0 : s.isVerified) && l,
                                                                isRobloxPlus: (null == s ? void 0 : s.hasRobloxSubscription) === !0
                                                            })
                                                        }), [2, y]
                                                }
                                            })
                                        })(), eb(), eh(), i5(function() {
                                            return i6(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        if (n) return [2, !1];
                                                        return [4, i1(function() {
                                                            var e, n;
                                                            return i2(this, function(r) {
                                                                switch (r.label) {
                                                                    case 0:
                                                                        return r.trys.push([0, 2, , 3]), [4, iY([t])];
                                                                    case 1:
                                                                        return [2, null == (n = null == (e = r.sent().users[0]) ? void 0 : e.isBlockingViewer) || n];
                                                                    case 2:
                                                                        return console.error(r.sent()), [3, 3];
                                                                    case 3:
                                                                        return [2, !0]
                                                                }
                                                            })
                                                        })()];
                                                    case 1:
                                                        if (e.sent()) return [2, !0];
                                                        return [4, i1(function() {
                                                            return i2(this, function(e) {
                                                                switch (e.label) {
                                                                    case 0:
                                                                        return e.trys.push([0, 2, , 3]), [4, iQ("MustHideConnections", [{
                                                                            name: "vieweeUserId",
                                                                            type: "UserId",
                                                                            value: "".concat(t)
                                                                        }])];
                                                                    case 1:
                                                                        return [2, "Granted" === e.sent().access];
                                                                    case 2:
                                                                        return console.error(e.sent()), [3, 3];
                                                                    case 3:
                                                                        return [2, !0]
                                                                }
                                                            })
                                                        })()];
                                                    case 2:
                                                        return [2, e.sent()]
                                                }
                                            })
                                        })(), i5(function() {
                                            var e;
                                            return i6(this, function(t) {
                                                switch (t.label) {
                                                    case 0:
                                                        return t.trys.push([0, 2, , 3]), [4, ee().getAllValuesForLayer("Social.Friends")];
                                                    case 1:
                                                        return [2, {
                                                            isBadgeEnabled: !0 === (e = t.sent()).enableNewFriendRequestsBadge,
                                                            isAddFriendsTileEnabledWeb: !0 === e.enableAddFriendsTileOnWeb,
                                                            isIARCJoinCardRedesignEnabled: !0 === e.isIARCJoinCardRedesignEnabled,
                                                            isIARCJoinCardGameRowClickableEnabled: !0 === e.isIARCJoinCardGameRowClickableEnabled
                                                        }];
                                                    case 2:
                                                        return console.error("Error fetching experimentation config:", t.sent()), [2, {
                                                            isBadgeEnabled: !1,
                                                            isAddFriendsTileEnabledWeb: !1,
                                                            isIARCJoinCardRedesignEnabled: !1,
                                                            isIARCJoinCardGameRowClickableEnabled: !1
                                                        }];
                                                    case 3:
                                                        return [2]
                                                }
                                            })
                                        })()])];
                                    case 1:
                                        return o = (e = i8.apply(void 0, [w.sent(), 6]))[0], i = e[1], a = e[2], l = e[3], c = e[4], u = e[5], f = o.status === i9 ? o.value.count : 0, d = i.status === i9 ? i.value : [], m = a.status === i9 && a.value.chatEnabled, h = l.status === i9 ? l.value : 0, b = u.status === i9 ? u.value : {
                                            isBadgeEnabled: !1,
                                            isAddFriendsTileEnabledWeb: !1,
                                            isIARCJoinCardRedesignEnabled: !1,
                                            isIARCJoinCardGameRowClickableEnabled: !1
                                        }, v = c.status !== i9 || c.value, s(f), p(d), y(m), g(h), P(b), x((O = b.isAddFriendsTileEnabledWeb, !v && (r !== iA.WebHomeFriendsCarousel ? 0 !== f : 0 !== f || O && 0 !== h))), [2]
                                }
                            })
                        })().catch(function(e) {
                            console.error(e)
                        })
                    }, [t, n, r]), O ? (0, U.jsxs)("div", {
                        className: "react-friends-carousel-container",
                        children: [(0, U.jsx)(ev, {
                            friendsCount: u,
                            translate: E,
                            profileUserId: t,
                            isOwnUser: n
                        }), (0, U.jsx)(iJ, {
                            badgeCount: S.isBadgeEnabled && null != v ? v : 0,
                            friendsList: d,
                            translate: E,
                            isOwnUser: n,
                            canChat: h,
                            carouselName: r,
                            eventContext: o,
                            homePageSessionInfo: i,
                            sortId: a,
                            sortPosition: l,
                            isAddFriendsTileEnabled: S.isAddFriendsTileEnabledWeb,
                            isIARCJoinCardRedesignEnabled: S.isIARCJoinCardRedesignEnabled,
                            isIARCJoinCardGameRowClickableEnabled: S.isIARCJoinCardGameRowClickableEnabled
                        })]
                    }) : (0, U.jsx)("div", {
                        className: "friends-carousel-0-friends"
                    })
                },
                an = JSON.parse('{"P":["CommonUI.Features","Feature.PeopleList","Feature.Friends","Feature.Profile","Feature.RobloxSubscription"]}');
            n(794), n(162);
            var ar = document.querySelector('meta[name="user-data"]'),
                ao = parseInt(null != (F = null == ar ? void 0 : ar.getAttribute("data-userid")) ? F : "", 10),
                ai = Number.isNaN(ao) ? null : ao,
                aa = null != (j = null == (S = /\/users\/(\d+)\//g.exec(window.location.pathname)) ? void 0 : S[1]) ? j : null,
                al = parseInt(null != aa ? aa : "", 10),
                ac = Number.isNaN(al) ? null : al;
            W()(function() {
                var e = document.getElementById("friends-carousel-container");
                e && (0, B.renderWithErrorBoundary)((0, U.jsx)(G.QueryClientProvider, {
                    client: B.queryClient,
                    children: (0, U.jsx)(B.TranslationProvider, {
                        config: an.P,
                        children: (0, U.jsx)(at, {
                            profileUserId: null != ac ? ac : 0,
                            isOwnUser: ac === ai,
                            carouselName: iA.WebProfileFriendsCarousel,
                            eventContext: E.UserProfile,
                            homePageSessionInfo: void 0,
                            sortId: void 0,
                            sortPosition: void 0
                        })
                    })
                }), e)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("FriendsCarousel");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/friendsCarousel-79b135cfab60e7d7.js.map