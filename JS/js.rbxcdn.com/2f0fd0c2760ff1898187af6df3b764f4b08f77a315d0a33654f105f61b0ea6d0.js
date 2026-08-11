! function() {
    "use strict";
    var e = {},
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
    }, r.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.rv = function() {
        return "1.2.8"
    }, r.ruid = "bundler=rspack@1.2.8";
    var n = {};

    function o(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    r.r(n), r.d(n, {
        getToken: function() {
            return x
        },
        getTokenTimestamp: function() {
            return g
        },
        requiresXsrf: function() {
            return b
        },
        setToken: function() {
            return h
        },
        xsrfHeaderName: function() {
            return p
        }
    });
    var i = function(e, t) {
            var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
            if ("string" == typeof e) r[e] = t;
            else {
                var n = function(e) {
                        if (Array.isArray(e)) return o(e)
                    }(e) || function(e) {
                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return o(e, void 0);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o(e, t)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    i = n.pop(),
                    u = r,
                    a = !0,
                    l = !1,
                    f = void 0;
                try {
                    for (var c, s = n[Symbol.iterator](); !(a = (c = s.next()).done); a = !0) {
                        var d, p, m = c.value;
                        null !== (p = (d = u)[m]) && void 0 !== p || (d[m] = {}), u = u[m]
                    }
                } catch (e) {
                    l = !0, f = e
                } finally {
                    try {
                        a || null == s.return || s.return()
                    } finally {
                        if (l) throw f
                    }
                }
                u[i] = t
            }
        },
        u = window.jQuery,
        a = r.n(u),
        l = ["POST", "PUT", "DELETE", "PATCH"],
        f = [".roblox.com", ".robloxlabs.com", ".roblox.qq.com"],
        c = ":443",
        s = "",
        d = null,
        p = "X-CSRF-TOKEN",
        m = function(e) {
            var t;
            return null === (t = null == e ? void 0 : e.split("?")[0]) || void 0 === t ? void 0 : t.toLowerCase().endsWith(".aspx")
        },
        v = function(e) {
            var t = document.createElement("a");
            t.href = e;
            var r = t.host;
            return r.endsWith(c) && (r = r.substring(0, r.length - c.length)), r
        },
        y = function(e) {
            var t = v(e);
            return t === window.location.host || f.some(function(e) {
                return t.endsWith(e)
            })
        },
        b = function(e, t) {
            return l.includes(null == e ? void 0 : e.toUpperCase()) && y(t) && !m(t)
        },
        h = function(e) {
            e && (s = e, d = new Date)
        },
        g = function() {
            return d
        },
        T = function() {
            var e = a()("meta[name='csrf-token']");
            if (e.length > 0) {
                s = e.data("token");
                var t = e.data("timestamp");
                t && (d = new Date(Date.parse(t)))
            }
        },
        x = function() {
            return "" === s && T(), s
        },
        j = "X-CSRF-TOKEN",
        S = function(e, t, r) {
            var n = x();
            "" !== n && b(r.type, r.url) && t.setRequestHeader(j, n)
        },
        w = function(e, t, r) {
            if ("jsonp" !== e.dataType && "script" !== e.dataType && b(e.type, e.url)) {
                t.error && (t._error = t.error), e.error = function() {};
                var n = a().Deferred();
                return r.done(n.resolve), r.fail(function() {
                    for (var e = arguments.length, o = Array(e), i = 0; i < e; i++) o[i] = arguments[i];
                    if (403 === r.status && null !== r.getResponseHeader(j)) {
                        var u = r.getResponseHeader(j);
                        if (null == u) {
                            n.rejectWith(r, o);
                            return
                        }
                        h(u), a().ajax(t).then(n.resolve, n.reject)
                    } else t._error && n.fail(t._error), n.rejectWith(r, o)
                }), n.promise(r)
            }
        },
        A = "CsrfToken",
        E = function(e) {
            a().ajax({
                method: "GET",
                url: "/XsrfToken",
                success: function(t, r, n) {
                    e(n.getResponseHeader("X-CSRF-TOKEN"))
                },
                error: function() {
                    e(null)
                }
            })
        },
        k = function(e) {
            a()("<input />").attr("type", "hidden").attr("name", A).attr("value", x()).appendTo(e)
        },
        O = function() {
            var e = g();
            return null === e || (new Date - e) / 1e3 > 300
        };

    function _(e) {
        var t = e ? e.target : this;
        if ("true" !== t.dataset.ajax) {
            if (!(b(t.getAttribute("method"), t.getAttribute("action")) && x() && 0 === a()(t).children("input[name='".concat(A, "']")).length)) {
                t._submit();
                return
            }
            if (O()) return E(function(e) {
                e && h(e), k(t), t._submit()
            }), !1;
            k(t), t._submit()
        }
    }
    i(["Roblox", "core-scripts", "auth", "xsrfToken"], n), i(["Roblox", "XsrfToken"], n), i(["Roblox", "XsrfTokenFormInjector"], {
        initialize: function() {
            window.addEventListener("submit", _, !0), HTMLFormElement.prototype._submit = HTMLFormElement.prototype.submit, HTMLFormElement.prototype.submit = _
        }
    }), ({
        initialize: function() {
            a()(document).ajaxSend(S), a().ajaxPrefilter(w)
        },
        handleAjaxSend: S,
        handleAjaxPrefilter: w
    }).initialize()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/xsrfProtection-49fc6ab9d73c7948.js.map
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("XsrfProtection");