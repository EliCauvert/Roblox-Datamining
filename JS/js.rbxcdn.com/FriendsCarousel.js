! function() {
    try {
        var t = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "473fd6b83482aaefe594ead0b5ec093c2b7a2a0f"
        };
        var n = (new t.Error).stack;
        n && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[n] = "87fe7c4d-eaa5-4367-9a27-23414d628001", t._sentryDebugIdIdentifier = "sentry-dbid-87fe7c4d-eaa5-4367-9a27-23414d628001")
    } catch (t) {}
}(),
function() {
    var t = {
            821: function() {
                ! function() {
                    "use strict";
                    var t;
                    if (("undefined" == typeof window ? "undefined" : (t = window) && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) == "object") {
                        if ("IntersectionObserver" in window && "IntersectionObserverEntry" in window && "intersectionRatio" in window.IntersectionObserverEntry.prototype) {
                            "isIntersecting" in window.IntersectionObserverEntry.prototype || Object.defineProperty(window.IntersectionObserverEntry.prototype, "isIntersecting", {
                                get: function() {
                                    return this.intersectionRatio > 0
                                }
                            });
                            return
                        }
                        var n = function(t) {
                                for (var n = t, r = a(n); r;) r = a(n = r.ownerDocument);
                                return n
                            }(window.document),
                            r = [],
                            o = null,
                            i = null;
                        s.prototype.THROTTLE_TIMEOUT = 100, s.prototype.POLL_INTERVAL = null, s.prototype.USE_MUTATION_OBSERVER = !0, s._setupCrossOriginUpdater = function() {
                            return o || (o = function(t, n) {
                                i = t && n ? h(t, n) : d(), r.forEach(function(t) {
                                    t._checkForIntersections()
                                })
                            }), o
                        }, s._resetCrossOriginUpdater = function() {
                            o = null, i = null
                        }, s.prototype.observe = function(t) {
                            if (!this._observationTargets.some(function(n) {
                                    return n.element == t
                                })) {
                                if (!(t && 1 == t.nodeType)) throw Error("target must be an Element");
                                this._registerInstance(), this._observationTargets.push({
                                    element: t,
                                    entry: null
                                }), this._monitorIntersections(t.ownerDocument), this._checkForIntersections()
                            }
                        }, s.prototype.unobserve = function(t) {
                            this._observationTargets = this._observationTargets.filter(function(n) {
                                return n.element != t
                            }), this._unmonitorIntersections(t.ownerDocument), 0 == this._observationTargets.length && this._unregisterInstance()
                        }, s.prototype.disconnect = function() {
                            this._observationTargets = [], this._unmonitorAllIntersections(), this._unregisterInstance()
                        }, s.prototype.takeRecords = function() {
                            var t = this._queuedEntries.slice();
                            return this._queuedEntries = [], t
                        }, s.prototype._initThresholds = function(t) {
                            var n = t || [0];
                            return Array.isArray(n) || (n = [n]), n.sort().filter(function(t, n, r) {
                                if ("number" != typeof t || isNaN(t) || t < 0 || t > 1) throw Error("threshold must be a number between 0 and 1 inclusively");
                                return t !== r[n - 1]
                            })
                        }, s.prototype._parseRootMargin = function(t) {
                            var n = (t || "0px").split(/\s+/).map(function(t) {
                                var n = /^(-?\d*\.?\d+)(px|%)$/.exec(t);
                                if (!n) throw Error("rootMargin must be specified in pixels or percent");
                                return {
                                    value: parseFloat(n[1]),
                                    unit: n[2]
                                }
                            });
                            return n[1] = n[1] || n[0], n[2] = n[2] || n[0], n[3] = n[3] || n[1], n
                        }, s.prototype._monitorIntersections = function(t) {
                            var r = t.defaultView;
                            if (r && -1 == this._monitoringDocuments.indexOf(t)) {
                                var o = this._checkForIntersections,
                                    i = null,
                                    l = null;
                                if (this.POLL_INTERVAL ? i = r.setInterval(o, this.POLL_INTERVAL) : (u(r, "resize", o, !0), u(t, "scroll", o, !0), this.USE_MUTATION_OBSERVER && "MutationObserver" in r && (l = new r.MutationObserver(o)).observe(t, {
                                        attributes: !0,
                                        childList: !0,
                                        characterData: !0,
                                        subtree: !0
                                    })), this._monitoringDocuments.push(t), this._monitoringUnsubscribes.push(function() {
                                        var n = t.defaultView;
                                        n && (i && n.clearInterval(i), c(n, "resize", o, !0)), c(t, "scroll", o, !0), l && l.disconnect()
                                    }), t != (this.root && (this.root.ownerDocument || this.root) || n)) {
                                    var s = a(t);
                                    s && this._monitorIntersections(s.ownerDocument)
                                }
                            }
                        }, s.prototype._unmonitorIntersections = function(t) {
                            var r = this._monitoringDocuments.indexOf(t);
                            if (-1 != r) {
                                var o = this.root && (this.root.ownerDocument || this.root) || n;
                                if (!this._observationTargets.some(function(n) {
                                        var r = n.element.ownerDocument;
                                        if (r == t) return !0;
                                        for (; r && r != o;) {
                                            var i = a(r);
                                            if ((r = i && i.ownerDocument) == t) return !0
                                        }
                                        return !1
                                    })) {
                                    var i = this._monitoringUnsubscribes[r];
                                    if (this._monitoringDocuments.splice(r, 1), this._monitoringUnsubscribes.splice(r, 1), i(), t != o) {
                                        var l = a(t);
                                        l && this._unmonitorIntersections(l.ownerDocument)
                                    }
                                }
                            }
                        }, s.prototype._unmonitorAllIntersections = function() {
                            var t = this._monitoringUnsubscribes.slice(0);
                            this._monitoringDocuments.length = 0, this._monitoringUnsubscribes.length = 0;
                            for (var n = 0; n < t.length; n++) t[n]()
                        }, s.prototype._checkForIntersections = function() {
                            if (this.root || !o || i) {
                                var t = this._rootIsInDom(),
                                    n = t ? this._getRootRect() : d();
                                this._observationTargets.forEach(function(r) {
                                    var i = r.element,
                                        a = f(i),
                                        s = this._rootContainsTarget(i),
                                        u = r.entry,
                                        c = t && s && this._computeTargetAndRootIntersection(i, a, n),
                                        p = null;
                                    this._rootContainsTarget(i) ? (!o || this.root) && (p = n) : p = d();
                                    var h = r.entry = new l({
                                        time: window.performance && performance.now && performance.now(),
                                        target: i,
                                        boundingClientRect: a,
                                        rootBounds: p,
                                        intersectionRect: c
                                    });
                                    u ? t && s ? this._hasCrossedThreshold(u, h) && this._queuedEntries.push(h) : u && u.isIntersecting && this._queuedEntries.push(h) : this._queuedEntries.push(h)
                                }, this), this._queuedEntries.length && this._callback(this.takeRecords(), this)
                            }
                        }, s.prototype._computeTargetAndRootIntersection = function(t, r, a) {
                            if ("none" != window.getComputedStyle(t).display) {
                                for (var l = r, s = m(t), u = !1; !u && s;) {
                                    var c = null,
                                        d = 1 == s.nodeType ? window.getComputedStyle(s) : {};
                                    if ("none" == d.display) return null;
                                    if (s == this.root || 9 == s.nodeType)
                                        if (u = !0, s == this.root || s == n) o && !this.root ? i && (0 != i.width || 0 != i.height) ? c = i : (s = null, c = null, l = null) : c = a;
                                        else {
                                            var p = m(s),
                                                v = p && f(p),
                                                y = p && this._computeTargetAndRootIntersection(p, v, a);
                                            v && y ? (s = p, c = h(v, y)) : (s = null, l = null)
                                        }
                                    else {
                                        var b = s.ownerDocument;
                                        s != b.body && s != b.documentElement && "visible" != d.overflow && (c = f(s))
                                    }
                                    if (c && (l = function(t, n) {
                                            var r = Math.max(t.top, n.top),
                                                o = Math.min(t.bottom, n.bottom),
                                                i = Math.max(t.left, n.left),
                                                a = Math.min(t.right, n.right),
                                                l = a - i,
                                                s = o - r;
                                            return l >= 0 && s >= 0 && {
                                                top: r,
                                                bottom: o,
                                                left: i,
                                                right: a,
                                                width: l,
                                                height: s
                                            } || null
                                        }(c, l)), !l) break;
                                    s = s && m(s)
                                }
                                return l
                            }
                        }, s.prototype._getRootRect = function() {
                            var t;
                            if (this.root && !y(this.root)) t = f(this.root);
                            else {
                                var r = y(this.root) ? this.root : n,
                                    o = r.documentElement,
                                    i = r.body;
                                t = {
                                    top: 0,
                                    left: 0,
                                    right: o.clientWidth || i.clientWidth,
                                    width: o.clientWidth || i.clientWidth,
                                    bottom: o.clientHeight || i.clientHeight,
                                    height: o.clientHeight || i.clientHeight
                                }
                            }
                            return this._expandRectByRootMargin(t)
                        }, s.prototype._expandRectByRootMargin = function(t) {
                            var n = this._rootMarginValues.map(function(n, r) {
                                    return "px" == n.unit ? n.value : n.value * (r % 2 ? t.width : t.height) / 100
                                }),
                                r = {
                                    top: t.top - n[0],
                                    right: t.right + n[1],
                                    bottom: t.bottom + n[2],
                                    left: t.left - n[3]
                                };
                            return r.width = r.right - r.left, r.height = r.bottom - r.top, r
                        }, s.prototype._hasCrossedThreshold = function(t, n) {
                            var r = t && t.isIntersecting ? t.intersectionRatio || 0 : -1,
                                o = n.isIntersecting ? n.intersectionRatio || 0 : -1;
                            if (r !== o)
                                for (var i = 0; i < this.thresholds.length; i++) {
                                    var a = this.thresholds[i];
                                    if (a == r || a == o || a < r != a < o) return !0
                                }
                        }, s.prototype._rootIsInDom = function() {
                            return !this.root || v(n, this.root)
                        }, s.prototype._rootContainsTarget = function(t) {
                            var r = this.root && (this.root.ownerDocument || this.root) || n;
                            return v(r, t) && (!this.root || r == t.ownerDocument)
                        }, s.prototype._registerInstance = function() {
                            0 > r.indexOf(this) && r.push(this)
                        }, s.prototype._unregisterInstance = function() {
                            var t = r.indexOf(this); - 1 != t && r.splice(t, 1)
                        }, window.IntersectionObserver = s, window.IntersectionObserverEntry = l
                    }

                    function a(t) {
                        try {
                            return t.defaultView && t.defaultView.frameElement || null
                        } catch (t) {
                            return null
                        }
                    }

                    function l(t) {
                        this.time = t.time, this.target = t.target, this.rootBounds = p(t.rootBounds), this.boundingClientRect = p(t.boundingClientRect), this.intersectionRect = p(t.intersectionRect || d()), this.isIntersecting = !!t.intersectionRect;
                        var n = this.boundingClientRect,
                            r = n.width * n.height,
                            o = this.intersectionRect,
                            i = o.width * o.height;
                        r ? this.intersectionRatio = Number((i / r).toFixed(4)) : this.intersectionRatio = +!!this.isIntersecting
                    }

                    function s(t, n) {
                        var r, o, i, a = n || {};
                        if ("function" != typeof t) throw Error("callback must be a function");
                        if (a.root && 1 != a.root.nodeType && 9 != a.root.nodeType) throw Error("root must be a Document or Element");
                        this._checkForIntersections = (r = this._checkForIntersections.bind(this), o = this.THROTTLE_TIMEOUT, i = null, function() {
                            i || (i = setTimeout(function() {
                                r(), i = null
                            }, o))
                        }), this._callback = t, this._observationTargets = [], this._queuedEntries = [], this._rootMarginValues = this._parseRootMargin(a.rootMargin), this.thresholds = this._initThresholds(a.threshold), this.root = a.root || null, this.rootMargin = this._rootMarginValues.map(function(t) {
                            return t.value + t.unit
                        }).join(" "), this._monitoringDocuments = [], this._monitoringUnsubscribes = []
                    }

                    function u(t, n, r, o) {
                        "function" == typeof t.addEventListener ? t.addEventListener(n, r, o || !1) : "function" == typeof t.attachEvent && t.attachEvent("on" + n, r)
                    }

                    function c(t, n, r, o) {
                        "function" == typeof t.removeEventListener ? t.removeEventListener(n, r, o || !1) : "function" == typeof t.detachEvent && t.detachEvent("on" + n, r)
                    }

                    function f(t) {
                        var n;
                        try {
                            n = t.getBoundingClientRect()
                        } catch (t) {}
                        return n ? (n.width && n.height || (n = {
                            top: n.top,
                            right: n.right,
                            bottom: n.bottom,
                            left: n.left,
                            width: n.right - n.left,
                            height: n.bottom - n.top
                        }), n) : d()
                    }

                    function d() {
                        return {
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            width: 0,
                            height: 0
                        }
                    }

                    function p(t) {
                        return !t || "x" in t ? t : {
                            top: t.top,
                            y: t.top,
                            bottom: t.bottom,
                            left: t.left,
                            x: t.left,
                            right: t.right,
                            width: t.width,
                            height: t.height
                        }
                    }

                    function h(t, n) {
                        var r = n.top - t.top,
                            o = n.left - t.left;
                        return {
                            top: r,
                            left: o,
                            height: n.height,
                            width: n.width,
                            bottom: r + n.height,
                            right: o + n.width
                        }
                    }

                    function v(t, n) {
                        for (var r = n; r;) {
                            if (r == t) return !0;
                            r = m(r)
                        }
                        return !1
                    }

                    function m(t) {
                        var r = t.parentNode;
                        return 9 == t.nodeType && t != n ? a(t) : (r && r.assignedSlot && (r = r.assignedSlot.parentNode), r && 11 == r.nodeType && r.host) ? r.host : r
                    }

                    function y(t) {
                        return t && 9 === t.nodeType
                    }
                }()
            },
            792: function(t, n, r) {
                function o(t) {
                    return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
                }
                var i = 0 / 0,
                    a = /^\s+|\s+$/g,
                    l = /^[-+]0x[0-9a-f]+$/i,
                    s = /^0b[01]+$/i,
                    u = /^0o[0-7]+$/i,
                    c = parseInt,
                    f = (void 0 === r.g ? "undefined" : o(r.g)) == "object" && r.g && r.g.Object === Object && r.g,
                    d = ("undefined" == typeof self ? "undefined" : o(self)) == "object" && self && self.Object === Object && self,
                    p = f || d || Function("return this")(),
                    h = Object.prototype.toString,
                    v = Math.max,
                    m = Math.min,
                    y = function() {
                        return p.Date.now()
                    };

                function b(t) {
                    var n = void 0 === t ? "undefined" : o(t);
                    return !!t && ("object" == n || "function" == n)
                }

                function g(t) {
                    if ("number" == typeof t) return t;
                    if ((void 0 === (n = t) ? "undefined" : o(n)) == "symbol" || n && (void 0 === n ? "undefined" : o(n)) == "object" && "[object Symbol]" == h.call(n)) return i;
                    if (b(t)) {
                        var n, r = "function" == typeof t.valueOf ? t.valueOf() : t;
                        t = b(r) ? r + "" : r
                    }
                    if ("string" != typeof t) return 0 === t ? t : +t;
                    t = t.replace(a, "");
                    var f = s.test(t);
                    return f || u.test(t) ? c(t.slice(2), f ? 2 : 8) : l.test(t) ? i : +t
                }
                t.exports = function(t, n, r) {
                    var o, i, a, l, s, u, c = 0,
                        f = !1,
                        d = !1,
                        p = !0;
                    if ("function" != typeof t) throw TypeError("Expected a function");

                    function h(n) {
                        var r = o,
                            a = i;
                        return o = i = void 0, c = n, l = t.apply(a, r)
                    }

                    function w(t) {
                        var r = t - u,
                            o = t - c;
                        return void 0 === u || r >= n || r < 0 || d && o >= a
                    }

                    function x() {
                        var t, r, o, i = y();
                        if (w(i)) return O(i);
                        s = setTimeout(x, (t = i - u, r = i - c, o = n - t, d ? m(o, a - r) : o))
                    }

                    function O(t) {
                        return (s = void 0, p && o) ? h(t) : (o = i = void 0, l)
                    }

                    function E() {
                        var t, r = y(),
                            a = w(r);
                        if (o = arguments, i = this, u = r, a) {
                            if (void 0 === s) return c = t = u, s = setTimeout(x, n), f ? h(t) : l;
                            if (d) return s = setTimeout(x, n), h(u)
                        }
                        return void 0 === s && (s = setTimeout(x, n)), l
                    }
                    return n = g(n) || 0, b(r) && (f = !!r.leading, a = (d = "maxWait" in r) ? v(g(r.maxWait) || 0, n) : a, p = "trailing" in r ? !!r.trailing : p), E.cancel = function() {
                        void 0 !== s && clearTimeout(s), c = 0, o = u = i = s = void 0
                    }, E.flush = function() {
                        return void 0 === s ? l : O(y())
                    }, E
                }
            },
            794: function(t, n, r) {
                "use strict";
                t.exports = {}
            },
            162: function(t, n, r) {
                "use strict";
                t.exports = {}
            }
        },
        n = {};

    function r(o) {
        var i = n[o];
        if (void 0 !== i) return i.exports;
        var a = n[o] = {
            exports: {}
        };
        return t[o](a, a.exports, r), a.exports
    }
    r.m = t, r.n = function(t) {
        var n = t && t.__esModule ? function() {
            return t.default
        } : function() {
            return t
        };
        return r.d(n, {
            a: n
        }), n
    }, r.d = function(t, n) {
        for (var o in n) r.o(n, o) && !r.o(t, o) && Object.defineProperty(t, o, {
            enumerable: !0,
            get: n[o]
        })
    }, r.k = function(t) {
        return "" + t + ".css"
    }, r.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (t) {
            if ("object" == typeof window) return window
        }
    }(), r.o = function(t, n) {
        return Object.prototype.hasOwnProperty.call(t, n)
    }, r.r = function(t) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(t, "__esModule", {
            value: !0
        })
    }, r.nc = void 0, r.rv = function() {
        return "1.5.7"
    }, r.g.importScripts && (o = r.g.location + "");
    var o, i = r.g.document;
    if (!o && i && (i.currentScript && "SCRIPT" === i.currentScript.tagName.toUpperCase() && (o = i.currentScript.src), !o)) {
        var a = i.getElementsByTagName("script");
        if (a.length)
            for (var l = a.length - 1; l > -1 && (!o || !/^http(s?):/.test(o));) o = a[l--].src
    }
    if (!o) throw Error("Automatic publicPath is not supported in this browser");
    r.p = o.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var t, n, o, i, a, l, s, u, c = window.ReactJSX,
                f = window.Roblox["core-scripts"].util.ready,
                d = r.n(f),
                p = window.Roblox["core-scripts"].react,
                h = window.TanstackQuery,
                v = window.React,
                m = r.n(v),
                y = r(792),
                b = r.n(y);
            r(821);
            var g = function(t, n) {
                    if (0 === t.length || 0 === n) return [t];
                    for (var r = [], o = 0; o < t.length; o += n) r.push(t.slice(o, o + n));
                    return r
                },
                w = function(t, n, r) {
                    var o = [];
                    return n.forEach(function(n) {
                        if (null == n ? void 0 : n.isIntersecting) {
                            var i = t.findIndex(function(t) {
                                return t === n.target
                            });
                            i >= 0 && (o.push(i), r.unobserve(n.target))
                        }
                    }), o.sort(function(t, n) {
                        return t - n
                    })
                },
                x = function(t, n, r) {
                    var o = (0, v.useRef)(new Set),
                        i = (0, v.useRef)(new Set),
                        a = (0, v.useRef)(null),
                        l = (0, v.useCallback)(function() {
                            g(Array.from(i.current).filter(function(t) {
                                return !o.current.has(t)
                            }), 25).filter(function(t) {
                                return t.length > 0
                            }).forEach(function(t) {
                                r(t), t.forEach(function(t) {
                                    return o.current.add(t)
                                })
                            }), i.current.clear()
                        }, [r]),
                        s = (0, v.useMemo)(function() {
                            return b()(function() {
                                return l()
                            }, 200)
                        }, [l]);
                    (0, v.useEffect)(function() {
                        var n, r, o = Array.from(null != (r = null == t || null == (n = t.current) ? void 0 : n.children) ? r : []).filter(function(t) {
                            var n;
                            return null != (n = HTMLElement) && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
                        });
                        return a.current && (a.current(), a.current = null), a.current = function(t, n) {
                                var r = t.elements,
                                    o = t.threshold;
                                try {
                                    var i = new window.IntersectionObserver(n, {
                                        threshold: o
                                    });
                                    return r.forEach(function(t) {
                                            i.observe(t)
                                        }),
                                        function() {
                                            return i.disconnect()
                                        }
                                } catch (t) {}
                                return function() {}
                            }({
                                elements: o,
                                threshold: .5
                            }, function(t, n) {
                                s.cancel(), w(o, t, n).forEach(function(t) {
                                    return i.current.add(t)
                                }), s()
                            }),
                            function() {
                                s.cancel(), a.current && (a.current(), a.current = null)
                            }
                    }, [t, n, s, i])
                };
            (e2 = ti || (ti = {})).ItemImpressions = "itemImpressions", e2.ItemAction = "itemAction", (e3 = ta || (ta = {})).Games = "Games", e3.Home = "Home", e3.SearchLanding = "SearchLanding", e3.Spotlight = "Spotlight", e3.UserProfile = "UserProfile", e3.GameDetail = "GameDetail", e3.SongList = "SongList", e3.SearchPage = "SearchPage", (e4 = tl || (tl = {})).HomePageSessionInfo = "homePageSessionInfo", e4.DiscoverPageSessionInfo = "discoverPageSessionInfo", e4.GameSearchSessionInfo = "gameSearchSessionInfo", e4.SpotlightPageSessionInfo = "spotlightPageSessionInfo", (e5 = ts || (ts = {})).ContentType = "contentType", e5.Context = "context", e5.CollectionId = "collectionId", e5.CollectionPosition = "collectionPosition", e5.CollectionComponentType = "collectionComponentType", (e8 = tu || (tu = {})).User = "User", e8.Game = "Game", e8.Song = "Song", e8.Look = "Look", e8.Description = "Description", (e6 = tc || (tc = {})).Online = "online", e6.InGame = "inGame", e6.InStudio = "inStudio", e6.Offline = "offline", (e7 = tf || (tf = {})).Friend = "friend", e7.NotFriend = "notFriend", (e9 = td || (td = {})).ItemIds = "itemIds", e9.ItemPositions = "itemPositions", e9.RowNumbers = "rowNumbers", e9.FeedRowNumbers = "feedRowNumbers", e9.PositionsInRow = "positionsInRow", e9.PositionsInTopic = "positionsInTopic", e9.TotalNumberOfItems = "totalNumberOfItems", (te = tp || (tp = {})).Presences = "presences", te.PresenceUniverseIds = "presenceUniverseIds", te.FriendStatuses = "friendStatuses", te.SourceCarousel = "sourceCarousel", (tt = th || (th = {})).ItemId = "itemId", tt.ItemPosition = "itemPosition", tt.ItemComponentType = "itemComponentType", tt.RowNumber = "rowNumber", tt.FeedRowNumber = "feedRowNumber", tt.PositionInRow = "positionInRow", tt.PositionInTopic = "positionInTopic", tt.TotalNumberOfItems = "totalNumberOfItems", tt.ActionType = "actionType", (tn = tv || (tv = {})).Presence = "presence", tn.PresenceUniverseId = "presenceUniverseId", tn.FriendStatus = "friendStatus", tn.SourceCarousel = "sourceCarousel";
            var O = function(t, n) {
                    return Array.isArray(t) && !n ? t.join(",") : (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) == "object" && t ? JSON.stringify(t) : "number" == typeof t || "string" == typeof t ? t : "boolean" == typeof t ? +!!t : void 0
                },
                E = function(t) {
                    return Object.keys(t).reduce(function(n, r) {
                        var o = O(t[r], !1);
                        return void 0 !== o && (n[r] = o), n
                    }, {})
                },
                S = window.Roblox.ExperimentationService,
                C = r.n(S),
                j = window.Roblox["core-scripts"].realtime,
                P = r.n(j),
                I = window.Roblox["core-scripts"].dataStore,
                A = r.n(I),
                R = window.Roblox["core-scripts"].environmentUrls,
                N = r.n(R),
                k = window.Roblox["core-scripts"].http.http;

            function T(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function _(t, n, r, o, i, a, l) {
                try {
                    var s = t[a](l),
                        u = s.value
                } catch (t) {
                    r(t);
                    return
                }
                s.done ? n(u) : Promise.resolve(u).then(o, i)
            }

            function D(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, i) {
                        var a = t.apply(n, r);

                        function l(t) {
                            _(a, o, i, l, s, "next", t)
                        }

                        function s(t) {
                            _(a, o, i, l, s, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function L(t) {
                return function(t) {
                    if (Array.isArray(t)) return T(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return T(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return T(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function M(t, n) {
                var r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = s(0), l.throw = s(1), l.return = s(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function s(s) {
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, o && (i = 2 & c[0] ? o.return : c[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, c[1])).done) return i;
                            switch (o = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, o = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = n.call(t, a)
                        } catch (t) {
                            c = [6, t], o = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var F = function() {
                return D(function() {
                    var t;
                    return M(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return t = {
                                    url: "".concat(N().friendsApi, "/v1/my/new-friend-requests/count"),
                                    retryable: !0,
                                    withCredentials: !0
                                }, [4, k.get(t)];
                            case 1:
                                return [2, n.sent().data.count]
                        }
                    })
                })()
            };

            function U(t, n, r, o, i, a, l) {
                try {
                    var s = t[a](l),
                        u = s.value
                } catch (t) {
                    r(t);
                    return
                }
                s.done ? n(u) : Promise.resolve(u).then(o, i)
            }
            var z = function() {
                    var t;
                    return (t = function() {
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return l.next = s(0), l.throw = s(1), l.return = s(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                return this
                            }), l;

                            function s(s) {
                                return function(u) {
                                    var c = [s, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; l && (l = 0, c[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & c[0] ? o.return : c[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, c[1])).done) return i;
                                        switch (o = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                i = c;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                    a.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && a.label < i[1]) {
                                                    a.label = i[1], i = c;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(c);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        c = n.call(t, a)
                                    } catch (t) {
                                        c = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, k.get({
                                        url: "".concat(N().chatApi, "/v1/metadata"),
                                        withCredentials: !0
                                    })];
                                case 1:
                                    return [2, {
                                        chatEnabled: t.sent().data.isChatUserMessagesEnabled
                                    }]
                            }
                        })
                    }, function() {
                        var n = this,
                            r = arguments;
                        return new Promise(function(o, i) {
                            var a = t.apply(n, r);

                            function l(t) {
                                U(a, o, i, l, s, "next", t)
                            }

                            function s(t) {
                                U(a, o, i, l, s, "throw", t)
                            }
                            l(void 0)
                        })
                    })()
                },
                W = function(t) {
                    var n = t.friendsCount,
                        r = t.profileUserId,
                        o = t.isOwnUser,
                        i = t.translate,
                        a = o ? "".concat(N().websiteUrl, "/users/friends#!/friends") : "".concat(N().websiteUrl, "/users/").concat(r, "/friends#!/friends"),
                        l = "Label.Friends";
                    return (0, c.jsxs)("div", {
                        className: "container-header people-list-header",
                        children: [null == n ? (0, c.jsx)("h2", {
                            children: i(l)
                        }) : (0, c.jsxs)("h2", {
                            children: [i(l), (0, c.jsx)("span", {
                                className: "friends-count",
                                children: "(".concat(null != n ? n : 0, ")")
                            })]
                        }), (0, c.jsx)("a", {
                            href: a,
                            className: "btn-secondary-xs btn-more see-all-link-icon",
                            children: i("Heading.SeeAll")
                        })]
                    })
                },
                B = window.RobloxPresence,
                V = r.n(B),
                G = window.RobloxBadges,
                H = window.Roblox["core-scripts"].guac,
                J = "web-plus-identity-badge",
                X = function(t) {
                    return (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) == "object" && null !== t
                },
                $ = function() {
                    var t = (0, h.useQuery)({
                        queryKey: ["guac/".concat(J)],
                        queryFn: function() {
                            return (0, H.callBehaviour)(J)
                        },
                        staleTime: 1 / 0
                    }).data;
                    return X(t) && !0 === t.plusIdentityBadgeEnabled
                },
                q = function() {
                    return (q = Object.assign || function(t) {
                        for (var n, r = 1, o = arguments.length; r < o; r++)
                            for (var i in n = arguments[r]) Object.prototype.hasOwnProperty.call(n, i) && (t[i] = n[i]);
                        return t
                    }).apply(this, arguments)
                };

            function K(t, n) {
                var r = {};
                for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && 0 > n.indexOf(o) && (r[o] = t[o]);
                if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
                    var i = 0;
                    for (o = Object.getOwnPropertySymbols(t); i < o.length; i++) 0 > n.indexOf(o[i]) && Object.prototype.propertyIsEnumerable.call(t, o[i]) && (r[o[i]] = t[o[i]])
                }
                return r
            }
            var Y = function() {
                    for (var t, n, r = 0, o = "", i = arguments.length; r < i; r++)(t = arguments[r]) && (n = function t(n) {
                        var r, o, i = "";
                        if ("string" == typeof n || "number" == typeof n) i += n;
                        else if ("object" == (void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n))
                            if (Array.isArray(n)) {
                                var a = n.length;
                                for (r = 0; r < a; r++) n[r] && (o = t(n[r])) && (i && (i += " "), i += o)
                            } else
                                for (o in n) n[o] && (i && (i += " "), i += o);
                        return i
                    }(t)) && (o && (o += " "), o += n);
                    return o
                },
                Z = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                Q = m().forwardRef(function(t, n) {
                    var r = t.name,
                        o = t.size,
                        i = t.className,
                        a = (t.children, K(t, ["name", "size", "className", "children"]));
                    return m().createElement("span", Object.assign({
                        ref: n,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: Y("grow-0 shrink-0 basis-auto icon", r, Z[void 0 === o ? "Medium" : o], i)
                    }, a))
                });
            Q.displayName = "Icon";
            var ee = function(t) {
                    var n = t.isVerified,
                        r = t.isRobloxPlus,
                        o = t.isPremium,
                        i = t.isRobloxAdmin,
                        a = t.size,
                        l = void 0 === a ? "Large" : a,
                        s = t.plusBadgeAriaLabel,
                        u = !0 === r,
                        f = !0 === o && !u,
                        d = !0 === n,
                        p = !0 === i;
                    return d || u || f || p ? (0, c.jsxs)("span", {
                        className: "items-center gap-xxsmall inline-flex shrink-0 [--icon-size-small:1em]",
                        children: [d && (0, c.jsxs)("span", {
                            className: "relative flex items-center justify-center",
                            children: [(0, c.jsx)(Q, {
                                name: "icon-filled-verified-backplate",
                                className: "content-system-emphasis",
                                size: l
                            }), (0, c.jsx)(Q, {
                                name: "icon-filled-verified-check",
                                className: "absolute",
                                style: {
                                    color: "white"
                                },
                                size: l
                            })]
                        }), u && (0, c.jsx)(Q, {
                            name: "icon-regular-roblox-plus",
                            className: "content-system-contrast",
                            size: l,
                            "aria-label": s
                        }), f && (0, c.jsx)(Q, {
                            name: "icon-filled-premium",
                            className: "content-system-contrast",
                            size: l
                        }), p && (0, c.jsx)(Q, {
                            name: "icon-filled-tilt",
                            className: "content-system-contrast",
                            size: l
                        })]
                    }) : null
                },
                et = window.ReactStyleGuide,
                en = window.RobloxThumbnails,
                er = function(t) {
                    var n = t.id,
                        r = t.userProfileUrl,
                        o = t.handleImageClick,
                        i = t.translate,
                        a = (0, c.jsx)(en.Thumbnail2d, {
                            type: en.ThumbnailTypes.avatarHeadshot,
                            size: en.DefaultThumbnailSize,
                            targetId: n,
                            containerClass: "avatar-card-image"
                        });
                    return (0, c.jsx)(et.AvatarCardItem.Headshot, {
                        statusIcon: (0, c.jsx)(V().PresenceStatusIcon, {
                            translate: i,
                            userId: n
                        }),
                        thumbnail: a,
                        imageLink: r,
                        handleImageClick: o
                    })
                },
                eo = function(t) {
                    var n = t.id,
                        r = t.displayName,
                        o = t.userProfileUrl,
                        i = t.userPresence,
                        a = t.hasVerifiedBadge,
                        l = t.isRobloxPlus,
                        s = t.sendClickEvent,
                        u = t.translate,
                        f = $() && !0 === l;
                    return (0, c.jsxs)("div", {
                        className: "friend-tile-content",
                        children: [(0, c.jsx)(er, {
                            id: n,
                            translate: u,
                            userProfileUrl: o,
                            handleImageClick: s
                        }), (0, c.jsxs)("a", {
                            href: o,
                            onClick: s,
                            className: "friends-carousel-tile-labels",
                            "data-testid": "friends-carousel-tile-labels",
                            children: [(0, c.jsx)("div", {
                                className: "friends-carousel-tile-label",
                                children: (0, c.jsxs)("div", {
                                    className: "friends-carousel-tile-name",
                                    children: [(0, c.jsx)("span", {
                                        className: "friends-carousel-display-name",
                                        children: r
                                    }), a && (0, c.jsxs)("div", {
                                        className: "friend-tile-verified-badge",
                                        children: [(0, c.jsx)("div", {
                                            className: "friend-tile-spacer"
                                        }), (0, c.jsx)(G.VerifiedBadgeIconContainer, {
                                            size: G.BadgeSizes.SUBHEADER,
                                            additionalContainerClass: "verified-badge"
                                        })]
                                    }), f && (0, c.jsx)(ee, {
                                        isRobloxPlus: !0,
                                        size: "Small",
                                        plusBadgeAriaLabel: u("Label.RobloxPlusSubscriber", void 0, "Roblox Plus subscriber")
                                    })]
                                })
                            }), (0, c.jsx)("div", {
                                className: "friends-carousel-tile-sublabel",
                                children: null != i && (0, c.jsx)("div", {
                                    className: "friends-carousel-tile-experience",
                                    children: i
                                })
                            })]
                        })]
                    })
                },
                ei = window.Roblox,
                ea = window.Roblox["core-scripts"].meta.device,
                el = window.CoreRobloxUtilities;

            function es(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function eu(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        var o;
                        o = r[n], n in t ? Object.defineProperty(t, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = o
                    })
                }
                return t
            }

            function ec(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function ef(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function ed(t) {
                return function(t) {
                    if (Array.isArray(t)) return es(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return es(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return es(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ep(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function eh(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var ev = Symbol.for("react.lazy"),
                em = v[" use ".trim().toString()];

            function ey(t) {
                var n;
                return null != t && "object" == (void 0 === t ? "undefined" : ep(t)) && "$$typeof" in t && t.$$typeof === ev && "_payload" in t && "object" == ep(n = t._payload) && null !== n && "then" in n
            }
            var eb = ((e1 = v.forwardRef(function(t, n) {
                    var r = t.children,
                        o = ef(t, ["children"]);
                    if (ey(r) && "function" == typeof em && (r = em(r._payload)), v.isValidElement(r)) {
                        var i, a, l, s, u = (s = null == (a = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? i.ref : (s = null == (l = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : l.get) && "isReactWarning" in s && s.isReactWarning ? i.props.ref : i.props.ref || i.ref,
                            c = function(t, n) {
                                var r = eu({}, n);
                                for (var o in n) ! function(o) {
                                    var i = t[o],
                                        a = n[o];
                                    /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                        var o = a.apply(void 0, ed(n));
                                        return i.apply(void 0, ed(n)), o
                                    } : i && (r[o] = i) : "style" === o ? r[o] = eu({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                }(o);
                                return eu({}, t, r)
                            }(o, r.props);
                        return r.type !== v.Fragment && (c.ref = n ? function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return function(t) {
                                var r = !1,
                                    o = n.map(function(n) {
                                        var o = eh(n, t);
                                        return r || "function" != typeof o || (r = !0), o
                                    });
                                if (r) return function() {
                                    for (var t = 0; t < o.length; t++) {
                                        var r = o[t];
                                        "function" == typeof r ? r() : eh(n[t], null)
                                    }
                                }
                            }
                        }(n, u) : u), v.cloneElement(r, c)
                    }
                    return v.Children.count(r) > 1 ? v.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), tr = e1, (to = v.forwardRef(function(t, n) {
                    var r = t.children,
                        o = ef(t, ["children"]);
                    ey(r) && "function" == typeof em && (r = em(r._payload));
                    var i = v.Children.toArray(r),
                        a = i.find(ew);
                    if (a) {
                        var l = a.props.children,
                            s = i.map(function(t) {
                                return t === a ? v.Children.count(l) > 1 ? v.Children.only(null) : v.isValidElement(l) ? l.props.children : null : t
                            });
                        return (0, c.jsx)(tr, ec(eu({}, o), {
                            ref: n,
                            children: v.isValidElement(l) ? v.cloneElement(l, void 0, s) : null
                        }))
                    }
                    return (0, c.jsx)(tr, ec(eu({}, o), {
                        ref: n,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), to),
                eg = Symbol("radix.slottable");

            function ew(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === eg
            }
            var ex = function(t) {
                var n = t.className;
                return m().createElement("div", {
                    "aria-hidden": !0,
                    "data-testid": "foundation-web-state-layer",
                    className: Y("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", n)
                })
            };

            function eO(t, n) {
                void 0 === n && (n = {});
                var r = n.insertAt;
                if (t && "undefined" != typeof document) {
                    var o = document.head || document.getElementsByTagName("head")[0],
                        i = document.createElement("style");
                    i.type = "text/css", "top" === r && o.firstChild ? o.insertBefore(i, o.firstChild) : o.appendChild(i), i.styleSheet ? i.styleSheet.cssText = t : i.appendChild(document.createTextNode(t))
                }
            }
            eO("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var eE = function(t) {
                    var n = t.width,
                        r = t.height;
                    return m().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: n,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, m().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                eS = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                eC = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                ej = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                eP = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                eI = (0, v.forwardRef)(function(t, n) {
                    var r = t.children,
                        o = t.className,
                        i = t.style,
                        a = t.isDisabled,
                        l = void 0 !== a && a,
                        s = t.isLoading,
                        u = void 0 !== s && s,
                        c = t.icon,
                        f = t.size,
                        d = void 0 === f ? "Large" : f,
                        p = t.variant,
                        h = void 0 === p ? "Emphasis" : p,
                        v = t.asChild,
                        y = K(t, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        b = Y("foundation-web-button", l ? "opacity-[0.5]" : ["relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", eC[d], l ? eP[h] : ej[h], o),
                        g = Object.assign({
                            textDecoration: "none"
                        }, i),
                        w = function(t) {
                            return m().createElement(m().Fragment, null, m().createElement(ex, null), u && m().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, m().createElement(eE, {
                                width: eS[d],
                                height: eS[d]
                            })), m().createElement("span", {
                                className: Y("flex items-center min-width-0", "Large" === d || "Medium" === d ? "gap-small" : "gap-xsmall", u && "invisible")
                            }, c && m().createElement(Q, {
                                name: c,
                                size: d
                            }), m().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, t)))
                        };
                    if (v) {
                        var x = K(y, ["as"]),
                            O = m().Children.only(r);
                        return m().createElement(eb, Object.assign({
                            ref: n
                        }, x, {
                            className: b,
                            style: g,
                            "aria-disabled": l || void 0
                        }), m().cloneElement(O, {}, w(O.props.children)))
                    }
                    if ("a" === y.as) {
                        y.as;
                        var E = y.href,
                            S = K(y, ["as", "href"]);
                        return m().createElement("a", Object.assign({
                            ref: n
                        }, S, {
                            "aria-disabled": l,
                            href: l ? void 0 : E,
                            className: b,
                            style: g
                        }), w(r))
                    }
                    var C = K(y, ["as"]);
                    return m().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, C, {
                        disabled: l,
                        className: b,
                        style: g
                    }), w(r))
                }),
                eA = new Set(["_self", "_parent", "_top"]),
                eR = {
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                eN = {
                    Standard: "content-emphasis",
                    Emphasis: "content-emphasis",
                    Inverse: "content-inverse-default"
                },
                ek = (0, v.forwardRef)(function(t, n) {
                    var r, o, i, a = t.children,
                        l = t.className,
                        s = t.size,
                        u = t.color,
                        c = t.variant,
                        f = t.underline,
                        d = void 0 === f ? "hover" : f,
                        p = t.isExternal,
                        h = t.asChild,
                        v = K(t, ["children", "className", "size", "color", "variant", "underline", "isExternal", "asChild"]),
                        y = (r = null != (i = v.as) ? i : "a", o = "button" === v.as ? void 0 : v.target, void 0 !== p ? p : "button" !== r && void 0 !== o && !eA.has(o)),
                        b = Y("foundation-web-link", "button" === v.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === (void 0 === c ? "Standalone" : c) || y) && "inline-flex items-center gap-xsmall", void 0 !== s && eR[s], eN[void 0 === u ? "Emphasis" : u], "always" === d ? "underline" : "no-underline", "hover" === d && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", l),
                        g = y ? m().createElement("span", {
                            "aria-hidden": !0,
                            "data-testid": "foundation-web-icon",
                            className: Y("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
                        }) : null;
                    if (h) {
                        var w = K(v, ["as"]),
                            x = m().Children.only(a);
                        return m().isValidElement(x) ? m().createElement(eb, Object.assign({
                            ref: n
                        }, w, {
                            className: b
                        }), m().cloneElement(x, {}, m().createElement(m().Fragment, null, x.props.children, g))) : null
                    }
                    if ("button" === v.as) {
                        v.as;
                        var O = v.type,
                            E = K(v, ["as", "type"]);
                        return m().createElement("button", Object.assign({
                            ref: n,
                            type: null != O ? O : "button"
                        }, E, {
                            className: b
                        }), a, g)
                    }
                    var S = K(v, ["as"]);
                    return m().createElement("a", Object.assign({
                        ref: n
                    }, S, {
                        className: b
                    }), a, g)
                });
            ek.displayName = "Link";
            var eT = function(t) {
                var n = t.displayName,
                    r = t.userPresence,
                    o = t.universeId,
                    i = t.userProfileUrl,
                    a = t.canChat,
                    l = t.translate,
                    s = t.launchGame,
                    u = t.gameUrl,
                    f = t.placeId,
                    d = t.isIARCJoinCardGameRowClickableEnabled,
                    p = t.sendGameRowClickEvent,
                    h = t.startChat,
                    m = (0, c.jsxs)(v.Fragment, {
                        children: [(0, c.jsx)("span", {
                            className: "shrink-0 radius-small clip",
                            style: {
                                display: "inline-block",
                                width: 40,
                                height: 40
                            },
                            children: (0, c.jsx)(en.Thumbnail2d, {
                                type: en.ThumbnailTypes.gameIcon,
                                size: en.ThumbnailGameIconSize.size150,
                                targetId: o,
                                imgClassName: "width-full height-full",
                                containerClass: "width-full height-full"
                            })
                        }), (0, c.jsxs)("span", {
                            className: "friend-presence-info flex flex-col justify-center min-width-0 fill",
                            children: [(0, c.jsxs)("span", {
                                className: "friend-tile-is-playing text-body-medium content-default text-truncate-end text-no-wrap",
                                children: [n, " ", l("Text.IsPlaying")]
                            }), (0, c.jsx)("span", {
                                className: "friend-tile-game-name text-title-medium content-emphasis text-truncate-end text-no-wrap",
                                children: r
                            })]
                        })]
                    }),
                    y = d && null != f && "" !== u;
                return (0, c.jsx)("div", {
                    className: "friend-tile-dropdown friend-tile-dropdown--iarc",
                    style: {
                        backgroundColor: "transparent",
                        borderRadius: 0
                    },
                    children: (0, c.jsxs)("div", {
                        className: "in-game-friend-card--iarc flex flex-col items-start justify-center padding-y-large padding-x-large gap-medium radius-medium stroke-standard stroke-default bg-over-media-300 width-full",
                        style: {
                            boxSizing: "border-box"
                        },
                        children: [y ? (0, c.jsx)("a", {
                            href: u,
                            onClick: p,
                            className: "flex items-center gap-small width-full min-width-0",
                            style: {
                                color: "inherit",
                                textDecoration: "none"
                            },
                            children: m
                        }) : (0, c.jsx)("div", {
                            className: "flex items-center gap-small width-full min-width-0",
                            children: m
                        }), (0, c.jsxs)("div", {
                            className: "in-game-friend-card-actions flex flex-col self-stretch gap-small",
                            children: [(0, c.jsx)(eI, {
                                variant: "Emphasis",
                                size: "Medium",
                                className: "grow",
                                onClick: s,
                                children: l("Action.Join")
                            }), a && (0, c.jsx)(eI, {
                                variant: "Standard",
                                size: "Medium",
                                className: "grow",
                                onClick: h,
                                children: l("Action.Chat")
                            }), (0, c.jsx)(ek, {
                                href: i,
                                color: "Standard",
                                underline: "none",
                                className: "flex items-center justify-center self-stretch height-600 text-label-medium content-action-standard",
                                children: l("Label.ViewProfile")
                            })]
                        })]
                    })
                })
            };

            function e_(t, n, r, o, i, a, l) {
                try {
                    var s = t[a](l),
                        u = s.value
                } catch (t) {
                    r(t);
                    return
                }
                s.done ? n(u) : Promise.resolve(u).then(o, i)
            }
            var eD = function(t) {
                    var n, r = t.friend,
                        o = t.displayName,
                        i = t.userProfileUrl,
                        a = t.userPresence,
                        l = t.isInGame,
                        s = t.gameUrl,
                        u = t.universeId,
                        f = t.canChat,
                        d = t.translate,
                        p = t.isIARCJoinCardRedesignEnabled,
                        h = t.isIARCJoinCardGameRowClickableEnabled,
                        v = t.sendGameRowClickEvent,
                        m = function() {
                            var t;
                            return (t = function() {
                                var t, n, o, i;
                                return function(t, n) {
                                    var r, o, i, a = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & i[0]) throw i[1];
                                                return i[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return l.next = s(0), l.throw = s(1), l.return = s(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                        return this
                                    }), l;

                                    function s(s) {
                                        return function(u) {
                                            var c = [s, u];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; l && (l = 0, c[0] && (a = 0)), a;) try {
                                                if (r = 1, o && (i = 2 & c[0] ? o.return : c[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, c[1])).done) return i;
                                                switch (o = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                                    case 0:
                                                    case 1:
                                                        i = c;
                                                        break;
                                                    case 4:
                                                        return a.label++, {
                                                            value: c[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        a.label++, o = c[1], c = [0];
                                                        continue;
                                                    case 7:
                                                        c = a.ops.pop(), a.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                            a = 0;
                                                            continue
                                                        }
                                                        if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                            a.label = c[1];
                                                            break
                                                        }
                                                        if (6 === c[0] && a.label < i[1]) {
                                                            a.label = i[1], i = c;
                                                            break
                                                        }
                                                        if (i && a.label < i[2]) {
                                                            a.label = i[2], a.ops.push(c);
                                                            break
                                                        }
                                                        i[2] && a.ops.pop(), a.trys.pop();
                                                        continue
                                                }
                                                c = n.call(t, a)
                                            } catch (t) {
                                                c = [6, t], o = 0
                                            } finally {
                                                r = i = 0
                                            }
                                            if (5 & c[0]) throw c[1];
                                            return {
                                                value: c[0] ? c[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (n = null != (t = r.presence.gameId) ? t : "", !(null == (o = (0, ea.getDeviceMeta)()) ? void 0 : o.isInApp)) return [3, 1];
                                            return o.isDesktop ? null === ei.GameLauncher || void 0 === ei.GameLauncher || ei.GameLauncher.followPlayerIntoGame(r.id, n, "JoinUser") : window.location.href = "/games/start?userID=".concat(r.id, "&joinAttemptId=").concat(n, "&joinAttemptOrigin=JoinUser"), [3, 5];
                                        case 1:
                                            if (!((null == o ? void 0 : o.isAndroidDevice) || (null == o ? void 0 : o.isChromeOs))) return [3, 2];
                                            return window.location.href = "intent://userId=".concat(r.id, "&joinAttemptId=").concat(n, "&joinAttemptOrigin=JoinUser#Intent;scheme=robloxmobile;package=com.roblox.client;S.browser_fallback_url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.roblox.client;end"), [3, 5];
                                        case 2:
                                            if (!(null == o ? void 0 : o.isIosDevice)) return [3, 3];
                                            return window.location.href = "robloxmobile://userId=".concat(r.id, "&joinAttemptId=").concat(n, "&joinAttemptOrigin=JoinUser"), [3, 5];
                                        case 3:
                                            return [4, null == (i = window.Roblox.ProtocolHandlerClientInterface) ? void 0 : i.followPlayerIntoGame({
                                                userId: r.id,
                                                joinAttemptId: n,
                                                joinAttemptOrigin: "JoinUser"
                                            })];
                                        case 4:
                                            a.sent(), a.label = 5;
                                        case 5:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var n = this,
                                    r = arguments;
                                return new Promise(function(o, i) {
                                    var a = t.apply(n, r);

                                    function l(t) {
                                        e_(a, o, i, l, s, "next", t)
                                    }

                                    function s(t) {
                                        e_(a, o, i, l, s, "throw", t)
                                    }
                                    l(void 0)
                                })
                            })()
                        },
                        y = function() {
                            el.chatService.startDesktopAndMobileWebChat({
                                userId: r.id
                            })
                        };
                    return p && l && null != a ? (0, c.jsx)(eT, {
                        displayName: o,
                        userPresence: a,
                        universeId: u,
                        userProfileUrl: i,
                        canChat: f,
                        translate: d,
                        launchGame: m,
                        gameUrl: s,
                        placeId: null != (n = r.presence.placeId) ? n : null,
                        isIARCJoinCardGameRowClickableEnabled: h,
                        sendGameRowClickEvent: v,
                        startChat: y
                    }) : (0, c.jsxs)("div", {
                        className: "friend-tile-dropdown",
                        children: [l && null != a && (0, c.jsxs)("div", {
                            className: "in-game-friend-card",
                            children: [(0, c.jsx)("button", {
                                type: "button",
                                className: "friend-tile-non-styled-button",
                                onClick: function() {
                                    window.open(s)
                                },
                                children: (0, c.jsx)(en.Thumbnail2d, {
                                    type: en.ThumbnailTypes.gameIcon,
                                    size: en.ThumbnailGameIconSize.size150,
                                    targetId: u,
                                    imgClassName: "game-card-thumb",
                                    containerClass: "friend-tile-game-card"
                                })
                            }), (0, c.jsxs)("div", {
                                className: "friend-presence-info",
                                children: [(0, c.jsx)("button", {
                                    type: "button",
                                    className: "friend-tile-non-styled-button",
                                    onClick: function() {
                                        window.open(s)
                                    },
                                    children: a
                                }), (0, c.jsx)(et.Button, {
                                    variant: et.Button.variants.growth,
                                    size: et.Button.sizes.small,
                                    width: et.Button.widths.full,
                                    onClick: m,
                                    children: d("Action.Join")
                                })]
                            })]
                        }), (0, c.jsxs)("ul", {
                            children: [f && (0, c.jsx)("li", {
                                children: (0, c.jsxs)("button", {
                                    type: "button",
                                    className: "friend-tile-dropdown-button",
                                    onClick: y,
                                    children: [(0, c.jsx)("span", {
                                        className: "icon-chat-gray"
                                    }), " ", d("Label.Chat", {
                                        username: o
                                    })]
                                })
                            }), (0, c.jsx)("li", {
                                children: (0, c.jsxs)("button", {
                                    type: "button",
                                    className: "friend-tile-dropdown-button",
                                    onClick: function() {
                                        window.open(i)
                                    },
                                    children: [(0, c.jsx)("span", {
                                        className: "icon-viewdetails"
                                    }), " ", d("Label.ViewProfile")]
                                })
                            })]
                        })]
                    })
                },
                eL = window.ReactDOM,
                eM = r.n(eL);

            function eF(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function eU(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function ez(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function eW(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        eU(t, n, r[n])
                    })
                }
                return t
            }

            function eB(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function eV(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function eG(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            l = !0,
                            s = !1;
                        try {
                            for (i = i.call(t); !(l = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); l = !0);
                        } catch (t) {
                            s = !0, o = t
                        } finally {
                            try {
                                l || null == i.return || i.return()
                            } finally {
                                if (s) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || eJ(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eH(t) {
                return function(t) {
                    if (Array.isArray(t)) return eF(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || eJ(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eJ(t, n) {
                if (t) {
                    if ("string" == typeof t) return eF(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eF(t, n)
                }
            }

            function eX(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    i = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === i || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function e$(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function eq() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = e$(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : e$(n[t], null)
                        }
                    }
                }
            }

            function eK() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return v.useCallback(eq.apply(void 0, eH(n)), n)
            }
            var eY = Symbol("radix.slottable");

            function eZ(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === eY
            }
            var eQ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, o, i, a, l, s = (o = r = "Primitive.".concat(n), (i = v.forwardRef(function(t, n) {
                        var r = t.children,
                            o = eV(t, ["children"]);
                        if (v.isValidElement(r)) {
                            var i, a, l, s = (l = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                u = function(t, n) {
                                    var r = eW({}, n);
                                    for (var o in n) ! function(o) {
                                        var i = t[o],
                                            a = n[o];
                                        /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            a.apply(void 0, eH(n)), i.apply(void 0, eH(n))
                                        } : i && (r[o] = i) : "style" === o ? r[o] = eW({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                    }(o);
                                    return eW({}, t, r)
                                }(o, r.props);
                            return r.type !== v.Fragment && (u.ref = n ? eq(n, s) : s), v.cloneElement(r, u)
                        }
                        return v.Children.count(r) > 1 ? v.Children.only(null) : null
                    })).displayName = "".concat(o, ".SlotClone"), a = i, (l = v.forwardRef(function(t, n) {
                        var r = t.children,
                            o = eV(t, ["children"]),
                            i = v.Children.toArray(r),
                            l = i.find(eZ);
                        if (l) {
                            var s = l.props.children,
                                u = i.map(function(t) {
                                    return t === l ? v.Children.count(s) > 1 ? v.Children.only(null) : v.isValidElement(s) ? s.props.children : null : t
                                });
                            return (0, c.jsx)(a, eB(eW({}, o), {
                                ref: n,
                                children: v.isValidElement(s) ? v.cloneElement(s, void 0, u) : null
                            }))
                        }
                        return (0, c.jsx)(a, eB(eW({}, o), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    u = v.forwardRef(function(t, r) {
                        var o = t.asChild,
                            i = eV(t, ["asChild"]),
                            a = o ? s : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, c.jsx)(a, eB(eW({}, i), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(n), eB(eW({}, t), eU({}, n, u))
            }, {});

            function e0(t) {
                var n = v.useRef(t);
                return v.useEffect(function() {
                    n.current = t
                }), v.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(eH(o)))
                    }
                }, [])
            }
            var e1, e2, e3, e4, e5, e8, e6, e7, e9, te, tt, tn, tr, to, ti, ta, tl, ts, tu, tc, tf, td, tp, th, tv, tm, ty, tb = "dismissableLayer.update",
                tg = v.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                tw = v.forwardRef(function(t, n) {
                    var r, o, i = t.disableOutsidePointerEvents,
                        a = void 0 !== i && i,
                        l = t.onEscapeKeyDown,
                        s = t.onPointerDownOutside,
                        u = t.onFocusOutside,
                        f = t.onInteractOutside,
                        d = t.onDismiss,
                        p = eV(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        h = v.useContext(tg),
                        m = eG(v.useState(null), 2),
                        y = m[0],
                        b = m[1],
                        g = null != (o = null == y ? void 0 : y.ownerDocument) ? o : null == (r = globalThis) ? void 0 : r.document,
                        w = eG(v.useState({}), 2)[1],
                        x = eK(n, function(t) {
                            return b(t)
                        }),
                        O = Array.from(h.layers),
                        E = eG(eH(h.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        S = O.indexOf(E),
                        C = y ? O.indexOf(y) : -1,
                        j = h.layersWithOutsidePointerEventsDisabled.size > 0,
                        P = C >= S,
                        I = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = e0(t),
                                i = v.useRef(!1),
                                a = v.useRef(function() {});
                            return v.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !i.current) {
                                            var n = function() {
                                                    tO("dismissableLayer.pointerDownOutside", o, l, {
                                                        discrete: !0
                                                    })
                                                },
                                                l = {
                                                    originalEvent: t
                                                };
                                            "touch" === t.pointerType ? (r.removeEventListener("click", a.current), a.current = n, r.addEventListener("click", a.current, {
                                                once: !0
                                            })) : n()
                                        } else r.removeEventListener("click", a.current);
                                        i.current = !1
                                    },
                                    n = window.setTimeout(function() {
                                        r.addEventListener("pointerdown", t)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(n), r.removeEventListener("pointerdown", t), r.removeEventListener("click", a.current)
                                }
                            }, [r, o]), {
                                onPointerDownCapture: function() {
                                    return i.current = !0
                                }
                            }
                        }(function(t) {
                            var n = t.target,
                                r = eH(h.branches).some(function(t) {
                                    return t.contains(n)
                                });
                            P && !r && (null == s || s(t), null == f || f(t), t.defaultPrevented || null == d || d())
                        }, g),
                        A = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = e0(t),
                                i = v.useRef(!1);
                            return v.useEffect(function() {
                                var t = function(t) {
                                    t.target && !i.current && tO("dismissableLayer.focusOutside", o, {
                                        originalEvent: t
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return r.addEventListener("focusin", t),
                                    function() {
                                        return r.removeEventListener("focusin", t)
                                    }
                            }, [r, o]), {
                                onFocusCapture: function() {
                                    return i.current = !0
                                },
                                onBlurCapture: function() {
                                    return i.current = !1
                                }
                            }
                        }(function(t) {
                            var n = t.target;
                            eH(h.branches).some(function(t) {
                                return t.contains(n)
                            }) || (null == u || u(t), null == f || f(t), t.defaultPrevented || null == d || d())
                        }, g);
                    return function(t) {
                        var n, r, o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                            i = (r = v.useRef(t), v.useEffect(function() {
                                r.current = t
                            }), v.useMemo(function() {
                                return function() {
                                    for (var t, n = arguments.length, o = Array(n), i = 0; i < n; i++) o[i] = arguments[i];
                                    return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(eH(o)))
                                }
                            }, []));
                        v.useEffect(function() {
                            var t = function(t) {
                                "Escape" === t.key && i(t)
                            };
                            return o.addEventListener("keydown", t, {
                                    capture: !0
                                }),
                                function() {
                                    return o.removeEventListener("keydown", t, {
                                        capture: !0
                                    })
                                }
                        }, [i, o])
                    }(function(t) {
                        C === h.layers.size - 1 && (null == l || l(t), !t.defaultPrevented && d && (t.preventDefault(), d()))
                    }, g), v.useEffect(function() {
                        if (y) return a && (0 === h.layersWithOutsidePointerEventsDisabled.size && (ty = g.body.style.pointerEvents, g.body.style.pointerEvents = "none"), h.layersWithOutsidePointerEventsDisabled.add(y)), h.layers.add(y), tx(),
                            function() {
                                a && 1 === h.layersWithOutsidePointerEventsDisabled.size && (g.body.style.pointerEvents = ty)
                            }
                    }, [y, g, a, h]), v.useEffect(function() {
                        return function() {
                            y && (h.layers.delete(y), h.layersWithOutsidePointerEventsDisabled.delete(y), tx())
                        }
                    }, [y, h]), v.useEffect(function() {
                        var t = function() {
                            return w({})
                        };
                        return document.addEventListener(tb, t),
                            function() {
                                return document.removeEventListener(tb, t)
                            }
                    }, []), (0, c.jsx)(eQ.div, eB(eW({}, p), {
                        ref: x,
                        style: eW({
                            pointerEvents: j ? P ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: eX(t.onFocusCapture, A.onFocusCapture),
                        onBlurCapture: eX(t.onBlurCapture, A.onBlurCapture),
                        onPointerDownCapture: eX(t.onPointerDownCapture, I.onPointerDownCapture)
                    }))
                });

            function tx() {
                var t = new CustomEvent(tb);
                document.dispatchEvent(t)
            }

            function tO(t, n, r, o) {
                var i = o.discrete,
                    a = r.originalEvent.target,
                    l = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                n && a.addEventListener(t, n, {
                    once: !0
                }), i ? a && eL.flushSync(function() {
                    return a.dispatchEvent(l)
                }) : a.dispatchEvent(l)
            }
            tw.displayName = "DismissableLayer", v.forwardRef(function(t, n) {
                var r = v.useContext(tg),
                    o = v.useRef(null),
                    i = eK(n, o);
                return v.useEffect(function() {
                    var t = o.current;
                    if (t) return r.branches.add(t),
                        function() {
                            r.branches.delete(t)
                        }
                }, [r.branches]), (0, c.jsx)(eQ.div, eB(eW({}, t), {
                    ref: i
                }))
            }).displayName = "DismissableLayerBranch";
            var tE = 0;

            function tS() {
                var t = document.createElement("span");
                return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
            }

            function tC(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function tj() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = tC(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : tC(n[t], null)
                        }
                    }
                }
            }
            var tP = Symbol("radix.slottable");

            function tI(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === tP
            }
            var tA = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, o, i, a, l, s = (o = r = "Primitive.".concat(n), (i = v.forwardRef(function(t, n) {
                        var r = t.children,
                            o = eV(t, ["children"]);
                        if (v.isValidElement(r)) {
                            var i, a, l, s = (l = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                u = function(t, n) {
                                    var r = eW({}, n);
                                    for (var o in n) ! function(o) {
                                        var i = t[o],
                                            a = n[o];
                                        /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            a.apply(void 0, eH(n)), i.apply(void 0, eH(n))
                                        } : i && (r[o] = i) : "style" === o ? r[o] = eW({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                    }(o);
                                    return eW({}, t, r)
                                }(o, r.props);
                            return r.type !== v.Fragment && (u.ref = n ? tj(n, s) : s), v.cloneElement(r, u)
                        }
                        return v.Children.count(r) > 1 ? v.Children.only(null) : null
                    })).displayName = "".concat(o, ".SlotClone"), a = i, (l = v.forwardRef(function(t, n) {
                        var r = t.children,
                            o = eV(t, ["children"]),
                            i = v.Children.toArray(r),
                            l = i.find(tI);
                        if (l) {
                            var s = l.props.children,
                                u = i.map(function(t) {
                                    return t === l ? v.Children.count(s) > 1 ? v.Children.only(null) : v.isValidElement(s) ? s.props.children : null : t
                                });
                            return (0, c.jsx)(a, eB(eW({}, o), {
                                ref: n,
                                children: v.isValidElement(s) ? v.cloneElement(s, void 0, u) : null
                            }))
                        }
                        return (0, c.jsx)(a, eB(eW({}, o), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    u = v.forwardRef(function(t, r) {
                        var o = t.asChild,
                            i = eV(t, ["asChild"]),
                            a = o ? s : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, c.jsx)(a, eB(eW({}, i), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(n), eB(eW({}, t), eU({}, n, u))
            }, {});

            function tR(t) {
                var n = v.useRef(t);
                return v.useEffect(function() {
                    n.current = t
                }), v.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(eH(o)))
                    }
                }, [])
            }
            var tN = "focusScope.autoFocusOnMount",
                tk = "focusScope.autoFocusOnUnmount",
                tT = {
                    bubbles: !1,
                    cancelable: !0
                },
                t_ = v.forwardRef(function(t, n) {
                    var r = t.loop,
                        o = void 0 !== r && r,
                        i = t.trapped,
                        a = void 0 !== i && i,
                        l = t.onMountAutoFocus,
                        s = t.onUnmountAutoFocus,
                        u = eV(t, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        f = eG(v.useState(null), 2),
                        d = f[0],
                        p = f[1],
                        h = tR(l),
                        m = tR(s),
                        y = v.useRef(null),
                        b = function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return v.useCallback(tj.apply(void 0, eH(n)), n)
                        }(n, function(t) {
                            return p(t)
                        }),
                        g = v.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    v.useEffect(function() {
                        if (a) {
                            var t = function(t) {
                                    if (!g.paused && d) {
                                        var n = t.target;
                                        d.contains(n) ? y.current = n : tM(y.current, {
                                            select: !0
                                        })
                                    }
                                },
                                n = function(t) {
                                    if (!g.paused && d) {
                                        var n = t.relatedTarget;
                                        null !== n && (d.contains(n) || tM(y.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", t), document.addEventListener("focusout", n);
                            var r = new MutationObserver(function(t) {
                                var n = !0,
                                    r = !1,
                                    o = void 0;
                                if (document.activeElement === document.body) try {
                                    for (var i, a = t[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) i.value.removedNodes.length > 0 && tM(d)
                                } catch (t) {
                                    r = !0, o = t
                                } finally {
                                    try {
                                        n || null == a.return || a.return()
                                    } finally {
                                        if (r) throw o
                                    }
                                }
                            });
                            return d && r.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", t), document.removeEventListener("focusout", n), r.disconnect()
                                }
                        }
                    }, [a, d, g.paused]), v.useEffect(function() {
                        if (d) {
                            tF.add(g);
                            var t = document.activeElement;
                            if (!d.contains(t)) {
                                var n = new CustomEvent(tN, tT);
                                d.addEventListener(tN, h), d.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = n.select,
                                        o = void 0 !== r && r,
                                        i = document.activeElement,
                                        a = !0,
                                        l = !1,
                                        s = void 0;
                                    try {
                                        for (var u, c = t[Symbol.iterator](); !(a = (u = c.next()).done); a = !0) {
                                            var f = u.value;
                                            if (tM(f, {
                                                    select: o
                                                }), document.activeElement !== i) return
                                        }
                                    } catch (t) {
                                        l = !0, s = t
                                    } finally {
                                        try {
                                            a || null == c.return || c.return()
                                        } finally {
                                            if (l) throw s
                                        }
                                    }
                                }(tD(d).filter(function(t) {
                                    return "A" !== t.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === t && tM(d))
                            }
                            return function() {
                                d.removeEventListener(tN, h), setTimeout(function() {
                                    var n = new CustomEvent(tk, tT);
                                    d.addEventListener(tk, m), d.dispatchEvent(n), n.defaultPrevented || tM(null != t ? t : document.body, {
                                        select: !0
                                    }), d.removeEventListener(tk, m), tF.remove(g)
                                }, 0)
                            }
                        }
                    }, [d, h, m, g]);
                    var w = v.useCallback(function(t) {
                        if ((o || a) && !g.paused) {
                            var n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                                r = document.activeElement;
                            if (n && r) {
                                var i, l = t.currentTarget,
                                    s = eG([tL(i = tD(l), l), tL(i.reverse(), l)], 2),
                                    u = s[0],
                                    c = s[1];
                                u && c ? t.shiftKey || r !== c ? t.shiftKey && r === u && (t.preventDefault(), o && tM(c, {
                                    select: !0
                                })) : (t.preventDefault(), o && tM(u, {
                                    select: !0
                                })) : r === l && t.preventDefault()
                            }
                        }
                    }, [o, a, g.paused]);
                    return (0, c.jsx)(tA.div, eB(eW({
                        tabIndex: -1
                    }, u), {
                        ref: b,
                        onKeyDown: w
                    }))
                });

            function tD(t) {
                for (var n = [], r = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(t) {
                            var n = "INPUT" === t.tagName && "hidden" === t.type;
                            return t.disabled || t.hidden || n ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) n.push(r.currentNode);
                return n
            }

            function tL(t, n) {
                var r = !0,
                    o = !1,
                    i = void 0;
                try {
                    for (var a, l = t[Symbol.iterator](); !(r = (a = l.next()).done); r = !0) {
                        var s = a.value;
                        if (! function(t, n) {
                                var r = n.upTo;
                                if ("hidden" === getComputedStyle(t).visibility) return !0;
                                for (; t && (void 0 === r || t !== r);) {
                                    if ("none" === getComputedStyle(t).display) return !0;
                                    t = t.parentElement
                                }
                                return !1
                            }(s, {
                                upTo: n
                            })) return s
                    }
                } catch (t) {
                    o = !0, i = t
                } finally {
                    try {
                        r || null == l.return || l.return()
                    } finally {
                        if (o) throw i
                    }
                }
            }

            function tM(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = n.select;
                if (t && t.focus) {
                    var o, i = document.activeElement;
                    t.focus({
                        preventScroll: !0
                    }), t !== i && ez(o = t, HTMLInputElement) && "select" in o && void 0 !== r && r && t.select()
                }
            }
            t_.displayName = "FocusScope";
            var tF = (nc = [], {
                add: function(t) {
                    var n = nc[0];
                    t !== n && (null == n || n.pause()), (nc = tU(nc, t)).unshift(t)
                },
                remove: function(t) {
                    var n;
                    null == (n = (nc = tU(nc, t))[0]) || n.resume()
                }
            });

            function tU(t, n) {
                var r = eH(t),
                    o = r.indexOf(n);
                return -1 !== o && r.splice(o, 1), r
            }

            function tz(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var tW = Symbol("radix.slottable");

            function tB(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === tW
            }
            var tV = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, i, a, l, s = (o = r = "Primitive.".concat(n), (i = v.forwardRef(function(t, n) {
                            var r = t.children,
                                o = eV(t, ["children"]);
                            if (v.isValidElement(r)) {
                                var i, a, l, s = (l = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    u = function(t, n) {
                                        var r = eW({}, n);
                                        for (var o in n) ! function(o) {
                                            var i = t[o],
                                                a = n[o];
                                            /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                a.apply(void 0, eH(n)), i.apply(void 0, eH(n))
                                            } : i && (r[o] = i) : "style" === o ? r[o] = eW({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                        }(o);
                                        return eW({}, t, r)
                                    }(o, r.props);
                                return r.type !== v.Fragment && (u.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = tz(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : tz(n[t], null)
                                            }
                                        }
                                    }
                                }(n, s) : s), v.cloneElement(r, u)
                            }
                            return v.Children.count(r) > 1 ? v.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), a = i, (l = v.forwardRef(function(t, n) {
                            var r = t.children,
                                o = eV(t, ["children"]),
                                i = v.Children.toArray(r),
                                l = i.find(tB);
                            if (l) {
                                var s = l.props.children,
                                    u = i.map(function(t) {
                                        return t === l ? v.Children.count(s) > 1 ? v.Children.only(null) : v.isValidElement(s) ? s.props.children : null : t
                                    });
                                return (0, c.jsx)(a, eB(eW({}, o), {
                                    ref: n,
                                    children: v.isValidElement(s) ? v.cloneElement(s, void 0, u) : null
                                }))
                            }
                            return (0, c.jsx)(a, eB(eW({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        u = v.forwardRef(function(t, r) {
                            var o = t.asChild,
                                i = eV(t, ["asChild"]),
                                a = o ? s : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, c.jsx)(a, eB(eW({}, i), {
                                ref: r
                            }))
                        });
                    return u.displayName = "Primitive.".concat(n), eB(eW({}, t), eU({}, n, u))
                }, {}),
                tG = (null == (tm = globalThis) ? void 0 : tm.document) ? v.useLayoutEffect : function() {},
                tH = v.forwardRef(function(t, n) {
                    var r, o, i = t.container,
                        a = eV(t, ["container"]),
                        l = eG(v.useState(!1), 2),
                        s = l[0],
                        u = l[1];
                    tG(function() {
                        return u(!0)
                    }, []);
                    var f = i || s && (null == (o = globalThis) || null == (r = o.document) ? void 0 : r.body);
                    return f ? eM().createPortal((0, c.jsx)(tV.div, eB(eW({}, a), {
                        ref: n
                    })), f) : null
                });
            tH.displayName = "Portal";
            var tJ = new WeakMap,
                tX = new WeakMap,
                t$ = {},
                tq = 0,
                tK = function(t) {
                    return t && (t.host || tK(t.parentNode))
                },
                tY = function(t, n, r, o) {
                    var i = (Array.isArray(t) ? t : [t]).map(function(t) {
                        if (n.contains(t)) return t;
                        var r = tK(t);
                        return r && n.contains(r) ? r : (console.error("aria-hidden", t, "in not contained inside", n, ". Doing nothing"), null)
                    }).filter(function(t) {
                        return !!t
                    });
                    t$[r] || (t$[r] = new WeakMap);
                    var a = t$[r],
                        l = [],
                        s = new Set,
                        u = new Set(i),
                        c = function(t) {
                            t && !s.has(t) && (s.add(t), c(t.parentNode))
                        };
                    i.forEach(c);
                    var f = function(t) {
                        t && !u.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                            if (s.has(t)) f(t);
                            else try {
                                var n = t.getAttribute(o),
                                    i = null !== n && "false" !== n,
                                    u = (tJ.get(t) || 0) + 1,
                                    c = (a.get(t) || 0) + 1;
                                tJ.set(t, u), a.set(t, c), l.push(t), 1 === u && i && tX.set(t, !0), 1 === c && t.setAttribute(r, "true"), i || t.setAttribute(o, "true")
                            } catch (n) {
                                console.error("aria-hidden: cannot operate on ", t, n)
                            }
                        })
                    };
                    return f(n), s.clear(), tq++,
                        function() {
                            l.forEach(function(t) {
                                var n = tJ.get(t) - 1,
                                    i = a.get(t) - 1;
                                tJ.set(t, n), a.set(t, i), n || (tX.has(t) || t.removeAttribute(o), tX.delete(t)), i || t.removeAttribute(r)
                            }), --tq || (tJ = new WeakMap, tJ = new WeakMap, tX = new WeakMap, t$ = {})
                        }
                },
                tZ = function(t, n, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var o = Array.from(Array.isArray(t) ? t : [t]),
                        i = n || ("undefined" == typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
                    return i ? (o.push.apply(o, Array.from(i.querySelectorAll("[aria-live]"))), tY(o, i, r, "aria-hidden")) : function() {
                        return null
                    }
                },
                tQ = "right-scroll-bar-position",
                t0 = "width-before-scroll-bar";

            function t1(t, n) {
                return "function" == typeof t ? t(n) : t && (t.current = n), t
            }
            var t2 = "undefined" != typeof window ? v.useLayoutEffect : v.useEffect,
                t3 = new WeakMap,
                t4 = function(t) {
                    var n = t.sideCar,
                        r = K(t, ["sideCar"]);
                    if (!n) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                    var o = n.read();
                    if (!o) throw Error("Sidecar medium not found");
                    return v.createElement(o, q({}, r))
                };
            t4.isSideCarExport = !0;
            var t5 = (void 0 === nf && (nf = {}), (void 0 === nd && (nd = function(t) {
                    return t
                }), np = [], nh = !1, nv = {
                    read: function() {
                        if (nh) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return np.length ? np[np.length - 1] : null
                    },
                    useMedium: function(t) {
                        var n = nd(t, nh);
                        return np.push(n),
                            function() {
                                np = np.filter(function(t) {
                                    return t !== n
                                })
                            }
                    },
                    assignSyncMedium: function(t) {
                        for (nh = !0; np.length;) {
                            var n = np;
                            np = [], n.forEach(t)
                        }
                        np = {
                            push: function(n) {
                                return t(n)
                            },
                            filter: function() {
                                return np
                            }
                        }
                    },
                    assignMedium: function(t) {
                        nh = !0;
                        var n = [];
                        if (np.length) {
                            var r = np;
                            np = [], r.forEach(t), n = np
                        }
                        var o = function() {
                                var r = n;
                                n = [], r.forEach(t)
                            },
                            i = function() {
                                return Promise.resolve().then(o)
                            };
                        i(), np = {
                            push: function(t) {
                                n.push(t), i()
                            },
                            filter: function(t) {
                                return n = n.filter(t), np
                            }
                        }
                    }
                }).options = q({
                    async: !0,
                    ssr: !1
                }, nf), nv),
                t8 = function() {},
                t6 = v.forwardRef(function(t, n) {
                    var r, o, i, a, l = v.useRef(null),
                        s = v.useState({
                            onScrollCapture: t8,
                            onWheelCapture: t8,
                            onTouchMoveCapture: t8
                        }),
                        u = s[0],
                        c = s[1],
                        f = t.forwardProps,
                        d = t.children,
                        p = t.className,
                        h = t.removeScrollBar,
                        m = t.enabled,
                        y = t.shards,
                        b = t.sideCar,
                        g = t.noIsolation,
                        w = t.inert,
                        x = t.allowPinchZoom,
                        O = t.as,
                        E = t.gapMode,
                        S = K(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        C = (r = [l, n], o = function(t) {
                            return r.forEach(function(n) {
                                return t1(n, t)
                            })
                        }, (i = (0, v.useState)(function() {
                            return {
                                value: null,
                                callback: o,
                                facade: {
                                    get current() {
                                        return i.value
                                    },
                                    set current(e) {
                                        var t = i.value;
                                        t !== e && (i.value = e, i.callback(e, t))
                                    }
                                }
                            }
                        })[0]).callback = o, a = i.facade, t2(function() {
                            var t = t3.get(a);
                            if (t) {
                                var n = new Set(t),
                                    o = new Set(r),
                                    i = a.current;
                                n.forEach(function(t) {
                                    o.has(t) || t1(t, null)
                                }), o.forEach(function(t) {
                                    n.has(t) || t1(t, i)
                                })
                            }
                            t3.set(a, r)
                        }, [r]), a),
                        j = q(q({}, S), u);
                    return v.createElement(v.Fragment, null, m && v.createElement(b, {
                        sideCar: t5,
                        removeScrollBar: h,
                        shards: y,
                        noIsolation: g,
                        inert: w,
                        setCallbacks: c,
                        allowPinchZoom: !!x,
                        lockRef: l,
                        gapMode: E
                    }), f ? v.cloneElement(v.Children.only(d), q(q({}, j), {
                        ref: C
                    })) : v.createElement(void 0 === O ? "div" : O, q({}, j, {
                        className: p,
                        ref: C
                    }), d))
                });
            t6.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, t6.classNames = {
                fullWidth: t0,
                zeroRight: tQ
            };
            var t7 = function() {
                    var t = 0,
                        n = null;
                    return {
                        add: function(o) {
                            var i, a;
                            0 == t && (n = function() {
                                if (!document) return null;
                                var t = document.createElement("style");
                                t.type = "text/css";
                                var n = r.nc;
                                return n && t.setAttribute("nonce", n), t
                            }()) && ((i = n).styleSheet ? i.styleSheet.cssText = o : i.appendChild(document.createTextNode(o)), a = n, (document.head || document.getElementsByTagName("head")[0]).appendChild(a)), t++
                        },
                        remove: function() {
                            --t || !n || (n.parentNode && n.parentNode.removeChild(n), n = null)
                        }
                    }
                },
                t9 = function() {
                    var t, n = (t = t7(), function(n, r) {
                        v.useEffect(function() {
                            return t.add(n),
                                function() {
                                    t.remove()
                                }
                        }, [n && r])
                    });
                    return function(t) {
                        return n(t.styles, t.dynamic), null
                    }
                },
                ne = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                nt = function(t) {
                    return parseInt(t || "", 10) || 0
                },
                nn = function(t) {
                    if (void 0 === t && (t = "margin"), "undefined" == typeof window) return ne;
                    var n, r, o, i, a, l = (n = t, o = (r = window.getComputedStyle(document.body))["padding" === n ? "paddingLeft" : "marginLeft"], i = r["padding" === n ? "paddingTop" : "marginTop"], a = r["padding" === n ? "paddingRight" : "marginRight"], [nt(o), nt(i), nt(a)]),
                        s = document.documentElement.clientWidth,
                        u = window.innerWidth;
                    return {
                        left: l[0],
                        top: l[1],
                        right: l[2],
                        gap: Math.max(0, u - s + l[2] - l[0])
                    }
                },
                nr = t9(),
                no = "data-scroll-locked",
                ni = function(t, n, r, o) {
                    var i = t.left,
                        a = t.top,
                        l = t.right,
                        s = t.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(o, ";\n   padding-right: ").concat(s, "px ").concat(o, ";\n  }\n  body[").concat(no, "] {\n    overflow: hidden ").concat(o, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(o, ";"), "margin" === r && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(l, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(s, "px ").concat(o, ";\n    "), "padding" === r && "padding-right: ".concat(s, "px ").concat(o, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(tQ, " {\n    right: ").concat(s, "px ").concat(o, ";\n  }\n  \n  .").concat(t0, " {\n    margin-right: ").concat(s, "px ").concat(o, ";\n  }\n  \n  .").concat(tQ, " .").concat(tQ, " {\n    right: 0 ").concat(o, ";\n  }\n  \n  .").concat(t0, " .").concat(t0, " {\n    margin-right: 0 ").concat(o, ";\n  }\n  \n  body[").concat(no, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(s, "px;\n  }\n")
                },
                na = function() {
                    var t = parseInt(document.body.getAttribute(no) || "0", 10);
                    return isFinite(t) ? t : 0
                },
                nl = function(t) {
                    var n = t.noRelative,
                        r = t.noImportant,
                        o = t.gapMode,
                        i = void 0 === o ? "margin" : o;
                    v.useEffect(function() {
                        return document.body.setAttribute(no, (na() + 1).toString()),
                            function() {
                                var t = na() - 1;
                                t <= 0 ? document.body.removeAttribute(no) : document.body.setAttribute(no, t.toString())
                            }
                    }, []);
                    var a = v.useMemo(function() {
                        return nn(i)
                    }, [i]);
                    return v.createElement(nr, {
                        styles: ni(a, !n, i, r ? "" : "!important")
                    })
                },
                ns = !1;
            if ("undefined" != typeof window) try {
                var nu = Object.defineProperty({}, "passive", {
                    get: function() {
                        return ns = !0, !0
                    }
                });
                window.addEventListener("test", nu, nu), window.removeEventListener("test", nu, nu)
            } catch (t) {
                ns = !1
            }
            var nc, nf, nd, np, nh, nv, nm, ny = !!ns && {
                    passive: !1
                },
                nb = function(t, n) {
                    if (!ez(t, Element)) return !1;
                    var r = window.getComputedStyle(t);
                    return "hidden" !== r[n] && (r.overflowY !== r.overflowX || "TEXTAREA" === t.tagName || "visible" !== r[n])
                },
                ng = function(t, n) {
                    var r = n.ownerDocument,
                        o = n;
                    do {
                        if ("undefined" != typeof ShadowRoot && ez(o, ShadowRoot) && (o = o.host), nw(t, o)) {
                            var i = nx(t, o);
                            if (i[1] > i[2]) return !0
                        }
                        o = o.parentNode
                    } while (o && o !== r.body);
                    return !1
                },
                nw = function(t, n) {
                    return "v" === t ? nb(n, "overflowY") : nb(n, "overflowX")
                },
                nx = function(t, n) {
                    return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
                },
                nO = function(t, n, r, o, i) {
                    var a, l = (a = window.getComputedStyle(n).direction, "h" === t && "rtl" === a ? -1 : 1),
                        s = l * o,
                        u = r.target,
                        c = n.contains(u),
                        f = !1,
                        d = s > 0,
                        p = 0,
                        h = 0;
                    do {
                        var v = nx(t, u),
                            m = v[0],
                            y = v[1] - v[2] - l * m;
                        (m || y) && nw(t, u) && (p += y, h += m), u = ez(u, ShadowRoot) ? u.host : u.parentNode
                    } while (!c && u !== document.body || c && (n.contains(u) || n === u));
                    return (d && (i && 1 > Math.abs(p) || !i && s > p) || !d && (i && 1 > Math.abs(h) || !i && -s > h)) && (f = !0), f
                },
                nE = function(t) {
                    return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
                },
                nS = function(t) {
                    return [t.deltaX, t.deltaY]
                },
                nC = function(t) {
                    return t && "current" in t ? t.current : t
                },
                nj = 0,
                nP = [],
                nI = (nm = function(t) {
                    var n = v.useRef([]),
                        r = v.useRef([0, 0]),
                        o = v.useRef(),
                        i = v.useState(nj++)[0],
                        a = v.useState(t9)[0],
                        l = v.useRef(t);
                    v.useEffect(function() {
                        l.current = t
                    }, [t]), v.useEffect(function() {
                        if (t.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var n = (function(t, n, r) {
                                if (r || 2 == arguments.length)
                                    for (var o, i = 0, a = n.length; i < a; i++) !o && i in n || (o || (o = Array.prototype.slice.call(n, 0, i)), o[i] = n[i]);
                                return t.concat(o || Array.prototype.slice.call(n))
                            })([t.lockRef.current], (t.shards || []).map(nC), !0).filter(Boolean);
                            return n.forEach(function(t) {
                                    return t.classList.add("allow-interactivity-".concat(i))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(i)), n.forEach(function(t) {
                                        return t.classList.remove("allow-interactivity-".concat(i))
                                    })
                                }
                        }
                    }, [t.inert, t.lockRef.current, t.shards]);
                    var s = v.useCallback(function(t, n) {
                            if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !l.current.allowPinchZoom;
                            var i, a = nE(t),
                                s = r.current,
                                u = "deltaX" in t ? t.deltaX : s[0] - a[0],
                                c = "deltaY" in t ? t.deltaY : s[1] - a[1],
                                f = t.target,
                                d = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in t && "h" === d && "range" === f.type) return !1;
                            var p = ng(d, f);
                            if (!p) return !0;
                            if (p ? i = d : (i = "v" === d ? "h" : "v", p = ng(d, f)), !p) return !1;
                            if (!o.current && "changedTouches" in t && (u || c) && (o.current = i), !i) return !0;
                            var h = o.current || i;
                            return nO(h, n, t, "h" === h ? u : c, !0)
                        }, []),
                        u = v.useCallback(function(t) {
                            if (nP.length && nP[nP.length - 1] === a) {
                                var r = "deltaY" in t ? nS(t) : nE(t),
                                    o = n.current.filter(function(n) {
                                        var o;
                                        return n.name === t.type && (n.target === t.target || t.target === n.shadowParent) && (o = n.delta, o[0] === r[0] && o[1] === r[1])
                                    })[0];
                                if (o && o.should) t.cancelable && t.preventDefault();
                                else if (!o) {
                                    var i = (l.current.shards || []).map(nC).filter(Boolean).filter(function(n) {
                                        return n.contains(t.target)
                                    });
                                    (i.length > 0 ? s(t, i[0]) : !l.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }, []),
                        c = v.useCallback(function(t, r, o, i) {
                            var a = {
                                name: t,
                                delta: r,
                                target: o,
                                should: i,
                                shadowParent: function(t) {
                                    for (var n = null; null !== t;) ez(t, ShadowRoot) && (n = t.host, t = t.host), t = t.parentNode;
                                    return n
                                }(o)
                            };
                            n.current.push(a), setTimeout(function() {
                                n.current = n.current.filter(function(t) {
                                    return t !== a
                                })
                            }, 1)
                        }, []),
                        f = v.useCallback(function(t) {
                            r.current = nE(t), o.current = void 0
                        }, []),
                        d = v.useCallback(function(n) {
                            c(n.type, nS(n), n.target, s(n, t.lockRef.current))
                        }, []),
                        p = v.useCallback(function(n) {
                            c(n.type, nE(n), n.target, s(n, t.lockRef.current))
                        }, []);
                    v.useEffect(function() {
                        return nP.push(a), t.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", u, ny), document.addEventListener("touchmove", u, ny), document.addEventListener("touchstart", f, ny),
                            function() {
                                nP = nP.filter(function(t) {
                                    return t !== a
                                }), document.removeEventListener("wheel", u, ny), document.removeEventListener("touchmove", u, ny), document.removeEventListener("touchstart", f, ny)
                            }
                    }, []);
                    var h = t.removeScrollBar,
                        m = t.inert;
                    return v.createElement(v.Fragment, null, m ? v.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, h ? v.createElement(nl, {
                        gapMode: t.gapMode
                    }) : null)
                }, t5.useMedium(nm), t4),
                nA = v.forwardRef(function(t, n) {
                    return v.createElement(t6, q({}, t, {
                        ref: n,
                        sideCar: nI
                    }))
                });

            function nR(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            nA.classNames = t6.classNames;
            var nN = (null == (i = globalThis) ? void 0 : i.document) ? v.useLayoutEffect : function() {},
                nk = v[" useId ".trim().toString()] || function() {},
                nT = 0;

            function n_(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function nD(t, n, r, o, i, a, l) {
                try {
                    var s = t[a](l),
                        u = s.value
                } catch (t) {
                    r(t);
                    return
                }
                s.done ? n(u) : Promise.resolve(u).then(o, i)
            }

            function nL(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, i) {
                        var a = t.apply(n, r);

                        function l(t) {
                            nD(a, o, i, l, s, "next", t)
                        }

                        function s(t) {
                            nD(a, o, i, l, s, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function nM(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function nF(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function nU(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        nM(t, n, r[n])
                    })
                }
                return t
            }

            function nz(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function nW(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function nB(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            l = !0,
                            s = !1;
                        try {
                            for (i = i.call(t); !(l = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); l = !0);
                        } catch (t) {
                            s = !0, o = t
                        } finally {
                            try {
                                l || null == i.return || i.return()
                            } finally {
                                if (s) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || nH(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nV(t) {
                return function(t) {
                    if (Array.isArray(t)) return n_(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || nH(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nG(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function nH(t, n) {
                if (t) {
                    if ("string" == typeof t) return n_(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n_(t, n)
                }
            }

            function nJ(t, n) {
                var r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = s(0), l.throw = s(1), l.return = s(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function s(s) {
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, o && (i = 2 & c[0] ? o.return : c[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, c[1])).done) return i;
                            switch (o = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, o = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = n.call(t, a)
                        } catch (t) {
                            c = [6, t], o = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var nX = ["top", "right", "bottom", "left"],
                n$ = Math.min,
                nq = Math.max,
                nK = Math.round,
                nY = Math.floor,
                nZ = function(t) {
                    return {
                        x: t,
                        y: t
                    }
                },
                nQ = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                };

            function n0(t, n) {
                return "function" == typeof t ? t(n) : t
            }

            function n1(t) {
                return t.split("-")[0]
            }

            function n2(t) {
                return t.split("-")[1]
            }

            function n3(t) {
                return "x" === t ? "y" : "x"
            }

            function n4(t) {
                return "y" === t ? "height" : "width"
            }

            function n5(t) {
                var n = t[0];
                return "t" === n || "b" === n ? "y" : "x"
            }

            function n8(t) {
                return t.includes("start") ? t.replace("start", "end") : t.replace("end", "start")
            }
            var n6 = ["left", "right"],
                n7 = ["right", "left"],
                n9 = ["top", "bottom"],
                re = ["bottom", "top"];

            function rt(t) {
                var n = n1(t);
                return nQ[n] + t.slice(n.length)
            }

            function rn(t) {
                var n, r, o, i;
                return "number" != typeof t ? {
                    top: null != (n = t.top) ? n : 0,
                    right: null != (r = t.right) ? r : 0,
                    bottom: null != (o = t.bottom) ? o : 0,
                    left: null != (i = t.left) ? i : 0
                } : {
                    top: t,
                    right: t,
                    bottom: t,
                    left: t
                }
            }

            function rr(t) {
                var n = t.x,
                    r = t.y,
                    o = t.width,
                    i = t.height;
                return {
                    width: o,
                    height: i,
                    top: r,
                    left: n,
                    right: n + o,
                    bottom: r + i,
                    x: n,
                    y: r
                }
            }

            function ro(t, n, r) {
                var o, i = t.reference,
                    a = t.floating,
                    l = n5(n),
                    s = n3(n5(n)),
                    u = n4(s),
                    c = n1(n),
                    f = "y" === l,
                    d = i.x + i.width / 2 - a.width / 2,
                    p = i.y + i.height / 2 - a.height / 2,
                    h = i[u] / 2 - a[u] / 2;
                switch (c) {
                    case "top":
                        o = {
                            x: d,
                            y: i.y - a.height
                        };
                        break;
                    case "bottom":
                        o = {
                            x: d,
                            y: i.y + i.height
                        };
                        break;
                    case "right":
                        o = {
                            x: i.x + i.width,
                            y: p
                        };
                        break;
                    case "left":
                        o = {
                            x: i.x - a.width,
                            y: p
                        };
                        break;
                    default:
                        o = {
                            x: i.x,
                            y: i.y
                        }
                }
                switch (n2(n)) {
                    case "start":
                        o[s] -= h * (r && f ? -1 : 1);
                        break;
                    case "end":
                        o[s] += h * (r && f ? -1 : 1)
                }
                return o
            }

            function ri(t, n) {
                return nL(function() {
                    var r, o, i, a, l, s, u, c, f, d, p, h, v, m, y, b, g, w, x, O, E, S, C, j, P, I, A, R, N, k, T;
                    return nJ(this, function(_) {
                        switch (_.label) {
                            case 0:
                                return void 0 === n && (n = {}), o = t.x, i = t.y, a = t.platform, l = t.rects, s = t.elements, u = t.strategy, d = void 0 === (f = (c = n0(n, t)).boundary) ? "clippingAncestors" : f, h = void 0 === (p = c.rootBoundary) ? "viewport" : p, m = void 0 === (v = c.elementContext) ? "floating" : v, b = void 0 !== (y = c.altBoundary) && y, w = rn(void 0 === (g = c.padding) ? 0 : g), x = s[b ? "floating" === m ? "reference" : "floating" : m], P = a.getClippingRect, I = {}, R = null, [4, null == a.isElement ? void 0 : a.isElement(x)];
                            case 1:
                                if (!(R == (r = _.sent()) || r)) return [3, 2];
                                return A = x, [3, 5];
                            case 2:
                                if (N = x.contextElement) return [3, 4];
                                return [4, null == a.getDocumentElement ? void 0 : a.getDocumentElement(s.floating)];
                            case 3:
                                N = _.sent(), _.label = 4;
                            case 4:
                                A = N, _.label = 5;
                            case 5:
                                return [4, P.apply(a, [(I.element = A, I.boundary = d, I.rootBoundary = h, I.strategy = u, I)])];
                            case 6:
                                return O = rr.apply(void 0, [_.sent()]), E = "floating" === m ? {
                                    x: o,
                                    y: i,
                                    width: l.floating.width,
                                    height: l.floating.height
                                } : l.reference, [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(s.floating)];
                            case 7:
                                return S = _.sent(), [4, null == a.isElement ? void 0 : a.isElement(S)];
                            case 8:
                                if (!(k = _.sent())) return [3, 10];
                                return [4, null == a.getScale ? void 0 : a.getScale(S)];
                            case 9:
                                k = _.sent(), _.label = 10;
                            case 10:
                                if (C = k || {
                                        x: 1,
                                        y: 1
                                    }, !a.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 12];
                                return [4, a.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: s,
                                    rect: E,
                                    offsetParent: S,
                                    strategy: u
                                })];
                            case 11:
                                return T = _.sent(), [3, 13];
                            case 12:
                                T = E, _.label = 13;
                            case 13:
                                return j = rr.apply(void 0, [T]), [2, {
                                    top: (O.top - j.top + w.top) / C.y,
                                    bottom: (j.bottom - O.bottom + w.bottom) / C.y,
                                    left: (O.left - j.left + w.left) / C.x,
                                    right: (j.right - O.right + w.right) / C.x
                                }]
                        }
                    })
                })()
            }

            function ra(t, n) {
                return {
                    top: t.top - n.height,
                    right: t.right - n.width,
                    bottom: t.bottom - n.height,
                    left: t.left - n.width
                }
            }

            function rl(t) {
                return nX.some(function(n) {
                    return t[n] >= 0
                })
            }
            var rs = new Set(["left", "top"]);

            function ru() {
                return "undefined" != typeof window
            }

            function rc(t) {
                return rp(t) ? (t.nodeName || "").toLowerCase() : "#document"
            }

            function rf(t) {
                var n;
                return (null == t || null == (n = t.ownerDocument) ? void 0 : n.defaultView) || window
            }

            function rd(t) {
                var n;
                return null == (n = (rp(t) ? t.ownerDocument : t.document) || window.document) ? void 0 : n.documentElement
            }

            function rp(t) {
                return !!ru() && (nF(t, Node) || nF(t, rf(t).Node))
            }

            function rh(t) {
                return !!ru() && (nF(t, Element) || nF(t, rf(t).Element))
            }

            function rv(t) {
                return !!ru() && (nF(t, HTMLElement) || nF(t, rf(t).HTMLElement))
            }

            function rm(t) {
                return !(!ru() || "undefined" == typeof ShadowRoot) && (nF(t, ShadowRoot) || nF(t, rf(t).ShadowRoot))
            }

            function ry(t) {
                var n = rC(t),
                    r = n.overflow,
                    o = n.overflowX,
                    i = n.overflowY,
                    a = n.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + i + o) && "inline" !== a && "contents" !== a
            }

            function rb(t) {
                try {
                    if (t.matches(":popover-open")) return !0
                } catch (t) {}
                try {
                    return t.matches(":modal")
                } catch (t) {
                    return !1
                }
            }
            var rg = /transform|translate|scale|rotate|perspective|filter/,
                rw = /paint|layout|strict|content/,
                rx = function(t) {
                    return !!t && "none" !== t
                };

            function rO(t) {
                var n = rh(t) ? rC(t) : t;
                return rx(n.transform) || rx(n.translate) || rx(n.scale) || rx(n.rotate) || rx(n.perspective) || !rE() && (rx(n.backdropFilter) || rx(n.filter)) || rg.test(n.willChange || "") || rw.test(n.contain || "")
            }

            function rE() {
                return null == a && (a = "undefined" != typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), a
            }

            function rS(t) {
                return /^(html|body|#document)$/.test(rc(t))
            }

            function rC(t) {
                return rf(t).getComputedStyle(t)
            }

            function rj(t) {
                return rh(t) ? {
                    scrollLeft: t.scrollLeft,
                    scrollTop: t.scrollTop
                } : {
                    scrollLeft: t.scrollX,
                    scrollTop: t.scrollY
                }
            }

            function rP(t) {
                if ("html" === rc(t)) return t;
                var n = t.assignedSlot || t.parentNode || rm(t) && t.host || rd(t);
                return rm(n) ? n.host : n
            }

            function rI(t, n, r) {
                void 0 === n && (n = []), void 0 === r && (r = !0);
                var o, i = function t(n) {
                        var r = rP(n);
                        return rS(r) ? (n.ownerDocument || n).body : rv(r) && ry(r) ? r : t(r)
                    }(t),
                    a = i === (null == (o = t.ownerDocument) ? void 0 : o.body),
                    l = rf(i);
                if (a) {
                    var s = rA(l);
                    return n.concat(l, l.visualViewport || [], ry(i) ? i : [], s && r ? rI(s) : [])
                }
                return n.concat(i, rI(i, [], r))
            }

            function rA(t) {
                return t.parent && Object.getPrototypeOf(t.parent) ? t.frameElement : null
            }

            function rR(t) {
                var n = rC(t),
                    r = parseFloat(n.width) || 0,
                    o = parseFloat(n.height) || 0,
                    i = rv(t),
                    a = i ? t.offsetWidth : r,
                    l = i ? t.offsetHeight : o,
                    s = nK(r) !== a || nK(o) !== l;
                return s && (r = a, o = l), {
                    width: r,
                    height: o,
                    $: s
                }
            }

            function rN(t) {
                return rh(t) ? t : t.contextElement
            }

            function rk(t) {
                var n = rN(t);
                if (!rv(n)) return nZ(1);
                var r = n.getBoundingClientRect(),
                    o = rR(n),
                    i = o.width,
                    a = o.height,
                    l = o.$,
                    s = (l ? nK(r.width) : r.width) / i,
                    u = (l ? nK(r.height) : r.height) / a;
                return s && Number.isFinite(s) || (s = 1), u && Number.isFinite(u) || (u = 1), {
                    x: s,
                    y: u
                }
            }
            var rT = nZ(0);

            function r_(t) {
                var n = rf(t);
                return rE() && n.visualViewport ? {
                    x: n.visualViewport.offsetLeft,
                    y: n.visualViewport.offsetTop
                } : rT
            }

            function rD(t, n, r, o) {
                void 0 === n && (n = !1), void 0 === r && (r = !1);
                var i, a = t.getBoundingClientRect(),
                    l = rN(t),
                    s = nZ(1);
                n && (o ? rh(o) && (s = rk(o)) : s = rk(t));
                var u = (void 0 === (i = r) && (i = !1), !(!o || i && o !== rf(l)) && i) ? r_(l) : nZ(0),
                    c = (a.left + u.x) / s.x,
                    f = (a.top + u.y) / s.y,
                    d = a.width / s.x,
                    p = a.height / s.y;
                if (l)
                    for (var h = rf(l), v = o && rh(o) ? rf(o) : o, m = h, y = rA(m); y && o && v !== m;) {
                        var b = rk(y),
                            g = y.getBoundingClientRect(),
                            w = rC(y),
                            x = g.left + (y.clientLeft + parseFloat(w.paddingLeft)) * b.x,
                            O = g.top + (y.clientTop + parseFloat(w.paddingTop)) * b.y;
                        c *= b.x, f *= b.y, d *= b.x, p *= b.y, c += x, f += O, y = rA(m = rf(y))
                    }
                return rr({
                    width: d,
                    height: p,
                    x: c,
                    y: f
                })
            }

            function rL(t, n) {
                var r = rj(t).scrollLeft;
                return n ? n.left + r : rD(rd(t)).left + r
            }

            function rM(t, n, r) {
                void 0 === r && (r = !1);
                var o = t.getBoundingClientRect();
                return {
                    x: o.left + n.scrollLeft - (r ? 0 : rL(t, o)),
                    y: o.top + n.scrollTop
                }
            }
            var rF = new Set(["absolute", "fixed"]);

            function rU(t, n, r) {
                if ("viewport" === n) o = function(t, n) {
                    var r = rf(t),
                        o = rd(t),
                        i = r.visualViewport,
                        a = o.clientWidth,
                        l = o.clientHeight,
                        s = 0,
                        u = 0;
                    if (i) {
                        a = i.width, l = i.height;
                        var c = rE();
                        (!c || c && "fixed" === n) && (s = i.offsetLeft, u = i.offsetTop)
                    }
                    return {
                        width: a,
                        height: l,
                        x: s,
                        y: u
                    }
                }(t, r);
                else if ("document" === n) i = rd(t), a = rd(i), l = rj(i), s = i.ownerDocument.body, u = nq(a.scrollWidth, a.clientWidth, s.scrollWidth, s.clientWidth), c = nq(a.scrollHeight, a.clientHeight, s.scrollHeight, s.clientHeight), f = -l.scrollLeft + rL(i), d = -l.scrollTop, "rtl" === rC(s).direction && (f += nq(a.clientWidth, s.clientWidth) - u), o = {
                    width: u,
                    height: c,
                    x: f,
                    y: d
                };
                else if (rh(n)) h = (p = rD(n, !0, "fixed" === r)).top + n.clientTop, v = p.left + n.clientLeft, m = rv(n) ? rk(n) : nZ(1), o = {
                    width: n.clientWidth * m.x,
                    height: n.clientHeight * m.y,
                    x: v * m.x,
                    y: h * m.y
                };
                else {
                    var o, i, a, l, s, u, c, f, d, p, h, v, m, y = r_(t);
                    o = {
                        x: n.x - y.x,
                        y: n.y - y.y,
                        width: n.width,
                        height: n.height
                    }
                }
                return rr(o)
            }

            function rz(t, n, r) {
                var o = rv(n),
                    i = rd(n),
                    a = "fixed" === r,
                    l = rD(t, !0, a, n),
                    s = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = nZ(0);
                if (o || !o && !a)
                    if (("body" !== rc(n) || ry(i)) && (s = rj(n)), o) {
                        var c = rD(n, !0, a, n);
                        u.x = c.x + n.clientLeft, u.y = c.y + n.clientTop
                    } else i && (u.x = rL(i));
                a && !o && i && (u.x = rL(i));
                var f = !i || o || a ? nZ(0) : rM(i, s);
                return {
                    x: l.left + s.scrollLeft - u.x - f.x,
                    y: l.top + s.scrollTop - u.y - f.y,
                    width: l.width,
                    height: l.height
                }
            }

            function rW(t) {
                return "static" === rC(t).position
            }

            function rB(t, n) {
                if (!rv(t) || "fixed" === rC(t).position) return null;
                if (n) return n(t);
                var r = t.offsetParent;
                return rd(t) === r && (r = r.ownerDocument.body), r
            }

            function rV(t, n) {
                var r, o = rf(t);
                if (rb(t)) return o;
                if (!rv(t)) {
                    for (var i = rP(t); i && !rS(i);) {
                        if (rh(i) && !rW(i)) return i;
                        i = rP(i)
                    }
                    return o
                }
                for (var a = rB(t, n); a && (r = a, /^(table|td|th)$/.test(rc(r))) && rW(a);) a = rB(a, n);
                return a && rS(a) && rW(a) && !rO(a) ? o : a || function(t) {
                    for (var n = rP(t); rv(n) && !rS(n);) {
                        if (rO(n)) return n;
                        if (rb(n)) break;
                        n = rP(n)
                    }
                    return null
                }(t) || o
            }
            var rG = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(t) {
                    var n = t.elements,
                        r = t.rect,
                        o = t.offsetParent,
                        i = "fixed" === t.strategy,
                        a = rd(o),
                        l = !!n && rb(n.floating);
                    if (o === a || l && i) return r;
                    var s = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        u = nZ(1),
                        c = nZ(0),
                        f = rv(o);
                    if ((f || !f && !i) && (("body" !== rc(o) || ry(a)) && (s = rj(o)), rv(o))) {
                        var d = rD(o);
                        u = rk(o), c.x = d.x + o.clientLeft, c.y = d.y + o.clientTop
                    }
                    var p = !a || f || i ? nZ(0) : rM(a, s, !0);
                    return {
                        width: r.width * u.x,
                        height: r.height * u.y,
                        x: r.x * u.x - s.scrollLeft * u.x + c.x + p.x,
                        y: r.y * u.y - s.scrollTop * u.y + c.y + p.y
                    }
                },
                getDocumentElement: rd,
                getClippingRect: function(t) {
                    var n = t.element,
                        r = t.boundary,
                        o = t.rootBoundary,
                        i = t.strategy,
                        a = nV("clippingAncestors" === r ? rb(n) ? [] : function(t, n) {
                            var r = n.get(t);
                            if (r) return r;
                            for (var o = rI(t, [], !1).filter(function(t) {
                                    return rh(t) && "body" !== rc(t)
                                }), i = null, a = "fixed" === rC(t).position, l = a ? rP(t) : t; rh(l) && !rS(l);) {
                                var s = rC(l),
                                    u = rO(l);
                                u || "fixed" !== s.position || (i = null), (a ? !u && !i : !u && "static" === s.position && i && rF.has(i.position) || ry(l) && !u && function t(n, r) {
                                    var o = rP(n);
                                    return !(o === r || !rh(o) || rS(o)) && ("fixed" === rC(o).position || t(o, r))
                                }(t, l)) ? o = o.filter(function(t) {
                                    return t !== l
                                }) : i = s, l = rP(l)
                            }
                            return n.set(t, o), o
                        }(n, this._c) : [].concat(r)).concat([o]),
                        l = a[0],
                        s = a.reduce(function(t, r) {
                            var o = rU(n, r, i);
                            return t.top = nq(o.top, t.top), t.right = n$(o.right, t.right), t.bottom = n$(o.bottom, t.bottom), t.left = nq(o.left, t.left), t
                        }, rU(n, l, i));
                    return {
                        width: s.right - s.left,
                        height: s.bottom - s.top,
                        x: s.left,
                        y: s.top
                    }
                },
                getOffsetParent: rV,
                getElementRects: function(t) {
                    return nL(function() {
                        var n, r, o, i;
                        return nJ(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return n = this.getOffsetParent || rV, [4, (0, this.getDimensions)(t.floating)];
                                case 1:
                                    return r = a.sent(), o = {}, i = [t.reference], [4, n(t.floating)];
                                case 2:
                                    return [2, (o.reference = rz.apply(void 0, i.concat([a.sent(), t.strategy])), o.floating = {
                                        x: 0,
                                        y: 0,
                                        width: r.width,
                                        height: r.height
                                    }, o)]
                            }
                        })
                    }).call(this)
                },
                getClientRects: function(t) {
                    return Array.from(t.getClientRects())
                },
                getDimensions: function(t) {
                    var n = rR(t);
                    return {
                        width: n.width,
                        height: n.height
                    }
                },
                getScale: rk,
                isElement: rh,
                isRTL: function(t) {
                    return "rtl" === rC(t).direction
                }
            };

            function rH(t, n) {
                return t.x === n.x && t.y === n.y && t.width === n.width && t.height === n.height
            }

            function rJ(t, n, r, o) {
                void 0 === o && (o = {});
                var i = o.ancestorScroll,
                    a = void 0 === i || i,
                    l = o.ancestorResize,
                    s = void 0 === l || l,
                    u = o.elementResize,
                    c = void 0 === u ? "function" == typeof ResizeObserver : u,
                    f = o.layoutShift,
                    d = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    p = o.animationFrame,
                    h = void 0 !== p && p,
                    v = rN(t),
                    m = a || s ? nV(v ? rI(v) : []).concat(nV(rI(n))) : [];
                m.forEach(function(t) {
                    a && t.addEventListener("scroll", r, {
                        passive: !0
                    }), s && t.addEventListener("resize", r)
                });
                var y, b = v && d ? function(t, n) {
                        var r, o = null,
                            i = rd(t);

                        function a() {
                            var t;
                            clearTimeout(r), null == (t = o) || t.disconnect(), o = null
                        }
                        return function l(s, u) {
                            void 0 === s && (s = !1), void 0 === u && (u = 1), a();
                            var c = t.getBoundingClientRect(),
                                f = c.left,
                                d = c.top,
                                p = c.width,
                                h = c.height;
                            if (s || n(), p && h) {
                                var v = {
                                        rootMargin: -nY(d) + "px " + -nY(i.clientWidth - (f + p)) + "px " + -nY(i.clientHeight - (d + h)) + "px " + -nY(f) + "px",
                                        threshold: nq(0, n$(1, u)) || 1
                                    },
                                    m = !0;
                                try {
                                    o = new IntersectionObserver(y, nz(nU({}, v), {
                                        root: i.ownerDocument
                                    }))
                                } catch (t) {
                                    o = new IntersectionObserver(y, v)
                                }
                                o.observe(t)
                            }

                            function y(n) {
                                var o = n[0].intersectionRatio;
                                if (o !== u) {
                                    if (!m) return l();
                                    o ? l(!1, o) : r = setTimeout(function() {
                                        l(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== o || rH(c, t.getBoundingClientRect()) || l(), m = !1
                            }
                        }(!0), a
                    }(v, r) : null,
                    g = -1,
                    w = null;
                c && (w = new ResizeObserver(function(t) {
                    var o = nB(t, 1)[0];
                    o && o.target === v && w && (w.unobserve(n), cancelAnimationFrame(g), g = requestAnimationFrame(function() {
                        var t;
                        null == (t = w) || t.observe(n)
                    })), r()
                }), v && !h && w.observe(v), w.observe(n));
                var x = h ? rD(t) : null;
                return h && function n() {
                        var o = rD(t);
                        x && !rH(x, o) && r(), x = o, y = requestAnimationFrame(n)
                    }(), r(),
                    function() {
                        var t;
                        m.forEach(function(t) {
                            a && t.removeEventListener("scroll", r), s && t.removeEventListener("resize", r)
                        }), null == b || b(), null == (t = w) || t.disconnect(), w = null, h && cancelAnimationFrame(y)
                    }
            }
            var rX = function(t) {
                    return {
                        name: "arrow",
                        options: t,
                        fn: function(n) {
                            return nL(function() {
                                var r, o, i, a, l, s, u, c, f, d, p, h, v, m, y, b, g, w, x, O, E, S, C, j, P, I, A, R, N, k, T, _, D, L, M, F, U;
                                return nJ(this, function(z) {
                                    switch (z.label) {
                                        case 0:
                                            if (r = n.x, o = n.y, i = n.placement, a = n.rects, l = n.platform, s = n.elements, u = n.middlewareData, f = (c = n0(t, n) || {}).element, p = void 0 === (d = c.padding) ? 0 : d, null == f) return [2, {}];
                                            return h = rn(p), v = {
                                                x: r,
                                                y: o
                                            }, y = n4(m = n3(n5(i))), [4, l.getDimensions(f)];
                                        case 1:
                                            return b = z.sent(), w = (g = "y" === m) ? "top" : "left", x = g ? "bottom" : "right", O = g ? "clientHeight" : "clientWidth", E = a.reference[y] + a.reference[m] - v[m] - a.floating[y], S = v[m] - a.reference[m], [4, null == l.getOffsetParent ? void 0 : l.getOffsetParent(f)];
                                        case 2:
                                            if (!(P = j = (C = z.sent()) ? C[O] : 0)) return [3, 4];
                                            return [4, null == l.isElement ? void 0 : l.isElement(C)];
                                        case 3:
                                            P = z.sent(), z.label = 4;
                                        case 4:
                                            return P || (j = s.floating[O] || a.floating[y]), I = E / 2 - S / 2, A = j / 2 - b[y] / 2 - 1, R = n$(h[w], A), N = n$(h[x], A), k = R, T = j - b[y] - N, D = nq(k, n$(_ = j / 2 - b[y] / 2 + I, T)), M = (L = !u.arrow && null != n2(i) && _ !== D && a.reference[y] / 2 - (_ < k ? R : N) - b[y] / 2 < 0) ? _ < k ? _ - k : _ - T : 0, [2, (nM(U = {}, m, v[m] + M), nM(U, "data", nU((nM(F = {}, m, D), nM(F, "centerOffset", _ - D - M), F), L && {
                                                alignmentOffset: M
                                            })), nM(U, "reset", L), U)]
                                    }
                                })
                            })()
                        }
                    }
                },
                r$ = function(t, n, r) {
                    var o, i = new Map,
                        a = nU({
                            platform: rG
                        }, r),
                        l = nz(nU({}, a.platform), {
                            _c: i
                        });
                    return o = nz(nU({}, a), {
                        platform: l
                    }), nL(function() {
                        var r, i, a, l, s, u, c, f, d, p, h, v, m, y, b, g, w, x, O, E, S, C, j, P, I, A;
                        return nJ(this, function(R) {
                            switch (R.label) {
                                case 0:
                                    return i = void 0 === (r = o.placement) ? "bottom" : r, l = void 0 === (a = o.strategy) ? "absolute" : a, u = void 0 === (s = o.middleware) ? [] : s, c = o.platform, f = u.filter(Boolean), [4, null == c.isRTL ? void 0 : c.isRTL(n)];
                                case 1:
                                    return d = R.sent(), [4, c.getElementRects({
                                        reference: t,
                                        floating: n,
                                        strategy: l
                                    })];
                                case 2:
                                    v = (h = ro(p = R.sent(), i, d)).x, m = h.y, y = i, b = {}, g = 0, w = 0, R.label = 3;
                                case 3:
                                    if (!(w < f.length)) return [3, 12];
                                    return O = (x = f[w]).name, [4, (0, x.fn)({
                                        x: v,
                                        y: m,
                                        initialPlacement: i,
                                        placement: y,
                                        strategy: l,
                                        middlewareData: b,
                                        rects: p,
                                        platform: c,
                                        elements: {
                                            reference: t,
                                            floating: n
                                        }
                                    })];
                                case 4:
                                    if (S = (E = R.sent()).x, C = E.y, j = E.data, P = E.reset, v = null != S ? S : v, m = null != C ? C : m, b = nz(nU({}, b), nM({}, O, nU({}, b[O], j))), !(P && g <= 50)) return [3, 10];
                                    if (g++, "object" != (void 0 === P ? "undefined" : nG(P))) return [3, 9];
                                    if (P.placement && (y = P.placement), !P.rects) return [3, 8];
                                    if (!0 !== P.rects) return [3, 6];
                                    return [4, c.getElementRects({
                                        reference: t,
                                        floating: n,
                                        strategy: l
                                    })];
                                case 5:
                                    return A = R.sent(), [3, 7];
                                case 6:
                                    A = P.rects, R.label = 7;
                                case 7:
                                    p = A, R.label = 8;
                                case 8:
                                    v = (I = ro(p, y, d)).x, m = I.y, R.label = 9;
                                case 9:
                                    w = -1, R.label = 10;
                                case 10:
                                    R.label = 11;
                                case 11:
                                    return w++, [3, 3];
                                case 12:
                                    return [2, {
                                        x: v,
                                        y: m,
                                        placement: y,
                                        strategy: l,
                                        middlewareData: b
                                    }]
                            }
                        })
                    })()
                },
                rq = "undefined" != typeof document ? v.useLayoutEffect : function() {};

            function rK(t, n) {
                if (t === n) return !0;
                if ((void 0 === t ? "undefined" : nG(t)) != (void 0 === n ? "undefined" : nG(n))) return !1;
                if ("function" == typeof t && t.toString() === n.toString()) return !0;
                if (t && n && "object" == (void 0 === t ? "undefined" : nG(t))) {
                    if (Array.isArray(t)) {
                        if ((r = t.length) !== n.length) return !1;
                        for (o = r; 0 != o--;)
                            if (!rK(t[o], n[o])) return !1;
                        return !0
                    }
                    if ((r = (i = Object.keys(t)).length) !== Object.keys(n).length) return !1;
                    for (o = r; 0 != o--;)
                        if (!({}).hasOwnProperty.call(n, i[o])) return !1;
                    for (o = r; 0 != o--;) {
                        var r, o, i, a = i[o];
                        if (("_owner" !== a || !t.$$typeof) && !rK(t[a], n[a])) return !1
                    }
                    return !0
                }
                return t != t && n != n
            }

            function rY(t) {
                return "undefined" == typeof window ? 1 : (t.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function rZ(t, n) {
                var r = rY(t);
                return Math.round(n * r) / r
            }

            function rQ(t) {
                var n = v.useRef(t);
                return rq(function() {
                    n.current = t
                }), n
            }
            var r0 = function(t, n) {
                    var r;
                    return nz(nU({}, (void 0 === (r = t) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(t) {
                            return nL(function() {
                                var n, o, i, a, l, s, u;
                                return nJ(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            var f;
                                            return i = t.x, a = t.y, l = t.placement, s = t.middlewareData, [4, (f = r, nL(function() {
                                                var n, r, o, i, a, l, s, u, c, d, p, h, v, m;
                                                return nJ(this, function(y) {
                                                    switch (y.label) {
                                                        case 0:
                                                            return n = t.placement, r = t.platform, o = t.elements, [4, null == r.isRTL ? void 0 : r.isRTL(o.floating)];
                                                        case 1:
                                                            return i = y.sent(), a = n1(n), l = n2(n), s = "y" === n5(n), u = rs.has(a) ? -1 : 1, c = i && s ? -1 : 1, h = (p = "number" == typeof(d = n0(f, t)) ? {
                                                                mainAxis: d,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: d.mainAxis || 0,
                                                                crossAxis: d.crossAxis || 0,
                                                                alignmentAxis: d.alignmentAxis
                                                            }).mainAxis, v = p.crossAxis, m = p.alignmentAxis, [2, (l && "number" == typeof m && (v = "end" === l ? -1 * m : m), s ? {
                                                                x: v * c,
                                                                y: h * u
                                                            } : {
                                                                x: h * u,
                                                                y: v * c
                                                            })]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            return u = c.sent(), [2, l === (null == (n = s.offset) ? void 0 : n.placement) && null != (o = s.arrow) && o.alignmentOffset ? {} : {
                                                x: i + u.x,
                                                y: a + u.y,
                                                data: nz(nU({}, u), {
                                                    placement: l
                                                })
                                            }]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                r1 = function(t, n) {
                    var r;
                    return nz(nU({}, (void 0 === (r = t) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(t) {
                            return nL(function() {
                                var n, o, i, a, l, s, u, c, f, d, p, h, v, m, y, b, g, w, x, O, E, S;
                                return nJ(this, function(C) {
                                    switch (C.label) {
                                        case 0:
                                            return n = t.x, o = t.y, i = t.placement, s = void 0 === (l = (a = n0(r, t)).mainAxis) || l, c = void 0 !== (u = a.crossAxis) && u, d = void 0 === (f = a.limiter) ? {
                                                fn: function(t) {
                                                    return {
                                                        x: t.x,
                                                        y: t.y
                                                    }
                                                }
                                            } : f, p = nW(a, ["mainAxis", "crossAxis", "limiter"]), h = {
                                                x: n,
                                                y: o
                                            }, [4, ri(t, p)];
                                        case 1:
                                            return v = C.sent(), b = h[y = n3(m = n5(n1(i)))], g = h[m], s && (w = "y" === y ? "bottom" : "right", b = nq(b + v["y" === y ? "top" : "left"], n$(b, b - v[w]))), c && (x = "y" === m ? "bottom" : "right", g = nq(g + v["y" === m ? "top" : "left"], n$(g, g - v[x]))), E = d.fn(nz(nU({}, t), (nM(O = {}, y, b), nM(O, m, g), O))), [2, nz(nU({}, E), {
                                                data: {
                                                    x: E.x - n,
                                                    y: E.y - o,
                                                    enabled: (nM(S = {}, y, s), nM(S, m, c), S)
                                                }
                                            })]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                r2 = function(t, n) {
                    var r;
                    return nz(nU({}, (void 0 === (r = t) && (r = {}), {
                        options: r,
                        fn: function(t) {
                            var n, o = t.x,
                                i = t.y,
                                a = t.placement,
                                l = t.rects,
                                s = t.middlewareData,
                                u = n0(r, t),
                                c = u.offset,
                                f = u.mainAxis,
                                d = u.crossAxis,
                                p = {
                                    x: o,
                                    y: i
                                },
                                h = n5(a),
                                v = n3(h),
                                m = p[v],
                                y = p[h],
                                b = n0(void 0 === c ? 0 : c, t),
                                g = "number" == typeof b ? {
                                    mainAxis: b,
                                    crossAxis: 0
                                } : nU({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, b);
                            if (void 0 === f || f) {
                                var w = "y" === v ? "height" : "width",
                                    x = l.reference[v] - l.floating[w] + g.mainAxis,
                                    O = l.reference[v] + l.reference[w] - g.mainAxis;
                                m < x ? m = x : m > O && (m = O)
                            }
                            if (void 0 === d || d) {
                                var E, S, C = "y" === v ? "width" : "height",
                                    j = rs.has(n1(a)),
                                    P = l.reference[h] - l.floating[C] + (j && (null == (E = s.offset) ? void 0 : E[h]) || 0) + (j ? 0 : g.crossAxis),
                                    I = l.reference[h] + l.reference[C] + (j ? 0 : (null == (S = s.offset) ? void 0 : S[h]) || 0) - (j ? g.crossAxis : 0);
                                y < P ? y = P : y > I && (y = I)
                            }
                            return nM(n = {}, v, m), nM(n, h, y), n
                        }
                    })), {
                        options: [t, n]
                    })
                },
                r3 = function(t, n) {
                    var r;
                    return nz(nU({}, (void 0 === (r = t) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(t) {
                            return nL(function() {
                                var n, o, i, a, l, s, u, c, f, d, p, h, v, m, y, b, g, w, x, O, E, S, C, j, P, I, A, R, N, k, T, _, D, L, M, F, U, z, W, B;
                                return nJ(this, function(V) {
                                    var G, H, J, X, $, q, K, Y, Z, Q, ee, et, en, er, eo;
                                    switch (V.label) {
                                        case 0:
                                            if (a = t.placement, l = t.middlewareData, s = t.rects, u = t.initialPlacement, c = t.platform, f = t.elements, h = void 0 === (p = (d = n0(r, t)).mainAxis) || p, m = void 0 === (v = d.crossAxis) || v, y = d.fallbackPlacements, g = void 0 === (b = d.fallbackStrategy) ? "bestFit" : b, x = void 0 === (w = d.fallbackAxisSideDirection) ? "none" : w, E = void 0 === (O = d.flipAlignment) || O, S = nW(d, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (o = l.arrow) && o.alignmentOffset) return [2, {}];
                                            return C = n1(a), j = n5(u), P = n1(u) === u, [4, null == c.isRTL ? void 0 : c.isRTL(f.floating)];
                                        case 1:
                                            return I = V.sent(), A = y || (P || !E ? [rt(u)] : (H = rt(G = u), [n8(G), H, n8(H)])), R = "none" !== x, !y && R && (n = A).push.apply(n, nV((J = u, X = E, $ = x, q = I, K = n2(J), Y = function(t, n, r) {
                                                switch (t) {
                                                    case "top":
                                                    case "bottom":
                                                        return r ? n ? n7 : n6 : n ? n6 : n7;
                                                    case "left":
                                                    case "right":
                                                        return n ? n9 : re;
                                                    default:
                                                        return []
                                                }
                                            }(n1(J), "start" === $, q), K && (Y = Y.map(function(t) {
                                                return t + "-" + K
                                            }), X && (Y = Y.concat(Y.map(n8)))), Y))), N = [u].concat(nV(A)), [4, ri(t, S)];
                                        case 2:
                                            if (k = V.sent(), T = [], _ = (null == (i = l.flip) ? void 0 : i.overflows) || [], h && T.push(k[C]), m && (Z = a, Q = s, void 0 === (ee = I) && (ee = !1), et = n2(Z), er = n4(en = n3(n5(Z))), eo = "x" === en ? et === (ee ? "end" : "start") ? "right" : "left" : "start" === et ? "bottom" : "top", Q.reference[er] > Q.floating[er] && (eo = rt(eo)), D = [eo, rt(eo)], T.push(k[D[0]], k[D[1]])), _ = nV(_).concat([{
                                                    placement: a,
                                                    overflows: T
                                                }]), !T.every(function(t) {
                                                    return t <= 0
                                                })) {
                                                if ((U = N[F = ((null == (L = l.flip) ? void 0 : L.index) || 0) + 1]) && ("alignment" !== m || j === n5(U) || _.every(function(t) {
                                                        return n5(t.placement) !== j || t.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: F,
                                                        overflows: _
                                                    },
                                                    reset: {
                                                        placement: U
                                                    }
                                                }];
                                                if (!(z = null == (M = _.filter(function(t) {
                                                        return t.overflows[0] <= 0
                                                    }).sort(function(t, n) {
                                                        return t.overflows[1] - n.overflows[1]
                                                    })[0]) ? void 0 : M.placement)) switch (g) {
                                                    case "bestFit":
                                                        (B = null == (W = _.filter(function(t) {
                                                            if (R) {
                                                                var n = n5(t.placement);
                                                                return n === j || "y" === n
                                                            }
                                                            return !0
                                                        }).map(function(t) {
                                                            return [t.placement, t.overflows.filter(function(t) {
                                                                return t > 0
                                                            }).reduce(function(t, n) {
                                                                return t + n
                                                            }, 0)]
                                                        }).sort(function(t, n) {
                                                            return t[1] - n[1]
                                                        })[0]) ? void 0 : W[0]) && (z = B);
                                                        break;
                                                    case "initialPlacement":
                                                        z = u
                                                }
                                                if (a !== z) return [2, {
                                                    reset: {
                                                        placement: z
                                                    }
                                                }]
                                            }
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                r4 = function(t, n) {
                    var r;
                    return nz(nU({}, (void 0 === (r = t) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(t) {
                            return nL(function() {
                                var n, o, i, a, l, s, u, c, f, d, p, h, v, m, y, b, g, w, x, O, E, S, C, j, P, I, A, R, N, k;
                                return nJ(this, function(T) {
                                    switch (T.label) {
                                        case 0:
                                            return i = t.placement, a = t.rects, l = t.platform, s = t.elements, f = void 0 === (c = (u = n0(r, t)).apply) ? function() {} : c, [4, ri(t, nW(u, ["apply"]))];
                                        case 1:
                                            if (d = T.sent(), p = n1(i), h = n2(i), v = "y" === n5(i), y = (m = a.floating).width, b = m.height, "top" !== p && "bottom" !== p) return [3, 3];
                                            return g = p, [4, null == l.isRTL ? void 0 : l.isRTL(s.floating)];
                                        case 2:
                                            return w = h === (T.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            w = p, g = "end" === h ? "top" : "bottom", T.label = 4;
                                        case 4:
                                            return x = b - d.top - d.bottom, O = y - d.left - d.right, E = n$(b - d[g], x), S = n$(y - d[w], O), C = !t.middlewareData.shift, j = E, P = S, null != (n = t.middlewareData.shift) && n.enabled.x && (P = O), null != (o = t.middlewareData.shift) && o.enabled.y && (j = x), C && !h && (I = nq(d.left, 0), A = nq(d.right, 0), R = nq(d.top, 0), N = nq(d.bottom, 0), v ? P = y - 2 * (0 !== I || 0 !== A ? I + A : nq(d.left, d.right)) : j = b - 2 * (0 !== R || 0 !== N ? R + N : nq(d.top, d.bottom))), [4, f(nz(nU({}, t), {
                                                availableWidth: P,
                                                availableHeight: j
                                            }))];
                                        case 5:
                                            return T.sent(), [4, l.getDimensions(s.floating)];
                                        case 6:
                                            return k = T.sent(), [2, y !== k.width || b !== k.height ? {
                                                reset: {
                                                    rects: !0
                                                }
                                            } : {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                r5 = function(t, n) {
                    var r;
                    return nz(nU({}, (void 0 === (r = t) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(t) {
                            return nL(function() {
                                var n, o, i, a, l, s, u;
                                return nJ(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            switch (n = t.rects, a = void 0 === (i = (o = n0(r, t)).strategy) ? "referenceHidden" : i, l = nW(o, ["strategy"]), a) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, ri(t, nz(nU({}, l), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: s = ra.apply(void 0, [c.sent(), n.reference]),
                                                    referenceHidden: rl(s)
                                                }
                                            }];
                                        case 3:
                                            return [4, ri(t, nz(nU({}, l), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: u = ra.apply(void 0, [c.sent(), n.floating]),
                                                    escaped: rl(u)
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
                        options: [t, n]
                    })
                },
                r8 = function(t, n) {
                    return nz(nU({}, {
                        name: "arrow",
                        options: t,
                        fn: function(n) {
                            var r = "function" == typeof t ? t(n) : t,
                                o = r.element,
                                i = r.padding;
                            return o && ({}).hasOwnProperty.call(o, "current") ? null != o.current ? rX({
                                element: o.current,
                                padding: i
                            }).fn(n) : {} : o ? rX({
                                element: o,
                                padding: i
                            }).fn(n) : {}
                        }
                    }), {
                        options: [t, n]
                    })
                };

            function r6(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function r7(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function r9(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        r7(t, n, r[n])
                    })
                }
                return t
            }

            function oe(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function ot(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function on(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            l = !0,
                            s = !1;
                        try {
                            for (i = i.call(t); !(l = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); l = !0);
                        } catch (t) {
                            s = !0, o = t
                        } finally {
                            try {
                                l || null == i.return || i.return()
                            } finally {
                                if (s) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || oo(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function or(t) {
                return function(t) {
                    if (Array.isArray(t)) return r6(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || oo(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oo(t, n) {
                if (t) {
                    if ("string" == typeof t) return r6(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r6(t, n)
                }
            }

            function oi(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var oa = Symbol("radix.slottable");

            function ol(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === oa
            }
            var os = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, i, a, l, s = (o = r = "Primitive.".concat(n), (i = v.forwardRef(function(t, n) {
                            var r = t.children,
                                o = ot(t, ["children"]);
                            if (v.isValidElement(r)) {
                                var i, a, l, s = (l = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    u = function(t, n) {
                                        var r = r9({}, n);
                                        for (var o in n) ! function(o) {
                                            var i = t[o],
                                                a = n[o];
                                            /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                a.apply(void 0, or(n)), i.apply(void 0, or(n))
                                            } : i && (r[o] = i) : "style" === o ? r[o] = r9({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                        }(o);
                                        return r9({}, t, r)
                                    }(o, r.props);
                                return r.type !== v.Fragment && (u.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = oi(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : oi(n[t], null)
                                            }
                                        }
                                    }
                                }(n, s) : s), v.cloneElement(r, u)
                            }
                            return v.Children.count(r) > 1 ? v.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), a = i, (l = v.forwardRef(function(t, n) {
                            var r = t.children,
                                o = ot(t, ["children"]),
                                i = v.Children.toArray(r),
                                l = i.find(ol);
                            if (l) {
                                var s = l.props.children,
                                    u = i.map(function(t) {
                                        return t === l ? v.Children.count(s) > 1 ? v.Children.only(null) : v.isValidElement(s) ? s.props.children : null : t
                                    });
                                return (0, c.jsx)(a, oe(r9({}, o), {
                                    ref: n,
                                    children: v.isValidElement(s) ? v.cloneElement(s, void 0, u) : null
                                }))
                            }
                            return (0, c.jsx)(a, oe(r9({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        u = v.forwardRef(function(t, r) {
                            var o = t.asChild,
                                i = ot(t, ["asChild"]),
                                a = o ? s : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, c.jsx)(a, oe(r9({}, i), {
                                ref: r
                            }))
                        });
                    return u.displayName = "Primitive.".concat(n), oe(r9({}, t), r7({}, n, u))
                }, {}),
                ou = v.forwardRef(function(t, n) {
                    var r = t.children,
                        o = t.width,
                        i = t.height,
                        a = ot(t, ["children", "width", "height"]);
                    return (0, c.jsx)(os.svg, oe(r9({}, a), {
                        ref: n,
                        width: void 0 === o ? 10 : o,
                        height: void 0 === i ? 5 : i,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: t.asChild ? r : (0, c.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }))
                });

            function oc(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function of() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = oc(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : oc(n[t], null)
                        }
                    }
                }
            }

            function od() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return v.useCallback(of.apply(void 0, or(n)), n)
            }

            function op() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var i = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                i = r.scopeName;
                            return r9({}, t, o(n)["__scope".concat(i)])
                        }, {});
                        return v.useMemo(function() {
                            return r7({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }
            ou.displayName = "Arrow";
            var oh = Symbol("radix.slottable");

            function ov(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === oh
            }
            var om = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, i, a, l, s = (o = r = "Primitive.".concat(n), (i = v.forwardRef(function(t, n) {
                            var r = t.children,
                                o = ot(t, ["children"]);
                            if (v.isValidElement(r)) {
                                var i, a, l, s = (l = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    u = function(t, n) {
                                        var r = r9({}, n);
                                        for (var o in n) ! function(o) {
                                            var i = t[o],
                                                a = n[o];
                                            /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                a.apply(void 0, or(n)), i.apply(void 0, or(n))
                                            } : i && (r[o] = i) : "style" === o ? r[o] = r9({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                        }(o);
                                        return r9({}, t, r)
                                    }(o, r.props);
                                return r.type !== v.Fragment && (u.ref = n ? of(n, s) : s), v.cloneElement(r, u)
                            }
                            return v.Children.count(r) > 1 ? v.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), a = i, (l = v.forwardRef(function(t, n) {
                            var r = t.children,
                                o = ot(t, ["children"]),
                                i = v.Children.toArray(r),
                                l = i.find(ov);
                            if (l) {
                                var s = l.props.children,
                                    u = i.map(function(t) {
                                        return t === l ? v.Children.count(s) > 1 ? v.Children.only(null) : v.isValidElement(s) ? s.props.children : null : t
                                    });
                                return (0, c.jsx)(a, oe(r9({}, o), {
                                    ref: n,
                                    children: v.isValidElement(s) ? v.cloneElement(s, void 0, u) : null
                                }))
                            }
                            return (0, c.jsx)(a, oe(r9({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        u = v.forwardRef(function(t, r) {
                            var o = t.asChild,
                                i = ot(t, ["asChild"]),
                                a = o ? s : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, c.jsx)(a, oe(r9({}, i), {
                                ref: r
                            }))
                        });
                    return u.displayName = "Primitive.".concat(n), oe(r9({}, t), r7({}, n, u))
                }, {}),
                oy = (null == (l = globalThis) ? void 0 : l.document) ? v.useLayoutEffect : function() {},
                ob = "Popper",
                og = on(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return v.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return v.useMemo(function() {
                                    return r7({}, "__scope".concat(t), oe(r9({}, r), r7({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var i = v.createContext(o),
                            a = r.length;
                        r = or(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                s = ot(n, ["scope", "children"]),
                                u = (null == o || null == (r = o[t]) ? void 0 : r[a]) || i,
                                f = v.useMemo(function() {
                                    return s
                                }, Object.values(s));
                            return (0, c.jsx)(u.Provider, {
                                value: f,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var s, u = (null == l || null == (s = l[t]) ? void 0 : s[a]) || i,
                                c = v.useContext(u);
                            if (c) return c;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, op.apply(void 0, [o].concat(or(n)))]
                }(ob), 2),
                ow = og[0],
                ox = og[1],
                oO = on(ow(ob), 2),
                oE = oO[0],
                oS = oO[1],
                oC = function(t) {
                    var n = t.__scopePopper,
                        r = t.children,
                        o = on(v.useState(null), 2),
                        i = o[0],
                        a = o[1];
                    return (0, c.jsx)(oE, {
                        scope: n,
                        anchor: i,
                        onAnchorChange: a,
                        children: r
                    })
                };
            oC.displayName = ob;
            var oj = "PopperAnchor",
                oP = v.forwardRef(function(t, n) {
                    var r = t.__scopePopper,
                        o = t.virtualRef,
                        i = ot(t, ["__scopePopper", "virtualRef"]),
                        a = oS(oj, r),
                        l = v.useRef(null),
                        s = od(n, l);
                    return v.useEffect(function() {
                        a.onAnchorChange((null == o ? void 0 : o.current) || l.current)
                    }), o ? null : (0, c.jsx)(om.div, oe(r9({}, i), {
                        ref: s
                    }))
                });
            oP.displayName = oj;
            var oI = "PopperContent",
                oA = on(ow(oI), 2),
                oR = oA[0],
                oN = oA[1],
                ok = v.forwardRef(function(t, n) {
                    var r, o, i, a, l, s, u, f, d, p, h, m, y, b, g, w, x, O, E, S, C, j, P, I, A, R, N, k, T, _, D, L, M, F, U, z, W, B, V, G, H, J, X, $, q, K, Y, Z, Q, ee, et, en, er, eo, ei, ea, el = t.__scopePopper,
                        es = t.side,
                        eu = t.sideOffset,
                        ec = t.align,
                        ef = void 0 === ec ? "center" : ec,
                        ed = t.alignOffset,
                        ep = t.arrowPadding,
                        eh = t.avoidCollisions,
                        ev = void 0 === eh || eh,
                        em = t.collisionBoundary,
                        ey = void 0 === em ? [] : em,
                        eb = t.collisionPadding,
                        eg = void 0 === eb ? 0 : eb,
                        ew = t.sticky,
                        ex = t.hideWhenDetached,
                        eO = t.updatePositionStrategy,
                        eE = void 0 === eO ? "optimized" : eO,
                        eS = t.onPlaced,
                        eC = ot(t, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        ej = oS(oI, el),
                        eP = on(v.useState(null), 2),
                        eI = eP[0],
                        eA = eP[1],
                        eR = od(n, function(t) {
                            return eA(t)
                        }),
                        eN = on(v.useState(null), 2),
                        ek = eN[0],
                        eT = eN[1],
                        e_ = (o = (r = on(v.useState(void 0), 2))[0], i = r[1], oy(function() {
                            if (ek) {
                                i({
                                    width: ek.offsetWidth,
                                    height: ek.offsetHeight
                                });
                                var t = new ResizeObserver(function(t) {
                                    if (Array.isArray(t) && t.length) {
                                        var n, r, o = t[0];
                                        if ("borderBoxSize" in o) {
                                            var a = o.borderBoxSize,
                                                l = Array.isArray(a) ? a[0] : a;
                                            n = l.inlineSize, r = l.blockSize
                                        } else n = ek.offsetWidth, r = ek.offsetHeight;
                                        i({
                                            width: n,
                                            height: r
                                        })
                                    }
                                });
                                return t.observe(ek, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return t.unobserve(ek)
                                    }
                            }
                            i(void 0)
                        }, [ek]), o),
                        eD = null != (ei = null == e_ ? void 0 : e_.width) ? ei : 0,
                        eM = null != (ea = null == e_ ? void 0 : e_.height) ? ea : 0,
                        eF = "number" == typeof eg ? eg : r9({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, eg),
                        eU = Array.isArray(ey) ? ey : [ey],
                        ez = eU.length > 0,
                        eW = {
                            padding: eF,
                            boundary: eU.filter(oL),
                            altBoundary: ez
                        },
                        eB = (s = void 0 === (l = (a = {
                            strategy: "fixed",
                            placement: (void 0 === es ? "bottom" : es) + ("center" !== ef ? "-" + ef : ""),
                            whileElementsMounted: function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                return rJ.apply(void 0, or(n).concat([{
                                    animationFrame: "always" === eE
                                }]))
                            },
                            elements: {
                                reference: ej.anchor
                            },
                            middleware: [r0({
                                mainAxis: (void 0 === eu ? 0 : eu) + eM,
                                alignmentAxis: void 0 === ed ? 0 : ed
                            }), ev && r1(r9({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === ew ? "partial" : ew) ? r2() : void 0
                            }, eW)), ev && r3(r9({}, eW)), r4(oe(r9({}, eW), {
                                apply: function(t) {
                                    var n = t.elements,
                                        r = t.rects,
                                        o = t.availableWidth,
                                        i = t.availableHeight,
                                        a = r.reference,
                                        l = a.width,
                                        s = a.height,
                                        u = n.floating.style;
                                    u.setProperty("--radix-popper-available-width", "".concat(o, "px")), u.setProperty("--radix-popper-available-height", "".concat(i, "px")), u.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), u.setProperty("--radix-popper-anchor-height", "".concat(s, "px"))
                                }
                            })), ek && r8({
                                element: ek,
                                padding: void 0 === ep ? 0 : ep
                            }), oM({
                                arrowWidth: eD,
                                arrowHeight: eM
                            }), void 0 !== ex && ex && r5(r9({
                                strategy: "referenceHidden"
                            }, eW))]
                        }).placement) ? "bottom" : l, f = void 0 === (u = a.strategy) ? "absolute" : u, p = void 0 === (d = a.middleware) ? [] : d, h = a.platform, b = (y = void 0 === (m = a.elements) ? {} : m).reference, g = y.floating, x = void 0 === (w = a.transform) || w, O = a.whileElementsMounted, E = a.open, C = (S = nB(v.useState({
                            x: 0,
                            y: 0,
                            strategy: f,
                            placement: s,
                            middlewareData: {},
                            isPositioned: !1
                        }), 2))[0], j = S[1], I = (P = nB(v.useState(p), 2))[0], A = P[1], rK(I, p) || A(p), N = (R = nB(v.useState(null), 2))[0], k = R[1], _ = (T = nB(v.useState(null), 2))[0], D = T[1], L = v.useCallback(function(t) {
                            t !== z.current && (z.current = t, k(t))
                        }, []), M = v.useCallback(function(t) {
                            t !== W.current && (W.current = t, D(t))
                        }, []), F = b || N, U = g || _, z = v.useRef(null), W = v.useRef(null), B = v.useRef(C), V = null != O, G = rQ(O), H = rQ(h), J = rQ(E), X = v.useCallback(function() {
                            if (z.current && W.current) {
                                var t = {
                                    placement: s,
                                    strategy: f,
                                    middleware: I
                                };
                                H.current && (t.platform = H.current), r$(z.current, W.current, t).then(function(t) {
                                    var n = nz(nU({}, t), {
                                        isPositioned: !1 !== J.current
                                    });
                                    $.current && !rK(B.current, n) && (B.current = n, eL.flushSync(function() {
                                        j(n)
                                    }))
                                })
                            }
                        }, [I, s, f, H, J]), rq(function() {
                            !1 === E && B.current.isPositioned && (B.current.isPositioned = !1, j(function(t) {
                                return nz(nU({}, t), {
                                    isPositioned: !1
                                })
                            }))
                        }, [E]), $ = v.useRef(!1), rq(function() {
                            return $.current = !0,
                                function() {
                                    $.current = !1
                                }
                        }, []), rq(function() {
                            if (F && (z.current = F), U && (W.current = U), F && U) {
                                if (G.current) return G.current(F, U, X);
                                X()
                            }
                        }, [F, U, X, G, V]), q = v.useMemo(function() {
                            return {
                                reference: z,
                                floating: W,
                                setReference: L,
                                setFloating: M
                            }
                        }, [L, M]), K = v.useMemo(function() {
                            return {
                                reference: F,
                                floating: U
                            }
                        }, [F, U]), Y = v.useMemo(function() {
                            var t = {
                                position: f,
                                left: 0,
                                top: 0
                            };
                            if (!K.floating) return t;
                            var n = rZ(K.floating, C.x),
                                r = rZ(K.floating, C.y);
                            return x ? nU(nz(nU({}, t), {
                                transform: "translate(" + n + "px, " + r + "px)"
                            }), rY(K.floating) >= 1.5 && {
                                willChange: "transform"
                            }) : {
                                position: f,
                                left: n,
                                top: r
                            }
                        }, [f, x, K.floating, C.x, C.y]), v.useMemo(function() {
                            return nz(nU({}, C), {
                                update: X,
                                refs: q,
                                elements: K,
                                floatingStyles: Y
                            })
                        }, [C, X, q, K, Y])),
                        eV = eB.refs,
                        eG = eB.floatingStyles,
                        eH = eB.placement,
                        eJ = eB.isPositioned,
                        eX = eB.middlewareData,
                        e$ = on(oF(eH), 2),
                        eq = e$[0],
                        eK = e$[1],
                        eY = (Z = v.useRef(eS), v.useEffect(function() {
                            Z.current = eS
                        }), v.useMemo(function() {
                            return function() {
                                for (var t, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                                return null == (t = Z.current) ? void 0 : t.call.apply(t, [Z].concat(or(r)))
                            }
                        }, []));
                    oy(function() {
                        eJ && (null == eY || eY())
                    }, [eJ, eY]);
                    var eZ = null == (Q = eX.arrow) ? void 0 : Q.x,
                        eQ = null == (ee = eX.arrow) ? void 0 : ee.y,
                        e0 = 0 !== (null == (et = eX.arrow) ? void 0 : et.centerOffset),
                        e1 = on(v.useState(), 2),
                        e2 = e1[0],
                        e3 = e1[1];
                    return oy(function() {
                        eI && e3(window.getComputedStyle(eI).zIndex)
                    }, [eI]), (0, c.jsx)("div", {
                        ref: eV.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: r9(oe(r9({}, eG), {
                            transform: eJ ? eG.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: e2,
                            "--radix-popper-transform-origin": [null == (en = eX.transformOrigin) ? void 0 : en.x, null == (er = eX.transformOrigin) ? void 0 : er.y].join(" ")
                        }), (null == (eo = eX.hide) ? void 0 : eo.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: t.dir,
                        children: (0, c.jsx)(oR, {
                            scope: el,
                            placedSide: eq,
                            onArrowChange: eT,
                            arrowX: eZ,
                            arrowY: eQ,
                            shouldHideArrow: e0,
                            children: (0, c.jsx)(om.div, oe(r9({
                                "data-side": eq,
                                "data-align": eK
                            }, eC), {
                                ref: eR,
                                style: oe(r9({}, eC.style), {
                                    animation: eJ ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            ok.displayName = oI;
            var oT = "PopperArrow",
                o_ = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                oD = v.forwardRef(function(t, n) {
                    var r, o = t.__scopePopper,
                        i = ot(t, ["__scopePopper"]),
                        a = oN(oT, o),
                        l = o_[a.placedSide];
                    return (0, c.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (r7(r = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, l, 0), r7(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), r7(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), r7(r, "visibility", a.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, c.jsx)(ou, oe(r9({}, i), {
                            ref: n,
                            style: oe(r9({}, i.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function oL(t) {
                return null !== t
            }
            oD.displayName = oT;
            var oM = function(t) {
                return {
                    name: "transformOrigin",
                    options: t,
                    fn: function(n) {
                        var r, o, i, a, l, s = n.placement,
                            u = n.rects,
                            c = n.middlewareData,
                            f = 0 !== (null == (r = c.arrow) ? void 0 : r.centerOffset),
                            d = f ? 0 : t.arrowWidth,
                            p = f ? 0 : t.arrowHeight,
                            h = on(oF(s), 2),
                            v = h[0],
                            m = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [h[1]],
                            y = (null != (a = null == (o = c.arrow) ? void 0 : o.x) ? a : 0) + d / 2,
                            b = (null != (l = null == (i = c.arrow) ? void 0 : i.y) ? l : 0) + p / 2,
                            g = "",
                            w = "";
                        return "bottom" === v ? (g = f ? m : "".concat(y, "px"), w = -p + "px") : "top" === v ? (g = f ? m : "".concat(y, "px"), w = "".concat(u.floating.height + p, "px")) : "right" === v ? (g = -p + "px", w = f ? m : "".concat(b, "px")) : "left" === v && (g = "".concat(u.floating.width + p, "px"), w = f ? m : "".concat(b, "px")), {
                            data: {
                                x: g,
                                y: w
                            }
                        }
                    }
                }
            };

            function oF(t) {
                var n = on(t.split("-"), 2),
                    r = n[0],
                    o = n[1];
                return [r, void 0 === o ? "center" : o]
            }

            function oU(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function oz(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function oW(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        oz(t, n, r[n])
                    })
                }
                return t
            }

            function oB(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function oV(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function oG(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            l = !0,
                            s = !1;
                        try {
                            for (i = i.call(t); !(l = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); l = !0);
                        } catch (t) {
                            s = !0, o = t
                        } finally {
                            try {
                                l || null == i.return || i.return()
                            } finally {
                                if (s) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || oJ(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oH(t) {
                return function(t) {
                    if (Array.isArray(t)) return oU(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || oJ(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oJ(t, n) {
                if (t) {
                    if ("string" == typeof t) return oU(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oU(t, n)
                }
            }

            function oX(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    i = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === i || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function o$(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function oq() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = o$(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : o$(n[t], null)
                        }
                    }
                }
            }

            function oK() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return v.useCallback(oq.apply(void 0, oH(n)), n)
            }

            function oY() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var i = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                i = r.scopeName;
                            return oW({}, t, o(n)["__scope".concat(i)])
                        }, {});
                        return v.useMemo(function() {
                            return oz({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }
            var oZ = (null == (s = globalThis) ? void 0 : s.document) ? v.useLayoutEffect : function() {},
                oQ = function(t) {
                    var n, r, o, i, a, l, s, u, c, f, d, p, h, m, y = t.present,
                        b = t.children,
                        g = (i = (o = oG(v.useState(), 2))[0], a = o[1], l = v.useRef({}), s = v.useRef(y), u = v.useRef("none"), f = (c = oG((n = y ? "mounted" : "unmounted", r = {
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
                        }, v.useReducer(function(t, n) {
                            var o;
                            return null != (o = r[t][n]) ? o : t
                        }, n)), 2))[0], d = c[1], v.useEffect(function() {
                            var t = o0(l.current);
                            u.current = "mounted" === f ? t : "none"
                        }, [f]), oZ(function() {
                            var t = l.current,
                                n = s.current;
                            if (n !== y) {
                                var r = u.current,
                                    o = o0(t);
                                y ? d("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? d("UNMOUNT") : d(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), s.current = y
                            }
                        }, [y, d]), oZ(function() {
                            if (i) {
                                var t, n, r = null != (n = i.ownerDocument.defaultView) ? n : window,
                                    o = function(n) {
                                        var o = o0(l.current).includes(n.animationName);
                                        if (n.target === i && o && (d("ANIMATION_END"), !s.current)) {
                                            var a = i.style.animationFillMode;
                                            i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === i.style.animationFillMode && (i.style.animationFillMode = a)
                                            })
                                        }
                                    },
                                    a = function(t) {
                                        t.target === i && (u.current = o0(l.current))
                                    };
                                return i.addEventListener("animationstart", a), i.addEventListener("animationcancel", o), i.addEventListener("animationend", o),
                                    function() {
                                        r.clearTimeout(t), i.removeEventListener("animationstart", a), i.removeEventListener("animationcancel", o), i.removeEventListener("animationend", o)
                                    }
                            }
                            d("ANIMATION_END")
                        }, [i, d]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(f),
                            ref: v.useCallback(function(t) {
                                t && (l.current = getComputedStyle(t)), a(t)
                            }, [])
                        }),
                        w = "function" == typeof b ? b({
                            present: g.isPresent
                        }) : v.Children.only(b),
                        x = oK(g.ref, (m = null == (p = Object.getOwnPropertyDescriptor(w.props, "ref")) ? void 0 : p.get) && "isReactWarning" in m && m.isReactWarning ? w.ref : (m = null == (h = Object.getOwnPropertyDescriptor(w, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning ? w.props.ref : w.props.ref || w.ref);
                    return "function" == typeof b || g.isPresent ? v.cloneElement(w, {
                        ref: x
                    }) : null
                };

            function o0(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function o1(t) {
                var n, r, o = (n = t, (r = v.forwardRef(function(t, n) {
                        var r = t.children,
                            o = oV(t, ["children"]);
                        if (v.isValidElement(r)) {
                            var i, a, l, s = (l = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                u = function(t, n) {
                                    var r = oW({}, n);
                                    for (var o in n) ! function(o) {
                                        var i = t[o],
                                            a = n[o];
                                        /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            a.apply(void 0, oH(n)), i.apply(void 0, oH(n))
                                        } : i && (r[o] = i) : "style" === o ? r[o] = oW({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                    }(o);
                                    return oW({}, t, r)
                                }(o, r.props);
                            return r.type !== v.Fragment && (u.ref = n ? oq(n, s) : s), v.cloneElement(r, u)
                        }
                        return v.Children.count(r) > 1 ? v.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    i = v.forwardRef(function(t, n) {
                        var r = t.children,
                            i = oV(t, ["children"]),
                            a = v.Children.toArray(r),
                            l = a.find(o3);
                        if (l) {
                            var s = l.props.children,
                                u = a.map(function(t) {
                                    return t === l ? v.Children.count(s) > 1 ? v.Children.only(null) : v.isValidElement(s) ? s.props.children : null : t
                                });
                            return (0, c.jsx)(o, oB(oW({}, i), {
                                ref: n,
                                children: v.isValidElement(s) ? v.cloneElement(s, void 0, u) : null
                            }))
                        }
                        return (0, c.jsx)(o, oB(oW({}, i), {
                            ref: n,
                            children: r
                        }))
                    });
                return i.displayName = "".concat(t, ".Slot"), i
            }
            oQ.displayName = "Presence";
            var o2 = Symbol("radix.slottable");

            function o3(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === o2
            }
            var o4 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r = o1("Primitive.".concat(n)),
                    o = v.forwardRef(function(t, o) {
                        var i = t.asChild,
                            a = oV(t, ["asChild"]),
                            l = i ? r : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, c.jsx)(l, oB(oW({}, a), {
                            ref: o
                        }))
                    });
                return o.displayName = "Primitive.".concat(n), oB(oW({}, t), oz({}, n, o))
            }, {});

            function o5(t) {
                var n = v.useRef(t);
                return v.useEffect(function() {
                    n.current = t
                }), v.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(oH(o)))
                    }
                }, [])
            }
            var o8 = "Popover",
                o6 = oG(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return v.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return v.useMemo(function() {
                                    return oz({}, "__scope".concat(t), oB(oW({}, r), oz({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var i = v.createContext(o),
                            a = r.length;
                        r = oH(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                s = oV(n, ["scope", "children"]),
                                u = (null == o || null == (r = o[t]) ? void 0 : r[a]) || i,
                                f = v.useMemo(function() {
                                    return s
                                }, Object.values(s));
                            return (0, c.jsx)(u.Provider, {
                                value: f,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var s, u = (null == l || null == (s = l[t]) ? void 0 : s[a]) || i,
                                c = v.useContext(u);
                            if (c) return c;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, oY.apply(void 0, [o].concat(oH(n)))]
                }(o8, [ox]), 2),
                o7 = o6[0],
                o9 = (o6[1], ox()),
                ie = oG(o7(o8), 2),
                it = ie[0],
                ir = ie[1],
                io = function(t) {
                    var n, r, o, i, a, l, s, u, f, d, p, h, m, y, b, g, w, x, O, E, S, C, j = t.__scopePopover,
                        P = t.children,
                        I = t.open,
                        A = t.defaultOpen,
                        R = t.onOpenChange,
                        N = t.modal,
                        k = o9(j),
                        T = v.useRef(null),
                        _ = oG(v.useState(!1), 2),
                        D = _[0],
                        L = _[1],
                        M = oG((r = (n = {
                            prop: I,
                            defaultProp: A,
                            onChange: R
                        }).prop, m = (h = oG((l = (a = {
                            defaultProp: n.defaultProp,
                            onChange: i = void 0 === (o = n.onChange) ? function() {} : o
                        }).defaultProp, s = a.onChange, f = oG(u = v.useState(l), 1)[0], d = v.useRef(f), p = o5(s), v.useEffect(function() {
                            d.current !== f && (p(f), d.current = f)
                        }, [f, d, p]), u), 2))[0], y = h[1], g = (b = void 0 !== r) ? r : m, w = o5(i), [g, v.useCallback(function(t) {
                            if (b) {
                                var n = "function" == typeof t ? t(r) : t;
                                n !== r && w(n)
                            } else y(t)
                        }, [b, r, y, w])]), 2),
                        F = M[0],
                        U = M[1];
                    return (0, c.jsx)(oC, oB(oW({}, k), {
                        children: (0, c.jsx)(it, {
                            scope: j,
                            contentId: (S = (O = v.useState(nk()), E = function(t) {
                                if (Array.isArray(t)) return t
                            }(O) || function(t, n) {
                                var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                                if (null != i) {
                                    var a = [],
                                        l = !0,
                                        s = !1;
                                    try {
                                        for (i = i.call(t); !(l = (r = i.next()).done) && (a.push(r.value), a.length !== n); l = !0);
                                    } catch (t) {
                                        s = !0, o = t
                                    } finally {
                                        try {
                                            l || null == i.return || i.return()
                                        } finally {
                                            if (s) throw o
                                        }
                                    }
                                    return a
                                }
                            }(O, 2) || function(t, n) {
                                if (t) {
                                    if ("string" == typeof t) return nR(t, 2);
                                    var r = Object.prototype.toString.call(t).slice(8, -1);
                                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nR(t, n)
                                }
                            }(O, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0], C = E[1], nN(function() {
                                C(function(t) {
                                    return null != t ? t : String(nT++)
                                })
                            }, [x]), x || (S ? "radix-".concat(S) : "")),
                            triggerRef: T,
                            open: void 0 !== F && F,
                            onOpenChange: U,
                            onOpenToggle: v.useCallback(function() {
                                return U(function(t) {
                                    return !t
                                })
                            }, [U]),
                            hasCustomAnchor: D,
                            onCustomAnchorAdd: v.useCallback(function() {
                                return L(!0)
                            }, []),
                            onCustomAnchorRemove: v.useCallback(function() {
                                return L(!1)
                            }, []),
                            modal: void 0 !== N && N,
                            children: P
                        })
                    }))
                };
            io.displayName = o8;
            var ii = "PopoverAnchor",
                ia = v.forwardRef(function(t, n) {
                    var r = t.__scopePopover,
                        o = oV(t, ["__scopePopover"]),
                        i = ir(ii, r),
                        a = o9(r),
                        l = i.onCustomAnchorAdd,
                        s = i.onCustomAnchorRemove;
                    return v.useEffect(function() {
                        return l(),
                            function() {
                                return s()
                            }
                    }, [l, s]), (0, c.jsx)(oP, oB(oW({}, a, o), {
                        ref: n
                    }))
                });
            ia.displayName = ii;
            var il = "PopoverTrigger";
            v.forwardRef(function(t, n) {
                var r = t.__scopePopover,
                    o = oV(t, ["__scopePopover"]),
                    i = ir(il, r),
                    a = o9(r),
                    l = oK(n, i.triggerRef),
                    s = (0, c.jsx)(o4.button, oB(oW({
                        type: "button",
                        "aria-haspopup": "dialog",
                        "aria-expanded": i.open,
                        "aria-controls": i.contentId,
                        "data-state": ix(i.open)
                    }, o), {
                        ref: l,
                        onClick: oX(t.onClick, i.onOpenToggle)
                    }));
                return i.hasCustomAnchor ? s : (0, c.jsx)(oP, oB(oW({
                    asChild: !0
                }, a), {
                    children: s
                }))
            }).displayName = il;
            var is = "PopoverPortal",
                iu = oG(o7(is, {
                    forceMount: void 0
                }), 2),
                ic = iu[0],
                id = iu[1],
                ip = function(t) {
                    var n = t.__scopePopover,
                        r = t.forceMount,
                        o = t.children,
                        i = t.container,
                        a = ir(is, n);
                    return (0, c.jsx)(ic, {
                        scope: n,
                        forceMount: r,
                        children: (0, c.jsx)(oQ, {
                            present: r || a.open,
                            children: (0, c.jsx)(tH, {
                                asChild: !0,
                                container: i,
                                children: o
                            })
                        })
                    })
                };
            ip.displayName = is;
            var ih = "PopoverContent",
                iv = v.forwardRef(function(t, n) {
                    var r = id(ih, t.__scopePopover),
                        o = t.forceMount,
                        i = void 0 === o ? r.forceMount : o,
                        a = oV(t, ["forceMount"]),
                        l = ir(ih, t.__scopePopover);
                    return (0, c.jsx)(oQ, {
                        present: i || l.open,
                        children: l.modal ? (0, c.jsx)(iy, oB(oW({}, a), {
                            ref: n
                        })) : (0, c.jsx)(ib, oB(oW({}, a), {
                            ref: n
                        }))
                    })
                });
            iv.displayName = ih;
            var im = o1("PopoverContent.RemoveScroll"),
                iy = v.forwardRef(function(t, n) {
                    var r = ir(ih, t.__scopePopover),
                        o = v.useRef(null),
                        i = oK(n, o),
                        a = v.useRef(!1);
                    return v.useEffect(function() {
                        var t = o.current;
                        if (t) return tZ(t)
                    }, []), (0, c.jsx)(nA, {
                        as: im,
                        allowPinchZoom: !0,
                        children: (0, c.jsx)(ig, oB(oW({}, t), {
                            ref: i,
                            trapFocus: r.open,
                            disableOutsidePointerEvents: !0,
                            onCloseAutoFocus: oX(t.onCloseAutoFocus, function(t) {
                                var n;
                                t.preventDefault(), a.current || null == (n = r.triggerRef.current) || n.focus()
                            }),
                            onPointerDownOutside: oX(t.onPointerDownOutside, function(t) {
                                var n = t.detail.originalEvent,
                                    r = 0 === n.button && !0 === n.ctrlKey;
                                a.current = 2 === n.button || r
                            }, {
                                checkForDefaultPrevented: !1
                            }),
                            onFocusOutside: oX(t.onFocusOutside, function(t) {
                                return t.preventDefault()
                            }, {
                                checkForDefaultPrevented: !1
                            })
                        }))
                    })
                }),
                ib = v.forwardRef(function(t, n) {
                    var r = ir(ih, t.__scopePopover),
                        o = v.useRef(!1),
                        i = v.useRef(!1);
                    return (0, c.jsx)(ig, oB(oW({}, t), {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(n) {
                            var a, l;
                            null == (a = t.onCloseAutoFocus) || a.call(t, n), n.defaultPrevented || (o.current || null == (l = r.triggerRef.current) || l.focus(), n.preventDefault()), o.current = !1, i.current = !1
                        },
                        onInteractOutside: function(n) {
                            null == (a = t.onInteractOutside) || a.call(t, n), n.defaultPrevented || (o.current = !0, "pointerdown" === n.detail.originalEvent.type && (i.current = !0));
                            var a, l, s = n.target;
                            (null == (l = r.triggerRef.current) ? void 0 : l.contains(s)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && i.current && n.preventDefault()
                        }
                    }))
                }),
                ig = v.forwardRef(function(t, n) {
                    var r = t.__scopePopover,
                        o = t.trapFocus,
                        i = t.onOpenAutoFocus,
                        a = t.onCloseAutoFocus,
                        l = t.disableOutsidePointerEvents,
                        s = t.onEscapeKeyDown,
                        u = t.onPointerDownOutside,
                        f = t.onFocusOutside,
                        d = t.onInteractOutside,
                        p = oV(t, ["__scopePopover", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus", "disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside"]),
                        h = ir(ih, r),
                        m = o9(r);
                    return v.useEffect(function() {
                        var t, n, r = document.querySelectorAll("[data-radix-focus-guard]");
                        return document.body.insertAdjacentElement("afterbegin", null != (t = r[0]) ? t : tS()), document.body.insertAdjacentElement("beforeend", null != (n = r[1]) ? n : tS()), tE++,
                            function() {
                                1 === tE && document.querySelectorAll("[data-radix-focus-guard]").forEach(function(t) {
                                    return t.remove()
                                }), tE--
                            }
                    }, []), (0, c.jsx)(t_, {
                        asChild: !0,
                        loop: !0,
                        trapped: o,
                        onMountAutoFocus: i,
                        onUnmountAutoFocus: a,
                        children: (0, c.jsx)(tw, {
                            asChild: !0,
                            disableOutsidePointerEvents: l,
                            onInteractOutside: d,
                            onEscapeKeyDown: s,
                            onPointerDownOutside: u,
                            onFocusOutside: f,
                            onDismiss: function() {
                                return h.onOpenChange(!1)
                            },
                            children: (0, c.jsx)(ok, oB(oW({
                                "data-state": ix(h.open),
                                role: "dialog",
                                id: h.contentId
                            }, m, p), {
                                ref: n,
                                style: oB(oW({}, p.style), {
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
                iw = "PopoverClose";

            function ix(t) {
                return t ? "open" : "closed"
            }
            v.forwardRef(function(t, n) {
                var r = t.__scopePopover,
                    o = oV(t, ["__scopePopover"]),
                    i = ir(iw, r);
                return (0, c.jsx)(o4.button, oB(oW({
                    type: "button"
                }, o), {
                    ref: n,
                    onClick: oX(t.onClick, function() {
                        return i.onOpenChange(!1)
                    })
                }))
            }).displayName = iw, v.forwardRef(function(t, n) {
                var r = t.__scopePopover,
                    o = oV(t, ["__scopePopover"]),
                    i = o9(r);
                return (0, c.jsx)(oD, oB(oW({}, i, o), {
                    ref: n
                }))
            }).displayName = "PopoverArrow", eO(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.focus-within\\:stroke-system-emphasis:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.focus-within\\:stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}");
            var iO = function(t) {
                var n, r, o, i, a = null != (o = null == (r = null == (n = window.matchMedia) ? void 0 : n.call(window, "(pointer: coarse)")) ? void 0 : r.matches) && o,
                    l = null == (i = document.activeElement) ? void 0 : i.matches(":focus-visible");
                if (a && !l) return void t.preventDefault();
                var s = t.currentTarget,
                    u = null == s ? void 0 : s.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
                u && (t.preventDefault(), u.focus())
            };

            function iE(t) {
                var n = t.open,
                    r = t.defaultOpen,
                    o = t.onOpenChange,
                    i = t.children;
                return v.createElement(io, {
                    open: n,
                    defaultOpen: r,
                    onOpenChange: o
                }, i)
            }

            function iS(t) {
                var n = t.side,
                    r = t.align,
                    o = t.sideOffset,
                    i = t.className,
                    a = t.children,
                    l = t.ariaLabel,
                    s = t.onOpenAutoFocus,
                    u = K(t, ["side", "align", "sideOffset", "className", "children", "ariaLabel", "onOpenAutoFocus"]);
                return v.createElement(ip, null, v.createElement(iv, Object.assign({
                    side: void 0 === n ? "bottom" : n,
                    align: void 0 === r ? "center" : r,
                    sideOffset: void 0 === o ? 4 : o
                }, u, {
                    "aria-label": null != l ? l : u["aria-label"],
                    onOpenAutoFocus: null != s ? s : iO,
                    className: Y("foundation-web-portal-zindex", i)
                }), a))
            }

            function iC(t) {
                var n = t.asChild,
                    r = t.className,
                    o = t.children;
                return v.createElement(ia, {
                    asChild: n,
                    className: r
                }, o)
            }

            function ij(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            var iP = function(t) {
                    var n, r = t.trigger,
                        o = t.content,
                        i = t.dropdownWidth,
                        a = t.ariaLabel,
                        l = (n = (0, v.useState)(!1), function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, n) {
                            var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != i) {
                                var a = [],
                                    l = !0,
                                    s = !1;
                                try {
                                    for (i = i.call(t); !(l = (r = i.next()).done) && (a.push(r.value), a.length !== n); l = !0);
                                } catch (t) {
                                    s = !0, o = t
                                } finally {
                                    try {
                                        l || null == i.return || i.return()
                                    } finally {
                                        if (s) throw o
                                    }
                                }
                                return a
                            }
                        }(n, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return ij(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ij(t, n)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        s = l[0],
                        u = l[1],
                        f = (0, v.useRef)(null),
                        d = (0, v.useRef)(null),
                        p = (0, v.useCallback)(function() {
                            u(!0)
                        }, []),
                        h = (0, v.useCallback)(function(t) {
                            var n, r, o, i, a = t.relatedTarget;
                            null == a ? u(!1) : null != (o = null == (n = f.current) ? void 0 : n.contains(a)) && o || null != (i = null == (r = d.current) ? void 0 : r.contains(a)) && i || u(!1)
                        }, []);
                    return (0, c.jsxs)(iE, {
                        open: s,
                        onOpenChange: u,
                        children: [(0, c.jsx)(iC, {
                            asChild: !0,
                            children: (0, c.jsx)("div", {
                                ref: f,
                                onMouseEnter: p,
                                onMouseLeave: h,
                                children: r
                            })
                        }), (0, c.jsx)(iS, {
                            side: "bottom",
                            align: "center",
                            sideOffset: 0,
                            collisionPadding: 24,
                            ariaLabel: a,
                            onOpenAutoFocus: function(t) {
                                t.preventDefault()
                            },
                            children: (0, c.jsx)("div", {
                                ref: d,
                                style: {
                                    width: i
                                },
                                onMouseEnter: p,
                                onMouseLeave: h,
                                children: o
                            })
                        })]
                    })
                },
                iI = window.Roblox["core-scripts"].eventStream,
                iA = function(t, n, r) {
                    return n ? tc.InGame : t && "Studio" === r ? tc.InStudio : t ? tc.Online : tc.Offline
                };

            function iR(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }
            var iN = function(t, n, r, o, i, a, l, s) {
                    var u = arguments.length > 8 && void 0 !== arguments[8] ? arguments[8] : "OpenProfile",
                        c = (0, v.useCallback)(function() {
                            var c, f;
                            return iR(f = {}, ts.Context, o), iR(f, ts.ContentType, tu.User), iR(f, ts.CollectionId, a), iR(f, ts.CollectionPosition, void 0 !== l ? l + 1 : -1), iR(f, th.TotalNumberOfItems, s), iR(f, th.ActionType, u), iR(f, th.ItemId, t.id.toString()), iR(f, th.ItemPosition, n + 1), iR(f, th.PositionInTopic, n + 1), iR(f, th.RowNumber, 1), iR(f, tv.Presence, iA(t.presence.isOnline, t.presence.isInGame, t.presence.lastLocation)), iR(f, tv.PresenceUniverseId, null != (c = t.presence.universeId) ? c : -1), iR(f, tv.FriendStatus, "friend"), iR(f, tv.SourceCarousel, r), iR(f, tl.HomePageSessionInfo, i), f
                        }, [t, n, i, a, l, r, o, s, u]);
                    return (0, v.useCallback)(function() {
                        var t = c();
                        (0, iI.sendEvent)({
                            name: ti.ItemAction,
                            type: ti.ItemAction,
                            context: o
                        }, E(function(t) {
                            for (var n = 1; n < arguments.length; n++) {
                                var r = null != arguments[n] ? arguments[n] : {},
                                    o = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                                    return Object.getOwnPropertyDescriptor(r, t).enumerable
                                }))), o.forEach(function(n) {
                                    iR(t, n, r[n])
                                })
                            }
                            return t
                        }({}, t)))
                    }, [c, o])
                },
                ik = function(t) {
                    var n, r, o, i = t.friend,
                        a = t.friendIndex,
                        l = t.isOwnUser,
                        s = t.translate,
                        u = t.canChat,
                        f = t.carouselName,
                        d = t.eventContext,
                        p = t.homePageSessionInfo,
                        h = t.sortId,
                        v = t.sortPosition,
                        m = t.totalNumberOfFriends,
                        y = t.isIARCJoinCardRedesignEnabled,
                        b = t.isIARCJoinCardGameRowClickableEnabled,
                        g = "".concat(N().websiteUrl, "/users/").concat(i.id, "/profile"),
                        w = null != (n = i.combinedName) ? n : s("Label.UnavailableFriendName"),
                        x = V().usePresence(i.id, void 0),
                        O = null != x.gameId,
                        E = O ? x.lastLocation : null,
                        S = null != E && E.length > 15 ? "".concat(E.slice(0, 15), "...") : E,
                        C = O ? "".concat(N().websiteUrl, "/games/").concat(null != (r = x.placeId) ? r : "") : "",
                        j = iN(i, a, f, d, p, h, v, m),
                        P = iN(i, a, f, d, p, h, v, m, "OpenGameDetails");
                    return (0, c.jsx)("div", {
                        className: "friends-carousel-tile",
                        children: (0, c.jsx)(iP, {
                            ariaLabel: w,
                            trigger: (0, c.jsx)("button", {
                                type: "button",
                                className: "options-dropdown",
                                id: "friend-tile-button",
                                onClick: function() {},
                                children: (0, c.jsx)(eo, {
                                    id: i.id,
                                    displayName: w,
                                    userProfileUrl: g,
                                    userPresence: S,
                                    translate: s,
                                    hasVerifiedBadge: i.hasVerifiedBadge,
                                    isRobloxPlus: i.isRobloxPlus,
                                    sendClickEvent: j
                                })
                            }),
                            content: l ? (0, c.jsx)(eD, {
                                friend: i,
                                isInGame: O,
                                universeId: null != (o = x.universeId) ? o : 0,
                                displayName: w,
                                userProfileUrl: g,
                                userPresence: E,
                                translate: s,
                                gameUrl: C,
                                canChat: u,
                                isIARCJoinCardRedesignEnabled: y,
                                isIARCJoinCardGameRowClickableEnabled: b,
                                sendGameRowClickEvent: P
                            }) : (0, c.jsx)("div", {}),
                            dropdownWidth: null == S ? 240 : y ? 260 : 315
                        })
                    })
                };

            function iT(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }
            var i_ = function(t, n, r, o, i, a, l) {
                    var s, u = (0, v.useCallback)(function(t) {
                            if (n) {
                                var s, u = t.filter(function(t) {
                                    return t < n.length
                                });
                                return iT(s = {}, ts.Context, o), iT(s, ts.ContentType, tu.User), iT(s, ts.CollectionId, a), iT(s, ts.CollectionPosition, void 0 !== l ? l + 1 : -1), iT(s, td.TotalNumberOfItems, n.length), iT(s, td.ItemIds, u.map(function(t) {
                                    var r, o;
                                    return null != (o = null == (r = n[t]) ? void 0 : r.id.toString()) ? o : "-1"
                                })), iT(s, td.ItemPositions, u.map(function(t) {
                                    return t + 1
                                })), iT(s, td.PositionsInTopic, u.map(function(t) {
                                    return t + 1
                                })), iT(s, td.RowNumbers, u.map(function() {
                                    return 1
                                })), iT(s, tp.Presences, u.map(function(t) {
                                    var r, o, i;
                                    return iA(null == (r = n[t]) ? void 0 : r.presence.isOnline, null == (o = n[t]) ? void 0 : o.presence.isInGame, null == (i = n[t]) ? void 0 : i.presence.lastLocation)
                                })), iT(s, tp.PresenceUniverseIds, u.map(function(t) {
                                    var r, o;
                                    return null != (o = null == (r = n[t]) ? void 0 : r.presence.universeId) ? o : -1
                                })), iT(s, tp.FriendStatuses, u.map(function() {
                                    return tf.Friend
                                })), iT(s, tp.SourceCarousel, r), iT(s, tl.HomePageSessionInfo, i), s
                            }
                        }, [n, i, a, l, r, o]),
                        c = (0, v.useCallback)(function(t) {
                            var n, r = u(t);
                            void 0 !== r ? (0, iI.sendEvent)({
                                name: ti.ItemImpressions,
                                type: ti.ItemImpressions,
                                context: o
                            }, E(function(t) {
                                for (var n = 1; n < arguments.length; n++) {
                                    var r = null != arguments[n] ? arguments[n] : {},
                                        o = Object.keys(r);
                                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                                    }))), o.forEach(function(n) {
                                        iT(t, n, r[n])
                                    })
                                }
                                return t
                            }({}, r))) : null == (n = window.EventTracker) || n.fireEvent("WebHomePageFriendsCarouselItemImpressionsUndefinedError")
                        }, [u, o]);
                    x(t, null != (s = null == n ? void 0 : n.length) ? s : 0, c)
                },
                iD = ((t = iD || {}).WebHomeFriendsCarousel = "WebHomeFriendsCarousel", t.WebProfileFriendsCarousel = "WebProfileFriendsCarousel", t);

            function iL(t, n) {
                var r = {};
                for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && 0 > n.indexOf(o) && (r[o] = t[o]);
                if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
                    var i = 0;
                    for (o = Object.getOwnPropertySymbols(t); i < o.length; i++) 0 > n.indexOf(o[i]) && Object.prototype.propertyIsEnumerable.call(t, o[i]) && (r[o[i]] = t[o[i]])
                }
                return r
            }
            var iM = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                iF = m().forwardRef(function(t, n) {
                    var r = t.name,
                        o = t.size,
                        i = t.className,
                        a = (t.children, iL(t, ["name", "size", "className", "children"]));
                    return m().createElement("span", Object.assign({
                        ref: n,
                        role: "presentation",
                        className: Y("grow-0 shrink-0 basis-auto icon", r, iM[void 0 === o ? "Medium" : o], i)
                    }, a))
                });
            iF.displayName = "Icon";
            var iU = {
                    Neutral: "bg-shift-300",
                    Standard: "bg-shift-300",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-system-success",
                    Warning: "bg-system-warning",
                    Alert: "bg-system-alert",
                    OverMedia: "bg-[var(--light-mode-surface-100)]"
                },
                iz = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-[var(--light-mode-content-emphasis)]",
                    Warning: "content-[var(--light-mode-content-emphasis)]",
                    Alert: "content-[var(--dark-mode-content-emphasis)]",
                    OverMedia: "content-[var(--light-mode-content-emphasis)]"
                },
                iW = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-standard"
                },
                iB = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                iV = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                iG = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                iH = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                iJ = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                iX = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                i$ = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                iq = m().forwardRef(function(t, n) {
                    var r = t.className,
                        o = t.label,
                        i = t.variant,
                        a = void 0 === i ? "Neutral" : i,
                        l = t.icon,
                        s = t.size,
                        u = void 0 === s ? "Small" : s,
                        c = t.shape,
                        f = iL(t, ["className", "label", "variant", "icon", "size", "shape"]),
                        d = l && !o;
                    return m().createElement("div", Object.assign({
                        ref: n
                    }, f, {
                        className: Y("foundation-web-badge flex items-center select-none gap-xsmall", i$[void 0 === c ? "Pill" : c], iB[u], d ? [iG[u], "justify-center"] : ["width-[fit-content]", iV[u]], iU[a], iz[a], iW[a], r),
                        style: "OverMedia" === a ? {
                            borderColor: "var(--light-mode-stroke-default)"
                        } : void 0
                    }), l && m().createElement(iF, {
                        name: l,
                        size: iX[u]
                    }), o && m().createElement("span", {
                        className: Y("text-no-wrap text-truncate-split", iH[u], iJ[u], iz[a])
                    }, o))
                });
            iq.displayName = "Badge";
            var iK = function(t) {
                var n = t.translate,
                    r = t.badgeCount;
                return (0, c.jsx)("div", {
                    className: "friends-carousel-tile",
                    children: (0, c.jsx)("button", {
                        type: "button",
                        id: "friend-tile-button",
                        children: (0, c.jsxs)("a", {
                            href: "/users/friends#!/friend-requests",
                            children: [(0, c.jsxs)("div", {
                                className: "add-friends-icon-container",
                                children: [r > 0 && (0, c.jsx)(iq, {
                                    className: "friend-request-badge",
                                    variant: "Alert",
                                    label: r > 99 ? "99+" : String(r)
                                }), (0, c.jsx)(Q, {
                                    className: "add-friends-icon content-secondary",
                                    name: "icon-filled-plus-large",
                                    size: "XLarge"
                                })]
                            }), (0, c.jsx)("div", {
                                className: "friends-carousel-tile-labels",
                                "data-testid": "friends-carousel-tile-labels",
                                children: (0, c.jsx)("div", {
                                    className: "friends-carousel-tile-label",
                                    children: (0, c.jsx)("div", {
                                        className: "friends-carousel-tile-name",
                                        children: (0, c.jsx)("span", {
                                            className: "friends-carousel-display-name",
                                            children: n("Label.AddFriends")
                                        })
                                    })
                                })
                            })]
                        })
                    })
                })
            };

            function iY(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function iZ(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            l = !0,
                            s = !1;
                        try {
                            for (i = i.call(t); !(l = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); l = !0);
                        } catch (t) {
                            s = !0, o = t
                        } finally {
                            try {
                                l || null == i.return || i.return()
                            } finally {
                                if (s) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return iY(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iY(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iQ = function(t) {
                    var n, r = t.friendsList,
                        o = t.isOwnUser,
                        i = t.translate,
                        a = t.canChat,
                        l = t.carouselName,
                        s = t.eventContext,
                        u = t.homePageSessionInfo,
                        f = t.sortId,
                        d = t.sortPosition,
                        p = t.badgeCount,
                        h = t.isAddFriendsTileEnabled,
                        m = t.isIARCJoinCardRedesignEnabled,
                        y = t.isIARCJoinCardGameRowClickableEnabled,
                        b = (0, v.useRef)(null),
                        g = iZ((0, v.useState)(r), 2),
                        w = g[0],
                        x = g[1],
                        O = iZ((0, v.useState)(!1), 2),
                        E = O[0],
                        S = O[1],
                        C = (0, v.useRef)(null);
                    return (0, v.useEffect)(function() {
                        var t, n, o = null == (t = b.current) ? void 0 : t.offsetWidth,
                            i = null != (n = null == r ? void 0 : r.length) ? n : 0;
                        if (null != o && null != r) {
                            var a = Math.floor(o / 110);
                            S(110 * (h ? i + 1 : i) > o), x(r.slice(0, a - !!h))
                        }
                    }, [null == (n = b.current) ? void 0 : n.offsetWidth, r, h]), i_(C, r, l, s, u, f, d), (0, c.jsx)("div", {
                        children: (0, c.jsx)("div", {
                            ref: function(t) {
                                return b.current = t, b.current
                            },
                            className: "friends-carousel-container",
                            children: null == w ? (0, c.jsx)("span", {
                                className: "spinner spinner-default"
                            }) : (0, c.jsxs)("div", {
                                ref: C,
                                className: E ? "friends-carousel-list-container" : "friends-carousel-list-container-not-full",
                                children: [l === iD.WebHomeFriendsCarousel && h ? (0, c.jsx)(iK, {
                                    translate: i,
                                    badgeCount: p,
                                    "data-testid": "add-friends-tile"
                                }, "add-friends-tile") : null, w.map(function(t, n) {
                                    var p;
                                    return (0, c.jsx)("div", {
                                        children: (0, c.jsx)(ik, {
                                            friend: t,
                                            friendIndex: n,
                                            translate: i,
                                            isOwnUser: o,
                                            canChat: a,
                                            carouselName: l,
                                            eventContext: s,
                                            homePageSessionInfo: u,
                                            sortId: f,
                                            sortPosition: d,
                                            totalNumberOfFriends: null != (p = null == r ? void 0 : r.length) ? p : 0,
                                            isIARCJoinCardRedesignEnabled: m,
                                            isIARCJoinCardGameRowClickableEnabled: y
                                        })
                                    }, t.id)
                                })]
                            })
                        })
                    })
                },
                i0 = window.Roblox["core-scripts"].meta.user;

            function i1(t, n, r, o, i, a, l) {
                try {
                    var s = t[a](l),
                        u = s.value
                } catch (t) {
                    r(t);
                    return
                }
                s.done ? n(u) : Promise.resolve(u).then(o, i)
            }
            var i2 = N().apiGatewayUrl,
                i3 = function(t) {
                    var n;
                    return (n = function() {
                        var n, r;
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return l.next = s(0), l.throw = s(1), l.return = s(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                return this
                            }), l;

                            function s(s) {
                                return function(u) {
                                    var c = [s, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; l && (l = 0, c[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & c[0] ? o.return : c[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, c[1])).done) return i;
                                        switch (o = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                i = c;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                    a.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && a.label < i[1]) {
                                                    a.label = i[1], i = c;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(c);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        c = n.call(t, a)
                                    } catch (t) {
                                        c = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    if (null == (r = null == (n = (0, i0.authenticatedUser)()) ? void 0 : n.id)) return [2, {
                                        users: [{
                                            isBlocked: !1,
                                            isBlockingViewer: !1,
                                            userId: 0
                                        }]
                                    }];
                                    return [4, k.post({
                                        url: "".concat(i2, "/user-blocking-api/v1/users/batch-check-reciprocal-block"),
                                        withCredentials: !0
                                    }, {
                                        userIds: t,
                                        requesterId: r
                                    })];
                                case 1:
                                    return [2, o.sent().data]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(o, i) {
                            var a = n.apply(t, r);

                            function l(t) {
                                i1(a, o, i, l, s, "next", t)
                            }

                            function s(t) {
                                i1(a, o, i, l, s, "throw", t)
                            }
                            l(void 0)
                        })
                    })()
                };

            function i4(t, n, r, o, i, a, l) {
                try {
                    var s = t[a](l),
                        u = s.value
                } catch (t) {
                    r(t);
                    return
                }
                s.done ? n(u) : Promise.resolve(u).then(o, i)
            }
            var i5 = function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null,
                        r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(N().apiGatewayUrl, "/access-management/v1/upsell-feature-access?featureName=").concat(t).concat(n ? "&extraParameters=".concat(n) : "").concat(r ? "&successfulActions=".concat(r) : "")
                    }
                },
                i8 = function(t, n, r) {
                    var o;
                    return (o = function() {
                        var o;
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return l.next = s(0), l.throw = s(1), l.return = s(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                return this
                            }), l;

                            function s(s) {
                                return function(u) {
                                    var c = [s, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; l && (l = 0, c[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & c[0] ? o.return : c[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, c[1])).done) return i;
                                        switch (o = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                i = c;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                    a.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && a.label < i[1]) {
                                                    a.label = i[1], i = c;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(c);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        c = n.call(t, a)
                                    } catch (t) {
                                        c = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return o = i5(t, n ? btoa(JSON.stringify(n)) : null, r), [4, k.get(o)];
                                case 1:
                                    return [2, i.sent().data]
                            }
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(r, i) {
                            var a = o.apply(t, n);

                            function l(t) {
                                i4(a, r, i, l, s, "next", t)
                            }

                            function s(t) {
                                i4(a, r, i, l, s, "throw", t)
                            }
                            l(void 0)
                        })
                    })()
                };

            function i6(t, n, r, o, i, a, l) {
                try {
                    var s = t[a](l),
                        u = s.value
                } catch (t) {
                    r(t);
                    return
                }
                s.done ? n(u) : Promise.resolve(u).then(o, i)
            }

            function i7(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, i) {
                        var a = t.apply(n, r);

                        function l(t) {
                            i6(a, o, i, l, s, "next", t)
                        }

                        function s(t) {
                            i6(a, o, i, l, s, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function i9(t, n) {
                var r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = s(0), l.throw = s(1), l.return = s(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function s(s) {
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, o && (i = 2 & c[0] ? o.return : c[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, c[1])).done) return i;
                            switch (o = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, o = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = n.call(t, a)
                        } catch (t) {
                            c = [6, t], o = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function ae(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function at(t, n, r, o, i, a, l) {
                try {
                    var s = t[a](l),
                        u = s.value
                } catch (t) {
                    r(t);
                    return
                }
                s.done ? n(u) : Promise.resolve(u).then(o, i)
            }

            function an(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, i) {
                        var a = t.apply(n, r);

                        function l(t) {
                            at(a, o, i, l, s, "next", t)
                        }

                        function s(t) {
                            at(a, o, i, l, s, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function ar(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            l = !0,
                            s = !1;
                        try {
                            for (i = i.call(t); !(l = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); l = !0);
                        } catch (t) {
                            s = !0, o = t
                        } finally {
                            try {
                                l || null == i.return || i.return()
                            } finally {
                                if (s) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return ae(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ae(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ao(t, n) {
                var r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = s(0), l.throw = s(1), l.return = s(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function s(s) {
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, o && (i = 2 & c[0] ? o.return : c[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, c[1])).done) return i;
                            switch (o = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, o = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = n.call(t, a)
                        } catch (t) {
                            c = [6, t], o = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ai = "FriendshipNotifications",
                aa = "fulfilled",
                al = A().userDataStore,
                as = function(t) {
                    var n = t.profileUserId,
                        r = t.isOwnUser,
                        o = t.carouselName,
                        i = t.eventContext,
                        a = t.homePageSessionInfo,
                        l = t.sortId,
                        s = t.sortPosition,
                        u = ar((0, v.useState)(null), 2),
                        f = u[0],
                        d = u[1],
                        h = ar((0, v.useState)(null), 2),
                        m = h[0],
                        y = h[1],
                        b = ar((0, v.useState)(!1), 2),
                        g = b[0],
                        w = b[1],
                        x = ar((0, v.useState)(null), 2),
                        O = x[0],
                        E = x[1],
                        S = ar((0, v.useState)(!1), 2),
                        j = S[0],
                        I = S[1],
                        A = ar((0, v.useState)({
                            isBadgeEnabled: !1,
                            isAddFriendsTileEnabledWeb: !1,
                            isIARCJoinCardRedesignEnabled: !1,
                            isIARCJoinCardGameRowClickableEnabled: !1
                        }), 2),
                        R = A[0],
                        T = A[1],
                        _ = (0, p.useTranslation)().translate;
                    return (0, v.useEffect)(function() {
                        al.clearUserDataStoreCache()
                    }, []), (0, v.useEffect)(function() {
                        if (j) {
                            var t = function() {
                                    return an(function() {
                                        return ao(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return t.trys.push([0, 2, , 3]), [4, F()];
                                                case 1:
                                                    return E(t.sent()), [3, 3];
                                                case 2:
                                                    return console.error("Error fetching friend request count:", t.sent()), [3, 3];
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                n = P().GetClient();
                            return n.Subscribe(ai, t),
                                function() {
                                    n.Unsubscribe(ai, t)
                                }
                        }
                    }, [j]), (0, v.useEffect)(function() {
                        an(function() {
                            var t, i, a, l, s, u, c, f, p, h, v, m, b;
                            return ao(this, function(g) {
                                var x;
                                switch (g.label) {
                                    case 0:
                                        return [4, Promise.allSettled([D(function() {
                                            var t;
                                            return M(this, function(r) {
                                                switch (r.label) {
                                                    case 0:
                                                        return t = {
                                                            url: "".concat(N().friendsApi, "/v1/users/").concat(n, "/friends/count"),
                                                            retryable: !0,
                                                            withCredentials: !0
                                                        }, [4, k.get(t)];
                                                    case 1:
                                                        return [2, r.sent().data]
                                                }
                                            })
                                        })(), D(function() {
                                            var t, o, i, a, l, s, u, c, f, d, p, h, v, m, y;
                                            return M(this, function(b) {
                                                var g;
                                                switch (b.label) {
                                                    case 0:
                                                        if (!r) return [3, 2];
                                                        return [4, D(function() {
                                                            var t;
                                                            return M(this, function(r) {
                                                                switch (r.label) {
                                                                    case 0:
                                                                        return t = {
                                                                            url: "".concat(N().friendsApi, "/v1/users/").concat(n, "/friends/online"),
                                                                            retryable: !0,
                                                                            withCredentials: !0
                                                                        }, [4, k.get(t)];
                                                                    case 1:
                                                                        return [2, r.sent().data]
                                                                }
                                                            })
                                                        })()];
                                                    case 1:
                                                        return o = b.sent().data, [3, 3];
                                                    case 2:
                                                        o = [], b.label = 3;
                                                    case 3:
                                                        return (t = o).sort(function(t, n) {
                                                            return n.sortScore - t.sortScore
                                                        }), [4, D(function() {
                                                            var t, o;
                                                            return M(this, function(i) {
                                                                switch (i.label) {
                                                                    case 0:
                                                                        return t = "".concat(N().friendsApi, "/v1/users/").concat(n, "/friends/find"), o = {
                                                                            url: r ? "".concat(t, "?userSort=1") : t,
                                                                            retryable: !0,
                                                                            withCredentials: !0
                                                                        }, [4, k.get(o)];
                                                                    case 1:
                                                                        return [2, i.sent().data]
                                                                }
                                                            })
                                                        })()];
                                                    case 4:
                                                        i = b.sent().PageItems, a = new Map, l = !0, s = !1, u = void 0;
                                                        try {
                                                            for (c = t[Symbol.iterator](); !(l = (f = c.next()).done); l = !0) d = f.value, a.set(d.id, d.userPresence)
                                                        } catch (t) {
                                                            s = !0, u = t
                                                        } finally {
                                                            try {
                                                                l || null == c.return || c.return()
                                                            } finally {
                                                                if (s) throw u
                                                            }
                                                        }
                                                        return p = t.map(function(t) {
                                                            return t.id
                                                        }), h = i.filter(function(t) {
                                                            return !p.includes(t.id)
                                                        }).map(function(t) {
                                                            return t.id
                                                        }), [4, (g = v = L(p).concat(L(h)), D(function() {
                                                            var t, n;
                                                            return M(this, function(r) {
                                                                switch (r.label) {
                                                                    case 0:
                                                                        return t = {
                                                                            url: "".concat(N().apiGatewayUrl, "/user-profile-api/v1/user/profiles/get-profiles"),
                                                                            retryable: !0,
                                                                            withCredentials: !0
                                                                        }, n = {
                                                                            userIds: g,
                                                                            fields: ["names.combinedName", "isVerified", "hasRobloxSubscription"]
                                                                        }, [4, k.post(t, n)];
                                                                    case 1:
                                                                        return [2, r.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 5:
                                                        return m = new Map(b.sent().profileDetails.map(function(t) {
                                                            return [t.userId, t]
                                                        })), y = [], v.forEach(function(t) {
                                                            var n, r, o, i, l, s, u = a.has(t),
                                                                c = {
                                                                    isOnline: u,
                                                                    isInGame: u && (null == (n = a.get(t)) ? void 0 : n.UserPresenceType) === "InGame",
                                                                    lastLocation: u ? null == (r = a.get(t)) ? void 0 : r.lastLocation : void 0,
                                                                    gameId: u ? null == (o = a.get(t)) ? void 0 : o.gameInstanceId : void 0,
                                                                    universeId: u ? null == (i = a.get(t)) ? void 0 : i.universeId : void 0,
                                                                    placeId: u ? null == (l = a.get(t)) ? void 0 : l.placeId : void 0
                                                                },
                                                                f = m.get(t);
                                                            y.push({
                                                                id: t,
                                                                combinedName: null == f ? void 0 : f.names.combinedName,
                                                                presence: c,
                                                                hasVerifiedBadge: null != (s = null == f ? void 0 : f.isVerified) && s,
                                                                isRobloxPlus: (null == f ? void 0 : f.hasRobloxSubscription) === !0
                                                            })
                                                        }), [2, y]
                                                }
                                            })
                                        })(), z(), F(), an(function() {
                                            return ao(this, function(t) {
                                                switch (t.label) {
                                                    case 0:
                                                        if (r) return [2, !1];
                                                        return [4, i7(function() {
                                                            var t, r;
                                                            return i9(this, function(o) {
                                                                switch (o.label) {
                                                                    case 0:
                                                                        return o.trys.push([0, 2, , 3]), [4, i3([n])];
                                                                    case 1:
                                                                        return [2, null == (r = null == (t = o.sent().users[0]) ? void 0 : t.isBlockingViewer) || r];
                                                                    case 2:
                                                                        return console.error(o.sent()), [3, 3];
                                                                    case 3:
                                                                        return [2, !0]
                                                                }
                                                            })
                                                        })()];
                                                    case 1:
                                                        if (t.sent()) return [2, !0];
                                                        return [4, i7(function() {
                                                            return i9(this, function(t) {
                                                                switch (t.label) {
                                                                    case 0:
                                                                        return t.trys.push([0, 2, , 3]), [4, i8("MustHideConnections", [{
                                                                            name: "vieweeUserId",
                                                                            type: "UserId",
                                                                            value: "".concat(n)
                                                                        }])];
                                                                    case 1:
                                                                        return [2, "Granted" === t.sent().access];
                                                                    case 2:
                                                                        return console.error(t.sent()), [3, 3];
                                                                    case 3:
                                                                        return [2, !0]
                                                                }
                                                            })
                                                        })()];
                                                    case 2:
                                                        return [2, t.sent()]
                                                }
                                            })
                                        })(), an(function() {
                                            var t;
                                            return ao(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        return n.trys.push([0, 2, , 3]), [4, C().getAllValuesForLayer("Social.Friends")];
                                                    case 1:
                                                        return [2, {
                                                            isBadgeEnabled: !0 === (t = n.sent()).enableNewFriendRequestsBadge,
                                                            isAddFriendsTileEnabledWeb: !0 === t.enableAddFriendsTileOnWeb,
                                                            isIARCJoinCardRedesignEnabled: !0 === t.isIARCJoinCardRedesignEnabled,
                                                            isIARCJoinCardGameRowClickableEnabled: !0 === t.isIARCJoinCardGameRowClickableEnabled
                                                        }];
                                                    case 2:
                                                        return console.error("Error fetching experimentation config:", n.sent()), [2, {
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
                                        return i = (t = ar.apply(void 0, [g.sent(), 6]))[0], a = t[1], l = t[2], s = t[3], u = t[4], c = t[5], f = i.status === aa ? i.value.count : 0, p = a.status === aa ? a.value : [], h = l.status === aa && l.value.chatEnabled, v = s.status === aa ? s.value : 0, m = c.status === aa ? c.value : {
                                            isBadgeEnabled: !1,
                                            isAddFriendsTileEnabledWeb: !1,
                                            isIARCJoinCardRedesignEnabled: !1,
                                            isIARCJoinCardGameRowClickableEnabled: !1
                                        }, b = u.status !== aa || u.value, d(f), y(p), w(h), E(v), T(m), I((x = m.isAddFriendsTileEnabledWeb, !b && (o !== iD.WebHomeFriendsCarousel ? 0 !== f : 0 !== f || x && 0 !== v))), [2]
                                }
                            })
                        })().catch(function(t) {
                            console.error(t)
                        })
                    }, [n, r, o]), j ? (0, c.jsxs)("div", {
                        className: "react-friends-carousel-container",
                        children: [(0, c.jsx)(W, {
                            friendsCount: f,
                            translate: _,
                            profileUserId: n,
                            isOwnUser: r
                        }), (0, c.jsx)(iQ, {
                            badgeCount: R.isBadgeEnabled && null != O ? O : 0,
                            friendsList: m,
                            translate: _,
                            isOwnUser: r,
                            canChat: g,
                            carouselName: o,
                            eventContext: i,
                            homePageSessionInfo: a,
                            sortId: l,
                            sortPosition: s,
                            isAddFriendsTileEnabled: R.isAddFriendsTileEnabledWeb,
                            isIARCJoinCardRedesignEnabled: R.isIARCJoinCardRedesignEnabled,
                            isIARCJoinCardGameRowClickableEnabled: R.isIARCJoinCardGameRowClickableEnabled
                        })]
                    }) : (0, c.jsx)("div", {
                        className: "friends-carousel-0-friends"
                    })
                },
                au = JSON.parse('{"P":["CommonUI.Features","Feature.PeopleList","Feature.Friends","Feature.Profile","Feature.RobloxSubscription"]}');
            r(794), r(162);
            var ac = document.querySelector('meta[name="user-data"]'),
                af = parseInt(null != (u = null == ac ? void 0 : ac.getAttribute("data-userid")) ? u : "", 10),
                ad = Number.isNaN(af) ? null : af,
                ap = null != (n = null == (o = /\/users\/(\d+)\//g.exec(window.location.pathname)) ? void 0 : o[1]) ? n : null,
                ah = parseInt(null != ap ? ap : "", 10),
                av = Number.isNaN(ah) ? null : ah;
            d()(function() {
                var t = document.getElementById("friends-carousel-container");
                t && (0, p.renderWithErrorBoundary)((0, c.jsx)(h.QueryClientProvider, {
                    client: p.queryClient,
                    children: (0, c.jsx)(p.TranslationProvider, {
                        config: au.P,
                        children: (0, c.jsx)(as, {
                            profileUserId: null != av ? av : 0,
                            isOwnUser: av === ad,
                            carouselName: iD.WebProfileFriendsCarousel,
                            eventContext: ta.UserProfile,
                            homePageSessionInfo: void 0,
                            sortId: void 0,
                            sortPosition: void 0
                        })
                    })
                }), t)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("FriendsCarousel");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/friendsCarousel-33490dc7302cc093.js.map