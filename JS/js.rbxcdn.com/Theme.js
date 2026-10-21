! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "50bfdfd1085202272a7ed4454945c15224042af0"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "30fe56b8-c111-4a8a-8e5b-2c092647fd64", e._sentryDebugIdIdentifier = "sentry-dbid-30fe56b8-c111-4a8a-8e5b-2c092647fd64")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {},
        t = {};

    function n(r) {
        var o = t[r];
        if (void 0 !== o) return o.exports;
        var l = t[r] = {
            exports: {}
        };
        return e[r](l, l.exports, n), l.exports
    }
    n.d = function(e, t) {
        for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, n.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, n.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.rv = function() {
        return "1.7.12"
    }, n.ruid = "bundler=rspack@1.7.12";
    var r = {};

    function o(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
        return r
    }
    n.r(r), n.d(r, {
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
            return U
        },
        setColorModeOverride: function() {
            return B
        },
        setMode: function() {
            return U
        }
    });
    var l = function(e, t) {
            return e.includes(t)
        },
        a = function(e) {
            var t, n = "".concat(e, "="),
                r = null == (t = document.cookie.split("; ").find(function(e) {
                    return e.startsWith(n)
                })) ? void 0 : t.slice(n.length);
            return null == r ? null : {
                name: e,
                value: decodeURIComponent(r)
            }
        },
        i = function(e) {
            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                n = Number.parseInt(e, t);
            return Number.isNaN(n) ? null : n
        },
        u = function(e) {
            if (!e.trim()) return null;
            try {
                return BigInt(e)
            } catch (e) {
                return null
            }
        },
        c = function(e) {
            var t = i(e);
            if (null == t) throw Error("UserId ".concat(e, " was not parsable as an integer."));
            return t
        },
        d = function(e) {
            return e > 0 && e <= Number.MAX_SAFE_INTEGER ? e.toString() : null
        };

    function s(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
        return r
    }

    function f(e, t) {
        return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }

    function m(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var n, r, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != o) {
                var l = [],
                    a = !0,
                    i = !1;
                try {
                    for (o = o.call(e); !(a = (n = o.next()).done) && (l.push(n.value), !t || l.length !== t); a = !0);
                } catch (e) {
                    i = !0, r = e
                } finally {
                    try {
                        a || null == o.return || o.return()
                    } finally {
                        if (i) throw r
                    }
                }
                return l
            }
        }(e, t) || function(e, t) {
            if (e) {
                if ("string" == typeof e) return s(e, t);
                var n = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return s(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var v = ["light", "dark", "system"],
        y = "light",
        h = null,
        b = y,
        g = null,
        p = function() {
            return null != g ? g : b
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
            var t = document.body.classList;
            switch (t.remove("color-mode-system", "color-mode-light", "color-mode-dark"), e) {
                case "system":
                    t.add("color-mode-system"), I(w.matches), w.addEventListener("change", E);
                    break;
                case "light":
                    t.add("color-mode-light"), w.removeEventListener("change", E), S();
                    break;
                case "dark":
                    t.add("color-mode-dark"), w.removeEventListener("change", E), k()
            }
        },
        M = function() {
            try {
                var e = localStorage.getItem("theme");
                if (null == e) return null;
                var t = JSON.parse(e),
                    n = t.version,
                    r = t.data;
                return 0 === n ? r : void 0
            } catch (e) {
                return console.error("Failed to get color mode data: ".concat(f(e, Error) ? e : String(e))), null
            }
        },
        O = function(e) {
            return e.find(function(e) {
                return m(e, 1)[0] === h
            })
        },
        L = function(e) {
            var t, n;
            return null != (t = null == (n = O(e)) ? void 0 : n[2]) ? t : 0
        },
        x = function(e) {
            var t = O(e),
                n = null == t ? void 0 : t[1];
            return null == n ? null : v[n]
        },
        C = function(e) {
            g = e, A(e)
        },
        j = function(e) {
            b = e, null == g && A(e)
        },
        T = function(e) {
            var t, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
            if (j(e), null != h) {
                var r = M();
                if (void 0 !== r) {
                    var o = null == r ? 0 : L(r),
                        l = null != (t = null == r ? void 0 : r.filter(function(e) {
                            return m(e, 1)[0] !== h
                        })) ? t : [];
                    l.length >= 100 && l.shift();
                    var a = o | n;
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
            var t = e.key,
                n = e.newValue;
            if ("theme" === t && null != n) {
                var r = M();
                if (null == r) return;
                var o = x(r);
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
        _ = function(e, t) {
            /^\/(?:[a-z]{2}\/)?(home|charts|my\/account)\/?$/.test(t) ? e.classList.remove("hidden") : e.classList.add("hidden")
        },
        D = function() {
            var e = document.createElement("div");
            e.setAttribute("id", "theme-background");
            var t = window.location.pathname;
            _(e, t), document.body.appendChild(e), new MutationObserver(function() {
                var n = window.location.pathname;
                t !== n && (t = n, _(e, n))
            }).observe(document.body, {
                childList: !0,
                subtree: !0
            })
        },
        U = function(e) {
            l(v, e) ? e !== b && T(e) : console.warn("Unknown color mode: ".concat(e))
        },
        B = function(e) {
            if (null != e && !l(v, e)) return void console.warn("Unknown color mode: ".concat(e));
            var t = p();
            g = e;
            var n = p();
            n !== t && A(n)
        };
    ! function(e, t) {
        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
        if ("string" == typeof e) n[e] = t;
        else {
            var r = function(e) {
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
                l = r.pop(),
                a = n,
                i = !0,
                u = !1,
                c = void 0;
            try {
                for (var d, s = r[Symbol.iterator](); !(i = (d = s.next()).done); i = !0) {
                    var f, m = d.value;
                    null != (f = a)[m] || (f[m] = {}), a = a[m]
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
            a[l] = t
        }
    }(["Roblox", "core-scripts", "color-mode"], r);
    try {
        var P, $, q, F, J, X = (null == (q = document.querySelector('meta[name="age-badge-control"]')) ? void 0 : q.dataset.ageBadgeControl) === "Kids" ? "dark" : void 0;
        ! function(e) {
            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            D();
            var n = document.body.classList;
            if (n.contains("color-mode-system") || n.contains("system-theme")) return C("system");
            if (n.contains("color-mode-light") || n.contains("light-theme")) return C("light");
            if (n.contains("color-mode-dark") || n.contains("dark-theme")) return C("dark");
            var r = a("RBXThemeOverride");
            if (null != r) return R(r.value);
            if (null == e) return j(y);
            h = c(e);
            var o = M(),
                l = null == o ? o : x(o);
            if (null != t.defaultColorMode && void 0 !== o && ((null == o ? 0 : L(o)) & 1) == 0) {
                T(t.defaultColorMode, 1), window.addEventListener("storage", N);
                return
            }
            null === l ? T(y) : void 0 === l ? j(y) : j(l), window.addEventListener("storage", N), n.contains("theme-halloween-2026") && C("dark")
        }((J = null == (F = document.querySelector('meta[name="user-data"]')) ? void 0 : F.dataset.userid, null == J ? null : (P = J, $ = u(P), null == $ ? null : d($))), {
            defaultColorMode: X
        })
    } catch (e) {
        console.error(e)
    }
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Theme");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/theme-99afdfb38459f525.js.map