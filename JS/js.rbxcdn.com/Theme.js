! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "3f34304d71c616d3a79bf51ffa42a07b200e19f7"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "164bf634-f6ae-4f1a-a654-b78e39b3a074", e._sentryDebugIdIdentifier = "sentry-dbid-164bf634-f6ae-4f1a-a654-b78e39b3a074")
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
    r.d = function(e, t) {
        for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: t[n]
        })
    }, r.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, r.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.rv = function() {
        return "1.7.12"
    }, r.ruid = "bundler=rspack@1.7.12";
    var n = {};

    function o(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    r.r(n), r.d(n, {
        getMode: function() {
            return O
        },
        modes: function() {
            return c
        },
        setMode: function() {
            return x
        }
    });
    var a = function(e) {
        var t, r = "".concat(e, "="),
            n = null == (t = document.cookie.split("; ").find(function(e) {
                return e.startsWith(r)
            })) ? void 0 : t.slice(r.length);
        return null == n ? null : {
            name: e,
            value: decodeURIComponent(n)
        }
    };

    function l(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function i(e, t) {
        return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }

    function u(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != o) {
                var a = [],
                    l = !0,
                    i = !1;
                try {
                    for (o = o.call(e); !(l = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); l = !0);
                } catch (e) {
                    i = !0, n = e
                } finally {
                    try {
                        l || null == o.return || o.return()
                    } finally {
                        if (i) throw n
                    }
                }
                return a
            }
        }(e, t) || function(e, t) {
            if (e) {
                if ("string" == typeof e) return l(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var c = ["light", "dark", "system"],
        d = "light",
        s = -1,
        f = d,
        m = window.matchMedia("(prefers-color-scheme: dark)"),
        v = function() {
            var e = document.body.classList;
            e.add("light-theme"), e.remove("dark-theme")
        },
        y = function() {
            var e = document.body.classList;
            e.add("dark-theme"), e.remove("light-theme")
        },
        b = function(e) {
            e ? y() : v()
        },
        h = function(e) {
            b(e.matches)
        },
        g = function(e) {
            f = e;
            var t = document.body.classList;
            switch (t.remove("color-mode-system", "color-mode-light", "color-mode-dark"), e) {
                case "system":
                    t.add("color-mode-system"), b(m.matches), m.addEventListener("change", h);
                    break;
                case "light":
                    t.add("color-mode-light"), m.removeEventListener("change", h), v();
                    break;
                case "dark":
                    t.add("color-mode-dark"), m.removeEventListener("change", h), y()
            }
        },
        p = function() {
            try {
                var e = localStorage.getItem("theme");
                if (null == e) return null;
                var t = JSON.parse(e),
                    r = t.version,
                    n = t.data;
                return 0 === r ? n : void 0
            } catch (e) {
                return console.error("Failed to get mode data: ".concat(i(e, Error) ? e : String(e))), null
            }
        },
        w = function(e) {
            return e.find(function(e) {
                return u(e, 1)[0] === s
            })
        },
        S = function(e) {
            var t, r;
            return null != (t = null == (r = w(e)) ? void 0 : r[2]) ? t : 0
        },
        k = function(e) {
            var t = w(e),
                r = null == t ? void 0 : t[1];
            return null == r ? null : c[r]
        },
        I = function(e) {
            var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
            g(e);
            var n = p();
            if (void 0 !== n) {
                var o = null == n ? 0 : S(n),
                    a = null != (t = null == n ? void 0 : n.filter(function(e) {
                        return u(e, 1)[0] !== s
                    })) ? t : [];
                a.length >= 100 && a.shift();
                var l = o | r;
                a.push(0 === l ? [s, c.indexOf(e)] : [s, c.indexOf(e), l]);
                try {
                    localStorage.setItem("theme", JSON.stringify({
                        version: 0,
                        data: a
                    }))
                } catch (e) {
                    console.error("Could not set mode. Local storage is likely full: ".concat(i(e, Error) ? e : String(e)))
                }
            }
        },
        A = function(e) {
            var t = e.key,
                r = e.newValue;
            if ("theme" === t && null != r) {
                var n = p();
                if (null == n) return;
                var o = k(n);
                if (null == o) return;
                g(o)
            }
        },
        E = function(e) {
            switch (e) {
                case "system":
                case "light":
                case "dark":
                    g(e);
                    break;
                case "none":
                case "":
                    g("system");
                    break;
                default:
                    console.warn("Unknown mode: ".concat(e)), g("system")
            }
        },
        O = function() {
            return f
        },
        x = function(e) {
            c.includes(e) ? e !== f && I(e) : console.warn("Unknown mode: ".concat(e))
        };
    ! function(e, t) {
        var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
        if ("string" == typeof e) r[e] = t;
        else {
            var n = function(e) {
                    if (Array.isArray(e)) return o(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return o(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                a = n.pop(),
                l = r,
                i = !0,
                u = !1,
                c = void 0;
            try {
                for (var d, s = n[Symbol.iterator](); !(i = (d = s.next()).done); i = !0) {
                    var f, m = d.value;
                    null != (f = l)[m] || (f[m] = {}), l = l[m]
                }
            } catch (e) {
                u = !0, c = e
            } finally {
                try {
                    i || null == s.return || s.return()
                } finally {
                    if (u) throw c
                }
            }
            l[a] = t
        }
    }(["Roblox", "core-scripts", "color-mode"], n);
    try {
        var L, j, M = (null == (L = document.querySelector('meta[name="age-badge-control"]')) ? void 0 : L.dataset.ageBadgeControl) === "Kids" ? "dark" : void 0;
        ! function(e) {
            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                r = document.body.classList;
            if (r.contains("color-mode-system")) return g("system");
            if (r.contains("color-mode-light") || r.contains("light-theme")) return g("light");
            if (r.contains("color-mode-dark") || r.contains("dark-theme")) return g("dark");
            var n = a("RBXThemeOverride");
            if (null != n) return E(n.value);
            s = e;
            var o = p(),
                l = null == o ? o : k(o);
            if (null != t.defaultMode && void 0 !== o && ((null == o ? 0 : S(o)) & 1) == 0) {
                I(t.defaultMode, 1), window.addEventListener("storage", A);
                return
            }
            null === l ? I(d) : void 0 === l ? g(d) : g(l), window.addEventListener("storage", A)
        }(null != (j = function() {
            var e, t = null == (e = document.querySelector('meta[name="user-data"]')) ? void 0 : e.dataset.userid;
            if (null == t) return null;
            var r = Number.parseInt(t, 10);
            return Number.isNaN(r) ? null : r
        }()) ? j : -1, {
            defaultMode: M
        })
    } catch (e) {
        console.error(e)
    }
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Theme");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/theme-2bb0baa5d132361f.js.map