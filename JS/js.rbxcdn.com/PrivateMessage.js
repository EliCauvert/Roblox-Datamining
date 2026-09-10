! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "7a2801324a24e00cebfe068e856b265a8b930368"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "34969458-0d29-42e7-89d9-cf642bd2f8d9", e._sentryDebugIdIdentifier = "sentry-dbid-34969458-0d29-42e7-89d9-cf642bd2f8d9")
    } catch (e) {}
}(),
function() {
    var e = {
            611: function(e) {
                function t(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", a = 0; a < arguments.length; a++) {
                            var i = arguments[a];
                            i && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var a = "";
                                for (var i in e) r.call(e, i) && e[i] && (a = o(a, i));
                                return a
                            }(i)))
                        }
                        return e
                    }

                    function o(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var r, n, o, a = {
                        exports: {}
                    },
                    i = a.exports = {};

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function c() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : l
                } catch (e) {
                    r = l
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : c
                } catch (e) {
                    n = c
                }

                function s(e) {
                    if (r === setTimeout) return setTimeout(e, 0);
                    if ((r === l || !r) && setTimeout) return r = setTimeout, setTimeout(e, 0);
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
                var u = [],
                    f = !1,
                    d = -1;

                function p() {
                    f && o && (f = !1, o.length ? u = o.concat(u) : d = -1, u.length && m())
                }

                function m() {
                    if (!f) {
                        var e = s(p);
                        f = !0;
                        for (var t = u.length; t;) {
                            for (o = u, u = []; ++d < t;) o && o[d].run();
                            d = -1, t = u.length
                        }
                        o = null, f = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === c || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
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

                function b(e, t) {
                    this.fun = e, this.array = t
                }

                function y() {}

                function v() {}
                i.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    u.push(new b(e, t)), 1 !== u.length || f || s(m)
                }, b.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, i.title = "browser", i.browser = !0, i.env = {}, i.argv = [], i.version = "", i.versions = {}, i.on = y, i.addListener = y, i.once = y, i.off = y, i.removeListener = y, i.removeAllListeners = y, i.emit = y, i.prependListener = y, i.prependOnceListener = y, i.listeners = function(e) {
                    return []
                }, i.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, i.cwd = function() {
                    return "/"
                }, i.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, i.umask = function() {
                    return 0
                };
                var g = a.exports.browser,
                    h = a.exports.binding,
                    O = {},
                    j = "browser",
                    w = "browser",
                    x = "browser",
                    S = [],
                    P = {
                        nextTick: a.exports.nextTick,
                        title: a.exports.title,
                        browser: g,
                        env: a.exports.env,
                        argv: a.exports.argv,
                        version: a.exports.version,
                        versions: a.exports.versions,
                        on: a.exports.on,
                        addListener: a.exports.addListener,
                        once: a.exports.once,
                        off: a.exports.off,
                        removeListener: a.exports.removeListener,
                        removeAllListeners: a.exports.removeAllListeners,
                        emit: a.exports.emit,
                        emitWarning: v,
                        prependListener: a.exports.prependListener,
                        prependOnceListener: a.exports.prependOnceListener,
                        listeners: a.exports.listeners,
                        binding: h,
                        cwd: a.exports.cwd,
                        chdir: a.exports.chdir,
                        umask: a.exports.umask,
                        exit: v,
                        pid: 1,
                        features: O,
                        kill: v,
                        dlopen: v,
                        uptime: v,
                        memoryUsage: v,
                        uvCounters: v,
                        platform: j,
                        arch: w,
                        execPath: x,
                        execArgv: S
                    };
                t.addListener = a.exports.addListener, t.arch = w, t.argv = a.exports.argv, t.binding = h, t.browser = g, t.chdir = a.exports.chdir, t.cwd = a.exports.cwd, t.default = P, t.dlopen = v, t.emit = a.exports.emit, t.emitWarning = v, t.env = a.exports.env, t.execArgv = S, t.execPath = x, t.exit = v, t.features = O, t.kill = v, t.listeners = a.exports.listeners, t.memoryUsage = v, t.nextTick = a.exports.nextTick, t.off = a.exports.off, t.on = a.exports.on, t.once = a.exports.once, t.pid = 1, t.platform = j, t.prependListener = a.exports.prependListener, t.prependOnceListener = a.exports.prependOnceListener, t.removeAllListeners = a.exports.removeAllListeners, t.removeListener = a.exports.removeListener, t.title = a.exports.title, t.umask = a.exports.umask, t.uptime = v, t.uvCounters = v, t.version = a.exports.version, t.versions = a.exports.versions, e.exports = P
            }
        },
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var a = t[n] = {
            exports: {}
        };
        return e[n](a, a.exports, r), a.exports
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
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n, o, a, i, l, c, s, u, f, d, p, m, b, y, v, g, h, O, j = window.ReactJSX,
                w = window.Roblox["core-scripts"].util.ready,
                x = r.n(w),
                S = window.Roblox["core-scripts"].react,
                P = window.RobloxThumbnails;

            function I() {
                for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = function e(t) {
                    var r, n, o = "";
                    if ("string" == typeof t || "number" == typeof t) o += t;
                    else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                        if (Array.isArray(t)) {
                            var a = t.length;
                            for (r = 0; r < a; r++) t[r] && (n = e(t[r])) && (o && (o += " "), o += n)
                        } else
                            for (n in t) t[n] && (o && (o += " "), o += n);
                    return o
                }(e)) && (n && (n += " "), n += t);
                return n
            }
            var A = window.React,
                E = r.n(A);

            function N(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function C(e) {
                if (Array.isArray(e)) return e
            }

            function k() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function M(e, t) {
                if (e) {
                    if ("string" == typeof e) return N(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return N(e, t)
                }
            }
            var R = {
                    Small: {
                        dimension: 16,
                        strokeWidth: 2,
                        textClass: "text-caption-small"
                    },
                    Medium: {
                        dimension: 32,
                        strokeWidth: 3,
                        textClass: "text-caption-small",
                        valueContainerSize: 36
                    },
                    Large: {
                        dimension: 48,
                        strokeWidth: 4,
                        textClass: "text-caption-medium",
                        valueContainerSize: 52
                    }
                },
                T = E().forwardRef(function(e, t) {
                    var r, n = C(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || M(r) || k(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.className,
                        l = o.size,
                        c = void 0 === l ? "Large" : l,
                        s = o.variant,
                        u = o.value,
                        f = o.showValue,
                        d = void 0 !== f && f,
                        p = o.ariaLabel,
                        m = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        b = (C(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || M(a, 1) || k())[0],
                        y = R[c],
                        v = y.dimension,
                        g = y.strokeWidth,
                        h = y.textClass,
                        O = y.valueContainerSize,
                        j = (v - g) / 2,
                        w = 2 * Math.PI * j,
                        x = v / 2,
                        S = Math.min(100, Math.max(0, void 0 === u ? 0 : u)),
                        P = d && void 0 !== O ? O : v,
                        A = "Determinate" === (void 0 === s ? "Determinate" : s);
                    return E().createElement("div", function(e) {
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
                        ref: b,
                        className: I("foundation-web-progress-circle inline-flex items-center justify-center", i),
                        role: "progressbar",
                        "aria-label": p,
                        "aria-valuemin": A ? 0 : void 0,
                        "aria-valuemax": A ? 100 : void 0,
                        "aria-valuenow": A ? S : void 0,
                        style: {
                            width: P,
                            height: P
                        }
                    }, m), E().createElement("svg", {
                        width: v,
                        height: v,
                        viewBox: "0 0 ".concat(v, " ").concat(v),
                        className: "relative"
                    }, E().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: j,
                        fill: "none",
                        strokeWidth: g,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), E().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: j,
                        fill: "none",
                        strokeWidth: g,
                        strokeDasharray: A ? w : "".concat(.75 * w, " ").concat(.25 * w),
                        strokeDashoffset: A ? w * (1 - S / 100) : 0,
                        strokeLinecap: "round",
                        className: I(!A && "foundation-web-progress-circle-indeterminate"),
                        style: A ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), A && d && "Large" === c && E().createElement("div", {
                        className: I("absolute content-emphasis flex items-center justify-center", h),
                        "aria-hidden": "true"
                    }, E().createElement("span", null, Math.round(S)), E().createElement("span", null, "%")))
                });
            T.displayName = "ProgressCircle";
            var D = window.Roblox["core-scripts"].meta.device,
                L = "inbox",
                z = "sent",
                _ = "notifications",
                U = "archive",
                F = "list",
                B = "detail",
                K = "Roblox",
                W = "Roblox.Messages.CountChanged",
                X = window.Roblox["core-scripts"].eventStream,
                V = window.Roblox["core-scripts"].intl.intl,
                $ = r.n(V),
                H = window.Roblox["core-scripts"].endpoints,
                q = window.Roblox["core-scripts"].format.string,
                G = new($())().getDateTimeFormatter(),
                Z = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return t.find(function(e) {
                        return null != e
                    })
                },
                Y = function(e) {
                    var t, r, n, o = null != (t = Z(null == e ? void 0 : e.id, null == e ? void 0 : e.UserId, 1)) ? t : 1,
                        a = null != (r = Z(null == e ? void 0 : e.name, null == e ? void 0 : e.UserName, K)) ? r : K,
                        i = null != (n = Z(null == e ? void 0 : e.displayName, null == e ? void 0 : e.DisplayName, a)) ? n : a;
                    return {
                        id: o,
                        name: (0, q.escapeHtml)(a),
                        displayName: i,
                        hasVerifiedBadge: !!Z(null == e ? void 0 : e.hasVerifiedBadge, null == e ? void 0 : e.HasVerifiedBadge, !1),
                        profileLink: (0, H.getAbsoluteUrl)("/users/".concat(o, "/profile"))
                    }
                },
                J = function(e) {
                    var t = (0, H.getAbsoluteUrl)("/my/messages/");
                    return (0, H.getAbsoluteUrl)("/AbuseReport/message?ID=".concat(e, "&RedirectUrl=").concat(t))
                },
                Q = function(e) {
                    var t, r, n, o, a = null != (t = Z(e.id, e.Id, 0)) ? t : 0;
                    return {
                        id: a,
                        sender: Y(Z(e.sender, e.Sender)),
                        recipient: Y(Z(e.recipient, e.Recipient)),
                        subject: null != (r = Z(e.subject, e.Subject, "")) ? r : "",
                        body: null != (n = Z(e.body, e.Body, "")) ? n : "",
                        created: null != (o = Z(e.created, e.Created, "")) ? o : "",
                        updated: Z(e.updated, e.Updated),
                        isRead: !!Z(e.isRead, e.IsRead, !1),
                        isSystemMessage: !!Z(e.isSystemMessage, e.IsSystemMessage, !1),
                        isReportAbuseDisplayed: !!Z(e.isReportAbuseDisplayed, e.IsReportAbuseDisplayed, !1),
                        abuseReportUrl: J(a)
                    }
                },
                ee = function(e) {
                    var t, r, n, o, a = null != (t = Z(e.collection, e.Collection, [])) ? t : [];
                    return {
                        pageNumber: null != (r = Z(e.pageNumber, e.PageNumber, 0)) ? r : 0,
                        totalPages: null != (n = Z(e.totalPages, e.TotalPages, 1)) ? n : 1,
                        totalCollectionSize: null != (o = Z(e.totalCollectionSize, e.TotalCollectionSize, a.length)) ? o : a.length,
                        collection: a.map(Q)
                    }
                },
                et = function(e) {
                    var t = document.createElement("div");
                    return t.innerHTML = e, t.textContent || t.innerText || ""
                },
                er = function(e) {
                    var t = 0,
                        r = "";
                    return e.replace(/(https?:\/\/[^\s<]+)/g, function(n, o, a) {
                        return r += (0, q.escapeHtml)(e.slice(t, a)), r += '<a href="'.concat(n.replace(/[&"]/g, function(e) {
                            return "&" === e ? "&amp;" : "&quot;"
                        }), '" target="_blank" rel="noreferrer">').concat((0, q.escapeHtml)(n), "</a>"), t = a + n.length, n
                    }), (r += (0, q.escapeHtml)(e.slice(t))).replace(/\n/g, "<br />")
                },
                en = function(e) {
                    var t = new Date(e);
                    if (Number.isNaN(t.getTime())) return "";
                    var r = t.getFullYear() === new Date().getFullYear() ? G.getCustomDateTime(t, {
                        month: "short",
                        day: "numeric"
                    }) : G.getShortDate(t);
                    return "".concat(r, " | ").concat(G.getCustomDateTime(t, {
                        hour: "numeric",
                        minute: "numeric"
                    }))
                },
                eo = function(e) {
                    var t = new Date(e);
                    return Number.isNaN(t.getTime()) ? "" : G.getFullDate(t)
                },
                ea = function(e) {
                    document.dispatchEvent(new Event(e))
                },
                ei = window.Roblox["core-scripts"].environmentUrls,
                el = r.n(ei),
                ec = window.Roblox["core-scripts"].meta.user,
                es = window.Roblox["core-scripts"].http.http,
                eu = window.Roblox["core-scripts"].guac,
                ef = window.Roblox["core-lib"].http.index,
                ed = window.Roblox["core-lib"].url.index;

            function ep(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function em(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function eb(e, t) {
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
                        if ("string" == typeof e) return ep(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ep(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ey = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return e.getOrThrow().then(function(e) {
                        return t && null == e ? {} : e
                    }, function(e) {
                        throw em(e, ef.HttpError) ? Error("Request failed with status code ".concat(e.response.status), {
                            cause: e
                        }) : em(e, Error) ? e : Error(String(e), {
                            cause: e
                        })
                    })
                },
                ev = function(e) {
                    return function(e) {
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
                    }({}, e.withCredentials ? {
                        credentials: "include"
                    } : {}, e.retryable ? {
                        retry: ef.defaultBrowserRetryDelay
                    } : {}, e.noCache ? {
                        headers: {
                            "Cache-Control": "no-cache, no-store, must-revalidate",
                            Pragma: "no-cache"
                        }
                    } : {})
                },
                eg = function(e, t) {
                    var r = ed.Url.parse(e).getOrThrow();
                    if (!t) return r;
                    var n = Object.fromEntries(Object.entries(t).filter(function(e) {
                        return null != eb(e, 2)[1]
                    }).map(function(e) {
                        var t = eb(e, 2);
                        return [t[0], String(t[1])]
                    }));
                    return r.withSearchParams(n)
                },
                eh = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS ? {
                    get: function(e, t) {
                        return ey(ef.getUntyped(eg(e.url, t), ev(e)))
                    },
                    post: function(e, t) {
                        return ey(ef.postUntyped(eg(e.url), null != t ? t : {}, ev(e)), !0)
                    },
                    getGuacBundle: function(e) {
                        var t = ed.Url.parse(el().apiGatewayUrl).getOrThrow().withPath("/guac-v2/v1/bundles/".concat(e)).withSearchParams({
                            version: "1"
                        });
                        return ey(ef.getUntyped(t, {
                            credentials: "include"
                        }))
                    }
                } : {
                    get: function(e, t) {
                        return es.get(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    post: function(e, t) {
                        return es.post(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    getGuacBundle: function(e) {
                        var t = new URLSearchParams;
                        return t.append("version", "1"), (0, eu.callBehaviour)(e, t)
                    }
                };

            function eO(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function ej(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            eO(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            eO(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ew(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & s[0] ? n.return : s[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, s[1])).done) return o;
                            switch (n = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                case 0:
                                case 1:
                                    o = s;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                        a.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && a.label < o[1]) {
                                        a.label = o[1], o = s;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(s);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            s = t.call(e, a)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ex = function(e) {
                    return "".concat(el().privateMessagesApi).concat(e)
                },
                eS = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return {
                        url: e,
                        noCache: t,
                        retryable: t,
                        withCredentials: !0
                    }
                },
                eP = function(e, t) {
                    return e === _ ? ej(function() {
                        return ew(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, eh.get(eS(ex("/v1/announcements"), !0))];
                                case 1:
                                    return [2, ee(e.sent())]
                            }
                        })
                    })() : ej(function() {
                        return ew(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return [4, eh.get(eS(ex("/v1/messages"), !0), {
                                        pageNumber: t,
                                        pageSize: 20,
                                        messageTab: e
                                    })];
                                case 1:
                                    return [2, ee(r.sent())]
                            }
                        })
                    })()
                },
                eI = function(e, t) {
                    return eh.post(eS(ex(t ? "/v1/messages/mark-read" : "/v1/messages/mark-unread")), {
                        messageIds: e
                    })
                },
                eA = function(e) {
                    if (e.message) return Error(e.message);
                    var t, r, n = null == (r = e.errors) || null == (t = r[0]) ? void 0 : t.message;
                    return Error(null != n ? n : "Unknown error")
                },
                eE = function(e) {
                    var t = e.subject,
                        r = e.body,
                        n = e.recipientId,
                        o = e.replyMessageId,
                        a = e.includePreviousMessage;
                    return ej(function() {
                        var e, i;
                        return ew(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return [4, eh.post(eS(ex("/v1/messages/send")), {
                                        userId: null != (e = (0, ec.userId)()) ? e : 0,
                                        subject: t,
                                        body: r,
                                        recipientId: n,
                                        replyMessageId: o,
                                        includePreviousMessage: a
                                    })];
                                case 1:
                                    if (!1 === (i = l.sent()).success) throw eA(i);
                                    return [2, i]
                            }
                        })
                    })()
                };

            function eN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eC(e, t) {
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
                        if ("string" == typeof e) return eN(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eN(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ek = [L, z, _, U],
                eM = function(e) {
                    var t = Array.isArray(e) ? e[0] : e;
                    if (null == t || "" === t || "string" != typeof t && "number" != typeof t) return null;
                    var r = Number.parseInt(String(t), 10);
                    return Number.isNaN(r) ? null : r
                },
                eR = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "u" < typeof window ? "" : window.location.hash,
                        r = eC((t.startsWith("#!") ? t.slice(2) : t.replace(/^#/, "")).split("?"), 2),
                        n = r[0],
                        o = r[1],
                        a = (void 0 === n ? "/inbox" : n).replace(/^\//, ""),
                        i = ed.UrlSearchParams.parse(void 0 === o ? "" : o),
                        l = null != (e = eM(i.get("page"))) ? e : 1;
                    return {
                        tab: ek.includes(a) ? a : L,
                        page: l > 0 ? l : 1,
                        messageIdx: eM(i.get("messageIdx")),
                        conversationId: eM(i.get("conversationId"))
                    }
                },
                eT = function(e) {
                    var t = ed.UrlSearchParams.new(function(e) {
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
                    }({}, e.page > 1 ? {
                        page: String(e.page)
                    } : {}, null != e.messageIdx ? {
                        messageIdx: String(e.messageIdx)
                    } : {}, null != e.conversationId ? {
                        conversationId: String(e.conversationId)
                    } : {})).toString();
                    return "#!/".concat(e.tab).concat(t ? "?".concat(t) : "")
                },
                eD = function() {
                    var e = eC((0, A.useState)(function() {
                            return eR()
                        }), 2),
                        t = e[0],
                        r = e[1];
                    return (0, A.useEffect)(function() {
                        var e = function() {
                            r(eR())
                        };
                        return window.addEventListener("hashchange", e),
                            function() {
                                window.removeEventListener("hashchange", e)
                            }
                    }, []), {
                        route: t,
                        setRoute: (0, A.useCallback)(function(e) {
                            var t = eT(e);
                            window.location.hash === t ? r(e) : window.location.hash = t
                        }, [])
                    }
                };

            function eL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ez(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function e_(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ez(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ez(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function eU(e) {
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

            function eF(e, t) {
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

            function eB(e, t) {
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
                }(e, t) || eX(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eK(e) {
                return function(e) {
                    if (Array.isArray(e)) return eL(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || eX(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eW(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eX(e, t) {
                if (e) {
                    if ("string" == typeof e) return eL(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eL(e, t)
                }
            }

            function eV(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & s[0] ? n.return : s[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, s[1])).done) return o;
                            switch (n = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                case 0:
                                case 1:
                                    o = s;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                        a.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && a.label < o[1]) {
                                        a.label = o[1], o = s;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(s);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            s = t.call(e, a)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var e$ = {
                    replyContent: "",
                    includePreviousMessage: !0,
                    isSending: !1
                },
                eH = function(e) {
                    return e && !e.isSystemMessage ? eF(eU({}, e), {
                        body: er(e.body)
                    }) : e
                },
                eq = function(e, t) {
                    if (e && (void 0 === e ? "undefined" : eW(e)) === "object") {
                        if ("string" == typeof e.message) return e.message;
                        if (Array.isArray(e.errors)) {
                            var r = e.errors[0];
                            if (r && (void 0 === r ? "undefined" : eW(r)) === "object" && "message" in r) return String(r.message)
                        }
                    }
                    return t
                },
                eG = function(e) {
                    var t = e.translate,
                        r = eD(),
                        n = r.route,
                        o = r.setRoute,
                        a = eB((0, A.useState)({}), 2),
                        i = a[0],
                        l = a[1],
                        c = eB((0, A.useState)(null), 2),
                        s = c[0],
                        u = c[1],
                        f = eB((0, A.useState)(null), 2),
                        d = f[0],
                        p = f[1],
                        m = eB((0, A.useState)(function() {
                            return new Set
                        }), 2),
                        b = m[0],
                        y = m[1],
                        v = eB((0, A.useState)(F), 2),
                        g = v[0],
                        h = v[1],
                        O = eB((0, A.useState)(!0), 2),
                        j = O[0],
                        w = O[1],
                        x = eB((0, A.useState)(null), 2),
                        S = x[0],
                        P = x[1],
                        I = eB((0, A.useState)(null), 2),
                        E = I[0],
                        N = I[1],
                        C = eB((0, A.useState)(e$), 2),
                        k = C[0],
                        M = C[1],
                        R = eB((0, A.useState)(0), 2),
                        T = R[0],
                        D = R[1],
                        K = (0, A.useRef)(!1),
                        V = (0, A.useMemo)(function() {
                            var e = [{
                                name: L,
                                label: t("Label.Inbox")
                            }, {
                                name: z,
                                label: t("Label.Sent")
                            }, {
                                name: _,
                                label: t("Label.News"),
                                count: T
                            }, {
                                name: U,
                                label: t("Label.Archive")
                            }];
                            return i.displayNewsTab ? e : e.filter(function(e) {
                                return e.name !== _
                            })
                        }, [T, i.displayNewsTab, t]),
                        $ = (0, A.useCallback)(function() {
                            return e_(function() {
                                var e, r, o, a;
                                return eV(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            w(!0), P(null), y(new Set), i.label = 1;
                                        case 1:
                                            var l;
                                            if (i.trys.push([1, 8, 9, 10]), null == n.conversationId) return [3, 5];
                                            return [4, (l = n.conversationId, ej(function() {
                                                return ew(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, eh.get(eS(ex("/v1/messages/".concat(l)), !0))];
                                                        case 1:
                                                            return [2, Q(e.sent())]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            if (e = i.sent(), u(null), p(eH(e)), M(e$), h(B), e.isRead) return [3, 4];
                                            return [4, eI([e.id], !0)];
                                        case 3:
                                            i.sent(), ea(W), i.label = 4;
                                        case 4:
                                            return [3, 7];
                                        case 5:
                                            return [4, eP(n.tab, n.page - 1)];
                                        case 6:
                                            u(o = i.sent()), h(null == n.messageIdx ? F : B), p(null == n.messageIdx ? null : eH(null != (r = o.collection[n.messageIdx]) ? r : null)), null != n.messageIdx && M(e$), ea(W), i.label = 7;
                                        case 7:
                                            return [3, 10];
                                        case 8:
                                            return a = i.sent(), u(null), p(null), h(F), P(eq(a, t("Message.UnknownError"))), [3, 10];
                                        case 9:
                                            return w(!1), [7];
                                        case 10:
                                            return [2]
                                    }
                                })
                            })()
                        }, [n, t]);
                    return (0, A.useEffect)(function() {
                        eh.getGuacBundle("private-messages-ui").then(l).catch(function() {
                            l({})
                        }), eh.get(eS(ex("/v1/announcements/metadata"), !0)).then(function(e) {
                            var t;
                            D(null != (t = e.numOfAnnouncements) ? t : 0)
                        }).catch(function() {
                            D(0)
                        })
                    }, []), (0, A.useEffect)(function() {
                        if (K.current) {
                            K.current = !1;
                            return
                        }
                        $()
                    }, [$]), {
                        route: n,
                        rules: i,
                        tabs: V,
                        page: s,
                        selectedMessage: d,
                        selectedMessageIds: b,
                        moduleState: g,
                        loading: j,
                        error: S,
                        feedback: E,
                        sendReplyState: k,
                        openTab: function(e) {
                            e === _ && (0, X.sendEventWithTarget)("newsOpenContent", "click", {
                                property: T
                            }, X.targetTypes.WWW), p(null), y(new Set), M(e$), o({
                                tab: e,
                                page: 1,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        openMessage: function(e, t) {
                            return e_(function() {
                                return eV(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (p(eH(e)), y(new Set([e.id])), M(e$), h(B), K.current = !0, o(eF(eU({}, n), {
                                                    messageIdx: t,
                                                    conversationId: null
                                                })), e.isRead) return [3, 2];
                                            return u(function(t) {
                                                return null == t ? t : eF(eU({}, t), {
                                                    collection: t.collection.map(function(t) {
                                                        return t.id === e.id ? eF(eU({}, t), {
                                                            isRead: !0
                                                        }) : t
                                                    })
                                                })
                                            }), [4, eI([e.id], !0)];
                                        case 1:
                                            r.sent(), ea(W), r.label = 2;
                                        case 2:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        backToList: function() {
                            p(null), y(new Set), M(e$), h(F), K.current = !0, o(eF(eU({}, n), {
                                messageIdx: null,
                                conversationId: null
                            }))
                        },
                        toggleMessageSelection: function(e) {
                            y(function(t) {
                                var r = new Set(t);
                                return r.has(e) ? r.delete(e) : r.add(e), r
                            })
                        },
                        toggleSelectAll: function() {
                            y(function(e) {
                                return s && e.size !== s.collection.length ? new Set(s.collection.map(function(e) {
                                    return e.id
                                })) : new Set
                            })
                        },
                        markRead: function(e) {
                            return e_(function() {
                                var t;
                                return eV(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (0 === (t = eK(b)).length) return [2];
                                            return u(function(r) {
                                                return null == r ? r : eF(eU({}, r), {
                                                    collection: r.collection.map(function(r) {
                                                        return t.includes(r.id) ? eF(eU({}, r), {
                                                            isRead: e
                                                        }) : r
                                                    })
                                                })
                                            }), y(new Set), [4, eI(t, e)];
                                        case 1:
                                            return r.sent(), ea(W), [2]
                                    }
                                })
                            })()
                        },
                        markArchive: function(e) {
                            return e_(function() {
                                var t, r;
                                return eV(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (0 === (t = b.size > 0 ? eK(b) : d ? [d.id] : []).length) return [2];
                                            return r = g === B, [4, eh.post(eS(ex(e ? "/v1/messages/archive" : "/v1/messages/unarchive")), {
                                                messageIds: t
                                            })];
                                        case 1:
                                            if (a.sent(), y(new Set), p(null), M(e$), h(F), !r) return [3, 2];
                                            return o(eF(eU({}, n), {
                                                messageIdx: null,
                                                conversationId: null
                                            })), [3, 4];
                                        case 2:
                                            return [4, $()];
                                        case 3:
                                            a.sent(), a.label = 4;
                                        case 4:
                                            return ea(W), [2]
                                    }
                                })
                            })()
                        },
                        changePage: function(e) {
                            M(e$), o({
                                tab: n.tab,
                                page: e,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        updateReplyContent: function(e) {
                            M(function(t) {
                                return eF(eU({}, t), {
                                    replyContent: e
                                })
                            })
                        },
                        updateIncludePreviousMessage: function(e) {
                            M(function(t) {
                                return eF(eU({}, t), {
                                    includePreviousMessage: e
                                })
                            })
                        },
                        sendReply: function() {
                            return e_(function() {
                                return eV(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            if (!d || 0 === k.replyContent.length) return [2];
                                            M(function(e) {
                                                return eF(eU({}, e), {
                                                    isSending: !0
                                                })
                                            }), e.label = 1;
                                        case 1:
                                            return e.trys.push([1, 3, 4, 5]), [4, eE({
                                                subject: d.subject,
                                                body: k.replyContent,
                                                recipientId: d.sender.id,
                                                replyMessageId: d.id,
                                                includePreviousMessage: k.includePreviousMessage
                                            })];
                                        case 2:
                                            return e.sent(), N({
                                                type: "success",
                                                message: t("Message.SendSuccessfully")
                                            }), M(e$), ea("Roblox.Messages.MessageSent"), [3, 5];
                                        case 3:
                                            return N({
                                                type: "warning",
                                                message: eq(e.sent(), t("Message.UnknownError"))
                                            }), [3, 5];
                                        case 4:
                                            return M(function(e) {
                                                return eF(eU({}, e), {
                                                    isSending: !1
                                                })
                                            }), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        dismissFeedback: function() {
                            N(null)
                        },
                        shouldShowSystemUser: function(e) {
                            return "sent" !== n.tab && 1 === e.sender.id
                        }
                    }
                };

            function eZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eY(e) {
                if (Array.isArray(e)) return e
            }

            function eJ() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function eQ(e, t) {
                if (e) {
                    if ("string" == typeof e) return eZ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eZ(e, t)
                }
            }
            var e0 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                e1 = E().forwardRef(function(e, t) {
                    var r, n = eY(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || eQ(r) || eJ(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.name,
                        l = o.size,
                        c = o.className,
                        s = (o.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["name", "size", "className", "children"])),
                        u = (eY(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || eQ(a, 1) || eJ())[0];
                    return E().createElement("span", function(e) {
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
                        ref: u,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: I("grow-0 shrink-0 basis-auto icon", i, e0[void 0 === l ? "Medium" : l], c)
                    }, s))
                });
            e1.displayName = "Icon";
            var e2 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                e8 = function(e) {
                    var t = e.className;
                    return E().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: I("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                e3 = "opacity-[0.5]",
                e4 = function(e) {
                    var t = e.width,
                        r = e.height;
                    return E().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, E().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function e5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e6(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function e7() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = e6(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : e6(t[e], null)
                        }
                    }
                }
            }

            function e9() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return A.useCallback(e7.apply(void 0, function(e) {
                    if (Array.isArray(e)) return e5(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return e5(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e5(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function te(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tt(e) {
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

            function tr(e, t) {
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

            function tn(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function to(e) {
                return function(e) {
                    if (Array.isArray(e)) return te(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return te(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return te(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ta(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var ti = Symbol.for("react.lazy"),
                tl = A[" use ".trim().toString()];

            function tc(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : ta(e)) === "object" && "$$typeof" in e && e.$$typeof === ti && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : ta(t)) === "object" && null !== t && "then" in t
            }
            var ts = ((e = A.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tn(e, ["children"]);
                    if (tc(r) && "function" == typeof tl && (r = tl(r._payload)), A.isValidElement(r)) {
                        var o, a, i, l, c, s = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            u = function(e, t) {
                                var r = tt({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, to(t));
                                        return o.apply(void 0, to(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = tt({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return tt({}, e, r)
                            }(n, r.props);
                        return r.type !== A.Fragment && (u.ref = t ? e7(t, s) : s), A.cloneElement(r, u)
                    }
                    return A.Children.count(r) > 1 ? A.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), t = e, (n = A.forwardRef(function(e, r) {
                    var n = e.children,
                        o = tn(e, ["children"]);
                    tc(n) && "function" == typeof tl && (n = tl(n._payload));
                    var a = A.Children.toArray(n),
                        i = a.find(tf);
                    if (i) {
                        var l = i.props.children,
                            c = a.map(function(e) {
                                return e !== i ? e : A.Children.count(l) > 1 ? A.Children.only(null) : A.isValidElement(l) ? l.props.children : null
                            });
                        return (0, j.jsx)(t, tr(tt({}, o), {
                            ref: r,
                            children: A.isValidElement(l) ? A.cloneElement(l, void 0, c) : null
                        }))
                    }
                    return (0, j.jsx)(t, tr(tt({}, o), {
                        ref: r,
                        children: n
                    }))
                })).displayName = "".concat("Slot", ".Slot"), n),
                tu = Symbol("radix.slottable");

            function tf(e) {
                return A.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tu
            }

            function td(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tp(e) {
                if (Array.isArray(e)) return e
            }

            function tm() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tb(e) {
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

            function ty(e, t) {
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

            function tv(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function tg(e, t) {
                if (e) {
                    if ("string" == typeof e) return td(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return td(e, t)
                }
            }
            var th = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                tO = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                tj = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tw = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tx = (0, A.forwardRef)(function(e, t) {
                    var r, n = tp(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tg(r) || tm(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.children,
                        l = o.className,
                        c = o.style,
                        s = o.isDisabled,
                        u = void 0 !== s && s,
                        f = o.isLoading,
                        d = void 0 !== f && f,
                        p = o.icon,
                        m = o.size,
                        b = void 0 === m ? "Large" : m,
                        y = o.variant,
                        v = void 0 === y ? "Emphasis" : y,
                        g = o.asChild,
                        h = tv(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        O = (tp(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || tg(a, 1) || tm())[0],
                        j = I("foundation-web-button", u ? e3 : [e2, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", tO[b], u ? tw[v] : tj[v], l),
                        w = tb({
                            textDecoration: "none"
                        }, c),
                        x = function(e) {
                            return E().createElement(E().Fragment, null, E().createElement(e8, null), d && E().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, E().createElement(e4, {
                                width: th[b],
                                height: th[b]
                            })), E().createElement("span", {
                                className: I("flex items-center min-width-0", "Large" === b || "Medium" === b ? "gap-small" : "gap-xsmall", d && "invisible")
                            }, p && E().createElement(e1, {
                                name: p,
                                size: b
                            }), E().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (g) {
                        h.as;
                        var S = tv(h, ["as"]),
                            P = E().Children.only(i);
                        return E().createElement(ts, ty(tb({
                            ref: O
                        }, S), {
                            className: j,
                            style: w,
                            "aria-disabled": u || void 0
                        }), E().cloneElement(P, {}, x(P.props.children)))
                    }
                    if ("a" === h.as) {
                        h.as;
                        var A = h.href,
                            N = tv(h, ["as", "href"]);
                        return E().createElement("a", ty(tb({
                            ref: O
                        }, N), {
                            "aria-disabled": u,
                            href: u ? void 0 : A,
                            className: j,
                            style: w
                        }), x(i))
                    }
                    h.as;
                    var C = tv(h, ["as"]);
                    return E().createElement("button", ty(tb({
                        ref: O,
                        type: "button"
                    }, C), {
                        disabled: u,
                        className: j,
                        style: w
                    }), x(i))
                }),
                tS = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                tP = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                tI = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        o = e.className,
                        a = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return E().createElement("button", function(e) {
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
                        type: "button",
                        className: I("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", e2, tP[t], tS[r], n && "radius-circle", o)
                    }, a), E().createElement(e8, null), E().createElement(e1, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function tA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tE(e) {
                if (Array.isArray(e)) return e
            }

            function tN() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tC(e) {
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

            function tk(e, t) {
                return tE(e) || function(e, t) {
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
                }(e, t) || tM(e, t) || tN()
            }

            function tM(e, t) {
                if (e) {
                    if ("string" == typeof e) return tA(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tA(e, t)
                }
            }
            var tR = (0, A.forwardRef)(function(e, t) {
                    var r, n, o, a = tE(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tM(r) || tN(),
                        i = a[0],
                        l = a.slice(1),
                        c = i.title,
                        s = i.icon,
                        u = i.actionLabel,
                        f = i.onAction,
                        d = i.actions,
                        p = i.onClose,
                        m = i.closeIconAriaLabel,
                        b = i.shouldAutoDismiss,
                        y = i.autoDismissDurationMs,
                        v = i.className,
                        g = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(i, ["title", "icon", "actionLabel", "onAction", "actions", "onClose", "closeIconAriaLabel", "shouldAutoDismiss", "autoDismissDurationMs", "className"]),
                        h = tk(l, 1)[0],
                        O = tk((0, A.useState)("enter"), 2),
                        j = O[0],
                        w = O[1],
                        x = (0, A.useRef)(void 0),
                        S = (0, A.useRef)(void 0),
                        P = (0, A.useRef)(void 0),
                        N = (0, A.useRef)(null),
                        C = null != d ? d : u && f && E().createElement(tx, {
                            size: "Small",
                            variant: "Utility",
                            className: "content-inverse-emphasis",
                            onClick: f,
                            ref: N
                        }, u),
                        k = !!C,
                        M = c.length > 80,
                        R = null == b || b,
                        T = 4e3;
                    k && (T = M ? 1e4 : 7e3);
                    var D = null != y ? y : T,
                        L = (0, A.useCallback)(function() {
                            "exit" !== j && (w("exit"), void 0 !== S.current && (window.clearTimeout(S.current), S.current = void 0), P.current = window.setTimeout(function() {
                                null == p || p()
                            }, 150))
                        }, [p, j]);
                    (0, A.useEffect)(function() {
                        return x.current = window.requestAnimationFrame(function() {
                                w("idle")
                            }),
                            function() {
                                void 0 !== x.current && window.cancelAnimationFrame(x.current)
                            }
                    }, []), (0, A.useEffect)(function() {
                        void 0 !== S.current && (window.clearTimeout(S.current), S.current = void 0), R && "exit" !== j && (S.current = window.setTimeout(function() {
                            L()
                        }, D))
                    }, [D, R, j, L]), (0, A.useEffect)(function() {
                        var e;
                        k && (null == (e = N.current) || e.focus())
                    }, [k]), (0, A.useEffect)(function() {
                        return function() {
                            void 0 !== S.current && window.clearTimeout(S.current), void 0 !== P.current && window.clearTimeout(P.current), void 0 !== x.current && window.cancelAnimationFrame(x.current)
                        }
                    }, []);
                    var z = {
                            position: "fixed",
                            left: "50%",
                            bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                            transform: "translate(-50%, ".concat("idle" === j ? "0" : "120%", ")"),
                            zIndex: "var(--foundation-portal-zindex, 9999)"
                        },
                        _ = g.style ? tC({}, z, g.style) : z;
                    return E().createElement("div", tC({
                        ref: h,
                        role: "status",
                        "aria-live": "polite",
                        className: I("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === j ? "ease-standard-in" : "ease-standard-out", v),
                        style: (n = tC({}, _), o = o = {
                            transitionDuration: "".concat("exit" === j ? 150 : 200, "ms"),
                            transitionProperty: "transform"
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(o)).forEach(function(e) {
                            Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                        }), n)
                    }, g), E().createElement("div", {
                        className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
                    }, s && E().createElement(e1, {
                        name: s,
                        size: "Small",
                        className: "shrink-0 content-inverse-emphasis"
                    }), E().createElement("div", {
                        className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
                    }, c)), E().createElement("div", {
                        className: "flex items-center justify-end gap-small shrink-0"
                    }, C, p && E().createElement(tI, {
                        variant: "Utility",
                        size: "Small",
                        isCircular: !0,
                        className: "content-inverse-emphasis",
                        "aria-label": void 0 === m ? "Dismiss snackbar" : m,
                        onClick: L
                    })))
                }),
                tT = function(e) {
                    var t = e.feedback,
                        r = e.onClose;
                    return t ? (0, j.jsx)(tR, {
                        title: t.message,
                        onClose: r,
                        shouldAutoDismiss: !0
                    }) : null
                },
                tD = 0,
                tL = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, A.useRef)();
                    return t.current || (tD += 1, t.current = "".concat(e).concat(tD)), t.current
                };

            function tz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t_(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tU(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        t_(e, t, r[t])
                    })
                }
                return e
            }

            function tF(e) {
                return function(e) {
                    if (Array.isArray(e)) return tz(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tz(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tz(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tB(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return A.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return A.useMemo(function() {
                                var t, o;
                                return t_({}, "__scope".concat(e), (t = tU({}, r), o = null != (o = t_({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                    var o = A.createContext(n),
                        a = r.length;
                    r = tF(r).concat([n]);
                    var i = function(t) {
                        var r, n = t.scope,
                            i = t.children,
                            l = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                            s = A.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, j.jsx)(c.Provider, {
                            value: s,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            s = A.useContext(c);
                        if (s) return s;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, tK.apply(void 0, [n].concat(tF(t)))]
            }

            function tK() {
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
                            return tU({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return A.useMemo(function() {
                            return t_({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }

            function tW(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }
            "u" > typeof window && window.document && window.document.createElement;
            var tX = (null == (h = globalThis) ? void 0 : h.document) ? A.useLayoutEffect : function() {};

            function tV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t$(e, t) {
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
                        if ("string" == typeof e) return tV(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tV(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tH = A[" useInsertionEffect ".trim().toString()] || tX;

            function tq(e) {
                var t, r, n, o, a, i, l, c, s = e.prop,
                    u = e.defaultProp,
                    f = e.onChange,
                    d = e.caller,
                    p = t$((r = (t = {
                        defaultProp: u,
                        onChange: void 0 === f ? function() {} : f
                    }).defaultProp, n = t.onChange, a = (o = t$(A.useState(r), 2))[0], i = o[1], l = A.useRef(a), c = A.useRef(n), tH(function() {
                        c.current = n
                    }, [n]), A.useEffect(function() {
                        if (l.current !== a) {
                            var e;
                            null == (e = c.current) || e.call(c, a), l.current = a
                        }
                    }, [a, l]), [a, i, c]), 3),
                    m = p[0],
                    b = p[1],
                    y = p[2],
                    v = void 0 !== s,
                    g = v ? s : m,
                    h = A.useRef(void 0 !== s);
                return A.useEffect(function() {
                    var e = h.current;
                    if (e !== v) {
                        var t = v ? "controlled" : "uncontrolled";
                        console.warn("".concat(d, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                    }
                    h.current = v
                }, [v, d]), [g, A.useCallback(function(e) {
                    if (v) {
                        var t, r = "function" == typeof e ? e(s) : e;
                        r !== s && (null == (t = y.current) || t.call(y, r))
                    } else b(e)
                }, [v, s, b, y])]
            }

            function tG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tY(e, t) {
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
                        if ("string" == typeof e) return tZ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tZ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            Symbol("RADIX:SYNC_STATE");
            var tJ = function(e) {
                var t, r, n, o, a, i, l, c, s, u, f, d, p, m, b, y, v, g = e.present,
                    h = e.children,
                    O = (t = g, a = (o = tY(A.useState(), 2))[0], i = o[1], l = A.useRef(null), c = A.useRef(t), s = A.useRef("none"), f = (u = tY((r = t ? "mounted" : "unmounted", n = {
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
                    }, A.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], d = u[1], A.useEffect(function() {
                        var e = tQ(l.current);
                        s.current = "mounted" === f ? e : "none"
                    }, [f]), tX(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = s.current,
                                o = tQ(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), tX(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = tQ(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === a && n && (d("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (s.current = tQ(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        d("ANIMATION_END")
                    }, [a, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: A.useCallback(function(e) {
                            l.current = e ? getComputedStyle(e) : null, i(e)
                        }, [])
                    }),
                    j = "function" == typeof h ? h({
                        present: O.isPresent
                    }) : A.Children.only(h),
                    w = e9(O.ref, (v = (y = null == (m = Object.getOwnPropertyDescriptor((p = j).props, "ref")) ? void 0 : m.get) && "isReactWarning" in y && y.isReactWarning) ? p.ref : (v = (y = null == (b = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : b.get) && "isReactWarning" in y && y.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof h || O.isPresent ? A.cloneElement(j, {
                    ref: w
                }) : null
            };

            function tQ(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function t0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t1(e) {
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

            function t2(e, t) {
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

            function t8(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function t3(e) {
                return function(e) {
                    if (Array.isArray(e)) return t0(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return t0(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return t0(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function t4(e) {
                var t, r, n = (t = e, (r = A.forwardRef(function(e, t) {
                        var r = e.children,
                            n = t8(e, ["children"]);
                        if (A.isValidElement(r)) {
                            var o, a, i, l, c, s = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                u = function(e, t) {
                                    var r = t1({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, t3(t));
                                            return o.apply(void 0, t3(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = t1({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return t1({}, e, r)
                                }(n, r.props);
                            return r.type !== A.Fragment && (u.ref = t ? e7(t, s) : s), A.cloneElement(r, u)
                        }
                        return A.Children.count(r) > 1 ? A.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = A.forwardRef(function(e, t) {
                        var r = e.children,
                            o = t8(e, ["children"]),
                            a = A.Children.toArray(r),
                            i = a.find(t6);
                        if (i) {
                            var l = i.props.children,
                                c = a.map(function(e) {
                                    return e !== i ? e : A.Children.count(l) > 1 ? A.Children.only(null) : A.isValidElement(l) ? l.props.children : null
                                });
                            return (0, j.jsx)(n, t2(t1({}, o), {
                                ref: t,
                                children: A.isValidElement(l) ? A.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, j.jsx)(n, t2(t1({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            tJ.displayName = "Presence", window.ReactDOM;
            var t5 = Symbol("radix.slottable");

            function t6(e) {
                return A.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === t5
            }

            function t7(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function t9(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        t7(e, t, r[t])
                    })
                }
                return e
            }

            function re(e, t) {
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
            var rt = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r = t4("Primitive.".concat(t)),
                    n = A.forwardRef(function(e, n) {
                        var o = e.asChild,
                            a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(e, ["asChild"]),
                            i = o ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, j.jsx)(i, re(t9({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), re(t9({}, e), t7({}, t, n))
            }, {});

            function rr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rn(e) {
                if (Array.isArray(e)) return e
            }

            function ro() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ra(e) {
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

            function ri(e, t) {
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

            function rl(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function rc(e, t) {
                return rn(e) || function(e, t) {
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
                }(e, t) || ru(e, t) || ro()
            }

            function rs(e) {
                return rn(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ru(e) || ro()
            }

            function ru(e, t) {
                if (e) {
                    if ("string" == typeof e) return rr(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rr(e, t)
                }
            }
            var rf = "Checkbox",
                rd = rc(tB(rf), 2),
                rp = rd[0];
            rd[1];
            var rm = rc(rp(rf), 2),
                rb = rm[0],
                ry = rm[1];

            function rv(e) {
                var t = e.__scopeCheckbox,
                    r = e.checked,
                    n = e.children,
                    o = e.defaultChecked,
                    a = e.disabled,
                    i = e.form,
                    l = e.name,
                    c = e.onCheckedChange,
                    s = e.required,
                    u = e.value,
                    f = e.internal_do_not_use_render,
                    d = rc(tq({
                        prop: r,
                        defaultProp: null != o && o,
                        onChange: c,
                        caller: rf
                    }), 2),
                    p = d[0],
                    m = d[1],
                    b = rc(A.useState(null), 2),
                    y = b[0],
                    v = b[1],
                    g = rc(A.useState(null), 2),
                    h = g[0],
                    O = g[1],
                    w = A.useRef(!1),
                    x = !y || !!i || !!y.closest("form"),
                    S = {
                        checked: p,
                        disabled: a,
                        setChecked: m,
                        control: y,
                        setControl: v,
                        name: l,
                        form: i,
                        value: void 0 === u ? "on" : u,
                        hasConsumerStoppedPropagationRef: w,
                        required: s,
                        defaultChecked: !rP(o) && o,
                        isFormControl: x,
                        bubbleInput: h,
                        setBubbleInput: O
                    };
                return (0, j.jsx)(rb, ri(ra({
                    scope: t
                }, S), {
                    children: "function" == typeof f ? f(S) : n
                }))
            }
            var rg = "CheckboxTrigger",
                rh = A.forwardRef(function(e, t) {
                    var r = rs([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.__scopeCheckbox,
                        i = n.onKeyDown,
                        l = n.onClick,
                        c = rl(n, ["__scopeCheckbox", "onKeyDown", "onClick"]),
                        s = rc(o, 1)[0],
                        u = ry(rg, a),
                        f = u.control,
                        d = u.value,
                        p = u.disabled,
                        m = u.checked,
                        b = u.required,
                        y = u.setControl,
                        v = u.setChecked,
                        g = u.hasConsumerStoppedPropagationRef,
                        h = u.isFormControl,
                        O = u.bubbleInput,
                        w = e9(s, y),
                        x = A.useRef(m);
                    return A.useEffect(function() {
                        var e = null == f ? void 0 : f.form;
                        if (e) {
                            var t = function() {
                                return v(x.current)
                            };
                            return e.addEventListener("reset", t),
                                function() {
                                    return e.removeEventListener("reset", t)
                                }
                        }
                    }, [f, v]), (0, j.jsx)(rt.button, ri(ra({
                        type: "button",
                        role: "checkbox",
                        "aria-checked": rP(m) ? "mixed" : m,
                        "aria-required": b,
                        "data-state": rI(m),
                        "data-disabled": p ? "" : void 0,
                        disabled: p,
                        value: d
                    }, c), {
                        ref: w,
                        onKeyDown: tW(i, function(e) {
                            "Enter" === e.key && e.preventDefault()
                        }),
                        onClick: tW(l, function(e) {
                            v(function(e) {
                                return !!rP(e) || !e
                            }), O && h && (g.current = e.isPropagationStopped(), g.current || e.stopPropagation())
                        })
                    }))
                });
            rh.displayName = rg;
            var rO = A.forwardRef(function(e, t) {
                var r = e.__scopeCheckbox,
                    n = e.name,
                    o = e.checked,
                    a = e.defaultChecked,
                    i = e.required,
                    l = e.disabled,
                    c = e.value,
                    s = e.onCheckedChange,
                    u = e.form,
                    f = rl(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]);
                return (0, j.jsx)(rv, {
                    __scopeCheckbox: r,
                    checked: o,
                    defaultChecked: a,
                    disabled: l,
                    required: i,
                    onCheckedChange: s,
                    name: n,
                    form: u,
                    value: c,
                    internal_do_not_use_render: function(e) {
                        var n = e.isFormControl;
                        return (0, j.jsxs)(j.Fragment, {
                            children: [(0, j.jsx)(rh, ri(ra({}, f), {
                                ref: t,
                                __scopeCheckbox: r
                            })), n && (0, j.jsx)(rS, {
                                __scopeCheckbox: r
                            })]
                        })
                    }
                })
            });
            rO.displayName = rf;
            var rj = "CheckboxIndicator",
                rw = A.forwardRef(function(e, t) {
                    var r = e.__scopeCheckbox,
                        n = e.forceMount,
                        o = rl(e, ["__scopeCheckbox", "forceMount"]),
                        a = ry(rj, r);
                    return (0, j.jsx)(tJ, {
                        present: n || rP(a.checked) || !0 === a.checked,
                        children: (0, j.jsx)(rt.span, ri(ra({
                            "data-state": rI(a.checked),
                            "data-disabled": a.disabled ? "" : void 0
                        }, o), {
                            ref: t,
                            style: ra({
                                pointerEvents: "none"
                            }, e.style)
                        }))
                    })
                });
            rw.displayName = rj;
            var rx = "CheckboxBubbleInput",
                rS = A.forwardRef(function(e, t) {
                    var r, n, o, a, i, l = rs([e, t]),
                        c = l[0],
                        s = l.slice(1),
                        u = c.__scopeCheckbox,
                        f = rl(c, ["__scopeCheckbox"]),
                        d = rc(s, 1)[0],
                        p = ry(rx, u),
                        m = p.control,
                        b = p.hasConsumerStoppedPropagationRef,
                        y = p.checked,
                        v = p.defaultChecked,
                        g = p.required,
                        h = p.disabled,
                        O = p.name,
                        w = p.value,
                        x = p.form,
                        S = p.bubbleInput,
                        P = e9(d, p.setBubbleInput),
                        I = (r = A.useRef({
                            value: y,
                            previous: y
                        }), A.useMemo(function() {
                            return r.current.value !== y && (r.current.previous = r.current.value, r.current.value = y), r.current.previous
                        }, [y])),
                        E = (a = (o = function(e) {
                            if (Array.isArray(e)) return e
                        }(n = A.useState(void 0)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return tG(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tG(e, 2)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = o[1], tX(function() {
                            if (m) {
                                i({
                                    width: m.offsetWidth,
                                    height: m.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var o = n.borderBoxSize,
                                                a = Array.isArray(o) ? o[0] : o;
                                            t = a.inlineSize, r = a.blockSize
                                        } else t = m.offsetWidth, r = m.offsetHeight;
                                        i({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(m, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(m)
                                    }
                            }
                            i(void 0)
                        }, [m]), a);
                    A.useEffect(function() {
                        if (S) {
                            var e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                                t = !b.current;
                            if (I !== y && e) {
                                var r = new Event("click", {
                                    bubbles: t
                                });
                                S.indeterminate = rP(y), e.call(S, !rP(y) && y), S.dispatchEvent(r)
                            }
                        }
                    }, [S, I, y, b]);
                    var N = A.useRef(!rP(y) && y);
                    return (0, j.jsx)(rt.input, ri(ra({
                        type: "checkbox",
                        "aria-hidden": !0,
                        defaultChecked: null != v ? v : N.current,
                        required: g,
                        disabled: h,
                        name: O,
                        value: w,
                        form: x
                    }, f), {
                        tabIndex: -1,
                        ref: P,
                        style: ri(ra({}, f.style, E), {
                            position: "absolute",
                            pointerEvents: "none",
                            opacity: 0,
                            margin: 0,
                            transform: "translateX(-100%)"
                        })
                    }))
                });

            function rP(e) {
                return "indeterminate" === e
            }

            function rI(e) {
                return rP(e) ? "indeterminate" : e ? "checked" : "unchecked"
            }
            rS.displayName = rx;
            var rA = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                rE = {
                    XSmall: "",
                    Small: "",
                    Medium: "",
                    Large: "padding-y-xxsmall"
                },
                rN = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                rC = {
                    XSmall: "",
                    Small: "padding-top-xxsmall",
                    Medium: "padding-top-xxsmall",
                    Large: "padding-top-xxsmall"
                },
                rk = function(e) {
                    var t = e.label,
                        r = e.className,
                        n = e.isChecked,
                        o = e.isDisabled,
                        a = e.size,
                        i = e.hint,
                        l = e.placement,
                        c = e.onCheckedChange,
                        s = e.id,
                        u = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]),
                        f = tL(),
                        d = s || f,
                        p = t && E().createElement("label", {
                            htmlFor: d,
                            className: I("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
                        }, E().createElement("span", {
                            className: I(rN[a], rC[a], "content-emphasis")
                        }, t), i && E().createElement("span", {
                            className: "text-body-medium content-default"
                        }, i));
                    return E().createElement("div", {
                        className: I("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", r)
                    }, "End" === l && p, E().createElement("div", {
                        className: I(rE[a])
                    }, E().createElement(rO, function(e) {
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
                        "data-slot": "checkbox",
                        className: I(rA[a], e2, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                        id: d,
                        checked: n,
                        disabled: o,
                        onCheckedChange: c,
                        "aria-label": t
                    }, u), E().createElement(e8, null), E().createElement(rw, {
                        "data-slot": "checkbox-indicator",
                        className: I(rA[a], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
                    }))), "Start" === l && p)
                },
                rM = function(e) {
                    var t = e.className,
                        r = e.children;
                    return (0, j.jsx)("div", {
                        className: t,
                        onClick: function(e) {
                            e.stopPropagation()
                        },
                        children: r
                    })
                };

            function rR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rT(e) {
                if (Array.isArray(e)) return e
            }

            function rD() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rL(e) {
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

            function rz(e, t) {
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

            function r_(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function rU(e, t) {
                if (e) {
                    if ("string" == typeof e) return rR(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rR(e, t)
                }
            }
            var rF = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                rB = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                rK = {
                    Large: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Medium: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Small: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    XSmall: {
                        circular: "radius-circle",
                        square: "radius-small"
                    }
                },
                rW = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                rX = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                rV = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                r$ = {
                    Default: {
                        Emphasis: "content-action-emphasis",
                        Standard: "content-action-standard",
                        Alert: "content-action-alert",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-emphasis",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-alert",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                rH = {
                    Default: {
                        Emphasis: "content-action-standard",
                        Standard: "content-action-standard",
                        Alert: "content-action-standard",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-standard",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-standard",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                rq = (0, A.forwardRef)(function(e, t) {
                    var r, n, o = rT(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rU(r) || rD(),
                        a = o[0],
                        i = o.slice(1),
                        l = a.className,
                        c = a.icon,
                        s = a.ariaLabel,
                        u = a.isDisabled,
                        f = void 0 !== u && u,
                        d = a.isCircular,
                        p = a.isSelected,
                        m = a.size,
                        b = void 0 === m ? "Large" : m,
                        y = a.variant,
                        v = void 0 === y ? "Emphasis" : y,
                        g = a.iconColor,
                        h = void 0 === g ? "Default" : g,
                        O = a.asChild,
                        j = a.children,
                        w = r_(a, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        x = (rT(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || rU(i, 1) || rD())[0];
                    n = f ? rX[v] : void 0 !== p && p ? rV[v] : rW[v];
                    var S = I("foundation-web-icon-button", f ? e3 : [e2, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", rF[b], rK[b][void 0 !== d && d ? "circular" : "square"], n, l),
                        P = E().createElement(E().Fragment, null, E().createElement(e8, null), E().createElement("span", {
                            className: I("icon", c, rB[b], f ? rH[h][v] : r$[h][v])
                        }));
                    if (O) {
                        w.as;
                        var A = r_(w, ["as"]),
                            N = E().Children.only(j);
                        return E().createElement(ts, rz(rL({
                            ref: x
                        }, A), {
                            className: S,
                            "aria-label": s,
                            "aria-disabled": f || void 0
                        }), E().cloneElement(N, {}, P))
                    }
                    if ("a" === w.as) {
                        w.as;
                        var C = w.href,
                            k = r_(w, ["as", "href"]);
                        return E().createElement("a", rz(rL({
                            ref: x
                        }, k), {
                            "aria-label": s,
                            "aria-disabled": f,
                            href: f ? void 0 : C,
                            className: S
                        }), P)
                    }
                    w.as;
                    var M = r_(w, ["as"]);
                    return E().createElement("button", rz(rL({
                        ref: x,
                        type: "button"
                    }, M), {
                        "aria-label": s,
                        disabled: f,
                        className: S
                    }), P)
                }),
                rG = function(e) {
                    var t = e.translate,
                        r = e.currentPage,
                        n = e.totalPages,
                        o = e.onChangePage;
                    return n <= 1 ? null : (0, j.jsxs)("div", {
                        className: "flex items-center gap-xsmall justify-end",
                        children: [(0, j.jsx)(rq, {
                            icon: "icon-filled-chevron-large-left-to-line",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r <= 1,
                            ariaLabel: t("Action.FirstPage"),
                            onClick: function() {
                                o(1)
                            }
                        }), (0, j.jsx)(rq, {
                            icon: "icon-filled-chevron-large-left",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r <= 1,
                            ariaLabel: t("Action.Previous"),
                            onClick: function() {
                                o(r - 1)
                            }
                        }), (0, j.jsxs)("span", {
                            className: "text-body-large content-muted padding-x-small",
                            children: [r, " / ", n]
                        }), (0, j.jsx)(rq, {
                            icon: "icon-filled-chevron-large-right",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r >= n,
                            ariaLabel: t("Action.Next"),
                            onClick: function() {
                                o(r + 1)
                            }
                        }), (0, j.jsx)(rq, {
                            icon: "icon-filled-chevron-large-right-to-line",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r >= n,
                            ariaLabel: t("Action.LastPage"),
                            onClick: function() {
                                o(n)
                            }
                        })]
                    })
                },
                rZ = function(e) {
                    var t = e.translate,
                        r = e.activeTab,
                        n = e.moduleState,
                        o = e.selectedCount,
                        a = e.totalCount,
                        i = e.currentPage,
                        l = e.totalPages,
                        c = e.onToggleSelectAll,
                        s = e.onMarkArchive,
                        u = e.onMarkRead,
                        f = e.onBack,
                        d = e.onChangePage,
                        p = r === L,
                        m = r === U;
                    return r === z || r === _ ? n === F ? (0, j.jsx)("div", {
                        className: "flex justify-end margin-y-medium",
                        children: (0, j.jsx)(rG, {
                            translate: t,
                            currentPage: i,
                            totalPages: l,
                            onChangePage: d
                        })
                    }) : (0, j.jsx)("div", {
                        className: "margin-y-medium",
                        children: (0, j.jsx)(tx, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: f,
                            children: t("Action.Back")
                        })
                    }) : n === B ? (0, j.jsxs)("div", {
                        className: "flex items-center gap-small margin-y-medium",
                        children: [(0, j.jsx)(tx, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: f,
                            children: t("Action.Back")
                        }), p ? (0, j.jsx)(tx, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                s(!0)
                            },
                            children: t("Action.Archive")
                        }) : null, m ? (0, j.jsx)(tx, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                s(!1)
                            },
                            children: t("Action.MoveToInbox")
                        }) : null]
                    }) : (0, j.jsxs)("div", {
                        className: "flex items-center justify-between gap-medium margin-y-medium wrap",
                        children: [(0, j.jsxs)("div", {
                            className: "flex items-center gap-small wrap",
                            children: [(0, j.jsx)(rM, {
                                className: "padding-left-large",
                                children: (0, j.jsx)(rk, {
                                    label: t("Label.All"),
                                    size: "Medium",
                                    placement: "Start",
                                    isChecked: a > 0 && o === a,
                                    onCheckedChange: c
                                })
                            }), (0, j.jsxs)("div", {
                                className: "private-message-action-buttons flex items-center gap-small wrap",
                                children: [p ? (0, j.jsx)(tx, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        s(!0)
                                    },
                                    children: t("Action.Archive")
                                }) : null, m ? (0, j.jsx)(tx, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        s(!1)
                                    },
                                    children: t("Action.MoveToInbox")
                                }) : null, (0, j.jsx)(tx, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        u(!0)
                                    },
                                    children: t("Action.MarkAsRead")
                                }), (0, j.jsx)(tx, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        u(!1)
                                    },
                                    children: t("Action.MarkAsUnread")
                                })]
                            })]
                        }), (0, j.jsx)(rG, {
                            translate: t,
                            currentPage: i,
                            totalPages: l,
                            onChangePage: d
                        })]
                    })
                };

            function rY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rJ(e) {
                if (Array.isArray(e)) return e
            }

            function rQ() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function r0(e, t) {
                if (e) {
                    if ("string" == typeof e) return rY(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rY(e, t)
                }
            }
            var r1 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                r2 = E().forwardRef(function(e, t) {
                    var r, n = rJ(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || r0(r) || rQ(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.name,
                        l = o.size,
                        c = o.className,
                        s = (o.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["name", "size", "className", "children"])),
                        u = (rJ(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || r0(a, 1) || rQ())[0];
                    return E().createElement("span", function(e) {
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
                        ref: u,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: I("grow-0 shrink-0 basis-auto icon", i, r1[void 0 === l ? "Medium" : l], c)
                    }, s))
                });
            r2.displayName = "Icon";
            var r8 = function(e) {
                    var t = e.titleText,
                        r = e.size,
                        n = void 0 === r ? "XSmall" : r,
                        o = e.className;
                    return (0, j.jsxs)("span", {
                        className: I("relative inline-flex items-center justify-center", o),
                        role: "img",
                        "aria-label": t,
                        title: t,
                        children: [(0, j.jsx)(r2, {
                            name: "icon-filled-verified-backplate",
                            className: "content-system-emphasis",
                            size: n
                        }), (0, j.jsx)(r2, {
                            name: "icon-filled-verified-check",
                            className: "absolute content-[white]",
                            size: n
                        })]
                    })
                },
                r3 = r(611),
                r4 = r.n(r3),
                r5 = function(e) {
                    var t = e.className;
                    return (0, j.jsxs)("span", {
                        "aria-hidden": "true",
                        className: r4()("flex items-center justify-center", t),
                        children: [(0, j.jsx)("img", {
                            alt: "",
                            src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjMzkzYjNkIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+",
                            className: "dark:hidden",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        }), (0, j.jsx)("img", {
                            alt: "",
                            src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjZmZmIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+",
                            className: "hidden dark:block",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        })]
                    })
                },
                r6 = function(e) {
                    var t = e.message,
                        r = e.activeTab,
                        n = e.renderThumbnail,
                        o = r === z ? t.recipient : t.sender,
                        a = r !== z && 1 === t.sender.id;
                    return (0, j.jsx)("a", {
                        href: o.profileLink,
                        className: "size-800 shrink-0 flex items-center justify-center",
                        children: a ? (0, j.jsx)(r5, {
                            className: "size-800"
                        }) : (0, j.jsx)("span", {
                            className: "radius-circle clip size-800",
                            children: n({
                                userId: o.id,
                                altName: o.displayName
                            })
                        })
                    })
                },
                r7 = function(e) {
                    var t = e.translate,
                        r = e.renderThumbnail,
                        n = e.formatDetailDate,
                        o = e.message,
                        a = e.activeTab;
                    if (!o) return null;
                    var i = a === z ? o.recipient : o.sender;
                    return (0, j.jsxs)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large",
                        children: [(0, j.jsxs)("div", {
                            className: "flex justify-between gap-medium",
                            children: [(0, j.jsxs)("div", {
                                className: "min-width-0",
                                children: [(0, j.jsx)("h2", {
                                    className: "text-heading-medium content-emphasis margin-none text-wrap",
                                    children: o.subject
                                }), (0, j.jsxs)("div", {
                                    className: "flex gap-small margin-top-medium",
                                    children: [(0, j.jsx)(r6, {
                                        message: o,
                                        activeTab: a,
                                        renderThumbnail: r
                                    }), (0, j.jsxs)("div", {
                                        className: "min-width-0 flex flex-col gap-y-small",
                                        children: [(0, j.jsxs)("a", {
                                            href: i.profileLink,
                                            className: "text-title-medium content-emphasis flex items-center gap-xsmall",
                                            children: [(0, j.jsx)("span", {
                                                children: i.displayName
                                            }), i.hasVerifiedBadge ? (0, j.jsx)(r8, {
                                                size: "Medium",
                                                titleText: t("Creator.VerifiedBadgeIconAccessibilityText")
                                            }) : null]
                                        }), (0, j.jsxs)("div", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", i.name]
                                        }), (0, j.jsx)("div", {
                                            className: "text-caption-medium content-muted",
                                            children: n(o.created)
                                        })]
                                    })]
                                })]
                            }), o.isReportAbuseDisplayed ? (0, j.jsx)("a", {
                                href: o.abuseReportUrl,
                                className: "text-body-medium content-muted text-no-wrap abuse-report-modal",
                                children: t("Action.ReportAbuse")
                            }) : null]
                        }), (0, j.jsx)("div", {
                            className: "private-message-body text-body-large content-default margin-top-large",
                            dangerouslySetInnerHTML: {
                                __html: o.body
                            }
                        })]
                    })
                },
                r9 = function(e) {
                    var t = e.translate,
                        r = e.message,
                        n = e.activeTab === z ? r.recipient : r.sender;
                    return (0, j.jsxs)("span", {
                        className: "flex items-center gap-xsmall min-width-0",
                        children: [(0, j.jsx)("span", {
                            className: "text-truncate-end text-no-wrap min-width-0",
                            children: n.displayName
                        }), n.hasVerifiedBadge ? (0, j.jsx)(r8, {
                            size: "Medium",
                            titleText: t("Creator.VerifiedBadgeIconAccessibilityText")
                        }) : null, (0, j.jsxs)("span", {
                            className: "text-body-medium content-muted text-truncate-end text-no-wrap min-width-0",
                            children: ["@", n.name]
                        })]
                    })
                },
                ne = function(e) {
                    var t = e.message,
                        r = e.activeTab,
                        n = e.renderThumbnail,
                        o = e.onOpen,
                        a = r === z ? t.recipient : t.sender,
                        i = r !== z && 1 === t.sender.id;
                    return (0, j.jsx)("button", {
                        type: "button",
                        className: "private-message-row-avatar bg-none stroke-none padding-none width-full size-800 flex items-center justify-center",
                        onClick: o,
                        "aria-label": a.displayName,
                        children: i ? (0, j.jsx)(r5, {
                            className: "size-700"
                        }) : (0, j.jsx)("span", {
                            className: "radius-circle clip size-700",
                            children: n({
                                userId: a.id,
                                altName: a.displayName
                            })
                        })
                    })
                },
                nt = function(e) {
                    var t = e.translate,
                        r = e.renderThumbnail,
                        n = e.formatListDate,
                        o = e.message,
                        a = e.index,
                        i = e.activeTab,
                        l = e.isSelected,
                        c = e.isSelectable,
                        s = e.onToggleSelection,
                        u = e.onOpen,
                        f = function() {
                            u(o, a)
                        },
                        d = !o.isRead && i !== z;
                    return (0, j.jsxs)("div", {
                        className: r4()("private-message-row grid items-center gap-medium padding-large stroke-bottom stroke-muted transition-colors", d ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        children: [(0, j.jsx)(rM, {
                            className: r4()(!c && "invisible"),
                            children: (0, j.jsx)(rk, {
                                "aria-label": o.subject,
                                size: "Medium",
                                placement: "Start",
                                isChecked: l,
                                onCheckedChange: function() {
                                    s(o.id)
                                }
                            })
                        }), (0, j.jsx)(ne, {
                            message: o,
                            activeTab: i,
                            renderThumbnail: r,
                            onOpen: f
                        }), (0, j.jsxs)("button", {
                            type: "button",
                            className: "bg-none stroke-none padding-none text-left min-width-0 clip flex flex-col gap-y-small",
                            onClick: f,
                            "aria-label": o.subject,
                            children: [(0, j.jsxs)("div", {
                                className: "flex items-center justify-between gap-small min-width-0",
                                children: [(0, j.jsx)("span", {
                                    className: r4()("text-title-large min-width-0", d ? "content-emphasis" : "content-muted"),
                                    children: (0, j.jsx)(r9, {
                                        translate: t,
                                        message: o,
                                        activeTab: i
                                    })
                                }), (0, j.jsx)("span", {
                                    className: "text-caption-medium content-muted text-no-wrap",
                                    children: n(o.created)
                                })]
                            }), (0, j.jsxs)("div", {
                                className: "private-message-row-preview text-body-large content-muted",
                                children: [(0, j.jsx)("span", {
                                    className: d ? "content-emphasis" : "content-muted",
                                    children: o.subject
                                }), (0, j.jsxs)("span", {
                                    children: [" - ", et(o.body)]
                                })]
                            })]
                        })]
                    })
                };

            function nr(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var nn = (nr(O = {}, L, "Label.NoMessagesInInbox"), nr(O, z, "Label.NoSentMessages"), nr(O, _, "Message.NoNews"), nr(O, U, "Label.NoMessagesInArchive"), O),
                no = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        a = e.page,
                        i = e.activeTab,
                        l = e.selectedMessageIds,
                        c = e.onToggleSelection,
                        s = e.onOpenMessage,
                        u = null != (t = null == a ? void 0 : a.collection) ? t : [];
                    return 0 === u.length ? (0, j.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: r(nn[i])
                    }) : (0, j.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: u.map(function(e, t) {
                            return (0, j.jsx)(nt, {
                                translate: r,
                                renderThumbnail: n,
                                formatListDate: o,
                                message: e,
                                index: t,
                                activeTab: i,
                                isSelected: l.has(e.id),
                                isSelectable: i !== z && i !== _,
                                onToggleSelection: c,
                                onOpen: s
                            }, e.id)
                        })
                    })
                };

            function na(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ni = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        a = e.notification,
                        i = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, A.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return na(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return na(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        l = i[0],
                        c = i[1],
                        s = 1 === a.sender.id;
                    return (0, j.jsx)("button", {
                        type: "button",
                        className: r4()("width-full stroke-none stroke-bottom stroke-muted padding-medium text-left transition-colors", l ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        onClick: function() {
                            c(function(e) {
                                return !e
                            })
                        },
                        "aria-expanded": l,
                        "aria-label": a.subject,
                        children: (0, j.jsxs)("div", {
                            className: "flex gap-small",
                            children: [(0, j.jsx)("span", {
                                className: "size-700 shrink-0 flex items-center justify-center",
                                children: s ? (0, j.jsx)(r5, {
                                    className: "size-700"
                                }) : (0, j.jsx)("span", {
                                    className: "radius-circle clip size-700",
                                    children: n({
                                        userId: a.sender.id,
                                        altName: a.sender.displayName
                                    })
                                })
                            }), (0, j.jsxs)("span", {
                                className: "min-width-0 fill flex flex-col gap-y-small",
                                children: [(0, j.jsxs)("span", {
                                    className: "flex justify-between gap-small",
                                    children: [(0, j.jsxs)("span", {
                                        className: "text-title-medium content-emphasis flex items-center gap-xsmall min-width-0",
                                        children: [(0, j.jsx)("span", {
                                            className: "text-truncate-end",
                                            children: a.sender.displayName
                                        }), a.sender.hasVerifiedBadge ? (0, j.jsx)(r8, {
                                            size: "Medium",
                                            titleText: r("Creator.VerifiedBadgeIconAccessibilityText")
                                        }) : null, (0, j.jsxs)("span", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", a.sender.name]
                                        })]
                                    }), (0, j.jsx)("span", {
                                        className: "text-caption-medium content-muted text-no-wrap",
                                        children: o(a.created)
                                    })]
                                }), (0, j.jsx)("span", {
                                    className: "private-message-row-preview text-body-large content-default",
                                    children: a.subject
                                }), l ? (0, j.jsx)("span", {
                                    className: "private-message-body block text-body-medium content-default margin-top-medium",
                                    dangerouslySetInnerHTML: {
                                        __html: a.body
                                    }
                                }) : null]
                            })]
                        })
                    })
                },
                nl = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        a = e.page,
                        i = null != (t = null == a ? void 0 : a.collection) ? t : [];
                    return 0 === i.length ? (0, j.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: r("Message.NoNews")
                    }) : (0, j.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: i.map(function(e) {
                            return (0, j.jsx)(ni, {
                                translate: r,
                                renderThumbnail: n,
                                formatListDate: o,
                                notification: e
                            }, e.id)
                        })
                    })
                };

            function nc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ns(e, t, r) {
                return (ns = ny() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && np(o, r.prototype), o
                }).apply(null, arguments)
            }

            function nu(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nf(e) {
                return (nf = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function nd(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nu(e, t, r[t])
                    })
                }
                return e
            }

            function np(e, t) {
                return (np = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function nm(e, t) {
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
                        if ("string" == typeof e) return nc(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nc(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nb(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (nb = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return ns(e, arguments, nf(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), np(r, e)
                })(e)
            }

            function ny() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (ny = function() {
                    return !!e
                })()
            }

            function nv(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            nb(Map);
            var ng = A[" useId ".trim().toString()] || function() {},
                nh = 0;

            function nO(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = A.useState(ng())) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return nv(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nv(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return tX(function() {
                    e || o(function(e) {
                        return null != e ? e : String(nh++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function nj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var nw = A.createContext(void 0);

            function nx(e) {
                var t = A.useContext(nw);
                return e || t || "ltr"
            }

            function nS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nP(e) {
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

            function nI(e, t) {
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

            function nA(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function nE(e, t) {
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
                }(e, t) || nN(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nN(e, t) {
                if (e) {
                    if ("string" == typeof e) return nS(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nS(e, t)
                }
            }
            var nC = "rovingFocusGroup.onEntryFocus",
                nk = {
                    bubbles: !1,
                    cancelable: !0
                },
                nM = "RovingFocusGroup",
                nR = nE((i = (a = nm(tB(o = nM + "CollectionProvider"), 2))[0], l = a[1], s = (c = nm(i(o, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], u = c[1], (f = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = E().useRef(null),
                        o = E().useRef(new Map).current;
                    return (0, j.jsx)(s, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = o, p = t4(d = nM + "CollectionSlot"), (m = E().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = e9(t, u(d, r).collectionRef);
                    return (0, j.jsx)(p, {
                        ref: o,
                        children: n
                    })
                })).displayName = d, y = "data-radix-collection-item", v = t4(b = nM + "CollectionItemSlot"), (g = E().forwardRef(function(e, t) {
                    var r, n, o = e.scope,
                        a = e.children,
                        i = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["scope", "children"]),
                        l = E().useRef(null),
                        c = e9(t, l),
                        s = u(b, o);
                    return E().useEffect(function() {
                        return s.itemMap.set(l, nd({
                                ref: l
                            }, i)),
                            function() {
                                s.itemMap.delete(l)
                            }
                    }), (0, j.jsx)(v, (r = nd({}, nu({}, y, "")), n = n = {
                        ref: c,
                        children: a
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
                })).displayName = b, [{
                    Provider: f,
                    Slot: m,
                    ItemSlot: g
                }, function(e) {
                    var t = u(nM + "CollectionConsumer", e);
                    return E().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(y, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, l]), 3),
                nT = nR[0],
                nD = nR[1],
                nL = nE(tB(nM, [nR[2]]), 2),
                nz = nL[0],
                n_ = nL[1],
                nU = nE(nz(nM), 2),
                nF = nU[0],
                nB = nU[1],
                nK = A.forwardRef(function(e, t) {
                    return (0, j.jsx)(nT.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, j.jsx)(nT.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, j.jsx)(nW, nI(nP({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            nK.displayName = nM;
            var nW = A.forwardRef(function(e, t) {
                    var r, n = e.__scopeRovingFocusGroup,
                        o = e.orientation,
                        a = e.loop,
                        i = e.dir,
                        l = e.currentTabStopId,
                        c = e.defaultCurrentTabStopId,
                        s = e.onCurrentTabStopIdChange,
                        u = e.onEntryFocus,
                        f = e.preventScrollOnEntryFocus,
                        d = void 0 !== f && f,
                        p = nA(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        m = A.useRef(null),
                        b = e9(t, m),
                        y = nx(i),
                        v = nE(tq({
                            prop: l,
                            defaultProp: null != c ? c : null,
                            onChange: s,
                            caller: nM
                        }), 2),
                        g = v[0],
                        h = v[1],
                        O = nE(A.useState(!1), 2),
                        w = O[0],
                        x = O[1],
                        S = (r = A.useRef(u), A.useEffect(function() {
                            r.current = u
                        }), A.useMemo(function() {
                            return function() {
                                for (var e, t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
                                return null == (e = r.current) ? void 0 : e.call.apply(e, [r].concat(function(e) {
                                    if (Array.isArray(e)) return nj(e)
                                }(n) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(n) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return nj(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nj(e, void 0)
                                    }
                                }(n) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }, [])),
                        P = nD(n),
                        I = A.useRef(!1),
                        E = nE(A.useState(0), 2),
                        N = E[0],
                        C = E[1];
                    return A.useEffect(function() {
                        var e = m.current;
                        if (e) return e.addEventListener(nC, S),
                            function() {
                                return e.removeEventListener(nC, S)
                            }
                    }, [S]), (0, j.jsx)(nF, {
                        scope: n,
                        orientation: o,
                        dir: y,
                        loop: void 0 !== a && a,
                        currentTabStopId: g,
                        onItemFocus: A.useCallback(function(e) {
                            return h(e)
                        }, [h]),
                        onItemShiftTab: A.useCallback(function() {
                            return x(!0)
                        }, []),
                        onFocusableItemAdd: A.useCallback(function() {
                            return C(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: A.useCallback(function() {
                            return C(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, j.jsx)(rt.div, nI(nP({
                            tabIndex: w || 0 === N ? -1 : 0,
                            "data-orientation": o
                        }, p), {
                            ref: b,
                            style: nP({
                                outline: "none"
                            }, e.style),
                            onMouseDown: tW(e.onMouseDown, function() {
                                I.current = !0
                            }),
                            onFocus: tW(e.onFocus, function(e) {
                                var t = !I.current;
                                if (e.target === e.currentTarget && t && !w) {
                                    var r = new CustomEvent(nC, nk);
                                    if (e.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var n = P().filter(function(e) {
                                            return e.focusable
                                        });
                                        nH([n.find(function(e) {
                                            return e.active
                                        }), n.find(function(e) {
                                            return e.id === g
                                        })].concat(function(e) {
                                            if (Array.isArray(e)) return nS(e)
                                        }(n) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(n) || nN(n) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), d)
                                    }
                                }
                                I.current = !1
                            }),
                            onBlur: tW(e.onBlur, function() {
                                return x(!1)
                            })
                        }))
                    })
                }),
                nX = "RovingFocusGroupItem",
                nV = A.forwardRef(function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        n = e.focusable,
                        o = void 0 === n || n,
                        a = e.active,
                        i = e.tabStopId,
                        l = e.children,
                        c = nA(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        s = nO(),
                        u = i || s,
                        f = nB(nX, r),
                        d = f.currentTabStopId === u,
                        p = nD(r),
                        m = f.onFocusableItemAdd,
                        b = f.onFocusableItemRemove,
                        y = f.currentTabStopId;
                    return A.useEffect(function() {
                        if (o) return m(),
                            function() {
                                return b()
                            }
                    }, [o, m, b]), (0, j.jsx)(nT.ItemSlot, {
                        scope: r,
                        id: u,
                        focusable: o,
                        active: void 0 !== a && a,
                        children: (0, j.jsx)(rt.span, nI(nP({
                            tabIndex: d ? 0 : -1,
                            "data-orientation": f.orientation
                        }, c), {
                            ref: t,
                            onMouseDown: tW(e.onMouseDown, function(e) {
                                o ? f.onItemFocus(u) : e.preventDefault()
                            }),
                            onFocus: tW(e.onFocus, function() {
                                return f.onItemFocus(u)
                            }),
                            onKeyDown: tW(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void f.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, r) {
                                        var n, o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return n$[o]
                                    }(e, f.orientation, f.dir);
                                    if (void 0 !== t) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var r = p().filter(function(e) {
                                            return e.focusable
                                        }).map(function(e) {
                                            return e.ref.current
                                        });
                                        if ("last" === t) r.reverse();
                                        else if ("prev" === t || "next" === t) {
                                            "prev" === t && r.reverse();
                                            var n, o, a = r.indexOf(e.currentTarget);
                                            r = f.loop ? (n = r, o = a + 1, n.map(function(e, t) {
                                                return n[(o + t) % n.length]
                                            })) : r.slice(a + 1)
                                        }
                                        setTimeout(function() {
                                            return nH(r)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof l ? l({
                                isCurrentTabStop: d,
                                hasTabStop: null != y
                            }) : l
                        }))
                    })
                });
            nV.displayName = nX;
            var n$ = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function nH(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    r = document.activeElement,
                    n = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var i, l = e[Symbol.iterator](); !(n = (i = l.next()).done); n = !0) {
                        var c = i.value;
                        if (c === r || (c.focus({
                                preventScroll: t
                            }), document.activeElement !== r)) return
                    }
                } catch (e) {
                    o = !0, a = e
                } finally {
                    try {
                        n || null == l.return || l.return()
                    } finally {
                        if (o) throw a
                    }
                }
            }

            function nq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nG(e) {
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

            function nZ(e, t) {
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

            function nY(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function nJ(e, t) {
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
                        if ("string" == typeof e) return nq(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nq(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nQ = "Tabs",
                n0 = nJ(tB(nQ, [n_]), 2),
                n1 = n0[0];
            n0[1];
            var n2 = n_(),
                n8 = nJ(n1(nQ), 2),
                n3 = n8[0],
                n4 = n8[1],
                n5 = A.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.onValueChange,
                        a = e.defaultValue,
                        i = e.orientation,
                        l = void 0 === i ? "horizontal" : i,
                        c = e.dir,
                        s = e.activationMode,
                        u = nY(e, ["__scopeTabs", "value", "onValueChange", "defaultValue", "orientation", "dir", "activationMode"]),
                        f = nx(c),
                        d = nJ(tq({
                            prop: n,
                            onChange: o,
                            defaultProp: null != a ? a : "",
                            caller: nQ
                        }), 2),
                        p = d[0],
                        m = d[1];
                    return (0, j.jsx)(n3, {
                        scope: r,
                        baseId: nO(),
                        value: p,
                        onValueChange: m,
                        orientation: l,
                        dir: f,
                        activationMode: void 0 === s ? "automatic" : s,
                        children: (0, j.jsx)(rt.div, nZ(nG({
                            dir: f,
                            "data-orientation": l
                        }, u), {
                            ref: t
                        }))
                    })
                });
            n5.displayName = nQ;
            var n6 = "TabsList",
                n7 = A.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.loop,
                        o = nY(e, ["__scopeTabs", "loop"]),
                        a = n4(n6, r),
                        i = n2(r);
                    return (0, j.jsx)(nK, nZ(nG({
                        asChild: !0
                    }, i), {
                        orientation: a.orientation,
                        dir: a.dir,
                        loop: void 0 === n || n,
                        children: (0, j.jsx)(rt.div, nZ(nG({
                            role: "tablist",
                            "aria-orientation": a.orientation
                        }, o), {
                            ref: t
                        }))
                    }))
                });
            n7.displayName = n6;
            var n9 = "TabsTrigger",
                oe = A.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.disabled,
                        a = void 0 !== o && o,
                        i = nY(e, ["__scopeTabs", "value", "disabled"]),
                        l = n4(n9, r),
                        c = n2(r),
                        s = on(l.baseId, n),
                        u = oo(l.baseId, n),
                        f = n === l.value;
                    return (0, j.jsx)(nV, nZ(nG({
                        asChild: !0
                    }, c), {
                        focusable: !a,
                        active: f,
                        children: (0, j.jsx)(rt.button, nZ(nG({
                            type: "button",
                            role: "tab",
                            "aria-selected": f,
                            "aria-controls": u,
                            "data-state": f ? "active" : "inactive",
                            "data-disabled": a ? "" : void 0,
                            disabled: a,
                            id: s
                        }, i), {
                            ref: t,
                            onMouseDown: tW(e.onMouseDown, function(e) {
                                a || 0 !== e.button || !1 !== e.ctrlKey ? e.preventDefault() : l.onValueChange(n)
                            }),
                            onKeyDown: tW(e.onKeyDown, function(e) {
                                [" ", "Enter"].includes(e.key) && l.onValueChange(n)
                            }),
                            onFocus: tW(e.onFocus, function() {
                                var e = "manual" !== l.activationMode;
                                f || a || !e || l.onValueChange(n)
                            })
                        }))
                    }))
                });
            oe.displayName = n9;
            var ot = "TabsContent",
                or = A.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.forceMount,
                        a = e.children,
                        i = nY(e, ["__scopeTabs", "value", "forceMount", "children"]),
                        l = n4(ot, r),
                        c = on(l.baseId, n),
                        s = oo(l.baseId, n),
                        u = n === l.value,
                        f = A.useRef(u);
                    return A.useEffect(function() {
                        var e = requestAnimationFrame(function() {
                            return f.current = !1
                        });
                        return function() {
                            return cancelAnimationFrame(e)
                        }
                    }, []), (0, j.jsx)(tJ, {
                        present: o || u,
                        children: function(r) {
                            var n = r.present;
                            return (0, j.jsx)(rt.div, nZ(nG({
                                "data-state": u ? "active" : "inactive",
                                "data-orientation": l.orientation,
                                role: "tabpanel",
                                "aria-labelledby": c,
                                hidden: !n,
                                id: s,
                                tabIndex: 0
                            }, i), {
                                ref: t,
                                style: nZ(nG({}, e.style), {
                                    animationDuration: f.current ? "0s" : void 0
                                }),
                                children: n && a
                            }))
                        }
                    })
                });

            function on(e, t) {
                return "".concat(e, "-trigger-").concat(t)
            }

            function oo(e, t) {
                return "".concat(e, "-content-").concat(t)
            }

            function oa(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oi(e) {
                if (Array.isArray(e)) return e
            }

            function ol() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oc(e) {
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

            function os(e, t) {
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

            function ou(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function of(e, t) {
                return oi(e) || function(e, t) {
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
                }(e, t) || op(e, t) || ol()
            }

            function od(e) {
                return oi(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || op(e) || ol()
            }

            function op(e, t) {
                if (e) {
                    if ("string" == typeof e) return oa(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oa(e, t)
                }
            }
            or.displayName = ot;
            var om = (0, A.createContext)({
                    size: "Medium",
                    variant: "Contained",
                    fitBehavior: "Fill"
                }),
                ob = {
                    XSmall: ["text-label-small", "height-700"],
                    Small: ["text-label-small", "height-800"],
                    Medium: ["text-label-medium", "height-1000"],
                    Large: ["text-label-medium", "height-1200"]
                },
                oy = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-small",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                ov = {
                    XSmall: {
                        Inlined: "",
                        Contained: "padding-top-small"
                    },
                    Small: {
                        Inlined: "",
                        Contained: "padding-top-small"
                    },
                    Medium: {
                        Inlined: "padding-top-xsmall",
                        Contained: "padding-top-medium"
                    },
                    Large: {
                        Inlined: "padding-top-xsmall",
                        Contained: "padding-top-xlarge"
                    }
                },
                og = {
                    XSmall: "padding-bottom-small",
                    Small: "padding-bottom-small",
                    Medium: "padding-bottom-medium",
                    Large: "padding-bottom-xlarge"
                },
                oh = (0, A.forwardRef)(function(e, t) {
                    var r = od([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.children,
                        i = n.className,
                        l = n.size,
                        c = n.variant,
                        s = n.fitBehavior,
                        u = ou(n, ["children", "className", "size", "variant", "fitBehavior"]),
                        f = of(o, 1)[0],
                        d = (0, A.useMemo)(function() {
                            return {
                                size: l || "Large",
                                variant: c || "Contained",
                                fitBehavior: s || "Fill"
                            }
                        }, [l, c, s]);
                    return E().createElement(om.Provider, {
                        value: d
                    }, E().createElement(n5, os(oc({
                        ref: f
                    }, u), {
                        className: I("foundation-web-tabs", "flex flex-col", i)
                    }), a))
                }),
                oO = (0, A.forwardRef)(function(e, t) {
                    var r = od([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.children,
                        i = n.className,
                        l = ou(n, ["children", "className"]),
                        c = of(o, 1)[0],
                        s = (0, A.useContext)(om).fitBehavior,
                        u = (0, A.useRef)(null),
                        f = of((0, A.useState)({
                            width: 0,
                            left: 0,
                            opacity: 0
                        }), 2),
                        d = f[0],
                        p = f[1],
                        m = E().useCallback(function(e) {
                            u.current = e, "function" == typeof c ? c(e) : c && "current" in c && (c.current = e)
                        }, [c]);
                    return (0, A.useEffect)(function() {
                        var e, t = function() {
                            var e = u.current;
                            if (e) {
                                var t = e.querySelector('[data-state="active"]');
                                if (t) {
                                    var r = e.getBoundingClientRect(),
                                        n = t.getBoundingClientRect();
                                    p({
                                        width: n.width,
                                        left: n.left - r.left,
                                        opacity: 1
                                    })
                                }
                            }
                        };
                        t();
                        var r = new MutationObserver(function() {
                                cancelAnimationFrame(e), e = requestAnimationFrame(t)
                            }),
                            n = "u" > typeof ResizeObserver ? new ResizeObserver(t) : null,
                            o = u.current;
                        return o && (r.observe(o, {
                                subtree: !0,
                                attributes: !0,
                                attributeFilter: ["data-state"]
                            }), null == n || n.observe(o)), window.addEventListener("resize", t),
                            function() {
                                cancelAnimationFrame(e), r.disconnect(), null == n || n.disconnect(), window.removeEventListener("resize", t)
                            }
                    }, [a]), E().createElement("div", {
                        className: I("relative scroll-x", i),
                        style: {
                            scrollbarWidth: "none",
                            msOverflowStyle: "none"
                        }
                    }, E().createElement(n7, os(oc({
                        ref: m
                    }, l), {
                        className: I("flex items-stretch bg-none border-0 stroke-none")
                    }), a), "Fit" === s && E().createElement("div", {
                        "aria-hidden": "true",
                        className: "absolute bottom-[0px] left-[0px] right-[0px] height-[var(--stroke-thick)] bg-[var(--color-stroke-muted)] [z-index:0]"
                    }), E().createElement("div", {
                        className: "absolute bottom-[0px] bg-system-contrast transition-all duration-200 ease-standard-out",
                        style: {
                            height: "var(--stroke-thick)",
                            zIndex: 1,
                            width: "".concat(d.width, "px"),
                            left: "".concat(d.left, "px"),
                            opacity: d.opacity
                        }
                    }))
                }),
                oj = (0, A.forwardRef)(function(e, t) {
                    var r = od([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.children,
                        i = n.className,
                        l = n.isDisabled,
                        c = void 0 !== l && l,
                        s = ou(n, ["children", "className", "isDisabled"]),
                        u = of(o, 1)[0],
                        f = (0, A.useContext)(om),
                        d = f.size,
                        p = f.variant,
                        m = f.fitBehavior;
                    return E().createElement(oe, os(oc({
                        ref: u
                    }, s), {
                        disabled: c,
                        style: {
                            borderBottom: "var(--stroke-thick) solid var(--color-stroke-muted)",
                            borderTop: "none",
                            borderLeft: "none",
                            borderRight: "none"
                        },
                        className: I("relative flex items-center justify-center cursor-pointer bg-none shrink-0", e2, ob[d], "Fill" === m ? "grow-1 ".concat(oy[d]) : "", ov[d][p], og[d], c && "opacity-[0.5]", i)
                    }), E().createElement(e8, null), E().createElement("div", {
                        className: "flex items-center justify-center height-600 relative"
                    }, a))
                });

            function ow(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ox(e) {
                if (Array.isArray(e)) return e
            }

            function oS() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oP(e, t) {
                if (e) {
                    if ("string" == typeof e) return ow(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ow(e, t)
                }
            }(0, A.forwardRef)(function(e, t) {
                var r = od([e, t]),
                    n = r[0],
                    o = r.slice(1),
                    a = n.children,
                    i = n.className,
                    l = ou(n, ["children", "className"]),
                    c = of(o, 1)[0];
                return E().createElement(or, os(oc({
                    ref: c
                }, l), {
                    className: I("padding-top-large", "outline-none", i)
                }), a)
            });
            var oI = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                oA = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                oE = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                oN = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                oC = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                ok = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                oM = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                oR = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                oT = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                oD = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                oL = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                oz = E().forwardRef(function(e, t) {
                    var r, n, o, a = ox(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oP(r) || oS(),
                        i = a[0],
                        l = a.slice(1),
                        c = i.className,
                        s = i.label,
                        u = i.variant,
                        f = void 0 === u ? "Standard" : u,
                        d = i.icon,
                        p = i.iconPosition,
                        m = void 0 === p ? "Leading" : p,
                        b = i.size,
                        y = void 0 === b ? "Small" : b,
                        v = i.shape,
                        g = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(i, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        h = (ox(l) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(l) || oP(l, 1) || oS())[0],
                        O = d && !s,
                        j = "padding-x-xxsmall";
                    d && (j = "Leading" === m ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var w = d && E().createElement(e1, {
                        name: d,
                        size: oD[y],
                        className: oE[f]
                    });
                    return E().createElement("div", (n = function(e) {
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
                        ref: h
                    }, g), o = o = {
                        className: I("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", oL[void 0 === v ? "Pill" : v], oC[y], O ? [oM[y], "justify-center"] : ["width-[fit-content]", ok[y]], oI[f], oA[f], oN[f], c)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(o)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                    }), n), "Leading" === m && w, s && E().createElement("span", {
                        className: I("text-no-wrap text-truncate-split", oR[y], oT[y], j, oA[f])
                    }, s), "Trailing" === m && w)
                });
            oz.displayName = "Badge";
            var o_ = function(e) {
                    var t = e.activeTab,
                        r = e.tabs,
                        n = e.onSelectTab;
                    return (0, j.jsx)(oh, {
                        value: t,
                        variant: "Contained",
                        size: "Large",
                        fitBehavior: "Fill",
                        className: "radius-none overflow-hidden",
                        onValueChange: function(e) {
                            var t = r.find(function(t) {
                                return t.name === e
                            });
                            t && n(t.name)
                        },
                        children: (0, j.jsx)(oO, {
                            children: r.map(function(e) {
                                return (0, j.jsx)(oj, {
                                    value: e.name,
                                    children: (0, j.jsxs)("span", {
                                        className: "flex items-center justify-center gap-small",
                                        children: [(0, j.jsx)("span", {
                                            children: e.label
                                        }), e.count ? (0, j.jsx)(oz, {
                                            label: String(e.count),
                                            variant: "Contrast"
                                        }) : null]
                                    })
                                }, e.name)
                            })
                        })
                    })
                },
                oU = function(e) {
                    var t, r, n, o, a, i = e.translate,
                        l = e.renderThumbnail,
                        c = e.formatListDate,
                        s = e.formatDetailDate,
                        u = eG({
                            translate: i
                        }),
                        f = (null == (n = (0, D.getDeviceMeta)()) ? void 0 : n.isInApp) === !0,
                        d = u.page ? u.page.pageNumber + 1 : u.route.page,
                        p = null != (t = null == (o = u.page) ? void 0 : o.totalPages) ? t : 1,
                        m = null != (r = null == (a = u.page) ? void 0 : a.collection.length) ? r : 0;
                    return (0, j.jsxs)("main", {
                        className: "private-message-page margin-x-auto padding-medium",
                        children: [f ? null : (0, j.jsx)("h1", {
                            className: "text-heading-large content-emphasis margin-top-none margin-bottom-medium",
                            children: i("Heading.Message")
                        }), (0, j.jsx)(o_, {
                            activeTab: u.route.tab,
                            tabs: u.tabs,
                            onSelectTab: u.openTab
                        }), (0, j.jsx)(rZ, {
                            translate: i,
                            activeTab: u.route.tab,
                            moduleState: u.moduleState,
                            selectedCount: u.selectedMessageIds.size,
                            totalCount: m,
                            currentPage: d,
                            totalPages: p,
                            onToggleSelectAll: u.toggleSelectAll,
                            onMarkArchive: function(e) {
                                u.markArchive(e)
                            },
                            onMarkRead: function(e) {
                                u.markRead(e)
                            },
                            onBack: u.backToList,
                            onChangePage: u.changePage
                        }), u.loading ? (0, j.jsx)("div", {
                            className: "flex justify-center padding-xxlarge",
                            children: (0, j.jsx)(T, {
                                ariaLabel: i("Label.Loading"),
                                variant: "Indeterminate",
                                size: "Medium"
                            })
                        }) : null, !u.loading && u.error ? (0, j.jsx)("div", {
                            className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-large content-system-alert",
                            children: u.error
                        }) : null, u.loading || u.error || u.moduleState !== F ? null : u.route.tab === _ ? (0, j.jsx)(nl, {
                            translate: i,
                            renderThumbnail: l,
                            formatListDate: c,
                            page: u.page
                        }) : (0, j.jsx)(no, {
                            translate: i,
                            renderThumbnail: l,
                            formatListDate: c,
                            page: u.page,
                            activeTab: u.route.tab,
                            selectedMessageIds: u.selectedMessageIds,
                            onToggleSelection: u.toggleMessageSelection,
                            onOpenMessage: function(e, t) {
                                u.openMessage(e, t)
                            }
                        }), u.loading || u.error || u.moduleState !== B ? null : (0, j.jsx)(r7, {
                            translate: i,
                            renderThumbnail: l,
                            formatDetailDate: s,
                            message: u.selectedMessage,
                            activeTab: u.route.tab
                        }), (0, j.jsx)(tT, {
                            feedback: u.feedback,
                            onClose: u.dismissFeedback
                        })]
                    })
                },
                oF = JSON.parse('{"P":["Feature.Messages","Feature.ProfileBadges"]}'),
                oB = function(e) {
                    var t = e.userId,
                        r = e.altName;
                    return (0, j.jsx)(P.Thumbnail2d, {
                        targetId: t,
                        type: P.ThumbnailTypes.avatarHeadshot,
                        altName: r
                    })
                },
                oK = function() {
                    var e = (0, S.useTranslation)().translate;
                    return (0, j.jsx)(oU, {
                        translate: e,
                        renderThumbnail: oB,
                        formatListDate: en,
                        formatDetailDate: eo
                    })
                },
                oW = function() {
                    var e;
                    return null != (e = document.getElementById("private-message")) ? e : document.getElementById("private-message-web-app")
                };
            x()(function() {
                var e = oW();
                e && ("private-message-web-app" === e.id && e.classList.add("messages-container"), (0, S.renderWithErrorBoundary)((0, j.jsx)(S.TranslationProvider, {
                    config: oF.P,
                    children: (0, j.jsx)(oK, {})
                }), e))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PrivateMessage");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/privateMessage-16f67a795b10893d.js.map