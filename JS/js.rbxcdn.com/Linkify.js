! function() {
    "use strict";
    var r = {},
        t = {};

    function e(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var i = t[n] = {
            exports: {}
        };
        return r[n](i, i.exports, e), i.exports
    }
    e.n = function(r) {
        var t = r && r.__esModule ? function() {
            return r.default
        } : function() {
            return r
        };
        return e.d(t, {
            a: t
        }), t
    }, e.d = function(r, t) {
        for (var n in t) e.o(t, n) && !e.o(r, n) && Object.defineProperty(r, n, {
            enumerable: !0,
            get: t[n]
        })
    }, e.o = function(r, t) {
        return Object.prototype.hasOwnProperty.call(r, t)
    }, e.rv = function() {
        return "1.2.8"
    }, e.ruid = "bundler=rspack@1.2.8";
    var n = window.jQuery,
        o = e.n(n);

    function i(r, t) {
        (null == t || t > r.length) && (t = r.length);
        for (var e = 0, n = Array(t); e < t; e++) n[e] = r[e];
        return n
    }
    var a = window.Roblox,
        l = /(https?:\/\/)/,
        u = /(https?:\/\/)?(?:www\.)?([a-z0-9-]{2,}\.)*(((m|de|www|web|api|blog|wiki|corp|events|polls|bloxcon|developer|devforum|forum|status|create)\.roblox\.com|robloxlabs\.com)|(www\.shoproblox\.com)|(roblox\.status\.io)|(rblx\.co)|help\.roblox\.com(?![A-Za-z0-9/.]*\/attachments\/))(?!\/[A-Za-z0-9-+&@#/=~_|!:,.;]*%)((\/[A-Za-z0-9-+&@#/%?=~_|!:,.;]*)|(?=\s|\b))/gm,
        c = [".roblox.com", ".robloxlabs.com"];

    function f(r) {
        var t, e = r.replace(/&amp;/g, "&"),
            n = e,
            o = (t = e = e.replace(/\.+$/g, "")).match(l) ? t : "https://".concat(t);
        o = o.replace("http://", "https://");
        var i = $("<a></a>");
        i.addClass("text-link"), i.attr("href", o), i.text(n), void 0 !== a.DeviceMeta && (0, a.DeviceMeta)().isPhone || i.attr("target", "_blank");
        var u = "noopener";
        return ! function(r) {
            var t = r.prop("hostname");
            if (void 0 === t) return !1;
            for (var e = 0; e < c.length; e++) {
                var n = c[e];
                if (t.endsWith(n)) return !0
            }
            return !1
        }(i) && (u += " noreferrer"), i.attr("rel", u), i.clone().wrap("<div>").parent().html()
    }
    var s = {
        String: function(r) {
            return $("<div>".concat(r, "</div>")).find("a[href]").length > 0 ? r : r.replace(u, f)
        }
    };
    (function(r, t) {
        var e = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
        if ("string" == typeof r) e[r] = t;
        else {
            var n = function(r) {
                    if (Array.isArray(r)) return i(r)
                }(r) || function(r) {
                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r, t) {
                    if (r) {
                        if ("string" == typeof r) return i(r, void 0);
                        var e = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === e && r.constructor && (e = r.constructor.name), "Map" === e || "Set" === e) return Array.from(e);
                        if ("Arguments" === e || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(e)) return i(r, t)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                o = n.pop(),
                a = e,
                l = !0,
                u = !1,
                c = void 0;
            try {
                for (var f, s = n[Symbol.iterator](); !(l = (f = s.next()).done); l = !0) {
                    var d, p, v = f.value;
                    null !== (p = (d = a)[v]) && void 0 !== p || (d[v] = {}), a = a[v]
                }
            } catch (r) {
                u = !0, c = r
            } finally {
                try {
                    l || null == s.return || s.return()
                } finally {
                    if (u) throw c
                }
            }
            a[o] = t
        }
    })(["Roblox", "Linkify"], s), o().fn.linkify = function() {
        return this.each(function() {
            var r = o()(this),
                t = r.html();
            if (null != t) {
                var e = s.String(t);
                r.html(e)
            }
        })
    }, o()(function() {
        o()(".linkify").linkify()
    })
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Linkify");
//# debugId=bedf4a31-61ee-421b-b907-7b3124ce1aa1
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/linkify-3bdc09cd5e781d22.js.map