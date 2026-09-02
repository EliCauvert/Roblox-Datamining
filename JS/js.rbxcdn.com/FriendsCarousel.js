! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "fb8716659e8090d1db803f231c2b59b8617e588c"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "c6ce8858-b6a2-4701-aff8-301c0d59107c", e._sentryDebugIdIdentifier = "sentry-dbid-c6ce8858-b6a2-4701-aff8-301c0d59107c")
    } catch (e) {}
}(),
function() {
    var e = {
            818: function() {
                ! function() {
                    "use strict";
                    var e;
                    if (("u" < typeof window ? "undefined" : (e = window) && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object") {
                        if ("IntersectionObserver" in window && "IntersectionObserverEntry" in window && "intersectionRatio" in window.IntersectionObserverEntry.prototype) {
                            "isIntersecting" in window.IntersectionObserverEntry.prototype || Object.defineProperty(window.IntersectionObserverEntry.prototype, "isIntersecting", {
                                get: function() {
                                    return this.intersectionRatio > 0
                                }
                            });
                            return
                        }
                        var t = function(e) {
                                for (var t = e, r = i(t); r;) r = i(t = r.ownerDocument);
                                return t
                            }(window.document),
                            r = [],
                            n = null,
                            o = null;
                        l.prototype.THROTTLE_TIMEOUT = 100, l.prototype.POLL_INTERVAL = null, l.prototype.USE_MUTATION_OBSERVER = !0, l._setupCrossOriginUpdater = function() {
                            return n || (n = function(e, t) {
                                o = e && t ? p(e, t) : f(), r.forEach(function(e) {
                                    e._checkForIntersections()
                                })
                            }), n
                        }, l._resetCrossOriginUpdater = function() {
                            n = null, o = null
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
                            return Array.isArray(t) || (t = [t]), t.sort().filter(function(e, t, r) {
                                if ("number" != typeof e || isNaN(e) || e < 0 || e > 1) throw Error("threshold must be a number between 0 and 1 inclusively");
                                return e !== r[t - 1]
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
                            var r = e.defaultView;
                            if (r && -1 == this._monitoringDocuments.indexOf(e)) {
                                var n = this._checkForIntersections,
                                    o = null,
                                    a = null;
                                if (this.POLL_INTERVAL ? o = r.setInterval(n, this.POLL_INTERVAL) : (c(r, "resize", n, !0), c(e, "scroll", n, !0), this.USE_MUTATION_OBSERVER && "MutationObserver" in r && (a = new r.MutationObserver(n)).observe(e, {
                                        attributes: !0,
                                        childList: !0,
                                        characterData: !0,
                                        subtree: !0
                                    })), this._monitoringDocuments.push(e), this._monitoringUnsubscribes.push(function() {
                                        var t = e.defaultView;
                                        t && (o && t.clearInterval(o), u(t, "resize", n, !0)), u(e, "scroll", n, !0), a && a.disconnect()
                                    }), e != (this.root && (this.root.ownerDocument || this.root) || t)) {
                                    var l = i(e);
                                    l && this._monitorIntersections(l.ownerDocument)
                                }
                            }
                        }, l.prototype._unmonitorIntersections = function(e) {
                            var r = this._monitoringDocuments.indexOf(e);
                            if (-1 != r) {
                                var n = this.root && (this.root.ownerDocument || this.root) || t;
                                if (!this._observationTargets.some(function(t) {
                                        var r = t.element.ownerDocument;
                                        if (r == e) return !0;
                                        for (; r && r != n;) {
                                            var o = i(r);
                                            if ((r = o && o.ownerDocument) == e) return !0
                                        }
                                        return !1
                                    })) {
                                    var o = this._monitoringUnsubscribes[r];
                                    if (this._monitoringDocuments.splice(r, 1), this._monitoringUnsubscribes.splice(r, 1), o(), e != n) {
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
                            if (this.root || !n || o) {
                                var e = this._rootIsInDom(),
                                    t = e ? this._getRootRect() : f();
                                this._observationTargets.forEach(function(r) {
                                    var o = r.element,
                                        i = s(o),
                                        l = this._rootContainsTarget(o),
                                        c = r.entry,
                                        u = e && l && this._computeTargetAndRootIntersection(o, i, t),
                                        d = null;
                                    this._rootContainsTarget(o) ? (!n || this.root) && (d = t) : d = f();
                                    var p = r.entry = new a({
                                        time: window.performance && performance.now && performance.now(),
                                        target: o,
                                        boundingClientRect: i,
                                        rootBounds: d,
                                        intersectionRect: u
                                    });
                                    c ? e && l ? this._hasCrossedThreshold(c, p) && this._queuedEntries.push(p) : c && c.isIntersecting && this._queuedEntries.push(p) : this._queuedEntries.push(p)
                                }, this), this._queuedEntries.length && this._callback(this.takeRecords(), this)
                            }
                        }, l.prototype._computeTargetAndRootIntersection = function(e, r, i) {
                            if ("none" != window.getComputedStyle(e).display) {
                                for (var a = r, l = m(e), c = !1; !c && l;) {
                                    var u = null,
                                        f = 1 == l.nodeType ? window.getComputedStyle(l) : {};
                                    if ("none" == f.display) return null;
                                    if (l == this.root || 9 == l.nodeType)
                                        if (c = !0, l == this.root || l == t) n && !this.root ? o && (0 != o.width || 0 != o.height) ? u = o : (l = null, u = null, a = null) : u = i;
                                        else {
                                            var d = m(l),
                                                y = d && s(d),
                                                b = d && this._computeTargetAndRootIntersection(d, y, i);
                                            y && b ? (l = d, u = p(y, b)) : (l = null, a = null)
                                        }
                                    else {
                                        var h = l.ownerDocument;
                                        l != h.body && l != h.documentElement && "visible" != f.overflow && (u = s(l))
                                    }
                                    if (u && (a = function(e, t) {
                                            var r = Math.max(e.top, t.top),
                                                n = Math.min(e.bottom, t.bottom),
                                                o = Math.max(e.left, t.left),
                                                i = Math.min(e.right, t.right),
                                                a = i - o,
                                                l = n - r;
                                            return a >= 0 && l >= 0 && {
                                                top: r,
                                                bottom: n,
                                                left: o,
                                                right: i,
                                                width: a,
                                                height: l
                                            } || null
                                        }(u, a)), !a) break;
                                    l = l && m(l)
                                }
                                return a
                            }
                        }, l.prototype._getRootRect = function() {
                            var e;
                            if (this.root && !b(this.root)) e = s(this.root);
                            else {
                                var r = b(this.root) ? this.root : t,
                                    n = r.documentElement,
                                    o = r.body;
                                e = {
                                    top: 0,
                                    left: 0,
                                    right: n.clientWidth || o.clientWidth,
                                    width: n.clientWidth || o.clientWidth,
                                    bottom: n.clientHeight || o.clientHeight,
                                    height: n.clientHeight || o.clientHeight
                                }
                            }
                            return this._expandRectByRootMargin(e)
                        }, l.prototype._expandRectByRootMargin = function(e) {
                            var t = this._rootMarginValues.map(function(t, r) {
                                    return "px" == t.unit ? t.value : t.value * (r % 2 ? e.width : e.height) / 100
                                }),
                                r = {
                                    top: e.top - t[0],
                                    right: e.right + t[1],
                                    bottom: e.bottom + t[2],
                                    left: e.left - t[3]
                                };
                            return r.width = r.right - r.left, r.height = r.bottom - r.top, r
                        }, l.prototype._hasCrossedThreshold = function(e, t) {
                            var r = e && e.isIntersecting ? e.intersectionRatio || 0 : -1,
                                n = t.isIntersecting ? t.intersectionRatio || 0 : -1;
                            if (r !== n)
                                for (var o = 0; o < this.thresholds.length; o++) {
                                    var i = this.thresholds[o];
                                    if (i == r || i == n || i < r != i < n) return !0
                                }
                        }, l.prototype._rootIsInDom = function() {
                            return !this.root || y(t, this.root)
                        }, l.prototype._rootContainsTarget = function(e) {
                            var r = this.root && (this.root.ownerDocument || this.root) || t;
                            return y(r, e) && (!this.root || r == e.ownerDocument)
                        }, l.prototype._registerInstance = function() {
                            0 > r.indexOf(this) && r.push(this)
                        }, l.prototype._unregisterInstance = function() {
                            var e = r.indexOf(this); - 1 != e && r.splice(e, 1)
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
                            r = t.width * t.height,
                            n = this.intersectionRect,
                            o = n.width * n.height;
                        r ? this.intersectionRatio = Number((o / r).toFixed(4)) : this.intersectionRatio = +!!this.isIntersecting
                    }

                    function l(e, t) {
                        var r, n, o, i = t || {};
                        if ("function" != typeof e) throw Error("callback must be a function");
                        if (i.root && 1 != i.root.nodeType && 9 != i.root.nodeType) throw Error("root must be a Document or Element");
                        this._checkForIntersections = (r = this._checkForIntersections.bind(this), n = this.THROTTLE_TIMEOUT, o = null, function() {
                            o || (o = setTimeout(function() {
                                r(), o = null
                            }, n))
                        }), this._callback = e, this._observationTargets = [], this._queuedEntries = [], this._rootMarginValues = this._parseRootMargin(i.rootMargin), this.thresholds = this._initThresholds(i.threshold), this.root = i.root || null, this.rootMargin = this._rootMarginValues.map(function(e) {
                            return e.value + e.unit
                        }).join(" "), this._monitoringDocuments = [], this._monitoringUnsubscribes = []
                    }

                    function c(e, t, r, n) {
                        "function" == typeof e.addEventListener ? e.addEventListener(t, r, n || !1) : "function" == typeof e.attachEvent && e.attachEvent("on" + t, r)
                    }

                    function u(e, t, r, n) {
                        "function" == typeof e.removeEventListener ? e.removeEventListener(t, r, n || !1) : "function" == typeof e.detachEvent && e.detachEvent("on" + t, r)
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
                        var r = t.top - e.top,
                            n = t.left - e.left;
                        return {
                            top: r,
                            left: n,
                            height: t.height,
                            width: t.width,
                            bottom: r + t.height,
                            right: n + t.width
                        }
                    }

                    function y(e, t) {
                        for (var r = t; r;) {
                            if (r == e) return !0;
                            r = m(r)
                        }
                        return !1
                    }

                    function m(e) {
                        var r = e.parentNode;
                        return 9 == e.nodeType && e != t ? i(e) : (r && r.assignedSlot && (r = r.assignedSlot.parentNode), r && 11 == r.nodeType && r.host) ? r.host : r
                    }

                    function b(e) {
                        return e && 9 === e.nodeType
                    }
                }()
            },
            977: function(e, t, r) {
                function n(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var o = 0 / 0,
                    i = /^\s+|\s+$/g,
                    a = /^[-+]0x[0-9a-f]+$/i,
                    l = /^0b[01]+$/i,
                    c = /^0o[0-7]+$/i,
                    u = parseInt,
                    s = (void 0 === r.g ? "undefined" : n(r.g)) == "object" && r.g && r.g.Object === Object && r.g,
                    f = ("u" < typeof self ? "undefined" : n(self)) == "object" && self && self.Object === Object && self,
                    d = s || f || Function("return this")(),
                    p = Object.prototype.toString,
                    y = Math.max,
                    m = Math.min,
                    b = function() {
                        return d.Date.now()
                    };

                function h(e) {
                    var t = void 0 === e ? "undefined" : n(e);
                    return !!e && ("object" == t || "function" == t)
                }

                function v(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : n(t)) == "symbol" || t && (void 0 === t ? "undefined" : n(t)) == "object" && "[object Symbol]" == p.call(t)) return o;
                    if (h(e)) {
                        var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = h(r) ? r + "" : r
                    }
                    if ("string" != typeof e) return 0 === e ? e : +e;
                    e = e.replace(i, "");
                    var s = l.test(e);
                    return s || c.test(e) ? u(e.slice(2), s ? 2 : 8) : a.test(e) ? o : +e
                }
                e.exports = function(e, t, r) {
                    var n, o, i, a, l, c, u = 0,
                        s = !1,
                        f = !1,
                        d = !0;
                    if ("function" != typeof e) throw TypeError("Expected a function");

                    function p(t) {
                        var r = n,
                            i = o;
                        return n = o = void 0, u = t, a = e.apply(i, r)
                    }

                    function g(e) {
                        var r = e - c,
                            n = e - u;
                        return void 0 === c || r >= t || r < 0 || f && n >= i
                    }

                    function w() {
                        var e, r, n, o = b();
                        if (g(o)) return O(o);
                        l = setTimeout(w, (e = o - c, r = o - u, n = t - e, f ? m(n, i - r) : n))
                    }

                    function O(e) {
                        return (l = void 0, d && n) ? p(e) : (n = o = void 0, a)
                    }

                    function j() {
                        var e, r = b(),
                            i = g(r);
                        if (n = arguments, o = this, c = r, i) {
                            if (void 0 === l) return u = e = c, l = setTimeout(w, t), s ? p(e) : a;
                            if (f) return l = setTimeout(w, t), p(c)
                        }
                        return void 0 === l && (l = setTimeout(w, t)), a
                    }
                    return t = v(t) || 0, h(r) && (s = !!r.leading, i = (f = "maxWait" in r) ? y(v(r.maxWait) || 0, t) : i, d = "trailing" in r ? !!r.trailing : d), j.cancel = function() {
                        void 0 !== l && clearTimeout(l), u = 0, n = c = o = l = void 0
                    }, j.flush = function() {
                        return void 0 === l ? a : O(b())
                    }, j
                }
            }
        },
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var i = t[n] = {
            exports: {}
        };
        return e[n](i, i.exports, r), i.exports
    }
    r.m = e, r.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return r.d(t, {
                a: t
            }), t
        }, r.d = function(e, t) {
            for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
                enumerable: !0,
                get: t[n]
            })
        }, r.g = function() {
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || Function("return this")()
            } catch (e) {
                if ("object" == typeof window) return window
            }
        }(), r.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, r.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, r.nc = void 0, r.rv = function() {
            return "1.7.12"
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n, o, i, a, l, c, u, s, f, d, p, y, m, b, h, v, g, w, O, j, x, S, P, E, I, A, C, R, N, k, T, D, _, M, L, F, U = window.ReactJSX,
                z = window.Roblox["core-scripts"].util.ready,
                W = r.n(z),
                B = window.Roblox["core-scripts"].react,
                G = window.TanstackQuery,
                H = window.React,
                V = r.n(H),
                K = r(977),
                J = r.n(K);
            r(818);
            var $ = function(e, t) {
                    if (0 === e.length || 0 === t) return [e];
                    for (var r = [], n = 0; n < e.length; n += t) r.push(e.slice(n, n + t));
                    return r
                },
                X = function(e, t, r) {
                    var n = [];
                    return t.forEach(function(t) {
                        if (null == t ? void 0 : t.isIntersecting) {
                            var o = e.findIndex(function(e) {
                                return e === t.target
                            });
                            o >= 0 && (n.push(o), r.unobserve(t.target))
                        }
                    }), n.sort(function(e, t) {
                        return e - t
                    })
                },
                q = function(e, t, r) {
                    var n = (0, H.useRef)(new Set),
                        o = (0, H.useRef)(new Set),
                        i = (0, H.useRef)(null),
                        a = (0, H.useCallback)(function() {
                            $(Array.from(o.current).filter(function(e) {
                                return !n.current.has(e)
                            }), 25).filter(function(e) {
                                return e.length > 0
                            }).forEach(function(e) {
                                r(e), e.forEach(function(e) {
                                    return n.current.add(e)
                                })
                            }), o.current.clear()
                        }, [r]),
                        l = (0, H.useMemo)(function() {
                            return J()(function() {
                                return a()
                            }, 200)
                        }, [a]);
                    (0, H.useEffect)(function() {
                        var t, r, n = Array.from(null != (t = null == e || null == (r = e.current) ? void 0 : r.children) ? t : []).filter(function(e) {
                            var t;
                            return null != (t = HTMLElement) && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
                        });
                        return i.current && (i.current(), i.current = null), i.current = function(e, t) {
                                var r = e.elements,
                                    n = e.threshold;
                                try {
                                    var o = new window.IntersectionObserver(t, {
                                        threshold: n
                                    });
                                    return r.forEach(function(e) {
                                            o.observe(e)
                                        }),
                                        function() {
                                            return o.disconnect()
                                        }
                                } catch (e) {}
                                return function() {}
                            }({
                                elements: n,
                                threshold: .5
                            }, function(e, t) {
                                l.cancel(), X(n, e, t).forEach(function(e) {
                                    return o.current.add(e)
                                }), l()
                            }),
                            function() {
                                l.cancel(), i.current && (i.current(), i.current = null)
                            }
                    }, [e, t, l, o])
                };
            (n = P || (P = {})).ItemImpressions = "itemImpressions", n.ItemAction = "itemAction", (o = E || (E = {})).Games = "Games", o.Home = "Home", o.SearchLanding = "SearchLanding", o.Spotlight = "Spotlight", o.UserProfile = "UserProfile", o.GameDetail = "GameDetail", o.SongList = "SongList", o.SearchPage = "SearchPage", o.PreAuthLanding = "PreAuthLanding", (i = I || (I = {})).HomePageSessionInfo = "homePageSessionInfo", i.DiscoverPageSessionInfo = "discoverPageSessionInfo", i.GameSearchSessionInfo = "gameSearchSessionInfo", i.SpotlightPageSessionInfo = "spotlightPageSessionInfo", i.PreAuthLandingPageSessionInfo = "preAuthLandingPageSessionInfo", (a = A || (A = {})).ContentType = "contentType", a.Context = "context", a.CollectionId = "collectionId", a.CollectionPosition = "collectionPosition", a.CollectionComponentType = "collectionComponentType", (l = C || (C = {})).User = "User", l.Game = "Game", l.Song = "Song", l.Look = "Look", l.Description = "Description", (c = R || (R = {})).Online = "online", c.InGame = "inGame", c.InStudio = "inStudio", c.Offline = "offline", (u = N || (N = {})).Friend = "friend", u.NotFriend = "notFriend", (s = k || (k = {})).ItemIds = "itemIds", s.ItemPositions = "itemPositions", s.RowNumbers = "rowNumbers", s.FeedRowNumbers = "feedRowNumbers", s.PositionsInRow = "positionsInRow", s.PositionsInTopic = "positionsInTopic", s.TotalNumberOfItems = "totalNumberOfItems", (f = T || (T = {})).Presences = "presences", f.PresenceUniverseIds = "presenceUniverseIds", f.FriendStatuses = "friendStatuses", f.SourceCarousel = "sourceCarousel", (d = D || (D = {})).ItemId = "itemId", d.ItemPosition = "itemPosition", d.ItemComponentType = "itemComponentType", d.RowNumber = "rowNumber", d.FeedRowNumber = "feedRowNumber", d.PositionInRow = "positionInRow", d.PositionInTopic = "positionInTopic", d.TotalNumberOfItems = "totalNumberOfItems", d.ActionType = "actionType", (p = _ || (_ = {})).Presence = "presence", p.PresenceUniverseId = "presenceUniverseId", p.FriendStatus = "friendStatus", p.SourceCarousel = "sourceCarousel";
            var Y = function(e, t) {
                    return Array.isArray(e) && !t ? e.join(",") : (void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && e ? JSON.stringify(e) : "number" == typeof e || "string" == typeof e ? e : "boolean" == typeof e ? +!!e : void 0
                },
                Z = function(e) {
                    return Object.keys(e).reduce(function(t, r) {
                        var n = Y(e[r], !1);
                        return void 0 !== n && (t[r] = n), t
                    }, {})
                },
                Q = window.Roblox.ExperimentationService,
                ee = r.n(Q),
                et = window.Roblox["core-scripts"].realtime,
                er = r.n(et),
                en = window.Roblox["core-scripts"].dataStore,
                eo = r.n(en),
                ei = window.Roblox["core-scripts"].environmentUrls,
                ea = r.n(ei),
                el = window.Roblox["core-scripts"].http.http;

            function ec(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eu(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function es(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            eu(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            eu(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function ef(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
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
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ep(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ep(e, t) {
                if (e) {
                    if ("string" == typeof e) return ec(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ec(e, t)
                }
            }

            function ey(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, n = u[1], u = [0];
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
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var em = function() {
                return es(function() {
                    var e;
                    return ey(this, function(t) {
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

            function eb(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var eh = function() {
                    var e;
                    return (e = function() {
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(a, "next", {
                                value: c(0)
                            }), l(a, "throw", {
                                value: c(1)
                            }), l(a, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), a;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, n = u[1], u = [0];
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
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
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
                            r = arguments;
                        return new Promise(function(n, o) {
                            var i = e.apply(t, r);

                            function a(e) {
                                eb(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                eb(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                ev = function(e) {
                    var t = e.friendsCount,
                        r = e.profileUserId,
                        n = e.isOwnUser,
                        o = e.translate,
                        i = n ? "".concat(ea().websiteUrl, "/users/friends#!/friends") : "".concat(ea().websiteUrl, "/users/").concat(r, "/friends#!/friends"),
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
                ew = r.n(eg),
                eO = window.RobloxBadges,
                ej = window.Roblox["core-scripts"].guac,
                ex = "web-plus-identity-badge",
                eS = function(e) {
                    return (void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && null !== e
                },
                eP = function() {
                    var e = (0, G.useQuery)({
                        queryKey: ["guac/".concat(ex)],
                        queryFn: function() {
                            return (0, ej.callBehaviour)(ex)
                        },
                        staleTime: 1 / 0
                    }).data;
                    return eS(e) && !0 === e.plusIdentityBadgeEnabled
                },
                eE = function() {
                    for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, o = "";
                        if ("string" == typeof t || "number" == typeof t) o += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (r = 0; r < i; r++) t[r] && (n = e(t[r])) && (o && (o += " "), o += n)
                            } else
                                for (n in t) t[n] && (o && (o += " "), o += n);
                        return o
                    }(e)) && (n && (n += " "), n += t);
                    return n
                };

            function eI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eA(e) {
                if (Array.isArray(e)) return e
            }

            function eC() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function eR(e, t) {
                if (e) {
                    if ("string" == typeof e) return eI(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eI(e, t)
                }
            }
            var eN = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                ek = V().forwardRef(function(e, t) {
                    var r, n = eA(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || eR(r) || eC(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.name,
                        l = o.size,
                        c = o.className,
                        u = (o.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(o, ["name", "size", "className", "children"])),
                        s = (eA(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || eR(i, 1) || eC())[0];
                    return V().createElement("span", function(e) {
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
                    }({
                        ref: s,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: eE("grow-0 shrink-0 basis-auto icon", a, eN[void 0 === l ? "Medium" : l], c)
                    }, u))
                });
            ek.displayName = "Icon";
            var eT = function(e) {
                    var t = e.isVerified,
                        r = e.isRobloxPlus,
                        n = e.isPremium,
                        o = e.isRobloxAdmin,
                        i = e.size,
                        a = void 0 === i ? "Large" : i,
                        l = e.plusBadgeAriaLabel,
                        c = !0 === r,
                        u = !0 === n && !c,
                        s = !0 === t,
                        f = !0 === o;
                    return s || c || u || f ? (0, U.jsxs)("span", {
                        className: "items-center gap-xxsmall inline-flex shrink-0 [--icon-size-small:1em]",
                        children: [s && (0, U.jsxs)("span", {
                            className: "relative flex items-center justify-center",
                            children: [(0, U.jsx)(ek, {
                                name: "icon-filled-verified-backplate",
                                className: "content-system-emphasis",
                                size: a
                            }), (0, U.jsx)(ek, {
                                name: "icon-filled-verified-check",
                                className: "absolute",
                                style: {
                                    color: "white"
                                },
                                size: a
                            })]
                        }), c && (0, U.jsx)(ek, {
                            name: "icon-regular-roblox-plus",
                            className: "content-system-contrast",
                            size: a,
                            "aria-label": l
                        }), u && (0, U.jsx)(ek, {
                            name: "icon-filled-premium",
                            className: "content-system-contrast",
                            size: a
                        }), f && (0, U.jsx)(ek, {
                            name: "icon-filled-tilt",
                            className: "content-system-contrast",
                            size: a
                        })]
                    }) : null
                },
                eD = window.ReactStyleGuide,
                e_ = window.RobloxThumbnails,
                eM = function(e) {
                    var t = e.id,
                        r = e.userProfileUrl,
                        n = e.handleImageClick,
                        o = e.translate,
                        i = (0, e_.useProfileFrameExperiment)(),
                        a = (0, U.jsx)(e_.Thumbnail2d, {
                            type: e_.ThumbnailTypes.avatarHeadshot,
                            size: e_.DefaultThumbnailSize,
                            targetId: t,
                            containerClass: "avatar-card-image",
                            includeProfileFrame: i
                        });
                    return (0, U.jsx)(eD.AvatarCardItem.Headshot, {
                        statusIcon: (0, U.jsx)(ew().PresenceStatusIcon, {
                            translate: o,
                            userId: t
                        }),
                        thumbnail: a,
                        imageLink: r,
                        handleImageClick: n
                    })
                },
                eL = function(e) {
                    var t = e.id,
                        r = e.displayName,
                        n = e.userProfileUrl,
                        o = e.userPresence,
                        i = e.hasVerifiedBadge,
                        a = e.isRobloxPlus,
                        l = e.sendClickEvent,
                        c = e.translate,
                        u = eP() && !0 === a;
                    return (0, U.jsxs)("div", {
                        className: "friend-tile-content",
                        children: [(0, U.jsx)(eM, {
                            id: t,
                            translate: c,
                            userProfileUrl: n,
                            handleImageClick: l
                        }), (0, U.jsxs)("a", {
                            href: n,
                            onClick: l,
                            className: "friends-carousel-tile-labels",
                            "data-testid": "friends-carousel-tile-labels",
                            children: [(0, U.jsx)("div", {
                                className: "friends-carousel-tile-label",
                                children: (0, U.jsxs)("div", {
                                    className: "friends-carousel-tile-name",
                                    children: [(0, U.jsx)("span", {
                                        className: "friends-carousel-display-name",
                                        children: r
                                    }), i && (0, U.jsxs)("div", {
                                        className: "friend-tile-verified-badge",
                                        children: [(0, U.jsx)("div", {
                                            className: "friend-tile-spacer"
                                        }), (0, U.jsx)(eO.VerifiedBadgeIconContainer, {
                                            size: eO.BadgeSizes.SUBHEADER,
                                            additionalContainerClass: "verified-badge"
                                        })]
                                    }), u && (0, U.jsx)(eT, {
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
                eF = window.Roblox,
                eU = window.Roblox["core-scripts"].meta.device,
                ez = window.CoreRobloxUtilities,
                eW = function(e) {
                    var t = e.className;
                    return V().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: eE("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                eB = function(e) {
                    var t = e.width,
                        r = e.height;
                    return V().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
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

            function eG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eH(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function eV() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = eH(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : eH(t[e], null)
                        }
                    }
                }
            }

            function eK() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return H.useCallback(eV.apply(void 0, function(e) {
                    if (Array.isArray(e)) return eG(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return eG(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eG(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function eJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e$(e) {
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

            function eX(e, t) {
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

            function eq(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function eY(e) {
                return function(e) {
                    if (Array.isArray(e)) return eJ(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return eJ(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eJ(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eZ(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var eQ = Symbol.for("react.lazy"),
                e0 = H[" use ".trim().toString()];

            function e1(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : eZ(e)) === "object" && "$$typeof" in e && e.$$typeof === eQ && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : eZ(t)) === "object" && null !== t && "then" in t
            }
            var e2 = ((e = H.forwardRef(function(e, t) {
                    var r = e.children,
                        n = eq(e, ["children"]);
                    if (e1(r) && "function" == typeof e0 && (r = e0(r._payload)), H.isValidElement(r)) {
                        var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = e$({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        i = t[n];
                                    /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = i.apply(void 0, eY(t));
                                        return o.apply(void 0, eY(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = e$({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                }(n);
                                return e$({}, e, r)
                            }(n, r.props);
                        return r.type !== H.Fragment && (s.ref = t ? eV(t, u) : u), H.cloneElement(r, s)
                    }
                    return H.Children.count(r) > 1 ? H.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), y = e, (m = H.forwardRef(function(e, t) {
                    var r = e.children,
                        n = eq(e, ["children"]);
                    e1(r) && "function" == typeof e0 && (r = e0(r._payload));
                    var o = H.Children.toArray(r),
                        i = o.find(e4);
                    if (i) {
                        var a = i.props.children,
                            l = o.map(function(e) {
                                return e !== i ? e : H.Children.count(a) > 1 ? H.Children.only(null) : H.isValidElement(a) ? a.props.children : null
                            });
                        return (0, U.jsx)(y, eX(e$({}, n), {
                            ref: t,
                            children: H.isValidElement(a) ? H.cloneElement(a, void 0, l) : null
                        }))
                    }
                    return (0, U.jsx)(y, eX(e$({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), m),
                e3 = Symbol("radix.slottable");

            function e4(e) {
                return H.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === e3
            }

            function e8(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e5(e) {
                if (Array.isArray(e)) return e
            }

            function e6() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function e7(e) {
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

            function e9(e, t) {
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

            function te(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function tt(e, t) {
                if (e) {
                    if ("string" == typeof e) return e8(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e8(e, t)
                }
            }
            var tr = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                tn = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                to = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                ti = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                ta = (0, H.forwardRef)(function(e, t) {
                    var r, n = e5(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tt(r) || e6(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.children,
                        l = o.className,
                        c = o.style,
                        u = o.isDisabled,
                        s = void 0 !== u && u,
                        f = o.isLoading,
                        d = void 0 !== f && f,
                        p = o.icon,
                        y = o.size,
                        m = void 0 === y ? "Large" : y,
                        b = o.variant,
                        h = void 0 === b ? "Emphasis" : b,
                        v = o.asChild,
                        g = te(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (e5(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || tt(i, 1) || e6())[0],
                        O = eE("foundation-web-button", s ? "opacity-[0.5]" : ["relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", tn[m], s ? ti[h] : to[h], l),
                        j = e7({
                            textDecoration: "none"
                        }, c),
                        x = function(e) {
                            return V().createElement(V().Fragment, null, V().createElement(eW, null), d && V().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, V().createElement(eB, {
                                width: tr[m],
                                height: tr[m]
                            })), V().createElement("span", {
                                className: eE("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", d && "invisible")
                            }, p && V().createElement(ek, {
                                name: p,
                                size: m
                            }), V().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var S = te(g, ["as"]),
                            P = V().Children.only(a);
                        return V().createElement(e2, e9(e7({
                            ref: w
                        }, S), {
                            className: O,
                            style: j,
                            "aria-disabled": s || void 0
                        }), V().cloneElement(P, {}, x(P.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var E = g.href,
                            I = te(g, ["as", "href"]);
                        return V().createElement("a", e9(e7({
                            ref: w
                        }, I), {
                            "aria-disabled": s,
                            href: s ? void 0 : E,
                            className: O,
                            style: j
                        }), x(a))
                    }
                    g.as;
                    var A = te(g, ["as"]);
                    return V().createElement("button", e9(e7({
                        ref: w,
                        type: "button"
                    }, A), {
                        disabled: s,
                        className: O,
                        style: j
                    }), x(a))
                });

            function tl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tc(e) {
                if (Array.isArray(e)) return e
            }

            function tu() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ts(e) {
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

            function tf(e, t) {
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

            function td(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function tp(e, t) {
                if (e) {
                    if ("string" == typeof e) return tl(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tl(e, t)
                }
            }
            var ty = new Set(["_self", "_parent", "_top"]),
                tm = {
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                tb = {
                    Standard: "content-emphasis",
                    Emphasis: "content-emphasis",
                    Inverse: "content-inverse-default"
                },
                th = (0, H.forwardRef)(function(e, t) {
                    var r, n, o, i, a = tc(o = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(o) || tp(o) || tu(),
                        l = a[0],
                        c = a.slice(1),
                        u = l.children,
                        s = l.className,
                        f = l.size,
                        d = l.color,
                        p = l.variant,
                        y = l.underline,
                        m = void 0 === y ? "hover" : y,
                        b = l.isExternal,
                        h = l.asChild,
                        v = td(l, ["children", "className", "size", "color", "variant", "underline", "isExternal", "asChild"]),
                        g = (tc(c) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(c) || tp(c, 1) || tu())[0],
                        w = (r = null != (i = v.as) ? i : "a", n = "button" === v.as ? void 0 : v.target, void 0 !== b ? b : "button" !== r && void 0 !== n && !ty.has(n)),
                        O = eE("foundation-web-link", "button" === v.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === (void 0 === p ? "Standalone" : p) || w) && "inline-flex items-center gap-xsmall", void 0 !== f && tm[f], tb[void 0 === d ? "Emphasis" : d], "always" === m ? "underline" : "no-underline", "hover" === m && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", s),
                        j = w ? V().createElement("span", {
                            "aria-hidden": !0,
                            "data-testid": "foundation-web-icon",
                            className: eE("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
                        }) : null;
                    if (h) {
                        v.as;
                        var x = td(v, ["as"]),
                            S = V().Children.only(u);
                        return V().isValidElement(S) ? V().createElement(e2, tf(ts({
                            ref: g
                        }, x), {
                            className: O
                        }), V().cloneElement(S, {}, V().createElement(V().Fragment, null, S.props.children, j))) : null
                    }
                    if ("button" === v.as) {
                        v.as;
                        var P = v.type,
                            E = td(v, ["as", "type"]);
                        return V().createElement("button", tf(ts({
                            ref: g,
                            type: null != P ? P : "button"
                        }, E), {
                            className: O
                        }), u, j)
                    }
                    v.as;
                    var I = td(v, ["as"]);
                    return V().createElement("a", tf(ts({
                        ref: g
                    }, I), {
                        className: O
                    }), u, j)
                });
            th.displayName = "Link";
            var tv = function(e) {
                var t = e.displayName,
                    r = e.userPresence,
                    n = e.universeId,
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
                            children: (0, U.jsx)(e_.Thumbnail2d, {
                                type: e_.ThumbnailTypes.gameIcon,
                                size: e_.ThumbnailGameIconSize.size150,
                                targetId: n,
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
                                children: r
                            })]
                        })]
                    }),
                    y = s && null != u && "" !== c;
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
                        children: [y ? (0, U.jsx)("a", {
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
                            children: [(0, U.jsx)(ta, {
                                variant: "Emphasis",
                                size: "Medium",
                                className: "grow",
                                onClick: l,
                                children: a("Action.Join")
                            }), i && (0, U.jsx)(ta, {
                                variant: "Standard",
                                size: "Medium",
                                className: "grow",
                                onClick: d,
                                children: a("Action.Chat")
                            }), (0, U.jsx)(th, {
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

            function tg(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var tw = function(e) {
                var t, r = e.friend,
                    n = e.displayName,
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
                    y = function() {
                        var e;
                        return (e = function() {
                            var e, t, n, o;
                            return function(e, t) {
                                var r, n, o, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    l = Object.defineProperty;
                                return l(a, "next", {
                                    value: c(0)
                                }), l(a, "throw", {
                                    value: c(1)
                                }), l(a, "return", {
                                    value: c(2)
                                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), a;

                                function c(l) {
                                    return function(c) {
                                        var u = [l, c];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                    i.label++, n = u[1], u = [0];
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
                                            u = [6, e], n = 0
                                        } finally {
                                            r = o = 0
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
                                        if (t = null != (e = r.presence.gameId) ? e : "", !(null == (n = (0, eU.getDeviceMeta)()) ? void 0 : n.isInApp)) return [3, 1];
                                        return n.isDesktop ? null === eF.GameLauncher || void 0 === eF.GameLauncher || eF.GameLauncher.followPlayerIntoGame(r.id, t, "JoinUser") : window.location.href = "/games/start?userID=".concat(r.id, "&joinAttemptId=").concat(t, "&joinAttemptOrigin=JoinUser"), [3, 5];
                                    case 1:
                                        if (!((null == n ? void 0 : n.isAndroidDevice) || (null == n ? void 0 : n.isChromeOs))) return [3, 2];
                                        return window.location.href = "intent://userId=".concat(r.id, "&joinAttemptId=").concat(t, "&joinAttemptOrigin=JoinUser#Intent;scheme=robloxmobile;package=com.roblox.client;S.browser_fallback_url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.roblox.client;end"), [3, 5];
                                    case 2:
                                        if (!(null == n ? void 0 : n.isIosDevice)) return [3, 3];
                                        return window.location.href = "robloxmobile://userId=".concat(r.id, "&joinAttemptId=").concat(t, "&joinAttemptOrigin=JoinUser"), [3, 5];
                                    case 3:
                                        return [4, null == (o = window.Roblox.ProtocolHandlerClientInterface) ? void 0 : o.followPlayerIntoGame({
                                            userId: r.id,
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
                                r = arguments;
                            return new Promise(function(n, o) {
                                var i = e.apply(t, r);

                                function a(e) {
                                    tg(i, n, o, a, l, "next", e)
                                }

                                function l(e) {
                                    tg(i, n, o, a, l, "throw", e)
                                }
                                a(void 0)
                            })
                        })()
                    },
                    m = function() {
                        ez.chatService.startDesktopAndMobileWebChat({
                            userId: r.id
                        })
                    };
                return f && a && null != i ? (0, U.jsx)(tv, {
                    displayName: n,
                    userPresence: i,
                    universeId: c,
                    userProfileUrl: o,
                    canChat: u,
                    translate: s,
                    launchGame: y,
                    gameUrl: l,
                    placeId: null != (t = r.presence.placeId) ? t : null,
                    isIARCJoinCardGameRowClickableEnabled: d,
                    sendGameRowClickEvent: p,
                    startChat: m
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
                            children: (0, U.jsx)(e_.Thumbnail2d, {
                                type: e_.ThumbnailTypes.gameIcon,
                                size: e_.ThumbnailGameIconSize.size150,
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
                            }), (0, U.jsx)(eD.Button, {
                                variant: eD.Button.variants.growth,
                                size: eD.Button.sizes.small,
                                width: eD.Button.widths.full,
                                onClick: y,
                                children: s("Action.Join")
                            })]
                        })]
                    }), (0, U.jsxs)("ul", {
                        children: [u && (0, U.jsx)("li", {
                            children: (0, U.jsxs)("button", {
                                type: "button",
                                className: "friend-tile-dropdown-button",
                                onClick: m,
                                children: [(0, U.jsx)("span", {
                                    className: "icon-chat-gray"
                                }), " ", s("Label.Chat", {
                                    username: n
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

            function tO(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function tj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tx(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tS(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tx(e, t, r[t])
                    })
                }
                return e
            }

            function tP(e) {
                return function(e) {
                    if (Array.isArray(e)) return tj(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tj(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tj(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tE(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return H.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return H.useMemo(function() {
                                var t, o;
                                return tx({}, "__scope".concat(e), (t = tS({}, r), o = null != (o = tx({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                                    var t = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        t.push.apply(t, r)
                                    }
                                    return t
                                })(Object(o)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                }), t))
                            }, [r, n])
                        }
                    };
                return n.scopeName = e, [function(t, n) {
                    var o = H.createContext(n),
                        i = r.length;
                    r = tP(r).concat([n]);
                    var a = function(t) {
                        var r, n = t.scope,
                            a = t.children,
                            l = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, i = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                    return i
                                }
                                if (i = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            i = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o,
                            u = H.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, U.jsx)(c.Provider, {
                            value: u,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(r, a) {
                        var l, c = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                            u = H.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, tI.apply(void 0, [n].concat(tP(t)))]
            }

            function tI() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var n = t[0];
                if (1 === t.length) return n;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var r = e.reduce(function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return tS({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return H.useMemo(function() {
                            return tx({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var tA = window.RadixUI["react-dismissable-layer"],
                tC = window.RadixUI["react-focus-guards"],
                tR = window.ReactDOM,
                tN = r.n(tR);

            function tk(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tT(e) {
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

            function tD(e, t) {
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

            function t_(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function tM(e) {
                return function(e) {
                    if (Array.isArray(e)) return tk(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tk(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tk(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tL(e) {
                var t, r, n = (t = e, (r = H.forwardRef(function(e, t) {
                        var r = e.children,
                            n = t_(e, ["children"]);
                        if (H.isValidElement(r)) {
                            var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = tT({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            i.apply(void 0, tM(t)), o.apply(void 0, tM(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = tT({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return tT({}, e, r)
                                }(n, r.props);
                            return r.type !== H.Fragment && (s.ref = t ? eV(t, u) : u), H.cloneElement(r, s)
                        }
                        return H.Children.count(r) > 1 ? H.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = H.forwardRef(function(e, t) {
                        var r = e.children,
                            o = t_(e, ["children"]),
                            i = H.Children.toArray(r),
                            a = i.find(tU);
                        if (a) {
                            var l = a.props.children,
                                c = i.map(function(e) {
                                    return e !== a ? e : H.Children.count(l) > 1 ? H.Children.only(null) : H.isValidElement(l) ? l.props.children : null
                                });
                            return (0, U.jsx)(n, tD(tT({}, o), {
                                ref: t,
                                children: H.isValidElement(l) ? H.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, U.jsx)(n, tD(tT({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var tF = Symbol("radix.slottable");

            function tU(e) {
                return H.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tF
            }

            function tz(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tW(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tz(e, t, r[t])
                    })
                }
                return e
            }

            function tB(e, t) {
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
            var tG = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = tL("Primitive.".concat(t)),
                    n = H.forwardRef(function(e, n) {
                        var o = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, i = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                    return i
                                }
                                if (i = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            i = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }(e, ["asChild"]),
                            a = o ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, U.jsx)(a, tB(tW({}, i), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), tB(tW({}, e), tz({}, t, n))
            }, {});

            function tH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tV(e) {
                var t = H.useRef(e);
                return H.useEffect(function() {
                    t.current = e
                }), H.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return tH(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return tH(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tH(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function tK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tJ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || t$(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function t$(e, t) {
                if (e) {
                    if ("string" == typeof e) return tK(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tK(e, t)
                }
            }
            var tX = "focusScope.autoFocusOnMount",
                tq = "focusScope.autoFocusOnUnmount",
                tY = {
                    bubbles: !1,
                    cancelable: !0
                },
                tZ = H.forwardRef(function(e, t) {
                    var r, n, o = e.loop,
                        i = void 0 !== o && o,
                        a = e.trapped,
                        l = void 0 !== a && a,
                        c = e.onMountAutoFocus,
                        u = e.onUnmountAutoFocus,
                        s = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        f = tJ(H.useState(null), 2),
                        d = f[0],
                        p = f[1],
                        y = tV(c),
                        m = tV(u),
                        b = H.useRef(null),
                        h = eK(t, function(e) {
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
                                        d.contains(t) ? b.current = t : t1(b.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!v.paused && d) {
                                        var t = e.relatedTarget;
                                        null !== t && (d.contains(t) || t1(b.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                            var r = new MutationObserver(function(e) {
                                if (document.activeElement === document.body) {
                                    var t = !0,
                                        r = !1,
                                        n = void 0;
                                    try {
                                        for (var o, i = e[Symbol.iterator](); !(t = (o = i.next()).done); t = !0) o.value.removedNodes.length > 0 && t1(d)
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
                            });
                            return d && r.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), r.disconnect()
                                }
                        }
                    }, [l, d, v.paused]), H.useEffect(function() {
                        if (d) {
                            t2.add(v);
                            var e = document.activeElement;
                            if (!d.contains(e)) {
                                var t = new CustomEvent(tX, tY);
                                d.addEventListener(tX, y), d.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = t.select,
                                        n = void 0 !== r && r,
                                        o = document.activeElement,
                                        i = !0,
                                        a = !1,
                                        l = void 0;
                                    try {
                                        for (var c, u = e[Symbol.iterator](); !(i = (c = u.next()).done); i = !0) {
                                            var s = c.value;
                                            if (t1(s, {
                                                    select: n
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
                                }(tQ(d).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && t1(d))
                            }
                            return function() {
                                d.removeEventListener(tX, y), setTimeout(function() {
                                    var t = new CustomEvent(tq, tY);
                                    d.addEventListener(tq, m), d.dispatchEvent(t), t.defaultPrevented || t1(null != e ? e : document.body, {
                                        select: !0
                                    }), d.removeEventListener(tq, m), t2.remove(v)
                                }, 0)
                            }
                        }
                    }, [d, y, m, v]);
                    var g = H.useCallback(function(e) {
                        if ((i || l) && !v.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, o, a = e.currentTarget,
                                    c = tJ([t0(o = tQ(n = a), n), t0(o.reverse(), n)], 2),
                                    u = c[0],
                                    s = c[1];
                                u && s ? e.shiftKey || r !== s ? e.shiftKey && r === u && (e.preventDefault(), i && t1(s, {
                                    select: !0
                                })) : (e.preventDefault(), i && t1(u, {
                                    select: !0
                                })) : r === a && e.preventDefault()
                            }
                        }
                    }, [i, l, v.paused]);
                    return (0, U.jsx)(tG.div, (r = function(e) {
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
                    }({
                        tabIndex: -1
                    }, s), n = n = {
                        ref: h,
                        onKeyDown: g
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function tQ(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function t0(e, t) {
                var r = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var i, a = e[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                        var l = i.value;
                        if (! function(e, t) {
                                var r = t.upTo;
                                if ("hidden" === getComputedStyle(e).visibility) return !0;
                                for (; e && (void 0 === r || e !== r);) {
                                    if ("none" === getComputedStyle(e).display) return !0;
                                    e = e.parentElement
                                }
                                return !1
                            }(l, {
                                upTo: t
                            })) return l
                    }
                } catch (e) {
                    n = !0, o = e
                } finally {
                    try {
                        r || null == a.return || a.return()
                    } finally {
                        if (n) throw o
                    }
                }
            }

            function t1(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, o, i, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (o = n = e, null != (i = HTMLInputElement) && "u" > typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            tZ.displayName = "FocusScope";
            var t2 = (t = [], {
                add: function(e) {
                    var r = t[0];
                    e !== r && (null == r || r.pause()), (t = t3(t, e)).unshift(e)
                },
                remove: function(e) {
                    var r;
                    null == (r = (t = t3(t, e))[0]) || r.resume()
                }
            });

            function t3(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return tK(e)
                    }(e) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || t$(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }
            var t4 = (null == (M = globalThis) ? void 0 : M.document) ? H.useLayoutEffect : function() {};

            function t8(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var t5 = H[" useId ".trim().toString()] || function() {},
                t6 = 0,
                t7 = ["top", "right", "bottom", "left"],
                t9 = Math.min,
                re = Math.max,
                rt = Math.round,
                rr = Math.floor,
                rn = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                ro = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                ri = {
                    start: "end",
                    end: "start"
                };

            function ra(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function rl(e) {
                return e.split("-")[0]
            }

            function rc(e) {
                return e.split("-")[1]
            }

            function ru(e) {
                return "x" === e ? "y" : "x"
            }

            function rs(e) {
                return "y" === e ? "height" : "width"
            }
            var rf = new Set(["top", "bottom"]);

            function rd(e) {
                return rf.has(rl(e)) ? "y" : "x"
            }

            function rp(e) {
                return e.replace(/start|end/g, function(e) {
                    return ri[e]
                })
            }
            var ry = ["left", "right"],
                rm = ["right", "left"],
                rb = ["top", "bottom"],
                rh = ["bottom", "top"];

            function rv(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return ro[e]
                })
            }

            function rg(e) {
                return "number" != typeof e ? function(e) {
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

            function rw(e) {
                var t = e.x,
                    r = e.y,
                    n = e.width,
                    o = e.height;
                return {
                    width: n,
                    height: o,
                    top: r,
                    left: t,
                    right: t + n,
                    bottom: r + o,
                    x: t,
                    y: r
                }
            }

            function rO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rj(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function rx(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            rj(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            rj(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function rS(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rP(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rS(e, t, r[t])
                    })
                }
                return e
            }

            function rE(e, t) {
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

            function rI(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function rA(e) {
                return function(e) {
                    if (Array.isArray(e)) return rO(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rO(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rO(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rC(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, n = u[1], u = [0];
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
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function rR(e, t, r) {
                var n, o = e.reference,
                    i = e.floating,
                    a = rd(t),
                    l = ru(rd(t)),
                    c = rs(l),
                    u = rl(t),
                    s = "y" === a,
                    f = o.x + o.width / 2 - i.width / 2,
                    d = o.y + o.height / 2 - i.height / 2,
                    p = o[c] / 2 - i[c] / 2;
                switch (u) {
                    case "top":
                        n = {
                            x: f,
                            y: o.y - i.height
                        };
                        break;
                    case "bottom":
                        n = {
                            x: f,
                            y: o.y + o.height
                        };
                        break;
                    case "right":
                        n = {
                            x: o.x + o.width,
                            y: d
                        };
                        break;
                    case "left":
                        n = {
                            x: o.x - i.width,
                            y: d
                        };
                        break;
                    default:
                        n = {
                            x: o.x,
                            y: o.y
                        }
                }
                switch (rc(t)) {
                    case "start":
                        n[l] -= p * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += p * (r && s ? -1 : 1)
                }
                return n
            }

            function rN(e, t) {
                return rx(function() {
                    var r, n, o, i, a, l, c, u, s, f, d, p, y, m, b, h, v, g, w, O, j, x, S, P, E, I, A, C, R, N, k;
                    return rC(this, function(T) {
                        switch (T.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, o = e.y, i = e.platform, a = e.rects, l = e.elements, c = e.strategy, f = void 0 === (s = (u = ra(t, e)).boundary) ? "clippingAncestors" : s, p = void 0 === (d = u.rootBoundary) ? "viewport" : d, m = void 0 === (y = u.elementContext) ? "floating" : y, h = void 0 !== (b = u.altBoundary) && b, g = rg(void 0 === (v = u.padding) ? 0 : v), w = "floating" === m ? "reference" : "floating", O = l[h ? w : m], x = i.getClippingRect, S = {}, [4, null == i.isElement ? void 0 : i.isElement(O)];
                            case 1:
                                if (!(null == (r = T.sent()) || r)) return [3, 2];
                                return P = O, [3, 5];
                            case 2:
                                if (E = O.contextElement) return [3, 4];
                                return [4, null == i.getDocumentElement ? void 0 : i.getDocumentElement(l.floating)];
                            case 3:
                                E = T.sent(), T.label = 4;
                            case 4:
                                P = E, T.label = 5;
                            case 5:
                                return [4, x.apply(i, [(S.element = P, S.boundary = f, S.rootBoundary = p, S.strategy = c, S)])];
                            case 6:
                                return j = rw.apply(void 0, [T.sent()]), I = "floating" === m ? {
                                    x: n,
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
                                return k = T.sent(), [3, 14];
                            case 13:
                                k = I, T.label = 14;
                            case 14:
                                return N = rw.apply(void 0, [k]), [2, {
                                    top: (j.top - N.top + g.top) / C.y,
                                    bottom: (N.bottom - j.bottom + g.bottom) / C.y,
                                    left: (j.left - N.left + g.left) / C.x,
                                    right: (N.right - j.right + g.right) / C.x
                                }]
                        }
                    })
                })()
            }

            function rk(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function rT(e) {
                return t7.some(function(t) {
                    return e[t] >= 0
                })
            }
            var rD = new Set(["left", "top"]);

            function r_(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function rM() {
                return "u" > typeof window
            }

            function rL(e) {
                return rz(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function rF(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function rU(e) {
                var t;
                return null == (t = (rz(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function rz(e) {
                return !!rM() && (r_(e, Node) || r_(e, rF(e).Node))
            }

            function rW(e) {
                return !!rM() && (r_(e, Element) || r_(e, rF(e).Element))
            }

            function rB(e) {
                return !!rM() && (r_(e, HTMLElement) || r_(e, rF(e).HTMLElement))
            }

            function rG(e) {
                return !(!rM() || "u" < typeof ShadowRoot) && (r_(e, ShadowRoot) || r_(e, rF(e).ShadowRoot))
            }
            var rH = new Set(["inline", "contents"]);

            function rV(e) {
                var t = r2(e),
                    r = t.overflow,
                    n = t.overflowX,
                    o = t.overflowY,
                    i = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + o + n) && !rH.has(i)
            }
            var rK = new Set(["table", "td", "th"]),
                rJ = [":popover-open", ":modal"];

            function r$(e) {
                return rJ.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var rX = ["transform", "translate", "scale", "rotate", "perspective"],
                rq = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                rY = ["paint", "layout", "strict", "content"];

            function rZ(e) {
                var t = rQ(),
                    r = rW(e) ? r2(e) : e;
                return rX.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || rq.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || rY.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function rQ() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var r0 = new Set(["html", "body", "#document"]);

            function r1(e) {
                return r0.has(rL(e))
            }

            function r2(e) {
                return rF(e).getComputedStyle(e)
            }

            function r3(e) {
                return rW(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function r4(e) {
                if ("html" === rL(e)) return e;
                var t = e.assignedSlot || e.parentNode || rG(e) && e.host || rU(e);
                return rG(t) ? t.host : t
            }

            function r8(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, o = function e(t) {
                        var r = r4(t);
                        return r1(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : rB(r) && rV(r) ? r : e(r)
                    }(e),
                    i = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    a = rF(o);
                if (i) {
                    var l = r5(a);
                    return t.concat(a, a.visualViewport || [], rV(o) ? o : [], l && r ? r8(l) : [])
                }
                return t.concat(o, r8(o, [], r))
            }

            function r5(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function r6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r7(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function r9(e) {
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

            function ne(e, t) {
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

            function nt(e) {
                return function(e) {
                    if (Array.isArray(e)) return r6(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || nr(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nr(e, t) {
                if (e) {
                    if ("string" == typeof e) return r6(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r6(e, t)
                }
            }

            function nn(e) {
                var t = r2(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    o = rB(e),
                    i = o ? e.offsetWidth : r,
                    a = o ? e.offsetHeight : n,
                    l = rt(r) !== i || rt(n) !== a;
                return l && (r = i, n = a), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function no(e) {
                return rW(e) ? e : e.contextElement
            }

            function ni(e) {
                var t = no(e);
                if (!rB(t)) return rn(1);
                var r = t.getBoundingClientRect(),
                    n = nn(t),
                    o = n.width,
                    i = n.height,
                    a = n.$,
                    l = (a ? rt(r.width) : r.width) / o,
                    c = (a ? rt(r.height) : r.height) / i;
                return l && Number.isFinite(l) || (l = 1), c && Number.isFinite(c) || (c = 1), {
                    x: l,
                    y: c
                }
            }
            var na = rn(0);

            function nl(e) {
                var t = rF(e);
                return rQ() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : na
            }

            function nc(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var o, i = e.getBoundingClientRect(),
                    a = no(e),
                    l = rn(1);
                t && (n ? rW(n) && (l = ni(n)) : l = ni(e));
                var c = (void 0 === (o = r) && (o = !1), n && (!o || n === rF(a)) && o) ? nl(a) : rn(0),
                    u = (i.left + c.x) / l.x,
                    s = (i.top + c.y) / l.y,
                    f = i.width / l.x,
                    d = i.height / l.y;
                if (a)
                    for (var p = rF(a), y = n && rW(n) ? rF(n) : n, m = p, b = r5(m); b && n && y !== m;) {
                        var h = ni(b),
                            v = b.getBoundingClientRect(),
                            g = r2(b),
                            w = v.left + (b.clientLeft + parseFloat(g.paddingLeft)) * h.x,
                            O = v.top + (b.clientTop + parseFloat(g.paddingTop)) * h.y;
                        u *= h.x, s *= h.y, f *= h.x, d *= h.y, u += w, s += O, b = r5(m = rF(b))
                    }
                return rw({
                    width: f,
                    height: d,
                    x: u,
                    y: s
                })
            }

            function nu(e, t) {
                var r = r3(e).scrollLeft;
                return t ? t.left + r : nc(rU(e)).left + r
            }

            function ns(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - nu(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var nf = new Set(["absolute", "fixed"]);

            function nd(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = rF(e),
                        n = rU(e),
                        o = r.visualViewport,
                        i = n.clientWidth,
                        a = n.clientHeight,
                        l = 0,
                        c = 0;
                    if (o) {
                        i = o.width, a = o.height;
                        var u = rQ();
                        (!u || u && "fixed" === t) && (l = o.offsetLeft, c = o.offsetTop)
                    }
                    var s = nu(n);
                    if (s <= 0) {
                        var f = n.ownerDocument,
                            d = f.body,
                            p = getComputedStyle(d),
                            y = "CSS1Compat" === f.compatMode && parseFloat(p.marginLeft) + parseFloat(p.marginRight) || 0,
                            m = Math.abs(n.clientWidth - d.clientWidth - y);
                        m <= 25 && (i -= m)
                    } else s <= 25 && (i += s);
                    return {
                        width: i,
                        height: a,
                        x: l,
                        y: c
                    }
                }(e, r);
                else if ("document" === t) o = rU(e), i = rU(o), a = r3(o), l = o.ownerDocument.body, c = re(i.scrollWidth, i.clientWidth, l.scrollWidth, l.clientWidth), u = re(i.scrollHeight, i.clientHeight, l.scrollHeight, l.clientHeight), s = -a.scrollLeft + nu(o), f = -a.scrollTop, "rtl" === r2(l).direction && (s += re(i.clientWidth, l.clientWidth) - c), n = {
                    width: c,
                    height: u,
                    x: s,
                    y: f
                };
                else if (rW(t)) p = (d = nc(t, !0, "fixed" === r)).top + t.clientTop, y = d.left + t.clientLeft, m = rB(t) ? ni(t) : rn(1), n = {
                    width: t.clientWidth * m.x,
                    height: t.clientHeight * m.y,
                    x: y * m.x,
                    y: p * m.y
                };
                else {
                    var n, o, i, a, l, c, u, s, f, d, p, y, m, b = nl(e);
                    n = {
                        x: t.x - b.x,
                        y: t.y - b.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return rw(n)
            }

            function np(e, t, r) {
                var n = rB(t),
                    o = rU(t),
                    i = "fixed" === r,
                    a = nc(e, !0, i, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = rn(0);
                if (n || !n && !i)
                    if (("body" !== rL(t) || rV(o)) && (l = r3(t)), n) {
                        var u = nc(t, !0, i, t);
                        c.x = u.x + t.clientLeft, c.y = u.y + t.clientTop
                    } else o && (c.x = nu(o));
                i && !n && o && (c.x = nu(o));
                var s = !o || n || i ? rn(0) : ns(o, l);
                return {
                    x: a.left + l.scrollLeft - c.x - s.x,
                    y: a.top + l.scrollTop - c.y - s.y,
                    width: a.width,
                    height: a.height
                }
            }

            function ny(e) {
                return "static" === r2(e).position
            }

            function nm(e, t) {
                if (!rB(e) || "fixed" === r2(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return rU(e) === r && (r = r.ownerDocument.body), r
            }

            function nb(e, t) {
                var r, n = rF(e);
                if (r$(e)) return n;
                if (!rB(e)) {
                    for (var o = r4(e); o && !r1(o);) {
                        if (rW(o) && !ny(o)) return o;
                        o = r4(o)
                    }
                    return n
                }
                for (var i = nm(e, t); i && (r = i, rK.has(rL(r))) && ny(i);) i = nm(i, t);
                return i && r1(i) && ny(i) && !rZ(i) ? n : i || function(e) {
                    for (var t = r4(e); rB(t) && !r1(t);) {
                        if (rZ(t)) return t;
                        if (r$(t)) break;
                        t = r4(t)
                    }
                    return null
                }(e) || n
            }
            var nh = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        o = "fixed" === e.strategy,
                        i = rU(n),
                        a = !!t && r$(t.floating);
                    if (n === i || a && o) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = rn(1),
                        u = rn(0),
                        s = rB(n);
                    if ((s || !s && !o) && (("body" !== rL(n) || rV(i)) && (l = r3(n)), rB(n))) {
                        var f = nc(n);
                        c = ni(n), u.x = f.x + n.clientLeft, u.y = f.y + n.clientTop
                    }
                    var d = !i || s || o ? rn(0) : ns(i, l);
                    return {
                        width: r.width * c.x,
                        height: r.height * c.y,
                        x: r.x * c.x - l.scrollLeft * c.x + u.x + d.x,
                        y: r.y * c.y - l.scrollTop * c.y + u.y + d.y
                    }
                },
                getDocumentElement: rU,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        o = e.strategy,
                        i = nt("clippingAncestors" === r ? r$(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = r8(e, [], !1).filter(function(e) {
                                    return rW(e) && "body" !== rL(e)
                                }), o = null, i = "fixed" === r2(e).position, a = i ? r4(e) : e; rW(a) && !r1(a);) {
                                var l = r2(a),
                                    c = rZ(a);
                                c || "fixed" !== l.position || (o = null), (i ? !c && !o : !c && "static" === l.position && !!o && nf.has(o.position) || rV(a) && !c && function e(t, r) {
                                    var n = r4(t);
                                    return !(n === r || !rW(n) || r1(n)) && ("fixed" === r2(n).position || e(n, r))
                                }(e, a)) ? n = n.filter(function(e) {
                                    return e !== a
                                }) : o = l, a = r4(a)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        a = i[0],
                        l = i.reduce(function(e, r) {
                            var n = nd(t, r, o);
                            return e.top = re(n.top, e.top), e.right = t9(n.right, e.right), e.bottom = t9(n.bottom, e.bottom), e.left = re(n.left, e.left), e
                        }, nd(t, a, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: nb,
                getElementRects: function(e) {
                    var t;
                    return (t = function() {
                        var t, r, n, o;
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(a, "next", {
                                value: c(0)
                            }), l(a, "throw", {
                                value: c(1)
                            }), l(a, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), a;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, n = u[1], u = [0];
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
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
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
                                    return t = this.getOffsetParent || nb, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = i.sent(), n = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = np.apply(void 0, o.concat([i.sent(), e.strategy])), n.floating = {
                                        x: 0,
                                        y: 0,
                                        width: r.width,
                                        height: r.height
                                    }, n)]
                            }
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var i = t.apply(e, r);

                            function a(e) {
                                r7(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                r7(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = nn(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: ni,
                isElement: rW,
                isRTL: function(e) {
                    return "rtl" === r2(e).direction
                }
            };

            function nv(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function ng(e, t, r, n) {
                void 0 === n && (n = {});
                var o, i = n.ancestorScroll,
                    a = void 0 === i || i,
                    l = n.ancestorResize,
                    c = void 0 === l || l,
                    u = n.elementResize,
                    s = void 0 === u ? "function" == typeof ResizeObserver : u,
                    f = n.layoutShift,
                    d = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    p = n.animationFrame,
                    y = void 0 !== p && p,
                    m = no(e),
                    b = a || c ? nt(m ? r8(m) : []).concat(nt(r8(t))) : [];
                b.forEach(function(e) {
                    a && e.addEventListener("scroll", r, {
                        passive: !0
                    }), c && e.addEventListener("resize", r)
                });
                var h = m && d ? function(e, t) {
                        var r, n = null,
                            o = rU(e);

                        function i() {
                            var e;
                            clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                        }
                        return ! function a(l, c) {
                            void 0 === l && (l = !1), void 0 === c && (c = 1), i();
                            var u = e.getBoundingClientRect(),
                                s = u.left,
                                f = u.top,
                                d = u.width,
                                p = u.height;
                            if (l || t(), d && p) {
                                var y = {
                                        rootMargin: -rr(f) + "px " + -rr(o.clientWidth - (s + d)) + "px " + -rr(o.clientHeight - (f + p)) + "px " + -rr(s) + "px",
                                        threshold: re(0, t9(1, c)) || 1
                                    },
                                    m = !0;
                                try {
                                    n = new IntersectionObserver(b, ne(r9({}, y), {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    n = new IntersectionObserver(b, y)
                                }
                                n.observe(e)
                            }

                            function b(t) {
                                var n = t[0].intersectionRatio;
                                if (n !== c) {
                                    if (!m) return a();
                                    n ? a(!1, n) : r = setTimeout(function() {
                                        a(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== n || nv(u, e.getBoundingClientRect()) || a(), m = !1
                            }
                        }(!0), i
                    }(m, r) : null,
                    v = -1,
                    g = null;
                s && (g = new ResizeObserver(function(e) {
                    var n = (function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(e) || nr(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === m && g && (g.unobserve(t), cancelAnimationFrame(v), v = requestAnimationFrame(function() {
                        var e;
                        null == (e = g) || e.observe(t)
                    })), r()
                }), m && !y && g.observe(m), g.observe(t));
                var w = y ? nc(e) : null;
                return y && function t() {
                        var n = nc(e);
                        w && !nv(w, n) && r(), w = n, o = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        b.forEach(function(e) {
                            a && e.removeEventListener("scroll", r), c && e.removeEventListener("resize", r)
                        }), null == h || h(), null == (e = g) || e.disconnect(), g = null, y && cancelAnimationFrame(o)
                    }
            }
            var nw = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return rx(function() {
                                var r, n, o, i, a, l, c, u, s, f, d, p, y, m, b, h, v, g, w, O, j, x, S, P, E, I, A, C, R, N, k, T, D, _, M, L, F;
                                return rC(this, function(U) {
                                    switch (U.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, o = t.placement, i = t.rects, a = t.platform, l = t.elements, c = t.middlewareData, s = (u = ra(e, t) || {}).element, d = void 0 === (f = u.padding) ? 0 : f, null == s) return [2, {}];
                                            return p = rg(d), y = {
                                                x: r,
                                                y: n
                                            }, b = rs(m = ru(rd(o))), [4, a.getDimensions(s)];
                                        case 1:
                                            return h = U.sent(), g = (v = "y" === m) ? "top" : "left", w = v ? "bottom" : "right", O = v ? "clientHeight" : "clientWidth", j = i.reference[b] + i.reference[m] - y[m] - i.floating[b], x = y[m] - i.reference[m], [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(s)];
                                        case 2:
                                            if (E = !(P = (S = U.sent()) ? S[O] : 0)) return [3, 4];
                                            return [4, null == a.isElement ? void 0 : a.isElement(S)];
                                        case 3:
                                            E = !U.sent(), U.label = 4;
                                        case 4:
                                            return E && (P = l.floating[O] || i.floating[b]), I = j / 2 - x / 2, A = P / 2 - h[b] / 2 - 1, C = t9(p[g], A), R = t9(p[w], A), N = C, k = P - h[b] - R, D = re(N, t9(T = P / 2 - h[b] / 2 + I, k)), M = (_ = !c.arrow && null != rc(o) && T !== D && i.reference[b] / 2 - (T < N ? C : R) - h[b] / 2 < 0) ? T < N ? T - N : T - k : 0, [2, (rS(F = {}, m, y[m] + M), rS(F, "data", rP((rS(L = {}, m, D), rS(L, "centerOffset", T - D - M), L), _ && {
                                                alignmentOffset: M
                                            })), rS(F, "reset", _), F)]
                                    }
                                })
                            })()
                        }
                    }
                },
                nO = function(e, t, r) {
                    var n, o = new Map,
                        i = r9({
                            platform: nh
                        }, r),
                        a = ne(r9({}, i.platform), {
                            _c: o
                        });
                    return n = ne(r9({}, i), {
                        platform: a
                    }), rx(function() {
                        var r, o, i, a, l, c, u, s, f, d, p, y, m, b, h, v, g, w, O, j, x, S, P, E, I, A;
                        return rC(this, function(C) {
                            switch (C.label) {
                                case 0:
                                    return o = void 0 === (r = n.placement) ? "bottom" : r, a = void 0 === (i = n.strategy) ? "absolute" : i, c = void 0 === (l = n.middleware) ? [] : l, u = n.platform, s = c.filter(Boolean), [4, null == u.isRTL ? void 0 : u.isRTL(t)];
                                case 1:
                                    return f = C.sent(), [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 2:
                                    y = (p = rR(d = C.sent(), o, f)).x, m = p.y, b = o, h = {}, v = 0, g = 0, C.label = 3;
                                case 3:
                                    if (!(g < s.length)) return [3, 11];
                                    return O = (w = s[g]).name, [4, (0, w.fn)({
                                        x: y,
                                        y: m,
                                        initialPlacement: o,
                                        placement: b,
                                        strategy: a,
                                        middlewareData: h,
                                        rects: d,
                                        platform: u,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    var R;
                                    if (x = (j = C.sent()).x, S = j.y, P = j.data, E = j.reset, y = null != x ? x : y, m = null != S ? S : m, h = rE(rP({}, h), rS({}, O, rP({}, h[O], P))), !(E && v <= 50)) return [3, 10];
                                    if (v++, (void 0 === E ? "undefined" : (R = E) && "u" > typeof Symbol && R.constructor === Symbol ? "symbol" : typeof R) != "object") return [3, 9];
                                    if (E.placement && (b = E.placement), !E.rects) return [3, 8];
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
                                    y = (A = rR(d, b, f)).x, m = A.y, C.label = 9;
                                case 9:
                                    g = -1, C.label = 10;
                                case 10:
                                    return g++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: y,
                                        y: m,
                                        placement: b,
                                        strategy: a,
                                        middlewareData: h
                                    }]
                            }
                        })
                    })()
                };

            function nj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nx(e) {
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

            function nS(e, t) {
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

            function nP(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nj(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nj(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nE(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var nI = "u" > typeof document ? H.useLayoutEffect : function() {};

            function nA(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : nE(e)) !== (void 0 === t ? "undefined" : nE(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : nE(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!nA(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, o[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, o, i = o[n];
                        if (("_owner" !== i || !e.$$typeof) && !nA(e[i], t[i])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function nC(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function nR(e, t) {
                var r = nC(e);
                return Math.round(t * r) / r
            }

            function nN(e) {
                var t = H.useRef(e);
                return nI(function() {
                    t.current = e
                }), t
            }
            var nk = function(e, t) {
                    var r;
                    return nS(nx({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return rx(function() {
                                var t, n, o, i, a, l, c;
                                return rC(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            var s;
                                            return o = e.x, i = e.y, a = e.placement, l = e.middlewareData, [4, (s = r, rx(function() {
                                                var t, r, n, o, i, a, l, c, u, f, d, p, y, m;
                                                return rC(this, function(b) {
                                                    switch (b.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return o = b.sent(), i = rl(t), a = rc(t), l = "y" === rd(t), c = rD.has(i) ? -1 : 1, u = o && l ? -1 : 1, p = (d = "number" == typeof(f = ra(s, e)) ? {
                                                                mainAxis: f,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: f.mainAxis || 0,
                                                                crossAxis: f.crossAxis || 0,
                                                                alignmentAxis: f.alignmentAxis
                                                            }).mainAxis, y = d.crossAxis, m = d.alignmentAxis, a && "number" == typeof m && (y = "end" === a ? -1 * m : m), [2, l ? {
                                                                x: y * u,
                                                                y: p * c
                                                            } : {
                                                                x: p * c,
                                                                y: y * u
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (c = u.sent(), a === (null == (t = l.offset) ? void 0 : t.placement) && null != (n = l.arrow) && n.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: o + c.x,
                                                y: i + c.y,
                                                data: rE(rP({}, c), {
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
                nT = function(e, t) {
                    var r;
                    return nS(nx({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return rx(function() {
                                var t, n, o, i, a, l, c, u, s, f, d, p, y, m, b, h, v, g, w, O, j, x, S, P, E, I, A, C;
                                return rC(this, function(R) {
                                    switch (R.label) {
                                        case 0:
                                            return t = e.x, n = e.y, o = e.placement, l = void 0 === (a = (i = ra(r, e)).mainAxis) || a, u = void 0 !== (c = i.crossAxis) && c, f = void 0 === (s = i.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, d = rI(i, ["mainAxis", "crossAxis", "limiter"]), p = {
                                                x: t,
                                                y: n
                                            }, [4, rN(e, d)];
                                        case 1:
                                            return y = R.sent(), h = p[b = ru(m = rd(rl(o)))], v = p[m], l && (g = "y" === b ? "top" : "left", w = "y" === b ? "bottom" : "right", O = h + y[g], j = h - y[w], h = re(O, t9(h, j))), u && (x = "y" === m ? "top" : "left", S = "y" === m ? "bottom" : "right", P = v + y[x], E = v - y[S], v = re(P, t9(v, E))), A = f.fn(rE(rP({}, e), (rS(I = {}, b, h), rS(I, m, v), I))), [2, rE(rP({}, A), {
                                                data: {
                                                    x: A.x - t,
                                                    y: A.y - n,
                                                    enabled: (rS(C = {}, b, l), rS(C, m, u), C)
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
                nD = function(e, t) {
                    var r;
                    return nS(nx({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                o = e.y,
                                i = e.placement,
                                a = e.rects,
                                l = e.middlewareData,
                                c = ra(r, e),
                                u = c.offset,
                                s = c.mainAxis,
                                f = c.crossAxis,
                                d = {
                                    x: n,
                                    y: o
                                },
                                p = rd(i),
                                y = ru(p),
                                m = d[y],
                                b = d[p],
                                h = ra(void 0 === u ? 0 : u, e),
                                v = "number" == typeof h ? {
                                    mainAxis: h,
                                    crossAxis: 0
                                } : rP({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, h);
                            if (void 0 === s || s) {
                                var g = "y" === y ? "height" : "width",
                                    w = a.reference[y] - a.floating[g] + v.mainAxis,
                                    O = a.reference[y] + a.reference[g] - v.mainAxis;
                                m < w ? m = w : m > O && (m = O)
                            }
                            if (void 0 === f || f) {
                                var j, x, S = "y" === y ? "width" : "height",
                                    P = rD.has(rl(i)),
                                    E = a.reference[p] - a.floating[S] + (P && (null == (j = l.offset) ? void 0 : j[p]) || 0) + (P ? 0 : v.crossAxis),
                                    I = a.reference[p] + a.reference[S] + (P ? 0 : (null == (x = l.offset) ? void 0 : x[p]) || 0) - (P ? v.crossAxis : 0);
                                b < E ? b = E : b > I && (b = I)
                            }
                            return rS(t = {}, y, m), rS(t, p, b), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                n_ = function(e, t) {
                    var r;
                    return nS(nx({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return rx(function() {
                                var t, n, o, i, a, l, c, u, s, f, d, p, y, m, b, h, v, g, w, O, j, x, S, P, E, I, A, C, R, N, k, T, D, _, M, L, F, U, z, W;
                                return rC(this, function(B) {
                                    var G, H, V, K, J, $, X, q, Y, Z, Q, ee, et, er, en;
                                    switch (B.label) {
                                        case 0:
                                            if (o = e.placement, i = e.middlewareData, a = e.rects, l = e.initialPlacement, c = e.platform, u = e.elements, d = void 0 === (f = (s = ra(r, e)).mainAxis) || f, y = void 0 === (p = s.crossAxis) || p, m = s.fallbackPlacements, h = void 0 === (b = s.fallbackStrategy) ? "bestFit" : b, g = void 0 === (v = s.fallbackAxisSideDirection) ? "none" : v, O = void 0 === (w = s.flipAlignment) || w, j = rI(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = i.arrow) && t.alignmentOffset) return [2, {}];
                                            return x = rl(o), S = rd(l), P = rl(l) === l, [4, null == c.isRTL ? void 0 : c.isRTL(u.floating)];
                                        case 1:
                                            return E = B.sent(), I = m || (P || !O ? [rv(l)] : (H = rv(G = l), [rp(G), H, rp(H)])), A = "none" !== g, !m && A && (C = I).push.apply(C, rA((V = l, K = O, J = g, $ = E, X = rc(V), q = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? rm : ry;
                                                        return t ? ry : rm;
                                                    case "left":
                                                    case "right":
                                                        return t ? rb : rh;
                                                    default:
                                                        return []
                                                }
                                            }(rl(V), "start" === J, $), X && (q = q.map(function(e) {
                                                return e + "-" + X
                                            }), K && (q = q.concat(q.map(rp)))), q))), R = [l].concat(rA(I)), [4, rN(e, j)];
                                        case 2:
                                            if (N = B.sent(), k = [], T = (null == (n = i.flip) ? void 0 : n.overflows) || [], d && k.push(N[x]), y && (Y = o, Z = a, void 0 === (Q = E) && (Q = !1), ee = rc(Y), er = rs(et = ru(rd(Y))), en = "x" === et ? ee === (Q ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", Z.reference[er] > Z.floating[er] && (en = rv(en)), D = [en, rv(en)], k.push(N[D[0]], N[D[1]])), T = rA(T).concat([{
                                                    placement: o,
                                                    overflows: k
                                                }]), !k.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((F = R[L = ((null == (_ = i.flip) ? void 0 : _.index) || 0) + 1]) && ("alignment" !== y || S === rd(F) || T.every(function(e) {
                                                        return rd(e.placement) !== S || e.overflows[0] > 0
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
                                                    })[0]) ? void 0 : M.placement)) switch (h) {
                                                    case "bestFit":
                                                        (W = null == (z = T.filter(function(e) {
                                                            if (A) {
                                                                var t = rd(e.placement);
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
                nM = function(e, t) {
                    var r;
                    return nS(nx({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return rx(function() {
                                var t, n, o, i, a, l, c, u, s, f, d, p, y, m, b, h, v, g, w, O, j, x, S, P, E, I, A, C, R, N;
                                return rC(this, function(k) {
                                    switch (k.label) {
                                        case 0:
                                            return o = e.placement, i = e.rects, a = e.platform, l = e.elements, s = void 0 === (u = (c = ra(r, e)).apply) ? function() {} : u, [4, rN(e, rI(c, ["apply"]))];
                                        case 1:
                                            if (f = k.sent(), d = rl(o), p = rc(o), y = "y" === rd(o), b = (m = i.floating).width, h = m.height, "top" !== d && "bottom" !== d) return [3, 3];
                                            return v = d, [4, null == a.isRTL ? void 0 : a.isRTL(l.floating)];
                                        case 2:
                                            return g = p === (k.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            g = d, v = "end" === p ? "top" : "bottom", k.label = 4;
                                        case 4:
                                            return w = h - f.top - f.bottom, O = b - f.left - f.right, j = t9(h - f[v], w), x = t9(b - f[g], O), S = !e.middlewareData.shift, P = j, E = x, null != (t = e.middlewareData.shift) && t.enabled.x && (E = O), null != (n = e.middlewareData.shift) && n.enabled.y && (P = w), S && !p && (I = re(f.left, 0), A = re(f.right, 0), C = re(f.top, 0), R = re(f.bottom, 0), y ? E = b - 2 * (0 !== I || 0 !== A ? I + A : re(f.left, f.right)) : P = h - 2 * (0 !== C || 0 !== R ? C + R : re(f.top, f.bottom))), [4, s(rE(rP({}, e), {
                                                availableWidth: E,
                                                availableHeight: P
                                            }))];
                                        case 5:
                                            return k.sent(), [4, a.getDimensions(l.floating)];
                                        case 6:
                                            if (N = k.sent(), b !== N.width || h !== N.height) return [2, {
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
                nL = function(e, t) {
                    var r;
                    return nS(nx({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return rx(function() {
                                var t, n, o, i, a, l, c;
                                return rC(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            switch (t = e.rects, i = void 0 === (o = (n = ra(r, e)).strategy) ? "referenceHidden" : o, a = rI(n, ["strategy"]), i) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, rN(e, rE(rP({}, a), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = rk(u.sent(), t.reference),
                                                    referenceHidden: rT(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, rN(e, rE(rP({}, a), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: c = rk(u.sent(), t.floating),
                                                    escaped: rT(c)
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
                nF = function(e, t) {
                    return nS(nx({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                o = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? nw({
                                element: n.current,
                                padding: o
                            }).fn(t) : {} : n ? nw({
                                element: n,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                },
                nU = H.forwardRef(function(e, t) {
                    var r, n, o = e.children,
                        i = e.width,
                        a = e.height,
                        l = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(e, ["children", "width", "height"]);
                    return (0, U.jsx)(tG.svg, (r = function(e) {
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
                    }({}, l), n = n = {
                        ref: t,
                        width: void 0 === i ? 10 : i,
                        height: void 0 === a ? 5 : a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? o : (0, U.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function nz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nB(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nG(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nB(e, t, r[t])
                    })
                }
                return e
            }

            function nH(e, t) {
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

            function nV(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function nK(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || nJ(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nJ(e, t) {
                if (e) {
                    if ("string" == typeof e) return nW(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nW(e, t)
                }
            }
            nU.displayName = "Arrow";
            var n$ = "Popper",
                nX = nK(tE(n$), 2),
                nq = nX[0],
                nY = nX[1],
                nZ = nK(nq(n$), 2),
                nQ = nZ[0],
                n0 = nZ[1],
                n1 = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = nK(H.useState(null), 2),
                        o = n[0],
                        i = n[1];
                    return (0, U.jsx)(nQ, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: i,
                        children: r
                    })
                };
            n1.displayName = n$;
            var n2 = "PopperAnchor",
                n3 = H.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = nV(e, ["__scopePopper", "virtualRef"]),
                        i = n0(n2, r),
                        a = H.useRef(null),
                        l = eK(t, a);
                    return H.useEffect(function() {
                        i.onAnchorChange((null == n ? void 0 : n.current) || a.current)
                    }), n ? null : (0, U.jsx)(tG.div, nH(nG({}, o), {
                        ref: l
                    }))
                });
            n3.displayName = n2;
            var n4 = "PopperContent",
                n8 = nK(nq(n4), 2),
                n5 = n8[0],
                n6 = n8[1],
                n7 = H.forwardRef(function(e, t) {
                    var r, n, o, i, a, l, c, u, s, f, d, p, y, m, b, h, v, g, w, O, j, x, S, P, E, I, A, C, R, N, k, T, D, _, M, L, F, z, W, B, G, V, K, J, $, X, q, Y, Z, Q, ee, et, er, en, eo, ei, ea = e.__scopePopper,
                        el = e.side,
                        ec = e.sideOffset,
                        eu = e.align,
                        es = void 0 === eu ? "center" : eu,
                        ef = e.alignOffset,
                        ed = e.arrowPadding,
                        ep = e.avoidCollisions,
                        ey = void 0 === ep || ep,
                        em = e.collisionBoundary,
                        eb = void 0 === em ? [] : em,
                        eh = e.collisionPadding,
                        ev = void 0 === eh ? 0 : eh,
                        eg = e.sticky,
                        ew = e.hideWhenDetached,
                        eO = e.updatePositionStrategy,
                        ej = void 0 === eO ? "optimized" : eO,
                        ex = e.onPlaced,
                        eS = nV(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        eP = n0(n4, ea),
                        eE = nK(H.useState(null), 2),
                        eI = eE[0],
                        eA = eE[1],
                        eC = eK(t, function(e) {
                            return eA(e)
                        }),
                        eR = nK(H.useState(null), 2),
                        eN = eR[0],
                        ek = eR[1],
                        eT = (o = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = H.useState(void 0)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(r) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return nz(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nz(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = n[1], t4(function() {
                            if (eN) {
                                i({
                                    width: eN.offsetWidth,
                                    height: eN.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var o = n.borderBoxSize,
                                                a = Array.isArray(o) ? o[0] : o;
                                            t = a.inlineSize, r = a.blockSize
                                        } else t = eN.offsetWidth, r = eN.offsetHeight;
                                        i({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(eN, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(eN)
                                    }
                            }
                            i(void 0)
                        }, [eN]), o),
                        eD = null != (Z = null == eT ? void 0 : eT.width) ? Z : 0,
                        e_ = null != (Q = null == eT ? void 0 : eT.height) ? Q : 0,
                        eM = "number" == typeof ev ? ev : nG({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, ev),
                        eL = Array.isArray(eb) ? eb : [eb],
                        eF = eL.length > 0,
                        eU = {
                            padding: eM,
                            boundary: eL.filter(or),
                            altBoundary: eF
                        },
                        ez = (c = void 0 === (l = (a = {
                            strategy: "fixed",
                            placement: (void 0 === el ? "bottom" : el) + ("center" !== es ? "-" + es : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ng.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return nW(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || nJ(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === ej
                                }]))
                            },
                            elements: {
                                reference: eP.anchor
                            },
                            middleware: [nk({
                                mainAxis: (void 0 === ec ? 0 : ec) + e_,
                                alignmentAxis: void 0 === ef ? 0 : ef
                            }), ey && nT(nG({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === eg ? "partial" : eg) ? nD() : void 0
                            }, eU)), ey && n_(nG({}, eU)), nM(nH(nG({}, eU), {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        i = r.reference,
                                        a = i.width,
                                        l = i.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(n, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), eN && nF({
                                element: eN,
                                padding: void 0 === ed ? 0 : ed
                            }), on({
                                arrowWidth: eD,
                                arrowHeight: e_
                            }), void 0 !== ew && ew && nL(nG({
                                strategy: "referenceHidden"
                            }, eU))]
                        }).placement) ? "bottom" : l, s = void 0 === (u = a.strategy) ? "absolute" : u, d = void 0 === (f = a.middleware) ? [] : f, p = a.platform, b = (m = void 0 === (y = a.elements) ? {} : y).reference, h = m.floating, g = void 0 === (v = a.transform) || v, w = a.whileElementsMounted, O = a.open, x = (j = nP(H.useState({
                            x: 0,
                            y: 0,
                            strategy: s,
                            placement: c,
                            middlewareData: {},
                            isPositioned: !1
                        }), 2))[0], S = j[1], E = (P = nP(H.useState(d), 2))[0], I = P[1], nA(E, d) || I(d), C = (A = nP(H.useState(null), 2))[0], R = A[1], k = (N = nP(H.useState(null), 2))[0], T = N[1], D = H.useCallback(function(e) {
                            e !== F.current && (F.current = e, R(e))
                        }, []), _ = H.useCallback(function(e) {
                            e !== z.current && (z.current = e, T(e))
                        }, []), M = b || C, L = h || k, F = H.useRef(null), z = H.useRef(null), W = H.useRef(x), B = null != w, G = nN(w), V = nN(p), K = nN(O), J = H.useCallback(function() {
                            if (F.current && z.current) {
                                var e = {
                                    placement: c,
                                    strategy: s,
                                    middleware: E
                                };
                                V.current && (e.platform = V.current), nO(F.current, z.current, e).then(function(e) {
                                    var t = nS(nx({}, e), {
                                        isPositioned: !1 !== K.current
                                    });
                                    $.current && !nA(W.current, t) && (W.current = t, tR.flushSync(function() {
                                        S(t)
                                    }))
                                })
                            }
                        }, [E, c, s, V, K]), nI(function() {
                            !1 === O && W.current.isPositioned && (W.current.isPositioned = !1, S(function(e) {
                                return nS(nx({}, e), {
                                    isPositioned: !1
                                })
                            }))
                        }, [O]), $ = H.useRef(!1), nI(function() {
                            return $.current = !0,
                                function() {
                                    $.current = !1
                                }
                        }, []), nI(function() {
                            if (M && (F.current = M), L && (z.current = L), M && L) {
                                if (G.current) return G.current(M, L, J);
                                J()
                            }
                        }, [M, L, J, G, B]), X = H.useMemo(function() {
                            return {
                                reference: F,
                                floating: z,
                                setReference: D,
                                setFloating: _
                            }
                        }, [D, _]), q = H.useMemo(function() {
                            return {
                                reference: M,
                                floating: L
                            }
                        }, [M, L]), Y = H.useMemo(function() {
                            var e = {
                                position: s,
                                left: 0,
                                top: 0
                            };
                            if (!q.floating) return e;
                            var t = nR(q.floating, x.x),
                                r = nR(q.floating, x.y);
                            return g ? nx(nS(nx({}, e), {
                                transform: "translate(" + t + "px, " + r + "px)"
                            }), nC(q.floating) >= 1.5 && {
                                willChange: "transform"
                            }) : {
                                position: s,
                                left: t,
                                top: r
                            }
                        }, [s, g, q.floating, x.x, x.y]), H.useMemo(function() {
                            return nS(nx({}, x), {
                                update: J,
                                refs: X,
                                elements: q,
                                floatingStyles: Y
                            })
                        }, [x, J, X, q, Y])),
                        eW = ez.refs,
                        eB = ez.floatingStyles,
                        eG = ez.placement,
                        eH = ez.isPositioned,
                        eV = ez.middlewareData,
                        eJ = nK(oo(eG), 2),
                        e$ = eJ[0],
                        eX = eJ[1],
                        eq = tV(ex);
                    t4(function() {
                        eH && (null == eq || eq())
                    }, [eH, eq]);
                    var eY = null == (ee = eV.arrow) ? void 0 : ee.x,
                        eZ = null == (et = eV.arrow) ? void 0 : et.y,
                        eQ = (null == (er = eV.arrow) ? void 0 : er.centerOffset) !== 0,
                        e0 = nK(H.useState(), 2),
                        e1 = e0[0],
                        e2 = e0[1];
                    return t4(function() {
                        eI && e2(window.getComputedStyle(eI).zIndex)
                    }, [eI]), (0, U.jsx)("div", {
                        ref: eW.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: nG(nH(nG({}, eB), nB({
                            transform: eH ? eB.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: e1
                        }, "--radix-popper-transform-origin", [null == (en = eV.transformOrigin) ? void 0 : en.x, null == (eo = eV.transformOrigin) ? void 0 : eo.y].join(" "))), (null == (ei = eV.hide) ? void 0 : ei.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, U.jsx)(n5, {
                            scope: ea,
                            placedSide: e$,
                            onArrowChange: ek,
                            arrowX: eY,
                            arrowY: eZ,
                            shouldHideArrow: eQ,
                            children: (0, U.jsx)(tG.div, nH(nG({
                                "data-side": e$,
                                "data-align": eX
                            }, eS), {
                                ref: eC,
                                style: nH(nG({}, eS.style), {
                                    animation: eH ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            n7.displayName = n4;
            var n9 = "PopperArrow",
                oe = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                ot = H.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = nV(e, ["__scopePopper"]),
                        i = n6(n9, n),
                        a = oe[i.placedSide];
                    return (0, U.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (nB(r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, a, 0), nB(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), nB(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), nB(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, U.jsx)(nU, nH(nG({}, o), {
                            ref: t,
                            style: nH(nG({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function or(e) {
                return null !== e
            }
            ot.displayName = n9;
            var on = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, i, a, l = t.placement,
                            c = t.rects,
                            u = t.middlewareData,
                            s = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            d = s ? 0 : e.arrowHeight,
                            p = nK(oo(l), 2),
                            y = p[0],
                            m = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            b = (null != (r = null == (i = u.arrow) ? void 0 : i.x) ? r : 0) + f / 2,
                            h = (null != (n = null == (a = u.arrow) ? void 0 : a.y) ? n : 0) + d / 2,
                            v = "",
                            g = "";
                        return "bottom" === y ? (v = s ? m : "".concat(b, "px"), g = "".concat(-d, "px")) : "top" === y ? (v = s ? m : "".concat(b, "px"), g = "".concat(c.floating.height + d, "px")) : "right" === y ? (v = "".concat(-d, "px"), g = s ? m : "".concat(h, "px")) : "left" === y && (v = "".concat(c.floating.width + d, "px"), g = s ? m : "".concat(h, "px")), {
                            data: {
                                x: v,
                                y: g
                            }
                        }
                    }
                }
            };

            function oo(e) {
                var t = nK(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function oi(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var oa = H.forwardRef(function(e, t) {
                var r, n, o, i, a, l = e.container,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, i = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }
                        if (i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.getOwnPropertyNames(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                        return i
                    }(e, ["container"]),
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = H.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return oi(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oi(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                t4(function() {
                    return f(!0)
                }, []);
                var d = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return d ? tN().createPortal((0, U.jsx)(tG.div, (n = function(e) {
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
                }({}, c), o = o = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                }), n)), d) : null
            });

            function ol(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oc(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ol(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ol(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            oa.displayName = "Portal";
            var ou = function(e) {
                var t, r, n, o, i, a, l, c, u, s, f, d, p, y, m, b, h, v = e.present,
                    g = e.children,
                    w = (t = v, i = (o = oc(H.useState(), 2))[0], a = o[1], l = H.useRef({}), c = H.useRef(t), u = H.useRef("none"), f = (s = oc((r = t ? "mounted" : "unmounted", n = {
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
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], d = s[1], H.useEffect(function() {
                        var e = os(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), t4(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = os(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), t4(function() {
                        if (i) {
                            var e, t, r = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = os(l.current).includes(e.animationName);
                                    if (e.target === i && n && (d("ANIMATION_END"), !c.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (u.current = os(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
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
                    j = eK(w.ref, (h = (b = null == (y = Object.getOwnPropertyDescriptor((p = O).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (h = (b = null == (m = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || w.isPresent ? H.cloneElement(O, {
                    ref: j
                }) : null
            };

            function os(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function of(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function od(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return of(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return of(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            ou.displayName = "Presence";
            var op = new WeakMap,
                oy = new WeakMap,
                om = {},
                ob = 0,
                oh = function(e) {
                    return e && (e.host || oh(e.parentNode))
                },
                ov = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = oh(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    om[r] || (om[r] = new WeakMap);
                    var i = om[r],
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
                                var t = e.getAttribute(n),
                                    o = null !== t && "false" !== t,
                                    c = (op.get(e) || 0) + 1,
                                    u = (i.get(e) || 0) + 1;
                                op.set(e, c), i.set(e, u), a.push(e), 1 === c && o && oy.set(e, !0), 1 === u && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), ob++,
                        function() {
                            a.forEach(function(e) {
                                var t = op.get(e) - 1,
                                    o = i.get(e) - 1;
                                op.set(e, t), i.set(e, o), t || (oy.has(e) || e.removeAttribute(n), oy.delete(e)), o || e.removeAttribute(r)
                            }), --ob || (op = new WeakMap, op = new WeakMap, oy = new WeakMap, om = {})
                        }
                },
                og = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), ov(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                },
                ow = function() {
                    return (ow = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function oO(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var oj = "right-scroll-bar-position",
                ox = "width-before-scroll-bar";

            function oS(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var oP = "u" > typeof window ? H.useLayoutEffect : H.useEffect,
                oE = new WeakMap,
                oI = (void 0 === b && (b = {}), (void 0 === h && (h = function(e) {
                    return e
                }), v = [], g = !1, w = {
                    read: function() {
                        if (g) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return v.length ? v[v.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = h(e, g);
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
                            var r = v;
                            v = [], r.forEach(e), t = v
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
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
                }).options = ow({
                    async: !0,
                    ssr: !1
                }, b), w),
                oA = function() {},
                oC = H.forwardRef(function(e, t) {
                    var r, n, o, i, a = H.useRef(null),
                        l = H.useState({
                            onScrollCapture: oA,
                            onWheelCapture: oA,
                            onTouchMoveCapture: oA
                        }),
                        c = l[0],
                        u = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        d = e.className,
                        p = e.removeScrollBar,
                        y = e.enabled,
                        m = e.shards,
                        b = e.sideCar,
                        h = e.noRelative,
                        v = e.noIsolation,
                        g = e.inert,
                        w = e.allowPinchZoom,
                        O = e.as,
                        j = e.gapMode,
                        x = oO(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return oS(t, e)
                            })
                        }, (o = (0, H.useState)(function() {
                            return {
                                value: null,
                                callback: n,
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
                        })[0]).callback = n, i = o.facade, oP(function() {
                            var e = oE.get(i);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = i.current;
                                t.forEach(function(e) {
                                    n.has(e) || oS(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || oS(e, o)
                                })
                            }
                            oE.set(i, r)
                        }, [r]), i),
                        P = ow(ow({}, x), c);
                    return H.createElement(H.Fragment, null, y && H.createElement(b, {
                        sideCar: oI,
                        removeScrollBar: p,
                        shards: m,
                        noRelative: h,
                        noIsolation: v,
                        inert: g,
                        setCallbacks: u,
                        allowPinchZoom: !!w,
                        lockRef: a,
                        gapMode: j
                    }), s ? H.cloneElement(H.Children.only(f), ow(ow({}, P), {
                        ref: S
                    })) : H.createElement(void 0 === O ? "div" : O, ow({}, P, {
                        className: d,
                        ref: S
                    }), f))
                });
            oC.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, oC.classNames = {
                fullWidth: ox,
                zeroRight: oj
            };
            var oR = function(e) {
                var t = e.sideCar,
                    r = oO(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return H.createElement(n, ow({}, r))
            };
            oR.isSideCarExport = !0;
            var oN = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = L || r.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var o, i;
                                (o = t).styleSheet ? o.styleSheet.cssText = n : o.appendChild(document.createTextNode(n)), i = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                ok = function() {
                    var e = oN();
                    return function(t, r) {
                        H.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                oT = function() {
                    var e = ok();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                oD = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                o_ = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                oM = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [o_(r), o_(n), o_(o)]
                },
                oL = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return oD;
                    var t = oM(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                oF = oT(),
                oU = "data-scroll-locked",
                oz = function(e, t, r, n) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(oU, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(oj, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(ox, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(oj, " .").concat(oj, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(ox, " .").concat(ox, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(oU, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                oW = function() {
                    var e = parseInt(document.body.getAttribute(oU) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                oB = function() {
                    H.useEffect(function() {
                        return document.body.setAttribute(oU, (oW() + 1).toString()),
                            function() {
                                var e = oW() - 1;
                                e <= 0 ? document.body.removeAttribute(oU) : document.body.setAttribute(oU, e.toString())
                            }
                    }, [])
                },
                oG = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    oB();
                    var i = H.useMemo(function() {
                        return oL(o)
                    }, [o]);
                    return H.createElement(oF, {
                        styles: oz(i, !t, o, r ? "" : "!important")
                    })
                },
                oH = !1;
            if ("u" > typeof window) try {
                var oV = Object.defineProperty({}, "passive", {
                    get: function() {
                        return oH = !0, !0
                    }
                });
                window.addEventListener("test", oV, oV), window.removeEventListener("test", oV, oV)
            } catch (e) {
                oH = !1
            }
            var oK = !!oH && {
                passive: !1
            };

            function oJ(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var o$ = function(e, t) {
                    if (!oJ(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                oX = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && oJ(n, ShadowRoot) && (n = n.host), oq(e, n)) {
                            var o = oY(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                oq = function(e, t) {
                    return "v" === e ? o$(t, "overflowY") : o$(t, "overflowX")
                },
                oY = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                oZ = function(e, t, r, n, o) {
                    var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                        l = a * n,
                        c = r.target,
                        u = t.contains(c),
                        s = !1,
                        f = l > 0,
                        d = 0,
                        p = 0;
                    do {
                        if (!c) break;
                        var y = oY(e, c),
                            m = y[0],
                            b = y[1] - y[2] - a * m;
                        (m || b) && oq(e, c) && (d += b, p += m);
                        var h = c.parentNode;
                        c = h && h.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? h.host : h
                    } while (!u && c !== document.body || u && (t.contains(c) || t === c));
                    return f && (o && 1 > Math.abs(d) || !o && l > d) ? s = !0 : !f && (o && 1 > Math.abs(p) || !o && -l > p) && (s = !0), s
                },
                oQ = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                o0 = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                o1 = function(e) {
                    return e && "current" in e ? e.current : e
                },
                o2 = 0,
                o3 = [],
                o4 = (O = function(e) {
                    var t = H.useRef([]),
                        r = H.useRef([0, 0]),
                        n = H.useRef(),
                        o = H.useState(o2++)[0],
                        i = H.useState(oT)[0],
                        a = H.useRef(e);
                    H.useEffect(function() {
                        a.current = e
                    }, [e]), H.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, i = t.length; o < i; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(o1), !0).filter(Boolean);
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
                            var o, i = oQ(e),
                                l = r.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - i[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - i[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var d = oX(f, s);
                            if (!d) return !0;
                            if (d ? o = f : (o = "v" === f ? "h" : "v", d = oX(f, s)), !d) return !1;
                            if (!n.current && "changedTouches" in e && (c || u) && (n.current = o), !o) return !0;
                            var p = n.current || o;
                            return oZ(p, t, e, "h" === p ? c : u, !0)
                        }, []),
                        c = H.useCallback(function(e) {
                            if (o3.length && o3[o3.length - 1] === i) {
                                var r = "deltaY" in e ? o0(e) : oQ(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (a.current.shards || []).map(o1).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = H.useCallback(function(e, r, n, o) {
                            var i = {
                                name: e,
                                delta: r,
                                target: n,
                                should: o,
                                shadowParent: function(e) {
                                    for (var t, r, n = null; null !== e;) t = e, (null != (r = ShadowRoot) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r) && (n = e.host, e = e.host), e = e.parentNode;
                                    return n
                                }(n)
                            };
                            t.current.push(i), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== i
                                })
                            }, 1)
                        }, []),
                        s = H.useCallback(function(e) {
                            r.current = oQ(e), n.current = void 0
                        }, []),
                        f = H.useCallback(function(t) {
                            u(t.type, o0(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        d = H.useCallback(function(t) {
                            u(t.type, oQ(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    H.useEffect(function() {
                        return o3.push(i), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: d
                            }), document.addEventListener("wheel", c, oK), document.addEventListener("touchmove", c, oK), document.addEventListener("touchstart", s, oK),
                            function() {
                                o3 = o3.filter(function(e) {
                                    return e !== i
                                }), document.removeEventListener("wheel", c, oK), document.removeEventListener("touchmove", c, oK), document.removeEventListener("touchstart", s, oK)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        y = e.inert;
                    return H.createElement(H.Fragment, null, y ? H.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, p ? H.createElement(oG, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, oI.useMedium(O), oR),
                o8 = H.forwardRef(function(e, t) {
                    return H.createElement(oC, ow({}, e, {
                        ref: t,
                        sideCar: o4
                    }))
                });

            function o5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o6(e) {
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

            function o7(e, t) {
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

            function o9(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function ie(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return o5(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o5(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            o8.classNames = oC.classNames;
            var it = "Popover",
                ir = ie(tE(it, [nY]), 2),
                io = ir[0];
            ir[1];
            var ii = nY(),
                ia = ie(io(it), 2),
                il = ia[0],
                ic = ia[1],
                iu = function(e) {
                    var t, r, n, o, i, a, l, c, u, s, f, d, p, y, m, b, h, v, g, w, O, j = e.__scopePopover,
                        x = e.children,
                        S = e.open,
                        P = e.defaultOpen,
                        E = e.onOpenChange,
                        I = e.modal,
                        A = ii(j),
                        C = H.useRef(null),
                        R = ie(H.useState(!1), 2),
                        N = R[0],
                        k = R[1],
                        T = ie((u = (c = {
                            prop: S,
                            defaultProp: P,
                            onChange: E
                        }).prop, p = (d = od((r = (t = {
                            defaultProp: c.defaultProp,
                            onChange: f = void 0 === (s = c.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, i = od(o = H.useState(r), 1)[0], a = H.useRef(i), l = tV(n), H.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], y = d[1], b = (m = void 0 !== u) ? u : p, h = tV(f), [b, H.useCallback(function(e) {
                            if (m) {
                                var t = "function" == typeof e ? e(u) : e;
                                t !== u && h(t)
                            } else y(e)
                        }, [m, u, y, h])]), 2),
                        D = T[0],
                        _ = T[1];
                    return (0, U.jsx)(n1, o7(o6({}, A), {
                        children: (0, U.jsx)(il, {
                            scope: j,
                            contentId: (w = (g = function(e) {
                                if (Array.isArray(e)) return e
                            }(v = H.useState(t5())) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var o = [],
                                        i = !0,
                                        a = !1;
                                    try {
                                        for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                    } catch (e) {
                                        a = !0, r = e
                                    } finally {
                                        try {
                                            i || null == n.return || n.return()
                                        } finally {
                                            if (a) throw r
                                        }
                                    }
                                    return o
                                }
                            }(v) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return t8(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return t8(e, 2)
                                }
                            }(v) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0], O = g[1], t4(function() {
                                O(function(e) {
                                    return null != e ? e : String(t6++)
                                })
                            }, [void 0]), w ? "radix-".concat(w) : ""),
                            triggerRef: C,
                            open: void 0 !== D && D,
                            onOpenChange: _,
                            onOpenToggle: H.useCallback(function() {
                                return _(function(e) {
                                    return !e
                                })
                            }, [_]),
                            hasCustomAnchor: N,
                            onCustomAnchorAdd: H.useCallback(function() {
                                return k(!0)
                            }, []),
                            onCustomAnchorRemove: H.useCallback(function() {
                                return k(!1)
                            }, []),
                            modal: void 0 !== I && I,
                            children: x
                        })
                    }))
                };
            iu.displayName = it;
            var is = "PopoverAnchor",
                id = H.forwardRef(function(e, t) {
                    var r = e.__scopePopover,
                        n = o9(e, ["__scopePopover"]),
                        o = ic(is, r),
                        i = ii(r),
                        a = o.onCustomAnchorAdd,
                        l = o.onCustomAnchorRemove;
                    return H.useEffect(function() {
                        return a(),
                            function() {
                                return l()
                            }
                    }, [a, l]), (0, U.jsx)(n3, o7(o6({}, i, n), {
                        ref: t
                    }))
                });
            id.displayName = is;
            var ip = "PopoverTrigger";
            H.forwardRef(function(e, t) {
                var r = e.__scopePopover,
                    n = o9(e, ["__scopePopover"]),
                    o = ic(ip, r),
                    i = ii(r),
                    a = eK(t, o.triggerRef),
                    l = (0, U.jsx)(tG.button, o7(o6({
                        type: "button",
                        "aria-haspopup": "dialog",
                        "aria-expanded": o.open,
                        "aria-controls": o.contentId,
                        "data-state": iE(o.open)
                    }, n), {
                        ref: a,
                        onClick: tO(e.onClick, o.onOpenToggle)
                    }));
                return o.hasCustomAnchor ? l : (0, U.jsx)(n3, o7(o6({
                    asChild: !0
                }, i), {
                    children: l
                }))
            }).displayName = ip;
            var iy = "PopoverPortal",
                im = ie(io(iy, {
                    forceMount: void 0
                }), 2),
                ib = im[0],
                ih = im[1],
                iv = function(e) {
                    var t = e.__scopePopover,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = ic(iy, t);
                    return (0, U.jsx)(ib, {
                        scope: t,
                        forceMount: r,
                        children: (0, U.jsx)(ou, {
                            present: r || i.open,
                            children: (0, U.jsx)(oa, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            iv.displayName = iy;
            var ig = "PopoverContent",
                iw = H.forwardRef(function(e, t) {
                    var r = ih(ig, e.__scopePopover),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = o9(e, ["forceMount"]),
                        a = ic(ig, e.__scopePopover);
                    return (0, U.jsx)(ou, {
                        present: o || a.open,
                        children: a.modal ? (0, U.jsx)(ij, o7(o6({}, i), {
                            ref: t
                        })) : (0, U.jsx)(ix, o7(o6({}, i), {
                            ref: t
                        }))
                    })
                });
            iw.displayName = ig;
            var iO = tL("PopoverContent.RemoveScroll"),
                ij = H.forwardRef(function(e, t) {
                    var r = ic(ig, e.__scopePopover),
                        n = H.useRef(null),
                        o = eK(t, n),
                        i = H.useRef(!1);
                    return H.useEffect(function() {
                        var e = n.current;
                        if (e) return og(e)
                    }, []), (0, U.jsx)(o8, {
                        as: iO,
                        allowPinchZoom: !0,
                        children: (0, U.jsx)(iS, o7(o6({}, e), {
                            ref: o,
                            trapFocus: r.open,
                            disableOutsidePointerEvents: !0,
                            onCloseAutoFocus: tO(e.onCloseAutoFocus, function(e) {
                                var t;
                                e.preventDefault(), i.current || null == (t = r.triggerRef.current) || t.focus()
                            }),
                            onPointerDownOutside: tO(e.onPointerDownOutside, function(e) {
                                var t = e.detail.originalEvent,
                                    r = 0 === t.button && !0 === t.ctrlKey;
                                i.current = 2 === t.button || r
                            }, {
                                checkForDefaultPrevented: !1
                            }),
                            onFocusOutside: tO(e.onFocusOutside, function(e) {
                                return e.preventDefault()
                            }, {
                                checkForDefaultPrevented: !1
                            })
                        }))
                    })
                }),
                ix = H.forwardRef(function(e, t) {
                    var r = ic(ig, e.__scopePopover),
                        n = H.useRef(!1),
                        o = H.useRef(!1);
                    return (0, U.jsx)(iS, o7(o6({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var i, a;
                            null == (i = e.onCloseAutoFocus) || i.call(e, t), t.defaultPrevented || (n.current || null == (a = r.triggerRef.current) || a.focus(), t.preventDefault()), n.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (i = e.onInteractOutside) || i.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var i, a, l = t.target;
                            (null == (a = r.triggerRef.current) ? void 0 : a.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                iS = H.forwardRef(function(e, t) {
                    var r = e.__scopePopover,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = e.disableOutsidePointerEvents,
                        l = e.onEscapeKeyDown,
                        c = e.onPointerDownOutside,
                        u = e.onFocusOutside,
                        s = e.onInteractOutside,
                        f = o9(e, ["__scopePopover", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus", "disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside"]),
                        d = ic(ig, r),
                        p = ii(r);
                    return (0, tC.useFocusGuards)(), (0, U.jsx)(tZ, {
                        asChild: !0,
                        loop: !0,
                        trapped: n,
                        onMountAutoFocus: o,
                        onUnmountAutoFocus: i,
                        children: (0, U.jsx)(tA.DismissableLayer, {
                            asChild: !0,
                            disableOutsidePointerEvents: a,
                            onInteractOutside: s,
                            onEscapeKeyDown: l,
                            onPointerDownOutside: c,
                            onFocusOutside: u,
                            onDismiss: function() {
                                return d.onOpenChange(!1)
                            },
                            children: (0, U.jsx)(n7, o7(o6({
                                "data-state": iE(d.open),
                                role: "dialog",
                                id: d.contentId
                            }, p, f), {
                                ref: t,
                                style: o6({}, f.style, {
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
                iP = "PopoverClose";

            function iE(e) {
                return e ? "open" : "closed"
            }
            H.forwardRef(function(e, t) {
                var r = e.__scopePopover,
                    n = o9(e, ["__scopePopover"]),
                    o = ic(iP, r);
                return (0, U.jsx)(tG.button, o7(o6({
                    type: "button"
                }, n), {
                    ref: t,
                    onClick: tO(e.onClick, function() {
                        return o.onOpenChange(!1)
                    })
                }))
            }).displayName = iP, H.forwardRef(function(e, t) {
                var r = e.__scopePopover,
                    n = o9(e, ["__scopePopover"]),
                    o = ii(r);
                return (0, U.jsx)(ot, o7(o6({}, o, n), {
                    ref: t
                }))
            }).displayName = "PopoverArrow";
            var iI = function(e) {
                var t, r, n, o, i, a, l = null != (t = null == (n = (o = window).matchMedia) || null == (r = n.call(o, "(pointer: coarse)")) ? void 0 : r.matches) && t,
                    c = null == (i = document.activeElement) ? void 0 : i.matches(":focus-visible");
                if (l && !c) return void e.preventDefault();
                var u = null == (a = e.currentTarget) ? void 0 : a.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
                u && (e.preventDefault(), u.focus())
            };

            function iA(e) {
                var t = e.open,
                    r = e.defaultOpen,
                    n = e.onOpenChange,
                    o = e.children;
                return H.createElement(iu, {
                    open: t,
                    defaultOpen: r,
                    onOpenChange: n
                }, o)
            }

            function iC(e) {
                var t, r, n = e.side,
                    o = e.align,
                    i = e.sideOffset,
                    a = e.className,
                    l = e.children,
                    c = e.ariaLabel,
                    u = e.onOpenAutoFocus,
                    s = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, i = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }
                        if (i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.getOwnPropertyNames(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                        return i
                    }(e, ["side", "align", "sideOffset", "className", "children", "ariaLabel", "onOpenAutoFocus"]);
                return H.createElement(iv, null, H.createElement(iw, (t = function(e) {
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
                }({
                    side: void 0 === n ? "bottom" : n,
                    align: void 0 === o ? "center" : o,
                    sideOffset: void 0 === i ? 4 : i
                }, s), r = r = {
                    "aria-label": null != c ? c : s["aria-label"],
                    onOpenAutoFocus: null != u ? u : iI,
                    className: eE("foundation-web-portal-zindex", a)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(r)).forEach(function(e) {
                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                }), t), l))
            }

            function iR(e) {
                var t = e.asChild,
                    r = e.className,
                    n = e.children;
                return H.createElement(id, {
                    asChild: t,
                    className: r
                }, n)
            }

            function iN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ik = function(e) {
                    var t, r = e.trigger,
                        n = e.content,
                        o = e.dropdownWidth,
                        i = e.ariaLabel,
                        a = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, H.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return iN(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iN(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        l = a[0],
                        c = a[1],
                        u = (0, H.useRef)(null),
                        s = (0, H.useRef)(null),
                        f = (0, H.useCallback)(function() {
                            c(!0)
                        }, []),
                        d = (0, H.useCallback)(function(e) {
                            var t, r, n, o, i = e.relatedTarget;
                            null == i ? c(!1) : null != (t = null == (n = u.current) ? void 0 : n.contains(i)) && t || null != (r = null == (o = s.current) ? void 0 : o.contains(i)) && r || c(!1)
                        }, []);
                    return (0, U.jsxs)(iA, {
                        open: l,
                        onOpenChange: c,
                        children: [(0, U.jsx)(iR, {
                            asChild: !0,
                            children: (0, U.jsx)("div", {
                                ref: u,
                                onMouseEnter: f,
                                onMouseLeave: d,
                                children: r
                            })
                        }), (0, U.jsx)(iC, {
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
                                children: n
                            })
                        })]
                    })
                },
                iT = window.Roblox["core-scripts"].eventStream,
                iD = function(e, t, r) {
                    return t ? R.InGame : e && "Studio" === r ? R.InStudio : e ? R.Online : R.Offline
                };

            function i_(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var iM = function(e, t, r, n, o, i, a, l) {
                    var c = arguments.length > 8 && void 0 !== arguments[8] ? arguments[8] : "OpenProfile",
                        u = (0, H.useCallback)(function() {
                            var u, s;
                            return i_(s = {}, A.Context, n), i_(s, A.ContentType, C.User), i_(s, A.CollectionId, i), i_(s, A.CollectionPosition, void 0 !== a ? a + 1 : -1), i_(s, D.TotalNumberOfItems, l), i_(s, D.ActionType, c), i_(s, D.ItemId, e.id.toString()), i_(s, D.ItemPosition, t + 1), i_(s, D.PositionInTopic, t + 1), i_(s, D.RowNumber, 1), i_(s, _.Presence, iD(e.presence.isOnline, e.presence.isInGame, e.presence.lastLocation)), i_(s, _.PresenceUniverseId, null != (u = e.presence.universeId) ? u : -1), i_(s, _.FriendStatus, "friend"), i_(s, _.SourceCarousel, r), i_(s, I.HomePageSessionInfo, o), s
                        }, [e, t, o, i, a, r, n, l, c]);
                    return (0, H.useCallback)(function() {
                        var e = u();
                        (0, iT.sendEvent)({
                            name: P.ItemAction,
                            type: P.ItemAction,
                            context: n
                        }, Z(function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var r = null != arguments[t] ? arguments[t] : {},
                                    n = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                                }))), n.forEach(function(t) {
                                    i_(e, t, r[t])
                                })
                            }
                            return e
                        }({}, e)))
                    }, [u, n])
                },
                iL = function(e) {
                    var t, r, n, o = e.friend,
                        i = e.friendIndex,
                        a = e.isOwnUser,
                        l = e.translate,
                        c = e.canChat,
                        u = e.carouselName,
                        s = e.eventContext,
                        f = e.homePageSessionInfo,
                        d = e.sortId,
                        p = e.sortPosition,
                        y = e.totalNumberOfFriends,
                        m = e.isIARCJoinCardRedesignEnabled,
                        b = e.isIARCJoinCardGameRowClickableEnabled,
                        h = "".concat(ea().websiteUrl, "/users/").concat(o.id, "/profile"),
                        v = null != (t = o.combinedName) ? t : l("Label.UnavailableFriendName"),
                        g = ew().usePresence(o.id, void 0),
                        w = null != g.gameId,
                        O = w ? g.lastLocation : null,
                        j = null != O && O.length > 15 ? "".concat(O.slice(0, 15), "...") : O,
                        x = w ? "".concat(ea().websiteUrl, "/games/").concat(null != (r = g.placeId) ? r : "") : "",
                        S = iM(o, i, u, s, f, d, p, y),
                        P = iM(o, i, u, s, f, d, p, y, "OpenGameDetails");
                    return (0, U.jsx)("div", {
                        className: "friends-carousel-tile",
                        children: (0, U.jsx)(ik, {
                            ariaLabel: v,
                            trigger: (0, U.jsx)("button", {
                                type: "button",
                                className: "options-dropdown",
                                id: "friend-tile-button",
                                onClick: function() {},
                                children: (0, U.jsx)(eL, {
                                    id: o.id,
                                    displayName: v,
                                    userProfileUrl: h,
                                    userPresence: j,
                                    translate: l,
                                    hasVerifiedBadge: o.hasVerifiedBadge,
                                    isRobloxPlus: o.isRobloxPlus,
                                    sendClickEvent: S
                                })
                            }),
                            content: a ? (0, U.jsx)(tw, {
                                friend: o,
                                isInGame: w,
                                universeId: null != (n = g.universeId) ? n : 0,
                                displayName: v,
                                userProfileUrl: h,
                                userPresence: O,
                                translate: l,
                                gameUrl: x,
                                canChat: c,
                                isIARCJoinCardRedesignEnabled: m,
                                isIARCJoinCardGameRowClickableEnabled: b,
                                sendGameRowClickEvent: P
                            }) : (0, U.jsx)("div", {}),
                            dropdownWidth: null == j ? 240 : m ? 260 : 315
                        })
                    })
                };

            function iF(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var iU = function(e, t, r, n, o, i, a) {
                    var l, c = (0, H.useCallback)(function(e) {
                            if (t) {
                                var l, c = e.filter(function(e) {
                                    return e < t.length
                                });
                                return iF(l = {}, A.Context, n), iF(l, A.ContentType, C.User), iF(l, A.CollectionId, i), iF(l, A.CollectionPosition, void 0 !== a ? a + 1 : -1), iF(l, k.TotalNumberOfItems, t.length), iF(l, k.ItemIds, c.map(function(e) {
                                    var r, n;
                                    return null != (r = null == (n = t[e]) ? void 0 : n.id.toString()) ? r : "-1"
                                })), iF(l, k.ItemPositions, c.map(function(e) {
                                    return e + 1
                                })), iF(l, k.PositionsInTopic, c.map(function(e) {
                                    return e + 1
                                })), iF(l, k.RowNumbers, c.map(function() {
                                    return 1
                                })), iF(l, T.Presences, c.map(function(e) {
                                    var r, n, o;
                                    return iD(null == (r = t[e]) ? void 0 : r.presence.isOnline, null == (n = t[e]) ? void 0 : n.presence.isInGame, null == (o = t[e]) ? void 0 : o.presence.lastLocation)
                                })), iF(l, T.PresenceUniverseIds, c.map(function(e) {
                                    var r, n;
                                    return null != (r = null == (n = t[e]) ? void 0 : n.presence.universeId) ? r : -1
                                })), iF(l, T.FriendStatuses, c.map(function() {
                                    return N.Friend
                                })), iF(l, T.SourceCarousel, r), iF(l, I.HomePageSessionInfo, o), l
                            }
                        }, [t, o, i, a, r, n]),
                        u = (0, H.useCallback)(function(e) {
                            var t, r = c(e);
                            void 0 !== r ? (0, iT.sendEvent)({
                                name: P.ItemImpressions,
                                type: P.ItemImpressions,
                                context: n
                            }, Z(function(e) {
                                for (var t = 1; t < arguments.length; t++) {
                                    var r = null != arguments[t] ? arguments[t] : {},
                                        n = Object.keys(r);
                                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                                    }))), n.forEach(function(t) {
                                        iF(e, t, r[t])
                                    })
                                }
                                return e
                            }({}, r))) : null == (t = window.EventTracker) || t.fireEvent("WebHomePageFriendsCarouselItemImpressionsUndefinedError")
                        }, [c, n]);
                    q(e, null != (l = null == t ? void 0 : t.length) ? l : 0, u)
                },
                iz = ((j = iz || {}).WebHomeFriendsCarousel = "WebHomeFriendsCarousel", j.WebProfileFriendsCarousel = "WebProfileFriendsCarousel", j);

            function iW(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                    var o = 0;
                    for (n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]])
                }
                return r
            }
            var iB = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                iG = V().forwardRef(function(e, t) {
                    var r = e.name,
                        n = e.size,
                        o = e.className,
                        i = (e.children, iW(e, ["name", "size", "className", "children"]));
                    return V().createElement("span", Object.assign({
                        ref: t,
                        role: "presentation",
                        className: eE("grow-0 shrink-0 basis-auto icon", r, iB[void 0 === n ? "Medium" : n], o)
                    }, i))
                });
            iG.displayName = "Icon";
            var iH = {
                    Neutral: "bg-shift-300",
                    Standard: "bg-shift-300",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-system-success",
                    Warning: "bg-system-warning",
                    Alert: "bg-system-alert",
                    OverMedia: "bg-[var(--light-mode-surface-100)]"
                },
                iV = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-[var(--light-mode-content-emphasis)]",
                    Warning: "content-[var(--light-mode-content-emphasis)]",
                    Alert: "content-[var(--dark-mode-content-emphasis)]",
                    OverMedia: "content-[var(--light-mode-content-emphasis)]"
                },
                iK = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-standard"
                },
                iJ = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                i$ = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                iX = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                iq = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                iY = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                iZ = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                iQ = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                i0 = V().forwardRef(function(e, t) {
                    var r = e.className,
                        n = e.label,
                        o = e.variant,
                        i = void 0 === o ? "Neutral" : o,
                        a = e.icon,
                        l = e.size,
                        c = void 0 === l ? "Small" : l,
                        u = e.shape,
                        s = iW(e, ["className", "label", "variant", "icon", "size", "shape"]),
                        f = a && !n;
                    return V().createElement("div", Object.assign({
                        ref: t
                    }, s, {
                        className: eE("foundation-web-badge flex items-center select-none gap-xsmall", iQ[void 0 === u ? "Pill" : u], iJ[c], f ? [iX[c], "justify-center"] : ["width-[fit-content]", i$[c]], iH[i], iV[i], iK[i], r),
                        style: "OverMedia" === i ? {
                            borderColor: "var(--light-mode-stroke-default)"
                        } : void 0
                    }), a && V().createElement(iG, {
                        name: a,
                        size: iZ[c]
                    }), n && V().createElement("span", {
                        className: eE("text-no-wrap text-truncate-split", iq[c], iY[c], iV[i])
                    }, n))
                });
            i0.displayName = "Badge";
            var i1 = function(e) {
                var t = e.translate,
                    r = e.badgeCount;
                return (0, U.jsx)("div", {
                    className: "friends-carousel-tile",
                    children: (0, U.jsx)("button", {
                        type: "button",
                        id: "friend-tile-button",
                        children: (0, U.jsxs)("a", {
                            href: "/users/friends#!/friend-requests",
                            children: [(0, U.jsxs)("div", {
                                className: "add-friends-icon-container",
                                children: [r > 0 && (0, U.jsx)(i0, {
                                    className: "friend-request-badge",
                                    variant: "Alert",
                                    label: r > 99 ? "99+" : String(r)
                                }), (0, U.jsx)(ek, {
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

            function i2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i3(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return i2(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i2(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var i4 = function(e) {
                    var t = e.friendsList,
                        r = e.isOwnUser,
                        n = e.translate,
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
                        y = (0, H.useRef)(null),
                        m = i3((0, H.useState)(t), 2),
                        b = m[0],
                        h = m[1],
                        v = i3((0, H.useState)(!1), 2),
                        g = v[0],
                        w = v[1],
                        O = i3((0, H.useState)(null), 2),
                        j = O[0],
                        x = O[1],
                        S = (0, H.useRef)(null),
                        P = i === iz.WebHomeFriendsCarousel && f;
                    return (0, H.useEffect)(function() {
                        var e = y.current;
                        if (null != e) {
                            var t = new ResizeObserver(function() {
                                x(e.offsetWidth)
                            });
                            return t.observe(e),
                                function() {
                                    t.disconnect()
                                }
                        }
                    }, []), (0, H.useEffect)(function() {
                        var e, r, n = null != j ? j : null == (r = y.current) ? void 0 : r.offsetWidth,
                            o = null != (e = null == t ? void 0 : t.length) ? e : 0;
                        if (null != n && null != t) {
                            var i = Math.floor(n / 110);
                            w(110 * (P ? o + 1 : o) > n), h(t.slice(0, i - !!P))
                        }
                    }, [j, t, P]), iU(S, t, i, a, l, c, u), (0, U.jsx)("div", {
                        children: (0, U.jsx)("div", {
                            ref: function(e) {
                                return y.current = e, y.current
                            },
                            className: "friends-carousel-container",
                            children: null == b ? (0, U.jsx)("span", {
                                className: "spinner spinner-default"
                            }) : (0, U.jsxs)("div", {
                                ref: S,
                                className: g ? "friends-carousel-list-container" : "friends-carousel-list-container-not-full",
                                children: [P ? (0, U.jsx)(i1, {
                                    translate: n,
                                    badgeCount: s,
                                    "data-testid": "add-friends-tile"
                                }, "add-friends-tile") : null, b.map(function(e, s) {
                                    var f;
                                    return (0, U.jsx)("div", {
                                        children: (0, U.jsx)(iL, {
                                            friend: e,
                                            friendIndex: s,
                                            translate: n,
                                            isOwnUser: r,
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
                i8 = window.Roblox["core-scripts"].meta.user;

            function i5(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var i6 = ea().apiGatewayUrl,
                i7 = function(e) {
                    var t;
                    return (t = function() {
                        var t, r;
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(a, "next", {
                                value: c(0)
                            }), l(a, "throw", {
                                value: c(1)
                            }), l(a, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), a;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, n = u[1], u = [0];
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
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    if (null == (r = null == (t = (0, i8.authenticatedUser)()) ? void 0 : t.id)) return [2, {
                                        users: [{
                                            isBlocked: !1,
                                            isBlockingViewer: !1,
                                            userId: 0
                                        }]
                                    }];
                                    return [4, el.post({
                                        url: "".concat(i6, "/user-blocking-api/v1/users/batch-check-reciprocal-block"),
                                        withCredentials: !0
                                    }, {
                                        userIds: e,
                                        requesterId: r
                                    })];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var i = t.apply(e, r);

                            function a(e) {
                                i5(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                i5(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                };

            function i9(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var ae = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null,
                        r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(ea().apiGatewayUrl, "/access-management/v1/upsell-feature-access?featureName=").concat(e).concat(t ? "&extraParameters=".concat(t) : "").concat(r ? "&successfulActions=".concat(r) : "")
                    }
                },
                at = function(e, t, r) {
                    var n;
                    return (n = function() {
                        var n;
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(a, "next", {
                                value: c(0)
                            }), l(a, "throw", {
                                value: c(1)
                            }), l(a, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), a;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, n = u[1], u = [0];
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
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
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
                                    return n = ae(e, t ? btoa(JSON.stringify(t)) : null, r), [4, el.get(n)];
                                case 1:
                                    return [2, o.sent().data]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                i9(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                i9(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                };

            function ar(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function an(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            ar(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            ar(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function ao(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, n = u[1], u = [0];
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
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function ai(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aa(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function al(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            aa(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            aa(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function ac(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ai(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ai(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function au(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, n = u[1], u = [0];
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
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var as = "FriendshipNotifications",
                af = "fulfilled",
                ad = eo().userDataStore,
                ap = function(e) {
                    var t = e.profileUserId,
                        r = e.isOwnUser,
                        n = e.carouselName,
                        o = e.eventContext,
                        i = e.homePageSessionInfo,
                        a = e.sortId,
                        l = e.sortPosition,
                        c = ac((0, H.useState)(null), 2),
                        u = c[0],
                        s = c[1],
                        f = ac((0, H.useState)(null), 2),
                        d = f[0],
                        p = f[1],
                        y = ac((0, H.useState)(!1), 2),
                        m = y[0],
                        b = y[1],
                        h = ac((0, H.useState)(null), 2),
                        v = h[0],
                        g = h[1],
                        w = ac((0, H.useState)(!1), 2),
                        O = w[0],
                        j = w[1],
                        x = ac((0, H.useState)({
                            isBadgeEnabled: !1,
                            isAddFriendsTileEnabledWeb: !1,
                            isIARCJoinCardRedesignEnabled: !1,
                            isIARCJoinCardGameRowClickableEnabled: !1
                        }), 2),
                        S = x[0],
                        P = x[1],
                        E = (0, B.useTranslation)().translate;
                    return (0, H.useEffect)(function() {
                        ad.clearUserDataStoreCache()
                    }, []), (0, H.useEffect)(function() {
                        if (O) {
                            var e = function() {
                                    return al(function() {
                                        return au(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return e.trys.push([0, 2, , 3]), [4, em()];
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
                                t = er().GetClient();
                            return t.Subscribe(as, e),
                                function() {
                                    t.Unsubscribe(as, e)
                                }
                        }
                    }, [O]), (0, H.useEffect)(function() {
                        al(function() {
                            var e, o, i, a, l, c, u, f, d, y, m, h, v;
                            return au(this, function(w) {
                                var O;
                                switch (w.label) {
                                    case 0:
                                        return [4, Promise.allSettled([es(function() {
                                            var e;
                                            return ey(this, function(r) {
                                                switch (r.label) {
                                                    case 0:
                                                        return e = {
                                                            url: "".concat(ea().friendsApi, "/v1/users/").concat(t, "/friends/count"),
                                                            retryable: !0,
                                                            withCredentials: !0
                                                        }, [4, el.get(e)];
                                                    case 1:
                                                        return [2, r.sent().data]
                                                }
                                            })
                                        })(), es(function() {
                                            var e, n, o, i, a, l, c, u, s, f, d, p, y, m, b;
                                            return ey(this, function(h) {
                                                var v;
                                                switch (h.label) {
                                                    case 0:
                                                        return [4, Promise.all([es(function() {
                                                            return ey(this, function(e) {
                                                                switch (e.label) {
                                                                    case 0:
                                                                        if (!r) return [2, []];
                                                                        e.label = 1;
                                                                    case 1:
                                                                        return e.trys.push([1, 3, , 4]), [4, es(function() {
                                                                            var e;
                                                                            return ey(this, function(r) {
                                                                                switch (r.label) {
                                                                                    case 0:
                                                                                        return e = {
                                                                                            url: "".concat(ea().friendsApi, "/v1/users/").concat(t, "/friends/online"),
                                                                                            retryable: !0,
                                                                                            withCredentials: !0
                                                                                        }, [4, el.get(e)];
                                                                                    case 1:
                                                                                        return [2, r.sent().data]
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
                                                            return ey(this, function(e) {
                                                                switch (e.label) {
                                                                    case 0:
                                                                        return e.trys.push([0, 2, , 3]), [4, es(function() {
                                                                            var e, n;
                                                                            return ey(this, function(o) {
                                                                                switch (o.label) {
                                                                                    case 0:
                                                                                        return e = "".concat(ea().friendsApi, "/v1/users/").concat(t, "/friends/find"), n = {
                                                                                            url: r ? "".concat(e, "?userSort=1") : e,
                                                                                            retryable: !0,
                                                                                            withCredentials: !0
                                                                                        }, [4, el.get(n)];
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
                                                        n = (e = ef.apply(void 0, [h.sent(), 2]))[0], o = e[1], n.sort(function(e, t) {
                                                            return t.sortScore - e.sortScore
                                                        }), i = new Map, a = !0, l = !1, c = void 0;
                                                        try {
                                                            for (u = n[Symbol.iterator](); !(a = (s = u.next()).done); a = !0) f = s.value, i.set(f.id, f.userPresence)
                                                        } catch (e) {
                                                            l = !0, c = e
                                                        } finally {
                                                            try {
                                                                a || null == u.return || u.return()
                                                            } finally {
                                                                if (l) throw c
                                                            }
                                                        }
                                                        if (d = n.map(function(e) {
                                                                return e.id
                                                            }), p = o.filter(function(e) {
                                                                return !d.includes(e.id)
                                                            }).map(function(e) {
                                                                return e.id
                                                            }), 0 === (y = ed(d).concat(ed(p))).length) return [2, []];
                                                        return [4, (v = y, es(function() {
                                                            var e, t;
                                                            return ey(this, function(r) {
                                                                switch (r.label) {
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
                                                                        return [2, r.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 2:
                                                        return m = new Map(h.sent().profileDetails.map(function(e) {
                                                            return [e.userId, e]
                                                        })), b = [], y.forEach(function(e) {
                                                            var t, r, n, o, a, l, c = i.has(e),
                                                                u = {
                                                                    isOnline: c,
                                                                    isInGame: c && (null == (r = i.get(e)) ? void 0 : r.UserPresenceType) === "InGame",
                                                                    lastLocation: c ? null == (n = i.get(e)) ? void 0 : n.lastLocation : void 0,
                                                                    gameId: c ? null == (o = i.get(e)) ? void 0 : o.gameInstanceId : void 0,
                                                                    universeId: c ? null == (a = i.get(e)) ? void 0 : a.universeId : void 0,
                                                                    placeId: c ? null == (l = i.get(e)) ? void 0 : l.placeId : void 0
                                                                },
                                                                s = m.get(e);
                                                            b.push({
                                                                id: e,
                                                                combinedName: null == s ? void 0 : s.names.combinedName,
                                                                presence: u,
                                                                hasVerifiedBadge: null != (t = null == s ? void 0 : s.isVerified) && t,
                                                                isRobloxPlus: (null == s ? void 0 : s.hasRobloxSubscription) === !0
                                                            })
                                                        }), [2, b]
                                                }
                                            })
                                        })(), eh(), em(), al(function() {
                                            return au(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        if (r) return [2, !1];
                                                        return [4, an(function() {
                                                            var e, r;
                                                            return ao(this, function(n) {
                                                                switch (n.label) {
                                                                    case 0:
                                                                        return n.trys.push([0, 2, , 3]), [4, i7([t])];
                                                                    case 1:
                                                                        return [2, null == (e = null == (r = n.sent().users[0]) ? void 0 : r.isBlockingViewer) || e];
                                                                    case 2:
                                                                        return console.error(n.sent()), [3, 3];
                                                                    case 3:
                                                                        return [2, !0]
                                                                }
                                                            })
                                                        })()];
                                                    case 1:
                                                        if (e.sent()) return [2, !0];
                                                        return [4, an(function() {
                                                            return ao(this, function(e) {
                                                                switch (e.label) {
                                                                    case 0:
                                                                        return e.trys.push([0, 2, , 3]), [4, at("MustHideConnections", [{
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
                                        })(), al(function() {
                                            var e;
                                            return au(this, function(t) {
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
                                        return o = (e = ac.apply(void 0, [w.sent(), 6]))[0], i = e[1], a = e[2], l = e[3], c = e[4], u = e[5], f = o.status === af ? o.value.count : 0, d = i.status === af ? i.value : [], y = a.status === af && a.value.chatEnabled, m = l.status === af ? l.value : 0, h = u.status === af ? u.value : {
                                            isBadgeEnabled: !1,
                                            isAddFriendsTileEnabledWeb: !1,
                                            isIARCJoinCardRedesignEnabled: !1,
                                            isIARCJoinCardGameRowClickableEnabled: !1
                                        }, v = c.status !== af || c.value, s(f), p(d), b(y), g(m), P(h), j((O = h.isAddFriendsTileEnabledWeb, !v && (n !== iz.WebHomeFriendsCarousel ? 0 !== f : 0 !== f || O && 0 !== m))), [2]
                                }
                            })
                        })().catch(function(e) {
                            console.error(e)
                        })
                    }, [t, r, n]), O ? (0, U.jsxs)("div", {
                        className: "react-friends-carousel-container",
                        children: [(0, U.jsx)(ev, {
                            friendsCount: u,
                            translate: E,
                            profileUserId: t,
                            isOwnUser: r
                        }), (0, U.jsx)(i4, {
                            badgeCount: S.isBadgeEnabled && null != v ? v : 0,
                            friendsList: d,
                            translate: E,
                            isOwnUser: r,
                            canChat: m,
                            carouselName: n,
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
                ay = JSON.parse('{"P":["CommonUI.Features","Feature.PeopleList","Feature.Friends","Feature.Profile","Feature.RobloxSubscription"]}'),
                am = document.querySelector('meta[name="user-data"]'),
                ab = parseInt(null != (F = null == am ? void 0 : am.getAttribute("data-userid")) ? F : "", 10),
                ah = Number.isNaN(ab) ? null : ab,
                av = null != (x = null == (S = /\/users\/(\d+)\//g.exec(window.location.pathname)) ? void 0 : S[1]) ? x : null,
                ag = parseInt(null != av ? av : "", 10),
                aw = Number.isNaN(ag) ? null : ag;
            W()(function() {
                var e = document.getElementById("friends-carousel-container");
                e && (0, B.renderWithErrorBoundary)((0, U.jsx)(G.QueryClientProvider, {
                    client: B.queryClient,
                    children: (0, U.jsx)(B.TranslationProvider, {
                        config: ay.P,
                        children: (0, U.jsx)(ap, {
                            profileUserId: null != aw ? aw : 0,
                            isOwnUser: aw === ah,
                            carouselName: iz.WebProfileFriendsCarousel,
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
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/friendsCarousel-25e412f2124e88da.js.map