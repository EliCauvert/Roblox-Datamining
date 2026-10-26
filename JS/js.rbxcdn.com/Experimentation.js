! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "9f804d5fcff822db0bc4525f5f343ddfd1a6f8d3"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "0454de9f-c0ff-4ffb-88bb-d42ac16f2802", e._sentryDebugIdIdentifier = "sentry-dbid-0454de9f-c0ff-4ffb-88bb-d42ac16f2802")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {
            773: function(e, t) {
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var r, n, o, i = {
                        exports: {}
                    },
                    a = i.exports = {};

                function u() {
                    throw Error("setTimeout has not been defined")
                }

                function l() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : u
                } catch (e) {
                    r = u
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : l
                } catch (e) {
                    n = l
                }

                function s(e) {
                    if (r === setTimeout) return setTimeout(e, 0);
                    if ((r === u || !r) && setTimeout) return r = setTimeout, setTimeout(e, 0);
                    try {
                        return r(e, 0)
                    } catch (t) {
                        try {
                            return r.call(null, e, 0)
                        } catch (t) {
                            return r.call(this, e, 0)
                        }
                    }
                }
                var c = [],
                    p = !1,
                    f = -1;

                function d() {
                    p && o && (p = !1, o.length ? c = o.concat(c) : f = -1, c.length && v())
                }

                function v() {
                    if (!p) {
                        var e = s(d);
                        p = !0;
                        for (var t = c.length; t;) {
                            for (o = c, c = []; ++f < t;) o && o[f].run();
                            f = -1, t = c.length
                        }
                        o = null, p = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === l || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
                                try {
                                    n(e)
                                } catch (t) {
                                    try {
                                        return n.call(null, e)
                                    } catch (t) {
                                        return n.call(this, e)
                                    }
                                }
                            }(e)
                    }
                }

                function m(e, t) {
                    this.fun = e, this.array = t
                }

                function y() {}

                function b() {}
                a.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    c.push(new m(e, t)), 1 !== c.length || p || s(v)
                }, m.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, a.title = "browser", a.browser = !0, a.env = {}, a.argv = [], a.version = "", a.versions = {}, a.on = y, a.addListener = y, a.once = y, a.off = y, a.removeListener = y, a.removeAllListeners = y, a.emit = y, a.prependListener = y, a.prependOnceListener = y, a.listeners = function(e) {
                    return []
                }, a.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, a.cwd = function() {
                    return "/"
                }, a.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, a.umask = function() {
                    return 0
                };
                var h = i.exports.browser,
                    g = i.exports.binding,
                    x = {},
                    w = "browser",
                    L = "browser",
                    T = "browser",
                    S = [],
                    A = {
                        nextTick: i.exports.nextTick,
                        title: i.exports.title,
                        browser: h,
                        env: i.exports.env,
                        argv: i.exports.argv,
                        version: i.exports.version,
                        versions: i.exports.versions,
                        on: i.exports.on,
                        addListener: i.exports.addListener,
                        once: i.exports.once,
                        off: i.exports.off,
                        removeListener: i.exports.removeListener,
                        removeAllListeners: i.exports.removeAllListeners,
                        emit: i.exports.emit,
                        emitWarning: b,
                        prependListener: i.exports.prependListener,
                        prependOnceListener: i.exports.prependOnceListener,
                        listeners: i.exports.listeners,
                        binding: g,
                        cwd: i.exports.cwd,
                        chdir: i.exports.chdir,
                        umask: i.exports.umask,
                        exit: b,
                        pid: 1,
                        features: x,
                        kill: b,
                        dlopen: b,
                        uptime: b,
                        memoryUsage: b,
                        uvCounters: b,
                        platform: w,
                        arch: L,
                        execPath: T,
                        execArgv: S
                    };
                t.addListener = i.exports.addListener, t.arch = L, t.argv = i.exports.argv, t.binding = g, t.browser = h, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = A, t.dlopen = b, t.emit = i.exports.emit, t.emitWarning = b, t.env = i.exports.env, t.execArgv = S, t.execPath = T, t.exit = b, t.features = x, t.kill = b, t.listeners = i.exports.listeners, t.memoryUsage = b, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = w, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = b, t.uvCounters = b, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = A
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
    r.n = function(e) {
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
        }, r.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, r.rv = function() {
            return "1.7.12"
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            function e(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var t = function(e) {
                    var t, r = "".concat(e, "="),
                        n = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(r)
                        })) ? void 0 : t.slice(r.length);
                    return null == n ? null : {
                        name: e,
                        value: decodeURIComponent(n)
                    }
                },
                n = function() {
                    var e, r, n;
                    return null != (e = null == (n = t("RBXEventTrackerV2")) || null == (r = n.value.match(/browserid=([^&]*)/i)) ? void 0 : r[1]) && e
                },
                o = window.Roblox["core-scripts"].eventStream,
                i = window.Roblox["core-scripts"].meta.user,
                a = window.Roblox["core-scripts"].environmentUrls,
                u = r.n(a),
                l = window.Roblox["core-scripts"].http.http,
                s = window.Roblox["core-lib"].http.index,
                c = window.Roblox["core-lib"].url.index,
                p = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS,
                f = function(e, t) {
                    return p ? Promise.resolve().then(function() {
                        return s.postUntyped(c.Url.parse(e.url).getOrThrow(), t, e.withCredentials ? {
                            credentials: "include"
                        } : {}).getOrThrow()
                    }).then(function(e) {
                        return {
                            data: e
                        }
                    }) : (0, l.post)(e, t)
                },
                d = "experimentation";

            function v(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var m = function(e, t, r, n) {
                var o, i, a, u, l, s, c, p, f, m = e.layers[t],
                    y = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                v(e, t, r[t])
                            })
                        }
                        return e
                    }({}, {
                        uid: r.toString(),
                        btid: n,
                        project: null == (o = e.projectId) ? void 0 : o.toString(),
                        version: null == (i = e.version) ? void 0 : i.toString(),
                        ts: Date.now().toString(),
                        lt: new Date().toISOString(),
                        target: d
                    }, (v(f = {}, "layer", t), v(f, "experiment", m.experimentName), v(f, "isAudienceSpecified", null == (a = m.isAudienceSpecified) ? void 0 : a.toString()), v(f, "isAudienceMember", null == (u = m.isAudienceMember) ? void 0 : u.toString()), v(f, "userAgent", e.userAgent), v(f, "platformType", e.platformType), v(f, "ptid", null == (l = e.platformTypeId) ? void 0 : l.toString()), v(f, "segment", null == (s = m.segment) ? void 0 : s.toString()), v(f, "experiment_variant", m.experimentVariant), v(f, "hashUnit", m.primaryUnit), v(f, "hashValue", null == (c = m.primaryUnitValue) ? void 0 : c.toString()), v(f, "allocKey", m.primaryUnit), v(f, "allocValue", null == (p = m.primaryUnitValue) ? void 0 : p.toString()), v(f, "holdout", m.holdoutGroupExperimentName), f));
                return Object.keys(y).forEach(function(e) {
                    var t;
                    y[e] = null != (t = y[e]) ? t : ""
                }), y
            };

            function y(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function b(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function h(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function g(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            u = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return y(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return y(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }! function(t, r) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
                if ("string" == typeof t) n[t] = r;
                else {
                    var o = function(t) {
                            if (Array.isArray(t)) return e(t)
                        }(t) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(t) || function(t) {
                            if (t) {
                                if ("string" == typeof t) return e(t, void 0);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e(t, void 0)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        i = o.pop(),
                        a = n,
                        u = !0,
                        l = !1,
                        s = void 0;
                    try {
                        for (var c, p = o[Symbol.iterator](); !(u = (c = p.next()).done); u = !0) {
                            var f, d = c.value;
                            null != (f = a)[d] || (f[d] = {}), a = a[d]
                        }
                    } catch (e) {
                        l = !0, s = e
                    } finally {
                        try {
                            u || null == p.return || p.return()
                        } finally {
                            if (l) throw s
                        }
                    }
                    a[i] = r
                }
            }(["Roblox", "ExperimentationService"], new(function() {
                var e, t;

                function r() {
                    if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                    h(this, "projectLayerMetadataMaps", void 0), this.projectLayerMetadataMaps = []
                }
                return e = [{
                    key: "getAllValuesForLayer",
                    value: function(e) {
                        var t = this,
                            n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 1,
                            o = arguments.length > 2 ? arguments[2] : void 0;
                        return f({
                            url: "".concat(u().apiGatewayUrl, "/product-experimentation-platform/v1/projects/").concat(n, "/values"),
                            withCredentials: !0
                        }, {
                            layers: h({}, e, null != o ? o : {})
                        }).then(function(i) {
                            if (null == i ? void 0 : i.data) {
                                var a = i.data,
                                    u = o ? r.getInputMetadataKey(e, o) : e;
                                return t.registerLayerMetadataAndGetParameters(a, e, u, n, void 0 !== o)
                            }
                            return Promise.reject()
                        })
                    }
                }, {
                    key: "logLayerExposure",
                    value: function(e) {
                        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 1,
                            n = arguments.length > 2 ? arguments[2] : void 0,
                            o = n ? r.getInputMetadataKey(e, n) : e;
                        this.logLayerExposureForMetadataKey(e, o, t)
                    }
                }, {
                    key: "registerLayerMetadataAndGetParameters",
                    value: function(e, t, r, n) {
                        var o, i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                            a = null != (o = this.projectLayerMetadataMaps[n]) ? o : new Map;
                        this.projectLayerMetadataMaps[n] = a;
                        var u = e.layers[t];
                        return u.experimentName ? a.set(r, e) : i && a.delete(r), u.parameters
                    }
                }, {
                    key: "logLayerExposureForMetadataKey",
                    value: function(e, t, r) {
                        var a = null == (u = this.projectLayerMetadataMaps[r]) ? void 0 : u.get(t);
                        if (a) {
                            var u, l, s = m(a, e, null != (l = (0, i.userId)()) ? l : 0, n() || "0");
                            (0, o.sendEventWithTarget)("expExposed", d, s, o.targetTypes.WWW)
                        }
                    }
                }], t = [{
                    key: "getInputMetadataKey",
                    value: function(e, t) {
                        var r = Object.entries(t).sort(function(e, t) {
                            var r = g(e, 1)[0],
                                n = g(t, 1)[0];
                            return r.localeCompare(n)
                        });
                        return "".concat(e, ":").concat(JSON.stringify(r))
                    }
                }], e && b(r.prototype, e), t && b(r, t), r
            }()))
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "Experimentation");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/experimentation-0c9785b0e640fe40.js.map