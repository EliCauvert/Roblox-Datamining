! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "5316b23585115a562a5fc67e2e94718ae17a3589"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "ded178b7-9211-49b6-9926-0e895d6b79de", e._sentryDebugIdIdentifier = "sentry-dbid-ded178b7-9211-49b6-9926-0e895d6b79de")
    } catch (e) {}
}(),
function() {
    var e = {
            942: function(e) {
                function t(e) {
                    return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var n = {}.hasOwnProperty;

                    function r() {
                        for (var e = "", o = 0; o < arguments.length; o++) {
                            var i = arguments[o];
                            i && (e = a(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return r.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var o = "";
                                for (var i in e) n.call(e, i) && e[i] && (o = a(o, i));
                                return o
                            }(i)))
                        }
                        return e
                    }

                    function a(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (r.default = r, e.exports = r) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return r
                    }) : window.classNames = r
                }()
            },
            781: function(e, t, n) {
                "use strict";
                e.exports = {}
            }
        },
        t = {};

    function n(r) {
        var a = t[r];
        if (void 0 !== a) return a.exports;
        var o = t[r] = {
            exports: {}
        };
        return e[r](o, o.exports, n), o.exports
    }
    n.m = e, n.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return n.d(t, {
            a: t
        }), t
    }, n.d = function(e, t) {
        for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, n.k = function(e) {
        return "" + e + ".css"
    }, n.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), n.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, n.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.rv = function() {
        return "1.5.7"
    }, n.g.importScripts && (r = n.g.location + "");
    var r, a = n.g.document;
    if (!r && a && (a.currentScript && "SCRIPT" === a.currentScript.tagName.toUpperCase() && (r = a.currentScript.src), !r)) {
        var o = a.getElementsByTagName("script");
        if (o.length)
            for (var i = o.length - 1; i > -1 && (!r || !/^http(s?):/.test(r));) r = o[i--].src
    }
    if (!r) throw Error("Automatic publicPath is not supported in this browser");
    n.p = r.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), n.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var e, t, r, a, o, i, l, c, s, u, d, f, m, p, b, y, g, v, h, O, j = window.ReactJSX,
                w = window.Roblox["core-scripts"].util.ready,
                x = n.n(w),
                S = window.Roblox["core-scripts"].react,
                P = function() {
                    for (var e, t, n = 0, r = "", a = arguments.length; n < a; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, a = "";
                        if ("string" == typeof t || "number" == typeof t) a += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var o = t.length;
                                for (n = 0; n < o; n++) t[n] && (r = e(t[n])) && (a && (a += " "), a += r)
                            } else
                                for (r in t) t[r] && (a && (a += " "), a += r);
                        return a
                    }(e)) && (r && (r += " "), r += t);
                    return r
                },
                k = window.React,
                C = n.n(k),
                N = {
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
                I = C().forwardRef(function(e, t) {
                    var n = e.className,
                        r = e.size,
                        a = void 0 === r ? "Large" : r,
                        o = e.variant,
                        i = e.value,
                        l = e.showValue,
                        c = void 0 !== l && l,
                        s = e.ariaLabel,
                        u = function(e, t) {
                            if (null == e) return {};
                            var n, r, a = function(e, t) {
                                if (null == e) return {};
                                var n, r, a = {},
                                    o = Object.keys(e);
                                for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                return a
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                            }
                            return a
                        }(e, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        d = N[a],
                        f = d.dimension,
                        m = d.strokeWidth,
                        p = d.textClass,
                        b = d.valueContainerSize,
                        y = (f - m) / 2,
                        g = 2 * Math.PI * y,
                        v = f / 2,
                        h = Math.min(100, Math.max(0, void 0 === i ? 0 : i)),
                        O = c && void 0 !== b ? b : f,
                        j = "Determinate" === (void 0 === o ? "Determinate" : o);
                    return C().createElement("div", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        ref: t,
                        className: P("foundation-web-progress-circle inline-flex items-center justify-center", n),
                        role: "progressbar",
                        "aria-label": s,
                        "aria-valuemin": j ? 0 : void 0,
                        "aria-valuemax": j ? 100 : void 0,
                        "aria-valuenow": j ? h : void 0,
                        style: {
                            width: O,
                            height: O
                        }
                    }, u), C().createElement("svg", {
                        width: f,
                        height: f,
                        viewBox: "0 0 ".concat(f, " ").concat(f),
                        className: "relative"
                    }, C().createElement("circle", {
                        cx: v,
                        cy: v,
                        r: y,
                        fill: "none",
                        strokeWidth: m,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), C().createElement("circle", {
                        cx: v,
                        cy: v,
                        r: y,
                        fill: "none",
                        strokeWidth: m,
                        strokeDasharray: j ? g : "".concat(.75 * g, " ").concat(.25 * g),
                        strokeDashoffset: j ? g * (1 - h / 100) : 0,
                        strokeLinecap: "round",
                        className: P(!j && "foundation-web-progress-circle-indeterminate"),
                        style: j ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), j && c && "Large" === a && C().createElement("div", {
                        className: P("absolute content-emphasis flex items-center justify-center", p),
                        "aria-hidden": "true"
                    }, C().createElement("span", null, Math.round(h)), C().createElement("span", null, "%")))
                });
            I.displayName = "ProgressCircle";
            var A = window.Roblox["core-scripts"].meta.device,
                E = "inbox",
                M = "sent",
                D = "notifications",
                T = "archive",
                R = "list",
                z = "detail",
                _ = "Roblox",
                L = "Roblox.Messages.CountChanged",
                U = window.Roblox["core-scripts"].eventStream,
                F = window.Roblox["core-scripts"].intl.intl,
                B = n.n(F),
                W = window.Roblox["core-scripts"].endpoints,
                V = window.Roblox["core-scripts"].format.string,
                X = new(B())().getDateTimeFormatter(),
                H = function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return t.find(function(e) {
                        return null != e
                    })
                },
                $ = function(e) {
                    var t, n, r, a = null != (t = H(null == e ? void 0 : e.id, null == e ? void 0 : e.UserId, 1)) ? t : 1,
                        o = null != (n = H(null == e ? void 0 : e.name, null == e ? void 0 : e.UserName, _)) ? n : _,
                        i = null != (r = H(null == e ? void 0 : e.displayName, null == e ? void 0 : e.DisplayName, o)) ? r : o;
                    return {
                        id: a,
                        name: (0, V.escapeHtml)(o),
                        displayName: i,
                        hasVerifiedBadge: !!H(null == e ? void 0 : e.hasVerifiedBadge, null == e ? void 0 : e.HasVerifiedBadge, !1),
                        profileLink: (0, W.getAbsoluteUrl)("/users/".concat(a, "/profile"))
                    }
                },
                q = function(e) {
                    var t = (0, W.getAbsoluteUrl)("/my/messages/");
                    return (0, W.getAbsoluteUrl)("/AbuseReport/message?ID=".concat(e, "&RedirectUrl=").concat(t))
                },
                Z = function(e) {
                    var t, n, r, a, o = null != (t = H(e.id, e.Id, 0)) ? t : 0;
                    return {
                        id: o,
                        sender: $(H(e.sender, e.Sender)),
                        recipient: $(H(e.recipient, e.Recipient)),
                        subject: null != (n = H(e.subject, e.Subject, "")) ? n : "",
                        body: null != (r = H(e.body, e.Body, "")) ? r : "",
                        created: null != (a = H(e.created, e.Created, "")) ? a : "",
                        updated: H(e.updated, e.Updated),
                        isRead: !!H(e.isRead, e.IsRead, !1),
                        isSystemMessage: !!H(e.isSystemMessage, e.IsSystemMessage, !1),
                        isReportAbuseDisplayed: !!H(e.isReportAbuseDisplayed, e.IsReportAbuseDisplayed, !1),
                        abuseReportUrl: q(o)
                    }
                },
                G = function(e) {
                    var t, n, r, a, o = null != (t = H(e.collection, e.Collection, [])) ? t : [];
                    return {
                        pageNumber: null != (n = H(e.pageNumber, e.PageNumber, 0)) ? n : 0,
                        totalPages: null != (r = H(e.totalPages, e.TotalPages, 1)) ? r : 1,
                        totalCollectionSize: null != (a = H(e.totalCollectionSize, e.TotalCollectionSize, o.length)) ? a : o.length,
                        collection: o.map(Z)
                    }
                },
                K = function(e) {
                    var t = document.createElement("div");
                    return t.innerHTML = e, t.textContent || t.innerText || ""
                },
                Y = function(e) {
                    var t = 0,
                        n = "";
                    return e.replace(/(https?:\/\/[^\s<]+)/g, function(r, a, o) {
                        return n += (0, V.escapeHtml)(e.slice(t, o)), n += '<a href="'.concat(r.replace(/[&"]/g, function(e) {
                            return "&" === e ? "&amp;" : "&quot;"
                        }), '" target="_blank" rel="noreferrer">').concat((0, V.escapeHtml)(r), "</a>"), t = o + r.length, r
                    }), (n += (0, V.escapeHtml)(e.slice(t))).replace(/\n/g, "<br />")
                },
                J = function(e) {
                    var t = new Date(e);
                    if (Number.isNaN(t.getTime())) return "";
                    var n = t.getFullYear() === new Date().getFullYear() ? X.getCustomDateTime(t, {
                        month: "short",
                        day: "numeric"
                    }) : X.getShortDate(t);
                    return "".concat(n, " | ").concat(X.getCustomDateTime(t, {
                        hour: "numeric",
                        minute: "numeric"
                    }))
                },
                Q = function(e) {
                    var t = new Date(e);
                    return Number.isNaN(t.getTime()) ? "" : X.getFullDate(t)
                },
                ee = function(e) {
                    document.dispatchEvent(new Event(e))
                },
                et = window.Roblox["core-scripts"].environmentUrls,
                en = n.n(et),
                er = window.Roblox["core-scripts"].http.http,
                ea = window.Roblox["core-scripts"].guac,
                eo = window.Roblox["core-scripts"].meta.user;

            function ei(e, t, n, r, a, o, i) {
                try {
                    var l = e[o](i),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function el(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            ei(o, r, a, i, l, "next", e)
                        }

                        function l(e) {
                            ei(o, r, a, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ec(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = l(0), i.throw = l(1), i.return = l(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & s[0] ? r.return : s[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, s[1])).done) return a;
                            switch (r = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var es = function(e) {
                    return "".concat(en().privateMessagesApi).concat(e)
                },
                eu = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return {
                        url: e,
                        noCache: t,
                        retryable: t,
                        withCredentials: !0
                    }
                },
                ed = function() {
                    var e = new URLSearchParams;
                    return e.append("version", "1"), (0, ea.callBehaviour)("private-messages-ui", e)
                },
                ef = function(e, t) {
                    return e === D ? el(function() {
                        return ec(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, (0, er.get)(eu(es("/v1/announcements"), !0), void 0)];
                                case 1:
                                    return [2, G(e.sent().data)]
                            }
                        })
                    })() : el(function() {
                        return ec(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, (0, er.get)(eu(es("/v1/messages"), !0), {
                                        pageNumber: t,
                                        pageSize: 20,
                                        messageTab: e
                                    })];
                                case 1:
                                    return [2, G(n.sent().data)]
                            }
                        })
                    })()
                },
                em = function(e, t) {
                    return (0, er.post)(eu(es(t ? "/v1/messages/mark-read" : "/v1/messages/mark-unread")), {
                        messageIds: e
                    })
                },
                ep = function(e) {
                    if (e.message) return Error(e.message);
                    var t, n, r = null == (n = e.errors) || null == (t = n[0]) ? void 0 : t.message;
                    return Error(null != r ? r : "Unknown error")
                },
                eb = function(e) {
                    var t = e.subject,
                        n = e.body,
                        r = e.recipientId,
                        a = e.replyMessageId,
                        o = e.includePreviousMessage;
                    return el(function() {
                        var e, i;
                        return ec(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return [4, (0, er.post)(eu(es("/v1/messages/send")), {
                                        userId: null != (e = (0, eo.userId)()) ? e : 0,
                                        subject: t,
                                        body: n,
                                        recipientId: r,
                                        replyMessageId: a,
                                        includePreviousMessage: o
                                    })];
                                case 1:
                                    if (!1 === (i = l.sent()).data.success) throw ep(i.data);
                                    return [2, i.data]
                            }
                        })
                    })()
                },
                ey = window.Roblox["core-scripts"].util.url;

            function eg(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ev(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eg(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eg(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eh = [E, M, D, T],
                eO = function(e) {
                    var t = Array.isArray(e) ? e[0] : e;
                    if (null == t || "" === t || "string" != typeof t && "number" != typeof t) return null;
                    var n = Number.parseInt(String(t), 10);
                    return Number.isNaN(n) ? null : n
                },
                ej = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : window.location.hash,
                        n = ev((t.startsWith("#!") ? t.slice(2) : t.replace(/^#/, "")).split("?"), 2),
                        r = n[0],
                        a = n[1],
                        o = (void 0 === r ? "/inbox" : r).replace(/^\//, ""),
                        i = (0, ey.parseQueryString)(void 0 === a ? "" : a),
                        l = null != (e = eO(i.page)) ? e : 1;
                    return {
                        tab: eh.includes(o) ? o : E,
                        page: l > 0 ? l : 1,
                        messageIdx: eO(i.messageIdx),
                        conversationId: eO(i.conversationId)
                    }
                },
                ew = function(e) {
                    var t = (0, ey.composeQueryString)(function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({}, e.page > 1 ? {
                        page: e.page
                    } : {}, null != e.messageIdx ? {
                        messageIdx: e.messageIdx
                    } : {}, null != e.conversationId ? {
                        conversationId: e.conversationId
                    } : {}));
                    return "#!/".concat(e.tab).concat(t ? "?".concat(t) : "")
                },
                ex = function() {
                    var e = ev((0, k.useState)(function() {
                            return ej()
                        }), 2),
                        t = e[0],
                        n = e[1];
                    return (0, k.useEffect)(function() {
                        var e = function() {
                            n(ej())
                        };
                        return window.addEventListener("hashchange", e),
                            function() {
                                window.removeEventListener("hashchange", e)
                            }
                    }, []), {
                        route: t,
                        setRoute: (0, k.useCallback)(function(e) {
                            var t = ew(e);
                            window.location.hash === t ? n(e) : window.location.hash = t
                        }, [])
                    }
                };

            function eS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eP(e, t, n, r, a, o, i) {
                try {
                    var l = e[o](i),
                        c = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function ek(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            eP(o, r, a, i, l, "next", e)
                        }

                        function l(e) {
                            eP(o, r, a, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function eC(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function eN(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function eI(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || eM(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eA(e) {
                return function(e) {
                    if (Array.isArray(e)) return eS(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || eM(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eE(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eM(e, t) {
                if (e) {
                    if ("string" == typeof e) return eS(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eS(e, t)
                }
            }

            function eD(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = l(0), i.throw = l(1), i.return = l(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & s[0] ? r.return : s[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, s[1])).done) return a;
                            switch (r = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var eT = {
                    replyContent: "",
                    includePreviousMessage: !0,
                    isSending: !1
                },
                eR = function(e) {
                    return e && !e.isSystemMessage ? eN(eC({}, e), {
                        body: Y(e.body)
                    }) : e
                },
                ez = function(e, t) {
                    if (e && (void 0 === e ? "undefined" : eE(e)) === "object") {
                        if ("string" == typeof e.message) return e.message;
                        if (Array.isArray(e.errors)) {
                            var n = e.errors[0];
                            if (n && (void 0 === n ? "undefined" : eE(n)) === "object" && "message" in n) return String(n.message)
                        }
                    }
                    return t
                },
                e_ = function(e) {
                    var t = e.translate,
                        n = ex(),
                        r = n.route,
                        a = n.setRoute,
                        o = eI((0, k.useState)({}), 2),
                        i = o[0],
                        l = o[1],
                        c = eI((0, k.useState)(null), 2),
                        s = c[0],
                        u = c[1],
                        d = eI((0, k.useState)(null), 2),
                        f = d[0],
                        m = d[1],
                        p = eI((0, k.useState)(function() {
                            return new Set
                        }), 2),
                        b = p[0],
                        y = p[1],
                        g = eI((0, k.useState)(R), 2),
                        v = g[0],
                        h = g[1],
                        O = eI((0, k.useState)(!0), 2),
                        j = O[0],
                        w = O[1],
                        x = eI((0, k.useState)(null), 2),
                        S = x[0],
                        P = x[1],
                        C = eI((0, k.useState)(null), 2),
                        N = C[0],
                        I = C[1],
                        A = eI((0, k.useState)(eT), 2),
                        _ = A[0],
                        F = A[1],
                        B = eI((0, k.useState)(0), 2),
                        W = B[0],
                        V = B[1],
                        X = (0, k.useRef)(!1),
                        H = (0, k.useMemo)(function() {
                            var e = [{
                                name: E,
                                label: t("Label.Inbox")
                            }, {
                                name: M,
                                label: t("Label.Sent")
                            }, {
                                name: D,
                                label: t("Label.News"),
                                count: W
                            }, {
                                name: T,
                                label: t("Label.Archive")
                            }];
                            return i.displayNewsTab ? e : e.filter(function(e) {
                                return e.name !== D
                            })
                        }, [W, i.displayNewsTab, t]),
                        $ = (0, k.useCallback)(function() {
                            return ek(function() {
                                var e, n, a, o;
                                return eD(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            w(!0), P(null), y(new Set), i.label = 1;
                                        case 1:
                                            var l;
                                            if (i.trys.push([1, 8, 9, 10]), null == r.conversationId) return [3, 5];
                                            return [4, (l = r.conversationId, el(function() {
                                                return ec(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, (0, er.get)(eu(es("/v1/messages/".concat(l)), !0), void 0)];
                                                        case 1:
                                                            return [2, Z(e.sent().data)]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            if (e = i.sent(), u(null), m(eR(e)), F(eT), h(z), e.isRead) return [3, 4];
                                            return [4, em([e.id], !0)];
                                        case 3:
                                            i.sent(), ee(L), i.label = 4;
                                        case 4:
                                            return [3, 7];
                                        case 5:
                                            return [4, ef(r.tab, r.page - 1)];
                                        case 6:
                                            u(n = i.sent()), h(null == r.messageIdx ? R : z), m(null == r.messageIdx ? null : eR(null != (a = n.collection[r.messageIdx]) ? a : null)), null != r.messageIdx && F(eT), ee(L), i.label = 7;
                                        case 7:
                                            return [3, 10];
                                        case 8:
                                            return o = i.sent(), u(null), m(null), h(R), P(ez(o, t("Message.UnknownError"))), [3, 10];
                                        case 9:
                                            return w(!1), [7];
                                        case 10:
                                            return [2]
                                    }
                                })
                            })()
                        }, [r, t]);
                    return (0, k.useEffect)(function() {
                        ed().then(l).catch(function() {
                            l({})
                        }), el(function() {
                            return ec(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return [4, (0, er.get)(eu(es("/v1/announcements/metadata"), !0), void 0)];
                                    case 1:
                                        return [2, e.sent().data]
                                }
                            })
                        })().then(function(e) {
                            var t;
                            V(null != (t = e.numOfAnnouncements) ? t : 0)
                        }).catch(function() {
                            V(0)
                        })
                    }, []), (0, k.useEffect)(function() {
                        if (X.current) {
                            X.current = !1;
                            return
                        }
                        $()
                    }, [$]), {
                        route: r,
                        rules: i,
                        tabs: H,
                        page: s,
                        selectedMessage: f,
                        selectedMessageIds: b,
                        moduleState: v,
                        loading: j,
                        error: S,
                        feedback: N,
                        sendReplyState: _,
                        openTab: function(e) {
                            e === D && (0, U.sendEventWithTarget)("newsOpenContent", "click", {
                                property: W
                            }, U.targetTypes.WWW), m(null), y(new Set), F(eT), a({
                                tab: e,
                                page: 1,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        openMessage: function(e, t) {
                            return ek(function() {
                                return eD(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (m(eR(e)), y(new Set([e.id])), F(eT), h(z), X.current = !0, a(eN(eC({}, r), {
                                                    messageIdx: t,
                                                    conversationId: null
                                                })), e.isRead) return [3, 2];
                                            return u(function(t) {
                                                return null == t ? t : eN(eC({}, t), {
                                                    collection: t.collection.map(function(t) {
                                                        return t.id === e.id ? eN(eC({}, t), {
                                                            isRead: !0
                                                        }) : t
                                                    })
                                                })
                                            }), [4, em([e.id], !0)];
                                        case 1:
                                            n.sent(), ee(L), n.label = 2;
                                        case 2:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        backToList: function() {
                            m(null), y(new Set), F(eT), h(R), X.current = !0, a(eN(eC({}, r), {
                                messageIdx: null,
                                conversationId: null
                            }))
                        },
                        toggleMessageSelection: function(e) {
                            y(function(t) {
                                var n = new Set(t);
                                return n.has(e) ? n.delete(e) : n.add(e), n
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
                            return ek(function() {
                                var t;
                                return eD(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (0 === (t = eA(b)).length) return [2];
                                            return u(function(n) {
                                                return null == n ? n : eN(eC({}, n), {
                                                    collection: n.collection.map(function(n) {
                                                        return t.includes(n.id) ? eN(eC({}, n), {
                                                            isRead: e
                                                        }) : n
                                                    })
                                                })
                                            }), y(new Set), [4, em(t, e)];
                                        case 1:
                                            return n.sent(), ee(L), [2]
                                    }
                                })
                            })()
                        },
                        markArchive: function(e) {
                            return ek(function() {
                                var t, n;
                                return eD(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (0 === (t = b.size > 0 ? eA(b) : f ? [f.id] : []).length) return [2];
                                            return n = v === z, [4, (0, er.post)(eu(es(e ? "/v1/messages/archive" : "/v1/messages/unarchive")), {
                                                messageIds: t
                                            })];
                                        case 1:
                                            if (o.sent(), y(new Set), m(null), F(eT), h(R), !n) return [3, 2];
                                            return a(eN(eC({}, r), {
                                                messageIdx: null,
                                                conversationId: null
                                            })), [3, 4];
                                        case 2:
                                            return [4, $()];
                                        case 3:
                                            o.sent(), o.label = 4;
                                        case 4:
                                            return ee(L), [2]
                                    }
                                })
                            })()
                        },
                        changePage: function(e) {
                            F(eT), a({
                                tab: r.tab,
                                page: e,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        updateReplyContent: function(e) {
                            F(function(t) {
                                return eN(eC({}, t), {
                                    replyContent: e
                                })
                            })
                        },
                        updateIncludePreviousMessage: function(e) {
                            F(function(t) {
                                return eN(eC({}, t), {
                                    includePreviousMessage: e
                                })
                            })
                        },
                        sendReply: function() {
                            return ek(function() {
                                return eD(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            if (!f || 0 === _.replyContent.length) return [2];
                                            F(function(e) {
                                                return eN(eC({}, e), {
                                                    isSending: !0
                                                })
                                            }), e.label = 1;
                                        case 1:
                                            return e.trys.push([1, 3, 4, 5]), [4, eb({
                                                subject: f.subject,
                                                body: _.replyContent,
                                                recipientId: f.sender.id,
                                                replyMessageId: f.id,
                                                includePreviousMessage: _.includePreviousMessage
                                            })];
                                        case 2:
                                            return e.sent(), I({
                                                type: "success",
                                                message: t("Message.SendSuccessfully")
                                            }), F(eT), ee("Roblox.Messages.MessageSent"), [3, 5];
                                        case 3:
                                            return I({
                                                type: "warning",
                                                message: ez(e.sent(), t("Message.UnknownError"))
                                            }), [3, 5];
                                        case 4:
                                            return F(function(e) {
                                                return eN(eC({}, e), {
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
                            I(null)
                        },
                        shouldShowSystemUser: function(e) {
                            return "sent" !== r.tab && 1 === e.sender.id
                        }
                    }
                },
                eL = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                eU = C().forwardRef(function(e, t) {
                    var n = e.name,
                        r = e.size,
                        a = e.className,
                        o = (e.children, function(e, t) {
                            if (null == e) return {};
                            var n, r, a = function(e, t) {
                                if (null == e) return {};
                                var n, r, a = {},
                                    o = Object.keys(e);
                                for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                return a
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                            }
                            return a
                        }(e, ["name", "size", "className", "children"]));
                    return C().createElement("span", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        ref: t,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: P("grow-0 shrink-0 basis-auto icon", n, eL[void 0 === r ? "Medium" : r], a)
                    }, o))
                });
            eU.displayName = "Icon";
            var eF = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                eB = function(e) {
                    var t = e.className;
                    return C().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: P("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                eW = "opacity-[0.5]",
                eV = function(e) {
                    var t = e.width,
                        n = e.height;
                    return C().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, C().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function eX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eH(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function e$() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = eH(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : eH(t[e], null)
                        }
                    }
                }
            }

            function eq() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return k.useCallback(e$.apply(void 0, function(e) {
                    if (Array.isArray(e)) return eX(e)
                }(t) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eX(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eX(e, t)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function eZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eG(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function eK(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function eY(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        o = Object.keys(e);
                    for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }

            function eJ(e) {
                return function(e) {
                    if (Array.isArray(e)) return eZ(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eZ(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eZ(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eQ(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var e0 = Symbol.for("react.lazy"),
                e1 = k[" use ".trim().toString()];

            function e2(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : eQ(e)) === "object" && "$$typeof" in e && e.$$typeof === e0 && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : eQ(t)) === "object" && null !== t && "then" in t
            }
            var e8 = ((e = k.forwardRef(function(e, t) {
                    var n = e.children,
                        r = eY(e, ["children"]);
                    if (e2(n) && "function" == typeof e1 && (n = e1(n._payload)), k.isValidElement(n)) {
                        var a, o, i, l, c, s = (c = (l = null == (o = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? a.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                            u = function(e, t) {
                                var n = eG({}, t);
                                for (var r in t) ! function(r) {
                                    var a = e[r],
                                        o = t[r];
                                    /^on[A-Z]/.test(r) ? a && o ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = o.apply(void 0, eJ(t));
                                        return a.apply(void 0, eJ(t)), r
                                    } : a && (n[r] = a) : "style" === r ? n[r] = eG({}, a, o) : "className" === r && (n[r] = [a, o].filter(Boolean).join(" "))
                                }(r);
                                return eG({}, e, n)
                            }(r, n.props);
                        return n.type !== k.Fragment && (u.ref = t ? e$(t, s) : s), k.cloneElement(n, u)
                    }
                    return k.Children.count(n) > 1 ? k.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), t = e, (r = k.forwardRef(function(e, n) {
                    var r = e.children,
                        a = eY(e, ["children"]);
                    e2(r) && "function" == typeof e1 && (r = e1(r._payload));
                    var o = k.Children.toArray(r),
                        i = o.find(e3);
                    if (i) {
                        var l = i.props.children,
                            c = o.map(function(e) {
                                return e !== i ? e : k.Children.count(l) > 1 ? k.Children.only(null) : k.isValidElement(l) ? l.props.children : null
                            });
                        return (0, j.jsx)(t, eK(eG({}, a), {
                            ref: n,
                            children: k.isValidElement(l) ? k.cloneElement(l, void 0, c) : null
                        }))
                    }
                    return (0, j.jsx)(t, eK(eG({}, a), {
                        ref: n,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), r),
                e5 = Symbol("radix.slottable");

            function e3(e) {
                return k.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === e5
            }

            function e4(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function e6(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function e7(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        o = Object.keys(e);
                    for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }
            var e9 = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                te = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                tt = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tn = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tr = (0, k.forwardRef)(function(e, t) {
                    var n = e.children,
                        r = e.className,
                        a = e.style,
                        o = e.isDisabled,
                        i = void 0 !== o && o,
                        l = e.isLoading,
                        c = void 0 !== l && l,
                        s = e.icon,
                        u = e.size,
                        d = void 0 === u ? "Large" : u,
                        f = e.variant,
                        m = void 0 === f ? "Emphasis" : f,
                        p = e.asChild,
                        b = e7(e, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        y = P("foundation-web-button", i ? eW : [eF, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", te[d], i ? tn[m] : tt[m], r),
                        g = e4({
                            textDecoration: "none"
                        }, a),
                        v = function(e) {
                            return C().createElement(C().Fragment, null, C().createElement(eB, null), c && C().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, C().createElement(eV, {
                                width: e9[d],
                                height: e9[d]
                            })), C().createElement("span", {
                                className: P("flex items-center min-width-0", "Large" === d || "Medium" === d ? "gap-small" : "gap-xsmall", c && "invisible")
                            }, s && C().createElement(eU, {
                                name: s,
                                size: d
                            }), C().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (p) {
                        b.as;
                        var h = e7(b, ["as"]),
                            O = C().Children.only(n);
                        return C().createElement(e8, e6(e4({
                            ref: t
                        }, h), {
                            className: y,
                            style: g,
                            "aria-disabled": i || void 0
                        }), C().cloneElement(O, {}, v(O.props.children)))
                    }
                    if ("a" === b.as) {
                        b.as;
                        var j = b.href,
                            w = e7(b, ["as", "href"]);
                        return C().createElement("a", e6(e4({
                            ref: t
                        }, w), {
                            "aria-disabled": i,
                            href: i ? void 0 : j,
                            className: y,
                            style: g
                        }), v(n))
                    }
                    b.as;
                    var x = e7(b, ["as"]);
                    return C().createElement("button", e6(e4({
                        ref: t,
                        type: "button"
                    }, x), {
                        disabled: i,
                        className: y,
                        style: g
                    }), v(n))
                }),
                ta = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                to = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                ti = function(e) {
                    var t = e.variant,
                        n = e.size,
                        r = e.isCircular,
                        a = e.className,
                        o = function(e, t) {
                            if (null == e) return {};
                            var n, r, a = function(e, t) {
                                if (null == e) return {};
                                var n, r, a = {},
                                    o = Object.keys(e);
                                for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                return a
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                            }
                            return a
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return C().createElement("button", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        type: "button",
                        className: P("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", eF, to[t], ta[n], r && "radius-circle", a)
                    }, o), C().createElement(eB, null), C().createElement(eU, {
                        name: "icon-regular-x",
                        size: n
                    }))
                };

            function tl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tc(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }
            var ts = (0, k.forwardRef)(function(e, t) {
                    var n, r, a, o = e.title,
                        i = e.icon,
                        l = e.actionLabel,
                        c = e.onAction,
                        s = e.actions,
                        u = e.onClose,
                        d = e.closeIconAriaLabel,
                        f = e.shouldAutoDismiss,
                        m = e.autoDismissDurationMs,
                        p = e.className,
                        b = function(e, t) {
                            if (null == e) return {};
                            var n, r, a = function(e, t) {
                                if (null == e) return {};
                                var n, r, a = {},
                                    o = Object.keys(e);
                                for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                return a
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                            }
                            return a
                        }(e, ["title", "icon", "actionLabel", "onAction", "actions", "onClose", "closeIconAriaLabel", "shouldAutoDismiss", "autoDismissDurationMs", "className"]),
                        y = (n = (0, k.useState)("enter"), function(e) {
                            if (Array.isArray(e)) return e
                        }(n) || function(e, t) {
                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    i = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                } catch (e) {
                                    l = !0, r = e
                                } finally {
                                    try {
                                        i || null == a.return || a.return()
                                    } finally {
                                        if (l) throw r
                                    }
                                }
                                return o
                            }
                        }(n, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return tl(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tl(e, t)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        g = y[0],
                        v = y[1],
                        h = (0, k.useRef)(void 0),
                        O = (0, k.useRef)(void 0),
                        j = (0, k.useRef)(void 0),
                        w = (0, k.useRef)(null),
                        x = null != s ? s : l && c && C().createElement(tr, {
                            size: "Small",
                            variant: "Utility",
                            className: "content-inverse-emphasis",
                            onClick: c,
                            ref: w
                        }, l),
                        S = !!x,
                        N = o.length > 80,
                        I = null == f || f,
                        A = 4e3;
                    S && (A = N ? 1e4 : 7e3);
                    var E = null != m ? m : A,
                        M = (0, k.useCallback)(function() {
                            "exit" !== g && (v("exit"), void 0 !== O.current && (window.clearTimeout(O.current), O.current = void 0), j.current = window.setTimeout(function() {
                                null == u || u()
                            }, 150))
                        }, [u, g]);
                    (0, k.useEffect)(function() {
                        return h.current = window.requestAnimationFrame(function() {
                                v("idle")
                            }),
                            function() {
                                void 0 !== h.current && window.cancelAnimationFrame(h.current)
                            }
                    }, []), (0, k.useEffect)(function() {
                        void 0 !== O.current && (window.clearTimeout(O.current), O.current = void 0), I && "exit" !== g && (O.current = window.setTimeout(function() {
                            M()
                        }, E))
                    }, [E, I, g, M]), (0, k.useEffect)(function() {
                        var e;
                        S && (null == (e = w.current) || e.focus())
                    }, [S]), (0, k.useEffect)(function() {
                        return function() {
                            void 0 !== O.current && window.clearTimeout(O.current), void 0 !== j.current && window.clearTimeout(j.current), void 0 !== h.current && window.cancelAnimationFrame(h.current)
                        }
                    }, []);
                    var D = {
                            position: "fixed",
                            left: "50%",
                            bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                            transform: "translate(-50%, ".concat("idle" === g ? "0" : "120%", ")"),
                            zIndex: "var(--foundation-portal-zindex, 9999)"
                        },
                        T = b.style ? tc({}, D, b.style) : D;
                    return C().createElement("div", tc({
                        ref: t,
                        role: "status",
                        "aria-live": "polite",
                        className: P("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === g ? "ease-standard-in" : "ease-standard-out", p),
                        style: (r = tc({}, T), a = a = {
                            transitionDuration: "".concat("exit" === g ? 150 : 200, "ms"),
                            transitionProperty: "transform"
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(a)) : (function(e, t) {
                            var n = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                n.push.apply(n, r)
                            }
                            return n
                        })(Object(a)).forEach(function(e) {
                            Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(a, e))
                        }), r)
                    }, b), C().createElement("div", {
                        className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
                    }, i && C().createElement(eU, {
                        name: i,
                        size: "Small",
                        className: "shrink-0 content-inverse-emphasis"
                    }), C().createElement("div", {
                        className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
                    }, o)), C().createElement("div", {
                        className: "flex items-center justify-end gap-small shrink-0"
                    }, x, u && C().createElement(ti, {
                        variant: "Utility",
                        size: "Small",
                        isCircular: !0,
                        className: "content-inverse-emphasis",
                        "aria-label": void 0 === d ? "Dismiss snackbar" : d,
                        onClick: M
                    })))
                }),
                tu = function(e) {
                    var t = e.feedback,
                        n = e.onClose;
                    return t ? (0, j.jsx)(ts, {
                        title: t.message,
                        onClose: n,
                        shouldAutoDismiss: !0
                    }) : null
                },
                td = 0,
                tf = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, k.useRef)();
                    return t.current || (td += 1, t.current = "".concat(e).concat(td)), t.current
                };

            function tm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tp(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function tb(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        tp(e, t, n[t])
                    })
                }
                return e
            }

            function ty(e) {
                return function(e) {
                    if (Array.isArray(e)) return tm(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tm(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tm(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tg(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    n = [],
                    r = function() {
                        var t = n.map(function(e) {
                            return k.createContext(e)
                        });
                        return function(n) {
                            var r = (null == n ? void 0 : n[e]) || t;
                            return k.useMemo(function() {
                                var t, a;
                                return tp({}, "__scope".concat(e), (t = tb({}, n), a = null != (a = tp({}, e, r)) ? a : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(a)) : (function(e, t) {
                                    var n = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        n.push.apply(n, r)
                                    }
                                    return n
                                })(Object(a)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(a, e))
                                }), t))
                            }, [n, r])
                        }
                    };
                return r.scopeName = e, [function(t, r) {
                    var a = k.createContext(r),
                        o = n.length;
                    n = ty(n).concat([r]);
                    var i = function(t) {
                        var n, r = t.scope,
                            i = t.children,
                            l = function(e, t) {
                                if (null == e) return {};
                                var n, r, a = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, a = {},
                                        o = Object.keys(e);
                                    for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                    return a
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var o = Object.getOwnPropertySymbols(e);
                                    for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                                }
                                return a
                            }(t, ["scope", "children"]),
                            c = (null == r || null == (n = r[e]) ? void 0 : n[o]) || a,
                            s = k.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, j.jsx)(c.Provider, {
                            value: s,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(n, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[o]) || a,
                            s = k.useContext(c);
                        if (s) return s;
                        if (void 0 !== r) return r;
                        throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                    }]
                }, tv.apply(void 0, [r].concat(ty(t)))]
            }

            function tv() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t[0];
                if (1 === t.length) return r;
                var a = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var n = e.reduce(function(e, n) {
                            var r = n.useScope,
                                a = n.scopeName;
                            return tb({}, e, r(t)["__scope".concat(a)])
                        }, {});
                        return k.useMemo(function() {
                            return tp({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return a.scopeName = r.scopeName, a
            }

            function th(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    a = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === a || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }
            "undefined" != typeof window && window.document && window.document.createElement;
            var tO = (null == (h = globalThis) ? void 0 : h.document) ? k.useLayoutEffect : function() {};

            function tj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tw(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tj(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tj(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tx = k[" useInsertionEffect ".trim().toString()] || tO;

            function tS(e) {
                var t, n, r, a, o, i, l, c, s = e.prop,
                    u = e.defaultProp,
                    d = e.onChange,
                    f = e.caller,
                    m = tw((n = (t = {
                        defaultProp: u,
                        onChange: void 0 === d ? function() {} : d
                    }).defaultProp, r = t.onChange, o = (a = tw(k.useState(n), 2))[0], i = a[1], l = k.useRef(o), c = k.useRef(r), tx(function() {
                        c.current = r
                    }, [r]), k.useEffect(function() {
                        if (l.current !== o) {
                            var e;
                            null == (e = c.current) || e.call(c, o), l.current = o
                        }
                    }, [o, l]), [o, i, c]), 3),
                    p = m[0],
                    b = m[1],
                    y = m[2],
                    g = void 0 !== s,
                    v = g ? s : p,
                    h = k.useRef(void 0 !== s);
                return k.useEffect(function() {
                    var e = h.current;
                    if (e !== g) {
                        var t = g ? "controlled" : "uncontrolled";
                        console.warn("".concat(f, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                    }
                    h.current = g
                }, [g, f]), [v, k.useCallback(function(e) {
                    if (g) {
                        var t, n = "function" == typeof e ? e(s) : e;
                        n !== s && (null == (t = y.current) || t.call(y, n))
                    } else b(e)
                }, [g, s, b, y])]
            }

            function tP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tk(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tC(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tk(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tk(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            Symbol("RADIX:SYNC_STATE");
            var tN = function(e) {
                var t, n, r, a, o, i, l, c, s, u, d, f, m, p, b, y, g, v = e.present,
                    h = e.children,
                    O = (t = v, o = (a = tC(k.useState(), 2))[0], i = a[1], l = k.useRef(null), c = k.useRef(t), s = k.useRef("none"), d = (u = tC((n = t ? "mounted" : "unmounted", r = {
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
                    }, k.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], f = u[1], k.useEffect(function() {
                        var e = tI(l.current);
                        s.current = "mounted" === d ? e : "none"
                    }, [d]), tO(function() {
                        var e = l.current,
                            n = c.current;
                        if (n !== t) {
                            var r = s.current,
                                a = tI(e);
                            t ? f("MOUNT") : "none" === a || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : n && r !== a ? f("ANIMATION_OUT") : f("UNMOUNT"), c.current = t
                        }
                    }, [t, f]), tO(function() {
                        if (o) {
                            var e, t, n = null != (t = o.ownerDocument.defaultView) ? t : window,
                                r = function(t) {
                                    var r = tI(l.current).includes(CSS.escape(t.animationName));
                                    if (t.target === o && r && (f("ANIMATION_END"), !c.current)) {
                                        var a = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", e = n.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = a)
                                        })
                                    }
                                },
                                a = function(e) {
                                    e.target === o && (s.current = tI(l.current))
                                };
                            return o.addEventListener("animationstart", a), o.addEventListener("animationcancel", r), o.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(e), o.removeEventListener("animationstart", a), o.removeEventListener("animationcancel", r), o.removeEventListener("animationend", r)
                                }
                        }
                        f("ANIMATION_END")
                    }, [o, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: k.useCallback(function(e) {
                            l.current = e ? getComputedStyle(e) : null, i(e)
                        }, [])
                    }),
                    j = "function" == typeof h ? h({
                        present: O.isPresent
                    }) : k.Children.only(h),
                    w = eq(O.ref, (g = (y = null == (p = Object.getOwnPropertyDescriptor((m = j).props, "ref")) ? void 0 : p.get) && "isReactWarning" in y && y.isReactWarning) ? m.ref : (g = (y = null == (b = Object.getOwnPropertyDescriptor(m, "ref")) ? void 0 : b.get) && "isReactWarning" in y && y.isReactWarning) ? m.props.ref : m.props.ref || m.ref);
                return "function" == typeof h || O.isPresent ? k.cloneElement(j, {
                    ref: w
                }) : null
            };

            function tI(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function tA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tE(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function tM(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function tD(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        o = Object.keys(e);
                    for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }

            function tT(e) {
                return function(e) {
                    if (Array.isArray(e)) return tA(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tA(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tA(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tR(e) {
                var t, n, r = (t = e, (n = k.forwardRef(function(e, t) {
                        var n = e.children,
                            r = tD(e, ["children"]);
                        if (k.isValidElement(n)) {
                            var a, o, i, l, c, s = (c = (l = null == (o = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? a.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                                u = function(e, t) {
                                    var n = tE({}, t);
                                    for (var r in t) ! function(r) {
                                        var a = e[r],
                                            o = t[r];
                                        /^on[A-Z]/.test(r) ? a && o ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            var r = o.apply(void 0, tT(t));
                                            return a.apply(void 0, tT(t)), r
                                        } : a && (n[r] = a) : "style" === r ? n[r] = tE({}, a, o) : "className" === r && (n[r] = [a, o].filter(Boolean).join(" "))
                                    }(r);
                                    return tE({}, e, n)
                                }(r, n.props);
                            return n.type !== k.Fragment && (u.ref = t ? e$(t, s) : s), k.cloneElement(n, u)
                        }
                        return k.Children.count(n) > 1 ? k.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    a = k.forwardRef(function(e, t) {
                        var n = e.children,
                            a = tD(e, ["children"]),
                            o = k.Children.toArray(n),
                            i = o.find(t_);
                        if (i) {
                            var l = i.props.children,
                                c = o.map(function(e) {
                                    return e !== i ? e : k.Children.count(l) > 1 ? k.Children.only(null) : k.isValidElement(l) ? l.props.children : null
                                });
                            return (0, j.jsx)(r, tM(tE({}, a), {
                                ref: t,
                                children: k.isValidElement(l) ? k.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, j.jsx)(r, tM(tE({}, a), {
                            ref: t,
                            children: n
                        }))
                    });
                return a.displayName = "".concat(e, ".Slot"), a
            }
            tN.displayName = "Presence", window.ReactDOM;
            var tz = Symbol("radix.slottable");

            function t_(e) {
                return k.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tz
            }

            function tL(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function tU(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        tL(e, t, n[t])
                    })
                }
                return e
            }

            function tF(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }
            var tB = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var n = tR("Primitive.".concat(t)),
                    r = k.forwardRef(function(e, r) {
                        var a = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var n, r, a = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, a = {},
                                        o = Object.keys(e);
                                    for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                    return a
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var o = Object.getOwnPropertySymbols(e);
                                    for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                                }
                                return a
                            }(e, ["asChild"]),
                            i = a ? n : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, j.jsx)(i, tF(tU({}, o), {
                            ref: r
                        }))
                    });
                return r.displayName = "Primitive.".concat(t), tF(tU({}, e), tL({}, t, r))
            }, {});

            function tW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tV(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function tX(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function tH(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        o = Object.keys(e);
                    for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }

            function t$(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tW(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tW(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tq = "Checkbox",
                tZ = t$(tg(tq), 2),
                tG = tZ[0];
            tZ[1];
            var tK = t$(tG(tq), 2),
                tY = tK[0],
                tJ = tK[1];

            function tQ(e) {
                var t = e.__scopeCheckbox,
                    n = e.checked,
                    r = e.children,
                    a = e.defaultChecked,
                    o = e.disabled,
                    i = e.form,
                    l = e.name,
                    c = e.onCheckedChange,
                    s = e.required,
                    u = e.value,
                    d = e.internal_do_not_use_render,
                    f = t$(tS({
                        prop: n,
                        defaultProp: null != a && a,
                        onChange: c,
                        caller: tq
                    }), 2),
                    m = f[0],
                    p = f[1],
                    b = t$(k.useState(null), 2),
                    y = b[0],
                    g = b[1],
                    v = t$(k.useState(null), 2),
                    h = v[0],
                    O = v[1],
                    w = k.useRef(!1),
                    x = !y || !!i || !!y.closest("form"),
                    S = {
                        checked: m,
                        disabled: o,
                        setChecked: p,
                        control: y,
                        setControl: g,
                        name: l,
                        form: i,
                        value: void 0 === u ? "on" : u,
                        hasConsumerStoppedPropagationRef: w,
                        required: s,
                        defaultChecked: !t6(a) && a,
                        isFormControl: x,
                        bubbleInput: h,
                        setBubbleInput: O
                    };
                return (0, j.jsx)(tY, tX(tV({
                    scope: t
                }, S), {
                    children: "function" == typeof d ? d(S) : r
                }))
            }
            var t0 = "CheckboxTrigger",
                t1 = k.forwardRef(function(e, t) {
                    var n = e.__scopeCheckbox,
                        r = e.onKeyDown,
                        a = e.onClick,
                        o = tH(e, ["__scopeCheckbox", "onKeyDown", "onClick"]),
                        i = tJ(t0, n),
                        l = i.control,
                        c = i.value,
                        s = i.disabled,
                        u = i.checked,
                        d = i.required,
                        f = i.setControl,
                        m = i.setChecked,
                        p = i.hasConsumerStoppedPropagationRef,
                        b = i.isFormControl,
                        y = i.bubbleInput,
                        g = eq(t, f),
                        v = k.useRef(u);
                    return k.useEffect(function() {
                        var e = null == l ? void 0 : l.form;
                        if (e) {
                            var t = function() {
                                return m(v.current)
                            };
                            return e.addEventListener("reset", t),
                                function() {
                                    return e.removeEventListener("reset", t)
                                }
                        }
                    }, [l, m]), (0, j.jsx)(tB.button, tX(tV({
                        type: "button",
                        role: "checkbox",
                        "aria-checked": t6(u) ? "mixed" : u,
                        "aria-required": d,
                        "data-state": t7(u),
                        "data-disabled": s ? "" : void 0,
                        disabled: s,
                        value: c
                    }, o), {
                        ref: g,
                        onKeyDown: th(r, function(e) {
                            "Enter" === e.key && e.preventDefault()
                        }),
                        onClick: th(a, function(e) {
                            m(function(e) {
                                return !!t6(e) || !e
                            }), y && b && (p.current = e.isPropagationStopped(), p.current || e.stopPropagation())
                        })
                    }))
                });
            t1.displayName = t0;
            var t2 = k.forwardRef(function(e, t) {
                var n = e.__scopeCheckbox,
                    r = e.name,
                    a = e.checked,
                    o = e.defaultChecked,
                    i = e.required,
                    l = e.disabled,
                    c = e.value,
                    s = e.onCheckedChange,
                    u = e.form,
                    d = tH(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]);
                return (0, j.jsx)(tQ, {
                    __scopeCheckbox: n,
                    checked: a,
                    defaultChecked: o,
                    disabled: l,
                    required: i,
                    onCheckedChange: s,
                    name: r,
                    form: u,
                    value: c,
                    internal_do_not_use_render: function(e) {
                        var r = e.isFormControl;
                        return (0, j.jsxs)(j.Fragment, {
                            children: [(0, j.jsx)(t1, tX(tV({}, d), {
                                ref: t,
                                __scopeCheckbox: n
                            })), r && (0, j.jsx)(t4, {
                                __scopeCheckbox: n
                            })]
                        })
                    }
                })
            });
            t2.displayName = tq;
            var t8 = "CheckboxIndicator",
                t5 = k.forwardRef(function(e, t) {
                    var n = e.__scopeCheckbox,
                        r = e.forceMount,
                        a = tH(e, ["__scopeCheckbox", "forceMount"]),
                        o = tJ(t8, n);
                    return (0, j.jsx)(tN, {
                        present: r || t6(o.checked) || !0 === o.checked,
                        children: (0, j.jsx)(tB.span, tX(tV({
                            "data-state": t7(o.checked),
                            "data-disabled": o.disabled ? "" : void 0
                        }, a), {
                            ref: t,
                            style: tV({
                                pointerEvents: "none"
                            }, e.style)
                        }))
                    })
                });
            t5.displayName = t8;
            var t3 = "CheckboxBubbleInput",
                t4 = k.forwardRef(function(e, t) {
                    var n, r, a, o, i, l = e.__scopeCheckbox,
                        c = tH(e, ["__scopeCheckbox"]),
                        s = tJ(t3, l),
                        u = s.control,
                        d = s.hasConsumerStoppedPropagationRef,
                        f = s.checked,
                        m = s.defaultChecked,
                        p = s.required,
                        b = s.disabled,
                        y = s.name,
                        g = s.value,
                        v = s.form,
                        h = s.bubbleInput,
                        O = eq(t, s.setBubbleInput),
                        w = (n = k.useRef({
                            value: f,
                            previous: f
                        }), k.useMemo(function() {
                            return n.current.value !== f && (n.current.previous = n.current.value, n.current.value = f), n.current.previous
                        }, [f])),
                        x = (o = (r = k.useState(void 0), a = function(e) {
                            if (Array.isArray(e)) return e
                        }(r) || function(e, t) {
                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    i = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                } catch (e) {
                                    l = !0, r = e
                                } finally {
                                    try {
                                        i || null == a.return || a.return()
                                    } finally {
                                        if (l) throw r
                                    }
                                }
                                return o
                            }
                        }(r, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return tP(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tP(e, t)
                            }
                        }(r, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = a[1], tO(function() {
                            if (u) {
                                i({
                                    width: u.offsetWidth,
                                    height: u.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, n, r = e[0];
                                        if ("borderBoxSize" in r) {
                                            var a = r.borderBoxSize,
                                                o = Array.isArray(a) ? a[0] : a;
                                            t = o.inlineSize, n = o.blockSize
                                        } else t = u.offsetWidth, n = u.offsetHeight;
                                        i({
                                            width: t,
                                            height: n
                                        })
                                    }
                                });
                                return e.observe(u, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(u)
                                    }
                            }
                            i(void 0)
                        }, [u]), o);
                    k.useEffect(function() {
                        if (h) {
                            var e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                                t = !d.current;
                            if (w !== f && e) {
                                var n = new Event("click", {
                                    bubbles: t
                                });
                                h.indeterminate = t6(f), e.call(h, !t6(f) && f), h.dispatchEvent(n)
                            }
                        }
                    }, [h, w, f, d]);
                    var S = k.useRef(!t6(f) && f);
                    return (0, j.jsx)(tB.input, tX(tV({
                        type: "checkbox",
                        "aria-hidden": !0,
                        defaultChecked: null != m ? m : S.current,
                        required: p,
                        disabled: b,
                        name: y,
                        value: g,
                        form: v
                    }, c), {
                        tabIndex: -1,
                        ref: O,
                        style: tX(tV({}, c.style, x), {
                            position: "absolute",
                            pointerEvents: "none",
                            opacity: 0,
                            margin: 0,
                            transform: "translateX(-100%)"
                        })
                    }))
                });

            function t6(e) {
                return "indeterminate" === e
            }

            function t7(e) {
                return t6(e) ? "indeterminate" : e ? "checked" : "unchecked"
            }
            t4.displayName = t3;
            var t9 = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                ne = {
                    XSmall: "",
                    Small: "",
                    Medium: "",
                    Large: "padding-y-xxsmall"
                },
                nt = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                nn = {
                    XSmall: "",
                    Small: "padding-top-xxsmall",
                    Medium: "padding-top-xxsmall",
                    Large: "padding-top-xxsmall"
                },
                nr = function(e) {
                    var t = e.label,
                        n = e.className,
                        r = e.isChecked,
                        a = e.isDisabled,
                        o = e.size,
                        i = e.hint,
                        l = e.placement,
                        c = e.onCheckedChange,
                        s = e.id,
                        u = function(e, t) {
                            if (null == e) return {};
                            var n, r, a = function(e, t) {
                                if (null == e) return {};
                                var n, r, a = {},
                                    o = Object.keys(e);
                                for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                return a
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                            }
                            return a
                        }(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]),
                        d = tf(),
                        f = s || d,
                        m = t && C().createElement("label", {
                            htmlFor: f,
                            className: P("flex flex-col grow-1 gap-xsmall", !a && "cursor-pointer")
                        }, C().createElement("span", {
                            className: P(nt[o], nn[o], "content-emphasis")
                        }, t), i && C().createElement("span", {
                            className: "text-body-medium content-default"
                        }, i));
                    return C().createElement("div", {
                        className: P("foundation-web-checkbox flex gap-medium", a && "opacity-[0.5]", !a && "cursor-pointer", n)
                    }, "End" === l && m, C().createElement("div", {
                        className: P(ne[o])
                    }, C().createElement(t2, function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        "data-slot": "checkbox",
                        className: P(t9[o], eF, !a && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                        id: f,
                        checked: r,
                        disabled: a,
                        onCheckedChange: c,
                        "aria-label": t
                    }, u), C().createElement(eB, null), C().createElement(t5, {
                        "data-slot": "checkbox-indicator",
                        className: P(t9[o], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
                    }))), "Start" === l && m)
                },
                na = function(e) {
                    var t = e.className,
                        n = e.children;
                    return (0, j.jsx)("div", {
                        className: t,
                        onClick: function(e) {
                            e.stopPropagation()
                        },
                        children: n
                    })
                };

            function no(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function ni(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function nl(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        o = Object.keys(e);
                    for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }
            var nc = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                ns = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                nu = {
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
                nd = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                nf = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                nm = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                np = {
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
                nb = {
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
                ny = (0, k.forwardRef)(function(e, t) {
                    var n, r = e.className,
                        a = e.icon,
                        o = e.ariaLabel,
                        i = e.isDisabled,
                        l = void 0 !== i && i,
                        c = e.isCircular,
                        s = e.isSelected,
                        u = e.size,
                        d = void 0 === u ? "Large" : u,
                        f = e.variant,
                        m = void 0 === f ? "Emphasis" : f,
                        p = e.iconColor,
                        b = void 0 === p ? "Default" : p,
                        y = e.asChild,
                        g = e.children,
                        v = nl(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]);
                    n = l ? nf[m] : void 0 !== s && s ? nm[m] : nd[m];
                    var h = P("foundation-web-icon-button", l ? eW : [eF, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", nc[d], nu[d][void 0 !== c && c ? "circular" : "square"], n, r),
                        O = C().createElement(C().Fragment, null, C().createElement(eB, null), C().createElement("span", {
                            className: P("icon", a, ns[d], l ? nb[b][m] : np[b][m])
                        }));
                    if (y) {
                        v.as;
                        var j = nl(v, ["as"]),
                            w = C().Children.only(g);
                        return C().createElement(e8, ni(no({
                            ref: t
                        }, j), {
                            className: h,
                            "aria-label": o,
                            "aria-disabled": l || void 0
                        }), C().cloneElement(w, {}, O))
                    }
                    if ("a" === v.as) {
                        v.as;
                        var x = v.href,
                            S = nl(v, ["as", "href"]);
                        return C().createElement("a", ni(no({
                            ref: t
                        }, S), {
                            "aria-label": o,
                            "aria-disabled": l,
                            href: l ? void 0 : x,
                            className: h
                        }), O)
                    }
                    v.as;
                    var k = nl(v, ["as"]);
                    return C().createElement("button", ni(no({
                        ref: t,
                        type: "button"
                    }, k), {
                        "aria-label": o,
                        disabled: l,
                        className: h
                    }), O)
                }),
                ng = function(e) {
                    var t = e.currentPage,
                        n = e.totalPages,
                        r = e.onChangePage,
                        a = (0, S.useTranslation)().translate;
                    return n <= 1 ? null : (0, j.jsxs)("div", {
                        className: "flex items-center gap-xsmall justify-end",
                        children: [(0, j.jsx)(ny, {
                            icon: "icon-filled-chevron-large-left-to-line",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: t <= 1,
                            ariaLabel: a("Action.FirstPage"),
                            onClick: function() {
                                r(1)
                            }
                        }), (0, j.jsx)(ny, {
                            icon: "icon-filled-chevron-large-left",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: t <= 1,
                            ariaLabel: a("Action.Previous"),
                            onClick: function() {
                                r(t - 1)
                            }
                        }), (0, j.jsxs)("span", {
                            className: "text-body-large content-muted padding-x-small",
                            children: [t, " / ", n]
                        }), (0, j.jsx)(ny, {
                            icon: "icon-filled-chevron-large-right",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: t >= n,
                            ariaLabel: a("Action.Next"),
                            onClick: function() {
                                r(t + 1)
                            }
                        }), (0, j.jsx)(ny, {
                            icon: "icon-filled-chevron-large-right-to-line",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: t >= n,
                            ariaLabel: a("Action.LastPage"),
                            onClick: function() {
                                r(n)
                            }
                        })]
                    })
                },
                nv = function(e) {
                    var t = e.activeTab,
                        n = e.moduleState,
                        r = e.selectedCount,
                        a = e.totalCount,
                        o = e.currentPage,
                        i = e.totalPages,
                        l = e.onToggleSelectAll,
                        c = e.onMarkArchive,
                        s = e.onMarkRead,
                        u = e.onBack,
                        d = e.onChangePage,
                        f = (0, S.useTranslation)().translate,
                        m = t === E,
                        p = t === T;
                    return t === M || t === D ? n === R ? (0, j.jsx)("div", {
                        className: "flex justify-end margin-y-medium",
                        children: (0, j.jsx)(ng, {
                            currentPage: o,
                            totalPages: i,
                            onChangePage: d
                        })
                    }) : (0, j.jsx)("div", {
                        className: "margin-y-medium",
                        children: (0, j.jsx)(tr, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: u,
                            children: f("Action.Back")
                        })
                    }) : n === z ? (0, j.jsxs)("div", {
                        className: "flex items-center gap-small margin-y-medium",
                        children: [(0, j.jsx)(tr, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: u,
                            children: f("Action.Back")
                        }), m ? (0, j.jsx)(tr, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                c(!0)
                            },
                            children: f("Action.Archive")
                        }) : null, p ? (0, j.jsx)(tr, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                c(!1)
                            },
                            children: f("Action.MoveToInbox")
                        }) : null]
                    }) : (0, j.jsxs)("div", {
                        className: "flex items-center justify-between gap-medium margin-y-medium wrap",
                        children: [(0, j.jsxs)("div", {
                            className: "flex items-center gap-small wrap",
                            children: [(0, j.jsx)(na, {
                                className: "padding-left-large",
                                children: (0, j.jsx)(nr, {
                                    label: f("Label.All"),
                                    size: "Medium",
                                    placement: "Start",
                                    isChecked: a > 0 && r === a,
                                    onCheckedChange: l
                                })
                            }), (0, j.jsxs)("div", {
                                className: "private-message-action-buttons flex items-center gap-small wrap",
                                children: [m ? (0, j.jsx)(tr, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        c(!0)
                                    },
                                    children: f("Action.Archive")
                                }) : null, p ? (0, j.jsx)(tr, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        c(!1)
                                    },
                                    children: f("Action.MoveToInbox")
                                }) : null, (0, j.jsx)(tr, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        s(!0)
                                    },
                                    children: f("Action.MarkAsRead")
                                }), (0, j.jsx)(tr, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        s(!1)
                                    },
                                    children: f("Action.MarkAsUnread")
                                })]
                            })]
                        }), (0, j.jsx)(ng, {
                            currentPage: o,
                            totalPages: i,
                            onChangePage: d
                        })]
                    })
                },
                nh = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                nO = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function nj(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var nw = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                nx = {
                    XSmall: "padding-y-small",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-small"
                },
                nS = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                nP = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                nk = C().forwardRef(function(e, t) {
                    var n = e.size,
                        r = e.variant,
                        a = void 0 === r ? "Standard" : r,
                        o = e.label,
                        i = e.value,
                        l = e.defaultValue,
                        c = e.isDisabled,
                        s = e.hasError,
                        u = e.helperText,
                        d = e.className,
                        f = e.style,
                        m = e.textareaClassName,
                        p = e.textareaStyle,
                        b = e.id,
                        y = function(e, t) {
                            if (null == e) return {};
                            var n, r, a = function(e, t) {
                                if (null == e) return {};
                                var n, r, a = {},
                                    o = Object.keys(e);
                                for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                return a
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                            }
                            return a
                        }(e, ["size", "variant", "label", "value", "defaultValue", "isDisabled", "hasError", "helperText", "className", "style", "textareaClassName", "textareaStyle", "id"]),
                        g = tf(),
                        v = b || g,
                        h = "".concat(v, "-description"),
                        O = null != n ? n : "Large";
                    return C().createElement("div", {
                        className: P("flex fill flex-col width-full gap-small", nj({}, eW, c), d),
                        style: f
                    }, o && C().createElement("label", {
                        htmlFor: v,
                        className: P(nS[O], "content-emphasis")
                    }, o), C().createElement("textarea", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                nj(e, t, n[t])
                            })
                        }
                        return e
                    }({
                        ref: t,
                        id: v,
                        "data-testid": "text-area-container",
                        style: p,
                        className: P("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", nh[a], nO[a], s ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", nP[O], nw[O], nx[O], m),
                        value: i,
                        defaultValue: null == i ? l : void 0,
                        disabled: c,
                        "aria-describedby": u ? h : void 0
                    }, y)), u && C().createElement("span", {
                        id: h,
                        className: P("text-caption-small", {
                            "content-system-alert": s,
                            "content-default": !s
                        })
                    }, u))
                });
            nk.displayName = "TextArea";
            var nC = window.RobloxBadges,
                nN = window.RobloxThumbnails,
                nI = n(942),
                nA = n.n(nI),
                nE = function(e) {
                    var t = e.className;
                    return (0, j.jsxs)("span", {
                        "aria-hidden": "true",
                        className: nA()("flex items-center justify-center", t),
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
                nM = function(e) {
                    var t = e.message,
                        n = e.activeTab,
                        r = n === M ? t.recipient : t.sender,
                        a = n !== M && 1 === t.sender.id;
                    return (0, j.jsx)("a", {
                        href: r.profileLink,
                        className: "size-800 shrink-0 flex items-center justify-center",
                        children: a ? (0, j.jsx)(nE, {
                            className: "size-800"
                        }) : (0, j.jsx)("span", {
                            className: "radius-small clip size-800",
                            children: (0, j.jsx)(nN.Thumbnail2d, {
                                targetId: r.id,
                                type: nN.ThumbnailTypes.avatarHeadshot,
                                altName: r.displayName
                            })
                        })
                    })
                },
                nD = function(e) {
                    var t = e.message,
                        n = e.activeTab,
                        r = e.sendReplyState,
                        a = e.onReplyContentChange,
                        o = e.onIncludePreviousMessageChange,
                        i = e.onSendReply,
                        l = (0, S.useTranslation)().translate;
                    if (!t) return null;
                    var c = n === M ? t.recipient : t.sender,
                        s = n === E && !t.isSystemMessage;
                    return (0, j.jsxs)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large",
                        children: [(0, j.jsxs)("div", {
                            className: "flex justify-between gap-medium",
                            children: [(0, j.jsxs)("div", {
                                className: "min-width-0",
                                children: [(0, j.jsx)("h2", {
                                    className: "text-heading-medium content-emphasis margin-none text-wrap",
                                    children: t.subject
                                }), (0, j.jsxs)("div", {
                                    className: "flex gap-small margin-top-medium",
                                    children: [(0, j.jsx)(nM, {
                                        message: t,
                                        activeTab: n
                                    }), (0, j.jsxs)("div", {
                                        className: "min-width-0 flex flex-col gap-y-small",
                                        children: [(0, j.jsxs)("a", {
                                            href: c.profileLink,
                                            className: "text-title-medium content-emphasis flex items-center gap-xsmall",
                                            children: [(0, j.jsx)("span", {
                                                children: c.displayName
                                            }), c.hasVerifiedBadge ? (0, j.jsx)(nC.VerifiedBadgeIconContainer, {
                                                size: nC.BadgeSizes.CAPTIONHEADER
                                            }) : null]
                                        }), (0, j.jsxs)("div", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", c.name]
                                        }), (0, j.jsx)("div", {
                                            className: "text-caption-medium content-muted",
                                            children: Q(t.created)
                                        })]
                                    })]
                                })]
                            }), t.isReportAbuseDisplayed ? (0, j.jsx)("a", {
                                href: t.abuseReportUrl,
                                className: "text-body-medium content-muted text-no-wrap abuse-report-modal",
                                children: l("Action.ReportAbuse")
                            }) : null]
                        }), (0, j.jsx)("div", {
                            className: "private-message-body text-body-large content-default margin-top-large",
                            dangerouslySetInnerHTML: {
                                __html: t.body
                            }
                        }), s ? (0, j.jsxs)("div", {
                            className: "margin-top-large",
                            children: [(0, j.jsx)(nk, {
                                size: "Medium",
                                label: l("Message.ReplyHere"),
                                placeholder: l("Message.ReplyHere"),
                                value: r.replyContent,
                                onChange: function(e) {
                                    a(e.target.value)
                                },
                                textareaStyle: {
                                    resize: "vertical",
                                    minHeight: 120
                                }
                            }), (0, j.jsxs)("div", {
                                className: "flex items-center justify-between gap-medium wrap margin-top-medium",
                                children: [(0, j.jsx)("span", {
                                    className: "text-caption-medium content-muted",
                                    children: l("Message.IdTheftWarning")
                                }), (0, j.jsxs)("div", {
                                    className: "flex items-center gap-medium wrap",
                                    children: [(0, j.jsx)(na, {
                                        children: (0, j.jsx)(nr, {
                                            label: l("Label.IncludeMessage"),
                                            size: "Medium",
                                            placement: "End",
                                            isChecked: r.includePreviousMessage,
                                            onCheckedChange: function(e) {
                                                o(!0 === e)
                                            }
                                        })
                                    }), (0, j.jsx)(tr, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        isDisabled: 0 === r.replyContent.length || r.isSending,
                                        isLoading: r.isSending,
                                        onClick: i,
                                        children: l("Action.SendReply")
                                    })]
                                })]
                            })]
                        }) : null]
                    })
                },
                nT = function(e) {
                    var t = e.message,
                        n = e.activeTab === M ? t.recipient : t.sender;
                    return (0, j.jsxs)("span", {
                        className: "flex items-center gap-xsmall min-width-0",
                        children: [(0, j.jsx)("span", {
                            className: "text-truncate-end",
                            children: n.displayName
                        }), n.hasVerifiedBadge ? (0, j.jsx)(nC.VerifiedBadgeIconContainer, {
                            size: nC.BadgeSizes.CAPTIONHEADER
                        }) : null, (0, j.jsxs)("span", {
                            className: "text-body-medium content-muted text-truncate-end",
                            children: ["@", n.name]
                        })]
                    })
                },
                nR = function(e) {
                    var t = e.message,
                        n = e.activeTab,
                        r = e.onOpen,
                        a = n === M ? t.recipient : t.sender,
                        o = n !== M && 1 === t.sender.id;
                    return (0, j.jsx)("button", {
                        type: "button",
                        className: "private-message-row-avatar bg-none stroke-none padding-none width-full size-800 flex items-center justify-center",
                        onClick: r,
                        "aria-label": a.displayName,
                        children: o ? (0, j.jsx)(nE, {
                            className: "size-700"
                        }) : (0, j.jsx)("span", {
                            className: "radius-small clip size-700",
                            children: (0, j.jsx)(nN.Thumbnail2d, {
                                targetId: a.id,
                                type: nN.ThumbnailTypes.avatarHeadshot,
                                altName: a.displayName
                            })
                        })
                    })
                },
                nz = function(e) {
                    var t = e.message,
                        n = e.index,
                        r = e.activeTab,
                        a = e.isSelected,
                        o = e.isSelectable,
                        i = e.onToggleSelection,
                        l = e.onOpen,
                        c = function() {
                            l(t, n)
                        };
                    return (0, j.jsxs)("div", {
                        className: nA()("private-message-row grid items-center gap-medium padding-large stroke-bottom stroke-muted transition-colors", t.isRead || r === M ? "bg-surface-100 hover:bg-surface-300" : "bg-surface-200 hover:bg-surface-300"),
                        children: [(0, j.jsx)(na, {
                            className: nA()(!o && "invisible"),
                            children: (0, j.jsx)(nr, {
                                "aria-label": t.subject,
                                size: "Medium",
                                placement: "Start",
                                isChecked: a,
                                onCheckedChange: function() {
                                    i(t.id)
                                }
                            })
                        }), (0, j.jsx)(nR, {
                            message: t,
                            activeTab: r,
                            onOpen: c
                        }), (0, j.jsxs)("button", {
                            type: "button",
                            className: "bg-none stroke-none padding-none text-left min-width-0 flex flex-col gap-y-small",
                            onClick: c,
                            "aria-label": t.subject,
                            children: [(0, j.jsxs)("div", {
                                className: "flex items-center justify-between gap-small min-width-0",
                                children: [(0, j.jsx)("span", {
                                    className: "text-title-large content-emphasis min-width-0",
                                    children: (0, j.jsx)(nT, {
                                        message: t,
                                        activeTab: r
                                    })
                                }), (0, j.jsx)("span", {
                                    className: "text-caption-medium content-muted text-no-wrap",
                                    children: J(t.created)
                                })]
                            }), (0, j.jsxs)("div", {
                                className: "private-message-row-preview text-body-large content-muted",
                                children: [(0, j.jsx)("span", {
                                    className: "content-emphasis",
                                    children: t.subject
                                }), (0, j.jsxs)("span", {
                                    children: [" - ", K(t.body)]
                                })]
                            })]
                        })]
                    })
                };

            function n_(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var nL = (n_(O = {}, E, "Label.NoMessagesInInbox"), n_(O, M, "Label.NoSentMessages"), n_(O, D, "Message.NoNews"), n_(O, T, "Label.NoMessagesInArchive"), O),
                nU = function(e) {
                    var t, n = e.page,
                        r = e.activeTab,
                        a = e.selectedMessageIds,
                        o = e.onToggleSelection,
                        i = e.onOpenMessage,
                        l = (0, S.useTranslation)().translate,
                        c = null != (t = null == n ? void 0 : n.collection) ? t : [];
                    return 0 === c.length ? (0, j.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: l(nL[r])
                    }) : (0, j.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: c.map(function(e, t) {
                            return (0, j.jsx)(nz, {
                                message: e,
                                index: t,
                                activeTab: r,
                                isSelected: a.has(e.id),
                                isSelectable: r !== M && r !== D,
                                onToggleSelection: o,
                                onOpen: i
                            }, e.id)
                        })
                    })
                };

            function nF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var nB = function(e) {
                    var t, n = e.notification,
                        r = (t = (0, k.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    i = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                } catch (e) {
                                    l = !0, r = e
                                } finally {
                                    try {
                                        i || null == a.return || a.return()
                                    } finally {
                                        if (l) throw r
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return nF(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nF(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        a = r[0],
                        o = r[1],
                        i = 1 === n.sender.id;
                    return (0, j.jsx)("button", {
                        type: "button",
                        className: nA()("width-full stroke-none stroke-bottom stroke-muted padding-medium text-left transition-colors", a ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        onClick: function() {
                            o(function(e) {
                                return !e
                            })
                        },
                        "aria-expanded": a,
                        "aria-label": n.subject,
                        children: (0, j.jsxs)("div", {
                            className: "flex gap-small",
                            children: [(0, j.jsx)("span", {
                                className: "size-700 shrink-0 flex items-center justify-center",
                                children: i ? (0, j.jsx)(nE, {
                                    className: "size-700"
                                }) : (0, j.jsx)("span", {
                                    className: "radius-small clip size-700",
                                    children: (0, j.jsx)(nN.Thumbnail2d, {
                                        targetId: n.sender.id,
                                        type: nN.ThumbnailTypes.avatarHeadshot,
                                        altName: n.sender.displayName
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
                                            children: n.sender.displayName
                                        }), n.sender.hasVerifiedBadge ? (0, j.jsx)(nC.VerifiedBadgeIconContainer, {
                                            size: nC.BadgeSizes.CAPTIONHEADER
                                        }) : null, (0, j.jsxs)("span", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", n.sender.name]
                                        })]
                                    }), (0, j.jsx)("span", {
                                        className: "text-caption-medium content-muted text-no-wrap",
                                        children: J(n.created)
                                    })]
                                }), (0, j.jsx)("span", {
                                    className: "private-message-row-preview text-body-large content-default",
                                    children: n.subject
                                }), a ? (0, j.jsx)("span", {
                                    className: "private-message-body block text-body-medium content-default margin-top-medium",
                                    dangerouslySetInnerHTML: {
                                        __html: n.body
                                    }
                                }) : null]
                            })]
                        })
                    })
                },
                nW = function(e) {
                    var t, n = e.page,
                        r = (0, S.useTranslation)().translate,
                        a = null != (t = null == n ? void 0 : n.collection) ? t : [];
                    return 0 === a.length ? (0, j.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: r("Message.NoNews")
                    }) : (0, j.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: a.map(function(e) {
                            return (0, j.jsx)(nB, {
                                notification: e
                            }, e.id)
                        })
                    })
                };

            function nV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function nX(e, t, n) {
                return (nX = nY() ? Reflect.construct : function(e, t, n) {
                    var r = [null];
                    r.push.apply(r, t);
                    var a = new(Function.bind.apply(e, r));
                    return n && nZ(a, n.prototype), a
                }).apply(null, arguments)
            }

            function nH(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function n$(e) {
                return (n$ = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function nq(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        nH(e, t, n[t])
                    })
                }
                return e
            }

            function nZ(e, t) {
                return (nZ = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function nG(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nV(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nV(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nK(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (nK = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, n)
                    }

                    function n() {
                        return nX(e, arguments, n$(this).constructor)
                    }
                    return n.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: n,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), nZ(n, e)
                })(e)
            }

            function nY() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (nY = function() {
                    return !!e
                })()
            }

            function nJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            nK(Map);
            var nQ = k[" useId ".trim().toString()] || function() {},
                n0 = 0;

            function n1(e) {
                var t, n = (t = k.useState(nQ()), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != a) {
                            var o = [],
                                i = !0,
                                l = !1;
                            try {
                                for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                            } catch (e) {
                                l = !0, r = e
                            } finally {
                                try {
                                    i || null == a.return || a.return()
                                } finally {
                                    if (l) throw r
                                }
                            }
                            return o
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return nJ(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nJ(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    r = n[0],
                    a = n[1];
                return tO(function() {
                    e || a(function(e) {
                        return null != e ? e : String(n0++)
                    })
                }, [e]), e || (r ? "radix-".concat(r) : "")
            }

            function n2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var n8 = k.createContext(void 0);

            function n5(e) {
                var t = k.useContext(n8);
                return e || t || "ltr"
            }

            function n3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function n4(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function n6(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function n7(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        o = Object.keys(e);
                    for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }

            function n9(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || re(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function re(e, t) {
                if (e) {
                    if ("string" == typeof e) return n3(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return n3(e, t)
                }
            }
            var rt = "rovingFocusGroup.onEntryFocus",
                rn = {
                    bubbles: !1,
                    cancelable: !0
                },
                rr = "RovingFocusGroup",
                ra = n9((i = (o = nG(tg(a = rr + "CollectionProvider"), 2))[0], l = o[1], s = (c = nG(i(a, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], u = c[1], (d = function(e) {
                    var t = e.scope,
                        n = e.children,
                        r = C().useRef(null),
                        a = C().useRef(new Map).current;
                    return (0, j.jsx)(s, {
                        scope: t,
                        itemMap: a,
                        collectionRef: r,
                        children: n
                    })
                }).displayName = a, m = tR(f = rr + "CollectionSlot"), (p = C().forwardRef(function(e, t) {
                    var n = e.scope,
                        r = e.children,
                        a = eq(t, u(f, n).collectionRef);
                    return (0, j.jsx)(m, {
                        ref: a,
                        children: r
                    })
                })).displayName = f, y = "data-radix-collection-item", g = tR(b = rr + "CollectionItemSlot"), (v = C().forwardRef(function(e, t) {
                    var n, r, a = e.scope,
                        o = e.children,
                        i = function(e, t) {
                            if (null == e) return {};
                            var n, r, a = function(e, t) {
                                if (null == e) return {};
                                var n, r, a = {},
                                    o = Object.keys(e);
                                for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                return a
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                            }
                            return a
                        }(e, ["scope", "children"]),
                        l = C().useRef(null),
                        c = eq(t, l),
                        s = u(b, a);
                    return C().useEffect(function() {
                        return s.itemMap.set(l, nq({
                                ref: l
                            }, i)),
                            function() {
                                s.itemMap.delete(l)
                            }
                    }), (0, j.jsx)(g, (n = nq({}, nH({}, y, "")), r = r = {
                        ref: c,
                        children: o
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                    }), n))
                })).displayName = b, [{
                    Provider: d,
                    Slot: p,
                    ItemSlot: v
                }, function(e) {
                    var t = u(rr + "CollectionConsumer", e);
                    return C().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var n = Array.from(e.querySelectorAll("[".concat(y, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return n.indexOf(e.ref.current) - n.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, l]), 3),
                ro = ra[0],
                ri = ra[1],
                rl = n9(tg(rr, [ra[2]]), 2),
                rc = rl[0],
                rs = rl[1],
                ru = n9(rc(rr), 2),
                rd = ru[0],
                rf = ru[1],
                rm = k.forwardRef(function(e, t) {
                    return (0, j.jsx)(ro.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, j.jsx)(ro.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, j.jsx)(rp, n6(n4({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            rm.displayName = rr;
            var rp = k.forwardRef(function(e, t) {
                    var n, r = e.__scopeRovingFocusGroup,
                        a = e.orientation,
                        o = e.loop,
                        i = e.dir,
                        l = e.currentTabStopId,
                        c = e.defaultCurrentTabStopId,
                        s = e.onCurrentTabStopIdChange,
                        u = e.onEntryFocus,
                        d = e.preventScrollOnEntryFocus,
                        f = void 0 !== d && d,
                        m = n7(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        p = k.useRef(null),
                        b = eq(t, p),
                        y = n5(i),
                        g = n9(tS({
                            prop: l,
                            defaultProp: null != c ? c : null,
                            onChange: s,
                            caller: rr
                        }), 2),
                        v = g[0],
                        h = g[1],
                        O = n9(k.useState(!1), 2),
                        w = O[0],
                        x = O[1],
                        S = (n = k.useRef(u), k.useEffect(function() {
                            n.current = u
                        }), k.useMemo(function() {
                            return function() {
                                for (var e, t = arguments.length, r = Array(t), a = 0; a < t; a++) r[a] = arguments[a];
                                return null == (e = n.current) ? void 0 : e.call.apply(e, [n].concat(function(e) {
                                    if (Array.isArray(e)) return n2(e)
                                }(r) || function(e) {
                                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(r) || function(e, t) {
                                    if (e) {
                                        if ("string" == typeof e) return n2(e, void 0);
                                        var n = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return n2(e, t)
                                    }
                                }(r) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }, [])),
                        P = ri(r),
                        C = k.useRef(!1),
                        N = n9(k.useState(0), 2),
                        I = N[0],
                        A = N[1];
                    return k.useEffect(function() {
                        var e = p.current;
                        if (e) return e.addEventListener(rt, S),
                            function() {
                                return e.removeEventListener(rt, S)
                            }
                    }, [S]), (0, j.jsx)(rd, {
                        scope: r,
                        orientation: a,
                        dir: y,
                        loop: void 0 !== o && o,
                        currentTabStopId: v,
                        onItemFocus: k.useCallback(function(e) {
                            return h(e)
                        }, [h]),
                        onItemShiftTab: k.useCallback(function() {
                            return x(!0)
                        }, []),
                        onFocusableItemAdd: k.useCallback(function() {
                            return A(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: k.useCallback(function() {
                            return A(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, j.jsx)(tB.div, n6(n4({
                            tabIndex: w || 0 === I ? -1 : 0,
                            "data-orientation": a
                        }, m), {
                            ref: b,
                            style: n4({
                                outline: "none"
                            }, e.style),
                            onMouseDown: th(e.onMouseDown, function() {
                                C.current = !0
                            }),
                            onFocus: th(e.onFocus, function(e) {
                                var t = !C.current;
                                if (e.target === e.currentTarget && t && !w) {
                                    var n = new CustomEvent(rt, rn);
                                    if (e.currentTarget.dispatchEvent(n), !n.defaultPrevented) {
                                        var r = P().filter(function(e) {
                                            return e.focusable
                                        });
                                        rv([r.find(function(e) {
                                            return e.active
                                        }), r.find(function(e) {
                                            return e.id === v
                                        })].concat(function(e) {
                                            if (Array.isArray(e)) return n3(e)
                                        }(r) || function(e) {
                                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(r) || re(r) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), f)
                                    }
                                }
                                C.current = !1
                            }),
                            onBlur: th(e.onBlur, function() {
                                return x(!1)
                            })
                        }))
                    })
                }),
                rb = "RovingFocusGroupItem",
                ry = k.forwardRef(function(e, t) {
                    var n = e.__scopeRovingFocusGroup,
                        r = e.focusable,
                        a = void 0 === r || r,
                        o = e.active,
                        i = e.tabStopId,
                        l = e.children,
                        c = n7(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        s = n1(),
                        u = i || s,
                        d = rf(rb, n),
                        f = d.currentTabStopId === u,
                        m = ri(n),
                        p = d.onFocusableItemAdd,
                        b = d.onFocusableItemRemove,
                        y = d.currentTabStopId;
                    return k.useEffect(function() {
                        if (a) return p(),
                            function() {
                                return b()
                            }
                    }, [a, p, b]), (0, j.jsx)(ro.ItemSlot, {
                        scope: n,
                        id: u,
                        focusable: a,
                        active: void 0 !== o && o,
                        children: (0, j.jsx)(tB.span, n6(n4({
                            tabIndex: f ? 0 : -1,
                            "data-orientation": d.orientation
                        }, c), {
                            ref: t,
                            onMouseDown: th(e.onMouseDown, function(e) {
                                a ? d.onItemFocus(u) : e.preventDefault()
                            }),
                            onFocus: th(e.onFocus, function() {
                                return d.onItemFocus(u)
                            }),
                            onKeyDown: th(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void d.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, n) {
                                        var r, a = (r = e.key, "rtl" !== n ? r : "ArrowLeft" === r ? "ArrowRight" : "ArrowRight" === r ? "ArrowLeft" : r);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(a)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(a))) return rg[a]
                                    }(e, d.orientation, d.dir);
                                    if (void 0 !== t) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var n = m().filter(function(e) {
                                            return e.focusable
                                        }).map(function(e) {
                                            return e.ref.current
                                        });
                                        if ("last" === t) n.reverse();
                                        else if ("prev" === t || "next" === t) {
                                            "prev" === t && n.reverse();
                                            var r, a, o = n.indexOf(e.currentTarget);
                                            n = d.loop ? (r = n, a = o + 1, r.map(function(e, t) {
                                                return r[(a + t) % r.length]
                                            })) : n.slice(o + 1)
                                        }
                                        setTimeout(function() {
                                            return rv(n)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof l ? l({
                                isCurrentTabStop: f,
                                hasTabStop: null != y
                            }) : l
                        }))
                    })
                });
            ry.displayName = rb;
            var rg = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function rv(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    n = document.activeElement,
                    r = !0,
                    a = !1,
                    o = void 0;
                try {
                    for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                        var c = i.value;
                        if (c === n || (c.focus({
                                preventScroll: t
                            }), document.activeElement !== n)) return
                    }
                } catch (e) {
                    a = !0, o = e
                } finally {
                    try {
                        r || null == l.return || l.return()
                    } finally {
                        if (a) throw o
                    }
                }
            }

            function rh(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rO(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function rj(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function rw(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        o = Object.keys(e);
                    for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }

            function rx(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rh(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rh(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rS = "Tabs",
                rP = rx(tg(rS, [rs]), 2),
                rk = rP[0];
            rP[1];
            var rC = rs(),
                rN = rx(rk(rS), 2),
                rI = rN[0],
                rA = rN[1],
                rE = k.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.value,
                        a = e.onValueChange,
                        o = e.defaultValue,
                        i = e.orientation,
                        l = void 0 === i ? "horizontal" : i,
                        c = e.dir,
                        s = e.activationMode,
                        u = rw(e, ["__scopeTabs", "value", "onValueChange", "defaultValue", "orientation", "dir", "activationMode"]),
                        d = n5(c),
                        f = rx(tS({
                            prop: r,
                            onChange: a,
                            defaultProp: null != o ? o : "",
                            caller: rS
                        }), 2),
                        m = f[0],
                        p = f[1];
                    return (0, j.jsx)(rI, {
                        scope: n,
                        baseId: n1(),
                        value: m,
                        onValueChange: p,
                        orientation: l,
                        dir: d,
                        activationMode: void 0 === s ? "automatic" : s,
                        children: (0, j.jsx)(tB.div, rj(rO({
                            dir: d,
                            "data-orientation": l
                        }, u), {
                            ref: t
                        }))
                    })
                });
            rE.displayName = rS;
            var rM = "TabsList",
                rD = k.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.loop,
                        a = rw(e, ["__scopeTabs", "loop"]),
                        o = rA(rM, n),
                        i = rC(n);
                    return (0, j.jsx)(rm, rj(rO({
                        asChild: !0
                    }, i), {
                        orientation: o.orientation,
                        dir: o.dir,
                        loop: void 0 === r || r,
                        children: (0, j.jsx)(tB.div, rj(rO({
                            role: "tablist",
                            "aria-orientation": o.orientation
                        }, a), {
                            ref: t
                        }))
                    }))
                });
            rD.displayName = rM;
            var rT = "TabsTrigger",
                rR = k.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.value,
                        a = e.disabled,
                        o = void 0 !== a && a,
                        i = rw(e, ["__scopeTabs", "value", "disabled"]),
                        l = rA(rT, n),
                        c = rC(n),
                        s = rL(l.baseId, r),
                        u = rU(l.baseId, r),
                        d = r === l.value;
                    return (0, j.jsx)(ry, rj(rO({
                        asChild: !0
                    }, c), {
                        focusable: !o,
                        active: d,
                        children: (0, j.jsx)(tB.button, rj(rO({
                            type: "button",
                            role: "tab",
                            "aria-selected": d,
                            "aria-controls": u,
                            "data-state": d ? "active" : "inactive",
                            "data-disabled": o ? "" : void 0,
                            disabled: o,
                            id: s
                        }, i), {
                            ref: t,
                            onMouseDown: th(e.onMouseDown, function(e) {
                                o || 0 !== e.button || !1 !== e.ctrlKey ? e.preventDefault() : l.onValueChange(r)
                            }),
                            onKeyDown: th(e.onKeyDown, function(e) {
                                [" ", "Enter"].includes(e.key) && l.onValueChange(r)
                            }),
                            onFocus: th(e.onFocus, function() {
                                var e = "manual" !== l.activationMode;
                                d || o || !e || l.onValueChange(r)
                            })
                        }))
                    }))
                });
            rR.displayName = rT;
            var rz = "TabsContent",
                r_ = k.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.value,
                        a = e.forceMount,
                        o = e.children,
                        i = rw(e, ["__scopeTabs", "value", "forceMount", "children"]),
                        l = rA(rz, n),
                        c = rL(l.baseId, r),
                        s = rU(l.baseId, r),
                        u = r === l.value,
                        d = k.useRef(u);
                    return k.useEffect(function() {
                        var e = requestAnimationFrame(function() {
                            return d.current = !1
                        });
                        return function() {
                            return cancelAnimationFrame(e)
                        }
                    }, []), (0, j.jsx)(tN, {
                        present: a || u,
                        children: function(n) {
                            var r = n.present;
                            return (0, j.jsx)(tB.div, rj(rO({
                                "data-state": u ? "active" : "inactive",
                                "data-orientation": l.orientation,
                                role: "tabpanel",
                                "aria-labelledby": c,
                                hidden: !r,
                                id: s,
                                tabIndex: 0
                            }, i), {
                                ref: t,
                                style: rj(rO({}, e.style), {
                                    animationDuration: d.current ? "0s" : void 0
                                }),
                                children: r && o
                            }))
                        }
                    })
                });

            function rL(e, t) {
                return "".concat(e, "-trigger-").concat(t)
            }

            function rU(e, t) {
                return "".concat(e, "-content-").concat(t)
            }

            function rF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rB(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function rW(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function rV(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        o = Object.keys(e);
                    for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }
            r_.displayName = rz;
            var rX = (0, k.createContext)({
                    size: "Medium",
                    variant: "Contained",
                    fitBehavior: "Fill"
                }),
                rH = {
                    XSmall: ["text-label-small", "height-700"],
                    Small: ["text-label-small", "height-800"],
                    Medium: ["text-label-medium", "height-1000"],
                    Large: ["text-label-medium", "height-1200"]
                },
                r$ = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-small",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                rq = {
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
                rZ = {
                    XSmall: "padding-bottom-small",
                    Small: "padding-bottom-small",
                    Medium: "padding-bottom-medium",
                    Large: "padding-bottom-xlarge"
                },
                rG = (0, k.forwardRef)(function(e, t) {
                    var n = e.children,
                        r = e.className,
                        a = e.size,
                        o = e.variant,
                        i = e.fitBehavior,
                        l = rV(e, ["children", "className", "size", "variant", "fitBehavior"]),
                        c = (0, k.useMemo)(function() {
                            return {
                                size: a || "Large",
                                variant: o || "Contained",
                                fitBehavior: i || "Fill"
                            }
                        }, [a, o, i]);
                    return C().createElement(rX.Provider, {
                        value: c
                    }, C().createElement(rE, rW(rB({
                        ref: t
                    }, l), {
                        className: P("foundation-web-tabs", "flex flex-col", r)
                    }), n))
                }),
                rK = (0, k.forwardRef)(function(e, t) {
                    var n, r = e.children,
                        a = e.className,
                        o = rV(e, ["children", "className"]),
                        i = (0, k.useContext)(rX).fitBehavior,
                        l = (0, k.useRef)(null),
                        c = (n = (0, k.useState)({
                            width: 0,
                            left: 0,
                            opacity: 0
                        }), function(e) {
                            if (Array.isArray(e)) return e
                        }(n) || function(e, t) {
                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    i = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                } catch (e) {
                                    l = !0, r = e
                                } finally {
                                    try {
                                        i || null == a.return || a.return()
                                    } finally {
                                        if (l) throw r
                                    }
                                }
                                return o
                            }
                        }(n, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return rF(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rF(e, t)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        s = c[0],
                        u = c[1],
                        d = C().useCallback(function(e) {
                            l.current = e, "function" == typeof t ? t(e) : t && "current" in t && (t.current = e)
                        }, [t]);
                    return (0, k.useEffect)(function() {
                        var e, t = function() {
                            var e = l.current;
                            if (e) {
                                var t = e.querySelector('[data-state="active"]');
                                if (t) {
                                    var n = e.getBoundingClientRect(),
                                        r = t.getBoundingClientRect();
                                    u({
                                        width: r.width,
                                        left: r.left - n.left,
                                        opacity: 1
                                    })
                                }
                            }
                        };
                        t();
                        var n = new MutationObserver(function() {
                                cancelAnimationFrame(e), e = requestAnimationFrame(t)
                            }),
                            r = "undefined" != typeof ResizeObserver ? new ResizeObserver(t) : null,
                            a = l.current;
                        return a && (n.observe(a, {
                                subtree: !0,
                                attributes: !0,
                                attributeFilter: ["data-state"]
                            }), null == r || r.observe(a)), window.addEventListener("resize", t),
                            function() {
                                cancelAnimationFrame(e), n.disconnect(), null == r || r.disconnect(), window.removeEventListener("resize", t)
                            }
                    }, [r]), C().createElement("div", {
                        className: P("relative scroll-x", a),
                        style: {
                            scrollbarWidth: "none",
                            msOverflowStyle: "none"
                        }
                    }, C().createElement(rD, rW(rB({
                        ref: d
                    }, o), {
                        className: P("flex items-stretch bg-none border-0 stroke-none")
                    }), r), "Fit" === i && C().createElement("div", {
                        "aria-hidden": "true",
                        className: "absolute bottom-[0px] left-[0px] right-[0px] height-[var(--stroke-thick)] bg-[var(--color-stroke-muted)] [z-index:0]"
                    }), C().createElement("div", {
                        className: "absolute bottom-[0px] bg-system-contrast transition-all duration-200 ease-standard-out",
                        style: {
                            height: "var(--stroke-thick)",
                            zIndex: 1,
                            width: "".concat(s.width, "px"),
                            left: "".concat(s.left, "px"),
                            opacity: s.opacity
                        }
                    }))
                }),
                rY = (0, k.forwardRef)(function(e, t) {
                    var n = e.children,
                        r = e.className,
                        a = e.isDisabled,
                        o = void 0 !== a && a,
                        i = rV(e, ["children", "className", "isDisabled"]),
                        l = (0, k.useContext)(rX),
                        c = l.size,
                        s = l.variant,
                        u = l.fitBehavior;
                    return C().createElement(rR, rW(rB({
                        ref: t
                    }, i), {
                        disabled: o,
                        style: {
                            borderBottom: "var(--stroke-thick) solid var(--color-stroke-muted)",
                            borderTop: "none",
                            borderLeft: "none",
                            borderRight: "none"
                        },
                        className: P("relative flex items-center justify-center cursor-pointer bg-none shrink-0", eF, rH[c], "Fill" === u ? "grow-1 ".concat(r$[c]) : "", rq[c][s], rZ[c], o && "opacity-[0.5]", r)
                    }), C().createElement(eB, null), C().createElement("div", {
                        className: "flex items-center justify-center height-600 relative"
                    }, n))
                });
            (0, k.forwardRef)(function(e, t) {
                var n = e.children,
                    r = e.className,
                    a = rV(e, ["children", "className"]);
                return C().createElement(r_, rW(rB({
                    ref: t
                }, a), {
                    className: P("padding-top-large", "outline-none", r)
                }), n)
            });
            var rJ = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                rQ = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                r0 = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                r1 = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                r2 = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                r8 = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                r5 = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                r3 = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                r4 = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                r6 = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                r7 = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                r9 = C().forwardRef(function(e, t) {
                    var n, r, a = e.className,
                        o = e.label,
                        i = e.variant,
                        l = void 0 === i ? "Standard" : i,
                        c = e.icon,
                        s = e.iconPosition,
                        u = void 0 === s ? "Leading" : s,
                        d = e.size,
                        f = void 0 === d ? "Small" : d,
                        m = e.shape,
                        p = function(e, t) {
                            if (null == e) return {};
                            var n, r, a = function(e, t) {
                                if (null == e) return {};
                                var n, r, a = {},
                                    o = Object.keys(e);
                                for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                return a
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                            }
                            return a
                        }(e, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        b = c && !o,
                        y = "padding-x-xxsmall";
                    c && (y = "Leading" === u ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var g = c && C().createElement(eU, {
                        name: c,
                        size: r6[f],
                        className: r0[l]
                    });
                    return C().createElement("div", (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        ref: t
                    }, p), r = r = {
                        className: P("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", r7[void 0 === m ? "Pill" : m], r2[f], b ? [r5[f], "justify-center"] : ["width-[fit-content]", r8[f]], rJ[l], rQ[l], r1[l], a)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                    }), n), "Leading" === u && g, o && C().createElement("span", {
                        className: P("text-no-wrap text-truncate-split", r3[f], r4[f], y, rQ[l])
                    }, o), "Trailing" === u && g)
                });
            r9.displayName = "Badge";
            var ae = function(e) {
                    var t = e.activeTab,
                        n = e.tabs,
                        r = e.onSelectTab;
                    return (0, j.jsx)(rG, {
                        value: t,
                        variant: "Contained",
                        size: "Large",
                        fitBehavior: "Fill",
                        className: "radius-none overflow-hidden",
                        onValueChange: function(e) {
                            var t = n.find(function(t) {
                                return t.name === e
                            });
                            t && r(t.name)
                        },
                        children: (0, j.jsx)(rK, {
                            children: n.map(function(e) {
                                return (0, j.jsx)(rY, {
                                    value: e.name,
                                    children: (0, j.jsxs)("span", {
                                        className: "flex items-center justify-center gap-small",
                                        children: [(0, j.jsx)("span", {
                                            children: e.label
                                        }), e.count ? (0, j.jsx)(r9, {
                                            label: String(e.count),
                                            variant: "Contrast"
                                        }) : null]
                                    })
                                }, e.name)
                            })
                        })
                    })
                },
                at = function() {
                    var e, t, n, r, a, o = (0, S.useTranslation)().translate,
                        i = e_({
                            translate: o
                        }),
                        l = (null == (e = (0, A.getDeviceMeta)()) ? void 0 : e.isInApp) === !0,
                        c = i.page ? i.page.pageNumber + 1 : i.route.page,
                        s = null != (r = null == (t = i.page) ? void 0 : t.totalPages) ? r : 1,
                        u = null != (a = null == (n = i.page) ? void 0 : n.collection.length) ? a : 0;
                    return (0, j.jsxs)("main", {
                        className: "private-message-page margin-x-auto padding-medium",
                        children: [l ? null : (0, j.jsx)("h1", {
                            className: "text-heading-large content-emphasis margin-top-none margin-bottom-medium",
                            children: o("Heading.Message")
                        }), (0, j.jsx)(ae, {
                            activeTab: i.route.tab,
                            tabs: i.tabs,
                            onSelectTab: i.openTab
                        }), (0, j.jsx)(nv, {
                            activeTab: i.route.tab,
                            moduleState: i.moduleState,
                            selectedCount: i.selectedMessageIds.size,
                            totalCount: u,
                            currentPage: c,
                            totalPages: s,
                            onToggleSelectAll: i.toggleSelectAll,
                            onMarkArchive: function(e) {
                                i.markArchive(e)
                            },
                            onMarkRead: function(e) {
                                i.markRead(e)
                            },
                            onBack: i.backToList,
                            onChangePage: i.changePage
                        }), i.loading ? (0, j.jsx)("div", {
                            className: "flex justify-center padding-xxlarge",
                            children: (0, j.jsx)(I, {
                                ariaLabel: o("Label.Loading"),
                                variant: "Indeterminate",
                                size: "Medium"
                            })
                        }) : null, !i.loading && i.error ? (0, j.jsx)("div", {
                            className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-large content-system-alert",
                            children: i.error
                        }) : null, i.loading || i.error || i.moduleState !== R ? null : i.route.tab === D ? (0, j.jsx)(nW, {
                            page: i.page
                        }) : (0, j.jsx)(nU, {
                            page: i.page,
                            activeTab: i.route.tab,
                            selectedMessageIds: i.selectedMessageIds,
                            onToggleSelection: i.toggleMessageSelection,
                            onOpenMessage: function(e, t) {
                                i.openMessage(e, t)
                            }
                        }), i.loading || i.error || i.moduleState !== z ? null : (0, j.jsx)(nD, {
                            message: i.selectedMessage,
                            activeTab: i.route.tab,
                            sendReplyState: i.sendReplyState,
                            onReplyContentChange: i.updateReplyContent,
                            onIncludePreviousMessageChange: i.updateIncludePreviousMessage,
                            onSendReply: function() {
                                i.sendReply()
                            }
                        }), (0, j.jsx)(tu, {
                            feedback: i.feedback,
                            onClose: i.dismissFeedback
                        })]
                    })
                },
                an = JSON.parse('{"P":["Feature.Messages"]}');
            n(781);
            var ar = function() {
                var e;
                return null != (e = document.getElementById("private-message")) ? e : document.getElementById("private-message-web-app")
            };
            x()(function() {
                var e = ar();
                e && ("private-message-web-app" === e.id && e.classList.add("messages-container"), (0, S.renderWithErrorBoundary)((0, j.jsx)(S.TranslationProvider, {
                    config: an.P,
                    children: (0, j.jsx)(at, {})
                }), e))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PrivateMessage");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/privateMessage-da2e7416384b3642.js.map