! function() {
    try {
        var r = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        r.SENTRY_RELEASE = {
            id: "3d359e452fffbb0d78c5c5b22408cc4b943c799a"
        };
        var e = (new r.Error).stack;
        e && (r._sentryDebugIds = r._sentryDebugIds || {}, r._sentryDebugIds[e] = "cb3d0928-08a9-41a5-902a-0645296ab46c", r._sentryDebugIdIdentifier = "sentry-dbid-cb3d0928-08a9-41a5-902a-0645296ab46c")
    } catch (r) {}
}(),
function() {
    "use strict";
    var r = {},
        e = {};

    function t(n) {
        var o = e[n];
        if (void 0 !== o) return o.exports;
        var a = e[n] = {
            exports: {}
        };
        return r[n](a, a.exports, t), a.exports
    }
    t.n = function(r) {
        var e = r && r.__esModule ? function() {
            return r.default
        } : function() {
            return r
        };
        return t.d(e, {
            a: e
        }), e
    }, t.d = function(r, e) {
        for (var n in e) t.o(e, n) && !t.o(r, n) && Object.defineProperty(r, n, {
            enumerable: !0,
            get: e[n]
        })
    }, t.o = function(r, e) {
        return Object.prototype.hasOwnProperty.call(r, e)
    }, t.r = function(r) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(r, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(r, "__esModule", {
            value: !0
        })
    }, t.rv = function() {
        return "1.7.12"
    }, t.ruid = "bundler=rspack@1.7.12";
    var n = {};

    function o(r, e) {
        (null == e || e > r.length) && (e = r.length);
        for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
        return n
    }
    t.r(n), t.d(n, {
        TranslationResource: function() {
            return i
        },
        TranslationResourceProvider: function() {
            return y
        }
    });
    var a = function(r, e) {
            var t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
            if ("string" == typeof r) t[r] = e;
            else {
                var n = function(r) {
                        if (Array.isArray(r)) return o(r)
                    }(r) || function(r) {
                        if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                    }(r) || function(r) {
                        if (r) {
                            if ("string" == typeof r) return o(r, void 0);
                            var e = Object.prototype.toString.call(r).slice(8, -1);
                            if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                            if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return o(r, void 0)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    a = n.pop(),
                    i = t,
                    l = !0,
                    u = !1,
                    c = void 0;
                try {
                    for (var s, f = n[Symbol.iterator](); !(l = (s = f.next()).done); l = !0) {
                        var y, b = s.value;
                        null != (y = i)[b] || (y[b] = {}), i = i[b]
                    }
                } catch (r) {
                    u = !0, c = r
                } finally {
                    try {
                        l || null == f.return || f.return()
                    } finally {
                        if (u) throw c
                    }
                }
                i[a] = e
            }
        },
        i = function() {
            var r;

            function e(r, t, n) {
                if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
                this.namespace = n, this.resourceMap = t, this.intl = r
            }
            return r = [{
                    key: "get",
                    value: function(r, e) {
                        if (!r || "string" != typeof r) throw TypeError("Parameter 'key' must be provided and it should be a string");
                        var t, n = this.resourceMap[r] || "";
                        if (n || console.warn("The translation key '".concat(r, "' not found. Please check for a missing string or a typo.")), void 0 !== e)
                            if (e && (void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && !Array.isArray(e)) try {
                                n = n ? this.intl.f(n, e) : ""
                            } catch (e) {
                                console.warn("Failed to format translation key '".concat(r, "': ").concat(null != (t = null == e ? void 0 : e.message) ? t : e, ". Check that the provided parameters match the translation string."))
                            } else new window.RobloxError("Second parameter must be either a plain object when provided").throw(), n = "";
                        return n
                    }
                }, {
                    key: "addKeyForDevelopment",
                    value: function(r, e) {
                        if (this.resourceMap[r]) throw Error("key '".concat(r, "' is already present"));
                        this.resourceMap[r] = e
                    }
                }],
                function(r, e) {
                    for (var t = 0; t < e.length; t++) {
                        var n = e[t];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                    }
                }(e.prototype, r), e
        }(),
        l = window.Roblox["core-scripts"].intl.intl,
        u = t.n(l);

    function c(r, e) {
        (null == e || e > r.length) && (e = r.length);
        for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
        return n
    }

    function s(r, e) {
        for (var t = 0; t < e.length; t++) {
            var n = e[t];
            n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
        }
    }

    function f(r, e) {
        if (r) {
            if ("string" == typeof r) return c(r, e);
            var t = Object.prototype.toString.call(r).slice(8, -1);
            if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return c(r, e)
        }
    }
    var y = function() {
        var r, e;

        function t() {
            var r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : new(u());
            if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
            this.intl = r
        }
        return r = [{
            key: "getTranslationResource",
            value: function(r) {
                var e = window.Roblox,
                    t = e.Lang,
                    n = e.LangDynamicDefault,
                    o = e.LangDynamic,
                    a = function(r) {
                        for (var e = 1; e < arguments.length; e++) {
                            var t = null != arguments[e] ? arguments[e] : {},
                                n = Object.keys(t);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                                return Object.getOwnPropertyDescriptor(t, r).enumerable
                            }))), n.forEach(function(e) {
                                var n;
                                n = t[e], e in r ? Object.defineProperty(r, e, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : r[e] = n
                            })
                        }
                        return r
                    }({}, null == n ? void 0 : n[r], null == t ? void 0 : t[r], null == o ? void 0 : o[r]);
                return 0 === Object.keys(a).length && console.warn("The namespace ".concat(r, " was not found")), new i(this.intl, a, r)
            }
        }, {
            key: "mergeTranslationResources",
            value: function() {
                for (var r = arguments.length, e = Array(r), n = 0; n < r; n++) e[n] = arguments[n];
                return t.combineTranslationResources.apply(t, [this.intl].concat(function(r) {
                    if (Array.isArray(r)) return c(r)
                }(e) || function(r) {
                    if ("u" > typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(e) || f(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()))
            }
        }], e = [{
            key: "combineTranslationResources",
            value: function(r) {
                for (var e = arguments.length, t = Array(e > 1 ? e - 1 : 0), n = 1; n < e; n++) t[n - 1] = arguments[n];
                var o = t.reduce(function(r, e) {
                    return Object.assign(r, e.resourceMap)
                }, {});
                return t.forEach(function(r) {
                    var e = r.namespace,
                        t = r.resourceMap;
                    e && Object.entries(t).forEach(function(r) {
                        var t = function(r) {
                                if (Array.isArray(r)) return r
                            }(r) || function(r) {
                                var e, t, n = null == r ? null : "u" > typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                                if (null != n) {
                                    var o = [],
                                        a = !0,
                                        i = !1;
                                    try {
                                        for (n = n.call(r); !(a = (e = n.next()).done) && (o.push(e.value), 2 !== o.length); a = !0);
                                    } catch (r) {
                                        i = !0, t = r
                                    } finally {
                                        try {
                                            a || null == n.return || n.return()
                                        } finally {
                                            if (i) throw t
                                        }
                                    }
                                    return o
                                }
                            }(r) || f(r, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            n = t[0],
                            a = t[1];
                        o["".concat(e, ".").concat(n)] = a
                    })
                }), new i(r, o, null)
            }
        }], r && s(t.prototype, r), e && s(t, e), t
    }();
    a(["Roblox", "core-scripts", "intl", "translation"], n), a(["Roblox", "TranslationResourceProvider"], y)
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("TranslationResources");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/translationResources-ef04e963cbf5b349.js.map