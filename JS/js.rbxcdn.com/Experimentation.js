! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "2afe7a7e54ebad50eee81dffe3ee0aad7978d954"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "0f21152d-ad35-48bf-89aa-3b59be31a21d", e._sentryDebugIdIdentifier = "sentry-dbid-0f21152d-ad35-48bf-89aa-3b59be31a21d")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {},
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var a = t[n] = {
            exports: {}
        };
        return e[n](a, a.exports, r), a.exports
    }

    function n(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
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
    }, r.ruid = "bundler=rspack@1.7.12";
    var o = window.Roblox["core-scripts"].http.http,
        a = window.Roblox["core-scripts"].environmentUrls,
        i = r.n(a),
        l = "experimentation";

    function u(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function c(e, t) {
        for (var r = 0; r < t.length; r++) {
            var n = t[r];
            n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
        }
    }

    function s(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }

    function d(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != o) {
                var a = [],
                    i = !0,
                    l = !1;
                try {
                    for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                } catch (e) {
                    l = !0, n = e
                } finally {
                    try {
                        i || null == o.return || o.return()
                    } finally {
                        if (l) throw n
                    }
                }
                return a
            }
        }(e, t) || function(e, t) {
            if (e) {
                if ("string" == typeof e) return u(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return u(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }! function(e, t) {
        var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
        if ("string" == typeof e) r[e] = t;
        else {
            var o = function(e) {
                    if (Array.isArray(e)) return n(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return n(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return n(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                a = o.pop(),
                i = r,
                l = !0,
                u = !1,
                c = void 0;
            try {
                for (var s, d = o[Symbol.iterator](); !(l = (s = d.next()).done); l = !0) {
                    var f, p = s.value;
                    null != (f = i)[p] || (f[p] = {}), i = i[p]
                }
            } catch (e) {
                u = !0, c = e
            } finally {
                try {
                    l || null == d.return || d.return()
                } finally {
                    if (u) throw c
                }
            }
            i[a] = t
        }
    }(["Roblox", "ExperimentationService"], new(function() {
        var e, t;

        function r() {
            if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
            s(this, "projectLayerMetadataMaps", void 0), this.projectLayerMetadataMaps = []
        }
        return e = [{
            key: "getAllValuesForLayer",
            value: function(e) {
                var t = this,
                    n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 1,
                    a = arguments.length > 2 ? arguments[2] : void 0,
                    l = {
                        url: "".concat(i().apiGatewayUrl, "/product-experimentation-platform/v1/projects/").concat(n, "/values"),
                        withCredentials: !0
                    },
                    u = {
                        layers: s({}, e, null != a ? a : {})
                    };
                return (0, o.post)(l, u).then(function(o) {
                    if (null == o ? void 0 : o.data) {
                        var i = o.data,
                            l = a ? r.getInputMetadataKey(e, a) : e;
                        return t.registerLayerMetadataAndGetParameters(i, e, l, n, void 0 !== a)
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
                var o, a = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                    i = null != (o = this.projectLayerMetadataMaps[n]) ? o : new Map;
                this.projectLayerMetadataMaps[n] = i;
                var l = e.layers[t];
                return l.experimentName ? i.set(r, e) : a && i.delete(r), l.parameters
            }
        }, {
            key: "logLayerExposureForMetadataKey",
            value: function(e, t, r) {
                var n = null == (o = this.projectLayerMetadataMaps[r]) ? void 0 : o.get(t);
                if (n) {
                    var o, a, i, u, c, d, f, p, y, v, b = n.layers[e],
                        g = window.Roblox,
                        m = g.CurrentUser,
                        h = g.Cookies,
                        w = (null == m ? void 0 : m.isAuthenticated) ? m.userId : 0,
                        S = null == h ? void 0 : h.getBrowserTrackerId(),
                        x = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var r = null != arguments[t] ? arguments[t] : {},
                                    n = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                                }))), n.forEach(function(t) {
                                    s(e, t, r[t])
                                })
                            }
                            return e
                        }({}, {
                            uid: w.toString(),
                            btid: ("number" == typeof S ? S : 0).toString(),
                            project: null == (a = n.projectId) ? void 0 : a.toString(),
                            version: null == (i = n.version) ? void 0 : i.toString(),
                            ts: Date.now().toString(),
                            lt: new Date().toISOString(),
                            target: l
                        }, (s(v = {}, "layer", e), s(v, "experiment", b.experimentName), s(v, "isAudienceSpecified", null == (u = b.isAudienceSpecified) ? void 0 : u.toString()), s(v, "isAudienceMember", null == (c = b.isAudienceMember) ? void 0 : c.toString()), s(v, "userAgent", n.userAgent), s(v, "platformType", n.platformType), s(v, "ptid", null == (d = n.platformTypeId) ? void 0 : d.toString()), s(v, "segment", null == (f = b.segment) ? void 0 : f.toString()), s(v, "experiment_variant", b.experimentVariant), s(v, "hashUnit", b.primaryUnit), s(v, "hashValue", null == (p = b.primaryUnitValue) ? void 0 : p.toString()), s(v, "allocKey", b.primaryUnit), s(v, "allocValue", null == (y = b.primaryUnitValue) ? void 0 : y.toString()), s(v, "holdout", b.holdoutGroupExperimentName), v));
                    Object.keys(x).forEach(function(e) {
                        var t;
                        x[e] = null != (t = x[e]) ? t : ""
                    });
                    var j = window.Roblox.EventStream;
                    null != j && j.SendEventWithTarget("expExposed", l, x, j.TargetTypes.WWW)
                }
            }
        }], t = [{
            key: "getInputMetadataKey",
            value: function(e, t) {
                var r = Object.entries(t).sort(function(e, t) {
                    var r = d(e, 1)[0],
                        n = d(t, 1)[0];
                    return r.localeCompare(n)
                });
                return "".concat(e, ":").concat(JSON.stringify(r))
            }
        }], e && c(r.prototype, e), t && c(r, t), r
    }()))
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Experimentation");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/experimentation-93d7b5f15e017396.js.map