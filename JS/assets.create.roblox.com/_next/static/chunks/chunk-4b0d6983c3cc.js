;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "963854d0-c24f-6df8-b929-ef8dae04ec1b")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 80768, 127229, t => {
    "use strict";
    var e = t.i(230242),
        n = t.i(777246);
    t.i(220778), t.i(688671), t.i(254944);
    var o = t.i(169533);
    t.i(379705), t.i(228515), t.i(163772), t.i(912583), t.i(361341), t.i(619834), t.i(728441), t.i(489427), t.i(193218);
    let r = /^o(\d+)\./,
        i = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

    function c(t) {
        return {
            protocol: t.protocol,
            publicKey: t.publicKey || "",
            pass: t.pass || "",
            host: t.host,
            port: t.port || "",
            path: t.path || "",
            projectId: t.projectId
        }
    }
    t.s(["dsnToString", 0, function(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
            {
                host: n,
                path: o,
                pass: r,
                port: i,
                projectId: c,
                protocol: a,
                publicKey: s
            } = t;
        return "".concat(a, "://").concat(s).concat(e && r ? ":".concat(r) : "") + "@".concat(n).concat(i ? ":".concat(i) : "", "/").concat(o ? "".concat(o, "/") : o).concat(c)
    }, "extractOrgIdFromClient", 0, function(t) {
        let e, n = t.getOptions(),
            {
                host: o
            } = t.getDsn() || {};
        if (n.orgId) e = String(n.orgId);
        else {
            let t;
            o && (e = null == (t = o.match(r)) ? void 0 : t[1])
        }
        return e
    }, "makeDsn", 0, function(t) {
        let e = "string" == typeof t ? function(t) {
            let e = i.exec(t);
            if (!e) return void(0, o.consoleSandbox)(() => {
                console.error("Invalid Sentry Dsn: ".concat(t))
            });
            let [n, r, a = "", s = "", l = "", p = ""] = e.slice(1), u = "", d = p, g = d.split("/");
            if (g.length > 1 && (u = g.slice(0, -1).join("/"), d = g.pop()), d) {
                let t = d.match(/^\d+/);
                t && (d = t[0])
            }
            return c({
                host: s,
                pass: a,
                path: u,
                projectId: d,
                port: l,
                protocol: n,
                publicKey: r
            })
        }(t) : c(t);
        if (e && function(t) {
                if (!n.DEBUG_BUILD) return !0;
                let {
                    port: e,
                    projectId: r,
                    protocol: i
                } = t;
                return !["protocol", "publicKey", "host", "projectId"].find(e => !t[e] && (o.debug.error("Invalid Sentry Dsn: ".concat(e, " missing")), !0)) && (r.match(/^\d+$/) ? "http" !== i && "https" !== i ? (o.debug.error("Invalid Sentry Dsn: Invalid protocol ".concat(i)), !1) : !(e && isNaN(parseInt(e, 10))) || (o.debug.error("Invalid Sentry Dsn: Invalid port ".concat(e)), !1) : (o.debug.error("Invalid Sentry Dsn: Invalid projectId ".concat(r)), !1))
            }(e)) return e
    }], 127229), RegExp("^[ \\t]*([0-9a-f]{32})?-?([0-9a-f]{16})?-?([01])?[ \\t]*$"), Symbol.for("sentry.skipNormalization"), Symbol.for("sentry.overrideNormalizationDepth"), t.i(79752), t.i(823979);
    var a = t.i(937463);
    t.i(785041);
    let s = ["user", "level", "extra", "contexts", "tags", "fingerprint", "propagationContext"];
    t.s(["captureException", 0, function(t, n) {
        return (0, e.getCurrentScope)().captureException(t, function(t) {
            if (t) {
                var e;
                return (e = t) instanceof a.Scope || "function" == typeof e || Object.keys(t).some(t => s.includes(t)) ? {
                    captureContext: t
                } : t
            }
        }(n))
    }, "captureMessage", 0, function(t, n) {
        let o = "string" == typeof n ? n : void 0,
            r = "string" != typeof n ? {
                captureContext: n
            } : void 0;
        return (0, e.getCurrentScope)().captureMessage(t, o, r)
    }, "lastEventId", 0, function() {
        return (0, e.getIsolationScope)().lastEventId()
    }, "setTag", 0, function(t, n) {
        (0, e.getIsolationScope)().setTag(t, n)
    }], 80768)
}]);

//# debugId=963854d0-c24f-6df8-b929-ef8dae04ec1b
//# sourceMappingURL=2qrnueqfilb0q.js.map