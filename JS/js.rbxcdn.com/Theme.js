! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "1b2446d27cee0d7f750c78e1b3663e48c662ba47"
        };
        var r = (new e.Error).stack;
        r && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[r] = "e62a293e-7857-4c7f-ba2e-298f40e7aad2", e._sentryDebugIdIdentifier = "sentry-dbid-e62a293e-7857-4c7f-ba2e-298f40e7aad2")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {},
        r = {};

    function t(n) {
        var o = r[n];
        if (void 0 !== o) return o.exports;
        var l = r[n] = {
            exports: {}
        };
        return e[n](l, l.exports, t), l.exports
    }
    t.d = function(e, r) {
        for (var n in r) t.o(r, n) && !t.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: r[n]
        })
    }, t.o = function(e, r) {
        return Object.prototype.hasOwnProperty.call(e, r)
    }, t.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, t.rv = function() {
        return "1.7.12"
    }, t.ruid = "bundler=rspack@1.7.12";
    var n = {};

    function o(e, r) {
        (null == r || r > e.length) && (r = e.length);
        for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
        return n
    }
    t.r(n), t.d(n, {
        colorModes: function() {
            return v
        },
        getColorMode: function() {
            return p
        },
        getMode: function() {
            return p
        },
        modes: function() {
            return v
        },
        setColorMode: function() {
            return _
        },
        setColorModeOverride: function() {
            return D
        },
        setMode: function() {
            return _
        }
    });
    var l = function(e, r) {
            return e.includes(r)
        },
        a = function(e) {
            var r, t = "".concat(e, "="),
                n = null == (r = document.cookie.split("; ").find(function(e) {
                    return e.startsWith(t)
                })) ? void 0 : r.slice(t.length);
            return null == n ? null : {
                name: e,
                value: decodeURIComponent(n)
            }
        },
        u = function(e) {
            var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                t = Number.parseInt(e, r);
            return Number.isNaN(t) ? null : t
        },
        i = function(e) {
            if (!e.trim()) return null;
            try {
                return BigInt(e)
            } catch (e) {
                return null
            }
        },
        c = function(e) {
            var r = u(e);
            if (null == r) throw Error("UserId ".concat(e, " was not parsable as an integer."));
            return r
        },
        d = function(e) {
            return e > 0 && e <= Number.MAX_SAFE_INTEGER ? e.toString() : null
        };

    function s(e, r) {
        (null == r || r > e.length) && (r = e.length);
        for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
        return n
    }

    function f(e, r) {
        return null != r && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](e) : e instanceof r
    }

    function m(e, r) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, r) {
            var t, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != o) {
                var l = [],
                    a = !0,
                    u = !1;
                try {
                    for (o = o.call(e); !(a = (t = o.next()).done) && (l.push(t.value), !r || l.length !== r); a = !0);
                } catch (e) {
                    u = !0, n = e
                } finally {
                    try {
                        a || null == o.return || o.return()
                    } finally {
                        if (u) throw n
                    }
                }
                return l
            }
        }(e, r) || function(e, r) {
            if (e) {
                if ("string" == typeof e) return s(e, r);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return s(e, r)
            }
        }(e, r) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var v = ["light", "dark", "system"],
        y = "light",
        h = null,
        g = y,
        b = null,
        p = function() {
            return null != b ? b : g
        },
        w = window.matchMedia("(prefers-color-scheme: dark)"),
        S = function() {
            var e = document.body.classList;
            e.add("light-theme"), e.remove("dark-theme")
        },
        k = function() {
            var e = document.body.classList;
            e.add("dark-theme"), e.remove("light-theme")
        },
        I = function(e) {
            e ? k() : S()
        },
        E = function(e) {
            I(e.matches)
        },
        A = function(e) {
            var r = document.body.classList;
            switch (r.remove("color-mode-system", "color-mode-light", "color-mode-dark"), e) {
                case "system":
                    r.add("color-mode-system"), I(w.matches), w.addEventListener("change", E);
                    break;
                case "light":
                    r.add("color-mode-light"), w.removeEventListener("change", E), S();
                    break;
                case "dark":
                    r.add("color-mode-dark"), w.removeEventListener("change", E), k()
            }
        },
        M = function() {
            try {
                var e = localStorage.getItem("theme");
                if (null == e) return null;
                var r = JSON.parse(e),
                    t = r.version,
                    n = r.data;
                return 0 === t ? n : void 0
            } catch (e) {
                return console.error("Failed to get color mode data: ".concat(f(e, Error) ? e : String(e))), null
            }
        },
        O = function(e) {
            return e.find(function(e) {
                return m(e, 1)[0] === h
            })
        },
        x = function(e) {
            var r, t;
            return null != (r = null == (t = O(e)) ? void 0 : t[2]) ? r : 0
        },
        C = function(e) {
            var r = O(e),
                t = null == r ? void 0 : r[1];
            return null == t ? null : v[t]
        },
        L = function(e) {
            b = e, A(e)
        },
        j = function(e) {
            g = e, null == b && A(e)
        },
        T = function(e) {
            var r, t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
            if (j(e), null != h) {
                var n = M();
                if (void 0 !== n) {
                    var o = null == n ? 0 : x(n),
                        l = null != (r = null == n ? void 0 : n.filter(function(e) {
                            return m(e, 1)[0] !== h
                        })) ? r : [];
                    l.length >= 100 && l.shift();
                    var a = o | t;
                    l.push(0 === a ? [h, v.indexOf(e)] : [h, v.indexOf(e), a]);
                    try {
                        localStorage.setItem("theme", JSON.stringify({
                            version: 0,
                            data: l
                        }))
                    } catch (e) {
                        console.error("Could not set color mode. Local storage is likely full: ".concat(f(e, Error) ? e : String(e)))
                    }
                }
            }
        },
        N = function(e) {
            var r = e.key,
                t = e.newValue;
            if ("theme" === r && null != t) {
                var n = M();
                if (null == n) return;
                var o = C(n);
                if (null == o) return;
                j(o)
            }
        },
        R = function(e) {
            switch (e) {
                case "system":
                case "light":
                case "dark":
                    j(e);
                    break;
                case "none":
                case "":
                    j("system");
                    break;
                default:
                    console.warn("Unknown color mode: ".concat(e)), j("system")
            }
        },
        _ = function(e) {
            l(v, e) ? e !== g && T(e) : console.warn("Unknown color mode: ".concat(e))
        },
        D = function(e) {
            if (null != e && !l(v, e)) return void console.warn("Unknown color mode: ".concat(e));
            var r = p();
            b = e;
            var t = p();
            t !== r && A(t)
        };
    ! function(e, r) {
        var t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
        if ("string" == typeof e) t[e] = r;
        else {
            var n = function(e) {
                    if (Array.isArray(e)) return o(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return o(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                l = n.pop(),
                a = t,
                u = !0,
                i = !1,
                c = void 0;
            try {
                for (var d, s = n[Symbol.iterator](); !(u = (d = s.next()).done); u = !0) {
                    var f, m = d.value;
                    null != (f = a)[m] || (f[m] = {}), a = a[m]
                }
            } catch (e) {
                i = !0, c = e
            } finally {
                try {
                    u || null == s.return || s.return()
                } finally {
                    if (i) throw c
                }
            }
            a[l] = r
        }
    }(["Roblox", "core-scripts", "color-mode"], n);
    try {
        var U, B, P, q, F, J = (null == (P = document.querySelector('meta[name="age-badge-control"]')) ? void 0 : P.dataset.ageBadgeControl) === "Kids" ? "dark" : void 0;
        ! function(e) {
            var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                t = document.body.classList;
            if (t.contains("color-mode-system") || t.contains("system-theme")) return L("system");
            if (t.contains("color-mode-light") || t.contains("light-theme")) return L("light");
            if (t.contains("color-mode-dark") || t.contains("dark-theme")) return L("dark");
            var n = a("RBXThemeOverride");
            if (null != n) return R(n.value);
            if (null == e) return j(y);
            h = c(e);
            var o = M(),
                l = null == o ? o : C(o);
            if (null != r.defaultColorMode && void 0 !== o && ((null == o ? 0 : x(o)) & 1) == 0) {
                T(r.defaultColorMode, 1), window.addEventListener("storage", N);
                return
            }
            null === l ? T(y) : void 0 === l ? j(y) : j(l), window.addEventListener("storage", N)
        }((F = null == (q = document.querySelector('meta[name="user-data"]')) ? void 0 : q.dataset.userid, null == F ? null : (U = F, B = i(U), null == B ? null : d(B))), {
            defaultColorMode: J
        })
    } catch (e) {
        console.error(e)
    }
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Theme");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/theme-bd3db90c835b3c9e.js.map