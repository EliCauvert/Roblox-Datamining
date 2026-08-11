! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "51ef11c4dee9c5d7a7d8e261b03ec87a9b5a1f7f"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "de1713b9-0c40-49fa-870e-569d17f4a96b", e._sentryDebugIdIdentifier = "sentry-dbid-de1713b9-0c40-49fa-870e-569d17f4a96b")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {},
        t = {};

    function n(r) {
        var o = t[r];
        if (void 0 !== o) return o.exports;
        var a = t[r] = {
            exports: {}
        };
        return e[r](a, a.exports, n), a.exports
    }
    n.d = function(e, t) {
        for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, n.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, n.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.rv = function() {
        return "1.5.7"
    }, n.ruid = "bundler=rspack@1.5.7";
    var r = {};

    function o(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
        return r
    }
    n.r(r), n.d(r, {
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
        var t, n = "".concat(e, "="),
            r = null == (t = document.cookie.split("; ").find(function(e) {
                return e.startsWith(n)
            })) ? void 0 : t.split("=")[1];
        return null == r ? null : {
            name: e,
            value: decodeURIComponent(r)
        }
    };

    function i(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
        return r
    }

    function l(e, t) {
        return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }

    function u(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != o) {
                var a = [],
                    i = !0,
                    l = !1;
                try {
                    for (o = o.call(e); !(i = (n = o.next()).done) && (a.push(n.value), !t || a.length !== t); i = !0);
                } catch (e) {
                    l = !0, r = e
                } finally {
                    try {
                        i || null == o.return || o.return()
                    } finally {
                        if (l) throw r
                    }
                }
                return a
            }
        }(e, t) || function(e, t) {
            if (e) {
                if ("string" == typeof e) return i(e, t);
                var n = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return i(e, t)
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
        h = function(e) {
            e ? y() : v()
        },
        b = function(e) {
            h(e.matches)
        },
        g = function(e) {
            f = e;
            var t = document.body.classList;
            switch (e) {
                case "system":
                    t.add("system-theme"), h(m.matches), m.addEventListener("change", b);
                    break;
                case "light":
                    m.removeEventListener("change", b), v(), t.remove("system-theme");
                    break;
                case "dark":
                    m.removeEventListener("change", b), y(), t.remove("system-theme")
            }
        },
        p = function() {
            try {
                var e = localStorage.getItem("theme");
                if (null == e) return null;
                var t = JSON.parse(e),
                    n = t.version,
                    r = t.data;
                return 0 === n ? r : void 0
            } catch (e) {
                return console.error("Failed to get mode data: ".concat(l(e, Error) ? e : String(e))), null
            }
        },
        w = function(e) {
            return e.find(function(e) {
                return u(e, 1)[0] === s
            })
        },
        S = function(e) {
            var t, n;
            return null != (n = null == (t = w(e)) ? void 0 : t[2]) ? n : 0
        },
        k = function(e) {
            var t = w(e),
                n = null == t ? void 0 : t[1];
            return null == n ? null : c[n]
        },
        I = function(e) {
            var t, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
            g(e);
            var r = p();
            if (void 0 !== r) {
                var o = null == r ? 0 : S(r),
                    a = null != (t = null == r ? void 0 : r.filter(function(e) {
                        return u(e, 1)[0] !== s
                    })) ? t : [];
                a.length >= 100 && a.shift();
                var i = o | n;
                a.push(0 === i ? [s, c.indexOf(e)] : [s, c.indexOf(e), i]);
                try {
                    localStorage.setItem("theme", JSON.stringify({
                        version: 0,
                        data: a
                    }))
                } catch (e) {
                    console.error("Could not set mode. Local storage is likely full: ".concat(l(e, Error) ? e : String(e)))
                }
            }
        },
        A = function(e) {
            var t = e.key,
                n = e.newValue;
            if ("theme" === t && null != n) {
                var r = p();
                if (null == r) return;
                var o = k(r);
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
        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
        if ("string" == typeof e) n[e] = t;
        else {
            var r = function(e) {
                    if (Array.isArray(e)) return o(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return o(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return o(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                a = r.pop(),
                i = n,
                l = !0,
                u = !1,
                c = void 0;
            try {
                for (var d, s = r[Symbol.iterator](); !(l = (d = s.next()).done); l = !0) {
                    var f, m = d.value;
                    null != (f = i)[m] || (f[m] = {}), i = i[m]
                }
            } catch (e) {
                u = !0, c = e
            } finally {
                try {
                    l || null == s.return || s.return()
                } finally {
                    if (u) throw c
                }
            }
            i[a] = t
        }
    }(["Roblox", "core-scripts", "color-mode"], r);
    try {
        var L, j, M = (null == (L = document.querySelector('meta[name="age-badge-control"]')) ? void 0 : L.dataset.ageBadgeControl) === "Kids" ? "dark" : void 0;
        ! function(e) {
            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                n = document.body.classList;
            if (n.contains("system-theme")) return g("system");
            if (n.contains("light-theme")) return g("light");
            if (n.contains("dark-theme")) return g("dark");
            var r = a("RBXThemeOverride");
            if (null != r) return E(r.value);
            s = e;
            var o = p(),
                i = null == o ? o : k(o);
            if (null != t.defaultMode && void 0 !== o && ((null == o ? 0 : S(o)) & 1) == 0) {
                I(t.defaultMode, 1), window.addEventListener("storage", A);
                return
            }
            null === i ? I(d) : void 0 === i ? g(d) : g(i), window.addEventListener("storage", A)
        }(null != (j = function() {
            var e, t = null == (e = document.querySelector('meta[name="user-data"]')) ? void 0 : e.dataset.userid;
            if (null == t) return null;
            var n = Number.parseInt(t, 10);
            return Number.isNaN(n) ? null : n
        }()) ? j : -1, {
            defaultMode: M
        })
    } catch (e) {
        console.error(e)
    }
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Theme");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/theme-f80a09baf0349b65.js.map