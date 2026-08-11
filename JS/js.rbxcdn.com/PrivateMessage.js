! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "b4630a3c1733fb98a8d18ed0344b68d6d15754b4"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "57b19182-eed6-4c58-bc93-0473552617a3", e._sentryDebugIdIdentifier = "sentry-dbid-57b19182-eed6-4c58-bc93-0473552617a3")
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
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var o = arguments[i];
                            o && (e = a(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return r.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var o in e) n.call(e, o) && e[o] && (i = a(i, o));
                                return i
                            }(o)))
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
        var i = t[r] = {
            exports: {}
        };
        return e[r](i, i.exports, n), i.exports
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
        var i = a.getElementsByTagName("script");
        if (i.length)
            for (var o = i.length - 1; o > -1 && (!r || !/^http(s?):/.test(r));) r = i[o--].src
    }
    if (!r) throw Error("Automatic publicPath is not supported in this browser");
    n.p = r.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), n.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var e, t, r, a, i, o, l, s, c, u, d, f, m, p, v, b, g, h, y, x, w, j, S, O = window.ReactJSX,
                N = window.Roblox["core-scripts"].util.ready,
                C = n.n(N),
                k = window.Roblox["core-scripts"].react;

            function E(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                    var a = 0;
                    for (r = Object.getOwnPropertySymbols(e); a < r.length; a++) 0 > t.indexOf(r[a]) && Object.prototype.propertyIsEnumerable.call(e, r[a]) && (n[r[a]] = e[r[a]])
                }
                return n
            }
            var I = function() {
                    for (var e, t, n = 0, r = "", a = arguments.length; n < a; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, a = "";
                        if ("string" == typeof t || "number" == typeof t) a += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (n = 0; n < i; n++) t[n] && (r = e(t[n])) && (a && (a += " "), a += r)
                            } else
                                for (r in t) t[r] && (a && (a += " "), a += r);
                        return a
                    }(e)) && (r && (r += " "), r += t);
                    return r
                },
                A = window.React,
                M = n.n(A);

            function P(e, t) {
                void 0 === t && (t = {});
                var n = t.insertAt;
                if (e && "undefined" != typeof document) {
                    var r = document.head || document.getElementsByTagName("head")[0],
                        a = document.createElement("style");
                    a.type = "text/css", "top" === n && r.firstChild ? r.insertBefore(a, r.firstChild) : r.appendChild(a), a.styleSheet ? a.styleSheet.cssText = e : a.appendChild(document.createTextNode(e))
                }
            }
            P(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}.light-theme,.system-theme,:root{--alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-system-progress:#335fff}.dark-theme{--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}@media (prefers-color-scheme:dark){:is(:root,.system-theme){--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}:is(:root,.light-theme,.system-theme) .stroke-contrast-alpha{border-color:rgba(27,37,75,.5)}.dark-theme .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}@media (prefers-color-scheme:dark){:is(:root,.system-theme) .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}}.foundation-web-input.stroke-contrast-alpha:focus,.foundation-web-input.stroke-contrast-alpha:focus-within{border-color:var(--color-system-emphasis);box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.stroke-system-alert:focus,.foundation-web-input.stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}"), P("@keyframes progress-circle-rotate{0%{transform:rotate(0deg)}to{transform:rotate(1turn)}}.foundation-web-progress-circle-indeterminate{animation:progress-circle-rotate 1.4s linear infinite;transform-origin:50% 50%}");
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
                T = M().forwardRef(function(e, t) {
                    var n = e.className,
                        r = e.size,
                        a = void 0 === r ? "Large" : r,
                        i = e.variant,
                        o = e.value,
                        l = e.showValue,
                        s = void 0 !== l && l,
                        c = e.ariaLabel,
                        u = E(e, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        d = R[a],
                        f = d.dimension,
                        m = d.strokeWidth,
                        p = d.textClass,
                        v = d.valueContainerSize,
                        b = (f - m) / 2,
                        g = 2 * Math.PI * b,
                        h = f / 2,
                        y = Math.min(100, Math.max(0, void 0 === o ? 0 : o)),
                        x = s && void 0 !== v ? v : f,
                        w = "Determinate" === (void 0 === i ? "Determinate" : i);
                    return M().createElement("div", Object.assign({
                        ref: t,
                        className: I("foundation-web-progress-circle inline-flex items-center justify-center", n),
                        role: "progressbar",
                        "aria-label": c,
                        "aria-valuemin": w ? 0 : void 0,
                        "aria-valuemax": w ? 100 : void 0,
                        "aria-valuenow": w ? y : void 0,
                        style: {
                            width: x,
                            height: x
                        }
                    }, u), M().createElement("svg", {
                        width: f,
                        height: f,
                        viewBox: "0 0 ".concat(f, " ").concat(f),
                        className: "relative"
                    }, M().createElement("circle", {
                        cx: h,
                        cy: h,
                        r: b,
                        fill: "none",
                        strokeWidth: m,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), M().createElement("circle", {
                        cx: h,
                        cy: h,
                        r: b,
                        fill: "none",
                        strokeWidth: m,
                        strokeDasharray: w ? g : "".concat(.75 * g, " ").concat(.25 * g),
                        strokeDashoffset: w ? g * (1 - y / 100) : 0,
                        strokeLinecap: "round",
                        className: I(!w && "foundation-web-progress-circle-indeterminate"),
                        style: w ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), w && s && "Large" === a && M().createElement("div", {
                        className: I("absolute content-emphasis flex items-center justify-center", p),
                        "aria-hidden": "true"
                    }, M().createElement("span", null, Math.round(y)), M().createElement("span", null, "%")))
                });
            T.displayName = "ProgressCircle";
            var D = window.Roblox["core-scripts"].meta.device,
                z = "inbox",
                L = "sent",
                _ = "notifications",
                U = "archive",
                F = "list",
                B = "detail",
                W = "Roblox",
                V = "Roblox.Messages.CountChanged",
                H = window.Roblox["core-scripts"].eventStream,
                X = window.Roblox["core-scripts"].intl.intl,
                Z = n.n(X),
                $ = window.Roblox["core-scripts"].endpoints,
                q = window.Roblox["core-scripts"].format.string,
                G = new(Z())().getDateTimeFormatter(),
                K = function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return t.find(function(e) {
                        return null != e
                    })
                },
                Y = function(e) {
                    var t, n, r, a = null != (t = K(null == e ? void 0 : e.id, null == e ? void 0 : e.UserId, 1)) ? t : 1,
                        i = null != (n = K(null == e ? void 0 : e.name, null == e ? void 0 : e.UserName, W)) ? n : W,
                        o = null != (r = K(null == e ? void 0 : e.displayName, null == e ? void 0 : e.DisplayName, i)) ? r : i;
                    return {
                        id: a,
                        name: (0, q.escapeHtml)(i),
                        displayName: o,
                        hasVerifiedBadge: !!K(null == e ? void 0 : e.hasVerifiedBadge, null == e ? void 0 : e.HasVerifiedBadge, !1),
                        profileLink: (0, $.getAbsoluteUrl)("/users/".concat(a, "/profile"))
                    }
                },
                J = function(e) {
                    var t = (0, $.getAbsoluteUrl)("/my/messages/");
                    return (0, $.getAbsoluteUrl)("/AbuseReport/message?ID=".concat(e, "&RedirectUrl=").concat(t))
                },
                Q = function(e) {
                    var t, n, r, a, i = null != (t = K(e.id, e.Id, 0)) ? t : 0;
                    return {
                        id: i,
                        sender: Y(K(e.sender, e.Sender)),
                        recipient: Y(K(e.recipient, e.Recipient)),
                        subject: null != (n = K(e.subject, e.Subject, "")) ? n : "",
                        body: null != (r = K(e.body, e.Body, "")) ? r : "",
                        created: null != (a = K(e.created, e.Created, "")) ? a : "",
                        updated: K(e.updated, e.Updated),
                        isRead: !!K(e.isRead, e.IsRead, !1),
                        isSystemMessage: !!K(e.isSystemMessage, e.IsSystemMessage, !1),
                        isReportAbuseDisplayed: !!K(e.isReportAbuseDisplayed, e.IsReportAbuseDisplayed, !1),
                        abuseReportUrl: J(i)
                    }
                },
                ee = function(e) {
                    var t, n, r, a, i = null != (t = K(e.collection, e.Collection, [])) ? t : [];
                    return {
                        pageNumber: null != (n = K(e.pageNumber, e.PageNumber, 0)) ? n : 0,
                        totalPages: null != (r = K(e.totalPages, e.TotalPages, 1)) ? r : 1,
                        totalCollectionSize: null != (a = K(e.totalCollectionSize, e.TotalCollectionSize, i.length)) ? a : i.length,
                        collection: i.map(Q)
                    }
                },
                et = function(e) {
                    var t = document.createElement("div");
                    return t.innerHTML = e, t.textContent || t.innerText || ""
                },
                en = function(e) {
                    var t = 0,
                        n = "";
                    return e.replace(/(https?:\/\/[^\s<]+)/g, function(r, a, i) {
                        return n += (0, q.escapeHtml)(e.slice(t, i)), n += '<a href="'.concat(r.replace(/[&"]/g, function(e) {
                            return "&" === e ? "&amp;" : "&quot;"
                        }), '" target="_blank" rel="noreferrer">').concat((0, q.escapeHtml)(r), "</a>"), t = i + r.length, r
                    }), (n += (0, q.escapeHtml)(e.slice(t))).replace(/\n/g, "<br />")
                },
                er = function(e) {
                    var t = new Date(e);
                    if (Number.isNaN(t.getTime())) return "";
                    var n = t.getFullYear() === new Date().getFullYear() ? G.getCustomDateTime(t, {
                        month: "short",
                        day: "numeric"
                    }) : G.getShortDate(t);
                    return "".concat(n, " | ").concat(G.getCustomDateTime(t, {
                        hour: "numeric",
                        minute: "numeric"
                    }))
                },
                ea = function(e) {
                    var t = new Date(e);
                    return Number.isNaN(t.getTime()) ? "" : G.getFullDate(t)
                },
                ei = function(e) {
                    document.dispatchEvent(new Event(e))
                },
                eo = window.Roblox["core-scripts"].environmentUrls,
                el = n.n(eo),
                es = window.Roblox["core-scripts"].http.http,
                ec = window.Roblox["core-scripts"].guac,
                eu = window.Roblox["core-scripts"].meta.user;

            function ed(e, t, n, r, a, i, o) {
                try {
                    var l = e[i](o),
                        s = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(s) : Promise.resolve(s).then(r, a)
            }

            function ef(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var i = e.apply(t, n);

                        function o(e) {
                            ed(i, r, a, o, l, "next", e)
                        }

                        function l(e) {
                            ed(i, r, a, o, l, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function em(e, t) {
                var n, r, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return o.next = l(0), o.throw = l(1), o.return = l(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                    return this
                }), o;

                function l(l) {
                    return function(s) {
                        var c = [l, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, c[0] && (i = 0)), i;) try {
                            if (n = 1, r && (a = 2 & c[0] ? r.return : c[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, c[1])).done) return a;
                            switch (r = 0, a && (c = [2 & c[0], a.value]), c[0]) {
                                case 0:
                                case 1:
                                    a = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!a || c[1] > a[0] && c[1] < a[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < a[1]) {
                                        i.label = a[1], a = c;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(c);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ep = function(e) {
                    return "".concat(el().privateMessagesApi).concat(e)
                },
                ev = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return {
                        url: e,
                        noCache: t,
                        retryable: t,
                        withCredentials: !0
                    }
                },
                eb = function() {
                    var e = new URLSearchParams;
                    return e.append("version", "1"), (0, ec.callBehaviour)("private-messages-ui", e)
                },
                eg = function(e, t) {
                    return e === _ ? ef(function() {
                        return em(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, (0, es.get)(ev(ep("/v1/announcements"), !0), void 0)];
                                case 1:
                                    return [2, ee(e.sent().data)]
                            }
                        })
                    })() : ef(function() {
                        return em(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, (0, es.get)(ev(ep("/v1/messages"), !0), {
                                        pageNumber: t,
                                        pageSize: 20,
                                        messageTab: e
                                    })];
                                case 1:
                                    return [2, ee(n.sent().data)]
                            }
                        })
                    })()
                },
                eh = function(e, t) {
                    return (0, es.post)(ev(ep(t ? "/v1/messages/mark-read" : "/v1/messages/mark-unread")), {
                        messageIds: e
                    })
                },
                ey = function(e) {
                    if (e.message) return Error(e.message);
                    var t, n, r = null == (n = e.errors) || null == (t = n[0]) ? void 0 : t.message;
                    return Error(null != r ? r : "Unknown error")
                },
                ex = function(e) {
                    var t = e.subject,
                        n = e.body,
                        r = e.recipientId,
                        a = e.replyMessageId,
                        i = e.includePreviousMessage;
                    return ef(function() {
                        var e, o;
                        return em(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return [4, (0, es.post)(ev(ep("/v1/messages/send")), {
                                        userId: null != (e = (0, eu.userId)()) ? e : 0,
                                        subject: t,
                                        body: n,
                                        recipientId: r,
                                        replyMessageId: a,
                                        includePreviousMessage: i
                                    })];
                                case 1:
                                    if (!1 === (o = l.sent()).data.success) throw ey(o.data);
                                    return [2, o.data]
                            }
                        })
                    })()
                },
                ew = window.Roblox["core-scripts"].util.url;

            function ej(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eS(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ej(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ej(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eO = [z, L, _, U],
                eN = function(e) {
                    var t = Array.isArray(e) ? e[0] : e;
                    if (null == t || "" === t || "string" != typeof t && "number" != typeof t) return null;
                    var n = Number.parseInt(String(t), 10);
                    return Number.isNaN(n) ? null : n
                },
                eC = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : window.location.hash,
                        n = eS((t.startsWith("#!") ? t.slice(2) : t.replace(/^#/, "")).split("?"), 2),
                        r = n[0],
                        a = n[1],
                        i = (void 0 === r ? "/inbox" : r).replace(/^\//, ""),
                        o = (0, ew.parseQueryString)(void 0 === a ? "" : a),
                        l = null != (e = eN(o.page)) ? e : 1;
                    return {
                        tab: eO.includes(i) ? i : z,
                        page: l > 0 ? l : 1,
                        messageIdx: eN(o.messageIdx),
                        conversationId: eN(o.conversationId)
                    }
                },
                ek = function(e) {
                    var t = (0, ew.composeQueryString)(function(e) {
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
                eE = function() {
                    var e = eS((0, A.useState)(function() {
                            return eC()
                        }), 2),
                        t = e[0],
                        n = e[1];
                    return (0, A.useEffect)(function() {
                        var e = function() {
                            n(eC())
                        };
                        return window.addEventListener("hashchange", e),
                            function() {
                                window.removeEventListener("hashchange", e)
                            }
                    }, []), {
                        route: t,
                        setRoute: (0, A.useCallback)(function(e) {
                            var t = ek(e);
                            window.location.hash === t ? n(e) : window.location.hash = t
                        }, [])
                    }
                };

            function eI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eA(e, t, n, r, a, i, o) {
                try {
                    var l = e[i](o),
                        s = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(s) : Promise.resolve(s).then(r, a)
            }

            function eM(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var i = e.apply(t, n);

                        function o(e) {
                            eA(i, r, a, o, l, "next", e)
                        }

                        function l(e) {
                            eA(i, r, a, o, l, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function eP(e) {
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

            function eR(e, t) {
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

            function eT(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || eL(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eD(e) {
                return function(e) {
                    if (Array.isArray(e)) return eI(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || eL(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ez(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eL(e, t) {
                if (e) {
                    if ("string" == typeof e) return eI(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eI(e, t)
                }
            }

            function e_(e, t) {
                var n, r, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return o.next = l(0), o.throw = l(1), o.return = l(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                    return this
                }), o;

                function l(l) {
                    return function(s) {
                        var c = [l, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, c[0] && (i = 0)), i;) try {
                            if (n = 1, r && (a = 2 & c[0] ? r.return : c[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, c[1])).done) return a;
                            switch (r = 0, a && (c = [2 & c[0], a.value]), c[0]) {
                                case 0:
                                case 1:
                                    a = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!a || c[1] > a[0] && c[1] < a[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < a[1]) {
                                        i.label = a[1], a = c;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(c);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var eU = {
                    replyContent: "",
                    includePreviousMessage: !0,
                    isSending: !1
                },
                eF = function(e) {
                    return e && !e.isSystemMessage ? eR(eP({}, e), {
                        body: en(e.body)
                    }) : e
                },
                eB = function(e, t) {
                    if (e && (void 0 === e ? "undefined" : ez(e)) === "object") {
                        if ("string" == typeof e.message) return e.message;
                        if (Array.isArray(e.errors)) {
                            var n = e.errors[0];
                            if (n && (void 0 === n ? "undefined" : ez(n)) === "object" && "message" in n) return String(n.message)
                        }
                    }
                    return t
                },
                eW = function(e) {
                    var t = e.translate,
                        n = eE(),
                        r = n.route,
                        a = n.setRoute,
                        i = eT((0, A.useState)({}), 2),
                        o = i[0],
                        l = i[1],
                        s = eT((0, A.useState)(null), 2),
                        c = s[0],
                        u = s[1],
                        d = eT((0, A.useState)(null), 2),
                        f = d[0],
                        m = d[1],
                        p = eT((0, A.useState)(function() {
                            return new Set
                        }), 2),
                        v = p[0],
                        b = p[1],
                        g = eT((0, A.useState)(F), 2),
                        h = g[0],
                        y = g[1],
                        x = eT((0, A.useState)(!0), 2),
                        w = x[0],
                        j = x[1],
                        S = eT((0, A.useState)(null), 2),
                        O = S[0],
                        N = S[1],
                        C = eT((0, A.useState)(null), 2),
                        k = C[0],
                        E = C[1],
                        I = eT((0, A.useState)(eU), 2),
                        M = I[0],
                        P = I[1],
                        R = eT((0, A.useState)(0), 2),
                        T = R[0],
                        D = R[1],
                        W = (0, A.useRef)(!1),
                        X = (0, A.useMemo)(function() {
                            var e = [{
                                name: z,
                                label: t("Label.Inbox")
                            }, {
                                name: L,
                                label: t("Label.Sent")
                            }, {
                                name: _,
                                label: t("Label.News"),
                                count: T
                            }, {
                                name: U,
                                label: t("Label.Archive")
                            }];
                            return o.displayNewsTab ? e : e.filter(function(e) {
                                return e.name !== _
                            })
                        }, [T, o.displayNewsTab, t]),
                        Z = (0, A.useCallback)(function() {
                            return eM(function() {
                                var e, n, a, i;
                                return e_(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            j(!0), N(null), b(new Set), o.label = 1;
                                        case 1:
                                            var l;
                                            if (o.trys.push([1, 8, 9, 10]), null == r.conversationId) return [3, 5];
                                            return [4, (l = r.conversationId, ef(function() {
                                                return em(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, (0, es.get)(ev(ep("/v1/messages/".concat(l)), !0), void 0)];
                                                        case 1:
                                                            return [2, Q(e.sent().data)]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            if (e = o.sent(), u(null), m(eF(e)), P(eU), y(B), e.isRead) return [3, 4];
                                            return [4, eh([e.id], !0)];
                                        case 3:
                                            o.sent(), ei(V), o.label = 4;
                                        case 4:
                                            return [3, 7];
                                        case 5:
                                            return [4, eg(r.tab, r.page - 1)];
                                        case 6:
                                            u(n = o.sent()), y(null == r.messageIdx ? F : B), m(null == r.messageIdx ? null : eF(null != (a = n.collection[r.messageIdx]) ? a : null)), null != r.messageIdx && P(eU), ei(V), o.label = 7;
                                        case 7:
                                            return [3, 10];
                                        case 8:
                                            return i = o.sent(), u(null), m(null), y(F), N(eB(i, t("Message.UnknownError"))), [3, 10];
                                        case 9:
                                            return j(!1), [7];
                                        case 10:
                                            return [2]
                                    }
                                })
                            })()
                        }, [r, t]);
                    return (0, A.useEffect)(function() {
                        eb().then(l).catch(function() {
                            l({})
                        }), ef(function() {
                            return em(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return [4, (0, es.get)(ev(ep("/v1/announcements/metadata"), !0), void 0)];
                                    case 1:
                                        return [2, e.sent().data]
                                }
                            })
                        })().then(function(e) {
                            var t;
                            D(null != (t = e.numOfAnnouncements) ? t : 0)
                        }).catch(function() {
                            D(0)
                        })
                    }, []), (0, A.useEffect)(function() {
                        if (W.current) {
                            W.current = !1;
                            return
                        }
                        Z()
                    }, [Z]), {
                        route: r,
                        rules: o,
                        tabs: X,
                        page: c,
                        selectedMessage: f,
                        selectedMessageIds: v,
                        moduleState: h,
                        loading: w,
                        error: O,
                        feedback: k,
                        sendReplyState: M,
                        openTab: function(e) {
                            e === _ && (0, H.sendEventWithTarget)("newsOpenContent", "click", {
                                property: T
                            }, H.targetTypes.WWW), m(null), b(new Set), P(eU), a({
                                tab: e,
                                page: 1,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        openMessage: function(e, t) {
                            return eM(function() {
                                return e_(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (m(eF(e)), b(new Set([e.id])), P(eU), y(B), W.current = !0, a(eR(eP({}, r), {
                                                    messageIdx: t,
                                                    conversationId: null
                                                })), e.isRead) return [3, 2];
                                            return u(function(t) {
                                                return null == t ? t : eR(eP({}, t), {
                                                    collection: t.collection.map(function(t) {
                                                        return t.id === e.id ? eR(eP({}, t), {
                                                            isRead: !0
                                                        }) : t
                                                    })
                                                })
                                            }), [4, eh([e.id], !0)];
                                        case 1:
                                            n.sent(), ei(V), n.label = 2;
                                        case 2:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        backToList: function() {
                            m(null), b(new Set), P(eU), y(F), W.current = !0, a(eR(eP({}, r), {
                                messageIdx: null,
                                conversationId: null
                            }))
                        },
                        toggleMessageSelection: function(e) {
                            b(function(t) {
                                var n = new Set(t);
                                return n.has(e) ? n.delete(e) : n.add(e), n
                            })
                        },
                        toggleSelectAll: function() {
                            b(function(e) {
                                return c && e.size !== c.collection.length ? new Set(c.collection.map(function(e) {
                                    return e.id
                                })) : new Set
                            })
                        },
                        markRead: function(e) {
                            return eM(function() {
                                var t;
                                return e_(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (0 === (t = eD(v)).length) return [2];
                                            return u(function(n) {
                                                return null == n ? n : eR(eP({}, n), {
                                                    collection: n.collection.map(function(n) {
                                                        return t.includes(n.id) ? eR(eP({}, n), {
                                                            isRead: e
                                                        }) : n
                                                    })
                                                })
                                            }), b(new Set), [4, eh(t, e)];
                                        case 1:
                                            return n.sent(), ei(V), [2]
                                    }
                                })
                            })()
                        },
                        markArchive: function(e) {
                            return eM(function() {
                                var t, n;
                                return e_(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            if (0 === (t = v.size > 0 ? eD(v) : f ? [f.id] : []).length) return [2];
                                            return n = h === B, [4, (0, es.post)(ev(ep(e ? "/v1/messages/archive" : "/v1/messages/unarchive")), {
                                                messageIds: t
                                            })];
                                        case 1:
                                            if (i.sent(), b(new Set), m(null), P(eU), y(F), !n) return [3, 2];
                                            return a(eR(eP({}, r), {
                                                messageIdx: null,
                                                conversationId: null
                                            })), [3, 4];
                                        case 2:
                                            return [4, Z()];
                                        case 3:
                                            i.sent(), i.label = 4;
                                        case 4:
                                            return ei(V), [2]
                                    }
                                })
                            })()
                        },
                        changePage: function(e) {
                            P(eU), a({
                                tab: r.tab,
                                page: e,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        updateReplyContent: function(e) {
                            P(function(t) {
                                return eR(eP({}, t), {
                                    replyContent: e
                                })
                            })
                        },
                        updateIncludePreviousMessage: function(e) {
                            P(function(t) {
                                return eR(eP({}, t), {
                                    includePreviousMessage: e
                                })
                            })
                        },
                        sendReply: function() {
                            return eM(function() {
                                return e_(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            if (!f || 0 === M.replyContent.length) return [2];
                                            P(function(e) {
                                                return eR(eP({}, e), {
                                                    isSending: !0
                                                })
                                            }), e.label = 1;
                                        case 1:
                                            return e.trys.push([1, 3, 4, 5]), [4, ex({
                                                subject: f.subject,
                                                body: M.replyContent,
                                                recipientId: f.sender.id,
                                                replyMessageId: f.id,
                                                includePreviousMessage: M.includePreviousMessage
                                            })];
                                        case 2:
                                            return e.sent(), E({
                                                type: "success",
                                                message: t("Message.SendSuccessfully")
                                            }), P(eU), ei("Roblox.Messages.MessageSent"), [3, 5];
                                        case 3:
                                            return E({
                                                type: "warning",
                                                message: eB(e.sent(), t("Message.UnknownError"))
                                            }), [3, 5];
                                        case 4:
                                            return P(function(e) {
                                                return eR(eP({}, e), {
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
                            E(null)
                        },
                        shouldShowSystemUser: function(e) {
                            return "sent" !== r.tab && 1 === e.sender.id
                        }
                    }
                },
                eV = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                eH = M().forwardRef(function(e, t) {
                    var n = e.name,
                        r = e.size,
                        a = e.className,
                        i = (e.children, E(e, ["name", "size", "className", "children"]));
                    return M().createElement("span", Object.assign({
                        ref: t,
                        role: "presentation",
                        className: I("grow-0 shrink-0 basis-auto icon", n, eV[void 0 === r ? "Medium" : r], a)
                    }, i))
                });

            function eX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eZ(e) {
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

            function e$(e, t) {
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

            function eq(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }

            function eG(e) {
                return function(e) {
                    if (Array.isArray(e)) return eX(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eX(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eX(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eK(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eY(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }
            eH.displayName = "Icon";
            var eJ = Symbol.for("react.lazy"),
                eQ = A[" use ".trim().toString()];

            function e0(e) {
                var t;
                return null != e && "object" == (void 0 === e ? "undefined" : eK(e)) && "$$typeof" in e && e.$$typeof === eJ && "_payload" in e && "object" == eK(t = e._payload) && null !== t && "then" in t
            }
            var e1 = ((e = A.forwardRef(function(e, t) {
                    var n = e.children,
                        r = eq(e, ["children"]);
                    if (e0(n) && "function" == typeof eQ && (n = eQ(n._payload)), A.isValidElement(n)) {
                        var a, i, o, l, s = (l = null == (i = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? a.ref : (l = null == (o = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning ? a.props.ref : a.props.ref || a.ref,
                            c = function(e, t) {
                                var n = eZ({}, t);
                                for (var r in t) ! function(r) {
                                    var a = e[r],
                                        i = t[r];
                                    /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = i.apply(void 0, eG(t));
                                        return a.apply(void 0, eG(t)), r
                                    } : a && (n[r] = a) : "style" === r ? n[r] = eZ({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                                }(r);
                                return eZ({}, e, n)
                            }(r, n.props);
                        return n.type !== A.Fragment && (c.ref = t ? function() {
                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                            return function(e) {
                                var n = !1,
                                    r = t.map(function(t) {
                                        var r = eY(t, e);
                                        return n || "function" != typeof r || (n = !0), r
                                    });
                                if (n) return function() {
                                    for (var e = 0; e < r.length; e++) {
                                        var n = r[e];
                                        "function" == typeof n ? n() : eY(t[e], null)
                                    }
                                }
                            }
                        }(t, s) : s), A.cloneElement(n, c)
                    }
                    return A.Children.count(n) > 1 ? A.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), t = e, (r = A.forwardRef(function(e, n) {
                    var r = e.children,
                        a = eq(e, ["children"]);
                    e0(r) && "function" == typeof eQ && (r = eQ(r._payload));
                    var i = A.Children.toArray(r),
                        o = i.find(e5);
                    if (o) {
                        var l = o.props.children,
                            s = i.map(function(e) {
                                return e === o ? A.Children.count(l) > 1 ? A.Children.only(null) : A.isValidElement(l) ? l.props.children : null : e
                            });
                        return (0, O.jsx)(t, e$(eZ({}, a), {
                            ref: n,
                            children: A.isValidElement(l) ? A.cloneElement(l, void 0, s) : null
                        }))
                    }
                    return (0, O.jsx)(t, e$(eZ({}, a), {
                        ref: n,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), r),
                e2 = Symbol("radix.slottable");

            function e5(e) {
                return A.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === e2
            }
            var e4 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                e3 = function() {
                    return M().createElement("div", {
                        role: "presentation",
                        className: "absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none"
                    })
                },
                e8 = "opacity-[0.5]";
            P("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var e7 = function(e) {
                    var t = e.width,
                        n = e.height;
                    return M().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, M().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                e6 = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                e9 = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                te = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tt = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tn = (0, A.forwardRef)(function(e, t) {
                    var n = e.children,
                        r = e.className,
                        a = e.style,
                        i = e.isDisabled,
                        o = void 0 !== i && i,
                        l = e.isLoading,
                        s = void 0 !== l && l,
                        c = e.icon,
                        u = e.size,
                        d = void 0 === u ? "Large" : u,
                        f = e.variant,
                        m = void 0 === f ? "Emphasis" : f,
                        p = e.asChild,
                        v = E(e, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        b = I("foundation-web-button", o ? e8 : [e4, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", e9[d], o ? tt[m] : te[m], r),
                        g = Object.assign({
                            textDecoration: "none"
                        }, a),
                        h = function(e) {
                            return M().createElement(M().Fragment, null, M().createElement(e3, null), s && M().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, M().createElement(e7, {
                                width: e6[d],
                                height: e6[d]
                            })), M().createElement("span", {
                                className: I("flex items-center min-width-0", "Large" === d || "Medium" === d ? "gap-small" : "gap-xsmall", s && "invisible")
                            }, c && M().createElement(eH, {
                                name: c,
                                size: d
                            }), M().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (p) {
                        var y = E(v, ["as"]),
                            x = M().Children.only(n);
                        return M().createElement(e1, Object.assign({
                            ref: t
                        }, y, {
                            className: b,
                            style: g,
                            "aria-disabled": o || void 0
                        }), M().cloneElement(x, {}, h(x.props.children)))
                    }
                    if ("a" === v.as) {
                        v.as;
                        var w = v.href,
                            j = E(v, ["as", "href"]);
                        return M().createElement("a", Object.assign({
                            ref: t
                        }, j, {
                            "aria-disabled": o,
                            href: o ? void 0 : w,
                            className: b,
                            style: g
                        }), h(n))
                    }
                    var S = E(v, ["as"]);
                    return M().createElement("button", Object.assign({
                        ref: t,
                        type: "button"
                    }, S, {
                        disabled: o,
                        className: b,
                        style: g
                    }), h(n))
                }),
                tr = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                ta = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                ti = function(e) {
                    var t = e.variant,
                        n = e.size,
                        r = e.isCircular,
                        a = e.className,
                        i = E(e, ["variant", "size", "isCircular", "className"]);
                    return M().createElement("button", Object.assign({
                        type: "button",
                        className: I("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", e4, ta[t], tr[n], r && "radius-circle", a)
                    }, i), M().createElement(e3, null), M().createElement(eH, {
                        name: "icon-regular-x",
                        size: n
                    }))
                };

            function to(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var tl = (0, A.forwardRef)(function(e, t) {
                    var n, r = e.title,
                        a = e.icon,
                        i = e.actionLabel,
                        o = e.onAction,
                        l = e.actions,
                        s = e.onClose,
                        c = e.closeIconAriaLabel,
                        u = e.shouldAutoDismiss,
                        d = e.autoDismissDurationMs,
                        f = e.className,
                        m = E(e, ["title", "icon", "actionLabel", "onAction", "actions", "onClose", "closeIconAriaLabel", "shouldAutoDismiss", "autoDismissDurationMs", "className"]),
                        p = (n = (0, A.useState)("enter"), function(e) {
                            if (Array.isArray(e)) return e
                        }(n) || function(e, t) {
                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != a) {
                                var i = [],
                                    o = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), i.length !== t); o = !0);
                                } catch (e) {
                                    l = !0, r = e
                                } finally {
                                    try {
                                        o || null == a.return || a.return()
                                    } finally {
                                        if (l) throw r
                                    }
                                }
                                return i
                            }
                        }(n, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return to(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return to(e, t)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        v = p[0],
                        b = p[1],
                        g = (0, A.useRef)(void 0),
                        h = (0, A.useRef)(void 0),
                        y = (0, A.useRef)(void 0),
                        x = (0, A.useRef)(null),
                        w = null != l ? l : i && o && M().createElement(tn, {
                            size: "Small",
                            variant: "Utility",
                            className: "content-inverse-emphasis",
                            onClick: o,
                            ref: x
                        }, i),
                        j = !!w,
                        S = r.length > 80,
                        O = null == u || u,
                        N = 4e3;
                    j && (N = S ? 1e4 : 7e3);
                    var C = null != d ? d : N,
                        k = (0, A.useCallback)(function() {
                            "exit" !== v && (b("exit"), void 0 !== h.current && (window.clearTimeout(h.current), h.current = void 0), y.current = window.setTimeout(function() {
                                null == s || s()
                            }, 150))
                        }, [s, v]);
                    (0, A.useEffect)(function() {
                        return g.current = window.requestAnimationFrame(function() {
                                b("idle")
                            }),
                            function() {
                                void 0 !== g.current && window.cancelAnimationFrame(g.current)
                            }
                    }, []), (0, A.useEffect)(function() {
                        void 0 !== h.current && (window.clearTimeout(h.current), h.current = void 0), O && "exit" !== v && (h.current = window.setTimeout(function() {
                            k()
                        }, C))
                    }, [C, O, v, k]), (0, A.useEffect)(function() {
                        var e;
                        j && (null == (e = x.current) || e.focus())
                    }, [j]), (0, A.useEffect)(function() {
                        return function() {
                            void 0 !== h.current && window.clearTimeout(h.current), void 0 !== y.current && window.clearTimeout(y.current), void 0 !== g.current && window.cancelAnimationFrame(g.current)
                        }
                    }, []);
                    var P = {
                            position: "fixed",
                            left: "50%",
                            bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                            transform: "translate(-50%, ".concat("idle" === v ? "0" : "120%", ")"),
                            zIndex: "var(--foundation-portal-zindex, 9999)"
                        },
                        R = m.style ? Object.assign(Object.assign({}, P), m.style) : P;
                    return M().createElement("div", Object.assign({
                        ref: t,
                        role: "status",
                        "aria-live": "polite",
                        className: I("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === v ? "ease-standard-in" : "ease-standard-out", f),
                        style: Object.assign(Object.assign({}, R), {
                            transitionDuration: ("exit" === v ? 150 : 200) + "ms",
                            transitionProperty: "transform"
                        })
                    }, m), M().createElement("div", {
                        className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
                    }, a && M().createElement(eH, {
                        name: a,
                        size: "Small",
                        className: "shrink-0 content-inverse-emphasis"
                    }), M().createElement("div", {
                        className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
                    }, r)), M().createElement("div", {
                        className: "flex items-center justify-end gap-small shrink-0"
                    }, w, s && M().createElement(ti, {
                        variant: "Utility",
                        size: "Small",
                        isCircular: !0,
                        className: "content-inverse-emphasis",
                        "aria-label": void 0 === c ? "Dismiss snackbar" : c,
                        onClick: k
                    })))
                }),
                ts = function(e) {
                    var t = e.feedback,
                        n = e.onClose;
                    return t ? (0, O.jsx)(tl, {
                        title: t.message,
                        onClose: n,
                        shouldAutoDismiss: !0
                    }) : null
                };

            function tc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tu(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function td(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        tu(e, t, n[t])
                    })
                }
                return e
            }

            function tf(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || tp(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tm(e) {
                return function(e) {
                    if (Array.isArray(e)) return tc(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || tp(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tp(e, t) {
                if (e) {
                    if ("string" == typeof e) return tc(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tc(e, t)
                }
            }

            function tv(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function tb() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = tv(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : tv(t[e], null)
                        }
                    }
                }
            }

            function tg() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return A.useCallback(tb.apply(void 0, tm(t)), t)
            }

            function th() {
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
                            return td({}, e, r(t)["__scope".concat(a)])
                        }, {});
                        return A.useMemo(function() {
                            return tu({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return a.scopeName = r.scopeName, a
            }

            function ty(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    a = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === a || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function tx(e) {
                var t = A.useRef(e);
                return A.useEffect(function() {
                    t.current = e
                }), A.useMemo(function() {
                    return function() {
                        for (var e, n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(tm(r)))
                    }
                }, [])
            }
            var tw = (null == (y = globalThis) ? void 0 : y.document) ? A.useLayoutEffect : function() {},
                tj = function(e) {
                    var t, n, r, a, i, o, l, s, c, u, d, f, m, p, v = e.present,
                        b = e.children,
                        g = (a = (r = tf(A.useState(), 2))[0], i = r[1], o = A.useRef({}), l = A.useRef(v), s = A.useRef("none"), u = (c = tf((t = v ? "mounted" : "unmounted", n = {
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
                            var r;
                            return null != (r = n[e][t]) ? r : e
                        }, t)), 2))[0], d = c[1], A.useEffect(function() {
                            var e = tS(o.current);
                            s.current = "mounted" === u ? e : "none"
                        }, [u]), tw(function() {
                            var e = o.current,
                                t = l.current;
                            if (t !== v) {
                                var n = s.current,
                                    r = tS(e);
                                v ? d("MOUNT") : "none" === r || "none" === (null == e ? void 0 : e.display) ? d("UNMOUNT") : d(t && n !== r ? "ANIMATION_OUT" : "UNMOUNT"), l.current = v
                            }
                        }, [v, d]), tw(function() {
                            if (a) {
                                var e, t, n = null != (t = a.ownerDocument.defaultView) ? t : window,
                                    r = function(t) {
                                        var r = tS(o.current).includes(t.animationName);
                                        if (t.target === a && r && (d("ANIMATION_END"), !l.current)) {
                                            var i = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", e = n.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = i)
                                            })
                                        }
                                    },
                                    i = function(e) {
                                        e.target === a && (s.current = tS(o.current))
                                    };
                                return a.addEventListener("animationstart", i), a.addEventListener("animationcancel", r), a.addEventListener("animationend", r),
                                    function() {
                                        n.clearTimeout(e), a.removeEventListener("animationstart", i), a.removeEventListener("animationcancel", r), a.removeEventListener("animationend", r)
                                    }
                            }
                            d("ANIMATION_END")
                        }, [a, d]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(u),
                            ref: A.useCallback(function(e) {
                                e && (o.current = getComputedStyle(e)), i(e)
                            }, [])
                        }),
                        h = "function" == typeof b ? b({
                            present: g.isPresent
                        }) : A.Children.only(b),
                        y = tg(g.ref, (p = null == (f = Object.getOwnPropertyDescriptor(h.props, "ref")) ? void 0 : f.get) && "isReactWarning" in p && p.isReactWarning ? h.ref : (p = null == (m = Object.getOwnPropertyDescriptor(h, "ref")) ? void 0 : m.get) && "isReactWarning" in p && p.isReactWarning ? h.props.ref : h.props.ref || h.ref);
                    return "function" == typeof b || g.isPresent ? A.cloneElement(h, {
                        ref: y
                    }) : null
                };

            function tS(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            tj.displayName = "Presence", window.ReactDOM;
            var tO = 0,
                tN = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, A.useRef)();
                    return t.current || (tO += 1, t.current = "".concat(e).concat(tO)), t.current
                };

            function tC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tk(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function tE(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        tk(e, t, n[t])
                    })
                }
                return e
            }

            function tI(e, t) {
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

            function tA(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }

            function tM(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || tR(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tP(e) {
                return function(e) {
                    if (Array.isArray(e)) return tC(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || tR(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tR(e, t) {
                if (e) {
                    if ("string" == typeof e) return tC(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tC(e, t)
                }
            }
            var tT = A.forwardRef(function(e, t) {
                var n = e.children,
                    r = tA(e, ["children"]),
                    a = A.Children.toArray(n),
                    i = a.find(tL);
                if (i) {
                    var o = i.props.children,
                        l = a.map(function(e) {
                            return e === i ? A.Children.count(o) > 1 ? A.Children.only(null) : A.isValidElement(o) ? o.props.children : null : e
                        });
                    return (0, O.jsx)(tD, tI(tE({}, r), {
                        ref: t,
                        children: A.isValidElement(o) ? A.cloneElement(o, void 0, l) : null
                    }))
                }
                return (0, O.jsx)(tD, tI(tE({}, r), {
                    ref: t,
                    children: n
                }))
            });
            tT.displayName = "Slot";
            var tD = A.forwardRef(function(e, t) {
                var n = e.children,
                    r = tA(e, ["children"]);
                if (A.isValidElement(n)) {
                    var a, i, o, l = (o = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in o && o.isReactWarning ? n.ref : (o = null == (i = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : i.get) && "isReactWarning" in o && o.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                        s = function(e, t) {
                            var n = tE({}, t);
                            for (var r in t) ! function(r) {
                                var a = e[r],
                                    i = t[r];
                                /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    i.apply(void 0, tP(t)), a.apply(void 0, tP(t))
                                } : a && (n[r] = a) : "style" === r ? n[r] = tE({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                            }(r);
                            return tE({}, e, n)
                        }(r, n.props);
                    return n.type !== A.Fragment && (s.ref = t ? tb(t, l) : l), A.cloneElement(n, s)
                }
                return A.Children.count(n) > 1 ? A.Children.only(null) : null
            });
            tD.displayName = "SlotClone";
            var tz = function(e) {
                var t = e.children;
                return (0, O.jsx)(O.Fragment, {
                    children: t
                })
            };

            function tL(e) {
                return A.isValidElement(e) && e.type === tz
            }
            var t_ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = A.forwardRef(function(e, n) {
                        var r = e.asChild,
                            a = tA(e, ["asChild"]),
                            i = r ? tT : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, O.jsx)(i, tI(tE({}, a), {
                            ref: n
                        }))
                    });
                    return n.displayName = "Primitive.".concat(t), tI(tE({}, e), tk({}, t, n))
                }, {}),
                tU = "Checkbox",
                tF = tM(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        n = [],
                        r = function() {
                            var t = n.map(function(e) {
                                return A.createContext(e)
                            });
                            return function(n) {
                                var r = (null == n ? void 0 : n[e]) || t;
                                return A.useMemo(function() {
                                    var t, a;
                                    return tu({}, "__scope".concat(e), (t = td({}, n), a = null != (a = tu({}, e, r)) ? a : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(a)) : (function(e, t) {
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
                        var a = A.createContext(r),
                            i = n.length;
                        n = tm(n).concat([r]);
                        var o = function(t) {
                            var n, r = t.scope,
                                o = t.children,
                                l = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, a = function(e, t) {
                                        if (null == e) return {};
                                        var n, r, a = {},
                                            i = Object.keys(e);
                                        for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                        return a
                                    }(e, t);
                                    if (Object.getOwnPropertySymbols) {
                                        var i = Object.getOwnPropertySymbols(e);
                                        for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                                    }
                                    return a
                                }(t, ["scope", "children"]),
                                s = (null == r || null == (n = r[e]) ? void 0 : n[i]) || a,
                                c = A.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, O.jsx)(s.Provider, {
                                value: c,
                                children: o
                            })
                        };
                        return o.displayName = t + "Provider", [o, function(n, o) {
                            var l, s = (null == o || null == (l = o[e]) ? void 0 : l[i]) || a,
                                c = A.useContext(s);
                            if (c) return c;
                            if (void 0 !== r) return r;
                            throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                        }]
                    }, th.apply(void 0, [r].concat(tm(t)))]
                }(tU), 2),
                tB = tF[0],
                tW = (tF[1], tM(tB(tU), 2)),
                tV = tW[0],
                tH = tW[1],
                tX = A.forwardRef(function(e, t) {
                    var n, r, a, i, o, l, s, c, u, d, f, m, p, v, b, g, h, y = e.__scopeCheckbox,
                        x = e.name,
                        w = e.checked,
                        j = e.defaultChecked,
                        S = e.required,
                        N = e.disabled,
                        C = e.value,
                        k = void 0 === C ? "on" : C,
                        E = e.onCheckedChange,
                        I = e.form,
                        M = tA(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]),
                        P = tM(A.useState(null), 2),
                        R = P[0],
                        T = P[1],
                        D = tg(t, function(e) {
                            return T(e)
                        }),
                        z = A.useRef(!1),
                        L = !R || I || !!R.closest("form"),
                        _ = tM((r = (n = {
                            prop: w,
                            defaultProp: j,
                            onChange: E
                        }).prop, p = (m = tf((l = (o = {
                            defaultProp: n.defaultProp,
                            onChange: i = void 0 === (a = n.onChange) ? function() {} : a
                        }).defaultProp, s = o.onChange, u = tf(c = A.useState(l), 1)[0], d = A.useRef(u), f = tx(s), A.useEffect(function() {
                            d.current !== u && (f(u), d.current = u)
                        }, [u, d, f]), c), 2))[0], v = m[1], g = (b = void 0 !== r) ? r : p, h = tx(i), [g, A.useCallback(function(e) {
                            if (b) {
                                var t = "function" == typeof e ? e(r) : e;
                                t !== r && h(t)
                            } else v(e)
                        }, [b, r, v, h])]), 2),
                        U = _[0],
                        F = void 0 !== U && U,
                        B = _[1],
                        W = A.useRef(F);
                    return A.useEffect(function() {
                        var e = null == R ? void 0 : R.form;
                        if (e) {
                            var t = function() {
                                return B(W.current)
                            };
                            return e.addEventListener("reset", t),
                                function() {
                                    return e.removeEventListener("reset", t)
                                }
                        }
                    }, [R, B]), (0, O.jsxs)(tV, {
                        scope: y,
                        state: F,
                        disabled: N,
                        children: [(0, O.jsx)(t_.button, tI(tE({
                            type: "button",
                            role: "checkbox",
                            "aria-checked": tG(F) ? "mixed" : F,
                            "aria-required": S,
                            "data-state": tK(F),
                            "data-disabled": N ? "" : void 0,
                            disabled: N,
                            value: k
                        }, M), {
                            ref: D,
                            onKeyDown: ty(e.onKeyDown, function(e) {
                                "Enter" === e.key && e.preventDefault()
                            }),
                            onClick: ty(e.onClick, function(e) {
                                B(function(e) {
                                    return !!tG(e) || !e
                                }), L && (z.current = e.isPropagationStopped(), z.current || e.stopPropagation())
                            })
                        })), L && (0, O.jsx)(tq, {
                            control: R,
                            bubbles: !z.current,
                            name: x,
                            value: k,
                            checked: F,
                            required: S,
                            disabled: N,
                            form: I,
                            style: {
                                transform: "translateX(-100%)"
                            },
                            defaultChecked: !tG(j) && j
                        })]
                    })
                });
            tX.displayName = tU;
            var tZ = "CheckboxIndicator",
                t$ = A.forwardRef(function(e, t) {
                    var n = e.__scopeCheckbox,
                        r = e.forceMount,
                        a = tA(e, ["__scopeCheckbox", "forceMount"]),
                        i = tH(tZ, n);
                    return (0, O.jsx)(tj, {
                        present: r || tG(i.state) || !0 === i.state,
                        children: (0, O.jsx)(t_.span, tI(tE({
                            "data-state": tK(i.state),
                            "data-disabled": i.disabled ? "" : void 0
                        }, a), {
                            ref: t,
                            style: tE({
                                pointerEvents: "none"
                            }, e.style)
                        }))
                    })
                });
            t$.displayName = tZ;
            var tq = function(e) {
                var t, n, r, a, i = e.control,
                    o = e.checked,
                    l = e.bubbles,
                    s = void 0 === l || l,
                    c = e.defaultChecked,
                    u = tA(e, ["control", "checked", "bubbles", "defaultChecked"]),
                    d = A.useRef(null),
                    f = (t = A.useRef({
                        value: o,
                        previous: o
                    }), A.useMemo(function() {
                        return t.current.value !== o && (t.current.previous = t.current.value, t.current.value = o), t.current.previous
                    }, [o])),
                    m = (r = (n = tf(A.useState(void 0), 2))[0], a = n[1], tw(function() {
                        if (i) {
                            a({
                                width: i.offsetWidth,
                                height: i.offsetHeight
                            });
                            var e = new ResizeObserver(function(e) {
                                if (Array.isArray(e) && e.length) {
                                    var t, n, r = e[0];
                                    if ("borderBoxSize" in r) {
                                        var o = r.borderBoxSize,
                                            l = Array.isArray(o) ? o[0] : o;
                                        t = l.inlineSize, n = l.blockSize
                                    } else t = i.offsetWidth, n = i.offsetHeight;
                                    a({
                                        width: t,
                                        height: n
                                    })
                                }
                            });
                            return e.observe(i, {
                                    box: "border-box"
                                }),
                                function() {
                                    return e.unobserve(i)
                                }
                        }
                        a(void 0)
                    }, [i]), r);
                A.useEffect(function() {
                    var e = d.current,
                        t = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
                    if (f !== o && t) {
                        var n = new Event("click", {
                            bubbles: s
                        });
                        e.indeterminate = tG(o), t.call(e, !tG(o) && o), e.dispatchEvent(n)
                    }
                }, [f, o, s]);
                var p = A.useRef(!tG(o) && o);
                return (0, O.jsx)("input", tI(tE({
                    type: "checkbox",
                    "aria-hidden": !0,
                    defaultChecked: null != c ? c : p.current
                }, u), {
                    tabIndex: -1,
                    ref: d,
                    style: tI(tE({}, e.style, m), {
                        position: "absolute",
                        pointerEvents: "none",
                        opacity: 0,
                        margin: 0
                    })
                }))
            };

            function tG(e) {
                return "indeterminate" === e
            }

            function tK(e) {
                return tG(e) ? "indeterminate" : e ? "checked" : "unchecked"
            }
            var tY = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                tJ = {
                    XSmall: "",
                    Small: "",
                    Medium: "",
                    Large: "padding-y-xxsmall"
                },
                tQ = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                t0 = {
                    XSmall: "",
                    Small: "padding-top-xxsmall",
                    Medium: "padding-top-xxsmall",
                    Large: "padding-top-xxsmall"
                },
                t1 = function(e) {
                    var t = e.label,
                        n = e.className,
                        r = e.isChecked,
                        a = e.isDisabled,
                        i = e.size,
                        o = e.hint,
                        l = e.placement,
                        s = e.onCheckedChange,
                        c = E(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange"]),
                        u = tN(),
                        d = t && M().createElement("label", {
                            htmlFor: u,
                            className: "flex flex-col grow-1 gap-xsmall"
                        }, M().createElement("span", {
                            className: I(tQ[i], t0[i], "content-emphasis")
                        }, t), o && M().createElement("span", {
                            className: "text-body-medium content-default"
                        }, o));
                    return M().createElement("div", {
                        className: I("foundation-web-checkbox flex gap-medium", a && e8, n)
                    }, "End" === l && d, M().createElement("div", {
                        className: I(tJ[i])
                    }, M().createElement(tX, Object.assign({
                        "data-slot": "checkbox",
                        className: I(tY[i], e4, "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                        id: u,
                        checked: r,
                        disabled: a,
                        onCheckedChange: s,
                        "aria-label": t
                    }, c), M().createElement(e3, null), M().createElement(t$, {
                        "data-slot": "checkbox-indicator",
                        className: I(tY[i], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
                    }))), "Start" === l && d)
                },
                t2 = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                t5 = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-500"
                },
                t4 = {
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
                t3 = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                t8 = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                t7 = {
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
                t6 = {
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
                t9 = (0, A.forwardRef)(function(e, t) {
                    var n = e.className,
                        r = e.icon,
                        a = e.ariaLabel,
                        i = e.isDisabled,
                        o = void 0 !== i && i,
                        l = e.isCircular,
                        s = e.size,
                        c = void 0 === s ? "Large" : s,
                        u = e.variant,
                        d = void 0 === u ? "Emphasis" : u,
                        f = e.iconColor,
                        m = void 0 === f ? "Default" : f,
                        p = e.asChild,
                        v = e.children,
                        b = E(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "size", "variant", "iconColor", "asChild", "children"]),
                        g = I("foundation-web-icon-button", o ? e8 : [e4, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", t2[c], t4[c][void 0 !== l && l ? "circular" : "square"], o ? t8[d] : t3[d], n),
                        h = M().createElement(M().Fragment, null, M().createElement(e3, null), M().createElement("span", {
                            className: I("icon", r, t5[c], o ? t6[m][d] : t7[m][d])
                        }));
                    if (p) {
                        var y = E(b, ["as"]),
                            x = M().Children.only(v);
                        return M().createElement(e1, Object.assign({
                            ref: t
                        }, y, {
                            className: g,
                            "aria-label": a,
                            "aria-disabled": o || void 0
                        }), M().cloneElement(x, {}, h))
                    }
                    if ("a" === b.as) {
                        b.as;
                        var w = b.href,
                            j = E(b, ["as", "href"]);
                        return M().createElement("a", Object.assign({
                            ref: t
                        }, j, {
                            "aria-label": a,
                            "aria-disabled": o,
                            href: o ? void 0 : w,
                            className: g
                        }), h)
                    }
                    var S = E(b, ["as"]);
                    return M().createElement("button", Object.assign({
                        ref: t,
                        type: "button"
                    }, S, {
                        "aria-label": a,
                        disabled: o,
                        className: g
                    }), h)
                }),
                ne = function(e) {
                    var t = e.currentPage,
                        n = e.totalPages,
                        r = e.onChangePage,
                        a = (0, k.useTranslation)().translate;
                    return n <= 1 ? null : (0, O.jsxs)("div", {
                        className: "flex items-center gap-xsmall justify-end",
                        children: [(0, O.jsx)(t9, {
                            icon: "icon-filled-chevron-small-left",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: t <= 1,
                            ariaLabel: a("Action.FirstPage"),
                            onClick: function() {
                                r(1)
                            }
                        }), (0, O.jsx)(t9, {
                            icon: "icon-filled-chevron-small-left",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: t <= 1,
                            ariaLabel: a("Action.Previous"),
                            onClick: function() {
                                r(t - 1)
                            }
                        }), (0, O.jsxs)("span", {
                            className: "text-body-large content-muted padding-x-small",
                            children: [t, " / ", n]
                        }), (0, O.jsx)(t9, {
                            icon: "icon-filled-chevron-small-right",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: t >= n,
                            ariaLabel: a("Action.Next"),
                            onClick: function() {
                                r(t + 1)
                            }
                        }), (0, O.jsx)(t9, {
                            icon: "icon-filled-chevron-small-right",
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
                nt = function(e) {
                    var t = e.activeTab,
                        n = e.moduleState,
                        r = e.selectedCount,
                        a = e.totalCount,
                        i = e.currentPage,
                        o = e.totalPages,
                        l = e.onToggleSelectAll,
                        s = e.onMarkArchive,
                        c = e.onMarkRead,
                        u = e.onBack,
                        d = e.onChangePage,
                        f = (0, k.useTranslation)().translate,
                        m = t === z,
                        p = t === U;
                    return t === L || t === _ ? n === F ? (0, O.jsx)("div", {
                        className: "flex justify-end margin-y-medium",
                        children: (0, O.jsx)(ne, {
                            currentPage: i,
                            totalPages: o,
                            onChangePage: d
                        })
                    }) : (0, O.jsx)("div", {
                        className: "margin-y-medium",
                        children: (0, O.jsx)(tn, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: u,
                            children: f("Action.Back")
                        })
                    }) : n === B ? (0, O.jsxs)("div", {
                        className: "flex items-center gap-small margin-y-medium",
                        children: [(0, O.jsx)(tn, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: u,
                            children: f("Action.Back")
                        }), m ? (0, O.jsx)(tn, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                s(!0)
                            },
                            children: f("Action.Archive")
                        }) : null, p ? (0, O.jsx)(tn, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                s(!1)
                            },
                            children: f("Action.MoveToInbox")
                        }) : null]
                    }) : (0, O.jsxs)("div", {
                        className: "flex items-center justify-between gap-medium margin-y-medium wrap",
                        children: [(0, O.jsxs)("div", {
                            className: "flex items-center gap-small wrap",
                            children: [(0, O.jsx)("div", {
                                className: "padding-left-large",
                                children: (0, O.jsx)(t1, {
                                    label: f("Label.All"),
                                    size: "Medium",
                                    placement: "Start",
                                    isChecked: a > 0 && r === a,
                                    onCheckedChange: l
                                })
                            }), (0, O.jsxs)("div", {
                                className: "private-message-action-buttons flex items-center gap-small wrap",
                                children: [m ? (0, O.jsx)(tn, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        s(!0)
                                    },
                                    children: f("Action.Archive")
                                }) : null, p ? (0, O.jsx)(tn, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        s(!1)
                                    },
                                    children: f("Action.MoveToInbox")
                                }) : null, (0, O.jsx)(tn, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        c(!0)
                                    },
                                    children: f("Action.MarkAsRead")
                                }), (0, O.jsx)(tn, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        c(!1)
                                    },
                                    children: f("Action.MarkAsUnread")
                                })]
                            })]
                        }), (0, O.jsx)(ne, {
                            currentPage: i,
                            totalPages: o,
                            onChangePage: d
                        })]
                    })
                },
                nn = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                nr = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                },
                na = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                ni = {
                    XSmall: "padding-y-small",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-small"
                },
                no = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                nl = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                ns = M().forwardRef(function(e, t) {
                    var n, r = e.size,
                        a = e.variant,
                        i = void 0 === a ? "Standard" : a,
                        o = e.label,
                        l = e.value,
                        s = e.defaultValue,
                        c = e.isDisabled,
                        u = e.hasError,
                        d = e.helperText,
                        f = e.className,
                        m = e.style,
                        p = e.textareaClassName,
                        v = e.textareaStyle,
                        b = E(e, ["size", "variant", "label", "value", "defaultValue", "isDisabled", "hasError", "helperText", "className", "style", "textareaClassName", "textareaStyle"]),
                        g = tN(),
                        h = "".concat(g, "-description"),
                        y = null != r ? r : "Large";
                    return M().createElement("div", {
                        className: I("flex fill flex-col width-full gap-small", (e8 in (n = {}) ? Object.defineProperty(n, e8, {
                            value: c,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : n[e8] = c, n), f),
                        style: m
                    }, o && M().createElement("label", {
                        htmlFor: g,
                        className: I(no[y], "content-emphasis")
                    }, o), M().createElement("textarea", Object.assign({
                        ref: t,
                        id: g,
                        "data-testid": "text-area-container",
                        style: v,
                        className: I("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", nn[i], nr[i], {
                            "stroke-system-alert": u,
                            "stroke-contrast-alpha": !u
                        }, nl[y], na[y], ni[y], p),
                        value: l,
                        defaultValue: null == l ? s : void 0,
                        disabled: c,
                        "aria-describedby": d ? h : void 0
                    }, b)), d && M().createElement("span", {
                        id: h,
                        className: I("text-caption-small", {
                            "content-system-alert": u,
                            "content-default": !u
                        })
                    }, d))
                });
            ns.displayName = "TextArea";
            var nc = window.RobloxBadges,
                nu = window.RobloxThumbnails,
                nd = n(942),
                nf = n.n(nd),
                nm = function(e) {
                    var t = e.className;
                    return (0, O.jsxs)("span", {
                        "aria-hidden": "true",
                        className: nf()("flex items-center justify-center", t),
                        children: [(0, O.jsx)("img", {
                            alt: "",
                            src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjMzkzYjNkIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+",
                            className: "dark:hidden",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        }), (0, O.jsx)("img", {
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
                np = function(e) {
                    var t = e.message,
                        n = e.activeTab,
                        r = n === L ? t.recipient : t.sender,
                        a = n !== L && 1 === t.sender.id;
                    return (0, O.jsx)("a", {
                        href: r.profileLink,
                        className: "size-800 shrink-0 flex items-center justify-center",
                        children: a ? (0, O.jsx)(nm, {
                            className: "size-800"
                        }) : (0, O.jsx)("span", {
                            className: "radius-small clip size-800",
                            children: (0, O.jsx)(nu.Thumbnail2d, {
                                targetId: r.id,
                                type: nu.ThumbnailTypes.avatarHeadshot,
                                altName: r.displayName
                            })
                        })
                    })
                },
                nv = function(e) {
                    var t = e.message,
                        n = e.activeTab,
                        r = e.sendReplyState,
                        a = e.onReplyContentChange,
                        i = e.onIncludePreviousMessageChange,
                        o = e.onSendReply,
                        l = (0, k.useTranslation)().translate;
                    if (!t) return null;
                    var s = n === L ? t.recipient : t.sender,
                        c = n === z && !t.isSystemMessage;
                    return (0, O.jsxs)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large",
                        children: [(0, O.jsxs)("div", {
                            className: "flex justify-between gap-medium",
                            children: [(0, O.jsxs)("div", {
                                className: "min-width-0",
                                children: [(0, O.jsx)("h2", {
                                    className: "text-heading-medium content-emphasis margin-none text-wrap",
                                    children: t.subject
                                }), (0, O.jsxs)("div", {
                                    className: "flex gap-small margin-top-medium",
                                    children: [(0, O.jsx)(np, {
                                        message: t,
                                        activeTab: n
                                    }), (0, O.jsxs)("div", {
                                        className: "min-width-0 flex flex-col gap-y-small",
                                        children: [(0, O.jsxs)("a", {
                                            href: s.profileLink,
                                            className: "text-title-medium content-emphasis flex items-center gap-xsmall",
                                            children: [(0, O.jsx)("span", {
                                                children: s.displayName
                                            }), s.hasVerifiedBadge ? (0, O.jsx)(nc.VerifiedBadgeIconContainer, {
                                                size: nc.BadgeSizes.CAPTIONHEADER
                                            }) : null]
                                        }), (0, O.jsxs)("div", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", s.name]
                                        }), (0, O.jsx)("div", {
                                            className: "text-caption-medium content-muted",
                                            children: ea(t.created)
                                        })]
                                    })]
                                })]
                            }), t.isReportAbuseDisplayed ? (0, O.jsx)("a", {
                                href: t.abuseReportUrl,
                                className: "text-body-medium content-muted text-no-wrap abuse-report-modal",
                                children: l("Action.ReportAbuse")
                            }) : null]
                        }), (0, O.jsx)("div", {
                            className: "private-message-body text-body-large content-default margin-top-large",
                            dangerouslySetInnerHTML: {
                                __html: t.body
                            }
                        }), c ? (0, O.jsxs)("div", {
                            className: "margin-top-large",
                            children: [(0, O.jsx)(ns, {
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
                            }), (0, O.jsxs)("div", {
                                className: "flex items-center justify-between gap-medium wrap margin-top-medium",
                                children: [(0, O.jsx)("span", {
                                    className: "text-caption-medium content-muted",
                                    children: l("Message.IdTheftWarning")
                                }), (0, O.jsxs)("div", {
                                    className: "flex items-center gap-medium wrap",
                                    children: [(0, O.jsx)(t1, {
                                        label: l("Label.IncludeMessage"),
                                        size: "Medium",
                                        placement: "End",
                                        isChecked: r.includePreviousMessage,
                                        onCheckedChange: function(e) {
                                            i(!0 === e)
                                        }
                                    }), (0, O.jsx)(tn, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        isDisabled: 0 === r.replyContent.length || r.isSending,
                                        isLoading: r.isSending,
                                        onClick: o,
                                        children: l("Action.SendReply")
                                    })]
                                })]
                            })]
                        }) : null]
                    })
                },
                nb = function(e) {
                    var t = e.message,
                        n = e.activeTab === L ? t.recipient : t.sender;
                    return (0, O.jsxs)("span", {
                        className: "flex items-center gap-xsmall min-width-0",
                        children: [(0, O.jsx)("span", {
                            className: "text-truncate-end",
                            children: n.displayName
                        }), n.hasVerifiedBadge ? (0, O.jsx)(nc.VerifiedBadgeIconContainer, {
                            size: nc.BadgeSizes.CAPTIONHEADER
                        }) : null, (0, O.jsxs)("span", {
                            className: "text-body-medium content-muted text-truncate-end",
                            children: ["@", n.name]
                        })]
                    })
                },
                ng = function(e) {
                    var t = e.message,
                        n = e.activeTab,
                        r = e.onOpen,
                        a = n === L ? t.recipient : t.sender,
                        i = n !== L && 1 === t.sender.id;
                    return (0, O.jsx)("button", {
                        type: "button",
                        className: "private-message-row-avatar bg-none stroke-none padding-none width-full size-800 flex items-center justify-center",
                        onClick: r,
                        "aria-label": a.displayName,
                        children: i ? (0, O.jsx)(nm, {
                            className: "size-700"
                        }) : (0, O.jsx)("span", {
                            className: "radius-small clip size-700",
                            children: (0, O.jsx)(nu.Thumbnail2d, {
                                targetId: a.id,
                                type: nu.ThumbnailTypes.avatarHeadshot,
                                altName: a.displayName
                            })
                        })
                    })
                },
                nh = function(e) {
                    var t = e.message,
                        n = e.index,
                        r = e.activeTab,
                        a = e.isSelected,
                        i = e.isSelectable,
                        o = e.onToggleSelection,
                        l = e.onOpen,
                        s = function() {
                            l(t, n)
                        };
                    return (0, O.jsxs)("div", {
                        className: nf()("private-message-row grid items-center gap-medium padding-large stroke-bottom stroke-muted transition-colors", t.isRead || r === L ? "bg-surface-100 hover:bg-surface-300" : "bg-surface-200 hover:bg-surface-300"),
                        children: [(0, O.jsx)("div", {
                            className: nf()(!i && "invisible"),
                            children: (0, O.jsx)(t1, {
                                "aria-label": t.subject,
                                size: "Medium",
                                placement: "Start",
                                isChecked: a,
                                onCheckedChange: function() {
                                    o(t.id)
                                }
                            })
                        }), (0, O.jsx)(ng, {
                            message: t,
                            activeTab: r,
                            onOpen: s
                        }), (0, O.jsxs)("button", {
                            type: "button",
                            className: "bg-none stroke-none padding-none text-left min-width-0 flex flex-col gap-y-small",
                            onClick: s,
                            "aria-label": t.subject,
                            children: [(0, O.jsxs)("div", {
                                className: "flex items-center justify-between gap-small min-width-0",
                                children: [(0, O.jsx)("span", {
                                    className: "text-title-large content-emphasis min-width-0",
                                    children: (0, O.jsx)(nb, {
                                        message: t,
                                        activeTab: r
                                    })
                                }), (0, O.jsx)("span", {
                                    className: "text-caption-medium content-muted text-no-wrap",
                                    children: er(t.created)
                                })]
                            }), (0, O.jsxs)("div", {
                                className: "private-message-row-preview text-body-large content-muted",
                                children: [(0, O.jsx)("span", {
                                    className: "content-emphasis",
                                    children: t.subject
                                }), (0, O.jsxs)("span", {
                                    children: [" - ", et(t.body)]
                                })]
                            })]
                        })]
                    })
                };

            function ny(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var nx = (ny(x = {}, z, "Label.NoMessagesInInbox"), ny(x, L, "Label.NoSentMessages"), ny(x, _, "Message.NoNews"), ny(x, U, "Label.NoMessagesInArchive"), x),
                nw = function(e) {
                    var t, n = e.page,
                        r = e.activeTab,
                        a = e.selectedMessageIds,
                        i = e.onToggleSelection,
                        o = e.onOpenMessage,
                        l = (0, k.useTranslation)().translate,
                        s = null != (t = null == n ? void 0 : n.collection) ? t : [];
                    return 0 === s.length ? (0, O.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: l(nx[r])
                    }) : (0, O.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: s.map(function(e, t) {
                            return (0, O.jsx)(nh, {
                                message: e,
                                index: t,
                                activeTab: r,
                                isSelected: a.has(e.id),
                                isSelectable: r !== L && r !== _,
                                onToggleSelection: i,
                                onOpen: o
                            }, e.id)
                        })
                    })
                };

            function nj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var nS = function(e) {
                    var t, n = e.notification,
                        r = (t = (0, A.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != a) {
                                var i = [],
                                    o = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), i.length !== t); o = !0);
                                } catch (e) {
                                    l = !0, r = e
                                } finally {
                                    try {
                                        o || null == a.return || a.return()
                                    } finally {
                                        if (l) throw r
                                    }
                                }
                                return i
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return nj(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nj(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        a = r[0],
                        i = r[1],
                        o = 1 === n.sender.id;
                    return (0, O.jsx)("button", {
                        type: "button",
                        className: nf()("width-full stroke-none stroke-bottom stroke-muted padding-medium text-left transition-colors", a ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        onClick: function() {
                            i(function(e) {
                                return !e
                            })
                        },
                        "aria-expanded": a,
                        "aria-label": n.subject,
                        children: (0, O.jsxs)("div", {
                            className: "flex gap-small",
                            children: [(0, O.jsx)("span", {
                                className: "size-700 shrink-0 flex items-center justify-center",
                                children: o ? (0, O.jsx)(nm, {
                                    className: "size-700"
                                }) : (0, O.jsx)("span", {
                                    className: "radius-small clip size-700",
                                    children: (0, O.jsx)(nu.Thumbnail2d, {
                                        targetId: n.sender.id,
                                        type: nu.ThumbnailTypes.avatarHeadshot,
                                        altName: n.sender.displayName
                                    })
                                })
                            }), (0, O.jsxs)("span", {
                                className: "min-width-0 fill flex flex-col gap-y-small",
                                children: [(0, O.jsxs)("span", {
                                    className: "flex justify-between gap-small",
                                    children: [(0, O.jsxs)("span", {
                                        className: "text-title-medium content-emphasis flex items-center gap-xsmall min-width-0",
                                        children: [(0, O.jsx)("span", {
                                            className: "text-truncate-end",
                                            children: n.sender.displayName
                                        }), n.sender.hasVerifiedBadge ? (0, O.jsx)(nc.VerifiedBadgeIconContainer, {
                                            size: nc.BadgeSizes.CAPTIONHEADER
                                        }) : null, (0, O.jsxs)("span", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", n.sender.name]
                                        })]
                                    }), (0, O.jsx)("span", {
                                        className: "text-caption-medium content-muted text-no-wrap",
                                        children: er(n.created)
                                    })]
                                }), (0, O.jsx)("span", {
                                    className: "private-message-row-preview text-body-large content-default",
                                    children: n.subject
                                }), a ? (0, O.jsx)("span", {
                                    className: "private-message-body block text-body-medium content-default margin-top-medium",
                                    dangerouslySetInnerHTML: {
                                        __html: n.body
                                    }
                                }) : null]
                            })]
                        })
                    })
                },
                nO = function(e) {
                    var t, n = e.page,
                        r = (0, k.useTranslation)().translate,
                        a = null != (t = null == n ? void 0 : n.collection) ? t : [];
                    return 0 === a.length ? (0, O.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: r("Message.NoNews")
                    }) : (0, O.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: a.map(function(e) {
                            return (0, O.jsx)(nS, {
                                notification: e
                            }, e.id)
                        })
                    })
                };

            function nN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var nC = (null == (w = globalThis) ? void 0 : w.document) ? A.useLayoutEffect : function() {},
                nk = A[" useId ".trim().toString()] || function() {},
                nE = 0;

            function nI(e) {
                var t, n = (t = A.useState(nk()), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != a) {
                            var i = [],
                                o = !0,
                                l = !1;
                            try {
                                for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), i.length !== t); o = !0);
                            } catch (e) {
                                l = !0, r = e
                            } finally {
                                try {
                                    o || null == a.return || a.return()
                                } finally {
                                    if (l) throw r
                                }
                            }
                            return i
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return nN(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nN(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    r = n[0],
                    a = n[1];
                return nC(function() {
                    e || a(function(e) {
                        return null != e ? e : String(nE++)
                    })
                }, [e]), e || (r ? "radix-".concat(r) : "")
            }
            var nA = A.createContext(void 0);

            function nM(e) {
                var t = A.useContext(nA);
                return e || t || "ltr"
            }

            function nP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function nR(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function nT(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        nR(e, t, n[t])
                    })
                }
                return e
            }

            function nD(e, t) {
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

            function nz(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }

            function nL(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || nU(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n_(e) {
                return function(e) {
                    if (Array.isArray(e)) return nP(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || nU(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nU(e, t) {
                if (e) {
                    if ("string" == typeof e) return nP(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nP(e, t)
                }
            }

            function nF(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    a = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === a || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function nB(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    n = [],
                    r = function() {
                        var t = n.map(function(e) {
                            return A.createContext(e)
                        });
                        return function(n) {
                            var r = (null == n ? void 0 : n[e]) || t;
                            return A.useMemo(function() {
                                return nR({}, "__scope".concat(e), nD(nT({}, n), nR({}, e, r)))
                            }, [n, r])
                        }
                    };
                return r.scopeName = e, [function(t, r) {
                    var a = A.createContext(r),
                        i = n.length;
                    n = n_(n).concat([r]);
                    var o = function(t) {
                        var n, r = t.scope,
                            o = t.children,
                            l = nz(t, ["scope", "children"]),
                            s = (null == r || null == (n = r[e]) ? void 0 : n[i]) || a,
                            c = A.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, O.jsx)(s.Provider, {
                            value: c,
                            children: o
                        })
                    };
                    return o.displayName = t + "Provider", [o, function(n, o) {
                        var l, s = (null == o || null == (l = o[e]) ? void 0 : l[i]) || a,
                            c = A.useContext(s);
                        if (c) return c;
                        if (void 0 !== r) return r;
                        throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                    }]
                }, nW.apply(void 0, [r].concat(n_(t)))]
            }

            function nW() {
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
                            return nT({}, e, r(t)["__scope".concat(a)])
                        }, {});
                        return A.useMemo(function() {
                            return nR({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return a.scopeName = r.scopeName, a
            }

            function nV(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function nH() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = nV(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : nV(t[e], null)
                        }
                    }
                }
            }

            function nX() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return A.useCallback(nH.apply(void 0, n_(t)), t)
            }

            function nZ(e) {
                var t, n, r = (t = e, (n = A.forwardRef(function(e, t) {
                        var n = e.children,
                            r = nz(e, ["children"]);
                        if (A.isValidElement(n)) {
                            var a, i, o, l = (o = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in o && o.isReactWarning ? n.ref : (o = null == (i = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : i.get) && "isReactWarning" in o && o.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                                s = function(e, t) {
                                    var n = nT({}, t);
                                    for (var r in t) ! function(r) {
                                        var a = e[r],
                                            i = t[r];
                                        /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            var r = i.apply(void 0, n_(t));
                                            return a.apply(void 0, n_(t)), r
                                        } : a && (n[r] = a) : "style" === r ? n[r] = nT({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                                    }(r);
                                    return nT({}, e, n)
                                }(r, n.props);
                            return n.type !== A.Fragment && (s.ref = t ? nH(t, l) : l), A.cloneElement(n, s)
                        }
                        return A.Children.count(n) > 1 ? A.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    a = A.forwardRef(function(e, t) {
                        var n = e.children,
                            a = nz(e, ["children"]),
                            i = A.Children.toArray(n),
                            o = i.find(nq);
                        if (o) {
                            var l = o.props.children,
                                s = i.map(function(e) {
                                    return e === o ? A.Children.count(l) > 1 ? A.Children.only(null) : A.isValidElement(l) ? l.props.children : null : e
                                });
                            return (0, O.jsx)(r, nD(nT({}, a), {
                                ref: t,
                                children: A.isValidElement(l) ? A.cloneElement(l, void 0, s) : null
                            }))
                        }
                        return (0, O.jsx)(r, nD(nT({}, a), {
                            ref: t,
                            children: n
                        }))
                    });
                return a.displayName = "".concat(e, ".Slot"), a
            }
            var n$ = Symbol("radix.slottable");

            function nq(e) {
                return A.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === n$
            }
            var nG = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = nZ("Primitive.".concat(t)),
                        r = A.forwardRef(function(e, r) {
                            var a = e.asChild,
                                i = nz(e, ["asChild"]),
                                o = a ? n : t;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, O.jsx)(o, nD(nT({}, i), {
                                ref: r
                            }))
                        });
                    return r.displayName = "Primitive.".concat(t), nD(nT({}, e), nR({}, t, r))
                }, {}),
                nK = (null == (j = globalThis) ? void 0 : j.document) ? A.useLayoutEffect : function() {},
                nY = A[" useInsertionEffect ".trim().toString()] || nK,
                nJ = "rovingFocusGroup.onEntryFocus",
                nQ = {
                    bubbles: !1,
                    cancelable: !0
                },
                n0 = "RovingFocusGroup",
                n1 = (o = (i = nL(nB(a = n0 + "CollectionProvider"), 2))[0], l = i[1], c = (s = nL(o(a, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], u = s[1], (d = function(e) {
                    var t = e.scope,
                        n = e.children,
                        r = M().useRef(null),
                        a = M().useRef(new Map).current;
                    return (0, O.jsx)(c, {
                        scope: t,
                        itemMap: a,
                        collectionRef: r,
                        children: n
                    })
                }).displayName = a, m = nZ(f = n0 + "CollectionSlot"), (p = M().forwardRef(function(e, t) {
                    var n = e.scope,
                        r = e.children,
                        a = nX(t, u(f, n).collectionRef);
                    return (0, O.jsx)(m, {
                        ref: a,
                        children: r
                    })
                })).displayName = f, b = "data-radix-collection-item", g = nZ(v = n0 + "CollectionItemSlot"), (h = M().forwardRef(function(e, t) {
                    var n, r = e.scope,
                        a = e.children,
                        i = nz(e, ["scope", "children"]),
                        o = M().useRef(null),
                        l = nX(t, o),
                        s = u(v, r);
                    return M().useEffect(function() {
                        return s.itemMap.set(o, nT({
                                ref: o
                            }, i)),
                            function() {
                                s.itemMap.delete(o)
                            }
                    }), (0, O.jsx)(g, (nR(n = {}, b, ""), nR(n, "ref", l), nR(n, "children", a), n))
                })).displayName = v, [{
                    Provider: d,
                    Slot: p,
                    ItemSlot: h
                }, function(e) {
                    var t = u(n0 + "CollectionConsumer", e);
                    return M().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var n = Array.from(e.querySelectorAll("[".concat(b, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return n.indexOf(e.ref.current) - n.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, l]),
                n2 = nL(n1, 3),
                n5 = n2[0],
                n4 = n2[1],
                n3 = nL(nB(n0, [n2[2]]), 2),
                n8 = n3[0],
                n7 = n3[1],
                n6 = nL(n8(n0), 2),
                n9 = n6[0],
                re = n6[1],
                rt = A.forwardRef(function(e, t) {
                    return (0, O.jsx)(n5.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, O.jsx)(n5.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, O.jsx)(rn, nD(nT({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            rt.displayName = n0;
            var rn = A.forwardRef(function(e, t) {
                    var n, r, a, i, o, l, s, c, u, d, f, m, p, v, b, g, h, y, x, w, j, S = e.__scopeRovingFocusGroup,
                        N = e.orientation,
                        C = e.loop,
                        k = e.dir,
                        E = e.currentTabStopId,
                        I = e.defaultCurrentTabStopId,
                        M = e.onCurrentTabStopIdChange,
                        P = e.onEntryFocus,
                        R = e.preventScrollOnEntryFocus,
                        T = void 0 !== R && R,
                        D = nz(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        z = A.useRef(null),
                        L = nX(t, z),
                        _ = nM(k),
                        U = nL((r = (n = {
                            prop: E,
                            defaultProp: null != I ? I : null,
                            onChange: M,
                            caller: n0
                        }).prop, a = n.defaultProp, i = n.onChange, o = n.caller, b = (v = nL((s = (l = {
                            defaultProp: a,
                            onChange: void 0 === i ? function() {} : i
                        }).defaultProp, c = l.onChange, d = (u = nL(A.useState(s), 2))[0], f = u[1], m = A.useRef(d), p = A.useRef(c), nY(function() {
                            p.current = c
                        }, [c]), A.useEffect(function() {
                            var e;
                            m.current !== d && (null == (e = p.current) || e.call(p, d), m.current = d)
                        }, [d, m]), [d, f, p]), 3))[0], g = v[1], h = v[2], x = (y = void 0 !== r) ? r : b, w = A.useRef(void 0 !== r), A.useEffect(function() {
                            var e = w.current;
                            if (e !== y) {
                                var t = y ? "controlled" : "uncontrolled";
                                console.warn("".concat(o, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                            }
                            w.current = y
                        }, [y, o]), [x, A.useCallback(function(e) {
                            if (y) {
                                var t, n = "function" == typeof e ? e(r) : e;
                                n !== r && (null == (t = h.current) || t.call(h, n))
                            } else g(e)
                        }, [y, r, g, h])]), 2),
                        F = U[0],
                        B = U[1],
                        W = nL(A.useState(!1), 2),
                        V = W[0],
                        H = W[1],
                        X = (j = A.useRef(P), A.useEffect(function() {
                            j.current = P
                        }), A.useMemo(function() {
                            return function() {
                                for (var e, t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                return null == (e = j.current) ? void 0 : e.call.apply(e, [j].concat(n_(n)))
                            }
                        }, [])),
                        Z = n4(S),
                        $ = A.useRef(!1),
                        q = nL(A.useState(0), 2),
                        G = q[0],
                        K = q[1];
                    return A.useEffect(function() {
                        var e = z.current;
                        if (e) return e.addEventListener(nJ, X),
                            function() {
                                return e.removeEventListener(nJ, X)
                            }
                    }, [X]), (0, O.jsx)(n9, {
                        scope: S,
                        orientation: N,
                        dir: _,
                        loop: void 0 !== C && C,
                        currentTabStopId: F,
                        onItemFocus: A.useCallback(function(e) {
                            return B(e)
                        }, [B]),
                        onItemShiftTab: A.useCallback(function() {
                            return H(!0)
                        }, []),
                        onFocusableItemAdd: A.useCallback(function() {
                            return K(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: A.useCallback(function() {
                            return K(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, O.jsx)(nG.div, nD(nT({
                            tabIndex: V || 0 === G ? -1 : 0,
                            "data-orientation": N
                        }, D), {
                            ref: L,
                            style: nT({
                                outline: "none"
                            }, e.style),
                            onMouseDown: nF(e.onMouseDown, function() {
                                $.current = !0
                            }),
                            onFocus: nF(e.onFocus, function(e) {
                                var t = !$.current;
                                if (e.target === e.currentTarget && t && !V) {
                                    var n = new CustomEvent(nJ, nQ);
                                    if (e.currentTarget.dispatchEvent(n), !n.defaultPrevented) {
                                        var r = Z().filter(function(e) {
                                            return e.focusable
                                        });
                                        ro([r.find(function(e) {
                                            return e.active
                                        }), r.find(function(e) {
                                            return e.id === F
                                        })].concat(n_(r)).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), T)
                                    }
                                }
                                $.current = !1
                            }),
                            onBlur: nF(e.onBlur, function() {
                                return H(!1)
                            })
                        }))
                    })
                }),
                rr = "RovingFocusGroupItem",
                ra = A.forwardRef(function(e, t) {
                    var n = e.__scopeRovingFocusGroup,
                        r = e.focusable,
                        a = void 0 === r || r,
                        i = e.active,
                        o = e.tabStopId,
                        l = e.children,
                        s = nz(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        c = nI(),
                        u = o || c,
                        d = re(rr, n),
                        f = d.currentTabStopId === u,
                        m = n4(n),
                        p = d.onFocusableItemAdd,
                        v = d.onFocusableItemRemove,
                        b = d.currentTabStopId;
                    return A.useEffect(function() {
                        if (a) return p(),
                            function() {
                                return v()
                            }
                    }, [a, p, v]), (0, O.jsx)(n5.ItemSlot, {
                        scope: n,
                        id: u,
                        focusable: a,
                        active: void 0 !== i && i,
                        children: (0, O.jsx)(nG.span, nD(nT({
                            tabIndex: f ? 0 : -1,
                            "data-orientation": d.orientation
                        }, s), {
                            ref: t,
                            onMouseDown: nF(e.onMouseDown, function(e) {
                                a ? d.onItemFocus(u) : e.preventDefault()
                            }),
                            onFocus: nF(e.onFocus, function() {
                                return d.onItemFocus(u)
                            }),
                            onKeyDown: nF(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void d.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t, n, r, a, i, o, l = (t = d.orientation, n = d.dir, r = e.key, a = "rtl" !== n ? r : "ArrowLeft" === r ? "ArrowRight" : "ArrowRight" === r ? "ArrowLeft" : r, "vertical" === t && ["ArrowLeft", "ArrowRight"].includes(a) || "horizontal" === t && ["ArrowUp", "ArrowDown"].includes(a) ? void 0 : ri[a]);
                                    if (void 0 !== l) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var s = m().filter(function(e) {
                                            return e.focusable
                                        }).map(function(e) {
                                            return e.ref.current
                                        });
                                        if ("last" === l) s.reverse();
                                        else if ("prev" === l || "next" === l) {
                                            "prev" === l && s.reverse();
                                            var c = s.indexOf(e.currentTarget);
                                            s = d.loop ? (o = c + 1, (i = s).map(function(e, t) {
                                                return i[(o + t) % i.length]
                                            })) : s.slice(c + 1)
                                        }
                                        setTimeout(function() {
                                            return ro(s)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof l ? l({
                                isCurrentTabStop: f,
                                hasTabStop: null != b
                            }) : l
                        }))
                    })
                });
            ra.displayName = rr;
            var ri = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function ro(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    n = document.activeElement,
                    r = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var o, l = e[Symbol.iterator](); !(r = (o = l.next()).done); r = !0) {
                        var s = o.value;
                        if (s === n || (s.focus({
                                preventScroll: t
                            }), document.activeElement !== n)) return
                    }
                } catch (e) {
                    a = !0, i = e
                } finally {
                    try {
                        r || null == l.return || l.return()
                    } finally {
                        if (a) throw i
                    }
                }
            }

            function rl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rs(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function rc(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        rs(e, t, n[t])
                    })
                }
                return e
            }

            function ru(e, t) {
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

            function rd(e, t) {
                if (null == e) return {};
                var n, r, a = function(e, t) {
                    if (null == e) return {};
                    var n, r, a = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                    return a
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                }
                return a
            }

            function rf(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || rp(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rm(e) {
                return function(e) {
                    if (Array.isArray(e)) return rl(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || rp(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rp(e, t) {
                if (e) {
                    if ("string" == typeof e) return rl(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rl(e, t)
                }
            }

            function rv(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    a = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === a || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function rb() {
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
                            return rc({}, e, r(t)["__scope".concat(a)])
                        }, {});
                        return A.useMemo(function() {
                            return rs({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return a.scopeName = r.scopeName, a
            }

            function rg(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rh() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = rg(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : rg(t[e], null)
                        }
                    }
                }
            }
            var ry = (null == (S = globalThis) ? void 0 : S.document) ? A.useLayoutEffect : function() {},
                rx = function(e) {
                    var t, n, r, a, i, o, l, s, c, u, d, f, m, p, v = e.present,
                        b = e.children,
                        g = (a = (r = rf(A.useState(), 2))[0], i = r[1], o = A.useRef(null), l = A.useRef(v), s = A.useRef("none"), u = (c = rf((t = v ? "mounted" : "unmounted", n = {
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
                            var r;
                            return null != (r = n[e][t]) ? r : e
                        }, t)), 2))[0], d = c[1], A.useEffect(function() {
                            var e = rw(o.current);
                            s.current = "mounted" === u ? e : "none"
                        }, [u]), ry(function() {
                            var e = o.current,
                                t = l.current;
                            if (t !== v) {
                                var n = s.current,
                                    r = rw(e);
                                v ? d("MOUNT") : "none" === r || "none" === (null == e ? void 0 : e.display) ? d("UNMOUNT") : d(t && n !== r ? "ANIMATION_OUT" : "UNMOUNT"), l.current = v
                            }
                        }, [v, d]), ry(function() {
                            if (a) {
                                var e, t, n = null != (t = a.ownerDocument.defaultView) ? t : window,
                                    r = function(t) {
                                        var r = rw(o.current).includes(CSS.escape(t.animationName));
                                        if (t.target === a && r && (d("ANIMATION_END"), !l.current)) {
                                            var i = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", e = n.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = i)
                                            })
                                        }
                                    },
                                    i = function(e) {
                                        e.target === a && (s.current = rw(o.current))
                                    };
                                return a.addEventListener("animationstart", i), a.addEventListener("animationcancel", r), a.addEventListener("animationend", r),
                                    function() {
                                        n.clearTimeout(e), a.removeEventListener("animationstart", i), a.removeEventListener("animationcancel", r), a.removeEventListener("animationend", r)
                                    }
                            }
                            d("ANIMATION_END")
                        }, [a, d]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(u),
                            ref: A.useCallback(function(e) {
                                o.current = e ? getComputedStyle(e) : null, i(e)
                            }, [])
                        }),
                        h = "function" == typeof b ? b({
                            present: g.isPresent
                        }) : A.Children.only(b),
                        y = function() {
                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                            return A.useCallback(rh.apply(void 0, rm(t)), t)
                        }(g.ref, (p = null == (f = Object.getOwnPropertyDescriptor(h.props, "ref")) ? void 0 : f.get) && "isReactWarning" in p && p.isReactWarning ? h.ref : (p = null == (m = Object.getOwnPropertyDescriptor(h, "ref")) ? void 0 : m.get) && "isReactWarning" in p && p.isReactWarning ? h.props.ref : h.props.ref || h.ref);
                    return "function" == typeof b || g.isPresent ? A.cloneElement(h, {
                        ref: y
                    }) : null
                };

            function rw(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            rx.displayName = "Presence";
            var rj = Symbol("radix.slottable");

            function rS(e) {
                return A.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rj
            }
            var rO = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                    var n, r, a, i, o, l = (r = n = "Primitive.".concat(t), (a = A.forwardRef(function(e, t) {
                            var n = e.children,
                                r = rd(e, ["children"]);
                            if (A.isValidElement(n)) {
                                var a, i, o, l = (o = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in o && o.isReactWarning ? n.ref : (o = null == (i = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : i.get) && "isReactWarning" in o && o.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                                    s = function(e, t) {
                                        var n = rc({}, t);
                                        for (var r in t) ! function(r) {
                                            var a = e[r],
                                                i = t[r];
                                            /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                                var r = i.apply(void 0, rm(t));
                                                return a.apply(void 0, rm(t)), r
                                            } : a && (n[r] = a) : "style" === r ? n[r] = rc({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                                        }(r);
                                        return rc({}, e, n)
                                    }(r, n.props);
                                return n.type !== A.Fragment && (s.ref = t ? rh(t, l) : l), A.cloneElement(n, s)
                            }
                            return A.Children.count(n) > 1 ? A.Children.only(null) : null
                        })).displayName = "".concat(r, ".SlotClone"), i = a, (o = A.forwardRef(function(e, t) {
                            var n = e.children,
                                r = rd(e, ["children"]),
                                a = A.Children.toArray(n),
                                o = a.find(rS);
                            if (o) {
                                var l = o.props.children,
                                    s = a.map(function(e) {
                                        return e === o ? A.Children.count(l) > 1 ? A.Children.only(null) : A.isValidElement(l) ? l.props.children : null : e
                                    });
                                return (0, O.jsx)(i, ru(rc({}, r), {
                                    ref: t,
                                    children: A.isValidElement(l) ? A.cloneElement(l, void 0, s) : null
                                }))
                            }
                            return (0, O.jsx)(i, ru(rc({}, r), {
                                ref: t,
                                children: n
                            }))
                        })).displayName = "".concat(n, ".Slot"), o),
                        s = A.forwardRef(function(e, n) {
                            var r = e.asChild,
                                a = rd(e, ["asChild"]),
                                i = r ? l : t;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, O.jsx)(i, ru(rc({}, a), {
                                ref: n
                            }))
                        });
                    return s.displayName = "Primitive.".concat(t), ru(rc({}, e), rs({}, t, s))
                }, {}),
                rN = A[" useInsertionEffect ".trim().toString()] || ry,
                rC = "Tabs",
                rk = rf(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        n = [],
                        r = function() {
                            var t = n.map(function(e) {
                                return A.createContext(e)
                            });
                            return function(n) {
                                var r = (null == n ? void 0 : n[e]) || t;
                                return A.useMemo(function() {
                                    return rs({}, "__scope".concat(e), ru(rc({}, n), rs({}, e, r)))
                                }, [n, r])
                            }
                        };
                    return r.scopeName = e, [function(t, r) {
                        var a = A.createContext(r),
                            i = n.length;
                        n = rm(n).concat([r]);
                        var o = function(t) {
                            var n, r = t.scope,
                                o = t.children,
                                l = rd(t, ["scope", "children"]),
                                s = (null == r || null == (n = r[e]) ? void 0 : n[i]) || a,
                                c = A.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, O.jsx)(s.Provider, {
                                value: c,
                                children: o
                            })
                        };
                        return o.displayName = t + "Provider", [o, function(n, o) {
                            var l, s = (null == o || null == (l = o[e]) ? void 0 : l[i]) || a,
                                c = A.useContext(s);
                            if (c) return c;
                            if (void 0 !== r) return r;
                            throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                        }]
                    }, rb.apply(void 0, [r].concat(rm(t)))]
                }(rC, [n7]), 2),
                rE = rk[0],
                rI = (rk[1], n7()),
                rA = rf(rE(rC), 2),
                rM = rA[0],
                rP = rA[1],
                rR = A.forwardRef(function(e, t) {
                    var n, r, a, i, o, l, s, c, u, d, f, m, p, v, b, g, h, y, x, w, j = e.__scopeTabs,
                        S = e.value,
                        N = e.onValueChange,
                        C = e.defaultValue,
                        k = e.orientation,
                        E = void 0 === k ? "horizontal" : k,
                        I = e.dir,
                        M = e.activationMode,
                        P = rd(e, ["__scopeTabs", "value", "onValueChange", "defaultValue", "orientation", "dir", "activationMode"]),
                        R = nM(I),
                        T = rf((r = (n = {
                            prop: S,
                            onChange: N,
                            defaultProp: null != C ? C : "",
                            caller: rC
                        }).prop, a = n.defaultProp, i = n.onChange, o = n.caller, b = (v = rf((s = (l = {
                            defaultProp: a,
                            onChange: void 0 === i ? function() {} : i
                        }).defaultProp, c = l.onChange, d = (u = rf(A.useState(s), 2))[0], f = u[1], m = A.useRef(d), p = A.useRef(c), rN(function() {
                            p.current = c
                        }, [c]), A.useEffect(function() {
                            var e;
                            m.current !== d && (null == (e = p.current) || e.call(p, d), m.current = d)
                        }, [d, m]), [d, f, p]), 3))[0], g = v[1], h = v[2], x = (y = void 0 !== r) ? r : b, w = A.useRef(void 0 !== r), A.useEffect(function() {
                            var e = w.current;
                            if (e !== y) {
                                var t = y ? "controlled" : "uncontrolled";
                                console.warn("".concat(o, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                            }
                            w.current = y
                        }, [y, o]), [x, A.useCallback(function(e) {
                            if (y) {
                                var t, n = "function" == typeof e ? e(r) : e;
                                n !== r && (null == (t = h.current) || t.call(h, n))
                            } else g(e)
                        }, [y, r, g, h])]), 2),
                        D = T[0],
                        z = T[1];
                    return (0, O.jsx)(rM, {
                        scope: j,
                        baseId: nI(),
                        value: D,
                        onValueChange: z,
                        orientation: E,
                        dir: R,
                        activationMode: void 0 === M ? "automatic" : M,
                        children: (0, O.jsx)(rO.div, ru(rc({
                            dir: R,
                            "data-orientation": E
                        }, P), {
                            ref: t
                        }))
                    })
                });
            rR.displayName = rC;
            var rT = "TabsList",
                rD = A.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.loop,
                        a = rd(e, ["__scopeTabs", "loop"]),
                        i = rP(rT, n),
                        o = rI(n);
                    return (0, O.jsx)(rt, ru(rc({
                        asChild: !0
                    }, o), {
                        orientation: i.orientation,
                        dir: i.dir,
                        loop: void 0 === r || r,
                        children: (0, O.jsx)(rO.div, ru(rc({
                            role: "tablist",
                            "aria-orientation": i.orientation
                        }, a), {
                            ref: t
                        }))
                    }))
                });
            rD.displayName = rT;
            var rz = "TabsTrigger",
                rL = A.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.value,
                        a = e.disabled,
                        i = void 0 !== a && a,
                        o = rd(e, ["__scopeTabs", "value", "disabled"]),
                        l = rP(rz, n),
                        s = rI(n),
                        c = rF(l.baseId, r),
                        u = rB(l.baseId, r),
                        d = r === l.value;
                    return (0, O.jsx)(ra, ru(rc({
                        asChild: !0
                    }, s), {
                        focusable: !i,
                        active: d,
                        children: (0, O.jsx)(rO.button, ru(rc({
                            type: "button",
                            role: "tab",
                            "aria-selected": d,
                            "aria-controls": u,
                            "data-state": d ? "active" : "inactive",
                            "data-disabled": i ? "" : void 0,
                            disabled: i,
                            id: c
                        }, o), {
                            ref: t,
                            onMouseDown: rv(e.onMouseDown, function(e) {
                                i || 0 !== e.button || !1 !== e.ctrlKey ? e.preventDefault() : l.onValueChange(r)
                            }),
                            onKeyDown: rv(e.onKeyDown, function(e) {
                                [" ", "Enter"].includes(e.key) && l.onValueChange(r)
                            }),
                            onFocus: rv(e.onFocus, function() {
                                var e = "manual" !== l.activationMode;
                                d || i || !e || l.onValueChange(r)
                            })
                        }))
                    }))
                });
            rL.displayName = rz;
            var r_ = "TabsContent",
                rU = A.forwardRef(function(e, t) {
                    var n = e.__scopeTabs,
                        r = e.value,
                        a = e.forceMount,
                        i = e.children,
                        o = rd(e, ["__scopeTabs", "value", "forceMount", "children"]),
                        l = rP(r_, n),
                        s = rF(l.baseId, r),
                        c = rB(l.baseId, r),
                        u = r === l.value,
                        d = A.useRef(u);
                    return A.useEffect(function() {
                        var e = requestAnimationFrame(function() {
                            return d.current = !1
                        });
                        return function() {
                            return cancelAnimationFrame(e)
                        }
                    }, []), (0, O.jsx)(rx, {
                        present: a || u,
                        children: function(n) {
                            var r = n.present;
                            return (0, O.jsx)(rO.div, ru(rc({
                                "data-state": u ? "active" : "inactive",
                                "data-orientation": l.orientation,
                                role: "tabpanel",
                                "aria-labelledby": s,
                                hidden: !r,
                                id: c,
                                tabIndex: 0
                            }, o), {
                                ref: t,
                                style: ru(rc({}, e.style), {
                                    animationDuration: d.current ? "0s" : void 0
                                }),
                                children: r && i
                            }))
                        }
                    })
                });

            function rF(e, t) {
                return "".concat(e, "-trigger-").concat(t)
            }

            function rB(e, t) {
                return "".concat(e, "-content-").concat(t)
            }
            rU.displayName = r_;
            var rW = (0, A.createContext)({
                    size: "Medium",
                    variant: "Contained",
                    fitBehavior: "Fill"
                }),
                rV = {
                    XSmall: ["text-label-small", "height-700"],
                    Small: ["text-label-small", "height-800"],
                    Medium: ["text-label-medium", "height-1000"],
                    Large: ["text-label-medium", "height-1200"]
                },
                rH = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-small",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                rX = {
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
                r$ = (0, A.forwardRef)(function(e, t) {
                    var n = e.children,
                        r = e.className,
                        a = e.size,
                        i = e.variant,
                        o = e.fitBehavior,
                        l = E(e, ["children", "className", "size", "variant", "fitBehavior"]),
                        s = (0, A.useMemo)(function() {
                            return {
                                size: a || "Large",
                                variant: i || "Contained",
                                fitBehavior: o || "Fill"
                            }
                        }, [a, i, o]);
                    return M().createElement(rW.Provider, {
                        value: s
                    }, M().createElement(rR, Object.assign({
                        ref: t
                    }, l, {
                        className: I("foundation-web-tabs", "flex flex-col", r)
                    }), n))
                }),
                rq = (0, A.forwardRef)(function(e, t) {
                    var n = e.children,
                        r = e.className,
                        a = E(e, ["children", "className"]),
                        i = (0, A.useRef)(null),
                        o = rf((0, A.useState)({
                            width: 0,
                            left: 0,
                            opacity: 0
                        }), 2),
                        l = o[0],
                        s = o[1],
                        c = M().useCallback(function(e) {
                            (i.current = e, "function" == typeof t) ? t(e): t && "current" in t && (t.current = e)
                        }, [t]);
                    return (0, A.useEffect)(function() {
                        var e, t = function() {
                            var e, t = i.current;
                            if (t) {
                                var n = t.querySelector('[data-state="active"]');
                                if (n) {
                                    var r = t.getBoundingClientRect(),
                                        a = n.getBoundingClientRect();
                                    s({
                                        width: a.width,
                                        left: a.left - r.left,
                                        opacity: 1
                                    }), null == (e = n.scrollIntoView) || e.call(n, {
                                        behavior: "smooth",
                                        block: "nearest",
                                        inline: "nearest"
                                    })
                                }
                            }
                        };
                        t();
                        var n = new MutationObserver(function() {
                                cancelAnimationFrame(e), e = requestAnimationFrame(t)
                            }),
                            r = "undefined" != typeof ResizeObserver ? new ResizeObserver(t) : null,
                            a = i.current;
                        return a && (n.observe(a, {
                                subtree: !0,
                                attributes: !0,
                                attributeFilter: ["data-state"]
                            }), null == r || r.observe(a)), window.addEventListener("resize", t),
                            function() {
                                cancelAnimationFrame(e), n.disconnect(), null == r || r.disconnect(), window.removeEventListener("resize", t)
                            }
                    }, [n]), M().createElement("div", {
                        className: I("relative scroll-x", r),
                        style: {
                            scrollbarWidth: "none",
                            msOverflowStyle: "none"
                        }
                    }, M().createElement(rD, Object.assign({
                        ref: c
                    }, a, {
                        className: I("flex items-stretch bg-none border-0 stroke-none")
                    }), n), M().createElement("div", {
                        className: "absolute bottom-[0px] bg-system-contrast transition-all duration-200 ease-standard-out",
                        style: {
                            height: "var(--stroke-thick)",
                            zIndex: 1,
                            width: "".concat(l.width, "px"),
                            left: "".concat(l.left, "px"),
                            opacity: l.opacity
                        }
                    }))
                }),
                rG = (0, A.forwardRef)(function(e, t) {
                    var n = e.children,
                        r = e.className,
                        a = e.isDisabled,
                        i = void 0 !== a && a,
                        o = E(e, ["children", "className", "isDisabled"]),
                        l = (0, A.useContext)(rW),
                        s = l.size,
                        c = l.variant,
                        u = l.fitBehavior;
                    return M().createElement(rL, Object.assign({
                        ref: t
                    }, o, {
                        disabled: i,
                        style: {
                            borderBottom: "var(--stroke-thick) solid var(--color-stroke-muted)",
                            borderTop: "none",
                            borderLeft: "none",
                            borderRight: "none"
                        },
                        className: I("relative flex items-center justify-center cursor-pointer bg-none shrink-0", e4, rV[s], "Fill" === u ? "grow-1 ".concat(rH[s]) : "", rX[s][c], rZ[s], i && e8, r)
                    }), M().createElement(e3, null), M().createElement("div", {
                        className: "flex items-center justify-center height-600 relative"
                    }, n))
                });
            (0, A.forwardRef)(function(e, t) {
                var n = e.children,
                    r = e.className,
                    a = E(e, ["children", "className"]);
                return M().createElement(rU, Object.assign({
                    ref: t
                }, a, {
                    className: I("padding-top-large", "outline-none", r)
                }), n)
            });
            var rK = {
                    Neutral: "bg-shift-300",
                    Contrast: "bg-system-contrast",
                    Success: "bg-system-success",
                    Warning: "bg-system-warning",
                    Alert: "bg-system-alert",
                    OverMedia: "bg-[var(--light-mode-surface-100)]"
                },
                rY = {
                    Neutral: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Success: "content-[var(--light-mode-content-emphasis)]",
                    Warning: "content-[var(--light-mode-content-emphasis)]",
                    Alert: "content-[var(--dark-mode-content-emphasis)]",
                    OverMedia: "content-[var(--light-mode-content-emphasis)]"
                },
                rJ = {
                    Neutral: "stroke-none",
                    Contrast: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-standard"
                },
                rQ = M().forwardRef(function(e, t) {
                    var n = e.className,
                        r = e.label,
                        a = e.variant,
                        i = void 0 === a ? "Neutral" : a,
                        o = e.icon,
                        l = E(e, ["className", "label", "variant", "icon"]),
                        s = o && !r;
                    return M().createElement("div", Object.assign({
                        ref: t
                    }, l, {
                        className: I("foundation-web-badge flex items-center radius-circle select-none height-600 gap-xsmall", s ? "width-600 justify-center" : "width-[fit-content] padding-x-small", rK[i], rY[i], rJ[i], n),
                        style: {
                            borderColor: "var(--light-mode-stroke-default)"
                        }
                    }), o && M().createElement(eH, {
                        name: o,
                        size: "XSmall"
                    }), r && M().createElement("span", {
                        className: I("padding-y-xsmall text-no-wrap text-truncate-split text-label-small", rY[i])
                    }, r))
                });
            rQ.displayName = "Badge";
            var r0 = function(e) {
                    var t = e.activeTab,
                        n = e.tabs,
                        r = e.onSelectTab;
                    return (0, O.jsx)(r$, {
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
                        children: (0, O.jsx)(rq, {
                            children: n.map(function(e) {
                                return (0, O.jsx)(rG, {
                                    value: e.name,
                                    children: (0, O.jsxs)("span", {
                                        className: "flex items-center justify-center gap-small",
                                        children: [(0, O.jsx)("span", {
                                            children: e.label
                                        }), e.count ? (0, O.jsx)(rQ, {
                                            label: String(e.count),
                                            variant: "Contrast"
                                        }) : null]
                                    })
                                }, e.name)
                            })
                        })
                    })
                },
                r1 = function() {
                    var e, t, n, r, a, i = (0, k.useTranslation)().translate,
                        o = eW({
                            translate: i
                        }),
                        l = (null == (e = (0, D.getDeviceMeta)()) ? void 0 : e.isInApp) === !0,
                        s = o.page ? o.page.pageNumber + 1 : o.route.page,
                        c = null != (r = null == (t = o.page) ? void 0 : t.totalPages) ? r : 1,
                        u = null != (a = null == (n = o.page) ? void 0 : n.collection.length) ? a : 0;
                    return (0, O.jsxs)("main", {
                        className: "private-message-page margin-x-auto padding-medium",
                        children: [l ? null : (0, O.jsx)("h1", {
                            className: "text-heading-large content-emphasis margin-top-none margin-bottom-medium",
                            children: i("Heading.Message")
                        }), (0, O.jsx)(r0, {
                            activeTab: o.route.tab,
                            tabs: o.tabs,
                            onSelectTab: o.openTab
                        }), (0, O.jsx)(nt, {
                            activeTab: o.route.tab,
                            moduleState: o.moduleState,
                            selectedCount: o.selectedMessageIds.size,
                            totalCount: u,
                            currentPage: s,
                            totalPages: c,
                            onToggleSelectAll: o.toggleSelectAll,
                            onMarkArchive: function(e) {
                                o.markArchive(e)
                            },
                            onMarkRead: function(e) {
                                o.markRead(e)
                            },
                            onBack: o.backToList,
                            onChangePage: o.changePage
                        }), o.loading ? (0, O.jsx)("div", {
                            className: "flex justify-center padding-xxlarge",
                            children: (0, O.jsx)(T, {
                                ariaLabel: i("Label.Loading"),
                                variant: "Indeterminate",
                                size: "Medium"
                            })
                        }) : null, !o.loading && o.error ? (0, O.jsx)("div", {
                            className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-large content-system-alert",
                            children: o.error
                        }) : null, o.loading || o.error || o.moduleState !== F ? null : o.route.tab === _ ? (0, O.jsx)(nO, {
                            page: o.page
                        }) : (0, O.jsx)(nw, {
                            page: o.page,
                            activeTab: o.route.tab,
                            selectedMessageIds: o.selectedMessageIds,
                            onToggleSelection: o.toggleMessageSelection,
                            onOpenMessage: function(e, t) {
                                o.openMessage(e, t)
                            }
                        }), o.loading || o.error || o.moduleState !== B ? null : (0, O.jsx)(nv, {
                            message: o.selectedMessage,
                            activeTab: o.route.tab,
                            sendReplyState: o.sendReplyState,
                            onReplyContentChange: o.updateReplyContent,
                            onIncludePreviousMessageChange: o.updateIncludePreviousMessage,
                            onSendReply: function() {
                                o.sendReply()
                            }
                        }), (0, O.jsx)(ts, {
                            feedback: o.feedback,
                            onClose: o.dismissFeedback
                        })]
                    })
                },
                r2 = JSON.parse('{"P":["Feature.Messages"]}');
            n(781);
            var r5 = function() {
                var e;
                return null != (e = document.getElementById("private-message")) ? e : document.getElementById("private-message-web-app")
            };
            C()(function() {
                var e = r5();
                e && ("private-message-web-app" === e.id && e.classList.add("messages-container"), (0, k.renderWithErrorBoundary)((0, O.jsx)(k.TranslationProvider, {
                    config: r2.P,
                    children: (0, O.jsx)(r1, {})
                }), e))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PrivateMessage");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/privateMessage-5db2f71c0aedc5cc.js.map