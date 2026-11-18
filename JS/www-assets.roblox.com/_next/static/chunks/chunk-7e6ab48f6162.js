;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "405101bf-f507-2c3e-51a8-298b316e11b0")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 131810, e => {
    "use strict";
    let t = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    e.s(["DEBUG_BUILD", 0, t])
}, 10955, 64583, 204078, e => {
    "use strict";
    let t = "10.50.0";
    e.s(["SDK_VERSION", 0, t], 64583);
    let n = globalThis;

    function r(e) {
        let n = e.__SENTRY__ = e.__SENTRY__ || {};
        return n.version = n.version || t, n[t] = n[t] || {}
    }
    e.s(["GLOBAL_OBJ", 0, n], 204078), e.s(["getGlobalSingleton", 0, function(e, r) {
        let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : n,
            a = i.__SENTRY__ = i.__SENTRY__ || {},
            s = a[t] = a[t] || {};
        return s[e] || (s[e] = r())
    }, "getMainCarrier", 0, function() {
        return r(n), n
    }, "getSentryCarrier", 0, r], 10955)
}, 695524, e => {
    "use strict";
    var t = e.i(10955),
        n = e.i(131810),
        r = e.i(204078);
    let i = {};

    function a(e) {
        if (!("console" in r.GLOBAL_OBJ)) return e();
        let t = r.GLOBAL_OBJ.console,
            n = {},
            a = Object.keys(i);
        a.forEach(e => {
            let r = i[e];
            n[e] = t[e], t[e] = r
        });
        try {
            return e()
        } finally {
            a.forEach(e => {
                t[e] = n[e]
            })
        }
    }

    function s() {
        return c().enabled
    }

    function o(e) {
        for (var t = arguments.length, i = Array(t > 1 ? t - 1 : 0), o = 1; o < t; o++) i[o - 1] = arguments[o];
        n.DEBUG_BUILD && s() && a(() => {
            r.GLOBAL_OBJ.console[e](`Sentry Logger [${e}]:`, ...i)
        })
    }

    function c() {
        return n.DEBUG_BUILD ? (0, t.getGlobalSingleton)("loggerSettings", () => ({
            enabled: !1
        })) : {
            enabled: !1
        }
    }
    e.s(["CONSOLE_LEVELS", 0, ["debug", "info", "warn", "error", "log", "assert", "trace"], "consoleSandbox", 0, a, "debug", 0, {
        enable: function() {
            c().enabled = !0
        },
        disable: function() {
            c().enabled = !1
        },
        isEnabled: s,
        log: function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            o("log", ...t)
        },
        warn: function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            o("warn", ...t)
        },
        error: function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            o("error", ...t)
        }
    }, "originalConsoleMethods", 0, i])
}, 551482, e => {
    "use strict";
    var t = e.i(131810),
        n = e.i(695524);
    let r = /^o(\d+)\./,
        i = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

    function a(e) {
        let t = i.exec(e);
        if (!t) return void(0, n.consoleSandbox)(() => {
            console.error(`Invalid Sentry Dsn: ${e}`)
        });
        let [r, a, o = "", c = "", u = "", p = ""] = t.slice(1), l = "", d = p, _ = d.split("/");
        if (_.length > 1 && (l = _.slice(0, -1).join("/"), d = _.pop()), d) {
            let e = d.match(/^\d+/);
            e && (d = e[0])
        }
        return s({
            host: c,
            pass: o,
            path: l,
            projectId: d,
            port: u,
            protocol: r,
            publicKey: a
        })
    }

    function s(e) {
        return {
            protocol: e.protocol,
            publicKey: e.publicKey || "",
            pass: e.pass || "",
            host: e.host,
            port: e.port || "",
            path: e.path || "",
            projectId: e.projectId
        }
    }
    e.s(["dsnFromString", 0, a, "dsnToString", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            {
                host: n,
                path: r,
                pass: i,
                port: a,
                projectId: s,
                protocol: o,
                publicKey: c
            } = e;
        return `${o}://${c}${t&&i?`:${i}`:""}@${n}${a?`:${a}`:""}/${r?`${r}/`:r}${s}`
    }, "extractOrgIdFromClient", 0, function(e) {
        let t, n = e.getOptions(),
            {
                host: i
            } = e.getDsn() || {};
        if (n.orgId) t = String(n.orgId);
        else {
            let e;
            i && (e = i.match(r), t = e?.[1])
        }
        return t
    }, "makeDsn", 0, function(e) {
        let r = "string" == typeof e ? a(e) : s(e);
        if (r && function(e) {
                if (!t.DEBUG_BUILD) return !0;
                let {
                    port: r,
                    projectId: i,
                    protocol: a
                } = e;
                return !["protocol", "publicKey", "host", "projectId"].find(t => !e[t] && (n.debug.error(`Invalid Sentry Dsn: ${t} missing`), !0)) && (i.match(/^\d+$/) ? "http" !== a && "https" !== a ? (n.debug.error(`Invalid Sentry Dsn: Invalid protocol ${a}`), !1) : !(r && isNaN(parseInt(r, 10))) || (n.debug.error(`Invalid Sentry Dsn: Invalid port ${r}`), !1) : (n.debug.error(`Invalid Sentry Dsn: Invalid projectId ${i}`), !1))
            }(r)) return r
    }])
}, 880985, 59172, e => {
    "use strict";
    let t = Object.prototype.toString;

    function n(e, n) {
        return t.call(e) === `[object ${n}]`
    }

    function r(e) {
        return n(e, "String")
    }

    function i(e) {
        return "object" == typeof e && null !== e && "__sentry_template_string__" in e && "__sentry_template_values__" in e
    }

    function a(e) {
        return n(e, "Object")
    }

    function s(e, t) {
        try {
            return e instanceof t
        } catch {
            return !1
        }
    }
    e.s(["isDOMError", 0, function(e) {
        return n(e, "DOMError")
    }, "isDOMException", 0, function(e) {
        return n(e, "DOMException")
    }, "isElement", 0, function(e) {
        return "u" > typeof Element && s(e, Element)
    }, "isError", 0, function(e) {
        switch (t.call(e)) {
            case "[object Error]":
            case "[object Exception]":
            case "[object DOMException]":
            case "[object WebAssembly.Exception]":
                return !0;
            default:
                return s(e, Error)
        }
    }, "isErrorEvent", 0, function(e) {
        return n(e, "ErrorEvent")
    }, "isEvent", 0, function(e) {
        return "u" > typeof Event && s(e, Event)
    }, "isInstanceOf", 0, s, "isParameterizedString", 0, i, "isPlainObject", 0, a, "isPrimitive", 0, function(e) {
        return null === e || i(e) || "object" != typeof e && "function" != typeof e
    }, "isRegExp", 0, function(e) {
        return n(e, "RegExp")
    }, "isRequest", 0, function(e) {
        return "u" > typeof Request && s(e, Request)
    }, "isString", 0, r, "isSyntheticEvent", 0, function(e) {
        return a(e) && "nativeEvent" in e && "preventDefault" in e && "stopPropagation" in e
    }, "isThenable", 0, function(e) {
        return !!(e?.then && "function" == typeof e.then)
    }, "isVueViewModel", 0, function(e) {
        return !!("object" == typeof e && null !== e && (e.__isVue || e._isVue || e.__v_isVNode))
    }], 59172);
    let o = e.i(204078).GLOBAL_OBJ;
    e.s(["getComponentName", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 5;
        if (!o.HTMLElement) return null;
        let n = e;
        for (let e = 0; e < t && n; e++) {
            if (n instanceof HTMLElement) {
                if (n.dataset.sentryComponent) return n.dataset.sentryComponent;
                if (n.dataset.sentryElement) return n.dataset.sentryElement
            }
            n = n.parentNode
        }
        return null
    }, "getLocationHref", 0, function() {
        try {
            return o.document.location.href
        } catch {
            return ""
        }
    }, "htmlTreeAsString", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (!e) return "<unknown>";
        try {
            let n, i = e,
                a = [],
                s = 0,
                c = 0,
                u = Array.isArray(t) ? t : t.keyAttrs,
                p = !Array.isArray(t) && t.maxStringLength || 80;
            for (; i && s++ < 5 && (n = function(e, t) {
                    let n = [];
                    if (!e?.tagName) return "";
                    if (o.HTMLElement && e instanceof HTMLElement && e.dataset) {
                        if (e.dataset.sentryComponent) return e.dataset.sentryComponent;
                        if (e.dataset.sentryElement) return e.dataset.sentryElement
                    }
                    n.push(e.tagName.toLowerCase());
                    let i = t?.length ? t.filter(t => e.getAttribute(t)).map(t => [t, e.getAttribute(t)]) : null;
                    if (i?.length) i.forEach(e => {
                        n.push(`[${e[0]}="${e[1]}"]`)
                    });
                    else {
                        e.id && n.push(`#${e.id}`);
                        let t = e.className;
                        if (t && r(t))
                            for (let e of t.split(/\s+/)) n.push(`.${e}`)
                    }
                    for (let t of ["aria-label", "type", "name", "title", "alt"]) {
                        let r = e.getAttribute(t);
                        r && n.push(`[${t}="${r}"]`)
                    }
                    return n.join("")
                }(i, u), "html" !== n && (!(s > 1) || !(c + 3 * a.length + n.length >= p)));) a.push(n), c += n.length, i = i.parentNode;
            return a.reverse().join(" > ")
        } catch {
            return "<unknown>"
        }
    }], 880985)
}, 211429, e => {
    "use strict";
    var t = e.i(131810),
        n = e.i(880985),
        r = e.i(695524),
        i = e.i(59172);

    function a(e, n, i) {
        try {
            Object.defineProperty(e, n, {
                value: i,
                writable: !0,
                configurable: !0
            })
        } catch {
            t.DEBUG_BUILD && r.debug.log(`Failed to add non-enumerable property "${n}" to object`, e)
        }
    }

    function s(e, t) {
        try {
            let n = t.prototype || {};
            e.prototype = t.prototype = n, a(e, "__sentry_original__", t)
        } catch {}
    }

    function o(e) {
        if ((0, i.isError)(e)) return {
            message: e.message,
            name: e.name,
            stack: e.stack,
            ...u(e)
        };
        if (!(0, i.isEvent)(e)) return e;
        {
            let t = {
                type: e.type,
                target: c(e.target),
                currentTarget: c(e.currentTarget),
                ...u(e)
            };
            return "u" > typeof CustomEvent && (0, i.isInstanceOf)(e, CustomEvent) && (t.detail = e.detail), t
        }
    }

    function c(e) {
        try {
            return (0, i.isElement)(e) ? (0, n.htmlTreeAsString)(e) : Object.prototype.toString.call(e)
        } catch {
            return "<unknown>"
        }
    }

    function u(e) {
        return "object" == typeof e && null !== e ? Object.fromEntries(Object.entries(e)) : {}
    }
    e.s(["addNonEnumerableProperty", 0, a, "convertToPlainObject", 0, o, "extractExceptionKeysForMessage", 0, function(e) {
        let t = Object.keys(o(e));
        return t.sort(), t[0] ? t.join(", ") : "[object has no keys]"
    }, "fill", 0, function(e, n, i) {
        if (!(n in e)) return;
        let a = e[n];
        if ("function" != typeof a) return;
        let o = i(a);
        "function" == typeof o && s(o, a);
        try {
            e[n] = o
        } catch {
            t.DEBUG_BUILD && r.debug.log(`Failed to replace method "${n}" in object`, e)
        }
    }, "getOriginalFunction", 0, function(e) {
        return e.__sentry_original__
    }, "markFunctionWrapped", 0, s])
}, 140332, e => {
    "use strict";
    let t = /\(error: (.*)\)/,
        n = /captureMessage|captureException/;

    function r() {
        for (var e = arguments.length, r = Array(e), a = 0; a < e; a++) r[a] = arguments[a];
        let s = r.sort((e, t) => e[0] - t[0]).map(e => e[1]);
        return function(e) {
            let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0,
                o = [],
                c = e.split("\n");
            for (let e = r; e < c.length; e++) {
                let n = c[e];
                n.length > 1024 && (n = n.slice(0, 1024));
                let r = t.test(n) ? n.replace(t, "$1") : n;
                if (!r.includes("Error: ")) {
                    for (let e of s) {
                        let t = e(r);
                        if (t) {
                            o.push(t);
                            break
                        }
                    }
                    if (o.length >= 50 + a) break
                }
            }
            var u = o.slice(a);
            if (!u.length) return [];
            let p = Array.from(u);
            return /sentryWrapped/.test(i(p).function || "") && p.pop(), p.reverse(), n.test(i(p).function || "") && (p.pop(), n.test(i(p).function || "") && p.pop()), p.slice(0, 50).map(e => ({
                ...e,
                filename: e.filename || i(p).filename,
                function: e.function || "?"
            }))
        }
    }

    function i(e) {
        return e[e.length - 1] || {}
    }
    let a = "<anonymous>";
    e.s(["UNKNOWN_FUNCTION", 0, "?", "createStackParser", 0, r, "getFramesFromEvent", 0, function(e) {
        let t = e.exception;
        if (t) {
            let e = [];
            try {
                return t.values.forEach(t => {
                    t.stacktrace.frames && e.push(...t.stacktrace.frames)
                }), e
            } catch {}
        }
    }, "getFunctionName", 0, function(e) {
        try {
            if (!e || "function" != typeof e) return a;
            return e.name || a
        } catch {
            return a
        }
    }, "getVueInternalName", 0, function(e) {
        return "__v_isVNode" in e && e.__v_isVNode ? "[VueVNode]" : "[VueViewModel]"
    }, "normalizeStackTracePath", 0, function(e) {
        let t = e?.startsWith("file://") ? e.slice(7) : e;
        return t?.match(/\/[A-Z]:/) && (t = t.slice(1)), t
    }, "stackParserFromStackParserOptions", 0, function(e) {
        return Array.isArray(e) ? r(...e) : e
    }])
}, 227668, 100749, e => {
    "use strict";
    var t = e.i(10955),
        n = e.i(551482),
        r = e.i(59172),
        i = e.i(211429),
        a = e.i(140332);

    function s(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 100,
            s = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Infinity;
        try {
            return function t(n, s) {
                let o, c = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Infinity,
                    u = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : Infinity,
                    p = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : (o = new WeakSet, [function(e) {
                        return !!o.has(e) || (o.add(e), !1)
                    }, function(e) {
                        o.delete(e)
                    }]),
                    [l, d] = p;
                if (null == s || ["boolean", "string"].includes(typeof s) || "number" == typeof s && Number.isFinite(s)) return s;
                let _ = function(t, n) {
                    try {
                        var i;
                        let s;
                        if ("domain" === t && n && "object" == typeof n && n._events) return "[Domain]";
                        if ("domainEmitter" === t) return "[DomainEmitter]";
                        if (n === e.g) return "[Global]";
                        if ("u" > typeof window && n === window) return "[Window]";
                        if ("u" > typeof document && n === document) return "[Document]";
                        if ((0, r.isVueViewModel)(n)) return (0, a.getVueInternalName)(n);
                        if ((0, r.isSyntheticEvent)(n)) return "[SyntheticEvent]";
                        if ("number" == typeof n && !Number.isFinite(n)) return `[${n}]`;
                        if ("function" == typeof n) return `[Function: ${(0,a.getFunctionName)(n)}]`;
                        if ("symbol" == typeof n) return `[${String(n)}]`;
                        if ("bigint" == typeof n) return `[BigInt: ${String(n)}]`;
                        let o = (i = n, s = Object.getPrototypeOf(i), s?.constructor ? s.constructor.name : "null prototype");
                        if (/^HTML(\w*)Element$/.test(o)) return `[HTMLElement: ${o}]`;
                        return `[object ${o}]`
                    } catch (e) {
                        return `**non-serializable** (${e})`
                    }
                }(n, s);
                if (!_.startsWith("[object ")) return _;
                if (s.__sentry_skip_normalization__) return s;
                let g = "number" == typeof s.__sentry_override_normalization_depth__ ? s.__sentry_override_normalization_depth__ : c;
                if (0 === g) return _.replace("object ", "");
                if (l(s)) return "[Circular ~]";
                if (s && "function" == typeof s.toJSON) try {
                    let e = s.toJSON();
                    return t("", e, g - 1, u, p)
                } catch {}
                let S = Array.isArray(s) ? [] : {},
                    f = 0,
                    h = (0, i.convertToPlainObject)(s);
                for (let e in h) {
                    if (!Object.prototype.hasOwnProperty.call(h, e)) continue;
                    if (f >= u) {
                        S[e] = "[MaxProperties ~]";
                        break
                    }
                    let n = h[e];
                    S[e] = t(e, n, g - 1, u, p), f++
                }
                return d(s), S
            }("", t, n, s)
        } catch (e) {
            return {
                ERROR: `**non-serializable** (${e})`
            }
        }
    }
    e.s(["normalize", 0, s, "normalizeToSize", 0, function e(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 3,
            r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 102400,
            i = s(t, n);
        return ~-encodeURI(JSON.stringify(i)).split(/%..|./).length > r ? e(t, n - 1, r) : i
    }], 100749);
    var o = e.i(204078);

    function c(e, t) {
        for (let n of e[1]) {
            let e = n[0].type;
            if (t(n, e)) return !0
        }
        return !1
    }

    function u(e) {
        let n = (0, t.getSentryCarrier)(o.GLOBAL_OBJ);
        return n.encodePolyfill ? n.encodePolyfill(e) : new TextEncoder().encode(e)
    }
    let p = {
        sessions: "session",
        event: "error",
        client_report: "internal",
        user_report: "default",
        profile_chunk: "profile",
        replay_event: "replay",
        replay_recording: "replay",
        check_in: "monitor",
        raw_security: "security",
        log: "log_item",
        trace_metric: "metric"
    };
    e.s(["addItemToEnvelope", 0, function(e, t) {
        let [n, r] = e;
        return [n, [...r, t]]
    }, "createAttachmentEnvelopeItem", 0, function(e) {
        let t = "string" == typeof e.data ? u(e.data) : e.data;
        return [{
            type: "attachment",
            length: t.length,
            filename: e.filename,
            content_type: e.contentType,
            attachment_type: e.attachmentType
        }, t]
    }, "createEnvelope", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
        return [e, t]
    }, "createEventEnvelopeHeaders", 0, function(e, t, r, i) {
        let a = e.sdkProcessingMetadata?.dynamicSamplingContext;
        return {
            event_id: e.event_id,
            sent_at: new Date().toISOString(),
            ...t && {
                sdk: t
            },
            ...!!r && i && {
                dsn: (0, n.dsnToString)(i)
            },
            ...a && {
                trace: a
            }
        }
    }, "createSpanEnvelopeItem", 0, function(e) {
        return [{
            type: "span"
        }, e]
    }, "envelopeContainsItemType", 0, function(e, t) {
        return c(e, (e, n) => t.includes(n))
    }, "envelopeItemTypeToDataCategory", 0, function(e) {
        return e in p ? p[e] : e
    }, "forEachEnvelopeItem", 0, c, "getSdkMetadataForEnvelopeHeader", 0, function(e) {
        if (!e?.sdk) return;
        let {
            name: t,
            version: n
        } = e.sdk;
        return {
            name: t,
            version: n
        }
    }, "parseEnvelope", 0, function(e) {
        let n = "string" == typeof e ? u(e) : e;

        function r(e) {
            let t = n.subarray(0, e);
            return n = n.subarray(e + 1), t
        }

        function i() {
            var e;
            let i, a = n.indexOf(10);
            return a < 0 && (a = n.length), JSON.parse((e = r(a), (i = (0, t.getSentryCarrier)(o.GLOBAL_OBJ)).decodePolyfill ? i.decodePolyfill(e) : new TextDecoder().decode(e)))
        }
        let a = i(),
            s = [];
        for (; n.length;) {
            let e = i(),
                t = "number" == typeof e.length ? e.length : void 0;
            s.push([e, t ? r(t) : i()])
        }
        return [a, s]
    }, "serializeEnvelope", 0, function(e) {
        let [t, n] = e, r = JSON.stringify(t);

        function i(e) {
            "string" == typeof r ? r = "string" == typeof e ? r + e : [u(r), e] : r.push("string" == typeof e ? u(e) : e)
        }
        for (let e of n) {
            let [t, n] = e;
            if (i(`
${JSON.stringify(t)}
`), "string" == typeof n || n instanceof Uint8Array) i(n);
            else {
                let e;
                try {
                    e = JSON.stringify(n)
                } catch {
                    e = JSON.stringify(s(n))
                }
                i(e)
            }
        }
        return "string" == typeof r ? r : function(e) {
            let t = new Uint8Array(e.reduce((e, t) => e + t.length, 0)),
                n = 0;
            for (let r of e) t.set(r, n), n += r.length;
            return t
        }(r)
    }], 227668)
}, 58833, e => {
    "use strict";
    let t;
    var n = e.i(204078);

    function r(e) {
        if (void 0 !== t) return t ? t(e) : e();
        let r = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__"),
            i = n.GLOBAL_OBJ;
        return r in i && "function" == typeof i[r] ? (t = i[r])(e) : (t = null, e())
    }
    e.s(["safeDateNow", 0, function() {
        return r(() => Date.now())
    }, "safeMathRandom", 0, function() {
        return r(() => Math.random())
    }, "withRandomSafeContext", 0, r])
}, 420546, 403770, 483e3, 557156, 271693, 626471, 135119, 867058, 120953, 981964, 454181, 499678, 587628, 220325, 658675, 672806, 121482, 295446, 174932, 737996, e => {
    "use strict";
    let t, n, r;
    var i = e.i(10955),
        a = e.i(131810),
        s = e.i(211429),
        o = e.i(58833),
        c = e.i(59172),
        u = e.i(140332);

    function p(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        return "string" != typeof e || 0 === t || e.length <= t ? e : `${e.slice(0,t)}...`
    }

    function l(e, t) {
        let n = e,
            r = n.length;
        if (r <= 150) return n;
        t > r && (t = r);
        let i = Math.max(t - 60, 0);
        i < 5 && (i = 0);
        let a = Math.min(i + 140, r);
        return a > r - 5 && (a = r), a === r && (i = Math.max(a - 140, 0)), n = n.slice(i, a), i > 0 && (n = `'{snip} ${n}`), a < r && (n += " {snip}"), n
    }

    function d(e, t) {
        let n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        return !!(0, c.isString)(e) && ((0, c.isRegExp)(t) ? t.test(e) : (0, c.isString)(t) ? n ? e === t : e.includes(t) : "function" == typeof t && t(e))
    }
    e.s(["isMatchingPattern", 0, d, "safeJoin", 0, function(e, t) {
        if (!Array.isArray(e)) return "";
        let n = [];
        for (let t = 0; t < e.length; t++) {
            let r = e[t];
            try {
                (0, c.isVueViewModel)(r) ? n.push((0, u.getVueInternalName)(r)): n.push(String(r))
            } catch {
                n.push("[value cannot be serialized]")
            }
        }
        return n.join(t)
    }, "snipLine", 0, l, "stringMatchesSomePattern", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
        return t.some(t => d(e, t, n))
    }, "truncate", 0, p], 403770);
    var _ = e.i(204078);

    function g() {
        let e, n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : (e = _.GLOBAL_OBJ).crypto || e.msCrypto;
        try {
            if (n?.randomUUID) return (0, o.withRandomSafeContext)(() => n.randomUUID()).replace(/-/g, "")
        } catch {}
        return t || (t = "10000000100040008000100000000000"), t.replace(/[018]/g, e => (e ^ (15 & 16 * (0, o.safeMathRandom)()) >> e / 4).toString(16))
    }

    function S(e) {
        return e.exception?.values?.[0]
    }

    function f(e) {
        try {
            return e.__sentry_captured__
        } catch {}
    }

    function h() {
        return (0, o.safeDateNow)() / 1e3
    }

    function m() {
        return (n ?? (n = function() {
            let {
                performance: e
            } = _.GLOBAL_OBJ;
            if (!e?.now || !e.timeOrigin) return h;
            let t = e.timeOrigin;
            return () => (t + (0, o.withRandomSafeContext)(() => e.now())) / 1e3
        }()))()
    }
    e.s(["addContextToFrame", 0, function(e, t) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5;
        if (void 0 === t.lineno) return;
        let r = e.length,
            i = Math.max(Math.min(r - 1, t.lineno - 1), 0);
        t.pre_context = e.slice(Math.max(0, i - n), i).map(e => l(e, 0)), t.context_line = l(e[Math.min(r - 1, i)], t.colno || 0), t.post_context = e.slice(Math.min(i + 1, r), i + 1 + n).map(e => l(e, 0))
    }, "addExceptionMechanism", 0, function(e, t) {
        let n = S(e);
        if (!n) return;
        let r = n.mechanism;
        if (n.mechanism = {
                type: "generic",
                handled: !0,
                ...r,
                ...t
            }, t && "data" in t) {
            let e = {
                ...r?.data,
                ...t.data
            };
            n.mechanism.data = e
        }
    }, "addExceptionTypeValue", 0, function(e, t, n) {
        let r = e.exception = e.exception || {},
            i = r.values = r.values || [],
            a = i[0] = i[0] || {};
        a.value || (a.value = t || ""), a.type || (a.type = n || "Error")
    }, "checkOrSetAlreadyCaught", 0, function(e) {
        if (f(e)) return !0;
        try {
            (0, s.addNonEnumerableProperty)(e, "__sentry_captured__", !0)
        } catch {}
        return !1
    }, "getEventDescription", 0, function(e) {
        let {
            message: t,
            event_id: n
        } = e;
        if (t) return t;
        let r = S(e);
        return r ? r.type && r.value ? `${r.type}: ${r.value}` : r.type || r.value || n || "<unknown>" : n || "<unknown>"
    }, "isAlreadyCaptured", 0, f, "uuid4", 0, g], 483e3);
    let T = null;

    function E(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (t.user && (!e.ipAddress && t.user.ip_address && (e.ipAddress = t.user.ip_address), e.did || t.did || (e.did = t.user.id || t.user.email || t.user.username)), e.timestamp = t.timestamp || m(), t.abnormal_mechanism && (e.abnormal_mechanism = t.abnormal_mechanism), t.ignoreDuration && (e.ignoreDuration = t.ignoreDuration), t.sid && (e.sid = 32 === t.sid.length ? t.sid : g()), void 0 !== t.init && (e.init = t.init), !e.did && t.did && (e.did = `${t.did}`), "number" == typeof t.started && (e.started = t.started), e.ignoreDuration) e.duration = void 0;
        else if ("number" == typeof t.duration) e.duration = t.duration;
        else {
            let t = e.timestamp - e.started;
            e.duration = t >= 0 ? t : 0
        }
        t.release && (e.release = t.release), t.environment && (e.environment = t.environment), !e.ipAddress && t.ipAddress && (e.ipAddress = t.ipAddress), !e.userAgent && t.userAgent && (e.userAgent = t.userAgent), "number" == typeof t.errors && (e.errors = t.errors), t.status && (e.status = t.status)
    }
    e.s(["browserPerformanceTimeOrigin", 0, function() {
        return null === T && (T = function() {
            let {
                performance: e
            } = _.GLOBAL_OBJ;
            if (!e?.now) return;
            let t = (0, o.withRandomSafeContext)(() => e.now()),
                n = (0, o.safeDateNow)(),
                r = e.timeOrigin;
            if ("number" == typeof r && 3e5 > Math.abs(r + t - n)) return r;
            let i = e.timing?.navigationStart;
            return "number" == typeof i && 3e5 > Math.abs(i + t - n) ? i : n - t
        }()), T
    }, "dateTimestampInSeconds", 0, h, "timestampInSeconds", 0, m], 557156), e.s(["closeSession", 0, function(e, t) {
        let n = {};
        t ? n = {
            status: t
        } : "ok" === e.status && (n = {
            status: "exited"
        }), E(e, n)
    }, "makeSession", 0, function(e) {
        let t = m(),
            n = {
                sid: g(),
                init: !0,
                timestamp: t,
                started: t,
                duration: 0,
                status: "ok",
                errors: 0,
                ignoreDuration: !1,
                toJSON: () => {
                    var e;
                    return e = n, {
                        sid: `${e.sid}`,
                        init: e.init,
                        started: new Date(1e3 * e.started).toISOString(),
                        timestamp: new Date(1e3 * e.timestamp).toISOString(),
                        status: e.status,
                        errors: e.errors,
                        did: "number" == typeof e.did || "string" == typeof e.did ? `${e.did}` : void 0,
                        duration: e.duration,
                        abnormal_mechanism: e.abnormal_mechanism,
                        attrs: {
                            release: e.release,
                            environment: e.environment,
                            ip_address: e.ipAddress,
                            user_agent: e.userAgent
                        }
                    }
                }
            };
        return e && E(n, e), n
    }, "updateSession", 0, E], 271693);
    var y = e.i(695524);

    function I(e, t) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 2;
        if (!t || "object" != typeof t || n <= 0) return t;
        if (e && 0 === Object.keys(t).length) return e;
        let r = {
            ...e
        };
        for (let e in t) Object.prototype.hasOwnProperty.call(t, e) && (r[e] = I(r[e], t[e], n - 1));
        return r
    }

    function b() {
        return g()
    }

    function v() {
        return g().substring(16)
    }
    e.s(["merge", 0, I], 626471), e.s(["generateSpanId", 0, v, "generateTraceId", 0, b], 135119);
    let A = "_sentrySpan";

    function N(e, t) {
        t ? (0, s.addNonEnumerableProperty)(e, A, t) : delete e[A]
    }

    function R(e) {
        return e[A]
    }
    e.s(["_getSpanForScope", 0, R, "_setSpanForScope", 0, N], 867058);
    class C {
        clone() {
            let e = new C;
            return e._breadcrumbs = [...this._breadcrumbs], e._tags = {
                ...this._tags
            }, e._attributes = {
                ...this._attributes
            }, e._extra = {
                ...this._extra
            }, e._contexts = {
                ...this._contexts
            }, this._contexts.flags && (e._contexts.flags = {
                values: [...this._contexts.flags.values]
            }), e._user = this._user, e._level = this._level, e._session = this._session, e._transactionName = this._transactionName, e._fingerprint = this._fingerprint, e._eventProcessors = [...this._eventProcessors], e._attachments = [...this._attachments], e._sdkProcessingMetadata = {
                ...this._sdkProcessingMetadata
            }, e._propagationContext = {
                ...this._propagationContext
            }, e._client = this._client, e._lastEventId = this._lastEventId, e._conversationId = this._conversationId, N(e, R(this)), e
        }
        setClient(e) {
            this._client = e
        }
        setLastEventId(e) {
            this._lastEventId = e
        }
        getClient() {
            return this._client
        }
        lastEventId() {
            return this._lastEventId
        }
        addScopeListener(e) {
            this._scopeListeners.push(e)
        }
        addEventProcessor(e) {
            return this._eventProcessors.push(e), this
        }
        setUser(e) {
            return this._user = e || {
                email: void 0,
                id: void 0,
                ip_address: void 0,
                username: void 0
            }, this._session && E(this._session, {
                user: e
            }), this._notifyScopeListeners(), this
        }
        getUser() {
            return this._user
        }
        setConversationId(e) {
            return this._conversationId = e || void 0, this._notifyScopeListeners(), this
        }
        setTags(e) {
            return this._tags = {
                ...this._tags,
                ...e
            }, this._notifyScopeListeners(), this
        }
        setTag(e, t) {
            return this.setTags({
                [e]: t
            })
        }
        setAttributes(e) {
            return this._attributes = {
                ...this._attributes,
                ...e
            }, this._notifyScopeListeners(), this
        }
        setAttribute(e, t) {
            return this.setAttributes({
                [e]: t
            })
        }
        removeAttribute(e) {
            return e in this._attributes && (delete this._attributes[e], this._notifyScopeListeners()), this
        }
        setExtras(e) {
            return this._extra = {
                ...this._extra,
                ...e
            }, this._notifyScopeListeners(), this
        }
        setExtra(e, t) {
            return this._extra = {
                ...this._extra,
                [e]: t
            }, this._notifyScopeListeners(), this
        }
        setFingerprint(e) {
            return this._fingerprint = e, this._notifyScopeListeners(), this
        }
        setLevel(e) {
            return this._level = e, this._notifyScopeListeners(), this
        }
        setTransactionName(e) {
            return this._transactionName = e, this._notifyScopeListeners(), this
        }
        setContext(e, t) {
            return null === t ? delete this._contexts[e] : this._contexts[e] = t, this._notifyScopeListeners(), this
        }
        setSession(e) {
            return e ? this._session = e : delete this._session, this._notifyScopeListeners(), this
        }
        getSession() {
            return this._session
        }
        update(e) {
            if (!e) return this;
            let t = "function" == typeof e ? e(this) : e,
                {
                    tags: n,
                    attributes: r,
                    extra: i,
                    user: a,
                    contexts: s,
                    level: o,
                    fingerprint: u = [],
                    propagationContext: p,
                    conversationId: l
                } = (t instanceof C ? t.getScopeData() : (0, c.isPlainObject)(t) ? e : void 0) || {};
            return this._tags = {
                ...this._tags,
                ...n
            }, this._attributes = {
                ...this._attributes,
                ...r
            }, this._extra = {
                ...this._extra,
                ...i
            }, this._contexts = {
                ...this._contexts,
                ...s
            }, a && Object.keys(a).length && (this._user = a), o && (this._level = o), u.length && (this._fingerprint = u), p && (this._propagationContext = p), l && (this._conversationId = l), this
        }
        clear() {
            return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, N(this, void 0), this._attachments = [], this.setPropagationContext({
                traceId: b(),
                sampleRand: (0, o.safeMathRandom)()
            }), this._notifyScopeListeners(), this
        }
        addBreadcrumb(e, t) {
            let n = "number" == typeof t ? t : 100;
            if (n <= 0) return this;
            let r = {
                timestamp: h(),
                ...e,
                message: e.message ? p(e.message, 2048) : e.message
            };
            return this._breadcrumbs.push(r), this._breadcrumbs.length > n && (this._breadcrumbs = this._breadcrumbs.slice(-n), this._client?.recordDroppedEvent("buffer_overflow", "log_item")), this._notifyScopeListeners(), this
        }
        getLastBreadcrumb() {
            return this._breadcrumbs[this._breadcrumbs.length - 1]
        }
        clearBreadcrumbs() {
            return this._breadcrumbs = [], this._notifyScopeListeners(), this
        }
        addAttachment(e) {
            return this._attachments.push(e), this
        }
        clearAttachments() {
            return this._attachments = [], this
        }
        getScopeData() {
            return {
                breadcrumbs: this._breadcrumbs,
                attachments: this._attachments,
                contexts: this._contexts,
                tags: this._tags,
                attributes: this._attributes,
                extra: this._extra,
                user: this._user,
                level: this._level,
                fingerprint: this._fingerprint || [],
                eventProcessors: this._eventProcessors,
                propagationContext: this._propagationContext,
                sdkProcessingMetadata: this._sdkProcessingMetadata,
                transactionName: this._transactionName,
                span: R(this),
                conversationId: this._conversationId
            }
        }
        setSDKProcessingMetadata(e) {
            return this._sdkProcessingMetadata = I(this._sdkProcessingMetadata, e, 2), this
        }
        setPropagationContext(e) {
            return this._propagationContext = e, this
        }
        getPropagationContext() {
            return this._propagationContext
        }
        captureException(e, t) {
            let n = t?.event_id || g();
            if (!this._client) return a.DEBUG_BUILD && y.debug.warn("No client configured on scope - will not capture exception!"), n;
            let r = Error("Sentry syntheticException");
            return this._client.captureException(e, {
                originalException: e,
                syntheticException: r,
                ...t,
                event_id: n
            }, this), n
        }
        captureMessage(e, t, n) {
            let r = n?.event_id || g();
            if (!this._client) return a.DEBUG_BUILD && y.debug.warn("No client configured on scope - will not capture message!"), r;
            let i = n?.syntheticException ?? Error(e);
            return this._client.captureMessage(e, t, {
                originalException: e,
                syntheticException: i,
                ...n,
                event_id: r
            }, this), r
        }
        captureEvent(e, t) {
            let n = e.event_id || t?.event_id || g();
            return this._client ? this._client.captureEvent(e, {
                ...t,
                event_id: n
            }, this) : a.DEBUG_BUILD && y.debug.warn("No client configured on scope - will not capture event!"), n
        }
        _notifyScopeListeners() {
            this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(e => {
                e(this)
            }), this._notifyingListeners = !1)
        }
        constructor() {
            this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                traceId: b(),
                sampleRand: (0, o.safeMathRandom)()
            }
        }
    }
    e.s(["Scope", 0, C], 120953);
    let O = e => e instanceof Promise && !e[M],
        M = Symbol("chained PromiseLike"),
        U = (e, t, n) => {
            let r = e.then(e => (t(e), e), e => {
                throw n(e), e
            });
            return O(r) && O(e) ? r : x(e, r)
        },
        x = (e, t) => {
            let n = !1;
            for (let r in e) {
                if (r in t) continue;
                n = !0;
                let i = e[r];
                "function" == typeof i ? Object.defineProperty(t, r, {
                    value: function() {
                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                        return i.apply(e, n)
                    },
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[r] = i
            }
            return n && Object.assign(t, {
                [M]: !0
            }), t
        };
    class D {
        withScope(e) {
            let t, n = this._pushScope();
            try {
                t = e(n)
            } catch (e) {
                throw this._popScope(), e
            }
            return (0, c.isThenable)(t) ? U(t, () => this._popScope(), () => this._popScope()) : (this._popScope(), t)
        }
        getClient() {
            return this.getStackTop().client
        }
        getScope() {
            return this.getStackTop().scope
        }
        getIsolationScope() {
            return this._isolationScope
        }
        getStackTop() {
            return this._stack[this._stack.length - 1]
        }
        _pushScope() {
            let e = this.getScope().clone();
            return this._stack.push({
                client: this.getClient(),
                scope: e
            }), e
        }
        _popScope() {
            return !(this._stack.length <= 1) && !!this._stack.pop()
        }
        constructor(e, t) {
            let n, r;
            n = e || new C, r = t || new C, this._stack = [{
                scope: n
            }], this._isolationScope = r
        }
    }

    function B() {
        let e = (0, i.getMainCarrier)(),
            t = (0, i.getSentryCarrier)(e);
        return t.stack = t.stack || new D((0, i.getGlobalSingleton)("defaultCurrentScope", () => new C), (0, i.getGlobalSingleton)("defaultIsolationScope", () => new C))
    }

    function w(e) {
        return B().withScope(e)
    }

    function L(e, t) {
        let n = B();
        return n.withScope(() => (n.getStackTop().scope = e, t(e)))
    }

    function k(e) {
        return B().withScope(() => e(B().getIsolationScope()))
    }

    function P(e) {
        let t = (0, i.getSentryCarrier)(e);
        return t.acs ? t.acs : {
            withIsolationScope: k,
            withScope: w,
            withSetScope: L,
            withSetIsolationScope: (e, t) => k(t),
            getCurrentScope: () => B().getScope(),
            getIsolationScope: () => B().getIsolationScope()
        }
    }

    function $() {
        return P((0, i.getMainCarrier)()).getCurrentScope()
    }

    function G() {
        return $().getClient()
    }
    e.s(["getAsyncContextStrategy", 0, P], 981964), e.s(["getClient", 0, G, "getCurrentScope", 0, $, "getGlobalScope", 0, function() {
        return (0, i.getGlobalSingleton)("globalScope", () => new C)
    }, "getIsolationScope", 0, function() {
        return P((0, i.getMainCarrier)()).getIsolationScope()
    }, "getTraceContextFromScope", 0, function(e) {
        let t = r?.();
        if (t) return {
            trace_id: t.traceId,
            span_id: t.spanId
        };
        let {
            traceId: n,
            parentSpanId: i,
            propagationSpanId: a
        } = e.getPropagationContext(), s = {
            trace_id: n,
            span_id: a || v()
        };
        return i && (s.parent_span_id = i), s
    }, "hasExternalPropagationContext", 0, function() {
        return void 0 !== r
    }, "withIsolationScope", 0, function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let r = P((0, i.getMainCarrier)());
        if (2 === t.length) {
            let [e, n] = t;
            return e ? r.withSetIsolationScope(e, n) : r.withIsolationScope(n)
        }
        return r.withIsolationScope(t[0])
    }, "withScope", 0, function() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let r = P((0, i.getMainCarrier)());
        if (2 === t.length) {
            let [e, n] = t;
            return e ? r.withSetScope(e, n) : r.withScope(n)
        }
        return r.withScope(t[0])
    }], 420546), e.s(["GEN_AI_CONVERSATION_ID_ATTRIBUTE", 0, "gen_ai.conversation.id", "SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME", 0, "sentry.exclusive_time", "SEMANTIC_ATTRIBUTE_HTTP_REQUEST_METHOD", 0, "http.request.method", "SEMANTIC_ATTRIBUTE_PROFILE_ID", 0, "sentry.profile_id", "SEMANTIC_ATTRIBUTE_SENTRY_CUSTOM_SPAN_NAME", 0, "sentry.custom_span_name", "SEMANTIC_ATTRIBUTE_SENTRY_ENVIRONMENT", 0, "sentry.environment", "SEMANTIC_ATTRIBUTE_SENTRY_IDLE_SPAN_FINISH_REASON", 0, "sentry.idle_span_finish_reason", "SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_UNIT", 0, "sentry.measurement_unit", "SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_VALUE", 0, "sentry.measurement_value", "SEMANTIC_ATTRIBUTE_SENTRY_OP", 0, "sentry.op", "SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN", 0, "sentry.origin", "SEMANTIC_ATTRIBUTE_SENTRY_PREVIOUS_TRACE_SAMPLE_RATE", 0, "sentry.previous_trace_sample_rate", "SEMANTIC_ATTRIBUTE_SENTRY_RELEASE", 0, "sentry.release", "SEMANTIC_ATTRIBUTE_SENTRY_SAMPLE_RATE", 0, "sentry.sample_rate", "SEMANTIC_ATTRIBUTE_SENTRY_SDK_NAME", 0, "sentry.sdk.name", "SEMANTIC_ATTRIBUTE_SENTRY_SDK_VERSION", 0, "sentry.sdk.version", "SEMANTIC_ATTRIBUTE_SENTRY_SEGMENT_ID", 0, "sentry.segment.id", "SEMANTIC_ATTRIBUTE_SENTRY_SEGMENT_NAME", 0, "sentry.segment.name", "SEMANTIC_ATTRIBUTE_SENTRY_SOURCE", 0, "sentry.source", "SEMANTIC_ATTRIBUTE_URL_FULL", 0, "url.full", "SEMANTIC_ATTRIBUTE_USER_EMAIL", 0, "user.email", "SEMANTIC_ATTRIBUTE_USER_ID", 0, "user.id", "SEMANTIC_ATTRIBUTE_USER_IP_ADDRESS", 0, "user.ip_address", "SEMANTIC_ATTRIBUTE_USER_USERNAME", 0, "user.name", "SEMANTIC_LINK_ATTRIBUTE_LINK_TYPE", 0, "sentry.link.type"], 454181);
    let j = "sentry-";

    function F(e) {
        if (e && ((0, c.isString)(e) || Array.isArray(e))) return Array.isArray(e) ? e.reduce((e, t) => (Object.entries(Y(t)).forEach(t => {
            let [n, r] = t;
            e[n] = r
        }), e), {}) : Y(e)
    }

    function Y(e) {
        return e.split(",").map(e => {
            let t = e.indexOf("=");
            return -1 === t ? [] : [e.slice(0, t), e.slice(t + 1)].map(e => {
                try {
                    return decodeURIComponent(e.trim())
                } catch {
                    return
                }
            })
        }).reduce((e, t) => {
            let [n, r] = t;
            return n && r && (e[n] = r), e
        }, {})
    }

    function J(e) {
        y.debug.log(`Ignoring span ${e.op} - ${e.description} because it matches \`ignoreSpans\`.`)
    }

    function V(e) {
        return "string" == typeof e ? 2 * e.length : "boolean" == typeof e ? 4 : 8 * ("number" == typeof e)
    }

    function H(e) {
        if (e < 400 && e >= 100) return {
            code: 1
        };
        if (e >= 400 && e < 500) switch (e) {
            case 401:
                return {
                    code: 2, message: "unauthenticated"
                };
            case 403:
                return {
                    code: 2, message: "permission_denied"
                };
            case 404:
                return {
                    code: 2, message: "not_found"
                };
            case 409:
                return {
                    code: 2, message: "already_exists"
                };
            case 413:
                return {
                    code: 2, message: "failed_precondition"
                };
            case 429:
                return {
                    code: 2, message: "resource_exhausted"
                };
            case 499:
                return {
                    code: 2, message: "cancelled"
                };
            default:
                return {
                    code: 2, message: "invalid_argument"
                }
        }
        if (e >= 500 && e < 600) switch (e) {
            case 501:
                return {
                    code: 2, message: "unimplemented"
                };
            case 503:
                return {
                    code: 2, message: "unavailable"
                };
            case 504:
                return {
                    code: 2, message: "deadline_exceeded"
                }
        }
        return {
            code: 2,
            message: "internal_error"
        }
    }
    e.s(["SENTRY_BAGGAGE_KEY_PREFIX", 0, j, "baggageHeaderToDynamicSamplingContext", 0, function(e) {
        let t = F(e);
        if (!t) return;
        let n = Object.entries(t).reduce((e, t) => {
            let [n, r] = t;
            return n.startsWith(j) && (e[n.slice(j.length)] = r), e
        }, {});
        return Object.keys(n).length > 0 ? n : void 0
    }, "dynamicSamplingContextToSentryBaggageHeader", 0, function(e) {
        if (e) {
            var t = Object.entries(e).reduce((e, t) => {
                let [n, r] = t;
                return r && (e[`${j}${n}`] = r), e
            }, {});
            return 0 !== Object.keys(t).length ? Object.entries(t).reduce((e, t, n) => {
                let [r, i] = t, s = `${encodeURIComponent(r)}=${encodeURIComponent(i)}`, o = 0 === n ? s : `${e},${s}`;
                return o.length > 8192 ? (a.DEBUG_BUILD && y.debug.warn(`Not adding key: ${r} with val: ${i} to baggage header due to exceeding baggage size limits.`), e) : o
            }, "") : void 0
        }
    }, "parseBaggageHeader", 0, F], 499678), e.s(["handleCallbackErrors", 0, function(e, t) {
        var n, r, i, a;
        let s, o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : () => {},
            u = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : () => {};
        try {
            s = e()
        } catch (e) {
            throw t(e), o(), e
        }
        return n = s, r = t, i = o, a = u, (0, c.isThenable)(n) ? U(n, e => {
            i(), a(e)
        }, e => {
            r(e), i()
        }) : (i(), a(n), n)
    }], 587628), e.s(["hasSpansEnabled", 0, function(e) {
        if ("boolean" == typeof __SENTRY_TRACING__ && !__SENTRY_TRACING__) return !1;
        let t = e || G()?.getOptions();
        return !!t && (null != t.tracesSampleRate || !!t.tracesSampler)
    }], 220325), e.s(["reparentChildSpans", 0, function(e, t) {
        let n = t.parent_span_id,
            r = t.span_id;
        if (n)
            for (let t of e) t.parent_span_id === r && (t.parent_span_id = n)
    }, "shouldIgnoreSpan", 0, function(e, t) {
        if (!t?.length || !e.description) return !1;
        for (let r of t) {
            var n;
            if ("string" == typeof(n = r) || n instanceof RegExp) {
                if (d(e.description, r)) return a.DEBUG_BUILD && J(e), !0;
                continue
            }
            if (!r.name && !r.op) continue;
            let t = !r.name || d(e.description, r.name),
                i = !r.op || e.op && d(e.op, r.op);
            if (t && i) return a.DEBUG_BUILD && J(e), !0
        }
        return !1
    }], 658675), e.s(["hasSpanStreamingEnabled", 0, function(e) {
        return "stream" === e.getOptions().traceLifecycle
    }], 672806), e.s(["parseSampleRate", 0, function(e) {
        if ("boolean" == typeof e) return Number(e);
        let t = "string" == typeof e ? parseFloat(e) : e;
        if (!("number" != typeof t || isNaN(t)) && !(t < 0) && !(t > 1)) return t
    }], 121482), e.s(["estimateTypedAttributesSizeInBytes", 0, function(e) {
        if (!e) return 0;
        let t = 0;
        for (let [n, r] of Object.entries(e)) {
            t += 2 * n.length, t += 2 * r.type.length, t += (r.unit?.length ?? 0) * 2;
            let e = r.value;
            Array.isArray(e) ? t += V(e[0]) * e.length : (0, c.isPrimitive)(e) ? t += V(e) : t += 100
        }
        return t
    }, "serializeAttributes", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            n = {};
        for (let [r, i] of Object.entries(e ?? {})) {
            let e = function(e, t) {
                let {
                    value: n,
                    unit: r
                } = "object" == typeof e && null != e && !Array.isArray(e) && Object.keys(e).includes("value") ? e : {
                    value: e,
                    unit: void 0
                }, i = function(e) {
                    let t = "string" == typeof e ? "string" : "boolean" == typeof e ? "boolean" : "number" != typeof e || Number.isNaN(e) ? null : Number.isInteger(e) ? "integer" : "double";
                    if (t) return {
                        value: e,
                        type: t
                    }
                }(n), a = r && "string" == typeof r ? {
                    unit: r
                } : {};
                if (i) return {
                    ...i,
                    ...a
                };
                if (!t || "skip-undefined" === t && void 0 === n) return;
                let s = "";
                try {
                    s = JSON.stringify(n) ?? ""
                } catch {}
                return {
                    value: s,
                    type: "string",
                    ...a
                }
            }(i, t);
            e && (n[r] = e)
        }
        return n
    }], 295446), e.s(["SPAN_STATUS_ERROR", 0, 2, "SPAN_STATUS_OK", 0, 1, "SPAN_STATUS_UNSET", 0, 0, "getSpanStatusFromHttpCode", 0, H, "setHttpStatus", 0, function(e, t) {
        e.setAttribute("http.response.status_code", t);
        let n = H(t);
        "unknown_error" !== n.message && e.setStatus(n)
    }], 174932);
    let z = "_sentryScope",
        K = "_sentryIsolationScope";
    e.s(["getCapturedScopesOnSpan", 0, function(e) {
        return {
            scope: e[z],
            isolationScope: function(e) {
                if (e) {
                    if ("object" == typeof e && "deref" in e && "function" == typeof e.deref) try {
                        return e.deref()
                    } catch {
                        return
                    }
                    return e
                }
            }(e[K])
        }
    }, "setCapturedScopesOnSpan", 0, function(e, t, n) {
        e && ((0, s.addNonEnumerableProperty)(e, K, function(e) {
            try {
                let t = _.GLOBAL_OBJ.WeakRef;
                if ("function" == typeof t) return new t(e)
            } catch {}
            return e
        }(n)), (0, s.addNonEnumerableProperty)(e, z, t))
    }], 737996)
}, 950271, 47731, 358984, 901781, 471931, 238132, 486110, 785970, e => {
    "use strict";
    var t = e.i(981964),
        n = e.i(295446),
        r = e.i(10955),
        i = e.i(420546),
        a = e.i(454181),
        s = e.i(174932),
        o = e.i(737996),
        c = e.i(211429),
        u = e.i(135119),
        p = e.i(557156),
        l = e.i(695524),
        d = e.i(499678),
        _ = e.i(551482),
        g = e.i(121482),
        S = e.i(58833);
    let f = RegExp("^[ \\t]*([0-9a-f]{32})?-?([0-9a-f]{16})?-?([01])?[ \\t]*$");

    function h(e) {
        let t;
        if (!e) return;
        let n = e.match(f);
        if (n) return "1" === n[3] ? t = !0 : "0" === n[3] && (t = !1), {
            traceId: n[1],
            parentSampled: t,
            parentSpanId: n[2]
        }
    }

    function m() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : (0, u.generateTraceId)(),
            t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (0, u.generateSpanId)(),
            n = arguments.length > 2 ? arguments[2] : void 0,
            r = "";
        return void 0 !== n && (r = n ? "-1" : "-0"), `${e}-${t}${r}`
    }

    function T() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : (0, u.generateTraceId)(),
            t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (0, u.generateSpanId)(),
            n = arguments.length > 2 ? arguments[2] : void 0;
        return `00-${e}-${t}-${n?"01":"00"}`
    }
    e.s(["TRACEPARENT_REGEXP", 0, f, "extractTraceparentData", 0, h, "generateSentryTraceHeader", 0, m, "generateTraceparentHeader", 0, T, "propagationContextFromHeaders", 0, function(e, t) {
        let n = h(e),
            r = (0, d.baggageHeaderToDynamicSamplingContext)(t);
        if (!n?.traceId) return {
            traceId: (0, u.generateTraceId)(),
            sampleRand: (0, S.safeMathRandom)()
        };
        let i = function(e, t) {
            let n = (0, g.parseSampleRate)(t?.sample_rand);
            if (void 0 !== n) return n;
            let r = (0, g.parseSampleRate)(t?.sample_rate);
            return r && e?.parentSampled !== void 0 ? e.parentSampled ? (0, S.safeMathRandom)() * r : r + (0, S.safeMathRandom)() * (1 - r) : (0, S.safeMathRandom)()
        }(n, r);
        r && (r.sample_rand = i.toString());
        let {
            traceId: a,
            parentSpanId: s,
            parentSampled: o
        } = n;
        return {
            traceId: a,
            parentSpanId: s,
            sampled: o,
            dsc: r || {},
            sampleRand: i
        }
    }, "shouldContinueTrace", 0, function(e, t) {
        let n = (0, _.extractOrgIdFromClient)(e);
        return t && n && t !== n ? (l.debug.log(`Won't continue trace because org IDs don't match (incoming baggage: ${t}, SDK options: ${n})`), !1) : !e.getOptions().strictTraceContinuation || (!t || !!n) && (!!t || !n) || (l.debug.log(`Starting a new trace because strict trace continuation is enabled but one org ID is missing (incoming baggage: ${t}, Sentry client: ${n})`), !1)
    }], 47731);
    var E = e.i(867058);
    let y = !1;

    function I(e) {
        return e && e.length > 0 ? e.map(e => {
            let {
                context: {
                    spanId: t,
                    traceId: n,
                    traceFlags: r,
                    ...i
                },
                attributes: a
            } = e;
            return {
                span_id: t,
                trace_id: n,
                sampled: 1 === r,
                attributes: a,
                ...i
            }
        }) : void 0
    }

    function b(e) {
        return e?.length ? e.map(e => {
            let {
                context: {
                    spanId: t,
                    traceId: n,
                    traceFlags: r
                },
                attributes: i
            } = e;
            return {
                span_id: t,
                trace_id: n,
                sampled: 1 === r,
                attributes: i
            }
        }) : void 0
    }

    function v(e) {
        return "number" == typeof e ? A(e) : Array.isArray(e) ? e[0] + e[1] / 1e9 : e instanceof Date ? A(e.getTime()) : (0, p.timestampInSeconds)()
    }

    function A(e) {
        return e > 0x2540be3ff ? e / 1e3 : e
    }

    function N(e) {
        if (O(e)) return e.getSpanJSON();
        let {
            spanId: t,
            traceId: n
        } = e.spanContext();
        if (C(e)) {
            let {
                attributes: r,
                startTime: i,
                name: s,
                endTime: o,
                status: c,
                links: u
            } = e;
            return {
                span_id: t,
                trace_id: n,
                data: r,
                description: s,
                parent_span_id: R(e),
                start_timestamp: v(i),
                timestamp: v(o) || void 0,
                status: U(c),
                op: r[a.SEMANTIC_ATTRIBUTE_SENTRY_OP],
                origin: r[a.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN],
                links: I(u)
            }
        }
        return {
            span_id: t,
            trace_id: n,
            start_timestamp: 0,
            data: {}
        }
    }

    function R(e) {
        return "parentSpanId" in e ? e.parentSpanId : "parentSpanContext" in e ? e.parentSpanContext?.spanId : void 0
    }

    function C(e) {
        return !!e.attributes && !!e.startTime && !!e.name && !!e.endTime && !!e.status
    }

    function O(e) {
        return "function" == typeof e.getSpanJSON
    }

    function M(e) {
        let {
            traceFlags: t
        } = e.spanContext();
        return 1 === t
    }

    function U(e) {
        if (e && e.code !== s.SPAN_STATUS_UNSET) return e.code === s.SPAN_STATUS_OK ? "ok" : e.message || "internal_error"
    }

    function x(e) {
        return e && e.code !== s.SPAN_STATUS_OK && e.code !== s.SPAN_STATUS_UNSET && "cancelled" !== e.message ? "error" : "ok"
    }
    let D = "_sentryChildSpans",
        B = "_sentryRootSpan",
        w = L;

    function L(e) {
        return e[B] || e
    }
    e.s(["INTERNAL_getSegmentSpan", 0, L, "TRACE_FLAG_NONE", 0, 0, "TRACE_FLAG_SAMPLED", 0, 1, "addChildSpanToSpan", 0, function(e, t) {
        let n = e[B] || e;
        (0, c.addNonEnumerableProperty)(t, B, n), e[D] ? e[D].add(t) : (0, c.addNonEnumerableProperty)(e, D, new Set([t]))
    }, "convertSpanLinksForEnvelope", 0, I, "getActiveSpan", 0, function() {
        let e = (0, r.getMainCarrier)(),
            n = (0, t.getAsyncContextStrategy)(e);
        return n.getActiveSpan ? n.getActiveSpan() : (0, E._getSpanForScope)((0, i.getCurrentScope)())
    }, "getRootSpan", 0, w, "getSimpleStatusMessage", 0, x, "getSpanDescendants", 0, function(e) {
        let t = new Set;
        return ! function e(n) {
            if (!t.has(n) && M(n))
                for (let r of (t.add(n), n[D] ? Array.from(n[D]) : [])) e(r)
        }(e), Array.from(t)
    }, "getStatusMessage", 0, U, "getStreamedSpanLinks", 0, b, "removeChildSpanFromSpan", 0, function(e, t) {
        e[D] && e[D].delete(t)
    }, "showSpanDropWarning", 0, function() {
        y || ((0, l.consoleSandbox)(() => {
            console.warn("[Sentry] Returning null from `beforeSendSpan` is disallowed. To drop certain spans, configure the respective integrations directly or use `ignoreSpans`.")
        }), y = !0)
    }, "spanIsSampled", 0, M, "spanTimeInputToSeconds", 0, v, "spanToJSON", 0, N, "spanToStreamedSpanJSON", 0, function(e) {
        if (O(e)) return e.getStreamedSpanJSON();
        let {
            spanId: t,
            traceId: n
        } = e.spanContext();
        if (C(e)) {
            let {
                attributes: r,
                startTime: i,
                name: a,
                endTime: s,
                status: o,
                links: c
            } = e;
            return {
                name: a,
                span_id: t,
                trace_id: n,
                parent_span_id: R(e),
                start_timestamp: v(i),
                end_timestamp: v(s),
                is_segment: e === L(e),
                status: x(o),
                attributes: r,
                links: b(c)
            }
        }
        return {
            span_id: t,
            trace_id: n,
            start_timestamp: 0,
            name: "",
            end_timestamp: 0,
            status: "ok",
            is_segment: e === L(e)
        }
    }, "spanToTraceContext", 0, function(e) {
        let {
            spanId: t,
            traceId: n,
            isRemote: r
        } = e.spanContext(), i = r ? t : N(e).parent_span_id, a = (0, o.getCapturedScopesOnSpan)(e).scope;
        return {
            parent_span_id: i,
            span_id: r ? a?.getPropagationContext().propagationSpanId || (0, u.generateSpanId)() : t,
            trace_id: n
        }
    }, "spanToTraceHeader", 0, function(e) {
        let {
            traceId: t,
            spanId: n
        } = e.spanContext();
        return m(t, n, M(e))
    }, "spanToTraceparentHeader", 0, function(e) {
        let {
            traceId: t,
            spanId: n
        } = e.spanContext();
        return T(t, n, M(e))
    }, "spanToTransactionTraceContext", 0, function(e) {
        let {
            spanId: t,
            traceId: n
        } = e.spanContext(), {
            data: r,
            op: i,
            parent_span_id: a,
            status: s,
            origin: o,
            links: c
        } = N(e);
        return {
            parent_span_id: a,
            span_id: t,
            trace_id: n,
            data: r,
            op: i,
            status: s,
            origin: o,
            links: c
        }
    }, "streamedSpanJsonToSerializedSpan", 0, function(e) {
        return {
            ...e,
            attributes: (0, n.serializeAttributes)(e.attributes),
            links: e.links?.map(e => ({
                ...e,
                attributes: (0, n.serializeAttributes)(e.attributes)
            }))
        }
    }, "updateSpanName", 0, function(e, t) {
        e.updateName(t), e.setAttributes({
            [a.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: "custom",
            [a.SEMANTIC_ATTRIBUTE_SENTRY_CUSTOM_SPAN_NAME]: t
        })
    }], 950271);
    let k = "production";
    e.s(["DEFAULT_ENVIRONMENT", 0, k], 358984);
    var P = e.i(220325);
    let $ = "_frozenDsc";

    function G(e, t) {
        let n = t.getOptions(),
            {
                publicKey: r
            } = t.getDsn() || {},
            i = {
                environment: n.environment || k,
                release: n.release,
                public_key: r,
                trace_id: e,
                org_id: (0, _.extractOrgIdFromClient)(t)
            };
        return t.emit("createDsc", i), i
    }

    function j(e) {
        let t = (0, i.getClient)();
        if (!t) return {};
        let n = w(e),
            r = N(n),
            s = r.data,
            c = n.spanContext().traceState,
            u = c?.get("sentry.sample_rate") ?? s[a.SEMANTIC_ATTRIBUTE_SENTRY_SAMPLE_RATE] ?? s[a.SEMANTIC_ATTRIBUTE_SENTRY_PREVIOUS_TRACE_SAMPLE_RATE];

        function p(e) {
            return ("number" == typeof u || "string" == typeof u) && (e.sample_rate = `${u}`), e
        }
        let l = n[$];
        if (l) return p(l);
        let _ = c?.get("sentry.dsc"),
            g = _ && (0, d.baggageHeaderToDynamicSamplingContext)(_);
        if (g) return p(g);
        let S = G(e.spanContext().traceId, t),
            f = s[a.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE] ?? s["sentry.span.source"],
            h = r.description;
        return "url" !== f && h && (S.transaction = h), (0, P.hasSpansEnabled)() && (S.sampled = String(M(n)), S.sample_rand = c?.get("sentry.sample_rand") ?? (0, o.getCapturedScopesOnSpan)(n).scope?.getPropagationContext().sampleRand.toString()), p(S), t.emit("createDsc", S, n), S
    }
    e.s(["freezeDscOnSpan", 0, function(e, t) {
        (0, c.addNonEnumerableProperty)(e, $, t)
    }, "getDynamicSamplingContextFromScope", 0, function(e, t) {
        let n = t.getPropagationContext();
        return n.dsc || G(n.traceId, e)
    }, "getDynamicSamplingContextFromSpan", 0, j, "spanToBaggageHeader", 0, function(e) {
        let t = j(e);
        return (0, d.dynamicSamplingContextToSentryBaggageHeader)(t)
    }], 901781);
    var F = e.i(131810);
    e.s(["logSpanEnd", 0, function(e) {
        if (!F.DEBUG_BUILD) return;
        let {
            description: t = "< unknown name >",
            op: n = "< unknown op >"
        } = N(e), {
            spanId: r
        } = e.spanContext(), i = w(e) === e, a = `[Tracing] Finishing "${n}" ${i?"root ":""}span "${t}" with ID ${r}`;
        l.debug.log(a)
    }, "logSpanStart", 0, function(e) {
        if (!F.DEBUG_BUILD) return;
        let {
            description: t = "< unknown name >",
            op: n = "< unknown op >",
            parent_span_id: r
        } = N(e), {
            spanId: i
        } = e.spanContext(), a = M(e), s = w(e), o = s === e, c = `[Tracing] Starting ${a?"sampled":"unsampled"} ${o?"root ":""}span`, u = [`op: ${n}`, `name: ${t}`, `ID: ${i}`];
        if (r && u.push(`parent ID: ${r}`), !o) {
            let {
                op: e,
                description: t
            } = N(s);
            u.push(`root ID: ${s.spanContext().spanId}`), e && u.push(`root op: ${e}`), t && u.push(`root description: ${t}`)
        }
        l.debug.log(`${c}
  ${u.join("\n  ")}`)
    }], 471931), e.s(["sampleSpan", 0, function(e, t, n) {
        let r, i;
        if (!(0, P.hasSpansEnabled)(e)) return [!1];
        "function" == typeof e.tracesSampler ? (r = e.tracesSampler({
            ...t,
            inheritOrSampleWith: e => "number" == typeof t.parentSampleRate ? t.parentSampleRate : "boolean" == typeof t.parentSampled ? Number(t.parentSampled) : e
        }), i = !0) : void 0 !== t.parentSampled ? r = t.parentSampled : void 0 !== e.tracesSampleRate && (r = e.tracesSampleRate, i = !0);
        let a = (0, g.parseSampleRate)(r);
        if (void 0 === a) return F.DEBUG_BUILD && l.debug.warn(`[Tracing] Discarding root span because of invalid sample rate. Sample rate must be a boolean or a number between 0 and 1. Got ${JSON.stringify(r)} of type ${JSON.stringify(typeof r)}.`), [!1];
        if (!a) return F.DEBUG_BUILD && l.debug.log(`[Tracing] Discarding transaction because ${"function"==typeof e.tracesSampler?"tracesSampler returned 0 or false":"a negative sampling decision was inherited or tracesSampleRate is set to 0"}`), [!1, a, i];
        let s = n < a;
        return !s && F.DEBUG_BUILD && l.debug.log(`[Tracing] Discarding transaction because it's not included in the random sample (sampling rate = ${Number(r)})`), [s, a, i]
    }], 238132), e.s(["SentryNonRecordingSpan", 0, class {
        spanContext() {
            return {
                spanId: this._spanId,
                traceId: this._traceId,
                traceFlags: 0
            }
        }
        end(e) {}
        setAttribute(e, t) {
            return this
        }
        setAttributes(e) {
            return this
        }
        setStatus(e) {
            return this
        }
        updateName(e) {
            return this
        }
        isRecording() {
            return !1
        }
        addEvent(e, t, n) {
            return this
        }
        addLink(e) {
            return this
        }
        addLinks(e) {
            return this
        }
        recordException(e, t) {}
        constructor(e = {}) {
            this._traceId = e.traceId || (0, u.generateTraceId)(), this._spanId = e.spanId || (0, u.generateSpanId)(), this.dropReason = e.dropReason
        }
    }], 486110), e.s(["isStreamedBeforeSendSpanCallback", 0, function(e) {
        return !!e && "function" == typeof e && "_streamed" in e && !!e._streamed
    }, "withStreamedSpan", 0, function(e) {
        return (0, c.addNonEnumerableProperty)(e, "_streamed", !0), e
    }], 785970)
}, 459557, 718305, 139436, 950921, e => {
    "use strict";
    var t = e.i(981964),
        n = e.i(10955),
        r = e.i(420546),
        i = e.i(131810),
        a = e.i(454181),
        s = e.i(499678),
        o = e.i(695524),
        c = e.i(587628),
        u = e.i(220325),
        p = e.i(658675),
        l = e.i(672806),
        d = e.i(121482),
        _ = e.i(135119),
        g = e.i(58833),
        S = e.i(867058),
        f = e.i(950271),
        h = e.i(47731),
        m = e.i(901781),
        T = e.i(471931),
        E = e.i(238132),
        y = e.i(486110),
        I = e.i(785970),
        b = e.i(551482),
        v = e.i(227668);

    function A(e, t) {
        let n = (0, m.getDynamicSamplingContextFromSpan)(e[0]),
            r = t?.getDsn(),
            i = t?.getOptions().tunnel,
            a = {
                sent_at: new Date().toISOString(),
                ...!!n.trace_id && !!n.public_key && {
                    trace: n
                },
                ...!!i && r && {
                    dsn: (0, b.dsnToString)(r)
                }
            },
            {
                beforeSendSpan: s,
                ignoreSpans: o
            } = t?.getOptions() || {},
            c = o?.length ? e.filter(e => !(0, p.shouldIgnoreSpan)((0, f.spanToJSON)(e), o)) : e,
            u = e.length - c.length;
        u && t?.recordDroppedEvent("before_send", "span", u);
        let l = s ? e => {
                let t = (0, f.spanToJSON)(e),
                    n = (0, I.isStreamedBeforeSendSpanCallback)(s) ? t : s(t);
                return n || ((0, f.showSpanDropWarning)(), t)
            } : f.spanToJSON,
            d = [];
        for (let e of c) {
            let t = l(e);
            t && d.push((0, v.createSpanEnvelopeItem)(t))
        }
        return (0, v.createEnvelope)(a, d)
    }
    e.s(["createEventEnvelope", 0, function(e, t, n, r) {
        let i = (0, v.getSdkMetadataForEnvelopeHeader)(n),
            a = e.type && "replay_event" !== e.type ? e.type : "event";
        ! function(e, t) {
            if (!t) return;
            let n = e.sdk || {};
            e.sdk = {
                ...n,
                name: n.name || t.name,
                version: n.version || t.version,
                integrations: [...e.sdk?.integrations || [], ...t.integrations || []],
                packages: [...e.sdk?.packages || [], ...t.packages || []],
                settings: e.sdk?.settings || t.settings ? {
                    ...e.sdk?.settings,
                    ...t.settings
                } : void 0
            }
        }(e, n?.sdk);
        let s = (0, v.createEventEnvelopeHeaders)(e, i, r, t);
        delete e.sdkProcessingMetadata;
        let o = [{
            type: a
        }, e];
        return (0, v.createEnvelope)(s, [o])
    }, "createSessionEnvelope", 0, function(e, t, n, r) {
        let i = (0, v.getSdkMetadataForEnvelopeHeader)(n),
            a = {
                sent_at: new Date().toISOString(),
                ...i && {
                    sdk: i
                },
                ...!!r && t && {
                    dsn: (0, b.dsnToString)(t)
                }
            },
            s = "aggregates" in e ? [{
                type: "sessions"
            }, e] : [{
                type: "session"
            }, e.toJSON()];
        return (0, v.createEnvelope)(a, [s])
    }, "createSpanEnvelope", 0, A], 718305);
    var N = e.i(557156);

    function R(e) {
        if (!e || 0 === e.length) return;
        let t = {};
        return e.forEach(e => {
            let n = e.attributes || {},
                r = n[a.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_UNIT],
                i = n[a.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_VALUE];
            "string" == typeof r && "number" == typeof i && (t[e.name] = {
                value: i,
                unit: r
            })
        }), t
    }
    e.s(["setMeasurement", 0, function(e, t, n) {
        let r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : (0, f.getActiveSpan)(),
            s = r && (0, f.getRootSpan)(r);
        s && (i.DEBUG_BUILD && o.debug.log(`[Measurement] Setting measurement on root span: ${e} = ${t} ${n}`), s.addEvent(e, {
            [a.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_VALUE]: t,
            [a.SEMANTIC_ATTRIBUTE_SENTRY_MEASUREMENT_UNIT]: n
        }))
    }, "timedEventsToMeasurements", 0, R], 139436);
    var C = e.i(737996);
    class O {
        addLink(e) {
            return this._links ? this._links.push(e) : this._links = [e], this
        }
        addLinks(e) {
            return this._links ? this._links.push(...e) : this._links = e, this
        }
        recordException(e, t) {}
        spanContext() {
            let {
                _spanId: e,
                _traceId: t,
                _sampled: n
            } = this;
            return {
                spanId: e,
                traceId: t,
                traceFlags: n ? f.TRACE_FLAG_SAMPLED : f.TRACE_FLAG_NONE
            }
        }
        setAttribute(e, t) {
            return void 0 === t ? delete this._attributes[e] : this._attributes[e] = t, this
        }
        setAttributes(e) {
            return Object.keys(e).forEach(t => this.setAttribute(t, e[t])), this
        }
        updateStartTime(e) {
            this._startTime = (0, f.spanTimeInputToSeconds)(e)
        }
        setStatus(e) {
            return this._status = e, this
        }
        updateName(e) {
            return this._name = e, this.setAttribute(a.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE, "custom"), this
        }
        end(e) {
            this._endTime || (this._endTime = (0, f.spanTimeInputToSeconds)(e), (0, T.logSpanEnd)(this), this._onSpanEnded())
        }
        getSpanJSON() {
            return {
                data: this._attributes,
                description: this._name,
                op: this._attributes[a.SEMANTIC_ATTRIBUTE_SENTRY_OP],
                parent_span_id: this._parentSpanId,
                span_id: this._spanId,
                start_timestamp: this._startTime,
                status: (0, f.getStatusMessage)(this._status),
                timestamp: this._endTime,
                trace_id: this._traceId,
                origin: this._attributes[a.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN],
                profile_id: this._attributes[a.SEMANTIC_ATTRIBUTE_PROFILE_ID],
                exclusive_time: this._attributes[a.SEMANTIC_ATTRIBUTE_EXCLUSIVE_TIME],
                measurements: R(this._events),
                is_segment: this._isStandaloneSpan && (0, f.getRootSpan)(this) === this || void 0,
                segment_id: this._isStandaloneSpan ? (0, f.getRootSpan)(this).spanContext().spanId : void 0,
                links: (0, f.convertSpanLinksForEnvelope)(this._links)
            }
        }
        getStreamedSpanJSON() {
            return {
                name: this._name ?? "",
                span_id: this._spanId,
                trace_id: this._traceId,
                parent_span_id: this._parentSpanId,
                start_timestamp: this._startTime,
                end_timestamp: this._endTime ?? this._startTime,
                is_segment: this._isStandaloneSpan || this === (0, f.getRootSpan)(this),
                status: (0, f.getSimpleStatusMessage)(this._status),
                attributes: this._attributes,
                links: (0, f.getStreamedSpanLinks)(this._links)
            }
        }
        isRecording() {
            return !this._endTime && !!this._sampled
        }
        addEvent(e, t, n) {
            i.DEBUG_BUILD && o.debug.log("[Tracing] Adding an event to span:", e);
            let r = M(t) ? t : n || (0, N.timestampInSeconds)(),
                a = M(t) ? {} : t || {},
                s = {
                    name: e,
                    time: (0, f.spanTimeInputToSeconds)(r),
                    attributes: a
                };
            return this._events.push(s), this
        }
        isStandaloneSpan() {
            return !!this._isStandaloneSpan
        }
        _onSpanEnded() {
            let e = (0, r.getClient)();
            if (e && (e.emit("spanEnd", this), this._isStandaloneSpan || e.emit("afterSpanEnd", this)), !(this._isStandaloneSpan || this === (0, f.getRootSpan)(this))) return;
            if (this._isStandaloneSpan) return void(this._sampled ? function(e) {
                let t = (0, r.getClient)();
                if (!t) return;
                let n = e[1];
                n && 0 !== n.length ? t.sendEnvelope(e) : t.recordDroppedEvent("before_send", "span")
            }(A([this], e)) : (i.DEBUG_BUILD && o.debug.log("[Tracing] Discarding standalone span because its trace was not chosen to be sampled."), e && e.recordDroppedEvent("sample_rate", "span")));
            if (e && (0, l.hasSpanStreamingEnabled)(e)) return void e.emit("afterSegmentSpanEnd", this);
            let t = this._convertSpanToTransaction();
            t && ((0, C.getCapturedScopesOnSpan)(this).scope || (0, r.getCurrentScope)()).captureEvent(t)
        }
        _convertSpanToTransaction() {
            if (!U((0, f.spanToJSON)(this))) return;
            this._name || (i.DEBUG_BUILD && o.debug.warn("Transaction has no name, falling back to `<unlabeled transaction>`."), this._name = "<unlabeled transaction>");
            let {
                scope: e,
                isolationScope: t
            } = (0, C.getCapturedScopesOnSpan)(this), n = e?.getScopeData().sdkProcessingMetadata?.normalizedRequest;
            if (!0 !== this._sampled) return;
            let r = (0, f.getSpanDescendants)(this).filter(e => {
                    var t;
                    return e !== this && !((t = e) instanceof O && t.isStandaloneSpan())
                }).map(e => (0, f.spanToJSON)(e)).filter(U),
                s = this._attributes[a.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE];
            delete this._attributes[a.SEMANTIC_ATTRIBUTE_SENTRY_CUSTOM_SPAN_NAME], r.forEach(e => {
                delete e.data[a.SEMANTIC_ATTRIBUTE_SENTRY_CUSTOM_SPAN_NAME]
            });
            let c = {
                    contexts: {
                        trace: (0, f.spanToTransactionTraceContext)(this)
                    },
                    spans: r.length > 1e3 ? r.sort((e, t) => e.start_timestamp - t.start_timestamp).slice(0, 1e3) : r,
                    start_timestamp: this._startTime,
                    timestamp: this._endTime,
                    transaction: this._name,
                    type: "transaction",
                    sdkProcessingMetadata: {
                        capturedSpanScope: e,
                        capturedSpanIsolationScope: t,
                        dynamicSamplingContext: (0, m.getDynamicSamplingContextFromSpan)(this)
                    },
                    request: n,
                    ...s && {
                        transaction_info: {
                            source: s
                        }
                    }
                },
                u = R(this._events);
            return u && Object.keys(u).length && (i.DEBUG_BUILD && o.debug.log("[Measurements] Adding measurements to transaction event", JSON.stringify(u, void 0, 2)), c.measurements = u), c
        }
        constructor(e = {}) {
            this._traceId = e.traceId || (0, _.generateTraceId)(), this._spanId = e.spanId || (0, _.generateSpanId)(), this._startTime = e.startTimestamp || (0, N.timestampInSeconds)(), this._links = e.links, this._attributes = {}, this.setAttributes({
                [a.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "manual",
                [a.SEMANTIC_ATTRIBUTE_SENTRY_OP]: e.op,
                ...e.attributes
            }), this._name = e.name, e.parentSpanId && (this._parentSpanId = e.parentSpanId), "sampled" in e && (this._sampled = e.sampled), e.endTimestamp && (this._endTime = e.endTimestamp), this._events = [], this._isStandaloneSpan = e.isStandalone, this._endTime && this._onSpanEnded()
        }
    }

    function M(e) {
        return e && "number" == typeof e || e instanceof Date || Array.isArray(e)
    }

    function U(e) {
        return !!e.start_timestamp && !!e.timestamp && !!e.span_id && !!e.trace_id
    }
    e.s(["SentrySpan", 0, O], 950921);
    var x = e.i(174932);
    let D = "__SENTRY_SUPPRESS_TRACING__";

    function B(e, t) {
        let n = P();
        return n.withActiveSpan ? n.withActiveSpan(e, t) : (0, r.withScope)(n => ((0, S._setSpanForScope)(n, e || void 0), t(n)))
    }

    function w(e) {
        let t = P();
        return t.startNewTrace ? t.startNewTrace(e) : (0, r.withScope)(t => (t.setPropagationContext({
            traceId: (0, _.generateTraceId)(),
            sampleRand: (0, g.safeMathRandom)()
        }), i.DEBUG_BUILD && o.debug.log(`Starting a new trace with id ${t.getPropagationContext().traceId}`), B(null, e)))
    }

    function L(e) {
        var t, n;
        let i, s, {
            parentSpan: o,
            spanArguments: c,
            forceTransaction: d,
            scope: _
        } = e;
        if (!(0, u.hasSpansEnabled)()) {
            let e = new y.SentryNonRecordingSpan;
            if (d || !o) {
                let t = {
                    sampled: "false",
                    sample_rate: "0",
                    transaction: c.name,
                    ...(0, m.getDynamicSamplingContextFromSpan)(e)
                };
                (0, m.freezeDscOnSpan)(e, t)
            }
            return e
        }
        let g = (0, r.getClient)();
        if (t = g, n = c, i = t?.getOptions().ignoreSpans, t && (0, l.hasSpanStreamingEnabled)(t) && i?.length && (0, p.shouldIgnoreSpan)({
                description: n.name || "",
                op: n.attributes?.[a.SEMANTIC_ATTRIBUTE_SENTRY_OP] || n.op
            }, i)) return Y(_) || g?.recordDroppedEvent("ignored", "span"), new y.SentryNonRecordingSpan({
            dropReason: "ignored",
            traceId: o?.spanContext().traceId ?? _.getPropagationContext().traceId
        });
        let S = (0, r.getIsolationScope)();
        if (o && !d) s = function(e, t, n) {
            let {
                spanId: i,
                traceId: a
            } = e.spanContext(), s = Y(t), o = !s && (0, f.spanIsSampled)(e), c = o ? new O({
                ...n,
                parentSpanId: i,
                traceId: a,
                sampled: o
            }) : new y.SentryNonRecordingSpan({
                traceId: a
            });
            (0, f.addChildSpanToSpan)(e, c);
            let u = (0, r.getClient)();
            return u && ((0, l.hasSpanStreamingEnabled)(u) && c instanceof y.SentryNonRecordingSpan && (e instanceof y.SentryNonRecordingSpan && e.dropReason ? (c.dropReason = e.dropReason, u.recordDroppedEvent(e.dropReason, "span")) : s || (c.dropReason = "sample_rate", u.recordDroppedEvent("sample_rate", "span"))), u.emit("spanStart", c), n.endTimestamp && (u.emit("spanEnd", c), u.emit("afterSpanEnd", c))), c
        }(o, _, c), (0, f.addChildSpanToSpan)(o, s);
        else if (o) {
            let e = (0, m.getDynamicSamplingContextFromSpan)(o),
                {
                    traceId: t,
                    spanId: n
                } = o.spanContext(),
                r = (0, f.spanIsSampled)(o);
            s = $({
                traceId: t,
                parentSpanId: n,
                ...c
            }, _, r), (0, m.freezeDscOnSpan)(s, e)
        } else {
            let {
                traceId: e,
                dsc: t,
                parentSpanId: n,
                sampled: r
            } = {
                ...S.getPropagationContext(),
                ..._.getPropagationContext()
            };
            s = $({
                traceId: e,
                parentSpanId: n,
                ...c
            }, _, r), t && (0, m.freezeDscOnSpan)(s, t)
        }
        return (0, T.logSpanStart)(s), (0, C.setCapturedScopesOnSpan)(s, _, S), s
    }

    function k(e) {
        let t = {
            isStandalone: (e.experimental || {}).standalone,
            ...e
        };
        if (e.startTime) {
            let n = {
                ...t
            };
            return n.startTimestamp = (0, f.spanTimeInputToSeconds)(e.startTime), delete n.startTime, n
        }
        return t
    }

    function P() {
        let e = (0, n.getMainCarrier)();
        return (0, t.getAsyncContextStrategy)(e)
    }

    function $(e, t, n) {
        let s = (0, r.getClient)(),
            c = s?.getOptions() || {},
            {
                name: u = ""
            } = e,
            p = {
                spanAttributes: {
                    ...e.attributes
                },
                spanName: u,
                parentSampled: n
            };
        s?.emit("beforeSampling", p, {
            decision: !1
        });
        let _ = p.parentSampled ?? n,
            g = p.spanAttributes,
            S = t.getPropagationContext(),
            f = Y(t),
            [h, m, T] = f ? [!1] : (0, E.sampleSpan)(c, {
                name: u,
                parentSampled: _,
                attributes: g,
                parentSampleRate: (0, d.parseSampleRate)(S.dsc?.sample_rate)
            }, S.sampleRand),
            y = new O({
                ...e,
                attributes: {
                    [a.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: "custom",
                    [a.SEMANTIC_ATTRIBUTE_SENTRY_SAMPLE_RATE]: void 0 !== m && T ? m : void 0,
                    ...g
                },
                sampled: h
            });
        return h || !s || f || (i.DEBUG_BUILD && o.debug.log("[Tracing] Discarding root span because its trace was not chosen to be sampled."), s.recordDroppedEvent("sample_rate", (0, l.hasSpanStreamingEnabled)(s) ? "span" : "transaction")), s && s.emit("spanStart", y), y
    }

    function G(e, t) {
        if (t) return t;
        if (null === t) return;
        let n = (0, S._getSpanForScope)(e);
        if (!n) return;
        let i = (0, r.getClient)();
        return (i ? i.getOptions() : {}).parentSpanIsAlwaysRootSpan ? (0, f.getRootSpan)(n) : n
    }

    function j(e) {
        return void 0 !== e ? t => B(e, t) : e => e()
    }

    function F(e) {
        return e instanceof y.SentryNonRecordingSpan && "ignored" === e.dropReason
    }

    function Y(e) {
        return !0 === e.getScopeData().sdkProcessingMetadata[D]
    }
    e.s(["continueTrace", 0, (e, i) => {
        let a = (0, n.getMainCarrier)(),
            o = (0, t.getAsyncContextStrategy)(a);
        if (o.continueTrace) return o.continueTrace(e, i);
        let {
            sentryTrace: c,
            baggage: u
        } = e, p = (0, r.getClient)(), l = (0, s.baggageHeaderToDynamicSamplingContext)(u);
        return p && !(0, h.shouldContinueTrace)(p, l?.org_id) ? w(i) : (0, r.withScope)(e => {
            let t = (0, h.propagationContextFromHeaders)(c, u);
            return e.setPropagationContext(t), (0, S._setSpanForScope)(e, void 0), i()
        })
    }, "startInactiveSpan", 0, function(e) {
        let t = P();
        if (t.startInactiveSpan) return t.startInactiveSpan(e);
        let n = k(e),
            {
                forceTransaction: i,
                parentSpan: a
            } = e;
        return (e.scope ? t => (0, r.withScope)(e.scope, t) : void 0 !== a ? e => B(a, e) : e => e())(() => {
            let t = (0, r.getCurrentScope)(),
                s = G(t, a),
                o = (0, r.getClient)();
            return e.onlyIfParent && !s ? (o?.recordDroppedEvent("no_parent_span", "span"), new y.SentryNonRecordingSpan) : L({
                parentSpan: s,
                spanArguments: n,
                forceTransaction: i,
                scope: t
            })
        })
    }, "startNewTrace", 0, w, "startSpan", 0, function(e, t) {
        let n = P();
        if (n.startSpan) return n.startSpan(e, t);
        let i = k(e),
            {
                forceTransaction: a,
                parentSpan: s,
                scope: o
            } = e,
            u = o?.clone();
        return (0, r.withScope)(u, () => j(s)(() => {
            let n = (0, r.getCurrentScope)(),
                o = G(n, s),
                u = (0, r.getClient)(),
                p = e.onlyIfParent && !o,
                l = p ? new y.SentryNonRecordingSpan : L({
                    parentSpan: o,
                    spanArguments: i,
                    forceTransaction: a,
                    scope: n
                });
            return p && u?.recordDroppedEvent("no_parent_span", "span"), F(l) && o || (0, S._setSpanForScope)(n, l), (0, c.handleCallbackErrors)(() => t(l), () => {
                let {
                    status: e
                } = (0, f.spanToJSON)(l);
                l.isRecording() && (!e || "ok" === e) && l.setStatus({
                    code: x.SPAN_STATUS_ERROR,
                    message: "internal_error"
                })
            }, () => {
                l.end()
            })
        }))
    }, "startSpanManual", 0, function(e, t) {
        let n = P();
        if (n.startSpanManual) return n.startSpanManual(e, t);
        let i = k(e),
            {
                forceTransaction: a,
                parentSpan: s,
                scope: o
            } = e,
            u = o?.clone();
        return (0, r.withScope)(u, () => j(s)(() => {
            let n = (0, r.getCurrentScope)(),
                o = G(n, s),
                u = e.onlyIfParent && !o,
                p = u ? new y.SentryNonRecordingSpan : L({
                    parentSpan: o,
                    spanArguments: i,
                    forceTransaction: a,
                    scope: n
                });
            return u && (0, r.getClient)()?.recordDroppedEvent("no_parent_span", "span"), F(p) && o || (0, S._setSpanForScope)(n, p), (0, c.handleCallbackErrors)(() => t(p, () => p.end()), () => {
                let {
                    status: e
                } = (0, f.spanToJSON)(p);
                p.isRecording() && (!e || "ok" === e) && p.setStatus({
                    code: x.SPAN_STATUS_ERROR,
                    message: "internal_error"
                })
            })
        }))
    }, "suppressTracing", 0, function(e) {
        let t = P();
        return t.suppressTracing ? t.suppressTracing(e) : (0, r.withScope)(t => {
            t.setSDKProcessingMetadata({
                [D]: !0
            });
            let n = e();
            return t.setSDKProcessingMetadata({
                [D]: void 0
            }), n
        })
    }, "withActiveSpan", 0, B], 459557)
}]);

//# debugId=405101bf-f507-2c3e-51a8-298b316e11b0
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/01rn.cd4rvvhd.js.map